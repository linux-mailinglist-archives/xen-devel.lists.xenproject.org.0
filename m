Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061D2F6485
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67180.119665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Zz-0001t3-2y; Thu, 14 Jan 2021 15:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67180.119665; Thu, 14 Jan 2021 15:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Zy-0001se-W2; Thu, 14 Jan 2021 15:30:30 +0000
Received: by outflank-mailman (input) for mailman id 67180;
 Thu, 14 Jan 2021 15:30:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l04Zx-0001sD-KC
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:30:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e539b26-e933-4a77-aa20-838aba6066f0;
 Thu, 14 Jan 2021 15:30:28 +0000 (UTC)
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
X-Inumbo-ID: 2e539b26-e933-4a77-aa20-838aba6066f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610638228;
  h=from:subject:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=awrFhGJH8YT/wGisz49euyGGqzyOWqpHa8xopkpbdE8=;
  b=MB7U1g0gXklVWYKvdYQSQHn5mULn7LIdOwCRHwnV77SC79Ue/FtzNdKw
   nrlMVN023J/oL9sUMbzz66DXkPdyjLGXjxJCzPA53HGo64pVDmHvB/Uel
   1JL4rSXygmQaePzWjfqCOuLl8EJo2s3nTgvtby2gT86w0X/uRIF5gYzS3
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GRO0lCI4QVeiOwkaj2fyg/fsVj+vzRsbWBnmB078hJCqe0V3aeZ1/MKQKfU5aN2Obcx1yPprPN
 VYVXLihJ9ktfGc1sILdLIX0hPVIeqi5+Yh8n+RnUBhJnl88HYl/Kp5X5dZzhAmo1Pvcc8Ersq3
 CpZ4/iL547uT+EkFgdGfpb3l+TiNnui5gB5U6o4N019hL5AzevKirUjgmlnIkP1L3sNEtKM0UJ
 4+ZCYgZzowfROXYVKS8nrYeVs7dcb2SpPnra+uSr4R9YOj3TPme2QD8no+9+3VE9iUCfEQd6lJ
 V2Y=
X-SBRS: 5.2
X-MesageID: 35083740
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35083740"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+KRl8MxHVHM+Z/HgVtAEFCT3H1YmDW6t70v9mqEnjQJT/MQSiALQ6dU4xP6MfyYOEI0wghxJZ8OnYc2xDFOYmpCxtviYy3A2JMPW4BsOBEZ0qbPlVGA0mv6xad7GuAfETtRo6qZ6CcqQUvkq4T+snk9p7zc3bXar5kaZ7IobET6gcy/JJn48pV/P9MjoKGlHQyJesNh3cuunuVHarsx0I2pEGVqCfNkDQzYLbhqSQpxJHJ06CCQb3k5oTKos4p+inlhwZTBLoti0c50D/R35imUDXLM9w3fDX4/THWiCwuPVS5GhBSqOtcGsyrqKURT7mCYAwBaTUsP5tgz7sVxtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncNNet4xyHdOK7B8MXAMYE66qwAWGPRpf7xuUEtwNmI=;
 b=oKiUKsVKHzhAf/5CdGCX72qrDKzBuPb71A43a7DTXkG0TrD9+YQNFQDdLnie45qUrs61tYz61SUbGmlJZ627knrD7KOzGV7kXuaH/8C1lCw7qFcjh/58fjnbhOTzmR4hh5S6dTvtbW7sHPwiJ7tp4Nj/IVG9oT5o7VI9W37jopBXsGtak9UDvH6NMvji4A4ydhivOW+G4YzintaI7K12bbT9wOt3yR9C+9OYcKLCIWzX/+FTmd1LhEjU4HmPMJHUrWfP+ZCRikXimbLEKbXjAMO1p+p+W+Zb53mPE7rVxb1QQ7nbcb3L/RXAi8smtRwOGRYWMVZD9Eeuu46qhZV1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncNNet4xyHdOK7B8MXAMYE66qwAWGPRpf7xuUEtwNmI=;
 b=cYaUby+la6CjZ3BBUgmcMjmcLZhsLH8wjhFVLf5GL0dpwEmLvGF7iVnXzfDQGbRaCuLkvR5RMgoAmeobF7r/Fbg+QL771u7bbEcttlat0K27wX0VNV+liNP4IUNEI0zFDhcm3Kd2Q8m34/cV8RNcmGAyWEgNYrMW/IQ43j5d5U4=
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] xen/dmalloc: Introduce dmalloc() APIs
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Tamas K
 Lengyel <tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-2-andrew.cooper3@citrix.com>
 <dffe4e97-e428-3785-7067-2ea19e9e34af@suse.com>
 <1cdbec15-4932-7a64-d45a-6cddb2b67e87@citrix.com>
 <fe88ce5f-7185-2a0b-67fb-c0344ef59683@suse.com>
