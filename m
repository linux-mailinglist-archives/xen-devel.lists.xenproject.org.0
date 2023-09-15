Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78E7A17A9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602939.939774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3TA-0003FQ-Ch; Fri, 15 Sep 2023 07:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602939.939774; Fri, 15 Sep 2023 07:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3TA-0003CD-9r; Fri, 15 Sep 2023 07:42:28 +0000
Received: by outflank-mailman (input) for mailman id 602939;
 Fri, 15 Sep 2023 07:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qh3T9-0002Q3-43
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:42:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6908c13b-539b-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 09:42:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB10068.eurprd04.prod.outlook.com (2603:10a6:10:4c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 15 Sep
 2023 07:42:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:42:21 +0000
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
X-Inumbo-ID: 6908c13b-539b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNv9GtX8GP2+jP816xLUXwBlXEe+uo9oKtR8G6zMmQI2GQn9I7CrfzsYDGeWqpi+b3//AEF4RdK5P2LUL8CxduD70qXKsYGADGWmVZeBdwiUvaHjyd66L03lRv7j1U3i+lq9HDVwToWbaWfQAT+xC7Ai/u3fjWlLnMZP9OBGCzXoQ1CFMpO2yjdLKK6YcXljiAYpmp9768Bq4buIojNtLpgM+r8BDJpKY1Ub4dvXpgMamP2fAzRpbiWyPIsy05IZ78sPONu1XlpqJMTa0sqolsna/Oco7xFmCC+wC0RBsPhmJ6yodOu6ZBovuOtWFacIbB5cTajNWmf33NQtCd8qMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/bMK71pu+dY+ne+U+NXHCh+5iCIo7BU/oosu7XSHww=;
 b=iK3MNFZaxRc43IebsM+GsO5jW5rN3VGe8gtEIOCIcHLL9xwIZOPmsM+Bznb2WWxvrh97xqpotqT0vKEFm6i1FRYE7R3F94urlrrMdrW70WLtl4WPbiDXk/y+9nLwQv4XmSALC53tvoW7H7YyOt7f60U5ll6sYqhggka2N01N6gERUDN2EAzErryiX8leaCQ4k0bKhhH3leUopZpoHIEq96DBDf7iroq79VkO/zc9QAqwunoKqu5/ni2FGnCWmxAptp8d0i3EmnrDMd8BoL+mcmcff758TLzlKFdRe9dShvbld9Dr6yKrjCYUJQWXBIBZUGhvrw7Jw11tnwwuaw3aHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/bMK71pu+dY+ne+U+NXHCh+5iCIo7BU/oosu7XSHww=;
 b=Gr5k9CYt0P6I0WyCTmeSqfLb8Zys0MkceRSa7crLl4pdh/ivNiP0DEVZZ9mryxmtgEIdbwnLO3BHAy8cQ+MQyI9sinD1cF6M5Baxily8VjdYie14BR3fLtY0qEK0R/iHxIZWElc30QjKd85SA9Zy+PkTicAlXHLnUzOlqQ0J6rl2QeYwOJvBupb/146vmr65j6/X5HTDcSUDq5UH9jKVq/PG+spexRV8rp0aRVkFZw8g5GyP9OmjQoOWkc3U6B75rqzvQB1ExObRoXgCI9WUU6snFGgBz9mOyp60FX7ZW7ieFJ8iv9pjrhlTRpypK9fZn+761fKr4aqvtrCqR4tMgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7c92597-855a-1d7f-2179-7c86566b1021@suse.com>
Date: Fri, 15 Sep 2023 09:42:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/5] x86: Introduce x86_merge_dr6()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-3-andrew.cooper3@citrix.com>
 <126020f0-3054-11d5-c7f9-1f02750cf815@suse.com>
 <08556a3f-3a96-2929-ef7d-26c3b3cbeb6c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <08556a3f-3a96-2929-ef7d-26c3b3cbeb6c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB10068:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c1ff68-88cd-4f2a-5ddb-08dbb5bf4bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cOUQuz+SMO1F4JoPYVVUX3EVdKpsSrLfw/wI+TdZ4wBGvf+OZFOGxZ7nAF5BVKRmrsFXW1Uf9gzastDuJdwFdF3YDu63AzqvwFCXpQ6cXa3UspBzT2mm64T9ha8Lb5oCd/HjZlP1a1XFj4xTedFDOc5zCaVAC/qFZheEMd/aRY9jvwO6k2vyAMA5QyWguE+oc/vQZU+GTh/zfNHRLScVMLN4ek5unVR9n5j0Ola15SHQd4ziwSMjBHPoZLu1UfNQY4sYQMISsLQA11SBZk4YlnLlE1l4ZWNZ6xax7zBdfgPyXN/NczJ0yIRgfGY0CxFwrTVyrphNpPxyuMGHNQ/r5WmoKhjqwGUcaEir1lTQrbVd73mSZ8WhD2Uk10riOGuQ3KavpNGdmKcXIOfLTIi/AulGkBUYNwqhTGvmhmA1W3adwKTITDE4w9+SDjdgto5J+iLeP+S29FBsTN0Jgi+lrRgbw2qsYDYEk7saQlu5AvVEO89zlDzv+VgyYHpXj7pkEvJygp0qDGe0RzaEhJw7CTXybNErR9LjE6aNnLW0UEf2J2rwmgSzVTI8xS2oUgMibwkV7Ac7lG4bFDifebft+02048qeCXZYNsU3iDoVWUOrbS0Cbibd2SdZXAH78t53TNDp7oUa69AaF0O7bpT+Vg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(36756003)(31696002)(86362001)(38100700002)(4326008)(8936002)(8676002)(5660300002)(31686004)(66946007)(53546011)(66556008)(316002)(6512007)(66476007)(54906003)(6506007)(2616005)(6916009)(26005)(6486002)(41300700001)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGZXR2V4MjFtajNtL2lrMWpocytXNlFqWklPZkZtUGwvUlRsRWQ2MTFCdFhi?=
 =?utf-8?B?Yk1aZUxndGlEUFBZdUFZSUs0dWV4NGNkdUNRbE1IT2dGTWNXMFJQdmZHTkU5?=
 =?utf-8?B?b2d4NW5ReGVEdFp6UmZvVm55MDROSVErckZ5b1l2S2hETDg0SGNPSy9hbjlk?=
 =?utf-8?B?Z0hCOWRQVjBmYUZTckFrcTYxMVVVK2JkZGtXT1oyU0pEN1dnNWtyTGdzYU5i?=
 =?utf-8?B?U3lDaGdYNmtnVkhCeU1zUklYQnZ4RXorU3FpV2REUXduQThhVmRvazdJZFNU?=
 =?utf-8?B?TGcxODNrblkzR0FRT0FjSWxUVm1VUEFCUDViMWxyc3ZINWFkcS95Uzd1U2Zz?=
 =?utf-8?B?dklKSnlQbkd1UGhhVFBmVExqbXgxUngxOHJHTHF5YmpBb2lQNW9XdXVtYjll?=
 =?utf-8?B?TVlWSHpkUUZsSGZNUjU1L3lHTUtnN2N1d29qa01DSWhXeVNxaFFLQzZuUG5H?=
 =?utf-8?B?Nm1ibGpWeTVJSlB1WUJ5UHlQTGF5Uk5wSUFKOUtDTm40eTZZOGNpanhScXdz?=
 =?utf-8?B?ekxTU2tldTBDWmpIQjdmUUcwbnNiRXlEVndFMzM0U2I3cnRRSkpXK3NjQ05J?=
 =?utf-8?B?YnBxM3FJaVVxQmpybHFLaHNSYldGbTJYV2xHZUl5SjczTVZhclJRMXRDT1VT?=
 =?utf-8?B?cEIxNVRWUUNoVVRRcHdJVDVPYVEwUVlFTUhGelNCZUZtMU9QclVuS0ZGUk55?=
 =?utf-8?B?VmF4dTRjb2prUGozVjNWWFk5WFZtWmkzZUdLcEU1QmxKVTNhT21JK0wrdzlO?=
 =?utf-8?B?QnYvaUJjQ2V2K2E3TndXNEx1YlltZ2ZvclJ3cTVoWlc5RGVsa2xRcnJoVzcx?=
 =?utf-8?B?RCswR3AybmUvZWRnOWdVWjdnZHlXMk9xQWQxdXZpTlJOSFlmODV3LzA1anRG?=
 =?utf-8?B?VUdtK0c3d21Da29ETnhFdEl5UGhpS29XZVJjU016aEJMRkpEeUE0d2Q1bVRz?=
 =?utf-8?B?cWNYMzBmaURpb2crWlhVYzl5Ym5RWkQveXIxZGYyRTBwZ3hsbyt1QjZuYVlS?=
 =?utf-8?B?WDVXcTV6TEZVclFqTVgvd1Jpc0xSTVNlNjF6SS9tdFBkYU05SkNodXF6VFE2?=
 =?utf-8?B?Tk92V3FaSWY0Nk9nTi9SZU5uWlV6NVNjKzRLUzd0NVdvbFROcit6OC9FM1dB?=
 =?utf-8?B?SFhoaVVZS1ErUllMamltZDU0TlErRU5OZTN5RkI2UWkzUDFRdVRQcWppUDdC?=
 =?utf-8?B?TjFCd1dXczJRN0s0Tk9LTGwzSFJyR0RwdlVDVyszOWJIbnJmcTVSQ1JidERI?=
 =?utf-8?B?ZVVucXNkQ1k5RW5wS2Nya0ZyOVJ1YjVOa0hnVitBOUg3aFQ1UzdhL21Ha0dm?=
 =?utf-8?B?NjRKZWE3QUFQNXNSZ0ZqOTNsZkU2WWY2U092Q2VxUmhqSTlGK2xxMGY2L1Jk?=
 =?utf-8?B?U1NMaCtIT3hmcmJQaG1FNmV5Y1A5eUxhSEU5RmlBL0hTdjdCTitOMTRhbEhz?=
 =?utf-8?B?ZkhONUNBVHNvS2htTjBVdytwZkh5aSsrVHVRQ3NrRVdXcENTbUF4VkdDYjlK?=
 =?utf-8?B?c2dOTXd1RGV3VjR2VC9pL0VObE1RMEJpMUd4YS9SdHVlaERFY091NlZiaWcv?=
 =?utf-8?B?Y3RzUTdYQmJpNFZCWkNsYlowU2ZhYmRwUWswOWMzdVVTbnZRb3BtZFkwdnZL?=
 =?utf-8?B?bzFVbUxhK0F5SDU1eEdwdE03bUZNOUs5a3hjTWZEemxHUnVQdzRZK3dyQkFx?=
 =?utf-8?B?Nis4RmRnQlFBYndLMW5FYTQ4YWFHbTZHQU9wWllMdGFFZFpiZkpVMXdGdFdk?=
 =?utf-8?B?ZWFhNkJYT0ZrMnpDS0p0b1VXNWdpbmFKRVNPNUpRY0tWWThIbjFHZzA3QTNE?=
 =?utf-8?B?amlkNnVuR0ttOFNZZHN3Zi95T1Y2d2JONDduMEZrUStqd3BydDlzalNDRERr?=
 =?utf-8?B?dWdQbWo3SjJ1elB3dG1XcWZLTkkyL2ora3ZYSHo3eElIR1JBRkR5OFhIeGdj?=
 =?utf-8?B?WkdNRGNKNFpQc2RqeDJoZ04rSEFyTVV0eGVoNjhKTlFhTmVvL01vYW1kTlo0?=
 =?utf-8?B?OXZkRGlobHJKc2k5M0VSS2hLWFFNNHdPSXljaHNOa1YvWEZGRGNXZ0pkckw2?=
 =?utf-8?B?SDdjemVtTktpZHU5bkQ3V3FGM1pYajJvVTdkbFEraWh5VTdlSEJZV0NsZjZE?=
 =?utf-8?Q?UscmQjkbXyVzIM4vzzbbC/ZSH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c1ff68-88cd-4f2a-5ddb-08dbb5bf4bc3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:42:21.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEDRtcCXTWrd1UcC7HxkXkyP67XQC7j6wEMklZ6STCiSqv7llfBoM9/Z+9HXD3t3lsIaJAARegi6y5R7jxoufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10068

