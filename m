Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697396F5B99
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529331.823640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEpi-0003TL-2u; Wed, 03 May 2023 15:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529331.823640; Wed, 03 May 2023 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEph-0003QT-VT; Wed, 03 May 2023 15:55:57 +0000
Received: by outflank-mailman (input) for mailman id 529331;
 Wed, 03 May 2023 15:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puEpg-0002MD-KG
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:55:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9c191c-e9ca-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 17:55:55 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9658.eurprd04.prod.outlook.com (2603:10a6:10:31f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:55:53 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:55:53 +0000
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
X-Inumbo-ID: fc9c191c-e9ca-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inLmMtkj/mKxcjN81kgyPe/lnB/4VWpaGW50iS+vg88WDPZBlDV/ycy8N1GP97TGe3ZG82g/HYehDp5IbofzsKhgZcaFKPJH1/n9qnk8U8KGD+/1HJUJrowrjvPG30kgbRDi38rjV6HibvL6mFw3TciDbvmayb/aTpjF1lYhh646qt1ahcGVtS5X7FrwoZphGYAgkXGhagwQSKP8fKA8sl50nV7sR70u/j6EwifIqq41eOoesaWd74SO5YXDWBo3Rg59q65dxqU8JSh4M71os02P/97Ic0hkMV45tVEEfaSoV927OXyyiC/EVqemn+j4YLRY4uWusLw91S9DGcwRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tj6boY6MQ0Ajhx1lKmKqTBrZzfbIB+gH7SjBjs88Cgs=;
 b=WOmbBwvy6yvVcm4/sRFEytdm/A7nloW60M0F43SDphMcYYxgBT214ndozt8RGtpoqQPD7QCOfHTQJrGGhN03C8JJUFULnK06hHKMgevfMb/frnlf0q5aY4k4smaRnz3ca8Ls9FY9c1q0PgHH2GiPsPGlfT5V7b2HB5GzzH/7BqVrtG1RECjwcr97KSpdfYd/qW5tYwSQkt8VWo/hai6mnjPS/GcPtaguMBkgP7GWkjUGpSTVh9V0NPLYD0FLO5DScuHC0B4rLxTUPkMVjjV7kfVD4LO+9cKtptauRDGkYiuvYDNxaY3SdOlS0CkVoUJujN+2VNpgTRaSJGdoio6PKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj6boY6MQ0Ajhx1lKmKqTBrZzfbIB+gH7SjBjs88Cgs=;
 b=JnxDbA7c26oKLPC7EQWSU+WaPlfFEV14MIM8YKhRqQ2+CIl5hq475tY5yDlLbk+JPalAJjCIzNb9kGagNIeR9wYb/csi4rTf3pf+QK5szHVs0KNT+9fNS2R7WSSYqPoAw0Grk1RZImFrEfSlm4G6cBC5qk3vYueP/wn460uNnuG4bTLUIne8hemx+j5hCdxcQ1LN+Kk6P5spq+irvLmd8KMoSeS9hYY6E8g+so6tp/b5qrwXUxX9g7lfNmLTE5/RmdwGI04aLI6YIVh7afGnQ4z8V7IkUCt9wHU9Tk/CYNB7BNGv48g2oDvtoBb32eigVzxpHH9S7mqo9P3astgCOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cbc92ac-7817-e08c-0e7a-bddd0a4ce070@suse.com>
Date: Wed, 3 May 2023 17:55:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 3/8] x86: update GADDR based secondary time area
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
In-Reply-To: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU0PR04MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: e382cbbb-bef9-4559-58fc-08db4beedffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FBHUQEIdZLzsPyjdhKbpxKEMLI8j1EcOqu1V6MCesVhb7bAsTi8sttRZOz84wyxW6HQf+gWYp1HApVMRzhqLRqSa+qh/3A407eB/whFLAvipq2JZoRI3SxZBxG1ToSJM/IL4z9By3aZhLWNxd27deKEqrtLz4F+8YfYMEs0a8OMWQx5Lfkw0XRjjsN0piturilZfpsZW81pDJ//6FHmybvhHpN1lHBFAYCTr7M8OqtPAsxHM3mNHBNBg1c1CYzH2neP/ZSAZZA/ToonoQb6LyWHdGNtBthxKVYGiV+IsSYVMJVaZScVRS+UApr43wNwrhr/OSdEepjGqA7jxJ7Nyft9yqGcZV/hLPq6guwg5/3qTTx9jA8ykFtt5JwP4HPZ8lFa9AZwm0pEY+6Akvk7uc8hBGdqOHluOV9XTKqBridrUGuz4pFfTIUQc2YnbqgjqDPVij60ViZsdOvWFZ38vMPQZZr/D5kH2S543rpnWA+Fd5NEvfTPDhWT+iAX8yyyqxXT8LlMsZsS5v43dytaAgi9hZVas9hRKWEo0+3MeEwLMu6KRC92d6V3xZkjoU2SBwnNueMi0OjT5Iyz8gRl1LyPMJWChiqrxIyH1VsCoDFbIPzuWh34eL9fJ984/yjfSBl8AI39gr3EdrNxM155VPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(31686004)(66946007)(6916009)(66476007)(6486002)(316002)(66556008)(41300700001)(54906003)(4326008)(86362001)(31696002)(36756003)(5660300002)(83380400001)(26005)(6512007)(6506007)(2616005)(15650500001)(8676002)(2906002)(38100700002)(186003)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzJSRUN2ME00K21CeGtLMkx3WlpsYTF1NDVZdnJUQ3lPUjJZS1A2N1RNZk9X?=
 =?utf-8?B?V2JyUiswamR6cll2Kzh2T0gxbEFBZFVFOWNZNERvNzl2cTJZeEkwcUppOG9Z?=
 =?utf-8?B?Y24rakNzTzNEdlh0R1VodUZCdktXWmdRWllYVEF4YUQvN0JEV1FaNkRZVENx?=
 =?utf-8?B?ckNHOXRiVWNuRk5tMFU1YVJ5cXRyNVYzOTBKR0tsVmF2OUkrUTR4ZkVGZ2Vm?=
 =?utf-8?B?Q3dKaWRTUTRiT0NSR2NDbXpjb05WQkkrNVh5Vm5CVndKZHJmUzYrM1d2UDhz?=
 =?utf-8?B?U1RhYjc3SlNHdEhrTHNmZGdVR1ZrMDhRcjBObUlKRy9HZUdXUUV4S0FoYW5p?=
 =?utf-8?B?VjFVYjgzQzd3RnRWSFJJWERrNytFSGFhcHRMbEhWNG1Jc2QwZW1LWGVzOWhO?=
 =?utf-8?B?UXBQZmRCS08zaktNeWlFVWFwSDdhZUhObGw5T1Z3OWRMek5KcHZnNXlWL2Jp?=
 =?utf-8?B?dFYzdlBrdGhIU0VPYTBXTUJ4VkNpUHhCbDdpZ1ZyZWJSV3pWRzNkRUcxbFpm?=
 =?utf-8?B?Q0tXQjFFZDVPWUNDazRGNkpOYlBqSDlMU2IvVVhOdGZyRTIzNHJmcC83eG53?=
 =?utf-8?B?dXFaRFFYQ0o3UzFSMFVQQktJM1dubmdmWDAwM1NKci8rTVFPU1pzc0I1SWhC?=
 =?utf-8?B?QTg1d0MwKzI2bUFmejhHdi95bWtHbEVidlMvT2hnTzB3TVovV1VZNXNPMmxS?=
 =?utf-8?B?cU9tWDdZVTl0eWkrVElxMldSYWdTS2pBZXI4ZFo4NTVmaXhhdjd3RVgxWGxI?=
 =?utf-8?B?VXZ3Vy9QeFRkZ1p1ZFpYTnhzT3hJZVFxYU1RSEY0eXJEdzhLUElJaG9tSzUr?=
 =?utf-8?B?WVFmRHk2Vnc4ejVXQ3U2K2dYT245a25PSmhqWDRZV3B4WjZHbmppQUwxbEFY?=
 =?utf-8?B?MXI3aHVhU1BmS3ZYakI3NDNDZE1pYWozMkdqODRGemM5dDRNbXJ3OXE0QUND?=
 =?utf-8?B?blVFWXZpSVBSRG1lNXl3UGR1YlJYZ2hYYmZIQUxtSFdrMzFydllsK2J6dlpN?=
 =?utf-8?B?bTJHVUdmeE52OUJnaGtkOUEzOTQ0ZjE5ZGREYnZ2TEYwWkNXOHVkQS9wUDlH?=
 =?utf-8?B?cWhDMmk5Ni9oL2IvY2JoNGdWMFBiTE9MUlRzLzV0UnE0aTRHYnhCTlFqRUdH?=
 =?utf-8?B?YXYydjFJUUJvbW00RHZpVzNyRUU3YjZBbkQvdHZTcUtGZEtEL0NHUkt6dVFs?=
 =?utf-8?B?TW40Rk5LNGZSN0F3S2hHaFNLaXBYS0xybVRRY09zTHJXekl0UWJXVEQ2YjFG?=
 =?utf-8?B?QUc3UUsvZjdVdXZQcDVoY0J0bFdLN2lwYkJwRWZCa2xZQ1hwcGlMSnZidzVS?=
 =?utf-8?B?bzkyVUIxNGRhbWg0OXBWOUc1MzRWMmZZaWVqL3NUNnQxVFFoNHA4U2NkR3hm?=
 =?utf-8?B?dHlJRjNxV1VKTGk3WU90TXlDS0JZZml4NDV4RWZtRDBnV1FIUjlXd3h0em4y?=
 =?utf-8?B?OXlBUXZHb0lTVWsyNmdGamRQVEwyVno4b3NNemE0V0o2VUhDaEhyWW4wN2g4?=
 =?utf-8?B?VWFJZU5ZTXh4M3ZCM2FnZEhHOG5MNmp6RTQrekY3WFh6cWxPV0c2TXJLbUlS?=
 =?utf-8?B?MysraFZQRUJjRnZxNHJ0WGgvaEVLWm5zYXJLa0xtdk9GY1dwbUhYV3h2NnQ4?=
 =?utf-8?B?a2dtZTl5ajhIZVVCajdIV0N6T2kyZXU1YlhPKzJvZU1RVS9ncFlNVWMxamhF?=
 =?utf-8?B?VHozb2h0QnA5cVhLZndmTHlyYXdMSEdxZmFUWnJLUkxQOFFOeWMrZ2RNUncw?=
 =?utf-8?B?WEYrK082SGZQdWJlMWpyYmxYQWw1QVc3ZU5BY0dqWnV4TWhGc0lQM0drUmpp?=
 =?utf-8?B?bVJnQ3JzcWdWSWZ3WmRoNkdhZk9ha29uM3JzZ0tQN1ZhRjJTbnROWllkSWtG?=
 =?utf-8?B?RUdvS3IwcmpUN3RIV3V1bW9NZ3Z0Y3A1dzJkZkErcTg5VVNLWVI1OFdkV2d1?=
 =?utf-8?B?MUs4M0RrMjhXdEJINnRFZTRRNlJ2OTZlL1NuVVM4MFB0N2dUK21UQkhrNXlz?=
 =?utf-8?B?LzIyOTVMTExNeHVwUTNsblB3ZVhzeXR4WFlXWXlvWExSS0Y5MFFIWHBPakVn?=
 =?utf-8?B?MDdzbVZMeTRUMi9zY2lUY3hzZDBaSTI5TW5reHY3OTlZYWRlUG81aVlUdjVV?=
 =?utf-8?Q?E8/OKwJ3Do1uKbFCotEbWo8VG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e382cbbb-bef9-4559-58fc-08db4beedffe
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:55:53.6708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSQc75YlcKMNRqWx8MZ1zJ9JS8jp1LH/vunCpmGTJMgDcmie6m0JU3L509gt7IByUozI12ZKrmFwlWS1ZQmqpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9658

