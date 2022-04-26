Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6F50F99B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313636.531285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI3w-0000QW-RQ; Tue, 26 Apr 2022 10:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313636.531285; Tue, 26 Apr 2022 10:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI3w-0000Nl-Nd; Tue, 26 Apr 2022 10:04:52 +0000
Received: by outflank-mailman (input) for mailman id 313636;
 Tue, 26 Apr 2022 10:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njI3v-0000NY-Mo
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:04:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f45fbac-c548-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:04:50 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-x_HgQ9plPkSOtXWqm449xA-1; Tue, 26 Apr 2022 12:04:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB7358.eurprd04.prod.outlook.com (2603:10a6:800:1a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:04:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:04:47 +0000
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
X-Inumbo-ID: 4f45fbac-c548-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650967490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfvkLKxgZzpvNh45ZE00gKlfe5dLJE1wRsQWU7S2WTw=;
	b=dmBEL6ci7IJVafYDD8mRxnxqUBaa7QccA2bOj4TtcMcqnOP5rj11yVDfRW+pngA0FuO3Mi
	4GRdrAEO0Qn9N15M4aGHaoXmHJ0bNrQ1dI/as5FVkju1kBXA0wbogre+wCZ4gh1ZVNkFI9
	aaCvXyz1BXdGWke+Sa+tzb8lFqr1EFE=
X-MC-Unique: x_HgQ9plPkSOtXWqm449xA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAz+FdWzrIJ+uQarPrKlgDZRWGEO24nSTJhhJgbW39Y/91X7auGdApdW4WBvsgJi3v70L+bJdi8VUnNHxKQNcEiTU7XgmqT7y8mfRuudtzDUQyTMxGMA83rAMY0fvBc61aSBXpV0qH0euqAqGcle3A0aW2NIhySlmWRnh4xugEXvFjxgUZ8BnXqoocK8xM/HSUzaC1VXYZsiHotdCxA6CiXXbq2SzH9P7WU+QpP/bOr1xaBGbfYqElPVkrHFEwlRYST9QtfCGHi79fHm+jIE+nLq2sCUOQ5qIwzM+BA3Oq58tus32XBpmEEL3vWiih74OBEslIV9URtuSNbDy9qKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfvkLKxgZzpvNh45ZE00gKlfe5dLJE1wRsQWU7S2WTw=;
 b=J0rwVSM9JCqGuJm04XFmAE8avLQbMgghsc47M2yGUpI15jCV1KPZQGUcBC40XE2KRrPa7D3ci67UGk+J90M4pf+9iBjX8NuXyaA7+OYq8rQAQxWU1T4QFfllLuw5AofQlkHDd8zbPywIhu3q0cRVKFoTMGQ+h3FRgE7Eyyb2ckxoZgOfc6ga/3YLw+rYC92ItXnoFwwmYRBghjmGFw3E0OIIJgP7mOjntvtWgjIErDuunj3/Xsm40BZnAgTX5S12U0Xl8XAGMCKMx/eLFAKvkcXDc0K9nVTnoUmyGEgb4LKDm2FwWX5aDp0JtLHgSM/u7XzVijJNBsY+hZuDw4lhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <974cdc87-cae1-2c5a-4c3a-98c5d98a5425@suse.com>
Date: Tue, 26 Apr 2022 12:04:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH 1/4] x86/mwait-idle: switch to asm/intel-family.h naming
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
In-Reply-To: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28725fb3-0321-465d-df02-08da276c31ae
X-MS-TrafficTypeDiagnostic: VE1PR04MB7358:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7358BBFA6BF4A7B50F3AB59AB3FB9@VE1PR04MB7358.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UWde5jewysNqQP9v9Q008uj2g2kEB78DSO7jKcQmU3teBs/zPCVHBJcjwstdzPh+ECiWR9P/CYJ/yt+MlFwE3sks0+zj/bO7wZpOxUl2JtZOvwyi05Jsr0RA+tb4SSmfHNfiFRT1YhTdMZhHDpJ7Cfy8xqlPlvvokZv1gdsc9/rR20UnXzsEtlIsa+7tOZzRVZu31JnhzFXoCJbblDEM+SB+iIHeZofRu3DOnfkhFzu64eocjCfsFj4znkf5Dn0NePnT9tVY0Cs+KzjbcgeeB3ose5UzO6+rnbdJK3zmyzS7CWIyQeHhtrYcgM25Ub5WGqmyEnxzZsKQOsk8rZRqml07h8rytQuqr1u7ggvBS8zm2Xjmtch4lUC/GbcT9v9ikO5dU+W4IIyyQ+5okmeNxpiDj2vuVMhv3PxGP65DcLyJbK4TAOeGLfVNWYtOokTczv+471rRG6I59zG3pidnNEWjNuqaZhDFYF1weRAgx1TzBaDnxGG2PKboP5CDhiApOHV7OYk8KUsNvn6y2VRWUBZqBDWWdrkheULbMA8Z18sCezG4TdvU9UfztPHbA+PsuTxMu50u4Tb2NTiWNbb63D4sbiEKOeORvqOe1DY3/iQftF8Edb5j9CwziDX/jrGNLyj4hcNGzFfswKS9nrYOvWw25wEO/zkQT2ZD3Cdahl0W83VhY46oQR44O16zWb/OCS7VrjpIyOI/Tw2gZbav4PkuR2mAH3fzx0hOtIVMEgzXEFetywFS7CG/j/eWEKiT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2616005)(8676002)(5660300002)(186003)(2906002)(31686004)(83380400001)(316002)(54906003)(6916009)(6506007)(66946007)(66556008)(66476007)(26005)(6512007)(8936002)(6486002)(31696002)(38100700002)(508600001)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlladmJJZEZJQlVSTDVSVlBmeVlLL2pTUFZSaC8wb0xxb0VJVjNuNU9ycVF0?=
 =?utf-8?B?YzcwTStiWVNXZDZqYzhjeFRMWTBYcGIydzVtVHpWOUlSSGRjcTY0VVN5TkJw?=
 =?utf-8?B?NnRrTTFCUTBKYlJ3TXZUdDZxMFp0czY1KzdrMHBYUm9zaHFQYVRpa3BKM0RL?=
 =?utf-8?B?UFdFNHBkbEpaaTUrV2g0QUVlM2Rad2xualdxanc2K1hhdmhLN3R0WEZiT0JC?=
 =?utf-8?B?WGNITkYydFNkOXBHVGIrUWxybDdYTHRzR3k4Q1ZkOElVL29PSk1kKzlKRDVQ?=
 =?utf-8?B?KzRHcmNkRG1OdU9LTUx1U2tXa0pLNkZxUnV0cHFTUDZFQkZkWmRJdTFjR2tp?=
 =?utf-8?B?WWNGdHkvZ2t0V0NuWm5EcDJNb2VZbWtjSGZpVGRwNnlrSEdtUTFTSW9pODVN?=
 =?utf-8?B?K0FGQzUyMVJhMXNVRXY2Z1B4VkJSQWh4RU5qM0s3ejNhaXBob2N5ejgvQ2RF?=
 =?utf-8?B?NTJUS00vN3ZPa1JmSmkxdG52aGNWbnhYQmhsbEZxUHh5ZjRpRDY5QWhpendC?=
 =?utf-8?B?azFyS1l2UEdFc0RWQy9YQXZ0b05kc0xNVWllMWZ4dE9NOUpuWTErWG0zVmJh?=
 =?utf-8?B?dDQrekthTXhmTkUyWTFXWEtyeHRLUStnRXM4eTdtUVZSZWpzTlcyeGY3UjY1?=
 =?utf-8?B?dTRUbmRXN2ZRek1OVVlsMmFIWVFVZTdIZEhDN0pRWFYxWlBLeTVEVENEeE40?=
 =?utf-8?B?MVNBTlRRZkpway9wTitFWElDMlBMWUQwVTdaRDFYYjVJWnY2N3JOK2FFWXpP?=
 =?utf-8?B?QkFJNk1HYXl6UnEvMVUrQTh4c2V1dzhLQTV3a2d0U2RZRld6bURoYm10cjBj?=
 =?utf-8?B?SmV1aDl6RDlhSjNzTjVDdENFc0ZFTlltOFAxYkZCN2p3bnc5TmhoNS9zdys5?=
 =?utf-8?B?bGpuS2ZqZDF3d2xDNE5MVHdOQVQwSDVuZDhHWHY4eVNBcGczS1F4b016bUxl?=
 =?utf-8?B?aW9yTTdRdC9lcVlrRVZBMjlyVkYyZXVXaWtMNHN1a1ZXb2tuSUpTZ3E5eTZD?=
 =?utf-8?B?RFFUWnF3TmZyYlZ3d05NMHR6NHpwSXJBcHRLZTNzYUF0ZTg3WmtSRDVoZURu?=
 =?utf-8?B?UWliSXM1SzVLbitUcVVQS0ZKSHJDWi9lNHNuMjZJNUJmd2RBNkVLeWpYcG92?=
 =?utf-8?B?djRPSGtwRG1rbDBpeEFwSmFqdGFzeXR1ay96MXQ5R3E2VFJGMy90dnYwRjNS?=
 =?utf-8?B?cjRTU0YzNkVyVFE1QXIvVkJzV3lpK05oVURtdU9sazFpcVhoSzcvczcxR2ZV?=
 =?utf-8?B?UEFsMkRTVE5Jby9pL3hhUTZRYkhFRTE4K25vUW1JZHFuNHh5dkVYSUZYaXNI?=
 =?utf-8?B?ZFA3ckZKNVJFNGc1TFJXQmNJYjF2b21zSEQ4Y3grS0pnL3hYbXArUmx3anF3?=
 =?utf-8?B?SDNtNVFGMnJSbU5QOTVLSEpUS1FTS3IxL1NpMldsclVCdVUxTHZmM0Rwa2tT?=
 =?utf-8?B?eVhkeHdHek1FQWloajNtd3FzWWhraXlqUlpkeTNwYS9KbnZsQUtCRTE4am5O?=
 =?utf-8?B?YzlORHZUckh4YjdUbFFmUjMxU05jY1dQQ3cvMC93MDdZVzVKMCthcndOQk9L?=
 =?utf-8?B?NWRYT0EzMWNrbkVJcm5HelFmeWtMWUNBTnRsM0pheHZORFB1dzdkMkJmaUZx?=
 =?utf-8?B?VFBxK1B1cjdvOG03djFqSmduZitpUzhBWlpVNEpLOWFicWpnN0FDd0JFLzlR?=
 =?utf-8?B?SnZKM0MraVBEQmJHY1l4NVBrakJ3VmhNWlE2LzhTUUVncHJ1d3dvRE9HVXFY?=
 =?utf-8?B?RGY5aDJyUkpGclBCYUhRWVpPUXUwZERYZ1EvK0tkU01XSVZIWXpYQnVFbW9F?=
 =?utf-8?B?NW0wd1R6cmthUUlESUh4MEpKOEVqUFZlSFZQdExDdjRhSHpPYTVhQ3J3NUdr?=
 =?utf-8?B?dEZkQ3ZXRWkzdkpvV3oreG1lSk5CMHBmQkk4MWhQNnUrYzhjakpRaUJteVds?=
 =?utf-8?B?RXorZzhvMnp6T3hNRnZ6eVVnRXhuZ2RyMHl2eCtZU0grMlFDNVB0NEIraXZM?=
 =?utf-8?B?amJSVllWK1M2T05ET3dsUW91d0tBMURDSnZsQUt4SzNCNUwwN2FCNTVyUzBK?=
 =?utf-8?B?RGFvcyszazE4eGRsZVU0UXY4ZDJpU3BWb0xKekR5S0ZDKzJvNGVDVnhadkg0?=
 =?utf-8?B?bWlvWUM0L1JEVElTM2xxQjlWRnR0ZUc5VkF6MG1sQTRNbmw1OFJIemdVbmJr?=
 =?utf-8?B?aXFyRGRuUnZyN1JiVEUwNDlqOG1sVERTOWpDc3ErTnVUL0VHdlh5TDM0UXll?=
 =?utf-8?B?K3VlWktiWkplYVR2T0h1WUcwTWpaZ0xldUllakU2QWd1ajVidUU3U2NjQWkw?=
 =?utf-8?B?d2NPc05VakIwMzlMbTh3cTZSb1doWGI0NVRtdVNtME54Szg5TkVhQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28725fb3-0321-465d-df02-08da276c31ae
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:04:47.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBV+t2uBUdzGowcA+Z6ueNeVzwUYz/5zASu7Fj9AZqOkiLBZZLoeHEMvqgizAM+skfSwoRlHCeF3YaU9J3WdNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7358

