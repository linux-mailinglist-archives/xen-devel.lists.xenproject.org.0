Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA0F77B2D4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583299.913430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSFd-0000xb-LI; Mon, 14 Aug 2023 07:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583299.913430; Mon, 14 Aug 2023 07:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSFd-0000ve-IO; Mon, 14 Aug 2023 07:44:33 +0000
Received: by outflank-mailman (input) for mailman id 583299;
 Mon, 14 Aug 2023 07:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVSFc-0000vG-Ix
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:44:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67800dc6-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:44:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7503.eurprd04.prod.outlook.com (2603:10a6:102:f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:44:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:44:29 +0000
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
X-Inumbo-ID: 67800dc6-3a76-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP7a7PMmwPvTQEGM/4IUciC3KKw32E0jmQlLybJM7juoI+RklEnqneBICtAXH+b0CnvlKKbPKMxk1JV+/oZZsmH7n4kbbhYlgO8smgKszoy2QXISWt1i2L2ny9UGE4f5LPQ2uPY6+c8XCgNBIMnUMJXdptREHG9FlPbzdu0RPRB+G3vHb1fkHwGB1+FJ6237l2HcmIRSFgYFWtV6UooKGL27uXyvCEt4svrz3gUyGugfs+oh3RDpGcO7tBuXOgf80JpZ8RKMj5WRfVE5HGQINNGt+qaETDSdjvf+dhZrqoSu02/4iuuK9vl+RxGF46CHA4fTKNyobp6EpM4JXwTpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF3yDXWHWAGHT+GvF2W+LhwfIbkiLWgnI7p4uqY9icM=;
 b=ISecvMVQnDVa1idd+CuCuHdmbEqreDU5mpNRTtrt3+HZsux45s7as65BhI5IaIXF3hEH2ri0SltIgufZ6+7isvCIaITXskc7yq+WnJIOe0ce91gGrekAoa6aklsI9fwi/9e5Z2HTnVP5BYEl8GcD/rl+2Lbw8TIYS55ZiJrt8o/DoYQfqWK1p/ATZ7JmauWUBgXMUBud8AU+NolhPXdcEPec27vOkh5npGpwDsjHVPOwhZTLNt6aaNQLg/Xfi2DbmYM/wD4vFgib2Q1H6gQxGmskeA+J9NowQjVB7XlW8e9Sj0WKkeWtfwY4cyAeLGdBKDM8/P+p8I1CZtxooHP1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF3yDXWHWAGHT+GvF2W+LhwfIbkiLWgnI7p4uqY9icM=;
 b=vCBCqSchJbePbNGqEUgQ5abQvBE8zpkaCMW1FkbHQM0rupTyfi2LW8f88nJP0eqRfRoD/EPK1T+sykjlPNwkJbpEMCRP88tT960WZBIzDRrRexeyNrhsO4v0+uGCCxa6x+8/luh5nlgdEcaAlofb0eMprpa+rHuKme8XBSLJF+2uasEOZcb8wwTnFd6eMPFxehTKhmKNOtlSY9l8J64bq3+racuX4vT/wXA8Ssfj8GMom1DsY3DNXdH6dXYdOEdaF6Lng1J3PqyYQBS6xubDKYohokKPu7MM23QEUe4w25lv/vipd2Qkrsx+iXIK7kv8bP47W1Y/SraEfs/b23QGmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fde117b3-f9e2-f98d-4301-04683d99635e@suse.com>
Date: Mon, 14 Aug 2023 09:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 5/6] vpic/msix: make 'get_slot' static
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <6ff95436f704c852e6397a584eef65f9d1713999.1691676251.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ff95436f704c852e6397a584eef65f9d1713999.1691676251.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 338b6cad-f88c-43d9-ff68-08db9c9a4ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	02apZmc0orwk1BVq9ZcAII4ULIZUDRE4JiGvVUzv5AP8zf5h2HlUbJYwgEw81sv3EnmVJQqHxUQTUQNXrxxcedleczJUk4TEsrLRKXQl4NdXxCLfYwCYy2cox9q/nOH6CCn9SlxPK9GIs1QrdA4Wj1mf/4hkDnSPUW4cflS4OJd0k09LhPsj5bcnyrUNu1B1DJARwFU8aWJm3HISJtoELGinmfH+6FscgJtEnKOI6nwZDgrc3X6Krzc6DONK4gLpih5kBvkXGczUWWwjz9oI5/B24B1Z5ICG/o5NzqRuUWN0fja/hQRtAHVRNFtNP3Pp3SOod/g6G46PJjOSzaFh1/AR8ncR5yRSYxGMg/rk6rKeJROqXK9dp+R0Y0xdnEg+pLYb9738PX3fVTuE1IC1r72xE0cZHh5kGjNaoINZlVv9KWdN2EdbacIroM2EqvzC9iaX0PsgDAEqV9LBikHqERl7zikeWaji6Ng30fkz+tmR8B/rKiXlGifvI4FaQb9iQrmtvT1vQ7gCMe1OiPjCPXDNy1w0V1A4KL9f24AHuCEO8L+XdQZ4vLBH/xrIgK8Y2XNnQyMeNef7P6GGNuATrR/LnxDW746dQgHeGZ4VE+QgN/99p+cDh2tZ8cCc82KWvcnVC1F57v0wP3Q9PXVAqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(186006)(1800799006)(31686004)(6666004)(6486002)(6506007)(478600001)(83380400001)(36756003)(86362001)(31696002)(2906002)(6512007)(26005)(66946007)(4744005)(2616005)(53546011)(38100700002)(316002)(8676002)(66476007)(6916009)(66556008)(4326008)(5660300002)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzEwbHV1Q1IrbzlRazBQUTh0V0xrR2ZuQUZwZVIyajk4T2hwSUpFVE9CZzVY?=
 =?utf-8?B?SUlUaDljU3hWR3ZqL1I0RlBGYlg0NUI1TG5RbmJtYzhZVm12eXRla01uNFRw?=
 =?utf-8?B?eTcrTEJiWXdPc3ZkYXNxTk1aS1d1MlNVU2tXcTNDcGkxWTJtUWRVdUNycXhO?=
 =?utf-8?B?cXZFbWhabWh5dkV3Z1dIL1R1bjA4OWZ0c3Q1SnAxWXlWdHFyYVFHUHM3dlJx?=
 =?utf-8?B?MjExQmNDT3BEU2tmemhYNmFzK2cwK1dHYkxoTm1sT2swN3luZDRLOUFVamww?=
 =?utf-8?B?RkFTZjFnWm5LNGdSblU4Smw0RVIrSjMwdEZWbXlWTDRlekxUSzFhTzBPd01k?=
 =?utf-8?B?VjZxUzhFVlo1TUM0bnpReVR4RnFnY0xZNStOdEpPUUNmWjAzbGMzZUVlTitE?=
 =?utf-8?B?OE1tSnhjS2hrczNxVHZmeVhLSDdCNXZIWmFiMWRxZk02aUQzL25JVkU3QkEx?=
 =?utf-8?B?aThNcVplUmZ5cnE0M2JYV3FyZHJCa2hOUjFJNW9XMEFPU2NTNTUzM1VieFZv?=
 =?utf-8?B?UGxYL1ErNkxSdzg3aVNKQU93T3dhbVJhY2orcE1YN1V1NUZ3ZmwwZG04RzUz?=
 =?utf-8?B?TUpwNVVDZkZMbmsxRjF0QjlNTDd6OEQrcHZKL2VCRkhaZmdldW9udVBGNWdm?=
 =?utf-8?B?RzZNeUNyZzJJdlFtc2FCQ3BZYk52Y2NPZVJ6M2lOR3hWM296OVkvbklBNEox?=
 =?utf-8?B?V3RvSk54ZWxaSHBybUR1aG50K1lFLzBSckhMOUFtaEVOc20zNThySEhrTFlI?=
 =?utf-8?B?UzBGYlhybWV2Y3FKbnpnakFlZ0NKU1pFUWs0QUszeU5IeUJpY3YvNjhzQmFM?=
 =?utf-8?B?OGM0UlNkalNPWS9uQVh1OGN3M0lsRHhoZWpOZm5ObjVxWWs2VENpUTlvbzl2?=
 =?utf-8?B?clJkaWdidGg2SkNaeWtJcE5GUDVDUGxjL1E5Wi82K1Z6eHNIeURQQ1BWbDl4?=
 =?utf-8?B?cGc1eWxtTXEydmkwTjF0QitoU2F2QkVqYkV3dWZvQ1RwKzhZYXRTbWF3VTEw?=
 =?utf-8?B?NGF0cjZnZHA0K0hOZzhtQzF3cWM0WnJmdm8rZFNBVHlxaVI2UHA5aThrZXA2?=
 =?utf-8?B?MVJTdCtIMW51dHlPTzRuYWQydnBWYmlQNklYQjBkMlpJM3B6eGg0WlRkcW03?=
 =?utf-8?B?QVNGa3YyM09jNXBlQkZnRDY5VmFqZ0tSeGRiSzVsREl3aytjUXZ0ekFqUEd3?=
 =?utf-8?B?VlhvMmFzbnE3YzRlRU9MZzU4K09YTDhONjRFU3MzSmlZQ0ZlaEp3MHhoZDIr?=
 =?utf-8?B?blpaTjJiMTJoU2kya0pzSC93Q2dBd1gyWFBIRXRzTjRpeHQreHcvb09mMjJz?=
 =?utf-8?B?MTJMdWN4ZFlWdkt6a3FPanI4SWFwRHplTkNzZVZWaWNiSktEVThFSHpGMlZ0?=
 =?utf-8?B?NTlyeHFXUjR3STlGUE1YZXYzZzJFbVVGTUx1MFVlMkdHV3VXdFFPMjdTVDRm?=
 =?utf-8?B?VGRJd1pEZEdMSHR5bTdSNE9ZLzBTbElNUThPc1Z4Y2tMTFNTMFRFS2kzV1Rk?=
 =?utf-8?B?WExwbmptR25aeFRKRmM2cmlKRmtOQ2JscFFlMjQ2U2ZheHQrWEJOOVFOOWRy?=
 =?utf-8?B?bERVOGk5NExweC9YTmgrWHkzcFNUR01WckVzZjBoK2VhSW8wRzRYVmpQeWM4?=
 =?utf-8?B?bTI4dnFpS1k1RURybks2RE9jYXYxMlpJcDJOakkvVlNZRnQwaTV1cTlBYXBV?=
 =?utf-8?B?YysrVXMrSHd1R2JIUGVaOWdWc3lxU2dhbXJiQVZlQzZqVGVJNzhvZDdNYWtj?=
 =?utf-8?B?YnRSYVI4NVJCei9LMndYRjY5YlBxMUxTMnVsODJUUEoyY2lMSzJ4Yy9sOEtY?=
 =?utf-8?B?ZG9VZzFpZnhCN2JBbGlvSGJybDBmZGROenFjVFhkdmZPcFFWT0dVSDhxVHEz?=
 =?utf-8?B?RXZTYVhvZi8xbmxUalpScG4wK2F0RkdnZDYxV0x4MTMvUTdjd1B6N3lRd2Za?=
 =?utf-8?B?dGh2Q1haVU5NL2RZRm80OTd2WGplTzU0czZTaDBPRktMRzN6NHZrdEp6SkFy?=
 =?utf-8?B?QWxBVjJmM0YzYzlNU1hzZzNjb0pVeXo2NHpwaXVvYmVvK2tBNGM2S0JJVnRM?=
 =?utf-8?B?Q1lrVDEvazZXMmdPSzg1S29ZTjZvYkdVb3JHN1FiQ0drQ3VuV2JKL21ZTTUv?=
 =?utf-8?Q?FM5AjPIkcipypc3yyAXashaWx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338b6cad-f88c-43d9-ff68-08db9c9a4ab4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:44:29.6320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHTH2dkgzmm4XnkqOkq00mG5Aujl+aV8S7QeH/efV8eg6ZBY3kz9UjjrD1TkVoFuA+ophKfjguroWuXW1ckl+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7503

On 11.08.2023 09:19, Nicola Vetrini wrote:
> The function can become static since it's used only within this file.
> This also resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
> of a declaration before the function definition.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: b177892d2d0e ("vpci/msix: handle accesses adjacent to the MSI-X table")

Nit (typo): In the title you mean "vpci/msix", just like this quoted
commit has it. This is important-ish because we also have "vpic"
elsewhere in the tree. (Can certainly be adjusted while committing.)

Jan

