Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD0802BC7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 07:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646515.1008835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA2tF-0005og-RG; Mon, 04 Dec 2023 06:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646515.1008835; Mon, 04 Dec 2023 06:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA2tF-0005mT-NP; Mon, 04 Dec 2023 06:57:13 +0000
Received: by outflank-mailman (input) for mailman id 646515;
 Mon, 04 Dec 2023 06:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5cgf=HP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rA2tE-0005m4-3O
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 06:57:12 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56aea58f-9272-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 07:57:08 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 06:57:04 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 06:57:04 +0000
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
X-Inumbo-ID: 56aea58f-9272-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW81TKryDoeOPkUx1mwJpIoQeuY91wxR3a5aoj81njCAKEAZWEOTPuDx+U3DWScntpvdFFvFIKAl3TvEPnUDEEqNs9nZ/bmZrigVG1xCsnomxQUcpkiETB8UB+aWHxhj7htgq/IagWOd2qOKUcV+cn53rz+RfWpiK9JyVU50M4YwGOQe24WNI2LXcd+JeYnwMsNStW3YWu0699wx39K8po68+7T1HZPKEmXKz+EO5y1C/sk8sagFMl+C+8HHkU4OfMl3mj5978eZ6ED4iUPDR1a/W/7GJyqLnMK+rI/suCMMEJzOsnO+9Xa/o1Uc159NYPDqIXI2V+g7Ow0YMt1tfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOrhusJrXdhP+AeYPG48uTopMy0T2Czd78VoqrPme8A=;
 b=VW5ji0/BCNw35AKqJHo7wJZAZjJq08QOV4mBaUoHwJlida7L8p48VnGkVw525CLNBcSdwm3iIIShHF/D0BvM39CIwcPNisdxbyyO8fSinTmRmBs51PpFdQcUX1fYTY7rtXevmt5g+OgPB4Blzhhsi8S0hRUO9jJ2/EAP/E0PrZAeC2SdUC13q/LFvqtc7tpAISvsMJ25WATLHcbOOp0Y0xQDUhnltnjdZNL++NYYSa3y6tAe996FzWo1cxnFw/LV0niD0RaKqxNU+RrRhx20nx2+cf7JBQGfP8dHFi/Fyi1JerdgY6+hH94rdm0RV30z0OKBDNyCnxsCbyUWiEJwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOrhusJrXdhP+AeYPG48uTopMy0T2Czd78VoqrPme8A=;
 b=yJPFBPIkuDlKfJSmompGKR1JGeqB/jSFSxpM2exQK1gqtxmujFqf8NmFjbDsLKLoyeWGkJOIbJ215GvFFFGVtYvacdAtsSHY9NvrkADdYrCjTFfeKyUf7K+M34rcxYhfrgF3gJ9nClwrp4rp3Dl7CGQW8Qikx81kr7Fefm/D2kE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Index:
 AQHaHsLfq+dfGUvRWUqPIEH3O9fXrbCPyyeAgAMgFYD//+e9gIAABBEAgAAlHwCABknUAA==
Date: Mon, 4 Dec 2023 06:57:03 +0000
Message-ID:
 <BL1PR12MB58494BAD4ECCDEB00EACCF9DE786A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com> <ZWX0U1tYooY70UJo@macbook>
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <14d2dd16-be21-4e9a-97eb-bb477af49e73@apertussolutions.com>
 <930da43f-0395-40cb-a79d-012c4e1acbcb@apertussolutions.com>
 <ZWihrmHpIrI_ccX4@macbook>
