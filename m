Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB61442BC5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220022.381099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrG3-0007sD-Ny; Tue, 02 Nov 2021 10:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220022.381099; Tue, 02 Nov 2021 10:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrG3-0007pk-Kt; Tue, 02 Nov 2021 10:43:11 +0000
Received: by outflank-mailman (input) for mailman id 220022;
 Tue, 02 Nov 2021 10:43:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhrG2-0007pe-4z
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:43:10 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3431796-1e18-4294-aa31-29777a72d721;
 Tue, 02 Nov 2021 10:43:08 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2ATbwD018749;
 Tue, 2 Nov 2021 10:43:07 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c33mfg31g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 10:43:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7346.eurprd03.prod.outlook.com (2603:10a6:20b:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 10:43:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:43:03 +0000
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
X-Inumbo-ID: d3431796-1e18-4294-aa31-29777a72d721
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U64Fvl/1EkrEcMKwUuGFjy3IzGl1A6POjP4zw1lJhnes45RXEybnieXCszP4xDXi6Goo3rCoeV0FWyEjZVbJQ5U2W5X0QjTYgHbKI9w1iXB2mbFtuo554uq/ECPDPnYd/+UqemG494EDpP6W1pNpiHyYTgSNjJgo6dnzEePqgtbrToy5GD45GPhh+nanDnYkzri7Ul+bIjcqY29c8XEFkI0wZs+gi/F2QWXOo9ABh/dIw1ROKaZtCRdyYVpmFWZaoaKHS16rqA83DVxuzFPFWgtayS5LQ1pEc17RO1c7IGuTcsvBobnS8AgmeNvwsWpPiRI99ZSDXt/lJB7DGB8skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wGoorqIDbP10sgpi04w/4BMcuge+HKiCwmTxSvyyCk=;
 b=YO4B3icLDtvnRqauPM4DEtc6amGB3/J4jZL5kO6cSGcpSuHQyNwDyidFZBPOTXGAUEXZ9T9WVPDLMIKnmQ4GB84oZMwAlj5lxhRqSC3Djo+TOkWAN3XWxo8vnXrWs+hXILq/VWYsy10gd3SIfEQ6Io/LAzLP2wi6CK8EJm9KRGCuJ3OnipsB9TVj18lBUrkxw/FI9riPygDu6O+8IxrfWpmQV/wyLIClvdqCt14vKSrH0r3ItK7j0NY8HmLyRupG+8kseVwKPR5J5vO8ElmE60iSTrc7f6kvivpj1ZNa7AblkI4WbO/Stqwxlxt3jtI2wBvo21GJZkOnWP0nDdh47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wGoorqIDbP10sgpi04w/4BMcuge+HKiCwmTxSvyyCk=;
 b=LCYI09rlPaD7Nr3U7ck6tDxdeEGMxqPto8APiK1fMaLvrwfN3cC62MYhDUh49OEUcb/omz2blhfD3e5w3vaVQBlSImj2H66zdGR0f76UU4VtQsTi0bYDaSlPH8tUZX90huuVXvIvBfUU6azn6qst0huLimijeizMgGadvC2+tMqLgMpWp6W2JfG4KyszQY/fB2fxeX0sggQfHx+SB6gDw2cHqTYVsxN0e9r5Fk1l2iOP/DFMBtl8GtrjRNjjW2ss49vw4MrFvogu/qhsgB61fr7GSUmgoIUYgsVPKM1nYpEjO7F+r6HF2lfUkQ/ockfZAU2w1AtH6siBWT6jWdc+bw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 07/11] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v3 07/11] vpci/header: program p2m with guest BAR view
Thread-Index: AQHXtdAjmfMhzz5BYkuDgpOXg2armqvlPuEAgAsCUAA=
Date: Tue, 2 Nov 2021 10:43:03 +0000
Message-ID: <fd2fb89a-3435-8d9b-e744-a9cc959798e3@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-8-andr2000@gmail.com>
 <YXfaCgRpQJbBNaD2@MacBook-Air-de-Roger.local>
