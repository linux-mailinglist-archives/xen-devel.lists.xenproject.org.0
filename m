Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F7A31CD98
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85909.160784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2w2-0001CN-Dv; Tue, 16 Feb 2021 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85909.160784; Tue, 16 Feb 2021 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2w2-0001C1-9k; Tue, 16 Feb 2021 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 85909;
 Tue, 16 Feb 2021 16:10:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2w1-0001Bw-CV
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:10:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2w1-0004A8-AJ
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:10:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2w1-00047e-9a
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:10:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2vy-0000kA-5V; Tue, 16 Feb 2021 16:10:42 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=wCbS+McCL2JPV+sCiQ+JDxAUUe/J7CsQjnJ4BiKHHJ0=; b=LipKPbop7/HxsqHVOmxneAfClf
	bEF64tAnQiNlzTRbSazo08aNM/NACpUmD2fZ79gcqi5e9Vr6pikwchvyMztnsuw8XQaZZKqkvl+gs
	dR5kY8P7KasM7uoHD4LMfmqIci3YyS8qwnjcx0AKU0wJAjyCF1ozYF5aezEMU1xQWkBI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24619.61057.971290.452710@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:10:41 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 06/10] stubdom/xenstored: Fix uninitialised variables in lu_read_state()
In-Reply-To: <20210212153953.4582-7-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-7-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 06/10] stubdom/xenstored: Fix uninitialised variables in lu_read_state()"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   xenstored_control.c: In function ‘lu_read_state’:
>   xenstored_control.c:540:11: error: ‘state.size’ is used uninitialized in this
>   function [-Werror=uninitialized]
>     if (state.size == 0)
>         ~~~~~^~~~~
>   xenstored_control.c:543:6: error: ‘state.buf’ may be used uninitialized in
>   this function [-Werror=maybe-uninitialized]
>     pre = state.buf;
>     ~~~~^~~~~~~~~~~
>   xenstored_control.c:550:23: error: ‘state.buf’ may be used uninitialized in
>   this function [-Werror=maybe-uninitialized]
>      (void *)head - state.buf < state.size;
>                     ~~~~~^~~~
>   xenstored_control.c:550:35: error: ‘state.size’ may be used uninitialized in
>   this function [-Werror=maybe-uninitialized]
>      (void *)head - state.buf < state.size;
>                                 ~~~~~^~~~~
> 
> Interestingly, this is only in the stubdom build.  I can't identify any
> relevant differences vs the regular tools build.

  #ifdef __MINIOS__
  static void lu_get_dump_state(struct lu_dump_state *state)
  {
  }

So the compiler is right to complain that

  lu_get_dump_state(&state);
  if (state.size == 0)
          barf_perror("No state found after live-update");

this will use state.size uninitialised.

It's probably just luck that this works at all, if it does,
anywhere...

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

