Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5A825C96
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 23:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662389.1032474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLszd-0000dZ-Dv; Fri, 05 Jan 2024 22:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662389.1032474; Fri, 05 Jan 2024 22:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLszd-0000bS-An; Fri, 05 Jan 2024 22:48:45 +0000
Received: by outflank-mailman (input) for mailman id 662389;
 Fri, 05 Jan 2024 22:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PmVw=IP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLszb-0000bM-H0
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 22:48:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90bf74c6-ac1c-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 23:48:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D9086B81E09;
 Fri,  5 Jan 2024 22:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774ECC433C7;
 Fri,  5 Jan 2024 22:48:35 +0000 (UTC)
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
X-Inumbo-ID: 90bf74c6-ac1c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704494916;
	bh=aU1WDkSjgKaa2cgEWCoozERaFcSneIEV3tBWAd/2mPw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rUER8ZBQ2G8uDOSDRwOAxQoJ+iPyGgVCDmkcj3volmt+LR/YNLMog4EmInVw7qf2e
	 LZdLkknke3o2PQJtHLXcvEkMu6lY7YN3BSwIHEX9jxPfdbC6CeECoBRWzDbPQpTooM
	 cR/qwnly+ae7mAq0dZsC54f9TGiyogJ5dlzCg8V4tKpZA8bmQCT2xXsXFdWtL6bG05
	 HzyNpsSA7gPkYGAMFZR5US8URUbPVsK1SDm9v+ZqIQfNlpcmn5NowIFEqHqlY5lLDB
	 mFUuN9V/VHhbPhQcl2c7Ug42lvPZuKYvC+ZObQ6Dyv1+DQPtEfqKD5J09EiA8HsGvh
	 2PNIouH4yI6kQ==
Date: Fri, 5 Jan 2024 14:48:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, consulting@bugseng.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
In-Reply-To: <6a39fe3e-524f-4e39-81bc-ffb3d48ba306@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2401051445120.3675@ubuntu-linux-20-04-desktop>
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com> <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com> <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com> <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
 <1330c757-1ca3-4b07-898b-799cbfa67e8a@suse.com> <6a39fe3e-524f-4e39-81bc-ffb3d48ba306@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-291384912-1704494916=:3675"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-291384912-1704494916=:3675
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 5 Jan 2024, Federico Serafini wrote:
> Hello everyone,
> 
> On 21/12/23 13:41, Jan Beulich wrote:
> > On 21.12.2023 13:01, Nicola Vetrini wrote:
> > > Hi Andrew,
> > > 
> > > On 2023-12-21 12:03, Andrew Cooper wrote:
> > > > On 21/12/2023 10:58 am, Jan Beulich wrote:
> > > > > On 21.12.2023 11:53, Federico Serafini wrote:
> > > > > > Remove declarations of __put_user_bad() and __get_user_bad()
> > > > > > since they have no definition.
> > > > > > Replace their uses with a break statement to address violations of
> > > > > > MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
> > > > > > terminate every switch-clause").
> > > > > > No functional change.
> > > > > > 
> > > > > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > > > > ---
> > > > > > Several violations of Rule 16.3 come from uses of macros
> > > > > > get_unsafe_size() and put_unsafe_size().
> > > > > > Looking at the macro definitions I found __get_user_bad() and
> > > > > > __put_user_bad().
> > > > > > I was wondering if instead of just adding the break statement I can
> > > > > > also remove
> > > > > > such functions which seem to not have a definition.
> > > > > No, you can't. Try introducing a caller which "accidentally" uses the
> > > > > wrong size. Without your change you'll observe the build failing (in
> > > > > a somewhat obscure way, but still), while with your change bad code
> > > > > will silently be generated.
> > > > 
> > > > The construct here is deliberate.  It's a build time assertion that bad
> > > > sizes aren't used.
> > > > 
> > > > __bitop_bad_size() and __xsm_action_mismatch_detected() are the same
> > > > pattern in other areas of code too, with the latter being more explicit
> > > > because of how it's wrapped by LINKER_BUG_ON().
> > > > 
> > > > 
> > > > It is slightly horrible, and not the most obvious construct for
> > > > newcomers.  If there's an alternative way to get a build assertion, we
> > > > could consider switching to a new pattern.
> > > 
> > > would you be in favour of a solution with a BUILD_BUG_ON in the default
> > > branch followed by a break?
> > > 
> > > default:
> > >       BUILD_BUG_ON(!size || size >=8 || (size & (size - 1)));
> > >       break;
> > 
> > I don't think this would compile - BUILD_BUG_ON() wants a compile-time
> > constant passed.
> 
> What do you think about adding the following macro to compiler.h:
> 
> #define static_assert_unreachable(identifier) \
>     asm("unreachable " #identifier " reached")
> 
> It expands to an invalid assembly instruction that will lead to a
> customizable error message generated by the assembler instead of the
> linker (anticipating the error detection).
> 
> The use of this macro will indicate a program point considered
> unreachable (and as such removed) by the static analysis performed by the
> compiler, even at an optimization level -O0.
> 
> An example of use is in the default case of put_unsafe_size():
> 
> default: static_assert_unreachable(default);
> 
> In case a wrong size will be used, the following message will be
> generated:
> 
> ./arch/x86/include/asm/uaccess.h: Assembler messages:
> ./arch/x86/include/asm/uaccess.h:257: Error: no such instruction: `unreachable
> default reached'
> 
> 
> Note that adopting the macro and discussing its definition are two
> separate things:
> I think we can all agree on the fact that the use of such macro improves
> readability, so I would suggest its adoption.
> Whereas for its definition, if you don't like the invalid asm
> instruction, we could discuss for a different solution, for example,
> the following is something similar to what you are doing now:
> 
> #define static_assert_unreachable(identifier) \
>     extern void identifier(void);             \
>     identifier()
> 
> 
> Note also that the problem of the missing break statement (that violates
> Rule 16.3) is still present, it could be addressed by adding the break
> or deviating for such special cases, do you have any preferences?

So overall for clarity you are suggesting:


diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 7443519d5b..7e7ef77e49 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -208,7 +205,9 @@ do {                                                                       \
     case 8:                                                                \
         put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
         break;                                                             \
-    default: __put_user_bad();                                             \
+    default:                                                               \
+        static_assert_unreachable(default);                                \
+        break;                                                             \
     }                                                                      \
     clac();                                                                \
 } while ( false )


I prefer static_assert_unreachable(default) over __put_user_bad()
because it is even clearer about its intent and still generates a
build-time error.

Regarding the addition of the break, I think that's OK for me. But I am
guessing that Jan will prefer to add static_assert_unreachable to
docs/misra/deviations.rst like we did for BUG() so that we don't need to
add the break.
--8323329-291384912-1704494916=:3675--

