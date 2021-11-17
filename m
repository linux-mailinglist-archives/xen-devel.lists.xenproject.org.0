Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EBC454181
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 07:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226596.391609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnEsS-0003R5-0B; Wed, 17 Nov 2021 06:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226596.391609; Wed, 17 Nov 2021 06:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnEsR-0003OW-Sb; Wed, 17 Nov 2021 06:57:03 +0000
Received: by outflank-mailman (input) for mailman id 226596;
 Wed, 17 Nov 2021 06:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmy3=QE=epam.com=prvs=19557d9e99=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnEsP-0003OG-Va
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 06:57:02 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ea7c7dc-4773-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 07:56:59 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH5mLMY001573;
 Wed, 17 Nov 2021 06:56:56 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ccuhf06fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:56:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6322.eurprd03.prod.outlook.com (2603:10a6:20b:15e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Wed, 17 Nov
 2021 06:56:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.028; Wed, 17 Nov 2021
 06:56:49 +0000
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
X-Inumbo-ID: 8ea7c7dc-4773-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a77DueqCOFK+nKamu7H7fDBGQkyfHf2o+ycCjsvEVHcFkTt9HwtI63T4gr+7U8EJQWamrmYJe0pClKOBfdXXPWIGnhFe6izpsqb29HmgW6U4czbca0NuyLgOepEZl7KtYLmBmTNh/1yPf7eGNyr6PvIMN+6m5PkftN7lUWJlevmjqweZzQPxGAA4Baxgoo74QkfNH81UEQCYRi/GIQGQ0Ch3dyGWWKMd06JIZdLCtxWNILPuCiw642nTDMRux1DGJqzEygwZWvaWz7zu5x7O0Rn1vp41Ooh+G90+IouoJ4VXr5UCDOQyf0JzSpk7v1TTKNRWOZBpPJhMjoL3lBS90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIr/KvR55JsY5SmHhWTZTDsnqKW7PYjI1DBTHlH6H80=;
 b=WJFQpcyj3JdUBhLr7g5UV/XI/8DIHNIe4o/a7gFTG7GwzmkLRQldhYu5h/rk/xnK1CGeupOprjRVCUz8bd9vExkmQuX9PJ68XASbXvw3y72p2cJHAqqhlkYuCIF7zpysk+2q+CwRZo16OEYjjBwzKYClkD9xJi3YrSvRbHNags4o8FyumCx95yp8ETz6wZfcYQDKO8dgRp6+mQXrcrAOGszt1uQJVL+oYIIoZHYFIqFcFBhGDU1vL4ld8U42FXyARz9kbdrehyMZ7BMkLOZB8eQnoucTGIGCC3aaxX/7d9DjrNK3M7WM73UHmny1Hnxtd0DHOnoyBdsXYbsPghneQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIr/KvR55JsY5SmHhWTZTDsnqKW7PYjI1DBTHlH6H80=;
 b=CIA0uxmw0Cha6JFLfREnM3R2tR17S2FMfUZYHlROSNNP2bHqdO+5B5lcatjrn5xDDVLhJMJGDVSkUcllmTzEJUcnPouaxX0qc50N0tSPcXKYx5dnRCspyvXnGBUep0AmAhVA07m1JJ0ZCHS8fx3RMU/BsxWovvrAtVP7WXGLHIImk985a64akAzel6GCAoN1dYtceOmK9UPPicmo/Cq1A7DAkMb/U4DxoZVch+2z2f16EDaYeY19ABy7Rt0PG1wRwJc5PQB64hbAjV+wJ2sn9HhqIlzWJQHO/kEEVrzVucdrOgJgAHts2nBEii5Tr8dLAVFIPEpB2CwGj2MhUAcggw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Topic: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Index: AQHX0g8QVTbfP59mVU+LM2unTUGOtawGkRQAgADLYgA=
Date: Wed, 17 Nov 2021 06:56:48 +0000
Message-ID: <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
In-Reply-To: <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14b64536-de3a-4b9d-f58d-08d9a9976d7a
x-ms-traffictypediagnostic: AM0PR03MB6322:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6322FFEFAD373AB4F62CF108E79A9@AM0PR03MB6322.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4jDYYzl98WJrbKysmMdb2lsGmpJKLKjAf28VjbK14G9xAvBBv8DrajC7m3eM/oR5kVVVW1a/eVNvMqwR5gLGd25aLvSdl7imd0yZpBwgq1nT/BKBxPe/QExdVnp/bTaJ5Bn8MkO6Cagz023hDQ6OZvRseETsBsnj5LjrUP2ICZVM7gcM9KV456PVcgo8KnP3t66tItteUjgtmC0CKOa1ck67bcKVHna3MyRj29wD+HIlthGo0YycmQOM/5YG501IDkqHOnLlaP2SYrpiG3eD/mzCsWbKmnZdlKYr4IADdYZlO+s7uG5HmlbzKOJFn7o6sZF21EBcEHZBEN/jYKqMh1dXgXn6wJCBVjP9i5icmOuzYN2N7ZNOxix853dBX2ZhB/Q7YGEUO+sLSPC3giVzlEZ5OraZGoIkResih9ay+5fUeqJ9u8SQejUwjj7655zBSYx+AM2MHvpEhxPw2fLsu8ZLcROHM4vwRypov90DjBDwsGKaU92vHYfl7/K6ENylKWBWYKqwg5zJszXV+XQ6F9Ta26hLA9z3LZFmGL5KQSo82KikMBhK1idI2nvbqLLr2yHJ9x1jnKxAq8juGoz9kTzKZj3s3UkvVMFL1nvF6a3yPbXrwUAKGev+u2V5JM8dkrggblnxMemq2cECAECcB4dAa5aNj2UB8QuSJC3XIOea1p5eM2OQTof8IkrXoQHVnSDHry88P/pWALpUD5eVCNAe/etl5cOzvcmN5eAt0wy39BJeGACFS4aOcVhO6+CE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(76116006)(71200400001)(31686004)(4326008)(8936002)(66446008)(5660300002)(66946007)(7416002)(66556008)(2906002)(64756008)(66476007)(2616005)(508600001)(316002)(26005)(6512007)(53546011)(6506007)(86362001)(110136005)(107886003)(36756003)(186003)(122000001)(38100700002)(8676002)(38070700005)(54906003)(6486002)(83380400001)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?KzRkMXo4dHV2RUtqZGd3TzlQUDBSQkp2ZVM4MjJNMXo2dXNsVHI4NmhHSmRW?=
 =?utf-8?B?YXFxVGtvODM0ZTBKbXhUT0ttMVJ2bDAyQlBCQmJ0WUcyT2cxN0NDeFVJaXJS?=
 =?utf-8?B?NmZsSzJ0a2xYTkUzMEU2akVWU3lGazdjVTBwSGg1Q1ZVaytFMG5lLzVCRHJm?=
 =?utf-8?B?aVQ1WjVlQnc0VUJvcGpkYkhPM3RRWENCMElxWXV6bnluYnMwOHZ5eUU3bVhM?=
 =?utf-8?B?SjVudjhpT2llVFJmL1FVMlBIVGhmMjFGVXQrN20wUnUvenZCbk4vbVB0d2JX?=
 =?utf-8?B?Rmd5YWgrZ2tVUzNOWG9NQTNxRkJYVDA2V21icFRHUlcwYm1uZDlMWmoyZExU?=
 =?utf-8?B?UFpWZTFuL2cyUlJUOGpCV1Ezbk5zQ2ptLzIwb0JsOWxYdVJPKzNSTWRxRUt0?=
 =?utf-8?B?dG5NbVhacjBnRHlrczBsWmFjMk1HTm9nNWVDUm4yVXJRNFYzTnFLTVpCWEdE?=
 =?utf-8?B?d2piWWwza1F4SmlZTU9GL1ZCbjdSR0V6QnhUcmN6bkpPb2VqTUtJUkdHVm9v?=
 =?utf-8?B?d0lGZjlYM20yd0thY1A1eldKazh3TTJYelYwdHBLZXNHUFFhRG40MGUrQS9R?=
 =?utf-8?B?RTNzUjJFdlJoM3VXcWhqb0JtRHIvTS9KYVBXU2ZlNFl5RGNZTHoyZWtCdC9j?=
 =?utf-8?B?YWVuaUF0L2N4Uklrd3BqUTdpOVE4eTZrOXFhRkZZV0h2bXlQQ1VkeDVNU1pv?=
 =?utf-8?B?MEFFN0dYSXA4TnNFMzUrdHF3V2FNRU9zaWJRVm9uTkhVMDdVVmxLcW42OEN2?=
 =?utf-8?B?Q1Nub05GcXN5WEZJeXgxcVR5aE81bHluY0ZvSlFMNFBDVkN3SjU1cEZ5UXQv?=
 =?utf-8?B?K1ZCSmNyRG1iQmVsenFsU3ZFYlVPYXpIdkNDYzFVWC9iNm9vWDg0bzhQYUtB?=
 =?utf-8?B?MHAwUXFkZzFGc3o3NUoxV09qVjFGZUVYb2Q0NEdRN0xhdXU3d3crdk1tT2lS?=
 =?utf-8?B?bXgzZXNTYWNOclpQZENpNjlFeXVnTS9rSlFwYXZ5cnhSWjZ2LzlZWW5VT3NI?=
 =?utf-8?B?RkVGVWlRQ3pNdHlmaG5QQ3duZHdUT3p6QWU5dWlLbmQ2YTMzV0RYQklrTTFU?=
 =?utf-8?B?VEl3NVdJM3ZqZUZSa1JQYWN1R0pvV0JjdjZYSWt6NmdtTjBacE5Jd2hVV0hK?=
 =?utf-8?B?c2lUekUwUngrWXdFUmhJL0g5SVQzUHZENW10NUs0Z0d0ZmtDOVlvamo5MzhO?=
 =?utf-8?B?MXVBVVovMzN0QVlDeGd0Nk5WZkJvY0JubW5aSUtlbTBjNXgwUzBpTWdpZjdD?=
 =?utf-8?B?dFg2S0V4TnpGMzhsS2NVMFQxNEpDNW9ESnJIWHl0LzJoWGRpM3htK1NGWGhT?=
 =?utf-8?B?SXFNZjVGc3E5T2RraWRvc0tSbFl5VnBUellvbU1rVzE3WE5OOWRob3l0NmFi?=
 =?utf-8?B?ek9VVHZaTm1tSkRtNVI4OW5FQlZvUUFLUDYvZjFndnhGWHBvOUhnR3dzdElm?=
 =?utf-8?B?MHZreUR3OUNZbVZzb3NFQ0NSVEZGZjlCSWQzdHBDdEpUYkZYaUlpSTNPN09U?=
 =?utf-8?B?aVR4dXJhZ3dxSUdnYWlqY04yMFF2cCsxSDJXN2trbng1WWlXWThySldBdlI2?=
 =?utf-8?B?clRjeVZWQVFDeGNRcDdGbVlBUldnV1h5NVpKcnhNNTAvdzFQVW1kcXhhZE9n?=
 =?utf-8?B?amlsMm1mS0pheWVnWXZMUThhVmt0SXlsbkRsS3psOWZuYjdlMG1ZYU9wNjVG?=
 =?utf-8?B?RlhSSmQ3eXltSXFuQmt5dkwvT3RKZ2hGWGN1dXE3elVDcytwWXlMaGxYSUNt?=
 =?utf-8?B?MXJKQ0xtUlAyL2pmTjhubnJxOXFJaWlLZk9oRmNBbkhFNjhoaFQrOHV4Wnhk?=
 =?utf-8?B?TFJtSFJybGxNVHhFY2QxalRoUUtySVFzN2s3eXVobFJvdFJjYzFlYjVaNWlq?=
 =?utf-8?B?bDFJUmlVN3dxNEZpVHhDak0zZWZoVXVYZXZJd0hpeThzRHIyUDRkQklBWGtQ?=
 =?utf-8?B?NlY4czVqL21yd0tSMTlzbDNlSVRuT3Y5VFBSUGZLbzB6dTdUWmxvV2tYM0hh?=
 =?utf-8?B?cnJKaWk3b1RmSnBleGx4K3RocGRvaWM4MGt4N3I3RmIxdTRFSE10Wm9QVmFR?=
 =?utf-8?B?NkZXNGlsVnI5bTVaUEsyM1pqNkdvQ0RRdU9MTGN0QUl5YURCSnBmYmc3TGRK?=
 =?utf-8?B?OXV3TlpCczlQRDFWWi9mYlVlcWM1VWcySkI0UStIZjk4bmlsQVBaTUdLSkQy?=
 =?utf-8?B?dUcwVWRRNGI0L2hvWkZvTTAyYW1DeHYwZjMrY000Y05NZXNpc1d3UnNXbWs2?=
 =?utf-8?B?d2tPTzdNRUNnZC83MkFOZlhodUVrdE5TbTNhRnhGWTVHSzVjeTVYZ214L1B6?=
 =?utf-8?B?MzVQMGRKMlRISmtjWk90dy9tciswWTF6dE5iOEhCVk56NlVCV3hkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <596006657E82AD4C8F011C38D191EB09@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b64536-de3a-4b9d-f58d-08d9a9976d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 06:56:49.0540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ycThuRkejD6dPylhasHoeV7Pd3h3RL5A61YHYd4dFR8BAjLfXHlXKWRGdcfJ+1Y4zygtp70OdEgXcJqWHUTynUOGPAureNO7ugu7JLqKv0+5IIuAfyKNfOggQd11g5MU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6322
X-Proofpoint-GUID: kJqFq9RUq5c80ay6E6UCXG_U4O-31J3U
X-Proofpoint-ORIG-GUID: kJqFq9RUq5c80ay6E6UCXG_U4O-31J3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170032

SGksIEp1bGllbiENCg0KT24gMTYuMTEuMjEgMjA6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRlciwNCj4NCj4gT24gMDUvMTEvMjAyMSAwNjozMywgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gSWYgYSBQQ0kgaG9zdCBicmlkZ2Ug
ZGV2aWNlIGlzIHByZXNlbnQgaW4gdGhlIGRldmljZSB0cmVlLCBidXQgaXMNCj4+IGRpc2FibGVk
LCB0aGVuIGl0cyBQQ0kgaG9zdCBicmlkZ2UgZHJpdmVyIHdhcyBub3QgaW5zdGFudGlhdGVkLg0K
Pj4gVGhpcyByZXN1bHRzIGluIHRoZSBmYWlsdXJlIG9mIHRoZSBwY2lfZ2V0X2hvc3RfYnJpZGdl
X3NlZ21lbnQoKQ0KPj4gYW5kIHRoZSBmb2xsb3dpbmcgcGFuaWMgZHVyaW5nIFhlbiBzdGFydDoN
Cj4+DQo+PiAoWEVOKSBEZXZpY2UgdHJlZSBnZW5lcmF0aW9uIGZhaWxlZCAoLTIyKS4NCj4+IChY
RU4pDQo+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+
PiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4+IChYRU4pIENvdWxkIG5vdCBzZXQgdXAgRE9NMCBn
dWVzdCBPUw0KPj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KPj4NCj4+IEZpeCB0aGlzIGJ5IGFkZGluZyAibGludXgscGNpLWRvbWFpbiIgcHJvcGVydHkg
Zm9yIGFsbCBkZXZpY2UgdHJlZSBub2Rlcw0KPj4gd2hpY2ggaGF2ZSAicGNpIiBkZXZpY2UgdHlw
ZSwgc28gd2Uga25vdyB3aGljaCBzZWdtZW50cyB3aWxsIGJlIHVzZWQgYnkNCj4+IHRoZSBndWVz
dCBmb3Igd2hpY2ggYnJpZGdlcy4NCj4+DQo+PiBGaXhlczogNGNmYWI0NDI1ZDM5ICgieGVuL2Fy
bTogQWRkIGxpbnV4LHBjaS1kb21haW4gcHJvcGVydHkgZm9yIGh3ZG9tIGlmIG5vdCBhdmFpbGFi
bGUuIikNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBOZXcgaW4gdjYN
Cj4+IC0tLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jwqDCoMKgwqDCoMKgwqAg
fCAxNSArKysrKysrKysrKysrKy0NCj4+IMKgIHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29t
bW9uLmMgfMKgIDIgKy0NCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmjCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDggKysrKysrKysNCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiBpbmRleCA0
OTFmNWUyYzMxNmUuLmY3ZmNiMTQwMGMxOSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiBA
QCAtNzUzLDkgKzc1MywyMiBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3Qgc2VnbWVu
dDsNCj4+IMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogVGhlIG5vZGUgZG9lc24ndCBoYXZlICJsaW51eCxwY2ktZG9tYWluIiBwcm9w
ZXJ0eSBhbmQgaXQgaXMNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBwb3NzaWJsZSB0
aGF0Og0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqwqAgLSBYZW4gb25seSBoYXMgZHJp
dmVycyBmb3IgYSBwYXJ0IG9mIHRoZSBob3N0IGJyaWRnZXMNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKsKgIC0gc29tZSBob3N0IGJyaWRnZXMgYXJlIGRpc2FibGVkDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogTWFrZSBzdXJlIHdlIGluc2VydCB0aGUgY29ycmVjdCAibGlu
dXgscGNpLWRvbWFpbiIgcHJvcGVydHkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBp
biBhbnkgY2FzZSwgc28gd2Uga25vdyB3aGljaCBzZWdtZW50cyB3aWxsIGJlIHVzZWQNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBieSBMaW51eCBmb3Igd2hpY2ggYnJpZGdlcy4NCj4N
Cj4gVGhlIGNoZWNrIGFib3ZlIHdpbGwgY2hlY2sgdGhlIG5vZGUgdHlwZSBpcyAicGNpIi4gQUZB
SUNULCB0aGlzIHdvdWxkIGFsc28gY292ZXIgUENJIGRldmljZXMuIEkgYW0gbm90IGF3YXJlIG9m
IGFueSBpc3N1ZSB0byBhZGQgImxpbnV4LHBjaS1kb21haW4iIGZvciB0aGVtLiBIb3dldmVyLCB0
aGlzIGZlZWxzIGEgYml0IG9kZC4NCj4NCj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBhIFBDSSBk
ZXZpY2Ugd291bGQgYWx3YXlzIGJlIGRlc2NyaWJlZCBhcyBhIGNoaWxkIG9mIHRoZSBob3N0YnJp
ZGdlcy4gU28gSSB3b3VsZCByZXdvcmsgdGhlICdpZicgdG8gYWxzbyBjaGVjayBpZiB0aGUgcGFy
ZW50IHR5cGUgaXMgbm90ICJwY2kiLg0KPg0KV2UgbWF5IGhhdmUgImJyaWRnZSAtPiBicmlkZ2Ug
LT4gZGV2aWNlIiB0b3BvbG9neSBhcyB3ZWxsLg0KU28sIEkgcHJlZmVyIHRvIGhhdmUgdGhlIGNo
ZWNrIGFzIGl0IGlzLg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzID0gcGNpX2dldF9ob3N0X2JyaWRnZV9zZWdtZW50KG5v
ZGUsICZzZWdtZW50KTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggcmVzIDwg
MCApDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXM7DQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNlZ21lbnQgPSBwY2lfZ2V0X25ld19kb21haW5fbnIoKTsNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRrKFhFTkxPR19ERUJVRyAiQXNzaWduZWQgc2VnbWVudCAl
ZCB0byAlc1xuIiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzZWdtZW50LCBub2RlLT5mdWxsX25hbWUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQ0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzID0gZmR0X3Byb3BlcnR5
X2NlbGwoa2luZm8tPmZkdCwgImxpbnV4LHBjaS1kb21haW4iLCBzZWdtZW50KTsNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggcmVzICkNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1j
b21tb24uYw0KPj4gaW5kZXggZDhjYmFhYWJhNjU0Li40NzEwNGIyMmIyMjEgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiArKysgYi94ZW4vYXJj
aC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiBAQCAtMTM3LDcgKzEzNyw3IEBAIHZvaWQg
cGNpX2FkZF9ob3N0X2JyaWRnZShzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UpDQo+PiDC
oMKgwqDCoMKgIGxpc3RfYWRkX3RhaWwoJmJyaWRnZS0+bm9kZSwgJnBjaV9ob3N0X2JyaWRnZXMp
Ow0KPj4gwqAgfQ0KPj4gwqAgLXN0YXRpYyBpbnQgcGNpX2dldF9uZXdfZG9tYWluX25yKHZvaWQp
DQo+PiAraW50IHBjaV9nZXRfbmV3X2RvbWFpbl9ucih2b2lkKQ0KPj4gwqAgew0KPj4gwqDCoMKg
wqDCoCByZXR1cm4gYXRvbWljX2luY19yZXR1cm4oJmRvbWFpbl9ucik7DQo+DQo+IFdlIG1heSBo
YXZlIGEgRFQgd2hlcmUgb25seSB0aGUgbm9kZXMgdXNlZCBieSBYZW4gaGF2ZSAibGludXgscGNp
LWRvbWFpbiIuIEluIHRoaXMgY2FzZSwgd2Ugd291bGQgZW5kIHVwIHRvIHJldHVybiAwLCAxLi4u
IHdoaWNoIG1heSBoYXZlIGFscmVhZHkgYmVlbiB1c2VkLg0KPg0KPiBUaGlzIHdpbGwgcHJvYmFi
bHkgbWFrZSBMaW51eCB1bmhhcHB5LiBTbyBJIHdvdWxkIHJldHVybiAtMSBoZXJlIGlmIHVzZV9k
dF9kb21haW5zID09IDEuIFRoZSBjYWxsZXIgd291bGQgYWxzbyBuZWVkIHRvIGJhaWwgb3V0IGlm
IC0xIGlzIHJldHVybmVkLg0KWWVzLCB0aGlzIHNvdW5kcyByZWFzb25hYmxlLCBJIHdpbGwgYWRk
IHRoaXMgY2hhbmdlIGFuZCBwcmludCBhbiBlcnJvciBtZXNzYWdlIHNvIGl0IGlzDQplYXNpZXIg
dG8gdW5kZXJzdGFuZCB3aGF0IFhlbiBkb2Vzbid0IGxpa2UgKGl0IHRvb2sgbWUgYSB3aGlsZSB0
byBkZWJ1ZyBhbmQgdW5kZXJzdGFuZA0Kd2h5IEkgaGF2ZSAiKFhFTikgRGV2aWNlIHRyZWUgZ2Vu
ZXJhdGlvbiBmYWlsZWQgKC0yMikuIikNCj4NCj4gQ2hlZXJzLA0KPg0KVGhhbmsgeW91LA0KT2xl
a3NhbmRy

