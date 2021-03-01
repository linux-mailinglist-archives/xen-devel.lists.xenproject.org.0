Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0BC3287D2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91845.173343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmN9-0001fT-RP; Mon, 01 Mar 2021 17:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91845.173343; Mon, 01 Mar 2021 17:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmN9-0001f4-Nx; Mon, 01 Mar 2021 17:30:19 +0000
Received: by outflank-mailman (input) for mailman id 91845;
 Mon, 01 Mar 2021 17:30:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGmN7-0001ey-9s
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:30:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e9c89c6-9e0e-4b8c-af53-2761d26f755b;
 Mon, 01 Mar 2021 17:30:16 +0000 (UTC)
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
X-Inumbo-ID: 0e9c89c6-9e0e-4b8c-af53-2761d26f755b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614619816;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lR/HYCIecE6kf2pG3OiqtR694KCh+SeXFHj7wbqsah0=;
  b=EZaf1t046eRJhVA/EVPqKvvsxuH2M9b4GxLWCRaCgWMD5jg0LTmhWlPe
   xk0AHHywnRvdDk8mtpRo1+4QT9JCGpnsICZ/jw89VxbXzHpKHfwEC2//Z
   BMfYIAqTMkLSNHPIc4RBZc90IcOOjHYYxLNhOZ058YpxCVgFB5e/92BQi
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l1h6jFfLfxf5qBGBHLppmhL/2BFanr6MYrqn1zG7TcvGN4JhMmL+g54cThvP48ja/cVfhB4j9p
 9cEjP52gMkO9c2Xsr8oL5ZOFVtnFtRhYhUvD45RrVhn1ca4jZB+j6zLtjycgEj9Fv6Jcqv59i0
 Vyv4xFi8FlypsXW9ojPlyAQ2lq7n35yt69IxNnzq4x8AfrzBnc4UYnVCHNmj+0gZkJinCGqZV9
 KEdMI1yBN4GMyZ4+WtSETIH+53swlUWlbtMzBjEvvhv0lF1g1UdViX5MHs5NlNgF84IVBcMhM2
 2C8=
X-SBRS: 5.2
X-MesageID: 38632535
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38632535"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCrk13pYIE+QoRoWAsNpgToWQfDcB1KY3/JioEuZVmmF+/AM9F7q4hi/XrRmcHGtWsW2XnTCq9INs/PCMngn7de1sw1iQMMk9+tAFPRurVCoeAfWXbS81HJg0f2gUj2i6FNqq/XZJx0SfNZAAtRZjuwwyGjj6XGv6Uj04pmPEt3Zz/3eEIeO5rQBFPljm3PoyQnS++QXlv8ytO5crKYV01uJ6RAyehlTYgQ154Gx4zwmnjzV9VDPPIcfBx81aUccX9rIFnKbFPTnUEtk4jpY/McsEyvsnlzrfyjwNKQSCeQAAnSqKWeH9S0BmoA8TQwpG+3VucNBb0bGEPFW1kmjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qEcyVjdWqgAXa3p4YmBkzcGUrlehgofx17zUGsZcdA=;
 b=I1pEDjx9jKWjKdHDNzMAtkrxiO6A7L7/gM71KRFqqja8Qh9oH9RwOJF7G8UoedgApg6tTkqAN2jEHQ27KIl+vLKtYoB9Mxy3BLFg+5FXGWQMFCMZtXC14mupSBDSEMjNs/nh2fTEY/Ipaq13VEL7aG5ze+TgjApovOtY+X/cnRKpW4Pik8qPGtVxO6TfowBdTkOaoDwsOfPAUznolbAgNgEFfJPFATGdQJmcLzCY4U6c2NAIkEdG0TCmcDidCUwuN3BuKom7CcPMUUDze4dnS8wUFU4DkdaqHc3lPdqr0uynVzBtvICMIR/+L2Tcn2kD0ub9zXrG0MrZRUuX/8SMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qEcyVjdWqgAXa3p4YmBkzcGUrlehgofx17zUGsZcdA=;
 b=kF0vZaVFPPINxKCuox5biSoVNEbTkVbx7p1Et8MpW/BCxjSYQpA0EiJVTMlhzk9DLeafGNYn8UNLZmKfFINcvmRol2M9MIU79bWJWlaqLJ0dzVWZf+8mmKSrM4GGCPFmLsSq5SXg0ECkqrgpbjzH6gMK8HgoXbAg2qt/1XIEJkI=
