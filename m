Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CD373BEC
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 15:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123113.232235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leHAp-0000Fg-Fr; Wed, 05 May 2021 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123113.232235; Wed, 05 May 2021 13:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leHAp-0000Cy-CK; Wed, 05 May 2021 13:02:43 +0000
Received: by outflank-mailman (input) for mailman id 123113;
 Wed, 05 May 2021 13:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTpK=KA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leHAn-0000Cs-H4
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 13:02:41 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 739b3a11-843b-4d91-b042-2292c8c169a4;
 Wed, 05 May 2021 13:02:40 +0000 (UTC)
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
X-Inumbo-ID: 739b3a11-843b-4d91-b042-2292c8c169a4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620219759;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gJKGYj+Nzb6BkT67+vGyeUJmxadccntF3exENqCL1Oc=;
  b=IGgngk8vhSfVMAS6ZI2wMcjSYpJeuaXuATo2P3i+cv1FkQJh/xMa57HT
   MCv8bgbi8JTfY0pd/0YhScdCNGkSFr+nWl2Tg6jX3pVwC/k0NTik1aXBS
   z2ehqoBIUGDG1RbAH28Y5dxZ5rc9gsyp0XdbPs9CYCj+7FcagcWHecX09
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FGy4Bl2e/rmRYyWJdqtDeiY1NDrOAKoOnlnRWkvotpmdu4n5mLx9agfkLtn2lv2W2w7wv10HGe
 WXeKnBLWQalC4zEyIdviI5Tbg+Yat/pEdjznOIycaVH+MMpzBYh22O99aaxmFgRYS/oLenPN45
 Ka/9I37Y8ebL2qG75+oMuA+Vgl+/EJtjN/ecGz/qlYvS6cfC5hA6vGHqQ2Imjg84pHgcxW2oeW
 i4wQsekuhstdQmHadruzMpjCeYT3d1KSBcbR10TSLx6kQg/SZ6j4WNDt7OecoXbZgrxzlCxbU/
 ePM=
X-SBRS: 5.1
X-MesageID: 44632269
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fjuF2q1VXb2uYJn8nHYuzwqjBWhyeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035hz/IUXIPOeTBDr0VHYSb1KwKnD53nbGyP4/vNAzq
 sIScJDIfD5EFQSt6nHySaiFdJI+re62YSJocub8Ht3VwFtbMhbnmVEIyKWCFd/SgUDJbdRLv
 qhz/FKrTahZngbB/7TbhU4dtPOusHRk9beaQMGbiRN1CC1kTiq5LTmeiLovSs2bjUn+9Yf2F
 mAqSPVzOGJs/a3yhjTvlWjlah+qZ/a5fZoQOCJgsgRAD3whgivf5QJYcz+gBkF5NuBxXxvvN
 7QowoxH8kb0QKsQkiF5SHD9iOl8DEy52TswVWV6EGT3vDRdXYBJOdqwad6GyGpj3YIjZVH/4
 9gm1+9jd5xCyjNmSzsjuK4Ly1Cpw6PjlcJ1dIIg2c3a/p4VJZh6bYx0WlyC5k6ECfz+OkcYZ
 JTJfCZ3vpQfF+ABkqp2FVH8ZipVnQ3KB+MXlIPjMyTyyRXh3B01SIjtbUioks=
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="44632269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImhhaJUQv0ROwftVlnBEAfDQ511HYywA/8HwvXRV+/TwNaKH4lQ7VorTVeKcSEpgs0HIr5LAkxoYWfCu6OMK1WvtQRRfu/xEbaBKEIt5wsqxYhxrO+HZpWdVuwoh0hVxVRrrlMc6Efg53c45bmWruLXJalZDxaEcDEPn3HkiqMuyEYV5ipjWLn+R3H9YFDQlkuQC+hRagDWYE+IT1q7otHfHqEh8kwNGzvLAxbpnotIwefuoNk7+3Ae8WV2DGcVvNmWn6B6PwDRHUPejS+4dGXvMZVTFedMUSGvqzUcnFGizTfZv3JWu9G42+93V5wCDCqVA3M7srqXYZqMPPxdsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69lMYP8/qjV5XQc9EmLgQEsvF0WnGMorJ/qTLKU2aJU=;
 b=CrRYuACfyNMuMrI3kDBZv4jnQSJkwDOqiVzw+yYPtJbmuQELBIleK95If+d84RzieUcPC6AoUxWPyk9l3W8bPFqoKLwUtXV4JRT6E97dPkU20HOFJZXxuB1XiGVHsow0mYFW9qdjcaESXmFKIuuhfjxeZ+TpzbZrpMbHmzEmzYvWRJgskQt4nJUH0c27SDRF/wTk1LitCJPu4Q/w3XCvsrY3EU6RRWB+vp2T6nCMqNJFt22SGEPuKB/cppsdPgSSO5+LF+oXVqy4n9DBu2/g4rJzm2d1y8MHmmryAgWlfHMbi84Y7ZoG3HGonjoFWqfP9i8gEX43wHuQw9qPO39ZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69lMYP8/qjV5XQc9EmLgQEsvF0WnGMorJ/qTLKU2aJU=;
 b=qmlQmxoxgHSVKSlR4Q29VJ3PgyugmXb/tQFmTNLNzC1hN/+f4Vh6mOt1C8uuN0dL1ADD6u8HqWxwSv3il0Pu6bpQa5jYl07CSgIXz4QmSMIRnBcrRzClX09CB1AQIOXqNJZQx4jLAGlxj3MJMqEyhbA0FmqyDcW/NQy9hpmrd0g=
