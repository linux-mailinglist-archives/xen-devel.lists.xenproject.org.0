Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBC063EB50
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450260.707520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0f8j-00067g-Hk; Thu, 01 Dec 2022 08:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450260.707520; Thu, 01 Dec 2022 08:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0f8j-00065I-Ec; Thu, 01 Dec 2022 08:41:53 +0000
Received: by outflank-mailman (input) for mailman id 450260;
 Thu, 01 Dec 2022 08:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GiR5=37=citrix.com=prvs=3274737ff=lin.liu@srs-se1.protection.inumbo.net>)
 id 1p0f8h-00065C-52
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:41:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d9f6c7-7153-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 09:41:29 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 03:41:37 -0500
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by PH0PR03MB5765.namprd03.prod.outlook.com (2603:10b6:510:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 08:41:35 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::c828:7473:2c2d:e91d]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::c828:7473:2c2d:e91d%7]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 08:41:35 +0000
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
X-Inumbo-ID: f1d9f6c7-7153-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669884104;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=xk/vUElMeNm2A3435TxaIILpZAurRW8CGqf2p+MlwW4=;
  b=SC8JAMJ0hpHLh45auTETSEjtsT5glZO0ryAlrheIj+BPS4vG/GwQ56Df
   +xtqc1uXpCNU27gkw2gqRxCzZatAUpO/1g2b5qLcMBGmpiai3Rf7rLvtA
   LHaTWm0TTAXaBRF/WMcbzmRpMv/dpF2uz7XqQd60i92dH0jnmW3FefyMn
   o=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 85042207
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RBc8n6DMPgSGzxVW/2Hjw5YqxClBgxIJ4kV8jS/XYbTApD5z0mMCz
 mobUGHTO//fNzP1L492YY3n/RwHv5PQxt5jQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8McvHkpgx
 +ckMHMAaRCbmLKU5+KaVbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTi7IA9ZidABNPLRe9rMQcRItk2Zu
 njH7yLyBRRy2Nm3mWfdrij23rCncSXTRr45BOKx8cFTpnKY+0VPCDosSUWCiKzs4qK5c5cFQ
 6AOwQItsKI73E+mVN/wW1u/unHslhwTQd1LCMUh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHt7mYSmmU8LuOmi+jIigeLWIEZigsQBMM5p/op4Rbph7GUNtmOKK8kNDwHTb+3
 3aMoTRWr7gfkMsCxain1V/AhD2oq97CSQtdzh3eVG+j7ytjaYKlbpDu4l/ehd5QIYDcQlSfs
 Xwsn8mF8PtIHZyLjDaKQugGAPeu/fntGDvRnVJiAbE/+Dm3vX2uZ4Zd5Hd5PkgBGsIFfyL5J
 UzeowVc4LdNM3awK6x6eYS8D4It16eIKDj+fvXdb94LaJ4hcgaCpXhqfRTJgTCrl1Uwm6YiP
 5vdadyrEXsRFaVgynyxWvsZ1rgogCs5wAs/WKzG8vhu6pLGDFb9dFvPGAHmgjwRhE9cnDjoz
 g==
