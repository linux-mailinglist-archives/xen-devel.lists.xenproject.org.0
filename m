Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB3720F1D
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jun 2023 12:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543313.848192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5OC4-0002V1-5g; Sat, 03 Jun 2023 10:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543313.848192; Sat, 03 Jun 2023 10:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5OC4-0002TF-2m; Sat, 03 Jun 2023 10:09:08 +0000
Received: by outflank-mailman (input) for mailman id 543313;
 Sat, 03 Jun 2023 10:09:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q5OC2-0002T5-Fr; Sat, 03 Jun 2023 10:09:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q5OC2-0007U8-6r; Sat, 03 Jun 2023 10:09:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q5OC1-00022l-AQ; Sat, 03 Jun 2023 10:09:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q5OC1-0004kR-9r; Sat, 03 Jun 2023 10:09:05 +0000
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
	bh=evglYNrD/UfPGU020jaLSMz/gAm2jHvDLv1dyYc5Yzk=; b=W8m0CCOdyjZh/DmFoORHXymvt7
	0bSBwg3/hsyq2XQTpPzi0zXPrzGxeJb9Sm1bkU+u8Dy6ZOqmXzVqp7dxaz33P9CWtFbh+w7vUnlz9
	L+zUmxJRKcZ7HTIcV7sLsxXCgP6u8qlSfFiQhua2uCy6j6w07iDDpIaTjs6pUZE0Vd3s=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-libvirt-pair
Message-Id: <E1q5OC1-0004kR-9r@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 03 Jun 2023 10:09:05 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-pair
testid leak-check/check/src_host

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  f6eac904f6825d47adc6102c8d7b59b8ba5b778e
  Bug not present: ab61335025b1274bd7042219203524045b23e0d3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181138/


  commit f6eac904f6825d47adc6102c8d7b59b8ba5b778e
  Author: Stefan Hajnoczi <stefanha@redhat.com>
  Date:   Tue May 16 15:02:29 2023 -0400
  
      xen-block: implement BlockDevOps->drained_begin()
      
      Detach event channels during drained sections to stop I/O submission
      from the ring. xen-block is no longer reliant on aio_disable_external()
      after this patch. This will allow us to remove the
      aio_disable_external() API once all other code that relies on it is
      converted.
      
      Extend xen_device_set_event_channel_context() to allow ctx=NULL. The
      event channel still exists but the event loop does not monitor the file
      descriptor. Event channel processing can resume by calling
      xen_device_set_event_channel_context() with a non-NULL ctx.
      
      Factor out xen_device_set_event_channel_context() calls in
      hw/block/dataplane/xen-block.c into attach/detach helper functions.
      Incidentally, these don't require the AioContext lock because
      aio_set_fd_handler() is thread-safe.
      
      It's safer to register BlockDevOps after the dataplane instance has been
      created. The BlockDevOps .drained_begin/end() callbacks depend on the
      dataplane instance, so move the blk_set_dev_ops() call after
      xen_block_dataplane_create().
      
      Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
      Reviewed-by: Kevin Wolf <kwolf@redhat.com>
      Message-Id: <20230516190238.8401-12-stefanha@redhat.com>
      Signed-off-by: Kevin Wolf <kwolf@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-libvirt-pair.leak-check--check--src_host.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-libvirt-pair.leak-check--check--src_host --summary-out=tmp/181138.bisection-summary --basis-template=180691 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-libvirt-pair leak-check/check/src_host
Searching for failure / basis pass:
 181119 fail [dst_host=nobling0,src_host=nobling1] / 181013 [dst_host=debina1,src_host=debina0] 181006 [dst_host=nobling1,src_host=nobling0] 181003 [dst_host=rimava1,src_host=rimava0] 180996 [dst_host=italia0,src_host=italia1] 180990 [dst_host=huxelrebe1,src_host=huxelrebe0] 180987 [dst_host=fiano1,src_host=fiano0] 180983 [dst_host=godello1,src_host=godello0] 180981 [dst_host=italia1,src_host=italia0] 180977 [dst_host=albana0,src_host=albana1] 180691 [dst_host=godello0,src_host=godello1] 180686 \
 [dst_host=albana1,src_host=albana0] 180673 [dst_host=nocera0,src_host=nocera1] 180659 [dst_host=huxelrebe0,src_host=huxelrebe1] 180643 [dst_host=pinot0,src_host=pinot1] 180637 [dst_host=godello1,src_host=godello0] 180626 [dst_host=rimava0,src_host=rimava1] 180621 ok.
