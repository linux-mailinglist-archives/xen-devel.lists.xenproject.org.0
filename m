Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E30566A525
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 22:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477540.740271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGReE-0005S1-EN; Fri, 13 Jan 2023 21:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477540.740271; Fri, 13 Jan 2023 21:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGReE-0005Pn-Aw; Fri, 13 Jan 2023 21:31:38 +0000
Received: by outflank-mailman (input) for mailman id 477540;
 Fri, 13 Jan 2023 21:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WVX=5K=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pGReD-0005Pe-5D
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 21:31:37 +0000
Received: from sonic316-55.consmr.mail.gq1.yahoo.com
 (sonic316-55.consmr.mail.gq1.yahoo.com [98.137.69.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5609782-9389-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 22:31:34 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 13 Jan 2023 21:31:30 +0000
Received: by hermes--production-ne1-5648bd7666-rmxcl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a9fd17d81623f8a2df35139df8a71637; 
 Fri, 13 Jan 2023 21:31:29 +0000 (UTC)
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
X-Inumbo-ID: a5609782-9389-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673645490; bh=zSS9bg22QrDSgJE/e9kb2PDlrQOOObt1PP1nAHObc1Y=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=pqyKqsArVAcVi1TrG0HJ4FWK3gdVGBK9YNKZdem7dmGoLf8HEfE9kVBIPJaOKbDxikQeCXSsapNXVFY+O1i3m53SK8EdE6LjWgnC1Zm3e2rx7ecCnf5zOginfDO8vt5pjrsQvd7q7YSlUh8Vms/1OYcJqkyLBOPbfhTd97e/WrLv7qokqdTXVJ71RFlB79VmQBect1gqgy703blyyLtd4aZLNvC1YTwbRso+vGFCutPnmjEKM4FD8nWejLS32Pd1NWgxIfxGcp845yyfxtbG1pf7F5gJA/Jkg6kCxqWLeO1ycikifdf2zjp4/ap+k3kSWTziwu3pXDkjqNjGZRbzQw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673645490; bh=VKGF0VO/0VjR57ED+43hWAQheJ7Aqc6aXborCs1N5YA=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=oH0oU4dcyrx4/8f8pqIDKM9Qg1KDTTMAgCnNvrkcVV8INuX8dnIlEAyxMqAhv1XH9ymocfrVGYE4aJdtTiJjkf51xYK3FmuJ54mWe94gFZriXdBKFIJgFKpuMscS3AMxuTG3mPHm92buOB37fKxYPebvNZQKF6kgZvq1J20o0FhWdAg3ENcT0+uL3qUnySy9HOl00fzTjLMsSJoB0kbUBSQ7VBOfN1PYL2m23QdXpEpkjfQqUiUtamH81LALRDT09ym3ObfY6RU6oARLBj1j+gGjCrgTd8DDgvWzFmdY+eiMuYNoOsOL+QQe2cQJa8uWU1XYUrVK2l5XTx78+oOhSQ==
X-YMail-OSG: xC1oVbAVM1lS749HRPIGTcqAcF_WTml09OpNX5v1hv7ie2F6eIxLFNG2s.UbZhm
 .5TdgaGXi_J2BPZQz2ahLR0C.SHmnXVzeK7z8ro86RQgSOgvgeDQTotYJLVfX8a8Cbhn8DcbaPBq
 9nQaP4r8LwekD6vf_ZCm9XSP2pW.phlkggvZprO_e7_V_67DSja92zb2iuQYkaQn0TyRMbJHHMni
 6J0C2YzSDJyrk1b.JOZpBPFxC32CDUU9v.ebjL3KiiX6n4mmSU2SJYdvtvJ_OZTc7T7jL3ZMcfEg
 R3gsK2rWaQ1LaPO1hzUTk4Sg8ZXMuvb2RzY3Pn31rHghfZ620PadguxbY4vJfPxa11w5a_8h3x_E
 3NcJVwX4jt3dEpwFXHd5A_QZrUVAeVGWcuzrho7LoJ7zCHIUuVT.2VrwoQCgnjSCvYBq6axbIldT
 0RENBMdqjyY8DksE9jLSBdOdUaSV16snZlusWreA4clCun.MjRZSi2ZXfG9iI5sjLtRVNqNRFWaN
 p.R8w_2qW0qS32uP74J9EG.O5JoCE7Oy6.4OP_w5owD47XnY5stiQuUNFSKMTccJcFB1iz5mliQ.
 rGZexjlakp3labgBKudZmXoFU1PXyDFIVDIfw.PxAO.3.AICRhzprxcsXN4yYzHuqD.Oofn3FSJe
 vb0Bk0ATPrXZO9lXmAScXhu1qlfqW1yVEEQGFToJQ2THrx.BFQYcWAlKqa3XG1ycKkTkiHU1dFT2
 0QsDABPw76RjwPcxA4fVb.MF6maYRyDsgFAY1Nw2UUuW_T7m2WxK62L9PP9NdKboQU8ujSdoo1Ug
 52kpsqeOb9D0EyCGuSQm6rw2xThdLKMSVfDVG23FDYXm96olpsaqT0Q1rNglZFYTlJ2RfzLgZky7
 JOf21Ay7Kn9F9iPoapncy_1PR90Wo7aTZ1hjnoYY3WmUQSHtK.vcAEoDLus9V5XUgBUT1dBoAorj
 TVEbKiOY90rnz3G7zuET4yqpf8iDkTVvVKsVwL9xeIxArCOS3uwJ2.0wvOP2uBvJKjx6U4oghW73
 WzV846QDUGSGpBcOTDFdxhaDpPPlp46wIprxJeGy_ALC4xNx8Suub.iZ2gCTIk2zjeH2lgQVuUYJ
 N0YiBqNiq90R1c6ikIykklF_1DLXJiMYcqvbeW4AduoCy35fTik2nOgL238WTA3X7mos6INsvE6.
 FBMCkPnbtkn6Gn9aHEXSfLzPUxywkNqwfHrLGSvG0E5YlSYqXNx1cNvMI4d5ShJdfhZHAr3vqM40
 sLqIuA3hjl1vOgPkTih7JcdBXlSKFdZZYopeknm3XLZ0rv4hUBL_.q4RhSRb0WjE2jlwLDkO41Ng
 8b2sFo.IlA6lKK4qlEzjjLpmLA7c1hOW5VqOvYQ64oGKMfh.tOM1giHXvmnPJRSol0b6YZwRPn.y
 Hg2hn8.3EwdD4x4Mim1GfgNPstO6HCvIrENcN5ScgbsScY_4kW3b4svoedD.efW67_48kniRh6cN
 51LVzw1.tCbm1PYjbhsr3e9_N29sd7usejKUCR53upZ1rxxvFlOfjC9aL571QUI1iE5TrC5SCi6V
 r3g_cnQfHjSf.gMI9L7WfftsstdRs9LLyk9Ow5VqDWfA49FHiOERFcZRXP8Qp.cUa42Lcz9NzWMO
 mTH3YX1aSTBJW2h796FPf460LUGvFiIIQc7GmcUOWXdcA6f_8Yd3JHimtZyqWiJfmbMsZ09pe9SQ
 0CZWQm_ySINs04qVyEJPQo162lulW.MnRh_iWMcZ3z.zyngR_ubAo_LoL7eGG_G0mrttcYcVDWqa
 qDWMd9Jqj55yS7mHd3MKKY7AqTnzKhFQJar1oVuHFg5pkQr1bBJrTbhim2wgIph3MNsCm.53fiOL
 nnU9_kOGtVS9NUJAgISu_7K5Es42j3owsl_ETBjNTIRm6l_dyBtjrHteZA21AnlO9gF3QAjRwH91
 _YNtXNQUaqttY0InnVpb673ZG4avuPBOz8GtC7QW_cStKySk0m3GvHT.KozyPToyIUr3KlbaWWy2
 4Yy8_Kqlk_CMYYF2BXggRh9W2RWtsq2rkprWpthrbn0npzqZfKkr6pVjQ2W.nEWZdmRmWNdzn4C7
 VQEt8UoG6Q.oBfpSX75FRIq76F4Q2IlIA.V.8z.FI3eRItQQOeiaOSVgWmk1nMtzWLyqxT7o5Xq0
 XuWnLecQ1nqn0S2F5KSHvOyntFuxV1NFBVTLjyWlE6lOanb2SVSruw6tASR6X4SarkjIaJctKZM0
 Sv84n_u9IOfo-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
Date: Fri, 13 Jan 2023 16:31:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
 <20230112180314-mutt-send-email-mst@kernel.org>
 <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
 <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/13/23 4:33 AM, Igor Mammedov wrote:
> On Thu, 12 Jan 2023 23:14:26 -0500
> Chuck Zmudzinski <brchuckz@aol.com> wrote:
> 
>> On 1/12/23 6:03 PM, Michael S. Tsirkin wrote:
>> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:  
>> >> I think the change Michael suggests is very minimalistic: Move the if
>> >> condition around xen_igd_reserve_slot() into the function itself and
>> >> always call it there unconditionally -- basically turning three lines
>> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
>> >> Michael further suggests to rename it to something more general. All
>> >> in all no big changes required.  
>> > 
>> > yes, exactly.
>> >   
>> 
>> OK, got it. I can do that along with the other suggestions.
> 
> have you considered instead of reservation, putting a slot check in device model
> and if it's intel igd being passed through, fail at realize time  if it can't take
> required slot (with a error directing user to fix command line)?

Yes, but the core pci code currently already fails at realize time
with a useful error message if the user tries to use slot 2 for the
igd, because of the xen platform device which has slot 2. The user
can fix this without patching qemu, but having the user fix it on
the command line is not the best way to solve the problem, primarily
because the user would need to hotplug the xen platform device via a
command line option instead of having the xen platform device added by
pc_xen_hvm_init functions almost immediately after creating the pci
bus, and that delay in adding the xen platform device degrades
startup performance of the guest.

> That could be less complicated than dealing with slot reservations at the cost of
> being less convenient.

And also a cost of reduced startup performance.

However, the performance hit can be prevented by assigning slot
3 instead of slot 2 for the xen platform device if igd passthrough
is configured on the command line instead of doing slot reservation,
but there would still be less convenience and, for libxl users, an
inability to easily configure the command line so that the igd can
still have slot 2 without a hacky and error-prone patch to libxl to
deal with this problem.

I did post a patch on xen-devel to fix this using libxl, but so far
it has not yet been reviewed and I mentioned in that patch that the
approach of patching qemu so qemu reserves slot 2 for the igd is less
prone to coding errors and is easier to maintain than the patch that
would be required to implement the fix in libxl.

