Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EBF321420
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87871.165102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8QA-0000hi-IN; Mon, 22 Feb 2021 10:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87871.165102; Mon, 22 Feb 2021 10:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8QA-0000hI-F7; Mon, 22 Feb 2021 10:26:30 +0000
Received: by outflank-mailman (input) for mailman id 87871;
 Mon, 22 Feb 2021 10:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lhyD=HY=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lE8Q8-0000cu-DW
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:26:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b01b657c-0ba2-48e9-bf9d-c7d7201ad1ef;
 Mon, 22 Feb 2021 10:26:22 +0000 (UTC)
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
X-Inumbo-ID: b01b657c-0ba2-48e9-bf9d-c7d7201ad1ef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613989582;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9l6X9hjC3QSh7jnLSXYPmGofXv0ZNx5xjhXcPkar+vg=;
  b=aqIekZEXcqXusnHxTi9OUSxVuhTO/67vEL0/JjtxotdTAMQQEd/LJY6r
   KZY+ymGa92GRtDJ8g11lTQ6pWlY/7G36A9aKfXzbfWZ9a8D0L9NZMuItm
   5YdjW/9U+InvqtIM+A5TUvx+cAcksUwGm8WuNdQCfwbdbqysbMFc2bV1c
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5iGxB753N93ImTWnqi/8yCjPpXLY2KCzUrJJfgCkkVEiSIttW286/yoKNxDzAJhzg0tFMuoedZ
 ggwrdJa4D8DAWkKdU2zXit4GkSFWioJRpJCKeFMAD0oPPRVwk8x57PCT/NmyfbjuORc62KxmkI
 643++tH0WsBQIVcs5O6Cyl3z7nSA5K9mexfiFEBACkgutKHMAiFM8UOipQJ9/n22F7IO0ekhWs
 X/n429h89SkJw64QbGNBVKN2Lyhx7OjQSatny3icl17Fikl3ihusquHwdlxmA2+4kzcsbho2Hq
 +JI=
X-SBRS: 5.2
X-MesageID: 37914844
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,196,1610427600"; 
   d="scan'208";a="37914844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3sd9fRCJ92rfaHwXZlewEVWPVozZtdB3HynYZ7JteC8h0pDw6DBwo9KNC3+R7ob/siUbu1ZsUBGy5gubE9TTiX2xNhiXTHZOIFDMhz3D3aTt42FXlGqI5qv1xv5YZbXykbSn4Hv0EUXvtInn6ZjyhtHQkWfr0j/WU2HgaQtQW8LPLpQm9h0WN7jSjUZXuWkGiDvYggZs9Iy+rPvT2C/n4O9E1t9I3puTWFJOJ5vgsaSBooWlGa5N5man1xIWoD38cHYWBzvBb7GlGXiaj9dyGqGDmPoPwpFE9F9bgKgzA7cGfbz5T9R1SBZ/k6NSxsalGee6GPRTju6nvTRUAv9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l6X9hjC3QSh7jnLSXYPmGofXv0ZNx5xjhXcPkar+vg=;
 b=nRmGmfsBdLarIB/BBTCaPNn3APBBEwlrVRQkehjLDmYttCGSvtpyJ2ypge10rumdCw6ERmmJwDzBbP6h2Srxkz5eW+lOHXsnGXhfiMxaT+csbA0K9ZLs4Ok1YDtTeJ3TZHO8goOtwj8rNhyN94k/bVkKZaGQJyWF8qlnxe8LCjT0Vs7KHbHl+tuoNcAgdMvZDf55QdkAA7hCp0nL1zzBPdDHEUxTa2Y2gUSyqeOKwoOQdNFk+LRcXxsPBiZv0KINv0i0OBSsekYzgNVwFzI5TBpIUKWzNSrpdSzojZH3jzYHpqnmU8YZBtsEG49JjplrLbyo3yoxXW5WcWRyXx7/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l6X9hjC3QSh7jnLSXYPmGofXv0ZNx5xjhXcPkar+vg=;
 b=fiXV+0UMBON9t//GCfVb4SyTaQlWWpkwJCltR6BMldVzbrBkqj3iOvgLKYwh8B5Cd/gYluVp92TYt/nBSaNqli+MVXJrwflkYDpX9qOwFCx9M8/ck9qeEzgxwvqxrqB+uIWdb5CwEgZOtMJ87DQQdRnFCmYOq0gh+R5xwTesBXg=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, "Julien
 Grall" <julien@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page
