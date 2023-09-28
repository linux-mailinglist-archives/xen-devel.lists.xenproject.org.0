Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1548A7B1378
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609284.948275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qll0H-0002NE-CD; Thu, 28 Sep 2023 07:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609284.948275; Thu, 28 Sep 2023 07:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qll0H-0002Jl-8U; Thu, 28 Sep 2023 07:00:05 +0000
Received: by outflank-mailman (input) for mailman id 609284;
 Thu, 28 Sep 2023 07:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qll0F-00024S-PH
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:00:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a54a30f7-5dcc-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 09:00:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 07:00:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 06:59:59 +0000
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
X-Inumbo-ID: a54a30f7-5dcc-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcT/wUXUqTb8SX041RBhvMJLVWRDVeZa6GESxoXLMOk29oVGPpzlPvAVatedZKYylnDhc0pDsMSYE9gl4lS7tstd1Ip5D9bqCO/ljoWY0xjsPCqEzRzEmTPXdFu0kj2IZbqfkLmQxhWAWo+Vkfcb4Tou7G5FG18UdXj2oFou7hwDYW5SauDOZ8OFspn5RVZ8DVUTcQGU8i57ZMDDCwV42BrvvjXewSK8X+p8EjBlcskY9MhV/NACgLGQhFr3ogKL3mYohvz6qU3buyNtTk0ZbBds6dWREYVUic86A/vRsNc5IGYS8b8/nVO5UJjPJcehE4TvixUTFoiiDZ8jzxvOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5kVhgsmVo6prWpSNz/DxhQUVKA2Z76+pRoLqMJ1B5g=;
 b=n12Kql64z3avHJwORdVhjHPtTD3E01bk4V88VRIDPdGnKo0KcviSJe7e1t6Tj8cN16sChQMr24bGVxs/XVekkZopde1ATNFfnkOPyEq0/VJpEhvvNu4P867xmY23HgREscUmztjqk/5P+cTXG92IfozJXtJqoprL6u6rk6mliJpgTOnPfD1t1vZ8smMrBoEAjB5k1+D3eZwOslyjaWHZzpqg1MACW+neb5zYju9b/jH907kmb5+d9GwK6TATtasCo4Rm+0US3zelja3A384GtDK06RH99kOqXVhr4EW2Ajkges7kYgcTY/103C4G+R614gQi+Kqx9TYdSvnEVb0lXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5kVhgsmVo6prWpSNz/DxhQUVKA2Z76+pRoLqMJ1B5g=;
 b=0qtwZN/XDrk5MGn+wx5/eVBaO76VDcuSUt3gS2DTRk5V0trjCSJ6UI6r5lKiLF4xPYBI4HEpn6EwDBOBI7jJevrbLAc7jz2P0+VbEEisFR1/VfVOlPmsEIy69L52GsW+V/0ZN+4tZuUfe79rx4+hGG614pEahssAijIU903SPYADskRIl0+52HEqeZK/aNOEllOkP93ItgjWZYaC77ebqhdrbzjDBVWAN6Xg625wTtJk1lTw77b5Z7jfkibudf7xZnBTneGja0BeTZ7LxVTc+p2iYtlp94iApBXUXSVQmaRTd59vDe2Ss/rtmAqDq2v+sr14bf9uIKiMllMlcWp6XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Date: Thu, 28 Sep 2023 08:59:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/9] runstate/time area registration by (guest) physical
 address
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f90a52-22e7-4e22-f1af-08dbbff087c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xYKtjCZ9CiMQ9oNoqtsqTPZ7HyrCnoH0leh9erD5j35RZ4tdEdH8/65CPYvJ9F6KpZM0Ox5REWPMMZrhu2iVXZd1M6PzneIuagTq9O6ExW/SDRmUtOMw9vI4i8oGdQfzL9SNKVpY5O5oM8B6SkYyGfSDauvTGPMxll8hfY1gyrmuAU9ro88oCUFx4S42raWj9jtPfMy5lOTixGnFDWUZIK+zst4zJJsXMY+uOJaGDsYzsmzk+SSg8TJ1Rcq3ENN0aHWRSQJIB0u9EK+OBrO3HetfsRInsQonqSfRGnYKryC66C7klyVi3zLbP3QeRr/SdjpNcd7WKdhtD41L/YJ6sI480MvfimbjLzjAZQ22Z5l/UYWC5V36CvZ8Va++VludONahfoO0lfgmOI0zdQBWPigl4zB7yDDzNRjvCungs4el4suaLKA6AJvnwNCLIdbHBMtk2Nz3w9m+Dy9GHyskDfEojGEnlyVOvXtz8Jd4GFaaqeorwJQV4lVG6mNpU7djK6j6qCcodBSTmY1+2sFqMw6x84t+EPxQUnJR2Qi+/YzZEUwxQHsRlqEKpZ8Q26Bt7Wgm6kxU0j5FHdyVVkBauMTxc8ZRdhI9hwzRgrQ+I12KxJ6lLXVx3TM+JfIYnnTiigPWV6zoQoClMG55VW6mLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6512007)(6486002)(6506007)(83380400001)(31696002)(38100700002)(86362001)(2616005)(36756003)(26005)(2906002)(41300700001)(316002)(4744005)(66476007)(6916009)(66946007)(54906003)(4326008)(8936002)(31686004)(478600001)(8676002)(5660300002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R29XaGJibDhkNzFvdHdVVDIxUU5RZ0h5QUJLcWM5MUtEbFlPNVh5WUNKMnh2?=
 =?utf-8?B?ZUNobjV1blJLNkFsVTU3bmpJMkdHekE5UTNMa2xGenJTWHZqKzdyNDhjbWpL?=
 =?utf-8?B?bDJ4dDJHSTdjN3RhVkl3MC9JL3crK1UyYno1RlF6M3l6R09ScWN5UStBdVNJ?=
 =?utf-8?B?RWRZZDhacXE3OFFXdHk1c0h3MjFxV1NtVmViaml6dDJ4Zm1XVDltblFBMEFW?=
 =?utf-8?B?aTZlNVR5b29aYTRkMHQvNVE2bExPaTFZMm9XSU9xVzY1OHhTRDhmR29wQkNM?=
 =?utf-8?B?aFpBanJsY3pNN2VEWkU2UGlJT3F6bVA2VExoYmg2ZHZjVnNHdUhsU1RzNVJM?=
 =?utf-8?B?THdLc0E0K2FjOW9QbEJZTXQzRHJBUjB3RDVkUDNXTEl0ZDJSZ0ZxZElEQXdR?=
 =?utf-8?B?WG5NajEwaGtIVDJETW1icmxWdm5LMlhKUUZwUWNDVEZteUpaUjZ4b25IdlAz?=
 =?utf-8?B?cXNLWEJMYVEwcnFhVkJuSitIWkhWK29DR0ZzQldBaDg3eGQ5K0YxTlRUUUFn?=
 =?utf-8?B?YWowUVdBRWNMMHRtaVZQQjY3WXNMZVk1ZlpxbSt0c0Rxc05SMGFpVGljcjVl?=
 =?utf-8?B?dG1laHFTNm5RSU1VT2pBc3d4V0NNRmw2YmJGV2ZSSmlaUXhFWTdEd1owekI5?=
 =?utf-8?B?SUltTFZGMzhlei9NZ0toVDZNN1RSK21YVVAwWStOTm5FbDdncFE0VUMyRlZv?=
 =?utf-8?B?RjZySDE5OGxoWlRlRThRZ0J6NkxTTGdNTkYzbzFyWnB5YjVvdjJVdXZ5U21B?=
 =?utf-8?B?ek5yV3dobjdEN3FlYVA2VnR3MkNjTFV6OEZ3cWNOVEpBaUR5ZlZGZTlzWDhS?=
 =?utf-8?B?bGZZMnZrOGRGVHdYTFNxTlN2WVdrQUdvVTZWWWJMM2ZiWmhkRzlmOXVWK2pr?=
 =?utf-8?B?Z2FiK3l2UmhTLzhpSmtYQVB5Yko1Uk1TQmUyRUlZbmtpUjl0K0RPYnp1K1pB?=
 =?utf-8?B?SDdCd0RqQlFhOEFjZy9nZmtjQkplblp1bjFxWFZoWThBVU52Y0RTQ00vUFRi?=
 =?utf-8?B?MFBpMFl6QjhESWtpbnpRUGIxc2FRY0t6bmVub3VNNFdRRk9oRTJnbEx6S095?=
 =?utf-8?B?dnVjaDEwSUVidDlPOWV3WUpJRFZqQTdxKzhoMlhRSzlySHhtQzA2b3prWitP?=
 =?utf-8?B?czBaemc2Ky9VaVpqWmlXN05UUWNQa3hhNFBNMWVpUHRsWkdNT1dWcFNhTWlH?=
 =?utf-8?B?Y2N1OGtPNEkxTnNYbVh1dytoOEhUQk85Wm5rUUVLaE9DaU5ZVnZtS1c2MkR0?=
 =?utf-8?B?YjhzZFpqWlQxd3luTlh4QjByYkJUSCtjSVBFREhLT3pMN1l3YjNTM3NsZzk2?=
 =?utf-8?B?MC9iYi9NY1VXYmhoVUg2RWd5NFlSTTJva0lWSnVsaDVGTDl2ZHpFWFhmOGtB?=
 =?utf-8?B?Vkk1VkZiUUE1SkxCZjNsRGVvSEJMSmhpMXlzKzRDbFRRZ0dMRTJwanU2NXNo?=
 =?utf-8?B?ZlBMc1B5T082SUxHb1BObTdvUkxEMGZqT1F0a3NnNkNYd2xDemhqUGo2QWZ4?=
 =?utf-8?B?ZjlRSVZMZm5MaXBsUGc5Y1Vqa1I5WXd0Q3RDcTdtVGp5ZWY0UUx3RHF3SEsv?=
 =?utf-8?B?RkNTbktkRGFTdWtOVHI4T0NOMUt6S3Fnckc4bFpnMjExWFg0VmowbnNNOEZM?=
 =?utf-8?B?aUpwOWJ0S0RHL00zM0gzY3ByWnVRM2xWRG9lZGVSWk5teEhscXV3R1BzMFhu?=
 =?utf-8?B?SlYyQXg5bjlvL1VUU2N0Q0IwRGRkSEM2TkpFeUF3R2JPSm1YYjI5L3Y4UWJk?=
 =?utf-8?B?d3VMdDRqRzdYajV6dXNWUkpTWS9NbjQwbDltTDYzcVEyM1VpTFkxSXVZQlhy?=
 =?utf-8?B?aGxwSWpSUEtrQ0VIL1Q1SU03MlI3R0VSK1FNTEZISlAvUUZUbkJ0SnI2a244?=
 =?utf-8?B?ejc3TEpWMGhtbU4xM01HbVZKb0p3T1VZMk8yYzVqb3U3dzRMYkNzSUhCMWMy?=
 =?utf-8?B?dDhhUURCcUVWbkJpM1l5WWdvQnpzclExcWdJaXpGcEY4eGttTG80V3Z4aFcr?=
 =?utf-8?B?dzQxSUcvTjMvMlBoZWd2V1NMYlN2dlFPcGlHV2swUTMvUUFEQWlTQnZIVElx?=
 =?utf-8?B?TEhhS2pLUjc2dm1uM1N3TXNibmM2WXVOKzAyOGtCVVVRV1ZMbW9GM3lGTlI0?=
 =?utf-8?Q?zL9SeAiho+NWRUfCrMlJQQWXH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f90a52-22e7-4e22-f1af-08dbbff087c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 06:59:59.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p8b7SZv2ZfgZOyfNNdumUMdNTsQHi9dMYGSp7ckGxiZWdBPT0kB0fnNOxx8pXrhtVO8yxclfGvLWwmy15N1IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

Since it was indicated that introducing specific new vCPU ops may be
beneficial independent of the introduction of a fully physical-
address-based ABI flavor, here we go. There continue to be a few open
questions throughout the series, resolving of which was one of the main
goals of the earlier postings. v4 adds one (small) new patch and
addresses review comments; see individual patches.

1: x86/shim: zap runstate and time area handles during shutdown
2: domain: GADDR based shared guest area registration alternative - cleanup
3: domain: update GADDR based runstate guest area
4: x86: update GADDR based secondary time area
5: x86/mem-sharing: copy GADDR based shared guest areas
6: domain: map/unmap GADDR based shared guest areas
7: domain: introduce GADDR based runstate area registration alternative
8: x86: introduce GADDR based secondary time area registration alternative
9: common: convert vCPU info area registration

Jan

