Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59FE1FEADE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 07:24:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jln0Q-0003lk-8n; Thu, 18 Jun 2020 05:22:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60jh=77=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jln0P-0003lf-6z
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 05:22:29 +0000
X-Inumbo-ID: b2fa2aee-b123-11ea-ba44-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2fa2aee-b123-11ea-ba44-12813bfff9fa;
 Thu, 18 Jun 2020 05:22:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6GKIBdIMKE+gy/+a69ifUTRvYaWIQRJRoGyAQ+6wZ/+Ou5jz3T8wTqZeGFu5BA/1X8L+NWQOLIfH5de+R8LjZFWTkl3bT92OkDS2w0SYmxq79BK4SQuqIq8wnI+cJXlqyeRO32HWkw4VRKGxlf0yGCPm95DkAZv+SitBOGQOb4WU6V5qaFZn3HnJQUOiLcJtgJewrX7KhQ6dsF4FF0qODicJATH2YX92RbHvy8o29lwDdW1ty2xWb/FKoEDyVFQx3Rg8v2S5wp0DG9IEnpwuRYaHc+eT7sZMdtbM6m6RA/eZfhRePOhmu8iLYXzidaCp9yJ3kgulqk5hyZvH5yckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxIO4zK4kC1Av4SYmK9kcqwiogrTrZz4OIr8UIlNOQk=;
 b=Ml+wlTxpq6RoLxA3bLGvYKbPG7QucY4O7nHVPHE6Kog+7VtGJ8S9U9RoWzktwKDNUOgxAIDsYwiegzeu2uDGwtGjYqY6Aj8qV/BGk3OuGGDSsQFI45MkCB2qYeTeg9SlyjH7qeH2hayW9tQMsPj8C01Q09rxVVN3x/He4Mfx2O3FYqtQKYskFl8e6wsxQsBRJFx2qSa9Zybh2ZW/GZ7ZwawMsgsctBhMs9YFy8Vw/WGlNPPD6lJspgUpvQw67Wz8EjzdGwETARRepQdTAVcxKskQwRgdExK9Aj2o6Uo/2/dMTOuYuGx6WpyF0zxVKJYziQGoRQUN56kNLoIVJExC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxIO4zK4kC1Av4SYmK9kcqwiogrTrZz4OIr8UIlNOQk=;
 b=dfC35ijRLgo7mPM7XtMTBW8wndugY+fHXPbvpJg6QDMdjrczCWGrJMHHIzugaGvaWcLkRVvsdZme/ge7yZBfeQDaDMneEYVqg/LwhIpRQnGT2IWavxH0+7SH4NM3yCerRdEXhgGCklIqoubQHrvFeXLB5AtxkxLELsW5/XmZnHCRlZV3XS4lqS5aPWP6HO1QExE7LedWMqJMFyRBWTkigJvztOK8dtsh0FmuZCrcGrilgBl8q/LSM8AazXOupJ7lbi15wHtXUz5WP86dND4wWNfNUWXOAGeA2tckLxvAfgVli5MvJCwkXAsRt9PtCsoeeX5jfyry8yfkQC7xHaPQ9Q==
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB4606.eurprd03.prod.outlook.com (2603:10a6:803:55::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 18 Jun
 2020 05:22:25 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 05:22:25 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwA=
Date: Thu, 18 Jun 2020 05:22:24 +0000
Message-ID: <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5eafb01-79f9-4ac7-9ea0-08d8134795e6
x-ms-traffictypediagnostic: VI1PR03MB4606:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB460689788987008B75A51644E79B0@VI1PR03MB4606.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iX2dbkeUGBdKFNalIX0gxvDNRtp3+3YZTfpcClfG50BESJFGLucfcoY3OdmruNh2S5/whvE9swFjSpCxAVf5IRVaXWEV7YLV0MGsmKQ2jk9caOHvj6GgCNfA0JPYwQqP+C20Ai92XrXQ5VvVDg2YAcwqPkWU78sqIhxEEVaEYMcd8sPL7rWuodDB/+A4if/Dp7UpM194ucCzFQRHa+1uXFvSVf/rR9Ny16u/MJlszyHpVkz6MjUFimEFjs3ib5WdBFGSaUeVIdc+eMw27c7uye4BdOTFhjSNs3g7THT2B3o8ElwALEsoxgVLw3UguNaMfLJJpCYViiysELm8mq0K/sFSr9f3TTlVj1FwqJavmZkqnFG60n6Npq9N9uz2ORYz0ctles5/4AcbTIp6uZx4mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(4326008)(2906002)(6512007)(186003)(26005)(6486002)(8676002)(316002)(66446008)(8936002)(53546011)(478600001)(71200400001)(91956017)(76116006)(966005)(86362001)(83380400001)(5660300002)(66946007)(31696002)(2616005)(64756008)(36756003)(6506007)(54906003)(31686004)(66556008)(6916009)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: rUC020mOphN3vu/kPhHVGqZmAnQOjdMtst48DdMi2iuQ1eETVoJXti9tl4CAFb1JBwZPnbPoOoAIuZljhZL00rhOiePftXr3yhM4CkbLE6U9ivqlZdgywEcUgZgPp0LhQ/dqkOj0SmpAbcrDwRX/+O+Dgd3S0RGbSm8eIsEsHo2OqZmIKkgkCGzdmUbuEFaP9IQh0Qw8mbQT8TjG/LAmbulHpkImpUtFUA2fMgz9ptyO6wpZtF8yNBz+AJo7H0JPXwYPE0c2NFY4o94Y1AfhXEjZLtD8XrY3qa/5uOCwW26cP69IbIO0DwBoAEnYWC/xHQr1rJCti7E7+fQs8AVwzKTJ6IUVAFnM2FmFCFW7roCkFSEzOmOOQjmJ0JReRsxWRtUXXBX1zoVcxARUxZ3YCaO7yjBXVxlsJd26jYE38kU+rsWrUJOgkRZSiTuWZvJKclDDGrCu3V83WvRhTXgbQYwgUXd00KKwXgkvzVfzn5s=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2899978B83A0974AA26DA274FF0B221F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5eafb01-79f9-4ac7-9ea0-08d8134795e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 05:22:25.0180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2Ix+dS3O1uk2CbYrlpF3df3PM05oDpKxlFzm3GvKdjyzE84jalIread3dMCO3J5iY9IDi7Ga5+j0yVORFAh8PRMr6NmKxFwaJhvHqSctjDXHd0onb0hD9haAFvc0aTS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4606
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Julien Grall <julien@xen.org>, Roman Shaposhnik <roman@zededa.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzQvMjAgNjozMSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUaHUs
IDQgSnVuIDIwMjAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gNi80LzIw
IDQ6NTcgQU0sIFBlbmcgRmFuIHdyb3RlOg0KPj4+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47DQo+
Pj4+IE5hdGFsaXlhIEtvcm92a2luYSA8bWFsdXMuYnJhbmR5d2luZUBnbWFpbC5jb20+DQo+Pj4+
IFN1YmplY3Q6IFVFRkkgc3VwcG9ydCBpbiBBUk0gRG9tVXMNCj4+PiBXZSBoYXZlIG1hZGUgVS1C
b290IHJ1biBpbnNpZGUgWEVOIERvbVUsIGJ1dCBqdXN0IG9ubHkgUFYgY29uc29sZSBwYXJ0LA0K
Pj4+IG5vdCBpbXBsZW1lbnQgb3RoZXIgZnJvbnRlbmQgZHJpdmVycyBjdXJyZW50bHkuIFdvdWxk
IHRoaXMgaGVscCBmb3IgeW91cg0KPj4+IGNhc2UgaWYgZW5hYmxlIEVGSSBpbiBVLUJvb3Q/DQo+
PiBXZWxsLCB3ZSBoYXZlIGEgd29ya2luZyBQViBibG9jayBpbXBsZW1lbnRhdGlvbiBvbiB0b3Ag
b2YgdGhhdCBvbiBpTVg4DQo+Pg0KPj4gcGxhdGZvcm0sIG1vc3RseSBwb3J0ZWQgZnJvbSBtaW5p
LW9zLiBDdXJyZW50bHkgd2UgYXJlIGZpbmFsaXppbmcgdGhlIHdvcmsNCj4+DQo+PiBhbmQgY2xl
YW5pbmcgdXAgKGl0J3MgZ29pbmcgdG8gdGFrZSBhIHdlZWsgb3Igc28gaG9wZWZ1bGx5KS4gVGhl
biwgd2Ugd2UnbGwgcG9zdA0KPj4NCj4+IGl0IG9uIG91ciBwdWJsaWMgZ2l0aHViLiBXZSBhcmUg
YWxzbyB0aGlua2luZyBhYm91dCB1cHN0cmVhbWluZyB0aGUgd29yaywgYnV0IGl0IG1heQ0KPj4N
Cj4+IHRha2UgcXVpdGUgc29tZSB0aW1lIGlmIHRoZSB3aG9sZSBpZGVhIGZpdHMgdS1ib290J3Mg
dmlldyBvbiBzdWNoIGFuIGV4dGVuc2lvbiBhdCBhbGwuDQo+IFllcyBwbGVhc2UgdG8gYm90aCBv
ZiB5b3UhIDotKQ0KPg0KPiBJbiB0aGUgbWVhbnRpbWUsIHdoaWxlIHdlIHdhaXQgZm9yIHRob3Nl
IGNoYW5nZXMgdG8gZ28gdXBzdHJlYW0gaW4NCj4gdWJvb3QsIGNvdWxkIHlvdSBwbGVhc2UgcG9z
dCBhIGJyYW5jaCBvbiBnaXRodWIgYW5kIGEgbGluayBvbiB0aGlzIGVtYWlsDQo+IHRocmVhZD8N
Cg0KSXQgdG9vayBhIGJpdCBtb3JlIHRpbWUgdGhhbiB3ZSBleHBlY3RlZCwgYnV0IGhlcmUgd2Ug
Z28gWzFdOg0KDQp0aGlzIGlzIGluIGZvcm0gb2YgYSBwdWxsLXJlcXVlc3QgYXMgd2Ugd291bGQg
bG92ZSB0byBoZWFyIGZyb20gdGhlDQoNCmNvbW11bml0eSBhbmQgaXQgaXMgZWFzaWVyIHRvIGRp
c2N1c3MgdGhlIGNvZGUgKHBsZWFzZSBsZWF2ZSBjb21tZW50cyB0aGVyZSkNCg0KMS4gVGhlcmUg
aXMgY29kZSBvcmlnaW5hdGluZyBmcm9tIE1pbmlPUyBhbmQgd29yayBkb25lIGJ5IFBlbmcsIHNv
IHdlDQoNCndvdWxkIGxpa2UgdG8gYXNrIHRoZSByZXNwZWN0aXZlIGNvcHlyaWdodCBvd25lcnMg
dG8gcmFpc2UgdGhlaXIgaGFuZHMgYW5kDQoNCmxldCB1cyAqZml4IGluYXBwcm9wcmlhdGUgbGlj
ZW5zaW5nKiBpZiBhbnkuDQoNCjIuIFBsZWFzZSBub3RlLCB0aGUgc2VyaWVzIGhhcyBhIEhBQ0sg
dG8gbW92ZSB0aGUgUkFNIGJhc2UgYXMgaXQgaXMgZXhwZWN0ZWQgYnkNCg0Kb3VyIHRlc3QgcGxh
dGZvcm0gKGlNWDgpLCBzbyBvdGhlcnMgd2lsbCBuZWVkIHRvIHJlbW92ZSBvciBtb2RpZnkgdGhh
dC4NCg0KMy4gVGhlcmUgaXMgYSBsaW1pdGF0aW9uIGFscmVhZHkgbm90ZWQgYnkgUGVuZyB0aGF0
IHdlIGRvIG5vdCBoYXZlIHNlcmlhbCBvdXRwdXQNCg0KdW50aWwgTU1VIGlzIHNldHVwLCBzbyB3
ZSBoYXZlIGludHJvZHVjZWQgeGVuX2Vhcmx5X3ByaW50ayBoZWxwZXIgd2hpY2ggYWx3YXlzDQoN
CndvcmtzLCBzbyB5b3UgY2FuIHVzZSB0aGF0IGZvciBlYXJseSBzdGFnZSBkZWJ1Z2dpbmcuDQoN
CjQuIE1pbmltYWwgbWVtb3J5IHNpemUgc3VwcG9ydGVkIGlzIH4xMjlNIGJlY2F1c2Ugb2YgZHRi
IHBsYWNlbWVudCBieSBYZW4gdG9vbHMNCg0KNS4gV2UgdXNlIC1EX19YRU5fXyB0byBhY2Nlc3Mg
c29tZSBvZiB0aGUgaGlkZGVuIGRlZmluZXMgd2UgbmVlZCBzdWNoIGFzDQoNCkdVRVNUX1JBTTBf
QkFTRSBhbmQgdGhlIGZyaWVuZHMgYXMgdGhlcmUgaXMgbm8gb3RoZXIgd2F5IGJ1dCBtYW51YWxs
eSBkZWZpbmluZyB0aGUNCg0Kc2FtZSB3aGljaCBpcyBub3QgY3V0ZS4NCg0KSGF2ZSBmdW4sDQoN
CkFuYXN0YXNpaWEsIE9sZWtzYW5kcg0KDQo+DQo+IE1heWJlIHdlIHNob3VsZCBoYXZlIGEgd2lr
aXBhZ2Ugb24gd2lraS54ZW5wcm9qZWN0Lm9yZyBhYm91dA0KPiB3b3JrLWluLXByb2dyZXNzIHVi
b290IGl0ZW1zLg0KPg0KPg0KPg0KPg0KPj4+IFJlZ2FyZHMsDQo+Pj4gUGVuZy4NCj4+Pg0KPj4+
PiBIaSENCj4+Pj4NCj4+Pj4gd2l0aCBhIGxvdCBvZiBoZWxwIGZyb20gU3RlZmFubywgd2UncmUg
Z2V0dGluZyBSUGk0IHN1cHBvcnQgaW4gUHJvamVjdCBFVkUNCj4+Pj4gcHJldHR5IG11Y2ggb24g
cGFyIGJldHdlZW4gS1ZNIGFuZCBYZW4uDQo+Pj4+DQo+Pj4+IE9uZSBiaWcgYXJlYSB0aGF0IHN0
aWxsIHJlbWFpbnMgaXMgc3VwcG9ydGluZyBVRUZJIGJvb3Qgc2VxdWVuY2UgZm9yIERvbVVzLg0K
Pj4+PiBXaXRoIEtWTSwgZ2l2ZW4gdGhlIHFlbXUgdmlydCBkZXZpY2UgbW9kZWwgdGhpcyBpcyBh
cyBzaW1wbGUgYXMgdXNpbmcgZWl0aGVyDQo+Pj4+IHN0b2NrIFVFRkkgYnVpbGQgZm9yIGFybSBv
ciBldmVuIFUtQm9vdCBFRkkgZW11bGF0aW9uIGVudmlyb25tZW50IGFuZA0KPj4+PiBwYXNzaW5n
IGl0IHZpYSAtYmlvcyBvcHRpb24uDQo+Pj4+DQo+Pj4+IE9idmlvdXNseSB3aXRoIFhlbiBvbiBB
Uk0gd2UgZG9uJ3QgaGF2ZSB0aGUgZGV2aWNlIG1vZGVsIHNvIG15DQo+Pj4+IHVuZGVyc3RhbmRp
bmcgaXMgdGhhdCB0aGUgZWFzaWVzdCB3YXkgd2UgY2FuIHN1cHBvcnQgaXQgd291bGQgYmUgdG8g
cG9ydA0KPj4+PiBVRUZJJ3MgT3ZtZlBrZy9Pdm1mWGVuIHRhcmdldCB0byBBUk0gKGl0IHNlZW1z
IHRvIGJlIGN1cnJlbnRseSBleGNsdXNpdmVseQ0KPj4+PiBYNjQpLg0KPj4+Pg0KPj4+PiBTbyBo
ZXJlJ3MgbXkgZmlyc3QgcXVlc3Rpb246IGlmIHRoZXJlJ3MgYW55Ym9keSBvbiB0aGlzIGxpc3Qg
d2hvIGhhZCBhIGhhbmQgaW4NCj4+Pj4gaW1wbGVtZW50aW5nIE92bWZQa2cvT3ZtZlhlbiBjYW4g
eW91IHBsZWFzZSBzaGFyZSB5b3VyIHRob3VnaHRzIG9uIGhvdw0KPj4+PiBtdWNoIHdvcmsgdGhh
dCBwb3J0IG1heSBiZSAob3Igd2hldGhlciBpdCBpcyBldmVuIGZlYXNpYmxlIC0tIEkgbWF5IHRv
dGFsbHkgYmUNCj4+Pj4gbWlzc2luZyBzb21ldGhpbmcgcmVhbGx5IG9idmlvdXMgaGVyZSkuDQo+
Pj4+DQo+Pj4+IEFuZCBhcyBsb25nIGFzIEkndmUgZ290IHlvdXIgYXR0ZW50aW9uOiB0d28gbW9y
ZSBxdWVzdGlvbnM6DQo+Pj4+ICAgICAgMS4uIGNvbXBhcmVkIHRvIHRoZSBhYm92ZSwgd291bGQg
cG9ydGluZyBwdmdydWIgdG8gQVJNIGJlIGFueQ0KPj4+PiAgICAgIGVhc2llciBvciBtb3JlIGRp
ZmZpY3VsdD8NCj4+Pj4NCj4+Pj4gICAgICAyLiBzYW1lIHF1ZXN0aW9uIGZvciB0ZWFjaGluZyB1
LWJvb3QgYWJvdXQgUFYgY2FsbHMuDQo+Pj4+DQo+Pj4+IFRoYW5rcywNCj4+Pj4gUm9tYW4uDQo+
Pj4+DQo+Pj4+IFAuUy4gT2ggYW5kIEkgZ3Vlc3MgYmV0d2VlbjoNCj4+Pj4gICAgICAwLiBPdm1m
UGtnL092bWZYZW4gb24gQVJNNjQNCj4+Pj4gICAgICAxLiBwdmdydWIgb24gQVJNNjQNCj4+Pj4g
ICAgICAyLiB1LWJvb3QvRUZJIGVtdWxhdGlvbiB3aXRoIFBWIGNhbGxzIGJhY2tlbmQgSSBkaWRu
J3QgbWlzcyBhbnkgb3RoZXINCj4+Pj4gb2J2aW91cyB3YXkgb2YgbWFraW5nIFVFRkktYXdhcmUg
Vk0gaW1hZ2VzIHRvIGJvb3Qgb24gWGVuIEFSTTY0IERvbVUsDQo+Pj4+IHJpZ2h0Pw0KWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL3UtYm9vdC9wdWxsLzE=

