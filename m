Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64AC585320
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 17:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377627.610901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSLM-0005bP-NA; Fri, 29 Jul 2022 15:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377627.610901; Fri, 29 Jul 2022 15:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSLM-0005ZF-Ja; Fri, 29 Jul 2022 15:56:04 +0000
Received: by outflank-mailman (input) for mailman id 377627;
 Fri, 29 Jul 2022 15:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCuC=YC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oHSLL-0005Z9-28
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 15:56:03 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f15eabc7-0f56-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 17:56:01 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id a13so5611606ljr.11
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 08:56:01 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a198c19000000b0048a9c80b1f2sm693314lfd.194.2022.07.29.08.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 08:55:59 -0700 (PDT)
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
X-Inumbo-ID: f15eabc7-0f56-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=eat4TgmilUiNiJbcKemb7fgNhPjU0Rsr1AtN3zFtS+4=;
        b=f9mDiDTkEkMe+g1pD72ycEo4OtXk8OceFprvTH0eL8ivpk9N0c41u4VF2rYwo9tpLd
         wTr3Oz3w4Fr0oHqolIZvJAy3ll46WHNLrRT9l+gGcp/l7C/CzqTeEV5U7D7tee9L2DLc
         zUUp2/6vGFDoh4jf5y7al9Uzfwj+nr7nLKooclIdNUa9NXN6MJhOBwF2/O3vwtNP7uzd
         kXZtt+BMLFVCkxKor4y32cDYKCyoEMXMVRTtS3jAfoSbXD6qBPuH1bcw8w3y/G1oJEZc
         Qx2FoYdoo5Qhn+JAvSkoIbeEuejGzTuKQOa+gI12WNBMrydRh/T1f6/ncVS2ClDqNu3w
         m6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=eat4TgmilUiNiJbcKemb7fgNhPjU0Rsr1AtN3zFtS+4=;
        b=GY0Lmi55vlwfTCQTtMYaV2lhGZom6MJB5/JY5RTDKD91sKotzx2ml5AIxCaay+YBnC
         g53Zfn8W091roj5I37o9QF5tvT2tbkrfX4OdZ4WiRaQ/xbb9Nas8xqZsJS1Gi0aXXbm9
         8Hpx2cykdIY4EJ9CvkAdtLAvbx4zvRf1OLBj5tzeX/oAn/6vkb4o3QbZdR9SLIS0djVD
         BikSQ8zKH4UwOkC37+EmAph39zesrReOLLJgvCEYQkHSE0TPc/1rjbwloXKVDmZ1IbbF
         fS11QFZ0LX+3VVPDPfkuzznt5UHDS9j7tSkxD5VQjTgH17X6sYPSLRfr93JJVy40GpGV
         1HFQ==
X-Gm-Message-State: AJIora8/fa2U2eXIZ2ux9lgVlqUEFUS3+yrK5u2IUsIAirIsdH76G0Z6
	x7Oi5tfbU/bYXUEiOdK7n9A=
X-Google-Smtp-Source: AGRyM1v0pJ1pepY1Kegy89G6hVJ+xoBLeQPYQDTbUJRgscVkA+9hHQbe5JdI4xCjqHp/GX9pU/Zf6w==
X-Received: by 2002:a2e:98d5:0:b0:25e:c1b:f262 with SMTP id s21-20020a2e98d5000000b0025e0c1bf262mr1273603ljj.343.1659110160534;
        Fri, 29 Jul 2022 08:56:00 -0700 (PDT)
Message-ID: <0f7a750d-20c9-f624-133a-51f6638fc643@gmail.com>
Date: Fri, 29 Jul 2022 18:55:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <57da62dc-81c2-5018-dfc7-5eb784ea53d1@epam.com>
 <ac219f32-641d-bbcb-2ae0-9410404458de@xen.org>
 <0fa56cfe-85dc-5fd2-6405-e18115420306@epam.com>
 <0adaeec4-d810-f235-b3a0-951610db216a@xen.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <0adaeec4-d810-f235-b3a0-951610db216a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 29.07.22 13:29, Julien Grall wrote:
