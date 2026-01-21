Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BU+GJeacGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:21:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6354454
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209497.1521481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUOm-0008Ah-Mw; Wed, 21 Jan 2026 09:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209497.1521481; Wed, 21 Jan 2026 09:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUOm-00089G-Ju; Wed, 21 Jan 2026 09:21:12 +0000
Received: by outflank-mailman (input) for mailman id 1209497;
 Wed, 21 Jan 2026 09:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viUOl-000899-Ix
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 09:21:11 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f596f5-f6aa-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 10:21:10 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so3815840f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 01:21:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435996540cesm4270963f8f.43.2026.01.21.01.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 01:21:09 -0800 (PST)
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
X-Inumbo-ID: 85f596f5-f6aa-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768987270; x=1769592070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vfjQgxm4n9abxdeNdftR2RZkYcKEtwary1CnpBEn1Ys=;
        b=TeEv5akJ7xudRW3KEX/bAiQGNgwdWJJfReJSZM7YbBdebgoR0qqDoPwy+CplDuG6Kr
         6tCNLzU7pq4STXGLNdX8SE2Jhinmximb/dNMyUOsXrYTntyhjXPqMTw04RTVJ92QdOA4
         IVCxvD5g9vLUIICIQEZ86B3f1gax8td4zfkHqFXJYlQSjZXAODe6/4VTazGmXrpYEdhI
         55gmWrsuqav2NC9xkyux1vKFiRn5Nncx1cIVOrdmG/NkJfUqa9xXGiRyjkgbJsAcqrPP
         z8ZDeGCsHblDXB0pIjr9yHUQ4BYG+jTFAI4q3vTS09QF1gHdBQZaoQy5RpG7f+ihOYSH
         HLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768987270; x=1769592070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfjQgxm4n9abxdeNdftR2RZkYcKEtwary1CnpBEn1Ys=;
        b=fA/cZaFTWSU1+j2RWi1Qbp9ZwxRw94SgbvCEj8D0VefemO8h+7rXAHe7nCg1Fdfkez
         6A8iBkmDpl3V7thGJ0i6IshrBqIllrCb1PUKSe3Rrbm+2qrc0gkva0RLEVZwBrcJi+5b
         go4VDTMZ90ORn0HFKVWSbQlVzpQT2HX/O2FxC/s2mEWcTgYc8ECXd78s6TMM7lHlujqr
         xhuEu5GfWlGOv5mym5ypyC1hAxUr1JYpHwOfr9Z6l4z4tOZ2lIsydgHkUJA0IJ1Pipeo
         EDR/0Zhw8cVEucVZa100YNCtygoYVC9XtTtPcYApTYHHwV5ZF2tbmXqT/YO8bs3qYILx
         6uDw==
X-Forwarded-Encrypted: i=1; AJvYcCXorIe4KHGGIQ6feoySJD2v1zTVYdJmRtAv04BPnJIQ7Xv2S16ksl5pIcuD65Cc5LFlk+c8K/UgdRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf8mB3pQ/5Y7FPogW4pJwbTRizhgcsGV3kMqZJwhuJvpWowm0P
	eEi8haU2ZleSAgWW3ZubKzQsBwwsvoYId6hbsuBWBlR3nlMrOfIVs6UHeKg72U/hzw==
X-Gm-Gg: AZuq6aKE2dyBU0ss5O8VA9R1cRJNhseu9CZf+6Z1PacXI/tVYZYN96vKCDXYel+qbQJ
	8Jn3g8qR1IpRNJ3As8oAlb1YD0qjSYL6wL+pCHNNY5dqxLj/k9CnXqzHUWUsjmLxmr0EbULHCEn
	EbDFUhjdoti4LzmqoQ2l9fx3uC/vnUsQ5F1nwj/OEw1TZpUB/kszb1rEvK8c2b8KLl3EPtvJoQX
	WZ2R3Jy9JlHMiQkYTDJWeBHvKNf+BI1Y3OfaB2dXWSKXSz6XntDCCcsXCzpOwS9yBArH1R5o9cv
	nt9Cj00zLfSDT8bhKLcFwCXoh0uXEgygaRfPHZcuf4ITE+bWA7z899TbxMVZynOr2Kh9+hJm3oI
	6Bx4HMX/3aSQG2E4sX3SpI5XjcgdycU/zaeelfSmpn3a+YELlfMyW2DW7kl5mrHRbh54seki2NY
	MKja4X241yhIbiR0cBDMdO/1wW0BHp7cX3dt/gYHSgeFe47Kcs70HpSC8JOzTYFL1wLAOjajGGl
	k8=
X-Received: by 2002:a05:6000:1aca:b0:435:a135:7776 with SMTP id ffacd0b85a97d-435a1357a1emr1158004f8f.61.1768987269660;
        Wed, 21 Jan 2026 01:21:09 -0800 (PST)
Message-ID: <7cb0a7c3-7f00-4bf7-8d2d-88e46d9f23cb@suse.com>
Date: Wed, 21 Jan 2026 10:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260120185904.979992-2-dmukhin@ford.com>
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
In-Reply-To: <20260120185904.979992-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A7B6354454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 19:59, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Remove XEN_CONFIG_EXPERT explanation and also correct information in
> the entire "Xen Hypervisor" section.
> 
> Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - text correction suggested by Jan
> - Link to v3: https://lore.kernel.org/xen-devel/20260120071654.640873-3-dmukhin@ford.com/
> ---
>  INSTALL | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

Yet sadly the A-b was now lost. No need to re-submit just for this, though.

Jan

