Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0108C92FC54
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 16:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758103.1167376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSH1s-0000A8-EG; Fri, 12 Jul 2024 14:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758103.1167376; Fri, 12 Jul 2024 14:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSH1s-00007R-BT; Fri, 12 Jul 2024 14:13:44 +0000
Received: by outflank-mailman (input) for mailman id 758103;
 Fri, 12 Jul 2024 14:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSH1q-00007L-Ut
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 14:13:42 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0e5cfea-4058-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 16:13:42 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-79f17d6be17so138867785a.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 07:13:42 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b61baa24e4sm35254046d6.143.2024.07.12.07.13.38
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:13:39 -0700 (PDT)
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
X-Inumbo-ID: f0e5cfea-4058-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720793620; x=1721398420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GHkFk9bN5Y1Rd//bbLIXJyIKgY2bEX6E8FVlUzvBqr0=;
        b=khvpYAt/kDDyHhuUnhIctJUoke4M10rqboNdJn36P7rfwTKS6hOAxl5v36wWnMc0MC
         /ieVeiDOD37HkShoWcaO91hiJ8lrahgEc55F9fn2SFqlAoA1lnY3RXRYgDyGLdSUBqW6
         VGksn0QsxeXvYgPA9M7BUTHolWdY2+RjWmTss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793620; x=1721398420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHkFk9bN5Y1Rd//bbLIXJyIKgY2bEX6E8FVlUzvBqr0=;
        b=K9miveKj3sytPaFmgLldjNtrQxCK877vrXGOhb1Q9KNzH4zoUcZvQH72vMAobsjvhA
         72ijTpFyahvJO2vfu4xV+Cx9dX7vXNuDil+E6LzvZS7Ox8pEHQFL7FGr3xACTG2pyho1
         fQa6jTpyUvWhcX4tQctddzw9QWAAn0C1lZNgHGbJZptTR5l0t8clxqPNYqSRC1f1fGPv
         G6goQOaLrWEci2Ju+ItjdirPCDE5QBqh+pswN4MmuMPoajpXTlE41n/rkHW42dVQWebD
         HnRUU3WdUpizEyXIF1gwdvPDaYD3Bxfa5M3IWS1cDyFPyO0VrhwsAdUn80bORGS5aPEM
         rywQ==
X-Gm-Message-State: AOJu0YyV5TTpbLEIi+bp7E2XtG4WtR6sw0KHGD1Zf+oUvk27n8KyPENy
	H2VhajNXFXS/0oEsuF/2gujk3uqaXX39UMwm6nqEv3gX5lLTYl/k7zdjjfDfY2cJt9Djzf7b9z+
	6
X-Google-Smtp-Source: AGHT+IG5yUOghi/Qb0ASsXpx4jz9b9dR/HHonB6K29LYoMKvEXYANJr73xqALCWSYskguiylWcEzrQ==
X-Received: by 2002:a05:6214:622:b0:6b5:3b00:7e62 with SMTP id 6a1803df08f44-6b61bc7e9cdmr165466176d6.8.1720793619700;
        Fri, 12 Jul 2024 07:13:39 -0700 (PDT)
Message-ID: <793ad2fa-fc9b-47b4-a2f2-b7d06d4ee76d@citrix.com>
Date: Fri, 12 Jul 2024 15:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/12] CI: Refresh Ubuntu Bionic container as 18.04-x86_64
To: xen-devel@lists.xenproject.org
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240712104842.3237603-1-andrew.cooper3@citrix.com> <ZpE5sSKfNaQmBQcc@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZpE5sSKfNaQmBQcc@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/07/2024 3:12 pm, Anthony PERARD wrote:
> On Fri, Jul 12, 2024 at 11:48:42AM +0100, Andrew Cooper wrote:
>> As with 16.04 (Focal), except that ninja-build is available so QEMU can be
>                  ^ Xenial
>
> These names all mixed up after a while :-)

Bah, yes.  This is one of the few cases where numbers are superior to
names.  Will fix.

>
>> built.
>>
>> This halves the size of the container:
>>
>>   registry.gitlab.com/xen-project/xen/ubuntu    18.04-x86_64           860MB
>>   registry.gitlab.com/xen-project/xen/ubuntu    bionic                 1.44GB
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

~Andrew

