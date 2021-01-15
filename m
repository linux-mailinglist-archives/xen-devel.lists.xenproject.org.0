Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2A2F7CC7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68100.121831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PH3-0003ZN-Or; Fri, 15 Jan 2021 13:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68100.121831; Fri, 15 Jan 2021 13:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PH3-0003Yy-L3; Fri, 15 Jan 2021 13:36:21 +0000
Received: by outflank-mailman (input) for mailman id 68100;
 Fri, 15 Jan 2021 13:36:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0PH1-0003Yt-NL
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:36:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cd5a1e3-4a7b-440a-8f0f-8b595d170708;
 Fri, 15 Jan 2021 13:36:18 +0000 (UTC)
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
X-Inumbo-ID: 8cd5a1e3-4a7b-440a-8f0f-8b595d170708
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610717778;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OTz+ubHjIRvU0G0pRtFCC+bCRMcF1f5QWxqbC6yaNUI=;
  b=GLsPTt1IxDf6mY4I6bRlo6Uo7yWI90E4AeAm4L5RI+9QBBW5ag5Tqzn5
   BTnVIQELs5VAm2s3AhtkCyc00OE4QpHeLe+QUE+CRzJaH1fotrXeqcgKh
   oFIkv5scOFrPMLyY+2W9rS0B0wSWmWZfPE00aVSEqWHJ2h+eeNqodJQYT
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6ekvtz4Lpci2mjB2qvHEiUfs6eXU+DqYNO7LzuCfz5aE2dg52SIJCHtGR6o8aAi11+FqpShxbT
 XGfpMb4C7fKG6E0U+BjNF65JR69QL0HqWQ8xA00v5IWSLwk8rtZnSi70sF4ruek+mxnI+l3MRj
 QVgaCJRqArniSdrBH52Ahft7iO8y69L+/arpNtcc+yHgCLUUipa31zFar7ScBF8fvRDzfOeAmj
 K9q702tdFAYBlu2THXHq8bqbabhIgdcGjZNmGnTB3qbal6GdjKKSOQHzz1IZCaRrMHWZzxSXgM
 umc=
X-SBRS: 5.2
X-MesageID: 35160676
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35160676"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhcMO32IYTgGAPnOgP0lihAkuAVt5W5c0I/+4NpwcUdMIgqoSsSJktaMu7zskEQw8CUTMqUNgN01VfxCCs08O4zWNfX/+mCACPjcwhAg8u4QGI/aMVYMXp1sQztiVS8BebiSYq6vPlK0EUBLjMOTTv+L/doswl3sKGOyVDac3u2nH9ioWXeXn90aMUXOcnQr5RHspT6RtRphU1JokwkWAuzTpRp+zjoQALlpzIp87g99Zcm7AX8VSd7AZiopLfB70QheYXiOl/YoXzGsPnlMKTD8bt3qXihzv+JU56/8XJ6t1pJD66I8beWua/4J8orVqpkS1pucHvJNfF0BNskHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh/ie4wExGZVzIDDal44t3IzmhYqhBBuosAuVk4NoGk=;
 b=jEcyBtH3zMUpYk8OoBxYIgmguJ97embqZZRBNucFQ6NxfBaUrUy5nh0sbfNvdUUikpIcZYJTDVVnuxDE3mKkczVaIQWwT4dsGBL1UowGWXO+DHDfmmqJBYo5D6Q0Gzioq+KEYK2frVHu5qSF3wFL27goz1NVo3B43hvF8Tf3vdRs5neDrvBjO49neV2vaPf3psXiffa/D7bwx+FaTQwoTHaGPE9wuVfW5YdWxhnwH9LtyMc+LVJjSeXohKOp1oq5Am4dHk0+EhOCp+gg7iEiFZSTQXPic4MgZaGmHQtMsVjhqSyqJX4OPH6wMQNXxSAtBWH5rIP9b6UWFGkzhdNjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh/ie4wExGZVzIDDal44t3IzmhYqhBBuosAuVk4NoGk=;
 b=EMrGcDbjtZgE2Uy50tTL5nX0ovUFBXZXY/HQTvuGZVq7M8DsRQMIxOIINT6ubh19MJSePCBZ1RboEyPINxgvG7XT75HxoNpwx4Hz5DSRqmFdCcPZnUt2Sniqsb/XTEIX3bk+VWeWpBN/F6GAojFcDdPUQBXR34ZXqXSqyNam4NE=
