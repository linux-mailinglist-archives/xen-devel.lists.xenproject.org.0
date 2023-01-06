Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380F660677
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 19:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472874.733276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDrcd-0008L4-WB; Fri, 06 Jan 2023 18:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472874.733276; Fri, 06 Jan 2023 18:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDrcd-0008IA-TN; Fri, 06 Jan 2023 18:39:19 +0000
Received: by outflank-mailman (input) for mailman id 472874;
 Fri, 06 Jan 2023 18:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDrcb-0008I4-3l
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 18:39:18 +0000
Received: from sonic304-24.consmr.mail.gq1.yahoo.com
 (sonic304-24.consmr.mail.gq1.yahoo.com [98.137.68.205])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 691ed5a2-8df1-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 19:39:14 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 18:39:10 +0000
Received: by hermes--production-bf1-5458f64d4-bl5tb (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 90dc30dca055f6fc7430c5ec161196a7; 
 Fri, 06 Jan 2023 18:39:07 +0000 (UTC)
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
X-Inumbo-ID: 691ed5a2-8df1-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673030350; bh=ByxGwuLu/B4A3w3BivVK9fvPYeRgohNkEitT7jEThBM=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=Q7bZzcO898sepwxtrzaC9YEj5BLAJ5g/LqzXEmKpvGwPAa1PdF6vTrUETxd89y2+BSwyEt7NS/OqgfrBrw+r576vtPuI4luvbtLVwglwso/dcdEpLw5v1nqw0vkL6U5Uugpl41ADIw7jBYiACxggu6WCJaLjToeTGpxQaY5AZs05O1ofiOY+ydtDYtkw0AoVEKG0H1cDZuPoDaJodjYiYcPsBWqLpRV/M2Rls3uaIxTv0xiun4AYqbajGhBo5Ct3Zh291k9GdcFXvolDjG9TS2TdRLFEL3e278PEt+uppBV4IQAiHtFa1nloDISBQ+we/RjWPe3QCO3KIIfLyfLkqg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673030350; bh=jdDpriTmaKK322OkMVuZTh256ShgFjR0VXVJysXGec/=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=PHOt+GCwsQFKPbdXf7Ap0bW28SQ1JcAg14Jx2/23A1RcGGynxXzL42v/KJ63A3YDN4R2RAVjsjpArIzDkU5/C81yOQZgX0rWFc83AVJ6mqiIO0564z0vq45eF1pVQknJbHi7ZW0vgjpRrEGckRwMlXa4jTphOsFxDBhLx4pAAMpLtUB/2/tVYkFkhVjGllxohxy9Dx4TnuNEZR+9XoxVf2OUMrhPvIhhlI6XUrs//qX9OyJ4kY46/1rWZtxfU8o7KT8Ly8iO9KcoAj2MTFNG8X0hXMBTGAI9sUTpiT+x1K/WEVAhzTkr4G9TrpHWJIsXG1xgdGj39DzEGaPrXdwiVg==
X-YMail-OSG: xytN2Q8VM1mZBpk1MsZy3FNWjf3FsAF8Ppe6zrirAut4WLJjyyEBBSUn8m.wtF8
 9GG5GUBThPXGMjPVnLQt5ezUGjjcV_UjrQ7gsKJiuXuoxYF_h8qU9_UACINf7aSCqKmHEwsivGkF
 UIxtKQ5mp5kVCcgXq3nrKZa74S.vV_HWOTXH47qoKeccoOhIar4dQIY1jzZKQT_s5FSitFPEcBjP
 6JYmjFeSMerF_1QRJ0HHdseT38eQ8HyhiK4GHCtnhr0jSkfU8twtOiFNiKnRXhmJ_Y1pnrQkTLD0
 ZFDYQjubpbJxPTHy.ks95G3vBZBRYca7MciirZZo3sW390akVSlrZCkR5nYFrmI0vY_XVJs_CoDe
 PYBQCsGLOn1L1hN8pLFOVQn1uwvIjsEjy5.v3NncQ1ujB3RPCKAF.80FJoT0X.vEz2X1mSRq9qjs
 .01OncTLbiFnzOJzsLWaoWzwdGu2wuggoZJk3Polunqpk.NdksO4l9jU1SlxO8TuTPhSxat4Q6L.
 CA6alouZ6wDfUrtSf11EJrqx.O.8XFFCx15bx2isYbW7jYPdYDQVaK9r0zdrvnhdsAlqam18Z6gc
 oPxva6SReuQlsU13wZBsGwWQ6L5VtusOcElaF4lDg5SP5HgxsA_EjiUiiLCiaytuk0EL9oMna4xL
 RR4oUESW_UH.JI.dBswqCc0Acj.HKx4B.WK.pt1UWb4v318hA4vGtrvoeDZ1mif_5ozkMsaBrjwR
 IGfJmMyR8XJIGdtGqtAmK9eD1fys_d3wHLp0P7r7Q8f.DFUCUJF10YWSA8YeACgx6z_Cu8fbHTzd
 V7HLUTNzxbCCFYkqpivOyMpG6ZnBu9Rx0HhK4QPyQIhfDxnsdunt4WZ5miSCEHd8yITql6NgDeaG
 ZhXJKgxY2BzXCpFDFCgtpX627krdRq7yCzadlMabIryRMPVk7uh.4HwapC933iQAvHPlm22VSiRe
 TOCBbSbQ9Y7iwXBGIHvaM0uJItA5V1kSI02YLpZJxo2DdAhBP3F2Am0mtZG5ND9ZC7U7zToXf95Y
 O_xiZIgB0nJ4kXRwgrLUq_LAyL5Sdcz8BxakB.sL_uF.EG4hkGUnMXa1MT494TBsE.tj_cq7sIkF
 8avx_r6_fNRh_wVvziEk_VZQYvWpOQCq5j1nX8Rc_ezgQtdS8M.5PUSfFwj6CaRDpLrvbdra3bA3
 Lbkqgph9eZpqamha5w4yNTEZvotmxjY_5KTqLZDIuf0bjQA1ZOLaHkaW8wSpLtCcMJx8VZLTsC_v
 8tru_Z.TT7FXh9R6NX9LIzW6CzkJlZtk8AwVa7qYKOyBqwgZcRlAHxpdFBXRa7n9XyXS2GPHKNuW
 PLFBwuBgtu9PwTc2AhEL2DHDziRRoTAf2HTSPuxTpc9LoSBeMji72VGsnDZAHWvRwkflHnZXVf1w
 3omiMWoPu4QYbOPN0q.1jXLlojmVkfHesUH1YymYT1UECK9xsdcrlkEt_4dCaqKM_rKgpGUa.XeO
 6y3L1N8L34UsSLr6kDefrGAa_UhhagN7hYDztgBKskeC1Up7PW_A00rx.EO7plMA6tKv7deUqbAF
 uapikbTWHqhzjnK_oGXSgYRr4m2EZUfQJSQOKYFZ_tyb5KgmGZgPdzvlb3yOBeeZbxpvqmlsiFzU
 aET757Svb1gkbpsFgbLdiJdfFeh2JmFntMX7L6Xj81BRNV2NEBl_UKQBHOINZq7DwSJQP9q9oIaz
 ZL0uKDpaad0tTzseZQ2fpF1Z_tToF16FcZ85ss3Em6tffvzyISID87gjbze.Bhu6WKJ5V_cCwHjz
 nfiENnHf1uXhhTATVQQsmCB9B_S3uoz637.Z0KBYC5j_MrJ5qzjVR74NUTiqppLWYxjbeQx1Ho8s
 QYz_gE1o58zfBCfXeiO1u07xuZauxIMgEmsM5_FKaOutv8iLoiDIAjGkA.ITgWk8dgnKFltyDf8_
 vHRa_x08UxLf9mZLejf3mo6XBYVkglwAhXI..uBQT7udtiqaoKw1ubbH9g5mMjo05QwilOTQERT3
 rhytkKQK8gOmh7n00HN.OyQ59vgyXRze3ZEParQQd9bl3ewzJ6elrToo.FiJPVftGfs8r_k8kZ06
 YkF6bF7jnm1A7XtoCgjWVmgT_11UoWEAWxfUcNcIMFLYTUAkpW7ErAycbObYkaU3_V8BEh8xu129
 vvsXlW8yrMD3GvUiFyb1THvlUBLb76SU15sUzSmV_QT.RXVGa9oUbCW8Nw4ntooNpfoWTk_RBm8n
 DQ9k8N3mg4L8eh0Uly08a
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <3f7527da-2f0a-2d26-95f2-23776d0ab141@aol.com>
Date: Fri, 6 Jan 2023 13:39:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside
 of PIIX3
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
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
 <c328e499-0a52-e46d-f080-dbaa6b98cac0@aol.com>
In-Reply-To: <c328e499-0a52-e46d-f080-dbaa6b98cac0@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 12:46 PM, Chuck Zmudzinski wrote:
> On 1/6/23 12:35 PM, David Woodhouse wrote:
>> On Wed, 2023-01-04 at 15:44 +0100, Bernhard Beschow wrote:
>>> +        if (xen_enabled()) {
>> 
>> Could this perhaps be if (xen_mode != XEN_DISABLED) once we merge the
>> Xen-on-KVM series?
> 
> I am not an expert and just on here as a user/tester, but I think it
> would depend on whether or not the Xen-on-KVM mode uses Xen PCI IRQ
> handling or Linux/KVM PCI IRQ handling.
> 
> Chuck

I could try Bernhard's patches in a Xen-on-KVM configuration if that might help.
I would need help configuring the Xen-on-KVM mode to do it, though, because
I have never tried Xen-on-KVM before.

The test I could do would be to:

1) Test my Xen guest that uses the current PIIX3-xen device in the
Xen-on-KVM environment and get that working.

2) Apply Bernhard's patch series and see what, if anything, needs to
be done to make Bernhard's patch work in Xen-on-KVM. I have already
verified that Bernhard's patches work well with Xen on bare metal, so I
don't think we need to answer this question before going forward with
Bernhard's patches. This can be patched later to support Xen-on-KVM if
necessary as part of or in addition to the Xen-on-KVM series.

Chuck

