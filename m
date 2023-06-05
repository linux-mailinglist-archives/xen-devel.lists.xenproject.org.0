Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28D87233D3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 01:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543942.849339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6K4F-0002dD-5j; Mon, 05 Jun 2023 23:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543942.849339; Mon, 05 Jun 2023 23:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6K4F-0002aX-23; Mon, 05 Jun 2023 23:56:55 +0000
Received: by outflank-mailman (input) for mailman id 543942;
 Mon, 05 Jun 2023 23:56:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6K4C-0002aN-SP; Mon, 05 Jun 2023 23:56:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6K4C-0001sm-JW; Mon, 05 Jun 2023 23:56:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6K4C-0004gn-7d; Mon, 05 Jun 2023 23:56:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6K4C-0002cS-7B; Mon, 05 Jun 2023 23:56:52 +0000
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
	bh=JFjU24TXeZWrYqHaBFtICZ8DyD613KgHsnDyFyXMlaE=; b=JtmOdrgdeUTb3javVDAK8B2pvU
	brLL56L917VXPsrt13YM3gyqJn+HwrYZN+WBFwPjzszewL6RBDR9QzPnXL0HUi73x46eYwJRe52iw
	moVeKYuI+8innJ+U921SRtu7Mw4DaouSSgIgeBhU392M45cFBcLcZUdRDN21uNSshMyY=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-libvirt
Message-Id: <E1q6K4C-0002cS-7B@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Jun 2023 23:56:52 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt
testid leak-check/check

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181199/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-libvirt.leak-check--check.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt.leak-check--check --summary-out=tmp/181199.bisection-summary --basis-template=180691 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-i386-libvirt leak-check/check
Searching for failure / basis pass:
 181177 fail [host=huxelrebe0] / 181013 [host=debina1] 181006 [host=rimava0] 181003 [host=fiano0] 180996 [host=rimava1] 180990 [host=nobling0] 180987 [host=italia0] 180983 [host=albana0] 180981 [host=huxelrebe1] 180977 [host=nobling1] 180691 [host=nocera1] 180686 [host=elbling0] 180673 [host=pinot0] 180659 ok.
Failure / basis pass flights: 181177 / 180659
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
Latest f26923fb2e49d544ef937cd34e6b0807fed9eb96 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c1dd400a13d1a5e862809c55f6760ba3a944a609 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 848a6caa88b9f082c89c9b41afa975761262981d be7e899350caa7b74d8271a34264c3b4aef25ab0 67fdffef9246c82cecd8db28838ed09e79e2528a
Basis pass 4a681995bc9f0ba5df779c392b7bebf3470a3f9a 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d3225577123767fd09c91201d27e9c91663ae132 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#4a681995bc9f0ba5df779c392b7bebf3470a3f9a-f26923fb2e49d544ef937cd34e6b0807fed9eb96 https://gitlab.com/keycodemap/keycodemapdb.git#22b8996dba9041874845c7446ce89ec4ae2b713d-22b8996dba9041874845c7446ce89ec4ae2b713d git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#d3225577123767fd09c91201d27e9c91663ae132-c1dd400a13d1a5e862809c55f6760ba3a944a609 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#8844bb8d896595ee1d25d21c770e6e6f29803097-848a6caa88b9f082c89c9b41afa975761262981d git://xenbits.xen.org/osstest/seabios.git#ea1b7a0733906b8425d948ae94fba63c32b\
 1d425-be7e899350caa7b74d8271a34264c3b4aef25ab0 git://xenbits.xen.org/xen.git#4c507d8a6b6e8be90881a335b0a66eb28e0f7737-67fdffef9246c82cecd8db28838ed09e79e2528a
