Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49913514734
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317195.536419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkO7M-0005aL-FI; Fri, 29 Apr 2022 10:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317195.536419; Fri, 29 Apr 2022 10:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkO7M-0005XS-C6; Fri, 29 Apr 2022 10:44:56 +0000
Received: by outflank-mailman (input) for mailman id 317195;
 Fri, 29 Apr 2022 10:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1X1=VH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nkO7L-0005XM-HM
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:44:55 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c3f84e-c7a9-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 12:44:53 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id bu29so13366554lfb.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Apr 2022 03:44:54 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05651c02cc00b0024f3d1dae85sm240897ljo.13.2022.04.29.03.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 03:44:53 -0700 (PDT)
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
X-Inumbo-ID: 66c3f84e-c7a9-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nWVhfCJXVelcPeO/G6jDbgAGKRJ2brFr6z/qTwXN+Wo=;
        b=IDvmnEHpfcP58KNEuQSeY64SwDcooAwuUPbBzyb4yv1DggY1GzqL7r7Bq136Ugogbm
         HHn762IFJ+rQgNX6T4f+vmdMeZd5rxz9FrtpfDGR9BiOv2fuiw4CL85ubu/k9m6sAOBA
         Ch+ifMSZADe3DshR0MxOdiMfWSR42L7NK9UJng72e3p/2jxkFclTrl9vaBtruqJv7BhR
         9iaD9gJksrZJRwk3RIn7CiEekgKjAgAk7ETt/Lg43HqjUtqebuekkDp8TAMcFECUoKBh
         5+0oAj1HC6DzInwPajLU68+014b1pavawDDwsX2/YNyTPN1Q1MjI6Ik2z/KwptPlUN1C
         u6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nWVhfCJXVelcPeO/G6jDbgAGKRJ2brFr6z/qTwXN+Wo=;
        b=0T7Rvo2uCnnUwQt00lfeYAl6hPJfGwNRpxlwc6k6bESGVsjA2GWu/q3XQ84+2PrO2E
         s4ezPOFZtToIXQ2jn1cjpF8zIXKXP+RPf2eCEZQC6idWCdyjytJm6RgseH1rAcAaew4g
         yOtzVQ7nI3fwThY704sJT/MdR2jMgpP7UvEG2CFZiI7Feo/nnYVERdaqRR942cozpXvp
         KFhv5STb9Iet6RuWpkSYAQvXKT71+sGQxGJjhfrdNyBJdMjOocRsViUmgx9ogpzMCEQ9
         rlO/whTJ1mMKG/i1fBhuUJmWt9S9weIwRNxCnDaL7dZuLJ7/qPbCmDyN5j5gQcsTgGgf
         mTdA==
X-Gm-Message-State: AOAM533EDJORz9mfqVNSp2myY/4pKTWGRYMCk5she+ERNwvTjmexEcN6
	KWIVwd2bZi7ov4WuY9tGwnGJa28pJ8U=
X-Google-Smtp-Source: ABdhPJywaDyP7t0OKyLxVG1I5PC+KmhE0jvOKO39oal5xED7cnvL24VSa6HovwFqn76tNet2OHmUbg==
X-Received: by 2002:a05:6512:3b2c:b0:472:e6c:929 with SMTP id f44-20020a0565123b2c00b004720e6c0929mr15194625lfv.505.1651229093826;
        Fri, 29 Apr 2022 03:44:53 -0700 (PDT)
Subject: Re: Virtio on Xen with Rust
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220429034808.dr647727dphnx6zk@vireshk-i7>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f9aeb25d-ba47-ec1f-d157-fa51ec23fdb5@gmail.com>
Date: Fri, 29 Apr 2022 13:44:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220429034808.dr647727dphnx6zk@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 29.04.22 06:48, Viresh Kumar wrote:


Hello Viresh

> On 28-04-22, 16:52, Oleksandr Tyshchenko wrote:
>> Great work!
> Thanks Oleksandr.
>
>> I skimmed through your toolstack patches, awesome, you created a completely
>> new virtual device "I2C".
> I have also created GPIO now :)

Awesome!


>
> What should I do about these patches ? Send them to xen list ? I can at least
> send the stuff which doesn't depend on your series ?

Below my understanding, which might be wrong)


I think, the best case scenario - is to try to get these features 
upstreamed. I expect a possible interest to virtulized I2C/GPIO devices 
on Xen,
especially in embedded environment where the passthrough of dedicated 
I2C/GPIO controller to the guest is not possible for some reason 
(clocks, pins, power domains, etc).
But I do understand it most likely takes some time. If upsteaming this 
stuff is not your primary target, then I think, such patch series 
deserves to be sent to the Xen mailing list anyway for someone who is 
interested in the topic to give it a try. For example, you can send RFC 
version saying in cover letter that it depends on non-upsteamed yet 
stuff to start discussion.



>
>> FYI, I have updated "Virtio support for toolstack on Arm" [1] since (to
>> make it more generic), now V7 is available and I have a plan to push V8
>> soon.
> I will surely have a look, thanks.
>
>> FYI, currently we are working on one feature to restrict memory access
>> using Xen grant mappings based on xen-grant DMA-mapping layer for Linux [1].
>> And there is a working PoC on Arm based on an updated virtio-disk. As for
>> libraries, there is a new dependency on "xengnttab" library. In comparison
>> with Xen foreign mappings model (xenforeignmemory),
>> the Xen grant mappings model is a good fit into the Xen security model,
>> this is a safe mechanism to share pages between guests.
> Right, I was aware of this work but didn't dive into it yet. We will surely need
> to do that eventually, lets see when I will be able to get to that. The current
> focus is the get the solution a bit more robust (so it can be used with any
> device) and upstream it to rust-vmm space on github.

ok, I see. I understand your point, your primary target is 
hypervisor-agnostic Rust based backend(s) to be applicable for any device.



>
>> With Xen grant mappings, if I am not mistaken, it is going to be almost the
>> same: mmap() then ioctl(). But the file will be "/dev/xen/gntdev".
> Okay, the problem (for us) still exists then :)

It seems, yes.


>   
>> FYI, new branch "virtio_grant" besides supporting Xen grant mappings also
>> supports virtio-mmio modern transport.
> Somehow the timing of your emails have been spot on.
>
> Last time, when you told me about the "dev" branch, I have already started to
> reinvent the wheel and your branch really helped.
>
> Now, it was just yesterday that I started looking into MMIO modern stuff as the
> GPIO device needs it and you sent me working code to look how to do it as well.
> You saved at least 1-2 days of my time :)

Great, I'm glad to hear it.


>
> Thanks Oleksandr.
>
-- 
Regards,

Oleksandr Tyshchenko


