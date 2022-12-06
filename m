Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25486441F4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454690.712232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vxb-0006ri-S5; Tue, 06 Dec 2022 11:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454690.712232; Tue, 06 Dec 2022 11:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vxb-0006oA-Og; Tue, 06 Dec 2022 11:18:03 +0000
Received: by outflank-mailman (input) for mailman id 454690;
 Tue, 06 Dec 2022 11:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2VxZ-0006nB-Tk
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:18:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4fa58a1-7557-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:18:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8924.eurprd04.prod.outlook.com (2603:10a6:20b:40b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 11:17:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:17:32 +0000
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
X-Inumbo-ID: a4fa58a1-7557-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvKlS9qX4Kbi7cM8fAkiKMy7sQn2XE2ZJXKvefprll9fM5J0FpFQB0Fpup/diUiemsYBuJhLnPhg16B0edJiLAzbMbKqBf15EsundJdiA+QeXshNwAsCIW2FACXTP7O4W3sULMTzhyrRm/L9zGLnebj/x4hQUZPHya+sMzTOvqUfM5JJn3K61hXwQ0t0HPlH+fUOW2S0Eeu8rZefU84pOWS/JL/rDge4YthomjNNYY1o1q8TClCfxcG9ypL0gZXIi5Wdtxa2cc3gmPdeggGNY1kZOrY2l1yBhDKF8OHWNb1F9vTqCS3MrKiANtGaXUNmxcbQCS5qFAr9GUFW1YN77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kyp5PWz4fa3PEVn7ok5//hxGEDzO2ejmUFKrVCrohg=;
 b=GK0XGRVck4sbY3Ddm97EGD2J7ajLlZ+Y4PLqteIzGnYxNtabR8GthMS7fo4Yp8zfCBH1aO7U23oa4C4mG47kArNyeK3GMXZiZXk3O+fM0xLgugtGWkfEDJVu8sZ7RrLPxB0CCKNz3FFAnntCPgu9jU0yNDF2grYvbZH9k6fNNpINlyhNkjQ1tmSz/9/+0my4tawHZbEd8+nDG5SKxb+S8UXlH0U4Z+s37kTHbXf/EWv6pQg8X6YVpfdlXSxfALyj3n+HOsO/4Ai4PD4rK1oV/gik1JOapIJPHeHZhjT8DF5stxlDntHPzG6kSsvnQ6/TJM/m+4jggu4A1tW9Gdg1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kyp5PWz4fa3PEVn7ok5//hxGEDzO2ejmUFKrVCrohg=;
 b=1xwNMu7aohHMfI3hDQ65e7bBZqlRMLsAAO2QgCB88/tmCN5GAvlvVQDq0HtgELkY8XnQGsSqAt4VOCOh5594UtuXBmzQM+Kk55aATPu6SoPYMU/BIEcqmJjQWeW1Fq62Y36hWQiPxjcHYAaH6cvwVr0E5NqM9DKRksRFDytE8tlGErYyg2pXLiXWyk/wIDtEK9Xo2ythmjmwCodt0ZkLHALBByk+cYtmglTt3ifRNPyY8KK4IDRy+5wW4wR4LEqHCGnrxLUhE4o50hIIb9Qi3LoLLE8Ri0nOgltcRZarEV+SlFSR2UA1ff5KKyj4QHxzS7w0C9sqPbgZEERWwHH0/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3318fddc-5ca5-15cb-d67c-a0de06f4dda8@suse.com>
Date: Tue, 6 Dec 2022 12:17:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 5/8] x86/mm/shadow: do not open-code PAGE_CACHE_ATTRS
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <52d04f14daca91597f78f60e3a16cce4069bf32f.1670300446.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <52d04f14daca91597f78f60e3a16cce4069bf32f.1670300446.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9604f6-c088-4bde-77e2-08dad77b77e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nA2T4m1JWgXt3X+VKsuaM/0dxJDZEVEVc7rU3Wy54Jy+RGNT1ug5jiIUZpMOWht2ErNfxClXXUbwEPF8TOq69GWTUR5bZcldLZW6ZntmJPD64hnkrEVrhz8TPhWH4I8Je0FWDawgj6Lp586lV51V+hMPnVaaYdPiGm+cfQ3RInujmpkFILiQYIYO+aB8WwOryvDa/x8AopNz6uVl56kySKpM9QfzptSJ90w8bg4bN7T2JTrnfK8Pm3GXogZhpnm01eEzkYrCOzRhAv9vt//2oX/E9SUDmZkliTEWWWbV7JP1P58wiUMzV38GVT2ddZm+n83BbqBYEY1egi6zHyZrV9pwsSj4EgkbTG9J0HJKf4SZCBezZC2IgodnUcpGRCyRTmeR5Z/A9FmpPqhZWccxLuXC+XGeTShBZUqrCMWLgMy0aTimL5g6ZCqYEnRgDgftkjLRYjFGcZcAuZjhTjH+5k/B8IgyGgy+hcKdP8gGDaovSzIV8Mi+QQFVbBPc6xAflWXlVRxC+4exM66kusQwE52KSdsymI+0YAwSLcwpWllNt+hMlSayAx5m8xEbfWLjvW9HzUEP4oXIwcTm78+/pNFOGs2XjjfhsChuwbRN14Z3FHVOTN9ikUO+k9iNbEpdwoBgJkQyJAgNovxyqz/NPzRm1Avw0F8CtXQ9MzkuH91OY56S8IAinH75MkQsMFlzsr7/LBFnacMEjhwjvqGUraEeTEH8i4p/GeJT+Jg7/Tw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(36756003)(38100700002)(31696002)(86362001)(41300700001)(8936002)(2906002)(4326008)(5660300002)(4744005)(478600001)(66476007)(54906003)(6486002)(316002)(66946007)(2616005)(66556008)(6916009)(31686004)(8676002)(53546011)(6506007)(26005)(6512007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWhhaG1QWTJVOWFjWHNlMnBOY1NhMjhIdURuRkNrZEpLdVpSZUxWQzVUem85?=
 =?utf-8?B?ZE1CbVlLKzlaUWJnRy9ZR0xlZGpMZTluZTVVemF3ZElHK1BUZlZrNzdWNFFq?=
 =?utf-8?B?Tk02L1htSCs3K1hLV1JzS3ZuUHh6U3FuNlNSUHpsa3MzbVVTdGs5UWFzUW1U?=
 =?utf-8?B?UENaanFrS0J0UWZEcEEyRHVSVkFKellZdDdaN2JYZld6dmVYWUpob1J1V0F0?=
 =?utf-8?B?OXRMMEJZV1FMeW13VURIV1NCQjBqcm1PZndYRTBRWkUyMno2czMraUtxUmhu?=
 =?utf-8?B?aDhOVmZPWDdtbVhvalo1MEMyTlViNlRIZ2tqZ25HZmZXUndBYXRDd0g4TE5k?=
 =?utf-8?B?OHZDVFhjcXdVZ3hLODJXN3NaRzd1ODZpYlFXelRxUHZjZVFPWTB5ZDlsN1F4?=
 =?utf-8?B?YlVjc1VBaVljMVJHOUdGdml3bHB0UDFaQ3dxNUdCR2hQQTdNak1Yc05Xbm9G?=
 =?utf-8?B?aERzL280cHcxS25OZHk0UVp2YU9zNFB1U2l6d1ZJNmkvZkFrVm80ZXQrUjZ1?=
 =?utf-8?B?SjBrbFBpcWVibWZ5c05COS9CWjBKVWoybkxOVlN6VnRmZkZGOXh1a2xuQ3My?=
 =?utf-8?B?ZjROZzdhbmtOQy82ejZaSzJkQUhvNEJobTJKOHR1Mjc5dzh4V2orVGYvaUlw?=
 =?utf-8?B?V3RmSFNJdW1aSFQ1VXg1aUxpN3lNZ3FURmpXTlVlN2l3Mkt1VXNzYm91bkR0?=
 =?utf-8?B?L3c4eHRremZzUHBLcUN6ZE02b2Jwd1NPbjlNcGIrcVlma3p5UDdKL3BJM2FT?=
 =?utf-8?B?N2VWZXcxSXlKTDZtaHFCNWg3ZkpQNmZyaXlDYW94M0xZYnlaMUw5bWdrd0pl?=
 =?utf-8?B?UUY3NXZLNEx0T1dkUCtnMGdxSFdETDkwaDdyeVoyc3Uxamk5RGx3MEo0QThP?=
 =?utf-8?B?K2tIYWo0ZWxCS3hlSDNMRDN1OHVKbXVXZUVkWUE3NEJrVXFBVVk5K1AvTE9q?=
 =?utf-8?B?YWxoZGw3OEo0SGNBNDZ0RzlwQXNNVUI4WlJXbFQ0WEh0UThER043M1AwZWd5?=
 =?utf-8?B?cDhqcEtFSXcrNWc2aFMvZGlqYXdjYXFmUFlQbmtONUczenQ0RWh3WVVSYXlw?=
 =?utf-8?B?LzdPeXlJNnhzdE8ydTdwaUZRbGJDY2hsSlN2RTZwdWhucGhlaGd3OVBTRnMw?=
 =?utf-8?B?bzVmb3JNeG9UbmtNa1hSY3RkUGVkSEE3Zllrb0R5dXBzWVhBTVhJeFdQNGR3?=
 =?utf-8?B?bHg0MG5oUVpLQ0NLRjNUZ1JkVytRNThUdFRJbU1lN3FxcFpLdGhQNDlFWnFv?=
 =?utf-8?B?SDZGOEJrempQdWZtSEFkZkFnT3NQU3NqYXdPY09kVGswZys0NVVteWx6aUJ3?=
 =?utf-8?B?VUhKUFJvUEpacDJXZ0JwZFpjcE9zMDY0blB4Q2ZlM0k2bmwzendHOWsrSGRl?=
 =?utf-8?B?MS9TKzNHTEppaittQUcrbjd0SmpvbjhIakdmckVHZE9pQ1M5QUdBNFJjOHd2?=
 =?utf-8?B?YlBNQnhzeExGYVh1ZHpQN3d6cFJQMDNsc1ZxWVh5Z0tFck5uSVcvOW1KTkZS?=
 =?utf-8?B?SFhxL2Q4TFJCc0tOeUlMM1hkbStKbzcyNENCNFBjamoyWThyTEdMNWZYZU0z?=
 =?utf-8?B?Q3IyazE4SDJmZGxSM0VNd3JvcEVqbmpJTWZHeUpES21POXFUZnpLN3lMb1ds?=
 =?utf-8?B?YWVxRm9uL2pYRFY1YWNncllBamZvUG9lL29DVTJNVmMyRzNpZEtUZXNBa0hk?=
 =?utf-8?B?RzgxN1BEa2h5VkNXUGtUMVVlNjh4bTJhNThqalplVEFDOEQxS1g3eUU4R21w?=
 =?utf-8?B?TmRuNlNwSWtYaVF6ZkhzRkErdlVIbENrQTVjVStkUkZUZ2hmbWNVNFNOYWR6?=
 =?utf-8?B?Q1lXYy9qeDZUN0dLRXdqV1pTS20wcVpKLzRraDVlRi9UWUJyZU80RzI0TVcv?=
 =?utf-8?B?TUZ5OWNEUi9KSExUYUtSR1hoZHdUem1JcnNkTVRWR0JaSDNhUldYaThJaDlX?=
 =?utf-8?B?K1N2WFpFNWJxM1g5WVRTU3JjRHRMbWVHV3pGZ01DTmsrcnZEUnh3ckUrYW1H?=
 =?utf-8?B?S0VaNEFDNU1GMnMza3RxbWZPajBoWnpGcDJyMVErYVRQOWlUM0s0WkF6K211?=
 =?utf-8?B?aWkrUzhRU1NqQ0tHandTMWMvWHh2b05lU0FxV0Y4OVZKZzJuSzAzMDFDVWhx?=
 =?utf-8?Q?KJnLJh7nuppkqMPs/2FDeUDj5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9604f6-c088-4bde-77e2-08dad77b77e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:17:32.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbXsMtVbNfzEsKlSHCgMjxIlCascmB5sSKZlJyO6bqL5DLk7SRFKRDiCleOqT4blywLMVUz9r0pn90+W3XvtHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8924

On 06.12.2022 05:33, Demi Marie Obenour wrote:
> This makes the code easier to understand.

Personally I'm not entirely sure about this, but the elimination of
open-coding is worthwhile in any event.

> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



