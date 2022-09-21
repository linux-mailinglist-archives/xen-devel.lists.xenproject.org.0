Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1DA5BF2A9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 03:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409636.652644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaoOv-0000RP-26; Wed, 21 Sep 2022 01:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409636.652644; Wed, 21 Sep 2022 01:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaoOu-0000OZ-V6; Wed, 21 Sep 2022 01:19:44 +0000
Received: by outflank-mailman (input) for mailman id 409636;
 Wed, 21 Sep 2022 01:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ctx=ZY=amd.com=Ruili.Ji@srs-se1.protection.inumbo.net>)
 id 1oaoOt-0000OT-CK
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 01:19:43 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 768b2a97-394b-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 03:19:40 +0200 (CEST)
Received: from DS7PR12MB6006.namprd12.prod.outlook.com (2603:10b6:8:7d::19) by
 MW3PR12MB4441.namprd12.prod.outlook.com (2603:10b6:303:59::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.21; Wed, 21 Sep 2022 01:19:36 +0000
Received: from DS7PR12MB6006.namprd12.prod.outlook.com
 ([fe80::9471:931d:b1ef:d8a6]) by DS7PR12MB6006.namprd12.prod.outlook.com
 ([fe80::9471:931d:b1ef:d8a6%7]) with mapi id 15.20.5654.014; Wed, 21 Sep 2022
 01:19:36 +0000
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
X-Inumbo-ID: 768b2a97-394b-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9EiOL/7a6kpKMD6HExfdHOZgQudH1+mcPtUomtQ0l9X4MzRb8GBotpB3XMmWpOCr5ZtQdV4gJeRNyJhaiahZT+GHy2mJ0DaBoJzEUqUj9/haxFU6bVNItHvvPuxDn869i9iVhdY5vmTSmBAztqRfj7EdP/C9e+cZCQSm7tAp/bfiqech4OREpBh7BnDrpVJTvncvtf1v9Zhg9S/ePxqZRtpTOMR3olwq0Ar9uHPhSqyQKM358SNVZQT2atq8uSewcMtpK4mfkZPiK1cG2EVn76RqKp3yNr72KWVPY/i/0PMByPL6coboHTbhcfhATKuYZzpx4kWVIPuFFoUUqp7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQSCFEVGlbV6AIA31BdYy0G7kngG8aXhhIxABFsbBDg=;
 b=m/Rv5w70eBmHPu4MLsXrHBr/zRiexTja7Koms/22cpsUiGQtDe01K3GQlTtu3WV/BtEt5ANbgElS9GijjCo+HtRzuNY/XrN2TZKCDq1j3UGSgrEUvkSQqZTNePXDCremN05Aypdnno4TxE2eE8DR9JYkDDcZUVCvBWnzcs6jI6AIfZ6i2TvjDXZOgH4JdLohyF8UNmWbV02oTbQSjh9hHNbFaOmoKcfe3KuTCN11HK9kdfdDjj4bcmrtXP7jzCSmu5sKJF8CzAVde4p9/yXjQ8xPZbX3UA9nn084mHSUndrJbwNs5AnhWxBvLxnUoU76U/C5Li3gAlWi8+w82xYJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQSCFEVGlbV6AIA31BdYy0G7kngG8aXhhIxABFsbBDg=;
 b=DsokLX8GNGIzX/PT3pOrnGWXivjW004uJa80waafVCfLP8Mtdp5tBXgYEZV6hIihPrRQicKslqg4XQLkxUjwGRbdufdUqlwuuMawfpkOuyWIXNRIhwY7/a0Z0k6ndMlJTEIGDialGVuGerah4YsxH3rWbC8ss6BvUm6XIXOYhdo=
From: "Ji, Ruili" <Ruili.Ji@amd.com>
To: Paul Durrant <xadimgnik@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>
CC: "Liu, Aaron" <Aaron.Liu@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Topic: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Index: AdjBw9S5XjagBB9xT0W01YXm2Fq4yQAkLQ9gATHwuGAAP0mxgAAB/V+QAU1c5pA=
Date: Wed, 21 Sep 2022 01:19:36 +0000
Message-ID:
 <DS7PR12MB60068137A02E32BE77526E439B4F9@DS7PR12MB6006.namprd12.prod.outlook.com>
References:
 <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
 <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
 <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=fe71ddb2-53de-4503-92e7-b763c759a0b3;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-14T10:04:41Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6006:EE_|MW3PR12MB4441:EE_
x-ms-office365-filtering-correlation-id: 6f45cfa1-b083-4e66-9f13-08da9b6f5953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LtsR/xlK4inUCksRty8K4uH2WdUNw8Sn2wI0RiSsH3+xSekqZduOfK+jShtRhhpeN9QLC6VhjucHNsDPD9s5DA3jNmuUALNrxrM5JilnZ32p2tT65uhzWTv2EMnEa2tyIjP4oq3SNs61r857MlvMz+0cRqc1GadTxcLuAibx5X1pMKaQqMCqwBXx7nVmHlDwIANHzkZAt12HbvEHpPvZGip6QRE3og9EmfN99vGrLVlE68hs6cvmAO9dZGykySv4F8YbTWNiPKqTSpU2mvq66sNhcX9zG42HtVhrlo8aAj3zxHFhhvjxJFzNYWqJQAMp/T7wB9cdIWasa08xbCFER+di6Wdh+XdV+P9Zh7fFDELSpq2ovBD39ZuuhBFkPMmAsOerCJ8Yhm90iVyY3RClvoGXBCc/TekmTaWg3y64mZCD/OngFhC8aM+9CZX0mFgMXjvwctz1Sq93tyuySK+o3i4koo5zHNJg+uAE3byRn2sxoD6SbjYZayhyRhFDoGMPZJWokmaAwrGUJygYLZ0YEdB0+Jp5zPkhEGGO5i5ogjcWZrQ+72YsIebzLsXvY4EzzY/7h4R5WbWI6p7/vDEfNXDB2s/NvvLGIFRiixuDBigi03I5K8DJ2H13M+ebYkyzA/teWs3ipvKVenr7MrfNw1qgK8vKl+7aaBUd4AdqRJCp3CUgAwH6VjoBaqLVvQCcEUIk1RawQiG4E5S10doGRugOU+BIGYjBwgy8nUHzVxQ99kXlzEB2C0m3xmbphcRRfVIUOnZXlsSqwatLFpwOMSO2GlrSSXGbdxmT6pIcqGuLY+288Q7syIGlwcOFk4NOAMAzl5crYQIgQNqA+a8nRw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6006.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(5660300002)(66899012)(2906002)(52536014)(71200400001)(186003)(6506007)(53546011)(8936002)(7696005)(9686003)(41300700001)(26005)(38100700002)(4326008)(33656002)(76116006)(66946007)(64756008)(66556008)(66476007)(66446008)(478600001)(122000001)(45080400002)(38070700005)(86362001)(8676002)(316002)(110136005)(966005)(54906003)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEJaUXlmT1JQWW5ZS2VuRHNuZWFkU0pPM3pYbm43cXptYWNxK2pvUkFKdFJ4?=
 =?utf-8?B?djJXQy9Rd0NJR3R6cnlwU0RRMHVqZXl5Tk00OXV3aENzRldTemRUMmNKMWZT?=
 =?utf-8?B?YWVXV0NXa3BlNFoyeDY4cGRRK3dYYzA0alBjTWVOOTZxZWZLSTE0cDNrNW5K?=
 =?utf-8?B?T0J4VmJhMWtNZ1dPanpVWmZ6TlUyeU1HeHhxWkFuYW04d1Zld0UvRDNidU5V?=
 =?utf-8?B?YWx5SEhPMFRWQ0RUenEwTFN6TFNidjhhZ0Y4QWRMdUtER2NaUkxSNURkRzRk?=
 =?utf-8?B?anEzbFdLMDZnVlBXenBETkV5MFQ2M1h3cFI2aFJ1dEJnc1FWVHIwd2VCTFFZ?=
 =?utf-8?B?V2l5bDRxV0lmMStKVmVDVGRZOEhwMklMeEVTenpjYUJJWE9LaEp4NnpldDJH?=
 =?utf-8?B?cXd3bHVidFdlaW14amI0dndaRE92YkE4VlkzNTRpYmVYTm5MQTgzYm8rcFFT?=
 =?utf-8?B?QW5IU25qRGp5TWplZXpJR21lOUx5a2YwVHBqV2p3NDFKMHZVVWlic2R5VHZm?=
 =?utf-8?B?elcyNHBLeGZ5TW16SStqcmpGdDJMK0FLdVdVY2V5WUR5cXpxZ2M5RE8rZWl4?=
 =?utf-8?B?WjNGaFdVNnlQQ3VNOExBdkxUUlp2aWMzQ2tPV1dPeDZBZVFVanN5R2wySzBH?=
 =?utf-8?B?T2dndDR5NlgrNkFxb1dUNDdLZnlXNDFRVEd3QllrSVJBRkNwNmN6eXprbmVU?=
 =?utf-8?B?eTJLeWd6NmpYbFRSYnNLYlI2OS8xZGRUQlh3SERWdEhWL3JsWHN1K2V6ei9E?=
 =?utf-8?B?dEZvSVljTDE4ZUM0ajR4RldLM1A2MXJCcUNoQkVCM0o3aExYQytMM0RGQkdX?=
 =?utf-8?B?K25pSDEzek05TGxncEZXSkhJZVpXT25XWG0yUkwxNkJwOXZQTFlKeG1kLytD?=
 =?utf-8?B?Y1Q4aDN1NlVtdFY1T1R5SjJOckJLYUQ5cjNnTEd4cU85WktSVWVQZ1NxOW9X?=
 =?utf-8?B?SFZjTUlURFpsSjlSZkZ4NU5vckJwWUMvb1dLa0Y4RW9IL2dYSXYwdWV2S01r?=
 =?utf-8?B?b0FiRUJtdzE5V2VBalRqYjBSZHZIL0cxeUsvclRWYmswWEEyemw1WHgrN1hQ?=
 =?utf-8?B?djlMNFhvU0dEV2JEWTNnM09FTGVhbUVWSnFwT1E3Uk1UOHM2M3Z4RDhmNU5x?=
 =?utf-8?B?WVV3b09YMGxqN3Z6c1FSUll2Uk9kWVZBOGQrRGJHcFBwbnZONkxzbTBsMk9L?=
 =?utf-8?B?QTNyKzdoNUhaWHFmeTZrRXo1aUVQK1pRMDlQWnJrci9McHJDbjhpbThMcDdh?=
 =?utf-8?B?ejlzTk95L0YvMUpmM2M3SkUvK2xySVFaL0dkR0daUDQrbE1LcWNIK0YwOVJZ?=
 =?utf-8?B?TnlEVnVzOERuTDlwMlZKYStFOVhlZEs4YXhqL1l0NWNaTm5XYXBFZ3JIbGo5?=
 =?utf-8?B?NXVIdXJUemdwL25KeXNPcCthSy9TWTN0dXJpS3VYdnhQR05xM1NsTXFDOG03?=
 =?utf-8?B?VWYvOGFhZUdaODh6RXhYVzBwY2cyRkh0NUV3bjA3WDBOZWlxREVnVnJCMFp6?=
 =?utf-8?B?NUlwWnQwc3ZaTnVKd1pUbkRLR0NZTVFuSVU3cEs1NWNSMmc4V2VNMWV4TDU5?=
 =?utf-8?B?NHNIUm52UU93U2NBUXFmQ1dCeU9QMXRzcmM0V0RYY3dxc2dHZjhwTGZDbEZC?=
 =?utf-8?B?NGhmQ2pOeXZXdTNiT1pwbGIwajhTeVpJVUpFSnJJa1RqRlVaNFRMYlNuWnFY?=
 =?utf-8?B?RUVmV0xoMUsrNTVDV3dEd1ZrYUlZaHZ5Z2tKcy8yamRpNmhOekVFMkZFRjR3?=
 =?utf-8?B?STdqWTkrNEZJaHk1cXpSczJGVUd0QkJkUGxyK1gvbHFwK2l5b00vWnlMNkdN?=
 =?utf-8?B?bGdveFpFclZhRjdTY3JHYkh0dk9ub1FlakhLU2tFR0hoODViNVNRMHY5OWVF?=
 =?utf-8?B?OFQwNVJuMEo2OXdoTE43Q3pnR1BUOFJEdFRUVUV5aE8wZkF3U1lCZlZNd3pS?=
 =?utf-8?B?Vnp6QmJHOVY0TDEzRnRsTk5DMTZOMnA1NFBiaThxbCsrR2dIMXJwN3JIdElI?=
 =?utf-8?B?YUtqbjI4elZTKzFPOXUrRUwzM1Jrd01TYTdraTRLZkR5WHN6V24zVXdYMHhO?=
 =?utf-8?B?b3ZuL2hBdkp5K1ZhbVdKMGdLZWcwM0dGYkJLMk9GWlF5bUVrNktoRkJPMG5x?=
 =?utf-8?Q?ihi3Aq6RE7mH3hcXkhVSWmno/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6006.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f45cfa1-b083-4e66-9f13-08da9b6f5953
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 01:19:36.8467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: icXRq8BS/s677MomlAFaeN0IF2eFcDH+IKBmD7Yc5Oo6omJDoa4X0KDRryjiDpqZpsGnZIFxI/idxwT40GCqEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4441

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIFBhdWwgYW5kIEFGQUlLOg0K
DQpUaGFua3MgZm9yIHlvdXIgaGVscC4NCldoZW4gY291bGQgd2Ugc2VlIHRoaXMgcGF0Y2ggb24g
dGhlIG1hc3RlciBicmFuY2g/IPCfmIoNCk91ciBwcm9qZWN0IHVyZ2VudGx5IG5lZWRzIHRoaXMg
c29sdXRpb24uDQoNClRoYW5rcyENClJ1aWxpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBQYXVsIER1cnJhbnQNClN1YmplY3Q6IFJFOiBbUEFUQ0hdIGh3L3hlbjogc2V0IHBj
aSBBdG9taWMgT3BzIHJlcXVlc3RzIGZvciBwYXNzdGhyb3VnaCBkZXZpY2UNCk9uIDE0LzA5LzIw
MjIgMDM6MDcsIEppLCBSdWlsaSB3cm90ZToNCltBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5l
cmFsXQ0KDQpIaSBQYXVsLA0KDQpUaGFuayB5b3UhDQpCdXQgaG93IGNvdWxkIHdlIG1lcmdlIHRo
aXMgcGF0Y2ggPw0KDQoNCkFGQUlLIEFudGhvbnkgKGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20p
IHN0aWxsIGRlYWxzIHdpdGggdGhpcy4NCg0KQ2hlZXJzLA0KDQogIFBhdWwNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEppLCBSdWlsaQ0KU2VudDogMjAyMuW5tDnmnIgxNOaX
pSAxODowOA0KVG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlrQGdtYWlsLmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZw0KQ2M6IExpdSwgQWFyb24gPEFhcm9uLkxpdUBhbWQuY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQpTdWJqZWN0OiBSRTogW1BBVENIXSBody94ZW46IHNl
dCBwY2kgQXRvbWljIE9wcyByZXF1ZXN0cyBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlDQoNCkhpIFBh
dWwsDQoNClRoYW5rIHlvdSENCkJ1dCBob3cgY291bGQgd2UgbWVyZ2UgdGhpcyBwYXRjaCA/DQoN
ClJ1aWxpDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGF1bCBEdXJyYW50IDx4
YWRpbWduaWtAZ21haWwuY29tPg0KU2VudDogMjAyMuW5tDnmnIgxNOaXpSAxNzowOA0KVG86IEpp
LCBSdWlsaSA8UnVpbGkuSmlAYW1kLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IExp
dSwgQWFyb24gPEFhcm9uLkxpdUBhbWQuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBody94ZW46IHNldCBwY2kgQXRvbWljIE9wcyByZXF1
ZXN0cyBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlDQoNCkNhdXRpb246IFRoaXMgbWVzc2FnZSBvcmln
aW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24gd2hlbiBv
cGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCg0KDQpP
biAxMy8wOS8yMDIyIDA0OjAyLCBKaSwgUnVpbGkgd3JvdGU6DQo+IFtBTUQgT2ZmaWNpYWwgVXNl
IE9ubHkgLSBHZW5lcmFsXQ0KPg0KPg0KPiBIaSBQYXVsLA0KPg0KPiBDb3VsZCB5b3UgaGVscCB0
byByZXZpZXcgdGhpcyBwYXRjaD8NCj4NCg0KTEdUTS4gWW91IGNhbiBhZGQgbXkgUi1iIHRvIGl0
Lg0KDQogICBQYXVsDQoNCj4gVGhhbmtzDQo+DQo+ICpGcm9tOiogSmksIFJ1aWxpDQo+ICpTZW50
OiogMjAyMuW5tDnmnIg35pelIDk6MDQNCj4gKlRvOiogJ1BhdWwgRHVycmFudCcgPHBhdWxAeGVu
Lm9yZz47ICdxZW11LWRldmVsQG5vbmdudS5vcmcnDQo+IDxxZW11LWRldmVsQG5vbmdudS5vcmc+
DQo+ICpDYzoqIExpdSwgQWFyb24gPEFhcm9uLkxpdUBhbWQuY29tPjsgJ3hlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZycNCj4gPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4g
KlN1YmplY3Q6KiBSRTogW1BBVENIXSBody94ZW46IHNldCBwY2kgQXRvbWljIE9wcyByZXF1ZXN0
cyBmb3INCj4gcGFzc3Rocm91Z2ggZGV2aWNlDQo+DQo+IEZZSQ0KPg0KPiAqRnJvbToqIEppLCBS
dWlsaQ0KPiAqU2VudDoqIDIwMjLlubQ55pyINuaXpSAxNTo0MA0KPiAqVG86KiBxZW11LWRldmVs
QG5vbmdudS5vcmcgPG1haWx0bzpxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+ICpDYzoqIExpdSwg
QWFyb24gPEFhcm9uLkxpdUBhbWQuY29tIDxtYWlsdG86QWFyb24uTGl1QGFtZC5jb20+Pg0KPiAq
U3ViamVjdDoqIFtQQVRDSF0gaHcveGVuOiBzZXQgcGNpIEF0b21pYyBPcHMgcmVxdWVzdHMgZm9y
IHBhc3N0aHJvdWdoDQo+IGRldmljZQ0KPg0KPiAgRnJvbSBjNTRlMDcxNGExZTFjYWM3ZGM0MTZi
ZDg0M2I5ZWM3MTYyYmNmYzQ3IE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPg0KPiBGcm9t
OiBSdWlsaSBKaSBydWlsaS5qaUBhbWQuY29tIDxtYWlsdG86cnVpbGkuamlAYW1kLmNvbT4NCj4N
Cj4gRGF0ZTogVHVlLCA2IFNlcCAyMDIyIDE0OjA5OjQxICswODAwDQo+DQo+IFN1YmplY3Q6IFtQ
QVRDSF0gaHcveGVuOiBzZXQgcGNpIEF0b21pYyBPcHMgcmVxdWVzdHMgZm9yIHBhc3N0aHJvdWdo
DQo+IGRldmljZQ0KPg0KPiBNYWtlIGd1ZXN0IG9zIGFjY2VzcyBwY2kgZGV2aWNlIGNvbnRyb2wg
MiByZWcgZm9yIHBhc3N0aHJvdWdoIGRldmljZQ0KPg0KPiBhcyBzdHJ1Y3QgWGVuUFRSZWdJbmZv
IGRlc2NyaWJlZCBpbiB0aGUgZmlsZSBody94ZW4veGVuX3B0LmguDQo+DQo+IC8qIHJlZyByZWFk
IG9ubHkgZmllbGQgbWFzayAoT046Uk8vUk9TLCBPRkY6b3RoZXIpICovDQo+DQo+IHVpbnQzMl90
IHJvX21hc2s7DQo+DQo+IC8qIHJlZyBlbXVsYXRlIGZpZWxkIG1hc2sgKE9OOmVtdSwgT0ZGOnBh
c3N0aHJvdWdoKSAqLw0KPg0KPiB1aW50MzJfdCBlbXVfbWFzazsNCj4NCj4gUmVzb2x2ZXM6DQo+
IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmdpdGwNCj4gYWIuY29tJTJGcWVtdS1wcm9qZWN0JTJGcWVtdSUyRi0lMkZpc3N1
ZXMlMkYxMTk2JmFtcDtkYXRhPTA1JTdDMDElN0NSdQ0KPiBpbGkuSmklNDBhbWQuY29tJTdDYTVl
MmMyMmE4MTU0NGZlYjZiYjQwOGRhOTYzMDk3MDIlN0MzZGQ4OTYxZmU0ODg0ZTYwDQo+IDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzk4NzQzMjY4OTc0ODIxMiU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDgNCj4gZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJ
azFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMw0KPiAwMDAlN0MlN0MlN0MmYW1wO3NkYXRhPUpnODU4
OEZXa0laem1TRXl0NTBUWUNiY2syTnVvVkpkbTdaUDBaJTJGdEZHYyUzDQo+IEQmYW1wO3Jlc2Vy
dmVkPTANCj4gPGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmdpdA0KPiBsYWIuY29tJTJGcWVtdS1wcm9qZWN0JTJGcWVtdSUy
Ri0lMkZpc3N1ZXMlMkYxMTk2JmFtcDtkYXRhPTA1JTdDMDElN0NSDQo+IHVpbGkuSmklNDBhbWQu
Y29tJTdDYTVlMmMyMmE4MTU0NGZlYjZiYjQwOGRhOTYzMDk3MDIlN0MzZGQ4OTYxZmU0ODg0ZTYN
Cj4gMDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzk4NzQzMjY4OTc0ODIxMiU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZA0KPiA4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDDQo+IDMwMDAlN0MlN0MlN0MmYW1wO3Nk
YXRhPUpnODU4OEZXa0laem1TRXl0NTBUWUNiY2syTnVvVkpkbTdaUDBaJTJGdEZHYyUNCj4gM0Qm
YW1wO3Jlc2VydmVkPTA+DQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFhcm9uLkxpdUBhbWQuY29tIDxt
YWlsdG86QWFyb24uTGl1QGFtZC5jb20+DQo+DQo+IFNpZ25lZC1vZmYtYnk6IHJ1aWxpLmppQGFt
ZC5jb20gPG1haWx0bzpydWlsaS5qaUBhbWQuY29tPg0KPg0KPiAtLS0NCj4NCj4gaHcveGVuL3hl
bl9wdF9jb25maWdfaW5pdC5jIHwgNCArKy0tDQo+DQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9ody94ZW4veGVuX3B0
X2NvbmZpZ19pbml0LmMgYi9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMNCj4NCj4gaW5kZXgg
YzVjNGU5NDNhOC4uYWRjNTY1YTAwYSAxMDA2NDQNCj4NCj4gLS0tIGEvaHcveGVuL3hlbl9wdF9j
b25maWdfaW5pdC5jDQo+DQo+ICsrKyBiL2h3L3hlbi94ZW5fcHRfY29uZmlnX2luaXQuYw0KPg0K
PiBAQCAtOTg1LDggKzk4NSw4IEBAIHN0YXRpYyBYZW5QVFJlZ0luZm8geGVuX3B0X2VtdV9yZWdf
cGNpZVtdID0gew0KPg0KPiAgICAgICAgICAgLm9mZnNldCAgICAgPSAweDI4LA0KPg0KPiAgICAg
ICAgICAgLnNpemUgICAgICAgPSAyLA0KPg0KPiAgICAgICAgICAgLmluaXRfdmFsICAgPSAweDAw
MDAsDQo+DQo+IC0gICAgICAgIC5yb19tYXNrICAgID0gMHhGRkUwLA0KPg0KPiAtICAgICAgICAu
ZW11X21hc2sgICA9IDB4RkZGRiwNCj4NCj4gKyAgICAgICAgLnJvX21hc2sgICAgPSAweEZGQTAs
DQo+DQo+ICsgICAgICAgIC5lbXVfbWFzayAgID0gMHhGRkJGLA0KPg0KPiAgICAgICAgICAgLmlu
aXQgICAgICAgPSB4ZW5fcHRfZGV2Y3RybDJfcmVnX2luaXQsDQo+DQo+ICAgICAgICAgICAudS53
LnJlYWQgICA9IHhlbl9wdF93b3JkX3JlZ19yZWFkLA0KPg0KPiAgICAgICAgICAgLnUudy53cml0
ZSAgPSB4ZW5fcHRfd29yZF9yZWdfd3JpdGUsDQo+DQo+IC0tDQo+DQo+IDIuMzQuMQ0KPg0KDQo=

