Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE3B95942C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 07:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780908.1190515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sge3o-0001xA-Nm; Wed, 21 Aug 2024 05:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780908.1190515; Wed, 21 Aug 2024 05:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sge3o-0001uo-K4; Wed, 21 Aug 2024 05:39:08 +0000
Received: by outflank-mailman (input) for mailman id 780908;
 Wed, 21 Aug 2024 05:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yaOv=PU=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sge3m-0001ue-Og
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 05:39:06 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe9c141-5f7f-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 07:39:04 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47L5d1Ci045008;
 Wed, 21 Aug 2024 00:39:01 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47L5d1Br075066
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Aug 2024 00:39:01 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Aug 2024 00:39:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Aug 2024 00:39:01 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.72.75])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47L5d0k4052863;
 Wed, 21 Aug 2024 00:39:00 -0500
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
X-Inumbo-ID: abe9c141-5f7f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724218741;
	bh=4w0VkpEfU1AMarsd6/LvOhcnQP/j7KKEjGY1ay3+X0U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=e/08dDTiPvj0uuXMJyebICcjJNrvFM+FIhQ7lZXonmzfLcX2QfbRJv9K5cTp1u9j4
	 guzNLcd8qY3unNf+Bxui79N8u8KYFngdwGksgNA0V+FmVSyeSbcGQv1CrhXpRwXXNC
	 s9AAYXxcPBbwqVN+mK2gxq1FytXht3dRR5Ty+Snw=
Date: Wed, 21 Aug 2024 11:08:59 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] tools/helpers/init-dom0less: fix vcpu availability
Message-ID: <y46y7zqfepuvbw3tniqkr5yepcqbvkbyj6mfj3tj4p3ylo7pg3@23plq2f3jboj>
References: <20240820080416.323725-1-a-singh21@ti.com>
 <ZsTDJhcfFpm23oHO@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZsTDJhcfFpm23oHO@l14>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 16:24-20240820, Anthony PERARD wrote:
> On Tue, Aug 20, 2024 at 01:34:17PM +0530, Amneesh Singh wrote:
> > diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> > index fee9345..722a5af 100644
> > --- a/tools/helpers/init-dom0less.c
> > +++ b/tools/helpers/init-dom0less.c
> > @@ -167,15 +167,20 @@ retry_transaction:
> >      /* /domain */
> >      if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
> >      if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
> > -    if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
> 
> You should probably keep this node even if "*/availability" isn't going
> to be written. It might be useful for watching everything under the
> "cpu" node. (libxl create this node independently from all the other
> "availability" sub-nodes.)
Gotcha, didn't know that. Guess that can be kept the way it was then.
Thanks for pointing it out.
> 
> > @@ -330,14 +336,24 @@ int main(int argc, char **argv)
> >
> >      for (i = 0; i < nb_vm; i++) {
> >          domid_t domid = info[i].domid;
> > +        libxl_vcpuinfo *vcpuinfo;
> > +        int nb_vcpu = 0, nr_cpus = 0;
> > +
> >
> >          /* Don't need to check for Dom0 */
> >          if (!domid)
> >              continue;
> >
> > +        vcpuinfo = libxl_list_vcpu(ctx, domid, &nb_vcpu, &nr_cpus);
> > +
> > +        if (!vcpuinfo) {
> > +          fprintf(stderr, "libxl_list_vcpu failed.\n");
> > +          nb_vcpu = 0;
> 
> Is there any value to keep going if libxl_list_vcpu() fails?
> Or is the reasoning is that cpu/*/availability was broken before, so
> it's not important enough to stop init-dom0less?
Yes, so missing cpu/*/availability nodes would mean we cannot
pin/remove/add vcpus using xenlight I believe. However, we can still
hotplug other stuff like net or block devices. In fact, I was doing
exactly this when cpu/*/availability was broken.
> 
> 
> Thanks,
> 
> --
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://urldefense.com/v3/__https://vates.tech__;!!G3vK!TgBV3TUl158hw6AKLTg3uYRP3PP-1Ku8uVFaT9lFV46NIVCn9kL-y82D2xz1j_iUwo58t8yr3hwYJBV9GAMS5zaFOSA$
> 

Regards
Amneesh