In-Reply-To: <ZWihrmHpIrI_ccX4@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB7663.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN2PR12MB4488:EE_
x-ms-office365-filtering-correlation-id: f6fa093a-4fd2-4d09-5d58-08dbf49638e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 R1r/efV5YmqNJKeKO5ZOMHg/Vvy/C5n9mJKN1BQV6MhM9h/9WHJIGCAKvki44Mjq4OC6MTch43i8l51d7WgNee9IX5yIYIqK6nWdS4xZYnudX2tRfkQ829OwaPquTacz0/u5nqMpisMWbCpxtAWeiK72T2QCfdBuCGPM6hLrlpMBjtFQ9iooCaD71d06toA8XPbWfaCWpmVe+UKCEjmTmouZaXNMCuXcyirfurqk2iKSdtQx4frRjqADfr0KTc9wrA4PGmfyExvxDOC9nDgez/22pctUfkvQ2B31O1QZYtd8FR87dF/QbQUnugSs9mMdSMl0aAbvq5E7WqhYUDnx2cZiKlejlev6i7Oi/cwU1Vq7V2Olf+4mlJFOUfRNx31Z0gz46XB31qfxZM4RI7XraNVz9ADD0OTyiUzHHDb/tQR6j17QPAN3UYrQYkjIgAfSmsTtljjcjJI67XTQku6ZNA8Rf49lSOy0gcn1DLLEzQtaZqaXMko8T0y/NbsNu0EI2bJ9i25AUQJ/an7Ry6FfCL2YDwNxu0eyJwBfMGSl+UW7dV0I+P2YJHudzkox1BZYC7mSHKLVvoGiRNsxByiB4T8kylTA8uyJ62RxtJm6JRU8/xBiqc5k3hBraqZN5fh4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(26005)(6506007)(53546011)(9686003)(7696005)(122000001)(38100700002)(55016003)(71200400001)(478600001)(66946007)(76116006)(66556008)(64756008)(66446008)(66476007)(54906003)(110136005)(316002)(8936002)(8676002)(4326008)(33656002)(2906002)(41300700001)(38070700009)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alJ6eXJaTXhoWTQ5THY4Sml3OEg4M0QrVVdFRXZLUjcxL1VwQlI4M05yNEJh?=
 =?utf-8?B?MTJ5Qk1hTENvMXVOU0dJbTVZOVNiREhGbnl5eDJ6N3c4aVBKWGJKaGdzbG82?=
 =?utf-8?B?TmE2Mit6WTdiSHd0Tksza0JrdXQyREYrUFRKdnJWaU9TWGNqNVFZcDJETkxL?=
 =?utf-8?B?SVRRaHJ2UDFmdmgvRkNUVTh3K1YvOCtNb1dEdzcvMzBob1RXT2ZaSFFDRU5F?=
 =?utf-8?B?VThXTlZkSmIxTmFTdUFXZnYyeWtmd1pxakdWSVRsbzFpL1J0Zy8wLzg1aVVs?=
 =?utf-8?B?MCs2b2RvM3JZenRqZU40NytKZmtLaUlyM2ZoY2R3TzlxWmQ3NnA1bzA0a3Ux?=
 =?utf-8?B?ZU5CN3ZQaDRiVisxZlprZTQraGJrUk9HdTQ4cEVUTlAwZnAyb1V1ajAwdVFT?=
 =?utf-8?B?L1QybkJIWTRDZHZOYms0dTIrRGN0T3Y5ZU92MWM3U0RseUZJOVpGU0FEcmYy?=
 =?utf-8?B?eCtxWFdXMFlyUjllZUN0dHhsT1EzUWdhQVZMK3c5eDBWM21xZjl4NW5SRjZZ?=
 =?utf-8?B?RWdYSWJ2R0RJaHowai8ybk14dlJTNXlsbXhrS0hHZXVFNEF4eHJyc1NtdlF2?=
 =?utf-8?B?ZllhdXNCQVM1bEpIZkoyR1dxTVNrSmRJdFhDR004OXZEMXQ5dVpEeStibjZz?=
 =?utf-8?B?VHpWcEZnM0w5dDQ0blJHR2ZPRXExWEdZdVM5OERZNWlrZmVtNzBiOWRmTUlr?=
 =?utf-8?B?ZnJ2bGdFOFlQMzcvRzdDL0dJWWV6ak1mNk5RN0hXZzQ2RDIxS09kZFkwdWxY?=
 =?utf-8?B?Ni9TWElaeUdSNEdLK3IzQk1hVFRoakRpTVFUd3JEeXRsRUVBTHZWVCszVFpj?=
 =?utf-8?B?cm9jTS90dGJiMW96STJSTDNWUXh1dDhJWTR5NE8zcUJGcDhQWEkvZXY3WWZr?=
 =?utf-8?B?cXJoR1FKeVBnT0VmV2o1L3dMKys1UmMrOWxTQjJPbXRwRXVzNjRXQnEvbXpn?=
 =?utf-8?B?cFdnOFBTeUd2NG8yYnl5L2RJWG44dVVHR1RRZ1lUV2hSKzNva2dmZ0NOdTVj?=
 =?utf-8?B?MUgrRTFiT1JNM0tkdnZoNUwyUThQcTdGVy9TNnQ2NTFJM05VWlM4QWNPQzBM?=
 =?utf-8?B?SCtBTW85NUNGYks3SFBQTEx2c0ozT3M5ZnVQWHhnLzhzcXh3NVVpMEwzRDJa?=
 =?utf-8?B?SnN5WWtnQTgrVnJONXFlM21LN095dUI1aUdZY1dTNG5weUtlRm5ETUg2WUpq?=
 =?utf-8?B?THFBOGF3M3NZa3Izdk5LTlp3SVhHSkdOa3hFSTNSNWx2SFpvRG9JNkpGbnZN?=
 =?utf-8?B?TjNMQVkxSFVjUGd1U0xCYlErQ3BiZkF2R3IxZnVlbGFEbW5tUVlZb0k2R1h2?=
 =?utf-8?B?anpYSkJ3YlQ4dW9kMUt2VVF0dTNMSGNBN2xNTHFnRU44NGlEL092blFaYzM3?=
 =?utf-8?B?TXhSYWM4STAzYUExOStpeWNzb1JtZ2hVaHFhanErQUlMVVR3bmtlOVFPVjNl?=
 =?utf-8?B?TnRTMFMweklEaXJLTEJzeDhyV1E4Sit2SEo2ZHhGQktVTjVZYUc0ZEdrTHF5?=
 =?utf-8?B?UlJtZXlFVDlKelNlWURMRHpDNW1Db0Fudko0a1dHZ0QrUmdJblB4U0lodlBJ?=
 =?utf-8?B?VmRvS3hBMmtpaVoyNE82WU5HWVNIbkFGMmFTSWR3VHdDNWlmQjB5VmlySysr?=
 =?utf-8?B?MGR0aFVobTB1Vkc0emxFZmVPNUh4SVF4amRTZG11cHZMSEdkYTdtR1VvYkFz?=
 =?utf-8?B?cS9MOHVGaW81bHJ0bmgzdEdxajZ5MDQvYzB4RVhaUUM1SWVSUERSUTdOam4v?=
 =?utf-8?B?TXJCMzVYcVNzTW80K0tOaTJ2QnNFYS8rb2xmRTEwbGFFQnZLYUttZS9MTW9u?=
 =?utf-8?B?Ui9sY25kTXUzZ1JCRit5R3ZvTFZQNlFadWc3TlVsaVB3RUViUVdManFVWWdn?=
 =?utf-8?B?V2NScDFhSzEvKzIyUHgyRU1McjJvbFNiZ0ozK2FGeEJMTTJsQWtHb2JNSWZw?=
 =?utf-8?B?TS9paS9ranRqQ1k5RmtMMWx5L2Z4OVMvMzhYRVl1aVhyb2dEcVRzYWZ3UVUy?=
 =?utf-8?B?dHpjY25sM2llenFaekdLcUdCa2JNdWpaUC9oanpDeFRWSjN6N0R6ZWduSFQ5?=
 =?utf-8?B?NlNtRklKeXpwWkplUjJpVzlSd25KWHZZZCtydlgxV1lURWJwdisrVVdtT3My?=
 =?utf-8?Q?JAUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA1089E35CA8964BAD37ECF636C3892D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fa093a-4fd2-4d09-5d58-08dbf49638e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 06:57:03.9616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QmEtBg5l3qmm8xD+C1KEZVo+mSQeLsYmiJetDoTGMpi8PhVkHu6crCdRNQWDJbtEJzZvqH5vD006WsHutBw/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488

