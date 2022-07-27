Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52249582CA6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 18:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376367.609084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkDd-0000lg-Uk; Wed, 27 Jul 2022 16:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376367.609084; Wed, 27 Jul 2022 16:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkDd-0000iK-Rt; Wed, 27 Jul 2022 16:49:09 +0000
Received: by outflank-mailman (input) for mailman id 376367;
 Wed, 27 Jul 2022 16:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGkDc-0000iE-Sm
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 16:49:08 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0802353a-0dcc-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 18:49:07 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id a13so20282981ljr.11
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 09:49:07 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b0048a9c80b1e0sm1253989lfr.222.2022.07.27.09.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 09:49:06 -0700 (PDT)
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
X-Inumbo-ID: 0802353a-0dcc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=J+BIu8dvT0r9UxhXK/5a+hhRnuG2ihMDgGlCzp9aa9M=;
        b=A+RiozcYBpUWbMcD4KJfzXbEiScLtIeGNWtel9SOQpXL88xpLqBy/RTBm4GLWhcqqE
         AUsDe7OifKPd54OOSSG6l+bhY7xbiDv6+USTEGOeIeVTIVyAeRmzUg9PN8QgFjYazCBa
         blD03+kBqbc+iO24B0WXgxXwvYC6rbAXiuG+CCRCI14b3Oq2Mowdl+xrYBBdLy65+crk
         oCbKICo/4i5espo2alQmiw1MVk7AivyOcl6fjsWlE+M/afP6msM52OQ1i1YevF1zknMU
         AcXTBnIw7zxPuxHylbGfep5Ue2kZP9lISElUjEFkkbQbbSw+BuOp30DDiIJc8tbaQfUy
         qmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=J+BIu8dvT0r9UxhXK/5a+hhRnuG2ihMDgGlCzp9aa9M=;
        b=8Nfz3hbqL8zj3I5RSOW6hOl2k8GMiq0F5eWxWPROi++bh+FXrWZtlwB+Ldny0zpZgs
         lx4GxPKDNBOmWDfur7p3D5LMliueS3NZdgWAWfYNANV+I9HsHN85JgWT0bC8acocku1/
         PIHW3vSE8ODj0R3hnqdxtjY61nLTrga7SRjhun5NIEaqCo1JIDWZE46RtrSVxdjTYxfR
         1KHZTR6rmsRiyBd60SUe6UNTTY9SXKdhvRyHWkpCKWu1rF92DD2vVb77NjB7JGjSjjjn
         GQSXXryOJTScdMXJL56UHnQkqdp9OF2kozzieDJe5r6bTC+2ZS6klWJtKjb8zimMvYpG
         i4Kg==
X-Gm-Message-State: AJIora/+Y/43OnRKuvWZKa0fvsOsP7MjS5pwocxkQ8jxqTFc1K/NJ2/5
	exm9E1RASDkNoQagsBlxuGc=
X-Google-Smtp-Source: AGRyM1s2O7maffbnF7LSKnmwAcpbaPHjZm2fgkJAw8ECnae1P8fulcT2Ml5CTC/7Pah98/Lwx12hVw==
X-Received: by 2002:a05:651c:1a08:b0:25e:228c:a0e3 with SMTP id by8-20020a05651c1a0800b0025e228ca0e3mr1372463ljb.480.1658940547299;
        Wed, 27 Jul 2022 09:49:07 -0700 (PDT)
Message-ID: <6960a01d-f0a8-bedc-1e64-a64be29f8e88@gmail.com>
Date: Wed, 27 Jul 2022 19:49:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 02/11] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-3-olekstysh@gmail.com>
 <51afa25b-93ea-2685-b238-2edd9292bece@suse.com>
 <2e0efae5-27f7-831d-6f9e-06d03374b716@gmail.com>
 <a3947230-59f9-540a-4685-7e395e076fe8@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <a3947230-59f9-540a-4685-7e395e076fe8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27.07.22 17:35, Jan Beulich wrote:


Hello Jan

> On 27.07.2022 16:01, Oleksandr wrote:
>> On 27.07.22 13:03, Jan Beulich wrote:
>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>> @@ -1603,6 +1610,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>>                            pci_to_dev(pdev), flag);
>>>>        }
>>>>    
>>>> +    rc = vpci_assign_device(pdev);
>>>> +    if ( rc && deassign_device(d, seg, bus, old_devfn) )
>>> ... use pdev->devfn here.
>>
>> Thanks, good point, will drop old_devfn and use pdev->devfn. I am
>> wondering whether the printk after "done:" label (and other possible
>> printk-s down the code) should really use pdev->devfn instead of devfn
>> in PCI_SBDF construct?
> Yes, that's intended: If assigning a phantom function fails, this
> should be distinguishable from failure to assign the real device.


Thank you for the clarification.

Hmm, so before this patch the assigning of phantom functions was the 
last action before the "done:" label. So I will probably need to check 
for "rc" before calling vpci_assign_device().

Something like that:


[snip]

@@ -1602,6 +1606,17 @@ static int assign_device(struct domain *d, u16 
seg, u8 bus, u8 devfn, u32 flag)
          rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
                          pci_to_dev(pdev), flag);
      }
+    if ( rc )
+        goto done;
+
+    devfn = pdev->devfn;
+    rc = vpci_assign_device(pdev);
+    if ( rc && deassign_device(d, seg, bus, devfn) )
+    {
+        printk(XENLOG_ERR "%pd: %pp was left partially assigned\n",
+               d, &PCI_SBDF(seg, bus, devfn));
+        domain_crash(d);
+    }

   done:
      if ( rc )

[snip]


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


