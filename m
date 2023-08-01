Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6076B640
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574228.899485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQplc-0001KB-Cg; Tue, 01 Aug 2023 13:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574228.899485; Tue, 01 Aug 2023 13:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQplc-0001H7-9N; Tue, 01 Aug 2023 13:50:28 +0000
Received: by outflank-mailman (input) for mailman id 574228;
 Tue, 01 Aug 2023 13:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpla-0001H0-Oy
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:50:26 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe13::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5de01467-3072-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 15:50:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9228.eurprd04.prod.outlook.com (2603:10a6:10:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 13:50:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:50:24 +0000
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
X-Inumbo-ID: 5de01467-3072-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckfpZ6uavn+QeeLKX72g41Fc4uEp3MkUfJkMbXyx81uzXWLOWVLUI868t0T5UWbsA8x0x/VIYlGxYh3kVK3qmkV61fUNcwF/DPnPP6TISR+sKp0cT4YonBjMryrcqrFUWb3MtyY74GP42Xk7mXpcO36pJd7/eZdSSs4FzRJQpf1aw2R8vVw5YuXoOz1g+mQJOndIs5/gJqWlkwaiFj7CJm1ySsW+vfxKvIdyrA0FIFcG8cEVYMQFgzeq5U3kruGQUaKQETlpm4hzEaA1t6nBQvoe1BoP01V/7T1jRffM/D28brQzMVxAhAgYgIw59eoS/cyiYLf3vxG/pYt8Pezeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvPg3IhUWh1TBgh1T8s3jZPBueX+NMrRIifczvw5C3Y=;
 b=HImhE4ZK2rePLlOv0tzG9StXiggxTOtIPMJ54RLXICXNpeFG+3hvuILtW/faR5ej8XmDTSTiAYjZNiY4HE9b/7u0X3e3g43cclpxYr6tFda9bPOrayAj8D4Hu2S3SAN3z7tQiIEYL2H55zE2O0nad/DgTmhtm/SaPsSbWmMl43w3wlSxFPSTxTnKjvwamlmHvoMFyubo+svQ2UV/ETnq7QAhzXDUYgU8Kg8ehRE0gbazVMxTJxtz6eJ+HTMrrgUWQc9xzqP5oniyEcACxzDH3aHePcmgXcCInEOi6g+AXj1Aw4KL5gzHoONqrzweiMmjyUjoNNoqhGOIp2Y1TmG/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvPg3IhUWh1TBgh1T8s3jZPBueX+NMrRIifczvw5C3Y=;
 b=1YA8vFk58or+Bpoal9kBa+pDsjnRnrdPcsxnrzgDvNejM0kB1vaaof5pV1xqIfatabUk8H5prADiz0kZsTBxsNNFSbR2uQ+tpw9yFM3HbnW3vlNfIELXDk4fPeb3OvD0hiHdrN4HCk9ieYGAgg0I93QpBM9mk3Ye0ZjQ+IMTq8FC9Se1ZLFeyPfKHdVOWBtPn51Dvh1ZnKOokeGAkBwOLufs9RdUQWrIh+ejTodh6OvqtsN3e+anXCFGPgEUgI56iWiX7BKKl51/oQiU0oOieP+mLJBmmjFWttywXbP6WhEc4bWH6i1FpYS6dWMSzboPBH9kivPXRqkznP/QOjBX1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4200c47e-6626-506c-1a17-991aef6e0be1@suse.com>
Date: Tue, 1 Aug 2023 15:50:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH] xen/spinlock: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <29b6a47a2711f065c02a3d2d94e1a201986cf015.1690882872.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <29b6a47a2711f065c02a3d2d94e1a201986cf015.1690882872.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 54246ce2-fe19-4e37-993a-08db92964136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uq6EqldjzXoSmd4x7wmKsLqD/T4q8bzEhqKkCMlk0AkJjpdBSI+owHwCgGVSue+Ld0M6aIVL1nxWfJnrhEZQO3GtSTE5qiyky+zBUu6DM+dizcPYBevZRZ97uK1Dr/3uvCPQ1vRsn2p4BR1ooinezjl5YCPfdC7wQvw90WSIMo0srt4igxj3YQjsvCfq2Cjmq+qo9S3Kw6gd1mpsMVaV50hgjusLAvTFyS4CU1DIGuTPwQPLh1e9/BNx5uN+504bFkJC9i3TXqE6RcePdp/5q4JO7wicecJI0XXxgj8pW8U8vmkxd1px27VjndN65ag/MG2B7g6/+pvsTAiopOEVbETlLdFBY5ajPmcf8AVYvDa1XKExzhBkA/CCBpLe7fiLlD84+C8dXO2XX8tQFyT1jMgd/lipyN2SREwVPEpnzVgjgUTaqyBAUjflVS62OcbC3InVFmk+wmCJKava5kyJpfvj3Zu5P099JGxp6s558Fs8xlLCsNWEC+uEyk+StjKf4uZtBAkX3ZDcQyJvC2LBcX1VngMLJnSBVJSsVSht5ODfr6Uwyu/U6iEj8xcEkphLrsiR0/x9y3KfSc9qDGfasb/KiXIqknVn7mlzhq31vWFInlRuVP8MT8I4rrDW2waHO/2CFxR7f+3+vF71Lad+Xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(8936002)(8676002)(31686004)(36756003)(6486002)(41300700001)(478600001)(2616005)(2906002)(4744005)(26005)(83380400001)(316002)(31696002)(186003)(86362001)(6506007)(5660300002)(38100700002)(6512007)(54906003)(4326008)(53546011)(6916009)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW9ITytxS3gzS2svMzJlMXY2Z1VuMUxiaVVnbnI1akhZS2xJZzB2VWRwRVIr?=
 =?utf-8?B?S0VMOVVML2Z2d1ZhY2VrWFMzYW82MlZLSnIybmg0bEt4QU4waW5USS9vWE9s?=
 =?utf-8?B?V2hPbnU2VENXamxDdEgxclpWVzZMYWVaUDhDR2N5aEl3NHg0UnhJWkpGZFJR?=
 =?utf-8?B?ZUg5bDdqUnZtQ2VOZzYvSUtUSElsS1FZKzNaOTdCQW5BbUs3Q1JLTURrT1Av?=
 =?utf-8?B?V2NIU2pzY1c3Z3ZGaHY2elVjRndETTFEUGVBRmI4aVE5UFZoNitVVGo3T3I5?=
 =?utf-8?B?dnRWZklTWGM0UGgzdzk5a2NWVC9ISC8zbVBDeWhwOXE4eFZ1Y1hiR1QvNFI3?=
 =?utf-8?B?N2xpdmFFRkJHdk1OcGRqNjVGbHJpbEUvUHFLOWE2UUJRUnY0Y0ZNQmRVZXNa?=
 =?utf-8?B?OFRqb2c0UTRyVG9JS2VxVmk4R1QxdEU5STJwK3FleVNYWmVBaWJaMmQrcE5l?=
 =?utf-8?B?NEpKK1NkL2pxeEUyRzVQcmhpbkY4b0E2MDlQd0dxUnNTOGNBUDJqbkhvS29M?=
 =?utf-8?B?VWNodnhZRmw0TkJvOHBvQXV6eURWdXFoNVhpaDZZdnRBaGFQZ01Xc3c0ZTQ0?=
 =?utf-8?B?ZjEwc0pVZXJBSGgyczBqMDAxYWd4SmZDWTB5NjlPSmlNVDI3cmg4VzNQOVJo?=
 =?utf-8?B?OVcrMG16aU44ME96cDJ5L2xlZUhwS3VjMEFZSUkyOGlHNzZZdmFZSkNEdm1z?=
 =?utf-8?B?UTNzQ0NkeHVpZ25IVHRyanZpZHFyOTJrRTRneHlqM0p4TFJ6TE1GMitJbTd5?=
 =?utf-8?B?bStJNkU5MFNZRllPeG1kVUNyVUpYS1l4akF3dTZUYkxaaWtxbmVKWk9kQjFn?=
 =?utf-8?B?VVYwYXJqUlVpcjM4MENrYVNHWFZUZ25TNGpKVE5SbHhjNWlsWEZ1d1ltdlk2?=
 =?utf-8?B?SmhHd1dSV3crd0d1SFJVMlhpdVlkTG0yK3BUM29HdXRoampERi9Mc1pOQkV0?=
 =?utf-8?B?bFQzRnZWUVNYMURNVmJweXR1Qldzc29hMUhTTXdwakUzYWhFZWJTVDh0VFE0?=
 =?utf-8?B?MmtYZGoraXVSRHRSUWVoNDJEQ2YvR1BRaUNIcEpVZXNIbUVpdHN6WGJNWHIz?=
 =?utf-8?B?VnlMcFozREZkMzU0WjdOVmZoaE1LSUdreS84T1dha21ybnlmOGhuY2hhb3lx?=
 =?utf-8?B?RVEvMnF4QW9zb0JuNFNkVjRiWVoyZ0duVVNUU1ZBdG9JOFNScDcvTElPanFz?=
 =?utf-8?B?V21rQVEzaDE2K2ZWSE5DMEV5RGxsZ0lGZjY3VHhkaWVBa05jVnlxSlQwaVVN?=
 =?utf-8?B?OCtGTVNNdWdHbmdIV2JOYnZYaEpFY1lzUnUveWtXYXpKNXdJUTE2a2NMQkE5?=
 =?utf-8?B?TkZROUxpeXFaUzBQWXJDRGk3eVgvQlBsUGZMRGpDd05uSWMzVHpPRXphekhC?=
 =?utf-8?B?NGhNWVhIZHRZcnRCcy9VSElwY3VNbmg5VkVBdzRPckQ2TUZVOWFnQjN4bEFC?=
 =?utf-8?B?cG0yNjJhcGsxNnZGZElHa2ppWVBrTWIza1BLOFE4TDdvQlNvUG1ZR1EvR3hr?=
 =?utf-8?B?bzRYTDF4ckJMajE2ZXBDc0xudVkyOHA0UFNZTVZmT3Fndm9PK09ZaE0xWTkx?=
 =?utf-8?B?ZitSUHFhMG00Nkl4MXJEQUovWmJOb0x3KzYzOFhnQTZCUkttMTl6QjFMZUZM?=
 =?utf-8?B?WG81MnB3ZmdRNXllK2JJS3NhMytlQmlheUNXQ3lTbk5tVnRwT1RncW1nQ1J6?=
 =?utf-8?B?cUxxcERmT3RsVmYzakNqQ0lqc0xhaFg1ajhhN1Y3RlhjZUtYT2VzblE2TXE2?=
 =?utf-8?B?NzFUQkVRbWt5aDNDdWFjZThGbng5eVdCS29tUFVsMjR0V1h0MU40R1JneVRn?=
 =?utf-8?B?UVVGOGVKTWlOZURxakliK0dRdjFFNENieHRubnFuTDhhcE5YaWZBTFhtUnEy?=
 =?utf-8?B?cUN0amk4N2R3VSt1MEhiNndYRStXK0gvZ2UxejJlRytXbmxVWnVxYjd1aGoy?=
 =?utf-8?B?V216c2JWUDU3SGcvSXdOdkpGcWRUaWhKUXR4RmZVQXp2ZjlVOXRBQkhxUy8r?=
 =?utf-8?B?d1N5MERxUVJoZEVhbE0zWDJjS21QZXZPanZSeG1yS21kSnBIb0ZGMEN1M1o1?=
 =?utf-8?B?S2N4eWI4TDJBcUhMc2IzUjNJUzF6K2Q4VmUrQk9yc1czWE4reUR5OEFoNUF0?=
 =?utf-8?Q?/k+Ld8f18cYFLEQEmcgKYRMo0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54246ce2-fe19-4e37-993a-08db92964136
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:50:24.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Lr415+olxs8K/OCGyTSdGqVIkqnBOXOS7EOzzfYgHOSCZ9r4rYopz0cqpFsLHzbitJnoCYK5ZLEnajpZDY/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9228

On 01.08.2023 11:46, Federico Serafini wrote:
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -125,8 +125,9 @@ struct lock_profile_qhead {
>      } while(0)
>  
>  void _lock_profile_register_struct(
> -    int32_t, struct lock_profile_qhead *, int32_t);
> -void _lock_profile_deregister_struct(int32_t, struct lock_profile_qhead *);
> +    int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
> +void _lock_profile_deregister_struct(int32_t type,
> +                                     struct lock_profile_qhead *qhead);

In adjacent declaration it would be nice if the same line wrapping
style was used. Can surely be taken care of while committing. With
the adjustment:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

