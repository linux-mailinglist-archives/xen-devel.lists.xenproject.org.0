Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B08776169
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581101.909641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjR6-00052r-UL; Wed, 09 Aug 2023 13:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581101.909641; Wed, 09 Aug 2023 13:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjR6-000512-RT; Wed, 09 Aug 2023 13:41:16 +0000
Received: by outflank-mailman (input) for mailman id 581101;
 Wed, 09 Aug 2023 13:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTjR5-00050w-1q
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:41:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 663dd44b-36ba-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 15:41:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:41:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 13:41:08 +0000
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
X-Inumbo-ID: 663dd44b-36ba-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL/jKIG07D/7FDLlDlKwU38FCdoXGzcS7emKy4s/PkxNerpnAIkvppPmdIVJRVEwt8+13t5SxmXro974cWiyZOIDzlV7nwp7jnXo7NcN3BtM0ZPyazNDiR1PpRNmXf9Z0vt0/UTuj43JUxl2ghVdydKKWaKjR+8lgciirQE1D2JcygQIcqtv3gg6pcdOOcUFpap5rGQyNUq1GFbIBLV5r0gyiN3sJJ4tqSpzIA1CqnrJebrSags8AMbl8C45GAQlduB+VKRI6FRlb8L4vEK44hNTkOhtGiupmSagQCVzWBBuYYT66QSv5j0mlm5SXuXh3ZlpRj7iQrvA8EcF778qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwLfT/HY8Y+KE1UDEXbyy7Wsk9vEplxTZdEr1YhPpo8=;
 b=WPSI0Px+6CS+ptK1WjRwPLaMMEaZKuAZ4mF+9OZVe4/KOM+HnWoV0QpgxTd0zjT8SjGA6sAlHH0bL1sfqueDuKnLkK0BCYPuU0eavYx70OmAEjdkUXiYHYjApKRdGKGP9L7F6Ayvnt6XWxVaqrJfxzNvRu1s52ytHkt9PQjlFOp9q9Ahgk+IKqR6vqWayCv3fTsG5TFxyM4xTbsFiWEiMTuab27qpx/Ma7WXzqWLVNnYAIDznPGN/APt4Ud3YwmJLW72dLotzB68+GAQUIIDhRn3ZqFbP2kEeaI8WuJIj+XLVHd6O8kKQpUo3Ss8BZjZK40grJa4n3XnDvq9BQxY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwLfT/HY8Y+KE1UDEXbyy7Wsk9vEplxTZdEr1YhPpo8=;
 b=iWsdFcsHL2AZHKTt49wMN46iAsIlFlIxvZCAkBjNWVqiHmsH1X4YwzlRNUkZ5f8DdBgt6xQwDazKuqpva5Attg5AwzUa/IWpoSQQ9Hm4nxDufR7C+4fng/Gs/SD3KlxPkh7Ht0uChE6KlEurrUGzC7SfHjrIRGypUaRORCOfktUNJWsCmiZ+KK/VcSk7xgXfrReAALLUht+R/C5zCM9h/1RTQ9Pe0RRJfHEmQVHAVpQtTS+oD6ijzI/dFDT6CmGQ7Ba0VVpkipY+PgM0Qa80PD8lWrRH+BszIOtq5vZtYUv9iUEY4usGVllMdlQKk8P+dSGmpvpztO/O9GlzTf3d3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <461a30d3-29a4-8c53-1dc3-42cdd50bdb01@suse.com>
