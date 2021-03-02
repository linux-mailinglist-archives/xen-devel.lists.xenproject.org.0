Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B832A3F4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 16:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92415.174324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH6s1-0000B4-9Q; Tue, 02 Mar 2021 15:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92415.174324; Tue, 02 Mar 2021 15:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH6s1-0000Af-6L; Tue, 02 Mar 2021 15:23:33 +0000
Received: by outflank-mailman (input) for mailman id 92415;
 Tue, 02 Mar 2021 15:23:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KcId=IA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lH6rz-0000Aa-Mg
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 15:23:31 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5f6120b-aa4f-45a7-ae37-e4f0183050a9;
 Tue, 02 Mar 2021 15:23:30 +0000 (UTC)
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
X-Inumbo-ID: e5f6120b-aa4f-45a7-ae37-e4f0183050a9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614698610;
  h=to:cc:from:subject:message-id:date:
   content-transfer-encoding:mime-version;
  bh=9VcRKyDuvif0fqvHO93oxjhFwe+QYqaOTVNf3w5hsP8=;
  b=dc0n+9qXFMzmDMr7Rb2I7FvcYkQy+6JE4alcEq3sqU3LD1gpkI1FpLj5
   eyETAQQcTLXU7VjGePoRG/jno9+/a4thtj2sF1WSnBwrqYY0Ez/CXrFo7
   KIozHvJm2nxjnnD2k2FpNBew6Qe9kpTF92cvSvr9knWOlih9YkM0OVvu6
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OwFxmp9OBFhbdO7rB51ZeJYnpqYYWoU1spF1WSBNkp6+MVKemd7bY5wQjlTKE5zjFQEIJKcai3
 rvF9QAF9WbWnxdDjZ3Vg06uO1XQJvODC7Kq2PjUPI4AQfGVLdvVF7kKSNf8Vv/7pfLntd7+6S3
 BtGX9V5tEg9ARrhvyvcM6yhyawsl/BS2VoJPG7l7wl4U4pKAeFFi3/TmU/f7p4677nK1pZjCQA
 A9Bk3Mkz+IluXs8qV42cK13eGLUahCrLZ9a8HblSYchPkBIZcfCsIyEFdKH97/kEsKGaIGswoA
 9Ws=
