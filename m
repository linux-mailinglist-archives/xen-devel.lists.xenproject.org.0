Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WYKDI9lcKWrrVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A543366967B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=vf1bzzP3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334278.1597426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKs-0002wn-AW; Wed, 10 Jun 2026 12:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334278.1597426; Wed, 10 Jun 2026 12:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKr-0002lR-HU; Wed, 10 Jun 2026 12:47:09 +0000
Received: by outflank-mailman (input) for mailman id 1334278;
 Wed, 10 Jun 2026 12:45:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJY-0001H0-0X
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJX-009EBh-DE
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c6f-bab6-0a2a0a5309dd-0a2a450cbe3a-48
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:47 +0200
Received: from [52.101.69.83]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c7b-62f1-0a2a450c0019-346545532a7e-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:47 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:44 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:43 +0000
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
 b=sFENJWjp6vpe4JCg7uBY9k2rtKuOblzWkiatvKfjejCivJ7qPqUTDQQxk2X/JuZF2WhlX/YhxFK8WRxIRaS0QPsyyAiG+53Blw6Oq5Gty6O3KLu2FjdMAnPyWtRAlgT1a9QpcmwGGFtV/lH0V4nOudjflWj1FdSEQ30ckNc8hS7SJ5C6p4ZdGdaFyBwYBVLi4Uuo0dWZ5oxCXg4WmCyUy9qmzKfpdRAoT7Avtaqc4fh6jOWuiIqJi2OkePViPlhWmnhRToN+KYj+GVWfZg1u2PslEBrJyVa9ziclP76f0+3Lbu0cq/0RPKmdik87+OPEFR5IelClfwu/9sWWKiNqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFuYFSOecUKDErsyX3reeE5XOMbs8qgQiXdEZieBcHY=;
 b=blQROoOMJZ7uSE9krhXyjGBFMwJuHgm5mkdCtGRXLLQ4YLSrGfKReaW8Y3HV0dU5zUbB6SV0As3cwR2uuVk0RA5SJgl4UreNGa6fCHtAo3Frh1pLUXAwPRK8fLhe6MxInAMP4yEYD9/XWE+eKVwm+n9N1OXaRCSx/zJoyots7YPp8vdOpdxmvURqm+PB13uSvHcMP7Iroz/fjIE123fsJDKm8OMTNU5BJ+PafRn2KWtXvev52Sg6UYcSA+Gc7HZIXYUKghDi0PS5QoKtEyRHAzFjZac3y8C9U52dSnLgTgiYPD8GeX7Xve9Jqzsh/RO0adLoP31Gwrw7TNi39XdVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFuYFSOecUKDErsyX3reeE5XOMbs8qgQiXdEZieBcHY=;
 b=vf1bzzP3hn6FuGn4+11tNRiwiU2KvnOOOuA/DaOnK+4XdRvWbB/9MtjnNh9FwNry8jd7GTmYvMncT1vsla+FAkhAJ9DI3mOD9Q8bs0eT6q/070u7ES7RLiwB7b+tkvCqLxLnrGal9kkbE1rkidj2G61isfDAErzylULZC50tIK/FGBNzoSE7FCT5SarWemBf+cY6JNjWFI6EHhXei5ctzag47cGn/n9YFodyg4aewbIhA8P6Hbyeuj/8UEEOVS8oG5D7hdO4NicK4YzyrDY9FsQV2kgpfxIEJpm9fKZHH4xvoMq1RXWWEVHs/9TYulBLiS0wJvSQkBAjv9DztE01Jg==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v11 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Date: Wed, 10 Jun 2026 15:44:32 +0300
