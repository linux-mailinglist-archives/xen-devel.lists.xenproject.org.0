Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BEC6FEBE1
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 08:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533136.829538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px04H-0007A5-HE; Thu, 11 May 2023 06:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533136.829538; Thu, 11 May 2023 06:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px04H-00077L-EA; Thu, 11 May 2023 06:46:25 +0000
Received: by outflank-mailman (input) for mailman id 533136;
 Thu, 11 May 2023 06:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px04G-00077F-Jg
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 06:46:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a992dba-efc7-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 08:46:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7551.eurprd04.prod.outlook.com (2603:10a6:102:e9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 06:46:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 06:46:19 +0000
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
X-Inumbo-ID: 8a992dba-efc7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHSjgonNZklH8hC0/yH5+pKLgoozss5Cv2E5wf/sjrmzCc/rCdUOQPOJpM7QPS1T2RonikoqoNwlXhm6WzuQ1KEPVIKRuDSPm72LJ5kqfO8mnvjfj2XGzu6m4ihPSqVriQJbfiiBniAk7xokvrWqouCX0EHAFety1h2Ieb4+LeGPtyAoY1/sajdrv3Wk65/64TPm1JnaPVqmu+DbllszkseHB7J88QEAQnc2Sty8rqK7mQLf2cLj79SHFzoHiIaWXrHK17uZzneQ3EogS3u6G0U9MGIBMWO14pY2sKet6CU5zrbVSRvbj5+3b1L74h2/v/1hdxgckLpYmsrFINHu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DP1NEdlleLZ9Cmuz6iiZkkzUin637+Fbq4aY7GaIro=;
 b=GISGOXU3qzbjvOpQJWPOTowE48I2VfmEXok7HWI8JlF0HhJH5EqAfE4LN2u8T8VTKzWkx5HQYm6UVxdqvC7n1hxcHr5IGmc/zebb+I5jS9bO6JBeXfc5nWFwZ03ke5+uwWFtkgrEtSAv/QT6Q2VBaahk/6XIRBsLwBr0a0McZ/ZXgxyWVc6nWgnI8aKFLUc09PkqYbaIIh8RG7drsVgKHNivEHpFmerJuc8KB5s5ErOgGYeHsQi+oeesQCP4x6cBcKKzJhOKZZmbjV6NG7Hgi3m3yzHcpwOUee6ehbhrLeQVSy0+pSGqWsGMD16saiQyhOm3EVCqPq/8ojNwPrq1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DP1NEdlleLZ9Cmuz6iiZkkzUin637+Fbq4aY7GaIro=;
 b=rUkwoJIXN9VdZ3d1WYDkSp4BwJ0OYlGBJcGMBYOiQFA7ujw9bs7F2utrBNXbdOW/nqIXXusoP/pSZqH+w6Fi8+6qocjGe2q3dpO9z9YvNyEeMKyCJSXctM0PgYuPTD+7BA0ZLVO4sp3/jbp5kReUvXCbPiuO88NxN4+WAsLYihM/s8VS4ubPZVzHpsWVdmoI+DvSaFEEUSL9QIQVyZvfEzrnM4A+t5z49a3ClbRmTGi+XaBpks6rqrQ5Qxmk0TYyGHmJ6r16Y14N46cdTw5fxkjjYGe08kpABZt3E7vx8tf1Un6nn7E9ka1gmvtdsHuVfPRbNMGK6PImk8hlQ+zmLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <995d1c8a-860d-fab6-4f92-7f1f7510b7e4@suse.com>
Date: Thu, 11 May 2023 08:46:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] x86/cpu-policy: Disentangle X86_NR_FEAT and
 FEATURESET_NR_ENTRIES
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-6-andrew.cooper3@citrix.com>
 <9613df3b-c49f-6034-ff99-7a6ea9286f0f@suse.com>
 <e888dc16-66bf-fc15-9ddd-f10879b79a5d@citrix.com>
 <f09c9127-1cc4-1ed9-0348-be12c0c999e8@suse.com>
 <e4385229-a804-191f-c656-b605c498a292@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e4385229-a804-191f-c656-b605c498a292@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d193722-9f7b-41fa-ba10-08db51eb6d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0g/RzrFA1qJkLC7CuOYTj+86V6J0CMtLHfbe2++RBspTXPlojhbG3XLmt75MmMOU+haPZwZ3LPr8dZuhoGukI6y0I96zHZW/yQVF/CWZzUSlkzl4OvgDAGnT2gzzk9v002BGOVpbfylC0DWc0zVYDxGtcrBIVsv/HAdIuyDK0fRf+3TeUK09rX+PbcediC71AA8fknomxyA5H67INNM3RVEBtX452LFqaZN0xASucsfYs9932NC4FjX0TeVfOWXwLBiLKOf4saloVK8QCGQx+yamFBnY7hjwQR8MFkO5z26j2vCPP/Pim+3gQJfXRT8eHZGy5mYvymBuJtmYXyBz+nzsig2VMeGDvHYCKlZpHLIWhqhUY0OdjqnpolRq0Iv0QQUPneIE+W9FfQo3SGfvHMvyekyInGaiqJQL7LDTYAp6Sw4Vf6j+9NZSl9MEVZ3c48t5fH5FG80H6s5zKApVn39NhwmZrJz1rPNY51gLWToJUlHvqFLA8aUbZLrr1RFdAwM3cYt2/jpIFLNZjmC/bDTX9IZPidaAY5xuyhQ9ZHxgROA28UaVFSkk9ge34gC7/JURqTfI7lp0XSLjx9nsAyT6rnZEUCg82Oqj2Nc66VKSEW2dP090RBJuGvnqT4V7kh0csxig5vmFqhMMB1Wm+CZ8R+aMuipjWzEdsdbKzo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(31686004)(36756003)(66556008)(966005)(66476007)(4326008)(6486002)(66946007)(6916009)(54906003)(478600001)(316002)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(2616005)(6506007)(8676002)(8936002)(2906002)(5660300002)(41300700001)(83380400001)(38100700002)(522954003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZJNXlGRTh3SVkrdXRQdGFsZFhHQ2F5dmRzN3NTci9jd3NpWjFhNFJSd2pF?=
 =?utf-8?B?amlMSklLUUl3T2Q1a0lCVGovck1neWpKL2dTbnVTR3YwV3IwM3p6T2tGWkN2?=
 =?utf-8?B?dGg1bTFvVGJkVlNEOWtNV3l6STdzNzk1VGIyM3JiNVIyVDNnNExMZDBKbWs2?=
 =?utf-8?B?SG1PM3hJakYvNWEwV1FVODV3R056TG1wa2JabUJIcHEwWk00VU9IK2pVQlVY?=
 =?utf-8?B?K20rb3NVODV4OXJTZzRXL3FRQ0p2SXdISUpZcmdIYkdWMlBwYTJVZlpmZy9M?=
 =?utf-8?B?ZUZJMjFnYngrbXg5TlNZaGNMS1JnU0c1aUovTTI3L0w0UURUQnVJbGdFaUhX?=
 =?utf-8?B?aFVzelN5ZFF2K3kzVzhTVUQ0VGgrdkxhdk1HeHNuMU1wbUFzRXE1dDQ2TUpi?=
 =?utf-8?B?Z2dmcFpFRkdDK3R1NzdEUG90c054VXZteUkrS3JSRmZ3cXVHaDMzb1B1ZEVT?=
 =?utf-8?B?cjdETnpvelk3K2NxeWxOeVFuN1Nuc0hqd0VnQ25QTGpUbFdVSm5JS0dRSG5K?=
 =?utf-8?B?SnVTUmF6Y29UVlQvemV1amllS0tnajcrUWtLRmQ4SW9vRHFwSlVCZG5YcGxX?=
 =?utf-8?B?RWNnZEFFdS9YRm9JMDJqaDNlQ0psQ1lHMWNLUXBNbkhDMWxIU1U5bGFjYWRX?=
 =?utf-8?B?NUtXd05SVmxOV094UE0yY2U4VWE5ZzVnSzF3U0ZLeTNJMTNlaU9UaGlTZ1l6?=
 =?utf-8?B?TnFnVE50YTZLS05uRlBjM0tCQVM4SVBCSFhKV2EzcysyYlpFa3h2Vm5oUU1y?=
 =?utf-8?B?eS9IOFc2S1FOemFncENHcGIyZnZzdFJ4OXhmaWtlWElqNU14UE02UEtVWVM4?=
 =?utf-8?B?Q29FUXRkNVBaSzdvaGxQMHBDNkJJNmMvSnM0TVhBMTI3cjE2S3dmQjQxS1pJ?=
 =?utf-8?B?UklLU2Rqa2xNT2Rncjk0SHR1UFgvS0pYZWxBcWkwN2pkOHgxa1plbENQTWp3?=
 =?utf-8?B?WThBTllTVFBLZUQ4bG9qVVFxdkw2ZDRqc0JZcXdXWTBkbXkwQmtjcGR4b0do?=
 =?utf-8?B?YkM4TldOMHFVZ1FiRnh4MXNhR3kwUU9nVXZpYVNpWXFRS3pQdkYvczlFSnBZ?=
 =?utf-8?B?eDZZVytGcGdHaDhQVnFhdS9Nc2N1cWp1cWgrNG94WE9UdTVnMkVRNTZFRFlX?=
 =?utf-8?B?K1JUT3k3aVdVSjJtZmxjRWx5bTV2bzVIeUpsalNSWGRvRUFJRW5rc3BzM3hz?=
 =?utf-8?B?QWsyL3YvNGZFL0dhWTYvSkcvVnpBMGpZYXFvbWU4ZWxsdCt1Y3gxTEZUb1NH?=
 =?utf-8?B?c2JiSWFKa1VkNFo1Q0pocUJIOUUyenNRdE9qWmlNMXMwNVU1UFdqdzVaQ1dq?=
 =?utf-8?B?cGY4L241NkovaXFCamhZbVQxeTg3ZzZoZmlLdlRxajdoa2NlRnA3cWRlVWcv?=
 =?utf-8?B?cURudmRPTHBSUlJmMmdlc2V4QlRxamc1cWxIQVIxNFd3UlMzYTIwQmVpdjBR?=
 =?utf-8?B?Y0Y2eEU4dGtlR3R4bTlaQTZYdmpBWVNXL1R4bThNTSt6NmdqSWlqZmlHUGJP?=
 =?utf-8?B?OGc3Y1RGL1JjbHk0QXFBUWNZdnJTRmN2ZUhySGsyL2oyRjY1dXd6a1pKc1hK?=
 =?utf-8?B?YTB6T1JkV2NpN3ZhUUlrUHljY1Bycmk1VEVjRVRjeDgxR09PRFBQOFg1a2s5?=
 =?utf-8?B?eDM4WE9DU3RKUWxPN094QUtCWGtodEJ6bS9vVU1YcXk1dFVvY0kzeGRuTHlB?=
 =?utf-8?B?NXZhMGJQYU1qM1hKRGEvZk8wdDQxT3VMSkRLOTdDUzNtaUwyV1ROSXF0RVlw?=
 =?utf-8?B?RGdDRGJza25WYUhHNVJDMzA1RHNnWGc5RXJodmNIVlAzZEkzSnE2dFZNY3Y0?=
 =?utf-8?B?R3FqZFlxSEZHZnZ1bnFmRzJQVVE5UWZtUktjNEwwZ1JDYmdLUUpDS1ZXaTYr?=
 =?utf-8?B?VEdhTkpQMWx6SDBrRmJKSEUyTXFwd3Bob1k3RHRCZnBHeVdBc1dIc2NTMDBC?=
 =?utf-8?B?bVhZcVBuYlJVSFo3c09NZVlNZEl1ODUwMGVObElhY3hOejlyM21MejhHcllj?=
 =?utf-8?B?OGkxcGtER1JPblZab1ZId2ZkTWxxOExGL3ExMHFNc1pYTUF2akdQQ0lFK1Z5?=
 =?utf-8?B?U0RDR0RRMVUyV3QxRklZVnBwVTgwWW1MNitWbTRYMU9CU08wcE5JT2I5YVZY?=
 =?utf-8?Q?vSg7oCQ0pzQZ24FJ9X/8eG5Wc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d193722-9f7b-41fa-ba10-08db51eb6d05
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 06:46:19.2680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjSazTkqfyEY/FmwYB7KwvXp9hHGZlv1Y4YreMWGRidQR4iAgRtTFJyq6TZaCii10+TZMSp1/yOQeJq3HirO3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7551

On 10.05.2023 22:13, Andrew Cooper wrote:
> On 09/05/2023 3:24 pm, Jan Beulich wrote:
>> On 09.05.2023 16:03, Andrew Cooper wrote:
>>> On 08/05/2023 8:45 am, Jan Beulich wrote:
>>>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>>>> When adding new words to a featureset, there is a reasonable amount of
>>>>> boilerplate and it is preforable to split the addition into multiple patches.
>>>>>
>>>>> GCC 12 spotted a real (transient) error which occurs when splitting additions
>>>>> like this.  Right now, FEATURESET_NR_ENTRIES is dynamically generated from the
>>>>> highest numeric XEN_CPUFEATURE() value, and can be less than what the
>>>>> FEATURESET_* constants suggest the length of a featureset bitmap ought to be.
>>>>>
>>>>> This causes the policy <-> featureset converters to genuinely access
>>>>> out-of-bounds on the featureset array.
>>>>>
>>>>> Rework X86_NR_FEAT to be related to FEATURESET_* alone, allowing it
>>>>> specifically to grow larger than FEATURESET_NR_ENTRIES.
>>>>>
>>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> While, like you, I could live with the previous patch even if I don't
>>>> particularly like it, I'm not convinced of the route you take here.
>>> It's the route you tentatively agreed to in
>>> https://lore.kernel.org/xen-devel/a282c338-98ab-6c3f-314b-267a5a82bad1@suse.com/
>> Right. Yet I deliberately said "may be the best" there, as something
>> better might turn up. And getting the two numbers to always agree, as
>> suggested, might end up being better.
> 
> Then don't write "yes" if what you actually mean is "I'd prefer a
> different option if possible", which is a "no".
> 
> I cannot read your mind, and we both know I do not have time to waste on
> this task.
> 
> And now I have to go and spend yet more time doing it differently.

I'm sorry for that. Yet please also allow for me to re-consider an earlier
voiced view, once I see things in more detail.

Jan

