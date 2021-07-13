Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82F3C7252
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 16:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155434.286934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JVR-00077y-LT; Tue, 13 Jul 2021 14:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155434.286934; Tue, 13 Jul 2021 14:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JVR-000769-IO; Tue, 13 Jul 2021 14:35:29 +0000
Received: by outflank-mailman (input) for mailman id 155434;
 Tue, 13 Jul 2021 14:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8l0=MF=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m3JVP-00075k-C6
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:35:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8feed2a0-e3e7-11eb-8769-12813bfff9fa;
 Tue, 13 Jul 2021 14:35:26 +0000 (UTC)
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
X-Inumbo-ID: 8feed2a0-e3e7-11eb-8769-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626186925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5XNp7hPH+qgdc7zi0i+5iA7KippVl8+xbGSipe7kON0=;
  b=bPLinRGgwwZa2/T6oru35EmC0tmXQ6aim3JgBDjdfr9CqPpn47IaGU8X
   rGcpjyHw2Oe/exJDXkbZHzdtItfnTmUhzRo08aLFkiHA8opJP6MTCEbK1
   heQq2m1USSUMFyL5qoSr3YTsQIiHP/K1ZMxt7LdDz+qMUZ+2/qRvdFo+p
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JoMCBYI15a+j4WB/zUlO/EGuzfPHYN2ZV6EFfZUWZn13E5bKRDvrvquwHyVYG7vji1TsOyy6s7
 U+lDPSC10URGrbk498gCDkEogTIMMoaiiZh/Le0CiviOivSBS9LnDIZX9EAiIgVGp2a1oOzq4n
 FOy0Q4XSB8b/sewkK8ovSo9zNkTxilzKGhzdhovfEs051SxNtcwAaSuiYi+FV+JwjXwS/NC0pj
 wqqA/DtmbZ7USfunoiAHjbKdlMonydspkiYOcl2/U7Srido5jj9heG1IKpbMCOK/1Zn5aHYB4O
 ARA=
X-SBRS: 5.1
X-MesageID: 49810425
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WbM86qMNgEhhZcBcTqKjsMiBIKoaSvp037BL7SBMoHluGfBw+P
 rCoB1273XJYVUqOU3I5+ruBEDoexq1yXcf2+Us1NmZMjXbhA==
X-IronPort-AV: E=Sophos;i="5.84,236,1620705600"; 
   d="scan'208";a="49810425"
Date: Tue, 13 Jul 2021 15:35:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 12/31] build: use subdir-y in test/Makefile
Message-ID: <YO2kqruG8fejtDYl@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-13-anthony.perard@citrix.com>
 <b93fcbc5-8b4f-7d17-7d0a-cd2cbf6fd2fe@suse.com> <YOxeI1Bn1nxNMjb2@perard>
 <65edfaec-4525-c3ff-3658-1088e4b65f9d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <65edfaec-4525-c3ff-3658-1088e4b65f9d@suse.com>

On Tue, Jul 13, 2021 at 09:41:03AM +0200, Jan Beulich wrote:
> On 12.07.2021 17:22, Anthony PERARD wrote:
> > On Wed, Jul 07, 2021 at 05:26:13PM +0200, Jan Beulich wrote:
> >> On 01.07.2021 16:09, Anthony PERARD wrote:
> >>> --- a/xen/test/Makefile
> >>> +++ b/xen/test/Makefile
> >>> @@ -4,15 +4,10 @@ tests all: build
> >>>  
> >>>  ifneq ($(XEN_TARGET_ARCH),x86_32)
> >>>  # Xen 32-bit x86 hypervisor no longer supported, so has no test livepatches
> >>> -SUBDIRS += livepatch
> >>> +subdir-y += livepatch
> >>>  endif
> >>
> >> As per xen/Rules.mk having
> >>
> >> subdir-y := $(subdir-y) $(filter %/, $(obj-y))
> >> obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
> >> ...
> >> subdir-obj-y := $(filter %/built_in.o, $(obj-y))
> >>
> >> this will result in building of livepatch/built_in.o afaict. Is
> >> this an intended but benign side effect?
> > 
> > Actually, nothing in Rules.mk is using $(subdir-y) other than updating
> > it with possible subdir from $(obj-y).
> > Recursion into a subdir only happen if it is listed in $(obj-y) and thus
> > should be part of a built_in.o. Rules.mk doesn't have a mean to recurs
> > otherwise.
> > 
> > So nothing is actually going to try to build livepatch/build_in.o due to
> > $(subdir-y).
> 
> Question then is: Isn't this actually a bug?

No, "obj-y += livepatch/" need to be used instead, to build "livepatch/built_in.o".
Because "$(obj-y)" are objects to be included in a "built_in.o".

-- 
Anthony PERARD

