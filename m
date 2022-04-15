Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB75028AF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 13:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305726.520820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfJmq-0003hV-Ej; Fri, 15 Apr 2022 11:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305726.520820; Fri, 15 Apr 2022 11:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfJmq-0003e1-BX; Fri, 15 Apr 2022 11:06:48 +0000
Received: by outflank-mailman (input) for mailman id 305726;
 Fri, 15 Apr 2022 11:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqiY=UZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nfJmo-0003dv-OA
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 11:06:46 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2355faae-bcac-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 13:06:45 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id u7so13529505lfs.8
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 04:06:45 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a2ea174000000b0024daa37e1b9sm47007ljl.42.2022.04.15.04.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 04:06:44 -0700 (PDT)
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
X-Inumbo-ID: 2355faae-bcac-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9OZ0DfSHkuifjXA+DSw6eW4ayG5DohDS90ciIVw9aDA=;
        b=qrJ4Gj9j7MYNfbOFOHoNEmPF4/sRHBmP/5QqKRwVY+TUn2YsHnLbKCZG/JQ6MxhTqe
         F1t85WXInHtX/2IOtS9A4+1NNz67SPsPIUvX8H6pD8o8J29GlIspabwnrzY2jVKuACXM
         yNWy7e0TJ6+3BdgJcR2OXjnZEzgXEnd3fkge71SV5W4JAxBUIXfFqbjmxA0yQXDjH1zp
         wqdImTm93fbf/sN1O0lNYi/S8SsL6E/ygJpQKrCuYWSFLSqd9RuEO711nWI8DnKX3qyi
         NdDqlXWrNTWIb8UIS/9KZRckwte9mRWmuY9ot8WlB/THL0Ei6xblHjDdG/RTJmJGLXVk
         NCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9OZ0DfSHkuifjXA+DSw6eW4ayG5DohDS90ciIVw9aDA=;
        b=1QB1IKWF+sM0WcB0bF2SBOLn7/dbiu0NOZMt0RoEVvtWVyfcLA9rMSav3Fd9ujSjyH
         GQ3TV+HndEewx19BUbqLW0mELuA4X3aR3ljZj1CHlk3ObES3TvDonp7Vp2durdlGdixR
         JQ9FnqqNUwag5nT/EVf5lFj24jK6mA8yBLAiwkRfvjyeMWWaLXoS+o4eA1FOQG8kGq2F
         5Yv7itTGJy+qlTxGy3Yp4Z8dS/NwtBZYKg8HvbF5rNR/2iTHOLq1YTLHz4LWetuZ4RIt
         JCRekx0FBisDxPqL8Ip55cjHS9nTlqBuOsKFdcjM97jo1Hq1sAZ5mZ7vJA2qyKGhpjlp
         CbRw==
X-Gm-Message-State: AOAM533aQvrsvONxfkh6u1ZszZJU61GFzHgc3TshqGT7j0eKAeSN/SP1
	nEmhYLcqe3t7umFto1gwh4M=
X-Google-Smtp-Source: ABdhPJzZJ3c3sR0XS14bKxbAClozJqziR03ZDWQ8k0vcdD2EvEID7ve1ZL+FxpnjzYBkOZ5Uj9DdKg==
X-Received: by 2002:a05:6512:3e1f:b0:464:f5e3:d8a2 with SMTP id i31-20020a0565123e1f00b00464f5e3d8a2mr4945816lfv.366.1650020804961;
        Fri, 15 Apr 2022 04:06:44 -0700 (PDT)
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project
 Stratos
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Rich Persaud <persaur@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>,
 openxt <openxt@googlegroups.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
 <874ka68h96.fsf@linaro.org>
 <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
 <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
 <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com>
 <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s>
 <CAPD2p-m=hYbG1YjPZ9yZ7Qzs6KjCT2jSHpaDUPB0sFJoZfY4uw@mail.gmail.com>
 <alpine.DEB.2.21.2110041436070.3209@sstabellini-ThinkPad-T480s>
 <1d6382b6-ddf8-494c-4f7b-afc50a4269a4@gmail.com>
 <CAPD2p-nftmTXQTaOw1kmkBDn96i8sgcaH21o7bsGK-fA+fYbaw@mail.gmail.com>
 <87pmlisnst.fsf@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6bf0ebc5-fe3c-5c59-0427-87f02a35e7f2@gmail.com>
Date: Fri, 15 Apr 2022 14:06:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87pmlisnst.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.04.22 12:07, Alex Bennée wrote:


Hello Alex

> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
>
>> Hello all.
>>
>> [Sorry for the possible format issues]
>>
>> I have an update regarding (valid) concern which has been also raised in current thread which is the virtio backend's ability (when using
>> Xen foreign mapping) to map any guest pages without guest "agreement" on that.
>> There is a PoC (with virtio-mmio on Arm) which is based on Juergen Gross’  work to reuse secure Xen grant mapping for the virtio
>> communications.
>> All details are at:
>> https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/
>> https://lore.kernel.org/xen-devel/1649964960-24864-1-git-send-email-olekstysh@gmail.com/
> Thanks for that. I shall try and find some time to have a look at it.
>
> Did you see Viresh's post about getting our rust-vmm vhost-user backends
> working on Xen?

Great work! I see the email in my mailbox, but didn't analyze it yet. I 
will definitely take a look at it.


>
> One thing that came up during that work was how guest pages are mapped
> into the dom0 domain where Xen needs to use kernel allocated pages via
> privcmd rather than then normal shared mmap that is used on KVM. As I
> understand it this is to avoid the situation where dom0 may invalidate a
> user PTE causing issues for the hypervisor itself. At some point we
> would like to fix that wrinkle so we can remove the (minor) hack in
> rust-vmm's mmap code to be truly hypervisor agnostic.
>
> Anyway I hope you and your team are safe and well.

Thank you!


>
-- 
Regards,

Oleksandr Tyshchenko


