Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E6175ECA4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 09:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568438.887736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqA1-0007rw-3T; Mon, 24 Jul 2023 07:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568438.887736; Mon, 24 Jul 2023 07:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqA1-0007op-0V; Mon, 24 Jul 2023 07:39:17 +0000
Received: by outflank-mailman (input) for mailman id 568438;
 Mon, 24 Jul 2023 07:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNq9y-0007oj-KD
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 07:39:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eb2bc2c-29f5-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 09:39:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8127.eurprd04.prod.outlook.com (2603:10a6:102:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 07:38:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 07:38:43 +0000
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
X-Inumbo-ID: 2eb2bc2c-29f5-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS1mpoLr3PUVmGwf/hCxdMpEJZ5wFikkVTvzx4g7lEK9wfhdWQfx0GoMBgz7hyXs14d48yj3vnFISP910VNjI9eJWAvVGVt+MlZ0FwLuI4wlafHsP+JOCamO/Lo7YdwSaTunU5MbQstvLxFGpEJv6JWnAW+Xo8gsZOOejDWdDJ7a4utKm8kKPOQzxYzg6mnPlnZfBt3PfMHJo5eicVBmxOOtNZi0Tk6mkyVTnyWUTToFKEPkapMzFf0fC1R9BswUIzdkM95pDpMBDvza8+I9ztoTkloIq8UqsdwHB4Q8LoETXfV2o0EGHqe4IndIIsohavUdpcIAU0O+u3MAE5HRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTIIpgwVvHHIZYt3iPjkDifdMjpGToXo7N7VZ91BylM=;
 b=oVtz7GA8qkwgbPRQ0YTJBeXGRuK2kR9Z8ACl3s8Lreawn4/s+bFeldjaCOtZZFWIMU4NerfKgrNjNnZignfzVi6Ov6QHhCkR50659tqZNNtxDsWYFknRZ7FZfy+KRaoFh9caZHvstKBvs0I9om20VUEsrJdh3R1IMQuvkk/Ntj14dkzs7GLcSyCKCjlHI9y1vAiL5R3XWTZX0BPcy4JCNv7x1uytwSxNZJ3JROHh+Pf2YFJCm6g9DFDfnLcR0mdmHzf53SOySuqqC1uslgFFRMIyBYnyjzyqGdrgG/VHWYSvieSTaKDS4q6y84sRmpuqVNNXlFcHfXONnSnXmflnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTIIpgwVvHHIZYt3iPjkDifdMjpGToXo7N7VZ91BylM=;
 b=TgfxS8bnGU/VLZH9uAjCrKkzEt34i0rQtIwooCWqXllSLVTWgh212LmdzM9DA/dCfCqPnQQIs2sd0kxlxl+WVjp3BMIGfiCGDF8xLnK3NYZkCHmw0tHtwG6wpL7yxXRYozS5KvO3Wdb6YveeNNRne7OnG6eb4h0NUnvtQNvIREppVmLizsigA3g8OYmFQi3oNivCb0mr9kkyyYlxmqpzOME4kRTtF1X1nR4H3pTqdW9w39aMa9Y1diiI4QTNpY1Ewg+q8rvJWyErKWsvUyYcV6X0JBsrIIma3xvYg/nozdomvMlM5eZn51EWE8wkVSRFXIYOTLwr0Gqw8fWs9D7S5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <733ddfc7-3530-3d73-a1de-9b29132a8a72@suse.com>
Date: Mon, 24 Jul 2023 09:38:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1689710519.git.sanastasio@raptorengineering.com>
 <7c416ff843ea359bb24b8c954cc079fe1bbaf75f.1689710519.git.sanastasio@raptorengineering.com>
 <6d3b7cd6-7d6a-8d28-f1e7-7e939e393445@suse.com>
 <a7f89b3b-bcd1-6844-b836-40b73a9fa3b0@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7f89b3b-bcd1-6844-b836-40b73a9fa3b0@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: cf021001-18f4-400f-660c-08db8c19017a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aoG1x23GVRFvtEiOwFM/+5f0zX0BCPl1cVzy7zMo6ubAkVqQorCAr+Wfkpqo404J8SD8nnUGa1T9bdEporwD10CZvfR543VYRnzCJnCiIjDk/lRTVDNEUPYF3N8oPrBhVzLH6bAvAAJP7AND55VrHoMdcB3UkrgKaBgLPlLl+BQqMGNajFcSjByY5nLYVVnzbeArR3S1v2eVeMNm6GFDtRmaJc2VPwSM1r+7mlDiUDCF552K/zrCY1+KI6zz86A/09zAR0GbgbvXXRTTdiz1tZNWaqKIev3zu8LSuQMfzVihGOYRjA3zPlyGjaPkzdOhyBpfv7LEiAXOi26HesVWBQmL5OFVUX+OIwdg3FwOfLlcFvZbjHuKE5x67p9v8vdqHNQ8T2MpA99MrDf2SCcPgNRTdLUV46WD0btrJEbBmx44OQ23QiC8GbtE3Au0MeerhUZF5NtxG8BNID0Sdduh5q8JOTOClIlCf5ysBd2FqhWkhlFZavwZANTWvXnoSlTL1ZfW40YV1PPppm5mYRSSbxb9YvLhk1zgoOEjFlYXvNo3ebuHWRHaEuwPWvAgljXWAdZ2CGuicsdZHeI70/dda//i7QXRApS1Bo6gdIbTFNHPzfGBLGzGKBJmFHcpBejAyTlj2jfPMuBwOf7ijXWeTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(31686004)(86362001)(31696002)(38100700002)(6916009)(66476007)(66556008)(478600001)(54906003)(66946007)(41300700001)(316002)(8936002)(5660300002)(8676002)(6486002)(6512007)(2906002)(26005)(6506007)(186003)(4326008)(83380400001)(36756003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MThIcDl3dHA0Mm9zMUp3TjZNNnllTnRXUkJCc2t0cUJOUzFpTVZCNHRENmdm?=
 =?utf-8?B?UUZ4eGRRb0d0bE1LTklhTFRoU296QnNad3RFRDkvUCsyY0J1RjZjOGZPRUU1?=
 =?utf-8?B?T3EzdTU5cDhEaVhIS1U1cTBMUlQ5dXJ1WmFQRnNta3dKVU5HbXExNDUzNTNN?=
 =?utf-8?B?Znd6VnBRSElxVDA4KzNsU3FveUt6VktrdXJFRkc0MzIyZk5wWWs4L292RmlW?=
 =?utf-8?B?TTJ3cm9zV1VIM05DelN4WTdkWXk1aWRPL0VYYXFCNXZSdzBISjFmQUMralUr?=
 =?utf-8?B?OGQ0TnVVdC9IWll4ZDhubzBqOWlha3FnN1NUWDI4VXBpbXlWS0U5OVI4aG15?=
 =?utf-8?B?VjFrSEh1ZUZnVUlvSElhVUVqOGhPU2plWnBQQUpwNll5SzF3LzFNQ0pGUXlT?=
 =?utf-8?B?RmNkdzZkNWJud3UvZlJHSGlhblBoZFFXdkRBMlFDL2JrZmM4WTVYdGNKMjRq?=
 =?utf-8?B?dVIzQU5UUkovQmNiVkJzeTFtKzU4azhvaHhaaGpycmJlSmZhdThuWjBXODJU?=
 =?utf-8?B?VE9wVC84NCtJMmE0SmpNb1pmeUdRKzZ3OWI3SzQ0L2VudzYrNHJnaE1yRWRU?=
 =?utf-8?B?ekRZTkEvS0NmaWxNQnduZ1NUQ2ZzODBQSW5QMTJkS2FjaEE3cXRYS3Z0NFVl?=
 =?utf-8?B?NG13R3dxeUFRbG93Z2ZRYkZzSTUzOVRjbmk0M2cxWDlSaGNzRUVxZUZnWDRp?=
 =?utf-8?B?MlR1eDZtUWtFSFlWZ0k0NDVBWC9LMG52bGtKQjFyNjhQWFhmamtVek9KdSth?=
 =?utf-8?B?VHZMZ1AwWmY4M0R0dE5DRWhTQjdPV0RaTVFtRlQyb3k4WkxDeHhyck83TmZO?=
 =?utf-8?B?dWVzN2hqTzRGMFBiMlhBZFZrK1RQWkNNbUxYelNPbU9pWTJabytSS3pINEcy?=
 =?utf-8?B?V05zV1hLaThRalZOb2dFYmgrT2xhSXRHdDV2cmlOTlB1UkpVbUhXZWo0WGc5?=
 =?utf-8?B?a2J2dmRRbW9ZYmYvdnNEL0M2djU5RUFqSXBnYmd6Q3l5ZWhIUXcwSHVNTGNK?=
 =?utf-8?B?VnN0alcrdFBobkFWMzVkWHhDMnJVWlZZcndVa0VOUGdtRlg1ZGc1c2lmbnp4?=
 =?utf-8?B?dzlXdmZJbktZQmNpWDF0SHAvUnBVbVUvK0JQUGx4R2VrUngrRjR4OVlEQStV?=
 =?utf-8?B?UkJyNmc0ajhpMXZpVi82WU15bFJGaGU0am5HVmt6WGxTdmNzY3FJRzI5M0lh?=
 =?utf-8?B?c2EwOHNwTk9UektDaEpoR0Y3M2o5Tk9aeFExbGlHYTFidmhxeCsyUHdnTkFh?=
 =?utf-8?B?NFhKaGVIM2JyTUhQd3Y1VUV5UlRTekVCUThGN0dib3NEcW5GOCt6cncwd3I0?=
 =?utf-8?B?c3VGSnltMW5oMUpxckRmQ1RUZ3FOR1VqSks3MmFvZjREQThmZWJLMlJZY295?=
 =?utf-8?B?ZFQ3dUR5RTdSL0pvTW56YmtGZGxFekVCQzFKdExxOU1zM3BCNWhPTEt3SEdU?=
 =?utf-8?B?ekFUNlR1Nm84OUNHOGpXZC9VUkwrelkxWlZuYVdCOUZDRjRrNy90a2FBTHB2?=
 =?utf-8?B?OEYyb2FUSTFqZjIxNnV6NVE4Zjd3VEFQYUJ6d1dxdUdIYUxCbUEvYXdkRFB3?=
 =?utf-8?B?cXl3T3ZKaWw0VURPdWlSZ1hLNE9vODI2VU9tSTBsbkJPdGNwZFNncGg0Vit2?=
 =?utf-8?B?TmQxL2F6RWJHblNXVmF1cjFyZ2dqL3pGUWtMOXFlWFJkWHY4c1lBYjFNR3VB?=
 =?utf-8?B?cHcvRm1qSXhDQ2xXem5tWUxjdlkxOHJzRUJXcERlWlo3RkxXb0VkcngrakN3?=
 =?utf-8?B?aEdTUWRwOXhVQkhGOWRxYjVYUStJVVhXelMvWGhaUExMUXVMOTI5dVNnL3Ba?=
 =?utf-8?B?cXlmWGxOT2xDbFBzajYwNHRpbDJYVmlDRENINTNWVFo5QjVWaU12Y1JZQjE0?=
 =?utf-8?B?NTVqdEpGbDdRUld6YnhmNlhROVlJY1ZhWnY0UTRkM1BiajlSZ1hSSStmRUdy?=
 =?utf-8?B?VkU1b1pOMTNmTDBTTFI5eitVVjhEQ2ZwcVh2bytONWRKSUVqTGRhNkVOc1RN?=
 =?utf-8?B?RUdxOUVYMnVsVEpDbFkyRGordFprWDlvUVd6OWxyU0o3Sk5NRlo3K3l2QTA0?=
 =?utf-8?B?UHBDckRJa0xTU0Izd3JMNXBTTXNoUk1qQS9NcWhUVHVsR0doaE9ZUmdZTHdx?=
 =?utf-8?Q?m+FHYrnklo5DlEjq2duXI6/FP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf021001-18f4-400f-660c-08db8c19017a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 07:38:43.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83ECEcv9gUps74JLQroSmTucQ2Gk6xIg9vVgiPmm0LrsEqVHYpiK30j8uArQupwNrnwEGaE+mFjj66xeMcn5Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8127

On 21.07.2023 18:53, Shawn Anastasio wrote:
> On 7/19/23 9:05 AM, Jan Beulich wrote:
>> On 18.07.2023 22:20, Shawn Anastasio wrote:
>>> +void __init boot_of_init(unsigned long vec)
>>> +{
>>> +    int bof_chosen;
>>> +
>>> +    of_vec = vec;
>>> +
>>> +    /* Get a handle to the default console */
>>> +    bof_chosen = of_finddevice("/chosen");
>>> +    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
>>> +    of_out = be32_to_cpu(of_out);
>>
>> Can any of these fail, and hence lead to ...
> 
> These calls are allowed to fail, but their return value in those cases
> is well-defined (an invalid handle), so...
> 
>>
>>> +    early_printk_init(of_putchar);
>>
>> ... this better not getting invoked?
> 
> this being invoked is fine even in those cases. It will just result in
> the invalid handle being passed to of_write and the firmware will refuse
> to service the writes.

I assumed all this to be the case; the question was more towards "Wouldn't
it make sense to avoid installing the function pointer in such a case?"

Jan

