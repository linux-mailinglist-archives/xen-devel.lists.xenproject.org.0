Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19227F988
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 08:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045.3503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNsBe-0007jg-D7; Thu, 01 Oct 2020 06:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045.3503; Thu, 01 Oct 2020 06:35:30 +0000
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
	id 1kNsBe-0007jH-98; Thu, 01 Oct 2020 06:35:30 +0000
Received: by outflank-mailman (input) for mailman id 1045;
 Thu, 01 Oct 2020 06:35:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSVJ=DI=epam.com=prvs=8543a5f0e3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kNsBd-0007jC-6M
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 06:35:29 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d696e29-d2f7-47fd-a3bc-ad9ea0d95371;
 Thu, 01 Oct 2020 06:35:26 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0916PqT4005540; Thu, 1 Oct 2020 06:35:24 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 33v1ddeeka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 06:35:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4883.eurprd03.prod.outlook.com (2603:10a6:208:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 06:35:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::853d:1bd6:75a0:a7d7]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::853d:1bd6:75a0:a7d7%7]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 06:35:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zSVJ=DI=epam.com=prvs=8543a5f0e3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kNsBd-0007jC-6M
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 06:35:29 +0000
X-Inumbo-ID: 7d696e29-d2f7-47fd-a3bc-ad9ea0d95371
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7d696e29-d2f7-47fd-a3bc-ad9ea0d95371;
	Thu, 01 Oct 2020 06:35:26 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0916PqT4005540;
	Thu, 1 Oct 2020 06:35:24 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56])
	by mx0a-0039f301.pphosted.com with ESMTP id 33v1ddeeka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2020 06:35:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTvy8zOXkptVHHxrcHGxpZczLC0AkBlQThkrZ5qnSOZcZhXy+o3Ij5fA8uy8toXVK4OQ/pe0aGT0wunTRO/VZCrgFmEdnU7PhTQwghm1hKc51mUIJMzH0s/8SyxMU3wnoU2ELuIWSZJGxbagipPvIozpFwAME2ixD3mw+Vc3GQVhuAquySS/r8Q+6JcjLmo619Nvzh/7ApjZYVrMyMRBXdR0WzYJB+5VxdZaQ+fmNJb1HpTHvUCsFQ+rUSUR0P/mkrPnt98oGF/lhoHGVaUo29OCfA+/ONkZVBcJtRBed/Uhkcj/DyPg551ZywP0o6c+NlxcKC2d+9F3aNlEoVZ+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FEU9ZQooRXHWAlapeeODbcgKDZ9yKhSZJPo3TeKfaA=;
 b=SA/l+MwjVgpGU3pmuoYnHNDPiPjXFiCrANFsah0iRzYA37Ed2ekzZAB5kqzlRtDv2xxmeVNJtMVUnKk6f2iRca1tUpscTWwDoNouuWLhCPLubVFBULFneYpSnQ/jpX9xvCJyPzsLqicANg+vYoNkG5ya4C/VF35/9nluvOO1EIpLmJOA1QjJ5s6qwwlDZQYgOUSIbDu3IMeTv4q8Aatyww2gdVOSWP/XGi1Vg2QHOPMt2jcuqukE1XL0VZCW00hO/BZloEd5XL+fALtK+Lx9dQ/hNfwcdpdRqDjOacGsORS58Nu+SqMtlYce2dBspOIop6mzFVx+Kspo6a4kerJUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FEU9ZQooRXHWAlapeeODbcgKDZ9yKhSZJPo3TeKfaA=;
 b=H6Hps3Z0c4chM/DOF2u+3s5xeqVDWfeIm0kVDe8DOMLmvUzrMjUT+5I2rSLNlSGmVFkSMvYYhuqiax5X8LrNka812oJln+tVPj17o73FEj+h3LdMhf01SdgxIT0aNhaxYZUlsW3PmXVAeePbTQpKVwb5dKL6vuYh/oUQg3ulEJt4CvkXX+MuGOsjjsT/NLc8Z7YOMeXOedRJ5xopMjGquo6zbTuhEyNn3cPxUlz70QocgK/KenEz/rn1wJpTVav99xEuRW2rs8/wPooUccuIdnm+UufMjNdKUf+zNyABnWssjIHxFiVPqtr1jc7JWMb6ySOjVnTi0VImViib2ljt7w==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4883.eurprd03.prod.outlook.com (2603:10a6:208:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 06:35:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::853d:1bd6:75a0:a7d7]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::853d:1bd6:75a0:a7d7%7]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 06:35:21 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Ian Jackson <iwj@xenproject.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jgross@suse.com" <jgross@suse.com>,
        "wei.liu2@citrix.com"
	<wei.liu2@citrix.com>,
        "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
