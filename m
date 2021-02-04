Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C230F30A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 13:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81283.149944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ddA-0002dd-A1; Thu, 04 Feb 2021 12:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81283.149944; Thu, 04 Feb 2021 12:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ddA-0002dE-6D; Thu, 04 Feb 2021 12:21:04 +0000
Received: by outflank-mailman (input) for mailman id 81283;
 Thu, 04 Feb 2021 12:21:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7dd9-0002d9-3u
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 12:21:03 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42044905-13c1-4a8a-8087-827065b29f9a;
 Thu, 04 Feb 2021 12:21:00 +0000 (UTC)
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
X-Inumbo-ID: 42044905-13c1-4a8a-8087-827065b29f9a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612441260;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GM9koKS90hfnWlXMk6WKDMi4j3RYWLdMRRr07AKz3TI=;
  b=h28Vpzahe2Cq8TLGdz21fMjvP5iDeI/Bnos3tw0U5axmDmqSl3b227h9
   e3181U7alhStW5Qfdg/zg/GNSlsBpjJKHtlZRdzk0+lmpgM7C9MUxPxAc
   u9sJop5Ff/JxdUEgVXS2iLvqyqHYUp878anZe2O9gE8+D0cAww233iAp/
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sKhBG5vMxLHVQO4mWewGoPYx4/m1GrSIMB6yCGGXPc0Yn+TGVrTP9oMxriYgwsQbUfXUXUUAqK
 1mDWh0rPP1QeYLo3B0IDr5Vk1K14cmppDHH0Sor1QxLr9fZ6kAlGfvMfyr182zHFvBQXif81Bi
 so+uqsKRXY1Dm5w0BOYKFYfEbO31AWMp4IQpug/ltWZUzsQouZ5ZeNIRkHbYYR9GBVfuKx3Z1/
 LRMN2tJE/Q68SCWFdq4BeXhFuF1sC35+qMQ6K+3plsztFNx3Fdd1ugZPAHcC71ZoooStF6f+hu
 NPo=
X-SBRS: 5.2
X-MesageID: 36743834
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36743834"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9yA8F/M3srv6jwpZ0RTRwW8E94gXGELXO76S6yOZ5BLBiKAHPYS9uflRxSoJriHt8728QKeUfRBu8Dg+rVkEp5xQ0LjrvWSTFT+h7vwbMa0dPVnQXFsAqZNByJtSJAl/ad7XaPpuZha9emByhVbJh01uAusPzUaHKmtvpE4tGyRa9jk6AqMMwqCAQQr1GRPcWjqY2J5WZ7ISOTTcdqtkUcU04hj2gZifCompsbH2IYsY6HKLxMdgoKkG+76WdFeHoxow2EMu8a6WypQDF5qhY20apQqh9gkP6hpTKgiIjiXL70dL+lctHikIegHNBLesdDDkUzNnP/HTwDy1xbutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fH5WIVn0WSzB40kAN6ohqu/cRsmMYoP3udyZStkguKg=;
 b=CEQtrp7SdG90TgfWY9PC7GBa0tGy6zixUPczgLIo2oetyyOq/7SVwva67mLpjdWUTgPvYwKS6KOx8TV2HdkIw5OW7DL/mbAksQt/TUCvjsnGOlVwHw/9+GXI7f7E1LibRBR/r3vjiRnCBqClgd82gfaBPCnOve86f+Lio0IeyiKc4n2KLGeQqgbb6RsyX8t8aY9CQMPkLkMoCtq5sC09X2SIpHbcr4PdggmjsxTkIIUiVKMIB8MPKrwtY6yBaVd9YkEDUFVyrf96/hdR/VxJ2OYxzVCf+hHmRGVJa/wakn/xZAHhLUfmAwnKkr2CMOT6vP5DP/phEKcjR8q77UUGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fH5WIVn0WSzB40kAN6ohqu/cRsmMYoP3udyZStkguKg=;
 b=dScJqgR45II8NkEtD8cCIxYD4GOXaOQOm/0ZSCEbkL303NYTzi7RycyFklhipbD2kStenAnaP/CDB7v81XPuzL/UP/JDUSfusdldgLdshe41UzK6aNrsL+9u+Pw7OaPeEi6ZuoSsJ8BO4TiITxjvZETD1jkKOFD1MX8PYOO+GlQ=
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant
 bugs
