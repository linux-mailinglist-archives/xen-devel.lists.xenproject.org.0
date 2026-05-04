Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOHyMdd4+GlavgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 12:45:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359974BBE61
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 12:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299672.1574224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJqnd-0007X2-9K; Mon, 04 May 2026 10:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299672.1574224; Mon, 04 May 2026 10:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJqnd-0007Us-6W; Mon, 04 May 2026 10:45:17 +0000
Received: by outflank-mailman (input) for mailman id 1299672;
 Mon, 04 May 2026 10:45:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJqnc-0007Ul-2Z
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:45:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJqnb-005Qt3-0T
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f878b4-5cb7-0a2a0a5109dd-0a2a450487b0-12
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:45:14 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f878ba-1dec-0a2a45040019-d155dd30dc50-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:45:14 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-44a044cb827so2550517f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 03:45:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7d035sm23137117f8f.5.2026.05.04.03.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 03:45:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777891514; x=1778496314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ozdnvLUBDYRoeiwhZVo7iyYPpMTn3OxsGkSSMKZ/6UM=;
        b=FeqNC0XeiyMlc8sZklwNmzceNLbOOiE47o3Zt0fOcfEWzlrhxOsxr3jtzwdDEaqNk0
         fCmlajdZ3c78+WUxu8Q9I/UM9lyEL0ZmZeLqP7Gw2OCE6cbjZI2TKhBPBjreFa/U5mgY
         I4uDeq+AwMxWtlcCtFTzbamsHBAf4kALYgmTaeiXkCEvahdaMi3tJmxyzVkJ+Kw9zpXM
         TJXHAd6LB03jBwhgpGnQQq+9TX1bVHNm9SjYhcVai80ssuGrAoTsFfFDiZ+vSbZQBFmQ
         KTBORbJ4qtuUDZadgYCEEbbxbf6JF2rE3TD2dnEx6s9vQnNujNQ0pnx5r8NE3iBYOWp2
         Rk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891514; x=1778496314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozdnvLUBDYRoeiwhZVo7iyYPpMTn3OxsGkSSMKZ/6UM=;
        b=sYjw6TuJQbZEQV568dwdf0njyUGaUpy/gz0TCScZGq8a4NdyoBpTHd5iaNVrLuyz7R
         YnluI7Cf95RL1DvFW95YenYIonilVnCCQ6yWerVjPj3Z5lK4SqFduNK7840JNfrdaX+u
         c5e6ixtioV7mlAsfBHraYyY7qDkcTngKN1eF7lPVNgZnYhX0boCpuRvi/v18NbPVjZNt
         NFY3H5/YuzTupRtwP52bgTRYRgdkLe6+P+jXmwHkZIsw+VUoQ1D4miFvPMiiRxnpYMy5
         pRLXakOtf8UYqOFwGVLHUVhyCppsI0N/Y/iwdMpZLsZntaaqTYUaoGpssw+dpKYK4KCJ
         /9nA==
X-Gm-Message-State: AOJu0YySuntRwjyV34XBMzTJY/JU8Ha0B4yercZyGIYd3W5W76gEPC2x
	84YrT9ASMapzdz+c/pwYJ8ia3ZzYlod7TjrY1j/kCao0NE5zNj5L/Nx/Et5HIBAvyQ==
X-Gm-Gg: AeBDievOY9aTlUr4Q0jbYyBYQaJe140Na/J1XfdK9X3cyFjHRvuNu332jytIJlBrp/G
	witjjnNrDTDK7opuqdLBcCsDUVRan3/bmj9FgmT3EsMVdAnfEqwGLn1GISyaCtV1++GA4iN+7Y9
	XzSSZfFNbKj/hqlN62nCM+8VHgvGLYiI2KxVYOhHfn6EHiXEqJs4vC1AsKOfd6lI8MGqx6ExMRw
	DvchIIoCeE8LeDMl2ZgEJAlirmdjJlaRMD5zhnCrz0D/O8s5rYFuTVn7SxfdaFmEr2RGhOvOuZo
	THidAk1klMVY51MZwnaFkDAVEy5hn3rw85pWPK7iiU67fPzF3XNsThfIKfvkKqbCI7WzvuvclL2
	Ax+lKF5L+aM5dArlAmUNowdhUnfO0zbuIN1LpgNR22xOIQFdSvQuzLWawIi/a/POtnzQAhaLVSF
	a5nX1z7wBUFrmJvh2pzJEx7gw++aR+jPTZK2hP9TeNcp8othDJunf/MDfTxjZrnm0GlLyEdIw5O
	4T7wJ4kV8FTOCseJFfaQc2vew==
X-Received: by 2002:a05:6000:220e:b0:43e:a8ad:975e with SMTP id ffacd0b85a97d-44bb66d6554mr14946138f8f.27.1777891514027;
        Mon, 04 May 2026 03:45:14 -0700 (PDT)
Message-ID: <99756799-27be-45ae-99be-eae5b0c41a11@suse.com>
Date: Mon, 4 May 2026 12:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Thierry Escande <thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <afBmWSFsyrwy_Ru1@macbook.local>
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
In-Reply-To: <afBmWSFsyrwy_Ru1@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777891514-2B96A3FF-1F20E47F/0/0
X-purgate-type: clean
X-purgate-size: 1038
X-Rspamd-Queue-Id: 359974BBE61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,m:thierry.escande@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 28.04.2026 09:48, Roger Pau Monné wrote:
> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>> This series introduces initial Q35 chipset support for HVM guests, based on the
>> patchset at [1] by Alexey Gerasimenko.
>>
>> Basic support means that this patchset allows to start an HVM guest that
>> emulates a Q35 chipset via Qemu and implements access to PCIe extended
>> configuration space for such devices emulated by Qemu.
>>
>> Support for PCIe device passthrough is not implemented yet. This is planned but
>> implies modifications in the hypervisor and the firmwares, mainly for the
>> support of multiple PCI buses.
> 
> Why do you need multi bus support to expose PCIe capabilities?  I'm
> not seeing the relation between those two.  You could still expose a
> single bus on the MCFG table.

Can a valid PCIe topology be expressed with just bus 0? If an endpoint
to be handed to a guest isn't root complex integrated, would it be valid
to make it appear so by putting it on bus 0?

Jan

