Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C7A7A5DA3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 11:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604500.941910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWtS-0006Ht-B8; Tue, 19 Sep 2023 09:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604500.941910; Tue, 19 Sep 2023 09:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWtS-0006FA-7m; Tue, 19 Sep 2023 09:19:42 +0000
Received: by outflank-mailman (input) for mailman id 604500;
 Tue, 19 Sep 2023 09:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZx6=FD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qiWtQ-0006F4-Ux
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 09:19:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8f7b7da-56cd-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 11:19:40 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 423284EE0737;
 Tue, 19 Sep 2023 11:19:39 +0200 (CEST)
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
X-Inumbo-ID: a8f7b7da-56cd-11ee-8789-cb3800f73035
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 11:19:39 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
In-Reply-To: <alpine.DEB.2.22.394.2309081236360.6458@ubuntu-linux-20-04-desktop>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
 <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
 <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com>
 <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
 <alpine.DEB.2.22.394.2309081236360.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <ed1f468463841e7f3f5bb90de4d9a227@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2023 21:37, Stefano Stabellini wrote:
> On Fri, 8 Sep 2023, Nicola Vetrini wrote:
>> On 08/09/2023 13:59, Jan Beulich wrote:
>> > On 08.09.2023 13:57, Jan Beulich wrote:
>> > > On 08.09.2023 10:48, Nicola Vetrini wrote:
>> > > > There is a build error due to -Werror because of a pointer comparison at
>> > > > line 469 of common/numa.c:
>> > > > i = min(PADDR_BITS, BITS_PER_LONG - 1);
>> > > > where
>> > > > #define PADDR_BITS              52
>> > > >
>> > > > I guess PADDR_BITS can become unsigned or gain a cast
>> > >
>> > > While generally converting constants to unsigned comes with a certain
>> > > risk, I think for this (and its siblings) this ought to be okay. As to
>> > > the alternative of a cast - before considering that, please consider
>> > > e.g. adding 0u (as we do elsewhere in the code base to deal with such
>> > > cases).
>> >
>> > And just after sending I realized that this would still be disliked by
>> > Misra's type system. (Much like then aiui the 1 above will need to
>> > become 1u. Which is all pretty horrible.)
>> >
>> > Jan
>> 
>> I have a proposal: in our tests we enabled an ECLAIR configuration 
>> that allows
>> to bypass the
>> constraint imposed by Rule 10.4 that warrants the 1U iff the value is 
>> constant
>> and both types
>> can represent it correctly (in this case BITS_PER_LONG -1). This would 
>> allow
>> using the proposed
>> solution and documenting why it's ok not to respect R10.4. What do you 
>> think?
> 
> I think that would be OK. I think we would want to document this in
> rules.rst. Please send a patch.

I checked: that configuration is already enabled in current staging, so 
perhaps the only
action in that regard would be to send a patch documenting it in 
rules.rst.

I just noticed one further issue with making BYTES_PER_LONG unsigned, in 
that causes
several instances of (1U << 3) to appear inside the file 
xen/arch/x86/xen.lds
produced by the build, which in turn causes ld to fail on that 'U'. For 
reference, the version of ld used by the build is the following:
GNU ld (GNU Binutils for Ubuntu) 2.38

The following is a snippet of the output:

        . = ALIGN((1 << 12));
        __ro_after_init_end = .;
        __start_bug_frames = .;
        *(.bug_frames.0)
        __stop_bug_frames_0 = .;
        *(.bug_frames.1)
        __stop_bug_frames_1 = .;
        *(.bug_frames.2)
        __stop_bug_frames_2 = .;
        *(.bug_frames.3)
        __stop_bug_frames_3 = .;
        *(.rodata)
        *(.rodata.*)
        *(.data.rel.ro)
        *(.data.rel.ro.*)
        . = ALIGN((1U << 3)); __start_vpci_array = .; 
*(SORT(.data.vpci.*)) __end_vpci_array = .;
   } :text
   .note.gnu.build-id : AT(ADDR(".note.gnu.build-id") - (((((((261 >> 8) 
* 0xffff000000000000) | (261 << 39))) + ((1 << 39) / 2)) + (64 << 30)) + 
(1 << 30))) {
        __note_gnu_build_id_start = .;
        *(.note.gnu.build-id)
        __note_gnu_build_id_end = .;


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

