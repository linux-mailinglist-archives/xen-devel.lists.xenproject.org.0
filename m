Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDC3BC144
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150414.278106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Qup-000792-Tt; Mon, 05 Jul 2021 15:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150414.278106; Mon, 05 Jul 2021 15:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Qup-00076f-Qr; Mon, 05 Jul 2021 15:53:47 +0000
Received: by outflank-mailman (input) for mailman id 150414;
 Mon, 05 Jul 2021 15:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0Quo-00076Z-38
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:53:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d3d5062-dda9-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 15:53:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-I3tjqyC7P4STn-xIBpJpEA-2; Mon, 05 Jul 2021 17:53:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 15:53:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:53:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Mon, 5 Jul 2021 15:53:38 +0000
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
X-Inumbo-ID: 2d3d5062-dda9-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625500424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMrh96RmeswQsPrR2RKZrJGeqB8KH5zr8TutCOxvf3E=;
	b=aQMgEzzJSbFCfnZSIKeiEPhbCd5paf9yIfXG4gQb50wJoIUiD8dHIMJi9A3JPxhZ0G9ljl
	i5AyY//nzxAGzcZmVLqB9vk5NsLG3Zk1qQDqahJqtBzRWPfRlebSfwpnMtmogE0GNRUpgL
	DYGCF1cjTn0DSHe7NFHMFCrgPYDddMM=
X-MC-Unique: I3tjqyC7P4STn-xIBpJpEA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUz3gEoDMlMocxXEuudAq3rE0BZ3opaipj0d1WZLeM5704PCukj0VqPQztmJJ9Obr1QqYNP/M8XcWjvvkKP9471vwpn8eY3ZynqR+U70xC54M66QSpU7gN5yFpNdtfWnwW/lMc23sWTzegA1ZxA3kW+WG0aKf1QGHZMSGQvueO/I5wFgjSaGxkJ3+a4phi4nh3uVw7Cd/+6lxl0kjM9oyqfNyRzS1ycelntRXSoRrxtXuXDg6HBSC652xv4Qf3+eEr0SXnQqrWB7yi//5fD5KuYrNzwGvlnqgmhKIaxcryigEwD757c5GiR9DrhghMdXEd6f5TIlGCOxNWopz7o0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMrh96RmeswQsPrR2RKZrJGeqB8KH5zr8TutCOxvf3E=;
 b=ZyXqQpZJonf88eW2yprmRdr+Nzp9yfnQuciM8Jq/4HdOE/iVR31cG0FLI1tcbOHTYTK+BZuIuNkD1jD6cW4KxeanpJ85k2kH05uAXpb0o7M3m4fya8tDqDDYWaq3AI3zOcaiLe44FcDYMF8BN1k3ZHpvUaEe8Xr15d+LBL3rQ6MBB3NqImGrKvZq0VKGxt5IC3vBAz8MEg1S7r0p617lxnc0hYInJ2OUXmnLjcXnxIDvkumRQJTtTBPLMfi9pKbwTZQreeCCwFZOu/KRNRs60PXlf//jksI6vGxHuph6S15Xm5dw8WbZOteSpASGA0HkSNWhu82lyiHLzfskZ5SV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <c5e7aa43-1023-ff6f-e882-0ced8af81613@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4973b974-146a-3d14-4b5c-818d76f2c801@suse.com>
