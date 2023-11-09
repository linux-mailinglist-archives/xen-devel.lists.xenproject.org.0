Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA87E697A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 12:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629624.981957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r138b-0003qW-MO; Thu, 09 Nov 2023 11:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629624.981957; Thu, 09 Nov 2023 11:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r138b-0003nc-JQ; Thu, 09 Nov 2023 11:23:53 +0000
Received: by outflank-mailman (input) for mailman id 629624;
 Thu, 09 Nov 2023 11:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r138a-0003nW-SG
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 11:23:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c5f3f0-7ef2-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 12:23:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 9 Nov
 2023 11:23:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 11:23:49 +0000
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
X-Inumbo-ID: 75c5f3f0-7ef2-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8eHRTdapjvOhbO7d5W64xqffyscL0lAu2Kj3UBUG5drrLHfM13xPMs3Lv3/t9VP5RyGoz5R9oOHdAiZADb2QJ+8oSQzL1o+BoKHBymr+Skd9Taboh91v9uG7R4H4awlIDNXdiUKD9rLLcNYDP1eVdS1olNNfdIMS0UwVsK6MVML4nHMosGh9UEljIdqew04M8JNy4eqqEemDrrgv4dDaCL5pV5yn1hRor06BbYjT8D6zRRd7b/yPtd/L94Ssz9LZyqhIKI2euCOjrk7cZk4zOH36UfQmgxtQM27AT9YXDI5l2Kv4EDtzY9v5nH9rXOBb5A/XpvtZGMqfy5uDsiDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRE8iGgBZjEs63+Af8aOXW76TL1xnAyk8R06PNS9KBc=;
 b=I63vmuf5PnfX48MVCenkuRT7GfF89IOj5pyMrEJ1nADVDXm1Aqn9FzCqcZ/tAebIDz/REshayyFQrtuSgGrV1799rv5KSD4/9On47TTCUL14l3rCXFFXV1lTwKsFEvJo4SJoeFMgmtMTow7hT/VWtR2R4eoRJFRRtFRHWnUoOgRKl9iulB10yIRT4enupc4/XFdfY85pogprbwInaJjO48owDg0J7tCw+NN/wz4tjcONgwc7zvDaNJ+shnVSVS+qoFqf7xjUu/W/uCdhDfrLEMmJMqQlMOFvE8+eLgjh6QBs7Q/2RNOW5iKmci2bwT18Gpl+GcpD8bl+kJOXzwXMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRE8iGgBZjEs63+Af8aOXW76TL1xnAyk8R06PNS9KBc=;
 b=ai9nz7IT3MSl+Q1/7cFYeVaaHkFjK2fgJJx/U1SjVlG9LpjmGqGHYzeoxzDIeMOiYqTs6g9sgyDSaaBunia+ZC3po8X+jhYfnZZ/pwnmtTV+YomHPN88p5Zgg02bkTC9gKoDAwi6Ui9M9OT+pJQvGsTISmEg3+u/Id8CqqtuVtQY8rtgVg9pW1GWifKqDaQX/FamlbMaCf1Pz/P1DGOgn26a/aqVeV4HYCeY5No9JHZ5VmmEK9PIR7v4zatV9ziDNry3C+y8ByW8H1eCGRN56r95LihIVg8gNUbffZ34kStn8kaQ15CsCX14NQISfgr8eFjO5/hDEaC29f32VwKSyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18b0100c-bac0-ba12-06c5-5a428fb9f7b0@suse.com>
