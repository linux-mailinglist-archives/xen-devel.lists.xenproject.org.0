Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C7525C8B
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 09:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328270.551262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npQ3n-00064z-Ij; Fri, 13 May 2022 07:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328270.551262; Fri, 13 May 2022 07:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npQ3n-00060b-EX; Fri, 13 May 2022 07:50:03 +0000
Received: by outflank-mailman (input) for mailman id 328270;
 Fri, 13 May 2022 07:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSFi=VV=microchip.com=Conor.Dooley@srs-se1.protection.inumbo.net>)
 id 1npQ0z-0005hw-IM
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 07:47:09 +0000
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b30c60-d290-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 09:46:37 +0200 (CEST)
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 May 2022 00:47:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 13 May 2022 00:47:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 13 May 2022 00:47:02 -0700
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by MWHPR11MB1504.namprd11.prod.outlook.com (2603:10b6:301:c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 07:47:01 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e%8]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 07:47:01 +0000
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
X-Inumbo-ID: d0b30c60-d290-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1652428028; x=1683964028;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ha+S6QZVIMC4KSypJ/PoMugEFPcY4uAaecmyl3QehRE=;
  b=Mw9+j7Q3ecpebeXZRdw2OcZOPQ0hAvmL2Hdja9OrBdnP3WIudYUsbX7l
   1xO1QRb0533pZHfFVBgRNeB3CE6dSzSXQLJHJfHdZcALA8QdYYuHIYmOX
   Ge/fjVkZF7n0JbnBcXu7fo+ypwAvFtchp63aenhVuRj7hm0F9IIVcGZGL
   cs8uQGIHfdERQk9lIXMkQaaA9RlPuu0qTs4YwVqz22+ZZwQYvh7DEvwC2
   hmW3mwXo1GxQLWnc0DuhJ5wwCjMogmDbqlvuwdDwnSdb2elhdTJgXFHqI
   3xGdR8uGH+BkbYBPsWBHP8kj3tDTUzPBTIeTZ7axzhfjtq0XvaSAM9Uq4
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="163534454"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCSjzpcS7HAsXPeUb9rGftPkxaxgATsJTcdPytMHEwDvJV+p8FgApLw7dvx6mHcznm63jaEyGbebgfj53NtI8lUPuhewxHPrs7206PXcS+Lrab6Ev/Z6MjAxORfjMFBA3ZycEfAd086Q19Mv8HZrYKyppycdmIx5roTjDsA2HK54TGX3HSM3chtGp9Xq3qgqdoDLrVDTd9nAnEGgZHNlsreaJSBFADKS3izSHS/8UOy+CWTNaAIOK9vy4Qb8bq430kBlOgqpzit/Shxv1SuIqRXorydl0PX9tzX2vOAScWE4sz/C1xqqFpvVX+9+gffPkk9huuy22KTmw/6GsgGszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha+S6QZVIMC4KSypJ/PoMugEFPcY4uAaecmyl3QehRE=;
 b=dihUw7QjXxmKxTt3HaIElDL9gmtBA60lo5HGdMv2eGOrw51mIEzZRMiMSmaX/AHK5YabqPUOnuu8vJEDOW/cDu4RTZo00HUmOQp/5zkaaJ99EZUMz/qPT8UGlKY523u8wFx6HoErR4BrkOVO7qhtnAPQWfT4sAVAWL8IdfeKzZChsnigaDs+lS1qYFn9q4ZrsQw75opf5yNPrExDiZAS0Ia6ylvsS+h21l2z617PMM4syhmH57zBgl/XPTeq1sWnbYw9oSJAfhMSIvajjayyGh7w0RGoUPIbfK09//xAR4jqsiTzgPqWAdbtnmHS/8rvtlyIdtG9E1Dc2iFSnchsWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha+S6QZVIMC4KSypJ/PoMugEFPcY4uAaecmyl3QehRE=;
 b=n2ip1RhKOgPZlSSfev4XQh2g97AdywLdzsxr0lJ2xpdoXRO4p1Bs0ZKSMjs3kg+hmrtr3xh84eMJ2sYx/DMvJOMgZ0+3nLO1UBL8I06RHOc5O04WI/uJF6Q8/b6iL4ZRlwSSMaNyyb4uO/oLpAMQaehU065CYYAAVPP+DwDsC2E=
From: <Conor.Dooley@microchip.com>
To: <hch@lst.de>, <iommu@lists.linux-foundation.org>
CC: <sstabellini@kernel.org>, <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] swiotlb: don't panic when the swiotlb buffer can't be
 allocated
Thread-Topic: [PATCH 1/3] swiotlb: don't panic when the swiotlb buffer can't
 be allocated
