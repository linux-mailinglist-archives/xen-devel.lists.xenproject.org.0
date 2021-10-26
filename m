Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D064743ADCC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 10:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216290.375834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfHX4-0003ax-Tn; Tue, 26 Oct 2021 08:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216290.375834; Tue, 26 Oct 2021 08:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfHX4-0003ZA-Pj; Tue, 26 Oct 2021 08:10:06 +0000
Received: by outflank-mailman (input) for mailman id 216290;
 Tue, 26 Oct 2021 08:10:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93O1=PO=epam.com=prvs=093397e908=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mfHX3-0003Qr-Pk
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 08:10:05 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b97bc69-73f3-4fad-80ea-ee2588785192;
 Tue, 26 Oct 2021 08:10:02 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19Q84PRt005970; 
 Tue, 26 Oct 2021 08:09:58 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bxdubg112-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 08:09:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2659.eurprd03.prod.outlook.com (2603:10a6:200:95::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 26 Oct
 2021 08:09:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 08:09:54 +0000
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
X-Inumbo-ID: 1b97bc69-73f3-4fad-80ea-ee2588785192
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wwawyc75NC/x56t6WWvd09V54xptgMt0ryV4GtYZhW3fipDt27byVj/W7O8w47l8xD9PwizwtZnrrhx4AY2XZ02/tF5Q8JfdNAOkgDUM0g2ROrArNTguB7oBskRDyrS5ERsVUT7MlWeEiaWrvuGnq8xreJ1iCfVYFbpINRShrc2CXAJGHmfdhZ4r+J3BC3F04Y+bYe6LEheCX4bTNj4zpdPUohoDJrzl548nQY1OB9eojtLRPxkGdqy3eYxq1c+/fP57zn6chuUtb46T6hcGImZQ0ktSTWkWl8FBQ8aVXq/qhgsRMEZy7R+H/Q/MAtTxqPsk9TgQBHNUy7iUXgjhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ae1HhnUXreFJ83IwHXu9yctXpNNmngAQ5wJbxXDzcQ=;
 b=MbApAl8bsnilEeu6taowRu1vS8NC5u5czUaHLfXdlI8rd7JCD9UjHYuYIqPJvhyGZ3VLpyoK3Vb7A93PSqmNfaYGz8Fvc6tZJmj3bQX9/pXU5SvOuDPj1J7G5hRVzeBfC+BM9zHf1+nSmplkzGLKQkYDflc6jNkAlbCgtCk9ngw65FCJxl/LXjHogfC8m0sN0UwX1ppMWndPSpnHw/QQuR7YZ2EtkpkPx6Wqs7M6nLsrCp3eeAJWiUvxUegyVtKc9eXJabZeVMDi0TkRiTJJuaLiupDx+uRQrk3T+VxUmc18zXx16zEt76JOayhsrXD849reeYwssZLtyjIweFy1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ae1HhnUXreFJ83IwHXu9yctXpNNmngAQ5wJbxXDzcQ=;
 b=zi4u09SotZ22Mtl/UpZpH7XXVwy7SL83jxJZ5LMts/MlERKNusw0hFIz9rNdqU4yxx3j61vNaJ2KRXUSzP55h1tnuSmuDQOsBrklJFEriazD7vuEuW4l9PTjJ5/a+EjF1R174B/Q+4bEOZXgvZVGAwcU3E+huNZpTBQWPLvZsjfvrAX7WsDgfsDmyPgs/ypw6veLTRR28ai0+fyEKQJJtzIOcMK8ypu+29t6YaRiA5z7vD7lP//FfMDWRkEkliztsHkCqlTsVtSXxWsGB08vNCMJkugeGC/ItNzEmAkZF5N29MBGKxsCcB/grZ0wy8yXWd7FJyqxTzwVIwDv9/JxlA==
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
        Michal Orzel
	<michal.orzel@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 05/11] vpci/header: Implement guest BAR register
 handlers
Thread-Topic: [PATCH v3 05/11] vpci/header: Implement guest BAR register
 handlers
Thread-Index: AQHXtdAiCK9y7BK95EmkzI7JyqzOjqvlEL4AgAAFV4A=
Date: Tue, 26 Oct 2021 08:09:54 +0000
Message-ID: <150126cf-68c0-95b2-29f8-e2be61b55b54@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-6-andr2000@gmail.com>
 <YXezVjnA0E+iV1rI@MacBook-Air-de-Roger.local>
