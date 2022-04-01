Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0FC4EE55D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297136.506046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na593-0004ZF-K0; Fri, 01 Apr 2022 00:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297136.506046; Fri, 01 Apr 2022 00:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na593-0004Wv-H1; Fri, 01 Apr 2022 00:28:05 +0000
Received: by outflank-mailman (input) for mailman id 297136;
 Fri, 01 Apr 2022 00:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i0v6=UL=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1na591-0004Wo-RK
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:28:04 +0000
Received: from sonic316-55.consmr.mail.gq1.yahoo.com
 (sonic316-55.consmr.mail.gq1.yahoo.com [98.137.69.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94c7d5ec-b152-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:28:00 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 1 Apr 2022 00:27:57 +0000
Received: by kubenode531.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 0aca7176e3c3f08bb38673ef093c6c98; 
 Fri, 01 Apr 2022 00:27:53 +0000 (UTC)
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
X-Inumbo-ID: 94c7d5ec-b152-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648772877; bh=REYhcQUlmotzb05VyvmHeoG0pRdoVYI7C+xj0CPn9NQ=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=EHxVOZHKUaGIofvCW/X9PTBQEWjZRew2iCrLSeUloes/JMklF/I6cMhbBL3i3LQeyoaJFsW+fV2hZwSATk93gI0dGRBIfzaiG2mR75KkoKrWWTKy6bb3kxltyR1VhCWhO6JJGmGdYC7Pgff2L1WT4V+ngH1wdu83TwzWn+I09+O9T8XnxXam/QuBK/VoZalqAFlio2Qjya4I02J1uY8EaNEuvbA4a1u4/63fSzJN9VqV6+S0/+mUT18E+UR+JahgtbAwb/Vs7w4F/YShVj+7JAEkFeJEhh438Uy0l1ZI314dUwvKe+Iy1lJKaTaiRXBjTyvj9Re49hgseuGvwlMAqA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648772877; bh=aEinVykmyruplOHq4DQPnWkG3tuYx4/QXl8dYsfPGjr=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=nYhK5/MZWO14y+kXXj9dLqQ1Yk6srE+/kk6+Tprx3hi/785m7P+REOUfId1cjzv4lTGxbGbq7DCyVhuHyvPZoCOKuTepT3vdxF4dvN1mzltbaOztG1KViy0dQQmXM7KBpW1QfGHaqKe8Lz56hzJJX+zaPZiskZQSaazbeZDhBfyNLDF1mfq7Xc1Hk8yJJTKY6UDymRMn4p3vwWLJuGb0FxgbrenxVjF8y5cfsQBhkyq+3s0MmcOytO2M5VfKCHjXFinH77FfSfTjoxNA1fNZOA3usjLACLyML/NOdEmyUoIYtnXrL0zSSpXknCrkQ2iOLJStlbpfSui/9uHkBy64Mw==
X-YMail-OSG: nupj4QcVM1nf5x8sd0DV0uoSBB_jnm2b_JkpTn8I2u6uYV9KrOHIdOuFryeXyPf
 g0eCI35QNWwfzT9wUCRlobPvHIn.OyhEtt4QsXDqrbi_K.BdjtKlxndXZjHeRhbwY3OoBPXM0o3v
 ARZ9uIko2ZF7l4BRK1mxq9.yF_fMA2_XFhYMsI3WX2Q6g2LiMwL5ttVb7kloueZTFSTlakHFx7Dg
 hcRbQe.kBOhBNqyysEi1j8XGs33hFRSNnQ4_IrKb0Pa6ZRi3l5iSYtHYnhZfUT5K.XPwAZmUBb8h
 QWPz2_oWKeSQgXsyvsoubO3vgrZ8EZhzsDAWlkuDkuNdah9h3RsnGldle0j2UsHEB8bOK9548n62
 V6Njxu7pG.dJaS64wtUEKhO8W47pNN.rrwfiwDoFZLi0dIJ7LpCwIgPMP._ADRtb0P61NMlDZX6Q
 T9iVxu2c3OShC393LrgFYR7GklnrVhj0r9uexo.7KO3YiN8wa3zTliplA2oPUC4soaqHWdUBfYU7
 Y2Fe2d0cieXY_RQmuSZJOQ4dHT6y62DyKHVWAj0uYe_RNR_WY5UOqn042oH09dPVBQzs9JMxDFK0
 s_TUjTE3k_zDu4T00NUoPJ4r_eYOVqbMQmFrSvSZqLSl1yzqEoPhWzaPIeI_NsxWcEuztZJZ13zJ
 STzVKJ3RWSLC3biT6dD4NMaH3TrMAXTt6F8wYlt4s.xXnueVw8rjyK4Y4LHXG1n5Kpf1C6SWhtUh
 LGwDYFkAcQU.9DLWrP95WaJ0RVNVKaYDmnCDTJxM0ZPFIZXCmoyjh4FhIdDO2gcJdCreuEfB4P9w
 LauZWBCukFfqjEaCVLT9tu54p_KQaD4LzZoNCxowN5J6plK_7UTktMK0xkAaHDEuPi3giBlOuBOX
 5uMqs9Ivs4DdJlHs6uslu6o1q7gIAWGgyCbPQw2ccVXs9aosQcNcrLqcZ7APw0gmD6Lae2rz1EXA
 VfRDeDCReS2FfCJh9Bi3QUIH.zD0PnHndmr7k74Gub6RZEylzfUf.DqMcYnlCmfAWnJd5GiUXPmI
 Nwl4XwOGZTSoN7L4ekEeCfIAeATDy1aDGIJJpPNBYESIEbpRfq9QpjkGUBaA1rc7NgN.gtnMHt66
 w8fkWgf_tw3aReoc0Y.nWqtzZr_9fG90Ptmv.XGBIdcE62rVoWv49lah45qzRyaRyB0wLnNhE7Gr
 zuNHbIzjDNkXS0QAGgF56bhLwpdLS9Bgkuj7Jjx4zSH9NvwKZQW3wGgR1_oqnFXEbepvzqtR_i45
 vVy4JIM5bErswBDQeMkyC4t552wXkumk1IejQP6n4GW5wn3KiZs5L4Yoiz7DLRmX1AIEwFEko8wS
 jSK4KFoAUr5E_CytaxYuLtslQIOPhrwWflTePaNCYVvcMwkXAasDt2h_RhDTVvtLjeVB0vcErWCL
 3G0MIbtOBLe7RTadQCQiDyMD..CWVzA_xUQ4WQ5qMPdH5MKHDFKuwjqao6vl1OOK2Fx..BMo7_5y
 ._Xv7MZ2MQFNmxizM1.S3NORK78u5m8aZrV5ooiev7rjud0fQE2VHf4sEXSlVF0EnVir0tFg4pI1
 wYKu5EC5snlDSsWpD_lVxaCZZMxYDCni8ic8OxjsWvRVoPiQp7TDV9xXBwEWmc9iv3WQ_zwThfI4
 NfXl5R2fr4rDJ6q.f894wAZS7kWcJt1bQL5vPjwKQyRjEprtmSNmpfityIQ4xW9MGtCflzgpR1Hg
 GdEhkkFRZyRYP3_Cl7CV_DhEKXVwfDz3Q_tFR9cQXP8Ogx8zTYoYx4gIA6xRHK7he.KsWkvyBD8g
 yutUSapb7H5u3NqcGeSdOQc.v5XOihzJzcmDq7654akFyhvJVBF.5v7qOzJPsECPxAQ652Wj8qKF
 Du1ZrYBo84Wvy8HIahy3E.1cQk7K8W7XuzvI6p0DPCqhw3.cjru76QDNmX2zO5crZwLr7bGpxSlq
 QjvBZM4xX10xwAgQWT0LNQtkwkXxlxWj21Hh0tjI7YTM885th5.9OxtZhKbxknO7eOpAYieoZJPk
 rEUoG1nA_7VApqYDSm8bhfY749zMF2_I2tkfQKh9FQGiOPj48sLeOHuoPxYuTsTyYXEsw8j_guCR
 Uam.aRg6RycQ4SoBGsLvequBSbAIcDYGF2NAaakR.mwzuAkQhUtyWg7.01.Z8PupFZmBUFKhX13w
 gttO8m8Cu4luzBfiO.1O0kqnaVWuflPXeXYm1QK2zfBtt3vYC3g61EXtZpjKN7ZKHTSpSUcGIL63
 I70QsmBCh2wc-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <9db571e8-aa01-c4a3-a7e3-aa93a49d6e06@netscape.net>
Date: Thu, 31 Mar 2022 20:27:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
 <4b40eb36-71b5-d3dc-8551-73a684bff2dc@netscape.net>
In-Reply-To: <4b40eb36-71b5-d3dc-8551-73a684bff2dc@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/31/22 2:32 PM, Chuck Zmudzinski wrote:
> On 3/30/22 1:15 PM, Anthony PERARD wrote:
>> Hi Chuck,
>>
>> On Sun, Mar 13, 2022 at 11:41:37PM -0400, Chuck Zmudzinski wrote:
>>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>>> opregion to the guest but libxl does not grant the guest permission to
>> I'm not reading the same thing when looking at code in hvmloader. It
>> seems that hvmloader allocate some memory for the IGD opregion rather
>> than mapping it.
>>
>>
>> tools/firmware/hvmloader/pci.c:184
>>      if ( vendor_id == 0x8086 )
>>      {
>>          igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
>>          /*
>>           * Write the the OpRegion offset to give the opregion
>>           * address to the device model. The device model will trap
>>           * and map the OpRegion at the give address.
>>           */
>>          pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>                     igd_opregion_pgbase << PAGE_SHIFT);
>>      }
>>
>> I think this write would go through QEMU, does it do something with it?
>> (I kind of replying to this question at the end of the mail.)
>>
>> Is this code in hvmloader actually run in your case?
>
> Hi Anthony,
> ...
> So the conclusion is that hvmloader does allocate the three pages in the
> guest for the opregion and writes a value for the opregion address, but
> it appears it is overwritten later with the error value when the guest
> cannot access the opregion and with the correct value when the guest can
> access the opregion.
>
> So I agree that I should understand what is going on here better. I
> tentatively think the call to pci_writel in hvmloader can be safely
> removed because that value seems to be changed later on somewhere.

After discovering how the device model recovers the offset
of the opregion from the page boundary, I am now certain
that what we currently have in hvmloader is necessary. We
do need to call pci_writel in hvmolader because that is where
we write the mapped value of the page-aligned address of
the opregion in the guest, and then the device model reads
that value, recovers the offset of the opregion to the page
boundary, and writes the address of the beginning of the
opregion, not the page-aligned address that hvmloader wrote,
into the config attribute of the Intel IGD that is passed
through to the guest. That is why it seemed to me that the
address was changed somewhere. The device model modifies
it so it is the actual address of the opregion and not the address
of the page boundary that immediately precedes the opregion.
I hope this is an acceptable explanation of what we currently
have in hvmloader.

Regards,

Chuck