SGkgRGFuaWVsIFAuIFNtaXRoLA0KDQpPbiAyMDIzLzExLzMwIDIyOjUyLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOg0KPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAwNzozOTozOEFNIC0wNTAwLCBE
YW5pZWwgUC4gU21pdGggd3JvdGU6DQo+PiBPbiAxMS8zMC8yMyAwNzoyNSwgRGFuaWVsIFAuIFNt
aXRoIHdyb3RlOg0KPj4+IE9uIDExLzMwLzIzIDAxOjIyLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+
Pj4+IEhpIFJvZ2VyIGFuZCBEYW5pZWwgUC4gU21pdGgsDQo+Pj4+DQo+Pj4+IE9uIDIwMjMvMTEv
MjggMjI6MDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBGcmksIE5vdiAyNCwg
MjAyMyBhdCAwNjo0MTozNFBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiBXaGVu
IGEgZGV2aWNlIGhhcyBiZWVuIHJlc2V0IG9uIGRvbTAgc2lkZSwgdGhlIHZwY2kgb24gWGVuDQo+
Pj4+Pj4gc2lkZSB3b24ndCBnZXQgbm90aWZpY2F0aW9uLCBzbyB0aGUgY2FjaGVkIHN0YXRlIGlu
IHZwY2kgaXMNCj4+Pj4+PiBhbGwgb3V0IG9mIGRhdGUgY29tcGFyZSB3aXRoIHRoZSByZWFsIGRl
dmljZSBzdGF0ZS4NCj4+Pj4+PiBUbyBzb2x2ZSB0aGF0IHByb2JsZW0sIHRoaXMgcGF0Y2ggYWRk
IG5ldyBoeXBlcmNhbGwgdG8gY2xlYXINCj4+Pj4+PiBhbGwgdnBjaSBkZXZpY2Ugc3RhdGUuIEFu
ZCB3aGVuIHJlc2V0IGRldmljZSBoYXBwZW5zIG9uIGRvbTANCj4+Pj4+PiBzaWRlLCBkb20wIGNh
biBjYWxsIHRoaXMgaHlwZXJjYWxsIHRvIG5vdGlmeSB2cGNpLg0KPj4+Pj4+DQo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+Pj4+PiAtLS0NCj4+
Pj4+PiDCoCB4ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jwqAgfMKgIDEgKw0KPj4+Pj4+IMKg
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysr
DQo+Pj4+Pj4gwqAgeGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuY8KgwqDCoMKgIHwgMTQgKysrKysr
KysrKysrKysNCj4+Pj4+PiDCoCB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuY8KgwqDCoMKgwqDCoCB8
wqAgOSArKysrKysrKysNCj4+Pj4+PiDCoCB4ZW4vaW5jbHVkZS9wdWJsaWMvcGh5c2Rldi5owqAg
fMKgIDIgKysNCj4+Pj4+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vcGNpLmjCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxICsNCj4+Pj4+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5owqDCoMKgwqDCoMKgwqAg
fMKgIDYgKysrKysrDQo+Pj4+Pj4gwqAgNyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCsp
DQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwu
Yw0KPj4+Pj4+IGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+Pj4+IGluZGV4IGVl
YjczZTFhYTUuLjZhZDViNGQ1ZjEgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9oeXBlcmNhbGwuYw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMN
Cj4+Pj4+PiBAQCAtODQsNiArODQsNyBAQCBsb25nIGh2bV9waHlzZGV2X29wKGludCBjbWQsDQo+
Pj4+Pj4gWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4+Pj4gwqDCoMKgwqDC
oCBjYXNlIFBIWVNERVZPUF9wY2lfbW1jZmdfcmVzZXJ2ZWQ6DQo+Pj4+Pj4gwqDCoMKgwqDCoCBj
YXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZDoNCj4+Pj4+PiDCoMKgwqDCoMKgIGNhc2UgUEhZ
U0RFVk9QX3BjaV9kZXZpY2VfcmVtb3ZlOg0KPj4+Pj4+ICvCoMKgwqAgY2FzZSBQSFlTREVWT1Bf
cGNpX2RldmljZV9zdGF0ZV9yZXNldDoNCj4+Pj4+PiDCoMKgwqDCoMKgIGNhc2UgUEhZU0RFVk9Q
X2RiZ3Bfb3A6DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggIWlzX2hhcmR3YXJlX2Rv
bWFpbihjdXJyZCkgKQ0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RU5PU1lTOw0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Yw0KPj4+Pj4+IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+PiBpbmRleCAw
NGQwMGM3YzM3Li5mODcxNzE1NTg1IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMNCj4+Pj4+PiBAQCAtODI0LDYgKzgyNCwyNyBAQCBpbnQgcGNpX3JlbW92ZV9kZXZpY2UodTE2
IHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+Pj4+PiDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+
Pj4+Pj4gwqAgfQ0KPj4+Pj4+ICtpbnQgcGNpX3Jlc2V0X2RldmljZV9zdGF0ZSh1MTYgc2VnLCB1
OCBidXMsIHU4IGRldmZuKQ0KPj4+Pj4NCj4+Pj4+IFlvdSBjb3VsZCB1c2UgcGNpX3NiZGZfdCBo
ZXJlIGluc3RlYWQgb2YgMyBwYXJhbWV0ZXJzLg0KPj4+PiBXaWxsIGNoYW5nZSBpbiBuZXh0IHZl
cnNpb24sIHRoYW5rIHlvdS4NCj4+Pj4NCj4+Pj4+DQo+Pj4+PiBJJ20gaG93ZXZlciB1bnN1cmUg
d2hldGhlciB3ZSByZWFsbHkgbmVlZCB0aGlzIGhlbHBlciBqdXN0IHRvIGZldGNoDQo+Pj4+PiB0
aGUgcGRldiBhbmQgY2FsbCB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSgpLCBJIHRoaW5rIHlvdSBj
b3VsZCBwbGFjZQ0KPj4+Pj4gdGhpcyBsb2dpYyBkaXJlY3RseSBpbiBwY2lfcGh5c2Rldl9vcCgp
LsKgIFVubGVzcyB0aGVyZSBhcmUgcGxhbnMgdG8NCj4+Pj4+IHVzZSBzdWNoIGxvZ2ljIG91dHNp
ZGUgb2YgcGNpX3BoeXNkZXZfb3AoKS4NCj4+Pj4gSWYgSSBwbGFjZSB0aGUgbG9naWMgb2YgcGNp
X3Jlc2V0X2RldmljZV9zdGF0ZSBkaXJlY3RseSBpbg0KPj4+PiBwY2lfcGh5c2Rldl9vcC4gSSB0
aGluayBJIG5lZWQgdG8gZGVjbGFyZSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSBpbg0KPj4+PiBw
Y2kuaD8gSWYgaXQgaXMgc3VpdGFibGUsIEkgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9uLg0K
Pj4+Pg0KPj4+Pj4NCj4+Pj4+PiArew0KPj4+Pj4+ICvCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBk
ZXY7DQo+Pj4+Pj4gK8KgwqDCoCBpbnQgcmV0ID0gLUVOT0RFVjsNCj4+Pj4+DQo+Pj4+PiBTb21l
IFhTTSBjaGVjayBzaG91bGQgYmUgaW50cm9kdWNlZCBmcm8gdGhpcyBvcGVyYXRpb24sIGFzIG5v
bmUgb2YgdGhlDQo+Pj4+PiBleGlzdGluZyBvbmVzIGlzIHN1aXRhYmxlLsKgIFNlZSB4c21fcmVz
b3VyY2VfdW5wbHVnX3BjaSgpIGZvciBleGFtcGxlLg0KPj4+Pj4NCj4+Pj4+IHhzbV9yZXNvdXJj
ZV9yZXNldF9zdGF0ZV9wY2koKSBvciBzb21lIHN1Y2ggSSB3b3VsZCBhc3N1bWUuDQo+Pj4+IEkg
ZG9uJ3Qga25vdyB3aGF0IEkgc2hvdWxkIGRvIGluIFhTTSBmdW5jdGlvbihhc3N1bWUgaXQgaXMN
Cj4+Pj4geHNtX3Jlc291cmNlX3Jlc2V0X3N0YXRlX3BjaSkuDQo+Pj4+IEhpIERhbmllbCBQLiBT
bWl0aCwgY291bGQgeW91IHBsZWFzZSBnaXZlIG1lIHNvbWUgc3VnZ2VzdGlvbnM/DQo+Pj4+IEp1
c3QgdG8gY2hlY2sgdGhlIFhTTV9QUklWIGFjdGlvbj8NCj4+Pj4NCj4+Pg0KPj4+IFJvZ2VyLCB0
aGFuayB5b3UgZm9yIHNlZWluZyB0aGlzIGFuZCBhZGRpbmcgbWUgaW4hDQo+Pj4NCj4+PiBKaXFp
YW4sIEkganVzdCB3YW50ZWQgdG8gbGV0IHlvdSBrbm93IEkgaGF2ZSBzZWVuIHlvdXIgcG9zdCBi
dXQgSSBoYXZlDQo+Pj4gYmVlbiBhIGxpdHRsZSB0aWVkIHVwIHRoaXMgd2Vlay4gSnVzdCB3aXRo
IHRoZSBjdXJzb3J5IGxvb2ssIEkgdGhpbmsNCj4+PiBSb2dlciBpcyBzdWdnZXN0aW5nIGEgbmV3
IFhTTSBjaGVjay9ob29rIGlzIHdhcnJhbnRlZC4NCj4+Pg0KPj4+IElmIHlvdSB3b3VsZCBsaWtl
IHRvIGF0dGVtcHQgYXQgd3JpdGluZyB0aGUgZHVtbXkgcG9saWN5IHNpZGUsIG1pbWljDQo+Pj4g
eHNtX3Jlc291cmNlX3BsdWdfcGNpIGluIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oIGFuZA0KPj4+
IHhlbi9pbmNsdWRlL3hzbS94c20uaCwgdGhlbiBJIGNhbiBsb29rIGF0IGhhbmRsaW5nIHRoZSBG
TEFTSyBwb3J0aW9uDQo+Pj4gbmV4dCB3ZWVrIGFuZCBwcm92aWRlIGl0IHRvIHlvdSBmb3IgaW5j
bHVzaW9uIGludG8gdGhlIHNlcmllcy4gSWYgeW91DQo+Pj4gYXJlIG5vdCBjb21mb3J0YWJsZSB3
aXRoIGl0LCBJIGNhbiBsb29rIGF0IHRoZSB3aG9sZSB0aGluZyBuZXh0IHdlZWsuDQo+Pj4gSnVz
dCBsZXQgbWUga25vdyB3aGF0IHlvdSB3b3VsZCBiZSBjb21mb3J0YWJsZSB3aXRoLg0KPj4NCj4+
IEFwb2xvZ2llcywgdGhpbmtpbmcgYWJvdXQgZm9yIGEgbW9tZW50IGFuZCB3YXMgdGhpbmtpbmcg
dGhlIGhvb2sgc2hvdWxkIGJlDQo+PiBjYWxsZWQgeHNtX3Jlc291cmNlX2NvbmZpZ19wY2kuIEkg
d291bGQgcmVzZXQgYXMgYSBjb25maWcgb3BlcmF0aW9uIGFuZA0KPj4gdGhlcmUgbWlnaHQgYmUg
bmV3IG9uZXMgaW4gdGhlIGZ1dHVyZS4gSSBkbyBub3QgYmVsaWV2ZSB0aGVyZSBpcyBhIG5lZWQg
dG8NCj4+IGhhdmUgZmluZSBncmFpbiBhY2Nlc3MgY29udHJvbCBkb3duIHRvIGluZGl2aWR1YWwg
Y29uZmlnIG9wZXJhdGlvbiwgdGh1cw0KPj4gdGhleSBjb3VsZCBhbGwgYmUgY2FwdHVyZWQgdW5k
ZXIgdGhpcyBvbmUgaG9vay4gUm9nZXIsIHdoYXQgYXJlIHlvdXINCj4+IHRob3VnaHRzIGFib3V0
IHRoaXMsIGluIHBhcnRpY3VsYXIgaG93IHlvdSBzZWUgdnBjaSBldm9sdmluZz8NCj4gDQo+IFNv
IHRoZSBjb25maWd1cmF0aW9uIHNwYWNlIHJlc2V0IHNob3VsZCBvbmx5IGJlIGRvbmUgYnkgdGhl
IGRvbWFpbg0KPiB0aGF0J3MgYWxzbyBjYXBhYmxlIG9mIHRyaWdnZXJpbmcgdGhlIHBoeXNpY2Fs
IGRldmljZSByZXNldCwgdXN1YWxseQ0KPiB0aGUgaGFyZHdhcmUgZG9tYWluLiAgSSBkb24ndCB0
aGluayBpdCdzIHBvc3NpYmxlIEFUTSB0byBhbGxvdyBhDQo+IGRvbWFpbiBkaWZmZXJlbnQgdGhh
biB0aGUgaGFyZHdhcmUgZG9tYWluIHRvIHBlcmZvcm0gYSBQQ0kgcmVzZXQsIGFzDQo+IGRvaW5n
IGl0IHJlcXVpcmVzIHVubWVkaWF0ZWQgYWNjZXNzIHRvIHRoZSBQQ0kgY29uZmlnIHNwYWNlLg0K
PiANCj4gU28gcmVzZXR0aW5nIHRoZSB2UENJIHN0YXRlIHNob3VsZCBlaXRoZXIgYmUgbGltaXRl
ZCB0byB0aGUgaGFyZHdhcmUNCj4gZG9tYWluLCBvciB0byBhIHBjaSByZXNldCBjYXBhYmlsaXR5
IGV4cGxpY2l0bHkNCj4gKHhzbV9yZXNvdXJjZV9yZXNldF9wY2kgb3Igc29tZSBzdWNoPykuICBP
ciBtYXliZQ0KPiB4c21fcmVzb3VyY2VfY29uZmlnX3BjaSBpZiB0aGF0IGRlbm90ZXMgdW5tZWRp
YXRlZCBhY2Nlc3MgdG8gdGhlIFBDSQ0KPiBjb25maWcgc3BhY2UuDQo+IA0KPiBUaGFua3MsIFJv
Z2VyLg0KDQpJcyBpdCBsaWtlIGJlbG93IHRoYXQgSSBuZWVkIHRvIGFkZCBmb3IgWFNNPw0KZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmMNCmluZGV4IDlkNzUxOWViODkuLjgxY2VhZjE0NWYgMTAwNjQ0DQotLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMNCkBAIC05MzcsNiArOTM3LDEwIEBAIGludCBwY2lfcmVzZXRfZGV2aWNlX3N0
YXRlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQogICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2
Ow0KICAgICBpbnQgcmV0ID0gLUVOT0RFVjsNCg0KKyAgICByZXQgPSB4c21fcmVzb3VyY2VfY29u
ZmlnX3BjaShYU01fUFJJViwgKHNlZyA8PCAxNikgfCAoYnVzIDw8IDgpIHwgZGV2Zm4pOw0KKyAg
ICBpZiAoIHJldCApDQorICAgICAgICByZXR1cm4gcmV0Ow0KKw0KICAgICBwY2lkZXZzX2xvY2so
KTsNCg0KICAgICBwZGV2ID0gcGNpX2dldF9wZGV2KE5VTEwsIFBDSV9TQkRGKHNlZywgYnVzLCBk
ZXZmbikpOw0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oIGIveGVuL2luY2x1
ZGUveHNtL2R1bW15LmgNCmluZGV4IDg2NzFhZjFiYTQuLmJjYWZmOTliMjMgMTAwNjQ0DQotLS0g
YS94ZW4vaW5jbHVkZS94c20vZHVtbXkuaA0KKysrIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgN
CkBAIC00NzIsNiArNDcyLDEzIEBAIHN0YXRpYyBYU01fSU5MSU5FIGludCBjZl9jaGVjayB4c21f
cmVzb3VyY2Vfc2V0dXBfcGNpKA0KICAgICByZXR1cm4geHNtX2RlZmF1bHRfYWN0aW9uKGFjdGlv
biwgY3VycmVudC0+ZG9tYWluLCBOVUxMKTsNCiB9DQoNCitzdGF0aWMgWFNNX0lOTElORSBpbnQg
Y2ZfY2hlY2sgeHNtX3Jlc291cmNlX2NvbmZpZ19wY2koDQorICAgIFhTTV9ERUZBVUxUX0FSRyB1
aW50MzJfdCBtYWNoaW5lX2JkZikNCit7DQorICAgIFhTTV9BU1NFUlRfQUNUSU9OKFhTTV9QUklW
KTsNCisgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihhY3Rpb24sIGN1cnJlbnQtPmRvbWFp
biwgTlVMTCk7DQorfQ0KKw0KIHN0YXRpYyBYU01fSU5MSU5FIGludCBjZl9jaGVjayB4c21fcmVz
b3VyY2Vfc2V0dXBfZ3NpKFhTTV9ERUZBVUxUX0FSRyBpbnQgZ3NpKQ0KIHsNCiAgICAgWFNNX0FT
U0VSVF9BQ1RJT04oWFNNX1BSSVYpOw0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hzbS94c20u
aCBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KaW5kZXggOGRhZDAzZmQzZC4uMWNiMTZiMDBkZSAx
MDA2NDQNCi0tLSBhL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KKysrIGIveGVuL2luY2x1ZGUveHNt
L3hzbS5oDQpAQCAtNTcxLDYgKzU3MSwxMiBAQCBzdGF0aWMgaW5saW5lIGludCB4c21fcmVzb3Vy
Y2Vfc2V0dXBfcGNpKA0KICAgICByZXR1cm4gYWx0ZXJuYXRpdmVfY2FsbCh4c21fb3BzLnJlc291
cmNlX3NldHVwX3BjaSwgbWFjaGluZV9iZGYpOw0KIH0NCg0KK3N0YXRpYyBpbmxpbmUgaW50IHhz
bV9yZXNvdXJjZV9jb25maWdfcGNpKA0KKyAgICB4c21fZGVmYXVsdF90IGRlZiwgdWludDMyX3Qg
bWFjaGluZV9iZGYpDQorew0KKyAgICByZXR1cm4gYWx0ZXJuYXRpdmVfY2FsbCh4c21fb3BzLnJl
c291cmNlX2NvbmZpZ19wY2ksIG1hY2hpbmVfYmRmKTsNCit9DQorDQogc3RhdGljIGlubGluZSBp
bnQgeHNtX3Jlc291cmNlX3NldHVwX2dzaSh4c21fZGVmYXVsdF90IGRlZiwgaW50IGdzaSkNCiB7
DQogICAgIHJldHVybiBhbHRlcm5hdGl2ZV9jYWxsKHhzbV9vcHMucmVzb3VyY2Vfc2V0dXBfZ3Np
LCBnc2kpOw0KZGlmZiAtLWdpdCBhL3hlbi94c20vZHVtbXkuYyBiL3hlbi94c20vZHVtbXkuYw0K
aW5kZXggZTZmZmE5NDhmNy4uN2EyODliYTVkOCAxMDA2NDQNCi0tLSBhL3hlbi94c20vZHVtbXku
Yw0KKysrIGIveGVuL3hzbS9kdW1teS5jDQpAQCAtOTEsNiArOTEsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHhzbV9vcHMgX19pbml0Y29uc3RfY2ZfY2xvYmJlciBkdW1teV9vcHMgPSB7DQogICAg
IC5yZXNvdXJjZV9wbHVnX3BjaSAgICAgICAgICAgICA9IHhzbV9yZXNvdXJjZV9wbHVnX3BjaSwN
CiAgICAgLnJlc291cmNlX3VucGx1Z19wY2kgICAgICAgICAgID0geHNtX3Jlc291cmNlX3VucGx1
Z19wY2ksDQogICAgIC5yZXNvdXJjZV9zZXR1cF9wY2kgICAgICAgICAgICA9IHhzbV9yZXNvdXJj
ZV9zZXR1cF9wY2ksDQorICAgIC5yZXNvdXJjZV9jb25maWdfcGNpICAgICAgICAgICAgPSB4c21f
cmVzb3VyY2VfY29uZmlnX3BjaSwNCiAgICAgLnJlc291cmNlX3NldHVwX2dzaSAgICAgICAgICAg
ID0geHNtX3Jlc291cmNlX3NldHVwX2dzaSwNCg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlh
biBDaGVuLg0K

