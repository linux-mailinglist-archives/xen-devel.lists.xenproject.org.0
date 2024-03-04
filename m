Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD387095B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 19:18:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688489.1072670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhCsu-0001jV-H4; Mon, 04 Mar 2024 18:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688489.1072670; Mon, 04 Mar 2024 18:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhCsu-0001hk-EV; Mon, 04 Mar 2024 18:17:56 +0000
Received: by outflank-mailman (input) for mailman id 688489;
 Mon, 04 Mar 2024 18:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNjK=KK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rhCss-0001hc-NR
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 18:17:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 843e982a-da53-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 19:17:53 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 985DC4EE0737;
 Mon,  4 Mar 2024 19:17:52 +0100 (CET)
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
X-Inumbo-ID: 843e982a-da53-11ee-afda-a90da7624cb6
MIME-Version: 1.0
Date: Mon, 04 Mar 2024 19:17:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 02/10] xen/arm: address some violations of MISRA C
 Rule 20.7
In-Reply-To: <7c54b08875406e5b3a61325af124ae7f@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <efdeb0e013c36e18b5545fbdb33a43bb3f87039c.1709219010.git.nicola.vetrini@bugseng.com>
 <905119be-8731-4669-ac7f-c21aed6845dc@suse.com>
 <7c54b08875406e5b3a61325af124ae7f@bugseng.com>
Message-ID: <0aae1c64587cfbc67e81a20b36dd5056@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

as the maintainers of this subsystem, would you prefer Jan's version or 
the one in the patch?
Both are fine w.r.t MISRA Rule 20.7 because the macro arguments 
themselves are parenthesized.

>>> --- a/xen/arch/arm/include/asm/vgic-emul.h
>>> +++ b/xen/arch/arm/include/asm/vgic-emul.h
>>> @@ -6,11 +6,11 @@
>>>   * a range of registers
>>>   */
>>> 
>>> -#define VREG32(reg) reg ... reg + 3
>>> -#define VREG64(reg) reg ... reg + 7
>>> +#define VREG32(reg) (reg) ... (reg) + 3
>>> +#define VREG64(reg) (reg) ... (reg) + 7
>> 
>> #define VREG32(reg) (reg) ... ((reg) + 3)
>> #define VREG64(reg) (reg) ... ((reg) + 7)
>> 
>> ?
>> 
> 
> The outer parentheses are not required, but I can add them if the 
> maintainers share your view.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

