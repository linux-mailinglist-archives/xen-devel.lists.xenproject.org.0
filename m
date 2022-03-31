Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106F4EE4B5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 01:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297119.506012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na48Y-0005hf-R5; Thu, 31 Mar 2022 23:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297119.506012; Thu, 31 Mar 2022 23:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na48Y-0005fK-Nl; Thu, 31 Mar 2022 23:23:30 +0000
Received: by outflank-mailman (input) for mailman id 297119;
 Thu, 31 Mar 2022 23:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1na48X-0005fD-Qk
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 23:23:30 +0000
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9015b096-b149-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 01:23:26 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 23:23:24 +0000
Received: by kubenode534.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 7634f0d611ddb9d48a7ac57619ed0f00; 
 Thu, 31 Mar 2022 23:23:22 +0000 (UTC)
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
X-Inumbo-ID: 9015b096-b149-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648769004; bh=GZIXuqN8kcvSLIpsHl1AtKI5jMJ/M7yeBERtI9scRyY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=GDMWyPCW0jnV5+b0v84SePbVnyNt9NZB4eT8b5/Sd8G1H8xK4cMtLcuM8SEdG9OiEg+lfEyfZAa8U5NTvF5AmRs2lApo0vEEGFuvknu7E6oNsHuEq5uG5rv1kH6Xq3ZyS0NNDZCu6l96uttY++TIAj+4GRVQw87q8t46aRJuix/2/oMwAXLfWb/oNumn+NIEH5iOtTtj/3XvSESX2Ap4ECE1T2ZU2o8+gAOyUSH679qhkLcdfjJmXZu9PPDFbQtPDOMzj6IhNWhJ1ev6YuQ8kTA5SfGe6jAuUMk8MPMuMo47e6UZvJVSG1PTzrCF+BdFEXNaaqhAe9m/Bruyww8RqA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648769004; bh=q9W6vlyrZ8DuZD5LdYrpwvREmGxYGp2qeF08za7ygA4=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=RLxTNoEkakUfD5PfuUwvtv7+Hn4KQ8lv6k7Ng/E+l4F5X7O67giIfwij/E2/Ssn/UaMZ8WHrS5RyDPLXy0yjqEXHOyNXaTYXSCWmzHiOvPT+d2LacOdu7pZ4yOFiyAdeOCbTVLW3lawEB58S9kxCNWtIdfPp/2Q2AHimTcugPwtusng30ssD1wQ8Q2Ztc+LV1t4kwGUoPT/4D7n47iGqAH3RnCBeS2V/SYBZjcTPMClXlOAXdBwIDZD/CGC447V4CJzO57anf/n0fVJ5SsaoieoJ1xKcNm2GogisNnt9osV7bgGm9hjio6TvBdqzok5Dt0kxi+qw0FGTueEHUbpKfw==
X-YMail-OSG: lQpPR1UVM1kHJdQW2zIAmWft6UdlwhVtDZNeo8TKyBl1L7H4OvHDazypLFgKEjx
 0SgLJ9_JK5tVmCH5z.xU8sYV6KC8FQOPOJymfPIEwLZ1fNWES3Xtr6zatf5ZDbSqDXruNMgOJYBy
 ZsWZMChWPtR_oM_hjuMK4fyHOww_uRf5GYiirPhK7_9BI3zP.1pshCNj4NF_ADA8ytS20OTdIfg8
 O8SrM1toijWeCBr0H.zpyakaMZkEgGdtCbRuhe.akzjjZ9rqF0xEoCc.JODBfUizoMHBQVA2oU5A
 J0J6TN7ARQ7q.iMcBJ92Klb1YJ0HfrngCzlYQLl8.5Akyib8jIc76yxoPosl0_SSmYY37ISNOWwr
 tIcUdo5l8gdBFsueCgQwcS.TU.svUdrCXGPeLesTFDUDXzrTVqjO0dKbMp6aC9jdXUNUqLrsdL9N
 MKg8Nfbbm5jaaUeq5rLqjMlcgJTWTOU3cK2u0SKd6DT8AWRm4IxhBTagFFxLLS328SYbtzHYHlND
 1XW4Z4Dz1CHfu4mbnwimTiLT3mhsoUrV.gE1yI_n6T3W7HJEEGTqMuYkQRnB2cChzCceDhKLE7._
 c3KdFWVi3ynmlFc_XPI5kGUZpzT1YsJO8JhYp.Zhof.hHvGh8bEtGnBgu0BWKiHpBMTrelNXcrV8
 ..NErs2UAKFCjQncqdo_0sYFnH8ovqYIXyrcivIFeyFoDzrnxRi2zdgQokbogkUuDSrtoZqIJFev
 sQ8FDJrUa06PEjhDaBDBStRMYHxHNIk7ph6nSEJbwseZvhU7zsKOfRFrjFBVKVepgBHtv3Pyb1mN
 n5Tn.8gs_IstUcWKALK44fJjBzSpivgK44CqbIsMMl_UBfJCgCBxj1mMuQB_u1qbDjMDRGDaJvr9
 ra9bNEUqvQMNfIbdXplpt3jIPIICEiFkAk8w_iHgx4YDQ04ryZxAjTsvjjpn52kmj513rbbfYXW2
 aPUwwf8MjFEQulVIBwKVanscj9novwJOF_9PAX4960b3GG2G7XXCAteEiYUDB6cAxkmIlbbqRsQh
 bKLoqEfM5DfIssDEesoFzK2QkrjYoO8.vI7_C13YQVpKmthGeZwRdotJjzLK8sBVpr3pAaGl2XWG
 cMm0EvSo1mcx_COA2WjkqPjiWfvBgb.fQBA1tMZYY2yHNuDNJVTPmEnVl_LSjuftndbSyCPGsRtY
 GN2IUfD5JFT0A8CMyeEkvG9IFUa296UFNywGKxXW4Fc5O_BUrh7VAK_wtZpp8UoojDWhQFdJR2e8
 yLhPiXRa7qOxZOgFvYDjWct7gjG5tBfd3UaRIKInvim.I.wdyMrouugliKZR1OopRqfBTBnoF3tu
 WVXPvto99MQ8T9yUNzeCIJrPUGkrBMOViFLSqqiMLbllFPJOsIt9C3q2lKrD.U5qTjcHwN.vM9tV
 0PkHZ2MUHYCHLKER7T9MbrembLSQs9BOjZHTEgsCzjI73pDn5EGYGaO_kl2FKrr4djr5SPKRdeUp
 0JNeuQHrAADFiigv_w5Yt65zMDm8AMSQ_U6tKStBJC5TKSZsCHQAniAc4vGpG8YkrQodNKKm5kyc
 7SZv2Xjn5.upgKGubVSDIBbLDsfJ8R5TBqnIoTkFaBIajtLj5laqWJVlAumrpMrzc8LOf4qkspiW
 1_C9Os6GaHYGaGlsUpO4v7xuYHx.e1mdSBxnJUL7p07CNFLIVcRElgwW10r5cVlRverz6A3Dob0g
 ff.nE1FRWjFh_nHwXFSzjS1BWxFxQXpV4uWLGodobKTygHoI8eD7mfUNnW3JHHeohIV2DVjXkgKX
 iwo18ysLJsvR0LmBtHZ441cHi4NJnzFuAt_TFhpxjuqtBFg.86ll1MyNfDsAtALW5uB6jR5kKbAc
 ZBO1WTcTipnzoAFROwpSPDK7wYK4AXfjO80DjBxZY.UP0cWDIvF1TLrzIMHJ8qP9iJlLpKKre5Gj
 4yZLeMvFoiywMO79X3ZjJSA6OUml9AN8pknf_ztAD7OpH4xeiAA1t8imKzHp_.3hHOA7MfaoRfuv
 hC_0XPaizKyFJpXnmH3w6ngr6XWy7ITqBLgMicpxPT2n4q6hHtHy00IvZY1hFwc4HaAcif101xxi
 Jp6024iL.1z4SrN47ghsuvZv6gF6ZRM0hQxpPxVo3wrrlPZBK1sQzyqikGiu1mF4pQMYemaYzqDZ
 DR447mT1aoNu3mFsk6Nw3LVqzh9MhgeB8wT6N2BGBkp5G0cqq1WrbGgTA1aUzLP93W7zJtVQZ61M
 ch8TRtvBXL1o-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <7ed89fbe-a8b6-de9b-9056-4800d6a6e145@netscape.net>
