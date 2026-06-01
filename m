Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK/ND/ZrHWrqaAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 13:24:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1BD61E47B
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 13:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323849.1589514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0ke-00048L-8B; Mon, 01 Jun 2026 11:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323849.1589514; Mon, 01 Jun 2026 11:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0ke-00046F-5e; Mon, 01 Jun 2026 11:24:12 +0000
Received: by outflank-mailman (input) for mailman id 1323849;
 Mon, 01 Jun 2026 11:24:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wU0kc-00045t-Bl
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 11:24:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU0kb-0043Im-7N
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 13:24:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1d6bc5-bab6-0a2a0a5309dd-0a2a4505ba46-34
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 13:24:09 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1d6bd8-aaa8-0a2a45050019-d155dd2bb1a1-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 13:24:09 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so1859298f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 04:24:09 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.102.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3595ef4sm23594409f8f.37.2026.06.01.04.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 04:24:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780313048; x=1780917848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZQdLkQ9d5yNZqdy8Xs0T2RQXySCYnGIpDCpih2B3jM=;
        b=ZB6/zS3eUQxTrXs9rOrSnLUhxIayo4EjeVOj8tI3HZ8ftpW/fLx55P06eqlWvSQzTP
         3D9hBMxltJcCxCyt4MNJDiAuXD/TL6+hTP9lTIjVxRQFBcX2Et56paGhBbpqnmLFl05f
         z0NpxZYaR0HwtXZHV4XAD3xt7OSzyt+zIzCcHB4HKjmPONuLSX+wGICHtyaJKds+yI5s
         wkHdj4x0Olr9d+eUwTIGwTWJlRkhbiWo0v3LMn7s/UMREn5SFHRm5/YVkER4sWCWIUQm
         f2Use8VTNY0RMypV8vBvXxXhHsyqbFe1Wdhw8cIdtMIzc5kCKrMk5aabeUnSgOs/WRal
         irnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313048; x=1780917848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZQdLkQ9d5yNZqdy8Xs0T2RQXySCYnGIpDCpih2B3jM=;
        b=s/QeGrXG4ZE2gUFGVloshqHf0Is1atnZYldNWeFJRzPX6Nio42znnFCOPFz75GP7zB
         aFQPu+LwvPbtDCEgbZjsbceqo0KYEQKETmfkb4gp46meYEBBV/CSCPBrc3GQw4xlp/1c
         wacHU7G+YLa3YwDetDkjcg6aKZOcivZAMpad+MFyfDYjlC10mllE9NN9Y5IWLsuHFqhl
         h9qjvUubL8mP7CUdsWGJwxgkovC7Mo7bhO3m4ESYuBzAN7nbWZAf9XpMJQULoUMMBo4D
         LcFWEHxhoQ/BGIDE5POcuaCr9FtSEO0yfdiuE2yZX4O0lQFJ0NVglv/PCLLGrhU0wzrA
         SLgw==
X-Forwarded-Encrypted: i=1; AFNElJ8cuzU707H1tw9jBXcoP+pr8OoKygegIWJIW228+8CF/kifk9goos7gD+vX6rH2oBtQX1QthNFWMWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRpV9awoim+CxINOGLPBmP4cSESg8eoq+BSItXdIKC0XRmuAhO
	0eLtd7lly3fJp0WffuB4RC1Gev0MTWXPWOEDjIxLEY6Wd/GxwDFLI3aq