This brings us (back) closer to the original Linux source.

While touching mwait_idle_state_table_update() also drop a stray leading
blank.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -61,6 +61,7 @@
 #include <xen/trace.h>
 #include <asm/cpuidle.h>
 #include <asm/hpet.h>
+#include <asm/intel-family.h>
 #include <asm/mwait.h>
 #include <asm/msr.h>
 #include <asm/spec_ctrl.h>
@@ -996,48 +997,49 @@ static const struct idle_cpu idle_cpu_sn
 };
 
 #define ICPU(model, cpu) \
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ALWAYS, &idle_cpu_##cpu}
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ ## model, X86_FEATURE_ALWAYS, \
+	  &idle_cpu_ ## cpu}
 
 static const struct x86_cpu_id intel_idle_ids[] __initconstrel = {
-	ICPU(0x1a, nehalem),
-	ICPU(0x1e, nehalem),
-	ICPU(0x1f, nehalem),
-	ICPU(0x25, nehalem),
-	ICPU(0x2c, nehalem),
-	ICPU(0x2e, nehalem),
-	ICPU(0x2f, nehalem),
-	ICPU(0x1c, atom),
-	ICPU(0x26, lincroft),
-	ICPU(0x2a, snb),
-	ICPU(0x2d, snb),
-	ICPU(0x36, atom),
-	ICPU(0x37, byt),
-	ICPU(0x4a, tangier),
-	ICPU(0x4c, cht),
-	ICPU(0x3a, ivb),
-	ICPU(0x3e, ivt),
-	ICPU(0x3c, hsw),
-	ICPU(0x3f, hsw),
-	ICPU(0x45, hsw),
-	ICPU(0x46, hsw),
-	ICPU(0x4d, avn),
-	ICPU(0x3d, bdw),
-	ICPU(0x47, bdw),
-	ICPU(0x4f, bdw),
-	ICPU(0x56, bdw),
-	ICPU(0x4e, skl),
-	ICPU(0x5e, skl),
-	ICPU(0x8e, skl),
-	ICPU(0x9e, skl),
-	ICPU(0x55, skx),
-	ICPU(0x6a, icx),
-	ICPU(0x6c, icx),
-	ICPU(0x57, knl),
-	ICPU(0x85, knl),
-	ICPU(0x5c, bxt),
-	ICPU(0x7a, bxt),
-	ICPU(0x5f, dnv),
-	ICPU(0x86, snr),
+	ICPU(NEHALEM_EP,		nehalem),
+	ICPU(NEHALEM,			nehalem),
+	ICPU(NEHALEM_G,			nehalem),
+	ICPU(WESTMERE,			nehalem),
+	ICPU(WESTMERE_EP,		nehalem),
+	ICPU(NEHALEM_EX,		nehalem),
+	ICPU(WESTMERE_EX,		nehalem),
+	ICPU(ATOM_BONNELL,		atom),
+	ICPU(ATOM_BONNELL_MID,		lincroft),
+	ICPU(SANDYBRIDGE,		snb),
+	ICPU(SANDYBRIDGE_X,		snb),
+	ICPU(ATOM_SALTWELL,		atom),
+	ICPU(ATOM_SILVERMONT,		byt),
+	ICPU(ATOM_SILVERMONT_MID,	tangier),
+	ICPU(ATOM_AIRMONT,		cht),
+	ICPU(IVYBRIDGE,			ivb),
+	ICPU(IVYBRIDGE_X,		ivt),
+	ICPU(HASWELL,			hsw),
+	ICPU(HASWELL_X,			hsw),
+	ICPU(HASWELL_L,			hsw),
+	ICPU(HASWELL_G,			hsw),
+	ICPU(ATOM_SILVERMONT_D,		avn),
+	ICPU(BROADWELL,			bdw),
+	ICPU(BROADWELL_G,		bdw),
+	ICPU(BROADWELL_X,		bdw),
+	ICPU(BROADWELL_D,		bdw),
+	ICPU(SKYLAKE_L,			skl),
+	ICPU(SKYLAKE,			skl),
+	ICPU(KABYLAKE_L,		skl),
+	ICPU(KABYLAKE,			skl),
+	ICPU(SKYLAKE_X,			skx),
+	ICPU(ICELAKE_X,			icx),
+	ICPU(ICELAKE_D,			icx),
+	ICPU(XEON_PHI_KNL,		knl),
+	ICPU(XEON_PHI_KNM,		knl),
+	ICPU(ATOM_GOLDMONT,		bxt),
+	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
+	ICPU(ATOM_GOLDMONT_D,		dnv),
+	ICPU(ATOM_TREMONT_D,		snr),
 	{}
 };
 
@@ -1208,20 +1210,20 @@ static void __init skx_idle_state_table_
 static void __init mwait_idle_state_table_update(void)
 {
 	switch (boot_cpu_data.x86_model) {
-	case 0x3e: /* IVT */
+	case INTEL_FAM6_IVYBRIDGE_X:
 		ivt_idle_state_table_update();
 		break;
-	case 0x5c: /* BXT */
-	case 0x7a:
+	case INTEL_FAM6_ATOM_GOLDMONT:
+	case INTEL_FAM6_ATOM_GOLDMONT_PLUS:
 		bxt_idle_state_table_update();
 		break;
-	case 0x5e: /* SKL-H */
+	case INTEL_FAM6_SKYLAKE:
 		sklh_idle_state_table_update();
 		break;
-	case 0x55: /* SKL-X */
+	case INTEL_FAM6_SKYLAKE_X:
 		skx_idle_state_table_update();
 		break;
- 	}
+	}
 }
 
 static int __init mwait_idle_probe(void)


