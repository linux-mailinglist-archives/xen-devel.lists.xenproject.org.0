Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CuTaJb7pQWrIvwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 05:42:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A696D5B1A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 05:42:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=LtRPwwOI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347128.1605008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we2sS-0005pV-7Y; Mon, 29 Jun 2026 03:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347128.1605008; Mon, 29 Jun 2026 03:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we2sS-0005nB-0d; Mon, 29 Jun 2026 03:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1347128;
 Mon, 29 Jun 2026 02:01:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1we1Jt-0000Pk-9N
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 02:01:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we1Js-00DHGq-0x
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 04:01:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a41d1ee-bab6-0a2a0a5309dd-0a2a4502b8ec-24
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 04:01:55 +0200
Received: from [52.101.229.138]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a41d20f-5a27-0a2a45020019-3465e58a9170-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 04:01:54 +0200
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30e::6)
 by TYRP286MB5864.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 02:01:48 +0000
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515]) by TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 02:01:48 +0000
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
 b=aAaux/coelTE9SNl29mDXZUFVwSC9oXuRKTDnXpL00KsjgSZhYKWOvkqYSsJmq6FyoATMDJsAqWbWbPu1C3jTj6UTwu4ZvPSwZVFWVnBvWXuu60sUzkBInpjIF7LoFsLRacX96U6SoC/SUghbQr7mT5RqJgAJ6b6Y88RUHPECxcvhq91PdC6WF2W6M797IaZx3h96cs5rZDu/FVhJezMpReEHLrlX58+3Np5NF9nd+dGwAKs8VYtkx3GUa+uebQSqze3hPSjD7IRzT064P7t01WriAMcE8lPC8teuHo0k41ZEmuCtC0rOibo0nZOQAy0CdlCpX3IPpsxgw4sstaz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjMi6goWu6dnJNcUo0E7KxWnlD36ags8JxTs8eDXz54=;
 b=lLeJHAKrA6kwcvCVKxk0GxvLaIuC0jNWWWHvfZMJbk5Wdm37s0kOe8JR4WNs4eI36n8eOrhkjfF2tlpC6KC1aORHf0o1Nsxrx+fw10jrpDu5ZIR3JzjrDPjkRu2iRmjMGOe23M4H9uH2Dt6cNUTnuccxJEo4Jxr3pQ7hx/fgYVF9mfuaTlL2stb9pdUZ7AfKaVcQrBdDkNSeUCHA6CqVPrOGfyIv9GZUa584FQC1U322Bcj2ah+0DBLdQN8lJeyzIEVDZyGzos/YeR7KKYz6avgSeywj7/vZ34Jrgqf1kb8hMLAWg9ug/taYrBAajdcMD8m47UfPAKDjf2zjTVSg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjMi6goWu6dnJNcUo0E7KxWnlD36ags8JxTs8eDXz54=;
 b=LtRPwwOIyZbcQd/0LrUsDIBMst+xv8KQbA58r1ixyKVBdievUX3BpGS1C7+27abdnSyuFtWh1ot3vzSQo/QxRQ4G72vZuCFx8+l8N2PY/PaxW+B2ODtgNaK2h2G5vayk6F4Sg7b2KXjUHXL2PdehHlWEa3t6cWLR6qVm2Yd0USo=
From: Ryo Takakura <takakura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	taka@valinux.co.jp,
	den@valinux.co.jp,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFC] xen/arm64: livepatch: enable attaching callbacks
