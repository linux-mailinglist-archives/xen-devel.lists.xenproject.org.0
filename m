Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 81I7I/WUUGrZ1wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 08:45:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69B737CBA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 08:45:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=ILWmgzAq;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358770.1612682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi4xx-0002K0-La; Fri, 10 Jul 2026 06:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358770.1612682; Fri, 10 Jul 2026 06:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi4xx-0002HQ-Ik; Fri, 10 Jul 2026 06:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1358770;
 Fri, 10 Jul 2026 06:44:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1wi4xu-0002HK-Px
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 06:44:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi4xt-00Dnqr-FT
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 08:44:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a5094ae-bab6-0a2a0a5309dd-0a2a4507a810-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 08:44:00 +0200
Received: from [52.101.125.90]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a5094ad-ac46-0a2a45070019-34657d5ac550-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 08:43:59 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by OS9P286MB4752.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 10 Jul
 2026 06:43:55 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 06:43:54 +0000
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
 b=XGADxB7QiZnp4tM/W4F/BpyyDv00zXRXI5MqwfCGiyMyXpAQ+ajLPzEEsl8VO3b4wCmdZQ7GCrJUWiEvdKZsRB/RRc23vLDG16bEnM0f/yfkaTV2F/u3S2U4mMKe+0ParzNfrGEULwQqM07GW22Oqw/yKWoA72IYdOQqsuwDv+k1MqPWMgFjyepoJwa1l+Eb9FCMozNeNBzPrvN+oULwWNxb2rr8tMJYXAj2gxhpKIDmyzi0q4dQz6c54J5CWKl+44eV3Bv2tw95Obj82E8nj/SWk23FhEa0j+zJMDmbjv2nyjmzvjWWNkJ3VGRpZ9ioW24c5zu9Tk2pZThfKwNNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVDXLkxpt6u/yW1WmFhEIDOtImzXDVmeqqk5FhoINKs=;
 b=weSHeHZCH6eFtzg3cBMsGD3zA/Tm3bOt7v3FhzeBG5azT2A76KyOzuAten1SOJVLaWqBS14p1rEhEZQsFou7a6rI5+HoCbBI+Gee5NNJoJQ0Y/243AYUtE0Zs0zrNoAaqbgyVK7miPf8rUpRXzXFV/KMN1EbTKKbHVNmof+WDQ2Tnq+Yr17bbPXiQW5lweHVLXm6vsDkfUiP0XbKeUdeCYQsMPCMw/aI5aAHUCBf8rS/H0fo0SYEgn8LxX2VvCyNltqmbuxatMPw/A9/wDPqF1UR0nafm8k45wQMIT5V6d+VfaH4JX9nlvf1/tK24cRT46dzo1AToXDtQCHd88pQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVDXLkxpt6u/yW1WmFhEIDOtImzXDVmeqqk5FhoINKs=;
 b=ILWmgzAq4KUkFtn+NTvbuw6U/1HP9mAK7gfMbm62ey42MIJq9zQKK9lbsK9Ah5S/psDs5T/fpvgsMemMn3HRb5ht2fiArIw39UDwqtHORwlS325fbVdi67vsra99x5i07DZ5aim2MpaexsLAgqUqk1wFzYrpjDlJPmmK/giufAo=
