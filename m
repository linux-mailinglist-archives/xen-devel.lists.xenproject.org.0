Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E56727D71
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 13:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545266.851607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7DPC-0008Pg-Qq; Thu, 08 Jun 2023 11:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545266.851607; Thu, 08 Jun 2023 11:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7DPC-0008Nb-Nn; Thu, 08 Jun 2023 11:02:14 +0000
Received: by outflank-mailman (input) for mailman id 545266;
 Thu, 08 Jun 2023 11:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCcU=B4=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q7DPB-0008NV-OP
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 11:02:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea81eadd-05eb-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 13:02:10 +0200 (CEST)
Received: from [160.78.167.217] (mozart.cs.unipr.it [160.78.167.217])
 by support.bugseng.com (Postfix) with ESMTPSA id 09BB74EE0738;
 Thu,  8 Jun 2023 13:02:09 +0200 (CEST)
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
X-Inumbo-ID: ea81eadd-05eb-11ee-8611-37d641c3527e
Message-ID: <ecf1fa52-5a78-8f56-6a9c-8f6b2d3119b2@bugseng.com>
Date: Thu, 8 Jun 2023 13:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: Re: [PATCH] docs/misra: new rules addition
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230607013810.3385316-1-sstabellini@kernel.org>
 <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com>
 <alpine.DEB.2.22.394.2306071430160.3567387@ubuntu-linux-20-04-desktop>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2306071430160.3567387@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi there.

Please see below.

On 07/06/23 23:53, Stefano Stabellini wrote:
> On Wed, 7 Jun 2023, Jan Beulich wrote:
>>> +   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>>> +     - Required
>>> +     - A typedef name shall be a unique identifier
>>> +     -
>>
>> Considering that the rule requires uniqueness across the entire code
>> base (and hence precludes e.g. two functions having identically named
>> local typedefs), I'm a little puzzled this was adopted. I for one
>> question that a use like the one mentioned is really at risk of being
>> confusing. Instead I think that the need to change at least one of
>> the names is at risk of making the code less readable then, even if
>> ever so slightly. (All of this said - I don't know if we have any
>> violations of this rule.)
> 
> I don't think we have many local typedefs and I think we have only few
> violations if I remember right. I'll let Roberto confirm how many. This
> rule was considered not a difficult rule (some difficult rules were
> found, namely 2.1, 5.5 and 7.4.)

There currently are 30 violations for ARM64:

- some involve a typedef module_name (in the call it was said this should
   be renamed module_name_t, which will solve the issue);
- most concern repeated typedefs (UINT64 and similar) which are repeated
   in xen/arch/arm/include/asm/arm64/efibind.h
   and xen/include/acpi/actypes.h
- ret_t and phys_addr_t are also redefined in a couple of places.

There are 90 violations for X86_64, for the same reasons, plus

- another set of typedefs for basic types (such as u8);
- repeated typedefs for things like guest_l1e_t in the same header file:

xen/arch/x86/include/asm/guest_pt.h:60.39-60.49:
for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
xen/arch/x86/include/asm/guest_pt.h:128.22-128.32:
for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused

The indicated lines read as follows:

typedef struct { guest_intpte_t l1; } guest_l1e_t;
typedef l1_pgentry_t guest_l1e_t;

>>> +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
>>> +     - Required
>>> +     - Bit-fields shall only be declared with an appropriate type
>>> +     -
>>
>> This requires you have settled on what "an appropriate type" is, i.e.
>> whether our uses of e.g. types wider than int is meant to become a
>> deviation, or will need eliminating. I suppose the outcome of this
>> could do with mentioning as a remark here.
> 
> Yes, Roberto showed the "appropriate types" for gcc and there were
> plenty including unsigned long if I remember right. I didn't write the
> full list down.
> 
> Roberto do you have the list ready? I can add it in the Notes section
> here.

GCC supports all integer types including enums.  In the analyzed
configurations of the project, bit-fields are declared of the
following types, in addition to the ones the compiler *has* to
support according to C99:

ARM64:   unsigned char, unsigned short, unsigned long, unsigned long long;
X86_64:  unsigned char, unsigned short, unsigned long, enum.

>>> @@ -143,6 +166,12 @@ existing codebase are work-in-progress.
>>>        - Octal constants shall not be used
>>>        -
>>>   
>>> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
>>> +     - Required
>>> +     - A "u" or "U" suffix shall be applied to all integer constants
>>> +       that are represented in an unsigned type
>>> +     -
>>
>> "Represented in an unsigned type" means there is a dependency on the
>> target architecture and compiler capabilities: Representation can only
>> be determined once knowing the underlying binary ABI, and uses in #if
>> and alike require knowing the widest integer type's size that the
>> compiler supports. As a consequence this looks like it may require, in
>> certain cases, to add u/U conditionally. Any such conditionals pose a
>> risk of cluttering the code.
> 
> I don't think there is any plan to add u/U conditionally, and I can see
> that would be undesirable. I think the idea is to add u/U to all
> constants meant to be unsigned. But also here I'll Roberto chime in --
> he said they already have a draft patch to fix this.

Yes, the patch will add U to all implicitly unsigned literals.
An open thing is whether it should also add that suffix in order
to avoid inconsistencies.  Here is an example:

/* INIT Record (for IPF) */
#define CPER_NOTIFY_INIT                                                \
         UUID_LE(0xCC5263E8, 0x9308, 0x454a, 0x89, 0xD0, 0x34, 0x0B,     \
                 0xD3, 0x9B, 0xC9, 0x8E)
/* Non-Maskable Interrupt */
#define CPER_NOTIFY_NMI                                                 \
         UUID_LE(0x5BAD89FF, 0xB7E6, 0x42c9, 0x81, 0x4A, 0xCF, 0x24,     \
                 0x85, 0xD6, 0xE9, 0x8A)

While 0xCC5263E8 is implicitly unsigned, 0x5BAD89FF is signed.
My inclination would be to add a U suffix to both, in order to
restore consistency in addition of complying with Rule 7.2.
Someone might say "I want to minimize the number of U suffixes
that are added, and keep the inconsistency".
Please note that the semantic inconsistency is present in the
original code;  adding one U would keep that semantic inconsistency
and introduce a visual inconsistency;  adding two Us would remove
both the semantic inconsistency and the visual inconsistency.
Given that the first argument of UUID_LE is used for lots of
bitwise operations, the option of adding two Us will also solve lots
of violations of Series 10 guidelines.

>>> @@ -314,6 +343,11 @@ existing codebase are work-in-progress.
>>>          used following a subsequent call to the same function
>>>        -
>>>   
>>> +   * - Rule 21.21
>>> +     - Required
>>> +     - The Standard Library function system of <stdlib.h> shall not be used
>>> +     -
>>
>> I wish inapplicable (to us) rules would also be marked as such.
>   
> Yes, actually it could be a good idea to say "inapplicable" in the Notes
> section for all the rules like this one. I can write a patch for it.

It depends on the audience: if you want to facilitate certification for Xen-based
products, "inapplicable" would not help, as no assessor would accept that.
What an assessor would want to see is "enforced, zero violations".

If, instead, your are writing for a different audience then "inapplicable"
can be appropriate, even though I think what you really mean is "any patch
introducing a call to stdlib.h's int system(const char *command) would
immediately be rejected by maintainers".  Which is not in contrast with
having the rule in the coding standard and having it automatically checked
by tools.



