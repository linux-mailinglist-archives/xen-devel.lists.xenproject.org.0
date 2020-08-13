Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BFE243EFC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 20:43:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6IB1-0003nj-L4; Thu, 13 Aug 2020 18:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rQHj=BX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k6IB0-0003nc-GY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 18:42:10 +0000
X-Inumbo-ID: 01cf0996-2ed8-4cd9-b975-26fe48ff484c
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01cf0996-2ed8-4cd9-b975-26fe48ff484c;
 Thu, 13 Aug 2020 18:42:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z14so7326195ljm.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2v9Ao0EvJQjrNds1FkEt8fHaH/LK7/3ON01JhPNYCjs=;
 b=EK22+fe3c3ZHkpC0AgiRR2frOp8mJ3cUQhD5FTEUD03wzbtonu72pr2WFO2KfDl6kt
 huZSCR6LnaWhK1rFUmmkyirdYGqKgVN2c9djgN/Oz8gh32ef06WBEHXQA2mpJjKqX8DZ
 IbIyeQmEEeZ/+TlVQ9X0QPWHQv7t7CMOHJ/OTXI31TBjbupf8NP6En3l59mhgZvnKjmI
 94pwBGRPCRCAfRBnB7XFH8EOuWGmXGnWepV4puluqtI+prERHEd7yvoTAbWLuVoGAkxq
 qWAczJbfDEsz238ZqsodbIKUTJz2drMbDwpFnfpDSVQZEMuCH4bWKwHY4YuEVIBAsXa9
 IQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2v9Ao0EvJQjrNds1FkEt8fHaH/LK7/3ON01JhPNYCjs=;
 b=owrPPBzn6bcdh7w7nCdlNK1r1EasHmhkAmtvYGhblU7IFRZutWtBmJa2rQWq53ia7d
 8a7yBL4oNCghqG3WNEeWjnZQtkaDpXr89KPN6Hp6wb2qvAD5ygGwls0HJ1W01SiIQhPk
 LN9L2BDhpUvx25Tmc063O6R1Uy8p529J1cgsX6SiGBzODGrC3J1kFqDCBHZ4TnjIUuSy
 6EfHFIXD0IDz2YSf2oXbR9ET0lF+hP3OTjmMFAac7IdYSdFENw8RUnMXdo5Vnq3Odz5J
 0XmtMdE/whqvtsX5MvRFyztigLSjJXNOkQv+bhnmh984bXKnQRftkYh+RAbtaHPPiEIq
 Bbwg==
X-Gm-Message-State: AOAM533uRszpOm4KNXN9pqEDXW8hQrKYYIjAV04EBlKBy68sA+qLM7R1
 Qna5q9VIC0aRSw52sR14Epw=
X-Google-Smtp-Source: ABdhPJws4HzKofGty4TzcM5z4cdy2pP7dfXEGFWjTYNcd04bkuL1DmgH/w9wKW+oDI7QTLAj/8lEAA==
X-Received: by 2002:a05:651c:1041:: with SMTP id
 x1mr2478645ljm.169.1597344126740; 
 Thu, 13 Aug 2020 11:42:06 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y19sm1342873lfe.77.2020.08.13.11.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 11:42:05 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
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
 <02f6a5cf-46c3-c216-ad52-707e3409f156@gmail.com>
 <88b80010-2c56-c038-800a-3abd44f46ca5@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b5497b00-2ee9-e6d8-ea4d-583a14b54522@gmail.com>
Date: Thu, 13 Aug 2020 21:41:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <88b80010-2c56-c038-800a-3abd44f46ca5@xen.org>
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


On 11.08.20 20:50, Julien Grall wrote:

Hi Julien

