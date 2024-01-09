Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC8827FE3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 08:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664305.1034425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN70A-0007ua-OU; Tue, 09 Jan 2024 07:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664305.1034425; Tue, 09 Jan 2024 07:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN70A-0007rL-L7; Tue, 09 Jan 2024 07:58:22 +0000
Received: by outflank-mailman (input) for mailman id 664305;
 Tue, 09 Jan 2024 07:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2W5I=IT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rN709-0007rF-0I
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 07:58:21 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e83::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d964bddf-aec4-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 08:58:19 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 07:58:15 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:58:15 +0000
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
X-Inumbo-ID: d964bddf-aec4-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDFwk74PE/blCj5dP0LK/42MUreRy4VAiIBn0Ot+cd01a+kywwN789X9lciaVekwELBZ50z8ntAbT2Kl6+DZv/lR//f8tSGtuXJxZYQHPtzxb9EPTRO6FMR+MfG6CdiGyhxW2N8/i0+9hrajDHTnipWurRtM4/ikadtnS6HYh1N6L+glW6qc6pYQPxoxHmipT+NrfjsnzhyrXK3e3VAeK/+zydoICJlKR7xvownwmxyxgcuYNrXDGx9NuDx0LybggUed+3iFKV9LD4sPXMcDYTK/KASBkCM+URRzV0DKs+6onSPRwffDWJbS49qA9JgJrh2YenTe4BCf3HWaSYtb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxueewzXbPVw3Zgi9Y61KkYrapyjpxz5Ae2hR6rqlOg=;
 b=ARrFi4kryRzpNze1jvXnZW1cJ+AQ/HU4UyzNBF41zuxTVXsKbIN3S7IuCMpzu6hBgn71wrNZiWuXMDfPOmUnW2uYxuLJY9Hi5c6FD6dcpzwYGAnrQG6fg5BilltN/pacUzySAxBnwSOfZTk/lAr0ayASky1lrA7QL2/56+foNXEeiqtUlX3HuLm9+2Akmcj3lSzFOavmAglyMk0eHc2EU7nXzKDiowyaEenqPF1WhR4cQImY9jsQcbBMp3mc1EQUFjZNYuvBGED5LIcZ3FNxjo+nzaa05eMNABPcqMaZ4G0Fv0WH/t5OFHA8P99Ot6SqtZmqhiBXCHEh9H6OERTz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxueewzXbPVw3Zgi9Y61KkYrapyjpxz5Ae2hR6rqlOg=;
 b=SLug8qEx+Oryhj7UiL0WwoVXxmXbmSfx2Bz/8MxrzAlv1imOSPEXKHSCopxPzEnwTfznIIYeiUl7Cbiz/GaT27VS68CZWfcLbi0C0xViGKfQ3DGub9uCspz1Q4/H79Uk5twbHAUNnbpL+mRddNSb1/6UBOMoUeXithn8q8jLe6k=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller
 isn't DOMID_SELF
Thread-Topic: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller
 isn't DOMID_SELF
Thread-Index: AQHaP6YuSUk29qg8QEWwkYk64ozIULDL9CiAgAOrDICAAImKAP//gTEAgAH/ogA=
Date: Tue, 9 Jan 2024 07:58:15 +0000
Message-ID:
 <BL1PR12MB584976595DC15018BE5D6489E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-3-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051639240.3675@ubuntu-linux-20-04-desktop>
 <242dbf1f-ef3e-42cc-906e-5c5bb01d8e31@suse.com>
 <BL1PR12MB58495C90CEC83B6EF66651A0E76B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <14986c92-7479-4258-be59-8606018c5885@suse.com>
