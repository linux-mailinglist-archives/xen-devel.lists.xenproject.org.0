Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89474568219
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 10:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361976.591796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90kZ-0000ty-29; Wed, 06 Jul 2022 08:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361976.591796; Wed, 06 Jul 2022 08:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90kY-0000qV-Va; Wed, 06 Jul 2022 08:51:10 +0000
Received: by outflank-mailman (input) for mailman id 361976;
 Wed, 06 Jul 2022 08:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o90kX-0000q1-0d
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 08:51:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6a92ba6-fd08-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 10:51:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5122.eurprd04.prod.outlook.com (2603:10a6:208:ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 08:51:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 08:51:05 +0000
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
X-Inumbo-ID: c6a92ba6-fd08-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKN2V9Fj1i0v+FdyUBYJjssb5+QtUNhSnQR2pg2iXoLhVPJKl1DO69hctwBQkvVsDcGuG82wbcsIGV4Y3464ogQ1s4+4W06Cf840kAMvj/DB0DBDjkDiqgCgtYGn7a4NvBbZbJh9CepBFH399ktpP6pI8oZ0jTDVg4R2SO0+qnqkqJrGTg18TLoOvhmfCN1A99Y9Cz77lF+RSJQmf7vJy6qGvSfeDnnwzBKX4jxGlQnoek5yop5Oci0Ppe077Y4Z386gQKrp9g7Qc1Komwe8KpQws9zo+oYgn23LaKE/m/KC/+6G4CH0ay8bAMTQHUgSjTK54YeTJrRj4Ihg8Pjs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBNIL9BNcEakpDmLE8uqtNtzwj2UVAA+huGQiA/BClU=;
 b=TJynHGrSYLb/ILdmtXMKGIwy/k/99taHQTBaMZ/DYFP4rvJqTLkX9ZTlCc7m1spQaKf/vKT86PYdYbRg0/jjNx2lrSV59HpLbYs0wYmv7+Vu+0vVnN0beayWTAuDzV4ysvIY5ixImyDYduuOqckiJXTY20w0OIELe4EvoEmaRTSoAlngtpXJwbjFHS713zEouT7LlErmZ1A3x/8JzZYKTjU/e9DG+w48dPFM4w8Hdn+XTeBf/l1GbmxK0FKPKrIGxr+1DiXzO/knkq7JgcWwgLvB7Ciau5JxzktABK2LKFa0basyFIMqL44bhXPCassg/iK7LTs8oGTsW8ROxCaGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBNIL9BNcEakpDmLE8uqtNtzwj2UVAA+huGQiA/BClU=;
 b=R9Co/LIgF5/D9+DSJqg0tYevCEgPhy3iUZgquMUTgtYvclu52UQ6MoR0Cf4f1LbnmkjL7IhFmVfV6DxYq8NQwcWrMndthjf/Cb4rDe3S4cKpCHJmoOJ8ehSF7OJfJux0LnYLCdR64ixeJ1fF8wManL88gWkyigx94TYapyEPGtnHCapX0XGQdq5kpiXNCgo/PVoAFNENJeRQYuc53JOW7H1/4MhcnwTENhs0IY/iIiLJBFPMCHfOXk7uxvI779fu9IZ5SZ+x4yj5trzaTn6badQODAmV+wqEZVWLIh78NP3KPOxjFOQPItd3MgBjASwdjZfhz7imtocX5VbXBj+OwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
Date: Wed, 6 Jul 2022 10:51:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f9c7b0-1203-4e71-86be-08da5f2ca9a8
X-MS-TrafficTypeDiagnostic: AM0PR04MB5122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	emNNibo718o5Ds8zV1o4WfsjBZb2rVR2bZr8JfM/gPn10odsnVByp0anYjE9BhrkYL/wabthwhTCY36jxBW4mHgmogtyO3oK0fkhuOxk41PA/gRyduacm2c+rRI+V5LGptiBmnm5pbzxA+jXmjgjL8cz8UmxC7xdqiQ1JhZk7ZzVsU00xzLgIizQrSBwgtnm6Emkm/3Mr3wqZftXCluCFu0ZUHzwzk7J4kH8IVujWJkxOHsgzpcGwAPHao21+lTlOZKKtq+epwRRq72bT3IwxCLe0yasLO/oCH/KvSBYmwsn3hvi8q95RnEaKVPokSvcDZeNLG7MgBHJ4jI7SH9SSsOgjHR2WmNQaXWQD4i37Crf6Ex2yF3KbswWrC+fmx7TCO4yP3SegDk2IWeFJMEjrmouIvpqIUBrHKLIEzqdVcM+TGv4NzFtV9ze8JLYXWOQcCanS+o+6s1q9XBgLuzXiUutCAc0/rA1jc8ZWsFf3xL6eSZ0dmaoEIWNcVQTcdTww8SzWbN65dssACu/MFx/4Wcqe90guFGsl5+Di4DnZtDUuGTlKRqBacHr9HoRWV1fAIKi27pXRPBNZNnl5PUnbLbjwjxnyuVFvtgDa2ou99j+aWXEK/glnbmNskdGwJGrYwq1LD3CdOs1OXaZ0ZFxd5d0Y1BS1s/l1jkEfiJeyZiPlcESl7jRTJcGLhkGyL11A7REbfTpjjExbV41YZeQDEOarpN3UBxfqsCrH0R0HNXP3hVsd5bbLE7TVuz9nfA4hZ1Vjp9NP6O+9f/tY/8RGV6QZ6PvicadxY0Ao1bqPvsXBJ1d9n6eAYcK2phVRwEhGaZ2IChz9yElm6nw1ukd1z7MUWssjOWnTrqiMf3z91U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39860400002)(376002)(136003)(396003)(5660300002)(8936002)(2906002)(4326008)(83380400001)(8676002)(36756003)(86362001)(38100700002)(31696002)(6486002)(478600001)(6916009)(54906003)(66556008)(186003)(2616005)(66946007)(316002)(26005)(41300700001)(6512007)(53546011)(66476007)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGgyTk1BTFBjTURGdGpZNktrYVBIWGxvb3VhWkxJdWo4aEFhRUl0K3RqSjA2?=
 =?utf-8?B?MTBSaURxbXJqUDRZWWpVaXNXNUV4eklObnFlYks0dVZ4L1FVWm5EanAxdWdq?=
 =?utf-8?B?UEVRSHVWN3F3V3c3UzhSU2craDZ5SWkwSzZ0bnFnVlRsMzdZY2pXK0RpRmRM?=
 =?utf-8?B?VWY3MnlpVWFwOWNQWXBWWmNWaDdCWVJZRFZjUUY2REdUOWkvQVhQWEtqODd2?=
 =?utf-8?B?QUJ1cU02VDErcFE4eW9BT3JLcE1laHlxb1VjN0h6TXRTbFc2UVAyM1RSVkZS?=
 =?utf-8?B?OFdxTnMxQ1ZzUGVvMmR1TnpJTVJWaWZiNXZ2aTkzR0pMUktiYmo5d1FaMkpX?=
 =?utf-8?B?Q3FUeCt3ckF3N295Z0xQOXE0U3NCKzRwZ3BESEhJcWE0TTUwQjJ3eHp1K0lo?=
 =?utf-8?B?Rmd4MVYzMHBBNFYyOVVMRGVwZ0tTOHJrZytRRTJNb3VxZSs4b1krTitneHlL?=
 =?utf-8?B?TEhTMTdqZ1pHTzNGK1JUUElYbDI3N1oybnF4Zy9tYkhQVEk5eVhjdmkxU3Bw?=
 =?utf-8?B?cjBtS1lBSVFrem5MMlBBbGtFcm5VbWcwL3UxU21LaGdETy9ZUWFkL2VNaGVp?=
 =?utf-8?B?U0R5bmFIQkM1b2FJQ2JqTkVwMWN1R2RDYzdsc3o4aGpQU3pXUU9qYkFVRi80?=
 =?utf-8?B?WHhuS1ViRUIzT1NVb0lTUFlqcVlxaHU5V2VqKzZNRU8veEowV2o2MGxSQzJW?=
 =?utf-8?B?UXRQOU1IQmh0Zk5XUGszWVh1SnZuYS8wM3FjOFg1NjFqWWZqUjdXK0JZd1k2?=
 =?utf-8?B?NEtJTU9IU000SkVYVkMwN2pvcGsyZmtlTytFcEVCNEVPWmRlSlg3SGJoVngr?=
 =?utf-8?B?ZHRFdTV4OUcxTktFdG1Oc0NuaFNsajJSVzNHRlV6eEdla1BtZjZMSlVOS1Bj?=
 =?utf-8?B?R29IT1BXL2RmNWYrdW1LMVR2QU93anNDbHNkZ1REVDk3THlsNkZDMkZNRnZT?=
 =?utf-8?B?eDhXWkdqelZyRTViWlNsc2d6bGpNc2tkbU9zU2x0MnhtSHZYamhPQ2I1SnZX?=
 =?utf-8?B?cGtRUENoSDd5UFFQanROKzhsdlF1bzhvN0poWkJ2aVc0a1RyRXJyRE9iT0Qx?=
 =?utf-8?B?TzEwK2N2V0I2Snl0UHlVY1lpa2UrQmtrbHBiem9YdUFrQ21LUFJUVmQ5S1VS?=
 =?utf-8?B?UlE4QU5rSDYrMVJFUTRmOFByRDFQSGhrM2NuMVNIYk1OUVcrMzEwYlA5Zzht?=
 =?utf-8?B?UXdqNXRCNHdFMWpFYWhzV3NGTXFnOUVaMnF2UmRpbHZnc2Y2b1NIMVZtSXVU?=
 =?utf-8?B?dTNsS2lYeXh3NVdPbHFMTnpIOVNpS09SS3Z0bGpjRTI2Wk55WndEZlhBczlQ?=
 =?utf-8?B?a1pDbW1SMGo3aXJ3Y0F2N2tFdnhzZEx3YWZiRnlNWGNPOFk3QThSeGZqTnZi?=
 =?utf-8?B?eHRsV2l5TTU0K1FKak4va290M0VyRFNWMGFjSXIzcmxJQWF0dlgzS2pXYTkr?=
 =?utf-8?B?bkFuaWVFNTJ1RVY1WE1SV3Q2bWxkWjg3TlhlcURURkJWdit5a0syUnBjQnIz?=
 =?utf-8?B?LzFOL3F5THlRZkRFSjFFc0FYcVhQSXE5MVB3OWpxUDRuS3R3WUlLa3M1V3li?=
 =?utf-8?B?czFib01wNmk0UDRPTUZZeEdtcFJBMHE1eWNmQ25JbDJTUDRlaWhRWng1elZN?=
 =?utf-8?B?YVZaN0RXYkJhanVNY290NGRVUjI2M1ZaR09uaDR3U3NsZUlIcUhhZmFSUWZT?=
 =?utf-8?B?YWMyYTN2OGN6VDZxSDRwNjhlQ1BQYTU4anNRcVI0c3dqZ3o0ZlFDUlVpTGdv?=
 =?utf-8?B?bHI1QW9Ya0ZWMVZjNlZzM0lGaWdweXpUUkJSQzJjbjJsTmE1Tlp6cFZLSmZU?=
 =?utf-8?B?MzJmS0hGQVlOSWgwTjNjQXBGNkp5NkxwMFBCWDd4cmlWTm1JMldGK2NiY3ZQ?=
 =?utf-8?B?T0g0eUNubGVScnZlQjhzcmpKd216ZUVubG52SzZnQ1pQRlE1T0xuWUJRVzN4?=
 =?utf-8?B?TWx1RUwzbTQ5UXVwUHM4YW1YakdaUWwvVm5hK0h0cUJRb21KdU5iWjY2dkl0?=
 =?utf-8?B?VVV2NE5qc0hEVk9Ea25zNjNkQmxNQXJhbE4ra1E5OTdmM2lUaDRvdEpmazky?=
 =?utf-8?B?bHhMbXR4d1E3ZnpQaGVjaTRQR1B6ekN1Znh1RVdQVVFIbVRxdjZIOHB1RVpP?=
 =?utf-8?Q?SRglvwB5i9IKgFfT3uOuH8sWN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f9c7b0-1203-4e71-86be-08da5f2ca9a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 08:51:05.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvhRyuyAaaWsZvMgPQXBsqEJO9PLj42sOZ6Pqsf+LZ2VUxNsV0ALqCLyrA20tEbC5VUe2L7idLKTo2JxqlVv8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5122

On 06.07.2022 10:43, Xenia Ragiadakou wrote:
> On 7/6/22 10:10, Jan Beulich wrote:
>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>> The function idle_loop() is referenced only in domain.c.
>>> Change its linkage from external to internal by adding the storage-class
>>> specifier static to its definitions.
>>>
>>> Since idle_loop() is referenced only in inline assembly, add the 'used'
>>> attribute to suppress unused-function compiler warning.
>>
>> While I see that Julien has already acked the patch, I'd like to point
>> out that using __used here is somewhat bogus. Imo the better approach
>> is to properly make visible to the compiler that the symbol is used by
>> the asm(), by adding a fake(?) input.
> 
> I 'm afraid I do not understand what do you mean by "adding a fake(?) 
> input". Can you please elaborate a little on your suggestion?

Once the asm() in question takes the function as an input, the compiler
will know that the function has a user (unless, of course, it finds a
way to elide the asm() itself). The "fake(?)" was because I'm not deeply
enough into Arm inline assembly to know whether the input could then
also be used as an instruction operand (which imo would be preferable) -
if it can't (e.g. because there's no suitable constraint or operand
modifier), it still can be an input just to inform the compiler.

Jan

