Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930213152B3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83282.154567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Us9-0006rx-9W; Tue, 09 Feb 2021 15:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83282.154567; Tue, 09 Feb 2021 15:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Us9-0006rW-5K; Tue, 09 Feb 2021 15:24:13 +0000
Received: by outflank-mailman (input) for mailman id 83282;
 Tue, 09 Feb 2021 15:24:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2YR=HL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9Us7-0006rR-Ln
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:24:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fb090c6-1f85-413d-8a7c-95f85362d838;
 Tue, 09 Feb 2021 15:24:10 +0000 (UTC)
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
X-Inumbo-ID: 1fb090c6-1f85-413d-8a7c-95f85362d838
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612884250;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5b0dwn9pswPkwah+l5lRFyOp1xbIXcc/MDq+HGqrHlY=;
  b=LJGpUC755HaOhCK09wpEOT1uoX8D22K04IgDZu3/9NIHEfrWGiBS8PVF
   ttjUoWPEXkKdRsI+Ky4rFjOiZIb6s/1kDMKV/ADthfw65iCqwqHZEV1LI
   8SKywfMuwllZ8AEpbEODlXKa8c6SCmvM/h2NbaxjQ/dEzo8hE2Gdou8Bl
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vLE7AGnVPzj1iO3iSJyMVmtmxpAuofefivjs8zk34hsU9dSJCQ4wlK6ETNYHOL7LMVWRj+dgYQ
 +fpw7Mf8V2zWi1cjnCjVA69HlWbyRRENLLnMiMas1Agf1R3UqBfxkOPupn+1IX/XNAo4gw85f1
 z4ZVYYD+LqKs3qB38Mpq766y1my1EjcSawh39bd130mKy2tJosrTrG2gGdK9Wk340NWYUquQoj
 pAIxy9VYv6NtKJmwjFSTpAI8d+EGZkUclNcXVb3AJix28R4qiKRAc56L7RSVxlvFlgYWk6Ovip
 l1I=
X-SBRS: 5.2
X-MesageID: 38222665
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="38222665"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQ+WDk5p/xbqJMuFjLqkQw7FgyZVQjhc9LwSC9cvW55VVJlaG5/rLPJqiDl9vkTaWMl9ZR5fZ4Kzu658/o6VSAW8+vxyvyscznRR5S/6fF1N6u8EZbJeqh3dIZtt9iUVx/BODl06MrkmdkH4aSZfFp+ONu63J8b9Lco0Bl78wT2w5am0Hi66+D4MkmHHop/Iwc8bHPehRW4uqhRIqY3NAssjolNZW6BGUjkssrSkRtrXclFzyg8jTxW6yg6s8cu5vNeXaUywAxbZi63CU3Bh4y+p6Bf7KMJu00GL7Mlxp7T7Xj65SquEo4zPWtrgny8+NI9Di4anojdBq+xQKjt8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8O2/S5CF5RmqGA34mAkw1tXkAfl66NNjHoTE0U6S1s=;
 b=UaXNahui+gxHzd2N3GZg1WP8g+jFa19nG4n9ypvVhTpnOkGLRCNAGlRm8XmP9I7iZm+cKzuYx4sZb5jqzqD2JCaCmbFYQKITv7CWRW6kG0G155E4Rjisa4WKpY9ynMA1Tm2Xv67qi8KCdFPhQmmmzWHdcxAyQmk+r0GprPsIQRlX5ozdNJKECVn9tdJA6pILcc6mdI2j/Oz/bVGKv5eq4ixi/Y+GOL+DnWJiF5x9wK2IU8+necYBJcMKvw5gla8CwoFXkMGXOvWAEccv1kIsGADa9DAuWS60lJT9TRNGl6m92QmbGUqXUM2NfKTToua+dkMZvJlRPAw7eUb5/Qdo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8O2/S5CF5RmqGA34mAkw1tXkAfl66NNjHoTE0U6S1s=;
 b=qD9rVzlRLzPP9NwaJ4raYAoxEaVJlYKO/P1CQzOUCJctlcFqYW3e5ehLK0WhoFbFWhwB2hOq64IpKhnsTEfiv35/q/Gtf5FqD1g2dOem3gQRZqO4bippm0GgrX1LVTabrce6OQbm5ISDyAHQhdmsL2q27Nm9ltnJ2JLVfJwQX4M=