Date: Thu, 9 Nov 2023 12:23:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] docs/misra: Add missing SPDX tags
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Henry Wang
 <Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231108141847.47697-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231108141847.47697-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: a722999e-8f2d-4eab-3ce4-08dbe116584b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8iJVLVaWSvpTeepb7Ufy+Xlei7nDQjKJywKyZr2xlEc+57bhzf9m74WfszYbRGYFYO4+cA/tt3MKtp45Eu4nmWO54mmXhUgNcx/U4e2KFllmFZfmrHJkMv+QWFRoxSSpuzQ+4j3GBQdq6Qqr12y/U9QCE7yYISQxS+qtPRg26bY8A0Jf3mHglYwzqnSCWJWlyouk29GpnP0J60o0uIEWD5BBVnA3XSvzvcpq43kdUgDiluP7flaJaFJWmew1OG+l/uuEa9E3UwBzP8WVW4vo4e2HO/5J8RRqxYpoX3/O3wLC3vuMQlG0d/imMLc9tlU6ZINra2IETabrjo8litvmQcPUTigAh2ApTmwNeyfFuT/VEn0hjcQMcRYwOqUSX2I1nHCAJLUxz0368ql/e3ci+NjD5w/4fdX6HvDl4FjwCYEkNHlZdwhSDeTRVzj6LZEWYr0t84sFflEDZs1cQjJwnTePwLu/Y0mYsXd9FbFVzYVujqNOdfJbXEngPOvGwLQZPyzeBCRwZEbgdT8XJdM02XRvKkXwiLeFd/hwOjTsu8/O6bw5JGThrnCf4Nt4qmCF3DmgMFJuQ3J9ZfUT9d3VpBGnyghXMeaFcLjPxgAeDRTXW1dEuJPOSGBGt9p93kzZ0WkoKCJt0qMVRIEYLkPjEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31686004)(478600001)(6512007)(6506007)(2616005)(53546011)(6666004)(6486002)(36756003)(38100700002)(86362001)(31696002)(66556008)(41300700001)(5660300002)(316002)(66946007)(66476007)(54906003)(2906002)(4744005)(26005)(8936002)(4326008)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjdUZ1Y5eU9FQjVrK0JVNjZub3BibGF3aFJycGRqS0VFMHNUR1RXK0JUVjZU?=
 =?utf-8?B?dy9HUDhoRlE4MkJqallLODVaQThTTlBRa3F1Y1hPL2FFRThmei9JNGN6UGcx?=
 =?utf-8?B?aEc2enBQOEhvVXVwZWhKcDg0eHA3Z0MvSmtOcVEweHlxRDRWNXdVVS96cWcw?=
 =?utf-8?B?WjdQOGpkNjFGdDZFbkNrRzJzbzFaNnA4K0lqMWRBU0ZoWUVLZ1VUUndSSUhH?=
 =?utf-8?B?SDZXOGlEbG1CNytsZHBjNGFEZnlwaEt0Zkx5OFl1NkQ3QktkMzAxWWQ5c0Yy?=
 =?utf-8?B?amJsN0hjUHJhMnAvUWpRdGs5RFpSQjlQRGVRUlpKUllWaDFEbGZENmQ1Mm82?=
 =?utf-8?B?UlBlR1JaOWExcWRLRU5VRE84T3Mrbnd4ZlVVQm5tSUJWOE5QNWprajR3MUlw?=
 =?utf-8?B?WVZLaWtXemJBQ2puQmw2YzFRSncySmpQTlA3dU55UnlmdnUyNE84dnpGaUNa?=
 =?utf-8?B?ZCtjWWFoK0dZSXJVS21TK0FVWHVyZVBmRll2dGV1NGRuUDg3QnZ5VzI5WTFZ?=
 =?utf-8?B?Z3dnUm5RU2luTHZXNlIrM1pwaGdSdjB0eFB4emJVMHdVL2RtR3oyTEVCZnp3?=
 =?utf-8?B?N0N1dTY4TG8wbWRmam5BR0Nwd0xFdXp1Rm9HTzRWVkpuUVBqbUIvcmZIWGgw?=
 =?utf-8?B?K1FUNzhoOXBjaVR6OTU1NFFRRmdudnIreXR1K2NLejRaUjJheGc4R1JZSWJ6?=
 =?utf-8?B?cHdmK3A5c1RWdFFZUmdXcVFEdHZzbWVHYzhlNG00OElwVlpqckJJK1d0OHgr?=
 =?utf-8?B?SEtpV3E1NnN0M1ZVbVJlOERJcUQwUG84NWQ5QjRsTnZlc1lVWmUrR0hKTncv?=
 =?utf-8?B?UFQ2ajhUUmJKVFRYbTBxWTRKV2pKVnBQdEdjWnhSM1ZzUTFLeVlFelVPa1JB?=
 =?utf-8?B?UGd6WWN1QjcwSjhEVFpHQUJSUy9BYUQrUzV4cXMzRDdnWFFjV2tkYzZIekg0?=
 =?utf-8?B?dk8yb29WN2d5azRIamdWd2hDdE5tVmhaNXdVUDZBL3MvcmNQUE01UDRuQlVT?=
 =?utf-8?B?SHZ4OVRBb0Zjc3hLbW50Wm8xdjRUQkZDT0d3T0wzcVFzbDdyN3hLS3pyUFlR?=
 =?utf-8?B?YkRuZHRUVTlONlhlRlVndkIwQ1FTb2l4N1NwT3RYSjczdUVwaHR5MXBzQ0Qv?=
 =?utf-8?B?Ty9CbTAzeVdNdGZMQTkyY2srckJRZVk3bTRoYzRWZzMrait4ZGkxTUlUZUhm?=
 =?utf-8?B?QWUxZlgvYjlyQWkybUJxZjF6NUowNUFNR3Y5YjBCd3VQaFdxdWJmSUZpTzZO?=
 =?utf-8?B?bUpFMUgxekJLN3lEMmtXQkF1MTRacFpHbElMb1hMbEx4WmdiMHRRbi81eU1I?=
 =?utf-8?B?Y3VveXhuQ1AvUFBIU0NTbnRsdzJqTjg4anlCNFJ0S3pDMmp0TGRiemRIUEIr?=
 =?utf-8?B?L2w0ZWs3QXR3UzNkRWU0NkxpZTBhMFFicUtDeEU3am0xYUNPSWdSYm45YmY1?=
 =?utf-8?B?OC9yNzBLajVxUkRpSW1aNVBtRVdIZnE4Ny9kaEcxMTdqeVJvTVB4SE5WQUlp?=
 =?utf-8?B?OThtUXpjZEZPYmFiTllyV3d5aGhXejNuUXlkbWFXTHhlMmhxWDFydm5qT01O?=
 =?utf-8?B?SGN5bzdnOCtGT1FKRFhLRW5uZ0tzWEY1aUVnUVFPN0VZdmVzNmhFQUM2WnVZ?=
 =?utf-8?B?b21NMGVYd1NMaXVBWkpmWGhoL1pYQ214aFBNd2twVkthN1I2R1V4OEx5UHZj?=
 =?utf-8?B?THY2T3dwNnM0bCt4Y3M4eTZpTlRmaWs2cTJWdnpCQ1lSZ21RMHZ1VzU2T1lR?=
 =?utf-8?B?NW5iYVFiV3hMcithZE9vZ0hPZE8wdjg0SlZ2V2wyeFIvUkdJbU1Cclo0enEz?=
 =?utf-8?B?Vk5QZjZoOGNhOUxDbUZ1aXRUNFM5THQ5T25tZVB0b3JsYVBFNVZNMHJiWlhz?=
 =?utf-8?B?bDBFTTZ6UE53S0ppVDFJRys0LzZpdEdycGJsWGdBeVNTS01ZM3hJOE4rM2tk?=
 =?utf-8?B?dDVlUUFlWDFaRktlTTVwT2JSRFpoSEMzZ1BSUnVvWnhKU0VwV0d0RUZpQWQ5?=
 =?utf-8?B?YTUrT2Y3dlJoekVrT3NrcWxCYjNkc1BNWGlLeWE0NTVtaTBWalIvZGZoS1VY?=
 =?utf-8?B?NkJNZktKRDYwV0xOdXczLzR0RHRweFVKVGRMNVdwQk9UeHFQTjIrM3ZodHlL?=
 =?utf-8?Q?bGxvc0XqtTFzNjfJ/Ypjk+ofV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a722999e-8f2d-4eab-3ce4-08dbe116584b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 11:23:49.1420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2lWT4wY+5tC7aZkPXDfNfUL3aAGx7Tv/Gi4X/WZdUqKllXDlOgREY1U65uQTSgVFHua4vPqVWlTZE1bUz7N4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8036

On 08.11.2023 15:18, Andrew Cooper wrote:
> Two files are missing SDPX tags, but are covered by the blanketing license
> statement in docs/README.sources saying that RST files are CC-BY-4.0
> 
> Fixes: 3c911be55f1c ("docs/misra: document the C dialect and translation toolchain assumptions.")
> Fixes: 7211904e09bd ("docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



