Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582B146B999
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240872.417651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6j-0008Eh-GD; Tue, 07 Dec 2021 10:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240872.417651; Tue, 07 Dec 2021 10:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6j-0008C3-9Q; Tue, 07 Dec 2021 10:54:01 +0000
Received: by outflank-mailman (input) for mailman id 240872;
 Tue, 07 Dec 2021 10:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WjKu=QY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1muY6h-0007ZY-HQ
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:53:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8b108c2-574b-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 11:53:56 +0100 (CET)
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
X-Inumbo-ID: f8b108c2-574b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638874436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2byRJ1vQWOMoPBKyrlzx/lrkEkJCwOz+DlgEQq6J/jc=;
  b=VyV2f2N9ZLH9nNctUffWvH/P4cnXSQSPtrpjcmpqz/wXHB2M1AQtheKZ
   MlI9/67fGIj0jb/Yn9hxYMeGYS5YqvDrJlqKLWf1OUwAv76aXYXUYxojg
   hT5Q1xhe83lTSJi9bsksF3nAJPfcv9hCA/LT025gz5tqB+DQpEg0QhWpW
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SjgV+1EIXTndc5wwZDLnE1QXV7RMPz8J3QzqEXbhPEBvbmfP5ga4M225wi88AV1wP/wjGuP8Wt
 eyl/VU2t2ZsZjbqSHWoOlvg3jklu0fsui37M3R5ddEyNYl5YMndz+fZnpiXt8rbKrhamLxcKrx
 RLFnWdH4fhUkHp6jbex9mzR3vgBc5zOu/F/p2cVwC2VUDyx5gU0ZM1G6iG1kEIPciM0au5kTfW
 X/mARtkZn5nT0h8gS+vFTbwxuAbBlDIkxkGYLSu1aU2SmzcNL5tIVUaJKgiuDPsgYeLWoogJX2
 LN3iRT+sKOZfX21USCJICZoO
X-SBRS: 5.1
X-MesageID: 59384512
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ao9nA6xoLk0Xwx50ZWB6t+cvwSrEfRIJ4+MujC+fZmUNrF6WrkVTx
 zEbWmmHMqmOYGCjc4t+b423pkwPuJXWy9drGgJprSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wbZm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9l6w
 9F/lbrrcxUGF5zBwMA/SQh5Mj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25EVTaqDP
 pBxhTxHMA3sMkFVYHAtVbUcp8Oyv0DaUz9GkQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCnoM/gcNtMTvvirKcs2QDNgDxIYPELabelifCygUqMe/QEE
 V470xsj9YwQ7l2Kb8aoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6lO4QUctJSQId47ZFrHFTGw
 nfMxoq0XmI37NV5XFrEru/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+lC5SLo///ilbwiv95LjsKWJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAt7BeVM/TzHbVHLtl8FSVCxGtamK0vLKSN8N5q2TFF4CLI+i8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDmnpjmDiNHM+jlHxKE9O2PRaodFvMC3PWBshR0U9OiFy9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:HYnqxqnYixU1Awh4s6DFp54SyLnpDfIi3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE7gr5OUtQ/uxoV5PwIk80maQb3WBzB8bHYOCFghrLEGgK1+KLqFeMdxEWntQtrJ
 uIGJIfNDSfNzZHZL7BkWyFL+o=
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="59384512"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86/boot: Cleanup
Date: Tue, 7 Dec 2021 10:53:36 +0000
Message-ID: <20211207105339.28440-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

More cleanup, following on from the __ro_after_init work.

Andrew Cooper (3):
  x86/boot: Drop pte_update_limit from physical relocation logic
  x86/boot: Drop move_memory() and use memcpy() directly
  x86/boot: Don't double-copy the stack during physical relocation

 xen/arch/x86/setup.c | 105 ++++++++++++---------------------------------------
 1 file changed, 25 insertions(+), 80 deletions(-)

-- 
2.11.0


