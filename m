Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLEyCOkoD2paHQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:46:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB185A89B1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315458.1585269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5bL-0005C8-GE; Thu, 21 May 2026 15:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315458.1585269; Thu, 21 May 2026 15:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5bL-0005Ah-DD; Thu, 21 May 2026 15:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1315458;
 Thu, 21 May 2026 15:46:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ5bJ-0005Ab-QC
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5bI-0039t9-PX
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:46:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f28b2-bab6-0a2a0a5309dd-0a2a4502eafa-30
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:46:20 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f28cc-af86-0a2a45020019-d155dd36ec69-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:46:20 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-44a14580111so4758449f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:46:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7dd9e6sm3613936f8f.16.2026.05.21.08.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:46:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779378380; x=1779983180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2DtVtonbXLWM9u5aopqTSLiDY22wF3t27p9OTaAMGfo=;
        b=EMS5XrCVmHBnpt2zaKnFVbdTHDFjD0FEaSv2SJ0aAYwzP3qwHLH3TPV3SXjY4tyIKt
         tsO8q5AEfKQtPQPe1reg8Nsr8pZpsE+ikxhgCPppBvLEbv4YPlSsfMSn9rx2gylftWv1
         WJXER4iDyQ6dU3p5sHPD5AmLkJeriF1W+hVBlI/yclOVjGlEZkO6cQfUV/el0mCtQQd9
         UBUmpLhmqMXnGyiawNfPj5JFOHUF85oI0f5Qj0QI8p/0ryWTE8/3YieVklIyq5rlk+jf
         dSXO0dS9skHhptnsw8OZ2O3eWTi5FIGwj7rZV6sqkNopl45XuNopcDBHkIW0vx6sNBhO
         D5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378380; x=1779983180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DtVtonbXLWM9u5aopqTSLiDY22wF3t27p9OTaAMGfo=;
        b=M8arZWJ9VHwou82H5NRu17ggoOhmPM5ES8glXIAWccl3yXnkGPPOo8gFZYjBmvSMzv
         TZgqqOfmX0uIdcXzTvdiNbW0kq+QCm7mBmDDBHglfg9mlFJ5eeQ6oNvwRWwp5xn7Va01
         BC/sSBP8rhoMk7nnRNN5U5iXDQmnWEFLwKTVjtbpWJmViDBjHB2HwA8cIY9i/muB3cU0
         9TPwgEHtEnnBZpnA3Y1h7aPBaVw7y8KNt8odGYlqkmP/yEYVIlQ7QTgZCos1bxCTC3nX
         EdqHVaVMwNYYuMkFWcZL/ujA8UAR24MqeNsD7LKgqYY+omuNldHxXrhPQlnA7lS8x89U
         dG2w==
X-Forwarded-Encrypted: i=1; AFNElJ81vJm3cfN+kfNdKneQY0dOC3/hBF/8oXwYyoRijV820DXfMq2t+GgN7NVnMhWHi7Gl5VvqzT4k2w0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXM7W+4gnDg2IQVEq1cBmHFjx4dqW36MTRJm6Gkx6Y3zCSeTB9
	cVOL4kHsPlZS9dk6+WssPkL5K8KQH3b89q5sWLqSdmn+GmnvnCQBY1c4fHIYCBDYYA==
X-Gm-Gg: Acq92OF3VuaHvtOdbNhO3due9X9087M9e+ld3MpfjmCPId/wU7RSTXiJMLsZxLmtMrA
	2IojqZr+3/tdPePxzmI1EUfQ5x/AiZwb0JdttCXgub3uTPmrXDAbW7tr34iy4/EyZEkWClxEjSz
	zAiObxmJp/cShsbO/wLGy01cinSZjQVXLl4wDMdWHV8HBM1KmAARjk/SvQQdw+O/zwqP9I64TUY
	1qMgslO3IPriqvoa+/k2Ve07R7s3APGrdHzZiLRP5JfzcWFkeMfBn70WlVJqs9EWXQoStZIzC+8
	eE8CMKp4SmSmgl/eBuLTj8f7jzx/7M7k+c35g3WMZB8fGb0RhwTaOSymcvhIxaM+MUC0iQKTy9S
	YsjmyO2Hj6RvZ/ig4CYoTn5nLdGpzB628iBf9yDKDSzX0f+68ykbzLadGFNJiG4STIh+BRf/TRf
	usIEjEfEUZHhxzlWB2aI69wLix4c9dR5Be7gNB0mDvdL+7qhxgbcvROMDm3+fLbiPiLrSgEXKAX
	v4mxtowDvBGYqTLFfzAx957wAv1bhrGMI12
X-Received: by 2002:a05:6000:2383:b0:45e:651c:47bb with SMTP id ffacd0b85a97d-45ea3aebaebmr6284289f8f.28.1779378380025;
        Thu, 21 May 2026 08:46:20 -0700 (PDT)
Message-ID: <3e2ad5b9-ef65-41fd-87bf-823b98fa0c3d@suse.com>
Date: Thu, 21 May 2026 17:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/process: document AI-assisted patch tags
To: Cody Zuschlag <cody.zuschlag@gmail.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20260519142011.30276-2-cody.zuschlag@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260519142011.30276-2-cody.zuschlag@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1779378380-8256B161-0813B80E/0/0
X-purgate-type: clean
X-purgate-size: 1771
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cody.zuschlag@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7DB185A89B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 16:20, Cody Zuschlag wrote:
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -195,6 +195,25 @@ E.g.:
>  
>      Requested-by: Jane Doe <jane.doe@example.org>
>  
> +### Assisted-by:
> +
> +This optional tag can be used when AI-assisted tooling contributed to the
> +preparation of a patch.

Noticed only while reading your other email, plus checking the Linux
wording: s/can/should/ at the very least? (Personally I'd make it a
requirement.)

> It is in the format:
> +
> +    Assisted-by: <tool-name>[:<model-version>] [tool...]
> +
> +E.g.:
> +
> +    Assisted-by: Claude:claude-3-opus coccinelle sparse
> +    Assisted-by: ChatGPT:gpt-5.5
> +
> +Basic development tools, such as git, compilers, make, and editors, should
> +not be listed.
> +
> +The person submitting the patch remains responsible for reviewing any
> +AI-generated content and ensuring the contribution is correct, appropriate,
> +and compliant with Xen's contribution and licensing requirements.
> +
>  ### Signed-off-by:
>  
>  This mandatory tag specifies the author(s) of a patch (for each author a
> @@ -209,6 +228,9 @@ E.g.:
>  The author must be a natural person (not a team or just a company) and the
>  `Signed-off-by:` tag must include the real name of the author (no pseudonym).
>  
> +AI tools must not add `Signed-off-by:` tags, as only natural
> +persons can certify the `Developer's Certificate of Origin`.

Linux emphasizes "MUST NOT". I think that's advisable for us as well. I
also wonder whether some of their other wording might be worth taking
verbatim, rather than making our own, slightly different variant.

Nit: Wrap differently to make better use of line length?

Jan

