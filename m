Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA33B443B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147178.271107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlgI-0006Lj-9e; Fri, 25 Jun 2021 13:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147178.271107; Fri, 25 Jun 2021 13:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlgI-0006Iy-5m; Fri, 25 Jun 2021 13:15:38 +0000
Received: by outflank-mailman (input) for mailman id 147178;
 Fri, 25 Jun 2021 13:15:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlgG-0006Is-FD
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:15:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fe5dcaf-eb59-4d95-91cb-e175b5e10978;
 Fri, 25 Jun 2021 13:15:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-Ob_EhFLzNOWqihqfGNk29Q-1; Fri, 25 Jun 2021 15:15:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:15:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:15:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:15:31 +0000
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
X-Inumbo-ID: 6fe5dcaf-eb59-4d95-91cb-e175b5e10978
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624626934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aKwyIGLXnRebabJB5E/m6YXe6q4iLMqI5AW5V8QxUJw=;
	b=JIOh7xGU5sOlh0zF8j3j8iIAjZgIiiNoQ+hX4qnEHpJ7lkNczi+eRGevQECAN0lzwU4hwJ
	LQbfOqm/NAYo07LY9l9y+4ANwMJ33oXPzEUWQ5bUiDU3UJYO+wxLX1L9guxKh3WWuc10qX
	ToVXBXrDkWcHvtiRclKjY/6ndU1BHZs=
