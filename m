Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCVRAGZUqWkj4wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:01:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0420F330
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246392.1545585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5VP-0005zP-Rd; Thu, 05 Mar 2026 10:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246392.1545585; Thu, 05 Mar 2026 10:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5VP-0005xA-Os; Thu, 05 Mar 2026 10:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1246392;
 Thu, 05 Mar 2026 10:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy5VO-0005x4-9q
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 10:00:30 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23c27d3a-187a-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 11:00:29 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439c5b40f60so1605059f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 02:00:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb3666asm28701775e9.14.2026.03.05.02.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 02:00:27 -0800 (PST)
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
X-Inumbo-ID: 23c27d3a-187a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772704828; x=1773309628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jcpGEgEdNDn1d5L/htnJMQZXZeNQSDK3grLyRzw5sBw=;
        b=X5VkzwoCZsu0X7YHTHsOaCqZioLZht6XLeX7TSU0TkJdqgR9WTW5pXfuIRcTCFSF2U
         JihFogfrTIW5nrk56iQOGaY/LswEVW+ivbO4fcFRdS62fT9HcjywFXBrNh8iCVSZxan2
         3g+TqR5+AROEO5SbscyYSaVPYDG0XgDmL0KeX1ulS+L2DiTlovFGRwsIILVG46waCxVy
         2IDYz78mA0ZQ/nnrZlPrVawSF5kSiPUoqVwumFvC6L76jHkfIeP5BUITpUpUnAIJGG7a
         1fegjESRTFBvRxBprYfBz9ODiZxMlphvEr6+p6M+wKA34Fgr2IWSV+14vDuQd2weho0w
         V5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704828; x=1773309628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcpGEgEdNDn1d5L/htnJMQZXZeNQSDK3grLyRzw5sBw=;
        b=FNt0DtiYo4mOV9RUYa03jgbOXrr4fRZSW5FaVNBshP0VvWKJ1qAF2bYYkrVtrdS3rn
         Tr1AgmFvVvFk7AG30Avs+4vg8tHuqGKhAjszFwViRl36/vSQskxs+gfDMxmlYUMrBPqd
         TiuCA5fj4qkkIA5KPaIB3wr2DUCxmPurkzpzK5ISXnFdkGF1VtOT5K9nID5lbKhsXVVw
         wEUKLCYLpJDEM8+OK/2iCzObv36SQufFpHNCAPuNJK7btVsHtjuMB0JV+u25ULD8TQvB
         KArtfnkrgEDVUNQRkmK4DJxewtDqxZvqrUJJgIxYhWOXpvsT6WEcubNDQRilLsOs308n
         IdhA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ178/ne2Olyh+LyMNlBjogGqeJDqMZGdPNz1gTquO6FCbaaQVEBbCa6vuoMKxENfCtSxrywXdkIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywrd0oFxfnoPIdEYTIplZtk8+fpR3VpEW4LGhtYkPhuynP6guRY
	o9mxv+3LBtr+UR8oU/A4OiczAXjrmag+jR7RdboUzs/K/Rp9jcIfoNpPRBmJUvAhK3J9O13V74u
	xHIo=
X-Gm-Gg: ATEYQzwXiWwLiugUcXS/hoeZ0NLx2orOhFrL21q1aEpeqpREd+aQLnxiGgUAmJpxdXx
	y/At5EvawAC+CVGWy1t8Y4p29iL/opdvtTb/tUHrQPxunbHpI6h865pLuGt5j9HTxzV92LN3NSU
	m4WUGX7wRydKYE0skJyxJU5CU5KSZqnyPnAUxEYSVXdG905tbgZsgBfJlUszVFzmMP4vrYMnLFB
	xRIc2pYsT0Y3rNHMU53+uq5ASqzvViia3unkFD9MzKd3TKTFsjDaYFTpkWX15I8POUdPhXDiKbO
	jzpUT9Bv0aiDik4sSfEZe9AGl0f0+80tOJJ8uWsU7dMME+h9ofKNUg8E3yn8dHuoPJLNTq7bcdl
	rIL28f7ADMkYStESd3y0aXt2xpZH8kyGFn6eneTD/rabgCaBhlPgKMt6IGrPk2nTFnLfc8QGUVW
	S1HxRHKrI9GFNUqti+3IecpQVqIsUGtTWbNRah3F3zFLLz+yaWRD3ClZGkMMtHadaRhMERq6yp6
	wt/TnjxyWKSFcI=
X-Received: by 2002:a05:600c:4454:b0:483:702f:4633 with SMTP id 5b1f17b1804b1-4851982700amr76787235e9.4.1772704828280;
        Thu, 05 Mar 2026 02:00:28 -0800 (PST)
Message-ID: <9e873ced-59cd-4e5a-91d9-375e7cb2798b@suse.com>
Date: Thu, 5 Mar 2026 11:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4.1 09/14] x86/pv: Adjust GS handling for FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-10-andrew.cooper3@citrix.com>
 <20260304171826.45847-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260304171826.45847-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ACD0420F330
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:query timed out,roger.pau.citrix.com:query timed out,andrew.cooper3.citrix.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 18:18, Andrew Cooper wrote:
> When FRED is active, hardware automatically swaps GS when changing privilege,
> and the SWAPGS instruction is disallowed.
> 
> For native OSes using GS as the thread local pointer this is a massive
> improvement on the pre-FRED architecture, but under Xen it makes handling PV
> guests more complicated.  Specifically, it means that GS_BASE and GS_SHADOW
> are the opposite way around in FRED mode, as opposed to IDT mode.
> 
> This leads to the following changes:
> 
>   * In load_segments(), we already load both GSes.  Account for FRED in the
>     SWAP() condition and avoid the path with SWAGS.
> 
>   * In save_segments(), we need to read GS_SHADOW rather than GS_BASE.
> 
>   * In toggle_guest_mode(), we need to emulate SWAPGS.
> 
>   * In {read,write}_msr() which access the live registers, GS_SHADOW and
>     GS_BASE need swapping.
> 
>   * In do_set_segment_base(), merge the SEGBASE_GS_{USER,KERNEL} cases and
>     take FRED into account when choosing which base to update.
> 
>     SEGBASE_GS_USER_SEL was already an LKGS invocation (decades before FRED)
>     so under FRED needs to be just a MOV %gs.  Simply skip the SWAPGSes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v4.1:
>  * Extra comments

Thanks.

Jan

