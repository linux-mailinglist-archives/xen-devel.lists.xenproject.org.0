Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BA494FC8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259076.446838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY3S-0007cL-7r; Thu, 20 Jan 2022 14:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259076.446838; Thu, 20 Jan 2022 14:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY3S-0007aN-3i; Thu, 20 Jan 2022 14:04:46 +0000
Received: by outflank-mailman (input) for mailman id 259076;
 Thu, 20 Jan 2022 14:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAY3R-0007aF-2R
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:04:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaff67e9-79f9-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 15:04:44 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-se1l-fHKO_mJLS3QJopwKA-1; Thu, 20 Jan 2022 15:04:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:04:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:04:41 +0000
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
X-Inumbo-ID: eaff67e9-79f9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642687483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7m7Y7Upa0+r0a+ciUd8pwYsa/PeoFa1xWQvHddn56eY=;
	b=JYpM0vyvV6atxHfdMidOI+3MZDVDKjB+ZLrwzmluhly3GYxUh2GV8aXjpwOMSF07dSomOp
	rDeTQoVEnIEMNgLTWY6v3WRaHBYWejAyQM96H5463KozciQ3HFAvWn1efw1Z8cHIIepDPh
	tkOvAp3lh5MaQ0kkmYsE8Ft+8cn4Puk=
X-MC-Unique: se1l-fHKO_mJLS3QJopwKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crEg0xyhA0n3UCTVJOOtb/U6gw8b2h+l5x83vWhOYpZgChiWCmB5ZD7cc7FiP1mx6VZor7SXiJ+CTvJUAh51/iC95TzQeve+nRCOLgZ8O7fq1qNxQDAMZBzNaa7cNOr158zUwHcS8ZptAQihExT49vqB5wWrflvWZQyRWO1sLXFVavVyPjqF7A42eEwhqzIpl2JDSlyZlOQlPkjbsjxS5gN4kczpeJFr48mW9Uy1juLsOzhnvEujDgsPz8EMPrrKLic7q4SxP2Bvqs5GPS0+U+Xp5sLsbDdsOWpIam72K21x+jjhMZuSMDLgPQXDUCiNUNCkvj4Ux8EbNnaZaz7w9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m7Y7Upa0+r0a+ciUd8pwYsa/PeoFa1xWQvHddn56eY=;
 b=Z6N3unE3L3XNp6WhMcpmSk6D1SUp+YvkTzGA8Hc1ENACnhip0t7ghtDLkVLvqVkl4ITg5WjWJ5hy/WLslN99lBSLrexmaS9IhIi8uQZhrRwpNKzSfZXG/ULfmgVX3cH29ecJd7vhQT2GrUUG6JlQwiESQfskYsJpOWnrdSzcGy42XRuSN3RI3cp0W4oFs/JOeDQ6hCl/z4CFzdbUZr5+/0t922OeGpKDvuHxALmWFpejpf/LUJRspctTWAwKCkyfKb1WT5xXbYxMU4WIU8MZG8dL9uv7+Ki9d7QisDTXlqXo77P97QoJa2sFJlyJatl9HfiEVqfeFL5LpVWzGk+/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0b3c3f6-2abc-353b-92f9-367fa57af8ef@suse.com>
Date: Thu, 20 Jan 2022 15:04:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH RFC v2 4/5] x86/mwait-idle: enable interrupts before C1 on
 Xeons
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
In-Reply-To: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0070.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aebfd843-7d0c-4d50-89ae-08d9dc1dcd66
X-MS-TrafficTypeDiagnostic: DBBPR04MB7643:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB76434D7E25D0386A90BF98E4B35A9@DBBPR04MB7643.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a2bGEuN0gz7d0hWgyVJh2RxFx5OLVYMDInTyc1MCeOzhiKqO9il63aFEpHt4xgoN1Z9XlUczOAv4uiCW23ZSOJrht0p7dcqcDwtBIpDRfwAjJni82lgH4kIxarGmoKIgToclb1WOr+J8DzvZvg0fYiKaG63thISPn160hVEJloEB7tFD6gNhvSUpCb90a2HvjZWiUUPI4cim0U4KYEc92u2N6EcWEccSZ5ZlFd0SjLtkqm2yrEyEqSYmkSA28ArF1LBiH54tAWNCsHVvLgRsbltgVKNROBMHUi/b8+jboLxbAv9hyV8FZhvfUykQU2qOqJle6d/9ZFzCY7Gw0TsBJAwAtdZBLNpKmoDNGA/flh+88bmdMsJPAGqzfXJ7RZZW40Qr7wzl2LeIu6aBJD8aFscv61DFSXDCvn58FOt7WbB2L0tyVZYk/5heZuzLTljaUEdszGKVigelDw6ZaBds5JwaTA7VDypsXdxyT2YxKo8H50fgVk2q6oOy4KCQ1d9krsvnMIhhsTne7lqd4/gbpV5M9Pa4ApV2Y2dIowFsmj7V3AYFwV0f8MReOmf6KhELqhJxLgvsmU0y3JWsvNPdUpJWEd45ZPYuUtGU4IpP559Lf8MGmvrFxDCK7nCq8EV5In4G8ypdXtWq3M0BBfWiyBFv38fQcoTpCCPErs5I79Y0TF+kreHTn6mbU7kzzwnHXXTcsk00o6VFAdpNKVjbbrB5jptVuOr7c92bQ6C6S0h73B4+0uHRpbz/As+FLegn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(31686004)(36756003)(66476007)(508600001)(8676002)(31696002)(8936002)(38100700002)(6486002)(86362001)(186003)(2616005)(83380400001)(6916009)(66556008)(66946007)(316002)(2906002)(5660300002)(26005)(6512007)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTB2VWxJcEUyVThoRXdsNnFrOWdHMlhRYzB0UDVJbVdEbG5BakVPa0Z2Vk5F?=
 =?utf-8?B?RVQ0TzBHVVRORDNkZkFTZXB0TmF3OVBXV2cyQTdheXlRZmtmYUZnbE9pQU4x?=
 =?utf-8?B?YnkvaExwL29MdU1jOUtNODM4TXJLM2tyL09nSVdMZlFQbnRZOWtieW54Q0tz?=
 =?utf-8?B?RnBHdnRUazZ6K1JCMVN4VkpNbmVLdHJIMDF5ZTZsbGwxRFkwUjFKbEd5QXNv?=
 =?utf-8?B?NkgveUs0T2VoYnpqVll5UW1nVVhYTTdYK3NzR2NsNGNkRnBUUzAxRFJEMXR1?=
 =?utf-8?B?SGsvWU9Kb3cvWmR2R0Z3WkFPRERuV1ZrOUZxNzJ1UzRRZGt1dmxQbEJnVHFF?=
 =?utf-8?B?L2M2V1hiWlVKajNiWjA1Y1lMcEV0R1JxWDlFeTAzNzV5S1pRM3hhWWtkRVhy?=
 =?utf-8?B?Z0VZdlJEeG4vKzlBVmlnSkFyR3l0UXVvT3RFY1NKRXh2RkFPcG4rQzRzUDE4?=
 =?utf-8?B?RE1vZDQ2Z3BhM0Zvd2FRRFZZUkN5bjdKZWg2a3dtRyt2UVZ5THRKa0VFWlFn?=
 =?utf-8?B?YUI3a3NJMDZyNjhJbEpVQzFkNE9vUUhRS1RXTGlDVWl5b1AyRUVGMWQ4N3VG?=
 =?utf-8?B?cUJwU0RQVlhWNEZSWUp3OHpxVzlYeStuRTVjbFpCSzFQbk1sWnkxNjd5OFYy?=
 =?utf-8?B?VFdJdzlDNFhtV3pIblVhUTVvVGF3ai9ER1BxUXQ5dFc1Sm1Ba3dNUVQ4dXhH?=
 =?utf-8?B?YmI4OWZBSThQbTJFZEYvZTdXZUQydVlJV2VWcGhNbnBuQlhyWWR2NHhMWHFq?=
 =?utf-8?B?cUNIWmh4ZkxmTzBtV0tyL0dqRVY0bHd5c0xqekdGdHZMMUl4YWFHQVNjRUxj?=
 =?utf-8?B?emZZaEV3am5xY0NXUkp6cFNCc0NDVjc3ekpJZDVVU2U3elQ4eWV3cFpkNnA0?=
 =?utf-8?B?SlJqNEhqREN0dXB2a1hCRHdvYk9lWjV3Y0I5RkpUbmtWb1h3WUtPNTAvN2F1?=
 =?utf-8?B?QSt6Z0tqUmVQdVBjVlpNclVzU3pEU1ptaWl0TWdkWnltS3BDN1BNZ3FSbVBV?=
 =?utf-8?B?NmtiaDV3SEFSbWgraktrcmxIbDF2UEpNd1hDWmZiSTJ4a3ZHSHFqRk5rcVNh?=
 =?utf-8?B?cUcyNU9SVmJOcGVNL3FpWTNOMm9oMytITWs5TFJZb2Z4dkZtZzdrMUhTVmZw?=
 =?utf-8?B?Vk5mNFF2MjZGb1B0bHI2ZXFPd0FkM1FLOU1xc25iaVBIeTRhNHp1NkNxZ0xy?=
 =?utf-8?B?WUd6OGI4cDdSbUJIcno1Ylg5T2JtTUdkdU8vS3k2ZjV1N0dlZThKdkhXbStw?=
 =?utf-8?B?NG1MVGxUckE2bDhJcmtWQlFGZkMvT0RyL2JoL1FPcFVTV0JlOXRraUNEV0N0?=
 =?utf-8?B?aThsem9ETVhxZFMvM2VBWmVCNnFoOXFQdFNKTmFJbUFXL00xU1hDN0QzVkc5?=
 =?utf-8?B?R1JaMzFJNEZVcFEvRmgzL0J4M1dubmJneVhxczRsU0RHTDVhdVB3aFdrWVN0?=
 =?utf-8?B?Y0hxSlpER3pkMXRnTm5KTXA4R0FLTklZZm9rVnpSajcyODV4ejFDa0lHeXJy?=
 =?utf-8?B?YjB3MFVOM2tmMGRTRW9Ed0phSE9KVGFRQVRPcjlGNHB5elVrakhEVHJtS3B1?=
 =?utf-8?B?OXNrQ0laSTNKREZUNnp0Ri9KYlR5dU5Vdm1yVDRHNFh6VVFiakZscFZ5R0RY?=
 =?utf-8?B?WnVKcjcyNnVvUEllK2VOckprRHVwVlNGWGtqMnlMcDFOVVZvZHVKTTlUK0sw?=
 =?utf-8?B?OHRmbG14UlI1bFpvV1k2eVJobDNZQkNIVjROSFNzM0NnRk5ock43eElpNDNR?=
 =?utf-8?B?cUZnUHpBV0ZQZnpraXFualc5dXBCclhpQ2pCVng2RUhIUUNUUVR0ZTI1LzJT?=
 =?utf-8?B?aVduZjZ3aDJkRU1FTFBZajQzTjRUaVVqSmMwbWUxR1Ezb0hvYW84NVdUaTd0?=
 =?utf-8?B?c0p0Umw0djE3VEVKcEFlbUFNak4vay9ydWhMUXZoN0JVdTR0K001bnloNVg4?=
 =?utf-8?B?bndjelNEZXJTU09WOWF1cTRxRk15b1Q4UWtNeEpOeVQyYUU1MWw2WFI3Nnlu?=
 =?utf-8?B?VEp3Q3NTWEVxdzZMZEp3YmY1dlMvamZYb1JZZ2NzNkJuVjZaOFNZazhiQ2wr?=
 =?utf-8?B?aTByc01VWTVuWHZKZ1hMSHVDeVh6U1pNOVlSZ3c0ZHBrSjM1V2NMd09YZ0Rm?=
 =?utf-8?B?Qy84NXViSkhtZnRvam5yejZMclo3UVRCT29sSXVNbVN1N1IxbStQVWNieU04?=
 =?utf-8?Q?HmXTLp2MIXqY9/orIou7UDU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aebfd843-7d0c-4d50-89ae-08d9dc1dcd66
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:04:40.9616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFR3eqvSV4ZDIu1hmy/w42SVMrFV9SrQnH0g+cbhCfqVcDwDufYChi+0c751g58SEG2fNzfV2ztYDmDy7HDGqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Enable local interrupts before requesting C1 on the last two generations
of Intel Xeon platforms: Sky Lake, Cascade Lake, Cooper Lake, Ice Lake.
This decreases average C1 interrupt latency by about 5-10%, as measured
with the 'wult' tool.