Message-ID: <b8b3675b0c8993349d829becabc2267fb755f5a8.1781084290.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781084290.git.mykola_kvach@epam.com>
References: <cover.1781084290.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AM9PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcc0362-d773-4f48-2cc7-08dec6ee2f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TyMmcxTH3pgd1/LNPkFM2wW0B245+U+dPGBk47RHt833trsJoQt0XBmtq9DGfxpBHXPE0GwwVjRKoFdjkzSRdkawrvsZnp6YE0VfieRt6trSFpGpW7GH+Kymjzz67069GsU0nCEsXXeiiLpTs8uMtAYQD3SJ2lbEz3OCJYrY0wlO9LZPkiErvm34YTwS+ZEbdNYSTdhSOx0Psx3jnWcmN8VQOEGS86kVKdeIpzIlF78MH4q/ot5HI+6ooIhEydic3Dk/35Hm29/U1f3/vay85DLtBXCgtbytXQpcEOMEK0EwlqruYv1QDuvFmztBb9AtHXezNwVxxlLB3J/f4YqBEtDMYwcCxnq/nhNsTjCgSJZbTlZtkOWOnvspPlJEbdWNgLGhwcFF6EeQF0WlWPJ4kWV/Utf+1zQtkGU9JAfjZtUtCOdPVPTXZGYJmDYfeem/fv8H7Mx2vndcSnUQvZ3VtQqwXoo3/te5P0qNsjTxVGR8F1BSGMtjxK+taosXN6uFCqYbzNY8231gHU93GqCUu57bWGTKMD1ClAwK/2+DX+5qkMrFDtnNUG19c56WJtnYQHj/HAhAhHWjpPkV9PkKTTwiWXmVOgtf46mGPXyKdTROEC2cqJiy4PBU2O02CgitYe9Mjze0OBG/wvn7NSF0CmsDiav4rKHeAJSrK4qpkl4jZj1bSo2KX50GR+4sTQoo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5HTXcxKUqjp3vh2bOV6qGzGSDyq0LoSZTfQaL3OLG+xg6URedz6/MRdXWQIt?=
 =?us-ascii?Q?kR9FCxUmoir3wd8ac2OEyn6YJvmK3T+Z11wZ3K0dDI3lfkjL95wSftNkZC/c?=
 =?us-ascii?Q?JVK/gXCg49WZqT2np3HHVMIZ5IhqCN+xPql0hGTVPgpK90iKE5v/A8dcBVlG?=
 =?us-ascii?Q?AZTsQKezasQTPXTW8npen7PocQvTd5sy8Xv0Dsh699jAGku0orM2j79d7CJ7?=
 =?us-ascii?Q?v+1u+zVUqcBHjkknDUqWSSuLNIPshgk5SYf3EN8XoaEgK/1OwGzD0LbqJ+2r?=
 =?us-ascii?Q?G+95TLiDY5rP1rlorUdDjo1da3kWIIGNxXQJkx8peDWWDTLw2xH5bclVZ6ks?=
 =?us-ascii?Q?ShC8pO+ObSA9Fjdx6CWkecaac9VD3V2W2GOf/k3RLXQ6zppTFLPKSpTHun4w?=
 =?us-ascii?Q?//7O71XmYuOZMoR7bcQYo3L3Y9J/IBbPvbu3NK58/8yyTd0Dq7rnN745ytQ2?=
 =?us-ascii?Q?As/zA2+Edw6vbPSIQJQvmRnj+7UydB+f810uSZtwLtSfq+D6L5ju+pfsXATZ?=
 =?us-ascii?Q?JFdRt/m1Q2ec3ho+8Z4GIWh3X0wrZlTpcrAUHXTuuZdNgNLK50/BsqYWHW/A?=
 =?us-ascii?Q?k0wGQUIX4V4SdZflbRRtS5sJdfE41WVjC9HdJz38dtySgAyszZOIMMN11XVj?=
 =?us-ascii?Q?qA5MgiX3tVHWPhOp6oU6r1VWuLUFhm+LwSX5Imh7cEiP61fN+jC1a8olrmqB?=
 =?us-ascii?Q?kNEwx+ee1SE+N8au2zPs60Pc8tW8B5rAudZ3q733r/SONvG2FmPIeHOrenAb?=
 =?us-ascii?Q?18DLa3pAzsbOIFJ5rgVc/v4q1+pqCVcjUi7gPcwy+B4+5knKgQZyIdypE+Bb?=
 =?us-ascii?Q?H5iHmVuYrzB6ZYLLSqUtwroa+hn9C0QWTJdTXicDCcMCR6O4Chiib9qAhgSr?=
 =?us-ascii?Q?bqF+wOsdTeWqCNNfzxNmLLrtFbevrKhbxqSPT4OzQx76WR30jlDsWwz1Ka5u?=
 =?us-ascii?Q?/08aKFtX5JSvn3WYztXVL0wU/sPBqLKxp+VEWpKywFwJyp1RX8aYvZNqX+iF?=
 =?us-ascii?Q?p+Gf/b8DMWMRLe368Czugv0sZ5ENWFf+GI0Thv0uB52Z7KCZXc17iAiWK83O?=
 =?us-ascii?Q?GhefZ+B3Rxi2j8S1un4QZY+FTE4BGK03Laynpld8ux1eE7booMSYbKbNTAnb?=
 =?us-ascii?Q?IOFRoRr/Vhgl+uo1fKm0JJ2EIeRupZna22e0DHG3QbMznle4RGMoa8y6EmbR?=
 =?us-ascii?Q?VxhCCJi96LzbZ/7RMZw1V3/aQanYOPUL5k1H4IIERmUWpodazJsVnLJsC0zj?=
 =?us-ascii?Q?OswQ3NfoPPppHEnN6mLzblU6ePPnOHwQqxNraEipM4+9KgK7DrIaJVqf8Tn/?=
 =?us-ascii?Q?N6WMFCR8gpKb2HNtsoDTDQAwMvDvPYwUgSVHFniFiPTUMp4DY/poIeMSUzFH?=
 =?us-ascii?Q?9H6J64cWsIs8UT9OOianXXdT+p4AxLeeS9jsGOeuqOYQb2mTgyFocEFr4bCN?=
 =?us-ascii?Q?vxZpd3SQ3t2nUQPPZZfHnLGse2aRwX2Vfvp0HjvT29hFLHG9N+ILk8H9G23h?=
 =?us-ascii?Q?ltP+fiXu+U1JoUanTQKz3SuKxX0mb18ll5e1w2bjKDDudBWUQAsYV5rqDADD?=
 =?us-ascii?Q?iTefchPl18IkhAX35pHv+bsU6iZjT6nb0/UWDLlsy9WTYtfjh6gR+v2OUB7w?=
 =?us-ascii?Q?tCHgZDINwGNdbn7z4bOGFURuTzOyTaFe2Iww49R1mHwA/ydbd8PX4JtvuvGz?=
 =?us-ascii?Q?Rv+UT/wUBoCjf8Wg2EzqMwpBSeLFZfBjwZ1HZPViORGz0op6mYPpI2LytCVE?=
 =?us-ascii?Q?RV9w8zKWFQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcc0362-d773-4f48-2cc7-08dec6ee2f2f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:43.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIjjPsG15CZbmm8eSRrGvim933OrgHzOuk1QBbaaoLlfitAc85+YOFSqPwfW2+U8W5qzWiEbwm6jEyWyidBRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-d25034/1781095547-DB370CF5-FA17FB19/0/0
