Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836316AE362
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:55:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507488.781052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYic-0005e2-DY; Tue, 07 Mar 2023 14:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507488.781052; Tue, 07 Mar 2023 14:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYic-0005ax-A8; Tue, 07 Mar 2023 14:55:10 +0000
Received: by outflank-mailman (input) for mailman id 507488;
 Tue, 07 Mar 2023 14:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYia-00054P-S1
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:55:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d31b93f-bcf8-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:55:07 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id q16so12415716wrw.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:55:07 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 b12-20020adff24c000000b002c556a4f1casm12617551wrp.42.2023.03.07.06.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:55:07 -0800 (PST)
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
X-Inumbo-ID: 0d31b93f-bcf8-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200907;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XA/NAYD6pwc+pXkUFmmZy5IGkzSi/8bTC+EPVMws5nk=;
        b=ncg2aoY2EtLcVn6fo/2NGzUYpVCilRwl86dc60WpdJhLQZzCfwxskpTYg3Ok2eTGbp
         tsOoazvPDdkJ0tqhgHKrFVLMXHJPSjRX4eo49yViq3xsaGeLeRlGWmtyyybfbG3EHB/4
         DtE/O4zxUMD2yLJonrXV1kGd3cggml66/DyNVLE2XrR2gMUyOBh3hpE9GFK83kF+5b6X
         ffQQEHVlbQU+oVWoTsEj+3H3SN7GYcPRJOjw97ngONxUofCl5Pdo+1s2wmCsI0kNOLXn
         UNxHgGjReRkhlxKTN7G3KVdAe5dDPwE3OKRCfi48KElCekxqfE6TAMSG2OwZwXjMUEtk
         H9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200907;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA/NAYD6pwc+pXkUFmmZy5IGkzSi/8bTC+EPVMws5nk=;
        b=eqSKe7Nl/pdTia2NeUVpXLiYVVwmZmD2LTzEHnr2u0lVt0+3cI53C/siALUoIIsmpf
         nyV9lBaJDseCd+mIriNsd/myISe9O5vkEOp0kU1O4+C7U7AArd/UcDRaFofICnXLJ0i8
         H8GtUvVnOtu19NsMvpVJ5+roEs/hkW7Qt+8LQht+E2j6L1mU+TJGVOiIHIConoA/6ZnF
         FghQhlqtJSxkhTkfbhn6g62H2jEgPAW9d6xL/HkjuB9g2iO3ZoKpj6BBNb9hqHoYmpMD
         sPLKgHnoo6wkh8am95uIYeQZl8X+jAGM3VX3a6oOVArOPGQo7kn9y8Bq6Ln3c8dN/4EC
         v/PA==
X-Gm-Message-State: AO0yUKXOsNAteVx6dKnvnKl208IkvTra+7RjgS8Unch7ZzXnkjmsNjvp
	/ZX/dm2b0HC13GH8Vy3xRiQ=
X-Google-Smtp-Source: AK7set+5Et3zAvZoLz5mLfpED4oVxVuf2t0dm2UaCbjRw16qwccO+sPSw+JpiagnXH9otWDv9Gy9vA==
X-Received: by 2002:adf:dd8b:0:b0:2c7:62c1:f09c with SMTP id x11-20020adfdd8b000000b002c762c1f09cmr8259135wrl.50.1678200907465;
        Tue, 07 Mar 2023 06:55:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <dfe013bc-c55d-d1ea-cb5c-a90d51f812ee@xen.org>
Date: Tue, 7 Mar 2023 14:55:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 13/25] hw/xen: Add xenstore operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-14-dwmw2@infradead.org>
 <71e68af5-1528-f5c3-221a-5166af9396c6@xen.org>
 <a5321652a4f0742edfbe8d14154959176d2538a5.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <a5321652a4f0742edfbe8d14154959176d2538a5.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2023 14:52, David Woodhouse wrote:
> On Tue, 2023-03-07 at 14:44 +0000, Paul Durrant wrote:
>> On 02/03/2023 15:34, David Woodhouse wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> You're reviewing your own code on some of those... :)
> 

Just making it clear I'm happy with the final version, since it's a 
joint S-o-b.

> Do we need to get review from *another* person listed in MAINTAINERS
> for Xen? Or shall I add my own R-by tags for those ones too?
> 
> 


