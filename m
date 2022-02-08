Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18814AD433
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267734.461481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMKu-0004Iq-Tw; Tue, 08 Feb 2022 08:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267734.461481; Tue, 08 Feb 2022 08:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMKu-0004GW-Qc; Tue, 08 Feb 2022 08:58:56 +0000
Received: by outflank-mailman (input) for mailman id 267734;
 Tue, 08 Feb 2022 08:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TmAy=SX=citrix.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1nHMKt-0003dP-Tt
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:58:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56beed16-88bd-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 09:58:54 +0100 (CET)
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
X-Inumbo-ID: 56beed16-88bd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644310734;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KPqJWwlmSdJnpx/V+aN+IcuNCswiRiSX4GL66+bs5lU=;
  b=feCm762DA/QeXMtapjPAQK1qTU88KURWY59NjmScDFRCjem1TFKIIKDy
   ynXuiN5EQswvY7ns73ysKxmE3B2A1+DOv7vyl9cimGiHbeOsOFIG2BVIW
   7kKOrYNXH5aa5PAE4U5EDFqPcEA1TJn+/s2dplXexOPJv2j1qHEJY7L44
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KsfmmoQRs6pvMOzWaltaPrKXYUiUbkqYJ+zrxcqQirnFdwo8zIctL/p91fybv/8yT15OiECrO7
 99k+zTk+M54HD7n9mnk2dcxlW+2oDnVmdysPpR8urubxxbnLAsmQV5rAXMfqrjHEyuHiwiduMj
 vPc3WGm3MnATOFUzijKZto/fhD875+2QbzmziN2UocTOt/k7yyhVzXU447rqNSRDb3XdhbDP3G
 hlNdNbCcA8UPv+rWDgbLCv5l9FDxjNUjhAZg4gIMe6QGssI44FrSRFHlvSapMP3nnMa7ZXZ+pn
 qoHSt4Aka1lbgJ6qEnald6Lt
X-SBRS: 5.1
X-MesageID: 63624584
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2/rtbq+mRzM2tECfUMq+DrUDwXiTJUtcMsCJ2f8bNWPcYEJGY0x3y
 GodWGzUMqzeNjSgKo13O9+3/R4E78TXxtdjGQZlrig8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh+l
 NJphIHzTz53P4qUu8swXwYIDBhXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwoLNPqJ58es3cmyTDfAfcpaZvCX7/L9ZlT2zJYasVmQ62AP
 ZZEOWYHgBLoMhxkIkstLMkFxsyCikH8MCddiAqTjP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqum+vOkCXTSI8UUrqi+ZZCvlqXwWACDQwMYnGyq/K5l02WVspWL
 gof/S9GhaQ76kGDVNT2WBy85nmesXY0RN54A+A8rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf/LqJqTK5OQAOMHQPIyQDSGMt4db5p5oopgnSVdslG6mw5uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRqj+p/tfxN24DyJX0X9zSxUaJH1eLWBvA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyua/bbWS0bUpHWsB4qm/zoyLLkZV4vWkmTHqFJProbtMAj
 KX7nQpKrKFeM3KxBUOcS9LgUp96pUQM+DmMaxw1UjasSsUrHONk1Hs3DaJ144wKuBJ9+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jebHNSfMF+ZfaQDmggUFAESs+lS9z
 jqiH5HSl0U3vBPWPkE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNb4h9ihTFXJ3Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU5/YXa0UF2+Xom91gFuUhNUKSSlHTDmmZkKNSDM+Y4RhV0rO/NrldRHo7y4AEmy8ss5Wn
 lFq/lqzrUMrS1swAcDIRuioyl/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxaaVVnFtDv4dmPaxsyKYyu4nmq7NAl1w2F3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZq8QlALJQcjYuCS7t0um2HfvaYvPUH3xC5r577bA09cCAaB1X5GJ7xvPYJ7n
 ep44JwK6xaygwYBO8qdinwG7HyFK3ENXvl1tpweB4O32AMnxksbPM7ZAy7yppqOd89NIg8hJ
 TrN3PjOgLFVx0zjdXsvFCeSgboB1MpW4B0ankUfI1mpm8begq5l1RJcxj07UwBJw0gVyOl0I
 GVqaxV4KKjmE+2EXySfs7RAwz18OSA=
