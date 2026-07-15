Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ZNyBLQlV2qtFwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:16:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFF75AE46
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:16:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=a4q8TGVp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1362677.1614443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjsuf-00082R-4y; Wed, 15 Jul 2026 06:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362677.1614443; Wed, 15 Jul 2026 06:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjsuf-00080e-1m; Wed, 15 Jul 2026 06:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1362677;
 Wed, 15 Jul 2026 06:16:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjsuc-00080W-QU
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:16:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjsuc-0022nh-6u
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:16:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5725a3-5cb7-0a2a0a5109dd-0a2a450bdf0a-10
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:16:06 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5725a5-b7e8-0a2a450b0019-d155802cb1d7-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:16:05 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493b7612475so38560715e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:16:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4634e0d9sm13417656f8f.2.2026.07.14.23.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 23:16:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1784096165; x=1784700965; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD6xLO5TNytDgtHGbboyC47Q2Y/dMwbsodJ9rP5RlFA=;
        b=a4q8TGVpw0KjnckKEM3wjhXeAARLMKisMmxWLPBzrokRNj53QSb1vKxShERu5PyaOf
         wyzEFxpX6rWnlRwWhZ3f64SwKfndn9n6mKzgncez+vOo8Tz/5PjIIH5YadD2RULYvf5n
         bHBFQA0XMZKGrLeCiYxbrRvLqi5484TULYqJ2O1VmLfKWNWVoDeacTC5GQinPiD1j4X8
         hnVqLY5jGUUmiwGmyvy4QBodxp6HOOYRNLbJTZ5/GTggSgsYcPx8CWNoPpvoP8ShwPRd
         4dowAVpUz8hpilHspb2mXbni9XJi734PbvEH01uCVVw/1Ve5JDgqLkj5EXUbJgOlxBXL
         JhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096165; x=1784700965;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TD6xLO5TNytDgtHGbboyC47Q2Y/dMwbsodJ9rP5RlFA=;
        b=VB5m0KNqPPNIc8pqL8sDa5KWP2DsSpfw/5r+TAc1+kvcJ/c4IbudaL6pwU2jxjMGpO
         ti1lbosoxa6JtkCGDu2HOOSBdGCEATvDTe5FD4NiGixsnw34ERe5sovhD+HYFWJCRf4h
         iZm+iGig5Ij6AD5UyDEHF4sAlzYFhqsDiUDtZUZxa7q/L3yAjHdrgXZ3ycDpCHFcuFWI
         xN9/+mx+ynJWI1//C4FQ+sOm+Jv55qCQUX6Li5fR12xrTz5zlz+CX65QpRY/FLvVPbm0
         TZu4owh5OV9CQb9tubAYiik+fuidp37/ZXc70ZAzVl+S/jtO7QqZ49+VRQHD9G5z32B7
         6HMg==
X-Gm-Message-State: AOJu0YzxrkHmNfW/pe7dsilMT3kwdT39fUICXXqPReSaZMoZ4VAA6ufg
	vVbZ94dMwutqZZR8d/VZJX/alQasqkwqs6KaQHr1Now960wN4Ql4m3CNAph+wZTMwA==
X-Gm-Gg: AfdE7ckLND2EvacisNDzwzdjS9ZsKgzDVtPeBVfxF+krBQCqnnOrsjQp9r80U5OgLk4
	MaBpIjaZZn1Pogt5Y5NqyLDODOfHdvs5RR8wMrn+bYaWUTPnkHhqWzUUEuyqEW6djE3IH7UjGOp
	GHvOAWCowHdFiDGLMNNdHHp1iOu154JBEs504hXZuj60mHRyMTfL8hrtntO3QmFOaG7DpNY4iha
	VEA6uEH/GV7dc8ai4eUKHX7diFt/VaLtHIbxlDXwT9Vr/49fBXw2pHaHSsKF10F+ggbuDYBOqgr
	K/UykyawnfS3/VhA3wWCOWPWN53puMGdqByOgZNwy6pt6o7y3yS+oYTsUL7GooHWIh4U8TcMDwR
	7GFZcp3Hr787nxDPjgggDeH1jtnyk9qAvl98aN6SqoZ9QI2wyHHqtKOelXGagxl3EMcVr/WY/Fq
	NAwpzVzic1PH89vyBXFm0vsmr8FEgLuaPlhuCfb2L2qOBgtjyNPl1D+hnKgAYGt6L/bchge8YrD
	W5SUCtA/1zGBnY=