Message-ID: <3377c545-2311-f7a7-ef25-f663cf3daa6a@citrix.com>
Date: Thu, 14 Jan 2021 15:30:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <fe88ce5f-7185-2a0b-67fb-c0344ef59683@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df9158da-da5e-4160-725f-08d8b8a14f85
X-MS-TrafficTypeDiagnostic: BYAPR03MB4773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4773EAE186C29D0FE73B8F26BAA80@BYAPR03MB4773.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohW8Pt1I9MhXok1Ll4f4ZqJIG/OiHn+LONwGCsUdT50h5O6b9mo0vVbAWoPNZkePPLJEv2itaaDphSDLMfxpAioMh4056nenmYYnk4At/SL92RL6wstVL4cb9tt0SUXbG+xxRGf9Gg4x2I6pPt+sxp4DReQPthfZG5kmVxW2ddhh8UL/oSDuAD5sGqyr+qIiJz997Eb3Mto/FGZa0tU4Sr9D/4ulXqaWT/v5NuO/bsB5FUtaQ5i3/gMgyaoebWdLpxxXf7D8IAuyTv+l9YwsU6DIFvteXhCZFn98fxR4cHGQWNkiNTSiSxZftBQ84nmNe0OnxlvcncebPqVUi5Gu6yzyx3WDNRF5ASgvUMnKhFmgvdQ+iYDYb9KmpqQlIrds+fDtV+LPYrPkK08jxAj5daSjzwAa5k72GoLeXqjG462RRQuJJZNaEKWsNPR/iERWciWHqVVNZ1rFnyxhjUWVFwDXVYx9H0opF6rviq8GhbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(66946007)(53546011)(66556008)(4326008)(66476007)(6916009)(36756003)(2906002)(478600001)(8936002)(86362001)(5660300002)(2616005)(6486002)(186003)(956004)(83380400001)(8676002)(16576012)(31696002)(316002)(54906003)(26005)(6666004)(31686004)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3FXaDA0T3RZSXBoWHlaa2x1VUJ4RlB0MTlxQWhxSmxKMGZ4V2ZlNWp0MVNH?=
 =?utf-8?B?NFhPYkVaNEgyQnoyNTdaS2VSbzdzMnAxWk1RcjZmQURmSWlDK282azBBRmV2?=
 =?utf-8?B?b1J1OFpncGFZUFNoZzYzYUUrN2xYenkyQjRzL0xoTktDQUpSQ0JJekZSeVFK?=
 =?utf-8?B?QVphTWZ1eS8rRTIwRmcyY2tBSk9WL0tvN1Qxa3E1MWpaTVpVTFlCcnRBMXZX?=
 =?utf-8?B?LzJxTUdWQ0UzdXgyengwa1kyMEVUMTBMWkg0RFdjeTdJRUw0Tzd3MVdzTjd2?=
 =?utf-8?B?dzYxWDN1ZElKVldNYlZSbXd1UGVZUC94eFZBZDNVRmlNTkZZUkVGeHYrY2hK?=
 =?utf-8?B?SFEvK3RsSmZkdFdCMmhXNUt5TjdTenNybDR2UGVwMzJtZVJENFBIRnZPSzJh?=
 =?utf-8?B?VUZnL1FZNnFvUkRrcnBkNlZrWnl3UlFIN3NxR3hYL2NmVXFlQUpXVlZVVGY5?=
 =?utf-8?B?eTk1SHVGOXdiNXQrL2lmY3YxRUNjUVVHR0czRUQ0bWNNU2tyM1pyK1BpYjNw?=
 =?utf-8?B?QVQ5QlpqUkFrUk5xYS9FMzRoUWJGNi8reW9xYU1VSVlIekR0K0hVYSsxVDh5?=
 =?utf-8?B?K0ptZGM3a25qY0dLV0RwaDFyemZrN3hHM3VlQU1xWFdJaVN6WUZzNTZFYUli?=
 =?utf-8?B?UU1JTm9QcVl5NmgyT09ybjNBUElFdnBEQlZIWUc2Vy8ycUc2czMyUXdQekdZ?=
 =?utf-8?B?MFRKRmxyOTBOLzN1eTZ3M3hvTS9jYkZCVm1yZXBaOGl6c3VSUkJ4SFUwWWNv?=
 =?utf-8?B?YlF0a2NlUUtyc0pYTFJvb1RKdlliZ0FpMU1sTTNvTExGSEdXcGRnakZVcjlJ?=
 =?utf-8?B?OGNidmY0R1htLzd1b0lWRDlJM0RLQ1hYVyt6MlUreEdJZ0JzY2c4eHJtTDJI?=
 =?utf-8?B?amRqdGZ4MzZkVE42aWh0Y1AwaHYvK2hSdzk2c3Z5cTMvcUxuUndNWTRLNTA3?=
 =?utf-8?B?cGsyWGdPeVVLazI3SkpvbDRFaHVRcFRGNmFDUkF5YythcXRIS1k1MS9FQ014?=
 =?utf-8?B?eGZKTjc4SW40d1RKbXc0QTV6b0pBWk5KaElLK3NzR2lzaXhuM0VHdm10bVpG?=
 =?utf-8?B?WjlRVEFQM3lYRVUxTEJsR0dmcjB6cVo4YjU1aHRCNTdSR3pIenR1SCtZeXQ5?=
 =?utf-8?B?UHZnaWQzQ1R2U3JzcVhXMDhzUEgxR0drcHBrNytiTmdrOW1NNWV4eVZjblJ0?=
 =?utf-8?B?L2t6bXZUeDNKVFhUZjIxUjFZSm1tMzZ1OXBSd1liQytLYkhtK0ZnQkVFcUxo?=
 =?utf-8?B?UW43NjZnakcwZmdSMVQrUk94TWl0UTRJNzJSYkNEVGdwMXVsQkxkTDJiODYr?=
 =?utf-8?Q?sYu0LEfavxBlRxkLbaO8DUzsUutckbQzh7?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 15:30:23.4587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: df9158da-da5e-4160-725f-08d8b8a14f85
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Awuw2Wt2cgKl9RdRXZnVT8rn3MPGe4/lMRjoamqaJSKHjr79i68XMaxJo1nwF91HA09RmI5ahmIYvWu7aBQl/L34iFchPR/32PildSzjTWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4773
X-OriginatorOrg: citrix.com

