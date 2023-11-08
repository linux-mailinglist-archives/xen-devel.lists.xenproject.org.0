Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EC27E57FE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 14:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629288.981381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ijw-0006TN-ME; Wed, 08 Nov 2023 13:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629288.981381; Wed, 08 Nov 2023 13:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ijw-0006RI-Jd; Wed, 08 Nov 2023 13:37:04 +0000
Received: by outflank-mailman (input) for mailman id 629288;
 Wed, 08 Nov 2023 13:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHnU=GV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r0ijv-0006RA-Aw
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 13:37:03 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e61f9fe0-7e3b-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 14:37:02 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so8556103e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Nov 2023 05:37:02 -0800 (PST)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y14-20020a056000108e00b0032dbf6bf7a2sm4912658wrw.97.2023.11.08.05.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 05:37:01 -0800 (PST)
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
X-Inumbo-ID: e61f9fe0-7e3b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699450622; x=1700055422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7QLBRLI1wgBCkrs9LSadSPCeqsJ/5DX3pEmuYTPpzE=;
        b=AxRBsMQ/bcJ+yUNRE1K3RKRQ+V9kU5xrHsNdrnjFYoAKcN8xmFvFPCvjpG7XaSXhGG
         GdAdsvbHXNDOQo+DVNihUzm2qAYPEzBwE7LuXNVB11uOMXBtOf+gBTNl0AY7+i7GrbIx
         JwcQjeeIzo4UE9Lzjl4O9kwDXAuYP1WE3RZdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699450622; x=1700055422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7QLBRLI1wgBCkrs9LSadSPCeqsJ/5DX3pEmuYTPpzE=;
        b=iiYgZPPvzZje9z+UWgv6gt1CBJVKaBAuyspaAgxHMYye60zk65wNadKQPAWihpVpUY
         uimhGPvMwwIDg5JAFA3a42p9LQZAK5rG4CzYzDpIkyHyGVaIdDiJxXSe+boIeqw6WLB/
         emGE5eTP+2h7DTvElEW3HdoFYgEB2E8ZQtSMed0lU1q1kKkKkDiqINw1c59tXEwwmdvm
         61EIQIgIbqfghB1agYaZCbrEcPhwUMv1pG1VWTl4WyMxV7maNVztSw6p/XQQXmnCPXYl
         sTeugEo+TKuZAcLZW8u0gOmDMw594dWckgv5JfT1coPT2Y9UvJ/UKgz2Ii39hpV53u2Z
         NhZQ==
X-Gm-Message-State: AOJu0YyoSwskBYVIms3j8eb2HqWR4OPAiNxU2MiXbSkHJ3W2CGIxDhqq
	xnBQ4uXPnhew5HKOHznCjFHTIA==
X-Google-Smtp-Source: AGHT+IGVLK4uf/78yk7nORdT5ctcPMhQOKhJLf6MJfJvnikmAt0SykYhXpFy3N6rPAOI0y4akdUrCw==
X-Received: by 2002:a05:6512:1325:b0:507:cb04:59d4 with SMTP id x37-20020a056512132500b00507cb0459d4mr1406185lfu.8.1699450621870;
        Wed, 08 Nov 2023 05:37:01 -0800 (PST)
Message-ID: <49ea5252-b06c-4b2f-8600-c58cbbfb4957@citrix.com>
Date: Wed, 8 Nov 2023 13:37:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2023 5:58 pm, Nicola Vetrini wrote:
> Static analysis tools may detect a possible null
> pointer dereference at line 760 (the memcpy call)
> of xen/common/domain.c. This ASSERT helps them in
> detecting that such a condition is not possible
> and also provides a basic sanity check.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> The check may be later improved by proper error checking
> instead of relying on the semantics explained here:
> https://lore.kernel.org/xen-devel/61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com/
>
> This addresses the caution reported by ECLAIR for MISRA C:2012 D4.11
> ---
>  xen/common/domain.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8f9ab01c0cb7..9378c0417645 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -700,6 +700,8 @@ struct domain *domain_create(domid_t domid,
>  
>      if ( !is_idle_domain(d) )
>      {
> +        ASSERT(config);
> +
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;
>  

I have an idea that might resolve this differently and in an easier way.

Would you be happy waiting for a couple of days for me to experiment? 
Absolutely no guarantees of it turning into a workable solution.

~Andrew

