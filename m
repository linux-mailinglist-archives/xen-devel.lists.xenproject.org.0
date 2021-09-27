Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF3641942C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 14:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196812.349729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUpgF-0001Sp-68; Mon, 27 Sep 2021 12:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196812.349729; Mon, 27 Sep 2021 12:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUpgF-0001R1-34; Mon, 27 Sep 2021 12:24:23 +0000
Received: by outflank-mailman (input) for mailman id 196812;
 Mon, 27 Sep 2021 12:24:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNz3=OR=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mUpgE-0001Qv-44
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 12:24:22 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5a1e1f2-1f8d-11ec-bc44-12813bfff9fa;
 Mon, 27 Sep 2021 12:24:18 +0000 (UTC)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1632745443098424.98610012230733;
 Mon, 27 Sep 2021 05:24:03 -0700 (PDT)
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
X-Inumbo-ID: d5a1e1f2-1f8d-11ec-bc44-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1632745450; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SJO7sMW+0XmbjpryKWFx860kK4E+kpEhrGE2xvlPJcqIN/bN2RnK6tnZW7ySIokX3qqQywyZ1hIxoDmnNSw/gcWt3NVSiZhbThNIInkXuo952b53IHJc28crtBSDX9FKb0JJYIcgmv9g1XwSM5pOTHecpUdnmE10B+5oahBsTl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1632745450; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vtWywQbS2r9ACqp5dmOkIUXcJ7Z9kRfzvZcjloTeh+E=; 
	b=YMiNUbdcpwK3d1hft3PyZpnrR4gUqv5t+zwNk7jKyQWWEvyqhqZP71TgZvIOPJLUcrfW9fX7PGhUWUA8/2LMmMDOOcAZN5idnp2FScgQii4Biq2mPIJfamY6Jtpwq2ZMS8pU40eNv3g4gm+zyK4WqS5y4rrKmAujquVoZm21Mk4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1632745450;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vtWywQbS2r9ACqp5dmOkIUXcJ7Z9kRfzvZcjloTeh+E=;
	b=nZdiAVpmkmGat0iCB46yeSpgarEcaH75x3i1aKRBXcAPJwAoky/SQguFOxy2iX5R
	XE2ijTNnVnW0PO2XqlHXIGCUAStpJEzUqaiKgRKrz7NLOBNIoT69D4NUfeHv6801+Ih
	sG6jxQS6EREXbS8KU8PR3Og4eOXBse7UXkD8LEvQ=
Date: Mon, 27 Sep 2021 08:24:03 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Anthony PERARD" <anthony.perard@citrix.com>
Cc: "xen-devel" <xen-devel@lists.xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	"Ian Jackson" <iwj@xenproject.org>, "Wei Liu" <wl@xen.org>,
	"George Dunlap" <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"Daniel De Graaf" <dgdegra@tycho.nsa.gov>
Message-ID: <17c27364f04.c7fbc53a24194.6291604602462820326@apertussolutions.com>
In-Reply-To: <20210909143306.466836-1-anthony.perard@citrix.com>
References: <20210909143306.466836-1-anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v2] build: add --full to version.sh to guess
 $(XEN_FULLVERSION)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Apologies for any formatting issues, responding via web mail client.