Date: Mon, 5 Jul 2021 17:53:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c5e7aa43-1023-ff6f-e882-0ced8af81613@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0b4296f-5c34-4a93-dbbb-08d93fcd0e7e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608A5E1A2E6AB2B6B417E81B31C9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n5sU9PjPyxDB6hvOV3it3ED58ltozh7XPQ1a50OmgMDjtyGCJIVeyGZSih1bEAgfB7WKAUNmaqlj24gFHFMDXWCMm2ACo4B0dGm+sOLuuL6gFXnDDjibsGYiiJ2auJFWdRcTfPUPtcD3376GxV+ZZHHEqJcTQuMQyH5Ele4g3kTAFTqIcTF2C99h09W6A2/KinilaZoHvZ+A+2eZd5ecC3apzqPczDGQgm5HdmjJSy9XNsF2I49DcNe02sOVm7+VVUVig8uaqlB3t5W7nYVJ6z4e3wupEmywzca+zg+On6M1AqSLMQJPVUaZNOpiiAtuTnrQ2+I6FkTJ95MEBlVbsT56ZPFdug6cEA2mVxCZFCPBm0ARJuzfV+maWfGPTMD2f2Oauo8fIBcNRbLNyBKE7hHlir9vTWtbNBfDStwg5vTYY1NkdLhr80cZiEbPaky+7rj9pfWRs1V+NkxRKMnE9ezTH1o9JtVXAW0a4jChAtbvQvvoEYOL0utlJePQuSnvz/dopcJZ12+kpGs1Cipvnf1bcBRKqCcQ0a78cj61AZwGiR/oEGVhZl8vm03OSFtEHPJEw+3dzzF3ESQNR5sf5ZkFCro4p1I3IKM66OT1j+htQhGsh9fRsxeYM4Z9P8RMWQDu5EkiYzbz+OfKa89tVCcjrE6rWuMJYRvotNe9DY/5Co61+afsFe3jc1sA1q8mAj8LImS14PsoZDHW7O2wtrwODFjfnmaarQuHn7td6k+aK58p6nzhTEBCBrQrxMOl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(376002)(136003)(396003)(4326008)(54906003)(36756003)(316002)(8676002)(8936002)(6916009)(26005)(2906002)(186003)(66476007)(66556008)(16576012)(16526019)(66946007)(38100700002)(53546011)(31686004)(83380400001)(478600001)(956004)(2616005)(31696002)(86362001)(6486002)(5660300002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG0ySjVrOVRXSFZ2MFZmZXBITHYxNE1NSDRmeWhENFJBRzZnRmh5R1JoWDRo?=
 =?utf-8?B?bnBhVHJRTm0xeWswMnhsTktzTldESmx5M2FJMzl5eDFpM280RlNIWWtWbksz?=
 =?utf-8?B?RXJiWUlIWUtXa3dGeHRndmRlaGxmL0hBZkNxTlJVTFJudXRER01vLy9icTVp?=
 =?utf-8?B?d1VlV2NJVmdDdzFUcVg1UFFIazMwalk4a0pTdVM5ek9ZSTlFcmM4bDFrdTVx?=
 =?utf-8?B?dm9HNmhGcG1oOUpKNXdvWnF5YUtBYXVDbWpIbDZibzFSYVBvWnNKUGozTkdF?=
 =?utf-8?B?WEhSa1h1dlkvcGN5ZWNsYUt5YitCalhLeVBsa3lvODhZZWo3dUlRQllhSnV0?=
 =?utf-8?B?SFA0MWhmeHBJSGk2dHhyOXRVZ1pIQUdTUXNnUGxiSWNFMURwU3pnL0tHU0FE?=
 =?utf-8?B?NVpyQ0NwZ1B2U3ErRjhhdDc4ZUNrQXROY3BuaGYyZE0wRnRhdXZ6TzNvUzRL?=
 =?utf-8?B?ZU1mdFp4OFh0VjVjSkxDem4yNDBQOVo1TDNBemlRWFJESlBHUDJCSmk0UmpX?=
 =?utf-8?B?U3Q2OStqZ1JtSktPUmE0bUhwM3o4aWRkWHZOeXFLODg3NzBoQnlCYWNZY1BF?=
 =?utf-8?B?dnIrVng0VEc0Vm5tZlY3N3VaRTF6aFlmTUI4VVpQcHlOU2tCNG1IV3FZRTAz?=
 =?utf-8?B?aTM5M1ZlTDBsTGwzRzY0NWRva3hLT2dGRlJMOGF5alpZbWNVdlBpcXZRVzVj?=
 =?utf-8?B?amo4ZGJqVmxvOHljdFRjUjBvMUxBMXdybmJCWXhRQWhCajVPS2tra0IzazdB?=
 =?utf-8?B?Zk1scFp3WEx6MEtUM3lLWnFZSkFyank2NHQrQmRMdW90VzhFZkVhSHV0czdW?=
 =?utf-8?B?OXEwS2xYRVhoUTJnendad2xQK0lQbXpIR0c1NEFjRzVlQXNKTWgyQ0pmTk9H?=
 =?utf-8?B?WG4xajRJR2VjQlhFZlJhTWJvbDd5UnordmNUdGpuUFdUOEdWcGdzVFFNL0R1?=
 =?utf-8?B?czc0djJXdnJVNVg5ZGpBTGRXMEdEV1oxMzlNcFJJYm5wZ1c4SXM2ZFp4Nzgr?=
 =?utf-8?B?OFFrZ0ZsTENlMzNmMjBqYjhQSm54Qmw2VHdOQ2liN3JQeG12U0lCSmJmYTFE?=
 =?utf-8?B?Qk1VYnROeEw5ZmhlTUo1dnA5SkluSlloaDRuR0g1Q1NBT2xuWEp3UEpGL2hj?=
 =?utf-8?B?aWtyK1lOMkRnUXNKQTVsbWlleXhPdkU0ZUFvUXBUQzhBd2lzc2xYdS9FcDQy?=
 =?utf-8?B?NUIvRTcxZDUxeWZqNkZMUXF3MzRkSThXd1dVWmpORUVXbzVWdEx5ZW1keGFo?=
 =?utf-8?B?ZEk1OEZsM2xKK29lOWYxL0Z0Y3Y1QW90RW5reHlxSVFocG9FZjMxVHZsbEpR?=
 =?utf-8?B?aFhndjBCZjIwLzdRMFZFcGxqaXJDVVNFaWlOS1lqamFDRDh3UzByZ0ZpMW5a?=
 =?utf-8?B?ZWJiazYrbk5PcFBkVTlpZTQ4TVd6ZExBZWt1VmZjbGRBWnRCVlJ5ZUdmTjF5?=
 =?utf-8?B?Q1Axd1dvNkZCVklJaFFHdzQyakZ6L0FNdU44L1RxcVpvN3M3UDRjY1hkSGJq?=
 =?utf-8?B?cUdhcGl0MGd1TFdGSUhyTFVLelB4VWJmMzEwd2dNM0JRWjNTVUZQVmVEeEMz?=
 =?utf-8?B?WENFVVhHa2d2ZldQYjFYUFBvY3JUOU1pRWxrSEpYOUJ1dlZ5V25odFhjaFVi?=
 =?utf-8?B?amNKNFU0RjNOcXNQWTVDcE9nazY3Wk11bWd5TUd5Wk8zaU1GYllkdlMxQTVo?=
 =?utf-8?B?M3ovOXVud3Roc2UxSFhiaG5rN3EyaVdES2piKzNqMUs1cjl3ZXM1b0JYd3pq?=
 =?utf-8?Q?qvtasVxVoFcx5hu4HbJ8E0NiUojhVnq1T9BGTlP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b4296f-5c34-4a93-dbbb-08d93fcd0e7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:53:39.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPNlb+hnhkE1LkYvD2ujh1BlvF37tGuYHUEDHi9axiK5OTtNZuPNmSstlkfeJzRXR9cLIq34MKv7onPiYKoevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 05.07.2021 17:41, Andrew Cooper wrote:
> On 05/07/2021 16:13, Jan Beulich wrote:
>> In send_memory_live() the precise value the dirty_count struct field
>> gets initialized to doesn't matter much (apart from the triggering of
>> the log message in send_dirty_pages(), see below), but it is important
>> that it not be zero on the first iteration (or else send_dirty_pages()
>> won't get called at all). Saturate the initializer value at the maximum
>> value the field can hold.
> 
> I've already explained why this is broken...
> 
>> While there also initialize struct precopy_stats' respective field to a
>> more sane value: We don't really know how many dirty pages there are at
>> that point.
>>
>> In suspend_and_send_dirty() and verify_frames() the local variables
>> don't need initializing at all, as they're only an output from the
>> hypercall which gets invoked first thing.
>>
>> In send_checkpoint_dirty_pfn_list() the local variable can be dropped
>> altogether: It's optional to xc_logdirty_control() and not used anywhere
>> else.
> 
> ... and why this is broken particularly in the context of a later
> change, and ...
> 
>>
>> Note that in case the clipping actually takes effect, the "Bitmap
>> contained more entries than expected..." log message will trigger. This
>> being just an informational message, I don't think this is overly
>> concerning.
> 
> ... why this isn't ok.
> 
> Why do I bother wasting my time reviewing patches in the first place.

I'm sorry Andrew, but no. I could as well reply "Why do I bother
replying to your review comments?" You did say

"I don't follow.  Migration would be extremely broken if the first
 iteration didn't work correctly, so something else is going on here."

which I replied to:

"As per the title we're talking about overflow situation here. In particular
 the field did end up zero when ctx->save.p2m_size was 0x100000000. I'm not
 claiming in any way that the first iteration would generally not work."

and then nothing else came back from you. I gave it a couple of
days, taking silence as indication that my reply was satisfactory.

Similarly e.g. for you saying

"This is an external interface, and I'm not sure it will tolerate finding
 more than p2m_size allegedly dirty."

with my reply

"But you do realize that a few lines down from here there already was

        policy_stats->dirty_count   = -1;

 ? Or are you trying to tell me that -1 (documented as indicating
 "unknown") is okay on subsequent iterations, but not on the first one?
 That's not being said anywhere ..."

If you expect me to adjust patches rather then just replying verbally,
you won't get around replying back when you get verbal feedback.

Jan


