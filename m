Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA358FB07
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384456.619837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5ud-0000mn-I6; Thu, 11 Aug 2022 10:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384456.619837; Thu, 11 Aug 2022 10:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5ud-0000ky-F3; Thu, 11 Aug 2022 10:59:39 +0000
Received: by outflank-mailman (input) for mailman id 384456;
 Thu, 11 Aug 2022 10:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM5uc-0000ks-3L
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:59:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2075.outbound.protection.outlook.com [40.107.104.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b087a5cc-1964-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 12:59:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6744.eurprd04.prod.outlook.com (2603:10a6:20b:f6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 10:59:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 10:59:35 +0000
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
X-Inumbo-ID: b087a5cc-1964-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0OQd+IYiycH0OjhyeZsVVNsXcwjt5WTUzuiIfcVcZ+Ok06kaFTXqrdXaBm8xPpd0wfTSVoRG2GNpze3IN4uaB/UucFARiyOyAhD5+lfh4K6ZNQOxQ2C9Ko72mIzJ705god5pIlUwZU65x/U1fB8OtSuDqldEHucE1z72ZniZtoXyVu0MzUpGuo7Cf7bqTirR3SsY6nnNc7dphmXS7o1g+I4sVmMO30UaA+mklgaYxvn/YiPrnXsRDoyFfzO9FZkPZghAcre/hLu0Eyo64yFrjzWh4O94E8hE75htIngiymEZ/RoHMWyNntc+Z8BqgTBdyme+yxKxv2Auii/my06TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBYO4Xg7bCVuAbhNPgj8vmzhgJWbAmx8JtTystD9Nzc=;
 b=NagZUnLUnKjsrZkFwkXSOM/igxPhYaOgEDABwGRFDpQ5dCjJReTV14DPu7shdYqVFPnVcpqCPY+PAeAYLY/VUq6R+HOXzVAPyN7UDzLkdehnmS/bgogQUbVBcNX/otLMFqZgu6we5cx2N9YrpIaKefqJjcx6uZH5sDGBDOIwt4wgyCVanZoYg3cTBE1MHmJQ5YKN+j1Vwi8m4C96ajsz2MInx+Sygkl6zejLTdTCHB9EBV1ANvWx3vnvQ1BSfV+P/4f3SoAP1zyng/88gNtB8QACN3u8NjFCLFTeeVfwgtyiTZib2h1fpbb5cYcPvaplNavSQ2HlrMhtXkrNLRxKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBYO4Xg7bCVuAbhNPgj8vmzhgJWbAmx8JtTystD9Nzc=;
 b=tIXfXYHq0zBPTRBxnAD5GqxIsiR9WKlq7vKaMY9l41H1tO8E3IIrTE2kGq7AMaRKxPq1JUaQcwx3G0hfrEG/cBk35zslUIL+tBM0RzkqO1K+QigQS528jRdwkF+0wq/PQeVOG/f7oy2OU3aZV1ptCgWecC2JNiwJSgG/Q8aA9j5FdhXX+0bk+SK+UHwhdy+WGblYmj0p5VPPXTd9jrmM71QDdTcCmsgkXCmOxXZedxcsS9Rfxj0aR2S1B7ZDGTolGLlG+x0wZmifNJtR32BhwfHf8Q4KABDcnU5pyDAM+BmOF7t8UzZ4dilGco3Z5hi27DhfbD8Ep6L9UZt5Ua6qjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7da3506c-dc2a-aa50-2bac-2985d2b9e66e@suse.com>
Date: Thu, 11 Aug 2022 12:59:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220811101715.3947873-1-ross.lagerwall@citrix.com>
 <7ff6d006-0a6d-60e9-ebb7-70ad3c6d6a5b@citrix.com>
 <PH0PR03MB63827F5CFCCB8277405FD70BF0649@PH0PR03MB6382.namprd03.prod.outlook.com>
 <e848e6a7-2c8e-d0d3-6aa8-24d9d78ae491@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e848e6a7-2c8e-d0d3-6aa8-24d9d78ae491@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 309941d8-3b4b-4e00-ba8b-08da7b8893e3
X-MS-TrafficTypeDiagnostic: AM6PR04MB6744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LTcBAqgui97qSlpBSGuMMwKajRDb/cngx3aRvSi3fdJNZYzouAesqJ+BtJQxMp3h0FeIYwJOUVfXsiH7QGzADqkqeUtNuTL9ZnnebdOrKAKZgRjd7jlPvqj8Cu7JwJuawpojVHpFZjdBqhaz3CHDmbhetFhwaUgvKL4zMzpvRtrpCfwZ/nSj93SlJF4tM5HwGK6meTvXy+rDYOBPqE9/T4TA+3nqA2L7Gg6+Cxq4JvmA6q6VnZyGmoV234VftjbOUhG7OtAbaJt9duatSh7c6kRn7JCf4Ctu6MSRpjm5QuEWQ5v9olQEYdaW4uj6mdJMrjLUwu8fvFCEzPx8Kz66eZJ7y35bbrUHErZZPj/fb/V5Wa9LTJ9YjQG49uAvTljUqisTO6J2Nss0tQUo+8+vwnVbeib51jtAhOgGDuBDcGL9sVwhs/g4swtXc3JsG5AJ8u0vcVy2VbbNQ+J/+/PAxGmmmbkUT5f9cDLMaK/RvTfeZVetf4tb+41cH1UiuqnxLSsaVEw1B3aNewx8qBd/f7v56W8zCxkSQaaB3GUjsQCBhMruf2hOvkMKlt/bqwiLpOxPHM/quj+dMhFqPlXyN0pSS3INGXkOxV/qHt/kH7Y4FF743XXoyGpE8rUFTBZiESWPwy/rpG9JNOWAbak9/B5/PEmYo0z8ZfOxKumplIXD1yUEwSFtYuBm3+AyVdSxQPfEuAMeSY+D0NPyrml8Y/Fyugeoa1TY8AIuURGr+NcxgucC9M3WQn3X0xVwBw/NNuYDRJsWOfReYnZIL76sage+hNpRTvnpgKO5f+9+MPNna8jwWSeNzWWht/hPpp9rs4ZMIViLnR+BAf9et/2HfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(366004)(396003)(136003)(110136005)(54906003)(316002)(478600001)(6486002)(41300700001)(2906002)(4326008)(66476007)(66556008)(66946007)(8676002)(5660300002)(8936002)(38100700002)(31686004)(36756003)(31696002)(86362001)(186003)(2616005)(53546011)(6506007)(26005)(6512007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmNKRTFETmwzWTgvT29rSytqVVQwZ3lxSlZVNnIrNGhvVEtpMGJET0x0cTNC?=
 =?utf-8?B?ekUxVnJDelJjcVVnbHo3Q3Y4ZVp6clVuMFFrZWo3OThXMS82cnNxcjdQN0tJ?=
 =?utf-8?B?MTZqYjBpeEhIOGp3U2FlTEptdVY1RDRkNVNvSFNLa1laSVNsWjFuVVJ3dVRn?=
 =?utf-8?B?YzZINFczeTE5ZTlzYlgxdWV3LzlHdTB2M3YwOGFzYVJwQmhTK3NhdmNad3Vl?=
 =?utf-8?B?dVl1bytGRDdOWktpYTl2T1hmcitCeGtLZW1qbHVBZHloUHdMVmRmeGI3RHdt?=
 =?utf-8?B?ekRwY2N3YlVGLzlJNEF1WnQxVjdvOHVjeHMvUWk4dnNsbFRxRGNhRWdISFdN?=
 =?utf-8?B?emt5RVg1K2hiZDdkK3VHYURBZ2xOOTIwUCtJemk1bkpqSDNCYnhpWWJmS1JB?=
 =?utf-8?B?eWNqV0RiNkN4SmJaalhub1NjOUlPZzB1eWJxbDRRc3BQVzVWRTlvdmlqa0gy?=
 =?utf-8?B?Vi9LUmFVSVdvZUNSd2lNN2pPZEpKM2I5NGxBTkhUbUNaTGxYR2pmeldGZU9F?=
 =?utf-8?B?ZlpEc1hrNDROaFplOGtlQ1FJWTYxZDFranRxZ3g4WkhjOThQeTllUVhtWDlB?=
 =?utf-8?B?UVVXczdCN1RnNzU1WG9ZUkJzaVZpNGJwclpHQnhFZ2l5b204ZHJld2R2WkdM?=
 =?utf-8?B?SkZUUVVrNGo4RitNZndLamczSUJXYUVPSVRQdEJIai9yWDh0aWpRY2dEVjR5?=
 =?utf-8?B?Q095RndGNU92NUw1b3MrS2xoZVFnVjdZT3ZEYkhFMWNjRFZTSU1ld1pYRHlT?=
 =?utf-8?B?dnZaTXB6ZEFKbndNVmFVd0FWMStLdE9rK0lVMmcwek9rc2N3SUZHZE8zejZp?=
 =?utf-8?B?UFNTSzlNYnA4RmlUSWdmendlS2l6aTlrd1BYbGp6c2pHVWpLdDRZYzhEZ0gv?=
 =?utf-8?B?MkxpUksyWHNRRlBpYjBjU1RYYUdpMExaUGJPZzJLMjM2Tk1VQUUzdHJvZkg0?=
 =?utf-8?B?VEo0dVF5OTV4NmxUOHJXelVVQ3dpcEEwaE4wOHU2cWdGdXdLT3BoRUxmRk1i?=
 =?utf-8?B?Yzh6bGJ0UFhsQk1RcnRsODhrelYyZVkrdTBlVXMwU3ZmVWtUR3g0U3JveFlM?=
 =?utf-8?B?SEJZbHpNeXNYaC9oSU5sdElLbVZ4OVZ2dS9YdHZiVzQ5RDh0LzNtb3BaeElH?=
 =?utf-8?B?dklZWkVoVlltVmtDWTAveVNYZG92QkZ6UFBORGZsT3BLSVhhdklaMFdNWjJj?=
 =?utf-8?B?S1NMM3JESmc2dVh6dFU1YmJvZzlPVjB2QzlNajNGVG5iWk9hSm5rY0xCVk5G?=
 =?utf-8?B?U1JCZ0xOS2FzQU1sRFZDdjdFNkI1WkhqN3RBUGdZWDdXeWlDU01JcURtb21k?=
 =?utf-8?B?UHNCbFVJQk94S2F4ZDVheVMvVm9ROTA0NTBtYXdCczBvVVU0b1FwOHBoaE1z?=
 =?utf-8?B?dTkyaC8xVzN3NkVTaWlpNWhEVUliNFBtK3NCZ2tSbUlacVp4ZjRLQ2lEOFlV?=
 =?utf-8?B?UU1uSVVhMXhJUmNGWG1Qb1UvUEJCUFlreHcwL2hsY1hlL0xycDRFbVpGdm4x?=
 =?utf-8?B?USsxVXRGckF3aWIyaDh0QUI5L0tNcmdkRkJPckw3SzlpV2loaE9USVhyTjBC?=
 =?utf-8?B?WC8waFFpcWZYUTNnMjZZNFdaeUs1Ui9RWXBqWCtCK0x5cmNyaCtrOXBBNFAw?=
 =?utf-8?B?WjdhM1l4Qm5uNUwwTVJRbFd5NDdoTHBybmllaW1yVjZ1Yk85b2cvUzRJWkkv?=
 =?utf-8?B?RDRUWWVUV1ZkcXJHT3d2OWtaWXBnNGpnemZpVFFtL01IL0JEV2lGS2ExVTdK?=
 =?utf-8?B?VkVpemF5UFpvUUJ5Vm5sQnVSVTdJV1FqYUxnN1VSWERWckR2azR4T294djEz?=
 =?utf-8?B?d1lYMHlXQ3AwNkVVVXNXWUlwVHo3REphdStBNUtqYWlaaVErRmFpSXpEL1pl?=
 =?utf-8?B?VFM1UFhET21WV21QVVp0Wi9oZ1MyNVA0ZWpPb3krcXRvc3JiZi9ZS2N3amZN?=
 =?utf-8?B?YjBCUG9EcnR6RTVpOG5ubklHSkRHVTEyd1B0UTJBZjYyUUdIZnY0WmhobVlJ?=
 =?utf-8?B?SGhNSTVGSEEvbmlOaTNXNWc2V1FLZUFHWHYrVEcrMXlLSE9yb0RmRWdjWFp6?=
 =?utf-8?B?VGRFeDNNNmd4cnZIYzhneUloZ01wcDlmR1lXbjI5RmVQVW8zNWdGcEF3VTZJ?=
 =?utf-8?Q?6BN7HSmcG3yhMCz+8tpKFt/Pw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309941d8-3b4b-4e00-ba8b-08da7b8893e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:59:35.4540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1eA9fsjom8VePgRVLMxo4YqcnERASlsAby3+Cny8JrGJv5a30CF8p6N5YT3fa1hQWdU5JTSmwgdrANm/wGlNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6744

On 11.08.2022 12:34, Andrew Cooper wrote:
> On 11/08/2022 11:30, Ross Lagerwall wrote:
>>> From: Andrew Cooper <Andrew.Cooper3@citrix.com>
>>> Sent: Thursday, August 11, 2022 11:21 AM
>>> To: Ross Lagerwall <ross.lagerwall@citrix.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
>>> Cc: Jan Beulich <jbeulich@suse.com>; Roger Pau Monne <roger.pau@citrix.com>; Wei Liu <wl@xen.org>
>>> Subject: Re: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions 
>>>  
>>> On 11/08/2022 11:17, Ross Lagerwall wrote:
>>>> These functions may be called by init_amd() after the _init functions
>>>> have been purged during CPU hotplug or PV shim boot so drop the _init.
>>>>
>>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> Hmm.  That's a bug in init_amd() I'd say.  These really shouldn't be
>>> used after __init.
>>>
>>> Which path exploded specifically?
>> The stack trace was:
>>
>> setup_force_cpu_cap
>> init_amd
>> identify_cpu
>> start_secondary
>>
>> In setup_force_cpu_cap() here:
>>
>>         /*
>>          * On pre-CLFLUSHOPT AMD CPUs, CLFLUSH is weakly ordered with
>>          * everything, including reads and writes to address, and
>>          * LFENCE/SFENCE instructions.
>>          */
>>         if (!cpu_has_clflushopt)
>>                 setup_force_cpu_cap(X86_BUG_CLFLUSH_MFENCE);
>>
>> which was recently introduced by:
>>
>> commit 062868a5a8b428b85db589fa9a6d6e43969ffeb9
>> Author: Andrew Cooper <andrew.cooper3@citrix.com>
>> Date:   Thu Jun 9 14:23:07 2022 +0200
>>
>>     x86/amd: Work around CLFLUSH ordering on older parts
> 
> Bah, and that was also backported in a security fix, to everything back
> to 4.12 is broken.

4.13, but yes. Oh well.

It's actually odd that we use __set_bit() for X86_FEATURE_MFENCE_RDTSC (a
few lines up) but the more heavyweight function for X86_BUG_CLFLUSH_MFENCE.

Jan