In-Reply-To: <YXezVjnA0E+iV1rI@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f0196c6-7993-4b25-4e34-08d99857fe1e
x-ms-traffictypediagnostic: AM4PR0302MB2659:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB2659FE3BA53FF4F4E37682E3E7849@AM4PR0302MB2659.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 68EgTuPhBrSEw2ue4Cr500uInwz+zk9V4E+ZsgNDfkLlMz0Gt2YVyB1Eo1A9+kNht2pQR2s2Z/AWWKpPcIP7xrRuorq3/8WpCG/yy4YPTLJFdxwui5rFokNcRzmyULF55+VmJtpFBvjhhis/P2PqPHTn4E7NXUdw9cysXcvV/6MmYJUNDBVzorIuU5PoTJ+61l5JzhsIuq+AJ8eQV5UdWdkfBbfIu4izD9gbx9ppwkS8SKjH2L5/DI4UWdVZut8IMPb2jmRuxLimFlX6VbLTiw4AL0TSiyUfw6G85DL8hNV6FrTJVo9a/zkFQ+Y7IVtwMSmvl4DzC0AbmFSYaH1GCHfx6+OZcRz7zIbTdwb6gWWTsMIOkOfZt9rdaSLbEV6cA3rCfAlkF6rtA2CA8c94louqhDtHR1DHc5TV135PYyDkUyKWJPwpAF2AZC2CWoMePnELkKocYsgvPHstD81KGB9a0vD3TjuqQNehoyq4PY/qCxXlJPjTMD0FZ7+eG+76AwTqROfC0iZWnPZlmWPMat2LZ1nouR+uzEd31kDYQYMOXlYAtXtM7HCxMA132a+Ph1GzURn5EWX5gUW3DqqAHGtNYz46vCHz8MC9lbSYcPnS1MvfTZsnuJIF93bKN9K4n/lVnrNnUVnCjF/PX7tEqIlZlfd2gIGSM/cSkbLDibGZdljLem7XBqj3Gqec4Z1wJF0Jvz1Uw55e/2z1Dv3eZHsvb4UYjf0nUFhRW15HMbvSVFU4kwtB0mM/EUmcyeH/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(71200400001)(2906002)(83380400001)(26005)(6506007)(53546011)(2616005)(38070700005)(86362001)(31696002)(54906003)(316002)(186003)(6512007)(64756008)(31686004)(6916009)(66446008)(66946007)(66556008)(66476007)(76116006)(91956017)(122000001)(38100700002)(4326008)(107886003)(8936002)(6486002)(8676002)(508600001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cVNNZ0FycDkwV0w4dXFSMVMyZ216bE9YRGc1Q3c0K2RtYmZKdXEyMHZwRmNQ?=
 =?utf-8?B?dm9Uejk4LzhnMkFEdFVGbWpySW1UN1dvRWZUd0lRVHNGazI5RFdWMWJlenFx?=
 =?utf-8?B?U2lWeEY3Nkd2UkI4VnovWUM1aGloa0pjcXVDclB1dGpmQUtHUFllSkQrZ1hM?=
 =?utf-8?B?ODVxZU9yNW92U1pYU1pWSmJVY3VVcEZUWDBWbEU5c01zVnNoelplaG5jMGNR?=
 =?utf-8?B?N3BDTkI3eDQxQXU2YSthaXFLOFBtWmpJaVFNSHRndXlCWldRSUZoM0EydURM?=
 =?utf-8?B?YzFWRWZpUGlRK1lZNHJyb0diQVFQalZsekhwUTloZlRUWlhMWU5CVjNEalNl?=
 =?utf-8?B?TVoyZ1dGYzhVWlNmUkNZYnhXQXVGZG10cUFvNHhxT3pwbnRYTWU5YWdIc2oz?=
 =?utf-8?B?YVNhbXg0L1FLV2h2UXR4bEFteWthOEp6TkRlYU5Wc3UzSEZRak51bm1kdDJ0?=
 =?utf-8?B?TGtWdFdxWW9Zc0tITTNUNFlGSE1pMUExWFJaNENEdzNDODBla0xLWFVpY0N4?=
 =?utf-8?B?RWJWTUphclFoKzBXUTNnVWp5cm1wVVVtSGdvaWExcFFQK1FCclAvZWFlT1ZO?=
 =?utf-8?B?RldxaFozZ0FsYW8vMFBuaHdGemxyeXlVbm5obGlxRlQ0bElHa29rMS9rTVhl?=
 =?utf-8?B?dEZ4SENiNHJOaytTYng3WFNlODNLZWVwOG0vM0xBcklrRUdOblJOZ1pRV3Ev?=
 =?utf-8?B?S2NWZkhtWDdEUGxkUG1oUXY0VGdya1Y3YmQ0eTJNZ0pNYVNGdUdBY2dsMm1Z?=
 =?utf-8?B?TzhDaE44TzltQ2ViRkRFUWNEU1dGTUtMTHBMKzU5cklWcktyMGlaMXpJTVNQ?=
 =?utf-8?B?NE4waEdncTUvcG93YmRVbFRnZEU0RnFnV0RqbElpUERaeXdwSzQrcmxKL3Rl?=
 =?utf-8?B?UmRrOGtBS0MyWURRQXFqSitHQ2w3RlpYdlpCa3V6dm9nTWVJTUR6dDhRL3ZY?=
 =?utf-8?B?VGJuRTdsbi83aEt6VGRmM2FsU29vUnU3cDdTeXpMdDhjQXVDUTYrVHoyNGVl?=
 =?utf-8?B?L2o3TlVOZTJjT2lXUjNvZ09pZDZYbnBhZmlBSkVFYmU0M2liU3N4WG9zeWRX?=
 =?utf-8?B?cXlQaXNpelBJSk5Bbnp6R2NscGtMamhrc0RuY0hOeEJqNE1KRkJrUThsZjg2?=
 =?utf-8?B?VXR5OXJPbnVwMHV6Vm5HNHN4MWNxZmEwYW1SL2dpTVNNU1VtSDlqY1NyVTN6?=
 =?utf-8?B?Tys0TklvZHRYUjZWTFNxenJlNitPb01aYzdhdGpuMEdsTmFucUFSY2piRlZr?=
 =?utf-8?B?elpvL1R6QXlxU09qYUJtWlJzbnplcXF1SXcxVnVRd1JHenN5dTh4YXUvWU50?=
 =?utf-8?B?aCtQMHVFcXc3S1NQbjYyandFa000MnBuNVhtOEtpS1BydUtCNGtYUmpka2xS?=
 =?utf-8?B?Q1lzalYzbVd4RnB2eUxKcVBjN3lKMUt4UzJCV2ZZWlFUb05oUnh1bVRwMEpj?=
 =?utf-8?B?N1lGSllUY05GZ3JWSHkrT1pha2VIVDBJRmZodUdEeHN1LzluVFprM05SY1lU?=
 =?utf-8?B?cXVEU24vSlhYbUNGZEtpVFZCN0VEVmU0cDVWYXZqNGFya25GWEV5ZG9HMGQx?=
 =?utf-8?B?ckY0UHpKdDBoWWdwOFpqazVhNG9tQWxOeEdUcWE5amEzUW1nNnVteGM1Tmtt?=
 =?utf-8?B?ZzBXeklabFA4WFF0Qmo2N0NQOTlXVWppZGs2RmpiUm1teUZ3RzFWeWlVUFZr?=
 =?utf-8?B?UHpia3EreDF1MEx3VzFjWm1FYUtEN20wTmhTekR5RDl6aGdyMjNLVWIyVXZ2?=
 =?utf-8?B?U3gvVU5ONE8zM3R2ay84bVViK05WUzdCMm5vYWQ1MDJtemhyOXdseU1qNUFB?=
 =?utf-8?B?NUZzSEpSeTd5ODNxditsVk9yM01Cc1luT2VUb1NkU2FXQUNEUEdPZkU2OUlJ?=
 =?utf-8?B?dEdNVHljek92aFVuV0FXd0tSMWE1TDBteFQwWk1YM0RxY2l2WWlyZjVaWDZq?=
 =?utf-8?B?c1J0U1lqMmhYdkxhbFhFMnhSTUdpUkU1V21jb0lVdk5yQ1JIWkovQ0s1SkFW?=
 =?utf-8?B?TWZZYU5GaWViWE5oZWUvY29idXFiU1RMaXFCbjhkcWZZYXl4MGRrU1pVa1Jh?=
 =?utf-8?B?WW0vWXpOc1QrQVo4OTFDNmhjVVBUN3NoOU9RdzBacW11M3lLdk1OOGtGWHY5?=
 =?utf-8?B?OHFweW1nVnQzWUFZU1NyWUtuZGxZdU5qL0Fnc2M0T3FUdUxPRmQzZEF3UU9k?=
 =?utf-8?B?WmVoMzFxT0tKQ3d5a2VzdlBkdEhxNFlma3hsSmE2RlgyMmtOQyswWE5UUjgr?=
 =?utf-8?B?YTZIbmQycktNaC95cDRTVHRSK2FWVnRuV2xYdzY2Q1RrYU9NUDYrWjBkMXZU?=
 =?utf-8?B?Y0cxdUdUR1Ira2lFZjl0SHpreVBjWEVpM0FiTlhqSk9FdnJzcFRQUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6B4185DAB59A84A96ED5A0F675B3B1A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0196c6-7993-4b25-4e34-08d99857fe1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 08:09:54.0719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFGY35Y/CLdtwguoFS98H21RPUPe1oqmUis+7+LSq2U9adsw1ANMy5ARlGutW7ViuYs0p9zcVya58vTjut4f1OHeEpr3o0/iRYDomY+7/umw1hZtP4D8Y1CKmjWfOVp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2659
X-Proofpoint-ORIG-GUID: A3lp6RhRUNNMLzdiqcnBMIhrgB8AP7LL
X-Proofpoint-GUID: A3lp6RhRUNNMLzdiqcnBMIhrgB8AP7LL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_08,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260045

DQoNCk9uIDI2LjEwLjIxIDEwOjUwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IFNlcCAzMCwgMjAyMSBhdCAxMDo1MjoxN0FNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBFbXVsYXRlIGd1ZXN0IEJBUiByZWdpc3RlciB2
YWx1ZXM6IHRoaXMgYWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3Qgdmlldw0KPj4gb2YgdGhlIHJlZ2lz
dGVycyBhbmQgZW11bGF0ZXMgc2l6ZSBhbmQgcHJvcGVydGllcyBwcm9iZSBhcyBpdCBpcyBkb25l
DQo+PiBkdXJpbmcgUENJIGRldmljZSBlbnVtZXJhdGlvbiBieSB0aGUgZ3Vlc3QuDQo+Pg0KPj4g
Uk9NIEJBUiBpcyBvbmx5IGhhbmRsZWQgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4gYW5kIGZvciBn
dWVzdCBkb21haW5zDQo+PiB0aGVyZSBpcyBhIHN0dWI6IGF0IHRoZSBtb21lbnQgUENJIGV4cGFu
c2lvbiBST00gaXMgeDg2IG9ubHksIHNvIGl0DQo+PiBtaWdodCBub3QgYmUgdXNlZCBieSBvdGhl
ciBhcmNoaXRlY3R1cmVzIHdpdGhvdXQgZW11bGF0aW5nIHg4Ni4gT3RoZXINCj4+IHVzZS1jYXNl
cyBtYXkgaW5jbHVkZSB1c2luZyB0aGF0IGV4cGFuc2lvbiBST00gYmVmb3JlIFhlbiBib290cywg
aGVuY2UNCj4+IG5vIGVtdWxhdGlvbiBpcyBuZWVkZWQgaW4gWGVuIGl0c2VsZi4gT3Igd2hlbiBh
IGd1ZXN0IHdhbnRzIHRvIHVzZSB0aGUNCj4+IFJPTSBjb2RlIHdoaWNoIHNlZW1zIHRvIGJlIHJh
cmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnpl
bCA8bWljaGFsLm9yemVsQGFybS5jb20+DQo+PiAtLS0NCj4+IFNpbmNlIHYxOg0KPj4gICAtIHJl
LXdvcmsgZ3Vlc3QgcmVhZC93cml0ZSB0byBiZSBtdWNoIHNpbXBsZXIgYW5kIGRvIG1vcmUgd29y
ayBvbiB3cml0ZQ0KPj4gICAgIHRoYW4gcmVhZCB3aGljaCBpcyBleHBlY3RlZCB0byBiZSBjYWxs
ZWQgbW9yZSBmcmVxdWVudGx5DQo+PiAgIC0gcmVtb3ZlZCBvbmUgdG9vIG9idmlvdXMgY29tbWVu
dA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gICB4ZW4vZHJpdmVycy92cGNp
L2hlYWRlci5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiAgIHhlbi9p
bmNsdWRlL3hlbi92cGNpLmggICAgfCAgMyArKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBpbmRleCAx
Y2U5ODc5NWZjY2EuLmVjNGQyMTVmMzZmZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Zw
Y2kvaGVhZGVyLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC00
MDAsMTIgKzQwMCwzOCBAQCBzdGF0aWMgdm9pZCBiYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAgIHN0YXRpYyB2b2lkIGd1ZXN0X2Jhcl93
cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0YSkNCj4+
ICAgew0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9IGRhdGE7DQo+PiArICAgIGJvb2wg
aGkgPSBmYWxzZTsNCj4+ICsNCj4+ICsgICAgaWYgKCBiYXItPnR5cGUgPT0gVlBDSV9CQVJfTUVN
NjRfSEkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBBU1NFUlQocmVnID4gUENJX0JBU0VfQURE
UkVTU18wKTsNCj4+ICsgICAgICAgIGJhci0tOw0KPj4gKyAgICAgICAgaGkgPSB0cnVlOw0KPj4g
KyAgICB9DQo+PiArICAgIGVsc2UNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdmFsICY9IFBDSV9C
QVNFX0FERFJFU1NfTUVNX01BU0s7DQo+PiArICAgICAgICB2YWwgfD0gYmFyLT50eXBlID09IFZQ
Q0lfQkFSX01FTTMyID8gUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV8zMg0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IFBDSV9CQVNFX0FERFJFU1NfTUVN
X1RZUEVfNjQ7DQo+PiArICAgICAgICB2YWwgfD0gYmFyLT5wcmVmZXRjaGFibGUgPyBQQ0lfQkFT
RV9BRERSRVNTX01FTV9QUkVGRVRDSCA6IDA7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgYmFy
LT5ndWVzdF9hZGRyICY9IH4oMHhmZmZmZmZmZnVsbCA8PCAoaGkgPyAzMiA6IDApKTsNCj4+ICsg
ICAgYmFyLT5ndWVzdF9hZGRyIHw9ICh1aW50NjRfdCl2YWwgPDwgKGhpID8gMzIgOiAwKTsNCj4+
ICsNCj4+ICsgICAgYmFyLT5ndWVzdF9hZGRyICY9IH4oYmFyLT5zaXplIC0gMSkgfCB+UENJX0JB
U0VfQUREUkVTU19NRU1fTUFTSzsNCj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIHVpbnQzMl90
IGd1ZXN0X2Jhcl9yZWFkKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQg
cmVnLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4+
ICAgew0KPj4gLSAgICByZXR1cm4gMHhmZmZmZmZmZjsNCj4+ICsgICAgY29uc3Qgc3RydWN0IHZw
Y2lfYmFyICpiYXIgPSBkYXRhOw0KPj4gKw0KPj4gKyAgICBpZiAoIGJhci0+dHlwZSA9PSBWUENJ
X0JBUl9NRU02NF9ISSApDQo+PiArICAgICAgICByZXR1cm4gYmFyLT5ndWVzdF9hZGRyID4+IDMy
Ow0KPj4gKw0KPj4gKyAgICByZXR1cm4gYmFyLT5ndWVzdF9hZGRyOw0KPiBJIHRoaW5rIHRoaXMg
aXMgbWlzc2luZyBhIGNoZWNrIGZvciB3aGV0aGVyIHRoZSBCQVIgaXMgdGhlIGhpZ2ggcGFydA0K
PiBvZiBhIDY0Yml0IG9uZT8gSWU6DQo+DQo+IHN0cnVjdCB2cGNpX2JhciAqYmFyID0gZGF0YTsN
Cj4gYm9vbCBoaSA9IGZhbHNlOw0KPg0KPiBpZiAoIGJhci0+dHlwZSA9PSBWUENJX0JBUl9NRU02
NF9ISSApDQo+IHsNCj4gICAgICBBU1NFUlQocmVnID4gUENJX0JBU0VfQUREUkVTU18wKTsNCj4g
ICAgICBiYXItLTsNCj4gICAgICBoaSA9IHRydWU7DQo+IH0NCj4NCj4gcmV0dXJuIGJhci0+Z3Vl
c3RfYWRkciA+PiAoaGkgPyAzMiA6IDApOw0KPg0KPiBPciBlbHNlIHdoZW4gYWNjZXNzaW5nIHRo
ZSBoaWdoIHBhcnQgb2YgYSA2NGJpdCBCQVIgeW91IHdpbGwgYWx3YXlzDQo+IHJldHVybiAwcyBh
cyBpdCBoYXNuJ3QgYmVlbiBzZXR1cCBieSBndWVzdF9iYXJfd3JpdGUuDQpZZXMsIHlvdSBhcmUg
cmlnaHQNCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

