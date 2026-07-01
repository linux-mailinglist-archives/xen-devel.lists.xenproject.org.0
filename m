Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +9G2Ds7ZRGps2AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:11:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F26EB7D2
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:11:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Khh4FD0p;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349634.1607323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weqyh-0002gw-4f; Wed, 01 Jul 2026 09:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349634.1607323; Wed, 01 Jul 2026 09:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weqyh-0002fX-20; Wed, 01 Jul 2026 09:11:31 +0000
Received: by outflank-mailman (input) for mailman id 1349634;
 Wed, 01 Jul 2026 09:11:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1weqyf-0002fR-Kb
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:11:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weqyf-0021Y8-1E
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:11:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a44d9bd-e002-0a2a0a5209dd-0a2a4504d59e-18
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:11:28 +0200
Received: from [52.101.125.81]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a44d9be-a01d-0a2a45040019-34657d51ff28-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:11:28 +0200
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30e::6)
 by OS7P286MB5474.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:398::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:11:24 +0000
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515]) by TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515%3]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 09:11:24 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT41lXqD5OHiVwGeebk41nIfKTrw3JOzr0a5uPthT5RTrIflG6rH1oF4P846KWM0iRhkGUoXLqKy0/5495GQfdD9vJR15XG9KZAbx5rQJJJmhhbA1l/OXFQa3IfR/0UWKaPPebFcSEMQLgUQHAIEdn1z14xlJvmiixRIq6+E5l4vgpFzxgUcEpNGWKImJyrg24rfYJdONiEaeP1vqXtQR5ruY1z5JScRWoClNo1kmj74aVvx3dVzIdUyl8o/xAtb7wjIJTP5SfJcYwqjbqLDPCmerF/2bb1562pkt7PBH1l5vcPVohOvZtzKDzIGBDig1uOuMyPFYlqOi9ZjEsMk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lw8adwinFUP4ZxnfUnxkGTnsKQin0zV3wPPajUUvSSg=;
 b=raONHWeUjfgxZ62CoEVSV7DmipmNjMtvoRxoCU+oCaFyWY0yRgPuq6QsNGgmJz7mvfxVOefSi5lDn8IiyBs3Nx8vGCxpFVBMqmlbhjq8aqn2dV8y/fPFwZFk1FCColZSiNaISYAPtWhevSO2R9E3ukiXW7rrwd5xepSeHt9qmsw1hkFEwWem3G4R7EOXOTSXBKIdCJOVeHsWV8Zwvtla2fXtNxvBak2qTuefF1ImSxOdp5es8d4RrTM471znX8xB9g8lRG1+xMBPOie01QTwbkJhTtqzBS0aPmL77KdFqdjFc5TjaNrDsztUMIujjd39Q930vmBh+drNBB8atimu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lw8adwinFUP4ZxnfUnxkGTnsKQin0zV3wPPajUUvSSg=;
 b=Khh4FD0pTO2LxHuhADw7S/gcYIbdTKtOnaXujBk/zk1VUbvkybEw3VjHnMscplqMsXZVvUGt/8L1WS47m17wNGD7R8GBQm9gUW/IIYNm20ynnf3VnNwzCs0lp5fBXTIlUov3udPbgAzAfBcxt63UX+3rU6OBWBhOgSTHPo4xNpE=
