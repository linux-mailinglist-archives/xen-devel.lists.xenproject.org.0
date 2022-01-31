Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0484A4018
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262916.455378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETse-0005RA-4m; Mon, 31 Jan 2022 10:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262916.455378; Mon, 31 Jan 2022 10:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETse-0005PH-1h; Mon, 31 Jan 2022 10:25:52 +0000
Received: by outflank-mailman (input) for mailman id 262916;
 Mon, 31 Jan 2022 10:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nETsc-0005PB-Bb
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:25:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 289dc2cc-8280-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 11:25:49 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-DwoB-fMENKyyZJ_g6wpdfQ-1; Mon, 31 Jan 2022 11:25:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5141.eurprd04.prod.outlook.com (2603:10a6:20b:c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 10:25:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:25:46 +0000
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
X-Inumbo-ID: 289dc2cc-8280-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643624749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCX8xF9FVUPpcbKKhu0HL4/O08CoxLxbKuHiVC4DxqU=;
	b=bla+Cyzye6UsPkb7dgl6r3nqu3BgGleynxZjCU2RA2uzfWsuxyQ9nPuyaPOSwAQydfffCf
	yvZP6AIXiHpPmqE9Jb32qoBJG6LpjrF3f3XwybEXSvFCICEWFI3PKRMjDGxY/pXId5T/+G
	tt7+1+XMhFxbbJzGoH+Qk0ScOvwBADw=
X-MC-Unique: DwoB-fMENKyyZJ_g6wpdfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bw0/y8FNuNuWZ8m9ejuUICez+i5a/2ONCOgPswLKIpSit+uIT1DUn4xFL9CeSPWZeHKq5vckHIrcW9aZgIH0Zzt29ONlWjccwDGPvUoR2qn7nmP4wSo3Ucdr/BueXPixit54n9WA0NXNUwsUKfzWfwhSh4xWoZl86hnKrI4aFplxfe8FkWqJtrsZn0R53i4z8qL/zkWx2s8mrq0nvPR7ZD43Ju2iIFrbRynKpb/gxsXnX/nUEZAOcmx9QbDAIp2qYHJP1g4yNu9QKsMwbEIGPLdxsNfbw5f+Ss1Xz1fT2ZvIOgWYhJ127em1AL96GLCdBekhIp7/LFoxXyqyhhBTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCX8xF9FVUPpcbKKhu0HL4/O08CoxLxbKuHiVC4DxqU=;
 b=mGaWQS1PPiNA8w6Z8O4xRYAu6NfdknUblqm3cEtiN/1KvFLiJkxw5pJd4SyFhL7TevR4GriAXCNV/Zdi5MdrYVc4Kg2Z9L6kwTNnSVh5GnVkAH7/giCGPcFrYNf8aKH3zC9P929RmglAuqDzUUX9HT42e3Wxg0ea3ALtpWnXNfErdn4BxJtdaPSfpS5p1lqORfah9xmzeUgVyEqH3p4F1N7tWtUitcxlohnsOtmjjolQs2FHuub062CrhA3ATT7IJOgEC+mx+r9SF2FvguA3JL3L40ryEJ6VONtTtNlsjZ3aXsKjATD6KCJU5ihMo9sfM5MqdNfDhm7D41lhanmBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2be488b-2d32-4450-9475-3372815e3ea3@suse.com>
Date: Mon, 31 Jan 2022 11:25:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/9] x86/spec-ctrl: Use common MSR_SPEC_CTRL logic for
 AMD
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128132927.14997-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0398.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cf4921c-44ab-4a93-7738-08d9e4a40b23
X-MS-TrafficTypeDiagnostic: AM6PR04MB5141:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5141D693BEFADA818EDB20E6B3259@AM6PR04MB5141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yRhmIdQTHRpVqkfOeDN+t0zKATMyPBWQ4SJJc9GCo553+AvbKmefqb7AmMDKoffL1IDd58IjBsXKH8RA0cXOMhwT6aWjK+Wv+8o0h2Muigx1a+Nbe10dXldA+PKtl7BtNaUd7Kxo1Rq4JHyp7AE/dXghUcoGKXuUPVCfrYTB5x2Yf+9zGyiSKU8HbBWkh2oysiLezssoRTu1hSaSrbbYh2uZK0Q53YFQ2udAfQYxAoU5mq+B5zGWEwG1b1YTzX+uDCyoNUxN2WHXUayWmM2yl+xLQ6TDjhy+NMJu9q4Iz1OzPSUqr4ot2FYglvzDSHZngfJrv/cvnJFb3QPdzJEXZInZhn0njaQWbn7E05yi8iDifW3brmapWkq9pqVku6/bxxfZbKJVz1nmjBZVkfJdsV5lkbsSoulZmmbsTbIuuXvTZoVMCCVDOfEv1bJzBCDeSJWKkho5z2LDGRyjMKOTPA4bcpVks9s8qxHseV5K6N5abpgcYUXEm2QjqIhe52WwEVX0cngknKXt+Pe7T4kOfPbOTEo9v82t5iLL+0khGeOUtgyGhpl0CKhTm3i01ka/4Acmn4p2lWCSqtmCwfzlY2t2Bl4jcGNHZmX78b5vREDnsAVGPv0UFvI6vi+7+iN6wrOBhOiZ844/jghJdm8eAkySFHmX8C8muGuCoWCMdBEeISAGSqkekAo4dysys/L14MBRF5KdTrlMVf7zlMM3w/HpA53kbXgDtSuDSBS5obM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6512007)(6506007)(53546011)(83380400001)(186003)(26005)(2616005)(4744005)(2906002)(31686004)(38100700002)(316002)(8936002)(8676002)(66556008)(66946007)(6486002)(86362001)(54906003)(6916009)(508600001)(31696002)(36756003)(4326008)(66476007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXJocThlVFJVeDhaeE1JVXN5a1RrYjk3VUVaY3QrRkY3MW9UZUJvQ2tkUXNX?=
 =?utf-8?B?STZaTWpVVHNidnVxeUkrdlQrWkxqNUJYelYwTFovRUdPeE1qZDdJV0Jkd0Zp?=
 =?utf-8?B?YTJiL0pvK3dVNUxEMXplMXFHeCs5emYvN1A1SHBndDgzWU5YLzNqS2FTLzZY?=
 =?utf-8?B?QThGUFl6bStINkl1Z0dxNithd2hPVGI1d0Q4aXhmTExweDIrUXhTZFUyVWxT?=
 =?utf-8?B?TDF4MXRYay9zQWRDeXdYcjBFOWFMTEdVNjNCdmdNR0ZYTFV4Z2IzMnNQY3RS?=
 =?utf-8?B?QWRKZ0pPdTBiSkNOQ01Ya2tQSS8rdEZuWlQ2SWs5dEFjSDVHanhMUWsrMU55?=
 =?utf-8?B?L3BWMUhDNVlsbytOcGN5d1FML3o1ZUQrdFBLc05vNWgzT2Z4SFhrdk5YQjEw?=
 =?utf-8?B?aGU5djNwa3dwWFpsbG5YdUdFQUpzdUZhekQ5S0NNM1V3VUZKbXdlQlZ1Z1ZX?=
 =?utf-8?B?SmxhVGlVdmlZMTkyR0xMQTE2TVJETGJxUGZjVi9BSlVqSS9ZcVV0NGN1djJ1?=
 =?utf-8?B?UTJGNWZ5djY2ajBnNEZsTnQ5N2MrRmFsWmI2cXFQTGZhYVB2RjdGdWY3eG5w?=
 =?utf-8?B?SWFubGtsYWMrTzR0TWpnVUYwUjZLWmxhMlpzeDN1TWlFQXp2TEg0dDJGSGJv?=
 =?utf-8?B?UTJ3TTFyS1d5c2FYZk1nbmZKbVh6WmdDR01hWG53VXVOY1RmWFNZZmNSV1pO?=
 =?utf-8?B?cWgzMHUvZnhaNG5IVzFqMTJUMHB6T2VYa01MSHp6SFBYQVZVMWJOZWlEaFVL?=
 =?utf-8?B?RWdkNERTWFRCZGdpa0dmbXpDaWRQUEprcGVkejdmOVJjWmhsTTJ5ZjQ3QUZ2?=
 =?utf-8?B?SkNzb0RnOTQ0Z2YzV2Nzejl2SkxJd2dDa3JNTERiYkJTTVZ1MDNkN0l0VE5U?=
 =?utf-8?B?a0hIUVAyYnpLSlhyV01YYWpuVzZOdVlORzZkMVhNY3JaYnBlUE82NG1UTkRC?=
 =?utf-8?B?Z0lidktham02MEUvSDRVN3hBTklibUlFblpaMm1hb2ZBTkhNSFJGN1pWSkhm?=
 =?utf-8?B?NlhYNCtGMVovRm5BakZiVHJQZ2M0S0ZrMTZhajVOZDZleVRTNmJiemhlL0p1?=
 =?utf-8?B?aUN4ZXkxaHRBQmZYUjhwaWYrbHRJN2M4NFAzb1NXTDVyTXFwTlovTnozY0hQ?=
 =?utf-8?B?ajl0SUJoelZqcTJabDlGZEdXVEE0MXFMamF0UnlINDE5bG9sa1RqSjhJdEY1?=
 =?utf-8?B?YUFmbzJyck9DOTBaZmlXOGw2WWdTYjFnM0IxVmpMQ29TWkYxSzdtOTMwS1Nk?=
 =?utf-8?B?KzlkdmRBYURiMUdYTy9jM0VHc3RYVGtXKytnK0xxVDBDdHJhdk80a25qVmNQ?=
 =?utf-8?B?THQrK0g2NG5kZVhwNTJ2K3JGRklyQ21hL0k5eFIvNnNJMGsxK2JBNXNTS25C?=
 =?utf-8?B?UE5jd0huUTZNTW1PSUpFYTlsamg4NWl2Mkl6RU84ck5pcnZVS0poelFvWDh6?=
 =?utf-8?B?MjVSTkp5R1liK2RRcEwraFY3U2hKL1VqN2FvVk5aNVZnWGlrSm5KUCtjd2Q0?=
 =?utf-8?B?YXQrbE0zRXJmUTJYWTFiVHJXVFRwQTVLdVZ5V0pKamh2dm11YTZGSXdMNTNI?=
 =?utf-8?B?TWZvbDI5WUJDazFpQ05hc1VYdGxROWh5bS8zRzFrSmlMaGNwMk5NWU5kclFC?=
 =?utf-8?B?TlFsa041RzdSUXVCR2wzTnpVeEFNdlU5N0FwUUdEWVFwbDlLQy9KcGNjemVS?=
 =?utf-8?B?NlhBbzZrWE1uTmk3NDJxbjBrTEdtbDZRTEJBWFZZMStFNFJ5bC92djQrZjho?=
 =?utf-8?B?VVZCRVNZRHB3Y1dBQlAwWVdDUDdlbHRTcE56OXlhUEYxNW1ndmxVUDdLWStR?=
 =?utf-8?B?Y0FGQ29NNEI3N0lrWW1TMDBrK1dqYnArWkxOM3NNOUkwMnlwYTJldkFVVnQv?=
 =?utf-8?B?RjVtdE5wUmczQ3IvbkNGeXVCSFIrUG10QXlWaUZBQVdFcG43SERzTXJ4bllN?=
 =?utf-8?B?b2l6VGZ0am05RzQzNUxxVVBsbUhHRm0wdFFmYzhKdm1ORzlEMmxTNFR2Wm9E?=
 =?utf-8?B?d0xyL1NpUEhPcVJETUZraG9sSjZPUFNFTUxTVElveUw4dmlQKzB6bDBWbGs1?=
 =?utf-8?B?YVQ1S0M5V2l3MTl6WTl6WWVpd0RUODNRYVFSRjQzbGErKzBYQVo4UWZ3RHYx?=
 =?utf-8?B?dUZJemRrMk1rSHQrRHlwbSs4UUhseENoQnFoZ3l0QWdMR3J3OCtkMlQzVm1Y?=
 =?utf-8?Q?Crbm9/W4CjcVTi3QOdeZyNk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf4921c-44ab-4a93-7738-08d9e4a40b23
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:25:46.3997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0c5KIeURWvNf8+O6eORwmp8+/Fino8mrk+mtzcpjFC44XxeTTCAZvxthK2M/Y5c/vV9hK854GGyxG1hlHzU6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5141

On 28.01.2022 14:29, Andrew Cooper wrote:
> Currently, amd_init_ssbd() works by being the only write to MSR_SPEC_CTRL in
> the system.  This ceases to be true when using the common logic.
> 
> Include AMD MSR_SPEC_CTRL in has_spec_ctrl to activate the common paths, and
> introduce an AMD specific block to control alternatives.  Also update the
> boot/resume paths to configure default_xen_spec_ctrl.
> 
> svm.h needs an adjustment to remove a dependency on include order.
> 
> For now, only active alternatives for HVM - PV will require more work.  No
> functional change, as no alternatives are defined yet for HVM yet.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


