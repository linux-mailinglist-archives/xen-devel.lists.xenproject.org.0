Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7B67C7D4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 10:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484906.751785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKz0H-0004K9-CD; Thu, 26 Jan 2023 09:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484906.751785; Thu, 26 Jan 2023 09:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKz0H-0004Gk-8X; Thu, 26 Jan 2023 09:57:09 +0000
Received: by outflank-mailman (input) for mailman id 484906;
 Thu, 26 Jan 2023 09:57:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKz0F-0003qG-Jm
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 09:57:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b5ea4f-9d5f-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 10:57:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7361.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 09:57:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 09:57:03 +0000
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
X-Inumbo-ID: c9b5ea4f-9d5f-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmZuvCnnBRPr9tyXCAabttiQSspZplr43yea8CiTEhD0JI5ldq9cpg/A7NCw9YpV/hdQ80QEQfoBSMqDqzI4uluTwbmIDQkCl3MPR4B4KUgCjxN2B6ulc7uHt3ZWPbKMOhycBBDByzAVjmo9+wyo//KSkUihGMbug7RhPbqlT/K6S1iGbJwDyvtjyF/cNpFa1rSW2IaS2X5O6AQHV3apXQ+mI3slD28cXg7+NU4o0uuR31MmHNLMjuAVl36BmTA4LxRSEur0myUbHk4cffLcfQTZCSce5qxh1RNkPhe53mhPw8gZwIAdOLyHB0J60QTllJhniL9eYcle3V+pfU5B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u+EaJubThqqUuPcnofIEnkd2+LmR9QAnIGiAZG6LQw=;
 b=DRA6QNuW9+D3D+w9ARLAJVXPKpvYC826N6WT+N8YyvX9QSkjREbRpEZzXbbqdJA0Mfhg9eyoAEsrmcQcSOHCruGYaHsNEO/Rz1cRDMfJc4u9SRMTn4Ap3Ze2SXIJ+VFeob4lKNLc0B6jYVOdEusdJVo2TkYmqkg2K/Ia/K8qbqQBIaqf2IlHWLC7xjc1ang3p4o4U92wMffneTn36hNFC+QrZUOMM1BMn5foS2OCA3M61B7y0nA9rPuYcHtpyAOj/TVaYEVko9OUMTWRRoWhheffsZFGW/tY/ZdW9GUNnV4GRBDs1crUsFhfPEehqaNKSM0kS1YWZpPzJ2omDf9SKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u+EaJubThqqUuPcnofIEnkd2+LmR9QAnIGiAZG6LQw=;
 b=XkekT/Ym1gBG4o1gZ6PygaTXiXIgWD9tc1Y4fHpurxcShfv1URnSmTNtW5pc4hkmlga3MZdXUgxHulg7obCm+XfUCb17l2I+b1zYhh5qQhK2nFuDmcd9bkZNZAhE846zOEtA+IWHYzlMoF8z70CqfcBpj7PmCxlN4Z8rbDnLoHpyab9ffG+L6Zo59BZeCGLuut3fMsTUTt6p/x6OqLMLj0U3qJ1YXZDTeVQWw5IvGKGZ4rcGxw34bjWZbgg9Ylg2RuGcDEvWt50KtQvsuIs6D200+qLGrs9aOGc+6GkplzHsOGQdrbZLmzZzxdRyd5FbgIXr9qjeHPw9GkJm2XJehA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77576aab-93bf-5f6a-9b04-17eaf1d84ffb@suse.com>