Loaded 106105 nodes in revision graph
Searching for test results:
 180659 pass 4a681995bc9f0ba5df779c392b7bebf3470a3f9a 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d3225577123767fd09c91201d27e9c91663ae132 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 180673 [host=pinot0]
 180686 [host=elbling0]
 180702 []
 180691 [host=nocera1]
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
 180977 [host=nobling1]
 180981 [host=huxelrebe1]
 180983 [host=albana0]
 180990 [host=nobling0]
 180987 [host=italia0]
 181003 [host=fiano0]
 180996 [host=rimava1]
 181006 [host=rimava0]
 181013 [host=debina1]
 181021 fail irrelevant
 181041 fail irrelevant
 181057 fail irrelevant
 181068 fail irrelevant
 181089 fail irrelevant
 181103 fail irrelevant
 181119 fail irrelevant
 181131 fail irrelevant
 181142 pass 4a681995bc9f0ba5df779c392b7bebf3470a3f9a 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d3225577123767fd09c91201d27e9c91663ae132 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 181143 fail irrelevant
 181145 fail irrelevant
 181146 fail 1c7335add9e28637d8a8b5039f487e5dc6a591c2 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 41abf00bf98e36830974bd669ab7ec3679bd5e67 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3a8b81f2e6393828589699bb0b8ef557b9ae5937 be7e899350caa7b74d8271a34264c3b4aef25ab0 71226054f28ad98ab214b56a15899e8f62a7bca8
 181148 fail 1c7335add9e28637d8a8b5039f487e5dc6a591c2 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 15f83fa36442eaa272300b31699b3b82ce7e07a9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 367189efae8b53ec2ade37a1c079fd8f69244b9e be7e899350caa7b74d8271a34264c3b4aef25ab0 59d0bf62861f5c9b317ccf89f8b5c8b4d19927ad
 181149 fail c47e17689e3309e544b59f5a9eb7b9d668967787 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9f12d6b6ecf8ffe9cd4d93fe0976fdbaf2ded4f0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c76e7652c786683edcc846ee0a7a65b587787792 be7e899350caa7b74d8271a34264c3b4aef25ab0 dc98fa74446e5abe417e5ba9a6a632b50444cfa1
 181140 fail irrelevant
 181150 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7fe6cb68117ac856e03c93d18aca09de015392b0 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181152 fail irrelevant
 181153 pass e35b5df3f561ea5678a21aa1b39f14308fc6363c 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1034d223f8cc6bf8b9b86c57e564753cdad46f88 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5a4cb61ae1ab0068ab53535ed0ccaf41a5e97d2f be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181155 pass e35b5df3f561ea5678a21aa1b39f14308fc6363c 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1034d223f8cc6bf8b9b86c57e564753cdad46f88 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 56b8bfe9bb6b94184b8bbfc4be9196404a81e450 be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181151 fail f26923fb2e49d544ef937cd34e6b0807fed9eb96 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c1dd400a13d1a5e862809c55f6760ba3a944a609 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 848a6caa88b9f082c89c9b41afa975761262981d be7e899350caa7b74d8271a34264c3b4aef25ab0 67fdffef9246c82cecd8db28838ed09e79e2528a
 181158 pass 997994b6b1e3b0bfd8597ab67e6eeb676d3d95c6 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9cb47a10564e35df421f9639b0d2cf9e7449544d be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181160 pass 4a681995bc9f0ba5df779c392b7bebf3470a3f9a 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d3225577123767fd09c91201d27e9c91663ae132 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 181161 fail f26923fb2e49d544ef937cd34e6b0807fed9eb96 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c1dd400a13d1a5e862809c55f6760ba3a944a609 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 848a6caa88b9f082c89c9b41afa975761262981d be7e899350caa7b74d8271a34264c3b4aef25ab0 67fdffef9246c82cecd8db28838ed09e79e2528a
 181162 pass a1bdffdd9638601b17a6d115eb148422b66bcea0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7d196e2196d50e0dda0f87f396d4f4a7ad9aafbe be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181163 pass a1bdffdd9638601b17a6d115eb148422b66bcea0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b17bbf835c8998e93fd99b06164f1d63843fe8c9 be7e899350caa7b74d8271a34264c3b4aef25ab0 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181165 pass a8c983d0fa1ba915f7a75deeceb20da1c88fd1db 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b300c134465465385045ab705b68a42699688332 be7e899350caa7b74d8271a34264c3b4aef25ab0 354be8936d97d4f2cb8cc004bb0296826d89bd8d
 181159 fail f26923fb2e49d544ef937cd34e6b0807fed9eb96 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c1dd400a13d1a5e862809c55f6760ba3a944a609 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 848a6caa88b9f082c89c9b41afa975761262981d be7e899350caa7b74d8271a34264c3b4aef25ab0 67fdffef9246c82cecd8db28838ed09e79e2528a
 181166 pass 3b6d69237f0a07bf8d9807cd68a387f8d42b076f 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c5cf7f69c98baed40754ca4a821cb504fd5423cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ad3387396a71416cacc0b394e5e440dd6e9ba19a be7e899350caa7b74d8271a34264c3b4aef25ab0 c7908869ac26961a3919491705e521179ad3fc0e
 181169 pass 3b6d69237f0a07bf8d9807cd68a387f8d42b076f 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c5cf7f69c98baed40754ca4a821cb504fd5423cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 37246d54d656933035094ed95f2d8e4708058856 be7e899350caa7b74d8271a34264c3b4aef25ab0 c7908869ac26961a3919491705e521179ad3fc0e
 181170 pass 90404c53682f464b4a26efd618887dc336d9da80 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 297e8182194e634baa0cbbfd96d2e09e2a0bcd40 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 181171 pass 5ee27c37e6d0d081714d1e1d25a0a4e472665120 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 91608e2a44f36e79cb83f863b8a7bb57d2c98061 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 181173 pass b10bc8f7ab6f9986ccc54ba04fc5b3bad7576be6 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7d478306e84259678b2941e8af7496ef32a9c4c5 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 181168 fail f26923fb2e49d544ef937cd34e6b0807fed9eb96 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c1dd400a13d1a5e862809c55f6760ba3a944a609 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 848a6caa88b9f082c89c9b41afa975761262981d be7e899350caa7b74d8271a34264c3b4aef25ab0 67fdffef9246c82cecd8db28838ed09e79e2528a
 181174 pass 90404c53682f464b4a26efd618887dc336d9da80 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d0a14a2ba01c7b200e6ce3e7979e1ed3ede1d5c7 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 181176 pass b4560dc69b70be8fbc4aaa523a8cd21b9955b5a0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ba91d0292e593df8528b66f99c1b0b14fadc8e16 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a3cb6d5004ff638aefe686ecd540718a793bd1b1 be7e899350caa7b74d8271a34264c3b4aef25ab0 354be8936d97d4f2cb8cc004bb0296826d89bd8d
 181179 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4382f167cfbc21a49424e6dd9347681008363128 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181180 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 276d77de503e8f5f5cbd3f7d94302ca12d1d982e be7e899350caa7b74d8271a34264c3b4aef25ab0 94200e1bae07e725cc07238c11569c5cab7befb7
 181181 blocked 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 56ad09ba75bef5f095a1a48e365d65195ba45d10 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 51bdb0b57a2d9e84d6915fbae7b5d76c8820cf3c be7e899350caa7b74d8271a34264c3b4aef25ab0 94200e1bae07e725cc07238c11569c5cab7befb7
 181177 fail f26923fb2e49d544ef937cd34e6b0807fed9eb96 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c1dd400a13d1a5e862809c55f6760ba3a944a609 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 848a6caa88b9f082c89c9b41afa975761262981d be7e899350caa7b74d8271a34264c3b4aef25ab0 67fdffef9246c82cecd8db28838ed09e79e2528a
 181184 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 17b69c0fc1462be70419e622b63755a4390bfe31 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181187 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ff82b7835b2fbbd0a17d616f6929601a97a6497d be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181188 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 fb5cba2c7ee34d3c44e87374f307ebec5673cfe0 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181190 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181193 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f6eac904f6825d47adc6102c8d7b59b8ba5b778e be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181196 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181197 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f6eac904f6825d47adc6102c8d7b59b8ba5b778e be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181198 pass 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
 181199 fail 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f6eac904f6825d47adc6102c8d7b59b8ba5b778e be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