IronPort-HdrOrdr: A9a23:t2uKUKB0ge6nwAvlHeg3sseALOsnbusQ8zAXPh9KOHlom52j5q
 KTdaogpHzJYW4qKQIdcLC7WZVpQRvnhOVICPoqTMWftW7dyS6VxeBZnMnfKljbcFybygcz79
 YeT0ETMqyIMbE+t7eL3ODaKadl/DDkytHXuQ629R4EJ28LGsYQiTuRSDzrY3GeLzM2f6bRYa
 Dsmvav0ADQBEj/AP7LfkUtbqzugOLqufvdDCIuNloG5hWHni/t0ITbPXGjsSs2Ynduz6sr4n
 SAqwz1j5/Oj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF505IBbU011rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5eDpWT4gDMJFpIRBNj/U8VApst1Q2L
 9Cm0iZq51UJxXdmzmV3amOazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPT8ukcYb
 FTJfCZwMwTXUKRbnjfsGUq6serRG4PEhCPRVVHktCJ0gJRgGtywyIjtZcidzY7hcgAoqt/lr
 j525dT5e5zpwgtHPxA7dI6MJaK46r2MEPx2SypUATa/eo8SgfwQtbMkcEIDaeRCcU1JdIJ6e
 P8eUIdumgod030D8qSmJVN7xDWWW24GS/g08dE+vFCy/zBrRXQQGa+oX0V4oSdSs8kc4Pmcu
 f2PJJdGPn4K2TyXYpZ1Qz3XJdfbXQfWMMTvMwnW1iV5t7NN5b3rPHWfZ/oVfDQOCdhXnm6Dm
 oIXTD1KskF5ke3WmXgiByUX3/2YETw8Z95DaCfpoEoucswH5wJthJQhUWy58mNJzEHuqsqfF
 FmKLeilq+gv2G58WvB8m0sMBtACURe5qnmThpx1E83GlKxdaxGt8SUeGhU0nfCLhhjT9nOGA
 oavFhz8bLfFe3d+cnjMaPrDou3tQpamJvRdeZrpkSq37atRq8F
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208,217";a="85042207"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWzXsxVMquf8wZyAvgcaLI/gvDXGPD2LkaDRvDzdIdkv42Hqhbxq1IsdUaA/iX8YfmEGddcPPp1h3S83klCz0UE4xaolwfGTOgkK5avhWZYle3nhb4U+x5NosQaOusrjYGPXOT85ucUm25RFYMOTNg6EwBAEZ/DvZhdKnDM8keYJQnkJhSNbAHF0/eCtbJlqsOVAbDx53Rwic8mtODCMKhKKRBYiE4Ocy8/4RnIQGwa+ngRKbI16IpeNbEtfyta/IzGzuWfExEalE2fdil5KVkan57+yBdqvRpUYkHWHpk9d/8wF+p4qghbGKxxT1WH7rZ7bXizChYN1+0i1V2kHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqH9dux42rt1NMmnxoHxWz1BJpDwzaRegLFfvWRjWOs=;
 b=cSFlEwOjNOlJsRQsFksdtxcD4LEymhXEgizJovgex4TlZ8ziuVAR6eggZaKMSCebLBraEq/LZADH7Ay+SjN1SwJitGrjkflFU/8sQVhgpMnoaDGcVubQ2HY0oKlKt8EFxubTuAK4QHzJw5UUPphmw2tysQ9StkdYdgBrbi3k7fAN1HK3egW89XCJK0lKLL52JCm8gtmdZGS4hnR4yxV/Ovc0JgdLgzmdS0YhE1dJ5FNYfOzA65A+hQUyqMAv7lb36e3rKQ81AkMjEcV7OGOgNt1RlMfxD6YOvqUxYeN4GyK+mpDXie8q36PobUAZbs9EV81tQZy70hE4iNkKzYPsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqH9dux42rt1NMmnxoHxWz1BJpDwzaRegLFfvWRjWOs=;
 b=wIikShE1ZJTSfxmz1NDKB7EFaykdxR71t8IJhYWFUyob3pNEKI2z6asBvmXW+lSHTAVJkaRGj8X6ZnQSQBk8vogFd4ZGmtP1IG/IzDjnPoSm3IKyMWCjYmDQCnO/eg0s2lv7OkbYWm9fpw0/fZxzb12KWScAGRsfZzfV2OtCaHU=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers/net/netfront: Fix NULL sring after live migration
Thread-Topic: [PATCH] drivers/net/netfront: Fix NULL sring after live
 migration
Thread-Index: AQHZA7o3+GR9FRj8kECyz/57PLyGOK5Yg4yAgAA1/qA=
Date: Thu, 1 Dec 2022 08:41:35 +0000
Message-ID:
 <SJ0PR03MB5405CC470B49DCDDD99A91D09D149@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <20221129061702.60629-1-lin.liu@citrix.com>
 <20221130212645.06a36158@kernel.org>
