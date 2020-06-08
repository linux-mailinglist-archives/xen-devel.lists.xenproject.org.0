Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB11F1767
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiFli-0000gq-UL; Mon, 08 Jun 2020 11:16:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXsd=7V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiFlh-0000gl-UV
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:16:41 +0000
X-Inumbo-ID: 86ce38ae-a979-11ea-b266-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86ce38ae-a979-11ea-b266-12813bfff9fa;
 Mon, 08 Jun 2020 11:16:41 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3MoO6lT8qK+E37b6AUehW/KVTtG5FjljyXCcTFex33Gnu1h6nGl2zJ7xwJjWJZN63PcJLbcd7Z
 sKorSWfwZ0iUVkwikJSb9NkSjROKzAi93SKEZYCgyFKWwUFXwAE3QrX9CpzwSlQFJc+zMc3wGL
 Goki9x1iudqrfB7NBZveo4wtk9sgrheIFUzm9hGwvrL6gnP3I1Qv8EqSjwratHUa8Bt7S8Xbzc
 khi8l2seYZJIf8geQmwFMjZj1NEo23tClI1sk5+vBlZ8BqfjZalqF5D+3cJE7F6H+OttywQlqo
 9HE=
X-SBRS: 2.7
X-MesageID: 19812439
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19812439"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24286.7700.36742.982395@mariner.uk.xensource.com>
Date: Mon, 8 Jun 2020 12:16:36 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
In-Reply-To: <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-2-george.dunlap@citrix.com>
 <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile"):
> So as written this turns out not to work correctly:  `gengotypes.py` spits out syntactically valid but unformatted Go code, and then runs `go fmt` on it to get the right style (including tabs, &c).  But the error code of `go fmt` isn’t checked; so on a system without go installed, if the build system decides it needs to re-run `gengotypes.py` for whatever reason, the build succeeds but the tree ends up “dirtied” with an unformatted version fo the generated text.

And `go fmt' overwrites its input file ?

The lost error is due to using `os.system' which does not raise an
exception.  The python 3 docs for `os.system' say
  | The subprocess module provides more powerful facilities for
  | spawning new processes and retrieving their results; using that
  | module is preferable to using this function. See the Replacing
  | Older Functions with the subprocess Module section in the
  | subprocess documentation for some helpful recipes.
And the recipe suggests
  | sts = os.system("mycmd" + " myarg")
  | # becomes
  | sts = call("mycmd" + " myarg", shell=True)
  | Notes:
  | * Calling the program through the shell is usually not required.
    
This is not particularly helpful advice because subprocess.call, like
os.system, does not raise an exception when things go wrong.  But it
does have a "more realistic example" immediately afterwards which does
actually check the error code.

You wanted subprocess.check_call.  IDK which Python versions have
subprocess.check_call.

Ian.

