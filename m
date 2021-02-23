Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7B32296E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 12:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88718.166947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEVnI-00013E-1v; Tue, 23 Feb 2021 11:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88718.166947; Tue, 23 Feb 2021 11:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEVnH-00012s-VC; Tue, 23 Feb 2021 11:23:55 +0000
Received: by outflank-mailman (input) for mailman id 88718;
 Tue, 23 Feb 2021 11:23:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C8r7=HZ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lEVnG-00012n-U5
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 11:23:54 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c1d878ea-0a77-430b-a906-4adbd58231d4;
 Tue, 23 Feb 2021 11:23:53 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-pXUsixvVPD6nmK-WXgKf2w-1; Tue, 23 Feb 2021 06:23:50 -0500
Received: by mail-wr1-f69.google.com with SMTP id l3so5573917wrx.15
 for <xen-devel@lists.xenproject.org>; Tue, 23 Feb 2021 03:23:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a3sm4521531wrt.68.2021.02.23.03.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:23:48 -0800 (PST)
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
X-Inumbo-ID: c1d878ea-0a77-430b-a906-4adbd58231d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614079433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqXHpRX9rxmTQG166I9+zJJichU2jtp55FS+xZ4AgUs=;
	b=V8QhmDZDsPRLyTSyb4mSzCxKqXi6SB/3ZtA3vEAgYj72RrcHSKMloGp1O/D+O/1K0AZYA8
	ykrjqbI4m8gTMx4W27z0OYgH9aWKxasnAaz4xYCibOUsu3UfUFpMegSNr176l+uKpb22Kz
	gRIwQhoCchkCDgLIxfuvUXgqZvz4tFg=
X-MC-Unique: pXUsixvVPD6nmK-WXgKf2w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fqXHpRX9rxmTQG166I9+zJJichU2jtp55FS+xZ4AgUs=;
        b=QTISatqmvDEfbtT1r8GPtpaR5HHz3AXNz77WozAqI6CvdxHIACCkzK2pqD92Lz3ZBC
         VRNroJuMHpCNb87lfM3YMvkX0mf5rLzvceuQ6OO3vgLoOl8aHQC2GQ7kM1zqBQHP8RlZ
         BzBMMemHgln0jypyw5ZOr7YdqqN2pysvefNg8B3N/SuAcqULgE3pDdQcZYmeaOClCBr+
         KYIdG6CK/EDEklGAeuxHB135N4W0Md5iAK+VXjnoSRCIkWI2J31ED5WbWcRJasZNWj6P
         4vtN6LRBFkLVCpnHEjEJEjvNdDg6H+aD7aa2ZGkCEvF2xjMhFHVIdDCqMlNz75znDn39
         m8Cw==
X-Gm-Message-State: AOAM531OyBRHg6xD4Ydm5LlE4TzcpCWqj672TJSKMYFcLP+Nb77ex3HB
	LKmF/s+RAqTILvbC5d6A0Qp572QLU5kKEUmrHZJhS968v/bHBQ0r46NDH0XgOe3xbZsX5i+S6ZG
	S4n4MVnbG/acmztlShl4jRUtWb3k=
X-Received: by 2002:adf:e444:: with SMTP id t4mr15063434wrm.97.1614079429579;
        Tue, 23 Feb 2021 03:23:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwL+4SwYURVZHwXSt7T2jcYFKjCeE7PCTmR6MVNodayFVhJQhTgY/EVJ9CycKefcbMINHdzhQ==
X-Received: by 2002:adf:e444:: with SMTP id t4mr15063387wrm.97.1614079429294;
        Tue, 23 Feb 2021 03:23:49 -0800 (PST)
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
To: Cornelia Huck <cohuck@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
 <YDQ/Y1KozPSyNGjo@yekko.fritz.box> <YDRAHW1ds1eh0Lav@yekko.fritz.box>
 <20210223113634.6626c8f8.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98ed9478-240d-cd20-ac84-82c540bd3e21@redhat.com>
