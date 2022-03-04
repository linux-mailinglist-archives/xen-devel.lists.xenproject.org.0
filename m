Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAF24CD3BD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 12:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284199.483397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6PK-0001Rg-Uv; Fri, 04 Mar 2022 11:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284199.483397; Fri, 04 Mar 2022 11:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6PK-0001P3-Ro; Fri, 04 Mar 2022 11:47:38 +0000
Received: by outflank-mailman (input) for mailman id 284199;
 Fri, 04 Mar 2022 11:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVQB=TP=citrix.com=prvs=055bc9087=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nQ6PI-0001Ow-7i
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 11:47:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfd165b2-9bb0-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 12:47:32 +0100 (CET)
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
X-Inumbo-ID: dfd165b2-9bb0-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646394453;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zNnai2QU1i1dnfdGH+ixaSOl/8N4O+FSaPHPPAGZ0dI=;
  b=ajcAfW/tR+3zhIHALjKYWoYcGsHrTxEE0NDtvNfgnRwX8VA5iFgquB8D
   p9tzuRt/MdOdcCHPpwoqVdNGDBmKLVhi2+46EunyyqebxXroDoaMdp8Ei
   7oOmNCtkrxK6TtfXxdUU+VClIu5q4Yn1xdukQmNP636+/m/v9Sy0EdsuD
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64943038
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tEiSDqMLZHc7aBHvrR2Nl8FynXyQoLVcMsEvi/4bfWQNrUp3g2AOy
 TNKC2qAPf+LZDPwLdwgYYrkp04GsZLRnNBiHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 otisI2MexsTJbDOqtg2AkMbIj5uIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmth2psWRqa2i
 8wxSAVXdR7tZBR0Z1o8UZdimMyrql7wfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684maiW9NEb
 U0PvCN2qbM18mSkS9D8W1uzp3vsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQNZ4m8oneQ427
 ESUneHVLm0184yKWW3Io994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3mpQivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyq2sbhm4XKlznXlrAAx8FeBvazt3Nr02wIHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX2M/QsOdPqU5p2lsAM8OgJsNiONLKihbArKWe6ENxGPxbMjwgBbmB2+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbYels2QDx6UqSJqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937xs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:qEOZ4aBmVOglq+vlHehAsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dC/DDEytHRuQ639QYTcegAUdAH0+4WMHf+LqUgLzM2eabRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJunfwivZv3Evoz6hNO6Ws19
 60Q5iAq4s+PfP+TZgNc9vpEvHHfFAkf3r3QRCvyBLcZeQ6B04=
X-IronPort-AV: E=Sophos;i="5.90,155,1643691600"; 
   d="scan'208";a="64943038"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeQWOSn0gASdcYzVl8rvwesLdVer1Qkl/7acOdWuqXS3YJFtGXgCx9Cs31Z10A7la9U8LiYmFC5QbDsEMXLbrc1TF7ixkXfL2n3dnI6HHmur6vOf9pwXtWYTSB+SZPVrdugtmb8SvN9diMtfxn4LyE95zfyWXLkAJ29UKMs7DpxTanJkvNBgXSQ5nCY+LzUuS/H7q8FDXkM0kje7UbUID7KlhlkRsLNkNe49MQt5DNNln+MDD6UdNUf53jgWHIC9OaGfFwOkLa9BX9Cut+cHTaoAkhW5xEIdjR4qR+xi9bPWwFDbu7/GG+ecD5h2JRYz1gR0+FiDOMrxszrqEKohcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKZJJsgBO+owu6MKwQuWnkINJXMgAiL/wyH8JKhCKX0=;
 b=SBC9EaIJZYfn74c0HRelxyFRsmmy/3zvKUmHqGBZdZZXos3klNcDzR4tYLvtVnHBBscJlLyiBdFRIEMAT7iUHTCD17q4rcwCD8e4PR8QRTguOd2IrCoUAboczB2ZRaNIrEI6D1wwm+dm5fdp4LeqU4QzGp21u0YuATDw5gxTLg74pp7/t37TKlo5V21Pzi+GWksN9InO83sUeabZfXiD9aHy7J3PdKlBE46tpkrIzQdieVTZtE/9xuAKgbKzz45FmI+yCqVj9EtDbkT1JM+nLXi6Xuc5/q6ZLYVXyvJHFeusgx/pZW7U8eLz2AuwDiwQaRPqenPtFGObYGTlv06dtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKZJJsgBO+owu6MKwQuWnkINJXMgAiL/wyH8JKhCKX0=;
 b=Yt2jwKG51FE7fXFbQ8qYiSNCj5YqZgcW1BEuXe6OtI0SETgEWwi1EsfA/o88Iaaro/ROl1otmmXvKG3FcGaiYzIjIEoad76toUnVsFtvuGeGy09H/ISh3sNGD5Em6e38h0NsJl9BYECdv+dnOm7L8QW3YaBT+X2GcPZjPSIoteQ=
