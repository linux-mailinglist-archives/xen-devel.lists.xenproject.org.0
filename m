Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D2866AA5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 08:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685267.1065715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVOX-0006K3-UY; Mon, 26 Feb 2024 07:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685267.1065715; Mon, 26 Feb 2024 07:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVOX-0006HG-RM; Mon, 26 Feb 2024 07:27:25 +0000
Received: by outflank-mailman (input) for mailman id 685267;
 Mon, 26 Feb 2024 07:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dckQ=KD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1reVOV-0006FH-Po
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 07:27:23 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ab1d8e2-d478-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 08:27:21 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 07:27:17 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa%5]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 07:27:17 +0000
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
X-Inumbo-ID: 7ab1d8e2-d478-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRCl4H2JMgM3UwNg41p55Hqnss5614X0HizPQQT8b5bb1eYsOfG2AbeZLpOS9zmF/Q2oYYsX+jY6gmNrNhaKQBNSg1CItLm0swSNGqqyp1X2Ai9KEUHKMX1NmbSQQL0F2ZFjG4EgLbuIsM2DDsl+cEyRRAhlzqSgoQ7MWud47SYZsG/fkc9f8hf47lyQIFFVmi0Llo0bWI1JxyK86QufbqYt28B5ziL+UXw+ZaAlkRBNZHOUrQv1fGNQcnMEx/cb/zTdV82x7GrQ7ofFDyonwRAcohr+C4hIaUJrxFy03Px6B97A34+vBz1Cdp9lhs9Cn88bqM0Z/3e+R7fG9xLbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu0pfrPxmlGqZrRP6Gxt1NJJQ0n8AY6GEFqapd9lgrI=;
 b=SO0pTEle0s+8H9AbeeM/cvjdT+AC+3bS4iUCfoIZ7CsW4hX3MBFMoselNrvUxJBsblVSvvc7YJGJYJXn0Jx2l6MUKeui2IXg1Tmw+dZ1D064laKoYkG3luuaD90ReGMBKRTSWCJ6tE2izbOf4UuIyTwBRre4Fg5WltElvnz3LK94H3H81wy++EdWa8MSSfinH+RMbUJ2pDmBduMcBdenEfrA3aIUx6hMEvM/Bdywovv/zQm7uOAjTmIw21J56iZOij+8nLpgcr1nkvd/fa80RIUDtovO9EtuaRjSzq/Z0aHQ9wCRQCUr8PYdvZcwikAYnAVfMR91JHgQtLs6qfQJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu0pfrPxmlGqZrRP6Gxt1NJJQ0n8AY6GEFqapd9lgrI=;
 b=z17km6Ig3Pjg1NfeKXHvOqgW65edd2+zTg2NBHYNaGO3zcNrBg+3z8v/BPvdyZaEuTh9thr810Om3nrz4yuXqKr3c95Uhf3JA503H+MN8/+iSPVCXe8zkwN187VK+P8hcdaKMLwgLRVdnmUa5NNaxX10ix0AOMnoVJwqrAvpfPQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony.perard@cloud.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v5 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v5 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHaRR65Xby346gk7ESzHNZtxrKssbEVI+YAgAGO+4CAAaWUAIAEltsA
Date: Mon, 26 Feb 2024 07:27:17 +0000
Message-ID:
 <BL1PR12MB584962AE7E0EBA1256C2047DE75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-6-Jiqian.Chen@amd.com>
 <09290ba4-6915-4f0d-8e16-3e14713d02ba@perard>
 <BL1PR12MB5849F3787ED9245E6986872CE7562@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d0adfc76-5142-46b1-acaa-3a4f0331cfb0@perard>
