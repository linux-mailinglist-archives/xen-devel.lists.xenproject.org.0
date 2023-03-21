Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80476C377F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512882.793233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefJF-0001cd-3j; Tue, 21 Mar 2023 16:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512882.793233; Tue, 21 Mar 2023 16:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefJE-0001av-Vv; Tue, 21 Mar 2023 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 512882;
 Tue, 21 Mar 2023 16:58:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pefJC-0001ap-Te
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:58:02 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe02::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 891bdd10-c809-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 17:58:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8522.eurprd04.prod.outlook.com (2603:10a6:20b:431::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:57:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:57:58 +0000
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
X-Inumbo-ID: 891bdd10-c809-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpGVprCSIueOR58k+eOsxA1P4eY3IxUE/R7jbxaNgm50fohF0VSgj1flUfitMDq96ovCxOE3S+/QJ0MgMy0FgPWOOYCw0xQWAUuRVbRfq1H4geThaoTGp0Pt4bdMIC/8VZjewwdYtleq9nKSCN0vKqc6jbg8GZi8ZuUPygGnsSTrSd4RMSgX8syMnssYtlFH/bFJ9UxYS+Qh6ijfvSikD48UYYn6UMzs15NTAOsNI4DLC1MFK3TCdLhsS4IWpjsSSUsf+Ln3UYqGVyjcgDEGTf0bsRTxxlJ+Y/uxYm1ZU0gTTqCnV5CXrfWVrbldBQu3Hu1UioKGVzzuYFJCnQS31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JWnvlmSS/rEgkcKvReQNnqmSqyhEp8rVlYj9l55BmM=;
 b=fFREadssMqBJ+jJBUcXW8qrD0s8f3VcMIFGOoiLN/FClPSo/R+oYhkQXFiV8yCJii4OYylg8AZ3kQwt9XGa+DdF0ZL9FPqPToLIPF6HTYNCD62gZlgs32CHG9vhXb7u4mtFX2MgJb6eQCsqNwZWDwFrjv/2xvUB0RxUs9WUZfqIBHrlb6hFrL2n4h2sYcBW0GuRsQBH+NOcjKajKzgBWWtppAtRd9hAWjVb3ZQ3ngaGTpNu0YbuEMcO+hVLbqbVB3STNXgTUF3MMoX6wyxfugm0LRf+dfqG7ys3dEDAc5F7GbUnNP6Ns6MpHX3wcn6RYumsPVx4pKpgp+9tzOlg96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JWnvlmSS/rEgkcKvReQNnqmSqyhEp8rVlYj9l55BmM=;
 b=dtK1rEl6ShMftp7/vXfkd3rCliYB3wB6beeWJEbjdzyDqJc2oi4nPWxYajIhUyTrvtaUzxYmjgiF3NTAZVlikb8rNhlSsXkKXoRgWk8B+4efru58jEqyy0JhjgK6UGKrqkVv0U6pIXEMgQJ/amxeB0+nmzLQJBwCb5c8Z/cnXtXqOnzqb3IPVJ+nvHhv+svf4m3Khl5KDY2UvUKtiylP7SSzQCVbHUTXFJQ4eX9403wXaRsMjU6pdwmNtQNb8vgrQL+Ffk/ZuSKpbCroI4VfslzJHTF35ejgvFHPCGKu0F3vzKxJ19Hnq0GedEhbOOihMqiHFeUJ1yrt8tDRmJdWxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1690457c-6986-065f-524b-92db1dc8ce09@suse.com>
Date: Tue, 21 Mar 2023 17:57:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] move {,vcpu_}show_execution_state() declarations to
 common header
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fc2156d8-76d7-b6d2-3d39-266dbbf4a0fb@suse.com>
 <c41b6b39-5ed3-cddb-18f8-41d895aceada@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c41b6b39-5ed3-cddb-18f8-41d895aceada@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 499b3aa6-a65e-488d-5a6a-08db2a2d6c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mWHz/15sWDbuX4AaUpmxPBS4GY8iGhMtdUqRz+xcDL2stDyfBRH5X62/9/J4VTc23LjXufGqZTDuI7pWph0PHELTsppZWJ+JCT2Mb2DlGJud8H1rDXUNdT+M4o/o1CHIAZcM7ddFOFDb4ySBI/0d2vDtBkNCRsU3t9Xq1HgRi+1WSEQ//VPEa4pWNhISgzzlODEuvffhSQR09VDIxW2AXqwrEtgAbUG1pItRj3gfXUPtPDIv7EAl49vzX2DWgGlAGlNuvJZcnardVNKE+mHc4RmaqjrSinz9ATMtUHN0muKnL44zQMKzaEbd2N1mgYE0hHJ6zufkWY2q8beL3m16yHjSbZ6z9XTRWUcAf6DkDcxd9uTXJH3FHAC4CRK0J6w0JuOwr3ARNw8XsbFfyRdktEfaNbpUSuCeVwnzWu63W66FfVaJtu/NlM5lddom9KbLuRQm3SnAgZTEhcXfXXO3jOdkEjsnNPneVd6tSVuZX9KQBJmQA315gNj0TjhR710tFvAoeaiwRJN7zzOITRebdhV/Z3kKuZXNr3+nFU5ibx9LzjV/p0smZ7HlVg0DXt+eX1fu56dwY9b1Gaz8o17aWGxsov5t8HJvXEKXtYVHttAlfMmxHySDIZOG5x1VMcFjTsNsOk0a+QxKRGMTAEZngeb/Nte9mKUOpoE92DLbdij7D/QVp0wPS5Dy1fnPLsUMJG2l35Rr14wKh3yLYfi/0TAv2N85dix/1RoDWXGQZjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199018)(36756003)(6486002)(54906003)(478600001)(38100700002)(5660300002)(66556008)(41300700001)(2906002)(7416002)(66476007)(4326008)(66946007)(6916009)(316002)(8936002)(186003)(2616005)(53546011)(6512007)(6506007)(31696002)(86362001)(8676002)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWVPMHl2QUszRE9wNW1QTEFac29KcityNnlPbUx2WVdYR3lZNm9ZQnZBQ2t4?=
 =?utf-8?B?d1c5MUJMZFd1dkl3OWlVRENicG81VTRCazh5Zm1EOUt4dU9wRXI1NUl3c09E?=
 =?utf-8?B?WTVsWGM4cnpiVWVnaG1vM21kam8xTThQMVdHclJTV3hzckdyN01zL2xxMUh5?=
 =?utf-8?B?S1hkc3dQa2VsVmkwSUdjbFFrci9UYlVXeGJmb3pPaStOVGxGQkVBSDFUN0J4?=
 =?utf-8?B?TDVnNTlZWGNCcFhwR00xQjZFVWRqZWZHVTc4WTVDcFl6ZXV2WUxkb2ZhUHZn?=
 =?utf-8?B?ZTArU0tKZ2REU093eVZ0VC96bTVPYWpVdTVEelYzNFFTazUxSE9nYnFqZG5v?=
 =?utf-8?B?dXJiSlpGTWhPLzM5cG9iam1hRHRsS3RtMDAxR2pkZjdIZy9DYVZYUmpMZ3Vh?=
 =?utf-8?B?bmFmN09YUFdTYm9TVFFWOEFIbTVvZmo5TzJhYTd5cnd3Sm5QS2hQbGZhUEg4?=
 =?utf-8?B?dVZlcmxwNWdieS9Pa1VPNzNaNDdYdzNKMERiMk9xdEh3RU1iOFBvK0J1S0Fy?=
 =?utf-8?B?TVk2ZjBjcXEzeTB1cHFCQnVyeDRZTStsaGkvSEhjU0pWQlJPTzNBd3dPNG5r?=
 =?utf-8?B?Yk5pZXI2NWhPUmtXQTNPSG11OXdCU0pzdC8zQTQzOW9oR1MwR2ZCWXVEa1BF?=
 =?utf-8?B?bjhORXNMYktWdGxYMlFtMnJHbVFwQ1pka3I4Nm1LTGw1Z0t6SkpJM1JQMmtZ?=
 =?utf-8?B?VlBVVEkyeVlMUEdMNzNkKzJ4L3lISG44bjhPaXFSamxBTGxwOWthRnJ5dDZw?=
 =?utf-8?B?NXZNVVJZYVdTMkxES0hlUEQyWHprYkZIYlNnZ21GdXhpS1dvREMrT24vTG51?=
 =?utf-8?B?NXhXeWxkenVqMDhnR3Z1M25tL0VLQ0pheFY2bVQwSDRmblA4VFRQbmF6dCtZ?=
 =?utf-8?B?YjdYY2VwYlFwZm5pT2dVTm45ZksvcTBqb1NBQVdKdm4vMSsxNmJjMEJJNWlt?=
 =?utf-8?B?dEFIWmV1cXFublphKzlHMDdLc2c5T0FCcHZ1ZlFkOEUvZm5lMXdaWFR1alMv?=
 =?utf-8?B?NEZWK0ZYVmtNWHdhTDEva01GN2NNY1lqUUEvVTcxWDhDNHBsUjhNV1VzUnRY?=
 =?utf-8?B?MGZ0SjRaWTZTNUpZT0pCNlBtL1psV1Ara0wwNDZ1NkcvOUFvMERFby9mRHdB?=
 =?utf-8?B?b1NzVm9wMTZSTDgxcHdpMUExcVR2ajBOamhsRERLUUpuM3BWUU5DWklBTDJY?=
 =?utf-8?B?NWhwRWcvVzhOa0pxUEozRzhoVjdPNFB3d2NIaE9hQUdIWEROeU9jQlhOWnhU?=
 =?utf-8?B?TmVMUmZWekUrZDJDRUVuNXJCZXRXV0dxQTVDU0V0SElFSHp0clRXY282N0J3?=
 =?utf-8?B?OU9WSE5MSGMwTjUxRmxHUzJKWDBSaXRvaFVTcTN2YjFPNFBRbTV5V1lvUm9k?=
 =?utf-8?B?aVVVekFNMGJQWWhXSldzNWJSL2Fua1BoUmN6enhNS0xhaVlSR0tubU9pWktJ?=
 =?utf-8?B?em83RFoxQW44MTV0d0I4NUM4WUNsS1VXK3FjQWJwMEVoWWFLVlZOVTdVT3Y4?=
 =?utf-8?B?bVBaTkkvdEZ6WlNSSEdlZTdLdnlGa2NpRGRHTW41a0Q4S2FiUGtlRXFaU3o3?=
 =?utf-8?B?UStFR1Y2SUp3THpUS1VEcCtoRkdHRGlFM0JvRnFCZ25BbTdiLzR6QTBnN2Nt?=
 =?utf-8?B?R0tnSGJLMitKTXdsek4vUXRJWDlCUzhvVkdIWXh4UHNSZ1djVitKQ3ZyZWFz?=
 =?utf-8?B?YzFwNkNCL25XYTdzTXJpR1JBWG0xWU54ZTNsTGlaaEMwd1IrRkhNMWhqdmtP?=
 =?utf-8?B?cUZkS2JjZEJrTk9nWWdoT0s2QU9oK2xLOHU0VUVtVUhzdzV4N1Y4L21OYnc1?=
 =?utf-8?B?amE1aW1qM0F1YVhSVTNYQkQ0d3dQN2NyY3JQaVF2emp5TnJrajVFWjhLZzlh?=
 =?utf-8?B?REw2Zk10Q05ydmxGQ2lmblIwSDRWR3NZMk1DQlZTaEdxNFlkSHpTYUI1S1Vw?=
 =?utf-8?B?MGZWL0dGUkJQTTJuKzdBanVBbklObDhWNlovVERJU0cvWU1UOHBkRWIybUlp?=
 =?utf-8?B?cndGNHd4UENFcCtyV2g4TE1iTzc4ZzJHNk91Q1hmUWxTUXJWMXFWaWFlNWY3?=
 =?utf-8?B?a0ZUOERWR0VEUzlSakpTZGloRHVYRFJOTFVDUkVxQi9YMjFLQ1Urb3d5aFVR?=
 =?utf-8?Q?0UIQ1P9vvX5MRkaoGl2gWhnII?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499b3aa6-a65e-488d-5a6a-08db2a2d6c34
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:57:58.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WD8zGsGVlstRZml9SolfEugJKGptg0/r1PrM7Qrslcnyug4yrpTjgGnwx/mPg9VkWrVBGQjmIVvaW2Gd/nxxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8522