Date: Thu, 31 Mar 2022 19:23:20 -0400
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
Content-Transfer-Encoding: 8bit
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
> (I kind of replying to this question at the end of the mail.)
>
> Is this code in hvmloader actually run in your case?

Hi Anthony,

Let me try to answer your question again. My tests indicate
that this code in hvmloader is actually run in my case. As I
mentioned in an earlier message, the allocation of the three
pages for the opregion is not done for the guest if I remove
this code from hvmloader. The only concern I had was about
the difference in what I was reading for the opregion address
in sysfs (fcffc018 in my case) and the address that hvmloader
wrote (fcffc000 in my case). The change is easily explained by
what the Qemu device model (both upstream and traditional)
does when the device model writes the opregion address into
the Intel IGD config attribute:

This is the traditional Qemu code in hw/pt_graphics.c:66

void igd_write_opregion(struct pt_dev *real_dev, uint32_t val)
{
     uint32_t host_opregion = 0;
     int ret;

     if ( igd_guest_opregion )
     {
         PT_LOG("opregion register already been set, ignoring %x\n", val);
         return;
     }

     host_opregion = pt_pci_host_read(real_dev->pci_dev, 
PCI_INTEL_OPREGION, 4);
     igd_guest_opregion = (val & ~0xfff) | (host_opregion & 0xfff);

------------------------ End of code snippet 
-----------------------------------

The offset of the opregion in the guest (0x18 in my case) is
recovered by that last statement. The upstream model does the
same thing using the constant XEN_PCI_INTEL_OPREGION_MASK
set to 0xfff to recover the offset.

So what we have in hvmloader is correct and necessary.

>
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

No, hvmloader wrote the mapped address and here we are
reading the opregion address of the host, not the mapped
address of the guest. There is no problem here.
> It this call to
> xc_domain_iomem_permission() does actually anything useful?
> Or is it by luck that the address returned by
> sysfs_dev_get_igd_opregion() happened to be the address that hvmloader
> is going to write?

No, it is not luck, we use the same constant in hvmloader,
Qemu, and here in this patch to properly map the opregion
to the guest, and the constant is PCI_INTEL_OPREGION, set
to 0xfc, the offset of where in the config attribute the
opregion address is stored.
>
> Or maybe hvmloader doesn't actually do anything?

It does do something, and what it does is necessary.

Regards,

Chuck

