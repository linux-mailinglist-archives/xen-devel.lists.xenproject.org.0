Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65636480AA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 11:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457788.715778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3aLw-000591-Bg; Fri, 09 Dec 2022 10:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457788.715778; Fri, 09 Dec 2022 10:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3aLw-00055u-8e; Fri, 09 Dec 2022 10:11:36 +0000
Received: by outflank-mailman (input) for mailman id 457788;
 Fri, 09 Dec 2022 10:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wVCj=4H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3aLv-00055o-5c
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 10:11:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db5c8821-77a9-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 11:11:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7833.eurprd04.prod.outlook.com (2603:10a6:10:1ef::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 9 Dec
 2022 10:11:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 10:11:31 +0000
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
X-Inumbo-ID: db5c8821-77a9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QS9wcHotcuGwtHpIcfx9k0/JJeioAnUPHfs//jQXXJ+9krW417ZxxoYF6GO2Y6Sp2YLtjG8KuRfU4HLn3zXZ2vnpCQSfdqNrYjxsvDyNKEz0kPiA+qAM7u8jvSO3KMwJkK6FH+9Tj0T7+rOFoyEJydSN+/bRkAyB44727nz4sR08R5VXVxXe1DnmrPLpYWsWyknL89qO8gYBZ99ZUf8AJEf+PlSTqsBkwLdSgmm654xLvFJE6lzBHqtqAZNmFjowgCcwhBf0//5tF3fkQC1vmEuKne4r4FWchM7rN0e9Xm/+WjUeavK7W9tHQcaY5RY4sRAPPwMaEt0kfXenWR3PZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HqgRSoTut7COvEcw/JZWEfJtvUMHrnzloAMAO2YluI=;
 b=oHpcDCi4p7+eQhXp+DhbevkUUWP+S9xDgbmJpZKGoJbpIXruyHceV6ZulE3ljQMIjr7apGE6xMIkHKYCpXXpVEHG75O4UfKOJMe3WmAq95kc8sOqwkZgfdWtq7x09S2thHFskoW1GW4M5i6rbwf9AsvyjFTmiZ9/rV7a6l8tA6lT0i4VeJcUPYoF8a/yyFtFwzaX8gwmVnHy9PghbkRh/CHI9ph4dKzAbdiXyEE9oya7ZX6S+3odFrY2LFC2Z7F3t2AEJVJLc9gHRO3GpSwM5SjTrX62C/0UnCIZKLcFa51gobDX7lCq+ijNSCQwjZrArAFf60l6fk2Najvpc0EETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HqgRSoTut7COvEcw/JZWEfJtvUMHrnzloAMAO2YluI=;
 b=psH6oxq+gfe2WKp62POiq3fQWiqbIQ4zWvy6JZEmR+JY+lh1pY0QfpKWkuuykizeOJkEnCcOZjuc4m0f+FGch6tHs6GRu21rbasI61XDm6WJ7c4gaer8sRPAWwrEwc9YbqEViMKWNFTWODM4j1oRoNhOcmVMlEp17+8agiJdMHO3wwoyM01jfXtbVjOUsDh+Iw5oKmcEmjpOFZUrBOBdSqm2VY/GiVPOBIo/mBOdHb/CaGyz5MdSzRlTq4d0BB4yzS+FxE+FrrXlLcbndhpdJS2ewIUQCfUJXCEr+aLky7G1xKVntq46NEgolpZiivCDbbtMRns26/OnAzvWJ0LKFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8cb821f-fda8-bde6-9585-fe689ffa4be1@suse.com>
Date: Fri, 9 Dec 2022 11:11:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <6189fed4-2aac-8ca3-90f6-7a750a8993dd@suse.com>
 <Y5MG/osKnrCMsztu@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y5MG/osKnrCMsztu@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: e0aad9b3-8af8-4ef4-737d-08dad9cdbe38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NM+5HERAVpMd3/FRwRli75eFvhS9c4/xgseADf9Zblr4yZncL2lyY4k/FrEDi0F7ry71okIvKWHLQn7tWZR7BYHzh96gj3YmIdZcexN0cGHxDCIZdyeQMIxxLRJUSHcFd0uh8MfkWRE5/u1I5brnFFd5lIZxaXLPhYcbEX2UhLzE5pDROX8t/Jpjyxs6cg8YZRjLqYCdaDQs8AP7Bp9s8tr6FybgzalbEDM+4TfCnf513ZIfbfsR97UyuGY8DX1SAoIXWuj9sD1AHuMC6cRoyBJDjZzwDW/Z6egSPWQ4MaaEjcXO5uPnaHqiN8buWJuhFMy2Ug/s701kN4PE1n/KbhR0KZZcyXt97xeRu8311A2W4WYrqCkHQtNM2az82m+Yas1BubC8UDvtF4OuFEFqLKLAPOt7Wk/XXRvYd7BIBGgpafXRN2rfdTzVWlvCY9EXcnf2my8fsQJR4P+M7ifJXPLoGGbpDQHcYy0tLGpiVLGympvm3aJZTnjg5oYQWNz9q896DPJamBAwmeSbqnCkd/YI3axFcCanGgdywlz+VZnFRqjnb0aAxneqNpLzuC99JALVMvuz5NA9tEDijfJiZjN9XVxN9reGggaYzQbXUUt5ZFEQ0MoacMyQ6Je0rQ8CQgs9UHIdXS+3oBtuSkBn6n7q/nazWDmD2X+yEQwI+TnuUXYlssXepxoiZpj2/FLBBF74j9/K7uq1fht+Fs38bDoQDxpMG3JwDnLf7Ei88Mo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(66946007)(66476007)(66556008)(8936002)(8676002)(4326008)(36756003)(41300700001)(478600001)(6512007)(186003)(26005)(6486002)(6506007)(53546011)(38100700002)(2616005)(316002)(6916009)(54906003)(31696002)(86362001)(2906002)(31686004)(5660300002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFZ2bnRYamhQTWkxRDRHaXZHU3lWck5oUTZpMUdHYVg0ckdyZkw1eTVqQzdr?=
 =?utf-8?B?bEdaVVVBM25QWGZSWHliMW9ORlJkdUxIUVB6WHZWRDZRTWZuL0FTUUJ3UlN0?=
 =?utf-8?B?NVR2WU4wQmZjMnkzU0dIRzVtODNGQUczQWNSdU1aMmo1NGpHc0ltSmVjZmR3?=
 =?utf-8?B?L0NGbm1VL1FXYmc5T1RrdDFxWGFkM0xzalpUbE1ZSUFPbkttWXZJcGRmS3JI?=
 =?utf-8?B?WXlnOGZHTDl0amlPbHI3U0RsWFBRTHNpK3I0YnpHS0N0RVprZXBjNEhuMTUv?=
 =?utf-8?B?dWZ6ZnIwanpLeGhWSzcwQTcwc0pTUWFicC9MWndRYXV2NnJZTEtKQVQybndN?=
 =?utf-8?B?ZGZhMWN6RFgyT1FLbG1FWEt0RTF5TllSb2N4QVlmcHJ4VUtKVVpUaDdVNDY3?=
 =?utf-8?B?SVVEbjBPVkphdDFuVEI1SFl0SEJUZ2ZpMW1kaVpoY1VBdGgzOGFmbFoyVksw?=
 =?utf-8?B?RUZ0b25MMklFTVhlZlFNOG9rczVkNW9sSVd4WUpYWldnMHk0MGlPY3l6Rkw3?=
 =?utf-8?B?M1V6Y3kzVGlBKzU2R1I4dG8yRks1OUxWYVFQVlZ5UlViR2l6QjhCRTgvT2Jo?=
 =?utf-8?B?SXFIL3luWUFvRWJkbVFXZG1jbFNQREpkUzhPZUJ1OXpGZ1lvU0JEaVRCT0g1?=
 =?utf-8?B?bzVYYlJCWktJZjFFRXdpdmxQUGpmWHZabDJMK2NQd25xdWkzWU16cGRWR29C?=
 =?utf-8?B?NVJqeHJNV0RiVUJvU09rdmxsWjJzMkZ4VURDWmxJUm9mTkRqSzI5NTIzWVFD?=
 =?utf-8?B?cjQ5RXRjOHVOKzEvcktnL0JOQTRDU3hSZFY5cUFBa2N3aW51V3p0dXdnOVRv?=
 =?utf-8?B?QTZacFRkQTlvMW1mNFJrN2loM0U1TDh1VGxoYnhNSm1paTBxWGkrRmhlQmFK?=
 =?utf-8?B?S3p3Yjg4NmN1bmNHekFSTEtNcFpDMHkwMEpKamFyTXg1RlVJWTRwY2N5SjJ1?=
 =?utf-8?B?OHUvMzJMTDVCZ3JuNGZ5eWsrdjc5V3BWZTdyTnNmMmZ2M1Uxci9EQlJvSC9y?=
 =?utf-8?B?TSs2RDF5TjVXUjg3dncwdXpLK1VtN1VTVUlZbkVNRCt2eXdsSFFzSVJZTjZX?=
 =?utf-8?B?QzZ4RlkrNVZxbEY2YUJYWXhaeFlIWm1kV3hDQnBuTHVCUHNNOUxEZ0hkVGZW?=
 =?utf-8?B?QlZKS0ozSGhzZ0I2WE5pbm9LOHVVQ2NrMXR2OGprMEp0cmRCeU44bCtZRXpT?=
 =?utf-8?B?UHVlK2hvd2NYSlhOdWg3WU9vMk1IOVM1R0lORVdEU2FGL0JuK3htK2thNGxI?=
 =?utf-8?B?d0RrQk5oNVdrSTJ3VWNaVzhDWkpPK3I3ak9BVTNnWG1sZDhQY09ZbXdCYjVC?=
 =?utf-8?B?MnFiRFV2VXR0c1dWcXdzUTQ2Q0VUaXlXcEFhYVdVQWFuR1kreWxSdVYrbEJL?=
 =?utf-8?B?anFTUHdaUjVRL0MyNWRxRU9lVlNEdHRHdVdTUmRIWEVBb1NFYXM1R082UjBm?=
 =?utf-8?B?alE1WVpRNHB1TWt4Q3ZaUEt5NWtaMUtadTdxdVh6ZXdQMG1VcURIaTcvZE5H?=
 =?utf-8?B?N2ZLbyt0ajFVVmJsRHIvMDh1M2hhNEtxVzg3cWxpNnlGazR5TU52MEpWWml1?=
 =?utf-8?B?aVhLa2VsQ2U5NmxXL3dCWFNIWDh0cG4wWk5ibFNyL1RvTGdjUng1RDA0RWlo?=
 =?utf-8?B?UndjWkRlcURaZkE5VzljM3kxWWZVTjlHZUplS3ZJVDJkVG9RZzgrc0p5Ynp6?=
 =?utf-8?B?STZ3aFlKQjRXQ2MrYndpdzE4VjR3L0xvQ0RDVXpORkxNOG1qQlI1NWJPRkg5?=
 =?utf-8?B?dWVpRDRFNEdFSHhud3NjS0tXQnp5bnI0QWhnZngxVVRHUVVnZFlSR04ycEJP?=
 =?utf-8?B?eE1YOGkwZE9ybVZmWEZsendDWDVCRlB4ODU0R0RING8vbGhWM0x0NzFuSXBn?=
 =?utf-8?B?d2JvRmFOeTJUZG13YkVKN3Mrb3VsOTVHWW5kZU9sVlJHQW1lU0daK1pmVXZs?=
 =?utf-8?B?SXJ4YmxXOWJBN1lSSkFGL09KbFMvdmNDdzJWbnVCWXFYRzFKQjBRb09CRWpI?=
 =?utf-8?B?eklOOEJyU1dDVURSMDFFd3FkcFBUUHB2Y2hNQ3NLeXhueDZYUTNpTmdVbCtC?=
 =?utf-8?B?RGRIRFF2cXRTV3U2U05OVDBEWjdHQWVwZG1INEkvNG1nYVFKZVFLK0kzM0NR?=
 =?utf-8?Q?TZHdROTJWHR5ANFcZxFZhpTod?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0aad9b3-8af8-4ef4-737d-08dad9cdbe38
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 10:11:31.0646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7lxsDZaaQRBXlvDYfWrBnlp+wTJ7Vce7RB7iR0AiwDsfg1vChChpHJ8nlVO34h/YL2+9jQOpO/5IbsUC88aWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7833

On 09.12.2022 10:59, Roger Pau Monné wrote:
> On Thu, Dec 08, 2022 at 12:24:54PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -699,12 +699,16 @@ int guest_wrmsr(struct vcpu *v, uint32_t
>>          }
>>          else
> 
> I think you could turn this into an `else if` and check if the new
> value and the current one differ on the SSBD bit?

I'd prefer not to: Keeping it as I have it will likely reduce code churn
if a 2nd bit wants supporting in that MSR.

> Provided it fixes the issue:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, but I'm a little puzzled by the constraint: Imo even if this
doesn't address the observed issue, it still fixes one aspect of wrong
behavior here. The sole difference then would be that the Reported-by:
would go away.

Jan