Date: Thu, 26 Jan 2023 10:57:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Content-Language: en-US
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
References: <20230125184506.GE1963@templeofstupid.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230125184506.GE1963@templeofstupid.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e83e82-042e-4929-453c-08daff83acd4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CgvWJm0662OsUUvG+9lq+8sPjGfuLXnhaiAXKMZKU8qtVfIxM3mCHB3lyEImpWO9AjLtI/B54J73w3mBJQBnF+sXh+lMkdjan8M4kTAa5/rDMu93kpSz4ePhMe461yr/v0NUDOuKSHY4z1/o2v3a3yCdXT83dAj+NhGehBHi82hDltVjzsRMHOmFvsyCpXxkp5rwXEtBz5M+RoIRY2Zk6jsUpXa2TQ6zByqCEvvO4BG+yOvzYfLWvSur6uuLi7IDqwAfDok4uqtGPkEcfaf8+w/nA+8H6X8eaS7wlV/qiTGKii9p8+afRdf9C5AR/YDGH2M+WTXvKa5Lprlfn0bx595SUiNNbXChkTiEMyYYfqhR1OzF8MyuQiVpBxXbK3FPdPEq4WcN5PJp9IGrj6PWDGJp5eSzmylYh9O0mCzd42supyPsQJ5IbhZiFhFf292W7wbrhCbod25apG6vMWM4GG9lJj5MCyA4cgQr5CmiJKjdwM7ULk047FoXGHvLfUSAy3DEscdl0E9WcyIZ5vwCfI+HZP/s6i7ql5emnz9RmNhchMf31MWu+NpKcM17yIDX568p3GzJBLDFl0bTS1wOwzdrLzOePMd/dDRJHG7Aovxa1dIwqP4vGVTM6bjAsJpcQubPAikyu8Ah7AZ+bprP5JREFk2+KCcl/yyj74jYqsY9EfkMbdeS3AkPZajfQSIX8j/ZN3EoHAQ7VtEDnd7OJexPitXaYTnf2sAzX7asqG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199018)(8936002)(86362001)(31696002)(4326008)(6916009)(36756003)(41300700001)(8676002)(66476007)(66556008)(38100700002)(66946007)(6486002)(478600001)(31686004)(6506007)(53546011)(26005)(54906003)(4744005)(2906002)(186003)(2616005)(316002)(6512007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlUydEhyTVBuaHBBMnhseUNmWUk1WWVKTWRqQXh6aWhTNldqTHd0T0RDOUxB?=
 =?utf-8?B?SktSQmxWQnk3QlV6ZEh0WlNleElyZ2w4b0hxejNlNThLcWl2dXlnczRvNUpt?=
 =?utf-8?B?Mkx3bVpCZUxWOFRIdC9QYU1YcHc0empudUJzTFN0TnM5WGlOZUZOMnEyODZI?=
 =?utf-8?B?cXNpMmxpK1hReUVCODlGL1Vhc3U2aVIyTXZOM0JFcWxIYVNwUTRuT3NRVmsr?=
 =?utf-8?B?dFA2NkpYbzlnbmVKbmtNTVVBdEtJMG5BeWFOUytVZlZZaEVrTDFhbjZxZTB6?=
 =?utf-8?B?UHhRR3BER1RwSlA0OVlhcmpCczFTSXZtVXA3REZQVmUvdkNKWDhLMWl1SENr?=
 =?utf-8?B?VGJ2a0gvbWY2ajNjMWpNVE03OUg5WmprVlJFWVY1cHMzZndwRC9MUmF2clM2?=
 =?utf-8?B?NlRPeXQyMG1qN3c3M3dhOTA1Y2YwTWNLdDJyMEI0cU8vS1c3WlN0aGErZE5w?=
 =?utf-8?B?cW5odmVWVzJSMldlb0VDYXFhSlZ0UkJ0LzJ6dGpXTnFhYVRRSUZhM1doeEx3?=
 =?utf-8?B?VjEvUERXUGMyNGtENk00K04xYitES3RmemIyNVBYdmlGbDlpTHNJZWpReFB6?=
 =?utf-8?B?Wmc2enZUTU1uVkpFS0M0QnM5WGQxRHcyaTdMZ0FMazhURUN2K3JOcXk4bTZF?=
 =?utf-8?B?YUVxd2YxaitXZzZBRlNybjY4Qkk2UnJyNkd5YlpUa3ptZm13Ujk2MGVYcllM?=
 =?utf-8?B?d1g0Q0FwOVQwTEFTQnNjY3h4bk9TS3ZFTUhyckJBUFQ2QjJqTW1XK0FMZFhS?=
 =?utf-8?B?RWFHamhybmw0NjNlWjFoQzJJMWgvdlJqVjRhbmxFVUxDeEZHM0ZlVTQ4TDhK?=
 =?utf-8?B?cnVRa3dYWC93VEgvekxiR295allsSkJWeGtwM2VSbzM5OUJ5RUJkWllaWTBM?=
 =?utf-8?B?N0FHMU52QlZZMW5WdnpZdkNlVThLc2RoWVA1aUM5ZkQ0bmNLcnM4VDhNY1ln?=
 =?utf-8?B?anc4d0hiWFFHa1FaOUNpVGI5akdmYmRXbk9iTDJmQUxyekM0TXBINTFPMmhX?=
 =?utf-8?B?WTRhN2lMcVVDTVdXVndEa0ZqOWRTY28ySThWRHYxdldaRTYwMGJZVzhzSjh4?=
 =?utf-8?B?SGdybE1XT3phOTZkUVlNUmpFU0dvL1dzeC80K0pDMEdMaXp2aDZzN1hLMVJz?=
 =?utf-8?B?cTJiRnJHMElxa2pCby9haEJ6ZExVdjVJbVd3ZCtCY2daSWtmeGkyODVBNDBC?=
 =?utf-8?B?d0FaZTYrQ0NOUFJXdnN3RzBoTVEwMlpJclhOd1dXd1dPdXNGZW9uaVA3alFD?=
 =?utf-8?B?L0xieGxNMnZ5SGNrZDNXemtjZEo3SXp6aDRrVTNsYUVmb0xxRjZoL2kydjVm?=
 =?utf-8?B?L0FRM2ZuM1J4U0F6VGpFbngwQmJOekJITkQvNkVoampFbGZIaDEyZUliRUQ1?=
 =?utf-8?B?SUdjT28xb2JpdU5FY2VCSlAvS2hBRnVvc2dURmkrQVcxWnZKa3NsU0VLMXNR?=
 =?utf-8?B?T3piYkh4TmxuYzlucEI1TTUwUTVpRHRoc2p0L253cDQwNWpNNnBhOU1GNmQz?=
 =?utf-8?B?c1Y5bUc0azI5MWdYNDNrV0xZdHlmRXhDS3k3ek5vUldrNU0rT1NIYUh6TC92?=
 =?utf-8?B?VGpDaXZxQ1ZvT2ErdkROcGNmSUE1ek8rRUFDMWlmL1BEK21NRkdJV1ZDdUtx?=
 =?utf-8?B?ZW5Dbm1DeS8wRnNJSEt6RkZxY3U4M3grUjEzWW1nTmtJSlBKYWVEdllhci9z?=
 =?utf-8?B?WFRQOTduVStnQkhwZUZ2aEZKOG1HQlB5U2JCSFljaWdjRldKYUN4cHA5Y1p4?=
 =?utf-8?B?WEx4bWptb2tpdlBCNkh0bVZaN2JoVXhvN243TGFsZzl0bWJBTGk4YzRweUVU?=
 =?utf-8?B?TExudnlMWk9NZktSa1NKbWN1VjljTmlWUHV3SHR1ZWJOZnZyUVBZSm5uS0hl?=
 =?utf-8?B?eUpXd05qUEVpTjl2Y2tJeittTDZZak1zOExsL0tzc09ZMFJmOUoxSER4ZEFL?=
 =?utf-8?B?TXJ2b3Z5N0JJWjFGK2Z6VGdZREs5V2Q0RjhNaU1hdDFIZUxlYWhaMnUwYXc5?=
 =?utf-8?B?TlJkWmZ1WXhEVE16dVlFK1J3ZW0ycWxmWG9ETjdkbmQ3SmdMQWZ0RWJuSXNx?=
 =?utf-8?B?TVY2YmhCZFIyTUtsTS9NeFVGUUNvTE4wZVZ1dDVueC8rZmVlOUZiazNyaWxC?=
 =?utf-8?Q?JPe+fyNh+hJt0Ez+kyo7A00kq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e83e82-042e-4929-453c-08daff83acd4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 09:57:03.3612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJma0m/9m6FCtX/1I/tPFRRhvCWOt+OO/9o57+I7UOxWjdDigBsxnbNIkJGfITvaLKneG92M9BiJ61o1Q9uGfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7361

On 25.01.2023 19:45, Krister Johansen wrote:
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -72,6 +72,14 @@
>   * Sub-leaf 2: EAX: host tsc frequency in kHz
>   */
>  
> +#define XEN_CPUID_TSC_EMULATED               (1u << 0)
> +#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
> +#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
> +#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
> +#define XEN_CPUID_TSC_MODE_EMULATE           (1u)
> +#define XEN_CPUID_TSC_MODE_NOEMULATE         (2u)
> +#define XEN_CPUID_TSC_MODE_NOEMULATE_TSC_AUX (3u)

Actually I think we'd better stick to the names found in asm/time.h
(and then replace their uses, dropping the #define-s there). If you
agree, I'd be happy to make the adjustment while committing.

Jan

