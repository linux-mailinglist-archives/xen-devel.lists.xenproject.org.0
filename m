Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B5856600
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 15:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681830.1060800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1racmD-0002jr-Ov; Thu, 15 Feb 2024 14:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681830.1060800; Thu, 15 Feb 2024 14:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1racmD-0002i5-Lx; Thu, 15 Feb 2024 14:31:49 +0000
Received: by outflank-mailman (input) for mailman id 681830;
 Thu, 15 Feb 2024 14:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YE+Y=JY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1racmC-0002hx-Bn
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 14:31:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0ca4d78-cc0e-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 15:31:43 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 586DF4EE0737;
 Thu, 15 Feb 2024 15:31:43 +0100 (CET)
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
X-Inumbo-ID: f0ca4d78-cc0e-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Thu, 15 Feb 2024 15:31:43 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Andrew
 Cooper3 <andrew.cooper3@citrix.com>, Roger Pau <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
In-Reply-To: <9eb25d90-9f10-44e5-b9aa-32e3f898389a@xen.org>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
 <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
 <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
 <99faac70440a68824a17fcaaea55ef48@bugseng.com>
 <09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org>
 <c0b8f2ec-a3bb-45a6-b748-052d55a6fd5c@suse.com>
 <9eb25d90-9f10-44e5-b9aa-32e3f898389a@xen.org>
Message-ID: <2171bcc9eeea6613409e3ee1e9eedbc3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: multipart/mixed;
 boundary="=_21dddb0de5c10f3729bd45b19a2db9a4"

--=_21dddb0de5c10f3729bd45b19a2db9a4
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

Hi Julien,

On 2024-02-13 18:14, Julien Grall wrote:
> Hi Jan,
> 
> On 13/02/2024 07:13, Jan Beulich wrote:
>> On 12.02.2024 19:38, Julien Grall wrote:
>>> An alternative would be to introduced arch_grant_cache_flush() and 
>>> move
>>> the if/else logic there. Something like:
>>> 
>>> diff --git a/xen/arch/arm/include/asm/page.h
>>> b/xen/arch/arm/include/asm/page.h
>>> index 69f817d1e68a..4a3de49762a1 100644
>>> --- a/xen/arch/arm/include/asm/page.h
>>> +++ b/xen/arch/arm/include/asm/page.h
>>> @@ -281,6 +281,19 @@ static inline void write_pte(lpae_t *p, lpae_t 
>>> pte)
>>>        dsb(sy);
>>>    }
>>> 
>>> +static inline arch_grant_cache_flush(unsigned int op, const void *p,
>>> unsigned long size)
>>> +{
>>> +    unsigned int order = get_order_from_bytes(size);
>>> +
>>> +    if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op &
>>> GNTTAB_CACHE_CLEAN) )
>>> +        clean_and_invalidate_dcache_va_range(v, cflush->length);
>>> +    else if ( cflush->op & GNTTAB_CACHE_INVAL )
>>> +        invalidate_dcache_va_range(v, cflush->length);
>>> +    else if ( cflush->op & GNTTAB_CACHE_CLEAN )
>>> +        clean_dcache_va_range(v, cflush->length);
>>> +
>>> +    return 0;
>>> +}
>>> 
>>>    /* Flush the dcache for an entire page. */
>>>    void flush_page_to_ram(unsigned long mfn, bool sync_icache);
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 424744ad5e1a..647e1522466d 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -735,8 +735,7 @@ void asmlinkage __init start_xen(unsigned long
>>> boot_phys_offset,
>>>                  fdt_paddr);
>>> 
>>>        /* Register Xen's load address as a boot module. */
>>> -    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
>>> -                             virt_to_maddr(_start),
>>> +    xen_bootmodule = add_boot_module(BOOTMOD_XEN, 
>>> virt_to_maddr(_start),
>>>                                 (paddr_t)(uintptr_t)(_end - _start), 
>>> false);
>>>        BUG_ON(!xen_bootmodule);
>>> 
>>> diff --git a/xen/arch/x86/include/asm/flushtlb.h
>>> b/xen/arch/x86/include/asm/flushtlb.h
>>> index bb0ad58db49b..dfe51cddde90 100644
>>> --- a/xen/arch/x86/include/asm/flushtlb.h
>>> +++ b/xen/arch/x86/include/asm/flushtlb.h
>>> @@ -182,23 +182,22 @@ void flush_area_mask(const cpumask_t *mask, 
>>> const
>>> void *va,
>>>    }
>>> 
>>>    static inline void flush_page_to_ram(unsigned long mfn, bool
>>> sync_icache) {}
>>> -static inline int invalidate_dcache_va_range(const void *p,
>>> -                                             unsigned long size)
>>> -{ return -EOPNOTSUPP; }
>>> -static inline int clean_and_invalidate_dcache_va_range(const void 
>>> *p,
>>> -                                                       unsigned long 
>>> size)
>>> +
>>> +unsigned int guest_flush_tlb_flags(const struct domain *d);
>>> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t 
>>> *mask);
>>> +
>>> +static inline arch_grant_cache_flush(unsigned int op, const void *p,
>>> unsigned long size)
>>>    {
>>> -    unsigned int order = get_order_from_bytes(size);
>>> +    unsigned int order;
>>> +
>>> +    if ( !(cflush->op & GNTTAB_CACHE_CLEAN) )
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    order = get_order_from_bytes(size);
>>>        /* sub-page granularity support needs to be added if necessary 
>>> */
>>>        flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
>>> +
>>>        return 0;
>>>    }
>>> -static inline int clean_dcache_va_range(const void *p, unsigned long 
>>> size)
>>> -{
>>> -    return clean_and_invalidate_dcache_va_range(p, size);
>>> -}
>>> -
>>> -unsigned int guest_flush_tlb_flags(const struct domain *d);
>>> -void guest_flush_tlb_mask(const struct domain *d, const cpumask_t 
>>> *mask);
>>> 
>>>    #endif /* __FLUSHTLB_H__ */
>>> 
>>> I have a slight preference for the latter. I would like to hear the
>>> opinion of the others.
>> 
>> I would prefer this 2nd form, too, assuming the setup.c change wasn't
>> really meant to be there.
> 
> Indeed. I had another previous change I didn't and forgot to remove it.
> 
>> The one thing that doesn't become clear: In
>> the sketch above arch_grant_cache_flush() has no return type, yet has
>> "return 0". This raises a question towards the one that's at the root
>> of this thread: Do you mean the function to have a return value, and
>> if so will it be (sensibly) used?
> 
> Sorry I should have double checked the code before sending it. 
> arch_grant_cache_flush() should return a value. So each arch can decide 
> if they handle a given operation.
> 
> Cheers,

