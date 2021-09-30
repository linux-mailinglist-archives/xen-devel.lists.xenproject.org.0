Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62441D41E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199385.353407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqBP-0002nX-S2; Thu, 30 Sep 2021 07:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199385.353407; Thu, 30 Sep 2021 07:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqBP-0002lk-Oz; Thu, 30 Sep 2021 07:08:43 +0000
Received: by outflank-mailman (input) for mailman id 199385;
 Thu, 30 Sep 2021 07:08:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVqBO-0002le-3g
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:08:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d36a45c-21bd-11ec-bd3d-12813bfff9fa;
 Thu, 30 Sep 2021 07:08:40 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-r5bIzi4iMwmn4-s-3bYUBQ-1; Thu, 30 Sep 2021 09:08:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 07:08:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 07:08:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0171.eurprd04.prod.outlook.com (2603:10a6:20b:331::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Thu, 30 Sep 2021 07:08:36 +0000
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
X-Inumbo-ID: 3d36a45c-21bd-11ec-bd3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632985719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhB/8Qr3CA60wYZIDezcYv3ARVU27hfmmIJBlqDkLWY=;
	b=Xf8V88xgJjwklv8EBOfYsRw6G6B/+nah89PJ3Sl5dS33OIlcvYE64NZ+t8RxRjxlT6QKsE
	1gdoq5uvsGTCh0GHHfh2a1d4p6sLtV9suW5TtN2sKR8aGRuCnt5afnYp9pL7mHU8s+2z0i
	BCXeqlB5FySQbqAkrt7CjgNofI9Beiw=
X-MC-Unique: r5bIzi4iMwmn4-s-3bYUBQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTNrSsMLlkze7zvkdGdRBs76fRrBagFu7W4fpVb5bES2QqHhE/LX3Su5qYymaIVlW8vcKRkSUwXlY1iQWML/udc5NJyXjxqtYtx7EFKZndMbDGuhXSW4hWTRxwrCg/V6H2NBU5yHGyj5ZTI/74Br0q3eS7JUZoKEmXy1C0SOMLdFB7/sjPMoZedvP8iB2ud4jGkrfebJKw/9zfF8mIwAe+LJUXTg785nvZDtjFD7txpEawpuRTSp8jjlojYQxaOrxZl6lL4dBdDfr6TMMCvvK934gB2DIf3iLqQHCLYja//+YQO4gG3cvddnJIFwupnnrHFzDSlPzl9ErwlTd0rR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FhB/8Qr3CA60wYZIDezcYv3ARVU27hfmmIJBlqDkLWY=;
 b=Mu+x2iJeOvQ6rlmkqJeNvz+1Ene+OkqGLINi63qHVtyqmmZbqqwIl5btkB+RPVhxlO8fA/8iyrbbDTDOF1hYP/1ffpZNzcOvsWRRHNeNgxrYlkaWG+G7HPlweXRlJ8/LjvGrLj4ss7GDgX+x0QifEmogodN0CQzan0G6pf2cmQ10bv/QtmAlXJV5ni7iRaqGfEh0FBIJH2fz8PUng1H/5Dre+Tex5mdJTwtY28E2jOILXSNjSZsIjEKGlbxq978xGTHAXaI3b27lDcgPL70RIpGQrBkMzMQ4MPYYPWYctKZXcS97siDWzu6sKGgMrP0GX8p6cTL/g8a+156rxEJqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Balloon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
 <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
 <YVD59QVbmdVwzYQI@mattapan.m5p.com>
 <033cc499-34de-d27a-7b1b-2a0a7ce38672@suse.com>
 <YVSGvGZc67ZLMdKm@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03052a89-cb51-250d-4fcd-b9d8ceb93e39@suse.com>
Date: Thu, 30 Sep 2021 09:08:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVSGvGZc67ZLMdKm@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0171.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7b687fd-8a82-453f-1cae-08d983e11f33
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469679E0CE1DDCE6306ED9DB3AA9@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgsq/LgcDKFl88x47WrxCIgP73vIZSwpu9FUAbawBRdzQSke0eJa7o2gjYJ3zMHqBrkXpLxU5DR+vsmK77TG4ZorSAv88k/snBY5O+sx4jWpERVeoFsEfWfQ7qouHZuWJwe6wYS8PkPw7qx4k/xPEKHQc+q2kfSjEqdlT2pwOVgtrglhLint+17pj+NYrj9+h9hOnUZ7E5ftJhptjUaU+z9T7Z5RYS94APfIhbBpA+RyJcEDTeJf0IwgPa7/sgaiJ8OtM95w3S12OEbh/r8qdyHBzh7x8lX4CLMXmIE8YzHr1QXa+JtcJLFEY4/OwstBkWyKCjAjA2avuWIWVEPOnzRTysmRufIyuKQXIbxPn/ZgIY8MttuAEPHvz1GzUAScvRdaGZGjI+QBeRBKaGj9PUBwEW+GoYZh/mFGguaFAYcpX9O8c2ssdisDuInPs0KMlMxWRsO11UhXchRDG/VOAuJQbYvVhcZtyf3o0mLUgG7hT+WpPnqqL0Uc+smW5oUbTinZghnJocmFm9V/5AB/h34zBbrWe0KhbZmPnwjk2ADevYYnxB9XjFDa8/XVDdd2v8IRVbL1OhFcTxqE/dW+LxJ4XW6te0z2V+rmF5S0n0wtx8Y/Hxy0smk+gzq2Bs4cyA6KjNL3erHkT55fWdqWF4er3s5wqs3J9ZOu9IGckImiL3Spo9MnmRbl9jX06RdXcSFaONWyO639+Ifv7fE2YfnQ6fZB4SVQJZqCOKJ8KE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(31686004)(26005)(31696002)(3480700007)(316002)(86362001)(8936002)(186003)(66476007)(66556008)(508600001)(6486002)(4326008)(2906002)(36756003)(16576012)(53546011)(5660300002)(83380400001)(8676002)(2616005)(38100700002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzRqemdwaTVlK3pIOVNCSTVtL0czRnZOb05hdHdSWGpmTFBManhJL3dkMC90?=
 =?utf-8?B?VkQvOTROa1B0YXptODdXdTg3RW1ybTJYN1E2ZmcwZXpLVG4zOEZ0WEZId0FN?=
 =?utf-8?B?L3JPNjlOODdxdnNQNXo0dUFSZVIxNVdvRndnbFZUNFdrdGZKUkNLWHlDQ3hv?=
 =?utf-8?B?RkNnOWVCcll3bXROb0h2V1dsbHRWZVBxL3FRR0JlSWF4K2luTldYL1JheHJQ?=
 =?utf-8?B?dkpFSUJJSnZsWGM4SkhzQ2J0Zy9TQnd4NFFxRHlrWWFmNHVwajlXMHBzaXZo?=
 =?utf-8?B?NDBQNHpnNldmVnJLbTRjZzFZUEUzcTRNT0p6M25Wbnd6RFp6WXV4ZUE0Z3lx?=
 =?utf-8?B?VVExUWV5Ykd3TkZTRksvODdaU1Q2T0REYWFuZ3FBUUNmaDVOLzRjUVFMOG9D?=
 =?utf-8?B?YWE5QVU0R2xUY1hsMEhpRlZmZHRHeEJQUlZETExSQ1ZjK2VGcXBVUy9lTSt1?=
 =?utf-8?B?UVNPSm9HM0VCYTQrbTdtbzZGUWJNTjVuckU1dFZWRXZOQmhmRURqM0VKTm81?=
 =?utf-8?B?QXdaMS9FSGR3TW03NmdiZEl4KzlEWndMRk1KbHVjaUhaRTRpc2lSZDlqNGxu?=
 =?utf-8?B?cmNBSW9QVmtjRlRZREtwVHhJdkwvbDBEanNCNVo5Y0ZzcTZxbjFuclZ4a2hV?=
 =?utf-8?B?Sno5VjRBcVhobDRGQUE4VmZWMlhyd015T0xGbG5oOEVXMVN6dmtrUXpaalR2?=
 =?utf-8?B?cDRDb2Z0WUQvb0Qva3NJKzBiaW5SNytHQUdIeDFMYjZhdm44WkJ6VXY1ZzdY?=
 =?utf-8?B?Qkx3WUFzWGNVM3dIaXN0dUVxQUNNWmw3SGZ3RnZIRDYwaVM0TXN4L3ppaGJ3?=
 =?utf-8?B?cXp1bWd3MVRKZjhLbzV6SDlsN0dqNndkeTN3RmtyU2kvdllGOGFGQmtNeWQ4?=
 =?utf-8?B?bGQxNmRtUzlMeHhuMzAvYndXa3NSNndlaVRJWklmSE1XSk5mY3NpeEVUa2dF?=
 =?utf-8?B?anB3aFZveEJxajZ1SFFiQWZ4WE1nSG1jdEI5ZW1HWFJEdUFORDlmckt4YUxm?=
 =?utf-8?B?QkdQR3Bvd1gvNURDSXBwWG4yNVZTRlRSaU5EYlJtZjQyRCsvYWdONDQ1VHhQ?=
 =?utf-8?B?VEgzNURhQitCSUdRK0lxVWpobzdnSUNRRzRBNkpDaE9YVSt5cUtHby8zYWVu?=
 =?utf-8?B?WFpOTVplaElCWVhIcDRhbFoycitPaDNEQVdXWXpVcGZKcGN0MFlodnNJd1k0?=
 =?utf-8?B?MDBCZDJxQzR6OW1sbVVvWFgvTXpsYzZYUnlyMUpnQ3pyZHFOd1RBOFJTTElI?=
 =?utf-8?B?aWdTMlhObDBCWTg2MUduT2NIYVR2WHpqVVBZU0RQMUVkSUhMSkJkRWtrR0ZZ?=
 =?utf-8?B?THBKd0syNWI1SEZwSFRqYTJDR25IQ1FDb2dtb1R3Vncvanlkcmt6a1pDeU1E?=
 =?utf-8?B?Z1VabVNaTmIwN3JjUDhGS1M4Y1ZGMmdULy82RmZyVmQwUDQvK2lDNWpWTlda?=
 =?utf-8?B?R1h6VVdNS0RacGpLY25rY1ZQdGZ2OFVaVlA4R1IyQ08xNzJQQVF3clpxZk1z?=
 =?utf-8?B?TGRlcmcrQ2V1VUo0bnZIY0wzM0tTNlJyTkR6d3ltTWJJU0R2TmpVcFEvK294?=
 =?utf-8?B?V3had1ZuMnFoelpmMmtlV3VQTGxGdVdDdUNGdytnUllzQ2xlb1E2Y1dsRWZr?=
 =?utf-8?B?V3JmV2JCUmlRR1lpYjQzUzNNeVBsanRzeVg1WU95YVNveFRDWTdSZVdhUFV0?=
 =?utf-8?B?RDFQUHBGTEx6VEJUSXg0cUppVFZ4Y3VIa1VkemxNa3IxQldRLzJSQStGVXhy?=
 =?utf-8?Q?vnndi4TQ6TFATnW1xk4qqwynO7f82G1L2EIlRp0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b687fd-8a82-453f-1cae-08d983e11f33
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:08:36.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ncEj701BNODAAyF60ODzANrcrxaMOT8D+AhOOQJExBhxRc3i7nNmbwNMX7LfkCavAWxiEX8XC5+8NfJD5ayFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 29.09.2021 17:31, Elliott Mitchell wrote:
> On Wed, Sep 29, 2021 at 03:32:15PM +0200, Jan Beulich wrote:
>> On 27.09.2021 00:53, Elliott Mitchell wrote:
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d0402e8be0>] R arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260
>>> (XEN)    [<ffff82d0402ec51c>] S p2m_flush_nestedp2m+0x1c/0x30
>>> (XEN)    [<ffff82d0402e0528>] S arch/x86/mm/hap/hap.c#hap_write_p2m_entry+0x378/0x490
>>
>> hap_write_p2m_entry() calling p2m_flush_nestedp2m() suggests that
>> nestedhvm_enabled() was true for the domain. While we will want to
>> fix this, nested virt is experimental (even in current staging),
>> and hence there at least is no security concern.
> 
> Copy and paste from the xl.cfg man page:
> 
>        nestedhvm=BOOLEAN
>            Enable or disables guest access to hardware virtualisation
>            features, e.g. it allows a guest Operating System to also function
>            as a hypervisor. You may want this option if you want to run
>            another hypervisor (including another copy of Xen) within a Xen
>            guest or to support a guest Operating System which uses hardware
>            virtualisation extensions (e.g. Windows XP compatibility mode on
>            more modern Windows OS).  This option is disabled by default.
> 
> "This option is disabled by default." doesn't mean "this is an
> experimental feature with no security support and is likely to crash the
> hypervisor".

Correct, but this isn't the only place to look at. Quoting
SUPPORT.md:

"### x86/Nested HVM

 This means providing hardware virtulization support to guest VMs
 allowing, for instance, a nested Xen to support both PV and HVM guests.
 It also implies support for other hypervisors,
 such as KVM, Hyper-V, Bromium, and so on as guests.

    Status, x86 HVM: Experimental"

And with an experimental feature you have to expect crashes, no matter
that we'd prefer if you wouldn't hit any.

>> Can you confirm that by leaving nested off you don't run into this
>> (or a similar) issue?
> 
> Hypervisor doesn't panic.  `xl dmesg` does end up with:
> 
> (XEN) p2m_pod_demand_populate: Dom72 out of PoD memory! (tot=524304 ents=28773031 dom72)
> (XEN) domain_crash called from p2m-pod.c:1233
> 
> Which is problematic.  maxmem for this domain is set to allow for trading
> memory around, so it is desireable for it to successfully load even when
> its maximum isn't available.

Yet that's still a configuration error (of the guest), not a bug in
Xen.

Thanks for confirming that the issue is nested-hvm related. I'm in the
process of putting together a draft fix, but I'm afraid there's a
bigger underlying issue, so I'm not convinced we would want to go with
that fix even if you were to find that it helps in your case.

Jan


