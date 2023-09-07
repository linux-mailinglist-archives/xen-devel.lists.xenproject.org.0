Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544557972F6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 16:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597414.931647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFhA-0000Tl-7V; Thu, 07 Sep 2023 14:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597414.931647; Thu, 07 Sep 2023 14:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFhA-0000RJ-4F; Thu, 07 Sep 2023 14:09:20 +0000
Received: by outflank-mailman (input) for mailman id 597414;
 Thu, 07 Sep 2023 14:09:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeFh9-0000RD-AN
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 14:09:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2208e6c6-4d88-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 16:09:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 14:09:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 14:09:15 +0000
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
X-Inumbo-ID: 2208e6c6-4d88-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzKdnSrpTqBD32xP+eCwiIQT9u4yKzw1F6vhjKYOjnKTLk37sOP0DBLkrBfzm+kW8pZGGWJl1KWGNg4kiEyqirBT4FsEoMFdH9DriO2mBjpwh0guaYg9lL6NqjcJxzozyP2XXM+5FNmP62//9kMIl006MlMvhXOlInRIWmRV6RbGbn/Dx2Jy5ZA+pO0oTaLAL27xu2wiTKaeeDmCNp5HyLeIWlHR0eYWg+CGKhO+hDnOnfjufHsjzkj+of3F4w2cqpI51FPji0ODWn0q2lUu53qqqpTnoK/ZDyJdrjBE+UVy9nhdso/8Y/SLyEGbg8SanMbzUEEEV3EFQoybGFyXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7htKJpGcGNnLTBF3vdUYIfyiw8g7gJZgdvQf8W12rGU=;
 b=hgUes0fSk3QsJXT95FGK2LUj+Q/n9Ia4J2GG1vRDK6sY7PiAjV2O1JdwwiB6Yk3dXbZJ17eoJrnpvFSPNPDO0ZJYYKmZxRH5c6Nar+HTI/RPkYibH7J1LmQiwx/H7UNt7A8fSdKzljfToFHVjPagkbtSjaLLXvMUZhOQJIqHOjbCHtsXjCBGGg2F+h3DEYurMn1/coXAS4OtKqnhA2nTMrbuSF/+qu+p3/dUMQZJ5Ctgsf05OuFAhgBGkG8GPppqsS97HQxefxK3Icu264vX9SNqRWHBVHN/D3r1EJ/aaVGgz/dNb1M5sHP8Qsg8QCBoeC2kO6JR+e8W95H7YXdf0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7htKJpGcGNnLTBF3vdUYIfyiw8g7gJZgdvQf8W12rGU=;
 b=3bSFBi6/VyUazNo+qejsYyU5SwnSlWScciY7MeYw5D18xxeth/Caux1Q/JCTECVYFsdz8k8CD1Y26RrAsuOn6ukJRDkYMiDekyE7MO9K0JJDwgfCA82AXLg94bXv+PtEvbU+bKo6R08dqS4IoL/1saWnEftE/991ULDq4W4rEoL7Y57z4s8lz5lVo9LHpK/s5jvYMzP71p9CRRxurzZAzREbcPnmJNdQcXqZywljXKZN0LiESG6rMTkoNZRzZ2rnX7FJ/Ul/o0byogx46XZ17VOx3cohaPJz0jeH9KJ0Y49QNcGq7jB1RH0NVb9ptYGtMPX53iLm0dZXsPR1NmGTkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb92bc36-db32-322b-569c-a176f08a95a0@suse.com>
