Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7CD6C7D72
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 12:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514283.796388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfft2-0004eo-QD; Fri, 24 Mar 2023 11:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514283.796388; Fri, 24 Mar 2023 11:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfft2-0004cQ-NL; Fri, 24 Mar 2023 11:47:12 +0000
Received: by outflank-mailman (input) for mailman id 514283;
 Fri, 24 Mar 2023 11:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfft0-0004cK-SP
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 11:47:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ce6531-ca39-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 12:47:08 +0100 (CET)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 07:46:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6082.namprd03.prod.outlook.com (2603:10b6:610:b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.40; Fri, 24 Mar
 2023 11:46:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 11:46:52 +0000
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
X-Inumbo-ID: 99ce6531-ca39-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679658430;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PRVft3SlbXDA0bUjEHDKGWJkplWQ8toDcXhXXpDrLuk=;
  b=Y6tgVl8GgPk0dXEtReWXuolSdlpk6QpVjxYuzNoSbOi2FFB9NBz+pL9C
   4OibuLwaEZYH6OaYmceLTv+lbhJwTTR6czSKeohrPuolQaU9PHtKvnOSt
   I5bSnMZXm0fnlr5yne9qjzjp8cubYiwxf9EsOk5hKJw6MSRJ4JKr5EbZX
   0=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 101537003
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RlK5o6os05/YjvsTHCgmiA9FllReBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnTOqqMM2L0KNhyYYrk9hsP6pLcztRhSlQ6qC0zQS1E95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSVNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACACSDSovqGS/JW+dLdvgIMONsX7BpxK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIW9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgr6Mx3wXLnQT/DjVPbga/m93+13fvYNxQF
 0tT1zIul7Q9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2lRSWSN9mSPSxloetRW62x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNrxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:DGqViKyTsVqRWsZJnX+nKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-IronPort-AV: E=Sophos;i="5.98,287,1673931600"; 
   d="scan'208";a="101537003"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czKDzhxBMfhBrh9XEHc7ka3WrqmIDidgzsX/BINNHM4xMYVgsrBS3m174qZYMpYh0Bt4TfYIEuj6llolI2XERMCx4cH+pcLjNxTHKWhA9RMc/pWULdfoP3qg1/K3rHBAYmViA3aTvoN0T1/+dH1YbehEu23UOady9UspEoJZ6BNUJnFdIVHD/lE6DZ+uXlTHffPvVkIcLWvHl8NVumwuOKLUVESFeDHmK0VBBagCwgS41BR86kHnSHsjPi8QIGU/hOk0q/3A8SXZn61S+QD0Bgxv3Zak20Vhm3n+4RnMRZrQ0GFzgSd5rZYHM7koMuRUwa115//lSWnnWZAEVOof8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRVft3SlbXDA0bUjEHDKGWJkplWQ8toDcXhXXpDrLuk=;
 b=O1Hc46/sN71pNQwUiS1BjMVG515UALqut6NMZulXMYG9Qyy4RpjqcULPKD6+Sec0xa/N4t1eJOg/Zjixl/GUmOMkRgpp8ihlmAdYpn2Y329kMAaW0fOcTdoHwqsqARzhQQ7b0g4M0Yjpdlv4r2h48UoQpMQOTyo66WBE7E865UE+lpeI7nScc60nx55KmTzba/VtjetZsx3PLbpvYV/g94C06yWHJO0IGF20CWJIxu9QCks/jB8AU/k500UzxQmb2gL+KV3pBYXINNGxEaNqSNL+uxOjLCpXmUpONP/KnBlJDN1VJm5Bfi7+VH0BUeQyWdaVZPyhdmSUBgtQjS6FJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRVft3SlbXDA0bUjEHDKGWJkplWQ8toDcXhXXpDrLuk=;
 b=cOLoNsxz33+V/V2v5Kr2R14OxdnoYHrkT0B/vn6oQQ9K/oznizbaHt5x5uM18IEofEN14lVs28bPQQDwZbS1GGVjkpv3sS0cpLCMWjh64nUAIhBvlWm/kcuSjKpdIjzaPg1p6DaFzAhdo4o97s2T9/YefB9kya4wDuChAqmUM1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a6469c8-a88b-2ae3-2114-6a8b7e53a4fc@citrix.com>
Date: Fri, 24 Mar 2023 11:46:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86/hvmloader: SMP improvements
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
 <20220824105915.32127-2-andrew.cooper3@citrix.com>
 <a27627e8-9f26-eff3-c94f-0ffc7108914b@suse.com>
In-Reply-To: <a27627e8-9f26-eff3-c94f-0ffc7108914b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0627.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bad1aff-b5ac-41e0-788e-08db2c5d7575
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbXnXXAEVEU9V/XtUfbi7Db0gcIZ594LctJWZCyjeKsjzOR83+qUHT9JFjvbWSNEz4Ro+bZsH2zOA3BgodcReUYQmgJP1qA+IsAxFcKF6HtZulcIhcrVaThz7/+wtFmHKpGZW5lpvkQbIVwd0uJpWw8aDdNwCtQIEJP1JDmAIEdCyDiVqacCxPkyqEydVrzKvylXSmi1wD6NUiHo93RUOwGz3Oj6QwNfAGvvEQVySNCMsDBMlf1ng9emXkxwJ4TYVn23IJqlCngsSs/Rsm+UTEh8/2ynOJkDuOifaj6JA/UhmjU1Kbk7730vSuuNccG8Wd657rHrjVUB+D1Z0n/V1Pg6X2XJ92oyPRf3HXnqf1vCYmYODsnFuP/B0hPfecn5XoJKI4ujAde97oZkdF/hK40/qa8jv01WkBKyfb2iP+vHCFbaPCxpe+VUTj6J7JJ4jO8v0OMA82rDFWR5j6maJhLcsW6xjo673RJHR/oL33qk6GR8pz2onn0gsrWN+swjHv9FUjpPnyW/mhlYDI2+vnjkSZIqShauleqxB1XHTPcEVnzna1Wax1+bHzDSSF/Mg83WLKp+3Vi3KUaF5CI395o7kdQC2xtE3VW09y0uudY8t4cyFTPujoCxoZhhxQ7ikx5SEcOAJjc5Y9rg4Jb88YTI4lLCUjWsVPogj4pKO7Xr2H3501fU1CMoe3UlDhPivTYRlITtK4aku56P2M9j/8m+8NYhZI2uobvFQSYbCqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(36756003)(66556008)(66476007)(8676002)(6916009)(4326008)(66946007)(8936002)(41300700001)(6486002)(478600001)(316002)(54906003)(2906002)(5660300002)(82960400001)(86362001)(31696002)(38100700002)(53546011)(6512007)(6506007)(186003)(83380400001)(26005)(6666004)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHgrZE14RU9xV2k1V2lZdGlZNGZ4b3Qrd0JkbytxRGp5VmVlM1B2UENnSVNJ?=
 =?utf-8?B?bThETExEWlF4SWJuY2FZOWJ5bjlzcVN0Vnd2aFZtWDhwN0pKZ2ZVSU4xcGNr?=
 =?utf-8?B?elhhM3o2dW5pMXlVYitrTEdDYkc1dTkramlCRU5uckgwSkxwczBvNFJSM1R1?=
 =?utf-8?B?dnNMb1RiNHVRcmROWjc2eGtuRHlEc2RicmhMbDFJcVloRGE3WUtBcVFaVkpJ?=
 =?utf-8?B?Sy8xdU9PS2l2V0l0aUZKeTNuR3o5SE9odVc0K3d0aGFHQnd6SDBOZ1ZJQS9W?=
 =?utf-8?B?R3FOSEwyVUZtczBpR2VKbU5xajJUcVpLNlJ5ekRyRmpJZ3d1d3JsVm54K2ZT?=
 =?utf-8?B?RVBiQWZkMURJL2JLM0FoZmgrRTFKR29JZ0tveFROc01HalFwUlptVTR1TWVB?=
 =?utf-8?B?aDFjRWhaRHVObnF5REtjY2RZZFJEUk9ER3FXTklVUmpNdE04K2pPVHhIM0Zj?=
 =?utf-8?B?aFlPWUNtOFFETGg0TnBaMHVZbFlGNGt0RytpWmZ4ekN2cGl2dGlFaGFRY0hy?=
 =?utf-8?B?OTZyb3RWNVd6eWJaVE1ybG5WbVQ5RzNJVG9tU0h6Y3VINmZoTkNJV3RaK1M1?=
 =?utf-8?B?QmQ2NkFWZ3JiYjQ1VkNqbVhTbUdYQmJaRHV3YzBPTGY0NHEyZEdzeTQ2SDFZ?=
 =?utf-8?B?QW1aRHVhSk91d0pvOWVQZmxaREs0WHoyVFpBVDh3NHRWUWZKS2grQmd3MTdS?=
 =?utf-8?B?dE9yZTR6dnZ2T2FwNEgwSE5aV0dJWTMxTHhSK1oycFNMS0ovS2lJb0FPN0Nh?=
 =?utf-8?B?WTEyNVFkK1pEekpSZnFRTUYwVkFUNXpGYWNMUVJGZy9FSVFaR3pQNVhmam5s?=
 =?utf-8?B?aEx4dWgrejE2ZjRMSWI0L2pDb3JnRE15REZqY0ljY3RKQzlUYk1XMXpXRlRv?=
 =?utf-8?B?ODRhV00yKzd4TGUzdjVvOUFoT2I0cnZMNjRKcFNTbWpxZFVUREZrbThnT01y?=
 =?utf-8?B?bjhLUU41MEo3QnRGekR5VVVhY0VUWjVOZ3pYZ1JGYldxcGdGdHY3OTJXSWlF?=
 =?utf-8?B?NmlBdTBBUUsybVEwNDNLOTBzN3lmT25HTlJ5a1ZUbnNwb3JXK2M1SWtrTEw2?=
 =?utf-8?B?Tk1SL200b1J3ZlJoMThiM2RjNElhWWQzSGxOaVRJYkIwWWp6a1J2UitqRVBo?=
 =?utf-8?B?ZDZldExBTFRhTTFaRnJEcE1tMjZJakgvcUQ0SUxPcnJFU3gxOWtQMzdaRnE3?=
 =?utf-8?B?SlJCUmljZGtpVnpzZnp5SHllZDlkM3lyZzkxajBHb3k3VFBpbW1pMTZFMncv?=
 =?utf-8?B?RUpIUVYxQkZud3JPVnJUcXBya3ZNdXhUT25US3FzS3RQNTZ0VlhaRER0Sk5L?=
 =?utf-8?B?QUhmTlU3bDlFM2RaUVpkRnIxdkEwQldpWXZKT2swY1hCRUtNVEJKVGNQZFND?=
 =?utf-8?B?ZStnY3ZDVmw2V2F5dmJHTjdnS2x6ZkJzcm5oN1FpSWN4eWlnRTBlbHFRUHFW?=
 =?utf-8?B?VVhLYm5GR0ZTbUl5K1UvZjhBdkpUZGl2UlpkWk1FWkV2QlFaZ0lwdjhXU1Q1?=
 =?utf-8?B?Qm01c3BLWHFTcnllY0Ewd2cyZWYvVnZ1TVUrUk4rck5tNjU0WlFNcUNaMmFk?=
 =?utf-8?B?MkRpUzhoYUFmSzY0SXZPRHV6Q0s3L0grT2h1Rm1zVGtZUTNWWHFFUkx3aVBD?=
 =?utf-8?B?MU5SNU44Tmswa0RMUldWZTBoNEpsZFZHcWxlbFZBQzNHd0l0ZGw2K0c4UTRK?=
 =?utf-8?B?cFRsc3RvUmtWQ2Fadm5JSlllS0tEdkpmdEJFMDBLQkhCRkZpSENZWTFoT045?=
 =?utf-8?B?V3RaamZmV20yTkhlWWovSHN3amJKNlFHOHNodVJtRFJGcThUS0J0VWVMUGRJ?=
 =?utf-8?B?akgzQjFWbExtY2xwQVV4VkladEhkaW5vYkxvWlVxdlZURjE2aGt2T3ZERXZH?=
 =?utf-8?B?bmNiQWMyREVVeXgyMTczS3dZeGRFaFE1WllhSHJZZzBqMlg5SXdqU1orVmpt?=
 =?utf-8?B?VlpoM3k4cTNZWlFBbHdleTBxeUppUm1YVW5hYkRDRUFMckdIejk3K1pJOTlj?=
 =?utf-8?B?U0NJSzlLa1MzRDhBSjl6M2JiVGpmc0RSWUUxN3hIbUxnWDd4czhiT2tHdWVm?=
 =?utf-8?B?Rk8wc0d2SFNDY1JUNDNkdno2YTllS1FHSnpMQk8rTG54OW1GKzV6bTRtZ1px?=
 =?utf-8?B?eHF5bTVVOFVhQmJkZ2lobkFXV1ZOUU94NERYQ2xRc0NGMElUeWFtVzlBTGdW?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GgvXyhsFRfcymtWHBJnx1v05r4e39rwR9yBiwtqEmcMce8g3OOD9aZfONWNKd3eQrt+s4y31q2nOfWhgTuYzOjiy0xe79jdnbihPtkYTFVyN7oDSTdehWkLNjbkSkvfbwHb/WiUUSS36WFUZhnTWK2WkGwqaai9/lWA/IKSSbobEhrmfMJcEBfb3yG3wO/wA04lPPTwAaAM/cI276jVSkpzBURN7p1LkvyGhn8+bd58+Lwxcns3p8Txny6tIEIatPBY9zD2NC0W3D2ltmjsFgx4LHLOmwocx5V+IPjAD11pEdmt3eeQ9+WIWFRdsp2w37+T7wb+OqgwXCf4bSKXviOtj6DBNQT9u1O+BpV71Wvb6e6pPkt5ROu7Y6bH6Dr0eQLEmmALBLdcBUgEj6TmgKzfRVdR2Sx5zwsL05LbzcFiPae2YFIJGR/4h68w8NodUQ6DgThGFhKykJ9PEtyKpAVB12sLaRc22KbWM+abCw/sx+PZ5G/pAeq52dvrTa7dg8EQ2GZRTDJ/NuB0lag9FhU0NxwZnUft2d7+vUSJYvcrkUFrJEalteBkcS+kApgNZPKMQNCvN7d5k+fddMsywqRzocfggOxDg6Ypjzr+6G2gwreiWfMN8GKLODAVWSyCGZ9c+Pz8yESVMxvO36U5tTcNLRNT5PE9jA373uDqzoCPMdMrb6m3iSA1Bh8E/3vlEcmwKLtR3YHhQnXljk6wfvjEKmjIjQxORCFTppkF0vsyFwHGGToRPrdhMViopw6UesXRTCBQjbq7EYLOShpTRZ4fb6XZXkPc10vPLDJn/bC87ueE3TARTNAutZpOEUf6HU2gHrjzmMZA5B4EA3hWTwA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bad1aff-b5ac-41e0-788e-08db2c5d7575
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 11:46:52.3051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ju+o8VHBvBHyFaw8MiEj0lNS+D9E4PzO+kbdAayObzpMaSuc6JoynpvZ3U+LJSJiUxNVMIxGZPxgSXDpnSl36/D1q9oCpSlY1937glHGMQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6082

On 24/08/2022 3:21 pm, Jan Beulich wrote:
> On 24.08.2022 12:59, Andrew Cooper wrote:
>
>> -    ap_callin = 1;
>> +
>> +    /*
>> +     * Call in to the BSP.  For APs, take ourselves offline.
>> +     *
>> +     * We must not use the stack after calling in to the BSP.
>> +     */
>> +    asm volatile (
>> +        "    movb $1, ap_callin          \n"
>> +
>> +        "    test %[icr2], %[icr2]       \n"
>> +        "    jz   .Lbsp                  \n"
>
> Are we intending to guarantee going forward that the BSP always has
> APIC ID zero?

It's currently true, and I doubt that will change, but I prefer the
suggestion to not call this at all on the BSP.

>
>> +        "    movl %[icr2], %[ICR2]       \n"
>> +        "    movl %[init], %[ICR1]       \n"
>> +        "1:  hlt                         \n"
>> +        "    jmp  1b                     \n"
>
> The use of the function for the BSP is questionable anyway. What is
> really needed is the call to cacheattr_init(). I'm inclined to
> suggest to move to something like
>
> void smp_initialise(void)
> {
>    unsigned int i, nr_cpus = hvm_info->nr_vcpus;
>
>    cacheattr_init();
>
>    if ( nr_cpus <= 1 )
>        return;
>
>    memcpy((void *)AP_BOOT_EIP, ap_boot_start, ap_boot_end -
> ap_boot_start);
>
>    printf("Multiprocessor initialisation:\n");
>    for ( i = 1; i < nr_cpus; i++ )
>        boot_cpu(i);
> }
>
> thus eliminating bogus output when there's just one vCPU.
> Then the function here can become noreturn (which I was about to suggest
> until spotting that for the BSP the function actually does return).

Dropping the printk() isn't nice, because you'll then get unqualified
information from cacheattr_init().

I'll see if I can rearrange this a bit more nicely.

>
>> +        ".Lbsp:                          \n"
>> +        :
>> +        : [icr2] "r" (SET_APIC_DEST_FIELD(LAPIC_ID(cpu))),
>> +          [init] "i" (APIC_DM_INIT),
>> +          [ICR1] "m" (*(uint32_t *)(LAPIC_BASE_ADDRESS + APIC_ICR)),
>> +          [ICR2] "m" (*(uint32_t *)(LAPIC_BASE_ADDRESS + APIC_ICR2))
>> +        : "memory" );
>
> Can't you use APIC_DEST_SELF now, avoiding the need to fiddle
> with ICR2?

No.  Fixed is the only message type which can use self or all-inc-self. 
All others are only permitted to use the all-excluding-self.

This makes sense as a consequence of likely shortcuts taking when
integrating the LAPIC into the core.  Either way, it's documented
behaviour now, however inconvenient this is for this case.

~Andrew