Failure / basis pass flights: 181119 / 180621
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 1c7335add9e28637d8a8b5039f487e5dc6a591c2 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4354c22f38778a2bb4644d1f1f43a47e4313fe42 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a86d7b9ec0adb2f1efce8ab30d9ed2b72db0236e be7e899350caa7b74d8271a34264c3b4aef25ab0 59d0bf62861f5c9b317ccf89f8b5c8b4d19927ad
Basis pass 3d6bc5c61101aadd6fca5d558a44a1cba8120178 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a0e60caf20ab621ee9c1fc66b82b739158c05cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 278238505d28d292927bff7683f39fb4fbca7fd1 ea1b7a0733906b8425d948ae94fba63c32b1d425 31c65549746179e16cf3f82b694b4b1e0b7545ca
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#3d6bc5c61101aadd6fca5d558a44a1cba8120178-1c7335add9e28637d8a8b5039f487e5dc6a591c2 https://gitlab.com/keycodemap/keycodemapdb.git#22b8996dba9041874845c7446ce89ec4ae2b713d-22b8996dba9041874845c7446ce89ec4ae2b713d git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#0a0e60caf20ab621ee9c1fc66b82b739158c05cf-4354c22f38778a2bb4644d1f1f43a47e4313fe42 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#278238505d28d292927bff7683f39fb4fbca7fd1-a86d7b9ec0adb2f1efce8ab30d9ed2b72db0236e git://xenbits.xen.org/osstest/seabios.git#ea1b7a0733906b8425d948ae94fba63c32b\
 1d425-be7e899350caa7b74d8271a34264c3b4aef25ab0 git://xenbits.xen.org/xen.git#31c65549746179e16cf3f82b694b4b1e0b7545ca-59d0bf62861f5c9b317ccf89f8b5c8b4d19927ad