X-Received: by 2002:a05:600c:46ce:b0:493:b811:e549 with SMTP id 5b1f17b1804b1-4951830a532mr72559705e9.29.1784096164990;
        Tue, 14 Jul 2026 23:16:04 -0700 (PDT)
Message-ID: <6a474432-fd4d-4b69-948e-9d32c0b31790@suse.com>
Date: Wed, 15 Jul 2026 08:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: domU crash when resuming from suspend - Xen 4.22
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <ajUm2SQtMD6Y-K9S@mail-itl> <alZt_boT-hJuVlD6@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <alZt_boT-hJuVlD6@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784096165-A82F49EA-DB4903E3/0/0
X-purgate-type: clean
X-purgate-size: 5001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63BFF75AE46

On 14.07.2026 19:12, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-Górecki wrote:
>> Hi,
>>
>> I'm continuing testing 4.22 and found this:
>>
>> When a domU is suspended (even without host suspend) it crashes on
>> resume with:
>>
>>     [   24.374629] BUG: kernel NULL pointer dereference, address: 0000000000000020
>>     [   24.374647] #PF: supervisor read access in kernel mode
>>     [   24.374657] #PF: error_code(0x0000) - not-present page
>>     [   24.374668] PGD 0 P4D 0 
>>     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
>>     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not tainted 6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full) 
>>     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_cpus.constprop.0+0x6f/0xb0
>>     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
>>     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
>>     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
>>     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 0000000000000404
>>     [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 0000000000770ef0
>>     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 R09: ffffc900000abc8c
>>     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: ffffffff81835ac0
>>     [   24.374825] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b369000(0000) knlGS:0000000000000000
>>     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 0000000000770ef0
>>     [   24.374873] PKRU: 00000000
>>     [   24.374877] Call Trace:
>>     [   24.374884]  <TASK>
>>     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
>>     [   24.374900]  cpu_stopper_thread+0xa3/0x170
>>     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
>>     [   24.374917]  smpboot_thread_fn+0xf3/0x220
>>     [   24.374925]  kthread+0xfc/0x240
>>     [   24.374933]  ? __pfx_kthread+0x10/0x10
>>     [   24.374940]  ? __pfx_kthread+0x10/0x10
>>     [   24.374949]  ret_from_fork+0x158/0x170
>>     [   24.374957]  ? __pfx_kthread+0x10/0x10
>>     [   24.374965]  ret_from_fork_asm+0x1a/0x30
>>     [   24.374973]  </TASK>
>>     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xenfs binfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_rapl_common intel_uncore_frequency_common intel_pmc_ssram_telemetry intel_vsec polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay xen_blkfront
>>     [   24.375064] CR2: 0000000000000020
>>     [   24.375071] ---[ end trace 0000000000000000 ]---
>>     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
>>     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
>>     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
>>     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 0000000000000404
>>     [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 0000000000770ef0
>>     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 R09: ffffc900000abc8c
>>     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: ffffffff81835ac0
>>     [   24.375184] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b369000(0000) knlGS:0000000000000000
>>     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 0000000000770ef0
>>     [   24.375241] PKRU: 00000000
>>     [   24.375247] Kernel panic - not syncing: Fatal exception
>>     [   25.417403] Shutting down cpus with NMI
>>     [   25.417447] Kernel Offset: disabled
>>
>> There is no change on the Linux kernel side (neither dom0 nor domU), the
>> only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be already
>> broken on -rc1 too). This happens for both HVM and PVH domains. Haven't
>> tried PV domU (but dom0 survives host suspend).
> 
> Any ideas?

Didn't you indicate on Matrix that there's also a kernel version dependency?
Iirc 6.12 doesn't exhibit the issue.

Short of anyone having a good idea from just the data available, perhaps the
next step would be to further limit version ranges on both sides?

Jan