X-SBRS: 5.2
X-MesageID: 38337520
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,216,1610427600"; 
   d="scan'208";a="38337520"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQb53SkQXGwgKv1gOSARlE0ruliWM1yY4ZKLzKB2OeaZECQ8lDuVNlddGM981o6ycBur7aT7J16+fhZFWZ2/QH4P5gsLWFHI1jy5cUOUoCYDtzeUZqEsb1Z6oeuwi1QbHIb2pyRWk8GFGxo1cfvE2hEHBGskykH8bHzYTunRTwefmS6BkPAqIFrLV51nGdYMIa+ZaSFRZGnvWjCpesUIgl2chS+RABk7/d7yvm3lym8KcMfoNTlijlrczofCR1ZWoH8t+VjSqbQni3A0RDqnDNSunPhwpEgJNAgn4HADAl+BRUYodX6n8HoKqbbzXtLyViAvhBZEbdV9iD+jMgKBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VcRKyDuvif0fqvHO93oxjhFwe+QYqaOTVNf3w5hsP8=;
 b=awivJZx84eiszFWPylNATEUTQA8zhqLyr90PhV7566wgRom/X7RLzpBpY0x6tkLRU2jeubS/759UF7f1FntstD6qpptGfYH65P83pv6b2ne+gYvziCfpP1SnKuuF69YAKxk14vuQn8sCCD6xvDaCK2EEKfoYAZQ36MpwIDEuxYW2NEbD/yGuJCvv6ktuBEOdP7b2otrXPs8aFWtUT7uaCoWRGPgsthPrDx+slvk0cEFHnGgBzgr17F3vMd3oZDPZYpVoe5Jn/RQ4XOLjSWso3vWQoM1qx9/7UgvFa1iOjQjmqR4axM5MNxI5aNtYdO3Lx+vjTuzxlT0IUlcE5a18LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VcRKyDuvif0fqvHO93oxjhFwe+QYqaOTVNf3w5hsP8=;
 b=ahKuhTnxl2MfsFVyLgiOJwZmefjUYFg/NtzO6cxzBabhQBV/v4KhFoCQIPpHGaTD1FQSHSsbf4Tbak370h70sZMayhL2PveG1JbFaItLPuqsEMugf+Dninwr+nDTDr7gHWmR1b4E+db8PxSF5SgsSyOgoXM9pScD+LzoY+qXHcw=
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: xenstore_lib.h and libxenstore API/ABI problems
Message-ID: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>
Date: Tue, 2 Mar 2021 15:23:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05b43f74-6c43-4383-cb71-08d8dd8f202f
X-MS-TrafficTypeDiagnostic: BYAPR03MB3560:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3560CA384541C8982911C01BBA999@BYAPR03MB3560.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kUAvmSKhYQMN+HeG2lvJlHjgXv2P07ltpruQEulwpgO/+/A9ubeI3ChQpZaoL8bUWRrdBkyUMwHNwSRSjhgv1wySlZcyV+FuUDS/oI7LCTP0BAsC3X0D+un+OP+z7/ABR5tmqLJUZwmgFfeYHsNuUHxjJckDv3IVlF2KiFse45LXJBDuBj5QQBM+uVxXibWIRm66YEkEe9qbE3jKBtgabkb1tc51ZdzUit52J0srKznNurdPfp/0TmFQQ1jgLKdprciW5bPtOsdRrFEhWR3jOhIWSt1STvHDO27F0MOLRjzMSmTLp0oolb+28fLgHe5Gn2ojHtYwJwrVRu9NuZanKSQMseJNT7yU7glxeij4Gz1NV2Uuf2XGkP71IzLQ5Cp74lXm/DpiSyMgI6mwe4k0M8JXJoyhvVtp5GEcM+1yC8iAGGK+Eua9FgONe2xWR/kM07R9RZFg2Z7K75LkVZUcZDCN9KqwEFKQacxK36sQls267T/yDFOzXluOUbaAos6QoVF0iqz+u8PHEGCB2I6nwKlYpteMtBIgfvhAjRmQ34a/P/aYYUEd0XSPA94jejR/b8jBkNAz17p5gtYTUedYX+13B2gGeH1iiGAlARMNahE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(478600001)(8676002)(6486002)(54906003)(8936002)(4326008)(16576012)(316002)(186003)(2906002)(86362001)(31696002)(83380400001)(6666004)(26005)(2616005)(16526019)(956004)(5660300002)(6916009)(66476007)(36756003)(66556008)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aUZTY1g3RXUxOEhKY3lsSnZZYXZsQXgzWlVHdlRUcXFkaXRUZEVSUDdCQjdI?=
 =?utf-8?B?bU1OUC8wS0ZYSWdKd0FwdEVJVm91K3EyK1BLS3ZZQ3N0bXBvYmZRd1FCeHVk?=
 =?utf-8?B?UVBzSzVhVFBtdzdhR05uV3VMZi8rRUpPK29yRTk0aDBqcUZsOE5TdVVaaWp0?=
 =?utf-8?B?NkkwUUFxVGZMcDdLWVB5REtyS2ZGclN3akZTVWgrOXE2Tk1GL3ZIK1R6R284?=
 =?utf-8?B?V3dEcHBMN3NyNFFPT2JzcCtkNUtpRHBISlVpblR2NFJNOUJGM0ZydVpFT0dG?=
 =?utf-8?B?ajJrd2swTEl4LzRsVi9RYVIzeHFLUTdtVVFIRXlNRzEwTFhsb0RDT2oyeWx4?=
 =?utf-8?B?bENTazBnWDZnbjRFNGxrcDBKT0FVU2k4aWtDRVZCZHo0ZUZsYXY1eXp3OGI1?=
 =?utf-8?B?TytJclNMRkRDNVAyTHlNWHk5K1RxbVp5Q3FHSmx1SENoc1c3OCtzV3UwYlh0?=
 =?utf-8?B?c3RyNitXQ08xdFJGUDBXa1BqdEFkM0lFZy9iNFM4VHAyRTFIR0g1UEhwVDJm?=
 =?utf-8?B?U1pORVVYN0lWOExoM0dKKzdiL0w0YkozcFFaSllSWnRHQmgxanVjRmd1RHJG?=
 =?utf-8?B?bThRUDg0cGhtaS9OTjIwWU5XR2plZFRJc1BUb0dKUVFEZ3M1NXhvRUNVSlFl?=
 =?utf-8?B?T1M1QWNZNkJUNVdCZGFiWXRNWDErdzF1dFVUWEV6TFYyakZhYzl1MU9JREpY?=
 =?utf-8?B?VTl2MncxN0ZoUGlTNllHUHVkSk1OdWdKOUVJc2VEcHpKTzZxTEl2a0JKZE8x?=
 =?utf-8?B?NjlSZHZnZy80V1RORjBZYVB5M1RhYlZLSko0MXpzcW1qU1pzNzQrZER4WHBi?=
 =?utf-8?B?V0RHelREbGxwS2lHWStXVXk4SjJnZ2Z5SHVGYVlJbWZqMFB6TUo1ODdQNTUy?=
 =?utf-8?B?WHFiclNVV2xacFJRMXZDYmcxdlFBRmg2SktYUVNiRUQxVlZRYmlSbStRYUZ3?=
 =?utf-8?B?MElpWnVYNXhqd1M1WEJOeG1jMjY0aDdJWmdhVHlrMFU4N3FCOE9pVENQWWpU?=
 =?utf-8?B?MHNxNisxaXZ6U1dkb0JsU2k1YnRvWWRlVTUwYVhEQWYydEhlSEM4UXg1WW8x?=
 =?utf-8?B?VTNGMS9POTc2ZGROYmlTbVM1V0t3di9FWHg5aTFmS1IwcEdiZmg2OXl5RXFy?=
 =?utf-8?B?WS9xbFYvZTAyc1NseW5qbkRJY0tpZUFSY1BYZHVHSnhqTkZZZ2ZXNUFpVm1u?=
 =?utf-8?B?QmpWaU84ZGI5TFArRGxzS0Z1ektWR0F3TlRmOUlqV1B1UEVYdDZEYmtFMEZX?=
 =?utf-8?B?TWhIYXRiVGR0WW11blR3WFlJM2hKNTBycnZDVXFLL2x5K2JWMzhqTUNKdmpr?=
 =?utf-8?B?YVhwWDJFdERqMHFXOEZoTzk4NkN2L3dKMWowUDd5TmpEOVdXNXQ2UU9HdEZy?=
 =?utf-8?B?RzlldjNDTFhWU09tZ285d2w4QTI5SDl2elNxQ0FvZlg5QlFsNkVBOHlscTJP?=
 =?utf-8?B?MTJrdFNMbEFpWDlSYkpDSHRRS3RDbjBKNzFwaUgrdVdoZWhxVCtQajFDZXNN?=
 =?utf-8?B?aC9OeW11WnJoWDJJT1FlNTU4Vy8wRFRaaVlPY1ZQL1p1bmF6b2JENEdOdk4w?=
 =?utf-8?B?U29MbFVBUm5mWFI5a2xOTkdiWWxnUlExRWZpQThqMWVMWDlnSk5oZzlRVjQz?=
 =?utf-8?B?NEZkUW1WR1JGcDZub1o3ZjhMYlk2STM4OG43cmhnNDUzeExuV1JyTHpZcmJR?=
 =?utf-8?B?NDZJWUhOOXBPeVBOenpkbVhkQVRoLzdySHRZWm5RaWNIV2l2WTB5MFM3SmF1?=
 =?utf-8?Q?ZEN5HEl/FDZy4Bu11V7LQIERdTJVOFMC4LLN55p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b43f74-6c43-4383-cb71-08d8dd8f202f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 15:23:26.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ju+gT8TDt3ht+ZkKe0Kq8HIxoqW2O8GQZmsVnFyzL/lpItYsSOY006vM4t/bfANUClMddtSK83UxipFofq5CSdKpq6QF+V1EzXqPR0td3nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3560
X-OriginatorOrg: citrix.com

Hello,

This is a total mess.

libxenstored does not have a stable ABI.  xenstore_lib.h contains:

* struct xs_permissions, which contains an enum - one of the very common
ABI traps.

* the prototypes for expanding_buffer_ensure(), sanitise_value() and
unsanitise_value(), which are inappropriately-namespaced symbols in
libxenstore

* struct expanding_buffer with a classic string-handling trap (int len).

* Various xenstored-internal details such as struct xs_tdb_record_hdr,
the internal permission bits, as well as stuff like
xs_daemon_{root,run}dir(), and worse xs_daemon_tdb(),  which have
absolutely no business being external to xenstored.


Its clear that most of this shouldn't be part of libxenstore, but that
ship has sailed.  3.0.3 is broken and cannot be fixed.

My best suggestion is that we freeze 3.0.3 where it is, and create a 4.0
which has all of the xenstore_lib.h content deleted.  That, AFAICT, gets
us something which is 99% compatible, and stands a chance of being able
to kept properly stable.

Thoughts?

~Andrew

