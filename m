Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8jswDZftTWrjAAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 08:26:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849B37222A1
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 08:26:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MaMbNmob;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356622.1611196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whLjX-0003jC-IP; Wed, 08 Jul 2026 06:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356622.1611196; Wed, 08 Jul 2026 06:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whLjX-0003gT-F5; Wed, 08 Jul 2026 06:26:11 +0000
Received: by outflank-mailman (input) for mailman id 1356622;
 Wed, 08 Jul 2026 06:26:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whLjV-0003gN-SS
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 06:26:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whLjT-00FwJl-4l
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 08:26:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ded7e-5cb7-0a2a0a5109dd-0a2a4508be7e-2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 08:26:07 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ded7d-edec-0a2a45080019-d155802eb928-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 08:26:06 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493c52cde9eso1994005e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 23:26:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f3676dsm118096255e9.5.2026.07.07.23.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 23:26:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1783491965; x=1784096765; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PScbhrhXgRMKOyxbzM2AzuElAiWNO91fopZVnqyuhA0=;
        b=MaMbNmobWEar48YJw9686KyA8VqH6XISSHhNQT7RKNCjNCxk3hL76KOW8BxeRHRTWa
         3ZzZootj2f4PHFqvSKC4Ecn0iB7+OreKgazicK7T3hFi+j4iUK12DPZq1YED6t9SkKdY
         DOwrYwV8YDkymwjYruzTB1LiHq1+MzM+gTVwRIUefj18K3pESKFXliczzfik9hmpjA6N
         yjQeMcCY95CsXB+6v0+HXD/7FxWmSUFZ2CtMJ/YcVYSFNGSx7VsBloO+YfxOogLXByZf
         7l53kQvp//BqxauTlBmwyRu7G/OoLKJuY34ibt8OnlbbtjSuuMF32LwPTijv73SvLkTZ
         zLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491965; x=1784096765;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PScbhrhXgRMKOyxbzM2AzuElAiWNO91fopZVnqyuhA0=;
        b=ZK2zD2jG8JkU07Z6lXALgrLsR6KpOmMBVHoumYil2mjqUfAm/BqnfYRg6Kd1BBR/qK
         D59b4NpbVdGaldppZVYfh3nYfpEqo6zqyajB4xkt+Hkp63/lDaK4S8Kdh3Y/9+9r/Kw3
         PY1K4PfrdOV75YQwQN09Kxzkm/HL6r/KzuF6AUYkdVbjpzBn8bd2I45IYLTTunnB2BYO
         PmXMGEOe35Mdi+ifNduyOKr0HzNfFLTsbkcywn8ijJ3CINLKxBoFkPfDVODzLgRSSGlm
         kAeBFAoJuxWplj/nrHzYuFputPnae0pTp7Gr64r97uNAiLMaPmgvsz9hg+qqgsa9m0dU
         6rxQ==
X-Forwarded-Encrypted: i=1; AHgh+RorYLnb/cezDKjhWMvAXVKSgf6/83IO25GnhWtVwxk8IkH4b9aIe9pDGikzEu9xX29CZKO9rjcco6U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQON/4gw71Tmp88oAeqFXwAuloJOtFnI6BfTaj2PWnKaSBrbau
	pJUAniw+Jr0LRdC8L6JEPNcOB74r2wEiPc43FIg8ETiyksbxtWUinspNUcTqGQOerA==
X-Gm-Gg: AfdE7cm0g3r70gZTVh5gm4ksFUHRZOeMncikRvq3c65VL2AAYi04P3N4xcNEhfpuhFU
	OSpAiz98xmAFAdcHrP1mEz2gOR8AjQ9c+kNZ0CQsp0FR0WQHhSCTOpQLBa+hPiDdCV8F4Scz8lx
	+/V21g9Eb4tJOXpPG5HbNAnS14o/zqzyVrQ53TfzJjck0Hc7kYRBTc3J7R1kM95CG4WK1nxEzJy
	1bBFiNQcmvKbmHW2Oi11VdTON31FIAPr0soAammIYJ/xziYrAYNE/j695AwbP6+biq03HEFCXGH
	CVRz16Ty2ezGu0FWZhNa+jDVJfMJI1N9h4qY73rD1VF2G+FHYVhDB385T+mk0FfjjRtjj5KBeOY
	/vCiRSU+x3GBZ+nF0u7KvrAvXgQo3IuK85Qt0nRpJTj0YsdfhUcFeIXDaKhGk8b8Uw1O0/fPf6+
	pv8fHRjHWbvYyZ7GQA3HZTy1vGKy2gYtL0V0A7/QRLnFN92Dv2A/SrPttxoNTbg//ArdGCew9Ig
	D4VQ2hTc7lckUU=
X-Received: by 2002:a05:600c:8284:b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-493e68ec789mr10428095e9.35.1783491965696;
        Tue, 07 Jul 2026 23:26:05 -0700 (PDT)
Message-ID: <7b643c30-b0e8-4e62-ad8c-1814e0ebb128@suse.com>
Date: Wed, 8 Jul 2026 08:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1783491966-40F2A3FC-8939D467/0/0
X-purgate-type: clean
X-purgate-size: 609
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 849B37222A1

On 07.07.2026 21:49, Andrew Cooper wrote:
> The APM description of the AltMovCR8 feature bit is:
> 
>   "LOCK MOV CR0 means MOV CR8"
> 
> Adjust the decode logic to behave like this.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
on the basis that ...

> v3:
>  * Change yet again.  A contact with information on the matter confirmed that
>    it is a special case for Reg = 0, and not a general modifier to all Reg
>    values.

... we simply have to trust this source, short of this being properly described
in the APM.

Jan

