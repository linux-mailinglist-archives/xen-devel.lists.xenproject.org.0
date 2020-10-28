Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476A29D16D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 19:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13813.34548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXpxI-0004dZ-1c; Wed, 28 Oct 2020 18:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13813.34548; Wed, 28 Oct 2020 18:13:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXpxH-0004dA-UY; Wed, 28 Oct 2020 18:13:51 +0000
Received: by outflank-mailman (input) for mailman id 13813;
 Wed, 28 Oct 2020 18:13:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61hT=ED=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kXpxG-0004d5-5H
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 18:13:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16e3adbb-f6b6-41cd-860c-2dec95519e15;
 Wed, 28 Oct 2020 18:13:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=61hT=ED=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kXpxG-0004d5-5H
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 18:13:50 +0000
X-Inumbo-ID: 16e3adbb-f6b6-41cd-860c-2dec95519e15
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 16e3adbb-f6b6-41cd-860c-2dec95519e15;
	Wed, 28 Oct 2020 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603908829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iJRY66IfuqDwktqFQFJqHM15N+oXk8Kse5TIrgqQc/w=;
  b=ejuqCs2C8Ws0WOawEQLOX+bfGA6c8x1eHrxoLVdzPSM4QrWV6Oybfwr/
   c9ts+75jXC4wOF+cUgLZYe9JFR890NIjknv0+QqxmlkhwKIOTB74lck/9
   mv+0UJpKAKxuPu74uNKClmKHEhdccviQVRTCJ1DzLSb+hl7LdvLrQCm60
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EP5JZDbke5FPw731Eg1l8W+oCE7VrAssW9K+/7chfRPmLOd6M1U4OdmFfdebedk/DUYFQVMtT4
 LAt+FolsY0LRCBLFqTu+koHCGnw2hFZXPd0cvoJ4sDS/Wj23onJqojKAs4OR1MD3I5pHczOTxl
 v3FhKcXatoe13erkiJP2Li9lFK7KR3vTQz2Apkb61zQ1TWGS96iE88qynTGJ5d2X1nAyMQRIWu
 sbNmvr7wXrbvMwU7Ce6kPJp/T4oSjYgCURfhvFyQEgowBYHi0vHIGxRzpfPtcH99lLVmHnAYaq
 VN4=
X-SBRS: None
X-MesageID: 30004285
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,427,1596513600"; 
   d="scan'208";a="30004285"
Date: Wed, 28 Oct 2020 18:13:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>,
	Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
Message-ID: <20201028181344.GA273696@perard.uk.xensource.com>
References: <20201026204151.23459-1-olaf@aepfle.de>
 <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
 <20201027112703.24d55a50.olaf@aepfle.de>
 <bc7a5e73-af27-45ae-5d82-f53176cd43a9@suse.com>
 <24025dd2-2c61-7e92-a9b1-2433eea2e909@citrix.com>
 <3880bcbd-9281-10a5-7de5-f73bcf74557a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3880bcbd-9281-10a5-7de5-f73bcf74557a@suse.com>

On Tue, Oct 27, 2020 at 12:06:56PM +0100, Jan Beulich wrote:
> On 27.10.2020 11:57, Andrew Cooper wrote:
> > On 27/10/2020 10:37, Jan Beulich wrote:
> >> On 27.10.2020 11:27, Olaf Hering wrote:
> >>> Am Tue, 27 Oct 2020 11:16:04 +0100
> >>> schrieb Jan Beulich <jbeulich@suse.com>:
> >>>
> >>>> This pattern is used when a rule consists of multiple commands
> >>>> having their output appended to one another's.
> >>> My understanding is: a rule is satisfied as soon as the file exists.
> >> No - once make has found that a rule's commands need running, it'll
> >> run the full set and only check again afterwards.
> > 
> > It stops at the first command which fails.
> > 
> > Olaf is correct, but the problem here is an incremental build issue, not
> > a parallel build issue.
> > 
> > Intermediate files must not use the name of the target, or a failure and
> > re-build will use the (bogus) intermediate state rather than rebuilding it.
> 
> But there's no intermediate file here - the file gets created in one
> go. Furthermore doesn't make delete the target file(s) when a rule
> fails? (One may not want to rely on this, and hence indeed keep multi-
> part rules update intermediate files of different names.)

What if something went badly enough and sed didn't managed to write the
whole file and make never had a chance to remove the bogus file?

Surely, this patch is a strict improvement to the build system.

Cheers,

-- 
Anthony PERARD

