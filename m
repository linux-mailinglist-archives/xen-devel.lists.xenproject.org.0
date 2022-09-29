Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DC5EF2B5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 11:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413564.657293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqCo-0005Wa-9U; Thu, 29 Sep 2022 09:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413564.657293; Thu, 29 Sep 2022 09:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqCo-0005UR-6I; Thu, 29 Sep 2022 09:51:46 +0000
Received: by outflank-mailman (input) for mailman id 413564;
 Thu, 29 Sep 2022 09:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqCm-00052L-Ep
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 09:51:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e9cbeeb-3fdc-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 11:51:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7209.eurprd04.prod.outlook.com (2603:10a6:102:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 09:51:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:51:42 +0000
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
X-Inumbo-ID: 4e9cbeeb-3fdc-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Um44iDY80XmzcMlLtS6N8A0ynJTcsxm9wFfNc4LWo3RWm+/INPezGtBGjM7F45kpxJw4IvRNHW7I5XDhx5F+/vsHV33RfEVe38hbGRKZUUxSy20QirwOeYwbM2Dyg6hkI7RyXj7FKWH+tp56rZUWZ4wTzRlXlrz+Y/6peN5o0FExo3S80Fh368MSHqno2z9PeMO8zZz+idiNmMjEReQ5E9wD7cLphLvg4Um9R00bmzqQF+gx23GVxvgg/nvTyaOMBuUANMwK1spiO8pTg+2jZhQ/UE744wE+p2b8Mb3hd5O+eQW9FuntZo+2VMhjQOA9FVv9F5+eJdn9YcQzIgG//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZUSWYGYKpp/n4o39lEQC3Rdxp/5hH97CjYq0VBAQYI=;
 b=ZOEXnSHTYYlljHNAOFp1HZw3fC+tb1hwHh8uqZ2P6IBZIlF7nREOJp1i50PDN/dqUH2YsU+HA/PPcguk0dnfIZw1pZPcoYUuHVloWzyWD8dZ6fruXT/5MFzb8LavI/rCRvCDOqnGsm5rxW0ix8FKipaPFePtU2Xwd1rNdiQgRDS/rp4dGYL0pQYzjSNYh8ApDn7llrjvCfIWsoQbGPYP5KP85aYir/RQbsdNr0kvNmgEO9pIQVjvgxGgF1kTxuLckOduJACnjmDwqeB4+8SZlp+GR8TWSk+0wf3tybxCdmTfFu8Ss1O6bIUA0ZGSfpbidSpQIPUAFIRMBKpeOotznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZUSWYGYKpp/n4o39lEQC3Rdxp/5hH97CjYq0VBAQYI=;
 b=vgn2rS2nU+TPh441gnjZXXHd5YfP0wW6hMTPWaXA9krIkWu8tbrQx/TFn7i/nU3DP5IYOuhOILDsgV/oslCzP4qrgT92oVnZmHEDjFpAVhzM04zqYLoPPAjcELYT0ratAn9h3BjEEsvrqxpyjfZw64Sz1tR0AAs6vSblZTXcAMGNTs78SXcodCSQtzE8bIVvX4uaRmH7OwwMT3fGVP5kihbHGDoba8vXiyZ1mTowosHpsVN9w+rivlSqng/B0HFPXvZppAuTaKNqzt+COvtc5wsD7BQlFM+qcRCBArC7XSBwazAJEMkoga7/rmmuN0TXwy5kxnuIHWpv4/jUfM4Rmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5afa774-d6a8-bf18-7412-25fa277d5648@suse.com>
Date: Thu, 29 Sep 2022 11:51:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [PATCH 2/2][4.17?] x86: wire up VCPUOP_register_vcpu_time_memory_area
 for 32-bit guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
In-Reply-To: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0266.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa5ab9c-e278-4e64-acb8-08daa2003620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qCfAdH/giAUrQedouOK+Hlbi6dndLFkoVGz9lslt9VOMNh2FghCwFhiI5secQYP+0edhdcbtLplZ7l0BQDEBxWt3UjHcMMnrXdLvu0wN+1NolagJWFBEHmqI3RkvpOIsSl+DaKuDTgJCSpxWDkLVAwRO7izVOCvrYl402lc7s5ejPK2NhJMjgvmKnggmRK5jl7dIbfcXKyN0lSDoHrsllVQtKn/6phMjYzPQpLmw7cZrN2EgUgXdrYtsTfGzEJMJMonJof8YjedOWb1vj0uTfk87QQ4VY84Oq0M/zEzzcAyXpQ2iaDHusHC1Edf6E/J/zs3/X8GqpE09UtjNCxfLeITTSaEbQI7Ob6te5R21gASqhRTX9WgnKT0VUY7HrIj92O7um9Rix3eSUZ33ujUTIjwzoSXnsLfZpPY7BGYhK5Un0bWoUD8qrhEDBU1xdIhCfxXTMYc1773/9Tor33UAYaqRydG5gE5FVG0qpYoXcJUzG35Y4KZkyjTtE30qMYssMa9L3ib5sLZLwibEUYMdh8fcXsl8RpVWQzh0YFaS6rUSndLIJlSofTjcG461S/LAOGJAal410kaS97tBkCw91SmGymI26bKKhUoV0qPSWwYR06WdDemXb8c1F0VXIVy6lHFeTQhev/DXJ0zcDIWSZr/J+tD1squLqvomuCcBFaB1malLGv3qIW77QljrfpGuLT8UdI1WF4zkeTB8hHVSOshAUfvDv/DfGQ8ZJZBQkciz2ghs+wi7LjNcfj0hg+R7a6BMnigZ+c28v4R42eXjZz2aRJhmucIVI3VeWq1JU0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199015)(31686004)(6486002)(316002)(54906003)(6916009)(66899015)(478600001)(83380400001)(31696002)(36756003)(2616005)(8936002)(66946007)(4326008)(8676002)(66556008)(66476007)(38100700002)(6506007)(186003)(2906002)(26005)(6512007)(41300700001)(5660300002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEJXd1hJdmJTTXF2R1lXZDMyT2VZUFlaY2I3ME13U0l5cjk5SjhIay9TV0k0?=
 =?utf-8?B?WkhqMjIyQzhYZ0QrVWhudVBneXhaQ3k5T2FvSFBpeWpSQmdRZHdjVzRDMUZm?=
 =?utf-8?B?TTJVZFRuM01EdW4yR1AwNU9Pczk0czJEWG1VVzlJTS93V3Z4WHFZN3dVVWV3?=
 =?utf-8?B?SHRBZExPTlFwZ1pVRmRFaWE0U2MrdSttU0xvVmg3aUFtR01lT3hKbForNDJ0?=
 =?utf-8?B?R09DL3JSR0tOVzlwb1RMa2YzQnlneEpjL3V3djFIVUxsUTF1bFpKZ1FaWkho?=
 =?utf-8?B?bURURTNZVmlCSU52VVFyY3RRa0ZVNWhoVStJdmYxUDRFV2RJOHJ6bmNReDE4?=
 =?utf-8?B?d1dTT1k2b00yaDlsLzhmb0xQdTJENGZhTWlaT0xIanE1c1hzbkVxRlBaQ3pq?=
 =?utf-8?B?QVBNQjg0b29NNDArTEFKQkhVcUk3MkU4TWNKOVdnVE9CYzY5YUtKdTB2dksx?=
 =?utf-8?B?ME9RZHBRMmxtK2hGUFA5N0cxZzJNUGNCMTFVdklRYWlpalFnbFR4R3pmZXhy?=
 =?utf-8?B?Nk5pQ2EyQmVKb29POC8vMFVoS3ZrWnh6MTZQSE5VZlo1OFBSblNTWk9mR0RX?=
 =?utf-8?B?WVJEZEdOVjZxR1FSTVNuMDhZaDFVREtGV2l0dnhML0dHYVpQWGpLL1ovbTZL?=
 =?utf-8?B?WW1QaS8xWWxFc3hkR3V0dTAvUHk0Y0QyTXdDWlhOc1Jyd3pUZmRqZGY4blUr?=
 =?utf-8?B?d0lxYUdWR1RYeDFWQnpKZU9OK1RYclczVDIwbjJSK3ptZXFLa2xzU2owMDB1?=
 =?utf-8?B?Wmd4TDNFQVYybVUyZGNjN1MxbFVGcjBONlVKL0xUY3ZzL1lzNnViZ2U5NVZS?=
 =?utf-8?B?WXpxeWZFZEhFTjRURFNGU3Eyc0R1NmRyMHh5eDFER0k4YWpMM3N2SGZOM2Nz?=
 =?utf-8?B?R0EwU0NIYWwzeWJPYUxRTE1HWENnM0J5eTkxN1NKSGpEOWF2cHdNTXFvQm1Z?=
 =?utf-8?B?T29ER3puQ1JuTnAvL01EUG1haXF0M1NqeU1aay8rZUFrbnYwekExbzVoVlB6?=
 =?utf-8?B?OFhnVmtEcFprVkJiQUtsQzhMOFRnWWhrWVdCdUJldzZqdmV4T3FxSDUxdVZ5?=
 =?utf-8?B?aHRMYVpZY2k2T0JPSkRMV0N0WmRrL2RPTmwweXUvaGREb3RkT0NseGNqdnQ3?=
 =?utf-8?B?RHJmMU4wWWZ4NS85YmNObDh6T05XSitkU0x4MEV5UHpGd21ZaGJESkllUHFz?=
 =?utf-8?B?Q09QODdnaXg2a2JIdDkwb1ArYzJzV01IUkJjeUE4amtGSXd5NEdpNnlEdjBW?=
 =?utf-8?B?dEkzT0J0Q01YUFlPRXUxNGNwNlRrdksrRlA0Mm1aNHlmMnA2bEE0bGR0Skow?=
 =?utf-8?B?d2VNTU9jZVV5S0EvdngxVkZKQWVRNWV3MFAxaUNlblI2RjVaYlMvMFI5SHpD?=
 =?utf-8?B?U0EvVVdPUnViTm5kT25SaWFiN200ZjVNRG1DcUU5RDBXdkQ0RGVrRXF1VU9C?=
 =?utf-8?B?UHNFTi9hTkpDS1R5aDNLaGRYQWxmdExma3ovS2w2VjBXekNFTktzc3U4T1VD?=
 =?utf-8?B?MFpOanppUzNxQ0ZaVjB1SHdZeU5TaUxBWWpCdm1jVldnaHBZY01FaE50eDFS?=
 =?utf-8?B?TnV5L3NxZEkvSEVjaUU1bEZhSU1EbWhTS0NSY3o5WGU4aXNPYVBSNEplQ1Np?=
 =?utf-8?B?cFNwN1VvdmNzdDVFSmtHV0prZzdPOFZsaFpDdjFwYUZrajVlSmp2TVRmRS91?=
 =?utf-8?B?TWp2N2Rra09pQVdURkpQN2ZXek5VcnZCR25CbUNvbFkxTzJvZVJMSThZTUZw?=
 =?utf-8?B?aXdIdDBZVHhVK1dteW03emR1OWQwZ29MaTBQYmpRcHdBdlBpQzV3SFVqb2x6?=
 =?utf-8?B?MWZ1Q0xXaDFPUDlWYU9WVU9ySmNLd091Z2YrTFNteDMzVHVBSjR0bU8zS3JG?=
 =?utf-8?B?MUcwWEdyT2IxWVBFMllGYWNoakZod3dHSXZLMmM2MTdvMGJBM29CU0VVTCtt?=
 =?utf-8?B?M253SXBiSzJGSkJFYmxxTUxoSzIwcS9qVVNnWVlSTU1Fd3MvSG9xSFh5TkJY?=
 =?utf-8?B?SXkxTURHMnVFUGNCZlhnQzFsRVprUGlRV1RtdUZ1WlRPaVpVbU1LWUhveHgv?=
 =?utf-8?B?czdvQ2ZROWhTS3pBcUZyKzBpMFpRbGRzdU1CeWZZYjI3VUlwQ2YwV2c5b0hv?=
 =?utf-8?Q?pqfBzJIcR+11fx17bVOBtFnfz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa5ab9c-e278-4e64-acb8-08daa2003620
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:51:41.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTFEhn9OmmkYkr65a06lMXQXXN9GlMobRnkGPwFbMmcjmxWBboH6jU0yPN13yOSYgGWneLD0UlHkmspAWH2JlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7209

Forever sinced its introduction VCPUOP_register_vcpu_time_memory_area
was available only to native domains. Linux, for example, would attempt
to use it irrespective of guest bitness (including in its so called
PVHVM mode) as long as it finds XEN_PVCLOCK_TSC_STABLE_BIT set (which we
set only for clocksource=tsc, which in turn needs engaging via command
line option).

Fixes: a5d39947cb89 ("Allow guests to register secondary vcpu_time_info")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is it actually correct for us to do cross-vCPU updates of the area here
(and also in the native counterpart as well as for runstate area
updates)? The virtual address may be valid for the given vCPU only, but
may be mapped to something else on the current vCPU (yet we only deal
with it not being mapped at all). Note how HVM code already calls
update_vcpu_system_time() only when v == current.

I'm surprised by Linux not using the secondary area in a broader
fashion. But I'm also surprised that they would only ever register an
area for vCPU 0.

--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -58,6 +58,26 @@ compat_vcpu_op(int cmd, unsigned int vcp
         break;
     }
 
+    case VCPUOP_register_vcpu_time_memory_area:
+    {
+        struct compat_vcpu_register_time_memory_area area = { .addr.p = 0 };
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.h, arg, 1) )
+            break;
+
+        if ( area.addr.h.c != area.addr.p ||
+             !compat_handle_okay(area.addr.h, 1) )
+            break;
+
+        rc = 0;
+        guest_from_compat_handle(v->arch.time_info_guest, area.addr.h);
+
+        force_update_vcpu_system_time(v);
+
+        break;
+    }
+
     case VCPUOP_send_nmi:
     case VCPUOP_get_physid:
         rc = do_vcpu_op(cmd, vcpuid, arg);


