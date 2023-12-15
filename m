Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5764814241
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 08:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654880.1022356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE2Uq-0007Bm-OY; Fri, 15 Dec 2023 07:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654880.1022356; Fri, 15 Dec 2023 07:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE2Uq-00078R-LP; Fri, 15 Dec 2023 07:20:32 +0000
Received: by outflank-mailman (input) for mailman id 654880;
 Fri, 15 Dec 2023 07:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVEl=H2=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rE2Up-00078L-8j
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 07:20:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c1d0e55-9b1a-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 08:20:29 +0100 (CET)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 07:20:24 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::3329:8fa8:d28d:981c]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::3329:8fa8:d28d:981c%5]) with mapi id 15.20.7068.031; Fri, 15 Dec 2023
 07:20:24 +0000
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
X-Inumbo-ID: 6c1d0e55-9b1a-11ee-98ea-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSyn2T0YLz8+PXBzt78hiC/ZLq7i3TAfFmYuC9zbU3iz+yJ5sXdsg+iVNpYEj0sBRkYS374BEJLLmwWXGVi4zMTP0aRaLVXH4mgkACyRpcR7yqoPm4wt+TZZFgpYSx+Yo4HoLE7281U8kP2HctdvZY6HAvom8XsyixKryHOMzJthSo/65igIYXvbqTJcjewXZKmCmhvHiOzNWMmOmmzB8SCGV48V12aI8jRkwJFRDlr63xtUJGaLb7JoefRu5/otcJu78UzBDKwvePSD4P2ynXjP6lg6dGeUSq9lq1OCqI2NMIprDu9APQhFLX9Ay6hZzkk+2vPc6fbItdmf0MT0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAXjiSuuz4Ex211bdHR0aVLYn2YhKMgyPQrifGRwOxE=;
 b=MQrmOaW5ovK0KXtdSiEANhO5cJTqEKdu/0iJHja7sa5cTLJGoW6ABju+mgKBW5qTGNgSVwkHTKE8fChWKmd845dheNtzZR8TP2rXawXF3Fp6L4nRaG8C46UnMnx2HuqNO0mBpof+PAr2UYlrVwnkxP3ZI32TK6Y3/bT/+SeFjc8fBK2SE5Z0/u9n22tudfycZIxsBv0DL0oXDhXIlMC/ET9MRpBKuPq1bPwWMRoqlMkQRtguu21xFKwIsSVw+YOppdCr+D+ePuLRPXkbpqzcy429jBrcp8ZbAYU7upSUh7Lv+PYsWuOFF+6CVjFHwtq3NWEILJrcnxM20HnACbMkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAXjiSuuz4Ex211bdHR0aVLYn2YhKMgyPQrifGRwOxE=;
 b=vQQlCvfGkebI+DOzmLFejI8BBuEEoNy6bVoqyOO0XpxQAmTTLAg7P54c++x/6dJORTF45uBO8HAe4o2Zs2JHOAHR7thysh3JKtvv9ncGL2M1x4yejYcexDOP8DRIWnRVpQaHp705VW4WwM5CB1Id+dmIMLCtCTLKCi6bot8MXVg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Ragiadakou, Xenia"
	<Xenia.Ragiadakou@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Topic: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Index:
 AQHaK4ebBv/EWT+No0GAUR8lU4172LCkNzqAgAGFPID//6gjAIABpqIA///CiwCAAi33AP//lJaAAAAYnAAAAExygAAan/AAACJ1V4A=
