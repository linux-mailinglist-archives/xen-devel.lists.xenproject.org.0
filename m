Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF25177E993
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584895.915780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWM6H-0003tX-QZ; Wed, 16 Aug 2023 19:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584895.915780; Wed, 16 Aug 2023 19:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWM6H-0003qR-NC; Wed, 16 Aug 2023 19:22:37 +0000
Received: by outflank-mailman (input) for mailman id 584895;
 Wed, 16 Aug 2023 19:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqiy=EB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qWM6G-0003qL-S2
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:22:36 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 401a4fce-3c6a-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 21:22:35 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1692213744152892.8643123746068;
 Wed, 16 Aug 2023 12:22:24 -0700 (PDT)
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
X-Inumbo-ID: 401a4fce-3c6a-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; t=1692213746; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SaptQORi7JwYfZwg/CuAHBx2TzydsGFDORh8ABA8LSHgUmhYLQUUmwyd3Ma4WqrySvXauH5lf/R54orp7gvKO8Nthju9wFkPXMgF4Az86IBj+TnIS1N0Bb5Qpsm11EnN8YP8uV0qonu62LiQxYLnX0h8tjuXRhnDTiUtj/H52v4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692213746; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=EDY2UApggJSyiNdpbh+UfkvA86j6vNhYh1symwk1CIM=; 
	b=P6VFTaJE1F6iuMnrweoddCXCtnzG/+6kSmwSl9ck1kO0vplP5KxbVR1MohluYlyccqHR+Ya0RkF3b79ygRjafXv2k2Pfo0GKSZXPZjB3FccPlzs4nDQUKUSaUF7xoSqixx8FphnHHrtdc5MAKMfGkwfcrS4qxQkcJWy5SiTUFIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692213746;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EDY2UApggJSyiNdpbh+UfkvA86j6vNhYh1symwk1CIM=;
	b=WgrogWXg1m6oeBnzqdM1UsVyM1X92EbV/wlS0xjfRh8pNd0G+J9ogc+fTEQ+sZNQ
	DnEFsocZzLCLqYwp6SDz+IZSP/iXSqIzUfXVEEG+cf4EiUBKQKlQMPl6dSTI9oZmmvt
	S1RlEbH2fWdX0ya2ojwCVhjmihamKE/ZhIgNMKow=
Message-ID: <424c32d1-7063-a004-f427-7ceff2dcd21d@apertussolutions.com>
Date: Wed, 16 Aug 2023 15:22:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
 <a6348a98-30bb-8a03-7ed7-9e965be119eb@apertussolutions.com>
 <CA+zSX=ZajaUSD=AcqwjNL_HHeZm6kf1pHVDKU9nyZtsxS2N8qw@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CA+zSX=ZajaUSD=AcqwjNL_HHeZm6kf1pHVDKU9nyZtsxS2N8qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/14/23 07:25, George Dunlap wrote:
> 
> 
> On Tue, Aug 8, 2023 at 10:27 PM Daniel P. Smith 
> <dpsmith@apertussolutions.com <mailto:dpsmith@apertussolutions.com>> wrote:
> 
>     On 8/3/23 16:36, Andrew Cooper wrote:
>      > The opensuse-tumbleweed build jobs currently fail with:
>      >
>      >   
>     /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In
>     function 'rsa_private':
>      >   
>     /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for the address of 'p' will never be NULL [-Werror=address]
>      >       56 |   if (!key->p || !key->q || !key->u) {
>      >          |       ^
>      >    In file included from
>     /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
>      >   
>     /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note: 'p' declared here
>      >       28 |   tpm_bn_t p;
>      >          |            ^
>      >
>      > This is because all tpm_bn_t's are 1-element arrays (of either a
>     GMP or
>      > OpenSSL BIGNUM flavour).  The author was probably meaning to do
>     value checks,
>      > but that's not what the code does.
>      >
>      > Adjust it to compile.  No functional change.
>      >
>      > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com
>     <mailto:andrew.cooper3@citrix.com>>
>      > ---
>      > CC: George Dunlap <George.Dunlap@eu.citrix.com
>     <mailto:George.Dunlap@eu.citrix.com>>
>      > CC: Jan Beulich <JBeulich@suse.com <mailto:JBeulich@suse.com>>
>      > CC: Stefano Stabellini <sstabellini@kernel.org
>     <mailto:sstabellini@kernel.org>>
>      > CC: Wei Liu <wl@xen.org <mailto:wl@xen.org>>
>      > CC: Julien Grall <julien@xen.org <mailto:julien@xen.org>>
>      > CC: Juergen Gross <jgross@suse.com <mailto:jgross@suse.com>>
>      > CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com
>     <mailto:marmarek@invisiblethingslab.com>>
>      > CC: Jason Andryuk <jandryuk@gmail.com <mailto:jandryuk@gmail.com>>
>      > CC: Daniel Smith <dpsmith@apertussolutions.com
>     <mailto:dpsmith@apertussolutions.com>>
>      > CC: Christopher Clark <christopher.w.clark@gmail.com
>     <mailto:christopher.w.clark@gmail.com>>
>      >
>      > While I've confirmed this to fix the build issue:
>      >
>      >
>     https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430 <https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430>
>      >
>      > I'm -1 overall to the change, and would prefer to disable
>     vtpm-stubdom
>      > entirely.
>      >
>      > It's TPM 1.2 only, using decades-old libs, and some stuff in the
>     upstream
>      > https://github.com/PeterHuewe/tpm-emulator
>     <https://github.com/PeterHuewe/tpm-emulator> (which is still
>     abandaonded as of
>      > 2018) is just as concerning as the basic error here in rsa_private().
> 
>     For semantics sake, the Guest PV interface is 1.2 compliant but the PV
>     backend, vtpmmgr, is capable of using TPM2.0.
> 
>      > vtpm-stubdom isn't credibly component of a Xen system, and we're
>     wasting loads
>      > of CI cycles testing it...
> 
>     Unfortunately, I cannot disagree here. This is the only proper vTPM,
>     from a trustworthy architecture perspective, that I know of existing
>     today. Until I can find someone willing to fund updating the
>     implementation and moving it to being an emulated vTPM and not a PV
>     interface, it is likely to stay in this state for some time.
> 
> 
> Did you mean "I cannot *agree* here"?  "Cannot disagree" means you agree 
> that we're "wasting loads of CI cycles testing it", but the second 
> sentence seems to imply that it's (currently) irreplacable.

The architecture/design is what I don't want to see lost, the 
implementation itself, IMHO, has severely bit rotted. So what I was 
trying to say is that while it is an important reference design, I 
cannot disagree with the sentiment that building the broken 
implementation is wasting a significant amount of CI resources, both 
network and CPU time. IOW, I am probably the only one that would 
potentially make any noise if a patch was submitted to make it default 
disabled, and I am saying here that I would not do so.

v/r,
dps

