Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1983A92FB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 08:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142705.263241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPI2-0008C1-Vf; Wed, 16 Jun 2021 06:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142705.263241; Wed, 16 Jun 2021 06:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPI2-000892-Rp; Wed, 16 Jun 2021 06:44:42 +0000
Received: by outflank-mailman (input) for mailman id 142705;
 Wed, 16 Jun 2021 06:44:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltPI1-00088w-Lm
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 06:44:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5753d0f7-a4b1-4c19-afdb-251b160b9c34;
 Wed, 16 Jun 2021 06:44:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-NGgyfhXWO5KTRI1Dql3Heg-1; Wed, 16 Jun 2021 08:44:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 06:44:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 06:44:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Wed, 16 Jun 2021 06:44:35 +0000
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
X-Inumbo-ID: 5753d0f7-a4b1-4c19-afdb-251b160b9c34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623825879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6no39c4ymfMgk1XxNnp9RMGfuzkFM/lh1ZHatcdZTZ4=;
	b=SdLST7/zj8B10JD+V6kCdtIgsFBXchMg0e7S4gGxxfEBjPt5q0pZm0wvmJenJUNTpkYhiV
	aXkGLAYFuTk9yKA63dPylR3t/KzpvYJvQ3jcrd7Fl2lDn0w5O/Pp5SP5311NnqsmpuqWNG
	I8Q8ft8TO9OGy1tnUsbyFOIRST17yNQ=
X-MC-Unique: NGgyfhXWO5KTRI1Dql3Heg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jt1wTM0y9cQzpBi2fBMoBVJEvVKZHKVJfM6MXUAgNZwx2tSgdviAogAeDuy/xFwKLvN/IckGJ5jWiCBuZGoHZLT+eOxk6zDEPCH1mkffU5Les8lniwiMVEUjA/IZQOaV4jUkK/GDzU8kyOeGXiXMT6GIJUr5Cgdd2A1mfuH/z6SR4fLRWvqRY6iC1ouhyJ70kYFRoa+cFmtqfaQBBWbdk1lvuao6IYGpELWmz/x1Vr2t8M6wrDZfFnhXz8ugZGb44X6NP0OBdNu1tiVaBrr8rHHTplthpmliBQzyGctudwN5bnK04/Oja53TWj98HZZ96/hwXa1m69vYe2Bo+lDQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6no39c4ymfMgk1XxNnp9RMGfuzkFM/lh1ZHatcdZTZ4=;
 b=KWIIloMhhyCuo245oqCOZ/Emu3P8tFv3+eKdz+7GYjscC1a32xQxWh8p8mG5h+kpjDEh9zhzwTHTqqSJt2777G6cO0uOyHHmO6y9q17YcT+mtRzvH/JP211yDTVfY0UrvIAUgsJFX3zrBYtqo9MAxsXXjZGdpvADFSI82Gp9jPx9EUyCVtVoGOlPjCjbqCbk4Z2LCVLXsVr7NFZvR1bUS0/ebgnn/2rIgIlQqUypmYyiH7q55HI72nWHSpSIjExMHoYteAZYCP4OhFqptwVvyIAXvjzGlASxFh4aYA/ZHeadcHxkoZwYIX3q+fxB/25ZhdueVG/DfCWaSbc7lro3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/5] tools/tests: Drop run runes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <20210615161905.9831-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c59dae19-2a88-9449-468a-ab22d38fd0e7@suse.com>
