Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFB3A3C24
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 08:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140189.259082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrarN-0004hk-4u; Fri, 11 Jun 2021 06:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140189.259082; Fri, 11 Jun 2021 06:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrarN-0004ft-1Q; Fri, 11 Jun 2021 06:41:41 +0000
Received: by outflank-mailman (input) for mailman id 140189;
 Fri, 11 Jun 2021 06:41:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrarL-0004fn-Sl
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 06:41:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fb289a0-1694-43cb-9aec-c75ecf00e5a8;
 Fri, 11 Jun 2021 06:41:38 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-xqd0Q1zHP-yMY8HIjc9JOg-1; Fri, 11 Jun 2021 08:41:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 06:41:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 06:41:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Fri, 11 Jun 2021 06:41:33 +0000
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
X-Inumbo-ID: 5fb289a0-1694-43cb-9aec-c75ecf00e5a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623393697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObbI7/45YPQat7fozDagLx5gV6orzZ+yCBz+NPG1YyA=;
	b=PF5Jhr1D6TWHAMcrCrgU3kY3aFib4AfzHT1ICljHpg0joR30rjQjBPIrUvlBkp34/k7js5
	/QsOtgKKXvzhte02OSGhiR73HEQ5le4X1zEFu0RfChkNR5iGOTCE6T+wumhk02gPbY9QKY
	3RSA1Ga1tVT+/OJFskbDSkDt7MIZyQ0=
X-MC-Unique: xqd0Q1zHP-yMY8HIjc9JOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQ0LkItpcsHILgyZa4IG6gsQsVojfkt6Ntm118dFKTzg7Q4hIModKUsbACUTVa34sgfn+aKijHoRAIvIzYq9uyPA5X3WAG2/pW7OWAxTGdZN/1GtE/q4tYabg8QY0WHfBhGaNC54B8/XIj/XofMfbcb2nxu0bqPstLm0nW8S+Oxw8Sf6JjsHdq+m1wWU8pWs2xtl6SeTcfZLxd5zLyRPo3J0DT9L/VeS+mTfC+HzLQu3KI8Mod61U9kj+V1kRfB8gzRckx38p3Oy3oeRcykzQqy+yWeNYRKhFQ5cSEKySz7CNk0ZHQvDf7YlXZTb959cvVSI+5B+Mm7D2ZntdnHR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObbI7/45YPQat7fozDagLx5gV6orzZ+yCBz+NPG1YyA=;
 b=MTvTVHSkUnJ1OfJKcsYncS+iMwnUj+ceIcl+fIBaVFH6PcZ1p+VxMKWB/8fNhnqv1eQxBmZzGr+2dTrsd08MMFnIixrxql6eSDD3PojYNPRS2aGSVATMpTZWctv2KacKENIuR6L1xaw7OVWueI+Pzb2aPpGI8iNdGcRAtIO/Qa4AEgj1gCtg/g+4+0ntQ6dAqPpWH4OoEX9aoiN0yg6rb6aZ5UTw222p8RWIO8cYMPjYn6PFDiKMHGH3AC65l6S75CW4lqNtM89uaCSpjGHAdPM/YItGdxPsK/X3lVVlRvjDJAUxgdqMP49JIY+TF55eQHX7VR/a8Fcgve7qnbIVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable bisection] complete test-xtf-amd64-amd64-4