Date: Tue, 9 Feb 2021 16:23:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
Message-ID: <YCKpC1IgLuscSFK3@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YB1nhBeMRVGyO8Fk@Air-de-Roger>
 <d23dc40c-3b37-ade2-f987-4f79b06901b1@suse.com>
 <YB1v60CuOdhxFwNy@Air-de-Roger>
 <199d2681-9704-8804-d3c3-d8ad24fca137@suse.com>
 <YCKJLbaTzD6YF/g5@Air-de-Roger>
 <1cf476b9-4ac1-9a12-7fdb-c898f02532f7@suse.com>
 <YCKgPro1yTtSSnLQ@Air-de-Roger>
 <e86040e7-0c16-00c8-9b01-eac9b928ddc2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e86040e7-0c16-00c8-9b01-eac9b928ddc2@suse.com>
X-ClientProxiedBy: MRXP264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8188be57-c6b5-457e-a62f-08d8cd0ebe0a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4137:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB41375067B26D7A9034244B118F8E9@DM6PR03MB4137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1A/ZR1/Z+2uwE8tWcFLreTrprdSjFz1jhLaWCHCefaqmsJCaxUdwcogojZHMIrX8mZY/8duQyMlyVTcYvN3st//eVnxAvqhK+kaq9RpglLgKOHqUqJYz7uRb4Gtpw1XiVex8Br2hEVT7d7EnVmPdemKLm0U0pOfX7Cckjy4QS7ZyVVbanVKBUWLwDoCASvvDqhLDtgYBYkGshXbA/OcgNOfY8nDQjqw+4URiXHvLyCL/YbCcv4duLyfkBDaMLkeEzCiUgHHFfKz/B71rb4/ryKFWwFCH0ejadqMbxY2pphcse5GO7cDvVMZV5cr2WTo1NTFbHtZXbqIuHwZaNOQgs+SP7cXJAmEhXyfKXyQAhjFQ+AN9Q/ca0OB1nLu6ogwE6Iab1fy16qAucudvhkYVuoySLaRUjsV8xCvvY/wH6XlC5RH/8DYP2tmAxXR7RgynDZLa/W4ladJucoODqGKd5ohs2HBfOJwzCgRfUduBdP839gaL9bova4R5WAlJX+Qt2uixJjwoQ5cedv0cBt83nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(6486002)(54906003)(66476007)(66556008)(956004)(66946007)(8936002)(9686003)(85182001)(4326008)(5660300002)(86362001)(6916009)(8676002)(2906002)(6496006)(4744005)(186003)(26005)(316002)(478600001)(33716001)(6666004)(83380400001)(107886003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mmt6WkpNOWgrcmN6Ujc1RFBpS2dGR1k1WjBFUzZGSWtTUnpkRm45QXNxWmdo?=
 =?utf-8?B?RzhibzhhdmxLRU53dVRGU3pHNkl2RFVpdFBMTnBhUXdKK3ZTYnJVZWljajhi?=
 =?utf-8?B?RFNPeVVhejZnUXc4dVVwMVZBZUpMeWtyb3NQalFSVkdWNHFRQmgrNVVsdHpx?=
 =?utf-8?B?UlVwb0JubW16OFdCVUxHQkFPMWxvVjdoV2hCZTM1ZXFMaXhkZHhBRVNjOEV1?=
 =?utf-8?B?RForSTBHNnpIODVlbHVZdWQ2cnFTV2kvQS9BdnZPM2lKOWVDUElncWQ0NWxy?=
 =?utf-8?B?SnhEQjBTWTdSZVlvelNES2c0RHF4YnQ4NVB5RFhYbVVCU2FPcFJXMWIycDRX?=
 =?utf-8?B?NTduKzdHZE54bHdiWGY0ekVXVndLWC82dEZsNUZFWVFNcVZtd2FsNjhsV0o1?=
 =?utf-8?B?MWYxMGJlTDNLSXVReExIejVsYzI5eEtJbWVOVXI3cDNqVHBZU05MK1BZN3ov?=
 =?utf-8?B?V0l1Vk9HeThtU3YrOXRHSU1DYXlCRU83RkY5UGsyZGEydjM2NDdoMDJlQjdY?=
 =?utf-8?B?RjlaZGFocndHUjlJYlN3ckpoaUJnR2xSajNHNWoyWjd5b3N6TjBLb0ZsdjRM?=
 =?utf-8?B?b213b2dSc281VzMyWWRPS1Q1NzhtYWpxbERCa2Jzbm5xWTl3NXQ3MmJuR1p4?=
 =?utf-8?B?UUg2NzU3ci9kbG9Hb21ZZERPcWdqRVdmUGxYa3NFYzRpaVFTVzFUZExqbjND?=
 =?utf-8?B?RjhvS29ubFQycjZUazBsODAvTnQyL2lnQUFPZS8zTUp0ZG4zWGNBeEJhVHZv?=
 =?utf-8?B?LzBFZ1J0UlJjRGJPZlBHcUNDcDh0U092RjQ2V2NxU2hwREdXZC9kRWt0cFhB?=
 =?utf-8?B?WTY3VW51MzRRMUVjQVI4QUZTS1c0bk5PZE5zaE5BOHdzWDVmNHlGa0hueUM4?=
 =?utf-8?B?Wms5TkwvcWt0S1BVVFJ0OC9GenZFZGFVSVJKb3k0bG9tcW94NUxFaXh3SkFJ?=
 =?utf-8?B?S2pUOWU4dWI3Yy8ybUE0TVJTU3VHL0x4YVA2MVRPOGlScUJPVk84MlVIOExx?=
 =?utf-8?B?TnZCNTZwZnBSOGhDcjRJK3BLSDh6aTZVbDR0eGZLMUlybE5nMUFqL3pPRXNy?=
 =?utf-8?B?cWZWem84QTF1MGZzSXoxWStCcnFDQ2dST3VpdUdMMmhRS1puVmJHMWp6M2F2?=
 =?utf-8?B?dzMxUnN6QUhHVTg3MnhXbUcrWDBxbVNZbm5lT1F6dEYva3Z3VVAvWkY1Vm42?=
 =?utf-8?B?TXVpdWhQVThjelVmNGFrT01sZllOMWxrLzFnWUZpa3BuYmpHeDRlYk1LRE1Z?=
 =?utf-8?B?S1ByY3FuUWdEZmk2VUJpS245LzNjcnQ4RTM1dXRqK2hmc2VKQTUrRkNMMkg4?=
 =?utf-8?B?SHR2dGZwK09rVkNYMUhmSkgvN0FCSVlSL2oxUWoyTEl1VE1DQUhGenBqdGk1?=
 =?utf-8?B?Vy91OUQ4d1d2STJERzcrazQ2M3Zxako1Z2pSYVFkeWN3RHFINFJ5RVQ0djIv?=
 =?utf-8?B?dVB4NHgrWGZ1R0tQb0JVV0daUXVyRGJGd2ZMeE51cTNsNHpaRTdhZkVRbThX?=
 =?utf-8?B?cWF2NG9CbWI0TjBpZDgvMlZiTVNhajF2SEJQNEhwMVJ5U3J4RDJtQnY1RTcx?=
 =?utf-8?B?MmtpTnRNSGNXaktrazdaY1dicU5iVVdldUh0NU8raVJ6MlJCSmdmNDhqaitR?=
 =?utf-8?B?TmE3UXRRakR1eEpsei90S2Mvb1F5UmViRFRWaWR1amU1TU5UVVRZUThOMTFJ?=
 =?utf-8?B?cm5TdDNNS2NnYVlUYkhTZ2dwVjQxaHFnbktzSlMxNjJ0RkdVSEtVZEw1VHZ3?=
 =?utf-8?Q?hqdVS/gXAbImaxuQims/Sy1YaxvdyHCupkFSJvN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8188be57-c6b5-457e-a62f-08d8cd0ebe0a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 15:24:07.6730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWoQyCun5Oq2Iwz+tSxker6cJB8hAJyPu0BCnnQaklI5C8fP2/H044oirOxu2Rya3oNGGw1l0I7lymabYgm2pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4137
X-OriginatorOrg: citrix.com

On Tue, Feb 09, 2021 at 03:57:22PM +0100, Jan Beulich wrote:
> I did change the paragraph to read
> 
> The "guest" variants are intended to work with (potentially) fully guest
> controlled addresses, while the "unsafe" variants are intended to be
> used in order to access addresses not (directly) under guest control,
> within Xen's part of virtual address space. (For linear page table and
> descriptor table accesses the low bits of the addresses may still be
> guest controlled, but this still won't allow speculation to "escape"
> into unwanted areas.) Subsequently we will want them to have distinct
> behavior, so as first step identify which one is which. For now, both
> groups of constructs alias one another.
> 
> earlier today. Is this clear enough? Relevant parts I've also mirrored
> into patch 3's description?

Yes, that does indeed seem clearer, thanks.

Roger.