From: Ryo Takakura <takakura@valinux.co.jp>
To: andrew.cooper3@citrix.com
Cc: roger.pau@citrix.com,
	xen-devel@lists.xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	taka@valinux.co.jp,
	den@valinux.co.jp
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
Date: Wed,  1 Jul 2026 18:11:23 +0900
Message-Id: <20260701091123.15791-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <64e7c58b-a12e-4b29-9d5a-f8a66e77a221@citrix.com>
References: <64e7c58b-a12e-4b29-9d5a-f8a66e77a221@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::16) To TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:30e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYP286MB2946:EE_|OS7P286MB5474:EE_
X-MS-Office365-Filtering-Correlation-Id: 014a5c0d-1d51-492c-9b5e-08ded750b9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fwlkoyjdso/p/q+Y3N7GHGj1uOD2MJ2KAg+cYdE/t7+af/FSgMtHhOyMgEf5fwdlJT7q1OqhI/r28t6ywZgmmqyJV9BenyIFTIp0CDyiTecU2SnOwWQIZY+AG1Mh5RthksgLtWC5KfzbKrgdU5BTkIdCUqYWB+UheSmdKBA7xW4PJiFiDh3nyDIPK2h497r0tcNSbec6/TzOW7T1g15GoVN5grwuJbDvBeZO5TM+tALwk3QN9pX1u0zf100Cd4ShJGg9z5Lui7/LVRLi3E/Pb0eq7inmc9gEm2GiCKa7NLWg93RomuYDkwQ2UpT8a0Js43J0YQareZzR+MAu3BpM+c79qpPXbulMLC+Y5Psq1zCIutTPQuMxQJOI4VbRnI8KUpRWOG+uB0dGypWYyQFpc8rZF1/9+Ik0AX2XtgvZPkrbccVXtaqiNrE4+GxG8l9ePFeTBemr6IJWQGecyicT9GditOZYPYbjwu6yRqMX7g93XTgguEuQxchszBzxRNknw6yt38dkuEwtbxEbwTavnuygFee9Zq9bTNvy26fXr+0MkpM9O1RGkrsoqmaskSVi+x3ynSWDTTxJBQkxOUzRsu7p3pTdDNuLp0uWw2uFyn9oiGWXHmtPcuW4w58JG8BJKnfGk9ZsZt0vHLYh/RYclkF5MExgLfkxnOVLGkdX10c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1TY7+bWc0+xeQ0b36x7rge716RE0+Y+zdBedr9mN+T+H5HZlIDmuFGb+XFg?=
 =?us-ascii?Q?lXqeiYuO9ohjU6qwLlWbdYmHZiUxWKeVv4xOry1b7K8ZLdlxViYVNKF5ab8l?=
 =?us-ascii?Q?dpmyW641KlF5zmowQn0kTejK+FLBGnrqON9laPz6qtTfjQPpxrw0uQavWWrv?=
 =?us-ascii?Q?bp33EkFe6o4wDOOJhHhG6exjf/Prr8JdZrHXKkGCEPGQsRrAvlS69fPdaNj6?=
 =?us-ascii?Q?REQhK380dtYo2YF54RUxfUIQS4AskZYAyXzsQkdv5jmsc3gw+duyFyBXfVVw?=
 =?us-ascii?Q?ZQ+p1CUY2UBxOo3UQph3ISkvHso0jnvIpFIJVmBzplLJg8znGTHtQdZCL+Ib?=
 =?us-ascii?Q?K1EGv+lsWn5ZUsnVEfWDS3DNG8i+GMoo83AYapw5YdZeNYWCCtmtQrcLODbp?=
 =?us-ascii?Q?GzTG6CaBFlagjtSa7xXZP8GO1xZNZ8rb48njlFJavMN8MSzjT4ggSiDF7d1Q?=
 =?us-ascii?Q?6js1rUlISvvwwbj0c4JqOfZ7HvM9i5toUBE29CCj4CWNpP6K4ew3pwNHXjdq?=
 =?us-ascii?Q?6OdC/FYHRoFKYD36+uGQAKLPHwZhxlcD0JWpiHmhXYSt32zjIzFkvQcmibP8?=
 =?us-ascii?Q?GoCHPFCl1VctEuz5ssdySCiCeRq6mJ+zC7BE7Aesqk6zFMNoVA+aerJjHdKR?=
 =?us-ascii?Q?HhiCr2x96iSeLwUo6HSG0ynIn+K/Y4IrCieQj3x7FJ0M/0b1U1omEtfb+HNr?=
 =?us-ascii?Q?OJI3dGhjZw4VEVrBa2Muvp4ilVBLW81mOl+muitOzntyMlls6AfRJX29+BXD?=
 =?us-ascii?Q?IX9/Y0uSq1erZupX50Rgjz/MhSr2R78YW3BEobQHNlUQUBoJwkxqkVab5+Wr?=
 =?us-ascii?Q?oujvwJNwml7iouH7a9DaXWrIvQbkMJrQyD6pzV/3DEvKob6xr8ieiqdBalJN?=
 =?us-ascii?Q?rURS9eSwP9hI3SdQYBs/equ66x76qvXLsbmAHgyT4nW7oDrmFbGxDQuzPedp?=
 =?us-ascii?Q?zweiTyemoKpUZeIUqewsadvR+WbjGyQggPgLhQMvXJ++B1TjG7Q7z4AqIJUy?=
 =?us-ascii?Q?2YaOYj3mYtGojcCOsxs8oS1H6LHJu8adQDaBWejh3OkOx748+GFNrOIWVUna?=
 =?us-ascii?Q?kxDvJbzWtew1prYGkvSP0LXZyhgo+a+6n7yykY/5j8AQKuEOy3p+vj4yfD+E?=
 =?us-ascii?Q?808WRVfawd2sf4yC+HdSom5J8ZgnQyr96aA+SfRf3EfuyXlMNzVmZTqBhHGY?=
 =?us-ascii?Q?zcW3Lxhcdw4MlP57vAVfSgtD9uWU15SxzAsjxizv5XkusxoB8pRb9JeZah+s?=
 =?us-ascii?Q?k8Ow9JRspPYComndEdVn94/d6f6ybtaqrbLBon2r8oZNvgBJkUI614bAjR5Y?=
 =?us-ascii?Q?0SlPlsSEh2bwtsxXIjVttpoG7w506B6BdhHIKtgOId4xZhwOjLP7P/cYtuWN?=
 =?us-ascii?Q?EqYkzO58ulCSzA+DVpHhhl1wKF2pRdEqE4mqcqVChK6QuBUNSGGfI3+RG+zp?=
 =?us-ascii?Q?Z+aIVbX31prhL1RrwoluOyin6WCIdIJ5fkcZ4HN/gbjsEU1co9DKWWRAjOUf?=
 =?us-ascii?Q?Ge9HUcZbrgk/drrz8+S/iU8rJe7A8ZLWWWJzH3xb8/UHYduexHF6SX5iT6pk?=
 =?us-ascii?Q?huzJGN80NmfYocpiw/TTV8i5DcdxNOPJaNV+3kZ5rAW26im39mcVoMx/fYgM?=
 =?us-ascii?Q?pHXQu7A3J+deldfc4jyg0tDdyf8LGTsRONoDU48ImdYQliXQAbjmBzA+LUbk?=
 =?us-ascii?Q?H7QFbVe8WOO4DhPMiIEqoIXTLB8QtIIr+0NDLhH287alH3Wy3niu7drsmCOo?=
 =?us-ascii?Q?+esnuc8o3A=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 014a5c0d-1d51-492c-9b5e-08ded750b9c8
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:11:24.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtzjY3Cl4zWFijyfqfqac9SVpC7MuiWCBFUN8YxVcVR3MqOkN29v7T4N8aGqvkaCR2xlLu0d2kiEMERj2ERRBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB5474
X-purgate-ID: tlsNG-ebf023/1782897088-2E7A61CC-B16322A2/0/0
X-purgate-type: clean
X-purgate-size: 2553
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 545F26EB7D2

