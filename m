Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74869933C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 12:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496481.767252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pScZJ-0008Oi-JA; Thu, 16 Feb 2023 11:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496481.767252; Thu, 16 Feb 2023 11:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pScZJ-0008Lh-Fy; Thu, 16 Feb 2023 11:36:53 +0000
Received: by outflank-mailman (input) for mailman id 496481;
 Thu, 16 Feb 2023 11:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pScZI-0008LV-7a
 for xen-devel@lists.xen.org; Thu, 16 Feb 2023 11:36:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 310d00b5-adee-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 12:36:47 +0100 (CET)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 06:36:43 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH8PR03MB7173.namprd03.prod.outlook.com (2603:10b6:510:258::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 11:36:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 11:36:41 +0000
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
X-Inumbo-ID: 310d00b5-adee-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676547409;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dbij6wud+VIMPRG/4dhS69e7R62YJAqGrWpkgWI4CTk=;
  b=EWD3V7TFmev0U4gHybb3dKbt3Y3h+H3B9+9qvPcvFfYLINss2nNo74Ng
   ILpeyhG1OfZRAx3s+3NpNW0ysa1dLvx+/nkNxu/eDDHiLz9or3t6D4OSK
   7TQPp3EpXTU3t7xYSPb5UDZQkYMbv0YKXYK5QYk2GnHCyERJn36xfZf7Q
   s=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 96132332
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iGVfnqKhj/t0GkzxFE+RS5QlxSXFcZb7ZxGr2PjKsXjdYENS3mFSy
 GJOWmGAa/zeamOmc992aYm38koFv5bXzoNiGwBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AVgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57W0MT/
 6U1dAkOQRbZ3tiw6YKgSMlz05FLwMnDZOvzu1lG5BSBV7MdZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTSPpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eew3qgAtlJTtVU8NZjhVGRzzUCIyQRRECUq/qko3O/Usp2f
 hl8Fi0G6PJaGFaQZsf8RRCjoDiHoxsVQfJUEusz8gbLzbDbiy6eAmUHVSJQc9wOu8o/RDhs3
 ViM9/vyGSZmrLqODH6Q6J+TtXa2ODMJNikGZCkNVwxD5MPsyKk6ih/fCNxuFqi4g/XxGDf52
 TfMqzIx750WhNIL1qimu0jAgiitq4LhSg8z7x/QGGW/4WtReo+jbIGu9R7U8PdcMIGFZl2Au
 nEenI6Z9u9mJYGAkmmBTfsAGJmt5u2ZK3vMjFgpGIMunwlB4FamdIFUpSp4fUFgN55efSezO
 BOP/wRM+JVUIX2mK7dtZJ68ANgryq6mEsn5UvfTbZxFZZ0ZmBK7wRyCrHW4hwjF+HXAW4ljU
 XtHWa5A1UonNJk=
IronPort-HdrOrdr: A9a23:K97zaKOWxi+Oh8BcTvujsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQyVxahZnOnf6gylNyri9vNMkY
 dMGpIObuEY1GIK6PoSNjPId+od/A==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="96132332"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDeDOg6BIKI0X++IsNY+ApvEzcsK8yrX5g6K9DwKXSeQ66Fg1aHcx+nvB41/NLqZcnWHNPCt31RhGt5d9zp2ZzKc92iyaeCdM762lTM9aI4AbbO1mPtO4+7+hO89fCIz7R6O8PPti+NKNNIusoyXlhSBTwU3KzK1V2cqPSDHtr9oZj9sP0p2XppkKRu2geUAC8Qa7l86+SQjQjPEg284ft+D6oiZv3HQn76CQo16gOm1agno9BzukZIzud1rDb+6cZM0pJ09/e4r7krrbEsvd2aCzloe2m/jcF93TDEWkYYejsSCQPgRH8cMTjr22o4wCodM4YL8NeOwNxWOcVRlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbij6wud+VIMPRG/4dhS69e7R62YJAqGrWpkgWI4CTk=;
 b=fnWaozxLzkrobOHXfY1oqWWR4cpClFQN6/gH6rLbVtTz7Hco05ccLhUX3vpnsBLp83Mu/Yf380qagkt8vpFBRPANezgmMg46R5t2D+DwitCyIrDHqpLQMvYeGypEtJ2goJR6h8YNeuO4uLJ1dztbhZw1UOhyFjZPm81mP6EgVSs84Yk6ilHBQNxjBJK+Z58i2V6wKKnY8SseEttabdBrxDfTOnAi174iDtvdAhAyH7lcl9QNqAAIkZ2neF4HgQaTUm0EqH9EzxTlvkHThqS2PxJh7jn90WxYNE+V1BATkYIMxROFNq0gkJ5wBVqRShX2k1axvOSsnbuJQWd+ByClNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbij6wud+VIMPRG/4dhS69e7R62YJAqGrWpkgWI4CTk=;
 b=hGl0KNUvCQsvN84AlUuLF5hVqnVO0bJjk2fzBc2kNEL7zZqa5AhJy0m0MlNkIVyxuwMmqhdxrRneIBsw59AwaZreYCAZhmET94c0YwMyUW/v5ChBU8LFZvvL/thg2Ma/VS3Hsxzm5A24id+VteYiJrw576aFeGYDyfq8X+Ch+gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5d945b2d-048a-fc66-023c-377f494b477b@citrix.com>
Date: Thu, 16 Feb 2023 11:36:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Discussion] Xen grants and access permissions
Content-Language: en-GB
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org
References: <20230216111325.tprjr7rdr52iqvmm@vireshk-i7>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230216111325.tprjr7rdr52iqvmm@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0517.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH8PR03MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: cefa2d12-198d-42f5-c0c0-08db101212aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZF+3YLJjF0YLf+xtKV34FQzQtaTiKJ3KkdbDSFLQ0U0RxegwHM6fg2wi9T0HrxESaVkPDpXA3EyeEKb9kX7g2c9KX4T5hzOWpDxKViduz54dzgkr0hxzr36WEbQto7sDKAS5gvKu6fkWAXqGO8oiI1EPt/3wCrklv8TcGXN74x0sqAh8sEVIWhO7C64ktefFUWS9sAroV7+dxnf0eRKfFKuIDkmLH2IV5todMCvupyPNu5zuUdaKGt7Wl/J4XdV6F/oLBpEityZ9ZVmigexDpg+0M7LybGxSKUXOrzdNXzfhw2VeSHO39ErMzNDE0U+93i72kPgUiSLEOOVJabv4Zi3D0mdPNMTw3AdIcsoOQ5a/csgmnhvhTQybfFXMTCuiaj0PzKva+UH/mINIC8416fNKrxPls3Z2K/YMi1IKc14JJS90p8s6PXSMhYeyF//WDGK184MgalnB7wqSQRlAdhf9WhN8PUlBr3BCB7fo7wGUszR0h8MPqJLc8Zvc/lNeR8VXaH9Iv9xSTSQEvFjzvENQfl2rvpNSBeHq8XPyj8IzeU1Kr/8vmfKMtP2pLjggSfkDx7dqqep9/zda/BklGRE14pSOfJ4Bplhv0UIEnlO6GBB+K68vuGRbLjx+t1WqxL5fk6DS2HyITgbWHuUPevU3+NSEWBNA2dBSLRjou3n/e6HAF2qVs8fHT2Ieqv6qxlkM2W5xWy5cW/Bg3mAfdOjqYoFsYTxyaoapIYqqkUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199018)(31686004)(41300700001)(38100700002)(36756003)(82960400001)(2616005)(83380400001)(478600001)(6486002)(5660300002)(8936002)(53546011)(86362001)(6506007)(110136005)(186003)(31696002)(6666004)(26005)(2906002)(66476007)(4326008)(66946007)(66556008)(8676002)(6512007)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzRPR1BGMllXcDc3WHp1dmxZZWdsQ3FrZ1A1ekIzRTR4Qlp2enRpUTdKRWor?=
 =?utf-8?B?SkFoN0MyaHdHZlEza3ZqbU95SFU4SkQ1dllJZXBlVmlDejVHb0FwQWZhcWZ5?=
 =?utf-8?B?K2NKUXlCZHZDQWFtSWpENG11REhmS2FQbXRVRkltRTdwTEdoSjcrRllCMlhU?=
 =?utf-8?B?SnZwQjZ5eXU3cjh0dDZMdjFlT0lDRVpTVUpmZnBYS0pIOEF5bzMrZWRtVUZ1?=
 =?utf-8?B?bXFNMmRhNGhVTkFMZ01uUWpwR2ZSZ0V2MFJBWUN6RTRkT2tOWjlBbGVXdnRv?=
 =?utf-8?B?Q1NERmRSUGd6VWlUb2NPSVJWWDNPUkZrV1pSQ1Jrd1hVbmtpVGRSZVZKUjVX?=
 =?utf-8?B?MWZ6ZXlwOWJuODRzcU5nZjZzUDREbElRMUtSa0pRT2poTjBKT2I0dm9HQnBS?=
 =?utf-8?B?SnpWTUFoV1BRV2J0QmQzQklMRWFGdGFZNk14ZWQ3QXBmSlBxQzRNeGVjeURw?=
 =?utf-8?B?U2twMUdNOG1sbng1Zmt1RkpFeWxWd3FNU2xjMXVjamtiVDdnZWJ2YWRxOVBI?=
 =?utf-8?B?eno3WkVDaHE5UEtLc25zU3JRLzlMdlFKYmxvVmc5QVo4MVh1RVE5Sk5WSXpJ?=
 =?utf-8?B?MWxBMysvRmlSRno0UHdsQ2JPVUVSZTZkaHRON21rSGZhanJHZlo4SVVyQTlL?=
 =?utf-8?B?YWUrNkJ3TS9Gd2hLYy9XOXI0MUJFZCtaMnl2NlNORlBxUUQrMmp5SkVjWWRm?=
 =?utf-8?B?MDlOcEQ1NXhJYVo4RkVPN0lDK0FTeGIrR1Niek4wS0lzYVdOMEk1ZmZCLytv?=
 =?utf-8?B?c0R6L1VnS2hhV0U5QTNqM1VnY1ljbXVIekcySEJSVkJVM2xUcVVxNGNvcWpj?=
 =?utf-8?B?Qmg4Vm5HYVZhYVlBeC9sMkt4S2lMQjI5ZUdUeml2SU52SmNkZTNQRlZQLzVB?=
 =?utf-8?B?K1BLbHhwNlF2WVZJdGkyV2lacit4M3QzcW1nYXZob2t1cnhvRXZEV1J1M2I4?=
 =?utf-8?B?Yys3SHBZM2t5Z0xqWjhXRFdBd0VUWFIrYzJmM2RtMkNTdVRuM0xVMGlrQmh5?=
 =?utf-8?B?bjJRMEttRTUrVDVDdkZlVjVYaS9FeGpvakJZcHJMeTNQWTRnWGM3VDVGMk1k?=
 =?utf-8?B?OXJjUXFRVmplUTEvczk3bDRza01ZYm1yakZGZXpMUFhrNTZCcTBLM0k1YVRR?=
 =?utf-8?B?L0d6emozWUdzQTV6OVp6RzI3M0VqREhMWkNNRE5RRXBKYk4zK041TCthNmFa?=
 =?utf-8?B?SXh3Uzl4OVhuamRNS0E5ZWhaTFdEYTlmSWh0OVNFbDZ1U2xnYVYvTWdyUG03?=
 =?utf-8?B?M0pOSVNJaGoxaTI1OTBQcWVXQ0pZZEY3VEt2SURuSU1pN3R4L2QwdndrL1Fw?=
 =?utf-8?B?NU9pbjlKN0ZYaytmYU41Qjl4SDhmVTJ3VFVwRkU4aCt5VyszSUdCYVIveUc2?=
 =?utf-8?B?eGM2Umo3ZXMrdncxMmNWS1FFVFF6MCthOGp1TjBpbVpOR0hqRXhaNDFwUDdw?=
 =?utf-8?B?aThSb0VOMWNac0c0aFMrRUZ6UWlic0s3dHV5NWRNKzRzcmNSQ2doRjF3RUZl?=
 =?utf-8?B?UVFUbXNPK3RWU1dvT2owTFcxN3ZINFo2bG4yYjRlWmhZWjZpYUN0T0h5bUpr?=
 =?utf-8?B?WCt6RXpqKzlRZUlpdEswYmdzQUZmcXVDa0JGL3N0SnNzaVVicEdKYlh3S2VV?=
 =?utf-8?B?QWFwRE5zVkt2N2ZEOTczWVdFM2tzTks4S0tLVk1QZm8zNFVoSEp4bk5TV1Mw?=
 =?utf-8?B?ZXBIMWtHK2M1OHBaYUVKRGdNdHJ3NkRDVDljY2cyNU5KbktHM0Y2WVMwTjhs?=
 =?utf-8?B?cm5pOWkxOGdlUjErcFhBMm9ibXV5ZWluaVhWWTdQeG5oclRzQ2RsMDhuVDBD?=
 =?utf-8?B?M2M2ZlY3NGhZUXBUMFFGc0FWMnFvWDROSGNBbEk5RnVIcjhJMHF6b01SMFU0?=
 =?utf-8?B?TjBFY2NSaVNNL1hYakxWMzBsRXFVQWx2M0hlU3pDbHZvWnl2ZytXVjhPenZU?=
 =?utf-8?B?V3NVMHpEVHFyQ25TaXBlZUFEYWNTT0MxdkJKU01HS0w3dXFJUEdVSTZ1K2dz?=
 =?utf-8?B?Z0x2ZU9oUDA0b3VpMTdBSytjanJCYXJYRDJuOU1ITG9XZGxIbThJN1J4QXBu?=
 =?utf-8?B?M05sSGFSTlIreVBpVVl4QlJycG1YMlZRbUFKdGJ2NHlleEpmR3VFQU5BOUJ6?=
 =?utf-8?B?cW5KVEI1d2h6UWpVcS85ajJnWXJ4SEpDVVNtRmxqUVIwWnpvdm40M1QvVkI1?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mkQnCM2yV/tXDYvGfBhICyb+dgVmNy4GDDY7EG2bqPejiNOSCmyuv3mlQjnqvrf0wGhzPraGHM0RNmlSnOEdfbvtq0EiRctzMYbhKYtrX3wmT3ioKyHtFHHUoA3UY2QgGc12/hI99mMZmyXS8Eyz4WYdRO6XIOOLcoIuwj8xwtrUT56D0BbLYCOZmE31ebg6TE0fd6Wzpbe/cVlOrSlN/93/S62xv5XPcoITmX8F/h0mU9ECUPyqhtLwmDa7FZW/As/HITAqRy6yRDxqJqaSK+/tug/TdWW8H/j8OP8skW5235FhdMSKraV9ydd6YR/0oG4Ai0bmOTCK3k6h/3CGB0VlN3+Y6c4GWqPT9emfhU5NAsBTFPvwPFmELxLJA+CZZd8RQvT/+m+DusmXwsadTRspdVtnqRMFd0tKO1EciqCUnSZ6xJzU2FtMXr06/3ypN/9UBG1V5/ZW2Ch9LeGOJg8Jhm0FsUAxhpq2w3YB6qqXjHsD7hm8ZIcfdyVK1XE9nGxbrQw6zujMwaYq+vDjyq+ueVyTrVkky7kRvB9xE97I4dM0kb1oMd7DjeY00l/Ud4vPTAdlDDt7axBI8GGNXnEPpyPDhc/N0C3KrQav44BJ8JB1E5FsIdUk+Ey5/EnnC8If7twm3x+Ou/Fjb9oenjl2dhiD+TEanLOgRnzEY9gYMayevKo0gBH99pNVH8PnudckEZHpzUd8odJpPE9BDhILeB5K/mGqVmw4VEN+Az20HDrFSIIZflk9tQbgUmsNnGiDYvcWs8WdJNp/p41rPgnzgNnsMeoYinH4n60Q4Bu3/nNptakI6XT/o2duME3vvx3nK+ZKpqrzSd/ZSFGTcdU/YI2L2XSkUv5X2q5gBXzV6W458kSc/1yY37pLk0FI
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefa2d12-198d-42f5-c0c0-08db101212aa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 11:36:41.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwqepL9QfFpN8urNtJS4//wo0hTxlOb62vI7dPDTvqpmrkp6UWad3IUxDjxgS2jSFCuSexjN8SlOoNlUW8x+GdCiIk31rbeotNgUND0BxDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7173

On 16/02/2023 11:13 am, Viresh Kumar wrote:
> Hi Oleksandr,
>
> As you already know, I am looking at how we can integrate the Xen
> grants work in our implementation of Rust based Xen vhost frontend [1].
>
> The hypervisor independent vhost-user backends [2] talk to
> xen-vhost-frontend using the standard vhost-user protocol [3]. Every
> memory region that the backends get access to are sent to it by the
> frontend as memory region descriptors, which contain only address and
> size information and lack any permission flags.
>
> I noticed that with Xen grants, there are strict memory access
> restrictions, where a memory region may be marked READ only and we
> can't map it as RW anymore, trying that just fails. Because the
> standard vhost-user protocol doesn't have any permission flags, the
> vhost libraries (in Rust) can't do anything else but try to map
> everything as RW.
>
> I am wondering how do I proceed on this as I am very much stuck here.
>

(unhelpful comment) This is what happens when people try to reinvent the
wheel a little more square than it was before.

If the guest grants the page read-only, then you can only map it read
only.  Anything else is a violation of the security model.

So either you need to adjust the guest to always grant read/write, or
you need to teach virtio that read only is actually a real concept.

~Andrew