Date: Fri, 15 Dec 2023 07:20:24 +0000
Message-ID:
 <PH7PR12MB58546C2F2208D57396C48764E793A@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook> <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
 <ZXrTwfzedFQLhxiQ@macbook>
 <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH8PR12MB7208.namprd12.prod.outlook.com
 (15.20.7113.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|CH3PR12MB9099:EE_
x-ms-office365-filtering-correlation-id: c41a9258-5c6e-4b11-a31c-08dbfd3e4e4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sUmj0lb62sgvv6VUQAjDo80PU1LEu+TNWR9z4n3fJtB0aLIYXBYpAqzDsqH1NqIQAByNF367NBn6Q/B1rHFYo5WdhSc8zDFz5MzuZLst5ma97cjmtAeOfnCqKJqkPsB5GO7lI1Mtv+w/8WYgF5BJbk0vreLe3Q4y/bZuFN9tDHYDtxM9PnwKakGxrxE2imSY9OxJ1OJd6HZwYveYIvAqP2WuewycdwuD+V9He1LzLqt4qeDLKYIyRAZIRaUQiNhFiSPd1PqF+OgugsBi/zr12QCyeF0VClHBrqeLbk2FmY5GLWA+J2iJqPLNUZcGhNj7q5qzcuQ4IuaupT0OnmZ0VfXlXfjhxytBGf819th5W2Y2kzM17iiRWBQPRWgcmOX/JuXsgc+PVta+djNrYp5kuBo0FvKZUitY6Q/ivDu5Qc2VUMi+yQnujNT6GO/Gcq7CIst6EZmlebm2BHKfJqEYTIOa9W1lSQwjdprdrmERDHKRyO6QG4tk5H5CzIp0QEcQ1XYjs4WkTGLakkQxicT2AQxufM8AsAFeV2XL6IzbECIaDLp4qbTQ+5VU3msLoME0i0G9Am8JsHEH3JwNp0bAeZEH+h9hDhTocNvoSj4wvfatNGZ/CjFgkAds7gDn2VCY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(6506007)(7696005)(71200400001)(53546011)(9686003)(83380400001)(5660300002)(52536014)(4326008)(41300700001)(2906002)(478600001)(8676002)(8936002)(76116006)(110136005)(66946007)(316002)(54906003)(64756008)(66446008)(66476007)(66556008)(33656002)(122000001)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGVRUmtoRElZWWlWaWRpS0tIRTdqRzYzV2JPWFExY05DalZQYkpUelNzeXZt?=
 =?utf-8?B?RUhnbXBvemtxVWZlVjB4UGJNNkdIclpUSWkxL1hqZWt3eWd2STVyajV3TTZh?=
 =?utf-8?B?Q21TRXAzaC9SMm9PeXNPdzZlUmZpTG1zZjZWTkZsa1lBREJYK3dGK1M0YkI4?=
 =?utf-8?B?VFNsR2xRVEtLUmZtRm5IdjFsN2RqMUpsRUxrY1BJZGVYVEt1SXJuSXBlbXdE?=
 =?utf-8?B?VUFiOWhmaE56MTN5Z2hCb1p0emFpamErdWZVdUJKSEJDZG93RUtqc1hqZmtp?=
 =?utf-8?B?SmZLenIrYWU4TXU2eFEyS3VxR2ZCWm5PbjV4TzF3UE9TMVpYelpnUzBUV3o0?=
 =?utf-8?B?SndKRmVENEg3RlJWOGtwaGU3YnFhVnZJaHBvN1ZJejRPUUc0YlA1RmEvbHU4?=
 =?utf-8?B?OXc1VVBjTVpETkxWd2gyK3prNHhMTFRDcGk5eWlGaDh1Sno4emxmWS91cnh3?=
 =?utf-8?B?MGF0dUNMMzVPcUV0OU1pMjd6Z3ordFlROUNIOFFwdStYalBLZE9zV3lqdXBZ?=
 =?utf-8?B?OWlqT3RlZG9TYmtpL1M4bFZqZVNZU0dWbE1oa1BVVklWS0hSRTZRRUpzZnF3?=
 =?utf-8?B?RlhTZG0xLzVTcGJNL2gzYUJGYkNrRTJIaGVJcHF0TUZKMlpwWE5GS051M1pC?=
 =?utf-8?B?M1lCbFhTelhId2toVkttemVjOUIzcHJFSmd2UVVQalA3MkFCMlhPUzFnc3pr?=
 =?utf-8?B?RmpUNGVGUHM3TVV4bm54MDBvdlZINEJ1cTlEWXVwRnFRWGZUVENKcmFLck9u?=
 =?utf-8?B?OVBMcTVjaEozK1JCejFyZ2g2RVlKYVFMVFNGYzk0L3R2bnRkelc1eWVQTndS?=
 =?utf-8?B?c3l5cmlRZHVTK1h5a2pXckZLNjUyZjMwSU91d2JvNTJsQjMrN0s1WWgxaUVR?=
 =?utf-8?B?eGl1a1hFTzV5MjFnNzdoVktmY011dnEydDJ1QTNjVWs1UUVXV0VMNEJuSXNL?=
 =?utf-8?B?eG5VVEJwbkZXdnJSdlpMNUtsMU9UaitFOWVjbWZHYmhaVDdPeC83ZFVEMU1o?=
 =?utf-8?B?NzVSbGRwRy9WSWk2L2pTQTlqVVJ0V1dQT3FFMTZjM1ZMaDJmNlI4c3lSRFkx?=
 =?utf-8?B?Z09DNmVmeE1rWUk3ckVWVTQxS2dPbVdkdTc1RVpmMkpHQWwzOGdZZlJCWVZ2?=
 =?utf-8?B?TkFUSFFKcVBXVE1YcFBycndNWTJSV3ZXS2tHUVY4NUExc00vRHUrRHdGd0xQ?=
 =?utf-8?B?dGNId3hZTTZ6bm9JYUNJRDdPOUhwRllYTzlyekNlRUdOQzZGY0hEVUc3M3NU?=
 =?utf-8?B?di9oNkN3UEZVQmdBSEozMW5hYjdmdkVMR1dlWitXNldjR2N5b05qZEZudE05?=
 =?utf-8?B?MG5WZ0VmYVdkTmFqanNrdGZ3a25ya1kzTDR0dWtZTldrUVUySnVkUnFXM3Bh?=
 =?utf-8?B?OEdYWnRmZko3c2g2RFhnWWs3bFR3Uld1bXBjcHBqb3VpNUVGaUJjVG1wNGhK?=
 =?utf-8?B?cGNSZko0cXVTdlRHZ29yR0pUNmh4d29ieGg1TUhtdjNLdFVpZ2JCUGlTUmd3?=
 =?utf-8?B?VzRjVXlJSFo5MWMzZ0FoOWpQMUc2Um1nd0NHNUhZU2JEWnAwdmdPRzZacSs0?=
 =?utf-8?B?WVp6ZWhBSExlc3daNlhlTDVBaGc1WTRmYlQ0MTNPblRSYzgrZTArQitlTHgr?=
 =?utf-8?B?QnlvSzU1d01tcWtWVENZWlZDNEJnMFN2elhOVFl3RndrQ2tVdGlqV3ZpY2lu?=
 =?utf-8?B?SzlscU83K3Z6eFJSNEp0WjlxL1dCaS9WcFNqeFVuUWJvWWdjYWxGZEtSOGRz?=
 =?utf-8?B?ZlJBbXFhZ05Md3l0WXo3a2dSNFh6WStIM3dpK3FsdjFpLzgwbmRlUGxrL3lF?=
 =?utf-8?B?OWJ2eFQwdGVDS1h2QzBaUEczMjNtZzk4NWxoZUtZQVNJV0p5SzNEQllqL1ZD?=
 =?utf-8?B?dWlYbTE0aW9nRXhlZzJPMDlQMTBtU2RlejlTSFlOelQyeHhIRkdrMCtaQy9q?=
 =?utf-8?B?dndJaTBkKzFoa2IxZUxDdGtDdzhWeVBKVS81SWNuUzlOUnRHMnZ1Uk5oWUJP?=
 =?utf-8?B?RUFRbjA1YzNnL3JrMzVCaUYwSU1rc0tzQUVTVTQ2dWFNajFpQXpNeC9WZkph?=
 =?utf-8?B?YloxdG5mYTUxYjNWT0JnenpaQTdzMDZhbzd4TnI1ejVHZktkdXhjT0pJd04v?=
 =?utf-8?Q?I6Lg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0446210E9A04F47B72CE836204B3569@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41a9258-5c6e-4b11-a31c-08dbfd3e4e4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 07:20:24.6208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F0xoNohRpcaidBOAYOCkNzzsAolYxDVIE5hzRUioolXnUnBTEKrVa+uxyfzkxnIBzLCY13SHV8BcWps6xrckeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099

T24gMjAyMy8xMi8xNSAwNjo0OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUaHUs
IDE0IERlYyAyMDIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4gT24gVGh1LCBEZWMgMTQs
IDIwMjMgYXQgMTA6NTg6MjRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTQu
MTIuMjAyMyAxMDo1NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4gT24gVGh1LCBEZWMg
MTQsIDIwMjMgYXQgMDg6NTU6NDVBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4g
T24gMjAyMy8xMi8xMyAxNTowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMTMuMTIu
MjAyMyAwMzo0NywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+PiBPbiAyMDIzLzEyLzEyIDE3
OjMwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+IE9uIDEyLjEyLjIwMjMgMDc6NDksIENo
ZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAyMDIzLzEyLzExIDIzOjMxLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+Pj4+PiBPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAxMjo0
MDowOEFNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vaHlwZXJjYWxsLmMNCj4+Pj4+Pj4+Pj4+IEBAIC03Miw4ICs3MiwxMSBAQCBsb25nIGh2bV9w
aHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4+
Pj4+Pj4+Pj4gIA0KPj4+Pj4+Pj4+Pj4gICAgICBzd2l0Y2ggKCBjbWQgKQ0KPj4+Pj4+Pj4+Pj4g
ICAgICB7DQo+Pj4+Pj4+Pj4+PiArICAgIGNhc2UgUEhZU0RFVk9QX3NldHVwX2dzaToNCj4+Pj4+
Pj4+Pj4NCj4+Pj4+Pj4+Pj4gSSB0aGluayBnaXZlbiB0aGUgbmV3IGFwcHJvYWNoIG9uIHRoZSBM
aW51eCBzaWRlIHBhdGNoZXMsIHdoZXJlDQo+Pj4+Pj4+Pj4+IHBjaWJhY2sgd2lsbCBjb25maWd1
cmUgdGhlIGludGVycnVwdCwgdGhlcmUncyBubyBuZWVkIHRvIGV4cG9zZQ0KPj4+Pj4+Pj4+PiBz
ZXR1cF9nc2kgYW55bW9yZT8NCj4+Pj4+Pj4+PiBUaGUgbGF0ZXN0IHBhdGNoKHRoZSBzZWNvbmQg
cGF0Y2ggb2YgdjMgb24ga2VybmVsIHNpZGUpIGRvZXMgc2V0dXBfZ3NpIGFuZCBtYXBfcGlycSBm
b3IgcGFzc3Rocm91Z2ggZGV2aWNlIGluIHBjaWJhY2ssIHNvIHdlIG5lZWQgdGhpcyBhbmQgYmVs
b3cuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+ICAgICAgY2FzZSBQSFlTREVW
T1BfbWFwX3BpcnE6DQo+Pj4+Pj4+Pj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3VubWFwX3BpcnE6
DQo+Pj4+Pj4+Pj4+PiArICAgICAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZCkgKQ0K
Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBB
bHNvIEphbiBhbHJlYWR5IHBvaW50ZWQgdGhpcyBvdXQgaW4gdjI6IHRoaXMgaHlwZXJjYWxsIG5l
ZWRzIHRvIGJlDQo+Pj4+Pj4+Pj4+IGxpbWl0ZWQgc28gYSBQVkggZG9tMCBjYW5ub3QgZXhlY3V0
ZSBpdCBhZ2FpbnN0IGl0c2VsZi4gIElPVzogcmVmdXNlDQo+Pj4+Pj4+Pj4+IHRoZSBoeXBlcmNh
bGwgaWYgRE9NSURfU0VMRiBvciB0aGUgcGFzc2VkIGRvbWlkIG1hdGNoZXMgdGhlIGN1cnJlbnQN
Cj4+Pj4+Pj4+Pj4gZG9tYWluIGRvbWlkLg0KPj4+Pj4+Pj4+IFllcywgSSByZW1lbWJlciBKYW4n
cyBzdWdnZXN0aW9uLCBidXQgc2luY2UgdGhlIGxhdGVzdCBwYXRjaCh0aGUgc2Vjb25kIHBhdGNo
IG9mIHYzIG9uIGtlcm5lbCBzaWRlKSBoYXMgY2hhbmdlIHRoZSBpbXBsZW1lbnRhdGlvbiwgaXQg
ZG9lcyBzZXR1cF9nc2kgYW5kIG1hcF9waXJxIGZvciBkb20wIGl0c2VsZiwgc28gSSBkaWRuJ3Qg
YWRkIHRoZSBET01JRF9TRUxGIGNoZWNrLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEFuZCB3aHkgZXhh
Y3RseSB3b3VsZCBpdCBkbyBzcGVjaWZpY2FsbHkgdGhlIG1hcF9waXJxPyAoRXZlbiB0aGUgc2V0
dXBfZ3NpDQo+Pj4+Pj4+PiBsb29rcyBxdWVzdGlvbmFibGUgdG8gbWUsIGJ1dCB0aGVyZSBtaWdo
dCBiZSByZWFzb25zIHRoZXJlLikNCj4+Pj4+Pj4gTWFwX3BpcnEgaXMgdG8gc29sdmUgdGhlIGNo
ZWNrIGZhaWx1cmUgcHJvYmxlbS4gKHBjaV9hZGRfZG1fZG9uZS0+IHhjX2RvbWFpbl9pcnFfcGVy
bWlzc2lvbi0+IFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24tPiBwaXJxX2FjY2Vzc19wZXJtaXR0
ZWQtPmRvbWFpbl9waXJxX3RvX2lycS0+cmV0dXJuIGlycSBpcyAwKQ0KPj4+Pj4+PiBTZXR1cF9n
c2kgaXMgYmVjYXVzZSB0aGUgZ3NpIGlzIG5ldmVyIGJlIHVubWFza2VkLCBzbyB0aGUgZ3NpIGlz
IG5ldmVyIGJlIHJlZ2lzdGVyZWQoIHZpb2FwaWNfaHdkb21fbWFwX2dzaS0+IG1wX3JlZ2lzdGVy
X2dzaSBpcyBuZXZlciBiZSBjYWxsZWQpLg0KPj4+Pj4+DQo+Pj4+Pj4gQW5kIGl0IHdhcyBwcmV2
aW91c2x5IG1hZGUgcHJldHR5IGNsZWFyIGJ5IFJvZ2VyLCBJIHRoaW5rLCB0aGF0IGRvaW5nIGEg
Im1hcCINCj4+Pj4+PiBqdXN0IGZvciB0aGUgcHVycG9zZSBvZiBncmFudGluZyBwZXJtaXNzaW9u
IGlzLCB3ZWxsLCBhdCBiZXN0IGEgdGVtcG9yYXJ5DQo+Pj4+Pj4gd29ya2Fyb3VuZCBpbiB0aGUg
ZWFybHkgZGV2ZWxvcG1lbnQgcGhhc2UuIElmIHRoZXJlJ3MgcHJlc2VudGx5IG5vIGh5cGVyY2Fs
bA0KPj4+Pj4+IHRvIF9vbmx5XyBncmFudCBwZXJtaXNzaW9uIHRvIElSUSwgd2UgbmVlZCB0byBh
ZGQgb25lLg0KPj4+Pj4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSBpdCBpbiBkZXRhaWw/IERv
IHlvdSBtZWFuIHRvIGFkZCBhIG5ldyBoeXBlcmNhbGwgdG8gZ3JhbnQgaXJxIGFjY2VzcyBmb3Ig
ZG9tMCBvciBkb21VPw0KPj4+Pj4gSXQgc2VlbXMgWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbiBp
cyB0aGUgaHlwZXJjYWxsIHRvIGdyYW50IGlycSBhY2Nlc3MgZnJvbSBkb20wIHRvIGRvbVUoc2Vl
IFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24tPiBpcnFfcGVybWl0X2FjY2VzcykuIFRoZXJlIGlz
IG5vIG5lZWQgdG8gYWRkIGh5cGVyY2FsbCB0byBncmFudCBpcnEgYWNjZXNzLg0KPj4+Pj4gV2Ug
ZmFpbGVkIGhlcmUgKFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24tPiBwaXJxX2FjY2Vzc19wZXJt
aXR0ZWQtPmRvbWFpbl9waXJxX3RvX2lycS0+cmV0dXJuIGlycSBpcyAwKSBpcyBiZWNhdXNlIHRo
ZSBQVkggZG9tMCBkaWRuJ3QgdXNlIFBJUlEsIHNvIHdlIGNhbid0IGdldCBpcnEgZnJvbSBwaXJx
IGlmICJjdXJyZW50IiBpcyBQVkggZG9tMC4NCj4+Pj4NCj4+Pj4gT25lIHdheSB0byBib2RnZSB0
aGlzIHdvdWxkIGJlIHRvIGRldGVjdCB3aGV0aGVyIHRoZSBjYWxsZXIgb2YNCj4+Pj4gWEVOX0RP
TUNUTF9pcnFfcGVybWlzc2lvbiBpcyBhIFBWIG9yIGFuIEhWTSBkb21haW4sIGFuZCBpbiBjYXNl
IG9mIEhWTQ0KPj4+PiBhc3N1bWUgdGhlIHBpcnEgZmllbGQgaXMgYSBHU0kuICBJJ20gdW5zdXJl
IGhvd2V2ZXIgaG93IHRoYXQgd2lsbCB3b3JrDQo+Pj4+IHdpdGggbm9uLXg4NiBhcmNoaXRlY3R1
cmVzLg0KPiANCj4gUElSUSBpcyBhbiB4ODYtb25seSBjb25jZXB0LiBXZSBoYXZlIGV2ZW50IGNo
YW5uZWxzIGJ1dCBubyBQSVJRcyBvbiBBUk0uDQo+IEkgZXhwZWN0IFJJU0MtViB3aWxsIGJlIHRo
ZSBzYW1lLg0KPiANCj4gDQo+Pj4+IEl0IHdvdWxkICBiZSBiZXR0ZXIgdG8gaW50cm9kdWNlIGEg
bmV3IFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24sIG9yDQo+IA0KPiAiR1NJIiBpcyBhbm90aGVy
IHg4Ni1vbmx5IGNvbmNlcHQuDQo+IA0KPiBTbyBhY3R1YWxseSB0aGUgYmVzdCBuYW1lIHdhcyBp
bmRlZWQgWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbiwgZ2l2ZW4NCj4gdGhhdCBpdCBpcyB1c2lu
ZyB0aGUgbW9yZSBhcmNoLW5ldXRyYWwgImlycSIgdGVybWlub2xvZ3kuDQo+IA0KPiBQZXJoYXBz
IGl0IHdhcyBhbHdheXMgYSBtaXN0YWtlIHRvIHBhc3MgUElSUXMgdG8NCj4gWEVOX0RPTUNUTF9p
cnFfcGVybWlzc2lvbiBhbmQgd2Ugc2hvdWxkIGFsd2F5cyBoYXZlIHBhc3NlZCB0aGUgcmVhbA0K
PiBpbnRlcnJ1cHQgbnVtYmVyIChHU0kgb24geDg2LCBTUEkgb24gQVJNKS4NCj4gDQo+IFNvIHlv
dXIgImJvZGdlIiBpcyBhY3R1YWxseSBraW5kIG9mIE9LIGluIG15IG9waW5pb24uIEJhc2ljYWxs
eSBldmVyeW9uZQ0KPiBlbHNlICh4ODYgSFZNL1BWSCwgQVJNLCBSSVNDLVYsIHByb2JhYmx5IFBQ
QyB0b28pIHdpbGwgdXNlDQo+IFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24gd2l0aCBoYXJkd2Fy
ZSBpbnRlcnJ1cHQgbnVtYmVycyAoR1NJcywgU1BJcywNCj4gZXRjLiksIHRoZSBvbmx5IHNwZWNp
YWwgY2FzZSBpcyB4ODYgUFYuIEl0IGlzIHg4NiBQViB0aGUgb2RkIG9uZS4NCj4gDQo+IEdpdmVu
IHRoYXQgRE9NQ1RMIGlzIGFuIHVuc3RhYmxlIGludGVyZmFjZSBhbnl3YXksIEkgZmVlbCBPSyBt
YWtpbmcNCj4gY2hhbmdlcyB0byBpdCwgZXZlbiBiZXR0ZXIgaWYgYmFja3dhcmQgY29tcGF0aWJs
ZS4NCkkgdHJ5IHRvIHVuZGVyc3RhbmQgeW91ciBkaXNjdXNzaW9uIGFib3V0IHRoZSBtb2RpZmlj
YXRpb24gb2YgWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbi4gQXQgdGhlIHhsIGxldmVsLCBnc2kg
bmVlZHMgdG8gYmUgcGFzc2VkIGluIGluc3RlYWQgb2YgcGlycSwgYW5kIHRoZW4gYSBqdWRnbWVu
dCBpcyBhZGRlZCB0byBYRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uLCBqdXN0IGxpa2UgdGhlIGlt
cGxlbWVudGF0aW9uIGJlbG93Pw0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
cGNpLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQppbmRleCBkMzUwN2QxM2EwMjku
LmY2NjVkMTdhZmJmNSAxMDA2NDQNCi0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMN
CisrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCkBAIC0xNDg2LDYgKzE0ODYsNyBA
QCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KICAgICAgICAg
Z290byBvdXRfbm9faXJxOw0KICAgICB9DQogICAgIGlmICgoZnNjYW5mKGYsICIldSIsICZpcnEp
ID09IDEpICYmIGlycSkgew0KKyAgICAgICAgaW50IGdzaSA9IGlycTsNCiAgICAgICAgIHIgPSB4
Y19waHlzZGV2X21hcF9waXJxKGN0eC0+eGNoLCBkb21pZCwgaXJxLCAmaXJxKTsNCiAgICAgICAg
IGlmIChyIDwgMCkgew0KICAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21haW5pZCwgInhjX3Bo
eXNkZXZfbWFwX3BpcnEgaXJxPSVkIChlcnJvcj0lZCkiLA0KQEAgLTE0OTQsNyArMTQ5NSw3IEBA
IHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQogICAgICAgICAg
ICAgcmMgPSBFUlJPUl9GQUlMOw0KICAgICAgICAgICAgIGdvdG8gb3V0Ow0KICAgICAgICAgfQ0K
LSAgICAgICAgciA9IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbihjdHgtPnhjaCwgZG9taWQsIGly
cSwgMSk7DQorICAgICAgICByID0geGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKGN0eC0+eGNoLCBk
b21pZCwgZ3NpLCAxKTsNCiAgICAgICAgIGlmIChyIDwgMCkgew0KICAgICAgICAgICAgIExPR0VE
KEVSUk9SLCBkb21haW5pZCwNCiAgICAgICAgICAgICAgICAgICAieGNfZG9tYWluX2lycV9wZXJt
aXNzaW9uIGlycT0lZCAoZXJyb3I9JWQpIiwgaXJxLCByKTsNCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL2RvbWN0bC5jIGIveGVuL2NvbW1vbi9kb21jdGwuYw0KaW5kZXggZjVhNzFlZTVmNzhkLi43
ODJjNGE3YTcwYTQgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jDQorKysgYi94ZW4v
Y29tbW9uL2RvbWN0bC5jDQpAQCAtNjU4LDcgKzY1OCwxMiBAQCBsb25nIGRvX2RvbWN0bChYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQogICAgICAgICAgICAg
cmV0ID0gLUVJTlZBTDsNCiAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgIH0NCi0gICAgICAg
IGlycSA9IHBpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4sIHBpcnEpOw0KKw0K
KyAgICAgICAgaWYgKCBpc19odm1fZG9tYWluKGN1cnJlbnQtPmRvbWFpbikgKQ0KKyAgICAgICAg
ICAgIGlycSA9IHBpcnE7DQorICAgICAgICBlbHNlDQorICAgICAgICAgICAgaXJxID0gcGlycV9h
Y2Nlc3NfcGVybWl0dGVkKGN1cnJlbnQtPmRvbWFpbiwgcGlycSk7DQorDQogICAgICAgICBpZiAo
ICFpcnEgfHwgeHNtX2lycV9wZXJtaXNzaW9uKFhTTV9IT09LLCBkLCBpcnEsIGFsbG93KSApDQog
ICAgICAgICAgICAgcmV0ID0gLUVQRVJNOw0KICAgICAgICAgZWxzZSBpZiAoIGFsbG93ICkNCg0K
LS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

