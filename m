Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A106B4D4465
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 11:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288256.488845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSFu6-0002pF-Vf; Thu, 10 Mar 2022 10:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288256.488845; Thu, 10 Mar 2022 10:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSFu6-0002ll-SB; Thu, 10 Mar 2022 10:20:18 +0000
Received: by outflank-mailman (input) for mailman id 288256;
 Thu, 10 Mar 2022 10:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE96=TV=citrix.com=prvs=0613c794d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nSFu5-0002lf-KW
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 10:20:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac1c5b0c-a05b-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 11:20:14 +0100 (CET)
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
X-Inumbo-ID: ac1c5b0c-a05b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646907615;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7zZdVll9lkUHleW6xxNA8iLDrQ4gvL7LbdKWsn9AntI=;
  b=Z0Zz4HHVtYt9wRfbg0NbaRMK+PmtZxawDaSv/yiZ+mEcy6BqWYq3/HYs
   IE6QB65XtD3oosNiw8oLfcgw9QqI0yVc1n6grH5WJ6mvaES/6BU75tVJ7
   nO6Zr37teyrFzEndWYYbWziss4b0YY+5Er6PG+wGr4ErxoAnEXT5tgeBX
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66300126
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GpflcazG3pLrz8dWSZR6t+fyxirEfRIJ4+MujC+fZmUNrF6WrkVVy
 GocUWmOafaIYTTxeNxxPITg9UxV656HztBgT1FsriAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IDhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplmq2qcRwNBILws+U/fyR7FXxaYINmweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZFBMWM1MnwsZTVmGkc1OZMup9yRh1b7TDxj+HSUgpQOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMHMN2SzxKV/3TqgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qyx62stheIFhQ+LE0uWAwCEC9Yzfna9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM3d3XC3270k5JGQWy2yGsgTKuOGpxYEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPsYhKVbcp3kwNRD4M4XRfK4Ey/FX1
 XCzK5rEMJrnIf4/kGreqxk1jdfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SjsBBUHlAKh2RUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 pHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:DGWCeKEkvoRCwXuypLqFRpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNFICPoqTMuftW7dySWVxeBZnMffKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIUurIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxZLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsV
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGIFq/QpF4t1H2mxa1O
 UkkC1QePibLEmhOF1dlCGdnjUIFgxeskMKh2Xo2UcL6vaJOw7SQ/Ax+76xNCGpsXbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MciFW5uYd499RjBmcga+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyPeFOwC1zxdLkHqbrUn8ki
X-IronPort-AV: E=Sophos;i="5.90,170,1643691600"; 
   d="scan'208";a="66300126"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kg2LFaV7vnUqL4uTPb/heTD3Of8Gpxt1wnhNZpws2JgVBM/Q3MCFlDLv+8/WvEcjYqUWAexllU1K7N0Mp0cvLxypPPsPKzU/7mecU7RKoIYMdOs7EDDmPNpKVzef1niO+xiq3u9ud4yWoxKnD+HbqFnPTtB/naYzymWdW0WuQpgohWDiKEFedo80yNKkjM7tO+/VsgdDgEGFN7ede2zWmvAPu/u7tO1g/hqx6rRyebVyyzQ14zSegV9bffYdFxKJKLDeNswnR+g3D/9EW9hv4au81mOEuZGTlxtDd01LameStpnMsrpAyMwiTgHvsQNvNyjLZq96xTc4z2rl3P+cbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zZdVll9lkUHleW6xxNA8iLDrQ4gvL7LbdKWsn9AntI=;
 b=d20SwKSnOLpV7gPbRV8S3O/N60XjbnK6IXTVXNj5dmm2cauCpeJnTZEjbC8CQE5fplTDrabqUMYRF2kLlcvbAffuFEvqrMYYUUzPYAiPb7LQLwGCLEIjb9OiQclCiFxHLwLIIsC8jPtIZC48fmvyJzZVN09JUS9jXq58DrYoQPiFZ21JO3JPxLLcDxIiKxhIgH4uecwXeEncekEIfv6ARKikkDFYW3SdEnnqsk47lLrcMk7kOZPefBijMDNIQkShiUwlDLPz4S70gdm6CXxvVfwJYMBmhPCXuiF6+9T9ievWgGGPbiDMnyLCRimM6pp3EejbkRS9snpUWJXfZ9Cr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zZdVll9lkUHleW6xxNA8iLDrQ4gvL7LbdKWsn9AntI=;
 b=U4g7FaIQr5llSGPeW8UbYuSn0BMnR1Vu0NgyfqerXaAC2V6UBslzApFOW9hWeg9GdN6PZLcw7I51r9IaUGgZ6pt8osKPRLdvf8qMW7fXYUldWT+IuEUEcrOJr8onAUMvpftmovrGWvssb4p72Xsce4/JN3pYsng8g9gvI1dMGmU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.16.1
