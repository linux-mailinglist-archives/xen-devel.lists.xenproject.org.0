Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E27F50E6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 20:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639132.996090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tDE-00006Z-Fw; Wed, 22 Nov 2023 19:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639132.996090; Wed, 22 Nov 2023 19:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tDE-0008VY-DC; Wed, 22 Nov 2023 19:48:40 +0000
Received: by outflank-mailman (input) for mailman id 639132;
 Wed, 22 Nov 2023 19:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5tDC-0008VS-Q9
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 19:48:38 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2102d243-8970-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 20:48:38 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so862485e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 11:48:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 k1-20020adfe8c1000000b00331733a98ddsm172859wrn.111.2023.11.22.11.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 11:48:37 -0800 (PST)
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
X-Inumbo-ID: 2102d243-8970-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1700682517; x=1701287317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JtE1vGAP7hNulnSVZ+f6hZT9VlM+/K446//+sLJ6zE=;
        b=dJkHU/pjDmTIvUGI+0w81l+SKJgnDjjIFBQMeCzDmTHyYM+5KGVEvqnrbSOVJxO/S0
         RDRKfYUodS25zYuOG7KxRyqs4i+3c44sTOWdpRS3+PwpPJl4/fIrDSy0Oiyq+D1iJpcP
         CDoctoF/FoYmV7yTLUAyoJOl0m98LxIDobrSI3gy6kpRMWLxeNYiAP0fWIQSis3h3Lfa
         p2K3EYK1K90EfRp3tslzMdK872qKVg/k/cD1nsDepQDhmeVIRCPnw6NN3LulGqctFbai
         hgtxwEffPpU3fvEWzvCCleiDhQcxKXMexnLfrUNoW5sl7OT2ecVt5zAmpojP1O49tWcT
         2OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700682517; x=1701287317;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JtE1vGAP7hNulnSVZ+f6hZT9VlM+/K446//+sLJ6zE=;
        b=vMYAfyeJS3zQlZDom6cAIILN4ippHF9H+gtCQ3d/AUjuo1gavJXtJkwAeByxnfWXze
         w/Xqu+G2ikxuagfJ/UkIJLiIG1WAYElBKNTygD7QACVW9yhbMhq3KNWqb/nWGA8/jjBT
         mts/MilvEClgtXEJSsCF6BqCtwwiSkO4322SWm59/eGVTjtREr5VRSsZ6oLO6qtu4Isq
         bzYEnN3guod1MAHchqHPh5QAQvuOvXS5jzyeL+klMthpwhmv1BB+uiT2kAwepLgmNV4u
         lGxytmkKZnPMO4IxWbFXYSLJugRuvVkV+c9V8hvHRIUHVRsMBgwpqFUrrFisA06Io7oT
         5BxQ==
X-Gm-Message-State: AOJu0Yz98fQRhKKWhxXSW2UzZe+KvSs/muDj0zemLLyDqmdAOb/jc5/f
	7tkUlq6/MmR4wLFwOuep7ieodQ==
X-Google-Smtp-Source: AGHT+IGuSijG7TZsnIXKGSGaDY8xoEeX5nYYuxdZJ1TBgBO4kgAuJkR89OTHPE93OqjGw1ZcxqmZNg==
X-Received: by 2002:adf:fdc7:0:b0:331:6daf:edc4 with SMTP id i7-20020adffdc7000000b003316dafedc4mr2357398wrs.11.1700682517399;
        Wed, 22 Nov 2023 11:48:37 -0800 (PST)
Message-ID: <e077f551-f4d4-4fe3-9726-2a877f9f718b@tibco.com>
Date: Wed, 22 Nov 2023 19:48:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tools/pygrub: Set mount propagation to private
 recursively
Content-Language: en-GB
From: Andrew Cooper <andcooper@tibco.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-2-alejandro.vallejo@cloud.com>
 <4d31c9f5-faf3-47f7-976e-2d5665ba446d@tibco.com>
In-Reply-To: <4d31c9f5-faf3-47f7-976e-2d5665ba446d@tibco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2023 7:46 pm, Andrew Cooper wrote:
> On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
>> This is important in order for every mount done inside a mount namespace to
>> go away after the namespace itself goes away. The comment referring to
>> unreliability in Linux 4.19 was just wrong.
>>
>> This patch sets the story straight and makes the depriv pygrub a bit more
>> confined should a layer of the onion be vulnerable.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Sorry, wants

Fixes: e0342ae5556f ("tools/pygrub: Deprivilege pygrub")

too.  Will fix on commit.

~Andrew