X-MC-Unique: Ob_EhFLzNOWqihqfGNk29Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hABQ9sNBqgoQKpRkLLnziZpwwTUqKpQf+pi6F2Wq9bQAiJtNTU/UMNSLOBILcFjYt2TMGqXzk9nSZKyqWaJKU2+XBGFTaN7POndHMmc0JZq/omMzY6K1FtS7PDuycoFX+/3C0iSxJDIxrLbcC/3XQ5VH1jA4yT7XbYUrCWe7bZo0FyKBcGGrl99ESuYbE5AnoyMOWNsZi0lKQNQf10Q6J46BN9l4Am/Ti3Ju0dLwdt/yItq+urBtqF9dgmqQtENdbv65Wck1q7dBqZGR8Vu/TLVXGqWW8tPM28cBh9OY+JSpnOfjgdICG8gU6qyO9V/pjBcSa8ImYoKvK+vZaV1W7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKwyIGLXnRebabJB5E/m6YXe6q4iLMqI5AW5V8QxUJw=;
 b=LTmRSG5y9T/jlEokJZIkQeErZS0Z2N88bel4UlAUNVe160mY5nsMS1SauUQyBkZOxeEeU2CY4iEwQsDjDsS2zN1HrPcdOQ4w9hPIV0H+c2HzO8x/P39OWLOkr0655f5TKyLveRGu1ULhFKYTddpxaT/5g/AsUyYDp2VvEWLlgQryPkDILzFh4o+msA2Drgc9AnVq4ZnqLNSqxfkKWMjXIWWE3p45odmpsrxgYhbsMg3cVoS2Sl9s98fKowqHSbuUQ1GoXPK1yRwiLwHhrdbsMTaFXVJE9mGBYe0EVt8FKYEdTPHEAY4KHG9vSOeDYxourf27Dyee20Yp58HMzr/2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/12] x86: more or less log-dirty related improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Date: Fri, 25 Jun 2021 15:15:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::14)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0a908c7-de9d-41ea-4a97-08d937db4f5c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43842E0881A2DAEED5CB35ADB3069@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nnNGzGrbt79wIslBcsITUCxFhWVeLPT9AgBJc/6ja/1lJ3aHv8tlNQEd6VFsXQZTw9VZbEuydmCqgs3mDO9lJ+HBHZzH0ZRwVEym97ViWCdqwX61/7AK3jkU1bgP/ikdIsGY6Of8uVccZ3LrVGsl1oe/GumLNFH9NKMqAdw4ulu3BK6Y/W9qcMZuT4JPbe4dXIaPE0HoFdlxPoWiqYJHxNoBRb3XRnZepecKRaHw22eHsI5FH2XnKP0//ukI0k0BPU9BKp0EVMsKjZ9p4UY+fqVzvfwUfGf9ccvLgB3EZhwwGpO2XUAWs4Qjn74tgUdZOaLmHZoX5AdqMlpfFetsKHOmlw9q4U+wq23PBR772E/wwRUZaHHL+fHv3ITC+doG/D6dhSgbjrT2InnK5h+AYOMHLZb/0MSupCAPw4CIZfSDuQFuWDrKBp+9XbQIxepvYTYfFHfET9NELdzWffqR3YVx/RBPcb56palJRQGE7P4AiDIrav96603jKl1OhJrGKGUtiaXFWpiPtC8WpTwolL18urFtbyl5EissBwm+6nehmgYajNn1J05xI8yTXZv6QFFrERs7YRM9IU4V7kO/lu1GpIKPuQYeX1I51hsSk5oYKufHStS/iJVO7Ffio1tlaG2XQAJ7RFYksvXdsl4fOV1Q47ygGhWwxJMNOfVDXWxy7k7AVHvTl8Fqj2IVo2WzToRVctBP+KikMunbCEOU1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(54906003)(83380400001)(316002)(16576012)(2616005)(956004)(186003)(6916009)(26005)(8676002)(66556008)(66946007)(4326008)(16526019)(66476007)(8936002)(478600001)(5660300002)(6486002)(36756003)(38100700002)(2906002)(86362001)(31696002)(31686004)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckJvZ3VuTWFZa1B3Z1BTYjRTR1ZjeWx1UFJYOWNKc3Z3dXVRYmhlelI0dTQw?=
 =?utf-8?B?Y0lrVy9uenpJVTd2STlsVFdTQmJDUGhTMUxmSWJSdDNmT3N3V1I3SEVqbS9i?=
 =?utf-8?B?MlFUUDB2STc1NWl5bzcwaWZseUEzTU96Y0NNaUhsaU10cXU3NVk1YmpSdGtw?=
 =?utf-8?B?NGZGVjEwY2JudGJBY3hTYTR4MUZKZ2MrRkxlZ0VmQ1UxWTgzaklyS0piZjMr?=
 =?utf-8?B?cGZTNXE1TXl6UWd0WXYxKzV0Ti9rRm1KQVY1VlBkTWFTaWNobGNlWW5JZXJq?=
 =?utf-8?B?YklSMTlnbHJadmdvb0VwL2dvSHhFbDkrZ1djYzF3MUJWaDlTQ2JPUm1BMVJC?=
 =?utf-8?B?NmVJdXdhQjhxNit3TVlMZ1RJcmtCSzhpMGhLQ0pDS0J5UmdQUHJaN2xLcnZP?=
 =?utf-8?B?QkpLK0dENHJJMG0zcGNlK3d6VjUxOVJZSVFPeHB5djBURG45THF3aERLb3VU?=
 =?utf-8?B?blJhNVFjLy9xcXdJdEd5SEJEQVphRmg3T1V1OUwxNDB5cmpXZnVpbDBReitR?=
 =?utf-8?B?dEFDSDZRMDU3Uk1xYVQySkw1U0dnZVZvdXNjYm44c1B3SjQwZlh5cW9taWZI?=
 =?utf-8?B?R0ZxSEF5bVdWUEsraHBJRnQ2a2JFak4yU2pBQkU0NVlJRGNRRFZ1dngwdUtm?=
 =?utf-8?B?S2Y0aHJLTFhBUkloeTl1eXZORkJGWktvUWZhSlB4N2RnK3lzb3dCUFA5Y29R?=
 =?utf-8?B?WCtEUXZ4R3ZrY3dUOE9GT2gzQk93RDNwcEd1ZGlpUWttMnR5SDRxZnkyQ3Zt?=
 =?utf-8?B?ZkI0ZFJrVzNPZ2F5dU9paGhIQ2lJNERZTmJXc2kxaDlGc0RMVldyVFhFVk5Y?=
 =?utf-8?B?cmtwUkcvNlIxQWExbmc5cHBhNFBTcU5JMmFJY2prQkNGeTA3YXJHS1JYd214?=
 =?utf-8?B?YzMzZVFnRFRseDZIUEU2WkpIZXhlUngvNmNrM1dzdG9TNWM4L0g2ZThEZ1g3?=
 =?utf-8?B?K3d6bWxWbnB6NXJDZnBUNG83RHRkUXFjTjgxZGpXZWtJUDNpazIxR3BwOEx3?=
 =?utf-8?B?S3VnbCs3bllCK2YxWi9YNElSRExWTjJuTGh1OUdiTUlhY1daeFVpQ2FKMnQ1?=
 =?utf-8?B?VzlnNUxTSnEwazZmSHdCUXBUTHkrVUZ1bi9pZ21qOUwzTzF2SXlRaU5wdzc4?=
 =?utf-8?B?TW9kYmlRZmtOVkxPeFlCekFoSWFzazBEb3FJQWIrQjZYWU5kOWcvZzlLNlpT?=
 =?utf-8?B?YktDSlB5bzlrWjFidFZoOHV6TXc4aC94MXMzV0EyREU4eTZmMHhKQVRXQTZi?=
 =?utf-8?B?c28zTFcvS3Z3eHhqU0xBMEtEeVBBVXdyOEhZVmUxWTBJZUVQOHZPeEEzMXlw?=
 =?utf-8?B?N0FMRm5DOUpuaVUwKzNLU0t6Q3hUR1EzcGRnMGpMdEZSYTBKSHdvbTFYUmNQ?=
 =?utf-8?B?ZG40V2NTYTRTM1FodENTVDRTbnVHSkpHV3BOMjdJbWF1bkJaTjN4RVhzeW56?=
 =?utf-8?B?eExaejV0YnJzSHlYeXFCd3ZVNzFKeVZFNVRqZUgzbGorcHhSdlI4M0szRDA1?=
 =?utf-8?B?NFhuaXNTMXdMV0FuaVRpTEFmY3ZnZHp4YlFEdW91NnpGckhwa3l4SUF6bDE0?=
 =?utf-8?B?Z0hjNU41S1ZsaWZCNHdaMkZDMzZkalhwVVZnUDd4SHRTeHdCK3VIS0pETnNO?=
 =?utf-8?B?M3laN3U2bnAxZERNYXJvYmRkeStxUUowbjBpN2Y5TWZkT0l5eWE1WkFKUUZC?=
 =?utf-8?B?bi8rTkF5aG5LTGdMb2FoMXc2SGxxTmFaUG5xdFN1NzFSalpISWxJSmdVeHZ2?=
 =?utf-8?Q?Y17bi5hsF/PC2obZXkKS9MUcQJu5QzdbzF4y0rK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a908c7-de9d-41ea-4a97-08d937db4f5c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:15:32.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGLCJYRxfWuuPMTpHj1RwunAct1mLg9v7F/sLbIIFeLkG74X2SWkrh9+YtRSJAPmXxr3u6Jcd7+0Nk0EAkLjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