To: Ian Jackson <iwj@xenproject.org>, <committers@xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, <community.manager@xenproject.org>
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
 <24603.58528.901884.980466@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <da8b6f0b-185e-91f4-d245-22d8af50c194@citrix.com>
Date: Thu, 4 Feb 2021 12:20:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24603.58528.901884.980466@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27098629-3422-4f20-02ae-08d8c90751e4
X-MS-TrafficTypeDiagnostic: BY5PR03MB5127:
X-Microsoft-Antispam-PRVS: <BY5PR03MB51278B4551F9AD76FC83C7F8BAB39@BY5PR03MB5127.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nitDgEldv9OPmEDf+CJ73q8UKpN3a738cbruJ+FRTHjUKjqxrihm0kXEB8Cls7FpNTNSZCRjhvaxiD8Sf9InEX3viTa91VSMQRzlQGRmQhwb4eR1w5HWn1iONlqx6+eZP3wg5AuR+jF4tIqLY9gWsjx9HquNNUbvrx0thBqKN+r51yT2edTertGD49hquUv+pGKTX0iwklxZ8003sVK57Vu+lTTqkm1K6brdsNNv1zUycvrWNd0cWgHmyiLzyQsQZwplZyTOcgR/JD6iySv0CFxDx9y+NdEdVhX9lIAm51xrgP4N3Lrz++M84BGOuHbbNRY/nr5NpVUYafaPfkeTJXAGhnb8OSBvWmr+ClhCZekKDzuoHt3zp1Wh+fZ+N23IQ52LJvlmYb4Of0TWACuIEty819byIlHkAv/UWn0Mi+bldQzE3LBKFX9nzemK6CL1uvoYYzye6xOqAIIVw4klcXTgEMXBZytYSQKzEEi3iL/XoDkF1ONZ6ExJuKyBMEiH7zcmIYxjHA0V+FnfaTTaL9lhPS6GDJspdxlY1mbPxdKBax6Co+8ZbzHoH5YQi9ImtKoDKuB3CZegHaQb5k+6fVzIDOyfST7aXLF8hP9XU8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(8936002)(54906003)(316002)(16526019)(31686004)(8676002)(4326008)(478600001)(2906002)(86362001)(31696002)(6666004)(2616005)(5660300002)(956004)(6486002)(66556008)(36756003)(66946007)(66476007)(26005)(16576012)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1pqdVVZQ3hMa0ZqOWNDd3FqNVFjMGdYZlpiUkxtV3doODM2VlpFcmV0Zmxa?=
 =?utf-8?B?b0p3NTVMUERyNCs0aGhJZ2JwaVpad2ovWG5PTFJPdDVZMVNTKzFlc1JFVS9P?=
 =?utf-8?B?Y21jWGVMQ0p1d2FVaWJmK1NkRzh3R1JLZE4yYmtWaThDclY0WnFtTW1Ycnht?=
 =?utf-8?B?M211cFIvN2ZDdXB4U05CM21ROEZ0alNYNC96Z0ErNnh2VDdrZ1JZYnlvZG5r?=
 =?utf-8?B?TnRUU3E5djVTMnYxMGJ3SUpYSEE3SVcxOHBZd056TVFiTnl6bmFqVkh6Y0Mx?=
 =?utf-8?B?ZFVzazRlWXQ4UzZuNk0yaE1jckUrMU9ZL2FKb21xeTdhTE1ITnFuN3RQU1hM?=
 =?utf-8?B?TW84SHBDS21ZLzgwaE5NZVppVXJjcmFLYmZJZ2VmSE1vb0hUMGN6MUJsamIw?=
 =?utf-8?B?VmNoRDI4LzkzUmgrYU1aNS9uTm5MTlFCSklEbFpuQ2R3TFdGbHp0WUJvUDRX?=
 =?utf-8?B?cm1IaWFiVDJRa0Z0V1hFc3VjTzZsbzg5WGRmd085V055UWxiUDExMUJzKzZs?=
 =?utf-8?B?a0QyQmlNWUttalBFU0pJMkhtL2F5eVg3ZTZXMVZUbjcrSzhYcmtLRU8ybGVh?=
 =?utf-8?B?a2xYV0ZxQU5zNXlZei9GME80Tm5xb0NOWlgxbVJieXRUNDN3L1FWbEFaTWI0?=
 =?utf-8?B?R0l6UWFsaHBXT1ZtZm9sQVh1S2pIa0NYODg2bXRJdjBldTJGTEdZZEpiOXZP?=
 =?utf-8?B?S0dya3E0K3hFQmhTSW9ZU292WEVFY0ZmRk5yRG9vRGt2WUVzbXZtNHRBaDIx?=
 =?utf-8?B?VEZGL2FBZGI2bnFEa0ZrYm5JQm9VbUJGK21tTGJMUHJIYnpCcVkwZkpBb2VF?=
 =?utf-8?B?ZHBRMkl4NXRoMzFWYVFHVDIzdllRODNuMzdHVCs4U2VDaU5uUkExM1hPRzlH?=
 =?utf-8?B?T2t0Yko1RzltWnFpVXlsMzlqRkd2RzhhVjVPSmJQMGxuTU4ySDVjWmI0K0Vr?=
 =?utf-8?B?bkxNRU9QZDFBbDBkRm0rN3NvNHBkY3ZMRUROVzhXaFdyUkN1S2QzT09WRXJq?=
 =?utf-8?B?TnVZcWZMVkRZZ1VFM3RQS3oyZU0yczR4Z3lNWW44WG1rZnVEY1JLbGh2WmhX?=
 =?utf-8?B?d3dtVnVVdGZQWVMrcTlYTzJIMHdrS3F3dngwOEdGMVVZTDBieHM0Um4xSTlT?=
 =?utf-8?B?YzNVb0ZZR2hRVFJ6bzlrQTE5Q2l5YlFOSzlWVUk4dHZndU42NHloMkk0TW0x?=
 =?utf-8?B?blNVSGllSWRVbmtKRGNHM00wNmlXYXBDbUNKdmFMSmh5TGlGc2t6dm9ZMGF1?=
 =?utf-8?B?bHMrSHN6YnJya0lkekdSVVZGUW41VFoyWnpGZUMxc2pqeHEzbDNpNU9mK3B0?=
 =?utf-8?B?dEdEU0dKajhjRXdTVHQrTllKUVFLa2JTWHJRNnVyTVM4M1ZxYXc3c25mM2JI?=
 =?utf-8?B?VFh1S2lZRHZrZXZYa3BiUkdEbVhDUGUvQ0lmckNOaFkzOVczMC9yenRaL1VJ?=
 =?utf-8?Q?Jr92vMh3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27098629-3422-4f20-02ae-08d8c90751e4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 12:20:55.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zwqls9bqC0nsprnQGpv+bSTtddqp8RGRtH6oLfHAl9zunvZrkOzmW43Ta9um36mMCip65fWgjeWOM8bM3rKYnORhGwnYlCFBrurodPb+ym4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5127
X-OriginatorOrg: citrix.com

On 04/02/2021 12:12, Ian Jackson wrote:
> OPEN ISSUES
> -----------
>
> A. HPET/PIT issue on newer Intel systems
>
> Information from
>   Andrew Cooper <andrew.cooper3@citrix.com>
>
> | This has had literally tens of reports across the devel and users
> | mailing lists, and prevents Xen from booting at all on the past two
> | generations of Intel laptop.  I've finally got a repro and posted a
> | fix to the list, but still in progress.
>
> I think Andrew is still on the case here.

Fixed.  c/s e1de4c196a from a week ago.

> C. Fallout from MSR handling behavioral change.
>
> Information from
>   Jan Beulich <jbeulich@suse.com>
>
> I am lacking an extended desxcription of this.  What are the bug(s),
> and what is the situation ?

Still WIP and on my TODO list.  In addition to Jan's report, there is a
separate report from Boris against Solaris.  Also I need to revert a
patch of mine from early in the release and do the same thing differently.

Bugs are "VMs which boot on earlier releases don't boot on 4.15 at the
moment".

~Andrew

