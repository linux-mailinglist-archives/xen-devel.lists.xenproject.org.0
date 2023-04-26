Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E130C6EEEE9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526499.818286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZFz-00081m-8w; Wed, 26 Apr 2023 07:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526499.818286; Wed, 26 Apr 2023 07:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZFz-0007yW-5y; Wed, 26 Apr 2023 07:08:03 +0000
Received: by outflank-mailman (input) for mailman id 526499;
 Wed, 26 Apr 2023 07:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prZFy-0007yQ-EA
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:08:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13ff15c4-e401-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 09:08:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7340.eurprd04.prod.outlook.com (2603:10a6:102:93::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 07:07:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 07:07:31 +0000
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
X-Inumbo-ID: 13ff15c4-e401-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZVY8BTne0gQp7pLdKvsQZwtzZHoQYUn9abIXqhSHbmD02TdeJ35iMVN8hPmLfswdyN3fLPI0zjTD6NS0a90GXvsd2GZNrv4HEKNx3GUPRpxQneaR2dcdImzc+6sb/7tI0LZp50hi57NBIa2c/76HsNvjp4xrNHe5nSfodADAjAjpFc6UOk/cHf1NGeKsXEvsxK5vawq4a8b3MMpMKspthd9OKAbDhRAJO/6RiVfpMd20zUev/eiKuzz5q4MjbA8siuH/V80uZofseoUEUD7qz1deZ8T59Owl5WhM353rG4I76D1pu8LqYHhGoEd1ax7i1m7ZwI4JKTIir+P7/mKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u73J4pR9h6BZim13/FmvTniUy5L8IiACuXft2MAZqT8=;
 b=BevTrURPyQrZ895h3qGNRoedxCloGbOW227P/TAZ9meq+qi4Xd1UtbltxIAdeC+jW1nUILEE1cMGsUeQF8vpGSU8DYkISaVnbTq7HhxFwXYilD+yjs/Lg2cSc0y+4400dxYv4gjSHtVoO3G9x+Q0zKjcG+LdKj/8bR9o7m+PfPzvLfNbTyqu59GAu3T9JIi4GB4Q8t+CR+6UTVNn2id+sg3YFi4dF2+8+Bhb+GR8824zHwQq9n0GstbNa85czSKgO7DKRTsPRuOobnUMqqm1eX0O8a8i2i5SoxNbO8fvAj5FzoT7MDBj7OZD/VPYSTICSBhI1r/cahMqOp2x0jjXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u73J4pR9h6BZim13/FmvTniUy5L8IiACuXft2MAZqT8=;
 b=37sCwlCI40Yu+lWcKItHIMCEUIOLRBxlSHyN40DHLFWNPOOZZWtDNoir8FG42QL0eNawx5/LKMhvTWcrxsXG03FKkdQg3y1odRsdUV4FB4oPs1g2WedmcIySH0PW3sPNqcGM4azlTq4ko1z0pxhtKizG1OJPeWb7lWP638zl2/BMNb4ojkeyJf+r8wFNtNWIPBXisIkJb5T3wL65n4qJ8WeJfX0Yxcz0AwD8g6wM+hEvy6W3tSgWWSyfu7X7/ZDb4ekbI9xJiTnya0rAvzMnXypJ9MkVMjfi1iADOgMsaG/6mKMKg7CZqHGN1PQC38yKrFh5sWj2fpxBmkh5miro4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e783d71f-cc0c-e235-28a8-7ec9ad63d41f@suse.com>
Date: Wed, 26 Apr 2023 09:07:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
 <AS8PR08MB7991F2DDC4C13F33390557EA92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991F2DDC4C13F33390557EA92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbb8de2-8d54-43c6-23d2-08db4624e6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bo1/FnjMdLX3upI74TWA3m0Rw36J5t581weSFNlkxMG/fhJzT+NRY2F67E/Vc2WuxMcRMhOZoaM/qWjtE6yVICr/5Oeqxswglwv5MF3RDHhx/b5n1XuA76tkoJVGMXSyWSJiSrxIijqqLrrC9sa0TgYU5dAl3LgrRUlDaYJ+w/g6JpdhhasJ8mwqtuXIvGHvrrCDzAfQv3iWn5KGVOzq2PRHetY10YatViXbzqaw0HHxWZK+Sh1eD+zlirqdN8bOi1mUw/BiNc47FZ8VVWhLRyOhuvkUbf6t7hL+YcNwleomDsKYEe9zsClkh4aIk+oIKGMrJbJD62NsXs9zImoi7OD204uZpiuVV10lbJIg+DUVsXouPK86dvxJ6RAQC5Fm+v/fIhTvObxeTte5woH4ysjhwHAmPuAlSDqpVNk2wf9SKprEFso9OiDp8Ivkrw2/rawPBwGjYEwiZpCj5KeNh6i/G6Y9r/jvTM/c1AMNrbTxvT2pgyzgXlApwM4wc4h0ltZ1gqn8R7mANxjEvJ1tY2k3U7UMW1sNQq3x9/sVH83d7KlXBgVwwyuRbUMAUB4G39+4y1KhfJbsifo8EqtdOZKWuKOp1hIlYt8YQ+FfEfTsbGqmcbv5Zsh9b2z/W3A6tkESwg8VJzA8cY3ZCYNidw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(41300700001)(36756003)(66946007)(54906003)(478600001)(316002)(966005)(66476007)(4326008)(66556008)(6916009)(86362001)(6486002)(31696002)(83380400001)(2906002)(2616005)(8936002)(8676002)(5660300002)(31686004)(6506007)(6512007)(53546011)(26005)(66899021)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3p1UTZOaEN2d1IxWDRGc242UTRxcHhOS1R6N1pZZUFBQzFNaC93M1lYYmxn?=
 =?utf-8?B?ajVnK3dKSFpNUVhsdXM4Rm85cUNCdWRtMjM0WDlselVMbFJKZXdhUG1nVEpq?=
 =?utf-8?B?dDFhM0gvekJYMll2VlFuMktwVXFJRXRlZVA4bWJ5TGZVUW4rYU1hUUR1NzY3?=
 =?utf-8?B?QzVwU2pqcGZqSStvQUYyMGJKODRNNUtPd2xPY1E4U3R5Zzh2eTRpWVpuRita?=
 =?utf-8?B?cnNqWlhMYzd6TG5FMDBEc1BjdDhyc21uVlY4M2U0NlVoeHZYUkZWOW43bWty?=
 =?utf-8?B?eDc2dC9aTUFpeUd6SnZ6UW5LUk91d3ducFRIbFYwbk9lRkJaRVNQZ0tZQ3lF?=
 =?utf-8?B?dnMwajNWaUVkRHlER1hDMmx4Y0gvbjlpbDl3bVUxL2piTnkrWXNoNlB2LzN3?=
 =?utf-8?B?S0NxckRDSlBNRW96L3E1Rk5nNHBrUW4rWjVRVGRMcU9BNWdWWGFFcThUMGNi?=
 =?utf-8?B?TXNxTDZLSkFrSktYK3FyYWFaVDJheEw5WmFZNjBqVkRpR3oxaDMraUZDdzlW?=
 =?utf-8?B?b1VWTDFwSFYvaXVGcEcvT0V3VjR5U2RMTEQ2TFhsTGw0WlBqYVFUamZJTnJF?=
 =?utf-8?B?VmdmL3l0SFhPOXRGb0JBWHovMnZLQ25wb0dTNURBQUJldEIyVHN4aytYY0gw?=
 =?utf-8?B?bVBNK2FCRmcrVDM1SzNOTGRGSDkrTk5RZWlVU1RocFc4Ym04S3cvaDhoQ0Zk?=
 =?utf-8?B?TXBZa1haUG1HV3V6MlhJSGxpSFkzenpneStkSHovSkdtKzlIMmhGNWhycFpN?=
 =?utf-8?B?VnBCYXVTcTY3Zm9aNDRQZGlyaVhzWTIxcTc1ZTNlVTN0ZXNkOVZyTktyeUF5?=
 =?utf-8?B?eDJ6dE00QnNMNnJ6VkxxM0kyci9ZY09Zd3VWbURLUUF1NFZNaG9ETnV2cDB4?=
 =?utf-8?B?TXowcFJtNGVLU3hZc1FJNXNXbVI1NGc0VitRbDZrMmZIVnUwbkRxMS9hNXhL?=
 =?utf-8?B?WlJrdmY1SUZkd1h4MkQrenJNQVc3Z2hSWXExMEg3aE9XZlJ6NzR5K0Zsc2py?=
 =?utf-8?B?d3ZaQmJkZG5UQldkdTBlNVZ0RGVhajhDa1FTcGpQTlZnYU1uS3FVanhkWHlN?=
 =?utf-8?B?aHBTK05SZnVEOHQ1RURUaWZ3YTd0NzQzL083T0g3NTAzRFQyUDhRS0lCdDUy?=
 =?utf-8?B?NnVNWE9lbWM3Z0NuTDRUaVlhRXlpSTZoR1VhaU16eHNRSXFTQmtXMkxnWXdY?=
 =?utf-8?B?MTIwUmtETUw4bzQxQW9TTlE0M2lUZVY2b1BtamQ0TlZ2S1NYazdmaHBRL2ph?=
 =?utf-8?B?Zm5iVWNjSGFhNlFXWVNqYmZQS1Nyd1Q0d3lWcmpER0hqbzE5LytmRFB1Q2lL?=
 =?utf-8?B?b3VnL01uR21UYklMcTVITHB4d3pqR1J3dmw5MzFaQkM1VjA3TE5qc0o5WStm?=
 =?utf-8?B?MW9LdkNIQTJ4bmZnSjhXT1M4OFNOdmVmbU9IUDhqVTNHWVNtMExFWmcyYnNz?=
 =?utf-8?B?MXV6R3l3ZXVSalZLWkVSb0FhRGVwVzNwMXliVXc2S2NKZWNNTFlPMHVIM1Aw?=
 =?utf-8?B?YUhic3FnOFVNTDFpQ0JJY2xmNFFtNWdHbEs3RGJIRTQ4bE56bUpnbVdaQVRW?=
 =?utf-8?B?Zm9JQ0JZMFU4TjRiWjltcnNoeWEzY2dubklWaG44Y0JKaEpZMkpMdlVjWFF1?=
 =?utf-8?B?UWptZ0g0Y09XVk9qUjh5SjNsa0hLNFl5OWFUZUdDOUd6Nzk4aEo5Y1o5bnNw?=
 =?utf-8?B?L20xVVlKSHQ3aUZLaWk4WEk1ZU03TWNPQXN1RTVtSko0aWkrdnBGdFU4RE04?=
 =?utf-8?B?N3l1cVJhN3J1aDZWdHkvZzc5cWZnQnhtWlFFRFNPdHRsajhTLzVubmQwSFBv?=
 =?utf-8?B?bytsTEpkUC9sM2lWMlZFemtMSjRrb0s3TG5CaTlsODFKNE0rdjNVOUdrNWdC?=
 =?utf-8?B?a2NZU1B4TmJ6QlV6WXlLUWlSOUlYYmVueXpLYzBQSWxJb1dYTXYrSHpsaXFR?=
 =?utf-8?B?a0duSXNlM3ZTNnNDSWRhMno2VG5DQmUwL01PU003dC96VzZOWUo4RHN4NUpF?=
 =?utf-8?B?WVVZRmp0bENKVmo0Y2RRZDhSRFJ5Um5ua1F4cjl4N0IrTnFKRWtXRkc2ck55?=
 =?utf-8?B?N1NHdW5ONFJoNWI5dklPSU5QWnQwOVJZUG16Mm1WakphNk9xVHN1N2JROWF2?=
 =?utf-8?Q?ZBc7+B2kU9MUf84/YTv+l5D/9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbb8de2-8d54-43c6-23d2-08db4624e6f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 07:07:31.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49r7xYR6lNQBx/0HXM5yrPoQFuaKM6emBb7AH1NlxlHR1Pm48HafJBcOa6wzjUme7gU5WkcxlIb4cPRHcziq6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7340

On 26.04.2023 08:29, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>>> +        distance = dt_next_cell(1, &matrix);
>>
>> Upon second thought I checked what dt_next_cell() returns: You're silently
>> truncating here and then ...
>>
>>> +            /* Bi-directions are not set, set both */
>>> +            numa_set_distance(from, to, distance);
>>> +            numa_set_distance(to, from, distance);
>>
>> ... here again. Is that really the intention?
> 
> By hunting down the historical discussions I found that using dt_next_cell() is
> what Julien suggested 2 years ago in the RFC series [1]. Given the truncation
> here is for node id (from/to) and distance which I am pretty sure will not
> exceed 32-bit range, I think the silent truncation is safe.

That discussion is orthogonal; the previously used dt_read_number() is no
different in the regard I'm referring to.

> However I understand your point here, the silent truncation is not ideal, so
> I wonder if you have any suggestions to improve, do you think I should change
> these variables to u64 or maybe I need to do the explicit type cast or any
> better suggestions from you? Thanks!

So one thing I overlooked is that by passing 1 as the first argument, you
only request a 32-bit value. Hence there's no (silent) truncation then on
the dt_next_cell() uses. But the numa_set_distance() calls still truncate
to 8 bits. Adding explicit type casts won't help at all - truncation will
remain as silent as it was before. However, numa_set_distance()'s first
two arguments could easily become "unsigned int", resulting in its node
related bounds checking to take care of all truncation issues. The
"distance" parameter already is unsigned int, and is already being bounds
checked against NUMA_NO_DISTANCE.

Jan

> [1] https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg01175.html
> 
> Kind regards,
> Henry


