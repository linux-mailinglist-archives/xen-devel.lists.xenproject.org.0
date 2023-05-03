Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7076F525A
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528987.822840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7J8-0004WY-Bd; Wed, 03 May 2023 07:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528987.822840; Wed, 03 May 2023 07:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7J8-0004UE-8x; Wed, 03 May 2023 07:53:50 +0000
Received: by outflank-mailman (input) for mailman id 528987;
 Wed, 03 May 2023 07:53:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu7J7-0004U8-Eg
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:53:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2717ada-e987-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 09:53:47 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM8PR04MB7281.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 07:53:45 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:53:45 +0000
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
X-Inumbo-ID: a2717ada-e987-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDh4CXiHVE0BJZWqTtssqSY/PAUkMuWOkg3SLgOyFBzEZeDOS2v5Xu1WmtN33BFQ+tEC637oKgXenG6gzTRSUiA+A4qKC3U1kR1WLf9+ikIPBjYRrdIFD+G4OIB8oUWdH3Uz990MSM3fs0hU/ZE1+wzoTBKojCPYZRkh4fqS7QFpy/1VWzeRJW9dn8frMoRp+49UtWFebHpsWFLIDdHST6eVK3Vjnk+QcGH+QSXUCkmYm0xHBIyNeLI6ptcSTocsps4X3F2BhvWja/AlZ1mLTohzyxzbbfXGBtN537Rzz/fAom0kyyECPUYNk95XCQvd6xNBd9/Y8aKxoWDMuQeTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9CbK7nt9CXb0fo98FUzYPyx8qOlbbc9IREixlGl91A=;
 b=Hq9ADPT4pF0QUafHQNiQWBKGf33xjbLJ7IIifg4w9z+ZzVeAjUHFX+zilK7tjsSZZ5li1Gj1/l93l9QCVzVYPELxQpjP3kI+FzAJx6GFjbWvnS7RYXIuEtHnAosJGIdoDwW9Wx6P0/Lwx9/IPzpYt3RXwk5fk457lA2i3Nra6dnFgWxBJ/xxBFoIywn/ydgPqh6t2TyrZ4O5Mh/GgPE4YmgIaT8ozQDAC5UaLsAxRnL3GzLzD8MhY+yijhRc9TCZxEtFNat1dwksxcoVzd/kq1r+4yX3SK3WsCncRcbG9hCopwvpCmb9fqw1OnsDaMyemdBg3KVfpeALxKPLvmIQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9CbK7nt9CXb0fo98FUzYPyx8qOlbbc9IREixlGl91A=;
 b=tGPCGEzXO44KrTyjuaUb7w+h2IEuI7m63fk/4SHAITKvKmrz/M+Wj6oNZlYZ3GmyBbCO45rKgJmwHh4DK7yGsQmkIu19MLbiOtIbGHIJ222WdAhz1x0s0/CtSPpJ1DTMMoQkmVvsm/5WueKAdkjyt+bLwS3oPnrkuDrkxR0Ww+T/UfuL3cXcF7l2WjfvpaX2/h2fUh987JgMUrpblthxz3fGBP5h49U/RBi7RMRGg+Hrr+HXYg+DvBOXgbs3NqUAwpSTgLKdItlUu86AytEeJBwQ3aFfASaLMXV6zUVDsVjtwa7+gbmGvnrPzEa4ifvl58dXkD8XzBWJ/8x0YNlIqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01be67ec-f7e6-f9bf-9d9c-57941ec1dd70@suse.com>
