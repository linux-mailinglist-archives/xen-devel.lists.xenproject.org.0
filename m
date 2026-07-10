Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QvMlE4LqUGqQ8QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 14:50:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C618473AE9B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 14:50:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.s=20251104 header.b=SwRv+5H4;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359290.1612924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiAff-0001AN-S9; Fri, 10 Jul 2026 12:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359290.1612924; Fri, 10 Jul 2026 12:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiAff-00018o-PK; Fri, 10 Jul 2026 12:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1359290;
 Fri, 10 Jul 2026 12:49:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <axboe@kernel.dk>) id 1wiAfd-00018i-QS
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:49:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiAfc-000gF2-MX
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 14:49:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <axboe@kernel.dk>)
 id 6a50ea4f-e002-0a2a0a5209dd-0a2a4503c80c-48
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 14:49:32 +0200
Received: from [209.85.210.43] (helo=mail-ot1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <axboe@kernel.dk>)
 id 6a50ea5b-f2d2-0a2a45030019-d155d22be12c-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 14:49:32 +0200
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7e9ecd7216cso444991a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 05:49:32 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ebcb3f27besm6229648a34.25.2026.07.10.05.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 05:49:29 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1783687771; x=1784292571; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIPFqgbIUKyllKjaqWMtW74odvC0/oH+Xj63BOSJ31k=;
        b=SwRv+5H4w04wKaxKADwMJF33yALFBGS+UONHI1OahIXKAF2UmOvKshe2JLeG4YgEtt
         ODZIlddhdpRSgSTuc7xA/yIw/UH/4sWjdcTlbshxzejTf0ppAJifWFISfThmCD5A4y0h
         dUFkc5Tk3YKD9yhfVrLFkWF+Pgo7xYvcuN9ZlwLJZLzzNUhPMrpUMWtM7nEWC5CNSfe6
         otbrJp/UDr+LMq61s0yk7wAOURMjYDWUUZHbKgB8Gq4IlGl4ik1D4LkE63GJ8rKy/r54
         7OlU+jy+a5jOBbXMBkp9qDvik+D6O+Z2aR4O8ZaWng7fg4lI9Nseqxrwid3/YmkVjl1O
         5zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687771; x=1784292571;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIPFqgbIUKyllKjaqWMtW74odvC0/oH+Xj63BOSJ31k=;
        b=iJbyrqiu7lspGLUqcBBEJ2t/W/Z1/x5ExGXiFzM1bMS+wO+hwtUhcaftL8zg2G8W6F
         Vnz05RMzc9a39EcSnGvS7EDb5FVrluzBclHWaoo8wazLqXA844dYfcs3vrpRhpCvoRc0
         WARmgWWSQzKGCJs4TUntER8BKq9qsVG4p88PwX7uvCOUvDcHiMSgjJQ/V8GbaIbb+OnL
         AEN2YsrPARWRqz+kdtxnUPd0e4XrSmBmc2e8/5E+efjSRZbvUeTQLyAriLTBO8wBKTZ7
         11xRJgCx+gCPvjYeGc7e3fcH09JLvYPjmYsyBEuFDfq2cdlM1Al5wd5zWiZcvm+2qsxY
         JkLw==
X-Forwarded-Encrypted: i=1; AFNElJ/Wk5tklIfyiw0Wnsqdffiid8DgFoznsKzOHjosSPnm3qWIpPEWXzR3NhcPq869D8XIcz5nY2ih6fU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+USKO6Iv0gyOHZFSLBzMeeboY9q3BHhIwJXWlOrJ328fpec1w
	H/hBwoNEc+p4f4FAREA4NVsLxhU5KzH974DImwUMVhOvBqtDy9J8uvaFuBzeo7K31gw=
X-Gm-Gg: AfdE7cmAx/70vWJpqoWYFlu0dy0s67AhMBS1eTHKOICayP/IlhNzOw52943XuqizAB8
	WL25vmMnm0KOecTrPmewxKte1QDHxPkBu7DRQ5E85kRhSA4IAbczfrnJ2xbDameaoFJckN9Ti/p
	koUAKM8pVCL1YE+hGzOQnsMZtVWiYxgbmBEj4J0JqvT4BkuvP2kNOfx0XoQx5Wm4CoTDlI29nQ3
	iGzOh/V2HhUp6ETWaYmXirPw260iz9yQfCKS++NoMotyMDxA1U7VUmmSUjymLNxXNkjkbfhCXDO
	uXeyrGktRzFY/Mxba+TrCUq46/iHnInLl4bkqPr0Fk6DpB49uBqBJVHBtRB53vfAFq9mZJdyJSm
	Udief76eZYt4sqOMHUUjnMFAOumDHZfnxJbpSIRZqUMsJqF0ZX8mleoGkA20Z1OLx2wZDZW0L3+
	W0cXOEwXR1qwYRhrcmLPbiHIrW/IYof/53Hi+8bFTCzzV+14SuxPEPDMSHPUH6pmQ+Ug==
X-Received: by 2002:a05:6830:374c:b0:7e6:fdea:7aee with SMTP id 46e09a7af769-7ebcff9c7cbmr7993794a34.24.1783687770495;
        Fri, 10 Jul 2026 05:49:30 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Juergen Gross <jgross@suse.com>, Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260709100853.7489-1-doruk@0sec.ai>
References: <20260709100853.7489-1-doruk@0sec.ai>
Subject: Re: [PATCH v2] xen-blkfront: fix double completion of split
 requests on resume
Message-Id: <178368776865.253806.8102253484028119931.b4-ty@b4>
Date: Fri, 10 Jul 2026 06:49:28 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-purgate-ID: tlsNG-33051d/1783687772-F3756CF4-0C5F4BB2/0/0
X-purgate-type: clean
X-purgate-size: 765
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jgross@suse.com,m:doruk@0sec.ai,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel-dk.20251104.gappssmtp.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[axboe@kernel.dk,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C618473AE9B


On Thu, 09 Jul 2026 12:08:53 +0200, Doruk Tan Ozturk wrote:
> When a block request is too large for a single ring entry and the
> backend does not support indirect descriptors, blkfront splits it across
> two ring requests. This only happens when the frontend runs on a
> 64K-page kernel (e.g. arm64): there, even a single-page request may not
> fit in one ring slot and must be split. blkif_ring_get_request() is
> called twice and both shadow slots (shadow[id] and shadow[extra_id])
> point at the *same* struct request, linked through associated_id.
> 
> [...]

Applied, thanks!

[1/1] xen-blkfront: fix double completion of split requests on resume
      commit: 5d72720365f973e2c21fa99505b627521de66c25

Best regards,
-- 
Jens Axboe




