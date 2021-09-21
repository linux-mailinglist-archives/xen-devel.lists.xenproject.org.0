Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF77412EB2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 08:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191339.341320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZQc-0002gf-BP; Tue, 21 Sep 2021 06:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191339.341320; Tue, 21 Sep 2021 06:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZQc-0002er-7m; Tue, 21 Sep 2021 06:38:54 +0000
Received: by outflank-mailman (input) for mailman id 191339;
 Tue, 21 Sep 2021 06:38:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K4gq=OL=epam.com=prvs=989865dee5=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSZQb-0002el-5U
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 06:38:53 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95052c30-1aa6-11ec-b89b-12813bfff9fa;
 Tue, 21 Sep 2021 06:38:51 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L6UtLi015352; 
 Tue, 21 Sep 2021 06:38:48 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b7a6q00hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 06:38:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6068.eurprd03.prod.outlook.com (2603:10a6:208:166::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 06:38:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 06:38:43 +0000
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
X-Inumbo-ID: 95052c30-1aa6-11ec-b89b-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDS3GMioLO+zUJ1AyP1O2jSfAYvcjMwOUNfsNijc/Mh31LpLaqtKbJQ9MDdAMuc9yvkuja2/eyK6kioYRPT0mQRIpfVHFSny31hbVQeQ1t0BZtU9boXHBsWwb8E+inGiwBQEGfjy/mIsyzXt6fGKhlIixTaivwpVv+q0FQZSqWk4ixG/12I6+JpyGgnISFiduvimi2tgm90z/8VWWjma19ZWAXPAPDiOP1nInZqZVKS+1XFf3JOBl8EPOdXQGFMLukEIoYVz8EjsV0Z3EvUBEp2HrdwQGhUmy7bRjVQFic5Zh2CxG0jgfa1bHu/acK9fDXBAmEqBhzvrsVz6IhSy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=H9hg44KZ9/LdNjWTbRUEVjLA25bXz8mez1mEnkRsLVo=;
 b=aOIPG+o2nN6/J/WOpOeZ7et2ZlFdBHK/CSko2apd8t23CJDevJ7q3TbCDbo04TUWgQmEPcB4aV9ZiSO6g13Qxw3bLEmjCf85S8QftWk5aeyAnLAY6kPwHY0ZcoBjc9bZ4YLdxmql1TSwQANLuMEF8ifjs2WbBzdHPlKI18+p8e7SGh9Bq6QXCUYS9IFzrnzEDul+Dnnr9ORziKFQQQqiaARd1u1OY5998svwL/h22ckfdONTLtQbyLrB8oOhASNKwk75vzBY3LiF68ZbqQNAI7rJZiL/YWAlF1WL4197ZZ79yS9rDzAL+W6FnEIooEYW/XyQedEeZ7nq2nISbU+1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9hg44KZ9/LdNjWTbRUEVjLA25bXz8mez1mEnkRsLVo=;
 b=558r3exyH9YDLltWG8Lxpf9JSzfzmKUUgBFeLo/RkLgIqXyiqkdsIlmia5QMmS3GJVsZ01vUmVYVqAdy1ddPhlIc272NzJAJsAF9KuShKnVx8WmWBOum/2kzUpRl1YsOIZ2EXQAZ6wvGVY1f2rKEZgyG+MDeSpRTjpgu0yqmV0IWanypVYrX1MjD1MUndo0SsZ95xB3zy7D89qdAXak3r8Ot6K567b9gsvxDAd08uFvWu75QWmuMwk+2P1UF0ni1DlWbr320pA8UqwQmjAZNv4jJmZ+OnDdyYTB8eBvdhyZaPGPjbhjT4NGrNYtiLdsOu0VJ6y+pF09Q9Qu4M3CcPQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia
 Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: 
 AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuow0KAgAOkhICAAGZ9AIAAAmOAgADCywCAAGXhAIAACLuAgAAEUwCAAAi6AA==
Date: Tue, 21 Sep 2021 06:38:43 +0000
Message-ID: <a9b98bc4-4c8a-2e7e-6abf-3a68025059c4@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
 <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
 <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com>
 <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com>
In-Reply-To: <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3643d03f-cb97-403c-db8d-08d97cca74ea
x-ms-traffictypediagnostic: AM0PR03MB6068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB60688533CF4D2A001F90C24AE7A19@AM0PR03MB6068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BKtb+/ISESy+yO5pwbmT4SQ7jc2sWYy5Qt4I6jDdgG0tsGhk4Euu3o6XhHe6IxwCqu76uCFyul97WFh0MLCVpf8kWevMxxFKOm+nATTZOL94qC6irvKiutLVqYU2Uu9T/452/AXCVxDaK10F32JfVBGKg3/WMJZR+fA8iEyfhiYpvowHoH+am8oQBMvqbTzftxhqgm3hXSJMWJvIFm9mxCvezu2ZtarZCSEFfxMkt+/nilzeh4wKLNWW6btVbXqSZJY65HIhoCdHqzAriPFpRZ4Wfi70uwyCZP+lxMR5/udciSPcg0Ol2I1/UtlyLKDwnoWRpJGOKxXidt/pBDzm2EXFXOdPtrwaAjzKBqwSIX3vFMIpjSJ1sXO2ukffY9jyVhJLfuylNYkI3rQlTCPOTBP4d23ciilL1+Urj+Ftn5wUqKEXg4XC+5OeO6ONZPbfdxc6retl1SaElX/hLOf2eYgLuHdyjazl4Zc2xFb+vL845HZbXpM7PmDip8NoQEG4ndN+7mWjGNGnuuYFlFqrMZpBOVp9K/iVmCyMVvB0R/GHEL3/1CfDziZwq0ITRBSlDB6EiyHhOd4J7vB4CwnM1CCIdWbAEU4MARDDKQLt9VM//DI99FWJIrGj4dY3smJLffh8jmRFSdckqJqtkdOM1guFoVeeFZGAPrb8aYUI208TyIa2JG9YBvmSCdjyKkpojM79VxQ4i5udx353XkmanHZK7i0uBKNwdxEMfEalWTf009oCm9sbp3QYvWuFMkAG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(110136005)(55236004)(36756003)(54906003)(4326008)(8936002)(31686004)(83380400001)(8676002)(6486002)(2616005)(26005)(2906002)(316002)(38100700002)(6512007)(122000001)(71200400001)(31696002)(186003)(6506007)(508600001)(66476007)(66556008)(86362001)(53546011)(66446008)(64756008)(38070700005)(91956017)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aTVGc1BqVW03WDZSbmR1cUpSUTg5dmsvQ29JdUJBZHJKYWc3REhGbHBMeWpI?=
 =?utf-8?B?dGhwZHkwNnVMRjM1YjZxQy9PVVVWQ3lDQWZzRHRtM25VY1czZnBPS3FMakV3?=
 =?utf-8?B?QTV0S0M1SEtaTUlUUXRFYUZjcE9nRmRSS25tci9rS3l3aU1scEoxY1JWMGRy?=
 =?utf-8?B?ZkRUSjQ2TVdlcDVRcENMWGc5ZHZqQkx2NnRhRllnMnVUa3hndFpVZlplY0po?=
 =?utf-8?B?dFQwcW1Kalp4V1FudndVQWRrTDVpVjZYaHgzeHhnQ0IwQTJObXBvU0VKOHky?=
 =?utf-8?B?MldtVTVQcEVIUnVib0NLbHR6cUVvb3F0Q09FUUxtczdKS1UvMlhpUjE1Znpp?=
 =?utf-8?B?WGY5SDZuSG0zM3FaUk5CcjRoeHAwR1hQbjdFMHIxR2lPcDFaZUlMdGdKNGVm?=
 =?utf-8?B?RVJrYVpXWm44MUM1WXF4UEFheGlLQzRRQWFYb3NqWGZsVW5mQ3JVdk02d1BI?=
 =?utf-8?B?bEdTcjdSVUUvSFRkcVE2YVpUWkcyU0ZJVEpDUWVUcVhqUTEvdXAwVnM1Zm1w?=
 =?utf-8?B?WHlNamF2R1cxaDEwR3hVa2JYdjdDRWFrbzgycko5ZWVvVmpBWVEwZldya3Av?=
 =?utf-8?B?Wm9oblVxdG5MWDNpMGtTbklVUVBsZytrWWFGSHlvVG1jNDZlM2hYTFMzSWNt?=
 =?utf-8?B?bDRZVThyTkdCdTJiZHMrRFpVcHRtVkJ6TmpVbUg5bEhrV3VIWWQ2NW1uTFVt?=
 =?utf-8?B?VXZrUWpCWlBEQUMxUzNKN2NTbEJ4UFBjTkJwUzI3TWR5RFJhRkp6Q2FzZ2c5?=
 =?utf-8?B?eTVERGlYNytvYWhqajdRWlIrT0lSZUFQQUdSdU11S3JnR1dIZHBIN09tT2VI?=
 =?utf-8?B?cDJoUHRLckYzRDlpc0lxbDlrZzhTN250YmF1VzhibUxXZFBTOVZMOGpsS2R6?=
 =?utf-8?B?cnBDWFRld2hKRjZTWDN5WHhpbVFENVNQZFpVbzE2U3VLK0g3MXR4L2tlUHR1?=
 =?utf-8?B?RGFXd2VLelR1am9xQ1pvcGJ1aFo5aHQ2czd2dExXWGNOc1hqTFJuV1FhNDUv?=
 =?utf-8?B?bGFLbUhpUmpBOGk5VkNSUmpmM3RVN3pPeVB2ZFUyTlZkNjM2cTRnSURKeS9K?=
 =?utf-8?B?QUIyQWhwdjNLY0VxdlRLT1dxcHM4aHlEWkl6YUxWSWRQeWdlblBiNjM4VkI5?=
 =?utf-8?B?R2RMRko0Wnh6K0s2YkdpUU0rSVUyc0xyRVp5cFIzZEZwK3hYNk0vQ2ZGTUFr?=
 =?utf-8?B?Z1pyN0JrUjZsdWFzOEtkdGY2SGV4NEoxZE1ieERUQTIvWklQWGNBUmNrbkJr?=
 =?utf-8?B?S2d0YVFQaXpFQk56OGMxQUhQMkFla2RnQmtpRmtYb3oyL2lrZ0NnRDRqNEtB?=
 =?utf-8?B?L0lFOXNoRkNCckRQV3ljLy84bGU2eEpERXdBQ0ZRNjE4T2p1cVN5VXk0L2xs?=
 =?utf-8?B?eEJSQ2tuTitwdENzbW9zYWdjWTl4ZEdUWU9laVhTSHkzck92bkhkQ09xazhU?=
 =?utf-8?B?VHJaR2FaejZ1d3lGNTdWSE1jVFh1M2N3amc4WklkcDJ2d2NJa0IxSzIvM08r?=
 =?utf-8?B?Y1BoeHNUOWNLdlU5cmtjZ09YUzUvcGRSRVlpTEpzTFUvc3RETFJYL2w4Ymh0?=
 =?utf-8?B?eWM0T3hSVnBlTWlPTWRiNHZ0WWQ3TEd5QmtINU5kYUQ4ODgrZmNZUDNIMTNW?=
 =?utf-8?B?Z2xDZjl5V09WL0xJVTl3NVluRERXVG5xZmd2TDVVZGs5MFVwVncvUk9OYUFP?=
 =?utf-8?B?eXk1a01PQ3N4T1dmSGlRQjdSYzZSdXo5b3BlWExhRmFReUljRENBSWlnWUNH?=
 =?utf-8?B?QnVDOVp6OXdIL0VKRDZCb1JwaklLOU5MNFhkVjNoZUNkdkVKYkNZZ05Qa2xH?=
 =?utf-8?B?eUZ2eVluaXhGK3JGZUQ1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <261C2EFB4966614881012A5A765B0E1C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3643d03f-cb97-403c-db8d-08d97cca74ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 06:38:43.4839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGoCpTPjSwlDZVBp6ucaebnAtL2Dfu/Ia9MDXP/E1h05bAbUcNsjePb/R8XGYKkX0pfCG0qDh5DWYwqCCeXFDgCEZAzc2YOQnKzJE+Wsiqu5dDEBTGGkRSfInhZjzryL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6068
X-Proofpoint-GUID: _eH4U1tvwiQHtehXSWDaWBrx5dIPMQbV
X-Proofpoint-ORIG-GUID: _eH4U1tvwiQHtehXSWDaWBrx5dIPMQbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210042

DQpPbiAyMS4wOS4yMSAwOTowNywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjEuMDkuMjEg
MDc6NTEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+IE9uIDIxLjA5LjIx
IDA4OjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDIxLjA5LjIxIDAxOjE2LCBTdGVm
YW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgMjAgU2VwIDIwMjEsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4gT24gMjAuMDkuMjEgMTQ6MzAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4gT24gMjAuMDkuMjEgMDc6MjMsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+PiBIZWxsbywgU3RlZmFubyENCj4+Pj4+Pj4NCj4+Pj4+Pj4g
T24gMTguMDkuMjEgMDA6NDUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+Pj4+IEhp
IE9sZWtzYW5kciwNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBXaHkgZG8geW91IHdhbnQgdG8gZW5hYmxl
IHBjaWJhY2sgb24gQVJNPyBJcyBpdCBvbmx5IHRvICJkaXNhYmxlIiBhIFBDSQ0KPj4+Pj4+Pj4g
ZGV2aWNlIGluIERvbTAgc28gdGhhdCBpdCBjYW4gYmUgc2FmZWx5IGFzc2lnbmVkIHRvIGEgRG9t
VT8NCj4+Pj4+Pj4gTm90IG9ubHkgdGhhdA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEkgYW0gYXNraW5n
IGJlY2F1c2UgYWN0dWFsbHkgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGVuYWJsZSB0aGUgUFYg
UENJDQo+Pj4+Pj4+PiBiYWNrZW5kIGZlYXR1cmUgb2YgcGNpYmFjayBvbiBBUk0sIHJpZ2h0PyBU
aGF0IHdvdWxkIGNsYXNoIHdpdGggdGhlIFBDSQ0KPj4+Pj4+Pj4gYXNzaWdubWVudCB3b3JrIHlv
dSBoYXZlIGJlZW4gZG9pbmcgaW4gWGVuLiBUaGV5IGNvdWxkbid0IGJvdGggd29yayBhdA0KPj4+
Pj4+Pj4gdGhlIHNhbWUgdGltZS4NCj4+Pj4+Pj4gQ29ycmVjdCwgaXQgaXMgbm90IHVzZWQNCj4+
Pj4+Pj4+DQo+Pj4+Pj4+PiBJZiB3ZSBvbmx5IG5lZWQgcGNpYmFjayB0byAicGFyayIgYSBkZXZp
Y2UgaW4gRG9tMCwgd291bGRuJ3QgaXQgYmUNCj4+Pj4+Pj4+IHBvc3NpYmxlIGFuZCBiZXR0ZXIg
dG8gdXNlIHBjaS1zdHViIGluc3RlYWQ/DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE5vdCBvbmx5IHRoYXQs
IHNvIHBjaS1zdHViIGlzIG5vdCBlbm91Z2gNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhlIGZ1bmN0aW9u
YWxpdHkgd2hpY2ggaXMgaW1wbGVtZW50ZWQgYnkgdGhlIHBjaWJhY2sgYW5kIHRoZSB0b29sc3Rh
Y2sNCj4+Pj4+Pj4gYW5kIHdoaWNoIGlzIHJlbGV2YW50L21pc3NpbmcvbmVlZGVkIGZvciBBUk06
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IDEuIHBjaWJhY2sgaXMgdXNlZCBhcyBhIGRhdGFiYXNlIGZvciBh
c3NpZ25hYmxlIFBDSSBkZXZpY2VzLCBlLmcuIHhsDQo+Pj4+Pj4+IMKgwqDCoCDCoMKgIHBjaS1h
c3NpZ25hYmxlLXthZGR8cmVtb3ZlfGxpc3R9IG1hbmlwdWxhdGVzIHRoYXQgbGlzdC4gU28sIHdo
ZW5ldmVyIHRoZQ0KPj4+Pj4+PiDCoMKgwqAgwqDCoCB0b29sc3RhY2sgbmVlZHMgdG8ga25vdyB3
aGljaCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRocm91Z2ggaXQgcmVhZHMNCj4+Pj4+Pj4g
wqDCoMKgIMKgwqAgdGhhdCBmcm9tIHRoZSByZWxldmFudCBzeXNmcyBlbnRyaWVzIG9mIHRoZSBw
Y2liYWNrLg0KPj4+Pj4+Pg0KPj4+Pj4+PiAyLiBwY2liYWNrIGlzIHVzZWQgdG8gaG9sZCB0aGUg
dW5ib3VuZCBQQ0kgZGV2aWNlcywgZS5nLiB3aGVuIHBhc3NpbmcgdGhyb3VnaA0KPj4+Pj4+PiDC
oMKgwqAgwqDCoCBhIFBDSSBkZXZpY2UgaXQgbmVlZHMgdG8gYmUgdW5ib3VuZCBmcm9tIHRoZSBy
ZWxldmFudCBkZXZpY2UgZHJpdmVyIGFuZCBib3VuZA0KPj4+Pj4+PiDCoMKgwqAgwqDCoCB0byBw
Y2liYWNrIChzdHJpY3RseSBzcGVha2luZyBpdCBpcyBub3QgcmVxdWlyZWQgdGhhdCB0aGUgZGV2
aWNlIGlzIGJvdW5kIHRvDQo+Pj4+Pj4+IMKgwqDCoCDCoMKgIHBjaWJhY2ssIGJ1dCBwY2liYWNr
IGlzIGFnYWluIHVzZWQgYXMgYSBkYXRhYmFzZSBvZiB0aGUgcGFzc2VkIHRocm91Z2ggUENJDQo+
Pj4+Pj4+IMKgwqDCoCDCoMKgIGRldmljZXMsIHNvIHdlIGNhbiByZS1iaW5kIHRoZSBkZXZpY2Vz
IGJhY2sgdG8gdGhlaXIgb3JpZ2luYWwgZHJpdmVycyB3aGVuDQo+Pj4+Pj4+IMKgwqDCoCDCoMKg
IGd1ZXN0IGRvbWFpbiBzaHV0cyBkb3duKQ0KPj4+Pj4+Pg0KPj4+Pj4+PiAzLiBEZXZpY2UgcmVz
ZXQNCj4+Pj4+Pj4NCj4+Pj4+Pj4gV2UgaGF2ZSBwcmV2aW91c2x5IGRpc2N1c3NlZCBvbiB4ZW4t
ZGV2ZWwgTUwgcG9zc2libGUgc29sdXRpb25zIHRvIHRoYXQgYXMgZnJvbSB0aGUNCj4+Pj4+Pj4g
YWJvdmUgd2Ugc2VlIHRoYXQgcGNpYmFjayBmdW5jdGlvbmFsaXR5IGlzIGdvaW5nIHRvIGJlIG9u
bHkgcGFydGlhbGx5IHVzZWQgb24gQXJtLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBQbGVhc2Ugc2VlIFsx
XSBhbmQgWzJdOg0KPj4+Pj4+Pg0KPj4+Pj4+PiAxLiBJdCBpcyBub3QgYWNjZXB0YWJsZSB0byBt
YW5hZ2UgdGhlIGFzc2lnbmFibGUgbGlzdCBpbiBYZW4gaXRzZWxmDQo+Pj4+Pj4+DQo+Pj4+Pj4+
IDIuIHBjaWJhY2sgY2FuIGJlIHNwbGl0IGludG8gdHdvIHBhcnRzOiBQQ0kgYXNzaWduYWJsZS9i
aW5kL3Jlc2V0IGhhbmRsaW5nIGFuZA0KPj4+Pj4+PiB0aGUgcmVzdCBsaWtlIHZQQ0kgZXRjLg0K
Pj4+Pj4+Pg0KPj4+Pj4+PiAzLiBwY2lmcm9udCBpcyBub3QgdXNlZCBvbiBBcm0NCj4+Pj4+Pg0K
Pj4+Pj4+IEl0IGlzIG5laXRoZXIgaW4geDg2IFBWSC9IVk0gZ3Vlc3RzLg0KPj4+Pj4gRGlkbid0
IGtub3cgdGhhdCwgdGhhbmsgeW91IGZvciBwb2ludGluZw0KPj4+Pj4+DQo+Pj4+Pj4+IFNvLCBs
aW1pdGVkIHVzZSBvZiB0aGUgcGNpYmFjayBpcyBvbmUgb2YgdGhlIGJyaWNrcyB1c2VkIHRvIGVu
YWJsZSBQQ0kgcGFzc3Rocm91Z2gNCj4+Pj4+Pj4gb24gQXJtLiBJdCB3YXMgZW5vdWdoIHRvIGp1
c3QgcmUtc3RydWN0dXJlIHRoZSBkcml2ZXIgYW5kIGhhdmUgaXQgcnVuIG9uIEFybSB0byBhY2hp
ZXZlDQo+Pj4+Pj4+IGFsbCB0aGUgZ29hbHMgYWJvdmUuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IElmIHdl
IHN0aWxsIHRoaW5rIGl0IGlzIGRlc2lyYWJsZSB0byBicmVhayB0aGUgcGNpYmFjayBkcml2ZXIg
aW50byAiY29tbW9uIiBhbmQgInBjaWZyb250IHNwZWNpZmljIg0KPj4+Pj4+PiBwYXJ0cyB0aGVu
IGl0IGNhbiBiZSBkb25lLCB5ZXQgdGhlIHBhdGNoIGlzIGdvaW5nIHRvIGJlIHRoZSB2ZXJ5IGZp
cnN0IGJyaWNrIGluIHRoYXQgYnVpbGRpbmcuDQo+Pj4+Pj4NCj4+Pj4+PiBEb2luZyB0aGlzIHNw
bGl0IHNob3VsZCBiZSBkb25lLCBhcyB0aGUgcGNpZnJvbnQgc3BlY2lmaWMgcGFydCBjb3VsZCBi
ZQ0KPj4+Pj4+IG9taXR0ZWQgb24geDg2LCB0b28sIGluIGNhc2Ugbm8gUFYgZ3Vlc3RzIHVzaW5n
IFBDSSBwYXNzdGhyb3VnaCBoYXZlIHRvDQo+Pj4+Pj4gYmUgc3VwcG9ydGVkLg0KPj4+Pj4gQWdy
ZWUsIHRoYXQgdGhlIGZpbmFsIHNvbHV0aW9uIHNob3VsZCBoYXZlIHRoZSBkcml2ZXIgc3BsaXQN
Cj4+Pj4+Pg0KPj4+Pj4+PiBTbywgSSB0aGluayB0aGlzIHBhdGNoIGlzIHN0aWxsIGdvaW5nIHRv
IGJlIG5lZWRlZCBiZXNpZGVzIHdoaWNoIGRpcmVjdGlvbiB3ZSB0YWtlLg0KPj4+Pj4+DQo+Pj4+
Pj4gU29tZSBraW5kIG9mIHRoaXMgcGF0Y2gsIHllcy4gSXQgbWlnaHQgbG9vayBkaWZmZXJlbnQg
aW4gY2FzZSB0aGUgc3BsaXQNCj4+Pj4+PiBpcyBkb25lIGZpcnN0Lg0KPj4+Pj4+DQo+Pj4+Pj4g
SSBkb24ndCBtaW5kIGRvaW5nIGl0IGluIGVpdGhlciBzZXF1ZW5jZS4NCj4+Pj4+Pg0KPj4+Pj4g
V2l0aCB0aGlzIHBhdGNoIHdlIGhhdmUgQXJtIG9uIHRoZSBzYW1lIHBhZ2UgYXMgdGhlIGFib3Zl
IG1lbnRpb25lZCB4ODYgZ3Vlc3RzLA0KPj4+Pj4NCj4+Pj4+IGUuZy4gdGhlIGRyaXZlciBoYXMg
dW51c2VkIGNvZGUsIGJ1dCB5ZXQgYWxsb3dzIEFybSB0byBmdW5jdGlvbiBub3cuDQo+Pj4+Pg0K
Pj4+Pj4gQXQgdGhpcyBzdGFnZSBvZiBQQ0kgcGFzc3Rocm91Z2ggb24gQXJtIGl0IGlzIHlldCBl
bm91Z2guIExvbmcgdGVybSwgd2hlbg0KPj4+Pj4NCj4+Pj4+IHRoZSBkcml2ZXIgZ2V0cyBzcGxp
dCwgQXJtIHdpbGwgYmVuZWZpdCBmcm9tIHRoYXQgc3BsaXQgdG9vLCBidXQgdW5mb3J0dW5hdGVs
eSBJIGRvIG5vdA0KPj4+Pj4NCj4+Pj4+IGhhdmUgZW5vdWdoIGJhbmR3aWR0aCBmb3IgdGhhdCBw
aWVjZSBvZiB3b3JrIGF0IHRoZSBtb21lbnQuDQo+Pj4+DQo+Pj4+IFRoYXQncyBmYWlyIGFuZCBJ
IGRvbid0IHdhbnQgdG8gc2NvcGUtY3JlZXAgdGhpcyBzaW1wbGUgcGF0Y2ggYXNraW5nIGZvcg0K
Pj4+PiBhbiBlbm9ybW91cyByZXdvcmsuIEF0IHRoZSBzYW1lIHRpbWUgSSBkb24ndCB0aGluayB3
ZSBzaG91bGQgZW5hYmxlIHRoZQ0KPj4+PiB3aG9sZSBvZiBwY2liYWNrIG9uIEFSTSBiZWNhdXNl
IGl0IHdvdWxkIGJlIGVycm9uZW91cyBhbmQgY29uZnVzaW5nLg0KPj4NCj4+IEFzIHRoZSBmaXJz
dCBzdGFnZSBiZWZvcmUgdGhlIGRyaXZlciBpcyBzcGxpdCBvciBpZmRlZidzIHVzZWQgLSBjYW4g
d2UgdGFrZSB0aGUgcGF0Y2gNCj4+IGFzIGlzIG5vdz8gSW4gZWl0aGVyIHdheSB3ZSBjaG9zZSB0
aGlzIG5lZWRzIHRvIGJlIGRvbmUsIGUuZy4gZW5hYmxlIGNvbXBpbGluZw0KPj4gZm9yIG90aGVy
IGFyY2hpdGVjdHVyZXMgYW5kIGNvbW1vbiBjb2RlIG1vdmUuDQo+DQo+IEZpbmUgd2l0aCBtZSBp
biBwcmluY2lwbGUuIEkgbmVlZCB0byB0YWtlIGEgbW9yZSB0aG9yb3VnaCBsb29rDQo+IGF0IHRo
ZSBwYXRjaCwgdGhvdWdoLg0KT2YgY291cnNlDQo+DQo+Pg0KPj4+Pg0KPj4+PiBJIGFtIHdvbmRl
ciBpZiB0aGVyZSBpcyBhIHNpbXBsZToNCj4+Pj4NCj4+Pj4gaWYgKCF4ZW5fcHZfZG9tYWluKCkp
DQo+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4+Pg0KPj4+PiBUaGF0IHdlIGNvdWxkIGFkZCBp
biBhIGNvdXBsZSBvZiBwbGFjZXMgaW4gcGNpYmFjayB0byBzdG9wIGl0IGZyb20NCj4+Pj4gaW5p
dGlhbGl6aW5nIHRoZSBwYXJ0cyB3ZSBkb24ndCBjYXJlIGFib3V0LiBTb21ldGhpbmcgYWxvbmcg
dGhlc2UgbGluZXMNCj4+Pj4gKHVudGVzdGVkIGFuZCBwcm9iYWJseSBpbmNvbXBsZXRlKS4NCj4+
Pj4NCj4+Pj4gV2hhdCBkbyB5b3UgZ3V5cyB0aGluaz8NCj4+Pg0KPj4+IFVoIG5vLCBub3QgaW4g
dGhpcyB3YXksIHBsZWFzZS4gVGhpcyB3aWxsIGtpbGwgcGNpIHBhc3N0aHJvdWdoIG9uIHg4Ng0K
Pj4+IHdpdGggZG9tMCBydW5uaW5nIGFzIFBWSC4gSSBkb24ndCB0aGluayB0aGlzIGlzIHdvcmtp
bmcgcmlnaHQgbm93LCBidXQNCj4+PiBhZGRpbmcgbW9yZSBjb2RlIG1ha2luZyBpdCBldmVuIGhh
cmRlciB0byB3b3JrIHNob3VsZCBiZSBhdm9pZGVkLg0KPj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNr
L3hlbmJ1cy5jDQo+Pj4+IGluZGV4IGRhMzRjZTg1ZGM4OC4uOTkxYmEwYTliMzU5IDEwMDY0NA0K
Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYw0KPj4+PiArKysgYi9k
cml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYw0KPj4+PiBAQCAtMTUsNiArMTUsNyBAQA0K
Pj4+PiDCoMKgICNpbmNsdWRlIDx4ZW4veGVuYnVzLmg+DQo+Pj4+IMKgwqAgI2luY2x1ZGUgPHhl
bi9ldmVudHMuaD4NCj4+Pj4gwqDCoCAjaW5jbHVkZSA8eGVuL3BjaS5oPg0KPj4+PiArI2luY2x1
ZGUgPHhlbi94ZW4uaD4NCj4+Pj4gwqDCoCAjaW5jbHVkZSAicGNpYmFjay5oIg0KPj4+PiDCoMKg
IMKgICNkZWZpbmUgSU5WQUxJRF9FVlRDSE5fSVJRwqAgKC0xKQ0KPj4+PiBAQCAtNjg1LDggKzY4
NiwxMiBAQCBzdGF0aWMgaW50IHhlbl9wY2lia194ZW5idXNfcHJvYmUoc3RydWN0IHhlbmJ1c19k
ZXZpY2UgKmRldiwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnN0IHN0cnVjdCB4ZW5idXNfZGV2aWNlX2lkICppZCkNCj4+Pj4gwqDCoCB7DQo+Pj4+IMKgwqDC
oMKgwqDCoCBpbnQgZXJyID0gMDsNCj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgeGVuX3BjaWJrX2Rldmlj
ZSAqcGRldiA9IGFsbG9jX3BkZXYoZGV2KTsNCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgeGVuX3BjaWJr
X2RldmljZSAqcGRldjsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGlmICgheGVuX3B2X2RvbWFpbigp
KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+IMKgwqAgK8KgwqDCoCBwZGV2
ID0gYWxsb2NfcGRldihkZXYpOw0KPj4+DQo+Pj4gVGhpcyBodW5rIGlzbid0IG5lZWRlZCwgYXMg
d2l0aCBiYWlsaW5nIG91dCBvZiB4ZW5fcGNpYmtfeGVuYnVzX3JlZ2lzdGVyDQo+Pj4gZWFybHkg
d2lsbCByZXN1bHQgaW4geGVuX3BjaWJrX3hlbmJ1c19wcm9iZSBuZXZlciBiZWluZyBjYWxsZWQu
DQo+Pj4NCj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChwZGV2ID09IE5VTEwpIHsNCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZXJyID0gLUVOT01FTTsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
eGVuYnVzX2Rldl9mYXRhbChkZXYsIGVyciwNCj4+Pj4gQEAgLTc0Myw2ICs3NDgsOSBAQCBjb25z
dCBzdHJ1Y3QgeGVuX3BjaWJrX2JhY2tlbmQgKl9fcmVhZF9tb3N0bHkgeGVuX3BjaWJrX2JhY2tl
bmQ7DQo+Pj4+IMKgwqAgwqAgaW50IF9faW5pdCB4ZW5fcGNpYmtfeGVuYnVzX3JlZ2lzdGVyKHZv
aWQpDQo+Pj4+IMKgwqAgew0KPj4+PiArwqDCoMKgIGlmICgheGVuX3B2X2RvbWFpbigpKQ0KPj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+ICsNCj4+Pg0KPj4+IFVzZSAjaWZkZWYg
Q09ORklHX1g4NiBpbnN0ZWFkLg0KPj4NCj4+IFRoZSB0aXRsZSBvZiB0aGlzIHBhdGNoIHNheXMg
dGhhdCB3ZSB3YW50IHRvIGFsbG93IHRoaXMgZHJpdmVyIGZvciBvdGhlciBhcmNocw0KPj4gYW5k
IG5vdyB3ZSB3YW50IHRvIGludHJvZHVjZSAiI2lmZGVmIENPTkZJR19YODYiIHdoaWNoIGRvZXNu
J3Qgc291bmQNCj4+IHJpZ2h0IHdpdGggdGhhdCByZXNwZWN0LiBJbnN0ZWFkLCB3ZSBtYXkgd2Fu
dCBoYXZpbmcgc29tZXRoaW5nIGxpa2UgYQ0KPj4gZGVkaWNhdGVkIGdhdGUgZm9yIHRoaXMsIGUu
Zy4gIiNpZmRlZiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EX1NVUFBfUFYiDQo+PiBvciBzb21l
dGhpbmcgd2hpY2ggaXMgYXJjaGl0ZWN0dXJlIGFnbm9zdGljLg0KPg0KPiBTb21ldGhpbmcgbGlr
ZSB0aGF0LCB5ZXMuIEJ1dCBJJ2QgcmF0aGVyIHVzZSBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5E
DQo+IGFjdGluZyBhcyB0aGlzIGdhdGUgYW5kIGludHJvZHVjZSBDT05GSUdfWEVOX1BDSV9TVFVC
IGZvciB0aGUgc3R1Yg0KPiBmdW5jdGlvbmFsaXR5IG5lZWRlZCBvbiBBcm0uIFhFTl9QQ0lERVZf
QkFDS0VORCB3b3VsZCBkZXBlbmQgb24gWDg2IGFuZA0KPiBzZWxlY3QgWEVOX1BDSV9TVFVCLCB3
aGlsZSBvbiBBcm0gWEVOX1BDSV9TVFVCIGNvdWxkIGJlIGNvbmZpZ3VyZWQgaWYNCj4gd2FudGVk
LiBUaGUgc3BsaXR0aW5nIG9mIHRoZSBkcml2ZXIgY2FuIHN0aWxsIGJlIGRvbmUgbGF0ZXIuDQoN
CkhtLCBwY2liYWNrIGlzIG5vdyBjb21waWxlZCB3aGVuIENPTkZJR19YRU5fUENJREVWX0JBQ0tF
TkTCoCBpcyBlbmFibGVkDQoNCmFuZCB3ZSB3YW50IHRvIHNraXAgc29tZSBwYXJ0cyBvZiBpdHMg
Y29kZSB3aGVuIENPTkZJR19YRU5fUENJX1NUVUIgaXMgc2V0Lg0KDQpTbywgSSBpbWFnaW5lIHRo
YXQgZm9yIHg4NiB3ZSBqdXN0IGVuYWJsZSBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EIGFuZCB0
aGUNCg0KZHJpdmVyIGNvbXBpbGVzIGluIGl0cyBjdXJyZW50IHN0YXRlLiBGb3IgQXJtIHdlIGVu
YWJsZSBib3RoIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQNCg0KYW5kIENPTkZJR19YRU5fUENJ
X1NUVUIsIHNvIHBhcnQgb2YgdGhlIGRyaXZlciBpcyBub3QgY29tcGlsZWQuDQoNCg0KPg0KPj4g
R2F0aW5nIGFsc28gbWVhbnMgdGhhdCB3ZSBhcmUgbm90IHRoaW5raW5nIGFib3V0IHNwbGl0dGlu
ZyB0aGUgYmFja2VuZCBkcml2ZXIgaW50bw0KPj4gdHdvIGRpZmZlcmVudCBvbmVzLCBlLmcuIG9u
ZSBmb3IgImNvbW1vbiIgY29kZSBhbmQgb25lIGZvciBQViBzdHVmZi4NCj4+IE90aGVyd2lzZSB0
aGlzIGlmZGVmZXJ5IHdvbid0IGJlIG5lZWRlZC4NCj4NCj4gSSBqdXN0IHdhbnRlZCB0byBhdm9p
ZCB0aGUgeGVuX3B2X2RvbWFpbigpIHRlc3RzIGNyZWVwaW5nIGluLCBhcw0KPiB0aGV5IGFyZSB3
cm9uZyBJTU8uDQo+DQpJIHVuZGVyc3RhbmQgdGhhdA0KPg0KPiBKdWVyZ2Vu

