Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919685F9B56
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 10:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419155.663902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohoR0-0004eC-IE; Mon, 10 Oct 2022 08:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419155.663902; Mon, 10 Oct 2022 08:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohoR0-0004cL-F7; Mon, 10 Oct 2022 08:46:50 +0000
Received: by outflank-mailman (input) for mailman id 419155;
 Mon, 10 Oct 2022 08:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ohoQz-0004Le-MI
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 08:46:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1381ce65-4878-11ed-964a-05401a9f4f97;
 Mon, 10 Oct 2022 10:46:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 10 Oct
 2022 08:46:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Mon, 10 Oct 2022
 08:46:45 +0000
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
X-Inumbo-ID: 1381ce65-4878-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1Z8UztMWdQ20c5Pwi6sfh0mlpfMSVW3J7nLeJAZnegK4keCdpnaUJWEqPwzeuYHLBnZzDtpCFg5yy5DHdXvg2oNZ+TpHRl0nKY4YqfjNqrUWhW+/bE6wELq2Kf2Rc5tCnXnzRL4pwVSvKMzyqWEZlbKq0A/bxGA0oYiGT3rrPYUyz6VBOryzlAuB7Sr7+seN8Vq53oGwH3ds1RLrUnpcIMFivI+qHEch/4U0+IdUM5gd4hElPwbr+EJPGD6BuqJXxx4XcxYGQgc3ZCCESLuhHKLJ4JWSDr5fkIj7C606zwICyBnmurYdOFXyN42dzYWv34lvj0OzrdQBRWPhk2EQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGnypTq7vraWhIQ+AdGroi5WfAv95mzqI6SjBXcQulM=;
 b=fpzSY1NwAbLMbKB0j67TkBmOMAKBk5qDJC1reRvZX3aFP3vCqhAiluJGciGkY4iGffL4Er0QQdAUAy+cdJp1SobDDk5V07PDvefQNBBT8YfUp5N8tcEOZVb9TSxYKQxRFiIoQSBqGjyQmnDsZugJvZe6y0szZNsLeIu0/nMx3ZtK6yUbjM8CceUQRKO9mQiyKVmw3bmMTUX3zBYOwXR06eVEE/+4U1QihYmFERl8W7Mn+P667Cc+8NR5w+jb9I8XUfya8kquoubTGN80BgdQeuPFJUycUJs/NlLxzX0FplmEM97kf5z/O00NgwXxsFBdTfywSmzvycMej1mbK7BVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGnypTq7vraWhIQ+AdGroi5WfAv95mzqI6SjBXcQulM=;
 b=HS94GKRuZQfXPnRgB2xji03d/y568x2G9lct0uSRA6LgjRF4TwUOaK5ZpD8U/jpg2d4VMIwGzhffYKmyQIgMCqt8Jyvga4grz8pEWj6iCezeVa8YZTqz8L58xLdzWn2ek1AWsqAjc0fhI0+tzIaJCAbU/SbDjk8m0NVlzaVNlkfsGOTDh1IXtXMwu2Vd8A7r3QdnaMK99QMAlw53YwhHvXPuwRCv6tJui9FS/xO0DHqn2EbQDvvGRSih9NQeH+7iz0VJUPkOeoN0UmsC69qwTp/fjlq+p3+OgAblmUcHJw5RmqRcshUTyihtU85GdyGY5C/db5aKxx7kIijN4SMg3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <568c1ddd-dd85-2625-468e-b62cca0eb17c@suse.com>
