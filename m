Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2B6FA40D
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 11:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531339.826939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvxZQ-0006Gc-3U; Mon, 08 May 2023 09:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531339.826939; Mon, 08 May 2023 09:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvxZQ-0006DG-0O; Mon, 08 May 2023 09:54:16 +0000
Received: by outflank-mailman (input) for mailman id 531339;
 Mon, 08 May 2023 09:54:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvxZP-0006DA-6R
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 09:54:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4960d106-ed86-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 11:54:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 09:53:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 09:53:44 +0000
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
X-Inumbo-ID: 4960d106-ed86-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZmxu9xAj3O930y7bTTSf9fNCpB6pbgCA6bfKxSuHj8SRY2VCwlZSVo7R/HKGII6hzB7Yg2+kCBf70Ji/3TUDbDnIc/xcEjWLUz5XbICY2D0m0whiLx+1sVTFE2UQOHFCe9unMvH1HpcK+9GutZJZ4QLc/MckPI9iNCuO6QJvrgfOIshSasHLOCHOIUThFu9l0P3/PD9X8Br6e5rch4HvCNJaV9TiCdNPFWTKBc95XsYHgOCX6lYc/A4irRMfYO4d1/eJaEgtgfgk1vtCF799lzsFopdHGKncoCy5xZ1CDd4WKWGP0ib8z0g65KiFxGC3mbf/YF06a3lqrfPAoQhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIrHFTZ2UvRvRf56oE/0zxFn6W4wqe81S1kRnPkSL84=;
 b=nnT6kWS9QYpWtrGRT/9nSZ6O012Va6a2FwqnBC3uki4FIOAX+cbk5ZyA7NTfKWMiFVQs6qeD1YlTNhkEG0bV0Wl+3dkv6Sp0T8cUFj+NgsFBMT6p3TkV9ztUQF/C+SVtjoAzGjBE1j6G9piSylz3l1TgtZmoG4gEqV/T8Vcu+A/RlVUHaqCL0TOWZruUOpz1wXt2F1eQL0rDAXW3+CGPnaOni8SLGnGVj5447I4+p3aIpMuBsvwL3twmPz/PMsMt8tDOWDkno6juWmQSSI7YJQ54PP1Pf/sl6/hI/K7JNuhhxLSwA2N6hq3x3Jz0t/joeeyVEinjjFmYhLXonOy2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIrHFTZ2UvRvRf56oE/0zxFn6W4wqe81S1kRnPkSL84=;
 b=pfgi1dLsdG6gfwX9Kp981dS5bK+00U5NHAaTVQ+8wohObcRE+nOjzvQ6YoLhhKWmVBhJqOWsHnfc9aYeJfCG05ujKkykbS2ASGHxnLSCpCO/gfTjXbNiNf2a3AE8ja+YezrU5ERxkjaNvJ0UMfw7SyxnKjL00jux0vtZ5bgG963OLIgGldmx2Un5S1QfBR1xETaAg5A/xAX6IZu6JqcCySR0MypRD7I4+1xFEIc5B37FgKoxBqRt9knK4hAmc+DoSxFIlPySUbQQzifvltraV6zlvTxhA4SNaZdGoHVMUF+AyrJ2yd75i5orpk8oYxl2O74atRz+XiO6/maXJyrzzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdd7aa43-3fb7-0a26-4041-b476b285d14e@suse.com>
