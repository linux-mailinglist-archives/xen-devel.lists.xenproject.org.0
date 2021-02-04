Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3E30F35D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 13:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81292.149983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7e3o-00054W-1a; Thu, 04 Feb 2021 12:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81292.149983; Thu, 04 Feb 2021 12:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7e3n-000547-UT; Thu, 04 Feb 2021 12:48:35 +0000
Received: by outflank-mailman (input) for mailman id 81292;
 Thu, 04 Feb 2021 12:48:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7e3m-000542-4m
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 12:48:34 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91805399-0f13-4d06-af13-50d0689b02ba;
 Thu, 04 Feb 2021 12:48:32 +0000 (UTC)
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
X-Inumbo-ID: 91805399-0f13-4d06-af13-50d0689b02ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612442912;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NAqvuQCHI3koPEFaCF/cVXUrqJXxNvTRFqJxhWTxAfo=;
  b=fjLwoMpVPSUqqXrIdnoJrRVbj8zMa7Aw18sR6ArEdfwuoD/S17KdsAtX
   izRcgwGCbXo2SNfTap2+XoZDxKfp7J/Vn7IeVszPzRufmqaDFPrzxGBzk
   eJOYDZ+tTZlZ0YeN0M7TlYrk0dsMvjvQ2enouht7er0YbdRG9ufumBz3X
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8cEDVQX78ZX4IgXOmRNzEcmpx+94y28r5hcW6O/61yZcD0pfcqFyzdTWV/FU1Lp+q4gnTVZyn4
 ReEUFCMZ55kMVPA9wVQZBlZoCsiLl73jdb9nOOZnk6bCriWiyrV8mWyCbWSorH+xjv8Be0ZfmA
 u1W/C7kCuNo5yJbXplGoK/H7cTToIbPnarCbMTlHW1nnVCuxqywYKUv+eosL83CIiiPygCVhtX
 nocjRRbK9vP9djIxgRO2nv1T8pOgjG5FK6yRYFFkcNcgz4pkYKSHSJLL6Te+R5ZdUpc1j1CMYk
 pfI=
X-SBRS: 5.2
X-MesageID: 36745303
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36745303"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHYMtpiKqsjFoNdGMXx1oaWIgWhvza6xVEkFx1vwDCNdgWK5ReS4YuveErIbid4sULmhiaxWJXOKwWbzJWQ8+0ccFriTBT7uTJfJAkent5EA67oUTIH7KpQR3vo6rz/k8rZCnQ2IuBYHbe+vsCnNQba9fRXfCte920pySY4AXg1wpId9Mu3h9XwQAwBKjoHOaNsX2PwYhZCXjV6F2SdiN9tOrFEcDch7nKN0Anw1XNR1WGQsyWdkL/R5KC5PqfgMRJ4fs/6/9JnRUE5FOzYcGxz0Du6efMVpuk3PlHKlBh7tl/IaREU8ufo2Oyqnm9Xpy3mmzdZQ5SXaD87e0ln8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAqvuQCHI3koPEFaCF/cVXUrqJXxNvTRFqJxhWTxAfo=;
 b=Cii57b+X2p0vzVFy7m1IauW1V/cmumI5jg44JyoSGl6an/A10XcHZfNGFbnlWV3jZluhPA1jgUWO2KEJ3FsspTj/htIu2lm0hTO1cdSAj068uImLihDxV8zOt5KvbQ8zCYaJLgyEo3YVVb5FP8e2r4++XV0AFeje8RH7izuFAf5bxC1UH9IwGNqotqb3tYfto/FxIMQUDzMhCaXb7Ef/Xxm/oeqT9iXRxcviFQXmd2ZSCeHW9srPlRtfkdr2aW2E/OFfGWTSPY1Xki5hIRfrcSIuG6VBB+s542KHX9KJD1sKOJqO9zfsKOCHJg1riIRDx7om6iv/DppnvJolYDkfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAqvuQCHI3koPEFaCF/cVXUrqJXxNvTRFqJxhWTxAfo=;
 b=tmqSogtoSIInZD8cvkk6nmoln6VUIK+FKkHXSL4estjdSMkQ5Lb1xUAMk36Z1XicZEx/qqPZm/HmKVsHH3KkAw4Gq5I2cSRy2UBSkanaycSobLEhsbgrckUEu2y84oM4aQuU5NrTkYf4BCvR6K0ZXqn0/Nw+L3YsD9XAAPB6XA4=
