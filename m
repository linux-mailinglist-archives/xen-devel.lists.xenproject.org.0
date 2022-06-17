Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEAE54FD79
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 21:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351550.578214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Hb7-0001Fv-2w; Fri, 17 Jun 2022 19:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351550.578214; Fri, 17 Jun 2022 19:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Hb6-0001E9-W0; Fri, 17 Jun 2022 19:25:36 +0000
Received: by outflank-mailman (input) for mailman id 351550;
 Fri, 17 Jun 2022 19:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JiXX=WY=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o2Hb5-00014E-2d
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 19:25:35 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40aa5375-ee73-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 21:25:33 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 17 Jun 2022 19:25:30 +0000
Received: by hermes--canary-production-bf1-8bb76d6cf-7lzpt (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 53c15538f9520d4ca7add3ad628bdd99; 
 Fri, 17 Jun 2022 19:25:27 +0000 (UTC)
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
X-Inumbo-ID: 40aa5375-ee73-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1655493930; bh=vlcQCj9UTfubRdysfbCKFBRm8+4ciyYN0AmNZyeI72E=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=W64Hyk0KdhYnX9eXyT8dkHrcfb1X5XZv8AEebzrnxObyxENzQd9OIgAO4PkNtn3wQBrRRMhQkVNtPlSyzi/4S+lnxxvgTvW+UfOdKK0RgY3JeqeKBguqiBPq9mkCKQ0fheaFk26ItpBqkHL8sszGW8YQ4uljRJ9ohpx8YV8m/khgVTBt/tUV8Bub/w0jB+jYRQxeMS1iwrJQJ/kCxKJdsca4OuecVjfExkj6B7UoC1juTbgsBZXP3MNKV3Ck1Fky03zv6pzojaIGHagcMbwydJJLeeKejyzjrTI/Oay/weoj95rHxGQF7uRRbIFHmkwZ9KpTLtcT/5s9atF/6QNy1g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655493930; bh=qNjS/Va1GoI+ySU9xTMv+RsojFuWBUgo1wrTLH0W6Vs=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Es6T2TayzTooeK/TnHPFo8rXiTQUGjG2tDGzDEqXwGQnjpU73Vq9HBZNX3a/uKnQrapPVLG5GwY8DXZFQyhBAfpyuCCap373EKRufPHwVjnsyn91c5uWoGUkkNNOoLg861tBMlC1ri2iCr6K62w0CxfUjXuQshzqxVoIq4Ar6qi+J8nuw5AQVkfKKfKOzcl4ZKhs0tDBz57Br1Unhtf5EW546UKiJJ0UG0FX3jcXjEYEcUSrmAK8H3wuqcivrfy2cQWDOZw1qUFZpSZ4yxw2bqehuRP9AD5I5xPJw6wuaso6h47PlP1ykGyfijXZtC5+gBw0lh8J+CpDOrnfeJVU/Q==
X-YMail-OSG: 8g2H05QVM1nOwZscjg4ZJammOfHkIfN3ZZ6OZuNaC42ui4CQlRdSNH5Y4XZuTRr
 Tx5uiohXqqP.4gxpF6vLw0XO3mSP_NO_YwGtBH2rMGHE0GtTBpbYG1tFXuDk1lt6cIfRHxo62Jp0
 aQpASMlIHe.J2gpkpqNlFyzcNKuqPMDcC85J2i73Pc7Sms9hG.eTGFcnVPkM8IEHmagqhqmwjqFc
 y1pkUWsr4Wkl8Jap4.NUt6GCVfkmVRQvD6cDC_h1z3YRjoYRKdzPYVFDtAlFXyNqEpLQ6Eug.nPu
 FDdUJtHYxSLmUv1adccIl8hu3AjINPI2UkFcaPtKDHrmtdR4TiziXzmt8W9B5y_Qiodv0k2.ZCOd
 .zpcQBlpkTnvG3hWtUkMMA_N12KiNYmuOnAGJh_frFTWHUs3XtL4dkDPfeywu3Z3SGMhLWNxMRB.
 7Zl6PmyYV3Kbv0vrXyrf93nTvQO.xHuJ7jHl57tSRcguczjZx.1FjdPEuk4cVLqZrCqLVytaw6Qn
 v65OuttbLHE4frViHxInC6_dURYnZuxxu1ikhUJ7aRbWJY83KUvaUibnvpBtpK0gtGkYeaFjQpxx
 VR9J0A4.zs.P7Hle.2lYoaLIlBUGaq0vxi873dJUfW0zoxllY7QBKhKpOPyIG_qr6PJRJ3gAVOBP
 BdMeTzw8.toDi_uZ9Bm8oYU_5Vu7BIdWLD3KG7j2lleyK4xt73XIIGIF7VOZMjhT8AdZa8QSvkb9
 AFV3RsVvsJUYj5AYMPNCcVlhKEcyTzZgBVOaEweEliWY196Tq71MQGksHwfJ6kCn9TUJVAirDy5Z
 pHHasKn_3m7N1wtq54PSB.pCSgIU.0qUkRwfhs_H4LZ_y7Ub5GFcxRY_NBwi78emUNyAbjPl5BQm
 MrmCXAaLuC8nQNUFLF5LW_GI8Zim_RdszAVH.U5VfAoT4Hbb2zz.0QWdD4oQR9jsO_z0bQnZPJNq
 Pufpqb9CF675czz0GgV4uYBXpjkuZQtoSN6RMiQ00QFGwaLdi0WcOpNft7P7ZrnLU0Vh5.fU_Pfg
 m07_pJJ8Lhe87vhwpi7JMEgBxfhqdoCT.e9rmHYk8b6S8u9GCZa92wXW4FJH2nfTMwsfcaGS5alx
 V4BR8QEuAGHq7UNQvWsnhTtu1PIlQyYGvr_mknCRO2TNiiN3.6D9WyPNn_fvquqB3VSAP5Hkljwc
 U8emc0tnAxKmb8TVYY3sPl8IpB1qjIvitBJ5nzAqwWRB4D7mz_2yuvuCznt.Tl2fEQU9uc7BYkRV
 jSs2q6BIk8FcABySKuMhnvDrxWwxAwtrSLV6MHBKKsoqNoKLt6AciTcOtb3yPZUJjpf2mxYpbrbj
 sXA3YgXEe.J3K1pcq8Es94ijnHufjh34e8nfLFlKDQy0LrOwGpEOsQbBuIPY7vU79L_ulmsPNusK
 LWiutpmNJeIt0QW4iBpF8_FFLlpyYR7.oQ0McGCg0ksk2d1ypF2zi3V0uKzwjh3XIoGg3YUKzbta
 IuK4hDSlkNddQhE1u9EGXZ9rRsx_CW499xfxEw1w3HOQVBoPkbKeXIOb9LGdpYlD5mH69_EA7LUZ
 n5GbCe.xjve1sX19h7mAaVo55huC_27w3Zi8qajh3zo10h5fJ.zwamWoA4iPQCUAlyckNID1s29J
 GWm17gh1D6sd1t1kmVXErVD105PHE5imSOb0pAOaahK78Q_v3f6M3siFQODxjaHs4t6E6CW5Pl3z
 84w9.JdAp.Nv6d3KrY205XOFhKYfJKLtpDS1p5TR0L.SiuCt6SWCudrnC8NxyG7wwiYNQljFxXxJ
 7.ytMcnivJyY7IzfBgtZ0pHAT6Gie9yjKzPBZXqSiUi3yzC5RXUCQ.TsKuVo9YvMY5hnSutLFjm.
 WKygxDVi3kBZN1.5b2dRXzC7sYT0yYLZEtpXvAVz.iayioMZazqd8UHRsrYQvUjYx2gIxDCaso1m
 cp6jKTb.MRyqmrQrs9jQ2xvSyafQTMvmue56WWJKkU85QTguKsrmaJOk6B7yLaV_G19MbdZLVQO_
 R1RCESAk3H5QRa0CdxKKhj5gf93a2Sa9RydT5NTiEp13Ze3ouiIml8DR7YR.m59jmECuEVolxa8g
 73UTBmDY16JqUi7aL8.v3B4_XbyY5Nhefc7PF_i9IuzJFDP.cazDG.wpzIQqHYrGIlM.h1txA1kb
 JLmgpRltGFgmLKco7IPcb1FszlNgjaV3MCSGS0FiVwvQr97Le5TJ75jDKcAKGc6SpD_dKO9RFcNw
 8.XryB.FFbJQ7QxhtXXU1
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <40ffbdbb-6af7-5ab0-7065-db5c0e718ed5@netscape.net>
Date: Fri, 17 Jun 2022 15:25:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/pass-through: don't create needless register group
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz.ref@aol.com>
 <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz@aol.com>
 <Yqx8ht2teAoRJF4b@perard.uk.xensource.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <Yqx8ht2teAoRJF4b@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20280 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 6/17/22 9:07 AM, Anthony PERARD wrote:
> On Fri, Jun 10, 2022 at 12:23:35PM -0400, Chuck Zmudzinski wrote:
>> Currently we are creating a register group for the Intel IGD OpRegion
>> for every device we pass through, but the XEN_PCI_INTEL_OPREGION
>> register group is only valid for an Intel IGD. Add a check to make
>> sure the device is an Intel IGD and a check that the administrator has
>> enabled gfx_passthru in the xl domain configuration. Require both checks
>> to be true before creating the register group. Use the existing
>> is_igd_vga_passthrough() function to check for a graphics device from
>> any vendor and that the administrator enabled gfx_passthru in the xl
>> domain configuration, but further require that the vendor be Intel,
>> because only Intel IGD devices have an Intel OpRegion. These are the
>> same checks hvmloader and libxl do to determine if the Intel OpRegion
>> needs to be mapped into the guest's memory.
>>
>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> ---
>>   hw/xen/xen_pt_config_init.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
>> index c5c4e943a8..ffd915654c 100644
>> --- a/hw/xen/xen_pt_config_init.c
>> +++ b/hw/xen/xen_pt_config_init.c
>> @@ -2037,6 +2037,10 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
>>            * therefore the size should be 0xff.
>>            */
> Could you move that comment? I think it would make more sense to comment
> the "reg_grp_offset=XEN_PCI_INTEL_OPREGION" line now that the `if` block
> also skip setting up the group on non-intel devices.

OK. I just e-mailed interested parties v2 that moves the comment
and mentions that the comment is moved in the commit message.

Best Regards,

Chuck

>
>>           if (xen_pt_emu_reg_grps[i].grp_id == XEN_PCI_INTEL_OPREGION) {
>> +            if (!is_igd_vga_passthrough(&s->real_device) ||
>> +                s->real_device.vendor_id != PCI_VENDOR_ID_INTEL) {
>> +                continue;
>> +            }
>>               reg_grp_offset = XEN_PCI_INTEL_OPREGION;
>>           }
> Thanks,
>