Loaded 279834 nodes in revision graph
Searching for test results:
 180621 pass 3d6bc5c61101aadd6fca5d558a44a1cba8120178 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a0e60caf20ab621ee9c1fc66b82b739158c05cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 278238505d28d292927bff7683f39fb4fbca7fd1 ea1b7a0733906b8425d948ae94fba63c32b1d425 31c65549746179e16cf3f82b694b4b1e0b7545ca
 180626 [dst_host=rimava0,src_host=rimava1]
 180637 [dst_host=godello1,src_host=godello0]
 180643 [dst_host=pinot0,src_host=pinot1]
 180659 [dst_host=huxelrebe0,src_host=huxelrebe1]
 180673 [dst_host=nocera0,src_host=nocera1]
 180686 [dst_host=albana1,src_host=albana0]
 180702 []
 180691 [dst_host=godello0,src_host=godello1]
 180704 []
 180721 []
 180742 []
 180753 []
 180785 []
 180807 []
 180815 []
 180825 []
 180835 []
 180843 []
 180853 []
 180860 []
 180866 []
 180873 []
 180878 []
 180881 []
 180887 []
 180894 []
 180902 []
 180906 []
 180909 []
 180912 []
 180916 []
 180927 []
 180921 []
 180933 []
 180937 []
 180942 []
 180947 []
 180949 []
 180952 []
 180954 []
 180958 []
 180962 []
 180966 []
 180968 []
 180972 []
 180975 []
 180977 [dst_host=albana0,src_host=albana1]
 180981 [dst_host=italia1,src_host=italia0]
 180983 [dst_host=godello1,src_host=godello0]
 180990 [dst_host=huxelrebe1,src_host=huxelrebe0]
 180987 [dst_host=fiano1,src_host=fiano0]
 181003 [dst_host=rimava1,src_host=rimava0]
 180996 [dst_host=italia0,src_host=italia1]
 181006 [dst_host=nobling1,src_host=nobling0]
 181013 [dst_host=debina1,src_host=debina0]
 181021 fail irrelevant
 181042 pass 3d6bc5c61101aadd6fca5d558a44a1cba8120178 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a0e60caf20ab621ee9c1fc66b82b739158c05cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 278238505d28d292927bff7683f39fb4fbca7fd1 ea1b7a0733906b8425d948ae94fba63c32b1d425 31c65549746179e16cf3f82b694b4b1e0b7545ca
 181051 fail irrelevant
 181041 fail irrelevant
 181055 pass irrelevant
 181058 fail irrelevant
 181060 pass e35b5df3f561ea5678a21aa1b39f14308fc6363c 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1034d223f8cc6bf8b9b86c57e564753cdad46f88 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5a4cb61ae1ab0068ab53535ed0ccaf41a5e97d2f be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181062 pass e35b5df3f561ea5678a21aa1b39f14308fc6363c 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1034d223f8cc6bf8b9b86c57e564753cdad46f88 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 56b8bfe9bb6b94184b8bbfc4be9196404a81e450 be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181064 pass 997994b6b1e3b0bfd8597ab67e6eeb676d3d95c6 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9cb47a10564e35df421f9639b0d2cf9e7449544d be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181057 fail irrelevant
 181065 pass a1bdffdd9638601b17a6d115eb148422b66bcea0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7d196e2196d50e0dda0f87f396d4f4a7ad9aafbe be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181067 pass 3d6bc5c61101aadd6fca5d558a44a1cba8120178 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a0e60caf20ab621ee9c1fc66b82b739158c05cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 278238505d28d292927bff7683f39fb4fbca7fd1 ea1b7a0733906b8425d948ae94fba63c32b1d425 31c65549746179e16cf3f82b694b4b1e0b7545ca
 181069 fail irrelevant
 181070 pass irrelevant
 181073 pass a1bdffdd9638601b17a6d115eb148422b66bcea0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b17bbf835c8998e93fd99b06164f1d63843fe8c9 be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181075 pass a8c983d0fa1ba915f7a75deeceb20da1c88fd1db 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b300c134465465385045ab705b68a42699688332 be7e899350caa7b74d8271a34264c3b4aef25ab0 354be8936d97d4f2cb8cc004bb0296826d89bd8d
 181080 pass 3b6d69237f0a07bf8d9807cd68a387f8d42b076f 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c5cf7f69c98baed40754ca4a821cb504fd5423cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ad3387396a71416cacc0b394e5e440dd6e9ba19a be7e899350caa7b74d8271a34264c3b4aef25ab0 c7908869ac26961a3919491705e521179ad3fc0e
 181083 pass 3b6d69237f0a07bf8d9807cd68a387f8d42b076f 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c5cf7f69c98baed40754ca4a821cb504fd5423cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 37246d54d656933035094ed95f2d8e4708058856 be7e899350caa7b74d8271a34264c3b4aef25ab0 c7908869ac26961a3919491705e521179ad3fc0e
 181085 pass 90404c53682f464b4a26efd618887dc336d9da80 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 297e8182194e634baa0cbbfd96d2e09e2a0bcd40 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 181086 pass 5ee27c37e6d0d081714d1e1d25a0a4e472665120 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 91608e2a44f36e79cb83f863b8a7bb57d2c98061 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 181068 fail irrelevant
 181088 pass b10bc8f7ab6f9986ccc54ba04fc5b3bad7576be6 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7d478306e84259678b2941e8af7496ef32a9c4c5 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 181090 pass 3d6bc5c61101aadd6fca5d558a44a1cba8120178 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a0e60caf20ab621ee9c1fc66b82b739158c05cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 278238505d28d292927bff7683f39fb4fbca7fd1 ea1b7a0733906b8425d948ae94fba63c32b1d425 31c65549746179e16cf3f82b694b4b1e0b7545ca
 181092 fail irrelevant
 181094 fail irrelevant
 181096 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7fe6cb68117ac856e03c93d18aca09de015392b0 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181097 pass b10bc8f7ab6f9986ccc54ba04fc5b3bad7576be6 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3d8ff94e59770ec7f5effe509c94246b2cbe9ce0 be7e899350caa7b74d8271a34264c3b4aef25ab0 c8e4bbb5b8ee22fd1591ba6a5a3cef4466dda323
 181099 pass 90404c53682f464b4a26efd618887dc336d9da80 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 146f515110e86aefe3bc2e8eb581ab724614060f be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 181089 fail irrelevant
 181101 pass 96c8d39af007000daf3d5dfa845365f66379aaac 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 886c0453cbf10eebd42a9ccf89c3e46eb389c357 be7e899350caa7b74d8271a34264c3b4aef25ab0 ef1987fcb0fdfaa7ee148024037cb5fa335a7b2d
 181104 fail irrelevant
 181105 fail irrelevant
 181108 pass e35b5df3f561ea5678a21aa1b39f14308fc6363c 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 04c5b3023e49c35d291f41d2c39b4d12a62b8f9c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ac84b57b4d74606f7f83667a0606deef32b2049d be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181110 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 17b69c0fc1462be70419e622b63755a4390bfe31 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181112 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa9bbd865502ed517624ab6fe7d4b5d89ca95e43 be7e899350caa7b74d8271a34264c3b4aef25ab0 352c917acfe1dd6afc2eee44aa4ab7c50d4bc48a
 181114 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2d1962958177cb80a491e4767c41bf6d82dbbc83 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181103 fail irrelevant
 181116 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9998f70f6625f15f2ae36f612509ea34733c11d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181118 pass 3d6bc5c61101aadd6fca5d558a44a1cba8120178 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a0e60caf20ab621ee9c1fc66b82b739158c05cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 278238505d28d292927bff7683f39fb4fbca7fd1 ea1b7a0733906b8425d948ae94fba63c32b1d425 31c65549746179e16cf3f82b694b4b1e0b7545ca
 181120 fail irrelevant
 181121 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f6eac904f6825d47adc6102c8d7b59b8ba5b778e be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181123 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ff82b7835b2fbbd0a17d616f6929601a97a6497d be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181124 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181125 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f6eac904f6825d47adc6102c8d7b59b8ba5b778e be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181128 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181119 fail 1c7335add9e28637d8a8b5039f487e5dc6a591c2 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4354c22f38778a2bb4644d1f1f43a47e4313fe42 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a86d7b9ec0adb2f1efce8ab30d9ed2b72db0236e be7e899350caa7b74d8271a34264c3b4aef25ab0 59d0bf62861f5c9b317ccf89f8b5c8b4d19927ad
 181130 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f6eac904f6825d47adc6102c8d7b59b8ba5b778e be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181132 pass 3d6bc5c61101aadd6fca5d558a44a1cba8120178 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a0e60caf20ab621ee9c1fc66b82b739158c05cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 278238505d28d292927bff7683f39fb4fbca7fd1 ea1b7a0733906b8425d948ae94fba63c32b1d425 31c65549746179e16cf3f82b694b4b1e0b7545ca
 181135 fail 1c7335add9e28637d8a8b5039f487e5dc6a591c2 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4354c22f38778a2bb4644d1f1f43a47e4313fe42 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a86d7b9ec0adb2f1efce8ab30d9ed2b72db0236e be7e899350caa7b74d8271a34264c3b4aef25ab0 59d0bf62861f5c9b317ccf89f8b5c8b4d19927ad
 181136 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181138 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f6eac904f6825d47adc6102c8d7b59b8ba5b778e be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
