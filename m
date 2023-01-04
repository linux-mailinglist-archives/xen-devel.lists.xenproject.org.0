Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B222965DDD5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 21:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471492.731355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAfp-0003ke-40; Wed, 04 Jan 2023 20:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471492.731355; Wed, 04 Jan 2023 20:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAfp-0003i0-08; Wed, 04 Jan 2023 20:47:45 +0000
Received: by outflank-mailman (input) for mailman id 471492;
 Wed, 04 Jan 2023 20:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDAfn-0003h6-5o
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 20:47:43 +0000
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067ed089-8c71-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 21:47:39 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 20:47:38 +0000
Received: by hermes--production-ne1-7b69748c4d-dzr9v (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6c878df3bbaf9935a45a9609953ac48f; 
 Wed, 04 Jan 2023 20:47:36 +0000 (UTC)
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
X-Inumbo-ID: 067ed089-8c71-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672865258; bh=FLlL0Znq3MYflQbaAlbZMfah9YnKAAkzhkPNyAmAnYo=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=KDH9WaiS1KXgbWghoV4HnCmF93QGXWTOT5fr1SC5F1PRK63KybA8DKCIatPU9lvgXB5fECISUamfzaznjzPoaSGwk32CH9Q/sXq6QZ4u/p178Hb+TheLkuH3y5Eh4ZeYLoIf7tY3WwgnuFZGIOGbekxrCde8M8AthD6yIVcq+Y0R20CIq+GqjvpTKwCcAiQmWNMfdun+ns2bStujuVdYes/p0gZCjudYwfyuZcdDLwELdcw/ldP3zApkHjVf/DI+y3NmWlz0pW9Fq4Bj2EX+3l68vpnXeBzxrGVebntQV7t6iYrK86tHd8hJXEEpYiOY3wnGPRIy3MSwVk3pGQRrWw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672865258; bh=rd+9VNkpX9KRPfP3h2G2X5n3Ypj1rGC/lgX+KO7N4xX=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=QZn8SdyWbKB5DsSdTquVTHtaQCBvr5bbql460GmW0MIv5m6dYeh2QlegS5yQaVnQhBFgWLUXG4IIpJlOpGcFDCZOADIdMyyLBPBtUIkMm+3jBsVKv5ovu2XdUexK+lwflNbL4mmM9edHZrI9L8Ulno61Xh3M2W5eDK01DYow8oeDfABCAIZ4ohH3Ly8V4jKFh/eLdyvrvgSmxHkqt+1uEEVMPoXKgvOKnP75/cDQ6gIDh/jDhY5XRwv801OtWgXbVTBdfkLduWJnLvPLjC+WvpVrGwh8I3zZ8DR8vfVd6zM41FMEA7x0E8o6VBU0bfvjLKfYIURrg8Fs0Yz+QBC1xw==
X-YMail-OSG: LU2heVoVM1mhE8eq57Zy8wqFpUouWpl3R3PBRRyFH2OhAFZxA_bJWQsbDI8Zd.d
 YG6.etuKO9F4mTUG1tyW5WzJb7591qppMYk.kN5cpy.8CHNUaT4dSWvWrVRXOFNmbO7nXYM_3oP3
 ObfBvM9TiX5GwJrRg89JHTyI6HlI4UqJjjJms1XYn9st39csae5XUTi2KGfcCtInq6no_FH13vRs
 Q0juuEt9sGQnTib1QOg4mYWP1T9JCP97ytEvj8o16ugbFi37jKc42xYuvsEJFuNBC.tXOES7HFDk
 7TXfcwttj2D3HVla6Npx2tmTvFmmgwjIS4zB5eGStweda0bi5vnmIRJZQ2tJTb7yqzkIp2GJvi07
 but27yb3x4mF.zb5XnKh8QiaJilk4b0xQOlzFKGIaBCnCpLe1EFWiK2MD4gYveC1MzzM1Xuws1d2
 U1H.atPcAwcFE8hjPHYgeX3H4coQpmL1qoAagYreLbXYEzllSwGFHSh37Ukcb4ofhl5h5bBgq9hY
 IU4bXFlkdBamVTF2zxEdAgXz5p9EFB2ck9qoSzYWJYm_daQnuvIAI5VvI80HsUlJq8B3Uq2IxV2c
 xrU6__HcLnKTjOs4o_LSQQp2yWJL7k4XCjXQpc9v5KQkNv2h.JihzpvtQXSTi0nZh1BDmnHYVW4F
 AXCE1SM7xZhx2WPRljxLumhKidHoYXz.puvV4BWC0FNfWhnC4sGp8x6Cg9cYMy5TJwemHcuFRbci
 JGgoVAWH0p31bLaBx5h12Q6qJD1.inYVYqXbOy80HqAyCKAkMmepM8xDPAUxgcPhZL.BJXMVv4sc
 MN8QXrkF9H0Ge8uOo7sa8RwkiVIfLaIGHUQxmmLwlt6lRKYbLOG4cgtLvkVjRU1WZaf6WWUclgR_
 VCE.4iXaCenI37KZkcz6LEOdcxoNzOYnaKuBS4an09m.923cHkgYZH9cETrkecl9rntoySsmvlxR
 HuVn1AeF5eAB8ccfn5vqiKnVQRXz7IXb4MuioChbyOQkNOVX9_omJKi3zx3P9.WZDLh9GJavIRJ6
 Yp36TIwtdMCkNZEekkF0yZf632CkP97JXvWg8tc6_QXRAbwekb8ZlxfMQD1IBQPvhcT89dXSmCfG
 e2y__WrCIe8MA5wNvFBrElyLswyO6CYx7QOeC0kWSwMgOIvD_duV7tFxVJNcwXwwB6jqKRBu_mkU
 ptrAxrGpXv5_FkjtnpaE5MicyVhzNx7e1YBiOEbiVv8DcIbhM.Re4oeK0vD2lBL.M7vzD_vi1jxW
 Q0r7reRUj9qX9cxHsbvGShsoT8DH8.L7qOUrgp2m8CMK.y.Z_L_5rIcrRtjmWs3tnhmNwLjm70TI
 bPZCoLbyN71aOn5gUzZ3idvAHCsryMIkPcPHFQR4VuwXm1Z4ZcGCEyxGOMUikZEA6maMSDeHlWEc
 ODbhWXdF6PvPluKyIClMbvSg7V5OTFhqf7Gby6j5bshhH6Qy7LQFZ_yxb14m.bZQraDaiaQXWk6f
 r1Y2PAOy3QbCO2sLqd64LcDxF16J709lLsCuS5W6qsr.PDR2z90FeKnxLLd6_Koqf9QMfma8e5HP
 H8rerCx.mIwS8uSw3BRnNREfsJFyftcYwmVxmPN3IA8UZH2v4_FO0b2QMWVwSZXl4MOH_xRZ5MNY
 1UC61lX04HGgM_EFhqCwTnlWZO7eYHMszUnHfLYFKdfurLca25Ocm_wVr4RipRVnMrTsCcLKWXfI
 4F6OLlMqYGoup9.etjjLkwYJz0rpr_slMbxO4_T.gRe6HGtycAdrLKe01BSyEPg2ubjDj3ithbYA
 VQWmxmjsQFlmN7Zh3e1qpEIDnbD8_EjvibzE2c.lkToSQ8MFdLQijyRQtrGo.yHDvDk5Yqz.X3pe
 _drORI2z9qBD3oFL19GYqZFaNUtV.L42KEG0E3GqLQ_7edyE_7OpK78ovSqnBr2YyyOt22iyxfi3
 hnObSSy9yNZtke6Jb3d.GbdwNdYDtig_vfZJR93V4FsOXWRh4A2Qf10bx1OjW0avm7NhHnlU_KLa
 A1kzF7Bokp0HQSQvCH9DvBvKEtkaS4.R1brVE6PFf_jmqs1iqB_mFt3uPgXsfw3VXPcvYDN20R.D
 V0hv7guo1bOLFM_n6_oWQdkrrf5EVTEKKnr1TSrcwREO5tBwhq7e.1ta5TIrBaNgo9GER6XlSJxj
 cwXgESSoc8hsmwjwbmvJF26yywagzD4O4BGZOOa4k6rxNvAEcPMy6UXupjtULeWRHaurh4TeBEtL
 cua_DBwyZl8H4z74nTt4-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <b2ce641b-73ad-f3a2-dc9d-1ccfdd1ee8d8@aol.com>
Date: Wed, 4 Jan 2023 15:47:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230103081456.1d676b8e.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/3/23 10:14 AM, Alex Williamson wrote:

> 
> It's necessary to configure the assigned IGD at slot 2 to make it
> functional, yes, but I don't really understand this notion of
> "reserving" slot 2.  If something occupies address 00:02.0 in the
> config, it's the user's or management tool's responsibility to move it
> to make this configuration functional.  Why does QEMU need to play a
> part in reserving this bus address.  IGD devices are not generally
> hot-pluggable either, so it doesn't seem we need to reserve an address
> in case an IGD device is added dynamically later.

The capability to reserve a bus address for a quirky device need not
be limited to the case of hotplugged or dynamically added devices. The
igd is a quirky device, and its presence in an emulated system like
qemu requires special handling. The slot_reserved_mask member of PCIBus
is also well-suited to the case of quirky device like Intel the igd that
needs to be at slot 2. Just because it is not dynamically added later
does not change the fact that it needs special handling at its initial
configuration when the guest is being created.

>  

Here's the problem that answers Michael's question why this patch is
specific to xen:

---snip---
#ifdef CONFIG_XEN

...

static void pc_xen_hvm_init(MachineState *machine)
{
    PCMachineState *pcms = PC_MACHINE(machine);

    if (!xen_enabled()) {
        error_report("xenfv machine requires the xen accelerator");
        exit(1);
    }

    pc_xen_hvm_init_pci(machine);
    pci_create_simple(pcms->bus, -1, "xen-platform");
}
#endif
---snip---

This code is from hw/i386/pc_piix.c. Note the call to
pci_create_simple to create the xen platform pci device,
which has -1 as the second argument. That -1 tells
pci_create_simple to autoconfigure the pci bdf address.

It is *hard-coded* that way. That means no toolstack or
management tool can change it. And what is hard-coded here
is that the xen platform device will occupy slot 2, preventing
the Intel igd or any other device from occupying slot 2.

So, even if xen developers wanted to create a version of the
libxl that is flexible enough to allow the xen platform device
to be at a different slot, they could not without patching
qemu to at least change that -1 to an initialization variable
that can be read from a qemu command line option that libxl
could configure.

So, why not just accept this patch as the best way to deal
with a xen-specific problem and fix it in a way that uses
the xen/libxl philosophy of autoconfiguring things as much as
possible except in cases of quirky devices like the Intel igd
in which case the existing slot_reserved_mask member of PCIBus
is very useful to accommodate the quirky igd device?

IMHO, trying to impose the kvm/libvirt philosophy of having
a very configurable toolstack on the xen/xenlight philosophy
of autoconfiguring things that can be autoconfigured and
using higher-level configuration options like igd-passthrough=on
to tweak how autoconfiguration is done in a way that is compatible
with quirky devices like the Intel igd is like trying to put
a square peg into a round hole. Actually, qemu with its qom is
able to accommodate both approaches to the design of a toolstack,
and each vendor or project that depends on qemu should be free to
use the approach it prefers.

Just my two cents, FWIW.

Kind regards,

Chuck

