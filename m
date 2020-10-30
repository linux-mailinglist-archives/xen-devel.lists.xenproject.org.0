Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863A2A031B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 11:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15640.38692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRtl-0003MX-Hm; Fri, 30 Oct 2020 10:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15640.38692; Fri, 30 Oct 2020 10:44:45 +0000
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
	id 1kYRtl-0003M0-Dx; Fri, 30 Oct 2020 10:44:45 +0000
Received: by outflank-mailman (input) for mailman id 15640;
 Fri, 30 Oct 2020 10:44:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CBev=EF=epam.com=prvs=95721c7f7b=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kYRtk-0003K3-2C
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:44:44 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b75f53c-cde9-4bb6-acd0-92f799744e53;
 Fri, 30 Oct 2020 10:44:33 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UAfl5d031029; Fri, 30 Oct 2020 10:44:25 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 34fq7dc67m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 10:44:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 10:44:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 10:44:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CBev=EF=epam.com=prvs=95721c7f7b=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kYRtk-0003K3-2C
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:44:44 +0000
X-Inumbo-ID: 0b75f53c-cde9-4bb6-acd0-92f799744e53
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0b75f53c-cde9-4bb6-acd0-92f799744e53;
	Fri, 30 Oct 2020 10:44:33 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09UAfl5d031029;
	Fri, 30 Oct 2020 10:44:25 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
	by mx0a-0039f301.pphosted.com with ESMTP id 34fq7dc67m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2020 10:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCmtxJflP5+9G5A98x2q7p+bAfpmwsD8dSVk0T4VouBdr3uqCn9p1zkbt5RZrlEmC4u61SIYs3pC2nWj6Zs21hYVqaFSGgR9Yy7mfLnmqJkQ9G92sz41J5uTW1BIuiL2mEH7E5gr/GPoMM5NFhNIewOwkpDN6k1wUDD7c4fz4mODqrQauFdwkGAQKXGWLHoK6AOLwQQZJcT2Eolz5yc+XggmbKZP60Kl3iTsEERa93w+F0skBBGk53KxgkFuQH8K623FjeliQpqkR23cQHHFWbj6ruSK0lFgOBKTyrgFMV+cfhtUycZBzF50DneD85D2RJyBccjl9m4/UYv62azJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pz5dJh1rAxRDvqVzFIxUhHYsVolUz0ych1nLMqlMy8=;
 b=XckW6um94k0vhFxRCV8Oi4cs/snz1AjAest/ODZzcNVEhUfYMceERdoWLE+miExPUD5boIsdFBfHMwSd6gG1N/fjiU2yWU2JEt+w5sSqPsD1nSlucbrUispWcBX5pTOIwT/9bmVYJCV2OuEvRonBAB8JMdA029ctlQrk+QVf42YU8jrHjUhW3IbkiaTu1qNyEgL8Wot8p1IRLhA0Ybz+roJNTvvj76QHkylQaMW8p2QC45wu82Hb1ianIh4kk8CG2JLU6sxHyEUqJp0B0YY9LVqbSxg+5eSBdsx84sW9ZVYjRcvyhN5hvF0evdYOyYO3e+87272IV0p3ZIiDDl9x/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pz5dJh1rAxRDvqVzFIxUhHYsVolUz0ych1nLMqlMy8=;
 b=GjjLkJ57d496UUAGQr2ZQRmWJT6VO6rsrLY9QC/0Hp1nSA6JhzPN6lDp5MZ6DuHMW2pi9DzJNGWHN2pSMjYeGCn48tRabvvvoFYikSQlMKkXUYBAaAbSMfU82WzhzyinnCJQ/19PjQhG1zbDg1xziRLGOjZrTnUawSUyMihRV99YVQ/DBvB4bbz7JHgimUKXE89h1KyiOQSsSwB63QIrSeQltZOJxzNFn8E6r3VdyUgi2c5mCo+2oLKNwYrz08jO7PeHlOA5d4/iJoDcwJKh5qMvLiqV/iQ0eTVCHpQqkfAU+pklDAkINBeoMV6m/AevaALWyYRxkoufJTQ+TmM8Hw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 10:44:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 10:44:19 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
        Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWrqmeCV4SGlhADU2GY14D47cn7w==
