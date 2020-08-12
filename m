Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF881242BEA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 17:08:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5sMZ-0002kT-QJ; Wed, 12 Aug 2020 15:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDeE=BW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5sMY-0002kO-1X
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 15:08:22 +0000
X-Inumbo-ID: 9e1433b1-4733-4ecc-8b7e-93f1f3d48fd0
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e1433b1-4733-4ecc-8b7e-93f1f3d48fd0;
 Wed, 12 Aug 2020 15:08:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t6so2603985ljk.9
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GlvQrid08ws3fjHpRkglh1cxXrKyY3yYdhr/LqGMSBQ=;
 b=YuTbHDwUjzLbQFF1DuiyPbmBYZz5mIG5s4iSzTR/KyBd8XcSzorx2SfVgD175ZkCc0
 AZiKRJEZ54hytBhU4zsl1tAqWX66zTHG8wUZ/4J2ec9YADzja+s9L9rDgBhL2Z+vEifj
 DLGiIZNhKSsXdaHfYfxsM0WivjwO0aBEM+J1+9t5I1oluVLis5FOiuVPWiNgNMfHq2Kq
 YfS4lsP3qAfTw7oLhL/YL5Vh6sYmp27Gmgh2DtiCPF5hK2BNlxfVK7HfJ/xJM6hdmd+Y
 9nC5oCrHRHnTf3kwj817OFNiiVY/Mbvk3bj1SCYv+IZuSlhgPfgzlWl2dBZredXcXQlw
 y8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GlvQrid08ws3fjHpRkglh1cxXrKyY3yYdhr/LqGMSBQ=;
 b=FCODVQ2r+UWkUgoUUcZWtALRoGvgd2ALieR+OquDljHEnXdjHpQEHBrfIRNItbY8gc
 I73/yqb1+VmwgpvfUFvAyLpKV6HpZQ1UJzFX6wD95mnEXkDH/p6534gBU0XubxbF6mfA
 cGv7P5B/IVUigDjVRWTmIWi8UKx11QKUAKYYb3myyoAbJhAtmH/2CsMzTaC5OhTddsv2
 ws2KRsnt6vEtEKo+apQK62LcJ6gZE/MczwnxD+xdP6oqEabYBm3l/0RA8dLpOzSrruOw
 4vEKrLkDP4tqW/a1RXQxfoj1bZ/uR4sgf86uRLtLUZGzv00YkL2PMQ1qIGzwwho/QX2G
 gkJw==
X-Gm-Message-State: AOAM533vsh/XFHa/b3Q6VqUQy5D7xMarK0Erq23af+2sCDrNzazQZ5Zx
 uFH2Gp6TkhYytknmdAjukbY=
X-Google-Smtp-Source: ABdhPJyz0YBlDIPlVEfzvAvhXuurZG7BZlQn9vEpIwj6qy2xRgbp9n4/gvUFQwHDvj4AKoyqslYVqw==
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr5797679ljb.283.1597244899285; 
 Wed, 12 Aug 2020 08:08:19 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u6sm493319ljg.105.2020.08.12.08.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 08:08:17 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Julien Grall <julien.grall@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
 <659a5b45-a37a-5cf2-0bcd-ba1ea3d47cc4@xen.org>
 <48a130dc-57fd-0627-d188-ddff4abf6778@gmail.com>
 <CAJ=z9a3x7LgztG2KQKza8n3Y7xJsoO+DSmyi8Pxm1BgQOBs=xQ@mail.gmail.com>
 <5cf9c14c-3bac-ccbd-6586-1a540dbe9b8d@gmail.com>
Message-ID: <23ca366d-0f5a-fe47-874d-8cd4629ef308@gmail.com>
Date: Wed, 12 Aug 2020 18:08:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5cf9c14c-3bac-ccbd-6586-1a540dbe9b8d@gmail.com>
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


Hi Julien


