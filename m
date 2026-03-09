Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEXVJXATr2nJNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:37:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8F23EB06
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249660.1547120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfTp-0001Ta-EG; Mon, 09 Mar 2026 18:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249660.1547120; Mon, 09 Mar 2026 18:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfTp-0001RV-Ay; Mon, 09 Mar 2026 18:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1249660;
 Mon, 09 Mar 2026 18:37:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kVaJ=BJ=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vzfTo-0001RL-7k
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 18:37:24 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 029ceeb6-1be7-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 19:37:23 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ae5423b02aso55624355ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 11:37:23 -0700 (PDT)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840ad9b7sm206390295ad.79.2026.03.09.11.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 11:37:20 -0700 (PDT)
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
X-Inumbo-ID: 029ceeb6-1be7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773081441; x=1773686241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CB0c8DocWs9nC0mRqWJrFur/DeD1o0K/iABvpYV8rYI=;
        b=i5y0ybtdX1y23IwGXWB7o4dQ2/JoVqs2xwGqiLhc3N2mutFkTnmi9bhpLv60Iqii8i
         e+3HuWFCuVAycSoEb2dQxcfDJ5LjZn6n6dBQYelwugKZYbOVjwjftJhslAxQFHINgus9
         z6n+Q2RDRuE5y7fJmEVw16gTq9ESViCv2jGt7kovJoOz02MbmXXMzUOHmdxj9e6EZCuH
         b0MKe3TvDBKtoIqKIwbn0GpilpzOvgQHQQcYAAFlSkX04nL7AkB0p0pltyZFD5s/UsLJ
         G/qt2UO+SAyfXyxPMarMC2s4hod11FRDAZdTHI0LqTBCZr9ahHdPfhdm8JA5oBWiu60D
         6rOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081441; x=1773686241;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB0c8DocWs9nC0mRqWJrFur/DeD1o0K/iABvpYV8rYI=;
        b=X5hDMNXiWjQs9hUlEb+I7cSkDev6+ouC3kN+VYPYfkRMxkAR1fr8ZnVsxd95GQyEAR
         ZbUIMTh9Df5Arl3bFyih+H7y8t77aqyEzCV/44EgO4DPGrJiIOd6KQWzrJi05Raouehs
         MHAP3x+MSshy8O7/SkZA29m/5rWydVuq/rQcjLzlFgKhX9V+tjJ06lokECGRYSZ7umLZ
         TrDPq74GXiJGdqpvCMOigf9mTn2n9bUMMpjppyb+Hl0eGvBNRfu2dfY7wAAK11IwQKt8
         qW8/NLEe8YXfJUj4HV7AWDdvVmGr/f6m5lN0ZkIUtH0K7tsi3V/2roeKeNVc0FbnMY4H
         tNHg==
X-Forwarded-Encrypted: i=1; AJvYcCWR56dx8mKYvgiJvZ7rNk74RLHINNeaSY6htA2R5UnlBWi+TlcULWnVlzgRbcPPQxbzLYyOlw5NkXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRZYPe1msjtfdMDX6kz73uzuDRUpRWnyjyMVvo/3gco7TXupLW
	d4YX1nFXpPpTmQazPqwkkfgq+SGCxbharIPqOezHYb+Nw+gOHlwWxXhUksgr0k6yTu0=
X-Gm-Gg: ATEYQzymjHqtAnKSBtYU0Y/aMVqmqFxgEgvPncDGdJu2BNrq6Kno6uGzj3TPyuHgGaS
	BWmYbyY2DQjkrZggs63KODxFc+VQV/NtwSH9f7lJ8rGqhmeljPm1cCLJQENJsWmufjkmDRfWBxd
	KdvlRWHF2MzeBsJrRy/RVhGnBMZy5kRzQh4fUJCkSlox9ZKi6em0j7rWCdsuFubdkckDGwPpwtD
	ozD7gzwJ7qg0xJtAtCWKm1h/T6ryYh0FHzqi5Y0a3kAcNPPzzY0kZkibZkfa0XTnv5RGuxOxYbp
	yIpkQb6/i363Bm1LNth8EYChmIxA+29ixz7VeGIKutigZ6uSeGWXTUsVj0vmLIZV0kN2HFWsxTW
	zMsQsJVSQ2rRvB8wWJMfdvdpjpl9ede1NkjGT5pBOPWcH1RrrYYX/Ku9hqRtBoXIAHauxyaoCFv
	93MR/hSZt+ay0Coiy1/C1bARnv6GnC3HOxcspRbkMxgOdjfacWOK/Ncey2jq4leve5jE1F0Lz06
	Fh+AeA=
X-Received: by 2002:a17:903:ac4:b0:2ae:69d3:5b9f with SMTP id d9443c01a7336-2ae824ac5abmr118864835ad.52.1773081441272;
        Mon, 09 Mar 2026 11:37:21 -0700 (PDT)
Message-ID: <5483ce28-65d2-4726-b7f2-1003113ff58c@linaro.org>
Date: Mon, 9 Mar 2026 11:37:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] system/xen: Constify various MemoryRegion
 arguments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Peter Xu
 <peterx@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
References: <20260309183536.88976-1-philmd@linaro.org>
 <20260309183536.88976-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260309183536.88976-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 09B8F23EB06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[unpredictable.fr,xenproject.org,lists.xenproject.org,nutanix.com,redhat.com,linaro.org,gmail.com,kernel.org,rsg.ci.i.u-tokyo.ac.jp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:philmd@linaro.org,m:qemu-devel@nongnu.org,m:mohamed@unpredictable.fr,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:mark.caveayland@nutanix.com,m:peterx@redhat.com,m:richard.henderson@linaro.org,m:pbonzini@redhat.com,m:edgar.iglesias@gmail.com,m:sstabellini@kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 3/9/26 11:35 AM, Philippe Mathieu-Daudé wrote:
> Mark the MemoryRegion structure const when is only accessed read-only.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/xen-mapcache.h | 2 +-
>   include/system/xen.h          | 6 +++---
>   hw/xen/xen-hvm-common.c       | 8 ++++----
>   hw/xen/xen-mapcache.c         | 2 +-
>   hw/xen/xen_stubs.c            | 6 +++---
>   5 files changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

