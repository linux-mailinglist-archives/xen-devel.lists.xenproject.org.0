Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D636FE19
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120599.228109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSl-0000fV-2H; Fri, 30 Apr 2021 15:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120599.228109; Fri, 30 Apr 2021 15:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSk-0000eh-Qp; Fri, 30 Apr 2021 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 120599;
 Fri, 30 Apr 2021 15:53:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVSi-0000cv-OZ
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:53:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 383de63e-048e-4b57-b395-a2ed92b46ed9;
 Fri, 30 Apr 2021 15:53:51 +0000 (UTC)
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
X-Inumbo-ID: 383de63e-048e-4b57-b395-a2ed92b46ed9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3QI6nIHICm7IiETY4sabstkRIAffc6tHvTWeY2+r5kw=;
  b=Bjbn7xNSZyDmgG7BKVjdfIjwwiuWTknYp0iW8RcyzUy/mUXraxbVj54U
   CtdNvgVIjRZyaVl0XNQ+KG4GN0nEtqzzUhXAlhjjJyszAnUSh0bSQ63gl
   BB2Z/e6XeNV+gPYY/cWU+uiIIUz1NjyhwdWDWk2H7Gt4TwxqPBHLv9sRf
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: b+jLvBzF4coDP6O8VQIKJdH7/COxxvA8D13kuMeQ0d+c6M7BfrpeMEwgQ/08XK+eXFAqODhGBs
 w4iLc93OKiJRqHpXlDvJGOdNTvtQ92K5oSifGwK65VkDRGYaFXfVZpEfN7LtOBH7laHVRe4sVC
 nmr3yJlNVCejG1FcC+KOTlPaGF3DhiReFMODiZYVYwOqhw9DrxCSMoLi0o97IvNPm0KtNXATeu
 y0aZ5dVT+T+SBab/yPAy8oO9CeTW7mh/vAX6gc3ghWbbP3BI3d53eZZ9fXq05+cS5x93womncf
 t2A=
