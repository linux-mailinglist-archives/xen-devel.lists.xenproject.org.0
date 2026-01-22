Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sErwD05PcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:24:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE10869D9E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211313.1522858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixU2-0003Jm-1t; Thu, 22 Jan 2026 16:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211313.1522858; Thu, 22 Jan 2026 16:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixU1-0003I4-VL; Thu, 22 Jan 2026 16:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1211313;
 Thu, 22 Jan 2026 16:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixU0-0003Hw-IY
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:24:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d36cf289-f7ae-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:24:30 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso95786166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:24:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879bd278fdsm1669246266b.28.2026.01.22.08.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 08:24:28 -0800 (PST)
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
X-Inumbo-ID: d36cf289-f7ae-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769099069; x=1769703869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HXhTFmWrWJsM7q4e6xgXiqRMeFzIExHfk5wiecob6a8=;
        b=MYeeYPj1A6qQJi18Sq0eYhZvAPMM5kqgrsc2Q6XaxbgvfnsKX8NhLjk21GIKwGN1/r
         Ild1cHA5fDf6bgaK7DT+P8JVNq/STgOQt2i39sX1xonKXDEbJeMIWtFcXbmkdtwLzK2n
         QiZvR+dqP0BeelTYc3aose29c0c1Qu94GY5WkkFfevI3BWwlcQdL/ywb/s5zN2S91fKg
         oHRsyLdTc1ELztIb8DXI0QyTyJbkikrvG9gB15S6J6i82e/CixtVzyfnbAwjURuiSbJp
         VJ7Oq4Fq/PpmxIaJFO9oSjceTSpFV4JE3FlPEn/7xyIsYJd5qDOKJpGG1P0Kfwyh+0Ys
         hpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769099069; x=1769703869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXhTFmWrWJsM7q4e6xgXiqRMeFzIExHfk5wiecob6a8=;
        b=oMkWw0+/ric851dLx2ibQYZvL2U5T+DyTfbE1rZa2hdQkdN+keVcr8lxuaSsMRgFgZ
         +YOvij52+gpdNJcvCykPQCgLcZ+TA00BPu0FoH+OTCRtXPghtJdhjAr3+q91aCV4+h2l
         N/2O/0/Zy+uzYSCohgv3uwyKaSqcCmGfS6L521lR9Dsyt7/HBtFKhtekFTCDzpruxVZD
         6jAiJ30U/NMesRGbn8CHY9SnS6Ocs/q+LFo09Ga7uasDj3Eb0W6R+ml8ZToTz+EGbTEz
         ccHzBYWa5naQFaxnBqsdn68zGfRkeM44rN9phzFcv9p8pESGXKBCqncgv5TWPI5Prfnm
         WGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXm/2gjBf2EeiFyJ1J6IANebXWSFChzz2vaOflZIgNLVI0VYUztDvXvPK97I5vGwrAqnPimpcYaqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX894md4u/GVBMSjiYpyzXz0XcTtFOGRXgDWZB4OkIS9gzYECr
	WagJiEz+DLTwvPeAfaEJDgRiDOBchqjDtNt9aUO0eatXII8L3uw7YeC5gc/WSw==
X-Gm-Gg: AZuq6aILnEk8RgQmtz844RCEtDPSNQUttaJMaMR8ZzsC5saz9sjkfxo6zimCElnJe9/
	xn6kOZtidF26CjWQ/xxugYlkaXcf+fg77ugFs8L0+GVwd12Lw5FdWfqzWii0NWYx4tUA/sSH3Jf
	yXNh+bi3IeSqWqnhSvPrsQBBhmNEoZ5UQYFpuHfg9oOieyhQJtogcf3r9A7sII96trBRjIyjq3f
	C/YjQrik27O8W9t5jBWpIzdwCvTagd9td5B7j18GyDCYv+yrpRGtmbBdTQM4KuIAt9Q5o/ckXG2
	vWu2+b1bvMnk2SDzdReu0MtodGFbi+nlsakf1rYgjZx6Y6RQB+jKbxXcBDYPDBxMzd1gml3pN/a
	xTPVdD4/xDgRtQuOG80tJM8FE/6O8zCj1Dw1Q+I+e378P4/gDkmCB6xiAoRHZGteRAbc/q6TuFj
	6A58sM2VHFr8BbHXszLjpbEeN6F5hwxeRgU2XM3NGx7sZaL0b3vbWVAuuBi/D/Q1pGLsQFpet8P
	A==
X-Received: by 2002:a17:907:a4e:b0:b87:778b:89ba with SMTP id a640c23a62f3a-b8800652889mr776595766b.39.1769099068425;
        Thu, 22 Jan 2026 08:24:28 -0800 (PST)
Message-ID: <21a22ddf-cde9-46b2-ad05-f88b62bf8ebe@gmail.com>
Date: Thu, 22 Jan 2026 17:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: Drop more cpuid_mask_* infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260119193901.1354905-1-andrew.cooper3@citrix.com>
 <14a32e1f-c5ca-4d1c-b54b-c565184bd6e7@suse.com>
 <5e57b6b9-6fe4-49a5-bba0-fdf9e48bbb99@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5e57b6b9-6fe4-49a5-bba0-fdf9e48bbb99@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DE10869D9E
X-Rspamd-Action: no action


On 1/20/26 2:56 PM, Andrew Cooper wrote:
> On 20/01/2026 7:50 am, Jan Beulich wrote:
>> On 19.01.2026 20:39, Andrew Cooper wrote:
>>> Despite removing references from the documentation, the Intel parts of CPUID
>>> Masking were accidentally left behind and still active.
>>>
>>> Intel CPUID Masking is even more niche than AMD masking, as the MSRs only
>>> exist between Nehalem and SandyBridge,
> Turns out it was Core2, not Nehalem.
>
>>>   being fully replaced with CPUID
>>> Faulting from IvyBridge onwards.
>>>
>>> Fixes: 317051c2f032 ("x86/amd: Drop the cpuid_mask_* command line options")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Thanks.
>
>> Yet I think you also want to edit the CHANGELOG.md entry the other commit put
>> in place, to not have that remain AMD-only?
> Good point.  I can fold in this minor adjustment:
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7de34f64d1e6..53d92a259731 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -12,9 +12,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>   ### Removed
>    - On x86:
> -   - The cpuid_mask_* command line options for legacy AMD CPUs.  These were
> +   - The cpuid_mask_* command line options for legacy CPUs.  These were
>        deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
> -     2011 onwards.
> +     2011 onwards, nor work at all with Intel CPUs from 2012.
>      - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>        prior to the version 1.0 release, and there has been no development since
>        before then in Xen.
>
>
> which covers things suitably.

LGTM:
   Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


