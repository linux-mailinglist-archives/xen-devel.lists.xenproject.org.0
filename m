Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA32406C9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 15:42:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k583a-0003sh-PM; Mon, 10 Aug 2020 13:41:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWL+=BU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k583Y-0003sZ-W3
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 13:41:41 +0000
X-Inumbo-ID: 65a6df08-4d61-41fe-ae44-2df671a08727
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65a6df08-4d61-41fe-ae44-2df671a08727;
 Mon, 10 Aug 2020 13:41:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w14so9613271ljj.4
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dOILpsKXJFlU3OVwX84p9SOcs/Wqrqoxliu9OBxc+jg=;
 b=sYOf9QYwFP+uakTNk/MvagovCIfMxbATr2tDDMOKF6o/8k/KKFcc6nmPdaZkPOCapB
 SMU/NFFgB4lSunuQdscjAm2kVaoYDsh+CajRLRqYchHur2zsJ0T2Y82AFKNa/GTG57wV
 GHJqffsIKMxHTocuXca4nEPh24OyDEsyhbh+RvFXRHWRm0pzq0EpknOhf398wKCRg1e6
 IyKMjPj/xYehcniXe6nb6jhUoEz8hg1qM/SjHFyqPLFM2T3d2WzVP3Vy7rVPU9OjGEv7
 nflCtMvoyPnXei4vpkG/92EdjCx578n7QMqzI6DtZLiXP+LnYkE3UEcAuK8WxLgL8RzK
 2grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dOILpsKXJFlU3OVwX84p9SOcs/Wqrqoxliu9OBxc+jg=;
 b=kdT5LTyP4fZIAawQcTVSBMHjwXyUmsjt1h45/ISgaevXqaYkOuuY1TKsIMSIpxH29g
 bzt0taAxwLy6nHrM5APh5t538qed2of7q2xSaTnSPDvGthnCLG7YB4aouHkPnwBaZmF8
 mW4eVnFm/aSi5i6MpE1F/Ta8lwfh3UH9Q8/8bXqHyOvWC8luRLCFepFrpZMntDS9IpT+
 HtQGdoJy/pgdnSFjvrXuOyJU2TuOUxbBURJ4jbkXnFqmJU7rhHaXyHTmos5zkgg4KyU6
 Nan02sleDMopYsp3klNqOkBEOeNctfO7A6ReQPz6qClwrapfcH3YCFGibCXyI1ntZcj5
 IiAg==
X-Gm-Message-State: AOAM533L01iPyuHmqsZPkX4GsXKPM7jvU+UotfrWw286wMbv10XBampR
 cZk2fMJrP6gSuvkRLc7+t8k=
X-Google-Smtp-Source: ABdhPJyTZCcH4+dGgpp7rMwtg+13BFZ5MybMBGSkw/OIsKt5OzcO9CJzvOdMtUGUNXMNUjzcmlANiw==
X-Received: by 2002:a2e:9f0a:: with SMTP id u10mr627913ljk.140.1597066898203; 
 Mon, 10 Aug 2020 06:41:38 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g6sm10751454lfr.51.2020.08.10.06.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 06:41:37 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
From: Oleksandr <olekstysh@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
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
Message-ID: <27513b2b-e59b-d446-7e68-eac4bc503409@gmail.com>
Date: Mon, 10 Aug 2020 16:41:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <06f78323-b8f5-fd11-486a-437267eccc29@gmail.com>
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
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


Hi


On 08.08.20 01:19, Oleksandr wrote:
>
> On 08.08.20 00:50, Stefano Stabellini wrote:
>
> Hi Stefano
>
>> On Fri, 7 Aug 2020, Oleksandr wrote:
>>> On 06.08.20 03:37, Stefano Stabellini wrote:
>>>
>>> Hi Stefano
>>>
>>> Trying to simulate IO_RETRY handling mechanism (according to model 
>>> below) I
>>> continuously get IO_RETRY from try_fwd_ioserv() ...
>>>
>>>> OK, thanks for the details. My interpretation seems to be correct.
>>>>
>>>> In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
>>>> return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
>>>> also needs to handle try_handle_mmio returning IO_RETRY the first
>>>> around, and IO_HANDLED when after QEMU does its job.
>>>>
>>>> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
>>>> early and let the scheduler do its job? Something like:
>>>>
>>>>               enum io_state state = try_handle_mmio(regs, hsr, gpa);
>>>>
>>>>               switch ( state )
>>>>               {
>>>>               case IO_ABORT:
>>>>                   goto inject_abt;
>>>>               case IO_HANDLED:
>>>>                   advance_pc(regs, hsr);
>>>>                   return;
>>>>               case IO_RETRY:
>>>>                   /* finish later */
>>>>                   return;
>>>>               case IO_UNHANDLED:
>>>>                   /* IO unhandled, try another way to handle it. */
>>>>                   break;
>>>>               default:
>>>>                   ASSERT_UNREACHABLE();
>>>>               }
>>>>
>>>> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
>>>> handle_hvm_io_completion() after QEMU completes the emulation. Today,
>>>> handle_mmio just sets the user register with the read value.
>>>>
>>>> But it would be better if it called again the original function
>>>> do_trap_stage2_abort_guest to actually retry the original operation.
>>>> This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
>>>> IO_HANDLED instead of IO_RETRY,
>>> I may miss some important point, but I failed to see why 
>>> try_handle_mmio
>>> (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this 
>>> stage.
>>> Or current try_fwd_ioserv() logic needs rework?
>> I think you should check the ioreq->state in try_fwd_ioserv(), if the
>> result is ready, then ioreq->state should be STATE_IORESP_READY, and you
>> can return IO_HANDLED.
>

I optimized test patch a bit (now it looks much simpler). I didn't face 
any issues during a quick test.
Julien, Stefano, what do you think it does proper things for addressing 
TODO? Or I missed something?


---
  xen/arch/arm/io.c    | 4 ----
  xen/arch/arm/ioreq.c | 7 ++++++-
  xen/arch/arm/traps.c | 4 +++-
  3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 436f669..3063577 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -156,10 +156,6 @@ static enum io_state try_fwd_ioserv(struct 
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
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 8f60c41..e5235c6 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -33,6 +33,8 @@
  #include <public/hvm/dm_op.h>
  #include <public/hvm/ioreq.h>

+#include <asm/traps.h>
+
  bool handle_mmio(void)
  {
      struct vcpu *v = current;
@@ -52,7 +54,7 @@ bool handle_mmio(void)

      /* XXX: Do we need to take care of write here ? */
      if ( dabt.write )
-        return true;
+        goto done;

      /*
       * Sign extend if required.
@@ -72,6 +74,9 @@ bool handle_mmio(void)

      set_user_reg(regs, dabt.reg, r);

+done:
+    advance_pc(regs, hsr);
+
      return true;
  }

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