Date: Wed, 5 May 2021 15:02:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
Message-ID: <YJKXZyCHpRg32tyc@Air-de-Roger>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <YJJtqyDOIkMxjvxW@Air-de-Roger>
 <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
X-ClientProxiedBy: MR2P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::17)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1489d14f-7db3-4351-f179-08d90fc60e32
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5605BBD1E0B3E9E61E2501D88F599@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOfvxskYlYjiIgHHQ4Z0oNrxUgTrBdO9nuHle6D5csmvZIBuNX4l5oID6A5WWZP+VOb149M38CVqNvAKZjUlZr7W8ZBmQF12b++9ENSaSf/4cJNnLj3fef84zObg23IJh7N5j2nmeGN/MXHf+13u6pk0BdFQdp+UwOvlRFdv94vcx/giIrmiPOsLciZwf4gBCtK9DKhjSFlV2eqfqVhvk0aQsl/k1n1S4LaDuzEkDq/VhVqURF/p9DDHU569wy9nmtvkgpPoE+Uq8giPmyb5EMe1gjPX8O+KhnpG2HDrORlbBCq9YJ0OYi7m1KJFX6FN3ZPlbOd7KfeiCkjLp0aQA236iUzhBaO063kK9H1ojRBSnnx9u7w0f6xDXg9740xAZnIak+4ZkeJjRtNj4EKMM0PxngN19YxoxcxdsujNSqqkHNAdrGETNQupZN/XWVgWiA1aCBy7BHRlB3HyqW/MlZrkWf76+tBYCi/65oBP9oLP0IHpPfRJ+m9NntQNTSuFP6ujTflaNxqsRMIbX20+/N9Uchue7EygWshaaC4TWK5w7Wx2uk1DE+zAHUk1B4yQFAG4DE0LwoMyMlKR8VIYoLY6jYyhdukjGnfeNHJVLLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(346002)(366004)(39860400002)(396003)(6636002)(53546011)(66946007)(66476007)(86362001)(66556008)(186003)(26005)(5660300002)(83380400001)(33716001)(6486002)(30864003)(8676002)(956004)(8936002)(16526019)(85182001)(38100700002)(9686003)(6496006)(6862004)(316002)(4326008)(54906003)(2906002)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGtFYlUrY1VEbDhqTzJBVkNqamppNzk1MmplbWk0ZHZyNk85b3Nmd0NmaERM?=
 =?utf-8?B?RWszc0lRNW5aejlFcWlka1YwQi9nTkNFSlBpeHhlR0pnakM2dXdGMHV2N2xs?=
 =?utf-8?B?YTdPS1dkUEl4VitEc1lGUEFZb284anIyeHFlbFRaOE5wcTV0N0d3VmhvV3FR?=
 =?utf-8?B?a0V3UFl3UUkySXhBakkyRzg2L3loc2FFSjNrdWV0Smd5WEtSakprZExTSUtM?=
 =?utf-8?B?bHlMbW13V0JFaVZxV2l5UFgyc3N1MGlpVTNBbzc3RWYvTk43ZXhCd2xKUnhj?=
 =?utf-8?B?aTNuSVMzMUhCdmtKWThyTVQvR1FIa0RoanZVOHFjU2pMclBmWTR3MUMxL2lT?=
 =?utf-8?B?QnN2ZHM5MmtubUVzNWN1ZVY3eXdzOHY5dFBTSURmaGl5K3AyQXZqNHJkWG9D?=
 =?utf-8?B?bGNDNElybHRSNEtYelNKaWZsMndMakJrSkF4VVRLQ25XeWRneVhsTFdQV0lo?=
 =?utf-8?B?RTE5SHlzaytUYVZmVFErZVpKUzZLUnpDQ2dLMUx6NnFxNmFVbzNIOTVGUEZI?=
 =?utf-8?B?K2ZUcXBrSnNGYkJSZE5LMnZZdDZKZG0wUnFNU1o5NXZvN3Vkdkk5WWNtSU0r?=
 =?utf-8?B?VUVaMGxYZkJxSE5sQS9vTHkrWWtGRkZKYmFjVjdvSWR4ZjNvVnMxMjVBa21W?=
 =?utf-8?B?MnhDTTk4TkNwVktiNkJjdE9ibzR3QVY3ZVJjR0RteXVKaVBHRUsyS0xaTjdq?=
 =?utf-8?B?TW9INGtBaU1udzRaYkxRbURpRWhJbWNZTERRR3pGb0x3enBWMzNlODVmVGgz?=
 =?utf-8?B?MXZCWnc2T0lxTnZ4MkQvT3dSRi9HRUFyV0NOUUJiaGx6RnZic3R3WmJwclR6?=
 =?utf-8?B?Rkc4VnBOa2ZNWVl6WkVDTVA1bVZLN09kem9MVmVkb0d5UE9WV2RWTW5ZRWVl?=
 =?utf-8?B?T3JnTk0vL3JHaFFuUTJlbFQ2MVdTTWk1cHF6WnpNdWVQdE93OVdCNVhPekRQ?=
 =?utf-8?B?NXBEUmNVMmFMUTBDUE5kNnduVjVEbnRzN2RHVGxOWlVSQkJQU25tVGU1Q1Ur?=
 =?utf-8?B?azcyZjhZc0Q5Yk9jcHRrYmt5ekd3Vm5udG9OSkhuZ1h4aFNoUnQyUFZSdHo2?=
 =?utf-8?B?OFN2SHNRL2ZZcVpRSzIzcjU5a2hPUy9Kamc5U3RLZmxyU0VUQmpsWnBoenA5?=
 =?utf-8?B?YStxdlNTMS9PdmJDeUF2WXFkZitSb1NMemwrTTVsWXJnUVJBcXdsVmgxcXRm?=
 =?utf-8?B?VlhQOHdiOTRxWHNLem5qUTNnYU9QcXNtR2ZoK0tSMVB1ODk2K1JsMVVtWU9Q?=
 =?utf-8?B?b3MyZ3BFTlQ4UGdoTG96aEV5YlZJbkRBbm51RnRFUm5kY1hjTDlzSkJtL3pz?=
 =?utf-8?B?c08zL3hHTTdrWlcrVUEwMmxPV0xNckVsclhsSlE2d2tqRCtaYjFmZktkUGsz?=
 =?utf-8?B?U2VRdUxISzFtUnBEQnNFaHpzUFdnUkpBTTlKZlV4aTkxYzNlUExhdS9lQkRq?=
 =?utf-8?B?UkRNa0hjeFBhQ1ZidEZRbmM2RytydzZxREJIdWVXeFg1MGhWTjNHNDFMRXRS?=
 =?utf-8?B?a1pKaGpHUVpqbGlaTGZwei9xb29DNTduRzdDOXJMVGVKNW1qam4zcUt3WnJ6?=
 =?utf-8?B?ZjRsL1NVWUU3Y21hYUoxNktRMVRzYnA1aWwzZEc4MjNUMHNTOE14NFFCbWVG?=
 =?utf-8?B?SEU5aUlHSFNxeGVWczVZdDJURnRkMWxxcXZ0Y3lXcUM1Zk5VejhSbzJFQjE1?=
 =?utf-8?B?azg0OFhYWU4veFAvY0xJb290MElpRHR5cS9xZ2wxTHk4WC9iRmZncktWYlNa?=
 =?utf-8?Q?3bWn+t/zUId6jJdRzQ8T46iyeiMRTmSu85t6Mxh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1489d14f-7db3-4351-f179-08d90fc60e32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:02:36.7051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtJGB437bFTUqMdXE5n/I7IJT1wlfNPolt0ANpwg+rciOpg1oZX+lWNecS5iuQkbeIVPYSM4ovXLUERd2aPoMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

