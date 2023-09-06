Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B847938B8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 11:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596431.930323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdp4f-000536-H9; Wed, 06 Sep 2023 09:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596431.930323; Wed, 06 Sep 2023 09:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdp4f-00050m-Dl; Wed, 06 Sep 2023 09:43:49 +0000
Received: by outflank-mailman (input) for mailman id 596431;
 Wed, 06 Sep 2023 09:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KsGs=EW=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1qdp4e-00050e-GL
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 09:43:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df43a516-4c99-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 11:43:46 +0200 (CEST)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-Vvk8yWiXObaiJznqKvZhTw-1; Wed, 06 Sep 2023 05:43:41 -0400
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fe55c417fcso3777057e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 02:43:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:6c00:92a4:6f8:ff7e:6853?
 (p200300cbc70c6c0092a406f8ff7e6853.dip0.t-ipconnect.de.
 [2003:cb:c70c:6c00:92a4:6f8:ff7e:6853])
 by smtp.gmail.com with ESMTPSA id
 fj15-20020a05600c0c8f00b003fe2bea77ccsm19856818wmb.5.2023.09.06.02.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 02:43:39 -0700 (PDT)
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
X-Inumbo-ID: df43a516-4c99-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693993425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vefdYlMR/8ArdCua+cW/iz5J210AzDO/E5mu7BSKJE=;
	b=JlqVnKsOfM1RvABnsFPPDDMuMONyRoK6mmH32ncxuEa9ByyEHe5+6hD6j/2vvo6W1C2upE
	LE21X4eArT6X5DhI98iexhCc+skBK3zdjYZQdXFYdF2gYwPWDBapKDGXhuNNkOZuYhQnkT
	7kE1Mg4R6phxpwJlFUBpwEtQizOvNbs=
X-MC-Unique: Vvk8yWiXObaiJznqKvZhTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693993420; x=1694598220;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vefdYlMR/8ArdCua+cW/iz5J210AzDO/E5mu7BSKJE=;
        b=GppWKMvHBdRZ+/ZIGiQGyNA59q26AnO0c8b5cLx+yFo42JB2AniZ4IEk4bGcBWOLFN
         EPVBQIv8+FL/AK6aqbP0ONjpJj49tNztviNAcNHkwmgHzMkNhQDt5dhARjmklCRSDZXs
         IHdzc/0LjgFKEO57pkSPT5mts3OARpZwEpR3Nqf13T5kOvpzCCZenijNB6epDo9ugxtz
         6otQORlIf9c3HgDdVoRynPiKtyEwM0ZKFhZBqNh/rdLBtFONhDTiEssb3q3dhArjLdLB
         5ecJ0Qi42zGbi+ZW0/RVmaBHEBbc8YiuziWN5Ap3eAI9jTxC2NbuLhq4u/wq+5z3Q0CS
         9UcA==
X-Gm-Message-State: AOJu0YxZzPOmhkv2/wZ+mhH56RiG6o33yTIKQA8NBdiOLT/3T5O7+3rZ
	wZpGIrwr/35++Ts5xvgyNDWnykm2TC83wCRhtUqrX8qI061tvfoI0Zuk7KXuZz2QzemX8rE+xd9
	ih/WZKQZKpgXctmU/3gNTlwU3hvU=
X-Received: by 2002:a05:6512:3b95:b0:501:bee7:487b with SMTP id g21-20020a0565123b9500b00501bee7487bmr2207171lfv.11.1693993420463;
        Wed, 06 Sep 2023 02:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+kyCh8ge5omnOO19l81ywndCSnl3vv4iOpfU70qjIprwIBa/mvZhLPu1h129TM4P09QBp6g==
X-Received: by 2002:a05:6512:3b95:b0:501:bee7:487b with SMTP id g21-20020a0565123b9500b00501bee7487bmr2207152lfv.11.1693993420099;
        Wed, 06 Sep 2023 02:43:40 -0700 (PDT)
Message-ID: <12cb4d92-948b-d87b-8fe6-57e3bbcee248@redhat.com>
Date: Wed, 6 Sep 2023 11:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] sysemu/xen: Allow elision of
 xen_hvm_modified_memory()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Xu <peterx@redhat.com>
References: <20230905122142.5939-1-philmd@linaro.org>
 <20230905122142.5939-4-philmd@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230905122142.5939-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.09.23 14:21, Philippe Mathieu-Daudé wrote:
> Call xen_enabled() before xen_hvm_modified_memory() to let
> the compiler elide its call.
> 
> Have xen_enabled() return a boolean to match its declaration
> in the CONFIG_XEN_IS_POSSIBLE case.
> 
> Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