X-SBRS: 5.1
X-MesageID: 43199232
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4mjqk6zUzNbHoIIWf9mMKrPxvu4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheVysd07o
 0lSaR3DbTLZmRSpczx7BCkV/Mpx9ea+K6l7N2utktFZwdsdq1m8kNdAgGUDkV5SGB9dOIEPb
 Cb4ddKoCflRGQPYq2AdzI4dsXKutGjruOCXTcoHBgigTPhsRqJ7/rAHwGczlMiVVp0sNEf2E
 zktyC82am5qfG8zXbnpiXuxrBbgsHoxNcGJOHksLlwFhzWhgylZJtsVtS51VhYz92H01oknM
 LBpB0tJa1ImhTsV1uoqhjg0RSI6lYTwkLi0lORjD/CpsH0VVsBeqh8rL9ZaRfQ5g4cush92s
 twrgGknqdQZCmgoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJ8Cv47bW7HwbFiNN
 MrINDX5f5Qf1/fRWvepHNTzNulWWl2NguaQ3IFptee31Ft7T9E5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTSq5hGuEbQ4+SBnbWSRzBdEKeSG6XWp0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCo8YETrBcqS3IBa8xzETWmnNA6div121txcgPnRVbDrOSqMRBQFiM27ucgSBcXdRr
 KyNfttcrzeBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OLoXrs+fcYevCPbaFK0dnZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjuZRqEKbb+OAXwJMXNpJFtxUUjVjR3LDLFRRy9ogNOG
 duKrLula224UOs+3zT0mlvMh1BSlpO7K74SHNMrw8SO0byebIO0u/vPFx67T+iHFtSXsnWGA
 lQqxBL4qqxNYWX3j1nIcmgKHimg3wao2+qQ58QlraY39rsfoo1A/8dKehMPDSOMyYwuA5x7E
 9fdQcPRybkZ0jToJTgqKZROcbyWJ1XhhyxLctdtHTF3H/s3/0Hdz88RD6hUcmenAA0YSFb72
 cBvpM3iKacmDqpNGs0iPk5NloJc2iMHLdaFm2+Ffhps6GudwdqQWiQgzuGzxk1Z2rx7k0Xwn
 fsNCuOZJjwcxNgk2Ed1qbh61VvcGqBO0p2d3BhqIV4fF62zUpbwKuOZqCp1XGWZUZHyuYBMC
 vdaT9XJg913di42FqUnzmFfE9WsKkGL6jYDL45davU1W7oIIqUlbseF/sR5Y17LrnVw5w2eP
 PafxXQICLzCusv1QDQrnE5ODNsoH1hlf/zwhXq4GWxwXZXO4ubHH12A7UAZ92M5WntQPiFlI
 90it84puO8OGT8YNzu89CiUxdTbhfI5WKmReAhrp5Z+b8ovLxoBp/BTH/G0mpE0BhWFraFqG
 oOBKBgpLbPNY9kc5ZMJ2ZX/l81mM+OK0VuuArsGeM6dUwsiXieP97h2cu3lZM/Rkma4A33Mh
 2D9icY+fHPVS6Kz6QbBKI9On4+UjlI1F1yuOeZM5TNAwCrffxZ9FW0MnWhYKZQIZL1Zok4v1
 J/+ZWUhOeZeCrzxRDIsTZ6KqxI9Xy7QcnaOnP8JcdYt9qgOVqNhaO24Mm8yDfvIAHLF3gwlM
 lCaVEaaNhFh30rkJA3uxLCOJDKng==
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="43199232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx8PbYQeGFznCJLGvd1TDRysETJAgN+yBr/NvxucF2bquHkGsB1zocYjqwEVGWfnu5wu1XC2y5JsnB0AM6L66yNKAyjPFH6O/XErj1aj/xDyIcyhhEKd1LsqnL/2tsWEpuSnHVL/Spb6q9CaLqewvQzDpqWywemkCKreitEe8eqxeAeqOQzbaGkUGmOkHhazEfeTk/p/shypTxCzcFXaJAUTuvCeOTlqbr7rJh9THMTnlvfYysXvyXHZWrICC+9N1lgGHyDVcwhLUFRPMgICZZfrawI+OKG4K8hqL/N+L/rr3XYSfM+37SDHahkclrZJzE388C3PX7sLtUlSC8C10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReYtIhfneceED5ekYrJYnGrommG0WKr3NQgh92cs/8w=;
 b=icTsCbe+UVNYdBLCQTWMeQKJm0/psLBXHZEaeNYx49KVLkZ9ButF0GYANcvuASYmSuy1S9YVb9oVo0nyA4d7G8ncdkQJ2DNcxJEzJCoQZ6QtK5K7uPFzxW3DLz39vfuICKIctSDZdJnmQdRQoH9xIqSNcsQD7AXIegFNZwAq0sg9m2AeAyMHq7XRfw+sH9irRtbN+CB7JINZ1v52L8QkdhnvUGYqEss7mJYM1UH8g0w/OjExwn+C+6iqNxC7R1pUgjAs8Qmnz0GcCMy7ldJjqOIatHVOaBm6ZhiRcqEfzs7BYziOKGoGP0s4xmsv+PxYY1pMWooATMaMBvO8WGiZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReYtIhfneceED5ekYrJYnGrommG0WKr3NQgh92cs/8w=;
 b=OIFBmtJH+57JqD5P/CZIXmTSH6PzLn8Xft847pmnZWwSS6tH3ZxPLq0bUGRgcnaaumgHUniqlTZ8p+zS6T0+Ad4NN2Y39A5VC0MVnLCfZ2i6xXVcKnHJM4vIF1FNTsMh8kZgwlcg4RVA1VbRshmqXip+Wiue4VQfzkXGVxFW4OY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 03/13] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Fri, 30 Apr 2021 17:52:01 +0200
Message-ID: <20210430155211.3709-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20912c23-6269-496a-e325-08d90bf02424
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923FDF6DAC9FF511B9C04158F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5aITIx3FG28L2Et90HdUdi94T6lHdCsO+sUeQ95p0vyieQ/EPjFmrAE+xy02rpbJZ3EfgjM3D24SMwgvOfSgOm7EeTmnA+fXqzpgfgJqCWZAhAT5ojw8I9U1PU8CxQ1o4J1VFIen3nkVjPYBZSayHyZcUYo6WB7pmyUfybyLqzzwDxDIqyVK+W/U9SCSUhZLtUpJsj2P5J22GOkezc6/r5ddkXQtYi+FXa9X1TDHNSJ0GJlIUfTHSe7U7SWbGx4/j7ZT+QioAi2esa0dG+m/NPyw6Yjem0rwwkyuk9yuvc5Y8ATkd5I3wvGJZdLXIS0lfolNpfwi96x5bKe6W76tg+c09DYo4p5xiPyIgksmgvT20MpYzyWtQaiAk8+QO5kXhScMcEvoiXOT+i0x9bkKsySVBKl9pjM9JPvs7tTxl8vP16pcMlcjKH9fnkpj+RAE36ER5os5CQyel8QX+QLyKD1o7YfAuAm6IZ+FEykKR3P7WjUgjAtAnZ1yF2nHM+Et1W6BzCKgwmdZs3gJuMdMIuVPzHNpebT2vJ98WNk50TGeMpbAg19fLNsgZkIMfJKK6bhooMWv7YASKz7Tn+1iXBjIEiacV0mzmXaXamm198=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(6486002)(2906002)(5660300002)(26005)(66946007)(316002)(2616005)(38100700002)(66476007)(478600001)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWF0ZDczWWpucmZjVlhYMWZzQ0xoM0lsZVNnVE9WUDF5czB4L2xLSUZnaW1I?=
 =?utf-8?B?K1RDRHd6WkNRUEVaZjZQT00yM1pYeWZpcTdNRWZHQlNWZWhjUUVKVUhWNVN5?=
 =?utf-8?B?algyZDZvSFQweFJZL0dPb3lTK1d0WldsNFJnWE5YWklhcngydFRqUzY1VTRL?=
 =?utf-8?B?ZGtkRWJ2VERPWldLbDNJMHhtRmgzNVhCbEtFOURwcjFLdmhTZ2JjcmkrOUtS?=
 =?utf-8?B?dnROQVNOcWVxcThjWnVHYzk3a1Z6RW5pSjRVOWVxWm1keFZnM0g5b3ZZNnU2?=
 =?utf-8?B?ajVVR1VOLzNsUFZnQUVPd0lYNzdtR2M5QmZoWngzcWxFNkZ6OXdQZThINUtS?=
 =?utf-8?B?dTh3WnNiSHFVM1VDdjNlWjVoQnJoaTVJenY5TnJsZkIrR0pNaTdTVTJLMlBH?=
 =?utf-8?B?d2lSYUtFTW1BVFFKbmw1S093aXJQTFhTSHB3clJaWGhGMWh4STREdXZYSjJK?=
 =?utf-8?B?VmFFNVNoNWNFRUZTT0h1bFprVDZ4b21aVEo2VXorS2FrQXFVdFltNnpkcGJZ?=
 =?utf-8?B?UUdDMDBPd0ZoUXZtTjNPOFRwUlpYQVVUT2taZS92YjN4cjh4cjZETmRTLzN4?=
 =?utf-8?B?OGxWYzRUY2dXWXNpNGRtRnBaT1JqM01kWWtjbDRwb1lORFhnTFNQdFFBakNN?=
 =?utf-8?B?OXpuZ1N0dlJVejh2cmllNGNuKzdQY1cxMjhUVWxaWlE4ODA4TkNaSGt5UXd3?=
 =?utf-8?B?NkhPZTRNOWJCOXdYL29lVW1ZbXRiTVhQQkNxdDVZTEd0UEVmdzJSSnVKeHda?=
 =?utf-8?B?MXNkcHpPRWk0emp4WkJyZHFOakF5ZGN3eUZtU2daMisxd1FJMVFQdDh6RHJt?=
 =?utf-8?B?eTd2bG1ML1Nud01nK0ttcmxWbjBJOTJsQUhIMnZaOVZOQjlGa1haQzMrQkVv?=
 =?utf-8?B?MzdTVWllbHpNdm8vK0tDZlBJY0RCUkZqWGxEQm1Db3BSV3MyWEVpazRQdXVV?=
 =?utf-8?B?REducGhob1pnbTUwVGQvbXZqUTZHUW5jUkI0eWgzMVVUdVFEeVJyL1BUR1cz?=
 =?utf-8?B?SlVkOHlJeXhsWDRCL3ZBdmhLY0ttU1U3VVlqS0txL0tZS1dCY0JyS3pvd2Nv?=
 =?utf-8?B?Njh0cVE4enk4UWJkMjRDcGZrRUdRYWFRcWdBQ2NoditiZ2NYdG9qcldjYk0v?=
 =?utf-8?B?UTlYeUF5bzRmOEhaR3pIc1NMVkMvcGVpdG9obk9SblFkSDZKYkFjaE52NVFp?=
 =?utf-8?B?UmV6QUg1V0VSZnFkSXpYcFZTR3pySzQyWjRkQUFYK1dCOExvVFpadnZLUUJM?=
 =?utf-8?B?TWJyQlkzRjlsamU1NWw1UHhSSXRCbnRRcEhTbWZ3YkVpQmlySmxaT0kxVlpC?=
 =?utf-8?B?dHFBd203ckwwOWduaU0zcE85LzhVK0orUXJWS1JmRGZBRVlqc0RoV0R2bWF2?=
 =?utf-8?B?SG5YaHI0VUdjdVJ0OFphKzZtUUR1VXhYNi9BMERQSTRZSHNzUmsvUVFVem1I?=
 =?utf-8?B?T3liK3VjcWNwTnRlY3hmakVuUmIvYU9SQmYxY0tIRmdIV1htSnRvMFZiY2x2?=
 =?utf-8?B?ZUhaSGdsV2lqeFdXSnQvNnZGQWFod3gyeUcvZnBrTjFtSTVqS2R2NWJ6MHlX?=
 =?utf-8?B?YTZ3aU8zVkk2c3QxY0xkcVVJelp1QlZPTytJak1MMWh0V0c5aDByNnU4eUtH?=
 =?utf-8?B?UlNtMno3QTVwbXk5RVVlL3F3SEFUVXZKbTdvbHRkTkREM29TUWdtODVVTzE4?=
 =?utf-8?B?SkZ0U2tCK1B2MG1ubytlazdMUXZlZlZINUo4VDlSUjQ5QlhSaXUyKzZtVHpK?=
 =?utf-8?Q?MddXE/3vQuhJvaBIFocTp9rkROrBjgoTxzxzWUA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20912c23-6269-496a-e325-08d90bf02424
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:53:47.7981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6jBqpnSLD/DNbJEGZagIN2YG8DEMk0Yxf5BeeaSySkK4ft3RQvEwyPmYF+2xLxpqtHgeTFQojS+0h9ozOyNUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format. Provide a helper to perform a binary
search against an array of MSR entries.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce a helper to perform a binary search of the MSR entries
   array.
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 42 +++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index cbca7209e34..605c632cf30 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2611,6 +2611,8 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index de27826f415..9e83daca0e6 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -850,3 +850,45 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
     *out = *tmp;
     return 0;
 }
+
+static int compare_entries(const void *l, const void *r)
+{
+    const xen_msr_entry_t *lhs = l;
+    const xen_msr_entry_t *rhs = r;
+
+    if ( lhs->idx == rhs->idx )
+        return 0;
+    return lhs->idx < rhs->idx ? -1 : 1;
+}
+
+static xen_msr_entry_t *find_entry(xen_msr_entry_t *entries,
+                                   unsigned int nr_entries, unsigned int index)
+{
+    const xen_msr_entry_t key = { index };
+
+    return bsearch(&key, entries, nr_entries, sizeof(*entries), compare_entries);
+}
+
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    xen_msr_entry_t *tmp;
+    int rc;
+
+    rc = xc_cpu_policy_serialise(xch, policy, NULL, 0,
+                                 policy->entries, &nr_entries);
+    if ( rc )
+        return rc;
+
+    tmp = find_entry(policy->entries, nr_entries, msr);
+    if ( !tmp )
+    {
+        /* Unable to find a matching MSR. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    *out = *tmp;
+    return 0;
+}
-- 
2.31.1


