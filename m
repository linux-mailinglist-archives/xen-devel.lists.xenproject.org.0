Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B75841F1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 16:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376859.609909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4hI-0007nG-E4; Thu, 28 Jul 2022 14:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376859.609909; Thu, 28 Jul 2022 14:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4hI-0007kO-B3; Thu, 28 Jul 2022 14:41:08 +0000
Received: by outflank-mailman (input) for mailman id 376859;
 Thu, 28 Jul 2022 14:41:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oH4hG-0007kI-El
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:41:06 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f5cf38b-0e83-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 16:41:05 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id t17so3229856lfk.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 07:41:05 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a2e9ccc000000b0025e243c8654sm173103ljj.60.2022.07.28.07.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:41:04 -0700 (PDT)
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
X-Inumbo-ID: 4f5cf38b-0e83-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SLyT3nCKq2Stsbqr+fV+9OLgxreVfVbSCR7cGYGGAEk=;
        b=ffwhAWX/8z1rXoY2HnweCXvNUYa2gXSnu1u+8CbF3kc/W7m7KPD4n8znVNyfSb4/Tu
         /9ARq5ifVjl1GWdN9b4LzP1flyszrqjmseafi2nvUVD7MoJtd8HPsCLDK1+69FhQVj7B
         OsrosMevLun9fr/SvSQQQqBbvNgJkCea73qvFDuNoStuNiJMcKRrJACxylH8lke747GU
         nLJ1bEQxFFP0Tg1DizXhG5TryvhfhqHYPjyH4JRpJa/iTYtXpdY9gkai113z9VEs6KvD
         1CMLwEAiTeEv8jNzst30byVvtEEscSz3AyExfVk9DJwEip05KgS3j3+wgo+h+JJrDc6r
         szGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SLyT3nCKq2Stsbqr+fV+9OLgxreVfVbSCR7cGYGGAEk=;
        b=SsooAizbAJ4qWKLOUB36CwLjEzq/Lsrmvxo9xBhFQgClwaZTen2fglWJwonPyquKbd
         U76oqsIgJzg93lJtjMC2/N8w9d5ZDzvQSBH37iNjX5VBIExywewg62JMdo4PKAl3cRfu
         dHi+5m5p72YlD11GrZiCQ0gHfwry5ZuqP/BoIoD5eR8K0iSVuHRLNy4JHjd2kNXndD2/
         F1xnbSqn28v5ZlUe6VZ2AOGESzNd0awX724mrhPQmE2UXRj7LNcsV2rm/ea3/PIeV6AL
         WFmFsj47KOFzogm+O415r/2YMC8zgs8lLPIreETFt20xy+Oh4xg3eM50Y8zMQWdjtOW7
         MZdw==
X-Gm-Message-State: AJIora9SzfSYu1tJ6feZ8PqalfR6wKd2nVfxSwK22QIQJVW8Oyqe7PAM
	DO5QsRtqs2HUHCLxhza6xIg=
X-Google-Smtp-Source: AGRyM1u62CZx3nKdHmddnXKFqeWhocFMrePac8ZyHic1zo+u/joLSO0zHRMew6AqybLIpKOlrRJjrQ==
X-Received: by 2002:a05:6512:3d2a:b0:48a:c013:b43b with SMTP id d42-20020a0565123d2a00b0048ac013b43bmr2269370lfv.533.1659019264850;
        Thu, 28 Jul 2022 07:41:04 -0700 (PDT)
Message-ID: <be7ce902-d2e9-bdcd-3f47-a64325216299@gmail.com>
Date: Thu, 28 Jul 2022 17:41:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 09/11] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-10-olekstysh@gmail.com>
 <3b3dd7bf-b528-b7ab-aec9-c912a30d9cd0@suse.com>
 <65aad251-2775-45cb-e642-3314f253ace6@gmail.com>
 <d94d2974-bf6d-3c2d-1672-e27662aa4ce7@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <d94d2974-bf6d-3c2d-1672-e27662aa4ce7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28.07.22 17:26, Jan Beulich wrote:

Hello Jan

> On 28.07.2022 16:16, Oleksandr wrote:
>> On 27.07.22 13:32, Jan Beulich wrote:
>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>
>>>> Assign SBDF to the PCI devices being passed through with bus 0.
>>>> The resulting topology is where PCIe devices reside on the bus 0 of the
>>>> root complex itself (embedded endpoints).
>>>> This implementation is limited to 32 devices which are allowed on
>>>> a single PCI bus.
>>>>
>>>> Please note, that at the moment only function 0 of a multifunction
>>>> device can be passed through.
>>> I've not been able to spot where this restriction is being enforced -
>>> can you please point me at the respective code?
>> Nor have I found the respective code.
>>
>> Could you please suggest a place where to put such enforcement (I guess,
>> this should be present in the toolstack)?
> Such check should be in the tool stack primarily to give a sensible
> error message to the user. Yet the hypervisor needs to check itself
> nevertheless. You know the code you're adding much better than I do,
> so I guess I'm a little puzzled by you asking me to suggest a place.
> (And for the tool stack I guess asking tool stack folks would get
> you better mileage.)

Thanks for the clarification.


I am still getting used to the changes which that patch series makes (I 
didn't write that code).

Asking for suggestion I didn't mean to point an exact place in the code, 
but rather a subsystem/software layer,

sorry if I was unclear.


>
>>>> @@ -124,6 +191,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
>>>>        if ( !has_vpci(pdev->domain) )
>>>>            return;
>>>>    
>>>> +    vpci_remove_virtual_device(pdev);
>>>>        vpci_remove_device(pdev);
>>>>    }
>>> And other call sites of vpci_remove_device() do not have a need of
>>> cleaning up guest_sbdf / vpci_dev_assigned_map?
>> I am not 100% sure, but it looks like they don't need. On the other
>> hand, even if they don't need that, doing the cleaning won't be an issue
>> at all,
>>
>> there is a check before cleaning (which will be extended as I proposed
>> above), so ...
>>
>>
>>> IOW I wonder if it
>>> wouldn't be better to have vpci_remove_device() do this as well
>>> (retaining - see my comment on the earlier patch) the simple aliasing
>>> of vpci_deassign_device() to vpci_remove_device()).
>>
>>      ... maybe yes. Shall I do that change?
> Well - yes please, afaic.


ok, will do


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


