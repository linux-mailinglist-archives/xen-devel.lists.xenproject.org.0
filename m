Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A065AF754
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400419.642179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSu-0005Tg-UI; Tue, 06 Sep 2022 21:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400419.642179; Tue, 06 Sep 2022 21:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSu-0005D4-K2; Tue, 06 Sep 2022 21:50:40 +0000
Received: by outflank-mailman (input) for mailman id 400419;
 Tue, 06 Sep 2022 21:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgIc-0000Cs-JM
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:40:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0169a57-2dc6-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 11:31:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 09:31:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 09:31:59 +0000
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
X-Inumbo-ID: c0169a57-2dc6-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwB539alk/EfTCCkzB6LA94ppQm+cACmKw37kuGP52T1aMnthqppJl1RBjWZcP4NaaThZw2/gCqmAHVRip4xM6DGUD2dgcro8jFf6lAoNucJ8EALOt1MScoMq0tZSKMnwZ/kotO4QVcTEpAC0c6TzdviN0/Ob3Ahi2UOOsw6pLvDd7gNqqmbBHDUQwaOcU3Ag5/+hpVWD8jcdwLOaTR/NpvSnXAyR4QSDr/59fbexPpOQogFBO7X7clbn8bi+Rr5oIYxcZaE1QKvuU4BYuPYfFMZwYWT4qrwxG3VmZc8LqHzlSzo8+GmQ42z0dD7UVPnrFpg8WuNUroYmuqXx4pMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LuHYQ+oWu7WAhdqIncHHg95MqTmJvPsU20Mr/RymWM=;
 b=iFXmpzup/lo5JJ7Qz2aSMkbPP4EfTyqGtNoOxVqySPjAAFvhE6roWtDtn7LRP/yM+kWyFKFkVdspgaOBbr67mFtX2E0RZD0qZVPDA0kvMN7jph626NKoJJrBD2O8QvT5GWCOMpucPd8eZB1uC6Ch9AubL8QH4zQJVtC2ngIs26NsOPOXsS28uKw5pLpLAJcVXRlvNx84rx6dKbmoaqpYfEytD7OgKNG8bZuiM4OZPckQi1pCB4+elSNGWyT9TcbywpQFGDLZD3unaqU7q0I3QXT6Ot7ipl97F7FNRJc6TG9/Z4DRO8yUaGxyLgHVJn4jjrOIGu69vSP/Du+X+JQ6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LuHYQ+oWu7WAhdqIncHHg95MqTmJvPsU20Mr/RymWM=;
 b=4eGsLuOzH+3+mYfI8jp/Tp8P7wXZBkZvaNoGqhj1VdzBVuRO+ovgx6gUVl1cGFddSoxujkXWFlXHJQyoxE6kWztkSG/RT81xhjjpTeZsDPeUNwxEnewuaYlJM+7Eve2sF6gm43hRXM8qgdepZCQQ4ETFWmGJpMR4GJrCdqlE3xe83lPk/9dMOVuMfEwA9aoakPX8jiHd0D/0bucTwycEWBJaB2jamhcqyti3PYMZQlqzMBOOudrn1t5CvJXzNHeEeCA7jrDv1fkKdENtOY8APUqsxMtNg0lFM6QlD/Qmqj4cZKo5jp2FB7EjXZ8LWn1qnqrNrlUKa1bsep7oZD395A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc2c57ee-0881-78aa-36c4-d3cce3cd4da8@suse.com>