Date: Wed, 3 May 2023 09:53:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com,
 Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-10-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230502233650.20121-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM8PR04MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: c59cf137-f0d4-41d9-a495-08db4bab8567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4+PNPvfYGfcnkB0/mi/BLaNPh6jtCB3RZfUlZVnZNoCYfU77iGq4f89mDiBz+qfb9cbp6OVY/QEts1niQAOGRO2XjI2Mb7hiRP8nFQ1pb7wFRbdvoMWujTuVIp9eFxV+DWtLMFPVCJ94MoK3gOuYku3uOuklTuhO4s53/hjU9ypc8LcB+sbmO9SYDjYUXKuNBr0GR7quMeoLxQ1b9KNvqC+nDsg4FrFrWGU6IxE5gULnX6slVOSMvWSpIqdaGIUxhg9YIx0ALsL7LRHPC3Se17eC5haaw4lWoCP4LovvC300ufgctPlGr4o+R/EnKje37w2reeVkw0TZNCeS5c9KoAjRE5XEjm5SJumIMVIqkeUDTNNzzg/fWqpLZUIelc4OJ/XdUp35BA0bgUsxzPkFYW0xLvreIvlFrW9R+WQNnrceXWsU1cz0FQ+n3LxhJ1jnLe/aIc6C9YpGJYnuLxyWWipGWUBqvkDnxWC1SRvZxAX32gviGcx9pZoAhIpS1urrmZdItYm0z2aCYk8NJ7uyF6T++D/kd/mqeh9xkWWqtSyb4H8+CzqATJLBtefGJzivf9B9BIXUbEHCMFESeB7sc4gMtxrY6PGgywFUc6AMtSYWLI8SK6EOT5hg9f63qVD7JjBngGDbIITEkaH78iiiiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(38100700002)(4744005)(2906002)(8936002)(8676002)(5660300002)(31696002)(36756003)(86362001)(6486002)(478600001)(54906003)(186003)(6512007)(6506007)(26005)(53546011)(31686004)(2616005)(83380400001)(41300700001)(66556008)(66946007)(66476007)(6916009)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3FlcFBvbVBoK0tqL21jTlJsSDdQSXZLMHF3MHZjR0FvV25pVUxsZlY1TW5L?=
 =?utf-8?B?YXpkRjlaNUFJd05sZHZZUitqTmd1dy83ZE9HaHNQaU9jV1Nwd013Z1lJaGtT?=
 =?utf-8?B?RWJsQW5QUFArQUthZjh3STRnWGQ3ZEtNTEVURzI3V3NyN3F3bDJzMmFHZU1E?=
 =?utf-8?B?NDZBTWQ5c2RHWDhWWVYxUVNmb2NFNTF3b3VnQVNaOGVjd2lRQUVwWWZrREUx?=
 =?utf-8?B?eFlBSnBqV1BjaC9jTy9RTE8xb0Fqek8wd0pqR0FxbkU4WVNxRWt4aWVNclZs?=
 =?utf-8?B?K0dOTGxjQnBvSHphVWhIdzdXdGpRUlNFNUtTTjdXVzgwSW5WNklsUWpkamtR?=
 =?utf-8?B?aEtpMTl2ZUVXbDE3N1Zubm1OQnJVbklDaGNMZEJOcmdPODJDME1zY0FDb0VL?=
 =?utf-8?B?VlRoSjhkdEhscTYyVmU2RUpzMWh1eXlvWnBQTk1OaFgrZW5NNTdBUVZUaWVE?=
 =?utf-8?B?SWF0RFdGTG1lNU5UOVJGWHhTa3ordWtOS2IyakpUSm9ZTW9YSHRqOU44LzRk?=
 =?utf-8?B?bzNWZnpXNkdnc0tPdFhXRklPUlRYem16NjBrL3g1V2g4eGgrQ0xIb3A5ckRN?=
 =?utf-8?B?ejl6YUIveGdrdU96Q1hjNkcweFR6VDV1RE4yMkFwMFNiSGxhT0VZNkVkeHk5?=
 =?utf-8?B?TGNMVlgrOFRoQ3VrVTRtaGJBM1BTN212L1ZQRUw2UUdOU0JwN01Kalhvd0pq?=
 =?utf-8?B?YmdFV0xTKzBhM081NHc1MDBQLzVseDJVait0TTdCN1J4RHZFdzR3K2hoeTJp?=
 =?utf-8?B?WE1wMUIzaWVkRjNtQVJjRlVmYWgyenlPMGRMMVVFNlNzeDhKQW82ZnVONW1E?=
 =?utf-8?B?UkRNSG9oRHFDVVllaVZaK0dvdTZUdVBpUmd6bm53cDBHQnZGL1V5WWpMOTNt?=
 =?utf-8?B?eDR0Nk9oR1FVMlJlU0xRZnduT3Rxb1BEekpDdGJmVGxjSGNrN1hHZGtPWURY?=
 =?utf-8?B?U29lemY4N3dURlgwb1JOS1htSDh2eUpCM1pFTFZONkZiVCtLdVZEUDE2Si8v?=
 =?utf-8?B?cXh2VjVpQlZGVGthdjZRdjFVMi9vOU5yQlMyY2VPT0lDSjhFNjZtdGcwQWxs?=
 =?utf-8?B?ZjZoOEo0VlJqd3hjZFNISkU3d1p6Z1NGZmNuRmZJRjgxR1hkMkRETnZWcXBQ?=
 =?utf-8?B?TVZwc3pXcHpoUW5zWDR2dWdUdC9IdFJJODVsd01XMTgzWGRPRzVZUzh6ZTA1?=
 =?utf-8?B?VXFjWDVLUFlXWUs5dElEeWtaRDh6NWdnRUJNUlYybHZKQTFiTm9iblM5dTVp?=
 =?utf-8?B?ejBXVG9XRStWTjFhM1l6UDhlbm85dXczRmlQK2dLWWw5QnNKK2Nybm94bDhu?=
 =?utf-8?B?dnFOK04zY1RBYTZXK1kxclBybVFPVUk0cXd2SENaREZsazl1aUhnRS94eGtD?=
 =?utf-8?B?OEVTbC9wY3FWVmNFc0pCQlA3b3ZvY0J1UkZTZEljQmIvNHhjdTNXeUdzUFJn?=
 =?utf-8?B?Tk9DN1h6b1lGMlVqUTNJV0FzMm9FNC9SSXg5VUpZTUtHVGdMRnpJRHB5QzdH?=
 =?utf-8?B?UEMvc01Bc2ZnUkhIeE9qUFY5eE1HTzdSZENZcGgvblVtTzNkaDBlTDBxckpI?=
 =?utf-8?B?Ym83NVBqaXpaeDlCYUtuNW5SWDNyQ0lKWENRMVR4bFpjbHZSeFhTdXBTcFZw?=
 =?utf-8?B?UnpuaEgvZ2FjSStRa0JBUzhpdXN6RHdYZnFSdTE4ZGxXaisxdE5wcHBubWhl?=
 =?utf-8?B?WnlYQmFFZ1RyOCtsdy9BbzhnLzBaVHRYVWhSNjBZSjkxRzFSWDA0ZmVHVTBG?=
 =?utf-8?B?SENJY3IrcG51VHRQeUMzcGZ0YlMvMi9GY1NQZTF2RGsrSWVFOWR6VWhFdytB?=
 =?utf-8?B?aHpSb1gvcW5BRnlBREdSZFJIMDNBK2M5Q21vNXE4M08va3hOZGJDcnRLT3BR?=
 =?utf-8?B?dEd6dHhwYnQrZGtSSTQ3Ym5VV2hFOVEzL3pmZkZtZUZsaEtXZTFBUlBTQnNn?=
 =?utf-8?B?UEh1QnFsS29jclRzak9wcmhqMDk3NFI2MjlwYkxXZGw4aytFRWxHajl3Mks4?=
 =?utf-8?B?TDM4VGtIdnJpY3I2V2ZyWHA5Tkc4NnpaSkhuM1A2YmJaL2YvRTBacnFqKzNI?=
 =?utf-8?B?dGtqbnhXek5EaVh1OGFYa0hya054S2c1WWNsNmZTTTA2NjlQS04xSk9WQktP?=
 =?utf-8?Q?CF2/eCyAwN9FWjaUx993bnqCn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59cf137-f0d4-41d9-a495-08db4bab8567
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:53:45.7345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+BX5ewiv8USQ6o6sIwmlSsDtWHmyiRypJYGv2T2omrbvcjKeqbMWZ75PgpDCJsarudSbYT19nA79lJVxwiR7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7281

On 03.05.2023 01:36, Vikram Garhwal wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -214,6 +214,7 @@ struct msi_msg;
>  #include <xen/device_tree.h>
>  
>  int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);

Hmm, exposing a function globally which, first and foremost because of
requiring the caller to hold the correct lock(s), is pretty much
internal, doesn't look very nice to me. Can this perhaps be put in a
private header, such that it gets only limited visibility?

Jan

