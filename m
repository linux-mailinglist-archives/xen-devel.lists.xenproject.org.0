Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK+iIkwnsWkBrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:26:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90D25F383
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250831.1548185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Etr-0004zv-E9; Wed, 11 Mar 2026 08:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250831.1548185; Wed, 11 Mar 2026 08:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Etr-0004yU-B3; Wed, 11 Mar 2026 08:26:39 +0000
Received: by outflank-mailman (input) for mailman id 1250831;
 Wed, 11 Mar 2026 08:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0Etp-0004yO-C5
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 08:26:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0456916a-1d24-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 09:26:35 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48374014a77so163556905e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 01:26:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b65fe27sm38636615e9.9.2026.03.11.01.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 01:26:34 -0700 (PDT)
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
X-Inumbo-ID: 0456916a-1d24-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773217595; x=1773822395; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fR/7Rm1L0p85rks3QrTE23p/0Ae6Xjgc1bPPxxz3Xw0=;
        b=YTOqATIicIimI8ArLpLIlGXXv6YNETQDs28Ik+ZjbVGYENtyXazISp41qNUM+7s+Ol
         Dk0J7dLytMf3n45C8Sq6kEAhwzxxa39LFo8t9CuUCxMVq5UTmBiw+Rqgo+gQD9d0P0Ac
         hW74JkuqBFhdrIedR1C/5tyhmIun+IYnSj3RhMpBxotSVcO0jWAoNUKGaQ/DxBjnKqNw
         nElNIdrqDrKPIhXXKBsEOfAW6Xa1lUxoZsWdI0BVyDxE/76SwLA8JfE4NbCLpXqb4oGP
         skfv+OyS1TkGc0O5uN9pA0ysHtILElHPHPdLnDqOjdpP/BmIDMgGgG36w1YILcxGw1hU
         RaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217595; x=1773822395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR/7Rm1L0p85rks3QrTE23p/0Ae6Xjgc1bPPxxz3Xw0=;
        b=RJJeCHgBnWoSReXPuuJd+35Qce+FCY8ggBP+Sz2dI0YesHhKEuIi2RcFVQi6u5yXWL
         MkdGyY99qhkbnZvc9BI9lAAIO5FiTR2I5uM80Jxm948YWThH8jcP6prjLrj2DV/sxfYO
         VlD9jVBPyg8ss1xOhucQ8PZaHGL1kojz2JKEgDF50G8pOCBAaIq9HZ36Irjb6vYUsQQG
         8Ptwp/fymVRMhrAm2H0cVhNgMxRwWkejsdKliVZZ7O4YENaTUTUCnjibO+EYW9QXpFJ/
         YTDMeF31LpHDdtaOSKTaXwwtY/VIXGReVaWjkxcTojSUOFN5Pko0M+gDu8VSgZYR/Q8u
         tkyA==
X-Forwarded-Encrypted: i=1; AJvYcCVQKerLN9I3g1LJFf363LSof1OZHshS2FVxNWBGiQ7WAeRthSziKV68kI5mMBfLRFGsuIK7BCkBp4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAp7m/YUDteKaPzhNxT7DrwLM0zEuUzYUysRIWFfkZqg+HklkO
	H8tlxLarqCkdJ9FPoXQY6w+QhZhoSdQus6e5vM0w8nI1wYGhE+0RHF3a930wuX3hbA==
X-Gm-Gg: ATEYQzyv9p9PlEPh3S/4JDrKQkZnpTpdbX7OJGzncVpr4Yba4yBQPfTSphIPi6ZzYTh
	L8QlzRhkHk1C7Z2DF4g4FaRW1bm4GEWHOTSAzY6S9SeLXKri8ND3Ga0I2jb9aoQ7aeBB6UgdZvZ
	Ni1Ku5GwzQOodY78KoGXLPROknwzo32PETvIF6e9TCLSgM/KenaE+U6LcKtnTS32CccisiuBH/Y
	j61y6/9NP3E6K0Qn1ACc80qT/tQ1bxwd3M5+IIYMRxQ1L7WWllu7/yLdzAWiVIC/n3f8w8h3Dbd
	gBHGyw2JWlOvmV2oq6gdunN4zGOHNbQfX5S2i0fgo/NtmbsImI1mTSoUTVddCelZMt3m/slTS7i
	SnyHNdlI4lGd0+qHml1gNPddUoDruHPbEnugMg6TH0z2aJ0DnQWOc6mkodnBXyUNMWvDSWLI9LD
	Ss/2BeJWPyiPMlI1hM0O+L5OWrsenmYADP2K03zlTrdO7Q6tuCD0g1a8C/EcGkI+2QnovT0F1VQ
	Xk1kpZcPiK62vs=
X-Received: by 2002:a05:600c:4fd5:b0:485:379b:57be with SMTP id 5b1f17b1804b1-4854b0cb6c7mr25223625e9.1.1773217595177;
        Wed, 11 Mar 2026 01:26:35 -0700 (PDT)
Message-ID: <8ba61374-f05e-45d9-b1b2-0140edbb34a6@suse.com>
Date: Wed, 11 Mar 2026 09:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] x86: Reject CPU policies with vendors other than
 the host's
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260213114232.42996-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ED90D25F383
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 13.02.2026 12:42, Alejandro Vallejo wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,6 +22,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>       prior to the version 1.0 release, and there has been no development since
>       before then in Xen.
> +   - Domains can no longer run on a CPU vendor if they were initially launched
> +     on a different CPU vendor. This affects live migrations and save/restore
> +     workflows accross mixed-vendor hosts. Cross-vendor emulation has always
> +     been unreliable, but since 2017 with the advent of speculation security it
> +     became unsustainably so.

While the code adjustment looks okay to me, the wording is a little odd. What is
"run on a CPU vendor"? How about "Domains can no longer run on a system with CPUs
of a vendor different from the one they were initially launched on"?

Also, nit: "across".

Jan