Searching for interesting versions
 Result found: flight 180621 (pass), for basis pass
 Result found: flight 181119 (fail), for basis failure (at ancestor ~4)
 Repro found: flight 181132 (pass), for basis pass
 Repro found: flight 181135 (fail), for basis failure
 0 revisions at 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
No revisions left to test, checking graph state.
 Result found: flight 181124 (pass), for last pass
 Result found: flight 181125 (fail), for first failure
 Repro found: flight 181128 (pass), for last pass
 Repro found: flight 181130 (fail), for first failure
 Repro found: flight 181136 (pass), for last pass
 Repro found: flight 181138 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  f6eac904f6825d47adc6102c8d7b59b8ba5b778e
  Bug not present: ab61335025b1274bd7042219203524045b23e0d3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181138/


  commit f6eac904f6825d47adc6102c8d7b59b8ba5b778e
  Author: Stefan Hajnoczi <stefanha@redhat.com>
  Date:   Tue May 16 15:02:29 2023 -0400
  
      xen-block: implement BlockDevOps->drained_begin()
      
      Detach event channels during drained sections to stop I/O submission
      from the ring. xen-block is no longer reliant on aio_disable_external()
      after this patch. This will allow us to remove the
      aio_disable_external() API once all other code that relies on it is
      converted.
      
      Extend xen_device_set_event_channel_context() to allow ctx=NULL. The
      event channel still exists but the event loop does not monitor the file
      descriptor. Event channel processing can resume by calling
      xen_device_set_event_channel_context() with a non-NULL ctx.
      
      Factor out xen_device_set_event_channel_context() calls in
      hw/block/dataplane/xen-block.c into attach/detach helper functions.
      Incidentally, these don't require the AioContext lock because
      aio_set_fd_handler() is thread-safe.
      
      It's safer to register BlockDevOps after the dataplane instance has been
      created. The BlockDevOps .drained_begin/end() callbacks depend on the
      dataplane instance, so move the blk_set_dev_ops() call after
      xen_block_dataplane_create().
      
      Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
      Reviewed-by: Kevin Wolf <kwolf@redhat.com>
      Message-Id: <20230516190238.8401-12-stefanha@redhat.com>
      Signed-off-by: Kevin Wolf <kwolf@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.711043 to fit
pnmtopng: 202 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-libvirt-pair.leak-check--check--src_host.{dot,ps,png,html,svg}.
----------------------------------------
181138: tolerable FAIL

flight 181138 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/181138/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair 30 leak-check/check/src_host fail baseline untested
 test-amd64-amd64-libvirt-pair 31 leak-check/check/dst_host fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-pair                                fail    


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