Subject: Re: [PATCH 2/2] libgnttab: Add support for Linux dma-buf offset
Thread-Topic: [PATCH 2/2] libgnttab: Add support for Linux dma-buf offset
Thread-Index: AQHWLoWvWdjq7ozlqkeaZNP0F/2zoKl++MQAgAQkQQA=
Date: Thu, 1 Oct 2020 06:35:21 +0000
Message-ID: <9e64a880-02ce-e04b-8e36-eb63fbfbd975@epam.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
 <20200520090425.28558-3-andr2000@gmail.com>
 <24433.65344.748102.591216@mariner.uk.xensource.com>
In-Reply-To: <24433.65344.748102.591216@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13868225-c8b3-46ef-3900-08d865d42bd0
x-ms-traffictypediagnostic: AM0PR03MB4883:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4883D6EA580B8E4119063993E7300@AM0PR03MB4883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RxA9uv2Isn+PZ+xrUlCR3Ui6X/WeprrX5KHLEIKPapGviYzjlVVIoSWxgVJmidj+522G7UZ3XHP52yFMBySHaDb2/fNec89hSa2gnDCQf5tT13VYDs0EPEH0KlHW8LC1izPIRHy/mqBILQWTHEUpRd59c5gP8O4JXJdR7RemMLs2g8LBuZPHGmxoVvNeso5ptvsEYQka+gpKBSzcYkTiozg41B8995uwOUTXPiRMHmxRP3A6YaOiuaUgQyAQn/2GW0SX+EBdzMIInGTKfQhojtuBuoYOcIufnzH1IlHMs+yz3n463FdOpcMvEREhsH6DWEPE0vRK9qdtPGOh6wc3XdeReK64gi3LpGEokTeaBIoCsRORTeN59iX2TV3B64Syf8oBp8IDplx8vYYlj9TpRw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(6486002)(66446008)(76116006)(66556008)(31696002)(66476007)(66946007)(64756008)(966005)(53546011)(6506007)(478600001)(86362001)(83380400001)(2616005)(36756003)(8936002)(186003)(2906002)(8676002)(4326008)(6512007)(83080400001)(110136005)(54906003)(26005)(31686004)(5660300002)(316002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mnKoFoBKuhm/l3v8nwgBmJsjjgzI/tBZnoEXTgWxFUgt7qe65tBFb+8UKkdd7BbxTbPNXINC9TJuGPdGSJmsATuNVtJ3CDHXpJ3C/zgZj9BPbyphOE+w06lMZb/C+5HXcsjDIy7i7LG5mDQygDjkitx/L6sERmRnA/2fysZBff6xkq0Pq7g7YwTykWQD3CtcddHjvRGQ8Pd3j4pa1jWlj393C0fYNd9BkfnZRbJM1Hh8rQPpFOoFqhP0QH/MZ7mDxjyQ1xzAuu0tWrZqRikIvyED7TnCbvMqOFp1+9XdJAzZ/ttCdo2PmuGU25ilYgXl3nujPBa5Tf+ueGcgVxVumSP1UuNk/C8Fa3Pusv6o4BRPYOPFtUfpdn2jl4E9C4OvDK2ZoNAmwUAulXwkGg1zE0lD6y5mTba03TokfkLzDFn3mB5mBdkXEwE3bDwcw97q8UJCmiol+YC0XaBXdlkNNjUHtz3dg+oqKV5gq3/5tKhyLYovEQ4Yn1fk8+1mHIIyaGxGLRvWvFqPOeIOwM01G1oLv6uDkxwY0PKl2x72SE6g4rBeS7cu5rmt5UaQB3rs5kKYLpzLhik4n7I60WPC8A0OWnTrESM2POORUVjgKFyj4/SK4LV+Xb9ZSW94PwqWzRsxfNcoPiobrHAy0zYvpg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAAA0C6EFB9D8C42B0070C7A502ACF8F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13868225-c8b3-46ef-3900-08d865d42bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 06:35:21.4179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tPESW3T56GA7vX0njXwKipqIP/gPEkbrPM27BWUbIXMWDBO6wVffTok9fgaMFDo6OWluBxvxQjgaYuDJIe3Mki/kSi9s2A4d+S3SlSnjhrDYoFLXwIrIG0tIzpWfC8qT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4883
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-01_02:2020-10-01,2020-10-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010010058

SGksDQoNCk9uIDkvMjgvMjAgNjoyMCBQTSwgSWFuIEphY2tzb24gd3JvdGU6DQo+IE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyaXRlcyAoIltQQVRDSCAyLzJdIGxpYmdudHRhYjogQWRkIHN1cHBv
cnQgZm9yIExpbnV4IGRtYS1idWYgb2Zmc2V0Iik6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQWRkIHZl
cnNpb24gMiBvZiB0aGUgZG1hLWJ1ZiBpb2N0bHMgd2hpY2ggYWRkcyBkYXRhX29mcyBwYXJhbWV0
ZXIuDQo+Pg0KPj4gZG1hLWJ1ZiBpcyBiYWNrZWQgYnkgYSBzY2F0dGVyLWdhdGhlciB0YWJsZSBh
bmQgaGFzIG9mZnNldCBwYXJhbWV0ZXINCj4+IHdoaWNoIHRlbGxzIHdoZXJlIHRoZSBhY3R1YWwg
ZGF0YSBzdGFydHMuIFJlbGV2YW50IGlvY3RscyBhcmUgZXh0ZW5kZWQNCj4+IHRvIHN1cHBvcnQg
dGhhdCBvZmZzZXQ6DQo+PiAgICAtIHdoZW4gZG1hLWJ1ZiBpcyBjcmVhdGVkIChleHBvcnRlZCkg
ZnJvbSBncmFudCByZWZlcmVuY2VzIHRoZW4NCj4+ICAgICAgZGF0YV9vZnMgaXMgdXNlZCB0byBz
ZXQgdGhlIG9mZnNldCBmaWVsZCBpbiB0aGUgc2NhdHRlciBsaXN0DQo+PiAgICAgIG9mIHRoZSBu
ZXcgZG1hLWJ1Zg0KPj4gICAgLSB3aGVuIGRtYS1idWYgaXMgaW1wb3J0ZWQgYW5kIGdyYW50IHJl
ZmVyZW5jZXMgcHJvdmlkZWQgdGhlbg0KPj4gICAgICBkYXRhX29mcyBpcyB1c2VkIHRvIHJlcG9y
dCB0aGF0IG9mZnNldCB0byB1c2VyLXNwYWNlDQo+IFRoYW5rcy4gIEknbSBub3QgYSBETUEgZXhw
ZXJ0LCBidXQgSSB0aGluayB0aGlzIGlzIHByb2JhYmx5IGdvaW5nIGluDQo+IHJvdWdobHkgdGhl
IHJpZ2h0IGRpcmVjdGlvbi4gIEkgd2lsbCBwcm9iYWJseSB3YW50IGEgcmV2aWV3IGZyb20gYSBE
TUENCj4gZXhwZXJ0IHRvbywgYnV0IGxldCBtZSBnZXQgb24gd2l0aCBteSBxdWVzdGlvbnM6DQo+
DQo+IFdoZW4geW91IHNheSAidGhlIHByb3RvY29sIGNoYW5nZXMgYXJlIGFscmVhZHkgYWNjZXB0
ZWQiIEkgdGhpbmsgeW91DQo+IG1lYW4gdGhlIExpbnV4IGlvY3RsIGNoYW5nZXMgPyAgSWYgbm90
LCB3aGF0ICpkbyogeW91IG1lYW4gPw0KDQpJIG1lYW4gdGhhdCB0aGUgcmVsZXZhbnQgcHJvdG9j
b2wgY2hhbmdlcyBhcmUgYWxyZWFkeSBwYXJ0IG9mIGJvdGggWGVuIFsxXQ0KDQphbmQgTGludXgg
dHJlZXMgWzJdLiBXaGF0IGlzIG1pc3NpbmcgaXMgaW9jdGwgaW1wbGVtZW50YXRpb24gaW4gdGhl
IGtlcm5lbCBhbmQNCg0KaXRzIHN1cHBvcnQgaW4gWGVuJyB0b29scy4gVGhpcyBpcyB3aHkgSSBo
YXZlIG1hcmtlZCB0aGUgcGF0Y2ggYXMgUkZDIGluIG9yZGVyDQoNCnRvIGdldCBzb21lIHZpZXcg
b24gdGhlIG1hdHRlciBmcm9tIFhlbiBjb21tdW5pdHkuIE9uY2Ugd2UgYWdyZWUgb24gdGhlDQoN
Cm5hbWluZywgc3RydWN0dXJlIGV0Yy4gSSdsbCBzZW5kIHBhdGNoZXMgZm9yIGJvdGggWGVuIGFu
ZCBMaW51eA0KDQo+DQo+PiArLyoNCj4+ICsgKiBWZXJzaW9uIDIgb2YgdGhlIGlvY3RscyBhZGRz
IEBkYXRhX29mcyBwYXJhbWV0ZXIuDQo+PiArICoNCj4+ICsgKiBkbWEtYnVmIGlzIGJhY2tlZCBi
eSBhIHNjYXR0ZXItZ2F0aGVyIHRhYmxlIGFuZCBoYXMgb2Zmc2V0DQo+PiArICogcGFyYW1ldGVy
IHdoaWNoIHRlbGxzIHdoZXJlIHRoZSBhY3R1YWwgZGF0YSBzdGFydHMuDQo+PiArICogUmVsZXZh
bnQgaW9jdGxzIGFyZSBleHRlbmRlZCB0byBzdXBwb3J0IHRoYXQgb2Zmc2V0Og0KPj4gKyAqICAg
LSB3aGVuIGRtYS1idWYgaXMgY3JlYXRlZCAoZXhwb3J0ZWQpIGZyb20gZ3JhbnQgcmVmZXJlbmNl
cyB0aGVuDQo+PiArICogICAgIEBkYXRhX29mcyBpcyB1c2VkIHRvIHNldCB0aGUgb2Zmc2V0IGZp
ZWxkIGluIHRoZSBzY2F0dGVyIGxpc3QNCj4+ICsgKiAgICAgb2YgdGhlIG5ldyBkbWEtYnVmDQo+
PiArICogICAtIHdoZW4gZG1hLWJ1ZiBpcyBpbXBvcnRlZCBhbmQgZ3JhbnQgcmVmZXJlbmNlcyBh
cmUgcHJvdmlkZWQgdGhlbg0KPj4gKyAqICAgICBAZGF0YV9vZnMgaXMgdXNlZCB0byByZXBvcnQg
dGhhdCBvZmZzZXQgdG8gdXNlci1zcGFjZQ0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgSU9DVExfR05U
REVWX0RNQUJVRl9FWFBfRlJPTV9SRUZTX1YyIFwNCj4+ICsgICAgX0lPQyhfSU9DX05PTkUsICdH
JywgMTMsIFwNCj4gSSB0aGluayB0aGlzIHdhcyBjb3BpZWQgZnJvbSBhIExpbnV4IGhlYWRlciBm
aWxlID8gIElmIHNvIHBsZWFzZSBxdW90ZQ0KPiB0aGUgcHJlY2lzZSBmaWxlIGFuZCByZXZpc2lv
biBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQpUaGlzIGlzIG5vdCB1cHN0cmVhbSB5ZXQsIHBsZWFz
ZSBzZWUgZXhwbGFuYXRpb24gYWJvdmUNCj4gICAgQW5kIGJlIHN1cmUgdG8NCj4gY29weSB0aGUg
Y29weXJpZ2h0IGluZm9ybXRhaW9uIGFwcHJvcHJpYXRlbHkuDQo+DQo+PiAraW50IG9zZGVwX2du
dHRhYl9kbWFidWZfZXhwX2Zyb21fcmVmc192Mih4ZW5nbnR0YWJfaGFuZGxlICp4Z3QsIHVpbnQz
Ml90IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgZmxhZ3MsIHVpbnQzMl90IGNvdW50LA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDMyX3QgKnJlZnMsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZG1hYnVmX2ZkLCB1aW50
MzJfdCBkYXRhX29mcykNCj4+ICt7DQo+PiArICAgIGFib3J0KCk7DQo+IEknbSBwcmV0dHkgc3Vy
ZSB0aGlzIGlzIHdyb25nLg0KDQpGaXJzdCBvZiBhbGwsIExpbnV4IGRtYS1idWZzIGFyZSBvbmx5
IHN1cHBvcnRlZCBvbiBMaW51eCwgc28gbmVpdGhlciBGcmVlQlNEIG5vciBNaW5pLU9TDQoNCndp
bGwgaGF2ZSB0aGF0LiBJZiB5b3UgYXJlIHJlZmVycmluZyB0byAiYWJvcnQoKSIgaGVyZSwgc28g
SSBhbSBqdXN0IGFsaWduaW5nIHRvIHdoYXQgcHJldmlvdXNseQ0KDQp3YXMgdGhlcmUsIGUuZy4g
YWxsIG5vbi1yZWxldmFudCBkbWEtYnVmIE9TIHNwZWNpZmljcyB3ZXJlIGltcGxlbWVudGVkIGxp
a2UgdGhhdC4NCg0KPg0KPiBUaGlzIGxlYWRzIG1lIHRvIGFzayBhYm91dCBjb21wYXRpYmlsaXR5
LCBib3RoIGFjcm9zcyB2ZXJzaW9ucyBvZiB0aGUNCj4gdmFyaW91cyBjb21wb25lbnRzLCBhbmQg
QVBJIGNvbXBhdGliaWxpdHkgYWNyb3NzIGRpZmZlcmVudCBwbGF0Zm9ybXMuDQo+DQo+IGxpYnhl
bmdudHRhYiBpcyBzdXBwb3NlZCB0byBoYXZlIGEgc3RhYmxlIEFQSSBhbmQgQUJJLiAgVGhpcyBt
ZWFucw0KPiB0aGF0IG9sZCBwcm9ncmFtcyBzaG91bGQgd29yayB3aXRoIHRoZSBuZXcgbGlicmFy
eSAtIHdoaWNoIEkgdGhpbmsgeW91DQo+IGhhdmUgYWNoaWV2ZWQuDQpZZXMNCj4NCj4gQnV0IEkg
dGhpbmsgaXQgYWxzbyBtZWFucyB0aGF0IGl0IHNob3VsZCB3b3JrIHdpdGggbmV3IHByb2dyYW1z
LCBhbmQNCj4gdGhlIG5ldyBsaWJyYXJ5LCBvbiBvbGQga2VybmVscy4gIFdoYXQgaXMgeW91ciBj
b21wYXRpYmlsaXR5IHN0b3J5DQo+IGhlcmUgPyAgV2hhdCBpcyB0aGUgaW50ZW5kZWQgbW9kZSBv
ZiB1c2UgYnkgYW4gYXBwbGljYXRpb24gPw0KDQpXZWxsLCB0aGlzIGlzIGEgdG91Z2ggc3Rvcnku
IElmIHdlIGhhdmUgbmV3IHNvZnR3YXJlIGFuZCBuZXcgbGlicmFyeSwgYnV0IG9sZA0KDQprZXJu
ZWwgaXQgbWVhbnMgdGhhdCB0aGUgb2Zmc2V0IHdlIGFyZSB0cnlpbmcgdG8gZ2V0IHdpdGggdGhl
IG5ldyBpb2N0bCB3aWxsIGJlDQoNCnVuYXZhaWxhYmxlIHRvIHRoYXQgbmV3IHNvZnR3YXJlLiBJ
biBtb3N0IGNhc2VzIHdlIGNhbiB1c2Ugb2Zmc2V0IG9mIDAsIGJ1dCBzb21lDQoNCnBsYXRmb3Jt
cyAoaU1YOCkgdXNlIG9mZnNldCBvZiA2NC4gU28sIHdlIGNhbiB3b3JrYXJvdW5kIHRoYXQgZm9y
IG1vc3QoPykgcGxhdGZvcm1zDQoNCmJ5IHJlcG9ydGluZyBvZmZzZXQgMCwgYnV0IHNvbWUgcGxh
dGZvcm1zIHdpbGwgZmFpbC4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGdvb2QgdG8gc3RhdGUg
dGhhdA0KDQp0aGlzIGNvbWJpbmF0aW9uIG9mIHNvZnR3YXJlIChhcyBkZXNjcmliZWQgYWJvdmUp
ICJ3aWxsIG1vc3RseSB3b3JrIiBvciBqdXN0IGxldA0KDQp0aGUgc3lzdGVtIGZhaWwgYXQgcnVu
LXRpbWUsIGJ5IGxldHRpbmcgTGludXggcmV0dXJuIEVOT1RTVVBQIGZvciB0aGUgbmV3IGlvY3Rs
Lg0KDQpCeSBmYWlsIEkgbWVhbiB0aGF0IHRoZSBkaXNwbGF5IGJhY2tlbmQgbWF5IGRlY2lkZSBp
ZiB0byB1c2UgdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIGlvY3RsDQoNCndpdGhvdXQgdGhl
IG9mZnNldCBmaWVsZC4NCg0KPg0KPiBBbmQgdGhlIHNhbWUgYXBwbGljYXRpb24gY29kZSBzaG91
bGQgYmUgdXNlYWJsZSwgc28gZmFyIGFzIHBvc3NpYmxlLA0KPiBhY3Jvc3MgZGlmZmVyZW50IHBs
YWF0Zm9ybXMgdGhhdCBzdXBwb3J0IFhlbi4NCj4NCj4gV2hhdCBmYWxsYmFjayB3b3VsZCBiZSBw
b3NzaWJsZSBmb3IgYXBwbGljYXRpb24gZG8gaWYgdGhlIHYyIGZ1bmN0aW9uDQo+IGlzIG5vdCBh
dmFpbGFibGUgPyAgSSB0aGluayB0aGF0IGZhbGxiYWNrIGFjdGlvbiBuZWVkcyB0byBiZQ0KPiBz
ZWxlY3RhYmxlIGF0IHJ1bnRpbWUsIHRvIHN1cHBvcnQgbmV3IHVzZXJzcGFjZSBvbiBvbGQga2Vy
bmVscy4NCg0KV2VsbCwgYXMgSSBzYWlkIGJlZm9yZSwgZm9yIHRoZSBwbGF0Zm9ybXMgd2l0aCBv
ZmZzZXQgMCB3ZSBhcmUgImZpbmUiIGlnbm9yaW5nIHRoZSBvZmZzZXQgYW5kDQoNCnVzaW5nIHYx
IG9mIHRoZSBpb2N0bCB3aXRob3V0IHRoZSBvZmZzZXQgZmllbGQuIEZvciB0aGUgcGxhdGZvcm1z
IHdpdGggbm9uLXplcm8gb2Zmc2V0IGl0IHJlc3VsdHMNCg0KYXQgbGVhc3QgaW4gc2xpZ2h0IHNj
cmVlbiBkaXN0b3J0aW9uIGFuZCB0aGV5IGRvIG5lZWQgdjIgb2YgdGhlIGlvY3RsDQoNCj4NCj4g
V2hhdCBhcmNoaXRlY3R1cmVzIGlzIHRoZSBuZXcgTGludXggaW9jdGwgYXZhaWxhYmxlIG9uID8N
Cng4Ni9BUk0NCj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2dudHRhYi9pbmNsdWRlL3hl
bmdudHRhYi5oIGIvdG9vbHMvbGlicy9nbnR0YWIvaW5jbHVkZS94ZW5nbnR0YWIuaA0KPj4gaW5k
ZXggMTExZmM4OGNhZWIzLi4wOTU2YmQ5MWUwZGYgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJz
L2dudHRhYi9pbmNsdWRlL3hlbmdudHRhYi5oDQo+PiArKysgYi90b29scy9saWJzL2dudHRhYi9p
bmNsdWRlL3hlbmdudHRhYi5oDQo+PiBAQCAtMzIyLDEyICszMjIsMTkgQEAgaW50IHhlbmdudHRh
Yl9ncmFudF9jb3B5KHhlbmdudHRhYl9oYW5kbGUgKnhndCwNCj4+ICAgICogUmV0dXJucyAwIGlm
IGRtYS1idWYgd2FzIHN1Y2Nlc3NmdWxseSBjcmVhdGVkIGFuZCB0aGUgY29ycmVzcG9uZGluZw0K
Pj4gICAgKiBkbWEtYnVmJ3MgZmlsZSBkZXNjcmlwdG9yIGlzIHJldHVybmVkIGluIEBmZC4NCj4+
ICAgICoNCj4+ICsNCj4+ICsgKiBWZXJzaW9uIDIgYWxzbyBhY2NlcHRzIEBkYXRhX29mcyBvZmZz
ZXQgb2YgdGhlIGRhdGEgaW4gdGhlIGJ1ZmZlci4NCj4+ICsgKg0KPj4gICAgKiBbMV0gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xh
dGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0X187ISFHRl8y
OWRiY1FJVUJQQSFpYTdnc0Q1bzl2UHRnUXptM3BVWW1jUEVhVW1hT0RaUlVreW5pcTc0dk5EWmti
ejl6R2JxZS16Q1Vlc0hIRjMtY2tSV0x1SUJLZyQgW2VsaXhpclsuXWJvb3RsaW5bLl1jb21dDQo+
PiAgICAqLw0KPj4gICBpbnQgeGVuZ250dGFiX2RtYWJ1Zl9leHBfZnJvbV9yZWZzKHhlbmdudHRh
Yl9oYW5kbGUgKnhndCwgdWludDMyX3QgZG9taWQsDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgZmxhZ3MsIHVpbnQzMl90IGNvdW50LA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQzMl90ICpyZWZzLCB1aW50
MzJfdCAqZmQpOw0KPj4gICANCj4+ICtpbnQgeGVuZ250dGFiX2RtYWJ1Zl9leHBfZnJvbV9yZWZz
X3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMyX3QgZG9taWQsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBmbGFncywgdWludDMyX3QgY291
bnQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50
MzJfdCAqcmVmcywgdWludDMyX3QgKmZkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgZGF0YV9vZnMpOw0KPiBJIHRoaW5rIHRoZSBpbmZvcm1hdGlv
biBhYm91dCB0aGUgbWVhbmluZyBvZiBAZGF0YV9vZnMgbXVzdCBiZSBpbiB0aGUNCj4gZG9jIGNv
bW1lbnQuICBJbmRlZWQsIHRoYXQgc2hvdWxkIGJlIHRoZSBwcmltYXJ5IGxvY2F0aW9uLg0KU3Vy
ZQ0KPg0KPiBDb252ZXJzZWx5IHRoZXJlIGlzIG5vIG5lZWQgdG8gZHVwbGljYXRlIGluZm9ybWF0
aW9uIGJldHdlZW4gdGhlIHBhdGNoDQo+IGNvbnRlbnRzLCBhbmQgdGhlIGNvbW1pdCBtZXNzYWdl
Lg0KDQpJdCdzIGp1c3QgYSBtZSB0aGF0IGFsd2F5cyB3YW50cyB0aGUgZG9jIGF0IGhhbmR5IGxv
Y2F0aW9uIHNvIEkgZG9uJ3QgbmVlZCB0byBkaWcgZm9yDQoNCnRoZSBjb21taXQgbWVzc2FnZXM/
IEJ1dCBhdCB0aGUgc2FtZSB0aW1lIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgYWxsb3cgb25l
DQoNCnF1aWNrbHkgdW5kZXJzdGFuZCB3aGF0J3MgaW4gdGhlcmUuIFNvLCBJIHdvdWxkIHByZWZl
ciB0byBoYXZlIG1vcmUgZGVzY3JpcHRpb24gaW4gdGhlDQoNCnBhdGNoIHRoZW4NCg0KPg0KPiBJ
cyBfdjIgcmVhbGx5IHRoZSBiZXN0IG5hbWUgZm9yIHRoaXMgPyAgQXJlIHdlIGxpa2VseSB0byB3
YW50IHRvDQo+IGV4dGVuZCB0aGlzIGFnYWluIGluIGZ1dHVyZSA/ICBQZXJoYXBzIGl0IHNob3Vs
ZCBiZSBjYWxsZWQgLi4uX29mZnNldA0KPiBvciBzb21ldGhpbmcgPyAgUGxlYXNlIHRoaW5rIGFi
b3V0IHRoaXMgYW5kIHRlbGwgbWUgeW91ciBvcGluaW9uLg0KDQpJIGRvbid0IGFjdHVhbGx5IGxp
a2UgdjIuIE5laXRoZXIgSSBjYW4gcHJvZHVjZSBhbnl0aGluZyBtb3JlIGN1dGUgOykNCg0KT24g
dGhlIG90aGVyIGhhbmQgaXQgaXMgZWFzaWVyIHRvIHVuZGVyc3RhbmQgdGhhdCB2MiBpcyBhY3R1
YWxseSBleHRlbmRzL3JlbW92ZXMvY2hhbmdlcw0KDQpzb21ldGhpbmcgdGhhdCB3YXMgaGVyZSBi
ZWZvcmUuIFNheSwgaWYgeW91IGhhdmUgMiBpb2N0bHMgeXl5IGFuZCBkZGQgeW91IG5lZWQgdG8g
Y29tcGFyZQ0KDQp0aGUgdHdvIHRvIHVuZGVyc3RhbmQgd2hhdCBpcyBtb3JlIHJlbGV2YW50IGF0
IHRoZSBtb21lbnQuIEhhdmluZyBleHBsaWNpdCB2ZXJzaW9uIGluIHRoZQ0KDQpuYW1lIGxlYXZl
cyBubyBkb3VidCBhYm91dCB3aGF0IGlzIG5ld2VyLg0KDQo+DQo+PiAraW50IG9zZGVwX2dudHRh
Yl9kbWFidWZfZXhwX2Zyb21fcmVmc192Mih4ZW5nbnR0YWJfaGFuZGxlICp4Z3QsIHVpbnQzMl90
IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgZmxhZ3MsIHVpbnQzMl90IGNvdW50LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgdWludDMyX3QgKnJlZnMsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZG1hYnVmX2ZkLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZGF0YV9vZnMp
DQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgaW9jdGxfZ250ZGV2X2RtYWJ1Zl9leHBfZnJvbV9yZWZz
X3YyICpmcm9tX3JlZnNfdjIgPSBOVUxMOw0KPj4gKyAgICBpbnQgcmMgPSAtMTsNCj4+ICsNCj4+
ICsgICAgaWYgKCAhY291bnQgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBlcnJubyA9IEVJTlZB
TDsNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGZyb21f
cmVmc192MiA9IG1hbGxvYyhzaXplb2YoKmZyb21fcmVmc192MikgKw0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgKGNvdW50IC0gMSkgKiBzaXplb2YoZnJvbV9yZWZzX3YyLT5yZWZzWzBd
KSk7DQo+PiArICAgIGlmICggIWZyb21fcmVmc192MiApDQo+PiArICAgIHsNCj4+ICsgICAgICAg
IGVycm5vID0gRU5PTUVNOw0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+ICsN
Cj4+ICsgICAgZnJvbV9yZWZzX3YyLT5mbGFncyA9IGZsYWdzOw0KPj4gKyAgICBmcm9tX3JlZnNf
djItPmNvdW50ID0gY291bnQ7DQo+PiArICAgIGZyb21fcmVmc192Mi0+ZG9taWQgPSBkb21pZDsN
Cj4+ICsgICAgZnJvbV9yZWZzX3YyLT5kYXRhX29mcyA9IGRhdGFfb2ZzOw0KPj4gKw0KPj4gKyAg
ICBtZW1jcHkoZnJvbV9yZWZzX3YyLT5yZWZzLCByZWZzLCBjb3VudCAqIHNpemVvZihmcm9tX3Jl
ZnNfdjItPnJlZnNbMF0pKTsNCj4+ICsNCj4+ICsgICAgaWYgKCAocmMgPSBpb2N0bCh4Z3QtPmZk
LCBJT0NUTF9HTlRERVZfRE1BQlVGX0VYUF9GUk9NX1JFRlNfVjIsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgZnJvbV9yZWZzX3YyKSkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBHVEVSUk9S
KHhndC0+bG9nZ2VyLCAiaW9jdGwgRE1BQlVGX0VYUF9GUk9NX1JFRlNfVjIgZmFpbGVkIik7DQo+
PiArICAgICAgICBnb3RvIG91dDsNCj4+ICsgICAgfQ0KPiBUaGlzIHNlZW1zIGp1c3QgYSBmYWly
bHkgb2J2aW91cyB3cmFwcGVyIGZvciB0aGlzIGlvY3RsLiAgSSB0aGluayBpdA0KPiB3b3VsZCBi
ZSBiZXN0IGZvciBtZSB0byByZXZpZXcgdGhpcyBpbiBkZXRhaWwgd2l0aCByZWZlcmVuY2UgdG8g
dGhlDQo+IGlvY3RsIGRvY3VtZW50YXRpb24gKHdoaWNoIHlvdSBoZWxwZnVsbHkgcmVmZXIgdG8g
LSB0aGFuayB5b3UhKSBhZnRlcg0KPiBJIHNlZSB0aGUgYW5zd2VycyB0byBteSBvdGhlciBxdWVz
dGlvbnMuDQoNCldlbGwsIEkgaGF2ZSBsaXR0bGUgdG8gYWRkIGFzIHRoZSBvbmx5IGNoYW5nZSBh
bmQgdGhlIHJlYXNvbiBpcyB0aGF0IHNjYXR0ZXItZ2F0aGVyIHRhYmxlJ3MNCg0Kb2Zmc2V0IG11
c3QgYmUgaG9ub3JlZCB3aGljaCB3YXMgbm90IGEgcHJvYmxlbSB1bnRpbCB3ZSBmYWNlZCBpTVg4
IHBsYXRmb3JtIHdoaWNoIGhhcw0KDQp0aGF0IG9mZnNldCBub24temVyby4gRnJhbmtseSwgbG90
cyBvZiBzb2Z0d2FyZSBhc3N1bWVzIGl0IGlzIHplcm8uLi4NCg0KPg0KPj4gK2ludCBvc2RlcF9n
bnR0YWJfZG1hYnVmX2ltcF90b19yZWZzX3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMy
X3QgZG9taWQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgZmQsIHVpbnQzMl90IGNvdW50LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90ICpyZWZzLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQzMl90ICpkYXRhX29mcykNCj4+ICt7DQo+IFRoaXMgZnVuY3Rp
b24gaXMgdmVyeSBzaW1pbGFyIHRvIHRoZSBwcmV2aW91cyBvbmUuICBJJ20gdW5jb21mb3J0YWJs
ZQ0KPiB3aXRoIHRoZSBkdXBsaWNhdGlvbiwgYnV0IEkgc2VlIHRoYXQNCj4gICAgIG9zZGVwX2du
dHRhYl9kbWFidWZfe2ltcF90byxleHBfZnJvbX1fcmVmcw0KPiBhcmUgdmVyeSBkdXBsaWNhdGl2
ZSBhbHJlYWR5LCBzbyBJIGFtIGFsc28gc29tZXdoYXQgdW5jb21mb3J0YWJsZSB3aXRoDQo+IGFz
a2luZyB5b3UgdG8gY2xlYW4gdGhpcyB1cCB3aXRoIHJlZmFjdG9yaW5nLiAgQnV0IHBlcmhhcHMg
aWYgeW91IGZlbHQNCj4gbGlrZSB0aGlua2luZyBhYm91dCBjb21iaW9uaW5nIHNvbWUgb2YgdGhp
cywgdGhhdCBtaWdodCBiZSBuaWNlLg0KDQpJIGhhdGUgaGF2aW5nIGNvZGUgZHVwbGljYXRpb24g
YXMgd2VsbDogbGVzcyBjb2RlIGxlc3MgbWFpbnRlbmFuY2UuIEJ1dCBpbiB0aGlzIGNhc2UNCg0K
dGhlIGNvbW1vbiBjb2RlIG1ha2VzIHRoYXQgZnVuY3Rpb24gZnVsbCBvZiAiaWYicyBzbyBmaW5h
bGx5IEkgZ2F2ZSB1cCBhbmQgbWFrZSBhIGNvcHktcGFzdGUuDQoNCk5vIHN0cm9uZyBvcGluaW9u
IGhlcmU6IGlmIHlvdSB0aGluayAiaWYicyBhcmUgc3RpbGwgYmV0dGVyIEknbGwgcmV3b3JrIHRo
YXQNCg0KPg0KPiBXaGF0IGRvIG15IGNvLW1haW50YWluZXJzIHRoaW5rID8NCj4NCj4NCj4gUmVn
YXJkcywNCj4gSWFuLg0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcgYW5kIHlvdXIgdGltZSwN
Cg0KT2xla3NhbmRyDQoNClsxXSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVu
LmdpdDthPWNvbW1pdDtoPWMyN2ExODQyMjVlYWI1NGQyMDQzNWM4Y2FiNWFkMGVmMzg0ZGMyYzAN
Cg0KWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTZmOTIzMzdiNmJmZmIzZDllNTA5MDI0ZDZlZjVj
M2YyYjExMjc1N2QNCg0K