In-Reply-To: <14986c92-7479-4258-be59-8606018c5885@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5045.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB8832:EE_
x-ms-office365-filtering-correlation-id: a87e939d-b1b9-49bd-a182-08dc10e8bc1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8B16CVK91oAqNZVCgXOi94Ju06LQNFTJESIDajxVx0/oeKzBrkNhnx7bnuwEEwmNSimoCtySzpEtUErJ5VbP2kHqjPYLc5CKA7d5CSYoh5LJmo7ywRBQnh5KIuoS6yvCwfnvc1th3pTVsUxPzlL0ZtCDli8lxVSMWZSy/1ZBjkOx8gUB31iw+hmPPVfdyOEqal3R/G8tUGUvLf54Z4oQcCKOJEhBmRt1Awy4Iq/pHvWoj+4FfnBneTK56JsVuvUtk94BWqxRi9f7BTpfOwNjD07g8pzhxWAmHtVstqA723W/1xWA9mhrs1SvMH/kCUWyLcO6G0HhZKkbW9GcFyciPDDbMm/g7GjgT1xK2UTlvX+kxEmGBVlwyaK5FXDF8wjfai8hsnH0uKnp/2lTgsb6/X9BTqrg7IeqWzLKIEj+XMjLNArx6qNwz6ealHZzHhbrbPGFvCTPN+zi2R2eHSL6kewR7aetlifU+KXNWvS3fGNUfE9jV5FXJKbxUyBTinoOXMIRCG2OPUS0WSLiwTr3DeowNew4edB960NQTd1yJnKacm3bhekpamGeTLIQbY0OjuZzF3AlmLXDnz2AODJOpwVHmrD5epDrZ03x+KkC3m1oFmVONVXwTtLk34qPaepEIRDSGbMi4q6ASqMcSSMbizPbgdWKsOdv8VMjs/gGiGU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(6506007)(9686003)(53546011)(26005)(122000001)(38100700002)(8936002)(8676002)(4326008)(52536014)(7416002)(478600001)(5660300002)(2906002)(6916009)(7696005)(54906003)(71200400001)(64756008)(66556008)(66476007)(66446008)(316002)(66946007)(41300700001)(76116006)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGNFdTNvQ1g2WHNvMTEzT0ZWOXFVakpZN2d3TFk2eEMxWC9KdWtreTF2MmI4?=
 =?utf-8?B?STlHQjJvczA0ZGNwdnZ0MlkzalhpR0IrQWVYWkhQdWc4Z0RHS2FadU96WGxT?=
 =?utf-8?B?QWtJQVRKdzRnS0RxYVZFQkpkbUo5ZjlDdTZLTFNWYlFEQ0JsTCtIa3h6VDlr?=
 =?utf-8?B?QmpqWllwSUhmMStibExEQW04ZDZrTWREQk1nbUJNNHhLTXRVRWZvWG1WOUJn?=
 =?utf-8?B?ZDRJRnJPSTZEcjJsRlA1S214TkdvenFYejdvTUpXSU5iMSt0Y3dtb1IrVTNJ?=
 =?utf-8?B?bzh4ZER5WGJFcFg1WmtvMnBadmM1V2d1bzMxK2s5eWNpNkxGQzlVREV5OFpJ?=
 =?utf-8?B?b3ZObG15OER3aEZhL1Bqa3lMQ0xYUXhNTm1Ec25XNEZDdjZpRjl2SW44YlpE?=
 =?utf-8?B?MnlDeXN3ZUtNQWlHMXg1QklMNUE4Yi9uVjNPL2hjREdNNzRIQlZ0ZmJ4cWZY?=
 =?utf-8?B?K1FtbVVSL0ROa1d2MndxRjZ0RlB6WFNRSmlEYUNzSHlMN3JYWGY0V0huRk9O?=
 =?utf-8?B?RnpzRjNIMGN1U3owOW1lSVFkL29DTEVnT2RVY05ZYmVMczd1SmRKREV3VWZh?=
 =?utf-8?B?akZ4TGFDZThCSFJSZm5tbWZ0NG1iVTZmTm92MnB0NUlMMlBUK1h5eVQzMEhW?=
 =?utf-8?B?MlZ1eGpHSEZjc3hKNlRtclFOSm9yT2lBOFNJaDM4TEZ1Mm5ZTWdVSit6WnNE?=
 =?utf-8?B?b0xJYVBURFFQQVNjcFEwYUdYcU9FQkdudjVuQStzQVo0dkNJOWFCazBvOGtt?=
 =?utf-8?B?UktmMFdlc1E1WEdBWFcyU0c3OVFXcEQwcXhMaEk2SGtlaXlWVHM5SGFqNUhK?=
 =?utf-8?B?TDFEOE1VbDVNMDhWbUVmVElVN1JTaVdPbExueTBVRzFDa3FIbmxlMWtEQjhq?=
 =?utf-8?B?OHNPMVVUbjlHYTJPSFc0U294M2RWNGJONGY5VlVVcXJXZHlYdmswS0tYWHpu?=
 =?utf-8?B?c3JqUjhnQ1czVU9vbWdJc3BVZ005ejlkM211UkNYaXZqSjZBQWJuMXNycXFs?=
 =?utf-8?B?Smh4WDlzQzRGUTVVV3NLeURuT01sVXZqK0ZBOXNOY0xpRFdBWElXUkhDS0hU?=
 =?utf-8?B?eDVmc2NuelpxQjdLOWs4S01DOWZhRk9FOUZab3RiWXFCcXVTb0dvMWFkSEYx?=
 =?utf-8?B?Vnkxd3BhTUNiU2NhY0JUQnlkVFFCSVRCMWxVZUVnemdoV2pVZUNCbHo5bVNl?=
 =?utf-8?B?NUdsYktLd1c4NGx4Mm45Sk4rSWRtN2padnZsVkF5Q09hTmZxZ2hpbFNCazVp?=
 =?utf-8?B?TFBkd0xleG5vK01iWGhxT3dFblo1OWFWU2drWlA5K2pUcHN4VnA3Z3ZBamcy?=
 =?utf-8?B?TFZ0SGZpSjlnQ2Vyc1pDOGE4VHdlN1U5NTJnWFd0YVFHWmhON05FbW9FQWFI?=
 =?utf-8?B?TGhaZG1uRW5VYmhrUjhSVnNzenJMM00weUs0UDJIME4xbExsc2RJZlE5bTQv?=
 =?utf-8?B?eWxtV0xkZ3JNTVRBcTVKcVdJaUhrWVFVZ0NYcnNrbnhhVE12N3NIbkdBTDE0?=
 =?utf-8?B?TDVpRVl3WTNlYlc0T1lEbENndHZjeUNvRUlGZnk4L2ZmaHpuRWUvSHRBSTJm?=
 =?utf-8?B?TXIrZ010UjZWVzNoRFhCYWNuZDZwamtLNER4Yjk3c05Jc0tGcUJHMzFIUWJP?=
 =?utf-8?B?QnZVRkcxNno1OGVORlNTYkViM3BIZE1pSjhvYUp2R2kwZEhqRVVpRFRyOW55?=
 =?utf-8?B?OTRtMU1ySWdWc0VuZDBQcFIweXNVSzlhcis2NUVCcnRCRm9sdDlDeDRBY1l5?=
 =?utf-8?B?a1B6d2MvTXRGM0pWRUhrME5wV25kby9Sb0YyS2F6R1NGUWZLZ2NBaU5oWC84?=
 =?utf-8?B?WmRISm42eEx2VmpqcDBEUHpNbUlDOHcvYjhGaGFDRWFlR3orekpGdGE3ZWVE?=
 =?utf-8?B?OHdoUHZEVmdtRm53dE9RY3QzYXpUcmpERFNhcUkzclJWUmFLTm5paWhrOEJr?=
 =?utf-8?B?MFJldmxVSlNtSHF0VWZsNnBnd2QvYlo1M0w4MGZiS0wvek5JTlkyYktYNUtN?=
 =?utf-8?B?M1lLYVNIeEF2NmtteEY3ZS9sVktKZ1NLaEdwRjJTNmkwem5XZC9DSlpBMXFI?=
 =?utf-8?B?NTB2YUExaTBuQVMrTFFlaXl4TmZNMTlIR2ZNd2RSdTNOUDBFTGVsQXJ2Sko0?=
 =?utf-8?Q?vsb8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BF0B40D98653743B591B52548B0BFB0@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87e939d-b1b9-49bd-a182-08dc10e8bc1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 07:58:15.3515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gcsPJF+LpQHMFw7gF3WjPwGjEcPRrkFiTjz5x+HuwvXaKkKoXSfldLxbn2IlVUpMR3osvY/ur27poKlLuaOrXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832

