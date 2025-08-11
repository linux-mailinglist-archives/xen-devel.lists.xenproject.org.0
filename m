Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81818B2134B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 19:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077886.1438909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWOv-0006s3-3q; Mon, 11 Aug 2025 17:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077886.1438909; Mon, 11 Aug 2025 17:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWOv-0006qA-0o; Mon, 11 Aug 2025 17:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1077886;
 Mon, 11 Aug 2025 17:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn8B=2X=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ulWOt-0006q2-DC
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 17:33:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dfe4b0c-76d9-11f0-a326-13f23c93f187;
 Mon, 11 Aug 2025 19:33:34 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C004E4EE0744;
 Mon, 11 Aug 2025 19:33:32 +0200 (CEST)
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
X-Inumbo-ID: 4dfe4b0c-76d9-11f0-a326-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754933612;
	b=28QLEHD2E6rjY3UMInlNrFNlmUEr238UvixU5KlBytiCm1qZ12DvACfhn6WIy3MWwwOn
	 7aP18OZmp+quPmgrvkAf4R2iB1BxAhxUECvLklXeq9BsTDDAu70PH6DBAQLvTIJM8M/Xv
	 i0nHcz0lqFW1hnfx8peI9yHWRQf/gMzQJgj6C08tw869w6AugOpBxrdaH1Ot0uf5DssYh
	 XuFxAJSDk7VyMm4PVtrr2JZW+jken50bEZI4trKDcihrYxv2AeDFg52S4SOUYlBVGkvXh
	 5oVbUK4ATkljANPGOElqCWx/aO57FSCmMzuXOe95pB8uAHOF7a7XfSh4hObhhMUf97/FM
	 1wDIyvCCe5M9aG1czIk92DV4GaqqsiS/A4PAaNHQDXDkllCMUslgvZFczjSVS01oCzcCn
	 pTHoBVxYbB0dnE0Nd8sk7HlACycobdxL+8HDuyn2P+q/KysZziOLAR9vT3xKWgv/da3Oi
	 pDEdZqN1RMrTfcG7Nk64/cByBRcy6V50QNl3bHlWC8/ac0N0PGGXohiWz9lhTlNxSZJlC
	 YnIYjcr5J1HDRiwf13M5Hi29Sdc5Pyfu0+V9U/QDhfJxpV1NWcAuR4n6mstVktNIpZdbP
	 f0/2p0D7YVIXD4O3pNpYwi25xCNoMSuZttqhc2wVZPpiT3XovYFK0ZADotw/vsA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754933612;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=KPhUVmT+WZ7A7Zg9ag6Jkhm3PsKJ59NCsU7cZ71Vju0=;
	b=mFmduCEuzAA5WcQLTy0AOFMaTHPr0da3OClS4gkgW5FE7MwcCW0QVO+b5oswD/c+LJhP
	 C/tEnmS/1nyq1W09gbYonAvR38bgstlypm4uUWtwn78FyFL9WKXB+c/TeyfyVpzFe2VE1
	 iys0v4Db2bN6wFpmmC7wQwZ3ZXLQViA73oWa0RVOkX0RSrlZUvpu2Nyifes5HGn7hQiDv
	 RBQvado3vSgGBPCqqzWupSLBDTZFS8mhKrSfME7P4+MKaVS8rwO0XGS2mifGkKTLBLmw7
	 qya8/jrp39wUtzQhIy9OcQ/+Mr3Ow0dTQAHwaIBnmfZlDSs3Yj81LxJ+0mh2zcjk/9oAj
	 l0hNO9H7WEIoHYkOFQA3HSVWGIKLvV666YRi2FwUgz+15bXUcYA9ki2qdWq6I1qN8lPWm
	 KRVcjHsQI5hpo1wI53npp8CQ8RGq3hZX/Q4LSEddp0TVvsGEtvEt12ltI9r/hgN+AP2Sy
	 DgwbuFNV3utuT5se6+DzchBc8XMlVVFEwnht3YRR77vDJLedFmjsREzpqG5HcuJKBtK8h
	 +jaSIe8rxPUNZSVxpJogcPtGIDa7TCz/chBv+A3MiVEi6SUiI2lAYL0ZG0AhqlN7UyiW6
	 BhUKWIoLxifFMg2xxme4gJIOj7hYlsPeJXQkj2RTsGXEMgtJaav15s8Cek66REk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754933612; bh=+2tMGRj7/V5wGSMPz2tkmNX/tx42u975yZz+sCLW1oo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hMEnkHiiPsF1ShlbeTs2qyuN2BHMTCiAln0D5/MH79p74KuUjrlrrhgs3jEODWW5+
	 ahzHU77kkHBEw6DxpPr2FTqUYwFKqhbLcpzbQPW12o/e5HAqiIWQzI4fgWGIZ4/CWw
	 NZpF4ioXqa4fyUs8B2cz21oZHz9aJIPgWe8yYOxbkEFpfaGZKaPKWD2TX5zqrrSCh9
	 2kpRd4G8cvkAfo5AgzvNwuRdzldyC9nBkxsum25d9HBCcGi4DJUU+Y/ubkvvNV6Wto
	 2R8mvw9cB1JM6o7e+2Df9Rux1CqZ3eYdwD0qEDUphQwTXnU6OgS3WKg08roCB6QTb3
	 0kszpop9gbN8A==
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 19:33:32 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen: Drop logic for old clang versions.
In-Reply-To: <aJn_xi5dVD3-imnz@macbook.local>
References: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
 <aJmgCv4wgl-IHupn@macbook.local>
 <2ca7082120df5e1ad6a29582d6dfb215@bugseng.com>
 <aJn_xi5dVD3-imnz@macbook.local>
