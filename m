Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E14F130C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 12:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298237.507982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbJqO-0003Tt-IY; Mon, 04 Apr 2022 10:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298237.507982; Mon, 04 Apr 2022 10:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbJqO-0003Rt-Eu; Mon, 04 Apr 2022 10:21:56 +0000
Received: by outflank-mailman (input) for mailman id 298237;
 Mon, 04 Apr 2022 10:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmI9=UO=redhat.com=hdegoede@srs-se1.protection.inumbo.net>)
 id 1nbJqN-0003Rn-7S
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 10:21:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0befc070-b401-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 12:21:53 +0200 (CEST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-8BYZRLUxOY68ZO9CxOEyMA-1; Mon, 04 Apr 2022 06:21:51 -0400
Received: by mail-ej1-f71.google.com with SMTP id
 qw30-20020a1709066a1e00b006e7f3de1be3so778655ejc.11
 for <xen-devel@lists.xenproject.org>; Mon, 04 Apr 2022 03:21:51 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 bj13-20020a170906b04d00b006e742719b9fsm2200534ejb.7.2022.04.04.03.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 03:21:49 -0700 (PDT)
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
X-Inumbo-ID: 0befc070-b401-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649067712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrIiVtW7zL/EZbvvEh1ijtvz57/RGSqRlI7BljZYLs4=;
	b=LUre/Wm6NpHO0CNcnHZIqvT9odDlWkBu8bui54by19DMqAwNmmC1KnUwcW/A/ENslPfPLy
	gNS5eKxW4GjCmk/P4OLIbbDT58C42aVGuovQdBz0RyJ/to57xlxHmUMHzQa4+1Xg/11/n0
	/awA19XZLDuTg/7xDISvxL2a5I+G8DQ=
X-MC-Unique: 8BYZRLUxOY68ZO9CxOEyMA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NrIiVtW7zL/EZbvvEh1ijtvz57/RGSqRlI7BljZYLs4=;
        b=HrDXcTVMBIUGw91qpampMGbJbg2mwnaOqOMEYm4X3ZDe0Rry1WkhbZ9njVfwsoPyQ5
         DZ5nKFMnaCM9VriWflvEH3yVMozc3qaIjbbCK0CpYVJq6dcVV4mZHGhNmCKUK4DhM7E6
         jPeUcEUxLmkQNXgG0ULe6KhNRBdbMLE4U0qTKHm3EKYVLzQter2B+IQkbI8k9MtpIBSe
         nN4dLue+wRMQduTD+R2fdsMxNJ8QCTzlPJbpn7T2Xq97zpNZxtiRKdpnFhoce/jI1PTx
         YPMiXjK1wds2rqa0nMp0WmbLkRmm3N/JvGxNQwZin32csrNCd24+pkhIPLVnJkZ5oyIT
         ouUA==
X-Gm-Message-State: AOAM533Xb7JegkQwfiSzaCj4ziTSRvOihutI15m1Rb9c/+1eIQw532zm
	bWtRDwnr/zhg7inRspPab176QmNipb754DlfrVcPIZ8EM2asu9cMrY4Crk/vg7mT0RYVbH0AZE5
	oPwUP3TIoFWBvELMOsCBZWzawN+M=
X-Received: by 2002:a17:906:a398:b0:6ce:71b:deff with SMTP id k24-20020a170906a39800b006ce071bdeffmr9828058ejz.204.1649067710279;
        Mon, 04 Apr 2022 03:21:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3m+Zd29+/ftz6u00cEYEm1e5sEaOZfUaNREapxyh+NMbkZdJaoKQ+wjSusHi4JcoWwaYbYw==
X-Received: by 2002:a17:906:a398:b0:6ce:71b:deff with SMTP id k24-20020a170906a39800b006ce071bdeffmr9828042ejz.204.1649067710100;
        Mon, 04 Apr 2022 03:21:50 -0700 (PDT)
Message-ID: <98b58912-d0fe-0e4d-ef6e-3396840a1e4a@redhat.com>
Date: Mon, 4 Apr 2022 12:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86/dell: add buffer allocation/free functions
 for SMI calls
To: David Laight <David.Laight@ACULAB.COM>, 'Juergen Gross'
 <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Mark Gross
 <markgross@kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20220318150950.16843-1-jgross@suse.com>
 <accf95548a8c4374b17c159b9b2d0098@AcuMS.aculab.com>
 <2a4573e0-4a8d-52c1-d29b-66b13bfe376f@suse.com>
 <f04348c83155404c8ae4c8e5c3abedf2@AcuMS.aculab.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f04348c83155404c8ae4c8e5c3abedf2@AcuMS.aculab.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/18/22 23:28, David Laight wrote:
> From: Juergen Gross
>> Sent: 18 March 2022 16:56
>>
>> On 18.03.22 16:22, David Laight wrote:
>>> From: Juergen Gross
>>>> Sent: 18 March 2022 15:10
>>>>
>>>> The dcdbas driver is used to call SMI handlers for both, dcdbas and
>>>> dell-smbios-smm. Both drivers allocate a buffer for communicating
>>>> with the SMI handler. The physical buffer address is then passed to
>>>> the called SMI handler via %ebx.
>>>>
>>>> Unfortunately this doesn't work when running in Xen dom0, as the
>>>> physical address obtained via virt_to_phys() is only a guest physical
>>>> address, and not a machine physical address as needed by SMI.
>>>
>>> The physical address from virt_to_phy() is always wrong.
>>> That is the physical address the cpu has for the memory.
>>> What you want is the address the dma master interface needs to use.
>>> That can be different for a physical system - no need for virtualisation.
>>>
>>> On x86 they do usually match, but anything with a full iommu
>>> will need completely different addresses.
>>
>> Yes, thanks for reminding me of that.
>>
>> The SMI handler is running on the cpu, right? So using the DMA
>> address is wrong in case of an IOMMU. I really need the machine
>> physical address.
> 
> That ought to be handled by the 'dev' parameter to dma_alloc_coherent().
> 
> 	David

I must admit that I'm not too familiar with all the intricate details
of the DMA API here.

So does this mean that the patch in its original form is good as is
and should be merged?

An Acked-by or Reviewed-by from someone more familiar with the DMA
APIs would be helpful.

Regards,

Hans


