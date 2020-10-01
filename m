Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F145627FCB5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 11:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1159.3820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvJr-0002YT-Ds; Thu, 01 Oct 2020 09:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159.3820; Thu, 01 Oct 2020 09:56:11 +0000
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
	id 1kNvJr-0002Y4-AV; Thu, 01 Oct 2020 09:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1159;
 Thu, 01 Oct 2020 09:56:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CxPN=DI=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kNvJp-0002Xz-EG
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:56:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06a245ec-cfa3-461f-a2a4-b8cf61f07638;
 Thu, 01 Oct 2020 09:56:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CxPN=DI=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kNvJp-0002Xz-EG
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:56:09 +0000
X-Inumbo-ID: 06a245ec-cfa3-461f-a2a4-b8cf61f07638
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 06a245ec-cfa3-461f-a2a4-b8cf61f07638;
	Thu, 01 Oct 2020 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601546166;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mOHDXwmaZvhMduxoxAz5aybHHaFT/taKe8MmCgjjiBU=;
  b=ewInA9ilQP+pwUL4hbSt6/C1OyRHjrZ7+8KlvJKiRkCcw0OVmK5eAi9T
   Hff6PfxU66rAULbqwACxWhj8Wc2eCYCqgQ4h4lN2GW+sbuomJhnbUI9AZ
   IRnHZI1yiynQq2x+7G3fbpJdQrG1fbDh+xaiZ1raXEnPOZMHSJS22ZuBE
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aKHWpBhcwBw5XC2xOvbHRxNRXBVfQ5nBOTNUtrKAip5/CUsdXHuspzpyTDp6R+WXB7gLgkg9iB
 8iBBrU1bUaEXIuAsEKFJAgxTk/tB5RTR4lmPnm7TbCFc0HIsRrPdWT1772Mrh/qsa4z4dUPWDc
 93Zu2wZw1j3sRBm4dNiPVMGAQH1UmwiOJMnh9dNk14gAHM8hNT1D1x7J56xckZbFzGVu4ChduD
 vtrNZJHaKfQMtYpyVK7xXpRGoW72fZSF4bv0OhV30UsMlRsalxmcIfxeMT8Nf54SZ2fdlNu9tO
 BN0=
X-SBRS: None
X-MesageID: 29065524
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="29065524"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpoyqVL1uTKqrmbBEpJtVF3aqnc83g2s4vx9yI/REzkml5sDRVIBqKHxJyT48JGPqIXO135QyoyfUtW9XO9NVBY0gHzKH1EkiZYigE5Tfn52u+CIUant8jvGkrnMwql7qSBAbgCzi0ojsrcCYZpZvO+kHts+88C8zOb6Ug95RnfDl/PtS3O/aY/cxGPZknQ7lm78nCcat4agG0OKcl/mNaz6GviUutBIGbsrxx1RMoNNlsaSNrhSpvuiyb5bLSyXQ9Xt7BKnbDyO5gFTBpNkzgfcX6JJ92i/JL9O9+5hW1ehU1Ukgx2YkoVuMEDJhEf8TJogeo0buF33d0pxitbxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOHDXwmaZvhMduxoxAz5aybHHaFT/taKe8MmCgjjiBU=;
 b=V7/Q62lddfUzy7x9zuSs3SavoMB0/rembD6UG878TN8d4y4Zhy7KIjj/DQFh91Efh/jFz3+6/qj3eHeZ56d/UVhu/1LefsTgqiL0U2FQ/fSlKXA5oHI55LREYPo0qyr5hULf12Gs1aSlKX0NpCGqa6atFsG35kzj0iRa3NIkzvdn//ZC/lNCHIDt8V/V6SI+8t32c4Rfrrh9TXT2i5PgbaGf2HaTql2YPmCuc1Labctr0qI7Gr/Xa8sUlTCvXGIueUITJR1MiOf9mjfruntCCLNjn6l3+c8nnMwc0L4oaHQBWr+xeJbk5lggec7RK4HsJ0GGhSbe4w08tcmVjJQO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOHDXwmaZvhMduxoxAz5aybHHaFT/taKe8MmCgjjiBU=;
 b=U8mCzBDgQgf335atzXYrJ+A6bNHRErocOlzGswdRjULMxOT5roOv+6ipJ/RYiOrK9uzPaMR5nI4GbrvaO7PAAavwviv5m4inKm8AEFarOhhcCxo398En5Eu+5AbXr2Ohb9jWxzY/jKke1EtQ41cNJtTng6LsW9OmiDgijrq7cHE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Rich Persaud <persaur@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Topic: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Index: AQHWlylRG8SsjpT4JUGR4W/Ewa0YcqmBoNCAgADi/AA=
