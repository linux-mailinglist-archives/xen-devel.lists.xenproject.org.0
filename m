Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7D4D628F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 14:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289042.490347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfcb-0001rI-Cp; Fri, 11 Mar 2022 13:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289042.490347; Fri, 11 Mar 2022 13:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfcb-0001om-8F; Fri, 11 Mar 2022 13:47:57 +0000
Received: by outflank-mailman (input) for mailman id 289042;
 Fri, 11 Mar 2022 13:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7gA=TW=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nSfcZ-0001oe-2r
 for xen-devel@lists.xen.org; Fri, 11 Mar 2022 13:47:55 +0000
Received: from sonic305-20.consmr.mail.gq1.yahoo.com
 (sonic305-20.consmr.mail.gq1.yahoo.com [98.137.64.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6721d68-a141-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 14:47:51 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Fri, 11 Mar 2022 13:47:48 +0000
Received: by kubenode549.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 9b8a9a8043f39f48f46947ac260309e3; 
 Fri, 11 Mar 2022 13:47:44 +0000 (UTC)
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
X-Inumbo-ID: d6721d68-a141-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647006468; bh=kWpHkZBAz6H+US7utCYqzMOteRtCtfOqLW3VfN4Z1yc=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=e+pMt9jgKgIgX/uH1AhIknz9+TSeedLCdtJ3VH1bCEpJuZAZlFUxfIOr2ikLyJAbmxZjVYPX6fGrN4KoVXAoxQkB02pLK4O82jScsGzOFMxb+RuWxb5EbvOorEY/uufzCGMnCxd+O+c9g19J3DXDI8c6sjufowrnCcr1o1ddCs7cvwayna/wejL+j2dD/QADkirUUpPvZrgqZRXIFiboXjVTA4BfrVboGbj4stCSw9hMfdrmDBxqWjZqbyoUQ28OIgt2V72fpv3IUSpt+duI8w8cqV+OEdpVFQOiDsRbRDdNSCQxAdm17R2Wt2vZrI+ytwXG91vn9dLjrKTlZPedkA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647006468; bh=g2DpNCmSj0RDoYrNEkCgy0YSHOYA5n0qOPEZtw+asYN=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=ZRkud6mcLQ1xXbHR34ywjN8OeEzryQk2hlFUP1snrIGB02sJgu+htaRXxx5vfsh7A6dOx9/eshzZi2gqLtKvChAS5bf+/Yjqlrgxl6oUygMYXpu1gfcBrRVi+A9jsNvWTv3eF/KdmGC5/QKKmz05hNLB9Tx2f8FTP2gY8tDI7ppzRX+Cr3DuWIAahSNx3EhInCmiN96yZ+58L0dAOFkg8p91Vg6wQHN0WkneH5J/iITokPIhteMdQBboWTwRP34ledJuEeKbPozYKViPJ8UsFDFjW8WJ8JYow+xuv+zCODpaoOGbqhxYTdDHlpB+VrCgnz8uv0SLI/WmZHS5JPtYkg==
X-YMail-OSG: qN.zYq0VM1nZ1PDCLQBYE0D1VbxdPbZLm3ZKLkhmC8f_NJXvVfc6ieYNQDeGZKZ
 cqh2HSWf9asSSEUJtRs0cs.GQJhQauNdVQxx0JuacX3nEBtv49V1a0XwiRbZvX3Zid9YwVHafebK
 AOS_Y4SFHYipRuSKnCXQH2YkLGLzJYtOLiCg7auQR6tHha94EGhJLTsyoMYkX2h8aOb1bO060Ga2
 33.G.NwuHq2eFJHGQEi.S4mO.3hUGhoHPARWZScvEjMAGRDkC6avAmcYy5_3oaymjQyt11CTCH1g
 bZGVAxc2DFbhT0kiVlrY7c.o41pOpy2vlINSz5iqW6JqumH0CufDNT1RildxbtlLHo6Bt1x3DB77
 Zn3pPnW.nvjZ1x58OL_2z.VDCMcwbsEVTl7D6ql64nzd_ttJaUs0OAiFzwfdp5iyL0Z_ZHjkbma6
 u.Z9HK23o.yQT39HI7EqKmvHvYOZWPno0VWKdZGyhL_4A9KEH0WNRt98ounoV9ybgvdZYc0LRMyu
 izVF5.6vdw6XzZ5hpzY6tvioY_hbW7u4wybRD_d5EjgHN29gU0cZkNqcFfId9dQ1eWfr5.XKw45A
 sBopvuD8WzN6xH9AHz1Uh_I.anYP_LDZOpjzSfdxrbkQd4rNwRjw5zo3l1o9dZfiHywYeH136R2f
 QtmuPiycLt15WN.PZtpS2tIn0KvfvcLfYU5qvPCGB4nIYU5uPUSWpeLRiAQWNIH5xgXC6Nz2S2rh
 HxZmHywswuzBiGtixYij7vnry5sQ9cXagaoMMVw3rplUVM_ejbJcWPhS_WomqRN4PDbbLZsd2K3H
 09m2gYxuKI2IAef5yYkortEj7M8s0MJ927F4aiiT_mTSZ8kVgh8WOVevH9CiNN14R0xh5zWnnKQi
 N2brGkOcrgBdG.x_c2yaqGAWzgUDPxiISXuiXhvvZIsND81jCrWfW5WVzVq0oovp6GZcxoM2HQ03
 Dj7KrtYcHdB9UyZ599fI.NDp6E8Prjo8LIWuTDTqJr_2TU3vTypj3gnJ2RyT0L33Iut3y0MizX4y
 SnV9cv0yvUcTD3vMBhysQOv.dbyxwo.po30zk5yAAEdbkXNkWcdZAOJG8pGN0Ux8ui2qYpp0Jjp2
 M_y7v4Y49MCIYahXiaSDJ8mwc2KLqjDRIBOpYPeoXq5Jys8ZbDV7KZ33KW33MGBLlrmN5ZT6W2Kw
 wCkHJE4SlEHsftMNBp5jVKQ0GttY4p9UUN_lws8CBY9cl_DyjIPuaMPK3VCbbnxY5MqJ1Bw1TOYN
 eWrrdsqBRjKD2NCirIHDIJ4GZE6cPw2CaBr5FSSaeiAs1M3CTWjdgD4aWyxARkQgxeDrzyTPpm0P
 E8fb6jBxmOXhTjaNnM_TagbeOIhLvxl3FKXV7ODXvSdNi5IFH6z8Vvfq4Z0TUbuziCK_Vf1KBJzY
 U84c6ua6Z1rD5JWR3023GNjknR8OpVfi5wDUgcPuShz4JiKEL3oPRGljV2aXh9HD0xn5GcGyw8ay
 Ye5sQNnzhpJiyVU96s4lLXcOe8sEW9xujCPasCEuzDkdNZ3y4jLGyOVYcZ.BVd6gxnRsfLvn8.pP
 LCRa8eCbkDNT0bVmSpAsV3GkbYA10jQSASiz5X5liE6e._fgXg87R8zAg3JB.vDvKB2P.nHb.cLZ
 YARGmCo63i08GBzb7KP4ngVjgxStmrTRZxVBWB3zr7L6XeVfvV3Yo7AdUZ5wEEzNkHjHJEoDjruM
 2a2qTvZUbuUi3d98WKJKM4Qpfsw2ldu_E319tEykXyXqwGgFaumZwpiFAd1S.upi_M0uBIiwmalo
 I5a9W9KZyFVKLLlvwg.mfpdxT70GGnHqqG9r3qCZzWuH2JN4Y_Glur1QMtf_WnaAvN0gDp_Pyw3_
 9UKTwoLIRZK7LGyJ.3.AChnaO27d0.Jj7VsZPO3yHE8t.TWL3cXTy_yD6XJDyBQ0dLIR8ibM7qRE
 rz20OKNFNaOMVEQ7k3mgNX1JQT6zkwd0xGdl10FEtVQGoAYNGe6pe.RU9Vu7lbUb_SOm3UoYlxdG
 uMyvL7Ogd.PDqmmbmn3egMJXEtM5QXzGhEF6b70Yk1Z84FQ7FhJQcQeIa34rDUKdalTO8LWPQhvs
 uikG8DjQhP9zjSwpBQvfGzTyupUf0OUK0o6g9uIV72BmMA0N7Sib8ZwkoKJFgL5AEh.zibysq6gd
 AuqfNEcLFr4mg4St_RwCD2n0lK2obc5o7iHJ.FzS57DJCEm64CdHFYNvYvQV1q4jNeIzvOzuLizH
 Z47Y-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <ed955608-9c62-3dc8-fbcc-df5b4d3c5e46@netscape.net>
Date: Fri, 11 Mar 2022 08:47:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Chuck Zmudzinski <brchuckz@netscape.net>
Subject: Re: BUG: libxenlight fails to grant permission to access Intel IGD
 Opregion
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
References: <4703b7f1-8d3c-5128-213c-e39f487e4cde.ref@netscape.net>
 <4703b7f1-8d3c-5128-213c-e39f487e4cde@netscape.net>
 <2e74415a-d0d4-321b-be2e-a14db297c51a@suse.com>
Content-Language: en-US
In-Reply-To: <2e74415a-d0d4-321b-be2e-a14db297c51a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/11/2022 3:09 AM, Jan Beulich wrote:
> On 11.03.2022 06:01, Chuck Zmudzinski wrote:
>> Further research showed that these two pages at 0xcc490 are for the
>> Intel IGD opregion, and because this memory is not permitted to be
>> accessed by the domain, the passthrough of an Intel IGD to a Linux
>> HVM domain fails, causing a crash of the Linux i915.ko kernel module
>> in the HVM domain. My testing, which was on a desktop with a Haswell
>> Intel CPU/IGD, confirmed that these two extra pages need to be
>> permitted in order for passthrough of the Intel IGD to a Linux
>> domain to work properly.
>>
>> I find that adding two pages is enough to fix the problem, but I
>> have read in other places that the Opregion is actually three pages,
>> and maybe newer revisions of the Intel IGD do need three pages instead
>> of two. I am testing on a Haswell Intel chip, which is over 8 years old
>> now. So the patch I propose adds two pages, but I am not sure if
>> it should be three pages for newer Intel chips.
>>
>> The failure to map this memory with gfx_passthru enabled
>> is therefore a bug, a regression that was introduced with the two
>> aforementioned patches way back in 2014 when Xen 4.5 was under
>> development.
> Thanks for this analysis. It looks quite plausible (but the question
> of 2 vs 3 pages of course needs resolving).
>
>> Once I developed a patch, I did more testing with the traditional
>> Qemu device model and Debian's package of Xen-4.16 for Debian
>> sid/unstable after I discovered where this bug first appeared in
>> Xen 4.5-unstable back in 2014. In my testing, Windows HVM domains are
>> not affected by this bug and they function properly, most likely
>> because proprietary Intel graphics drivers for Windows are more
>> forgiving than the Linux open source drivers for Intel graphics
>> regarding the details of how Xen and Qemu configure the domain.
>>
>> This bug still exists in current supported versions of Xen
>> because in Xen 4.16, passthrough of my Haswell Intel IGD to a Linux
>> domain still fails with a crash of the i915 Linux kernel module in
>> the Linux unprivileged domain when the traditional Qemu device model
>> is used in dom0. The patch at the end of this message fixes it.
>>
>> I have not yet succeeded in reproducing this bug with the
>> upstream device model because there is another bug in Qemu
>> upstream that breaks passthrough of the Intel IGD to a Linux HVM
>> domU, so for now, to reproduce it, please use the traditional device
>> model.
>>
>> Also, as a starting point to reproduce the bug, first get Intel IGD
>> passthrough to a Windows HVM domain using the Qemu traditional
>> device model working on Xen 4.16. Then replace the Windows HVM domain
>> with a Linux HVM domain, keeping everything else the same including
>> the Qemu traditional device model. I tested using a Debian 11.2
>> (bullseye) HVM domain and Debian sid/unstable with Xen 4.16 and
>> a build of the Qemu traditional device model from source as
>> provided on xenbits.xen.org
>>
>> I am using a desktop computer and the xl toolstack and Xen as
>> packaged by Debian, except that I added the traditional device
>> model that Debian does not provide.
>>
>> If you need more info, please let me know. I am not subscribed to
>> xen-devel so please cc me with your replies.
>>
>> Regards,
>>
>> Chuck
>>
>> Here is the patch that fixes the bug on Debian sid/Xen 4.16:
> As to an actual patch for us to take - please see
> docs/process/sending-patches.pandoc for the formal requirements.
> (Note this was recently introduced, so you won't find it in the
> 4.16 sources. But your patch wants to be against latest staging
> anyway.)
>
> Jan
>

After resolving the question of two vs. three pages, I will follow
the process for submitting a patch against the latest staging.

Qubes OS has a patch that uses three pages, and the
igd.c pci file in Qemu's hw/vfio directory also specifies
three pages, but if two is enough, that seems to be safer.
I haven't checked yet to see if there is an official specification
from Intel. I will start by looking in the Linux kernel i915
driver code which might give a clue.

Chuck