Date: Wed, 9 Aug 2023 15:41:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 2/8] xen/memory: address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <844e7bf57c2eb7b20d8b1f81a7730a7612f1b6ac.1691575243.git.nicola.vetrini@bugseng.com>
 <2AD1EA83-AE7F-485C-ABFA-D285B4BAB1CC@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2AD1EA83-AE7F-485C-ABFA-D285B4BAB1CC@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 73dccb94-5205-4b43-f768-08db98de4999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z4pDWmYJSLnSEKCGF8EgY91/WtYCtFXsWo0WmtyO4h9d792RjPdh3md8UPZTcKn513BTvfkNEnFdkwZYZKOrKc8bMZ0vOlzCB/d4oAce2OwZQnY8I+dOKcQT8R9APEF+tA9sVL08187Wl/fU/4NYxSKfB3HgUyLpgr4I1fBQNP/ihJDIezF5YB5gCwUavg5GU/Hj5vkaZWXPXLqCtfl7U7/svT47QJZsORbTtzG5TJd/daKOx+T6gWzl5ss9ZqVGBrjyot777Me88bAEKWSKDj0hbQYBumw4DL3JutlFDOWdpcJagYG/bKTs9Uqd8vgUnYRIBUbIfoAAk/0rfnrKV+cfOET9riWxHdlsbRQqqUYCapSS5e/Ali6Eu501xpeA2C+gNCOPP/25bWnajvMXOCL9r6UnCU87cpZacXNZjzxZVzmJoJottMhCdGPSYt1e1aLC3Bd2iLK7uwHB2yP71TvCarUy646CQgfk9YMUUsaX+8nxh+tmyqdjVxKrqWhgXuor/SGzWTRFanUJ8z0fQWEKV7bOlBhHR/3NXogE3uKxmtDYibabhy9qnWj5ptjLc26jmsi23VKhdh5NZSZp7u5tNMLbt9Rg6FHQEX6nG+8ruR4OYLttYz4X+oQ9ez6fuTyZ6YGobQJtsoIYeS8Fmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(186006)(1800799006)(451199021)(4744005)(2906002)(8676002)(5660300002)(8936002)(31696002)(86362001)(36756003)(7416002)(38100700002)(31686004)(53546011)(54906003)(110136005)(6486002)(6512007)(478600001)(26005)(6506007)(2616005)(316002)(41300700001)(66946007)(66556008)(66476007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnk4R0E1bzNTa2ZpTHJFT3NtajdFdXgzMUJXaWtwbjhkUmpLbjlSc2xIVzJo?=
 =?utf-8?B?NkdzSWtPSkJyclEzSEF6c0cwZTRnWTRDSEU0cWNIbHRiZW80WFdIbFRyVndV?=
 =?utf-8?B?UEhkbnlhK2NVUXNwZkM1OEVRREY1OE9EN2kwaFVOYUp5OS9xOHhkZ2M5Vm1T?=
 =?utf-8?B?OVdIRm1jWWRsSUxYT29XNS9lZmZ5aUVCVTNrVmt4VklKVG1IRzV1RGUrQjQ5?=
 =?utf-8?B?RVUrQkVKZ0tZRHdSZzIyUXN6c3FqZ2JqeVlObGNLaXNZNlNDa05kS21wVjE5?=
 =?utf-8?B?RWNJWHJnMnEzY0xHL3d5ZGo2T1d4Zk5idVVBZXFhY3NNWGxsZllOaW1Ta082?=
 =?utf-8?B?NUFQRWZ6MWVJVWtzUkxEUkFCbUdmYjRxdUlYVjRqdmVDSk1peENjWjBCczdM?=
 =?utf-8?B?a3BwdHgvZlArTE83Tk5GYzJWMU9VV2VWRjJnMWp5RlY3T2xFak40RDlkVXQ3?=
 =?utf-8?B?Z3NpZmNTRTFDMDdUTlRBWTZicmhranorb1huNXQzWjc2QUpDM1BhS0hiT05C?=
 =?utf-8?B?TjU2aUpieTM0U3RIZU8wWUNUSlFhVjhzbXZMd3h1QlNRWFRoQWZCbHZueTUv?=
 =?utf-8?B?Y3NsV3dEYmxKNHBNU2xOcURBVHk4OS9odmxCVnBta0VPdEE5TXU2S0hZcnJu?=
 =?utf-8?B?RnlyMldtQnYxRmJXQ21FS05nUFh4dFdEVm1vb0d3SHRkRGlKR0cwYWRlNzRT?=
 =?utf-8?B?NUdXNzJLQ0REeGM3MUxQTDg2ZkdPTnpoQXFwdENJYWhKSnhVZThBMlJXQnc1?=
 =?utf-8?B?WjVCVlNvRTRJZUFjc2ZCNDg1aEhKYUZFYVdKTGhWcnNpQ1dMSUxlZ2ZVb1lj?=
 =?utf-8?B?ZTY4cEJKdzNUZllldHladFo2MGIyMVNMY0NaeHdsMjlWTCtqSEdSRnNjSUpK?=
 =?utf-8?B?a2VYdXRTbTU5ektxV0ZEdktLaDMxRFBIaWVHNXhTa1grOEI5TmVqYlNDMXNJ?=
 =?utf-8?B?WDhVK2NqQVRaU205MmFsVkJtMzl6SFhLNmF0TVB5WEVaZ3JSbzc5R1dUbEdF?=
 =?utf-8?B?L1NyYkRBc1FoMjZHaXI4RHB3WkFudlBOZ1FQV1hHdGlKZ1hROTZMaFVHVm04?=
 =?utf-8?B?b0QycnlNZUdjOUN4Rm1WeXdWUEo5S0g0T01XTVhQalNZSzJpQlJaSnJWVkNZ?=
 =?utf-8?B?MlpVUWZiNlZiSGdweFpjM1ZBOGZkeGk4Tjh0bzB5YzJuZ3NMc24yVXZ5VlhK?=
 =?utf-8?B?b2x1TlRVSlM1TUVGZ0l1RG1WMXljRVFld1d1VVRnUUM4cENzWVMrK2VVbjl0?=
 =?utf-8?B?KzVNSy9qMG52ZVpWQ2s2R1A0alNSY0EzeVJ6QkxMQmhPUERSc1l4bW5RQXdD?=
 =?utf-8?B?aUpUZVFKL29qeVljbnNGQU1pTlJHZGlNQTZpOEJLVjFoYjdyUlpWeFh5RDds?=
 =?utf-8?B?THFFSzNwU1ZveitEeEtQeWFiWEhwbFoxWFJRTDhTUTR5c1FMVGk3cXRPMjVx?=
 =?utf-8?B?SUNKMXRjaXhlSVk1YXdtUCtoZVRvU2JFRUdMOWEyaU1PN0djUUVLWTZOQ1Nn?=
 =?utf-8?B?cWdEaWpGQVYrcXRjQ3ZxN0kxeXRSekEzSzBYTnhuL1I1Q01kd2s0ZjFqZ0VF?=
 =?utf-8?B?L01zMlpKTUFKM1JMVHd4akFhMlErNlVDMDR2WXZvT1p3bG1VMU9OWEpveDc2?=
 =?utf-8?B?dG8wa0U5TlU4U3RNSkFDMUFRREdSQ29tbGt6cXVXSEY0QlZYVDJqNEQ1RXU2?=
 =?utf-8?B?YWRBbHBiRGpLS0NyTjFxZGkxeEtuajBlRkhtaFlNS2IxSXJ6RmFuTWJ0NVR4?=
 =?utf-8?B?d1V4ME5VQ2FEK1FaUmw2NXFhM1RscTEvU2h4d2ZDSVhvVkcvVFdjVGIyMi9T?=
 =?utf-8?B?ZXgyLzVQdzB1T05udkRTS1k1VTZLODVnWEZBbUxBUFBRVC9HRzRxTnNaSjZo?=
 =?utf-8?B?SW9McW5FWEtTRHNSSU1lNXpQRlB6ay82dkVlcDU0WSt3VXR2V2RldmlBT0I5?=
 =?utf-8?B?aW5ZViswU05ML2xXWXYzc3NoRHgwanpXRUFrNFZHQ09PZElaNEFjOVhzOTd1?=
 =?utf-8?B?L2lYM2RMZ2NsekNqbWp1V1hrSWRIVTV0TzcvZENOaGFYN25sZXYvVFB2K1pi?=
 =?utf-8?B?S1JtdFJMM0MrcmFHNmNNczlFemtpUkVQWWxON0pjT0tkcVlRWStBZFdQdjV3?=
 =?utf-8?Q?xc9Vg0oPI778/eLVjRIFZXtC9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dccb94-5205-4b43-f768-08db98de4999
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:41:08.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfVOSxrTxMaITaAoX/bwuq0fHdBkIqSNMngCY9lv01/9UIRegzjgwjUJxd/Yig26Sk98JImYAfb9CIDvNhe8rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8642

On 09.08.2023 15:34, Luca Fancellu wrote:
>> On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>
>> The function 'ioreq_server_max_frames' can be defined static,
>> as its only uses are within the same file. This in turn avoids
>> violating Rule 8.4 because no declaration is present.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Makes sense,
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Maybe it’s also better adding this:
> Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics”)
> 
> If the maintainers agree

I for one agree; in fact I did ask for Fixes: tags throughout this series,
but in the context of another patch. As said there I also think titles and
descriptions want writing differently here.

Jan