X-purgate-type: clean
X-purgate-size: 18210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:rahul.singh@arm.com,m:Oleksandr_Tyshchenko@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A543366967B

Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
capability for platforms where the hardware domain can be parked with
SHUTDOWN_suspend without calling hwdom_shutdown().

Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
non-control domains, including the hardware domain when it is not acting
as a control domain, the call is handled as a guest/domain suspend request
and parks the domain in SHUTDOWN_suspend.

Control domains need additional sequencing because their SYSTEM_SUSPEND
request is used to coordinate host-wide suspend. A non-last awake control
domain may be parked in SHUTDOWN_suspend without requiring the host
suspend path to be available. The last awake control domain is treated as
the point where the request becomes a host-suspend request, and it may
only proceed when all non-control domains are already in SHUTDOWN_suspend
and the host suspend path is available.

Keep the control-domain sequencing and domain-readiness checks out of
PSCI_FEATURES. They are per-attempt runtime conditions rather than stable
PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
vPSCI and report attempt-time policy failures as PSCI_DENIED.

Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
so that SHUTDOWN_suspend from the hardware domain can be treated as a
domain suspend state rather than as a hardware-domain initiated host
shutdown. This does not by itself imply that host-wide suspend is
available.

Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
capability with runtime blockers reported by Xen-owned subsystems. Add
runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
paths lacking suspend/resume support. These blockers are runtime based,
so they only apply to drivers or paths that Xen actually uses on the
platform. For SMMUv3, the blocker applies only when Xen actually uses the
MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
registers yet.

