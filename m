Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC03086E6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77758.141035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5OtG-0005uD-QR; Fri, 29 Jan 2021 08:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77758.141035; Fri, 29 Jan 2021 08:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5OtG-0005tl-MH; Fri, 29 Jan 2021 08:12:26 +0000
Received: by outflank-mailman (input) for mailman id 77758;
 Fri, 29 Jan 2021 08:12:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5OtE-0005tc-Uj
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:12:24 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b375719c-cef5-48b1-8549-bc246944af64;
 Fri, 29 Jan 2021 08:12:23 +0000 (UTC)
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
X-Inumbo-ID: b375719c-cef5-48b1-8549-bc246944af64
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611907943;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oTrwzwkYidd2+wpoJ8V4Ag5UDFciWH9ldQ3ocyeNAqA=;
  b=iICkSNdFFkom0FKZi4jJoj1GN7G8RFFkZ/U5snmBtO4Mg6i1c5se5S+2
   VDEVQtbdhyG2k2ne8fMvfBK03YJ/TemazCuHQ48XfesHKiLMs5NqFTVz5
   zIKmq05fWSHNNpoebmgxHTb74QJ07/lFmgJYKU1G42eDRpvYHe9VaVjYL
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0gnr3sPFR/V6BQHcThx/t/G5MA0FIFqzE0MAEvY4tDg26fhUY1FAmM5ar3MvspmA5KJhDaG4Z3
 jrN95hb6GOesSSn/oSkAjbuaVLuT/PV5b/Ygqcb0dW87YYkKGA7B9Y1SZGndOsrOW5F92j85W0
 JTHk+kODW5Pd5VwMgD4e/04YbsVxTSaXFLT3M38L8HnWsLJ+rIpQnXHa5OgK+mYxP1DuMQBSc3
 o7FwJvlL+ku7FLMtAZ+8p6uIOZrXq6nIPXwq1MYaGWUJ9lQ3gQ0TilIJHONrUxZLoyDqFgNn6g
 BzU=
X-SBRS: 5.2
X-MesageID: 36172295
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,384,1602561600"; 
   d="scan'208";a="36172295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNLJJ1zR/qLE2zj/A47/KM4ejyQrtkDa+7JDbPqNRHbU1yc8ENhlXIyNPTAFrCSPi5Li7Qf0BEoQsxtaEGuIUw1Wg5WIx/KCd+QTiWZg0cuJMBfwwhZRUrUMongzdbegPv8Ni3JtL5urw4cARnGy5byfLEm2pgIj25o/CyRTjL8ZP3fNQEgrhSjpLjF6sXIX4ShaiLZboKwD+epYVT+0EIl2vuysCJIs1jFv9k2Ye6tuTS+WOIH3Zt4MKoZMVCX/qRA+bAG75Z+MiLOEL6K6WwJYevR8jC4I4iBzwgTEwA4zUV9W4rz9nK5Zysj6SvxWRbmqOphCBcZ4ZSDDYWi1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTrwzwkYidd2+wpoJ8V4Ag5UDFciWH9ldQ3ocyeNAqA=;
 b=lPs1gSH4G2bP8OlAx3NxQmDhbs4Gh2JSkuVvF+b3E5XCfbmmgn/3yXklUO0wz5Oz61mJSFSpVnSkXuCXn+eVIFELjfL6y67ZiaFgFaCLuumkFuM6lcS15PIC3PnxUxRuBWIFy9F69NhlMCTR4nBVGZ6DlDkzClqmpkmYZH6dXMgU+scVZCCXG11QXxL3zLxHhFxFAkGw/0bqSwsLIqhc+F0DgL4ct+z/F8AId4MC/HnaUM7cOrlKuQ/aERWomM9+7nyB8kQ+X//VDM8JaYmyhdrPob/4e9OL23ZNDZXyUKOkYW2cmDFjGsBSO5r8nno507y9m+SCy3LTQFt7RXMnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTrwzwkYidd2+wpoJ8V4Ag5UDFciWH9ldQ3ocyeNAqA=;
 b=mR3ZiIrw8TO0ErLD2UJCGg2SzWGb/OvKjSsYdCkLv0824/oQS2WAQYCbHuGAKrVzEfWQ1FjnUsQzcOMDaSc/W4l9AFhyteOQSf2M8o8/ILPppWM9vx2Bvb2gSqcgsV92+JV10oRksdFxw+GmU22tn0Oek+vRYmqnnD0pkBhk1VU=
