Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 870068B0794
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 12:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711333.1111214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rza4L-0008FN-62; Wed, 24 Apr 2024 10:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711333.1111214; Wed, 24 Apr 2024 10:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rza4L-0008D1-2F; Wed, 24 Apr 2024 10:41:41 +0000
Received: by outflank-mailman (input) for mailman id 711333;
 Wed, 24 Apr 2024 10:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jvOM=L5=fedoraproject.org=pjp@srs-se1.protection.inumbo.net>)
 id 1rza4J-0008Cv-D2
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 10:41:39 +0000
Received: from sonic312-19.consmr.mail.sg3.yahoo.com
 (sonic312-19.consmr.mail.sg3.yahoo.com [106.10.244.209])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37830694-0227-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 12:41:36 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.sg3.yahoo.com with HTTP; Wed, 24 Apr 2024 10:41:30 +0000
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
X-Inumbo-ID: 37830694-0227-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713955290; bh=ZHUvPf6x9dzkrjde/3+5mJAgiMDJMxVS/+99VE6c2yY=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=SaAjN6QNH/fSe/eG+XFpfjPtnA3kYd3wNtlHJYUzSrLGvsiE08PxN5hf23dGO4LzUdOdTnYe2kvETvYfQ4XoQRJRj0lVxCCwbkdcngHE9YJH98ohcPUmG+Ews3Wi98Eob60J2ZdcF0EB0j357NxOW7T++DLjAlm3PrWA4hTVt3gSjDcBg7GuKGpuQJGUALuU/sHetxssxVbiib7WOUS8Rla+dZ6V7t9ITdcLfmM4NIS8iT7DRB4hcnB2CQs0whlLsuCTqc/NQhxzXvn5tby43teTBIa0h2amAz6QgDysj7tkb1005yXE5YV7lqYPc5SIhky/Q1fDkHkZMw4Ic8x4jQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713955290; bh=kg9KoxasYPEFNCD0paJmxltZuTvH+uv4g6Lr0o59dcp=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=nejTjaLVkHAGS9kCRp+tLM2R/TrGvAp9FMQ0sitBQLguhyCLvZf+cFoosFY8OEeaa1MQvjViMKJC4V8dn6b9bMy7wFJrTxXn7VjsUJRTBwR6h/r+czP+2NfXWzaTehE3jJeo5+CXvVDVsijTrN/NDV65u/27YVPz5vBmsNWu1QtKUtYH/EW2dSLXXtmjTIfySlKE9AlYWnvF7/33v7APX5inQqzx9jDEScBCg0yExBlx+JOVBZ5YLuqhTUcYQnd97Dps5iOvy+tUQgIeymh3Qg+8jntSIH1vCRZCG19EqNtAMEfohJv91SdG94x89dEZzwfjkBB4nTJlboaCi8zXNw==
X-YMail-OSG: RzG42BQVM1kkuzeaNYR0Yh6VS0p6dHqZwNmrfDpOtjjQ5iB8lyeyd7Ki9oO9eyG
 SPu..wufyX7_qkglontsh0stzWLY6VC3QlUD_tRHb1Hs4TJD_R9RNHwR3RTAPw9HzMKzFsqoD82y
 gMkDXeq79.CEamoVQ5edEZEqsWAwF9fuhMnrq0oUPTTLPoNa1YHtJGx.2CB4Kmy.HEju5z9ObdMU
 G2NSZsgGsTRBDR.oyo8FnezSGSjagJqFsh_N.mjd7fnK91D0MNYpopEilAt9nrC.9sjTHcNOWOVO
 MyXO4fSPtzPg7WXtxNDq4V9LoBs2I_YbFvniwSLuceQePXepvneoMLZmBi3q4TF6zH2RlunSxZdz
 79xHzCY.5Qx27esq39A7tYW8sX_MdcjhQBKx6b0C6JqRCABuPand16_bEgJRRvbuYgnYtfhiThZx
 fHmLuwCEhr7sm5JxhcVxV2wlwO6q.loORBTwNrMz6g3cUTFq255L7mfZ5oyPVBoGYK8HF779kb1r
 Ipno8pA6OSH796YVNd_0ErH1krteIJrmkhs5zZeWJjMgdL_Es0kjssMDgahPZf4h8uczEpfYpByo
 7nzYoMCGrEGLPkBS4K6Rnf56839JbGdNRTesozLQze22ok5.1OWb.PZsWOVoiUpJDdnruIjfJ6XR
 iU2GLxwwgZbnacprLrCCNpN9uawaQegDE4Bxfc2h.kT5ezMSTfCU6UfdvYTe4qPyb_QJnro4CF_v
 r2SE87Fo3tbhYhDn__DNBg2GGdX1hIWrFYIcTcIgY.JTObMoF_NqRdO02UqIslR5LqwFduaLcymm
 fKht4fCRtj5pyVoLjufLdkzLQ.J_X0vvF6Cj6gLmgBvlIfbIqbcU6LOkWMOzEcnsAvZdli4e1uTx
 Vcj1oY45DYEhhs12Xw2yLqDxqYUEy4dgnigTVQXVlZdXViyqqFbHS7NOkd1SZ3IGP6HJx6wBuJPF
 mJltsm2Rez6l179mNg5roR6cinpMRFsn.IekVF3TmVMytn49Lr8dx1JJR9YSb2Xm9iZkS9vgVPUd
 zkuOm81Yl0S2PU8UVmkKDF96245ujaSu1V6rQhjPtqoM8NzZfgORWBjgRrPZ6UgEGVcm7ihOxuKY
 F1cxMqb9WqwHo3TwIzrWLz.EzfwlpLrGjv4NEbQOhi4GaJRqZOMstXq4_c9tdqo2J9dYewNuONNZ
 x.PzgxL8HYixeYmZWw5R458Q.Y58CbtgWHZ7MgAL8m9wmIgPHf6NokWgH5jAuNCFH8AD3aDOUtOK
 09AZI0DpZWf4rsRLmdn7nIrXwS5DTB1Z01N9AHGO1wuA1SAB7u5wLp3UERNfpaZKiGAsd6J3PnYR
 6Slk6Jg2jp25r_REjuJ_EWMOVVHmLQA53qHvMTlcHqdB.8xZwXcqbghsht8cGpOPky7c48XdLuWN
 qbVzgTtD7jyaJDaML_H4Ra7WBNYf60uxnZ5cEG7GrigLBwcyKc69welUL.8ANcOrDg518ECBa5yc
 ykdQ9hYCRLtYKT2K3nZ.uMeFAs5faK9BytF7dOlQSKmHsrQoJDx00mOVzs5qTL_2iaLC2HvbLfWK
 byCXaSrDVLm2q4mIEq3ElmEUTTd5rg1.NJ5Tv1aY_5jTPbjOatVjSmy4um94Be4hhUWgwPVHQ2Jq
 94UCG9bnAFjkgwIQ8a6bnE6VdBcMCamE5lB5QGghitFU4wkct9qm3Ds9TuVNDohCEQPXmUs3Qins
 naGUgbMwgrMceagQO_uiUmfwm5ZQDNwN5JhxX3kTog5.tD.NeD3A1TgIa_Z.ZU3xzEdH4pZDMj5d
 joZ5eHsKusHNj5LNNrS_AAMlR2uYt5vmcI.MgGmG1uLwKV3nm0qzF.H83DkguHhO5oKHy6VQOl1y
 g2R3B8wAoy.Ibhpy4tYlqOXP0xDvWqTfI91NBxw_8UdFzZgi_x6TMvD_qcPcqANIiiWQbMB1T8iO
 .BfM6uDOvVWTQvrQZ4QGNe7o3InViE6k8xCJEWLzTXGEU1aig6Hx.6JOPjmlIqgkzFFufi._zSat
 eWnicVZ4rA1WngBVRoah217UWSi_GiLdJM7CuP56v9M4iKrNbEsbqKJs9X02tMVp_r6_66L_VmEG
 .hHY2Y2OBLYuD6h8Osjrhg6x1utxsD6vvxk.nmQQASu4y44cwGdAVFoz5S9pqxHRwrtm2vt25zic
 uvPnm3soZvKhbXRvNRHXiEe7YjotRbLSwuV8SBl6DPXUZ36fcj9iH7HD6I4R7BojsGwCo6oab9GM
 poaS3xAK48tHB1ewu7PGP9gXx0HM99tEfZGdh0t17.vMc42ZKCR6v060-
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: de48d154-cc05-4d84-9995-646901de3d4e
Date: Wed, 24 Apr 2024 10:41:26 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: Mauro Matteo Cascella <mcascell@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, 
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	Jason Wang <jasowang@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, 
	Stefan Weil <sw@weilnetz.de>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Helge Deller <deller@gmx.de>, 
	Sriram Yagnaraman <sriram.yagnaraman@est.tech>, 
	Thomas Huth <huth@tuxfamily.org>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>, 
	Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, 
	Greg Kurz <groug@kaod.org>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Sven Schnelle <svens@stackframe.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Rob Herring <robh@kernel.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <1497808863.2030924.1713955286878@mail.yahoo.com>
In-Reply-To: <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com> <20230601031859.7115-2-akihiko.odaki@daynix.com> <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22256 YMailNorrin

On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe Mathieu-Daud=C3=
=A9 wrote:
>On 1/6/23 05:18, Akihiko Odaki wrote:
>> Recently MemReentrancyGuard was added to DeviceState to record that the
>> device is engaging in I/O. The network device backend needs to update it
>> when delivering a packet to a device.
>>=C2=A0
>> In preparation for such a change, add MemReentrancyGuard * as a
>> parameter of qemu_new_nic().
>
>An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>any clue?

* CVE-2021-20255 bug: infinite recursion is pointing at a different fix pat=
ch.
=C2=A0 ->=C2=A0https://bugzilla.redhat.com/show_bug.cgi?id=3DCVE-2021-20255

* And the this patch below has different issue tagged
=C2=A0 ->=C2=A0https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg=
08312.html
=C2=A0 Fixes: CVE-2023-3019


* They look different, former is an infinite recursion issue and the latter=
 is a use-after-free one.


Thank you.
---
=C2=A0 -Prasad

