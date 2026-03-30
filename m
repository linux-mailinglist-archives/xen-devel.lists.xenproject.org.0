Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACh1HJ9tymnG8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:33:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C535B15F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267570.1557034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BnU-0003Uo-UH; Mon, 30 Mar 2026 12:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267570.1557034; Mon, 30 Mar 2026 12:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BnU-0003Sf-RS; Mon, 30 Mar 2026 12:32:48 +0000
Received: by outflank-mailman (input) for mailman id 1267570;
 Mon, 30 Mar 2026 12:32:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7BnT-0003SZ-CJ
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 12:32:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BnS-00FISc-KH
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:32:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6d65-5cb7-0a2a0a5109dd-0a2a45039648-42
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:32:46 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6d6e-1947-0a2a45030019-d155dd2cd0b6-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:32:46 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43ba1f3fa7eso2480275f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 05:32:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf2471ee2sm17710611f8f.29.2026.03.30.05.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 05:32:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1774873966; x=1775478766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qdTqZk0U2u2U5c9sisVKBhh6F1UstE0ElJysNxuRGvU=;
        b=MEsZCZO7FhfWBer+1Hq8FK7r4MaBRqPdjwtWJ3CPCTXQmZvIl3PHW/v10HaqHfvzPE
         hRHj6SXwemSi++FNITf0a3vQhBQsMAscemqoLSeAWQiL0q2Ta+5BLUKQufRq9lfn3J0l
         R9AO/VAWnqNhPSIOMtLGrb6YEpy3QJEwR9Opvs9k+MJo8heqgRTUHajCFSHd5n8I44/U
         iwONNkHNLIane4UKmwUieag6WIDl5pk/cRu+LjjqL9KrV2HX1BDK5O1NG8K9gEt4IQ7S
         jl6Z8WIYkcQYlvKGKplW6GZvPYeTp6UIOzCuiWbk9+3lSJxE6e2K131/Uek2XcmolJDU
         2rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873966; x=1775478766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdTqZk0U2u2U5c9sisVKBhh6F1UstE0ElJysNxuRGvU=;
        b=FZTKTziRIGaBXdZzxqEv0lrjkny3HsOv/geEapdCQLx5xro0aJEner6bcHRwXcN5ZX
         mRYsHEvS3xTb81tX3sZu1OfhBIsNKB0YX7ZHNUI9rLV09O6/POOWra7UxL6rq8jEk8ym
         xc7Q5OjzPh49llERt6NQKAi7/FiTsAauGfPpnFz+H4gqX9pGSorbXtGbzAOUvYQ7L6gz
         0XXZz91EM6bWKP81HNx5Efdqiz0/enwBLV9X8zO9ndSooc5zylnsKjJFPIEq4Ti8YMXW
         /xEjONNoVSDOKvIVXjBAEGFTtY4JMFPtcnj0XYJxqEi2Ox5NM6siskDhtpnNtRaHFPNz
         X6DA==
X-Forwarded-Encrypted: i=1; AJvYcCWPjbn68Yk+TfPYfoejPPZszF4Evkccp2SlnGcr63M9DlNyux8y0B8zdNT3aQP1viucVKYAegcalPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG/doc7i+uwRqmuC9RHIUPZcmFhESv4AX8Bj16QsxbkptThT1d
	16s5i4t60esuaxTFgthVGegPapMxE7enOhz/tEwKZ+BeltANcVR3ae6nyerP8yTg1qShADg2lgl
	Bw2jDQg==
X-Gm-Gg: ATEYQzxgY/cRf1b1AeYAj0FdA4Y18+/MFUaVgPvVhHTQM/jrq9Mpc9Zdeo6Q58JhSx2
	7t1H8F8bjaKMBA1bJX77H/ri4u9eRbg4ubZ3bq42qUE1pbqUOvQFD9wLltH/mMGth8UCirF27BD
	s+6jMq7JfxFRtvGQUpnUaScoXUgNEvsv/UBGdREOGQcwZKQZb5yW878HIBewJNHI4OyFEc1qsPR
	cLHayEGZX/pF/7YSBYPEz6MhH/hAl5YXB32Pi5JU1TIQ0m6EBVYBVSxwdXo4cALIrIqMZlbrReU
	qT24xyKp7+PHq3VIbsQPTbQWlCgiJDbO+O5iIxsn+Lk0xazbeIuO8bc9vSuXE9Zw0tNMbB6hH+S
	J8mfvMAUZiPA71yebtSKzG0ZHbPOopGpLvlIwVr40TnMjkfpOWzf2R2Zw7sltRpAK21LvCL81Q3
	2zmNiQ9Un8j9AXQoWYcJIcI1yBg0ZMPlkZuxdMKeJ4rLvz6S4GbzlqnxUcFMfiqeSGVmUfUA0gs
	g97hoyW5OvpOfw=
X-Received: by 2002:a05:6000:24c7:b0:43c:f81f:3e7c with SMTP id ffacd0b85a97d-43cf81f4010mr10747414f8f.3.1774873965922;
        Mon, 30 Mar 2026 05:32:45 -0700 (PDT)
Message-ID: <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
Date: Mon, 30 Mar 2026 14:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
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
In-Reply-To: <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774873966-4925572C-7D649678/0/0
X-purgate-type: clean
X-purgate-size: 1725
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
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D84C535B15F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 13:59, Mykyta Poturai wrote:
> With CPU hotplug sysctls implemented on Arm it becomes useful to have a
> tool for calling them.
> 
> According to the commit history it seems that putting hptool under
> config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
> supported it can now be brought back. So build it unconditionally.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v6->v7:
> * no changes
> 
> v5->v6:
> * don't change order in Makefile
> 
> v4->v5:
> * make hptool always build
> 
> v3->v4:
> * no changes
> 
> v2->v3:
> * no changes
> 
> v1->v2:
> * switch to configure from legacy config
> ---
>  tools/libs/guest/Makefile.common | 2 +-
>  tools/misc/Makefile              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
> index b928a4a246..03dfcee7fa 100644
> --- a/tools/libs/guest/Makefile.common
> +++ b/tools/libs/guest/Makefile.common
> @@ -7,6 +7,7 @@ OBJS-y += xg_private.o
>  OBJS-y += xg_domain.o
>  OBJS-y += xg_suspend.o
>  OBJS-y += xg_resume.o
> +OBJS-y += xg_offline_page.o
>  ifeq ($(CONFIG_MIGRATE),y)
>  OBJS-y += xg_sr_common.o
>  OBJS-$(CONFIG_X86) += xg_sr_common_x86.o
> @@ -17,7 +18,6 @@ OBJS-$(CONFIG_X86) += xg_sr_save_x86_pv.o
>  OBJS-$(CONFIG_X86) += xg_sr_save_x86_hvm.o
>  OBJS-y += xg_sr_restore.o
>  OBJS-y += xg_sr_save.o
> -OBJS-y += xg_offline_page.o
>  else
>  OBJS-y += xg_nomigrate.o
>  endif

This looks wrong to me. There are x86-specifics in that file, which shouldn't
be built on Arm. And the name of the file also doesn't indicate any relation
to CPU management.

Jan

