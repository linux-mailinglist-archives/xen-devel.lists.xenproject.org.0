Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05F7FCCE1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 03:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643619.1004017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8AKA-0001Bs-PS; Wed, 29 Nov 2023 02:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643619.1004017; Wed, 29 Nov 2023 02:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8AKA-00019K-ML; Wed, 29 Nov 2023 02:29:14 +0000
Received: by outflank-mailman (input) for mailman id 643619;
 Wed, 29 Nov 2023 02:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8AK9-00019E-Ta
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 02:29:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1414aa8d-8e5f-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 03:29:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6ADAE618C4;
 Wed, 29 Nov 2023 02:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106D6C433C8;
 Wed, 29 Nov 2023 02:29:07 +0000 (UTC)
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
X-Inumbo-ID: 1414aa8d-8e5f-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701224949;
	bh=RzsuCVwLd15MMEd9XUdfTTzzWRcj7yIRLzITMi7NZa8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZELDhWPlBFfJvfHC0esNouTrS3TfqHm2PygRnlJ805msRCr4AdQOWNEAxVc5lWo2c
	 fVLs/nZY+UQISNuCEtDj6Bcrwbtv7yJpIAsl1USnBUpf6hNZY5QtdRyhTOMhvQ/llY
	 OaVC5etBJvy/XuTDdjDGRbRDRA5AoTYcpZvXgme0x+0l0tK0MA8HSfOgyAkHEQYtdM
	 hy7mt/8frpCw2egMGWQWdtyFwxhbHacuJnRFPCvnH6jJu1sQlNw4kHeQe9KJGLvibO
	 xgluLcK2/0vrVg58KSzc0KYRClioRAaIk9BFosD4EiRzTKJr/brDBVjaIOtGXgb9rF
	 eh+3EHZGKrCUg==
Date: Tue, 28 Nov 2023 18:29:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
In-Reply-To: <9d1e385e-152e-404a-8d8b-47c5ac08d76a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311281802110.3533093@ubuntu-linux-20-04-desktop>
References: <20231127144156.361656-1-michal.orzel@amd.com> <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org> <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com> <b0127019-4976-42e3-bde1-643cc56f18b0@xen.org> <16b73400-b592-4a1a-9b87-8c49aad9208d@amd.com>
 <9d1e385e-152e-404a-8d8b-47c5ac08d76a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Nov 2023, Julien Grall wrote:
> On 28/11/2023 18:15, Michal Orzel wrote:
> > On 28/11/2023 18:09, Julien Grall wrote:
> > > On 28/11/2023 18:00, Michal Orzel wrote:
> > > > On 28/11/2023 17:14, Julien Grall wrote:
> > > > > On 27/11/2023 15:41, Michal Orzel wrote:
> > > > > > Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where
> > > > > > prompt
> > > > > > attention to undefined behavior issues, notably during CI test runs,
> > > > > > is
> > > > > > essential. When enabled, this option causes Xen to panic upon
> > > > > > detecting
> > > > > > UBSAN failure (as the last step in ubsan_epilogue()).
> > > > > 
> > > > > I have mixed opinions on this patch. This would be a good one if we
> > > > > had
> > > > > a Xen mostly free from UBSAN behavior. But this is not the case at
> > > > > least
> > > > > on arm32. So we would end up to stop at the first error. IOW, we would
> > > > > need to fix the first error before we can see the next one.
> > > > Well, this patch introduces a config option disabled by default.
> > > 
> > > I understood this is disabled by default... I am pointing out that I am
> > > not convinced about the usefulness until we are at the stage where Xen
> > > is normally not reporting any USBAN error.
> > > 
> > > > If we end up enabling it for CI for reasons* stated by Andrew, then the
> > > > natural way
> > > > of handling such issues is to do the investigation locally.
> > > 
> > > This will not always be possible. One example is when you are only able
> > > to reproduce some of the USBAN errors on a specific HW.
> > > 
> > > > Then, you are not forced
> > > > to select this option and you can see all the UBSAN issues if you want.
> > > 
> > > See above, I got that point. I am mostly concerned about the implication
> > > in the CI right now.
> > > 
> > > > 
> > > > > 
> > > > > So I feel it would be best if the gitlab CI jobs actually check for
> > > > > USBAN in the logs and fail if there are any. With that, we can get the
> > > > > full list of UBSAN issues on each job.
> > > > Well, I prefer Andrew suggestion (both [1] and on IRC), hence this
> > > > patch.
> > > > 
> > > > *my plan was to first fix the UBSAN issues and then enable this option
> > > > for CI.
> > > 
> > > That would have been useful to describe your goal after "---". With that
> > > in mind, then I suggest to revisit this patch once all the UBSAN issues
> > > in a normal build are fixed.
> > But this patch does not enable this option for CI automatically, right?
> 
> Correct.
> 
> > Why are you so keen to push it back?
> 
> I have been pushing back because your commit message refers to the CI
> specifically and today this would not really work (read as I would not be
> happy if this option is enabled in the CI right now at least on arm32).
> 
> If you want to fail a CI job for UBSAN today, then we need to find a different
> approach so we can get the full list of UBSAN error rather than fixing one,
> retry and then next one.
> 
> > Is it because you see no point in this option other than for the upstream CI
> > loop?
> 
> Even in the upstream CI loop, I am a little unsure about this approach. At
> least, I feel I would want to see all the reports at once in the CI.
> 
> But this is not really a strong feeling.
> 
> > I find it useful on a day-to-day
> > Xen runs, and I would for sure enable it by default in my config not to miss
> > UBSAN failures.
> 
> Fair enough. I view USBAN issues the same a WARN_ON. They all need to be
> investigated. So now you have an inconsistent policy.
> 
> Are you are also intending to switch WARN_ON() to fatal? If not, then why
> would UBSAN warnings more important that the other warnings?

I think it would be useful to be able to turn WARN_ONs into BUG_ONs
selectively by component. We could turn all WARN_ONs into BUG_ONs but
that's a bit extreme.

It is true that this patch is a bit... "ad-hoc". But given its
simplicity it doesn't hurt and I think it is nice-to-have for UBSAN. So
I would go with that.

But if we want something more sophisticated, here is an idea. The
concept is that one could specify warn=arch/arm/domain_build.c in the
Xen command line to change a WARN_ON in arch/arm/domain_build.c into a
BUG. I tested it with a WARN_ON I added on purpose and it works.


diff --git a/xen/common/symbols.c b/xen/common/symbols.c
index 133b580768..c78d2963c3 100644
--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -20,6 +20,10 @@
 #include <public/platform.h>
 #include <xen/guest_access.h>
 #include <xen/errno.h>
+#include <xen/param.h>
+
+char opt_warn[30] = "";
+string_param("warn", opt_warn);
 
 #ifdef SYMBOLS_ORIGIN
 extern const unsigned int symbols_offsets[];
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 1793be5b6b..60e14cdb85 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -12,12 +12,19 @@
 #include <xen/xmalloc.h>
 #include <xen/string.h>
 
+extern char opt_warn[30];
+
 #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
 #define WARN_ON(p)  ({                  \
     bool ret_warn_on_ = (p);            \
                                         \
     if ( unlikely(ret_warn_on_) )       \
-        WARN();                         \
+    {                                   \
+        if ( !strcmp(__FILE__, opt_warn) ) \
+            BUG();                      \
+        else                            \
+            WARN();                     \
+    }                                   \
     unlikely(ret_warn_on_);             \
 })
 

