Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96FBA101A5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 09:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870976.1282023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXbtI-0004ub-Ba; Tue, 14 Jan 2025 08:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870976.1282023; Tue, 14 Jan 2025 08:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXbtI-0004rc-8U; Tue, 14 Jan 2025 08:03:12 +0000
Received: by outflank-mailman (input) for mailman id 870976;
 Tue, 14 Jan 2025 08:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xX/k=UG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tXbtG-0004rW-J5
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 08:03:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdad326e-d24d-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 09:03:08 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4B1E54EE0744;
 Tue, 14 Jan 2025 09:03:07 +0100 (CET)
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
X-Inumbo-ID: fdad326e-d24d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736841787; bh=lB5Dbodzl2R3mgxiMRri6BWaGPaB3/93XncFmbd+ax0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hZYNHY2iAYkl69zp44q9NZr9AU0QaYJYRVrTqt/v1mOkN/KXN0Iiszz+2aHNf2L5J
	 7PSRDH/fRpPBLc0Lpwfh6UgcgfUk6uKleWdYFE6duq/jLOfFcljOvdRe0HY/5AmKyl
	 RHlUpP4MuOI3fAkYGE1hhPVAWbUxNPDy12oy5PjnGYqMtkiL28idnEv3uTpkU4qUbR
	 uy/nxox3T8EIqAJRFEoA13ToHwM20LxYscmJPTPBjiDjSU+TaGX3pRUd5Ue5oJVGQq
	 SV0fLr2bFt5jhAjFqswnuNWL38RalkKg3zuTVAs1sYcMYffD+0CkzmqQZcCRxuV8RH
	 otOZFsVXEShmw==
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 09:03:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden
 guards
In-Reply-To: <ec0ff4e5654752c7adbe7c4f9402cbd2@bugseng.com>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-2-roger.pau@citrix.com>
 <cf1f87d1-f616-4944-94fa-69a777249072@suse.com>
 <e3ec3dad28dc94436c0b330b2f995120@bugseng.com>
 <alpine.DEB.2.22.394.2501031617280.16425@ubuntu-linux-20-04-desktop>
 <8e31daaf77216534c252d371a3251595@bugseng.com>
 <alpine.DEB.2.22.394.2501091556590.133435@ubuntu-linux-20-04-desktop>
 <Z4DaZlbEDEjxQ6g-@macbook.local>
 <ec0ff4e5654752c7adbe7c4f9402cbd2@bugseng.com>
Message-ID: <f6b29634dc4d3c157bedc88207130df8@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-01-10 09:56, Nicola Vetrini wrote:
> On 2025-01-10 09:29, Roger Pau Monné wrote:
>> On Thu, Jan 09, 2025 at 03:57:24PM -0800, Stefano Stabellini wrote:
>>> On Thu, 9 Jan 2025, Nicola Vetrini wrote:
>>> > On 2025-01-04 01:20, Stefano Stabellini wrote:
>>> > > Hi Nicola, one question below

>>> >
>>> > I will update ECLAIR to treat the two forms as the same, so this patch can be
>>> > dropped. If you think it's helpful I can send a patch spelling out this -
>>> > arbitrary, but reasonable in my opinion - extension to the MISRA rule (which
>>> > does not consider the implications related to the use of GNU exensions) so
>>> > that contributors have a clear picture of the situation.
>>> 
>>> Thank you Nicola! Yes the patch would be appreciated :-)
>> 
>> So unless the proposed adjustment is considered better for code
>> readability patch 1 can be dropped, and patch 2 could be applied after
>> the ECLAIR change is in effect?
>> 
> 
> Yes, exactly
> 
>> How long will it take Nicola to get the ECLAIR change propagated into
>> the Gitlab runner?
>> 
>> Thanks, Roger.
> 
> We're still fixing the false positive upstream, but it shouldn't take 
> too long so I think next week I should be able to refresh the runner.

Hi Roger,

the runner is updated so, assuming no new violation of Rule 20.7 
appeared in the meantime, the rule should now be clean. In the next few 
days I'll prepare a patch to the docs to document the behaviour.

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

