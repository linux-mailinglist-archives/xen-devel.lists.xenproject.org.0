Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3EC507086
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308192.523797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngouG-0004K8-8m; Tue, 19 Apr 2022 14:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308192.523797; Tue, 19 Apr 2022 14:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngouG-0004Hq-4v; Tue, 19 Apr 2022 14:32:40 +0000
Received: by outflank-mailman (input) for mailman id 308192;
 Tue, 19 Apr 2022 14:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngouE-0004Hj-MU
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:32:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c9badde-bfed-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 16:32:33 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-Qvogej9ONy6io9_vhd0jdA-1; Tue, 19 Apr 2022 16:32:32 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB2968.eurprd04.prod.outlook.com (2603:10a6:6:b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Tue, 19 Apr 2022 14:32:30 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 14:32:30 +0000
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
X-Inumbo-ID: 8c9badde-bfed-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650378757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyUVBA/RyGgqAt0kBQqMaTjuuJfYNowncXU9CRendHQ=;
	b=VT2iDfKDk21HXuacDhBOnA5r4UYrAaESayWaPiXAQcK5t+SfLf8tgS6Ixjgdb80NOIfLx4
	qnmvIXnirJ2YheT5NWMNuP1f7E1czmq9WssxF1jg66YNvcyR6Bo1aKo8BNOMwICNPKTmF1
	dfwfhc6mrtg1bHGNCNA98H0eFqmAZUU=
X-MC-Unique: Qvogej9ONy6io9_vhd0jdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiA+V9aLCeIjoOnVMT8Nfg/XJVQEM26ZJyWbEQB+oBZQTfoNUaFO47ibe12FsJ4sfLxOT4dQYqeK260Pd0JFZOj0NDLvBcSqAXaX+6cpU/xOusavWEofIi9OIUQ4Jo9IzdFCUhn6YOQYblCKs2HQ3msOPmxviyHdfc1to0WEybP9FRu7lMalcsSDzp786QHchI0CJlAaZXon9ykM0MirZIWtNuv2pwUGiX8oUwscz3SRNYCFeaNEW5B+lCDrjdCI0wbWR75YCvkRNrPYfShDWzMHpz6kuLs2o+EEnn3xiX2vA4DbsRegzUQ1v+YT6K6217L8PJTBqA0GjzUlppZfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyUVBA/RyGgqAt0kBQqMaTjuuJfYNowncXU9CRendHQ=;
 b=YbL0imiQDFtW8pQdOGJnyMk4wvMrqxLt2rTQRGYeHhzGHlHhgcCkvW12rGHywkp3+aT9KNTmoRxM/kxcCo6ag3VRz7Fitf7kzMDprV64NgtaX1NMUYeGJUeVNaobBs0jesdLUysDca+69lvYutbdaBOr6zLyZMl1yuuYfJ7JVam5dlufvVRvXOEfX2huTo2wd8FysHeMYgKxzTAvG1FxzwBjCklxa4+VOd7o11517HFNnkMLPAi+a0ek9yL8EMW8hcFdQ0laC4/aMtdDbdnPbLJMsP44QJIqTFmDJ93mBXFCDSTPILp4FGc1+hQN+hWrHW8MOBFNizFHS42uVjIHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff76eeb4-33fc-e427-9e38-fbe151256828@suse.com>
Date: Tue, 19 Apr 2022 16:32:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/3] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>, xen-devel@lists.xenproject.org
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220419135254.21729-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0563.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6ff747b-f9cd-4cb3-a3f2-08da22116f41
X-MS-TrafficTypeDiagnostic: DB6PR04MB2968:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB2968BB822C5996D65BDF5724B3F29@DB6PR04MB2968.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N8GnYS4ez+9bBlvNMqq7ixxD2q7U97rqadeNkKEAuZNVcKhdUij9lwWufIynixt8hE8Bpkc/VXWOp7SJVvh3CtFMey1so6AymS0inKDKhuv0cs1GV8F8M3+dveWLjsJtvMctAE3mj/bkV5QmkRDtiGGiHLEAkIemVyHW3EIVuHN/n0dbBQzGGKvYnEIWCYl2SHfaJPM9CumgMh67WZ+NusPUAcvWS5R122wwYu+AR9z9r+JqUPggMrnurr+vl8OB59MFmmgurkfbXUq1cnyjx7YWp2EM+UZNj897eBnJLqwztJ62bCLu6wsmFaOqnV1YAbK/HEPylGWzDI3MHMdqRNnaxinTJtJJRpL7+crTbRhI8hbMfTqd4UrIu64IY14Jd1XPiy53SaRDQFQGaYCikeINGb20JggrWS2ZywL24PZz6tJyfNGuZjJmruxPyT9lGapqpKG/5ODpVHdzm8xbT+7l7zICneXpqYg4KUogtca3/24jqLTWHeBM9bpdhQZ3vPwCj3WmBUMRCELDYE727/zVSHpAOjZFXxeU9GYDZcSkXUwEMZE/Gx5T728PVwVJz/BjuheC0mo2y4FEhKlWlphEhN37HR2GtnILU6+9oxZe9KgOCt9UYdhefavj0K2N/L46ZWM4kiqto/g9sJ5i94nSs9d1a6XGp2M69l0ms9+kYa0B4ofpptQBxUwNko4DbfifvlZ5KfRu6m3BqFiraqivcofHJSS6ynDdi5qQllI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6506007)(26005)(6512007)(37006003)(36756003)(53546011)(54906003)(2906002)(316002)(66946007)(38100700002)(4326008)(66556008)(6636002)(6486002)(508600001)(8676002)(5660300002)(66476007)(31686004)(2616005)(186003)(86362001)(31696002)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjFIV05Id0ZxL1RBTXNHS24yWEh6cHF6ZXRqSk5uTWJ4MmpBYWlUT0pMZFNV?=
 =?utf-8?B?RW5Ca0x4Y3p6Y3hPSnRqNGliWjdnZ1dlZzMyV0ZMOTFySno2dUJBbE5MVTVh?=
 =?utf-8?B?bWVpUDVxOHpibmNqcWpxM1Nxb3RmTVVNeldybTJDdTBtY2VuYzgyMnJxN1Ri?=
 =?utf-8?B?YmtWcFBSaHRlRDBJTG9vRDBMSXllNjEyaGY0SVhrSGpLKzB3OXBHTVU4UlZ1?=
 =?utf-8?B?cC9XemhVOUZhZ2VqTkJTY3RZdDByeEJoT1pkRGtYYndONXo1VWtHRk9FVmNM?=
 =?utf-8?B?eFIzYVNHU2JkYTYzemM2TXNJRTBJN01nYjFrOWM2VTN1Nm96ZlVacmVJRzJT?=
 =?utf-8?B?VGZyS005Z0V1NnNkZUFKTVk2U0ExQytYRFo2WjdYM1Z1RVE4b3lYektSTElL?=
 =?utf-8?B?QkszdFYzVGZiRFY1OHdrN2JIbGJRR2FlVTFRZU1NMndya1pENFZpR0JXUW9w?=
 =?utf-8?B?UGdnMi9pUmxzYkxyL0laOXBsNTk1dEdUVHUrdzdVNHA1M1pNSWV0QVEyOU1u?=
 =?utf-8?B?MWdQNjBTOEpQS1UvT0c3RUQ2aXhLdU8xYnMwMUJEK0JyMUNyNFFjVjJtVHdn?=
 =?utf-8?B?dVMvRzNKa3hYVWdmU0dVbjVmVERzRkpJR3MzTU5qSkZGT1FlVVhsdmhhdXdj?=
 =?utf-8?B?ZUJJOGFNU3JmRDJNYXhkaGVRRVgvVjRzREhoNlozb3JrajRaQnF5d3kzTCtI?=
 =?utf-8?B?VndnWkRRdGt3T2hSKzNNOHlDSUxCYzBzdGdoRWVxTzdRR0xuKy9TZGxPTC9M?=
 =?utf-8?B?Tms1NjNmL0lvZStoSHV0NXZLRngvaElEK1lJNXRpQXNoRUNwNjZkWVNwOHJE?=
 =?utf-8?B?eGt5eDdScWw2dHgrVW85eHNLQnNtdlJCeUg3SHFFenR4cCtZVEVXNEo0MDNm?=
 =?utf-8?B?RzM5WXNTeGpGcm9RVlBnN083K3gzU1ZiVDJtSDAzUGN0Nk9xekw1SFNjNzVk?=
 =?utf-8?B?NEFRUjE4WjZXVHYxYWIvMVR0c0lLaWM4VWxueVZiSmh4QUtJdUFsVWdZNE1C?=
 =?utf-8?B?ODArcGhqdlBzTFJUb0h5dmc5aUhZSjRBSVM3aC9oTXczV3YxWkRKNjRzL2dK?=
 =?utf-8?B?bjNyOE5sV0pXc0RTb28xNGVzNGtxUWw4TTZ1S0lzY3l4ZkNEdTYzcmthVS9Y?=
 =?utf-8?B?cVNTRmdPU2xKVW8rSFNEbDlZS3NRc051a0Z0aHdOZUdldGoxRlk1YmlLdnN1?=
 =?utf-8?B?a2RoQW9CRVNkM21ZRDQ2MjBaNDI1d1crbWZ4eDZab01EU2VaazBkQkpxcDhs?=
 =?utf-8?B?Q1pXQllZZTl0WCt5a1REaHZrQ1JLV0hBdXJKNmhaazMxbUE0ZHRLRm9ScDlU?=
 =?utf-8?B?WmVpc2xoYkpnVERuSFkrcmpyamJFMXlNNzRmaXVjME5ObFl0S2RIUTc4eGdt?=
 =?utf-8?B?WjdDZnp5eW05MFVTWFF4b2h5K3F2ZnIyY2VNcFViNGdsRnB3MWErKzJWaXVX?=
 =?utf-8?B?SngxeXR2dm1mN01uSzhuMVMrVUJGak1NNm84Vi8zSFV5eEMwRVRQK2xDenNG?=
 =?utf-8?B?RUsvN1Fyd0VoL3ZyRXppRkZlQ2pyeDZPMG1PYlVYckdaaUt2Q0ZvUURWZ3o5?=
 =?utf-8?B?YlFNZFZJWllhUkxJSTB4MkZNVExhcEdRb1JmTk9zUE0rc2UwdVpEdWlBSER2?=
 =?utf-8?B?eE4vU2lZdjcweHRuSmlQVzE4OVQ3aXFnTkdHaUpESGRlVUNNdm9vd3k0dTVB?=
 =?utf-8?B?dE5YSzIvQ0ZqZ3d1cDcvQnJlQzVNMEdJZzBidy9KalRmNTlTQ0xmRUQwS29j?=
 =?utf-8?B?dW5FenlpSERpQWdVSHZhOGswN1FFM0p6VWwrOWpnUkR1Z255VGlxaU9IYnhu?=
 =?utf-8?B?WGszVFpPcHU4dmQrdkFlVm1ma3FxT29BRjExTGRWazBLVGwrRWNmUjRpUjBq?=
 =?utf-8?B?OHVKL2Z5dDYrd3pKczBLbzhIQUlPR0FJWS9yS2JnRW02Y1czYjhuTTdLdlls?=
 =?utf-8?B?MG1oRnRpdU9IOEFrb1FyTEpJVmdWeHR1cTVZNzc1TTllenIxM1Q0Y1dqQkNv?=
 =?utf-8?B?aG9MaTJVMlU3U1NvdlBvQStFc1BsZUQ5OWQ2bUhjcHpTbHU3Q2o3NmRaRnd0?=
 =?utf-8?B?U3dUQmJYamZjTnFSaU5mby9Sanp1d0NSVXNnSDRqWWFpNzZaUVZOREpYUFg3?=
 =?utf-8?B?eTJlbFdZRHZybUZUSHV3RWpwTHNEQ2NtanZYN0tLazdQOWJ0YVgrNFNVVnV3?=
 =?utf-8?B?TSsxWmh2L2dWREFoeDZNSlR0NE5ERjFTczl3eDJkckdpK3BOQkhrYkpRUEpp?=
 =?utf-8?B?ZWJjL2dEdHVMUXlrd0gxRHJCRXdhZ2x3Y1k2Y2F4M1RDZUIxOWhHSDRvQy9i?=
 =?utf-8?B?bHh5VDhOTTJGWlhCekh1ODJUNjdva1R2cWFUOUp3MzlPOGVUWE93Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ff747b-f9cd-4cb3-a3f2-08da22116f41
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 14:32:30.3801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZZatglzvElbDzmbfkwCqWSbnBDpj62OS/xkCpil7dntueSJBHF5jHMlVpTkY5ri3Yhg5g4tpoepEh1N9f7G7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB2968

