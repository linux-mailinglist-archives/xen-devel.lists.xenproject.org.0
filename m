Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C120493F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 07:33:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnbXQ-00019V-Ga; Tue, 23 Jun 2020 05:32:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EsoT=AE=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jnbXO-00019Q-O6
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 05:32:02 +0000
X-Inumbo-ID: dcc8365c-b512-11ea-bf0e-12813bfff9fa
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcc8365c-b512-11ea-bf0e-12813bfff9fa;
 Tue, 23 Jun 2020 05:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/zLWZ7IsmFGxawv7bBFp1jRt+cUKe/EojuCv5H8yEGEl4vRPknv7t+ztH3i94bS6r4tUtkG+v0omQRBuLzw2dzQ2lpoUtLdJHiapZGsEkjzeXzf866ZC4YprpLK1My811X+9357OL5lFNiNvKgPy4uy/Ow6ktTQkvq8og1c2lCbT85h3R/hUk6dQ0JyMBRgQZCnF8alFJAOMoqj14VRpLADRS6YuvPQF095lEhgZK4r82bMJ/Hi2a1JhcTrxsLmBJWiLKROkIhKxjfTPpMzIeSV4AVAJYUE62wyLqDMTRmPK+4ja2lK6L3rT7dLOaOyjfLea5+Ll1I25WjA1wZAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vOkOwfSKYJz+QCvsXcJFiDvR8ra5FU5+BzRpP0dZnQ=;
 b=ki7aEw+uAHy5Tvl8ANTL2fMbXuGDSx015vc2U4Qn+LZiB+ifWqsI8CrXIHLPOIBZLjDANK4P52je3jkXuFl+i/3ga/B++nOg5Z2W2hjmQqNvQvAte/qxY+ak6dcoHPc53bF5Ajq8xZtH5auVkoJtci6br9AdWkvnvFoECDwz636rb+DtFDpfOVSaK9v/JTsVMTzPoeZ0NuJqRW/LSlEZlWgSAMQYqa2a8QfNkJcnLjEfQgGIvC76bVnmpjprGU+OfAnKGeRtoxUqBCqFNY83rc0E0AT1lFjW4IlNuiojumrQoTdSDtXr4KnSGpZPRyEjFgD9R8/beX89Gv92BGk0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vOkOwfSKYJz+QCvsXcJFiDvR8ra5FU5+BzRpP0dZnQ=;
 b=yzJNAErUSNMcmskTZOSXFeujlEhhsN1cX5VfF1w0haosctVxhoeA3F0KpDSf9EItyDvP1TakJ0WIUyGEek15lWYBzcLTTdWhqmO7ktikcCWh8AFPdsc7FdvSvE5o99KDRPiwdN+JMpQ1CKGZkeuLRUsDvmAhuevN9LOD3XKNuvwjV2bMXZChFk0wNFrdbL1U6phsD9LbkO/EXAOrpe9fSxmCMOQ3T+XRjY+q9HIcSkhHlhK8ENJ86lhvJyaMOxTHucm55ekosJuD7ABa6QfsMVEkr25XYReOpwqm2uxW74nKEDjtygM7G7GtnUyzERD6qSmU/P4kNSYpqcXBdxezgg==
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com (2603:10a6:20b:25::20)
 by AM6PR03MB4024.eurprd03.prod.outlook.com (2603:10a6:20b:1b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Tue, 23 Jun
 2020 05:31:58 +0000
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c]) by AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c%4]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 05:31:58 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAWPDgIAEUtgAgAAGgYCAAAHAgIAANpaAgAB+IgCAAEYyAA==
Date: Tue, 23 Jun 2020 05:31:58 +0000
Message-ID: <271a4db0-5ce5-ba25-65e7-107c040f5069@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
 <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
 <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [46.133.149.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61fef3a9-d425-4b84-3ab1-08d81736bfb2
x-ms-traffictypediagnostic: AM6PR03MB4024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB4024F2B29A3B6AADF7FA84F2E7940@AM6PR03MB4024.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7XAv0lLnuILoViAbKQN43oNXZ/KyPou4DEEeLuCUmSS6Opore6bZQYtyLiCsKD+19G6PQG7lEuFQE/h+plB54x6IBjDnyzE6ZeoLwrObE36floIDpqEnpEY0/1FTjrRU/X9FnoV6Q+8voO15c5iJQ9CyFJnETpRn/vMaoABDa2LaaYG+8lEjGVpHxyAaPwgDjfND3lpj1FwbpD7sbzeiz3R9uLpZd/I35wodjnx157ay5wuUjXVXRDM34o9gIZAjt73fH2FAASO1eZc3MAKjlOuWEEHctL0NsSdXERloWYHdO7Gz+URrayj78EPLa4MA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3991.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(86362001)(6512007)(7416002)(71200400001)(2906002)(8936002)(83380400001)(478600001)(2616005)(8676002)(5660300002)(6486002)(54906003)(76116006)(66556008)(64756008)(66446008)(66476007)(36756003)(66946007)(91956017)(6506007)(4326008)(53546011)(316002)(110136005)(31696002)(31686004)(186003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lThZ8TJeUEvlL89StVVIfo6KHqsapgV2oCnAcxnVLUssZesLwOlxte5yVg3pOTIi7+h7PZOGmN5/w5R8hxuJxImsEagjI3ehodojSLuRoPO4oiHeWtPI2WqV31+3aLLLL1hjRRF/W+YMhVA4WMvkRglekO2pV+412LZAAVgGKtDTzkDZj4CoiEq56sBX7Q7osPCt7lVUx/TkHq2Scq9m7F1tMfGV5BuLhiFxGjfU8NZRv+0/eujP07v/w4jW+DPO7JYBQWPxOykKebRD3Fs8XAmu73i/Am9eEu0PP7bv4KP0yRJuoRAN7k8My05L+crI5gVfohm3G0B8V/3yBkj2rC0a88rB0ZiM16pmuyevsr15Bb3N9bf/NCpkLvVQrsa/dvUYxV6WZeZ6hNtrihoB14w3Mia0knIDs5iJXSA124JuSn7NKQ7zPFkD5qSNQj80dQQtIceup3ljQqgfDjjW4n1gVA8xETtUUX9KKrHM31o=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AE33060BD6EFA43B47B506147271983@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fef3a9-d425-4b84-3ab1-08d81736bfb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 05:31:58.4107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9yj3e01/i0lFon5IummjYhW/l2abeCtp8z+f+ikhKuSNmd6iEGX5SX4corzaeO6IClII0ccz8JgJdZA1WUuDbO49hzhmms1hkO8VV90r+EuZ5QzPLqAviALrIekIjPy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4024
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
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzIzLzIwIDQ6MjAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gTW9u
LCAyMiBKdW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gRm9yIHRoZSBmaXJzdCBw
YXJ0IChfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fKSBJIHRoaW5rIHdlIGNhbiBwcm92aWRlIGl0
DQo+Pj4+PiB2aWENCj4+Pj4+DQo+Pj4+PiBDRkxBR1Mgb3Igc29tZXRoaW5nLiBUaGlzIGNhbiBh
bHNvIGJlIGRvbmUgZm9yIHRoZSBsb2NhdGlvbiBvZiBYZW4NCj4+Pj4+IGhlYWRlcnMuDQo+Pj4+
IF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gc2hvdWxkIHdvcmsgdGhyb3VnaCB0aGUgQ0ZMQUdT
LiBBbiBhbHRlcm5hdGl2ZQ0KPj4+PiB3b3VsZCBiZSB0byBhbGxvdyB0aGUgdXNlciB0byBzcGVj
aWZ5IHRocm91Z2ggdGhlIEtjb25maWcuDQo+Pj4gWW91IG1lYW4gc3BlY2lmeWluZyB2aWEgS2Nv
bmZpZyBzb21ldGhpbmcgbGlrZSAiMHgwMDA0MGQwMCI/DQo+PiBQb3NzaWJseSB5ZXMuDQo+Pg0K
Pj4+IEFuZCB3aGF0IGFib3V0IHRoZSBoZWFkZXJzPyBIb3cgd2lsbCB3ZSBwcm92aWRlIHRoZWly
IGxvY2F0aW9uIGlmIHdlIGRlY2lkZQ0KPj4+IG5vdCB0byBpbmNsdWRlIHRob3NlDQo+Pj4NCj4+
PiBpbiB0aGUgdHJlZT8NCj4+IEkgd291bGQgZG8gdGhyb3VnaCBLY29uZmlnIGFzIHdlbGwuDQo+
IElmIHdlIHNwZWNpZnkgdGhlIGV4dGVybmFsIGxvY2F0aW9uIG9mIHRoZSBYZW4gaGVhZGVycyB2
aWEgS2NvbmZpZywgaXQNCj4gc2VlbXMgdG8gbWUgdGhhdCB3ZSBzaG91bGQgYmUgYWJsZSB0byBk
ZXRlY3QgdGhlIGludGVyZmFjZSB2ZXJzaW9uDQo+IGF1dG9tYXRpY2FsbHkgZnJvbSBhbnkgTWFr
ZWZpbGUgYXMgcGFydCBvZiB0aGUgYnVpbGQuIE5vIG5lZWQgdG8gYXNrIHRoZQ0KPiB1c2VyLg0K
Pg0KPiBIb3dldmVyLCBpZiBPbGVrc2FuZHIgaXMgdGhpbmtpbmcgb2YgdXNpbmcgdGhlIFhlbiBo
ZWFkZXJzIGZvciB0aGUNCj4gaHlwZXJjYWxscyBkZWZpbml0aW9ucywgdGhlbiBJIHRoaW5rIHdl
IG1pZ2h0IG5vdCBuZWVkIGV4dGVybmFsIGhlYWRlcnMNCj4gYXQgYWxsIGJlY2F1c2UgdGhhdCBp
cyBhIHN0YWJsZSBpbnRlcmZhY2UsIGFzIEp1bGllbiB3cm90ZS4gV2UgY291bGQNCj4ganVzdCBk
ZWZpbmUgb3VyIG93biBmZXcgaGVhZGVycyBmb3IganVzdCB3aGF0IHlvdSBuZWVkIGxpa2UgTGlu
dXggZG9lcy4NCg0KVGhpcyBpcyBhIGdvb2QgaWRlYTogSSdsbCB0cnkgdG8gZ2V0IHRoZSBtaW5p
bWFsIHNldCBvZiBoZWFkZXJzIGZyb20gTGludXgNCg0KaW5zdGVhZCBvZiBYZW4gYXMgdGhvc2Ug
c2VlbSB0byBiZSB3ZWxsIHByZXBhcmVkIGZvciBzdWNoIGEgdXNlLWNhc2UuIFRoaXMNCg0Kd2F5
IHdlJ2xsIGhhdmUgaGVhZGVycyBpbiBVLWJvb3QgdHJlZSBhbmQgZ3VhcmFudGVlIHRoYXQgd2Ug
aGF2ZSBhIG1pbmltYWwNCg0Kc3Vic2V0IHdoaWNoIGlzIGVhc2llciB0byBtYWludGFpbi4gSSds
bCBrZWVwIHlvdSB1cGRhdGVkIG9uIHRoZSBwcm9ncmVzcw0KDQo+DQo+IElmIHlvdSBjYW4gZG8g
dGhhdCwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgYmVjYXVzZSB3ZSBkZWNvdXBsZSB0aGUN
Cj4gVUJvb3QgYnVpbGQgZnJvbSB0aGUgWGVuIGJ1aWxkIGNvbXBsZXRlbHkuIFdlIGRvbid0IGV2
ZW4gbmVlZCB0aGUgWGVuDQo+IHRyZWUgY2hlY2tlZCBvdXQgdG8gYnVpbGQgVUJvb3QuIEl0IHdv
dWxkIGJlIGEgaHVnZSBhZHZhbnRhZ2UgYmVjYXVzZSBpdA0KPiBtYWtlcyBpdCBmYXIgZWFzaWVy
IHRvIGJ1aWxkLXRlc3QgY2hhbmdlcyBmb3Igb3RoZXJzIGluIHRoZSBjb21tdW5pdHkNCj4gdGhh
dCBkb24ndCBrbm93IGFib3V0IFhlbiBhbmQgYWxzbyBpdCBiZWNvbWVzIGZhciBlYXNpZXIgdG8g
aW50ZWdyYXRlDQo+IGludG8gYW55IGJ1aWxkIHN5c3RlbS4=

