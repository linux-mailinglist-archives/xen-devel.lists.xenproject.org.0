Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAC67D38FD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621491.967989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvd8-0003vQ-4x; Mon, 23 Oct 2023 14:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621491.967989; Mon, 23 Oct 2023 14:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvd8-0003uW-25; Mon, 23 Oct 2023 14:10:06 +0000
Received: by outflank-mailman (input) for mailman id 621491;
 Mon, 23 Oct 2023 14:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvd6-0003dv-Ci
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:10:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbfd1666-71ad-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 16:10:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7049.eurprd04.prod.outlook.com (2603:10a6:10:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 14:10:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:10:01 +0000
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
X-Inumbo-ID: dbfd1666-71ad-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHm1c3nk0JkQ5UdWJ0BiqhRbcaUTOUYideiDTjoJ8bUBflITEmSNOvMuSk4p2PUc5F3KiEVgDDSyCJeQvq9LZZ29m8hKgk2+gbHdo77ZmwGylq6Q9fk8hpYq/KC9QvA0+eRcR28ksT8hveoDYnYMPJSF9Hs9B9UinraDMUgV4iwlc/hU3YlmvvQ3GVHTpxZ6SIeAoiGajcbc4yYe1JFQEQZQKI1baN/Y/t1q+SLFiL9WixmMsuCePG56nelTTeGV1a386Y9mm0XthRz9AWl2NoAv0zFLgghIQjJ+0nddTq8sDtN05V60b20XbUMXI9vAj+QUXtwshKXGNUm0VIS68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5LI3x2WEvbKEUrvYpwQ9OOcUIwm2RIVCjlxQutqqaI=;
 b=Nh/NwIofOrW2URv0uBYfdKXe+2QZ0t5pnzs3GKiSqxSt+r+GjgO94qicr7Jvo3qx0U2ZW3e1pzCzpmcvXOi4CXtjWPzEyFdCzaoarMKrMiKgv34TsCTww1ucrtLkCg3kDPGzmFTENNyGATIiObruGJzti/3NOLJdPvOfYKxVnexBe3SgN3nLXhrxUXyM4hFW8D1Mdf2+keewc21Ph0P7XYjf3CNhMeqj0hwGj2hZEyxuWGn1KWFkp3ImGUe86SP5Lds5zvoAybhbuVQqweRY+vf9vkgKwyj0wvdyklK5NrMe6Ew3qL8OTqV4Da4dsb1a+qDiXVABezx7XG6UFmv7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5LI3x2WEvbKEUrvYpwQ9OOcUIwm2RIVCjlxQutqqaI=;
 b=FcAUjvQjTTN8WY+60j232Ys9yc6/T5RtIBcRRW+Y9x0NbOjdviAfv2sjU0Aw7pcOcCnOer5nX+PA8qWJNSKbPaMqr1/xhp5wwKDoXNGcOlM15y46H9Hk8sgt5bjtdcNooGZQuO77Y05KxvJUh9CN7kF9oyJP7nnNyBvUl14HjMVNoR5W1mOd2AKQMSCHsffeeVWkbCYGBcCui+puWzY3bKMTknkbqPz8HfDU1VTz3wrflPG3w5xkYNJ4ySZMj28PiOunAmQoa4UZKbzuqhyzC6JxtyZ1I9mNAdjQpEl3svzMgR4i80OcyHTgkf3zHDT4W0dlHdfnmYGrem53ohkQlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b3f5e7c-ab84-5f45-ad7e-bafd70563b52@suse.com>
Date: Mon, 23 Oct 2023 16:09:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com>
 <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com>
 <7b28331d-b1d6-4c6b-b299-34de9ba65e0d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7b28331d-b1d6-4c6b-b299-34de9ba65e0d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfa3a7b-ea7f-420c-c8a5-08dbd3d1bf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xXrMJvuhouptIBXOoRkzE+Yo1Iugwuge+tbIIQ2VwwWmVEW4fb1TOnW0kftY7Os7hApOI1XAhw7nRrR7Lhy8cEuBmgub2b33GzkLXASGpRrAaGe0qivgTv2xADxoTxPEjrhm5qV2B1yzDFPCkGmr9+69mpdbg8LsHKeGp4HC3TXIqvGT4eFPTvCpTzImAvtRSyHzrbU9kMB3p9n42RaVXD0Km9wwUKcBiF/lnxcsVyG3qKfGmsU6sHX+HGxxV+CeHE5AoWEqFVJPypd+bgcMPMOWHCBvyoqVEwKyCovhQEs9WPjx2hdXAQr8E99aCrmfiUsfObYjNf6KFtzV00x1UQxrhxUDu/84lqXQbwrWqIFD4cNmEM7Z5V61ntvyLxYEbiLiVOR1LvbOJRYL8AZAK7nBy/PZXfanWjdwiz6udJtGW3sIJz5La1VSrxXPN2LJeCE2iqz6PkoaUjmtubFftvXyiZoO1n4/VLLCmIZ6KIrpktTWJ5Rb6LbiicAqDgwnkP7/LNSJRl6WxQjGALZDV9XlkQihIoujn60rvU+3SJsUhwZeG7KjIMhgv8yYOn8y2ZzsqP2kQcHnAZ0yBk6E8Cbx87U6JZjC8m0wypopWghOypFRWX7sZ3wfn6+QB7d293cXDW9vma9WwwCIs1KYMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(38100700002)(41300700001)(54906003)(66946007)(316002)(66556008)(66476007)(6506007)(2616005)(110136005)(478600001)(6512007)(6486002)(53546011)(83380400001)(36756003)(31696002)(86362001)(5660300002)(4326008)(8936002)(8676002)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnNibDhyQSs4S0c4RDNXVGl4Q3FVQTJidmE3NmFHZzZjSVVwUFk0TE5CeG1K?=
 =?utf-8?B?T2RWejRodG9wMFNHZEVSTzNsWnJTOVBKVk84VVRpVllxVWdsSUtjZVlYVHJp?=
 =?utf-8?B?SUlSQzZWQldJOGIxZnRxc3JqUXc1NlYvMzBFTHEyTDdiMk1iZzJ4NlhlYkxV?=
 =?utf-8?B?VmdGZDZDL2VXa2FaQTZqZnQ3RFltSEltMUhjeGE0RnpyTHY2M3U2REFpTjNC?=
 =?utf-8?B?U2NtQUxIdEF6ZWJ6aUFjQUdxbjVrZFNBK1Z1bEJzL3U3SWt6MlBzUXNaLzdo?=
 =?utf-8?B?TitsMkR6UWNnUG9IV2IwRFdBZTFDaE1laVJkNzAwUm12VXBpVDBkTkxpbW9i?=
 =?utf-8?B?ZnhYMnlEZkJKV2tmelR6cXRGTXVhdFV3Z2lzL2xaSUViVmNPMWdIUTRQaitT?=
 =?utf-8?B?Q3hxRVJiRXhqZU1uWnRIWVBFcEFjdkhVUEZ2c1dLYWpIYUZJOHFzSTZua0NG?=
 =?utf-8?B?UHlxNmcvSjJ6MnR2RkFhZjRhWmY3YXVIQXZqSDMxK2ZnaWR6R3ZyUFJWS3Z3?=
 =?utf-8?B?SzVSa2s2akZiWmJ5SGtnL1RCQnJIWnJ6c1FveGFGc01pQTc4ZU9ZbkJlcWRp?=
 =?utf-8?B?eFhzQWVhbzlETE1xdHRybGZxeGdVdlNHNmR6RFV6MHlhLzlmb2lremIwb0hR?=
 =?utf-8?B?bkhiMTdmdjBmTHpYNHFGU3V2dytKU1VjOGlPUFJNS092ZEN3bzFOVllUNk9H?=
 =?utf-8?B?YWlnelI4RDhGWXdNUCsrRG5uSmpET0VBL05zdGV2dlJCWVdreWtWR0ZKR0JS?=
 =?utf-8?B?cXZ5SXQwOGwrRzM2SWo1K0s4RzV6amhUcHArd3BzemZyc21BRGcxbVc0eHM4?=
 =?utf-8?B?VzhmbDFaZUs4SlJHUnpwRTlac0pJbC96THdQMXVpdTRxTk9yRU5zbTBuMHE0?=
 =?utf-8?B?UExuZHZYRkxEQ1FqT3loeHJvSWVqVWw0VXhYU2cvOW5hL1d2cjVQemtXWkVH?=
 =?utf-8?B?ck1YUE1JdldMTHlaa2VveFc0aGdGRGJsdUhkQ2xNS0luL3NWTWF4cDZLZkNE?=
 =?utf-8?B?VGZ0Rm42eDA3ektzNUUrZUxJWjZGU3l3bmFycXJBTUx3c2F6RzVqYXBSNEo5?=
 =?utf-8?B?QllhM3g4SHFUSnIvb0tZNUgvM1dHa0VCS3crbDV4cG9VdCtRNzM3K0pXU0p1?=
 =?utf-8?B?YjNLNlFDL1o4WEJhUkZNU0MrQ3BoUkR6ck0zK0l2Y2NiWHgvZ1ZxUVZJMjJI?=
 =?utf-8?B?Tml2Z2t2RFRGakhNYmdaYVpSb1QxTVFTUWZ0a0tacEJ2eWdEQ3NHWDkrM05w?=
 =?utf-8?B?ZkRmQU1zdGd0T3o3bmd4QldUSjljMGRodU9PNG16a2RTMXRRNXRlUFNnbjJx?=
 =?utf-8?B?NldEU2t2d3ZXc1JPVitVSGdvSURpZGFyN21hWjlTcFhxZVpuS3VQWEh6Qk1o?=
 =?utf-8?B?T1pwTlBjeVFIZGthUnBJMk5BU0ZhUU52MkNSK1M0dkw3ZkxMQTNRb2lOQkZK?=
 =?utf-8?B?RFBLRnNIeHptQkpWMmQvbTMweEtsREg5VFRaSHhGVng0VmhTclZBcjUrekxX?=
 =?utf-8?B?UUoyZkZ3ME01ZTJTM3hNNWtzdDJTaXlUT0d6Y0E3TUNCTVVFTktXTllKcjRT?=
 =?utf-8?B?dzh4YlRXQjVvQlZBNEZYVzdlTVJxbWYvMnp6VS9MbDFocFY1UkVJdFp0ekZq?=
 =?utf-8?B?Mnpkd0pwdWxwYUZNdzJDRUI1WXRoanB0Q1FaU09WQU1waDd0a2twU1RPR2tw?=
 =?utf-8?B?Q1NqMEFReUFHbVdBWU8xUS9QbXFOTnYrUTU5eWwxSm8wWHJMc1psamFONnB2?=
 =?utf-8?B?NmtVbWZXUFhUSk9sNjJUZDNQNXhEOWN1ckpOQmdvTDZjb2ppOVlrTENiaHE4?=
 =?utf-8?B?UTZpdVpqNk4wN0Uzd1FCYi9IOU9TeVlPV2pQNUtCM0VSaktLalZxYmt4QmQz?=
 =?utf-8?B?MVZGcHpCcCtNL0ZyeDlucUtpZUtNUWdKZXBoUVJPRmREdnhJd3YvRlNOSVNw?=
 =?utf-8?B?dFFLUkFaNzIxclV5QTBzODQyWVFEUHNLQjVGVCtUSnJRNjZPWEovRWZ2eExt?=
 =?utf-8?B?S1BUQlkyUFM3Z2YxZ2FZSEg4czBVL0tSb1ZUT1g1MElKZ1hoVDFQTnBZRVFP?=
 =?utf-8?B?NTZqQ3h4aWRxclBHaVlKNDZoU3hXSUZKMFZoOHBSM1ZyeGdBT3dwbjROTnIr?=
 =?utf-8?Q?LdMdyMVmDXFv9Fb/6niunrg4O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfa3a7b-ea7f-420c-c8a5-08dbd3d1bf4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:10:01.5338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3drTUrreX2zYlg33tUCVVWrf1SUICOJEX4k80jLqCknu8FRjnLzIX/g379FvMExc/woDPackYYgQtkBXnNU4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7049

On 23.10.2023 15:51, Andrew Cooper wrote:
> On 23/10/2023 2:34 pm, Jan Beulich wrote:
>> On 18.10.2023 16:18, Simone Ballarin wrote:
>>> --- a/xen/include/xen/pdx.h
>>> +++ b/xen/include/xen/pdx.h
>>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
>>>   * @param pdx Page index
>>>   * @return Obtained pfn after decompressing the pdx
>>>   */
>>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
>>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
>>>  {
>>>      return (pdx & pfn_pdx_bottom_mask) |
>>>             ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
>> Taking this as an example for what I've said above: The compiler can't
>> know that the globals used by the functions won't change value. Even
>> within Xen it is only by convention that these variables are assigned
>> their values during boot, and then aren't changed anymore. Which makes
>> me wonder: Did you check carefully that around the time the variables
>> have their values established, no calls to the functions exist (which
>> might then be subject to folding)?
> 
> I was actually going to point this out, but hadn't found the words.
> 
> pdx_to_pfn() is not pure.  It violates the requirements for being
> declared pure, in a way that the compiler can see.

Hmm, I think you're remembering old wording in the doc. Nowadays it says
"However, functions declared with the pure attribute can safely read any
 nonvolatile objects, and modify the value of objects in a way that does
 not affect their return value or the observable state of the program."

To me this reads as if reads of globals are okay, constrained by the
generally single-threaded view a compiler takes.

Irrespective I agree that without said further checking (and perhaps
even some way of making sure the requirements can't be violated by
future changes), ...

> Right now, this will cause GCC to ignore the attribute, but who's to say
> that future GCCs don't start emitting a diagnostic (in which case we'd
> have to delete them to make them compile), or start honouring them (at
> which point this logic will start to malfunction around the boot time
> modification to the masks).
> 
> 
> It is undefined behaviour to intentionally lie to the compiler using
> attributes.  This is intentionally introducing undefined behaviour to
> placate Eclair.

... we'd effectively be lying to the compiler, putting ourselves at risk.

Jan

> So why are we bending over backwards to remove UB in other areas, but
> deliberately introducing here?  How does that conform with the spirit of
> MISRA?
> 
> ~Andrew


