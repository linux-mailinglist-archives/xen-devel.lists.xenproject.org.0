Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198584ED1D1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 04:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296611.504940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZkkm-0002By-Gy; Thu, 31 Mar 2022 02:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296611.504940; Thu, 31 Mar 2022 02:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZkkm-0002A9-Dw; Thu, 31 Mar 2022 02:41:40 +0000
Received: by outflank-mailman (input) for mailman id 296611;
 Thu, 31 Mar 2022 02:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nZkkk-0002A3-6N
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 02:41:38 +0000
Received: from sonic303-23.consmr.mail.gq1.yahoo.com
 (sonic303-23.consmr.mail.gq1.yahoo.com [98.137.64.204])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14661018-b09c-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 04:41:35 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 02:41:33 +0000
Received: by hermes--canary-production-bf1-665cdb9985-zm65g (VZM Hermes SMTP
 Server) with ESMTPA ID cc916f2eadf0242aebeca47e8dbfd48e; 
 Thu, 31 Mar 2022 02:41:31 +0000 (UTC)
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
X-Inumbo-ID: 14661018-b09c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648694493; bh=aKGHo6juQc57vU9KYzmMB90JXAaFuepz0lGGrNmSIXM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=oNRj+VouqaD8l+kruFENvRjz/0wN9akscx09IMYn3hVcA8HiiDcshSFVmXroCfZuKHsurZcwgW79DUA95RZCpYfEFQ71Q8kDu1BNkypfpZpi2XgvKix+E41yZbIDFhC9isB9LutVpFmlnsQgVG0ARURiTcXG2N/qsljJzzRJSAdM/6+sRS1AwE0klw6x2pWPyOYqtSeAoPbZaAMzLE4HOHxw/CNj7Un230q5CcmDwwxFEezgSYxpp5QSjU/ph9SR8JvTQYopDOGxx+FFL+CkqnPKkQnMKJofhVx/jl7TTpFOzYqj9z7ItYIpAurONsXyPChGu4mZI5nzJicouvAabQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648694493; bh=lD9HEL3dtW7GqCftAOx1/oX4wI3CYEWlWLRL3qt6Uc4=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=rcmQvJP3qTe1lV4MvBu48BviQfaJvj6+GAsCCdVcNxYrOHULeU+zF1nz3bxTM/xrcAD86CyNYGnSMR+aVSwLly1TYklAex7hb8wyzLyCcEC2oUOheH1jq8G3KTPp/UXtB0nRPU/mK7nUprRdcYQkM1N8YFboyMgH0O8Kx9RIyttd9BDnMCu+A7BbhKHwsNXdemYxv9W1WcvnuyAv+pxGHlNp/uT4glCzjrcM/TPAnv4+8x/ToDxDVTvVI9u7XlE1PKUIdvyceNdaD/FgRs/Da5GWLSUHJNkCkIhP1MwiU2USjDntyYRP837G7uI02NCyLGUlZFT0S4HellTC+1KxVw==
X-YMail-OSG: JjUzACIVM1m4HHOyi8AoRzIh54baizlaoTnoo97rNeS3oBMZmuK90EwFm6DmDYs
 XPhMbRYwsLMEPVSp2n7DDJRsZWyA_C3wYv52ZdMizvlHeuGOOfFzaQF76UII272Jo3R7aFABJwn9
 VADjrOXjBx.s69Tvs6zOmVlLA8uuIDZ8ATpX33Q1iNjA8X3gdu6WYKFbw4wUKXbJXqpdz47pZqXM
 lOyfnj4uqpxki8ysMqnwXVCt2IZ9Y_c6sM25od.xByyZQGU9sjwTFwpXrFk.rgtnJHN4aiMJig.J
 F5KuR3UO7d4KXnr4rjru7iV0OsR1gLKUZjTlqqFGXAX5H088imW2g4v53oq6GWDq7DXzXUhd6nwf
 rKSl67xWS2hnuQYpdzhEfB1RWd7OVNhqxqPGeesafSSp4hpfZY_YCWdZ2ceuUkl2Vv_tq9iFLO5Z
 KHrUnUGhJgBVywrpj2yafOaOb4SkBxC2vkdedjINx_tWtuuDpFBtINJPCbHarYlM6JcqIPivo56F
 TQwjHIC4pPW43QGIQzMPSdJDtxnY763nwN2EgwBS879Uec6QCQAPlBybaSg2oX6RNWI1ZSxItl9B
 TpOY20qSkjqC_BhWSi0xE2oidz1o3fOK5J47E_XUmq1QznhMVGReY2ldnVJ.gqhsYV9TRjjYhNLQ
 GGmmWuR80dpRQGOpKCMmDhX.Fg4QYK5myeGK1SpueiuDExFS6QkuZQ6odpVDeoNA7uuN3uS2_yzQ
 lgV7G1Xu9YPz.gMYTE4edKhgYbMbZZUz6_yFbBxfHkUhnI37lVvLgGGJUrsMNYot16dB2mThoLxk
 2VR.TOV3wkJLZXzt3owGb13AQIlOwLEmv0H7548HC1rUpKLTpMIRX2ABIOiAC8w1rJVqXThouCBJ
 yC5N3r696Z4PpnEziFFa87VHDfY.Bry0Nqgilxg4jaskBdb.BbycSxW5w9Uzl5VCb1ptA0lLk9rZ
 wAa0v3RmZi7XCn3kkghyAcxYQYWEGMgJ9PhaAI_wlDuyyqoujP9KkdO7zpYfopSOf6kQ_lPlJFSH
 bFkyqEYhLYPFmCe.r3urcQwa2EYwHn8TD8U3AWr8PlHIeYS5hLGXdbE.i3CfCWgqX_qwPLBLfEWt
 wrk4b_CfitZnMgk045oORLtSbguIai24vYeI77ecUq2GAv_WsYm5FOKmoAFbMpHbnfoVp79lSWdt
 prj3uxVlqDwSr481_BHluWBueIkt9h0PZ8zbp0A7TCMumCHKzXR0E.YmduxSKZzo4UQ5nCow33BL
 cmdVgJ4jbSmXDAnjw9ZOoH1SUAktlDT4PQzt9bCLzrn8LJFcv81lJJWwpX0JKXwcHohyBof63Eqo
 mTgaVn4mah6tJTqr0cQ3f2io4sFctY5TGkhgzYATlWWih5lm8h4ZfZIQPCu.yTH9Ey3KmrBxx0aE
 f3nz0yBUsm_cx7VUOotv6_6sAnhujcsLHi7bJasyKLQ8wS2IXCBPM.rCBRFGoOE.cVyNCyv576KG
 Rq7b.bDxVSszWT_a9dTYR5yvxe15f5K9I5qjjPOktsRmKVq1nDspupAnN.xtDP3ZUxe0HQvikUf8
 N.ao_pEEoR28TK2_L4zTG3lHxHJV0u2UTTdBcnvtjJBoArqdJYggj2uIONxJ83EsT0kQ1MkTIHhG
 lf3yieS8i66fZW5qU5BDQpuY9cf44sVu4IACd8B.JA970FOhY8SC1wdsMvqSOni9hN_9vAvigmph
 0MwADnGVOwiM9ph3QHbbJH8Tm5k06DXEluULkWx69uN82Qi.6CGFoqPvH0vVEX9.rN0.lWGcpSLM
 0cgQs6.ArB4TlzdhDAg.qiHg57Y87.AYeigWBRkJiemeaL_z6Z8WCfX9_obkdbqhH4IFW7jfLZEQ
 BqAiLPZwAjmawLyr.rZgoYLWJgwcTT_NT5MG9wouiP.nkeieu.VQVkouRpXdeX3BKfsQ1ZP2eetQ
 nYjSfWhgRWtE.wvwwnPfzKEFksqkrgM4of_6wck0oGC9BBz85.dgHGzuWXxh6Gzi.Kv_WhYWVHz_
 5G.UqMFCfmvQysp8D_8uAezMRsmuMfq9brNmtXNdWaKISO_wp5TTcE5A_QS5rnqRP_SxgAtdbQ0_
 wcZUjz65xVGDJdrlPUAAQ3Alxdh_NAK9Gf5GzVqNwCxVhE2Zeugx339WS4oJWFld5qlkje_qcV8x
 KPv1Uk.Y3OzRvDoQ9e7jgFT3_YGK4P90jLxve3wh9l0oaQcD17sy3h0Jt10U_ebQBu0zFwXuU4R.
 l11jY7wye7.bjig--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <255ef47f-ea8a-79e5-601d-4ec8d6a44b7e@netscape.net>
