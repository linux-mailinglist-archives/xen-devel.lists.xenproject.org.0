Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E475F9BE4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 11:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419181.663935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohp6w-0003Kh-9m; Mon, 10 Oct 2022 09:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419181.663935; Mon, 10 Oct 2022 09:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohp6w-0003HR-73; Mon, 10 Oct 2022 09:30:10 +0000
Received: by outflank-mailman (input) for mailman id 419181;
 Mon, 10 Oct 2022 09:30:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ohp6u-0003HL-Cv
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 09:30:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe35731-487e-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 11:30:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 09:30:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Mon, 10 Oct 2022
 09:30:03 +0000
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
X-Inumbo-ID: 1fe35731-487e-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjTFZI78pZtMPawE7gwknRwkfxT5tH2fkFlBmnP6nhM7syoZUtmNsvyWAbATLYHMDhzupDG6qniWldo6lYBJjf5SSwaM641I17flOP82TegHL5LGY7iUrVQCe5k0S1vm45urlYhG+IkF7LZmkrP1RMmToxeyMUqakcSRclUGymQ5pxYpES0VYxWsDs9IvQGgZH3Lev77z/v+CjiQWaW4+Ft16nEY+D5MXADUEkXAoEx1l5T/mQ61V4zkAFjV9qgTbjWB32dggGnJ20yxsW+j5nyAF2b+pZXkuKDxcl08H9Zl4AqMOX9DXrzu8jfVF5U0oeVB9N5/CIGUgZ3+xF6emQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sC7jNsqGnBwktPxUK03Is/B2zAE9DDU9TpEMgsyH2UQ=;
 b=gB4W6B0eNVjXG2ybEjQd+V6v/97koLTBaH/zn1tlhi1swZuX2QDrCWKh++ccXL2JWByl2lY/aMm5A/ilzoq/9UY5M8lvecPDOX4LUrmP8JfhYanoCD7CfmhIeZaaNc5bK5uTCRTOkoSFoIiYFzvwTBNefiLK7PxsHYHuzgw3oYHTMDRx37ftAx3nI2So3CKsovby8+JlAzD+aX7eQIFXbIqcbXghhBRRND78KlBGZfdMuiJmMqf2l8leb5sTXxnxKrVzHVNChgcfkYxmbXMwJmMWOOkfZ02wtmGW2n9PhNAapzth/bJex7OjzDBoVSQd0LZRFW6LI6X7f0ejA7TgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC7jNsqGnBwktPxUK03Is/B2zAE9DDU9TpEMgsyH2UQ=;
 b=VwceYxjVpaMynqPuelpS1dX+4ZWZ1Af8sd+4PKps3Rm06bCa23IHibb9ZKkzPAN6dO8DhFnMYf0DW4fnlrAL/OhLCyv1SxDaea5hrl+YRlECmuW1kUdlVWMTuxgUvrE0DGxR6md5rdgL1WPZcQV4B9YTFTxgRwXs2XW3+nTDCVlhPpFuJRO3lW7SI2GcCX3+yNmnmqmqggvIIjHbxVm5wAf4S9EiIU0MkH09yWXTsBdMXhEC8f+4MLH0QUPvDvjkf/dlHdyG1HpLgr05WR5XoAkFyrhRI0u+vgcvFfmFi1wKXk0u7kH7NTklPCpJtqNvTjRvDmUBaWTkcoToXiJA8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b4b5e11-fadc-b6e3-b42b-50dddea9f09f@suse.com>
