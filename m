Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396378E487
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 03:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593315.926298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWlb-00078m-8B; Thu, 31 Aug 2023 01:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593315.926298; Thu, 31 Aug 2023 01:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWlb-00075p-50; Thu, 31 Aug 2023 01:46:39 +0000
Received: by outflank-mailman (input) for mailman id 593315;
 Thu, 31 Aug 2023 01:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFXE=EQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qbWla-00075j-3c
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 01:46:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38cb0ef9-47a0-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 03:46:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87221B8216A;
 Thu, 31 Aug 2023 01:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23ADC433C7;
 Thu, 31 Aug 2023 01:46:33 +0000 (UTC)
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
X-Inumbo-ID: 38cb0ef9-47a0-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693446395;
	bh=Ouh9xByWvCFe93wc4MT07/xKVtJ4bxJouZLtUWwGCI0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JwbRDbZ8pTmnyRskyj3/Mb4HXnSaowWKdFuv+siHIX3iADpVw3OGemKDa60Qf0C8v
	 /QxCgxzwzKX6/pcOn/WkVTrJwrQfcw3gNiRFzqgiGSzk66RrDLMREwWs6fXVIOttQ3
	 q1gVuVN+H0/zOFhrxw/K8NpZ53T1N1GDFLpHWobQgS8xIAHtyEIqE5PmUQE946AI/T
	 JpgUZO4Ez5AmtbuxoqxVEp9pB6qfQB1bPEt+y9ffU6HXl7eMYqbKWFgiiu9O6mMO9G
	 ii0Pkm3ciI6JZDI07LPpcPIpdc8kflTKFdf1C8EzdsBcW8TMdszAOPrjD8IOFIHFPW
	 n81rRkI36Ovbw==
Date: Wed, 30 Aug 2023 18:46:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
In-Reply-To: <64ACA853-E0D3-4B56-B79B-C31BF692A936@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308301840520.6458@ubuntu-linux-20-04-desktop>
References: <20230830005950.305085-1-sstabellini@kernel.org> <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com> <15551c77-95fa-7c7d-6b6b-d5c42a38caac@suse.com> <64ACA853-E0D3-4B56-B79B-C31BF692A936@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Aug 2023, Bertrand Marquis wrote:
> > On 30 Aug 2023, at 09:58, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 30.08.2023 09:54, Bertrand Marquis wrote:
> >>> On 30 Aug 2023, at 02:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
> >>> +     - Required
> >>> +     - The controlling expression of an if statement and the controlling
> >>> +       expression of an iteration-statement shall have essentially
> >>> +       Boolean type
> >>> +     - Implicit conversions of integers, pointers, and chars to boolean
> >>> +       are allowed
> >> 
> >> I am a bit wondering here what is remaining after this deviation.
> > 
> > Hmm, good point - floating point (and alike) types, which we don't use anyway.
> 
> So we accept the rule but we deviate all cases that would apply.
> I do not think we should do that.

In the past we have been accepting rules that don't apply to Xen because
it is not much that they don't apply. It is that we have no violations
and we don't think there is any risk of getting violations in the
future.

But theoretically they apply, and for example if we end up with floating
points in Xen at some point in the future we would want rules affecting
floating points to apply, hence we accepted rules about floating points.

This rule is a bit different though: we deviate most of the rule and the
remaining part is small. In addition, we have no violations and we don't
think there is any risk of getting violations in the future for what's
left of the rule.

So I don't know if it is worth adding the rule or not. I think we should
ask Roberto next time. For now, I remove it from this patch.

