Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB2E14D336
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 23:45:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iww3D-0003X4-Po; Wed, 29 Jan 2020 22:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+WII=3S=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iww3C-0003Wz-5C
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 22:43:10 +0000
X-Inumbo-ID: b913097c-42e8-11ea-a933-bc764e2007e4
Received: from sonic301-32.consmr.mail.ne1.yahoo.com (unknown [66.163.184.201])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b913097c-42e8-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 22:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1580337789; bh=UP5Lp8oBTGbp4p4Rrb+aGIhfwayBOnTik0noaNyZpgk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=nvTE7JQ/Z+mLW4Ti+rUYzd66UOYlRp42C3Zrh1KagLjsmOQgHvV45ZCiAx/GkLXz+WGTSVx3UZ52o4BTeI18dj96IK3Ge6Vl+ox89pbIrbsj/ehiOnss4ePNM+khSISQgEV4SQuphgNNA56zbvGLUkG97WxtSw40FnE5O45jpjI2ebgNNfqtMAXatnNauSAz8ebFspoljIaOpm2M6uH+g3MPCmLLNVzdQ68EPcwoQZ+eL8NHSmznKDBVW5wAwKz63PDGQbwN7reDj3PIpjH/kVa/3nhOcBWuLOendLszmFwlpC4qAgAANQZgAx1xLTpCBMDxeJhjWxnZQph8PeGOIg==
X-YMail-OSG: FaxgdaMVM1mJdsgqIbn0HUH0KwtqHSJnfCav34jsZrjhSvX_5SJNKZeQB8Tcb0p
 x_ZHkccIq.dAZkO4vXi_RwSWQOXV0zWsPHF7fi5XeaCHWcuKO3Xts71_iOmp0DA8_Rxun6UZwVxI
 oCyelMyENpU_lYyDYvyR6Ykxq7BBMvlKmU6aT1n8_YZ.iJrppjkwi0S5z0T.u5Es9qn9fuaKNPPg
 d2yWYPYKp82ExoTcFVaqNctnFzN_Ko3ycMH13dXFxFDJ0snUEs78Yh3EeLxZYnD49RaN6ndYZahc
 hKC5RIELR29lJ_0xTUn8foFDRVc00ko34oHM8CDR8k3S2i3FkMW0zfXND5vjtrQCh3z8f3pP5NKU
 M95.A0SBPizX8MaE314dSgrIMRH3IVlBFFmh7Cx1NdHx3umCkF_0yJILDZi9MAbPgJbdwPfJdHtS
 763lcaRJV1sQKIU1UI6jgjj0XbfAY2REvqjLYa5e8Iot2S5aZaqSnUqs0TWLgSXVUjkR_l9tqQCC
 61KJFPpyTp1WXy34zCXkmYXNhat2MuEKGp1_t3Lx2ythkX0cnmiFmJwkoxUzb1FuLghddvrgKdHE
 2MbA.DLvQdTL6yzNE.0pD9hKhikqAhDELuAORxdmVTp5qntukSNpo7n7pbVcRW2h.Z5EHRQvgUIi
 NPwXixZzHdPveUCUhOIVVc8mI_6_HOawb0NHBzVDk_CLUWei9z3ESxnD3S7UBtFPyaz8Wz1QYEj3
 E0u_9GMgeSWtwUwNOyBUdhMsXc8LeisDlE4yL17PlEsg36Qven3o4jmIJnYIeNXSwTfOain7PL1T
 iUf7Pp4bLV1KCaCLyK1MN7QxJIrHeqlonrGfaIDEazIlemZpipdhKYlSWUscQhb9m4XXw3EQSyuk
 yTvyS8IH6DZBvAfKMmCljY7c.KbRW2Sdki6QfQUr8f38Jv18lSopydKLlnS6q00I5ekNtTVEXgDF
 rTCDWwpW2LDBuO8j6zGT67x2hyAi7W4Bb4shuQGaguwsgdP87V16GgD0Hl1qEtO2rD1YlmVZil78
 LWo9GRIvCn3oMVY4POzPyw1USZDD9JaWk6udin5BZnYMwxPJPhHkXgbbkvI9MzFtmhMZwmqlTeMu
 Ev1Sai9gC6Pb7Hro2s3wExNQhdrgFfXW6UHu9x5OvTSugn6m1LpwCgh4n5xcKLbiuVg7RNECiqx8
 Du2pwChuERr7LcRhFqJCUv3pfjBfIH_35G6ldnALqumOpF_.156defXOwXOJ_z3bKq7AqKupFTiN
 chFL.9cSIWDN7fiY9ti3OznWSWk6J2i7tHJJiwrScf.843GUJr1oRlLpKsIU0Lxkg2kvnnp2.435
 IG9iRVjf2WB7qhuQwZaKM7mVgtpakUZ68dVE-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Wed, 29 Jan 2020 22:43:09 +0000
