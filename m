Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6145B2E85
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 08:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403811.646045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXD2-0006Mn-UG; Fri, 09 Sep 2022 06:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403811.646045; Fri, 09 Sep 2022 06:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXD2-0006KA-Qn; Fri, 09 Sep 2022 06:09:48 +0000
Received: by outflank-mailman (input) for mailman id 403811;
 Fri, 09 Sep 2022 06:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWXD1-0006K4-FN
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 06:09:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 006f46a2-3006-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 08:09:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8503.eurprd04.prod.outlook.com (2603:10a6:10:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 06:09:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 06:09:43 +0000
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
X-Inumbo-ID: 006f46a2-3006-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYk63XjdJeDIIS0U49O5pcVWgyiWmnymXF8ARB7cYjvY0TIO+dOWmlki3nHZuXBTLtPRJPUYtoTB2QLBWjXNla3nnFAblWrlw3/aHRGu4BBs3Uklwsqebl7EiiHvJEnt+1sW8dP13YefN97Ut/pwhOPO/PyjskNOiaKB+iaX+KytpqlCf0GPe18uy+LGA+v1ZFKe8TjLuwptyqyF8IL30WNskffb1FZyLlRpKb/WlbBa1Ia43MIwRfOkjZG9/40gqE6MJ2pwjuN0fRiUOmg5kVCgts1MkmGlFDS/VJHJNeQtHgncdE0OkX5MTXsUS7dQwnEz7u8JEQpZ5uizE9J9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa/K3lhAZ+NfsogNr4mv4BnStV31r5aF7g5QOPXV0nA=;
 b=IhJd5hzDo8CFBXY9lI7h0cXchbMjHHiVTudYdqtwZN22jhbo4XsNXAMVyJav9lv0EwzCJjZcchmXno8qGEy8rFwxRjdpt0pGIgg/B9t5O1+4H2cvoX3pkODnczcz/KqZJ2xoLvVrPnHTkOyUoPR/6tiLIp1Spja6aJryOmfLwpP3wWaipex7SEuITKYCa6ozltExFzLFzzp65VDevAPdldf+0PRLVEuR8Dg5TV1CJeGf3OWRdSxdCDsrZz2fpXg43esdHAfBnEU9XxYU/sjNm5VmNe3LgSqBj8w8e4DhwlZoyaTcXfC6V7uWeAJ/h476XFKEo8w1/YbnsC16U8l+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa/K3lhAZ+NfsogNr4mv4BnStV31r5aF7g5QOPXV0nA=;
 b=mINwviyMP8em2f33jGrEo1CuHWf5A7leMyX7r/EEMNlLIz7e/T5GVwgQsnMXsOnB2rlOg5ptl+G5dTGfF71PhaGrqKlPHkdbmJN3WbmM5tRz3sWBCcNApeuRdmLH9m5chIUHvWt6AF1+386dYhq9HGuK89kw4d236J+HIJfe47U7cU0ANWcE1LIli+A2oX/0uThn72zebzjXkhqaTp6OKr8LzvJ/HpoLkG8NyuhsdJts7CXppyj0VgGK++NreNdH1gwxvMQtUbioOgs/ab9KE8pMaCKuw/9nJu9gYdKeCnEE9aEtnOwHtCAjAbnhWDnM3JsH/bEKD9Pwa/2DCq1XPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a768a11-e792-0e8c-f6f6-48494bf51cdc@suse.com>
Date: Fri, 9 Sep 2022 08:09:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v13] xsm/flask: correcting initial sid assignment on
 context allocation
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220909012546.21807-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220909012546.21807-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 38441a0d-2df2-4b18-5da1-08da9229e365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3sVFAhNO94jDs4GvdyTYLvhJPAPIr2IUeEhhzNSp8RrUNvI4W/nY76ATdyYgDMpvIHatcRUS25GhaDzpglW9FSR4W66gcZS4sU/wXWjAOBrV/OFeXnZMRBIpL00Iqkb/AWDCdFAGnRLrZwskMXK3PvMVp1+oM99mjkfEjDbUzghugZuf+UBrOhI8x/otrr6lR0OSs5fmrglCo06P5Rppq8H9n9SvMtGOFqu2vSkfbg5+S85G/Xu5zTMvUujl8uWvfxfmdRRwHMnRdTUd54iz+pYPPUumVebW1UR8jE3E6oht5EPNgWSn/X7Yp8vs6hb4Jeaas1YcanDQBkwFj8wmZiSUfRmhZ52EbKqB/uEzYkBn5cbKZGiiKTrSf2vqVfiqwq48f1BsV89TjkumcHIKtyQmsWCa9FE/IVxjewlaL66RWbNpYyfFcmS14lo8GWQWL/faWH3SvnmxsOZp0PCxOxwIhVCdho1VPmGnfFaOFjBF+CE6f3SgjDUa0YfA/Ui5ikSJZ70eqDr8AdOOPiFYAL40bU3hKEQuEWse/ApYJkEdvpL++7nQ7k99/j7cVqOitbGnyl18tswSUp+PowimAxVl2t4gVfhzyN1vrO/nFsreq5HY8OYvQY/C9OQqptezSIr75gjxhvvDWdpkO29uuqJfcQq5dhHiXEUdgHOfmJPh0fD/4EdFKA8qY7wzvYrMh99jEHlUfcbWpoZrZ2R+sbxzyDG4VUlSTEjmesYLH1tEqcqVgXE6VQhKoFodOH/bJcdNRDZ0ulX9d23BfWGsodH3K3bAu0dZBiWI3oDHG24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(376002)(396003)(346002)(36756003)(38100700002)(8676002)(4326008)(66946007)(66476007)(66556008)(31696002)(31686004)(86362001)(186003)(2616005)(6512007)(26005)(41300700001)(6506007)(6486002)(53546011)(478600001)(316002)(54906003)(6916009)(4744005)(2906002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekI1Mm9KM2NJdW04ZENOUTBIa0xCTmxSeGphZzVPem9rRGtMT0V1WnlaWEJr?=
 =?utf-8?B?N2pmWDIrYVRJR2NIeFlIZVdMa0UxMXBtcmw2aS96SHJ3T1VkZC91NW9YTURB?=
 =?utf-8?B?N0k2SlFRTm01MWZNZXA2MzIvam1SVFM2QWlKZEgzMWtpQnBhUHlkQnI5SkFV?=
 =?utf-8?B?U3daQzMwM3QyT0RQZGFvUTdxcUU5QnRveUtBVGY3VkVxYjhtTGZ0QlJLU05D?=
 =?utf-8?B?bVVGMWl0aUkzZXFMbFdGQjBlcVF4VEJ5eTVhRWhoK2RiZ1BXK2k2RW9CdmdG?=
 =?utf-8?B?bExPRnVGSDJMeWFJL0hQNk1zekNkeTNud1dBOStSQVdwMVY5WWl5aGRlZXNl?=
 =?utf-8?B?NFFmZlREYXJtTk43Y0VFcno4bDRrUklQVVk3MmNDSXpzZ0dqUEMwSTMxUkx0?=
 =?utf-8?B?cE5oc3YyOERBN1pSOGdVRUd2TGJHU3FRM1pyTGlvcjUxSDB5SmVGRkRoZ0ZQ?=
 =?utf-8?B?azdqSGFJUHVMK2JLZ1dmcDNUcm95dW9uV29rK1ZhSE1mQldxeEhOdFB0b2da?=
 =?utf-8?B?TDNMVTljUXJpeTZWSnpTMVFSSVZwNWR4eGlHdkpEemdqRFRpVXNpekVIVXFW?=
 =?utf-8?B?U3RMNUpMNkJqSmxRMmVSVHR0cnNzSFJ2N202RTVlT1hBOHZpTkV0eUl6TjMz?=
 =?utf-8?B?cTE1ai9kMG50Q0Z0RHQ0MCtlVVIrQnNwSFBJM0pvY2V0ejVZYkNDWkVMVHE0?=
 =?utf-8?B?YzBnNXNQN2ZHbDFWb3pBMTJRNHRHSlUxK2ZSbXV1SGV5Tk9Eck1QbGZBVnU5?=
 =?utf-8?B?NzdlUUhWb1NUUFd1RVlVZWJuT2ljQkdwWkgybVJCSW9mQ1FBVEZJMlAycjlE?=
 =?utf-8?B?UzJMOUtHUVNNbktEVTh4eStabUlISVg2NUszS3hrVW5lcEh2bzdNRUFBaXpa?=
 =?utf-8?B?bklJcE9nTFZ3S2VwV3hRRWlUQ2ZKK3N1Y0dRcUtnV3FxZG9Ic24vOWpaYUcv?=
 =?utf-8?B?a090ODlCclN3dzZJb3pKOW5QNjB0WVdPdnljZzNEd3M0VGdoSGZDTWdZUWhE?=
 =?utf-8?B?WVJ4cUVXc0prdnhnNXRHM2wxcjZvdUFBekhRM0xGT0N5R0hqWlA5Q3VQcXUv?=
 =?utf-8?B?ZHlRcHVoWGN5Szg0SjlLK082cXJVeERHeW9BZFl4SkJzZlgvNmVlRUt4a2d2?=
 =?utf-8?B?NzlnRENKempEYXhZQkt4dEZkZTdRTjRmVzdDSnRTcThlYXZnY0g4VUVCY2NF?=
 =?utf-8?B?aW5Oc2VzWjI4eTM0L3cwMU05TjVUdjRQZS9QZkhNUWtiWDVsTWgrbGJpNHl6?=
 =?utf-8?B?NVQwMTVvcUhwZTV1dW9YTjdkZTNDQU5pV0wrWGt6T052STFycGdOMTVTRENS?=
 =?utf-8?B?ZkhTazg4WVFOcWVxbkZMODEzbmluTmZpcmUrYVFQQUlzV2lqREJvMEp5NDc0?=
 =?utf-8?B?ZUl1Tks4UWpiMk5iQmFEQnRrR0ZqOGhIdHN6WmdBSVJ0MW96QVJPOERMbVQv?=
 =?utf-8?B?bC9kMnk4bEk5d1FFTXZCZDdVZUp4eFVrNXJNZmFxaG85dVpIU2h2VTE1S0ZJ?=
 =?utf-8?B?dkx3SjcwWU8xTDNtTHpSZW12YUp5R1E4NFFUTW9YdHJkLzNtNlpld0UyL04r?=
 =?utf-8?B?ak9md28zK21yL0ZEWHFRSHdsb2s4MEVpdFBUYlFJWm9SQkNOdWhiTlh2bzVp?=
 =?utf-8?B?UDRmNTBKaHplYnZCWHpQZmYvbWNzOG9RdUJ3T1lZUkEvU0JBT1NaaU1RNUk5?=
 =?utf-8?B?ZVliTTh0WFFOa1BRTXh1TnhPeFovV3hHUjVJVURXZFRkOGFUbWV1WTZ1eVZS?=
 =?utf-8?B?a25yc25vZTFFL3ZGeWlWRkZlWjRWYlVtd2hxbitUekVlUm9CWisrU0Z6cVgz?=
 =?utf-8?B?a3JzUktFZlpPL0g1a0dObjlrb3VKSU5FRzRyTDIyem1FeE1Oc0x0QU9kcXgy?=
 =?utf-8?B?VVAxZlpEdW1RSzB0eFlpdk9CWEthang0UkszUURZYjhpSUhqWjZIajJZV1px?=
 =?utf-8?B?UytTQTBKK1NaKy9ZazZ6NGFFSUtyd2FEL2NMWm5MMzkyRGJBQzhjNzlBM3M0?=
 =?utf-8?B?SVVCMURVRStNalFxKzViZFVKQVVHazBUTGMvcUhrNTgrL242NkczYjZXMHR2?=
 =?utf-8?B?QTJWTWVEMUpQTzNUL0ZTcFBjcW1wOUFIQmpmRVNGdzdNc0xzREhCWk1QV1hP?=
 =?utf-8?Q?SYsBPvhkXWglteSOv1/fnmfh9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38441a0d-2df2-4b18-5da1-08da9229e365
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 06:09:43.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wt+L576B4J/mUu61G4GbcHAn6lZkvTjATCT2tlPxjjWybbV8cjwGdKXH5F21ppsesE1bMKkdMHFEOYRVf/Ggsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8503

On 09.09.2022 03:25, Daniel P. Smith wrote:
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -38,6 +38,12 @@
>  #include <conditional.h>
>  #include "private.h"
>  
> +#ifdef CONFIG_X86
> +#include <asm/pv/shim.h>
> +#else
> +#define pv_shim false
> +#endif

Hmm, yet another instance of such. We have already several (and
dissimilar) instances scattered around, so I guess we really want to
centralize this (e.g. by moving things from x86'es pv/shim.h to a
non-asm header). Not something you need to do right here, but
something for 4.18.

Jan