Subject: Re: [PATCH for-4.15 0/3] tools: ABI checking
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e2d81689-59c9-db9f-48ea-5498bd05764a@citrix.com>
Date: Mon, 1 Mar 2021 17:30:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210301170044.23295-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de85a261-c26e-43ca-e978-08d8dcd7ab7a
X-MS-TrafficTypeDiagnostic: BY5PR03MB5047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5047FDF829817D9B1F5FE953BA9A9@BY5PR03MB5047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8T/dEebbDFX3QJ8ujfIl/5EQz8q3WFAQHexVN6kJvapjd9NudYEFNORfWqVskTkHn9MFyK8/5pTePsFKRmaEWgIuHNI4F7zlA+8dVqgDBcTLshDeprbHxUXB9iYuKtfZajiieKQx4i/XdJceQQOCE/mZnS8XcC4odkZffp69gH5ENMH5bKvuJ5UOt2R1kqqq8kZPec2ThAgc1zqnoLOf8XjFAR6665089oiD9LYssVYAvnM6+j2GryNDNJw8yVwoLRPqOhn7wf1Y7xEZriZcP4m7kdiYvnxVAnvZZ3nx9JzJBf0TqBcvZ1lD37wH4/1ZgcpqiE4HNkit4Hy1jaqUifH84YVaV5sDLdHufdSThcWQ5WVvFYkGBeNK8L96zs1wsNNP6MHBizEPfz8Y3aLLo07AvKnXirFdaECFD+JpKsCrmHhQQ6+5mJrnpIa0UDUgiHAO/MXycl9747UkoM7MbBmwOrViulAYwFy/g4k5m9dsyURNYD+2FylZJzgpRpk3vE5lY3MiGmljvhFezt9O7ZSnZKzmuJdilagH+RI4fhujI1XLBEkFyzWhAAeAU7exL33FG2DaVWBD851yGj6d5BEHchtfth7g8/p1qciTYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(2616005)(6666004)(5660300002)(53546011)(66476007)(16576012)(956004)(316002)(31686004)(4744005)(54906003)(66946007)(86362001)(66556008)(26005)(31696002)(6486002)(6916009)(36756003)(8936002)(2906002)(4326008)(186003)(16526019)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEdackQvblJIcTNrUTEwUjZFY3pDVUErNTVJOEdydUdONVZhQU5QK1hBRUZn?=
 =?utf-8?B?cXRBaXZ3QmMxS0JrcjRYSEluZXVlK3pFN0NNYUdVcVh6aXEzanBhNWoyVTYr?=
 =?utf-8?B?cGt1blZOT3VqREpHbE9qTEwzQnFTK1YzbEtDajV5RnZxQmFjU283WWNqMlFH?=
 =?utf-8?B?OUJScHdyejQ5RkREUjFieDhKQmlOTG8zQ2dFaEs2ek5lY3hYVmlzUVdtWmNp?=
 =?utf-8?B?QjZJT3cvbUNiVGRrcFgzQVJucjNuTituRGZaR2ttaWkzM2w4U2FVT2cvQU5H?=
 =?utf-8?B?eVFXUVR0cWlqUU9NNStaVUJ3b3o3NDkxVW9veHBIR1RsWGl2bkQzTnVFN3U2?=
 =?utf-8?B?VGtEME5hSTdsM2xCWmtycCt4YmV2R0g4dzFmd3hxTWxpRzFCZ3M2OG84SEJi?=
 =?utf-8?B?RnRSbk14TnFyVjdCdFh6U1loOEZKVE5CQjB0WVZIdHBmK2FmL3hzRlN1V3Rw?=
 =?utf-8?B?b2s0RkExcVBEazJhNENGK2hydkpXbTRrSWk5RkUzMXJub0FGYmI4QVNuQjY0?=
 =?utf-8?B?bHF5RDRlTHBsbTRSV3g0NHNRS0p5T1IxdjE1OW9uZDlhNjhBemR3b1lrc2Vw?=
 =?utf-8?B?LzllMEJCbjZRWWMyRDBEOGVkdUNmb3o5WUFKaVIrcWdSSUk1UGloT0s3OG9G?=
 =?utf-8?B?T2E1cVVkN3FQRUtMWlBrRlF2ZCtqbi9mYjNUWXBZQkZpVUtqYzJ3Y0RzditO?=
 =?utf-8?B?ekpWcHp4TU1oK2Z1SFkwOEdyLy9seGJOWEY2QVNyN0RZbE1IaU5VY2h5Q0ls?=
 =?utf-8?B?OWUrci9YcysxbmxpLzFMRGxMdis3RjAxblVmVWhhdlJnSWMyNk93aGRIbldj?=
 =?utf-8?B?bnFjaXhwNXpiVzQva1pqZVczNi9vdGhyOXBqVXRiMVMzVnMzWVlCZnMxT2RO?=
 =?utf-8?B?OXAweE0wMThZRUFtOXhiTklGWEt0dTdSc1YwNnR3QzE0dG1lV2xkNW05VW90?=
 =?utf-8?B?QUtRTk5OUllpUkdVQi9hNFh4VVB2N3VsM0NYWkZGQW80ZWhSaXl1REdwMy9w?=
 =?utf-8?B?OVU5akFTV2VMcFh5OTFVZjRoS2kyK2haREZ4VVhlTHNYYll3QVFmc1JhQS9G?=
 =?utf-8?B?aVVFNFdKSkxKOSt1L0RpaXQwMVM4d0hlMDVraWExNWovaW5RTU1XMWhWM0RZ?=
 =?utf-8?B?VldJYXlwL1VSam5DZlU5Ry9zQXJabGYwMTRCbitIS1NKWmRNRkdCbjNCc0ZT?=
 =?utf-8?B?NWlzYzJaQnJMYmtFNDd2OGdWdDJOWEN5d1Rsa1hXcGV6MndEZ1BOM2lrWEdG?=
 =?utf-8?B?WnBWZTRWVGk2MG40UWlGYlJsSGtiOWh3cTRNSGpkZmtFWGgvbGhDVmp3OUxC?=
 =?utf-8?B?VTVJWWVyeDArc3NudjZOdVBOdEdHcU02MWJRMHlwT2crKzZTRDJMQ3FVN1d4?=
 =?utf-8?B?YXpjK05oeXg5aHYyUmxQZVlNVHRuZjUzUUtROUZJbDFYL3dQWlRuU28ra1NZ?=
 =?utf-8?B?UDNSWnB3N1lXN0ZOQjhhblZpRDNsNmJsQXFiZThpZ09CZVYybktSOEUrL0hq?=
 =?utf-8?B?UFBQUDVGRFJxYndKS2djTlp2SWtxdnBPamlKdE8vbUdmaXFjY1poS0dNSG1w?=
 =?utf-8?B?alhxbDFZZ1F2KzROSUk3OExFZWlnMHgyaElib1RjL25Hd2cwMjBrZXlzeC81?=
 =?utf-8?B?UkdYOWJGS21XREphdnpiRWpLWHYyS2dKclpCbGFuMDIwdzcvY2JELytmcEdP?=
 =?utf-8?B?RlRCQ3NkdlRCSEZTMkF3RmljR0VSaVRlNnUxY1pNRDRLcHdMU1pxN2Q5a0xP?=
 =?utf-8?Q?FDaF9Cprn7UUXmYAEErATvNkjj/OCgj+t+4SHtm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de85a261-c26e-43ca-e978-08d8dcd7ab7a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:30:12.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOewLPALO/m2dzu/AcJdxWhXcVdTf5YIKzmFpa2IsFQVSYrfXpEMmLqiec1XhRH68ackf7/bgc86Mg/yQYob49QFQNMSGrvn2NDuMnCYOsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5047
X-OriginatorOrg: citrix.com

On 01/03/2021 17:00, Andrew Cooper wrote:
> Support in-tree ABI checking for stable libs.
>
> This series highlights a regression from 4.14, which needs fixing before the
> 3rd patch can be committed.
>
> abi-compliance-checker reports:
>
>   Removed Symbols  3
>     xentoolcore_internal.h
>       xentoolcore__deregister_active_handle ( Xentoolcore__Active_Handle* ah )
>       xentoolcore__register_active_handle ( Xentoolcore__Active_Handle* ah )
>       xentoolcore__restrict_by_dup2_null ( int fd )

Actually, this is fairly easy:

--- ../tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
+++ ../tools/libs/toolcore/libxentoolcore.so.1.0-x86_64-abi.dump
@@ -4,8 +4,7 @@
           'Arch' => 'x86_64',
           'GccVersion' => '6.3.0',
           'Headers' => {
-                         'xentoolcore.h' => 1,
-                         'xentoolcore_internal.h' => 1
+                         'xentoolcore.h' => 1
                        },
           'Language' => 'C',
           'LibraryName' => 'libxentoolcore.so.1.0',

I'll throw a fix into v2.

~Andrew

