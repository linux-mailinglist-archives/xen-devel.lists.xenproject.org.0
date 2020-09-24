Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB72277846
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 20:09:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLVg1-0000tB-Nd; Thu, 24 Sep 2020 18:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eJTG=DB=epam.com=prvs=753602e6e8=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kLVfz-0000t4-Ul
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 18:09:04 +0000
X-Inumbo-ID: 663684a6-5d79-4a89-ba22-c14db63a3362
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 663684a6-5d79-4a89-ba22-c14db63a3362;
 Thu, 24 Sep 2020 18:09:02 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08OI0E7x006910; Thu, 24 Sep 2020 18:08:59 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 33rnr627ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 18:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKE0NJqgUU8txTM8vZZvZqVMv5wfitipWcrM/Ep5RWOXZmZERAzV4spK7DjpM49hQeqZZsiFrswpR3LvYq6PyLQR1CSBIHPjcmvBS10g/rJ9kjGnrcKXyv17xKZhbP75ArqvOiMzPU2BgH35B9JUEGQiPYEPgvzpZOnSk8nNNnD1QndC0FgziiZYzIPr0XJ2zUo8D79npEPziY6mytzBt82gyIXnfuUQP2s721JQxbrHliWvKFDmax99q/F6FRgd+arshcU91DLDWzQPjn2ToDlXVqFzK37LV/E7JL0mdRKx3EUlko1ceeeJpy/j0JSACxEiYYJai61aUNXM+CKdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4R7a22yPqxkI/V9egN1uWkasVs1HzvAmUlEzZrgXVI=;
 b=RNFFjSIIcrO1mIqfC0Dtq1pKAgAOm+PV+f2STAgzfpEremdpZZztGc4LP60Mji/UROP5XZgmT3KoYjKy/Y28TA9F40bK7ur4f0Xwo1pZQIBDcuAu5/lFns8isBbzbUhA0yFgyAIUaPXZpIvgFQ8P4LIWj5zHSwagp8/wj1JOh72CHzR1jSIIDO5qvt3UsynoxUzJYcHONNTAbyp4etCjfBL/ne+7lOGpz/p3DhSl2I1FEp3J2zdBKCKFEVqNA5vfrtfe/OVJL4ly1FnUYEezfRZwN+wta3o9aAybpZS0ITh9bqxVIAei2QZ3CzxpMp5oRRYL1858bH8FfTmzdqkHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4R7a22yPqxkI/V9egN1uWkasVs1HzvAmUlEzZrgXVI=;
 b=t0SZobuEWbhOp8DsQseinO8DU/KdsRb95j5gzeCOe+vMVw5iQF/TUyaVq0EiYYa8qEYWOa3dLc/5shA1QfwUGUNbSYXe2TQ4QRtPHW3fY7Y2b58apiNNMxYb5JaT6DkmIovEc2Io1Pibu2dJsYRPaYCIol3ecaTN47yWLgYxEEHbguEPmwUXaOZSPL3513HGML9l+pVzEN4iKMiqty0hbMRpEF28FajMbVWtCC6la+ryxFYQfsQMC+wBXc+igTYfDVEZ4XwwDUr1XWLfxnUm8N34gwdqCC+Vt/Bcfg3aA+JwEZmUmuKNsVKgZApsAEfLH5kXANiJkoIaLyR/RpX+Ow==
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB3007.eurprd03.prod.outlook.com (2603:10a6:802:3a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 18:08:56 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0%4]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 18:08:56 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Topic: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Index: AQHWQE+SUtF98x/3akmRxwBff1s+m6jUZ0iAgABx6YCAAALVgICj3sIA
Date: Thu, 24 Sep 2020 18:08:55 +0000
Message-ID: <87d02bavz7.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
 <daf3aa1c6fa565076755437e7e74347b58e3a9b6.camel@epam.com>
 <918fa2e1-232c-a3ff-d0a9-776b470ee5db@suse.com>