The '->enter()' function of the driver enters C-states with local
interrupts disabled by executing the 'monitor' and 'mwait' pair of
instructions. If an interrupt happens, the CPU exits the C-state and
continues executing instructions after 'mwait'. It does not jump to
the interrupt handler, because local interrupts are disabled. The
cpuidle subsystem enables interrupts a bit later, after doing some
housekeeping.

With this patch, we enable local interrupts before requesting C1. In
this case, if the CPU wakes up because of an interrupt, it will jump
to the interrupt handler right away. The cpuidle housekeeping will be
done after the pending interrupt(s) are handled.

Enabling interrupts before entering a C-state has measurable impact
for faster C-states, like C1. Deeper, but slower C-states like C6 do
not really benefit from this sort of change, because their latency is
a lot higher comparing to the delay added by cpuidle housekeeping.

This change was also tested with cyclictest and dbench. In case of Ice
Lake, the average cyclictest latency decreased by 5.1%, and the average
'dbench' throughput increased by about 0.8%. Both tests were run for 4
hours with only C1 enabled (all other idle states, including 'POLL',
were disabled). CPU frequency was pinned to HFM, and uncore frequency
was pinned to the maximum value. The other platforms had similar
single-digit percentage improvements.

It is worth noting that this patch affects 'cpuidle' statistics a tiny
bit.  Before this patch, C1 residency did not include the interrupt
handling time, but with this patch, it will include it. This is similar
to what happens in case of the 'POLL' state, which also runs with
interrupts enabled.

