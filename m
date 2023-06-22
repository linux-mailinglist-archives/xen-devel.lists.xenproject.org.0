Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A7273A118
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 14:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553527.864133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCJdB-0004gb-7Q; Thu, 22 Jun 2023 12:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553527.864133; Thu, 22 Jun 2023 12:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCJdB-0004dM-4G; Thu, 22 Jun 2023 12:41:45 +0000
Received: by outflank-mailman (input) for mailman id 553527;
 Thu, 22 Jun 2023 12:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCJd9-0004dG-GT
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 12:41:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2305a474-10fa-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 14:41:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 12:41:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 12:41:36 +0000
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
X-Inumbo-ID: 2305a474-10fa-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY9sOxatgPSCWIaf1DLJCFWn9pkDy9gHhOVCcvYxWbjbK0uEuPpOUADfL5u6DBQKdGRlcvCQL+joF9xrVcbDLV1lqCT/U8FolKr3NbdvMU7Al1hmooZZ0QJax7rbLrk46gFLydAZwFpebM7sONXZzyjmrhcA3Kfhj+q57guEKetnvia2sE9jcccSFUQ8beAmtJm6C1dSXJiaLGXGLw5uUFD8+eKtLXw9eHfzjV57c8axPwnVqf4AwwvFT8koWpOeVPeCZVJDQn7i2B1qpBCsZrarxqI6QfLx2lVfLgrFiqWshN5WjnCfdU3/p+LTunc60PJ87aznIIjhi3BtDBpASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s2bwkJebguGX04knwEod3khKYd/2r92OdeVJeu1nwM=;
 b=GXP2xkiVV8xp5oBLTnOgmi7Iiw2CdQy8zOoBf9jci8LlpxJ7snECxgtOUJRkOe66BGio8reA9S+pkdTok19WMdokgu4YFtYmwiBpM/FAZsd0/7EDYBwVE8JjQ+GmVtTaMi18g/sXe2sn6E2eYK114p1GJvW6PiS8K/9KwaJky56Qh5564PaiBllARFxSBi4TikMIlZoIVweCwgtqUiqHtv7ff+m9Unki8tuWqmqD6bRimxsipHK39PdEmjB0Htrto3aXXL0D032NJHHdJDjjBAzuc4dYPyapZUb6/D+p8Tltynszb2DMRtW6hStAWk8VO0pruY+QA9fUFIFC5Bf64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s2bwkJebguGX04knwEod3khKYd/2r92OdeVJeu1nwM=;
 b=qAfeRzhUtu3Zyc83jdnkKPKF95QMYjYhA+n3c7ZtpnFPgjotsIVsxXHAwHB5Np36WxYdMTX15awWU1yieAAQoey2FkcbpjsyldxGAr2FTpNYpZIARgl6gKp0VbGKWFNs2aq9mjIAGAtB8VyPowfRHln6AwpZGi+VNQTmsCbHsAcGFRbWhCbT0mjPn3VL2mowPGeV6f+0Lax89/oUe20y+9PRpPuY1VzYUe3FmsIdG9+wmd6rs6rfBg9n/VKC9DfyzTPu9hzNsD20+J4kKJxrrhUSoKbFo1Z8n83C5j08GjsWunkbIHnX5mFTaUyXmQaLDLQj+q6ktj0GA9v5tjjrUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62621a62-de66-7b6e-97d5-4b65f630bf4d@suse.com>
