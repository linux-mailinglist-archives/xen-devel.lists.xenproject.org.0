Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A591756F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748201.1155791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMH8i-0003D5-IJ; Wed, 26 Jun 2024 01:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748201.1155791; Wed, 26 Jun 2024 01:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMH8i-0003AV-Eh; Wed, 26 Jun 2024 01:08:00 +0000
Received: by outflank-mailman (input) for mailman id 748201;
 Wed, 26 Jun 2024 01:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMH8h-000396-Cl
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:07:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85df33cf-3358-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 03:07:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6BC2A60B5A;
 Wed, 26 Jun 2024 01:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17D5C32781;
 Wed, 26 Jun 2024 01:07:54 +0000 (UTC)
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
X-Inumbo-ID: 85df33cf-3358-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719364076;
	bh=4SDBa1rGC+JAmFHN8wUJHSYJnttc1J9qCaPA5Zao9Qw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oIKcu5vqDwddllv63t/JvZMNjMaXF4vtpTM6VKBWZbraRk9KLobxKw3mdFNRQI2od
	 driqSiI1csITukOtzk6gRxfDU7xHr2AG2qAQhMekpsJqLrVBBfPGbLCu2+5iA00NGT
	 k5g5im1G2N+nfl47fd+i9AyQtN4KFSJ2li+8OAHhb5fA+UOkxKuQz7dBnzCv1IVuGV
	 Mq/fM4RH53G5HQGdWh/w8raPwFJgLOCFz75rxaepQVCMGWTpFH+9lC0VKagCSSwCAp
	 vyPxxHMHhosVurnOenXOVLP9xmjjdcthHu13SJr1EFDMCATDz39InQdwlMrwYpY4ew
	 mZ16n2K36RDAw==
Date: Tue, 25 Jun 2024 18:07:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v4] automation/eclair: extend existing deviations of
 MISRA C Rule 16.3
In-Reply-To: <c2098800-2565-4eff-90b5-0d285862bf26@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406251806240.3635@ubuntu-linux-20-04-desktop>
References: <90044547484dac6fcb4748ae8758e38234b3261a.1719297249.git.federico.serafini@bugseng.com> <c2098800-2565-4eff-90b5-0d285862bf26@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jun 2024, Jan Beulich wrote:
> On 25.06.2024 08:46, Federico Serafini wrote:
> > Update ECLAIR configuration to deviate more cases where an
> > unintentional fallthrough cannot happen.
> > 
> > Tag Rule 16.3 as clean for arm.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> To add to my reply on the other series: As per above you even acked ...
> 
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -330,12 +330,34 @@ Deviations related to MISRA C:2012 Rules:
> >       - Tagged as `deliberate` for ECLAIR.
> >  
> >     * - R16.3
> > -     - Switch clauses ending with continue, goto, return statements are safe.
> > +     - Statements that change the control flow (i.e., break, continue, goto,
> > +       return) and calls to functions that do not return the control back are
> > +       \"allowed terminal statements\".
> >       - Tagged as `safe` for ECLAIR.
> >  
> >     * - R16.3
> > -     - Switch clauses ending with a call to a function that does not give
> > -       the control back (i.e., a function with attribute noreturn) are safe.
> > +     - An if-else statement having both branches ending with one of the allowed
> > +       terminal statemets is itself an allowed terminal statements.
> > +     - Tagged as `safe` for ECLAIR.
> > +
> > +   * - R16.3
> > +     - An if-else statement having an always true condition and the true
> > +       branch ending with an allowed terminal statement is itself an allowed
> > +       terminal statement.
> > +     - Tagged as `safe` for ECLAIR.
> > +
> > +   * - R16.3
> > +     - A switch clause ending with a statement expression which, in turn, ends
> > +       with an allowed terminal statement (e.g., the expansion of
> > +       generate_exception()) is safe.
> > +     - Tagged as `safe` for ECLAIR.
> > +
> > +   * - R16.3
> > +     - A switch clause ending with a do-while-false the body of which, in turn,
> > +       ends with an allowed terminal statement (e.g., PARSE_ERR_RET()) is safe.
> > +       An exception to that is the macro ASSERT_UNREACHABLE() which is
> > +       effective in debug build only: a switch clause ending with
> > +       ASSERT_UNREACHABLE() is not considered safe.
> >       - Tagged as `safe` for ECLAIR.
> 
> ... this explicit statement regarding ASSERT_UNREACHABLE().

You are right... I read the statement about ASSERT_UNREACHABLE() only in
the context of do-while-false. Let's continue the discussion in the
other email thread.

