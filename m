Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719E590C49
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385322.620922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMOl7-00037f-0i; Fri, 12 Aug 2022 07:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385322.620922; Fri, 12 Aug 2022 07:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMOl6-000352-Th; Fri, 12 Aug 2022 07:07:04 +0000
Received: by outflank-mailman (input) for mailman id 385322;
 Fri, 12 Aug 2022 07:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMOl6-00034w-0d
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:07:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ce5fffb-1a0d-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 09:07:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5396.eurprd04.prod.outlook.com (2603:10a6:208:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 07:07:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 07:06:59 +0000
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
X-Inumbo-ID: 5ce5fffb-1a0d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aish+dLzElgL3f+loKI8ASBXNAtc02138ojha+NhUg/yG1MUrceHqD1YCd2oOph2/72WQqTzT4CVsEJPfEPN6gopx9U69JTN1NbNDdlqdM3bXSQC0sf3wrf3BdBGYMDSKsixc3KBSo7ErGzz3qP+BxIPFogwRF5eXshMhza+nvaUpySygNsGnvpdqspn84Y7HQQQC9wrlW2ST2jIV0WG1DYPQlqCN5c/WKmr9EpBPx/nEKLnRdQ/Dnn+WZ9z/puTqhOWedCuktNDHZqOiYinIxPI19bIc1bv6QCMcd4yr1TUhjst60dI2O5pto1ht1ehQrgK+JnTKv7uVnWVtpugvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B08G4Yg9hc7MRAjDGVmnpCHFyKhKOK5Z9snEtO40L1w=;
 b=Rokw7rO7xOqGB2FhEdOjHVp/ERKxF1502BYODvv9/f+5Hqf6bjPpe9m0ze2RyqJ0hU+GO9g+NgAXIFnIcf6l5KZpix7slodyPsKIAmkNVP+UaeA6ee8DyJgqeTDouazLly2s0/K4rvqNHzNTs8ZXOM/Jxs5vfXrnngA3qL1RcwiKiU5leud+XimWOrDnZg9mwL1zkWRyO0U1sB6QhTCaRRhxAMauMRHUBsOdCxOLPA/h6QZY2cabAFFkR4APld8b/W+saNYVb8apjEphq4ZUsN0f8rmKAPL1E2NlWZgMYcrOAVzWt9Dn+XxesLNAfN3f5TNrP44QqhNEliCG6qq+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B08G4Yg9hc7MRAjDGVmnpCHFyKhKOK5Z9snEtO40L1w=;
 b=aYsoFU/OHeEus7IlJS2Lp67oMGY6dQsZKG1mR73HIF8KFNxoFingWAvK0Wl2R9Q8kJEWq0XvNUjw+ygYQtCcE28xHY4R7bJredvsK9EUOmClpOOinDPqWew0iIOHIl5aVxH/+FhP3rp8Rthe7wRmz3j8a0gGuak0LglbnToXCAz4/mReCKxQi38QvPCQOZF50BCRA4FWHUg/vExAbnF4WiJbT+QKVHVkCHx46NLDRIp0sS+geOWqpbiEKGgItm9qNCPAWmaijrq8znstgTB8M8jJX2U2HwM7GAR/zFBV4rwTDql2GH81xcKnuo7B/nHvxVpu4v7jPg+dMWQNCOfKsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc46a75d-e68e-c4de-edc6-ecfcd66859ac@suse.com>
Date: Fri, 12 Aug 2022 09:06:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] x86/svm: Remove regs param from asm-called functions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220811195905.7780-1-andrew.cooper3@citrix.com>
 <20220811195905.7780-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811195905.7780-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2dfd665-e0f8-4097-ab1c-08da7c314003
