Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FA6E9423
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524230.815001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTHk-0002Wo-Dl; Thu, 20 Apr 2023 12:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524230.815001; Thu, 20 Apr 2023 12:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTHk-0002TE-9v; Thu, 20 Apr 2023 12:21:12 +0000
Received: by outflank-mailman (input) for mailman id 524230;
 Thu, 20 Apr 2023 12:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppTHi-00024Q-LM
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:21:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4a4fde4-df75-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 14:21:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7726.eurprd04.prod.outlook.com (2603:10a6:102:ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 12:21:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:21:05 +0000
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
X-Inumbo-ID: d4a4fde4-df75-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpS6gVlwrf2Wv4DRe60ws3W3kymEUdEaKSORDl2re9iZe+7tv55p7UGHVWMeN+1M+uHIngGMzEfGnDI8YXMFwbi/1tj/3TO2PLRqEGemsdxtpJh4iX/DlyOSW3JWHq3r9wygpFsTJcx+NfNyqyWNp5pmlla0x3csl1BrYJvhWfQs6oRh/nz8ala7Eb9K8QxsawbpgNN6Hb7QXjOApTU5O3tz+Vq4zWj51TkzJ1ozilYdVue7BzlMkecIKa+oVp/AwBXSzpqkmmKBqmXc0zY0GhYTJ8sVrO0uNrzL12yBAoD0ykQlU7QqzlGueqkxeT2yEIqBtz9WamS+aNPL77FtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inHa3VuybAYPx2l8Ci6A+cf7U65p4vG0Esy0HkUw2OU=;
 b=kPajlHjTuHyDkopZlhVa76DFDNH9pf5w6ZtDKYQ52YWlzinbtv5xFOgjtWgDijq3Gtb9jXtK9MVBYYCKnUf+DpySdtt+t9tMQLcrmQdQyjyxsodXQVl9VU6AwjTAn+SWV+tlVsbv6hTGFC8mbz1DI5hlXymMeW+kWLIwTWd8EsbVev+xXFUZ9KzaTlvsGfY2l67IFzooHHx3yqzhVBBmOa9H1S0yyDS9LwfAkOBkq4OtzLNmtS08KR5DiEwBYBIMBxmCzy1F84FZTte/h5wU/Jcz1DkkVMFyXiw52wNwCWRRxQacWvu0zLO6Le2mhM+L763ExRDmhpEdCBShH4Kovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inHa3VuybAYPx2l8Ci6A+cf7U65p4vG0Esy0HkUw2OU=;
 b=TdhwtyOvRUSLpgC747uUP8kUbcUSap7C7/xPoeiiKlzJgTmTlJBjANIc4sm7++eEsVCIkuHgX0lwtIyqpjJsKl6UbTNQsh5WgWbS/9kcT8Lzl2bm+lmH+alISjrr+GR7CdkNyGdKQntym4QqyJcwyWYMBionYZHP/ZjNvONPkmWstbBE9IxW4QnyO/s805iF+YRqOIJLA93h5vKGeqBgix6owDX4vF1uTU8taR624RmVJUFTAZeI5wwZmjDPCYZN0zf8ebGMGMA2IJ5buSRO0XyJx89+rivDL3E570Uf2UANi+QxEMN+OdaT7OKjZDkRFo1GEIE/YZZm7X6CMtUfSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcde0374-e309-1e65-e9c2-d20cc6c3e005@suse.com>
Date: Thu, 20 Apr 2023 14:21:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 01/17] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-2-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230420112521.3272732-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dad5e5b-89cf-46b2-4490-08db4199b6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tigO903+Fm4+n+WXFzj+kspr8hi9XwO6jwgN5OW+5Wq0rIOWYXREfg3Ze+lV4MRnsimVwZG0w4LOQMIOqfBmx7Kp0LhwusNm6cUQ46qwu2Zj+INE3O4rRZCoB3KyYwx+hnseGzZHOiBJx0JerW4RkFS5eD75ZK+9Q7FszJMign8o7czp5yrSAsplPKFDtIklChTwEKYmlKXWxRrOoMV15SZtiR96RzQXgNLdzSXftYWVCIbcUq/pNTPqKz3dBHa34jA8GuU1hUyfPHTL1/UcDnJq+OgFKPMKxENiJFQ8gBJhteunw3bj8p/AmbzSQVKlZhzXB8BeH1426k9G4Zq/gnVads1d+sXm43nPCYz5ZfE67O2J1TxRannCXcX0tzqOD2D94Ft7pX/K62x3XyqM1LQJnvhU3OHCCi/AR39VwIdUq3YMndndp9Ie8P9dtoO+t8l2JvjzC5Tod2844Rl3Dl4KkEtzLh+KJ+0icxJ4on4RXUVKmmyxSa2D9CwYdKGMxwFa5vja7bOcRIDxn24h0ZW2cOXQeyRJHmMhBGA8SXZtphi084Y28P6xyCILxxD67fP7QHG2indR35YEGS1g/JSTQbA32L6FohQcPs5AT26slGQ376AS0koZrjf9hVQORlM4jrDu8KmsfsMrSavGOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(41300700001)(31696002)(83380400001)(66556008)(66946007)(66476007)(966005)(2616005)(86362001)(316002)(6916009)(4326008)(36756003)(38100700002)(53546011)(54906003)(2906002)(4744005)(6506007)(478600001)(6512007)(8936002)(8676002)(26005)(186003)(7416002)(5660300002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9DWUxXQUVVcG5XdzNtOTFBTTUzN1lMVFFpMHB2VFJwNXhQRlBBY0RsU1F6?=
 =?utf-8?B?QjhvbnV6S1Azd3hSaU44UkxubXdLNUd1UUkyc3dNTGhDeDl2Ly9SVFBPN2da?=
 =?utf-8?B?TXZxTEdQTmVNMTZPOUhJV2VxRlNNMzd3cnNkQXZmcTZQeEhMV0lNL3VzdTMx?=
 =?utf-8?B?L1FoZE0zRlhSRnQ3WkRhbGtJQmxHL0YxenVDaVY4V0RiQ1ErQ1VxOTJNUTNo?=
 =?utf-8?B?TlNoa0kwbW9XdElkejkxK3RlZi90M3kweGUySm5TbEJOcGtwQTk4eXF4OXkw?=
 =?utf-8?B?aHJudHRHOHZRcW1JMmF4MXJBbThlbUI4TDJsVXRtMHNQT1lRR2NEWHRzNTdE?=
 =?utf-8?B?STlVSDYrL3hLSVRqM1NTeU80TGpwVWwyRFhyeGd4SFdUOWZoUk4zdnVhUkVQ?=
 =?utf-8?B?bHV0NUxsZWljUEc3ejZKL0FEK1FkSXNQenlUUjdHRmtDaDVJTnM4YXhRVjRZ?=
 =?utf-8?B?Z2xUWE9ScWZIWmlWajRzeGNGUjMrczhwU1I5ZmppVDArQk9uK0Q1VWNpamt1?=
 =?utf-8?B?eUo5T3RNTkJqeHhKdkpyWFZ3dmYxTWxPeFF2MU83L0Iwc0dhTW5kamNvRi9a?=
 =?utf-8?B?NXFDeldpTTU3RHlOWWU4U3Bvcm1VNWFrMFlxYStrZFMzMGFVWEkwYzR6d1hJ?=
 =?utf-8?B?ekRoc1JrWVJZSzV4TDlCN28yeEhWVE5yZmplajRNMEwyMDk3RzBpeFozY0RR?=
 =?utf-8?B?S2dTcTNnVG5sSk5hSmtqYm82SVptM2Raa2J3MFpXREk3RWI3bmhtbjltUGFI?=
 =?utf-8?B?SDg0N0gyMlpRS2Q4MnNUQXJKa3o4RXNzeXNaV1VneUNRRXlPenFBTUhVdWNL?=
 =?utf-8?B?MGpWMExOdXJqZTRqV3BTd2ZaYlNPUmV2REREMEZlTDFxWlNSWlI5UHBGR0ZT?=
 =?utf-8?B?MDE0TjJ2K1QwK1dwZHA3Qkh4c2dEQ2V0U2NIT2R1dVBqUkxRSDdSTTM4UDdo?=
 =?utf-8?B?cjBKMDNXRWpjWktjWCtKeERWRktLOWYwZytpbmNGZ0ZNVkp6djM3OEpvRVo1?=
 =?utf-8?B?UTVWN3ZPbUtrSWMrRkw4a3lRWktrSnRzSkRTeldURFExNHFHU3hGNWN5QzVQ?=
 =?utf-8?B?L1FpT1pMcEZYZng4NnFLT0o1b01wMVp5QnljeDd2dmcxc29YUUdRWDd6c2FO?=
 =?utf-8?B?d3lZMGhGZ0d0MmRKdDFFMU9CbEFzaWNRUkMwTHh5T1VSS2hmR3R0ak5FQk55?=
 =?utf-8?B?bFpaazdpU1l2T1lqbGVrWE93SjlzQmk2THNJSVZROWNxMnQyRjJTQWhsWWRp?=
 =?utf-8?B?bURrWXBEdEFERkVmVzg1c3ZvRnJaM0d0bk1BK3E3NWx0b3VwQW1vUVNBTjZ6?=
 =?utf-8?B?ZWFwdi82N1BkRTlhQmZFTUswMkZZNkp5QTNVSnpwT0dQUGlTQlpPTi9tdENw?=
 =?utf-8?B?TlR0TGg5eCtoMUZ6WEdYV0RIaU1WQ3pSdnF1akVJa0hQQ2d6RWlaeUh6UGtC?=
 =?utf-8?B?dlUwaTZDdVNoU2s3R2VwYU13M3pMaHRoRnFtdjB6S0ZyL3o5UW9LYmJNM1BG?=
 =?utf-8?B?cmk5SGM3T3FIYTNSdnRsMjNQb1pTb1U4Zk14dHQxTDlmZzNDdzlEUExsZm5K?=
 =?utf-8?B?SkxWSFR4SEhNK0hmMUJ3M2RacHYyUEZtWDBQeUtZRXhRWGVsRmp6UG5vZnRS?=
 =?utf-8?B?Zm56ZWlwb2tVQloyQzVlRnBGUDd6ZFFWSGFuV3BBU3RpeTdGekFnejdxTlZ5?=
 =?utf-8?B?QUF1SVpXVGY1K3ZkUC9aMzM2TlBLK1FlOFl0MmZYbGhkRFdQdlNTUHd0QlZT?=
 =?utf-8?B?QzMvcjFRWDMvT0lYU3BlaGU3MUpGUkswdEh1cDNHeTRTRkMxREtZR1p0MTk2?=
 =?utf-8?B?b0FIOXZFKzFUUkJMTStMVWhUUmR2dEpqQ0s1RVhacHk4K2VaM0ZEVEl0QU9x?=
 =?utf-8?B?cHhUVEpyc3N4emErQkZPL29ESXQxVzRhd0QreTM1dndiSXVCTVdxTFZxbUUv?=
 =?utf-8?B?MlVWMjRKNE9JU1JldHFpb1VwZS9XYjVUL3VFbmZUMDV2WkRacG8yNXVoRHJV?=
 =?utf-8?B?eThKZ0lsL3FxeTA5MTVISUZsa2p6SzlSNEVkTFJGbHZ2TUZxQkQ4ZkI0QUJW?=
 =?utf-8?B?V0tUODRjU1huQnliTHRqNmlJSk1zc2kzRVM4WWo0U3RibDBqK1pOaHlSVWI3?=
 =?utf-8?Q?SNUnQVXvqy3ut5smWda6HCnb6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dad5e5b-89cf-46b2-4490-08db4199b6ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:21:05.5406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJHqnn5hOIOPkJNPZreP5FCmnzANLbGKYvQS/RKXT1qSxhy42gSZXscVWQR56xKpQHL8Srv+IXH+fhQWfudWvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7726

On 20.04.2023 13:25, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> As a memory range described in device tree cannot be split across
> multiple nodes. And it is very likely than if you have more than
> 64 nodes, you may need a lot more than 2 regions per node. So the
> default NR_NODE_MEMBLKS value (MAX_NUMNODES * 2) makes no sense
> on Arm.
> 
> So, for Arm, we would just define NR_NODE_MEMBLKS as an alias to
> NR_MEM_BANKS. And in the future NR_MEM_BANKS will be user-configurable
> via kconfig, but for now leave NR_MEM_BANKS as 128 on Arm. This
> avoid to have different way to define the value based NUMA vs non-NUMA.
> 
> Further discussions can be found here[1].
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg02322.html
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



