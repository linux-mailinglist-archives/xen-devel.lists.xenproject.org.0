Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOcSHEy2xmnoNwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 17:54:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE5347E3D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 17:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1266015.1556671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6ARr-0003ZJ-Vm; Fri, 27 Mar 2026 16:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1266015.1556671; Fri, 27 Mar 2026 16:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6ARr-0003WH-Sz; Fri, 27 Mar 2026 16:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1266015;
 Fri, 27 Mar 2026 16:54:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w6ARq-0003WB-3w
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 16:54:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6ARo-00DJwo-R7
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 17:54:12 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c6b610-bab6-0a2a0a5309dd-0a2a4501a8b4-36
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 17:54:12 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c6b634-6400-0a2a45010019-d155dd34dcca-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 17:54:12 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so2255043f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:54:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c9506dsm102043135e9.7.2026.03.27.09.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 09:54:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630452; x=1775235252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iz0Ap59StazEpO5nMqP6Ndy0HXqx8y8hyNMyp9Y7AQ0=;
        b=hoX8EE2Eu6tHYCRv6uayVmLWgTWAqQeEzFbOoO7eD51ylSqyCULja5aaosYyZlMHZZ
         QvpY5TtuYDptbKt5kYyyPPEpgSUP/d3D4jQiscCuVXsHLA5xZ+eNGpqZIKQ2JTNpYZJD
         OH2n0V8tlsi7BX1cWEua3KDCiMiqtW7x37kt2hmgZbmi7GabA01Ml9jTYBDDS7F9d8Tl
         blERiJOzJCKzeYH+UeCTsnFuJvy0G4oVHpGRYdVysJmOP/vyGqQAnJ32nFC27byTk4Hg
         ZVmmHyORs6S/xMT+Jxg3CgVojdBo4ZWMe8ua1N6RwBcrFv7pEmEHEZ5amUwrfE7EqVRw
         SNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630452; x=1775235252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iz0Ap59StazEpO5nMqP6Ndy0HXqx8y8hyNMyp9Y7AQ0=;
        b=NYKDkNu7BjhdxOeaUe04DNyI3NqBspOsElI2chv6DE2Rm2ym7eyqAHktCJ4/tg4R3U
         9fIUWvFqki0JVGekuoqJdnRecWjefkHXeF6kqgsjS+Pk8ATeJa4kDEzoLAru9mEtQOEr
         IKD48PRdqMPnVaTD6K8gbJDHObGPBajxOjBYhvBjzG1c9SCr8bAov0Rv2aPJJrhQcZ/f
         ee5MPno9tGm3p8qU85ZSSMSyog0rVxopO33+qDAUKVJ7/hxqcvC+pMzdr2NYelIig2ft
         8jPetTaLj9Y0BQ85/IqLFxRiyyPxcUuXQpKal3BHbz7PchhVZj2jrLyezTGB6VQ3oLDo
         RS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEJ3RZznFbCdQ8doj9KYjsTevyMaTcmvs5BoRmplZ+5qTeQoHNx5NO57QAcsWlwXfLpQmD3DyF3Jw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZOWTufzukfz0AI9WxSZuxirMxb2jASPRRfR7Ck0MqHs/MQrn7
	g9/9lKXQ3LVojCEOroh6rm6uCsYeREc/Iw+Rv3esbTrynuCKUi0S5WjM
X-Gm-Gg: ATEYQzyjL6BOApsVE3ClzVFfalAFfwSBfjChpBgXsN7lhVOC1c4o++3dCNdCDY/Lx1v
	fEgSkuKww/Xz2G3fgEWZm2Haiev3Bk0NQz51TMrvFfO44YzRjaMdW4tPtmpkUMyy+8y2GAqdD7t
	0xRm9iISEvE2tStijJdDWa2wJIlZbNdNx0ACP0U07HlKY/Ir1Bb83dNfef9G7e9W54nriFQiNze
	6uVjtKx8HBxCMgIEXPQ+zwkJUvcBv75G3wqKiEo49ZSUPWp5g/UpVqDq3cPWRZ2GgSoLE4Im3xd
	ifVdxxR6mamkYxu0KEv8A9JQKM58jBQSoqjY0qiUem2T4BLVPTi5ZiKKJvvFRlztA6BfGVTDf2X
	noLE0DMuiGyVME/xYvqOaxA7q/2zSpqbxksyWg4HLO8BQ6ED3h22lSCtPc330AoIzOjJpnG6vfZ
	l6FHbZnqaVv93N5l/xjuTSueQCLmxyH/qRnpf4AsW3IXWpPLydluHGcbHvuiaXIWWOqNiP2kaPw
	g5XwVi2XrkU/Q==
X-Received: by 2002:a05:600c:1d0e:b0:485:a4de:f4f9 with SMTP id 5b1f17b1804b1-48727ee54bcmr58520215e9.27.1774630451894;
        Fri, 27 Mar 2026 09:54:11 -0700 (PDT)
Message-ID: <f005dbcd-89a4-40b9-9abd-45d645e9ce8d@gmail.com>
Date: Fri, 27 Mar 2026 17:54:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen/riscv: init_csr_masks()-related improvements
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <b283d6a8d59d66010f6249161245e4a7f4219589.1773419622.git.oleksii.kurochko@gmail.com>
 <c5e1cd58-92ba-43cd-bef6-16578d0f06b8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c5e1cd58-92ba-43cd-bef6-16578d0f06b8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1774630452-23AECDF3-5AFAD958/0/0
X-purgate-type: clean
X-purgate-size: 775
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 20CE5347E3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 3:36 PM, Jan Beulich wrote:
> On 13.03.2026 17:44, Oleksii Kurochko wrote:
>> There is no reason to use _UL() in define-s sitting in C file hence use UL
>> prefix instead.
>>
>> Drop 3d argument of INIT_CSR_MASK() and INIT_RO_ONE_MASK() to reduce risk
>> of incomplete editing after copy-and-paste, or other typo-ing.
> 
> Another brief sentence about the AVAIL -> VALID transformation? Then ...

Sure, I will add then:
  Use _VALID_ infix instead of _AVAIL_ as the mask identifies 
architecturally defined bits, not bits available for software use.

> 
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii

