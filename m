Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57E69DDF3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 11:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498729.769617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPyg-0004Vp-Nh; Tue, 21 Feb 2023 10:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498729.769617; Tue, 21 Feb 2023 10:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPyg-0004TV-Ka; Tue, 21 Feb 2023 10:34:30 +0000
Received: by outflank-mailman (input) for mailman id 498729;
 Tue, 21 Feb 2023 10:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUPyf-0004TP-HU
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 10:34:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ae4916a-b1d3-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 11:33:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 10:34:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 10:34:24 +0000
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
X-Inumbo-ID: 3ae4916a-b1d3-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQU2xLwwnhExbN9XV9mwIyHaES/mMfy2kyBOzjqPxGY5y7zAD4wXcNsBWw7fUkrnVkHjT0A6SZN0EbFUSC+1BhcF6qjlJ6bwft1AFynq2V0sNzcazg2uZzZCItpsx/n3arZsr7bmOqSU4grka2dV3JxgYXZiug/927ZBwurQtDSdX8aWVgbdMJ8OCh9GcQ1i8OcNX0g0RE/ZOrIlpRLWZiGzCMT0hgDeO/arZFpkHitQmX25kqMUlLeurDt0VK/gEC3lYLDwM72wINnqNbIEoycyk6HmKO3VosHK44bLYITBAF3R+t8bKemLzYaTsFPqHAeMX1ShSB+7BEUU7MsMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vueirk411ccbQsk/R6TFPb0Ku2dFHcQ1GekFPx42q2o=;
 b=naWajNS9H46oI2gYdacWmOsj0YmSiTouCVBGWHJuEplK+JXM/DJlp6LuNrgVR1VY/xU/o/TyINetLrLUf8J7TOyALV8S0ddVMU0f30lc7Qn0T47V2fPtUsmwIEbBlUhkVL96GKpcPKlDK0yQ3LC/LXyOXL9DV0lCuntkPMPe8vu9ypDAIj7LSPFtRyU9K6ILovHLiBJhLCHBe4DhpyriDCEgTNk9g8ut421sLjimPCDGuWuj4DCBR3tiQ0bLycFwAupKyxD0H+bDK/qK4JB7ywHSROSf/aYxTPsRUG32cOJUadei1b5X5oPdTcLCN+hrKwZDopSMaWEEjrcc83eAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vueirk411ccbQsk/R6TFPb0Ku2dFHcQ1GekFPx42q2o=;
 b=W9kHT52Bpi562N350z/AMk8n+D4CFR+4lysQ+bOIkRJYn+T43GHtwIhrQ3UdvSj71V2OklHjcMX/eBf6anUbqfQIdo9sF4dIMUt4pTyPb2wTbSBUJZeQHR+Oe+Eet3WrHFpM/zcRDd1jYvBeL5/FeTP6TiNywPo/Ll2iZ4ho0DcTgnB36eDKtCgd2yAa2YuPHYOYMyi589O6omThp4Ob9aZx0N3v8j10MuPF2DDE5XPcNSpILKcaS5zCQ7ajtL7kpq36S89XNk2m6QD3+XH+CXVG5rzbbP6mUICOIGL7CpoQI+FlTJ1WR9Nu9bLWF86ySwEii6ytMre7a5iYP54MuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27561b8e-0187-5c27-fa4c-e0ee389d5ea9@suse.com>
