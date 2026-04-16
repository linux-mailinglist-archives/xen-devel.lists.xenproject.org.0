Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB2WBYaG4GlPjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 08:49:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E340AC76
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 08:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282993.1565309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDGXa-0008Av-OA; Thu, 16 Apr 2026 06:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282993.1565309; Thu, 16 Apr 2026 06:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDGXa-00088X-LO; Thu, 16 Apr 2026 06:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1282993;
 Thu, 16 Apr 2026 06:49:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDGXY-00088P-H7
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 06:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDGXX-004fPu-U6
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:49:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e08661-2eae-0a2a0a5409dd-0a2a450ce5f2-44
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:49:27 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69e08677-f40c-0a2a450c0019-d155802dd93b-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:49:27 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso70600565e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 23:49:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818d70sm48262825e9.4.2026.04.15.23.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 23:49:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1776322167; x=1776926967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dO5dep/7LW5nwzf5LpZvfuD8LTzYgo0Fq8G+WRGNV9o=;
        b=AWxwUOvOSuKrCaxxWsMB5LK84PKmky4Xu22MzKFxJi/gjtLjV7VbNOHZZ8y7AQromb
         k0PFjGHw0dFCXGiMivitZZleO68kxsLH7Bv7hnyG/Zx+Q3YDHcjFA69jR0WboPH2hKe4
         NkY38AGEwOG8nvz2SoZZkN4IdcFGzzXQRzMVVTfvd0QGQUn5dPBCxcuLb71+83gjKhk9
         pgkZBid1DdL0mkMoLvjY5kTiCh+zoJYdGDjLWguWbu0jju9/dIfC18eEcr+bxObqY4K7
         mO5PBdgbmRCEamS46KtXQDt5ghcGxYjavQloKaLaQ/InLZFWphROY7aqJG5rWM1iImav
         6seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322167; x=1776926967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO5dep/7LW5nwzf5LpZvfuD8LTzYgo0Fq8G+WRGNV9o=;
        b=byp9mUVrB3dRUPRmjEKONKM9tzPDSueqhEb0d73dXCJFQMRQYgiNNZV91UgaU0z+Ij
         ERlUpzCDqYio0xjPk9VYkMwe/oGN/9ZhmwWJzwIBUtZk5CkbPwEOn9cKACK3cRjTuCWA
         BxrIqZOY+5E5TdeBqul1hVi8UZsu0a3ZFHOc0c18Wq8XMWRR7LoWOE/M2nKLqydC8Gp9
         Xm9jzQC/TJfYyLB8snk4Xy4ss2PKaR9wRrcY3HX+XIpRoF2q0l2ciGnPN295hIQ70MB0
         1OUanKZeuFOPzLug+jKDzWjyC6eA1QWeAxnfsZdZf+GRxuQV0jYpKheIbt3F447fH5Ar
         rWrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9p6AUByhwB+kGHi9iDG76Lx8uazA3BJWatW7GljNjx8nbxko0fAg+ucn4UUhA/2MjPT3Eyy4NiQvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf5gS9cYoyFp/8GSGiG1QdJNFasa2p43b8DQe1mze+mKFQDMft
	g1K94OSXyW+odZH45oSIsfTe3TMV/PZmYGzkax9IcyBx10ainrAM+eWA7dPOylXKJg==
X-Gm-Gg: AeBDies2EglShCGtGCKREU7JjBFceMPb/GsINnp/M3KxWJhezQwgssh5140UDwBgEkH
	6cX4lG289+OXqr/4iTqVXbESuGcjN0fdDD7bJ5st32OGALsg4k6crQEijhotrvCQOvqOBh2Unod
	rdiqtfOHw/OHbsYj1rKMa3XFxEgXdeLQOPhiDovIpEb1YmHe1wJ7hGIAcZO01bvSfjK4BOESAcB
	oKaKSDWD9C8S5MU4HXVBsMfhkmhCyOTvPb6GJ8D798eIOVnIJ5NGXu3O2TsmpZHNjCdN648Fzuu
	lf6PDgRJIkMQ3UVQPIDHRZsthBercZZiBySDJHcSpAfDVPm69uvRBp5s/3uxagDusQbiu5HK4El
	Umo+AZryb0GncC3feCcjOaKN5D4W+yXr/oswgfmMXiu9rp6VzovZehIzkC6GLRaasiw2LwGkBop
	7MSw0r6CHCs6YDRNAVOphnaDpah9c7pyU6WQhSf1nsUI+O0JZ+96i9txBiMCMgTpvleeMUPmOfk
	R0tns3jcAKgOI9n2OFcNoYZHg==
