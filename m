Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85EE3872BB
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128855.241873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litfO-0007fD-55; Tue, 18 May 2021 06:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128855.241873; Tue, 18 May 2021 06:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litfO-0007dJ-13; Tue, 18 May 2021 06:57:22 +0000
Received: by outflank-mailman (input) for mailman id 128855;
 Tue, 18 May 2021 06:57:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7W/=KN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1litfM-0007dD-11
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:57:20 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6344acd-213b-43f1-b256-a5e7bb24c968;
 Tue, 18 May 2021 06:57:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z17so8871298wrq.7
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 23:57:18 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:8896:b860:e287:45cb?
 ([2a00:23c5:5785:9a01:8896:b860:e287:45cb])
 by smtp.gmail.com with ESMTPSA id h14sm24965388wrq.45.2021.05.17.23.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:57:17 -0700 (PDT)
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
X-Inumbo-ID: e6344acd-213b-43f1-b256-a5e7bb24c968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lkyx21VRSMiMSZnYaucpBR50CYphKVffI2Qp7NzZRYw=;
        b=PSl/UlgL7D6yaaiILnEj/A5skHrYwipO3Kz22ZdjvhRz5X9lBJ4MM9lknTX1LlFl5j
         +rtJmfqynOf9gQmCUOr7oeW2vEFTJkxIFhCx50xwfgWEx9tFWDz7H3nNcqP97YLggEwi
         ocynSirHMYPwfrGlVvUczmfM8wxP8WzVbaEt6IDo7J+RODKhCfjMlAeovyS1+FKaHfqv
         bKLqsZknqlKQQQdTPvGp0NjXYH5MDwgVpEb6eHLP9NzSZWGAvkpDu0nhHnivA/IkKvaY
         falX0+pxA4kx2wH0cvt8aIh65WgndxlrDrjj72e/YIAw/LYBvUqXZlVGFBlyB49JiEes
         loiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Lkyx21VRSMiMSZnYaucpBR50CYphKVffI2Qp7NzZRYw=;
        b=QNAa9ef58cYNAoQCsocGQyBK8iXrdFqAPqAGc13o0IEitFH95cQGjLBWJDLpF3vV8k
         cXtARnLircAYvaB8A4lyuDhI7VEhHmt9KZsf6Wcq4nQ4MeLDM7g5MNqzMXmXmP+AqzCe
         x2B4bA/YLRG/Wm+LbltRInIUnFnwSIrSyIPEgEUXVnsn6OYGS06FzGdx6WUtKjnBm3AO
         6B3BbwH3CanxzQfZFrWFw6RGc3pbtE95XwP0qFUu6tM/lzwh7LYtLHx8TJfIf4jIaOH8
         93TMhiPzPvt72MBo7xcZ0vtfikWN9oPmK4YS3jjFGQBbzv78fRtRHN7gGU8jqvSXGzka
         /Hew==
X-Gm-Message-State: AOAM532MxG2NZQX+8wTOPUV64eLaH9tuAG07pmzXb4UAl9HJx7Y4hC2a
	XUTW3sdeEor83m/wzRo45AQ=
X-Google-Smtp-Source: ABdhPJz0eCctjJyTTpyrO6jmCxzTLMb2Z0aPswDW0oB9UdnlaDFQrRGGu3gSl9DpvIMVS8+YhxPgmg==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr4742719wrm.384.1621321037892;
        Mon, 17 May 2021 23:57:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Michael Brown <mbrown@fensystems.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20210413152512.903750-1-mbrown@fensystems.co.uk>
 <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
 <YJmMvTkp2Y1hlLLm@mail-itl>
 <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>
 <YJpfORXIgEaWlQ7E@mail-itl> <YJpgNvOmDL9SuRye@mail-itl>
 <9edd6873034f474baafd70b1df693001@EX13D32EUC003.ant.amazon.com>
 <YKLjoALdw4oKSZ04@mail-itl>