Date: Mon, 29 Jun 2026 11:01:28 +0900
Message-Id: <20260629020128.30561-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0095.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::17) To TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:30e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYP286MB2946:EE_|TYRP286MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb2585a-4781-43c4-9859-08ded5826114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+Dx5dVgDnb0sPUvil99Iy2UJiKmhZchB9nZVr+0Ua5WF5u2QDH8vhvElBmCPjnij/mDaVD0dv72mJiCPYlnjaQSlPJjbJ57/S0PpWb6+IF2Pt8SU8Hjghy3fNDSuYn8l0pWeTTfoY3gLIS2WDlPEj+RHKADKjhDby3Lh3Faa8Mib/vW2vScNegO491UknIGCuRpsnKTnZkY2ibAFQSNA2t75rPXsx0gCVl43Q9uhIgMF/fHqPAursxgjqHTJRGZSwfZaWYR3lWhRAYpTD4SbFCvtiMadSRnK8gM6I+Sa2h3du68gWPX5A1SAO0Z6gyHHsA14J2HCpH0xIcJgN42QVyOSe/xWPUv4yMuirxzHpbMHKV/fQToievFkumXcHI65FlJRb3D8M+lLLwrO7dUru7/NIKHvvVmf3FXHilFAxZQgS0dXqDMneBwlNlsnNQkpVWa5I3oK4wuPAwU+wgU29E5aXAMMnWqxggRjXWDHZgrGOXxCkmISpI3DMhueufAoIY8K3mXRLOuD1j+/8wIaDCtJiC5Xnai3erojB4JUkKoFzB22vPrrQVAd+FNmQVOBeoMCy2lDvySownvmDz2W96Kac9pFZTnYmaFtzAkELsvsEOCE3ao9DJ0IczMurJcjNdRRqYYoWURHaOmkTpUhsvNTS1qJ2iwUedP99IBAdlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7UodhO7XxhVNE+FHrL8ENOabCFbIkg7GrJSOly/+y+a8IgwzqbWWDXfEQb5z?=
 =?us-ascii?Q?ssGeo4m3AnJAWiN1M6x9Zw6wGOLyzDx8W6o4PQ6MTkLS47RocabAifbhq8ir?=
 =?us-ascii?Q?ZaDTNtY3XPlKBPKaxObQWE6vd2ANPZBlfaPwkoSWgzpQKReZjN8WO7ooJBFJ?=
 =?us-ascii?Q?p9MGy2hK4rjXZWe8wI+UCnbbkKrgnOEDcQVXmZ2qMyMFPf9e7bZn50D6s7jM?=
 =?us-ascii?Q?8VeQfjE2UNS+udcLE5EJyn2OdZGgOOf0l7J3v7sSVB1bIYy9uhyRrezFqV8l?=
 =?us-ascii?Q?2sN2ZAOaWkY903m3pXPbWG9NwZ5tN/yBhCPGhXyCm73lC89DotpRGz4T9wN0?=
 =?us-ascii?Q?g+JOcofEsDwxP9LV4mQjsLWdXsECtjB94XgflNQ4lYoDIrL3fVE8BZJ/B0tZ?=
 =?us-ascii?Q?yyjO4vvS0pxylgZeynz+NbK/TOG7c+wBClBR09OqGy8YY1eCMaK4bBrROZ/c?=
 =?us-ascii?Q?WCytmQVqhAnaZ6nDU1syFjkc8cqswaMBbDcECsU832vHW8mwyq11HDWvA+kR?=
 =?us-ascii?Q?wuYiRrgzVBd64sxP8uG8j/8291pm9P6wxitUXQbBshqe8r2pXzpPUa/2JAnb?=
 =?us-ascii?Q?0SswSYds/7uPM2gjXyAXGGs44FWb/i/ubJB9G49c1ExNNJX8Lj5AHutZqy1z?=
 =?us-ascii?Q?C3jE3KykKiU/QKErH6CYRvX3R3jsHd43GOCzC+XsUJMIURDadSvg3VvTLTdV?=
 =?us-ascii?Q?mTfhDsYMKRQC63lbns6TW9ATNXjXSTHboHhtU74SY7/r1JrpV4jn4vdOpK1W?=
 =?us-ascii?Q?2oYyPTaLVI3K+r1/LlPiuOUeH9UMoIPloxPf+Sr2CaMN+pdr5zc4EsTGTRkY?=
 =?us-ascii?Q?qHEh6wKjvpQ1PoGpd93qvZXrna7HLKIXXJstBdi9JJzVm5i6FTn1uaBTM7S8?=
 =?us-ascii?Q?HwrQ3HaE4YZSk03AlaJDdruDGFq02tftAUv99ZX9SwQ8HXjPVRfRnmAfQWr1?=
 =?us-ascii?Q?pP6iEqagYlenkzR7aJ9TCcLt4A6uWEGXBC3LMw58juv1IoctFkNxVHbUd/jn?=
 =?us-ascii?Q?ucloXDQihnfIncnUvlAqVgAA2A+X9RlXJgqRSQ7OhUlBTAvVoukuwc38J0No?=
 =?us-ascii?Q?GsJd/pcnvpTk6EOBFfmI24qeMZMJGGlaq+ahsOK/XMnJl2eat/vl6RjCR/3U?=
 =?us-ascii?Q?M2u7hxO6HXzIudOY+C6YOWJOQP004ismXC9GszqSCJPhSauwOxq5HAN9KEfZ?=
 =?us-ascii?Q?cZ0I7xiAX0yvJwRvYPkVH4Spl784qktYUTuFLLuKuGIge80S2XGS5C6njMnG?=
 =?us-ascii?Q?HRv6jJJ0RBCnkR2qu0m0XS558fuba5DIYCnwdiBA/QElK0awyhFVygp/jG6x?=
 =?us-ascii?Q?CFxXg/vh/ehRWdQiS6BLus2ktknH2RiD9SnFi3sOVFwP4Y7Q/LywxHJT8emA?=
 =?us-ascii?Q?ZRtDtVcsxZHmO4Ywf0JMIduekcLdAJoruSBgeS+mGdodQ/aBXADakNpJkYby?=
 =?us-ascii?Q?NKITncth9Bt2jv4C01N4t/jSmPUZVBkDaA9+yA6KpHCDlmxfLkFUVKTY3m5V?=
 =?us-ascii?Q?LIEmWrxCDAnbGOkORKbRZjk+Q4rgi6TFzicBkALTyM6PGj4lLgC5ic/1UgFL?=
 =?us-ascii?Q?heW9Fgt19IKBQwX1px5eLXneIAJGu7x7ndepjgt/QYuY3ahk6gicwCprMB00?=
 =?us-ascii?Q?xfMPS5axKUGxPpq0gMgfk0Jwb6D24bm8Q5hGnMywaC9UgEe5iR1Xs7H2sC7w?=
 =?us-ascii?Q?qsryK0xcI+vYRncfr6i0hJOjz4nOheb9JZcP5oQ+9SD3h01N8k4tK8ayU+gC?=
 =?us-ascii?Q?QLPyQ+6mig=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb2585a-4781-43c4-9859-08ded5826114
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 02:01:48.5666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX/fdhrwIpK7PfgSvHLkdoAJh0iibOBmx2+q95zRxmN2xbwGJCBg5X4zVJaORZ0j4K8lPOajIR4DltHvThpwrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5864
X-purgate-ID: tlsNG-720697/1782698515-4CF017C5-8B9764E0/0/0
X-purgate-type: clean
X-purgate-size: 13541
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,m:takakura@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7A696D5B1A