X-Received: by 2002:a05:600c:3b29:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-488d67d24cbmr316921605e9.9.1776322167196;
        Wed, 15 Apr 2026 23:49:27 -0700 (PDT)
Message-ID: <28900826-5a96-4bf0-8d5b-11fd1be8386a@suse.com>
Date: Thu, 16 Apr 2026 08:49:30 +0200
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
 <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
 <f4a1cfa1-f3ea-4fa0-bffd-1f6346e07d39@epam.com>
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
In-Reply-To: <f4a1cfa1-f3ea-4fa0-bffd-1f6346e07d39@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776322167-8274EA3D-3973FB81/0/0
X-purgate-type: clean
X-purgate-size: 2619
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CE7E340AC76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15.04.2026 16:51, Mykyta Poturai wrote:
> On 3/30/26 15:32, Jan Beulich wrote:
>> On 30.03.2026 13:59, Mykyta Poturai wrote:
>>> With CPU hotplug sysctls implemented on Arm it becomes useful to have a
>>> tool for calling them.
>>>
>>> According to the commit history it seems that putting hptool under
>>> config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
>>> supported it can now be brought back. So build it unconditionally.
>>>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> ---
>>> v6->v7:
>>> * no changes
>>>
>>> v5->v6:
>>> * don't change order in Makefile
>>>
>>> v4->v5:
>>> * make hptool always build
>>>
>>> v3->v4:
>>> * no changes
>>>
>>> v2->v3:
>>> * no changes
>>>
>>> v1->v2:
>>> * switch to configure from legacy config
>>> ---
>>>   tools/libs/guest/Makefile.common | 2 +-
>>>   tools/misc/Makefile              | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
>>> index b928a4a246..03dfcee7fa 100644
>>> --- a/tools/libs/guest/Makefile.common
>>> +++ b/tools/libs/guest/Makefile.common
>>> @@ -7,6 +7,7 @@ OBJS-y += xg_private.o
>>>   OBJS-y += xg_domain.o
>>>   OBJS-y += xg_suspend.o
>>>   OBJS-y += xg_resume.o
>>> +OBJS-y += xg_offline_page.o
>>>   ifeq ($(CONFIG_MIGRATE),y)
>>>   OBJS-y += xg_sr_common.o
>>>   OBJS-$(CONFIG_X86) += xg_sr_common_x86.o
>>> @@ -17,7 +18,6 @@ OBJS-$(CONFIG_X86) += xg_sr_save_x86_pv.o
>>>   OBJS-$(CONFIG_X86) += xg_sr_save_x86_hvm.o
>>>   OBJS-y += xg_sr_restore.o
>>>   OBJS-y += xg_sr_save.o
>>> -OBJS-y += xg_offline_page.o
>>>   else
>>>   OBJS-y += xg_nomigrate.o
>>>   endif
>>
>> This looks wrong to me. There are x86-specifics in that file, which shouldn't
>> be built on Arm. And the name of the file also doesn't indicate any relation
>> to CPU management.
> 
> xen-hptool requires xg_offline_page as it has both CPU and memory 
> hotplug commands. Without building xg_offline_page it fails with
> 
> xen-hptool: symbol lookup error: xen-hptool: undefined symbol: 
> xc_mark_page_offline, version libxenguest_4.22.0
> 
> when trying to do memory ops.
> 
> Is it an acceptable behavior?

I don't think so, no. The tool wouldn't, aiui, load at all then if built with
"bindnow" enabled.

> If so I guess we can build xg_offline page only on x86.

We still need to, imo. But the tool still needs to be usable no matter how
specifically it is built. It should avoid referencing xg_offline_page.c
functions when built for non-x86.

Jan