In-Reply-To: <20221130212645.06a36158@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5405:EE_|PH0PR03MB5765:EE_
x-ms-office365-filtering-correlation-id: ce5986b3-3088-4d27-577f-08dad377dac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PnFea6p1XE5gtQamRDlfLlYb4Lfa5zkYYlhn75+sYGOCsxqlUEruwPmr9t96VNTp7NJq+B634RA4DGBJ4na8POqVIKYVTOYuyRIH8c1UqaMn7sZMV1WX3UtE232lWcJtyHXobEGWuf6uN43kb5nlyOLPaANuESvxjTASLkgmkvzlo8RSaLjQIfAY+Qvq3m1aAv2MlOgsSk7sX8BuYwamCmkA2GHC0ywQkV2NidBJU+/53A2HzHM/zOuHykBJOvxY7SJNVWRyuDtUClsd10i+ae349bGI2laksQdFLJM3ym7T8GyRqoHnl58rTF3hxKNkZSpcI5AomLYq676CBodMj+DUtxMhN4bLFsvvDaP9xjZnC3ivrwsOvvWNR3Rxpf1cdAKAC3nX3l9pR1ETbOvOkEUc8da3oBLGkRQhxJ/9aTID344tHmsxezNf119rONTxSCXUSs153iHexu/tRckq0mR+ceDHWxqrJtkq63xgfqILz4+8D/N0AXxpEmxW9EZf2hD34gLpHPOD3D+EYyQqMdm8X3zcznUVdrTy4md4QFAJgP4IJQw5LvFWkrqVRDYg/iCHXUBReb0V60yLPbCeMfuKX3ybu65/VTRNxJbow4ACcP52n0OTRTPvqthFLPf6vAffeVJ0ACeL3WrSkoNizAnB7niNAm3T068Ez8NXEtLSINfOe0QGNl2RiCYxF9kF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(55016003)(85182001)(86362001)(54906003)(33656002)(38070700005)(6916009)(316002)(5660300002)(71200400001)(478600001)(4326008)(8676002)(91956017)(7416002)(66946007)(41300700001)(76116006)(66476007)(66446008)(8936002)(64756008)(66556008)(52536014)(83380400001)(38100700002)(82960400001)(9686003)(122000001)(2906002)(186003)(7696005)(26005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SGViUmlRUzBzVlpLMk9HL0swRkxDeGtNbVJ5U1d6dUp6SllTVGxpUmdXWnJx?=
 =?gb2312?B?NFF6dkhBR05NZWVqdkZZV24wTTFGcDNRdDkzZWsvaUg3UlkxNExobHhrQzBz?=
 =?gb2312?B?Y3QwZVMyMHlaY0VMK2VyN1dXeVJLaHR4RHAxTlRucS9KTVhOL0RBSjA5YzNa?=
 =?gb2312?B?K1NoT01ld3EyZzBJUWRJZi9DM1J1STU1eW9Gb0dsbkVpeEdsRmZBRnJHb2U0?=
 =?gb2312?B?MzNhRkJHZXNiZXM3ckk3bEtiM2Jhd0xZUEVxdDc0YTNEK3pLcmJzQkZubmRQ?=
 =?gb2312?B?cFdRUEQ2NWY0TWo3N01BYWowS2JkZ0tQaXNRa1R6U05YSzNtWHVKTFZQRTk4?=
 =?gb2312?B?d01ieW0yZWh4cWQ5dXBac1JqYUl2a3B2dFVLQklqZ1NhVzVXUWFSK1ZXUnI5?=
 =?gb2312?B?ZE91TnF2NGFPK1pKSDFoc2YvLzNxM0FOdmJNZnVlS1JyMWdWWjg1NjRnYTl1?=
 =?gb2312?B?eGtYOWlCMTBBVzE5czVFZFovOGV2MkZqVDgxdTVSL3RvSzQ2TllCOGc0Y21s?=
 =?gb2312?B?cVpkTmxQQm9hdnJGWFJCL01DWUdNNmxFV2kzT1E4bTFkeFJWM24rUmU4WjBS?=
 =?gb2312?B?aFRFRHE3VWxLK1JiMTFiY1JCUjl2NHNhTHViMUQycnFRSk1mTXExWmJKWGVa?=
 =?gb2312?B?YldJVFlaSjdlWndENTB0UHZYZWRZUFJsa1ZYYTJVWGRiN2lwRGZGbk03VFJh?=
 =?gb2312?B?RGZVdVM1ZGxWT1lpckQvTGJXazNQeW9ON0U4U1o0eVl1Sm9QbTZjcjBGTTRQ?=
 =?gb2312?B?b0dQejhMLzYrLy9pclp0NEltY0JtRDI3Njk2UTVnNXVTdjRHTVZiaVBMQjVE?=
 =?gb2312?B?RXBseUdIVGVMZW5reEhBTGhrNGpsUVlybXQ1V1U1cEpEdzh0Z0QvQ01mT240?=
 =?gb2312?B?d0xzVG5pYmkrNEpkS05rdEpQWCttYjBVNnJPTlFvZWxMS3ZFRldicW81YVFK?=
 =?gb2312?B?TjBWL091WU5kNkwvTDczRjVVWXBPdTZNRmVXKzRWN1llQkxNTnlFcDFoZTB6?=
 =?gb2312?B?R1ZTSldNZFZ2LzJYQjFDMWpySzlVM1BhejdMOFVKcDZsdWNBYUJVTi9iV0pF?=
 =?gb2312?B?MHRHa1RKbkxGVjJ1V3pSRklJbDhvU3hjQjlvS2lGSElUejU0QzJRL2RiZmcz?=
 =?gb2312?B?SHVmV3lXcXIxSldTVzB1RWlhV0NTRjNSNW9UYXBsUWpWNkFqbHBnNVJocnlv?=
 =?gb2312?B?OHk1ZHZ3ZzhrNTN6UFJ1ZE9ZUXl3V0NLUUw0UFVTQ3ZnVXdoZDVWUjBvb1Vj?=
 =?gb2312?B?b09TL3VucjQ0MTVPWE5USTRYbm1tWnc1cUVOS3I0a2gzcEVVMEsyM2RvRXVt?=
 =?gb2312?B?elovUk1GMEIxemk3MS80aVNkaWFEWWk4RkdqN0J2NGpuRnlSdjJmZFArLzdz?=
 =?gb2312?B?V2QzTldOaEdkSkRSVDg3elFhTTNFMXZMak45OWx4UEFHSnR2ZFozbXFXbzMz?=
 =?gb2312?B?WDczRzdHUHRnMUVhcy9QMTZxS3VVRFg0aDVYSTRxcnQ0b2daZjFEQjBlbVRX?=
 =?gb2312?B?TkhGN0k0akhPQ3hlbTI0L3JDNStDKzVTT2g1bzBnWm9vNk9sNnV0eFZwT3A1?=
 =?gb2312?B?SzMybmRQay9MMnpIdFFjMzZYamFtUXBtTStmd0RkSURxSWNnZm02VVQzYUIz?=
 =?gb2312?B?MFl4L0dUZk14a2dsWHNkWnVCWmQ5NEFLdmREWmY5UW9yQm5XR2RaRkp3MEJG?=
 =?gb2312?B?L3dVem4vZ3Y4R3BwajcwaERDVFN0RDZxVDM0U2JvNEdBZXp2bGZ5Y01RdTNU?=
 =?gb2312?B?cm55WmY4RUVrNTJ5N3pQZ1BmRDRBS01kVytYVW02TjNxb3k0NkQwMndFMi9o?=
 =?gb2312?B?aTAyaWNyTmZBaWZCeVFTNFVrQ0FndWdFNEdCUExNTmlPNlprbDBSeHUyWUpu?=
 =?gb2312?B?R2NjZnZoQW45ZVZ3VnlkT1VidGFaQ01qd3B6enpOekgvK3RDWkVMczNOcmtj?=
 =?gb2312?B?NUJiWEVoRE40aU1McGJkR1I1cEFPWnUxdUczUm1CMlBtb3VyeXJIWVVSUlFE?=
 =?gb2312?B?RVU1TVBGck95NjdHMnZVM04rdXQvOHZROVI4aFJUWUlaUDhZdXRLbkVraW1M?=
 =?gb2312?B?N1lURXNaczhIdG9oMHBVaGs0czdFTk9GNkU1dU85Z2twWFl2ZXRiVkJLQndN?=
 =?gb2312?B?cWRsK0tPRTV3SGY5RGpFOXEwWTlQL1FLam1VSk16eEtxdFhIbGQ4SExBMVBI?=
 =?gb2312?B?U0E9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB5405CC470B49DCDDD99A91D09D149SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?gb2312?B?RUlkZUdQV1NmMStuMGYvOHAwOUpWNXJ3L3Nvc0hUSDVBQVY3QkM3M0dhQlFp?=
 =?gb2312?B?SjlSY1BBTEx1eW9jVTJMRTd1VlhQeVNVNWR3bFE5cTRBUTAzcS9CekVxM0lz?=
 =?gb2312?B?cGdnVWtMd2d3OUY4UXUvVFRWRXdqRFlLbnRGdzRqZjM0Rjl6M2xtUmhCdmo5?=
 =?gb2312?B?SGcwYStwelVndmprQkUyaE91UkZOdkNwL1Y1Z1VLYlpWTGdRQ2RiSTA2RUlz?=
 =?gb2312?B?cWcwQlB5TXVQUkJPK1U2WTJhMUlMOUorZnd4YXMxNGZGdkswcHdsTTlSZzF1?=
 =?gb2312?B?ZXphcmZQZmU5c2piQm80VytoN1h1U0RxU29scmtOVjRvd3crYmd2RzM0S3lL?=
 =?gb2312?B?b2JJYTkzbE0zRmNqQmxEcGd3dzFHbER6M2lidlFQR3VXakt3SzNTTWNGNXdH?=
 =?gb2312?B?OHhkdHZwZGlCK21vR0srMzJKS0M4eVNyR3VNbU52VERNZEdQY3ZhQ0JPc0xm?=
 =?gb2312?B?b0Z4bVZZUzl5QXpvanhGdVk0VFN0ME80bVFJRWJNdUpaMVRJTFBXSklyWE1T?=
 =?gb2312?B?bWEzdWk4NHpsRTFkYm80bGY4WUxBeHpjejl2emY0Ym9EWjEvc2FUZDJtbGxy?=
 =?gb2312?B?VzhQMVZxL1lUSEVoK3BUZFFIdkpnYWcvVUpXZzZibnNHMXV3M1NWS0dJMGFB?=
 =?gb2312?B?SUpZc0ZHN1BkZU5JWlcrbXJGQ0dYNEU4SjhPaDQyeEE0cVNtUzZEbU5VWS9s?=
 =?gb2312?B?bllsT21qcS9qemFLSHRjYzI0L0pkNndIZ2t1Sk5XL3V6UG53aWtpZVlGZUVs?=
 =?gb2312?B?bXRtTERjSEUvRTAxOC9JWXdlWHhpYXVrbHVMRW53dGdQdEZQeWJFUkNXOU4v?=
 =?gb2312?B?MThaSWZHeHBvOXJMdUhSelN2SVo3NTJ0ZmZYa2JWc3RheTJoY0dRb3I0dXFR?=
 =?gb2312?B?ei9WSFNEQW5UMmVjeEhkczQyWmx5d3hjWXIyNVJ4RG4vYThSN1JyaHNiSjdG?=
 =?gb2312?B?YlFIbUFuTHphMDNNOEljOFBsd3JRQTVKSHA3RGpVd2RZTVJsQmRIc3BINmxY?=
 =?gb2312?B?WGdwdEExYXFEUUVmdjc2aWhvNHdaOWUyU09oU1pzcEx5L0dsQTFMTDhuZ0pH?=
 =?gb2312?B?NUZaeUpXL1VLVmdSKzIzL2VqZFBaMGdZSzk5QVo2VzhXUWJodjNIVG14anlj?=
 =?gb2312?B?RHFlblVWL3V3QVpxaXFYT1ZpUHZNckYwVTRsUnp6c3RyZzRxaW5vUjBtQVgr?=
 =?gb2312?B?UkxOTk5kVmxiOW14U0t5VlRZYmJITyszU0dRN01CSnNTTy9OYnc2T29tQkxL?=
 =?gb2312?B?LzErVTl5enhjS2VDWit1UmwxdEVoWlFIRHRTM000dVdHZGl1VmRUNmFRcmww?=
 =?gb2312?B?VHBCZmVWeWRQcitaYndqNTFpVnNIWWFKTkxFdVRySlBTVGFjMWJBS0VGV3Mr?=
 =?gb2312?B?Z3RLLzUwQW9JaytwYitoZnJJdE5QTm80NGdPdytYVFFrVkRweUw3Um9NQzky?=
 =?gb2312?Q?fDfFa+sS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5986b3-3088-4d27-577f-08dad377dac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 08:41:35.1075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmoYSGQoy14wz9AJDVlGlZ6B6cRM2ZkaAeR4/Ar7MIuF87FtC/twQCrLScntzJiPqxVaAUr+WnuPR+ibI8jkYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5765

--_000_SJ0PR03MB5405CC470B49DCDDD99A91D09D149SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

PltDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj5PbiBUdWUsIDI5IE5vdiAyMDIyIDA2OjE3
OjAyICswMDAwIExpbiBMaXUgd3JvdGU6DQo+PiBBIE5BUEkgaXMgc2V0dXAgZm9yIGVhY2ggbmV0
d29yayBzcmluZyB0byBwb2xsIGRhdGEgdG8ga2VybmVsDQo+PiBUaGUgc3Jpbmcgd2l0aCBzb3Vy
Y2UgaG9zdCBpcyBkZXN0cm95ZWQgYmVmb3JlIGxpdmUgbWlncmF0aW9uIGFuZA0KPj4gbmV3IHNy
aW5nIHdpdGggdGFyZ2V0IGhvc3QgaXMgc2V0dXAgYWZ0ZXIgbGl2ZSBtaWdyYXRpb24uDQo+PiBU
aGUgTkFQSSBmb3IgdGhlIG9sZCBzcmluZyBpcyBub3QgZGVsZXRlZCB1bnRpbCBzZXR1cCBuZXcg
c3JpbmcNCj4+IHdpdGggdGFyZ2V0IGhvc3QgYWZ0ZXIgbWlncmF0aW9uLiBXaXRoIGJ1c3lfcG9s
bC9idXN5X3JlYWQgZW5hYmxlZCwNCj4+IHRoZSBOQVBJIGNhbiBiZSBwb2xsZWQgYmVmb3JlIGdv
dCBkZWxldGVkIHdoZW4gcmVzdW1lIFZNLg0KPj4NCj4+IFs1MDExNi42MDI5MzhdIEJVRzogdW5h
YmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0DQo+PiAwMDAw
MDAwMDAwMDAwMDA4DQo+PiBbNTAxMTYuNjAzMDQ3XSBJUDogeGVubmV0X3BvbGwrMHhhZS8weGQy
MA0KPj4gWzUwMTE2LjYwMzA5MF0gUEdEIDAgUDREIDANCj4+IFs1MDExNi42MDMxMThdIE9vcHM6
IDAwMDAgWyMxXSBTTVAgUFRJDQo+PiBbNTAxMTYuNjA0NjI0XSBDYWxsIFRyYWNlOg0KPj4gWzUw
MTE2LjYwNDY3NF0gID8gZmluaXNoX3Rhc2tfc3dpdGNoKzB4NzEvMHgyMzANCj4+IFs1MDExNi42
MDQ3NDVdICA/IHRpbWVycXVldWVfZGVsKzB4MWQvMHg0MA0KPj4gWzUwMTE2LjYwNDgwN10gID8g
aHJ0aW1lcl90cnlfdG9fY2FuY2VsKzB4YjUvMHgxMTANCj4+IFs1MDExNi42MDQ4ODJdICA/IHhl
bm5ldF9hbGxvY19yeF9idWZmZXJzKzB4MmEwLzB4MmEwDQo+PiBbNTAxMTYuNjA0OTU4XSAgbmFw
aV9idXN5X2xvb3ArMHhkYi8weDI3MA0KPj4gWzUwMTE2LjYwNTAxN10gIHNvY2tfcG9sbCsweDg3
LzB4OTANCj4+IFs1MDExNi42MDUwNjZdICBkb19zeXNfcG9sbCsweDI2Zi8weDU4MA0KPj4gWzUw
MTE2LjYwNTEyNV0gID8gdHJhY2luZ19tYXBfaW5zZXJ0KzB4MWQ0LzB4MmYwDQo+PiBbNTAxMTYu
NjA1MTk2XSAgPyBldmVudF9oaXN0X3RyaWdnZXIrMHgxNGEvMHgyNjANCj4NCj5Zb3UgY2FuIHRy
aW0gYWxsIHRoZSAnID8gJyBlbnRyaWVzIGZyb20gdGhlIHN0YWNrIHRyYWNlLA0KPmFuZCB0aGUg
dGltZSBzdGFtcHMsIEZXSVcuIE1ha2VzIGl0IGVhc2llciB0byByZWFkLg0KDQpTdXJlLCB3aWxs
IGRvIGluIG5leHQgdmVyc2lvbg0KDQo+PiBbNTAxMTYuNjEzNTk4XSAgPyBmaW5pc2hfdGFza19z
d2l0Y2grMHg3MS8weDIzMA0KPj4gWzUwMTE2LjYxNDEzMV0gID8gX19zY2hlZHVsZSsweDI1Ni8w
eDg5MA0KPj4gWzUwMTE2LjYxNDY0MF0gID8gcmVjYWxjX3NpZ3BlbmRpbmcrMHgxYi8weDUwDQo+
PiBbNTAxMTYuNjE1MTQ0XSAgPyB4ZW5fc2NoZWRfY2xvY2srMHgxNS8weDIwDQo+PiBbNTAxMTYu
NjE1NjQzXSAgPyBfX3JiX3Jlc2VydmVfbmV4dCsweDEyZC8weDE0MA0KPj4gWzUwMTE2LjYxNjEz
OF0gID8gcmluZ19idWZmZXJfbG9ja19yZXNlcnZlKzB4MTIzLzB4M2QwDQo+PiBbNTAxMTYuNjE2
NjM0XSAgPyBldmVudF90cmlnZ2Vyc19jYWxsKzB4ODcvMHhiMA0KPj4gWzUwMTE2LjYxNzEzOF0g
ID8gdHJhY2VfZXZlbnRfYnVmZmVyX2NvbW1pdCsweDFjNC8weDIxMA0KPj4gWzUwMTE2LjYxNzYy
NV0gID8geGVuX2Nsb2Nrc291cmNlX2dldF9jeWNsZXMrMHgxNS8weDIwDQo+PiBbNTAxMTYuNjE4
MTEyXSAgPyBrdGltZV9nZXRfdHM2NCsweDUxLzB4ZjANCj4+IFs1MDExNi42MTg1NzhdICBTeVNf
cHBvbGwrMHgxNjAvMHgxYTANCj4+IFs1MDExNi42MTkwMjldICA/IFN5U19wcG9sbCsweDE2MC8w
eDFhMA0KPj4gWzUwMTE2LjYxOTQ3NV0gIGRvX3N5c2NhbGxfNjQrMHg3My8weDEzMA0KPj4gWzUw
MTE2LjYxOTkwMV0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQxLzB4YTYNCj4+
IC4uLg0KPj4gWzUwMTE2LjgwNjIzMF0gUklQOiB4ZW5uZXRfcG9sbCsweGFlLzB4ZDIwIFJTUDog
ZmZmZmI0ZjA0MTkzMzkwMA0KPj4gWzUwMTE2LjgwNjc3Ml0gQ1IyOiAwMDAwMDAwMDAwMDAwMDA4
DQo+PiBbNTAxMTYuODA3MzM3XSAtLS1bIGVuZCB0cmFjZSBmODYwMTc4NWIzNTQzNTFjIF0tLS0N
Cj4+DQo+PiB4ZW4gZnJvbnRlbmQgc2hvdWxkIHJlbW92ZSB0aGUgTkFQSXMgZm9yIHRoZSBvbGQg
c3JpbmdzIGJlZm9yZSBsaXZlDQo+PiBtaWdyYXRpb24gYXMgdGhlIGJvbmQgc3JpbmdzIGFyZSBk
ZXN0cm95ZWQNCj4+DQo+PiBUaGVyZSBpcyBhIHRpbnkgd2luZG93IGJldHdlZW4gdGhlIHNyaW5n
cyBhcmUgc2V0IHRvIE5VTEwgYW5kDQo+PiB0aGUgTkFQSXMgYXJlIGRpc2FibGVkLCBJdCBpcyBz
YWZlIGFzIHRoZSBOQVBJIHRocmVhZHMgYXJlIHN0aWxsDQo+PiBmcm96ZW4gYXQgdGhhdCB0aW1l
DQo+Pg0KPg0KPlNpbmNlIHRoaXMgaXMgYSBmaXggcGxlYXNlIGFkZCBhIEZpeGVzIHRhZywgYW5k
IGFkZCBbUEFUQ0ggbmV0XQ0KPnRvIHRoZSBzdWJqZWN0Lg0KPg0KDQpXaWxsIGRvIGluIG5leHQg
dmVyc2lvbg0KDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgYi9k
cml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYw0KPj4gaW5kZXggOWFmMmIwMjdjMTljLi5kYzQwNGUw
NTk3MGMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYw0KPj4gKysr
IGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMNCj4+IEBAIC0xODYyLDYgKzE4NjIsMTIgQEAg
c3RhdGljIGludCBuZXRmcm9udF9yZXN1bWUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikNCj4+
ICAgICAgICBuZXRpZl90eF91bmxvY2tfYmgoaW5mby0+bmV0ZGV2KTsNCj4+DQo+PiAgICAgICAg
eGVubmV0X2Rpc2Nvbm5lY3RfYmFja2VuZChpbmZvKTsNCj4+ICsNCj4+ICsgICAgIHJ0bmxfbG9j
aygpOw0KPj4gKyAgICAgaWYgKGluZm8tPnF1ZXVlcykNCj4+ICsgICAgICAgICAgICAgeGVubmV0
X2Rlc3Ryb3lfcXVldWVzKGluZm8pOw0KPj4gKyAgICAgcnRubF91bmxvY2soKTsNCg0KPk5vdyBh
bGwgY2FsbGVycyBvZiB4ZW5uZXRfZGlzY29ubmVjdF9iYWNrZW5kKCkgZGVzdHJveSBxdWV1ZXMg
c29vbg0KPmFmdGVyLCBjYW4gd2UganVzdCBtb3ZlIHRoZSBkZXN0cm95IHF1ZXVlcyBpbnRvIGRp
c2Nvbm5lY3QgPw0KDQpBZnRlciB0aGUgc3JpbmcgaXMgZGVzdHJveWVkLCB0aGUgcXVldWUgYW5k
IHRoZSBib25kIE5BUEkgc2hvdWxkIGFsc28gYmUgZGVzdHJveWVkLA0Kc28gWWVzLCBkZXN0cm95
IHF1ZXVlcyBjYW4gYmUgcGFydCBvZiB4ZW5uZXRfZGlzY29ubmVjdF9iYWNrZW5kLA0KSG93ZXZl
ciwgc29tZSBjYWxsZXIgb2YgeGVubmV0X2Rpc2Nvbm5lY3RfYmFja2VuZCBob2xkIHJ0bmxfbG9j
ayB3aGlsZSBzb21lIG90aGVycw0Kbm90LCBJIHRoaW5rIGl0IGlzIHNpbXBsZXIgdG8ga2VlcCBz
ZXBlcmF0ZS4NCj4NCj4+ICAgICAgICByZXR1cm4gMDsNCj4+ICB9DQo+Pg0K

--_000_SJ0PR03MB5405CC470B49DCDDD99A91D09D149SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;[CAUTION - EXTE=
RNAL EMAIL] DO NOT reply, click links, or open attachments unless you have =
verified the sender and know the content is safe.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;On Tue, 29 Nov =
2022 06:17:02 +0000 Lin Liu wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; A NAPI is =
setup for each network sring to poll data to kernel<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; The sring =
with source host is destroyed before live migration and<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; new sring =
with target host is setup after live migration.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; The NAPI f=
or the old sring is not deleted until setup new sring<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; with targe=
t host after migration. With busy_poll/busy_read enabled,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; the NAPI c=
an be polled before got deleted when resume VM.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.602=
938] BUG: unable to handle kernel NULL pointer dereference at<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; 0000000000=
000008<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.603=
047] IP: xennet_poll+0xae/0xd20<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.603=
090] PGD 0 P4D 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.603=
118] Oops: 0000 [#1] SMP PTI<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.604=
624] Call Trace:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.604=
674]&nbsp; ? finish_task_switch+0x71/0x230<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.604=
745]&nbsp; ? timerqueue_del+0x1d/0x40<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.604=
807]&nbsp; ? hrtimer_try_to_cancel+0xb5/0x110<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.604=
882]&nbsp; ? xennet_alloc_rx_buffers+0x2a0/0x2a0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.604=
958]&nbsp; napi_busy_loop+0xdb/0x270<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.605=
017]&nbsp; sock_poll+0x87/0x90<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.605=
066]&nbsp; do_sys_poll+0x26f/0x580<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.605=
125]&nbsp; ? tracing_map_insert+0x1d4/0x2f0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.605=
196]&nbsp; ? event_hist_trigger+0x14a/0x260<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;You can trim al=
l the ' ? ' entries from the stack trace,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;and the time st=
amps, FWIW. Makes it easier to read.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Sure, will do in ne=
xt version<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.613=
598]&nbsp; ? finish_task_switch+0x71/0x230<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.614=
131]&nbsp; ? __schedule+0x256/0x890<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.614=
640]&nbsp; ? recalc_sigpending+0x1b/0x50<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.615=
144]&nbsp; ? xen_sched_clock+0x15/0x20<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.615=
643]&nbsp; ? __rb_reserve_next+0x12d/0x140<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.616=
138]&nbsp; ? ring_buffer_lock_reserve+0x123/0x3d0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.616=
634]&nbsp; ? event_triggers_call+0x87/0xb0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.617=
138]&nbsp; ? trace_event_buffer_commit+0x1c4/0x210<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.617=
625]&nbsp; ? xen_clocksource_get_cycles+0x15/0x20<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.618=
112]&nbsp; ? ktime_get_ts64+0x51/0xf0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.618=
578]&nbsp; SyS_ppoll+0x160/0x1a0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.619=
029]&nbsp; ? SyS_ppoll+0x160/0x1a0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.619=
475]&nbsp; do_syscall_64+0x73/0x130<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.619=
901]&nbsp; entry_SYSCALL_64_after_hwframe+0x41/0xa6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; ...<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.806=
230] RIP: xennet_poll+0xae/0xd20 RSP: ffffb4f041933900<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.806=
772] CR2: 0000000000000008<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; [50116.807=
337] ---[ end trace f8601785b354351c ]---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; xen fronte=
nd should remove the NAPIs for the old srings before live<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; migration =
as the bond srings are destroyed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; There is a=
 tiny window between the srings are set to NULL and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; the NAPIs =
