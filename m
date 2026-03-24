Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L48F42LwmlvewQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 14:03:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DAF308D81
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 14:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260804.1553996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51PC-0007Lx-Vs; Tue, 24 Mar 2026 13:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260804.1553996; Tue, 24 Mar 2026 13:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51PC-0007JS-TI; Tue, 24 Mar 2026 13:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1260804;
 Tue, 24 Mar 2026 13:02:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w51PB-0007JD-VZ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:02:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w51P9-009084-Pc
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:02:45 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c28b72-bab6-0a2a0a5309dd-0a2a450a9c60-14
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 14:02:45 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c28b75-1772-0a2a450a0019-d155802fdd92-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 14:02:45 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486fd5360d4so14055455e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 06:02:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871105c58csm19052325e9.15.2026.03.24.06.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 06:02:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1774357365; x=1774962165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sm8ZAXFtaxNLt/VJTmE8EsmmTBmd/BSmvU4fLsZosyg=;
        b=eo7bQNXrV4NqlzyX66fK6z6sGAKCSKJjrlzv/jaxSd7D/JdhWzmsct2HLiXH+r2fND
         epaEc9Z24YjNhvppXWVJnAuDFBtpDmtgwljj8LXsB/j6Wjpk39SPuQtaBdmL4JIzQPgN
         vn//vvFMdo3PWQ93GyTRXOSgt+iwoirKgpEPIFuMqS3hCRwzP+9KW6JKFG7tFHpk0h3R
         BAESvjjVTVnmvu6O/o63ex8TgORtQ8ETi4ZC5KD11/IEbRZTd94eiIND7c7Oo1vYkDBz
         fBF6tfNOHnomCIz9F1nX7jnJR9qwsW2IuvLZj33fMc7RuZBdL998g8/SQQ6Ix7DywhYH
         Z4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357365; x=1774962165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm8ZAXFtaxNLt/VJTmE8EsmmTBmd/BSmvU4fLsZosyg=;
        b=rtfKdfS18PLBtVQxdKlNbjgvhnnEJSkdxYL3ItUPcRLj11A9hy+rKr3OXs0lpnPOSD
         i6vduIcPnwlv7pfeRn3pP3tFH8p2iGAumMBz44zggJyKRLLS5nJp7nKGKhyE11MGJLii
         Evgcf2bJOGb2dcjbgkHtv6IebjeSWRTjOvwEvzxSHQF/wrwBHuQJHB55a7mOFppfb+NY
         CHRU6o5A2+SNeVqQcT/bnl9qbIDysvCu0bNr2mD5b2hbg+ypIuju/03kSnj0mSHFi7d7
         DFBO++RLfIZglkNaZxGDBAMUYA9t6S+URdTnDiYp5z2uPQj6Bmpdd+n4lhAbfAaWffRU
         QVtg==
X-Forwarded-Encrypted: i=1; AJvYcCVyORWiHtXjhg/ksRAJCkrdMZrRKVBQETiyIjfASf/gY+q9gnbnvdYKlxCL4pbZU9iPw/yvNq+Bli0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbKVv77ciRYUlumOQZ/t308qvN+P9K2HSYZzKgcqPxsLRD9mUS
	WZG3n++7v3zNcxDC/tuO/0DLgL2K+2z8AQ3ApcgfJBet9Z2WWMJCAAldpLPcgXcwuw==
X-Gm-Gg: ATEYQzzxtSVWNz1hJxbIwB2Bj8XbTKpjobgW4rj3WfWSL3gIhTHcQt1Ugex6J8m3DFt
	M6n+fBGByk3qXu35G+Gl1IAPrFJRnAVWtF1KKD8NKIOFUDXHOpp5UeDpW4EH7yNEYje+l7ZOY73
	v5eN5lkstg6REFC47gFXuiIeFFq3xsOTA3xY+gNmrcEpwy5gc+cHyjJFUOQeyFPvtjDAYwZRsl5
	bGbvpGsI3oxWvKagh3d5JQAbieTuszIkdVwB5wCXhzSSsmjeuBrfSdvtP47IQ9jpWTmp4/xTzTS
	RvGjnWV5iwdSpy1CIUxuKf+u2rUGztCJLZSLBhjaLIjM4x3aYJpo8TmS4VQowftVnij2/Jzwlfp
	lDtb+CCHkTeKg7UPt4w8uqtp8PjZfRVzGr1YtskKB7f5LjooyVMVa3YW/vOOe6YpBMQ11NN1ak9
	+iajb4sHT2WhR/4zjGSF9UsdZbtfS1+XISSecJeQVHMeN9cAtAZlyNmhO0bLzzLGeTkBoJtK/2y
	kLyej5sk8C5FmE=
X-Received: by 2002:a05:600c:608c:b0:487:1114:d42f with SMTP id 5b1f17b1804b1-4871114d526mr32910415e9.1.1774357360131;
        Tue, 24 Mar 2026 06:02:40 -0700 (PDT)
Message-ID: <5f4f64fd-f0b3-40f7-9026-be9d908e6898@suse.com>
Date: Tue, 24 Mar 2026 14:02:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/kexec: Fix and expands comments for kexec_reloc()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260319122549.922724-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1774357365-BE892900-B0EC86AE/0/0
X-purgate-type: clean
X-purgate-size: 274
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D0DAF308D81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 13:25, Andrew Cooper wrote:
> The order of shutdown is delicate.  Explain things a little better.
> 
> Fix two comments about leaving Long Mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