Add a struct domain forward declaration to xen/suspend.h so the generic
header can expose arch_domain_resume() without requiring a full domain.h
include.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
---
Changes in V11:
- Mark host_system_suspend_runtime_allowed as __ro_after_init.
- Avoid printing the SMMUv3 MSI IRQ host suspend blocker more than once
  when multiple SMMUv3 instances use MSIs.
- Wrap the Arm IOMMU host suspend blocker in CONFIG_SYSTEM_SUSPEND to make
  its policy-only use explicit.

Changes in V10:
- Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
  control domain cannot proceed to host suspend, keeping PSCI_FEATURES
  stable once SYSTEM_SUSPEND is advertised.
- Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
  control domain.
- Mark serial_suspend_available as __ro_after_init.
- Mention the struct domain forward declaration added to xen/suspend.h.

Changes in V9:
- Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
  so that hardware-domain SHUTDOWN_suspend support is not tied to
  host-wide system suspend availability.
- Add runtime host suspend blockers for Xen-owned subsystems lacking
  suspend/resume support.
- Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforce
  control-domain sequencing in the call handler.
---
 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/gic.c                    |   6 ++
 xen/arch/arm/include/asm/psci.h       |   3 +
 xen/arch/arm/include/asm/suspend.h    |  10 ++-
 xen/arch/arm/psci.c                   |   7 ++
 xen/arch/arm/suspend.c                |  40 +++++++++
 xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
 xen/common/Kconfig                    |   3 +
 xen/common/domain.c                   |   7 +-
 xen/drivers/char/serial.c             |  12 +++
 xen/drivers/passthrough/arm/iommu.c   |   6 ++
 xen/drivers/passthrough/arm/smmu-v3.c |   9 ++
 xen/include/xen/serial.h              |   1 +
 xen/include/xen/suspend.h             |   2 +
 14 files changed, 208 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5fa89fcb24..9acd342f09 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
+	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 7727ffed5a..60488c95b4 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -26,6 +26,7 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/gic.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/acpi.h>
 
@@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(void)
 void register_gic_ops(const struct gic_hw_operations *ops)
 {
     gic_hw_ops = ops;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("GIC driver lacks suspend support");
+#endif
 }
 
 static void clear_cpu_lr_mask(void)
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index bb3c73496e..142fa1bfe5 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
 int call_psci_system_suspend(void);
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void);
+#endif
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index c848fc6340..50dc6e9fdf 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
 
 int prepare_resume_ctx(void);
 void hyp_resume(void);
-#endif /* CONFIG_SYSTEM_SUSPEND */
+bool host_system_suspend_allowed(void);
+void host_system_suspend_disable(const char *reason);
+
+#else /* !CONFIG_SYSTEM_SUSPEND */
+
+static inline bool host_system_suspend_allowed(void) { return false; }
+static inline void host_system_suspend_disable(const char *reason) {}
+
+#endif
 
 #endif /* ARM_SUSPEND_H */
 
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index e05dae1133..e9d78668fd 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void)
+{
+    return has_psci_system_suspend;
+}
+#endif
+
 int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 6ea4a0f9cc..c7c26bcf03 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,9 +1,49 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/lib.h>
+#include <xen/serial.h>
+
 struct resume_cpu_context resume_cpu_context;
 
