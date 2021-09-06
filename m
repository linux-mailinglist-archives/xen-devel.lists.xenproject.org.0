Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811E401C00
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179816.326220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEE6-0004tH-4y; Mon, 06 Sep 2021 12:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179816.326220; Mon, 06 Sep 2021 12:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEE6-0004r3-0i; Mon, 06 Sep 2021 12:59:54 +0000
Received: by outflank-mailman (input) for mailman id 179816;
 Mon, 06 Sep 2021 12:59:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNEE4-0004qY-Gq
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 12:59:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52036839-0f12-11ec-b0a4-12813bfff9fa;
 Mon, 06 Sep 2021 12:59:51 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-xAUjZGraMhuknGFuXbTleA-1;
 Mon, 06 Sep 2021 14:59:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Mon, 6 Sep
 2021 12:59:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 12:59:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0288.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 12:59:47 +0000
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
X-Inumbo-ID: 52036839-0f12-11ec-b0a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630933190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYxRIiU55Up939f84d4QmJrnjJ7T0dm9h+/746Rq8MI=;
	b=TAsfWiHE7FZWYTewzBgpb+QG9gVW3kWFnzbDI6TYQZ4q61WIEVh0JLmWYfqCz7kJjy6nvA
	1qLtePpTs+Wnj9fILoNt7kw9GlELIxxNVHIGvBKGLTJsNhYP47HtI9sp3/JMwOheLQWum8
	/uC25cCoklG6xZH6UXkaBi6w6stIP9I=
