Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993D976516B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570998.893762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyO9-0004NL-1Z; Thu, 27 Jul 2023 10:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570998.893762; Thu, 27 Jul 2023 10:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyO8-0004LF-U6; Thu, 27 Jul 2023 10:38:32 +0000
Received: by outflank-mailman (input) for mailman id 570998;
 Thu, 27 Jul 2023 10:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn4a=DN=epam.com=prvs=157204e9ea=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qOyO6-0004L9-S1
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:38:30 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b925c9ff-2c69-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:38:29 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RAQPwG006731; Thu, 27 Jul 2023 10:38:25 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3s36wyu425-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 10:38:23 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DU2PR03MB7848.eurprd03.prod.outlook.com (2603:10a6:10:2d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 10:38:03 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 10:38:03 +0000
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
X-Inumbo-ID: b925c9ff-2c69-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTwqXwOz/seFC69WulJWy9viYNytZMIoni3gzkpGTiA0PhSIovpoeZIWX/2gvIfTau/olTE/T0yZJvFq1z2OjhBqxnn8ZyOY1q6mj4LeezCvnzTn1QdF87QALssaZM89MApwEOS3Hkcw/7+XATIFfpaMhRYXbw3XumiDl9SR+VSpHV9y76EGfsru4r+y8vFR7cb+TOWAe/HD4tomvFcgbjtdjn72NAU7b1tFZqeT64xEYLsErE6E9APKZ24FY+JysOiUYGHoOi5+GQD8rUhxF/8140VDToRTTt05dSKXoXiVkd+vJnNNZu2PpkEg4dsjyL4bPczBXaiZpsrNavHfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwE9A2LIVRsx1sJwOm8QTIoJsbgF1CFusqbdAye2whU=;
 b=Ao3dX1zYC6+xAmZw8NS+cI4A9WDLB/Hr7CyQ553TMEy1UYJQCNhR+hWYFYqe9MYvNbt/etWMe0OU7C4igvlJyZm3B5pWXn2BK0JoJM5F+WsM+ICWJq/Ez17lANR/GWtFAujeGnG0xJB4+BEl/IeYhEnORkTUpRh6LCiRWs0Yoxo+5ue7QJt4pysb4wXsIS6r/9aS65WZb1/g303jUI+oaGeFuYPYRNOoW0qpkmaZVVPtSACMzFQrfjBxqYaYNzeAps1dVboTWCwS7Hz0ZjFqOPVcH3FStPve6GMBMcVx618JrvtJF7K1IZ2W8TUFntbfj7vCdFGJ1vSnNv3zfVHCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwE9A2LIVRsx1sJwOm8QTIoJsbgF1CFusqbdAye2whU=;
 b=iHGQn9eIS+n0dNc0fuIlhYEI/XXLP2sXTluCuA76OxvaRzYEHkLN4mlRsO7hJ4xzA35GDeKMMMncbJjHentLeaP4YncNeN25ad6WycpQkZRMLAWc8zv93EuDpcrGeCD5BjIudyPaVtsIJTrlXRrtFFkWtr071F0bN/uyUgdKtrRUn3rj5L5rEyMhuh7Z3VwHD06KXB9RXJeZkUVEFObX1U9esqpXlKXlwv7tkad6A6MzyR9ftv1xH0cy8SqGqm5se8OvPvHzD0JLsCbMJzbqSaHJd6QD7K2hPd3qxe4nF6wkbc5mzCxbQwjQDCYX4kzVpMXh4vsJkPCHZmNhT75qMg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Juergen Gross
	<jgross@suse.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Topic: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Index: AQHZv8uYlQiykVHkhkC1aQss9HQu9q/NX+QAgAANWwA=
Date: Thu, 27 Jul 2023 10:38:03 +0000
Message-ID: <5360d7ae-b754-99f9-686f-882bdc33e7eb@epam.com>
References: <20230726141459.985463-1-olekstysh@gmail.com>
 <670c22f9-135d-4022-8272-78af3e28c011@perard>
In-Reply-To: <670c22f9-135d-4022-8272-78af3e28c011@perard>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|DU2PR03MB7848:EE_
x-ms-office365-filtering-correlation-id: 1c76d446-a178-4e30-f1bb-08db8e8d8e66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 t8lJKnXq/8eDRtgsXliM2LGZp8wQagYUOtDrkMtIDeu++kMrtxzZJGIRV4LgLc+nuNqHu4PdaUVzwrOmVNTFJyTWp3XA1s7+KvVfou0M2JfLaDVh+hIvtNcYa5YihXSqEz950Ca4EEMX5zdcxZdUEtRK7FhdfBv2cn4GBUXDJrqXG3e2iFKqYPjuSs84Texva21q+34VVSaeS4aq8UC7r13fnnp4JTNqc++rklzsk7UZ6/XVBKaVmIK6/XKSlkobizyP+I5cMvtfPTIOKwxzBaSbAeIrv2BNcZbChnOs7QKd4OV8O/O0NUAjGXLpbCtJtfGgUyDnwT6igpaYcCIPDkDLMKOtgz728aTN/QnHQ6axq4SpTG2EmFBpzixtQ4Kot0QUoNVyvivuallOeUD8SV7ikwa25LaK0o+giVVKWOPn3LI3vbA8AQYzrmA5Dun3uBLBpNxkM6GgCK2Ds5Ho+mwKWKW58oCkUr4JjKtPNnHzPznOurBduGo2JwIsmBnPxteUNAKXxiDOw9JU5ugFSazKVqM1wpwjejumy6FjXGUxXWN3kj4aSrifkUiexaehLJGwgS1/Bl6X+AEIKxF6JIXiJNSDwuJI6edunaoZU3ygY4H/dFpxc+Y0aZXo7rqvvyZRcX9WyqH+CZCSFOgGZxFu8z7Nd71dUDXGSPqmrm54qgNsVYOZyq6Cj48J81NA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199021)(6486002)(83380400001)(71200400001)(478600001)(26005)(53546011)(6506007)(6512007)(2616005)(66446008)(66476007)(38100700002)(91956017)(122000001)(54906003)(66556008)(64756008)(6916009)(4326008)(186003)(66946007)(76116006)(31686004)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001)(86362001)(31696002)(36756003)(38070700005)(101420200003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zk9YSTdnZ2laRkRZUmRRWnB0Tk5tU0NTV1RhK3FSY3hTSDR2R2FJdlM4MHo5?=
 =?utf-8?B?R3ZxMWp3K0h2MTduSlFKQUZYYk53Q2cwMHlLYjdYZ0xvTEJmRWlFYi93cFJv?=
 =?utf-8?B?aEtWa3lESzhNQUhoTG5PblNtSEdiL2E0QUt2NzI3eXV2THd4aC9sSk56UExp?=
 =?utf-8?B?WnhScmxvRVV4NHJNS2RRVnpTcUxDMHZWY3d0VktUNndwNk5pSzdWYzRzNjht?=
 =?utf-8?B?b1U3ZUk1eDZDMnhLUUlwSGFQUUhaY3NWWkx4VjFlUVBGWTcvd1BKZDhaOUJZ?=
 =?utf-8?B?VkU3bnhqMVpZaEJGYnBIUW5LWXhob2NmeVd6V1ZNK3R6dXkva012Z3hsemNv?=
 =?utf-8?B?WW9XUlFxb01RN2tkMGw5K2pkT1IyMHE5OGVPMEp6bTUrSDdZa2lpdDBVclhi?=
 =?utf-8?B?M1dMMHowN1Ayd3daUDNmVG9QSzRDOTNtMi9ZM3VzWTVCSkdmb1pIUUpseHNu?=
 =?utf-8?B?emZnYWFTblcwOXlQN2xpRzlnanVmTkwxY3J6VVFlUkJnN1NCYW5TU3hKU1h3?=
 =?utf-8?B?UDdWRDBJZWV6bjl2a1JNSkN2UmFtTkdaWXJncVFwSFFxUXhJUDVzSGsvOEJK?=
 =?utf-8?B?bEhGZndXd3EvVDRUdDgvRVRhTVVqV3MrRGZPZDRBNFlUV2RNQk1hOWVTcW1R?=
 =?utf-8?B?dFF5djF6WkpUNjdJclFtWmp4dHBXNGtkRXpwaWlIcHBhWnYreUNtN3VzMEVa?=
 =?utf-8?B?RU1WS0RXZnRQNis5aGVucmJRMk9uT2tveTlQenllejZiRHZRNThnM0x5Y2pw?=
 =?utf-8?B?ZnJLcW9PYWEzTHBhOGJaVVNhSEFld1dLVVoza2NkSVF2QUZXL2VXZXBVU1hU?=
 =?utf-8?B?V1liYWRHNHFXdGs2VVJJUFpUTy9pMThXYkQycVJRUVBTai9iY2YzOHJUWmRv?=
 =?utf-8?B?TG5zNk40MDh2emV2UmVKZjNWVFJOZlJZVFRmYStuUmR5clhIK1Y1aFhGT1dT?=
 =?utf-8?B?MDBlVDFtS1R3NFM3MWVXeFVSQXlrdGVXMEFmS2JBdVVVcDRmeW1FUG5FRlVF?=
 =?utf-8?B?NmdJdzFPdmkrMThtVVJvenZ2dHZPSVV3bTBpWXBFWHNKN2pNa09GbTdhMHJs?=
 =?utf-8?B?RUZVVXU2RnhNUUUzREhGQTd5MjltRmJkVkNnZzhERWpUWERwNW8xY091SjF1?=
 =?utf-8?B?Ym1lNnR0WGdXTExpeTA1aDUvbmhDSEFtRGFpMnA0VXY5ZzlKMy85N3NNTEdJ?=
 =?utf-8?B?K2RKejA0YkVJa1VCSDA2dCtnL3B2Um9lWjRTeE5OcGtGTGNXSUM1TjlZbnJM?=
 =?utf-8?B?am9DcU1UWlNVSHdEL25PTVdjRm9rSU0xeTVNNlBwb1B1SS9LMlM3WFJjajll?=
 =?utf-8?B?T0VhQk96Tm16UmNOb2E1T3FpS01rUTVwUDU5cmVVaW1qeHpoMzJJamxhSGlL?=
 =?utf-8?B?ZmJYYzJiajFBSTNVb0RnTFQ0Skl4YkxETmkzdm85ME9NcVRhNWJEemg1Qjhn?=
 =?utf-8?B?QURJYmZsMEp6VmdyOHpIZjdHNjBQblZUNlRTSDlLRmFlZ1pXb29wTTJpTFBG?=
 =?utf-8?B?V3RscG02bG1DaGVEZGtzMjdEUnJPb2NMaGM3UVk3cXNzZ3FiNzE4L1VVd1pS?=
 =?utf-8?B?OElyQ0F4TzJJcXhHb2x4VHhxaGEyc3BhQlg4VGtSVTFIUXJuQnRuTzZVR1J1?=
 =?utf-8?B?UFZjTnZvcW5EbU5yc3V1UGJjZXN0NnhDYVlCYWlhQmV3ZWNyWDFySHB4UzdM?=
 =?utf-8?B?bGZ6RVQ2Z3h5RDdBOXB5MEkzS25DSXVqTEY2VVVIMnhtbTVuUXEzNnk0Mi9U?=
 =?utf-8?B?RVdHQk5sdmdHeVFSK1BMMmIxL25BWHdYVU9vRlF0dE05ck9kL0lFUElUVUgy?=
 =?utf-8?B?eUlLWmtUekNKbzdMTFlQN1VBckxVdFhuUWlKdk5TOXJXUFNiNlpNNHlvR1lH?=
 =?utf-8?B?a2RTa2dITlRYSnJRLytrOHd1b2JDSFpFdmhVQmk1NDd6WTA3M0RzdmNITGpp?=
 =?utf-8?B?TmtOMzZjUlVuWG8zVFUybzFTZU5PL2lzdWZoSDJHWENZc1RmcVJEempVVVZR?=
 =?utf-8?B?UHZ3eWpQbjc5VmNaZHNOZk1HRys1YnB2NHR1MGJJak1iUnlJSmJlUHRraEdv?=
 =?utf-8?B?YXFMOUNldThHM2VkemZ5a3owemxLUWQ2bU5zQ0t3UTJNZ2VlMFcxb2dyQ2o3?=
 =?utf-8?B?T1pPSXhxRFUrNWd5ekZ1VDZ4eEdxb21PZnR4T1YxcHE0T1VSWWh4bmNPSWp1?=
 =?utf-8?Q?vBzxc3Xxhg64WTVwrOE2kck=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <547A6BD1FE1BCD4D831DF14A0F186EDC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c76d446-a178-4e30-f1bb-08db8e8d8e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 10:38:03.3603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5NhRU6uOvkN9Z59o5wf6lQdxR97H7s9OIzURuT49kfDtwo0Gf6gGCeSNUh6TKF+3qSIHaEaUOLsWXRgiAYKM22HiZ3cfJVaNDKnhRfxFPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7848
X-Proofpoint-ORIG-GUID: UrmSiBSJsAGPEcmcIXacaWAYmXC_kBF5
X-Proofpoint-GUID: UrmSiBSJsAGPEcmcIXacaWAYmXC_kBF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_05,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=690
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307270095

DQoNCk9uIDI3LjA3LjIzIDEyOjUwLCBBbnRob255IFBFUkFSRCB3cm90ZToNCg0KSGVsbG8gQW50
aG9ueQ0KDQo+IE9uIFdlZCwgSnVsIDI2LCAyMDIzIGF0IDA1OjE0OjU5UE0gKzAzMDAsIE9sZWtz
YW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9s
ZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IFdpdGhvdXQgaXQgYmVpbmcgcHJl
c2VudCBpdCB3b24ndCBiZSBwb3NzaWJsZSB0byB1c2Ugc29tZQ0KPj4gbGlieGxfX2RldmljZV90
eXBlJ3MgY2FsbGJhY2tzIGZvciB2aXJ0aW8gZGV2aWNlcyBhcyB0aGUgY29tbW9uIGNvZGUNCj4+
IGNhbiBvbmx5IGludm9rZSB0aGVzZSBjYWxsYmFja3MgKGJ5IGRlcmVmZXJlbmNpbmcgYSBwb2lu
dGVyKSBmb3IgdmFsaWQNCj4+IGxpYnhsX19kZXZpY2VfdHlwZSdzIGVsZW1lbnRzIHdoZW4gaXRl
cmF0aW5nIG92ZXIgZGV2aWNlX3R5cGVfdGJsW10uDQo+IA0KPiBEaWQgeW91IG5vdGljZSBhbiBp
c3N1ZSB3aXRoIGl0IGJlZW4gbWlzc2luZyBmcm9tIGRldmljZV90eXBlX3RibFtdID8NCj4gQmVj
YXVzZSB0byBtZSBpdCBsb29rcyBsaWtlIGFsbCB0aGUgZnVuY3Rpb25zIHRoYXQgYXJlIHVzaW5n
DQo+IGRldmljZV90eXBlX3RibCB3aWxsIGp1c3Qgc2tpcCBvdmVyIHZpcnRpbyBkZXZ0eXBlLg0K
PiANCj4gZG9tY3JlYXRlX2F0dGFjaF9kZXZpY2VzOg0KPiAgICAgIHNraXAgdmlydGlvIGJlY2F1
c2UgIi5za2lwX2F0dGFjaCA9IDEiDQo+IA0KPiBsaWJ4bF9fbmVlZF94ZW5wdl9xZW11Og0KPiAg
ICAgIHNraXAgdmlydGlvIGJlY2F1c2UgImRtX25lZWRlZCIgaXMgTlVMTA0KPiANCj4gcmV0cmll
dmVfZG9tYWluX2NvbmZpZ3VyYXRpb25fZW5kOg0KPiAgICAgIHNraXAgYmVjYXVzZSAiY29tcGFy
ZSIgaXMgImxpYnhsX2RldmljZV92aXJ0aW9fY29tcGFyZSIgd2hpY2ggaXMgTlVMTA0KPiANCj4g
bGlieGxfX3VwZGF0ZV9kb21haW5fY29uZmlndXJhdGlvbjoNCj4gICAgICBza2lwIGJlY2F1c2Ug
InVwZGF0ZV9jb25maWciIGlzIE5VTEwuDQo+IA0KPiBTbywgSSB0aGluayB0aGUgcGF0Y2ggaXMg
ZmluZSwgYWRkaW5nIHZpcnRpbyB0byB0aGUgZGV2aWNlX3R5cGVfdGJsDQo+IGFycmF5IGlzIGdv
b2QgZm9yIGNvbXBsZXRlbmVzcywgYnV0IHRoZSBwYXRjaCBkZXNjcmlwdGlvbiBtYXkgYmUNCj4g
bWlzbGVhZGluZy4NCj4gDQo+IERpZCBJIG1pc3Mgc29tZXRoaW5nPw0KDQpObywgeW91IGRpZG4n
dC4NCg0KSnVzdCB0byBiZSBjbGVhciwgdGhlcmUgaXMgbm8gaXNzdWUgd2l0aGluICpjdXJyZW50
KiB0aGUgY29kZSBiYXNlLCBJIGFtIA0KZXhwZXJpbWVudGluZyB3aXRoIHVzaW5nIGRldmljZS1t
b2RlbCBiaXRzLCBzbyBJIGltcGxlbWVudGVkIA0KbGlieGxfX2RldmljZV92aXJ0aW9fZG1fbmVl
ZGVkKCkgbG9jYWxseSBhbmQgbm90aWNlZCB0aGF0IGl0IGRpZG4ndCBnZXQgDQpjYWxsZWQgYXQg
YWxsLCB0aGUgcmVhc29uIHdhcyBpbiBhYnNlbmNlIG9mIGxpYnhsX192aXJ0aW9fZGV2dHlwZSBp
biB0aGUgDQpzYWlkIGFycmF5Lg0KDQpEbyB5b3UgYWdyZWUgd2l0aCB0aGUgZm9sbG93aW5nIGFk
ZGl0aW9uIHRvIHRoZSBjb21taXQgZGVzY3JpcHRpb24/DQoNCiJQbGVhc2Ugbm90ZSwgdGhlcmUg
aXMgbm8gaXNzdWUgd2l0aGluIGN1cnJlbnQgdGhlIGNvZGUgYmFzZSBhcyB2aXJ0aW8gDQpkZXZp
Y2VzIGRvbid0IHVzZSBjYWxsYmFja3MgdGhhdCBkZXBlbmQgb24gbGlieGxfX3ZpcnRpb19kZXZ0
eXBlIA0KcHJlc2VuY2UgaW4gZGV2aWNlX3R5cGVfdGJsW10uIFRoZSBpc3N1ZSB3aWxsIGFwcGVh
ciBhcyBzb29uIGFzIHdlIHN0YXJ0DQp1c2luZyB0aGVzZSBjYWxsYmFja3MgKGZvciBleGFtcGxl
LCBkbV9uZWVkZWQpLiINCg0KDQoNCg0KPiANCj4gVGhhbmtzLA0KPiA=