Thread-Index: AQHYZTbP/7RHBCbSm02P2TeeL38cb60ccGmA
Date: Fri, 13 May 2022 07:47:01 +0000
Message-ID: <9ca9706e-7781-12a1-c4c7-ce3d27902ce2@microchip.com>
References: <20220511125805.1377025-1-hch@lst.de>
 <20220511125805.1377025-2-hch@lst.de>
In-Reply-To: <20220511125805.1377025-2-hch@lst.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13c3d6a7-e62a-4867-068d-08da34b4c3eb
x-ms-traffictypediagnostic: MWHPR11MB1504:EE_
x-microsoft-antispam-prvs: <MWHPR11MB150428956027E4B66106C7ED98CA9@MWHPR11MB1504.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LecszsyFTaId80FXtvUrykf6w9quKIjHzgsTVYOGvbfUpER40hQb9KlEpb0J3qv4fZgfBIDEn7iP82TnXv09Ayk82r9Cbp8eedTkIM/FpquneGJiFROquTRK0A70bbeCRyaRR++4SE36SXVxUxDn+jEhMTIdqo1pYn4cdGbAuELGskl1Ex2Rd6t9rHF+MgrAN76RbYmEUYVZWlws9RQKZzPBTo02MX3ZlEKUUXJykPT0/r07StdOiMkEqTzfykit85dpo5qs/HGBI460/v+dEgpAnJbvoIw18XqJoRILUzpWTBbOpzqOR9k7MXAl0BnosVdQqEWaQPRm6sijLQhaJIT1NGcS35B8xsCjyjkNk1FHav7v+KamRp7KPIVYCiUnZtaNg6ulv/ytAHL6YaxgnZ+6UrFgHLQguAkZ6APQDq48jmLscVQ50iR8ZwYZKjOZtDv2s3CiAHX1ZnoQQ1MxBEnDmvUKVmSBiRXKbx9VRwtDV75wC91YcnG/07Q0z0c394dCq0W0nYBfGxfuDg+sAzN4zM1fKQj9wjm+Tc8tWWYkH6QIV4k6fT4bj05Efsw8I3iF0xRXL0U2ywKii5AB4SZPjUvlSRaParVL1VJhAcuh6AYExQZL/f/pmmpzlBAkjOl1MPv+THYV+hRJVY7VElrrVkpFHIEGzNijGophuXWUPra6S2peejIMzqMXwuhVFT8JoYcg48duRV5Py24Ry0mEqtJMuczEmXO9s9j6b0ii9yfho/1+wlesm5HdFoIVbL5FRaUrkz0ZP9QYdAaDYg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(91956017)(54906003)(2616005)(71200400001)(36756003)(110136005)(6506007)(6486002)(316002)(26005)(6512007)(76116006)(83380400001)(8676002)(4326008)(66946007)(64756008)(31686004)(66556008)(186003)(66476007)(66446008)(508600001)(53546011)(86362001)(2906002)(122000001)(31696002)(38070700005)(5660300002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm9xdm15UTQrU3ZLcFhkVkUrOVM0Sko0MG5EVEtGMlRJbHNhRXVWcWRud3FR?=
 =?utf-8?B?Mm9qcExHNTIyQjM3YVZqb0tvck9BNEpJMkpYUGtFMUI1K1RTcG5WMGZWSEwx?=
 =?utf-8?B?UTlkNm1iK1pKdnpubnpDdytNTFBvRVF1VGRNSmxLYlJWb0pKNmFSV1FxbjBl?=
 =?utf-8?B?bEhMQ25qOVN3QnpnNnNXN2E3RUUzdFFnZEpNR0lvWUhHKzRSWUhERTlZcHVq?=
 =?utf-8?B?dzNJMFcvMEFMSm5tWXhqVHR0bkhkWGp3N3Y1MkdESVZudkREeEVyOXMvT2pl?=
 =?utf-8?B?OHNQai9sT0dqMDFxdHgwMGhwT2RXR3JBNGV5UDluaWgycVlwNkt3NkVySEtk?=
 =?utf-8?B?aU9UbEFXbU9PcDJnUjgwek5ZVUxFQkNybXo1Zm8rajRCR28zYzVzNVV6UStP?=
 =?utf-8?B?L21mdS9ITHZUa2hXYVBiOHczN0kyUFNUVUVnRzB0MnVYQ2htTHE2cUlQdk1U?=
 =?utf-8?B?ZGpsaEgzSDFwVG92M1B5REF3dVhCZER1SitUakZHYmU2YXgzVThQWEtQOUlj?=
 =?utf-8?B?QW4rY1dVa0NMWUlZZ3N5SW5kU2Z2MjBZOTFnQnU0cHMydW9jWjYzVEFsSXZK?=
 =?utf-8?B?T2laamROL3VqandHa0U2VFR2WmxweHk2ZmNnQUVoelhoTy80VXE1RGJ3c2hX?=
 =?utf-8?B?Znd4SllYc1QvZTgvZEVZWXRjN0UyQkpabzFPTlpHaE81MlhpYkV2dklaTlZy?=
 =?utf-8?B?bmd0NktIWTdyZlpIU2ZuZGZLQmR6WkRTMGN5NEoyS2dOZWxJTXZBekNhK1dY?=
 =?utf-8?B?cjR0OFVsSkRCTCtnZGVSUU9zdWUza1c4a3hSeU5VVjJrSVdETnBsclBWeUFP?=
 =?utf-8?B?Rnl0SFRoaUNPZWZ4VW5lTENSeU1QQm9QR25hTmJKSjdLNVoxZGdoNitubVZ2?=
 =?utf-8?B?eDV2eHpPZnRSaWwrS3ZNRDJ4cHRWZUlTdUNCeThOWHBONUtyb0VpTE1iczFQ?=
 =?utf-8?B?WURXSGVBa3F0dlpaekd1d1JxSkwrYzVKWUhSUGY4Q2tCT3VxNkZySlp2dmta?=
 =?utf-8?B?RDNzYzBwZ1JDQWVXWmhNeGpWc21pNjVrN01oNSsyQzN2YW91Q0ViVjRmL3ZU?=
 =?utf-8?B?TUMwcmx6d2I5NFhudkxrWGZiUHRqZDQ5S1dLQU40Zi8zUmJaczNPck02aDhz?=
 =?utf-8?B?RFIzcG5GV0kyQW9mN3pieUE2R1JZb2pGOFlRSEh4RnY0OWVkcVZjU2xzTlNr?=
 =?utf-8?B?UGhhV2wvdkRtbGdVZzdxSjlwK3ZoaHRKbDg3UWV1OXkxemgySkZyb3VHUm9m?=
 =?utf-8?B?VEJsemNMZ05TUHVQSHpKTysxeTJkaVVwMTNkSTJQNWVEdmV5ZUE1NHNqMFQy?=
 =?utf-8?B?WkdxY2p0SVJtNmFzT3V3cGZ3bkNNZXJuRUR0SlBxc24yREVKYlBHRTJ3c0Rz?=
 =?utf-8?B?SDcxWWdaQ1FvUERIU2xZM2dGb25zaFRjMTdHMDMrcVYwcEI4R0RkY0x2anNh?=
 =?utf-8?B?R1NyQmJRVFpKL1FrOEQ4aTRDOVJwUXdqYjV4UDlwbnBiYmlHcE14Ym9vRmU3?=
 =?utf-8?B?NGNHSjFQR3pLdnZiWjJRMTdSeURQU21TUDMwV0JnNHVzclB2Z2JRemUxRnl4?=
 =?utf-8?B?RHdIbWI0N3dZQ3VBVlFNUkZDaS9oZWlVV21NWTJ2Z2JWWk83OTRaMjFYQUps?=
 =?utf-8?B?SDFhRURhdmZjeDdkU1lwTFFSZ0pPZGtEWCtZZHNYRGhFZG02ZjFCREZMQ1BF?=
 =?utf-8?B?VmJNdmowc0gyR1lTbkJXSkcrbXArbHh0Yks3QzExZGt4d3paQlArZnBqMWNV?=
 =?utf-8?B?TXBNTjk0MVg2Q0ZaMFB2cnVBNWhRWUh2WW1nMkI3YWcyZ3pDL3FYb01rb2lG?=
 =?utf-8?B?RTZLS0lLcHNBdVlnYUV6dGJKbTBmOGFmNUFmWkFzblE1ZGVlTHRqQWwrVmwz?=
 =?utf-8?B?NWN0Zm8xek9McXFQdmhQZlhhVlllaHNjeVJ6U0xNY0FOYVM0aXEvOFByK0py?=
 =?utf-8?B?T29pNmI4aHcrUGhNTEtERWltQjZoMzFRNW4wWFQvWi9hQTRhaVlLamd4c1c5?=
 =?utf-8?B?Tnl2b1FCcXRaV25jMkpDNm1iMGVZWHlJZEo4bmhQZ2pVdEpmQlVmNlV4b3Ev?=
 =?utf-8?B?RjFnUjZjQ2dMV0FDSWxjRi9kcFJULzY4SWhxbCtJcXAyZk1XSDl2SGxQMDZT?=
 =?utf-8?B?VWszQ3dXRGpPdnQ4dzBGc2ZiZmw5NUNoaWtydGYyazErYmtXZzdnSlpVOC8r?=
 =?utf-8?B?ekMwK3lSU3dUMEZiVm4zazcvNVZBajFIUHVBNDl3NE0rMi9ZU3ZKYnZUMUZF?=
 =?utf-8?B?Vk9pQWxkcTg1WDlCNzFJV1VaMkVFdWFOZWgxaVFCN2d3Z1hiS3Brbjd5K3Nw?=
 =?utf-8?B?bys3aFFNV1Z1OC83QjFRS2w4ZWlzc0VXZVVXaCs3VU5CTUZ2TkFYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21FF77F77B084A45A1819E282C33BEC5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c3d6a7-e62a-4867-068d-08da34b4c3eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 07:47:01.1751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vMn8YS+NLYs6oJ34VwGCw9qth3U92k/zhjr/iNCedbz5AyxGJs3Rdxw9xfxUbvaL4YD+3gh7zXsxpXZKRO+uZK6gcxMZe/10tXZgbHNYJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1504

T24gMTEvMDUvMjAyMiAxMzo1OCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gRm9yIGhpc3RvcmljYWwgcmVhc29ucyB0
aGUgc3dpdGxiIGNvZGUgcGFuaWNlZCB3aGVuIHRoZSBtZXRhZGF0YSBjb3VsZA0KPiBub3QgYmUg
YWxsb2NhdGVkLCBidXQganVzdCBwcmludGVkIGEgd2FybmluZyB3aGVuIHRoZSBhY3R1YWwgbWFp
bg0KPiBzd2lvdGxiIGJ1ZmZlciBjb3VsZCBub3QgYmUgYWxsb2NhdGVkLiAgUmVzdG9yZSB0aGlz
IHNvbWV3aGF0IHVuZXhwZWN0ZWQNCj4gYmVoYXZpb3IgYXMgY2hhbmdpbmcgaXQgY2F1c2VkIGEg
Ym9vdCBmYWlsdXJlIG9uIHRoZSBNaWNyb2NoaXAgUklTQy1WDQo+IFBvbGFyRmlyZSBTb0MgSWNp
Y2xlIGtpdC4NCj4gDQo+IEZpeGVzOiA2NDI0ZTMxYjFjMDUgKCJzd2lvdGxiOiByZW1vdmUgc3dp
b3RsYl9pbml0X3dpdGhfdGJsIGFuZCBzd2lvdGxiX2luaXRfbGF0ZV93aXRoX3RibCIpDQo+IFJl
cG9ydGVkLWJ5OiBDb25vciBEb29sZXkgPENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4NCj4gVGVzdGVkLWJ5
OiBDb25vciBEb29sZXkgPENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPg0KDQpGV0lXOg0KQWNr
ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQoNCj4gLS0t
DQo+ICAga2VybmVsL2RtYS9zd2lvdGxiLmMgfCA2ICsrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEva2Vy
bmVsL2RtYS9zd2lvdGxiLmMgYi9rZXJuZWwvZG1hL3N3aW90bGIuYw0KPiBpbmRleCBlMmVmMDg2
NGViMWU1Li4zZTk5MmEzMDhjOGExIDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvZG1hL3N3aW90bGIu
Yw0KPiArKysgYi9rZXJuZWwvZG1hL3N3aW90bGIuYw0KPiBAQCAtMjU0LDggKzI1NCwxMCBAQCB2
b2lkIF9faW5pdCBzd2lvdGxiX2luaXRfcmVtYXAoYm9vbCBhZGRyZXNzaW5nX2xpbWl0LCB1bnNp
Z25lZCBpbnQgZmxhZ3MsDQo+ICAgICAgICAgICAgICAgICAgdGxiID0gbWVtYmxvY2tfYWxsb2Mo
Ynl0ZXMsIFBBR0VfU0laRSk7DQo+ICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgICB0
bGIgPSBtZW1ibG9ja19hbGxvY19sb3coYnl0ZXMsIFBBR0VfU0laRSk7DQo+IC0gICAgICAgaWYg
KCF0bGIpDQo+IC0gICAgICAgICAgICAgICBwYW5pYygiJXM6IGZhaWxlZCB0byBhbGxvY2F0ZSB0
bGIgc3RydWN0dXJlXG4iLCBfX2Z1bmNfXyk7DQo+ICsgICAgICAgaWYgKCF0bGIpIHsNCj4gKyAg
ICAgICAgICAgICAgIHByX3dhcm4oIiVzOiBmYWlsZWQgdG8gYWxsb2NhdGUgdGxiIHN0cnVjdHVy
ZVxuIiwgX19mdW5jX18pOw0KPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiArICAgICAgIH0N
Cj4gDQo+ICAgICAgICAgIGlmIChyZW1hcCAmJiByZW1hcCh0bGIsIG5zbGFicykgPCAwKSB7DQo+
ICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfZnJlZSh0bGIsIFBBR0VfQUxJR04oYnl0ZXMpKTsN
Cj4gLS0NCj4gMi4zMC4yDQo+IA0KDQo=

