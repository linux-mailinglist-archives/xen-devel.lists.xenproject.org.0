Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F4E6806C1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 08:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486602.753990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMP0H-0005Dq-Mc; Mon, 30 Jan 2023 07:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486602.753990; Mon, 30 Jan 2023 07:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMP0H-0005BG-Hw; Mon, 30 Jan 2023 07:55:01 +0000
Received: by outflank-mailman (input) for mailman id 486602;
 Mon, 30 Jan 2023 07:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMP0H-0005BA-0i
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 07:55:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 650bb10f-a073-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 08:54:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7515.eurprd04.prod.outlook.com (2603:10a6:10:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 07:54:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 07:54:57 +0000
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
X-Inumbo-ID: 650bb10f-a073-11ed-9ec0-891035b88211
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHsFFlhDdMRn3X6PGRbwSzbpZ8UipnXkO/tEZygs/9mj1Q+jiP7jK9dnU53wWFmabWgXN6Gr7BIulvD2Mgg642our1sgPC0fxeiDju/dhTmZlUUR+o9YHCrYBo2W1DF4EVjOLOY4THrOVmpoGpeLahCTE0TaXH0X2mtw+nrrzEyHdewYeYnI3dFJjMquDT9hdlSzLc3QKMjCOPP6H7Bl2xmJSIoBOb5R8i/8d5sFJrXiXTQ6QACCx5Yqk78EWo/VAvP72bPdAla4wqDEzhCQaArY9oaX5+8kwUpTwU5r2QeNIeI5GYpx/uvtEjTGw/7sG2tccanyiMd32WLPeNzyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70Pn2yCF/cP1GLXj0LcZAFzxe+BNAry5w/bcKzqRRdc=;
 b=mAlVgoNXxn9apmtISjg4kj/vFVSs1LTKFoobx5fJnWEbgn+7MZk5remKdlNkhOD8mLVhpiUY6NmCX/sXlvEHJCYONEeRKkM015cst3zMLfAM3tid2BRiBnYmmtq2oSsjBdCrQBxD7WiyKid5Cqjfm6GpsrHXaTIMYs6KD+lqIJOw+4917sU+SLg9cD4putl9iYUm/8ss26dN2ky/HtPY4gmGm4zXt3Wjtv097B2NZJNiMMgEsu8fs3jhja5Foj+OHSPFFuQYgOKpK+cc6rV+lerbunm+xXSWzs+rf3ndZWeoEoc6iQW47maDzigJcz0g4QDqrJU2oAbnEKNBJPPfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70Pn2yCF/cP1GLXj0LcZAFzxe+BNAry5w/bcKzqRRdc=;
 b=GHdHVhUu3kDYuAMYmrtP7Ko5aqwT38dt2e2GQya5WK8dGHaSeBibMFyDCMg2lrRHoUtb+w1ZKGnVPl0z8wSmJCqgRwHDr8Ze+vDYx1mQoj17mlj0MXJ4kul9zJULI4IhktazNpXu2VOYQkhErfCbiGVZxhKphxTU21fcPWWCVcy8h4SnHHBuIoo0MfXnMlvaZTLDpEtYgB/Z1R6YYZQXRZ1B6NacHQZqFw25e51fP+gIw4euksbrJDTEn+9OFwpoz5n3l2BuoSxltV9iQ/l7DwJnqfp6Wpm+6IS38HwaJZI+++jgAphWxO7b8QaLcUho3UW84Ik4wK+oZbGsLbcSAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e48fcc4a-4ad8-d478-1e05-1528bdb35a5f@suse.com>
Date: Mon, 30 Jan 2023 08:54:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/public: move xenstore related doc into 9pfs.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230130063725.22846-1-jgross@suse.com>
 <03cfb3a9-66f7-c376-c815-feba34afaf51@suse.com>
 <962bd261-74cc-e78d-be54-182e4b9457d8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <962bd261-74cc-e78d-be54-182e4b9457d8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 0360371d-98d5-4b4e-0e5b-08db029747cd
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JrLSJvbmMFbqepz2Hn5Yv2FbigaGWW5pzNqy63z1t5GCtHeyrCTw/AZc0m1xIwrQ9m67+TkqOmuv89qRQTNA77iK6zW7o5IaA/6IrNfw7dtd8EIGJnXMtKCZRpOQo7dc5urfg78b/T+oURFh7iUSFLz1BRMysN5887z9Xb3UsFK2cYO/IwWUigTLL2Hk4e8/LQF9bSjrY3C0OY/kSrR4YdtiWNr0gq7lGNBoPftK8OuV1jHnRbzDy9prNIGX8aGwNCb7mw+YSLTYTTnM5PKFfIsMPC4x6/l9F6yAKxvYaeWZ5wITcJPvED9tMkDyqS+ooZUyOpDJmA9m+h/bG1lmoP+rBmuU/Y/JC4iSFWz/iScNkw6ckspd1OhjagIJLPSw1MBjZzsx8E2lhpso9FLl1j+YiILZ0aDHEc86rrGoTdoPNHWFOPwDgJajA1QtpulpE4lhtmBb+DbqyDYB32GHr8IBrkOvjqyFbGJjbIJ073VxLAR+1jHWUOF8XVRBnCH4rhsp4I1RURVw9mLmygvoP2JLuc/xyKJ7S2r72z7kl4M91+mAZuP6vqSr1Yb2YZDHyCbkQMkK9fyJ0TZ57DIyVO6EuVsGH9hRhy0mGpIK6+/I+ux2KDVE/b1KAAnFOkOJI9LWsrBgMuSPUxcyOdGgBGjjalBkhNQ0l5oWeFqVHdxw/B4t3AWljON407dMAW0ySrJ6XAJcUTQQ5/DGz8udofbkIqLfZpWx8wVAaXLpLoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199018)(38100700002)(86362001)(31696002)(36756003)(41300700001)(2906002)(54906003)(478600001)(6486002)(8936002)(5660300002)(316002)(66946007)(4326008)(37006003)(8676002)(2616005)(83380400001)(26005)(66556008)(6512007)(186003)(6636002)(53546011)(6506007)(6862004)(66476007)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2xJOUowbHRXa05DWEs2M3NnaGRjbk91UFpWeURxU29YamdjYmd4ODAzalFF?=
 =?utf-8?B?cTZSeFlBNVI4VFI1QVNXMU43R2JIV1V2Tk5PUWZxcDRGcDlzTGpYcHFybHpU?=
 =?utf-8?B?SkZsTzN5QlMvNnVZK0lDTEFkcVNKSThCNzlVa3JWbmhlUGJKT0NpZy9Ba1VG?=
 =?utf-8?B?TWY5dHlwenM2TXM0Y0FydUY3OC9lK0J4bURpdnRDY2grQTNpUlhZcnFMY2Zz?=
 =?utf-8?B?UjVUbGNROHVrY2l4OC96V1B3L1VDN2FpME9GN3dTY1kyWTZVUVdkNWcxVnF2?=
 =?utf-8?B?cStJZWVBbklnU1A1dnpyV1ZHMGp2TlNJTUpDSlFQZlRINWNuY1plMFFmYlg2?=
 =?utf-8?B?VTFEY1hqZVBhRlhvaXVHY28rY0Vtc0w0QkxDblZ5c3ZIREdaWHk3QU92TDVP?=
 =?utf-8?B?dElNeG4zTTNOTEpHZWlXdHJGYThRNHA3bDBBUUMrT1hwNitoQ0Jzam9kM0Uv?=
 =?utf-8?B?MGhzdGhIQjFHNVpuS016T2s0NzlDZmtqeGRNejg4c2ZJY1FYSW56dnVGVVY1?=
 =?utf-8?B?VEtlcHBtdTJXSllON3ZvaTlack1idWViQm5RZTdTVWFRS2crOUkxS2lUTVRK?=
 =?utf-8?B?ZG52Y2hqQ3NLd0FudDFyUzlVT2JlU0Z3aStuS0lxMlZodUhuUFArVGNPaDNv?=
 =?utf-8?B?VnlCem5zcUhMdmJNalNBZjVoNHRDU200RnpDYlRFVnArRm00b20rNVNMaC84?=
 =?utf-8?B?SnM5N3Q4ZXBvRnM4aWNjQy9PeDVUU2VjemgrZkhjOHptY1FvRlJ2andmeXJo?=
 =?utf-8?B?ZjlZajFWTW9wdXU5MVBQS3g0U05pa0EvVEh5YzR4VFM5ZTFQa1RtWWF0MkpH?=
 =?utf-8?B?RFF3ZnRlTVQ4MFNKZm1rY3J4bmhqMjFvM3RqeStNOXBZRG1LcUcrc0ZvT0pE?=
 =?utf-8?B?YmtIekFXZmZNZ1c1TVorZVQyR3BoRVl4Q1lkajRsM3lVelFmSzQ4TGtQZkJY?=
 =?utf-8?B?ZmdCdHRERzF3YU9XVHlNREhXQWV4L3BlQkxwcDVmTFdNNEhoUk5pYitSN3JH?=
 =?utf-8?B?dm5VUWk4cXlHdU85WHhUOW9TWExURE9hcERFU0MybzkxK1lPS1pHV1Zaem1q?=
 =?utf-8?B?dWhha1RmQUR0M1JlWU1rZ2I3bXo4ZnZMUFQxRVQ0QVRTSFNRNWN5VCthZ1hC?=
 =?utf-8?B?Y3BKeW9qNHNId2VqUlYrbWUzL0l1b0haeXhYbHkxdEFXdFJTSUQ5Z2RJdWcw?=
 =?utf-8?B?VmcrcEViQ0VmbUVHQnMrWnY2aEtaeHZnSDF2ODVRT2tjRzNjbXdEemxBQ0tY?=
 =?utf-8?B?TUY1QU0wc0hyTVY4clE1ckw3UXE5QmgxVFFwNjk4Q3FidHdnYXM1TW9yMG4x?=
 =?utf-8?B?ek5PbVBHY3ZlUWtoYXVtRGEycko3K09JTXBOOGlQQVRwZm8remxlek9SOFUy?=
 =?utf-8?B?RmV2bFAxTXIrdWJEUmVlYmxURnZFbHZkNjA3Q2U0OCtZNyt6dXlVeGdzUG5P?=
 =?utf-8?B?aU8xSi9sOXBsVC9pOHlrL0VBZ2tWMWZvZld2Y0NOUE5iVUdpQXZEWlBock8r?=
 =?utf-8?B?cWZpaWF2d3hKVUVrcHh6WXZtVDVzZTJFTGsrMXhiRDd2WUV3QmVCKzNLRjhk?=
 =?utf-8?B?VXNNQWdSTXJJUzh6dkMzVVdKUDlRYmFTL1M4SGFKZHdQdmpockNySU55Q0hw?=
 =?utf-8?B?cStrWCsrVWNpdmlBbVpSTThaQ3J2YmRQUENSTVZaV21raWxWbE1NYi9Odjhp?=
 =?utf-8?B?MldLdEgrSWVRakUvenN6L0dKYk1yT1lGZXdpKzk3a2hScWNKeUxiN01ub2dQ?=
 =?utf-8?B?SnpTR09OcmhOQnpwM3gyc25OT1pPa1JKRVF2ZFU1cmMwZGdsa2NnNHJHZjVn?=
 =?utf-8?B?NXcxT1F6TldnQUl5alRUYW4weVZvZmo5cFAxRkN3N2g3YWNZUVFqTTFSdkhW?=
 =?utf-8?B?bndHUTg4WXBGTENzQnVhdkJEM3llVmIrb1E3dGVTcy9mb0hpUFdWNEk0RmFJ?=
 =?utf-8?B?ZTlUcEtsVlFqeHJ2TkE5QmhoUzRXdWM0eXVFdmc5d25PZjA2bWZBaFNLTEMy?=
 =?utf-8?B?YWE1RFAxamxUV0xmUnB2SVVHYjVUcGpHZ1RWMmtZN2E4WTZuM3RPRmdRSUVz?=
 =?utf-8?B?a21pbmt3SlM3OFJzVlFnUXcvQ2JJbjR0MGQ4RXVoZDRkYjdHVXgxMWo3VzN1?=
 =?utf-8?Q?49elXegskVnmBZRBZH4fFrTl1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0360371d-98d5-4b4e-0e5b-08db029747cd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 07:54:57.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBw3MWt2iCdbScHvKfdWhwJnDcWX9LOjjt73U4VOyuti982NiGXobm1moS6qQkQw7bazBG3bIryGqWlW7n6flw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7515

