Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF879846A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 10:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597872.932269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXAM-0002Qo-P0; Fri, 08 Sep 2023 08:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597872.932269; Fri, 08 Sep 2023 08:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXAM-0002Nz-M6; Fri, 08 Sep 2023 08:48:38 +0000
Received: by outflank-mailman (input) for mailman id 597872;
 Fri, 08 Sep 2023 08:48:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCyG=EY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qeXAL-0002Na-R4
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 08:48:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fdb0e5e-4e24-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 10:48:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 342344EE0738;
 Fri,  8 Sep 2023 10:48:36 +0200 (CEST)
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
X-Inumbo-ID: 7fdb0e5e-4e24-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Fri, 08 Sep 2023 10:48:36 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
In-Reply-To: <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2023 03:33, Stefano Stabellini wrote:
> On Wed, 6 Sep 2023, Jan Beulich wrote:
>> On 06.09.2023 17:57, Nicola Vetrini wrote:
>> > On 05/09/2023 10:33, Jan Beulich wrote:
>> >> On 05.09.2023 10:20, Nicola Vetrini wrote:
>> >>> On 05/09/2023 09:46, Jan Beulich wrote:
>> >>>> On 05.09.2023 09:31, Nicola Vetrini wrote:
>> >>>>> Given its use in the declaration
>> >>>>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>> >>>>> 'bits' has essential type 'enum iommu_feature', which is not
>> >>>>> allowed by the Rule as an operand to the addition operator.
>> >>>>> Given that its value can be represented by a signed integer,
>> >>>>> the explicit cast resolves the violation.
>> >>>>
>> >>>> Wait - why would this lead to a change to BITS_TO_LONGS()? And if
>> >>>> that
>> >>>> was to be changed, why plain int? I don't think negative input makes
>> >>>> sense there, and in principle I'd expect values beyond 4 billion to
>> >>>> also be permissible (even if likely no such use will ever appear in a
>> >>>> DECLARE_BITMAP(), but elsewhere it may make sense). Even going to
>> >>>> "unsigned long" may be too limiting ...
>> >>>>
>> >>>
>> >>> You have a point. I can think of doing it like this:
>> >>> DECLARE_BITMAP(features, (int)IOMMU_FEAT_count)
> 
> I think this is a good solution for this case (even more so if we can't
> find a better implementation of BITS_TO_LONGS)
> 
> 
>> >>> on the grounds that the enum constant is representable in an int, and
>> >>> it
>> >>> does not seem likely
>> >>> to get much bigger.
>> >>> Having an unsigned cast requires making the whole expression
>> >>> essentially unsigned, otherwise Rule 10.4 is violated because
>> >>> BITS_PER_LONG is
>> >>> essentially signed. This can be done, but it depends on how
>> >>> BITS_TO_LONGS will be/is used.
>> >>
>> >> It'll need looking closely, yes, but I expect that actually wants to be
>> >> an
>> >> unsigned constant. I wouldn't be surprised if some use of
>> >> DECLARE_BITMAP()
>> >> appeared (or already existed) where the 2nd argument involves sizeof()
>> >> in
>> >> some way.
>> >>
>> >
>> > I think there's one with ARRAY_SIZE. In my opinion this can be resolved
>> > as follows:
>> >
>> > #define BYTES_PER_LONG (1U << LONG_BYTEORDER) // the essential type gets
>> > from signed to unsigned
>> >
>> > #define BITS_TO_LONGS(bits) \
>> >          (((unsigned long long)(bits)+BITS_PER_LONG-1U)/BITS_PER_LONG) //
>> > same here
>> 
>> Except, as said before, I consider any kind of cast on "bits" latently
>> problematic.
> 
> Can't we just do this (same but without the cast):
> 
> #define BYTES_PER_LONG (1U << LONG_BYTEORDER)
> #define BITS_TO_LONGS(bits) \
>          (((bits)+BITS_PER_LONG-1U)/BITS_PER_LONG)
> 
> Then we just need to make sure to pass an unsigned to BITS_TO_LONGS. In
> the case above we would do:
> 
> DECLARE_BITMAP(features, (unsigned int)IOMMU_FEAT_count)

There is a build error due to -Werror because of a pointer comparison at 
line 469 of common/numa.c:
i = min(PADDR_BITS, BITS_PER_LONG - 1);
where
#define PADDR_BITS              52

I guess PADDR_BITS can become unsigned or gain a cast

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

