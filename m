Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF936BCF36
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510548.788372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmWI-0005V1-FB; Thu, 16 Mar 2023 12:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510548.788372; Thu, 16 Mar 2023 12:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmWI-0005Sk-C9; Thu, 16 Mar 2023 12:15:46 +0000
Received: by outflank-mailman (input) for mailman id 510548;
 Thu, 16 Mar 2023 12:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umpT=7I=citrix.com=prvs=432886d25=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pcmWG-0005Se-UP
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:15:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 445b8d98-c3f4-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:15:42 +0100 (CET)
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
X-Inumbo-ID: 445b8d98-c3f4-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678968942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UUG73Of9VZy8loR0betAoy6xSd0TgfI9WHae+0+/62M=;
  b=JeSFXKWpG11D8FMlc1hSwxL2p+tHMAdvS4lXMbE4tzM51uLi4sQkjctl
   k5KKrG4FlJ8n6hCu4ndBDrMFpSXJrk7iqkYwmYM6onsao/qFW3gTqvdeM
   kMd/e3ECVNg2cJiI3wT4fLsr0NSvk8riJZIXx3ctgeMobLwNlFQt1kuYC
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103522644
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iUe/NqJaJm4UKkiYFE+R+pUlxSXFcZb7ZxGr2PjKsXjdYENS0jQDy
 GEaWDvTbv2NMTTzeotzat/i9kkGuZeBx9I1TgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVgPa4jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5uJD0S/
 vI0Lws0UTeNi9mZm6+dRNZj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZ4IxBzG+
 j6uE2LRPB0nEIOizGO5qVGOl9TsnXPhfLI4PejtnhJtqALKnTFCYPEMbnO+qOO8g1SzWPpeL
 VIV4SskqaUu9E2tQcL5Vhf+q3mB1jYVQ9dKGvc2wB2MwKHTpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRutPQAFIGlEYjULJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6itQ1i274dockw7pqc81z8rGmxgJb2QVtgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jsYyjJ5fK6fTgAahwzRosmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTpF7ZFjOJyl31jmws/oKwXKDz2uYdymVbPEetVWLdwRrlRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbMuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVBxIClAam1SacQehIA1g6AI7SsV9EhSpTFUQR0ZyAhyRLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:Rgcqj6MMZgCFkcBcTsWjsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ+VBbAnwYz+wyDxXw3Sn9Qtsp
 uIqpIOauEY22IK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="103522644"
Date: Thu, 16 Mar 2023 12:15:04 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 5/7] tools: Use -s for python shebangs
Message-ID: <613f42a1-aa09-41fa-bf4c-0bf0424cc089@perard>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-6-andrew.cooper3@citrix.com>
 <626de813-99aa-6d44-c895-73e9cdd19967@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <626de813-99aa-6d44-c895-73e9cdd19967@citrix.com>

On Tue, Mar 14, 2023 at 02:50:48PM +0000, Andrew Cooper wrote:
> On 14/03/2023 2:15 pm, Andrew Cooper wrote:
> > diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> > index 29ad0513212f..04b3995cc0f6 100644
> > --- a/tools/pygrub/Makefile
> > +++ b/tools/pygrub/Makefile
> > @@ -7,7 +7,7 @@ PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
> >  INSTALL_LOG = build/installed_files.txt
> >  
> >  setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" \
> > -           $(PYTHON) setup.py
> > +           $(PYTHON) setup.py --executable="$(PYTHON_PATH) -s"
> 
> /sigh
> 
> CI has gone a wall of red to this.  Apparently --executable is only
> known by setuputils, not distutils.
> 
> Which is a problem because it means the main pygrub executable won't get
> a corrected shebang, as it doesn't pass through install-wrap.
> 
> In the short term, I could fix that by moving the main pygrub binary out
> of setup.py and do it manually.  Thoughts?

Or do the fixing in "setup.py", https://stackoverflow.com/a/17099342 :-)
But that probably more work that necessary.
Doing the binary installation in the Makefile sounds fine.

Thanks,

-- 
Anthony PERARD