I do like the idea. I applied some of the suggestions to this proof of 
concept patch (attached). Still not compile-tested, since the CI seems a 
bit slow today.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)
--=_21dddb0de5c10f3729bd45b19a2db9a4
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=cache_helpers.patch
Content-Disposition: attachment;
 filename=cache_helpers.patch;
 size=5715

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wYWdlLmggYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vcGFnZS5oCmluZGV4IDY5ZjgxN2QxZTY4YS4uNWY5MzU3NjMyMTY0IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcGFnZS5oCisrKyBiL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9wYWdlLmgKQEAgLTE1OSwxMyArMTU5LDEzIEBAIHN0YXRpYyBpbmxp
bmUgc2l6ZV90IHJlYWRfZGNhY2hlX2xpbmVfYnl0ZXModm9pZCkKICAqIGlmICdyYW5nZScgaXMg
bGFyZ2UgZW5vdWdoIHdlIG1pZ2h0IHdhbnQgdG8gdXNlIG1vZGVsLXNwZWNpZmljCiAgKiBmdWxs
LWNhY2hlIGZsdXNoZXMuICovCiAKLXN0YXRpYyBpbmxpbmUgaW50IGludmFsaWRhdGVfZGNhY2hl
X3ZhX3JhbmdlKGNvbnN0IHZvaWQgKnAsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKK3N0YXRpYyBpbmxp
bmUgdm9pZCBpbnZhbGlkYXRlX2RjYWNoZV92YV9yYW5nZShjb25zdCB2b2lkICpwLCB1bnNpZ25l
ZCBsb25nIHNpemUpCiB7CiAgICAgc2l6ZV90IGNhY2hlbGluZV9tYXNrID0gZGNhY2hlX2xpbmVf
Ynl0ZXMgLSAxOwogICAgIHVuc2lnbmVkIGxvbmcgaWR4ID0gMDsKIAogICAgIGlmICggIXNpemUg
KQotICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgcmV0dXJuOwogCiAgICAgLyogUGFzc2luZyBh
IHJlZ2lvbiB0aGF0IHdyYXBzIGFyb3VuZCBpcyBpbGxlZ2FsICovCiAgICAgQVNTRVJUKCgodWlu
dHB0cl90KXAgKyBzaXplIC0gMSkgPj0gKHVpbnRwdHJfdClwKTsKQEAgLTE4OCwxNyArMTg4LDE1
IEBAIHN0YXRpYyBpbmxpbmUgaW50IGludmFsaWRhdGVfZGNhY2hlX3ZhX3JhbmdlKGNvbnN0IHZv
aWQgKnAsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKICAgICAgICAgYXNtIHZvbGF0aWxlIChfX2NsZWFu
X2FuZF9pbnZhbGlkYXRlX2RjYWNoZV9vbmUoMCkgOiA6ICJyIiAocCArIGlkeCkpOwogCiAgICAg
ZHNiKHN5KTsgICAgICAgICAgIC8qIFNvIHdlIGtub3cgdGhlIGZsdXNoZXMgaGFwcGVuIGJlZm9y
ZSBjb250aW51aW5nICovCi0KLSAgICByZXR1cm4gMDsKIH0KIAotc3RhdGljIGlubGluZSBpbnQg
Y2xlYW5fZGNhY2hlX3ZhX3JhbmdlKGNvbnN0IHZvaWQgKnAsIHVuc2lnbmVkIGxvbmcgc2l6ZSkK
K3N0YXRpYyBpbmxpbmUgdm9pZCBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UoY29uc3Qgdm9pZCAqcCwg
dW5zaWduZWQgbG9uZyBzaXplKQogewogICAgIHNpemVfdCBjYWNoZWxpbmVfbWFzayA9IGRjYWNo
ZV9saW5lX2J5dGVzIC0gMTsKICAgICB1bnNpZ25lZCBsb25nIGlkeCA9IDA7CiAKICAgICBpZiAo
ICFzaXplICkKLSAgICAgICAgcmV0dXJuIDA7CisgICAgICAgIHJldHVybjsKIAogICAgIC8qIFBh
c3NpbmcgYSByZWdpb24gdGhhdCB3cmFwcyBhcm91bmQgaXMgaWxsZWdhbCAqLwogICAgIEFTU0VS
VCgoKHVpbnRwdHJfdClwICsgc2l6ZSAtIDEpID49ICh1aW50cHRyX3QpcCk7CkBAIC0yMTEsMTgg
KzIwOSwxNiBAQCBzdGF0aWMgaW5saW5lIGludCBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UoY29uc3Qg
dm9pZCAqcCwgdW5zaWduZWQgbG9uZyBzaXplKQogICAgICAgICAgICAgaWR4ICs9IGRjYWNoZV9s
aW5lX2J5dGVzLCBzaXplIC09IGRjYWNoZV9saW5lX2J5dGVzICkKICAgICAgICAgYXNtIHZvbGF0
aWxlIChfX2NsZWFuX2RjYWNoZV9vbmUoMCkgOiA6ICJyIiAocCArIGlkeCkpOwogICAgIGRzYihz
eSk7ICAgICAgICAgICAvKiBTbyB3ZSBrbm93IHRoZSBmbHVzaGVzIGhhcHBlbiBiZWZvcmUgY29u
dGludWluZyAqLwotICAgIC8qIEFSTSBjYWxsZXJzIGFzc3VtZSB0aGF0IGRjYWNoZV8qIGZ1bmN0
aW9ucyBjYW5ub3QgZmFpbC4gKi8KLSAgICByZXR1cm4gMDsKIH0KIAotc3RhdGljIGlubGluZSBp
bnQgY2xlYW5fYW5kX2ludmFsaWRhdGVfZGNhY2hlX3ZhX3JhbmdlCitzdGF0aWMgaW5saW5lIHZv
aWQgY2xlYW5fYW5kX2ludmFsaWRhdGVfZGNhY2hlX3ZhX3JhbmdlCiAgICAgKGNvbnN0IHZvaWQg
KnAsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKIHsKICAgICBzaXplX3QgY2FjaGVsaW5lX21hc2sgPSBk
Y2FjaGVfbGluZV9ieXRlcyAtIDE7CiAgICAgdW5zaWduZWQgbG9uZyBpZHggPSAwOwogCiAgICAg
aWYgKCAhc2l6ZSApCi0gICAgICAgIHJldHVybiAwOworICAgICAgICByZXR1cm47CiAKICAgICAv
KiBQYXNzaW5nIGEgcmVnaW9uIHRoYXQgd3JhcHMgYXJvdW5kIGlzIGlsbGVnYWwgKi8KICAgICBB
U1NFUlQoKCh1aW50cHRyX3QpcCArIHNpemUgLSAxKSA+PSAodWludHB0cl90KXApOwpAQCAtMjM1
LDggKzIzMSw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IGNsZWFuX2FuZF9pbnZhbGlkYXRlX2RjYWNo
ZV92YV9yYW5nZQogICAgICAgICAgICAgaWR4ICs9IGRjYWNoZV9saW5lX2J5dGVzLCBzaXplIC09
IGRjYWNoZV9saW5lX2J5dGVzICkKICAgICAgICAgYXNtIHZvbGF0aWxlIChfX2NsZWFuX2FuZF9p
bnZhbGlkYXRlX2RjYWNoZV9vbmUoMCkgOiA6ICJyIiAocCArIGlkeCkpOwogICAgIGRzYihzeSk7
ICAgICAgICAgLyogU28gd2Uga25vdyB0aGUgZmx1c2hlcyBoYXBwZW4gYmVmb3JlIGNvbnRpbnVp
bmcgKi8KLSAgICAvKiBBUk0gY2FsbGVycyBhc3N1bWUgdGhhdCBkY2FjaGVfKiBmdW5jdGlvbnMg
Y2Fubm90IGZhaWwuICovCi0gICAgcmV0dXJuIDA7CiB9CiAKIC8qIE1hY3JvcyBmb3IgZmx1c2hp
bmcgYSBzaW5nbGUgc21hbGwgaXRlbS4gIFRoZSBwcmVkaWNhdGUgaXMgYWx3YXlzCkBAIC0yNjYs
NiArMjYwLDIwIEBAIHN0YXRpYyBpbmxpbmUgaW50IGNsZWFuX2FuZF9pbnZhbGlkYXRlX2RjYWNo
ZV92YV9yYW5nZQogICAgICAgICAgICAgOiA6ICJyIiAoX3ApLCAibSIgKCpfcCkpOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogfSB3aGlsZSAoMCkKIAorc3RhdGljIGlubGlu
ZSBpbnQgYXJjaF9ncmFudF9jYWNoZV9mbHVzaCh1bnNpZ25lZCBpbnQgb3AsIGNvbnN0IHZvaWQg
KnAsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgc2l6ZSkKK3sKKyAgICBpZiAoIChvcCAmIEdOVFRBQl9DQUNIRV9JTlZBTCkgJiYgKG9wICYg
R05UVEFCX0NBQ0hFX0NMRUFOKSApCisgICAgICAgIGNsZWFuX2FuZF9pbnZhbGlkYXRlX2RjYWNo
ZV92YV9yYW5nZSh2LCBzaXplKTsKKyAgICBlbHNlIGlmICggb3AgJiBHTlRUQUJfQ0FDSEVfSU5W
QUwgKQorICAgICAgICBpbnZhbGlkYXRlX2RjYWNoZV92YV9yYW5nZSh2LCBzaXplKTsKKyAgICBl
bHNlIGlmICggb3AgJiBHTlRUQUJfQ0FDSEVfQ0xFQU4gKQorICAgICAgICBjbGVhbl9kY2FjaGVf
dmFfcmFuZ2Uodiwgc2l6ZSk7CisKKyAgICAvKiBBUk0gY2FsbGVycyBhc3N1bWUgdGhhdCBkY2Fj
aGVfKiBmdW5jdGlvbnMgY2Fubm90IGZhaWwuICovCisgICAgcmV0dXJuIDA7Cit9CisKIC8qCiAg
KiBXcml0ZSBhIHBhZ2V0YWJsZSBlbnRyeS4KICAqCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aW5jbHVkZS9hc20vZmx1c2h0bGIuaCBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9mbHVzaHRs
Yi5oCmluZGV4IGJiMGFkNThkYjQ5Yi4uN2M3MWZlMzc3NzU3IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvaW5jbHVkZS9hc20vZmx1c2h0bGIuaAorKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9h
c20vZmx1c2h0bGIuaApAQCAtMTgyLDIxICsxODIsMjEgQEAgdm9pZCBmbHVzaF9hcmVhX21hc2so
Y29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSwKIH0KIAogc3RhdGljIGlubGlu
ZSB2b2lkIGZsdXNoX3BhZ2VfdG9fcmFtKHVuc2lnbmVkIGxvbmcgbWZuLCBib29sIHN5bmNfaWNh
Y2hlKSB7fQotc3RhdGljIGlubGluZSBpbnQgaW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFuZ2UoY29u
c3Qgdm9pZCAqcCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgc2l6ZSkKLXsgcmV0dXJuIC1FT1BOT1RTVVBQOyB9Ci1zdGF0aWMgaW5s
aW5lIGludCBjbGVhbl9hbmRfaW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFuZ2UoY29uc3Qgdm9pZCAq
cCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIHNpemUpCisKK3N0YXRpYyBpbmxpbmUgYXJjaF9ncmFudF9jYWNoZV9m
bHVzaCh1bnNpZ25lZCBpbnQgb3AsIGNvbnN0IHZvaWQgKnAsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzaXplKQogewotICAgIHVuc2lnbmVkIGlu
dCBvcmRlciA9IGdldF9vcmRlcl9mcm9tX2J5dGVzKHNpemUpOworICAgIHVuc2lnbmVkIGludCBv
cmRlcjsKKworICAgIGlmICggIShjZmx1c2gtPm9wICYgR05UVEFCX0NBQ0hFX0NMRUFOKSApCisg
ICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKKworICAgIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21f
Ynl0ZXMoc2l6ZSk7CiAgICAgLyogc3ViLXBhZ2UgZ3JhbnVsYXJpdHkgc3VwcG9ydCBuZWVkcyB0
byBiZSBhZGRlZCBpZiBuZWNlc3NhcnkgKi8KICAgICBmbHVzaF9hcmVhX2xvY2FsKHAsIEZMVVNI
X0NBQ0hFfEZMVVNIX09SREVSKG9yZGVyKSk7CisKICAgICByZXR1cm4gMDsKIH0KLXN0YXRpYyBp
bmxpbmUgaW50IGNsZWFuX2RjYWNoZV92YV9yYW5nZShjb25zdCB2b2lkICpwLCB1bnNpZ25lZCBs
b25nIHNpemUpCi17Ci0gICAgcmV0dXJuIGNsZWFuX2FuZF9pbnZhbGlkYXRlX2RjYWNoZV92YV9y
YW5nZShwLCBzaXplKTsKLX0KIAogdW5zaWduZWQgaW50IGd1ZXN0X2ZsdXNoX3RsYl9mbGFncyhj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKTsKIHZvaWQgZ3Vlc3RfZmx1c2hfdGxiX21hc2soY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgY29uc3QgY3B1bWFza190ICptYXNrKTsKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwppbmRleCA1
NzIxZWFiMjI1NjEuLjg2MTVlYTE0NGJiMyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90
YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMzU3MiwxNCArMzU3Miw3
IEBAIHN0YXRpYyBpbnQgX2NhY2hlX2ZsdXNoKGNvbnN0IGdudHRhYl9jYWNoZV9mbHVzaF90ICpj
Zmx1c2gsIGdyYW50X3JlZl90ICpjdXJfcmVmCiAgICAgdiA9IG1hcF9kb21haW5fcGFnZShtZm4p
OwogICAgIHYgKz0gY2ZsdXNoLT5vZmZzZXQ7CiAKLSAgICBpZiAoIChjZmx1c2gtPm9wICYgR05U
VEFCX0NBQ0hFX0lOVkFMKSAmJiAoY2ZsdXNoLT5vcCAmIEdOVFRBQl9DQUNIRV9DTEVBTikgKQot
ICAgICAgICByZXQgPSBjbGVhbl9hbmRfaW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFuZ2UodiwgY2Zs
dXNoLT5sZW5ndGgpOwotICAgIGVsc2UgaWYgKCBjZmx1c2gtPm9wICYgR05UVEFCX0NBQ0hFX0lO
VkFMICkKLSAgICAgICAgcmV0ID0gaW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFuZ2UodiwgY2ZsdXNo
LT5sZW5ndGgpOwotICAgIGVsc2UgaWYgKCBjZmx1c2gtPm9wICYgR05UVEFCX0NBQ0hFX0NMRUFO
ICkKLSAgICAgICAgcmV0ID0gY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKHYsIGNmbHVzaC0+bGVuZ3Ro
KTsKLSAgICBlbHNlCi0gICAgICAgIHJldCA9IDA7CisgICAgcmV0ID0gYXJjaF9ncmFudF9jYWNo
ZV9mbHVzaChjZmx1c2gtPm9wLCB2LCBjZmx1c2gtPmxlbmd0aCk7CiAKICAgICBpZiAoIGQgIT0g
b3duZXIgKQogICAgIHsK
--=_21dddb0de5c10f3729bd45b19a2db9a4--

