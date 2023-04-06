Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52056D92C6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 11:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518794.805660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLyJ-0001QV-Uf; Thu, 06 Apr 2023 09:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518794.805660; Thu, 06 Apr 2023 09:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLyJ-0001Nu-Ru; Thu, 06 Apr 2023 09:31:59 +0000
Received: by outflank-mailman (input) for mailman id 518794;
 Thu, 06 Apr 2023 09:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkLyI-0001No-3R
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 09:31:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df6d4c47-d45d-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 11:31:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB10005.eurprd04.prod.outlook.com (2603:10a6:102:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 09:31:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 09:31:54 +0000
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
X-Inumbo-ID: df6d4c47-d45d-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjJ5lKuGzxJuKMynp6s9tI0FCv0ig1su6zgBMKdjBtkQ8YKf3DGlk6mIaBFLzudZDP61QN1g03oegdIGYRJsm0ditPz5/fAq91NuJ7JRtePOuPXWmdGBtU4ebA3J4ICKx++XFnzOf71mH8n7mAKStkfk9B1dtkEz6DCqrnSBcBdS/KFH6rjksfh6U8zxu9Xca7g43FhqgcmR4fTzONlND64SlypI10/jHbdkydyRvMv9IzdIvN1KIr2kWR8+fsuOgbFC6izlIZSzErwQj8JEw6Xt+dtXmyRzdOBXtWO5LHe4oFj18jNQCNH4J0ciV65ik1xhQVJx1cQqCzlL37Ai8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9L2hFRv6P4F0H7tzS8f0dl8uOz+tEs6WwzZa6b6gSKs=;
 b=nXV2A2i6P+hMU4lbN/Yp6U51DBK5FNU9CXz02XFhvEe3RgWFVy8rr9nWS+RTaqI13Z1c5qdKMUstGhIA/gA0MbCXI0GXdrUxsF6xA/nuzoLTVcUxCB3RCoLLgfzP9rU/oTe7Y6LRKrs/RMK2iJVfFIbByQqnYnpPlxk4LMJJjO2rlPOXA1OWuJ+ORPIbFYJ89tQ9+VxuyMvf0C5yXvFV0gUXAVrMei0bJOr9UKHYt3gBB5s0XfCtWJfwIB/55NXwbQUsG2Uif0SdMODeKaf0pmu2+ejWfsFgfdkwfgva+i6Q06aWR7UwiWNaQZfJzaOLieQhqE1S+8ho+5f0T45usQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9L2hFRv6P4F0H7tzS8f0dl8uOz+tEs6WwzZa6b6gSKs=;
 b=xePubQNtrt7ggDcGOloQ5z1xZmsB/XH7hlv+c1xNY7p2mSGZ2k9fy0heqMgXFRnvhSGRY9laP8+/1+S04y5koiVZbKffKroHgO7swo7/I65hU4qeR7DBItroeFQYdvHXD9Z21ZdS+4zfSCA9KNdGEqeqtfVdSFf4zmKX36jALftU6FGSIWzz7LB0VHL8ryQ4QYJDcOk3IS3d6tmNiRF3v0x8nytMh/rSkeH38Kkw8oRFdO2cqSpMJcU+qMRUJ1RcdfLmEH+tr9j9FwMWSyIfhinVm1DtHuwNEQZiZvk2ev94S4qexBZf7+LauD9s+cDfqlWpfGhtg5Vd3Sa7ZtQf+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <313a2a18-020c-ca76-f620-f5694a74efeb@suse.com>
Date: Thu, 6 Apr 2023 11:31:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for MOV CR/DR
 intercepts
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230405204423.2113418-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230405204423.2113418-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB10005:EE_
X-MS-Office365-Filtering-Correlation-Id: 244fe29d-eeb7-414f-bcaf-08db3681c243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o+XMoBUObTM1601SPK4OlSsUgJeKGoK0G9wL+fMpgMZ7XcZEjhihUveUrAmLRfJOGeHtKEpeBBCdhHiK/GmJtJPw8RxD1sfgM6sReToplBivKOsQ6lgKbe4riigmLctxj0kWLAMR51mRiz+lyBvc5BwbERJj6StYkvoIzkUNEWGsaznUEF63iA3fRnIEcR9PaZGyOKm6xM2ZDdybwU8649qNjXhbKgE3n217TKcHD3gcJo3NX9QilCHKxAPekYxhd0NxzAs5dRS4biEbvhpce/vMkpgqiPesGDR6B7WIBXMInQo2ajVfMSC0HY6xin47b9Ql1woPm1op1Hg3I69FdNhfWc05h4LpnCDU9GhfBvf982z6a+miPgijajIXQSrFQJ2dM7XiXMhVEJU136d6/LyFP4kHFSB2YmD2jWq8GSgBvf5rRAdk53UWNFBYbqZ670TbTUzp8ImLBtx/nJE4HOg8sn4UUgCZLXxVcmJ/h4uZiMtT3pCBQKIO6g91+jx5TCk4xw9nLC6G1hh7V9wB3eFUTyAbxQYCyVjakqmwEOCFKPv9WpfpVsFBQVdSwnJyQfWcUpJRJMwH/do9QnXKoq4EuuiC7HLolmbfZU/bHiHdwHVvyulpoVsXDXWQB7fGR2qP8DEnNmxTBpujucyD3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199021)(38100700002)(31696002)(86362001)(36756003)(4744005)(6916009)(6512007)(186003)(4326008)(26005)(2906002)(6506007)(5660300002)(66946007)(478600001)(66556008)(316002)(31686004)(41300700001)(8936002)(54906003)(53546011)(66476007)(6486002)(8676002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmVpMWtoR2I0NVFBdWRHNko3a3hJbW9qcDZtYWJoTXk2QzhmTjhtR2FQRjNo?=
 =?utf-8?B?ZWZQcmJnRXZEZWhiTitHM0orekNZREF1YWRNNDBZN3lvTVdPS3FScC9Vamtw?=
 =?utf-8?B?NU5tbTJqN0pscmtXWjJtMHgxT2JsSUpxYmltTkVzWFJtK284MCtiTDE4OUNv?=
 =?utf-8?B?ZDI4Q2dnb3FTUWc5OUYvcFF4bTR3bExROW1QN2JJSHZUb0cvT2VNL01BTUh4?=
 =?utf-8?B?cU5FNTN0NHJrU2RwUFJHRTVqY2Y2K2I1dElaRldhdnRTK0h4cE05OE5qVDZa?=
 =?utf-8?B?VTc5dFZyOTBLNXpwWmY4TGUwenNnMzZJaEdxTzE1K0ZzamR4cFo5YXp2bXBa?=
 =?utf-8?B?YWVYOHZsdmlGYm01WkxZSE85NDdMZ2lIOXA0K3ZQazAvUWlaV2ZlWWdEazRO?=
 =?utf-8?B?TFhzS2dPUms3LytIN1lxK1BkSkFDekYwVTdabW9NZHQ0VlpMNmJic1pXMHhU?=
 =?utf-8?B?RUR2MVpHZ3d4TWsrR0w1VDZzN25sRDh2RUt2RkU2a0tidDZGaEM2Y1ZxNWlW?=
 =?utf-8?B?NUo4QTRFVTdaZHlJZU9adTBQekNlYVFhd3Z6UXdFWmkvOUVybWNsZm1ZeS9J?=
 =?utf-8?B?WXhCZ0QwMUd5SGtsS05sb1N2Vkt3ZnNqOFcwendTOVMySm45NTA4TEc1QkNR?=
 =?utf-8?B?ZWx2YWxTYTVyYkw5YUk5cUVPT1VvUDdxREVNTWhnUW85ajA2K0RNNlhOQTFa?=
 =?utf-8?B?YlM2RXFqa3NUOGRIbitvdWpaTkRYZW13aU1jNXRQZGMvbWpFOExGaFMwM0J6?=
 =?utf-8?B?bGNETk9SRC8yNHlyTTh1VjFDbWJmTjZkc0N0RExTcWRtRkRoMEdSdHRUNGNI?=
 =?utf-8?B?V0g5N2NXcnBaM0tkWjdQSFZob0hjN3E0QnhrbnV3bGdZZ3VXU0VSNG5qa28x?=
 =?utf-8?B?OEMvTW1xN0dtT0VqcjJVUjZhUStyVzdyS0N4eUQ4c2NBQlV4UWl6anpMbGRC?=
 =?utf-8?B?U1VPcURtaXhvQnZSSGxjZFZqbWsxVlNNYnN4ZDNLRTI5K0g2TTF3UU5kMlZ0?=
 =?utf-8?B?eVNsL2VEZk40ZXFIbkdBQ2lPMEhtdGhPNk5SeFFnRHBkdTdWWCtBb3FGVU5n?=
 =?utf-8?B?NkpZeFpLVnl0dUwrVmJwWmx6c2Z6N2w0STBXOUtNbVU4dkRjcFRjUkFFdU5y?=
 =?utf-8?B?c2tINlF6NDk3SUV5NmJSN1M2STlnNlNoMmo2Q0hubkNvblpDSFFITlFNYXZE?=
 =?utf-8?B?dGsra0pCV28wd2djWFVTU2ZiT3BQTWFmbXREcTRwV2xJZXJPOFZRVC9sQUVQ?=
 =?utf-8?B?MlRNSkF3WXdydWw0a1RXYnpUZ3RiQUd1SUR1d2JoSDREaUhoRUkra2x0eGNk?=
 =?utf-8?B?Z0NiWTV3eVF2NlBFeVV6Q0Vuc3dnS0xGSnpFVjhhVWt6cXpGbU5YM1U0bGI3?=
 =?utf-8?B?eDRDdkhyV1NiU3NZYm4weGQxSnkxTUYrS29uaTNjYlNrUlc5aE14OFNQWFJP?=
 =?utf-8?B?M0t0endVdmJpbFRZM2ZqV2treDFhTWRtN2ZtNHNEbnNxUmQ3WjYvMktFVnFQ?=
 =?utf-8?B?MG9uYmVvZjQ0Y0xHK29jV0hxdUFiMFJFSE1kZGZ4ZkR2TkVPSzBoRGdzdXdJ?=
 =?utf-8?B?RGRzL1VPTnQ3ZkVNeHVvUlFVZitjQ0xMYWM1RUkzOUl2ZG94Y2lxOG5iSHRM?=
 =?utf-8?B?TGV1cS9TRWY2WXE0REc1THVPa0h2NmwyZ0phVUVnMnBTRE04bUl4YmJxZXg0?=
 =?utf-8?B?RGE0U3h2UkxoQkhCNVlFTHdOdFBLQmRKZUxqZXgyU1RRNTlybEN2bXQrSmFE?=
 =?utf-8?B?cWxVWVllQXVvazJsSUZwL1RlRkd4RDFUWE5hOXFLbm9yNzRacEdMeVlLNFBN?=
 =?utf-8?B?ZXRTRGtxeUFQakZJYS9xWjNrNzhZa2JUTTdpTy9rYkRadkEvSlpBbGRQM3Qw?=
 =?utf-8?B?WW11ZWh0c25nUnpGM2xvZE1ING9zQXYzVURIZDZQMUdXc3doU1E1RjJJeWU1?=
 =?utf-8?B?czRuOWVMKzJPV0hUb0Q0QkEwWnFTQjZpZTNUMm9NNGFWdTUwQlBFdUNPVlZw?=
 =?utf-8?B?a240Z0ZYc2NiQnZ3MUNnc1duL3pFMjdNQlkrem1PZUVFVG5Dd0Y3L1l2N3Rx?=
 =?utf-8?B?YnpHZTRZZE1yN0F2anVkZDIyZDRqSnhLUWd1cVVGaEpKS2FJa1dYY0tGb3Zh?=
 =?utf-8?Q?2KjnB/YxPy4elFZMzoTH/DB1u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244fe29d-eeb7-414f-bcaf-08db3681c243
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:31:54.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCzUK8qWMIuLtNu2WlU18xzKwmmhgdW9NTOTlvOa/8pOfmiwHbWUfOiaPA/SwNCTokFiioFHSaYIRcyziyy1Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10005

On 05.04.2023 22:44, Andrew Cooper wrote:
> This removes raw number manipulation, and makes the logic easier to follow.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One remark though:

> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> @@ -450,6 +450,11 @@ struct vmcb_struct {
>  
>                  uint64_t nrip;
>              } io;
> +            struct {
> +                uint64_t gpr:4;
> +                uint64_t :59;
> +                bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
> +            } mov;

The field being named just "mov" makes it apparently applicable to DRn
moves, too (and the title supports this), yet the top bit doesn't have
this meaning there. So perhaps say "MOV-CR" (or alike) in the comment?

Jan

