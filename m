Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA9575AB1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 07:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367908.599077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCDRn-0004aB-O3; Fri, 15 Jul 2022 05:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367908.599077; Fri, 15 Jul 2022 05:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCDRn-0004YM-KW; Fri, 15 Jul 2022 05:01:03 +0000
Received: by outflank-mailman (input) for mailman id 367908;
 Fri, 15 Jul 2022 05:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti2R=XU=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1oCDRm-0004YG-HD
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 05:01:02 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ecf68e1-03fb-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 07:01:01 +0200 (CEST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oCDRN-0004qt-V5; Fri, 15 Jul 2022 07:00:38 +0200
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
X-Inumbo-ID: 1ecf68e1-03fb-11ed-924f-1f966e50362f
Message-ID: <463dd8be-cdfe-d4c2-35b4-1d6b13f2825f@leemhuis.info>
Date: Fri, 15 Jul 2022 07:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] Subject: x86/PAT: Report PAT on CPUs that support PAT
 without MTRR
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>,
 Chuck Zmudzinski <brchuckz@aol.com>, linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jane Chu <jane.chu@oracle.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Randy Dunlap <rdunlap@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 stable@vger.kernel.org
References: <9d5070ae4f3e956a95d3f50e24f1a93488b9ff52.1657671676.git.brchuckz.ref@aol.com>
 <9d5070ae4f3e956a95d3f50e24f1a93488b9ff52.1657671676.git.brchuckz@aol.com>
 <5ea45b0d-32b5-1a13-de86-9988144c0dbe@leemhuis.info>
 <56a6ab5f-06fb-fa11-5966-cb23cb276fa6@netscape.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <56a6ab5f-06fb-fa11-5966-cb23cb276fa6@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1657861261;393b77c6;
X-HE-SMSGID: 1oCDRN-0004qt-V5

On 15.07.22 04:07, Chuck Zmudzinski wrote:
> On 7/14/2022 1:30 AM, Thorsten Leemhuis wrote:
>> On 13.07.22 03:36, Chuck Zmudzinski wrote:
>>> The commit 99c13b8c8896d7bcb92753bf
>>> ("x86/mm/pat: Don't report PAT on CPUs that don't support it")
>>> incorrectly failed to account for the case in init_cache_modes() when
>>> CPUs do support PAT and falsely reported PAT to be disabled when in
>>> fact PAT is enabled. In some environments, notably in Xen PV domains,
>>> MTRR is disabled but PAT is still enabled, and that is the case
>>> that the aforementioned commit failed to account for.
>>>
>>> As an unfortunate consequnce, the pat_enabled() function currently does
>>> not correctly report that PAT is enabled in such environments. The fix
>>> is implemented in init_cache_modes() by setting pat_bp_enabled to true
>>> in init_cache_modes() for the case that commit 99c13b8c8896d7bcb92753bf
>>> ("x86/mm/pat: Don't report PAT on CPUs that don't support it") failed
>>> to account for.
>>>
>>> This approach arranges for pat_enabled() to return true in the Xen PV
>>> environment without undermining the rest of PAT MSR management logic
>>> that considers PAT to be disabled: Specifically, no writes to the PAT
>>> MSR should occur.
>>>
>>> This patch fixes a regression that some users are experiencing with
>>> Linux as a Xen Dom0 driving particular Intel graphics devices by
>>> correctly reporting to the Intel i915 driver that PAT is enabled where
>>> previously it was falsely reporting that PAT is disabled. Some users
>>> are experiencing system hangs in Xen PV Dom0 and all users on Xen PV
>>> Dom0 are experiencing reduced graphics performance because the keying of
>>> the use of WC mappings to pat_enabled() (see arch_can_pci_mmap_wc())
>>> means that in particular graphics frame buffer accesses are quite a bit
>>> less performant than possible without this patch.
>>>
>>> Also, with the current code, in the Xen PV environment, PAT will not be
>>> disabled if the administrator sets the "nopat" boot option. Introduce
>>> a new boolean variable, pat_force_disable, to forcibly disable PAT
>>> when the administrator sets the "nopat" option to override the default
>>> behavior of using the PAT configuration that Xen has provided.
>>>
>>> For the new boolean to live in .init.data, init_cache_modes() also needs
>>> moving to .init.text (where it could/should have lived already before).
>>>
>>> Fixes: 99c13b8c8896d7bcb92753bf ("x86/mm/pat: Don't report PAT on CPUs that don't support it")
>>
>> BTW, "submitting-patches.rst" says it should just be "the first 12
>> characters of the SHA-1 ID"
> 
> Actually it says "at least", 

/me looks a bit confused, as he quoted above directly from that file

Ohh, that "at least" is in a different section of the document. :-D For
the fixes tag is explicitly "12 characters":

```
If your patch fixes a bug in a specific commit, e.g. you found an issue
using git bisect, please use the ‘Fixes:’ tag with the first 12
characters of the SHA-1 ID, and the one line summary.
```

> so more that 12 is It is probably safest
> to put the entire SHA-1 ID in because of the possibility of
> a collision.

Yes, sure, but it's a little mess if everybody uses something different
and 12 characters is what was agreed on as "good enough" for now.

> At least that's how I understand what
> submitting-patches.rst.
>
>>> Co-developed-by: Jan Beulich <jbeulich@suse.com>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>
>> Sorry, have to ask: is this supposed to finally fix this regression?
>> https://lore.kernel.org/regressions/YnHK1Z3o99eMXsVK@mail-itl/
> 
> Yes that's the first report I saw to lkml about this isssue.

Thx for confirming.

> So if I submit a v3 I will include that.

Thx.

> But my patch does not have a sign-off from the
> Co-developer as I mentioned in a message earlier today, and the
> discussion that has ensued leads me to think a better solution is to just
> revert the commit in the i915 driver instead, and leave the bigger questions
> for Juergen Gross and his plans to re-work the x86/PAT code in September,
> as he said on this thread in the last couple of days. This patch is dead
> now,
> as far as I can tell, because the Co-developer is not cooperating.

k, thx for the quick summary, this whole thing is a bit hard to follow
for me: I can only briefly look into most regressions, as there is only
so much time in a day...

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

