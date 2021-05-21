Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529FC38D15F
	for <lists+xen-devel@lfdr.de>; Sat, 22 May 2021 00:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131415.245639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkDW9-0004A3-KH; Fri, 21 May 2021 22:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131415.245639; Fri, 21 May 2021 22:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkDW9-000480-Ej; Fri, 21 May 2021 22:21:17 +0000
Received: by outflank-mailman (input) for mailman id 131415;
 Fri, 21 May 2021 22:21:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkDW7-00047q-IT; Fri, 21 May 2021 22:21:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkDW7-0000zt-7n; Fri, 21 May 2021 22:21:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkDW6-0001K3-VO; Fri, 21 May 2021 22:21:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lkDW6-0007XO-Uv; Fri, 21 May 2021 22:21:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=uBCrjOU0QqICds/oCOqgCCRr+wngS9F7rZ39A87lJXU=; b=umEqy1Ko6MmenVQ/ZjSncRUz1H
	vnjeVBfc2jCwu7DldqP74SH05pxvdvRRja9A59TdUfCaFpOZAEaMkjoe5wCiI/7Xm9ybl9hNQJ9GL
	CBZabUdiHk634tPOjIHNUoxlKPmweEeDB9jpSbd2dW8aM5Zv+VRUZyBbAlMKDBZEw6Qw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-qemuu-freebsd11-amd64
Message-Id: <E1lkDW6-0007XO-Uv@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 May 2021 22:21:14 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-freebsd11-amd64
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  1b507e55f8199eaad99744613823f6929e4d57c6
  Bug not present: 4083904bc9fe5da580f7ca397b1e828fbc322732
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160218/


  commit 1b507e55f8199eaad99744613823f6929e4d57c6
  Merge: 4083904bc9 8d17adf34f
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Thu Mar 18 19:00:49 2021 +0000
  
      Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
      
      Remove many old deprecated features
      
      The following features have been deprecated for well over the 2
      release cycle we promise
      
        ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
        ``-vnc acl`` (since 4.0.0)
        ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
        ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
        ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
        ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
        ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
        ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
        ``query-cpus`` (since 2.12.0)
        ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
        ``query-events`` (since 4.0)
        chardev client socket with ``wait`` option (since 4.0)
        ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
        ``ide-drive`` (since 4.2)
        ``scsi-disk`` (since 4.2)
      
      # gpg: Signature made Thu 18 Mar 2021 09:23:39 GMT
      # gpg:                using RSA key DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF
      # gpg: Good signature from "Daniel P. Berrange <dan@berrange.com>" [full]
      # gpg:                 aka "Daniel P. Berrange <berrange@redhat.com>" [full]
      # Primary key fingerprint: DAF3 A6FD B26B 6291 2D0E  8E3F BE86 EBB4 1510 4FDF
      
      * remotes/berrange-gitlab/tags/dep-many-pull-request:
        block: remove support for using "file" driver with block/char devices
        block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
        block: remove dirty bitmaps 'status' field
        block: remove 'encryption_key_missing' flag from QAPI
        hw/scsi: remove 'scsi-disk' device
        hw/ide: remove 'ide-drive' device
        chardev: reject use of 'wait' flag for socket client chardevs
        machine: remove 'arch' field from 'query-cpus-fast' QMP command
        machine: remove 'query-cpus' QMP command
        migrate: remove QMP/HMP commands for speed, downtime and cache size
        monitor: remove 'query-events' QMP command
        monitor: raise error when 'pretty' option is used with HMP
        ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 8d17adf34f501ded65a106572740760f0a75577c
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 11:16:32 2021 +0000
  
      block: remove support for using "file" driver with block/char devices
      
      The 'host_device' and 'host_cdrom' drivers must be used instead.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit e67d8e2928200e24ecb47c7be3ea8270077f2996
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:22:36 2021 +0000
  
      block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
      
      The same data is available in the 'BlockDeviceInfo' struct.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 81cbfd5088690c53541ffd0d74851c8ab055a829
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:19:54 2021 +0000
  
      block: remove dirty bitmaps 'status' field
      
      The same information is available via the 'recording' and 'busy' fields.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit ad1324e044240ae9fcf67e4c215481b7a35591b9
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:53:17 2021 +0000
  
      block: remove 'encryption_key_missing' flag from QAPI
      
      This has been hardcoded to "false" since 2.10.0, since secrets required
      to unlock block devices are now always provided up front instead of using
      interactive prompts.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 879be3af49132d232602e0ca783ec9b4112530fa
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/scsi: remove 'scsi-disk' device
      
      The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit b50101833987b47e0740f1621de48637c468c3d1
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/ide: remove 'ide-drive' device
      
      The 'ide-hd' and 'ide-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 24e13a4dc1eb1630eceffc7ab334145d902e763d
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:47:17 2021 +0000
  
      chardev: reject use of 'wait' flag for socket client chardevs
      
      This only makes sense conceptually when used with listener chardevs.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 445a5b4087567bf4d4ce76d394adf78d9d5c88a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:29:31 2021 +0000
  
      machine: remove 'arch' field from 'query-cpus-fast' QMP command
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 12:54:55 2021 +0000
  
      machine: remove 'query-cpus' QMP command
      
      The newer 'query-cpus-fast' command avoids side effects on the guest
      execution. Note that some of the field names are different in the
      'query-cpus-fast' command.
      
      Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit cbde7be900d2a2279cbc4becb91d1ddd6a014def
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:40:12 2021 +0000
  
      migrate: remove QMP/HMP commands for speed, downtime and cache size
      
      The generic 'migrate_set_parameters' command handle all types of param.
      
      Only the QMP commands were documented in the deprecations page, but the
      rationale for deprecating applies equally to HMP, and the replacements
      exist. Furthermore the HMP commands are just shims to the QMP commands,
      so removing the latter breaks the former unless they get re-implemented.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8becb36063fb14df1e3ae4916215667e2cb65fa2
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:35:15 2021 +0000
  
      monitor: remove 'query-events' QMP command
      
      The code comment suggests removing QAPIEvent_(str|lookup) symbols too,
      however, these are both auto-generated as standard for any enum in
      QAPI. As such it they'll exist whether we use them or not.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 283d845c9164f57f5dba020a4783bb290493802f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:56:13 2021 +0000
  
      monitor: raise error when 'pretty' option is used with HMP
      
      This is only semantically useful for QMP.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 5994dcb8d8525ac044a31913c6bceeee788ec700
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:47:31 2021 +0000
  
      ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      The VNC ACL concept has been replaced by the pluggable "authz" framework
      which does not use monitor commands.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-freebsd11-amd64.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-freebsd11-amd64.guest-saverestore --summary-out=tmp/162117.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-qemuu-freebsd11-amd64 guest-saverestore
