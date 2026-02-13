Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIvdIFHfjmluFgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:22:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36183133F7A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230317.1535815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoRb-0004JZ-HP; Fri, 13 Feb 2026 08:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230317.1535815; Fri, 13 Feb 2026 08:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoRb-0004HT-Ec; Fri, 13 Feb 2026 08:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1230317;
 Fri, 13 Feb 2026 08:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqoRZ-0004HN-Aw
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 08:22:29 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20fb6559-08b5-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 09:22:26 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so424426f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 00:22:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796acffcesm3600287f8f.37.2026.02.13.00.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 00:22:25 -0800 (PST)
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
X-Inumbo-ID: 20fb6559-08b5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770970946; x=1771575746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=snVsBvQZ+6p+aT5/q7pnYalZywwGgxqAPe2Wj+e7hrY=;
        b=K0WzciUYAsZQXAVzW5bEbb4w+stogmnz8MUjOGLnvsiI/yImpLRUfDiogCUqJCSO12
         J3mN3gS9xNXCD1jfQRRdXSB9ODGdC+v5jC1siBjWen/8DBwj2sZPUHY6EPbPl8Y/ffDF
         XCIBmYum7SoHre8uF7B5eU4hD0LZpWdmt5yiYr4VPxBT668dy4DLRlWAId8ockxQVjjt
         5mKrWp26VFZPD8bxTqvVupwceNTahjuL9goNybZzPTJwn2A6KT28NJt2sYwkE6Ck81Yp
         A9l/E8tL6hqJCRJVc01hoTLbqj3td7OMJVD83WZ3cOqUn+i4P6IMPRNjIL8z3zr6qSnu
         EWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970946; x=1771575746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snVsBvQZ+6p+aT5/q7pnYalZywwGgxqAPe2Wj+e7hrY=;
        b=GlQgL/SfPO0l737ceMtiggmoQpQ6JZSqr233JPFMiy1gt1yYNerpGniZ2t0C+Zlw8U
         qA8LcBbig0XXJOBTPMZ61lH5/TYPuXFVgVeFOOkoJCFFP7exquNKka8Sm1pTcnRxE5Mx
         c0YxETp2O9xo1IOKcgk4PjwyYle8hK0cUdLob64guD7AlfOlLvf6+vvt3/uq1B70Tv49
         069i2jdD5JbyO4gY8pZd5QaqcWGgJgCeOMNe3sqpdBtKNZqdg6eJDINjBC50l3ehZX4O
         HbW7RTXCzJvtgAc/I7+eWRl0o5PEHRx5Lla/yn39eysocQ/SHtgdMoTd9QB6i4IpHKAX
         ZP5g==
X-Forwarded-Encrypted: i=1; AJvYcCXhRAG9qMetTEWXlpleAkuGRCeWBKISJTsNpZ8dsi9ErB2S6UEK0+iXmXZ7NSFob+PBGdy/cBYY+ZU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt86JcKN9pFOVUZA/mnoQj/rcYCgED1j5iveY2h+hqkO+NEa/P
	dUytKi41JR0JPk8vG9kYDmOF21n6Kx7tEPqIz75M0g/OCQW+bk+hqdaJgoFir5XgQg==
X-Gm-Gg: AZuq6aKj/ze/KOAY0idi7MgZhnIXBHZruHVtSoarHo9GfaySTXhuNyjpLQt7eYYMfWY
	v+Rwk29ys1z2kNZDFtoiaZYsLsKRuJvlfprNVaM9+ew0zxumLKTnn2oR5urJiCnAD8osqTTb7u2
	kDA/lRineNqS/at0ntiuDhbrNySGef8choshRe0ug7Ua2PJL1PUl1Gn9jFLT8/FCUXQt9iOmwgt
	JDtxBJkUN/Ou50dwZrz/20kcEwCmTmzIsYRZC6TxvzJ5cNJb+xfw5l+DtuQWx5Tmzt9vzeMmULa
	XZ1Fz69xra55fgJcy2YPFS2ajCe3c+95ge52W+chzYBvcA7FWGgV8QqU6fl1p8hWUu+6/td6iYy
	F8dYafFRuZOg/Ui9ARmqwCUcmy2V9vnelITA8rylwHqqGIWOMNRK6lCd92L/TJ7ieCmoBdC2YOR
	VvB/T9qfsiuFLw0p6qXNOMnMc2L+aaLkIUi9Hpit+E//iiSMpsOISOf6O6SvQcyQ1tQTznE5TnC
	Ja7IT+KTn6n9pLN318TnimufQ==
X-Received: by 2002:a05:6000:2503:b0:435:a43b:2dde with SMTP id ffacd0b85a97d-43798032626mr2047167f8f.15.1770970945619;
        Fri, 13 Feb 2026 00:22:25 -0800 (PST)
Message-ID: <1a98f22d-ef9e-4df2-aa87-585713cd3989@suse.com>
Date: Fri, 13 Feb 2026 09:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] darwin: expand cross-builds to also support x86
 and testing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260212144618.43200-1-roger.pau@citrix.com>
 <61a3f852-915c-4d9f-8dde-01d000aa4fe7@citrix.com>
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
In-Reply-To: <61a3f852-915c-4d9f-8dde-01d000aa4fe7@citrix.com>
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 36183133F7A
X-Rspamd-Action: no action

On 12.02.2026 18:58, Andrew Cooper wrote:
> Also, during the final link steps for xen.efi, we twice get:
> 
> [10:09:57.995] Warning: relocation to r/o section .text:00000048
> [10:09:57.995] Warning: relocation to r/o section .text:00000090
> 
> which smells like the multiboot header.

It is. These diagnostics are seen only when older ld is in use, but the
issue exists in all cases. It should really already be on someone's todo
list wrt fully secure boot conformant xen.efi, as we did discuss this in
the past.

Jan