Message-ID: <8b7a9cd5-3696-65c2-5656-a1c8eb174344@xen.org>
Date: Tue, 18 May 2021 07:57:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKLjoALdw4oKSZ04@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17/05/2021 22:43, Marek Marczykowski-Górecki wrote:
> On Tue, May 11, 2021 at 12:46:38PM +0000, Durrant, Paul wrote:
>>> -----Original Message-----
>>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> Sent: 11 May 2021 11:45
>>> To: Durrant, Paul <pdurrant@amazon.co.uk>
>>> Cc: Michael Brown <mbrown@fensystems.co.uk>; paul@xen.org; xen-devel@lists.xenproject.org;
>>> netdev@vger.kernel.org; wei.liu@kernel.org
>>> Subject: RE: [EXTERNAL] [PATCH] xen-netback: Check for hotplug-status existence before watching
>>>
>>> On Tue, May 11, 2021 at 12:40:54PM +0200, Marek Marczykowski-Górecki wrote:
>>>> On Tue, May 11, 2021 at 07:06:55AM +0000, Durrant, Paul wrote:
>>>>>> -----Original Message-----
>>>>>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>>> Sent: 10 May 2021 20:43
>>>>>> To: Michael Brown <mbrown@fensystems.co.uk>; paul@xen.org
>>>>>> Cc: paul@xen.org; xen-devel@lists.xenproject.org; netdev@vger.kernel.org; wei.liu@kernel.org;
>>> Durrant,
>>>>>> Paul <pdurrant@amazon.co.uk>
>>>>>> Subject: RE: [EXTERNAL] [PATCH] xen-netback: Check for hotplug-status existence before watching
>>>>>>
>>>>>> On Mon, May 10, 2021 at 08:06:55PM +0100, Michael Brown wrote:
>>>>>>> If you have a suggested patch, I'm happy to test that it doesn't reintroduce
>>>>>>> the regression bug that was fixed by this commit.
>>>>>>
>>>>>> Actually, I've just tested with a simple reloading xen-netfront module. It
>>>>>> seems in this case, the hotplug script is not re-executed. In fact, I
>>>>>> think it should not be re-executed at all, since the vif interface
>>>>>> remains in place (it just gets NO-CARRIER flag).
>>>>>>
>>>>>> This brings a question, why removing hotplug-status in the first place?
>>>>>> The interface remains correctly configured by the hotplug script after
>>>>>> all. From the commit message:
>>>>>>
>>>>>>      xen-netback: remove 'hotplug-status' once it has served its purpose
>>>>>>
>>>>>>      Removing the 'hotplug-status' node in netback_remove() is wrong; the script
>>>>>>      may not have completed. Only remove the node once the watch has fired and
>>>>>>      has been unregistered.
>>>>>>
>>>>>> I think the intention was to remove 'hotplug-status' node _later_ in
>>>>>> case of quickly adding and removing the interface. Is that right, Paul?
>>>>>
>>>>> The removal was done to allow unbind/bind to function correctly. IIRC before the original patch
>>> doing a bind would stall forever waiting for the hotplug status to change, which would never happen.
>>>>
>>>> Hmm, in that case maybe don't remove it at all in the backend, and let
>>>> it be cleaned up by the toolstack, when it removes other backend-related
>>>> nodes?
>>>
>>> No, unbind/bind _does_ require hotplug script to be called again.
>>>
>>
>> Yes, sorry I was misremembering. My memory is hazy but there was definitely a problem at the time with leaving the node in place.
>>
>>> When exactly vif interface appears in the system (starts to be available
>>> for the hotplug script)? Maybe remove 'hotplug-status' just before that
>>> point?
>>>
>>
>> I really can't remember any detail. Perhaps try reverting both patches then and check that the unbind/rmmod/modprobe/bind sequence still works (and the backend actually makes it into connected state).
> 
> Ok, I've tried this. I've reverted both commits, then used your test
> script from the 9476654bd5e8ad42abe8ee9f9e90069ff8e60c17:
>      
>      This has been tested by running iperf as a server in the test VM and
>      then running a client against it in a continuous loop, whilst also
>      running:
>      
>      while true;
>        do echo vif-$DOMID-$VIF >unbind;
>        echo down;
>        rmmod xen-netback;
>        echo unloaded;
>        modprobe xen-netback;
>        cd $(pwd);
>        brctl addif xenbr0 vif$DOMID.$VIF;
>        ip link set vif$DOMID.$VIF up;
>        echo up;
>        sleep 5;
>        done
>      
>      in dom0 from /sys/bus/xen-backend/drivers/vif to continuously unbind,
>      unload, re-load, re-bind and re-plumb the backend.
>      
> In fact, the need to call `brctl` and `ip link` manually is exactly
> because the hotplug script isn't executed. When I execute it manually,
> the backend properly gets back to working. So, removing 'hotplug-status'
> was in the correct place (netback_remove). The missing part is the toolstack
> calling the hotplug script on xen-netback re-bind.
> 

