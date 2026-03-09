Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CKEFI5srml3EAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABBB23456C
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249071.1546576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUM9-0005Mn-5y; Mon, 09 Mar 2026 06:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249071.1546576; Mon, 09 Mar 2026 06:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUM8-0005KO-Vw; Mon, 09 Mar 2026 06:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1249071;
 Mon, 09 Mar 2026 06:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UF23=BJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vzUM7-0005KI-BW
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 06:44:43 +0000
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [2607:f8b0:4864:20::a2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e510e2-1b83-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 07:44:41 +0100 (CET)
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-56adf76631cso2441445e0c.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 23:44:41 -0700 (PDT)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56b09a0881asm9247726e0c.4.2026.03.08.23.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:44:38 -0700 (PDT)
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
X-Inumbo-ID: 72e510e2-1b83-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773038680; x=1773643480; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhBJGCljjR2vWP5NBGBE3Ox/OrYcaC529yay0waARyQ=;
        b=Le8xFLVt2Ri2TNA3hEy5MQ2U1fZQXAVSgT5Pyu3AcKlHNoBCyyabt2tKpxBzQhIQic
         PpemP7vAxVaKhGaFbQA3SM46TdDoUyRu34CY7niP9Y1XNB+4pDjPxJpJYxgtaBo1WTiq
         1nsGMsZpj7SJtrfGRcpy/NkE9uRvIRvuAwhDKpbFugj5tuMJhpsMBagcHA3hpv2h8u8d
         nkh89lWqcW1wL8C+oPFnsVmEOLMIFpWqtRqkMcdgIUad3rGnMRqlHPEMD7rqySuOU3VY
         VvOzaucbpAE3mrHJlS8FybLRI5I3/NVBtJYq8LHtGIXlIgMI4vfl9uPvbkUa6gGG5C2C
         1F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038680; x=1773643480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhBJGCljjR2vWP5NBGBE3Ox/OrYcaC529yay0waARyQ=;
        b=a+hh7HJ5kKwK0AEcxmZL81XnSMNbgaSJo1FdWDFpNADsqS2CDZokLW8GqcTv6AZXmY
         fuBze8g4svNEioL06Rwi1m9lE0c5dP6ZDKn0Y++GPZ5+QhXCiPJp0KRdz5JXFR+341Fh
         o2VAmJqfDllXa65Q+pfAJkKOw8aBa2yw/U1EFfLzjHakhxil9HZpI6P/1wEJ19kRp6A6
         lKLpIYfXbgdaZiCLn+ngowMlq4DC7485v3GxYc/DXNv8OfnmSGiSJ/8zBeTIjnAsBXEL
         Qh/z+hIxD128dB6pKiQ3sWC+T+KyGFtCDYtZCe5BW9c5OBpVyBc55UlDPzU4ynPEboxH
         R8VA==
X-Forwarded-Encrypted: i=1; AJvYcCWYn5CdKftwzOmomhOfw1xqpCBFmAXOcXfRE5axVYl4XFqpybTZ/u2vNN021wZw925U7YrwXiLvgYk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6TWXLVNpMwNfr6ZY8jH/O+L/Hi2RGASVD5OiLapNWMolcIweU
	CHe61UHNt4EERi/T7y+cvLTNy5oSdkz+YR9QX02150yB3cLB0hhPtkUX
X-Gm-Gg: ATEYQzxLAun6jkAG52GYAdfcCdBD9+H5MhNH7wuJ/X5weWW6aDGddQ04CCqmmWl9zrj
	yDf4p8/zNEHXSMZkKl/VcbWl78tJYdgBYQZZrD3PAEZsWQ1SCQOHp6s6cZPaXpUIV6duMGZya06
	/KIrhE9asHy0cRqDKwHLV89seBU0GNJjmSIMmUJHCLDLzOhDHPIPby8Il61MglL92r/zK8qAfEB
	BNVajJ3czWxjKE3WylW+QCUoxqgJbLA4DO4lYwoNzDtNWrjrBKDwqU9ItQDgNYFf40OIZruQ+ml
	+F84/+2CknEpECL7qXZ3VAX1Sx3ilZn/QBRUIvbF1zrDVEi1ce3Y847hNd8YZZ1GXkxCzKDqjTS
	9Z/ncF6Xt7h61V+vQFXxcnPRjhjj1ngYUPsAC0JkDosXQQjAzV14CQFOcu5mvgnolSHUYkKHdoj
	5z4D3MsA7As8YkMoDIOdkaL7lAXPLgHHtGTQgig7/uzhX4XMRzPT+F02ptRw==
X-Received: by 2002:a05:6123:4b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56b07d15b1dmr3664236e0c.5.1773038680128;
        Sun, 08 Mar 2026 23:44:40 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 0/5] xen: pvh: Add machine option to disable the mapcache
Date: Mon,  9 Mar 2026 07:44:30 +0100
Message-ID: <20260309064436.51860-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2ABBB23456C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

  Merge tag 'pull-11.0-virtio-gpu-updates-060326-1' of https://gitlab.com/stsquad/qemu into staging (2026-03-07 11:22:16 +0000)

are available in the Git repository at:

  https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/edgars-xen-queue-2026-02-09

for you to fetch changes up to 83d1d9a49e8eb970f87508ae4ce0f222084df365:

  hw/xen: xenpvh: Add prop to enable/disable the mapcache (2026-03-09 03:24:02 +0100)

----------------------------------------------------------------
Edgars Xen queue

----------------------------------------------------------------

Edgar E. Iglesias (5):
  xen: mapcache: Assert mapcache existance
  xen: mapcache: Add function to check if the mapcache is enabled
  physmem: xen: Conditionalize use of the mapcache
  hw/xen-hvm: Add a mapcache arg to xen_register_ioreq()
  hw/xen: xenpvh: Add prop to enable/disable the mapcache

 hw/i386/xen/xen-hvm.c           |   2 +-
 hw/xen/xen-hvm-common.c         |  18 +++--
 hw/xen/xen-mapcache.c           |  16 ++++
 hw/xen/xen-pvh-common.c         | 134 +++++++++++++++++++++++++++++---
 hw/xen/xen_stubs.c              |   5 ++
 include/hw/xen/xen-hvm-common.h |   3 +-
 include/hw/xen/xen-pvh-common.h |   2 +
 include/system/xen-mapcache.h   |   1 +
 system/physmem.c                |  14 ++--
 9 files changed, 170 insertions(+), 25 deletions(-)

-- 
2.43.0