Date: Thu, 1 Oct 2020 09:55:59 +0000
Message-ID: <63FFD578-F249-404B-9829-687A42360A76@citrix.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
 <alpine.DEB.2.21.2009301321431.10908@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2009301321431.10908@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cec56e3a-3431-47ba-cdd8-08d865f032f5
x-ms-traffictypediagnostic: BYAPR03MB4597:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB45978E675CC19AE2CB73516599300@BYAPR03MB4597.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVxHlbnUmf7+2p5yuMyTROSTO/E30BSF/R5mr7KRYbHLeXnchcwV2XehYX6M0a2baIWDPP3VmpwpNql4odmEfbaTRIvb53R10krE6iWNaxsQrsukoMtaPD64PrfWINKINGZp07wb1YNrSHPa098zo54kBb8f1BNBorIsogqRSZAXmg1oTeB6t25pER0IHCzi+AP+D1oWPA6aRTMApNu8UY/Z218kUgRODGnvNjciKP0df/M0hXHFZa/V79qxxajUIHHvVvHGErzXZlcr1gepkAgKmZG2e0I+Y8PgaFp/i/3QY8JiMXR+6t0a6dtE1364UlvW9HRuWekTbc07qvDaOSrmT4xjgAWhuOn+jI9BNe9Ydlxti2dYQHLCDw+FdE0+xGRC2EAkqGwGLNHUGYcTAA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(2906002)(6916009)(71200400001)(36756003)(4326008)(6486002)(478600001)(2616005)(966005)(91956017)(33656002)(54906003)(316002)(83080400001)(5660300002)(83380400001)(66476007)(6512007)(86362001)(6506007)(26005)(53546011)(8676002)(66946007)(55236004)(76116006)(8936002)(64756008)(66446008)(66556008)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rZ0qn5yT0RIBhVAILUZvGd8W5rKBS6HZQvj6/obaq+abKmN36v6mFck2cPsTKH3+ROtkYdRm+XJtCEPb0QZXqO9T/l6SAxJ9wM8Hf18eGR1oyOyJyH4vBicusFMsSKq+tyjpQgDpslmqg4ivnATSq1kUSs64qDn2fg8aX3mHvO06BtGg6BXc1+6bcqe61Q91JUm++ifZ4G6YKsxQhkJKg5sE8GmHtqvO74fmCct+mLJOH4hxLdXqTMTWlxzCFUCJLilNoSI6kAP6HX1DTJpSzcwbZnjzawsR7/V33GqEulGNjpC/MuHvtJCgVJ/fc0j50g88MXwByHyxipUsNNlVVhdVZcBu0mukS75ULZ3Vy1lPlu/sOVzUMMMuSkKVsbL+cOi43fmzaJs7KQSxBBnmDg8sGVTzSD7eSO4XWiJ2vtKa4L+hXHTFWQPVObqK/2dle4ijAWHJXhXccQ/IP2MCWKvaKZMwK8sDU0oap20EyLrLjQCG/IYTz9je6quKPUXx8WkCsRXWb29IODL+GzMuvhs41DiSLbwHHh6lQVswrYXRLNNyAMCRRyKVHq0DSnxg5gZJAvSJ6MvpZtU9kSDs4QivvcF5I0Q8R4ZUJtNi1WlW0whTvL/sni3g/TLWD/TVYrbvtjqfrruKR7t1yMI1pA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <62D7E47AF8C5A14F8EA682D56F6BF436@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec56e3a-3431-47ba-cdd8-08d865f032f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 09:55:59.3072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYnJIUBCPQjDYESvI70IJx6YduJWaELt/rJ0fUPhjCVQirUk7no/BNSsNhVuyU6pw1meSbAIjoEMzz1bg0mzdmXzOG/QUx/CsUvnfDYfaYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4597
X-OriginatorOrg: citrix.com