are disabled, It is safe as the NAPI threads are still<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; frozen at =
that time<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;Since this is a=
 fix please add a Fixes tag, and add [PATCH net]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;to the subject.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Will do in next ver=
sion<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; diff --git=
 a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; index 9af2=
b027c19c..dc404e05970c 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; --- a/driv=
ers/net/xen-netfront.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +++ b/driv=
ers/net/xen-netfront.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; @@ -1862,6=
 +1862,12 @@ static int netfront_resume(struct xenbus_device *dev)<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; netif_tx_unlock_bh(info-&gt;netdev);<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp; <o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xennet_disconnect_backend(info);<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp;&nbsp; rtnl_lock();<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp;&nbsp; if (info-&gt;queues)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xennet_dest=
roy_queues(info);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp;&nbsp; rtnl_unlock();<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;Now all callers=
 of xennet_disconnect_backend() destroy queues soon<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;after, can we j=
ust move the destroy queues into disconnect ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">After the sring is =
destroyed, the queue and the bond NAPI should also be destroyed,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">so Yes, destroy que=
ues can be part of xennet_disconnect_backend,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">However, some calle=
r of xennet_disconnect_backend hold rtnl_lock while some others<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">not, I think it is =
simpler to keep seperate.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp; }<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;<o:p>&nbsp;=
</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB5405CC470B49DCDDD99A91D09D149SJ0PR03MB5405namp_--