+/*
+ * Non-PSCI infrastructure can make host suspend impossible even when the PSCI
+ * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has no valid
+ * suspend/resume path.
+ *
+ * This gate is checked only when the last awake control domain attempts to
+ * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
+ */
+static bool __ro_after_init host_system_suspend_runtime_allowed = true;
+
+static bool host_serial_suspend_allowed(void)
+{
+    if ( serial_suspend_supported() )
+        return true;
+
+    printk_once(XENLOG_INFO
+                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
+
+    return false;
+}
+
+bool host_system_suspend_allowed(void)
+{
+    return psci_system_suspend_allowed() &&
+           host_serial_suspend_allowed() &&
+           host_system_suspend_runtime_allowed;
+}
+
+void host_system_suspend_disable(const char *reason)
+{
+    host_system_suspend_runtime_allowed = false;
+
+    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
+           reason ? reason : "unsupported suspend/resume path");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index ac6af6118f..0bae42c1bd 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -5,6 +5,7 @@
 
 #include <asm/current.h>
 #include <asm/domain.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+/*
+ * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend transition,
+ * so multiple control domains cannot all observe each other as still awake.
+ */
+static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
+
+static bool domain_in_suspend_state(struct domain *d)
+{
+    bool suspended;
+
+    spin_lock(&d->shutdown_lock);
+    suspended = d->is_shut_down && d->shutdown_code == SHUTDOWN_suspend;
+    spin_unlock(&d->shutdown_lock);
+
+    return suspended;
+}
+
+static int32_t domain_psci_system_suspend_policy(struct domain *d)
+{
+    struct domain *other;
+    bool last_awake_control_domain = true;
+    bool awake_non_control_domain = false;
+
+    /* Only control domains participate in sequencing policy. */
+    if ( !is_control_domain(d) )
+        return 0;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( other )
+    {
+        bool suspended;
+
+        if ( other == d )
+            continue;
+
+        suspended = domain_in_suspend_state(other);
+        if ( suspended )
+            continue;
+
+        if ( is_control_domain(other) )
+        {
+            last_awake_control_domain = false;
+            break;
+        }
+
+        awake_non_control_domain = true;
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    /*
+     * Another control domain is still awake. This request is only the first
+     * phase of the sequencing: park this control domain and leave the host
+     * running. Host-wide suspend gates must not block this intermediate state.
+     */
+    if ( !last_awake_control_domain )
+        return 0;
+
+    /*
+     * This is the last awake control domain. It must not be parked unless the
+     * request can proceed as a host-suspend request; otherwise Xen would lose
+     * the last domain that can coordinate the system suspend.
+     */
+    if ( awake_non_control_domain )
+    {
+        printk(XENLOG_DEBUG
+               "SYSTEM_SUSPEND denied for %pd: non-control domains awake\n",
+               d);
+        return PSCI_DENIED;
+    }
+
+    /*
+     * Host-wide gates are relevant only for the last-control-domain case. They
+     * must not block parking of a non-last control domain, but they must deny
+     * the last control domain when host suspend is not currently available.
+     */
+    if ( !host_system_suspend_allowed() )
+        return PSCI_DENIED;
+
+    return 0;
+}
+
 static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 {
     int32_t rc;
@@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
-    if ( is_hardware_domain(d) )
-        return PSCI_NOT_SUPPORTED;
-
     /* Ensure that all CPUs other than the calling one are offline */
     domain_lock(d);
     for_each_vcpu ( d, v )
@@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( rc )
         return PSCI_DENIED;
 
-    rc = domain_shutdown(d, SHUTDOWN_suspend);
+    spin_lock(&vpsci_system_suspend_lock);
+
+    rc = domain_psci_system_suspend_policy(d);
+    if ( !rc )
+    {
+        rc = domain_shutdown(d, SHUTDOWN_suspend);
+        if ( rc )
+            rc = PSCI_DENIED;
+        else
+        {
+            rctx->ctxt = ctxt;
+            rctx->wake_cpu = current;
+        }
+    }
+
+    spin_unlock(&vpsci_system_suspend_lock);
+
     if ( rc )
     {
         free_vcpu_guest_context(ctxt);
-        return PSCI_DENIED;
+        return rc;
     }
 
-    rctx->ctxt = ctxt;
-    rctx->wake_cpu = current;
-
     gprintk(XENLOG_DEBUG,
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
@@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
     case ARM_SMCCC_VERSION_FID:
-        return 0;
     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
-        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
+        return 0;
     default:
         return PSCI_NOT_SUPPORTED;
     }
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..816a1a4ecb 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -140,6 +140,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_HWDOM_SYSTEM_SUSPEND
+	bool
+
 config HAS_IOPORTS
 	bool
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f2bfcae28..a8750c3839 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1377,6 +1377,11 @@ void __domain_crash(struct domain *d)
     domain_shutdown(d, SHUTDOWN_crash);
 }
 
+static inline bool want_hwdom_shutdown(uint8_t reason)
+{
+    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
+           reason != SHUTDOWN_suspend;
+}
 
 int domain_shutdown(struct domain *d, u8 reason)
 {
@@ -1393,7 +1398,7 @@ int domain_shutdown(struct domain *d, u8 reason)
         d->shutdown_code = reason;
     reason = d->shutdown_code;
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
         hwdom_shutdown(reason);
 
     if ( d->is_shutting_down )
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index adb312d796..e5348b5445 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
 
 #ifdef CONFIG_SYSTEM_SUSPEND
 
+static bool __ro_after_init serial_suspend_available = true;
+
 void serial_suspend(void)
 {
     int i;
@@ -513,6 +515,11 @@ void serial_resume(void)
             com[i].driver->resume(&com[i]);
 }
 
+bool serial_suspend_supported(void)
+{
+    return serial_suspend_available;
+}
+
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
 void __init serial_register_uart(int idx, struct uart_driver *driver,
@@ -521,6 +528,11 @@ void __init serial_register_uart(int idx, struct uart_driver *driver,
     /* Store UART-specific info. */
     com[idx].driver = driver;
     com[idx].uart   = uart;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !driver->suspend || !driver->resume )
+        serial_suspend_available = false;
+#endif
 }
 
 void __init serial_async_transmit(struct serial_port *port)
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
index 100545e23f..461e01703e 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/suspend.h>
 
 #include <asm/device.h>
 
@@ -46,6 +47,11 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
     }
 
     iommu_ops = ops;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("IOMMU driver lacks suspend support");
+#endif
 }
 
 int __init iommu_hardware_setup(void)
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 7f1d00fb81..16947a12f2 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -91,6 +91,7 @@
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
 #include <asm/platform.h>
+#include <asm/suspend.h>
 
 #include "smmu-v3.h"
 
@@ -1866,6 +1867,7 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
+	static bool __ro_after_init host_suspend_blocked_by_msi;
 	struct msi_desc *desc;
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
 	struct device *dev = smmu->dev;
@@ -1910,6 +1912,13 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 		}
 	}
 
+	if ( !host_suspend_blocked_by_msi )
+	{
+		host_suspend_blocked_by_msi = true;
+		host_system_suspend_disable(
+			"SMMUv3 MSI IRQ path is unsupported for host suspend");
+	}
+
 	/* Add callback to free MSIs on teardown */
 	devm_add_action(dev, arm_smmu_free_msis, dev);
 }
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 8e18445552..418b00ead0 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
 /* Serial suspend/resume. */
 void serial_suspend(void);
 void serial_resume(void);
+bool serial_suspend_supported(void);
 #endif
 
 /*
diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
index 6f94fd53b0..a941331035 100644
--- a/xen/include/xen/suspend.h
+++ b/xen/include/xen/suspend.h
@@ -6,6 +6,8 @@
 #if __has_include(<asm/suspend.h>)
 #include <asm/suspend.h>
 #else
+struct domain;
+
 static inline void arch_domain_resume(struct domain *d) {}
 #endif
 
-- 
2.43.0