DQoNCj4gT24gU2VwIDMwLCAyMDIwLCBhdCA5OjIzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAzMCBTZXAgMjAyMCwg
R2VvcmdlIER1bmxhcCB3cm90ZToNCj4+IERlZmluZSBhIHNwZWNpZmljIGNyaXRlcmlhIGZvciBo
b3cgd2UgZGV0ZXJtaW5lIHdoYXQgdG9vbHMgYW5kDQo+PiBsaWJyYXJpZXMgdG8gYmUgY29tcGF0
aWJsZSB3aXRoLiAgVGhpcyB3aWxsIGNsYXJpZnkgaXNzdWVzIHN1Y2ggYXMsDQo+PiAiU2hvdWxk
IHdlIGNvbnRpbnVlIHRvIHN1cHBvcnQgUHl0aG9uIDIuNCIgbW92aW5nIGZvcndhcmQuDQo+PiAN
Cj4+IE5vdGUgdGhhdCBDZW50T1MgNyBpcyBzZXQgdG8gc3RvcCByZWNlaXZpbmcgIm5vcm1hbCIg
bWFpbnRlbmFuY2UNCj4+IHVwZGF0ZXMgaW4gIlE0IDIwMjAiOyBhc3N1bWluZyB0aGF0IDQuMTUg
aXMgcmVsZWFzZWQgYWZ0ZXIgdGhhdCwgd2UNCj4+IG9ubHkgbmVlZCB0byBzdXBwb3J0IENlbnRP
UyAvIFJIRUwgOC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPg0KPj4gLS0tDQo+PiANCj4+IENDOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AY2l0cml4LmNvbT4NCj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4gQ0M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBDQzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
Pg0KPj4gQ0M6IFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5jb20+DQo+PiBDQzogQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiBkb2NzL2lu
ZGV4LnJzdCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKw0KPj4gZG9jcy9wb2xpY2llcy9k
ZXBlbmRlbmN5LXZlcnNpb25zLnJzdCB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gMiBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUgbW9kZSAxMDA2
NDQgZG9jcy9wb2xpY2llcy9kZXBlbmRlbmN5LXZlcnNpb25zLnJzdA0KPj4gDQo+PiBkaWZmIC0t
Z2l0IGEvZG9jcy9pbmRleC5yc3QgYi9kb2NzL2luZGV4LnJzdA0KPj4gaW5kZXggYjc1NDg3YTA1
ZC4uYWMxNzVlYWNjOCAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvaW5kZXgucnN0DQo+PiArKysgYi9k
b2NzL2luZGV4LnJzdA0KPj4gQEAgLTU3LDUgKzU3LDcgQEAgTWlzY2VsbGFuZWENCj4+IC0tLS0t
LS0tLS0tDQo+PiANCj4+IC4uIHRvY3RyZWU6Og0KPj4gKyAgIDptYXhkZXB0aDogMQ0KPj4gDQo+
PiArICAgcG9saWNpZXMvZGVwZW5kZW5jeS12ZXJzaW9ucw0KPj4gICAgZ2xvc3NhcnkNCj4+IGRp
ZmYgLS1naXQgYS9kb2NzL3BvbGljaWVzL2RlcGVuZGVuY3ktdmVyc2lvbnMucnN0IGIvZG9jcy9w
b2xpY2llcy9kZXBlbmRlbmN5LXZlcnNpb25zLnJzdA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmQ1ZWViODQ4ZDgNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsr
KyBiL2RvY3MvcG9saWNpZXMvZGVwZW5kZW5jeS12ZXJzaW9ucy5yc3QNCj4+IEBAIC0wLDAgKzEs
NzYgQEANCj4+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQ0MtQlktNC4wDQo+PiArDQo+
PiArQnVpbGQgYW5kIHJ1bnRpbWUgZGVwZW5kZW5jaWVzDQo+PiArPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQo+PiArDQo+PiArWGVuIGRlcGVuZHMgb24gb3RoZXIgcHJvZ3JhbXMgYW5k
IGxpYnJhcmllcyB0byBidWlsZCBhbmQgdG8gcnVuLg0KPj4gK0Nob3NpbmcgYSBtaW5pbXVtIHZl
cnNpb24gb2YgdGhlc2UgdG9vbHMgdG8gc3VwcG9ydCByZXF1aXJlcyBhIGNhcmVmdWwNCj4+ICti
YWxhbmNlOiBTdXBwb3J0aW5nIG9sZGVyIHZlcnNpb25zIG9mIHRoZXNlIHRvb2xzIG9yIGxpYnJh
cmllcyBtZWFucw0KPj4gK3RoYXQgWGVuIGNhbiBjb21waWxlIG9uIGEgd2lkZXIgdmFyaWV0eSBv
ZiBzeXN0ZW1zOyBidXQgbWVhbnMgdGhhdCBYZW4NCj4+ICtjYW5ub3QgdGFrZSBhZHZhbnRhZ2Ug
b2YgZmVhdHVyZXMgYXZhaWxhYmxlIGluIG5ld2VyIHZlcnNpb25zLg0KPj4gK0NvbnZlcnNlbHks
IHJlcXVpcmluZyBuZXdlciB2ZXJzaW9ucyBtZWFucyB0aGF0IFhlbiBjYW4gdGFrZSBhZHZhbnRh
Z2UNCj4+ICtvZiBuZXdlciBmZWF0dXJlcywgYnV0IGNhbm5vdCB3b3JrIG9uIGFzIHdpZGUgYSB2
YXJpZXR5IG9mIHN5c3RlbXMuDQo+PiArDQo+PiArU3BlY2lmaWMgZGVwZW5kZW5jaWVzIGFuZCB2
ZXJzaW9ucyBmb3IgYSBnaXZlbiBYZW4gcmVsZWFzZSB3aWxsIGJlDQo+PiArbGlzdGVkIGluIHRo
ZSB0b3BsZXZlbCBSRUFETUUsIGFuZC9vciBzcGVjaWZpZWQgYnkgdGhlIGBgY29uZmlndXJlYGAN
Cj4+ICtzeXN0ZW0uICBUaGlzIGRvY3VtZW50IGxheXMgb3V0IHRoZSBwcmluY2lwbGVzIGJ5IHdo
aWNoIHRob3NlIHZlcnNpb25zDQo+PiArc2hvdWxkIGJlIGNob3Nlbi4NCj4+ICsNCj4+ICtUaGUg
Z2VuZXJhbCBwcmluY2lwbGUgaXMgdGhpczoNCj4+ICsNCj4+ICsgICAgWGVuIHNob3VsZCBidWls
ZCBvbiBjdXJyZW50bHktc3VwcG9ydGVkIHZlcnNpb25zIG9mIG1ham9yIGRpc3Ryb3MNCj4+ICsg
ICAgd2hlbiByZWxlYXNlZC4NCj4+ICsNCj4+ICsiQ3VycmVudGx5LXN1cHBvcnRlZCIgbWVhbnMg
d2hhdGV2ZXIgdGhhdCBkaXN0cm8ncyB2ZXJzaW9uIG9mICJmdWxsDQo+PiArc3VwcG9ydCIuICBG
b3IgaW5zdGFuY2UsIGF0IHRoZSB0aW1lIG9mIHdyaXRpbmcsIENlbnRPUyA3IGFuZCA4IGFyZQ0K
Pj4gK2xpc3RlZCBhcyBiZWluZyBnaXZlbiAiRnVsbCBVcGRhdGVzIiwgYnV0IENlbnRPUyA2IGlz
IGxpc3RlZCBhcw0KPj4gKyJNYWludGVuYW5jZSB1cGRhdGVzIjsgdW5kZXIgdGhpcyBjcml0ZXJp
dW0sIHdlIHdvdWxkIHRyeSB0byBlbnN1cmUNCj4+ICt0aGF0IFhlbiBjb3VsZCBidWlsZCBvbiBD
ZW50T1MgNyBhbmQgOCwgYnV0IG5vdCBvbiBDZW50T1MgNi4NCj4+ICsNCj4+ICtFeGNlcHRpb25z
IGZvciBzcGVjaWZpYyBkaXN0cm9zIG9yIHRvb2xzIG1heSBiZSBtYWRlIHdoZW4gYXBwcm9wcmlh
dGUuDQo+PiArDQo+PiArT25lIGV4Y2VwdGlvbiB0byB0aGlzIGlzIGNvbXBpbGVyIHZlcnNpb25z
IGZvciB0aGUgaHlwZXJ2aXNvci4NCj4+ICtTdXBwb3J0IGZvciBuZXcgaW5zdHJ1Y3Rpb25zLCBh
bmQgaW4gcGFydGljdWxhciBzdXBwb3J0IGZvciBuZXcgc2FmZXR5DQo+PiArZmVhdHVyZXMsIG1h
eSByZXF1aXJlIGEgbmV3ZXIgY29tcGlsZXIgdGhhbiBtYW55IGRpc3Ryb3Mgc3VwcG9ydC4NCj4+
ICtUaGVzZSB3aWxsIGJlIHNwZWNpZmllZCBpbiB0aGUgUkVBRE1FLg0KPj4gKw0KPj4gK0Rpc3Ry
b3Mgd2UgY29uc2lkZXIgd2hlbiBkZWNpZGluZyBtaW5pbXVtIHZlcnNpb25zDQo+PiArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICsNCj4+ICtX
ZSBjdXJyZW50bHkgYWltIHRvIHN1cHBvcnQgWGVuIGJ1aWxkaW5nIGFuZCBydW5uaW5nIG9uIHRo
ZSBmb2xsb3dpbmcgZGlzdHJpYnV0aW9uczoNCj4+ICtEZWJpYW5fLA0KPj4gK1VidW50dV8sDQo+
PiArT3BlblNVU0VfLA0KPj4gK0FyY2ggTGludXgsDQo+PiArU0xFU18sDQo+PiArWW9jdG9fLA0K
Pj4gK0NlbnRPU18sDQo+PiArYW5kIFJIRUxfLg0KPiANCj4gQWxwaW5lIExpbnV4IHNob3VsZCBi
ZSBpbiB0aGUgbGlzdCAoY29uc2lkZXIgaXRzIHVzYWdlIGluIGNvbnRhaW5lcg0KPiBlbnZpcm9u
bWVudC4pDQoNClN1cmUsIHdlIGNhbiBhZGQgdGhhdCBvbmUgaW4uICBBbHRob3VnaCwgd2UgbWln
aHQgY29uc2lkZXIgcmVxdWlyaW5nIHRoYXQgZGlzdHJvcyBvbiB0aGlzIGxpc3QgYmUgZmlyc3Qg
YmUgYWRkZWQgdG8gdGhlIEdpdGxhYiBDSSBsb29wIGlmIHBvc3NpYmxlLg0KDQo+IEkgYW0gc3Rp
bGwgb24gQWxwaW5lIExpbnV4IDMuNywgc28gSSBhbSBzdXJlIHRoYXQgb25lIHdvcmtzLiBQcm9i
YWJseQ0KPiBvdGhlciB2ZXJzaW9ucyB3b3JrIHRvby4NCg0KUmlnaHQsIGJ1dCB0aGUgcXVlc3Rp
b24gaXMsIGlmIHNvbWVvbmUgcG9zdHMgYSBwYXRjaCB3aGljaCBjYXVzZXMgaXQgdG8gbm8gbG9u
Z2VyIGJ1aWxkIG9uIDMuNywgd291bGQgd2UgcmVqZWN0IGl0IG9yIGFjY2VwdCBpdD8NCg0KQWNj
b3JkaW5nIHRvIGh0dHBzOi8vd2lraS5hbHBpbmVsaW51eC5vcmcvd2lraS9BbHBpbmVfTGludXg6
UmVsZWFzZXMsIG9ubHkgMy4xMiBpcyBjdXJyZW50bHkgcmVjZWl2aW5nIGJ1ZyBmaXhlczsgc28g
YnkgdGhlIGNyaXRlcmlhIGFib3ZlLCB3ZSB3b3VsZCBvbmx5IHJlamVjdCBhIGNoYW5nZXNldCBp
ZiBpdCBjYXVzZWQgYSBidWlsZCByZWdyZXNzaW9uIGZvciAzLjEyLg0KDQpJIHdvdWxkIGFyZ3Vl
IHRoYXQgdGhpcyBpcyB0aGUgcmlnaHQgYXBwcm9hY2g6IEl0IGRvZXNu4oCZdCBtYWtlIHNlbnNl
IGZvciB1cyB0byBzcGVuZCBtb3JlIGVmZm9ydCBrZWVwaW5nIGFuIG9sZCBkaXN0cm8gd29ya2lu
ZyB0aGFuIHRoYXQgY29tbXVuaXR5IGl0IHNlbGYgc3BlbmRzIGtlZXBpbmcgaXQgd29ya2luZy4g
IFRoZSBVYnVudHUgY29tbXVuaXR5IHNwZW5kcyBlZmZvcnQga2VlcGluZyBVYnVudHUgMTYuMDQg
aW4gd29ya2luZyBzaGFwZSwgc28gaXQgbWFrZXMgc2Vuc2UgZm9yIHVzIHRvIHNwZW5kIGVmZm9y
dCBtYWtpbmcgc3VyZSBYZW4gNC4xNSBidWlsZHMgYW5kIHJ1bnMgb24gaXQuICBUaGUgQWxwaW5l
IExpbnV4IGNvbW11bml0eSBkb2VzbuKAmXQgcHJvbWlzZSB0byBzcGVuZCBhbnkgZWZmb3J0IHRv
IGZpeCBhbnkgbW9yZSBidWdzIGluIEFscGluZSBMaW51eCAzLjExLCBzbyBpdCBkb2VzbuKAmXQg
bWFrZSBhbnkgc2Vuc2UgZm9yIHVzIHRvIHNwZW5kIGVmZm9ydCBtYWtpbmcgc3VyZSBYZW4gNC4x
NSBydW5zIG9uIGl0Lg0KDQpPYnZpb3VzbHkgaWYgaXQgYnVpbGRzIG9uIFVidW50dSAxNi4wNCB0
aGVyZeKAmXMgYSBwcmV0dHkgaGlnaCBwcm9iYWJpbGl0eSB0aGF0IGl0IHdpbGwgYWxzbyBidWls
ZCBvbiBBbHBpbmUgTGludXggMy40KyAocmVsZWFzZWQgYXJvdW5kIHRoZSBzYW1lIHRpbWUpOyB3
ZSBqdXN0IGRvbuKAmXQgd2FudCB0byBwcm9taXNlIHRoYXQuDQoNCiAtR2VvcmdlDQoNCg==

