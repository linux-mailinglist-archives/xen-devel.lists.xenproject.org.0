Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EF763F4B2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450900.708410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m1I-0008JE-Fe; Thu, 01 Dec 2022 16:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450900.708410; Thu, 01 Dec 2022 16:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m1I-0008HK-Bg; Thu, 01 Dec 2022 16:02:40 +0000
Received: by outflank-mailman (input) for mailman id 450900;
 Thu, 01 Dec 2022 16:02:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0m1G-0008HE-Mt
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:02:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91ab731f-7191-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:02:37 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 11:02:00 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 16:01:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 16:01:57 +0000
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
X-Inumbo-ID: 91ab731f-7191-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669910557;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kDKK9jmJj/QlKMEyRa5GifuSBhkbVw7wkP7E7Z1GEWw=;
  b=Utn6J8HyTY7iMx3TvQvFd7Di/g6Y7+oTmwAC6CWwWeFaHc1wGjBXdMv0
   eABLNQHW+c8SDGGwbhqNJOuFRTjoR8qXx0F0ioudRuXgTwkq5EgyoMIY9
   ixkzm3LGb0xCm4APVBgsK9UgT4bNvOmCYt8wMlTNLyHr4ycYQKAiFvo0R
   w=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 88617521
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VwOmN6x0DM1Xw25f3y56t+fWxyrEfRIJ4+MujC+fZmUNrF6WrkVRm
 jNOC2CEb6yINmOmeNp+PduxpB5SvJPVyIUwSwc9rCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPakT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTxS/
 M4/eBJTVzvdiu61wY6rFvN9gct2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurCNxLS+Dir5aGhnWj2zNNI001DWGliuaQ0kznQ/5gF
 kk9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5eYr2qOh7Bb4ijSjjpHTS0g+4QC/Y46+xgZwZYrgbYr471HetK9ENNzAEAjHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGplVEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:7dY5VKy0zWtdpZzoMVkkKrPwFr1zdoMgy1knxilNoEpuA6ulfq
 eV7ZcmPH7P6Ar5N0tKpTntAsO9qBDnlKKdg7N/AV74ZniDhILAFugL0WKF+VDd8kbFmNK1u5
 0NT0DQYueAa2STIazBkWuF+3dL+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="88617521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEudRiHCtOPyBvFtw48NEOCkzDsihdk52NxyivWhE9ScS/elVnPKrV1gLxNNqwrjaxtGBY5lof8xqV1CS80ziNrVf6jD/ZPyhw2CDhilNuQYDCNBkk0w2vimcPELJfEXlcSru0c6EAKCdCywM7Ltl+JiuwLx/dL5ernPv4nQNnaDOpFDjcsYxL67bIGHlc7Dd3G2hrHBGhRYjPkgvC0swL9TyvQ94ar8HNUTY+hsNiK+ZBMTQSLIzscu1754ggXoBWel+x86VfgElgfoeozPCSts8Ta8P9zSITR+yVu2atfFFkSpFhc4ao/vXo42zpUmW1Ym6yhkZ6+c59V9MflpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDKK9jmJj/QlKMEyRa5GifuSBhkbVw7wkP7E7Z1GEWw=;
 b=Ll4W1kvgcNbrV9BDCoK6VfnNOE5Zl4YOJfxVveAn2YuyUUDD/E8MIjSKq/ulFjQsq6Y0P6YGm9RetXXwB4CyXi/FoRvnFAdDzdziNh7grlfC2MI2VNRW2JZO9OGfu1wDznboPuxnqDr3qvCCGsayXJ3NpE8PP2/Om6qxzJHi0w/cZOqh/+ymQS1eFXYXFs60IKaXfMfInjktDU204+Z41CGOBNhMErMh+FoywWSm/eVA+tXZHOI3E20S1qpBXwMTIluncl4d2g6OM+uv1xJDWWjdNHcBlRPN/dnFQh2qI45mlZIWJ4h8PpAnWd4kszFNhdzgwwuHNqeCP1TFlIDdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDKK9jmJj/QlKMEyRa5GifuSBhkbVw7wkP7E7Z1GEWw=;
 b=beDcKGtH1nTmK3cZvDy9Uli6uaWhvtwKwjKbUa0sUU/EWnapqd8pn0aCW9pFsAHu3pjAUUBG47qX6vN/sTE2LLoHW0LFxm4gNgRCwn4CSCqTYyNUAltuT84ZHmTKEBc/9U31FJ3s/vZ1GSKGYwgu6/stIvnN/bVIPVjtU2Mrts4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH] x86/HVM+shim: fix build when !CONFIG_GRANT_TABLE
