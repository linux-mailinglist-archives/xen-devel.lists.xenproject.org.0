Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B7242B6C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 16:35:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5rqv-0008QS-Ea; Wed, 12 Aug 2020 14:35:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDeE=BW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5rqu-0008QN-8i
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 14:35:40 +0000
X-Inumbo-ID: 9a9a55b7-6e21-472e-a6ee-20c815a52ac9
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a9a55b7-6e21-472e-a6ee-20c815a52ac9;
 Wed, 12 Aug 2020 14:35:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t6so2473979ljk.9
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=veU4l74qrYOZSlTMBNo4SErBIlMu6uXxr6Ps5EkG+xY=;
 b=a9P9xd2NNkE65OSQGmRMgEM/BJSUmAhfTcEwdyHFvM/rs2JPCzPutOv/N0rL7YeBSv
 VBIOnrxRSegJ4m3HjV5i3ZXFb5n3U0dN4AmUevwKJtB1bHcPIkDgBG66WLsIJHjeXlbS
 1KQc89mhJgG+gSn/MZfAhRj0kKxeh3S6j9OEsdOZGzsomb9mqbnNQmGkp1yAD81JN9j2
 w9kzxB6jp25xpXmzWGAwAMapsMPDCtDIoHUcC5HoDBv4nCOFGdoM/7lh7Ehhw+ljrpBZ
 FRPP1HsqpHIc7fxrol9fUp2PE/i0QZWKCLQPvNqBeYlxVcsSlxUOMTqINYE3EhNlTENk
 Eo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=veU4l74qrYOZSlTMBNo4SErBIlMu6uXxr6Ps5EkG+xY=;
 b=X1IQpldwoYBSTi/Yr3VravdJWWvE1B/WcsxFWQsswXlNIOR5aj4JWd3BjCcMv4ey6+
 V3BSQY9sLAYhkZDYYoo6bbxEYkz7qm2Xr6Eh1dGP5jnk4Y9Yq6O+46dfPNbql2Eb22Dv
 6EcpFEwcbcdUdoUXceBdeKML13BJ961/2J7F2qLAaXExfOHNW598mkptxykPmD82G4Xj
 +S/DbNA3wQiaK9R0OZigZ+N1B2x+JSmdqcxPPGhzuXhrOM1YQ+9IYGYGhLmN8UTHg4Xl
 /0KraS2QbrvTo81pMKsJeIVR4xEQJZwniOLyHydynujJ3oAzEw09rqG33YB/fNxWjrsR
 zZbQ==
X-Gm-Message-State: AOAM533JK+C0lx/LvLlJEQYohzaYGssnOLN9PM9cnOhZcGlEnv55Q/oo
 NMC0b/LKqy7qe4WCFUq3btc=
X-Google-Smtp-Source: ABdhPJzQ+fe+VKEhA1fDfTBAU7zp+5OYlV4xEn8Egu5Ea+QGZE4AsQlvi5X3Ywin8W6soBcZKLbNPw==
X-Received: by 2002:a2e:b619:: with SMTP id r25mr6035469ljn.220.1597242937441; 
 Wed, 12 Aug 2020 07:35:37 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x14sm479349ljd.1.2020.08.12.07.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 07:35:36 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 paul@xen.org, xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
 <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
 <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
 <06f78323-b8f5-fd11-486a-437267eccc29@gmail.com>
 <27513b2b-e59b-d446-7e68-eac4bc503409@gmail.com>
 <alpine.DEB.2.21.2008101200230.16004@sstabellini-ThinkPad-T480s>
 <441f4413-b746-035e-948e-da3ff76a9a3b@xen.org>
 <dc6de2f4-8f9d-aa96-8513-aecedb11e0ef@gmail.com>
 <alpine.DEB.2.21.2008111433520.15669@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <870b70b2-97da-3b3f-c06d-ffb5479328ac@gmail.com>
Date: Wed, 12 Aug 2020 17:35:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008111433520.15669@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 12.08.20 01:47, Stefano Stabellini wrote:

