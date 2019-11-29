Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8E710D5BE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:38:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafUZ-0006Xr-TV; Fri, 29 Nov 2019 12:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=572+=ZV=atos.net=marc.doz.external@srs-us1.protection.inumbo.net>)
 id 1iafUY-0006XK-26
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:35:22 +0000
X-Inumbo-ID: b3f80ede-12a4-11ea-83b8-bc764e2007e4
Received: from smtppost.atos.net (unknown [193.56.114.176])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3f80ede-12a4-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atos.net; i=@atos.net; q=dns/txt; s=mail;
 t=1575030920; x=1606566920;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xi8yCC+7YLK2B4D5Jx3LlINVbRf+QLKoekaOHMI2HRw=;
 b=tOEVzsYp7HC8b7uapmolsRtsJ/PuDwaoUUqfCW0mxCG7OHhbIoc7aDbS
 UfNNgIcxVXepK9DYyraqknWmLAH2a6tPoQntrZAxYgzMLc9s8T5DGHMKg
 O3J2pPzRV6ft/x1wo2TGklemgNWAzcUWhFjeRr/39Y4UXBx3fmVOr/27E Q=;
IronPort-SDR: y2T5GDQbBIhO8lKn0NyZR4gqmook3auleQOvqMvsPe8CdTy+JAOswAc2shbg60jRMT5eq5zwUC
 +ZbX1j2nIKy6O1znlAXCEwkj1zEUduVy7Qq0H8QtCWcp1V/ZLiEMwya9Ey8n8Hdb5M7weUYkgK
 Fsws7XzGvpes1DFb3PxB7kpLkmTFVx90UlIv5wj/oG6ut0biTB1Nh9gvHTVvAWk3KXrX92cNB7
 WE4lwSNggcCCg30IbZuXF8LbLWst+PolHDPriWAe9krggpg/1M7MKR1yuBLVUYFeBKT9fUeok6
 6VPwlDIZjq1FsgVVUja3WESv
X-IronPort-AV: E=Sophos;i="5.69,257,1571695200"; 
   d="scan'208";a="7211781"
X-MGA-submission: =?us-ascii?q?MDHQQo6pmDS4Ihq732obuJNdzheU2J1Nyd4SlU?=
 =?us-ascii?q?xLuP0QgW+O485bIAGVnjGigB+wJIY4Az7jnkCBq2B0Bqyy+er4LtFhX3?=
 =?us-ascii?q?1JXcTAYpJnyqlrURmnGwBawECvwjH0tDV7tj61+umjz2KdcPNoeNRZqv?=
 =?us-ascii?q?KB?=
Received: from unknown (HELO DEERLM99ETYMSX.ww931.my-it-solutions.net)
 ([10.86.142.47])
 by smtppost.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
 29 Nov 2019 13:35:18 +0100
Received: from DEFTHW99ETSMSX.ww931.my-it-solutions.net (10.86.142.100) by
 DEERLM99ETYMSX.ww931.my-it-solutions.net (10.86.142.47) with Microsoft SMTP
 Server (TLS) id 14.3.468.0; Fri, 29 Nov 2019 13:34:51 +0100
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.100) with Microsoft SMTP
 Server (TLS) id 14.3.468.0; Fri, 29 Nov 2019 13:34:50 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4ewymhTmPbMkdqGu7rwrNwDNBAwziJ4Vzh5e+5YjYPYUIC/qVthuxiPsaNbXtr+npC7rk9voYcWtS6hTtxtGuRoYq7BK2ZWWHlOhup2XPN1/NsOAJ+kfw1jyWvcBsb7XBy7rgmSDCJ7veCa5X/IYhwEog7gjgNwhGPovCs2nf5LS3qAjgzUbhOD8ji8LMWObKsAl8SX1rAxBPbFlnlIkLIdnxuPEYb/X7Z46PWn6LSSdztlQmmrG7u7qYiqx0bJKxpzYz6GVg0thIiplf3z6EfmtGjidG2alzCCjkzrxGYL53sYAnx8RnYgurEPmDr97ZcbPOAlGa6TJ4NFgKwXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xi8yCC+7YLK2B4D5Jx3LlINVbRf+QLKoekaOHMI2HRw=;
 b=QZms5UiOmCu6Dphb4JktTlMQUAkozbkxzfEdYZJcac0Gg3Ypt6V8yf0H6ftwZy83Rwl9G1RD4rIfK962F1TkdTdaymr8ftFUion2CZssLewHPMaJk6o/i9RC41pIaLonbO/w29X3p0TPUivvmmwUFFGqbA7YPf8iv+I58y9GQjNgf2zFX219c1FuV94PBBqMvJKmOiJE3XvMQHkXcHglQCIBOG16Hrk3smaAtM8R3iC1Ah5v6NzcgIjLDFO0SLlWDbfN6NZzreZ2K9adP/0HDmGpkZoDg28d5xGqkKs+fs9b773fYfwXnMFaTgK9X/dgFSUr/ozFANwY9cwmhfm9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from AM0PR02MB4385.eurprd02.prod.outlook.com (20.178.19.77) by
 AM0PR02MB4369.eurprd02.prod.outlook.com (20.178.16.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Fri, 29 Nov 2019 12:34:49 +0000
Received: from AM0PR02MB4385.eurprd02.prod.outlook.com
 ([fe80::51c2:4ab2:32c7:3981]) by AM0PR02MB4385.eurprd02.prod.outlook.com
 ([fe80::51c2:4ab2:32c7:3981%6]) with mapi id 15.20.2474.023; Fri, 29 Nov 2019
 12:34:49 +0000
From: "DOZ, MARC (ext)" <marc.doz.external@atos.net>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] bug suspcion and proposed modification when
 xen-pciback failed to map an irq (-19) to a domU