Date: Wed, 30 Mar 2022 22:41:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/30/22 1:15 PM, Anthony PERARD wrote:
> Hi Chuck,
>
> On Sun, Mar 13, 2022 at 11:41:37PM -0400, Chuck Zmudzinski wrote:
>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>> opregion to the guest but libxl does not grant the guest permission to
> I'm not reading the same thing when looking at code in hvmloader. It
> seems that hvmloader allocate some memory for the IGD opregion rather
> than mapping it.
>
>
> tools/firmware/hvmloader/pci.c:184
>      if ( vendor_id == 0x8086 )
>      {
>          igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
>          /*
>           * Write the the OpRegion offset to give the opregion
>           * address to the device model. The device model will trap
>           * and map the OpRegion at the give address.
>           */
>          pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>                     igd_opregion_pgbase << PAGE_SHIFT);
>      }
>
> I think this write would go through QEMU, does it do something with it?

AFAICT Qemu does do something with it:

In the upstream Qemu, at hw/xen/xen_pt_config_init.c
and in hw/xen/xen_pt_graphics.c, we see where Qemu
implements functions to read and write the OpRegion,
and that means it reads and writes the value for the
mapped OpRegion address that is passed to it from
hvmloader. It is a 32-bit address that is stored in the
config attribute in sysfs for the Intel IGD on Linux guests.

