Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE996A97683
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963556.1354527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JvN-0007IK-O3; Tue, 22 Apr 2025 20:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963556.1354527; Tue, 22 Apr 2025 20:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JvN-0007G3-LO; Tue, 22 Apr 2025 20:08:57 +0000
Received: by outflank-mailman (input) for mailman id 963556;
 Tue, 22 Apr 2025 20:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pc5Z=XI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u7JvM-0007Fx-46
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:08:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d9d55f0-1fb5-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 22:08:54 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5E9334EE3BFD;
 Tue, 22 Apr 2025 22:08:53 +0200 (CEST)
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
X-Inumbo-ID: 9d9d55f0-1fb5-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745352533;
	b=bLDzmOWr/qPVVHikxCUP9Mgq+twt4ogCXwFqdmiiCp/XpKFCOywgUvvYUDVPgWY6ffOi
	 mcuPuPVmC6s0UCSXIkQmHN5GOnpOfIJ0gbph25L0v7L3ILbd8kcSeML6lf3+LUqZWkmPW
	 pOWy5m00d8Yeug4XGJZcQnm4lCaQ9ikQSnXqvVbpp596Go7gcM1fhKA24Nf63JVyqcA4d
	 agNVUbmDYTpyCHQgE1Y11IQOrWlBFtIL9XEhZQsDuWsFkaI6kZ/CuiVFgTWvIZb8t87XQ
	 vn3a0f4sejVmfIoFjUlcZAjnvR5y/j5HF9SO+Bxch/h214MKO7MU8SbRIhzCjCXvPlYXY
	 Vp61k6GWnFEBsfsiS+Dr5H42C9P/JtAKLHTUirdRuymf7vNKv5aaSSwl06Q8hrDnX9FSv
	 aed1z289XDF8YYfsJfQ/uHATzQWmUvUjigav71LDFXv+kyPR0J/zrdi3/q28Rs7yhndIq
	 pzusWisgwggPW2SjSNDUI92T2D3xs53cvlraxkfL9hJLcxmkbyqsJQoubqKSajT19MrxC
	 gu8RK/apc9vESQP+WAoJS46tyhmCDM/bxFU7H9nbkzo0ISzA0cOifQMcGHiRjzDSq/Qkg
	 RUIZBe4FewC7ln9/R0SgyUHxPOFbmfJb9aVPm2MKkIUTWC4EDnlq1azGqjYZK3w=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745352533;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=iEgoPqnlAVz+MSXJq2/xh+j1parUoL7zyWn9E2545Qs=;
	b=hCeAhHN7ycLYuDLADTuIWPddNELbKx8xrxZqgqRAo99bLb/ayZ14JJcXy8x04J9YDGat
	 l0sCxStS55IfxeRPgi7NA1+8wZR8bqdj3/dMK0tvdXln16d9SLwjNvEbud9kuYEDPlj40
	 4gANzNjFgIL2GEuIoUNIlP3ekGvx9/2uQDx9a0tZ7Eq6Tet7r0jXhX/MqCrGzBhhsf47E
	 0fBU9ofcEUhuPBkiSEScW8A3Mum0hpuSjFZCtNuRfehZP7L+nzSpIy0dKNfuMKvUbDnZ+
	 H+plVPHM5taOkfkYxahSaewXVL2FI/1Flq9oYU21MoHgXkgyFdozu8xaAb+L70Ut96O8l
	 oIeBcr7UjCYywi8ZXsh4CdkHZmd/yHIB4N784disVmJJDgVN0BhVQgBfkQY6Zp8pD6N1k
	 20dYo1yubAY8i+P9fBdw8zQxNuqgHJCHhgyJiOIFwx0Yn2bFbq6Gn32MS0OKYwc7r7+4r
	 uFAxkhKnlWSXhYKODEHNgO+QbO1ECKHrF/v1oE0hOHXqSnDIQ0kxiivcJP9gPNU7woJYJ
	 1Qc4lmj1i4QnUeADzw3NR8O7p6ORTt+/j5ma/AQnY1vECZjmU/RBeL+YU0H0YxdVNhxBj
	 dyQsF1YItpr845jF5eYvVs/8mrtxKEXsA7ta3KYN3HVUpv1v1GMwxwZD2KbL+ww=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745352533; bh=RRihhV4R9nDE0e+h7xyXVcGUfHlzwn6B8iz9MIbUemY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oSS+Sk7rMbiq5mBTKUVm5SlX1rZMbRFkqO8SfTP+hvG13RwTGhEVuCoux5jmSBKoU
	 pBQkJYh46emJoMVx+vWVpDXFDg/ydaMonKdDsS6k3MDqVq/qrI6VnK3R9OWqsmV7nv
	 ff4iDwdbr58DN7ERqUVrcfLfUrNMYuRaJB3RSXZBHwCwgEQgUSGjJ6jbEzPlKo8uXb
	 BbeXNbqQGwx+mL+qhtAD6AbhKZesLx7SNCY+iN4ZYyqwwp1WF8p5M4AqOkdumFybb1
	 OEwh9+SlzyZsMxM0BUb/Uiy7rfyvVzbYrdldYRgpdSsxjI9/vijDbPxIE+wVPw2q+k
	 ybZL/zfqMxzjw==
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 22:08:53 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen: Use asm inline when available for alternatives
In-Reply-To: <alpine.DEB.2.22.394.2504221302120.785180@ubuntu-linux-20-04-desktop>
References: <20250422113957.1289290-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2504221244360.785180@ubuntu-linux-20-04-desktop>
 <0570b0ed-607c-49fa-b82e-29ffac60f873@citrix.com>
 <alpine.DEB.2.22.394.2504221256080.785180@ubuntu-linux-20-04-desktop>
 <f315f38e20432bc9f62ae2d4b04582a4@bugseng.com>
 <alpine.DEB.2.22.394.2504221302120.785180@ubuntu-linux-20-04-desktop>
