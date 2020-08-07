Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253EB23F16D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 18:46:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k45V0-000378-E4; Fri, 07 Aug 2020 16:45:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tO9i=BR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k45Ux-000373-Vy
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 16:45:40 +0000
X-Inumbo-ID: 24368799-a221-453a-957f-4d67da6648d7
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24368799-a221-453a-957f-4d67da6648d7;
 Fri, 07 Aug 2020 16:45:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w14so2897129ljj.4
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2020 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OKnKaDsW4tXKd1t6D0Hn6bOIWa9VRPJN8GCZNprwAxw=;
 b=rWtAOm3p42vcepX9bTiK6E1onY4lThF1oWXO0xv2H5/pRnJQ8oWf4Gg2VVfEe2Nu6p
 k4Cr5A3qMRck362TE7a76VKzRWwtqDvXEl/Rtq/xtbpFR1KlCMIzNdU2aVZyAqQbAnvX
 HFteaupAIuO1e1TLQufKQmTxUZDB2V5cwDpASpp76KcSSNAUXPNJ5NcJ6c53y/hHMok4
 tubu1HSIeda3OEp1nxvZNVTshrnb64RGdxLE6aeF2mBXIWqsKyjCuHKiTHO6KD77LKfF
 KTcQ5JjR0QqMjRMD/bRPjRVVtN9O1JyV2Vw5Lw8tdE/wRFE3CLqb1Af5xSgzEM3ELfup
 bN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OKnKaDsW4tXKd1t6D0Hn6bOIWa9VRPJN8GCZNprwAxw=;
 b=KTu2KCXQxkPEhrevKpUS7CxkWavkrFstfbrqw79yiOKhXm0YRZgWfcyTzpAWsFJn8g
 07+TPd5LNXdvrztA66qN1xK2luSCjRDRtwJQDAHiGmwL3sHCZc1y98Rcw/VUk88zoq+n
 HKD3FjL8D/xwA8GrGnUyEI6MAdsDL8P3/YFisAHQX9rTzOYCduUd6IsM+EE3DnALosVR
 0vngmEkGGa1mELPnTXWYlDHOdFntzM7j0+LyoPTQlq8WsYdxmVlnE6D5yZgRRzAxOkDW
 QbPWVrl1kwx55WvE8vjY2E+R9d3nF1xGlpL7kSMAl5Ttu5B9oo6gOhXyOPgUizmvW4pF
 Lh7A==
X-Gm-Message-State: AOAM533z6IwciYaVSFvxAqisCBpn2zhbK9nBw5WwhLyU1X+4gmP+fJ0E
 lloVGMnofkoTRx4ECfsP2Ac=
X-Google-Smtp-Source: ABdhPJzlvlMiDaTgaWxs+TXT686mYyyf+coLR/aYlu3B49X/+CPgbNcAIJXDgnxJI8WmKGp3HXuuVQ==
X-Received: by 2002:a2e:810c:: with SMTP id d12mr6319288ljg.34.1596818737811; 
 Fri, 07 Aug 2020 09:45:37 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v14sm3964892ljk.10.2020.08.07.09.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 09:45:37 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
Date: Fri, 7 Aug 2020 19:45:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
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


On 06.08.20 03:37, Stefano Stabellini wrote:

Hi Stefano

Trying to simulate IO_RETRY handling mechanism (according to model 
below) I continuously get IO_RETRY from try_fwd_ioserv() ...

> OK, thanks for the details. My interpretation seems to be correct.
>
> In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
> return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
> also needs to handle try_handle_mmio returning IO_RETRY the first
> around, and IO_HANDLED when after QEMU does its job.
>
> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
> early and let the scheduler do its job? Something like:
>
>              enum io_state state = try_handle_mmio(regs, hsr, gpa);
>
>              switch ( state )
>              {
>              case IO_ABORT:
>                  goto inject_abt;
>              case IO_HANDLED:
>                  advance_pc(regs, hsr);
>                  return;
>              case IO_RETRY:
>                  /* finish later */
>                  return;
>              case IO_UNHANDLED:
>                  /* IO unhandled, try another way to handle it. */
>                  break;
>              default:
>                  ASSERT_UNREACHABLE();
>              }
>
> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
> handle_hvm_io_completion() after QEMU completes the emulation. Today,
> handle_mmio just sets the user register with the read value.
>
> But it would be better if it called again the original function
> do_trap_stage2_abort_guest to actually retry the original operation.
> This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
> IO_HANDLED instead of IO_RETRY,
I may miss some important point, but I failed to see why try_handle_mmio 
(try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this stage.
Or current try_fwd_ioserv() logic needs rework?


> thus, it will advance_pc (the program
> counter) completing the handling of this instruction.
>
> The user register with the read value could be set by try_handle_mmio if
> try_fwd_ioserv returns IO_HANDLED instead of IO_RETRY.
>
> Is that how the state machine is expected to work?



-- 
Regards,

Oleksandr Tyshchenko


