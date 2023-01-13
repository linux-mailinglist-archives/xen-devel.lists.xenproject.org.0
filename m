Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663E668AB7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 05:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476489.738686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGBSi-0006hw-MP; Fri, 13 Jan 2023 04:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476489.738686; Fri, 13 Jan 2023 04:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGBSi-0006fv-Iq; Fri, 13 Jan 2023 04:14:40 +0000
Received: by outflank-mailman (input) for mailman id 476489;
 Fri, 13 Jan 2023 04:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WVX=5K=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pGBSg-0006fn-Ee
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 04:14:39 +0000
Received: from sonic305-19.consmr.mail.gq1.yahoo.com
 (sonic305-19.consmr.mail.gq1.yahoo.com [98.137.64.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7fbf237-92f8-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 05:14:34 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Fri, 13 Jan 2023 04:14:31 +0000
Received: by hermes--production-ne1-5648bd7666-x5zv9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 90236039d2e62b2abb2e002068f6b7b4; 
 Fri, 13 Jan 2023 04:14:28 +0000 (UTC)
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
X-Inumbo-ID: c7fbf237-92f8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673583271; bh=4hASBuEGunDT4zjWth2rvDl2Y4xCmYLJ9R5aycKiqec=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=tONNFQpBv6sDKV/ugSmglztfJJL0yYEkcO0dJcg4BFyP/xJY9NduoRr9Hn34HBoWNnbJbxJvJzsaT6waPYcUHbDFwd1ZqYfdcmQ6HuhbyE4g3Xm1iHjCIf6WzXznonLD6A9PGVBKs7eeYc+jNpRFAEeeqSIU/k6/2+2q/YsGs4RhTx8BPvanyUxqNehnaVvxLPPrlRe02kbt2hYGGB7R0a9+je1pij9eoX8PZoFZ+HkqocB0tB6zUmLq+xMyjHDOH8LxETQC0GSLUhnjYfP5hjbbyf4hqNUrc6zjsMHSSJUPnbVN16BOFi0MA58igCZAuxIe+WvoWscyxoAy1o/8Yw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673583271; bh=Tv4gbSx1lQwSkmBRYj+8e9bM3qtZfTwV2DimFH6eZWy=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=UlFlx8AdCnY9gXRLo+jltAqKbwiOFsksnU2zXen6M1DCZ686j8CIDK8hck9ltidKZVXRkLIH4zGWTR4mYF92gq7HDcHKyFpJ80W52RZBv1LaXOUbGMdF3m0O5UfaXcsa9ZQL94s23cxFeyY6jCv+qViH2gFbhjuR7/ThJ03xm0iFvYM8BWqqAA8lOQrZvn6rKqekMGenaixoYQsJtctmguxtibHEnvP/kUf7xkermgFlWLR5sno3IFSDQibYgmdjXYxIFZ4yU0PcqiAzJhTV4p3f6+1arbzi7LUQJJ5l/PN6AqyeIaBsDUdmuTTR/LtiGG8yrgTaNt7J1R1OAolE3w==
X-YMail-OSG: ttEldBMVM1nVeFTo_.eAWkkRTsqhuLa7Om2EKLB_l73WR5n3MGc_a9YbOHmGONy
 E3DkD0H0flRzYy.Sy60BO21eGNYMrQHhiEnxxx7jq8t5kWnX20Sa.WOYI4dzYitvZxqWFfN2tgVu
 ivgRIYummAvragH44oo5jFD.5BRQM4pbHrw.yJmMv_2dkCO_zUjVwwEwSQcBpRVbrCbsLRnaGJQx
 R6d3jnETZBF1n40M2oHkz7rZbr2IGLNyHUlWxGkTWGU4QccvzSQLzqqCCWQgEXavfuMUMnispzMP
 63knsXk7zhPiFETn9RAHqLzpFpB93hQ.6vJQRwRaMTNjC8_J4SBbo5lHWXwflLidB.yaLT.FLuGg
 TOyCQO.LedKHqqDjsIVIH285OdngrmYwUm06RIwv2m9.KocCCJMlZzTunS_rniJ_A6yWRD7QkRcI
 4XPxWY3wdIzUvEVXvJn6b7EJdBktenWWUBzjYtBkNFZkGrTTPdMsBH4Yds9csE0ZjAQy5MG3V.nN
 YYz4angnODQTV4aIQAVXKKsE0647PWOEwSZoUUUkgVz3e_QIEavRV2NTB62r9VDLcABa6EhPddrD
 jC11GJxHiLxuYkUqeqgYr8E9QI494gTd1iLPNl48NZ0TrQIIGzko_z.evZYCXZgbv0nv8JxnMKhX
 s0AFYuS5Q1U_xDAnCuinEBk9t2bNIEAjpg9t3FeJnEBGx6SCftNAS2jAaivTCYTs8aCMWu79QXeI
 sm8gfsKrxuD6dRXcmuWFI46B4qOUN_WZhe7KvUtFnN2R_rkfkDCdg4JKlYVvBDBvuKBd9PVUntUK
 EZeeGL77Wu7mm4pVg8BgaKlX88M2ONVCjIRO0i8I4qOVcmsQNMzWHB.B4P3a3N57krzpVLfNLi3n
 bVg_OX6B4yH0sAMj_sX2rr3ncAKOAYukSLaqpVuzYz0fTXovWfFbrmn7dHxXlCP5ge0cXk7_lbV9
 ubU6GPYOGB8NhwOK27gusL7TmKBH2ijhefApbiQuh_T9833DcGRqTyIUG78UrYw9Y.k1AnZZ2n9Z
 LL299tV.os4jWgEpaPA8edPh2yyOaVIUWebUY2rUaKtVbTe6ki9Wtq8jTJ8Yz2gd9x40c8YqqshG
 B6dNeM3HQ6bKxd4tEpOthYSFtrvCb2gNknTtetkTkP_5CDjsajXDZO244f22TRrtOVSw3j2Zbm5F
 m53nFDGhay9HVeAY2N.kUobffp0hH4OYL2oyd7.t72JkOix73iW5Wd8CZT9dLLHk1hpxv0gD7vgE
 We8K_k7zNtkNAE3DhCXp4dySJXaVwlufbdQf4smHnbnVWDP2.b6rZg8Tibl.LJFqgalLKBkDSjEe
 mSi0ic5ugnz_P9VGPDkZkuha4OitXVDoXjLHykZe6RQccZswk17EilxjeYkkzM7g_X5c_GO1l9iw
 gZ4f6CbN8pstqhst94cnWmxp6zJvNdC_TzyRE_Zps71EZArFniuCxz0Y5p6nAP933AQT7CMti.7x
 mVFpH1j0Ug4BkW4j96vN48_6o9jSapVZ0TkTC4fKqSN62JuSrsRQwRpDk6aLVhymuIOWbgoU7v3q
 ZacOVwjoyfJKr7zbuFTmDNNzlII_IVQ.4DF5cLNCc.CI5uj6Z6ZylLNkBUCO1JaAQbtggJjJ7e2W
 Y1r.FeSK20kCmC3b7qhVeAJlpN43o.IJfwYr8eV_ZnT3mt6b.QdoB28_jxpnJbAfA4X3SQRp6qln
 kcOL_FaPXk5v2caniSZEVaJT4TmiHhE8MfEDR.fCAjIj6CK7flzKgctdU8KCV4kC7G5Y4X9IJcLT
 rIhM9XJUi4XKkC0xAldVbz3oNXeZekQgqLS1HjTX9JfaqDn1ZaCr9c1V_rA0UQlRstf8.Vc3GwDL
 CDb9wtYqmvEDJs9k4_6.yHlFoz.D0g54u3bddkhahRDhyefIGUjcVq8tQnb2nj6ewDJ.6diY2jvR
 UP74pcW28nUPp.VveXif76.s.ud56DUw1tv5jvI.75wGbTIGbx4QeX0RDiCd8R.HP1P6IFppe7GW
 sD1.hR7LMdRHxyw_DviAqJaJMSGPjMn079JtlpVhd3i6XjmF5WbZOpqTSF975TXHSeRldBnIacC1
 0J0zl_d1weRGnWBOPOd_vGWLb8y0qRMneHURuhrHChlpapeFpL4dbnb6WR6suMFGvPPft09FLp6O
 LQ71q1lFRb5Rhd5Lrx1fb_NAxJ1rD.YO5Fm.jWvNxoIheGobmEqjIQwRPND.VF0_6M1TZoqgtgfw
 Jbm9Hbo7t2SHMDfH0jzV8Iw--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
Date: Thu, 12 Jan 2023 23:14:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230112180314-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/12/23 6:03 PM, Michael S. Tsirkin wrote:
> On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:
>> I think the change Michael suggests is very minimalistic: Move the if
>> condition around xen_igd_reserve_slot() into the function itself and
>> always call it there unconditionally -- basically turning three lines
>> into one. Since xen_igd_reserve_slot() seems very problem specific,
>> Michael further suggests to rename it to something more general. All
>> in all no big changes required.
> 
> yes, exactly.
> 

OK, got it. I can do that along with the other suggestions.

Thanks.

