Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E82B053B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 13:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25809.53826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdC7x-0003ZL-ID; Thu, 12 Nov 2020 12:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25809.53826; Thu, 12 Nov 2020 12:55:01 +0000
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
	id 1kdC7x-0003Yw-Ek; Thu, 12 Nov 2020 12:55:01 +0000
Received: by outflank-mailman (input) for mailman id 25809;
 Thu, 12 Nov 2020 12:54:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81XN=ES=epam.com=prvs=9585825f72=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdC7v-0003Yq-AZ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:54:59 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92cf2c9d-cb20-491f-8f96-a2156131ccb9;
 Thu, 12 Nov 2020 12:54:58 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ACCZCSO001011; Thu, 12 Nov 2020 12:54:53 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80bqqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 12:54:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2657.eurprd03.prod.outlook.com (2603:10a6:200:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 12:54:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 12:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=81XN=ES=epam.com=prvs=9585825f72=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdC7v-0003Yq-AZ
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:54:59 +0000
X-Inumbo-ID: 92cf2c9d-cb20-491f-8f96-a2156131ccb9
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 92cf2c9d-cb20-491f-8f96-a2156131ccb9;
	Thu, 12 Nov 2020 12:54:58 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ACCZCSO001011;
	Thu, 12 Nov 2020 12:54:53 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80bqqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2020 12:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS3K8xc2xEL9gZ7W1s2N4ITwagcAKI5LAAbyEtnbUYdnVOx1je8eRaSGASjdYLLfp0ckcA4RWQ25Kan1UKLYWGlfl1CEU9cnlJDb7pxceA8i4cuSfUm86YvV9CfzHeGWJYTvYZMWIj7xA7YNu5D6BkySvoTv4DBCBwKPPlZ20qXBmYkLv+2BfgMh5K1x7X0SAD4TA6ZJLgbZMKxvgAw5oDZ1zU421a+g0UnL5b5+Az41XN2PPMPXqfEymsKqj72efWUuCMVvoO5IjeXHkc4jmrYvMPylqLB6x9fAQCT4hB5AxUfMG8qoe8gjEEodD8AQF7YGbUFm512FqiUfrHnoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aB8W4OWIlVdg7LOVbs3Kmr8dlOKwhPxhSaGqZv+ueA=;
 b=mACXOkNqE9Fza/xj52QP5GlQNgaCxyqNXj2o2C3B4085wDnPgV9S4C3fxk6d6HX8hExNXSZ/6212NRlOMcz0jmbtv/RhAEeHH7ep5eqE9snoQkTSis0IioTbAoUFWaXjPOvshfpE8bLRcB2bgB4qeAlzXEZGlLC1d5yiwZyn/qsMYrS+4xE0rgw3J4z49nwPKqFeRYgyCHWOPJKkzP5TNeTuArt2wo82LFkwEJLPGMKt1964kfRnrneQDQh+z4Miv+Skv5dBOZ4m5QJa/dcTs+Ty+lrvqv4i4WxiUjSt1EDXDYIaHaEPm3iAveCzqQZUjvb+cn2i9YUmIfsJIHdrgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aB8W4OWIlVdg7LOVbs3Kmr8dlOKwhPxhSaGqZv+ueA=;
 b=OVyBEKH7giPjgBd/dXWsP7pz5lJk7GwERK9Uv2Ee2krF/Esa6KYIDtzPR7BFgE2mgNWIQJA95rUnmG5mEvj4As5B0I9nncxLLLTRJP45nIsmdE7nHxbyWSrYCVsMsj97PD7rNWYfCq6Jy+6pmoOJPA+N6B8Yzv2cUJMeS7XkqylpetEAn0rhVWyfFpW8hKmpGaG6HNUbF7u0mnO6zUgwVTveB87mRUF/pgIyAQmJJ3GuRftEIof6ZMy3SRdY+s7L8MaFN8PLwjDsyVhh7VSjH7F7TnUPKDmllh2HKbZ4C5dNP4Xgk7PCVY8VxKlgLDx0OMB3r4lDs1Qd9cMwKqYpSg==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2657.eurprd03.prod.outlook.com (2603:10a6:200:90::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 12:54:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 12:54:49 +0000
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
Subject: Re: [PATCH 04/10] [WORKAROUND] xen/arm: Update hwdom's p2m to trap
 ECAM space
Thread-Topic: [PATCH 04/10] [WORKAROUND] xen/arm: Update hwdom's p2m to trap
 ECAM space
Thread-Index: AQHWtpbxgvcOGSsv3UquxFkS+bVZEanDBRsAgAFzuAA=
Date: Thu, 12 Nov 2020 12:54:49 +0000
Message-ID: <6a4b279c-5efe-a47a-5b71-c5bb7531ddb1@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-5-andr2000@gmail.com>
 <20201111144422.z2hi3ineg6qwbxi4@Air-de-Roger>
In-Reply-To: <20201111144422.z2hi3ineg6qwbxi4@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e03747c2-3a9f-4584-04b4-08d8870a23bc
x-ms-traffictypediagnostic: AM4PR0302MB2657:
x-microsoft-antispam-prvs: 
 <AM4PR0302MB26574CE435B4F04F2361E3C4E7E70@AM4PR0302MB2657.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 n4BdoapUm5mc31K3qsVoZxXLHIbzvF+WfFb7oud83XxQJZ4EuIKEx/dAtPn0GsyUKjePk1klh2f0uIPWxIUccV33riORvk8Sc/SRI8tRZKGPTuiGtP4Trpzgd+3t6s1TI+C73Jt9gvs2ef6aCoQLUqfTMS0VvPjko4YaPgH8XExC2kOtfGlY93uRFRDQPJOZnbMhYkzg0QUsSZYL4jeUOH6x87DJkQ8UUDVVz7M/uN8TA/OPcAsg8cqOMRB1hw2UO1YB0l/OE5n/feFl1cRzzKFtRs29tJtCLLGsUbjsf9OuO9VkfxvYkv9PXljft2uN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(86362001)(76116006)(6486002)(110136005)(8676002)(6512007)(6506007)(66476007)(54906003)(64756008)(316002)(31686004)(4326008)(31696002)(7416002)(2906002)(26005)(478600001)(36756003)(2616005)(66446008)(53546011)(186003)(4744005)(5660300002)(66946007)(71200400001)(66556008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 wPbKeebVZ1X3J3qsTHV3hnRdGVEgE17ISEySXFkwRuGzT+WGC1ozMJhfHLBzbNN4ET+6VjjsNFL1GO0BYfrCn0SW5HKtilS1lnrLawHfaGX8S7fVXaxTeNwM31I+KZkwTnKgPAldPN6ypdeeODPIr4SL6wRtnsND+TseVbqlysKJ31+kRyoybmPmscGbPQ5bnIJmXAGdkgWrrk0i6x6Q5ZP9cVCpN/gp/9zsZG4zdgDaemAcwlPQcRsEXBKZwSeNR1iljEcnqhyPI4e8GY+Y/uvM+a3Xfz1yZuoksbFPirC6No8j2246c1Ju5NcHGDxpnmgcWZGqcPljzl1NYmTd0U3mUKsxQgPQ8xR85yUgaO1AX2ZCGh8+n6scYp32jJksFdGTdW7vFyr14mVDrAiLvqbknsZqHzclmsq/QcnGuai6/an969c8WiGuOvZrOTvRggDgl5FJAAMAI1wFISLszrrhvKbbVfyOkzDQhyObTPbdAgBjD1L9f4rhBFvVGnMycEbBxqGUv/zP/sfhY1Yt42TZFkv221CVfHQPbtu6GR7Z8d9kqbsLMmUveZsJ/46woOFJGoz2n91mr5j2seWns1HxQnIxvwuE5vwhTCIZFncZYUo94h8XHiz9mR/HXxlUsV8EYmD/BJdq212nqtnjXQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADA9D3444E50854CA83A8398444926B0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03747c2-3a9f-4584-04b4-08d8870a23bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 12:54:49.0727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 05lJj3vThiqfbd6cUmb36dgpwU7pM7KXwjsX1QdGtMb7pFFf2OL8Sq1s9tWmCz1z2dGzbAE7GDYIsaAFq0SAAEAjEwO3Uu7gdwt3RH1Un0BWMw13BlAFyqeZKZiQ2igI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2657
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_05:2020-11-12,2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120075

DQpPbiAxMS8xMS8yMCA0OjQ0IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IE5vdiAwOSwgMjAyMCBhdCAwMjo1MDoyNVBNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBIb3N0IGJyaWRnZSBjb250cm9sbGVyJ3MgRUNB
TSBzcGFjZSBpcyBtYXBwZWQgaW50byBEb21haW4tMCdzIHAybSwNCj4+IHRodXMgaXQgaXMgbm90
IHBvc3NpYmxlIHRvIHRyYXAgdGhlIHNhbWUgZm9yIHZQQ0kgdmlhIE1NSU8gaGFuZGxlcnMuDQo+
PiBGb3IgdGhpcyB0byB3b3JrIHdlIG5lZWQgdG8gdW5tYXAgdGhvc2UgbWFwcGluZ3MgaW4gcDJt
Lg0KPj4NCj4+IFRPRE8gKEp1bGllbik6IEl0IHdvdWxkIGJlIGJlc3QgaWYgd2UgYXZvaWQgdGhl
IG1hcC91bm1hcCBvcGVyYXRpb24uDQo+PiBTbywgbWF5YmUgd2Ugd2FudCB0byBpbnRyb2R1Y2Ug
YW5vdGhlciB3YXkgdG8gYXZvaWQgdGhlIG1hcHBpbmcuDQo+PiBNYXliZSBieSBjaGFuZ2luZyB0
aGUgdHlwZSBvZiB0aGUgY29udHJvbGxlciB0byAiUENJX0hPU1RDT05UUk9MTEVSIg0KPj4gYW5k
IGNoZWNraW5nIGlmIHRoaXMgaXMgYSBQQ0kgaG9zdGNvbnRyb2xsZXIgYXZvaWQgdGhlIG1hcHBp
bmcuDQo+IEkga25vdyB2ZXJ5IGxpdHRsZSBhYm91dCBBcm0gdG8gYmUgYWJsZSB0byBwcm92aWRl
IG1lYW5pbmdmdWwgY29tbWVudHMNCj4gaGVyZS4gSSBhZ3JlZSB0aGF0IGNyZWF0aW5nIHRoZSBt
YXBzIGp1c3QgdG8gcmVtb3ZlIHRoZW0gYWZ0ZXJ3YXJkcyBpcw0KPiBub3QgdGhlIHJpZ2h0IGFw
cHJvYWNoLCB3ZSBzaG91bGQgaW5zdGVhZCBhdm9pZCB0aG9zZSBtYXBwaW5ncyBmcm9tDQo+IGJl
aW5nIGNyZWF0ZWQgaW4gdGhlIGZpcnN0IHBsYWNlLg0KQWdyZWVkLCB3ZSdsbCBuZWVkIHRvIGZp
bmQgYW4gYWNjZXB0YWJsZSB3YXkgb2YgZG9pbmcgc28NCj4gUm9nZXIuDQoNClRoYW5rIHlvdSwN
Cg0KT2xla3NhbmRyDQo=