Hi Andrew,

On Tue, 30 Jun 2026 10:57:38 +0000, Andrew Cooper wrote:
>On 30/06/2026 11:43 am, Ryo Takakura wrote:
>>>> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
>>>> index e135bd5bf9..b7c9aba94e 100644
>>>> --- a/xen/arch/arm/arm64/livepatch.c
>>>> +++ b/xen/arch/arm/arm64/livepatch.c
>>>> @@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_func
>>>> *func,
>>>>      /* Save old ones. */
>>>>      memcpy(state->insn_buffer, func->old_addr, len);
>>>>
>>>> -    if ( func->new_addr )
>>>> +    if ( !func->new_addr )
>>>> +    {
>>>> +        insn = aarch64_insn_gen_nop();
>>>> +    }
>>>> +    else if ( func->trampoline_buf )
>>>> +    {
>>>> +        int rc;
>>>> +        uint32_t *trampoline = func->trampoline_buf;
>>>> +        uint32_t *tp = trampoline;
>>>> +        void *orig_cont_addr = (void *)func->old_addr + len;
>>>> +        unsigned int trampoline_code_size = len + 12 * 
>>>> ARCH_PATCH_INSN_SIZE;
>>>> +        unsigned long trampoline_start = (unsigned long)trampoline &
>>>> PAGE_MASK;
>>>> +        unsigned long trampoline_end =
>>>> +            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size);
>>>> +
>>>> +        /*
>>>> +         * Make the payload text area writeable while generating
>>>> +         * the trampoline instructions.
>>>> +         */
>>>> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
>>>> +                                 PAGE_HYPERVISOR);
>>>> +        if ( rc )
>>>> +        {
>>>> +            printk(XENLOG_ERR LIVEPATCH
>>>> +                   "Failed to make trampoline writable: %d\n", rc);
>>>> +            return;
>>>> +        }
>>> This ought not to be necessary.
>>>
>>> The trampoline is executable code, so should have space reserved for it
>>> in .text of the livepatch.
>>>
>>> Then, you can identify it simply by references in a new section, without
>>> having to have a pointer with a sentinel value (void *)1 in (which MISRA
>>> will have a fit at).
>> I like this idea as well! I'll try this together with the earlier
>> suggestion using __attribute__((no_caller_saved_registers)).
>
>If you reserve space in the function preamble, and use
>__attribute__((no_caller_saved_registers)), then you don't need
>trampolines at all.
>
>The preamble just needs to turn into `call newfunc` when the callback
>function is attached, and then it's regular return will do the right thing.

Understood!

Sincerely,
Ryo Takakura

>~Andrew

