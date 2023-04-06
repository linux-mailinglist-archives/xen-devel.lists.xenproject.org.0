Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A126D936F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 11:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518807.805691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkMOv-00057K-Ni; Thu, 06 Apr 2023 09:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518807.805691; Thu, 06 Apr 2023 09:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkMOv-00054m-Ko; Thu, 06 Apr 2023 09:59:29 +0000
Received: by outflank-mailman (input) for mailman id 518807;
 Thu, 06 Apr 2023 09:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkMOt-00054c-SQ
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 09:59:27 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe12::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b635d1c0-d461-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 11:59:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 09:59:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 09:59:23 +0000
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
X-Inumbo-ID: b635d1c0-d461-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsuT9/OJ8GPjepXuRPCmPvTPmbs7xk68/ESIer9nl2tqQjMpJ2daWbDz7z5ODaIG5ZPfT64vwsWTvvkRs04xCAfinUDCfPEMBtDxMgFJYCRFpHEViW81Cng85Dt+kOSBpOAo5oYstxvEN4N+t2YpFj+6w3X0UxkE2Amjhxj0egHVZOPZ6KVgqwmkNTTAVH1sddwa8HecFLctoJRhuxAC8eiq+mb4JExosBEDblu0m3yoxW73UqtP6ce8XzXfCM0WtBBoESGkjUpyQ4t/7PggEiFTso5SOZDhRKLZqOui2mZCIu6VcFM0iWZLMtrl2M/LZX+r8skYlmWd0dyvqWpWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5SbSAc4iG86323+6XSRQQY0CLJ/fvoZzH2h7YjVi1I=;
 b=Z+7PiX+QUjf+kxPWOVWOgdwhN5384o8xHWKu0S2bWCvO2Unf/XdSvdX/cjeHMZ7LR/1SuU91SHzI0XZFRxHBdkfGPCYodr77hUjq94hhWd8/wnA4lTeF9KN3t3UDOj/GGNnByha4pkCH3T6djvPfRmwwBtnQZJln8n2NY8FTEibZ3UKXRtLwxkDYFNzJ0U5jF/hMAUysvzo2qrJYMVTdLkWEuG4I0l9JlQ4Y5+jnwSpCXx87CL+84I32pJ8ASRAnfJdJRw57RU6MW/3EABaCXEKLBtmsUXNB+I5HE8W4335NyYHOPesZEfQVOt8F/5paQ1td9haKqL8m3u2YwPNsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5SbSAc4iG86323+6XSRQQY0CLJ/fvoZzH2h7YjVi1I=;
 b=NYKomSGhPpA4Ayzb9KyC/uyuSHtAwivRZfBH8nRxaJvZ1Hs1NNN3I0gx+iqf3tITqjCEltb6mpXhzNF5Uo5gtaRBckj8COlNPsepD5PN28bnFB8MBjZjJHz5706qTt27+7KgeLEz1WNECh5TNyB5KIRXnHTXbVIN6nYPPPGrvzWBHpY7MGapWSUVrF6GQZWvRTdCz4TOAWtNqXpcfwTqkA6mf0MNWGZGrebJYiZqIy4Oj5KdnoB81BGksKtaqgVsH6oIM/cN8wXMLTIRbsDCf8Tp9Z/MrHMJ/AqZzPLqyEBcsRTLGKq7i7ct4CO+h7mf4ekLjHFS3HbHoHQeMV6nhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9bedb21-c081-9a00-e147-7528c28fc3f8@suse.com>
