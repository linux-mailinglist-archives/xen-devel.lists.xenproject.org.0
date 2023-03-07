Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB36ADC23
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507291.780602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUlb-0004IE-Jn; Tue, 07 Mar 2023 10:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507291.780602; Tue, 07 Mar 2023 10:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUlb-0004G8-Fu; Tue, 07 Mar 2023 10:41:59 +0000
Received: by outflank-mailman (input) for mailman id 507291;
 Tue, 07 Mar 2023 10:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZUlZ-0004G2-TF
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:41:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae8f998d-bcd4-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 11:41:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7944.eurprd04.prod.outlook.com (2603:10a6:20b:28a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:41:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 10:41:52 +0000
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
X-Inumbo-ID: ae8f998d-bcd4-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZiE/b+17TCtp/z+F8emLLGZPFR56ibsQBorijd4Lx0QrFzk7KL1pIs59Z410kV2FbYcq2jnfK1rXjPby1Gxyif+Yi/Y4lidPj2luML5BIagFnyAi5jrONRdv/kb+c6nQ5IgooTWxzBrtxYQcvZAG/6hmM+mlyOR6T+KVmMNw2Zu6ZwmeehUibOjZ4p98NfNgXC6y5UYgxwhwxRcGfiynaJP3DRlHGN5bRGGMpgEFqS7HJdIuxrEIq8dvFPpM7MKzEYJh29gLn8IbIS4cXdS1MrokNR6FfRvWJzUejfN7z52UNIUyltOi/VkXrTGhxRKfQnIr4ID+4+9+VdstgYW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vot0JgLF/0I33rTC1XX1SQO2E/iURNot1FQyTzig7xs=;
 b=H8FZdQAw9BYDvVDgSPoThVZXzIilBaw1sHRDo8gsuGj1UmenNCj8xf7f0WtA4HzrbML+N7sFPifxKwsPLbDTxyq82WkNJDyvPh8IkNW7YrpxH6eVzAwAFg2z8GfmGZdZbctCabxaMwB285Oil6gnUosHi+derFKPYPg346P0kdrTbTP9ouliiWzzArc/1EMdEcvo7+lGTHjRu7N5ZOlpF+xvPfMO9a9q7ajwC7+mX05cGJml/MHjzWKaefFIwoBXUDO3rWQx3MPMurvfq8OheLAwHZWjtSoplFGoNkRbQL0iLGAMEqkGGi1psdbCMEHKjYUC52DqnOY1ke93IsiFww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vot0JgLF/0I33rTC1XX1SQO2E/iURNot1FQyTzig7xs=;
 b=sWa9blhHHSr/it0v52fieMmpeMe588iNkt5GbDvQR0ZwaLWmHSaUWGLTw7H9dFy2UNMCnKOEJCW4l7LRv/9RIqhnVnZd9s+8vaa43dT0HBvaHuuWIUDSHRSaVSk8GGOBN/6SPlPiOahQxi+NOiOMD/yuz9rJDEjqiJ3vhryWBODx/oBIWSiNkWMGb4r3B2MitSVYk6XotDBEETqHYgPwdcPzGcUwmTSYAg7NBgY2vBJU6nN0VCkurXt9dXjNJO3WmGex3TCyTHCBOjhVqzSrKgWMCa342uXLDs61rb8P/QOc73CersYbtZy3rFJEu2wFzK5ZPyS/EcwEhXXb702yQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
Date: Tue, 7 Mar 2023 11:41:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230307063214.30569-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 879c2b7b-f87c-4e2f-0375-08db1ef89028
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZDM8i+4ldixpxPje2ZvDP4uGnAcxTM/j6MJPyKZLQJAnziR0VyOs0huWBIEyZ+3UomGk1h2nY9ebxymm0X9c4toqboOqq2ZcPIBWblrkByN8QDtW/VqhJpiFS96SOGwAVW+yDwzp0YpKqnIhj6Z30xu8WRl3843L5aMKLrFeh/OxHwwviTYrX4kSWxPmstF5p4cMiRGiB+5UH890mrq8XsenRyFLKNKcSejp8lpkjyxxNNZp1SdJ+040syT7YFMO2b77dW7va904J595T1ri302yMC63zf6dboXC5yraZmcB239tVQgj3VD9rEVriZRPJXA0e0rhaEalLaixt4R3xUEO4wd0/WgHo1hNafRegJWGQ6sVGFWTDFCKVPBZN3jm/A/Yh+uo7miKyjufitwGV9qzSMZVHM16Vxw/fJtFp1szbJfXXnILfpm5KW54gnTp2J6uLRyE2wEOp5T0zIe0eCUkulRC5Tp54LQ2Ptbm8BdNAvvw3LlU6PHgMWfwHT260Fp4EY+GmyVPppa/2arTLBHAmQOiMKrhFGmHKTz51V3hYNRiqIFugobwlG2lwDHfcrYV/LD8U+q8jvwbyakWqkyg+qirMLluMFilS5eG4oIe1ZU/2iNMypoVNAficaeXO+c9e+HAPHizg1wQMdOuFPc2pyeQN8YFKO6cygnX9fA4RYf5XDTdb7onSwdnu3lBhzAuaPHde0SYBkGgKS1cDL4FM1vC45a6sUaYHbO6yY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199018)(6862004)(5660300002)(31686004)(8936002)(8676002)(66556008)(66476007)(2906002)(66946007)(4326008)(41300700001)(6636002)(54906003)(37006003)(316002)(478600001)(6512007)(36756003)(6666004)(26005)(53546011)(6506007)(6486002)(2616005)(31696002)(86362001)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmppOGJqaVJ2QWd2Vm1HdS9RRFNOS1V1ZkE5MzRhcXBGM2U1aTBKTERhV3Rl?=
 =?utf-8?B?eXJwVVlTVzMvelh5RW1CTTJpYVNlSXJBSTQ0bWYxVURtMkxpOU5nT0NQOG9L?=
 =?utf-8?B?eFZXNEl3K1pCVGFudEp4Q0N6S2pWajA3MU1lUy9XaTN2L1lVcmY3YWlEazJB?=
 =?utf-8?B?SkpJNm1xc1ZFU1Y1USsrMGQrcFY3U3RZcXZWUjZmZ0pmLzllNFZxM1VOTklN?=
 =?utf-8?B?NkZZd3luSUFXSDN5OTg1Z0gxNUhBb3doYTBMY0RkdG5LeHJ3NUxIdnNueWYv?=
 =?utf-8?B?b3o0YXFVWEY1TE04Mi9DeUVmVDIzU1JzdjBGQnNtWWRWSnFJbVRwMU5VSkNQ?=
 =?utf-8?B?RVpHSGxsU3pUQnZGbGd3aU9QUFUyNmE4OFY2UG03cUU1V21SY0RMY1VJRmRZ?=
 =?utf-8?B?VUttMUh3NHVIZG9vdTFRL3AxaHFBQWRHQ2xKWXlJQ2Nrczk4Q2ZicUVtbVF2?=
 =?utf-8?B?eTByN2cxRkk3dzNZUzU1R1JOd2ViV1V1ZnU2c3o0c3lTcUdwckx0MDJtWEFM?=
 =?utf-8?B?MG9HdldheHpKMGt4Z0lHU2tiZElpajJ0aWFSY3RXQ0tZdlNMQUlnWWh0VmVh?=
 =?utf-8?B?bVpXSDFpQVNVWCtsZjR1Szk4SzZnSXM3U0VHT2Jzb1Q1SFhldVFqeVh4SWlP?=
 =?utf-8?B?RjFta0dtL1k4TmcwNGwzV2pvbGxKYjV2QWZwUDlvK3pBYitwVkFKWWhQa0cw?=
 =?utf-8?B?SklOS0pPNXNaZGtVTzF0dzdCdzlSZ2VXeFVUeE9QTW04L2RDWjJ6L0hvM3kz?=
 =?utf-8?B?eWFBaVVUOUZLWnVOWEx1dzd6ZXJ4YWNJK2cyNWpLT21VTlZ6cUNweGh2b1JE?=
 =?utf-8?B?dGtKMzIyMTN0VnNGaC9DVnYvQ1NRUlJYclpjWkRYbkRZaXl0K2JTVnIxSEly?=
 =?utf-8?B?SUVUc0FIUU8rSmhKdGpPSHRUdWhQQWlDbkdFenljUThzbWVCdm8vODZzV21L?=
 =?utf-8?B?d0Z5SW9xeXRRdnJEaStPSC9COE1OUm5hZFEySS83Zk1vVmNGUGhHZlZaT21r?=
 =?utf-8?B?QjNqbytWS2paZTgrRTlkN1l3Qk84U2M4ekZsV3N0ZkM0NFF1dXhVT3QzaUdw?=
 =?utf-8?B?TUd2NlN1Skoxay9tZFhsT09RcENtTGI4UkhaT0dYbFFJeFkrVUgvQWpWOU13?=
 =?utf-8?B?RUhRdDIzbzI0bXZLWVV1c1A3alovd043MnhmTkdHeGJDNG16VFB3aC94Nkt3?=
 =?utf-8?B?VngycDY2VWQ2ZitHdjNJV0QxRFFMVEtXa1NoU2RyalBTdFlUbU11ZGx6NzM2?=
 =?utf-8?B?TmFjZUk0SGhkNGFyOXV6N1FsUHlCQ0xLbkFJU1c2YXhiVElROVZUMlJsczYz?=
 =?utf-8?B?ZzgrN2M4Um5WMjY5Z1VXcWZEeXU4dVV5emNjOWdlaXZ2Ym1YVVhMUHFjOFUr?=
 =?utf-8?B?Y2h0cHhsdlJ1R2dSNlpYZnZkNXc3MjJwdkhVMjY5RVVnclZSRVB1Y0d3Rkxj?=
 =?utf-8?B?QjZzNHAvekNOTmpuSVhxUXB1bTdsVWJqVTZBalI4akRNNVovVUhHaHRGaGVE?=
 =?utf-8?B?ZWNIM210RnEyUWpMajBySUV4TUxqRDRId0xtd3Q2cUdMbWhyMzllU3VhYlk3?=
 =?utf-8?B?Nk1aNXgrRmI4Yk01WXhqWHRZeVlWSVZ5cUJDd1UzV0YzYnZxQmE3L0dOVEg5?=
 =?utf-8?B?SC8vTjc3ZmhSbTduWmVJa0JDejlpMTliR21vQWlKQXc0TUNrVmxMZk5hNnlF?=
 =?utf-8?B?RU1NK3RqN2RlYU9jc3Q1M09yR1JyVmw5c3k3c3hLMkw5N0grcXNRelhZZld1?=
 =?utf-8?B?RXBXZUVnS0JWYnB0R1pNMHpnYndMTGRDR3NyNnk3SlVnQXNhZ3hjRktHeXlz?=
 =?utf-8?B?VjZuT05PR0svcGZDbVhwV01lRmg4NVMzMlBpckN1U05hMlhVU0NLOFJuQVc4?=
 =?utf-8?B?SnJrOGZWZUdrMEJoaFBPVkduZkZEakZVczlRUzY4TXk4ZTVkMmhCVVJLQTI3?=
 =?utf-8?B?UG1EajREaUVlL3ZkOUxGVHdlOHl4Z1JKTUZ3T3cweE9rNW5GVFlrcVpoOWNP?=
 =?utf-8?B?U0kxUXZWNVBCalZZT3pQYUhRaFpUZm5CSThuNHcvek9jN3FGMkVUNmhhNnF6?=
 =?utf-8?B?ZzRSWE5mWHZmQ0ovQ1FUL052ZDkzQWUyRjFycWY5bWF2a2huVFRudThGSlZs?=
 =?utf-8?Q?OnFL5zKeV8EHFq5qljMervBaA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879c2b7b-f87c-4e2f-0375-08db1ef89028
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:41:52.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HL4MixVO05BhftBMmLESVd1bg8x7OdnQfNoi1NQ2GEe1yNhBvvJ+/5sBPm8W7LsmTXy+m/TPBygGP4QFy6ssZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7944

On 07.03.2023 07:32, Juergen Gross wrote:
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -15,8 +15,11 @@ config DEBUG_INFO
>  	bool "Compile Xen with debug info"
>  	default DEBUG
>  	---help---
> -	  If you say Y here the resulting Xen will include debugging info
> -	  resulting in a larger binary image.
> +	  Say Y here if you want to build Xen with debug information. This
> +	  information is needed e.g. for doing crash dump analysis of the
> +	  hypervisor via the "crash" tool.
> +	  Saying Y will increase the size of xen-syms and the built EFI
> +	  binary.

Largely fine with me, just one question: Why do you mention xen-syms by
name, but then verbally describe xen.efi? And since, unlike for xen-syms,
this affects the installed binary actually used for booting (which may
be placed on a space constrained partition), it may be prudent to
mention INSTALL_EFI_STRIP here (as a way to reduce the binary size of
what ends up on the EFI partition, even if that wouldn't affect the
"normal" way of putting the binary on the EFI partition - people would
still need to take care of that in their distros).

I guess this size aspect wrt the EFI partition is actually something
that should also be mentioned in patch 1, because this can be an argument
against exposure of the option (precisely because it requires extra
activity to prevent the EFI partition running out of space).

Jan

