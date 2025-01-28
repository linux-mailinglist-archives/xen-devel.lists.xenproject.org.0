Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D9EA20CAE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 16:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878556.1288737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnEP-0005vK-1v; Tue, 28 Jan 2025 15:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878556.1288737; Tue, 28 Jan 2025 15:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnEO-0005tD-VQ; Tue, 28 Jan 2025 15:10:24 +0000
Received: by outflank-mailman (input) for mailman id 878556;
 Tue, 28 Jan 2025 15:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p3hs=UU=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tcnEM-0005t7-RA
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 15:10:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe0cf39e-dd89-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 16:10:21 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so2959193f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 07:10:21 -0800 (PST)
Received: from [192.168.69.151] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c402esm14561306f8f.97.2025.01.28.07.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 07:10:20 -0800 (PST)
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
X-Inumbo-ID: fe0cf39e-dd89-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738077021; x=1738681821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViM+rjZUgxvbfxwTZxZKl7dD2XoHFDnQHFMIYBVWG2o=;
        b=Jc7LKc7d2evkXQVhtyyua8mXB/9d5D0SHZ6HVDAIciiPe0S0TnJcOVU4O9KBQzNxzr
         zZ7Q5NNFy8cOdLXTs7ouKZgBXriMYBmWs7el8z6vTlfFu+iuUQd5fyZHm/uUiEg0DnDB
         bx9hMrtXlXOSI5h/1c8sWWOh/3sDGDHRkiP7secrt31lD9zi7UmzHn0x15F+jcVpAYXq
         HlhLw64CrhyDL7wJgXf+bd/uJuBAoYexYmt5/Ow0ArgtD2+uwZ6j6t9x5yBQ3RTlzBzO
         Tt+aFfA3yyHw+Pb5dayWku48OMzGXjBBSMv4s1olbHUQooXvbp6A41xKFVQ90MmaodDs
         fZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738077021; x=1738681821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViM+rjZUgxvbfxwTZxZKl7dD2XoHFDnQHFMIYBVWG2o=;
        b=Qtbe/Ug0YaOWSXs4v7ClXVGBu0kghkDLN7TJMPNnUuKsWx5PZLikHPLEDw28TbJlT2
         OX6Lal/zCPhidtqANgA+zUtOCz2feR6FLNoXMLQwcOT8OibfCLA7mIvtJe1VZnDqdFxV
         I/rDV1E1388Y2sIRV5BaeVPYfY5KqQiljk/qMll0j61FNFkSTg2fNsUFmN92jdbk5HZ6
         vwsPjDDCvLrfh5QDgR19p0wZoBaW47a3zBHzauqGZs1GqIhoxkinxiEJvACX1X3Ihnm5
         1wrBokoAOONqfb/CiP0Jn5+C5pVclUwJt9Ly1PIO1vLBLl2O2WRz3aVU+bVmz045JL5m
         vw1A==
X-Forwarded-Encrypted: i=1; AJvYcCXZZubHtnN8ShXEKtU2j736ZgSzEjwXkijT5+FvSGKf4ZdG6fRsqMAXP12bJ7fERw53+xpztjJdR6g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkRf/wy6VicL/faudfxA1i8f2dwIHhVH0MzpTOd8CGyIEvWvzH
	BTjTl2Y3t22s/Zs6i4Qh+tQfHMLCxQWq0KN/7f1ei6utWMEH2C0MKa/+y+o20X4=
X-Gm-Gg: ASbGncvz1jb0G6JfgU/Qf+vMtGcDG7JNE81c157+sVaW8bXGYjjUsEq/bFAlvGfJk1h
	VXtrfVg9Zsudbl1SNy9i8XHSAwf4oQekMIk+/dK0lzppWYb7t5aB77ANpOadFZVNSLwmAR438mS
	caKh1h/vomK/4ehnSEeQ2Gy0AjzgWK3yb9Bu7vwKdMs8xiSDDCn7nYwRD21TRXbBtS5zF0uKecb
	3QlUiXYFFPi/pkXiJSJXcpkJn7Dd0J92p4d4NcAlGau9MzVePN+XMkXfKAXrVN2NiV7BJKLTL1u
	w0uTJ0Mr0vVVGyTke+Lk/UG0f5/UXpZaP6yZ7nbkxu8p3z31s8+89VyVdos=
