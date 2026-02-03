Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIRYAPwKgmmCOQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 15:49:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9CDAC9E
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 15:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219306.1528196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnHi6-0001sV-Kp; Tue, 03 Feb 2026 14:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219306.1528196; Tue, 03 Feb 2026 14:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnHi6-0001pN-HM; Tue, 03 Feb 2026 14:48:58 +0000
Received: by outflank-mailman (input) for mailman id 1219306;
 Tue, 03 Feb 2026 14:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnHi4-0001pH-Om
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 14:48:56 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 766c12cd-010f-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 15:48:55 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so62931115e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 06:48:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e135422csm54707659f8f.40.2026.02.03.06.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 06:48:53 -0800 (PST)
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
X-Inumbo-ID: 766c12cd-010f-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770130134; x=1770734934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wdCti2raCx1gj0+YLaQgqOFLLWIOWdnaZK8UcNpQmkg=;
        b=CDNrQDlB6ZcqgW0Sj7yApeVcOg8hcxDh3e9TZO7fILLL3UG8/ez8B6GrFI0GOx2jOo
         ZeH75prI7PTKzZ8F3JNcXDJ9O3W8blhr/kf/3ljmj3T4KmA5S0JEQnXlQJaGZX4wbmNh
         AMb+lsSS3pDR+ex+kEQSrbfvZFUn7l56PUogw5f5uXkOjb+5AAyT8AlqTVqmYMEQq/Q2
         tqBAMqu9yv1XMFyUKAHZqotrIvjjguWV7ruCvkTatqEUQ/Rddd4KSajj1mV81yVvthXN
         hHTHDrz3b3GlDAPqU46grdoikN4hvSg5lPFOCoFwpgnzWYUjUQDVeiPrTzcNN/J1eOkR
         6LVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130134; x=1770734934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdCti2raCx1gj0+YLaQgqOFLLWIOWdnaZK8UcNpQmkg=;
        b=gQFEeICHL+DpWXl2WPVulqymQW8o2vnbLI4lTuzr5Cr8xlrEVmr2sLo6jhGz2KSblA
         V3y8KMFqRqrL1hgISbQjtNp66XmpE3iKsqppIpF6ExHe/OWsYHIgMGcTO2cFtSNvp0d5
         1bx20XgEuSoYjf3qW9uZRFoYkatr8y0eOBvaBpewgv+dl7917aTpuwUnURjJd1JSVnM+
         4N3TDtl6jUb9JQWkkHIKU7Ylz1ZVkoJpIww67w/QoGl8LLRAVPvD0mDSGxT4qmID1+VO
         rxcADnMCM5PkIa10A5/d8VUEKkcaq0TA1WEhI7MzkSHnZ+TfQsivNIwSskF9sFqz0IcE
         6pbg==
X-Gm-Message-State: AOJu0YyoHeA4Vq7EtWzMJtHrhYfSxWC0YZOeCFk5gBa6yro5ZqO6UVAl
	mHitRHytY1HI6xgyBJaS+WuMLJ9nwQLw8MI15J3J0gIUzeoLDPXvDeOPl3NDG0z/Lw==
X-Gm-Gg: AZuq6aJoR0dQ56PACt8PQySONHvf/DXCnZuTEubcjt9t/QZKjNz34UCGlp4s4g7Px6p
	IOoKLFUx6pHb8Pr3tF7bnbbDxbOVUBc8F+N5/fxNHdO4G2j32Iqq2Ti6FVj7OUtwAVbEd9HhVdx
	sKo1vmKxNkMKhmKRdEQgaQdYSjWByqBimD78t9g38iOpRJWj/TjwsD/2hBho53c110pyw0uV2Xx
	415MgWOEPK86nm32/iAzTN88GfeAQ0+FL/8j1O4eTAVXPM/RnwBF34Mo4GErmCjkDjICHHkZC3h
	GpTrHdOcVmpmTP3Z5U2NxgwNjSc2P6OsjIKBw8o1O45XQlNBWPfgv7/keLSdQGxSHYpBmSo69MU
	DW+poTdbdVDRyI1Y6aDQKAsYUwu98Z2NpDy0g2En75GOk/NWmS9rVtOVcxHL8jAqLmk1O9cz2xL
	ERbc3aXImzoNAvUQ7vMZeu+MnJ4PYBPJkz4OSB2byHhCE9WinraXgZxPg0XcAsZX2UPRnDNOPlF
	zc=
X-Received: by 2002:a05:6000:2dc7:b0:432:dc23:368 with SMTP id ffacd0b85a97d-435f3aac762mr21792523f8f.49.1770130134329;
        Tue, 03 Feb 2026 06:48:54 -0800 (PST)
Message-ID: <4913d9b3-03ec-443e-b908-a1531dca6699@suse.com>
Date: Tue, 3 Feb 2026 15:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
 <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com> <aYBq2EoeP_TGv_sK@Mac.lan>
 <1bcdd2dd-9b2b-4eb2-a569-e28b03c1e1fb@suse.com> <aYB4z8CSA590Ytpo@Mac.lan>
 <da490e92-c8b1-40b3-83ca-ad77dc2defe8@suse.com> <aYDAUCVdk_2qGa-r@Mac.lan>
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
In-Reply-To: <aYDAUCVdk_2qGa-r@Mac.lan>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 48D9CDAC9E
X-Rspamd-Action: no action

On 02.02.2026 16:18, Roger Pau Monné wrote:
> My copy of the PCI Firmware Spec v3.3 contains:
> 
> "4.1.2. MCFG Table Description
> 
> The MCFG table is an ACPI table that is used to communicate the base
> addresses corresponding to the non-hot removable PCI Segment Groups
> range within a PCI Segment Group available to the operating system at
> boot.
> 
> [...]
> 
> 4.1.3. The _CBA Method
> 
> Some systems may support hot plug of host bridges that introduce
> either a range of buses within an existing PCI Segment Group or
> introduce a new PCI Segment Group. For example, each I/O chip in a
> multi-chip PCI Express root complex implementation could start a new
> PCI Segment Group."
> 
> Together with this:
> 
> "The MCFG table format allows for more than one memory mapped base
> address entry provided each entry (memory mapped configuration space
> base address allocation structure) corresponds to a unique PCI Segment
> Group consisting of 256 PCI buses. Multiple entries corresponding to a
> single PCI Segment Group is not allowed."
> 
> Given that each segment group can only appear once in the MCFG, and
> that the _CBA method can introduce new segment groups, it would seem
> to me the spec does allow for new segments appearing exclusively as
> the return of _CBA method?  It does read as if hot-removable segment
> groups must not appear in the MCFG table.  I'm not finding any clear
> statement in the spec that says that ECAM areas must previously appear
> in the MCFG table.
> 
> I'm not sure how common that is, but it doesn't seem impossible given
> my reading of the spec.

Hmm, that'll be a bit of work then, as Dom0 will also need to propagate
the necessary data into Xen.

Jan