Thread-Index: AdWmkKtK1mIfCnPYTFqu2ZiOwgqUvwAEPQGAAAOYXhA=
Date: Fri, 29 Nov 2019 12:34:49 +0000
Message-ID: <AM0PR02MB43853D082C1BC7416DED0064D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
References: <AM0PR02MB4385A7921A8F857539C71241D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
 <8e1dd854-b5d0-b433-50f1-0bfb1ec6b31a@suse.com>
In-Reply-To: <8e1dd854-b5d0-b433-50f1-0bfb1ec6b31a@suse.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marc.doz.external@atos.net; 
x-originating-ip: [217.115.65.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddba17ac-efe8-4706-9d4a-08d774c88693
x-ms-traffictypediagnostic: AM0PR02MB4369:
x-microsoft-antispam-prvs: <AM0PR02MB43697B2019855A74D6D1667DD3460@AM0PR02MB4369.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(33656002)(55236004)(6506007)(478600001)(446003)(25786009)(66066001)(99286004)(52536014)(3846002)(102836004)(229853002)(6436002)(66476007)(66946007)(8676002)(5640700003)(966005)(76116006)(66446008)(9686003)(81156014)(66556008)(64756008)(81166006)(11346002)(305945005)(6306002)(74316002)(6246003)(26005)(186003)(2906002)(71190400001)(316002)(86362001)(55016002)(8936002)(14454004)(76176011)(7736002)(7696005)(6116002)(2501003)(4744005)(14444005)(6916009)(2351001)(5660300002)(256004)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4369;
 H:AM0PR02MB4385.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GCNVlfK7aZN2Vo7UTddxP0jyJCfJU9Gjpd/Lx0gFv80wtxViMN13qnBbrCyOb3CxW2KFqhlTHLuePfP7e5jP3442iGOIXVx+NeBAR0iF1h3PRHDc8MtfgP37bdFB9uRxrJEkMn+On25cF9LejxHrfNp+aftNoOYYMNPAgvGx8yslxa/3pLEfOKWxwBUNUeuds4xLCZHoRov7lgFnpl9zr04/AdST5zIt+u3XJQToKmal2slnd7uAmcxadTuRBpyFWpaZwK74K9n9Bf9MGEA4fwUKdpgHatlSo6s3yvmz/vWe3TbW+293LLyH1f3NuIj2yky2knm5BSYTdRF/KvNLJSMf8inNWS6lfHY+vTgpFIWE0Q9RxIvF5sGyv7BQ058Y8xpO5rouQR+eNdRO/EKicp+FNRtldJCzS+Sz0CMF262Rgz7Cv98teDaqHlPi+bw4JmtkmVYZjR2b5x5O4pFNIe5ol2e0EtFdH6R1dzIb/NM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ddba17ac-efe8-4706-9d4a-08d774c88693
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 12:34:49.5443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FksH1klT+HZva/Cs+6dQz5RYPxnAzSPhKp2ZAPk8YZAW5D/oBUJJi/j0fnzje8U4KlRlRpJsF9kssgy3TA84xyTAmcd1QrVCiW/GMMc40Qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4369
X-OriginatorOrg: atos.net
Subject: Re: [Xen-devel] bug suspcion and proposed modification when
 xen-pciback failed to map an irq (-19) to a domU
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj5FeGNlcHQgdGhhdCB0aGlzIGlzIG5vdCBhICJmaXgiLCBidXQgdGhlIGludHJvZHVjdGlvbiBv
ZiBhIHNlY3VyaXR5IHZ1bG5lcmFiaWxpdHkgKHBlcm1pdHRpbmcgaW50ZXJydXB0IHNldHVwIG9u
IHVuLW93bmVkIGRldmljZXMpLiBTZWUgWFNBLTIzNywgd2hpY2ggYWN0dWFsbHkgY2hhbmdlZCBp
dCBpbiB0aGUgb3Bwb3NpdGUgZGlyZWN0aW9uIG9mIHdoYXQgeW91J3JlIHByb3Bvc2luZy4KCk9r
LCBJIGZvdW5kIGl0IDoKaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcveHNhL3hzYTIzNy00LjUvMDAw
MS14ODYtZG9udC1hbGxvdy1NU0ktcElSUS1tYXBwaW5nLW9uLXVub3duZWQtZGV2aWNlLnBhdGNo
CgoiTVNJIHNldHVwIHNob3VsZCBiZSBwZXJtaXR0ZWQgb25seSBmb3IgZXhpc3RpbmcgZGV2aWNl
cyBvd25lZCBieSB0aGUgcmVzcGVjdGl2ZSBndWVzdCIgCgpCdXQgaG93IHRvIGNoYW5nZSB0aGUg
b3duZXIgb2YgbXkgZGV2aWNlIG9yIHVwZGF0ZSB0aGUgcGRldi0+ZG9tYWluLT5kb21haW5faWQg
PwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
