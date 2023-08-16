Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94A77DA32
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 08:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584182.914649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW9gL-0007ke-IZ; Wed, 16 Aug 2023 06:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584182.914649; Wed, 16 Aug 2023 06:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW9gL-0007iJ-Fr; Wed, 16 Aug 2023 06:07:01 +0000
Received: by outflank-mailman (input) for mailman id 584182;
 Wed, 16 Aug 2023 06:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qW9gK-0007iD-0x
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 06:07:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b241ed5-3bfb-11ee-8778-cb3800f73035;
 Wed, 16 Aug 2023 08:06:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 06:06:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 06:06:54 +0000
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
X-Inumbo-ID: 1b241ed5-3bfb-11ee-8778-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTh+lNk8cojYj+F978QlQarmT7IQVx6t+M/HbC/yyoql6I6AxcjBiEzpYA7SgaoMI1gBUONZTa/lNRFNG6zWDjTeKt2Kol8ofUzeg2wjprhRHj+RVIXx4fZrXvMjTltXDNfu15oI/z57Z9mGJlcHVYGGdyjP++oIMdCAdSD6PKkTTp6oNwaZ1jCShcezLsN/EAtCJvwe1aO9XqqcJFmOp6DYZxqritRwaLgbt0muR9AnBNx3MGp7QuhQlDJCznj9C6YnMpNv9yKAocwgg8mYWh3NAJIk2PC8V1QPFExhieXxe1VL6QqPPpU1MvY3rTvrQy2C+DSvkajQ4tSeBOOeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlY9HNhnAINtEJGA0+Ym9REMOZIUc2xSG/Doca9ch/M=;
 b=P8R9ngbI9xkud6xDGNUEt4I5GmYfYDr9dtBlZPWyYDJmoE2ycPUhntbW2HDxsPZU51iK3mxBMa28Nrxe3C02xZ3eP2dV+8J8Flf4UIHsizk3QzvhxAu67nMeNtpy3Ub8OmNJw231bEqonOvL8QlTheTBziVCAgEzUP3gEkeJ74RaEFCywwiLOv+1gHyazYyoYvQA/vDEkpO5qrtW//7PSLb1hy4MXRbHUcQnyiFz5cS36nUo3tCutoKwm3HgNwIs53GsJOg9r7sw4pRyJtOvXVeuauX791cAGRvR+J0dnYhRFjyxtVVab6Kb0ct9UQ3sOzD2PgGnS3RPX6/LXNnYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlY9HNhnAINtEJGA0+Ym9REMOZIUc2xSG/Doca9ch/M=;
 b=fO/4z485jikZUaNxNi9jARMEy8j2+8obzhXj8LIY6geUQceWHemnaW/X9pYbhNdGPKIYObAlZwutK4plun5RPbgbTeZxBNrGYGQlaobfXW8AKpm7515LRCwJDQRMarSJB/ozToe6wEl+q5oYcvXhcegJOxzNg1JQjERCk+th4ZvXiUgLwdRynR6F89lk6KY22RB90to+XFKszHt6MPHqurR5Ep4rDSALUVVeImTjhL+bG7BODpCQJ7J7ytqqpGVQ6ptSIUMKHGMRCPRBkamgAPTTC985gVTjfvPMs/zXgdQaDbNyOSkZd0DiqqSSku8YiXr6ps9ZxOi8oH9Wvc0MxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7aa1ecac-6978-ef52-ccad-a71ff878e42a@suse.com>
