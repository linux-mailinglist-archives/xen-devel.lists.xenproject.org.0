Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCAA30F7F2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 17:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81370.150300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hZC-0006Ic-Vt; Thu, 04 Feb 2021 16:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81370.150300; Thu, 04 Feb 2021 16:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hZC-0006IF-Rf; Thu, 04 Feb 2021 16:33:14 +0000
Received: by outflank-mailman (input) for mailman id 81370;
 Thu, 04 Feb 2021 16:33:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gi2U=HG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l7hZB-0006IA-6s
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 16:33:13 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id feb93a3f-4be1-42b9-a9c7-eb8897fae5a0;
 Thu, 04 Feb 2021 16:33:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id j11so3679912wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 08:33:10 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n15sm8551843wrx.2.2021.02.04.08.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:33:08 -0800 (PST)
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
X-Inumbo-ID: feb93a3f-4be1-42b9-a9c7-eb8897fae5a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=IaYqqD0brpgLP4Ux8g9ZMnx7iqcXn2aIzlPEt1C0O/E=;
        b=ejVngN8lTTPlO075/fISpieC/0a4qTf4RZLqmKxkuZa/IeVmJZwmO9NyEQ4IL1pMo2
         ZmtpcKSxaSCxavzGAR94jWp5alrBmxcn5aqGyIfyn2bn70bxLXp9J6Q8DD/RaVty5ozS
         HnWuw69ojC+5Qy76TCTxO14cNjf8utMhLgBYZp0IeCvJAO0I5PbxQvDzX9vjs1Yr0/Wg
         vQUdB0P4Ur3+zJA+TDNgTHcGVg91H0YUSpRCNZyvxOL4OxVVlH7bcEu4qEfl8Xl/HcWK
         gaIdSEpUsEm/jtLP8l7RScIfDx1VpVMNd302kPcFmrmeb6Ny2P8PdjVs1L5IMD77cynm
         QaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=IaYqqD0brpgLP4Ux8g9ZMnx7iqcXn2aIzlPEt1C0O/E=;
        b=PLbVW4uhQFYRsDkIOwg9x7L76s6eDjT2eedLLvmR3ferr1DI4WJS3dwyp3A35OmzKI
         A1Iy/M8KXKMz9teAJLXRT6F3YlvxeFnXMORvdaqyXMUWirp4L3fv+sV786q7iVcjUddI
         QGTJfTt6WAsvoLk2nDQlTHmbuh1/U+eyUibhCJVqHwb3fe29472JfiEdNdY+9XabuQ5M
         jQB5Vz8Cem/gNeISkql9vEFwy+R9IjICWqSGxbBpoz3Tp0wAIyPgqkdT/TPSK+DbQ4MK
         fQUM3OevDGs+F1qtHCUTDx1hFZkRU8HH+prhBl2vOGUfbtEh2q6hfsxxtHCYwcJaWled
         aDNw==
X-Gm-Message-State: AOAM531f63SEUSYfnRnsSgDs+1+M1hUnMJu7jalv9iWe6hTQs0SpIEGR
	QB8+U3dC80VHobCa1+/DDYo=
X-Google-Smtp-Source: ABdhPJypB+d860YRntiqKja7EFschxMvzk/CbBWJji6zyTRZcC4VB+OU1gz7agSSGpeh46afhw9Q7A==
X-Received: by 2002:a1c:c308:: with SMTP id t8mr17589wmf.7.1612456389851;
        Thu, 04 Feb 2021 08:33:09 -0800 (PST)
Subject: Re: [PATCH for-4.15] tools/tests: Introduce a test for
 acquire_resource
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210202190937.30206-1-andrew.cooper3@citrix.com>
 <CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com>
 <6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com>
 <79a41e5b-0717-f31b-3cec-60b716777603@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3c103959-880d-ce25-6993-65b93d248bcf@gmail.com>
Date: Thu, 4 Feb 2021 18:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <79a41e5b-0717-f31b-3cec-60b716777603@citrix.com>
Content-Type: multipart/alternative;
 boundary="------------A0AB5F0E1BCAA8CBCA232859"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A0AB5F0E1BCAA8CBCA232859
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Andrew


