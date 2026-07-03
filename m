Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxNeIsqgR2o2cgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 13:45:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B4701FA6
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 13:45:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=juyr9FQ0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353248.1609276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfcJh-0006lb-Cs; Fri, 03 Jul 2026 11:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353248.1609276; Fri, 03 Jul 2026 11:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfcJh-0006ir-9h; Fri, 03 Jul 2026 11:44:21 +0000
Received: by outflank-mailman (input) for mailman id 1353248;
 Fri, 03 Jul 2026 11:44:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfcJg-0006il-CA
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 11:44:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfcJe-00BDe4-MN
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 13:44:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a47a08f-bab6-0a2a0a5309dd-0a2a4504eda6-6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 13:44:18 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a47a092-a01d-0a2a45040019-d155802fb5ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 13:44:18 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so4045375e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 04:44:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63b6f1bsm115209625e9.10.2026.07.03.04.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 04:44:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783079058; x=1783683858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbH1aNFyyNe3stX/uhltfqjToNpdgn2HT2T4a4oOTIY=;
        b=juyr9FQ0pJEAMSP8eusdoGTMQ2760ch9u2GDVwnGVwLbprlcYntob/haEaFTzBtfoJ
         a2wT4BZHWWpXj7JjHhYn/diuC43c6aQ1t9MvjioEmZDg0ki/2N1ttMZMWobchPN5Pk/A
         +sU7ytjg+aZQdb/UyrHoMMBw5qtRL4RTAw+ulK2q7JdUac26mCYaUP+c4yjd6VZ7th+9
         cfPMNwlg4FM37daThBck+8qvR7J+oaI7SRNv1XVy2JwfA2Pusx+1VP8qt7ll0a+DiIaQ
         I86sZz4+gyPk2PK0HiKyuwKB2q9mic/4z8NsNTcSPV1+VJ1VWKgk7aFBoFegmHCKo2xf
         bCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079058; x=1783683858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbH1aNFyyNe3stX/uhltfqjToNpdgn2HT2T4a4oOTIY=;
        b=iCnOCZ5a7gTetAewiqE6LA/9fkMgAZLNUmmHBAaro5UOb7bzDD+4BtVS+xgJrSGJ8w
         m6HLfgVPBZKa6r7aagBZRzvM1jDJmXMqDBHoi9BkJm29ENcNeZDOykVzwnhKVA4G51Yz
         y3fbITbeEXySgmSNYF+iggkwCcSLexf9Wd+ftU1LnmdkSOHbq7vOwfCoObQQfPJQT8JS
         FtkuIoGnzZN1PeD8QomI1X24I0PgZgV5hdD8mlWzSHZiqWwnfaeQbokV+G2YH2y2z7Cj
         Al04Dm6T1/G+qbQgpwOaSQZpeQT/S1WVBrSpDzaOr8oQfAhDi/mjn/NLP1bNC8n9qSHw
         MZvA==
X-Forwarded-Encrypted: i=1; AFNElJ860CSiy65YP8K9WU7vk3Ts1jEWDnZTqsHe3eAF/6KFISXcnGnEoDayr5oQfI/6onWPmcW17KBD8fo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywwc3+S8osuYr1kl7t7kUOKu9B21uYy292iuLo3rI8pB18sZ0Xw
	2hR3xQpAHeUbR/9pfWcBryfeou8t300hDrlVPTrGR94UyT/jEhPsX4Ov
X-Gm-Gg: AfdE7cn8ouj0wxBbin+Tut43eucJWidiq/Pdsh0I/aA7Z1o9RBk4rn5JssZ0hXgJu30
	8L+mjb4UXqWqq75Lw+X8vTn7R5g8iGn1hOpSfusCQ5FV4SkMnn6dLZtnI+fgfNYOeYiVv0/D15r
	Gdl8kw5w1XO4bf1NN7Un2eiF6IE/NdCu/n6N6W2n1ylPbwDTQhAwZKq2ACXJMFNe2lIHW6q3pkA
	y3ekSzS/DYi7l/0lH1mDt57yixPBI61qVw5O3x0JA6j3M9qHQZagnq0rQXHxNYlXTwdhJJjK5jT
	YeYQAbxT7U50VqW3O+WqQbBGkf9y7Md8mR1v7lwuTqOM04z1PoP5g8uUMlRUWCHI/Jb8WXIZwwG
	GrpJDdWoIRvChuEX5xIV3eEpxXkQ/mVQTZSgIgTDmyw1vJdZVnJxfCRohUqmkF8/SybwhgsO3aR
	ngbKFLhF+FjQC5jwhYinNI5yFFLtHCj1j249RuLiqb5kRjvgUGzzbRe4uih7r+HMLYzmI=
X-Received: by 2002:a05:600d:3:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493c2b161b3mr121210095e9.5.1783079058002;
        Fri, 03 Jul 2026 04:44:18 -0700 (PDT)
Message-ID: <30e859e2-ee54-4d02-ac2c-08f8f80547bf@gmail.com>
Date: Fri, 3 Jul 2026 13:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20260703091544.183548-1-taka@valinux.co.jp>
 <20260703091544.183548-3-taka@valinux.co.jp>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260703091544.183548-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1783079058-AC93A1CC-E881F4A2/10/73395122804
X-purgate-type: spam
X-purgate-size: 776
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 1E6B4701FA6



On 7/3/26 11:15 AM, Hirokazu Takahashi wrote:

>   
>   /*
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 95946634d1..ada430f262 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -9,6 +9,7 @@
>    * Based on an earlier verson by Emmanuel Ackaouy.
>    */
>   
> +#include <xen/cpu-topology.h>
>   #include <xen/errno.h>
>   #include <xen/init.h>
>   #include <xen/lib.h>
> @@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
>   {
>   #ifdef CONFIG_X86
>       return cpu_data[cpu].x86_num_siblings;
> +#elif defined(CONFIG_CPU_TOPOLOGY)
> +    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;

Shouldn't here be CONFIG_GENERIC_CPU_TOPOLOGY?

~ Oleksii