Thread-Topic: [PATCH] x86/HVM+shim: fix build when !CONFIG_GRANT_TABLE
Thread-Index: AQHZBZ2nWTAZIWB6y0GC+MRiLhYZVK5ZMT6A
Date: Thu, 1 Dec 2022 16:01:57 +0000
Message-ID: <261da93e-9464-8e9f-6ae2-a8f8ec466def@citrix.com>
References: <2ea8c3de-4967-802c-9a32-79203cd41384@suse.com>
In-Reply-To: <2ea8c3de-4967-802c-9a32-79203cd41384@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5008:EE_
x-ms-office365-filtering-correlation-id: 4f6335c6-ef1f-4a23-5341-08dad3b55fb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ga1Y2Hvk1HEHkw8DdsYkWM4KXyw0Gq+Ln3GAzzGTQ65/UPA18i2yaGeRMvyY8p3M3P8Z+dEwtwSnn2vDXb/pNY0OjWrPUx/caH21I0nj+DmEEcaLcSretWgBujgeKDsjXDiTmZCoFoGrCUiLeDxBkmVu/V6IZmzmBSINw8pOZlnUPojGu5Fvf1hkB5rI7QwYHktQxZ7QaOlXVnR6Y0UwuBy+Xas+cqfBJuJN4s6pAxj1PZWWsFqHUjXjxb4PFnFBUNiRsCfsXIt75VKyYewKbiqaFd7O4VxNg56THp+L9mQKoza8SOLjH3hwpItlZ7BqJvTudXy5QjyF+HzJzFzXb/dw6RjmiXAhxMgyik9GHSGm1mwnT6lxmv1MYeqOH2kq7VYm6On07EA/pj27wAlfenaq/pKoONJvr795weDGXmI30rryBDL20g5o6jFgCLUhuECrncl0jBr7sbsQRcLYlByInPoiAbq17gWiyPcgOzMs1nhcpKW9oMiI6p6hr5QBOsGzdzH0oquImTvnDvUe+j40CwMdOr+3f3PwBl6fGnHsKSeWHnBb+nmKgcDo2s4+GnVkJzv1M/HZhufdX4Ez9UKCUaxaVLqCIUDr37RgbshDlc8iVWrpjVVYj35FoYqn6V4c2FrFxQvn0GiJ7WFQVBKx42l6FTu5qDCl4MCa/oezef3HmRLkQWBIpeyWpJep4dCSM6jSOwFUIKRQ0AnLhXKamrnqsOnwmIBD/oOaNiFP3JIJH8LMaXeh/DMzuzgHiroYvYoY/I3d7kquyofNjw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199015)(2906002)(4744005)(31686004)(2616005)(38070700005)(6486002)(41300700001)(186003)(478600001)(66446008)(53546011)(31696002)(86362001)(26005)(6506007)(82960400001)(38100700002)(54906003)(8676002)(64756008)(8936002)(66476007)(122000001)(110136005)(36756003)(5660300002)(6512007)(66946007)(76116006)(71200400001)(4326008)(316002)(91956017)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QzJ3VzdvUlZIQ2Y0a29wSnl0VHEvSk1aUUhuMkhiU1ZSbGt0cEJtU2Q4Tmo2?=
 =?utf-8?B?UlNZVmRLVmVGSUFOU0xFMDhrOUdvbVh3RXZsa3JYMUxpdEdIdHdCYVh5aW5R?=
 =?utf-8?B?QTI3OE9HUTJQM1QvY0h5cnNIclNLMDR6UjRYTURxY1BsdW84MDdXT0hMQUxj?=
 =?utf-8?B?SzFmY05wYU92STNhQ0ZBbmJBNlE3aGhsc1RUenBkUTlGVU9aQVBqMGgrUGZE?=
 =?utf-8?B?SmlMelIxQlRaaDVmWnNIR1ZMWmZLT0hOYmMwMFlUVFVuRWZGZHFXSk5pQmV0?=
 =?utf-8?B?Y3BKc3B4RHhMSVRBQ3RFMk5UbFQrejAwd1plTVZSNVAzeTRWYTlHbkVGazVR?=
 =?utf-8?B?SGFNcjlPaXAyS1NCSGpCeThGMFhaRWM0c2FpeHFyRlFnKzJtNi9YRHFDTHdX?=
 =?utf-8?B?eG1sYWxlbjBLZWhNVXNlMmhjeUxKaFBnOWg0cThFYWZscFp3amtsdk5UTVNr?=
 =?utf-8?B?bCtWZTJFRlNHS3NzMG01NDgxdEVxQ3BERnlFSW5MRDllMS9JMm5HeE1Hclpt?=
 =?utf-8?B?clhyZGR4ZGZUY1R0dFFqZVNiY1NOMEN3aGZHQXhzV2RUUFlHUVh5TVJFMjdn?=
 =?utf-8?B?MXN6MHZVNUFTYXNlV1ZFcW1yVWxLWVdJTlZTdklvOUl2YmpueXQrcUJoR2lu?=
 =?utf-8?B?RUpubStlMTBqTC9uTWVsY2c1MWkrcjFNMnJENm1DTEdNNXpLMFFDRFgvVGR0?=
 =?utf-8?B?M0oyTDRBT3dlOFFpaUNUR0hiMmRwekRQWWV1WkF5U2xmbVkxMXNRSWMwTlhr?=
 =?utf-8?B?YlpjMTFPTm1vZFcvUFhwcUUzSGEzZ0ZJbGFrQlVnZllna0FtSGpDU3BWb3Nu?=
 =?utf-8?B?SWloYnZpazFaTVhnTGVyOEV0ODdnNXpZVXpWWnRqdUl0UkNVNXpSUkY1WXdl?=
 =?utf-8?B?NW54cDE1RTN5ZzczQVhZK2V0VzhVOTJvc1ZoUEVnWmJHdWhaY2R4aDdEYk04?=
 =?utf-8?B?Z2R2N2x4ckR3dG9Qb0JUV0Q3MDg4VStKUkxzQzNWM0VraHd5VWxIQzBFYW1u?=
 =?utf-8?B?N3VhT25SUkxjbDVBL0gxQXhHWkJRR3pCa2k5Qlk1VDlxcUxKa0VUMDViNDg1?=
 =?utf-8?B?Zk1JY3B6ZldHNEJhbG9aYXZRdzZxa1BpM2x1SFRmYVplWkRhRmdWcXJaQ0dm?=
 =?utf-8?B?RTVTMkFURU03cFh6akhDZzBPRWVXeWtrWmpHKzgralpnN3pLKzVJclBHSmhX?=
 =?utf-8?B?ZEJvbmtIUjFKcjNYbGxXT1gwajBkdURGZkdReEdGWVBHVm9ySVhLR2tRV1oy?=
 =?utf-8?B?QTlPYkxtS240WkZ4Z0NVdXdnbUNic001T01ITXVEMVlvQWdONFhoR3dKM3lB?=
 =?utf-8?B?YVI3Zll6Zlh6MkxHbU5IaUZtUDVBbEg3SnlhTUl4NTMyTStPcUplMjdrcjE3?=
 =?utf-8?B?Y09wMlU3TlBWMkt2TWNKT0ZLWmorZWRvS2h1WWYyMjhsTlp4UlFUVERUb3lv?=
 =?utf-8?B?amtIcmFjVTJIcEVPb1A3eEc4emV1dTNEVS9CYlZyU0loTzVSblMwNGRqdDJq?=
 =?utf-8?B?MGV1MzBZdmRHUndHM2RMTFQ0bHJTTm9IQ0RKOWVid3F4eCszcHVkYnRsRXN4?=
 =?utf-8?B?V0hHNmE5d3BjZFdsWjlMb0VHMVIxdkdIajRWUTg1c3NHYXFUWHV3SnAxNldx?=
 =?utf-8?B?SHBSc0o2cFJCWTdybHZCbS9jdWdzdlVIWXg3NmJjKzRBeEpCeGpkaGVXeExh?=
 =?utf-8?B?bjFBTWdxdStNRGNidkwrRUFNZnArZE8vdkI3NHhBV3huYlRIZFBMcER0dHJr?=
 =?utf-8?B?QXZCUnpnTXM3dWFKOTlyUk05clJyNkRkeU55REwrZ3pNTkwzOXZEdDFFSUxs?=
 =?utf-8?B?M2VJY29KTGdzWDBYREJ1dnRFL2E3cnlEN29PQ2JhQ1dhYXgvY2ZzL0lQenh1?=
 =?utf-8?B?bno4WmwxVURvcXUvVm9ucGJZN0xmMjNLbnlXV3NlaWlGZm54Q0F6WnFhaE83?=
 =?utf-8?B?eU5sR0FMdEMwVHJsTDZ1YUVZZzJvU3Z5V2IzMW12WG5JMmFVWUNmci9aaEhP?=
 =?utf-8?B?YXQrcFFVeTlkeHllUzNCdkdlbHd4b1NxdW5YNlFXeDhOZVZyN1JoaVdVUE9w?=
 =?utf-8?B?NWlucks4bm82LzFvbEkrakdVd0lxME83Z2tURGxjZmdTQmFtRVdHWkNnZDZS?=
 =?utf-8?Q?KzHGwiPyrkX8MhnUkh2dTOaH1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B31CFCAB82579940B0CA65DDF427F374@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TpxhbKGppRjoW5ZDtnMmii3pqJYGsCD3E0IZrO4M4cZ64h5GBhrBkbhX3ZMOyDYwAezHVXO6aQstqkxhL/Fm73QpvESDm5ZWXLuzwEJo2oybFX9ILG2xrQ+rovv2tKJW09ctTdAQtRkVu60DB3XyFQd+d7cfWPba+6wgOKgNy+k5RVpb0tu4PjiCuLvnLgUwX3TCl/Utyss8CK+7v0Bkz8yp88NUO55bPbbQhp8wo4AXTf4F3r6vvd5bA46uO2VTHeJtY+TlOxTH3Mq3mVG4PBeNJzoCSKgjUic2C+GtFkRqFdvsnW3sHzHcBYSefYlrVrflbDC64YXiO8+6I9SeCEGvz9SPUUQFfgXQG9l6CCz+4bq7d2u8Jec4t1h5USUbm8pGJIkm2I7c6AKkXvt5F+C/m6xwidMPa147u/mlHRMrX6h9xz0FtAJ28EHjld+WNSjc9LICP64lYHrOBYs2Jesnb8VlwHI28wik7EPerEp3dOC4f6sKOFVMDHD5HySNfgs04kN6olkxG4WSmguitAP3EJ28OomXCQScvV/41OeMdlYrIFpZnZapcusyfP8ON2y+MZq4SsH1zmjfjhm73ThJe5dqxOCZyUAC0hl1EgumENfxf3EfY6YhzALNbXtVpJsej0I0PlQ1oGsI6OJo9B0KdWd8m/r8pAb8lHSWcVTGos+JGbxdXXgWOOWFmUnuq16VikayfRmythXY67ueaWsZx19BPlUnGZSjVe5UP2xgbQ2A3dvHPWzS500Tb5EK1MKUHiOlja2DOMUsM/r95H8DWlVxwx0l2sQ3WmmtfbJ1sQywrhhYVsNh9VYg10XdvkNOzIjn9KdWLx5WwHLpBoSa17yHMV8x9FUXdb0H+Yh5vlbrzaxp1h1fd8jNUZL0OQR8sFvZjiLB7F5ISHM96w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6335c6-ef1f-4a23-5341-08dad3b55fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 16:01:57.3719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GD6sHk9QBEqH0zxyf0odHwTnO9mHThC/4Qs4RAOihy4/Y8pKv8Z3HnaNAHINjhGGdSR0YMNcrI5nRxOZX6dIZLhQu9Eso0yH6gzPXdHT+Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

