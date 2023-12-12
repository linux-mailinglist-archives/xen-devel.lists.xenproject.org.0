Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDAD80E46F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 07:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652668.1018676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwa7-0008F7-Sr; Tue, 12 Dec 2023 06:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652668.1018676; Tue, 12 Dec 2023 06:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwa7-0008Bm-Pw; Tue, 12 Dec 2023 06:49:27 +0000
Received: by outflank-mailman (input) for mailman id 652668;
 Tue, 12 Dec 2023 06:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aifi=HX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCwa6-00089A-ML
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 06:49:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e89::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9530d5c6-98ba-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 07:49:24 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL3PR12MB6641.namprd12.prod.outlook.com (2603:10b6:208:38d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 06:49:18 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 06:49:18 +0000
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
X-Inumbo-ID: 9530d5c6-98ba-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8D3XdHEMzEI3I3FUJGoTG873axQiGi4oWgM8D43phaW9wpZ3DJbKuIrM4jiwmBSO/4+6FtWtPgvC0BJqDH6+lr5/KAHx08kZ63egXkgDQlw4ENo16mDN1DjWciGLk100YHnAY1RMpwekjoY5ETM9JHOYV05U9ikJI68Kvp6gWpcT7HG4jsPESlCufuoKYASe9hh7CMEl+vVu4WYe7qADE3l2sefS90OlTuktYUKO6lKIKR27crR1zC6Lpmu6lebTxwGbbqMX6sW0h8aXSOLz4VVX+OPzTtbARIy3AnyhkY7L7n8UKwse219gyyRxHQyrCwMvPU4zh7ZEXVDzr8CMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXg2jog+JuIbIQrO/JyGIYNHE9ENSJgHlHhb6A6sipo=;
 b=WqNQHZR2mV5dEJeJaHT2kB8s5Tx22HZE2evomUmgedPHn28weFNIdsMaL0IcaB0EzuYSTmL/UPZf9L0wD+jJ9VjNuLrqLQMIivQLloPMj1ABBPgGabLGzV2ta5Ub2SiusT1XYzxsDvaEmUrJ0isie/VcUzh3t5UBbLpJPtR7Wk8QJCf3rh9II7B3EgkpiqObvRpdHlScJqGhWoNX8m4EEYDlTVJcrqt9Hw9/O/otwe01nSo8zSuc/AO9qvkZOqe3nEQ87ZJ9S3Y6DjI/ANWK+dd5ZDbODMg0EpSlXnYxpAScWOzo6/eO0a0B9BNgD1b6AqgKaGXtGpUfYAA7/SNUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXg2jog+JuIbIQrO/JyGIYNHE9ENSJgHlHhb6A6sipo=;
 b=yqUzCeCOR8AsXaWlcz6K24/LZAA+hFy44PiPUZOhCVFRnxRfKIHMhLLqAjgRMOyB1YB/q26YiUNfszKp3j77iG2+wUByqKfBBV8vTfPM3wJaRd/8Sem/WoTRJ4ZZDPAobdQutWLANECr1gAOqxmnzU5a6MCVhAp9Fh122CB0CAg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Topic: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Index: AQHaK4ebBv/EWT+No0GAUR8lU4172LCkNzqAgAGFPIA=
Date: Tue, 12 Dec 2023 06:49:18 +0000
Message-ID:
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
In-Reply-To: <ZXcrX44ceUjzjtDh@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5302.namprd12.prod.outlook.com
 (15.20.7091.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL3PR12MB6641:EE_
x-ms-office365-filtering-correlation-id: f9c44f0c-f4a5-4c31-6706-08dbfade76c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RVsgfC180YhAwoeXAOplmAuC14j+2AktCcxNgFVP6DgDz7+YJFFwMO7209rpBvv9V0jqAso8AQLLVsPaIen9zSIfRkUdC6Ds8ZI/h1UAjCDF57HdAzWp5w6h9FuX1EKxTcU6VHerQKx9stQuSScf6n1Qk9sFlxC5bILGaus+c4EW7JRpeHuuZF0rtyUvzWJEe5kpiMdojEcAJiOfAZQZKEsvxXEofoHvM8251VvsSg5I3t1EUoDn8+420GY1FDBBF6u/fmrDz/A/6E6xmL7bVFH43GLzNaAwjeNeGPwJbtTqMYhZjHoI/2Itn5wjAFVMlmRrA3O/aE1Iiyj6pxcqhWUNjcWliA6fM1UiI4d9UwaSrlHpGd5ILuqLswPw/GNjUQIsp1lmJYaeSQmk3gvo/FWq3O7PeMyl+RGLjqGOEojtTJKU7BjDghHcYF6syeJwEWJj5z8zVqOSbdd7R37vTC79eeYfNevg6g+rsHGcJG+U468hhbuNNvhxZGggWg515n7gzS5e+6g1puarCRynvwgKCPT+Beoctx+JG0LWSSdN6T6EVXGSLogJvveQhO3jfJcKuhqopakMfrxS7DDiltoAvNxewu4DHimY1uCL7ZsKt3E9Ye1Bm5CC/YY3jcpy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(83380400001)(53546011)(7696005)(6506007)(9686003)(66946007)(122000001)(5660300002)(52536014)(4326008)(8936002)(41300700001)(8676002)(2906002)(71200400001)(478600001)(316002)(6916009)(66556008)(54906003)(64756008)(66446008)(66476007)(76116006)(38100700002)(33656002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlRnd3BhWkxuL3A2RjhCY0FJMEkwbWVDVzVabGRMSk9oNG1oQ3ZuQ0s2VU5n?=
 =?utf-8?B?c3UwZ1dHYTZldndyMHFDYjZoeTd1ZkFySTYvVTVPV05nQk0xd25lMUM3enVk?=
 =?utf-8?B?c0QxMUxjNTVvOWVReG1uODBmZGVQNGhNVVIwd1FrK2VBL3poT2JuRFFMY3VM?=
 =?utf-8?B?UUtBSVgvampKRllBY0RIUDU1cXNYdWxzODZZa1owZVVOSnQ1Q1pWTEUveGls?=
 =?utf-8?B?OVJqZy80QkRGVE1Sa3Z6cFhqbFBuN1NKOXpvY0t4QXlSTEYvOFU3TlBqaEZs?=
 =?utf-8?B?TEc3dUxabXEwT2xBeXZsOGlzQ1JrQzFQTGFkMzEwWEtIRmZianJYU29jRUVv?=
 =?utf-8?B?S0txRVNua0xqZm5XWVNzc0JhZFlhQzN2ZEkvbTNCY1FYWFo1K2hwYkpEdXFs?=
 =?utf-8?B?Y2Y1RU5FaFNpdDZmS043djJjSlUwWEZ6NnZVaUhUUXZhM1NRMkVVL3FjL1Zn?=
 =?utf-8?B?eUZCNjlkbElCaXBpa0dEdkFKTkVDRDJKMGRNcEs5cVhYdkwvMTcxQ2U4VFZS?=
 =?utf-8?B?NDFaZTV2bU02M2tDNkZMRXFNZ0IrSmtFS1BRb3VUcE1IQjlzNENlck14N0dm?=
 =?utf-8?B?NG5ERm9XOVU1Y3d4SU15VnJUeVgzMk5GVU1OMkVRMnZNT0FQMkg3QkdvUWpN?=
 =?utf-8?B?YnVHb2VuOE1IV2ZWdDZHYXAyMk0yWFowclkwL2ZXQnc5WEFNN0R6RWhLZHNq?=
 =?utf-8?B?K2pvaHBucnd0V3lrN3MxY3Z5dGE1K2IyeUZaRDVsa0FqRGpLV2dEMDdFWlNq?=
 =?utf-8?B?a0VkaVE5N1A1a20rREU1dTc5TERmYXdPUzhhUFJJQUNWRUovWUJCbUZTbFpY?=
 =?utf-8?B?eGpOV1dKYXl6OTV1TldoMFFFUnU5MnV2ZFRxZ0dhOTJHd2JaeTgvTThPOUMx?=
 =?utf-8?B?QlZncm13aldSOHlYTnAvVnBpYkhRcnJKMTFybllIeXgwb1lyVk01VjlvcDIx?=
 =?utf-8?B?cVhhUU9Gdkc1bDA2U29yei9lNi9Xek12N3ViTk40VWVhSlBkRVRVd3cwR2tD?=
 =?utf-8?B?WXJyUFNRQ0dWU1ltWUxRWXdocXRtcTZJRVJrTXZ5YmpVc2F0dGxKRXhEb1Z6?=
 =?utf-8?B?OU91MnpsaHNTWnNGMUtKMFo4dnhYNkI2U2NrU0tBTHdOdWh6TVQ5N0x3cXQ1?=
 =?utf-8?B?VFI4eGI3RWQ1TjBCek9YVGUyNCt4c0cyR1B5K1BESURLd2MwKy9iT0hWdHRV?=
 =?utf-8?B?aW5weXRPcmdFaWl5amVYeVdLakZlZk9OVEN0V0xUR29MVXhqL3Z1eUpWdFRo?=
 =?utf-8?B?Q085RkdNQjhiRmZJWTZsZFRYdWVOT24rVTV2N01ZTGo4WVU0d3crNXBLT0RQ?=
 =?utf-8?B?WUlManF3K1g1TDNKY0l1V0dVUDZ6U0NSa3Q2WVIyc3pObGUwcWJORHp3aVht?=
 =?utf-8?B?WkM3UFpXQW5pZmZEcjhRNkpOYndOUkVzOUMxWDd6V2JnSFdObFIyMnk4cEVF?=
 =?utf-8?B?THRpeHpkWTJUemZaMzVPbTgzekEyN0IyVklpZzNhVmpHa2kyTmRTN04zL3ZV?=
 =?utf-8?B?all1L0IxWjJMVGpqY1E4YnNpbjFpQVZsMktBNUd3SXlWZ3lxYUFDSFBGY2U2?=
 =?utf-8?B?cXFRVTBRdGJQSmJvZWxVbVlOOFYwTlpuZWltY1JtNEo4SldaU1V0N3hVVGFE?=
 =?utf-8?B?SVBKanhkcHN4NGZFam12bmdZNXY3OEVNUmoyVFJzMGVlbzJSNGl0WTltcWdR?=
 =?utf-8?B?UnBhbWVhQ2NnWGZ0cWtTRnQxV1llNDVSemtOdGUzV0pqUTdKVFFtUTd0dWpT?=
 =?utf-8?B?dmNYKzlJZzVVNE9IalNtU1UxTGwzcitFMHJUc1hoeVRmQ2hhbVU3cVhocWll?=
 =?utf-8?B?bDVOdjRDYU9DaUVDZG0yNFdvSlRmeGxDcFQ1UW5JOG1ELy96WTRONnJUS1JP?=
 =?utf-8?B?cGdmelRtM2h4eENmQUkxcTBJUDFMWmhiNkVWbVhDUU9PbXdOYkpMdHpIWXY2?=
 =?utf-8?B?Z0NDZEhRYmprbHA0Q1c1QlNicVhUYlkwUFJxTFRtSmJrVFNHeHZvQkpMUHBJ?=
 =?utf-8?B?dHBNRXljREsrNGdmSEtqaEU1aXZBSWM3cTlYWm1zMm9vRjFmUThQWUk2Qncx?=
 =?utf-8?B?Ym5VTGJsOGNzbjR4Sk5TVjRYL0x0L3BaVUptZ0dGTFBnK2NPNjF0Q0VzVk5m?=
 =?utf-8?Q?tMh4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C311F8E7F7BE945ACA5F0A1A8AB85E1@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c44f0c-f4a5-4c31-6706-08dbfade76c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 06:49:18.5075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dRxLux+7zqOG6Nj6/dw9JEWgyg0WNhINWwMos1rgNDobnDd/CddZOJ+qmT56MkL0J39R/MqdfhhZFmjBufHotA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6641

T24gMjAyMy8xMi8xMSAyMzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBE
ZWMgMTEsIDIwMjMgYXQgMTI6NDA6MDhBTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJ
ZiBydW4gWGVuIHdpdGggUFZIIGRvbTAgYW5kIGh2bSBkb21VLCBodm0gd2lsbCBtYXAgYSBwaXJx
IGZvcg0KPj4gYSBwYXNzdGhyb3VnaCBkZXZpY2UgYnkgdXNpbmcgZ3NpLCBzZWUNCj4+IHhlbl9w
dF9yZWFsaXplLT54Y19waHlzZGV2X21hcF9waXJxIGFuZA0KPj4gcGNpX2FkZF9kbV9kb25lLT54
Y19waHlzZGV2X21hcF9waXJxLiBUaGVuIHhjX3BoeXNkZXZfbWFwX3BpcnENCj4+IHdpbGwgY2Fs
bCBpbnRvIFhlbiwgYnV0IGluIGh2bV9waHlzZGV2X29wLCBQSFlTREVWT1BfbWFwX3BpcnENCj4+
IGlzIG5vdCBhbGxvd2VkIGJlY2F1c2UgY3VycmQgaXMgUFZIIGRvbTAgYW5kIFBWSCBoYXMgbm8N
Cj4+IFg4Nl9FTVVfVVNFX1BJUlEgZmxhZywgaXQgd2lsbCBmYWlsIGF0IGhhc19waXJxIGNoZWNr
Lg0KPj4gU28sIGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGN1cnJkIGlzIGRvbTAgbm8g
bWF0dGVyIGlmDQo+PiBkb20wIGhhcyBYODZfRU1VX1VTRV9QSVJRIGZsYWcgYW5kIGFsc28gYWxs
b3cNCj4+IFBIWVNERVZPUF91bm1hcF9waXJxIGZvciB0aGUgZmFpbGVkIHBhdGggdG8gdW5tYXAg
cGlycS4NCj4+DQo+PiBXaGF0J3MgbW9yZSwgaW4gUFZIIGRvbTAsIHRoZSBnc2lzIGRvbid0IGdl
dCByZWdpc3RlcmVkLCBidXQNCj4+IHRoZSBnc2kgb2YgYSBwYXNzdGhyb3VnaCBkZXZpY2UgbXVz
dCBiZSBjb25maWd1cmVkIGZvciBpdCB0bw0KPj4gYmUgYWJsZSB0byBiZSBtYXBwZWQgaW50byBh
IGh2bSBkb21VLg0KPj4gU28sIGFkZCBQSFlTREVWT1Bfc2V0dXBfZ3NpIGZvciBQVkggZG9tMCwg
YmVjYXVzZSBQVkggZG9tMA0KPj4gd2lsbCBzZXR1cCBnc2kgZHVyaW5nIGFzc2lnbmluZyBhIGRl
dmljZSB0byBwYXNzdGhyb3VnaC4NCj4+DQo+PiBDby1kZXZlbG9wZWQtYnk6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFu
LkNoZW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMg
fCAzICsrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyBiL3hlbi9hcmNoL3g4Ni9odm0v
aHlwZXJjYWxsLmMNCj4+IGluZGV4IDZhZDViNGQ1ZjEuLjYyMWQ3ODliZDMgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL2h5cGVyY2FsbC5jDQo+PiBAQCAtNzIsOCArNzIsMTEgQEAgbG9uZyBodm1fcGh5c2Rldl9v
cChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICANCj4+ICAg
ICAgc3dpdGNoICggY21kICkNCj4+ICAgICAgew0KPj4gKyAgICBjYXNlIFBIWVNERVZPUF9zZXR1
cF9nc2k6DQo+IA0KPiBJIHRoaW5rIGdpdmVuIHRoZSBuZXcgYXBwcm9hY2ggb24gdGhlIExpbnV4
IHNpZGUgcGF0Y2hlcywgd2hlcmUNCj4gcGNpYmFjayB3aWxsIGNvbmZpZ3VyZSB0aGUgaW50ZXJy
dXB0LCB0aGVyZSdzIG5vIG5lZWQgdG8gZXhwb3NlDQo+IHNldHVwX2dzaSBhbnltb3JlPw0KVGhl
IGxhdGVzdCBwYXRjaCh0aGUgc2Vjb25kIHBhdGNoIG9mIHYzIG9uIGtlcm5lbCBzaWRlKSBkb2Vz
IHNldHVwX2dzaSBhbmQgbWFwX3BpcnEgZm9yIHBhc3N0aHJvdWdoIGRldmljZSBpbiBwY2liYWNr
LCBzbyB3ZSBuZWVkIHRoaXMgYW5kIGJlbG93Lg0KDQo+IA0KPj4gICAgICBjYXNlIFBIWVNERVZP
UF9tYXBfcGlycToNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfdW5tYXBfcGlycToNCj4+ICsgICAg
ICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJkKSApDQo+PiArICAgICAgICAgICAgYnJl
YWs7DQo+IA0KPiBBbHNvIEphbiBhbHJlYWR5IHBvaW50ZWQgdGhpcyBvdXQgaW4gdjI6IHRoaXMg
aHlwZXJjYWxsIG5lZWRzIHRvIGJlDQo+IGxpbWl0ZWQgc28gYSBQVkggZG9tMCBjYW5ub3QgZXhl
Y3V0ZSBpdCBhZ2FpbnN0IGl0c2VsZi4gIElPVzogcmVmdXNlDQo+IHRoZSBoeXBlcmNhbGwgaWYg
RE9NSURfU0VMRiBvciB0aGUgcGFzc2VkIGRvbWlkIG1hdGNoZXMgdGhlIGN1cnJlbnQNCj4gZG9t
YWluIGRvbWlkLg0KWWVzLCBJIHJlbWVtYmVyIEphbidzIHN1Z2dlc3Rpb24sIGJ1dCBzaW5jZSB0
aGUgbGF0ZXN0IHBhdGNoKHRoZSBzZWNvbmQgcGF0Y2ggb2YgdjMgb24ga2VybmVsIHNpZGUpIGhh
cyBjaGFuZ2UgdGhlIGltcGxlbWVudGF0aW9uLCBpdCBkb2VzIHNldHVwX2dzaSBhbmQgbWFwX3Bp
cnEgZm9yIGRvbTAgaXRzZWxmLCBzbyBJIGRpZG4ndCBhZGQgdGhlIERPTUlEX1NFTEYgY2hlY2su
DQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENo
ZW4uDQo=

