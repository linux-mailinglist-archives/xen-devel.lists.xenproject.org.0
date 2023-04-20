Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E856E8BEE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 09:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523921.814348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppP9u-0006mn-2h; Thu, 20 Apr 2023 07:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523921.814348; Thu, 20 Apr 2023 07:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppP9t-0006jd-VW; Thu, 20 Apr 2023 07:56:49 +0000
Received: by outflank-mailman (input) for mailman id 523921;
 Thu, 20 Apr 2023 07:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppP9t-0006jV-70
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 07:56:49 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe12::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d66291-df50-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 09:56:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8717.eurprd04.prod.outlook.com (2603:10a6:102:21c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 07:56:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 07:56:44 +0000
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
X-Inumbo-ID: e5d66291-df50-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqSlsWBxmxJbD6Aqdb1K/prhdwldMdYfiwqLUmUxXcTkrm3oqtybWMjk4GBOmJE+N1Aii/g8VKM7q6cvYgLgQVbFGMhpsca/7ZooLr0DH/UPIGt2XnWj+HkKF/1DmpIBjXedr3IHTt3beyz1BLX3Rj9WQ9dhKl1MAI4WMCr/A29bMPKUG3pTmK6iPdt3Mo/RNlPcxZczi/W9Cr9cNsvL27y1gl0vLO+ifxgLwQp9jXkxR/ES8Yz2g8GWteJWTpqkHwTdq9MLrTpd46VuGJuzuzGeSDDoKTLXAgF4ZeZvSMX5dOpPvdi9dDMwjG1/GYZqG2sTxGHzNUTtCKx3KlKbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYRTsVNVhfNdly8bLCccYcXLH0JdvZ06DV7MsVJEYg8=;
 b=IYrym91VIv4I5DoQpsa+2KthozYKniXekZFu4ko4/RtZhxMgQQt1gZ/2kNOkQV00YKINmd6Ivmmcf1c4q7fEPi33j1YQFrRM+sZ+BkGT/jttn3ck/oNbztVpqsaTMv3+Y7qZNGPr1fFLv50cAgRE+Se+ZaE2fW+tSOvp3hdcuTMkFPcLnvBmzRX39si7sTO5igozzKmD+2y+jCf05Rd3xl2m70BMbpjZZdir7h3PfA0eimeUdlFNEb8AebvqYkxwK9sgJvvEwR6TURDjPVUdQ835W74huLORs9J/vNTnpMmRzfBVltlYTLWH+1T/A8ooKm9+jzwa3hRuydk1c/jPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYRTsVNVhfNdly8bLCccYcXLH0JdvZ06DV7MsVJEYg8=;
 b=uymDbLS886mGjWGNGGl9k7cuks8arOgMqb+YA/+d4fmZ9YK2Dc7dvPbsQKMJ0+2AbfZt9EDmdRz4J7Pz+KQEqVqfuxp4sZMaZ6NTd4tGjV9yNoONoG6NIVjh3+sZMbZKR13PPQUWbXoMGk/5EU5PQP141zqL1EdCeAl2bcvoodr1Zw3ypVblNanPuCb7yCLXOnJ8ujnWlkKrVuzOBrT5YSPyURTeiK0cOaQ0LfH43ckkHKixG04dO8gN/tBUVD7zqqmZsluUKXhHdRor6iTMJBg0jB2TmBD2Rwx/TmB2UdF7MTDL9qz5tke2+e5ev1jmtUYrQKAUxUjU4fmiShzSYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <abe3b379-d46c-e770-6080-88e12ac4ace2@suse.com>
Date: Thu, 20 Apr 2023 09:56:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2978b495-c222-a3f2-16e1-ff577c7b699c@suse.com>
 <81ED2CE3-D6AD-4CAD-B6CA-C7A045444AAE@arm.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <81ED2CE3-D6AD-4CAD-B6CA-C7A045444AAE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 6488545b-025a-4c92-4160-08db4174c863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pB7X7hQ1fj+gXIh67nc1FyPtGnHY41/7QHmnE6Y5Eeker/v7WUmFN/ud7t2MY6H0smyf5IiOCqzSdJ3Kxd7jyL+bd2++Qf0iLjOG69ItI58t93JohJAjBCBp+ZjnNNmg+0fu8Ob+FFGg9hs0qTXGhtlKooA0m/S+DbC7ywEOPMdS0F1ELZvSKhGGDCHD9celD13hR2FEVc/GV/CzB/tcgbGqmWJCJ+ihAretTrpxX1T7/Es3RKqCB9mp73D0EDL7hvInaubq6EHnUweNnQCbswOxA02GN4F4fQU7FA/2ZzFuEsamBvBUZiVzltbUg3ED8F/umljdgPmHOUw00pLvKVJlymzq3BZsuKmsGcR6KeTZyaY0anRdER8zOIEWKqoX9rYnvFHjLb7UtEbQoVlEeB+rrDHKPGZC2jMFcGBQn/bkTA35x3IeElJae+jopADQCMiWsJ1w45tuza+IM1b3mgtxkWbI+eJKjaKmdfmjFGtEB2UvpF87KKfYU+CuYOP0DcERVWPqAxlWp48m0sPu8g36v/Wr5Klop3sO55Mdlc7XjzZ0ug7oWoRxjyvCfYeoUF2METuyC9yRRkSCiXKHVWtLQghZF55Ym0qOjoH8zSligkEAJfqnHuQbFkSYNbX9F4J7XK5zfpOG7AmM38fz7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(31686004)(6506007)(6512007)(26005)(38100700002)(6486002)(478600001)(66946007)(31696002)(66476007)(66556008)(54906003)(4326008)(6916009)(86362001)(36756003)(6666004)(41300700001)(316002)(83380400001)(186003)(53546011)(8676002)(8936002)(5660300002)(2906002)(2616005)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djhUb0pGMitIZ1BqTi9BaklrczFyYTRNYlVTdHZnVTcrOGFtMWd0WU13OE1G?=
 =?utf-8?B?TGp4Q0NvZndkdFQwbnlTb3NYeUxRd1NkL25oVkRFelJ5TGU5VTM3NE9MZTkx?=
 =?utf-8?B?VGJXQ0VJSmtzUFljUmxiSzJVZTgwOTgwb01RMXd2RW13U0tldDUrODBsUjBr?=
 =?utf-8?B?dWhPZW12WHk4Vm01UERPWENESmIzTVgvaWNodUJ5QVprZzR4a3QzTWlyd0FO?=
 =?utf-8?B?S25JbENIQXFTWW1LV0dYeFhTajlFLzVLc1pVSStVTkxsN0t0S0RRV1ovcEVS?=
 =?utf-8?B?V1NjVFhjb0wwakF2QnZla2ZyeEM0NWhXQ2llVDhub0hQSHpHVjhGLzdqejZl?=
 =?utf-8?B?cHZCWXVya21HQnZCRElReFRTRmZmcnRKQmRlc3oyTWw2VTYvakZGUURTNm4v?=
 =?utf-8?B?WlAwS1NWZ2ZvcHpUaGNDZDZJSkE4MkRzYllvVi8yR2ZQOURVbThXdFE5Rkwz?=
 =?utf-8?B?WnRLZ1NIN1dLWlBnbzYvWGlkcGNiSVNqdkZlV3ZNZytVY3YzRCtkYVl4MWhP?=
 =?utf-8?B?YnZ0OHBFQ0VodEMzOTJWcmtsV2JDSUx6dkluQ1FYRXpCanZFdk9vWi9CdFl4?=
 =?utf-8?B?aHhXakdpRXByMkhQZE1ZSDAyM21lbjhUSlhnTFQrM2tWaTczMDFrVlFkVW9z?=
 =?utf-8?B?ZFIyTDhiRjU1ckw0dXhDNVUwbzlXbW9YQ2xZcHR0Yi9ZWmxCakp3RmpQSVBv?=
 =?utf-8?B?NnRRVDVJRDdqeWFZMnpCRi80djVpaHovZVpBUWQrWXVLYTczYjg3TVlNU2Fp?=
 =?utf-8?B?SlFFaEJIbFduenpJRjQ2SFNaZUlCSVpuQ2RKSFlHREpiQUx2aVdIOW8rVTBI?=
 =?utf-8?B?UFV3WWVxeWJIdDNRS3hhRUkzLzhVUlZyL0ZWemM0Y1VXQWV3ZVRtNU55Y0s3?=
 =?utf-8?B?K25yL2ZPRWYxUzhDQkdZNFJFdXBZalFoMGNCWmZaTmJCZUxQK3lSOXoxZjJh?=
 =?utf-8?B?TFQ0cEcrMTBxeHB5Vk52V01XcFZWY0ZFQTZHdzVDOUYxRFM5clB5QVJ1dEFP?=
 =?utf-8?B?QWZnMWNPUUFRT2YwLzVvWGxwaHRvaTlrdmhKa1RkR3NQU1dsa211VlhBT1RZ?=
 =?utf-8?B?RnErZTdTL2tDV3JyQVdxdEpBVmtuK0wzSFlFZ1ArdElzR3I2RDAyWCszdzRv?=
 =?utf-8?B?K3d3dHhkWm41S0NyM0laRHdhQ0I0RVIyZWNob0NxZk1keHdJYTZNZFJValVZ?=
 =?utf-8?B?Q0gzOGVsa1c3dmxKY0FRbVo4QmFMNVplR2NITUkzanJZQ3lhSlUveUZjNEJh?=
 =?utf-8?B?cFc1b3NrNFp5M2U3S0QwZlJHUnB5L1VJRkVxWEY1NVZHTXVpNkpVKzQyMlVV?=
 =?utf-8?B?WmoxMGN3V2RKdlV6cHg2MTJWK0E1Y3NabFpudnhuTFZCYVRPdEQwYngyTVhp?=
 =?utf-8?B?TGsyRjJCVms4MEZ0eE1DTVdBbUEyUklaek9wYUZwWkc0bFRNUlZES2NlQzJ0?=
 =?utf-8?B?djhiQU5QSVYvMTNBTGdwNXZ1bTc1MzR2R3dxSnNuaUNsYVVMOVZqTi9VK0s5?=
 =?utf-8?B?enJrYzVQdk5uUVBTNTNRaUR5ZitDOXJEVDRSSEJIb2JJdGtJbjFhdVh2YlNk?=
 =?utf-8?B?ZUZ0U2x3bi8vY0IyY3duVS84dWFBQUl6ZVZpZC9NNE94UkhYbTBvb0xJZTJE?=
 =?utf-8?B?VzFGWERVcnNvbWZsSjlqOWx6UXB0TnFSbkZhOWVqbkxYZktHam9FQ1g5a1VR?=
 =?utf-8?B?UDYzbWJUWmg4dEVNbXVzbEpkeE1hb2M2NGxKR0lsQlRhbDBQWk8yMDBKS0Nn?=
 =?utf-8?B?enVXOEpKZ0t3anhuRkROME9iZlA5V1pqek9kby9IQUpzN3RoNStJMkFpdTFm?=
 =?utf-8?B?eE1TOXlNa0wvSEFlMlcySEJQNlJyR3NTQjRXclRaeTVPZjZQVjRLeUdyUGwr?=
 =?utf-8?B?STk5TVg4R1UyZWxwUUdaWW03OXc0MHlOdUhaY2ZZVkorTmZOUXRMTmUwbHR6?=
 =?utf-8?B?ZnJseVdtTjUyU1E0elNOTnZVT25UdUV4eFlQMHEyYVZuRDgvVW1LWHRyejZK?=
 =?utf-8?B?aWg2VlJWZEJld290Z1E5NWJHTUlzclUvZm14QUM3OHhOSDNVeW9QUXhtOGRq?=
 =?utf-8?B?aUZpM3pqdGRITnhPREZHdTB4TTlXQ0tXa2VqbFdQWFlwNit3R2diUjFacjBM?=
 =?utf-8?Q?sGgshijZlnlkfdDJvirAECjht?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6488545b-025a-4c92-4160-08db4174c863
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 07:56:43.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMmUF7pWfuTQ5prktidfbbG/+PXlZwmrrUj83gPmdPmVHswc4WSyYi2CvHRcueWvJU/++KT/XfetKkbMQKfCRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8717

On 20.04.2023 08:25, Luca Fancellu wrote:
>> On 17 Apr 2023, at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
>> On 12.04.2023 11:49, Luca Fancellu wrote:
>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -314,6 +314,31 @@ int parse_boolean(const char *name, const char *s, const char *e)
>>>     return -1;
>>> }
>>>
>>> +int __init parse_signed_integer(const char *name, const char *s, const char *e,
>>> +                                long long *val)
>>> +{
>>> +    size_t slen, nlen;
>>> +    const char *str;
>>> +    long long pval;
>>
>> What use is this extra variable?
> 
> I’m using pval to avoid using *val in the case we find that the parsed number is not good,
> I think it’s better to don’t change the *val if any error come out, what do you think?

Caller ought to check the return value before even considering to look
at the value. Then again I can see how, if the address of a global
variable was passed in, that global may be unduly affected. So I guess
what you have is actually okay.

>>> +    slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
>>> +    nlen = strlen(name);
>>> +
>>> +    /* Does s start with name or contains only the name? */
>>> +    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
>>> +        return -1;
>>
>> The comment imo wants wording consistently positive or consistently
>> negative. IOW either you say what you're looking for, or you say
>> what you're meaning to reject.
> 
> Ok I’ll rephrase to:
> 
> /* Check that this is the name we are looking for and the syntax is right */
> 
> Is that better?

It is, thanks. Alternatively how about "... and a value was provided"?

Jan

