Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF952B15EA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 07:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26208.54394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdSqv-00071v-H9; Fri, 13 Nov 2020 06:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26208.54394; Fri, 13 Nov 2020 06:46:33 +0000
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
	id 1kdSqv-00071a-Dz; Fri, 13 Nov 2020 06:46:33 +0000
Received: by outflank-mailman (input) for mailman id 26208;
 Fri, 13 Nov 2020 06:46:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdSqt-00071T-HH
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 06:46:31 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9170f29c-4b54-4311-806c-7a2b57d16a0e;
 Fri, 13 Nov 2020 06:46:30 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD6ib8f031375; Fri, 13 Nov 2020 06:46:24 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80p837-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 06:46:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2194.eurprd03.prod.outlook.com (2603:10a6:200:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Fri, 13 Nov
 2020 06:46:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 06:46:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdSqt-00071T-HH
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 06:46:31 +0000
X-Inumbo-ID: 9170f29c-4b54-4311-806c-7a2b57d16a0e
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9170f29c-4b54-4311-806c-7a2b57d16a0e;
	Fri, 13 Nov 2020 06:46:30 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AD6ib8f031375;
	Fri, 13 Nov 2020 06:46:24 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80p837-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 06:46:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYElHk+R4TeYoY6YzLS8xIstAA+HsjDH9p1bxSNI0s+Blk5t21ciSDIQG6xXuqZX9pSIj36yXFEYg1j7D1kz5dplNMGp0Pjl90AQsv1JQAcnI0WUylhhrG5b+Xavy7ra9oaV+cDXi/zpAHG+PqqWKLdQM+SJieIxnlllzFz5/F576p0u9cdHpnEMKVT2xcRl9Yu52us5Ex8c/q9kcXLmyz2BeVuQZMoMS79YnC8xPkNX6yl97ZhepF1tcsKPUiMdcV9KhNEGyI4Ui6YbN5iSVPYYYfdtiMPgdbrUgYrcQPnqTetDzzrYbCUbZ9ogqTGMt0ciiCrj6NmWddCvL1XxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40kjv/gLIKIGd/U6WL74IHsixNEKP4c9f6m8MAZkQos=;
 b=cztqLow8LE0Dpuu5JXxfeK2R94tvZ75ewvBhqXJXjbP4Qk4IytZHmlWnyL+aVcYMMwlMY065F+lNpNL1dLBhZi28L1AHjBHt9kEBzQfzfjtLAK5FqAR6q9NMshar8lWp6qiL0kCh5YFdvhk+GqBQYoa+1AZ+apZSSJ+zlEFYkp3fEHMPekDhmLSXnNCZXJyzpg8EdxbQO1C5WFoSis11C9/RAghsNpOQWr4Nk2LhwEFk/rqLtCLce3c/44ZRYkBOqIk/lOY+qshMsU5StZhjjnk9McmGlS8M874laaxORyKdtK2JcSOU0VradtfN+YbIX0gYqHVLXe03TGbWeB7ZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40kjv/gLIKIGd/U6WL74IHsixNEKP4c9f6m8MAZkQos=;
 b=2zJjAB1yhK+oQmed7oG2f+XTiIYJSWj30Fot7uUNSWuKS7hTXd/5IUvq5dKuwzgXm01VzxC2XDITBbiJAhQz6CZF0OAzv8EWqB2Fjx5hJLy6ITrV2KUcSEy3DTzlZowINFluhCBFjGpSFvmXMssCHtlke+V0sJ7iTiD4Q7PvCJTnwP3ywsVs3Uh83Hd7NRVz4SaM5AzsWEDlzVERuTws4j908dpc1JD2I85bVYda/jGshQYRLe4P4gEt5N4Q1HEmKdydCVTtqU8tApnO5i/VmdjbD5QbLKF40bZiushGlmHlCCVOJa3BpmKw3iv/gSlPUlBHhzh9X8VtfVhUVu5Xtw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2194.eurprd03.prod.outlook.com (2603:10a6:200:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Fri, 13 Nov
 2020 06:46:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 06:46:20 +0000
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
Subject: Re: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
Thread-Topic: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
Thread-Index: AQHWtpbyYHzQ7b7gKkKm7jsDdoAEE6nERvEAgAFdRAA=
Date: Fri, 13 Nov 2020 06:46:20 +0000
Message-ID: <5a793e4f-d0da-bfcf-c2e0-1229147ecd83@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-9-andr2000@gmail.com>
 <20201112095616.5ps37pm6p52zsa33@Air-de-Roger>
In-Reply-To: <20201112095616.5ps37pm6p52zsa33@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73449570-35cc-454f-8b53-08d8879fd466
x-ms-traffictypediagnostic: AM4PR0301MB2194:
x-microsoft-antispam-prvs: 
 <AM4PR0301MB219449BEFA26A71DAF7054ABE7E60@AM4PR0301MB2194.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 M00zyyJJvXixQuyez7WIzEfX725JmgIlOMmrPuUiz0AqKgyVbekg2/OHjQVsCxIYQUP/jYNX/kOeYKymBhcraxeOgy8lg5qoLi97w9X68X6Jq2gQoB8UgXU84wMxVhx6v8rkRzA8xbcGDp3bvp8w/35rVTZ8jP6u1yRQz+EkCnWPcICwOv5+raJG0iG8jFoFiXxq5kWNKWtuwuNuJr1542+0ZCbm+aP3vM5Fh0por6ecuCpuYG9TiNfrekzuBXTwn28OHOgPfwISpjQ2yEy+tGK3Z3wSet27EXsspArhrsH/KKj1mUXnj/ycJ/oqe1hK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(366004)(26005)(8676002)(186003)(76116006)(31686004)(8936002)(53546011)(2616005)(83380400001)(6506007)(66446008)(66476007)(66556008)(64756008)(66946007)(6512007)(31696002)(4326008)(2906002)(478600001)(7416002)(5660300002)(71200400001)(36756003)(110136005)(316002)(54906003)(86362001)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 N9wNkqlkEJFlXdkGP+ZmvEAB+Er4jsod2vVV2LRau4dWaLyXVXOVe3+R5uS04ycXfFy+IvUFgif9biGRczqwtUi5PGiO6CbRCkVK/SX9ixzOiB4WR3XStEGHZJwTEUXkrya576sUnaKcRBXwfMItp42/YgjOjwJl5acgSMf60tbQCU7+/6T36+XG9XawQ1JtR0ZgmEfbtje3G0O7OBR2PNkFzBqylN4iYnJ2qjl7RfEwuioL4HJx1FaNHyddOby5LAnLWLDXNnX+ItugXv5+JWVr3VAHahYuFzC7Y4w/K3hcr6BwO6fXgjOzPKVp0C1yLMHf3sZQ5ucXcZY8sZUgAmiBGSphDtKvr2OvU/MA9CxtsxV+A/36SXRo5H8hWtLSFewTJT23ybN7VkQWPo9kQs6MSed2KddsThThM/bQKvEpBmxthNMUvCFaKSXJqnNDg1IV74CdrQesmiYLi+FYVMIG2YyETatyG+6Mk9Qc0x4Z80HmfL2Nt/aE9UFCIqfLhd0yVb9aRYV+lPkYUJ7LwZO307KRIOyNmeHY6dAdJNR3DmnI97hqbG0VBTHfsUn8MOj6NMvPUwjNtqzMq/gtkHgn+9lIfO/FpTsIVEpeEbokE50pAGHr7YTWRjo4X+8DEbkVrzNPrA/bdSGxPsVDBg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED04D1970EF0F148AA1857C280E4DE5E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73449570-35cc-454f-8b53-08d8879fd466
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 06:46:20.4790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nd6+GEkH4zZXGCUXdl23pTpz3O5y7So/4+2b/gkEZzRtn0TMTYkaB9H66g0D5hBpMmq/a98Z49cXu5uE9j5rpVRWn+nhksEoEa4SpStAw/ZZX/f4J3uempiVsP3/xm18
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2194
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_04:2020-11-12,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011130037

DQpPbiAxMS8xMi8yMCAxMTo1NiBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9u
LCBOb3YgMDksIDIwMjAgYXQgMDI6NTA6MjlQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gTm9uLUVDQU0gaG9zdCBicmlkZ2VzIGluIGh3
ZG9tIGdvIGRpcmVjdGx5IHRvIFBDSSBjb25maWcgc3BhY2UsDQo+PiBub3QgdGhyb3VnaCB2cGNp
ICh0aGV5IHVzZSB0aGVpciBzcGVjaWZpYyBtZXRob2QgZm9yIGFjY2Vzc2luZyBQQ0kNCj4+IGNv
bmZpZ3VyYXRpb24sIGUuZy4gZGVkaWNhdGVkIHJlZ2lzdGVycyBldGMuKS4gVGh1cyBod2RvbSdz
IHZwY2kgQkFScyBhcmUNCj4+IG5ldmVyIHVwZGF0ZWQgdmlhIHZQQ0kgTU1JTyBoYW5kbGVycywg
c28gaW1wbGVtZW50IGEgZGVkaWNhdGVkIG1ldGhvZA0KPj4gZm9yIGEgUENJIGhvc3QgYnJpZGdl
LCBzbyBpdCBoYXMgYSBjaGFuY2UgdG8gdXBkYXRlIHRoZSBpbml0aWFsIHN0YXRlIG9mDQo+PiB0
aGUgZGV2aWNlIEJBUnMuDQo+Pg0KPj4gTm90ZSwgd2UgcmVseSBvbiB0aGUgZmFjdCB0aGF0IGNv
bnRyb2wvaGFyZHdhcmUgZG9tYWluIHdpbGwgbm90IHVwZGF0ZQ0KPj4gcGh5c2ljYWwgQkFSIGxv
Y2F0aW9ucyBmb3IgdGhlIGdpdmVuIGRldmljZXMuDQo+IFRoaXMgaXMgcXVpdGUgdWdseS4NCkl0
IGlzDQo+DQo+IEknbSBsb29raW5nIGF0IHRoZSBjb21taXQgdGhhdCBpbXBsZW1lbnRzIHRoZSBo
b29rIGZvciBSLUNhciBhbmQgSSdtDQo+IGhhdmluZyB0cm91YmxlIHNlZWluZyBob3cgdGhhdCdz
IGRpZmZlcmVudCBmcm9tIHRoZSB3YXkgd2Ugd291bGQNCj4gbm9ybWFsbHkgcmVhZCB0aGUgQkFS
IGFkZHJlc3Nlcy4NCg0KT2ssIHBsZWFzZSBzZWUgbXkgY29tbWVudCBvbiBwYXRjaCBbMDYvMTBd
LiBJbiBzaG9ydDoNCg0Kd2hlbiBhIFBDSSBkZXZpY2UgaXMgKmFkZGVkKiB3ZSBjYWxsIGluaXRf
YmFycyBhbmQgYXQgdGhhdCB0aW1lIEJBUnMNCg0KYXJlIG5vdCBhc3NpZ25lZCBvbiBBUk0geWV0
LiBCdXQsIGlmIHdlIG1vdmUgaW5pdF9iYXJzIHRvIHRoZSBwb2ludA0KDQp3aGVuIGEgZGV2aWNl
ICphc3NpZ25lZCogdGhlbiBpdCB3aWxsIHdvcms/IEFuZCB0aGlzIGNvZGUgd2lsbCBnbyBhd2F5
DQoNCj4NCj4gSSB0aGluayB0aGlzIHNob3VsZCBsaWtlbHkgYmUgcGFpcmVkIHdpdGggdGhlIGFj
dHVhbCBpbXBsZW1lbnRhdGlvbiBvZg0KPiBhIGhvb2ssIG9yIGVsc2UgaXQncyBoYXJkIHRvIHRl
bGwgd2hldGhlciBpdCByZWFsbHkgbmVlZGVkIG9yIG5vdC4NClllcywgaWYgd2UgbW92ZSB0byBk
ZXZpY2UgYXNzaWduIHRoZW4gaXQgd29uJ3QgYmUgbmVlZGVkOiBoYXZlIHRvIGNoZWNrIHRoYXQN
Cj4NCj4gVGhhbmtzLCBSb2dlci4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

