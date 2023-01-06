Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE1D6605E3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 18:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472848.733242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDqnx-0001t2-H0; Fri, 06 Jan 2023 17:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472848.733242; Fri, 06 Jan 2023 17:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDqnx-0001qO-E5; Fri, 06 Jan 2023 17:46:57 +0000
Received: by outflank-mailman (input) for mailman id 472848;
 Fri, 06 Jan 2023 17:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDqnw-0001qI-Dy
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 17:46:56 +0000
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19e360e7-8dea-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 18:46:53 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 17:46:50 +0000
Received: by hermes--production-bf1-5458f64d4-qthpt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID abddd79a48058f79d1ffdd9f2f3866e9; 
 Fri, 06 Jan 2023 17:46:45 +0000 (UTC)
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
X-Inumbo-ID: 19e360e7-8dea-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673027210; bh=e/yuR16Te9FloniNuhJpbWJIR1Zp8hbWNdHK0VdfjsM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=sTq7fUsaVqnW1jpDYFOf3sgyWg2QJx9xgnlpXe+D9eVnbmEEi+/W/ZKjNh6wtVVn27n7ItlTh2pgoyTpyt5f1L+jBl9ncdfRNt+ljb71kvbY9C0tCroCr0wPcSGL4nEvRVOPUQMq+GhBXkR4ZfmXHouXNvCELOdPtp1cFPh8bCXsjuadMJNZQC+cZ/gRmO2aOMGIR9xIdNhJ/iEBgBl7vckp1zUL7GXZb4GMQrd3EsO/mJk69BOGOAUg3YaIZibynDgkwdNDPFA2woTQcORHKe4rkLZx4kCboOUa7no4W5tyRiS5qRdJ/g0mNp3ja5n1l9hmScQyhA3wzHEjdYDtVg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673027210; bh=X1JckgDvtHLNYcDAfFF2eP/1ckxVrDQy9LCUKex4cZy=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=lkktQxlD3qmu6y5M2KgUC3WCfgrEvBkPBNPD2lE4aEcYETsQbotlYBTE0ehfoDlgTlKKtgn7pdK4hYil8D6SEzKEGe75TxKvuw9g1fR+hFWItTNwQZPgIM2Sj7vt/uMYzUBdPsVYH4Dzu3UvRKmiSwdLVwo3tXJmHgArDMsYsxyGZBp8KXBxpRu1zTEUQ114h83rhcVzAXYeQJzvx63sTIHszgmbhUx7fBFoapr4/tc5pnJKLKQlN4/3waMt1GxLcbId6o1GaKihlV2vlGbt8AcF9t5perS6C+MNEkpuCeeOg+Ad3ZTb0HHRkOygY9p8eCA6RLYe0gZoi/VyGrPYbw==
X-YMail-OSG: 6X0GYxgVM1mDTxdl3ycRcmjH8SrRcUf1frDKKdnj0DaulY4.ExN8BjoBGNv5xYu
 1sZpclq.cRAkBMUNvjVFO9kvymnAUXQgvBw5gc9IYZJnXsXQl5MOcftAJTb5Nb6aUs2UXNvDLBKH
 hcayIq3HXl2n_GcECF1T2qBC4yetb6qsXTGDKGl5x7EWndMZfv_x_jaW2jqXRdbD4Vi25b1XQa27
 UPgVql6WNSy8M.3zLgk4_Iy4Q52ro6MuaO0BFo0riEBsVDd_8qibd0b0Fo.i6AqumD9lHFrOvdbn
 Fwm_IH3ru7R4E8xlZ2Y2jB.N.0h4zr8KGU91mU9BVbTsrsNQStHmjl3_A5KBVKmidCQKB_8HqRv_
 jdw2yqm8ekfRQs_0ZW3aOH.33rgic7ntu8ENrN9U5iOuvlxPH5CcNMS.3JmF2nZ6YheRXVy5sZSx
 D..csbaXJLnJinLrFOSlzCjHAQ08vKFMZkjWZ8zqiaRMDm__2XSI26wrZ16MhbNm6eiEhNwRtx5e
 D047ZzCBav6hYZe2IKIlNA17FxDZS_O54VL3S1wP9GsOzAWrC7aHl4QMAPjG752.EQvPqKSv1fCB
 hjgCeACJkj1B92mBCtjdX2BFaSawFSEhcHgm2nJbL_HUuy0S_Rfl9b.Lvt_ZtRYADTjRVQXSieeb
 DsHT5nvZHdfmve6fOBO37RDhza8pN_KnCHLPcAP0D_DUhXkbey3WzZs.fCspBwNj3oSdZaTysLjB
 RkFHvfU1KM6Je.HCqiIahkYWLw0w6NRbM.g2MbaQQ.nIgBoqrZB83.3_5s0GgJZvDI2GrxIksgpP
 VjKi98vCgWhvcCPYjpakQb4LcDTA2ViMdvR7_WnAyvsLT5opM6JVnymRJWJElt0f8Lo0.jnBFtag
 T3F1QWYGKpc04x4O9ccWQRxNOJZWDx4sOuq8NPEGTSsrNJRmcittTrdgUYYaoqvlSC72MUMej6h_
 YPn7Xz5eJxq8qWzzwp3jTJ.2oGsiZdrKRv2l.wqtvrFjk7A7b08Kv_7.wdkC0Auu3Ox277K6NV7T
 p4bIhE37SHOZfBEzE2sU0RmPJ.zotC1X2edpWbsSR_kI7.8xJq1A46SXdIvaThTqDPh5vmXHKXSW
 B8NcZvo8SiS_i0CpEB6zTxkL1LmaQQJGCzuzF8j1yEVrqA5eTlkv4_oxCkNb2gOv7xgfl31bwNRx
 4C5q0xdwMCOoHBR1pY3PQHmQpE_xPPNCCyGZbtR02x7K0xNi2qaUbo0Y_2kXDot9XR5vsHQmWr4H
 ol.Tajp44XINGZqKlaL1VNJPTI0mEMNPOBz34mj8.d8ctkAe9ReJ2FJNWY076N80qEVVGzPzXp4M
 EpuMsFpvW.TfkaMLVHZgmXhBbyM1qfjWITrv2TbcL8gXgLcajH45MbH5uL7XaW7ITbTcfwUVyW2D
 g919FlXMY7n24ypVRv3cWDC2_rdCmA7YSNjIWJp2tpPCxRRGC2GoU0BPy81vgdvYjXXWML8uBHo0
 I9HmgYdCkkfDD6PJiKUtPJZuDGwCBi7wO_Xs2nr0tRhZI62.64shVukxfdKpGToNnC4RdVPA4.Cv
 7p6LWOO0s1I9cESqt.xO5aHupg7ATQuP6_zh1fqNhCWIOPR41QHoavbnO7SrELtx4izms4R4zxPD
 AKEVsWYYYbd0NrcW7RG57t4Eet4PcSS6W9rsLFfjvuI731pJ7nDUqvTCJ8A2zaTBKbyd82kATGoe
 253TUeVA0z661P5WDkzEyJAD8qx2StVKEW.ZFi0padXZXbuVF7TO7Q34CyarzVLyLq3ghS_ZWkPR
 60Rx5DbCv8RRQfumA7M7KF5YOGG1T_pRu0YedDEtKi8QDfvUtWmPNUpti1huIW6YNHaA.1lUO7em
 B_nci28BYlNfiTBNFaB2xZngGQMQbOhIcCBNEu9KOw4DxxplLF5tfVDgNQ_b0PBjOkvRjY3xzrpY
 ju6QxtXVLxc7NboV4VDEXYiM2wLU8y87Ta.ryVbjjDo2VUKxFmOBmrqXmDofQI9gKXm01u7e9JwQ
 o1KPxAWMi2GyeRdITq_o6nUP27jpFzoadZnz9C2F0nF54jHY1YbQ7eZ.51O61iqLm5IQ_W9hOFks
 n0l4lRp.RiznfeH9z4e85MMNAjKmKa8Zw7ELOFdRHZ_odQ78ofZlZcMsc.aA3YqoEDli.kDrv4pH
 jlsR0.oOdQ_4sMOIxb5mXGCbqjdhukrOzIoXXqyRUjCXq0ZF_Xdjia3E2kTFlJULrtGIxXqZyY0N
 7h6rSfFOIODBCZwRFt5w-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <c328e499-0a52-e46d-f080-dbaa6b98cac0@aol.com>
Date: Fri, 6 Jan 2023 12:46:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside
 of PIIX3
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-4-shentey@gmail.com>
 <b80c0bb26d8539899f53b91deb48f748e2495d23.camel@infradead.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <b80c0bb26d8539899f53b91deb48f748e2495d23.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 12:35 PM, David Woodhouse wrote:
> On Wed, 2023-01-04 at 15:44 +0100, Bernhard Beschow wrote:
>> +        if (xen_enabled()) {
> 
> Could this perhaps be if (xen_mode != XEN_DISABLED) once we merge the
> Xen-on-KVM series?

I am not an expert and just on here as a user/tester, but I think it
would depend on whether or not the Xen-on-KVM mode uses Xen PCI IRQ
handling or Linux/KVM PCI IRQ handling.

Chuck