Date: Fri, 30 Oct 2020 10:44:19 +0000
Message-ID: <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
References: 
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
In-Reply-To: 
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd663ee2-53a6-46ba-57c6-08d87cc0c1c7
x-ms-traffictypediagnostic: AM4PR0301MB2195:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM4PR0301MB2195F5905746D7FE2BAB2DF2E7150@AM4PR0301MB2195.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jGzPjxBfWza0OJNxrWoI11sh31sJ3JpqMUjHXj6/VsgHyM9Fo7MDF4sBRMF0JmgLGw5yH7ErPrJe3EBZOg1cCCT/6F/aLtxk13yZTkAGjbWpeGEiFs2DAwx5qkAh3QQQLAUmm1+W4apURklUtIRB8CwKSFBZzZZBMAWeCN30SHK+GADmL4V5E3RJggsdfIfIAT7r7sFS1ZpHNOxpU9YeLQf7g9WO5H076dSsFCM+/IgM6s1sGPwjxvaCL69gkVCFPVCiSF7nyeH2fK8JoqVCYgddepcZPjEp22KR1YHzhGilH7jmv7GPzP4ANbwyhiNb2hfPl5qVeEazOcH8A2s5+0wHu7cFnJyuWAzW+NYiZEqGWa9q3uDSq+rtHzsKO5qHGS2so1uzhIlvAxz7fcwuNw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(316002)(54906003)(2616005)(5660300002)(6506007)(53546011)(36756003)(8676002)(66476007)(66946007)(76116006)(31696002)(8936002)(71200400001)(186003)(66556008)(66446008)(64756008)(26005)(86362001)(110136005)(2906002)(478600001)(107886003)(966005)(4326008)(6486002)(31686004)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 iP6lkFrIrjxCTYfS26bDlLTTTwC+B9IoeTBBBI2mub/TJDoGSZo4IxriHGSUMdKtQ439jJbjViQlY654ntilHjADinlIxAVShsrhtNLRs4xBhNWm4VDFVRS2n4IOO3IWLwyq6cFhw7N8jL+1qjxI5qwtPJ0PboVXDtqNMYMPnQCAbBX47dJoKObCGAwRs+3FowoSdwk+lt34T06hjjD+SLEG6p4oQ/HF31bfWDi4gAMmQqSdlIFladfNtjiU1Gko+e9pgkFAEes3AlAVcwz47FaICJnBn5oTDMgrym50Hu/sB3LLut72wgq5jj0zO83msR2pGO/WGJzYuBn8Pog1Zh2dg9LwYhLU/3SXjDRMye8apQSewS9j1Sl/IpXXQ3QQ3WB+NJwvMZxlvgKAWg+fvqJ4HsC63JPw6jQZbCkvtkmCRfKEsCm8LbHnZVgdNMSegeG2y0BU5qyl5MC/b3vMLYkRJrmx4wyBNGPBMMXk2B7d1COeOwEMH9+E8ri1cTqu91ZTEqXEN12y7emIrYUs/p6qMa1pJkyfLQAGDHTzCNReU6sTNu9ZZ9qeOtOMT4MihBHflk70PIv+y7LD5GuJQLWnGYrBUPZUpZV3qHfbeH5IeODtu3xkppcostWcMtDzfLb0X97UDy9VZwwiFDKWfA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0781EE8B79B81A4284DFF649F584F4AA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd663ee2-53a6-46ba-57c6-08d87cc0c1c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 10:44:19.7635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kzp0gYnchlVwTSEsXCtLrs1LJbgYSjHpxRAidyNZOOU6/KsPv6CZXL9qQdHwL0IYDK7VB4ra8wXubo0UA9v5b26AqkwS7A99xGpw2ueFlbpwazVB7CgpikORQS6MU55W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2195
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-30_02:2020-10-30,2020-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300081

SGksIFJhaHVsIQ0KDQpPbiAxMC8yMC8yMCA2OjI1IFBNLCBSYWh1bCBTaW5naCB3cm90ZToNCj4g
QWRkIHN1cHBvcnQgZm9yIEFSTSBhcmNoaXRlY3RlZCBTTU1VdjMgaW1wbGVtZW50YXRpb25zLiBJ
dCBpcyBiYXNlZCBvbg0KPiB0aGUgTGludXggU01NVXYzIGRyaXZlci4NCj4NCj4gTWFqb3IgZGlm
ZmVyZW5jZXMgYmV0d2VlbiB0aGUgTGludXggZHJpdmVyIGFyZSBhcyBmb2xsb3dzOg0KPiAxLiBP
bmx5IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMgc3VwcG9ydGVkIGFzIGNvbXBhcmVkIHRvIHRoZSBM
aW51eCBkcml2ZXINCj4gICAgIHRoYXQgc3VwcG9ydHMgYm90aCBTdGFnZS0xIGFuZCBTdGFnZS0y
IHRyYW5zbGF0aW9ucy4NCg0KRmlyc3Qgb2YgYWxsIHRoYW5rIHlvdSBmb3IgdGhlIGVmZm9ydHMh
DQoNCkkgdHJpZWQgdGhlIHBhdGNoIHdpdGggUUVNVSBhbmQgd291bGQgbGlrZSB0byBrbm93IGlm
IG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdA0KDQp0aGF0IHRoaXMgY29tYmluYXRpb24gd2lsbCBu
b3Qgd29yayBhcyBvZiBub3c6DQoNCihYRU4pIFNNTVV2MzogL3NtbXV2M0A5MDUwMDAwOiBTTU1V
djM6IERUIHZhbHVlID0gZXZlbnRxDQooWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5bmRyb21lPTB4
MTk0MDAxMA0KKFhFTikgV2Fsa2luZyBIeXBlcnZpc29yIFZBIDB4NDAwMzEwMDAgb24gQ1BVMCB2
aWEgVFRCUiAweDAwMDAwMDAwYjg0NjkwMDANCihYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAwMGI4
NDY4ZjdmDQoNCltzbmlwXQ0KDQpJZiB0aGlzIGlzIGV4cGVjdGVkIHRoZW4gaXMgdGhlcmUgYW55
IHBsYW4gdG8gbWFrZSBRRU1VIHdvcmsgYXMgd2VsbD8NCg0KSSBzZWUgWzFdIHNheXMgdGhhdCAi
T25seSBzdGFnZSAxIGFuZCBBQXJjaDY0IFBUVyBhcmUgc3VwcG9ydGVkLiIgb24gUUVNVSBzaWRl
Lg0KDQoNCldlIGFyZSBpbnRlcmVzdGVkIGluIFFFTVUvU01NVXYzIGFzIGEgZmxleGlibGUgcGxh
dGZvcm0gZm9yIFBDSSBwYXNzdGhyb3VnaA0KDQppbXBsZW1lbnRhdGlvbiwgc28gaXQgY291bGQg
YWxsb3cgdGVzdGluZyBkaWZmZXJlbnQgc2V0dXBzIGFuZCBjb25maWd1cmF0aW9ucyB3aXRoIFFF
TVUuDQoNCg0KVGhhbmsgeW91IGluIGFkdmFuY2UsDQoNCk9sZWtzYW5kcg0KDQpbMV0gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3FlbXUtZGV2ZWwvY292ZXIvMTUyNDY2NTc2
Mi0zMTM1NS0xLWdpdC1zZW5kLWVtYWlsLWVyaWMuYXVnZXJAcmVkaGF0LmNvbS8NCg==

