Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB05824F6D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 09:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662028.1031945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLf7V-0000il-Jh; Fri, 05 Jan 2024 07:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662028.1031945; Fri, 05 Jan 2024 07:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLf7V-0000hA-Ga; Fri, 05 Jan 2024 07:59:57 +0000
Received: by outflank-mailman (input) for mailman id 662028;
 Fri, 05 Jan 2024 07:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLf7T-0000h4-N8
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:59:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68341605-aba0-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 08:59:54 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 07:59:48 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 07:59:48 +0000
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
X-Inumbo-ID: 68341605-aba0-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHYbU86+BS3ltDxFcCT6wc4Rha33VAVxTRNgmdWB1vOeLQsxqhUYkxjGtbFTt5tPRfbkvjaimfKxf1qSq7QBP5cQyFplRo0MxOcMxx6yBhp01WpbXEoyImWGtaETjY7mG4hEHL1k/YTwkcTmw/V42gupnAB/0e3QNqix1fKG0Ih/3/jOPYEoP/3Dn51aHeSY+Wdz511DaEHJn3x0zLOQz5UaTpOG8tQ9hR7wNfkLDBct9hbVHq9b3oZT0G5WxNdlqPTNontRXA00clJNfz1ZOdgmOr9paS5CGJoa1t0f/UxKJbGwO8Ru8rWSNW60nmdRqPt0mDpV+JNWr+xUVuDRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF2+6CmOgts5Jd5H1iy89Xf6TWMrLIQq6E3AzRzjjDo=;
 b=gva58OH4ULbJIbYnRcr2sggWasv+fgkCmy2d//KVTjS/6X12IAq5mmWJSg3lZiHTJvZURMA+ShcjuxmWVCsxkW2Li7A6l3WwwbLDgpiIviONpAVuGVDSSu5HVgX0Ev6YPBsngfP/dSSjPSMjYbIWKXRgQ/RStjwLMxZ/Ob46z6YAfdfO/EFVvIcwUOqF8wCNklTP75ezb3FvtJjJ5r3rY0vpkf6w41xTPjhhST29Q3L+TFKky2yc7/bWPrcKZWMiUX+SHdL8oOtQixYiQ3jhKaERxwqh9JgtIx3gDMo50rw3caayza2WmmiZjDI9YJIr1bLNZqbGHjH60M7KSzdYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF2+6CmOgts5Jd5H1iy89Xf6TWMrLIQq6E3AzRzjjDo=;
 b=NZnfS7kd5wFzCNZdxFEdM78oT3awmQMc0jkUuAx7O454BO7Ty0qS/YUVQbXGjQFzqa9XQz1cPmpSdydIqK93P5Yuw3DF0aF857haTPL7j9QzJn3HH+hiEoPqE6ghMvrtTZkhM1I4lKYBhGUbmkF0ILOH0wV3rn9B8rW1EB6w1gI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 5/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Topic: [RFC XEN PATCH v4 5/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Index: AQHaP6Y3HXW6ZoMbT0+Rfz8pptyOwLDK1HoAgACMDIA=
Date: Fri, 5 Jan 2024 07:59:48 +0000
Message-ID:
 <BL1PR12MB58495E6A924B94D70824374DE7662@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-6-Jiqian.Chen@amd.com>
 <7cea57a4-c3e6-4f50-be45-e71c50097d19@suse.com>
In-Reply-To: <7cea57a4-c3e6-4f50-be45-e71c50097d19@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN0PR12MB6054.namprd12.prod.outlook.com
 (15.20.7181.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB6719:EE_
x-ms-office365-filtering-correlation-id: 5d05c9a3-32f6-48b4-034a-08dc0dc449c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 m8qt8zvAkqm549McZqc/0ac9kSkICPqFE3li2khJHQlYvLy1+N1qFkzWTEXHg3xXkTqVagYQXaxzSjF0lP0fV46i6mDp63rfCQzAG7UyONH3wHDeu6/VuRBXfuYXCqI8fws9TfvD61Pq6Myd72cnZT7ue4wYT9emDPfJucvFWcyDJ4hPa9i9cYNl25DGJZRW7t+qMG/fWWe/y195Ybuu9aguisPjJEvHpzZvi0s03+HFvW0J6EwMDJ3x8AazZqCS4PA5nhtM17eB/1MvTLylsB1PgMJdAWhyXRag5mArkasuxMs6rQN655XzOMlm3bNv5hmHDNxhxQJZXLcApEcIOXkRsiuVJZhrheThQ/yoa6S3EBR4xesETjO+hW59sHUwIhxnVeqMRaiRGuNQIIwCJXWgJ63DAvb4FfeoxEN0Pgx7v2OKe8zHcRAnYmzQ/Fy6o79ODdbNcMpxRF1UIvmDe4CBuyeHvFYhNy6oYtIvAjMVBbKld0wY+9NSgMPV2zJ79SH3PofP4TTMZe3Y8XZpcHKgA/avICrKJH9d4G4dXLwuDE8jTRQunMCIEgNmaOOV8KJ/YyO3u4AYINVzu3w3DNfootGOmnXjUpQgQ8mdkgm16WXbnXtS+GjBWkmmMUUu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(55016003)(26005)(53546011)(71200400001)(7696005)(478600001)(9686003)(6506007)(122000001)(38100700002)(33656002)(2906002)(41300700001)(7416002)(83380400001)(38070700009)(6916009)(54906003)(66946007)(66556008)(66476007)(66446008)(316002)(64756008)(76116006)(5660300002)(4326008)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUV5ZVVYTU8wTjB6UE1qUFVKbGE1aGE5OGtvRW5UakRFcHZPTnI0T2s1TDJB?=
 =?utf-8?B?RVljRkl4NkFTbnJ5b04wNmMzK0o5THBQbjFVVXhFa3BWZVRud01EWnB2YTJ5?=
 =?utf-8?B?WndxN1BMMDNPWkNVeURzWHlWM2c4emVPaXRGNHRpTXlPcFpJTENxWGREM3Ev?=
 =?utf-8?B?a2IrZ0trb1JOOENkcjRLUmNpUGIrc3BqMjhUT3lFb0JEMUE5c2l4VVlmdzh5?=
 =?utf-8?B?L29rMFVXcVo2Wmw2TTA0TDVDL0NOeFR3Z3dYelVmdGZLRTZBNWU1bjc2QjVT?=
 =?utf-8?B?UG5vSVZVMnhWZVV3bEJFc2tPQndNRmhVa3VWbU54dDRaeTZTNVZvYnErTkxZ?=
 =?utf-8?B?VkN0ZG9lRmc3N1FtZWt0VjczaHlHN290amJKeFN0RkUraUwzbENtVmZOcmR3?=
 =?utf-8?B?NmFLbGkyNEFyNVNlMExLMC9DYzNMNVlzTlZENzNQZVltWnpudzEzU09pM1pj?=
 =?utf-8?B?ZVFRdDdYUHMzRERDbE94cVF4ZURBWFBaaDBQQkxGcG1GRjRLNXVOWkpxSity?=
 =?utf-8?B?SVlyS21ZaDQ0ZnRtN2hWeHNTTEEycG5kanRFVXRaQ1lJc3E2NmVuQ2g0NEp4?=
 =?utf-8?B?N0c5K3FxaFhlQjlmQUxGeUxjSkdwbm5CRFhGRGRVeTNaL0g4WUdNeDZvZHZK?=
 =?utf-8?B?TXR0KytWbklQY1pUS3N5WHdIYktvSHFZUnFrdFZUa1IvUVM3RXNkeUl3WG1v?=
 =?utf-8?B?V0M0NEhRb1V5TmFHKzRXN0N2cGRQMG8xWFpKL0lQMWxzb0pQekFzNmpPajgz?=
 =?utf-8?B?UUxibE1zcFNYenA4YUk3NEdobis0YjJGQ1JaWG9FdVRjT0RnNUJGTEpoMGh4?=
 =?utf-8?B?RzhVc3NQMjRGdXF6SURLc0g4Mjk4TERCOVBHVFQzODdON2cxRVVZbmlSZDNq?=
 =?utf-8?B?K3phL08ya0tQL29OUzJQd0pNcWtFL05FWDB2cllydzhCTE1YejU3Tm96cE5n?=
 =?utf-8?B?bFQzLzhnUTdyRkNWZ1J2dHFZbU5OY1dPUlFzVk1rb3ViY3ZMcTMwTCtIMC9s?=
 =?utf-8?B?VW1sMDFOQU9ETnlVcElPTVVMT0dKSWU4YVB0dVBkUS8xZkUvVHVXdmdLZzdP?=
 =?utf-8?B?b2hFTUp3WURqZFVBRnJmZFA0dkJkQlZSalRwYWRNaFJUK21yWFBCMW9XN2Js?=
 =?utf-8?B?OGlwdDNyMDMyazRDbUlpUXI4NFptVm5kNlNwc2pkcWM2Z1Vud0lvU29SZjA3?=
 =?utf-8?B?aVljVjJ6YjdqSzd2T2VXN2QwYTJKem1JRitOZ0ozM1l0Mm9IQTFlVTE4aTBB?=
 =?utf-8?B?ODBWUmQzV3d2SkNoSkJGanJUSnVySWd5a1pBUWpBZ2YwUDFOVlhFb2tOUkhz?=
 =?utf-8?B?Z214N3MzNlZHeDVNUXoyMDZQbGc4MHprODFSVlR6L1hyUmhlcTJpMGpmTmg3?=
 =?utf-8?B?Y3o5WXFCY21NM0pjV3NGNkdmdjQ4Q1FJV1kyZEVwVktwWTNla1NqaTRMRkNi?=
 =?utf-8?B?Y0x6T01lOFpkN1kvNFNlUjV1cGxRTTdYVWk2dDcxT0l1VkhIM0paTlovdS9j?=
 =?utf-8?B?TGthV0pTL1c1YnF4TWdBdU9icDQvVnhaM05oOVB4S1pTY29sK2tMNmRSM0dI?=
 =?utf-8?B?M2R4WTBLSXUrVkxVblJhZ3NQT21DMnBVdlIxNStEMkJwalYxeGtlZkdZTU5i?=
 =?utf-8?B?eUxQSTJOeklnWWFjVWFjUWtqdzQxTXNaQzVseUJPaEk0UkpOSHN0bVIzdmQz?=
 =?utf-8?B?SGNxY1RuTmJLTk5pclZKWTJ5UFAxL3o1S0VRZ0FJSW0xRG1TS1NqUjhCNDZq?=
 =?utf-8?B?WVhLMWc3TmZvSnhOZ3haby9US1lPbUZjdGF6NVRsbmd0VUJtTzN5RHMwUzFD?=
 =?utf-8?B?TDJhTks5NVNQRnJhZzZsTlFEaHlJOWpEc1R4TjRmelo4NGYrS041RlUwWEox?=
 =?utf-8?B?RDE1UE4yT3VVaHFpdTFXVjZmY1I1eStidXB6eEJPQlFUdHNlV0lVbEs3SWVD?=
 =?utf-8?B?SlRIandhWTdTam02YnB1UW11STJRNnRLa2wrTGVGakd1dUVHLzR3QkdROTJZ?=
 =?utf-8?B?TTltZ2ZMWVJpRkpZOTM5emI5V3E3UFl0L2syVU5wQWNYREdMR3Z2V3Noakdj?=
 =?utf-8?B?d2Q0amY5bXBuUnJYSWdwMTZsc3pFWUsyaUwxSVY2TVJQdms1YTFVTnJDOEhj?=
 =?utf-8?Q?gbGE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D568ACC9B0784E4A85BEC2FD945D0BF6@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d05c9a3-32f6-48b4-034a-08dc0dc449c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 07:59:48.1946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uyh80qCX9tn2UJlxP0W2x/McPmNQo76CJTMYe35/c1WfPb5allOaBb05972Q1xNEEVvOQmmB8RX5ISDrZTTvUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719

T24gMjAyNC8xLzUgMTU6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wMS4yMDI0IDA4
OjA5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
cGNpLmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IEBAIC0xNDc5
LDggKzE0NzksMTQgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9kbV9kb25lKGxpYnhsX19lZ2MgKmVn
YywNCj4+ICAgICAgZmNsb3NlKGYpOw0KPj4gICAgICBpZiAoIXBjaV9zdXBwX2xlZ2FjeV9pcnEo
KSkNCj4+ICAgICAgICAgIGdvdG8gb3V0X25vX2lycTsNCj4+IC0gICAgc3lzZnNfcGF0aCA9IEdD
U1BSSU5URihTWVNGU19QQ0lfREVWIi8iUENJX0JERiIvaXJxIiwgcGNpLT5kb21haW4sDQo+PiAr
ICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2dzaSIs
IHBjaS0+ZG9tYWluLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpLT5i
dXMsIHBjaS0+ZGV2LCBwY2ktPmZ1bmMpOw0KPj4gKw0KPj4gKyAgICBpZiAoYWNjZXNzKHN5c2Zz
X3BhdGgsIEZfT0spICE9IDApIHsNCj4gDQo+IEkgc3VwcG9zZSB5b3Ugd2FudCB0byBhbHNvIGNo
ZWNrIGVycm5vLCBhbmQgZmFsbCBiYWNrIG9ubHkgd2hlbiB5b3UgZ290DQo+IGJhY2sgKEkgZ3Vl
c3MpIEVOT0VOVC4NCk9rLCB3aWxsIGNoZWNrIGVycm5vIGluIG5leHQgdmVyc2lvbiwgaWYgaXQg
aXMgRU5PRU5ULCB0aGVuIHVzZSBpcnEsIGlmIGl0IGlzIG5vdCBFTk9FTlQsIHRoZW4gbG9nIGVy
cm9yIGFuZCBnbyB0byBvdXQuDQoNCj4gDQo+IEphbg0KPiANCj4+ICsgICAgICAgIHN5c2ZzX3Bh
dGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWlu
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpLT5idXMsIHBjaS0+ZGV2
LCBwY2ktPmZ1bmMpOw0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgIGYgPSBmb3BlbihzeXNmc19w
YXRoLCAiciIpOw0KPj4gICAgICBpZiAoZiA9PSBOVUxMKSB7DQo+PiAgICAgICAgICBMT0dFRChF
UlJPUiwgZG9tYWluaWQsICJDb3VsZG4ndCBvcGVuICVzIiwgc3lzZnNfcGF0aCk7DQo+PiBAQCAt
MjIzMSw5ICsyMjM3LDE0IEBAIHNraXBfYmFyOg0KPj4gICAgICBpZiAoIXBjaV9zdXBwX2xlZ2Fj
eV9pcnEoKSkNCj4+ICAgICAgICAgIGdvdG8gc2tpcF9sZWdhY3lfaXJxOw0KPj4gIA0KPj4gLSAg
ICBzeXNmc19wYXRoID0gR0NTUFJJTlRGKFNZU0ZTX1BDSV9ERVYiLyJQQ0lfQkRGIi9pcnEiLCBw
Y2ktPmRvbWFpbiwNCj4+ICsgICAgc3lzZnNfcGF0aCA9IEdDU1BSSU5URihTWVNGU19QQ0lfREVW
Ii8iUENJX0JERiIvZ3NpIiwgcGNpLT5kb21haW4sDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGNpLT5idXMsIHBjaS0+ZGV2LCBwY2ktPmZ1bmMpOw0KPj4gIA0KPj4gKyAgICBpZiAo
YWNjZXNzKHN5c2ZzX3BhdGgsIEZfT0spICE9IDApIHsNCj4+ICsgICAgICAgIHN5c2ZzX3BhdGgg
PSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWluLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5m
dW5jKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgICBmID0gZm9wZW4oc3lzZnNfcGF0aCwgInIi
KTsNCj4+ICAgICAgaWYgKGYgPT0gTlVMTCkgew0KPj4gICAgICAgICAgTE9HRUQoRVJST1IsIGRv
bWlkLCAiQ291bGRuJ3Qgb3BlbiAlcyIsIHN5c2ZzX3BhdGgpOw0KPiANCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