On 19.04.2022 15:52, Juergen Gross wrote:
> A hypervisor built without CONFIG_GDBSX will crash in case the
> XEN_DOMCTL_gdbsx_guestmemio domctl is being called, as the call will
> end up in iommu_do_domctl() with d == NULL:
> 
> (XEN) CPU:    6
> (XEN) RIP:    e008:[<ffff82d040269984>] iommu_do_domctl+0x4/0x30
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
> (XEN) rax: 00000000000003e8   rbx: ffff830856277ef8   rcx: ffff830856277fff
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040269984>] R iommu_do_domctl+0x4/0x30
> (XEN)    [<ffff82d04035cd5f>] S arch_do_domctl+0x7f/0x2330
> (XEN)    [<ffff82d040239e46>] S do_domctl+0xe56/0x1930
> (XEN)    [<ffff82d040238ff0>] S do_domctl+0/0x1930
> (XEN)    [<ffff82d0402f8c59>] S pv_hypercall+0x99/0x110
> (XEN)    [<ffff82d0402f5161>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x11/0x90
> (XEN)    [<ffff82d040366288>] S lstar_enter+0x128/0x130
> (XEN)
> (XEN) Pagetable walk from 0000000000000144:
> (XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 6:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0000]
> (XEN) Faulting linear address: 0000000000000144
> 
> Fix this issue by making sure the domain pointer has a sane value.
> 
> Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
> Fixes: e726a82ca0dc ("xen: make gdbsx support configurable")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


