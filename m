Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMwLH64vnGkKAgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:45:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0487175122
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238980.1540366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTQp-0002qt-CX; Mon, 23 Feb 2026 10:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238980.1540366; Mon, 23 Feb 2026 10:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTQp-0002o7-9I; Mon, 23 Feb 2026 10:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1238980;
 Mon, 23 Feb 2026 10:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuTQo-0002o1-Ku
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:44:50 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac281a9d-10a4-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:44:47 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso4164466f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 02:44:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00768sm18491437f8f.10.2026.02.23.02.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 02:44:47 -0800 (PST)
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
X-Inumbo-ID: ac281a9d-10a4-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771843487; x=1772448287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0TlhNjOCRZ75zuXEhNR5Mm6Xt/RDefNpKdfSx0XnpKg=;
        b=es3s+RZqAwW/3+1iU0EVtmIECzTr+0xpQ5fYghGryQ0lDvMjoFWYymh1jmym4bahqK
         /ueyqu5HrvS8BHdeN2QPuHhE9NfKm4dE5RCbfc8XIWjUF/pj7kRJEFqLrgFJD+/dNfO2
         nZrdfZTR+ApV/Gp8azc1OiVVPbRMQXZQF/brPd7ihMaVr5X04pmR/dHlagwSRrq5XvKY
         GX7SQZbAjrmeTay3k5WfkQOkTiXOLwUH/XU0nJ7PX4pkKdDu+nD/pjsq70xTXKJawi81
         RbcvpAPv4izjz0ChodayRxFeKMUpk7bIP3Q/xukiJzXAsR3s1AMXf2scUQe2ScfLtemX
         h7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843487; x=1772448287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TlhNjOCRZ75zuXEhNR5Mm6Xt/RDefNpKdfSx0XnpKg=;
        b=ng3xXDqFrHSB/vfRzsT/iVGB6GF5VFMUE2a7VtPsgp/n/TgMrREHKTQoy6XfWaP0oC
         6IBhYaAFMNbSImQs61p8FqKxqB4hvg3uq89HwiFe4o8awP8RgWy+yLMvbOBrcaBYVjbf
         Ff7a/XdP+OLZodibVuJKZD7+kgIgiQKv/uuzx5bKb7AGw8bSh2CsyS7JEZxcsopE3jqp
         YquK0vX8Nbk07AvRVunu9IsW1JLdnRsCndUeTDCkW0/R7tTq5rgx68PDNuivN9PTpnBa
         euqe+FSI8YObitWvGFFF9HI2tcAE6yVulYBrbHCUumz4UJypvJkrRbgH9Fa6mdX9gzJY
         96ig==
X-Forwarded-Encrypted: i=1; AJvYcCWTQMHtZBpMGZajsufuWe64vaAy7qph0teXlWxKOshEFSNnTSbLiJvAlMC6Ug+a4AgmVDgJsPNCCtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMHsT8BGMURIHc4U8kG+8o67RTvd3M56q0tCtZw9T6Qek2QENj
	4/aZaUnTyIkmZOA/TSqCVZtzTldPkplv8TgrEvCot4DSxIl7WWw8ntFoBvd28YffgQ==
X-Gm-Gg: ATEYQzwhilj6XS/TaibYiDPEcXU1QKTqih0SqwMT0l2r3Ju/0aBL+JEY68xJtGymnM5
	PPve83UqFyrj/f9XqSEhCwreu1JxP7xTQBNpCDuKQENNfhfbUghJHmfCE2loQIKXFHysq2t6nZe
	s7p8OGboccIYZ5X3ZnZTPOMBTjerI9URWAJo00qQynRQSoRqOqNBRD4DPqFR4KMxQhaD37k46Lz
	vN5OdYx1KRNgggd3xd3T/Tf2mtETfuJVsxwVs3Zv4/4rAvmuXBCAA9CkQPYwd2F34g0VwjBr/Lo
	jV7ak8rv/NL2FczSGG54bXonimkuzwR7QoAjt57JJ3nEP1BEID/DD1qddTYWKZliB9shiSUQeL2
	Ea8nKBk23zcmCS2l/aI5Yzq5t/z5p/cwsibHY2F3HtFmapp2JcKSG6BY9iCyNOVAvj7NhimA1AH
	GH6pbHEBaH6+uiYG/ndQp/GeM6PhY1MhjyXhX07SVrOhGsaTq9N6u7oB8N/hGJXYe7WcjcaqGku
	MBq/c96KAdtrmc=
X-Received: by 2002:a05:6000:601:b0:432:c0e8:4a33 with SMTP id ffacd0b85a97d-4396f15b30amr13550355f8f.22.1771843487501;
        Mon, 23 Feb 2026 02:44:47 -0800 (PST)
Message-ID: <828c24ce-fb40-4469-80cc-0c8d8f40159a@suse.com>
Date: Mon, 23 Feb 2026 11:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] xen: Include suitable headers to make declarations
 visible
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260220214653.3497384-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:mid,suse.com:dkim,suse.com:email];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E0487175122
X-Rspamd-Action: no action

On 20.02.2026 22:46, Andrew Cooper wrote:
> A range of functions can't see their declarations, requiring the inclusion of
> appropriate headers.
> 
> For pv/mm.h and pv/traps.h, this requires adjustements to become standalone.
> 
> In pv/mm.h, swap xen/lib.h for xen/bug.h now that ASSERT_UNREACHABLE() has
> moved.  For pv/traps.h, pv_trap_callback_registered() needs to see a complete
> struct vcpu, and xen/sched.h is not something appropriate to pull in
> conditionally.
> 
> stack-protector.c can't see the declaration of __stack_chk_guard, and fixing
> that reveals that stack-protector.h needs get_cycles() too.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