Date: Mon, 10 Oct 2022 11:30:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 8/9] gnttab: bail from GFN-storing loops early in case of
 error
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <61775fdb-bf56-b6db-563e-81820e4248fd@suse.com>
 <4808b724-31d3-bab4-e6b8-5e4bc5e0a104@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4808b724-31d3-bab4-e6b8-5e4bc5e0a104@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: ee49af1f-5f6e-4e16-9476-08daaaa20286
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	02zfTZtVqt7SdNjkHw+/KD/CBmPzQpT7h1gy3EzgRz1XSJ9U20x67upLmOSiL/5nV9fcnC23usrLIrDU1uBcfoGe1RlyIscVs+VOYaV2rpnlhRslRJiulTa/VviYA1Aw98VWfTFGITlNAzHtTC2OBADjeZ2U60Z3183YO96wPV8D9xMmkVzlarlxROr2gdMMsjP+NOmnIDQm7J8gtujcA/at2GIvwEP3FBkvHbaJv+vswSMdBQzlx3tt7z2pfRBNDm7eBzQe8wzawAHjFsY1vlo/NiNWGTfesTnaerxqYao47TXi0HTa+R14fq1W3AmHMqjqvsVkcIpMznbOCQ3OQoDqSu80vEWrEev4e/dcd9zxz28R/64LxDns3kVJenJGDaR7j05LRp7UqoKlprYADg5b5KqvlgTU81UwK1jamwG8m24atKvOKMFzxmCghEp7s7Zvg/hWRE3IVqk9cjQmARCWItsKDw3O3uBi76174bD8kmXmy73SQpNT1tUylHur9eh0NCY9fxnQXxIJUziMVwcHppHC6ljNjEuMeAS0JOZJhTnclCBqKVSyb8qGHETC0YF//zpXXnl4XkiaGyFonSpHu4iNn2C3yYosupyLhtFWrTySV8YQK1IUNb/moWAJHEMydAn/VbcZlidNZssFaxuJKehVCJzVIWCKJkYY7H/gOM8OTtt/PzIPazsqK+jUtlK+/Z8VuX/4vE9nyJ5rRCIhZTHOqzXY4v0ylhjBzUcNQWNxxQOdQHlaYPEiZ1ZMB5FRsiR1wU2uj/Rdxpo2i0q61lWIqalGItZuLYubPJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(83380400001)(36756003)(316002)(6486002)(2616005)(31696002)(86362001)(2906002)(53546011)(26005)(6512007)(6506007)(66946007)(4326008)(6916009)(66476007)(54906003)(66556008)(8676002)(38100700002)(8936002)(41300700001)(186003)(5660300002)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzJnZlAvSGM0OWxqNzR4aVJVMVlsM2tKYkowMGFQN3pTSlJNMnRtTUF1ckU1?=
 =?utf-8?B?QmplMEVhQUQxU1JjajhmRElGWGEyZXY0L2dpWlZMQnk3aFVHTHZRVFhqeU9J?=
 =?utf-8?B?Ymt5VTloanlLcFdXVTVwZlFYSWFuWW9TT2FGdFlUdDFGUkdYdjNnQlkwc2pI?=
 =?utf-8?B?RUJlL3Q2Ri81Q0hUSitnTUdaS3VZNEU3ekFON3d6aGN0bzBkMW80L0E0bzFm?=
 =?utf-8?B?VHhnUy9JQ2QwdjFUT0ZCYWtQZlJqbGZTMlVDa2FvSlFTbkdjQVFZK1I1NXJn?=
 =?utf-8?B?andaZVdsTThwcDRzK09tb3JrQnJuZG9ya2pEUnlnUHdKMzl0Z3U0VE5HUkEw?=
 =?utf-8?B?QXNTM1I5TDM3bXUydnVwd1BkRFg0ajlwZW1BR1hjTGdkUGcvM3ZCbUZPWkZp?=
 =?utf-8?B?eHFOaUpRdWRFNzNBRy9XK0tNSDBLSnBIOWk4Q25aWEpiK0VKQ1hzSG1iSitE?=
 =?utf-8?B?eDJlb0tDUWNpV3BKQXRweFdCaUt0K09oQ1RMZDZIM1dLZWkwUElUbHJadnlj?=
 =?utf-8?B?MDRleENyUFh0WXVpQ2k2ZGR3ckRFamVvSjEwMmsveDh6UDZKNzIrS295UWJH?=
 =?utf-8?B?S1llNEZzWTFFdGF0c1BINmxnVE5QdmliUUVBV0hkZnVlVll2clVNU1FpTzJB?=
 =?utf-8?B?czczRC9mcmRIc1pmK0ZORVhUQU5wWHFGZkJuWmxYOUJLTng4YURSWlVPU3JW?=
 =?utf-8?B?MXEyNEZqUFUvMjhwbWs1QUc1cXZPT0lrZzhUN2RQMndvMmw5TU81cC90SUFo?=
 =?utf-8?B?TVU1bnpXWHFsUjdoZ0haZEY0MFhlU3B6Zm9PdFp2L2NZTDhBTE1jSXlKMnpx?=
 =?utf-8?B?T3A2V0djR2JpdTRJcE9pZjNva2t0bEpTTVBHZnkzbG9DcDk4SUdub0VxTGJJ?=
 =?utf-8?B?TXkrZHdjbG5KeHlleGFyOWlPckVNbG1aNGt4bGk0b2hFLzJPOXo1QW9Pc0Fa?=
 =?utf-8?B?ajJpSmJ3SlBkWENWUTBjNDNJUURWZlhQY0lsWkJpd2p0eUtWUGxCZTZWZUpK?=
 =?utf-8?B?cW44eVFBU2lmWVZPcmxIbXRyMTd0M3RYVVpyZGZxSWJ6WVROaTFTZncrcFpr?=
 =?utf-8?B?QzRpZ0hPV3ZhbHRicm5id0lrWkpEbDJndFQ1ZCsyVWhRV3p5d29qZmFlSDhB?=
 =?utf-8?B?TTZndE1od3dOSld3eUxVR29ROE9wN1RhQ2hKeEwyT0k0cVJVNnhnYk9qME0y?=
 =?utf-8?B?a3hnbU4rVk91Vnhody8zdkhiRWRiR0xnTXk0dTY3YTdON0drWTk5WmIwNUZR?=
 =?utf-8?B?Z2VvcUtBbXovd2srMlZuL1VpSmN2NENwM2xDdTB2Qm94bzIyelU5UndxMVhr?=
 =?utf-8?B?d3FnM0o2YWFsWG92bDdLY3FMeVlKbnpOZFhGY05BRWlST0ZNTGFpNUZiSUxE?=
 =?utf-8?B?TnNOQW1EK3lVQmpzQzdIbEFjaWRGbnQrbzF6SjVwMzh4T1llQnJ6dTNNajVa?=
 =?utf-8?B?TUtydlUrcjJIRHBuV0ZIYi9RbjhJWG1pNm5OUm9TcHNDTGFIN1N6QTQrVzRy?=
 =?utf-8?B?WUc5M2dGN0hUWnE0NS9KMEEvV0NCSHFYSk5BdFpsYnFSYUtTSE45ZE9RbVZk?=
 =?utf-8?B?Z2lrUWRBQkhNYWd6bFBqQU1nRW5NRTlsMTBkeTFPUEdjTW1jY1pIaEZ5NmE3?=
 =?utf-8?B?SzNtUEZQTjN0RnMySUFYdkdFcmVaSjFhR3hvWFlrVlZaZE1zU2hlZVdrNGR4?=
 =?utf-8?B?VlNZRDN5d3NKK0lHWHFpNWtIYXRYcFI4dmVveUpMeFFPMnI3Qllwcmh4Q21G?=
 =?utf-8?B?Z2U0STc3bVJaK21NdSsrdlovWUptblY2RG9GT2lQVU83ME5Uc2pab0VocWJ4?=
 =?utf-8?B?ZFpoWWlSY0Q2eWlaakJaYnQ1Zk5idWxjVXNIM2xzMXNGTHB4SDZveEQrc3pY?=
 =?utf-8?B?QVBvZHl6NXJkM2t3NTFuZ0NSMWVGWVJzeVBvdjZyTXorWWJqWFBqNDJ5SzRp?=
 =?utf-8?B?cDFQY3NqZVhjWDlYZi8vekd6V25KNVJsN2pJMzRTWGNhS3hjK2svQURDc3lQ?=
 =?utf-8?B?eEhBVG96QzJlemJxck4xRmdWT1RqNnovckRpY2t5MWpRbURXUlIzcHM1RmJ1?=
 =?utf-8?B?M0I5QW1ZemxpMFJYOWZJMXNxM3IxSnRiRGdjdGNSU3oxdjRlbnNsRXdsRzYr?=
 =?utf-8?Q?GtEGX3l+Vsw2FgbILhEqwQ9oE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee49af1f-5f6e-4e16-9476-08daaaa20286
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 09:30:03.1707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZF7XavpN4km8RS1zyd7bHWZ8vlzvNVC/ztbXZluadxjFKgk7lvbGB8yl3hybPJNjBrKO+9OGIsaSVUjYMtXEhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175