---- On Thu, 09 Sep 2021 10:33:06 -0400 Anthony PERARD <anthony.perard@citrix.com> wrote ----

 > Running $(MAKE) like that in a $(shell ) while parsing the Makefile 
 > doesn't work reliably. In some case, make will complain with 
 > "jobserver unavailable: using -j1.  Add '+' to parent make rule.". 
 > Also, it isn't possible to distinguish between the output produced by 
 > the target "xenversion" and `make`'s own output. 
 >  
 > Instead of running make, this patch "improve" `version.sh` to try to 
 > guess the output of `make xenversion`. 
 >  
 > In order to have version.sh works in more scenario, it will use 
 > XEN_EXTRAVERSION and XEN_VENDORVERSION from the environment when 
 > present. As for the cases were those two variables are overridden by a 
 > make command line arguments, we export them when invoking version.sh 
 > via a new $(XEN_FULLVERSION) macro. 
 >  
 > That should hopefully get us to having ./version.sh returning the same 
 > value that `make xenversion` would. 
 >  
 > This fix GitLab CI's build job "debian-unstable-gcc-arm64". 
 >  
 > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com> 
 > --- 
 > v2: 
 > - use $(SHELL) to execute ./version.sh 
 > - get XEN_EXTRAVERSION from the environment if exist 
 > - use XEN_VENDORVERSION when exist in the environment 
 > - introduce a new macro $(XEN_FULLVERSION) whose jobs is to export 
 >  $(XEN_EXTRAVERSION) and $(XEN_VENDORVERSION) in cases where those 
 >  are overridden by command line argument of make. 
 >  (we can't just use make's "export" because it doesn't work when 
 >  parsing the makefile which is when $(shell ) get's executed for 
 >  POLICY_FILENAME, so it wouldn't work when running `make -C 
 >  tools/flask/policy XEN_VENDORVERSION=-os`.) 
 > --- 
 >  tools/Rules.mk                     |  5 +++++ 
 >  tools/flask/policy/Makefile.common |  2 +- 
 >  version.sh                         | 18 +++++++++++++++++- 
 >  3 files changed, 23 insertions(+), 2 deletions(-) 
 >  
 > diff --git a/tools/Rules.mk b/tools/Rules.mk 
 > index 2907ed2d3972..b022da3336c4 100644 
 > --- a/tools/Rules.mk 
 > +++ b/tools/Rules.mk 
 > @@ -6,6 +6,11 @@ all: 
 >  -include $(XEN_ROOT)/config/Tools.mk 
 >  include $(XEN_ROOT)/Config.mk 
 >  
 > +XEN_FULLVERSION=$(shell env \ 
 > +    XEN_EXTRAVERSION=$(XEN_EXTRAVERSION) \ 
 > +    XEN_VENDORVERSION=$(XEN_VENDORVERSION) \ 
 > +    $(SHELL) $(XEN_ROOT)/version.sh --full $(XEN_ROOT)/xen/Makefile) 
 > + 
 >  export _INSTALL := $(INSTALL) 
 >  INSTALL = $(XEN_ROOT)/tools/cross-install 
 >  
 > diff --git a/tools/flask/policy/Makefile.common b/tools/flask/policy/Makefile.common 
 > index bea5ba4b6a40..e5ed58200e75 100644 
 > --- a/tools/flask/policy/Makefile.common 
 > +++ b/tools/flask/policy/Makefile.common 
 > @@ -35,7 +35,7 @@ OUTPUT_POLICY ?= $(BEST_POLICY_VER) 
 >  # 
 >  ######################################## 
 >  
 > -POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory) 
 > +POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION) 
 >  POLICY_LOADPATH = /boot 
 >  
 >  # List of policy versions supported by the hypervisor 
 > diff --git a/version.sh b/version.sh 
 > index e894ee7e0469..c6a5692c1982 100755 
 > --- a/version.sh 
 > +++ b/version.sh 
 > @@ -1,5 +1,21 @@ 
 >  #!/bin/sh 
 >  
 > +opt_full=false 
 > +while [ $# -gt 1 ]; do 
 > +    case "$1" in 
 > +        --full) opt_full=true ;; 
 > +        *) break ;; 
 > +    esac 
 > +    shift 
 > +done 
 > + 
 >  MAJOR=`grep "export XEN_VERSION" $1 | sed 's/.*=//g' | tr -s " "` 
 >  MINOR=`grep "export XEN_SUBVERSION" $1 | sed 's/.*=//g' | tr -s " "` 
 > -printf "%d.%d" $MAJOR $MINOR 
 > + 
 > +if $opt_full; then 
 > +    extraversion=$(grep "export XEN_EXTRAVERSION" $1 | sed 's/^.* ?=\s\+//; s/\$([^)]*)//g; s/ //g') 
 > +    : ${XEN_EXTRAVERSION:=${extraversion}${XEN_VENDORVERSION}} 
 > +else 
 > +    unset XEN_EXTRAVERSION 
 > +fi 
 > +printf "%d.%d%s" $MAJOR $MINOR $XEN_EXTRAVERSION 
 > -- 
 > Anthony PERARD 
 >  
 > 

Provided there are no issues with rest of the changes, I see no issues made to the Flask Policy makefile.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