Date: Mon, 10 Oct 2022 10:46:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 9/9] gnttab: don't silently truncate GFNs in compat
 setup-table handling
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <c3f4d5ce-6ac8-1d1c-eed0-704354f8a5f7@suse.com>
 <c8b08c8b-0e2d-040e-32b7-0ca63c2908e6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c8b08c8b-0e2d-040e-32b7-0ca63c2908e6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0601CA0046.eurprd06.prod.outlook.com
 (2603:10a6:203:68::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: c77d6073-010f-4022-477c-08daaa9bf65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KH0+OTFnElRk4B++/ZVX70KJr2HQ3ZtBPFaIA7HR+Po8PvTgx3a+wVSrq7PzGNw3ZuT8niYKRdH9VXX8OyfGpoYYOVRBO3BtRt1IimqpMJ6X5RWysSyL0Vi9Q5WlQJw4x8UO05yOvV2DLgTdsOWkIrf96Z5TTjBlkFjWBtOXKpWOMNFyWBXPjOTrmzrux2UM5KEUp9CuI6I6gS56t/Y8AOqlRZlHGHfvUmtao3KdH3Mb+pJzVEu2Dbjpc0LD/YCirtxUaNl+AVESISWeW7Wpg2oh+Tlon6mg2CIlvinO938dSepucx+yz/sW57OfYVXUlAfoR/lW9kEw7K6OB9nNGltPWPHsJVBJU6YoT4maRyf3ajp4oZPhQfGBYNt9Nfk3LT0pOLBs6N6acczP/uC0F+Gz21c9fwf/8on/sxGwOqblJYlEGLkuYmUqEXr4l8a2txHlp4BIPkpcVgUuOkz/d0WSD5o/8eT+pbhF4QKLGLZ+UulUMyvCsC8WrqyyFe1ro0pPS4r21K64BomWxp6G2ga4RYXbBAk6ZgDtEZp90mcqDtp2fF9wSNvNjrrudgBu6BT2qCNe3LtimJJSIyCaWI3rdAQsklzhbw8uWE8KQ5POkEAPIKgYjSa16ILeuhz+gpZFrCYEEnsB+eOZ+DxEV7oplnDl/EuVWRYHP9toryxN8HYZxxGzgdB7g8f5y4fCrdLvOw0gLRGfJzdsK4iHycdPYg8j3QjlM2P0unV/5pbCZMZGrNiCdHIi8EsGXmrKHfA3mYaUgQkF9DNqtxRk2QxxxDhjlcD2uTzLMDgGZzQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199015)(31686004)(26005)(8936002)(5660300002)(41300700001)(2906002)(31696002)(36756003)(478600001)(54906003)(38100700002)(8676002)(6506007)(6512007)(53546011)(86362001)(66476007)(316002)(66556008)(2616005)(6486002)(186003)(6916009)(4326008)(66946007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWo1eEZYQ24xOHZ6ZTh4d3dIQ2RyaWFSdmhLQ2FSRm5oNGxycTVIM2tIT2k0?=
 =?utf-8?B?akdFVXRBcE1sNDgrVXViUEZ6YnpsWjlCT1Z5bGEzbUVRNytLZlpRZ3VCV2lV?=
 =?utf-8?B?QzY2L0p0WDYzc1kwQkYrZFJDTDZ3eDBIWWs3TG1sNXcrL1Z2UllFK2x1dVFM?=
 =?utf-8?B?U3hQVlZCYXpudm0zbG5iUWNkem1wNG1qRU8zZmZpZDJDaXFRSFU0Qmh1Rkts?=
 =?utf-8?B?dXA0N0dXMVU5ZzNHQVM3enJoKzZUK09uWWlDY09xNDRyUWVabHJCVDNhMElQ?=
 =?utf-8?B?eWJ3eGd1NXNZWjZuNWlqZHg3TGdIdGZBU3AzSTRPblA3SjlpZG4yV0xRV0VT?=
 =?utf-8?B?Y1JzazhDWXcxd3JZQ3owcUdFWHlxUWcyNGdaQk1UeVBsWXRUdkdhT1pmRzBH?=
 =?utf-8?B?cXhBNGxveDF0OEZZQ29ieW1LZXdDMmxvYVFBd0R5WXdHMDNzMDk5ZUp1aEhs?=
 =?utf-8?B?VEFYN3FyRXkyTDZDemZMOEdRWTFWb1k0RDh4VTVLRmlyRktvd2VETFRmemQ0?=
 =?utf-8?B?aU5naE9QekllVkhKVWlEaTdTZ2hDdlk0TXh3eFVoNjFGRmoyQkE2K1BzdUsr?=
 =?utf-8?B?Yk9mY1VZYWZBeE1KY1kyaHA4UmlsUjJPTHJWQW1RZUlzT1RnSmNoZVZLTm5R?=
 =?utf-8?B?L3lqTDA1WmVtWm51MlZUQlRBR0MzS1JISzhqdVpBTklMZkJPMTNGNGp6WW1D?=
 =?utf-8?B?amk3YmpKNjE0ejl5OGU4MDQrNXFiT2VNZjJjM0ZMbERXdThpYmcxR01WTUc1?=
 =?utf-8?B?dStLMGxOT1dJU29ENzJXb0lNNFFibktodkJmby8xQlJsMTExd0RobWIxRzBa?=
 =?utf-8?B?WUhTaE9haU5oNHNpYkpRKzQ1eUo0REt3UEdnNEtLeXAyVEFMWStITUdTandt?=
 =?utf-8?B?RzVPVnRBRnp1VnhRb2t6ZUg1THlkWThMNVhTNHZkcVZLVGdFVEhoWUtOd1ph?=
 =?utf-8?B?aGRjUklnY0dlNUw2VS9XTVlmWExBMnNSZkFKbnEvbkFWRXJCNDhwTUFTbk5x?=
 =?utf-8?B?TkpFeVNwK05Jem1YVjJNZ01wa2FyMms2Z0o1cnZVajlpU2p0akJrZnV6RHQ3?=
 =?utf-8?B?ZndYUEZ1Rm4yNll0YWQvS3RVYWhtT3ZHVHNoVXBqanVwTXprNkxSOWsrOThq?=
 =?utf-8?B?dXNKbDFIUkhOS05mS3k2VEozaWY3YjJrRjZCZWFiVW9CNTVRMVV0VHh5SHFZ?=
 =?utf-8?B?emRONXM0MU5RcmphWlhMdVFNRnFNRGFmTVFEMnRxb1pwbjd4M0Ywc2h0U1Mv?=
 =?utf-8?B?NkJsamRJZ2pEa0RrWnBVWktvdXdhQU5KU0xhWHJvbXZiaXhMVElHaGdZWElp?=
 =?utf-8?B?aGJOa29Ic0s5RVRYRkZKUEt0SlRYWHlwSUpNWkNRSmZUYkEzaHpwSHFhQWda?=
 =?utf-8?B?YmczcFdPbUUveVRNTExmRkZueVVxR1FzTVppMVp4c1EyNHVibGlGMElSZkE3?=
 =?utf-8?B?Q1pEL1B3MGdvRlo0TEhFMU5nNldoZEFXZ1VRNVBaYURFN0hUdnFwRU1Za0FX?=
 =?utf-8?B?U1Znc0NsSDJCUzVRWmFaUHNPeUhncGdVbHhlUUlyYmVNdHBRbldMaElHRXU3?=
 =?utf-8?B?S3NUV2RTNzRVeVhSTU9JTlIvUmZuUnBaeE5oeG1MUVZSZUtkNVNrd3ZXNkox?=
 =?utf-8?B?TkpxazAxTFliblM0YWs4L2c3UUUzczFOZEl4bnZrd0JrOW9DTmRYUnpxV0FC?=
 =?utf-8?B?WVhWUVZxc2xQbEFNRnVheXFUaWQ3MnI5aFhybksrSVFTYVd0eTNlYmQ3Rk1Q?=
 =?utf-8?B?QXNoMzlnSzQvR0tMOTFEdTJCdnpmVU9NbUJHM0VaQmJidFlwckY0b1ZVUi91?=
 =?utf-8?B?cE1yNmVTbk9HREZZWm55SnVueTh2QzdUOCtDL1JrNHRHN0pqMmlkS096bVpU?=
 =?utf-8?B?YlVVTFJCL3ZhaS9MNCtWVC91Wk1hMEFpUDRLcWxJN1NpNnl4YVdFSGdMZEtH?=
 =?utf-8?B?MnczU0NPa3h4RkxJay9WNlhiU0ZWZHpZSC8zcTNjVE4xU09Vcjd0dXppTjFM?=
 =?utf-8?B?a0dEdWtZVXBla0EvNkJLbkZ3MjNCS3g1THA3OTNxMloyd28xY2F1bml1UlM1?=
 =?utf-8?B?WnNBQXVpMFBvTUliWFNLWlNHMlZaR1hDVStOL2pMRSs4SlVFZFVvQ2lacksv?=
 =?utf-8?Q?nyBdCctubbHsimqw26gMrhJ1o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77d6073-010f-4022-477c-08daaa9bf65d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 08:46:45.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBFG2KFM+99ONOlvEdLnObXSbclh/O4YywCyAskZGjuEQDrHQB+Nap3LFaR2qMIpkJM0fPTtpOmzqIdfiDCeOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9053

On 07.10.2022 21:57, Andrew Cooper wrote:
> On 26/08/2021 11:15, Jan Beulich wrote:
>> --- a/xen/common/compat/grant_table.c
>> +++ b/xen/common/compat/grant_table.c
>> @@ -175,8 +175,15 @@ int compat_grant_table_op(unsigned int c
>>                                   i < (_s_)->nr_frames; ++i ) \
>>                      { \
>>                          compat_pfn_t frame = (_s_)->frame_list.p[i]; \
>> -                        if ( __copy_to_compat_offset((_d_)->frame_list, \
>> -                                                     i, &frame, 1) ) \
>> +                        if ( frame != (_s_)->frame_list.p[i] ) \
>> +                        { \
>> +                            if ( VALID_M2P((_s_)->frame_list.p[i]) ) \
>> +                                (_s_)->status = GNTST_address_too_big; \
>> +                            else \
>> +                                frame |= 0x80000000U;\
> 
> Space before the \.  (This is one reason why I hate this style.  The
> borderline illegibility makes it almost impossible to spot style problems.)

There is a (imo severe) downsides to backslashes on the far right as well:
It's easier to miss adding one on a newly added line, which may or may not
result in a build failure.

> With the adjustment from the previous patch, you'll need a break in here.

Can do. Question then is whether to go further right here and adjust
the loop header and the other setting of (_s_)->status at the same time.

> But for !valid case, shouldn't we saturate to ~0u ?  I recall from the
> migration work that various kernels disagree on what constitutes an
> invalid MFN.
> 
> Then again, I can't see what legitimate case we'd have for a truncation
> and an invalid M2P entry needing translating.

I've dropped the use of VALID_M2P(). It's a bogus check anyway (I don't
actually recall how I came to think of doing this sort of check), and
there's indeed no reason to report back an (overflow) error in this way.
Furthermore I've noticed that the updating of "frame" was actually dead
code - the updated variable wasn't really used for anything; we would
have left both ->status and the array slot untouched, misguiding the
caller.

Jan

