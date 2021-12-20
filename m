Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA347A8AE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 12:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249577.429997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzGru-0005A3-MS; Mon, 20 Dec 2021 11:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249577.429997; Mon, 20 Dec 2021 11:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzGru-00057F-Ip; Mon, 20 Dec 2021 11:30:14 +0000
Received: by outflank-mailman (input) for mailman id 249577;
 Mon, 20 Dec 2021 11:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3/4=RF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzGrs-000577-KQ
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 11:30:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd77a34-6188-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 12:30:10 +0100 (CET)
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
X-Inumbo-ID: 2fd77a34-6188-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639999810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/D88mqBITTXMf/VBV8UnfOMshYaRwDqkACSK4Uj/CSE=;
  b=UqtCuH9SEDQy8ffZxSSgNq1OXFSUk6hQ370+z3RIz+eT7uk5mtM9aQeS
   IJZDVWvvxzoj+fJn0MFOnFmIBRqTcpMbOnlkyvLnaqA6OTrGUuMNmds3M
   1td06xzSikZuI7E/a+3Tg4VFtnunt4lLlbbVeoqKv+MWRgD/p1E7ePtfK
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3QrXlcC0EBd1phBKZ1jkitkQhhyZngPjit6JiCph5yVSqWel5MQOa7BGWrjdg3t8BCCb0N2a1B
 dNX9v2FFCB8T+XppA2stuX5MNL7MDcJCaRvCbkluRvU5jnEBBP+qcpLyCjYqp7+TRksBKPC2YL
 z4X3WkwzCoWu0KlYkxsaCpAdlKv5gstZVKydJnu/rMcdudOSVemwWyJhsqfOWM+j4yFo0qRh7d
 L8TzhwW2VuP9eeH45qhhVGFh9zQ8pwiWPOdLzICnveJceDyDgXy4uM0Zp34IjlqrZ/Kdapg0pm
 iBqChNrHKKaJgwNgzbyG5adm
X-SBRS: 5.1
X-MesageID: 60418457
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IUXO16zN5cw5YPh9+6R6t+f3wCrEfRIJ4+MujC+fZmUNrF6WrkUGz
 2dOXTrXP6yINzCmKop3YYq28h4GuMPTn98ySApo+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbRh2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+t4z
 99StJKzcgEoDPWWiudDbQZZMT4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JgSRKaCO
 pVxhTxHTDL4cSxzB1ArUp89wc2agWL5XRxZpwfAzUYwyzeKl1EguFT3C/LefdqMQsdZl1iZv
 UrJ+m34BlcRM9n34TOB82mwj+7V2y3hUYQZFaaQ6fJhxlaUwwQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGSoSd/nVhH+v3+AvTYbQdNbF+B84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YX6F7bKVsTOaMDAYN3MffjQDSRYZ4t7lu8c4iRenZtpsHKO6lNTdBSD7w
 zfMqjM3wboUk6Yj1rq51UDKhSq2oZrERRJz4R/YNkqv6QlzdYO+Z4il7FHdxflFJYedCFKGu
 RAsmcKT8eQPBpGljzGWTaMGG7TBz/SYNDzRh3Z/Ep9n8C6ik1adeoRX7CB7NV1eGM8Ocj/0Y
 2feoQpUopRUOROCcqtfc4+3TcMwwsDIDs/5X/rZat5PZJlZdwKd+ixqI0mK0AjQfFMEyP9lf
 83BKID1UChcWf8PICeKq/k16rYszD8/y2DoQ5HJl0610uSge3+3VuJQWLeRVdwR4KSBqQTT1
 t9QMcqW1hlSONHDjjnrHZ07dg5TcyVibXzig4kOL7PYfFI6cI00I6aJmetJRmBzo0hCeg4kF
 FmZU1QQ9lfwjGavxe6iOiE6M+OHsXqSQBsG0c0Q0bSAhiFLjWWHtv53m34LkV4PrrML8BKMZ
 6NZE/hs+9wWItg9xxwTbIPmsKtpfwmxiASFMkKNOWZkLs87FlCXpIW1IWMDERXi6QLt6qMDT
 0CIjFuHEfLvuSw/ZCopVB5f5wzo5iVM8A6Dd0DJPsNSaC3RHHtCcETMYgsMC5hUc33rn2LCv
 y7PWEtwjbSd8ucdrYiS7YjZ/tjBLgeLNhcDd4Utxe3tbneyE6vK6dIobdtkihiBDj6po/v7O
 r0Opxw+WdVe9Gt3X0NHO+4D5coDCxHH/de2FyxoQyfGaUqFELRlLiXU1MVDrPQVlLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRkANRe7lyEAfqB+N5kow
 Ll9tZdOuRC/kBcjLv2PkjtQqzaXNnUFXqh+7sMaDYbnhxAF0FZHZZCAWCb67IvWM4dHM1UwI
 y/Sj63H3uwOyk3Hens1NH7MwesC2she5EEUlAcPfg3blMDEi/k72Axq3Q42FgkFnA9a1+9TO
 3RwMxEnL6u54Do11tNIWHqhGl8dCUTBqFDx0VYAiEbQU1KsCj7WNGQ4NOuAoBIZ/mZbcmQJ9
 b2U0j+4AzPjfcW31SouQ0917ffkSIUppAHFncmmGeWDHoU7PmW50vP/OzJQpku1G941iW3Gu
 fJurbR5ZqDMPCINp7E2VtuB3rMKRRHYfGFPTJmNJk/S8b0wrN1q5QWzFg==
