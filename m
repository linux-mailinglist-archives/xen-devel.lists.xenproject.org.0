Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A280359122F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 16:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385735.621442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMVeK-0008CH-Jv; Fri, 12 Aug 2022 14:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385735.621442; Fri, 12 Aug 2022 14:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMVeK-00089L-Fy; Fri, 12 Aug 2022 14:28:32 +0000
Received: by outflank-mailman (input) for mailman id 385735;
 Fri, 12 Aug 2022 14:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U57A=YQ=citrix.com=prvs=216127e06=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMVeJ-00089F-Ns
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 14:28:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07678af8-1a4b-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 16:28:28 +0200 (CEST)
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
X-Inumbo-ID: 07678af8-1a4b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660314508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=05dqAkiTBhpyxGoV4e1wykpykEwo5G6nfwS+XlTPG4U=;
  b=N/Fjzyerz/3o2T5KckB+FJhsNYM603zIDbbA051t2lN4ktlcKW47jwn+
   R4tAFMwqR6RajkqAGZldAF7nPtIJINVF3IoUPEyj/jVq/l8wgyop1ZQjY
   P+ErELeCf+pitGAj7QhcETIFHm+V0NByt/DBqMOZpWcW5JRi4zI3ZSp7P
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78405149
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:00Z5nKz3Fv2wBqMWADh6t+czxirEfRIJ4+MujC+fZmUNrF6WrkVTy
 2UXDW3VOKuJajD0Kdp+b4m0pE8FsZeEyNNhSAtl+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Eo15K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1QI3sqZIYl99xQOkFx2
 Oc6eCkWYSqc0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5FMhjOCwaYaEEjCMbfprl2LEm
 0vsxW3WKyk1EtaTzROGyn3504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsSiNKYZoovck9SDguy
 3eAhdavDjtq2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHdj7sv1xnyQ+xEK46Ko8bXSSjrz
 AqV+X1Wa6oosSIb60mq1QmZ3Wr29saZH1NdChb/BTz8sF4gDGKxT8nxsAWAs64dRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyzyGsnTKuRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq7DqmJMIceOMchLWdrGR2CgmbOt10BbWB2yf1vU
 XtlWZ/E4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa3GI+Cc+ePHPBa9FOZaWGZim8hjs8toVi2Jr
 IsEXyZLoj0DONDDjt7/rtNKcgpbcSlkbX00wuQOHtO+zsNdMDlJI5fsLXkJIOSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:vNEqLK2XgKyyxieTtczi7QqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.93,233,1654574400"; 
   d="scan'208";a="78405149"
Date: Fri, 12 Aug 2022 15:28:16 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <luca.fancellu@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v4 02/32] tools/firmware/hvmloader: rework Makefile
Message-ID: <YvZjgPEW8uQWp+so@perard.uk.xensource.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-3-anthony.perard@citrix.com>
 <df267b25-a51a-a773-5845-534104540208@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <df267b25-a51a-a773-5845-534104540208@suse.com>

On Fri, Aug 12, 2022 at 03:36:12PM +0200, Jan Beulich wrote:
> On 11.08.2022 18:48, Anthony PERARD wrote:
> > Setup proper dependencies with libacpi so we don't need to run "make
> > hvmloader" in the "all" target. ("build.o" new prerequisite isn't
> > exactly proper but a side effect of building the $(DSDT_FILES) is to
> > generate the "ssdt_*.h" needed by "build.o".)
> > 
> > Make use if "-iquote" instead of a plain "-I".
> > 
> > For "roms.inc" target, use "$(SHELL)" instead of plain "sh". And use
> > full path to "mkhex" instead of a relative one. Lastly, add "-f" flag
> > to "mv" to avoid a prompt in case the target already exist and we
> > don't have write permission.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one nit (which I'd be happy to take care of while committing):
> 
> > @@ -73,12 +72,18 @@ smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
> >  ACPI_PATH = ../../libacpi
> >  DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
> >  ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
> > -$(ACPI_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
> > +$(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
> >  CFLAGS += -I$(ACPI_PATH)
> >  vpath build.c $(ACPI_PATH)
> >  vpath static_tables.c $(ACPI_PATH)
> >  OBJS += $(ACPI_OBJS)
> >  
> > +$(DSDT_FILES): acpi
> > +
> > +# Add DSDT_FILES as a prerequisite of "build.o" so that make will also
> > +# generates the "ssdt_*.h" headers needed by "build.o".
> 
> s/generates/generate/ ?

Yes, thanks.

-- 
Anthony PERARD