Subject: Re: [PATCH 1/3] gnttab: adjust pin count overflow checks
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
 <38331526-5c24-08d4-b1b6-9baa16251c1d@suse.com>
 <fb12277c-beaf-2058-69ce-0c7c14bce56c@citrix.com>
 <cea405c4-354d-307a-4465-a9a59b1a5696@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ab7cbe24-8a05-203d-175a-9e85d3ed1ee1@citrix.com>
Date: Fri, 15 Jan 2021 13:35:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <cea405c4-354d-307a-4465-a9a59b1a5696@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8677c0f7-24ee-4993-aeee-08d8b95a7a1f
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5518415CB2F183D9599C71C6BAA70@SJ0PR03MB5518.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ny5WcF7HVVNXZUGA6cqKB8fyaTa2OzvVleZeuavQnMuP4+AGBdtmMHQDxdqXan+JEMLxoyCBCEWUzpAa40U4U3yg1XZBiXHAWuBVO1FM+h0fFrhfHxkSzMEtIS8CJhI024Z2WACojegMF9DJijI+gsXUTXtHVP2uG6na3/6yFE379kVMT9yauk1yBOr/EBV+U4jum4j9jTJwY1NpUQvrOJzZxHOvfsN/YfT5hT1pnAb8rD2lo+0DXrvdcupb0bmOBTxOwAlhYOB/QePSlI1Cy0+EqvW5WiQt3c4SvT/vGbgVdG2U2IbVPQKZPCc3dXf7cYMehKNcImHNCkVhmiz0PQGIXFRxTku/1swfXqMlp8PPl9mYUssu7FBANJRtNlAhX/+hucMtpcTu/MUiiDLQEhxYeGQ3Ak54L1KGUd3RZo/wo/t6E3iw75QTYzTIYLxqMvzFpGdDSCs1onhd9dPB0YoivqSguVefmV1rzUwUklo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(956004)(36756003)(8936002)(5660300002)(86362001)(6916009)(2616005)(16576012)(6486002)(53546011)(8676002)(316002)(54906003)(66556008)(66476007)(6666004)(16526019)(186003)(4326008)(31686004)(2906002)(478600001)(66946007)(26005)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dzZVbzdnU0dhRytXU1E3VzVFQyt3NjQ3NldPaXpBdzFSR1l4QU4wTHN1YUdM?=
 =?utf-8?B?dzJnVm90aHNDTzJmRHBSeXZpWXdEME1Td0RucVBIaDNvR3ZicDZzWkthUFQ2?=
 =?utf-8?B?TFlvUkM1b01Cc1AxWUJhSUxGQXNxS1J4cjNDV0h4b09sMkx1ck95amNadG1m?=
 =?utf-8?B?Y1lMdmJMeHUwOFlCRGJiTE1zTVppMVJPQmJNNUhBME1LaTFYMFhuclJ6UGRG?=
 =?utf-8?B?ZVhSRDVMSG5USnVERXgwRXFEdlVEc1FyRFRtTVBMUkpJNEViWHdqZXZiUjVr?=
 =?utf-8?B?VkZFRC9aM1JUeDltbUFsZ1JmK3hIWC96TEVBR2V4NklTY3cwMGpOa2tCYnly?=
 =?utf-8?B?aGRZcDMrc080YWR0dzRQckp0bzdEazQyNk8rMFFITFdmY0RWQ3JNODRoNVU4?=
 =?utf-8?B?aEVjazZLVTFWbGR0M3ZqVi9pTHlzc0RrQlVYTDhzVnp5OW04VjNHWitlMDJt?=
 =?utf-8?B?enBoWFF6TmlkWEVvcTVYQVpaQ21PWG5tUDVCZndkc2l1Y0FlVnI3ang4bkgr?=
 =?utf-8?B?SmJZV1pPZFVzMDhJTHJqVWJPRUJZVkhGMFp6bnlXUjZjak5NZzUwU0RPcTNz?=
 =?utf-8?B?ZTNlOWVDazVzUmVNSDB3aDQwdVdIdGhCWFNFbjMrYWhneEdZd0tVa3B3Smln?=
 =?utf-8?B?UHUrQ1psRklkT2l2NG1BbFNtWmpoZGZMS2JaOG12T2FjSnBuVmJ2ZGhuZ3Fm?=
 =?utf-8?B?R2p2Ylc1Y0JiRzR2UmpUS1pRZkpuS056QzIvOXVlOUhpM0xpWDdCQ01jT3BK?=
 =?utf-8?B?VThzK1Z4MlVzaHRsY2FEM1RCa3dTeldWay9PWFJQRkt5d08yaTR3MDlRQ2Uw?=
 =?utf-8?B?NEU2a25JRW5Xc09tVG02ZmZTWkhDdG9FeklCRGIzYjJxMnVrSVYrb0ZMYXYr?=
 =?utf-8?B?SHJtUUE5bDkrY0Y2cUdUWHBlcU80Z2t5a0xPM0ZZL0ZuRE5YbVgzNjhBeVE2?=
 =?utf-8?B?a3ltbFppU1hzNEw1TU9IUXBUSXZVK2NRT1J1ZEhyUmFma051VkJoZzBHNksr?=
 =?utf-8?B?Vlkvdml5UmhmSlBsZjJxYXZsaXRIbk5TdE4wTjZwaVErY0NKbnM5WDhOMXQ1?=
 =?utf-8?B?WWtYZWNxdmJEZmRtRjBrazlZOGN4TE9PYUNzdzYvMlllZHJEdThoZkkzNGRE?=
 =?utf-8?B?b2tXalBvY3VzRzR0VW4wQnJnSkRyeHRkOE9RN3hJME94Q1JCQnJVYTRJK1FJ?=
 =?utf-8?B?bDU3aUhtMU0zdEhKbmdQKy9zdFRoK0UyZlFrNmhPTFovUVpUTlhGamdxd0s4?=
 =?utf-8?B?d2hIK0Fpd1gvdkFBYWVGMTU2M2YwdmsrUVUxSUVONUtNY3U2d0VHeFluTzBr?=
 =?utf-8?Q?qnVMxlpexaTuxbHNJa8SaqJdn+Si3qyS7g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8677c0f7-24ee-4993-aeee-08d8b95a7a1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:35:57.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXoxKQs6r0kA9FF3eLRbZA2+I4RPmElFZccragPGBhPhhR244B03in4OW2MKIf7tGPqO7Je/9r+xwD5wRbdQjvb9TMWQGcgaUpSay6NZUfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5518
