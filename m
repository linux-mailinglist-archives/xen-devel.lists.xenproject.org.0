Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC1147417B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 12:29:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246610.425298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5zJ-00055O-C1; Tue, 14 Dec 2021 11:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246610.425298; Tue, 14 Dec 2021 11:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5zJ-00052f-8L; Tue, 14 Dec 2021 11:28:53 +0000
Received: by outflank-mailman (input) for mailman id 246610;
 Tue, 14 Dec 2021 11:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7Ra=Q7=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mx5zI-00052Z-HY
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 11:28:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 021cafdf-5cd1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 12:28:51 +0100 (CET)
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
X-Inumbo-ID: 021cafdf-5cd1-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639481331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7H6Ek+0WUR6KXWgs7sDLcHzMH3wOPYLluORhQ7+YqqA=;
  b=NKUWTNtBVGtezrD4VmlzBhN99h8cMI2ChE+wBmOFtZvqReAc77qSzYqy
   fnH5Q3NuH56UDeSRLA9bdvN8FjNoJUvoeLCqFt3mB+JwT0SutCNftW5+t
   rK87wv7j0X/4YDyq4xyXCjuOH6Aw6F0nYLSPkMDfK0QoDqiAxd5RydJ7f
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: a+r3lEELtNgy5tt0jrMaNNkcKYUtKOBq8fKHtxeCTYxkwmPv7kUJrataz+Jt6mzudzGXab3Fwh
 E26DjK867qflkE8CLDCHrbuqCDyBR+1CEXu2EdqHjvQbDlCQwUrimL7BZV1vAJan6/OHJjqCyl
 SR35KczzFJJy07i8AyNuLTEUjiXIJCKxbd5AdLqAnRHBmP0QxNbkkf46zVbdH0NcwlksgelKVA
 7HIA14pU2i/h3+AdqdFeGpsjPa8cNcF11uD7GGxHrLHtWwWQhTunAJ3Zjcw4skjVqE/BllLxkp
 1yocOJOrpzXg0nHNpovKqxOB
X-SBRS: 5.1
X-MesageID: 62040645
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4nCCz6J+aDYt3PcZFE+REpIlxSXFcZb7ZxGr2PjKsXjdYENSgjcBx
 jMeDTuEOK7cZmWhedt2aY/nph5U6sWGz4RnSwdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH140Eg6x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB21mv1s8
 dMck6ChRDwrHrTWldsAfBhHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glq3pwWQ6qDD
 yYfQSMsVRL+RzpDAG8OB5szwcuigX3gLSIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 G3c+H/iKgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiEKBkwMlXYt2L/w30wOt07DZ3Bu2B3dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8pDGJGT9bxgbQ+0RqmBNzGJrVml
 CJb8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtEMumgmeRk2Y5ZsldrVj
 Kn741w5CHh7ZiTCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2l3hW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:e1dIwaNLJl2cwcBcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="62040645"
Date: Tue, 14 Dec 2021 11:28:45 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs: Don't recursively expand MAJOR ?= $(shell
 ...)
Message-ID: <Ybh/7ZYFKWTe6Cps@perard>
References: <20211213190449.4830-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211213190449.4830-1-andrew.cooper3@citrix.com>

On Mon, Dec 13, 2021 at 07:04:49PM +0000, Andrew Cooper wrote:
> Something slightly weird is going on.  Before this, the exact number of hits
> that verson.sh gets isn't stable, even when running repeat incremental builds.
> I suspect this means we've got a lurking parallel build issue.

It could simply be that `make` have decided that one of the Makefile
have been updated and thus `make` need to reexecute. And I'm pretty sure
it would be because of the generation of those .*.d2 files from .*.d
dependency files.

-- 
Anthony PERARD