X-MC-Unique: xAUjZGraMhuknGFuXbTleA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLjHtcBlvctdvTt75iYoXLbCptmC1uoUlrqNiQmQOWmN5NMRBe+ubNquiHZn7Wq5b/C/z67M+RdwyNcjKJKh02ATQmXYOrLkVubin4yYYHIRfRSzSvkoVYatGqs0as1BQP0L+Y97lHeLfoZHK94JsMRT8IrlWfP3wQ2jgihURSI0tk14jvyx/GZ9p78FXtC4g63uV4MhEyoDHahdiEqGvXATD+T+FhreW3qXYUw3+ZaajRM/IfMyzUTDycSGZXgW88Gb2CFkJbNWnzUs08XmUmhZVZitKoQ55psDDzosUvTaLRNcIc80BeFRWQroEalriCgOHyeLqx2fVWiCJZc//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lYxRIiU55Up939f84d4QmJrnjJ7T0dm9h+/746Rq8MI=;
 b=PF+1ThupuWkV23rBEb/AVG9YKXiiGvWzWk8N0RVdNnbRiY8A9Y1xfd0Ys2B6n9B8bIi5+yrhKDP5LlyHid8BZcSECQY5ToTb05h/ieblw7n0uV7xrluquc6TLnGeefGIMyWcvJLD4YPtwWKMfERKsEhykRZ0NCb1HRs3UY+d0sH4dsrTgiBMt7bSutsb4uqPk4cbmG9rhfWQ7CvulLnIJqeo1EOA1JeVxKl+J+t8wUXxcf0yL4fJPYZV6zu2vnAfKaEYcXMbeglndhz4/v5FSKxibFcor1TaHlfRrY1cAtnjJQHwHkvQUhi+InvBm1GMzwe/wH+JNRYImUUulv2h9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/5] x86/mwait-idle: mention assumption that WBINVD is not
 needed
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Message-ID: <0ebb0de3-2500-a9a2-8128-64b9d4a27cb7@suse.com>
Date: Mon, 6 Sep 2021 14:59:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0288.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7171f000-7582-4922-d127-08d97136349e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35336395B11F7488EE05CD03B3D29@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wklRinhSRVpDYvJdmegP10VvhuZJ/azd6SK3EM0JRoO+jeONCwEo0dDrPHZIuQDrxm31/i3doby2IO5X3Wz68ierdfXcSEQM2b1PfiWoOmdmpUqO+6Oi03hx01V0Eo6076ekcEruFFs4nxaAbfG5zttp/Y/N4OJSmiY7ON7Z8UlRomzcDiWYsd4cO02iRWeIb0oJEQiAKz3YSsgpkDBoABzVH2N6/OzjzKNjFLnhVPvddGwkOn/Dd8tij4ivx3BaLAmWM+UVlCVgSONrteD0Xertv70pBHzmFKTjmKlyilsJvsnbL1hswMy4m/7yzCahsRflgR0HKzcUii8TplJ501Nwe4EIDsQfYy2tsPWfJZDjEYQKQvvEZBstvNfexOmA1z6O8oqTOPZegnxl2mIkOQNz4B/LU6Q5CvnMfanNE8MmrDOmbejoWYX/dA9YCrjxaKZKjeuUDhkZPS+PTlOs6jRKke0xOy4FkA+c74HRnfIOVYl9RZkoe9SeMhT8ftCWHnYgMcTBbhV8pMtYhtXg8GMdw/5oNRmk1yUFURpWsPN6wL6YyPf9JQ6lqjaS45Skf4pCWP6emhg5ORp4CcytYlwwIF0wfU3w4cmADcR5BKnI8oLy4p0uuLLtKAtK4YIIAzzRzFjdHiGwTYy2ukJpPTBFn9qjiBMS1lyB4S4YK9JRh8pSndGvuwK6PL+fHSpVLmUh/g4RWA5QTvEAJqlS6Bt8ORLpgHHUMVQDcWzSPwc/sudAHLc8DanABn8qZWic
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(39860400002)(376002)(16576012)(54906003)(478600001)(316002)(6916009)(2906002)(31696002)(66476007)(8676002)(186003)(8936002)(26005)(5660300002)(4326008)(6486002)(956004)(31686004)(66946007)(38100700002)(36756003)(86362001)(2616005)(83380400001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjdKRVdDUHVmT1dlNmlJcW9TekoyUk14eXJOeU1iY1YrK3ZPd3FRUU5KeFRF?=
 =?utf-8?B?YlpubWpLMWtuaDM3dm1ndVJpVXFQSnRUUzArYUJKVHpiaGRrZkJuM2FyRWhB?=
 =?utf-8?B?amI3bm16QkYxRmRIY2liVkJHRE5hRkVGNWpuQ3U2SWpLajBQWEJaTG5QRW5M?=
 =?utf-8?B?TVZZSUxFSU8zcXgzZmJnZU56SWtWaWhiU0hQd0wxZjIycGYvZUZ4ei9zK0FE?=
 =?utf-8?B?aGRmVVdjSjZQMzY3VGIydFhqTFJmUzc4UDFMVDlIQXN1aEhpRTkrVU00MTUx?=
 =?utf-8?B?SkxvZ3RtR2Y3Y2FtTTNYYm1FbjFmTklhQnhETC9TdkxIV2xBMSsxenRkWUtz?=
 =?utf-8?B?ZVlzdVdEQlE4Q2t4clhDYmVsemRLYzZjSFhhYm1VeWx2S0x6TnB0RGg2eUtH?=
 =?utf-8?B?S1RVRVVPSVA0bVE5NTExTzJ5bWpYUVpzNHhIMHZNVnBCU0ZNS2ppUDZySnkx?=
 =?utf-8?B?N0dZUFVpSGlNYlMwSEI4QWVzek9lU3Z4OUl1UTd1ckJvRTJNR09PUmtheVdW?=
 =?utf-8?B?OExReC9nVHliVVArNVNQUVI5dDVRamYzbGd3NXhTRFBNZU1qdy9rZzVTUlFq?=
 =?utf-8?B?VG9BUGFPeG9BQitHWUtMV3ZjbkF6NHF3K3MydnVOVngzTkZNVVZoNG1jQkxC?=
 =?utf-8?B?aEFyUUJuY3lEV2oyb1hxTWNxUU95V0YyN2dVRHRTZWh3WE1OOHl0R1dNbkxX?=
 =?utf-8?B?R29qNWhSTjBBZDQxQWhjSW5kYkhpZXlPY1kyM1FmR2NEeW9SMHpQMi9VSllx?=
 =?utf-8?B?QXRSWUlBTk52c0JKVDB2S3YxT0VwMkNYOVIzTllZWGtPZmI3VThpMEtabkcr?=
 =?utf-8?B?ekhjMUJhT1N3OENRRmttcDJFRlZYL0o4bVA1ZVlQVUtyZFhPdGNBcTZZNjFK?=
 =?utf-8?B?RTN4d29NbDNob1ZqZXBoaE1HR1ZyOUhrMHM0QUNERHhTZ2VidmVqVkt0RUY5?=
 =?utf-8?B?Y1pCNEsvUUR1RW1mVGFscm5ockNYZVZFQU5QNzB1dCtFWnlXeWR3VDVUWTBB?=
 =?utf-8?B?SlZjVjRlUEU3bDNnRllnOFRCL0VUUEFnV3N6M1pVNGREa2IyYmF6UzdBeGRv?=
 =?utf-8?B?Wk5OWGh3QXUyV3Jzb0pIdDhlUDdQaXVSb2Zra1NMbVh1LzNheVZrNnIvaitm?=
 =?utf-8?B?ajZqcmZOYmNLVzhPb3h0d2M4UkpiOEpxL1VzTTMzRVMzNGVydFBwUEJmam5V?=
 =?utf-8?B?bGQyWlpGb0VVVTJPd2xLUENPVFcrYStIbUQyN2V0bnVxbXZUbXk5Yko5SXNP?=
 =?utf-8?B?NXhFejNackpNRUtYQW5HSzNjS2NNRUN0WlRpRERwVXlUUTU5VDdGQ1plYXB0?=
 =?utf-8?B?U3NVTW9CWGp2b2s0ajdMeTJmRjQ0b3lBZDhzc0Jxc0dzYU12VGhNbCtoOXBT?=
 =?utf-8?B?dE1GK2Rhb0FiQUJEVHh5TEM1NzJCMUxZWjJSTDl2MDgxdW5ZaU5mMTJiYSty?=
 =?utf-8?B?ak1Wc2lSU21qSEdDYjZ1bkkxUlM1eHphVHRtbU92RkFtSHFlcHp6ZnV0SVJB?=
 =?utf-8?B?c2xBQlNQM042aDkrNHU5UzBIdEdtZzljcWFUeDFNVnZaSWFCbG9MeTdhOTU3?=
 =?utf-8?B?TUszZkFWdmZVQ1RBMmhDcDFETVhvV3RYWUZUT3pHZWtWVTJ3U1dmNHE0dVl4?=
 =?utf-8?B?Y1hkaTRmNFVNNDhyMm9VSHpUNUJqRWxPTFZYczR2WHpkenRXdk5XRjhmOUtM?=
 =?utf-8?B?U1p6QWkxL0ErSXZyNkUraFlJUmFQTnY4anczMkVjVUxkUU9MZVQ5TUU1Kzkv?=
 =?utf-8?Q?PI9XIL1uEwWqncUrWy/aSwU36jrDd1X1UsZNY4Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7171f000-7582-4922-d127-08d97136349e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 12:59:47.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqSobVfJ3c2p3fXDjWInCq+5ruoGY8x9/vU4bs9CSCmzW2E0UsiD53GkKIhd4o6HQl1fd2aqdwkm16KZmow+PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

From: Alexander Monakov <amonakov@ispras.ru>

Intel SDM does not explicitly say that entering a C-state via MWAIT will
implicitly flush CPU caches as appropriate for that C-state. However,
documentation for individual Intel CPU generations does mention this
behavior.

Since intel_idle binds to any Intel CPU with MWAIT, list this assumption
of MWAIT behavior.

In passing, reword opening comment to make it clear that the driver can
load on any old and future Intel CPU with MWAIT.

Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[Linux commit: 8bb2e2a887afdf8a39e68fa0dccf82a168aae655]

Dropped "reword opending comment" part - this doesn't apply to our code:
First thing mwait_idle_probe() does is call x86_match_cpu(); we do not
have a 2nd such call looking for just MWAIT (in order to the use _CST
data directly, which we can't get our hands at _CST at this point yet).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -31,6 +31,10 @@
  *
  * Chipset BM_STS (bus master status) bit is a NOP
  *	for preventing entry into deep C-states
+ *
+ * CPU will flush caches as needed when entering a C-state via MWAIT
+ *	(in contrast to entering ACPI C3, in which case the WBINVD
+ *	instruction needs to be executed to flush the caches)
  */
 
 /*


