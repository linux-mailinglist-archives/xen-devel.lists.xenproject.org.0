Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA752BB80
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332187.555838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJoT-0000Ta-4k; Wed, 18 May 2022 13:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332187.555838; Wed, 18 May 2022 13:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJoT-0000RB-0O; Wed, 18 May 2022 13:34:05 +0000
Received: by outflank-mailman (input) for mailman id 332187;
 Wed, 18 May 2022 13:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrJoS-0000R5-18
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:34:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b80b023-d6af-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 15:33:58 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-oMsLmpMwPiqRieWDfL3EEg-1; Wed, 18 May 2022 15:34:00 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5271.eurprd04.prod.outlook.com (2603:10a6:20b:11::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 13:33:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 13:33:59 +0000
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
X-Inumbo-ID: 2b80b023-d6af-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652880842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdpQQLFkjDvga25tn09GfvRtH8pgjQVe+5EpXeAq6ns=;
	b=A1gVMf8Wsk7quEFS2yGJRJtsfqaOXl3zCHHPc5hG87F6rYk06rqf8IZTpRM99wz4El1PTU
	ATLyxZnFrP+veXK2UvFREbdADG1Yv7xjawRvwfHtcGRub5d15ba+5Cym81AqjrpQ2fuRFE
	jhyzmIijnFRg7WfaZyEhJMGsDYwKNI4=
X-MC-Unique: oMsLmpMwPiqRieWDfL3EEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8w2bLx14ID5+VUdv0JKDwBuIGB8eiXN6QfkdA/nxqh92u7L3aQtnlrGvqx3Z/Pa3BhGXxnh+SNqeV/43fThdip2ZHjoCR1aaCSExPre/1fbrVwrQNKL5DaeUqxKYW/uj8YobnV/FAc3ZDlHLhV9YcgT8GGwzSMeBOasj0B418Qt2W/FOjG6sNdd3Z1h5oay7gb2SAGr+4/Q8PF9Wpqwn8RUMjATNkY5gy5+7E4zJxdmEA7szMCVe41gwWUOVc2Aocj0aHnLzjV4dudLtM2WJnl6zagVMi7qwSotYa965tYmbf6njLC1F0DqbN4Mvne13h2jHk8Era0RTYD2eOC7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdpQQLFkjDvga25tn09GfvRtH8pgjQVe+5EpXeAq6ns=;
 b=hA2AnHZwZyY4qZ7eu96DykuXigdLIj4uxMSrecUdzelJkHgdRLL344+1u4xx4W4dri2K5VZQXioaZYP+Jx9iRMSkvcpYn19v7DOPKE1s9RmfW5iMyhhg50UmnFyCMnGzhA7VMG51rXGVPOil9FsTFyqCXqkYof/OtKDZk5DyPbXXYyjcZ8PFbTzzVd+c59CGBmxYgTMwIetKC2hYAFh4FsD9oXucBg0QwIe/WTB/qYqFhI+LEhqcGvmeNY6MM+H28UGr+t35d2BEU0CZW7jiif+MFQZ24TkIyBNAIYQ7Go/WUbsz7JCcaur342F/QoLePYAxga1xD2aMKktu5THUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da3fcc3a-4e90-2179-1f57-77eb60a7a65f@suse.com>
Date: Wed, 18 May 2022 15:33:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 9/9] xen/x86: use INFO level for node's without memory
 log message
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-10-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220511014639.197825-10-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b7c10c-2d68-4e7c-c909-08da38d31098
X-MS-TrafficTypeDiagnostic: AM6PR04MB5271:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5271B351677D739EC4815C99B3D19@AM6PR04MB5271.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gn53jUpYVG/zg5LogcR7NQpU1Vvnv7jlInk70rdV0kZinKntcSYFFhWnFfwwSYmD4XcYDs+CXsB56fzhnS9yY7ED/yjYgcLDwslQL4GKpgdPZrBtmN/kfSCY5cGKvYi6i9gHielWMgMR8O44AuPzSRDAh4DiXlVIWBA0eNfP5tYCseGN5J0SSMEPpUcthaNv1BafzIq+/PTYxjMF7UlMdzWYA4yve8ioEpdyhrdqsYuFTMNGCSeq/RdDs5MsRUiXt0zPixV3KVg/f8lVTNwtFPZpkpzeoy0ig0gFaMuLJL9SkGrGnhGbRgp/xiChYht7u4adB2oxE0hpvifNZ2vNqyKxjmGkOozyJ+TGc0/70kfa5gERZWeXxxyVZxbSuF3fvnptXdpcMarjyXumos3nu/VuLjULWj6GeiSHkKWUK/SzTNVfKsCXol7cBekGdnzvnsx0AUhEB7T/zivrSRQBKNFa1nr06/bmT8hmb1YuxZuxJtq2yGe9JebFVp+iWrSRr5UjCsmYQklHCSo+qI1InXWssf42Z3za84w+7BpM4MGwm7GCEZjl6wUxBvKohpoGr0Hrv/g5BibInwuP8Zo2Ojr1zE0VnDogKRuKBo6K3gY3iaQ3jrVPpB3mvMhZs2qlHrvkjMgpsNn1DTh5TpAY+uqyanxAK+CKsjdHcpUwMzRfFJWWC/nfp2dOchu6ACBNpnLsr4HNjbx1DaP0tthADH30cgzt6haYCJIOO4junOxY7/sT7ZWz2gDbVIqzURW0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6486002)(6512007)(186003)(54906003)(15650500001)(316002)(2616005)(8676002)(6916009)(8936002)(26005)(508600001)(36756003)(31686004)(2906002)(5660300002)(66476007)(83380400001)(4326008)(86362001)(53546011)(31696002)(66556008)(66946007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjhLbG9wZnVlenBFeVZCUEtZOXpzZ05zUWQ5RFkvUjZoM1EwQkZZWjFaelk3?=
 =?utf-8?B?ZHVoNXRNRXNLMGdvSFBsRmlEeG51V3lQT2ZaRE1SSkdaTHVNK0pMdmhPRzFn?=
 =?utf-8?B?Qjk1S1kyY0t5UlVFdVJzaldGY0gwZldwMHd4bnU0QzFkOUloL25hZ3hsRDBB?=
 =?utf-8?B?VzhVWXBpMTZnRXdwWllGaXA0c0JvQ0VySW9wK25yNmI3ZzBqMlBvRlFUVU1C?=
 =?utf-8?B?U3YwWE5tTHBMSFVaSmJNamVIQUNyelRPN21qdE5hSDVXRm92bWFkbVdiV0s0?=
 =?utf-8?B?SHl6TU16KzlUbVY2OGFWMGFxL1phUjJjamlNNkZNMUJrT2JhVmxhZElPT3BL?=
 =?utf-8?B?NHhybVFheHFaS2ZObEpBRk9la0NpenZpa21oeXFtaVh4cjZxT0d4SDM0SzVs?=
 =?utf-8?B?bkgyT0JlSHpLSFlLZHdBMUI4ekxBenlQZk9wZ1ZncHhDTy9PZ3lDTHYzNmdW?=
 =?utf-8?B?aTQ3SElONkdPNCtsbnRqLzl6aDlIRzZDZ1l2RkI2Umc1a1FIRTVPeUtoZ0Rp?=
 =?utf-8?B?S1IweVI3TlNRaHZuNVkzNm5oWHFYbXBIcVJneDJxNFFyZzlvUnRiVnoza0pP?=
 =?utf-8?B?Zm9QdUkzV1pGT0VtYXg2QUdWdFBXZkJUVkQrMVVaOVJ3eEl5ekNEMmZ5SHBn?=
 =?utf-8?B?TGhYZElZU3k3bnB5OFBzaGFra2RpRWVRYVZoM3lBbHZqeUJDUUh1QXpZOXlQ?=
 =?utf-8?B?TitMeFd1QkhGY1FFVmJUNlFnZUx1cUZEZHFwZHQwSyt4U3Uwd3ZueGNEZVo5?=
 =?utf-8?B?K3dZZWVJVzhWOEpPM2dMemFPSzVsek5lM1VJdzlsQzhsU0VtTXVCU2ZPRXFS?=
 =?utf-8?B?NFd1KzdEUlBJRWkzT0JCWjFuWEZNVS9sSVBKclR0TnJRUE9XMCs4MVBlMFNN?=
 =?utf-8?B?d0M4MWVDSmZBSU8zOWV2NW83YmhCU3UrZ3RvRGhUWW10OHlra3hIWmowOEpE?=
 =?utf-8?B?SXQ5Y1NtMG9vUElFQTlmdHJ4Zk5FN2F0WWp0SHM5b2ZpNVBkaEFldG9VelJE?=
 =?utf-8?B?U3RsRm00U3JScm1RRjk4UmQ3TjdVRnpvUGtjdHNCSXptck5YZ2xqL3NhR2FK?=
 =?utf-8?B?K1lyV3JpcDBjS0tFYXZhU0Mwd1krRUwxRzV5Y1pLeWEyUWMrTlowbzNGWlg4?=
 =?utf-8?B?U0VCamRRN1JCL3FDakszOUdCcW5ZVTJJdVoyQXhha1o1eTMrcGFEMForR0Iz?=
 =?utf-8?B?aG1vTUUzTVFhQng3YXIranl0QndtNFJBL0UvbWRSWlkwSWlGT0pSWGV4QjRI?=
 =?utf-8?B?RWhnVllRL01GbHl4Wnpxei9CMGNhTTVhTllzalBmeVBuWWpPbWczdUwyeGFy?=
 =?utf-8?B?R1c2Ny9XRGpEQUhBY0VJNVA2cU53QVU2UWJzWDd1NmR5bGV2NkhxMDVUdGs0?=
 =?utf-8?B?Zk1UZk1uRUhtNzFzZ1NqaDFzMDkxU01sR2hUV2Q3WjFiejkrNmVFQTlqRUVI?=
 =?utf-8?B?MFVkckphTVpSQ0ZQN21yZmF6ZUFCQmFER2tob2UwZUFkdytETmhNM09BVHY2?=
 =?utf-8?B?UGFqYXk4K2xybE1JbWcvQVd3L3hwbHVhOVA2OEdNdXFyTFRiYlF2cjVScnJK?=
 =?utf-8?B?ZjVpLzF3QXJaNTZ6aUpGWGdsUEVGRUFuRktITFNFTVhiQ0dYQjIrdVYweVQz?=
 =?utf-8?B?U0RINk9yeWNwNW9aNWNvSVZycnRwSlZFTzdyVjFPOEo3QSt0VWg0STBIT25X?=
 =?utf-8?B?YUNaNVpBaXNSSGFMQnFGYXFPZmpEV3hkVGJkelYyZ3JwUHJhKzZ1eWNRdWVP?=
 =?utf-8?B?bEdtVndBbGpkUGF4ZlduQzczQlM2M1VpbGgzSFhoOWhmdVVwcm1xVTh1eTk0?=
 =?utf-8?B?VFJYWUFUQnIrdnN6NlpNUTlxZFdYN292RDhYRmhoK2I5Z0Q0M2JRNGxteGhR?=
 =?utf-8?B?QkFsWDNaRFpLeDFyT1d6aEc1UW1JeC9ScHdTT1VPb3N2TkhyaTMwSEtSaGVy?=
 =?utf-8?B?YUVSdGxNK1g3R0RkbStBdHhLcXlMdU9sUlpKNkNZeG4rVHczd0txejFQZm9u?=
 =?utf-8?B?bU9qNU5OT2JGTloyUXVjaCtPN1JWYlFISVU4MVFuMHFrMjdEN3Q0SDhlNlVm?=
 =?utf-8?B?M01MYm8wbUlsU1NIc0tlTjNmYldKdXZjeEF4VVlTQTRjcXlCQVdhVHJSTk1P?=
 =?utf-8?B?aHNoVnFaemFFOTMyRUZ4TmR3cmtaSUo1elJxakdmZll6L2Q1ZkFlaXVJeTQ1?=
 =?utf-8?B?dXRZL2NDSDE3UTJLQnRWTUxCMGV0bk82b2k5K21JS3plSGpiYXMvc3BKczg3?=
 =?utf-8?B?d2NRS1BBa2hzOFkwZFowTkNjanQzbVA4TVlVU0pQOHFkenpCWWRkbmxxbElR?=
 =?utf-8?B?VGJSK3Y2V3dvTG50a1BROVgwamlQZWlxb1FnQ1dpUWIvRmFDamNHZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b7c10c-2d68-4e7c-c909-08da38d31098
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 13:33:59.5455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAYw+505TJFaJpWuh+oDWQjDQQqlV/pxbMZH9yDLGaj8ze9c2wDkN8m9mWHN+sws35upT3ALyV+Tr+u/dA+Ltw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5271

On 11.05.2022 03:46, Wei Chen wrote:
> In previous code, Xen was using KERN_WARNING for log message
> when Xen found a node without memory. Xen will print this
> warning message, and said that this may be an BIOS Bug or
> mis-configured hardware. But actually, this warning is bogus,
> because in an NUMA setting, nodes can only have processors,
> and with 0 bytes memory. So it is unreasonable to warn about
> BIOS or hardware corruption based on the detection of node
> with 0 bytes memory.
> 
> So in this patch, we remove the warning messages, but just
> keep an info message to info users that there is one or more
> nodes with 0 bytes memory in the system.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -549,8 +549,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
>  		uint64_t size = nodes[i].end - nodes[i].start;
>  
>  		if ( size == 0 )
> -			printk(KERN_WARNING "SRAT: Node %u has no memory. "
> -			       "BIOS Bug or mis-configured hardware?\n", i);
> +			printk(KERN_INFO "SRAT: Node %u has no memory.\n", i);

... the full stop also dropped (and maybe the upper-case N converted to
lower-case).

Jan