On 21.03.2023 17:44, Julien Grall wrote:
> On 16/03/2023 11:55, Jan Beulich wrote:
>> These are used from common code, so their signatures should be
>> consistent across architectures. This is achieved / guaranteed easiest
>> when their declarations are in a common header.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> There's no really good header to put the decls, imo; I wanted to avoid
>> the already overcrowded sched.h. show_execution_state_nonconst(), being
>> there solely for dump_execution_state(), could of course live in the
>> upcoming xen/bug.h ...
>>
>> Is there a reason that Arm (still) expands dump_execution_state() to
>> WARN()? Without that moving x86's show_execution_state_nonconst()
>> definition to common code would also make sense (it could be done
>> anyway, but then at the expense of introducing dead code to Arm),
>> perhaps (see also above) into the upcoming common/bug.c.
> 
> run_in_exception_handler() was only properly implemented a couple of 
> years ago on Arm and we didn't switch dump_execution_state() to use it.
> 
> That said, the current implementation of run_in_exception_handler() 
> would not be correct for dump_execution_state() because it clobbers 
> x0/r0 on Arm.
> 
> This should be addressed with Oleksandr work to consolidate the bug 
> infrastructure. So it would be fine to move the helper to common code now.

Well, Oleksii's work hasn't landed yet. I'll try to remember to follow
up once it has.

> Alternatively this can be left as a clean-up because 
> dump_executation_state() could now be common.
> 
> Anyway:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan

