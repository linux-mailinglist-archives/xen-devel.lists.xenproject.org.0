Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879A7595D7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 14:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565829.884380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6a0-0005rY-44; Wed, 19 Jul 2023 12:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565829.884380; Wed, 19 Jul 2023 12:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6a0-0005oD-0X; Wed, 19 Jul 2023 12:46:56 +0000
Received: by outflank-mailman (input) for mailman id 565829;
 Wed, 19 Jul 2023 12:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM6Zy-0005o7-Mb
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 12:46:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55f6aa05-2632-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 14:46:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9128.eurprd04.prod.outlook.com (2603:10a6:20b:44b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 12:46:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:46:51 +0000
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
X-Inumbo-ID: 55f6aa05-2632-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmMLyQcU38SzjlVAtp//jkyfegLwA3vVQOubYrNIyaM/q7LT43afezovQLiAt9Jdm9C/A6VZJ9sH7GwzIvOQs+COguOEsmzzqJb7WMiJm5G4/9bNfzngmqelK6Tgn3UQHjSCS9rdYxiYku/mQa1p523Tw9PQcvA6luIMtewLYXTb/xQTUA30LthPVpKMlcV2DYaksqA90pBgdPoViT5zK/rDZt3xSxh2Dxkr9LYh5TJs5GHJCr/gdwIilVaMMhBHOcm+q7DW4aGQNcFyRDVIXNxDbR6LdhmAYkUcZT2KoTCcFouhjVDrqV6gjuOfn+2ko6BlEi4skjo7JsRdVTXWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PpEtTjchqtIXbj5lvrqIxEFaxj/Cyma1XqXDqeY4cU=;
 b=ju9ZPC7UOPtiniEYWBIvD83RK++BgBLL5VTMjNzCjv2d+FhvgHhG3kmKmHvgS+nUjmyxqQtBiPwoZ4CE0/w73TGuIOFMgFWQLdSPhXmN0BOQDJ43ggAGrJ/1NjyIHeyt7gPNoJsVAPHn6xP8aaYvxxllaO1eXLjTl67RFoKpkZwSTQFcPwXNpkJEt6RD9vVusT9Z8tUgJ1tQASKL2lcC48nwq7g6QSz9g8/N9BaNi4LiHog5AwSgLPv+1PX2Y5wIun8TQmsS+fW6W6QMgxMxAaDgGEzoEXNSPyYrSlqTAhez3JofTAfkN6hbTNAkh1QAqCDrHLTHald8atsiCJOqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PpEtTjchqtIXbj5lvrqIxEFaxj/Cyma1XqXDqeY4cU=;
 b=gzX3jC157dnMf4hgH4rBTXAsS1v82hrHpZRCoAGe97ETpKuLeTsHgId4OdHqNgPc1kHmHWXWdZ3eA8VPoMISk/SeWyNis60doiy+9JS6LHlKqzM5Zl7hLg3eIsETTRJWKsrTnNsQehJ7LmwfP37Kjxyy/ZivHw3ZArxkgA44jgGXlyV5PKtUnwD7qlk7DxuwZNgKjvngSm2d9z3mvRUgN0GButeJOaLgXVGRhz94BWpGBLFuE4kYXmpJ21zXidgVFPjhxTXQDQ9arQeNky2Q8jozaqAST4NGtCBR4yV4MiqwgfJqhnaF15OYl20Ja16hn1CB7VrAgWJMOP8CUIQxhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <824bb5f9-7bf7-9482-ca35-e4d1019ea7bf@suse.com>
Date: Wed, 19 Jul 2023 14:46:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/5] amd/iommu: force atomic updates of remapping
 entries
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230718124334.36548-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 1550dadd-683f-465a-c3c9-08db8856391e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7WKRvgq+p6vJtUuCw908cdhHQ5sbEJT7HLbqIumoallsym4JUNKW+0UMku+EIHNdRXKy5eRDm1K9EkDhztaN50Qq1jRj5CqEQzZTq4baUXBhACps8L7QxohA7STPF8509Kb+MwcyV1wdEF2IGlraSxtqFeuHYIrftX9Lw3JXcugclFMr4XTIe4Ytt2nO+N0zQGig8tkAYwVmb+Azo3b6/i3AV96jkoW8IdGC4OAf9fqNMB8yEWOYBjYjsTcCuBGLQBo/0KaEdcKHjWbqBjeY0oarXZO629NkZakCe0vqsDiZlxVlUNStManuD2MJYHVcIXnnexYBG7b41OJCanyjtdi/cgIP3wxoDw+U9/0N+VWReaZ9xyPnzGsuCZFvgAGLZ9m55oqjd2gyl3UtvTvTT2fM/61Dw6veLxUP1/khM3QGwEG1Ot9s08Vz5CXpDopxhSrT7yiiUMYhJacgRU2RmPrbO4FynbvhVTiONUOQQJ67RWD1YSYwXgHWc4wyuNTn5Gt+GFTdKnOiR+8z2WKbHh4wPvJii+TiBPnwcmQZycBefq79ujfrPjxQJVgSpo8Yhu6JIyiiPl9smQ4YJWvi0hpf6BA6EBCjw0ejjp9SJtzPS2Hwr2oPwpVGIZUSi2OPODhr5aDwdVoXM4/VOy0NSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(31686004)(31696002)(86362001)(36756003)(2906002)(15650500001)(2616005)(186003)(6512007)(83380400001)(6506007)(26005)(53546011)(38100700002)(6486002)(66556008)(478600001)(316002)(66946007)(66476007)(5660300002)(4326008)(6916009)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFRWVjRNMGRqV09qS3lDVXN4Q0lJSjFNcmpNdG1jck9pWDFxSmgxM0J2RnNj?=
 =?utf-8?B?T0ZKWE5yU1EvSkRxS1UxVG9MS2MrT2NMN1Fhb1ZvWlYzZUc4aHlkOUpGbFhT?=
 =?utf-8?B?ZkREallpcmVhaEJFaWhrWEtLK0ZOc3gvS0FOb0Z0cjJNa2taenQ0RUU5cStj?=
 =?utf-8?B?Yzk1SWxWVGFFalRQZUhKZWhFYnp5dElqdnY3cXcwTlQ0czB2dU5idTZiQkRl?=
 =?utf-8?B?MTJZcklkMEk0RnZLNGg5N3ArbmxjSkxRN2puSjJmYVo1V0lNV3ZxYnc1VzVk?=
 =?utf-8?B?WW9lWW01ZEFBR25UaENTTkVrNlc1NzlWbXV3ZjVFM2dkczIva21kd2xPaU5V?=
 =?utf-8?B?QXZ6TEF2UVRsQlNFeWxGeWxwenYrQjJhWEl2a0ZCeXUvenVwMklRcHRWa1gr?=
 =?utf-8?B?TnVWZVlkdE5uSzMxK0tVYzMzMldNU2RMTXZDZ1Vid0QvQzArSlJvUVJEdVR3?=
 =?utf-8?B?MjZoL1U3TFpGcWVucUV0S1E3UDlObDBpejh5WmJYOGg2QXAxTWFnaVVaVy8w?=
 =?utf-8?B?OUFBdGlYbEpneXl5UzlkZ1dCR0xsbUlQMFVhWnRyKzA0TytVWGZFMW8vUEk1?=
 =?utf-8?B?bnkwck5zL0h1T1dOOHFXbUFEakI2YzMweDdhb1hJd2hMVDg1Sk1YSGQ2VERI?=
 =?utf-8?B?dU80SzVsN3BQMDBMaFRrdFNFaFU3czdGYUdsZ29LM2NUSnVqVjUyT2txR3BD?=
 =?utf-8?B?bFJaZ3JKdy90QUhGcThGbEo4YUs1SG1ld2J3bVZmTjBUQ1k4QzJZVGRTUGVG?=
 =?utf-8?B?a3dBdEN6Zm5Qd3R0WmtPbUt1MkEzY2dRcjVTczBkemhKSGgrM1Z5eUhWdHA5?=
 =?utf-8?B?bXZFQWhNSjlJRkJ1cmt6N2VzQzZ0WUx6aUFOZlJlZjJ1OVVwdzcydDlkMk90?=
 =?utf-8?B?cEhpNHlrbVF1bkNIZ2pwQ2NYejBqQUZkT09waVYwYjNuZkJ5N0JPMnRxekNw?=
 =?utf-8?B?cWUwM2ZCQnFFcFhWZmdYck1PbFdSQWdLN0pPQXhIbjVtK1d5VnZXKzlUOVQ4?=
 =?utf-8?B?VXBuV2I5U1k4SzVhcGxYbWljR0V4WEZoTG5uMm14VDZESUxabkxMVDM4NGNF?=
 =?utf-8?B?eEM4a0JUQWlaWXdEam5IUzh1YzIvUHJmbUVNZGdLcS9MTkdVbkpDT3BsbTlR?=
 =?utf-8?B?NXVBeHZjM3gwOGZTWG1Yc0R0TDNGdHRIdjVCOHBJeXhiNVlZcU9iOE43ekZE?=
 =?utf-8?B?dndZbldpRU1SelZBbzU1OEJCQ1Y4RThoZFV3RlEydm5sZ0s3Q1E4ZGZoMG1j?=
 =?utf-8?B?dTlmb1NHbm1zTzRENWVYaXVXeEt2UlNRVDVxcXdQNS9VcTVPTzBkUVF4MjBx?=
 =?utf-8?B?YTZaWjdwUDBQVk1XekNxT0g3TDRTQnFkVjlMbHZ4RFV1TmNvOGE4MVJZSm5G?=
 =?utf-8?B?RFlxOElrb212Y1VFekh2azFRb2M3UjNSR3Q3aTJ3VlFaM0FVUWlSUGMycmJL?=
 =?utf-8?B?ejhOd2hvRXFUa3g3NXUvVGN2MzZ0eExnSlFTRFNqWitzY2ZZRjA3aE5GL0Vn?=
 =?utf-8?B?c283Wkoyb0U2NGJ4SDJuazR6elRDeG8rclFacmpEL0QxN0x0L0tILzV4eUNl?=
 =?utf-8?B?N0ZnVi9qM1c2OEJ0M2V0cnZyZk5sWms4dGduMVkxMkRmeXRCblNXN2ZxMGpF?=
 =?utf-8?B?dDJuWFF5THJBWEJnaGNtZjdvZDBpQlo0YTZEVmhUVXZyOEd6ZDJZRStmWjZE?=
 =?utf-8?B?b0dLWVlaR3lKOFdpNlpQL3o3aFozeXUyVExCRHlkd1lQa1ZlZTBqSGhzR3Jo?=
 =?utf-8?B?d2VJeC9rcFV5a1pGNmZMN3JqdDNLcUVxVWF6QWYvNnk3alRmRE9lWVhEckRI?=
 =?utf-8?B?T0FpUGZ1Mk1NY1I4RXBzUkNOZExvZmxlT3JtRHRBSUM5VnNiSWU0Zng4eFNn?=
 =?utf-8?B?MmFORjlGc0lnQWxiRlRTQSt1WkdOdmZVS0dhNE9oOElrOGhnT2VlY3JMaklk?=
 =?utf-8?B?d0pQSisyNldhS2R2WGdhWFQ1NXZlUUdNU0tNNWs1bjE5WnlPSXcyNEplUncv?=
 =?utf-8?B?VHFpZUpvVjQvUSt6US9jcUhTM3RjWHNZQitTeHdiZFI1MDdEVy9lMFVUYjlk?=
 =?utf-8?B?VWxJRlcwbUFKSHk0ZElrL1plRHJLellQVkV6ZWxiUENpd2ZZTG9Va3haeUVJ?=
 =?utf-8?Q?/ReNzjkPUc+R/HvO9ZuJX5whp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1550dadd-683f-465a-c3c9-08db8856391e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:46:51.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSGvi7Ri6uDsH7wo82URqXvjtIlHVPlhK21scEHDM0zfzL0EKQ5Ewe7UE0JbHaPTQ4x7yKmz8EqkYfIn9ujLng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9128

