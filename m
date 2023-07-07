Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55374B530
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 18:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560590.876617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHoa7-0000iY-HM; Fri, 07 Jul 2023 16:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560590.876617; Fri, 07 Jul 2023 16:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHoa7-0000fp-EE; Fri, 07 Jul 2023 16:45:19 +0000
Received: by outflank-mailman (input) for mailman id 560590;
 Fri, 07 Jul 2023 16:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zEh2=CZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1qHoa5-0000fg-TB
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 16:45:17 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6b23f43-1ce5-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 18:45:16 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b5c231c23aso34431131fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 09:45:16 -0700 (PDT)
Received: from [192.168.0.106] ([91.123.150.167])
 by smtp.gmail.com with ESMTPSA id
 a9-20020ac25209000000b004fbc6a8ad08sm742351lfl.306.2023.07.07.09.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 09:45:15 -0700 (PDT)
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
X-Inumbo-ID: a6b23f43-1ce5-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688748316; x=1691340316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLkW/hgt/ozYBGOqiaEtaZHsC+ZmrsXvgu2nxUx2jm4=;
        b=ibMKfHQVzVqX94+UXQsj1P+n+g7rP7MgX5YDQhU8KaSYAQTtbnlJtU/d0dh9xe6gkB
         P32oa8MUKng8AstW3AOXOf8NnFNgmbcox+slxmqDdqn8rnJfMJVfCJGjxUi2VXxZZuPp
         hDn6GYqeXHBmqKVqdfl20Qboq9LyPnM6F9bIw4qLW7bgbUuLGR3tUFVa9/2C/nL2l7l4
         DPw7fBj+Q7gIeBwQjUD4+m9ldmcNoZYmsxG4EUVIIC+1ImewPWpck2qjawxXVRMBl/5y
         a/6RzLTSLunnZyr2paBeJ/5GKNet8c5uF/rRJe7NKyyq76tG8C8qt1k4M8h1WOVEtFWP
         bu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688748316; x=1691340316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLkW/hgt/ozYBGOqiaEtaZHsC+ZmrsXvgu2nxUx2jm4=;
        b=agv8px0RVAjnqBW0+3UwkadpLkIHn6kZSiWO1xCfaDnfw8fjssdH+Wwz7wDhczr0WE
         umRSSEYatN6kTOU2y3HwKQUlPGCRD9V1B983cZLEaRZtDo7JmZ7kROWfyE8UmdSv5M4B
         AXdsYw6BL1RrhyDwYAyl5TDu2+5xiVaoCUp/ZZ9RkMPFIf3OUfSjdJ4SBz34rXUFYAAB
         XpPHM6gVVr/oI4c5xn3FdcZLeA8Y+epm0yOmrEjJ79msRON4+/TaGiSAvRG7MOH8Ex4t
         Z1ccvMO8kOOjEDYQk/nyRx58BE485TTrcv8Uxm3bmp69vCHy5mJ3GEqel21Nr0C6Ogxw
         pDXw==
X-Gm-Message-State: ABy/qLY1woieyzkfJnVdU2ZVXZgx/kSK/ClGO0S6YyaEbCP7mNpvX4xf
	Bfo4mwl0o5/PXbUJNq00M4E=
X-Google-Smtp-Source: APBJJlEMA8a25b1JAS0jkbMZ61puIL9z7YkwgN44MGfRoPJAQBUQoDsUiZlihYjV+tzLY2Dqvl/iRQ==
X-Received: by 2002:ac2:4db5:0:b0:4fb:9469:d65f with SMTP id h21-20020ac24db5000000b004fb9469d65fmr4016168lfe.37.1688748315707;
        Fri, 07 Jul 2023 09:45:15 -0700 (PDT)
Message-ID: <828f5936-3bdf-2bbd-158b-d29350a72e14@gmail.com>
Date: Fri, 7 Jul 2023 19:45:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 10/12] vpci: add initial support for virtual PCI bus
 topology
To: Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-11-volodymyr_babchuk@epam.com>
 <f368e425-157f-ea1c-2123-be8a374c328d@suse.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <f368e425-157f-ea1c-2123-be8a374c328d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21.06.23 15:06, Jan Beulich wrote:

Hello all


