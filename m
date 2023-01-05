Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6D65F59D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 22:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472186.732325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDXf4-0003HN-MD; Thu, 05 Jan 2023 21:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472186.732325; Thu, 05 Jan 2023 21:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDXf4-0003FA-JO; Thu, 05 Jan 2023 21:20:30 +0000
Received: by outflank-mailman (input) for mailman id 472186;
 Thu, 05 Jan 2023 21:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cz8e=5C=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDXf2-0003F4-Ju
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 21:20:29 +0000
Received: from sonic314-20.consmr.mail.gq1.yahoo.com
 (sonic314-20.consmr.mail.gq1.yahoo.com [98.137.69.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4b19715-8d3e-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 22:20:26 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Thu, 5 Jan 2023 21:20:23 +0000
Received: by hermes--production-bf1-5458f64d4-qthpt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3ae8c14202cbd65911d34094373944e4; 
 Thu, 05 Jan 2023 21:20:18 +0000 (UTC)
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
X-Inumbo-ID: c4b19715-8d3e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672953623; bh=NA4PsefjDtPgPqtlyXz47iDncBWU1Smv50WH37X63KI=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=FuoCFGtdpukvOkCciwKmcGKLHqacIweVRaRLWLwU/ULIdq6Pu+0E756V/cQbyzXvDRrdGIuyODdILXwdzsCiEj7i/mkKI74ewXvfN+xB88ZmcVAQHB/ZergsVg/MKma2vQyJCqI2/nNXF+dgLvnI88NNSEAGo4qpMryfwQCscbo/gXBgqwH3UiodD/6mVgWf0OdGvlwgF+1YIABOI2BF/cdzW2u27O6DQCN/ymMmYWlE3fSk+Aqfs0adwbQXgS4NzhmmUwBqm09rkytMwxVfhKXS0oexRIWqtdK+qdTXqRJggPetYKSkeHXzQXlWYunZ9I7LjA53inTRpKcODhtSGQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672953623; bh=hof15gZ0OQwZiOINK1+nvXS3/ZOloYg/esR0maWeSKU=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=NstvfaDt1BeTqp4xp7OWIGZd03giDoK6wtR8WP1ENFFZGBuFOR+/C7nsC2IOXj5yH5HDwsRUcuNKQx/OsBW3uD45p9sIkzaSe23Dw5Cv1QZoc841snF82OlWkYWYAda8dROYKizVIAEgG0zprVAUWV9n78WUMkEQDP3PEDF7n740rtGmSIT20KGLUnWdUZ/3gjFnyay2bXu4tBD5Lp++dDFkjIeC8FLFpXcBSeRxThGj9/cEAnC8PSMqcPB60QQbj2oq6JF9fiTkF++FZ/9hLa/pX1Q5rUMhBW7clZD4W6/C4vy51Fc7qqcGGAxqdc5LqnGBVx3qlpiinB86Fa2bzA==
X-YMail-OSG: FEjuAi8VM1kbyC.qcEennX6bxIhKcpE1uGVa7upuD2iMQq.681tscMkpRL0LDLI
 gX4vGip4JEhHlBSmKio3sJbpVzFjaexMKTV8rGBLcIurOYUDz_tOtLJDGtNiPX9zOKxVK7RZI6pZ
 0NOgdIwDy08e63NMuekOGtUnPNLKk3EhD47wr8a86utP351NDAJRzbMJaJfSFPiGNbHFplBvUUIi
 kXUXqHmolCPDdZJRfZHkoCUduPb1J6pfK5J1.vpj8rUq7d_gKB5nOOCNAeuQPBAJpdHh1gaL5664
 drpIYh4aHYU67Uf_gHbludebiZh8y7RTQ.fBlyC4O9Hzw1xY9T6eEJXUhDyxsZRdifUZ8pILdDQN
 ozFDELeC2.Fa_8DBrnaPIsLSosfIQtBkR8hwW7nncEO78MBV0Gma_nB.gkuUnkCcAjty8.W20ECV
 weTThqRdjxwTL.IJraHgeTOJPhBYayJr8rwnEk7PyihGSXZV8Ebi6dq1_NoOTkSNLZSt7up6eJlH
 N4JHCt7mwyG6y.L265B6oP5rCFsXtgyM4cAd5slq0MRehUCMrvhGTBoY9GPMKhnIU7t7FxdZtfPD
 vR18H12P5g9mviyL00rB80NJKNJTKzehp57PONLks44qNHGWGvhm6RzlGqtlej5tsDbYume9McrT
 mEQ51kWFzgUiJDtoJQsXkkP2..pxLBSiSYeTy4XPH51u7EY1eWGV9v8YAPWUj.3eAOH1PenCplbb
 vbnN6mTleiIh6z864mZvuBL5Wy8kFlVoGKI_.N04veAk00hb.OmXkxD2OVPMOjUof4eRFWqdhpjO
 CD3KcYkT91qQuyyNTLh1xb9DKioYXT11aGblNt0iC0ou2Y8YEfn_LB9jO.6HZx05Pqmd86gK0LPv
 wvqQIierPXIrLJL3HkvWOkMDsyOXMzJfy9GRT0vNtMt76pbiH5Z8pewhHHe51_RRqPQzabvWtlwE
 o_gtuISXU84iTlPe5TetE2LBSkIFXF5GwLwgS1CiPwCC.tPwyGtscoXx.uhJryI7TV3t3uHRUdP8
 IloBRlB2BJMB8q51vwguAatevaYVkv0.kV7WWMmYkBX0SP.haCnpTDRdmatwKNPXAcgkJHOyB3YY
 ksLszkQZUdNRBMGXZnBfTzRpc4UBRF9gwUgSOOMnaH12mejf3OMihcRXnqppp_mN2fmdCNnglwBX
 8H9bcc3zNuf8Xs3a_Eqn_LNx16cOAHpAVe58xHDApAXJQ8L5jXbVetTz0QL.UW59rucFuDoU3bTU
 6v2x_g2sMlpKVICoG7ryGc5IWIK4eto2G1fOfOQtSYAzs_sfd_0TkjsxDj2F3t8Lt.rlGD08fpzH
 Rm7Ffb5lIigpYE.kvUqiz_yxw0k2Lue7kHwtS27ErbB37SEikCXPVXGTTG_jUUBnhj_eb8ctntSK
 tRPLMwj6h_lIGqkhFOaufyDyrOyfAnxF9Wp8REcM0mQblLQP6cJ3b6_DM07M8av86soDDFRUEVIR
 dWfuXrOG4rshUhy4yvqA3PxG4H.q7PCfiBzHaTw_Log_xHIQkXLItF8obbP06riHC1J0jOE9CFfP
 AOdyHUwGhD2Tyn8jb4PGqW91B79_TmDmYY7PwvSk9dvDgstk59t.LLO1e2f3h4KDKaAPgwCs4vQm
 ZtlJ40Lg.l_f3zqSSk1TZ4nYxdYDKZFW3uUc4zGGuFY.uWVHVCBd_i5RyiCnVmP0l6F_13oY6wrZ
 j2I7RpukTZnGjAAGKFuxxwxki6kcMBELMHH8SRcLT58frDV3h_mmYI70n0m8aoN9UKhM0hg1ViFJ
 FYqGMyqNlAw_RGyTZ_107qvnEI3H7CG6ODHIFB6.qipYHnfzfQ1igMTMXCtOIftAwbviB3129s2c
 DyegtBOvyKX.MCtNY6q1DJufDK2V3jht3rxpSM8Iw_mGSJ8qR.dJkij7hVZoJgnln3gBAXl8IjIk
 pcHNk.wFn756fVNv0wgt.okLD_kKtMhZgaN1jS9b35IL.zgcfuJHKLMADYpllmpypKmTyGbIOTzp
 NAqg.iJv4XCFFpJFhVYyLYXUuSM6EGRhrsx2Yzov89.Y29Bhiy4m3f6QH7suQJhA2cvsPNF4XkL.
 o4yTt92SaWWh9LWovuTP4yjiYqUpkoab46lvyfQhPJEYf1Qm1R_LJaGJuBw9.pvdchb89CKiHuSp
 62RgzEXWCA219_yLIBPkHGiZ8X87WNcfYFhJcdnuEjbYCWJPZvn9tRYlv_EyrUhLMUOhtJUZPUVo
 6aUT0yYjOnvQWhKnM
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <32193041-ff39-fdc5-01b5-b6e390ed997e@aol.com>
Date: Thu, 5 Jan 2023 16:20:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Alex Williamson <alex.williamson@redhat.com>, Paul Durrant
 <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
 <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
 <20230103081456.1d676b8e.alex.williamson@redhat.com>
 <b2ce641b-73ad-f3a2-dc9d-1ccfdd1ee8d8@aol.com>
Content-Language: en-US
In-Reply-To: <b2ce641b-73ad-f3a2-dc9d-1ccfdd1ee8d8@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/23 3:47 PM, Chuck Zmudzinski wrote:
> On 1/3/23 10:14 AM, Alex Williamson wrote:
> 
>> 
>> It's necessary to configure the assigned IGD at slot 2 to make it
>> functional, yes, but I don't really understand this notion of
>> "reserving" slot 2.  If something occupies address 00:02.0 in the
>> config, it's the user's or management tool's responsibility to move it
>> to make this configuration functional.  Why does QEMU need to play a
>> part in reserving this bus address.  IGD devices are not generally
>> hot-pluggable either, so it doesn't seem we need to reserve an address
>> in case an IGD device is added dynamically later.
> 
> The capability to reserve a bus address for a quirky device need not
> be limited to the case of hotplugged or dynamically added devices. The
> igd is a quirky device, and its presence in an emulated system like
> qemu requires special handling. The slot_reserved_mask member of PCIBus
> is also well-suited to the case of quirky device like Intel the igd that
> needs to be at slot 2. Just because it is not dynamically added later
> does not change the fact that it needs special handling at its initial
> configuration when the guest is being created.
> 
>>  
> 
> Here's the problem that answers Michael's question why this patch is
> specific to xen:
> 
> ---snip---
> #ifdef CONFIG_XEN
> 
> ...
> 
> static void pc_xen_hvm_init(MachineState *machine)
> {
>     PCMachineState *pcms = PC_MACHINE(machine);
> 
>     if (!xen_enabled()) {
>         error_report("xenfv machine requires the xen accelerator");
>         exit(1);
>     }
> 
>     pc_xen_hvm_init_pci(machine);
>     pci_create_simple(pcms->bus, -1, "xen-platform");
> }
> #endif
> ---snip---
> 
> This code is from hw/i386/pc_piix.c. Note the call to
> pci_create_simple to create the xen platform pci device,
> which has -1 as the second argument. That -1 tells
> pci_create_simple to autoconfigure the pci bdf address.
> 
> It is *hard-coded* that way. That means no toolstack or
> management tool can change it. And what is hard-coded here
> is that the xen platform device will occupy slot 2, preventing
> the Intel igd or any other device from occupying slot 2.
> 

Actually, today I discovered it is possible to workaround
this issue with libxl that appears to hard-code the xen
platform device to slot 2.

The code referenced here that effectively hard codes the xen
platform device to slot 2 is only executed with the
'-machine xenfv' qemu option, which is the default that
libxl uses for hvm guests, but this behavior can be changed
by setting xen_platform_pci = '0' in the xl guest configuration
file, in which case libxl configures qemu with the
'-machine pc,accel=xen' option instead, and then one can add
the xen platform device at a different slot by adding, for
example,

device_model_args = ['-device','xen-platform,addr=03']

to the xl guest configuration file which adds the device at
slot 3 instead of slot 2.

This approach is an ugly workaround which has other side effects,
such as by having -machine as pc,accel=xen instead of xenfv, the
machine type is not exactly the same because the xenfv machine
type is based on a much older version of qemu's i440fx emulation
(qemu version 3.1 IIRC), so with this workaround there could be
some unintended side effects, although I just tested this
workaround and it does seem to work, but I have not been using
this approach to the problem for very long.

Also, this approach requires setting type=vif in the vif network
setting of the xl guest configuration to suppress the creation of
the qemu emulated network device that would grab slot 2 if it is
created by the ordinary libxl network configuration settings and,
for guests that do not have the xen pv network drivers installed,
this also would require manually building the qemu command line
using device_model_args to allow adding an emulated qemu network
device at a different slot and probably also manually configuring
the correct networking scripts outside of the normal xen networking
scripts, because the ordinary xl guest configuration options do not
have a setting for assigning an emulated qemu network device to a
specific slot, and the device would otherwise grab slot 2.

So,it is possible to configure the guest to have the Intel igd at slot
2 without patching either libxl or qemu, but it is a real PITA with
some possible unintended side effects, and that is why I think patching
qemu to reserve slot 2 is a much better solution to the problem.

Kind regards,

Chuck

