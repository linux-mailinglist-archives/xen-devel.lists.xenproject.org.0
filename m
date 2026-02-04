Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB6DJV4Og2k+hAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:16:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23BE3B3C
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220258.1528968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYz7-0000v0-MN; Wed, 04 Feb 2026 09:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220258.1528968; Wed, 04 Feb 2026 09:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYz7-0000sM-JX; Wed, 04 Feb 2026 09:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1220258;
 Wed, 04 Feb 2026 09:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnYz5-0000sF-QB
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:15:39 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ef00f96-01aa-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 10:15:33 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so5220067f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 01:15:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180640f2sm4688075f8f.39.2026.02.04.01.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:15:32 -0800 (PST)
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
X-Inumbo-ID: 0ef00f96-01aa-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770196533; x=1770801333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cdCGhPTiGtrfacaWOBlEp+ZIdv6jnvcgs/nWvePxd/4=;
        b=eb7xVUpNNRqw+VXjQfhFd89qpcqxM172C6fULqeirclTBGcmILscijnuUfd9Avlpw+
         wl4Yc2CmJ0YGzaHMfqU6u2q0S6kTW3NoH76tr25y/j1/+oSKP/lLyPFFuiCDYAQcw1Ze
         WNBPqcAm52Upk6lURMAIebXuOIOFaRu3d0qiCp9Izg+ekhZWHDZyhylmauSOE2jKp1pg
         108Vh8f4eaCLGc+E88cTcJc6dYDf9WD8UNZMUC0+HFzWHu7rC1l7fgf9lr/mndtnGMGP
         3Jg/WAMBQ2TJKNcay6AXfNiaPPaILE6xRdHwZ0Y1d43IAy+cvD4jgcJE/JDsyZEWPtOX
         kcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770196533; x=1770801333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdCGhPTiGtrfacaWOBlEp+ZIdv6jnvcgs/nWvePxd/4=;
        b=EHvy/HLobNVWLiMpjy/UpyTPRoggXIB8fMWVxxIc5PWFbe8Y/4FB6qajcvIOg+3kMg
         6VMfKlTi0Wnx17UfT/Tp5qZ5VsVFUy6sbwLmgBKJKIp7B41xwE3XHSMMLxYVFtQw99XU
         4nvyewczkd9SvynQemOP42LCduZxFSiYsVrtqboUOFBiDu24wY5KjvhfevdsQH1/zK3s
         YTkMF5kGU0v5UkhOZ4/9aANfbSK7l+KLJQOh5KlikzrFrPssVUW1QfT8PgnSZ/ENGRbQ
         CQ0/9hazw5bw73Uzx9RTCKj/qPmmm4vhHejLB8WS+poYRaIiZne9gwC6cbu4HyE+nbAP
         Cu2g==
X-Forwarded-Encrypted: i=1; AJvYcCUw23dX8JE6JAJN+LA66BJ1SFlUjsPifdGmzj8TziWjtaSMOiv3ZwTMXvwOv5fJd9eBedcjIzCrFL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbeW0asjS8LGEu8SaK922UUeVKiW6wXl43p2PBqusZ41ggXB2o
	YDvfW17uR/ud0PO3et0KsknlZYDQ1x+soC4+XtU5/f86/XWZIFb85FS3sfS8ZWV5YA==
X-Gm-Gg: AZuq6aJZ30+xVRTVTKdSXalm+4J/4GkSuQTXqhLScvnrZihZVMK+MMl50dypm+bHuXH
	muT5KbBm/RhvQTuBHltc8kFiSjsbNTb8UVtBFulC/2ckLN96SfiNM6wnYvzMVRkNbHtA/njWaxB
	0Fx0wo9JvotaRXu+a+UnTAqY3n1ApVmZuRyl5DMNxG5yO9VJu+v5WQdSY11WwO4qDKgrFvrgJbr
	v9Ccuae6p0C9osJ478VJJtRCNfVR4MViApvgT86HrjOuA1MNaJnmm7GgF/xXUue5HKEhm06jKK2
	cMTsJ+qFi4JbLhzsRka/YYjjyEvxDAavt2jC2G2nE2PePEYqESNq/VXD2By9mZPRkvG0/POZ0ID
	BaX2qXjSfrpUgUtpxkGl1dymNq06yd22Wl/SBcrrsGJHm2ajhSEPdMrGbpbmUswX7Fc4VbcCNDx
	XG1EMPlayymzp9jjKmGuePMaHvAHMqv95g2yP6mR+I1udatIQ1flNFedpFFppYRTfJLj/LgfU+5
	JY=
X-Received: by 2002:a05:6000:220f:b0:435:a363:f29e with SMTP id ffacd0b85a97d-43617e2fbb3mr3112802f8f.11.1770196532691;
        Wed, 04 Feb 2026 01:15:32 -0800 (PST)
Message-ID: <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
Date: Wed, 4 Feb 2026 10:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan>
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
In-Reply-To: <aYMKk9YtrR7NOKyt@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0A23BE3B3C
X-Rspamd-Action: no action

On 04.02.2026 10:00, Roger Pau Monné wrote:
> On Wed, Feb 04, 2026 at 08:56:10AM +0100, Jan Beulich wrote:
>> On 04.02.2026 08:49, Roger Pau Monné wrote:
>>> Also, I would remove the tools guards, I think once a DOMID_ constant
>>> is allocated it becomes part of the public ABI, and it cannot be
>>> withdrawn.  See for example DOMID_IDLE: it's only used internally in
>>> the hypervisor AFAICT, yet the define is fully visible in the
>>> headers.
>>
>> It was me to ask for it to be guarded like this. DOMID_IDLE (and perhaps
>> others) not being guarded (at least for IDLE: by just __XEN__) imo was a
>> mistake. That mistake may in fact be correctable, if we could prove that
>> the ID cannot usefully be passed into anywhere.
> 
> Even if it's not passed into anything, does it make sense to guard
> them?  The reserved domid values are already consumed, ie: cannot be
> reused in any way.  It just seem to me like more ifdefery churn for no
> specific benefit.

Well. From an abstract perspective, purely hypothetical at this point, I
could see a potential need to re-number them, e.g. to simplify checking
against groups of these special IDs.

Yes, excess #ifdef-ary is an issue. Excess exposure of things also is,
though. Finding the right balance between both can be interesting.

Jan