Date: Tue, 6 Sep 2022 11:32:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 0/3] xen/sched: fix cpu hotplug
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Henry.Wang@arm.com, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20220905070005.16788-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220905070005.16788-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dcedee0-268a-4058-b2df-08da8feaa5d3
X-MS-TrafficTypeDiagnostic: AS8PR04MB7638:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z5gVM+WaVjLwj+I/kDLtmWhgnKjtyh5pnyW5HgDF4tKh17lXrlr4gGZ8uSP/Fwu/t5T+hvIlxXZRMN9lgR604crh9VDPieYT6eP+wMFK75suRnHxOoOLkIdpOiGDVTlwvrqSM7xO5v7AuPIuEEImww/YdKuVUIJPt8n4JM0DVkj8gCesO084OvxNJbenjXJHH9/PHzXt/CU3PONtr7uHQamxAfscVxE2Lz6isgMaNGMYey89ipSeRXVZyeeOtaVNOdTCx1kcxzNE4a1v/VlIR63sehOgGL3s5dl/R/w8+mD2MQs6eHCmPv1I5OAGlg6iQv8NkVDAaW16e080+0f3wPS8UW7lsX6dQWnRSswork/CGa0aMnj9kQmGEokv7ga5zDRKS8BhgxLpI31SENCCu7qUvmVb6yEHmtdL9viaWm/ZrVYgk/pQkelxEZXSHV/Yw3mzWzcE91mfgVcj2RmZWE3r0g0AKQdLbfkk9jd3dtoUhGbWzEbxUi6xQ8Is6l3TJo/Bg6azMLVEbyi5qdeuJpHJfbYRKkTbQSujiIno3wWgV52zJnD7rGFvuZi9oFuQeWMgC1mce0SBuzGvRY8yveCbT8bfSDAxZRf8Mek4JhB22OAiftyWwf+nRIPlM11PwCA7nnVmeWL2ByaeE4cWzvEpswNIsWYwWBdaD6BI24mRArd11CGMa4sCg2wLiPG+7sNzPDJDedywfgpAa/U96A7A8C7L/o1xpOoS+pYKJkiIC7RSFfVqoETcssTscXIl2ZGaM/mk/sJGKGZuw89Wcr2QqyMkk93y4sZLPu4XTR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(39860400002)(346002)(366004)(6486002)(2616005)(26005)(186003)(31686004)(6512007)(53546011)(36756003)(2906002)(38100700002)(6506007)(4326008)(107886003)(6666004)(8676002)(86362001)(5660300002)(66556008)(83380400001)(316002)(66946007)(31696002)(41300700001)(478600001)(66476007)(6916009)(8936002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RzMDVuam1iTk9iQWJFQ0tvY0FsNGNPZEt0SUlrMEVxWW8rZmNxY3h6eTBp?=
 =?utf-8?B?Z2EwNFdpYlNza2lFNGxZWENNL21hdGw5U2tSRWFZVk5LR0l1aHpYcGxIUUhw?=
 =?utf-8?B?dE1TOCtwOXNzRGc3SFgzZmh3NmxibVZpS0paUi9QQ3RzWVNSZ3VZZDlNTGpw?=
 =?utf-8?B?YVl1djQxS09iVlB5L2N0aXdFQnVNajZKcmFpblN5Sktod2NXRjVCSjEvV1Zq?=
 =?utf-8?B?Q2x0dkZGeTJlQ2tXL1BRaE4yK0pJNDNaSVROeEtMWVZybGp5K200NHNxcHdv?=
 =?utf-8?B?czZJZHY0RUR6ZkpPaFZwei9yL3ZsRnpBQzRwSEhkYlA0THlLZnQwdnJ2aUlY?=
 =?utf-8?B?UytWdHNqZGoxM0hkbnZ5UUFnd3JmV3RQVTVRWjdJd3padUl2K0hIVXk0RTg3?=
 =?utf-8?B?NGdDc1pZd1I4WlhGSDVYS0t6clpsTk93QnJpekNBSlF1RWlLcDRhMnVieTE3?=
 =?utf-8?B?WWhDS0JYTWsyNndhc1FnR3lVSVF4bG92QStMcDlZWkV1ZUdVQ3AydFBzK2pV?=
 =?utf-8?B?T0VZd0lJUEV6SEdNZXRneEhwMDdzcllsMXFkK0ZzbTdxcXdic1R1bHpqa0NB?=
 =?utf-8?B?NmJ1V3R4Z2ZUekpCb205OWRRQmhXOHBhME4zUmRJTlBOZDd5Q2NHeHpLakRt?=
 =?utf-8?B?NVhHSGFCQ29yNkRuL2lIR0srdHY0VnNYd25SWWJuUG9NZGRVQ0F6dStIY3pZ?=
 =?utf-8?B?Y0NUdUpHSDY0cjBDZzBJdmNvQlIyZXhiV2hqUzJoMktXZFVsL0VLNjMxOVNl?=
 =?utf-8?B?NE5mZTk4NlI4K09KZGFwOVBac1BPNnN3TVVXVlZha2xwZFZqSDgzM1RTY0Nn?=
 =?utf-8?B?NmRYd1BFSW1lYTAvVjVQejUwcDJqaEYralRORTFBOENMRUFIMzdqNktjbE9k?=
 =?utf-8?B?RmhYM1c1bzdMbDFKOUFnTlNoUXljSXpjOE5DRGtTOC90UDZIdXJ3bXA5c0Ry?=
 =?utf-8?B?WkJuYjM5Tm9rTXZOeWsraXpiMlRvc3l0dmVMTmRSZDFmTkNxdTliL2xQd2d3?=
 =?utf-8?B?NzNzVGlTc3RkbEpmaVQyVFJEYUNuTVg1WkRDd1VjWWdZUWhTNXJuQ3NUWDBo?=
 =?utf-8?B?ZUQ5VDhSZitEUEFvTnA3QitMNGt0SmxtNTladEFsTndDMkpubktKSEgwdUxH?=
 =?utf-8?B?VHludGJzaUxxbEVlZTlsQUdxdDJtdzA1UWFKcXFoSWlzUjhQS3M1V2xlak93?=
 =?utf-8?B?Vk1XbmxzTnl3WFBGdXNSTmdpaFFjeUpCWTlnaThHVVhRd2EzRm5Gb0VTbWV5?=
 =?utf-8?B?bmUwRXZUT2c2U3pGUGJhRVlJeWN5cnBBTGQ2alphYWJVbWdIMzloNGFsdzll?=
 =?utf-8?B?NEVWdVZobk8wSkUvZlJNVjZ4Vzg2TjA2aENMR2xvWXJxZk40aW9IL2VCMy9C?=
 =?utf-8?B?U3BiTTM0ZUJGb1JpbkpRZktCTnMxM1dzOUdYY2RIbXYwbGU3YkZMRE51N05z?=
 =?utf-8?B?cFNyMmRBWWFkRU96YVpvaFVoMjVXK3BDT1FvZUx1MW5MTG50YnJ3cWRPalZk?=
 =?utf-8?B?SlU5RC9YUkI3ZGhLbVRzK1U0SlJHTEd3eGRkL0t6MVZWODRJcmFBQkpQbUxt?=
 =?utf-8?B?d21xVWZ0OWh3WHVNTzloRzMyR0xaSGxQcUdFRlVhVU5NbzdSOVNvQTZsZEds?=
 =?utf-8?B?akJLZlVOblJHY01MQkNtU1ZUN0Q5NWI2ckc4bEpacElZRjB4NVY2TEtYSGlt?=
 =?utf-8?B?NTY3OFh6cEkyYVVIcWFVaVZaaUhrRzJBVVorZzJidVFCbExTVUU4MGMwRDNj?=
 =?utf-8?B?MXBBdkFCdHJpdTMzcWQyVGhhZXFZeXo3NTdSa3ZPd0kyeXIvdFh3QWNoR01H?=
 =?utf-8?B?MUNUMzdjb0xqNm04NTkzMEJ2UVk0OUZReDhCREZGMjJkQWU4L01hbHlXalEv?=
 =?utf-8?B?Rm1XK0czcVFKdjVjMUNWeHpnKzlPbGIwdXJjQTNWU3I3MllJR3pCQTVEQ0hW?=
 =?utf-8?B?Nnd4SUVTNmF6STd1T1RsL0F1ODJiclhZNW9Zck9GR3ZVMUZJT0tvVU9RdS9v?=
 =?utf-8?B?MHgrL3hDZDFPOGl1NGF4SWNtVnBleW9zMll3YnJmcTJSeFJNZFNrWVdBWFAr?=
 =?utf-8?B?VUVBSFc0a3IveFBnZGE4c0ZkZmROaHZlNDlJa1pMaU9ubW5sd3poeWR6dWsv?=
 =?utf-8?Q?Q9np2CABDokIv42LOPqU3q0fB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcedee0-268a-4058-b2df-08da8feaa5d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:31:59.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3NSAxiqsN7szkOJfX3fvHiq5Mdj0YwDLj2HJyWrHMjvZFiJiezEKDn8Z/YWsPHD+S2VDxspjkuo6VBkbgWXkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7638

On 05.09.2022 09:00, Juergen Gross wrote:
> A recent change in the hypervisor memory allocation framework led to
> crashes when unplugging host cpus.
> 
> This was due to the (correct) assertion that allocating and freeing
> memory is allowed with enabled interrupts only. As the main cpu unplug
> operation is done in stop-machine context, this assertion triggers in
> debug builds.
> 
> Correct that by pre-allocating all needed memory while interrupts are
> still on, and free memory after interrupts are enabled again.
> 
> Changes in V4:
> - addressed comments
> 
> Changes in V3:
> - addressed all comments
> 
> Changes in V2:
> - addressed all comments
> 
> Juergen Gross (3):
>   xen/sched: introduce cpupool_update_node_affinity()
>   xen/sched: carve out memory allocation and freeing from
>     schedule_cpu_rm()
>   xen/sched: fix cpu hotplug
> 
>  xen/common/sched/core.c    | 214 ++++++++++++++++++++++++-------------
>  xen/common/sched/cpupool.c |  92 +++++++++++-----
>  xen/common/sched/private.h |  21 +++-
>  xen/include/xen/sched.h    |   9 +-
>  4 files changed, 236 insertions(+), 100 deletions(-)

I notice you've committed this series, but I wonder why you did so without a
common/sched/ maintainer's ack.

Jan

