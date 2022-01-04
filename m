Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53C484384
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 15:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253268.434352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4kv4-0006Ly-IP; Tue, 04 Jan 2022 14:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253268.434352; Tue, 04 Jan 2022 14:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4kv4-0006K5-FA; Tue, 04 Jan 2022 14:36:10 +0000
Received: by outflank-mailman (input) for mailman id 253268;
 Tue, 04 Jan 2022 14:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7/n=RU=yahoo.com=hack3rcon@srs-se1.protection.inumbo.net>)
 id 1n4kv3-0006Jz-Eb
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 14:36:09 +0000
Received: from sonic313-13.consmr.mail.bf2.yahoo.com
 (sonic313-13.consmr.mail.bf2.yahoo.com [74.6.133.123])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a401c351-6d6b-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 15:36:03 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.bf2.yahoo.com with HTTP; Tue, 4 Jan 2022 14:36:01 +0000
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
X-Inumbo-ID: a401c351-6d6b-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1641306961; bh=ON018EcfDefggBNnDMrJDLszzjgc3CdG+sD6rTwlqTk=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=OfysqK+UQZpOoRg8wN8tqtPqqf861XYMSPPDVZSKm0w1LY/sbOd9H1N4Gz42dAHTVV9HRf1c+UldYuihELQxIuf3rW53qX5QFFsVZ2SOyUXTmGy4RU7gPbxSWt2CiePBc38+8e+WfWK9BjTZjhAMRt8am4D7br9r/R/kxKFpVGLGgZqr7mLewKIlwwh10tefnn5zKQNYEOPCdSP6KuG2R/31I/Wng3sFCK4qxaPxOvpIXzFdoSkwRwcCcbK7q3QVon7IZ6ED9t0Mr5tSdZ7GsmLn/ap+1vFE6K4TRCuhJ+1MQqIs9Pb2GprtIFAcnxbRed1Szl/lygOuVti3dVSKeA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1641306961; bh=FLvrny/qxN3aMBUO41CQiUaKd0ZrJ7rzkOZJED0JBat=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=ZcFjIcL01z6jGaDKoW0c4FG4VUotk5kls5pPBSZ/NHx+slZi0xsZvZAozafdSZJzvIk8GSOXiiM1S3FjVtFu515kbceuaiWgDjyH/L8nh+YWlyC7pm+gPTL9cA6lsXIHTbYHcvOUaXBiE5RmwnmcDEZpVoLEEQWl5a4ctCmTZQpe6MJbkFKULQNZVb7EKFGqBGemd9btM5ECO7Yg91FiBaBe+Z5CSKkC5orVma6q1IyJFlZR+S1Qlxs1Q/kIMz9APx/LM2V2uXiwYNvk5hdum4eyahmxIr0yIR88GBE/2S2w+yKk9igwBSd1S62OD5f/XjJZ7yEf7DPjua+a8jLFbw==
X-YMail-OSG: ILDmGdoVM1lmwimEtzWwi72UdeqZnPq7mhEv3IaKleS51cMJJ_l8aM8UbpGFWQy
 rf3EvJT1E7ST0yH7gEiUwk7DyRZkmZ9P2GGZ2W76QCR0goIECuYRR6fyYRXA5b_7mc4R7FRV5gQV
 _PBNW0yAsropEOh6TPtzp.FeqAxDwUUTX5ikOshId.V5Kp6WWkdVxBxExQr4cQ6I.ogsv.c1CD7v
 w_NlKp9NIZINsb6qX99_0bUrkZBwb0ywtUprSeppQ5sWUE3tkRWKpejIubM2FNy_uuDmt8fD43DH
 7eoUEVflp2t.BdauAXpMFtdCAICifbddtLEcSDnt9tcCPVCVgqDOHeLuMUUER9d0xszpEol0.oxJ
 n5JGSsOxdqRyFBd7ZOIixP9qxsHrNWKj1YKfxNy0bRsRuvrM3j.uhKhtlVl.pkevODmqcnFnaKP1
 ly2IGw2DcN3BVS8jqg5kuFSShnk2Y9szYmK9d36WI3m5SCBR50jSLOxN.CsibYSavJqWgDIUj1qh
 UL.WguYSYffSZX_MPIyfZeMtG7v9D_7ls0h8Qzl1i3qChGC8wYwKd6IDJLNFTTMMW0KVnQxf2QJK
 0uylPGNAVmsgZn3yFg9NU5n8Zz7PrB67xy4IDIQgzqbAoF9vnsSoJ6IDkcUZUiJuoEf8Iu9ZK9AY
 CPyFgVIJxDYBDvYi7Oui.7Qfyz8AFqYZLymmmq91Rm__0EVogg9TJtfsH1vqLeQfB9zUvKnBXoc0
 mTatQNpYJuWnyE9NUsNDxERJb64cXuHrVMGHHmeEgzJEFm5XeaZvim2jO.m.Ydxc_ClSx8sgxGVM
 4iL.ksKEtcH5OtuaLu3d8IgC13Ruildbs1SPu5O2LGxmSRuw52Pozh3JPl2bkwe8eVHXdfaxBh5z
 wuGtzUejdmzX4.zQgoP4czzdRSbrXxuvLOMMnC_5BZBsbNBmyOwbqDw3.C6ijXASWo0yhtTYFZ9H
 crqDvEu9dFkmr8djD9iG5gw4OQJPYSnLgl8gp0xIJNOtJ1_AVmxDl83t4WVgaLdiBu3h3_W7f526
 YA7mzIcjzS4M7xLQm2AGjeW.4vUL.DBY_762l2qKy5Np7bCtB1ClMkNXeZ5vE_EF.yfmZFTE3Pnu
 ZGcN9IxCEjSpgQj8CuE8EXsxjjRbO655rTJh0hmSEd665jjind26kETx2vGLnr6.nuTfj.OWkgpz
 bGUIREJabXdoKJpDOimwgAAb7N608Gb3wn2r07.W0Cz8RgjiTj7eYu6kEN2uEJ4nISKHHcnc.HY6
 HprVvZH4LIAWRweeSiJIy8pwkSHoCWSxpFZvDjYt7pgBZh3gT3eosgpAz1VdFX8ynLgM0hEMRmH6
 ly1.Bdo__0d_C442O_Lw3evWDPbgrTjVHhr0Z2rUyZ7nCzxq5uQYWmGeebXBRdfeFZU1ZLAZNGRk
 fkTl.llRzBnHAfg4I2qk0vlZPNaI7AyMGg8o0Fjj2Az8WE5mbvMioAeQVJ5WJypCrSTlvT7d2ZEl
 75rNNjI6vImzuymhNDhvpsqbTHpwTnVrOCqeTXxCZ_SGttqxWENcnoPPjJEZADRKXVMbHiMqTv.9
 DOifdFFhaNcfudvVt4EU9017orD9uV.eWKzvTliryweMdBTFkAgKzB4L3YT8exL6gobJjjHuBOiN
 TGcHvHPySFzXKDhvMCh.Mr8yHC7yzvz6dGzoGw5SH7k4KhSmNTTWgnxlx64SS5H7gY2CYAkZRn3p
 3EkQhqFn86HA.8qrJb7cRCYp_9FbN35nlltLgc9GSoscT52dQjE7wL9dNevYDLuBOdYSl4aJvCvG
 G8YpcR0nSA76GXNfYb4E7ehn0k6JhvExFETB5lGE9gXojV3gkgr69j5bGCvNvHwf.9Hsa9eESU.t
 O7TpWL2dgyTslXE3BcBb8jGIkacAnbcTpwLCZZXJFSxBOSQpnUFmBaE9RkUiie7IZRoexxCWJAe4
 5mRDeMrSTL7dP22Kf8ukP3AEER86KtzQ2OdI_2dTQYfLx7Gj5rAw.oClnFIj2nr78Kkh.9hNCWaV
 1EnsASiK7kwlHWoBjZGAfmttwyC9NcG2cvq8l1NgvfQQ2.VfOYsK4w.80nuXSUWcV8OClweGONOs
 poENkqtyOeRaJUQp.kM.enxpeFsqqUC2ykMxSMSNjPYNAii2gHWShiHjwX0oA6Zm69PcVuQm5sY5
 a1nu_Y4zDKRJ6OrromGgHhTT.NcImC1KB8bKqAT8DaR9p_jgGmSdAynXtwLsMlSliXWwH9BkiLni
 YBQ--
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Tue, 4 Jan 2022 14:36:02 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1012347862.912695.1641306962247@mail.yahoo.com>
Subject: Does the Xen hypervisor use the Rust-Lang?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1012347862.912695.1641306962247.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19498 YMailNorrin

Hello,
Does the Xen hypervisor use the Rust-Lang or will use it in the future?


Thank you.