Message-ID: <179776cb8b5b5dd265af01238cf8eedd@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-11 16:35, Roger Pau Monné wrote:
> On Mon, Aug 11, 2025 at 11:37:46AM +0200, Nicola Vetrini wrote:
>> On 2025-08-11 09:47, Roger Pau Monné wrote:
>> > On Sun, Aug 10, 2025 at 03:03:53PM +0200, nicola.vetrini@gmail.com
>> > wrote:
>> > > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> > >
>> > > The enforced toolchain baseline for clang is version 11,
>> > > therefore this logic is effectively dead code.
>> > >
>> > > No functional change.
>> > >
>> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
>> >
>> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>> >
>> > > ---
>> > > Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
>> > > ---
>> > >  xen/common/coverage/llvm.c   | 4 ----
>> > >  xen/include/xen/self-tests.h | 9 +--------
>> > >  2 files changed, 1 insertion(+), 12 deletions(-)
>> > >
>> > > diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
>> > > index 50d7a3c5d301..517b2aa8c202 100644
>> > > --- a/xen/common/coverage/llvm.c
>> > > +++ b/xen/common/coverage/llvm.c
>> > > @@ -44,12 +44,8 @@
>> > >      ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
>> > >  #endif
>> > >
>> > > -#if __clang_major__ >= 4 || (__clang_major__ == 3 &&
>> > > __clang_minor__ >= 9)
>> > >  #define LLVM_PROFILE_VERSION    4
>> > >  #define LLVM_PROFILE_NUM_KINDS  2
>> > > -#else
>> > > -#error "clang version not supported with coverage"
>> > > -#endif
>> >
>> > Rant: most of the LLVM coverage stuff is already kind of dead code, as
>> > the format of the data changes between versions and there's no way for
>> > LLVM to generate the blob itself using a builtin function or
>> > similar.  We haven't kept up with new formats, and now it's not
>> > possible to parse the output coverage data when using newish LLVM
>> > versions.
>> >
>> > Linux converts it's LLVM coverage data to gcov format (which AFAIK is
>> > way more stable), and exports it in gcov format.  We should consider
>> > importing that from Linux.
>> >
>> > Thanks, Roger.
>> 
>> Fair point. Generally I found coverage reports generated using LLVM 
>> tooling
>> a bit more informative than gcov's, but I don't know how much work 
>> would it
>> be to adapt Xen for newer versions of LLVM.
> 
> It's a pain because they keep changing the blob format between
> versions, so we would basically need code in Xen to be able to
> generate the right blob for each possible clang version.
> 
> It would be helpful if clang provided the helpers to generate the
> coverage data in a version agnostic way, but so far I haven't found a
> way to do it.  I've raised a question with upstream LLVM project, but
> no replies:
> 
> https://github.com/llvm/llvm-project/issues/123034
> 
> Regards, Roger.

Perhaps the "coverage" and "llvm-cov" tag might help get more traction; 
there is at least one developer working on the source-based code 
coverage area in the past months with various improvements.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