Thread-Topic: preparations for 4.16.1
Thread-Index: AQHYNF0BmGlme94kI0WXS90UZwN5Yqy4Uf8AgAAWHAA=
Date: Thu, 10 Mar 2022 10:20:09 +0000
Message-ID: <41020867-eaa4-839c-3380-00bd91c5299b@citrix.com>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
 <6f8ccbb3-d384-bedd-8fb2-18aab570b588@suse.com>
In-Reply-To: <6f8ccbb3-d384-bedd-8fb2-18aab570b588@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f176787d-4703-4baf-3fba-08da027f8dfe
x-ms-traffictypediagnostic: DM6PR03MB4746:EE_
x-microsoft-antispam-prvs: <DM6PR03MB47465F594D4E291107A6E47BBA0B9@DM6PR03MB4746.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MlTHyXf4SfBeCWElX8O+xddEjb5eCxs86pY6QIzDrnBMZAMCbA3SgqbbBrOMe+zJo6wUorSzUGI+R1RuGQOsgkZcHmqtPv6dxyLXx5xVW3Za/o5ebtkbZYKKc9Ip3AO2jU1kYNbuFN3Zo7oi8wlGQsCF5bJp2G81PBZpOn5sUGLXmErhHIJ+jZ0BBgmjfACux1VEXH/SJWGpfoMLsaSOZshDlHZQPpia22dY0tFLunRlcZqi6Oe8vfIurwtmp7q4YxbK0Fx+su1gPIgXRkmtG/H+vfqcj7Gc0N4d+L085kibhvTRHgvp5VNanF+TjvJxdtgw9IWfOWo3KwyWUo2XjnaCrx8VTpoS89Kum4W6NfCVZk5fU1tHhQhFh3OvZIrCppGbrIzkSr5STuTtrUEuCBVlE4HRVBZLaM6G/PQLNa68lrkhZ2CWEXe9ARBicVvqH71HOzmav2O6VLxraUPvGof0jxWKdooZJ9gmKL8W+r10rauUZNhVRftDQQsJSiwFFuhIpekwTV+CIk9coQblzSuUCJ4Wl4Zb8F0R7OVa19ghUcwqenBN+kF/wp9G2aAtxAW5Gk/NPl0UYwdCDHPyapIClsHFP647ibLBZwATOoMcZvN/OnyLYh8Do5faFbCcP5pIKe6FYsIk8eRkqi2lG/lj475UaS+5UlDDxE8SxNSqCZAg4arsDrI4o5C0Yl0cYr6UnMA0iu/XoVaUSu8wzLueWjsq15+5zNwJRJy9Ty2msNMdvDoqQ1mBU79uGJQPr2JybOdBBdz6BLjqP2iCmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(5660300002)(66476007)(8676002)(64756008)(66556008)(66946007)(7116003)(91956017)(76116006)(186003)(66446008)(2906002)(316002)(8936002)(36756003)(31686004)(110136005)(54906003)(38100700002)(122000001)(4744005)(86362001)(6486002)(508600001)(31696002)(38070700005)(71200400001)(82960400001)(6512007)(6506007)(53546011)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHRQNFRQZGQ5NFl6V0hHalFZWSswSFYwN25sYi9aTkNMRkEyQmpyREw0ajc3?=
 =?utf-8?B?NWhkVGNpK2l0cGEzZ3dOM2UrVzUranVQTUI0enZCSHdtWElUS29KQVlic3FW?=
 =?utf-8?B?czNMNG5vSzljdkFJU2NjeVg5TkNVSU1yekVhOGQycVVxOTUyV1djOWtPc2VN?=
 =?utf-8?B?ZmIxZnVIYVE1YVE4ajNHODIxcDAvWVFYUzlQVTZMTGRoRHBHdnFwbzlya0hD?=
 =?utf-8?B?aGNQTWZpMkxYM3h5cUYzRmc3NHhnNGYrVHdnQXhRS1N5QW4waDVPTy96TEJE?=
 =?utf-8?B?SnhmTHJiWDIxL1BxQmJXa1lER3BNT2tqQWhrRHlBWDVNMWpjL2NTWFlGalhN?=
 =?utf-8?B?ZXV2Z2VlckJNOTRMaW82OGxOSHdOQ2MrdGR1ZkNkREE5eElKV0xIb1ZndmdP?=
 =?utf-8?B?THBqODhmZUpRUTBvZXpKRjBmYnd1RWNLMHp1V1VqZ2NlaXdqcVdPWDhYWkVp?=
 =?utf-8?B?eE5kNjB5Wk9sUS9keC9hWStEZThqOG94cmhTVUQwOW9CVVhSbTZ6RUFWOWhx?=
 =?utf-8?B?dXVyb2diV3lyQ0VZREhUa3plZFNRNmh5cE1OWGpQcDllcFF2MjFmYWJUNUQv?=
 =?utf-8?B?a2xpOWlGNVg0eVhPVmptbWFXRU52NXNUaVpERmd1cHNWaXJ0YVoxOFRXTXU1?=
 =?utf-8?B?OWR5S2RrekdITHorYjhiUWNtWThCU0NQcElwbTlaaTM1Ni9YamxrOXo4VldV?=
 =?utf-8?B?ZEptNlNTdnlXWTZFMUE2Y3hFZ2E2MVVNaW9GR0E3SXFiWmJmWXNhVVpjUDlH?=
 =?utf-8?B?Y3VxMGJOSGZtSkZ0RHJwVExsQ1RVUTMxZkh4ZkNkQXhqelFoa25mSzhweVVT?=
 =?utf-8?B?MXZ0RitBVGdFU1ZOZThpbVBGY1NXcjBHNWZnUFprMDVmNHdCTi9YY3I2cDND?=
 =?utf-8?B?V3V4Z3RJQXUvNHRhV0l2eUZCN2xwV0dTRFZ1TVg3M2xTMTNWRkJaaHRaclM4?=
 =?utf-8?B?SFVuQ1g5T1FRekxaS0NZbWs5ZXZLdWZFSjVtOWN1VFgvQ2ZNOGVqYkUzRnVT?=
 =?utf-8?B?eUxWMUdDa05PM1JsL2ZrQjNTTGxqZ3hNS25FTFlqaEhqSlBLNFVxa0padXc4?=
 =?utf-8?B?Z3ZpUkZZbU5xWUJDd0pjZDl2am1JMnNhaDZPcVYrN3F5VWdGOW9JSlUxbXJN?=
 =?utf-8?B?cko1WUVhVUp0eldrdUhTUG1GeTEyQy9UdkI2UU5hVzYyTyt4SDZRWG1jemlP?=
 =?utf-8?B?cVdibDd3b2paZ2FDVTEwK2s1b3BmUC9CQWk4SlFOSXpiYjN6NjA5RHluWWJq?=
 =?utf-8?B?cmQ2UllUL1pUZHZBRVhqSGhTaDhqQ0xDTGh5bW04WnluQ3RVUXhmRjZYbzdL?=
 =?utf-8?B?c0hKOXR4bzE4UldkTnRkcTVHOXEzbXJBRE9JWnoyTFFmNFdkZnVxbDJlSFhs?=
 =?utf-8?B?bEFlSTdIL1hGdWhkMXVrb1BYY2ZacEEvSVJSK0Fuc3hndHBrZnRsenhyYTV4?=
 =?utf-8?B?cTlXVDlkMTFvVzVYZjRMNFFlY2xNMUt1S3VNTDZJWHc0Y21JMGdtbXNPb01v?=
 =?utf-8?B?anRBTDRKLzdOTlg1aG5DREozaVd1RDdhV2pqeDFISGpmM0ZacjhOSitacmpp?=
 =?utf-8?B?Y0gzdXZ4YWRwZ2RxY3BQdVYwQlpoVkErRytPV1NyUGY2M09LNDBOQ0NQUjVW?=
 =?utf-8?B?MTlOeU92bXdNYVkwa1pKT1BCOGtnRThHblZvSTUyYU9jK3RmTUwrSysrODBw?=
 =?utf-8?B?YXpZSDJOOTI2TlVaa25oUWVJT1pCTTl0T0swaTZJWnZkYkd5YTZRT1Z3Z1Rj?=
 =?utf-8?B?RUJMVHpDNE5vZFZUM3BwWVBTL2lha1VESHBCUzZqTTVQWmhXc1J6ZlRPVEFX?=
 =?utf-8?B?WU0vSkdjL01id2hSeVdBVStwYjZ2UmVEaDlOaSs5cHJLWG1zeWVjTE50Rkx4?=
 =?utf-8?B?bFIvNHNmN0FxVzZqaGdWYTJUMFV5RXVDNncvK2pLc05QUjFPU29ReFJieC9j?=
 =?utf-8?B?Zk11SkY2WGUwQ3J1eUIzR0R6QWlLV2ZLSkFsQ2RqZndselU3TFVwL0xqKzM5?=
 =?utf-8?B?UDRGRU8zZmNYdGplcE5uYzVpdTN1NmIvU3JUeVdJa3VVbWc3WUtVR3pOZG5E?=
 =?utf-8?B?NkNBemFUU1hqdnhFSnA1Wkk1bDBzdzdTcE94S2NOMTNBZHNUVzVFVlVtc3Fz?=
 =?utf-8?B?cWtibU0xSE9xY1NkY1JMZnVFdkQrSDc2Y3BNMHBLWkhtRXp3dXFTZTU2M0U1?=
 =?utf-8?B?ajBQQVJlUXdJZHNpQWVlcHFmU1VpNEQ1cFc3bEp4MlN6MTUzTXQrVDlkLzBo?=
 =?utf-8?B?RFJ3OC8wd0IyTjQ4bVNCWkxxS2pBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <248FE2F92B61324FBEFDA372D91C8954@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f176787d-4703-4baf-3fba-08da027f8dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 10:20:09.1448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1YZ/wntadFJSlwUK/hlEh7Ebz1xvDC8+OAiS5HQI3svbN71yXxXHvCyMmdWmGo0X19b0LsKMteDZ+cBJ3x2pNWzvBIDZilg+84lYBURex8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4746
