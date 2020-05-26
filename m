Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875891E27CA
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 18:58:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdct8-00063G-7V; Tue, 26 May 2020 16:57:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdct7-00063B-Gt
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 16:57:13 +0000
X-Inumbo-ID: f1465156-9f71-11ea-a67a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1465156-9f71-11ea-a67a-12813bfff9fa;
 Tue, 26 May 2020 16:57:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Ed4zbgttKkGzIfaAMvpWOXhlhTutbzcPEmuDnZM8pbCvXqxKC4m9CSxobFnlIikgvFyroi9lQO
 cIgQ2WhxACHkxlhldfZXtDV0TRsJkHQT3Mnre6bKvtu4ABZzaL9M4ueaxcK55zf9cNCmhjG7dZ
 cpmm+vyxv3TdptcpeZTgzOIPgnV8avyYTQF23ztnakf7YA8myDfIHWDcNqBdtUkqfIYGPtGUsj
 YjnBWodCwkiP7xVXXMpxfjFn9VWFWpHy00YQ7z8W7fRmJL97Kd6HwRHesM5BWqtfdFLxB/wYj+
 yCo=
X-SBRS: 2.7
X-MesageID: 18829419
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="18829419"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24269.19042.534647.23671@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 17:57:06 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 3/5] libxl: Generate golang bindings in libxl Makefile
In-Reply-To: <B1814837-4E4B-4795-887E-769E3D25608A@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-4-george.dunlap@citrix.com>
 <24269.8019.97048.52370@mariner.uk.xensource.com>
 <B1814837-4E4B-4795-887E-769E3D25608A@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: [PATCH 3/5] libxl: Generate golang bindings in libxl Makefile"):
> tools/Makefile:subdirs-all is implemented as a non-parallel for loop executing over SUBDIRS-y; tools/golang comes after tools/libxl in that list, and so tools/golang:all will never be called until after tools/libxl:all has completed.  This invariant — that tools/golang/Makefile:all must not be called until tools/libxl/Makefile:all has completed must be kept regardless of this patch, since xenlight/Makefile:build depends on other output from tools/libxl/Makefile:all.

I had not spotted this aspect of the situation.  But the toplevel
Makefile is parallel.  I think this means that make -C works between
different directories in tools/.

Provided no-one says `make all install' (which is a thing that people
expect to work but which is already badly broken).

> So as long as nothing else calls tools/libxl:all or tools/libxl:idl-external, this should be safe.  We could add a comments near xenlight/Makefile:idl-gen saying it must only be called from libxl/Makefile:idl-external; and to libxl/Makefile:idl-external saying it must not be called recursively from another Makefile.

So, err, I'm sold on the original patch, I think.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

I'll answer your other comments anyway:

> > Alternatively, move the generated golang files to tools/libxl maybe,
> > and perhaps leave symlinks behind.
> 
> Would that result in the files being accessible to the golang build tools at https://xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight ?  If not, it defeats the purpose of having the files checked into the tree.

Yes.  git can convey symlinks.  (I'm assuming that the golang build
tools fetch the git objects and do git checkout, rather than
trying to download individual raw files from gitweb...)

> > Or convert the whole (of tools/, maybe) to nonrecursive make using eg
> > subdirmk :-).  https://diziet.dreamwidth.org/5763.html
> 
> This isn’t really a practical suggestion: I don’t have time to refactor the entire libxl Makefile tree, and certainly don’t have time by Friday.

Yes, it wasn't a serious suggestion.  Sorry that that apparently
wasn't clear.

Regards,
Ian.

