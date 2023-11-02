Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B97DEFE5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 11:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626831.977450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUvE-00085A-1u; Thu, 02 Nov 2023 10:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626831.977450; Thu, 02 Nov 2023 10:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUvD-00081n-TE; Thu, 02 Nov 2023 10:27:31 +0000
Received: by outflank-mailman (input) for mailman id 626831;
 Thu, 02 Nov 2023 10:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyUvC-00080C-DR
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 10:27:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c009ad2-796a-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 11:27:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB10051.eurprd04.prod.outlook.com (2603:10a6:800:1db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.17; Thu, 2 Nov
 2023 10:27:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 10:27:25 +0000
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
X-Inumbo-ID: 6c009ad2-796a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+9CQx+GMV7Ou1WrSbWglI9eEwfPCNzndfmyta7R3AtI5RQ/scl4hONqt8g4Y6+zAN7PkxeggGe+Bi+7vPIFmuJMsf1VZDHE/6hqRjZIiU/rUliSwMkU4hXznfsMwKO0yErjS2nJHUQNfeFqXragVBbWRshcOSy1LrS0XG50y6YWzXSSA1Su3Vapot/jZnop9udHMQA6J2Zi045fRsir19i36JhTnLyDYsQdS5o+GOVFvFkqAFb8hikrE2IwITvuc6BFnEmq1tffdzEzTgSfqjMoOLYc3dkTtqKUJkOW+0SUMALHhZixxwa7QbItNlJFTPLI4IXmN56/0daPvdyu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LMVskElm2zKUqZWBjYVOrRPqqXawdoZIw1Szx7bGes=;
 b=dAHbn2hoJjI8rhazAu1CjBAQtZ8pevERkLM5eu2Tt+edapj5A/sIP00dLtvbJIm+upc4c/6489WIXheIGuBWbX8sRPI59NKSzfSHRu/T6YOBaU7igM5CXnn7K7jXdrCfgTTfH4hS1Uq3n6bgch9A2IXPG9udUGX2XckJUy5yhZjfkwtQWmQdZ81nNj4B50lHg3QqxlCRdadRQlhMSik/4cdQSGeSjPOSNTNRz4VWhYvGhsUuppys9bQkw3RIVloRw0Fhp/7M3F5Y1AyUdrIrqYbIi4trHdDf4T2Tq7ZhvsoAtdPGC1OgJb5069bcMXkpSjf5L6G7zrzpG1fKgSUY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LMVskElm2zKUqZWBjYVOrRPqqXawdoZIw1Szx7bGes=;
 b=wvLEmLnhkowCdSDSCOqQcNzR/VjnTem0/89ic5q39Dxy4mlXhoURpYZLDph2YkWnLr58jALsnPk/E65cSMnbaFnoa+oza/ed6gIBWmA7+HDmLmUCumDfl6VXtceDvt8+FR2JqTe/zyFY7VLxcrHWc9/ef81NVwo9Hdvi7ZeMWRN2lUuvVD+3yAqg0AK//52iMlJmRZn5ttWn7nrG8LOggPd39MiQ+CqL0huUMCxaGDg7204OGFAQG0fFbFfFZx1543iMewRTMmqaXwyC77ly3ieDRiHe/nK+2VRhUV6YsjND/sB6Wo46RcEhSia6LopIDSfz/yMSMnVbYcojcPbDlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <895b3bac-6b1e-8379-9c59-5c911428a2bd@suse.com>
Date: Thu, 2 Nov 2023 11:27:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/lib: remove the overwrtitten string functions
 from x86 build
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <c313895654437fe154e989a7d633cca2ccc710d8.1698914967.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c313895654437fe154e989a7d633cca2ccc710d8.1698914967.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB10051:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ec361c-f121-47cf-14ee-08dbdb8e4ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r9WVoMHL8tSkXCGxOjBwOxMjX1plj/D9jZ4JealvBh5Fy3lpZCWnb23mople0zUJEHQDpnenmf6qJFMFGQ+OTUMBIzD6FfKtxndNgmNLqWM1mNjPW7UeaiTZyqETPiw/FIVieAOSKRy4p3KYo+D7b30GJbBboOt94Y2T9SsyY6vhnwVmWKjEWGfssi6Q8kp9Efo4U6CZVnJHY3uSbtHVZLAPXKzyewF4qunFhWAQ1gA9SXBLWSrfsHMj1Z/GQNj2RmStIz6KLzYiip0TZkGdyvE8zr9RMnM/B8KqvUGkVQxf3A6MH0ArAi2hgh8QJLWOMeXz+20qjyaIpMwZafZrnDGzZ6we2nASz235Mlx0DBo9dJLwW0YKLIH8Q5qoKYEAtlJSaEIl5del2z+wBchF/orKOM9L/gvjhuynz95WIy5hnenJN9W9QPJAKMoLCAWUnxUYp1hoF6TkeOPRLN0FDlbJi53+076LQF/WjaxUsRR27tWSmiMSYSXbC2v1nZy2Tt+JH3zBlCFikUKrKT/LPAGdO8cgbE1y2VYBtQmNTVa/6DwBy13/+RAQQtaheEijJ2q/oUrR6VwaJD8M67MpYgfTGO5v40d3ogUHLs7jzyWfYEt330/vnLnCrGlPVGGEghlClJpk0fa1HzSLSSq+Qvj3hZJt3efZdIpsQCAAAX8JeispNgEjDmF9cofQWV/G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(1800799009)(64100799003)(31696002)(36756003)(86362001)(31686004)(2906002)(6506007)(8676002)(6486002)(6666004)(4744005)(41300700001)(478600001)(6512007)(316002)(4326008)(53546011)(8936002)(66476007)(5660300002)(2616005)(26005)(6916009)(66556008)(38100700002)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm13TE5MSVViNDdvb0RnVnd1R05xUmNsWk0rZ0JPMnlScDNNK0k5MTdIbXpv?=
 =?utf-8?B?L3FPRWs4dkdUakxxdWpNZXMrWk1qVm1adDdZK2dybHdHRXlsMStkK0tvN01V?=
 =?utf-8?B?dldUOGJKSGtyN3QvZUxlU2pmWTlkN2tMbWRqbnZ3VC95NmswNzZTSGdOYWRU?=
 =?utf-8?B?RytSbXVVV2tpUFBnb0V2RjRqZUs4QU1ndWExRlB2cnlGdzFPSi9mZlZTU1Jh?=
 =?utf-8?B?cjd1OHFCSWRNbDRCdW5yVFJSNkNwMzR2aTVERGc3SVdEZ2JISDlmVVp1TnJI?=
 =?utf-8?B?U3ZpdXMwOXlqNXAyMmZHQUFBVVFYbjRzSEFQQ1BNckhCbVE1UFRMR3BBZXdC?=
 =?utf-8?B?OWx1eWR5YkxPSW4vcjZjK3Q3azFUdnJLemgvN2FRUzR2d2hHUVo1MjVnbUdM?=
 =?utf-8?B?YVZqdk9QWFRNUEFKODNBUGRvaWpONjc1c3ZnbTNlWDFXSXJQcjI3N0ZLR1V0?=
 =?utf-8?B?d1RjdytXd2tpL1BKMVhWOGV3UW9rRmV2eW93NXNsOHY5VUNicWMvZ3NWT3Ro?=
 =?utf-8?B?dTdMWmtWWXFTR1doYzNIeUtMMzdMbU1UQTdOb1RFdVMvb1FnK1RVU08xSjJ6?=
 =?utf-8?B?M09GbURQbFB2b1lSdzVyMnhEVDRrYjU3Y0p1UHZCZHNwMXZKYnlIaEcwdUwz?=
 =?utf-8?B?NkVxcVp5dzJXQjFLVWdyYUNuYTByWm4vdmJTQzRxbmF0a2t2SXZ1cEpPWFRu?=
 =?utf-8?B?RVEzaGVGMUNocndpTHViMkNOREtFcFVGZUR0Y0JqbXVmUzRGV2ZxY2E0WVhh?=
 =?utf-8?B?S3R6ZHNzZytIci85cjlpRWZuSVBtckN3ZWR0bWhUUW9teWI3RUl4LzB4SEcw?=
 =?utf-8?B?cFpjNHI1T241aWErZWFCZDZhV0k3UHFwdndHVmk3d21RWjVIbVBaKzhjZnYy?=
 =?utf-8?B?OWtDWHRLUCtydHlzdDVBY3hzL1F2R2d0RFBNc3pRM2hHNTlhczVaVUwyQnh2?=
 =?utf-8?B?TStESC9qOHo5WlN2TktJcWxFS1JUT3lmWTlCWlB4Wi8wQzdIU1NiUUpVM3hi?=
 =?utf-8?B?d0ZaSVBlYU5wRyt0d2d6Y2pZWU0wbGFFY1JRblFRVm4vRTQxNEhYNVo3QVpp?=
 =?utf-8?B?TmlLUk9Gdi9ZRTVxbU1hbWljMFlGdkl3eGJGam84N2l0L2I5Z0tDamFmemdo?=
 =?utf-8?B?ZUVFenIxWjA5UDR0WjB0T1ZmSy8weTVvanQvaHR4bG8vQjZkR1hBSFZmU0ZD?=
 =?utf-8?B?MzZxcVZSeDEzVGF5T1BGVkZ3YTdnVmdZVHlNRDc0eVB4SEJWVG9ZM20rUmtv?=
 =?utf-8?B?S011NWl1R1dzRkxTL1BPRDQvRWlkNkFSOHYrZjR3SkwxVDlhRmMwWmsrUDVJ?=
 =?utf-8?B?WEpGRnNSYnB5VWhDRmQvckY2THkvZWZ2OGhQVzVzelpPQ2wwMG8zQXZwaU1Y?=
 =?utf-8?B?Sk01QnJ1a1ZBczlTTXBnRC9WNnpyWWNEanV6TDAyd1RRN0R3b1l3ZzRQczdj?=
 =?utf-8?B?UE1raUdFNUtrSTFSVzlabnBnUjVHbVE1cmNJNEplQ2dNODBWUWdEQmVMMTdF?=
 =?utf-8?B?R1FOVktNTUFLS1RzemUzY0MrR0Jrd25WTzhhb2xiT1lxUTZTSnhCaUZCbGNt?=
 =?utf-8?B?c0ZNcGZMNUpOT3d2RnJJcTFDaDg4d1dqNWRBVnBqYlQ3YWNhemZYZUgrOHQ3?=
 =?utf-8?B?SFliaFpUUU5xNytGL0h0ekhjS2JHdUU1YjhSM2dHQ3NzN0F0WnRGeGduNDhl?=
 =?utf-8?B?cGJ2V0N3dlVqRXFsaHlzNzY2OGxad2ptT1p1Q0Q1eHY3WDYxVGpJTjU4c1FV?=
 =?utf-8?B?SS9sTFRZV3FCM0F4L0ppcGZ5OC85cG0vcFRmU0k2Q3B1NEk5bkVZR1Z4dGFG?=
 =?utf-8?B?eGVOQ05ZU0I5SFJFcnNKTUdsMnl1bS9sUUJ2K3M3TWJPcU1LZHVwNzVGOE0x?=
 =?utf-8?B?UlRERHhDdEM1UGpSaUtqeGl3WDc5NENmQmhFZVN0aHJkOWVQNTFud0lHdS9F?=
 =?utf-8?B?TkVZMVpLSlZUTHZWU1F6dHgyT1VXMjg5WjczY2YzaXpZY0FlOU0xZG9iUWg1?=
 =?utf-8?B?RFlLK3lKSGdldXZ1R1BROWY0UFZwTVNsRzVSZkkvRC90eStqN0RiNjVMTkFD?=
 =?utf-8?B?TkZzQnQyYVVBN0pDZXMrNE92aU1makJTUFpLQjdXeXYrNlBqVDdFdFd3Z1pt?=
 =?utf-8?Q?9gxwIVf134ENq9dZNO8HaVTR7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ec361c-f121-47cf-14ee-08dbdb8e4ea1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 10:27:25.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+hW1xU4LfOWez8HjoBHVs1DVUJ3P3u6bzh5JffoZBNqR8INhKxmR2hR2NuyV5d9zTDESYuQWWnSzRpucoF+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10051

On 02.11.2023 11:21, Federico Serafini wrote:
> Remove the generic implementation of memcpy(), memmove() and
> memset() from the x86 build since a version written in asm is present.
> This addesses violations of MISRA C:2012 Rule 8.6 ("An identifier with
> external linkage shall have exactly one external definition").

Yet part of the purpose of the code in lib/ is specifically to be available
as a (uniform) fallback. Nothing from the resulting lib.a is going to be
linked into the final Xen binaries, so I consider Eclair wrong (in some way
at least) to view such symbols as having multiple definitions.

Furthermore, if we really wanted to do conditional building like this, then
what to exclude would want to be determined dynamically, such that it won't
be necessary to keep two (or more) pieces of code in sync.

Jan

