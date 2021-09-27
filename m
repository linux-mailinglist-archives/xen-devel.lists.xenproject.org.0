Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799A64193F5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 14:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196781.349704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUpYW-0007aX-0d; Mon, 27 Sep 2021 12:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196781.349704; Mon, 27 Sep 2021 12:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUpYV-0007Y9-Sx; Mon, 27 Sep 2021 12:16:23 +0000
Received: by outflank-mailman (input) for mailman id 196781;
 Mon, 27 Sep 2021 12:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ztgo=OR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mUpYU-0007Y3-Gx
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 12:16:22 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaedc7b3-97a2-4f4e-b5f4-ec30717f7fad;
 Mon, 27 Sep 2021 12:16:21 +0000 (UTC)
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
X-Inumbo-ID: aaedc7b3-97a2-4f4e-b5f4-ec30717f7fad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632744980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ISlS+b238wHQMto59LXb1YFZ97aWUwHgdekuHbUPwtU=;
  b=IBD3xLZtmlWFRKC4Ak1vMiD94S4MCDwFHkGCGe/4vH9lk3uS2RpQ2mwg
   y11BF/0/WDg8dZIAU0Of1yojmW91if/BG8skQc5ss7YZgmlu3pS/nsgbW
   v6LPXhyLYkg3rt9p95l4aDEA2zRffJTcBakI/Q6VbZhMP5u/oN0HA6flk
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uCk6CuAccNsBOtg5btp5+HlDZuV5MX8AbitJcUPVQKaAJpbtzcztasK8hb/Jx8w5z/5zbSmGvx
 6t0MeUGSndKfeUxXUmjKGxdZsKw2lDCIs8zM96UGxm+qZ3rvclx2gLoogtRU0dBErpMLGn7BhQ
 keqJGQNbmU5KwtcdPsQxjqMFUsB2AH7bOMqXBBHCj/lKXL/I4SDGg6oTyHPQOV5zA99Uv6LmEn
 ePkrPnbBax4M+t0+3C9XX0UgR/HtvZbDCL8C6QLFdgY67nEutIUHwH5ZIsT3sxBE5Dv7MjWKxk
 ooOqpaLtrp5DMRPau7cgFmAz
X-SBRS: 5.1
X-MesageID: 53694552
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZZOE6Kr5xiyKlbvxJ6gR5UGMETFeBmKhYhIvgKrLsJaIsI4StFCzt
 garIBmAPvneYmryfN91b4W/o0pQu5/Wn4RrQAZtrSxhFH8QpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncw0ILmW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnayBGCVuYIrloc1DXRtKVHhZAKh49ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 pFHOGYyMU6ojxtnM1w0T49igbyRqXjHKjhZq1u2mfMT2j2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfNgCf6VYQ6BLC+sPlwjzW7ynQIDRwKVXOyufSjllOlQNVbN
 lAV/Sw166M18SSDQtbxUhKiqVaYrxUcXJxWCOR85waTooLW6QuEAmkPThZadccr8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMa5/HzrYd1iQjAJv5iD6ydntDzASv3w
 T2BsG45nbp7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xjNINaziOauB0HGF4/RSa9++c1y/s
 VFRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy327zoiHyJOi89Bk7dB8wbZpUEdP8S
 BWL0T698qO/K5dDgUVfTYWrF4wOxLXsGM7pX/TZBjalSsMqL1fWlM2CiFT54owMrKTOuf1hU
 Xt4WZz1ZZr/NUiB5GHvLwv6+eV3rh3SPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BbJHUm0wDAbOuOHO/HWsvwbYidiFT6Xfe8ZA/SwJ+ClA+RDFJ5wH5m9vNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QioLVV8bZr4m9ShTFXV1ZT6AgiF/Ca7yvPZ3X8ZmJtEPqb08pcOYu
 tFYIq1s9NwUEW+Zk9ncBLGgxLFfmOOD31nTYHb1PGZlL/aNhWXho7fZQ+cmzwFWZgLfiCf0i
 +HIOtrzTcVRSgJ8ItzRbf7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYlqmuMPAOkFtQnZB7FrJnkfA369f1/ucIxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOzQas3/EVMXKA40Vci51KkZymvI8PA4AETm/ysrrrCJZlpfYkuXgytHIborbI58m
 bU9uNQb4hCUgwYxNorUlThd8mmBIyBSU6gjsZ1GUobnhhBylwNHaJ3YTCT3/IuOe5NHNUxze
 m2Yg6/LhrJ9wEveciVsSSiRjLQF3Zle6gpXyFIiJkiSnouXj/A66xRd7DArQ1kH1R5Aye9yZ
 jBmOkAdyX9iJNu0aByvh1yRJjw=
IronPort-HdrOrdr: A9a23:XjjCGKFtnxdyg1lCpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.85,326,1624334400"; 
   d="scan'208";a="53694552"
Date: Mon, 27 Sep 2021 13:16:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel De
 Graaf" <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Ping: [XEN PATCH v2] build: add --full to version.sh to guess
 $(XEN_FULLVERSION)
Message-ID: <YVG2Ae95bRNSLVJf@perard>
References: <20210909143306.466836-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210909143306.466836-1-anthony.perard@citrix.com>

Anyone to review this?

Thanks.

On Thu, Sep 09, 2021 at 03:33:06PM +0100, Anthony PERARD wrote:
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
>   $(XEN_EXTRAVERSION) and $(XEN_VENDORVERSION) in cases where those
>   are overridden by command line argument of make.
>   (we can't just use make's "export" because it doesn't work when
>   parsing the makefile which is when $(shell ) get's executed for
>   POLICY_FILENAME, so it wouldn't work when running `make -C
>   tools/flask/policy XEN_VENDORVERSION=-os`.)
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

-- 
Anthony PERARD