Date: Tue, 23 Feb 2021 12:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223113634.6626c8f8.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/23/21 11:36 AM, Cornelia Huck wrote:
> On Tue, 23 Feb 2021 10:37:01 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> On Tue, Feb 23, 2021 at 10:33:55AM +1100, David Gibson wrote:
>>> On Mon, Feb 22, 2021 at 06:50:44PM +0100, Cornelia Huck wrote:  
>>>> On Mon, 22 Feb 2021 18:41:07 +0100
>>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>   
>>>>> On 2/22/21 6:24 PM, Cornelia Huck wrote:  
>>>>>> On Fri, 19 Feb 2021 18:38:37 +0100
>>>>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>     
>>>>>>> MachineClass::kvm_type() can return -1 on failure.
>>>>>>> Document it, and add a check in kvm_init().
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>>> ---
>>>>>>>  include/hw/boards.h | 3 ++-
>>>>>>>  accel/kvm/kvm-all.c | 6 ++++++
>>>>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>>>>> index a46dfe5d1a6..68d3d10f6b0 100644
>>>>>>> --- a/include/hw/boards.h
>>>>>>> +++ b/include/hw/boards.h
>>>>>>> @@ -127,7 +127,8 @@ typedef struct {
>>>>>>>   *    implement and a stub device is required.
>>>>>>>   * @kvm_type:
>>>>>>>   *    Return the type of KVM corresponding to the kvm-type string option or
>>>>>>> - *    computed based on other criteria such as the host kernel capabilities.
>>>>>>> + *    computed based on other criteria such as the host kernel capabilities
>>>>>>> + *    (which can't be negative), or -1 on error.
>>>>>>>   * @numa_mem_supported:
>>>>>>>   *    true if '--numa node.mem' option is supported and false otherwise
>>>>>>>   * @smp_parse:
>>>>>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>>>>>> index 84c943fcdb2..b069938d881 100644
>>>>>>> --- a/accel/kvm/kvm-all.c
>>>>>>> +++ b/accel/kvm/kvm-all.c
>>>>>>> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
>>>>>>>                                                              "kvm-type",
>>>>>>>                                                              &error_abort);
>>>>>>>          type = mc->kvm_type(ms, kvm_type);
>>>>>>> +        if (type < 0) {
>>>>>>> +            ret = -EINVAL;
>>>>>>> +            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
>>>>>>> +                    mc->name);
>>>>>>> +            goto err;
>>>>>>> +        }
>>>>>>>      }
>>>>>>>  
>>>>>>>      do {    
>>>>>>
>>>>>> No objection to this patch; but I'm wondering why some non-pseries
>>>>>> machines implement the kvm_type callback, when I see the kvm-type
>>>>>> property only for pseries? Am I holding my git grep wrong?    
>>>>>
>>>>> Can it be what David commented here?
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
>>>>>   
>>>>
>>>> Ok, I might be confused about the other ppc machines; but I'm wondering
>>>> about the kvm_type callback for mips and arm/virt. Maybe I'm just
>>>> confused by the whole mechanism?  
>>>
>>> For ppc at least, not sure about in general, pseries is the only
>>> machine type that can possibly work under more than one KVM flavour
>>> (HV or PR).  So, it's the only one where it's actually useful to be
>>> able to configure this.  
>>
>> Wait... I'm not sure that's true.  At least theoretically, some of the
>> Book3E platforms could work with either PR or the Book3E specific
>> KVM.  Not sure if KVM PR supports all the BookE instructions it would
>> need to in practice.
>>
>> Possibly pseries is just the platform where there's been enough people
>> interested in setting the KVM flavour so far.
> 
> If I'm not utterly confused by the code, it seems the pseries machines
> are the only ones where you can actually get to an invocation of
> ->kvm_type(): You need to have a 'kvm-type' machine property, and
> AFAICS only the pseries machine has that.

OMG you are right... This changed in commit f2ce39b4f06
("vl: make qemu_get_machine_opts static"):

@@ -2069,13 +2068,11 @@ static int kvm_init(MachineState *ms)
     }
     s->as = g_new0(struct KVMAs, s->nr_as);

-    kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
-    if (mc->kvm_type) {
+    if (object_property_find(OBJECT(current_machine), "kvm-type")) {
+        g_autofree char *kvm_type =
object_property_get_str(OBJECT(current_machine),
+                                                            "kvm-type",
+                                                            &error_abort);
         type = mc->kvm_type(ms, kvm_type);
-    } else if (kvm_type) {
-        ret = -EINVAL;
-        fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
-        goto err;
     }

Paolo, is that expected?

So these callbacks are dead code:
hw/arm/virt.c:2585:    mc->kvm_type = virt_kvm_type;
hw/mips/loongson3_virt.c:625:    mc->kvm_type = mips_kvm_type;
hw/ppc/mac_newworld.c:598:    mc->kvm_type = core99_kvm_type;
hw/ppc/mac_oldworld.c:447:    mc->kvm_type = heathrow_kvm_type;

> 
> (Or is something hiding behind some macro magic?)
> 