Date: Fri, 4 Mar 2022 12:47:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Alex Olson <this.is.a0lson@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Message-ID: <YiH8SQxHGZBrQo5D@Air-de-Roger>
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-4-roger.pau@citrix.com>
 <9a02db6a23b269fe774ad4a0bc4c662e5e4df37c.camel@gmail.com>
 <c416bfc2-218a-e641-5fd7-505ea4f7a322@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c416bfc2-218a-e641-5fd7-505ea4f7a322@suse.com>
X-ClientProxiedBy: MR1P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44aeca14-4a49-4669-409e-08d9fdd4c1e3
X-MS-TrafficTypeDiagnostic: CY1PR03MB2345:EE_
X-Microsoft-Antispam-PRVS: <CY1PR03MB2345E8BE34078D5072BF23AB8F059@CY1PR03MB2345.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqHm0kPnEk09BDPEMJk/h9CbxMZ9GqVWEtUzpqzYa347t158TMvEn0yWquVa/RPYCFLVZT+gklrHqLb5MCmBJsRnw7Tga52j6yE+nhoLUkGNwstGj46C7FrugC5HSZK8W8xlBEYoPAobMeifqY+wvtHh6IVjYcFZy2g2NC3hKxQnFI0yuOKMnKtW6xJp5uAeE6bMYiS0qkTFk2xNHB0BH7j8o9Y1yH7IqN3IEApxrmYPsszPLQzhquWjzN+fu9nHO8aT4pFxgGuMPHeUp42WXGCZe6CzvRsejs8yfc2XKFrpMI9yFRJOLDf2Yvp42kN1GddbLC+pLwlJ6lZ2X9ZiXvnL+7hWsRjcowG13kScPwHGw0oxYECGbS6SwmLeaK6wRtdEPADBzB6LFNW+ANJW7Aq4gpvaL+OJBeBthYJdIIZiEuRaapr3Q2VTJKVm3QTZSW7kowAyLlecBZ5zInSGWolzZaICH32mj6wxt7YdclVo369bukS8vGPCn3t1I5Wepb3IazreB63SpFO+aTcgEPJisONaelX/W68hdOSGrZweS9KnNZfrzxbsMrFK08gbpR8XiXW1i7GuPk6KsIDoG3WqIPSQVa1BNj9dJKfZ33RTRWcMinUlqccioSOWT7jpxIaCkePcPjF64j7agwE+xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(508600001)(85182001)(53546011)(6506007)(33716001)(110136005)(54906003)(316002)(82960400001)(66476007)(8676002)(4326008)(66946007)(8936002)(38100700002)(83380400001)(66556008)(6512007)(6666004)(186003)(86362001)(2906002)(26005)(9686003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUVITmpJSmJ0Zm1xb3dtcEx3NVR0TE1GSHp2VEtFMVowMHR0aHJDbzZnVzRH?=
 =?utf-8?B?OXFUUlIrSjBqSE1xdnRrS3pGeGJCdTNQajJtR3V3VG9vcjBxdXF0cWlCbmtX?=
 =?utf-8?B?NzQwUklySlR6WGJBYk1Zak5sV1IyR0RFVlhuZjljZnZZZ1RHL09pYi9iQ1Z2?=
 =?utf-8?B?RzZyOHp2bDNEWTdxYkordzlzMndxRnlUU0IvcVdpY1pnS3hRYVpiZnQxZG5M?=
 =?utf-8?B?R3dNb1hOV2h3b3NqM1UyWWx4T25Va2JCd0xmUlZGSTBNQkdjRUM5U0RwVnhG?=
 =?utf-8?B?amhrNXc3clZ2UlVkZzlqRUsyNXVrbFNIWk1KMXFRVmVyVFBic1dKbXU2Q3ZD?=
 =?utf-8?B?VC9sYnJSc3BwdlhRNHVLaHc2dmpzQXd3L1JDcXBTdkJKcDVvTkxwWmxic1pN?=
 =?utf-8?B?U2JyUlZqSlNUR0FUd3NRVGdISENhWnVtbG5aY2tTQlpTZGgvczNMMys0K3Jl?=
 =?utf-8?B?aDZFZGtiMjBvQTJOTDJSSENvWmtPWnZ2OGU2UHFMdlJSOHFWUDhUTG55YS8w?=
 =?utf-8?B?TkVhTUFXSkdnd2p3RUhYaDBoY0s2QlFnRXpkQXJ6ZXFOamc4TnYwK3p1a1Vl?=
 =?utf-8?B?M0tjQVI4Z1RDT2E5dkZLRHJObzNKeDBMYmlsdnJ2Y0Q5b2I5dEl6UzhmaU1w?=
 =?utf-8?B?eTZYUVVkL3lkVkdEMktKbmZZa01IODRLZjY1bEVqSHBnRzVET1NrMkZ6WkdJ?=
 =?utf-8?B?SDlBOW1XVUw3U3FXZXgvNjYvWkozeFNKMldMU3lkbittRWsvckpkZnMwajAy?=
 =?utf-8?B?QXhjS3NlUVU5a2NaemdiWSs5NmR4eCtISS9XMlAwNitQY2JTZm9qMk83WXc1?=
 =?utf-8?B?UUJZSWR4VnNiM0JrYXoraVBpQjBVaVZNdENnNUhTS1ZNT3JGNVlBRHRPL1dy?=
 =?utf-8?B?b20rdzlWWUZ6YzAydzMrOHd5N0wxL1RKdW1MSWtKVk8wRDMvZUQzbS9oYlNE?=
 =?utf-8?B?dCtOaWoxa2VMOWRHeGRGT0I0aUM2YWczTDFDQTc4NlRBZUd5U1M2VmFWYldF?=
 =?utf-8?B?MUJkKzFVRXo2dkUyM2dxc280eEN5V21ORHlCT0U5ZDcxb2RhSi9tZlZSUFpu?=
 =?utf-8?B?OGJLRjBrd01NbFJDajNMblVmVXdkYkx0Y2tmK29SNmdkUWJNd0ZPUVRuTjBQ?=
 =?utf-8?B?bEJCNjBCVmNNK1pSQ0RSZ29BOXRZdmw5VHFVbnZQNUJuaDdBTm5tTE9TMkFz?=
 =?utf-8?B?aFh1OXRzcjVuMFZMOHFOaWJ1c2NFaUVGWnJ5SXpFOHdPbm9Kb21zdDBPZElp?=
 =?utf-8?B?Ym9Gb0VTQUZQYlBMT0VEbXRlNTloZklQSnRtUEFKaTFvRnNKTVJrMWs0VGVN?=
 =?utf-8?B?Mzk3SlhSSlIzTDZEczBUSVhKbklMNFZpSE1jRXhOaHhuSElKVmNVWjloUVVY?=
 =?utf-8?B?VkdFSGxVenk0NXNNNGxEQVhGaGJyUWUyWEZ1cDhNWXFFVlphemJucUtpZTNZ?=
 =?utf-8?B?VFpUaFZ4WXlOQjV1YmJmL3d4c3BPK3VNRlFhY0dyU3o0VldkcFkwOUF2Zm93?=
 =?utf-8?B?Z0tTSGNOVHlaOU5hSGdtUUx5NnV1UURKNDRWcTRUWXZ4V1RiSGRaNFpxUHZZ?=
 =?utf-8?B?a3NQbzl4b2V2bzFyQisrS0F2NVVjdmFMQW9CYnkzOEh0aTNaMFVyMS9mR0Vp?=
 =?utf-8?B?Y09Dd095RDNLMUdYaG5YRVJvUkhEY2ZSZXV3SlRSck82d2NJTFVPK1RNbjQw?=
 =?utf-8?B?OVYwdTFFdkRtL3crMWNpSDRKNXQzZUh0WGlMdlpWaHlSbkxDMFZlbVJ1NFM3?=
 =?utf-8?B?NXB5L0U3OWZ2S29BU1VHTURaNUs0UjAvYlQ2NzUzQ3V2dDB0bU5JYThMVmIw?=
 =?utf-8?B?TFFiWHdFRzVrQUxMejNGOGI2YkpIVzVwdm45ZGs3dHBaaHpFR0tPYnpNTExX?=
 =?utf-8?B?dXJpYVRNMlBRSDNIZk5iaEZKUCtPODBIMG9KUTNVNXdCWTQrSjZ6RURDNTlU?=
 =?utf-8?B?UjQxUFhvUHUwbFpTSGZVVEwrVjNRbWxXYWl0eTI2ZGxwa2MrQ1BoSnM1eEZq?=
 =?utf-8?B?aHJ2NXl1NXJKNGNDcEtmeERxMzRISExlNG81VHlubGhnNDMwalNZOHg5c1Zw?=
 =?utf-8?B?bnR1cElnVFloOUR6bURYQlp5ZFlJZ3pMVzVGcy94R0p2YVQwSlVtcmVYRGN6?=
 =?utf-8?B?VkZqUnhIbGNRM2NsdDIrY0o2cm0weUwvajh5L0QzQTRRZFE4eUsxYnJmVEpS?=
 =?utf-8?Q?2aAKY7LznhFB6IaH9fJGKnQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44aeca14-4a49-4669-409e-08d9fdd4c1e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 11:47:28.0574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDWJdAHQSGuVqD0Mhk+BaRSUXWtULbNFPIXCDpwE9hfAawaCCzxEXVVFATCxEdvkEUpwsknaTDbdz2FKBwzJqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2345
X-OriginatorOrg: citrix.com

On Thu, Mar 03, 2022 at 05:47:48PM +0100, Jan Beulich wrote:
> On 03.03.2022 17:45, Alex Olson wrote:
> > --- a/xen/arch/x86/hvm/hypercall.c
> > +++ b/xen/arch/x86/hvm/hypercall.c
> > @@ -84,6 +84,17 @@ static long hvm_physdev_op(int cmd,
> > XEN_GUEST_HANDLE_PARAM(void) arg)
> >  
> >      switch ( cmd )
> >      {
> > +
> > +    case PHYSDEVOP_manage_pci_add:
> > +    case PHYSDEVOP_manage_pci_remove:
> > +    case PHYSDEVOP_pci_device_add:
> > +    case PHYSDEVOP_pci_device_remove:

The add/remove options are already available to a PVH hardware
domain.

> > +    case PHYSDEVOP_manage_pci_add_ext:

This shouldn't be needed in principle for a PVH hardware domain, as
the plan it to emulate accesses to the SR-IOV capability and detect
VFs that way.

> > +    case PHYSDEVOP_prepare_msix:
> > +    case PHYSDEVOP_release_msix:

Those two are likely fine to use for a PVH hardware domain (not the
control domain). AFAICT they shouldn't interact badly with vPCI.

> > +        if ( is_control_domain(currd) )
> > +            break;
> 
> These are all operations which I think are purposefully permitted to
> be invoked by the hardware domain only. That's where all the devices
> live when they're not passed through to guests.

Indeed. I think it's only the {prepare,release}_msix operations that
needs adding (but would need confirmation they actually work as
intended in a PVH setup).

Thanks, Roger.

