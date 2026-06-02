Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tPEHBz/HHmoMVAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:06:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D562DD42
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QgyX9cMH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324849.1590341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNsj-00037W-Ob; Tue, 02 Jun 2026 12:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324849.1590341; Tue, 02 Jun 2026 12:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNsj-000369-Kt; Tue, 02 Jun 2026 12:06:05 +0000
Received: by outflank-mailman (input) for mailman id 1324849;
 Tue, 02 Jun 2026 12:06:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUNsh-000362-If
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:06:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNsg-00ELhD-V6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:06:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec727-5cb7-0a2a0a5109dd-0a2a4502d39a-16
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:06:02 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec72a-af86-0a2a45020019-d155dd2ad19d-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:06:02 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-46019b190b6so639099f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:06:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354bb7asm32074616f8f.20.2026.06.02.05.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:06:01 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780401962; x=1781006762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/o+yF/WmsNIypxEOwxKhA3kYvOWeirGVYBTl2uDRZPE=;
        b=QgyX9cMH24qZ/A53sl0oox5cqISqb7dFD9JVpJOg+Dbj9q1WW6kCljXgWY3XuiXm8k
         odMnaB5MQ/il+/98Ccc6Cb2AHv8tfGnXQtOa5BZARe+HLY8xGI9MuhLdFN3XapjHTYHY
         nGAJN+HV3igZ948PkmHgW1fIc83zt7xWpWygBYolR3mYJTy26Itfv5aB+6vrj06Pi2Lv
         Qf9q+T/6lL4CDyOTUZJ9B21mKO3LUKYJNk3cE3G/f3AKrolQZriCUeeRnlyj0Rpph+aG
         8qDr0bI7NkJXti5bWETumRXOcAZ4t+6n0o20YymM8C8MGtNC55urij+ADZOGgLhpb4YB
         y5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401962; x=1781006762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o+yF/WmsNIypxEOwxKhA3kYvOWeirGVYBTl2uDRZPE=;
        b=oYEin8M7+EuGnyFftqbglW/+NibfGorCbBiUBYDIJNSObXreQ3q165ZrsjgdD07qzt
         G2b9v8WAXxkFRKGq9UnE6ruF2urQDShfgE/bQY8M8NXmRccIYGKAbNKoF31TaFadJp+s
         sID868y6i0ki5hE0pT32Itpv6wxV9mgR9l+YvEcqs+6+Pq7b4MGzmmYrDqwHnCBiDHs3
         mEEKyyzAwFPQV1I7p0uCc8BvR1/kZaZS3+lfkIVuUFYatJlzVAhKzpfemqgU4D1CcZJq
         6Yt50up4o5a+QIO3KhQhjBZNnFbfoGKX02jStDaoOExTVpS4NiVVk66MbpWJMrgJ03aV
         +bHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eQNEzvkCTlH7nCicRCRhae9dvEX2uUWbHDeys6ssO6thmuStMrODIGhxuwgBm8+Pq4ms1u1gK+d0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1fO5yQMWR+L/M8VzCvASOk0NTpumS8oSYrRXxkNJJzSjpkRI1
	9iokXxun1hmTxdUu4IJEzgzBF7GFOLGv38AS9VkNUSZlyPG5ac8/DOJj7na0XwP6eA==
X-Gm-Gg: Acq92OFSyKIWXbiOY9QYX1vPGUHae9fSy+KfSOjt+qrp55MBoHxsRLy5D0djSrHJiEu
	0PWaO1HRbJL0kpxKlP24FGpFJIZPIj0kCUyIfmvZ2dhGOJaj2D34iNY2efmtR63TfkGp0/GXxPR
	MLfmckxqPC5RUC5wxb4AdQPDrun1hXuuoZmNCxHayBm7zli+TOGdar7sqfChZPHdVL0K3tQ2fA3
	fGb07I9kjibH0mnBb4JyDtkMdaUvc0fTCKUPwrxSAaB85OmSCgQx4wEwElbC0oInD5U2gBM6Sj2
	+gsIi5YjU1au9WdfrJ6czgRjhYWhNCtamOI/dQ4ZctRFB6bIx6+YJOZmQ81Ls7FkJFWKFqdnNRx
	JR6NuTB5TaVXdnRKtrTgejPdSjk+SNrH+5gy8CaDh5OR+er1UUEo7Q6x85vcMC265zZHJwvSU+g
	1zfVZljPF0POOL59E2nlJJGvk/nwTO2WNoXz6nxHrP2BPE43yVtxtHI6u1g8ZzzmXC87oUlkw30
	Em2fzx7SP3YE9W+6bLaGXmlBw==
X-Received: by 2002:a5d:6191:0:b0:45e:eec6:5020 with SMTP id ffacd0b85a97d-45ef6b8ed7emr21819398f8f.38.1780401962086;
        Tue, 02 Jun 2026 05:06:02 -0700 (PDT)
Message-ID: <e6cd8fdd-97d9-4f07-b952-079c67598f32@suse.com>
Date: Tue, 2 Jun 2026 14:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Add SBAT section to the PE binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260529153531.1341542-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780401962-80D7F161-1C78BB7C/0/0
X-purgate-type: clean
X-purgate-size: 2271
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:gerald.elder-vass@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@cloud.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 607D562DD42

On 29.05.2026 17:35, Frediano Ziglio wrote:
> From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> 
> The SBAT section provides a way for the binary to declare a generation
> id for its upstream source and any vendor changes applied. A compatible
> loader can then revoke vulnerable binaries by generation, using the
> binary's declared generation id(s) to determine if it is safe to load.
> 
> More information about SBAT is available here:
> https://github.com/rhboot/shim/blob/main/SBAT.md
> 
> Populate the SBAT section in the Xen binary by using the information
> in xen/arch/x86/sbat.csv.
> 
> On XenServer, the version and release fields are populated by the spec
> file during the build process.
> 
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/Makefile     | 4 ++++
>  xen/arch/x86/xen.lds.S    | 2 ++
>  xen/include/xen/xen.lds.h | 3 ++-
>  3 files changed, 8 insertions(+), 1 deletion(-)

This gives the impression of being an entirely new patch, when really the
(standalone) patch was already at v4, and my comment there wasn't addressed
(perhaps merely by extending the description some). It also feels like there
were other pending comments, or else why would this not have gone in long
ago? Additionally, ...

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
>  obj-y += hpet.o
>  obj-$(CONFIG_VM_EVENT) += vm_event.o
>  obj-y += xstate.o
> +obj-y += sbat_data.o

... like elsewhere: New files' names should prefer dashes over underscores.
Question of course is why this isn't simply sbat.o in the first place.

> @@ -275,6 +276,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>  	$(call if_changed_dep,cpp_lds_S)
>  
> +$(obj)/sbat_data.o: $(src)/sbat.csv
> +	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents --add-section .note.GNU-stack=/dev/null $(srcdir)/sbat.csv $@

That'll be an SHT_PROGBITS .note.GNU-stack, won't it? When it really wants to
be SHT_NOTE at least for bleeding edge GNU binutils (see relatively recent
changes there).

Jan

