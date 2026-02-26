Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPFwHbz6n2n3fAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 08:48:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DDE1A20C7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 08:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241284.1542389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvW6J-0007c9-Qj; Thu, 26 Feb 2026 07:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241284.1542389; Thu, 26 Feb 2026 07:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvW6J-0007ZX-NF; Thu, 26 Feb 2026 07:47:59 +0000
Received: by outflank-mailman (input) for mailman id 1241284;
 Thu, 26 Feb 2026 07:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvW6H-0007ZP-FK
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 07:47:57 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7601fd40-12e7-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 08:47:55 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-483487335c2so4567175e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 23:47:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439927c3e01sm8232551f8f.11.2026.02.25.23.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 23:47:54 -0800 (PST)
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
X-Inumbo-ID: 7601fd40-12e7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772092075; x=1772696875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IwbF7+RiUH4UQwJGoEYI7bH/5ZWSJ7hnNE5Oh8DYeuI=;
        b=fA9j3YuaGoLRxcpEIOK/pvvJXfueidnb4PkQLLDUvA8xqFfyxzNAEnTFjPZPf3gSPl
         dZrV1oUAVC7T+rl2Xk+74WLPpJ9xSplN5P2VlSzsXo0RNA7MB6gLHfHgQQky7x+zTfV3
         LVAZ9nTKviNjkDfjwbC53K7aBRTQPhpMBmdMHgMu8Yo+3Mlh4mKCXPEVK7+05WbnCW+G
         4LmwJEzb4ZFwMJu+Qkikg4U9hF8hYPSCXZyZxZ2EswIlNYHCSLtnRYW3nJsdR3qh5lIX
         YczlcXfHhrFtheal0LfBfereRkbR8lqUoCMhEpgdxsIs846ME/K1eYStXtmb3a+3RwOd
         odsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092075; x=1772696875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwbF7+RiUH4UQwJGoEYI7bH/5ZWSJ7hnNE5Oh8DYeuI=;
        b=ahJIHh/rCQN+XCQz1ofG8e2s6aTAvvdZQRpxydGmQo4qQrBZiZ40ml+m4WJPAJJsSg
         tKgEKjHSdrHel7wQjZ5QxLV/nFnBhM4EMOzJzO6EQqvtYGxsnYvyPrYl9L2GqPd5MHmn
         q8whi6pL3H3OY/V/pENhUYo9/E+EJdwTEaG0lhLkPiOv3RZXTfOl26s7AvBRvxXAjogF
         E4xCUaEN6ixeeDTDFYzUFA+EWthC8djuZBqr5sFwtgCykJEcVR3ltiXd2YJXrp0wVOAX
         6RjL9NZ+C77MY5HJKVysZHUVcstcjRjUXI/JLJNRDdHsvxbG1wEvx73YcXCr9ZOd0bYD
         cO4w==
X-Forwarded-Encrypted: i=1; AJvYcCXZqhJDpNLk+ImcuVM6SIgNpRbJNcuMqFIlMc1p8jxXduA8zRscgJHvu9pVj68guohHlsHwOpXPNAE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzieC7ohAt3ay54/rbNeFMkv0+e7LShamg+dB/j/F0u8OtTlGYg
	FlUnwrghiu9enXmqUziB+uGkFlyZ7/5FfLeKYdekF/G9515Jp9l6RQ74qOf/HcBDtA==
X-Gm-Gg: ATEYQzxKoJ1IPlT62d6KE7nlDoZTm2dTapKs7KNkhMbpzCk/0ogDxXRZhYMdhhdNz2F
	MLZHyK/9an0/t0cN+jNt43zmTH0U+Mp2nZbUwQRibdn5S2NAwQ6lxngyJ0VYtiimgDCCqH+xblY
	pZB9KhsdICAjP5CB2iEOJ13EEwCEW8DY4Dt5XRTxUZGetT0M0dC7lX44vS3hQaSJk/eQ89OWhhL
	plKF4JklpAFNnHDBU/eUv7Qcilph9FHbqpbF0sDX9Dh77+wPH9uTnoNQlemGjcATv9etDcssZw1
	maSJncgDBDrInRRkDDWHTF2fI2rhXLNP0bBvfLm7G4FVfmFLONWd6PCcofgV6MJba0UHI9MyE0x
	SKiRmB5ynPPxek1hE6/scT042qlECZZtMg4V449i+01i034iGwE9vANVy+EQdrhJ4m2vY1/2d3K
	OAYypab740UA0tVM6Ot+jsKNP2ANabKlnlsX2DgRgYCax9IjK/ydTOA0z3iA82eS5+sMJftV5O5
	Csex9ZEs//CJ6s=
X-Received: by 2002:a05:600c:3e8d:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-483a95f89b5mr297289535e9.30.1772092074691;
        Wed, 25 Feb 2026 23:47:54 -0800 (PST)
Message-ID: <c7b3174e-83af-48ca-854d-417fbc3be90e@suse.com>
Date: Thu, 26 Feb 2026 08:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: zero guest-visible BAR addresses to ensure domU
 asssigns its own
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Ariadne Conill <ariadne@ariadne.space>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Steven Noonan <steven@edera.dev>, xen-devel@lists.xenproject.org
References: <20260224231216.6203-1-ariadne@ariadne.space>
 <2aef1aab-f1f4-4063-8c61-d26ae335d06f@suse.com>
 <b4a839bd-78f0-4fb5-a7db-dfc2f4ab037f@amd.com>
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
In-Reply-To: <b4a839bd-78f0-4fb5-a7db-dfc2f4ab037f@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:ariadne@ariadne.space,m:roger.pau@citrix.com,m:steven@edera.dev,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D5DDE1A20C7
X-Rspamd-Action: no action

On 26.02.2026 03:50, Stewart Hildebrand wrote:
> On 2/25/26 10:37, Jan Beulich wrote:
>> On 25.02.2026 00:12, Ariadne Conill wrote:
>>> From: Steven Noonan <steven@edera.dev>
>>>
>>> If we just use the host's BAR addresses, the domU might not attempt to
>>> reconfigure the BAR ranges and may never try to map them with the IOMMU.
>>> Zeroing them ensures the guest kernel knows the BARs are not configured
>>> and needs to make its own choices about where to map the BARs.
>>
>> Yet for this, don't we first need to expose a full topology to the guest,
>> i.e. at least a host bridge, and maybe further bridges?
> While we eventually do want to expose (a) virtual bridge(s) to vPCI domUs (this
> work is currently in development), I don't think it's pre-requisite for the code
> change herein: clearly, leaking host BAR addresses to domUs isn't right, and
> there's no need to wait to address that.
> 
> With that said, the commit title/description don't align well with the code
> change. Assuming we want to move the code change forward, for v2 of the patch I
> suggest dropping the 2nd half of the title, and reworking the commit description
> to focus on describing the code change at hand and less on what the domU might
> do.

That would indeed work for me.

Jan