T24gMDEvMTIvMjAyMiAxNTo1NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSBIVk0gZmxhdm9y
IG9mIHRoZSBoeXBlcmNhbGwgaGFuZGxlcnMgZXhpc3RzIG9ubHkgd2hlbiBHUkFOVF9UQUJMRSBp
cw0KPiBlbmFibGVkLCB3aGlsZSBzdXJyb2dhdGUgc2hpbSB2YXJpYW50cyBleGlzdCBvbmx5IGZv
ciB0aGUgcHVycG9zZSBvZiBQVi4NCj4gKEFsc28gc2NyYXRjaCBvdXQgdGhlIEFybSB2YXJpYW50
IGluIHRoYXQgY2FzZTsgd2hhdCBleGFjdGx5IGlzIHVzZWQgaW4NCj4gdGhhdCBjZWxsIG9mIHRo
ZSBuZXcgdGFibGUgcm93IGRvZXNuJ3QgcmVhbGx5IG1hdHRlci4pDQo+DQo+IEZpeGVzOiA4NTIz
ODUxZGJjNDkgKCJ4ZW4veDg2OiBjYWxsIGh5cGVyY2FsbCBoYW5kbGVycyB2aWEgZ2VuZXJhdGVk
IG1hY3JvIikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCg0KVGhhbmtzIGZvciBpbnZlc3RpZ2F0aW5nLg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KVGhvdWdodHMgYWJvdXQgaW5jbHVzaW9u
IGludG8gNC4xNz/CoCBUaGlzIGlzIGEgYnVpbGQgdGltZSByZWdyZXNzaW9uIHZzDQo0LjE2Lg0K