I have examined the config attribute of the Intel IGD in
the control domain (dom0) and in the Linux guest and
what I see is that in both dom0 and in the guest, the
address of the IGD OpRegion is consistent with custom logs
I have examined from xen/common/domctl.c that show the
same machine and guest address for the OpRegion that
the config attribute has for the machine and the guest.

> (I kind of replying to this question at the end of the mail.)
>
> Is this code in hvmloader actually run in your case?

I admit I have not verified with certainty that Qemu and
the guest is getting the OpRegion address from hvmloader.
I will do a test to verify it, such as removing the code
from hvmloader that writes the address in the pci config
attribute and see if that prevents the guest from finding
the address where the OpRegion is mapped to in the guest.
That would prove that hvmloader code here is run in my case.
>
>> Currently, because of another bug in Qemu upstream, this crash can
>> only be reproduced using the traditional Qemu device model, and of
> qemu-traditional is a bit old... What is the bug in QEMU? Do you have a
> link to a patch/mail?

Not yet. I am working on it now. The bug is related to the
passthrough of the IRQ to the guest. So far I have compared
the logs in the Linux guest using Qemu upstream with Qemu
traditional, and I have found that with the upstream Qemu,
the Linux kernel in the guest reports that it cannot obtain
IRQ 24:

Mar 29 18:31:39 debian kernel: xen: --> pirq=16 -> irq=24 (gsi=24)
Mar 29 18:31:39 debian kernel: i915 0000:00:02.0: [drm] VT-d active for 
gfx access
...
Mar 29 18:31:39 debian kernel: xen:events: Failed to obtain physical IRQ 24

When using the traditional device model, this failure is not
reported. The failure of the system to handle the IRQ prevents
the guest from booting normally with the upstream Qemu.