In-Reply-To: <YXfaCgRpQJbBNaD2@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f8b2499-8dbd-461e-597f-08d99ded8c13
x-ms-traffictypediagnostic: AM9PR03MB7346:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7346B926F17C31396E5D84DDE78B9@AM9PR03MB7346.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 shehHfGCgG2uOEAIek8MsdEBdSEGaavxnNEWkHSzCOwQ1QrfYlhTSKihCItjxS8YEoWMNler2J2xZjr7anWI6UnzL8GG8ipR+sNM0nVlYHl3X8VBjmtp/fU9y+YzTtikexP+liHujfqsVOsl/PiOpsHMG8uHbL4FcfsYXw/7vl6YS9EAXaHEF8ZFlV/2eCqHmlYkeaqoHzbJwCV1mELAWLlIS2GaxfUXBnyxvnL0XVSG7NmajjHHnMtAqKW83KQa7kudeb2QSO68gcqL/Rfuac81v8vAHE2piP3Vjza0fTLP09Oip9t5Cobq5SQCiYlBM17qc95AfUs4d+fQ30sl+WyN5lc2OvlgmH/yv7qfyj9uVoD1aYtK0uDQpviDk7uogano1qHmM3jrQKKEh75ZST7VJHm8KA6E+4hAkzhf/HxCp/hAUz2nfhm1lHHPlGEZtiqdhxZAW3fdHTTRcjT81nSrpRX8Zvb5RxQfGzHHjqlCmyf6EiPJbVdwhnLKzFEu8CHBd+Turvidv3Sl9h6zmi4XBSfLCZVNYu1CXWUGtJTFqrE8cBUltnwcmGl3ihuAcQd8KYFf4ji5l4z5N9vlP6EUa9wipenTqB0fgFriwXiwe316w5VRGgH3PFVpBMY0xoTMxeeLcDPiy1OBxWD5ohp+WQsaM7bktARAkYo+ZqTIH6+hmkN/4rsPgFPqOzl1eF0g2NoDFlXZGlcou115ksaSyKJzuSxwF5quQnRK0hr2p46oFLcXMeM81nkTOxhE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(76116006)(6512007)(38100700002)(64756008)(83380400001)(53546011)(6506007)(8936002)(6916009)(66446008)(66946007)(66476007)(31686004)(66556008)(71200400001)(2616005)(2906002)(8676002)(86362001)(36756003)(5660300002)(107886003)(26005)(6486002)(31696002)(4326008)(122000001)(54906003)(316002)(186003)(508600001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QzQ2ZGpUc2dLNUxDZFQxTEdhLzdteFpTRURLUTR6cnBOQzZHUmxYU2RtcExm?=
 =?utf-8?B?dDZYUmZ5dlBhRWhlQ3hyM0pHVHFMWEU5YmlQeXFIc1pEbnVRRTI5cXFaRGdk?=
 =?utf-8?B?bkJ0TnpMblZDTlgvWlFtRVR3NzIrcFNaM3k5UXlibXJTNTZ6bzBWYko1Qm5Z?=
 =?utf-8?B?amhmaGZYaCtkekZRd1dWaXpWci9JM2FmYVJOaEkyQms5N1EvMGs3bHdTaENS?=
 =?utf-8?B?MWc1U3p1SFVYOUNxblByYldLMlkyZ1EyejlxcTFZSGJmZGl1TjFXVnVEeit1?=
 =?utf-8?B?ZWhLU1BVeXYzN1I3UllJTzBvYXZ0cWZZaFNWTlp0UWJJR25vZzRPVDJGYldp?=
 =?utf-8?B?SE56a0ZxN0tjK0V1aWxhZlEyZVNaSUJQajhYUnBCVGlzb0QrcGRzQldzYk5N?=
 =?utf-8?B?RHhtSklRTjlTVFlWYmZ2VzdQZTVvZ2tpU3B4TU1MZGg3S2Nld3Z4WHJJajZD?=
 =?utf-8?B?SlhOdk96T2FZN2VrRXFOYWZQaHhTbzFmMEs1TkFLazhBNmtuNFlGSldBeTZB?=
 =?utf-8?B?QkhKVEIxcUlHblNGano4RWZMNi91Y0xvYjV0NThlSkJUbkNYUW9MMWlVTDd6?=
 =?utf-8?B?UmJEdERmUmJzNy9nRG93bEVxK285dHVCVGt5V3BSYmVRSXdjRHpYajY4aGxB?=
 =?utf-8?B?bXNrTDRFV3FXaTRJRlQ3NkpRZjRiYmt0RXV0YU1TRTVCZTExclB3UXU0Nnow?=
 =?utf-8?B?N1BPZWlPd0hXZkROdXVKWmdsNDRLMUczeURla010cFFPejR5MklPZ1lWQ1Vj?=
 =?utf-8?B?ZnNVWTZIWTV4T2dZT0NHS0l5cVkxVkJwOUJpc3JKOHZBWGNsenVLRDBBc3BH?=
 =?utf-8?B?MVVTeTg1NVVjd2lkUXArcFRzK0F0bVRVcjVpaXVMWldpWGxrZkJBTnNwOUhN?=
 =?utf-8?B?clFwUEpGeHVXMkJ0OTZoNzcxdlp1dDhDZFpzVTB1Z2I3MVNEOXFLeHp2ZzFK?=
 =?utf-8?B?VGNya2pkQlcvSG9nSkZucjJXVGxCci80MmhSblJNVUVwOW1ibi9yM3dWSXJh?=
 =?utf-8?B?NkM3VEc4RUNIVERZRXVIcFhXUytkaE91Q1V2dndSV2htdGFTNkZQSVdnN2s2?=
 =?utf-8?B?VnlRb29zaFJKWFJUeVJJSUNCdDF6ZGRSUStzOExRRTBGN0Q4L1ROMzlHVllM?=
 =?utf-8?B?elA4WDdaeS9KajF2dzZPVzBjaHVkazVpejZML28vZVpON2x2VWtXSldDODIx?=
 =?utf-8?B?TUxteHhIWnVoUW5zL0paT01kMGVnaXJURVNtYVhUVERUcVk4alY2NERjN3Bz?=
 =?utf-8?B?MnNaUDNNRno0bjVyZkl4OFBhQzE3Tk82amh0WThtdEgxQ0U2bFE4Mkgwcnli?=
 =?utf-8?B?WG9ieHBTUjNXV2NHSVFrQ0lCZVVQRE9JNDJFL3lKUWprWXhRdVpEUy9VYUtK?=
 =?utf-8?B?Vm9uelVUTkZEMnJ6NC84SzhqTHRrb1ZRR2xMS09ueGdkcmlHbVVvRUFabDJk?=
 =?utf-8?B?ZjJjbm1YMG1VdWFoV3hGcXhEZy90ZkpBK3paOTJVODd3bTFrM1phM1Mwd3JT?=
 =?utf-8?B?T2FLRU1DZ0R2bVZQYXRrZk90R2ZjY0RCczJ4TEUwdCswUWk3UlF0bU1jOUJm?=
 =?utf-8?B?Q2dBZXdxQjlnOW9rdVJyQVhjdXN2VWMxRkdsMi9ZSXNzY0VDUStOcFdLTW1o?=
 =?utf-8?B?RDdmOFpnSjBiSE5NUzM5VGFPQkJWQ051TW5wRFpSWFF5cncrdWN6NDBmVUFE?=
 =?utf-8?B?RkJrWHVnN3VBMTRyVDZ2QTBGUzV1RXZHUXFPb2VYRFZjVTZsNXc3OHoxam9Q?=
 =?utf-8?B?NTFpY1RZb1dtOHFka25pYldDV2lNdEZybnU5ODBtZEZyMjlmSCtOcWs3ZGRE?=
 =?utf-8?B?SnVyNy9janJRYUJTWllUejdZWlk5aFRYaGIwdnd6MXUzN1hlV2JneE5TZTJG?=
 =?utf-8?B?bjkzMHVaZHRyZVdjL2JEcHNLWjBLNUJoeWFEaE44WkVhQXRqNGI5UmRzV2Yr?=
 =?utf-8?B?WXFuQ2lKVU54cGEvMWJNVjczL3p2YWZrTmZDRkpBYWtmTDJ1SXNWUWNjQjBC?=
 =?utf-8?B?RWZxRmhWOGZqZmd1Sk5MUld0Wk84Uy93VGFDaEVubFRJVWtSWVhFcjFVemY4?=
 =?utf-8?B?YmxJaTBwQzFpRFZ0dWwwYzNLblJ5NlJvVkNkK1RDaVBEcTgvdXE2YnZGenZk?=
 =?utf-8?B?NURLYnFTaXNkOVhPOWpFWmxtbWlhczFEWjFZYUMxT2F2T3pWSVBWV2Zsc1M4?=
 =?utf-8?B?enNCNXBUZ2JweFc4c0oxbGV6cTEzNXRJd0VKaXJQUmJOTlBPWnR3WGxEU2gw?=
 =?utf-8?B?bW4rb1diN1V6aENJcWZUZ3dCakJvbUlNV08wS3NJQ0ZPK0xEdzdlMndoTGRr?=
 =?utf-8?B?eEtyV2VtYm9wM2pJaklBampVRHBpYXlpWGxJc25YNmg3Yk5GSGJDdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7098686FEB2CCC44B3C04733B51680A7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b2499-8dbd-461e-597f-08d99ded8c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 10:43:03.1279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1UOEHpO+OQFOi1O+9n8YkefxaVdB+zUxEvKndBfQg9bFbNQu7iu+YUXAkonCxEXBtgYxFFU4UF9bYXDHiBEBllQHiUzPLppAE44Bz8RW6EzQeUiBxfkAyMBjO70AJEyx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7346
X-Proofpoint-ORIG-GUID: R9pOjZTiY8Zp3XQiJxsDGTuedOAse1R2
X-Proofpoint-GUID: R9pOjZTiY8Zp3XQiJxsDGTuedOAse1R2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020063

SGksIFJvZ2VyIQ0KDQpPbiAyNi4xMC4yMSAxMzozNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MTlBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGFrZSBpbnRvIGFjY291bnQg
Z3Vlc3QncyBCQVIgdmlldyBhbmQgcHJvZ3JhbSBpdHMgcDJtIGFjY29yZGluZ2x5Og0KPj4gZ2Zu
IGlzIGd1ZXN0J3MgdmlldyBvZiB0aGUgQkFSIGFuZCBtZm4gaXMgdGhlIHBoeXNpY2FsIEJBUiB2
YWx1ZSBhcyBzZXQNCj4+IHVwIGJ5IHRoZSBob3N0IGJyaWRnZSBpbiB0aGUgaGFyZHdhcmUgZG9t
YWluLg0KPj4gVGhpcyB3YXkgaGFyZHdhcmUgZG9hbWluIHNlZXMgcGh5c2ljYWwgQkFSIHZhbHVl
cyBhbmQgZ3Vlc3Qgc2Vlcw0KPj4gZW11bGF0ZWQgb25lcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+DQo+Pg0KPj4gLS0tDQo+PiBTaW5jZSB2MjoNCj4+IC0gaW1wcm92ZSByZWFkYWJpbGl0eSBm
b3IgZGF0YS5zdGFydF9nZm4gYW5kIHJlc3RydWN0dXJlID86IGNvbnN0cnVjdA0KPj4gU2luY2Ug
djE6DQo+PiAgIC0gcy9NU0kvTVNJLVggaW4gY29tbWVudHMNCj4+IC0tLQ0KPj4gICB4ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IGluZGV4IDljNjAzZDI2ZDMwMi4uZjIzYzk1NmNkZTZjIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gKysrIGIveGVuL2Ry
aXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gQEAgLTMwLDYgKzMwLDEwIEBADQo+PiAgIA0KPj4gICBz
dHJ1Y3QgbWFwX2RhdGEgew0KPj4gICAgICAgc3RydWN0IGRvbWFpbiAqZDsNCj4+ICsgICAgLyog
U3RhcnQgYWRkcmVzcyBvZiB0aGUgQkFSIGFzIHNlZW4gYnkgdGhlIGd1ZXN0LiAqLw0KPj4gKyAg
ICBnZm5fdCBzdGFydF9nZm47DQo+PiArICAgIC8qIFBoeXNpY2FsIHN0YXJ0IGFkZHJlc3Mgb2Yg
dGhlIEJBUi4gKi8NCj4+ICsgICAgbWZuX3Qgc3RhcnRfbWZuOw0KPj4gICAgICAgYm9vbCBtYXA7
DQo+PiAgIH07DQo+PiAgIA0KPj4gQEAgLTM3LDEyICs0MSwyOCBAQCBzdGF0aWMgaW50IG1hcF9y
YW5nZSh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdm9pZCAqZGF0YSwNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqYykNCj4+ICAgew0KPj4gICAgICAg
Y29uc3Qgc3RydWN0IG1hcF9kYXRhICptYXAgPSBkYXRhOw0KPj4gKyAgICBnZm5fdCBzdGFydF9n
Zm47DQo+PiAgICAgICBpbnQgcmM7DQo+PiAgIA0KPj4gICAgICAgZm9yICggOyA7ICkNCj4+ICAg
ICAgIHsNCj4+ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUgPSBlIC0gcyArIDE7DQo+PiAg
IA0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIEFueSBCQVIgbWF5IGhhdmUgaG9sZXMg
aW4gaXRzIG1lbW9yeSB3ZSB3YW50IHRvIG1hcCwgZS5nLg0KPj4gKyAgICAgICAgICogd2UgZG9u
J3Qgd2FudCB0byBtYXAgTVNJLVggcmVnaW9ucyB3aGljaCBtYXkgYmUgYSBwYXJ0IG9mIHRoYXQg
QkFSLA0KPj4gKyAgICAgICAgICogZS5nLiB3aGVuIGEgc2luZ2xlIEJBUiBpcyB1c2VkIGZvciBi
b3RoIE1NSU8gYW5kIE1TSS1YLg0KPiBJTU8gdGhlcmUgYXJlIHRvbyBtYW55ICdlLmcuJyBoZXJl
Lg0KPg0KPj4gKyAgICAgICAgICogSW4gdGhpcyBjYXNlIE1TSS1YIHJlZ2lvbnMgYXJlIHN1YnRy
YWN0ZWQgZnJvbSB0aGUgbWFwcGluZywgYnV0DQo+PiArICAgICAgICAgKiBtYXAtPnN0YXJ0X2dm
biBzdGlsbCBwb2ludHMgdG8gdGhlIHZlcnkgYmVnaW5uaW5nIG9mIHRoZSBCQVIuDQo+PiArICAg
ICAgICAgKiBTbyBpZiB0aGVyZSBpcyBhIGhvbGUgcHJlc2VudCB0aGVuIHdlIG5lZWQgdG8gYWRq
dXN0IHN0YXJ0X2dmbg0KPj4gKyAgICAgICAgICogdG8gcmVmbGVjdCB0aGUgZmFjdCBvZiB0aGF0
IHN1YnN0cmFjdGlvbi4NCj4+ICsgICAgICAgICAqLw0KPiBJIHdvdWxkIHNpbXBseSB0aGUgY29t
bWVudCBhIGJpdDoNCj4NCj4gLyoNCj4gICAqIFJhbmdlcyB0byBiZSBtYXBwZWQgZG9uJ3QgYWx3
YXlzIHN0YXJ0IGF0IHRoZSBCQVIgc3RhcnQgYWRkcmVzcywgYXMNCj4gICAqIHRoZXJlIGNhbiBi
ZSBob2xlcyBvciBwYXJ0aWFsbHkgY29uc3VtZWQgcmFuZ2VzLiBBY2NvdW50IGZvciB0aGUNCj4g
ICAqIG9mZnNldCBvZiB0aGUgY3VycmVudCBhZGRyZXNzIGZyb20gdGhlIEJBUiBzdGFydC4NCj4g
ICAqLw0KPg0KPiBBcGFydCBmcm9tIE1TSS1YIHJlbGF0ZWQgaG9sZXMgb24geDg2IGF0IGxlYXN0
IHdlIHN1cHBvcnQgcHJlZW1wdGlvbg0KPiBoZXJlLCB3aGljaCBtZWFucyBhIHJhbmdlIGNvdWxk
IGJlIHBhcnRpYWxseSBtYXBwZWQgYmVmb3JlIHlpZWxkaW5nLg0KVGhhbmsgeW91LCB3aWxsIHVz
ZSB5b3VyIGNvbW1lbnQgd2hpY2ggaXMgc2hvcnRlciBhbmQgc3RpbGwgY2xlYXINCj4+ICsgICAg
ICAgIHN0YXJ0X2dmbiA9IGdmbl9hZGQobWFwLT5zdGFydF9nZm4sIHMgLSBtZm5feChtYXAtPnN0
YXJ0X21mbikpOw0KPj4gKw0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX0RFQlVHDQo+PiAr
ICAgICAgICAgICAgICAgIiVzbWFwIFslbHgsICVseF0gLT4gJSMiUFJJX2dmbiIgZm9yIGQlZFxu
IiwNCj4+ICsgICAgICAgICAgICAgICBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywgZSwgZ2ZuX3go
c3RhcnRfZ2ZuKSwNCj4+ICsgICAgICAgICAgICAgICBtYXAtPmQtPmRvbWFpbl9pZCk7DQo+PiAg
ICAgICAgICAgLyoNCj4+ICAgICAgICAgICAgKiBBUk0gVE9ET3M6DQo+PiAgICAgICAgICAgICog
LSBPbiBBUk0gd2hldGhlciB0aGUgbWVtb3J5IGlzIHByZWZldGNoYWJsZSBvciBub3Qgc2hvdWxk
IGJlIHBhc3NlZA0KPj4gQEAgLTUyLDggKzcyLDEwIEBAIHN0YXRpYyBpbnQgbWFwX3JhbmdlKHVu
c2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB2b2lkICpkYXRhLA0KPj4gICAgICAgICAg
ICAqIC0ge3VufW1hcF9tbWlvX3JlZ2lvbnMgZG9lc24ndCBzdXBwb3J0IHByZWVtcHRpb24uDQo+
PiAgICAgICAgICAgICovDQo+PiAgIA0KPj4gLSAgICAgICAgcmMgPSBtYXAtPm1hcCA/IG1hcF9t
bWlvX3JlZ2lvbnMobWFwLT5kLCBfZ2ZuKHMpLCBzaXplLCBfbWZuKHMpKQ0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICA6IHVubWFwX21taW9fcmVnaW9ucyhtYXAtPmQsIF9nZm4ocyksIHNpemUs
IF9tZm4ocykpOw0KPj4gKyAgICAgICAgcmMgPSBtYXAtPm1hcCA/IG1hcF9tbWlvX3JlZ2lvbnMo
bWFwLT5kLCBzdGFydF9nZm4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzaXplLCBfbWZuKHMpKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICA6IHVubWFw
X21taW9fcmVnaW9ucyhtYXAtPmQsIHN0YXJ0X2dmbiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSwgX21mbihzKSk7DQo+PiAgICAgICAgICAgaWYg
KCByYyA9PSAwICkNCj4+ICAgICAgICAgICB7DQo+PiAgICAgICAgICAgICAgICpjICs9IHNpemU7
DQo+PiBAQCAtNjksNiArOTEsNyBAQCBzdGF0aWMgaW50IG1hcF9yYW5nZSh1bnNpZ25lZCBsb25n
IHMsIHVuc2lnbmVkIGxvbmcgZSwgdm9pZCAqZGF0YSwNCj4+ICAgICAgICAgICBBU1NFUlQocmMg
PCBzaXplKTsNCj4+ICAgICAgICAgICAqYyArPSByYzsNCj4+ICAgICAgICAgICBzICs9IHJjOw0K
Pj4gKyAgICAgICAgZ2ZuX2FkZChtYXAtPnN0YXJ0X2dmbiwgcmMpOw0KPiBJIHRoaW5rIGluY3Jl
YXNpbmcgbWFwLT5zdGFydF9nZm4gaXMgd3JvbmcgaGVyZSwgYXMgaXQgd291bGQgZ2V0IG91dA0K
PiBvZiBzeW5jIHdpdGggbWFwLT5zdGFydF9tZm4gdGhlbiwgYW5kIHRoZSBjYWxjdWxhdGlvbnMg
ZG9uZSB0byBvYnRhaW4NCj4gc3RhcnRfZ2ZuIHdvdWxkIHRoZW4gYmUgd3JvbmcuDQpJbmRlZWQs
IHdpbGwgcmVtb3ZlIGl0DQo+DQo+PiAgICAgICAgICAgaWYgKCBnZW5lcmFsX3ByZWVtcHRfY2hl
Y2soKSApDQo+PiAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVSRVNUQVJUOw0KPj4gICAgICAg
fQ0KPj4gQEAgLTE0OSw2ICsxNzIsMTAgQEAgYm9vbCB2cGNpX3Byb2Nlc3NfcGVuZGluZyhzdHJ1
Y3QgdmNwdSAqdikNCj4+ICAgICAgICAgICAgICAgaWYgKCAhYmFyLT5tZW0gKQ0KPj4gICAgICAg
ICAgICAgICAgICAgY29udGludWU7DQo+PiAgIA0KPj4gKyAgICAgICAgICAgIGRhdGEuc3RhcnRf
Z2ZuID0NCj4+ICsgICAgICAgICAgICAgICAgIF9nZm4oUEZOX0RPV04oaXNfaGFyZHdhcmVfZG9t
YWluKHYtPnZwY2kucGRldi0+ZG9tYWluKQ0KPiBZb3UgY2FuIGp1c3QgdXNlIHYtPmRvbWFpbiBo
ZXJlLg0KT2sNCj4NCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPyBiYXItPmFk
ZHIgOiBiYXItPmd1ZXN0X2FkZHIpKTsNCj4gSSB3b3VsZCBwbGFjZSB0aGUgJz8nIGluIHRoZSBs
aW5lIGFib3ZlLCBidXQgdGhhdCdzIGp1c3QgbXkgdGFzdGUuDQpIbW1tLCB0aGlzIGNodW5rIHdh
cyBkaXNjdXNzZWQgYmVmb3JlIGFuZCB0aGlzIGlzIHRoZSByZXN1bHQgb2YNCnRoYXQgZGlzY3Vz
c2lvbiA7KSBTbywgSSdsbCBiZXR0ZXIga2VlcCBpdCBhcyBpcw0KPg0KPiBUaGFua3MsIFJvZ2Vy
Lg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

