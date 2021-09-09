Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1DD4048FE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182996.330900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHws-0006x4-B9; Thu, 09 Sep 2021 11:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182996.330900; Thu, 09 Sep 2021 11:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHws-0006uQ-6x; Thu, 09 Sep 2021 11:10:30 +0000
Received: by outflank-mailman (input) for mailman id 182996;
 Thu, 09 Sep 2021 11:10:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o0l/=N7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mOHwq-0006uK-1p
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:10:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31e1fb9a-2485-4bec-9601-8cff0be7f33b;
 Thu, 09 Sep 2021 11:10:26 +0000 (UTC)
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
X-Inumbo-ID: 31e1fb9a-2485-4bec-9601-8cff0be7f33b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631185826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BtkMclQ2vZA6mEV1ncKTUnBps1S9dGrsDmiV7418blI=;
  b=OX1cst4WHWbokfyOQBnOnxqeQ2loR8QDjViB25uhopsm+6LtoKndrpQQ
   99Keoc1yvPH390ixRTkABziHUbH+ZmtFGtDD4BOear1u1hwa5JqWlvroA
   uxfRS2uDZENDKYf1zRE9vUgwivl/cUl/0Ru6Qh0WM94cpjfQhIPXX82fU
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oeS8OCS6MLWm29N85pjyiZpxkOflXHTsDGYpLD1INgTv74mkHaRqwfwq2iXExnnPy2ePlITjqD
 QYTdkQ5InAMGqh5KgDpoEIlhNXcv+oMxMuW76g1k5IyfyONsElIg2hgcZrEszm9KqAeLK7loto
 dO1wm7CREQ1s4COC2/p/fwIqByjMwgmzI2uzUY6uM8R+45pvbDKzMv7IQgmK76yz0wtmJN7Ce2
 m8Td9cgtWS7MRoKj03ggkbuLfJA6OOiNgTd8GlCOtt8c1FyoUo04KpCpDpi9EWMf/nC9Qh4fk/
 EzoGfhZ2WFxmBZk4nmSQYN0g
X-SBRS: 5.1
X-MesageID: 52353231
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7slNFKFVVSogsWeRpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208,217";a="52353231"
Date: Thu, 9 Sep 2021 12:10:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 2/2] build: add --full to version.sh to guess
 $(XEN_FULLVERSION)
Message-ID: <YTnrnqz7Vt0pugFZ@perard>
References: <20210908095422.438324-1-anthony.perard@citrix.com>
 <20210908095422.438324-3-anthony.perard@citrix.com>
 <be89ae8c-99cf-5385-00a7-d9433e0fc50b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <be89ae8c-99cf-5385-00a7-d9433e0fc50b@suse.com>

On Wed, Sep 08, 2021 at 02:27:17PM +0200, Jan Beulich wrote:
> On 08.09.2021 11:54, Anthony PERARD wrote:
> > --- a/tools/flask/policy/Makefile.common
> > +++ b/tools/flask/policy/Makefile.common
> > @@ -35,7 +35,7 @@ OUTPUT_POLICY ?= $(BEST_POLICY_VER)
> >  #
> >  ########################################
> >  
> > -POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)
> > +POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(XEN_ROOT)/version.sh --full $(XEN_ROOT)/xen/Makefile)
> 
> Shell scripts better get invoked by "$(SHELL) <script>", to avoid
> depending on the script actually being marked as executable (which is
> impossible on some file systems).
> 
> > --- a/version.sh
> > +++ b/version.sh
> > @@ -1,5 +1,18 @@
> >  #!/bin/sh
> >  
> > +opt_full=false
> > +while [ $# -gt 1 ]; do
> > +    case "$1" in
> > +        --full) opt_full=true ;;
> > +        *) break ;;
> > +    esac
> > +    shift
> > +done
> > +
> >  MAJOR=`grep "export XEN_VERSION" $1 | sed 's/.*=//g' | tr -s " "`
> >  MINOR=`grep "export XEN_SUBVERSION" $1 | sed 's/.*=//g' | tr -s " "`
> > -printf "%d.%d" $MAJOR $MINOR
> > +
> > +if $opt_full; then
> > +    EXTRAVERSION=$(grep "export XEN_EXTRAVERSION" $1 | sed 's/^.* ?=\s\+//; s/\$([^)]*)//g; s/ //g')
> > +fi
> > +printf "%d.%d%s" $MAJOR $MINOR $EXTRAVERSION
> 
> I guess you want to clear EXTRAVERSION either prior to the "if" or
> in an "else".

Actually, I'm thinking of writing this instead:
    if $opt_full; then
        extraversion=$(grep "export XEN_EXTRAVERSION" $1 | sed 's/^.* ?=\s\+//; s/\$([^)]*)//g; s/ //g')
        : ${XEN_EXTRAVERSION:=${extraversion}${XEN_VENDORVERSION}}
    else
        unset XEN_EXTRAVERSION
    fi

This would takes care of cases where a packager add XEN_EXTRAVERSION or
XEN_VENDORVERSION to the environment, and I think would produce the same
result as `make xenversion` in that case.

But that leaves the case of running e.g. "make XEN_VENDORVERSION=-neat
xenversion" out, hopefully, no one does that. Otherwise, we might need
"export" or a new macro in the build system (and that would still leave
out someone having "xen/xen-version" file).

:-( I think I just found a package overriding XEN_VENDORVERSION with a
command line argument, the AUR package. So ./version.sh needs help from
the build system:

Maybe

    XEN_FULLVERSION=$(shell env XEN_EXTRAVERSION=$(XEN_EXTRAVERSION) XEN_VENDORVERSION=$(XEN_VENDORVERSION) $(SHELL) $(XEN_ROOT)/version.sh --full $(XEN_ROOT)/xen/Makefile)

or probably just exporting those two var in Config.mk or tools/Rules.mk.

Cheers,

-- 
Anthony PERARD