On 07.10.2022 21:36, Andrew Cooper wrote:
> On 26/08/2021 11:14, Jan Beulich wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -3289,17 +3292,15 @@ gnttab_get_status_frames(XEN_GUEST_HANDL
>>                   "status frames, but has only %u\n",
>>                   d->domain_id, op.nr_frames, nr_status_frames(gt));
>>          op.status = GNTST_general_error;
>> -        goto unlock;
>>      }
>>  
>> -    for ( i = 0; i < op.nr_frames; i++ )
>> +    for ( i = 0; op.status == GNTST_okay && i < op.nr_frames; i++ )
>>      {
>>          gmfn = gfn_x(gnttab_status_gfn(d, gt, i));
>>          if ( __copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
>>              op.status = GNTST_bad_virt_addr;
>>      }
>>  
>> - unlock:
>>      grant_read_unlock(gt);
>>   out2:
>>      rcu_unlock_domain(d);
>>
> 
> 
> If instead, this were written
> 
>     for ( i = 0; i < op.nr_frames; i++ )
>     {
>         gmfn = gfn_x(gnttab_status_gfn(d, gt, i));
>         if ( __copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
>         {
>             op.status = GNTST_bad_virt_addr;
>             goto unlock;
>         }
>     }
> 
> then the delta vs your version is -36 bytes, and faster to run because
> the loop doesn't need a memory read and compare on every iteration when
> you can exit based purely on existing control flow.
> 
> Furthermore, the version with a goto is clearer to follow, because the
> exit condition is much more obvious.

I know you and others deem "goto" okay to use; where possible (and where
the resulting code remains readable/maintainable) I'm aiming at avoiding
them. Nevertheless I'll follow the request here.

>  The compat change can do the same
> with breaks rather than gotos, for a slightly more modest -11 saving.

There of course the original if() around the the loop then also needs
retaining; on the positive side this means a smaller diff.

> A form with the op.status changes adjustments *not* added to the loop
> condition, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> In reference to the hypercall ABI adjustments, it occurs to me that
> loops like this (which we have loads of, even in hypercall hotpaths) are
> horrifying for performance.  For HVM, we're redoing the nested pagewalk
> for every uint64_t element of an array. 
> 
> A "copy array to guest" primitive would more efficient still than a
> plain virt->phys translation, because we'd be able to drop the p2m walks
> too.

Generally we can copy arrays (the last parameter of the copying primitives
is a count, after all) but ...

> Obviously, we don't want every instance like this to be doing its own
> manual bounce buffering, so perhaps we should invest in some buffered
> copy helpers as part of trying to improve hypercall performance.

... avoiding bounce buffering is possible only where the data to copy out
is available in ready-to-copy form. Here in the native cases we need to
retrieve the GFN (from e.g. gnttab_status_gfn()), and in the compat case
we need to translate from 64 to 32 bits. Neither really lends itself to
the use of a generic helper, I think.

Jan

