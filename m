Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BD850F99C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313641.531295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI4J-0000st-8j; Tue, 26 Apr 2022 10:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313641.531295; Tue, 26 Apr 2022 10:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI4J-0000qG-5V; Tue, 26 Apr 2022 10:05:15 +0000
Received: by outflank-mailman (input) for mailman id 313641;
 Tue, 26 Apr 2022 10:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njI4H-0000hM-8i
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:05:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c6381f8-c548-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:05:12 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-3_r9ETmuNiu4y_DjjBqywA-1; Tue, 26 Apr 2022 12:05:10 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB7358.eurprd04.prod.outlook.com (2603:10a6:800:1a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:05:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:05:09 +0000
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
X-Inumbo-ID: 5c6381f8-c548-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650967511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsBeSiMQBYJ8DaiSl7aINKcWykVorNvddkc7DYO2PHw=;
	b=RReMBECklLBtC4e48YVr6FugeZjwv76psssQ6vpbOjYtB29JEJhCRlHKo61JiVlFMmmy5t
	vB3yB/2EYyyk6Uhz2rC4jUCVivhnNT/dF29nBgOfLmh+7zR37KlzLxfh6M4kJvRDN7y08A
	slQTN+yL5kgS0qzEm55+Yv88CWhuLVY=
X-MC-Unique: 3_r9ETmuNiu4y_DjjBqywA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XghLsbtarZ+nw6G3zHhyO98g6+2iz88I3rGIIqj28nwMXqiQCuXHKEImXDIKyZ3r/aTH80FnK0l3MfAyG9ebhZWB9xDqHbq8XoUorZZSBsxzWSYVhSs2J35A8drSwtR07krSdJHlJp50DCgElsu2NfkaIPW87WMl6UPmNfrTLvw5J2VZRteROKk5pwYS973vBKiGnqEmDrRJmaIOW6DYXRoXHl8ipLBKHT+b3GOeG9luQGrgRznF+oDP4WbcFXoD5egTMCxvkJgfdurU1XqKnKss9wyF+LI0MYig/AiEoGbS76X4KR+OR+qtc9yYzERJlMk9HEo+zPgacr7cnLnXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsBeSiMQBYJ8DaiSl7aINKcWykVorNvddkc7DYO2PHw=;
 b=aP9miXisitKiumBjpUBYEuwJg6BtO/wyqbtZhQJ/OLKNluavjv9cgYux5N1asaWCNWHZXIYYVA9JCBYNgrE+db6OEHthlEL7v8kI8yZWoO3aBVeY5iAAWby/LvYE0AdKDRWMdTCj6XUFDeHfXBC67+bZJlWtV65LBk7C8uiivtjvuKNcXo6Vv95Qyphbpm/FGU1m2lAufhr8s4A3OI71H0XkYpg6zQc3EWQOSnpeuVW+Q7L2EUkKST1oFVKPM/fnn/k4XT31wEPODmmM/zUa9yey3ZagfmWki+0qC656Yb1CsknxGS/PGk6+T+GFheZtsTw22Sb14PHxTjizkjzrVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <722833a9-e6bf-1a63-e866-aed0648c785e@suse.com>
Date: Tue, 26 Apr 2022 12:05:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH 2/4] mwait-idle: add SPR support
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
In-Reply-To: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0765.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3009757-dc59-4d9f-595f-08da276c3f2f
X-MS-TrafficTypeDiagnostic: VE1PR04MB7358:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73586B4D962395D5818FB0EAB3FB9@VE1PR04MB7358.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d7vxolkD7qJQyEtil8oiep6UiDKzJzAXOx/dBe09YFLxOdiGGtYgAKYf6jgAG7OqXguvm914R/JrhI4ZQCbs0Hty6ZXMLy0jPF2AEsu8+cooEe9DO+beqbWEhIx8kOYou3JVw1SjvbaKVh+LasshZ3rynjK6xGVrDmxcd8EV/+FKlBGotwPht8xmHgYzwEDUt6BwPjI8yBNovA9G3OP5ml6jeFAOb4jQOIIYsurtz5YqjCabLFbk3E6oNGYv4dFFwNB1pdiV9BJ2eJjfkEpboXC69TujRXayGIRTTPZVlf36GAFDXXKiFVmxzW2MhGlFy20UHHyDeoaZyujjhyeGVmSUhg+qabLSGZhsX0dUYI0/c7r7AYp+cj6Lnz0Qm4jD5OgW+xf3VnoTZ1eTMw5JzqaWXV8gL1YaHH0RRVAwVEEnYHcMYDu1NSjxDZNeQL9kYl8VIInySgbnApNXptcSKduR7qx7a/M8TfG/cgrB5hpleCtzStOVLhgRsIPipA1xMKPz8CHUo2LT8fhw4eQieOoEKZqKctWwePHJUAx0pwcgqyNKm0RvwTA4dyolGM+qoflRxCyf2w1obP1vb+/LDXwWBA0ePTRjr2IGm5fzBk1LODsXJ76ONiv5sJrUvHdsX1mgdq3YlmQPJ6xRzD8EiUJDJBjwibS68/HIGeYZFggvUF1eZj0QwKTkbssTRqkLjOq21sPNtinIf9mtdyuB4+tilF1hJXiAC0oH7HPt5/FnZMC+E6za1xwcb7yujQDMhB7UTHMj+E/ZmMZdvPYWKhblNX5yF00N4mt2NbCH6taNpAJhccmDcKNVJ5TSLfreRBM4xxzskNppHLbDXiLXmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2616005)(8676002)(5660300002)(186003)(2906002)(31686004)(83380400001)(316002)(54906003)(6916009)(6506007)(66946007)(66556008)(66476007)(26005)(6512007)(8936002)(84970400001)(6486002)(31696002)(38100700002)(508600001)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXdZS1I4cWs0dkdUTGNoNk1mbmxIamhYODEzRGxYUEJ0RW1oNlRkL01tc1Ez?=
 =?utf-8?B?RFN1RDA1ZCtrVTN4L3FyeXRSOXMrbHBla1c2QVJPUW4rUExoY1cvQnJ0LzBH?=
 =?utf-8?B?UUFBeWpQVlRNZ1pXcGYwK08zQTJXTGZiVHBvaktOaTBLZ2VRdHBNcDlyK25i?=
 =?utf-8?B?U0ROS2tPbnRtaEhLN1ZzOFh4R05KMFgzZVNERjZReVltY1NJMmorR3pVeHpk?=
 =?utf-8?B?YnF0bkxBVXpKaXdGY3g3UnF2SUFUcUJPMUtNejJBZHR6V01EZmJNVCtITkIr?=
 =?utf-8?B?SGlTam11aWZoeVEwRnREZGVlSktFejcxelZwcURpZ3RZSWJrOFNKcWZ5UkVi?=
 =?utf-8?B?VVJ5bjZWZWpPdXp1bzB2ZUYzVVFBQy9yaUxjWnR5VFVzNTd3RWp3U3gxcDBS?=
 =?utf-8?B?c1JwZ01sUy9qbzNpYzhwRkVtVzV3Y0NoaHFIM2Jra0QyTTRVL045bU8xUzAy?=
 =?utf-8?B?UHdNQUoxaWhnUnRXNm9ucmNRSFg2cGlKWnlQeW5udDk4Z1MzT05PVGI3Z2Yr?=
 =?utf-8?B?a3dpbHE5NzB1dlBrVGNFRE01VDEvdW9DenhJU3lrRjBUcFRUc0ZjU21Da1Zr?=
 =?utf-8?B?WlUyaXNYM1F6WnkvQ2oyYWNLU05zSVJ6ZytVSnFMQzlubkhmSjdyaFhhL0VM?=
 =?utf-8?B?aWwxTWRlUmV2Vk5pS0FGK056eW9KekY3eXVkNlZIMnJsdDJ3ZXlaZHlSVzV2?=
 =?utf-8?B?ZlhFNi9lQVNRd3BVMW0rMHhmMVVxeEhUS1A5WFJXN1NVd0FJWG80NWw5b3Bs?=
 =?utf-8?B?SjNaQnhPeHNwRE9oRktoUE1hMlRtTmQwUkVjSHI4dktRaWtFQUxrdGI0RjlN?=
 =?utf-8?B?ckFRYnV0WHhrVi95UlFlRnJES3dXaUVCL28yWDJRSUZ5QmxQUHg1S2Y3WnpV?=
 =?utf-8?B?dTJTK3FycnIzRkJUTTBBVE9leHNwVExiNkRWSHRnaXluaHROaStMT2FVZ29C?=
 =?utf-8?B?Q01EZzZtcmRZNEF3Vi95ajI1eXZwOUh5SmlRM1licmM5dm9sS2xNSEF0RFVJ?=
 =?utf-8?B?TmdOa1h2N01DQy9jTmI4cDdhck5yUmFnOG82NHd3QW4vVVA2MDRpanZOMXpz?=
 =?utf-8?B?bkZZZkZYSVdMSTVXS1Q3eFlUb1VMeWprMG52T21LNUtZT0pLUkFMRTlYd0dS?=
 =?utf-8?B?aDI1WWFqdDlBMHEwNlZHcG11VERtTmJkZ01pQjB1U2djdW9PZ0N1c25JNUZr?=
 =?utf-8?B?WFEwY1Z3MHJnQWdIcVNGcndxNG9UaVhva0MwTEJJNGZGOWxKWm1DV1JIOG4y?=
 =?utf-8?B?YS9MTEx1NGdDR01SeHpTcWVtZnpKT1N2NEhuYXkwUjRqOW1ielRFbm1nMFZG?=
 =?utf-8?B?U1FGNGY0YU5HYVFWa01uRU0rdzBITEtMQTlHaUZtOW5lWEVRMDlUNHltT3M4?=
 =?utf-8?B?dk83YnN4V1J5YTlNZWszMDRuSDJmQStIT2lvbzJPYlMyMmFXYmxFVm5JZU1L?=
 =?utf-8?B?am1yTlplTHVTRFc5SEduaXhTaVhySTdWS2Nmdmh6SC9Odzl4Z0tpbWJSeSt0?=
 =?utf-8?B?TnlNY0tRTmJFQ0h3RjBRMXlZOVJwRWFVYXc0bkpkNzhHREVzbWQ4M1JWTDhq?=
 =?utf-8?B?N2FKRTFFK3JhTWhYd20zVE91WmIxQmZMY0hYZ21ZYklqU3VXWXYwVWpGSmJn?=
 =?utf-8?B?UmM0aEpTWjFGMjdrSnFJbnhBbFN4WHVBSVVycnZrcGhqMVcwTWxqVTFsUXd3?=
 =?utf-8?B?WjlGTUhZeVRDLzBydVFJVWZOaXMxbkh5K0tQWm9lT0szWTVOSmNocFhhZ0NP?=
 =?utf-8?B?SWIzbGRLQkJIdUFUMzY5WFBMNlh5U09tYXZuUnNvaUhWVTJORml2RkdsQkUv?=
 =?utf-8?B?VU9yclJ3aHdtN2lSUG5KN3RabnZucXNGUTZ3WWhyK01mQWtiUUFXSG1mZ1hz?=
 =?utf-8?B?clpyaWRmVVpFQTloVzNUQjR6VGh2N1BEUEsyRlhsRjdKdlV2NTZ1WGI0Mytj?=
 =?utf-8?B?U3BLWjFGZk04dzl6VGQ3NFdNV2dJQVZMdkNmeEduK1ROS2plQnlxcDBEcmhR?=
 =?utf-8?B?RXlYMlJLYXZ5Z3c0WmtvcFFqVlRraFQyamU3NTArd0ZuZStJajMzUmNHQVpC?=
 =?utf-8?B?WkJiVWdrcGVYSS9hbE4xM09YN3lUNVJCek55M2pGVEVHS3lQTDhCNUhndHh3?=
 =?utf-8?B?Yi91NmV3N3E3VzV2b3JsdmJ5aDFjUCs0b0RtckMrdm03dCs3VklUcFBSbFVW?=
 =?utf-8?B?RjhhVTNUb2U3RkNQbElXRGxuZ2hwWkxpdFBySU5STkpNc2dEYUxEdDJUdG4x?=
 =?utf-8?B?LzFieXFVMmdEQXNmOWN4aGYyOTVPa3B3eVZyYU0xeUo5dUJ4U1NpOFhMZHE2?=
 =?utf-8?B?a1F6VEdwT29hNm1IaU1GYTZnSmhMZnBTK2k3TG5zb1UzcGxpRTNaUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3009757-dc59-4d9f-595f-08da276c3f2f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:05:09.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9DnEWv9EIsHO3Gjde+7/pof9Dosdf7EKBvxzdagGcUeDDZuknahFib4XyoWvAgdnv0zQecWcQzDTFqlL7OswA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7358

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add Sapphire Rapids Xeon support.