Before adding a new vCPU operation to register the secondary time area
by guest-physical address, add code to actually keep such areas up-to-
date.

Note that pages aren't marked dirty when written to (matching the
handling of space mapped by map_vcpu_info()), on the basis that the
registrations are lost anyway across migration (or would need re-
populating at the target for transparent migration). Plus the contents
of the areas in question have to be deemed volatile in the first place
(so saving a "most recent" value is pretty meaningless even for e.g.
snapshotting).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1571,12 +1571,34 @@ static void __update_vcpu_system_time(st
         v->arch.pv.pending_system_time = _u;
 }
 
+static void write_time_guest_area(struct vcpu_time_info *map,
+                                  const struct vcpu_time_info *src)
+{
+    /* 1. Update userspace version. */
+    write_atomic(&map->version, src->version);
+    smp_wmb();
+
+    /* 2. Update all other userspace fields. */
+    *map = *src;
+
+    /* 3. Update userspace version again. */
+    smp_wmb();
+    write_atomic(&map->version, version_update_end(src->version));
+}
+
 bool update_secondary_system_time(struct vcpu *v,
                                   struct vcpu_time_info *u)
 {
     XEN_GUEST_HANDLE(vcpu_time_info_t) user_u = v->arch.time_info_guest;
+    struct vcpu_time_info *map = v->arch.time_guest_area.map;
     struct guest_memory_policy policy = { .nested_guest_mode = false };
 
+    if ( map )
+    {
+        write_time_guest_area(map, u);
+        return true;
+    }
+
     if ( guest_handle_is_null(user_u) )
         return true;
 


