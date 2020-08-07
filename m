Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3223EE05
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 15:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k42HD-0000GN-9Z; Fri, 07 Aug 2020 13:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tO9i=BR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k42HB-0000GI-KG
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 13:19:13 +0000
X-Inumbo-ID: bc00dd05-3b7e-411f-91ec-f4fdadf27f3f
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc00dd05-3b7e-411f-91ec-f4fdadf27f3f;
 Fri, 07 Aug 2020 13:19:12 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s9so983231lfs.4
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2020 06:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=v+tM16kBQeEArp/adNDsPzgISiWKOmzNK4PsOuCVXOk=;
 b=F3jAJtuaL4zH/YZxgGIVjrxZkgFXL2u2QJRIDsbh3PQnWj+CkFd2xXhkJ5id0S/hkL
 sANXkkyp0e+F/+Phcz2FnvLX2bynNV73mMn8PvXHH+K0lGl085t4LHjqffBc3gfuiWWS
 opmcETb9Lybo57jx91XzkklCOBkjBhu6LD5r0IHXt6q6u+HiJDBp9P8kuDXvvNQ87LrG
 p72zUb7+pKkHxoYI6er91tebsTlbjj21ehViOi5X0OVg2tvDE34gxaZiB8oHiARZWVFf
 VRj7VjtAy0MuXXiUPF/saA0pg4N7ftObEE2R7MBug5v+vcNqpK9ZWOtttZtokg8rXB1Q
 5s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=v+tM16kBQeEArp/adNDsPzgISiWKOmzNK4PsOuCVXOk=;
 b=KW9q1x1UZEk/R4Qe0T9XuMa0sDcOXVgCFCOZoaTLZdKIq8hsioV2imfIOWMVN9TY3Z
 qW9086nzn+BUeMw4/viKp4W4VEoFti3DuX18v8ZF4Cb8njXUrEsIMimggkdN0cOfdTv/
 z/TDiwW52wl8jURlfQ2X7cGC17Rz9nXMSbXAgqwoH33YpOnhcFCCk7hywY+I8qfrCeSf
 WlzxLhcv9I+BcPHA/URkj+UokJ4QVbTdSa9NyhojTCv65OtK8mKLDkqamxfSRbP1cMta
 n2myQOkbEvFgKiD0a/CJCoq2RgQn63vlxfivTL6PE2GSUhER3o9KBXEwzIKlE2RYXURp
 iQQQ==
X-Gm-Message-State: AOAM531K8MhssE4CKBx4D5BUvWESBg6//vLE1RccjB9taBsn0vtKJZzz
 yv8qXd18GZGSotd0E4Jcm70=
X-Google-Smtp-Source: ABdhPJwiNF+s/P6sp7pcOgva+W3yKCz/a2anYi1V4/WmeXBGqfYjUsImZRDOATVmqEKVvuSMiAGLAw==
X-Received: by 2002:a19:8957:: with SMTP id l84mr6186828lfd.66.1596806351338; 
 Fri, 07 Aug 2020 06:19:11 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j66sm4233203lfd.74.2020.08.07.06.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 06:19:10 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
 <51e30c1c-6b19-e646-fdc4-683b3197817a@suse.com>
 <alpine.DEB.2.21.2008061331140.16004@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6b616d44-9539-1766-cac7-da6a2dfbd7df@gmail.com>
Date: Fri, 7 Aug 2020 16:19:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008061331140.16004@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Kevin Tian' <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 06.08.20 23:32, Stefano Stabellini wrote:

Hi Stefano

> On Thu, 6 Aug 2020, Jan Beulich wrote:
>> On 06.08.2020 02:37, Stefano Stabellini wrote:
>>> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
>>> early and let the scheduler do its job? Something like:
>>>
>>>              enum io_state state = try_handle_mmio(regs, hsr, gpa);
>>>
>>>              switch ( state )
>>>              {
>>>              case IO_ABORT:
>>>                  goto inject_abt;
>>>              case IO_HANDLED:
>>>                  advance_pc(regs, hsr);
>>>                  return;
>>>              case IO_RETRY:
>>>                  /* finish later */
>>>                  return;
>>>              case IO_UNHANDLED:
>>>                  /* IO unhandled, try another way to handle it. */
>>>                  break;
>>>              default:
>>>                  ASSERT_UNREACHABLE();
>>>              }
>>>
>>> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
>>> handle_hvm_io_completion() after QEMU completes the emulation. Today,
>>> handle_mmio just sets the user register with the read value.
>>>
>>> But it would be better if it called again the original function
>>> do_trap_stage2_abort_guest to actually retry the original operation.
>>> This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
>>> IO_HANDLED instead of IO_RETRY, thus, it will advance_pc (the program
>>> counter) completing the handling of this instruction.
>>>
>>> The user register with the read value could be set by try_handle_mmio if
>>> try_fwd_ioserv returns IO_HANDLED instead of IO_RETRY.
>>>
>>> Is that how the state machine is expected to work?
>> I think so. Just because it has taken us quite some time (years) on
>> the x86 side to get reasonably close to how hardware would behave
>> (I think we're still not fully there): The re-execution path needs
>> to make sure it observes exactly the same machine state as the
>> original path did. In particular changes to memory (by another vCPU)
>> must not be observed.
> Thanks for the heads up. I think I understand how it is supposed to work
> now. I hope Oleksandr is on the same page.

Not completely. I am still going through the discussion and navigating 
the code trying to understand missing bits for me.

Thanks for trying to clarify how it supposed to work.


-- 
Regards,

Oleksandr Tyshchenko


