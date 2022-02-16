Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98074B8F83
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 18:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274339.469791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKOJR-0006ws-Jq; Wed, 16 Feb 2022 17:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274339.469791; Wed, 16 Feb 2022 17:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKOJR-0006ur-Gd; Wed, 16 Feb 2022 17:41:57 +0000
Received: by outflank-mailman (input) for mailman id 274339;
 Wed, 16 Feb 2022 17:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mysP=S7=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nKOJQ-0006uC-Kp
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 17:41:56 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baaa8ed6-8f4f-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 18:41:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so2177615wmq.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 09:41:54 -0800 (PST)
Received: from [10.7.237.11] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id f6sm17766743wrv.116.2022.02.16.09.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:41:52 -0800 (PST)
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
X-Inumbo-ID: baaa8ed6-8f4f-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HN1cnZIM+2c6AwqG2zJl30d6wjpvV3kxpHsI8UO8ePU=;
        b=D7ytF1NbZChAhiEdKbJ+9KAPftufFNIntajMb6EKGWNKE34sFyCyF5/vS1TG8jHxtC
         W4PxrIkUdfbLFnq1EUoKkAtsI95mdTEc+fLnMdwHz6b/rLvjCZpHVQWdpD5rhE3tSrlj
         f6iQS6g0U0n09xqbX4Mm30O8XeVEED+f8M0aL/5nh1R3cUVuq/0fnY/JG7LtHQRaiLeK
         uUS53ZR+zffjpBP6Hq+EGHq1LGoAyeoBbOfu6gcb1U9w9TUyyVnNEbgx2pQqagZHc0V2
         Ey83QmfGj/d86NkdBNV950azpoNIf5eZaejKPOankqmnEUpO/A0BmrPJiYf1YmG36ajc
         QUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HN1cnZIM+2c6AwqG2zJl30d6wjpvV3kxpHsI8UO8ePU=;
        b=IT6vPzugQKYTvNJuxpSt/JzgPBKs4IMY9xnU1/FEKP6Xv0+heykpjTzj9PVLObqXjT
         o93X+ErnJ4AOP444BlW1k6qB7s1sQbxiPDB/3Cvf5YOXOC3enEALkG66e4uu2xLf2Y85
         iGREV6OiOW/ZaxDwAnnHsfhyZOGX0FsY8XLMc27OJZaO8IR9A+3b4rxbR9sepKSNkc+Z
         W8I3gGHI7eAKH0UkfX7w4mQYbzZnqlotrVlZUfACQ+cPVvPQNOnlsmObA4XKlI+d47Q2
         gvGGdAxVjcVyJfiTEN553CExyB7ZTY5mxuGxhR6CeF61Nb+fUNBdgnoq3axap64uXMaQ
         RtnA==
X-Gm-Message-State: AOAM530aEJ4ZjFOnrMtMsY3VDFhKK+E4cKDXSrEbj8QxdYNZ8Lp/6PNr
	AavDyjmy4xNOQWcfgfO2RfU=
X-Google-Smtp-Source: ABdhPJxgnLkLjbbPKAByVAnZYmcqCVuwZfGZ5bs08g3kJYK7G/pWjkSHQ0+M4Jt2PEnALHmIEm20Yw==
X-Received: by 2002:a05:600c:3d06:b0:37b:a5ea:a61b with SMTP id bh6-20020a05600c3d0600b0037ba5eaa61bmr2651558wmb.32.1645033313513;
        Wed, 16 Feb 2022 09:41:53 -0800 (PST)
Message-ID: <470464ca-f8c4-e95e-9443-1b2b8538490a@gmail.com>
Date: Wed, 16 Feb 2022 17:41:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 RFC 4/5] x86/ioreq: report extended destination ID
 support by emulators
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, paul@xen.org
Cc: xen-devel@lists.xenproject.org, dwmw2@infradead.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-5-roger.pau@citrix.com>
 <73c3db96-fbca-9d03-d645-4d44ab6a640f@gmail.com>
 <Ygzgz3PONncqIH16@Air-de-Roger>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <Ygzgz3PONncqIH16@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/02/2022 11:32, Roger Pau Monné wrote:
> On Wed, Feb 16, 2022 at 10:53:58AM +0000, Durrant, Paul wrote:
>> On 16/02/2022 10:30, Roger Pau Monne wrote:
>>> Introduce a new arch specific field to report whether an emulator
>>> supports the Extended Destination ID field, so that the hypervisor can
>>> refrain from exposing the feature if one of the emulators doesn't
>>> support it.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v1:
>>>    - New in this version.
>>> ---
>>> RFC: I find this kind of clumsy. In fact fully emulated devices
>>> should already support Extended Destination ID without any
>>> modifications, because XEN_DMOP_inject_msi gets passed the address and
>>> data fields, so the hypervisor extracts the extended destination ID
>>> from there.
>>>
>>> PCI passthrough devices however use xc_domain_update_msi_irq and that
>>> has leaked the gflags parameter in the API, even worse the position
>>> of the flags are hardcoded in QEMU.
>>>
>>> Should the clearing of ext_dest_id be limited to the domain using an
>>> IOMMU?
>>>
>>> RFC: Only enable ext_dest_id if max_cpu > 128? So the device model is
>>> aware the domain must use ext_dest_id? (implies device model knows
>>> APIC ID = CPU ID * 2)
>>
>> There is still only a single sync ioreq server page, so 128 vCPUs is the max
>> possible.
> 
> Right - so device models wanting to support > 128 vCPUs will already
> need to be modified, and hence we could assume that any HVM guests
> with > 128 vCPUs is using a device model capable of handling extended
> destination ID?
> 

Yes, exactly.

   Paul