Up until very recently, the C1 and C1E C-states were independent, but this
has changed in some new chips, including Sapphire Rapids Xeon (SPR). In these
chips the C1 and C1E states cannot be enabled at the same time. The "C1E
promotion" bit in 'MSR_IA32_POWER_CTL' also has its semantics changed a bit.

Here are the C1, C1E, and "C1E promotion" bit rules on Xeons before SPR.

1. If C1E promotion bit is disabled.
   a. C1  requests end up with C1  C-state.
   b. C1E requests end up with C1E C-state.
2. If C1E promotion bit is enabled.
   a. C1  requests end up with C1E C-state.
   b. C1E requests end up with C1E C-state.

Here are the C1, C1E, and "C1E promotion" bit rules on Sapphire Rapids Xeon.
1. If C1E promotion bit is disabled.
   a. C1  requests end up with C1 C-state.
   b. C1E requests end up with C1 C-state.
2. If C1E promotion bit is enabled.
   a. C1  requests end up with C1E C-state.
   b. C1E requests end up with C1E C-state.

Before SPR Xeon, the 'intel_idle' driver was disabling C1E promotion and was
exposing C1 and C1E as independent C-states. But on SPR, C1 and C1E cannot be
enabled at the same time.

This patch adds both C1 and C1E states. However, C1E is marked as with the
"CPUIDLE_FLAG_UNUSABLE" flag, which means that in won't be registered by
default. The C1E promotion bit will be cleared, which means that by default
only C1 and C6 will be registered on SPR.

