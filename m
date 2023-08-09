Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82677640E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 17:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581212.909810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlG0-0000Um-9C; Wed, 09 Aug 2023 15:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581212.909810; Wed, 09 Aug 2023 15:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlG0-0000Sg-5a; Wed, 09 Aug 2023 15:37:56 +0000
Received: by outflank-mailman (input) for mailman id 581212;
 Wed, 09 Aug 2023 15:37:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTlFy-0000SY-FA
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 15:37:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b45a2acb-36ca-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 17:37:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9446.eurprd04.prod.outlook.com (2603:10a6:102:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 15:37:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 15:37:51 +0000
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
X-Inumbo-ID: b45a2acb-36ca-11ee-b281-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3bNOkZ6nvEq1Q9xsJ+hrMV+tGUlsXt9CWeYh/ozE/i1qIiZXt1NiDbYx2EcTSVWDnJgku5MVO2EOlQCG9dSj8tqcputn9HgV4MeuwamBy7V+h8tBqEZ2Nv0LfsayD907gcQwyclY1kSbvDFrU+jCp6h3LttLT+Maxw6jh4geHJ0g2EmRrCkvrAaEkWfusxvnNTAexVxfyipkIpmyzbCdNoTGZbPiGjIkmogFi3JZp9jLx685ypaD7A0pHQ8fyHmQjb5N6BQ8nDwlvvvewnS2b63DfyyzsR0s5lxZeBcDlQFDbRHLTnY2BElXqvoby1uEETUvmfDsOcQPkImyOvGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtG9aa4De4cidOdl0bUwW5wESMhb3t/jAM6e15+TQgs=;
 b=i3pT/Tf8EWBYwNrTdJjZ4Ea7wqdfQhD7QtLrCWy2cBf5Ba6IS6iRPnemjF68r+QSym/KZzuKcpUe9173b0xOKpwN6xS/IhBYZZzdNPf1PUzFlBXxfXoYubqCyTzcm+4mF5x4AFFZKwy+UBm/9WSv32XxxvblRHYUPPQ0a1mFwcHgy71l4in3dnQzCtwwnt0bpMSxhAi3u7QPLlBwkhHbyhu/T9qG9dTWUk7G0LGFz6SEOKFxDOARyG9BiSHgNTW636E61BS1z1Vgj3DrDuvOveZIkonXtd1/Sipm8HtAMnpaqzT9d3HPPAKi8Rc3f0J803/rW9KCJ7qTmmx9EuYH/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtG9aa4De4cidOdl0bUwW5wESMhb3t/jAM6e15+TQgs=;
 b=NOZnBJyLEmEe76Trf/3WQ4TV90Ycr/xO7BafWMvgUpbcw8vIJFHpAiPEQLEszXGI2b6UGd0m6kIh87irmLWX2EADHlTJErseYNNdUawXg0Rue3bG3C1StPYkA6c9EXaAI4HrSEL+1LuctspnSHgWAYUP6NkyAtFVawjXVwKLfiFBaFMj6msV1bIjYH84Ow12oFD1otJ5KZN7K+F7r9Yiy9V60hCpOT2ZrMxcWM3GVnwnoLrG3KYeBJ2gddt4LgG8SJr0ZMR4OV1+GDEq7PzZfKwke9CyPPGPPiPzq5jUpG6/mKpbFSbkFhXt7owgaq59CyC11twDcU67f4RcLOXSQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c51f81eb-c254-582d-929a-45faf3e279e8@suse.com>
Date: Wed, 9 Aug 2023 17:37:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC 6/6] capabilities: convert attach debugger into a capability
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-7-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801202006.20322-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: 748093c4-55a0-4f6b-09ec-08db98ee9671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9c0Odhe6JOKz9Rf9iqyXJ/Y6XTJtKpi5xdQ9yuWr/ZEisvfltdtAopOugyuKTwdKJUVAFADoTLf4BSzI3udeJv5vg7UQhM4Gza0euFCDCynS0+RaSjK8UCHNWDP0JDDXO3bRHntVOp2bUEQR1JPKCORkk5Wc6C0pKdxRJKKNxZNi9UjVklujIKLjGxoBW0sHB5nQ5KFTbSH8GCqidmT3z8YxNtJlT7yYMquzIudSSnvuWCxVPFZeXXUmDtuVPrf/4Dw4hYVpvgcmjJH6bWfmdRyKfN9xOGvwe+DK8fissqUqPzP5G+7KMbYG6h1D2s9BsJXDBF4nTXY05GQU+dUswJrDvw71xrEUfwOEAxeqAscdndUPD9ZWQzOvoFZ1TjF087PL/ad9LT2sCChhVgKZkcwFauHujQ6sRol3udWLbuOfHEyC5Lz/sv7IiJb2WSc51PCKD8fanY6m+0Jh59hMmGmjraPW7dWLq1yw5yh4NmjnH8k3vSkYZ+WZiEfYf39ojmlF2h8MmHcabvpDjHPLcrghPPMi+wvAFyhTMNQ+L+m4x35X907i7VH5VQDkIdAo0x36cVUc1mnasFMkQGlb2bBCbm2Xg139ObWM12l7uKbE93fcgeyZXUvlKIVQhTTfjJr+jW9iskcskUr45lZEJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(186006)(1800799006)(451199021)(36756003)(478600001)(54906003)(6666004)(66946007)(66556008)(53546011)(6916009)(4326008)(6506007)(66476007)(26005)(6512007)(2906002)(41300700001)(316002)(8936002)(31696002)(7416002)(4744005)(8676002)(38100700002)(5660300002)(86362001)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c21uRjZhYXpZS0R2bGtsak9hbUt2bUxFeWRQa09zZ3Q2ZGViVWNPSnA4bG1o?=
 =?utf-8?B?djNUYVRubFY0OTRyMjU2dkEzS3ozVjRkK1RMSFBuNjFwOHN1MHJKSTlVZ1NW?=
 =?utf-8?B?SzBNT25kY0Ird1VtTU5JL1hMdTk4UmRTdzkxVFFFMmpaR2FPekFGZ1Q3Nkkr?=
 =?utf-8?B?ekVtQ2J6WndIWTcrbGI3MmRUK3VobUJxUWluSWx6SjBkYW1QMVNOVFArUWxl?=
 =?utf-8?B?cWtZUVExSWtqL2JJdHZrZHBTcFp2QzFTWlZnZFVrQ0QwN0FnTkV3alNIT00y?=
 =?utf-8?B?OTc3QjdKbGE3S2J4VjJ3aTdvNDlRL25xUmlYY3lweldmemZtUzVkblhyeDBH?=
 =?utf-8?B?YzZsQ3h1UFJYeGt0Y1V6MG9PRjlOaFRuQ0Jhb0tPT0Nmd0NMSHFXdytVY3dN?=
 =?utf-8?B?SjNWSUxZSjVKRzZsMGJ3d25WQVFaMWM3RlFySHNIdmxqUkZRRVZNb2l6R3o3?=
 =?utf-8?B?QWxTcS9DNEhzSXlhNmp5Z3lDT2VXV0Yzb2s5NnlTK29LT1RjNm0xYTVQT3dy?=
 =?utf-8?B?aDFJZFR0UGNDN3Ivcms5a2pybEtYaXpFZ3F4QmI4NUtwaTNHMG9VY0xDNm9P?=
 =?utf-8?B?UWxMQjJHa2ZtN1BXaDZxT3U5WWx5WVpmZVUyS1ZweWw2RUx3L0xtRHpMNlls?=
 =?utf-8?B?bVFlblF3NmR2NVltWVdhMDdaOEZ4cWl0NERUbmJCVDkzdHhmQUFEbmRRZG9B?=
 =?utf-8?B?UFBPKzZLdktxNzkwWFhyR29LaXQ4d3BlUDQyUVBNMDlGRklMNnBCNkxxZk9Q?=
 =?utf-8?B?UXpreEhlbG1lMlpaUHZaUndFMzNOamo1Zk5xQkdybUR6M0hvTnE0OFlBUWNN?=
 =?utf-8?B?ekFhOTBJQTdPdWt1blJTeU9ZRTdOMzAxZ1IreEYwOXZaYUhTSi9Mc1ZpTmdX?=
 =?utf-8?B?RjlrTUtzVXI2dHBqM2NQNGJYeUZHdU9YSzZlaU90MWlYZFNqajdhRGhwZTVp?=
 =?utf-8?B?VnozdEFBeVR0anJXcCtLWXhmbjZCd2ExZ29yek1HYUVTcHF2anpHdVpCN1JV?=
 =?utf-8?B?S2lsckhZQXk5L0VkQWNCSis5T3E0K2RPTmh2bXkybnNQeThsRzNzVmw3YVQw?=
 =?utf-8?B?NXk0U0gwTUFPTFFvcDYwV28yWi9UQjV5STY5SUxpa3V0dGxXUE92ZGNhSTNw?=
 =?utf-8?B?Qk00dWc5eFJXZ0M0SEEvVTV1NE5Pc0RjWXpybEF3TUt0cUk0WVU2OUZWcVhV?=
 =?utf-8?B?aE15VWVGbFlXTm9rSkRJaEtNanRlVTZUODZoNERNdzg0S2JDa2tkZ1YrS3FI?=
 =?utf-8?B?VFp4VUZTVjdnZHpteFluVjVwQW5NZjVvb1Z1YzFNM2p3VEoyc3psMlhuOHhK?=
 =?utf-8?B?bk1GTmVuNE9UM2U2TXppUGt2eXJoZTJPVHRSRmx4YnZESVpGdlF2QXJXSkJl?=
 =?utf-8?B?Q1dxNnAzYURWWkp5S2JoT2NMWG9BMi9IMXJic1l5RFFiTU1peWQrR0dwMG9G?=
 =?utf-8?B?bTViakErU0pWMmluTUJ2Nyt6M3pwOCtDeEdKKytFT3lxTlV4cUJ5d1dheGw5?=
 =?utf-8?B?c21VeE9EQVZNcE51NzB4N2hBSENvcDByTnpmek5OWlJRbGU1N05pNk15UVRV?=
 =?utf-8?B?dnBPN2wwdkZzS2tNZE41c3NmdTQxUXVQL2tIY0Q1VFEyN3FWVWtaMFNtL2p2?=
 =?utf-8?B?VFVGSCs0NDgvU204cmZGbktBVWY2MVpTdW9JV1hpbjVoQm1CaU5KN2s1eEda?=
 =?utf-8?B?QjJDNVJianJOcy94SWZjZnRkZEhDcFJjSWp2T1l4bEtPQTdIa1dnKzRWTzRk?=
 =?utf-8?B?TkFSYUh4M1RPaFgxNGp1V01tbTY0M2xvUEFHWExyZWM2V2lJaXViVHZ0b0tz?=
 =?utf-8?B?aWtmM0VmajhhZ3A5cWxDaG1PUjhGMVFMdWVMN2h5NnI4aStJMlg2QVZzNnlm?=
 =?utf-8?B?RHI2RDJwOXo1ZUVQUnhBTmcvTWpxYlZSQjlLMENvOHR0TTA3ZEEvS25sQWVH?=
 =?utf-8?B?ZUIvNG5WQjNnYlgyT3dzY0xDVmxmU0dkUTFmWXQzRllWcTJuQndmTnRmek1t?=
 =?utf-8?B?NG9sa2dzSGgvbEJRNytubGRwcWRJWVoycEZvNzdONUt1NUQxNnI4MFFoUVNj?=
 =?utf-8?B?L3RuVlFDbjcxaWtZRm52bDJrWVBlRWtVTzJ1OEkxSDFQdkNtMWVHN3dNdk1s?=
 =?utf-8?Q?cgzXwG/yrvx9niWTn3usEgmTJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748093c4-55a0-4f6b-09ec-08db98ee9671
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 15:37:51.6791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ypHwc34me0MbL56EDR2TX4iKK6N2Q5qZd9npdZJiwhETdHG2mG2GgXPhe0wXuemWCbv19s4Un3zDULbE1DVFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9446

On 01.08.2023 22:20, Daniel P. Smith wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -999,7 +999,7 @@ static void noreturn cf_check svm_do_resume(void)
>  {
>      struct vcpu *v = current;
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> -    bool debug_state = (v->domain->debugger_attached ||
> +    bool debug_state = (domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) ||
>                          v->domain->arch.monitor.software_breakpoint_enabled ||
>                          v->domain->arch.monitor.debug_exception_enabled);

Aren't you mixing capability and state here? d->debugger_attached set
means a debugger _is_ attached. The capability only says whether a
debugger may attach.

Jan

