Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d3sNNO3sRGpZ3QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 12:33:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4586EC2D9
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 12:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AcL9rL8x;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1349726.1607386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesFa-0001zW-36; Wed, 01 Jul 2026 10:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349726.1607386; Wed, 01 Jul 2026 10:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesFZ-0001xx-W2; Wed, 01 Jul 2026 10:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1349726;
 Wed, 01 Jul 2026 10:33:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wesFY-0001xr-Oc
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 10:33:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wesFY-002K3H-5R
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 12:33:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44ecd4-bab6-0a2a0a5309dd-0a2a4508850a-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:00 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44ecda-edec-0a2a45080019-d155802ae54b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:58 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so3611575e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 03:32:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c0e92687sm31842285e9.0.2026.07.01.03.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 03:32:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782901978; x=1783506778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Nspqi0L/FvaaEelw0vLuhfkp8XgCfb5VdSEDQnxQXI=;
        b=AcL9rL8xP0AC5H6jotR1kA76UJQrXLQdKPmURzl+l94Yr1EvX21MxTStSTEOed/Mxx
         661ZQgwJs+t86v82lbFEXbMmZx1JpPyveqTSuApJYMvTIAjNHqpjFsRDNOiRgKyfEZTx
         C1Un8dlHWJds0b+t0C5j0AHwSkUeU0r+2M4e5j9D/p4JTwqzPs7kkZSpLyD/N7yR4+p2
         pw6nTMOKTsliI4SlxRB/lp1Plp10pPq/8vPGOQ7539v2baUCBuyRum4oGYCQd/fpegQc
         BzFskz7xBGn15De0FBOKzc0G52fxuvXqnx/ahFzO0gNNkGGN21gBDh2I/tOcAMBGWdjq
         7ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901978; x=1783506778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Nspqi0L/FvaaEelw0vLuhfkp8XgCfb5VdSEDQnxQXI=;
        b=PjcRNH5uEePYHVMPKXGWrk1m1+Sjx0Ybu4/O1JPGCA4QDovqokKzXFAbk+9/PUK4Vt
         bCnXH2X0cTUh/u5upxm8inFXqpoO3AgPEcHblmKrWRICmvndLVIQ1I1LH6KLsBYJuSr0
         qcZCsqzTBWKV+xNyB/h4l7u5p7zG/4ALj+RB+lDkISxVefJ5sGieWfeBZwsrrqM/fN6X
         jbt6Ksj09//NDZIKuDYbtOe4vuyUtCQawk8f0szrkWBectP+iMUkr144Rw8mbniRbjy6
         ptfN5c/FYjbZf8wyL4OqQiQJQ1Z2aOsOS/YTacaHc/Ieo38fos7W0lW69tONEiZcH4Dj
         IrDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GgFU6PWsn+eciTKRf2A4WdA68+S27lOZSMpevy2VFlVJ3wnXm353yX/70dda3cg7JZf40nf5+xLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN1ugwCid4ak89s1fj2IN5NpvhEMbwVvvRTR5n0ysbsiSsO8Ok
	X0G5T/U7TAwbeIINUTHvUJ9Xd1yB44l/c2VIhWil/G7kgR/HsL/KrnUz
X-Gm-Gg: AfdE7clmLxVa6cJ03d3Unm5cKSWBT46uLvgGFhIEIVT5vC1YtvI9NDnzKhvO9qrEy8x
	YJJr6+TVGaTRjY3cQNXv8TQr/qZGs6hV0VBCeRiXy/LJ6d9IAUEXGeAZFhrky29BoWfKlr8JW6m
	wvsTIqcHTl7ywDkXZYwD+0DhbIw6imTSGe8o9VGR/G+1QEqu0XTigeFF9rBU4RsRqMazyR6Luy/
	NzTPnD28qNy5PTpyVfli93E8r1CCEGsyfAorDHyrKV5HumkycEm6frLDUTZNletlO4XB/0UzvAr
	e07E4qLfgWmEaWDoMctTcX/NLvBWxvE4EP2s9yQT+YW+KbPxJSndMR3E1QQ6CSB4fE60K+IbVun
	8FxxBhCrO9EGvN6k2huz6jlzuidKmthQYAu5f8TnranTALky1Xxj8psUkTD4gHQgr/79di57DGN
	7CDmni+WOY1e8B9y2bzCaFdwDX529ceyQWpCGWlwI16Z7CFRtaQkGHdmbBbuIMuCy1GS0=
X-Received: by 2002:a05:600c:3b05:b0:493:c337:db18 with SMTP id 5b1f17b1804b1-493c337dc47mr10143765e9.16.1782901978196;
        Wed, 01 Jul 2026 03:32:58 -0700 (PDT)
Message-ID: <8b1180b3-a165-409b-93e3-400b0aeb7039@gmail.com>
Date: Wed, 1 Jul 2026 12:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/25] xen/riscv: rename enum intc_version to
 intc_variant
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <542b22adf7bfb2a60baba201ef89df260d9bfd1c.1782487661.git.oleksii.kurochko@gmail.com>
 <8ccc2b52-ede8-4eb4-9056-49f1aad5e08e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8ccc2b52-ede8-4eb4-9056-49f1aad5e08e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782901978-4293D3FC-A15FF1D8/10/73395122804
X-purgate-type: spam
X-purgate-size: 797
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A4586EC2D9



On 6/29/26 5:04 PM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> Rename the enum to intc_variant and the structure member from hw_version
>> to hw_variant to better reflect that these values select between
>> different controller variants, not versions of the same one.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> (perhaps also Requested.by: or Suggested-by:)

Sure, I will add one of the tag.



> 
> It looks as if this might be independent of earlier patches, and could go
> in soon after branching?

Yes, it is fully independent. If at the momemnt of posting of v5 it 
won't be committed I will just move this patch to the start of patch series.

~ Oleksii

