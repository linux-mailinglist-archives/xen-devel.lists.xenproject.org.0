Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OXuDKxKDGrjdQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:34:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CC57DB45
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:34:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312811.1582911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIhk-0005i7-0R; Tue, 19 May 2026 11:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312811.1582911; Tue, 19 May 2026 11:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIhj-0005gV-T5; Tue, 19 May 2026 11:33:43 +0000
Received: by outflank-mailman (input) for mailman id 1312811;
 Tue, 19 May 2026 11:33:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPIhi-0005gN-LC
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:33:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIhi-00DHkX-11
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:33:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c4a95-5cb7-0a2a0a5109dd-0a2a450485be-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:33:41 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c4a95-1dec-0a2a45040019-d155da2dcd64-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:33:41 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-bcd0111ea98so530516966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:33:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4e21207sm681148866b.42.2026.05.19.04.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:33:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779190421; x=1779795221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgR9coyv9rvSNjntN2gIo1P4RQE/qG6sUOMF9mM5dMI=;
        b=mm0/yez+ZLOE6PshkcKvTap+RXQJCMSdDXHkn7i/8DA8QfDnkED6QLDZY8Zfk8yFVl
         UoJCjpVVJodhiyNUsn6+3lPr3kvXjVOOhLMLZqAVnQhJLqNYXvyXM2C6Kt+syZ+RNUAc
         1VsYFar746QQS7BMFVWcCWVdZcAK96hUQNUSyp4aZNI3FbzJok1GM153S2vzi2VnJR+5
         8xOcvStRlYB5T0T1oqoQfDl1X+5GVHzxQY1nOW0v8yCH3Rryn9rBJlq6z0FijUPp0ygn
         DJ/aOneyE3RrFswAM8K3rybQhf+dODFe0eJuXBSskWsQlgDMc2M/PswMTBEaMk89ePaK
         chCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190421; x=1779795221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgR9coyv9rvSNjntN2gIo1P4RQE/qG6sUOMF9mM5dMI=;
        b=peBhPdKiGzeRAnb/EaTm7FqEkirbhPnoIKI5rdpmvpd3+34srb1sdolo/ZteCi/Iuo
         3ZIj/JLL9vIjsGRSY9KU1PrGlYJzWmOFHcDXtdjcDNMGMtQV1q2Ao4YweHX9xqTjhclz
         fF0qDpAIM7JQeao2yb1mKzWEPnqKWUKHuOPE1YL+GMXT+49qg3DcWW4Eaah1qtccwayz
         /pn0K6cSbgl1jGaxfaWlFZhdXm/PJXBNpf4dm0xX+jwfx0MxX8X+1pOAl81/IeAjaVPP
         XGGFkhmLaW+zf7mXt/lIz3hlvDHyecB5a2l4qGmcM0XrstFxttKLBIPmDpypgddTPZZ+
         wSbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3FV6TyWgxdGRHL6Jkjo5+uSiBftay7HsRNNSP4CZMhCzmyVP56v9DrGxjw+usUJ2UrGc0J8Z+2Kg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTNGUQK985uUvoMU6DLHiqMiWMvA1l/+yxIKQPv4gWrbzz+mCk
	gDH8W2WKLoDC6nJz0nVNvGM8Di5aHawDIFDmBXvEGQBocUfBiPVDEzj5
X-Gm-Gg: Acq92OGGzjll+74Haw4iSdYcx2zSaF6pe+f1g4KYTxBEWtn0vu3LHvF4iYvCiQCTYEp
	f33qPXHzFjBMMZceFew0LhEKyMbhgJYrJrTNbZuB+euiYWawxOZZ3ThLXw2tntLicjVEU0EUzEH
	QWXpZJvnXRved4NLdg4ZzOo8/TSgJHJk21V/cBW4md/gMYcPhjpYiqmGE9qxD4RHO4Frag8AEKM
	xyppQjfNWXFvpwNDpoZbszU2Wyss4F5RLEex6HIGMyLVBicdqaUNta6WY4yvzJpgf4uQfEpEklT
	FyjUufN9UKxnz+id3bzIIuz7i6QC1HUjBSxKX8/V52bwpTqX2Cy99fivoEcMSRbYgAeuFjqUhX3
	RM3DxWvJKUvRNHNXXYrzYcDQttXds/qLzzAHvlxpSaUO4nwryn3Zyg8l8MTB6ZoWbg9GFF2c2UF
	2Ogge+JgpDnDA/I5W6bMOOubleZQrEbiD50EvY4K4R7rruVFilSRNoOpTxoBsIk1vhVefnWFZei
	/o=
X-Received: by 2002:a17:907:a286:b0:bd3:2b8a:2164 with SMTP id a640c23a62f3a-bd517842e7dmr1090907366b.16.1779190420902;
        Tue, 19 May 2026 04:33:40 -0700 (PDT)
Message-ID: <244209c6-f707-4418-9513-1ef65d1d97db@gmail.com>
Date: Tue, 19 May 2026 13:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] xen/riscv: implement prerequisites for
 domain_create()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <e4d6f36bcdf13e8fc12e8769dd965954c5f45b97.1778250616.git.oleksii.kurochko@gmail.com>
 <5c047204-09ac-49b7-b9b3-c6e1c7b7f079@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5c047204-09ac-49b7-b9b3-c6e1c7b7f079@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1779190421-42D643FF-D04CF604/10/73395122804
X-purgate-type: spam
X-purgate-size: 1381
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 986CC57DB45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 5:43 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -289,6 +289,31 @@ void sync_vcpu_execstate(struct vcpu *v)
>>       /* Nothing to do -- no lazy switching */
>>   }
>>   
>> +int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>> +{
>> +    return 0;
>> +}
>> +
>> +int arch_domain_create(struct domain *d,
>> +                       struct xen_domctl_createdomain *config,
>> +                       unsigned int flags)
>> +{
>> +    int rc = 0;
>> +
>> +    if ( is_idle_domain(d) )
>> +        return 0;
>> +
>> +    if ( (rc = p2m_init(d, config)) != 0)
>> +        goto fail;
>> +
>> +    return rc;
>> +
>> + fail:
>> +    d->is_dying = DOMDYING_dead;
> 
> domain_create() does this as well. Is it really needed here?

Considering that domain wasn't created and thereby scheduled that 
nothing will use d->is_dying and so it could be dropped or moved to
arch_domain_destroy().

> 
>> +    arch_domain_destroy(d);
> 
> This continues to be a stub, i.e. upon encountering any kind of error one
> would hit the BUG_ON() there.

I think that for current stage of development it is fine.

Would it be better change BUG_ON() to printk()? And add proper 
implementation a little bit later?

~ Oleksii

