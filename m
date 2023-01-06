Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A91D660066
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 13:41:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472520.732762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDm2N-000791-Fk; Fri, 06 Jan 2023 12:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472520.732762; Fri, 06 Jan 2023 12:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDm2N-00075s-CJ; Fri, 06 Jan 2023 12:41:31 +0000
Received: by outflank-mailman (input) for mailman id 472520;
 Fri, 06 Jan 2023 12:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ggnj=5D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDm2L-0006zY-TI
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 12:41:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2055.outbound.protection.outlook.com [40.107.6.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6feb620b-8dbf-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 13:41:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8189.eurprd04.prod.outlook.com (2603:10a6:102:1c2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 12:41:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 12:41:26 +0000
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
X-Inumbo-ID: 6feb620b-8dbf-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDNeCI/9Mcs81yqa3FuUlVsUYVD52x2KheC+ryWkejk5FWbe2QJXhiNuHMP+5lZKGFxpCbDSs06f42g49OtV1nsgc4VxPzTiFNV2+aoxy924hRiC8xDTh5I3dSHbF5mx+KAhRdnsHn0CRzwMzfitba474IWEq5BK0f2rtYfswBXjwAd7B6qMTj+1FNAF4mgn4V7TjpRuGnMDF11uvjRm1/wQE9lDv14xm6g0RsRD11B7Y+Ld5ttqs2KUwHjg/4g38UN2Y0SBgtCDGVzrzOqSJzQCXEbHWEfhBPaiy8oMqa6olzR1lHo4APVmkNAZJxpZL+W0Zm5bYydKsJlTIYbYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LiZnKW8QO/RyfEYputoxeS3/lQZ5Rzk4LEiCHSD+Nw=;
 b=BS6l6sbeOxfrMss4I86APMahar1ul34O/9rSkBVzRnk+6S+5L57ojEMiftV0/VPWIKf1NsF7bhDvDz5pXMMf+sz2E3gzBuKbX7nrSVVlm/2M0Mz8Ynrum0G5bUERsIOnpJ+eJWJ1z13vrQrPccFDeS6jnj8J0mWYZ/5ssSSph1vc3O/1O128EH6KV6JeTNqcjoeUiUkfqJp2m9E9Czr3BlB/4hS9NWMVzl32mPD7jBb6oTzllOj0iGZxpZJeawPl97LmKlOc6T8DZ41/dPhWsAPlKw8XiSzfVINThvVR4Y6hY0ZTGdr8ksW9NrTexKZznKESBpAsHiPZSK10+qz1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LiZnKW8QO/RyfEYputoxeS3/lQZ5Rzk4LEiCHSD+Nw=;
 b=TdEeQrYUKHZSuLkvJovCcc3YzL0ZsVYwcu9ghYSvYoaD2bMA4WKOlaXaVWysc3U4tV+J8YAUTuAmWdDk+P4188H23DIFwDCYHaIluwNObuiwu32v28IPSHnVXuBJsE5X3H3HnA7iKFR6LVgnrhRq4RWX8z47dkYbP3ZY74niQmkkO3U8L+6pqWxbOULscXo1NVV+FZUMcjr/rnf3rMO1u1l89ZVq/TJb+WvI/pyNJ8NvvPN6YAyGUlPxJpYM7XpM5gpMYtYnK+o1+7ZUefL3UYOFd407bC8Rt5e/j0ztpNPeYGV7y9QvGWOYgim4R86AuAf9V/Q2UAlM/28t9a8ZUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8aa0a1a9-b69a-c201-e5de-0bd5ae6318d6@suse.com>
Date: Fri, 6 Jan 2023 13:41:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/S3: Restore Xen's MSR_PAT value on S3 resume
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230105204839.3676-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230105204839.3676-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: f4dad9d1-ec64-43b8-a9e4-08daefe35359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+VrNfjV8SeVJn8b0cG+NfPTVcj63RBb75aR/KNd0pIVGt7ap7m4ue/yLVaYfp7dWO52i+g+VCLqIMMeE4nGeL6sBcehv0o648yqxBJOdRvFTlvJVs7hY9gHdkFoqku4vVALM19RHjZoFDyNBrh46I1wpIe9FA1pPo+3L7A5u3alSVnI4QKNtjJ1uOPVQb0R/yY/KdyZLfM8GXMZbCIDuPeKuPOCegewdiV61jwxLNRI43p44KrTVjJiEl20+KPs+eCZcirlToSd4OdknGhpSffwP22Xuuvcb9XJb/yUR1dd2EtecA+/qFO085YTlZmKoKScBqCjIz0SA/7lxJXNcdQl6T+ssgPJRaPknfj7Sct/008ZaBbT5GHht5VcPMsyTWwOwTXbmG9EmbsBYgBqeOAF2QxjX2V1noFbOOmgq0qGONj2vAQKNIUZaUHUVnTaZBE35Cbmj6Y4xY60Oa5cnZIRg5U8gvJfN2lj0KdpVnEXxIF2fnR79BJd0z3tR6WejMSGIk/WtfB/BZ2IA1uhxHyOQ2dPBdnhP7w2vV+mZ4kdoJbJhKibIOfqNMRG8OGLk07VwEX/aew0Czvx+A9QdVgpZCWh4sTwJX9/PfDljkWNm0Z1HNYAws2BanL5/yiCSR/ESdxP2fB2gFHmfOozBjNOouoSIRCgATMdg9azkMYmQouMQ1qtnlxg8OwEWHJsLVGDkcuvYP8Xm9M+MGqAveZjff4TWpYftkS3gehHH/1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(2616005)(83380400001)(4326008)(8936002)(86362001)(38100700002)(36756003)(66946007)(66556008)(316002)(66476007)(2906002)(6916009)(54906003)(4744005)(186003)(6512007)(31686004)(5660300002)(53546011)(6506007)(8676002)(26005)(31696002)(41300700001)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym1GbmwvUEpnQjRsUVNSdHVZYmUzVkpUbUVtSjZHZlRQYTBiLzBWSWZFcHRF?=
 =?utf-8?B?UXB1dXMzVmxrZjBQMTZrbWVRWXBjQ3pseVZ4Vm9CZWNlbndETTBIR2pFTEFl?=
 =?utf-8?B?aHB5Y0NCVGYxdm1RSklobUZER01zU1FqdDV5RUI2M2llTS91elh6WkNLcEJB?=
 =?utf-8?B?Q2NFQ2tGZTlvS2ZBaUJLNlptWjg4cUNlS3l0VkdvdGFmMjJDU042NVZTTkwx?=
 =?utf-8?B?a09OVG1WZE13aHFOMnBZaFhXQnFYM3ZaYlRoWGRtZlZOWk5MTHhxajZyUlpt?=
 =?utf-8?B?b2VXUnJkdEFZWkxLeWFOY0lRTTR3L1ZXaVF6YzlTWHJBT01pN0lUV3pTMFkx?=
 =?utf-8?B?NEYzNTBqcWxXaXNYYzFRZGwzZXV6Vys0S0s5WSs4NG1HK0Jmb0ExejdDVkRr?=
 =?utf-8?B?L1poVjBNeWtvWUcwMS9TdFVqZXhBVHpHNGQxU0duTVVQYk10cFY5TjZLLzBX?=
 =?utf-8?B?QUluVTNaREMxS0NPMlFRM1FZVWl2cXpDa0lKdFZiL1Y1cnRGckw2WGdTenVN?=
 =?utf-8?B?cStMZWsxTW5hWUpRQ1F0d1hXcEFMeGN5eUJMbjRWSzZDMTB6U0kxa1VOTDcr?=
 =?utf-8?B?enhvRkNQR2xqN2o3MUQ0S042Y1NEYzRpbUlselBjQ1hvRThTVS9ORGg2dUxH?=
 =?utf-8?B?WDVmS24zRjVkV2tVczdwM2ZjMXpBQzcwQVNkOE9Hc1czbVVaWUM3VklJUGxv?=
 =?utf-8?B?MEJ3cjkydjFUWWFxUGxSSUVtdUJsMGFab2s0NDdldy84QXVSYjdLWlZFV0RX?=
 =?utf-8?B?TU82a2xoM1A1bTJKam5HbFp6Tzd6Ry96ZlFwME9JcjVrZkhEa0R2WWNmdUsw?=
 =?utf-8?B?OEpXMlFza0RkK0g5eDJsaUhJWGpOcW1OdFNyS2huOGtWQjBxdm8xWTFqSmhi?=
 =?utf-8?B?WXF1dUNPQVNPWks0YTRNcW8zQUZ1dTZBcGRBSnBTRThWVHZJTDRGUE1VdG9G?=
 =?utf-8?B?b0VoUmV1bEtMaC9EUnhVd1pFVU1DYmsvY0l2U1pEdGROKzlrdSt4dmVUbkl3?=
 =?utf-8?B?MmMySC9ZUythaktscVFuMnNuQU5rdWFzZ2VmU2hNbGxNa2plWFdtQVVXd3FU?=
 =?utf-8?B?VUVPYUlyd2tlZUlDUmM3aWp3Z0JDNkxQcHl3OFJYd3F1dENCanhEY1UwSEZr?=
 =?utf-8?B?ckR6SStlekdoemhuczE4MHQ3U2RmQmFhdktnTkpDOGhPNjRDZ01JQXlOUlFY?=
 =?utf-8?B?WEx5eDdLL1pMTEMxNnRna1N5eEI1SzBLUjI4Z2syM1FBc3JiWVMxaEJLb3Az?=
 =?utf-8?B?cW1ianFwcC9MekphZ3JMWE1zTWxuRTFjZG13WkU2dHc2MUVhQ0hmZTllM3NB?=
 =?utf-8?B?aE50TnkwcmcranBkVmdDWCttZ2N2MlA0Nm4rSU81L29VYVAvNm00WXZ4NTV2?=
 =?utf-8?B?VStYK3k2RTV6V1V4VmRTY1JTM0hBYy9KQ2dZSS9Sdi9LSEt0VUxCK2hCT0tY?=
 =?utf-8?B?YmVheldDcnNOb2pKY3piTmFqd3BUSTR5L1hwSVZpRHV0ZXI0bTl3QXJadUFp?=
 =?utf-8?B?VHVldzdiRDdZMUV0ellWdERwU1JvdXhQaGVOMnpyemFoZ1ljNmdaNEg2OU82?=
 =?utf-8?B?cEcyS1ZjeVE2aEZoRHh2OENObDVBMXE5VHIraW0wUXFPZ2ViV1VxN2xCVWlX?=
 =?utf-8?B?MzNmbkhMVzh3Z1ljQmFEL3JjRFJjUXRhWnpVSjFub2p5YnlvV0hRanVuM3RB?=
 =?utf-8?B?MEIvRXUzeWh6R1VJY3A1VVJHNFVxS0ZuRVpoRGZ2Mi9IMzFDNnlYZkR5MDI2?=
 =?utf-8?B?ckZlQ3R3N1YyaTNSeUFhVTBDK0hOYUwyVzJLaVdySzd5dWVzREdXWEl2cldT?=
 =?utf-8?B?SG44cHI0WUNydSt5K1ZydDNUTTlpdjlJNlg2b1NTSnZpby80eFdEbWp1Mngy?=
 =?utf-8?B?TU1IUlNLZFV4QlRnV1lGbWhqb1Zncno2RVZRUEdJdU1iMUR6eHZqcTJIZGZT?=
 =?utf-8?B?cUhpUTl2THpOTW5wRitpbFJTcXpqeXhBbFNsNkFiOHU5cUszY0M4WkIrNDFy?=
 =?utf-8?B?M3NOT3l3SXNEZXFTOUV1QlJBUDhHUjRsaXVhTEpwZmE2eXVReWE2c0RSQVMr?=
 =?utf-8?B?M0dBemNVdzE1Sm5aM2YybnRXcGljUXN5aFlwVzRPM3BEZnBLZUZMZGhsaWM3?=
 =?utf-8?Q?+DmvzRF0BIaHhVFqfhIslTdM6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dad9d1-ec64-43b8-a9e4-08daefe35359
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 12:41:26.3064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NQCFnaSVvFpcK/XOnwg/IvV+A4N+xkEGshuGKuZVQb0BPPZWFg0pnua/V7Ier12WAg2GZWeOUbNgP2b3RHeNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8189

On 05.01.2023 21:48, Andrew Cooper wrote:
> There are two paths in the trampoline, and Xen's PAT needs setting up in both,
> not just the boot path.
> 
> Fixes: 4304ff420e51 ("x86/S3: Drop {save,restore}_rest_processor_state() completely")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



