Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190A9C4C66
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 03:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834225.1249849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAgSM-00072g-1B; Tue, 12 Nov 2024 02:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834225.1249849; Tue, 12 Nov 2024 02:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAgSL-0006zh-UX; Tue, 12 Nov 2024 02:16:37 +0000
Received: by outflank-mailman (input) for mailman id 834225;
 Tue, 12 Nov 2024 02:16:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuV+=SH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tAgSK-0006zb-Fc
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 02:16:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20fd25ea-a09c-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 03:16:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F3F8F5C4FF8;
 Tue, 12 Nov 2024 02:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C013C4CECF;
 Tue, 12 Nov 2024 02:16:26 +0000 (UTC)
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
X-Inumbo-ID: 20fd25ea-a09c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjIwZmQyNWVhLWEwOWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzc3NzkxLjQzMTI3OSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731377789;
	bh=oa1+xHpcMHV73zocEiwaawaRlGbG5b1JrM0uKndQVss=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e8o9oCMRn2KDj9tkRXimJrap3nzbwg7q8ajdcLN4Lidn9iLmtWyiTXjK2OFPvUfA0
	 WvIamApK4pyH03OsN9EM+Qf5Lmui3DcYzadXBdLp+kkT5C6TPE/saUgm4K0QP9zyOR
	 d+JsTU7a9ontmdmSp/NBNlY8nk1D54CWjXrB63bqt6fnX8vdFHqmxHgz5vGK7KsO7p
	 bgxYoo2Pk5IreMVo3X1Lf8aCbYWOcIlwbHbyVjMKJmtkdlzDYX6+D1ebAEnnFh4Fkm
	 qZAA3OfCoGLCdGL4Xmy6OqCtdnQu9UJkbogTj41ub3jhT0FT+oWlnqhE6bkpWLaP8r
	 F397XV3+M7wUw==
Date: Mon, 11 Nov 2024 18:16:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/3] x86/emul: define pseudo keyword fallthrough
In-Reply-To: <57d407cf-3f3a-43f6-9aa4-05cac5b50c46@suse.com>
Message-ID: <alpine.DEB.2.22.394.2411111816210.14721@ubuntu-linux-20-04-desktop>
References: <cover.1730880832.git.federico.serafini@bugseng.com> <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com> <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com> <alpine.DEB.2.22.394.2411101820430.14721@ubuntu-linux-20-04-desktop>
 <57d407cf-3f3a-43f6-9aa4-05cac5b50c46@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Nov 2024, Jan Beulich wrote:
> On 11.11.2024 03:24, Stefano Stabellini wrote:
> > On Wed, 6 Nov 2024, Jan Beulich wrote:
> >> On 06.11.2024 10:04, Federico Serafini wrote:
> >>> The pseudo keyword fallthrough shall be used to make explicit the
> >>> fallthrough intention at the end of a case statement (doing this
> >>> through comments is deprecated).
> >>>
> >>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>> ---
> >>>  xen/arch/x86/x86_emulate/x86_emulate.h | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>
> >> When you had asked my privately on Matrix, I specifically said: "Adding
> >> the pseudo-keyword to x86-emulate.h (not x86_emulate.h) is probably best,
> >> unless problems with that approach turn up." Even if identical re-
> >> definitions are deemed fine, I for one consider such bad practice. Yet
> >> by playing with this file (and outside of any relevant #ifdef) means
> >> there will be such a re-definition when building Xen itself.
> >>
> >> In fact the patch subject should also already clarify that the auxiliary
> >> definition is only needed for the test and fuzzing harnesses.
> > 
> > Hi Jan, I don't understand this comment.
> > 
> > You say "playing with this file (and outside of any relevant #ifdef)"
> > but actually the changes are within the #ifndef
> > __X86_EMULATE_H__/#endif. What do you mean?
> 
> "relevant" was specifically to exclude the guard #ifdef. And the remark
> was to avoid the #define to merely be moved into or framed by an
> "#ifndef __XEN__".
> 
> > You say "Adding the pseudo-keyword to x86-emulate.h (not x86_emulate.h)
> > is probably best". I am not very familiar with x86-isms but the only
> > x86-emulate.h I can find is ./tools/tests/x86_emulator/x86-emulate.h
> > which is not a header that would help define anything for the Xen build?
> 
> But that's the whole point: We _have_ "fallthrough" as a pseudo-keyword
> already for the Xen build. For it to be usable in the emulator files, it
> particularly needs to be made available for the test and fuzzing
> harnesses. And that without interfering with what the Xen build has.
> Hence why it wants to go into precisely that file, where all other build
> compatibility definitions also live.

OK. So if I get this right, we need the below instead of patch #1 in
this series?


diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 00abc829b0..380eb8abff 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -233,4 +233,14 @@ void emul_test_put_fpu(
     enum x86_emulate_fpu_type backout,
     const struct x86_emul_fpu_aux *aux);
 
+/*
+ * Pseudo keyword 'fallthrough' to make explicit the fallthrough intention at
+ * the end of a case statement.
+ */
+#if (!defined(__clang__) && (__GNUC__ >= 7))
+# define fallthrough        __attribute__((__fallthrough__))
+#else
+# define fallthrough        do {} while (0)  /* fallthrough */
+#endif
+
 #endif /* X86_EMULATE_H */