Comparing Qemu upstream code with Qemu traditional code,
I notice that when the traditional Qemu sets up the pci-isa
bridge at slot 1f, it configures an IRQ, but the upstream
Qemu does not, so I suspect that is where the problem is, but I
have not found the fix yet. It is well known that the pci-isa
bridge at slot 1f needs to be specially configured for the
Intel IGD to function properly.
>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
>> index 4bbbfe9f16..a4fc473de9 100644
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>>                     domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
>>               return ret;
>>           }
>> +
>> +        /* If this is an Intel IGD, allow access to the IGD opregion */
>> +        if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;
>> +
>> +        uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
>> +        uint32_t error = 0xffffffff;
>> +        if (igd_opregion == error) break;
>> +
>> +        vga_iomem_start = ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIFT;
>> +        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
>> +                                         vga_iomem_start,
>> +                                         IGD_OPREGION_PAGES, 1);
>> +        if (ret < 0) {
>> +            LOGED(ERROR, domid,
>> +                  "failed to give stubdom%d access to iomem range "
>> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
>> +                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
>> +                                                IGD_OPREGION_PAGES - 1));
>> +            return ret;
>> +        }
>> +        ret = xc_domain_iomem_permission(CTX->xch, domid,
>> +                                         vga_iomem_start,
>> +                                         IGD_OPREGION_PAGES, 1);
> Here, you seems to add permission to an address that is read from the
> pci config space of the device, but as I've pointed above hvmloader
> seems to overwrite this address.

I do not think hvmloader overwrites this address. I think of
it as hvmloader passing the mapped address to the device
model and guest, but as I said above, I will do more tests
to verify with certainty what hvmloader is actually doing.
> It this call to
> xc_domain_iomem_permission() does actually anything useful?

I am certain this call to xc_domain_iomem_permission()
is necessary with the Qemu traditional device model to
obtain permission for the guest (domid) to access the
OpRegion. Without it, the bug is not fixed and I get the
crash in the i915 kernel module in the Linux guest and a dark
screen instead of a guest with output to the screen.

Moreover, I have verified with custom logs from
xen/common/domctl.c that access to the opregion
is denied to domid, but not to dom0, when this
patch is not applied.

> Or is it by luck that the address returned by
> sysfs_dev_get_igd_opregion() happened to be the address that hvmloader
> is going to write?
>
> Or maybe hvmloader doesn't actually do anything?

I mentioned earlier my plans to verify that
hvmloader does provide the device model and
the guest with the mapped address of the
Intel IGD OpRegion.
>
>
> Some more though on that, looking at QEMU, it seems that there's already
> a call to xc_domain_iomem_permission(), in igd_write_opregion(). So
> adding one in libxl would seems redundant,

You may be right that with Qemu upstream it is not
needed. I will be able to check it once I have a patch
for the IRQ problem in upstream Qemu. When I wrote
this patch a couple of weeks ago, though, I did not yet
know that Qemu upstream also calls
xc_domain_iomem_permission() and since Qemu
upstream seems to obtain the necessary permission,
the call here to xc_domain_iomem_permission()
can be done only when the device model is Qemu
traditional.
> or maybe it the one for the
> device model's domain that's needed  (named 'stubdom_domid' here)?

Well, I am not using a device model stub domain but
running the device model in dom0, and my tests
indicate it is not necessary to obtain permission for
dom0, but I do admit I need to do more tests before
submitting the next version of a patch. I plan to do
some tests with a device model stub domain and see
what configurations require permission for the stub
domain. I expect it will only be needed when the
device model is Qemu traditional because Qemu
upstream obtains the necessary permission.

I have no experience running the device model
in a stub domain, and IIRC the Xen wiki explains
that the supported configuration from the Xen Project
is with the traditional device model and mini os in
the stub domain, and others, such as Qubes OS,
have done some work on the upstream Qemu and
Linux running in a stub domain. Please correct me
if this is not correct.

Thank you for taking the time to look at this patch.

Chuck