Linux ftrace allows registering callbacks which is useful
for debugging and tracing events. On Linux, it is done by
reserving function entry points at compile time which can
later be patched to branch to a trampoline.

This patch implements similar callback feature, but with
different approach using existing livepatch infrastructure.
Instead of reserving function entry points at compile time,
the traced function will be livepatched so that it branches
to the trampoline.

The role of the trampoline(illustrated below) is to preserve
the context while jumping to the tracer function, and return
back to the traced function with its context restored.

trampoline:
    Save regs
    Call tracer function
    Restore regs
    old_addr
    return old_addr + 4

One can request the feature by setting @trampoline_buf to 1
which will allocate a buffer for trampoline.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---

Hi!

For the future, I'm thinking of linux-like extensions
which help tracing and debugging by passing:
- saved registers
- caller information
- private data
- and so on ...

I would appreciate any advice or suggestion.
Thanks!

Example payload file:

#include <xen/lib.h>
#include <xen/livepatch.h>

static void my_tracer(void)
{
    printk("livepatch: do_domctl was called\n");
}

static struct livepatch_func funcs[]
    __attribute__((section(".livepatch.funcs"))) =
{
    {
        .name = "do_domctl",
        .old_size = 4572,
        .new_addr = my_tracer,
        .new_size = 32,
        .trampoline_buf = (void *)1,
        .version = LIVEPATCH_PAYLOAD_VERSION,
    }
};

