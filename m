Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8FF3D34B8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 08:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159983.294224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6oj1-00050q-Sz; Fri, 23 Jul 2021 06:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159983.294224; Fri, 23 Jul 2021 06:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6oj1-0004y7-PE; Fri, 23 Jul 2021 06:31:59 +0000
Received: by outflank-mailman (input) for mailman id 159983;
 Fri, 23 Jul 2021 06:31:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WrFY=MP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m6oiz-0004y1-QR
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 06:31:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e596dc6-efe7-4ff0-9e1c-469cabc879d2;
 Fri, 23 Jul 2021 06:31:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-Kdp5ZQ2LO0qCCNlYN_KBeg-1; Fri, 23 Jul 2021 08:31:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 06:31:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4352.025; Fri, 23 Jul 2021
 06:31:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0171.eurprd02.prod.outlook.com (2603:10a6:20b:28e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Fri, 23 Jul 2021 06:31:52 +0000
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
X-Inumbo-ID: 1e596dc6-efe7-4ff0-9e1c-469cabc879d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627021915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGhPHyAOH4xHo0Etys8GzaCa69y9fc8GbAxJTiPSapc=;
	b=Tn8fM6tahP5e0R94X6h6Nav5FmvkoWmkjwRzXsuzGRpU1gyKxjM/tJQKvKIi+DrJRLEViU
	tFQY27Ox87gz1QXri0hm3dIvc2tf5gMdA1oYeBpf1kh9ev7FYHGynn6HNHX6upvT7ovHUz
	a7oJDmV+pood65j6ANy7XY+Qjz05Cro=
X-MC-Unique: Kdp5ZQ2LO0qCCNlYN_KBeg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcXLYPr9IzLG7HOtuCZq84aFOMdMGw6JWb+N5wT5UndDO/uWN+/mbgv0w7bY/+c/wciwdJ5wKDh+bRMDvWSNShNGZMniFa2N0OBZEig+As0egSXQ+bn3++Sy6YNzrcCcMdlq/wRcpelBzuCny6Q1Xi9TKvbnHSxoI5tdRdd3p1/CX/uDr5+cxV/gMtcItU92lTz4NtWIk07jw/Oh3TXdYD5xudWW+qsH0MphNJonR/n7WwauwUkeAsXMUrV4Dndeq+HeYAclLpiZyEy6FaaXapq2ITY/YD/MICwJlts0TBVH00cYbpk0zZA2esErf1hqZZMErnDi/6nw3AEWcjxGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGhPHyAOH4xHo0Etys8GzaCa69y9fc8GbAxJTiPSapc=;
 b=CMt2T0Kc5GlyV4orQeu2hxk00RJ6ccs8wzH1wqVvb1AVnw+NuKetpip3FrNlLhwjJz1/8OAyt53fzUY4tMed13rq1aXjt1Oxt+FMcKpb5puQXbEv+7lJlqZY7Yg31hSd4u8lqZqe01c0j4STB5PejbbLF88GeUIDmM6xo7JXecJRnPFGV/d/I1n8RfuwPHkq3Iug9e+Rijqgez9O7CBVSvgV68xhHFGJDEQR+Pz+iCkt71SBYkWgtlYD6vnuiCjQk0PYGUocKadFRW8baLzCGCVhvrjQSDG3IodYc8EVlUwnPmCjdynOZtEgefhstM5N578SNc8JWhmCDAy1s6jOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
 <20210722233642.22515-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97f0713b-f6bb-72cd-f364-f0d42c868171@suse.com>
Date: Fri, 23 Jul 2021 08:31:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722233642.22515-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0171.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d919531a-e5a8-4fc5-7a5a-08d94da38f60
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325DBDD18DE96308C68D6F1B3E59@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R4zS/iVaWqzbeH9rsghLNLDluWDJCkusG2cxhAr48zgO00KoJXinSx5RnI1+XbB6DxH3o0ep2+PuLW9xVJjzsGvdqNzm9PLHmqz6Gc55Bv6GP5rSGDDeYnzRoie2wVP7YV8Jn92dYJbNxRljvkNxqQVfOIN0tpJriIgT2CdX1CYjsQRcdxNMrk6cS8gOEkVy0YjE6jiYbFSkErfLhTlf5RcVFhsqIvYl8th2jEAzq7PHNN8tpvtLBVVKP71vvIAgpjudCQG51sivLNl8/EE1tUVRZ91YyFJ84PyDWUkQK8c/lX8luoR9Jd4Lt8PVvUWOdq/NKTRuaa1c4zoAvBXCcYp+uYc1bU+p8nALfsraZRThHL9avcfFtQj05aIWhr7vpV1my2tRVTxCZyvuaC112jM/d6UCYWsFRz9z5yXvhCmNM82WmxmXw1YaaixNviQlJjbuYXOTTGSoB3iuh1BsTkL4R5z1IquiImmQSiGhQ2+mL/1eR0hHwIswnnqftAE7EZh/hgGT5l3TrzsVmqsSSkomNqh2SnjJBVQjd2+TakRzbjff+XyxqC3eK/UXeaVWShX/CjyuDJvHlvxNw4qZVgNvpL5f4/JjQCbxhjinbLIwEQPCRJIjkjZscy041z0ZHhAurMjjNWs5EiaBO4i3abboSE/ZPzVdR3zhHE2l+8mrmA0T4Fl3cp3yBbZ/2Y+To3ihFlL/8hFTy/xUlM/M3w7QllYsT9ZckzWQSYa0vJQqDloWZYSuSazhUW87im2F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(39860400002)(366004)(136003)(31686004)(83380400001)(6916009)(53546011)(36756003)(2906002)(186003)(26005)(316002)(66556008)(956004)(86362001)(2616005)(4326008)(8936002)(66476007)(478600001)(5660300002)(8676002)(31696002)(16576012)(66946007)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFpXNUtkN0FWN3VTUHZncE4yRW8yd3N4cXZDUWdjOWk0SEpOemtTWkdLN0pX?=
 =?utf-8?B?cENIRlZNQXliaUt3dGw3cWVLbEs2TzBCNVgweS9pZlMvWWRFTDBPSnFNcUQy?=
 =?utf-8?B?ajkzMHcxTEpUT3V0ZTg2WGdRSFpsL1B4RDBOaHlTQy9xdU9yM1RCNWhMNnYz?=
 =?utf-8?B?ZldqRzFrQ3h0UHFQSGJyV0NNcFhtMnRhTnNYdjZtejM2MDhOSFRjMW5JYWxi?=
 =?utf-8?B?QjhVT0R0cE9ZRndsM0lBaVUrRWhDbW5JdXdPNkxkQjFHN2NLdTF0OXJYTUFY?=
 =?utf-8?B?RlZ6OVoxc2xrM1N2aUMrR0h3VmE1K1ZJVEd4aWlZMUtFUDlqK1NZWm1FMFdC?=
 =?utf-8?B?bVVFN2h0enRLODdHSEtMakNRVnFUeG9CWlJxM0lub2VYbWszcUtVdzJrNWVB?=
 =?utf-8?B?bnUwamRDRXVxVlI0ZDl0RlM0QmVjbVJINDFseTFQcklXL05XZ1JMcHBGazdj?=
 =?utf-8?B?L3JGaGpYMy8vdVNwL01lOEhiL0xQTW1DNEYzRGdRY0I4RlpNQm5Bc1BKMzRx?=
 =?utf-8?B?ZVhhQVU4c0luNTdNb2p3cHFKMzQyQ3M3b09qY0YrT2pEZVc2NldvYml2K0wv?=
 =?utf-8?B?RTY4SHFORERwaHpYK25hTy9wL0pmNlkrdHAyOUcwOWVpN3J0ZE4wRVJWWGEw?=
 =?utf-8?B?M3VZcDRNWGc1K1ZxaVFXQURlZ0FGWEZtc0ZpZnJRWjVNazZUL0sreEFmenJX?=
 =?utf-8?B?bzRrZUE0aG5Yd2hScnhCTkNHVklLdUlJbFFaQzloNHMrZDFCQW8xTnVLSHdL?=
 =?utf-8?B?WjZid3BzMFRtTW1wVGl2N3pmZHBtVWJkNlFrSkZhNkFFQk9uR2NOOGN6d2ww?=
 =?utf-8?B?M09kVllSdmVVbEQ0eTU4U2V4N3hoRFdmMUlLb216cDk3NTBRMVVaZlhiZHcr?=
 =?utf-8?B?anc3Tkw5SzJpcFRLWkN1My95ZUluUzdvc3g0ZDZ1cUpWWHp6YytqRk1QVGho?=
 =?utf-8?B?QkY4eGkzcitrc1BNTDZNaE15VmpmTVN2N043bnBLVFpkT0lJbkpudkJJMzha?=
 =?utf-8?B?TTFtbG8vUHJHdlo4bk1CQTAwaC9IcmdLZzZoMDliL090aFhvRDlmMzMxbnMw?=
 =?utf-8?B?RzlkSVRrMUVzd0pndEwzWHNhbDJVNGJLRlNINkJtT3R1eDRXWEtoL0swVkZH?=
 =?utf-8?B?eTk3VVpyYzdiMkpyZDBGV2xYd2NMd3Z0NUpod25nWkhNb0VZNFVZdjlKa3J0?=
 =?utf-8?B?ZkhmOSs4c1FFbjJNUVVaYlh6NDFTMFBBM1BuWmgxVFFiYkltWnJwZWZ0SVdV?=
 =?utf-8?B?aTRGenRoZW1xZlFrQUN3OHBMSUxMcjhiTGxybVdyQk9YWDhzUmJLNXFJZzdq?=
 =?utf-8?B?djJCMUo5QmhjQlpRNmdEeEZjWUoya0J3QTNIYnRFWHZYSXRNZHpPVnplc2Vv?=
 =?utf-8?B?WlNxRlRCZ2VvSHIvM1R4YzFLZGVvUzA4OWpCT0VyZmxHaTM0M01TTXNmWDVN?=
 =?utf-8?B?QjZDMzZMWmFpQVRlN0Y1dURJN0hQd01pQmtycXJ6SUhGZ2dQaWt6TlBqekll?=
 =?utf-8?B?QW9RUXlrV2pLNzhsN01pV1dDSGxUbTlMMTRzRkYzczVwdVgxWjgwU1hhSUdq?=
 =?utf-8?B?d1kybXY0RDgxYmd3YkZOV1hxTzhLQzZtdHhReHc2eitEa3I3MmRJS2lzTUtP?=
 =?utf-8?B?cUhEL3owa09PS0JoWnlDOW4wSSsyT0JaaDNtcjhIaVVmVUxTTlhEODZTalZB?=
 =?utf-8?B?QTFub0xhMzdpZllFZmJwYjl4TGFQbnQxSlJsaStoNWR6LzVQVFhiMi82VUcz?=
 =?utf-8?Q?Pf/XAkd3b5klGfbTZ6G/qL4/+rFQ10bcbypsZBu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d919531a-e5a8-4fc5-7a5a-08d94da38f60
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 06:31:53.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwYyDFnYFbZmdRY/8aDz+1rOMSsgeIgCxX56KW/zPL6xlmH/UrX5GDsfcIQ9wJA/g83/VhZn7Xgd5KSTVl6XJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 23.07.2021 01:36, Stefano Stabellini wrote:
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>      if ( !ops )
>          return -EINVAL;
>  
> +    /*
> +     * Some Device Trees may expose both legacy SMMU and generic
> +     * IOMMU bindings together. If both are present, the device
> +     * can be already added.
> +     */
>      if ( dev_iommu_fwspec_get(dev) )
> -        return -EEXIST;
> +        return 0;

Since the xen: prefix in the subject made me go look (I wouldn't have
if it had been e.g. dt: ), I may as well ask: Since previously there
was concern about bogus duplicate entries, does this concern go away
no altogether? It's one thing for there to be a legacy and a generic
binding, but another if you found two legacy or two generic ones, I
would think.

And what if legacy and generic representation differ in some way?
Shouldn't you limit processing to just one of the two categories,
such that no legitimate "already present" case could be encountered
here in the first place?

Jan