IronPort-HdrOrdr: A9a23:6gVpIaAnwc9wmg/lHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63624584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtRZFmzWv7z3dnnNMm6pQt7ACv2fuCftU/oZd6CA4Tygqz9qVBC+C1Me27NO3l3uD480TkVYjDXrMIwD5f9pZdqRqCgfL1M/thNL99YrtAJ2A3KsQ/hv5qLptvKCO8y0B9eDySbdH6z/nJ7RFJtOO2we7/XfQuZld6BiimrJfNWMYaaZNVSnjbvCpDUS3x57PXv3vRrWBLf7AMiCkoAKYWN0nPstSctiRw+RcxHR3kOsN0thOonKdo710fg5Nr5EGjoghDcYh8Le6zs/vKU34s+2jqUB6cb6prs/a3IyiqUoiWvYgmh+lQMhxO9U+QI9jcGOWcTxL+LXiX6LkjtBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPqJWwlmSdJnpx/V+aN+IcuNCswiRiSX4GL66+bs5lU=;
 b=N2SodKpmzRgC9YuqmDbzqJqEpgqg7nUR0+SLFxXt6wjkki4QmR9KtLYyohqkra8KAOBMN2uWr2azOOyoul6kipIXCsIBgVTOlavTDWDNIfS+Bp87dlkvlWPompDXSSghSeGj+kLJ5H7kl092tuG7TDqBMmrknNse5BW8Xt2oMwSS5ttCNql5NQD4fYDU0W+2ANSa3kZK/3DLkYwApkmSUKeZcON0BGiDvZcx1xjphtW/ujm+ZAVVhsA/k2Se7Zpd1uqOsS0Ecy1XDKtQsLeLSRjlm57q1LriENCHtC42ieKqurx9woXPC7teDt5GApw2LqOP18CjhGVei8mGDqSyJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPqJWwlmSdJnpx/V+aN+IcuNCswiRiSX4GL66+bs5lU=;
 b=uTREwKehxRtkea71P322lXcvt5SWSmV5JNmNf4+072G50tu63h+Gr5KYzaeObH6MdSKgGQ3kv83UDgf9Bu0ct1eYYFGebZZHL1ch6esbb5pvEoKoR8S40MrAC9HKAuYdREonangy6NHbUWZ/l1E51hYCXmXpuZVVJPnhYCgaBbA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, David Scott
	<dave@recoil.org>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Roger
 Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYHE+boVbNzdga3UeMIxC2+V/CvKyJW4wA