X-Google-Smtp-Source: AGHT+IGLc4A5clvj21CfoQyBX6F3omCt6bWQLv3EkWi0U+JM0LkNEZMv50192jgozkl7S+UQxS3FRg==
X-Received: by 2002:a05:6000:18a9:b0:38a:86fe:52dc with SMTP id ffacd0b85a97d-38c3b0cbb61mr9689447f8f.13.1738077020863;
        Tue, 28 Jan 2025 07:10:20 -0800 (PST)
Message-ID: <990dacab-6cfd-4a18-944d-ba076a80996c@linaro.org>
Date: Tue, 28 Jan 2025 16:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] hw/sysbus/platform-bus: Introduce
 TYPE_DYNAMIC_SYS_BUS_DEVICE
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony PERARD <anthony@xenproject.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <wkb53fhvfchqa4uvmifgitvcr7t7rfpc3hcohdhzczkzvktetx@yjveswjel3s4>
 <CAFEAcA-QOYcnJi=joKHbRmUCXK1UFOgQRgYP-fDq4h_1SkMGyQ@mail.gmail.com>
 <2893a552-ca6c-01c4-dcc0-6107ccf1c7b5@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2893a552-ca6c-01c4-dcc0-6107ccf1c7b5@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/1/25 13:57, BALATON Zoltan wrote:
> On Tue, 28 Jan 2025, Peter Maydell wrote:
>> On Tue, 28 Jan 2025 at 10:42, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>>
>>> On Sat, Jan 25, 2025 at 07:13:34PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Some SysBus devices can optionally be dynamically plugged onto
>>>> the sysbus-platform-bus (then virtual guests are aware of
>>>> mmio mapping and IRQs via device tree / ACPI rules).
>>>
>>> Do we have some sane way to have user-pluggable sysbus devices on arm?
>>
>> The answer in a general sense is "no, because user pluggable
>> sysbus is a weird idea". "sysbus" means "it's wired into a
>> specific bit of the memory map and to specific IRQs, and whoever
>> does that needs to know what IRQs and bits of memory are usable,
>> and the guest OS needs to know it's there". "user-pluggable" means
>> "it's all automatic and the guest can just do some kind of
>> probing for what is or isn't present". All the platform bus stuff
>> is a nasty mess that's working around the things people want
>> to plug in not being clean devices on probeable buses :-(
>> And the platform bus is only supported on the "virt" board,
>> because that's the only one where QEMU is generating its
>> own dtb or ACPI tables where it can tell the guest "hey,
>> there's some device here".
> 
> There are some SoCs that have memory mapped devices but different 
> versions in the same family have different devices. Either older ones 
> missing some devices or have less USB or network ports while newer SoCs 
> have more of those or they have PCIe instead of PCI. Modelling these 
> could use pluggable sysbus devices so one could add the devices needed 
> for a SoC version without having to write or modify a board code. I 
> think Bernhard's attempt to try creating e500 SoCs from a device tree 
> goes in that direction too. We could also model this by having a SoC 
> that can instantiate devices based on some properties but maybe 
> pluggable devices could be more generic for this. The issue seems to be 
> how to tell the board or SoC where to map it and what IRQ to connect it 
> as this is done by the board and not the device so properties on the 
> device to set these does not really help unless the board can somehow 
> query it and instantiate the devices based on that. Otherwise whatever 
> handles the -device option to create the device would need knowledge 
> about the board. (E.g. the e500 devices are mapped in the CCSR memory 
> region so one can't just use system address space for them.)

IIRC Bernard's series takes a DTB as input and create the machine
matching this DTB.

As Peter explained, sysbus-platform-bus fits TYPE_DYNAMIC_SYS_BUS_DEVICE
in free slots, then generates the corresponding ACPI/DTB.

What you describe seems closer to the QEMU Dynamic Machine project,
following Damien's idea:
https://lore.kernel.org/qemu-devel/20220223090706.4888-1-damien.hedde@greensocs.com/
We are not quite there yet...