Searching for failure / basis pass:
 162112 fail [host=godello0] / 160125 ok.
Failure / basis pass flights: 162112 / 160125
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 15ee7b76891a78141e6e30ef3f8572e8d6b326d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 da9076f323d1470c65634893aa2427987699d4f1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#030ba3097a6e7d08b99f8a9d19a322f61409c1f6-15ee7b76891a78141e6e30ef3f8572e8d6b326d2 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#b12498fc575f2ad30f09fe78badc7fef526e2d76-da9076f323d1470c65634893aa2427987699d4f1 git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee git://xenbits.xen.org/xen.git#21657ad4f01a634beac570c64c0691e51b9cf366-aa77acc28098d04945af998f3fc0dbd3759b5b41
Loaded 44917 nodes in revision graph
Searching for test results:
 160125 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160134 fail irrelevant
 160148 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160157 fail irrelevant
 160158 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3754df04ec291b933c18285210793d02c9d9787a b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160160 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160162 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f7dcd31885cbe801cac95536a279bbc7e55af4f6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160163 pass irrelevant
 160165 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 397fbb5b32558dd2b5cd35cb4d25126879384079 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160147 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2e1293cbaac75e84f541f9acfa8e26749f4c3562 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160166 pass irrelevant
 160168 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2e1293cbaac75e84f541f9acfa8e26749f4c3562 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160169 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f2a9a6c2a86570ccbf8c5c30cbb8bf723168c459 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160174 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 17422da082ffcecb38bd1f2e2de6d56a61e8cd9c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160178 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0f418a207696b37f05d38f978c8873ee0a4f9815 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160181 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1b507e55f8199eaad99744613823f6929e4d57c6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160185 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6e71c36557ed41017e634ae392fa80f03ced7fa1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160190 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 87a80dc4f2f5e51894db143685a5e39c8ce6f651 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160195 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160199 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1b507e55f8199eaad99744613823f6929e4d57c6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160202 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160206 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1b507e55f8199eaad99744613823f6929e4d57c6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160211 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160218 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1b507e55f8199eaad99744613823f6929e4d57c6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160167 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca318882714080fb81fe9eb89a7b7934efc5bfae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160328 fail irrelevant
 160361 fail irrelevant
 160392 fail irrelevant
 160418 fail irrelevant
 160448 fail irrelevant
 160477 fail irrelevant
 160501 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160522 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160541 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ec2e6e016d24bd429792d08cf607e4c5350dcdaa b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160563 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7993b0f83fe5c3f8555e79781d5d098f99751a94 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cead8c0d17462f3a1150b5657d3f4eaa88faf1cb
 160619 fail irrelevant
 160632 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 62bad17dcae18f55cb3bdc19909543dfdf928a2b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 90629587e16e2efdb61da77f25c25fba3c4a5fd7
 160650 fail irrelevant
 160736 fail irrelevant
 160748 fail irrelevant
 160779 fail irrelevant
 160801 fail irrelevant
 160827 fail irrelevant
 160851 fail irrelevant
 160883 fail irrelevant
 160916 fail irrelevant
 160980 fail irrelevant
 161050 fail irrelevant
 161088 fail irrelevant
 161121 fail irrelevant
 161147 fail irrelevant
 161171 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2ad22420a710dc07e3b644f91a5b55c09c39ecf3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 264aa183ad85b2779b27d1312724a291259ccc9f
 161191 fail irrelevant
 161210 fail irrelevant
 161232 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b53173e7cdafb7a318a239d557478fd73734a86a
 161256 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
 161276 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
 161290 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
 161308 fail irrelevant
 161334 fail irrelevant
 161364 fail irrelevant
 161388 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d3b0d007a135284981fa750612a47234b83976f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b1cffefa1b163bce9aebc3416f562c1d3886eeaa b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 9f6cd4983715cb31f0ea540e6bbb63f799a35d8a
 161401 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d3b0d007a135284981fa750612a47234b83976f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b1cffefa1b163bce9aebc3416f562c1d3886eeaa b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aaa3eafb3ba8b544d19ca41cda1477640b22b8fc
 161419 fail irrelevant
 161434 fail irrelevant
 161444 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffa090bc56e73e287a63261e70ac02c0970be61a b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee bea65a212c0581520203b6ad0d07615693f42f73
 161455 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffa090bc56e73e287a63261e70ac02c0970be61a b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee bea65a212c0581520203b6ad0d07615693f42f73
 161472 fail irrelevant
 161481 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5396354b868bd6652600a654bba7df16701ac1cb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0cef06d18762374c94eb4d511717a4735d668a24 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 11e7f0fe72ca0060762d18268e0388731fe8ccb6
 161495 fail irrelevant
 161514 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5b90b8abb4049e2d98040f548ad23b6ab22d5d19 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0cef06d18762374c94eb4d511717a4735d668a24 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 972ba1d1d4bcb77018b50fd2bb63c0e628859ed3
 161540 fail irrelevant
 161554 fail irrelevant
 161571 fail irrelevant
 161587 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1e6b0394d6c001802dc454ecff19076aaa80f51c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8f860d2633baf9c2b6261f703f86e394c6bc22ca b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 1f8ee4cb430e5a9da37096574c41632cf69a0bc7
 161604 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1e6b0394d6c001802dc454ecff19076aaa80f51c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8f860d2633baf9c2b6261f703f86e394c6bc22ca b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 1f8ee4cb430e5a9da37096574c41632cf69a0bc7
 161616 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1e6b0394d6c001802dc454ecff19076aaa80f51c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 53c5433e84e8935abed8e91d4a2eb813168a0ecf b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 1f8ee4cb430e5a9da37096574c41632cf69a0bc7
 161631 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1e6b0394d6c001802dc454ecff19076aaa80f51c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 15106f7dc3290ff3254611f265849a314a93eb0e b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 1f8ee4cb430e5a9da37096574c41632cf69a0bc7
 161766 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e93d8bcf9dbd5b8dd3b9ddbb1ece6a37e608f300 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee d26c277826dbbd64b3e3cb57159e1ecbfad33bc8
 161780 fail irrelevant
 161812 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d45a5270d075ea589f0b0ddcf963a5fea1f500ac b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 8cccd6438e86112ab383e41b433b5a7e73be9621
 161826 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d90f154867ec0ec22fd719164b88716e8fd48672 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 09fc903c5ac042e2e1eb54e58ea7f207ed12ee16
 161839 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d90f154867ec0ec22fd719164b88716e8fd48672 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 09fc903c5ac042e2e1eb54e58ea7f207ed12ee16
 161853 []
 161856 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d90f154867ec0ec22fd719164b88716e8fd48672 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 7a2b787880bddbb3bd68b18efe1d6fe339df6ff1
 161862 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d90f154867ec0ec22fd719164b88716e8fd48672 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 7a2b787880bddbb3bd68b18efe1d6fe339df6ff1
 161876 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d90f154867ec0ec22fd719164b88716e8fd48672 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee a7da84c457b05479ab423a2e589c5f46c7da0ed7
 161886 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d90f154867ec0ec22fd719164b88716e8fd48672 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee a7da84c457b05479ab423a2e589c5f46c7da0ed7
 161890 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d90f154867ec0ec22fd719164b88716e8fd48672 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee a7da84c457b05479ab423a2e589c5f46c7da0ed7
 161896 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 74e31681ba05ed1876818df30c581bc530554fb3 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee a7da84c457b05479ab423a2e589c5f46c7da0ed7
 161907 fail irrelevant
 161915 fail irrelevant
 161924 fail irrelevant
 161938 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5531fd48ded1271b8775725355ab83994e4bc77c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dab59ce031228066eb95a9c518846fcacfb0dbbf b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 43d4cc7d36503bcc3aa2aa6ebea2b7912808f254
 161941 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5531fd48ded1271b8775725355ab83994e4bc77c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dab59ce031228066eb95a9c518846fcacfb0dbbf b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 43d4cc7d36503bcc3aa2aa6ebea2b7912808f254
 161950 fail irrelevant
 161955 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32928415e36b3e234efb5c24143e06060a68fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cb199cc7de987cfda4659fccf51059f210f6ad34
 161961 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32928415e36b3e234efb5c24143e06060a68fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cb199cc7de987cfda4659fccf51059f210f6ad34
 161963 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32928415e36b3e234efb5c24143e06060a68fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cb199cc7de987cfda4659fccf51059f210f6ad34
 161967 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32928415e36b3e234efb5c24143e06060a68fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cb199cc7de987cfda4659fccf51059f210f6ad34
 161971 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32928415e36b3e234efb5c24143e06060a68fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6005ee07c380cbde44292f5f6c96e7daa70f4f7d b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cb199cc7de987cfda4659fccf51059f210f6ad34
 161976 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32928415e36b3e234efb5c24143e06060a68fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6005ee07c380cbde44292f5f6c96e7daa70f4f7d b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cb199cc7de987cfda4659fccf51059f210f6ad34
 161981 fail irrelevant
 161986 fail irrelevant
 162019 fail irrelevant
 162070 fail irrelevant
 162090 fail irrelevant
 162104 fail irrelevant
 162099 fail irrelevant
 162108 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 15ee7b76891a78141e6e30ef3f8572e8d6b326d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 972e848b53970d12cb2ca64687ef8ff797fb6236 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41
 162112 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 15ee7b76891a78141e6e30ef3f8572e8d6b326d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 da9076f323d1470c65634893aa2427987699d4f1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41
 162115 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b12498fc575f2ad30f09fe78badc7fef526e2d76 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 162117 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 15ee7b76891a78141e6e30ef3f8572e8d6b326d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 da9076f323d1470c65634893aa2427987699d4f1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41