From: Ryoji Okamoto <okamoto@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Ryo Takakura <takakura@valinux.co.jp>,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Ryoji Okamoto <okamoto@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] tools/xentrace: decode RTDS priority in repl_budget records
Date: Fri, 10 Jul 2026 15:43:52 +0900
Message-ID: <20260710064352.343914-1-okamoto@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:af::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1053:EE_|OS9P286MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: 643c0af8-8f7a-45fe-725e-08dede4e9c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|23010399003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	RjJwgEmU2fIr9+LccXA9wxIT3VFwA886BJBv2R9PqgTghBY5JK+SeSmyPRvsY5fYxXcvk+OQT+dVcDMQqdMxfbPauRK9aTF8p3pSRFw3GYB+HE7AxQTJCjjLQkGcLLPB0uy8D8ddZ66/NYHrj11mJ29JdW7rDfwi+K6fUrZNEfxEXEPMaDFv2D/Ly2GyLF141XXPBI7VhBW1GC2ViDYDnce//GDcqELj5kUYchIsuKPAnGiCAbUdrFvcORB3e3TWUx7fY8F8h6+YW7ut0FxGLTOwXfH1PttPhm811yWq6sVKH0PzYpVlLBi1v+k5q3VKisDkQXR9GrzqPtMOzfXaW1090G11PuARfxEhsE10DubA9b3oC6dy/t7O3H/rLXI72iOG5DQqwSb2D3Nk3p+zYlRzXgg45Zvqe1xdlYIcYkwZGZxlTDymgZT5yndHEkEND/QAiE++oJgVoHq6ytcLjOUk6QbbF+fXNEh9YBP49bPQO24QzeoNk3XlH3im5BO8UzjwsyP+hO4zcVK+V3p2huSf1VHGh+mVxEeH72EwfQTLONM7KYrlR4XOSyr1L2xrA8DDUIZOpkx5r4uppPdIsIEqYBWmzFFR6qJUza1qOdHed0Muxx1slqLxCbp3rv/nYpyIU5WKd+vlB5RY3CxxtGOMU9Yw1TjW9pmfMP5WTLA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(23010399003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?//DdluiC48F5aCbNbH4NL1tHOwKdzrWoP4LpYjL1PEKLPbMcdkertTkqTeZm?=
 =?us-ascii?Q?FxVnpoaithag70Y1VJUbCFHX9m529lH6gx674dto/o2OSagTCgLzjoGp1JPh?=
 =?us-ascii?Q?CeNFg8S1mwEpjXI3QQqOPvFKZPOiX9/hHqs3cf0HiU5Lazcc8dM/eqzEwyU9?=
 =?us-ascii?Q?mFM/+nKCdl3C3wlnOeC/81LMAowELaY0wFmEuOjdbNJZQgY9Pp1tf/Jlr4Qw?=
 =?us-ascii?Q?mzqI0dUUGfHkpwvMwhCJmDIRqERO25Zos27WwvjFLNXZqFdaP8Rd3CIwz8x+?=
 =?us-ascii?Q?I11wgTKUl9rmxUA6XBVM2EiLVMPx2ihx/UWafqgHD2Jsi75H1FvxhJuJ/dm3?=
 =?us-ascii?Q?g9wbrewnaw51/2Q+OjhfD3Jwgc/+a7ux+7ZQh5tNap+q3MqjNMmxrrr2M5VJ?=
 =?us-ascii?Q?OhdspEG6DOMlT+tdzettHK1hb780P8OddR29+P6kdfqfssICBurRn3DgE3Be?=
 =?us-ascii?Q?QnLhmWmSn5droB83UgIt+W/ydJUE6Q0ik/nyEHzhDpzT0ecIlmEsd8FI4Ek4?=
 =?us-ascii?Q?uII/fih5Wi6X+ezLHVPH1WoyHNAkJvUMVWXoSQoNvo0wWudetwHYgnArg9/w?=
 =?us-ascii?Q?fSg67q2TB8w7CgT3//cL1p4NAiPtuGxt6xHyciwboRKQHCoIVS4dLxdj/8wG?=
 =?us-ascii?Q?VHdCop9MUB0jxbdYYt8+OVVLWT3Wg9znnRL2OCOUUPDZgEKMxXJEijgx3Cnl?=
 =?us-ascii?Q?BvfoIZ2MrHWATMqEf819YgIRv3yF8p7KI40f+nfW4q1BU3gEzdVj0QhHDAUu?=
 =?us-ascii?Q?5k/YpCzvkeeIYnPicYY86OBqkKUBM+o52Ze+eaV44zGOxM5+czDvSCAUdj6w?=
 =?us-ascii?Q?O/1oYh0Y94wo7HKJv71lN5t1N+aytiwly8Rk1ZRm1pUZ1Lr3WOShA9t0PV0t?=
 =?us-ascii?Q?IAqBiabInnLEK/zPSvPQt+IEYifFjC/pZ0aRvyPed+RVN7OjTOCfkIPaI4NY?=
 =?us-ascii?Q?j8RknIQG2n0zQ5aaKI+YVmajxN8Xda4WtSmiJc3hwXu0Bn7+JGBcpwZUs0bL?=
 =?us-ascii?Q?XyGBY4a/aMuH5tCok1lRJZG04O3OmYZsHxvtPhpt002Sr2G8fe8NartNRIFw?=
 =?us-ascii?Q?nkkoVkaEvG/kESeJSuOzWwGEJTgMmrdI9V43nKXd9yFSh1Mh9FDcM1ugoaqY?=
 =?us-ascii?Q?OZI4K4ZpODoB/86fWvFRgOeZy4l3CARkpnMtIiwUNqH8ModM8mPuDXBGyw24?=
 =?us-ascii?Q?5mFufTVi3dlsSwJiWHSsGr7b6srsIGSYjTkVPKGhzJ21sWoQdy7edQGa7dIF?=
 =?us-ascii?Q?joHQg4QKyTWfOjE8A1f5cZLTgTUa2BIOHlYuzXS9p2xwxP/6AppRnFg/CFI+?=
 =?us-ascii?Q?0T4gKyf/ECtN8bKgfCzFaJkjku8b99ZdfSSAnIcClxynDnDqZheIx9mWjNqa?=
 =?us-ascii?Q?DxMtix/0fXUInfxGeakOz5l/OsSOW1adVVXhNx5lWlOS0jBiij6KsqWApiLP?=
 =?us-ascii?Q?cmpktSlvUI3nMtI4UZXjYol1kU2DTzFW6Q4og9i1wjcLh1G1SFKVe1EIORC8?=
 =?us-ascii?Q?grEUL1Ns3+yf2o2rEKSq1hyVZztAcQoM/DOwN832SRWBZdwxnTnuDCuQuBc5?=
 =?us-ascii?Q?zZf81XOUqtfRHF+XIkhdF+1tpq3BlwyX/cBQN79xAkO3zIH6WxR8Qmi8kgSS?=
 =?us-ascii?Q?t3uEQM3Jcmuc3u7q/elUt3eVqK6rBDL/225p4DfRc3XV+EXq84jF2ZwMw52B?=
 =?us-ascii?Q?ZZe3ET0MxSoXLS5IE+V5Lw81CAVwbb4KqKuvMetuKGX20xjGEqnTDzJtneH5?=
 =?us-ascii?Q?QMO73JzeqcqZGINdqM8Dxzalas/dMkuWc/fe8AvIwMacscwm31lLhXSCfK5I?=
