Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F51F90F77
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2019 10:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hytzu-0007jN-V7; Sat, 17 Aug 2019 08:23:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IgeD=WN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hytzu-0007jD-2U
 for xen-devel@lists.xenproject.org; Sat, 17 Aug 2019 08:23:38 +0000
X-Inumbo-ID: 4e3ba804-c0c8-11e9-a661-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e3ba804-c0c8-11e9-a661-bc764e2007e4;
 Sat, 17 Aug 2019 08:23:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hytzq-0003gQ-Do; Sat, 17 Aug 2019 08:23:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hytzq-0002xn-40; Sat, 17 Aug 2019 08:23:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hytzq-0005yH-0g; Sat, 17 Aug 2019 08:23:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hytzq-0005yH-0g@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Aug 2019 08:23:34 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-armhf-libvirt
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
Content-Type: multipart/mixed; boundary="===============4951141429053941425=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4951141429053941425==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-armhf-libvirt
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/140228/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build --summary-out=tmp/140228.bisection-summary --basis-template=139829 --blessings=real,real-bisect libvirt build-armhf-libvirt libvirt-build
Searching for failure / basis pass:
 140186 fail [host=cubietruck-metzinger] / 139853 [host=cubietruck-braque] 139829 [host=cubietruck-picasso] 139790 [host=cubietruck-picasso] 139756 ok.
Failure / basis pass flights: 140186 / 139756
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 49520e9e7d1c8e309ca71ccc49811fcfc1f26bb7 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 f5892aa8d8bfbe8e6af5c9765faad8cfe877c334 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
Basis pass 0366c3a358747feff86ebbd20410c01761092628 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 aefcf2f78a4800ab64697c7cb334c94b8ea468ae 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#0366c3a358747feff86ebbd20410c01761092628-49520e9e7d1c8e309ca71ccc49811fcfc1f26bb7 https://git.savannah.gnu.org/git/gnulib.git/#8089c00979a5b089cff592c6b91420e595657167-c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#aefcf2f78a4800ab64697c7cb334c94b8ea468a\
 e-f5892aa8d8bfbe8e6af5c9765faad8cfe877c334 git://xenbits.xen.org/qemu-xen.git#1bcf484fa9f451cc8c290fe80fd0e764199ca81c-dbf360567a7da50db4d2f9bde4649aba21aa8106 git://xenbits.xen.org/osstest/seabios.git#30f1e41f04fb4c715d27f987f003cfc31c9ff4f3-30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 git://xenbits.xen.org/xen.git#0a6ad045c5fe5e0463fe32fb8d03b433f58d1841-6c9639a72f0ca3a9430ef75f375877182281fdef
Loaded 7233 nodes in revision graph
Searching for test results:
 139756 pass 0366c3a358747feff86ebbd20410c01761092628 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 aefcf2f78a4800ab64697c7cb334c94b8ea468ae 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
 139790 [host=cubietruck-picasso]
 139829 [host=cubietruck-picasso]
 139853 [host=cubietruck-braque]
 139888 [host=cubietruck-picasso]
 139925 [host=cubietruck-picasso]
 139972 [host=cubietruck-picasso]
 140054 [host=cubietruck-picasso]
 140045 [host=cubietruck-braque]
 140042 [host=cubietruck-picasso]
 140051 [host=cubietruck-picasso]
 140056 [host=cubietruck-braque]
 140062 [host=cubietruck-braque]
 140065 [host=cubietruck-braque]
 140099 [host=cubietruck-braque]
 140070 [host=cubietruck-braque]
 140133 [host=cubietruck-gleizes]
 140154 [host=cubietruck-gleizes]
 140110 [host=cubietruck-braque]
 140076 [host=cubietruck-braque]
 140086 [host=cubietruck-braque]
 140102 [host=cubietruck-braque]
 140092 [host=cubietruck-braque]
 140096 [host=cubietruck-braque]
 140094 [host=cubietruck-gleizes]
 140121 [host=cubietruck-braque]
 140139 [host=cubietruck-gleizes]
 140156 [host=cubietruck-gleizes]
 140147 [host=cubietruck-gleizes]
 140143 [host=cubietruck-gleizes]
 140149 fail e776194ad2501c9dcba8b4d9f1272342cd7f7c41 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 08a54c9e0a3db85d6a9fa7f418a914ea978fecc7 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140157 [host=cubietruck-gleizes]
 140167 fail e776194ad2501c9dcba8b4d9f1272342cd7f7c41 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 08a54c9e0a3db85d6a9fa7f418a914ea978fecc7 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140159 pass 0366c3a358747feff86ebbd20410c01761092628 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 aefcf2f78a4800ab64697c7cb334c94b8ea468ae 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
 140171 pass 0366c3a358747feff86ebbd20410c01761092628 1d56a7919af2bbf9245e9c55cd9458d88887dae6 6280c94f306df6a20bbc100ba15a5a81af0366e6 aefcf2f78a4800ab64697c7cb334c94b8ea468ae 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
 140175 pass 8ee34c4ca8b911a3ac4818fc671a431b01b20719 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 111bbcf87621953dc6ceff09f6c953d33c2689d6 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 5b0807259040d4c92b0cb8f521826789299b1be3
 140183 pass 12e30d1e54b136f185afeb856ff3feeaf929906a c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140185 fail a60ee914009aa7f1a27fc0563337ded08b09247f c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 48d5d6d5e09e5089d1c95c2d0812449e87f4ef7e dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140215 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140189 fail 38d2e033686b5cc274f8f55075ce1985b71e329a c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 e8449e1d8e3b40186eb16ff25242397cffb00a63 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140186 fail 49520e9e7d1c8e309ca71ccc49811fcfc1f26bb7 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 f5892aa8d8bfbe8e6af5c9765faad8cfe877c334 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140199 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140203 pass 0366c3a358747feff86ebbd20410c01761092628 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 aefcf2f78a4800ab64697c7cb334c94b8ea468ae 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 0a6ad045c5fe5e0463fe32fb8d03b433f58d1841
 140218 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140206 fail 49520e9e7d1c8e309ca71ccc49811fcfc1f26bb7 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 f5892aa8d8bfbe8e6af5c9765faad8cfe877c334 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 140209 fail 38d2e033686b5cc274f8f55075ce1985b71e329a c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140211 fail 8b2167493295fe227f93747c422aa984bc13db42 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140225 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140212 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140228 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
Searching for interesting versions
 Result found: flight 139756 (pass), for basis pass
 Result found: flight 140186 (fail), for basis failure
 Repro found: flight 140203 (pass), for basis pass
 Repro found: flight 140206 (fail), for basis failure
 0 revisions at 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
No revisions left to test, checking graph state.
 Result found: flight 140199 (pass), for last pass
 Result found: flight 140212 (fail), for first failure
 Repro found: flight 140215 (pass), for last pass
 Repro found: flight 140218 (fail), for first failure
 Repro found: flight 140225 (pass), for last pass
 Repro found: flight 140228 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  55c8d1a95f9736641aab15bd7562db7d6890aceb
  Bug not present: 463629559d4e534793e69ad84065ab4babc9c021
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/140228/


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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.78835 to fit
pnmtopng: 79 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
140228: tolerable ALL FAIL

flight 140228 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/140228/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-armhf-libvirt                                          fail    


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



--===============4951141429053941425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4951141429053941425==--