In-Reply-To: <918fa2e1-232c-a3ff-d0a9-776b470ee5db@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 086be1df-9ee4-4b61-2722-08d860b4e712
x-ms-traffictypediagnostic: VI1PR03MB3007:
x-microsoft-antispam-prvs: <VI1PR03MB30079179BD07EBB12F265C91E6390@VI1PR03MB3007.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UnAyu9D6++xLQbMCX8kY8o6pjli6Rm2UxTpIjhdjSiJM0gokUWxL1pDHSl8SccQPQIH3BhE544qqhizdQ/Ew4Pe54ESL0UlSGallHuPmUQkOOALjZ+UqZod/NUf3uHRbBfgnlG6+fmN7q+fXhcsc/fV4uoPZZ9LN9/x5bgtwhikwD1zZXxMaW7ShB/5Bqfws2D21A+hHMQB+Ttfahv9sDvaaEH2Oiogmu06V+3w7B70wKXbm6/jujEjyFNIPDAkPpaGxZVtdEi2y0jyYfNmIrbXfFc+NdXZUDnKIQ8T7IHeucrGrWfsDebHW9fkv+rr3rJIr0Urv1ImrnzXMRt2QK6wPDuUkrEon6B8cPFzHrMR4hCcOSIa7p8c9JP/IfVeR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB6400.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(6916009)(66556008)(71200400001)(316002)(7416002)(76116006)(66946007)(91956017)(36756003)(6512007)(8936002)(186003)(4326008)(64756008)(66476007)(8676002)(2906002)(54906003)(6486002)(55236004)(2616005)(5660300002)(86362001)(83380400001)(66446008)(53546011)(26005)(66574015)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: n16TJS6r4YiEEIYDzqNHUGLktxvfA2bvJXrAWOH61cjwbXsCX5gcM/OdUPUp4l7/SJTFV/EhLp4OIHiGo63ZfwuKaQ9nIoFsrJDJNtfrXIKV0TmR4Rs9Rfzz8tJPUU3DlP3Qdrdw9VwK01ker1TEoK4mXdm1TZj9j01CgKVO+8XVUxkcsnzqPBU6TJUa4MRT8fnY+LaGVcQvXI/yNqxeECxtYiqdczO95y1XuZXwQTmHosapvZuUotRLoHywSHcW4+boRkO5uw2zoGaOXBt5lucJoD/7mpg6uzJAcQIf2L2geZFApfAObI+uX8OGIXWkhLE2GT/RiyLWgShhcPnFbRcSPC4M18TJjz+G/cB9lnpAQ/XDR/wg4OQzb6IwWewWy5+unNhH61zkdd+EgVWqqDNKHU2wwl+8sNjQ7VbK2VByKuOYSQNxZZMYfgc6NFz7YDYzga33ygo+u3K+O8qPSUs/MtkPdAH0N0q8cZpaVwkbczH7WiBMj2YnSHi76XL7oqvgHl3H31u23pWrOZf6XR+gV/2rWuDhj4FI2OY8k0mG7nYDk/MtdTh36kOa+8z/7HL0BpeowXEjm+5UqxRmGft+fla6XY9vxNdNOyOarw28CW45Qkxs7P6wcv7PTT6BfqGX/BRa88dzwQr8YqPuyQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E37DC9C86EF47246A5F14417300904FC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086be1df-9ee4-4b61-2722-08d860b4e712
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 18:08:55.8169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Vz1ojLdv66BYUPqKYcTGL1sTMegTcFW/sqGkeb7o5+0Vc1N6eUeR9JLddm/B0K++NKMJOfUasqxoIitKkyhoxlstNgiMUaTg653AWbuDlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_11:2020-09-24,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240132
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpIZWxsbyBKw7xyZ2VuLA0KDQpKw7xyZ2VuIEdyb8OfIHdyaXRlczoNCg0KPiBPbiAxMi4wNi4y
MCAxMzozMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiBPbiBGcmksIDIwMjAtMDYtMTIg
YXQgMDY6NDMgKzAyMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4gT24gMTIuMDYuMjAgMDI6
MjIsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KDQpbLi4uXQ0KPj4+PiArICAgIGRlbHRhID0g
Tk9XKCkgLSB2LT5oeXBfZW50cnlfdGltZTsNCj4+Pj4gKyAgICBhdG9taWNfYWRkKGRlbHRhLCAm
di0+c2NoZWRfdW5pdC0+aHlwX3RpbWUpOw0KPj4+PiArDQo+Pj4+ICsjaWZuZGVmIE5ERUJVRw0K
Pj4+PiArICAgIHYtPmluX2h5cF90YXNrID0gZmFsc2U7DQo+Pj4+ICsjZW5kaWYNCj4+Pj4gK30N
Cj4+Pj4gKw0KPj4+PiAgICAvKg0KPj4+PiAgICAgKiBEbyB0aGUgYWN0dWFsIG1vdmVtZW50IG9m
IGFuIHVuaXQgZnJvbSBvbGQgdG8gbmV3IENQVS4gTG9ja3MgZm9yICpib3RoKg0KPj4+PiAgICAg
KiBDUFVzIG5lZWRzIHRvIGhhdmUgYmVlbiB0YWtlbiBhbHJlYWR5IHdoZW4gY2FsbGluZyB0aGlz
IQ0KPj4+PiBAQCAtMjYxNSw2ICsyNjQ2LDcgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkN
Cj4+Pj4gICAgICAgICAgIFNDSEVEX1NUQVRfQ1JBTksoc2NoZWRfcnVuKTsNCj4+Pj4gICAgKyAg
ICB2Y3B1X2VuZF9oeXBfdGFzayhjdXJyZW50KTsNCj4+Pj4gICAgICAgIHJjdV9yZWFkX2xvY2so
JnNjaGVkX3Jlc19yY3Vsb2NrKTsNCj4+Pj4gICAgICAgICAgIGxvY2sgPSBwY3B1X3NjaGVkdWxl
X2xvY2tfaXJxKGNwdSk7DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NvZnRpcnEuYyBi
L3hlbi9jb21tb24vc29mdGlycS5jDQo+Pj4+IGluZGV4IDA2M2U5M2NiZTMuLjAzYTI5Mzg0ZDEg
MTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc29mdGlycS5jDQo+Pj4+ICsrKyBiL3hlbi9j
b21tb24vc29mdGlycS5jDQo+Pj4+IEBAIC03MSw3ICs3MSw5IEBAIHZvaWQgcHJvY2Vzc19wZW5k
aW5nX3NvZnRpcnFzKHZvaWQpDQo+Pj4+ICAgIHZvaWQgZG9fc29mdGlycSh2b2lkKQ0KPj4+PiAg
ICB7DQo+Pj4+ICAgICAgICBBU1NFUlRfTk9UX0lOX0FUT01JQygpOw0KPj4+PiArICAgIHZjcHVf
YmVnaW5faHlwX3Rhc2soY3VycmVudCk7DQo+Pj4+ICAgICAgICBfX2RvX3NvZnRpcnEoMCk7DQo+
Pj4+ICsgICAgdmNwdV9lbmRfaHlwX3Rhc2soY3VycmVudCk7DQo+Pj4NCj4+PiBUaGlzIHdvbid0
IHdvcmsgZm9yIHNjaGVkdWxpbmcuIGN1cnJlbnQgd2lsbCBlaXRoZXIgaGF2ZSBjaGFuZ2VkLA0K
Pj4+IG9yIGluIHg4NiBjYXNlIF9fZG9fc29mdGlycSgpIG1pZ2h0IGp1c3Qgbm90IHJldHVybi4g
WW91IG5lZWQgdG8NCj4+PiBoYW5kbGUgdGhhdCBjYXNlIGV4cGxpY2l0bHkgaW4gc2NoZWR1bGUo
KSAoeW91IGRpZCB0aGF0IGZvciB0aGUNCj4+PiBvbGQgdmNwdSwgYnV0IGZvciB0aGUgY2FzZSBz
Y2hlZHVsZSgpIGlzIHJldHVybmluZyB5b3UgbmVlZCB0bw0KPj4+IGNhbGwgdmNwdV9iZWdpbl9o
eXBfdGFzayhjdXJyZW50KSB0aGVyZSkuDQo+Pj4NCj4+IFdlbGwsIHRoaXMgaXMgb25lIG9mIHF1
ZXN0aW9ucywgSSB3YW50ZWQgdG8gZGlzY3Vzcy4gSSBjZXJ0YWlubHkNCj4+IG5lZWQNCj4+IHRv
IGNhbGwgdmNwdV9iZWdpbl9oeXBfdGFzayhjdXJyZW50KSBhZnRlciBjb250ZXh0IHN3aXRjaC4g
QnV0IHdoYXQgaXQNCj4+IGlzIHRoZSByaWdodCBwbGFjZT8gSWYgbXkgdW5kZXJzdGFuaW5nIGlz
IHJpZ2h0LCBjb2RlIG9uIHg4NiBwbGF0Zm9ybQ0KPj4gd2lsbCBuZXZlciByZWFjaCB0aGlzIHBv
aW50LiBPciBJJ20gd3JvbmcgdGhlcmU/DQo+DQo+IE5vLCB0aGlzIGlzIGNvcnJlY3QuDQo+DQo+
IFlvdSBjYW4gYWRkIHRoZSBjYWxsIHRvIGNvbnRleHRfc3dpdGNoKCkganVzdCBhZnRlciBzZXRf
Y3VycmVudCgpIGhhcw0KPiBiZWVuIGNhbGxlZC4NCg0KTG9va3MgbGlrZSBJJ20gbWlzc2luZyBz
b21ldGhpbmcgdGhlcmUuIElmIEkgZ2V0IHRoaXMgcmlnaHQsIGNvZGUgeW91DQptZW50aW9uZWQg
aXMgZXhlY3V0ZWQgcmlnaHQgYmVmb3JlIGxlYXZpbmcgaHlwZXJ2aXNvci4NCg0KU28sIGFzIEkg
c2VlIHRoaXMsIGZ1bmN0aW9ucyBhcmUgY2FsbGVkIGluIHRoZSBmb2xsb3dpbmcgd2F5IChvbiB4
ODYpOg0KDQoxLiBkb19zb2Z0aXJxKCkgY2FsbHMgdmNwdV9iZWdpbl9oeXBfdGFzaygpIGFuZCB0
aGVuIGV4ZWN1dGVzDQpfX2RvX3NvZnRpcnEoKQ0KDQoyLiBfX2RvX3NvZnRpcnEoKSBkb2VzIGRp
ZmZlcmVudCBqb2JzIGFuZCBldmVudHVhbGx5IGNhbGxzIHNjaGVkdWxlKCkNCg0KMy4gc2NoZWR1
bGUoKSBjYWxscyB2Y3B1X2VuZF9oeXBfdGFzaygpIGFuZCBtYWtlcyBzY2hlZHVsaW5nIGRlY2lz
aW9uDQp3aGljaCBsZWFkcyB0byBjYWxsIHRvIGNvbnRleHRfc3dpdGNoKCkNCg0KNC4gT24gZW5k
IGNvbnRleHRfc3dpdGNoKCkgd2Ugd2lsbCBleGl0IGh5cGVydmlzb3IgYW5kIGVudGVyIFZNLiBB
dA0KbGVhc3QsIHRoaXMgaXMgaG93IEkgdW5kZXJzdGFuZA0KDQogICAgICAgbmV4dGQtPmFyY2gu
Y3R4dF9zd2l0Y2gtPnRhaWwobmV4dCk7DQoNCmNhbGwuDQoNClNvLCBubyBuZWVkIHRvIGNhbGwg
dmNwdV9iZWdpbl9oeXBfdGFzaygpIGluIGNvbnRleHRfc3dpdGNoKCkgZm9yIHg4Ni4NCg0KT24g
QVJNLCB0aGlzIGlzIGRpZmZlcmVudCBzdG9yeS4gVGhlcmUsIEkgYW0gY2FsbGluZw0KdmNwdV9i
ZWdpbl9oeXBfdGFzaygpIGFmdGVyIHNldF9jdXJyZW50KCkgYmVjYXVzZSBBUk0gY29kZSB3aWxs
DQpldmVudHVhbGx5IHJldHVybiB0byBkb19zb2Z0aXJxKCkgYW5kIHRoZXJlIHdpbGwgYmUgY2Fs
bGVkIGNvcnJlc3BvbmRpbmcNCnZjcHVfZW5kX2h5cF90YXNrKCkuDQoNCkkgaGF2ZSBwdXQgYnVu
Y2ggb2YgQVNTRVJUcyB0byBlbnN1cmUgdGhhdCB2Y3B1X2JlZ2luX2h5cF90YXNrKCkgb3INCnZj
cHVfZW5kX2h5cF90YXNrKCkgYXJlIG5vdCBjYWxsZWQgdHdpY2UgYW5kIHRoYXQgdmNwdV9lbmRf
aHlwX3Rhc2soKSBpcw0KY2FsbGVkIGFmdGVyIHZjcHVfYmVnaW5faHlwX3Rhc2soKS4gVGhvc2Ug
YXNzZXJ0cyBhcmUgbm90IGZhaWxpbmcsIHNvIEkNCmFzc3VtZSB0aGF0IEkgZGlkIGFsbCB0aGlz
IGluIHRoZSByaWdodCB3YXkgOikNCg0KLS0gDQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFN

