Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3A2B15EF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 07:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26222.54425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdSuj-000820-J0; Fri, 13 Nov 2020 06:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26222.54425; Fri, 13 Nov 2020 06:50:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdSuj-00081b-FQ; Fri, 13 Nov 2020 06:50:29 +0000
Received: by outflank-mailman (input) for mailman id 26222;
 Fri, 13 Nov 2020 06:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdSui-00081W-8T
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 06:50:28 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fef7622-1573-4f35-9535-c1b4660f245c;
 Fri, 13 Nov 2020 06:50:27 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD6o8Il017185; Fri, 13 Nov 2020 06:50:21 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80p88y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 06:50:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 06:50:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 06:50:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdSui-00081W-8T
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 06:50:28 +0000
X-Inumbo-ID: 1fef7622-1573-4f35-9535-c1b4660f245c
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1fef7622-1573-4f35-9535-c1b4660f245c;
	Fri, 13 Nov 2020 06:50:27 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AD6o8Il017185;
	Fri, 13 Nov 2020 06:50:21 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80p88y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 06:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwA+V55PlRh2rNPqzpQe+43G/Vwk8kZAeF4+y5UnPtqy+i/o8memuf09v3Q4hah2mAkAA3o5qfenklvwmLhD3yp+nSNFdKN3d8CnQSYyZ1Jd0XASQkLTI9n3NvY/oaMBgyFw62DazD68FZww8H3IoIjZMZZ4vOaNJsJafotJJfDfzag0MM0ijwZ7O9aQ5KkyZQ0TYYxKQJ5FaOkWRA6tqzJBhxRGrTULXh4SVOVbEdDwvRrbd0NQxESjjpPgACkAjpHRZYXEVx3Azpdr0nVAp66WvFJejFHwwb50uFsqSS4TeVCQfljAeNuy77Jq3SgtW67Ozc58L/0tup/4RsaKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nALvFPR8B4d8Ubr7h2k4RBjlh2sdoAQ43oBFYpF56eM=;
 b=LZvBO6GyF+nkNbknmxg7g0tOgNx3MMRURwuMAbN9zIRqVEyplhr+Gc4pFpXa2qnhFfn4wvEOPGBWUQ7BZZKMwk2V+l9htnovpwqglQg3tKAVHRk2XHF3XL0RL5+/xpN0VbcWB7wYnVKGmhrhDpZm6pj5lkZls0rgJ5h9vBwS0MhJkS81n2Zg9lx/f/YywVBhxaw/bayZVg6mRWSpUG6cBbumPY94UEfx1bB8BvteZerCu0uiRiMESYSQm0un/uSUbGsv9MH6UHr4/Qk9t9mZfgOItOKnfz56Rp0xQ5wU9ZTJf6CAol+elzXi/V8CemAFcPRB4XgHDkAxlfkgpfeoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nALvFPR8B4d8Ubr7h2k4RBjlh2sdoAQ43oBFYpF56eM=;
 b=Og+3ft2EJpIFE1V8DLQ9DXm9OnGF5dSS8bqsa1V9DMEUWDDUsSf8M2RFY2pDV6dhfbF2Yu/f2eB0M+Lq0llaNqVE3WHLiyxOEt9U8jpTOcm3jy4iKLK+mWBBn4GnRVsLeYzir7r1NPg0Ht/pAU67eWCWcLoGHy4UqFRWT3qxdhWbW4kY3ZSaPwty/CPH1p5O/KwtfJtoDXJnn4CbbgLnkN8+wGU2UMidfoSAnVuZKJ1zRMfZEcIe/cZvZ3Sp6XZROth/Qw95HrGlWOftbNkSptFSeIxY+IElQDJaB5pp5NUQowwmvnNpy4tSyS7WRHUfDOqIpOfqIeZnvbQmAhv7sQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 06:50:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 06:50:18 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <andr2000@gmail.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 09/10] vpci/rcar: Implement vPCI.update_bar_header
 callback
Thread-Topic: [PATCH 09/10] vpci/rcar: Implement vPCI.update_bar_header
 callback
Thread-Index: AQHWtpbzTvJ5qBS+Xk6vR5/qsR0EDanESDwAgAFdFAA=
Date: Fri, 13 Nov 2020 06:50:18 +0000
Message-ID: <6f6f239a-a568-baed-5e40-aec39c6b8c2c@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-10-andr2000@gmail.com>
 <20201112100054.z46hjf2qzcag6sv7@Air-de-Roger>
In-Reply-To: <20201112100054.z46hjf2qzcag6sv7@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 460a6367-0608-4124-d491-08d887a06269
x-ms-traffictypediagnostic: AM4PR0301MB2195:
x-microsoft-antispam-prvs: 
 <AM4PR0301MB2195B04A58188B02DDDE7371E7E60@AM4PR0301MB2195.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YSpD3Gu6dGHsbkkzal4Q66/7n4MFsLKkSNLIuMiZ9nBo7acNYU+l3oRnmfy8H5A9bCbwmyFf+amZUuqOuDR4HVICc3PXgV/tR+qFDa1wW3dOdVaKEQQXmoOSZxqDbc3hppCge8oKwnuF3pwi1UEWKDYN2UFtu9EN2BhkYH0GFEaTBzmxPcbKeO6nRcD0DXDvbEnndZN4lVlKdL+Fgzc/kLXXixsvFuHH5xKgaJwFuXx3aLaCRhB/p5Gpr2YJUcvtYElXOh0PGl65FcmWgO59gH8EfpkjIk7dEd5oHslble4NLGYQNg7bbsU8hDBQe0tPs1zWiSRD1mPXouGxu4u+2Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(26005)(5660300002)(31686004)(64756008)(66446008)(316002)(66556008)(66946007)(31696002)(8676002)(2616005)(4326008)(71200400001)(66476007)(6512007)(8936002)(2906002)(15650500001)(7416002)(54906003)(36756003)(110136005)(478600001)(86362001)(53546011)(186003)(83380400001)(6486002)(6506007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 y/H0yJ9zBwjnXWlVYtMybDT6oFyMlFccRKpiaOUrrkidBO5Z/HJlIPnDusBMWQRTEEygZ+o8DwAC0grpFKKlrESyA4ewdtR9shiTdKo26uEr1dG25wnCexyjXMi9i59TaswxzS2dAaIUhboPY/FLbYi9/HHKmIPFt5n7tJC8BWw8fxLgOq3/HzOzfu669IdBNVn5gyCpKcMgVX8VWp/fR2EHINSbdLTHVz/9LyetxGbBX3k1D4TXtmU2ZZ2bfiv5dcIRyacX0hJljl3A8qSw12j1l/VQFKMziqNDdWonuF7iQBbD0HcZ1aCiKZlPRZqyLRByl+RRk+CG+6AXC+FGwb4mR4YH8xIRzH7iZT66S7Hoc4Yia6a8y7HWg+Pe0tJLcqJBhuUBD60cHCh/Og4zoevfjD7VSIWF3CgP12kE0l37XSnavTyrvC+w1pLheTLa3IYjPhObT6PmZTKC5sPL87oXDs/UVLlXGQxu9Cm8E/6cvp3trRFRU+Wk7zspl8TnvFAR5LZWTYk0ul6uCZGJJgn6N0iN02faS9LKzXogVsbEUSTnlieIWQQrr45qKf76LNPBuW/dHIak6HZvz8V6l/o/O4Otcu29BURIoito2XWbswiayhStFln6EqviIbInS56zgR7g/0VvX8vLdpi1DA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E21103095C06DF40A921F5D91F2C5487@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460a6367-0608-4124-d491-08d887a06269
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 06:50:18.8047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n20/NDtuqoKUJDBCdxeUFgnCrcnIHbD/iWoXWKxJGTLghJpaag4+/ShCNVMnD+5TxdU6Qj0chg9lpznBmLfmeMu0LcUfrdc9vCZhw15oHJiE6h/reKUfxYhN6Wqz3vz4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2195
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_05:2020-11-12,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011130038

DQpPbiAxMS8xMi8yMCAxMjowMCBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9u
LCBOb3YgMDksIDIwMjAgYXQgMDI6NTA6MzBQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVXBkYXRlIGhhcmR3YXJlIGRvbWFpbidzIEJB
UiBoZWFkZXIgYXMgUi1DYXIgR2VuMyBpcyBhIG5vbi1FQ0FNIGhvc3QNCj4+IGNvbnRyb2xsZXIs
IHNvIHZQQ0kgTU1JTyBoYW5kbGVycyBkbyBub3Qgd29yayBmb3IgaXQgaW4gaHdkb20uDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL2FybS9wY2kvcGNpLWhv
c3QtcmNhci1nZW4zLmMgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3BjaS9wY2ktaG9zdC1yY2FyLWdlbjMuYyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhv
c3QtcmNhci1nZW4zLmMNCj4+IGluZGV4IGVjMTRiYjI5YTM4Yi4uMzUzYWMyYmZkNmU2IDEwMDY0
NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1yY2FyLWdlbjMuYw0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1yY2FyLWdlbjMuYw0KPj4gQEAgLTIzLDYgKzIz
LDcgQEANCj4+ICAgI2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4+ICAgI2luY2x1ZGUgPGFzbS9wY2ku
aD4NCj4+ICAgI2luY2x1ZGUgPHhlbi92bWFwLmg+DQo+PiArI2luY2x1ZGUgPHhlbi92cGNpLmg+
DQo+PiAgIA0KPj4gICAvKiBFcnJvciB2YWx1ZXMgdGhhdCBtYXkgYmUgcmV0dXJuZWQgYnkgUENJ
IGZ1bmN0aW9ucyAqLw0KPj4gICAjZGVmaW5lIFBDSUJJT1NfU1VDQ0VTU0ZVTAkJMHgwMA0KPj4g
QEAgLTMwNywxMiArMzA4LDgwIEBAIGludCBwY2lfcmNhcl9nZW4zX2NvbmZpZ193cml0ZShzdHJ1
Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsIHVpbnQzMl90IF9zYmRmLA0KPj4gICAgICAgcmV0
dXJuIHJldDsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgdm9pZCBwY2lfcmNhcl9nZW4zX2h3
YmFyX2luaXQoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2cGNpX2hlYWRlciAqaGVhZGVyKQ0KPj4gKw0K
Pj4gK3sNCj4+ICsgICAgc3RhdGljIGJvb2wgb25jZSA9IHRydWU7DQo+PiArICAgIHN0cnVjdCB2
cGNpX2JhciAqYmFycyA9IGhlYWRlci0+YmFyczsNCj4+ICsgICAgdW5zaWduZWQgaW50IG51bV9i
YXJzOw0KPj4gKyAgICBpbnQgaTsNCj4gdW5zaWduZWQuDQpvaw0KPg0KPj4gKw0KPj4gKyAgICAv
KiBSdW4gb25seSBvbmNlLiAqLw0KPj4gKyAgICBpZiAoIW9uY2UpDQo+IE1pc3Npbmcgc3BhY2Vz
Lg0Kb2sNCj4NCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgb25jZSA9IGZhbHNlOw0KPj4g
Kw0KPj4gKyAgICBwcmludGsoIlxuXG4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICVzIC0tLS0t
LS0tLS0tLS0tLS0tLS1cbiIsIF9fZnVuY19fKTsNCj4+ICsgICAgc3dpdGNoICggcGNpX2NvbmZf
cmVhZDgocGRldi0+c2JkZiwgUENJX0hFQURFUl9UWVBFKSAmIDB4N2YgKQ0KPj4gKyAgICB7DQo+
PiArICAgIGNhc2UgUENJX0hFQURFUl9UWVBFX05PUk1BTDoNCj4+ICsgICAgICAgIG51bV9iYXJz
ID0gUENJX0hFQURFUl9OT1JNQUxfTlJfQkFSUzsNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKw0K
Pj4gKyAgICBjYXNlIFBDSV9IRUFERVJfVFlQRV9CUklER0U6DQo+PiArICAgICAgICBudW1fYmFy
cyA9IFBDSV9IRUFERVJfQlJJREdFX05SX0JBUlM7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsN
Cj4+ICsgICAgZGVmYXVsdDoNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0K
Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG51bV9iYXJzOyBpKysgKQ0KPj4gKyAgICB7DQo+PiAr
ICAgICAgICB1aW50OF90IHJlZyA9IFBDSV9CQVNFX0FERFJFU1NfMCArIGkgKiA0Ow0KPj4gKw0K
Pj4gKyAgICAgICAgaWYgKCBiYXJzW2ldLnR5cGUgPT0gVlBDSV9CQVJfTUVNNjRfSEkgKQ0KPj4g
KyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIC8qDQo+PiArICAgICAgICAgICAgICogU2tpcCBo
aSBwYXJ0IG9mIHRoZSA2NC1iaXQgcmVnaXN0ZXI6IGl0IGlzIHJlYWQNCj4+ICsgICAgICAgICAg
ICAgKiB0b2dldGhlciB3aXRoIHRoZSBsb3dlciBwYXJ0Lg0KPj4gKyAgICAgICAgICAgICAqLw0K
Pj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAg
ICAgaWYgKCBiYXJzW2ldLnR5cGUgPT0gVlBDSV9CQVJfSU8gKQ0KPj4gKyAgICAgICAgew0KPj4g
KyAgICAgICAgICAgIC8qIFNraXAgSU8uICovDQo+PiArICAgICAgICAgICAgY29udGludWU7DQo+
PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICBpZiAoIGJhcnNbaV0udHlwZSA9PSBWUENJ
X0JBUl9NRU02NF9MTyApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgLyogUmVhZCBi
b3RoIGhpIGFuZCBsbyBwYXJ0cyBvZiB0aGUgNjQtYml0IEJBUi4gKi8NCj4+ICsgICAgICAgICAg
ICBiYXJzW2ldLmFkZHIgPQ0KPj4gKyAgICAgICAgICAgICAgICAodWludDY0X3QpcGNpX2NvbmZf
cmVhZDMyKHBkZXYtPnNiZGYsIHJlZyArIDQpIDw8IDMyIHwNCj4+ICsgICAgICAgICAgICAgICAg
cGNpX2NvbmZfcmVhZDMyKHBkZXYtPnNiZGYsIHJlZyk7DQo+PiArICAgICAgICB9DQo+PiArICAg
ICAgICBlbHNlIGlmICggYmFyc1tpXS50eXBlID09IFZQQ0lfQkFSX01FTTMyICkNCj4+ICsgICAg
ICAgIHsNCj4+ICsgICAgICAgICAgICBiYXJzW2ldLmFkZHIgPSBwY2lfY29uZl9yZWFkMzIocGRl
di0+c2JkZiwgcmVnKTsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAg
ICAgIHsNCj4+ICsgICAgICAgICAgICAvKiBFeHBhbnNpb24gUk9NPyAqLw0KPj4gKyAgICAgICAg
ICAgIGNvbnRpbnVlOw0KPj4gKyAgICAgICAgfQ0KPiBXb3VsZG4ndCB0aGlzIGJlIG11Y2ggc2lt
cGxlciBhczoNClllcywgc2VlbXMgdG8gYmUgc2ltcGxlciwgdGhhbmsgeW91DQo+DQo+IGJhcnNb
aV0uYWRkciA9IDA7DQo+IHN3aXRjaCAoIGJhcnNbaV0udHlwZSApDQo+IHsNCj4gY2FzZSBWUENJ
X0JBUl9NRU02NF9ISToNCj4gICAgICBiYXJzW2ldLmFkZHIgPSAodWludDY0X3QpcGNpX2NvbmZf
cmVhZDMyKHBkZXYtPnNiZGYsIHJlZyArIDQpIDw8IDMyOw0KPiAgICAgIC8rIGZhbGx0aHJvdWdo
LiAqLw0KPiBjYXNlIFZQQ0lfQkFSX01FTTY0X0xPOg0KPiAgICAgICBiYXJzW2ldLmFkZHIgfD0g
cGNpX2NvbmZfcmVhZDMyKHBkZXYtPnNiZGYsIHJlZyk7DQo+ICAgICAgIGJyZWFrOw0KPg0KPiBk
ZWZhdWx0Og0KPiAgICAgIGJyZWFrOw0KPiB9DQo+DQo+IEkgYWxzbyB3b25kZXIgd2h5IHlvdSBv
bmx5IGNhcmUgYWJvdXQgdGhlIGFkZHJlc3MgYnV0IG5vdCB0aGUgc2l6ZSBvZg0KPiB0aGUgQkFS
Lg0KWWVzLCBzaXplIG5lZWRzIHRvIGJlIHVwZGF0ZWQgYXMgd2VsbCwgZXZlbiBmb3IgUkZDDQo+
DQo+IFRoYW5rcywgUm9nZXIuDQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