Date: Thu, 22 Jun 2023 14:41:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <db883456d7d210e2ea9ac4a7b402dda73c3ea8cd.1687421893.git.nicola.vetrini@bugseng.com>
 <a2cb3db9-50a6-f620-8001-1eac8586ad61@suse.com>
 <7c04191b-62d2-6802-df77-e262d567cb7d@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7c04191b-62d2-6802-df77-e262d567cb7d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 1421ede9-101d-4766-c95c-08db731e043d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HfRNiKhROR7xnFJRDAxk7I2FRXdicaVM8zn1aBcKkyVko10SZ5PHeFZWW1ThsxGGIFGEqiVQwypYovkrSUwKCQThF0qHD69aIeQdWrvgoXUU3cRLGa8EOKADJLuUt6KYwrqrKQx8QeuE8rfpfLID/1znM+/c/vPfgFfOW1pwCKbZp84h4TsL3Vt/SQmu+7fAPpaH+xLYQhD7yqW+NQOiZVEh/SPdZnIQos+3q4trxLSUQDL/0snOJvYDy0mFvk0mG2IWafxwMpAbs4MrVMRssFtpO8mATfYzdohvor8jtxfxTTYLn4EqMTSOKgcs81e+7XRFD3TRYNH3hFfmkoDw+OCcKrIdUrXuCG94l+SVV0/aDv4XqCUpHso6gKV8QknCTL5HtAMPZegSDE1d6QH+ijSxpaLMdOk70O4EgJtXYdKFwUTULkoMgAZhfWGqIhLnuNM8y4yQ3xiQlfALnKxq4gP1r9gz7K9dWybFmTN5H5/9c20kh8piL5cjgDsgmnaUCzmZzWcj4Xp9Bn9EDBlsrRefmwFOlzsDX91gvmbWgwJtzM6drIcrzYNQM0nVfsb4lKlDQ7lzSDlO9LTIRmIjBk3escleMG1aW+VMyBXyS6MA+Z4+iTwMb5Gno3e1k2w2sE0Q3SajkFFMZPe+hxROFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(36756003)(86362001)(54906003)(31696002)(31686004)(38100700002)(2616005)(6506007)(53546011)(186003)(26005)(6512007)(8676002)(478600001)(6666004)(4326008)(6486002)(66476007)(6916009)(66946007)(66556008)(316002)(5660300002)(8936002)(41300700001)(2906002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0FIZVU4Z016b0FWZ0xOcERKZ3VTNXRxM1o5WExkeG9Ec0hkSXd3eTdpZGFX?=
 =?utf-8?B?SXEvK1hvcEptQVI0ZmprcFhlbVJOOXdHZ1BicWN0eVlkNUxWeFNUWGZDbjVk?=
 =?utf-8?B?OCthT3BmTGgvSHNDSlJLQkVnazdmTnpjQ29palZQV3Q5bGR1U1hkcWEvQVds?=
 =?utf-8?B?OXE3bmd3OElPdm9WamVoUHBoWHhucXJRZkM2ZUQvbGh2VzdyWUVISllYeXE1?=
 =?utf-8?B?K1dvU1BlNTdWbWlqTno4RHQ3Zk9RcGs1VERuc1FOTjBva1lFK29mWHNHWVNC?=
 =?utf-8?B?Z2FGRmpGcGUyd0tWVjUvYnZmZVJiZnFaRXpqWG94RlVESGpqbUF4d2s0bTh4?=
 =?utf-8?B?c3dFZWVnK3F3cjJOaHR3OTJhYmdCd3dUVnRoNEFTWTJNcy9wbEhwTEwzZDVX?=
 =?utf-8?B?UzZUYXlFQm8xUGd5SmNuMkZCZzAyeHI5Y2VFaGRGbnRIZ3lJQXVnSFdJZG1W?=
 =?utf-8?B?U1lvclZDd09yL1R6S25ydEU0NENIcEJoVnZXRnczdVh4RFQvVFd3MkkzWDgz?=
 =?utf-8?B?VHR2ZzZLWmVjdEphencwVUZWQ1JWNzdDYTkyMktrTzRQTDFDYlJEWWo1Rys3?=
 =?utf-8?B?TGhFUUx4ODkzbi9kTWRhQ1g5cCtUak1zbGJGOGZpRXBGUm12aDBlTzVGTjBL?=
 =?utf-8?B?V3E0Vk9NdE1IL3ZFVFBMYSs2Q3g1UndCTUo5ekJOZzcrbjRaNTM4dzBwanYx?=
 =?utf-8?B?N1N3eVkvdXA5eEw0Q0NKZms1Sm9iWDAwbnNPZFpBVmd0eUJqbWVUb1hCS3ZZ?=
 =?utf-8?B?eGlDTzEvRy8xaVBnK0VCbUxVR3M4c2h5ZFBNMTRUVWdrdm1KWjY2VXJRQVU4?=
 =?utf-8?B?UzU3KzlvbXRkb1loQi9DMGxIUjB2U0taNnVXOUlwWnpyNFhyNXF3RlJRdnFm?=
 =?utf-8?B?cDloQjBaMWROYU5KN01vaUpQVUhXSmtoQ0JPSUY3N2NvZ0NOOERmdlJRcHE1?=
 =?utf-8?B?M1d5SEUybTVKejlVWW1DSy9LTks5dWw3NGQ1NkFMQXN3QWRkYUtsVUdlMmxR?=
 =?utf-8?B?ZlNJcmtRaTI2UTltQVpRcGdBcjR4ZDJkZFI5dlkxRWJPVUNaYlZNa05DZHVt?=
 =?utf-8?B?SlZaOHVramg5enpuczRBVzAwNXEvbnNsbld4Umw2dUhubjZHWGxsTytUZlR6?=
 =?utf-8?B?UVpUY3ZXLytxczBSbzFFQzFFQUtoTitNd2xXQTJEODZ2SHhYK0dicVZtaEdM?=
 =?utf-8?B?bE1wWXNabjdrL1hxZys1SUxqYmZISUpEU244Y1ovMmFqenJ0YlFhQ2F6RnNC?=
 =?utf-8?B?NjdtanVhYlZoU3VTajJmZ0U5T1pYU3NPRXk1Mno3dG1rbUw2Z0FVYUtyVWVS?=
 =?utf-8?B?ME8vMHdNQURrc0ZJZWhPcUZoNjUwZVl5WlNnUHBkcGlYQmpGbUJ0WHlFMXZG?=
 =?utf-8?B?bjVuQmZ2TjR6WXJ2YjZzaS9sbDBrSkNqWnVaOXZ6N2RyUU9PcEh4eE02Y0th?=
 =?utf-8?B?Sk5mNjVpRDZUZldoZkQ4VXFwQWhBQ295KzQ0WWJaL2hGcUJTaFRFdjczVWl0?=
 =?utf-8?B?OGgzVzFQVkNqcUhPaHZZcDdQUE8rNkJYUXNWZzRLa3RaZzNsWkJpSnBZbFJT?=
 =?utf-8?B?KzI0R3JVUldaYzJHT3UxVTR3ZHRQdVVGK2ZjcC9LODhyVE5XZUg5dDZ4Mm9r?=
 =?utf-8?B?U2NUYUw0S2R4S1FUMjREZmtmQk9Td0ZmMnRSb1NEZkdjVkl4b1ByUzlpYy9W?=
 =?utf-8?B?TnJncXdkZnBsa21oOFVqd0lLNWVpUVpnUTN5eDY2cVBBOHVUVTROMElFN0dh?=
 =?utf-8?B?eGJwYlVFQXhHa2JyYzFTV0d3Sy9GcWd0TUxKbTFYUUFnL243Q1ZmMHRrdmV5?=
 =?utf-8?B?RmI1WWZzMUxTS0hzNi9lSEw5djNQK2Y4VENyMjFPbHJCbU1ldFpFT2RkVGZ0?=
 =?utf-8?B?RS9jRkRNcHRndXZ0QlhCNFpSa0xmSVVFaHQ5R21WSDlUa2dzdCs0S1dMOG5o?=
 =?utf-8?B?WEpCYlQ4TFVDVUlBZUM3bHZJb0gxMFUxNWVDTlFhTUdRZ3I5THRUTzRtMFpW?=
 =?utf-8?B?WGpLcCtiVmZVK2hCUTgxRTBZcHZUM3hLM1FUcUNJNFMrUlhnMlJCNUJKMmM1?=
 =?utf-8?B?ZVRGSldDY3ZSUFpmRVdoRmZiVkZBSkszbGh0bjFPKzV5YUZUbzk5cVRQYXAw?=
 =?utf-8?Q?IFHvh2+kmAIqZFxyBdPVFuQTZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1421ede9-101d-4766-c95c-08db731e043d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 12:41:36.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4CnvWCvb44INHYpmG33clhKSErOlc1jkOdDzN9IFub7YM6qIhqy785y6fGrRPMwNuXRguyGxRWWKpy5TWMx1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803

On 22.06.2023 11:34, Nicola Vetrini wrote:
> 
> 
> On 22/06/23 10:56, Jan Beulich wrote:
>> On 22.06.2023 10:24, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/lib.h
>>> +++ b/xen/include/xen/lib.h
>>> @@ -51,9 +51,10 @@
>>>      e.g. in a structure initializer (or where-ever else comma expressions
>>>      aren't permitted). */
>>>   #define BUILD_BUG_ON_ZERO(cond) \
>>> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
>>> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0U)
>>>   #else
>>> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
>>> +#define BUILD_BUG_ON_ZERO(cond) \
>>> +    (sizeof(struct { unsigned u : (cond) ? -1 : 1; }) & 0U)
>>
>> Given your remark on named bitfields not being allowed to be zero length
>> (which hopefully holds universally, i.e. isn't subject to compiler
>> extensions), how about
>>
>> #define BUILD_BUG_ON_ZERO(cond) (sizeof(struct { int _:!(cond); }) & 0)
> 
> Well, the reason for the change is to drop any assumption on 
> compiler-specific quirks that may arise (it would be a surprise if this 
> wasn't the case, though)

And the reason for my suggestion was that it's shorter, and typically I
view "shorter" as also "easier to read/follow".

>> ? (Implicitly, as said before, I question the value of the U suffixes here.
>> Even better might be to make sure the expression is explicitly not of
>> unsigned type, to avoid surprises if someone used ~BUILD_BUG_ON_ZERO()
>> somewhere.)
> 
> The documentation for the macro definition states that the expression 
> must have value 0 and type size_t when cond is false. If I understand 
> correctly what you're saying here, then this is not allowed by the 
> documentation.

Well, it's the comment that says this, yes. Question is whether the
comment mandates the behavior or merely describes the current
implementation. Imo it's the latter ... But anyway, switching the
result type is independent of the present goal.

Jan

