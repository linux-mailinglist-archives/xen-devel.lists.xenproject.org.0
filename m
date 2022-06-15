Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F654C639
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349953.576189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJD-0008NK-DE; Wed, 15 Jun 2022 10:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349953.576189; Wed, 15 Jun 2022 10:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJD-0008Ji-8s; Wed, 15 Jun 2022 10:31:35 +0000
Received: by outflank-mailman (input) for mailman id 349953;
 Wed, 15 Jun 2022 10:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9BPj=WW=citrix.com=prvs=158bd2e8d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o1QJB-0007YZ-IL
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:31:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 524352f7-ec96-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:31:32 +0200 (CEST)
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
X-Inumbo-ID: 524352f7-ec96-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655289092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3jVoqXBbnZF/v6+a2duf5OFs0kzx0CUP0rJ2G7z0xw8=;
  b=P+K/iU8aoheOrcKc2lZQpOUoUqCUmzso2w7uiJcJEYeP6PHcDEYwP2Gh
   jbJ+jCInsAQIvTwyaPfk0Xosqcc1/qqiiMbcDq6VOkzvGekI2x6cUF6ua
   sYZmlBijSdoSjQTMV9wEotAIAB7cmi68oSOpssEQZuICc1aGcasMKA1pQ
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76205995
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:M5hvlqN32UVFb6/vrR22l8FynXyQoLVcMsEvi/4bfWQNrUp03zZSx
 2VLWDyBbP+OYmL9fN4gPdi2oEoC78LSx4RhSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn29Iw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 Mdp7p6/GToQEveTmMAgChtcSRhwMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRQ6yGO
 ptINFKDajzbbEEQNmxLJKs9lfeK2in5UgJflVas8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c/BdCfEg4QeBjI/d+R+EB3MsRyRELtchsaceRyEu1
 1KPt8PkA3poqrL9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iL0hqknNQYZeKYLv0d3RJGjyx
 2qzoidr0t3/kvU3O7WHEUHv2mzx+8KQEVRrum07TUr+sFonOdfNi5iArAGCsK0edNvxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNJWfh4B3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CK2JNIEXPMcrJFTWlM2LWaJ39zm1+HXAbIllY
 cvLGSpSJS1y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfNE98taQLWBshgtf/siFiEq
 L53aprVoyizpcWjO0E7B6ZIdQBURZX6bLirw/FqmhmrfVM4Rzt7Ua6NqV7jEqQ895loei7z1
 inVcidlJJDX3xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:iDjJf6n/3BhyFlE1A2Z2Pnwt7ZvpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.91,300,1647316800"; 
   d="scan'208";a="76205995"
Date: Wed, 15 Jun 2022 11:31:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2 1/4] build,include: rework shell script for
 headers++.chk
Message-ID: <Yqm06hdvXE2caKpq@perard.uk.xensource.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220614162248.40278-2-anthony.perard@citrix.com>
 <09b49900-9215-f2a2-d521-a79cf5ce5f0f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <09b49900-9215-f2a2-d521-a79cf5ce5f0f@suse.com>

On Wed, Jun 15, 2022 at 08:37:42AM +0200, Jan Beulich wrote:
> On 14.06.2022 18:22, Anthony PERARD wrote:
> > diff --git a/xen/include/Makefile b/xen/include/Makefile
> > index 6d9bcc19b0..49c75a78f9 100644
> > --- a/xen/include/Makefile
> > +++ b/xen/include/Makefile
> > @@ -158,13 +158,22 @@ define cmd_headerscxx_chk
> >  	    touch $@.new;                                                     \
> >  	    exit 0;                                                           \
> >  	fi;                                                                   \
> > -	$(foreach i, $(filter %.h,$^),                                        \
> > -	    echo "#include "\"$(i)\"                                          \
> > +	get_prereq() {                                                        \
> > +	    case $$1 in                                                       \
> > +	    $(foreach i, $(filter %.h,$^),                                    \
> > +	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
> > +		$(i)$(close)                                                  \
> > +		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
> > +			-include c$(j))";;))                                  \
> > +	    esac;                                                             \
> 
> If I'm reading this right (indentation looks to be a little misleading
> and hence one needs to count parentheses) the case statement could (in
> theory) remain without any "body". As per the command language spec I'm
> looking at this (if it works in the first place) is an extension, and
> formally there's always at least one label required. Since we aim to be
> portable in such regards, I'd like to request that there be a final
> otherwise empty *) line.

When looking at the shell grammar at [1], an empty body seems to be
allowed. But I can add "*)" at the end for peace of mind.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_10_02

As for misleading indentation, I've got my $EDITOR to show me matching
parentheses, so I don't need to count them. But if I rewrite that
function as following, would it be easier to follow?

+	get_prereq() {                                                        \
+	case $$1 in                                                           \
+	$(foreach i, $(filter %.h,$^),                                        \
+	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
+		$(i)$(close)                                                  \
+		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
+			-include c$(j))";;))                                  \
+	*) ;;                                                                 \
+	esac;                                                                 \
+	};                                                                    \


> > +	};                                                                    \
> > +	for i in $(filter %.h,$^); do                                         \
> > +	    echo "#include "\"$$i\"                                           \
> >  	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
> >  	      -include stdint.h -include $(srcdir)/public/xen.h               \
> > -	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
> > +	      `get_prereq $$i`                                                \
> 
> While I know we use back-ticked quoting elsewhere, I'd generally
> recommend to use $() for readability. But maybe others view this
> exactly the other way around ...

Well, in Makefile it's `` vs $$(). At least, we don't have to write
$$$(open)$(close) here :-).

I guess $$(get_prereq $$i) isn't too bad here, I'll replace the
backquote.

> And a question without good context to put at: Isn't headers99.chk in
> similar need of converting? It looks only slightly less involved than
> the C++ one.

It doesn't really need converting at the moment, because there's only
two headers to check, so the resulting command line is small. But
converting it at the same time is probably a good idea to avoid having
two different implementations of the header check.

Thanks,

-- 
Anthony PERARD