Thread-Topic: [PATCH for-4.15 v2] VMX: use a single, global APIC access page
Thread-Index: AQHXCO+iqgVfJXeEMEKij3zVyzL30apj+G+A
Date: Mon, 22 Feb 2021 10:26:19 +0000
Message-ID: <8B51B3E9-901A-491D-A54E-1F67641D03F0@citrix.com>
References: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
 <dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
 <24623.61403.440917.434@mariner.uk.xensource.com>
 <dfdd4440-3c37-8cb5-b7d3-a86b7c697b2e@suse.com>
In-Reply-To: <dfdd4440-3c37-8cb5-b7d3-a86b7c697b2e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08a34af9-8bd8-41fe-3fc4-08d8d71c4b47
x-ms-traffictypediagnostic: PH0PR03MB5798:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5798902BCE2FA9AA6AA097E799819@PH0PR03MB5798.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iUSps1jFWDJ/9Jl12UIxdVIwzDBF2IfKSVqqBNf6xiiWy4BydRl2lIuqH6kUQr2onKedPGou9cfoT+35NHwzAN5zQlcWI+sK36dNg8S/Db09S0vNubIpYol/T7u7iPEU3hGVdYOFOpOS1pNQmlnae3PGtENwpAEYefJ3f4o0F06OnIsOHOlb8OOfMI2YW6RO4gSA1P7LPhJYbwhUVicFSZmTb4lfLUhgFfAYa1/xoJBO+vVyAvvNdOAC+ScswoGeR/EE39Vc+hVA3oHnk0KwUb3g+xM90DlZDShtavBoHBjjFndozGdRkRVy8MwUBJY582t/HOEny3hGEnp3o1dyhXicy3CuHHdDK//oiU1Oo06gSd20dVjXclunrD4AhE6sozrHOiifiWzxaBYigOA5QIcqiooYcC87G+0N5Em8FcPMGkEOS0LUJwhbWNOTrqJKF+qUUSDTLBsZo5KFvj1veL2iSTExP5TA9Eh2I8VmK/cMAm2K24rKCBuw15ASVK7jAxVKxZrJdp3oh2lBP877l1Pmx2bBnGT1sILG+QC7EZ8KiPQE8j27F+7VvUnFgGWVnRn+3tJj/KLgwLCHCTxQ/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(5660300002)(6506007)(2616005)(6916009)(107886003)(33656002)(53546011)(66556008)(478600001)(8676002)(66946007)(54906003)(66446008)(186003)(71200400001)(64756008)(26005)(6512007)(66476007)(316002)(76116006)(36756003)(8936002)(6486002)(86362001)(4326008)(83380400001)(2906002)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z0NldXFEa29jc0g5RGpzMEJyUXdROHdDaTJOcGxjNFhFSFY2ZFd0dU5oNzZr?=
 =?utf-8?B?NmF0SWtFUlp3VUZaRGVTa1ViWkV5S3Z6THJXbFQvRjdpREN3SVB6aU1ZcUs5?=
 =?utf-8?B?Q0RzRkdLeUpCRkZGODA1bnFVeDVBd3ZTQlNjRkd0WWxhSUF2ZElQemMzcThp?=
 =?utf-8?B?ek9jR1dTU0pFdHFJN09Ba0dqam5uZFMvYjU3Z3IyZG5tdlkrVG14Ukh2V2sr?=
 =?utf-8?B?U0h2ZmNEZjcvbGw3ckhwdkJSbm10U1JDcHJlTTM3TFBrcUJ4L051SWpNbHo0?=
 =?utf-8?B?ZVRyckNEN2E2NEtvSEx4R0pvWkhEQzlxVXZVMWV1ZkpQZUhYL0I1QXZ0eGFD?=
 =?utf-8?B?dzkrcE43eW5FOVZXQVUwNm55WmxXTzEvL3A2UWxjQis5MDdYTER2a2VYR3Fw?=
 =?utf-8?B?azNlcmtIcCtvbUNjZ2lHY3lQRjRoaitZUDdMR3l6WmRRQS9WVmlCOUR0amN6?=
 =?utf-8?B?ckFUTEZPenJ5TVU3N2owaVhib1FNdHA2dThjSzJhNEVhUVRVR21IZzFKZWdB?=
 =?utf-8?B?UlBsRjVMaER1dUl6S0doeFlLTDJ6eml2QkwvL1RWS1UwcmQ3LzlEb0VOUlZO?=
 =?utf-8?B?d0pUTVVzNEVmTnFReEorS0FNcnlobXJTcFVMTWJmWG8rS1hTU3FvK1RkQkZq?=
 =?utf-8?B?WUZXajlXbmNQSFQ3WmRNVWxHYXRSUGlqSmQ1cERnNEpEMWRveXh3bkpOY3NL?=
 =?utf-8?B?cjQxa3hCakp3MHE3TDl6emZZTG9GUlVrTGpqUDRuSFdoQVd2MlRIMDF5blJI?=
 =?utf-8?B?YyswVCtXT09KeUhWN1lqUFp0VWVBb29tcGhCVis2WVcwSmVWS0Fhb0JLMHhq?=
 =?utf-8?B?N1hlSVFsWmF1MXlUR0xOTlZOOTBGdlVNS25RVmc5a2VYUDg2WUlDRkwrWU1E?=
 =?utf-8?B?aDRYMXpkNDlzWFE5a3BPczdwR0ZSN0ZPMUVBWit6dnZEeklBVTRHM1JBanox?=
 =?utf-8?B?UHhQc0FmWHkxa0s3bEFwb2JTcVhQRzg2bE5TM0V2MmtScmhSdDNpdXpCNEhU?=
 =?utf-8?B?NU01SmxQcWtQTW9KeEdvZlFNUFRjSER3dFJZS0tzaUd6NkVjNG01SVRxSG9G?=
 =?utf-8?B?eFNiZG10OWtTYUVTenlTc1RCdjhodjF4TlVOOWtRU0FUWFdMLy9LSCsxUTZ4?=
 =?utf-8?B?K0ppT3RidWhFSHZocWZlYUVscEFWTHBMcXhsbDJpdmxNckczSHd0VERqcFZz?=
 =?utf-8?B?QkpDZmd4d3ZURm9FMkJTYUFqOHBXYnNWbEoxZHpWbG8zZHhGbWZoVXhETVhK?=
 =?utf-8?B?cnErVWtrYXo0Nk1LeXovQnlFUENtKy83VXV3MVR3OFllK2dtWWJjSzVacHBw?=
 =?utf-8?B?ZlVOaDBFY21ZS2NTeFR2T0tLZllIcGo0dmZ4dHlXK09wTWdNYkdWMW4veHVm?=
 =?utf-8?B?TGJ1czVCYjhUTDViTkkrak5VZGxYWHN5elBqYVVLVEdCMjdEZnlSa0I5WDFr?=
 =?utf-8?B?SzZ2QzRYcnA0VDJvMXp6dnFVWmhsL1YrMUluN1Q1dGpmVmR0dWxYcWtjZEtX?=
 =?utf-8?B?WVhoRlY3R0tqRjV0UTB2T2ozZ3lCY1FxRFJSUGxFS2NXYzlMQWxHRll5TWhm?=
 =?utf-8?B?N2dPTytDQXBPUXVsYVBOcFFJcEdWeUN2M0Z5WGtEeS8rMVJXMjd1NVZpWEF5?=
 =?utf-8?B?Z1pSSU1YTjZWb0lPOGQvS21LKzQ1R0RhNVNPaVozTDdoYy9remQ1TXdpODZG?=
 =?utf-8?B?RkltQTJKYzdFQXZld3hReCtzVk1QOFp0OExQb1FpNjFGVFhuWFdoejZOa0o1?=
 =?utf-8?B?TU5ybXBlWVByUFZZQ3JEc2tOYTlNRG5RUG00T0JRTExVcTNNVXF2cUIyMm1P?=
 =?utf-8?B?NE42TTJJTldzeU5QaFllUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A49D2832AA0F274C8736843B1F8EBC56@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a34af9-8bd8-41fe-3fc4-08d8d71c4b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 10:26:19.0720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgvVxHRF1o3bFJJ/hs5gac7m3cFPCSe+Ys4GaiMckvrxB0ywvGQSUi6lNk9KzIhqZAGBZM8GcRPua4VIlTLa832sdOlt16heM6V4MPRstyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5798
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDIyLCAyMDIxLCBhdCA3OjUxIEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMDIuMjAyMSAxODowNSwgSWFuIEphY2tzb24g
d3JvdGU6DQo+PiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1BBVENIIHYyXSBWTVg6IHVzZSBh
IHNpbmdsZSwgZ2xvYmFsIEFQSUMgYWNjZXNzIHBhZ2UiKToNCj4+PiBXaGlsZSB0aGlzIHBhdGNo
IHdhcyB0cmlnZ2VyZWQgbm90IGp1c3QgYnkgSnVsaWVuJ3Mgb2JzZXJ2YXRpb24gb2YNCj4+PiB0
aGUgZWFybHkgcDJtIGluc2VydGlvbiBiZWluZyBhIHByb2JsZW0sIGJ1dCBhbHNvIG1hbnkgZWFy
bGllcg0KPj4+IHRpbWVzIG9mIHJ1bm5pbmcgaW50byB0aGlzIG9kZCBjb2RlLCBpdCBpcyAtIGVz
cGVjaWFsbHkgYXQgdGhpcw0KPj4+IHN0YWdlIC0gcGVyaGFwcyBhIHBvc3NpYmxlIG9wdGlvbiB0
byBzcGxpdCB0aGUgY2hhbmdlIGludG8ganVzdA0KPj4+IHRoZSBtb3ZlbWVudCBvZiB0aGUgc2V0
X21taW9fcDJtX2VudHJ5KCkgaW52b2NhdGlvbiBhbmQgYWxsIHRoZQ0KPj4+IHJlc3QsIGluIG9y
ZGVyIHRvIGRlZmVyIHRoYXQgcmVzdCB1bnRpbCBhZnRlciA0LjE1Lg0KPj4gDQo+PiBJIGluZmVy
IHRoYXQgdGhpcyBjb250YWlucyBhIGJ1Z2ZpeCwgYnV0IHBlcmhhcHMgb3RoZXINCj4+IGNoYW5n
ZXMvaW1wcm92ZW1lbnRzIHRvby4NCj4+IA0KPj4gR2VvcmdlLCBJIHRoaW5rIHlvdSdyZSBvdXIg
ZXhwZXJ0IG9uIHRoaXMgcmVmY291bnRpbmcgc3R1ZmYgLSB3aGF0IGRvDQo+PiB5b3UgdGhpbmsg
b2YgdGhpcyA/DQo+PiANCj4+IEkgZ3Vlc3MgbXkga2V5IHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhp
cyBjaGFuZ2Ugd2lsbCBpbnRyb2R1Y2UgcmlzayBieQ0KPj4gbWVzc2luZyB3aXRoIHRoZSBjb21w
bGV4IHJlZmNvdW50aW5nIG1hY2hpbmVyeXQgLSBvciByZW1vdmUgaXQgYnkNCj4+IHJlbW92aW5n
IGFuIGludGVyYWN0aW9uIHdpdGggdGhlIHJlZmNvdW50aW5nLg0KPiANCj4gSWYgYW55dGhpbmcs
IHRoZW4gdGhlIGxhdHRlciwgYnV0IGxhcmdlbHkgbmVpdGhlciBhZmFpY3QNCg0KRG9lcyBpdCBh
Y3R1YWxseSBjb250YWluIGEgYnVnZml4PyAgSXTigJlzIG5vdCBhdCBhbGwgY2xlYXIgdG8gbWUg
ZnJvbSByZWFkaW5nIHRoZSBkZXNjcmlwdGlvbiB0aGF0IGl04oCZcyBhbnl0aGluZyBvdGhlciB0
aGFuIGEgY2xlYW4tdXAuICBJZiB0aGVyZeKAmXMgc29tZXRoaW5nIGVsc2UgdGhhdCBuZWVkcyB0
byBiZSBjYWxsZWQgb3V0IGV4cGxpY2l0bHkuDQoNCkl0IHNob3VsZCBpbmRlZWQgdGhlb3JldGlj
YWxseSBtYWtlIHRoaW5ncyBzYWZlciBsb25nLXRlcm07IHRoZSBjdXJyZW50IHZsYXBpY19wYWdl
IGFsbG9jYXRpb24gaXMgdXNpbmcgc3BlY2lhbC1jYXNlIG9mIHRoZSByZWZjb3VudGluZyBydWxl
cywgbWFraW5nIGl0IG11Y2ggbW9yZSBwcm9uZSB0byBiZWluZyB0aGUgc3ViamVjdCBvZiBhbiDi
gJxvdmVyc2lnaHTigJ0uICBCdXQgYXQgdGhpcyBwb2ludCBpbiB0aGUgcmVsZWFzZSB3ZSBkb27i
gJl0IGhhdmUgbXVjaCB0aW1lIGF0IGFsbCB0byBzaGFrZSBvdXQgYW55IHBvdGVudGlhbCBidWdz
IGluIHRoZSBuZXcgaW1wbGVtZW50YXRpb247IGFzIHN1Y2ggSeKAmWQgY29uc2lkZXIgYW55dGhp
bmcgb3RoZXIgdGhhbiB0aGUgbWluaW11bSBuZWNlc3NhcnkgdG8gZml4IGEgYnVnIHRvIGJlIG5v
dCB3b3J0aCBpdC4NCg0KIC1HZW9yZ2UNCg0K