... or so I hope. This series continues the attempt to deal with
the ovmf change putting the shared info page at a very high address
(which is now planned to get reverted there, but the general
problem doesn't go away by them doing so). There are further issues
with truncated value, which are being dealt with here. But there
are also not directly related changes, when I simply spotted things
that aren't very likely to be right the way they are. And then
there are also adjustments to the underlying hypervisor
implementation, with the goal of making the returned data more
useful to the consumers.

With these changes in place, a 1Gb guest which has "inflated"
itself by putting a page right below the 16Tb boundary migrates
successfully, albeit the process takes from some 20 minutes to over
half an hour on my test system.

01: libxc: split xc_logdirty_control() from xc_shadow_control()
02: libxenguest: deal with log-dirty op stats overflow
03: libxenguest: short-circuit "all-dirty" handling
04: libxenguest: avoid allocating unused deferred-pages bitmap
05: libxenguest: complete loops in xc_map_domain_meminfo()
06: libxenguest: guard against overflow from too large p2m when checkpointing
07: libxenguest: fix off-by-1 in colo-secondary-bitmap merging
08: x86/paging: deal with log-dirty stats overflow
09: x86/paging: supply more useful log-dirty page count
10: x86/mm: update log-dirty bitmap when manipulating P2M
11: x86/mm: pull a sanity check earlier in xenmem_add_to_physmap_one()
12: SUPPORT.md: write down restriction of 32-bit tool stacks

Jan


