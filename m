Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cXy4EpuHDGpmiwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:54:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE6F581C8B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313188.1583408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMlF-0002sk-Nd; Tue, 19 May 2026 15:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313188.1583408; Tue, 19 May 2026 15:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMlF-0002qS-Ks; Tue, 19 May 2026 15:53:37 +0000
Received: by outflank-mailman (input) for mailman id 1313188;
 Tue, 19 May 2026 15:53:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPMlE-0002qM-3z
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:53:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPMlD-0017HD-GS
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:53:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c875d-e002-0a2a0a5209dd-0a2a4506a894-38
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:53:35 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c877e-7371-0a2a45060019-d155da29cc18-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:53:34 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bcceb394417so471497766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:53:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4c313f7sm729557766b.21.2026.05.19.08.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 08:53:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779206014; x=1779810814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O4t1N0bCYhUC+V/br1cS6UwR+9JOwBLqjrWKwvA/ysg=;
        b=Bsac+DFYj7UGWWH+sj+SuK+/+lUri1haWfrPzATn62GuTT2FLtN7EwBx4J0UPcY3Fc
         j3oVLFHlU6LrKUIXiPNoD2s8dR7q3ZDrBnG85eVdGvuuPVrTLvnFCpssII8jfiChySjA
         qwJgVO4dDTnzI/a1rFSFhyCRBOIKKtduHERWwEGYaAPizch1cwgHpn5TaAljAespeMBo
         xoNGtNUu9xb2wMrdZYmmU+SpdE7XRrKFNqqvLq/aawSfjk7s9EKcG5ib8qa67e8mbi6X
         qdCIYUyYp8nMW2edkgspS5gvEQ9PYuAKtXqna8mRsWXaSdLVUQV9IH6mHOo6fIcsXAum
         DVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206014; x=1779810814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4t1N0bCYhUC+V/br1cS6UwR+9JOwBLqjrWKwvA/ysg=;
        b=JBXPta1kTMOtJZKVY1a0kDbeLM4ktgFWXz13a5mClAVT+S17L1Ip9FrkLVN6tpqq0F
         nJeT7/cqC3BfyW4stSfHT98yfUf9wD4WgsP75ZboZaEIN4NTl9UQ7p8szIZ5i7EJ2M5n
         DAh3GNTJ8BUkmBrFUg0wQDOOl4t1dBjIM8meFLM4xllW2MOCDoEW8ikvKoUdKXKOvVaP
         a+GKESrYFcuT+IgMkrtF51vZs+k4pfQ6nOZcmYZOI/r85D0vTxhCh9J7JegjYE3YGtyU
         1aC+HCWim4hHLPYsJewiyXK3Mh2HE424O1utFtOVCie9x6GyJHru9K0r82yMyM9XBIWg
         DXyw==
X-Forwarded-Encrypted: i=1; AFNElJ9J4H6yltrHru4TcAhQfE32ki47cMry7YSZwecAiD19PWGGdSms1IyDvJsNBLpCwOj3JXVgT2gLh54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQW6XLQETCTB1Sm53SphXx37hddhHvxx5bYVznMFNR/4Lq1rcJ
	0E6Ssr3jEjf/+jwL309QcOLgXmjmwGcA2HKDNp9/5wYecHWFDUSXLRTtmDwPKQ==
X-Gm-Gg: Acq92OEfCUC1fGwy9YTfBrNX3lMvMx8XoW3ZBs7rnuThygXKemEL5ByhClMiXXL/QXQ
	D9zL57bD7aZ3AVRHJ+peXXHAiJwE2EXvL04nvQmkxTNllK3LakRO5VOsWAExVocAfsBgJsqRob5
	5kmcTePqOjKiaBj5OlLtMJGZif9ks2iJzbdvi3KPd8MjUHMucyPHFld2m3IvwxqECLvsgpqQ+nQ
	8S+4DG7uinEN9rgrOiy6QI+areWmbYUTV/OjnZoY8fJiyxbeXgnvYC1IjKwCT138HzmUHxIVz+D
	tqG/VgTm48VGr4HHLfRny9y295FznTwzL3f5Mhvq2A0FnJIREEbo99rU/PrwaUKRN98VMInbuwW
	9ChcA88q3XJNzrhre2cDAtDiL96JW5fd7b/M5KLK7lCh+a+ZDyYK2d4IxPqgSgUDjfqxUgB2orS
	I3SQbSQUZL7RbEVYLW5GBcZ1gpbD9lLKoDtIDw3l31C6rUbU/qbA0keOjif57fGxRQh+PDWgtON
	wU=
X-Received: by 2002:a17:907:c248:b0:ba1:1181:b773 with SMTP id a640c23a62f3a-bd5177ee49dmr1237133666b.10.1779206013803;
        Tue, 19 May 2026 08:53:33 -0700 (PDT)
Message-ID: <fb53cadf-1913-4902-91c5-22a9f59c20f9@gmail.com>
Date: Tue, 19 May 2026 17:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix sstc init to write vstimecmp instead of
 stimecmp
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1779205126.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1779205126.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779206014-87F7BD75-96947F5B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1795
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
	FORGED_RECIPIENTS(0.00)[m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: CEE6F581C8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 5:38 PM, Baptiste Le Duc wrote:
> Commit <25e03273069036f5b46e14bbdf396ac79805d07e> mistakenly wrote to
> CSR_STIMECMP during sstc initialization instead of CSR_VSTIMECMP.

It doesn't too much sense to write this as ...
> 
> CSR_VSTIMECMP is the VS-level timer comparator: the hardware fires a
> VS-timer interrupt whenever (time + htimedelta) >= vstimecmp. Writing
> to CSR_STIMECMP leaves CSR_VSTIMECMP uninitialized, so its reset value
> may immediately satisfy this condition, generating spurious VS-timer
> interrupts before any guest has programmed the timer.

It could be just "According to the comment above initializing of 
CSR_STIMECMP CSR_VSTIMECMP should be used instead of CSR_STIMECMP" or 
something like that as what is mentioned here is mentioned in the 
comment above csr_write64(CSR_STIMECMP, ULONG_MAX).

> 
> Fix this by writing the ULONG_MAX value to CSR_VSTIMECMP as intended.
> 
With what I mentioned above this could be dropped.

... it should be here:
   Fixes: 25e0327306903 ("xen/riscv: allow Xen to use SSTC while hiding 
it from guests").

> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   xen/arch/riscv/time.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
> index 8769709e52..10b7e35f13 100644
> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -101,6 +101,6 @@ void __init preinit_xen_time(void)
>            * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
>            * ULONG_MAX.
>            */
> -        csr_write64(CSR_STIMECMP, ULONG_MAX);
> +        csr_write64(CSR_VSTIMECMP, ULONG_MAX);
>       }
>   }

The change itself looks good to me.

Thanks.

~ Oleksii