X-OriginatorOrg: citrix.com

T24gMTAvMDMvMjAyMiAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjAzLjIwMjIg
MDk6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gUGxlYXNlIHBvaW50IG91dCBiYWNrcG9ydHMg
eW91IGZpbmQgbWlzc2luZyBmcm9tIHRoZSByZXNwZWN0aXZlIHN0YWdpbmcNCj4+IGJyYW5jaCwg
YnV0IHdoaWNoIHlvdSBjb25zaWRlciByZWxldmFudC4gT25lIEkgaGF2ZSBxdWV1ZWQgYWxyZWFk
eSwgYnV0DQo+PiB3aGljaCBJJ2QgbGlrZSB0byBwdXQgaW4gb25seSBvbmNlIHRoZSBwZW5kaW5n
IGZpeCB0byBpdCAoIng4NjogYXZvaWQNCj4+IFNPUlRfQllfSU5JVF9QUklPUklUWSB3aXRoIG9s
ZCBHTlUgbGQiKSBoYXMgYWxzbyBsYW5kZWQgaW4gc3RhZ2luZywgaXMNCj4+DQo+PiA0YjdmZDgx
NTNkZGYgeDg2OiBmb2xkIHNlY3Rpb25zIGluIGZpbmFsIGJpbmFyaWVzDQo+IEFjdHVhbGx5IHRo
ZSBvdGhlciBvbmUgSSdtIGF3YXJlIG9mIGlzDQo+DQo+IDdkOTU4OTIzOWVjMCB4ODYvQ0VUOiBG
aXggUzMgcmVzdW1lIHdpdGggc2hhZG93IHN0YWNrcyBhY3RpdmUNCj4NCj4gd2hpY2ggQW5kcmV3
IHByb21pc2VkIHRvIHByb3ZpZGUgYSBzdWl0YWJsZSBiYWNrcG9ydCBmb3IuDQoNClNvIG5vdyBY
U0EtMzk4IGlzIHB1YmxpYywgSSBjYW4gc2F5IHdoYXQgdGhhdCBzbGlnaHRseSBjcnlwdGljYWxs
eSBtZWFudC4NCg0KVGhlIENFVCBTMyBmaXggZGVwZW5kcyBvbiBvbmUgb2YgdGhlIGNvZGUgcmVh
cnJhbmdlbWVudHMgaW50cm9kdWNlZCBpbg0KdGhlIENFVC1JQlQgd29yay7CoCBXZSB3ZXJlIGlu
dGVuZGluZyB0byBoYXZlIENFVC1JQlQgYmFja3BvcnRlZCBmb3IgdGhlDQp0dWVzZGF5IGVtYmFy
Z28gKGRpZG4ndCBnbyB0byBwbGFuKSwgYWZ0ZXIgd2hpY2ggdGhlIFMzIGZpeCB3b3VsZCBiZSBh
DQp0cml2aWFsIGJhY2twb3J0IHRvIDQuMTQgYW5kIGxhdGVyLg0KDQp+QW5kcmV3DQo=