Hi Stefano

> On Tue, 11 Aug 2020, Oleksandr wrote:
>> On 11.08.20 12:19, Julien Grall wrote:
>>> On 11/08/2020 00:34, Stefano Stabellini wrote:
>>>> On Mon, 10 Aug 2020, Oleksandr wrote:
>>>>> On 08.08.20 01:19, Oleksandr wrote:
>>>>>> On 08.08.20 00:50, Stefano Stabellini wrote:
>>>>>>> On Fri, 7 Aug 2020, Oleksandr wrote:
>>>>>>>> On 06.08.20 03:37, Stefano Stabellini wrote:
>>>>>>>>
>>>>>>>> Hi Stefano
>>>>>>>>
>>>>>>>> Trying to simulate IO_RETRY handling mechanism (according to model
>>>>>>>> below) I
>>>>>>>> continuously get IO_RETRY from try_fwd_ioserv() ...
>>>>>>>>
>>>>>>>>> OK, thanks for the details. My interpretation seems to be
>>>>>>>>> correct.
>>>>>>>>>
>>>>>>>>> In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv
>>>>>>>>> should
>>>>>>>>> return IO_RETRY. Then,
>>>>>>>>> xen/arch/arm/traps.c:do_trap_stage2_abort_guest
>>>>>>>>> also needs to handle try_handle_mmio returning IO_RETRY the
>>>>>>>>> first
>>>>>>>>> around, and IO_HANDLED when after QEMU does its job.
>>>>>>>>>
>>>>>>>>> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply
>>>>>>>>> return
>>>>>>>>> early and let the scheduler do its job? Something like:
>>>>>>>>>
>>>>>>>>>                 enum io_state state = try_handle_mmio(regs, hsr,
>>>>>>>>> gpa);
>>>>>>>>>
>>>>>>>>>                 switch ( state )
>>>>>>>>>                 {
>>>>>>>>>                 case IO_ABORT:
>>>>>>>>>                     goto inject_abt;
>>>>>>>>>                 case IO_HANDLED:
>>>>>>>>>                     advance_pc(regs, hsr);
>>>>>>>>>                     return;
>>>>>>>>>                 case IO_RETRY:
>>>>>>>>>                     /* finish later */
>>>>>>>>>                     return;
>>>>>>>>>                 case IO_UNHANDLED:
>>>>>>>>>                     /* IO unhandled, try another way to handle
>>>>>>>>> it. */
>>>>>>>>>                     break;
>>>>>>>>>                 default:
>>>>>>>>>                     ASSERT_UNREACHABLE();
>>>>>>>>>                 }
>>>>>>>>>
>>>>>>>>> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
>>>>>>>>> handle_hvm_io_completion() after QEMU completes the emulation.
>>>>>>>>> Today,
>>>>>>>>> handle_mmio just sets the user register with the read value.
>>>>>>>>>
>>>>>>>>> But it would be better if it called again the original function
>>>>>>>>> do_trap_stage2_abort_guest to actually retry the original
>>>>>>>>> operation.
>>>>>>>>> This time do_trap_stage2_abort_guest calls try_handle_mmio() and
>>>>>>>>> gets
>>>>>>>>> IO_HANDLED instead of IO_RETRY,
>>>>>>>> I may miss some important point, but I failed to see why
>>>>>>>> try_handle_mmio
>>>>>>>> (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at
>>>>>>>> this
>>>>>>>> stage.
>>>>>>>> Or current try_fwd_ioserv() logic needs rework?
>>>>>>> I think you should check the ioreq->state in try_fwd_ioserv(), if
>>>>>>> the
>>>>>>> result is ready, then ioreq->state should be STATE_IORESP_READY, and
>>>>>>> you
>>>>>>> can return IO_HANDLED.
>>>>> I optimized test patch a bit (now it looks much simpler). I didn't face
>>>>> any
>>>>> issues during a quick test.
>>>> Both patches get much closer to following the proper state machine,
>>>> great! I think this patch is certainly a good improvement. I think the
>>>> other patch you sent earlier, slightly larger, is even better. It makes
>>>> the following additional changes that would be good to have:
>>>>
>>>> - try_fwd_ioserv returns IO_HANDLED on state == STATE_IORESP_READY
>>>> - handle_mmio simply calls do_trap_stage2_abort_guest
>>> I don't think we should call do_trap_stage2_abort_guest() as part of the
>>> completion because:
>>>      * The function do_trap_stage2_abort_guest() is using registers that are
>>> not context switched (such as FAR_EL2). I/O handling is split in two with
>>> likely a context switch in the middle. The second part is the completion
>>> (i.e call to handle_mmio()). So the system registers will be incorrect.
>>>      * A big chunk of do_trap_stage2_abort_guest() is not necessary for the
>>> completion. For instance, there is no need to try to translate the guest
>>> virtual address to a guest physical address.
>>>
>>> Therefore the version below is probably the best approach.
>>
>> Indeed, the first version (with calling do_trap_stage2_abort_guest() for a
>> completion) is a racy. When testing it more heavily I faced an issue
>> (sometimes) which resulted in DomU got stuck completely.
>>
>> (XEN) d2v1: vGICD: bad read width 0 r11 offset 0x000f00
>>
>> I didn't investigate an issue in detail, but I assumed that code in
>> do_trap_stage2_abort_guest() caused that. This was the main reason why I
>> decided to optimize an initial patch (and took only advance_pc).
>> Reading Julien's answer I understand now what could happen.
>  From your and Julien's feedback it is clear that calling
> do_trap_stage2_abort_guest() is not possible and not a good idea.
>
>
> The reason for my suggestion was to complete the implementation of the
> state machine so that "RETRY" actually means "let's try again the
> emulation" but the second time it will return "HANDLED".
>
> Looking at this again, we could achieve the same goal in a better way by
> moving the register setting from "handle_mmio" to "try_handle_mmio" and
> also calling "try_handle_mmio" from "handle_mmio". Note that handle_mmio
> would become almost empty like on x86.
>
> 1) do_trap_stage2_abort_guest ->
>         try_handle_mmio ->
>              try_fwd_ioserv ->
>                  IO_RETRY
>
> 2) handle_hvm_io_completion ->
>         handle_mmio ->
>             try_handle_mmio ->
>                 try_fwd_ioserv ->
>                     IO_HANDLED
>
>
> It is very similar to your second patch with a small change on calling
> try_handle_mmio from handle_mmio and setting the register there. Do you
> think that would work?
If I understood correctly what you had suggested and properly 
implemented then it works, at least I didn't face any issues during testing.
I think this variant adds some extra operations comparing to the 
previous one (for example an attempt to find a mmio handler at 
try_handle_mmio). But, if you think new variant is cleaner and better 
represents how the state machine should look like, I would be absolutely 
OK to take this variant for non-RFC series. Please note, there was a 
request to move try_fwd_ioserv() to arm/ioreq.c (I am going to move new 
handle_ioserv() as well).