On 14.09.2023 20:03, Andrew Cooper wrote:
> On 14/09/2023 3:53 pm, Jan Beulich wrote:
>> On 13.09.2023 01:21, Andrew Cooper wrote:
>>> The current logic used to update %dr6 when injecting #DB is buggy.  The
>>> architectural behaviour is to overwrite B{0..3} and accumulate all other bits.
>> While I consider this behavior plausible, forever since the introduction of
>> debug registers in i386 I have been missing a description in the manuals of
>> how %dr6 updating works. Can you point me at where the above is actually
>> spelled out?
> 
> The documentation is very poor.  The comment in the code is based on my
> conversations with architects.

Especially in such a case, can you please make very explicit in the
description what the origin of the information is? That way it's
simply impossible for anyone to review properly without having had
the same conversations.

Jan

> APM Vol2 13.1.1.3 Debug-Status Register (DR6) says
> 
> "Bits 15:13 of the DR6 register are not cleared by the processor and
> must be cleared by software after the contents have been read."
> 
> although this is buggy given the addition of BLD in the latest
> revision.  I've asked AMD to correct it.
> 
> 
> SDM Vol3 18.2.3 Debug Status Register (DR6) says
> 
> "Certain debug exceptions may clear bits 0-3. The remaining contents of
> the DR6 register are never cleared by the processor."
> 
> ~Andrew


