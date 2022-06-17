Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B554FA59
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 17:34:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351496.578146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Dza-0005Vh-A7; Fri, 17 Jun 2022 15:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351496.578146; Fri, 17 Jun 2022 15:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Dza-0005TE-6s; Fri, 17 Jun 2022 15:34:38 +0000
Received: by outflank-mailman (input) for mailman id 351496;
 Fri, 17 Jun 2022 15:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDGi=WY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o2DzZ-0005T8-Dg
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 15:34:37 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdc583fe-ee52-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 17:34:35 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id e25so2364665wrc.13
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jun 2022 08:34:35 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a05600c4f4f00b0039748be12dbsm10317510wmq.47.2022.06.17.08.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 08:34:34 -0700 (PDT)
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
X-Inumbo-ID: fdc583fe-ee52-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tdWwDkIjEBR5FAhhoXIwfjyS1j1RkQ7wqDzOuyjqT6Y=;
        b=bWB+Txp4hxjrkLJpaPwu0Ywz3sIuks4Qtu7V+3pVHsqfT03lJAnbplGh8Ad7BI2LGl
         YXCL4Nffx8fjY3GcT9cWs6jeEA3bQ8LTuFc7CeWI7esV5YFfJdCjtnr9GVzWcAYCRNs9
         ukKPNsXEzfgSvuaRR31rbneQfuH6wTCMM4u3yVJtWixAkipKr9M80WnKqvjlyHJLSJAg
         f0AVNmpsTmOk2XBXHjFEY402a1qqB4zV8zmgKXSj0Zg0Zid8SR0Qxm0s7J2mTeJL+FGS
         ud10eDM6I33JK5wN/zIjRJL+k6XZ+AOAgbZ5hbnq6+rhdEk7tjI+lBqDBNgdTVQGSE9z
         0AJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tdWwDkIjEBR5FAhhoXIwfjyS1j1RkQ7wqDzOuyjqT6Y=;
        b=g8RypO+pUplt9FqEx+tPt6lnnhII0CAKWa36HiDNrxJSjue2XlweHJSlJlV8vPMuvQ
         zEEBA0TLWzSRLYGsMl7V/74S+CAAoYVh+Q2nrBYUDd/TwNz0z7VCpBlKXIm8dLDaRGlM
         LPJbklyxO1AtXm1IESBU+rS5wKjRYtLNxMTiqIncmIi4NwxqgB56gTmPTG4xkBiOK/K2
         qfpthRxrb60RCQJaAjwcu5BV7JbFsGEhtoQdJlltkaLmq0w2Ab+icR7ZMolTCw4opAhf
         UBEG63B9eKbU+ZQGfjazy4Te3FTbqKDFJ7RD0TynvDJvduGfPl++baRLBt4Zs0txDmqE
         BCwg==
X-Gm-Message-State: AJIora9VtKQ5Ng37penEVaSSd8raQX6rRbZNrjL2UKVPPySuvQMdLdVq
	os3zq/9vKWDJr9fggExOsjs=
X-Google-Smtp-Source: AGRyM1snf19aPKhaDenBQgCK0t5vEPJ947t10rjXW7J2KyXhY5/IjiTdSzAmJnvYjZ1SZphfqyey1Q==
X-Received: by 2002:adf:d1c1:0:b0:219:e994:6b8a with SMTP id b1-20020adfd1c1000000b00219e9946b8amr9890180wrd.462.1655480075005;
        Fri, 17 Jun 2022 08:34:35 -0700 (PDT)
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
 <1655143522-14356-2-git-send-email-olekstysh@gmail.com>
 <YqnrerEAFXJUCRL1@perard.uk.xensource.com>
 <21798651-1254-0c17-5379-224b52a92566@gmail.com>
 <YqyPxd9yNvfd5idJ@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
Date: Fri, 17 Jun 2022 18:34:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YqyPxd9yNvfd5idJ@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 17.06.22 17:29, Anthony PERARD wrote:


Hello Anthony