Date: Wed, 16 Aug 2023 08:06:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/5] build: make cc-option properly deal with
 unrecognized sub-options
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
 <60da37cf-abec-be58-d433-e98eec0c59bd@suse.com>
 <9dd1134b-8bc8-4fea-a2d7-dd20bd6af9c5@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9dd1134b-8bc8-4fea-a2d7-dd20bd6af9c5@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 888aac91-19bf-4229-7531-08db9e1efda9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nLFrRANUnrGNZzywtZ7KRCyK7AlHkDEA5U8a2L7Zw8lP1y2lFGzmAXj/GG21WvTzla/3QIB6ulEKz9EZNzF32zmipwXaIjvnTwyLze0WhMGRC9M37XyQ13wgRfknuB5lccSe0EFGvHYthRU64W4V2gB+hxEQOaO68aC5W6XZx78MjgXJUC0FI/vTA+A2HO0OZUzJkhQtwtxeXVFu+rUvQB6AoT6FuQI5Ipu0nPfx6UWeEGbciKKglZi/zejxozGxK11Xaz3lrDsF+OSs3UsGQe40cdOlOiJsXYWdw30Se6Et8yrxo8TSpRkUgiHDYzV3QgLzkdHorAEDO4T/FGrIxm4i8ljl1crGTU7SQ8d3YDw1ZDgy8vkdadfnx93MtevDSMQCeuarSZ/ds0oC0YJikFcPV5bK7FtNeX5LPSv8zZ6f7BqzY7nPp0loucu8xtYX08u1PKy2olYx4YPF4Y5R2DBYRX+Ht/gV0LGBrnhUC9q0s9j1Cax4AbLR7KAHLUhZ60GF36hhQOJJ9+SiECyPH6V0y3Ni0nhbvp36uOrPs04X9n3S6efZCuzslzi3KKsmeu7VAsF2GeUkeeV13aYUaO00czrmNnR0oKBMnAmHqUxH5XaJxL9K4y5AXZuV69TwwW5Lp202W0cD+GAcTz8BZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(54906003)(31686004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(26005)(6916009)(5660300002)(2616005)(83380400001)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(66899024)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejNLWElTRG15QWJTSnhaK3ZlVFpadVNDVTMyVzBVUENyZG1DYmNIck94RFJl?=
 =?utf-8?B?ajdxN0ZWdVk4aHU4aVBuN1Z0VmpOUllpWXVXRElMRnF5ZEoydXc1RVdUeGdW?=
 =?utf-8?B?dWtaa05PTE5Pd0FoNFBEd0ErS2pvaUt3NmE2eDJXUmNpcWNPQ0h2aTdmYmE1?=
 =?utf-8?B?RGxSenpQdmlScUUvYUtwWVVmbVRpZGpqTjRCUmp6cXZJY25tZDJ2SDBlR3Z3?=
 =?utf-8?B?ZkJRU2FmMDFsK29LTXFIWjg4Z0kwYUZLNzQwQVE1a3RoZnE4cXFaYzBFUUg3?=
 =?utf-8?B?L1QxTkZTUG1vZU13ZElBaEZSaEN4aEN4UjBUV2JjYjZodVNIUEFvZ3FJS2E4?=
 =?utf-8?B?SmdmUExnNTBHNmRtQUYrMFJJMWR3Y0FxK3JhaFJKWG41eUMxNE1WVEcvVnBt?=
 =?utf-8?B?VzZ1OG1ENEpUNmV0cXRSbktjSURRME1QUDdWakRpYjBsN21MenFrSzZ5YWRo?=
 =?utf-8?B?L3R4MW1Vb2lKSUhCcGw4dzRFcXExNmpZV1QxVW1CaVNsMTlRV3dxc295NFNW?=
 =?utf-8?B?QjMxRUo4M3VyN1lyMi9nS21kd0M4MWNmaEtDcEVYT0NXbndhTFlhSGRyeklW?=
 =?utf-8?B?bmxmWVJGaFhnQ3lxSEVwZkRWQWpXbjkrWHlCMlZzbWtkUW9YcUVIaHhjK2tX?=
 =?utf-8?B?VW1KcmQwVmJqcjQvbDNKbEZvT3lIekVJMk5KRHdpNWlHeU9MK0M4Q0tPelVl?=
 =?utf-8?B?OE1Hb2tFQWpnOXQ4K044L3NhS05McXV1Mmx4RkJjMG84QUxrVTVOS2M5K1RR?=
 =?utf-8?B?eE1MeUE5bDhnUU0vYnZKTklpRHEwWU5CeTl5Z1UvUGJQQ21zY09BeEJYVno2?=
 =?utf-8?B?OXpvVDhJYWVYM0E4S3c2QW8rb0ZqRkdwTnhnN1k4WkpGTjNEWkpJd0ZvUm9s?=
 =?utf-8?B?cnFkdHBYTjA5bU5PMEp2VTBzYTNPZmhIc1lHR2JWdURBMi9oR0lzTEx0S3BS?=
 =?utf-8?B?K3ZtdlVkWTQ0UGRqR1JsNUtXSDRuVjUrbnRRWEpCQTdobkhmOXhkcHJnS1FX?=
 =?utf-8?B?MUU2VTZUZEQ5UmcxRG51ak15b0UyVmNwSmUrU01ITDgxd3lpTDh4bG5acG5Z?=
 =?utf-8?B?bkhsVVZtalYvY0NDVDRKaXBDZWR1T0QzY3lPYzZ5WUpiT2lVNWZRK0lCTlpW?=
 =?utf-8?B?YkFGS1RsNmdweDF6Rkk1UFpKdGx5bW9uaCt2V0dLdEN0Q0FjOGpENHViTmF5?=
 =?utf-8?B?SkVsWC9JVkhkUTdnMi9FLzE3VlpHYXdKcjYwNGgzcVJ3YnI1L1FDSWxSME4x?=
 =?utf-8?B?Z3hqWmxvMXRLZnZBVy8zanRKOHI2ZU8wU3NyR2JKa0FpOVB2NE9qRXVKeitD?=
 =?utf-8?B?RDhnOHBiem1IdDJlTTVrSkkvS2JDTGVzYS9hYkRsQnVQb21vUFJ3UVQ3bk4v?=
 =?utf-8?B?MGk5VjJYNnF3dU01UW9DVkZhSVZqN2xUM3VnSU5KYnJRQmtYNlhGU2RndlhY?=
 =?utf-8?B?Y21PUzVFZmQyb0c3czc4a1p5dGhLQU0xTk9kb2dBZHBSalczMlNVa3BTNG5Z?=
 =?utf-8?B?ODdqTi9vMy9DQ3plS0NGZWgySXQzMnhQclNsbnE1MkJNUVRYZGZOZG1DRGw4?=
 =?utf-8?B?cXZ3Wk1UYnp5ekdtamxtdUlLVFMrM0tQR1JzNmczMHRIaG9TZnZCVVZCR1pY?=
 =?utf-8?B?bVhkYmsvL1F0dEdwUzU5VjFJREgyaHNSamhoNlNoWEQ5N3l0TFRIZFVZNDh4?=
 =?utf-8?B?WUgvTEk1YkZ4QWU4YVhScEZON1BBNUt4em1YRDZaOU1EalVpOW5sRFMvbjV0?=
 =?utf-8?B?TjhBZStCTFJPYURhcWFZV0RudDFDc2tkNm0rNmxrSGJQU1RpZTUxYkRnblZy?=
 =?utf-8?B?MElINll2ZlUzUDZzaUorb2lNd1FCQllMVjFuL1dKdjVLWXhHYlJrTW5BVHp6?=
 =?utf-8?B?d2lOa1lvU0ZhamhLbi9hbU0rLzdnNDlxb2pnYzZSYnEzaUVDZmNhYkpzV2Rm?=
 =?utf-8?B?Tjd4bVAyaHhkSndTVHF1aGlMNXZTeGhGZFQzRDlZMFpYWS9GM1V4aTFMZXpl?=
 =?utf-8?B?ZG95UXUyUS9kcFM2dEQvS21mU0xwRXorb3ppc0J4STVoa1Z4M0hJYUgvQ2I3?=
 =?utf-8?B?TUtjalFjSUl5SGJhNU01Y1V3c042QWdXRjhaazFZUEtQVUhqTDA0WGhPOXJk?=
 =?utf-8?Q?YwFVeOTnQTcaa8rzi2FJVt8U/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888aac91-19bf-4229-7531-08db9e1efda9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 06:06:54.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wG5jfZbnY5V1mbWAyF6bEpP9WNplNM7S0nJfme75FC+3NKcOXBKS32fliuYTp0pQs4b3UhMrQSOSqNYMGreH/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

On 11.08.2023 15:48, Anthony PERARD wrote:
> On Wed, Jul 26, 2023 at 12:33:07PM +0200, Jan Beulich wrote:
>> In options like -march=, it may be only the sub-option which is
>> unrecognized by the compiler. In such an event the error message often
>> splits option and argument, typically saying something like "bad value
>> '<argument>' for '<option>'. Extend the grep invocation accordingly,
>> also accounting for Clang to not mention e.g. -march at all when an
>> incorrect argument was given for it.
>>
>> To keep things halfway readable, re-wrap and re-indent the entire
>> construct.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In principle -e "$$pat" could now be omitted from the grep invocation,
>> since if that matches, both $$opt and $$arg will, too. But I thought I'd
>> leave it for completeness.
>> ---
>> v3: Fix build with make 4.3 and newer, where the treatment of \# has
>>     changed.
>> v2: Further relax grep patterns for clang, which doesn't mention -march
>>     when complaining about an invalid argument to it.
>>
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -8,6 +8,7 @@ endif
>>  comma   := ,
>>  open    := (
>>  close   := )
>> +sharp   := \#
>>  squote  := '
>>  #' Balancing squote, to help syntax highlighting
>>  empty   :=
>> @@ -90,9 +91,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
>>  # of which would indicate an "unrecognized command-line option" warning/error.
>>  #
>>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
>> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
>> -              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
>> -              then echo "$(2)"; else echo "$(3)"; fi ;)
>> +cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
>> +                    opt="$${pat%%=*}" arg="$${pat$(sharp)*=}"; \
>> +                    if test -z "`echo 'void*p=1;' | \
>> +                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
>> +                                 grep -e "$$pat" -e "$$opt" -e "$$arg" -`"; \
>> +                    then echo "$(2)"; \
>> +                    else echo "$(3)"; \
>> +                    fi;)
> 
> This patch looks fine. Shouldn't the comment been updated as well? At
> the moment, it only discuss about -Wno-*, which it seems is why `grep`
> was introduced in the first place.
> 
> But isn't it doing doing pattern matching on an error message going to
> lead sometime to false positive? Linux's build system seems to works
> fine by just using the exit value. They've got a few trick to deal with
> -Wno-* and with clang.
> 
> For -Wno-$(warning), they test -W$(warning) instead. For clang, they've
> enable additional warnings:
>     -Werror=unknown-warning-option
>     -Werror=ignored-optimization-argument
>     -Werror=option-ignored
>     -Werror=unused-command-line-argument

I think using just -Werror is going to be enough. The completely changed
patch below appears to be doing fine, but of course requires me to drop
...

> In any case, the patch is fine.
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

... this.

Jan

--- a/Config.mk
+++ b/Config.mk
@@ -81,17 +81,17 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
 
 # cc-option: Check if compiler supports first option, else fall back to second.
 #
-# This is complicated by the fact that unrecognised -Wno-* options:
+# This is complicated by the fact that with most gcc versions unrecognised
+# -Wno-* options:
 #   (a) are ignored unless the compilation emits a warning; and
 #   (b) even then produce a warning rather than an error
-# To handle this we do a test compile, passing the option-under-test, on a code
-# fragment that will always produce a warning (integer assigned to pointer).
-# We then grep for the option-under-test in the compiler's output, the presence
-# of which would indicate an "unrecognized command-line option" warning/error.
+# Further Clang also only warns for unrecognised -W* options.  To handle this
+# we do a test compile, substituting -Wno-* by -W* and adding -Werror.  This
+# way all unrecognised options are diagnosed uniformly, allowing us to merely
+# check exit status.
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
-cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
+cc-option = $(shell if $(1) $(2:-Wno-%=-W%) -Werror -c -o /dev/null -x c /dev/null >/dev/null 2>&1; \
               then echo "$(2)"; else echo "$(3)"; fi ;)
 
 # cc-option-add: Add an option to compilation flags, but only if supported.