On 04.02.21 17:44, Andrew Cooper wrote:
> On 04/02/2021 15:38, Oleksandr wrote:
>>>
>>> Hi Andrew.
>>> [Sorry for the possible format issues]
>>>
>>> On Tue, Feb 2, 2021 at 9:10 PM Andrew Cooper 
>>> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>>>
>>>     For now, simply try to map 40 frames of grant table.  This
>>>     catches most of the
>>>     basic errors with resource sizes found and fixed through the
>>>     4.15 dev window.
>>>
>>>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com
>>>     <mailto:andrew.cooper3@citrix.com>>
>>>     ---
>>>     CC: Ian Jackson <iwj@xenproject.org <mailto:iwj@xenproject.org>>
>>>     CC: Wei Liu <wl@xen.org <mailto:wl@xen.org>>
>>>     CC: Jan Beulich <JBeulich@suse.com <mailto:JBeulich@suse.com>>
>>>     CC: Roger Pau Monné <roger.pau@citrix.com
>>>     <mailto:roger.pau@citrix.com>>
>>>     CC: Wei Liu <wl@xen.org <mailto:wl@xen.org>>
>>>     CC: Stefano Stabellini <sstabellini@kernel.org
>>>     <mailto:sstabellini@kernel.org>>
>>>     CC: Julien Grall <julien@xen.org <mailto:julien@xen.org>>
>>>     CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com
>>>     <mailto:Volodymyr_Babchuk@epam.com>>
>>>     CC: Oleksandr <olekstysh@gmail.com <mailto:olekstysh@gmail.com>>
>>>
>>>     Fails against current staging:
>>>
>>>       XENMEM_acquire_resource tests
>>>       Test x86 PV
>>>         d7: grant table
>>>           Fail: Map 7 - Argument list too long
>>>       Test x86 PVH
>>>         d8: grant table
>>>           Fail: Map 7 - Argument list too long
>>>
>>>     The fix has already been posted:
>>>       [PATCH v9 01/11] xen/memory: Fix mapping grant tables with
>>>     XENMEM_acquire_resource
>>>
>>>     and the fixed run is:
>>>
>>>       XENMEM_acquire_resource tests
>>>       Test x86 PV
>>>         d7: grant table
>>>       Test x86 PVH
>>>         d8: grant table
>>>
>>>     ARM folk: would you mind testing this?  I'm pretty sure the
>>>     create parameters
>>>     are suitable, but I don't have any way to test this.
>>>
>>> Yes, as it was agreed on IRC, I will test this today's evening and 
>>> inform about the results)
>>
>>
>> OK, well, I decided to test right away because going to be busy in 
>> the evening)
>>
>> I am based on:
>> 9dc687f x86/debug: fix page-overflow bug in dbg_rw_guest_mem
>>
>> I noticed the error during building this test in my Yocto environment 
>> on Arm:
>>
>>
>> /media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld: 
>> test-resource.o: undefined reference to symbol 
>> 'xendevicemodel_open@@VERS_1.0'
>> /media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld: 
>> /media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/git/tools/tests/resource/../../../tools/libs/devicemodel/libxendevicemodel.so.1: 
>> error adding symbols: DSO missing from command line
>> collect2: error: ld returned 1 exit status
>> Makefile:38: recipe for target 'test-resource' failed
>>
>>
>> I didn't investigate whether it is related or not. I just added as 
>> following:
>>
>> diff --git a/tools/tests/resource/Makefile 
>> b/tools/tests/resource/Makefile
>> index 8a3373e..03b19ef 100644
>> --- a/tools/tests/resource/Makefile
>> +++ b/tools/tests/resource/Makefile
>> @@ -32,6 +32,7 @@ CFLAGS += $(APPEND_CFLAGS)
>>
>>  LDFLAGS += $(LDLIBS_libxenctrl)
>>  LDFLAGS += $(LDLIBS_libxenforeignmemory)
>> +LDFLAGS += $(LDLIBS_libxendevicemodel)
>>  LDFLAGS += $(APPEND_LDFLAGS)
>>
>>  test-resource: test-resource.o
>>
>
> Urgh yes - I didn't fully strip out the libxendevicemodel uses. I'll 
> fix that, rather than having this test link against a library which it 
> doesn't use (yet).
>
>>
>> I got the following result without and with "[PATCH v9 01/11] 
>> xen/memory: Fix mapping grant tables with XENMEM_acquire_resource"
>>
>> root@generic-armv8-xt-dom0:~# test-resource
>> XENMEM_acquire_resource tests
>> Test ARM
>>   d3: grant table
>> xenforeignmemory: error: ioctl failed: Invalid argument
>>     Fail: Get size: 22 - Invalid argument
>>
>
> Ah yes - you also need a bugfix in the dom0 kernel.  "xen/privcmd: 
> allow fetching resource sizes" which is in mainline, and also 
> backported to the LTS trees.

Well, my dom0 Linux is old)

