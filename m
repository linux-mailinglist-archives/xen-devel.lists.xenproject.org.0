Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B752A45423E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 09:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226624.391664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFrc-0003xP-Vc; Wed, 17 Nov 2021 08:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226624.391664; Wed, 17 Nov 2021 08:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFrc-0003uT-SG; Wed, 17 Nov 2021 08:00:16 +0000
Received: by outflank-mailman (input) for mailman id 226624;
 Wed, 17 Nov 2021 08:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnFrb-0003td-Dm
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 08:00:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d74844-477c-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 09:00:13 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-Nl4j7U-OMdaGj_HUUWaVvA-1; Wed, 17 Nov 2021 09:00:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 08:00:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 08:00:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Wed, 17 Nov 2021 08:00:09 +0000
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
X-Inumbo-ID: 64d74844-477c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637136013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egGunBE+GPge17GANLEtrNdHh0RZzXAuLg9AKb3sSwg=;
	b=QptCJqQwi4fCZmEVv0Ar7pj3jD9sQVUTx8qonJtmFsvhA0r9lsQZFRWWxrPgafXPff5t7A
	aYHq0Ym5B5cFzSGxqiQTg9hgPsn2eAWFqw4qvMUDj4re4urTOgxvKYXWRunDl2O9AuXBVn
	M9Z/3aUb5dfnwHXPDJ9KAmtwkAvHg0U=
X-MC-Unique: Nl4j7U-OMdaGj_HUUWaVvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7EWNcGoHEQrp4Zsv5JlQFVm3urGlgwEPTtvSnq9aRkUEQPSXsWDiM821tRgJlt9sWg8mii7BdULnCnKKY1h0qGxNs8qMD6GWpfwyeWR0efzaSWWwWPpUKYfsMqpTyaux3v/+F1hhM84VvMJ3h8IS3XF7xhyKWAxKFqf1ajVz0pZOXYIM4DkHsNCf3pm1ZJF8UTvgp0HRQ432gatVYxZq7NjCfPoDkBvC6ruJ+RqDuFVDjWjginp7onth+VzeRh6rZzhvCXqGj8m8h1XOsw/WMy93OnVX9B3MLTdABEzymqyl/TmvaGDSmYSs1GGII1s9Unwm/88hbDJp0ivgNWmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egGunBE+GPge17GANLEtrNdHh0RZzXAuLg9AKb3sSwg=;
 b=lyVqQYynqrDmVIWdVikE/ex1gvfkwiniMP/3H2CE5EkoUSDnECmDV5OuiuDZIevOhzgaDMA8CWqgzoxc4jwhvK3wQDrNsn9K+aZfVLEegydItRLAEO8SDr/OrVb0R9XVW45dGYwROlqkM4B20uQEduoFdNkdIcd41BLv7ZPGnSEdfgFunGyYc8JmgXcop0ixIUlXjzH3s3OnIsIlpC8UZPTLbJ1bDOuYtq+7LGtWv8vEOe6FnxBn7VLDXr6a1eOkut60ADbtisJV+ZX7ESIe7o9swr9vMzOH0Rffyh56/ntu16uIv4biP8vZTP+g2KHmtDcOmY1ayBSSX1S6mSpwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38597a0e-5409-15c0-44e8-7160ca06d160@suse.com>