On Wed, May 05, 2021 at 01:37:48PM +0100, Andrew Cooper wrote:
> On 05/05/2021 11:04, Roger Pau Monné wrote:
> > On Tue, May 04, 2021 at 10:31:20PM +0100, Andrew Cooper wrote:
> >> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
> >> index 75973298df..455b4fe3c0 100644
> >> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> >> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> >> @@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
> >>      }
> >>  }
> >>  
> >> +static void test_calculate_compatible_success(void)
> >> +{
> >> +    static struct test {
> >> +        const char *name;
> >> +        struct {
> >> +            struct cpuid_policy p;
> >> +            struct msr_policy m;
> >> +        } a, b, out;
> >> +    } tests[] = {
> >> +        {
> >> +            "arch_caps, b short max_leaf",
> >> +            .a = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +            .b = {
> >> +                .p.basic.max_leaf = 6,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +            .out = {
> >> +                .p.basic.max_leaf = 6,
> >> +            },
> >> +        },
> >> +        {
> >> +            "arch_caps, b feat missing",
> >> +            .a = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +            .b = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +            .out = {
> >> +                .p.basic.max_leaf = 7,
> >> +            },
> >> +        },
> >> +        {
> >> +            "arch_caps, b rdcl_no missing",
> >> +            .a = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +            .b = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +            },
> >> +            .out = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +            },
> >> +        },
> >> +        {
> >> +            "arch_caps, rdcl_no ok",
> >> +            .a = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +            .b = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +            .out = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rdcl_no = true,
> >> +            },
> >> +        },
> >> +        {
> >> +            "arch_caps, rsba accum",
> >> +            .a = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rsba = true,
> >> +            },
> >> +            .b = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +            },
> >> +            .out = {
> >> +                .p.basic.max_leaf = 7,
> >> +                .p.feat.arch_caps = true,
> >> +                .m.arch_caps.rsba = true,
> >> +            },
> >> +        },
> >> +    };
> >> +    struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
> >> +
> >> +    printf("Testing calculate compatibility success:\n");
> >> +
> >> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> >> +    {
> >> +        struct test *t = &tests[i];
> >> +        struct cpuid_policy *p = malloc(sizeof(struct cpuid_policy));
> >> +        struct msr_policy *m = malloc(sizeof(struct msr_policy));
> >> +        struct cpu_policy a = {
> >> +            &t->a.p,
> >> +            &t->a.m,
> >> +        }, b = {
> >> +            &t->b.p,
> >> +            &t->b.m,
> >> +        }, out = {
> >> +            p,
> >> +            m,
> >> +        };
> >> +        struct cpu_policy_errors e;
> >> +        int res;
> >> +
> >> +        if ( !p || !m )
> >> +            err(1, "%s() malloc failure", __func__);
> >> +
> >> +        res = x86_cpu_policy_calculate_compatible(&a, &b, &out, &e);
> >> +
> >> +        /* Check the expected error output. */
> >> +        if ( res != 0 || memcmp(&no_errors, &e, sizeof(no_errors)) )
> >> +        {
> >> +            fail("  Test '%s' expected no errors\n"
> >> +                 "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
> >> +                 t->name, res, e.leaf, e.subleaf, e.msr);
> >> +            goto test_done;
> >> +        }
> >> +
> >> +        if ( memcmp(&t->out.p, p, sizeof(*p)) )
> >> +        {
> >> +            fail("  Test '%s' resulting CPUID policy not as expected\n",
> >> +                 t->name);
> >> +            goto test_done;
> >> +        }
> >> +
> >> +        if ( memcmp(&t->out.m, m, sizeof(*m)) )
> >> +        {
> >> +            fail("  Test '%s' resulting MSR policy not as expected\n",
> >> +                 t->name);
> >> +            goto test_done;
> >> +        }
> > In order to assert that we don't mess things up, I would also add a
> > x86_cpu_policies_are_compatible check here:
> >
> > res = x86_cpu_policies_are_compatible(&a, &out, &e);
> > if ( res )
> >     fail("  Test '%s' created incompatible policy\n"
> >          "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
> >          t->name, res, e.leaf, e.subleaf, e.msr);
> > res = x86_cpu_policies_are_compatible(&b, &out, &e);
> > if ( res )
> >     fail("  Test '%s' created incompatible policy\n"
> >          "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
> >          t->name, res, e.leaf, e.subleaf, e.msr);
> 
> That's potentially problematic, hence not including it the first time
> around.  See the discussion below.

Right, I think being able to do what I propose would also allow to
detect missing bits between x86_cpu_policy_calculate_compatible and
x86_cpu_policies_are_compatible.

> >> +
> >> +    test_done:
> >> +        free(p);
> >> +        free(m);
> >> +    }
> >> +}
> >> +
> >>  int main(int argc, char **argv)
> >>  {
> >>      printf("CPU Policy unit tests\n");
> >> @@ -793,6 +941,8 @@ int main(int argc, char **argv)
> >>      test_is_compatible_success();
> >>      test_is_compatible_failure();
> >>  
> >> +    test_calculate_compatible_success();
> >> +
> >>      if ( nr_failures )
> >>          printf("Done: %u failures\n", nr_failures);
> >>      else
> >> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> >> index 5a2c4c7b2d..0422a15557 100644
> >> --- a/xen/include/xen/lib/x86/cpu-policy.h
> >> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> >> @@ -37,6 +37,28 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
> >>                                      const struct cpu_policy *guest,
> >>                                      struct cpu_policy_errors *err);
> >>  
> >> +/*
> >> + * Given two policies, calculate one which is compatible with each.
> >> + *
> >> + * i.e. Given host @a and host @b, calculate what to give a VM so it can live
> >> + * migrate between the two.
> >> + *
> >> + * @param a        A cpu_policy.
> >> + * @param b        Another cpu_policy.
> >> + * @param out      A policy compatible with @a and @b.
> >> + * @param err      Optional hint for error diagnostics.
> >> + * @returns -errno
> >> + *
> >> + * For typical usage, @a and @b should be system policies of the same type
> >> + * (i.e. PV/HVM default/max) from different hosts.  In the case that an
> >> + * incompatibility is detected, the optional err pointer may identify the
> >> + * problematic leaf/subleaf and/or MSR.
> >> + */
> >> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
> >> +                                        const struct cpu_policy *b,
> >> +                                        struct cpu_policy *out,
> >> +                                        struct cpu_policy_errors *err);
> >> +
> >>  #endif /* !XEN_LIB_X86_POLICIES_H */
> >>  
> >>  /*
> >> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> >> index f6cea4e2f9..06039e8aa8 100644
> >> --- a/xen/lib/x86/policy.c
> >> +++ b/xen/lib/x86/policy.c
> >> @@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
> >>      if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw )
> >>          FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
> >>  
> >> +    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
> >> +        FAIL_MSR(MSR_ARCH_CAPABILITIES);
> > It might be nice to expand test_is_compatible_{success,failure} to
> > account for arch_caps being checked now.
> 
> At some point we're going to need to stop unit testing "does the AND
> operator work", and limit testing to the interesting corner cases.
> 
> > Shouldn't this check also take into account that host might not have
> > RSBA set, but it's legit for a guest policy to have it?
> 
> When we expose this properly to guests, the max policies will have RSBA
> set, and the default policies will have RSBA forwarded from hardware
> and/or the model table.
> 
> Therefore, we can accept any VM RSBA configuration, irrespective of the
> particulars of this host, but if you e.g. have a pool of haswell's, the
> default policy will have RSBA clear across the board, and the VM won't
> see it.
> 
> > if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw & ~POL_MASK )
> >     FAIL_MSR(MSR_ARCH_CAPABILITIES);
> >
> > Maybe POL_MASK should be renamed and defined in a header so it's
> > widely available?
> 
> No - this would be incorrect.  The polarity of certain bits only matters
> for levelling calculations, not for "can this VM run on this host"
> calculations.
> 
> If the VM has seen RSBA, and Xen doesn't know about it, the VM cannot run.

But then the logic relation between
x86_cpu_policy_calculate_compatible and
x86_cpu_policies_are_compatible is broken AFAICT.

If you give x86_cpu_policy_calculate_compatible one policy with RSBA set
and one without it will generate a compatible policy, yet that output
will be regarded as not compatible if feed into
x86_cpu_policies_are_compatible against the policy that doesn't have
RSBA set.

I think the output from x86_cpu_policy_calculate_compatible should
strictly return true when checked against any of the inputs using
x86_cpu_policies_are_compatible, or else we need to note it somewhere
because I think it's not the expected behavior.

> >
> >> +
> >>  #undef FAIL_MSR
> >>  #undef FAIL_CPUID
> >>  #undef NA
> >> @@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
> >>      return ret;
> >>  }
> >>  
> >> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
> >> +                                        const struct cpu_policy *b,
> >> +                                        struct cpu_policy *out,
> >> +                                        struct cpu_policy_errors *err)
> > I think this should be in an #ifndef __XEN__ protected region?
> >
> > There's no need to expose this to the hypervisor, as I would expect it
> > will never have to do compatible policy generation? (ie: it will
> > always be done by the toolstack?)
> 
> As indicated previously, I still think we want this in Xen for the boot
> paths, but I suppose the guard was my suggestion to you, so is only fair
> at this point.

TBH I replied before seeing your email that also had this suggestion.
If it's indeed going to be used by Xen itself then that's fine, but I
couldn't figure out why the hypervisor would need to generate
compatible policies itself.

Maybe it will be used to generate the initial policies?

> >
> >> +{
> >> +    const struct cpuid_policy *ap = a->cpuid, *bp = b->cpuid;
> >> +    const struct msr_policy *am = a->msr, *bm = b->msr;
> >> +    struct cpuid_policy *cp = out->cpuid;
> >> +    struct msr_policy *mp = out->msr;
> >> +
> >> +    memset(cp, 0, sizeof(*cp));
> >> +    memset(mp, 0, sizeof(*mp));
> >> +
> >> +    cp->basic.max_leaf = min(ap->basic.max_leaf, bp->basic.max_leaf);
> >> +
> >> +    if ( cp->basic.max_leaf >= 7 )
> >> +    {
> >> +        cp->feat.max_subleaf = min(ap->feat.max_subleaf, bp->feat.max_subleaf);
> >> +
> >> +        cp->feat.raw[0].b = ap->feat.raw[0].b & bp->feat.raw[0].b;
> >> +        cp->feat.raw[0].c = ap->feat.raw[0].c & bp->feat.raw[0].c;
> >> +        cp->feat.raw[0].d = ap->feat.raw[0].d & bp->feat.raw[0].d;
> >> +    }
> >> +
> >> +    /* TODO: Far more. */
> > Right, my proposed patch (07/13) went a bit further and also leveled
> > 1c, 1d, Da1, e1c, e1d, e7d, e8b and e21a, and we also need to level
> > a couple of max_leaf fields.
> >
> > I'm happy for this to go in first, and I can rebase the extra logic I
> > have on top of this one.
> 
> There is a lot of work to do.
> 
> One thing I haven't addressed yet is the fact is things which don't
> level, e.g. vendor.  You've got to pick one, and there isn't a
> mathematical relationship to use between a and b.
> 
> I think for that, we ought to document that we strictly take from a. 
> This makes the operation not commutative, and in particular, I don't
> think we want to waste too much time/effort trying to make cross-vendor
> cases work - it was a stunt a decade ago, with a huge number of sharp
> corners, as well as creating a number of XSAs due to poor implementation.
> 
> For v1, I suggest we firmly stick to the same-vendor case.  It's not as
> if there is a lack of things to do to make this work.

OK, so level all the feature fields and pick the non feature parts of
cpuid strictly from one of the inputs.

Thanks, Roger.

