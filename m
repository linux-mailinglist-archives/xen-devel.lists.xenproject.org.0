Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308850F9CE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313658.531317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIAh-0003AT-80; Tue, 26 Apr 2022 10:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313658.531317; Tue, 26 Apr 2022 10:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIAh-000389-4z; Tue, 26 Apr 2022 10:11:51 +0000
Received: by outflank-mailman (input) for mailman id 313658;
 Tue, 26 Apr 2022 10:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njI5N-0000hM-4g
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:06:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84e6b137-c548-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:06:20 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16--YC4MvI1N-uzH8laZoD-Hg-1; Tue, 26 Apr 2022 12:06:18 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2666.eurprd04.prod.outlook.com (2603:10a6:3:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:06:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:06:15 +0000
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
X-Inumbo-ID: 84e6b137-c548-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650967579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpUvuCK3/tdepTPtfGMVhvunTplLc3OBdRwg9JqsTOQ=;
	b=TWrUM/0ZhosWgdYBQiQ50NkCsxjAa2qd+5dUhIkRiXhHYiIVwdhB+UWiZAOjPlYliwLmZv
	pxxFIqEsbiJXz9xhnzkC+nvKVN4SDNwPZFr3neRZwwFKvft7wznT2YknSl2LattBYB26+a
	gXrLRnRheMFlHcvG0f5zdhvCWOCwH3s=
X-MC-Unique: -YC4MvI1N-uzH8laZoD-Hg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+lypYBWvaPmIT/v3xxOzx74rBP464cpHoyt5WPJ77xg9RxhpPu3f3+gldUrzR+cZVo5rJ/0kJ0urDShMKEM32uSxUuuWi+pbAaEXNN9jvxn/FLc5nbOAVtX78+5igofmbjeoZUN9ghE0h5vrG2XFJmLnGy5zma7xlSuWtfI2Hmf2KV24GIBgBW3Wl3xTLyS3LfBt7XBySRCWY507lRqf/CTYfXVKm0ncnVBoIz99LNf7I/rbvZsPvPzBXd+1VB/VKkihbknLxNucnutqA7/GeuKD0o3wB3mxZalj2d5S8ChxkvU6TcIvlak+iQf4ZFpEMEFzq+xCaHNmkMENEocaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpUvuCK3/tdepTPtfGMVhvunTplLc3OBdRwg9JqsTOQ=;
 b=X1SmGk4UwPq8ENE09fFWvm3alOr+1dAGDZWi9bWQISGwE76O+3NJcWRDzUP8ofSnaLpeA2V1rBtmvxSJFhP8Y+V1JFu13gsxBofID7nERiMdQNnO8vYQwW6z5LtNdtriFvHNBvK8+9e69ueyt/a1o5P30aS/OhUYtgxAkmi0EEyvdCDsnlbsEWE7NTtAkC81x0g51ViFkGLgn7+pK9PnhguGvYE1wpcDqCmEARq/WOgB1ANmGw/K5Oyv1lQzI6hm7dzIftI/olveZNaerZnBZE9OdRAgu3xWqlSSfXolpZD/I+zZzl8he3zVTYujnNNkxPbhiMyELNQYhJ3tcEWQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <002d7dbc-8290-10d3-6e6e-c5947c1ace82@suse.com>
Date: Tue, 26 Apr 2022 12:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH 4/4] mwait-idle: add core C6 optimization for SPR
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
In-Reply-To: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0018.eurprd03.prod.outlook.com
 (2603:10a6:206:14::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e5daaec-e975-48a5-2c86-08da276c6693
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2666:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB26668F3EA74E691824624814B3FB9@HE1PR0401MB2666.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e1G2+/1a/erlHpnJfSytMeVX/EBOrw+rwbaBE6np7t8+M8YrQeJS9KJLRiO37V9moIfkCGVo3k94zbqUI7KwlzGPoukkXLc6kUJr/fTj+p08TRS1sRO1eC4GcKGJm5Hc8CiAWlGw/0U9J3CetsnEcvhJWB349w5K6V0TOQCr0p+qlYYzJMEAxU4CSAW/Fi6A6lnb6aAkaSZrscYX8LJEHTr21ZDa+UZQ4vaP8LUKfso638P16IxOvQAOcjyhyMdUW4nZoL6tDU4hy8IjNqPiuoeSqO3/HP0dmGeNr0AlaDcxAscyHfbqG/H/qNLOf59BTDCVpkhtrQ4lx0vPd8JsA7lEsdhKHraep794GME0f3ZepvG1snltzw0Wwc+7djvmhAV/KYKwhHu6d2l64ngHzEhPaCO0FZSfeUZ/Hn185tx1u29TTsQutipJxYDQW4vUK6y7UWX/FZXLTo5XbKeyDgg9m6bH0IeqxxU7wtuy3MUw3T6DwLbq63pLWtHeGAZJqTnK0DvaIZQv6YpD/bu5B5XaQ8VZAMMSnWHvTzWETCVQ5theVT6XgxRHdnGIzk5EpUqdscaSsjjdtobT5PkP9LKligG9q1tdEgZZp9FKHITJ3cco/XW7C9TW2EeXgvb9ttUYvad3wZ4XnV7Dka3xkw8rQ/OsuXT7dK3ozedwz3BIHYu3PjmW5PNwi+L69Ttpj+0kL9jt5nOgYtx/iroW5pw1+dUrZQAPn1T3HUFfwbtqeYeDxEnXPoTdU4hMux/9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(38100700002)(83380400001)(6506007)(508600001)(86362001)(8936002)(36756003)(5660300002)(31686004)(2906002)(4326008)(2616005)(6916009)(26005)(66476007)(54906003)(31696002)(8676002)(66556008)(6512007)(66946007)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUFnemlONGFwUk42TFB5NVc0NkFFNHBrT0VVcmdqdURYSE15VXY5Q3RCTzNW?=
 =?utf-8?B?L0VQRGJ2aFJaN0hDL1F6Qmt2bDRyWnpzRUw1OVkvYmxtajhEVW1yMFFnenJy?=
 =?utf-8?B?S1Z0QWk5TTl2ZSszQXN5QkUvRUhkWFh4aTRqekgwWVdXbkltRUFkY3l5Z1RC?=
 =?utf-8?B?RHl4ZXNLbmlxRzhER3JTb01ENk8wU0lKUTNiYlIvZys0OE1SZU80Ky9tZnda?=
 =?utf-8?B?Q0s0ZDVYdld4VVRwZHpHL2JSdzYrLzZRdkhiUjNxT2hNOFc5UEl5eEoyUG9R?=
 =?utf-8?B?YzBHaktJUUNUM2lMKzN4R1pwUXRjUEVueGh4Yi80M1FQVm1uQmIzWVZrWldS?=
 =?utf-8?B?eTl6YnpMT1NlYkdxcGlLTUE3ZVF5eVozdEkzdmtVVTNNM0c2YkExMmpJTkgv?=
 =?utf-8?B?cUlLY0hyVnpNT3Awb3ZpVVdYTkJRalNYOXpsYlVKSVgzZkZqNEdoOUZ5QTdH?=
 =?utf-8?B?QUI2UDRwM1JDeENtZERva3RJY0lscGZ5ZDZLeGxjZzA4ak42YW1FeTJrSmpG?=
 =?utf-8?B?VFFZb3kwODhWTDFkRmxvWUh4UDhFRDExQkpNV3dhaFhOL29VbWRaby9vbEpo?=
 =?utf-8?B?UVlqRDNqdVE5SjFQN1ArdHN4MkRUdkdjR3VrYXZTT1VDbXhPZWhEeStxdWg5?=
 =?utf-8?B?R1hsQmZHVVY4QTJaai9sRTNpYTFOVG4yOURVN0VFTEJwTFJuRWp0UkI2VjRw?=
 =?utf-8?B?UnF1aGpGYWRVdjhlRDNtYzJHQlRPRTg1cm5KY2lKdkVWM1VOQXhlM3RnSDFi?=
 =?utf-8?B?ZGlHaFJhUk1ESVpTM3VjWUIwczExTlM5R0tyK05ZaVR4Y3RSMzBCdTdsa2RS?=
 =?utf-8?B?WXZ0NVZVbEg5WkpEc0Vjanl5MmdPTFdCZnl4WEF2OE1NRVh6d29QUG5vZjVH?=
 =?utf-8?B?Z0ljTDJ6dzU2RTZCOHJJMHJIZHpCeUs1ZXFBZHZjTGpqdXN4SlhoMWhUOHBZ?=
 =?utf-8?B?YStreWEvU01aMUVqSmFGVkdEVnFpZDZYTFFMamdDNlBNUHIwYUQ4UGwzc1NK?=
 =?utf-8?B?SENvMkJkMmZJL0Z6QWRvbkw1QXdaNytZU0J6d0RDQjV5dmswVU4xdGlyK2ww?=
 =?utf-8?B?N0dubEZYUzczZWRqN2RHOXV1dEdnaWZkT2JLRlFnQlBHd1NmbUFYNTZ0cnlS?=
 =?utf-8?B?M3pxTjV5UkxXK0xTSytMQzh1ZzlXSXBERVNRcmZ1THBMdUdDeDFxZlJlRkRx?=
 =?utf-8?B?TDdzRHVyaUVqSFNnamNEUnZkSktyTEZHNU1rVVFrVDkzeThjR3FPeHhuR0lN?=
 =?utf-8?B?TzBhcC9YbElHQjRKS3VJN3RQRlhUTm1wMGdFTnlUZmNocTBldGoxUVJEaUtO?=
 =?utf-8?B?cnZ0Q25BWDkxUnVmWUwzKzM5TW51Ykp1RGVKbktvM1lBVEJXSHVMSmV0TmVM?=
 =?utf-8?B?SC94L1c5SW92S1FxdzF5djlwQjM4QlhLQnpST295dWZmRm9ySjBJZXRkN2Jp?=
 =?utf-8?B?V0J6d09aZ0IzM0pVRUtGYmV6N0NaWXJFenUxd2tzVGR0ZW9Pd21rcWdzUDhB?=
 =?utf-8?B?aWxnRWc4M1d1N0NZS0cyVnBITGpnUTg3OVp0OTE1YWg2VTArVDBKNnV1U1Qw?=
 =?utf-8?B?SVM2NkY0NG5wLzFjQTdPdzQwSDQ2RWhTd3FSMEt2ZlFwNGtZRjdxdUJnamEv?=
 =?utf-8?B?cjB2NjhremVLV2dpeWhBaEVibU54NDJIaGpkRjFFRHovRUk4Y1VJcVkycUV0?=
 =?utf-8?B?bDI5eVYxdGtIYWRXYXpmR0xmc2RKcGg0R2V3VWk4Y3hDWEhJem44Q0RvZXZT?=
 =?utf-8?B?K2lYdXdoT1ExcHFCcGZ2VDNna0puQzEwSWtVdDBoNXo5cnJLRkRqSDdLTTV6?=
 =?utf-8?B?K0tsOFVBRDA4NVg1Qmc4WVRxQndxT2w2VC9Wb0plSFd4TW9ua3FaYWtKcm5O?=
 =?utf-8?B?S1EzekNXTUNKRzVnMTdoVFYvL3JLcFRoWnBCUTBwZ0VqRExUc3F1aHRnMm0r?=
 =?utf-8?B?ZWF0TW1kSkp5Nm9IMjQ5NURzckZZa0RuOVR4Z2k4bi8yWGtaTGx4M1h0alRt?=
 =?utf-8?B?YTdMSFVHOTM1Y3BBMUtGcFJJSnlCYW5rRWpwY0FnYzdVaThEMVkwQnorOGdR?=
 =?utf-8?B?R3BkQklwamZGb2tpWUVBS1ZhT2NQZG5xcjFBZVNWbGROc2ZJbEY5VkRXN3R6?=
 =?utf-8?B?enNFYU5DeGdGOUt5NU5vaU4rc2poYk9JK3o1eWxxQStmamlLaHZVSDZjUXVl?=
 =?utf-8?B?NmwzVWhGYVhRZThrRVZEYm5SZ2RGbmdCcUtMOEorZ2VVS1VTNGduSFVJZ2RH?=
 =?utf-8?B?RWw0b2dZRkZuUkx3RWl2VSs5WkppVDFNYnlmL25sVFdKZFpuSVFsQithdXRB?=
 =?utf-8?B?UkR1YzU0bHdPTjg3MFZBVjcrL3J6MmQzKzM1dko5U2tuRllVcHVRQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5daaec-e975-48a5-2c86-08da276c6693
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:06:15.8468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ0U6WSTdIWfPCzWEDzyCQTco/ctFyL3rfPv1pdHoW2mSQ5GudMwIMT1NQhgscUDA77cwyEdfr5jTLvuMfLeZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2666

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add a Sapphire Rapids Xeon C6 optimization, similar to what we have for Sky Lake
Xeon: if package C6 is disabled, adjust C6 exit latency and target residency to
match core C6 values, instead of using the default package C6 values.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 3a9cf77b60dc

Make sure a contradictory "preferred-cstates" wouldn't cause bypassing
of the added logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1267,12 +1267,12 @@ static void __init skx_idle_state_table_
  */
 static void __init spr_idle_state_table_update(void)
 {
-	/* Check if user prefers C1E over C1. */
-	if (preferred_states_mask & BIT(2, U)) {
-		if (preferred_states_mask & BIT(1, U))
-			/* Both can't be enabled, stick to the defaults. */
-			return;
+	uint64_t msr;
 
+	/* Check if user prefers C1E over C1. */
+	if (preferred_states_mask & BIT(2, U) &&
+	    /* Both can't be enabled, stick to the defaults. */
+	    !(preferred_states_mask & BIT(1, U))) {
 		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
 		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
 
@@ -1280,6 +1280,19 @@ static void __init spr_idle_state_table_
 		idle_cpu_spr.disable_promotion_to_c1e = false;
 		idle_cpu_spr.enable_promotion_to_c1e = true;
 	}
+
+	/*
+	 * By default, the C6 state assumes the worst-case scenario of package
+	 * C6. However, if PC6 is disabled, we update the numbers to match
+	 * core C6.
+	 */
+	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
+
+	/* Limit value 2 and above allow for PC6. */
+	if ((msr & 0x7) < 2) {
+		spr_cstates[2].exit_latency = 190;
+		spr_cstates[2].target_residency = 600;
+	}
 }
 
 /*


