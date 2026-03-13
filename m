Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IqHKjK8s2nEaQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:26:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2F27EC56
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253332.1549606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wun-0000CX-UU; Fri, 13 Mar 2026 07:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253332.1549606; Fri, 13 Mar 2026 07:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wun-00009j-Rr; Fri, 13 Mar 2026 07:26:33 +0000
Received: by outflank-mailman (input) for mailman id 1253332;
 Fri, 13 Mar 2026 07:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0wum-0007rC-7Y
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:26:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4f66194-1ead-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:26:31 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4852fdb36a8so20774575e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 00:26:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4855778eda8sm22431495e9.5.2026.03.13.00.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 00:26:30 -0700 (PDT)
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
X-Inumbo-ID: f4f66194-1ead-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773386791; x=1773991591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UaB+waiIaSfCog6i3FZ0eGm06HNKC0UMQUfwQujiN9o=;
        b=YrOqHl3v29aVWBZG6+PE0MG+sfno7qreue8G2vS+g2rKaFCycCefCJU1jSdZasX6yW
         BwhcJUU5rRuFMYit2MYL6TYRicXM+qWwZQpaiyLm8y39Hxrf0Jv767WrS6EtBZOeOiyg
         npR5lT82eMLx/JHnncL6FGoHgiKinqayb6O8TeoGsjNTG6jQ/5UwcqydW2UuDESUhyU3
         c1IOLLgzAx75D6CwS2TbiVblzy+r8BcB6OpI3botav8J8cOl6Cg9dEhnTKntld9AQbWs
         gyYITw6C2jiRhgvEs87gIAg2HAkfRNv//37dmELlrs7OeQE/SrHRR4OVKXgtin38E+/N
         Fetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773386791; x=1773991591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaB+waiIaSfCog6i3FZ0eGm06HNKC0UMQUfwQujiN9o=;
        b=Tb/sHXt0EWJ49b2U3OVg11sAa00eC1ioRSOZ+NjuQd+u6mceIB6cNn0Rmu34e1cpTK
         wtVaUzacfC1fQjHhOvWvwx9PNTivLtDZYUmsGdYMGdeQKjJHuoj3ZBhOlG2uhcskQLD/
         fZ0fbWJeUX2u0IIGQa7smxiEyLI/LwiYNBwmXFx5NeOK4avYP0hkr8P0bCcw+8962zAP
         +sKrX0TeZjb3tyh/bt+1fUUTblemHg+Sv3N+70ggDXvh7TvYnXq2mRHIQWw4qX3UPTA5
         Dnjg9rJZ9jZGB2eO1quWxqdKh9SNeEOSvxUkLKheuog1MxHzs8TPBgusxBlutcmgs6Rd
         6msA==
X-Forwarded-Encrypted: i=1; AJvYcCWcS1VntyEsNbmyGkaFTsbFxO3yOyMjsoVj92WeA2QRqtAh+oL3dR2GrS0EEv0qNZ/e963pI+pkmqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRPjjwa7A0Grjmkr1cX7cEVM5vISLEppZojoeis7exkZHpD66a
	XWi55RgOOF2U/Mf9ZHXXQxn8KHj/0ucBg/ABipbWZdsE/vgTAZJlIA7GeJldZMRckqSi4OwUaoB
	GBPA=
X-Gm-Gg: ATEYQzxgXmMMQEcEGAZHbUCIFtnW+E9a7SG9L5/oNiKxcBHgTPVeM47jSNBayEDb7eU
	yvHv2XxaexYk8mYMinvP9BD/skYHYNzZTexjUjUySTIKisMElz7NMM2zOiR2rzLdagaAa+o17Bw
	XAFOLDFbFLlSH09/dC6VzP7HXxj1ujjvrmXCZeeWlXAPEXKwouG3xqN/naK2KTYLze6l1yXdWIw
	shY7Rd5YMHCuytSJ2saHFFX5uOhz6QBrc8EMJyLSq4fcI3rx9z4tQdw2TtIZ7/0iDz3BxfWHUgN
	TiDUZgXJbVUtbfIlKx+2zeY+lANMApgxhDED6wPU+BIaW16rU45H9MD5dIbG1ln0CkW0qB5+bJq
	fIIyEnwEiBqjT/goYf2CsiMXVNnN1wTP1hSle4/envk42WZfy9nYb6OFHHNdzkNqHn5vxtaHYGQ
	gfUTrSM4UPLjE7ddMI00YZy+Ag3y/jzARGJ6P+WZnYqV2O/OHDfURTft4/+Zv1kG8nsuPA2Yff9
	7A+Vyk2GsjkjQU=
X-Received: by 2002:a05:600c:3550:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4855670c971mr35017985e9.29.1773386790872;
        Fri, 13 Mar 2026 00:26:30 -0700 (PDT)
Message-ID: <62266ed8-6c77-451d-8a73-c0d29308f56f@suse.com>
Date: Fri, 13 Mar 2026 08:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v2 7/7] x86: relax some CPU checks for non-64 bit CPUs
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-8-kevin.lampis@citrix.com>
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
In-Reply-To: <20260312204339.740403-8-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5DC2F27EC56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 21:43, Kevin Lampis wrote:
> These old non-64 bit CPU models are not supported by Xen anymore so the
> checks are no longer needed.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

I think this wants to move first, to resolve (avoid) issues pointed out in
earlier patches.

Jan