The next patch will add an option for enabling C1E and disabling C1 on SPR.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9edf3c0ffef0
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/arch/x86/cpu/mwait-idle.c	2022-04-25 16:48:58.000000000 +0200
+++ unstable/xen/arch/x86/cpu/mwait-idle.c	2022-04-25 17:17:05.000000000 +0200
@@ -586,6 +586,38 @@ static const struct cpuidle_state icx_cs
        {}
 };
 
+/*
+ * On Sapphire Rapids Xeon C1 has to be disabled if C1E is enabled, and vice
+ * versa. On SPR C1E is enabled only if "C1E promotion" bit is set in
+ * MSR_IA32_POWER_CTL. But in this case there effectively no C1, because C1
+ * requests are promoted to C1E. If the "C1E promotion" bit is cleared, then
+ * both C1 and C1E requests end up with C1, so there is effectively no C1E.
+ *
+ * By default we enable C1 and disable C1E by marking it with
+ * 'CPUIDLE_FLAG_DISABLED'.
+ */
+static struct cpuidle_state __read_mostly spr_cstates[] = {
+	{
+		.name = "C1",
+		.flags = MWAIT2flg(0x00),
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01) | CPUIDLE_FLAG_DISABLED,
+		.exit_latency = 2,
+		.target_residency = 4,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 290,
+		.target_residency = 800,
+	},
+	{}
+};
+
 static const struct cpuidle_state atom_cstates[] = {
 	{
 		.name = "C1E",
@@ -972,6 +1004,11 @@ static const struct idle_cpu idle_cpu_ic
        .disable_promotion_to_c1e = true,
 };
 
+static struct idle_cpu __read_mostly idle_cpu_spr = {
+	.state_table = spr_cstates,
+	.disable_promotion_to_c1e = true,
+};
+
 static const struct idle_cpu idle_cpu_avn = {
 	.state_table = avn_cstates,
 	.disable_promotion_to_c1e = true,
@@ -1034,6 +1071,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(SKYLAKE_X,			skx),
 	ICPU(ICELAKE_X,			icx),
 	ICPU(ICELAKE_D,			icx),
+	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(XEON_PHI_KNL,		knl),
 	ICPU(XEON_PHI_KNM,		knl),
 	ICPU(ATOM_GOLDMONT,		bxt),