Suggested-by: Len Brown <len.brown@intel.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
[Linux commit: c227233ad64c77e57db738ab0e46439db71822a3]

We don't have a pointer into cpuidle_state_table[] readily available.
To compensate, make use of the new flag only appearing for C1 and hence
only in the first table entry.

Unlike Linux we want to disable IRQs again after MWAITing, as
subsequently invoked functions assume so.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: I'm not entirely certain that we want to take this, i.e. whether
     we're as much worried about interrupt latency.
RFC: I was going back and forth between putting the local_irq_enable()
     ahead of or after cpu_is_haltable().
---
v2: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -108,6 +108,11 @@ static const struct cpuidle_state {
 
 #define CPUIDLE_FLAG_DISABLED		0x1
 /*
+ * Enable interrupts before entering the C-state. On some platforms and for
+ * some C-states, this may measurably decrease interrupt latency.
+ */
+#define CPUIDLE_FLAG_IRQ_ENABLE		0x8000
+/*
  * Set this flag for states where the HW flushes the TLB for us
  * and so we don't need cross-calls to keep it consistent.
  * If this flag is set, SW flushes the TLB, so even if the
@@ -539,7 +544,7 @@ static struct cpuidle_state __read_mostl
 static struct cpuidle_state __read_mostly skx_cstates[] = {
 	{
 		.name = "C1",
-		.flags = MWAIT2flg(0x00),
+		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
 		.exit_latency = 2,
 		.target_residency = 2,
 	},
@@ -561,7 +566,7 @@ static struct cpuidle_state __read_mostl
 static const struct cpuidle_state icx_cstates[] = {
        {
                .name = "C1",
-               .flags = MWAIT2flg(0x00),
+               .flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
                .exit_latency = 1,
                .target_residency = 1,
        },
@@ -776,6 +781,7 @@ static void mwait_idle(void)
 	unsigned int next_state;
 	u64 before, after;
 	u32 exp = 0, pred = 0, irq_traced[4] = { 0 };
+	bool irq_enable_early = false;
 
 	if (max_cstate > 0 && power &&
 	    (next_state = cpuidle_current_governor->select(power)) > 0) {
@@ -806,6 +812,12 @@ static void mwait_idle(void)
 		return;
 	}
 
+	if (cx->idx == 1 && cx->type == ACPI_STATE_C1 &&
+	    (cpuidle_state_table[0].flags & CPUIDLE_FLAG_IRQ_ENABLE)) {
+		ASSERT(cx->address == flg2MWAIT(cpuidle_state_table[0].flags));
+		irq_enable_early = true;
+	}
+
 	cpufreq_dbs_timer_suspend();
 
 	rcu_idle_enter(cpu);
@@ -842,9 +854,15 @@ static void mwait_idle(void)
 
 	update_last_cx_stat(power, cx, before);
 
-	if (cpu_is_haltable(cpu))
+	if (cpu_is_haltable(cpu)) {
+		if (irq_enable_early)
+			local_irq_enable();
+
 		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
 
+		local_irq_disable();
+	}
+
 	after = alternative_call(cpuidle_get_tick);
 
 	cstate_restore_tsc();


