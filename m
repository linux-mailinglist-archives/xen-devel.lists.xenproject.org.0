Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gdZGKbDFRGoD0woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 09:45:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615A6EAD0F
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 09:45:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NLIlUc1N;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1349545.1607269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wepcu-0001oO-Br; Wed, 01 Jul 2026 07:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349545.1607269; Wed, 01 Jul 2026 07:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wepcu-0001lb-7d; Wed, 01 Jul 2026 07:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1349545;
 Wed, 01 Jul 2026 07:44:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wepct-0001lV-42
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 07:44:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wepcr-009ztH-DF
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:44:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44c56b-bab6-0a2a0a5309dd-0a2a450cdf7c-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:44:53 +0200
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44c575-f399-0a2a450c0019-d155a735c968-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:44:53 +0200
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5aeae771c49so306206e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 00:44:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aec5eaed8esm160558e87.6.2026.07.01.00.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 00:44:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782891893; x=1783496693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlHQ/fvs5m+gF3nR5deR9QkQTOr+VSn7/u3q6MKLMBY=;
        b=NLIlUc1NcEkVsGbbgjspSrmmoVKQiqBBgLywJxa5Z//9XW2K2lHseOxoGesy0dqElT
         4+06GbGeh/hAYv3n0BJu4vZr2oyJsEIQmYkhPVWQSXsYvxWwlABArczIv1ww5hEc2E0i
         vPpIFDiR/uDXTdvUsK7LPxWL/NojdQoA0+kpKcgI32nGcihj74bf3Tp05ez5yz1x1pF+
         Liy1e051OPvH59mjrLcinFQbIe8n9zw6g6K12jyR27uakWvauXyGRNuV8OWe/myvqUcS
         ZYYXcpSp0CV+wznXHNxwqdDOfWs75pJTkKw8IS0q2MLi/KQ5hhTss90foRQQ7bGJi6Ia
         fykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782891893; x=1783496693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlHQ/fvs5m+gF3nR5deR9QkQTOr+VSn7/u3q6MKLMBY=;
        b=ifj7CHkB2yeUlm7NRWj+4s6hsDzStwr7TO2qZGRVx+lah3jYIGzpkvi9EApU5V1eni
         n82vPSipccUWdacaC95lLpKkiGYWgHozd9HzN/GZNxeHD/Bc7aajiG+NSwObCO1DtuOr
         J852wVpfEvrjPIcF20TI+A5kNaHY3a0e0GGq18joVmbrcsIAVMn9tjqTeB0eMeWGGNGA
         DgJTZ/DjM2K0/w30sPFzL/mTCy/c6TtuttnetgL4y7EE1xGlG8HgIFYmUi/sLYymAwnd
         BYErUhitOc9vKcH53TvES4szEhKZLU6nSsogco9xcvAGpLcgqOVde1736SwLHijrmn8N
         +PRw==
X-Forwarded-Encrypted: i=1; AHgh+Rpfj89hlWAXpNWlCqyqSJriFE2XV1+1KqxMhzlUsCQYdDLDenwge5XotxlKZMsbYnatJBcBYI8s/vQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeD0QbeLiq0GPpReVvxFFK43DRsNPntGkl76//F++CCcEtbzA3
	p6dI6z8CEoifjaHnTqgmGmjHkGl8hYTk1KVEM0g+pRhff3VrztM5J834
X-Gm-Gg: AfdE7cnd+pYAMe0TCEftiSiu9JkeZfpjKcC398shVEnCmgxA66Asn5yf3r6jxwB9vde
	p4wcYpLHmvFKG+sjd+GTxXV93/9xw2o1MOcVV5jvRCUwDoDGP/nOdT2C5BOR9cE/9R255aEebLX
	/uFceGCCxbTj2hnoFKWuw9ZWMDWhKCQhKZogjR5MMRD81DEIkJlB5r4IyFCGeF4RAVQppN+uvUd
	nUkL5815Wl0mn9TP+Dk8KFMKw/8vu8ZGQ69M9XfIA/MV2+bCzSsMcjyYhcDamQwqQuXG8j6ymka
	PtVc1SYr31y6ryAyd8MmoZjg2lHgDHT3+21FrSw9bfvcox/sodFOCsZ/HRyIOvjpz3Ha9h6gxwH
	AHRpYJNPb5dyUXCjKNjcNgRtmWUU3WSvBaM9Ro+NRwDjQz+YwAoc9Qs8NMf5n+tGGkMMmj8O3dn
	OiypDEnN6e4+V81tKleGGoYu4WskTc0ELc5m75S4rmQxWwJkoXKTJDiBVknjvl34Oa35Q=
X-Received: by 2002:a05:6512:230e:b0:5ae:b88f:3126 with SMTP id 2adb3069b0e04-5aec67a5c18mr110488e87.26.1782891892365;
        Wed, 01 Jul 2026 00:44:52 -0700 (PDT)
Message-ID: <f9801008-7315-417e-97ac-dfddef6c6926@gmail.com>
Date: Wed, 1 Jul 2026 09:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/25] xen/riscv: introduce guest riscv,isa string
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
 <b2678a5697112d3ac16a98b86433da22374324b2.1782487661.git.oleksii.kurochko@gmail.com>
 <9d082182-394d-40cd-9afe-35369d7bc4bc@suse.com>
 <20740b98-bdc0-4098-afda-45b09dc07ca3@gmail.com>
 <bef567d3-974b-4654-8cf3-d5a97d9dba10@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bef567d3-974b-4654-8cf3-d5a97d9dba10@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782891893-0F737D51-71E7065B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 2615A6EAD0F



On 7/1/26 8:22 AM, Jan Beulich wrote:
>>>> @@ -94,6 +95,9 @@ struct arch_domain {
>>>>        struct p2m_domain p2m;
>>>>    
>>>>        struct paging_domain paging;
>>>> +
>>>> +    DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
>>>> +    char *isa_str;
>>>>    };
>>> Why is it again that both the bitmap and its string representation need
>>> storing? In the end they provide two different sources of truth, as there's
>>> no guarantee that they'll remain in sync.
>> isa_str is needed to guest device tree to tell which extensions are
>> supported.
> Sure, but does that need storing over the lifetime of the domain? 

Considering my answer to you last question here ... then there is no 
such need.

Can't
> that string be allocated, built, used, and then freed while DT is being
> built? 

Agree, it could be done in this way.

Would that string be used at all for toolstack-created domains?

... No, it won't. This string will be created by toolstack. So it could 
really be dropped from arch_domain.

Thasnk.

~ Oleksii