To: Ian Jackson <iwj@xenproject.org>
References: <E1lrWnM-0003Ul-QG@osstest.test-lab.xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fb151ef-e04a-f244-6c2a-5b562893a2a9@suse.com>
Date: Fri, 11 Jun 2021 08:41:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <E1lrWnM-0003Ul-QG@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb5a6889-08b6-4842-6f77-08d92ca3f438
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352899DEA3305A2010CA43AB3349@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WSlgIkXLxCWoLnP4haNxL6lgxzHIzODTJ5M+dO6Z54LyX/0TlLqPoIm6h+epesEyILWsukJrGIxJ59ia6xlMpQ7mOgctooKIJTtpNmTSNuCtFYH1k0vqVbGwVALQXXvd711fXd+69KflmouwFU5d9jF/vYKnLTUGtStrtG8g1w2p/NmieEnGYN+jOCV976Hcl71wLQ186wSWFzrSjeQ9xkmg+cmhD4PT+/lUBpjM0dz3mkbz/J3OgQXzMzazGj5LPXv5F0MZVUtipXP9w9MibfWfuZudKkZg8mqYLpfpJDmiQ0VRF9U8ej7MmSgJH44IkoeFwxXWJK8+ode69uNdG9rofGmHcGXW5qSE7fIcKEgTlLbrr+J7SJOb4k3Y4q9fYDud1L1kqjYFOrrjcPGzOIDgmqgPNRhTJ0/HGDV8EWViNex8ptNwNAWKfv1V5piaVWr2Fbdn5FV9/Xyc7fYASBrbegdfMlezPfJBQy/UHMEaScoflxc+lmd0GLC6IQGwkRdlHkjuMMWhZDNyWc2Y5hZPSmRd9Dy7XcAGfTs+lLlvpT4KqpPpoT+J/O4YKKU8q++RJmYWnHpgJFQh+LqPW0oOzSGRx6Hs8N7rdtQSG2IbeQCaSLa0ncIcWHw7KDrlTuK+ddFdUiJU0D0CrI2zDjpBDHilCwgg3LUTH3dwIBi76tas2XBFBq+zvLtHvwuhfh4z//ISY7UN5kShlj+7V2LWxEbQfRnzGzZqjLqOQqWARb4ct++3v7YKHv3tfPBKimaSsE4TkYMTsnzgoqsao8jfb2CSFvUg1GLQwXoxwbYae0ccj3E5s81ku59eqnp/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(376002)(346002)(396003)(366004)(6486002)(83380400001)(38100700002)(2906002)(26005)(8936002)(4326008)(956004)(36756003)(2616005)(316002)(31696002)(86362001)(16576012)(53546011)(16526019)(478600001)(8676002)(186003)(966005)(6916009)(66946007)(66476007)(66556008)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHFSd1BjamVSbVJvWHlEeitZNUN3aWJxWUsxVmJodm1nSXFVTEFxUlN6b256?=
 =?utf-8?B?dmFTT3NvakhpYWVLeTl0clN2aHJRWFIxSkVaUWF3aHF5K3R5SUk3cTVDQWJ4?=
 =?utf-8?B?NU9mSW9LMVI3UE5rMnAxQ0IrQnZtNmUvdEJtcDRjWHNoV08rZmx2bnNzMVdC?=
 =?utf-8?B?YU1wZitVWGx2OE8zcG1PbjlmcWxoanhKbUtBeWkvN0J5c1U3MEpKbU5ORWtI?=
 =?utf-8?B?aWkwM2RqRXB3T1BlbkVqbXpKNWJtUEdhMXRWYjMvZDBDQUM0VjJOcnFkalRt?=
 =?utf-8?B?dmhuWXR5bGJFdHh0aHliMmlGOXhMZk5IaFBoZGJKWnk3d0djODhOaG9uSHUr?=
 =?utf-8?B?VVB6Y0hDdExuMmcvbTBHbEVVZ1VTWjdBR1dDdlFOSUhzc0NtUEtJVkVoNlJR?=
 =?utf-8?B?bXMxWlVrcHl1S1EycUFVNmk4RkRtNzVHQkFKTU9mOG1WWXZRbFZDQ0xLMHVT?=
 =?utf-8?B?MHR1MG15Y0wwb3dqdW9WUGVvcitNUXJLd240RmJaYzVtMTJ0WjRpYVR0T0s4?=
 =?utf-8?B?UUl1MDJ1ajlMUmNkeGJhbnQ1YUlPMDRiZ2J5eVJobFhpSG1xMlk4UDBBVUsy?=
 =?utf-8?B?QTd3MXNiTUoyWHdpT0pobzYwK0tJL1FOR1pxT1Y3aHRNbnh4NnFLZldSMlIw?=
 =?utf-8?B?L0NHd3VnWktTdnNVSUNubTZoVlhEbDlDVFBQK3dTRFY4U2diQnFDZkY1eXh1?=
 =?utf-8?B?WXFyUjVyb05vY1JTdEtWSk5jOFU2dFZoZGJjcG45Qnp3ZjU0eGxybzFnSEh6?=
 =?utf-8?B?MHFSOTBBWUJWTFl0dlhQUlZkRUg4SjdWRGlPaStqU2hlRW93eWNQbUIwbGpa?=
 =?utf-8?B?UDlCcVhWQU45aFdkWUVHQkdVSHNCQmR3QUUvS2VmbXkzb3M4aUt6ZWZJY1JZ?=
 =?utf-8?B?Q2xQMGxDU3NKRER6T2xoZ0NtRnMrOEYzTDdpekJyNElNTHg2ZFNQUG5uMjdF?=
 =?utf-8?B?SktncUhRQ285UnFmTW5lK3NKSlhKRHI5YzBVWWk1WFVLa2liUEVhcmlpWU9C?=
 =?utf-8?B?WisvRVdwUGVIY0NDYjJvYk9vTGVmTE00bzRjdEVKeHJtYUxoeUlBaWpDRUdJ?=
 =?utf-8?B?bS9tUzlEdXRxcEMwTWtjUTh4OWRUcEx3M0ZtQjl5bU9FVVd4NXVaZEc1bTE3?=
 =?utf-8?B?bXpnVVRKcHNaUDBjWmdZOFRBdzY5Rmlta24zcXZsV2dBTHBMRGZxdGl4SzUy?=
 =?utf-8?B?ZERIaXk0WUJqWkdxMTdHSldBaWRaSUJzejFmZlNlQk5rODNHOWNlQmNjTXdE?=
 =?utf-8?B?aXFNbTdGaEtkV0RmZHhtTlcxdTM3WEFrVmlLbm95TGpYdzh0MnRGOXZ5czhi?=
 =?utf-8?B?aTBUMEM3NVlHbXNMNkFndkZINDVkelhWV0FVaWJ1Zk1tQ09Oejlvb0prZGNq?=
 =?utf-8?B?dVpzRk5oeUVEVFU1a25DWE9mbm5OeEhyejYyeVFjMG5hdDVROURYNHVUMmVM?=
 =?utf-8?B?QUVRTTNGMWJkMlUvNU9FTHFnR2R3eW15WnpYWVpZUUkvL0xVNVdIRHMrTjF0?=
 =?utf-8?B?cWVsSDdQUXhJK09IakhKZ1hkajZKcnRQNlRJZ3ZZNytNanRIUER2L1UyeDVv?=
 =?utf-8?B?NVlJamNGVnBzbzRXWlJ4OHoxZlVPN1BmZG1mSmJncnNWUjNqR09FRkdqR29w?=
 =?utf-8?B?ZDFSZHh2UlBpVGNtK3M1VHVWVk9CdWRTTnAwTlVCTm9pQnpCb2NhK0g2TjdP?=
 =?utf-8?B?c3hjU2xKS0FpeFNHcS8vbkh6cTdsRjAwMGZQY1Z2VmNPMHFUMWlvMWEwdnEr?=
 =?utf-8?Q?tedIvI0j6eleLzK7KEg201Fray5DSb3szTtDN4w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5a6889-08b6-4842-6f77-08d92ca3f438
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 06:41:34.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyyQiXkjMfxgdp23N68bhGi6z0rTg8V8cJYoeFm51D6aymoZQiEl6IM8VXZgF/y7gGc24RRKigO0XQbbopC4Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