Date: Wed, 17 Nov 2021 09:00:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH RFC 1/2] x86/alternatives: allow replacement code snippets to
 be merged
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8ef681e6-0274-7b84-494d-29d2c3b3870b@suse.com>
In-Reply-To: <8ef681e6-0274-7b84-494d-29d2c3b3870b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 141ae865-e0f4-4c48-45f1-08d9a9a0468f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64807E1D44EAD5027171C0B2B39A9@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bixORuYiX4cl+buuVbK1pnvZyQuV9xvRwdCNwlE2k1Nt/dGDneuKtYfXPQomgzsWi2MvnRuAMqwvkxaYByuHNrjKE8QF1xcI5WlnvdHIU+93qDciTSPkPS3D0L6rUyzu/65rOI/DL4tn2Ex7ncuVCi4c1qVOk5P3YOIv4PfjcFmlqNbWkA7x2qP9M0MwRbE/WFQRJQ4kCQ0VqJsv2zI89zQAj3s96WDeSyQpxzKv6/PWtODIEv+KOyG730cPjsKhhBGgp1Zm55+lT9cIfXgn/VhH5WDtiKC8AaGv1Io9huPK3f8iHVX6SOUjGTEDgtlxKXuJYfIyGAW01H5qlJUW4556eYqp+cXEwAz37I/gQKiv09e6QKCRPlnqZZTVn+3MAjy1a4JgdK6qzfp6C8Xse1PW7J1AIvGXb6JssZ+MTuTXRthbFU/JpsDkp2/+mCtYbWi5dLsvbnq5wycfKo6J1p3YAxLbx1g5BTgpLLzr8Sd9PcNVswpHpO7nwf5nerEiI/1peL0zmIiljII79o2gqpN/yZAhV1L2i+cl55HC8vxu8+3ishrbAOQp9jSwHsnK9UUNNbhfW9e+2pKEb1HSg6iT8p9Wk/pA4ntsEOU6W5mYDZY85vdhpFowbPSewiWpj/VK3TionkAek4aZ5o+/DmPdGghwTu1QaHTY/016E1rL3xFQgmoJlZlNi+gHGu7SvNua/GNbREetl9cAy7wqtTVsU5Fs3F5wDt5dqu3FEwcjvwEZmF1JHvfkHMvl0Lw+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(86362001)(36756003)(5660300002)(31686004)(2906002)(6486002)(54906003)(6916009)(316002)(16576012)(38100700002)(2616005)(8936002)(508600001)(956004)(66556008)(186003)(66476007)(30864003)(26005)(31696002)(8676002)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVEwelNJL1lNbDFkZ3ZvN1FHTEd3NUVvZzNYZnFCYWtlY0xjY1hjcFUvN1N0?=
 =?utf-8?B?SFA5cHhQTDFWUDRpYVpta1FuTkplMmE2SXBTV2Z4LzBvbkd6N2FreG5uTXRn?=
 =?utf-8?B?aTY5NXh3UEJqaTZ1QTBHZlFZN1N1aDJtU3k2RzdLcVNnZEpwNHJKQWlOMmRu?=
 =?utf-8?B?cTJLUkFRTE0rNzBnbmhIVWhRMGNFeEhva21BaVV3clRldFpESEpLcDFId2pH?=
 =?utf-8?B?aDJ2UU4rbHRRT21ZUXdRSmF3ZTRnZDZ5eGRCU29wOEhnQmVVV1dlNVNndzgz?=
 =?utf-8?B?aVl3LzU2a29JVVUvb2tSTzRFSHZ4c2l1bDJNNzJ6RlpWWkg1UzJCKzVGWFFH?=
 =?utf-8?B?RzI5NU94SldaSnBoRitrb2hDM2FodVh1QUFVVmdGaWIxbHU3NHRpK2QzdXU0?=
 =?utf-8?B?THZQQmJDNlJwOE9jbXhIbDNkSkVtUHB4aGZwTnNIRm8wVk9kRDd1MWt3ajU1?=
 =?utf-8?B?dDBQMTgwTDN6dXV5d0Q0d3RUdEJqREpxTTdWVHZ6LzNrTGxqWGhpYi9qbGJ6?=
 =?utf-8?B?U0lwQm1uWU5ZNlBVVS9ZanJhczY1M0ErTGZHYStmdDNwOGFIc2dmUGVBODV0?=
 =?utf-8?B?bEJjT1kzSy82bUJXRDVadUUvQkoyTnBuR1o4eE9xYWhWVmt0ZXdEWGFOUHkx?=
 =?utf-8?B?LzNnZDdDQ2hRM2RXMEhGaG5uTkNxanpaWklDM1VoTlk2K3p4aDRSNEY4UkJq?=
 =?utf-8?B?dlRRaVk3L0ozckUvamZGcERNY1FLMlc0SkZXTlJDQmhLbHB0N2JlWnhPWndh?=
 =?utf-8?B?aDlRMGNxaktJVlhYaTZHUEg1R09qQ25LVkJwa0phODF5alplNzBKdFF4Szhx?=
 =?utf-8?B?QVF6SUJXUGZxTWdWNTFhdEtRL0FBdUNqaFRrZExIUzAxK08rcnBTOThIUUh3?=
 =?utf-8?B?NnNjWGc0VmYwNHN5OU1NNS9vbVpHcEhocmNaaEEyc0NDV01wOEFmeGhmMFhr?=
 =?utf-8?B?TEZUbXd6Q2luU1lsM1Q3dlFlVlROVWZlZFNtS2h6OTJ4NW12cjFtTEdpWDVa?=
 =?utf-8?B?OXRVeE9SaitqcC9lZ3NRN2x2UVFxRTZtMFhIUmtxY2tuUVMwbUZrV2dialJG?=
 =?utf-8?B?WG1vWnZIZ29zT3FQeWtGMUNmQmRjYWYwSFR2TVdVYUNtcjFaZ1dudlo2YjZL?=
 =?utf-8?B?SWtiaDM0VmtqRHhDTTlHdXlEbjMvQ0ZrVmhuVUI5Qk9WTitNSUZ5ZFhZdWxF?=
 =?utf-8?B?RGw3YWZINUpyeVRXYmVlSUV3dnZ0aVhTZlZrTDY4bVpCQjRiKzE0MUtpTUdM?=
 =?utf-8?B?ZC9iTHBWVXFCK2djbnoxNDFxcW1JT2FRQ0c5RU9DL0ZvMFEyRDRkY0poa3Va?=
 =?utf-8?B?NGVSamJxZG83ZGpUK1FXeFRwRTlPREhYbnUxTEE5eElYS05Rakp5Mm5ZU09s?=
 =?utf-8?B?WEZ0a0xXMS9Oa3oxRlRMQ051M0IvWU4zZjQ3SktYZHJNRkRWcVFvVEhBUXhN?=
 =?utf-8?B?MkthL05ZaHZUVDhlNzhpUU5CVmdhY3RSaUF0L1J2NjdKclJBZXZuL2JPYW9z?=
 =?utf-8?B?SC95UEJ3azN5TS85OERUbGlFNmRsbks1QjJsVWc0Ly9weVM0UU5rZk91UEhJ?=
 =?utf-8?B?b0JDVmpmVXkxZVpOUXpWenlrN29nZjdSbWcrVnFXRzk4RmNJSHNPQUIzV2Z1?=
 =?utf-8?B?NjZ5VUhad1ovNmJHLzVwOUN4VDdpN3ZybWlwUDFLRlRsSThKOGZBSEN5YVFC?=
 =?utf-8?B?Q3BhZDNHQUN6dTNEZ0RRc2NVUUtmczlnUXNydHZEMExUTms1L1JmbHQ1dXFR?=
 =?utf-8?B?YzhBbURkbnkrMndOd2szZGxGN2hTRmNSQUNaam4vMmR0bUJUbTNEcTdZZEkr?=
 =?utf-8?B?SWpUbG1CNDNCR3RBN0RlYWQ3RVo1ZzNWNm11enVkcllZUGFva05BTVo0NnND?=
 =?utf-8?B?alpkNmZSRFo5aDluUm9iUXNEVkFnYU82NmRLd2JCM1dNazRTU0hXWk9zRVln?=
 =?utf-8?B?Wm51ekpYQkpsakNFcVFkUkE0SXNvNTRPWTZQR3NVVi9ZMXhaK29idGpSUjlB?=
 =?utf-8?B?Qmx6RHp0Sys1SjNmdjUzbDRvaVFpNE02U0pUZGJVU283aEtWbk1aS05BU0Nh?=
 =?utf-8?B?UjhZbTY2OFprZXRkeTNTL3NtTmxKbENEK1AwdEhrWHlhczNlK3FqMHRZM3Rt?=
 =?utf-8?B?UmxBWmZ4TmR2UFNNK2RNeVZ1NWlad1Y0bGZ5T2FjQlJDZEZ0NnB0b2wveDRl?=
 =?utf-8?Q?YzDuw5E60Fp+iU04FrRv8f0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141ae865-e0f4-4c48-45f1-08d9a9a0468f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 08:00:09.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxbkQsRBAEp2m/ZAYLrgWWelux+412wxfWHvAH1GyU/cJEybIIkn06bYnXHq8xrpFqvfwcKTDuwtxU+n88F5BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

