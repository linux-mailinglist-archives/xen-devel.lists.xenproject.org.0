Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAiQLQZ2pWkNBgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:35:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502611D790F
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244198.1543660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1Ya-0001OU-Te; Mon, 02 Mar 2026 11:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244198.1543660; Mon, 02 Mar 2026 11:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1Ya-0001LP-QH; Mon, 02 Mar 2026 11:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1244198;
 Mon, 02 Mar 2026 11:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx1YZ-0001LH-PT
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:35:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e614f806-162b-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:35:22 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439b6d9c981so618980f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 03:35:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75a523sm26519437f8f.19.2026.03.02.03.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:35:21 -0800 (PST)
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
X-Inumbo-ID: e614f806-162b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772451322; x=1773056122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WJyBeGqzIMoxG7CgU0XCO3cXTmKg85QI+6wcIlFdMno=;
        b=MLgvt1pB/4Z6oENcuLNw/dE7XK00txv+LKUj5jmX5bTvoWKKl+qVWQlEinegov32gr
         l6VCSYKx5v6giV+OFwRdWLlih954vqs659U91XLHkFEbVAO0rp5uD2vzn7nXjVE8O1pJ
         OBxNm1oz32AA/s8tVMzMVBEesgKkh5Sji81OhtEbMkqo7Ibd5lmJpTsW2+Qw3z/2xIHr
         2J7KRXwPe73Qgq6wWOIAs7Z0M5TLzNZKqm3M0solLoTpFbjCUfhV3KJg7WVhGEliTqyN
         Asgi8YemWeFUn9R8geOm4OQmL+J66fXohC7u1JytKsIRdIg1+frNt6JYgyIvQn0Ruish
         XVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772451322; x=1773056122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJyBeGqzIMoxG7CgU0XCO3cXTmKg85QI+6wcIlFdMno=;
        b=rjhsKBG9NiaJZRj4dPnlsjmTmGLGaT6ttNQnV6I+HXFpUoGt8cVE2rCjdgS2k+6bIN
         ox+xRoOV6ZMgs5hQj3C9ccqzbSF3rka2l3QGUIzXt3MCoFGfPwQmEf2ebNzxlxjDWSli
         HVXe46lvT3YqK6m3FNWaZWqn6mN1Pc0hcP+5B/w0ntZp4m2PtDKHGO+aymCSseP2s0D5
         TdWTqfkJNKNFK/k0BKuFMqX/KHyOXncO+CPl9ntK5F1zdMBVrsH0t/n0+62v+Xayo+5e
         L4Vxx+rqOrWVr8fJseLF7+dG0QXmpsbKYxV9huDxuyIPxbS1nGFP5jqfHAruRFK7ObtG
         sgMg==
X-Forwarded-Encrypted: i=1; AJvYcCWHpgmmDK/pgg55HiPAoTga1f32NFBaeHtf0HtJXoQIS3zAvnsSB/RYGDNU1zXjt3wVf0ww2OCPN8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRGIPGZJ/NGXKowiwTug4JESjTLUzJtlv3iVWpbWLGu8BQZoVf
	DaBJU8P2/YDeUlxBbE/QiVnTjmupEdQkPsZ6GRAN0iwtPlOktqHFAOOzPxLh2/A53OB3acW3z2a
	KVnI=
X-Gm-Gg: ATEYQzz602DVUf+vkioD7IgLqq9Mm9EiJeQANrd0oJwe2el02aZ6XI7u2GgDGU5NJOf
	rjUTbIW1fcH0AxFkCGN/wFy5fzokOYVlreHnMDcBH6y1CIPEGccsC2xgmgcQQSReuC7Jp56sY0u
	L8IUpAWm2zE6/wQBQzDxvk9ajhJgQnAqO7ECtXobAyf7zo6WQMXfSFSJXqJ6bbeplB+Qxx/m6EC
	Fs6wyCph0R0ym+rIb0gfMiNKm2Hw1upuBe1U2ArbaG2XDfxK4nGkdWVaYxq4mrr04lgFYfTReKz
	vHkzWraG2kvEDE0QMOFwruMwfdIDgkyDfst3ttN/ouBL+BxJhb6SdrDiQq7Cg7DZH3533mzCd9/
	Kk++04fPwiDuOTGAQFcK2M6QGi5BVQClF2sfDjzmGl0xYKyVXkBlX/7asncUsjMy8iEHVRu4cCl
	nI4xHWxwTe9qoxe77OZhb52pCLM1sD9/JZeQUO9Dvrgx0kjoq6yfqC6nNt8DU/0glDr1WRjsN4D
	hxt1UL1Xa0sE9M=
X-Received: by 2002:a05:6000:2903:b0:439:b5d4:249b with SMTP id ffacd0b85a97d-439b5d42936mr6785019f8f.21.1772451321845;
        Mon, 02 Mar 2026 03:35:21 -0800 (PST)
Message-ID: <75710720-f2f1-4b2a-99e1-b5e3ff0191fe@suse.com>
Date: Mon, 2 Mar 2026 12:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] x86/boot: Document the ordering dependency of
 _svm_cpu_up()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 502611D790F
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> Lets just say this took an unreasoanble amount of time and effort to track
> down, when trying to move traps_init() earlier during boot.
> 
> When the SYSCALL linkage MSRs are not configured ahead of _svm_cpu_up() on the
> BSP, the first context switch into PV uses svm_load_segs() and clobbers the
> later-set-up linkage with the 0's cached here, causing hypercalls issues by
> the PV guest to enter at 0 in supervisor mode on the user stack.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


