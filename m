Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB8829565
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 09:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665338.1035514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNUHg-0002dq-Oq; Wed, 10 Jan 2024 08:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665338.1035514; Wed, 10 Jan 2024 08:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNUHg-0002ax-Lx; Wed, 10 Jan 2024 08:50:00 +0000
Received: by outflank-mailman (input) for mailman id 665338;
 Wed, 10 Jan 2024 08:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bPZ=IU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rNUHe-0002ar-Lu
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 08:49:58 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aee230e-af95-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 09:49:57 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 08:49:53 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33%6]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 08:49:53 +0000
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
X-Inumbo-ID: 3aee230e-af95-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3RaG42MxSgbLwFSQoNhV+Lk6ILGQS7WhsCB85GXPOeAis0BuZDwjre7g7U9cIgUQ6SoUZlDcykOYOvOj9FVJ2TAr2kykbBs7Wuk0PSlcGfa2QZ0l8D5nGdvlGvZf93RL9d+lO3Az+MXVbclymQYMbvTvABD2b+fkZY8FkPLFXx2an8uOwjiqcaAnRsDTV2D4jg1onzj5ftmIJVVxPwqsVLahHpJk8FpipA2TjTkwAVBotdgAGyNeJFHLMFoHpUW6Z5JBeuY0CEdrro4rTjVuS3ttujhxNMKe0/2V79DB5SoBZ7v637cOazpYK63ZC9+RNXmy2gRi6XY3858D2hOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNC/m6Wg6FaUyMsWgAOZ2EL6+k1/Fx+GZGIBf8QCP+Q=;
 b=k8R75vJ4DK7wlYQ1E7rRg4eFSIHu4abto3v5heySdsRO+A8KZyrr8DPXtBSzmKiPfsiifP3SvXKKHo1M46L3l3TVuVqa5313XBSlxcEOStvSGxLbJ389h4uYK62XEe8ILj4beZXPBFsX7wPPH5cNXzfK3TmZbVWw9urslQmb+T13Z7GAnlil2+1FykAbr/e1ipHr0Fry2hHqFejAO6JxkhXMEtcL6XcvxoESDTZO129MWv52WluD+QIUcEL9bvx9qZZelqz6wW5+U4+P83ucDdM97DTlAwJFIsFMmQRb6CsrAvwqFZ+XvhJrWCyQVNfoGklfrto+p3/VtfAOrt92Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNC/m6Wg6FaUyMsWgAOZ2EL6+k1/Fx+GZGIBf8QCP+Q=;
 b=ELQXJsqxZTn35I8naNaRHq5WJSbSTpXE4OT6jHInt6IXEFCVkFx4SP7sjPsUUchJDwZsC+5uZj38JBS0KdffMMXCue6EoSNvBkbUCKOrqyR+xm9SJDPvXghii7q+xmgKjoYHEWS2l9hoIHMqFYgjGdwPXwYEuE0BlG4y68swYsA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Topic: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Index:
 AQHaP6Y1pt0ckfKChE+VsjXCWSj8+LDL+oWAgAOnBgCAAGd3gIABof4A//+U/YCAAIregP//iA0AgAH3KYA=
Date: Wed, 10 Jan 2024 08:49:53 +0000
Message-ID:
 <BL1PR12MB584997CDCE9AFF6FEDAD891AE7692@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
 <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com> <ZZwPSZoqyY6g9yhi@macbook>
 <BL1PR12MB58492746170F6BF777901141E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b4ed7764-a44c-4ac8-bb56-379fdeba16e8@suse.com>
 <BL1PR12MB58490E62825A5B1ACCE605EAE76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d9a363e2-db8d-4c14-af17-9ce02c53f7bf@suse.com>
