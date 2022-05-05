Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF3D51C8B7
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 21:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322342.543621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmgru-0001bw-75; Thu, 05 May 2022 19:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322342.543621; Thu, 05 May 2022 19:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmgru-0001Z3-3n; Thu, 05 May 2022 19:10:30 +0000
Received: by outflank-mailman (input) for mailman id 322342;
 Thu, 05 May 2022 19:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obS4=VN=citrix.com=prvs=117919a4d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nmgrs-0001Yw-7B
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 19:10:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03f3dc03-cca7-11ec-a406-831a346695d4;
 Thu, 05 May 2022 21:10:26 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 15:10:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MWHPR03MB3277.namprd03.prod.outlook.com (2603:10b6:301:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 19:10:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 19:10:20 +0000
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
X-Inumbo-ID: 03f3dc03-cca7-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651777825;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KGA2hZsAl529ZEtCEJAY/LM2QSUI5YvIhNHixGn8xfg=;
  b=M9bzJ0T9PIChD7MckCpb1kr9o8pzAxqfhzJkWxwa7DjBTtz9sBK8sryp
   QV5hxnxfNaIxvf2p9uARkRBomPdCOxb3j/ItyFwOJ4RfSd+UWpS2wy3wW
   ekXvcfZA8zCPQ4bPl+MfGho5WqicAV+YZ5rpdEdIsY35JDQNv5Z2P7FPc
   I=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 70075686
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MOeEd6Pf7bqsW9fvrR3YlsFynXyQoLVcMsEvi/4bfWQNrUp30GRWz
 GAZXjiOO/aKYGf3coh3Otiy/UlSu8fXzNJjTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2tMw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 dB0hKK7EV4TJKDoge0UAzl6NRxlMvgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHfWiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2IA8A3I+/ppi4TV5FxM7OLIL8rQQ/mhX+NeuV63i
 EjD812sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRxSlpFaUsxhaXMBfe9DW8ymIw6vQpgqcWG4NS2cbbMR87ZFmAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obu5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:Qv+xhaFsyqAfhOd9pLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="70075686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMDv9m0LP2WsWR7QxHckYU/WRknZmswGk1LYqoRCSQ1gp6LNrReq4DF/rz5+w5DW0a2vSTuLBgeK15b3gk+OEN0i4G14S7S8FNYsbb7X1enTrqy2loPM4BuClhEI7wzdY35MegGzPQJmeTNx98iZJ8ZFzLlUTI2Y49YUT5hdIaBiVJaq1WZb72XnGlPhGRQiS80TXtMRtVNBvg92ex2Sl5wEnKnQq8E6e/5EPRwjY5fzEWu/98AbDY3ZMhboNtIx7lbR7m49SFagVh9D5cgPlQ8SIf7gvrVPh7KnU1Qj9KJMSAC/Q5I+fs1U5ueXYlgnS1sQBw5g0Eml0B6PqlCAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGA2hZsAl529ZEtCEJAY/LM2QSUI5YvIhNHixGn8xfg=;
 b=H3ebwcTRmEyaaBh4jE5h/EgDW1RHK7KE5jQ1lSX9LImRtsmYtcg75fLsNH0AaKNPWEdaCHxwEIElTtzsjnTXNY8WkXQelMXFZDGwlebhUUq6g8i1PVnDGb0u9G4IoTtobpexsaBLvlMlcHBfqlZ5VSc9H39HdnHThntWeKnhgbVR47a0UNFUaWWqTMzKbIQzikDMY9I6VgsRs02gtLMkoIow5ZjB2pEFWGW2ndvgWj63MdmAMtvFo7WLCK+rqfxuZVANCzgmVS95Kat+gv+cPQIhhCi3Wnm5gu3xE9tpLLFfnMNGA7T/DY/ylATE64rZ70c6iAQnMeUHJ6Hq+/7cVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGA2hZsAl529ZEtCEJAY/LM2QSUI5YvIhNHixGn8xfg=;
 b=gbx8tMkJc4XwTgZ/2gW7rO+wBqGZ9y/jyTefWEQ4WStZhM0A4ZPoQ8DkgtnXbuxLy6L5VUu/5Wqp1XH43Yua+p7A3kw5C4xGRG69ilGkMxa7/4OgwHQzxyxpJumb5UdTJYoMvE5ErEf6xAH0YFIe7vJXU4ED0IN9HLCpFWySK/g=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Thread-Topic: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Thread-Index: AQHYW8nVI0Vwkw76REOxFvedZ2w8H60Qr/GA
Date: Thu, 5 May 2022 19:10:20 +0000
Message-ID: <cf8f2a73-f464-fb60-27d8-238996b50f55@citrix.com>
References: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
In-Reply-To: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cc228b9-7c00-483a-2f71-08da2ecae63e
x-ms-traffictypediagnostic: MWHPR03MB3277:EE_
x-microsoft-antispam-prvs:
 <MWHPR03MB3277A26F680923C08BF4D1DCBAC29@MWHPR03MB3277.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZKUpuM1bDiGidm2C8j0+ynqTD5d1eCTXvTcuqMU9kBHNCCpDOuV6Eoozc1L2s4g5shuA9XAfxKAr56wWX8CDFXApdAWEi6Xbv4LwC4Tq7EY1U2dEgeStScLFk/6ITwRSBiB5KQZdCQuFuaO5AvHhFmu0ngofjBd+zdd+oSszyXUBpduoGh8/Ky805GMprsxwihS6K5BSojzR00QWPcd4+9KS2mTBmnAlCqvNRFfnfPplgvPvl5KmxxTVUZ8G8q06gb6vWL5J6BqEUWimV0dk1n9qfz0Yuk1s/Vpcma0Imf7SqJVB59tmJV3ptAo+cxc4gVe9/f6C9kaUng4ZKBeJGxpJfSvmSwqSd1UatPDSeCrdvOUUU1fk6nd7kaU3ALv8OHHu9nkUmZl5QWkc6/QOVAO+X5LDxzT71AtVOm+Pfucjeqo+i6PInRQmigp8hE0ieRd/CFvGvvdxMGX0BSoaJutwl2DSCEYayq8hbZAJw7Tp1SjsY5j5ZCx2aIvMK7x/Hoyics2+tQsfxZg8Nodh3zhoxlithvLwcKbvATcDTGIcEGFW+/s1WyVL3Hyv43+CR4kbwd6sXvZKZo6BB2D+wd/y71B9a+LO1iZoO3GvVT4yC01BqukVDug/sGNTWG7RvbporlGZ9xjycaS99gp6C1lxO4Wx80iyp6nDilrwpxq/yfeDrNSodr4cg5TNA5O9Cp/M2Sl2hqQv8tZOGNL43FIVZ8bjkQDCjhHFuVXVTR30C8rg5zCoYXacHEBM92iq207X5co2yDLycii4T5ISFw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(53546011)(38070700005)(110136005)(38100700002)(83380400001)(6506007)(2906002)(316002)(6486002)(508600001)(71200400001)(66556008)(2616005)(36756003)(31686004)(6512007)(8936002)(86362001)(186003)(26005)(91956017)(31696002)(5660300002)(4326008)(82960400001)(76116006)(8676002)(64756008)(66446008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3Rhc01QNHpjZ1I0UG1XOTdIOC9ieWlsZFlSTkEvL1dRWDRmVUh3dnUxdWFy?=
 =?utf-8?B?SHM1RFBRcW95NUgvMktLNjAyQVlCU3NtVStMcFFicXUxODFmcnc0dk9KVXA1?=
 =?utf-8?B?aHhPUG5uaEtlOHYxcUY2Qk1mUCtmMWQ5QU5icTR4eHJlNmxDMTFLMCtyRnNZ?=
 =?utf-8?B?KzYxNTlKZFEweGZqNGY5TzNncDZtaGRvRkI4RUI2VUM5Q1pBbmd4UVVheURn?=
 =?utf-8?B?anZ6TDBtL1FsQStIaXRRdVd4RUtJcHZscEZvbjlKTXZqcjJDVXgrU2g4SFQz?=
 =?utf-8?B?N2RTVjNHcE9ONHlvOFVkWXdTVTltNVA1N25ZdWlhenhhR29HMFJweGVqSUwz?=
 =?utf-8?B?TkYyVWNMMm8zeGRyK1pGcTM4cWxRbWZuM3hOUUtpMWQ5RE5YZ0gycWNTdEtm?=
 =?utf-8?B?N25jZlJrb1E3SlF6dDY3MzlRWVpjeStXNE5kN2o5blFZNS93MTV4R2pnS01h?=
 =?utf-8?B?ZnZJRmh1aHhvSjJEL3RoR1J3V2VBQVBXNjlrOUJuZXNGMnpCTHN1ZWk5N1JV?=
 =?utf-8?B?MmlUWDVvdTVBYkU2SEpQM25tNUk4Ly80bWRCTXlWQk1WZlBwR3dnSTBPVzRy?=
 =?utf-8?B?MTljT3dwVmhZczFLY3I1cGtLTURzVk42aHVML3dCMVFVbGRPMmt0T3pRZ3cx?=
 =?utf-8?B?c3dTUnA3L2FpTEV4UDJ5dGxtVW9hNzhLQXhLWlBweE5xdGQ5RFk1VTZtSWli?=
 =?utf-8?B?QzBqOWw3eTBDdG5MRDA4dGVSL1BqMmk4WkhmTzVOYzBFNnNySXlVM3k3emJz?=
 =?utf-8?B?eHFYbE9SSXRDZk81MlpFUm9qWUs1bXRlN0U0cnRvK2U2K3h2aW9lSFVScDZq?=
 =?utf-8?B?SUtkYWdFRTJIMk5QNmF0cDJWWEVEWGtsQUphZzE1RGU4SXErL3NvbXZTTS9p?=
 =?utf-8?B?SHMwRFJSaFd5QXZwQTZXU1JXc2FWdWs0UTVsVWFMUnlXTmx6aVh6WEhMWGdJ?=
 =?utf-8?B?cllIMmxJRFVXM0dWZngvekVVakF4Um1ibzVtcnNwd051SmF1ZmtPRlhudCsr?=
 =?utf-8?B?MG0vb1BHRytXRFc1WGo5V1ViMlU2MUU2RHJJSW0wQXVUSHFra0VlTm9keXMy?=
 =?utf-8?B?TGkzZXYzbDd0RWtQWVNJQXo2U2hoY0t3UDRXQjJuRHNWVnByTkZqcFFGaVlM?=
 =?utf-8?B?MkZnTi9oemxzRE5lOHFjRE9BZ0l3bkI1OWlmMW95dXFvVjREWkpkb01QbUNH?=
 =?utf-8?B?VFlYWjRIR0xaR2VDQ3dDdDYwMEppOE13bXFva1R6OTc1RDFYSFN2RlluUXhL?=
 =?utf-8?B?YjhHVXUvT2psaWhZWU9HdE5SKyt6ZEhnOW5VOUlocGorUXExOExUMTJQeGZs?=
 =?utf-8?B?cU12VzI3SGZDZVdaYjUyb1lSNDdhRnV6c1hXUXdUZG1oZ09VNWVZL1hIZzlC?=
 =?utf-8?B?RmR0cXliaTNlUU5NQjVxWE9BZGJnSHBDWm5OdlllaGY1YkkyQWRiVUlzMGlU?=
 =?utf-8?B?bHp0S2Q2dUdaUzg2c0kybGRWdlVCam9wMmJySFlSZlE0OGIvYjZpdDVFb0Zt?=
 =?utf-8?B?eUROLzB6SjlqcWtwd2UydzBPK2p4VEVKczB4b0hmMVgvSUcvVUMwbnZTVmFk?=
 =?utf-8?B?eEFGQnJDRmc2b2sxcUJ3Q3F0SC9TbG03Rmpwb0ZhbVRCTVV5cnRSUU9ZM1dQ?=
 =?utf-8?B?WVhzQWlmNE4xMVk4VTZiVzRaYTY1M3BTZWNuaVJRdnNlbzVQc1p0VC9pbUUw?=
 =?utf-8?B?RHY0cEpDS3Z6b3lDUFVvK21pU21aLzVsUnhBMHliTDZBMnJKWWJrZFhsTWpQ?=
 =?utf-8?B?WGZLZFhrWDVlY3puWWtqYXhsMExidzNMb2RYSTlBYjdaVnN4RytMNkIwajVs?=
 =?utf-8?B?dElCamxVTEpqOGVLYXJIclRXQTNIWFZ1RVhPYnRzWU5qQVdvNlJpMGRwTUtr?=
 =?utf-8?B?MEZwQzQzYU1tR2VzQitOU1Q2UmpuM0JRbTlKM2FUY0NuWXlSOUNBTzEzSkNi?=
 =?utf-8?B?dzVVTHFZc1JxVWxYVXdwc3JWdGxtc3pFa1FKbkR5QnVkODErNVMzdGFQMzhN?=
 =?utf-8?B?ckVrb1ZpektRSytFTVRxY2laQ25zUUJzUmQ1aFQ1RXdDcUNoY1k3TXRha3lo?=
 =?utf-8?B?ZCtHWXArZDBGVFFEc05TLzZhVFZrZ1dpTi9jZE9rR0ZCVjNxNXVSWE53dW0r?=
 =?utf-8?B?NXVaTjh2VHNjZklwYVVpL3g2U2toaUJVTXBtbG1HQ2g5aUxEaXQwWXR5RVlh?=
 =?utf-8?B?T3NTMlU3VXA1NTdjb1NvZGEyU2pxZHdjL09hVnJJbnM4UFIycm1XTGZCdFlt?=
 =?utf-8?B?L2tnNU5XQUFCRVkzSmtUNVZjaWt0WjNQMllyUmk1eGdNdG4rYkViWkhYR0xy?=
 =?utf-8?B?REJPSllFWTV1eUEvZ2hGWFlIS3hoaTBYTExVTVlwamllaTJxOC9zeCt6UFor?=
 =?utf-8?Q?ky+Vx77NeBdNp14c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FAB84B0FBF37D40BA7FD142BD3EF9E9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc228b9-7c00-483a-2f71-08da2ecae63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 19:10:20.7140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7YqBqq32QMUi+rd0/NXWs6XBqlth31snjnPmnyTYyUBIJ9TMqFGffzHg4QwR0tGVJOT/wWjNahYVy/S1dIi169pTDJHwBYk7V3s1vFXtZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3277

T24gMjkvMDQvMjAyMiAxNDowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4NCj4gSU9NTVUgY29kZSBtYXBwaW5nIC8gdW5tYXBwaW5nIGRldmljZXMg
YW5kIGludGVycnVwdHMgd2lsbCBtaXNiZWhhdmUgaWYNCj4gYSB3cm9uZyBjb21tYW5kIGxpbmUg
b3B0aW9uIGRlY2xhcmVkIGEgZnVuY3Rpb24gInBoYW50b20iIHdoZW4gdGhlcmUncyBhDQo+IHJl
YWwgZGV2aWNlIGF0IHRoYXQgcG9zaXRpb24uIFdhcm4gYWJvdXQgdGhpcyBhbmQgYWRqdXN0IHRo
ZSBzcGVjaWZpZWQNCj4gc3RyaWRlIChpbiB0aGUgd29yc3QgY2FzZSBpZ25vcmluZyB0aGUgb3B0
aW9uIGFsdG9nZXRoZXIpLg0KPg0KPiBSZXF1ZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4NCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMN
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4gQEAgLTQ1MSw3ICs0NTEs
MjQgQEAgc3RhdGljIHN0cnVjdCBwY2lfZGV2ICphbGxvY19wZGV2KHN0cnVjdA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBoYW50b21fZGV2c1tpXS5zbG90ID09IFBDSV9TTE9UKGRldmZu
KSAmJg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW50b21fZGV2c1tpXS5zdHJpZGUg
PiBQQ0lfRlVOQyhkZXZmbikgKQ0KPiAgICAgICAgICAgICAgICAgICAgICB7DQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICBwZGV2LT5waGFudG9tX3N0cmlkZSA9IHBoYW50b21fZGV2c1tpXS5z
dHJpZGU7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBwY2lfc2JkZl90IHNiZGYgPSBwZGV2
LT5zYmRmOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHN0cmlkZSA9
IHBoYW50b21fZGV2c1tpXS5zdHJpZGU7DQo+ICsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IHdoaWxlICggKHNiZGYuZm4gKz0gc3RyaWRlKSA+IFBDSV9GVU5DKGRldmZuKSApDQoNCkknbSBm
YWlybHkgc3VyZSB0aGlzIGRvZXNuJ3QgZG8gd2hhdCB5b3Ugd2FudCBpdCB0by4NCg0KLmZuIGlz
IGEgMyBiaXQgYml0ZmllbGQsIG1lYW5pbmcgdGhlICs9IHdpbGwgYmUgdHJ1bmNhdGVkIGJlZm9y
ZSB0aGUNCmNvbXBhcmUuDQoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIHBjaV9jb25mX3JlYWQxNihzYmRmLCBQQ0lfVkVO
RE9SX0lEKSA9PSAweGZmZmYgJiYNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBjaV9jb25mX3JlYWQxNihzYmRmLCBQQ0lfREVWSUNFX0lEKSA9PSAweGZmZmYgKQ0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJpZGUgPDw9IDE7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICIlcHAgbG9va3MgdG8gYmUgYSByZWFsIGRldmljZTsgYnVtcGluZyAlMDR4OiUwMng6
JTAyeCBzdHJpZGUgdG8gJXVcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZzYmRmLCBwaGFudG9tX2RldnNbaV0uc2VnLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwaGFudG9tX2RldnNbaV0uYnVzLCBwaGFudG9tX2RldnNbaV0uc2xvdCwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyaWRlKTsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzYmRmID0gcGRldi0+c2JkZjsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIH0NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGlmICggUENJX0ZVTkMo
c3RyaWRlKSApDQoNClRoaXMgaXMgYW4gb2JmdXNjYXRlZCB3YXkgb2Ygd3JpdGluZyBzdHJpZGUg
PCA4Lg0KDQpHaXZlbiB0aGUgcHJpbnRrKCksIGlmIHdlIGFjdHVhbGx5IGZpbmQgYW4gOC1mdW5j
dGlvbiBkZXZpY2UsIHdoYXQgZ2V0cw0KcHJpbnRlZCAoQUZBSUNUKSB3aWxsIGJlICJidW1waW5n
IHRvIDgiIHdoZW4gaW4gZmFjdCB3ZSBtZWFuICJ0b3RhbGx5DQppZ25vcmluZyB0aGUgb3B0aW9u
Ii7CoCBJIHRoaW5rIHRoaXMgcmVhbGx5IHdhbnRzIGFuIGVsc2UgY2xhdXNlLg0KDQp+QW5kcmV3
DQo=