Sample output:

$ tools/misc/xen-livepatch list
 ID                                     | status     | metadata
----------------------------------------+------------+---------------
trace_do_domctl                         | APPLIED    |
$ xl vcpu-list Domain-0
Name                                ID  VCPU   CPU State   Time(s) Affinity (Hard / Soft)
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
(XEN) livepatch: do_domctl was called
Domain-0                             0     0    1   -b-      67.7  all / all
Domain-0                             0     1    3   -b-     457.2  all / all
Domain-0                             0     2    2   -b-      42.4  all / all
Domain-0                             0     3    0   r--      32.4  all / all

Sincerely,
Ryo Takakura

---
 xen/arch/arm/arm64/livepatch.c      | 104 +++++++++++++++++++++++++++-
 xen/common/livepatch.c              |  40 +++++++++--
 xen/include/public/sysctl.h         |   3 +-
 xen/include/xen/livepatch.h         |  13 +++-
 xen/include/xen/livepatch_payload.h |   2 +
 5 files changed, 150 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index e135bd5bf9..b7c9aba94e 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -15,6 +15,29 @@
 #include <asm/insn.h>
 #include <asm/livepatch.h>
 
+
+#define AARCH64_REG_SP 31
+
+static uint32_t aarch64_insn_gen_stp_pre(unsigned int rt,
+                                         unsigned int rt2)
+{
+    return 0xa9800000 |
+           (((-16 / 8) & 0x7f) << 15) |
+           (rt2 << 10) |
+           (AARCH64_REG_SP << 5) |
+           rt;
+}
+
+static uint32_t aarch64_insn_gen_ldp_post(unsigned int rt,
+                                          unsigned int rt2)
+{
+    return 0xa8c00000 |
+           (((16 / 8) & 0x7f) << 15) |
+           (rt2 << 10) |
+           (AARCH64_REG_SP << 5) |
+           rt;
+}
+
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
 {
@@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_func *func,
     /* Save old ones. */
     memcpy(state->insn_buffer, func->old_addr, len);
 
-    if ( func->new_addr )
+    if ( !func->new_addr )
+    {
+        insn = aarch64_insn_gen_nop();
+    }
+    else if ( func->trampoline_buf )
+    {
+        int rc;
+        uint32_t *trampoline = func->trampoline_buf;
+        uint32_t *tp = trampoline;
+        void *orig_cont_addr = (void *)func->old_addr + len;
+        unsigned int trampoline_code_size = len + 12 * ARCH_PATCH_INSN_SIZE;
+        unsigned long trampoline_start = (unsigned long)trampoline & PAGE_MASK;
+        unsigned long trampoline_end =
+            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size);
+
+        /*
+         * Make the payload text area writeable while generating
+         * the trampoline instructions.
+         */
+        rc = modify_xen_mappings(trampoline_start, trampoline_end,
+                                 PAGE_HYPERVISOR);
+        if ( rc )
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                   "Failed to make trampoline writable: %d\n", rc);
+            return;
+        }
+
+        /* Save state before calling the tracer. */
+        *tp++ = aarch64_insn_gen_stp_pre(0, 1);
+        *tp++ = aarch64_insn_gen_stp_pre(2, 3);
+        *tp++ = aarch64_insn_gen_stp_pre(4, 5);
+        *tp++ = aarch64_insn_gen_stp_pre(6, 7);
+        *tp++ = aarch64_insn_gen_stp_pre(29, 30);
+
+        /* Call user's tracing function. */
+        insn = aarch64_insn_gen_branch_imm(
+            (unsigned long)tp,
+            (unsigned long)func->new_addr,
+            AARCH64_INSN_BRANCH_LINK);
+        *tp++ = insn;
+
+        /* Restore state before continuing original function. */
+        *tp++ = aarch64_insn_gen_ldp_post(29, 30);
+        *tp++ = aarch64_insn_gen_ldp_post(6, 7);
+        *tp++ = aarch64_insn_gen_ldp_post(4, 5);
+        *tp++ = aarch64_insn_gen_ldp_post(2, 3);
+        *tp++ = aarch64_insn_gen_ldp_post(0, 1);
+
+        /* Original instruction. */
+        memcpy(tp, state->insn_buffer, len);
+        tp += len / ARCH_PATCH_INSN_SIZE;
+
+        /* Branch back to original function. */
+        insn = aarch64_insn_gen_branch_imm(
+            (unsigned long)tp,
+            (unsigned long)orig_cont_addr,
+            AARCH64_INSN_BRANCH_NOLINK);
+        *tp++ = insn;
+
+        clean_and_invalidate_dcache_va_range(trampoline, trampoline_code_size);
+
+        rc = modify_xen_mappings(trampoline_start, trampoline_end,
+                                 PAGE_HYPERVISOR_RX);
+        if ( rc )
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                   "Failed to restore trampoline RX mapping: %d\n", rc);
+            return;
+        }
+
+        /* Branch from original function to trampoline. */
+        insn = aarch64_insn_gen_branch_imm(
+            (unsigned long)func->old_addr,
+            (unsigned long)func->trampoline_buf,
+            AARCH64_INSN_BRANCH_NOLINK);
+    }
+    else if ( func->new_addr )
         insn = aarch64_insn_gen_branch_imm((unsigned long)func->old_addr,
                                            (unsigned long)func->new_addr,
                                            AARCH64_INSN_BRANCH_NOLINK);