uname -a
Linux generic-armv8-xt-dom0 4.14.75-ltsi-yocto-tiny #1 SMP PREEMPT Thu 
Nov 5 10:52:32 UTC 2020 aarch64 GNU/Linux
so I use ported "xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE".
I didn't find "xen/privcmd: allow fetching resource sizes" for my Linux 
version, so I backported it by myself.

So, with "[PATCH v9 01/11] xen/memory: Fix mapping grant tables with 
XENMEM_acquire_resource"

root@generic-armv8-xt-dom0:~# test-resource
XENMEM_acquire_resource tests
Test ARM
   d7: grant table
(XEN) grant_table.c:1854:d0v1 Expanding d7 grant table from 1 to 32 frames
(XEN) grant_table.c:1854:d0v1 Expanding d7 grant table from 32 to 40 frames

[I didn't test without your patch]


Hope that helps.


>
> However, this did get past the bit I wasn't sure about for ARM, which 
> is good.
>
> ~Andrew

-- 
Regards,

Oleksandr Tyshchenko


--------------A0AB5F0E1BCAA8CBCA232859
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>Hi Andrew<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04.02.21 17:44, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:79a41e5b-0717-f31b-3cec-60b716777603@citrix.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 04/02/2021 15:38, Oleksandr wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com">
        <blockquote type="cite"
cite="mid:CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com">
          <div dir="ltr">
            <div dir="ltr"><br>
            </div>
            <div>Hi Andrew.</div>
            <div>[Sorry for the possible format issues]</div>
            <br>
            <div class="gmail_quote">
              <div dir="ltr" class="gmail_attr">On Tue, Feb 2, 2021 at
                9:10 PM Andrew Cooper &lt;<a
                  href="mailto:andrew.cooper3@citrix.com"
                  moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">For now, simply try
                to map 40 frames of grant table.  This catches most of
                the<br>
                basic errors with resource sizes found and fixed through
                the 4.15 dev window.<br>
                <br>
                Signed-off-by: Andrew Cooper &lt;<a
                  href="mailto:andrew.cooper3@citrix.com"
                  target="_blank" moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;<br>
                ---<br>
                CC: Ian Jackson &lt;<a href="mailto:iwj@xenproject.org"
                  target="_blank" moz-do-not-send="true">iwj@xenproject.org</a>&gt;<br>
                CC: Wei Liu &lt;<a href="mailto:wl@xen.org"
                  target="_blank" moz-do-not-send="true">wl@xen.org</a>&gt;<br>
                CC: Jan Beulich &lt;<a href="mailto:JBeulich@suse.com"
                  target="_blank" moz-do-not-send="true">JBeulich@suse.com</a>&gt;<br>
                CC: Roger Pau Monné &lt;<a
                  href="mailto:roger.pau@citrix.com" target="_blank"
                  moz-do-not-send="true">roger.pau@citrix.com</a>&gt;<br>
                CC: Wei Liu &lt;<a href="mailto:wl@xen.org"
                  target="_blank" moz-do-not-send="true">wl@xen.org</a>&gt;<br>
                CC: Stefano Stabellini &lt;<a
                  href="mailto:sstabellini@kernel.org" target="_blank"
                  moz-do-not-send="true">sstabellini@kernel.org</a>&gt;<br>
                CC: Julien Grall &lt;<a href="mailto:julien@xen.org"
                  target="_blank" moz-do-not-send="true">julien@xen.org</a>&gt;<br>
                CC: Volodymyr Babchuk &lt;<a
                  href="mailto:Volodymyr_Babchuk@epam.com"
                  target="_blank" moz-do-not-send="true">Volodymyr_Babchuk@epam.com</a>&gt;<br>
                CC: Oleksandr &lt;<a href="mailto:olekstysh@gmail.com"
                  target="_blank" moz-do-not-send="true">olekstysh@gmail.com</a>&gt;<br>
                <br>
                Fails against current staging:<br>
                <br>
                  XENMEM_acquire_resource tests<br>
                  Test x86 PV<br>
                    d7: grant table<br>
                      Fail: Map 7 - Argument list too long<br>
                  Test x86 PVH<br>
                    d8: grant table<br>
                      Fail: Map 7 - Argument list too long<br>
                <br>
                The fix has already been posted:<br>
                  [PATCH v9 01/11] xen/memory: Fix mapping grant tables
                with XENMEM_acquire_resource<br>
                <br>
                and the fixed run is:<br>
                <br>
                  XENMEM_acquire_resource tests<br>
                  Test x86 PV<br>
                    d7: grant table<br>
                  Test x86 PVH<br>
                    d8: grant table<br>
                <br>
                ARM folk: would you mind testing this?  I'm pretty sure
                the create parameters<br>
                are suitable, but I don't have any way to test this.<br>
              </blockquote>
              <div>Yes, as it was agreed on IRC, I will test this
                today's evening and inform about the results)</div>
            </div>
          </div>
        </blockquote>
        <p><br>
        </p>
        <p>OK, well, I decided to test right away because going to be
          busy in the evening)<br>
          <br>
          I am based on:<br>
          9dc687f x86/debug: fix page-overflow bug in dbg_rw_guest_mem</p>
        <p>I noticed the error during building this test in my Yocto
          environment on Arm:<br>
        </p>
        <p><br>
        </p>
        <p>/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
          test-resource.o: undefined reference to symbol '<a
            class="moz-txt-link-abbreviated"
            href="mailto:xendevicemodel_open@@VERS_1.0"
            moz-do-not-send="true">xendevicemodel_open@@VERS_1.0</a>'<br>
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/git/tools/tests/resource/../../../tools/libs/devicemodel/libxendevicemodel.so.1:
          error adding symbols: DSO missing from command line<br>
          collect2: error: ld returned 1 exit status<br>
          Makefile:38: recipe for target 'test-resource' failed<br>
        </p>
        <p><br>
        </p>
        <p>I didn't investigate whether it is related or not. I just
          added as following:<br>
        </p>
        <p>diff --git a/tools/tests/resource/Makefile
          b/tools/tests/resource/Makefile<br>
          index 8a3373e..03b19ef 100644<br>
          --- a/tools/tests/resource/Makefile<br>
          +++ b/tools/tests/resource/Makefile<br>
          @@ -32,6 +32,7 @@ CFLAGS += $(APPEND_CFLAGS)<br>
           <br>
           LDFLAGS += $(LDLIBS_libxenctrl)<br>
           LDFLAGS += $(LDLIBS_libxenforeignmemory)<br>
          +LDFLAGS += $(LDLIBS_libxendevicemodel)<br>
           LDFLAGS += $(APPEND_LDFLAGS)<br>
           <br>
           test-resource: test-resource.o</p>
      </blockquote>
      <br>
      Urgh yes - I didn't fully strip out the libxendevicemodel uses. 
      I'll fix that, rather than having this test link against a library
      which it doesn't use (yet).<br>
      <br>
      <blockquote type="cite"
        cite="mid:6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com">
        <p><br>
        </p>
        <p>I got the following result without and with "[PATCH v9 01/11]
          xen/memory: Fix mapping grant tables with
          XENMEM_acquire_resource"<br>
        </p>
        <p>root@generic-armv8-xt-dom0:~# test-resource <br>
          XENMEM_acquire_resource tests<br>
          Test ARM<br>
            d3: grant table<br>
          xenforeignmemory: error: ioctl failed: Invalid argument<br>
              Fail: Get size: 22 - Invalid argument</p>
      </blockquote>
      <br>
      Ah yes - you also need a bugfix in the dom0 kernel.  "xen/privcmd:
      allow fetching resource sizes" which is in mainline, and also
      backported to the LTS trees.<br>
    </blockquote>
    <br>
    Well, my dom0 Linux is old)<br>
    <br>
    uname -a<br>
    Linux generic-armv8-xt-dom0 4.14.75-ltsi-yocto-tiny #1 SMP PREEMPT
    Thu Nov 5 10:52:32 UTC 2020 aarch64 GNU/Linux<br>
    so I use ported "xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE".<br>
    I didn't find "xen/privcmd: allow fetching resource sizes" for my
    Linux version, so I backported it by myself.<br>
    <p>So, with "[PATCH v9 01/11] xen/memory: Fix mapping grant tables
      with XENMEM_acquire_resource"<br>
    </p>
    <p>root@generic-armv8-xt-dom0:~# test-resource <br>
      XENMEM_acquire_resource tests<br>
      Test ARM<br>
        d7: grant table<br>
      (XEN) grant_table.c:1854:d0v1 Expanding d7 grant table from 1 to
      32 frames<br>
      (XEN) grant_table.c:1854:d0v1 Expanding d7 grant table from 32 to
      40 frames</p>
    <p>[I didn't test without your patch]</p>
    <p><br>
    </p>
    <p>Hope that helps.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:79a41e5b-0717-f31b-3cec-60b716777603@citrix.com"> <br>
      However, this did get past the bit I wasn't sure about for ARM,
      which is good.<br>
      <br>
      ~Andrew<br>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,

Oleksandr Tyshchenko</pre>
  </body>
</html>

--------------A0AB5F0E1BCAA8CBCA232859--