Date: Wed, 16 Jun 2021 08:44:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210615161905.9831-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fdcd30f-6eab-4b6e-00ff-08d9309234a4
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB666914552742F862F80D1D2EB30F9@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yEWFnkFyfRI0RhWz0FBF1Bo4GAt6IedNF5ypY1NqQnd3YNR115tvU3VP4jh6wITpDCOO3GmmQDsGiRs6RU1J1KiYXuX1rz4JbAajCcXb9hSU4MHBh2Gz0yMyTBbF6p0u0yvscz7DOPUf5qakTd12sq3R/la71sOuxJTtaPqZ041GPY/OJ100NIrF2rgEjJPNWsLnKPpBoh+YZS8Zqfs3F38o25Gp0QALwUbKEeYvHyGuc10CtTvItw+YaW2R46FvH35HKrlma2GO+3euLGDYMZ3/pAdp73Dln9BUdi8c/KhXB+WJqtsSlAU1UmslIM74ExXvldkTTqp4XNYeysIZFRK9LWN5D4SVhau4YRi4389JCGp3vgl9yEeKptzYyrz/4qTrc9xSV8Oxqmk6r29G21zhaW+qzLXwmeqpnMTR6hsgIPVu+pOHh70vLwzBcLT7Hj+mbAZcqz0NFfpTnpAdn32d+ou6QiitPxa0wP/OfGx4dhSoWNsF8q6mA2RIw8NlqC/P8fthuFcCQjOfFzJdYPP7THRRynkI3hCWFrZJv9BVi0ETYnlWZk82OokZLcslcgEDm5uWm+B5xCvReBfG2ET168lYHelgBTQrLHCPs3rM94P3lBR7KWDuhK3aIH09l5dLXXDX7dlyl218aXLMLzulhuduGf9OVP6aHsOE7AUdN0BaQ+xNOu2RV9BbMPMM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(366004)(136003)(376002)(26005)(5660300002)(478600001)(31686004)(186003)(8676002)(53546011)(6916009)(54906003)(316002)(2906002)(4744005)(8936002)(16526019)(66556008)(86362001)(16576012)(6486002)(2616005)(956004)(38100700002)(36756003)(66476007)(66946007)(4326008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3psY2xDL3c2WDhUOVhya3ErYUo5RXNDQXRKeUlsRlQ2VGNCSHVWMmhPRUkz?=
 =?utf-8?B?dHMxS0NOeG9ld2tPTkVGL1BFZ0l6VkJRMXBwUG1RZjMvSHc3ZGRuNUNkUU5B?=
 =?utf-8?B?bVBhcWRXaFVPSUhBTjdkMExRbTBuakdhSEFwcVdHU1ZaNk80R3l5cFA5NUhv?=
 =?utf-8?B?YkVseWtwNlBKMHpCdzZGV2NmYW9ZN2hLU3lTUWRyS05ybUFpTkpUV3hBcnp4?=
 =?utf-8?B?MVVYNE5XZ0gwL3Jjc3ViYTM5enErU0FncFRiaFhRcnZrVjB1MTFtcHBITGRG?=
 =?utf-8?B?eGl4MEFYNk9CVkM2TFduMk9yNWZNR1JwSzVFZ1Z0M3B6WGlJSmRHTUg5STNh?=
 =?utf-8?B?N08wdmFGYW5tRzM0bm92SERyZWszYVFUdFNmdVc3eHowMUFOTHJMVnJWYkx1?=
 =?utf-8?B?bnBybzN2QXo4QkRpZS91YTNPck9VSTE5L0VpUkJQeVQvQTFzZWlsMjV6SFgw?=
 =?utf-8?B?di95d3AzcG9GSmE5SmhQNTVpTTBRVzBXdFlCYVFSN1I3NTdiU3c2dHk4UVJu?=
 =?utf-8?B?eXNhUlcxZVdaVU85R28ybnpvSW1XSFpYS2pySWxRZjFMbUN6UElEaUR5OCtL?=
 =?utf-8?B?WCtiaFAzT0Z2aU83dVVvbExabE9IdVc1SGVyM29qOC9helN2KzdQZ0plWC9Q?=
 =?utf-8?B?Yk1LSUlkb2dvS1hCR3B0dm5JMWdRbldkT0w3VXpVTUpqNUhPNXozL3B0c2xo?=
 =?utf-8?B?VjA0Y3FJNXlCeDlOUmVFVlpyaWNxYlBZbjlZRDEydndScWR0S1BPcmg3ajBH?=
 =?utf-8?B?cGVGTW9ON2NuV3Jzb2RmbTZuWmIwanBoUWRGdlpsWldhbWhuYmtEaHcrVVBY?=
 =?utf-8?B?WFBqdytFY3kyUE53NWZQMU1VUUhQU0JGTGxVQ3AzV3Z3bTBZYWRrN3JvRnNp?=
 =?utf-8?B?bDdjVXBPT0pBcVJ0TjlJTnNPNzhGb05DY0YvYVdLekl0SFByMndUVWp5ZXJ2?=
 =?utf-8?B?bGtSUXp0VW5VVFRna1VNRTY2TjBkRHF3ek1MYU04c3dMVjFyOWZrTGtoMmtV?=
 =?utf-8?B?MVhDM1ArU0NDdXZjL3V4V3Y4b2QxRnpMNlhJN0VpalNDOThvRDVPTC81Y3c3?=
 =?utf-8?B?aTRNYWJrWFVXa0tQb0htV0FWelRTbFRqVXgrdk1Fcm96RnVVRlVjbzBzUUtI?=
 =?utf-8?B?Q05WaWdvUGRPQkpPWnVmQzhmSEJQYkozLzY3alhBaEFPbjZqNm9TdmNCMFR3?=
 =?utf-8?B?WlpYVG9ZcFVDUzhlVTZjRDBCQzZIZkxBZUdpMHBQN1UxZVEySzl2MWZTSjV3?=
 =?utf-8?B?aVRpUXorMTdmQ09QMXpJY2UyQ1Z3enlqK09uY05VV1Q3RTgxQU05NXo0VlRo?=
 =?utf-8?B?SmJ4ZnNma0c4QnZIQ3h2ZGQwM08vM29zbWFZdEFzK1RPbk5ueGtWMTU5TG5O?=
 =?utf-8?B?ZExla1FQMERiNUlvRGFDYm80SW4xYU8yWWZ4cEJKeUZBbTJIZGo4dzlDblFs?=
 =?utf-8?B?WnFpVTh4TmNaK3Zla3gvN3puTy9BUzZSSUx0SkpNL1ltTU11NzdiSU1jMXBs?=
 =?utf-8?B?NUM2aGJFNjEvQU9CTnJQZFByemxQU3ZybG5lL3NNTUJmVzlmaXpIdVZZc20w?=
 =?utf-8?B?UlVqMVFGSVQ1ZWk1ZWpOY3RzUE1ZZFVHQ25SUnlyQWdBbGdCTkNFYURyZDRx?=
 =?utf-8?B?L0ZkbmhsQ0FWYVNsOTdFa2JzMDltbGppNEJ0bUlKOUZCakJuUm5YazFMcHEr?=
 =?utf-8?B?UTJ6bEZaOWh3a0QrVUFMZXEvZFdXVmVIY2Y1N0RLL3VwYWg4ZXE4WUJuNE1V?=
 =?utf-8?Q?0jMF5F56l6G/dxaW2ARy6FVtn1N0X0ytAFGC/Ou?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdcd30f-6eab-4b6e-00ff-08d9309234a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 06:44:35.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhTZELM2Le8V4GYSgTDdSKv4kR68A9xbA3xUNSTBFLCCT7Gg0IoXEEGRAK2fbvUc51q/vm+BoOxlpwoFrfX9PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 15.06.2021 18:19, Andrew Cooper wrote:
> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -7,10 +7,6 @@ TARGET := test_x86_emulator
>  .PHONY: all
>  all:
>  
> -.PHONY: run
> -run: $(TARGET)
> -	./$(TARGET)
> -
>  # Add libx86 to the build
>  vpath %.c $(XEN_ROOT)/xen/lib/x86
>  

This is not only incomplete, but actively (specifically here for my
own frequent using of it, but other tests I do run occasionally as
well, and then also that same way) harming things as long as you
don't introduce an alternative way. Note the top-level Makefile
making use of these rules, and note also the run32 companion here.

Jan


