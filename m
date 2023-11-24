Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09877F6DD8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640213.998125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RM0-0008BN-Eb; Fri, 24 Nov 2023 08:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640213.998125; Fri, 24 Nov 2023 08:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RM0-00089E-BA; Fri, 24 Nov 2023 08:16:00 +0000
Received: by outflank-mailman (input) for mailman id 640213;
 Fri, 24 Nov 2023 08:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5NGl=HF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r6RLy-000898-Q8
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:15:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b054c1a2-8aa1-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:15:54 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 97BD64EE073C;
 Fri, 24 Nov 2023 09:15:54 +0100 (CET)
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
X-Inumbo-ID: b054c1a2-8aa1-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Fri, 24 Nov 2023 09:15:54 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v5 1/3] arm/bitops: encapsulate violation of MISRA
 C:2012 Rule 10.1
In-Reply-To: <790c0480-7235-4a2a-929e-973e7aa27864@suse.com>
References: <cover.1700724350.git.nicola.vetrini@bugseng.com>
 <c7728964a8e6afdb1f52ed93f3d7459cc72b85ee.1700724350.git.nicola.vetrini@bugseng.com>
 <790c0480-7235-4a2a-929e-973e7aa27864@suse.com>
Message-ID: <7c07e93ad4c050a421ec97f832d0a1e5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-24 09:06, Jan Beulich wrote:
> On 23.11.2023 08:37, Nicola Vetrini wrote:
>> The definitions of ffs{l}? violate Rule 10.1, by using the well-known
>> pattern (x & -x); its usage is wrapped by the ISOLATE_LSB macro.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> This patch failed my pre-push build test; apparently xen/macros.h needs
> including explicitly.
> 
> Jan

Yes, indeed. I must have dropped that change when experimenting with 
single evaluation and then never reinstated it.
-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

