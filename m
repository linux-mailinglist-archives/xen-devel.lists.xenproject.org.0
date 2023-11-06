Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C647E2681
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:21:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628022.979018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00Sn-0003E2-SI; Mon, 06 Nov 2023 14:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628022.979018; Mon, 06 Nov 2023 14:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00Sn-0003By-Ns; Mon, 06 Nov 2023 14:20:25 +0000
Received: by outflank-mailman (input) for mailman id 628022;
 Mon, 06 Nov 2023 14:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y50s=GT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r00Sn-0003Bs-1t
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:20:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f87af35-7caf-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 15:20:23 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id F1D0C4EE0740;
 Mon,  6 Nov 2023 15:20:22 +0100 (CET)
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
X-Inumbo-ID: 9f87af35-7caf-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 06 Nov 2023 15:20:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
In-Reply-To: <alpine.DEB.2.22.394.2310271419260.271731@ubuntu-linux-20-04-desktop>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
 <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
 <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
 <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com>
 <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com>
 <8cb336ca-41ed-8adc-957a-28b5585c84f1@suse.com>
 <alpine.DEB.2.22.394.2310271419260.271731@ubuntu-linux-20-04-desktop>
Message-ID: <9888aa5c298584c22cf55b13befeaaa6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-27 23:38, Stefano Stabellini wrote:
> On Thu, 26 Oct 2023, Jan Beulich wrote:
>> On 26.10.2023 14:32, Nicola Vetrini wrote:
>> > On 25/10/2023 09:56, Jan Beulich wrote:
>> >> On 24.10.2023 22:27, Stefano Stabellini wrote:
>> >>> On Tue, 24 Oct 2023, Jan Beulich wrote:
>> >>>> On 24.10.2023 16:31, Nicola Vetrini wrote:
>> >>>>> Partially explicitly initalized .matches arrays result in violations
>> >>>>> of Rule 9.3; this is resolved by using designated initializers,
>> >>>>> which is permitted by the Rule.
>> >>>>>
>> >>>>> Mechanical changes.
>> >>>>>
>> >>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> >>>>
>> >>>> While not overly bad, I'm still not really seeing the improvement.
>> >>>> Yet aiui changes induced by Misra are supposed to improve things in
>> >>>> some direction?
>> >>>
>> >>> I think the improvement is clarity, in the sense that the designated
>> >>> initializers make it clearer that the array may be sparsely
>> >>> initialized
>> >>> and that the remaining elements should be initialized to zero
>> >>> automatically.
>> >>
>> >> That's as clear from the original code, imo.
> 
> This specific instance is simple and might be clear either way, but in
> general especially in more complex scenarios and potentially nested
> structures and arrays, it could be harder to figure out and that leads
> to errors. The MISRA checker is a powerful tool to help us make sure 
> the
> code is correct in all cases, but to take advantage of it properly we
> need to get to the point where we don't have violations in the current
> code.
> 
> Looking at the results, we have zero violations for Rule 9.3 on ARM
> already and only 55 on x86. It should be possible to fix them all
> mechanically in short order. Of course for that to happen, we need to
> make some compromises. For instance, adding {0} like in the example
> below, or adding [0]=init,[2]=init like in the first version of the
> patch. Taking individually, they might not be all great improvements,
> but all together having the Xen codebase Rule 9.3-free and easy to scan
> for future violations should be.
> 
> 
> 
>> > There's also this functionally equivalent alternative, with or without
>> > the zeros, which
>> > doesn't incur in the risk of mistakenly attempting to initialize the
>> > same element twice,
>> > while also giving an explicit cue to the reader that all elements are
>> > truly zero-initialized.
>> >
>> >           .matches = {
>> >               DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
>> >               DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
>> > +            {0}, {0}
>> >           },
>> 
>> Adding a dependency on the array actually having 4 elements (while 
>> iirc
>> we have seen already that we could in principle go down to 3). A 
>> change
>> of this number would then require touching all these sites, which is
>> what we'd like to avoid.
> 
> How often the array needs to change though? Looking at the git history
> it doesn't seem the number of elements ever changed. So I think it is a
> good tradeoff, and I would go with this type of fix (maybe also at the
> other locations mechanically too although I haven't looked at them in
> details).

Hi, any updates on this? Considering the opinions expressed above, what 
would
be the path preferred by the community?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