Date: Mon, 8 May 2023 11:53:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 06/14 RESEND] xen/x86: Tweak PDC bits when using HWP
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-7-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-7-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0003.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c32217-2317-4bea-f561-08db4faa1c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nrQJEyU3LH2U7XScrQlHAohBOGh01oZfNhOdO9a/nM4V5XJfPKSbVpKun+Hu3sv529a2Jrash8nhEUeH5yglqurOT6Rw5GND7VUCAsa2mgtjDIq40BdD9uWsHbwT087LZii9osUvGdgNhO4l5U8JxwmvnBKIYdCile3Y195xDwhtTQGcElYXyQhC77mwWEk60ecOCXcFhxDiFZCNbfHfMnq5FqRnXrQKUk4ijhTbmmgx7UVYaFHPg3nh1XsRcSKSZmJnthfPHrte3N9Pu8XC5x7MXpLfpNLuXRkdJTKlIGYcc6nKWUcOK+8WIU0xP45lcLKKTQBvV7F1wDAjcp33AZfn+GO63mblEQd/IABH4kERSrGpZit/BbF4biUcy/MVPvoW59epyZmIiPVN/stbnqG5fSUYtD9NHmaByIv58ZymOJ4DW1YLuzQgXzOFzOVfftOSEEVQdk4FMh4ofKvJnb7ghcomugk4/xNkWL2b2l0djwPSDCUHOMr1dClaXdyK/1NEtewaoKwMYGBZtaSFxyBgLezKqyudM2+5qvrbtTPJ1EUb3L5JuK0lP6SQxhp5qbdMmPX4YKW9oUEkvsnxeRMCnnOcKE/dW8WVEn5g5yRphR8l4EXReYcb3xGuX7beJV81AWjJvUHYzj5QGFKWsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(86362001)(31696002)(66556008)(36756003)(54906003)(316002)(66946007)(66476007)(6916009)(4326008)(6486002)(478600001)(8936002)(5660300002)(8676002)(2906002)(4744005)(41300700001)(38100700002)(186003)(2616005)(6512007)(6506007)(26005)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGp6andNcE1YYjgyNk54ZnpaSVZsMWFnaDlWWFluSFNrUVJxOFIvdVFYNGtw?=
 =?utf-8?B?aHJ6RlljcENha2hmV3I5bmFmSmVOMnZvV0VqY3NNTE53MTVieFlzbVNFNWdM?=
 =?utf-8?B?WVo0YVFSSlpXcUMrNWR2WWZ1djBrNHRGYXhsYTdZQnhhWE05WE5yYnpGeVdQ?=
 =?utf-8?B?ZW52TGN6Mk1qQUc0eXJmc3M1b0lTK3BLU0d0UW95Rm1LYWlieVozVFhyVHR1?=
 =?utf-8?B?eVl4YWg1RUJMSXVqQXo2QXpiZG9pbGRwbjVhQ214d0dUZ2QzZlpoSFFYS0Zy?=
 =?utf-8?B?dDcrQ1Y5blBzZGg0WURhc2RvN0JTdDJ4WmViQlhLRk01ZDhDVGtJNjZDWFNi?=
 =?utf-8?B?MUp0Y0NSOTBFL0VLYnZjNkFUcXI0QXBKY1VnR1pCUDhEU1NqY3d3d3ZGYWxI?=
 =?utf-8?B?OEdzckZCaEpjQktkRmdHaUJDNnBaOU1EZVRiZ3Avd01qR1dHVC9TQmc1bWxG?=
 =?utf-8?B?N2RLYTQ4VUt0NFdIZDlrWlk0VE1OalRZSTVCWno2YTQ5NEwwY24wdVdtZjI4?=
 =?utf-8?B?U0VVMkZxVUk3YWxNckpiVzg3bUdCN1BMQ0FkSUFpckZueW1PY2lwb25wZnZi?=
 =?utf-8?B?cDRnWWdpcGsyR1FHZVFXREk0azlsaG1FQ1c0SXVYR2liaDV6UGZ5cHhqa0M5?=
 =?utf-8?B?VllIQWpoUVVwSkdXVnlCSlVEcjRPZE9KMWN2T0hzOXUwakpaMG03QnhnYmJB?=
 =?utf-8?B?U2cxS2hWaWtCKzdHMXZhTGt6RzVRbjZJT0JOK0E0VURnWmcvMHpWc3d6blc2?=
 =?utf-8?B?UUlvR1pZczM3K0NWSnNia3dEdkhxMk1tSHVWY1JZVllWT2ZMMTlveVdOYXZ2?=
 =?utf-8?B?WUVVakNGalFOYWpSZjR3YVpRdDNmVGVPOGVNTWdidHJtbG54cWg5emVVM2d3?=
 =?utf-8?B?R0QrZmdESFJXY1hZUDhEeUxNcDVmWFhlMkQyTmU0KzBIeThhRXpJRXkwZ3hq?=
 =?utf-8?B?UzFMSHI3UjRvUmQ0MnhNUytuT3ZkajVCOFE0aTJxR2tldzdtRDlRaGNKSDVH?=
 =?utf-8?B?czFBMEJ1c3ZNUVpxWEhuU01Wb3hVVDBQK3Raakk5NjRYaUpKa0VYaExLbEh3?=
 =?utf-8?B?c2hrY01RdUFHTUV4OHJLQTRUN0N5bXg3WC92d2JsVkJ0REFVcWFEQWRhTXRD?=
 =?utf-8?B?dGEzbk8xR21NQUFhbkU4Ti9QeW5hV2t2UDhESTVYbDJOM3BoSUplbTA3ckdV?=
 =?utf-8?B?SEJTV3Z2aVNPWStsbVJKVFJPRU1JU0RzRWYxVksxTHlGWGQrRis4YXJqQnFa?=
 =?utf-8?B?UHZGUzI4cWRiaTJicjVkQmJqSjRZTno4M3d4QUdpdGxDcjJXWDJkaUZLSGxM?=
 =?utf-8?B?aG1KZGovYTFvd05BRk56eDB4M1lobHM0cjR5R2E3OW5sRzluSVJFTmh5OVEy?=
 =?utf-8?B?YTAxOWNIU2ZobnFGb2NNQ2dJUVd0aTlVKzR4Ym9ZNTd0bXJGMnE3NnFsWmN5?=
 =?utf-8?B?V24wNTYrWU9PT0hJTGdnT2FhRkhubWJYaEVINFR1TWVSb01DbTJ6eEc0dTVO?=
 =?utf-8?B?MGYzbkZZQkhXbUF1ajJCUlFUL3VDekFBNVpXeUFvUFVsb1EwckFsUmRBNjJr?=
 =?utf-8?B?WHBkeEJVSlZOZnZIR01zRkRJdU5tdGkyM3lTYzVCQW9ONVBGQXdtYU1acWQ4?=
 =?utf-8?B?ZU5wSE5GVE9pbUJUWXhIUExBTzNaa0Y3MjVyTHU3REprbHN3K0VHaGt4dEkr?=
 =?utf-8?B?T0dOSFFzS293RWY5ZzRpVStvQ2JiL0ZNVUU3c0J0cGtWblE3NHZadUFobDhu?=
 =?utf-8?B?NWZPbVZIVnh0WS85NjBhcXdXZTMvZzM2WGNOQTdOaGMvNGNoNTB6R210UEpD?=
 =?utf-8?B?Mlp6R1VKSC9LS0JxMTJBV0ZhQUtYWHJHNHJsbTg3YjI1QUJlR2swbkVGa2dJ?=
 =?utf-8?B?YzB0Ykdxak4zWnBqbklRV2JZMEZyaWtJdFF0Mk5sVS9SV0lQNTRVOHpUcytl?=
 =?utf-8?B?SEVnV3lqaFdjMlRTc1RMMmwrMkNkNStpWWtjRkVRc2Vzd2sreGxqOW1Pb3ZR?=
 =?utf-8?B?V0F1Uk85UHdTSDhYenY0SUh5NWcyUTM0T2xScDBkckViRzFlaXRwR0ZrN1Zy?=
 =?utf-8?B?eVBSWFYybU5nQmZsWnI5dXpRUjBpeDRWdGlHdjJUald2eVdoSTRleGhsaHIw?=
 =?utf-8?Q?jUJW2pru5MCmYtWOPWgf0agKY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c32217-2317-4bea-f561-08db4faa1c5c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 09:53:44.3971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckl610/XuD9ncqB9myUUDZ/LSEGyNzQvHrh57dPqU4dcaD+eX2W2rRo0TzejGBPr2p4nrg9rEc0D6p151iiKqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243

On 01.05.2023 21:30, Jason Andryuk wrote:
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -13,6 +13,8 @@
>  #include <asm/msr.h>
>  #include <acpi/cpufreq/cpufreq.h>
>  
> +static bool hwp_in_use;

__ro_after_init again, please.

> --- a/xen/include/acpi/pdc_intel.h
> +++ b/xen/include/acpi/pdc_intel.h
> @@ -17,6 +17,7 @@
>  #define ACPI_PDC_C_C1_FFH		(0x0100)
>  #define ACPI_PDC_C_C2C3_FFH		(0x0200)
>  #define ACPI_PDC_SMP_P_HWCOORD		(0x0800)
> +#define ACPI_PDC_CPPC_NTV_INT		(0x1000)

I can probably live with NTV (albeit I'd prefer NATIVE), but INT is too
ambiguous for my taste: Can at least that become INTR, please?

With at least the minimal adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

