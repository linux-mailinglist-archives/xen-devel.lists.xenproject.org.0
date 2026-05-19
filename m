Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN89KkFrDGo8hQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:53:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445215800A0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313085.1583309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKsO-0005FP-UA; Tue, 19 May 2026 13:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313085.1583309; Tue, 19 May 2026 13:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKsO-0005Dy-R4; Tue, 19 May 2026 13:52:52 +0000
Received: by outflank-mailman (input) for mailman id 1313085;
 Tue, 19 May 2026 13:52:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPKsN-0005Ds-Cm
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:52:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKsM-00DnjS-Od
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:52:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c6b2c-e002-0a2a0a5209dd-0a2a450cc34e-16
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:52:50 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c6b32-62f1-0a2a450c0019-d1558031e5c1-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:52:50 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so23625475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 06:52:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fcasm305965725e9.5.2026.05.19.06.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 06:52:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1779198770; x=1779803570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O/a/OzZaxIL/wVLf1FKXaBULJNpj/cLuMHB3ipX6KUw=;
        b=YgE9HpEuqYuLyP1kXz8r3AkiqZpxYgnwPlCtmu2F6lL/JoyDOvHipltzTbgDJPZ228
         PdQalysj1a4ID6F3F5W+NDC5USgw8sDuyzFZ4yh7FhpZ1qkRrmPWgfieQf7M+ckIPr8/
         8f/lzV3lGZIt9m2YcJvl8wspGwD8hUro+zjhlLa0nhkrfzDQ/rxMIsl+jkuJdOsl/TbA
         nUfPrRKMlbVvhzXU/C2yOf4Nfm1KT/nZlM9AqqyaUc1lM34X2nELAj53VdREjDAl+j3k
         OC6LY2Kh1Ol0ogFsHvtlXgh7RVoGSONTryWvkYIoUcdapxakXCApifqOjmn801Lu3l4Z
         JDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198770; x=1779803570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/a/OzZaxIL/wVLf1FKXaBULJNpj/cLuMHB3ipX6KUw=;
        b=fGuVMfZZcMaxp+R0CPMZ76ewKhXKbqJFJMrt+w90sc+/XqVizvA91NjFBB1ZDLbIPT
         QcwQ1gKP4SoOk85dQqk+gqb/wkCPfqk+d9jJiZVTNLSdvYL+RqJ3oXK86PTFgr8Qhpke
         ALngOhuEGJr1/qY0rhq4M/zBwXEUhdJh5/HKcIPfR7+5M/azNpt0dKUWuKpfKUlA3Qs9
         +/XZtvurBX1zmv11z2lbQTZVy2fEA9AqXDSj/aYnNw5YWpHfl0PALEbrXWNRBF28Pcl+
         iNAnn6OLxWN5twYAvU4JP4zH26HNpEBoA/xINqs8TCsK0h8wk6wEBdXS/t7XhBGxHKvh
         yvFg==
X-Forwarded-Encrypted: i=1; AFNElJ/VWbKj7Pp2axwN4jwnTqaY1s+PBIGVV8kwpqFl7lQY+z1CYm78zfflaUTA32hr9vGG57Km/vOltss=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7Ug207/Xf2STJgzEvcFMXP3+dNwM3e/5Axfksk3k3Ba/d94Mw
	A7LXqChjPaQ9FI5a2NNaKcDqUd+8kXJtMhtzh2iKDRG+GqNZmIfQDQNLnDYd5jdv/A==
X-Gm-Gg: Acq92OFCY88xgGh/f4pHMNOnh8OaLcE3bNz90Eebn1NnJWt/VXJaerlCDIr0NsDD6Cs
	xqdIJte+gOPu6ATk2gmX3CkU8DRPoMiGDSZuwQVOdJRCVWUrsCMlbQbwgZuDMA5Z18XmyJ6Hoov
	Rkl665WpvSHw8z4A0kRcKvvp5AUMOkg1CfLAZKDISKHxIFFE64PfeQ0gEPu+AkMnfQLkNgE9V4d
	usMcI+gunLzfFVz5488KeJggcBwKmbNYPV21pPMHHbYq7mBZ4slkHh8UnYp0IpktfvoH49D4/6x
	kuvO3UXl09xR/txlXng0OfkI4vI2NjSAagPVkqQSAiWIQ5np3d+2hIlKh/kJaLWnEfyfUXLBNSG
	NKp+QtHSXf3KHH5+1nwqBWlrZ2DmPe6TglCfMklA98eZXG4LS5mIqoXr2iYeF7a/XeWPVyGUOFO
	Bm5kO3MwT0wmM9KtDJKwB+r5gopP7FyqCnu3CrOtII0/gI5wingRdmVeX5l2C6yV6n2lLGLsHHI
	si6dmQ+hkYRE7mWPtYmq4t0EQtyPo2ciS4X
X-Received: by 2002:a05:600c:a11c:b0:48a:5574:3a5d with SMTP id 5b1f17b1804b1-48fe60e476fmr209131095e9.7.1779198770052;
        Tue, 19 May 2026 06:52:50 -0700 (PDT)
Message-ID: <15e7a49d-9f0b-481d-b6db-2fa6fb218abe@suse.com>
Date: Tue, 19 May 2026 15:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/process: document AI-assisted patch tags
To: Cody Zuschlag <cody.zuschlag@gmail.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20260519134417.16024-2-cody.zuschlag@gmail.com>
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
In-Reply-To: <20260519134417.16024-2-cody.zuschlag@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779198770-E1F6ACF5-7A46D43B/0/0
X-purgate-type: clean
X-purgate-size: 2633
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cody.zuschlag@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 445215800A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 15:44, Cody Zuschlag wrote:
> This patch adds lightweight guidance for AI-assisted patch
> 
> attribution via an Assisted-by tag.
> 
> The proposal is inspired by similar Linux kernel documentation,
> 
> while keeping the Xen guidance intentionally minimal and aligned
> 
> with the existing sending-patches documentation.
> 
> Feedback welcome.

Up to here it's kind of a cover letter in disguise?

> docs/process: document AI-assisted patch tags
> 
> Add documentation for the Assisted-by tag to clarify how
> AI-assisted tooling may be disclosed in Xen patches.
> 
> The guidance is inspired by similar work in the Linux kernel
> documentation.
> 
> Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
> ---
>  docs/process/sending-patches.pandoc | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  mode change 100644 => 100755 docs/process/sending-patches.pandoc

This and hence ...

> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> old mode 100644
> new mode 100755

... this looks unwanted.

Looks okay beyond that.

Jan

> index 798ecceb..b61584f9
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -195,6 +195,25 @@ E.g.:
>  
>      Requested-by: Jane Doe <jane.doe@example.org>
>  
> +### Assisted-by:
> +
> +This optional tag can be used when AI-assisted tooling contributed to the
> +preparation of a patch. It is in the format:
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
> +
>  By signing the patch with her/his name the author explicitly confirms to have
>  made the contribution conforming to the `Developer's Certificate of Origin`:
>  


