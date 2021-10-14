Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886AE42DA8B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 15:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209352.365784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb0sQ-0001af-DM; Thu, 14 Oct 2021 13:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209352.365784; Thu, 14 Oct 2021 13:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb0sQ-0001Y2-9r; Thu, 14 Oct 2021 13:34:30 +0000
Received: by outflank-mailman (input) for mailman id 209352;
 Thu, 14 Oct 2021 13:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i4ou=PC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mb0sO-0001Xw-Eg
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 13:34:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97a55bdf-5cb6-4cd3-9c0a-3ac2e48e688c;
 Thu, 14 Oct 2021 13:34:26 +0000 (UTC)
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
X-Inumbo-ID: 97a55bdf-5cb6-4cd3-9c0a-3ac2e48e688c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634218466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MhXyq+Rzyyhop89gfzQKPj624c38hqTaXr9TnqT1qRM=;
  b=aGxfPV1uDu5GXRPFUj4+02GVbv4pFTpWurKa7RHqy/p7g5UYjz6d0blZ
   PvWhTbW9WnFGecA635xitNUjQb9hORjP9+tz+Kbl3Mp2HEyhiaOXNqWB8
   TVO8jHr3OIpk9KXCy8U5hOdoarCn83D4gOEWvD6xWeSFbgLFahPBPBeDq
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DjcxAUayJnJEou+aQN4yeHHnz01yliQ1tilWzEqc9HxnJKquo+6Q0rMqWqdIuM4VMQ28lZwEQE
 yY7OCNYXL8F0JPP9ig+eL3PjyDxDcual8Pe+Rj8cteR80BWAX5y+7CMJm1GP+Ye+I97KxD18y5
 4Zh7efSn7N41nJ8A1yjSZCcLW5i2l0+6a+F95v2Ywqk4bBwBRrmY1UtH6j2qzAEMuRWlm9HdbM
 dQwl/vgY0pygf7V0nZEduBJE4W3rc2y1+Gr3S8i+ivzbiIVmu8wQESbl8aUiLV53E9V2Q08pBp
 70jJpEAGMs5amiZ8fxV66Vd7
X-SBRS: 5.1
X-MesageID: 55221597
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:76SV/60IdpsO9Te7j/bD5e13kn2cJEfYwER7XKvMYLTBsI5bp2QFy
 2EeXj+Ca//fM2r0LYtyPdiyoR4C6JGHndVmTAFopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhs+hey
 4Rs75OKQiwwYILhx80NYiV8HHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t25oURKuPO
 KL1bxJuSCrJWDd9IW4xUqISpdWxgl3HcwRh/Qf9Sa0fvDGIkV0ZPKLWGNnSfMaDSYNKn0Kbj
 mXc9m/9D1cRM9n34TGC9HSrhOPGgyLgcI0XHby8sPVthTW7z2gSEwEfVEH9r+OwjEW/QPpAJ
 0dS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmQcVTtAdNwOvdc7XyA3z
 USOm871BDtpq/ueTnf13ruboT69IyE9MX4JZShCSxAMpdbkvukbsBXLSdpyFb+vuff8Ezrw3
 jOioTA3gvMYistj/6Sk/3jXjjS0vJ/LQwUpoALNUQqN5ARzbp+ofIys5F3S695PKY+YSh+Ku
 31ss8qU4f0KDJqNvDeQW+hLF7asj96aNBXMjFgpGIMunxy24GKqd41U5DB4JW9qP9wCdDuvZ
 1Xc0StT+ZtSMX2CfaJxJYWrBKwXIbPITIq/EKqON5wXP8Y3JFTvEDxSiVC481jCkxkNy64FM
 ryCL+mBUl8KOJhDw2/jLwsC6oMDyic7zGLVYJn0yRW7zLaTDEKopac53EimNb9hsvvVyOnB2
 5MGbZHSkkQAOAHrSnCPqdZ7ELwcEZQs6XkaQeRsfemfPhEuJmglD/LAqV/KU904x/oL/gskE
 3fUZ6O59LYdrSGYQelpQio6AF8KYXqZhSlmVcDLFQz5s0XPma71sM8im2IfJNHLDtBLw/9uV
 OUicM6dGPlJQTmv021DNsWk8dQ8K0X121rm08+ZjN4XJMMIq+vhoI6MQ+cS3HNWUnrfWTUW8
 tVMKT83sbJcHl8/Xa46mdqkzk+rvGh1pQ6BdxCgHzWnQ221qNICA3Wo1pcfephQQT2elmry/
 1vHWn8w+LiSy7LZBfGU3MhoWa/ySLAgdqebdkGGhYuL2d7ypTH6mtUaDrbWLVgwlgrcoc2fW
 Amc9NmkWNVvobqAm9YU/29Dwf1s6t3xiaVdywg4TnzHY07yUuFrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBpck/00zB6oeicWkJIMhjS1CEEdOlpMJkoy
 PsKsdIN71DtkQIjN9uL13gG92mFInEafb8gs5UWXN3ihgYxkwkQap3AEC7mppqIbowUYEUtJ
 zaVgovEhqhdmRWeIyZiSyCV0LME15oUuR1MwFsTHHizm4LI1q0twRlc0TUrVQAJnB9J5P1+Z
 zpwPEpvKKTQozox3JpfX3qhEh1qDQGC/hCj0EMAkWDUQhX6VmHJK2Fha++B8FpArjBZdzlfu
 rqZ1HzkQXDhe8Sohnk+XktsqvrCS91t91KdxJD7TprdR5RqMyD4hqKOZHYTr0q1CMw8s0TLu
 O128bsicqb8LyMR//U2BoTyOW78k/xYyLiumc1cwZ4=
IronPort-HdrOrdr: A9a23:DvHEtK0eeTwa/KvjGOTRdQqjBL4kLtp133Aq2lEZdPUCSL39qy
 ncppUmPH7P5wr5N0tNpTntAsO9qDbnhP1ICOoqVotKPjOHhILAFugL0WKh+UyDJ8SUzJ856U
 4PScVD4JSbNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.85,372,1624334400"; 
   d="scan'208";a="55221597"
Date: Thu, 14 Oct 2021 14:33:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 26/51] build: build everything from the root dir,
 use obj=$subdir
Message-ID: <YWgxwszDto5E9aoO@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-27-anthony.perard@citrix.com>
 <eca3f533-9841-e4a8-dfde-840451ed8aef@suse.com>
 <YWbsGlcDZSSXsJlx@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YWbsGlcDZSSXsJlx@perard>

On Wed, Oct 13, 2021 at 03:24:31PM +0100, Anthony PERARD wrote:
> On Mon, Oct 11, 2021 at 04:02:22PM +0200, Jan Beulich wrote:
> > On 24.08.2021 12:50, Anthony PERARD wrote:
> > >  ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
> > >      cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
> > >      ifeq ($(CONFIG_CC_IS_CLANG),y)
> > > -        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
> > > +        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@
> > 
> > Are you sure about the $< => $(<F) transformation here? Previoiusly it
> > was present only ...
> 
> I have to check again. Maybe $< didn't work and it's more obvious with
> this patch. Or maybe that depends on the version of clang.

With clang 12, the original line doesn't work for the few objects that
are built from "subdir/source.c". I guess it is just by luck that they
aren't any duplicated symbols.

> > >      else
> > > -        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
> > > +        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@
> > 
> > ... here.

-- 
Anthony PERARD