X-MS-TrafficTypeDiagnostic: AM0PR04MB5396:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YIA2UuydGBs+bjwiQxNCIh5JmhX/6Kw0HefwRoVIRbgr17x1LJEJ6grB1nwdOa5XyG1/fZp9ULvtpVByxDXR9806c6+nngCQQ8slfMSPmk5z/nh9EeHQbX9rhPhDWbXo3DOUe/oacSOBzCyH6iLD1fHPsE0Z1Yy1H8NXNbIo6sr6peClxA1aasjzF6TH1Q3DSdXIrA6K7VO/xtb/cFkJV7rqJ7ETtyDY0JR+J3gyudVKMSwII8YDF8Tzgo1XBPXcbra5uVgKzT9RCWgDClqIpxG+AEFnYP9CPqslAyNXD/RQbaWdUrpxZUO+HZoneWf+nplAI3lJT1w26pZpt2Kkujh4R4QGK3+YVd3uqvftuiNJsMD3BES3pTbjnSy/t5nPuCG1APHF+AuStmvEpvb5sGkJ8uRMF5SOUFXPsXNoKQEcrtIMx+Tzpl6zriCnNYH7p1pV/CW4zi/4wJnRTOa7WDJWNLL2rRnKMiWT4ZmHJGJ84F5Ec9f6JCafE0kXxy9tNTgi06dYHkblsXJ5rXJr7GpoEBiRPCwf3SMDBWgVJwtp1g6VRC9l8zwmWEhFYZsYdiYHRjQr1r8rnuXIVjAnhZJDq7S3Umtex4KGuyJ5mIBXFFEHBEumWwDm5cxFwdRt0t52tpRBpMjIanrwTsI2F+x15qic2UxmCRFomv28CJmbflZ2y0IyQSZOKly4cvY9ltE0vi8mQT3HtVB5rV9WawYMZTFtQp72SXiLrUzXgdGOEQ2f3LlqnRVN2JdDFqATc1zZBEkhp87e9zQ8JzSJecsBf33oil2cRFkzeIoOnN1hmIpscMjBTVc6pqg3tits/uD+9ECwtySLf1YC33vwQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(346002)(396003)(136003)(36756003)(86362001)(31696002)(53546011)(31686004)(6512007)(186003)(2616005)(6506007)(54906003)(478600001)(316002)(4744005)(6916009)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(5660300002)(8936002)(66476007)(4326008)(2906002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjBBSml4Y3N0eUZpd3BmWDBRN3pSMzU4alBJNE84ODgwcHJLcjVkaElncFNR?=
 =?utf-8?B?SlRhbkpvTE5YYVlGZ3F5K2c1SEJhVGgzYjRLU200QktRMjAyN1dJeDQ1cCtD?=
 =?utf-8?B?bUp1bkhPdDhXNmdBekpBelZHZ0dhMVFhYUlnVStKcFFXbGwwaWIxZ0Nxcmhr?=
 =?utf-8?B?cCt5cW9iY1crNDZaOCtEZHEzcnVvbjRnNFRxV0EyYTZkeUdqVWF2Ly94c2V2?=
 =?utf-8?B?bDBZTTRlOEF1WUl4OGtoVEx2SHZreExEYnhDVEtLbllqR3BNNGdpdWZwWGk0?=
 =?utf-8?B?OUFxbTBIRXMxelYrR0g5QVEvUS9nWDIyMklKajkxKzM4RE54U2FYNW1JQUFz?=
 =?utf-8?B?Z2k2dWdXQXdJR29QbnpRQXZtaS9rWkpyanJRNGw3cjFlSHdlbDNLeTJVQXR0?=
 =?utf-8?B?S25PTTFXUHpYVUhybm0rTEl1cUh0UzI5WWF1YVpWR0gxOWhwU1E4VXluQXZJ?=
 =?utf-8?B?TXcwdUVEQ2h1ckZ1VUZUaE50dE5BVVR4REU0cUgrVDQ4bzBOUTVpc21VZkQr?=
 =?utf-8?B?blFXcXlQTDR3eFJRaitmT3liT2Z0KzBOZGVwWGVMdFpaaUUzVDVFKzUvWmRw?=
 =?utf-8?B?UVptOVROdEtTSHZBODB3c2VKTFF6Wk5FOXR4OGtGMmdlUzcxeEhiSFZVd1hM?=
 =?utf-8?B?c3UzQ2h5Zkl3d0tXNjEzcjg5N1loMXBrd0hRbFVsbEhJVkcrcFJaTHlBZ01o?=
 =?utf-8?B?R1VtRHk4SlJKQjBpU1FLUG0vYm5aQ3psNE9sVEpYRmpURE8weFkxb1o1Y2dH?=
 =?utf-8?B?dHk4WmMyU1FwUWkzK0k3Z0JIZVpBaWlaTWl4UytaR2YzbzVnejk3blBTSk0z?=
 =?utf-8?B?b0VvU0xiUjNOdmhPYUdLS3FmeDVjQ3R2Y0ZrRDdKeVk5SURqRTFqekI5MFlr?=
 =?utf-8?B?S2hHWm52bWkraWQ1LzFmQU1kMUxCZTFHdUdDT0RlU3M1QXRzRmovcmplWWU5?=
 =?utf-8?B?WUljdDFiZWwrTEtrMFRRMHNQNHlvWTNZdHltWktaQm9RZXJEa3BTQjFabGFo?=
 =?utf-8?B?SnJIU25kdFdVWERjcDhRQ1ozWE0zb1QxS2NtNDNrMHl2UWNwNFhFakhRR1Y1?=
 =?utf-8?B?bWRablFxNFFvclJUeW5IWU5ObFRoVVEycTJvaFhTSWhhSlAzKzhQdFFwVml6?=
 =?utf-8?B?Uk1rekFSclJhQ2hmaXRnQ1ZhdzV5WE9TK003RkVidk9vYTNmYkNDY3cvOTdz?=
 =?utf-8?B?RkQ4RkVFVnRRRWpRanA4akYvT3VRNkVJa05OY3hBT0pjYlZOYytkMXVUNDB2?=
 =?utf-8?B?UG1OY3RpTzVJa0QrdklaSGNYWU9WdFFtUzRobkhaL0VyTVlZTDBFQWRxSWNt?=
 =?utf-8?B?alNrUkMxMlRUOFZkRUc1R0lVUml6UElSc1I1V2crRWttOStzdTR6TUVubzdG?=
 =?utf-8?B?YzN3STEzcGxmbVVnMWxLQXQ3aTAySC9Ta1FlektaMGVuczQ0Q3FVQUtPemt6?=
 =?utf-8?B?RUtxR3VtL1ZCVW1oampvcGRhM3FqeWFkbm52OGdRY1U2OTNueG9acXpvU3Np?=
 =?utf-8?B?Si8wck9RVTBvOTc5cUJUNTVQNnI3ODNTT0dLNkJnR2hWazN0aEljbzgxRHd4?=
 =?utf-8?B?ZUlteHd0Q1gvUWhxcS8zN0JxdUZ0cTNoQXBYMFhhaGtRVmllMzJxSzFUMTZX?=
 =?utf-8?B?Mkd5U0RmZkNZajRlQUs5NzZHQlRBdDlJT2ZxREl2Y3pPbGhxNnZpQjMzTVdm?=
 =?utf-8?B?aEkxV0ZzTkFKdlhVUlh1Z0xRQ0JnbW51N0RZOUtMeU9TMkJOV0pjS084VWp6?=
 =?utf-8?B?NnY2TldXamZmaGwyTUFLcnc2OWVQL0ErblRxWjNwNFAxZE1jSWRJVE4vbHR5?=
 =?utf-8?B?anFmMWZTdkdBR0tyb0RQVWZLaHhSam4rUCt3d1hQYXFFMnlobDd0NnpFRnRw?=
 =?utf-8?B?R0RmaUNTUEtidjdobnE5RGU0TWdTME9xdUhpUFNYWVhlb21BOW0zb2pERUpa?=
 =?utf-8?B?TURycXJjTVlhU2V6aUdOaWVUVlJFOWthUHlpNTNOdFRXZTlTbnNTN0RpbEpu?=
 =?utf-8?B?U0o3alp4azJpV1lHUi92OGFraU9CQUtFUEoyTjB2ekJHNkhicmZFUmI2djhF?=
 =?utf-8?B?aXdpNHdQNldFU2VlMnBDdlJDQVRmYW9SRHBwcytRWnozMGkwOUNicXN0YTdF?=
 =?utf-8?Q?GmoGTjX1OWwPASK3a9aWqa2nx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dfd665-e0f8-4097-ab1c-08da7c314003
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:06:59.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWDvEYVZbsApNIvQPJYx2GK+cfgEPHdF5t/HL4nNwkWKpSN9eHpEa/YmGyVEUDMEjIz0LagKd14icmy0EjUeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5396

On 11.08.2022 21:59, Andrew Cooper wrote:
> A optimisation is going to want to conditionally have extra data on the stack
> around VMExit.
> 
> We could alternative between `mov %rsp, %rdi` and `lea 8(%rsp), %rdi`, but it
> is easier just to make the functions void and let the compiler do the (not
> very) hard work.
> 
> Passing regs is a bit weird for HVM guests anyway, because the resulting
> pointer is invariant (this isn't native exception handling where the regs
> pointers *are* important), and all functions calculate `current` themselves
> which is another invariant.
> 
> Finally, the compiler can merge the get_cpu_info() calculation which is common
> to both `current` and guest_cpu_user_regs(), meaning the delta in C really is
> just one `lea`, and not any more expensive than `mov`'s in ASM anyway.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