Subject: Re: [PATCH] libs/foreignmemory: fix MiniOS build
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210129080905.14517-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fc7b0563-f7a3-43d8-05ec-dba09e5e1b52@citrix.com>
Date: Fri, 29 Jan 2021 08:11:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210129080905.14517-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40c31dc4-c808-405a-f658-08d8c42d98e2
X-MS-TrafficTypeDiagnostic: BY5PR03MB5063:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB506371662914B21AB0CA3B06BAB99@BY5PR03MB5063.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /YDqQrdQyh/WjvZU5z54MmwGtlE+IgPFkAc1fW+erSnWzsyoHdjL5uwXM5jLtX37y20eTCnj72Uxuu0zGhYvwsF3imFN3tBT5Sa6DfL7nSw6LaODzZG9OjbRgXOt+Z14Yaav4KhzCP1wik8dl9Yl6HCOU2yYTMP8X0oXOPzOibTzHydweqhN0hv5XRgI+oO43t6RSwpcrofY5jWwBvSf6CYZI0RS9DzpJi97odlW0L9uJl14E4dTEv8wpePm+vp7cVUKUe0QVDtzQ6A8HFzU0DZ5PGuU6S5NI+eGlQuJgG2B+EV/KQPWugI9i+lMW8Mb5stA9ueyvgFJh5YSAL9LmnVbBWoh1yEO3KxksioZ1tJPnJOaTIWPls2WqTPuz+BsNf8rIQO0cjd+Zt6r4rI4EJA8Qr+fEd7o69+qllEGvYgcrCDeSlPRloaUrE0BMU3k1OOKBRUgaPX/cRG+IzodSuZm19y4A9P4/ypl/2bEEtO9oyyRuAwvWuGUwu0vvi8Su4JPd0SLXYwvhIaD8vxXqdJeuAy7Nt2cDqXDWJSJuUShhraOpxcQkFLnr1oLwtifKGVAWts4Teq0sf5nnosZsTCfsCYlG9wGEZZx8v4dE9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(4326008)(6486002)(53546011)(2906002)(86362001)(478600001)(16576012)(8936002)(31696002)(316002)(8676002)(31686004)(6666004)(66556008)(66476007)(956004)(66946007)(2616005)(26005)(186003)(36756003)(16526019)(83380400001)(5660300002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RytzMUtWVnFYMmFLMWhGSCtpME9yRCtXZDVWRVJnbTFJdjdRVEhGSUZqUzcz?=
 =?utf-8?B?eWYwdFhQWmRFeDltSlNlemp1VXI4L3lkMlVnQk15SmxDb0RUaTdNT1lSL3lr?=
 =?utf-8?B?ZHdNZXZFMkhKR0thTHBuR1RLL1gvYzBCZitqUjhVSWJjbjM4QkYrc0tKYlds?=
 =?utf-8?B?eU5NQnNvMTd6OEJIdTNLcFk5VUtIWWRGcmJnVWR4R3dSUElSUkI3dUJ4dXkw?=
 =?utf-8?B?QUhyT3hKY0x4Wlpra0ZNdEtjTktCaEdKZVlYUHcwQm9TZzgzeUtFVXdOVk1I?=
 =?utf-8?B?U0o4NkNtdVdReitlcmZFbE9iRUsvNzhwNUdqMmhVRGNIY2cvUGRZa1FCMi93?=
 =?utf-8?B?MEVQTEVaYWpzd2w1TVNldGx0aTMvRC9NalU3ZUdZRnZmWTNYREN0elZoSEsy?=
 =?utf-8?B?b3lMTVhlMlZWeTRsK3lERitMOEtMNGo5MzdpUEJERlJCVGFhU1g3eW5KalNO?=
 =?utf-8?B?UUZRMENTdkxYNzNwempLOHZOVVRGT0Nvc2YxQjJyaDN5NEVUUnIwMFBFbWdm?=
 =?utf-8?B?R3RRU2l2ZUtwRGUzZFdvNUdaZVhpRUFhQklLREo2QWdmSzNaUXVmU0duRk1q?=
 =?utf-8?B?eTNNVFVFc0xTc0FUUjhqYStCVFUyWExlR3BJdENkZjBnUlZteU9iK1BkMEdC?=
 =?utf-8?B?THNkN29pMWJNKzIvQUFnYkhPemdEWjVtNmJiOU8xODZMNWpTZGM5QVBwV1px?=
 =?utf-8?B?RVlFRkZNY1lOK2hzWkhOeW9wb3BMU2tSTER3V2tLVEtSdHVYeTVlQkEzMkRy?=
 =?utf-8?B?RGl6NFY4TDI3T3grejIwYzF2Q3NJbjljNk9RL0Q5YnIzc21IMy9pY2oyYlVK?=
 =?utf-8?B?dFNwZEU1NVZnTnBpK1cvOGt0RnkvOE1nVksrQ2N0WnBUS1BRbkNOSTg3SUhk?=
 =?utf-8?B?eHVoN05MN1VmSmlnSk84dFVkNU1VU216WFFYdWlteEVSMDNmZDExcWZVVEhV?=
 =?utf-8?B?U0FFUUhHUVZ6NzE2Nm52eTcvT2RyTG5mR3lPZ3hhWWNTamQ0d1VtYTA3Tjhu?=
 =?utf-8?B?a0xGWXJUMWVoY3VRN3B4MGFER1RxYW9NL3lwT1pjblhteDhVOTIwYWZWR2pJ?=
 =?utf-8?B?eG5jSmFZRWJ5bWJZSkJDSTcvd3ZaeEk1WlZCSkQ4allZd3hUdk13WmoxOVQz?=
 =?utf-8?B?YmlEQ1hVR2IxaGZ0blZYQWR6K1J4REdIekR6UmJpWXo2R1dBeDc2OEtKT2s3?=
 =?utf-8?B?ZzQ2YlBvKy9QaVpJUDQ1OUd0alFSVzlJenIyQTJ5ZE5DVWtTRHJQeTB5TTZ1?=
 =?utf-8?B?NXYyaFVQWjRJUzNUTjd6bXdxUDczOFRCU1UrbmFWL1E3Y1FucFF6NWNMMnRK?=
 =?utf-8?B?RHZtUXpHdkh4KytqYVc4QXQ0UVJEMnFKVHFjMEFPaVVGMHl2ZDV0NGwva1ZF?=
 =?utf-8?B?Q1pxd3VFMFNwNFdRNjNUSEVnY2VaYWhITnZ4RXNDTU83V2cxL21qRlpmamFz?=
 =?utf-8?B?N280dlEwazY3RTVoTXA0dGFPYVBmOVpJcnRuSjJnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c31dc4-c808-405a-f658-08d8c42d98e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:12:19.2187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9baqYkvWnt6DGL6XG7AJ8ANnZBNALyXOVFzZxfFilH9C4okgsX2ragt5PPugfUr1saz74sK+bRRRXothN8nioCqPVl6aqe4+0Qp+m/0zWT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-OriginatorOrg: citrix.com

On 29/01/2021 08:09, Roger Pau Monne wrote:
> Keep the dummy handlers for restrict, map_resource and unmap_resource
> for MiniOS, or else the build breaks with:
>
> ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_restrict':
> /home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:137: undefined reference to `osdep_xenforeignmemory_restrict'
> ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_map_resource':
> /home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:171: undefined reference to `osdep_xenforeignmemory_map_resource'
> ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_unmap_resource':
> /home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:185: undefined reference to `osdep_xenforeignmemory_unmap_resource'
> ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_resource_size':
> /home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:200: undefined reference to `osdep_xenforeignmemory_map_resource'
>
> Fixes: 2b4b33ffe7d67 ('libs/foreignmemory: Implement on NetBSD')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for getting to this.  I hadn't had time thus far.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> and I'll put it in
straight away to unblock things.

