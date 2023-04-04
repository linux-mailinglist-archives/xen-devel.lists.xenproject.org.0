Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081226D6773
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517985.804063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjigL-0005DS-DI; Tue, 04 Apr 2023 15:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517985.804063; Tue, 04 Apr 2023 15:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjigL-0005Bl-AT; Tue, 04 Apr 2023 15:34:49 +0000
Received: by outflank-mailman (input) for mailman id 517985;
 Tue, 04 Apr 2023 15:34:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjigJ-0005Bf-Ol
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:34:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a33a9d7-d2fe-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:34:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9095.eurprd04.prod.outlook.com (2603:10a6:20b:446::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 15:34:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:34:44 +0000
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
X-Inumbo-ID: 3a33a9d7-d2fe-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4AjKKNXb1SxKoopU6MW4HnYpWop+Jz54Cx1kNOZVQswfYc8CyVCNYGu/FH+yvr032csE94MXGzMFk8Wypan//TpGcBib1ZVPd4qlgiiq0wgq341fhcA35tC6ONvhHM3owu5eNmArGW0YI53w+qNWcsaQ6XiLe7+EzH8ms2KkstSIABei/8ItT1eDm4/CrZm02TQKDo44Aeh91droynZbes9vsb4264tAea2YzURP7NLPrKQcHbN+YE1lHcWf+/Fm7AgA/UvjGDLnRyYLlYld/QeDXhBoHIx2AITxOawc7eKg0JVCXfRNWVRHv51QhZNKKZ5gF6XY1phgP4dtUmNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRzzlFeZvhJduDLPey9wLw9oUPxcwz4PaBTrfAGQoHo=;
 b=KA1Gj/WIN4MpPqxc9EGHSvWjIHj0nSHXgrEQk9B6D6utC+ZMch52xdmB8FRuEY6aw5MCNfap8OsaKZ5Z57hXlvkroi+MOBlwM2elSTWxeyGl+awUHzUzjppJX5wcoBACYUbUuVwD1lxjmrDbXT0bwVe2ae/TGUYAfDm1bXGh1VvcG3V+2NUoysZwwTmdMdrg6pQb2T+UY8J0XoaCsqq/gI9gjl47D0EJr1KZL5vxd+6Fxbu6ygFMecotaa1vz1zZtFzWEFyg+It/hp7/fa/UT6qLBM4xEmQxGdXOjIMJ+CO0GuWslv7S6u4dNyHCkFqOi8MQPHhU+JD+c8R1gKIGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRzzlFeZvhJduDLPey9wLw9oUPxcwz4PaBTrfAGQoHo=;
 b=UPttCuqCUuNktmesejqrWd/hEYoQtdPwZ678+aiVb6FlWvC2lMv43iNLSH85Prh3zqCDSjQdJzmw0VkWSrTnJrG/LjuUjf/D13EAGsy31dXQd14ZhPq4MlT9IYh66g4WBxlgAY36dUy2oCGaZkdzI//j+QA3iG2CKe1AC/fpmkSBba/p40Zywn9GYPe4LirpqY51PKJAIpufhV5tGSX7exMQ4nk1VTF1xvNZcpGrHoApSiRs1CyvJPpoABCou+S/0HTZCWXh1JJk3U7ri5/xFpWG9nkr5/302xPmhLHpE1Vs7XphIyP/duhLXq8/MqzArTE0nr7uYVVIg6CkyCnrxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74e716df-b27f-a86b-a257-fcdc2526a820@suse.com>
Date: Tue, 4 Apr 2023 17:34:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 14/15] libx86: Update library API for cpu_policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-15-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404095222.1373721-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d111571-a369-4e9c-846e-08db35221d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ShdmLwjbTk/PRjXIAQWKys2h4hNPqTVim0n3OJT+4VjETw7eykToX8UlDdfasF6i5LTAnIGXBuPXNPbJFB0oe4Sx/4eOiCqRHY9VG/Wo7eBkL8ijmG1cj6IS42ubnmFZfW2gLn1JKTrh4lzsaMPlXGGs2hLXefd/bzEyOY2gzmPIMyx9hyNRJIsr8hOI4F1/7uMi3D+tngtjecmtpu5cb2EeXk2FBNEv9kCvrSTKZxZNVWDinel8ke53735lXj+qwWrro6Fam8oGvbd0d1gwBvmAoj12Fdm2eKd8jbbSkSs/5+AO+bQHbasriIpuSiUX39XZoR67YgmmWiENElHQJa0oRh9ZMZWsvml9Z0hOpcFI5q+RK8ET/lCy3ZfeaEn9zX4ZzPfxsZxORey5eD7EAIr6QdpX0z/paXUewUxEDewfewMdto8TgKUX20V/xem0DVjHARI05MyXmSJ9MMORTG/fXU3OsmVr5tGTjC+GYdnywS9EQKsiI/4DZ96Nx9huKCsGt0QOJ+lkGoDpkqb4gMiZf9/pddInLrBuzlNQLtDR6NWDBPEvozpvL97cBExN8YEq/oUh1KJasQYOz4xnNsbI2tnXAErxjNqLBBUFeq4HYtAHJ9AKhgv2I71l052zYxOmaUZ2bSWoOFKWUhcpIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(66946007)(6486002)(6506007)(53546011)(6512007)(26005)(2616005)(66476007)(66556008)(38100700002)(41300700001)(31686004)(186003)(54906003)(316002)(478600001)(2906002)(31696002)(86362001)(4744005)(4326008)(8676002)(6916009)(5660300002)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE9pL204L0ZBY2JxVlQxTFhTM0dHeWRSZ09aY0IrY1VUQ2JYampETGFySjIw?=
 =?utf-8?B?bFhEQnBLdzRVRHNEYlUzOEZHWnZRYVVleTNLUnZxR25ybWZYd2FRNXYxeUdJ?=
 =?utf-8?B?OTlEampCMi9jWVFqYTQwSVpibzNIYTJSbi9PaWkycy9GUVg4OTZpenNrWHRz?=
 =?utf-8?B?RXQ3REtEVERtaVJPRjFOa3czVkVIWll0c3Fkd0hmVFJDblM2eW5Rb0pzY0Fl?=
 =?utf-8?B?aUxyTmJhUkhOZEdBQkZEcldyZld4NkpNYnR1NDRlQXVERGNHNE84T2ZISlQ2?=
 =?utf-8?B?Y1lGbVBhUXBTaXZ1ODNiTVZyY0lIc1ZMVmZpMG9xRUsvaVZYMnp1dy9LQU0r?=
 =?utf-8?B?S1hFekF0dllDUUc2eFlzMldVS0MrVVdGL3NPSTdsV1UrUWRoQ3N5Yk1BMXcz?=
 =?utf-8?B?OFRnL1ZkZmZ2eGVkOHRQazBRSTBLKzROdXZhdWh3TlVzUk5oelN4MnoyV2Nr?=
 =?utf-8?B?L3orckFkMlZ2Mm9pMU5GTHhrM3NhMnhKMGdpa0ZqL3dtcmhWRnR6d1BoQ2xU?=
 =?utf-8?B?YkE2VWRCb0tvaVFtYnA1cFBRUWFzYktUamQvWGRCUVcxdzNNNENhTlZxVHNj?=
 =?utf-8?B?Y3hRMGorcGZ6TW8yZklQNitFV3dtNVlYcVRqa1FvNit4MFhIc3ZGUHlKOUw0?=
 =?utf-8?B?VE9jWDlEbzhudFhRZWtJbWpBNzlUZnpkd2I2U3drRVVTU1ZsVG90ZCt3ejNZ?=
 =?utf-8?B?bWZvZEhhZDQ3T05WMU1LbURnOE9sK014em8xTklXbFUyRU0xa1YvNEZNREtX?=
 =?utf-8?B?WGhTMTFwWVJUVjNibmFCcysyRFJvQkhkQ3lpdmxUam42TkxKUitPMUlRY2px?=
 =?utf-8?B?b1ZkK1EwQ1F4SWF5WTNWU1R3SDgwQWlvU0RtdWovd2x0di9XdEhJSUxYYnlC?=
 =?utf-8?B?NHBkMHBwR2p0ZHpPWkFKWXdYcWpDN2tUWmlwQW9aZ2pPY2lmMGY0amZLWkRY?=
 =?utf-8?B?SFdEaElFNlhLQWhJSUUvWC9LeFJBUnZjVExGWnNVOWZXVEx5WTJ4MEVoTld5?=
 =?utf-8?B?RmhXckxSUnl2YjlqVUdWT0JnLzdRREZhMEp6S3BZMUlaUFIxZk01UmQvQ2hj?=
 =?utf-8?B?UGlYSHYrNG41NmhIQW9pZzJXTE5UazE0b3FCb3FpcEs2T0FCcUE3U0ZkemVZ?=
 =?utf-8?B?UU50blVRQ3BvMWVIRHFwSTdLNjNNeFVONUd4cExrdkxDcE5lOW5Cdm1tNUFF?=
 =?utf-8?B?Z2VXcnhuY0NsZTZtY3VPNmorczg4UzU1WjBFRUNMR2xwQmcyeHAzcU5YWGlr?=
 =?utf-8?B?YlNLdVE3ZlJsZk85VWUyM0dBYzJQc1JvL2J5RTlYUjJrWm1SNGwzQkJEVEpn?=
 =?utf-8?B?ZkFoTFhYeFhSWHZEbDRKazIydUEydXkyeWhTaVBzYkltbmdFRXhDekVENnRi?=
 =?utf-8?B?a2EzWHFGMnNJMDNQVFpkKzhHQmgrSDBpenhsTjlFcTNsZVNobnl6Uml1bFFI?=
 =?utf-8?B?MS8wVWhzZGVPUjJoSklwQ3k4VUlBYUs4YWJ6L0dUVW9NUDd5ZzlyMGtSMzB2?=
 =?utf-8?B?K3RwZGc4bVJQdTVoMDI5QXlwVk5iWVdqOEx3RWZvNlVZZFhEVysrMWJxMGZC?=
 =?utf-8?B?ekVIWkxHSnVzMHVVQjhSVzRFM1N3MGtzRlZFSHVZR2swUkZIYnNKdlNESkwz?=
 =?utf-8?B?V2RUclBmaTRUdXIxSXBQaU9wd05yVmwzK3Q5V0dlb1VsTzZROHhZTGx1SHlk?=
 =?utf-8?B?MTYwaG1QbU9VOHhKYnJURGpEZ0VRZC9yTTdHOUpPVTB6NVgrUnFGeFQzUEhM?=
 =?utf-8?B?bEtFQlNDT1BFd0xiM2FYR1FKS2RDNlRDK0IvckVUNTVOVDEzajBzYXhyUW15?=
 =?utf-8?B?ajRIWXA3VG5YVjljZ1ZhSng5TndaajZDWHB5NXNoV3lPbGhkNUVpeXRvSkhJ?=
 =?utf-8?B?Q0JNT1ZvRVJCYUNwYWVTcWxXTjNZbXFSa1YvOGRJUUo1ZEVjNnNZTG8yMmJ2?=
 =?utf-8?B?dTRnd0dFU1NVTTE4ZGJMUXZHV1ptRkUvWTllM1NnU0REclNEWjRyQUlrTU1T?=
 =?utf-8?B?TTFYa2RLVVBpdldmS1ZBQ1NOakYwa3RGbjZ0NWlHd3BqQ3Vta1JHL0M4QmxY?=
 =?utf-8?B?Uy85SkptbmwrMWVWd01QUEVHM1hJc05jdUcwVW9oZG1Jams0OWxlak9jc3FT?=
 =?utf-8?Q?nwYwJXeprs1DSq0cDAV9IxeV7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d111571-a369-4e9c-846e-08db35221d78
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:34:44.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4ZbXMBDog+Q9FVjWCmiUAgLtj9cegS4ayrK0HJeznx37hEvXUg+bF0VDp26z+P4wj0sbAfad+WZxhLVQ8bSPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9095

On 04.04.2023 11:52, Andrew Cooper wrote:
> Adjust the API and comments appropriately.
> 
> x86_cpu_policy_fill_native() will eventually contain MSR reads, but leave a
> TODO in the short term.

That'll then require passing in a callback function anyway, such that
different environments can use different ways of getting at the wanted
MSR values. (IOW a bigger change anyway.)

> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

What about x86_cpuid_lookup_deep_deps()? That'll be looking at more than
just CPUID bits as well, won't it?

Jan

