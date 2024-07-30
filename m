Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998AF94177C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 18:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767971.1178678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpRg-00032n-P3; Tue, 30 Jul 2024 16:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767971.1178678; Tue, 30 Jul 2024 16:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpRg-0002zf-MR; Tue, 30 Jul 2024 16:11:28 +0000
Received: by outflank-mailman (input) for mailman id 767971;
 Tue, 30 Jul 2024 16:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jiA=O6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYpRf-0002zZ-9E
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 16:11:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e792a51-4e8e-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 18:11:25 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7aa4ca9d72so608322766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 09:11:25 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9ef91sm656648066b.183.2024.07.30.09.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 09:11:23 -0700 (PDT)
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
X-Inumbo-ID: 5e792a51-4e8e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722355884; x=1722960684; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xQVQkKbp49zQfbKbZiSHRrf5rKdLrdFURpTxprBZC8c=;
        b=NNSAdjrkcvAaiRdbFKCjYmx3axlflZjmDxyLL80bx4Kf6bDRSMKkg64+3x4HPEcNPv
         HVuHM25i1HH9bGjFBkVZqfvKIAnMKSCwvPy8qhfE1v1wqbjg4VJZ0gNc94s2dP5NUr5i
         TPG7lofrwKtK/wsNBZ3KlLTTB5zP+yGTH+goA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722355884; x=1722960684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQVQkKbp49zQfbKbZiSHRrf5rKdLrdFURpTxprBZC8c=;
        b=qwi3x2hpuvzOklMlD05ytQuq1eN6QDu+lynWfv6D7xTDY0pvkvpSsxVm19VWKASC2f
         zsYArOfckBt8/zMaw5pPeZbFQjT3ygiuycIJ2M6dmrgaPZKLWobA08TMLeRrWdmzNDL1
         +mAjG4h3K9YAb3i1WxG1pwzYZP6o/Bbi4H9i0aJDxqI8t7qKXdfD9cS3Gp22Cp/lgfNp
         kg6tflTryXpijwzPrHY16EONYuoozH/tLWzsk47b2aWync9rKuuGuOWu/ZO+WEedoTXr
         gvKuxyRgDtnPU8Ay3hqByg8O12PUlGErL20OCBPCVzq5YVNyeFmJJvwibxjCK7muhi8M
         dh1w==
X-Gm-Message-State: AOJu0Yw3VM25OjuZbl3byfki+v5A61RFtdYDXn2PscAS8e3tgzHPBAWM
	R/7b8XSzfLxCmA7emEiUC2j4rh/KCuEdYu+74nkxlxmf8asrDeei+GJp7boUAfU=
X-Google-Smtp-Source: AGHT+IHhvKBo0ZZxDqESrM2vDo4lHvhQ4mlnrZ7X79hN1VA2rtipBfNGF81PKock2xc9f8Rxk0X2vg==
X-Received: by 2002:a17:907:9694:b0:a7a:ba59:3164 with SMTP id a640c23a62f3a-a7d40160f08mr880836566b.53.1722355884429;
        Tue, 30 Jul 2024 09:11:24 -0700 (PDT)
Message-ID: <e9230d77-24f0-42a1-8728-e9d6478a071e@citrix.com>
Date: Tue, 30 Jul 2024 17:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap
To: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com
References: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop>
 <ZqjuvjUtmNU7Ud8g@mail-itl> <9be4e130-c202-459d-bd58-d589b72af1c2@citrix.com>
 <Zqjzn5eM0z0njNF2@mail-itl>
 <alpine.DEB.2.22.394.2407300851390.4857@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2407300851390.4857@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2024 4:55 pm, Stefano Stabellini wrote:
> On Tue, 30 Jul 2024, Marek Marczykowski-Górecki wrote:
>> On Tue, Jul 30, 2024 at 03:01:52PM +0100, Andrew Cooper wrote:
>>> On 30/07/2024 2:46 pm, Marek Marczykowski-Górecki wrote:
>>>> On Fri, Jul 26, 2024 at 05:19:42PM -0700, Stefano Stabellini wrote:
>>>>> Upgrade Yocto to a newer version. Use ext4 as image format for testing
>>>>> with QEMU on ARM and ARM64 as the default is WIC and it is not available
>>>>> for our xen-image-minimal target.
>>>>>
>>>>> Also update the tar.bz2 filename for the rootfs.
>>>>>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>
>>>>> ---
>>>>>
>>>>> all yocto tests pass:
>>>>> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1390081173
>>> That test ran on gitlab-docker-pug, not qubes-ambrosia, so doesn't
>>> confirm the fix to the xattr issue.
>> There is one on ambrosia too:
>> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7423043016
> Yes indeed: I tested it in a previous run. The last test I let it run
> without additional constraints. But as far as I can tell the patch is
> 100% tested.
>
>
>>> Seeing as I'm going to need to rebuild the container anyway, I'll see
>>> about forcing this and double checking.
>> But double-checking is a good idea anyway.
> I did update the x86, arm64 and arm32 containers. Feel free to rebuild
> any of them.
>
> I'll commit the patch this afternoon if you don't get to it sooner :-)

Just the x86 container rebuild has been going on for the entirety of the
MISRA meeting...

If you've got one to hand already, please deploy it.

~Andrew