>>>>>>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>>>>>>     */
>>>>>>>>    void leave_hypervisor_to_guest(void)
>>>>>>>>    {
>>>>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>>>>> +    /*
>>>>>>>> +     * XXX: Check the return. Shall we call that in
>>>>>>>> +     * continue_running and context_switch instead?
>>>>>>>> +     * The benefits would be to avoid calling
>>>>>>>> +     * handle_hvm_io_completion on every return.
>>>>>>>> +     */
>>>>>>> Yeah, that could be a simple and good optimization
>>>>>> Well, it is not simple as it is sounds :).
>>>>>> handle_hvm_io_completion() is the function in charge to mark the
>>>>>> vCPU as waiting for I/O. So we would at least need to split the
>>>>>> function.
>>>>>>
>>>>>> I wrote this TODO because I wasn't sure about the complexity of
>>>>>> handle_hvm_io_completion(current). Looking at it again, the main
>>>>>> complexity is the looping over the IOREQ servers.
>>>>>>
>>>>>> I think it would be better to optimize handle_hvm_io_completion()
>>>>>> rather than trying to hack the context_switch() or 
>>>>>> continue_running().
>>>>> Well, is the idea in proposed dirty test patch below close to what
>>>>> you expect? Patch optimizes handle_hvm_io_completion() to avoid extra
>>>>> actions if vcpu's domain doesn't have ioreq_server, alternatively
>>>>> the check could be moved out of handle_hvm_io_completion() to avoid
>>>>> calling that function at all.
>>>> This looks ok to me.
>>>>
>>>>> BTW, TODO also suggests checking the return value of
>>>>> handle_hvm_io_completion(), but I am completely sure we can simply
>>>>> just return from leave_hypervisor_to_guest() at this point. Could you
>>>>> please share your opinion?
>>>>  From my understanding, handle_hvm_io_completion() may return false if
>>>> there is pending I/O or a failure.
>>> It seems, yes
>>>
>>>
>>>> In the former case, I think we want to call handle_hvm_io_completion()
>>>> later on. Possibly after we call do_softirq().
>>>>
>>>> I am wondering whether check_for_vcpu_work() could return whether
>>>> there are more work todo on the behalf of the vCPU.
>>>>
>>>> So we could have:
>>>>
>>>> do
>>>> {
>>>>    check_for_pcpu_work();
>>>> } while (check_for_vcpu_work())
>>>>
>>>> The implementation of check_for_vcpu_work() would be:
>>>>
>>>> if ( !handle_hvm_io_completion() )
>>>>    return true;
>>>>
>>>> /* Rest of the existing code */
>>>>
>>>> return false;
>>> Thank you, will give it a try.
>>>
>>> Can we behave the same way for both "pending I/O" and "failure" or we
>>> need to distinguish them?
>> We don't need to distinguish them. In both cases, we will want to
>> process softirqs. In all the failure cases, the domain will have
>> crashed. Therefore the vCPU will be unscheduled.
>
> Got it.
>
>
>>> Probably we need some sort of safe timeout/number attempts in order to
>>> not spin forever?
>> Well, anything based on timeout/number of attempts is flaky. How do
>> you know whether the I/O is just taking a "long time" to complete?
>>
>> But a vCPU shouldn't continue until an I/O has completed. This is
>> nothing very different than what a processor would do.
>>
>> In Xen case, if an I/O never completes then it most likely means that
>> something went horribly wrong with the Device Emulator. So it is most
>> likely not safe to continue. In HW, when there is a device failure,
>> the OS may receive an SError (this is implementation defined) and
>> could act accordingly if it is able to recognize the issue.
>>
>> It *might* be possible to send a virtual SError but there are a couple
>> of issues with it:
>>       * How do you detect a failure?
>>       * SErrors are implementations defined. You would need to teach
>> your OS (or the firmware) how to deal with them.
>>
>> I would expect quite a bit of effort in order to design and implement
>> it. For now, it is probably best to just let the vCPU spin forever.
>>
>> This wouldn't be an issue for Xen as do_softirq() would be called at
>> every loop.
>
>  Thank you for clarification. Fair enough and sounds reasonable.
I added logic to properly handle the return value of 
handle_hvm_io_completion() as you had suggested. For test purpose I 
simulated handle_hvm_io_completion() to return false sometimes
(I couldn't detect real "pending I/O" failure during testing) to see how 
new logic behaved. I assume I can take this solution for non-RFC series (?)


---
  xen/arch/arm/traps.c         | 36 ++++++++++++++++++++++--------------
  xen/common/hvm/ioreq.c       |  9 ++++++++-
  xen/include/asm-arm/domain.h |  1 +
  xen/include/xen/hvm/ioreq.h  |  5 +++++
  4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 974c744..f74b514 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2264,12 +2264,26 @@ static void check_for_pcpu_work(void)
   * Process pending work for the vCPU. Any call should be fast or
   * implement preemption.
   */
-static void check_for_vcpu_work(void)
+static bool check_for_vcpu_work(void)
  {
      struct vcpu *v = current;

+#ifdef CONFIG_IOREQ_SERVER
+    if ( hvm_domain_has_ioreq_server(v->domain) )
+    {
+        bool handled;
+
+        local_irq_enable();
+        handled = handle_hvm_io_completion(v);
+        local_irq_disable();
+
+        if ( !handled )
+            return true;
+    }
+#endif
+
      if ( likely(!v->arch.need_flush_to_ram) )
-        return;
+        return false;

      /*
       * Give a chance for the pCPU to process work before handling the vCPU
@@ -2280,6 +2294,8 @@ static void check_for_vcpu_work(void)
      local_irq_enable();
      p2m_flush_vm(v);
      local_irq_disable();
+
+    return false;
  }

  /*
@@ -2290,20 +2306,12 @@ static void check_for_vcpu_work(void)
   */
  void leave_hypervisor_to_guest(void)
  {
-#ifdef CONFIG_IOREQ_SERVER
-    /*
-     * XXX: Check the return. Shall we call that in
-     * continue_running and context_switch instead?
-     * The benefits would be to avoid calling
-     * handle_hvm_io_completion on every return.
-     */
-    local_irq_enable();
-    handle_hvm_io_completion(current);
-#endif
      local_irq_disable();

-    check_for_vcpu_work();
-    check_for_pcpu_work();
+    do
+    {
+        check_for_pcpu_work();
+    } while ( check_for_vcpu_work() );

      vgic_sync_to_lrs();

diff --git a/xen/common/hvm/ioreq.c b/xen/common/hvm/ioreq.c
index 7e1fa23..81b41ab 100644
--- a/xen/common/hvm/ioreq.c
+++ b/xen/common/hvm/ioreq.c
@@ -38,9 +38,15 @@ static void set_ioreq_server(struct domain *d, 
unsigned int id,
                               struct hvm_ioreq_server *s)
  {
      ASSERT(id < MAX_NR_IOREQ_SERVERS);
-    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
+    ASSERT((!s && d->arch.hvm.ioreq_server.server[id]) ||
+           (s && !d->arch.hvm.ioreq_server.server[id]));

      d->arch.hvm.ioreq_server.server[id] = s;
+
+    if ( s )
+        d->arch.hvm.ioreq_server.nr_servers ++;
+    else
+        d->arch.hvm.ioreq_server.nr_servers --;
  }

  /*
@@ -1415,6 +1421,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool 
buffered)
  void hvm_ioreq_init(struct domain *d)
  {
      spin_lock_init(&d->arch.hvm.ioreq_server.lock);
+    d->arch.hvm.ioreq_server.nr_servers = 0;

      arch_hvm_ioreq_init(d);
  }
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 6a01d69..484bd1a 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -68,6 +68,7 @@ struct hvm_domain
      struct {
          spinlock_t              lock;
          struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
+        unsigned int            nr_servers;
      } ioreq_server;

      bool_t qemu_mapcache_invalidate;
diff --git a/xen/include/xen/hvm/ioreq.h b/xen/include/xen/hvm/ioreq.h
index 40b7b5e..8f78852 100644
--- a/xen/include/xen/hvm/ioreq.h
+++ b/xen/include/xen/hvm/ioreq.h
@@ -23,6 +23,11 @@

  #include <asm/hvm/ioreq.h>

+static inline bool hvm_domain_has_ioreq_server(const struct domain *d)
+{
+    return (d->arch.hvm.ioreq_server.nr_servers > 0);
+}
+
  #define GET_IOREQ_SERVER(d, id) \
      (d)->arch.hvm.ioreq_server.server[id]

-- 
2.7.4


-- 
Regards,

Oleksandr Tyshchenko


