Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A94EA26F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 23:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295590.503081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYwxs-00020q-MW; Mon, 28 Mar 2022 21:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295590.503081; Mon, 28 Mar 2022 21:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYwxs-0001z2-J3; Mon, 28 Mar 2022 21:31:52 +0000
Received: by outflank-mailman (input) for mailman id 295590;
 Mon, 28 Mar 2022 21:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zwcm=UH=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nYwxq-0001yw-42
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 21:31:51 +0000
Received: from sonic305-22.consmr.mail.ne1.yahoo.com
 (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77d65e41-aede-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 23:31:47 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Mon, 28 Mar 2022 21:31:45 +0000
Received: by hermes--canary-production-bf1-665cdb9985-85ftg (VZM Hermes SMTP
 Server) with ESMTPA ID 576b314da54bb8f6dcfcee7c0d09e045; 
 Mon, 28 Mar 2022 21:31:40 +0000 (UTC)
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
X-Inumbo-ID: 77d65e41-aede-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648503105; bh=PQva7oXbbLjKvssCCDfwLPyxncC+b+10ygjMtuZCBzc=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=kqLUdtWXN0nnbTaM/qgPufV57S3qUgu7wUFSdA4YyRyhwlDZl5H86IdX6S5bsTpnHJekKWrwZK1Pvgi+MUfqkJtiQVon2mAOuA0YCXd7tpYx2a2f/bqEoJsttzlX9h3/yiUL9W8G4ynUOkQ+LWqBhX7FNpDIOJZA9+eyETdMDjbyjWiU8ILVuihcvoh35R71B47dmrPu/TpKy5r26bVFaJHcQcC5iS0Qvgbxy3aRaPVugfPomGVWDalg9776fX6qGjcBbfgggLZx1ezFQKZZRllAB8tV8+ENAShOAHwjVYfZyhoidHRkpPtVq6iMS7YSBuCDfyyhWlpV1ijpEQSgZQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648503105; bh=22Lerappj6Ugd3H4qpaqQaY1fK0aOUOebbB+5sGELYD=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=lLnB+yCsxHW/q+lPMrwm8pynv/lfrAuiQlDbuv0VEJ1nArhdFYTM8mAg9EmFczVQpw2XHFU1PpGPjZbElcCq0T+dc7jPztBt9QTXTPZwcNjSufuPyDXwHBOcBTxqQOK7Vnio9OaU/j2Na/HsdE3DfymbEplV3PUlxNq6mBYCF++m7ngvy4lwRMfz7gPIdFSk2dfMGWrRnxD59fwtOMqzVzvddFA/IPElA03oBXLNtMHzuOPWHtkNjGpwQMTKAmvPcUPD2fzgPXjxsn508aQBspKH1faBowKzlVVFOBxWQTDImkeWY1MKXc/Vbz49898V7qbu8hD/hNVppnXF9kSN4A==
X-YMail-OSG: c9oqg0kVM1n3u2Aijuc0DpW93SDl2.L0MTTm33PFVgxm_7ctgOPx1e5GmtxrLuw
 XIfwHanMRtT9wMQWQURdQe.gnd6LWvneTi15n8U3B.mdEvW0NnfBdvHDvR7UEJuU3.bNJi0HGyRa
 VyC4mRNSJi32LK_Qa8zjRib3KSMlgXQyFXOMzaPlzIBAP4.96tUUKOpN63rYYu0UYaIJEXw74IJa
 mDAAPctccj6kF29j_gsqkVs0uXoLo.YtQjkMG4AI82sUeU1Leyge_tXU4Dxt4rvz6lPklrvBanbH
 7Glgqugk4Yj3QyZl_.uCcYzvDCaxGVBjhTN0xgzb7KLBCwS5OEs4mkgt6FF9XLliC4PvTRPJd7cf
 AQdlKXTt.eARROE1bVF43STWj0zSmSNFfvsGJaUhhIKKloFWU5FBoLZNJNU5XQnirWCkWFJMH.vs
 4Mi9h7vXJEcPcCSD.0KI6HpNuSg4i_.sG4nSsyLDEZBy6IinXGXw18HA3npSQe4_86DXiyYg07Qn
 kludlGMpcuPEwufuaosCq0cM57W6k..fc0voREBfGuBx9_H11vlWrX.EssOYKLLXSC.ns1kMJSFJ
 IxEThCgxXrrdZrksW5qYhOGK96PHzlMta707mIElB5Pie..MoEAATAFFjhfiA2vOjcQkOQrZH6dY
 r85zq2.7wb5dZqdJ0FYg.0Z5bvVoAC1uVLrRQIECrdTE8WAAwTCTqPJTDhlpX6m9tFBt0gsJTQ4_
 gaSCPM2ihjhIvuMNuPn7pKZwUYlUY9aQukEy3pncAVqU23fvOZJ0._XZSSKOwS60rBNte5LDBKpp
 ddQMnGKlXZ1VJJdZOJs7BaCYy1gqvFb_XKU1Wnp2kPSPUU8r4tKi3fBdipWiuHbFstmC3.gjRq0q
 ULNtxnbvA21bPtPnAstwSXiD577pVBpGx6ZDLFulYJqLFHAftB6fQ.jlwPQVAy8ZRh.PiYz0f9tk
 2TFkVZKjMJSi42uhMYsQ9tqsYRg6PobGUlSJWP_uRgodBu.insZYv4L1U_Ib6iCS.K7yH98NPuLv
 N2AH3aoeLGiU7bQIjFWcZ.lMmdQxDsE9GbS5rsoeSmv8mDVRRBjSROvOhjWUBTatAjxE5stPX3B3
 7aKNc9Ld8OCSTIWm7Oi2eaug8KYcvRWA5hhwGyw4xzZ3RHIQr05RfnqjH69nv7Xv2DrpPqsICYLl
 iYHutwQ.xgMLKfOtCLCilhcm5KKDEMiK2rEIAHnuvWSsYzHdGuQEnCkbfVz_ZPOO2KD.jL20QH3j
 43IR2raQH2ujUrWKJmV0V6mhwvwRAQBB911O7GN14KTOTWafCJ7NEmP3V_qnT9w1Zg632D8xhbqb
 S9Ldcoj_4PWlR4yphuyCf_B2N.CAOF1hgc1rr1bjC.6khNoiFr4OZsVsz_xxgWXNjmVSPJ_vR5fS
 aqlxCoEM2ZpASH2DzK2lBJNzQ3Qsu2HGuIV7qp82p6Hz3uAByVGpdl5NgMuA.vz19F5rR8CYrlIr
 BItDFYor8n5iCGKFRTup6Wptji00XRhkLn.wX50Y3PdYbe9v.bcZ9yDzqEIZC8AwhZmmBmzogsdZ
 QBSs_on3A4mjgdOI0lJUx.kaZZtLWsqZwJ0dU1znphsQMfVqtG.v0b6VCv78Gbsa.wW1KWOW8dYl
 j9D0GCySZE.U2FPjrpvMs0pkRdWXgVY97tCD5oE3_mKRx0nIs9x75MRnH3dVSLbAfxH4DCErlY1h
 TOlDlU92aCuMPeZCWhKf8FnHvoIoAjPQHjwOXLvBSl16k_rrRv3Eg8ePQwANDw8BZlFrCk4byldN
 mU5pVr7EMKQiHOX._Bd.OQj66uBoFISrnj6Yv9d4cG.Wm0pYJqFkWUVQWB.GhIKXhLbOm1Q3pEcz
 _nvI6hagPm5Bujm7s5v_s3uIoQhGVeBntXnpM9JyDcqUqotQBI_euDi6CKKBdg2k5.aa8xJFD6ip
 WI2p0GmP.cvoGtAxfM7Z2Bw2dZvcU39sGqnTwzr75x2uj5k9Uq1zUQGiISKmqLp7x.vMls7NjOBp
 w6ZDavSS3_fU9o7Xd71hmuaowfOa76HA1Khm46G5Ysg.AUe_rfLRy5hQSee5tlWS2facQRZfVU1U
 n2AeFYy0kuVBMCkpxQlnBgUtdgO38sMDXT4B3kLjHf0ThnKQv2sB6Jq13sAVXlWoBQ1y8r_pyid0
 3LClGS.bJQfL8oNs6ARIm5GPDXHHop7Nsvp2HZgIuFdqWW9MbMDFeFPGQg26fFP53cR1EUhJR8aA
 voO97x8tey04ZyCE-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <ae555879-9e3a-88d8-fa8f-4c4d60288d8f@netscape.net>
Date: Mon, 28 Mar 2022 17:31:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19987 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol


On 3/15/22 7:38 AM, Jan Beulich wrote:
> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>
>> +        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
>> +                                         vga_iomem_start,
>> +                                         IGD_OPREGION_PAGES, 1);
>> +        if (ret < 0) {
>> +            LOGED(ERROR, domid,
>> +                  "failed to give stubdom%d access to iomem range "
>> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
>> +                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
>> +                                                IGD_OPREGION_PAGES - 1));
>> +            return ret;
>> +        }
> I have to admit that I find it odd that this is done unconditionally,
> but I notice the same is done in pre-existing code. I would have
> expected this to happen only when there actually is a device model
> stub domain.
>
> Jan

I dumped the value of stubdom_id for my tests with the
device model running in dom0:

libxl: info: libxl_pci.c:2556:libxl__grant_vga_iomem_permission: Domain 
3: stubdom id: 0

As I expected, when there is not a device model stub domain
and the device model runs in dom0, the stubdom_id is 0.

I will now do some tests to see if this is necessary when the
device model runs in dom0. I would like to know if the device
model running in dom0 needs to have access granted here
or not. When there is a device model stub domain, I presume
it is necessary, and I can check that also and write the
next version of the patch accordingly.

Chuck

