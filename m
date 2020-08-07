Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413223F4D2
	for <lists+xen-devel@lfdr.de>; Sat,  8 Aug 2020 00:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4Ahi-0007La-5f; Fri, 07 Aug 2020 22:19:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tO9i=BR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k4Ahg-0007LT-EF
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 22:19:08 +0000
X-Inumbo-ID: 284a3f31-97a4-4ed2-b3a5-c49f995fcda9
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 284a3f31-97a4-4ed2-b3a5-c49f995fcda9;
 Fri, 07 Aug 2020 22:19:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z14so3782585ljm.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2020 15:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=kj4Bm7zVW/G9YqXBxFTfDMQ1Hf0mmGOOW4bVv9Zf+rU=;
 b=H4b6LI2upQmf7gF/zfst/s6b7W3sbHGR0CI81Qfutl3T4ayiOOU7tPzDF102t3waf3
 oPwlnc5XQIWklh0W4P4R08U3VG0tXqL9olZQQ0LxNjdD7wBBrwirG0FMFMQkvXn9zPxJ
 8SS1R2q5rH1gVy3PlptmUNU3AIbHwXCGuqr+6NBYVAIdDO893NkXlmEDOPT16jJmU7zX
 Gs8Wv78eajDOZG3nzOP/QVBFVtX9+nx7PTC4eC4ooLMokPbaqoGtbkodDHWtRg9ujoqd
 rVhx6+46hULAzH9w8BP/ag90GJI3Cqdd7AMIymKSd4pcv1sCcla1j5K5LFGs2BkLfhou
 Ubmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kj4Bm7zVW/G9YqXBxFTfDMQ1Hf0mmGOOW4bVv9Zf+rU=;
 b=KnvrWhLpjCECE308BT2k32Ilp6yjYM6yFa77Y0Jc3jFuOudNAyUsy08CA8KvOS07bg
 q+4O3ELt1olg7oE+J0fH/pgdAPpr3vs2dNYv1nBlVzJzizMiLwJV30/OXirLUeloyMG3
 lGEZyIAbbjAuAUI6TQzAQijMFcr32cknJKfpyjAQkfucKZhFZKuCfYS/oT/b0AxPue2S
 QMTxyNkAHPnrzam/obZ2f7BXUUO4tiZnVa2yYqnErobL8P6TPzJ8tWHVVJe5lSz2My43
 fE/2ZpoMbo6RFjpB7qBXLXvOiYVHwlbj/4o4aWKVWa3ay5+0waNiPdwiZbdu9LTaPtJa
 JFsw==
X-Gm-Message-State: AOAM533XK6cmz3sx0+tcd87k9xAKOzRO+zVtXSA0aAMq2XQqMbNpMjmL
 3+LtQToQLcUHi92nBnQHOhg=
X-Google-Smtp-Source: ABdhPJxgEB9BFCLKt0ZaVMBqxEgnqk5i7MFsZ211f4+LpjvjkG+xNiZS+99oxE4r1FCD7OfBpzqaEA==
X-Received: by 2002:a2e:9c86:: with SMTP id x6mr6961727lji.346.1596838745819; 
 Fri, 07 Aug 2020 15:19:05 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g24sm4298490ljl.139.2020.08.07.15.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 15:19:05 -0700 (PDT)
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
 <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
 <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <06f78323-b8f5-fd11-486a-437267eccc29@gmail.com>
Date: Sat, 8 Aug 2020 01:19:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
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


On 08.08.20 00:50, Stefano Stabellini wrote:

Hi Stefano

> On Fri, 7 Aug 2020, Oleksandr wrote:
>> On 06.08.20 03:37, Stefano Stabellini wrote:
>>
>> Hi Stefano
>>
>> Trying to simulate IO_RETRY handling mechanism (according to model below) I
>> continuously get IO_RETRY from try_fwd_ioserv() ...
>>
>>> OK, thanks for the details. My interpretation seems to be correct.
>>>
>>> In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
>>> return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
>>> also needs to handle try_handle_mmio returning IO_RETRY the first
>>> around, and IO_HANDLED when after QEMU does its job.
>>>
>>> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
>>> early and let the scheduler do its job? Something like:
>>>
>>>               enum io_state state = try_handle_mmio(regs, hsr, gpa);
>>>
>>>               switch ( state )
>>>               {
>>>               case IO_ABORT:
>>>                   goto inject_abt;
>>>               case IO_HANDLED:
>>>                   advance_pc(regs, hsr);
>>>                   return;
>>>               case IO_RETRY:
>>>                   /* finish later */
>>>                   return;
>>>               case IO_UNHANDLED:
>>>                   /* IO unhandled, try another way to handle it. */
>>>                   break;
>>>               default:
>>>                   ASSERT_UNREACHABLE();
>>>               }
>>>
>>> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
>>> handle_hvm_io_completion() after QEMU completes the emulation. Today,
>>> handle_mmio just sets the user register with the read value.
>>>
>>> But it would be better if it called again the original function
>>> do_trap_stage2_abort_guest to actually retry the original operation.
>>> This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
>>> IO_HANDLED instead of IO_RETRY,
>> I may miss some important point, but I failed to see why try_handle_mmio
>> (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this stage.
>> Or current try_fwd_ioserv() logic needs rework?
> I think you should check the ioreq->state in try_fwd_ioserv(), if the
> result is ready, then ioreq->state should be STATE_IORESP_READY, and you
> can return IO_HANDLED.

Indeed! Just coming to this opinion I saw your answer)

