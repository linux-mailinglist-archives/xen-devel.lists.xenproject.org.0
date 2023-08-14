Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A937877B27E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583244.913340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS2l-0003Hd-DP; Mon, 14 Aug 2023 07:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583244.913340; Mon, 14 Aug 2023 07:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVS2l-0003Fa-9s; Mon, 14 Aug 2023 07:31:15 +0000
Received: by outflank-mailman (input) for mailman id 583244;
 Mon, 14 Aug 2023 07:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVS2k-0003FU-5Q
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:31:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a233b3e-3a74-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:31:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7721.eurprd04.prod.outlook.com (2603:10a6:10:1f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:31:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:31:08 +0000
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
X-Inumbo-ID: 8a233b3e-3a74-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6qujWPfP5rt5rkNKsTyoP088zQgvszSimeA2FbFkhNE33wmzk7ov8/SID1z7ThyNotgfwx+PgHWyeaNRd9ax2RLN3OO523wQdmn2xL+cm91bBImPwLX4LXyBkg78DmZ9Lb3N9MpvhinTrVHIqUYh2ykJUYFuuPSsG8Z4Q9xU7+1GgOJkBrlaH+k6ESwoc8/VFRxUgddtle1n3I1DX/znSo2CpBomMLNcB9Q6TEVn48GlNjubnz2ify/JIJVhdgX8CJPabh7kff8li7O4Uko36mVa2TenmCl3gVzvAtwWmNoloapnLjlpxoiJaKq8o/92zRojhHfUC3J4Ii50m6o+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctGjyzypQwlG7z4iGwD5ysbIzEATCF1OUOhumqn+pDM=;
 b=GCCvYdzpiyJVCu/5DrV62Qw8aUIbGxHtN7yHVzRyYnlhZKZwE5F8ewwEzoG637QVi6DeX8gEipIHt0aT0/TAUQq3XGpcvg25Uye6d/lWOoI9uv44Tye1UO9ZMxL+ttZj0gyEtQrJt9ItT1u5KOqMqf/HS0o6Pyq9k/hSblNTEQC3JQFKKfvH6cvDLY+798+OtEdli1HVofGC9rkAsWsLiMHVowBbSqareGDGgVOq7bwittlWWuhdehBWTy5zdHuAax9QWgRT+Lu7vHGzp7q+Km/P8q3xfOHvE3KopP94ltD2nsLb4OfGUq78pmWyP6al8vYaKnrtOxdEKWk5QodpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctGjyzypQwlG7z4iGwD5ysbIzEATCF1OUOhumqn+pDM=;
 b=zDJn5cPB/tmE2XsqHsPZptmYr0t0up+xd09DaUrHOzaD/oUHIEWSAQole9C9xpnMefxO3XR1/6scCRy3qtqpqmAd52Btsw4YSmfbUPGpUf1tTIB6xXn91/iXmcB4lbmorRUo7HkbS7zFoBe4hiaco2p0BmJsV1t0vFpvF5RudzTfjozlwoUxmcrWhFb8RDy8WRVqmz4c/z1YE9p/iQJI92wF8vMYr0KmsRnVmDOkRvODSGoC/3V7anKXDDHfGTDvKJSzwhy5VhTBhRdguaLpkmNrr3gTnYlDfLCvh3N+S1M3YFSD+T/VKQ5zgRJUptG5FkEm9R/1qhxZt8552CTlvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf476fbf-ad91-341d-5194-53be5f71ece5@suse.com>
Date: Mon, 14 Aug 2023 09:31:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <5500643d99b315aa4344e5e3a833e6efa9a0413f.1691737296.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5500643d99b315aa4344e5e3a833e6efa9a0413f.1691737296.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e48869d-ebef-402c-7865-08db9c986d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G1GYLoHQ3f9ZLFzSjMFpTF4ojf8JPxEd/Ye4yjZxaTvJwLvlGkKJLzU5IzT8tDivqZEtkhRcsjbI1oXdtBDAsETSoHXnM4KRGR9FpadWmRClWgHzRHNanoObPHzYWdfPU0aSDFGrmSYuEnZSjIS2UAo+uX1Ok+DjRmYH3UDv8NvVXE8s5yJ84fEMybOAfW1sM/CrFgwzg4bUhdr7dlOZCqspoUiDlreYTQRtLJjOmLsQ6Z6nMbvFy2ATWizWLUbvy/3JQuZHN6s7wQwCcZDGVlK810lEMwZ00EXupTaWZcM/Tiv5CZFtvwk/mwo+Ph0zl2bDux9O3eFZlZC1SybcnSmri5idHMYLI+9pFKR567hUxggF8fA4qGNFUS/ocmJUMJZ+Tzoo+2gfWne0v3SQaCqUM3QCizM1a9NnX/Cu45pZ61YmXpu4GNoTR+tizvEdf3rVonjj/OTp0mVt+P/KNQ0wZ1a6LjNgu/MF227YRv5vXFvKaJWVy3+AKwHGUYxI58kArCz3n6vGsdO5nxMnIGxw6+gtAT+Ny5EEeGOVevzmUE+B71htoXcMJivZAPJ8gcfFEaXZc2oZ/bQXgyjSUwr85RilWRou1czgRcbQyMooxYYfFDHq6hNTiF61qwUB0slbqJGzbwVjo9l/YpQyxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(186006)(1800799006)(451199021)(53546011)(26005)(6506007)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(8676002)(6512007)(31686004)(2616005)(6666004)(6486002)(478600001)(38100700002)(110136005)(54906003)(31696002)(36756003)(4744005)(86362001)(4326008)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnJva3QxZzdheUZzeEpDZGc0N1A0ejNBNWJPRnFGb2lrOGk3cHgyMTY4QnZR?=
 =?utf-8?B?eHVwQ0JBSlRQMVZ0K2tQeSswR3BDWEQ3RjlNb0p0T3N5TTdMbXJaVjF6aWtW?=
 =?utf-8?B?YXl0VzJrU0JQRUFEOTZVdTVPRVZIeU5LUCtkcGFDWnl3QVVEbmluc2NUTFRm?=
 =?utf-8?B?cUZYS3JkbTM3Q0pRWW5tSEhOWEo2azUwcW5WdDlld2tkVitIeW1qOU9yVzBP?=
 =?utf-8?B?dmhSV0FxZ3JjcndvLzBTWlZwU2l0UFlmZUsxUDFEbW1KY2pzMjQ2TE10aEZI?=
 =?utf-8?B?QXJrR2xnWjdjSWUyaGxZdlZKdXdVdk45TEF6MHFCaUJud2VGazlkQW8vQ0d6?=
 =?utf-8?B?aE44V05zNVRSV1g4cE93a2F5VHBHQ3VycVVocnEzVGNaZ1l3TGo5SWFnVnhK?=
 =?utf-8?B?d25zSE5WRW90eG54ZEtCMVlDTmsyMmFEQjZmdTYxbG9VQ0lhQnpaUUo3Y0lw?=
 =?utf-8?B?emhYQ1VoY2pTUWFUOUFlUlY0RkxzUGdacEJrbjJwTGxqNzU5TlhSeUhLVmMw?=
 =?utf-8?B?bzB2YmZldXJFMEpnL0plZTZzaWhUbDF5NEJZYktMWk1YVW15UlF6NVZBdUlr?=
 =?utf-8?B?SDJ2SkliaEJUQXU3SmtMSGc4TklqL01zMk9KVXlzWTBxOHNnNTRBVVY0T3Zw?=
 =?utf-8?B?WkIxd3gxZ09idmdoOVRsQmFGM0xXTnFBZE1oVWJiMGt1NXhlMFVTWXRrK0Jh?=
 =?utf-8?B?elJ5MjBmakhuSFl5TGtMdmJ1RWJBUW1reDJQbndOOGtONTRBc1kvcU45K0Qz?=
 =?utf-8?B?bTVXYTg0cC9xVmgrQS9ZQVp3REpZcmVyMHI5aW5IMC9zQzBOc29uRHlIalMy?=
 =?utf-8?B?RXVSNm95bXd0NisrQWhOdk5GVGcvMGRvdTFyTFJoR2xnUXRBNWViVnF2NGNx?=
 =?utf-8?B?aW9UNkE5dGloUlk3TGxIMmNqUFZubTdhVUFiVkNhb0ZuaFp1UFJQK25ib2ZF?=
 =?utf-8?B?SWVxcmt3NEtyS1AxenExdU9hNi9weVZrVVF2QmZZZHJjbVFQL3RQdWlpQ3B4?=
 =?utf-8?B?UkFNQ0JlQW5BTG5uZmFBcDVNb3I1aWp5bStKUDVKTDdlQkdQeXlkZnZxQjRK?=
 =?utf-8?B?aVNNdGRENHA4L3NaelBkRWlWL2VJd2g4RjFFV3dvd2NRYnlrMjNXZG5jYnFJ?=
 =?utf-8?B?RG13cDBSc2M4S1pTWnJrbmpvQS9kNTFiRlh5dlUzZXhIK3lsYUVlZUxzMDQ3?=
 =?utf-8?B?QjdDTDRTby9pZTI0aGhVM2RRREJ2andJd0I3ZVBlY0haY2o2KzRwYXM5MW81?=
 =?utf-8?B?cXMrK01pNzZ3aUVXVGFxVFJtcG9DcmFXVnE2U1ovY3JDVCtWakhuSldXajRw?=
 =?utf-8?B?eWlxc0xzWFNnVVNzRUVwdEY0T2FGbGVucGhZMVJhSjBicENUdnBGSzdtSlBO?=
 =?utf-8?B?YTRYcXUwUU1iRml3Q21ZWWpldzBrR3hmVjJHNHEvZWlXSmJSb3hodkM1dEpo?=
 =?utf-8?B?VXlhdW80NnphdGt6YkFXSHliVnlJN1VKNWxIQ2xrWmhZS0N2Q3hXem1Pa3Zu?=
 =?utf-8?B?TTg4UDVMMmF5STdNcUtrRllWQStqZVdnQXVLVnVaSWlybTZLVmhLY3VFclpM?=
 =?utf-8?B?NmNCQWh3TUI5UmdlT0d5Ung3Zk1Tb2hEY3luODBpNXVoR0tiTUExMVZJdzlB?=
 =?utf-8?B?ZmxDblg4aG1JTG9BaFMwSGYwK2NGVm1jQTNKdEF3VGV4UUdGSEJ3T29nMzF6?=
 =?utf-8?B?THJ5aFR2cHZaUzlFKzhXaTl1YTFrQzFpSndwRlNLV2tWdHJudDFTcm9lek85?=
 =?utf-8?B?WWtoOWlOWlVkcHZ5UzhOU3pDK1ZUVi9lUHFZUkhaVldpWEZKK3dWSCtBeFQv?=
 =?utf-8?B?TnF5Nm5kL21DN1hWWEZoVjljZUtPSlVJSUE0VkdLNUZTa2puNWxWeG50Q3ZV?=
 =?utf-8?B?SGoyaVhMb0p6dGVBeFNBak55MWRHOVFHM2xCTUJ5YnJvN1lYbnNMSHRKc2Vv?=
 =?utf-8?B?Y0FqMVYrR0FYLzZGOXRLL1pOcEllR05aUWFqQnF3V3EzTDNyek8yeVhYZ1RI?=
 =?utf-8?B?ZjVyUHpDTkdUOXNreUhNNjc2TWpSRXcvMW8xUDZ1L2V0K2JTZ21tVVF4U2JW?=
 =?utf-8?B?T29IMC9YNFppS0swQ2ZhU2hnTmlPNEIxOVZGRWtJZmpJbkdsQnhqNW1sUEFJ?=
 =?utf-8?Q?58qEXOkAYtQ7mVZGPRFCPP4t0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e48869d-ebef-402c-7865-08db9c986d2c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:31:08.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NV3qGWLO0EXzbkt1zYpMzyZLlqJn345S1AAbKSSpxLd8MB32cWKBAgxSjGOoy3yZPVH2qqdXScKMkO02UULPEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7721

On 11.08.2023 09:06, Federico Serafini wrote:
> @@ -172,7 +177,7 @@ console_io(unsigned int cmd, unsigned int count, char *buffer)
>  vm_assist(unsigned int cmd, unsigned int type)
>  event_channel_op(int cmd, void *arg)
>  mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
> -multicall(multicall_entry_t *call_list, unsigned int nr_calls)
> +multicall(multicall_entry_t *call_list, uint32_t nr_calls)

To be honest I'd say the change wants doing in the definition, to respect
what ./CODING_STYLE has to say in this regard.

Jan