On 18.07.2023 14:43, Roger Pau Monne wrote:
> Disable XT (x2APIC) support and thus 128 IRTE entries if cmpxchg16b is
> not available, do so in order to avoid having to disable the IRTE (and
> possibly loose interrupts) when updating the entry.  Note this also
> removes the usage of a while loop in order to disable the entry, since
> RemapEn is no longer toggled when updating.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> x2APIC support was added late enough on AMD that CPUs that I believe
> all models that have x2APIC must also have CX16.
> 
> The AMD-Vi manual contains the following advice in the "2.3.2 Making
> Guest Interrupt Virtualization Changes" section:
> 
> """
> If RemapEn=1 before the change, the following steps may be followed to
> change interrupt virtualization information:
>  * Set RemapEn=0 in the entry to disable interrupt virtualization;
>    device-initiated interrupt requests for the DeviceID and vector are
>    processed as IO_PAGE_FAULT events.
>  * Update the fields in the IRTE and invalidate the interrupt table
>    (see Section 2.4.5 [INVALIDATE_INTERRUPT_TABLE]).
>  * Set RemapEn=1 to virtualize interrupts from the device.
> """
> 
> However if the update of the IRTE is done atomically I assume that
> setting RemapEn=0 is not longer necessary, and that the
> INVALIDATE_INTERRUPT_TABLE command can be executed after the entry has
> been (atomically) updated.

There's one additional prereq to this: The IOMMU also needs to read
128-bit IRTEs atomically. I'm afraid we can't take this for given
without it being said explicitly in the spec (I've just gone through
and looked at all occurrences of "atomic", without finding anything
applicable to IRTEs). If this can be resolved, I think I'm fine with
the patch.

Jan

