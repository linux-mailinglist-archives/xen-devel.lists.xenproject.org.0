Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543FC54F9BF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 17:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351478.578122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2DRK-0000D6-Cj; Fri, 17 Jun 2022 14:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351478.578122; Fri, 17 Jun 2022 14:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2DRK-0000AX-8Z; Fri, 17 Jun 2022 14:59:14 +0000
Received: by outflank-mailman (input) for mailman id 351478;
 Fri, 17 Jun 2022 14:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI7C=WY=citrix.com=prvs=160677330=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o2DRI-0000AQ-4C
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 14:59:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a16967e-ee4e-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 16:59:10 +0200 (CEST)
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
X-Inumbo-ID: 0a16967e-ee4e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655477950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q3ozQLSS4NjZzgsa97J9WQApnN44hx5YtzaZmsKsTCY=;
  b=VzRz7gjQFGANolwBcbAy2hoIfe++YslgqTfRRDoAQBCvliwNR0e1faOP
   fjV2dCdaGR+YbWdZoCbIXCsdDDPTBJCY/IidatITNpC4T6oQYX2nslDt7
   tLvRtxM5B8C7R7G2uMna4nucJRuFgktjyWaTqSzn+ZAjfMJEJ/8xsCq/v
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73872615
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9EU24qJ+rCYNfepwFE+R1ZUlxSXFcZb7ZxGr2PjKsXjdYENS0TIBy
 DMaXmuEb6zfYTH1KY1wat+1900P7JTTyNEyTAVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3Nc22YTR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OtxlJ/oTjozBP3ztu8QSQliM3w5FqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQq2OO
 JBHMGcHgBLoakVyFAooKb0C27ms30fHYyF4rg+5nP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77ncIFBQcWF+/oP+4ok2zQdRSL
 woT4CVGhao4+VGvT9L9dwalu3PCtRkZM/JSDuk75Qel2qfSpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9d0689e+TkCmIaRc7JmIYdRUkEEwu7Iy2yG0stS4jXuqPAYbs0ICoRWqom
 WjXxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5F4NvMMPYSPzMPUfj2eN5yMCnMDd+SnNDKiIPrKinLAqHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHmIrdZPdAhQdxDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:Y1Ekt61TqPGczkPIzqr3rwqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="scan'208";a="73872615"
Date: Fri, 17 Jun 2022 15:59:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2 3/4] build: set PERL
Message-ID: <YqyWuIDP0FVAR7mr@perard.uk.xensource.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220614162248.40278-4-anthony.perard@citrix.com>
 <7c76c81a-d781-8ffb-f68a-ece5487ad01f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7c76c81a-d781-8ffb-f68a-ece5487ad01f@suse.com>

On Wed, Jun 15, 2022 at 08:11:10AM +0200, Jan Beulich wrote:
> On 14.06.2022 18:22, Anthony PERARD wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -22,6 +22,7 @@ PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null)
> >  export PYTHON		?= $(PYTHON_INTERPRETER)
> >  
> >  export CHECKPOLICY	?= checkpolicy
> > +export PERL		?= perl
> >  
> >  $(if $(filter __%, $(MAKECMDGOALS)), \
> >      $(error targets prefixed with '__' are only for internal use))
> 
> Considering my patch yesterday that moved the exporting of CC etc, I
> wonder if - at the very least for consistency - this and the neighbouring
> pre-existing exports shouldn't all be moved below the inclusion of
> ./Config.mk as well. After all ./config might override any of those.
> (Yes, the ones here don't prevent such overriding, but only as long as
> there aren't any further make quirks.)

Sounds good, we can move CHECKPOLICY and PERL, but there's a problem
with PYTHON. Config.mk define a different value for PYTHON, so the one
in xen/Makefile needs to be set before including ./Config.mk.

Thanks,

-- 
Anthony PERARD

