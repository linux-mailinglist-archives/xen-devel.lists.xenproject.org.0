Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMJ9NPKr/WlOhgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:25:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456844F437B
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303348.1576793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHRu-0002QV-CZ; Fri, 08 May 2026 09:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303348.1576793; Fri, 08 May 2026 09:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHRu-0002Oi-9f; Fri, 08 May 2026 09:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1303348;
 Fri, 08 May 2026 09:24:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wLHRs-0002Oc-Sh
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 09:24:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLHRs-00Fj5r-6F
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 11:24:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fdabcd-bab6-0a2a0a5309dd-0a2a4507b618-40
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:24:44 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fdabdb-229c-0a2a45070019-d155802ded17-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:24:44 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso21621865e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 02:24:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e642ee666sm19427055e9.2.2026.05.08.02.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 02:24:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1778232283; x=1778837083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NAkSijsZyggTaS2S6eK+VIWGLJ44KjDE3vvVP71h/lg=;
        b=IdV/RaPLJcbAuTy+cH/GPUk8KTE05d4qcTNWlua/ogwPLhU1PGnliyKemiCkDXC+d3
         TOeOj/e4RhSiYZbmQ6tt6nY8r0nJIqm7QoTYboYOGul/Lr9fejyr8VM552IgrBZxZgni
         /D/A3iPoDNhcmYBzN3lpSBWfB8o8A8bHvQGwly8YX5GQKaUtCaiKt4Rpla3IbCn5t9sq
         qGzQDkATL2xjR4ABl1fJVKs3Fe0uy4hfI4eLNNqhfNrZs0Pq8glH2poSNiQeTUJEVtoo
         3/WrcYOP3lzI3Q2I3+2DcMyHN+dpw4E8AchTtWlF4YAru4ZHU/Ptod6G/G52sKxWnq/I
         dGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778232283; x=1778837083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAkSijsZyggTaS2S6eK+VIWGLJ44KjDE3vvVP71h/lg=;
        b=bpz5+bKDVHg1lLdx1fKgY3YQ9lbn15bjKcUw774gnMDSDi2GkgCaW3aFnMP2UN0YQq
         kgPFTD87ILnKyX+0unskJZpBSbmEBWpNcI6bzwbqLlRU3J2nMsduWV+iSrTf+oCel2EQ
         Bk1NFin7SYmlOkXetu3lbwzQB9Y0RWDfHNbNGxd4Gelwg+vV2mVqrTNJtiT/GG6bE1I4
         wJee1Gb+vM3OczyDoddTeXu983fV8yhAydoH1+ZxTV8iPuHz8e2D2JXQ7WhcXVdPH754
         gKIk8QUBhKYXubOwLaxj0Fit8XCDzdn4WmsIGecNbVGl6eYaljPWh6x4slrMYsqt1clz
         s1uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kpIt3L15wxFhA9VnfevgVAdbEEg+tjdkI3xWwUA+Br6sQ8zXajbRtTYtLWCyVWK06UTu8OV2QnGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxCAzCuIAg/SPlq0ZHn/ESN5/7FxqIJApFFZDeqYB+R45L7X1t
	ihewuLMY0EPNXy0EWyp6uoNkLFvu+Qy343uSoqishDyk7lue0cX7PXN6WL+dS0i5mQ==
X-Gm-Gg: AeBDiet8UqKlxxHjkTcyxL9l8+9beikTPn4g6xRh4AqxeV7FiA11RkoGhkTBMgQEA6d
	/UWVkQvKnbcObwZwSiaSTx8YOdjLQd9irBkNYFr6e7XmNdgG1+ivkIzOmxa/XD0Y9T1Q9wLoej9
	7vOx3XauIyVBcYCI9yhrsFEXuS5xQTgPuDpJhd57//Ph87is7luBkekUZBQ+zx/vbzmEhZ1hPl0
	19Gqf0hI/LYyf8FbQ1fklC2hhXCwohBSGLczTbJ8ZdFDYuktf5+6S4ee/FMmpwE6hWOijVfbIMJ
	BcCACKKHTOH5fuovqp6LA9D5DeEc01rkCdtEMi9cZnGY73H7Bk9BlCLiOuFUUQCh0EwONdr9L1L
	3j3pwjrPk4fwetm6KqLSPJHlnROnUx6cbVGBnaDTKPiG88gVpWrb8SabEydo9oAvhvVj75pT6Dk
	NmUwxqbsUU1T4CvxUs1KIJC5hbTEpaabbrnVtD+2WZFvHQfpaLBgohM5q1id00+zNZgnJ2ZI0RT
	q4/HEm7i9WxIBU=
X-Received: by 2002:a05:600c:1d18:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-48e51f41b9cmr178781265e9.29.1778232282984;
        Fri, 08 May 2026 02:24:42 -0700 (PDT)
Message-ID: <b2e232f2-1b15-473b-aeab-22c54553149a@suse.com>
Date: Fri, 8 May 2026 11:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/dom0: enable pf-fixup by default for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260508090911.51941-1-roger.pau@citrix.com>
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
In-Reply-To: <20260508090911.51941-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778232284-23F7EC48-252E3F46/0/0
X-purgate-type: clean
X-purgate-size: 894
X-Rspamd-Queue-Id: 456844F437B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08.05.2026 11:09, Roger Pau Monne wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -849,7 +849,7 @@ Controls for how dom0 is constructed on x86 systems.
>      If using this option is necessary to fix an issue, please report a bug.
>  
>  *   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
> -    defaults to false.
> +    defaults to true.
>  
>      When running dom0 in PVH mode the dom0 kernel has no way to map MMIO
>      regions into its physical memory map, such mode relies on Xen dom0 builder

While this paragraph is okay to keep as is, imo the last paragraph concerning
this option would want re-wording to reflect the changed default. Plus, as
indicated on Matrix, add a hint that people needing to use this option (in its
negative form) should report that fact (and relevant details).

Jan

