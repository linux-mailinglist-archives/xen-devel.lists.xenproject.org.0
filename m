Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE3280FDF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1759.5392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHOu-0006OW-7n; Fri, 02 Oct 2020 09:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1759.5392; Fri, 02 Oct 2020 09:30:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHOu-0006O7-3s; Fri, 02 Oct 2020 09:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1759;
 Fri, 02 Oct 2020 09:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7DnO=DJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kOHOs-0006O1-3i
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:30:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 153dcf84-0294-4d72-acfb-c422c54e1fd4;
 Fri, 02 Oct 2020 09:30:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7DnO=DJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kOHOs-0006O1-3i
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:30:50 +0000
X-Inumbo-ID: 153dcf84-0294-4d72-acfb-c422c54e1fd4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 153dcf84-0294-4d72-acfb-c422c54e1fd4;
	Fri, 02 Oct 2020 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601631049;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yVmCpR6JSyBsvTOX22MCLXEH9gAlAvDBshycCsO1dy4=;
  b=I/78ZTQtDQS2tY+Yp+FUAZxIfk/PVzEYCKrD9w0vQaocYWIH5ekxT7Og
   IoDFwGZZNYDsH7qmLkvf5jNN2YQvw784FVp/0saxt6+pEC1nmbRiPr5DY
   LygGUsrnGgPEvD2XmhSqcvrItkLkpPPDyHpFn2N9rMFS/mkbk3s0GgNu8
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3O+CMwRwDtk4ZZBdcs+69a2mPhxX3SNr+r3xusqAD5LGCCwxCiUO0PlBWJ1bIWLMb4U/m/5Cw+
 hIYyd81K+2wyE9C6o9xab6EvzDEQJxJvHGAQ5D3bxfsNd3JY/NP25AU1mLrx/WVMZnt6k1+e4c
 D6twOvHPxpE7Cau1j/Z7Z1gW9g7WIvwFqzFMG5RzUJCJG3mhfl/Akxowh8hUjhiDiAtH2mc9hg
 HAt9zb2T36LDkAga6we7z4HHtE5vSfTDpFPsynGk2ey9M6bcbn0RXE/63N/JVooAKZcq/X+Gmh
 5sA=
X-SBRS: None
X-MesageID: 28480848
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="28480848"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4v2SqlNqAheAkDfxYZwJMeVLGpLP+InqQrG6wyjtddEKBhzMAa54+QCrOVFbLCuG0qVBfQhi6Df0djNmOTorxoZVK9v+pW8Jo2/VXAN1p4cjFa4SxrxCNZjca8HMWwP2yqFvVisBFO64EB5r7LhYyxjdyKbJMzaVU0ZkU0NXYqbTgx7p8LC6Q4n73rZU3RGu80+03HMBY0FjEhIRih12/SbOwYXT3bK22ash4XEOder2xbE0yQ8T1EfU5yOWf52cWUGP/23Gk7rxXTZp2o/owq9jPVpVbQd1yHhP5H31gBz1/Lx/b6GT9CIh+4tQ5vZs5bnlCdkHR+1/QUCJc+B9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVmCpR6JSyBsvTOX22MCLXEH9gAlAvDBshycCsO1dy4=;
 b=KLIu8IHk1iXOZSbqLm9J9LQ6AKnE5XrG8abbzfkPlCySdmKa7PhcHMyD8mvlYT0fTYAdrHNfsHMvEjGVrhoHY59S4BJIzXa/QR5iWYXJ7dhFhEew2+0Pz/XG/4LNbb+WZZCJQq2nRsasF1TttWTPLm06/tCDdKq5vBhwDR89e9NuMr7zh4cDECihDGN3tNrF5/yIKEl+uYCVrjc5zzCCdCA5w8jJHzkCXbnvuW7mEv+JTcZHMlGoPsKHilC7BtG+Ko3Qxjvs4f5NxGonoKfcaXVaNCYyNGg1UIywGyR7EAz/kA4A/qXRpGTGJ+vzfqEe4zKy7Z24uFvkZiH9S3KBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVmCpR6JSyBsvTOX22MCLXEH9gAlAvDBshycCsO1dy4=;
 b=TFZ47lm/q8SQ6ycUKZw3j3dOWrTYEOyQpIiZYMhz3zrhhO82C9fieHxgQ5xn9HAxMzp5HcPka5Y1sgbRqzOeWLhEhu8FA7SWJ3bJSZYaULHap5i+YqZDRIlseXzNUbbYn3ufbYi4k7jBLBJPqbqvEn/l1aYOb2Y3UcOCLMIuQBc=
