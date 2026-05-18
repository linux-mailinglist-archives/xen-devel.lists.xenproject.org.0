Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BFDLPqWC2rXJgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 00:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63655574C7D
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 00:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312280.1582420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP6jq-0004wb-D2; Mon, 18 May 2026 22:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312280.1582420; Mon, 18 May 2026 22:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP6jq-0004tt-9i; Mon, 18 May 2026 22:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1312280;
 Mon, 18 May 2026 22:47:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edgar.iglesias@gmail.com>) id 1wP6jo-0004tm-RT
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 22:47:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP6jn-00FpFG-Pc
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 00:47:03 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edgar.iglesias@gmail.com>)
 id 6a0b969d-5cb7-0a2a0a5109dd-0a2a450aecd4-16
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:47:03 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <edgar.iglesias@gmail.com>)
 id 6a0b96e7-56b3-0a2a450a0019-d155a72be199-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:47:03 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5a8d1f43432so5188872e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:47:03 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a9164c5712sm3557137e87.59.2026.05.18.15.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 15:47:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779144423; x=1779749223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1w+VKmunW76L59Lsi4VNBjY+pQBi8an71eLD+gWmuU=;
        b=P0EZcu4fc8ZzyLQ/9XNMgE3YZU1td0+7hIk4tO1vvJkgLn1ZgUHulHcuwxlI9WMv/H
         POvGYgeyPS/Jbev80uJbcj6ogVeg+8hQDfNyRiLqNnEG27qThm0RBV/azUwV8Y2MguV0
         /cTqTXVPJDUwFYlL/jcvhg2g+TFV10dVrWZAT+T+KXvLL5abZ7InSngOzh1KbTBucNe2
         +1WyXQRR6KDS1p7ejR9pTV3kSRZnVoUD26Zocku9O3IQXNMHCZXHN5kZiqIVT+BNb9Yi
         MTJFC7OYYYkm08AXjh0KedbtMFs92ties4VQ+WKtpLDdsiiB2B2uqi7FD5HU72wZBBsx
         r0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144423; x=1779749223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1w+VKmunW76L59Lsi4VNBjY+pQBi8an71eLD+gWmuU=;
        b=C0c7ORbLmRBAotFz7II70d3rHuOyqQfrJG73KuLmcmnpZFpwCBBNloAQBEj6ugCknR
         alXJu/XKlW+ZoMlYu2ug9s4fUPKz+N4c0/7MPix+K710ZpaTUIotQh/R78zRqWT6fN8k
         ffbCNSRGjUubhv4LaqjgtSrTb3+j0PaOx+e98uujSbCsvP1r0nQMD+OesfoyYythAk7L
         693BB5XHHgGRCDol76mdrQO3LqZjFkU+3jn0z9Akh5x3tLUSdTpjckphnJTo2UtxCHxH
         7H2MhdoI/ORABhxTnUU9dNKVkIA+3qMBgqCkaLCl8X2u3mtXeXrzLw3Km4tcjKUm1R8w
         zasg==
X-Gm-Message-State: AOJu0YxN5P7vG5K40B8b1pE7VzwaBpmtYA5ExQYV7mtsjyMQRQe0qeTs
	F3uKU//Zy73AmtvxHY+HpDfAVJFRMgUgLArDBpCkAhsv1192jyhqHVNKiyZVmw==
X-Gm-Gg: Acq92OEM1PUwqtpvpAxMHB3ldpFAdGxqHQNSd2ySmX6yQn1xSSVUpRkH2A7UUqoKN7/
	wCiInyF275DZQYXXQqkHMnOBdBwJ0p03+mdM6RVahWk3lPKBiTwam+jiCOSiI7GnWZwXW5S9MqU
	TpbpbAhRiG7kVtXHnDMS4IB6FOozZpuvNqFpC8350ghukKCUPVFvfooJmN11OVRKlVs+h1CkqcI
	MsUbrRbZQVTyHW2CDMaWpE7UqhTBX+R0FPX25SvEwUE+2HZRY2m2mxB27KSuntfS8ZFAdVvlCf+
	Qc5nOQuME3/abTt5Vf9cNnQaPyLp6n8FKUjPABgT27Sstsuz1HcMji08098kFqFGHAvbDDowEcE
	wteUpBjniTQ/W6dXfbJPaKKJXQWTgIeVQQK3L+K8lDpuY38FckmaHBqCkJzxf2/LPJv0HfZvbvE
	McHoRGZnQodabtvzRbn6KIxqCheQ64RM87Z7dmS9cS1ruPUxkjRzKoQ+vX9EI=
X-Received: by 2002:a05:6512:1317:b0:5a8:f6fd:eb15 with SMTP id 2adb3069b0e04-5aa0e73c73emr5059619e87.24.1779144422770;
        Mon, 18 May 2026 15:47:02 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 0/1] xen/arm: gic-v3: Fix wake-up loop in gicv3_enable_redist
Date: Tue, 19 May 2026 00:46:51 +0200
Message-ID: <20260518224652.422864-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779144423-733738B7-9887B7AE/0/0
X-purgate-type: clean
X-purgate-size: 417
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 63655574C7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Hi, 

I ran into this issue with a poll loop in gicv3_enable_redist
while exploring QEMU fault-injection techniques in the context
of safety certification.

Cheers,
Edgar

Edgar E. Iglesias (1):
  xen/arm: gic-v3: Fix wake-up loop in gicv3_enable_redist

 xen/arch/arm/gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0