On 14/01/2021 10:14, Jan Beulich wrote:
> On 14.01.2021 00:16, Andrew Cooper wrote:
>> On 05/01/2021 15:56, Jan Beulich wrote:
>>> On 23.12.2020 17:34, Andrew Cooper wrote:
>>>> RFC:
>>>>  * This probably wants to be less fatal in release builds
>>> I'm not even convinced this wants to be a panic() in debug builds.
>> Any memory leak spotted by this is an XSA, except in the narrow case of
>> being due exclusively to a weird and non-default order of hypercalls.
>>
>> It absolutely needs to be something fatal in debug builds, for avoid
>> going unnoticed by testing.
> This is a perfectly valid position to take, but I'm afraid once
> again isn't the only possible one. Since I do routinely look at
> logs, I'm personally in favor of avoiding crashing the host
> even for debug builds. The more that I've had pretty bad fallout
> from crashes in the past, due to (afaict) bugs in a file system
> driver in Linux that persisted over a longer period of time.

By that logic, we should replace most assertions with printk()s.  The
only reason I didn't use assert in this patch is because the
backtrace/etc is totally useless (we're in an RCU callback).

No-one, not even you, reviews all the logs from OSSTest.  It's sometimes
hard enough to get anyone to look at the logs even when there are emails
saying "$X looks broken".

The point at which we can spot the resource leak is too late to leave a
zombie domain around (we've already removed the domain from the
domlist), and a printk() is not an acceptably robust way of signalling
the problem.  Any change in the wording will render detection useless,
and some testing scenarios (stress in particular) will manage to wrap
the console ring in short order which risks hiding all traces of the
problem.

We're talking about something which will only occur on staging for
ill-reviewed patches, along with a (hopefully) reliable test developers
can use themselves, *and* in due course, this test being run pre-push
when we sort out the Gitlab CI.

The bottom line is that making this fatal is the only way we have of
getting people to pay attention to the severity of the issue, and I
don't think it reasonable to hamper automated testing's ability to spot
these issues, simply because you believe you're better than average at
reading your log files.

~Andrew

