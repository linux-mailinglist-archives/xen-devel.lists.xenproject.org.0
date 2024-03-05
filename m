Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA7871AED
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 11:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688714.1073182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRyt-0006Uw-Uy; Tue, 05 Mar 2024 10:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688714.1073182; Tue, 05 Mar 2024 10:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRyt-0006Sb-SP; Tue, 05 Mar 2024 10:25:07 +0000
Received: by outflank-mailman (input) for mailman id 688714;
 Tue, 05 Mar 2024 10:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ATxC=KL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rhRys-0005r6-Kc
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 10:25:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a27634e0-dada-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 11:25:06 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BDBB54EE0737;
 Tue,  5 Mar 2024 11:25:05 +0100 (CET)
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
X-Inumbo-ID: a27634e0-dada-11ee-afda-a90da7624cb6
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 11:25:05 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 02/10] xen/arm: address some violations of MISRA C
 Rule 20.7
In-Reply-To: <alpine.DEB.2.22.394.2403041742540.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <efdeb0e013c36e18b5545fbdb33a43bb3f87039c.1709219010.git.nicola.vetrini@bugseng.com>
 <905119be-8731-4669-ac7f-c21aed6845dc@suse.com>
 <7c54b08875406e5b3a61325af124ae7f@bugseng.com>
 <0aae1c64587cfbc67e81a20b36dd5056@bugseng.com>
 <alpine.DEB.2.22.394.2403041742540.853156@ubuntu-linux-20-04-desktop>
Message-ID: <1a53d19ab3d901ce82ce391606ffef92@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-05 02:43, Stefano Stabellini wrote:
> On Mon, 4 Mar 2024, Nicola Vetrini wrote:
>> Hi,
>> 
>> as the maintainers of this subsystem, would you prefer Jan's version 
>> or the
>> one in the patch?
>> Both are fine w.r.t MISRA Rule 20.7 because the macro arguments 
>> themselves are
>> parenthesized.
> 
> I prefer Jan's version. Thanks for asking Nicola.
> 

Ok, thanks. I'll modify it and keep an eye for possibly additional 
opinions of other maintainers.

> 
>> > > > --- a/xen/arch/arm/include/asm/vgic-emul.h
>> > > > +++ b/xen/arch/arm/include/asm/vgic-emul.h
>> > > > @@ -6,11 +6,11 @@
>> > > >   * a range of registers
>> > > >   */
>> > > >
>> > > > -#define VREG32(reg) reg ... reg + 3
>> > > > -#define VREG64(reg) reg ... reg + 7
>> > > > +#define VREG32(reg) (reg) ... (reg) + 3
>> > > > +#define VREG64(reg) (reg) ... (reg) + 7
>> > >
>> > > #define VREG32(reg) (reg) ... ((reg) + 3)
>> > > #define VREG64(reg) (reg) ... ((reg) + 7)
>> > >
>> > > ?
>> > >
>> >
>> > The outer parentheses are not required, but I can add them if the
>> > maintainers share your view.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