X-MS-Exchange-AntiSpam-MessageData-1: fsM5gR5ZU+oKxA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 643c0af8-8f7a-45fe-725e-08dede4e9c31
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 06:43:54.8258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1eeKpnb0jy02RL+UqkIkIeWwDwDg9MMjR+6uaTExOFwVYt8K0HghkioThGOZ0i++4QbXAYIGX5Ey+fiVKBCSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4752
X-purgate-ID: tlsNG-ef75cf/1783665840-D3B61201-C4C6775A/0/0
X-purgate-type: clean
X-purgate-size: 1797
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
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:takakura@valinux.co.jp,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:okamoto@valinux.co.jp,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:from_mime,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B69B737CBA

The RTDS repl_budget trace record now contains the vCPU priority
level. Update xenalyze to account for the additional field and print
it when dumping the trace event.

Without this change, xenalyze interprets the record using the old
layout, causing the deadline and budget fields to be decoded from the
wrong offsets.

Fixes: 463b95831778 ("xen:rtds: towards work conserving RTDS")
Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>
---
Changes in v2:
- Add "Fixes" to point out the commit which introdued the priority in
  trace in commit message
- No code changes.

And thanks to Jan for kindly pointing out the formatting issue in my very first patch submission.

 tools/xentrace/xenalyze.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 42feeb282e..439066e352 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -8039,12 +8039,13 @@ void sched_process(struct pcpu_info *p)
             if(opt.dump_all) {
                 struct {
                     unsigned int vcpuid:16, domid:16;
+                    uint32_t priority_level;
                     uint64_t cur_dl, cur_bg;
                 } __attribute__((packed)) *r = (typeof(r))ri->d;
 
                 printf(" %s rtds:repl_budget d%uv%u, deadline = %"PRIu64", "
-                       "budget = %"PRIu64"\n", ri->dump_header,
-                       r->domid, r->vcpuid, r->cur_dl, r->cur_bg);
+                       "budget = %"PRIu64", priority = %u\n", ri->dump_header,
+                       r->domid, r->vcpuid, r->cur_dl, r->cur_bg, r->priority_level);
             }
             break;
         case TRC_SCHED_CLASS_EVT(RTDS, 5): /* SCHED_TASKLET    */
-- 
2.43.0


