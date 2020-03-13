Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A48184AA5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 16:25:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCm8s-0005J1-77; Fri, 13 Mar 2020 15:22:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JFxv=46=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jCm8q-0005Iw-M4
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 15:22:29 +0000
X-Inumbo-ID: 71703a73-653e-11ea-b32c-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.139]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71703a73-653e-11ea-b32c-12813bfff9fa;
 Fri, 13 Mar 2020 15:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIey0oznz+qCprk4288EBt5tjDEfjePZSmy0+1p3DN8MOl6qiTaFtcbvUgOq8tdx8aAMDBsR+dr4clO2zcV/c6p4zhoQnN00kT21tyZzg90HCL911fE5/HX91R3VBvovTh3cRJGfeUJ0lr03Hx0T+wwOl/htYJZXaDUE0b8zumCkP4CjtlBpVUUtJ+tvHJRo4eorqGdCmKN8PI6yjTH5NLefZ+QxNu1jdpy29849agL3Xo+s7trBYriuDRO2GN/5YUUta+fG9JspgglBOkDLEa1E0uzY834zg/o+0+NaOYWPo2dl406NqepaggG9AxKkem9SmLJnQcQycyhe3UQaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ozPcNGfHBvybrytey+bcnSRpaYwzW3wTsBVuXKBqC8=;
 b=oAvTl/mPrU248ZzRwQCxrWibsSZICA5KTB++zbIdRwDHO5Eu/a91aMPCOrjIGZ0blT+36GW75mW7XxLjcnK6I0T2/QHih7sYS3dPXQ1OgAxTbGMyjnUl3Xx0kLUvRcZi+Vs0OdDDz07OHo/0aiKTJc6x5ul+uu2oFweVLiPehAxnlkrFWi4F9DRCxH4n+qf1FkDK9qKREVap7EDqdJNlKbEecH6W35Ji7/xxT42gynf6Ho+IwK0Nwv15/Hh+FIfTmaEIVh2oIyDR8m7UmalYpEuy08Pf6PSABSufSj2eyTMkgcnrN7uyOisrTq1p3i0AEizpfgA+5+FEUv1bRZp1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ozPcNGfHBvybrytey+bcnSRpaYwzW3wTsBVuXKBqC8=;
 b=c7J6HBYnvMDXFVOBcjmQ8alBZicmkBxfM91BNd/BIIQ9cLtOv6A+0VvxkZioPUNpOtiDmZfOOElBuSEIeQ52Us8v8UmoF5DvvxAOrzb4PdVgdHcLfC0QoAA4BWX1yza8LcV0IF4vHiwLAxHsaHPpayK8tH7LDrOI9zalmrBlPsE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3174.eurprd08.prod.outlook.com (52.135.163.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Fri, 13 Mar 2020 15:22:24 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.016; Fri, 13 Mar 2020
 15:22:24 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
 <87imj8i9no.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200313182221096
Message-ID: <9b1d8ba0-4dd2-e0a6-ec82-cd0c0dd2a8ff@virtuozzo.com>
Date: Fri, 13 Mar 2020 18:22:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87imj8i9no.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0401CA0051.eurprd04.prod.outlook.com
 (2603:10a6:3:19::19) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR0401CA0051.eurprd04.prod.outlook.com (2603:10a6:3:19::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18 via Frontend Transport; Fri, 13 Mar 2020 15:22:23 +0000
X-Tagtoolbar-Keys: D20200313182221096
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f1f120f-2202-4e38-693a-08d7c76254e0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3174:
X-Microsoft-Antispam-PRVS: <AM6PR08MB31749908D7661289F7DE275BC1FA0@AM6PR08MB3174.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(199004)(86362001)(8676002)(31696002)(36756003)(66476007)(8936002)(66946007)(66556008)(52116002)(4326008)(16576012)(5660300002)(6486002)(54906003)(6916009)(81156014)(31686004)(316002)(81166006)(2616005)(186003)(7416002)(956004)(16526019)(478600001)(2906002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3174;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ayCf00+rbVgsj2PlzrCPTifkW9JPauNrUqqsBsQ4+cqU486woIvdiOcmEmow+/X6oaE2gBjfWLA9qWfeM3qVWxMIMA0ny/jcljFZIu9SXo1uwKs4kUePm64zgkreiLQYySc10HqPBzNReXk4bFvZPf6Eo/Of1Quw88bECOjih58EfKlUSvjXA0UcLY+qmgvFZ1TEGhGIliP2I2XL9OJhJVMLMlpWq2Qg48krNw2uhrATVPsZm3WL3sDoEWtuXcFUhrtO6Lp+sVLCVFh0psfjE2l9wx1l+ojxt5IRIwcQY0gSdJHei0auzYGHJ+ztBLl/KRjfu9UGYtTWVUhF3CloftcZoRLw33Sih/yp/BdWwW0cF3nP2LD++8Ym5N7KzwGkeYjNIpVhH42LKM8S7dEsZC9/K5bhNzcztB1Xcd56ADGb0y4dBCWDyQ4Q/CjIPuKO
X-MS-Exchange-AntiSpam-MessageData: 5inl1qr8b2140FMVWn7S2Fzh3kviQDuHoHrMLYfXbNue9H0O913hAm4W3o8QBJvVICz9+gE+CsxCXjLjnnU1uIa9uesQpyUkxy8mshdzfq6ayZQpTrN1aCxuNWk+nqmH5F+QRNmaTvfnevQO2Wl4VA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1f120f-2202-4e38-693a-08d7c76254e0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 15:22:24.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bY3Eu95RdWmemYdovQJ4Pj1BA26l26C2teLY7WsOvPa8+6/6V0UmsZFKADbU1SKZtn1GtIgKNkDxTbefkkHlJ6+cvJdP8h0XYgwLfUoJbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3174
Subject: Re: [Xen-devel] [PATCH v9 02/10] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTMuMDMuMjAyMCAxNzo1OCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gSSB0cmllZCB0aGlz
IHNjcmlwdCBvbiB0aGUgd2hvbGUgdHJlZS4gIE9ic2VydmF0aW9uczoKPiAKPiAqICQgZ2l0LWRp
ZmYgLS1zaG9ydHN0YXQgXCouW2NoXQo+ICAgICAzMzMgZmlsZXMgY2hhbmdlZCwgMzQ4MCBpbnNl
cnRpb25zKCspLCA0NTg2IGRlbGV0aW9ucygtKQo+IAo+ICogVHdlbHZlIGZ1bmN0aW9ucyBoYXZl
ICJzZXZlcmFsIGRlZmluaXRpb25zIG9mIEVycm9yICogbG9jYWwgdmFyaWFibGUiLgo+IAo+ICAg
IEVpZ2h0IGRlY2xhcmUgc3VjaCBhIHZhcmlhYmxlIHdpdGhpbiBhIGxvb3AuICBSZXBvcnRlZCBi
ZWNhdXNlCj4gICAgQ29jY2luZWxsZSBtYXRjaGVzIGFsb25nIGNvbnRyb2wgZmxvdywgbm90IGp1
c3QgYWxvbmcgdGV4dC4gIElnbm9yZS4KPiAKPiAgICBSZW1haW5pbmcgZm91cjoKPiAKPiAgICAq
IGl2c2htZW1fY29tbW9uX3JlYWxpemUoKQo+IAo+ICAgICAgVHdvIHZhcmlhYmxlcyAobWVzc2Vk
IHVwIGluIGNvbW1pdCBmZTQ0ZGM5MTgwNyksIHNob3VsZCBiZSByZXBsYWNlZAo+ICAgICAgYnkg
b25lLgo+IAo+ICAgICogcW1wX3F1ZXJ5X2NwdV9tb2RlbF9leHBhbnNpb24oKSB0d28gdGltZXMK
PiAKPiAgICAgIFRocmVlIGRlY2xhcmF0aW9ucyBpbiBzZXBhcmF0ZSBibG9ja3M7IHR3byBzaG91
bGQgYmUgcmVwbGFjZWQgYnkKPiAgICAgICZlcnJvcl9hYm9ydCwgb25lIG1vdmVkIHRvIHRoZSBm
dW5jdGlvbiBibG9jay4KPiAKPiAgICAqIHhlbl9ibG9ja19kZXZpY2VfZGVzdHJveSgpCj4gCj4g
ICAgICBUd28gZGVjbGFyYXRpb25zIGluIHNlcGVyYXRlIGJsb2Nrczsgc2hvdWxkIGJlIHJlcGxh
Y2VkIGJ5IGEgc2luZ2xlCj4gICAgICBvbmUuCj4gCj4gICAgU2VwYXJhdGUgbWFudWFsIGNsZWFu
dXAgcGF0Y2hlcywgaWRlYWxseSBhcHBsaWVkIGJlZm9yZSBydW5uaW5nCj4gICAgQ29jY2luZWxs
ZSB0byBrZWVwIENvY2NpbmVsbGUncyBjaGFuZ2VzIGFzIHNpbXBsZSBhbmQgc2FmZSBhcwo+ICAg
IHBvc3NpYmxlLiAgSSdsbCBwb3N0IHBhdGNoZXMuICBPbmx5IHRoZSBvbmUgZm9yCj4gICAgeGVu
X2Jsb2NrX2RldmljZV9kZXN0cm95KCkgYWZmZWN0cyBieSB0aGlzIHNlcmllcy4KPiAKPiAqIE5v
IGZ1bmN0aW9uICJwcm9wYWdhdGVzIHRvIGVycnAgc2V2ZXJhbCB0aW1lcyIKPiAKPiAgICBJIHRl
c3RlZCB0aGUgcnVsZSBkb2VzIGRldGVjdCB0aGlzIGFzIGFkdmVydGl6ZWQgYnkgZmVlZGluZyBp
dCBhbgo+ICAgIG9idmlvdXMgZXhhbXBsZS4gIFdlJ3JlIGdvb2QuCj4gCj4gKiBFUlJQX0FVVE9f
UFJPUEFHQVRFKCkgaW5zZXJ0ZWQgNzQ0IHRpbWVzLCBhbHdheXMgcmlnaHQgYXQgdGhlCj4gICAg
YmVnaW5uaW5nIG9mIGEgZnVuY3Rpb24uCj4gCj4gKiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgYWxs
IGNoYW5nZWQgZnVuY3Rpb25zIGhhdmUgRVJSUF9BVVRPX1BST1BBR0FURSgpCj4gICAgaW5zZXJ0
ZWQuICBHb29kLgo+IAo+ICogQWxtb3N0IDExMDAgZXJyb3IgcHJvcGFnYXRpb25zIGRyb3BwZWQ6
ZXJyb3JfcHJvcGFnYXRlKCkgcmVtb3ZlZCwKPiAgICBlcnJvcl9wcm9wYWdhdGVfcHJlcGVuZCgp
IHJlcGxhY2VkIGJ5IGp1c3QgZXJyb3JfcHJlcGVuZCgpLgo+IAo+ICogRm91ciBlcnJvcl9wcm9w
YWdhdGUoKSBhcmUgdHJhbnNmb3JtZWQuICBUd28gaW5zdGFuY2VzIGVhY2ggaW4KPiAgICBhc3Bl
ZWRfc29jX2FzdDI2MDBfcmVhbGl6ZSgpIGFuZCBhc3BlZWRfc29jX3JlYWxpemUoKS4gIFBhdHRl
cm46Cj4gCj4gICAgICAgewo+ICAgICAgKyAgICBFUlJQX0FVVE9fUFJPUEFHQVRFKCk7Cj4gICAg
ICAgICAgIC4uLgo+ICAgICAgLSAgICBFcnJvciAqZXJyID0gTlVMTCwgKmxvY2FsX2VyciA9IE5V
TEw7Cj4gICAgICArICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOwo+ICAgICAgICAgICAuLi4K
PiAKPiAgICAgICAgICAgICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfVCguLi4sCj4gICAgICAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVycik7Cj4gICAgICArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZXJycCk7Cj4gICAgICAgICAgICAgICBvYmplY3RfcHJvcGVydHlfc2V0
X1QoLi4uLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZsb2NhbF9lcnIp
Owo+ICAgICAgLSAgICAgICAgZXJyb3JfcHJvcGFnYXRlKCZlcnIsIGxvY2FsX2Vycik7Cj4gICAg
ICAtICAgICAgICBpZiAoZXJyKSB7Cj4gICAgICAtICAgICAgICAgICAgZXJyb3JfcHJvcGFnYXRl
KGVycnAsIGVycik7Cj4gICAgICArICAgICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxf
ZXJyKTsKPiAgICAgICsgICAgICAgIGlmICgqZXJycCkgewo+ICAgICAgICAgICAgICAgICAgIHJl
dHVybjsKPiAgICAgICAgICAgICAgIH0KPiAKPiAgICBUaGlzIGlzIHdoYXQgZXJyb3IuaCBjYWxs
cyAiUmVjZWl2ZSBhbmQgYWNjdW11bGF0ZSBtdWx0aXBsZSBlcnJvcnMKPiAgICAoZmlyc3Qgb25l
IHdpbnMpIi4KPiAKPiAgICBSZXN1bHQ6Cj4gCj4gICAgICAgICAgRVJSUF9BVVRPX1BST1BBR0FU
RSgpOwo+ICAgICAgICAgIC4uLgo+ICAgICAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOwo+
ICAgICAgICAgIC4uLgo+IAo+ICAgICAgICAgICAgICBvYmplY3RfcHJvcGVydHlfc2V0X1QoLi4u
LCBlcnJwKTsKPiAgICAgICAgICAgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9UKC4uLiwgJmxvY2Fs
X2Vycik7Cj4gICAgICAgICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOwo+
ICAgICAgICAgICAgICBpZiAoKmVycnApIHsKPiAgICAgICAgICAgICAgICAgIHJldHVybjsKPiAg
ICAgICAgICAgICAgfQo+IAo+ICAgIENvdWxkIGJlIGRvbmUgd2l0aG91dCB0aGUgYWNjdW11bGF0
aW9uOgo+IAo+ICAgICAgICAgIEVSUlBfQVVUT19QUk9QQUdBVEUoKTsKPiAgICAgICAgICAuLi4K
PiAKPiAgICAgICAgICAgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9UKC4uLiwgZXJycCk7Cj4gICAg
ICAgICAgICAgIGlmICgqZXJycCkgewo+ICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAg
ICAgICAgICB9Cj4gICAgICAgICAgICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfVCguLi4sIGVycnAp
Owo+ICAgICAgICAgICAgICBpZiAoKmVycnApIHsKPiAgICAgICAgICAgICAgICAgIHJldHVybjsK
PiAgICAgICAgICAgICAgfQo+IAo+ICAgIEkgZmluZCB0aGlzIGEgYml0IGVhc2llciB0byB1bmRl
cnN0YW5kLiAgTWF0dGVyIG9mIHRhc3RlLiAgSWYgd2Ugd2FudAo+ICAgIHRvIGNoYW5nZSB0byB0
aGlzLCBkbyBpdCBtYW51YWxseSBhbmQgc2VwYXJhdGVseS4gIEknZCBkbyBpdCBvbiB0b3AuCj4g
Cj4gKiBTb21lIDkwIHByb3BhZ2F0aW9ucyByZW1haW4uCj4gCj4gICAgU29tZSBvZiB0aGVtIGNv
dWxkIHVzZSBjbGVhbnVwLCBlLmcuIGZpbGVfbWVtb3J5X2JhY2tlbmRfc2V0X3BtZW0oKSwKPiAg
ICBjc3NfY2xlYXJfaW9faW50ZXJydXB0KCkuICBPdXQgb2Ygc2NvcGUgZm9yIHRoaXMgc2VyaWVz
Lgo+IAo+ICAgIFNvbWUgbW92ZSBlcnJvcnMgYXJvdW5kIGluIHVudXN1YWwgd2F5cywgZS5nLiBp
biBibG9jay9uYmQuYy4gIENvdWxkCj4gICAgdXNlIHJldmlldy4gIE91dCBvZiBzY29wZSBmb3Ig
dGhpcyBzZXJpZXMuCj4gCj4gICAgSSBzcG90dGVkIHRocmVlIHRoYXQgc2hvdWxkIGJlIHRyYW5z
Zm9ybWVkLCBidXQgYXJlbid0Ogo+IAo+ICAgIC0gcWNyeXB0b19ibG9ja19sdWtzX3N0b3JlX2tl
eSgpCj4gCj4gICAgICBJIGJlbGlldmUgZ19hdXRvcHRyKCkgY29uZnVzZXMgQ29jY2luZWxsZS4g
IFVuZGVybWluZXMgYWxsIG91cgo+ICAgICAgQ29jY2luZWxsZSB1c2UsIG5vdCBqdXN0IHRoaXMg
cGF0Y2guICBJIHRoaW5rIHdlIG5lZWQgdG8gdXBkYXRlCj4gICAgICBzY3JpcHRzL2NvY2NpLW1h
Y3JvLWZpbGUuaCBmb3IgaXQuCj4gCj4gICAgLSBhcm1zc2VfcmVhbGl6ZSgpCj4gCj4gICAgICBT
b21ldGhpbmcgaW4gdGhpcyBodWdlIGZ1bmN0aW9uIGNvbmZ1c2VzIENvY2NpbmVsbGUsIGJ1dCBJ
IGRvbid0Cj4gICAgICBrbm93IHdoYXQgZXhhY3RseS4gIElmIEkgZGVsZXRlIG1vc3Qgb2YgaXQs
IHRoZSBlcnJvcl9wcm9wYWdhdGUoKQo+ICAgICAgdHJhbnNmb3JtcyBva2F5LiAgSWYgSSBkZWxl
dGUgbGVzcywgQ29jY2luZWxsZSBoYW5ncy4KPiAKPiAgICAtIGFwcGx5X2NwdV9tb2RlbCgpCj4g
Cj4gICAgICBHZXRzIHRyYW5zZm9ybWVkIGZpbmUgaWYgSSByZW1vdmUgdGhlICNpZm5kZWYgQ09O
RklHX1VTRVJfT05MWS4gIEkKPiAgICAgIGhhdmUgbm8gaWRlYSB3aHkgdGhlICNpZiBzcG9va3Mg
Q29jY2luZWxsZSBoZXJlLCBidXQgbm90IGVsc2V3aGVyZS4KPiAKPiAgICBOb25lIG9mIHRoZXNl
IHRocmVlIGFmZmVjdHMgdGhpcyBzZXJpZXMuICBObyBuZWVkIHRvIGhvbGQgaXQgYmFjayBmb3IK
PiAgICBmdXJ0aGVyIGludmVzdGlnYXRpb24uCj4gCj4gKiAzMCBlcnJvcl9mcmVlKCkgYW5kIHR3
byB3YXJuX3JlcG9ydGZfZXJyKCkgYXJlIHRyYW5zZm9ybWVkLiAgUGF0dGVybnM6Cj4gCj4gICAg
ICAtICAgIGVycm9yX2ZyZWUobG9jYWxfZXJyKTsKPiAgICAgIC0gICAgbG9jYWxfZXJyID0gTlVM
TDsKPiAgICAgICsgICAgZXJyb3JfZnJlZV9lcnJwKGVycnApOwo+IAo+ICAgIGFuZAo+IAo+ICAg
ICAgLSAgICBlcnJvcl9mcmVlKGxvY2FsX2Vycik7Cj4gICAgICArICAgIGVycm9yX2ZyZWVfZXJy
cChlcnJwKTsKPiAKPiAgICBhbmQKPiAKPiAgICAgIC0gICAgd2Fybl9yZXBvcnRfZXJyKGxvY2Fs
X2Vycik7Cj4gICAgICAtICAgIGxvY2FsX2VyciA9IE5VTEw7Cj4gICAgICArICAgIHdhcm5fcmVw
b3J0X2VycnAoZXJycCk7Cj4gCj4gICAgR29vZC4KPiAKPiAqIE1hbnkgZXJyb3JfZnJlZSgpLCBl
cnJvcl9yZXBvcnRmX2VycigpIGFuZCB3YXJuX3JlcG9ydGZfZXJyKCkgcmVtYWluLgo+ICAgIE5v
bmUgb2YgdGhlbSBoYXZlIGFuIGFyZ3VtZW50IG9mIHRoZSBmb3JtICplcnJwLiAgU3VjaCBhcmd1
bWVudHMgd291bGQKPiAgICBoYXZlIHRvIGJlIHJldmlld2VkIGZvciBwb3NzaWJsZSBpbnRlcmZl
cmVuY2Ugd2l0aAo+ICAgIEVSUlBfQVVUT19QUk9QQUdBVEUoKS4KPiAKPiAqIEFsbW9zdCA3MDAg
RXJyb3IgKmVyciA9IE5VTEwgcmVtb3ZlZC4gIEFsbW9zdCA2MDAgcmVtYWluLgo+IAo+ICogRXJy
b3IgdXNhZ2UgaW4gcmRtYS5jIGlzIHF1ZXN0aW9uYWJsZSAvIHdyb25nLiAgT3V0IG9mIHNjb3Bl
IGZvciB0aGlzCj4gICAgc2VyaWVzLgo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCB5b3VyIENv
Y2NpbmVsbGUgc2NyaXB0IGlzIHdvcmtpbmcgYXMgaW50ZW5kZWQsCj4gZXhjZXB0IGZvciB0aHJl
ZSBtaXNzZWQgZXJyb3IgcHJvcGFnYXRpb25zIG5vdGVkIGFib3ZlLiAgV2UgY2FuIHByb2NlZWQK
PiB3aXRoIHRoaXMgc2VyaWVzIHJlZ2FyZGxlc3MsIGlmIHdlIHdhbnQuICBJJ2QgcHJlZmVyIHRv
IGludGVncmF0ZSBteQo+IGZvcnRoY29taW5nIGNsZWFudXAgdG8geGVuX2Jsb2NrX2RldmljZV9k
ZXN0cm95KCksIHRob3VnaC4KPiAKCkdyZWF0IGludmVzdGlnYXRpb24hISEKCkknbSBmb3IgcHJv
Y2VlZGluZyBhcyBpcywgb3Igd2l0aCB5b3VyIGNsZWFudXAgZm9yIHhlbl9ibG9ja19kZXZpY2Vf
ZGVzdHJveSgpLgpTdGlsbCwgc2NyaXB0IGNvbnZlcnRzIHhlbl9ibG9ja19kZXZpY2VfZGVzdHJv
eSBjb3JyZWN0bHkgYW55d2F5LCByZXN1bHRpbmcgY29kZQp3aWxsIGJlIHRoZSBzYW1lIGFuZCB3
ZSBhcmUgT0sgd2l0aG91dCBjbGVhbnVwIGFzIHdlbGwuCgotLSAKQmVzdCByZWdhcmRzLApWbGFk
aW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
