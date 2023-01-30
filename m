Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ADE680753
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 09:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486632.754030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPQg-0002yx-2U; Mon, 30 Jan 2023 08:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486632.754030; Mon, 30 Jan 2023 08:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPQf-0002wr-VC; Mon, 30 Jan 2023 08:22:17 +0000
Received: by outflank-mailman (input) for mailman id 486632;
 Mon, 30 Jan 2023 08:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMPQe-0002we-Ep
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 08:22:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2075.outbound.protection.outlook.com [40.107.241.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33e27235-a077-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 09:22:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7533.eurprd04.prod.outlook.com (2603:10a6:102:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 08:22:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 08:22:11 +0000
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
X-Inumbo-ID: 33e27235-a077-11ed-9ec0-891035b88211
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI/25ojHHKB8HK6uFQY39DwZ2SA7W+YRT50SxoTzOW9rrotGvQAaC4WrjMRAAqxFej+dztZh20tjEuAxYU1qGeny8uOXN3IXFUTfhVeCgDYe9HhMomevc7shAjlIq8dcF2Q2UHImtxZ7gb8qu5DUxdvSIZIeBS1hAJXZPU+RCBY+ryGDi3gcvQ7YSyFvVpsdCShksinxOFtidrqFmg3auscqgY9/kuYII+2nA57slQKLNNnOQJ0jpMmQ2d3xgVPcwTL5sI+S4dUgUpjdDeMFnUH8nB2U1YFbibfUvcJS3WtkF7J1WKX0OT6xa2xhHR2HQ7BU7CQwsNM7dZ3o6mbxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJpCjFzdC0n2mF6Ymmtvo8Q5F6HG/DxAdfWVkx9uERA=;
 b=ded/l1CG89Wn5bDYXL6vfYp5qzH/gi3P4hxfJIzEhuhuhn1r/UW1DrOtQJMufly4nGWBd2Fxs0Nc82EMdh97VhYQzWTgDoQZzXy7YwDr8dLFbbk4DK9Cha7iLstjvSv/gnu0neGT+w2zYh5CHiIKEiOl8Pao3Ub/y1V/iR9gwns7Zhpa0dJrLjwsUBDxPIs5IuXcUU1BEvbWYcUWP0ftoVUCTdsO50UrkgFTQC8yBX0bP/O4mFT4nkG3iYaWNl84kczLJ5MqgkSerSs3uoQiaN1K74vH+LDi8f5CEclf3DIAY21qp5uRZ+JGXLeYI+8NLhdzwAMYnRBaKSbJ2MN4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJpCjFzdC0n2mF6Ymmtvo8Q5F6HG/DxAdfWVkx9uERA=;
 b=2Yc3ItjJWTf+Doi10aoHaDRtSOPhs0bbaXWvXePsZmff8PHPY42OyrlI1u8Iw6qPaSL0zRQ557WzXmG3MpWtVbU/P6gscFWqa/6unFl1d3Q0wbTu6+aDk65Oyt/tB22b7jkx22CA8NIEacBxxU4WHvGaPFqpGPqDuZo05xCXFswLNDeFFEsZGGQW25VONiuhzuAjEVdEqeQvb30bMYxAc7albxr7wJYtpb06T7Am43M4k2wHk2LlCyK6FJeMhcdMxOIYzkzd1VILZDr6z46SjZ76ZnWpe5bGXdQQ5s3U33FWANr9eOCLRN1xV8ru546mZpm+iTMNj/KINIPDi0R3lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfccbe22-e5e4-40d3-aded-639d812bfa08@suse.com>
Date: Mon, 30 Jan 2023 09:22:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] xen/x86: public: add TSC defines for cpuid leaf 4
Content-Language: en-US
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
References: <0c4eb4ba-4314-02c7-62d5-b08a3573fcc2@suse.com>
 <20230127185103.GB1955@templeofstupid.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230127185103.GB1955@templeofstupid.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7b307b-88bd-4dc4-f115-08db029b1595
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/7CHL5RgFR3gUXwG4mNGFdIlmQTSLC8IKgVYnOFbw0wq+nJNNjzj8ogWi3VHuL74E+EYkH240u5tZiw0H/xbGFE8l3L2Zcaov6w7HIgC1GHa7Y1y1gArdto0xkqaosIIzIHLRrM7Q8ckmoaJwYoqe2t79kWP+4QdihHLKGxgmvHXUdwcSisBlFZnhklsu2qeZgtgW96GnXFewg7Rva00O+ak5/+3xb+Ju3yGTf1Tiuu4tMOA9Y0DMbWonrr0KZH77vVqhNxPH4vKtZfYvHmAEvKWydlCiJUZUhAiVRHmoD81strAwTUL55A9qx2bXutxhh+hmCBZJ+hAU201kWNjsdtZfrG3dJ3PHT1AT0YbR45Nj4ylBpcRCMMO7lSY0NmpWT4LmAFejSEIU+F6CLMNDdaUORJhxtL6TEiem9CvTMj/IEpjkyhah7H/ATYf4EZK+TAc1XiID5giBXjQeO9p+9g9X8Z7jE6Npw5ogVDlrwmrud61X7BU0fk0a6hxhmyWFm7LnW09657HYk2VUDRSd5NMlCrOy8N3Dz2k5IuEjIU6WoBQtWHSVOl4lD9EEh8R0DwY6WIecBLx1AjnpFoNDP4MLkjOdTiehp6yhSXUtLILIY7+YEV0VGMKgmUUZTEMxCcjoH1KY6+8/mQ8wT92hYWC1HA1sZ0fHARaQhGgse69T8gYLIJQLHf5wjXbPJ/JRhihvszZ2L1eyVpMOt2kz8jXFNrWUSG9F+C9RWXXaPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(31696002)(86362001)(38100700002)(36756003)(8936002)(5660300002)(66946007)(66476007)(54906003)(316002)(6916009)(66556008)(8676002)(4326008)(2906002)(4744005)(2616005)(6486002)(478600001)(41300700001)(53546011)(26005)(6506007)(6512007)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um82WUE5UmIrbjkyRERjYVBkMVNoVGtMbzZpREtLWTRaNWdMcHZWSVlvTnZO?=
 =?utf-8?B?Z1d6b1FqOTFJT3VuMHRLNTJTUWl6NWQwaDFCQjNNM0x4L0h6MmM4SXVqWTZj?=
 =?utf-8?B?VTh3TjZwc1JIaDNDWUYzU2RnQVVTR3pML0hDVGRCK0hrYnYrMnNMZHZmakJv?=
 =?utf-8?B?L09ZYTdkS3p2WmRyaW56UUJVUG8wRmN5cXhqWUI3Z3piSEpLWkhEVUt0aFRT?=
 =?utf-8?B?NU9JajRlNGFzQ0Vic2J2UExYYWd3VC9ENEV3a1haK1hRRnhhNFNNOWZSZzNF?=
 =?utf-8?B?RllUZ2xYLzdFUWgzRXVDNHBCRGtpaS8zMTF6NTFlVkhrVWFzdHZocjgrLytP?=
 =?utf-8?B?Vk5oaG9sV0g3WWE1Qi9HcWR4M3o1UzA1Wi8wSTNGaWhnL25ib01kcUNBeHRZ?=
 =?utf-8?B?U0tibmpwRTVrVFg1UDZPdjNicndZWkZsaFNyWEgyYkpCMGRrbWVpOEpBdk5I?=
 =?utf-8?B?N0Y3Qk1uVWZSamJadXpvWlhaQkNQT1VDbzBDSDZTNWdrRXhjSUdFVEN1bmVE?=
 =?utf-8?B?ZFNWTDZaVnY2NEJ4ZGMwUlhXdU1mSFNjTkxSTDJjU05UR29oNUlkSGVSL3Nq?=
 =?utf-8?B?WXd1TmcyWTFSSjZYNkl0UFgzcVA0a2Y3Mi9RL0dyQ292eEY3Z2FRUlNxdnZ0?=
 =?utf-8?B?RklxTVNXOTZSSDhnM2RZNkpyeFlJMUo1VkNYeEFZK2I0ZFVjT0ppVTQreU45?=
 =?utf-8?B?cVREby9wTG4ycER2UE5ydzhlMnkwY1ZVMnJJQ3JiWVNLTnZWSmZQeXJHc3JD?=
 =?utf-8?B?NTBnWkNSS0Q2U1lGL0dzRjhubGh3M054NlZBQnFXWm9yZGRvQUIvV1EzbkRL?=
 =?utf-8?B?V2l0OEZGb0xCZlB6cVJjMk5vTEFaaElhcUc1STRKQjFHM1MrSXJLQmJEc21R?=
 =?utf-8?B?WGg4bWdkbm5vQjExcGR5RW53MHJRUjR1Y1A2ejhkNXVjZHFuZElSdnhQcnln?=
 =?utf-8?B?ZXZxQzhZa3V6eVdLTFVzcHpMM1VzK3krRVpmdzZYdkpjcEQydmtSY0hxbHZX?=
 =?utf-8?B?K044TjVlSE5oN25iUnVTdG5DcTBuVHpyOHhXc3RGSjFBUHZ2bnREMzVVRElk?=
 =?utf-8?B?blUyanJ2NFFFaFZZK2lPaXlyNEhBdDl1SnlsODM0S2tLRDByOTVRaklORThC?=
 =?utf-8?B?NlBiQ3FSTEp5S2NhS0kydG56emVZZ3BZZUJYZmpZRVYxR0N1WG5tOUREaTg0?=
 =?utf-8?B?NjRxYkdkdFhNM29hUDFQMjNjNElLTFZXbDhQY0hvWmRUWVl5TFYvSGRYVGdE?=
 =?utf-8?B?OFpaZ2NLMThFL3lOVkxlaDRWNm4wOE5Bem9YSDdRdWRaZWl1VjhoY0Y2TkNP?=
 =?utf-8?B?QXdOZFBWOStaWWVMdzhFb2tiQS9UOElOSHF0V0FpR1l3Rk9MSm54MktkSElz?=
 =?utf-8?B?WkJrTlR3anZvYlJEYnNxd21OWHd3OXBBay9nN1lzdVlLbVZGT1lsaWI1V0lw?=
 =?utf-8?B?VGd2R0M2QmxIa1h2ODNiaUVZbkpkTGphNHZ0WDM4akZJK0xSdUpSMS9qNHcz?=
 =?utf-8?B?MENvS1I1T21XeG5lVVVsUGFLTk5DaHVRNUhmZkNyYkxCZEVSVDNWWEJPcGtE?=
 =?utf-8?B?S1V1a2FiZWxDanpBTjJ2c29TY2FOaHpOSVlUek5UWDUwQ2cxRFo0MEREaDRD?=
 =?utf-8?B?ellkeUpROXl1OWhDWGlTK1BNMkFGRVVUSEpSQTVhVWtDNkNKWVdLQTg0RWFn?=
 =?utf-8?B?WGRxY1RTMWhQb2VnRU8yWnUyZ0RBcCt3S2QwaVNsNFJCKzFUZ1I5Y1BHTXpl?=
 =?utf-8?B?KzJKczRnRmZTYTIyM0p5U0VMWUtHMjlxVFh5M3ZUQ2VRNkt3SkNHUWFXQXR1?=
 =?utf-8?B?dlBFaFpkTnBFNEZZL3V2TFBkU3BSd2R4RjBUc1huL2lzNThWSWFpelBKWTdE?=
 =?utf-8?B?dFBQaTQ0YlBqOUlYNmVuUFpLRXFBY3Q2U3UrcWVFdGswT2NaUGl1L3ZhWHdw?=
 =?utf-8?B?VmdQRHdCSWwyZkFFVE5JSGgvNThOdC9odmlGNUxqalVXYnBxZTM0N25tbzc4?=
 =?utf-8?B?MWJlNmZoQitxbWxJZ05ta1d3SUw1YlEyMGtFS2NjaE04cmNqaS9POUdvMmRL?=
 =?utf-8?B?SGFQSENKMlcxdGh1SW16Q3ZUY0I5SS8vWForUzNQckhLTGRpeFlnM3ZReGVI?=
 =?utf-8?Q?SOT50YZExUgPGZBJNFnqfHVj4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7b307b-88bd-4dc4-f115-08db029b1595
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:22:11.1828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1CNVpBbDn71FF2dOGiORfAzjEygzgjC67EIj+yTU5zqWRVeHQTK4dajWowBbNQI2seFeqr5cwFFMGt8HB0FdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7533

On 27.01.2023 19:51, Krister Johansen wrote:
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -72,6 +72,15 @@
>   * Sub-leaf 2: EAX: host tsc frequency in kHz
>   */
>  
> +#define XEN_CPUID_TSC_EMULATED               (1u << 0)
> +#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
> +#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
> +
> +#define XEN_CPUID_TSC_MODE_DEFAULT               (0)
> +#define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE        (1u)
> +#define XEN_CPUID_TSC_MODE_NEVER_EMULATE         (2u)
> +#define XEN_CPUID_TSC_MODE_NEVER_EMULATE_TSC_AUX (3u)

While perhaps it doesn't matter much with the mode no longer supported,
I'd prefer if here we used the original name (PVRDTSCP) as well.
Preferably with that adjustment (which once again I'd be happy to do
while committing, albeit I'd like to wait with that until osstest is in
a better mood again)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

