Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBBB290218
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 11:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7861.20729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTMG7-0007PO-K3; Fri, 16 Oct 2020 09:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7861.20729; Fri, 16 Oct 2020 09:42:47 +0000
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
	id 1kTMG7-0007Oz-Ga; Fri, 16 Oct 2020 09:42:47 +0000
Received: by outflank-mailman (input) for mailman id 7861;
 Fri, 16 Oct 2020 09:42:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8ta=DX=epam.com=prvs=8558ee1b56=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1kTMG5-0007Os-Vw
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:42:46 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b215da0-39d8-4826-9bf5-99d2d8044d90;
 Fri, 16 Oct 2020 09:42:44 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09G9ZCD5028122; Fri, 16 Oct 2020 09:42:43 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 3476850jj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 09:42:43 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AS8PR03MB6902.eurprd03.prod.outlook.com (2603:10a6:20b:29f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 16 Oct
 2020 09:42:39 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 09:42:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T8ta=DX=epam.com=prvs=8558ee1b56=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
	id 1kTMG5-0007Os-Vw
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:42:46 +0000
X-Inumbo-ID: 0b215da0-39d8-4826-9bf5-99d2d8044d90
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0b215da0-39d8-4826-9bf5-99d2d8044d90;
	Fri, 16 Oct 2020 09:42:44 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09G9ZCD5028122;
	Fri, 16 Oct 2020 09:42:43 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
	by mx0a-0039f301.pphosted.com with ESMTP id 3476850jj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2020 09:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acRhFdRKanqCUF+cwpVzwBU+TYb8n5QOngg83+7K9hd4FSIsxsGp9M5itoBZJ9XBo1+ehRqDGwDf1Q/hoOtMsRmLje2dSjpjGJwAc2JJldVyhB8sj5gDIftb+oYHdAr9pn1cebGWkb6syL4vq+tyLgmDi/cwqWLUSPb7lMMcf4E3o+4BKijCs1LcwWS0lZOhVKJxZtyjeYdxMF35ItT7ax3qmtLmFHVB1kCQbqQu4qoY4MMzoDPPBb/aqZ1cQm9XEieMHOmaCSFYXb7V9wOoFb6vxRYpubqTKS/VGPxDyQNVP95aRLLfIJq7kEvb4siMwrxVz0a3DCXUlGziaCi91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd9ee9EFA7w7Qmj4sWQdYGIWRmp9LafewTNB9lkRU/A=;
 b=GCRWDYNOeQA7+NSEQb2Z1ch+meKl0lZOoU7GtauTvI8Qcf+Aj5r16VkBbZ/sIvUFM2W2ie+RHbVfEjTrZzRN05l3zHy5ICj5U7IXuouFqV1FYrLrvrrQ4+g32H/aiAaiVlJXkihceRZHER8bPG2VZP5jPeEZAyRweaJNPoJGUuJQ+fzfRk4dCSl53KsK5Znvo2i6amNzL/9ZCpTT+Th27fUfvYgSLJ6t05OSuXYu2itAO2RiouNeoqQ2IEqT1i1Ii3rJ8e1+wTSPKqlcZcY506wrCobNxh/jfdMx5lple3yposCykXDmdggtdOeqG9cWtrLr9b0m2dcJwMsQuhZpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd9ee9EFA7w7Qmj4sWQdYGIWRmp9LafewTNB9lkRU/A=;
 b=AGchO6elV3+t0fJc1Qpy9/7tsNCy7IEXWKA2aCdIxp4u86Zwg23+0Np8GYOzx3D5uSk2c09hEXNIMsc8weqJUS59gRKsoVpEYJCwdu0rgBrhL3b+I1cUdGM13z0DRPAQ0Eio/0qZ5AnvI1lY5jiTutSmGAJ8M7bFd3sgf7alTRSsq/aThOyk5zPpiuq+bSOQJrrW4qZE1NS+fpWKBYTBoyO/fLHfGywMGrHu3+gcvAoAO3i2+TOkg/ytvnWjuG/a7KxWtQbLyksixQHU1jFzrtayTmItEzqCKSsD6EMToImpWLD5nNbxtQy0sjJOORSOIBuhY/r/RnGMvysdCOUYeg==
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AS8PR03MB6902.eurprd03.prod.outlook.com (2603:10a6:20b:29f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 16 Oct
 2020 09:42:39 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 09:42:39 +0000
From: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>,
        "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>
CC: Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "vicooodin@gmail.com"
	<vicooodin@gmail.com>,
        "julien@xen.org" <julien@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "committers@xenproject.org" <committers@xenproject.org>,
        "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: 
 AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgCAAXyKAIAAENkAgAlxpgCACF7sgIABM44AgASIOQA=
Date: Fri, 16 Oct 2020 09:42:39 +0000
Message-ID: <4d4f351b152df2c50e18676ccd6ab6b4dc667801.camel@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
	 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
	 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
	 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
	 <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
	 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
	 <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com>
	 <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com>
In-Reply-To: <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87c76393-290a-4f64-1b6b-08d871b7d24c
x-ms-traffictypediagnostic: AS8PR03MB6902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AS8PR03MB69024C9ADE675CBB7B79D333F2030@AS8PR03MB6902.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 72+qnb0xM0UPHf+VhNfxOVCPNrGY0v/Mhatc+fqGNEtJeyDffBxLcAtXZcYRNbc2ueGygRV6bZuDEXUbiPbgX+eUKU4xtNnALIgMXc0A7cI0Ta+yUOw81I2Evf+a6a2jrJpyBbpbfPKcoQXvmhjmcLULqQPqLAL4ZOmRRTX1vV9ibBqpYyK8U/Ss5F+A/FzO3jeI49OpYOzDt8njtuQ9X1w+yXspDhSO++j2tnNjl1zhkknb5nFasMSLGw3HqCqBWVMy+IGhMnnA2aWoMtKD/XcGmbXOsn6re/qazSJ/rtX3fGaN3t1Jsg+nvh59F3QyLsuFWhb19E93DzQjLYFPgNUq3lgRXmsXD0FV8cmPr6NjIVx4pMNBo0/KVDu8T18M/Hz/RpQsizeOD5Q3Zk1tdQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(5660300002)(478600001)(4001150100001)(86362001)(54906003)(2616005)(55236004)(6486002)(6506007)(110136005)(53546011)(316002)(186003)(26005)(4326008)(66556008)(8936002)(83380400001)(76116006)(71200400001)(8676002)(966005)(66476007)(2906002)(36756003)(6512007)(66446008)(107886003)(64756008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 M5XE2C8SqwIPnV8/tXv1k7aMNO/JgtUiIak+sc2Q4b8SbyD098RauDn4TgYca5nFSUoo1z06cLSPp++8Fwegw4hHyrLbKn88Bjiny17r2zK1vmiDZe9ZZ494Vo0zRNUWYGpIO+HIK9iD/gPoa5WHAU+100TqN7r/zVVERIL9D1t7dqWgyI5t8Zj72gu8nCoeRWACO8ys6kP6D445FWscQoby7IIM+FWZG1o+AKJBh9+GqaPJdfHWSQiQ1vhn0shimgJ4e0CN+YfDTaIWoycRLBgTbE/Ays/bRi15oMlI1jdN936HlboN2jMcdnwKGnrErVSKaaN8d20zaKzDLG7tMkKampWirWvrWSfYRWq8iyb1VHlt2hqdKdA6bWuJ2qEeVvNrYpeNXPIYXEHzZKKAVAeYe3I/lPf8YOF5kQy6PJBsxC6ZWFz0UJv9ZYBvmXmN0p7F3JJbAW7NkF1D+4KB0tROVi83sMZKT4jtCRtXvWJrJj/D+TELZn+JdL4XTO5z9DzvJVlP9yyBf0GnLyUqSlC+xvC/qbVef74vvLnQJm3wpJ1jXi4wtOlAbN8d5UD4VstC3MnIBxO9e4wgLgMse4UiSRRo0S4gMVzkZVpyXDle60X2xOurMYXgK1z8ped5fbb/5yVFdOX9lwntnC69Hg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D29E089B7C1B6D408B64E25A8B078CF9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c76393-290a-4f64-1b6b-08d871b7d24c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 09:42:39.2718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIrh4pEoB+gIHftpzBQgloG1HZOCNS/02/dzqscgWJwvG8NCtMFWHi974uCPCGKTTVCNc5D+t/rDwnEMTUkEzJLs9ACnHod3OcZe1fNz3Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6902
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-16_05:2020-10-16,2020-10-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010160069

SGkgYWxsLA0KDQpPbiBUdWUsIDIwMjAtMTAtMTMgYXQgMTQ6MzAgKzAyMDAsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPiBPbiAxMi4xMC4yMDIwIDIwOjA5LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPiA+
ID4gT24gT2N0IDcsIDIwMjAsIGF0IDExOjE5IEFNLCBBbmFzdGFzaWlhIEx1a2lhbmVua28gPA0K
PiA+ID4gQW5hc3Rhc2lpYV9MdWtpYW5lbmtvQGVwYW0uY29tPiB3cm90ZToNCj4gPiA+IFNvIEkg
d2FudCB0byBrbm93IGlmIHRoZSBjb21tdW5pdHkgaXMgcmVhZHkgdG8gYWRkIG5ldyBmb3JtYXR0
aW5nDQo+ID4gPiBvcHRpb25zIGFuZCBlZGl0IG9sZCBvbmVzLiBCZWxvdyBJIHdpbGwgZ2l2ZSBl
eGFtcGxlcyBvZiB3aGF0DQo+ID4gPiBjb3JyZWN0aW9ucyB0aGUgY2hlY2tlciBpcyBjdXJyZW50
bHkgbWFraW5nICh0aGUgZmlyc3QgdmFyaWFudCBpbg0KPiA+ID4gZWFjaA0KPiA+ID4gY2FzZSBp
cyBleGlzdGluZyBjb2RlIGFuZCB0aGUgc2Vjb25kIHZhcmlhbnQgaXMgZm9ybWF0dGVkIGJ5DQo+
ID4gPiBjaGVja2VyKS4NCj4gPiA+IElmIHRoZXkgZml0IHRoZSBzdGFuZGFyZHMsIHRoZW4gSSBj
YW4gZG9jdW1lbnQgdGhlbSBpbiB0aGUgY29kaW5nDQo+ID4gPiBzdHlsZS4gSWYgbm90LCB0aGVu
IEkgdHJ5IHRvIGNvbmZpZ3VyZSB0aGUgY2hlY2tlci4gQnV0IHRoZSBpZGVhDQo+ID4gPiBpcw0K
PiA+ID4gdGhhdCB3ZSBuZWVkIHRvIGNob29zZSBvbmUgb3B0aW9uIHRoYXQgd2lsbCBiZSBjb25z
aWRlcmVkDQo+ID4gPiBjb3JyZWN0Lg0KPiA+ID4gMSkgRnVuY3Rpb24gcHJvdG90eXBlIHdoZW4g
dGhlIHN0cmluZyBsZW5ndGggaXMgbG9uZ2VyIHRoYW4gdGhlDQo+ID4gPiBhbGxvd2VkDQo+ID4g
PiAtc3RhdGljIGludCBfX2luaXQNCj4gPiA+IC1hY3BpX3BhcnNlX2dpY19jcHVfaW50ZXJmYWNl
KHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlcg0KPiA+ID4gKmhlYWRlciwNCj4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQ0KPiA+ID4g
K3N0YXRpYyBpbnQgX19pbml0IGFjcGlfcGFyc2VfZ2ljX2NwdV9pbnRlcmZhY2UoDQo+ID4gPiAr
ICAgIHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqaGVhZGVyLCBjb25zdCB1bnNpZ25lZCBs
b25nDQo+ID4gPiBlbmQpDQo+ID4gDQo+ID4gSmFuIGFscmVhZHkgY29tbWVudGVkIG9uIHRoaXMg
b25lOyBpcyB0aGVyZSBhbnkgd2F5IHRvIHRlbGwgdGhlDQo+ID4gY2hlY2tlciB0byBpZ25vcmUg
IHRoaXMgZGlzY3JlcGFuY3k/DQo+ID4gDQo+ID4gSWYgbm90LCBJIHRoaW5rIHdlIHNob3VsZCBq
dXN0IGNob29zZSBvbmU7IEnigJlkIGdvIHdpdGggdGhlIGxhdHRlci4NCg0KSWYgaXQgdHVybnMg
b3V0IHRvIG1ha2UgdGhlIGNoZWNrZXIgbW9yZSBmbGV4aWJsZSwgdGhlbiBJIHdpbGwgdHJ5IHRv
DQphZGQgYm90aCBvcHRpb25zIGFzIGNvcnJlY3QuDQoNCj4gPiANCj4gPiA+IDIpIFdyYXBwaW5n
IGFuIG9wZXJhdGlvbiB0byBhIG5ldyBsaW5lIHdoZW4gdGhlIHN0cmluZyBsZW5ndGggaXMNCj4g
PiA+IGxvbmdlcg0KPiA+ID4gdGhhbiB0aGUgYWxsb3dlZA0KPiA+ID4gLSAgICBzdGF0dXMgPSBh
Y3BpX2dldF90YWJsZShBQ1BJX1NJR19TUENSLCAwLA0KPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICoqKSZzcGNyKTsNCj4gPiA+ICsg
ICAgc3RhdHVzID0NCj4gPiA+ICsgICAgICAgIGFjcGlfZ2V0X3RhYmxlKEFDUElfU0lHX1NQQ1Is
IDAsIChzdHJ1Y3QNCj4gPiA+IGFjcGlfdGFibGVfaGVhZGVyDQo+ID4gPiAqKikmc3Bjcik7DQo+
ID4gDQo+ID4gUGVyc29uYWxseSBJIHByZWZlciB0aGUgZmlyc3QgdmVyc2lvbi4NCj4gDQo+IFNh
bWUgaGVyZS4NCg0KVW50aWwgSSBmb3VuZCBhIHdheSB0byBzYXZlIHRoZSBmaXJzdCBvcHRpb24s
IEkgdGhpbmsgdGhpcyBjYXNlIG1heQ0KcmVtYWluIGluIHRoZSBvcGluaW9uIG9mIHRoZSBhdXRo
b3IuDQoNCj4gDQo+ID4gPiAzKSBTcGFjZSBhZnRlciBicmFja2V0cw0KPiA+ID4gLSAgICByZXR1
cm4gKChjaGFyICopIGJhc2UgKyBvZmZzZXQpOw0KPiA+ID4gKyAgICByZXR1cm4gKChjaGFyICop
YmFzZSArIG9mZnNldCk7DQo+ID4gDQo+ID4gVGhpcyBzZWVtcyBsaWtlIGEgZ29vZCBjaGFuZ2Ug
dG8gbWUuDQo+ID4gDQo+ID4gPiA0KSBTcGFjZXMgaW4gYnJhY2tldHMgaW4gc3dpdGNoIGNvbmRp
dGlvbg0KPiA+ID4gLSAgICBzd2l0Y2ggKCBkb21jdGwtPmNtZCApDQo+ID4gPiArICAgIHN3aXRj
aCAoZG9tY3RsLT5jbWQpDQo+ID4gDQo+ID4gVGhpcyBpcyBleHBsaWNpdGx5IGFnYWluc3QgdGhl
IGN1cnJlbnQgY29kaW5nIHN0eWxlLg0KDQpGaXhlZCB0aGlzIGluIHRoZSBuZXcgdmVyc2lvbiBv
ZiBjaGVja2VyLg0KDQo+ID4gDQo+ID4gPiA1KSBTcGFjZXMgaW4gYnJhY2tldHMgaW4gb3BlcmF0
aW9uDQo+ID4gPiAtICAgIGltbSA9ICggaW5zbiA+PiBCUkFOQ0hfSU5TTl9JTU1fU0hJRlQgKSAm
DQo+ID4gPiBCUkFOQ0hfSU5TTl9JTU1fTUFTSzsNCj4gPiA+ICsgICAgaW1tID0gKGluc24gPj4g
QlJBTkNIX0lOU05fSU1NX1NISUZUKSAmDQo+ID4gPiBCUkFOQ0hfSU5TTl9JTU1fTUFTSzsNCj4g
PiANCj4gPiBJICp0aGluayogdGhpcyBpcyBhbHJlYWR5IHRoZSBvZmZpY2lhbCBzdHlsZS4NCj4g
PiANCj4gPiA+IDYpIFNwYWNlcyBpbiBicmFja2V0cyBpbiByZXR1cm4NCj4gPiA+IC0gICAgICAg
IHJldHVybiAoICFzeW0tPm5hbWVbMl0gfHwgc3ltLT5uYW1lWzJdID09ICcuJyApOw0KPiA+ID4g
KyAgICAgICAgcmV0dXJuICghc3ltLT5uYW1lWzJdIHx8IHN5bS0+bmFtZVsyXSA9PSAnLicpOw0K
PiA+IA0KPiA+IFNpbWlsYXJseSwgSSB0aGluayB0aGlzIGlzIGFscmVhZHkgdGhlIG9mZmljaWFs
IHN0eWxlLg0KPiA+IA0KPiA+ID4gNykgU3BhY2UgYWZ0ZXIgc2l6ZW9mDQo+ID4gPiAtICAgIGNs
ZWFuX2FuZF9pbnZhbGlkYXRlX2RjYWNoZV92YV9yYW5nZShuZXdfcHRyLCBzaXplb2YNCj4gPiA+
ICgqbmV3X3B0cikgKg0KPiA+ID4gbGVuKTsNCj4gPiA+ICsgICAgY2xlYW5fYW5kX2ludmFsaWRh
dGVfZGNhY2hlX3ZhX3JhbmdlKG5ld19wdHIsDQo+ID4gPiBzaXplb2YoKm5ld19wdHIpICoNCj4g
PiA+IGxlbik7DQo+ID4gDQo+ID4gSSB0aGluayB0aGlzIGlzIGNvcnJlY3QuDQo+IA0KPiBJIGFn
cmVlIHdpdGggR2VvcmdlIG9uIGFsbCBvZiB0aGUgYWJvdmUuDQo+IA0KPiA+ID4gOCkgU3BhY2Vz
IGJlZm9yZSBjb21tZW50IGlmIGl04oCZcyBvbiB0aGUgc2FtZSBsaW5lDQo+ID4gPiAtICAgIGNh
c2UgUl9BUk1fTU9WVF9BQlM6IC8qIFMgKyBBICovDQo+ID4gPiArICAgIGNhc2UgUl9BUk1fTU9W
VF9BQlM6ICAgIC8qIFMgKyBBICovDQo+ID4gPiANCj4gPiA+IC0gICAgaWYgKCB0bXAgPT0gMFVM
ICkgICAgICAgLyogQXJlIGFueSBiaXRzIHNldD8gKi8NCj4gPiA+IC0gICAgICAgIHJldHVybiBy
ZXN1bHQgKyBzaXplOyAgIC8qIE5vcGUuICovDQo+ID4gPiArICAgIGlmICggdG1wID09IDBVTCAp
ICAgICAgICAgLyogQXJlIGFueSBiaXRzIHNldD8gKi8NCj4gPiA+ICsgICAgICAgIHJldHVybiBy
ZXN1bHQgKyBzaXplOyAvKiBOb3BlLiAqLw0KPiA+IA0KPiA+IFNlZW0gT0sgdG8gbWUuDQo+IA0K
PiBJIGRvbid0IHRoaW5rIHdlIGhhdmUgYW55IHJ1bGVzIGhvdyBmYXIgYXBhcnQgYSBjb21tZW50
IG5lZWRzDQo+IHRvIGJlOyBJIGRvbid0IHRoaW5rIHRoZXJlIHNob3VsZCBiZSBhbnkgY29tcGxh
aW50cyBvcg0KPiAiY29ycmVjdGlvbnMiIGhlcmUuDQo+IA0KPiA+ID4gOSkgU3BhY2UgYWZ0ZXIg
Zm9yX2VhY2hfdmNwdQ0KPiA+ID4gLSAgICAgICAgZm9yX2VhY2hfdmNwdShkLCB2KQ0KPiA+ID4g
KyAgICAgICAgZm9yX2VhY2hfdmNwdSAoZCwgdikNCj4gPiANCj4gPiBFciwgbm90IHN1cmUgYWJv
dXQgdGhpcyBvbmUuICBUaGlzIGlzIGFjdHVhbGx5IGEgbWFjcm87IGJ1dA0KPiA+IG9idmlvdXNs
eSBpdCBsb29rcyBsaWtlIGZvciAoICkuDQo+ID4gDQo+ID4gSSB0aGluayBKYW4gd2lsbCBwcm9i
YWJseSBoYXZlIGFuIG9waW5pb24sIGFuZCBJIHRoaW5rIGhl4oCZbGwgYmUNCj4gPiBiYWNrIHRv
bW9ycm93OyBzbyBtYXliZSB3YWl0IGp1c3QgYSBkYXkgb3IgdHdvIGJlZm9yZSBzdGFydGluZyB0
bw0KPiA+IHByZXAgeW91ciBzZXJpZXMuDQo+IA0KPiBUaGlzIG1ha2VzIGl0IGxvb2sgbGlrZSBM
aW51eCBzdHlsZS4gSW4gWGVuIGl0IG91Z2h0IHRvIGJlIG9uZQ0KPiBvZg0KPiANCj4gICAgICAg
ICBmb3JfZWFjaF92Y3B1KGQsIHYpDQo+ICAgICAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQ0K
PiANCj4gZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIGF1dGhvciBvZiBhIGNoYW5nZSBjb25zaWRl
cnMNCj4gZm9yX2VhY2hfdmNwdSBhbiBvcmRpbmFyeSBpZGVudGlmaWVyIG9yIGtpbmQgb2YgYSBr
ZXl3b3JkLg0KPiANCj4gPiA+IDEwKSBTcGFjZXMgaW4gZGVjbGFyYXRpb24NCj4gPiA+IC0gICAg
dW5pb24gaHNyIGhzciA9IHsgLmJpdHMgPSByZWdzLT5oc3IgfTsNCj4gPiA+ICsgICAgdW5pb24g
aHNyIGhzciA9IHsuYml0cyA9IHJlZ3MtPmhzcn07DQo+ID4gDQo+ID4gSeKAmW0gZmluZSB3aXRo
IHRoaXMgdG9vLg0KPiANCj4gSSB0aGluayB3ZSBjb21tb25seSBwdXQgdGhlIGJsYW5rcyB0aGVy
ZSB0aGF0IGFyZSBiZWluZyBzdWdnZXN0ZWQNCj4gdG8gZ2V0IGRyb3BwZWQsIHNvIEknbSBub3Qg
Y29udmluY2VkIHRoaXMgaXMgYSBjaGFuZ2Ugd2Ugd291bGQNCj4gd2FudCB0aGUgdG9vbCBtYWtp
bmcgb3Igc3VnZ2VzdGluZy4NCj4gDQo+IEphbg0KDQpUaGFua3MgZm9yIHlvdXIgYWR2aWNlcywg
d2hpY2ggaGVscGVkIG1lIGltcHJvdmUgdGhlIGNoZWNrZXIuIEkNCnVuZGVyc3RhbmQgdGhhdCB0
aGVyZSBhcmUgc3RpbGwgc29tZSBkaXNhZ3JlZW1lbnRzIGFib3V0IHRoZQ0KZm9ybWF0dGluZywg
YnV0IGFzIEkgc2FpZCBiZWZvcmUsIHRoZSBjaGVja2VyIGNhbm5vdCBiZSB2ZXJ5IGZsZXhpYmxl
DQphbmQgdGFrZSBpbnRvIGFjY291bnQgYWxsIHRoZSBhdXRob3IncyBpZGVhcy4NCkkgc3VnZ2Vz
dCB1c2luZyB0aGUNCmNoZWNrZXIgbm90IGFzIGEgbWFuZGF0b3J5IGNoZWNrLCBidXQgYXMgYW4g
aW5kaWNhdGlvbiB0byB0aGUgYXV0aG9yIG9mDQpwb3NzaWJsZSBmb3JtYXR0aW5nIGVycm9ycyB0
aGF0IGhlIGNhbiBjb3JyZWN0IG9yIGlnbm9yZS4NCg0KSSBhdHRhY2hlZCB0aGUgbmV3IHZlcnNp
b24gb2YgWGVuIGNoZWNrZXIgYmVsb3cgd2l0aCB1cGRhdGVkDQpjbGFuZyB2ZXJzaW9uIGZyb20g
OS4wIHRvIDEyLjAgYW5kIHdpdGggbWlub3IgZml4ZXMuDQooYnJhbmNoIHhlbi1jbGFuZy1mb3Jt
YXRfMTIpDQpodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy9sbHZtLXByb2plY3QvdHJlZS94
ZW4tY2xhbmctZm9ybWF0XzEyDQoNCklmIGR1cmluZyB0aGUgdXNpbmcgYW5kIHRlc3RpbmcgdGhl
IHRvb2wgbmV3IGluY29uc2lzdGVuY2llcyBhcmUgZm91bmQsDQpJIGFtIHJlYWR5IHRvIGZpeCB0
aGVtLg0KDQpSZWdhcmRzLA0KQW5hc3Rhc2lpYQ0K