Date: Tue, 21 Feb 2023 11:34:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] x86/kexec: Drop compatibility_mode_far
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
 <20230217174814.1006961-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217174814.1006961-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: f62303cd-4464-4842-afdd-08db13f73352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UeGWCLzyBT1LhOQTuNcNIYpqtdDYoMCgXm0dYMS8py2YbHvS8D9Di7hVO/N3+GJRWFIgwtQuE1HHFC8i/inksr1on/Rd4MJIN0CTvMMBSJMZrH4m6C8Z127JIy1CNtfKja+0O1p8RQQG+caoyYJ5XeiuV5rOWftp0H0UucIvw6MJqlcHasSg1uo46/pF+qjbzse1s9x8T7yPmkpgGuZ8oypJcibj+w2Vdzlkc1EoAgHzGetvopNt/hAPHIuzGQEfQ88ZKcaxzft36eBW5dpyNnmBvQyLsO8Ko+N7Qkk1ncOBT074MPK6C7rA8xeqB7WcN/oFO2QqGjebpGPyq3ZZEjqeC3+3fpoGGD47NzPbqqH8mxPJJ0nNeWxP+S9Dn9zZBJYYFTwytCSNOSr6BU7eAnmbAW64A+bPqOFvCeHPumGQBgLjQPTdg0bQPron9IbvJdugoZ8nQVXEqQFKhPyoSRo14xMBAKBfnWenKcB0Nid7NRUVyEVi3kxHKT95BKCzA1A7bL3/tqcuR8CtcNz1SdamF/3vj/NyA2lxCEW76hWsVxPgibxmiRYcfoAFqHDwK+1iUCJgsv4z25IWROUaBj8u6OllFHsNoRiaELGP7a2ylOa3ffk4Eid1YE9zS0wH8b9ktyUKaR8WJTe0jBqAH22cZNVwO0PIrRR2Jqn9kYQUsIfGMrZA6fL3ZrFU3eHj0Q1Br+eBwZ9atlPHu1Nl3ONYcxF6hWuxzUADGpUx/qM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199018)(36756003)(2906002)(53546011)(6506007)(38100700002)(2616005)(66476007)(6916009)(186003)(4326008)(26005)(6512007)(8676002)(66556008)(41300700001)(4744005)(316002)(66946007)(5660300002)(8936002)(6486002)(31696002)(54906003)(86362001)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlQyTlYveVNFcUJFRGlKYTlQVnRtUmNWMUtVbWdwN0RGZlVNYldXdkUzdG9o?=
 =?utf-8?B?WThRV1RXZ3V6d1MraHh4YUdQaHJMYi9RWXdpczNxZWp1czdGbnRGajNIU2dr?=
 =?utf-8?B?NUFnSWlCTFZPblNlL3g5VVdmRW16U1o3T0ZMcDhVR0RlTFFHZ0xrRXZuZHl5?=
 =?utf-8?B?NUtnbVhKM3F3cmx0VWxGSmJ6TmUwNm1nZ0hhS3k4ZW82cmpETC9vSE9zSzdH?=
 =?utf-8?B?YUVTNlR6REtRci90TUpqeTNuYWFrcGdoaUpOeFZyZllXMG9wbk5rOVdaZCtL?=
 =?utf-8?B?bmF3RU52ajVQTDV2OC9RZklRVHhjNzFuVTgyVE9JQ0J6RjJmTHc2ZHRFWVF5?=
 =?utf-8?B?OTFBQWUzcDJxZnZndDV0TEsreW5NWEZMUmNrNmNSUzc2a1cxQnM5YnhOU1Bw?=
 =?utf-8?B?KzNmeVJWVElYMFVJcXI1L3cxblVLWExMWkFsMlI0M0tiM0tyNG9HdEM0ZzRU?=
 =?utf-8?B?K0dpbnhjdVd2MVBwdXBIUUl4RFlhTjJvcHNmUGR1YlppUWtDVVI5NFQxeity?=
 =?utf-8?B?a0Z0aTc0ckhuNVBaSmJpYWtlZ3hvQ2QxVU5oV1NIalJUbHRKNU9VRDdwM2JO?=
 =?utf-8?B?WGN1blY4YTQwT0xncHFsSTZEanpkQ21wZ1NiZGx6K01UNld1MFdaNGkrWkRG?=
 =?utf-8?B?eExaN1k0cWI4ZllzNWRVVWU1L1Y3SzRMU28rR0I0TXozTWRyN0hUQkQvUmNj?=
 =?utf-8?B?RDBqWmxFTFR0ZWl1MnA0NDJIbkgvR3BEc29qbEN3Y2RLcFl6d3hFbWRFci9o?=
 =?utf-8?B?bG8zc2t3RGdEYUVHcmdKbHpDOEttMjZ0dXdzUno0MGh2UzBaTERuOUhHSHZ6?=
 =?utf-8?B?VmN5UUNqNXQ0aW5uU056YksyeW5peDFPTURWT1pTUWlTWFpDcW5odjlmYy9J?=
 =?utf-8?B?endwaG0wRjFTR2NrL2tPN0Nuc3VORVJob2EzVHkrdkxjbmpKSk1tREtVbnQz?=
 =?utf-8?B?MDY3L2ExMW1teXo5ZFZPVHhKclg5MzNhdThHMEdWazlMVE4yOXo1UERZVldY?=
 =?utf-8?B?eHIzcTRjZzFXMHpaVEVlQkNGcEhFM09nR0w0ZmhIOU1rY05xMURqYW9ka0J2?=
 =?utf-8?B?aFl4ZG5KcHc5VWp4aWVlNGNmWjJJdkxuc1czeGdnc2gyZDMyTkkrSzFQUDlW?=
 =?utf-8?B?MkhIRWFidDhGUG5yWm95SVJmQXpkQlhhdDNtTjRGdGV6QUNwVExteW1ReXJH?=
 =?utf-8?B?andFZFJpWXFYNWlrZk9tNWljb2lmV09KYzJMSDRBNVpUWlhSeW1weVVwZWZQ?=
 =?utf-8?B?blpVRjcydjFFUFp3Y1grM2t0ajlaQjREVGRGbzBzb3duR2UvMEU3ZEFwNXpO?=
 =?utf-8?B?ZC9hZGYrc3UrUFVkdWJrMWE1UFVXOFJlb1BrVlFuZ0xpQTVZc2tscXo0eG9v?=
 =?utf-8?B?OHY1eFpGSndIU0FYVjcwK2ZlOVJxN0ZGYjJqU2lkVHBaeVF4V1Q3Q2hoMEpx?=
 =?utf-8?B?VWZidlpEMVByT2RTRUhOWWhsTDR5dTU2YXlsUFhVbHorS1ZxK245eVo0Smo2?=
 =?utf-8?B?cDVxenNwNUkxb1F3R3g3NG5KVi9PUTBqVEVKeDZPYlNscFc2VW9oZ05RTFBG?=
 =?utf-8?B?QTFISXZhQ1NxdmE1Z0tWdW14aEx1OUZweFJIeklheDJrRi9IR3JKN2E0eG5M?=
 =?utf-8?B?OUJLaDJSOGRyUU9FN1hQRzkwS3pNemlrUmUwMVNZeDhicUkzS1l1bC9KMTB6?=
 =?utf-8?B?Z055R29EcFFtdGcrYVdXZHhNTVVJMFRneWlVTFg0TzNXRXdxSWpNM2xXMVNE?=
 =?utf-8?B?blFGV3ZjWnNLTk0xTlRMTDJOYmVrMFhZWGFpUlBUYUMydTNnRmhEaDFRWm50?=
 =?utf-8?B?VDYrekJsSExvL1RPQ1dmQzhNN21XMGhQSGVWUkVlczA3MTRLUHl5ZW1sczk3?=
 =?utf-8?B?amtLRXRsVzFldjFaOWlDRTQ5R1J5ekdNek8veUNyU2dLSmxmUUdoSmpMUDR4?=
 =?utf-8?B?Z3JDSkE1V1lqRURKclBoRXZCYS9DNmdwSGk0ZkV0RmhlTy9ub3Qrd2dMR1FO?=
 =?utf-8?B?c3FzYnlJUjVQTDZmSy9XdnJMMWl3MmNmTGR5bnJSN01CZyt1RE5SbHB4MExG?=
 =?utf-8?B?QnpUWnR2T0Zia1JzWXRINGZEekFiMWNVY1VLeEdpOUFIN0ZuM3FaQ2Y2RWlS?=
 =?utf-8?Q?lZtElVp3fQLJnwpaUYBazmSJP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62303cd-4464-4842-afdd-08db13f73352
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 10:34:24.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQSnnQiaTiXQLmedS4HhUino7L3h1I5dPQ/yE+69lSF/9fvnQiLTqtjmGS5rjx78r7oy9Wp7MdbbQVGkkGgrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

On 17.02.2023 18:48, Andrew Cooper wrote:
> ljmp is (famously?) incompatible between Intel and AMD CPUs, and while we're
> using one of the compatible forms, we've got a good stack and lret is the far
> more common way of doing this.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One question though:

> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -86,12 +86,11 @@ ENTRY(kexec_reloc)
>          movq    %rax, (compat_mode_gdt_desc + 2)(%rip)
>          lgdt    compat_mode_gdt_desc(%rip)
>  
> -        /* Relocate compatibility mode entry point address. */
> -        leal    compatibility_mode(%rip), %eax
> -        movl    %eax, compatibility_mode_far(%rip)
> -
>          /* Enter compatibility mode. */
> -        ljmp    *compatibility_mode_far(%rip)
> +        lea     compatibility_mode(%rip), %rax
> +        push    $0x10

Any thought about making this literal number a proper expression,
rendering the code a little less fragile?

Jan