IronPort-HdrOrdr: A9a23:mOS0aaqObfW3FQoypBFVsOUaV5oWeYIsimQD101hICG9JPbo8f
 xG/c5rtyMd6l4qMk3I9ursBEDtex/hHP1OkOos1NWZPTUO41HYS72KhLGKq1bd8kvFmdK1vp
 0BT0ERMrPN5fcRt7eC3OEVeexQpeVuUcqT9IPj80s=
X-IronPort-AV: E=Sophos;i="5.88,220,1635220800"; 
   d="scan'208";a="60418457"
Date: Mon, 20 Dec 2021 11:29:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 12/47] build: build everything from the root dir,
 use obj=$subdir
Message-ID: <YcBpLbxObugQ3doZ@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-13-anthony.perard@citrix.com>
 <0b2eb0e2-a07f-6ba2-8f59-b7c207ed30da@suse.com>
 <YbseOtj7prFqViyV@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YbseOtj7prFqViyV@perard>

On Thu, Dec 16, 2021 at 11:08:47AM +0000, Anthony PERARD wrote:
> On Tue, Dec 07, 2021 at 12:10:34PM +0100, Jan Beulich wrote:
> > On 25.11.2021 14:39, Anthony PERARD wrote:
> > > --- a/xen/Makefile
> > > +++ b/xen/Makefile
> > > @@ -22,6 +22,15 @@ export CHECKPOLICY	?= checkpolicy
> > >  export BASEDIR := $(CURDIR)
> > >  export XEN_ROOT := $(BASEDIR)/..
> > >  
> > > +abs_objtree := $(CURDIR)
> > > +abs_srctree := $(CURDIR)
> > 
> > Nit: In line with e.g. obj-y I think these would better be abs-srctree and
> > abs-objtree.
> 
> I guess that would be fine, we don't need to keep the same spelling that
> Kbuild does.

Actually, those two variables are exported, as it appear in the next two
lines. Exporting a variable with a dash doesn't work very well as shells
may not be able to use them. When make find a variable with a dash in
it in the environment, it unexport them.

So, for those two variable, we need to avoid using a dash, so I think
keeping the current name is better. (And now, I've find out that there's
an issue in the build system, I'll prepare a patch.)

Cheers,

-- 
Anthony PERARD

