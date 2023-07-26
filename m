Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26B763A96
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570532.892391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgCx-0007fN-HF; Wed, 26 Jul 2023 15:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570532.892391; Wed, 26 Jul 2023 15:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgCx-0007cn-Du; Wed, 26 Jul 2023 15:13:47 +0000
Received: by outflank-mailman (input) for mailman id 570532;
 Wed, 26 Jul 2023 15:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KuT5=DM=epam.com=prvs=1571f163cb=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qOgCv-0007ch-EA
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:13:45 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01b72449-2bc7-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 17:13:43 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QBD7Y0026900; Wed, 26 Jul 2023 15:13:39 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2044.outbound.protection.outlook.com [104.47.11.44])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3s2wtk21cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 15:13:38 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DU0PR03MB9780.eurprd03.prod.outlook.com (2603:10a6:10:44a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Wed, 26 Jul
 2023 15:13:33 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 15:13:33 +0000
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
X-Inumbo-ID: 01b72449-2bc7-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l718wescjBx9Z++SBpwhwE/pw06CbBRMk5b6woE5Lt/N/woCvLG85e8OiOcx3ejxdmNMLXEoFOkFFBkSMQrxVMBKNQkWnMLtWaMjGCjbHM/hzqWBVYwUJsgdZblpLpRqmSpj8txiHi0oDQSnvvzsnOVZYpjbBsSoCW1mPcegHqm9Q16BdPSPbU5uJy3PZMkA75unl9acgkpNlBOad37+ttI5gPkAEadc4NqlchhzekhlyzPNAKfHOrViQTYMKHaLskIqWkT+j6kWfCdjMu8QVWaBPmukcduzmlyfjVVaovT5/I82srYTHinfQf3FIk0Oae0Vl1hIoKEkqASNJy3J6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr+eS77ylG4iI+Pt6PsZZob+13jF2qBqZatQSXE7LwU=;
 b=KccT8ovswkvFfJ5/IaE+Hj2uxVVWHnj01tnz064Cb+ALYvasK5bInYVzI+QmecVFI/7rrQ/lw8FTwKRBRv/MWJSq1WjNpPk8OmA3tzubZ/v/ScfV0prpcRTSsCN90vlBnXyfs7aMm4jpFx5Sw1T7FdGcgf70UVrdDpH7lehWuUxL5g9Mua4vmQgpyZc1HCNCWJVWyQ4fW7RDBAyMK5MT+qruAqO/AgHj2GwcZG//1QhG/PvxNrVjA3+npjFYH/jL+4lDaMllNz9UAd2VZTCnkCS31lSXUEQJ6Sw1v0SK3JFUjJvfPODsrGQf3mPFdY4j9RbgVVH8skRmywxdmCioUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr+eS77ylG4iI+Pt6PsZZob+13jF2qBqZatQSXE7LwU=;
 b=Kg/6NKqHXTnuIndB6V/jVVEjxVIjQmjX3Bhz8248/pEyY2M+NrRjeswhu6nuxwfyLkoTdP59oWiCXncCTT2gg6ndfhVPUCZPhm/+OMOr9slZxyEvBS4h4x8dqap23zNC34sJgkF3I7/khnNe1GeWAZg4FzjumalkvMQUyd+wqd58fSiTc4P8fds0ylx9565Ni4VnOc0nls1YBZJkLkKMa2GvZAzxB16vWzqMiT5EGC3l1X+phLhn7JJOpPhaf7nQU3QHB1pVF+DddpxMN6XP8UmRZu5zJMhMaSEqGf7A5KAxyk1UL4t9ww0oS8XeBJkKe6qg6VNgA95QeNXV1hSl0A==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Viresh
 Kumar <viresh.kumar@linaro.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Topic: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Index: AQHZv8uYlQiykVHkhkC1aQss9HQu9q/MIX0AgAAGYQA=
Date: Wed, 26 Jul 2023 15:13:33 +0000
Message-ID: <35a1988d-94a5-9f2e-2478-ab08268f02b0@epam.com>
References: <20230726141459.985463-1-olekstysh@gmail.com>
 <969aacb8-a608-be01-f0f5-34fb1cc61d62@suse.com>
In-Reply-To: <969aacb8-a608-be01-f0f5-34fb1cc61d62@suse.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|DU0PR03MB9780:EE_
x-ms-office365-filtering-correlation-id: 44532c63-74f5-47e8-60b2-08db8deae09a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0y8R1Shb+f6G7vzPyAhbCYsGdmz0CMNUsj8I+I/qdr5GSGQZ+yD+tzCVrz3oJrQtStebUCmz8zauLq0fWR9NeEmlInqjTKdU5I4lEaSDWGoP9OhF0TUJ48p7VVIRCLUulPTzYf/QDTl2RuV34v8C9mcANdOGkN6e+3l6LoOrvTPM6mmdGshyiFQjbdHJjxJPJbwxQr4lhiOfkf9XenQhtmv68uNEHmzfhK+B55r7YFVFG9eoMUeyT8cxgQjN9IIbNf6xvAYo52h2B8Ox3gJMoyeYEthzQXSHbQnfnz4SpZoECMwp5P3SnlqhcGAjtWWQfFXsnsazR+MZQoKB9wGANx9VOifour5WR2cJyK6LxeHhZbePPk8CUvKDyM5CuNXDPhdgDkxaqoT2cPsfLX7gAzv9R3IgD43UTKn3rY/ffDMPu5Hx+sUH57Cbi9xf2aFX4UVvyKr/y1zRpSwO9I8r0+3esbVEdXYLMLKOXZBdU0G9IQaDGcivBgjE9Kr/nypHpOtU/RyVMRX5glr4XVIjB0cTKEfzsBXRFNRf+SO+U7WgvKBdyZDBqm3rKsuwmXt8viQZO7EHUgoOO0IYeSvun6J+vKUSD3JqZnPbTePq2SKG7A09Jpdzpe+//VYbAlN3fz1tpBEaxpXAlGrWTd5prfBVi2aH8RWBiB2SL552sHawovVAoBDDnA5+Gxl3w1C1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(26005)(186003)(41300700001)(122000001)(53546011)(478600001)(64756008)(86362001)(66556008)(66446008)(91956017)(71200400001)(36756003)(76116006)(38070700005)(66946007)(66476007)(316002)(4326008)(6916009)(31696002)(6512007)(6506007)(54906003)(38100700002)(6486002)(5660300002)(8676002)(2906002)(8936002)(2616005)(31686004)(101420200003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkVOc2xVVlJQaElyT2cxUW1kR2NydUlnbGw2RnhVdE5ZNzk2UjQwQ0NOdGUr?=
 =?utf-8?B?dkZsZUpERFBuMnAxVjdWUmVILy9PeER2SmZTaXkxMmRKNXhmemc3bkpBdkp2?=
 =?utf-8?B?cW5kVjZaZ2tqWEJMNUhQRU1uNENYMmpCLzQyZTMvT0ZSMzVZVmNGVFRhR0Iz?=
 =?utf-8?B?NkRsNDVsNTFYMlc5NVJSTm1jYVpKNXZReEkyVVMrNDM0UVYwbXM5TXNwcExY?=
 =?utf-8?B?Qk0xbVdDcGZKL3UrUUxpaUZKN3VCVG5LMDhEUmxsQ1o5eTlUSjZDV2NOS0pn?=
 =?utf-8?B?bFR0eHdhbE5SNmozS2dzUWUrRVF6ZmRtdUdMTDRYbmFxK0tRR1NSd0NNZmxs?=
 =?utf-8?B?b2RYRUVVYWEvdzhDVVZ2bmdHTzFLMkYxMnI5bldkSmtkOG1hU1hGaSthbFZk?=
 =?utf-8?B?dGs5eHRwdkxOYVhtVEh4Y29UcFVhNlBFWkJHOTkxWSthNkUycXp4YjhDV3k2?=
 =?utf-8?B?bEJ4TzdqaHp5aW1TaVFXU0NuT3pQZEJWb1N3Ny8zMWhNM1l5VlltaXl0dkgx?=
 =?utf-8?B?RmZaOUhVWFBGSEZIbDlib0FJUUNCTEtCUEhrMW10b2lHeC9aZ2hYcU90Qnhs?=
 =?utf-8?B?clEwdEpreUZiTVBZOS81MENsUFowVzRxK081eWdnQ3YzL3A5MUYvamlqVWU3?=
 =?utf-8?B?ZkJJZU1OZHB0SitBOCtybHBPQ1JFeGRIYVZGMThGaEc0RFFYOU12bm9LamJU?=
 =?utf-8?B?TnJ4YjF3RGN2SmdYbytTYkc4aFA1RHA0ZmgwUUVrcHNkeEdWSFBraytGYno5?=
 =?utf-8?B?T2RLbVVUYVlGelo5Sy9HYTFscWQ0S2pCa045NFdXZVRRR2RVbTBiU0xnRUZY?=
 =?utf-8?B?bjNYdlZ5QjJUem1acVQrbjRNWDJ5RnJNcFh0bU1NQUViWDBzaGlxY1NFNzVY?=
 =?utf-8?B?bWsxckM3bytqbERWNjc0ZDE2ZDQwdFhaU3VMRExTcU9nOHBTVjA5OEtzNisr?=
 =?utf-8?B?d1JxMzBlcGd3VThvaTc2UGdLbC9pVjlZL2VubEg1allYVURZQ0ltZ0F6cWNl?=
 =?utf-8?B?ZWNpQkpnbXR6UzY1TUJzNFRRcHB3czNjYzVuQmVqWU1IWGtxWDNNak1VVnpN?=
 =?utf-8?B?TlBBUlE5K3M5YzNxbDI0QXF5cEIrOVdHekFLMEwybHNZK21lN1B2dVduM0xT?=
 =?utf-8?B?SWxyTzdXYTJRTDBCamVDdFV3ZHRCSTltb203NnZ3anFXaUxsSEVKMzNWOHdv?=
 =?utf-8?B?Y1ZBSUtCYmlEZ2VCWjFHUisrbm9yaXRlRy95Zjhsa1lIbFd5d3RxUDlLMUMw?=
 =?utf-8?B?UEFLYkhVckFlOGVvZ1A1RUhiZmhScHpOZHE4SXdiY256VExERkdCNXk4WjVv?=
 =?utf-8?B?M2U2QzZtT04zNDVQUEc2Z3lZNG5CVlNLLzBSSjBSVUtMNEZoL2lHOGZlOVpw?=
 =?utf-8?B?T0c1REJxcnM2KzZ4bjlkNXBGZXNJQUg2YkR1STYySW9CZjNzd3pzMHNPT2Er?=
 =?utf-8?B?K3UwT2JZN2lualI1RFFlb1ZoNm0rbjhOWnlrM3lLblNrbmRCSVJNWGJTajFk?=
 =?utf-8?B?bjVZLzlrRVJrNVpycCtoRVVXU1ZISGJqTSswYVlab3FhUnM3L3ZHUldBaEZr?=
 =?utf-8?B?Tmt5UjZXOC9rWXJRZTVpcVAzdG5HYnhLM2FhNGMyd3BQQk54VGRCdG9xZEpQ?=
 =?utf-8?B?d3l2Q2krZ0R3TUtXeit5aVllQi9sWW9rby80QWVpRk9rSWFVQWp4Q1FJQjc4?=
 =?utf-8?B?ZFJqOHp2OEs5L0p1QjVJWjRsdHhOWFNDRHByUmZzai8vd3JKNkxDWlhpYnd2?=
 =?utf-8?B?Q3hqc2d0VytMdFBicUJlQ1RVenhrYk8xcTBLcExPZW41MFdNV3pLbmlRaTNr?=
 =?utf-8?B?ZGlIak00ejJPb0s3TW1ZaWNldFJackVidXFvSmZtbzlWUHJlSW5peGJ6cG9Y?=
 =?utf-8?B?N3VsdURna2FadnFqcVdlTEx0UitlaUdXMTA5SDRnU25VOXdhMFVJeFpxQjlu?=
 =?utf-8?B?NEJkNW9GalVJcloveExobzFCcWYvZk5paFdYN01TQ2xUMkhiNEpGZXVaZ0dO?=
 =?utf-8?B?MndQV0l6aFZ1L0crN1Rxalp3N28wRXBrU3Z2WlQ3d21wQ1Z2S2ROTm0yMjYz?=
 =?utf-8?B?SUZnNVJNVC83MGd0N2VGL3h4b0FTRG9FT0p0Y2d4N2NXdk9ocTVlaFpaRmVY?=
 =?utf-8?B?R2ZGaUtvUDhsTzNGR1QwNm5WdGdwWk1tNjQyTUpvd0dJWVZIUHRncUdBOWJy?=
 =?utf-8?Q?JYnUfophCzSMCYRF+Hm7wNo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E54F1041148198468C32B760EED3D954@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44532c63-74f5-47e8-60b2-08db8deae09a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 15:13:33.2508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ed3aS8IhNOFPPw4pIivQI7YhSyB5zLR8eOK+TboiHZd7T1lcHMumXMHN6tNZ5j94XVDkxm2yKIiNqvrH5BKYgiXcLr40yD6sS5QRnuR0Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9780
X-Proofpoint-ORIG-GUID: TmcrXfujWJtQRCmEs5k5dT8TsSoizc1y
X-Proofpoint-GUID: TmcrXfujWJtQRCmEs5k5dT8TsSoizc1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=947 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260136

DQoNCk9uIDI2LjA3LjIzIDE3OjUwLCBKYW4gQmV1bGljaCB3cm90ZToNCg0KSGVsbG8gSmFuDQoN
Cg0KPiBPbiAyNi4wNy4yMDIzIDE2OjE0LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+
IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4NCj4+DQo+PiBXaXRob3V0IGl0IGJlaW5nIHByZXNlbnQgaXQgd29uJ3QgYmUgcG9zc2libGUg
dG8gdXNlIHNvbWUNCj4+IGxpYnhsX19kZXZpY2VfdHlwZSdzIGNhbGxiYWNrcyBmb3IgdmlydGlv
IGRldmljZXMgYXMgdGhlIGNvbW1vbiBjb2RlDQo+PiBjYW4gb25seSBpbnZva2UgdGhlc2UgY2Fs
bGJhY2tzIChieSBkZXJlZmVyZW5jaW5nIGEgcG9pbnRlcikgZm9yIHZhbGlkDQo+PiBsaWJ4bF9f
ZGV2aWNlX3R5cGUncyBlbGVtZW50cyB3aGVuIGl0ZXJhdGluZyBvdmVyIGRldmljZV90eXBlX3Ri
bFtdLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gICB0b29scy9saWJzL2xpZ2h0L2xp
YnhsX2NyZWF0ZS5jIHwgMSArDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2NyZWF0ZS5jIGIvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9jcmVhdGUuYw0KPj4gaW5kZXggMzkzYzUzNTU3OS4uYzkxMDU5
ZDcxMyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3JlYXRlLmMNCj4+
ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3JlYXRlLmMNCj4+IEBAIC0xODg3LDYgKzE4
ODcsNyBAQCBjb25zdCBsaWJ4bF9fZGV2aWNlX3R5cGUgKmRldmljZV90eXBlX3RibFtdID0gew0K
Pj4gICAgICAgJmxpYnhsX19kdGRldl9kZXZ0eXBlLA0KPj4gICAgICAgJmxpYnhsX192ZGlzcGxf
ZGV2dHlwZSwNCj4+ICAgICAgICZsaWJ4bF9fdnNuZF9kZXZ0eXBlLA0KPj4gKyAgICAmbGlieGxf
X3ZpcnRpb19kZXZ0eXBlLA0KPj4gICAgICAgTlVMTA0KPj4gICB9Ow0KPiANCj4gIEZyb20gZGVz
Y3JpcHRpb24gYW5kIG5hdHVyZSBvZiB0aGUgY2hhbmdlIHRoaXMgbG9va3MgbGlrZSBhIEZpeGVz
Og0KPiB0YWcgd291bGQgYmUgd2FycmFudGVkLg0KDQpMb29rcyBsaWtlLCB5ZXMuIFRoYW5rcy4N
Cg0KSSBndWVzcywgdGhpcyBzaG91bGQgcG9pbnQgdG8gdGhlIGNvbW1pdCB0aGF0IGludHJvZHVj
ZWQgDQpsaWJ4bF9fdmlydGlvX2RldnR5cGUNCg0KRml4ZXM6IDQzYmE1MjAyZTJlZSAoJ2xpYnhs
OiBhZGQgc3VwcG9ydCBmb3IgZ2VuZXJpYyB2aXJ0aW8gZGV2aWNlJykNCg0KDQo+IA0KPiBKYW4=