Searching for interesting versions
 Result found: flight 180659 (pass), for basis pass
 Result found: flight 181151 (fail), for basis failure
 Repro found: flight 181160 (pass), for basis pass
 Repro found: flight 181161 (fail), for basis failure
 0 revisions at 9222f35dc6917f00d166be3bb69ac4e5ff8536f0 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f9283429dd487deeeb264ee5670551d596fc208 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab61335025b1274bd7042219203524045b23e0d3 be7e899350caa7b74d8271a34264c3b4aef25ab0 05422d276b56f2ebc2309a84a66fc5722c45ad74
No revisions left to test, checking graph state.
 Result found: flight 181190 (pass), for last pass
 Result found: flight 181193 (fail), for first failure
 Repro found: flight 181196 (pass), for last pass
 Repro found: flight 181197 (fail), for first failure
 Repro found: flight 181198 (pass), for last pass
 Repro found: flight 181199 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  f6eac904f6825d47adc6102c8d7b59b8ba5b778e
  Bug not present: ab61335025b1274bd7042219203524045b23e0d3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181199/


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
pnmtopng: 211 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt.leak-check--check.{dot,ps,png,html,svg}.
----------------------------------------
181199: tolerable FAIL

flight 181199 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/181199/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt      23 leak-check/check        fail baseline untested
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt                                      fail    


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