Date: Thu, 6 Apr 2023 11:59:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for MOV CR/DR
 intercepts
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230405204423.2113418-1-andrew.cooper3@citrix.com>
 <313a2a18-020c-ca76-f620-f5694a74efeb@suse.com>
 <24133c6e-3e66-7be9-41af-daa3db4fa961@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24133c6e-3e66-7be9-41af-daa3db4fa961@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f7aec9-5edb-45d3-e5ca-08db368598fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hOLGS8qHU6Z9giA7qpMTjgFCu5QmjV40t/91Mxh6KzLQXvdiEd2woJ0/FqfTmUXyAWaxAjWOr06PlO7PAn7CjjWxOhovPxeWOkg6O6+/QfuMrjuMmSqkZA80/EgpuLkjMplG/0kCoC/CauPenFPnOs014AAFcWIMuD6+2tKYt6Bo7RfJlFuDFi3WgOaK42jWcayJks0jurt08R5nPduf2ZXQAyxE2PCEuQvZUGUT353jfcuuw1YBFhyyORDL1oP2X3C8gtOrd6S4HjuspzuvD2igj3i1LpiIsV3PUgwAHNMnvekKSwUsjh37fyAZ8lR/p1lEHS5JwnTQA7/yt5JvJWOunafm50K1VjFc1wpX+bAwZ4sFOJgtTDWIkoWxgGOQs22lnKFBXsFIJ60+deYITWgk959kZZK4bvDOlyFXiRWx5nLftaa6EzJ65k4OEwJZmDbbgcp77Sr7yYeyLFAwJ1T/t8ARJ1R53UvtwU+w8Y1LDL9kVQW470D5fXeMciK4FC+bfPyp8wmeskgZerd3iXTIgru3OxwCdKH2Tv26pwHVBeGWg8QIkbfstJA5N47W+B43NL3WZYHSUMoPqWVOGeiURKB+JAOi2Ib5WlKuC/656DL5tVU1OESyeUExvDn8j3xNA7shelKcMppANCxYDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(31686004)(4326008)(36756003)(38100700002)(2906002)(5660300002)(31696002)(8936002)(66476007)(66946007)(6916009)(86362001)(66556008)(8676002)(41300700001)(6486002)(83380400001)(2616005)(6512007)(186003)(53546011)(26005)(6506007)(54906003)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2pTK1RVSFNpcXlCWkF6UWZXazNZdVNUaGJyeTFCQkhWNElEQndtWjVMWE1H?=
 =?utf-8?B?c3ZKWEYwRXltTm5VeTI2YmJyQjhHWFM1S0pzNkZQTXhXZExBQ01XU0Vmc0wv?=
 =?utf-8?B?UTNFRGpuUkRvRHhmeEYxcExFTW81aVFpbHR4SU1ScUZmN3Z0OUtxRDRsdVFJ?=
 =?utf-8?B?VjdLNDczRTZSeFg3aDZjRzNCWVd4S0t3SXFWMXVISnhDVUVaSkE0b1o0SS91?=
 =?utf-8?B?a293UkxmYjM2dXpER3NJcFgyWVMxMWI2TS9GbXIzaGd3RUFSVVJtOTl0ejZr?=
 =?utf-8?B?MldNNzZVZTJTMkUybWNTRDNJcDhic21aeXVvblo1Z00xN1pkZTR4RVdKbDhX?=
 =?utf-8?B?SkVOZXZvTy9ERmgvRkhoQjRGQ2FEdWZ6T2JuQUxDaEwwWFA3TlhLQnhvaWJW?=
 =?utf-8?B?elR1ZHhQaHViTFBkUDdDU1VLNHBSZmluSkZhcWdWL05YbXFhaGg4U0Ewbmtq?=
 =?utf-8?B?Qm0ydVE1eXdtSEF2NWswTklwKzA1dXFxakhJanEydFJzQ0VlMGsxMGNWRFQy?=
 =?utf-8?B?YnJqNndNdS80enZqMUVxWFNrankvZGRkdXFlRWk0NndFTy9XT0tkbE9lSmNH?=
 =?utf-8?B?QVBYcW0xZ25VVDJ6VU5HY0t0b1BIbDJKNjBvNmxKVUNVRi94OVdBemJSNjVi?=
 =?utf-8?B?UDNQSXJEL0tiQUZtQnAzOUsxbzBIMkxxSGMxR0daRjlGN1djUVpWYjJ5MzJT?=
 =?utf-8?B?ZUxCWDVzdVBZdmhFNHVpOXVza3lHU0tmREdPWDlqVWtkNEdBMFcybGJ2KzJq?=
 =?utf-8?B?b2NidWl2Vkw3aVhtY1Y5TFdaY2NCNGtCa3RsQWRqYko0eWZBQzdYUEsvcTll?=
 =?utf-8?B?R0lwbjdveEExZjZyNFo0Z3NmbVROemp2YUtUbXpPb2gzRzFkdnpvUHhpRmI0?=
 =?utf-8?B?Y1FLb1IvbkorVkhnQXZ4OGQ3QnRJU3FmeG1lcXdIOUxtQjYvNXp0S2J4ZEc2?=
 =?utf-8?B?cGZxWkcrbytMdHBGbDQvTWtLOFcrV0Q5dVQzUXltQWlPZm03Z1huekx0VWps?=
 =?utf-8?B?Y2hyNW1MV1h0QVNkNVFIZGsxOUljNTJESU1KM2ZZeXAxcFpsMFRBT0hxd1J0?=
 =?utf-8?B?WEcraVRIc2thM3owS3Q5MVlicUV5dmZNUy9KWTdPUlJVWThGQkpEdXAvcmEy?=
 =?utf-8?B?RDJFdnU1QlpwclR4azAwVzdIZmF5aFlPRjUyKzNrT3RGbklVZFMyUmc2YTdj?=
 =?utf-8?B?cUtsNHhOU1dvWkp6ZFo4VWZLTytvZWQxeDQvVmJDVmV6SThNOTU4UjJzcnFV?=
 =?utf-8?B?bTZRSnB1T3FpcU5xOG9iWDE5UCtteDZ0V2NCSjEwaFZZY3dlYWdobkptWnpi?=
 =?utf-8?B?eXVoSER5N1BQL05ITWZsR0Y2Szdra21TU25TdTlaMU5aazdicWp6bGdibmFO?=
 =?utf-8?B?bFF0Q3EvYWV6d1ZnYmI4VUZxRXoxMUdsdmJoSEdrQmVITzkvWWdtVHgyVjRI?=
 =?utf-8?B?SEhJRElPOEJCNlBpTHJOdXIyeCs2dVNmMXVjdVR4SS9oc3FqZEJVcXUrcjkx?=
 =?utf-8?B?NVA0SHQwc3lPQnMyNnNIcURhbEk1NzF1cFpvTTJEMVhvWGM4NFk3bDhFOHlC?=
 =?utf-8?B?MmhqNWlwamhSOHBESWd2dGl6WjNDV0d4SHFwa3VzaTZTSExRcUg5RVVJOE1v?=
 =?utf-8?B?WGpEK0VQbk56bjA0YzhUanlTVFhJbUE0dHZPeVdZUlJNZ2hNZ0hZU1RoMStk?=
 =?utf-8?B?NndpeWtSMEpPTmgvbEtUMTV4b0l4djc1WHJJZUFlM251SkgwbExNSFFBMnNt?=
 =?utf-8?B?aHlLYUxEd3ROaXVxenNiaWtzL1lmRE5WS1dLV1V6dFdvR0pLeXk3NmpmamJu?=
 =?utf-8?B?NW9yWExyY1VqSlQwOXppcllkdUFQV1pETHY5NXpIY21RYjlOUXoyVWR6czl6?=
 =?utf-8?B?bGtxeEFIclowaTIrbE9TYlIrZ0VLSmh4b0swc0wyeVRIekplbFk5ZXNPQTdK?=
 =?utf-8?B?ZzEwaW1CR0ZHaTU1OEZQNEpyZFVTR0NQZFVaK013SVdmcktlQk13d00zb3BR?=
 =?utf-8?B?M0tSY2d1c1lweC84MVloc1NTYXZCUTBJMHE2S0pYcEZ0d3dpQWhhWndWVnlT?=
 =?utf-8?B?T1VkSWFscG9WK0t0UU5MWXpNelgvdGhVOURkRGVBbFJyVGVFNmdtRWExUitP?=
 =?utf-8?Q?sWuYeRy2BD/nR/oEk5EjinpgX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f7aec9-5edb-45d3-e5ca-08db368598fa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:59:23.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E2aTZy9ZUWeMG/mW12zpYyEJT4jAfAAwEiUuv1eYt+m1Uqelzz1jVe9is1K15+vbkDQHQqgz2fjTGt0+pI1GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

On 06.04.2023 11:52, Andrew Cooper wrote:
> On 06/04/2023 10:31 am, Jan Beulich wrote:
>> On 05.04.2023 22:44, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>> @@ -450,6 +450,11 @@ struct vmcb_struct {
>>>  
>>>                  uint64_t nrip;
>>>              } io;
>>> +            struct {
>>> +                uint64_t gpr:4;
>>> +                uint64_t :59;
>>> +                bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
>>> +            } mov;
>> The field being named just "mov" makes it apparently applicable to DRn
>> moves, too (and the title supports this), yet the top bit doesn't have
>> this meaning there. So perhaps say "MOV-CR" (or alike) in the comment?
> 
> Hmm - I'd not spotted that distinction.
> 
> Xen never decodes the exitinfo for a DR access - we just resync dr
> state, drop the intercept and reenter the guest.
> 
> Therefore I think it would be better to rename "mov" to "mov_cr" so you
> can't use the mov_insn field in a context that plausibly looks like a dr
> access.
> 
> Thoughts?

That was my other thought; it merely seemed to me that updating the comment
would allow future (if ever) use with MOV-DR. So yes, if you prefer going
that route: Fine with me.

Jan