X-Gm-Gg: Acq92OHlleUPVaF02FDAAtAoOyK+ibl8w7s0PAD6mF3QHyBUba7k80e7PZllCV4UjMe
	21xANa6sN6oKa+9Wg5Kava7pkyrFur7DY/syEn6FiSDrHZk1GUONzYC3maXzqGGiccOeBYrRFN8
	FjfetMnCtgq3KbvJtRAkeOacuJWiZ1UuR0eONt8IJdom0qjcNDIs7QMbDrrAy+FKBKoXVDiZJpp
	v1ss3hjWide53fIefjVoxCV210hIETmyulP9ZhrQ9IZrmNbO5CXS2x78MsCGdoD1aeRer+JRxsG
	KnTdlxmwp+7jiX0RJpfLrzttdsg6a1jzDn3ps6OYJYsdi3oKMNEc1sC016GZZKOqaXprZ3o9g+c
	BmFJpbvhuMv3vX7oMplEW5lj35FNicxw3LwdfvxFFMHTWGct3bZC9yBS4RBU037ZEVl0hFC8a/f
	3ODv65C6quVJ9th5zD83sFidpeq925WcqhN9zcOj+nPw==
X-Received: by 2002:a05:6000:4610:b0:45e:779a:302c with SMTP id ffacd0b85a97d-45ef6b67b17mr20259845f8f.29.1780313048231;
        Mon, 01 Jun 2026 04:24:08 -0700 (PDT)
Message-ID: <d8e23bcc-8271-4e91-a6df-081a7c69889f@gmail.com>
Date: Mon, 1 Jun 2026 14:24:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix stale schedule.c references in comments
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jgross@suse.com, dfaggioli@suse.com,
 gwd@xenproject.org, stewart.hildebrand@amd.com, jbeulich@suse.com
References: <20260601053022.6044-1-frn1furkan10@gmail.com>
 <0c7048d3-7283-46a9-ba2d-2b02cb5c3da8@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <0c7048d3-7283-46a9-ba2d-2b02cb5c3da8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780313049-DA76A443-E247DEA7/0/0
X-purgate-type: clean
X-purgate-size: 2256
X-Spamd-Result: default: False [-0.03 / 15.00];
	R_MIXED_CHARSET(1.15)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D1BD61E47B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 6/1/26 14:12, Andrew Cooper wrote:
> On 01/06/2026 6:30 am, Furkan Caliskan wrote:
>> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
>> index 07656a57e9..fbcdc53f7b 100644
>> --- a/xen/common/sched/credit.c
>> +++ b/xen/common/sched/credit.c
>> @@ -873,7 +873,7 @@ csched_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
>>      struct csched_unit *svc = CSCHED_UNIT(unit);
>>  
>>      /*
>> -     * We have been called by vcpu_migrate() (in schedule.c), as part
>> +     * We have been called by vcpu_migrate() (in core.c), as part
> 
> As you've found, file references get stale, but so do function
> references.  vcpu_migrate() ceased existing in 9a36de177c1
> "xen/schedule: Fix races in vcpu migration" in 2018.
> 
> These comments want adjusting rather more.  In this case:
> 
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index 07656a57e979..5ee26cde58f6 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -873,11 +873,12 @@ csched_res_pick(const struct scheduler *ops, const
> struct sched_unit *unit)
>      struct csched_unit *svc = CSCHED_UNIT(unit);
>  
>      /*
> -     * We have been called by vcpu_migrate() (in schedule.c), as part
> -     * of the process of seeing if vc can be migrated to another pcpu.
> +     * We have been called, as part of the process of seeing if vc can be
> +     * migrated to another pcpu.
> +     *
>       * We make a note about this in svc->flags so that later, in
> -     * csched_unit_wake() (still called from vcpu_migrate()) we won't
> -     * get boosted, which we don't deserve as we are "only" migrating.
> +     * csched_unit_wake() we won't get boosted, which we don't deserve
> as we
> +     * are "only" migrating.
>       */
>      set_bit(CSCHED_FLAG_UNIT_MIGRATING, &svc->flags);
>      return get_sched_res(_csched_cpu_pick(ops, unit, true));
> 
> 
> still has all the salient information but is rather less likely to get
> stale.
> 
> ~Andrew

Thanks for the feedback Andrew. I only checked for stale file references 
and missed the stale function references. I will fix it, and send a v2.


