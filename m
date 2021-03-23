Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE933462A6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 16:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100712.192050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOin1-0000iS-Di; Tue, 23 Mar 2021 15:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100712.192050; Tue, 23 Mar 2021 15:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOin1-0000hN-93; Tue, 23 Mar 2021 15:17:51 +0000
Received: by outflank-mailman (input) for mailman id 100712;
 Tue, 23 Mar 2021 15:17:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOimz-0000bK-Tu
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:17:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOimz-0000XK-Ol
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:17:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOimz-0000SK-Nm
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:17:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOimo-0002LD-P0; Tue, 23 Mar 2021 15:17:38 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=2gDvjd8OQCP+1QoDXLvhYK2Ic14i9IOyWZjYikq7pKI=; b=MM5oyfojrRL+kkTbwYfVuJEEZ6
	RSuyGd2r5meHWA0Kemnl2+7Wjfy9SzaXwHeNPrrCfJRg485b6lyGMRisxZ0yASkzdrIqcmLN1puez
	bx2sCP57K8dbH3U+d792hPF+fdYRhIjj8j0cGLwApL7uOs5RIYBpdrS7tYSZ0pQ8sGr8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24666.1682.595069.435575@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 15:17:38 +0000
To: committers@xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>,
CC: xen-devel@lists.xenproject.org,
    community.manager@xenproject.org
Subject: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow

I think things are looking in reasonable shape.

I intend to branch off the 4.15 stable branch tomorrow.  I will then
turn off debug on that branch.  There will be a commit moratorium in
force for much of the afternoon while the branching is done -
commmitters please check your mail or irc.

Any outstanding patches that have a release-ack but have not yet been
committed should go in ASAP, and certainly by Friday.

I have reviewed my list of blockers and the conversation that followed
and there are just three areas that are still of concern to me:

* io-apic issue on Ryzen 1800X

   Related Qubes issue tracking this:
   https://github.com/QubesOS/qubes-issues/issues/6423
   Information from
     Jan Beulich <jbeulich@suse.com>
     Andrew Cooper <andrew.cooper3@citrix.com>
     Frédéric Pierret <frederic.pierret@qubes-os.org>

  Are we likely to get a fix in the next few days ?

  I think it may be time to reconcile ourselves to not fixing this,
  and deciding on a suitable plan B.  Do we need to put something in
  the release notes, or SUPPORT.md, or implement a mitigation of some
  kind ?

* Subject: Re: xenstore_lib.h and libxenstore API/ABI problems

   In the last mail in that thread, I wrote:   

   | I suggest, instead, that we:
   |
   | In 4.15:
   |
   |  * Retain the current soname, but:
   |  * Delete the tdb internals from the header file and cease to export
   |    those symbols.
   |  * Rename the expanding_buffer and sanitise_value functions, to
   |    properly namespace them, and move them to a private header.
   |
   | This is of course technically a breach of the ABI stability rules but
   | for the reasons I [give above] I don't think it will cause anyone any
   | trouble.

   I don't think I have seen any patches in this area.  I'm concerned
   that this is getting late.  I suspect we may have to punt this to
   xen-next.

 * Release notes (feature list), SUPPORT.md.  This is on my plate,
   although George is helping with the feature list (thanks!)

Thanks,
Ian.