From: George Dunlap <George.Dunlap@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, "Rich
 Persaud" <persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Topic: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Index: AQHWlylRG8SsjpT4JUGR4W/Ewa0YcqmC4twAgAEsN4A=
Date: Fri, 2 Oct 2020 09:30:44 +0000
Message-ID: <C3D24549-C5B1-4B90-A18D-FEBD1A4D0B93@citrix.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
 <20201001153612.GG19254@Air-de-Roger>
In-Reply-To: <20201001153612.GG19254@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e5a3232-6f63-4c8b-285b-08d866b5d65f
x-ms-traffictypediagnostic: BY5PR03MB5234:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR03MB523463584B3D310ED4BB8C6899310@BY5PR03MB5234.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1md2bxk78BclaDJstPabX0g82KzF4PJNArcoKyVMQYlcypH/ti4EYECXrHsLFwooJ1uNOqd1dnSVa9Efz0x+ZmyxmO9wlC5ti/Y0jhL+UrQuRYuVsO6x602OV5K08bg/Ayp/d4YnqqDGgFy4R2SO7P1XnGGPzKhSJOMi2vUTx1F47TVrP4EOaiEtgF2gkofph2go5V7IdQPR1sr9s9+7vJKgO2/xgx4j/KUnIdffEeitwe59QNzY9Fq1wieibwFhfFyBS9TVt4XUdenVsd9GsPfFxhGM2iLzTUY0hWJY2yUl7Ejqy17cJeIdYghKtBw4VnxlgFXKcF52BG7MC2HDmSh9TCaM3OJmzOVpqY9IsOuSehm8hWhbrtBk+ESL4cEknS3jy3WPacupanHd7r4jfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(91956017)(2906002)(33656002)(76116006)(86362001)(71200400001)(4326008)(6512007)(6862004)(36756003)(83080400001)(478600001)(8936002)(54906003)(6636002)(966005)(8676002)(55236004)(6506007)(53546011)(316002)(6486002)(37006003)(66446008)(66556008)(64756008)(66476007)(2616005)(186003)(66946007)(5660300002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HjhZtKbEdeYWtRvRLLZCYrD1+NmR1hyQFEjjZuZRZeRea+t+oflSZBxQ5cdSmaHOugUQpERyXLoN80Q7wHSLF+PlU7jaqisAIH5yJma4CSDkRSva+1rYmE0I9TT4zTdRZ1Vfxslvuc0+W8BnzpY9l1FB/TIMA25PDXbfK9E2TNzoB4ajBfyLc/ko13U/P0nDlPb9IVILF0Jvh3FQOKjxrDxKeyDPKYYOT7vJmzhE5m03a6XXaojK5g6COvZAQ8emEMY+dm1SkOtwXEqjPN0K9NXt59nfYNOwDP1SyuNPwDseDEyTW4yWYC3Piom+fnfHwXbcVeiBb0bLxlhPQvG1lk8ViyMGfujonodkLH93lM3XbNOWdiyCI1+lzYyFObsL2diYRmP1p6anSBGys2mvKY57tBx7jUK+X3sP71GTtI1gnkayP8VTCTsiosxDrdUizW6KWz3RYhQFOh+BUI0WC1EbR0jK5c75oAHjU6yNUHjOmZYYRKeAgwq9VzxEWFqayBT5K+gOu5zESo3lSBLpMo+V3BzY+BD9wsY6WAMs/ecCZVDQ6RXpxod7Yw+kuyAfRKdMs0c48tAMgMkAJbya2jfiNHg3WTE8pK2Vj8lhWARfBHPJuhLWuIzyIdCMtIUAdIWw7M17Q6D4GPmsmE3SdQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFCD7DBB617B6E44B18F6D3210797E16@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5a3232-6f63-4c8b-285b-08d866b5d65f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 09:30:44.3020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWodXmMAaX4LAR75Hd6YQdsc7xyZF7BzK1c6K/1KxfRnUkT9vPQeaDRik7/PN5NypRZgDW0e48MHqPX2t/rm6+t1aJX/eIyuI/NuldhDeuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5234
X-OriginatorOrg: citrix.com

DQoNCj4gT24gT2N0IDEsIDIwMjAsIGF0IDQ6MzYgUE0sIFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDE6
NTc6MzZQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+ICsNCj4+ICtEaXN0cm9zIHdl
IGNvbnNpZGVyIHdoZW4gZGVjaWRpbmcgbWluaW11bSB2ZXJzaW9ucw0KPj4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiArDQo+PiArV2UgY3Vy
cmVudGx5IGFpbSB0byBzdXBwb3J0IFhlbiBidWlsZGluZyBhbmQgcnVubmluZyBvbiB0aGUgZm9s
bG93aW5nIGRpc3RyaWJ1dGlvbnM6DQo+PiArRGViaWFuXywNCj4+ICtVYnVudHVfLA0KPj4gK09w
ZW5TVVNFXywNCj4+ICtBcmNoIExpbnV4LA0KPj4gK1NMRVNfLA0KPj4gK1lvY3RvXywNCj4+ICtD
ZW50T1NfLA0KPj4gK2FuZCBSSEVMXy4NCj4gDQo+IENvdWxkIHdlIGFkZCBGcmVlQlNEIGhlcmUs
IEkndmUgYmVlbiBwYWNrYWdpbmcgWGVuIHRoZXJlIGZvciBxdWl0ZQ0KPiBzb21lIHRpbWUgbm93
LCBhbmQgdHJ5IHRvIGtlZXAgaXQgd29ya2luZy4NCg0KT2gsIHllcyBvZiBjb3Vyc2UuICBBbmQg
cHJvYmFibHkgTmV0QlNEIGFzIHdlbGwuDQoNCj4gSXQncyBhbiBpbnRlcmVzdGluZyB0YXJnZXQg
YmVjYXVzZSBpdCBoYXMgcXVpdGUgYSBkaWZmZXJlbnQgdG9vbGNoYWluDQo+IGFzIGl0J3MgZnVs
bHkgbGx2bSBiYXNlZCAoY2xhbmcgKyBsbGQpIGFuZCB0aGVuIGl0J3MgdXNpbmcgdGhlIEVMRg0K
PiBUb29sY2hhaW4uDQo+IA0KPiBodHRwczovL3d3dy5mcmVlYnNkLm9yZy9yZWxlYXNlcy8NCj4g
DQo+IE5vdCBzdXJlIGlmIHdlIHdhbnQgdG8gcmVuYW1lIHRoZSBjdXJyZW50IHNlY3Rpb24gdG8g
TGludXggZGlzdHJvcyBhbmQNCj4gYWRkIGEgZGlmZmVyZW50IG9uZSBmb3Igb3RoZXIgT1Nlcy4N
Cg0KSSBkb27igJl0IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGxpc3QgdGhlc2Ugc2VwYXJhdGVs
eS4gIEnigJlsbCB0cnkgdG8gbWFrZSBzdXJlIHRoZSBuYW1pbmcgZW5jb21wYXNzZXMgYm90aC4N
Cg0KIC1HZW9yZ2U=