Date: Tue, 8 Feb 2022 08:58:49 +0000
Message-ID: <4DD3528E-0B3C-47C2-A037-FFE821D448E9@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-3-jane.malalane@citrix.com>
In-Reply-To: <20220207182101.31941-3-jane.malalane@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c33cd8de-eea3-4c46-5311-08d9eae138fe
x-ms-traffictypediagnostic: BL0PR03MB4082:EE_
x-microsoft-antispam-prvs: <BL0PR03MB4082ACE6A2958F1891012725F62D9@BL0PR03MB4082.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: veGqc6MmOGbRe3gC5+zT8c+l93T/94DQhJxLt7X9zKNc7aXH/RG46E9AXhHjpKrZq11k1/MBgZkpV+gtvFAj+iFb8kvtmePob2IQNNcrnvJqO5gNRcAmMDZ6t4YTezyiq6QfxLEUpYzsfYPG5mlQS+byl3GCXzwmKFnIKJERPAhBVdJ5tDb1j94IxrL3JFtLe0dC6kNpDF8xHwaHAZbGtrbwHP0OI8s5C7PtZRMfAuzj/mBoAptt6qN36OPo9Xldk9f09qOpdHvZFyk2lqkWMH+N8DMVhr8Pb8G0Wusbm+NDWRkdtoyRFYKJh8tS6IkTxgHmRUJbX+6iBQ1B8116a8P7+n5XEh4UOcGUQDrzAFEqFiMaWvdB3b3D3HjgUHQtiGXIoLTCSoogjPLsfhG1bCNulCNrqyrRJOEXsRfakJ1HccCd1hWryQvzENLPUAU0gUzdPKUtkQq4BOKRCb399E3wAoz6OMvIFF0lnSdO74gfbrpfGclD0l+QKSNOW6+VauFIhcQqXiVvR8cA1UG7MBAZzNoJBK5J79IJk3LQ1DsCEMIBG8ARMqdx3yPhrRE/C1YKvm2g++38JuKqZYl9lrTTdcDNp7Y9CjvODCO5RFh6yfa15kKBoPx1bBmh5FZ84MwEbIEJWmueRMQ/s6gZ8eKZ6i80t4NayhiP5bXfuHUaeLkqfdQzg8I9nnKRi+1DPVlzd+fEzYZgMXoety/qeXs4jN0o3IxrsPwTDP2/Pco=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(91956017)(53546011)(36756003)(316002)(6512007)(6506007)(33656002)(82960400001)(37006003)(4326008)(6862004)(66446008)(66946007)(66556008)(8936002)(5660300002)(76116006)(44832011)(66476007)(38070700005)(8676002)(6636002)(2906002)(86362001)(64756008)(38100700002)(122000001)(6486002)(186003)(2616005)(107886003)(26005)(83380400001)(54906003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0hYMXJsSmU3bHVXcXVhcmZBTHdHWjJEM3lmckhLTlVTNHFIQjN3Z0M4R2JT?=
 =?utf-8?B?emE1R0RJTURTSGszOXMrZlYwbHdDbDlnSHdFZzNHQktFck04V2ZXQnJpOUJJ?=
 =?utf-8?B?VWRNejQ1K1Q4cDhJWjFZaFFDR0FNVUZGQ2l2d0s1RzlFZ3FMb2ZabFk0cjNV?=
 =?utf-8?B?aGpwS3MrUTE0QmZ0aWNaekh5UUsybzM3ZDdyaGM0cW1aZUV0c1g1Wjd6VGgv?=
 =?utf-8?B?L3I2Vnp3Z0daZElNajhCTW1wOERsa3pHZU5nNUJEeklrU2d2WVRGNkd1Nm5h?=
 =?utf-8?B?RkFBVW80MmpHSmp1c1dqVU9vQWtLanhhVU8wcWt6UmpoWnZJMUNwY0M4dExk?=
 =?utf-8?B?UDBYM2Jlei8rQThnUklES29VTGhXR2NtTjkwSzB5dHZDc3BuYjBnbExDQ3VT?=
 =?utf-8?B?OTBIanZlSXJIRmtVVnZ2a1dPV29TcEJpd1A0Vi82ejNLOGhsTmMwMDRxZnI3?=
 =?utf-8?B?dEd5eUkxVXRtTGVudGVqYzBGQUxHakh4R0x5RFlFeUFPZU4vN2tsTWVUZFdm?=
 =?utf-8?B?WjhtanBHOC9aSHZDSWNJeHJKL1U4MU1TWkZuU0h0UEhPZDFseHhpQ25aRFhR?=
 =?utf-8?B?d3FlZk50Zk9CUFFrcmdIbURBK00zdmNNZEpCNy9WbUxHOVc2czB5ZGhISTlI?=
 =?utf-8?B?TFFRQzVlS3N5TGh3Z2lUNGVnOHZuRkp6Y3JkZjRIaVdhV0VhZ2tGMC9VbGUz?=
 =?utf-8?B?Z0xWV2dPYXBpZUUvRC9QL29IZXJleTlmU0FmYzY2UlZnNHFPZHkyRUxyNnl6?=
 =?utf-8?B?ZVVLQVo5R3hhRXpzMzNuaGQ1amNPS25RZW9FTTR0VVRmejM0cVdSS0p6RHlr?=
 =?utf-8?B?OWt3TzRQYTJEZlN1eXo5U0QwejdWTmE5cDhZT1hYUWI2RTRMVFBhWW0rS2I1?=
 =?utf-8?B?am9jaHcrdW9DaEx3V0tVR0Iyd0VsTVl0bWo1eXBRcEVRMWQwY0Y3T0VIRDFD?=
 =?utf-8?B?OG1zclpmdjlNbmc5S2dwc1paenNXbFlTUHNtWEdQVWExTENud2JrZWErT2Z0?=
 =?utf-8?B?VVBmTUVCMmUrSENYZ2VkOHB0d2M1ZUpFaFJBQ2VtWVcyRDRsM2dsUVhYcmwy?=
 =?utf-8?B?a2ZGTzJ5Vy8rN1VZZVdVbGdIS0tjQWJaMllBakM2ei9KaExpN0t0Q25YNDdw?=
 =?utf-8?B?dW12K2hsS2NOYkJ4UWZmQ2wwSDRHNlZGMUdueXEvWFR5NlBkMzlDdisrakJp?=
 =?utf-8?B?ZnRYcGxzRWpwTHo5WXJOWnhESnZNWUNjZjlCaTNJbU5IYzF0VEUxWEdRVjF6?=
 =?utf-8?B?WDdZN3hyMUM2RlBiRU1INUVlTlVqdGkwRkEzWFMrSmZXazZtaVBZS0JRdFlW?=
 =?utf-8?B?OHdzdnVQY25zMk9Yd1ZMUnlxT2VZSTNQQ21LVVU1cmsxT3RBRnJXZ3JtQyt6?=
 =?utf-8?B?dVRGWU9RUFprekt6Z1NwbTdldk1BTEtGN2cvVlZwK1Z1UVFsWVhRbm1UdTN1?=
 =?utf-8?B?WHNwMnEya2xYVTZSait2a0Z5K091ZzdnWGtZL1NQbHZKZ2kvTXBRSTQ4cHFB?=
 =?utf-8?B?eUl0cXNzaW9tdE5QaDZOVk5lWktQaFVsSnJ6d2lXbW5wWTcwbFoybXduMFhP?=
 =?utf-8?B?cFhWVHRRY2x2NFlXWUhqcjJwdUpKemFLRmpyTEdORDJQRTVpcmJ1anNVbFBw?=
 =?utf-8?B?OFY3UnZ4SmlubW44bElGWnZ4cHA3RWZMTkxRSGg3Qi9YN0VZcVhPS25yejgw?=
 =?utf-8?B?N2JZR0FLV0FwS3F2R0JVOVcvU0dPYmRVV3hSU2pjbUllbm5RdkJKNlE5VDFz?=
 =?utf-8?B?WldURElxTnl2UGVlVWxtUXNMdGg3SHlPRTlGM084OTloSkU4d2pRTlFmVStU?=
 =?utf-8?B?MlZsSGcrS3oyMnpubDNPVGRhNzB3anpoY0FQWFBmcUl4Ym9TUVNraXM0b2RZ?=
 =?utf-8?B?cUY4SitmdCtuQXdMVEtYVEt1UFJWdXBzSTJUOWRYVlVpZGFwTFdPejl1TzNB?=
 =?utf-8?B?citDNVU0Wk5ZMW1VcXg2VjlYZ3h3RUhYdUhKOEFoZ2NKYUhHRWszM0Z5d3Ix?=
 =?utf-8?B?a3N4Ky9zY0lIRnRHUmNrcmdnNUxUMzY1TVZBWkJVWjFoNUNuSjZxeDExQWhh?=
 =?utf-8?B?MEtGMFdlVXV5UzFHQjgxc3l2eGM0N2N0MHc1dm51Q3RZY3lZRFIybXRSWlZw?=
 =?utf-8?B?QlNkTDFBaEZPV1dRUjBRSlMwOHJUL0pjQnpVT0VzQUE1ZU42QTJOS3QrZnpj?=
 =?utf-8?B?aXp1aG5UMThhQlVqd0k3WlBRdlIvZ3ZIUzExUE5PcEZPc1cwbmh5L1hnaHdT?=
 =?utf-8?Q?r6/NWAHUYknGD9cSDx2yTJfqeGEzHjpfdqLOjjZZ88=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCD6F1536195A544A141E6BA275C3F1E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33cd8de-eea3-4c46-5311-08d9eae138fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 08:58:49.2025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23VigYYJkmYoeSsE88mAxz8M1SXqWPYLbm4fpMzsJ4RqZJrR8usnRGaNbGBGKl3/N/uhjXgBYxCJ8MYocrE+aakSEIPW3o5a6nvC6b2ep7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4082
X-OriginatorOrg: citrix.com

DQoNCj4gT24gNyBGZWIgMjAyMiwgYXQgMTg6MjEsIEphbmUgTWFsYWxhbmUgPGphbmUubWFsYWxh
bmVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBJbnRyb2R1Y2UgYSBuZXcgcGVyLWRvbWFpbiBj
cmVhdGlvbiB4ODYgc3BlY2lmaWMgZmxhZyB0bw0KPiBzZWxlY3Qgd2hldGhlciBoYXJkd2FyZSBh
c3Npc3RlZCB2aXJ0dWFsaXphdGlvbiBzaG91bGQgYmUgdXNlZCBmb3INCj4geHsyfUFQSUMuDQo+
IA0KPiAtLS0NCj4gZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAgICAgICAgICB8IDEwICsr
KysrKysrKysNCj4gZG9jcy9tYW4veGwuY29uZi41LnBvZC5pbiAgICAgICAgICAgICB8IDEyICsr
KysrKysrKysrKw0KPiB0b29scy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28gIHwgMTIg
KysrKysrKysrKysrDQo+IHRvb2xzL2luY2x1ZGUvbGlieGwuaCAgICAgICAgICAgICAgICAgfCAg
NyArKysrKysrDQo+IHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJjaC5oICAgICAgICAgfCAgNSAr
KystLQ0KPiB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jICAgICAgICAgIHwgIDcgKysrKyst
LQ0KPiB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2NyZWF0ZS5jICAgICAgIHwgMjMgKysrKysrKysr
KysrKystLS0tLS0tLS0NCj4gdG9vbHMvbGlicy9saWdodC9saWJ4bF90eXBlcy5pZGwgICAgICB8
ICAyICsrDQo+IHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfeDg2LmMgICAgICAgICAgfCAzMSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bC5tbCAgICAgICAgfCAgMiArKw0KPiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAg
ICAgIHwgIDIgKysNCj4gdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgICB8ICAy
ICstDQo+IHRvb2xzL3hsL3hsLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysr
Kw0KPiB0b29scy94bC94bC5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysNCj4gdG9v
bHMveGwveGxfcGFyc2UuYyAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysN
Cj4geGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgICAgICAgICB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4geGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jICAgICAgICAg
ICB8ICA0ICsrKysNCj4geGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAgICAgICAgICB8IDE0
ICsrKysrLS0tLS0tLS0tDQo+IHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vZG9tYWluLmgg
fCAgNiArKysrKysNCj4geGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgICAgICB8ICA4
ICsrKystLS0tDQo+IHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni94ZW4uaCAgICAgfCAgMiAr
Kw0KPiAyMSBmaWxlcyBjaGFuZ2VkLCAxNzMgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0p
DQoNClRoZSBjaGFuZ2VzIHRvIHRoZSBPQ2FtbCBwYXJ0IGFyZSBtaW5pbWFsLg0KDQpBY2tlZC1i
eTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KDQrigJQg
Qw==

