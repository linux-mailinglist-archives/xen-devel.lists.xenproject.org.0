Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA87CBA97
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618044.961268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdIZ-0007QK-Iq; Tue, 17 Oct 2023 06:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618044.961268; Tue, 17 Oct 2023 06:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdIZ-0007Ng-Fk; Tue, 17 Oct 2023 06:11:23 +0000
Received: by outflank-mailman (input) for mailman id 618044;
 Tue, 17 Oct 2023 06:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsdIX-0007Na-Qz
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 06:11:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdd3f854-6cb3-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 08:11:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 06:11:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 06:11:19 +0000
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
X-Inumbo-ID: fdd3f854-6cb3-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSLwQC2yRXwTBzQRwGQIhFY6W2TTgNfdRllLYDEK1foG7WHUv+w1F54+hf/S5G0akhocwWJ4gdbUAHvgLafxP3kp3vrSOT13wfKxvut5K+wg3julyn+I4aFREAin2fVHUIA7w4DIvNI6nbnfqIaMgz/XsEexG91OoW4fwjcFbQgJEK0lDUcYK2b9Cw1lakTy5bYPYJVqgpb4YWB7eq/vaHFnATkBTGoySKq9TqaEsycHCOqDz5icIRSnsTCaLpVi4WTe7uNIYKTH26a8ffH6fYrpyt/eBnsxcog6dJVgNJg7Su1r38PWcpAAWMTb44ulTsvX1PQXPgpiGAxRkQsfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgGMb4drhATjxD3GXvHHzlPpnVQdcaB+mfRxDUNkf1k=;
 b=evnyq3jU4CdzO5/kwCUR2sul90M+Lk25O7A4oPVSe2j2hxOUdaC87JyAF1eahOjsn6cxWufI6wAhGJfN9svOhZIqTK7CjIrfqjrdoP+W+CcfXdiTrq7CMPohkNz8Z4P591Ku/l1i6Ar0DDgrkARJ3S87nU1enrksIy9RprwdaaNozBjQZ2uF6QI025H3Ouhy2ESr1GjGmzrixLq6baN+Ns4OBYtuRP8sTLYWpwwYWWTHfeENJDCcX1ns33iJ4ZGrsmbA6TCTTklcVRow4QyQW6VSgWELINpP0EMFsAYq3g6P/clRj4L5aScbFZasGVNqRnvwlT//U9AOzBhmcrunmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgGMb4drhATjxD3GXvHHzlPpnVQdcaB+mfRxDUNkf1k=;
 b=weLRWm/8L0rsjuyRZvA7pXJav9uieCVo/iwQW5ZeGVlBOkoLhQb8T4ySu9kUMrFJ9s4YkyCOf4Qht9qCFUwDBDqYGeI7OYw6Y9f/FP6/oYr0GfwnEaCzk66enKmuRmPBajeMWR11BwIJE/FKY/cufdktQ3oBFO+g8C/MrJ1tT7DgyLSvPyRtbS4yS25FRXDeROSs/rlrpB2Po7rwQX6SdfK1pjlPEqzJYy36wrkJmDiqTlphdKJvS+XncUdSGm5msg7xmTgfBWgivBSSBtnshUXnS/2LhfSS8B0fqq8pjml3Jq8VEi3/QaAOYtxx8br9G5I1i0dFC9wP/mHwkyeQRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4f4f1fc-b20a-c08f-9782-9ce06f6dd868@suse.com>
