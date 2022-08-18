Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E1598392
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389509.626470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfBU-0006gr-7w; Thu, 18 Aug 2022 13:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389509.626470; Thu, 18 Aug 2022 13:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfBU-0006dh-4h; Thu, 18 Aug 2022 13:03:40 +0000
Received: by outflank-mailman (input) for mailman id 389509;
 Thu, 18 Aug 2022 13:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOfBS-0006az-82
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:03:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80078.outbound.protection.outlook.com [40.107.8.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c081b30-1ef6-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 15:03:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4685.eurprd04.prod.outlook.com (2603:10a6:803:70::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 13:03:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:03:35 +0000
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
X-Inumbo-ID: 2c081b30-1ef6-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4gNg7b7zR7aDjCYNc0hiFjXe4vZyuRLwI/oPr6341zraBkwBTJcr0XVe/2dNYCihYYFOYhMbX4nmWr1vE117YZU7x483oD+6Xr8x2MbAJh9CPMeV3BW56hP7pn01PiPlDdL8bRpRz7nUFHQg+HahYKAK2+ClWJXNFEYIjy5fCu2XtIkMc1yz+btrcybKw57099OYOY81crfv5cqEQ+HY9xpOga8U9zZi5hmveg7EqeJlI82J+C56g+GcoeZQ+xZQZ7fZTf0uTYiLJBAmGYveub2nIdMRkz5F1HOKXmikWPUHZrBYlpk5MXtusvI8AksAzMUweroOa1o87LwDMRSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GufiTphKbXdjH/yVuLYpS2HC1RVzDPNWpFYxqi2ghMA=;
 b=Ne7mb8pAlwXYmjpqmvhgNZmYLa2BUhPGE0GXh+ipP1TP4ZKbXuwR4x/SbEbNH75Upn3l+G//FIOHfr2QYHHn3zLG1JwYxlw8TQoNQKz8op0vttwGtnPhKWGZk/vipliBXEBnVAWAj1ExxkGtZt7ERSv53NEOypHzevwCqguSKxFLWKVY5mN3Vih9fpTkZ/+ilLSOw6QJrMhP5NOatpC4qfywjkuzJR26Ony8u+nFGSMzAHnZh19TghLah0nznrh6l1UmLJy5SwdH3oRj8C4l2z+sL3Af6UIecwZx0jvBsKpASyUbujRvgwS9twVfBl9j+xCm+7LREqyIte3CCtWLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GufiTphKbXdjH/yVuLYpS2HC1RVzDPNWpFYxqi2ghMA=;
 b=pP3VLR++0RCltSLCpcGYQhNywKrJPPAcNFi72vJpq9PDtd85Qct4mLIsYiovtrdGyrJooOBwdK+/uKrFcEUT3hhxHit9vz9w6WeLo73fUmVci9GxVdDAYLam4A6/yNzY6o/yTXVYmnlW85rzvLw9DYzmbEdd35jTlRsjHPE+dpP+rQk218ITGRr6KNxv7j0Q1DiuiqBIGj2457JMgvKi93EBTQ+qfZ21kQYonp5o/rsTgDxFLt5tNHILOXdbF/H3jS5TAFetOJOHcRY71q2aMZyqXXICT8dKfaaMqUF0XvYt/71Zh76Zv3xB5CiUWRwnWJ6YGefKbZ6Ir7uprOY75Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0690742b-21c8-e5b6-e8ff-5d4709e0c3ee@suse.com>
Date: Thu, 18 Aug 2022 15:03:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 1/5] x86/mwait-idle: add 'preferred-cstates' command line
 option
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
In-Reply-To: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0042.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cfbe721-0c7c-4cea-38c7-08da811a0f8f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ygqnQ6CX8i4xFVKwjnlRU5woUj2VyuSF8Ns1gUEZmVtPDFQI+9aE6UeaPQ433Ne+P/pxgmOrtqkp4m3XJBlyrfXYjxAGtCg0WASXxkWekOiimW0bDSwjW4Ki23AKim3zkC7yaBAsR8dYl+c5QTxFejAABiCx/xJSeZVD4PWH/u3RLRIwFiZyi4zySZL7SDZNqAm4CV9JMlt63TZiclCuUg9xE0xhWSymCIP0Oy4qhwJGxbFi3bI7+qNfXqoNTfMWARdH0ZWLvIVQeQsHge0FNBFoDJVc3sC4d8TcaJsnnRZCOxaRm+U6Sx5Ancs8A72eCa5XqBV4YRP0LWKtFiAVWuER1ZPxf5el2SozGgCBh//0u9/S4g2Cge2kxsJjAkCPVQLz+eCmIx1JsZOe9bZUn9j5oFTMqkwoeRM1IAg6SMhbNubm8IWaO1D0VUeZbIf3lpoyBvdRlOgPEEun+o6CnMkep6C/2dAgJ1SV7ZOWW86/snuU3qHCvwcW8o2nmgU3GJ8ptSQn5eT0gm+TwLgRytAen/0Cr3VIESUbTo5wxqDNkf8XTZV2WEYGUtdijbAGJxcdyxlUgLFxLgQBTCb5iVYTlt9oG2DyHGdJoJOEuBBCh0YVmDn74dlCAvPISkqCCsu2UeQy1kIas23ByaEMuzG7IBX1aR5mmuMtgMDI78D+gndcNV4VSkRKSHNv0MSvz/1IDJQyJesmAxomwIxitsjjUEfGSW6/dFpl3uLd5b2hfzykL32ieGkWdAONNrmpeGcV882eCC6IN4cm9nw1n99wHpwJOX2cPS3Z2DJab3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(366004)(136003)(346002)(31696002)(86362001)(38100700002)(83380400001)(186003)(2616005)(31686004)(36756003)(6506007)(6486002)(54906003)(26005)(316002)(41300700001)(478600001)(6512007)(6916009)(5660300002)(8676002)(4326008)(8936002)(2906002)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjVkS0dTdVhBcEd2NDBrb2kxV055MXE2ZVY3b3BwNWx2UnFrU0Y0TFRsU2hp?=
 =?utf-8?B?Q2JBRHdjUGtWSlRCWDl4TC9lZkxjNTgvRlN2TG42OUkzOUZyTDc3SkZSTTRs?=
 =?utf-8?B?Z2w3TVRmSjBpU3dQYTBkQWFRb0lIK29oSkFtLzJET0NhNDIrU3JEcCtxd0VE?=
 =?utf-8?B?Q1NxQUNJUkZveko5VWlFMTRHVkh2RXpWUXBXY1h4S1Nkc1QrVnJqYXEzWUFC?=
 =?utf-8?B?NnZCbnREQVYrQWtJckRPcStDdlhxWFNacExrcGx2Uk10eEhIajlXWW10U25U?=
 =?utf-8?B?dGpDTmhkNzZxUnVUZ0NXZGFEcXl0Vkd4RHpiaDVsRzYrY0N1QVhrVktaK0Y0?=
 =?utf-8?B?SmRuNXRLc3Q0cEt0SmExT2RFS0hCZzJ2OUtQV3EvY2hkVVNjdlNiYzQwd2xG?=
 =?utf-8?B?U09HK2FrbTJ5dnRvbG44YWNMYmtWbWV5d21lTXY5VXJmN2E3a2lGNkNvL1VO?=
 =?utf-8?B?RUc3bTVtOVpNZ1dXblR6TFRYSERSMVlwTXE5elRSUGV2VmhIMm9URG1JbmNm?=
 =?utf-8?B?b1lKQ0hqNUVUTG05V1lMajFLbkdEN2tTRUFRa1dDQ1grSTkxTzFCNHIra3M3?=
 =?utf-8?B?V3Z5RUxUNFU5SXFGK2lyeGRlbnl1WGNLakRXK2xWbGRKd2NRbytOVTllcU05?=
 =?utf-8?B?eWRjdldUV1NacmQxK3pTYmpkeVVrN2k5WG4rZWk0bU5DNERldS93VlpJVFhl?=
 =?utf-8?B?dDZPczNnOGMwZGxkbnFFMFJvNEdhcG5mUVJ4TGxzWjBNdlBQajRMeEpGSm1l?=
 =?utf-8?B?ZnhHQUNHNHU2L2p3NlpVRURHSVhMQWowbHhia1N2ekxVVWNKYmcwd2U5eGxy?=
 =?utf-8?B?M1dGeUdVSTZlbjdkNU1lN1hDQzNlUGxEcitpTk1IZEc2MU9OQ2xwZHYvODlo?=
 =?utf-8?B?NVRnYVNXWGZ6dmh2aWMzd2dMdzJiMVF5OEdMTUtOd3hQSjJGZVJxOTdGaGRL?=
 =?utf-8?B?QTFTckFaYytsMkRTUSswazYzNXRKUGZZUGVRaVlyaHVsUW9LYlh0bGg1RnJl?=
 =?utf-8?B?MFhiQjNoYWlrazRLdmRKdmdKVmMxNEZ3ckVCcnM2eW0yYzRYazNOT3ZUZzVH?=
 =?utf-8?B?Vk5GMm9PSzVsWWJ0a0dERWpoSWxqcjcvdldCWXlmYVJrd2krQ2lWL1I1UHBv?=
 =?utf-8?B?cE02TXRlbTl5aDVicjFJSVEzSDFLbngzeHdMZDQ1V3o3c3FteXlmc0hyUjdG?=
 =?utf-8?B?b0hXTkNDMk42Yyt2aTFscms0MGhOYUtpQlk4SEJXbmtoSFBvV0QzdVBmTVhK?=
 =?utf-8?B?YnEvUjZhUU1UUlhSc3lRZFZvUG93L1NWdlFoQmZsSDVLeDNwczd1bG5JWmJn?=
 =?utf-8?B?bC95SmV4VUlXN0JnVnJJSnBzUnlyOXJlV2FzQzVNNHhGaVVMTllRL1dHZDJz?=
 =?utf-8?B?M3RXR0FIdXNYKzUrTG80TmNDTUc3Und0bmpyNGVERXhwL2p5NFhqY3N4QkY1?=
 =?utf-8?B?Y001cVBHRDhKcTg5NkZYRGxnNGp1QmFwd0h3REZsaTNzSG4vNEI0ZkQrekM3?=
 =?utf-8?B?bkNCQ3J4b2xGYUxIcEFxVE1yRWw4dWRzMzROODBRbDhhZzFaY2l5Y2R6bSt4?=
 =?utf-8?B?b2lXdGd1NHh4d0ZpL2NlUnNIQ0NGcTFWLzRlQzlPZjhpRjFPanNYY1NxNGo4?=
 =?utf-8?B?ME1TSEVTWWYvZ2NuTW1namZIYUF5ODB1bi9waUtYSFBnTFlXamlGYTdIaThp?=
 =?utf-8?B?NytMUi9rUHc4d2R2VzMvUGcyU0RlYjlSNVFYWGFQeUNDeTRmWUk5QmhFZjhR?=
 =?utf-8?B?ZldsNGhpeUJCV1NOY0plOFY2M0N6YWp6UXRYeW5EQWNTcFlXK1JqdTA2TVJs?=
 =?utf-8?B?ck5lT1Z2RVU0MVVxVUN4NmFXQXZqdXZUV3ZuK3FkMHlCdW4zeHZnQ3UwL2FL?=
 =?utf-8?B?TjFOVUI2ckY3aE9ETTRuM3hKZ2dMalVsRU8yYTl1WnhJSEJiSXZpcXpJQ3FW?=
 =?utf-8?B?a24yQjFkUjR5TE9GQmdTZm5SMGpqdW1ONlcvZGZXM0NuNU5BWUFqQzRaNkx6?=
 =?utf-8?B?bS8xRG53RW1ndGE3cHBuenRrcWJrbG5tNnpaYk9acjgrckthU3JKZVY0RmN5?=
 =?utf-8?B?YmhXRkYxbUdZMmY5akxLdjZoczdnc2dNR0s0UnFyR1ByUCtnS1hEOXBncHYv?=
 =?utf-8?Q?8cYvkmPTyoKjLMfNX0yDhKS56?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfbe721-0c7c-4cea-38c7-08da811a0f8f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:03:35.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuNVhqFx8yuhEW6BM77m/UbIdOAvJoLb4W3/NtKFFk00zezH0zEZ9yYLCZTAqr3O8nSHWucdKDAcppVWPsqbfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4685

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
exclusive - only one of them can be enabled. By default, 'intel_idle' driver
enables C1 and disables C1E. However, some users prefer to use C1E instead of
C1, because it saves more energy.

This patch adds a new module parameter ('preferred_cstates') for enabling C1E
and disabling C1. Here is the idea behind it.

1. This option has effect only for "mutually exclusive" C-states like C1 and
   C1E on SPR.
2. It does not have any effect on independent C-states, which do not require
   other C-states to be disabled (most states on most platforms as of today).
3. For mutually exclusive C-states, the 'intel_idle' driver always has a
   reasonable default, such as enabling C1 on SPR by default. On other
   platforms, the default may be different.
4. Users can override the default using the 'preferred_cstates' parameter.
5. The parameter accepts the preferred C-states bit-mask, similarly to the
   existing 'states_off' parameter.
6. This parameter is not limited to C1/C1E, and leaves room for supporting
   other mutually exclusive C-states, if they come in the future.

Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
to disable C1 and enable C1E, users should boot with the following kernel
argument: intel_idle.preferred_cstates=4

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6

Enable C1E (if requested) not only on the BSP's socket / package. Alter
command line option to fit our model, and extend it to also accept
string form arguments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also accept string form arguments for command line option. Restore
    C1E-control related enum from Linux, despite our somewhat different
    use (and bigger code churn).

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1912,6 +1912,12 @@ paging controls access to usermode addre
 ### ple_window (Intel)
 > `= <integer>`
 
+### preferred-cstates (x86)
+> `= ( <integer> | List of ( C1 | C1E | C2 | ... )`
+
+This is a mask of C-states which are to be used preferably.  This option is
+applicable only on hardware were certain C-states are exclusive of one another.
+
 ### psr (Intel)
 > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
 
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -82,10 +82,29 @@ boolean_param("mwait-idle", opt_mwait_id
 
 static unsigned int mwait_substates;
 
+/*
+ * Some platforms come with mutually exclusive C-states, so that if one is
+ * enabled, the other C-states must not be used. Example: C1 and C1E on
+ * Sapphire Rapids platform. This parameter allows for selecting the
+ * preferred C-states among the groups of mutually exclusive C-states - the
+ * selected C-states will be registered, the other C-states from the mutually
+ * exclusive group won't be registered. If the platform has no mutually
+ * exclusive C-states, this parameter has no effect.
+ */
+static unsigned int __ro_after_init preferred_states_mask;
+static char __initdata preferred_states[64];
+string_param("preferred-cstates", preferred_states);
+
 #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
 /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
 static unsigned int lapic_timer_reliable_states = (1 << 1);
 
+enum c1e_promotion {
+	C1E_PROMOTION_PRESERVE,
+	C1E_PROMOTION_ENABLE,
+	C1E_PROMOTION_DISABLE
+};
+
 struct idle_cpu {
 	const struct cpuidle_state *state_table;
 
@@ -95,7 +114,7 @@ struct idle_cpu {
 	 */
 	unsigned long auto_demotion_disable_flags;
 	bool byt_auto_demotion_disable_flag;
-	bool disable_promotion_to_c1e;
+	enum c1e_promotion c1e_promotion;
 };
 
 static const struct idle_cpu *icpu;
@@ -924,6 +943,15 @@ static void cf_check byt_auto_demotion_d
 	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
 }
 
+static void cf_check c1e_promotion_enable(void *dummy)
+{
+	uint64_t msr_bits;
+
+	rdmsrl(MSR_IA32_POWER_CTL, msr_bits);
+	msr_bits |= 0x2;
+	wrmsrl(MSR_IA32_POWER_CTL, msr_bits);
+}
+
 static void cf_check c1e_promotion_disable(void *dummy)
 {
 	u64 msr_bits;
@@ -936,7 +964,7 @@ static void cf_check c1e_promotion_disab
 static const struct idle_cpu idle_cpu_nehalem = {
 	.state_table = nehalem_cstates,
 	.auto_demotion_disable_flags = NHM_C1_AUTO_DEMOTE | NHM_C3_AUTO_DEMOTE,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_atom = {
@@ -954,64 +982,64 @@ static const struct idle_cpu idle_cpu_li
 
 static const struct idle_cpu idle_cpu_snb = {
 	.state_table = snb_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_byt = {
 	.state_table = byt_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 	.byt_auto_demotion_disable_flag = true,
 };
 
 static const struct idle_cpu idle_cpu_cht = {
 	.state_table = cht_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 	.byt_auto_demotion_disable_flag = true,
 };
 
 static const struct idle_cpu idle_cpu_ivb = {
 	.state_table = ivb_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_ivt = {
 	.state_table = ivt_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_hsw = {
 	.state_table = hsw_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_bdw = {
 	.state_table = bdw_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_skl = {
 	.state_table = skl_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_skx = {
 	.state_table = skx_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_icx = {
        .state_table = icx_cstates,
-       .disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static struct idle_cpu __read_mostly idle_cpu_spr = {
 	.state_table = spr_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_avn = {
 	.state_table = avn_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_knl = {
@@ -1020,17 +1048,17 @@ static const struct idle_cpu idle_cpu_kn
 
 static const struct idle_cpu idle_cpu_bxt = {
 	.state_table = bxt_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_dnv = {
 	.state_table = dnv_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 static const struct idle_cpu idle_cpu_snr = {
 	.state_table = snr_cstates,
-	.disable_promotion_to_c1e = true,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
 #define ICPU(model, cpu) \
@@ -1241,6 +1269,25 @@ static void __init skx_idle_state_table_
 }
 
 /*
+ * spr_idle_state_table_update - Adjust Sapphire Rapids idle states table.
+ */
+static void __init spr_idle_state_table_update(void)
+{
+	/* Check if user prefers C1E over C1. */
+	if (preferred_states_mask & BIT(2, U)) {
+		if (preferred_states_mask & BIT(1, U))
+			/* Both can't be enabled, stick to the defaults. */
+			return;
+
+		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
+		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
+
+		/* Request enabling C1E using the "C1E promotion" bit. */
+		idle_cpu_spr.c1e_promotion = C1E_PROMOTION_ENABLE;
+	}
+}
+
+/*
  * mwait_idle_state_table_update()
  *
  * Update the default state_table for this CPU-id
@@ -1261,6 +1308,9 @@ static void __init mwait_idle_state_tabl
 	case INTEL_FAM6_SKYLAKE_X:
 		skx_idle_state_table_update();
 		break;
+	case INTEL_FAM6_SAPPHIRERAPIDS_X:
+		spr_idle_state_table_update();
+		break;
 	}
 }
 
@@ -1268,6 +1318,7 @@ static int __init mwait_idle_probe(void)
 {
 	unsigned int eax, ebx, ecx;
 	const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
+	const char *str;
 
 	if (!id) {
 		pr_debug(PREFIX "does not run on family %d model %d\n",
@@ -1309,6 +1360,39 @@ static int __init mwait_idle_probe(void)
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
 
+	str = preferred_states;
+	if (isdigit(str[0]))
+		preferred_states_mask = simple_strtoul(str, &str, 0);
+	else if (str[0])
+	{
+		const char *ss;
+
+		do {
+			const struct cpuidle_state *state = icpu->state_table;
+			unsigned int bit = 1;
+
+			ss = strchr(str, ',');
+			if (!ss)
+				ss = strchr(str, '\0');
+
+			for (; state->name[0]; ++state) {
+				bit <<= 1;
+				if (!cmdline_strcmp(str, state->name)) {
+					preferred_states_mask |= bit;
+					break;
+				}
+			}
+			if (!state->name[0])
+				break;
+
+			str = ss + 1;
+	    } while (*ss);
+
+	    str -= str == ss + 1;
+	}
+	if (str[0])
+		printk("unrecognized \"preferred-cstates=%s\"\n", str);
+
 	mwait_idle_state_table_update();
 
 	return 0;
@@ -1400,8 +1484,18 @@ static int cf_check mwait_idle_cpu_init(
 	if (icpu->byt_auto_demotion_disable_flag)
 		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
 
-	if (icpu->disable_promotion_to_c1e)
+	switch (icpu->c1e_promotion) {
+	case C1E_PROMOTION_DISABLE:
 		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
+		break;
+
+	case C1E_PROMOTION_ENABLE:
+		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
+		break;
+
+	case C1E_PROMOTION_PRESERVE:
+		break;
+	}
 
 	return NOTIFY_DONE;
 }