Why is that missing? We're going behind the back of the toolstack to do 
the unbind and bind so why should we expect it to re-execute a hotplug 
script?

> In this case, I'm not sure what is the proper way. If I restart
> xendriverdomain service (I do run the backend in domU), it properly
> executes hotplug script and the backend interface gets properly
> configured. But it doesn't do it on its own. It seems to be related to
> device "state" in xenstore. The specific part of the libxl is
> backend_watch_callback():
> https://github.com/xen-project/xen/blob/master/tools/libs/light/libxl_device.c#L1664
> 
>      ddev = search_for_device(dguest, dev);
>      if (ddev == NULL && state == XenbusStateClosed) {
>          /*
>           * Spurious state change, device has already been disconnected
>           * or never attached.
>           */
>          goto skip;
>      } else if (ddev == NULL) {
>          rc = add_device(egc, nested_ao, dguest, dev);
>          if (rc > 0)
>              free_ao = true;
>      } else if (state == XenbusStateClosed && online == 0) {
>          rc = remove_device(egc, nested_ao, dguest, ddev);
>          if (rc > 0)
>              free_ao = true;
>          check_and_maybe_remove_guest(gc, ddomain, dguest);
>      }
> 
> In short: if device gets XenbusStateInitWait for the first time (ddev ==
> NULL case), it goes to add_device() which executes the hotplug script
> and stores the device.
> Then, if device goes to XenbusStateClosed + online==0 state, then it
> executes hotplug script again (with "offline" parameter) and forgets the
> device. If you unbind the driver, the device stays in
> XenbusStateConnected state (in xenstore), and after you bind it again,
> it goes to XenbusStateInitWait. It don't think it goes through
> XenbusStateClosed, and online stays at 1 too, so libxl doesn't execute
> the hotplug script again.

This is pretty key. The frontend should not notice an unbind/bind i.e. 
there should be no evidence of it happening by examining states in 
xenstore (from the guest side).

   Paul

> 
> Some solution could be to add an extra case at the end, like "ddev !=
> NULL && state == XenbusStateInitWait && hotplug-status != connected".
> And make sure xl devd won't call the same hotplug script multiple times
> for the same device _at the same time_ (I'm not sure about the async
> machinery here).
> 
> But even if xl devd (aka xendriverdomain service) gets "fixes" to
> execute hotplug script in that case, I don't think it would work in
> backend in dom0 case - there, I think nothing watches already configured
> vif interfaces (there is no xl devd daemon in dom0, and xl background
> process watches only domain death and cdrom eject events).
> 
> I'm adding toolstack maintainers, maybe they'll have some idea...
> 
> In any case, the issue is not calling the hotplug script, responsible
> for configuring newly created vif interface. Not kernel waiting for it.
> So, I think both commits should still be reverted.
> 