X-OriginatorOrg: citrix.com

On 15/01/2021 13:26, Jan Beulich wrote:
> On 15.01.2021 14:09, Andrew Cooper wrote:
>> On 14/01/2021 15:23, Jan Beulich wrote:
>>> @@ -1052,19 +1063,19 @@ map_grant_ref(
>>>      shah = shared_entry_header(rgt, ref);
>>>      act = active_entry_acquire(rgt, ref);
>>>  
>>> -    /* Make sure we do not access memory speculatively */
>>> -    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
>>> -                                                 : &status_entry(rgt, ref);
>>> -
>>>      /* If already pinned, check the active domid and avoid refcnt overflow. */
>>>      if ( act->pin &&
>>>           ((act->domid != ld->domain_id) ||
>>> -          (act->pin & 0x80808080U) != 0 ||
>>> +          (act->pin & (pin_incr << (GNTPIN_cntr_width - 1))) ||
>> This, I'm afraid, is not an improvement.  What we want is:
>>
>> #define GNTPIN_overflow_mask 0x80808080U
>>
>> The reason for checking all at once is defence in depth (not strictly
>> necessary, but also not a problem),
> How is this not a problem? There is absolutely no reason to
> reject a request just because some unrelated field may be
> about to overflow. In fact I now think that I didn't even
> leverage the full potential - the "act->pin != old_pin" check
> could also be relaxed this way, I think. Just that it sits on
> a path we probably don't really care about very much.

Hmm - I see your point.  I'd missed the fact that a previous operation
could leave this timebomb waiting for us.  (Probably wants a note to
this effect in the commit message).

However we go about fixing it, "pin_incr << (GNTPIN_cntr_width - 1)" is
too obscure IMO.  Perhaps all we need is a

#define GNTPIN_overflow_mask(x) ((x) << (GNTPIN_cntr_width - 1))

but it does occur to me that this logic only works to being with when
pin_incr is strictly 1 in the relevant bytes.

~Andrew