> Hi Oleksandr,


Hello Julien


>
> On 29/07/2022 11:25, Oleksandr Tyshchenko wrote:
>>
>> On 29.07.22 12:08, Julien Grall wrote:
>>
>>
>> Hello Julien
>>
>>> (+ Anthony)
>>>
>>> Hi,
>>>
>>> On 29/07/2022 07:48, Oleksandr Tyshchenko wrote:
>>>>
>>>> On 29.07.22 09:22, Jan Beulich wrote:
>>>>
>>>> Hello Jan
>>>>
>>>>> On 29.07.2022 03:04, osstest service owner wrote:
>>>>>> branch xen-unstable-smoke
>>>>>> xenbranch xen-unstable-smoke
>>>>>> job build-amd64-libvirt
>>>>>> testid libvirt-build
>>>>>>
>>>>>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>>>>>> Tree: libvirt_keycodemapdb
>>>>>> https://urldefense.com/v3/__https://gitlab.com/keycodemap/keycodemapdb.git__;!!GF_29dbcQIUBPA!0s_nyAgds977dw0dGPgFJGkIaBiKiXH3nR11Ni6gGjN5gQmB0DEhKrm5SUX4R0WhK8YkQemR6RVhiojpzij9yLM$ 
>>>>>>
>>>>>> [gitlab[.]com]
>>>>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>>>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>>>>> Tree: xen git://xenbits.xen.org/xen.git
>>>>>>
>>>>>> *** Found and reproduced problem changeset ***
>>>>>>
>>>>>>      Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>>>>      Bug introduced: 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>>      Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>>>>>      Last fail repro:
>>>>>> https://urldefense.com/v3/__http://logs.test-lab.xenproject.org/osstest/logs/171909/__;!!GF_29dbcQIUBPA!0s_nyAgds977dw0dGPgFJGkIaBiKiXH3nR11Ni6gGjN5gQmB0DEhKrm5SUX4R0WhK8YkQemR6RVhiojpmYABJkc$ 
>>>>>>
>>>>>> [logs[.]test-lab[.]xenproject[.]org]
>>>>>>
>>>>>>
>>>>>>      commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>>      Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>      Date:   Fri Jul 15 22:20:24 2022 +0300
>>>>>>              libxl: Add support for Virtio disk configuration
>>>>> Just in case you didn't notice it: Something's wrong here. I didn't
>>>>> look
>>>>> at the details at all. Please advise whether a fix will soon 
>>>>> arrive or
>>>>> whether we should revert for the time being.
>>>>
>>>> Sorry for the breakage. At the moment I have no idea what is wrong 
>>>> here,
>>>
>>>  From the build log:
>>>
>>> ../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
>>> ../../src/libxl/xen_xl.c:779:17: error: enumeration value
>>> 'LIBXL_DISK_BACKEND_STANDALONE' not handled in switch
>>> [-Werror=switch-enum]
>>>                   switch (libxldisk->backend) {
>>>                   ^~~~~~
>>>
>>> The switch contains a default branch [1], so I am a bit puzzled why
>>> GCC is not happy here.
>>
>> Libvirt seems to compiled with -Wswitch-enum
>>
>> And https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html says the
>> following:
>>
>> "-Wswitch-enum
>>
>> Warn whenever a switch statement has an index of enumerated type and
>> lacks a case for one or more of the named codes of that enumeration.
>> case labels outside the enumeration range also provoke warnings when
>> this option is used. The only difference between -Wswitch and this
>> option is that this option gives a warning about an omitted enumeration
>> code even if there is a default label."
>
> Thanks for digging! That's explained the error. I still don't think we 
> can solve the error in libxl.
>
> So I would suggest to involve the libvirt folks to know how they want 
> to solve the issue.


Already pushed an immediate fix with detailed description:

https://lore.kernel.org/xen-devel/20220729155024.3327364-1-olekstysh@gmail.com/


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


