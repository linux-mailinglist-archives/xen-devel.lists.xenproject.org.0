Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3136601BD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472648.732950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnIV-0007xJ-GX; Fri, 06 Jan 2023 14:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472648.732950; Fri, 06 Jan 2023 14:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnIV-0007tp-DH; Fri, 06 Jan 2023 14:02:15 +0000
Received: by outflank-mailman (input) for mailman id 472648;
 Fri, 06 Jan 2023 14:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDnIT-0007tj-Kg
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:02:13 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e5bb0a-8dca-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:02:09 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 14:02:07 +0000
Received: by hermes--production-ne1-7b69748c4d-drrwg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 9c3339e25d8418037deac281a90e36bb; 
 Fri, 06 Jan 2023 14:02:03 +0000 (UTC)
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
X-Inumbo-ID: b4e5bb0a-8dca-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673013727; bh=QMiqbDC+61V0Rk1soqHizYsaVxM0KkrnEK/KqG2Ugb8=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=dLAt+wG+AyS1eswmXsp5/JpM8WzoW7JftDUt75LKqmPdXJMNjrJ+X8tamc0AMvXCAJzg44JNG2wjaoiHH5WBuTlmtpmcGaUFUwCgafgcI/eTaEOJqPvX4pceIDcHuDujxnqQ6nsAb+YPjblGec1CU8A2mfeuFeKAPX33Hh7jtAsdnSK+d0QfIWLK1R/1I8nRNzh8Eo7smxOsBZdpfgwlH5GaEiJ+hkQQceNJ0RIY7mI/DkEF1kAUMI9jmm+Ra92xeiLNDuRdoNM4RQcdJOzw7Nrg2CJkr9nyaQEVDM4U0RcBfrRBiinyfO8po7oZ2/bBdFZSiJAOwdX+Ve7aVc2jFw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673013727; bh=fjn70Kv45ZJMgPFlTmq03reHzYK2FHDh7LA5QD2tKRq=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=eBbavZuE/LSY3h0hfEpwWkd5JzmX1KdIFJhJypq+p6NWXEyP8/40yIV3C8H6hbh0QMg2FT5qRZi7ChdpfUYnOBiCVzR4knG9SYG/52GPiUV4nyRDmPcdW5B8SOzdeXlhOnUEfBiYE6IFLXueWU2k571HSgx3Xqvpty//uPjS/0dqJLrlDGQpOcUJt+9lZ+vhYSSfZ8YUlwb0WtpptzvYlpjut9oXk+MQs34Yqeyg88oGISdfQ3hEYrlJADIR7w/zBIsGLM93g51fqVu+ImoSikfuYDrLfpiBAQ8j02ZSQmnaS2EBk4AslLPGj6AZ5bGwvrlO5TrDABOeZJqukpphHQ==
X-YMail-OSG: kL_u7lEVM1mSuxyTPDJDIPhacyL5.wwB7HAKS.TTZJ3MJ8qexUFUuMzLjITEqnB
 LGYRdsSwR.icbCUrgwz6Zfag0x0viZLWqCbigG9KM3v29JJKNn8lpXW7zwatfpotniG2rmNapqNF
 aA25xqC1BeJi6nsAAYfLviHaRhuNn.Mmj8CmyO_.CKHw709Eu0h1kHueCoWrdYwy_hg7Tcj_R_U4
 j.xPKFgsvyql7xBvGc5HQCgaHoDpIh5.6p1CPVOypryqGJLe.ax9wLTGECxXomkquXZ9hcjDspw8
 q7UTTJMqxQUxnEXyPlol9wdSEXUrAaU2GIx7ARbBsMnzuII8YTKq95D7Lqo_3mmjmwy1n701FEtM
 T56TOJbFgLDtTf0pPHzdSP93KZ_GuzUhI3bweWKIWSeA3vVGEH5NItGWlCrGRSnQvyOGyHne5jsv
 TcNIsxdYplNMzQTRiqa.0zCwF3oyvpOVC2T864OptM5Hf9hps_K9rWX5HHgpos1xQtFts7RHph4.
 ZpIS8WH1Wwi49sbChVivclNu9UNiuRuMrxEV8KpRbUoNUEg_9iTjjzh5hC_NlyyiB5N6_qaiL1tm
 zvKUQCkEQC1jfs9.L1Gom71krC6.N1L0ypU.52biP.ICCN021Fj5NAFwbBxE_yd9IAtPTCBzflFj
 I4RCvqIZiag1lTbup66UJ5H_A6300xI4WI1O3lzNvLQK_2hmWEWxzjC2CfUMQXzZ.CqJOCuaXxIu
 qLlewqRMM2JAZj_7tiucsyJKWZadcG1lYqb3maloSG1jGzVGg_l7KEBPsenqh57SmSSuM6bdT0gt
 DQ35edZCwbV9e26IcMaKamWn4QHBXbgDZnF8CahIHbfcPdnPHkDPjhwPVyjaQppMggZfuIehXHDH
 qbzQsRj9vGYhvTUUmhONIHamvZMLYOZ7doo.DbjVJNlMqVaKuJFtkB6PxZm5cWuowJsqvEYw7LPB
 c3IexELiJ.OhtIho7J8Ppqthsog4ou5TpcmRBRMqGu0UgyQ6O3vMuDu_dbUSR2nILA3tzXjAPeG_
 udUyIaboyu3JKEMxtzRh6dK_asTLRMZG6RWNHByp4t8og_JIc8oG37Tm54zQ87exEyenS7EmUNDV
 Z2SyUPBkH9EYVHkCSQTA7_RuHYhz6wgNHwo2Iq.qaWX4WZe4guuiJXMZKqQ405xUzlV0AebbCOQw
 gijuKRQy.ifIIlr0GHF8Gp9_VCXhFQqqNoiSyjPgPAD.hUD8dUc8h.IaYCUKhQidUV9RzUeCX258
 rbvKHSERMyIl7pUdlAe25EQAt9pY.TYGCTBNjiVaAibZh61QJqHt43KnntB6fp5x2psHy9LKZ5vt
 Eh5hZBOI3O6ZKTFedrgAU_1zoS1WOuCK0DCLPiwWqEwZ.8KDxvASj9lc2uuIrfpZXAvqEGVKkmTE
 UguYnHhRglmLjuZKzmgkA6kr36odmO6.5YXtVgvPs9DPlwFaxC.EM51yEint_zQlwuXjchDdNfcL
 0OREZXjCo.1L3RdlB1DDK2UJdt2k92DXkxM8r17o2XG_mGrxQz265t1t708lT5HT1FEc_XPuumTs
 L5Jtn8y_oWe.dwy_eCMCiRNkhCcNeU6r2QXkp5zhsFqG6X0Z0qL_LPYj3cGzLTTPkLanvZ8km7_H
 aEP9bDwhuusHtcDRSxeFOvE_N5oj3X8.FYIglmOYOVbgHJpOtBaw0x9gW9eJARMmIO850_hBanFx
 tto.6eCvifmjdq9el8r_Ni2_.0gYdJUzf.pzJlF_Ix8NW9DWGaEKtH.e8WkiedDU3.nUIDdr2kgu
 2UdELYF8wzVpEVgLkJxVYws4x3dJ4U0pMqwv.JTkaq0dOmjfFIOfwqDFwvepjN2NKJdXXgIepCdG
 iip1d09s6DBlani6fCrBEQM1yiVWnJju3joYXsCTiBCa9_fok4A31nMPLJB48y_s3jn9iZQC2kZb
 O32YH0KYXccuKQp8ft2_2TrVELhtde9jRVeVDl4a3DWjlDdodsM6UxPxqXJt.VM5jWyS_zHKbkJi
 uIXPZZcQWp9QVudpBursAaizFm4Sa2nWOrUbzhYckQKgHpduVVAvwedRZu.fDBpshQfd7ks7eT07
 sAw_BBN2CeG7C7Vc4_yOXj6NgVtmgdnVjsSGb89Oa92JrngjFaoakBYryALp7rULImuEwgCL6DA6
 lzL3h5jN99AQqPyP8EUuHRmu0MBpQ11M4kopPv2h_5PYiEJeY5DMLst6Qzm8oOlKEZ0EuKmtLnCo
 Pr91k.igyTehyYw--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <b07581b1-3f36-bb3e-ab2b-7400bdffe0ef@aol.com>