In-Reply-To: <d0adfc76-5142-46b1-acaa-3a4f0331cfb0@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN0PR12MB6150.namprd12.prod.outlook.com
 (15.20.7292.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7355:EE_
x-ms-office365-filtering-correlation-id: 1a69e0f6-565c-4a4f-40ff-08dc369c5cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vdJz6DcJ1X2LlXVS+7Grmo7ORf0f7O07kf9JR6XGf9AswqNQ7P/eWHdPn/18EBj3Ps4PRnm0c26FJWepw9Mq6MN8aLBrvjA7WD4H5JvUlvbwXMw72O9z4ks81sZpe32hDLX469Gy5LdRZQtUDMTRc+ow0ins3dk9qYVqPjoh0PI4yLhfbDIFNyzGARwMMVtfdjEP2t5MM8L2WETWgdZB9MAyiRH7oFChKUV8hlwyzWBrhDivXH1P8awvJp1dx559QXTeKyMWN0RjLojVmkrQmY/jnJmYci2NmVVqtQWJ2UZMUfvu6AWVnNSguonPQ3drkmgz4p31pDb8d15Bsea1iH5ZMmKYdsBHCONPZA8ZVGwGmRrK68zcJYslWbeiASNlm/0BPkRsvcOEE7DcOILgjLeecfkPCaTQmeKhku77oJd9WGpC+rvAtILUB1dCIbELawIklmnxUJAdnx+3IaCRca28DTyJzowERfRA04A5W27iQmYZ4Zp3J5hS587lXMyc0XHQ92WHg7Zb/FOWNh3i2v6eqWQv3jRLT20S8ldcrFw2cXqXex8Q8/sYo49sh0dOFDvop+ZUbR5Pzqoz4wWTHZ42ftgste9kerhz7HjGi6Ht3fjm0cvDRjfLxKMXeLS1HvjOeM5XY78ggRNwEQ6MPr9A2qX4RNAYq5fuKP5Y7egGNqXR3NMR2dHMT61g07fL4E++PvmfErtMT9oPkAebpnkzrRJJWvnWH00ZbtGxPY8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHBrUWN0bFB3NExJM1QzdUo0N0NuYnF4NnBUTzd5d2MyQTJBL0JrNi8yUnBU?=
 =?utf-8?B?ZzQwSEhqdmNGQWV0MktweXZtcWtwRXBHUCtvNVFRUFUrVklMYkduRW9teUVB?=
 =?utf-8?B?UmNaeWxPdENqV05oNk9DREZGSmZuSDdiZGhQdUlad21xaUhOU2VCUmRoYzhW?=
 =?utf-8?B?aGF2UE5Ibkg3Q25wVERISTVVUFR1TXFOS2JBUXlrTkJrTEVSRjZsYkhQSTMr?=
 =?utf-8?B?QlMrdlJtZjRnMHpnWFJuZ053K2IrRTF3aExaRk91OFRkNzNIcStPeUpsaXhy?=
 =?utf-8?B?dHhPSHZGZ2NXYi91NEVhVUpEdXNwMGdTdVZsTWVscm1XUzA0UUdGRjNyZkNK?=
 =?utf-8?B?NWlHQWt1SDh4cDlLeC9pZDJVR0ZZZ2wrY3RxdlZaTXRTb2RTc1VBeXRnNG4v?=
 =?utf-8?B?b0xsRE4zQTFkbzVHbktNbFN0WjNZMVZtVmlydjV1Wi91bm5HZWlOK0UvU1pC?=
 =?utf-8?B?S2FRbmhXSTY5WjBSUHRjSUFHS2pNc1p4SHRDRXc0OTZRWkRvSjhZa3V2SU9M?=
 =?utf-8?B?TGhNVnRkcU9QdlJOTkVhaUVHYWQ2M1FJTFJESEtNQzFpbGxnUDFPMHc4eGdS?=
 =?utf-8?B?ZUNxMy9lVlRmNGo5bWozUzZIU2hTak1NdXJzTldnTS93QVJFeGZ5SXZySXVH?=
 =?utf-8?B?cjJMbnhpZldVa2djU3l2T0RxOWlvYTBxb0tOdnRINlZSMmVOL2NBU1dGaS9t?=
 =?utf-8?B?UnFBSXFhR3FTS1p5WGV1eTFIbzM1K0NrSFZENVpvenI4UXVkdjljOGN3Yk1p?=
 =?utf-8?B?ZG9WMFlvbzg1OGJDWkV3MlJRV09pNlRML0NKc1hrcmFoZ3VvR1NIN1Z1OFpO?=
 =?utf-8?B?d2VUSjE3L2RFbXk4aVI2OXZrWGFtREd0ekl5NGpaWlJ3bWVzdk5OWlZhNWRq?=
 =?utf-8?B?dVFwKzB6RTlmNHZlMHZqTkxtdGtRbjF1NG9Bcmt4TTIveGVEOFcvMFF3NkRQ?=
 =?utf-8?B?KzlmQlZVYlM4SzFjalJpRjFvYkg2MjNLWGlhd2IwWk5KNnVGMGNlRm0renNY?=
 =?utf-8?B?STRNbVJhWXZPdXNoUStCMHFRamtTSFQzVmxvUDlRSWNvWGZ3ckRTSmpucGVU?=
 =?utf-8?B?ZFdkVGJWdFdOYzVxeWNwMzFJd0owZDhIZkRVbXFFUjF0OVFzNHBJdjlIM2xv?=
 =?utf-8?B?enc5NmxOTTBGRk9ZVlhxMjVlWFF5eFZoWU50ZE1FcUtra2xEOG00UWxHU3Rr?=
 =?utf-8?B?SFlUekJtcFVsb0FPYXcyWVdERnllYWMzc2lKTGx0cmZEVHJLRE1uOU5kUnRF?=
 =?utf-8?B?bFJqRWphTHJiaFJtSkQ2TEFMUTd1R2JKb25YejZCUEFMTnpRNThQRUU1b1hS?=
 =?utf-8?B?SjlqUTdzMWtvUUZlSlJGeVMzZTBiV3R0bWsvZ1NOTWlleElZU0x6Tjd6Sk9k?=
 =?utf-8?B?Ylk5blZSNW54SG9vKzlCOXJRaE5zYkxoN2tscmhuVjhqYXpnN0JuUG1WZGFs?=
 =?utf-8?B?TXJBYTJFQ2JwZG5yTit3UkQ1L0NlcllzZGV6aENPYk9hZkVwd0RoVFNQVnMw?=
 =?utf-8?B?Wk5PWWRWUEVRRU9MRFRkUnR5UEMzbGdIT0RaZFFjWGNRdXlFcngzSnJFano2?=
 =?utf-8?B?bGpLVy90TW8zaWtwZGxMVngrT0NZdFhXRHB3VDFvaHRzUloyYi9mRnVJeUo1?=
 =?utf-8?B?c0ZxRENFczAzWFMwTnM3Sm5LOGVuVlpYTjJvb0JVdEZjUE1QWndFWXh0d1Vm?=
 =?utf-8?B?cnBzZXpGbmkxMWU2VFhXY0xBMWJ2N2JhUlI3ZSthQU1DcjRTdlpzYVVpdSti?=
 =?utf-8?B?NkRWd0dpQTZZaWVkSURsMnIwcTFwb1Z5VlRuU0huM0xzUmEzbytXdGVXOURF?=
 =?utf-8?B?Y0IxMGpnNVdSekVsaTNIMzdwUmhGWHJmME1zTEI5d3pIV3c4UjgwOU0rTFhJ?=
 =?utf-8?B?SkIyVmM5OHdpMkx6OUVhSlBOQXVtYWlMc1kycElLdERkR1FFb0t4bzByWTlD?=
 =?utf-8?B?blBEMFFOWmM5OC9pa3BxRXBuOHFxZ1owckNzL3ZSd3k4QThFWmhmYnlNUnBv?=
 =?utf-8?B?YlVQakh3QWVnS1cwcThKQWdub3Z4SkIyRlM4dy9NOWNEbU9wbVhEeDJYdVgw?=
 =?utf-8?B?NHdCQjYvOUdFRFNwczNYWk9OV2pvQ1lNZ3Rsdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94326F390B9226478EF2516E73C81428@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a69e0f6-565c-4a4f-40ff-08dc369c5cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 07:27:17.7963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YXQAgn8cnEizGu74fr7lsJopjLJSwwVAbHqyCZ2n985WsAP+N63WxGpPVqjcfGXGF+yB3fXiRobngbRPmgxNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355

T24gMjAyNC8yLzIzIDIzOjU5LCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gT24gVGh1LCBGZWIg
MjIsIDIwMjQgYXQgMDc6MjI6NDVBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24g
MjAyNC8yLzIxIDIzOjAzLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4+PiBPbiBGcmksIEphbiAx
MiwgMjAyNCBhdCAwMjoxMzoxN1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgYi90b29scy9saWJzL2xpZ2h0
L2xpYnhsX3BjaS5jDQo+Pj4+IGluZGV4IGExYzZlODI2MzFlOS4uNDEzNmE4NjBhMDQ4IDEwMDY0
NA0KPj4+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+Pj4+ICsrKyBiL3Rv
b2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+Pj4gQEAgLTE0MjEsNiArMTQyMSw4IEBAIHN0
YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+Pj4+ICAgICAgdWlu
dDMyX3QgZmxhZyA9IFhFTl9ET01DVExfREVWX1JETV9SRUxBWEVEOw0KPj4+PiAgICAgIHVpbnQz
Ml90IGRvbWFpbmlkID0gZG9taWQ7DQo+Pj4+ICAgICAgYm9vbCBpc3N0dWJkb20gPSBsaWJ4bF9p
c19zdHViZG9tKGN0eCwgZG9taWQsICZkb21haW5pZCk7DQo+Pj4+ICsgICAgaW50IGdzaTsNCj4+
Pj4gKyAgICBib29sIGhhc19nc2kgPSB0cnVlOw0KPj4+DQo+Pj4gV2h5IGlzIHRoaXMgZnVuY3Rp
b24gaGFzICJnc2kiIHZhcmlhYmxlLCBhbmQgImdzaSA9IGlycSIgYnV0IHRoZSBuZXh0DQo+Pj4g
ZnVuY3Rpb24gcGNpX3JlbW92ZV9kZXRhY2hlZCgpIGRvZXMgb25seSBoYXZlICJpcnEiIHZhcmlh
YmxlPw0KPj4gQmVjYXVzZSBpbiBwY2lfYWRkX2RtX2RvbmUsIGl0IGNhbGxzICIgciA9IHhjX3Bo
eXNkZXZfbWFwX3BpcnEoY3R4LT54Y2gsIGRvbWlkLCBpcnEsICZpcnEpOyAiLCBpdCBwYXNzZXMg
dGhlIHBvaW50ZXIgb2YgaXJxIGluLCBhbmQgdGhlbiBpcnEgd2lsbCBiZSBjaGFuZ2VkLCBzbyBJ
IG5lZWQgdG8gdXNlIGdzaSB0byBzYXZlIHRoZSBvcmlnaW4gdmFsdWUuDQo+IA0KPiBJJ20gc29y
cnkgYnV0IHVuY29uZGl0aW9uYWwgImdzaSA9IGlycSIgbG9va3MgdmVyeSB3cm9uZywgdGhhdCBs
aW5lDQpNYWtlIHNlbnNlLCBJIHNob3VsZCBhZGQgYSBjb25kaXRpb24gYW5kIHNvbWUgY29tbWVu
dHMgaGVyZS4gTWF5YmU6DQoJLyogaWYgaGFzIGdzaSBzeXNmcyBub2RlLCB0aGVuIGZzY2FuZigp
IHJlYWQgZnJvbSB0aGUgZ3NpIHN5c2ZzIGFuZCBzdG9yZSBpdCBpbiBpcnEgdmFyaWFibGUsIHdl
IG5lZWQgdG8gc2F2ZSB0aGUgb3JpZ2luYWwgZ3NpIHZhbHVlLCBiZWNhdXNlIGlycSB3aWxsIGJl
IGNoYW5nZWQgaW4geGNfcGh5c2Rldl9tYXBfcGlycSAqLw0KCWlmIChoYXNfZ3NpKQ0KCQlnc2kg
PSBpcnE7DQoNCj4gbmVlZHMgdG8gYmUgcmVtb3ZlZCBvciBjaGFuZ2VkLCBvdGhlcndpc2Ugd2Ug
aGF2ZSB0d28gZnVuY3Rpb25zIGRvaW5nIHRoZQ0KPiBzYW1lIHRoaW5nIGp1c3QgYWZ0ZXIgdGhh
dCAoeGNfZG9tYWluX2lycV9wZXJtaXNzaW9uIGFuZA0KPiB4Y19kb21haW5fZ3NpX3Blcm1pc3Np
b24pLiBJbnN0ZWFkLCBteSBndWVzcyBpcyB0aGF0IHRoZQ0KPiBhcmd1bWVudHMgb2YgeGNfcGh5
c2Rldl9tYXBfcGlycSgpIG5lZWRzIHRvIGJlIGNoYW5nZXMuIFdoYXQgZG9lcw0KPiBjb250YWlu
IGBpcnFgIGFmdGVyIHRoZSBtYXBfcGlycSgpIGNhbGw/IEEgInBpcnEiIG9mIHNvbWUga2luZD8g
TWF5YmUNClllcywgcGlycS4NCg0KPiB4Y19waHlzZGV2X21hcF9waXJxKGN0eC0+eGNoLCBkb21p
ZCwgaXJxLCAmcGlycSkgd291bGQgbWFrZSB0aGluZ3MgbW9yZQ0KPiBjbGVhciBhYm91dCB3aGF0
J3MgZ29pbmcgb24uDQo+IA0KPiANCj4gQW5kIEJUVywgbWF5YmUgcmVuYW1pbmcgdGhlIHZhcmlh
YmxlICJoYXNfZ3NpIiB0byAiaXNfZ3NpIiBtaWdodCBtYWtlDQo+IHRoaW5ncyBhIGJpdCBjbGVh
cmVyIGFzIHdlbGwsIGFzIGluOiAidGhlIHZhcmlhYmxlICdpcnEnICRpc19nc2kiLA0KPiBpbnN0
ZWFkIG9mIGEgdmFyaWFibGUgdGhhdCBoYXZlIGEgbWVhbmluZyBvZiAidGhlIHN5c3RlbSAkaGFz
X2dzaSINCj4gd2l0aG91dCBuZWNlc3NhcmlseSBtZWFuaW5nIHRoYXQgdGhlIGNvZGUgaXMgdXNp
bmcgaXQuDQpHc2kgaXMgYSBuZXcgc3lzZnMgbm9kZSBhZGRlZCBieSBteSBrZXJuZWwgcGF0Y2gs
IGFuZCBpdCBpcyBzdGlsbCBpbiBkaXNjdXNzaW9uIHdpdGggUENJIE1haW50YWluZXIuDQpBbmQg
Zm9yIGNvbXBhdGlibGUgd2l0aCBvbGQgdmVyc2lvbiBvZiBrZXJuZWwgdGhhdCBkaWRuJ3QgaGFz
IGdzaSBzeXNmcyBub2RlLCB3ZSBzdGlsbCBuZWVkIHRvIHVzZSBpcnEgaGVyZS4NClNvLCBJIG5h
bWVkIHRoaXMgdmFyaWFibGUgdG8gaGFzX2dzaS4gSXMgaXQgY2xlYXJlciB0aGF0IGNoYW5naW5n
IGl0IHRvIGhhc19nc2lfc3lzZnNfbm9kZT8NCk1heWJlIEkgbmVlZCB0byBhZGQgc29tZSBjb21t
ZW50cyBpbiBjb2RlIHRvIG1ha2UgdGhlIHVzYWdlIG9mIGdzaSBjbGVhci4NCg0KPiANCj4gTWF5
YmUgdXNpbmcgKGFidXNpbmc/KSB0aGUgdmFyaWFibGUgbmFtZSAiaXJxIiBtaWdodCBiZSBhIGJp
dCB3cm9uZyBub3c/DQo+IFdoYXQgZG9lcyAiR1NJIiBzdGFuZCBmb3IgYW55d2F5PyBBbmQgYWJv
dXQgIlBJUlEiPyBUaGlzIGlzIGp1c3Qgc29tZQ0KR1NJIGlzIHg4NiBzcGVjaWZpYyBjb25jZXB0
LCBpdCBpcyByZWxhdGVkIHRvIElPQVBJQy1QSU4uIFBJUlEgaXMgdXNlZCB0byByb3V0ZSBpbnRl
cnJ1cHRzIGluIFhlbi4NCg0KPiBxdWVzdGlvbiB0byBmaWd1cmUgb3V0IGlmIHRoZXJlJ3MgcG90
ZW50aWFsbHkgYSBiZXR0ZXIgbmFtZSBmb3IgdGhlDQo+IHZhcmlhYmxlcyBuYW1lcy4NCj4gDQo+
IFRoYW5rcywNCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