Date: Wed, 29 Jan 2020 22:43:07 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <39893674.1202836.1580337787157@mail.yahoo.com>
In-Reply-To: <20200128101257.GJ57924@desktop-tdan49n.eng.citrite.net>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
 <20200124102932.GF57924@desktop-tdan49n.eng.citrite.net>
 <299023995.1231830.1580157801838@mail.yahoo.com>
 <20200128101257.GJ57924@desktop-tdan49n.eng.citrite.net>
MIME-Version: 1.0
X-Mailer: WebService/1.1.15113 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Subject: Re: [Xen-devel] HVM Driver Domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ID4gQlRXLCBhcmUgeW91IGNyZWF0aW5nIHRoZSBkcml2ZXIgZG9tYWluIHdpdGggJ2RyaXZlcl9k
b21haW49MScgaW4gdGhlIHhsIGNvbmZpZyBmaWxlPwoKTm8sIEkgd2Fzbid0IGF3YXJlIG9mIHRo
ZSAnZHJpdmVyX2RvbWFpbicgY29uZmlndXJhdGlvbiBvcHRpb24gYmVmb3JlLCBhbmQgdGhpcyBp
cyB3aGF0IEkgd2FzIG1pc3NpbmcuIFdpdGggdGhpcyBjb25maWd1cmF0aW9uIG9wdGlvbiwgSSB3
YXMgYWJsZSB0byBtYWtlIHRoZSBIVk0gZHJpdmVyIGRvbWFpbiB3b3JrLiBIb3dldmVyLCB0aGUg
UFYgZHJpdmVyIGRvbWFpbiB3b3JrZWQgZmluZSB3aXRob3V0IHRoaXMgb3B0aW9uIGNvbmZpZ3Vy
ZWQuCgo+IEFyZSB5b3Ugc3VyZSB0aGlzIGNvbW1hbmQgaXMgcnVuIG9uIHRoZSBkcml2ZXIgZG9t
YWluPwoKU2luY2UgSSBoYWQgaW5zdGFsbGVkIHhlbi11dGlscyBpbiB0aGUgZHJpdmVyIGRvbWFp
biBmb3IgdGhlIGJyaWRnZSB0byB3b3JrLCBpdCBpbnN0YWxsZWQgWGVuIGh5cGVydmlzb3IgaW4g
dGhlIGRyaXZlciBkb21haW4uIEFzIGEgcmVzdWx0LCBteSBkcml2ZXIgZG9tYWluIGJlY2FtZSBh
bm90aGVyIERvbTAuIFJlYWxpemluZyB0aGF0IEkgcmFuIHJlZ3VsYXIgVWJ1bnR1IGluIHRoZSBk
cml2ZXIgZG9tYWluLiBUaGlzIHdhcyBhbm90aGVyIGtleSBwb2ludCB0byBtYWtlIHRoZSBkcml2
ZXIgZG9tYWluIHdvcmsuCgpUaGFua3MgZm9yIGFsbCB5b3VyIGhlbHAsIHdoaWNoIG1hZGUgaXQg
cG9zc2libGUgZm9yIG1lIHRvIHRlc3QgdGhlIEhWTSBkcml2ZXIgZG9tYWluLgoKT25lIGxhc3Qg
dGhpbmcsIGJhY2tlbmQgaW50ZXJmYWNlcyBhcmUgbm90IGJlaW5nIGFkZGVkIHRvIHRoZSBicmlk
Z2UgYXV0b21hdGljYWxseS7CoCBEbyB5b3UgdGhpbmsgaXQgaXMgYmVjYXVzZSByZWd1bGFyIFVi
dW50dSBkb2Vzbid0IGhhdmUgWGVuIHZpZiBzY3JpcHRzPyBJZiB5ZXMsIHdoYXQgaXMgdGhlIHBy
b3BlciB0aGluZyB0byBkbyBpbiB0aGlzIGNhc2U/CgpQbGVhc2UgbGV0IG1lIGtub3cuCgpUaGFu
a3MsCk1laHJhYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