>
>
> On 11/08/2020 18:09, Oleksandr wrote:
>>
>> On 05.08.20 12:32, Julien Grall wrote:
>>
>> Hi Julien, Stefano
>>
>>>
>>>>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
>>>>> index 5fdb6e8..5823f11 100644
>>>>> --- a/xen/include/asm-arm/p2m.h
>>>>> +++ b/xen/include/asm-arm/p2m.h
>>>>> @@ -385,10 +385,11 @@ static inline int 
>>>>> set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
>>>>>                                           mfn_t mfn)
>>>>>   {
>>>>>       /*
>>>>> -     * NOTE: If this is implemented then proper reference 
>>>>> counting of
>>>>> -     *       foreign entries will need to be implemented.
>>>>> +     * XXX: handle properly reference. It looks like the page may 
>>>>> not always
>>>>> +     * belong to d.
>>>>
>>>> Just as a reference, and without taking away anything from the 
>>>> comment,
>>>> I think that QEMU is doing its own internal reference counting for 
>>>> these
>>>> mappings.
>>>
>>> I am not sure how this matters here? We can't really trust the DM to 
>>> do the right thing if it is not running in dom0.
>>>
>>> But, IIRC, the problem is some of the pages doesn't belong to do a 
>>> domain, so it is not possible to treat them as foreign mapping (e.g. 
>>> you wouldn't be able to grab a reference). This investigation was 
>>> done a couple of years ago, so this may have changed in recent Xen.
>>
>> Well, emulator is going to be used in driver domain, so this TODO 
>> must be resolved. I suspect that the check for a hardware domain in 
>> acquire_resource() which I skipped in a hackish way [1] could be 
>> simply removed once proper reference counting is implemented in Xen, 
>> correct?
>
> It depends how you are going to solve it. If you manage to solve it in 
> a generic way, then yes you could resolve. If not (i.e. it is solved 
> in an arch-specific way), we would need to keep the check on arch that 
> are not able to deal with it. See more below.
>
>>
>> Could you please provide some pointers on that problem? Maybe some 
>> questions need to be investigated again? Unfortunately, it is not 
>> completely clear to me the direction to follow...
>>
>> ***
>> I am wondering whether the similar problem exists on x86 as well?
>
> It is somewhat different. On Arm, we are able to handle properly 
> foreign mapping (i.e. mapping page from a another domain) as we would 
> grab a reference on the page (see XENMAPSPACE_gmfn_foreign handling in 
> xenmem_add_to_physmap()). The reference will then be released when the 
> entry is removed from the P2M (see p2m_free_entry()).
>
> If all the pages given to set_foreign_p2m_entry() belong to a domain, 
> then you could use the same approach.
>
> However, I remember to run into some issues in some of the cases. I 
> had a quick looked at the caller and I wasn't able to find any use 
> cases that may be an issue.
>
> The refcounting in the IOREQ code has changed after XSA-276 (this was 
> found while working on the Arm port). Probably the best way to figure 
> out if it works would be to try it and see if it fails.
>
> Note that set_foreign_p2m_entry() doesn't have a parameter for the 
> foreign domain. You would need to add a extra parameter for this.
>
>> The FIXME tag (before checking for a hardware domain in 
>> acquire_resource()) in the common code makes me think it is a common 
>> issue. From other side x86's
>> implementation of set_foreign_p2m_entry() is exists unlike Arm's one 
>> (which returned -EOPNOTSUPP so far). Or these are unrelated?
>
> At the moment, x86 doesn't support refcounting for foreign mapping. 
> Hence the reason to restrict them to the hardware domain.


Thank you for the pointers!


I checked that all pages given to set_foreign_p2m_entry() belonged to a 
domain (at least in my use-case). I noticed two calls for acquiring 
resource at the DomU creation time, the first call was for grant table 
(single gfn)
and the second for ioreq server which carried 2 gfns (for shared and 
buffered rings I assume). For the test purpose, I passed these gfns to 
get_page_from_gfn() in order to grab references on the pages, after that 
I tried to destroy DomU without calling put_page() for these pages. The 
fact that I couldn't destroy DomU completely (a zombie domain was 
observed) made me think that references were still taken, so worked as 
expected.


I implemented a test patch (which uses approach from 
xenmem_add_to_physmap_one() for XENMAPSPACE_gmfn_foreign case) to check 
whether it would work.


---
  xen/arch/arm/p2m.c        | 30 ++++++++++++++++++++++++++++++
  xen/common/memory.c       |  2 +-
  xen/include/asm-arm/p2m.h | 12 ++----------
  3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index e9ccba8..7359715 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1385,6 +1385,36 @@ int guest_physmap_remove_page(struct domain *d, 
gfn_t gfn, mfn_t mfn,
      return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
  }

+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    struct page_info *page;
+    p2m_type_t p2mt;
+    int rc;
+
+    /*
+     * Take reference to the foreign domain page. Reference will be 
released
+     * in p2m_put_l3_page().
+     */
+    page = get_page_from_gfn(fd, gfn, &p2mt, P2M_ALLOC);
+    if ( !page )
+        return -EINVAL;
+
+    if ( p2m_is_ram(p2mt) )
+        p2mt = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw : 
p2m_map_foreign_ro;
+    else
+    {
+        put_page(page);
+        return -EINVAL;
+    }
+
+    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2mt);
+    if ( rc )
+        put_page(page);
+
+    return 0;
+}
+
  static struct page_info *p2m_allocate_root(void)
  {
      struct page_info *page;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8d9f0a8..1de1d4f 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1171,7 +1171,7 @@ static int acquire_resource(

          for ( i = 0; !rc && i < xmar.nr_frames; i++ )
          {
-            rc = set_foreign_p2m_entry(currd, gfn_list[i],
+            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
                                         _mfn(mfn_list[i]));
              /* rc should be -EIO for any iteration other than the first */
              if ( rc && i )
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 5823f11..53ce373 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -381,16 +381,8 @@ static inline gfn_t gfn_next_boundary(gfn_t gfn, 
unsigned int order)
      return gfn_add(gfn, 1UL << order);
  }

-static inline int set_foreign_p2m_entry(struct domain *d, unsigned long 
gfn,
-                                        mfn_t mfn)
-{
-    /*
-     * XXX: handle properly reference. It looks like the page may not 
always
-     * belong to d.
-     */
-
-    return guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_ram_rw);
-}
+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
+                          unsigned long gfn,  mfn_t mfn);

  /*
   * A vCPU has cache enabled only when the MMU is enabled and data cache
-- 
2.7.4


And with that patch applied I was facing a BUG when destroying/rebooting 
DomU. The call of put_page_alloc_ref() in hvm_free_ioreq_mfn() triggered 
that BUG:


Rebooting domain 2
root@generic-armv8-xt-dom0:~# (XEN) Xen BUG at 
...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683
(XEN) ----[ Xen-4.14.0  arm64  debug=y   Not tainted ]----
(XEN) CPU:    3
(XEN) PC:     0000000000246f28 ioreq.c#hvm_free_ioreq_mfn+0x68/0x6c
(XEN) LR:     0000000000246ef0
(XEN) SP:     0000800725eafd80
(XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 0000000000000001  X1: 403fffffffffffff  X2: 000000000000001f
(XEN)      X3: 0000000080000000  X4: 0000000000000000  X5: 0000000000400000
(XEN)      X6: 0000800725eafe24  X7: 0000ffffd1ef3e08  X8: 0000000000000020
(XEN)      X9: 0000000000000000 X10: 00e800008ecebf53 X11: 0400000000000000
(XEN)     X12: ffff7e00013b3ac0 X13: 0000000000000002 X14: 0000000000000001
(XEN)     X15: 0000000000000001 X16: 0000000000000029 X17: 0000ffff9badb3d0
(XEN)     X18: 000000000000010f X19: 0000000810e60e38 X20: 0000800725e68ec0
(XEN)     X21: 0000000000000000 X22: 00008004dc0404a0 X23: 000000005a000ea1
(XEN)     X24: ffff8000460ec280 X25: 0000000000000124 X26: 000000000000001d
(XEN)     X27: ffff000008ad1000 X28: ffff800052e65100  FP: ffff0000223dbd20
(XEN)
(XEN)   VTCR_EL2: 80023558
(XEN)  VTTBR_EL2: 0002000765f04000
(XEN)
(XEN)  SCTLR_EL2: 30cd183d
(XEN)    HCR_EL2: 000000008078663f
(XEN)  TTBR0_EL2: 00000000781c5000
(XEN)
(XEN)    ESR_EL2: f2000001
(XEN)  HPFAR_EL2: 0000000000030010
(XEN)    FAR_EL2: ffff000008005f00
(XEN)
(XEN) Xen stack trace from sp=0000800725eafd80:
(XEN)    0000800725e68ec0 0000000000247078 00008004dc040000 00000000002477c8
(XEN)    ffffffffffffffea 0000000000000001 ffff8000460ec500 0000000000000002
(XEN)    000000000024645c 00000000002462dc 0000800725eafeb0 0000800725eafeb0
(XEN)    0000800725eaff30 0000000060000145 000000000027882c 0000800725eafeb0
(XEN)    0000800725eafeb0 01ff00000935de80 00008004dc040000 0000000000000006
(XEN)    ffff800000000000 0000000000000002 000000005a000ea1 000000019bc60002
(XEN)    0000ffffd1ef3e08 0000000000000020 0000000000000004 000000000027c7d8
(XEN)    000000005a000ea1 0000800725eafeb0 000000005a000ea1 0000000000279f98
(XEN)    0000000000000000 ffff8000460ec200 0000800725eaffb8 0000000000262c58
(XEN)    0000000000262c4c 07e0000160000249 0000000000000002 0000000000000001
(XEN)    ffff8000460ec500 ffff8000460ec508 ffff8000460ec208 ffff800052e65100
(XEN)    000000005060b478 0000ffffd20f3000 ffff7e00013c77e0 0000000000000000
(XEN)    00e800008ecebf53 0400000000000000 ffff7e00013b3ac0 0000000000000002
(XEN)    0000000000000001 0000000000000001 0000000000000029 0000ffff9badb3d0
(XEN)    000000000000010f ffff8000460ec210 ffff8000460ec200 ffff8000460ec210
(XEN)    0000000000000001 ffff8000460ec500 ffff8000460ec280 0000000000000124
(XEN)    000000000000001d ffff000008ad1000 ffff800052e65100 ffff0000223dbd20
(XEN)    ffff000008537004 ffffffffffffffff ffff0000080c17e4 5a000ea160000145
(XEN)    0000000060000000 0000000000000000 0000000000000000 ffff800052e65100
(XEN)    ffff0000223dbd20 0000ffff9badb3dc 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<0000000000246f28>] ioreq.c#hvm_free_ioreq_mfn+0x68/0x6c (PC)
(XEN)    [<0000000000246ef0>] ioreq.c#hvm_free_ioreq_mfn+0x30/0x6c (LR)
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 3:
(XEN) Xen BUG at ...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) PSCI cpu off failed for CPU0 err=-3
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...



Either I did something wrong (most likely) or there is an issue with 
page ref-counting in the IOREQ code. I am still trying to understand 
what is going on.
Some notes on that:
1. I checked that put_page() was called for these pages in 
p2m_put_l3_page() when destroying domain. This happened before 
hvm_free_ioreq_mfn() execution.
2. There was no BUG detected if I passed "p2m_ram_rw" instead of 
"p2m_map_foreign_rw" in guest_physmap_add_entry(), but the DomU couldn't 
be fully destroyed because of the reference taken.

-- 
Regards,

Oleksandr Tyshchenko