---
  xen/arch/arm/io.c    | 47 +++++++++++++++++++++++++++++++++++++++++++----
  xen/arch/arm/ioreq.c | 38 +++++++-------------------------------
  xen/arch/arm/traps.c |  4 +++-
  3 files changed, 53 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 436f669..4db7c55 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -109,6 +109,43 @@ static const struct mmio_handler 
*find_mmio_handler(struct domain *d,
  }

  #ifdef CONFIG_IOREQ_SERVER
+static enum io_state handle_ioserv(struct cpu_user_regs *regs, struct 
vcpu *v)
+{
+    const union hsr hsr = { .bits = regs->hsr };
+    const struct hsr_dabt dabt = hsr.dabt;
+    /* Code is similar to handle_read */
+    uint8_t size = (1 << dabt.size) * 8;
+    register_t r = v->arch.hvm.hvm_io.io_req.data;
+
+    /* We are done with the IO */
+    /* XXX: Is it the right place? */
+    v->arch.hvm.hvm_io.io_req.state = STATE_IOREQ_NONE;
+
+    /* XXX: Do we need to take care of write here ? */
+    if ( dabt.write )
+        return IO_HANDLED;
+
+    /*
+     * Sign extend if required.
+     * Note that we expect the read handler to have zeroed the bits
+     * outside the requested access size.
+     */
+    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    {
+        /*
+         * We are relying on register_t using the same as
+         * an unsigned long in order to keep the 32-bit assembly
+         * code smaller.
+         */
+        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
+        r |= (~0UL) << size;
+    }
+
+    set_user_reg(regs, dabt.reg, r);
+
+    return IO_HANDLED;
+}
+
  static enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
                                      struct vcpu *v, mmio_info_t *info)
  {
@@ -130,6 +167,10 @@ static enum io_state try_fwd_ioserv(struct 
cpu_user_regs *regs,
      {
      case STATE_IOREQ_NONE:
          break;
+
+    case STATE_IORESP_READY:
+        return IO_HANDLED;
+
      default:
          printk("d%u wrong state %u\n", v->domain->domain_id,
                 vio->io_req.state);
@@ -156,10 +197,6 @@ static enum io_state try_fwd_ioserv(struct 
cpu_user_regs *regs,
      else
          vio->io_completion = HVMIO_mmio_completion;

-    /* XXX: Decide what to do */
-    if ( rc == IO_RETRY )
-        rc = IO_HANDLED;
-
      return rc;
  }
  #endif
@@ -185,6 +222,8 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
*regs,

  #ifdef CONFIG_IOREQ_SERVER
          rc = try_fwd_ioserv(regs, v, &info);
+        if ( rc == IO_HANDLED )
+            return handle_ioserv(regs, v);
  #endif

          return rc;
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 8f60c41..9068b8d 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -33,46 +33,22 @@
  #include <public/hvm/dm_op.h>
  #include <public/hvm/ioreq.h>

+#include <asm/traps.h>
+
  bool handle_mmio(void)
  {
      struct vcpu *v = current;
      struct cpu_user_regs *regs = guest_cpu_user_regs();
      const union hsr hsr = { .bits = regs->hsr };
-    const struct hsr_dabt dabt = hsr.dabt;
-    /* Code is similar to handle_read */
-    uint8_t size = (1 << dabt.size) * 8;
-    register_t r = v->arch.hvm.hvm_io.io_req.data;
-
-    /* We should only be here on Guest Data Abort */
-    ASSERT(dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
+    paddr_t addr = v->arch.hvm.hvm_io.io_req.addr;

-    /* We are done with the IO */
-    /* XXX: Is it the right place? */
-    v->arch.hvm.hvm_io.io_req.state = STATE_IOREQ_NONE;
-
-    /* XXX: Do we need to take care of write here ? */
-    if ( dabt.write )
-        return true;
-
-    /*
-     * Sign extend if required.
-     * Note that we expect the read handler to have zeroed the bits
-     * outside the requested access size.
-     */
-    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
      {
-        /*
-         * We are relying on register_t using the same as
-         * an unsigned long in order to keep the 32-bit assembly
-         * code smaller.
-         */
-        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
-        r |= (~0UL) << size;
+        advance_pc(regs, hsr);
+        return true;
      }

-    set_user_reg(regs, dabt.reg, r);
-
-    return true;
+    return false;
  }

  /* Ask ioemu mapcache to invalidate mappings. */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ea472d1..974c744 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1965,11 +1965,13 @@ static void do_trap_stage2_abort_guest(struct 
cpu_user_regs *regs,
              case IO_HANDLED:
                  advance_pc(regs, hsr);
                  return;
+            case IO_RETRY:
+                /* finish later */
+                return;
              case IO_UNHANDLED:
                  /* IO unhandled, try another way to handle it. */
                  break;
              default:
-                /* XXX: Handle IO_RETRY */
                  ASSERT_UNREACHABLE();
              }
          }
-- 
2.7.4



-- 
Regards,

Oleksandr Tyshchenko