In-Reply-To: <d9a363e2-db8d-4c14-af17-9ce02c53f7bf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA0PR12MB8932.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW5PR12MB5652:EE_
x-ms-office365-filtering-correlation-id: 714c91df-c254-4fbd-3cdb-08dc11b91cfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OEzgb5TEMj3jDCUMLy3KibbrZf/an+S49ybzFmHmVaqzb5aFpQZ7lrRYK+ms73w/sdOcI7hxVDkJA43SgFEhoRcjs+/LDvX61lM+NrK4YHJ2VPbU1jsZTg7S59qnvKyYn6/tKFrkUg/E9pZupz5URhGrqR9XdOjQqK3ekPzzdrXN8HaVRRvnDU9DwqwiU35CaOnkfy7dSUkxMLDULZEDKto02Z5ATtFQGtx80PbDlNUfISZccIzsTTM2QaaX/ZUZQwpLf1VFbEDrxzKjmKJkc9870hMk4A9gFBn0m0ZdFArpUpi1JpYyer0AFus8hEZE6Kn4+OvJpeh6SQg5vR0XEELrqVsmVTyAGCNAI64ELtJ8nRGI10wVgvC6hPiXOVFNpV5J2ibj0F3MLtL7N96VGwdyglSUopLhm4JL4ZoB4IRGHh97y/o04ZaubDT/dHJiM+BQxMBK+uBjbnfsUESt8be+DXsDY6dTE/umapVPEX8/YUJ6vRVJOGrnufIIn1ADbLHuxVd1Q2uCX3MtYyq5m+Bj7KSm3dtqdrkxq+oHO9JbMx0BS3VzXX6JtZHb07Hbt5+THRpJBzmGwpOd3Ws19HYcUKXSH8VeCCQz2TwARR45d2WBU3MJ3Dq48UhnV2Nf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(346002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(122000001)(38070700009)(55016003)(9686003)(6506007)(71200400001)(7696005)(53546011)(316002)(478600001)(4326008)(52536014)(26005)(76116006)(66556008)(83380400001)(66446008)(64756008)(110136005)(66476007)(33656002)(8676002)(8936002)(66946007)(54906003)(41300700001)(2906002)(5660300002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3ZOSmpmeUNqWTh2R3RmOHNYT0NDdFg1SkRoazlLZmQvVEIxOW01MDhSOWZM?=
 =?utf-8?B?VFkwUkw3WUdMdVdzN1QyUW5pV1BOOGJrL2pqK05ONktmR2ZzbGxBUlY1NFk3?=
 =?utf-8?B?Ujh1VFk0aXF5dC9tMW1STFZQQy9IZUNOalFlQ08yemV0YXdkOThMaGJsNkE3?=
 =?utf-8?B?cXF2cWhPNGdEcmVPTVFrRUN2Q1FsN0I0VDRKREVpcXAyUy9oMStNMmtUalRt?=
 =?utf-8?B?NFdBU1Q1d3VPb3NqZkwzR1lVd2lSTklsYzlRWjlRR09FK3RudjBRUkNrTWN0?=
 =?utf-8?B?ckF5NUZGZm8xelZJZi9hbEhoMjZkcENOYmlFMUt1dUdMYVQ5bGpJSjE0a08x?=
 =?utf-8?B?azVZMzNsZUVpUkJyNFRwSHVZc1RyVmJvTTg1bXBSRkd3bE44WGc1VC8rNS9y?=
 =?utf-8?B?T1ZmeVZudU1DbzhqckFJeW42L0F6eWRRMEdxV25GUnAzMGVxbFV4VndLWXQz?=
 =?utf-8?B?bnhERnlqUUo1R0FJUmtRZFR2SUlzelNDcjc1elFWSWlpQjVEemRHQjJlRE1T?=
 =?utf-8?B?OEc5b1l5b1RQUHE0S3laQjVVdWhHRkhLSlBjYjNFL2pIVThTbnNzYjBYU3Vl?=
 =?utf-8?B?dnFpU1dkMVVBVnJQL3FuWGRuemhDRFNXZCtBdmtkWnNLWjMxWUZQbG5hak9H?=
 =?utf-8?B?LzlHTjJsNG0vNk9MclB1aUYwcXUyL1U2bnlhOUFtc1dRR0ZDYytZNStaS1ZI?=
 =?utf-8?B?ZmhVSTlhT3ZUM3RxUkpGMGprWVNWSHEyTE5qMFR6NmMrVThrVk5FUkliTVIv?=
 =?utf-8?B?bWlvQkxqb2c1Z08vczJHN3BzR1JnRWtFVFY0dUI5TGVTSEdWd3hqREVqdG0x?=
 =?utf-8?B?dzlTN2dCWU1BUlMzQTZWR2Z4dE9nSWdwZC9LNUdaS3B5RWxaaERERDJhNXUz?=
 =?utf-8?B?RTBGbHNmTU81bXBtbVgwdkEyRG4wNUxUdVhveUZmZ2JBVTl6SUFyVVpHSk52?=
 =?utf-8?B?YVRUSEJ1RVdzOThoMVkzcWx6SitVMHVKS1FzNDhjbklSbHMwYklrLzZVQXRl?=
 =?utf-8?B?YWI0c2gxMFV2bEJQekdFUWY3ZHpEdkRlVWtsa3VoU0RYeG1CcCt1SThWb2Vs?=
 =?utf-8?B?bFV6cEgrUkVrZW9jUUFtc24xamRYYm9ndVJDZFVzK005Si9keE1YYVRGOFJB?=
 =?utf-8?B?RHJlTmNUbHdza3Y5UE5iUXgxRE16N3lmR1A5RERFZEc0eXdBMWthN2FyNEJZ?=
 =?utf-8?B?aGdmTFpySlA2bStTQmdxVVpCRHRScmhNVHdQVTFkNnlIc1ptOHZ4Z0RMQUFP?=
 =?utf-8?B?V0N1YytuWmlhem5uUlVBeTdRbzhrME5QUTNwNmwxSThSYUdCRXVVaG5KSDBN?=
 =?utf-8?B?bnNacXd2M0xvSXVOV2Q3U0dKay9HbkhCb1JRYlpsZ3RIYkc3UDhmMDRQUDdy?=
 =?utf-8?B?aVBOZjFEVWlTTmZvd2U3SFR0bkcyMjl0aVRoNnVDZGs4L1lhNS8xd21VOWph?=
 =?utf-8?B?R1Zyd0FnOUNudlJremJLdDV5N3hUYzR0bTA4aE10N2VXdmtHK0tYMDF0TUx2?=
 =?utf-8?B?WlA3QW4rZEUxMEhZTmYwV1U4RWRHaVZvdkw0bGNKS0dZVFR1YnZVTndKTFhV?=
 =?utf-8?B?R1ZDUnY0bXZQdlZncnZ5dGxBZGhUZ3lzZmVySWhuNmVkZTFRK1dzL1daZXJk?=
 =?utf-8?B?WWJDM2FiNW1lU2FEMVpVazF3WExSYzM0ZUZpVldkbDB4S1M4R0xMOTVjNGh4?=
 =?utf-8?B?OFJJVWpkdEx1K1FjK0FTamhJY082dHI3cVZRa3ZKRmNvblI5eGZJamFkVVVo?=
 =?utf-8?B?S0Z1bnFjbzdEQXJHaWJlTXBzSEg0U0tkOFE5TkJOMHNObUlGQ0RRRGFuYVo3?=
 =?utf-8?B?NElHK1VwNFFERVFUSFRFV1JiRllaelZZaVFDS2l4ZzlRa2NSNXRJR09hcWxt?=
 =?utf-8?B?ZDlOUW43NVFHUWp3UFBBMnp0QzA3QzZRbysxVzd5MzNvYzgwb292akFqc3Zm?=
 =?utf-8?B?amJFQnV6dGRSTGhxTkdRalo3Smw5R0RTMU5LZUszb2grOW01TnB3VTQ1Zjhq?=
 =?utf-8?B?bzJFM3JENlN4YlZVNTdHU0JYenhVTkpMVmgxWkNjNUNxSDhSeDl0em1zUWVE?=
 =?utf-8?B?eWc4M0pubWV5VFN2Y2puSUFOVFIzVnEyeENTMVpkMndFUDZONlhabW5DTUti?=
 =?utf-8?Q?lMIg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F3D38CCEAAC794AACB0AB7E05F82668@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714c91df-c254-4fbd-3cdb-08dc11b91cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 08:49:53.2276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o32zMU9YzKVUNOT+BDQznVFnU+g9BV7Vo+rei5FXMrOGQ+2g6PGBIUexAxzba+xWX8ObxCcjkv0OTMcSGeN/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652

VGhhbmsgSmFuIGFuZCBSb2dlciwgSSBtYXkga25vdyBob3cgdG8gYWRkIGEgbmV3IGh5cGVyY2Fs
bCBYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uLCBJIHdpbGwgaW1wbGVtZW50IGl0IGluIG5leHQg
dmVyc2lvbi4NCg0KT24gMjAyNC8xLzkgMTg6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
OS4wMS4yMDI0IDExOjE2LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzEvOSAxNzoz
OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDkuMDEuMjAyNCAwOToxOCwgQ2hlbiwgSmlx
aWFuIHdyb3RlOg0KPj4+PiBBIG5ldyBoeXBlcmNhbGwgdXNpbmcgZm9yIGdyYW50aW5nIGdzaT8g
SWYgc28sIGhvdyBkb2VzIHRoZSBjYWxsZXIga25vdyB0byBjYWxsIHdoaWNoIGh5cGVyY2FsbCB0
byBncmFudCBwZXJtaXNzaW9uLCBYRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uIG9yIHRoYXQgbmV3
IGh5cGVyY2FsbD8NCj4+Pg0KPj4+IEVpdGhlciB3ZSBhZGQgYSBmZWF0dXJlIGluZGljYXRvciwg
b3IgdGhlIGNhbGxlciBzaW1wbHkgdHJpZXMgdGhlDQo+Pj4gbmV3IEdTSSBpbnRlcmZhY2UgZmly
c3QuDQo+PiBJIGFtIHN0aWxsIG5vdCBzdXJlIGhvdyB0byB1c2UgYW5kIGltcGxlbWVudCBpdC4N
Cj4+IFRha2luZyBwY2lfYWRkX2RtX2RvbmUgYXMgYW4gZXhhbXBsZSwgZm9yIG5vdyBpdHMgaW1w
bGVtZW50YXRpb24gaXM6DQo+PiBwY2lfYWRkX2RtX2RvbmUNCj4+IAl4Y19waHlzZGV2X21hcF9w
aXJxDQo+PiAJeGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKCwscGlycSwpDQo+PiAJCVhFTl9ET01D
VExfaXJxX3Blcm1pc3Npb24NCj4+DQo+PiBBbmQgYXNzdW1lIHRoZSBuZXcgaHlwZXJjYWxsIGlz
IFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24sIGRvIHlvdSBtZWFuOg0KPj4gcGNpX2FkZF9kbV9k
b25lDQo+PiAJeGNfcGh5c2Rldl9tYXBfcGlycQ0KPj4gCXJldCA9IHhjX2RvbWFpbl9nc2lfcGVy
bWlzc2lvbigsLGdzaSwpDQo+PiAJCVhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24NCj4+IAlpZiAo
IHJldCAhPSAwICkNCj4+IAkJeGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKCwscGlycSwpDQo+PiAJ
CQlYRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uDQo+IA0KPiBObywgZmFsbGluZyBiYWNrIHNob3Vs
ZG4ndCBiZSAiYmxpbmQiLiBGYWxsYmFjayBzaG91bGQgb25seSBoYXBwZW4NCj4gd2hlbiB0aGUg
bmV3IHN1Yi1vcCBpc24ndCBpbXBsZW1lbnRlZCAoaGVuY2Ugd2h5IGEgZmVhdHVyZSBpbmRpY2F0
b3INCj4gbWF5IGJlIG5lY2Vzc2FyeSksIGFuZCBvbmx5IGlmIGNhbGxpbmcgdGhlIGV4aXN0aW5n
IHN1Yi1vcCBwcm9taXNlcw0KPiB0byBiZSB1c2VmdWwgKHdoaWNoIGlpcmMgd291bGQgbGltaXQg
dGhhdCB0byB0aGUgUFYgRG9tMCBjYXNlKS4NCj4gDQo+PiBCdXQgaWYgc28sIEkgaGF2ZSBhIHF1
ZXN0aW9uIHRoYXQgaW4gWEVOX0RPTUNUTF9nc2lfcGVybWlzc2lvbiwgd2hlbiB0byBmYWlsIGFu
ZCB3aGVuIHRvIHN1Y2Nlc3M/DQo+IA0KPiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGUgcXVlc3Rpb24uIEJlaGF2aW9yIHRoZXJlIGlzbid0IHRvDQo+IGJlIGZ1bmRhbWVudGFsbHkg
ZGlmZmVyZW50IGZyb20gdGhhdCBmb3IgWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbi4NCj4gSXQn
cyBqdXN0IHRoYXQgdGhlIGluY29taW5nIHZhbHVlIGlzIGluIGFub3RoZXIgdmFsdWUgc3BhY2Uu
DQo+IA0KPj4gT3IgZG8geW91IG1lYW46DQo+PiBwY2lfYWRkX2RtX2RvbmUNCj4+IAl4Y19waHlz
ZGV2X21hcF9waXJxDQo+PiAJcmV0ID0geGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKCwscGlycSwp
DQo+PiAJCVhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24NCj4+IAlpZiAoIHJldCAhPSAwICkNCj4+
IAkJeGNfZG9tYWluX2dzaV9wZXJtaXNzaW9uKCwsZ3NpLCkNCj4+IAkJCVhFTl9ET01DVExfZ3Np
X3Blcm1pc3Npb24NCj4gDQo+IE5vLCB0aGlzIGxvb2tzIHRoZSB3cm9uZyB3YXkgcm91bmQuDQo+
IA0KPj4gQW5kIGluIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24sIGFzIGxvbmcgYXMgdGhlIGN1
cnJlbnQgZG9tYWluIGhhcyB0aGUgYWNjZXNzIG9mIGdzaSwgdGhlbiBncmFudGluZyBnc2kgdG8g
Y2FsbGVyIHNob3VsZCBiZSBzdWNjZXNzZnVsLiBSaWdodD8NCj4gDQo+IEkgdGhpbmsgc287IHNl
ZSBhYm92ZS4NCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

