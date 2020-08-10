Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55238240CB3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 20:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5CFA-0002NM-Gg; Mon, 10 Aug 2020 18:09:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWL+=BU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5CF8-0002NH-FA
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 18:09:54 +0000
X-Inumbo-ID: 2a0efc40-f520-4bdf-bcce-154a7e2fb095
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a0efc40-f520-4bdf-bcce-154a7e2fb095;
 Mon, 10 Aug 2020 18:09:53 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w14so10632900ljj.4
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 11:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8H1B1lRjuf0v1kBYb6EpJ8pTqtiQ6R1hS951zjs9hCk=;
 b=gmK6vaIA3pZY1Q8lHh6bGKU/KgNBl7xQvDXQ8wqpeoTD9ocpzmWDBdMwqMtJ/T4x3J
 kHDCS4vEd9dBNUzOQykr4+/sVSuIMAeMzAvT7QPemI66BM3M5yfSbMv1miLH9OIrzUgW
 uV/QbeOgKMoL3cX7icfnpi+7VRh4elmIJImUs+QFLeqedG6+xlMABpLjFrvqtYeb2/Jk
 yw91iVzC3m9FY6K9DiFWF6CmKyxVeSlw0I0PIaxbtPAitn1JkgYswArHuhPgZuNcrq8b
 D+rKBSsc3cZSb+I3t4+NXmp4Qj3l3NXa9H3bLSRCD10ZFTeY1v4sDxZadfyhzWabXQZZ
 XOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8H1B1lRjuf0v1kBYb6EpJ8pTqtiQ6R1hS951zjs9hCk=;
 b=RGFdES+aQpY0ZEggObStr8/Nhs26bRmYCnqtPM1vubTffFeJOVEF9KlEbx5eYw/BsE
 8P/9/h4upZu89zzzM/jA3tKXCOCLPRedwixdx/Tj26eKQOSy5YF6M3U1x//rpOrWCqJq
 qs35YW9uNIsYNA3q/iW/Kkm+zuTjVrYQdPCiUdHgFPBMDtGbM2hK7f483qXA1gSecWg2
 MRh75QDESAaBzmtOH56/2JtZoHIfE0WlRu0u15RDO/EOANAjsTqktEuuB14iW4YWRHWm
 LFBUWxBlenyrzAgPjRwfxfQusyu9kdta2DdEU1vEyNm9dDD3pDK0d5ZONFa82jNh5knL
 HgGg==
X-Gm-Message-State: AOAM532nz/Ud+/Kmq39FYMe9Pmhxc/QEn1aOWtiWZh9f1PFTZoaUqt0s
 94bGYRJTwEJ6WqDnCE/LLCo=
X-Google-Smtp-Source: ABdhPJzrljsKVIpuOVqf3UFBejG14VMca4thwbwwDtlMyrkxcc83nrcJxfS8bEF7jzFaAaa3HCKwFw==
X-Received: by 2002:a2e:a28b:: with SMTP id k11mr1131799lja.405.1597082992178; 
 Mon, 10 Aug 2020 11:09:52 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm9404548ljk.7.2020.08.10.11.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 11:09:51 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
Date: Mon, 10 Aug 2020 21:09:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 12:32, Julien Grall wrote:

Hi Julien

>
>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>    */
>>>   void leave_hypervisor_to_guest(void)
>>>   {
>>> +#ifdef CONFIG_IOREQ_SERVER
>>> +    /*
>>> +     * XXX: Check the return. Shall we call that in
>>> +     * continue_running and context_switch instead?
>>> +     * The benefits would be to avoid calling
>>> +     * handle_hvm_io_completion on every return.
>>> +     */
>>
>> Yeah, that could be a simple and good optimization
>
> Well, it is not simple as it is sounds :). handle_hvm_io_completion() 
> is the function in charge to mark the vCPU as waiting for I/O. So we 
> would at least need to split the function.
>
> I wrote this TODO because I wasn't sure about the complexity of 
> handle_hvm_io_completion(current). Looking at it again, the main 
> complexity is the looping over the IOREQ servers.
>
> I think it would be better to optimize handle_hvm_io_completion() 
> rather than trying to hack the context_switch() or continue_running().
Well, is the idea in proposed dirty test patch below close to what you 
expect? Patch optimizes handle_hvm_io_completion() to avoid extra 
actions if vcpu's domain doesn't have ioreq_server, alternatively
the check could be moved out of handle_hvm_io_completion() to avoid 
calling that function at all. BTW, TODO also suggests checking the 
return value of handle_hvm_io_completion(), but I am completely sure we 
can simply
just return from leave_hypervisor_to_guest() at this point. Could you 
please share your opinion?


---
  xen/common/hvm/ioreq.c       | 12 +++++++++++-
  xen/include/asm-arm/domain.h |  1 +
  xen/include/xen/hvm/ioreq.h  |  5 +++++
  3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/common/hvm/ioreq.c b/xen/common/hvm/ioreq.c
index 7e1fa23..dc6647a 100644
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
@@ -169,6 +175,9 @@ bool handle_hvm_io_completion(struct vcpu *v)
          return false;
      }

+    if ( !hvm_domain_has_ioreq_server(d) )
+        return true;
+
      FOR_EACH_IOREQ_SERVER(d, id, s)
      {
          struct hvm_ioreq_vcpu *sv;
@@ -1415,6 +1424,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool 
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