Prior to b11380f6cd58 ("x86/spec-ctrl: Build with BRANCH_HARDEN lfences
by default") LFENCE was the dominant entry. But even without it there's
still quite a bit of redundancy, much of which can be eliminated by
marking the sections as mergable. This of course also requires splitting
them by "element" size.

Note that due to gas restrictions replacement code containing Jcc or
PC-relative JMP cannot be made subject to merging. Hence the original
assembly macros can't be altered, but replacement ones need to be
introduced (and then used selectively).

Note that CR4_PV32_RESTORE could in principle also benefit from getting
changed, but right now at least GNU ld doesn't merge sections with
relocations. Since this is a per-section decision, not an element based
one, marking the items for merging could thus get in the way of merging
other same-sized entries originating from the same source files.

The sorting in the linker script additions is merely for cosmetic
reasons, easing manual inspection of the resulting binary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Obviously the new assembler macros could be merged with the existing
ones, reducing redundancy. But I didn't want to do so right away, i.e.
before knowing whether the basic approach is deemed viable (and
worthwhile, considering it requires a relatively new gas).

For the same reason there are no C macro variants just yet (which
overall would provide larger savings: in particular all altcalls can
have their replacement insns folded).

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -35,6 +35,11 @@ $(call as-option-add,CFLAGS,CC,\
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
+# Check to see whether the assembler supports insn emission to the absolute
+# section (via the .struct directive), to size them into an absolute symbol.
+$(call as-option-add,CFLAGS,CC,\
+    ".pushsection .text; .struct; lfence; .L0:; .if .L0 != 3; .error; .endif; .popsection",-DHAVE_AS_INSN_SIZE)
+
 CFLAGS += -mno-red-zone -fpic
 
 # Xen doesn't use SSE interally.  If the compiler supports it, also skip the
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -12,7 +12,7 @@
 #include <irq_vectors.h>
 
 ENTRY(entry_int82)
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $HYPERCALL_VECTOR, 4(%rsp)
         SAVE_ALL compat=1 /* DPL1 gate, restricted to 32bit PV guests only. */
@@ -248,7 +248,7 @@ ENTRY(compat_int80_direct_trap)
 compat_create_bounce_frame:
         ASSERT_INTERRUPTS_ENABLED
         mov   %fs,%edi
-        ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         testb $2,UREGS_cs+8(%rsp)
         jz    1f
         /* Push new frame at registered guest-OS stack base. */
@@ -295,7 +295,7 @@ compat_create_bounce_frame:
         movl  TRAPBOUNCE_error_code(%rdx),%eax
 .Lft8:  movl  %eax,%fs:(%rsi)           # ERROR CODE
 1:
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         /* Rewrite our stack frame and return to guest-OS mode. */
         /* IA32 Ref. Vol. 3: TF, VM, RF and NT flags are cleared on trap. */
         andl  $~(X86_EFLAGS_VM|X86_EFLAGS_RF|\
@@ -341,7 +341,7 @@ compat_crash_page_fault_4:
         addl  $4,%esi
 compat_crash_page_fault:
 .Lft14: mov   %edi,%fs
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         movl  %esi,%edi
         call  show_page_walk
         jmp   dom_crash_sync_extable
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -249,7 +249,7 @@ iret_exit_to_guest:
  */
 ENTRY(lstar_enter)
 #ifdef CONFIG_XEN_SHSTK
-        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
+        MERGE_ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
         /* sti could live here when we don't switch page tables below. */
         movq  8(%rsp),%rax /* Restore %rax. */
@@ -286,7 +286,7 @@ ENTRY(lstar_enter)
 /* See lstar_enter for entry register state. */
 ENTRY(cstar_enter)
 #ifdef CONFIG_XEN_SHSTK
-        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
+        MERGE_ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
         /* sti could live here when we don't switch page tables below. */
         CR4_PV32_RESTORE
@@ -324,14 +324,14 @@ ENTRY(cstar_enter)
 
 ENTRY(sysenter_entry)
 #ifdef CONFIG_XEN_SHSTK
-        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
+        MERGE_ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
         /* sti could live here when we don't switch page tables below. */
         pushq $FLAT_USER_SS
         pushq $0
         pushfq
 GLOBAL(sysenter_eflags_saved)
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
         pushq $0
@@ -386,7 +386,7 @@ UNLIKELY_END(sysenter_gpf)
         jmp   .Lbounce_exception
 
 ENTRY(int80_direct_trap)
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $0x80, 4(%rsp)
         SAVE_ALL
@@ -514,7 +514,7 @@ __UNLIKELY_END(create_bounce_frame_bad_s
 
         subq  $7*8,%rsi
         movq  UREGS_ss+8(%rsp),%rax
-        ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         movq  VCPU_domain(%rbx),%rdi
         STORE_GUEST_STACK(rax,6)        # SS
         movq  UREGS_rsp+8(%rsp),%rax
@@ -552,7 +552,7 @@ __UNLIKELY_END(create_bounce_frame_bad_s
         STORE_GUEST_STACK(rax,1)        # R11
         movq  UREGS_rcx+8(%rsp),%rax
         STORE_GUEST_STACK(rax,0)        # RCX
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
 
 #undef STORE_GUEST_STACK
 
@@ -594,11 +594,11 @@ domain_crash_page_fault_2x8:
 domain_crash_page_fault_1x8:
         addq  $8,%rsi
 domain_crash_page_fault_0x8:
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         movq  %rsi,%rdi
         call  show_page_walk
 ENTRY(dom_crash_sync_extable)
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         # Get out of the guest-save area of the stack.
         GET_STACK_END(ax)
         leaq  STACK_CPUINFO_FIELD(guest_cpu_user_regs)(%rax),%rsp
@@ -667,7 +667,7 @@ UNLIKELY_END(exit_cr3)
         iretq
 
 ENTRY(common_interrupt)
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
         GET_STACK_END(14)
@@ -700,7 +700,7 @@ ENTRY(page_fault)
         movl  $TRAP_page_fault,4(%rsp)
 /* No special register assumptions. */
 GLOBAL(handle_exception)
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
         GET_STACK_END(14)
@@ -728,7 +728,7 @@ handle_exception_saved:
         jz    exception_with_ints_disabled
 
 #if defined(CONFIG_PV32)
-        ALTERNATIVE_2 "jmp .Lcr4_pv32_done", \
+        MERGE_ALTERNATIVE_2 "jmp .Lcr4_pv32_done", \
             __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMEP, \
             __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMAP
 
@@ -908,7 +908,7 @@ ENTRY(entry_CP)
 ENTRY(double_fault)
         movl  $TRAP_double_fault,4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
-        ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
         GET_STACK_END(14)
@@ -942,7 +942,7 @@ ENTRY(nmi)
         pushq $0
         movl  $TRAP_nmi,4(%rsp)
 handle_ist_exception:
-        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        MERGE_ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
         GET_STACK_END(14)
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -192,6 +192,8 @@ SECTIONS
         * the address and the length of them to patch the kernel safely.
         */
        *(.altinstr_replacement)
+       *(SORT(.altinstr_replacement.?))
+       *(SORT(.altinstr_replacement.*))
 
 #ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
        . = ALIGN(SMP_CACHE_BYTES);
--- a/xen/include/asm-x86/alternative-asm.h
+++ b/xen/include/asm-x86/alternative-asm.h
@@ -55,6 +55,7 @@
     decl_orig(\oldinstr, repl_len(1) - orig_len)
 
     .pushsection .altinstructions, "a", @progbits
+
     altinstruction_entry .L\@_orig_s, .L\@_repl_s1, \feature, \
         orig_len, repl_len(1), pad_len
 
@@ -102,6 +103,88 @@
     .popsection
 .endm
 
+#ifdef HAVE_AS_INSN_SIZE
+
+.macro SECTION esz
+    .section .altinstr_replacement.\esz, "axM", @progbits, \esz
+.endm
+
+.macro MERGE_ALTERNATIVE oldinstr, newinstr, feature
+    decl_orig(\oldinstr, repl_len(1) - orig_len)
+
+    .pushsection .altinstructions, "a", @progbits
+
+    altinstruction_entry .L\@_orig_s, .L\@_repl_s1, \feature, \
+        orig_len, repl_len(1), pad_len
+
+    .struct
+    \newinstr
+.L\@_repl_l\(1):
+
+    .section .discard, "a", @progbits
+    /*
+     * Assembler-time checks:
+     *   - total_len <= 255
+     *   - \newinstr <= total_len
+     */
+    .byte total_len
+    .byte 0xff + .L\@_repl_l\(1) - total_len
+
+    .altmacro
+    SECTION %.L\@_repl_l\(1)
+    .noaltmacro
+
+    decl_repl(\newinstr, 1)
+
+    .popsection
+.endm
+
+.macro MERGE_ALTERNATIVE_2 oldinstr, newinstr1, feature1, newinstr2, feature2
+    decl_orig(\oldinstr, as_max(repl_len(1), repl_len(2)) - orig_len)
+
+    .pushsection .altinstructions, "a", @progbits
+
+    altinstruction_entry .L\@_orig_s, .L\@_repl_s1, \feature1, \
+        orig_len, repl_len(1), pad_len
+    altinstruction_entry .L\@_orig_s, .L\@_repl_s2, \feature2, \
+        orig_len, repl_len(2), pad_len
+
+    .struct
+    \newinstr1
+.L\@_repl_l\(1):
+
+    .struct
+    \newinstr2
+.L\@_repl_l\(2):
+
+    .section .discard, "a", @progbits
+    /*
+     * Assembler-time checks:
+     *   - total_len <= 255
+     *   - \newinstr* <= total_len
+     */
+    .byte total_len
+    .byte 0xff + .L\@_repl_l\(1) - total_len
+    .byte 0xff + .L\@_repl_l\(2) - total_len
+
+    .altmacro
+    SECTION %.L\@_repl_l\(1)
+    .noaltmacro
+    decl_repl(\newinstr1, 1)
+
+    .altmacro
+    SECTION %.L\@_repl_l\(2)
+    .noaltmacro
+    decl_repl(\newinstr2, 2)
+
+    .popsection
+.endm
+
+#else /* !HAVE_AS_INSN_SIZE */
+# define MERGE_ALTERNATIVE   ALTERNATIVE
+# define MERGE_ALTERNATIVE_2 ALTERNATIVE_2
+#endif /* HAVE_AS_INSN_SIZE */
+
 #undef as_max
 #undef repl_len
 #undef decl_repl
--- a/xen/include/asm-x86/spec_ctrl_asm.h
+++ b/xen/include/asm-x86/spec_ctrl_asm.h
@@ -228,19 +228,19 @@
 /* Use after a VMEXIT from an HVM guest. */
 #define SPEC_CTRL_ENTRY_FROM_HVM                                        \
     ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM;           \
-    ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM,                        \
+    MERGE_ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM,                  \
         X86_FEATURE_SC_MSR_HVM
 
 /* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
 #define SPEC_CTRL_ENTRY_FROM_PV                                         \
     ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV;            \
-    ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=0),         \
+    MERGE_ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=0),   \
         X86_FEATURE_SC_MSR_PV
 
 /* Use in interrupt/exception context.  May interrupt Xen or PV context. */
 #define SPEC_CTRL_ENTRY_FROM_INTR                                       \
     ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV;            \
-    ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
+    MERGE_ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),   \
         X86_FEATURE_SC_MSR_PV
 
 /* Use when exiting to Xen context. */
@@ -250,16 +250,16 @@
 
 /* Use when exiting to PV guest context. */
 #define SPEC_CTRL_EXIT_TO_PV                                            \
-    ALTERNATIVE "",                                                     \
+    MERGE_ALTERNATIVE "",                                               \
         DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
-    ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)),           \
+    MERGE_ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)),     \
         X86_FEATURE_SC_VERW_PV
 
 /* Use when exiting to HVM guest context. */
 #define SPEC_CTRL_EXIT_TO_HVM                                           \
-    ALTERNATIVE "",                                                     \
+    MERGE_ALTERNATIVE "",                                               \
         DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM;             \
-    ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)),           \
+    MERGE_ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)),     \
         X86_FEATURE_SC_VERW_HVM
 
 /*


