Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7BB84C1AC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 02:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677227.1053702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWQc-0007ky-TG; Wed, 07 Feb 2024 01:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677227.1053702; Wed, 07 Feb 2024 01:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWQc-0007iN-PV; Wed, 07 Feb 2024 01:08:42 +0000
Received: by outflank-mailman (input) for mailman id 677227;
 Wed, 07 Feb 2024 01:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rXWQb-0007iH-4r
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 01:08:41 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc76b9c-c555-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 02:08:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D061DCE17D5;
 Wed,  7 Feb 2024 01:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082C6C433F1;
 Wed,  7 Feb 2024 01:08:31 +0000 (UTC)
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
X-Inumbo-ID: 6cc76b9c-c555-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707268113;
	bh=RE4r+UEgZmgIeb1PNxcNr1r80Mxzi92RwFhUl438SN8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mLzCTJYqUQgCxHYXkopkHghIM6XuR9AWPoG6ZfhKwNefxIBCL56GKEMHi4X5PeKzM
	 uEb1+//55TbjC8kra08hp8rhON05DtdmbzBp69lWeozB/v5kl/4ax2L3LK2ygBD4VR
	 KE57wHy5XsyAizkkpthv5WyrOJ60wvclF0Gb5/ClGC0ANYShMpNpkZijXEmrkjs7rY
	 gz6kn1crU5ZYxSRaF57Ynniw76/33J1iIu/pVGW3K9NWPaEqZ85y2+IeXD6XtC3+iJ
	 Iq4TZ9kybSj8QhVSDyuQvL0pe7qF+xAc38dichZmaS7ifjLeN/YepKpq6PN6AK+rSh
	 8ceort5VJyDIw==
Date: Tue, 6 Feb 2024 17:08:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
In-Reply-To: <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1706259490.git.federico.serafini@bugseng.com> <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com> <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Feb 2024, Jan Beulich wrote:
> On 26.01.2024 11:05, Federico Serafini wrote:
> > @@ -208,7 +205,7 @@ do {                                                                       \
> >      case 8:                                                                \
> >          put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
> >          break;                                                             \
> > -    default: __put_user_bad();                                             \
> > +    default: STATIC_ASSERT_UNREACHABLE();                                  \
> >      }                                                                      \
> >      clac();                                                                \
> >  } while ( false )
> > @@ -227,7 +224,7 @@ do {                                                                       \
> >      case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
> >      case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
> >      case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
> > -    default: __get_user_bad();                                             \
> > +    default: STATIC_ASSERT_UNREACHABLE();                                  \
> >      }                                                                      \
> >      clac();                                                                \
> >  } while ( false )
> 
> Related to my remark on patch 1 - how is one to know the macro this was
> invoked from, when seeing the resulting diagnostic?

I am not sure what do you mean here... we do get an error like the
following (I added a STATIC_ASSERT_UNREACHABLE for case 4):

./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable

