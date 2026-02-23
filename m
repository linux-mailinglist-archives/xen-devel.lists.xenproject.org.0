Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGjtJshunGmcGAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:14:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0517896E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239111.1540546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXdJ-0006tS-9d; Mon, 23 Feb 2026 15:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239111.1540546; Mon, 23 Feb 2026 15:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXdJ-0006rK-6r; Mon, 23 Feb 2026 15:14:01 +0000
Received: by outflank-mailman (input) for mailman id 1239111;
 Mon, 23 Feb 2026 15:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuXdI-0006r8-4S
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 15:14:00 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45d4217a-10ca-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 16:13:56 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso35312545e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 07:13:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bc068sm260719455e9.4.2026.02.23.07.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 07:13:55 -0800 (PST)
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
X-Inumbo-ID: 45d4217a-10ca-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771859636; x=1772464436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wkhmGt4TWE2SKq3tb9T40CDM03PY8BcrHvmPENa1U1g=;
        b=VwZBuj3osBAHmGpqfMy7HsBgDJCIo8hsvVX5wlMq0B6Y8SuD4ihdYcKni9Kc5qQBl0
         SjCKujnXG2lB4US4mkfjZpr3KdTeHMATm+ZnN+jOceWYTwUnfA04i9LZMAWGCCQyvIK9
         33mF3NjAG+T8LB6WxreoAtkHEv2wxzjN/nb9jDRMtgKwoiLC17HdVsIPerLrUyO0AodN
         ou+/01tv/pDlIym2AfQ+pnEbHjSKrWYIkxcz8fn2g5/bXUY+yM5QIj8ir6cOfdVMym9K
         rxmBq9TFGthB2y+mFDDl80gRPm1JNS8c6AG7G0Qi/1RFIm670e/NsQfwfQlFXj+88An/
         Ke9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859636; x=1772464436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkhmGt4TWE2SKq3tb9T40CDM03PY8BcrHvmPENa1U1g=;
        b=qw5yXJHvCYwIJBjCp5uu/lH2BrGlBQP6QSygbHFFcLKSxuQKZYeNTSf8DR9tMmWznE
         U3WUUkqKemi2P83mrQ9zWgzBrnsZLK5v0u5nBPdzpWOtQcg9Ec5P3xjOD5V01QsuIulC
         ENcsyv+udPseZ4dTRiS9WsfvRTzSMJYdhOaueVGkJ55QrRgNneU45Aly9q3R6Mfd78Pp
         DBgh9F0WKeBKXZDpLQO3+UQNGuvwEIycAbrqy+N6xbqwxq9EsACD/d8uXicQ97kz4fg+
         UKfqEtYQD5J/OdCBWpPP6h7wWWWmIfWwKol+FvWSWL+hNu5YmLUPBAfrjBE007HCbtiJ
         gzcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Y7Ml6wm+dQcNXc9HlW9uA84bh24xBuRfIOtzomTjvjZ8g/9mSdBu7ktWmyXukA07/hPUFdIGqX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVI+2iAvlOR6p7DPDz0R3+nhUPKWpVW0R0Z5C7tStw/drM4ISy
	sounYm5AoQfK8ljBdIZe7MP96RNIeHGGSFeSzWMCcAx3XiYPeK15Y4h+2pYY39F5iw==
X-Gm-Gg: AZuq6aKrpxPaL8jAtxMhQcXxi0JQ8HtL5QhoO0M9lIB811WfUdqIlNkDLKL7eEB3fBX
	5FwPicSb9wSdL4ySu3qtUjSjA4+DFw60HdI6I3JBToRcmj2QZxQTC1q/uCworhU2SJZVPPSrqwe
	0CsX9IZcxjLQNmFHLWHGamOtjQxDX0QOaa7eqJXZusQTZJNETePpQfn3tAcXOPqeNvBDBBiVDY6
	x39wy5XXsJvSkEXrTOxRo3OOhTPi9AZaifmRHcJ+Pkza23y9ffgURxmEcQKnFNxxUbTcT/kj3jK
	p5InyBTZR8pTxMJIaW3O89IrAeszRJRfDebjzG4TUrSrjndWkJa75Yy5hm4JixIpfJ4d3lZW+bm
	N0ibJYGZP8Xs5hKI81lbmyfoAxaQ/V8pvL35WZ6LGKI5xD3fKFjSH9O763UNNIBj7D8iOg0sa0h
	4wqufnI/lVlmBWoBgBKBSLdv4fe62wYb4ghssX+Zcs+OXY9WyQO3evEA66ikcXurR1kf6wf9vZ/
	B3XfUqyD6ju0M8=
X-Received: by 2002:a05:600c:a00d:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-483a95bf2f3mr156342685e9.14.1771859636185;
        Mon, 23 Feb 2026 07:13:56 -0800 (PST)
Message-ID: <4d0d2163-367a-4d6c-bf46-9f58292e1baf@suse.com>
Date: Mon, 23 Feb 2026 16:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: add p2m context switch handling for VSATP
 and HGATP
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <5756356294dc066d835269334d0f3347fe24cec4.1771504676.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5756356294dc066d835269334d0f3347fe24cec4.1771504676.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0EF0517896E
X-Rspamd-Action: no action

On 19.02.2026 13:40, Oleksii Kurochko wrote:
> Introduce helpers to manage VS-stage and G-stage translation state during
> vCPU context switches.
> 
> As VSATP and HGATP cannot be updated atomically, clear VSATP on context
> switch-out to prevent speculative VS-stage translations from being associated
> with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
> required order.
> 
> Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
> only when required (e.g. on VMID reuse or generation change).
> 
> This provides the necessary infrastructure for correct p2m context switching
> on RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


