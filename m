Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54AEAEBB80
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 17:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027744.1402260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVAqP-00060b-Ia; Fri, 27 Jun 2025 15:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027744.1402260; Fri, 27 Jun 2025 15:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVAqP-0005y5-G4; Fri, 27 Jun 2025 15:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1027744;
 Fri, 27 Jun 2025 15:18:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uVAqO-0005xx-2J
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 15:18:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uVAqN-005LM2-0x;
 Fri, 27 Jun 2025 15:18:23 +0000
Received: from amontsouris-682-1-55-1.w90-87.abo.wanadoo.fr ([90.87.218.1]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uVAqM-00DMPi-34;
 Fri, 27 Jun 2025 15:18:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=XAIVYsToANYHv+QClJmtZ2ptOEbCFh6lWZcNRa3kXP8=; b=VVrY5tjottgWDDwLj5w4dt/8wy
	QZXSWrQgwntm3EayaJBgFXKwX/v7huB8J77y/rVgU3k/1K592xdThLl7Ip9IeUgCeF046GfgXBbrE
	/aY/6odeeE0FW0XfwlgHtbOkW1r8o27wvKXBA+arv7+ohMBnLjEm9pjj4bFyMsfh2nSU=;
Date: Fri, 27 Jun 2025 17:18:20 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: Re: [XEN PATCH] automation/eclair: Make report browsing URL
 configurable.
Message-ID: <aF62POQJZViSYexn@l14>
References: <2c0003504925e6f62b0bb1a13711c206e40f9393.1750919773.git.nicola.vetrini@bugseng.com>
 <aF0cGgut4-CZka3J@l14>
 <194c24271abdadf062cab1b0f80a6fdc@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <194c24271abdadf062cab1b0f80a6fdc@bugseng.com>

On Fri, Jun 27, 2025 at 10:39:21AM +0200, Nicola Vetrini wrote:
> On 2025-06-26 12:08, Anthony PERARD wrote:
> > On Thu, Jun 26, 2025 at 08:38:18AM +0200, Nicola Vetrini wrote:
> > > +eclairReportHost="${MACHINE_HOST:-saas.eclairit.com}"
> > > +eclairReportPort="${MACHINE_PORT:-3787}"
> > > +eclairReportUrlPrefix="https://${eclairReportHost}:${eclairReportPort}"
> > 
> > Please, don't make the port number mandatory. Can you merge both host
> > and port in the same variable? This part seems to be called "authority":
> > 
> >     https://en.wikipedia.org/wiki/URL#Syntax
> > 
> > Also, don't use `MACHINE` as prefix/namespace for these new variables,
> > in a pipeline context, "machine" could be many things. Maybe
> > "ECLAIR_REPORT_HOST" for this one? With the default been:
> > 
> >     ECLAIR_REPORT_HOST=saas.eclairit.com:3787
> > 
> 
> I can merge host and port and change the variable prefix, but I think there
> is a misunderstanding. This address is used both as the base for report
> browsing and pushing the results.

Well, the patch is all about "report browsing URL" as stated in the
subject.

> While we should alter the latter (e.g.,
> ECLAIR_REPORT_PROXY_HOST) to point to the proxy so that the proxy is shown

"proxy"? That's implementation detail, there's no need to know that the
host used to browse the result is different than the host where the
result are stored. (I mean having "proxy" in the name of the variable
holding detail of how to access the reports, been a part of an url or
just the host)

> in the CI logs, the address where the results are pushed is fixed and set in
> the docker runner env. This is not ideal, but I didn't find a better way
> with GitLab CI to let the analysis push locally.

Having the configuration for where to push the result in the runner env
seems like the best option to me, if that report server is tied to the
eclair runner.

> > > diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> > > index 0a2353c20a92..7020eaa0982f 100755
> > > --- a/automation/scripts/eclair
> > > +++ b/automation/scripts/eclair
> > > @@ -1,4 +1,15 @@
> > > -#!/bin/sh -eu
> > > +#!/bin/sh -eux
> > > +
> > > +# Runner-specific variables
> > > +ex=0
> > > +export "$(env | grep MACHINE_ARTIFACTS_ROOT)" || ex=$?
> > > +[ "${ex}" = 0 ] || exit "${ex}"
> > 
> > That's a really complicated way to check a variable is set...
> > Exporting a variable that's already in env isn't useful, and I think
> > `ex` is only ever set to `0`. It seems that `dash` just exit if you do
> > `export=""`.
> > 
> > You could simply do:
> > 
> >     : ${MACHINE_ARTIFACTS_ROOT:?Missing MACHINE_ARTIFACTS_ROOT variable}
> >     : ${MACHINE_ECDF_DIR:?Missing MACHINE_ECDF_DIR variable}
> > 
> > To check that the variables are set. Or nothing, if you add `set -u` to
> > the script (instead of the one -u in the sheband which might be ignored
> > if one run `sh ./eclair` instead of just `./eclair`.) Also the variable
> > should come from the env, as nothing sets it, so no need to for that.
> > 
> > ( The `:` at the begining of the line is necessary, and behave the same
> > way as `true` does. We need it because ${parm:?msg} is expanded.)
> > 
> > Or you could use `if [ -z "${param}" ]` if ${param:?msg} is too obscure.
> > We would just have "parameter not set" instead of a nicer message, due
> > to `set -u`.
> > 
> 
> I agree it is ugly and counterintuitive, but the core idea here is that the
> variable is set but not exported for some reason, so just `export VAR` does
> not behave in the same way as the incantation `export "$(env | grep
> MACHINE_ARTIFACTS_ROOT)"` iirc. I'll double check if there's a better way to
> achieve this (other than switching to bash in the shebang).

Isn't that script `./eclair` the beginning of the script? I can't find
anything that `source` this file so it must be. Which mean, if
MACHINE_ARTIFACTS_ROOT is set, it is exported, because nothing sets it
between the beginning of the script and this line. So there's no need to
check that the variable is exported (if it is not exported, it is a bug
in the shell).

The only thing left to do is to check that it is set and non-zero
length. But I still wonder why you do that here, since "action.settings"
also check the variable and use a default value.

There's no need to use bash for this. (They are plenty of reason to use
bash instead of posix shell, but that is just not one of them.)

Cheers,

-- 
Anthony PERARD