On 30.01.2023 08:46, Juergen Gross wrote:
> On 30.01.23 08:36, Jan Beulich wrote:
>> On 30.01.2023 07:37, Juergen Gross wrote:
>>> The Xenstore related documentation is currently to be found in
>>> docs/misc/9pfs.pandoc, instead of the related header file
>>> xen/include/public/io/9pfs.h like for most other paravirtualized
>>> device protocols.
>>>
>>> There is a comment in the header pointing at the document, but the
>>> given file name is wrong. Additionally such headers are meant to be
>>> copied into consuming projects (Linux kernel, qemu, etc.), so pointing
>>> at a doc file in the Xen git repository isn't really helpful for the
>>> consumers of the header.
>>>
>>> This situation is far from ideal, which is already being proved by the
>>> fact that neither qemu nor the Linux kernel are implementing the
>>> device attach/detach protocol correctly. Additionally the documented
>>> Xenstore entries are not matching the reality, as the "tag" Xenstore
>>> entry is on the frontend side, not on the backend one.
>>>
>>> Change that by moving the Xenstore related 9pfs documentation from
>>> docs/misc/9pfs.pandoc into xen/include/public/io/9pfs.h while fixing
>>> the wrong Xenstore entry detail.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   docs/misc/9pfs.pandoc        | 151 --------------------------------
>>>   xen/include/public/io/9pfs.h | 165 ++++++++++++++++++++++++++++++++++-
>>>   2 files changed, 164 insertions(+), 152 deletions(-)
>>>
>>> diff --git a/docs/misc/9pfs.pandoc b/docs/misc/9pfs.pandoc
>>> index b034fb5fa6..00f6817a01 100644
>>> --- a/docs/misc/9pfs.pandoc
>>> +++ b/docs/misc/9pfs.pandoc
>>> @@ -59,157 +59,6 @@ This document does not cover the 9pfs client/server design or
>>>   implementation, only the transport for it.
>>>   
>>>   
>>> -## Xenstore
>>
>> Maybe leave a reference here now pointing at the public header?
> 
> Okay, Would you be fine with:
> 
>    ## Configuration
> 
>    The frontend and backend are configured via Xenstore. Have a look at
>    [header] for the detailed Xenstore entries and the connection protocol.

Sure. (Personally I'd use "See [header] ...", but as so often a native speaker
might actually point out that one wouldn't word it like this.)

Jan

