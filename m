Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8668A6A4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 20:53:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxFOO-00076G-T6; Mon, 12 Aug 2019 18:50:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bBZR=WI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hxFOM-0006st-Rs
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 18:50:02 +0000
X-Inumbo-ID: fd4e6719-bd31-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fd4e6719-bd31-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 18:50:01 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxFOL-0004mk-0F; Mon, 12 Aug 2019 18:50:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hxFOK-0004r8-Or; Mon, 12 Aug 2019 18:50:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hxFOK-0007Zl-OA; Mon, 12 Aug 2019 18:50:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hxFOK-0007Zl-OA@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Aug 2019 18:50:00 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-i386-libvirt
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
Content-Type: multipart/mixed; boundary="===============8330439670701860135=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8330439670701860135==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-i386-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  55c8d1a95f9736641aab15bd7562db7d6890aceb
  Bug not present: 463629559d4e534793e69ad84065ab4babc9c021
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/140014/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build --summary-out=tmp/140014.bisection-summary --basis-template=139829 --blessings=real,real-bisect libvirt build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 139972 fail [host=albana1] / 139853 [host=baroque1] 139829 [host=chardonnay1] 139790 [host=italia1] 139756 [host=huxelrebe1] 139688 [host=huxelrebe1] 139663 [host=huxelrebe0] 139627 [host=debina0] 139585 ok.
Failure / basis pass flights: 139972 / 139585
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest e4c05240bf96218a10cd331813327524cb020621 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1a624dd7cf0db5783b27e18e6c790178d14a1e6a d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
Basis pass b4ab33b90bc2fce87bdcd7aad7669eff3bd79924 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 b3d00df69c78fa0e12986a7ff334689a76f4578a d0d8ad39ecb51cd7497cd524484fe09f50876798 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 22ec7474348fea2c4a32b0872dd3385bf3785a26
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#b4ab33b90bc2fce87bdcd7aad7669eff3bd79924-e4c05240bf96218a10cd331813327524cb020621 https://git.savannah.gnu.org/git/gnulib.git/#8089c00979a5b089cff592c6b91420e595657167-c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#b3d00df69c78fa0e12986a7ff334689a76f4578\
 a-1a624dd7cf0db5783b27e18e6c790178d14a1e6a git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#1bcf484fa9f451cc8c290fe80fd0e764199ca81c-dbf360567a7da50db4d2f9bde4649aba21aa8106 git://xenbits.xen.org/osstest/seabios.git#30f1e41f04fb4c715d27f987f003cfc31c9ff4f3-30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 git://xenbits.xen.org/xen.git#22ec7474348fea2c4a32b0872dd3385bf3785a26-6c9639a72f0ca3a9\
 430ef75f375877182281fdef
From git://cache:9419/git://libvirt.org/libvirt
   8aa75435ff..a60ee91400  master     -> origin/master
Loaded 7233 nodes in revision graph
Searching for test results:
 139585 pass b4ab33b90bc2fce87bdcd7aad7669eff3bd79924 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 b3d00df69c78fa0e12986a7ff334689a76f4578a d0d8ad39ecb51cd7497cd524484fe09f50876798 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 22ec7474348fea2c4a32b0872dd3385bf3785a26
 139627 [host=debina0]
 139663 [host=huxelrebe0]
 139688 [host=huxelrebe1]
 139756 [host=huxelrebe1]
 139790 [host=italia1]
 139829 [host=chardonnay1]
 139853 [host=baroque1]
 139888 fail irrelevant
 139925 fail e4c05240bf96218a10cd331813327524cb020621 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1a624dd7cf0db5783b27e18e6c790178d14a1e6a d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 139965 pass b4ab33b90bc2fce87bdcd7aad7669eff3bd79924 8089c00979a5b089cff592c6b91420e595657167 6280c94f306df6a20bbc100ba15a5a81af0366e6 b3d00df69c78fa0e12986a7ff334689a76f4578a d0d8ad39ecb51cd7497cd524484fe09f50876798 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 22ec7474348fea2c4a32b0872dd3385bf3785a26
 139993 fail 38d2e033686b5cc274f8f55075ce1985b71e329a c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 943c598efdffc9c788ea9b30a20fbbf3c70424cb
 139972 fail e4c05240bf96218a10cd331813327524cb020621 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1a624dd7cf0db5783b27e18e6c790178d14a1e6a d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 139997 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 139970 fail e4c05240bf96218a10cd331813327524cb020621 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1a624dd7cf0db5783b27e18e6c790178d14a1e6a d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 6c9639a72f0ca3a9430ef75f375877182281fdef
 139998 fail 746955690a516ad6d833327c76d4fdac32cea398 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 139976 pass b4ab33b90bc2fce87bdcd7aad7669eff3bd79924 a4b2403aba8d8a8add531abe9b4da5650ef33f4b 6280c94f306df6a20bbc100ba15a5a81af0366e6 b3d00df69c78fa0e12986a7ff334689a76f4578a d0d8ad39ecb51cd7497cd524484fe09f50876798 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 22ec7474348fea2c4a32b0872dd3385bf3785a26
 139978 pass 0366c3a358747feff86ebbd20410c01761092628 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 1821dbed1da616637f5c04fe1f5029016f81bd52 d0d8ad39ecb51cd7497cd524484fe09f50876798 1bcf484fa9f451cc8c290fe80fd0e764199ca81c 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 060f4eee0fb408b316548775ab921e16b7acd0e0
 140010 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140000 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 139983 pass 6c62122e0615172068a6286428740024f8084264 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 b3527dedc3951f061c5a73cb4fb2b0f95f47e08b d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 2c19c7e8bb40c910c0105a08c0e56edd2ea0e5ed
 139988 pass 5d3475c8dc859284b6249b8498e8d157d7bdfd62 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 139990 pass b28fd43a5ec6da82b0ebd3ad46f49ab4d1efb736 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140003 pass 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140014 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
 140006 fail 55c8d1a95f9736641aab15bd7562db7d6890aceb c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
Searching for interesting versions
 Result found: flight 139585 (pass), for basis pass
 Result found: flight 139925 (fail), for basis failure
 Repro found: flight 139965 (pass), for basis pass
 Repro found: flight 139970 (fail), for basis failure
 0 revisions at 463629559d4e534793e69ad84065ab4babc9c021 c8e2eee548e6e81f3fccd31cf9f9a825db7fc8a8 6280c94f306df6a20bbc100ba15a5a81af0366e6 4b1b7c1913092d73d689d8086dcfa579c0217dc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 dbf360567a7da50db4d2f9bde4649aba21aa8106 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 88d703a361d34d75f81fc6d30b31d0abc8aa17eb
No revisions left to test, checking graph state.
 Result found: flight 139997 (pass), for last pass
 Result found: flight 140000 (fail), for first failure
 Repro found: flight 140003 (pass), for last pass
 Repro found: flight 140006 (fail), for first failure
 Repro found: flight 140010 (pass), for last pass
 Repro found: flight 140014 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  55c8d1a95f9736641aab15bd7562db7d6890aceb
  Bug not present: 463629559d4e534793e69ad84065ab4babc9c021
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/140014/


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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.734439 to fit
pnmtopng: 58 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
140014: tolerable ALL FAIL

flight 140014 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/140014/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build           fail baseline untested


jobs:
 build-i386-libvirt                                           fail    


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



--===============8330439670701860135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8330439670701860135==--
