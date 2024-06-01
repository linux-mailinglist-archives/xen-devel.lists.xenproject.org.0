Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5563A8D6EB9
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 09:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734030.1140260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDJWK-0005HZ-Vz; Sat, 01 Jun 2024 07:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734030.1140260; Sat, 01 Jun 2024 07:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDJWK-0005ES-St; Sat, 01 Jun 2024 07:51:20 +0000
Received: by outflank-mailman (input) for mailman id 734030;
 Sat, 01 Jun 2024 07:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDJWJ-0005EK-4a
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 07:51:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9bceb8a-1feb-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 09:51:18 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1AB014EE0745;
 Sat,  1 Jun 2024 09:51:16 +0200 (CEST)
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
X-Inumbo-ID: b9bceb8a-1feb-11ef-90a1-e314d9c70b13
MIME-Version: 1.0
Date: Sat, 01 Jun 2024 09:51:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [PATCH v2 06/13] xen/bitops: Implement ffs() in common logic
In-Reply-To: <f7ea72c3-45ef-43cb-ab57-b375a4fbc683@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-7-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2405301809170.2557291@ubuntu-linux-20-04-desktop>
 <7b974b36b89c216379b86170af9de451@bugseng.com>
 <2917e122-51d8-4caf-ba70-52da70d1342a@citrix.com>
 <f7ea72c3-45ef-43cb-ab57-b375a4fbc683@citrix.com>
Message-ID: <59dc805e3401a47668a162f4f35adba7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: multipart/mixed;
 boundary="=_def483bbfa127804df0ab484746c7f42"

--=_def483bbfa127804df0ab484746c7f42
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

On 2024-05-31 10:48, Andrew Cooper wrote:
> On 31/05/2024 9:34 am, Andrew Cooper wrote:
>> On 31/05/2024 7:56 am, Nicola Vetrini wrote:
>>> On 2024-05-31 03:14, Stefano Stabellini wrote:
>>>> On Fri, 24 May 2024, Andrew Cooper wrote:
>>>>> Perform constant-folding unconditionally, rather than having it
>>>>> implemented
>>>>> inconsistency between architectures.
>>>>> 
>>>>> Confirm the expected behaviour with compile time and boot time 
>>>>> tests.
>>>>> 
>>>>> For non-constant inputs, use arch_ffs() if provided but fall back 
>>>>> to
>>>>> generic_ffsl() if not.  In particular, RISC-V doesn't have a 
>>>>> builtin
>>>>> that
>>>>> works in all configurations.
>>>>> 
>>>>> For x86, rename ffs() to arch_ffs() and adjust the prototype.
>>>>> 
>>>>> For PPC, __builtin_ctz() is 1/3 of the size of size of the 
>>>>> transform to
>>>>> generic_fls().  Drop the definition entirely.  ARM too benefits in
>>>>> the general
>>>>> case by using __builtin_ctz(), but less dramatically because it 
>>>>> using
>>>>> optimised asm().
>>>>> 
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> This patch made me realize that we should add __builtin_ctz,
>>>> __builtin_constant_p and always_inline to
>>>> docs/misra/C-language-toolchain.rst as they don't seem to be 
>>>> currently
>>>> documented and they are not part of the C standard
>>>> 
>>>> Patch welcome :-)
>>>> 
>>> I can send a patch for the builtins.
>> That's very kind of you.
>> 
>> In total by the end of this series, we've got __builtin_constant_p() 
>> (definitely used elsewhere already), and 
>> __builtin_{ffs,ctz,clz}{,l}() 
>> (3x primitives, 2x input types).
>> 
>> If we're going for a list of the primitive operations, lets add
>> __builtin_popcnt{,l}() too right away, because if it weren't for 4.19
>> code freeze, I'd have cleaned up the hweight() helpers too.
> 
> Oh, and it's worth noting that __builtin_{ctz,clz}{,l}() have explicit
> UB if given an input of 0.  (Sadly, even on architectures where the
> underlying instruction emitted is safe with a 0 input. [0])
> 
> This is why every patch in the series using them checks for nonzero 
> input.
> 
> UBSAN (with an adequate compiler) will instrument this, and Xen has
> __ubsan_handle_invalid_builtin() to diagnose these.
> 
> ~Andrew
> 
> [0] It turns out that Clang has a 2-argument form of the builtin with
> the second being the "value forwarded" in case the first is 0.  I've 
> not
> investigated whether GCC has the same.

Hmm, maybe then it's best if builtins are listed in a separate section 
in that file, for ease of browsing. Xen also uses (conditionally) 
__builtin_mem*, __builtin_str* and others, so if all nonstandard 
intrinsics should be listed (as opposed to the ones in some way relevant 
for MISRA violations, which was the original scope of the document), 
then a subset of the attached list would be needed. There are a handful 
only used in ppc, and since the document only covers x86 and arm, those 
should be ignored for the time being.

Anyway, I'll send an RFC next week to decide the best route.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)
--=_def483bbfa127804df0ab484746c7f42
Content-Transfer-Encoding: base64
Content-Type: text/plain;
 name=builtins.txt
Content-Disposition: attachment;
 filename=builtins.txt;
 size=724

MHwkIGdpdCBncmVwIC1FIC1vICJfX2J1aWx0aW5bYS16X10rIiAtLSB4ZW4gfCBjdXQgLWQnOicg
LWYyIHwgc29ydCAtdQpfX2J1aWx0aW5fYnN3YXAKX19idWlsdGluX2NsegpfX2J1aWx0aW5fY2x6
bGwKX19idWlsdGluX2NvbnN0YW50X3AKX19idWlsdGluX2N0egpfX2J1aWx0aW5fY3R6bGwKX19i
dWlsdGluX2V4cGVjdApfX2J1aWx0aW5fZnJhbWVfYWRkcmVzcwpfX2J1aWx0aW5faGFzX2F0dHJp
YnV0ZQpfX2J1aWx0aW5fbWVtY2hyCl9fYnVpbHRpbl9tZW1jbXAKX19idWlsdGluX21lbWNweQpf
X2J1aWx0aW5fbWVtbW92ZQpfX2J1aWx0aW5fbWVtc2V0Cl9fYnVpbHRpbl9vZmZzZXRvZgpfX2J1
aWx0aW5fcG9wY291bnQKX19idWlsdGluX3BvcGNvdW50bGwKX19idWlsdGluX3ByZWZldGNoCl9f
YnVpbHRpbl9yZXR1cm5fYWRkcmVzcwpfX2J1aWx0aW5fc3RyY2FzZWNtcApfX2J1aWx0aW5fc3Ry
Y2hyCl9fYnVpbHRpbl9zdHJjbXAKX19idWlsdGluX3N0cmxlbgpfX2J1aWx0aW5fc3RybmNhc2Vj
bXAKX19idWlsdGluX3N0cm5jbXAKX19idWlsdGluX3N0cnJjaHIKX19idWlsdGluX3N0cnN0cgpf
X2J1aWx0aW5fdHJhcApfX2J1aWx0aW5fdHlwZXNfY29tcGF0aWJsZV9wCl9fYnVpbHRpbl91bnJl
YWNoYWJsZQpfX2J1aWx0aW5fdmFfYXJnCl9fYnVpbHRpbl92YV9jb3B5Cl9fYnVpbHRpbl92YV9l
bmQKX19idWlsdGluX3ZhX2xpc3QKX19idWlsdGluX3ZhX3N0YXJ0Cg==
--=_def483bbfa127804df0ab484746c7f42--