Searching for interesting versions
 Result found: flight 160125 (pass), for basis pass
 Result found: flight 162112 (fail), for basis failure
 Repro found: flight 162115 (pass), for basis pass
 Repro found: flight 162117 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
No revisions left to test, checking graph state.
 Result found: flight 160195 (pass), for last pass
 Result found: flight 160199 (fail), for first failure
 Repro found: flight 160202 (pass), for last pass
 Repro found: flight 160206 (fail), for first failure
 Repro found: flight 160211 (pass), for last pass
 Repro found: flight 160218 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  1b507e55f8199eaad99744613823f6929e4d57c6
  Bug not present: 4083904bc9fe5da580f7ca397b1e828fbc322732
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160218/


  commit 1b507e55f8199eaad99744613823f6929e4d57c6
  Merge: 4083904bc9 8d17adf34f
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Thu Mar 18 19:00:49 2021 +0000
  
      Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
      
      Remove many old deprecated features
      
      The following features have been deprecated for well over the 2
      release cycle we promise
      
        ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
        ``-vnc acl`` (since 4.0.0)
        ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
        ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
        ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
        ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
        ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
        ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
        ``query-cpus`` (since 2.12.0)
        ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
        ``query-events`` (since 4.0)
        chardev client socket with ``wait`` option (since 4.0)
        ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
        ``ide-drive`` (since 4.2)
        ``scsi-disk`` (since 4.2)
      
      # gpg: Signature made Thu 18 Mar 2021 09:23:39 GMT
      # gpg:                using RSA key DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF
      # gpg: Good signature from "Daniel P. Berrange <dan@berrange.com>" [full]
      # gpg:                 aka "Daniel P. Berrange <berrange@redhat.com>" [full]
      # Primary key fingerprint: DAF3 A6FD B26B 6291 2D0E  8E3F BE86 EBB4 1510 4FDF
      
      * remotes/berrange-gitlab/tags/dep-many-pull-request:
        block: remove support for using "file" driver with block/char devices
        block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
        block: remove dirty bitmaps 'status' field
        block: remove 'encryption_key_missing' flag from QAPI
        hw/scsi: remove 'scsi-disk' device
        hw/ide: remove 'ide-drive' device
        chardev: reject use of 'wait' flag for socket client chardevs
        machine: remove 'arch' field from 'query-cpus-fast' QMP command
        machine: remove 'query-cpus' QMP command
        migrate: remove QMP/HMP commands for speed, downtime and cache size
        monitor: remove 'query-events' QMP command
        monitor: raise error when 'pretty' option is used with HMP
        ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 8d17adf34f501ded65a106572740760f0a75577c
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 11:16:32 2021 +0000
  
      block: remove support for using "file" driver with block/char devices
      
      The 'host_device' and 'host_cdrom' drivers must be used instead.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit e67d8e2928200e24ecb47c7be3ea8270077f2996
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:22:36 2021 +0000
  
      block: remove 'dirty-bitmaps' field from 'BlockInfo' struct
      
      The same data is available in the 'BlockDeviceInfo' struct.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 81cbfd5088690c53541ffd0d74851c8ab055a829
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 19:19:54 2021 +0000
  
      block: remove dirty bitmaps 'status' field
      
      The same information is available via the 'recording' and 'busy' fields.
      
      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit ad1324e044240ae9fcf67e4c215481b7a35591b9
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:53:17 2021 +0000
  
      block: remove 'encryption_key_missing' flag from QAPI
      
      This has been hardcoded to "false" since 2.10.0, since secrets required
      to unlock block devices are now always provided up front instead of using
      interactive prompts.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 879be3af49132d232602e0ca783ec9b4112530fa
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/scsi: remove 'scsi-disk' device
      
      The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit b50101833987b47e0740f1621de48637c468c3d1
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:40:56 2021 +0000
  
      hw/ide: remove 'ide-drive' device
      
      The 'ide-hd' and 'ide-cd' devices provide suitable alternatives.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 24e13a4dc1eb1630eceffc7ab334145d902e763d
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:47:17 2021 +0000
  
      chardev: reject use of 'wait' flag for socket client chardevs
      
      This only makes sense conceptually when used with listener chardevs.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 445a5b4087567bf4d4ce76d394adf78d9d5c88a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:29:31 2021 +0000
  
      machine: remove 'arch' field from 'query-cpus-fast' QMP command
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 12:54:55 2021 +0000
  
      machine: remove 'query-cpus' QMP command
      
      The newer 'query-cpus-fast' command avoids side effects on the guest
      execution. Note that some of the field names are different in the
      'query-cpus-fast' command.
      
      Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit cbde7be900d2a2279cbc4becb91d1ddd6a014def
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 18:40:12 2021 +0000
  
      migrate: remove QMP/HMP commands for speed, downtime and cache size
      
      The generic 'migrate_set_parameters' command handle all types of param.
      
      Only the QMP commands were documented in the deprecations page, but the
      rationale for deprecating applies equally to HMP, and the replacements
      exist. Furthermore the HMP commands are just shims to the QMP commands,
      so removing the latter breaks the former unless they get re-implemented.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 8becb36063fb14df1e3ae4916215667e2cb65fa2
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 13:35:15 2021 +0000
  
      monitor: remove 'query-events' QMP command
      
      The code comment suggests removing QAPIEvent_(str|lookup) symbols too,
      however, these are both auto-generated as standard for any enum in
      QAPI. As such it they'll exist whether we use them or not.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 283d845c9164f57f5dba020a4783bb290493802f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:56:13 2021 +0000
  
      monitor: raise error when 'pretty' option is used with HMP
      
      This is only semantically useful for QMP.
      
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
  
  commit 5994dcb8d8525ac044a31913c6bceeee788ec700
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Fri Feb 19 17:47:31 2021 +0000
  
      ui, monitor: remove deprecated VNC ACL option and HMP commands
      
      The VNC ACL concept has been replaced by the pluggable "authz" framework
      which does not use monitor commands.
      
      Reviewed-by: Thomas Huth <thuth@redhat.com>
      Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.5025 to fit
pnmtopng: 208 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-freebsd11-amd64.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
162117: tolerable FAIL

flight 162117 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/162117/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-freebsd11-amd64 16 guest-saverestore fail baseline untested


jobs:
 build-amd64                                                  pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    


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


