Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLsjGJIIn2neYgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 15:34:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286D198CC7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 15:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240808.1542068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvFyJ-0002j3-Gd; Wed, 25 Feb 2026 14:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240808.1542068; Wed, 25 Feb 2026 14:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvFyJ-0002gV-De; Wed, 25 Feb 2026 14:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1240808;
 Wed, 25 Feb 2026 14:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvFyH-0002gP-TW
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 14:34:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b929ed7-1257-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 15:34:37 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso53050775e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 06:34:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7507adsm83617765e9.9.2026.02.25.06.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 06:34:34 -0800 (PST)
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
X-Inumbo-ID: 1b929ed7-1257-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772030075; x=1772634875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iP5HgEAXpslH7lN6fSaLfG7kjbgS78lSt+LYK48Ahpc=;
        b=dzNJzxsxkSs3lPpN9tmGO9ukpQ+zsyFjyz+sZfoBsCSrtNS+c7GWItJLLU4jq0JbCR
         jBh9jMi2onBk1ts2mDTKah7oGVdFwSvHcOF8j2syQPVWBbL+K5Oz0/6nBXb2s0HN2xo8
         76AwFEcP/SVvPN7GT0pTbu7kZ2b90EFA48kSXohxU4/UXeiU2VMKa75m0HmeJ5PwXgxE
         yBFdFqaIbLQHFU/iSJR6uYt5hvlb3DxLnI4ohv0enr5Lus46XXiYx0D5YB8zHlu2h9+G
         DWrQf6mSn8eevsPu1zqm+/H3WDtV7hVunbWs2x/11UCNX6mBLQMq0YlhNzT4NqMU04Kx
         wTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030075; x=1772634875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP5HgEAXpslH7lN6fSaLfG7kjbgS78lSt+LYK48Ahpc=;
        b=IKcBYFOXYSVqeLN6Fq6zRc/HoiIi2N+Gda1kxqI9mbPyUSYcRZkEdlq+e+R0J2xXlD
         5T9gq+/Z6MBjy5WBriQ/qAoIsNY7deFyQesN5ElegPbKQ49S2ZozMqzgXwr1iQ0u9Rml
         VfEnn2hrH+SE5wpNzGGp5iNLWx6V6U3Qgp8SjJ6A58gaS1m+VTWFSnc6+DuzfTsKaTLX
         4eKYuOIJQqj1iNNzTc45gc7ckEv57fgbVycOcf5IuAULmmJ3EJeS4boDsMIt+fbrQK84
         P44K0M79IJail1Uqm9tVn52OwGt/RiWR5tBlwdCqHLNjY1rNv5bhdG8sP+bjqBYfJnVC
         rhfg==
X-Forwarded-Encrypted: i=1; AJvYcCU1sTduN8ParPcLlU0XFwRtUUtRy0lOFoFm/E5RLVMIZCIxQeLnouEHQT5bpM67xTeCYYt8DX1jdhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrX2QoRuIRRziN7p96FATQMvqFcQeXifxCE2evu880MbVsiVX5
	SMLnNqhyV5ulEGeGKRUe6HzGju1BdUOsmz3a7QO5huNpDTeR0PCple4gGTMYBAQfaw==
X-Gm-Gg: ATEYQzwc54++aApPBF4LqjMUbuhbJyyXEtZ/+L7YcEq1oN8wpNULGyoTHneAtd6LYYq
	9hqMjt+zmq3Z8kienCuGI8hrmibugz4SsLyrElbBYgPb7Qs4q47bPp30E325RdIuZRet8P21/VS
	C7gfD+2RMhOxV4Jctn8pRvKFh9/XurUQYT1bQ9hbvIRn2vipKzvFqz0n75Rd38PNuA5wEGGVnGN
	8rQGu2cgmp0TduYk0tOO4Dn2mLyz06SKc5HRrKNXAG7Kpxx4unCajsdl8zFPrZgYVk6M+5bnf9e
	o61Sw2L50In2fNaIn7dJMsv942CCpPY9QWMyRUI49/7hvm+kmB9Em7j2NPcQB8cdUgStogaVcSh
	kG1uQ6QplhEH/GlMS0u7drHHpd5afbsX7507RmjTerc/gKz4Mvt0pF0UV/VgofnDF/tPY6qqznE
	Z548lre8vuGkjp56mw+7mTom7aZ7lvF67OjV/D5aOQhIVzg3FicVx/D69EtiY+wspLxB8RRLAMg
	O1hdEwayW6o6sXJXvY+0HkCyQ==
X-Received: by 2002:a05:600c:1d19:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-483a95a9d86mr260901575e9.6.1772030075226;
        Wed, 25 Feb 2026 06:34:35 -0800 (PST)
Message-ID: <46a711cb-1853-44f6-a9a5-4d6252a8a995@suse.com>
Date: Wed, 25 Feb 2026 15:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Remove claim that INVALID_{MFN,GFN}_INITIALIZER
 is for older toolchains
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260225125940.3804137-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260225125940.3804137-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1286D198CC7
X-Rspamd-Action: no action

On 25.02.2026 13:59, Andrew Cooper wrote:
> This was never because of a bug in GCC.
> 
> C requires that static objects are initialised with constant expressions;
> _mfn(), as a static inline, is not and cannot be made to be.

Of course, and I think the comments were meant differently. What wasn't possible
to use (with -std=gnu99) due to the referenced bug is apparently

#define INVALID_GFN ((gfn_t){ ~0UL })

Now that gcc5 is our baseline, do we perhaps want to use that and do away with
INVALID_GFN_INITIALIZER?

Jan