-    else
-        insn = aarch64_insn_gen_nop();
 
     /* Verified in livepatch_verify_distance. */
     ASSERT(insn != AARCH64_BREAK_FAULT);
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7515a040ad..8863ad5ca3 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -280,10 +280,30 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
 {
     void *text_buf, *ro_buf, *rw_buf;
     unsigned int i, rw_buf_sec, rw_buf_cnt = 0;
-    size_t size = 0;
+    const struct livepatch_elf_sec *sec;
+    const struct livepatch_func *funcs;
+    unsigned int nfuncs, trampolines_needed = 0;
+    size_t size = 0, trampoline_size = 0;
     unsigned int *offset;
     int rc = 0;
 
+    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
+    if ( sec )
+    {
+        funcs = sec->addr;
+        nfuncs = sec->sec->sh_size / sizeof(*funcs);
+
+        for ( i = 0; i < nfuncs; ++i )
+            if ( funcs[i].trampoline_buf == (void *)1 )
+                trampolines_needed++;
+
+        if ( trampolines_needed )
+        {
+            payload->n_trampolines = trampolines_needed;
+            trampoline_size = trampolines_needed * LIVEPATCH_TRAMPOLINE_SIZE;
+        }
+    }
+
     offset = xmalloc_array(unsigned int, elf->hdr->e_shnum);
     if ( !offset )
         return -ENOMEM;
@@ -323,8 +343,8 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
      * them on separate pages. The last one will by default fall on its
      * own page.
      */
-    size = PAGE_ALIGN(payload->text_size) + PAGE_ALIGN(payload->rw_size) +
-                      payload->ro_size;
+    size = PAGE_ALIGN(payload->text_size + trampoline_size) +
+           PAGE_ALIGN(payload->rw_size) + payload->ro_size;
 
     size = PFN_UP(size); /* Nr of pages. */
     text_buf = vmalloc_xen(size * PAGE_SIZE);
@@ -335,9 +355,12 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
         rc = -ENOMEM;
         goto out;
     }
