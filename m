Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKv0Gb0sd2nacwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:58:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80F85AD2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213401.1523878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkIQJ-0004ZR-Ua; Mon, 26 Jan 2026 08:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213401.1523878; Mon, 26 Jan 2026 08:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkIQJ-0004WH-Ro; Mon, 26 Jan 2026 08:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1213401;
 Mon, 26 Jan 2026 08:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkIQI-0004WB-Jw
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 08:58:14 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 248ddba5-fa95-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 09:58:12 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47f3b7ef761so30150975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 00:58:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d8a5b2dsm278946605e9.9.2026.01.26.00.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 00:58:11 -0800 (PST)
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
X-Inumbo-ID: 248ddba5-fa95-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769417891; x=1770022691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dRPe7PdyVz85WO6LjcrmpjwqGpEF32GvYnuIXwFCzOg=;
        b=hBD6ry2Fpz2SLNXpDbqzTxiK8N/UFy978qVmQQifr8jzQL2uljKlowZbSoY2JcA/MQ
         ndlsK6v/FelvUXSIkMGSVm24dmJgZcH/k0d7uaeIxEGovoaBRgGM9cv66Hm3DXwg7yLd
         GZ2eFUhGnog8eOD7ZFSvomRbuK/ZH5DQKTjITusDrZbqln8qkxpoF+L2kEWgTVGHDtwF
         2FWPuBtX2vtNQvbPxRL3Ea48GkXCJBi2TST94t4uR8E0ollYvhonxsu8ge5MTsgRuD3m
         tDK7iRio2gOVThIWHLZUHhVWOgSQ5JaWyUqVtz9VWOc3CVI816HaZDfEI+O3gu+j4yCv
         AJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417891; x=1770022691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRPe7PdyVz85WO6LjcrmpjwqGpEF32GvYnuIXwFCzOg=;
        b=Xziq+6cBRD7+Cw30eXW9j8SSJcOT2kuoJVozdN0oy1mH59h0hcRrGpiU3YBbpyisXI
         ECMpEdXt74vzX4LsBP2ib3c7uedooKivUwJLGOW8U1hxNHaSdFEvS/5GRzs/XcgoQJYv
         5HI81dC7QuJSkgXTNzATiiQfW8qxWfLxNp/bxhFtjtzPyy4lfkKNNubu+F0r+MHkHbar
         o+EBZyT2e7cr+uzJbqhpjXATUhu9iZPNKBY6SwLWwaKzgB1zBq89UMa0GCeaMqGFFgO9
         Dw6k8/TD6/D7S8KIlzyHW2LtmkLr3LJlsLDGt6gkmhwT8m/blvXE1Q7BzD3/GNzXwzYQ
         IKGg==
X-Forwarded-Encrypted: i=1; AJvYcCV6oeLHkeEOF5mbF26tIIFut5rwTloCrpw+FMTeTm00JBqpEkEqAXbvywufx9nXFahKzgic2u1OTDs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyioQ3IqwY1LMuOHyeEuNpRnoetks03twwVi7yt8uSAhp9m3f8D
	Tx9EhnqV3vJrIQoTkl4nx6DFszueeEi6E84BTyxSSysP1t4c9kAsGYiiRKOLsXqWMg==
X-Gm-Gg: AZuq6aJiSgAGF6VPZr6KAZn9a0T1h8iZFoC5A4MqcpR+6O6eBgu2HmFdK0ppViczKMb
	CyLSed7FH1jjSkWx5T9T+9nkDIbVAGAyal5ZLIwQpQEGDFFesNn2MwhUHeW+cR4IxWhhJH2ndfj
	q4x1H4m8IWSSKovTFIBP8ihKheOpRWvYhSUAFGKJlSIefCbh9IsvoTkr8CohthlsTk8mbTKzBFa
	pb6FrPKBmZdO0WdukPr52kq9KG5sD5iDhabgdtcEjMlKf2FF9UFZ/m7Pz+gM3/0jSQ5knxyK6of
	AE9huuoDubzo5RzYOV1yEiECRD7imvNNa2NZzOlAJaaEqQ6qqiE3IiM+hH705Ryq4SWX5QxtWBk
	QAZevXrcndejTm+7lGM6PXC2i/7U0QrBIGDMIdECd+RHm7PxThhuuJCgNWr10vHaPM6sZeI1ABQ
	5uEsESKFIfoSxzYOI9grxDy9hDv9a6nzk0T/H1vGASby0kwo2Tgmrg3jjhvNjlNcJQYAv1I/+T3
	rU=
X-Received: by 2002:a05:600c:8710:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-4805f65c091mr46488935e9.10.1769417891387;
        Mon, 26 Jan 2026 00:58:11 -0800 (PST)
Message-ID: <553d1a7a-e465-413f-a60f-32455bbce621@suse.com>
Date: Mon, 26 Jan 2026 09:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
 <fd509fbb-9dc4-4619-847f-6edd2a1bdb7f@amd.com>
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
In-Reply-To: <fd509fbb-9dc4-4619-847f-6edd2a1bdb7f@amd.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CB80F85AD2
X-Rspamd-Action: no action

On 23.01.2026 23:24, Stewart Hildebrand wrote:
> On 1/19/26 09:46, Jan Beulich wrote:
>> Legacy PCI devices don't have any extended config space. Reading any part
>> thereof may return all ones or other arbitrary data, e.g. in some cases
>> base config space contents repeatedly.
>>
>> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
>> determination of device type; in particular some comments are taken
>> verbatim from there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Thanks, but see below (as that may change your take on it).

>> ---
>> Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
>> exit path?
> 
> I don't have a strong opinion here, though I'm leaning toward it's OK as is.

Maybe I need to add more context here. Not short-circuiting means that for
a brief moment ->ext_cfg for a device can be wrong - between
pci_check_extcfg() clearing it and then setting it again once all checks
have passed. As long as only Dom0 is executing at that time, and assuming
Dom0 actually issues the notification ahead of itself playing with
individual devices covered by it, all is going to be fine. With
hyperlaunch, however, DomU-s can't be told "not to fiddle" with devices
they've been assigned.

With the yet-to-be-written vPCI counterpart changes the window is actually
going to get bigger for DomU-s using vPCI.

For hyperlaunch this is going to be interesting anyway, on systems like
the one you mentioned. First, without Dom0 / hwdom, how would we even
learn we can use MCFG? And even with hwdom, how would we keep DomU-s from
accessing the devices they were passed until ->ext_cfg has obtained its
final state for them (and vPCI reached proper state, too)?

>> The warning near the bottom of pci_check_extcfg() may be issued multiple
>> times for a single device now. Should we try to avoid that?
> 
> If I'm reading Linux drivers/xen/pci.c correctly, my understanding is that dom0
> will only invoke PHYSDEVOP_pci_mmcfg_reserved once per mmcfg segment, so in
> practice it's unlikely to spam. In other words, I think it's OK as is.

Yes, it ought to be no more than twice, but that's still one time more
than strictly needed. Hence my (mild) concern.

>> Note that no vPCI adjustments are done here, but they're going to be
>> needed: Whatever requires extended capabilities will need re-
>> evaluating / newly establishing / tearing down in case an invocation of
>> PHYSDEVOP_pci_mmcfg_reserved alters global state.
> 
> Agreed. The current patch is prerequisite for this work. Hm, perhaps we could
> create a gitlab ticket for it?

Personally I'm not a fan of gitlab tickets, and just in case no-one else
gets to it I have this on my todo list already anyway.

Jan