> On Wed, Jun 15, 2022 at 07:32:54PM +0300, Oleksandr wrote:
>> On 15.06.22 17:23, Anthony PERARD wrote:
>>> On Mon, Jun 13, 2022 at 09:05:20PM +0300, Oleksandr Tyshchenko wrote:
>>>> diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
>>>> index 70eed43..f2b0ff5 100644
>>>> --- a/tools/xl/xl_block.c
>>>> +++ b/tools/xl/xl_block.c
>>>> @@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
>>>>            return 0;
>>>>        }
>>>> +    if (disk.specification != LIBXL_DISK_SPECIFICATION_XEN) {
>>>> +        fprintf(stderr, "block-attach is only supported for specification xen\n");
>>> This check prevents a previously working `block-attach` command line
>>> from working.
>>>
>>>       # xl -Tvvv block-attach 0 /dev/vg/guest_disk,raw,hda
>>>       block-attach is only supported for specification xen
>>>
>>> At least, that works by adding ",specification=xen", but it should work
>>> without it as "xen" is the default (from the man page).
>> yes, you are right. thank you for pointing this out.
>>
>>
>>> Maybe the check is done too soon, or maybe a better place to do it would
>>> be in libxl.
>>>
>>> libxl__device_disk_setdefault() is called much later, while executing
>>> libxl_device_disk_add(), so `xl` can't use the default been done there
>>> to "disk.specification".
>> I got it.
>>
>>
>>> `xl block-attach` calls libxl_device_disk_add() which I think is only
>>> called for hotplug of disk. If I recall correctly, libxl__add_disks() is
>>> called instead at guest creation. So maybe it is possible to do
>>> something in libxl_device_disk_add(), but that a function defined by a
>>> macro, and the macro is using the same libxl__device_disk_add() that
>>> libxl_device_disk_add(). On the other hand, there is a "hotplug"
>>> parameter to libxl__device_disk_setdefault(), maybe that could be use?
>> Thank you for digging into the details here.
>>
>> If I understood correctly your suggestion we simply can drop checks in
>> main_blockattach() (and likely main_blockdetach() ?) and add it to
>> libxl__device_disk_setdefault().
>>
>>
>> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
>> index 9e82adb..96ace09 100644
>> --- a/tools/libs/light/libxl_disk.c
>> +++ b/tools/libs/light/libxl_disk.c
>> @@ -182,6 +182,11 @@ static int libxl__device_disk_setdefault(libxl__gc *gc,
>> uint32_t domid,
>>           disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
>>       }
>>
>> +    if (hotplug && disk->specification != LIBXL_DISK_SPECIFICATION_XEN) {
>> +        LOGD(ERROR, domid, "Hotplug is only supported for specification
>> xen");
> Maybe check for `specification == VIRTIO` instead, and report that
> hotplug isn't supported in virtio's case.

ok, will do


>
>> +        return ERROR_FAIL;
>> +    }
>> +
>>       /* Force Qdisk backend for CDROM devices of guests with a device model.
>> */
>>       if (disk->is_cdrom != 0 &&
>>           libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
>>
>>
>> Is my understanding correct?
> Yes, that looks correct.


thank you for the confirmation


>
> But I didn't look at the block-detach, and it seems that this part only
> use generic functions to remove a disk. So there is no easy way to
> prevent hotunplug from libxl. But `xl` does have access to a fully
> initialised "disk" so can check the value of "specification", I guess
> the check can stay in main_blockdetach().

ok, I got it


So, it works

root@generic-armv8-xt-dom0:~# xl block-attach DomU 
/dev/loop0,raw,xvda3,specification=virtio
libxl: error: libxl_disk.c:186:libxl__device_disk_setdefault: Domain 
2:Hotplug isn't supported for specification virtio
libxl: error: libxl_device.c:1468:device_addrm_aocomplete: unable to add 
device
libxl_device_disk_add failed.

root@generic-armv8-xt-dom0:~# xl block-detach DomU 51713
Hotunplug isn't supported for specification virtio

**********

root@generic-armv8-xt-dom0:~# xl block-attach DomU /dev/loop0,raw,xvda3
[  364.656091] xen-blkback: backend/vbd/3/51715: using 4 queues, 
protocol 1 (arm-abi)


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