Ian,

On 11.06.2021 04:21, osstest service owner wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-xtf-amd64-amd64-4
> testid xtf/test-pv32pae-selftest
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
> Tree: xtf git://xenbits.xen.org/xtf.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  1a0f2fe2297d122a08fee2b26de5de995fdeca13
>   Bug not present: 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162627/
> 
> 
>   commit 1a0f2fe2297d122a08fee2b26de5de995fdeca13
>   Author: George Dunlap <george.dunlap@citrix.com>
>   Date:   Thu May 6 13:38:02 2021 +0100
>   
>       SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported
>       
>       The support status of 32-bit guests doesn't seem particularly useful.
>       
>       With it changed to fully unsupported outside of PV-shim, adjust the PV32
>       Kconfig default accordingly.
>       
>       Reported-by: Jann Horn <jannh@google.com>
>       Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>       Signed-off-by: Jan Beulich <jbeulich@suse.com>

as indicated upfront, and as now also confirmed by the large amount of
failures in the two most recent full unstable flights, our defaulting
to off of PV32 for non-shim Xen builds means in osstest PV32 needs to
be turned on again, or all the 32-bit PV Dom0 / DomU tests (and xtf
equivalents) would need to be disabled. This will eventually be needed
on all branches which we would backport this change to (I expect this
would be at least all fully maintained ones), and which have a PV32
setting (exists only as of 4.14).

As I don't expect disabling any tests is a reasonable course of action,
I think it's going to need to be the .config override. Could you please
arrange for this?

Jan