Message-ID: <60e776075c8861f825ef2589b9053792@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-22 22:02, Stefano Stabellini wrote:
> On Tue, 22 Apr 2025, Nicola Vetrini wrote:
>> On 2025-04-22 21:58, Stefano Stabellini wrote:
>> > On Tue, 22 Apr 2025, Andrew Cooper wrote:
>> > > On 22/04/2025 8:46 pm, Stefano Stabellini wrote:
>> > > > On Tue, 22 Apr 2025, Andrew Cooper wrote:
>> > > >> Compilers estimate the size of an asm() block for inlining purposes.
>> > > >>
>> > > >> Constructs such as ALTERNATIVE appear large due to the metadata,
>> > > depsite often
>> > > >> only being a handful of instructions.  asm inline() overrides the
>> > > estimation
>> > > >> to identify the block as being small.
>> > > >>
>> > > >> This has a substantial impact on inlining decisions, expected to be for
>> > > the
>> > > >> better given that the compiler has a more accurate picture to work
>> > > with.
>> > > >>
>> > > >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> > > > Hi Andrew,
>> > > >
>> > > > If we are going to use asm_inline, please add a note to
>> > > > docs/misra/C-language-toolchain.rst where we keep record of all the
>> > > > language extensions we use.
>> > >
>> > > It's just asm(), and that's already discussed.
>> > >
>> > > I'm not sure what else you think is warranted.
>> >
>> >
>> > If it is just asm() then there is nothing to do. We only need to
>> > document extensions to the language, nothing else. Many of them are
>> > already documented under docs/misra/C-language-toolchain.rst (see for
>> > instance asm and __asm__).
>> >
>> > I see the critical part of the patch for this question is:
>> >
>> > > +#if CONFIG_CC_HAS_ASM_INLINE
>> > > +# define asm_inline asm __inline
>> > > +#else
>> > > +# define asm_inline asm
>> > > +#endif
>> >
>> > it looks like __inline is an extension ?
>> 
>> I see. It was added to the tool configuration, but not there in the 
>> rst
>> (__inline__ as well), hence why there are no CI failures.
> 
> I see __inline__|__inline in toolchain.ecl. Nicola, would you be up for
> sending a small patch to docs/misra/C-language-toolchain.rst to add 
> them?

Yes, no problem. I'll take the occasion to see whether there are other 
gaps. Perhaps there's a clever way to ensure these files do not go out 
of sync?

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