> On 13.06.2023 12:32, Volodymyr Babchuk wrote:
>> @@ -121,6 +124,62 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>   }
>>   
>>   #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +static int add_virtual_device(struct pci_dev *pdev)
>> +{
>> +    struct domain *d = pdev->domain;
>> +    pci_sbdf_t sbdf = { 0 };
>> +    unsigned long new_dev_number;
>> +
>> +    if ( is_hardware_domain(d) )
>> +        return 0;
>> +
>> +    ASSERT(pcidevs_locked());
>> +
>> +    /*
>> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
>> +     * there are multi-function ones which are not yet supported.
>> +     */
>> +    if ( pdev->info.is_extfn )
>> +    {
>> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
>> +                 &pdev->sbdf);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
>> +                                         VPCI_MAX_VIRT_DEV);
>> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
>> +        return -ENOSPC;
>> +
>> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
> 
> Since the find-and-set can't easily be atomic, the lock used here (
> asserted to be held above) needs to be the same as ...
> 
>> +    /*
>> +     * Both segment and bus number are 0:
>> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
>> +     *  - with bus 0 the virtual devices are seen as embedded
>> +     *    endpoints behind the root complex
>> +     *
>> +     * TODO: add support for multi-function devices.
>> +     */
>> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
>> +    pdev->vpci->guest_sbdf = sbdf;
>> +
>> +    return 0;
>> +
>> +}
>> +
>> +static void vpci_remove_virtual_device(const struct pci_dev *pdev)
>> +{
>> +    write_lock(&pdev->domain->vpci_rwlock);
>> +    if ( pdev->vpci )
>> +    {
>> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
>> +                    &pdev->domain->vpci_dev_assigned_map);
>> +        pdev->vpci->guest_sbdf.sbdf = ~0;
>> +    }
>> +    write_unlock(&pdev->domain->vpci_rwlock);
> 
> ... the one used here.


I think, it makes sense, yes.

***

There is one more thing. As far as I remember, there were some requests 
provided for the previous version (also v7) [1]. At least one of them, I 
assume, is still applicable here. I am speaking about a request to 
consider moving "cleaning up guest_sbdf / vpci_dev_assigned_map" into 
vpci_remove_device() here and aliasing of vpci_deassign_device() to 
vpci_remove_device() in commit #03/12.

The diff below (to be applied on top of current patch) is my 
understanding (not even build tested):

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a61282cc5b..c3e6c153bc 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,6 +51,15 @@ void vpci_remove_device(struct pci_dev *pdev)
          return;
      }

+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pdev->vpci->guest_sbdf.sbdf != ~0 )
+    {
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+        pdev->vpci->guest_sbdf.sbdf = ~0;
+    }
+#endif
+
      vpci = pdev->vpci;
      pdev->vpci = NULL;
      write_unlock(&pdev->domain->vpci_rwlock);
@@ -152,10 +161,14 @@ static int add_virtual_device(struct pci_dev *pdev)
          return -EOPNOTSUPP;
      }

+    write_lock(&pdev->domain->vpci_rwlock);
      new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
                                           VPCI_MAX_VIRT_DEV);
      if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
+    {
+        write_unlock(&pdev->domain->vpci_rwlock);
          return -ENOSPC;
+    }

      __set_bit(new_dev_number, &d->vpci_dev_assigned_map);

@@ -169,23 +182,12 @@ static int add_virtual_device(struct pci_dev *pdev)
       */
      sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
      pdev->vpci->guest_sbdf = sbdf;
+    write_unlock(&pdev->domain->vpci_rwlock);

      return 0;

  }

-static void vpci_remove_virtual_device(const struct pci_dev *pdev)
-{
-    write_lock(&pdev->domain->vpci_rwlock);
-    if ( pdev->vpci )
-    {
-        __clear_bit(pdev->vpci->guest_sbdf.dev,
-                    &pdev->domain->vpci_dev_assigned_map);
-        pdev->vpci->guest_sbdf.sbdf = ~0;
-    }
-    write_unlock(&pdev->domain->vpci_rwlock);
-}
-
  /* Notify vPCI that device is assigned to guest. */
  int vpci_assign_device(struct pci_dev *pdev)
  {
@@ -215,7 +217,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
      if ( !has_vpci(pdev->domain) )
          return;

-    vpci_remove_virtual_device(pdev);
      vpci_remove_device(pdev);
  }
  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
(END)



[1] 
https://lore.kernel.org/xen-devel/20220719174253.541965-10-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/20220719174253.541965-3-olekstysh@gmail.com/

> 
> Jan
> 

