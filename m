Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC4B706481
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 11:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535843.833886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzDlP-00047N-Jq; Wed, 17 May 2023 09:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535843.833886; Wed, 17 May 2023 09:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzDlP-00045k-Gq; Wed, 17 May 2023 09:48:07 +0000
Received: by outflank-mailman (input) for mailman id 535843;
 Wed, 17 May 2023 09:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NVq3=BG=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pzDlN-00045W-4z
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 09:48:05 +0000
Received: from sonic315-8.consmr.mail.gq1.yahoo.com
 (sonic315-8.consmr.mail.gq1.yahoo.com [98.137.65.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e900c11b-f497-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 11:48:02 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Wed, 17 May 2023 09:47:59 +0000
Received: by hermes--production-bf1-54475bbfff-xh8w9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 24aad0db06063cbf22325155fe59148c; 
 Wed, 17 May 2023 09:47:54 +0000 (UTC)
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
X-Inumbo-ID: e900c11b-f497-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1684316879; bh=aQdscKvLY6S6aQh/xtHAjeHn3mkGg+q462RfdyoVGDo=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=NxYsyj0LBb0F4lcv7k+j5t9nJ4hSQqhiDpI3nPPqw1dqNP99We5mLSXhlhwA3SuYVtYN8n9B9bvHhnNEz5RwHkRYM2DjbY7ibSoOJB09VeOw5/X9Ld9AojjWdyPknZMzixOONhwwBRLZKAG84APZ+Nd7wdpcF4FscnmdUEAdPhuaIEhhAYHXzbHXoXBT6r+OdKUxEtacpr/XXrh8Z7TAJkbfHZ16h8Nw9fGoMMgGe7DKRUkGNjG1om3DV49gz1A0ZCBFnXgHX3tw9TxMBkrjEN/xqP9eU/fFun6Mt8DCneDS+S3qGwJlFtZPv0alZdiajH84j9AuHQNyPa8L3n3i1Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1684316879; bh=4daBEh926WVPMyxCoaZ42Ind3YD2iMbZTrLb4RtE6eL=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=DCJJDr9M5HfHciobmrpii3IKct1Wf7aFwV/eU5GygKPWS7n2gI97QtQdymen8M+Sx1L2d9s31YFc+dC2hxxyZvI8TfzzbRdlKkrOmg534OdJyP3LXMXqqLJqEeSAIDN19TKe8Q+9Cl2JCKPrM55hTJ6Il4G5yXGWXg7dK0lrL8FMm53a4t5TXjaE60eTL4yx2bgoa0TpDhZWaNVfj0Upw0hj+/uc2bwewnPtvsjRQkZ8vFfWXtQ1xqOlHrPzr5HrhVmFOGGsbLModl6CSR/VXP617ac181VKgCZmcL10k0JWb7FmM+Ex3ek9IhU+685sAah84bKNZ1jxUa14rrKShw==
X-YMail-OSG: TJX2jYsVM1nF85kpPnGWeXvnTL5hE1dgUE6Cq76nrXx.KSuRVXdJydyDPNVdAou
 eJKhlXPF_0yUHiWremP6Zed_03k1h07aaq3BnbKS64N4mpma7Qti_RAGgBRe6_h8ieB9JxdQTwps
 DIPZNc.8E.cvlyw.8KxFAZpK4j6AH_DNlY7hQWRsaHL.1aVEj_Eeg4vSUtT2fUjElmyuLLm2p1hM
 kQBWiRZgpPS5f4PxJcWfMqpRppMQK6Wg5NzFjW5drADld0rou9k5hdwHmnITiSQhO_awGhmGf.AR
 JaczotUdnLayeCYw9D_nlvzFJ7olROQ.nYYL5aGTjqoa3vRphnTXIRauhrkbJ5SCLcwFjaHNFZRf
 XhRS0IwT0qBocmxt.0t6dAVPOSjpcZDz1BofVfchffrsyYEjj6JwkahPT4lE1dNkS7rYha.4ab.G
 7y8vUmLgPbOazHHpD19UYB0ZSU6SNgvN7MjMFjXq0zf9gLk07SPLHHN0gdU00oujtJIHrtJUTsuc
 bM1FHveV0JUZ4XZFuK_jHsd8AjRR.bRCQihHAxN131sLcv05DgzNBGlyY29gr6yyoJTrTymXLnSc
 TZPBClCy_rBrvgp6R8KThwEOq6EAfZF2QW9zK5zMFSJsCq0mYZzDgNL3Nin3uFMVbUxhmfiyvyBY
 dUMr6iUvqpCijY6wrByjMZhIDi9oc2Fx15bU6QckILeuuk7CKPz7JQ1SER7OtwyFrM71Mv1XmX02
 fvbBUs.uUTyzQMwla84VN.dpVPVd6hXtKcqkoUeBGbjEgU9gQ7ttDUgEU3veeLkRi7YRqwoJFr.f
 M_hxFmyQidjkon0YNugVUdxjVIhGVZ5wm9.62nys4VYhv7Ip_7hyHAEXetXaEpmZAFonwkUQUDHp
 dtjxU.eBw2EEq9bYRIDEVXHNH72j_DcZXCitXetALf8pm__WZMwuObtqTLCKJarIs4AHycO1G4k9
 wQBAPv7soUT21cOMmbl91oss3jLohT10ecZ.6nzXrZsJ7aEyBy7AG4L4x6dGUcSsNrD.Q37cNpfO
 NoaC23VIYqRMvy8kCg95bS_NMdWd8QqIJjZNTyUcxbm64k.nL2a2.lmgbBnQ6iqjIN9cHCyQruQw
 uCSCpDUA4G0AfS84wpSA.lrTmTzzFsIWkuh8GBiyBppg3Epmn_ToBVqNmCaArBEZdJf_ZxEPaOfa
 0JM5r7gBHfEFSwdDz_mGAkHtZNENZhL1so.uMTppiqLkA_3396Jm83UcUcir6e4r4T55b7vlABWk
 jfCY5p0R_zrg7xLy68wkdRog.B3xxGdx6Cyjqipl2IjCaHUv0UDqxOlK85vdYWW0pxWQNyNn_YYf
 qI0ZRgD_oAG9f240YwBnDHTufTZUZWalcTcubC5K2ovDANBtX36APUTJT2JmvKckHqaHMXaaXuo2
 rgM2GHwlA4.R3BaLwqCv1TrhNjPC.W8iC5pGIzKSEiLmcjgm9jPPmJqcO1aHNG5k9qu2wlahlJee
 hqRdoTAHUsy09D9iD8VQ6bjrT8Sx3rEh7L0O9zO.4AVCm5LHzY5hwjRbZORaM5vHckDoqRhj9q6R
 xyAK1.r5w1me8rRgvfzpAhrqj6Karnc5qZOSj7l440U_8sAc2jDh443zrZpyjJJKDQ8aJUkjSE2F
 jWv6WcOgbcl2NXjIht1Z.BMxGUSpWOl20e__FqxmawrLu1be5oDwi8GIJGIPfORSf2d_ZuwqmcjS
 UI86Fz_tjgLUfLaL6oAsWg7yZbBs2I.gNNlicnBsF4qhhhBunVy6MDcdteObdGEqQomvHrYeP2Gc
 K3m7iOxL6zGQNhI8elC1n5so4ici6FIohO4fSVgeIAsV6vxJ85PvS54Pg61zk7yfQERppaFIYZEP
 U93LvdNp8f_BkXp0rkoNKgBo7AnasOsA8QPxMogBYLg8KvEF1ORwpgpc4S5Vb5BgXBsLY52LTNNs
 J_.isQr9FRXoktN61BetWZxDuwQ3qODmcTyi.PO2i2jcX_99V2e.ul2fz_hPv.iuAITvUO5JpHI7
 s8q3H7ylHPTDGHqx3vjY8ncdco24Qkj2V0yhfHEyr.RAhsLrcpD.UtDRT1odIIxuh._vSldh1ihf
 4xIiiaAqS4fjooQDOPRbP.dJDQTBJM7Khv1bjaVx8WaDVLbYITTXQMRedYoDE7NeB6dZt69IdzCq
 YyPXa5fP1AkkI6QbYhwWHH5ZPJFrMm59HsOiAKC0QbOeSVujKFVwFmwNUY5lsaB3d5SV4nIs4uIe
 W3RtOY4LVGEjCeEJA
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 4eb3fcf0-14b8-4781-b11e-557bf4fbb7f4
Message-ID: <47ed3568-2127-a865-4e4f-ff5902484231@aol.com>
Date: Wed, 17 May 2023 05:47:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH] xen/pt: fix igd passthrough for pc machine with xen
 accelerator
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-stable@nongnu.org
References: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz.ref@aol.com>
 <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
 <986d9eca-5fab-cacb-05c7-b85e4d58665b@msgid.tls.msk.ru>
Content-Language: en-US
In-Reply-To: <986d9eca-5fab-cacb-05c7-b85e4d58665b@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21471 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 5/17/2023 2:39 AM, Michael Tokarev wrote:
> 08.02.2023 05:03, Chuck Zmudzinski wrote:
> > Commit 998250e97661 ("xen, gfx passthrough: register host bridge specific
> > to passthrough") uses the igd-passthrough-i440FX pci host device with
> > the xenfv machine type and igd-passthru=on, but using it for the pc
> > machine type, xen accelerator, and igd-passtru=on was omitted from that
> > commit.
> > 
> > The igd-passthru-i440FX pci host device is also needed for guests
> > configured with the pc machine type, the xen accelerator, and
> > igd-passthru=on. Specifically, tests show that not using the igd-specific
> > pci host device with the Intel igd passed through to the guest results
> > in slower startup performance and reduced resolution of the display
> > during startup. This patch fixes this issue.
> > 
> > To simplify the logic that is needed to support both the --enable-xen
> > and the --disable-xen configure options, introduce the boolean symbol
> > pc_xen_igd_gfx_pt_enabled() whose value is set appropriately in the
> > sysemu/xen.h header file as the test to determine whether or not
> > to use the igd-passthrough-i440FX pci host device instead of the
> > normal i440FX pci host device.
> > 
> > Fixes: 998250e97661 ("xen, gfx passthrough: register host bridge specific to passthrough")
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>
> Has this change been forgotten?  Is it not needed anymore?

Short answer:

After 4f67543b ("xen/pt: reserve PCI slot 2 for Intel igd-passthru ") was
applied, I was inclined to think this change is not needed anymore, but
it would not hurt to add this change also, and now I think it might be
more correct to also add this change.

Longer explanation:

I strongly desired that at least one of the patches I proposed to improve
support for Intel IGD passthrough with xen be committed. Since
4f67543b ("xen/pt: reserve PCI slot 2 for Intel igd-passthru ") that fixed
Intel IGD passthrough for the xenfv machine type has been committed,
I reasoned that there is not such a great need to also fix Intel IGD
passthrough for the pc machine type with xen so I did not push hard for
this patch to also be applied.

My requirement was that either the xenfv machine be fixed or the pc
machine be fixed. I did not think it was necessary to fix them both, and
4f67543b ("xen/pt: reserve PCI slot 2 for Intel igd-passthru ") fixed the
xenfv machine. But this patch provides the additional fix for the pc machine,
a fix that is distinct from the fix that has already been committed for the
xenfv machine, and it probably should also be applied so pc and xenfv
machines will work equally well with Intel IGD passthrough.

In other words, it is good to fix at least one of the two broken machines configured
for Intel IGD passthrough and xen, it is better to fix them both. We already fixed
one of them with 4f67543b ("xen/pt: reserve PCI slot 2 for Intel igd-passthru "),
this patch would fix the other one.

If you want to add this change also, let's make sure recent changes to the
xen header files do not require the patch to be rebased before committing
it.

Chuck