Subject: Re: [PATCH for-4.12 and older] x86/msr: fix handling of
 MSR_IA32_PERF_{STATUS/CTL} (again)
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, James Dingwall <james-xen@dingwall.me.uk>
References: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4064c3f8-5c8f-584b-be01-9189b6adff1d@citrix.com>
Date: Thu, 4 Feb 2021 12:48:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49628e91-30d2-44ce-cc3d-08d8c90b2a5d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3783:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3783C43BFBCED96D5804FEB6BAB39@BYAPR03MB3783.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Hvinnxh7PFsI6kMBkOWRTM+hXJ3mGjTItjlV8k8dXVoy2ExdPt0qWt8d73ejV2qY/tuXqczA2+RIwD8cAK2LbdqoEesNtbRzh40jR2D4hyqUSDxRMApu3zM3I88dScuBjLwRXG8qeylm0or5cEROOiTLgV3JikPz5xZTrIooOeC5TgNCXW1VkYnza3nzn40sobYYCfoOpyDG4rOyKTT6oZ9JWBzKyuNzx1TUyqPHqsuNUwt6BzIWa0UUreQ2MtzQ0l8+WXkbor0adbSCABuhqVikaT+6u/mszqWY8CXJXEomuxJ7fAHEPRFuq43uFBX8nn/AF8DI+zojRRK+AlC1oviU2opYYbUIXyKVcoYEHQ6QFD/lPG4GyQMFxepkqZZTlDhlWsA8B5AxIGZdnzMoU4HwWQOUG5pdkCgjind3y+li5g1+zyAJLVSI9JiwnubZmpTsz7OnW4hCmNSihQVNqjFNoWgds4HHwCpAp5gJeDxS8i5siUEKBEQbuZsT3OOFa2vOXhT1t1Zdmpou+zrfXp99izLYa9HyshAn5hNGiL29hsj2Xsa3bAHGbURYRQncDdCncOc/2gVyySB/aFNAsh6MEA5sH+/NCRUlWNAItE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(16576012)(6666004)(956004)(8676002)(66946007)(2616005)(53546011)(316002)(478600001)(4326008)(86362001)(2906002)(31696002)(5660300002)(8936002)(66556008)(186003)(110136005)(54906003)(26005)(6486002)(16526019)(36756003)(558084003)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHVKdDlBL0RkanZWZUxSb0g5QWFsdHorV1RXbUxkb0xYc2VBVHVJMW52VEhq?=
 =?utf-8?B?cTZXazdCdnhtUW80T2Znd1M3dUllMkNmY0hsMGxwVlFrbm50L0FYWG0zSEF5?=
 =?utf-8?B?WVg3cVdFVXVVamd4VytOUTI3MTRmT3ZCbFk2K3pucnZJdi9maXhqL0I1ZUN2?=
 =?utf-8?B?K0pFaE5YcmRvRFNsSUZ1bWU1b2JJd3IwVWoySXhWUW0rMXZ4YVMxUkM4Sk0r?=
 =?utf-8?B?dno4eFdQR29YcS8rMUlJazVhWkc1NzFLQUdOTGtHMlhsWlpxUlZPdGsyOTB0?=
 =?utf-8?B?VktkMHhrd25lUXFzeHZrcVZnS1Z4NjU4bThlUkVjWDdLR2x4aHdPQ0FzTHVF?=
 =?utf-8?B?cFd2ckNmeEdJV3dlWkRuTTdTUXB0TU10OVRsWmFOS2dzc0U0eE8vc2wwVHhm?=
 =?utf-8?B?VXlLMWgxRlo1UDdxRUhUaTJ0ZUp6UHJVM2ZOT24rMG9VWldyaFlDaUVaWU5G?=
 =?utf-8?B?NWM1bjhmbldKRHdHMEsxUWE2T01IQU54SFYrTWMwRVpVbDRwUlFpcHJWVGNQ?=
 =?utf-8?B?ZFl4RnhLM1oxamZ1bFJUdkFEOUZOR2VsdlFwdTJDNUhuZHhTY0dZMk5DWDhU?=
 =?utf-8?B?dVE5TU1BY3ZDZlo3OWx4YmRiTFZudXZaUFhzTjlQa2VPLzlnNlRJSGpibUlp?=
 =?utf-8?B?NHBwcDY5WWUzKzBFYlE4bTVDV0hJODlaSGZMNVRuOWtGck5WeklrcEgrWmJD?=
 =?utf-8?B?VzRLU1ZrNkJzeHhIVXVXSXhURWpCOGJlOHFrOXF6dEFGemR0dnh2NVp2VG5U?=
 =?utf-8?B?eWFGMXpnMWthdXNYQVlNUFh3Ry91UGk5VFV3M1BsQVRqL1EzenpSTGd2QnRp?=
 =?utf-8?B?VGpLdFMxWDErYnlZVVRNSGZvd2FLUkRDMEtRVW1obWZSRU9mVkN0WDBxR2Zp?=
 =?utf-8?B?S2lCMCtTZXpWTVdDNkp6MG12dXVLMG1ERXMvUGVxQ2YrUkdDRXU2NDBXeDNQ?=
 =?utf-8?B?ZEhMMTFieTRXUldvTlI2bEhsaFhSQjc3VjVRK3J4V3NjbWZ2TGczbGMyYUo0?=
 =?utf-8?B?YzF5QU5Cd2dhVlZuRldoTXFxZGFDYjdHMmdtVU1LaXFqN2hwcS80dm83K01p?=
 =?utf-8?B?cjQySUk5cG13V2xMenR0WUFiSUdiQkY0RjZKcEtXSVNackhXVEtxWFo5R3hw?=
 =?utf-8?B?ZDZ3WGlCVy9xRU52c3VxTEFleW5zWkJrQXQ0TGx0LzBsbEhndGlDb2wwcC9k?=
 =?utf-8?B?R2ZKMU53d0N1V1NodkxqLzVLeTY5Nm1hb0o0WWRuL2YxSUpEQkNMU2pZL25t?=
 =?utf-8?B?YnJ3UVdUa3F4UWxJeFRaMHJtRnc2MWE0bVB6SnVMUitBclNTeFVvUTQ3WGYv?=
 =?utf-8?B?L3ZEQmFwYVFrOVplU0ZYa3AwSmRmMXkrWUJIRmpqbmowMzZIRFQvTTRDaXFI?=
 =?utf-8?B?UEVqakJPNzRHb0R0RURha2VpRkU0L0s3eHIyZnduNGE1TlBtL3AxUi9OV094?=
 =?utf-8?B?RDcrQWk2N29qSndBV2RkK3FJOWF1enpzN2k5WEpBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49628e91-30d2-44ce-cc3d-08d8c90b2a5d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 12:48:26.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hk34J9sLAWo6Upm3QC8bfFsSPX8tQTehuJr8HJrWtzauvIA962gwdEHTVpgagNqFyO16DCeMAMARoAz8Hqlayuj6PewmjYcVDmPnl88qjKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3783
X-OriginatorOrg: citrix.com

On 04/02/2021 09:36, Jan Beulich wrote:
> X86_VENDOR_* aren't bit masks in the older trees.
>
> Reported-by: James Dingwall <james@dingwall.me.uk>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