-    rw_buf = text_buf + PAGE_ALIGN(payload->text_size);
+    rw_buf = text_buf + PAGE_ALIGN(payload->text_size + trampoline_size);
     ro_buf = rw_buf + PAGE_ALIGN(payload->rw_size);
 
+    if ( trampoline_size )
+        payload->trampoline_addr = text_buf + payload->text_size;
+
     payload->pages = size;
     payload->text_addr = text_buf;
     payload->rw_addr = rw_buf;
@@ -690,7 +713,7 @@ static int prepare_payload(struct payload *payload,
 {
     const struct livepatch_elf_sec *sec;
     const struct payload *data;
-    unsigned int i;
+    unsigned int i, trampoline_idx = 0;
     struct livepatch_func *funcs;
     struct livepatch_func *f;
     struct virtual_region *region;
@@ -737,6 +760,13 @@ static int prepare_payload(struct payload *payload,
             if ( rc )
                 return rc;
 
+            if ( f->trampoline_buf == (void *)1 )
+            {
+                f->trampoline_buf = (char *)payload->trampoline_addr +
+                                    trampoline_idx * LIVEPATCH_TRAMPOLINE_SIZE;
+                trampoline_idx++;
+            }
+
             rc = livepatch_verify_distance(f);
             if ( rc )
                 return rc;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index c7cd9b4eb0..e79615d7c9 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1010,10 +1010,11 @@ struct livepatch_func {
     const char *name;       /* Name of function to be patched. */
     void *new_addr;
     void *old_addr;
+    void *trampoline_buf;   /* Trampoline buffer when set to (void *)1. */
     uint32_t new_size;
     uint32_t old_size;
     uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
-    uint8_t _pad[39];
+    uint8_t _pad[31];
     livepatch_expectation_t expect;
 };
 typedef struct livepatch_func livepatch_func_t;
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 45c8924f34..7a81763cf2 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -48,6 +48,8 @@ struct xen_sysctl_livepatch_op;
 #define ELF_LIVEPATCH_POSTREVERT_HOOK ".livepatch.hooks.postrevert"
 /* Arbitrary limit for payload size and .bss section size. */
 #define LIVEPATCH_MAX_SIZE     MB(2)
+/* Size of a trampoline used for function tracing */
+#define LIVEPATCH_TRAMPOLINE_SIZE 128
 
 struct livepatch_symbol {
     const char *name;
@@ -109,13 +111,18 @@ unsigned int livepatch_insn_len(const struct livepatch_func *func,
 
 static inline int livepatch_verify_distance(const struct livepatch_func *func)
 {
+    const void *target;
     long offset;
     long range = ARCH_LIVEPATCH_RANGE;
 
-    if ( !func->new_addr ) /* Ignore NOPs. */
-        return 0;
+    if ( func->trampoline_buf )
+	target = func->trampoline_buf;
+    else if ( func->new_addr )
+	target = func->new_addr;
+    else
+	return 0; /* Ignore NOPs. */
 
-    offset = func->old_addr - func->new_addr;
+    offset = func->old_addr - target;
     if ( offset < -range || offset >= range )
         return -EOVERFLOW;
 
diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepatch_payload.h
index c6dc7cb5fa..7ed8be3fd6 100644
--- a/xen/include/xen/livepatch_payload.h
+++ b/xen/include/xen/livepatch_payload.h
@@ -52,6 +52,8 @@ struct payload {
     size_t ro_size;                      /* .. and its size (if any). */
     unsigned int pages;                  /* Total pages for [text,rw,ro]_addr */
     struct list_head applied_list;       /* Linked to 'applied_list'. */
+    void *trampoline_addr;               /* Virtual address of trampoline area. */
+    unsigned int n_trampolines;          /* Number of trampolines to be allocated */
     const struct livepatch_func *funcs;  /* The array of functions to patch. */
     struct livepatch_fstate *fstate;     /* State of patched functions. */
     unsigned int nfuncs;                 /* Nr of functions to patch. */
-- 
2.34.1