T24gMjAyNC8xLzggMTc6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wMS4yMDI0IDEw
OjE1LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzEvOCAxNjo0NywgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDYuMDEuMjAyNCAwMTo0NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPj4+PiBPbiBGcmksIDUgSmFuIDIwMjQsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4g
QEAgLTcyLDggKzczLDMwIEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNU
X0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4+PiAgDQo+Pj4+PiAgICAgIHN3aXRjaCAoIGNt
ZCApDQo+Pj4+PiAgICAgIHsNCj4+Pj4+IC0gICAgY2FzZSBQSFlTREVWT1BfbWFwX3BpcnE6DQo+
Pj4+PiAtICAgIGNhc2UgUEhZU0RFVk9QX3VubWFwX3BpcnE6DQo+Pj4+PiArICAgIGNhc2UgUEhZ
U0RFVk9QX21hcF9waXJxOiB7DQo+Pj4+PiArICAgICAgICBwaHlzZGV2X21hcF9waXJxX3QgbWFw
Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJm1hcCwgYXJn
LCAxKSAhPSAwICkNCj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4+Pj4+ICsN
Cj4+Pj4+ICsgICAgICAgIGlmICggIWhhc19waXJxKGN1cnJkKSAmJiBtYXAuZG9taWQgPT0gRE9N
SURfU0VMRiApDQo+Pj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7DQo+Pj4+DQo+Pj4+
IFRoaXMgbG9va3MgT0sgdG8gbWUgYWx0aG91Z2ggdGhlcmUgaXMgYWxyZWFkeSBhbm90aGVyIGNv
cHlfZnJvbV9ndWVzdCBpbg0KPj4+PiBkb19waHlzZGV2X29wLCBidXQgSSBkb24ndCBzZWUgYW4g
ZWFzeSB3YXkgdG8gbWFrZSBpdCBiZXR0ZXIuDQo+Pj4NCj4+PiBIb3cgY2FuIGRvdWJsZSByZWFk
cyBvZiBoeXBlcmNhbGwgYXJncyBldmVyIGJlIG9rYXk/IFRoZSBuZXcgY2hlY2sgY2xlYXJseQ0K
Pj4+IG5lZWRzIHRvIGJlIGluc2VydGVkIGluIHRoZSBjb2RlIHBhdGggd2hlcmUgdGhlIHN0cnVj
dHVyZSBpcyBiZWluZyByZWFkDQo+Pj4gYWxyZWFkeSBhbnl3YXkuDQo+PiBJIGFsc28gdHJpZWQg
dG8gYWRkIHRoaXMgY2hlY2sgaW4gUEhZU0RFVk9QX21hcF9waXJxIGluIHBoeXNkZXYuYywgYnV0
IHB2IGhhcyBubyBmbGFnIFg4Nl9FTVVfVVNFX1BJUlEgdG9vLg0KPj4gSWYgd2FudCB0byBhZGQg
aXQgaW50byBwaHlzZGV2LmMgYW5kIGNvbWJpbmUgU3RlZmFubydzIG9waW5pb25zLCB0aGlzIGNo
ZWNrIG1heSBiZSBsaWtlOg0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcGh5c2Rl
di5jIGIveGVuL2FyY2gveDg2L3BoeXNkZXYuYw0KPj4gaW5kZXggNDdjNGRhMGFmN2UxLi5jMzhk
NGQ0MDU3MjYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvcGh5c2Rldi5jDQo+PiArKysg
Yi94ZW4vYXJjaC94ODYvcGh5c2Rldi5jDQo+PiBAQCAtMzAzLDExICszMDMsMTkgQEAgcmV0X3Qg
ZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykN
Cj4+ICAgICAgY2FzZSBQSFlTREVWT1BfbWFwX3BpcnE6IHsNCj4+ICAgICAgICAgIHBoeXNkZXZf
bWFwX3BpcnFfdCBtYXA7DQo+PiAgICAgICAgICBzdHJ1Y3QgbXNpX2luZm8gbXNpOw0KPj4gKyAg
ICAgICAgc3RydWN0IGRvbWFpbiAqZDsNCj4+DQo+PiAgICAgICAgICByZXQgPSAtRUZBVUxUOw0K
Pj4gICAgICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJm1hcCwgYXJnLCAxKSAhPSAwICkNCj4+
ICAgICAgICAgICAgICBicmVhazsNCj4+DQo+PiArICAgICAgICBkID0gcmN1X2xvY2tfZG9tYWlu
X2J5X2FueV9pZChtYXAuZG9taWQpOw0KPj4gKyAgICAgICAgaWYgKCBkID09IE5VTEwgKQ0KPj4g
KyAgICAgICAgICAgIHJldHVybiAtRVNSQ0g7DQo+PiArICAgICAgICBpZiAoICFpc19wdl9kb21h
aW4oZCkgJiYgIWhhc19waXJxKGQpICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVOT1NZUzsN
Cj4+ICsgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGQpOw0KPj4gKw0KPj4gICAgICAgICAgc3dp
dGNoICggbWFwLnR5cGUgKQ0KPj4gICAgICAgICAgew0KPj4gICAgICAgICAgY2FzZSBNQVBfUElS
UV9UWVBFX01TSV9TRUc6DQo+IA0KPiBXZWxsLCB5ZXMsIHBlcmhhcHMga2luZCBvZiBsaWtlIHRo
YXQsIGJ1dCB3aXRoIHJjdV91bmxvY2tfZG9tYWluKCkgY2FsbGVkDQo+IG9uIHRoZSBlcnJvciAy
bmQgcmV0dXJuIHBhdGggYXMgd2VsbCwgYW5kIHdpdGhvdXQgYWJ1c2luZyBFTk9TWVMuDQpPaywg
d2lsbCBjYWxsIHJjdV91bmxvY2tfZG9tYWluIG9uIDJuZCBlcnJvciBwYXRoLCBhbmQgY2hhbmdl
IEVOT1NZUyB0byBFT1BOT1RTVVBQLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMs
DQpKaXFpYW4gQ2hlbi4NCg==

