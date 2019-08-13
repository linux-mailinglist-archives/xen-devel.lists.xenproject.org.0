Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF38ACC5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 04:40:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxMgO-0003gu-Rj; Tue, 13 Aug 2019 02:37:08 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ybWk=WJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hxMgN-0003gi-L8
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 02:37:07 +0000
X-Inumbo-ID: 3cbc8d3a-bd73-11e9-ae8a-5f1516eb8320
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cbc8d3a-bd73-11e9-ae8a-5f1516eb8320;
 Tue, 13 Aug 2019 02:37:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxMgK-0007UO-Bs; Tue, 13 Aug 2019 02:37:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxMgK-0003kV-2F; Tue, 13 Aug 2019 02:37:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hxMgK-0005YC-1f; Tue, 13 Aug 2019 02:37:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hxMgK-0005YC-1f@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Aug 2019 02:37:04 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-arm64-libvirt
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4742455076828804312=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4742455076828804312==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  55c8d1a95f9736641aab15bd7562db7d6890aceb
  Bug not present: 463629559d4e534793e69ad84065ab4babc9c021
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/140039/


  commit 55c8d1a95f9736641aab15bd7562db7d6890aceb
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Tue Jul 23 11:06:27 2019 +0100
  
      remote: handle autoprobing of driver within virtproxyd
      
      The virtproxyd daemon is merely responsible for forwarding RPC calls to
      one of the other per-driver daemons. As such, it does not have any
      drivers loaded and so regular auto-probing logic will not work. We need
      it to be able to handle NULL URIs though, so must implement some kind of
      alternative probing logic.
      
      When running as root this is quite crude. If a per-driver daemon is
      running, its UNIX socket will exist and we can assume it will accept
      connections. If the per-driver daemon is not running, but socket
      autostart is enabled, we again just assume it will accept connections.
      
      The is not great, however, because a default install may well have
      all sockets available for activation. IOW, the virtxend socket may
      exist, despite the fact that the libxl driver will not actually work.
      
      When running as non-root this is slightly easier as we only have two
      drivers, QEMU and VirtualBox. These daemons will likely not be running
      and socket activation won't be used either, as libvirt spawns the
      daemon on demand. So we just check whether the daemon actually is
      installed.
      
      Reviewed-by: Andrea Bolognani <abologna@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/140039.bisection-summary --basis-template=139829 --blessings=real,real-bisect libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 139972 fail [host=laxton1] / 139853 ok.
Failure / basis pass flights: 139972 / 139853
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest e4c05240bf96218a10cd331813327524cb020621 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1a624dd7cf0db5783b27e18e6c790178d14a1e6a dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
Basis pass 6c62122e0615172068a6286428740024f8084264 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 111bbcf87621953dc6ceff09f6c953d33c2689d6 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#6c62122e0615172068a6286428740024f8084264-e4c05240bf96218a10cd331813327524cb020621 https://git.savannah.gnu.org/git/gnulib.git/#c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8-c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#111bbcf87621953dc6ceff09f6c953d33c2689d\
 6-1a624dd7cf0db5783b27e18e6c790178d14a1e6a git://xenbits.xen.org/qemu-xen.git#dbf360567a7da50db4d2f9bde4649aba21aa8106-dbf360567a7da50db4d2f9bde4649aba21aa8106 git://xenbits.xen.org/osstest/seabios.git#30f1e41f04fb4c715d27f987f003cfc31c9ff4f3-30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 git://xenbits.xen.org/xen.git#0a6ad045c5fe5e0463fe32fb8d03b433f58d1841-6c9639a72f0ca3a9430ef75f375877182281fdef
Loaded 3001 nodes in revision graph
Searching for test results:
 139853 pass 6c62122e0615172068a6286428740024f8084264 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 111bbcf87621953dc6ceff09f6c953d33c2689d6 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
 139888 [host=laxton0]
 139925 [host=laxton0]
 139972 fail e4c05240bf96218a10cd331813327524cb020621 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1a624dd7cf0db5783b27e18e6c790178d14a1e6a dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140023 pass 62d817a328405520b88b04b800d589ac63be06d3 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140034 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140035 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140025 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140039 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140027 pass b90e2c39231fa2a5909a6ca36ae64f9856f6a073 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140019 pass 6c62122e0615172068a6286428740024f8084264 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 111bbcf87621953dc6ceff09f6c953d33c2689d6 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
 140036 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140020 fail e4c05240bf96218a10cd331813327524cb020621 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1a624dd7cf0db5783b27e18e6c790178d14a1e6a dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140029 pass 9cc8ecc809cefaf79583ca05da7472fe7e1bfd7c c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140022 pass b900f7387fca1cf3567935c81136579d6bee95ca c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140030 pass 76d5208b216af9f1e65e2f0e7bac16811338900d c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140032 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140037 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
Searching for interesting versions
 Result found: flight 139853 (pass), for basis pass
 Result found: flight 139972 (fail), for basis failure
 Repro found: flight 140019 (pass), for basis pass
 Repro found: flight 140020 (fail), for basis failure
 0 revisions at 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
No revisions left to test, checking graph state.
 Result found: flight 140032 (pass), for last pass
 Result found: flight 140034 (fail), for first failure
 Repro found: flight 140035 (pass), for last pass
 Repro found: flight 140036 (fail), for first failure
 Repro found: flight 140037 (pass), for last pass
 Repro found: flight 140039 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  55c8d1a95f9736641aab15bd7562db7d6890aceb
  Bug not present: 463629559d4e534793e69ad84065ab4babc9c021
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/140039/


  commit 55c8d1a95f9736641aab15bd7562db7d6890aceb
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Tue Jul 23 11:06:27 2019 +0100
  
      remote: handle autoprobing of driver within virtproxyd
      
      The virtproxyd daemon is merely responsible for forwarding RPC calls to
      one of the other per-driver daemons. As such, it does not have any
      drivers loaded and so regular auto-probing logic will not work. We need
      it to be able to handle NULL URIs though, so must implement some kind of
      alternative probing logic.
      
      When running as root this is quite crude. If a per-driver daemon is
      running, its UNIX socket will exist and we can assume it will accept
      connections. If the per-driver daemon is not running, but socket
      autostart is enabled, we again just assume it will accept connections.
      
      The is not great, however, because a default install may well have
      all sockets available for activation. IOW, the virtxend socket may
      exist, despite the fact that the libxl driver will not actually work.
      
      When running as non-root this is slightly easier as we only have two
      drivers, QEMU and VirtualBox. These daemons will likely not be running
      and socket activation won't be used either, as libvirt spawns the
      daemon on demand. So we just check whether the daemon actually is
      installed.
      
      Reviewed-by: Andrea Bolognani <abologna@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
140039: tolerable ALL FAIL

flight 140039 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/140039/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-arm64-libvirt                                          fail    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary



--===============4742455076828804312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4742455076828804312==--