Date: Thu, 7 Sep 2023 16:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to
 skip timer check
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230818134441.45586-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: 773d66cf-f992-4b70-6d34-08dbafac0520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	erkjYgL+hixZn3IL3qj0gFo2tHV1z/JtR15qGlJZcs/cGbyMgJmcQ56djHszrVH4vaA4hJM5OjwXWaGkxTN8h+mV8fvXcf5pdOP89UqGWH5xcMv4CfThRSotNprJoG/LU648Xw4ALpFp57P2K/9G4BRxBYRxlgy8XKbHF+T0ya6BoIISic4QbZ/TDf9Zf6XJu6OLyqX9y8XyLJoWn/s7jm/cpf55Awf5nxUmSHXFhOb5diSqFKpVUKiKTyTmUbVmXndJaUz18zObtvbSoPqxNFcUcX1nGCR8ovAp6vOP+3I7lfkWBTSrqja2KgZ98OU3aZ7vqycjE1jnQ4cmwx3z9cFfyjM3Mc7wYX48yO6zQ6M0HRb0EQen8SxHQdBf5gQg6C5Q25N5z7y8lLrdzefMg6QYpBd6GKM9MJ3x5jhCXP8arUIJYA5ROHsSztS3zox1lz509Fty7w4IwK+3q6Ghk7Z+db8/7t1CfHXnQ6H0nS2JBISZUQ/cKRmLxd1yZMGtGs+DdPnKknnn9yUuR5Q7lK+OxQMeUnzK1W7pWC/YjTLt/yfnJG+khb4Iq4QOQ8z+FM3Xlnt+OS4t7UN7xG8y0z8+0v+V1mBpgrpa88m65mNHLitr8kg/cRlDqsz6y3vpyv7PYxUv/lETTqK50dZiLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(186009)(1800799009)(451199024)(31686004)(53546011)(6506007)(6486002)(86362001)(31696002)(36756003)(38100700002)(2616005)(4744005)(26005)(2906002)(6512007)(478600001)(4326008)(8936002)(8676002)(5660300002)(54906003)(66556008)(66476007)(6916009)(316002)(66946007)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjFPR0pTS2U4Vm5UbGpYbGdmdlZuNXdWTmdsYkwzZG8yQTNTQ2xDMm5hTXNT?=
 =?utf-8?B?Yk0zNnUrT2F2L0F0Y3VyU0xKbFc4NFZtMjdOSkhzRXNqa0duaFNZa01pdnhx?=
 =?utf-8?B?NXI4UnBXdkp4Rk1jcmFWbWtBWjZIUEZHWWt5ODBBWUMzSjlFbEJ6T00yeVAw?=
 =?utf-8?B?QnJCdCtMcGVaY2F2b3hNSjJVdmJmaHZPb0VnZDFwSDh0Wmt0aGdIbERDUXZ2?=
 =?utf-8?B?UFg1SitrSnUxZkZoWnlXSnhQck1IUy8xNU9BZDdOMGIzUmp1VVNZVE9pNVdR?=
 =?utf-8?B?QzZFVzdtWW82SXJmNHcvdXd3L1lEZHJVRTBrUUxabURwNGk0V0pVRForQXVt?=
 =?utf-8?B?STlrN0VYMFZwNVo0VUZDNTRUeDU1T1FYaEUvMmpzSExvOVEyK2R1SHgzWmI3?=
 =?utf-8?B?RkN5aHNrL2t5ZmNzTVVwK2Y2a3pHenBnUU1NWmZ3eS9jc0FaOUhoS1p3YTY1?=
 =?utf-8?B?dklOUWVDWHJhMW1qdXJZWmhBR24yYzBQMXg0YnVlNEpvQjU1eXgxbHYxRXpG?=
 =?utf-8?B?OUVNZjZVdWlLSXU5Q2tSS3FZVG5zUUhIYktJTGlLS1A0WDcxZlVtT3Fibyt6?=
 =?utf-8?B?ei9rWlRjV3FXQlBTSHI3RzZ6Mm9iTWtXdFMvTEk3NndMNXkrcVBtamhVd2ZZ?=
 =?utf-8?B?NnZLbUV3TVlMc2RMRk5rY1hTcWIwdkdvYVA3eE1pbHlhV0w3UkFYWkpibkRQ?=
 =?utf-8?B?NzFwakJyNnpoT2prbmx1ZS8vanFmN00zSUJJa2ZKRC92SGIvUXB4RXJXOTZw?=
 =?utf-8?B?V0pNUXJ3eU8xZ2ZLVkx2bVlCTXhJWVNJRlh5NXpyUjRqaUJSMnFiM1VVdWli?=
 =?utf-8?B?ZkM0LzNiOXd6eEQvZ3F0V1JMYk9SeENZUmdZcVNLQmhBMUNrS0c2SDlXVEZw?=
 =?utf-8?B?Y0dOR0ZJWFk1TlZVRzYwbjRsMm9vSUp1RjFvSlBYbGdnUDZXamRQbTJrV0Jr?=
 =?utf-8?B?OUthdmV1SHpiWXFHazRwMEYrTzN0NisrWXFQczN2aUwrb0xqSS90eUoxME55?=
 =?utf-8?B?ZVJzNWVLaXIrWHdoeDVTV2ZiaGNWSlBVV2V3VVphU3RIek1TVkc3bGxmYXM2?=
 =?utf-8?B?WFA1dW9CMklPeFdDYldWanNWdXJqWENEb3J6WVNRS1Z3eUw2QWdNWS9lczVN?=
 =?utf-8?B?bUpCVmpLYVFpY3MybTNmbHQ4NTdUWlplZ0V4Uk1tMlkyRm1BblNQSUIwU09F?=
 =?utf-8?B?dVc5SFlBU0lleWF3NUlzRWVkZnVjeVNoLy8vRlBvdS9QclVpNmNtY3FGWEhP?=
 =?utf-8?B?ZzlTby8wbTlndC84WmlxNms1YXFGczRKelBBdFIrWkU4UWVpbWFlZjJ4YStv?=
 =?utf-8?B?UkQ2Z3BYRWpxOUpRUDk1UTllRDZjRnA5RUp2aEdUZGl0a2t0dytXM3hESUh3?=
 =?utf-8?B?bnVRQmNsODArelUvbTdrS3J6SFhtcmVHWWV1QTVPOVZRZTkvOEFCYXZDNWhr?=
 =?utf-8?B?K29CaGlXZFBwdUtCUCs4MHBuMmxBN3FvYUFQWGlsMWJONkFVaVN4cTVsWTNR?=
 =?utf-8?B?ME9qTGQ0bDdrYk9iOVltVjVZdWxkazdYbFpMTXp1dmFCTHBFMjMyNnpqOXp5?=
 =?utf-8?B?LzdmUlVUUjBYRFFzd0lHcUFudVg5M0FLU2R3MVRjSkdEZnJtQTFHUmxoR3dM?=
 =?utf-8?B?TW9xNGtmSzVzZ1laekQzNzV1UFdaWTk4UlJnUTVDeEM5bWpwcHU1ekFVWStk?=
 =?utf-8?B?ZlRsYzlVZ3V2YmdsQmpWbFN6KzNIM1R2U1AyT0pXYm9wZThhUGo3OHFIMFIw?=
 =?utf-8?B?V2JNL0ZYcSsxK0RYUmJyQVlBTTgrWXNseW15WDZ6Z3o4OUhUNzNSMUFaUGZF?=
 =?utf-8?B?Smw4U2IxNFlzM0M2V0s4Nk53YmE3b1dLdkkydEEzSU1Sc2hXcnBOU2hNSUNG?=
 =?utf-8?B?bEkxcUh3dXE3YS9rangvaXhxTDdhcEtyMjRhQ2p1dDhRWjFPYlZ4ZDloWWdG?=
 =?utf-8?B?Ykp1L3NhN3l4SmlpbzVqblNicGJDOVdOc0hiVUUrM09Kdi9GN1lEemg1YkFY?=
 =?utf-8?B?VlI0OGE4bnk3UDNNMnVBREdvUFdydkFlMWR6MlNLSkE4OW9TNlVEaWdpSzcx?=
 =?utf-8?B?aTBGcTQ4SUptaXpxaWlIS0IwOEl1Sm1ncS8yWVF2UUNqM2J6UklTb25XZFlv?=
 =?utf-8?Q?gVfaX3CS5ro5oET1I3dHnQL1K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773d66cf-f992-4b70-6d34-08dbafac0520
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 14:09:15.9352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kw2qFBuNNpA+4JhWWkI/GoLcLT3gITk78tn9HsxTC2WgQ4h+/MeA4RbVnPf12FGkWCNDry0UndmBK0syTw+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

On 18.08.2023 15:44, Julien Grall wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1896,6 +1896,13 @@ This option is ignored in **pv-shim** mode.
>  ### nr_irqs (x86)
>  > `= <integer>`
>  
> +### no_timer_works (x86)
> +> `=<boolean>`
> +
> +> Default: `true`
> +
> +Disables the code which tests for broken timer IRQ sources.

In description and code it's "check", but here it's "works". Likely
just a typo. But I'd prefer if we didn't introduce any new "no*"
options which then can be negated to "no-no*". Make it "timer-check"
(also avoiding the underscore, no matter that Linux uses it), or
alternatively make it a truly positive option, e.g. "timer-irq-works".

I also think it wants emphasizing that if this option is used and then
something doesn't work, people are on their own.

Jan

