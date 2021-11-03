Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACB444012
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 11:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220763.382153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDdN-0005Xj-DG; Wed, 03 Nov 2021 10:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220763.382153; Wed, 03 Nov 2021 10:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDdN-0005Vd-AF; Wed, 03 Nov 2021 10:36:45 +0000
Received: by outflank-mailman (input) for mailman id 220763;
 Wed, 03 Nov 2021 10:36:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miDdM-0005VU-LL
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 10:36:44 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8dbf3a0-c8fd-456c-bee2-921af25be85b;
 Wed, 03 Nov 2021 10:36:43 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A3ANgl6002453;
 Wed, 3 Nov 2021 10:36:39 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3rmjr1y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 10:36:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3469.eurprd03.prod.outlook.com (2603:10a6:803:18::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 10:36:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 10:36:36 +0000
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
X-Inumbo-ID: e8dbf3a0-c8fd-456c-bee2-921af25be85b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBr2RIfGmKFYC0B/4bkZjVNtRnb9EVkiLJ202Y2q907Y0eYaHgV4A7uLlbrZaVLJmVB+aWGR+OGWOtY/E2AP+1P8gCY+T2MW8rZ0VXTgS/ty/RIKic8UVNS1RLRCBECHCKIAaitAjnWVTgLCibCKZ58urVRwGT8rRjWeLZnaR+6CelP48bTWyemSSNeS6KzRNdZk488Mg+cqLxLjki6vHA5wvX1t14Z/lE3RU5Xyz3fIaH1wWU9nQEdMjtCGAbTou8ON3+bJJh8U9q5Dk2RvxypJoxGcz0uHMI8YctpY6fQ8PxazrV+Emnr5/Hjg30luhoQm1iS88hVyRMBsCkBufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ywo3xrZjaLVGm9inqDxzUFieacVKcDDvsabIOFW8nM=;
 b=nVg8r1mQwYcxeb+0qZGUxln6Ow2CbkRG9U0z5VVdTtBWt5K3pVzGQHiOzwbZFbiv9Uu1Ozc6ZxAdpQtKUMAKYA9aAhQlblQZnvQZu4DeNiorMZi+9Mc2clpiz8aD0q7pYmZv/EBjaTlojgiU1afvCsc2D6aWPKcjjwUvB4bX47JKXZZdn/k/YO8tRNVd3ycYGtlGPihGkPC+uVNdyvoX6U9rfXLGic7mUiV/bxEqNYUFtzBqDS0Hcswo1BNqsRMtfuyxqlGCe42e3Al+XiKoo2vt4m9UwRCarDA08jct3fXXa11NnOjzs1wXf+IDW0OHM/pWgQPdeeEoaqEa1y7B5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ywo3xrZjaLVGm9inqDxzUFieacVKcDDvsabIOFW8nM=;
 b=OBqPAOFg5ugggtaMbIvZdg2rRVKSwcbf7pS7O1OnVVfO3DySvo/dIalxdNo/H411QckpRNQPVRcTUbPlBA1gU7zJSrgyXJiAh/SxyLFa7PMrQ4Ffn6Q8Dj9e5vUHBcekUgpZHUe0MuaC7ghwUxX2+UWtNbRcNe1RgiAxBf+fCGnKP96nPMYDHibfQtZo4C0TYTzAXwLwMOlm+18DGozgZ1R5IZLduhCJlYYN5Nnf0TK4/e6BJ+SMEjx8HZryr2Se1qIcs4rQyT/dE4XauQRkhhTy06PaI9uaNM6iPf9dFdeHEQ8sqKRbDiT1wrZcPiqJENuScti3Vp20muocGL8KjQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Michal Orzel <michal.orzel@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAIAABTcAgAABvgCAAAHkAIAAAZSAgAAFc4CAAAmcgIAAAuiAgAAAg4A=
Date: Wed, 3 Nov 2021 10:36:36 +0000
Message-ID: <d3908703-3501-892c-55fc-5a171318eeea@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
 <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
 <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
 <7efa4dd7-83b3-daac-cc02-86f80762513b@suse.com>
In-Reply-To: <7efa4dd7-83b3-daac-cc02-86f80762513b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0babb9b-971c-4cb3-c0a8-08d99eb5d002
x-ms-traffictypediagnostic: VI1PR0302MB3469:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3469FBCEF87CE9A7BE7F96FAE78C9@VI1PR0302MB3469.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 I7mnT8+IzhdquC6bh4guBvCX+tzq8IyT7znkGobroqGc8mRr3fQZ941jgDZxVJHQOQVgY7jisBpnlFouzzq/t4zFMu65xUK414MMth6zMaSqz7CW1vLAtDYRU6EzgqjSK45trCyH0miQLAHkzkxUC5qpPZ4b1gIGNovPP+8FHJZHt1DodlrXSUIscPA5VNrJ1O0VqxNoMLWFoAb4BUmTogDhmJpcKyG2TZZNL6Kw4kXouVA4qaCd68/4IKSMhc+8YtSj5Gma83qCVBZFodgZOXlCwDKBcO4zrmsO38BNx43ea5uhsW0LjkGUXbZYZ+ziYWxAN2uafvkZNNhlMqIrIBeLVKwfQiVnfl1pl8Gd10dqVaiTyW4FM1MS/03RluI826RXgPRg0jH4r/KQ9Mim5lX0assAzGFDLMEI1sSIBA+rPuPWUepupf3QK0ZwWSu7MDIyaTNlwR3//SX76676H46xcyJ19mNnANkZIzZ1B9xzwfYNVZjeXfarK5L0xff8LN0y8rQTJFL8H6ffQdjhLfng4SXwwYJCEDg+gufnfoDdoyboB0ES/6fRyNUKqsVCXv8sZsC0d1AOPZKWo+iXOF2tKzb1N0NJDoH/ca/pYRRUEpl0GyVrCuP00eXLD/gdiHGxZx0vbxlnuwEyq2PwDJ8vTrk2Wm3L37C3Q/QJ48zrXGcUvzC32wcWOTapdOsYTEiXNzExYKxnQIgP5qs2zXR3gIG+Gj95Wwpc1Hl6O3g0cROjMVhttVUJc8V0Rmm1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6486002)(8936002)(186003)(36756003)(53546011)(508600001)(26005)(5660300002)(6512007)(86362001)(66946007)(110136005)(38070700005)(66446008)(31696002)(31686004)(107886003)(54906003)(38100700002)(2616005)(64756008)(66556008)(66476007)(76116006)(91956017)(4744005)(8676002)(316002)(71200400001)(6506007)(4326008)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S2ltcmZBYmdHQVR4NzBJYkxKcmlkY1NJVFFZK3NuclBqSWNReG9kQmFNOWZL?=
 =?utf-8?B?QitDZGU3Uk1wQWhxenNQNmVKbmRSblh0ZThTRWh4bm9KcXE3TlhJQVNsMExM?=
 =?utf-8?B?bExiZVY5bXZKdW1YVFNuTlBpKzRtcWYxNjdkUTlxYUpRT0NUa0RMeHNQSSs0?=
 =?utf-8?B?T2kxZXU0U0ZxWlQ0TE94TWY3dWdkZXpxQkZVL3pGZ1JneE9xaktFR3JvWnFs?=
 =?utf-8?B?Qk14U2hUNnVUSnFkRW50NVFPaDIwQzJSakdTVjBQa0dZK2lyRnUvOTBvalNQ?=
 =?utf-8?B?bkhZNHZ5Uk9vMDB5YjUvaFlkUzdxYU1LZVc0SktxNi9FYkUyTjVMaXF3UVNO?=
 =?utf-8?B?TVdJZ3gxMUM1TW82ODlzU2hzMjBLZDgrazJWSjJyeko4N2piM0JSWExrRk1O?=
 =?utf-8?B?ZklrYWthY2xXWUxDcEN2dmJZWVBva3FaU3Z0UlI2bUt3QlBtUkdVVVN4WmQ5?=
 =?utf-8?B?NGY4WEkzRHRpa1ZtMy92b2JtZkU3Z0MyL0Q1b0p5THF4OUNMSDlpMkhlYUpW?=
 =?utf-8?B?eCtBU1J5bUdKeU1zc1FQRlp4UlhEOUh1SndsT2VkVkR3bk5DNEhKbWo5eEZh?=
 =?utf-8?B?UC9QRC9lUFcyRmFjRU9BUGM4RkJrZ05VUEUyNVYzNEdPTHA1K3Q2c01XZ2VU?=
 =?utf-8?B?WHVNQUhqeVg0THJQdytGeE9zVmcwRS9HbjZwSllsMEpLU2swQ2tEeFJkcktF?=
 =?utf-8?B?TzV4aXhFS0IraUlaYm11eXozSFppK2Z5MGtiaHY3RHdHSFRKUjVWZ21rN2k4?=
 =?utf-8?B?SDArVFR5ZVhVb08vVGhQYlpNTHpVUi9kV1dVdDFTb2FMSGNpK25nMjdhS3p3?=
 =?utf-8?B?aUVLYWxwOWlwczhxeTd0bGE1V3BTRi9ZNUIrSkJtaE9hQXZhYzNiRU1qVGNn?=
 =?utf-8?B?ZWViSm4rNjRXRDkyUjcxRksrczZ6QWgyQVJtSENyUnU3QUQxZExxd045ZHNo?=
 =?utf-8?B?bWhETS9Dc1hEOFR2eFM3T3RSNTBTOGJ3UDkxaUNBU01JWXdOQVFTWXlxWjRi?=
 =?utf-8?B?ODU0b0VoWnVzb3hrTHpKcStJbUxlMUEwOC96dWlRVjN2NzVYRnBJN3JkdXRu?=
 =?utf-8?B?WUFRek1JNUwzcWl5QkovZ0pLTm1ENnNDNGhHMmllYmNwY0t6dHNmbUVyeklG?=
 =?utf-8?B?R3BFSHZKWisxaDdKekdNSXpQQ1RsUjFQL1hBREp2QlljVDJPeGdGMHdSMm9i?=
 =?utf-8?B?dC9DeDFOdmJ4NWtHY3RSeVhnNFlWVVBHY2NTTGRIeEtDSVZ5T05OSkhQbnFW?=
 =?utf-8?B?NmFkWHF4OVpubzRsYXNZM3F3R1F6UUt4b043Z0JMM2pvWHRHQi9uMCtpc1R5?=
 =?utf-8?B?U0RBQUJabTBjT21kRFlLR0g1UHdDQnBlcER5Q2llZXprVDdaUlhEdzdGSnVE?=
 =?utf-8?B?b1hDb3BSUDZIdFlTRmVLMnZydS9xNWNxR2VVU2hFQlVRZUk2Mkh3Z0hrM21a?=
 =?utf-8?B?Nk9FalN2QlNkb0hiSFVKU2dDS1ZONHZMTVdhbFZKWmw0R3RVUWJJUUlIOXNU?=
 =?utf-8?B?ZGJoZi9XYjBjd1I1cmoxZVp4STZ6dk0yUTRpazl3NHZaSlJKVC93UU1mWEpT?=
 =?utf-8?B?MUxLeWtYQnY1cUkwMjBaSUcxT3JQQVk4L1R4MWxCOHNwenpmWjNmYjdRWWdY?=
 =?utf-8?B?dVR5YlJONjJKMEhsTEpJaXFLbytacFpwSFhpTXJlajduaEhiZU5zQkpLMERK?=
 =?utf-8?B?OG14UnJyMEFPK3BVdjEzU0dMUDVDS3hKRzI3bGRzNmRVQXJZem5uVTN5WHBN?=
 =?utf-8?B?am5MMnJ4ZlBFQlVaVzlidm5JSUNTUUpla0tOaTlDcmMzZEt0bHR4UG5ibFVo?=
 =?utf-8?B?VEFHRUthM0ZnNENiT25KaDY5b1FPaVJ2clNCVHVQY0Jicm5EOTV4VTdzUUc0?=
 =?utf-8?B?emhiQk9zT2JFaXVvVmRKR0hYbFNLa3NkYnE3dUUxdW1wbmh5b3lINmxDNGZh?=
 =?utf-8?B?UU5SMmRXcDlDeEVLSHFJNWMxSzM2WFpqeGZnMXF6aldtTUc3d2JTdTMrejZp?=
 =?utf-8?B?TXNPQmh5cVJodG43SkpFT25hdU8yd1FlSVpDb3IxVXRrRXN6Y2lIRmRMTGI3?=
 =?utf-8?B?RU1NS0cxQkU5WmRPaHptUisyRm1RSHNjVjAyTkU1UEp3am45UkFsTjdkZkNp?=
 =?utf-8?B?ZjdseWxzcGhuZXh6SWxMYmdHQVZwdXZOMU9NUGNqZVp3R21QR3ErbElmREpu?=
 =?utf-8?B?T01ySWlpcC9KVlFyQkVsY0NPQm1rSjE3N1dUeTVoV0srUnMwUTY1aUpzNlVy?=
 =?utf-8?B?UXlZeGJ6aHloaWtTT0JDcWxMdUpVRnF5ckFpT1NCcHp3RjBtR3I2TjloSFcv?=
 =?utf-8?B?TFlySXh5eWFZVjRLL1V6WmRXQzdWR20yMHZEbGgwS0tDaU5TNlpDZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D339AFA573F97D4D848F240248E222F1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0babb9b-971c-4cb3-c0a8-08d99eb5d002
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 10:36:36.3824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3QEMuAeL0vnjbtZxrlruzl8jkAymYQ0IvW/MVju5GJ/NBHUeNPCETfZDl2MuN5M6vnjCABsjFWRryPL1o9gJa5CoNJRyWCfMIXJidzbsWoLmn/FVkWUsCKVeBOcjDwy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3469
X-Proofpoint-GUID: 1XXZ_pXb8QEJ0yWvA13Ka2nk5J0VtC7Y
X-Proofpoint-ORIG-GUID: 1XXZ_pXb8QEJ0yWvA13Ka2nk5J0VtC7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030059

DQoNCk9uIDAzLjExLjIxIDEyOjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMTEuMjAy
MSAxMToyNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwMy4xMS4yMSAx
MTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gQWl1aSB5b3Ugd2FudCB0byBwcmV2ZW50IHRo
ZSBndWVzdCBmcm9tIGNsZWFyaW5nIHRoZSBiaXQgaWYgZWl0aGVyDQo+Pj4gTVNJIG9yIE1TSS1Y
IGFyZSBpbiB1c2UuIFN5bW1ldHJpY2FsbHksIHdoZW4gdGhlIGd1ZXN0IGVuYWJsZXMgTVNJDQo+
Pj4gb3IgTVNJLVgsIHlvdSB3aWxsIHdhbnQgdG8gZm9yY2UgdGhlIGJpdCBzZXQgKHdoaWNoIG1h
eSB3ZWxsIGJlIGluDQo+Pj4gYSBzZXBhcmF0ZSwgZnV0dXJlIHBhdGNoKS4NCj4+IHN0YXRpYyB1
aW50MzJfdCBlbXVsYXRlX2NtZF9yZWcoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQz
Ml90IGNtZCkNCj4+IHsNCj4+ICAgwqDCoMKgIC8qIFRPRE86IEFkZCBwcm9wZXIgZW11bGF0aW9u
IGZvciBhbGwgYml0cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8NCj4+DQo+PiAgIMKgwqDC
oCBpZiAoIChjbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpID09IDAgKQ0KPj4gICDCoMKg
wqAgew0KPj4gICDCoMKgwqDCoMKgwqDCoCAvKiBHdWVzdCB3YW50cyB0byBlbmFibGUgSU5UeC4g
SXQgY2FuJ3QgYmUgZW5hYmxlZCBpZiBNU0kvTVNJLVggZW5hYmxlZC4gKi8NCj4+ICNpZmRlZiBD
T05GSUdfSEFTX1BDSV9NU0kNCj4+ICAgwqDCoMKgwqDCoMKgwqAgaWYgKCBwZGV2LT52cGNpLT5t
c2ktPmVuYWJsZWQgKQ0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZCB8PSBQQ0lfQ09N
TUFORF9JTlRYX0RJU0FCTEU7DQo+PiAjZW5kaWYNCj4+ICAgwqDCoMKgIH0NCj4+DQo+PiAgIMKg
wqDCoCByZXR1cm4gY21kOw0KPj4gfQ0KPj4NCj4+IElzIHRoaXMgd2hhdCB5b3UgbWVhbj8NCj4g
U29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzLCB5ZXMuIEknZCBvbWl0IHRoZSBvdXRlciBpZigp
IGZvciBjbGFyaXR5IC8NCj4gYnJldml0eS4NClN1cmUsIHRoYW5rIHlvdSENCkBSb2dlciBhcmUg
eW91IG9rIHdpdGggdGhpcyBhcHByb2FjaD8NCj4NCj4gSmFuDQo+DQo+DQo=