Date: Tue, 17 Oct 2023 08:11:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: MISRA C:2012 D4.11 caution on staging
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
 <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
 <26f09702-9340-41ae-afcc-808becb67876@citrix.com>
 <75a00257-c062-4d82-9b64-1707ce4566e6@xen.org>
 <594c09e1f8b2e1e8321c2cb862fcb378@bugseng.com>
 <5ddb6398-f2a3-4bcb-8808-bad653b6c3cd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5ddb6398-f2a3-4bcb-8808-bad653b6c3cd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb8767b-041a-414e-551e-08dbced7e13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zWnhTK53BQQuMawzKGATY3dEdrTQ9WEGxlbE9UoMLWLoeiP+I+WnUgpY1wQdd0/O4OYDWRKrGBXs00jgvrQoK1iXZ4eaq3SHprLUV/uE7fbuR/m9XvNfNm97hKRG7jmKMY+z3Kcj2TR0bIBWM+kW41fRYmC1wm5q52OFAG7EPNQO1cHDYFtFzSACZ6K5xiSfiWXAWxqCXejzY2uRslx4+1OAu2qN598wVnKVho/EgSivOvYxnyqlB1n4ZzjrFG183lDZPJRFI4xH0gq3v2uMVqdPdeAdPhUE40wtpPlUcZTrbGhqsWSVYmJ64IGdF7bca8ELxQWFqt9UAv5qWBYHMmSwBYoGKJkY5VRkjCITnKdllXzvF5svQ96MlE1oVLZKqjPO1oQ2gUbvQhA0khJQQiJCNl+1NI4tdETu8V/GxUZqluSUVjAeEWBPzFQbLpuAlQWHDxtrvQWS1iCItUK7kFX63kZrl43+8XSIinWdUVipnNVGb9glHD6zbIIS4U3L3GuGKWLHyRAYEhzrz9gnXq67lvCdBa3H3XVizXaqkGYrppX1LO2W+hmpSJu1iHShYblMXLD6GkjxLRAUmMm3HiWmiw30B7ftmtdtWvdND1EXqfKWHdjofUSnfDX11SEemYUY3DNYYvpjTtnuYlPV4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6486002)(110136005)(6512007)(6506007)(53546011)(478600001)(66946007)(2906002)(4744005)(7416002)(36756003)(86362001)(5660300002)(31696002)(31686004)(41300700001)(316002)(54906003)(66476007)(66556008)(8676002)(4326008)(8936002)(83380400001)(2616005)(38100700002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHFhSFpHMnEwNWpGVi9EaU15cFRaVFRGSnVnUUhRWlc5M2I4VWcrWldiQWhP?=
 =?utf-8?B?UER1WjZZRFMxQmxTbFFjSUU1bzRuenZDWDNNcUx5WjdIMGxZa0VrM2FSdjFX?=
 =?utf-8?B?U2FKbHpobmpkU2QzZDRscDBpVXdQL0h5cXQxeGxrcWk2ODhKWlJoMG5UZjFV?=
 =?utf-8?B?eFlZNFpCRnpseWxWM29DQWxQMFQ3aFRHZHdqbHVtdEgvbmNqLzJkcHBFMkNh?=
 =?utf-8?B?L0d6RjA5VGU1ZFVLRTVGZzY1K0JPRWdXQjIxamNMSEVIWnZYMU1jN1FWSU5B?=
 =?utf-8?B?aEZjM1oyeTh6UmRwNmNvQytMcTBoWmJtTW1PWndUWE5ZSEpPMy9BUStDZUJx?=
 =?utf-8?B?OTBrazB6MHczbmYyWXlMOGtuYTl0ckFTSUlTMmQ4Z1FmQXFZMjFlOW8vQWNN?=
 =?utf-8?B?S3JKcUd3QTkwendZQUwxbjBteHJOQlZ2YmtsOGhsWEtiOGszYmxtSjl5SkN5?=
 =?utf-8?B?YjBJL3VJcUdCUElqV0p1UXZxOFJtc2FsUE54a3R0U2tzLzJBL1VLN0NuTDha?=
 =?utf-8?B?ZyttYlVscCtKMUsvRHhBWkI2NTFmK1lGb0k0Vm5YRVBSU0FaNTJCQlVXNVV4?=
 =?utf-8?B?ZThkWWVteTJrcDkrUUk3NGdjd1ZBU3BEQlZoYjQvWitGWDdXczAwNnlBWm1q?=
 =?utf-8?B?ODJKSmlHdXFkM1pWaWsrV2tqV0E5K2Vta2hNWDhDckl6MG9jRWIrTGYyWGF3?=
 =?utf-8?B?bFY5b3U4NVJvazI5RTh1STUydmZDYlBacDlQSGdCL2d5c3RhNENPTm52S3Rz?=
 =?utf-8?B?ajR2ZS93MVdwU0N6Qjh4bVRjNmg2NFJUb2Z0UXN3QzM4UHZYZDh4d0Nvc1Bt?=
 =?utf-8?B?U05jcCtrU1lMR2k0VkVTNURYTHFrQllUaHdvRVhzcno1ZXRHZnVtR3hjK1Vx?=
 =?utf-8?B?Z2JSb1R0c0NaU2pXS083YkNkaEJkWE0vdm5rM2pyYld3MVZ0clJPQjNJeWpK?=
 =?utf-8?B?ajg1ZmdZaTNSU3duaHhQRTRteUIvc1hYcDRmb3kwcXI4cEt3cEozUmE0bW1B?=
 =?utf-8?B?SEowOGRvY3pJQitwc1JibTBUcXdTMExaOFFIRGlZdVRmSkhTQUtlZ0cxWVM3?=
 =?utf-8?B?b2JwSVVpeWgxeU1DeE00NFF3RnQyUElEMWxwMkJpUGZ4T3psb3IrNnlIdThh?=
 =?utf-8?B?clpBOWhHSCtmZ1l2NFdGdTFlNmo1THB5cWFmYkVUa2cwSlFhOTUwaS9ONGt1?=
 =?utf-8?B?WE5PTU1GTkJMMVEzMzExSkhZM01MZThNVHRCWktzaFhiRlBDazFNSUVBMjdT?=
 =?utf-8?B?OEVQYjE2N2NwZEh1VVpDdEZQRWNRekZFV3owaHZEbGtpeER3ZlFZbjduUFJH?=
 =?utf-8?B?Q2VQNnNJc1psWW4raXhFV3RrOW1ldCs3YlNRNnVleUFmc1B5aFpKMElyWmN3?=
 =?utf-8?B?OUF6K0ZWY213L1l1ZEJGbnFiZ3h3YkdNQWdva0ZTUnA0TUppUUd5dmJRZmJ0?=
 =?utf-8?B?dXIyQXZCNTY2dzRTMEJiQ0taaHFLUDNVZTU3dTFIS0JkK2g5Tng2dkd0dVNE?=
 =?utf-8?B?Y0VlQ3NxVGhkdGNkQUxRY3A3ZjJLS0l3R1ZHNDRlOWtCajc1cDlWb2pJZExh?=
 =?utf-8?B?M0x6Y24zaDlCZnJyVWZ3QmhRNFViNE56NWZocWtxTTJDSDJaNHJyYy9GWU9o?=
 =?utf-8?B?TFRoSU5udVhRa1c4bUZySVY0OGxnSUZXU2VoY0JnVnpoN0pKalE3M1JFc1U3?=
 =?utf-8?B?aDdGR3prTDB6RnJxM1NGRGtlOXQyOXNWQXZ0Y2FKSVkzVm12VGswTU8zREtS?=
 =?utf-8?B?cGVFSXFTbDliNjRBOTdnTUhoWGlqdk5ab2JSZDFUWHV1WTE1M2VCWDdrdGgy?=
 =?utf-8?B?eWVMS3pMWjV1NVFCNHI5M1dEQXhFVWs2NkZ2OXhoYXdVK1BFclhZcUhVMCtT?=
 =?utf-8?B?Y2FseTh3N0RBVVM2WE9XZ2N4dGZvMnM5amE4dkVGNDlhbGJOdDRYN3FCV0Jz?=
 =?utf-8?B?WFhnbkl1QTdqbzFjOHE5WTFHU2dKYWZvU2dlK3o5OGNSQStDbm9sVWs4RHRk?=
 =?utf-8?B?S2JPallJcWl6ckovZk1GUWEvaUhoT0JNbUM5eXhYZGxPdmRlT3NETC9wQ1BR?=
 =?utf-8?B?RVpyK2JEblBQV1gzazMyT0xpZzdRckMwK0hwNnpBYVIycm54YlErNWI4ajVJ?=
 =?utf-8?Q?azF3x58a/gdfRXQefvN/CmrMs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb8767b-041a-414e-551e-08dbced7e13d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:11:19.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIT9oo8++HkdEL3FhvhNntU5wmlHj4JQgBpNA4J8NXmmy2r+wRSoZpIDykWpGPbkuc//Mo2aDSlzbuK+LNmzew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818

On 16.10.2023 20:06, Julien Grall wrote:
> Instead, it would be best to find a way to help Eclair to detect this is 
> not an issue and also improve readability. Would the following help Eclair?
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 30c227967345..ab16124eabd6 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -671,6 +671,8 @@ struct domain *domain_create(domid_t domid,
> 
>       if ( !is_idle_domain(d) )
>       {
> +        ASSERT(config);
> +
>           watchdog_domain_init(d);
>           init_status |= INIT_watchdog;

Just to mention it: Even if right now it turned out to help, it wouldn't
once release builds are also checked.

Jan