Date: Fri, 6 Jan 2023 09:02:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Paul Durrant
 <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
 <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
 <20230103081456.1d676b8e.alex.williamson@redhat.com>
 <cbfdcafc-383e-aea3-d04d-38388fab202f@aol.com>
 <ba4f8fd6-ae10-da60-7ef5-66782f29fdb9@aol.com>
 <Y7f9hi0SqYk6KQzW@perard.uk.xensource.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <Y7f9hi0SqYk6KQzW@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 5:52 AM, Anthony PERARD wrote:
> On Tue, Jan 03, 2023 at 05:58:01PM -0500, Chuck Zmudzinski wrote:
>> Hello Anthony and Paul,
> 
> Hi Chuck,
> 
>> I am requesting your feedback to Alex Williamson's suggestion that this
>> problem with assigning the correct slot address to the igd on xen should
>> be fixed in libxl instead of in qemu.
>> 
>> It seems to me that the xen folks and the kvm folks have two different
>> philosophies regarding how a tool stack should be designed. kvm/libvirt
>> provides much greater flexibility in configuring the guest which puts
>> the burden on the administrator to set all the options correctly for
>> a given feature set, while xen/xenlight does not provide so much
>> flexibility and tries to automatically configure the guest based on
>> a high-level feature option such as the igd-passthrough=on option that
>> is available for xen guests using qemu but not for kvm guests using
>> qemu.
>> 
>> What do you think? Should libxl be patched instead of fixing the problem
>> with this patch to qemu, which is contrary to Alex's suggestion?
> 
> I do think that libxl should be able to deal with having to put a
> graphic card on slot 2. QEMU already provides every API necessary for a
> toolstack to be able to start a Xen guest with all the PCI card in the
> right slot. But it would just be a bit more complicated to implement in
> libxl.
> 
> At the moment, libxl makes use of the QEMU machine 'xenfv', libxl should
> instead start to use the 'pc' machine and add the "xen-platform" pci
> device. (libxl already uses 'pc' when the "xen-platform" pci card isn't
> needed.) Also probably add the other pci devices to specific slot to be
> able to add the passthrough graphic card at the right slot.
> 
> Next is to deal with migration when using the 'pc' machine, as it's just
> an alias to a specific version of the machine. We need to use the same
> machine on the receiving end, that is start with e.g. "pc-i440fx-7.1" if
> 'pc' was an alias for it at guest creation.
> 
> 
> I wonder if we can already avoid to patch the 'xenfv' machine with some
> xl config:
>     # avoid 'xenfv' machine and use 'pc' instead
>     xen_platform_pci=0
>     # add xen-platform pci device back
>     device_model_args_hvm = [
>         "-device", "xen-platform,addr=3",
>     ]
> But there's probably another device which is going to be auto-assigned
> to slot 2.
> 
> 
> If you feel like dealing with the technical dept in libxl, that is to
> stop using 'xenfv' and use 'pc' instead, then go for it, I can help with
> that. Otherwise, if the patch to QEMU only changes the behavior of the
> 'xenfv' machine then I think I would be ok with it.
> 
> I'll do a review of that QEMU patch in another email.
> 
> Cheers,
> 

Hello Anthony,

Thanks for responding!

The first part of my v6 of the patch only affects the xenfv
machine. Guests created with the pc machine type will not call
the new function that reserves slot 2 for the igd because that
function is only called when the machine type is xenfv (or xenfv-4.2).
But the new functions I added to configure the TYPE_XEN_PT_DEVICE
when igd-passthru=on will be called to check if the device is an
Intel igd and clear the slot if it is, but this will not have any
effect on the behavior in this case because the slot was never
reserved. Still, this would add some unnecessary processing in the
case of machines other than xenfv, which is undesirable.

So I can add a check for the machine type to a v7 of the patch
that will skip the new functions that clear the reserved slot if
slot 2 is not reserved and therefore does not need to be cleared.

Would that be OK?

Kind regards,

Chuck

