Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C48479E7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 20:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675194.1050453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVzXR-0005lO-Mb; Fri, 02 Feb 2024 19:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675194.1050453; Fri, 02 Feb 2024 19:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVzXR-0005jm-Jq; Fri, 02 Feb 2024 19:49:25 +0000
Received: by outflank-mailman (input) for mailman id 675194;
 Fri, 02 Feb 2024 19:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+1zP=JL=proton.me=johnlpoole@srs-se1.protection.inumbo.net>)
 id 1rVzXP-0005jc-5i
 for xen-devel@lists.xen.org; Fri, 02 Feb 2024 19:49:24 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28a35320-c204-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 20:49:21 +0100 (CET)
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
X-Inumbo-ID: 28a35320-c204-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1706903360; x=1707162560;
	bh=R+gSnI5dg26Sgj4zkL+FSBJq3xjPpbwjKyqY1GDDlYo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DvmXLxi5b/UGCaRY2kZWWiF/3TIeIf7lZu+FWGaitEV0oh1y2c2rMNJt2/UbAEe19
	 lh6o5PV+5usaPm6BPp4ijtmfxpWM1w+Agu6kJIE4oefUjhS/oWvpaiJwR4fzK3UY3J
	 MAn4lPt3J8ij5uz+SYuex+TmvHA7eCUr/dR3Uo5l7bveYTI8ma52SMDi8qnq04lYIR
	 xlgZvWokXp5Pc3htNwB1Ia9L9ZkLp/2suEGjqlRiYsuuKHLhkdvB7HsluFJHG+eLZh
	 NGk/3G+APlt5KJSResGzAunoowZcVWn6JRCg9R4IhK+9QriUbuysgcHGJzqTNnJLVg
	 7n6bF6rKiPkbg==
Date: Fri, 02 Feb 2024 19:48:59 +0000
To: David Woodhouse <dwmw2@infradead.org>
From: "John L. Poole" <johnlpoole@proton.me>
Cc: xen-devel@lists.xen.org
Subject: Re: Nullifying Recently Introduced Xen Headers Check
Message-ID: <ff5abd30-0b64-4c4f-b992-2894cbde7468@proton.me>
In-Reply-To: <a8a3c0d82f868869751958250719398a2d042e93.camel@infradead.org>
References: <fb379476-f6ae-4eb7-b3c6-6f0ad175964d@proton.me> <4b5b1fdadbabd53116d1ab79295b913c27947c4b.camel@infradead.org> <cj1qg72oASoR0AT_B5_w6AnPm5tf8K-muPdrGWSGYozXJ6N8vaMUI3XMVBx2IoAYlKPAyUTewevznMbj6S0t3plMygEAS8_HtUVubMXo1dA=@proton.me> <a8a3c0d82f868869751958250719398a2d042e93.camel@infradead.org>
Feedback-ID: 80499891:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 2/2/2024 11:25 AM, David Woodhouse wrote:
> On Thu, 2024-02-01 at 18:39 +0000, John L. Poole wrote:
>> While the Xen Project "make" works, the Gentoo emerge
>> of app-emulation/xen-tools does not unless the three lines are
>> removed to simulate prior 4.17.3 and earlier code.
>>
>> I suspect the Gentoo approach
>> of building tools first contributes to the problem.
> The problem is that -D__XEN_INTERFACE_VERSION=3D=E2=80=A6 is being set on=
 the
> compiler command line, in ${CFLAGS}.
>
> Clearly it isn't qemu itself which does that. And I think you said
> above that invoking the qemu build even from the Xen makefiles directly
> is also working fine?
>
> So the question is why the Gentoo build is setting that explicitly in
> CFLAGS?

Correct.

I downloaded

https://downloads.xenproject.org/release/xen/4.18.0/xen-4.18.0.tar.gz,

staged and entered the tree, ".configure", then "make" and everything
worked.=C2=A0 That's when
I decided Gentoo's package/build system was affecting matters and I
later determined that Gentoo
had made the decision to bifurcate the build order and build tools in
its own package,
app-emulation/xen-tools, and then xen in its own package
app-emulation/xen, the
former being a prerequisite to the latter.

I've postured this divergence in the bug: https://bugs.gentoo.org/921932#c2=
1


-- John