This is a dirty test patch:


---
  xen/arch/arm/io.c               | 12 ++++++++++++
  xen/arch/arm/ioreq.c            | 12 ++++++++++++
  xen/arch/arm/traps.c            |  6 ++++--
  xen/include/asm-arm/hvm/ioreq.h |  2 ++
  xen/include/asm-arm/traps.h     |  3 +++
  5 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 436f669..65a08f8 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -130,6 +130,10 @@ static enum io_state try_fwd_ioserv(struct 
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
@@ -156,9 +160,11 @@ static enum io_state try_fwd_ioserv(struct 
cpu_user_regs *regs,
      else
          vio->io_completion = HVMIO_mmio_completion;

+#if 0
      /* XXX: Decide what to do */
      if ( rc == IO_RETRY )
          rc = IO_HANDLED;
+#endif

      return rc;
  }
@@ -185,6 +191,12 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
*regs,

  #ifdef CONFIG_IOREQ_SERVER
          rc = try_fwd_ioserv(regs, v, &info);
+        if ( rc == IO_HANDLED )
+        {
+            printk("HANDLED %s[%d]\n", __func__, __LINE__);
+            handle_mmio_finish();
+        } else
+            printk("RETRY %s[%d]\n", __func__, __LINE__);
  #endif

          return rc;
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 8f60c41..c8ed454 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -33,8 +33,20 @@
  #include <public/hvm/dm_op.h>
  #include <public/hvm/ioreq.h>

+#include <asm/traps.h>
+
  bool handle_mmio(void)
  {
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    const union hsr hsr = { .bits = regs->hsr };
+
+    do_trap_stage2_abort_guest(regs, hsr);
+
+    return true;
+}
+
+bool handle_mmio_finish(void)
+{
      struct vcpu *v = current;
      struct cpu_user_regs *regs = guest_cpu_user_regs();
      const union hsr hsr = { .bits = regs->hsr };
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ea472d1..3493d77 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1882,7 +1882,7 @@ static bool try_map_mmio(gfn_t gfn)
      return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);
  }

-static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
+void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
                                         const union hsr hsr)
  {
      /*
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
diff --git a/xen/include/asm-arm/hvm/ioreq.h 
b/xen/include/asm-arm/hvm/ioreq.h
index 392ce64..fb4684d 100644
--- a/xen/include/asm-arm/hvm/ioreq.h
+++ b/xen/include/asm-arm/hvm/ioreq.h
@@ -27,6 +27,8 @@

  bool handle_mmio(void);

+bool handle_mmio_finish(void);
+
  static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
  {
      /* XXX */
diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
index 997c378..392fdb1 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -40,6 +40,9 @@ void advance_pc(struct cpu_user_regs *regs, const 
union hsr hsr);

  void inject_undef_exception(struct cpu_user_regs *regs, const union 
hsr hsr);

+void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
+                                        const union hsr hsr);
+
  /* read as zero and write ignore */
  void handle_raz_wi(struct cpu_user_regs *regs, int regidx, bool read,
                     const union hsr hsr, int min_el);
-- 
2.7.4


>
> That is assuming that you are looking at the live version of the ioreq
> shared with QEMU instead of a private copy of it, which I am not sure.
> Looking at try_fwd_ioserv() it would seem that vio->io_req is just a
> copy? The live version is returned by get_ioreq() ?
>
> Even in handle_hvm_io_completion, instead of setting vio->io_req.state
> to STATE_IORESP_READY by hand, it would be better to look at the live
> version of the ioreq because QEMU will have already set ioreq->state
> to STATE_IORESP_READY (hw/i386/xen/xen-hvm.c:cpu_handle_ioreq).

I need to recheck that.


Thank you.


-- 
Regards,

Oleksandr Tyshchenko


