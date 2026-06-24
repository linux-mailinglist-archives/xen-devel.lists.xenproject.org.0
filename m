Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DMHrLSNSPGpzmggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 23:54:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BDB6C19F8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 23:54:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Vw7dzrXr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345212.1604142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcVXD-00029t-Kt; Wed, 24 Jun 2026 21:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345212.1604142; Wed, 24 Jun 2026 21:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcVXD-000278-Ei; Wed, 24 Jun 2026 21:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1345212;
 Wed, 24 Jun 2026 21:53:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wcVXB-00026z-Rf
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 21:53:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcVX9-00HPnd-JO
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 23:53:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a3c51c4-e002-0a2a0a5209dd-0a2a4509d3f4-4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 23:53:23 +0200
Received: from [52.101.52.54]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a3c51d1-97e6-0a2a45090019-34653436c161-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 23:53:22 +0200
Received: from SA0PR11CA0166.namprd11.prod.outlook.com (2603:10b6:806:1bb::21)
 by CY1PR12MB9601.namprd12.prod.outlook.com (2603:10b6:930:107::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 21:53:18 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::31) by SA0PR11CA0166.outlook.office365.com
 (2603:10b6:806:1bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 21:53:15 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 21:53:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:53:15 -0500
Received: from [172.29.28.188] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 16:53:14 -0500
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
 b=CwDhRcGTlagPWVD+XMrhZsowu9t8ic3CesuDa6DLsMUNHhpQK281dnjqUVDgn0cXLJVTO+aoy8bQkNKfZA2Zus1AWAyQ75e1JLGFJa8Tw0C91Ykp48auWTYrvPj6YV1uG4Rx2uVt9knuJpIaP1OIQrCqjBLbefCQP2YYMQO6sXBAj3CPV0/F8ZtM/2e6nqncyrauOxCzQlv0IPD+NUCl747xMGRG9CJ2lqBQIg2ODJ7V44tO0fD4WIHYEGbPkRAFjsZnkESzCbZ4TPjhoHtWTvaErXu/mIJuIpQ0WJ8vlrKWBzx+IJMeMjACy+MVaGmqbUeV6f8HfxMQ3U6oR3PO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhalz+7BYTdPOWbW0ONIYkoR12nFQHc/+tftpNSbEwo=;
 b=Qe16LhM6a1NwH9SPclW5X3vw3NF0XdOenUWZtS+zpwa3pdkx4buREJJ7wQffON4FDvjMaK4sjllBjhlmwrld0aJSRhc6G9oR0q3p8iq1FNRjBZf2L7+S+xCKd4gw/fjc0P1xWzBzisZzvEwYl2mYbhMxnrRqYv8rxXhWc9YQmwAcXxBqIHkc7bz1UsB1Tlp/7Jh3fpAAEG3R2MeB+9OIXtWaFNDrTykSmv6z2hCJ8aozW7SFGHd3A1hX0uKXZySrUKla+5FLxQPA/kMb4Nsf3WGnPUCOHLE5Dc/x7yDHjLmshxIGlzfR2ZwMpjbOeHyR/O5ngSly14nCQgE+G4VU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhalz+7BYTdPOWbW0ONIYkoR12nFQHc/+tftpNSbEwo=;
 b=Vw7dzrXrpQe0NTiuiceoT34YYuQIhN3X/GET4cBStvm8V1yPCHL1NMS+BQWGraMroSkBUuKj9O1KS8fV8DLBmjirddMn9E/pQ9ka9RGetxiJ280FqWzhYqHAmJKUD9ARJnT+U0Gin8pQE71HvGuiTcvGizfCC36B2dUFqw/9Z5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <eb5a3c83-c470-4c81-b64f-09eaef4131e9@amd.com>
Date: Wed, 24 Jun 2026 17:53:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <6a3bce99e5494_767442bc3001679a440720@prd-scan-dashboard-0.mail>
 <ee48e27a-049f-43b9-87dd-c9188db26f30@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ee48e27a-049f-43b9-87dd-c9188db26f30@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|CY1PR12MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e16fdd2-bd7a-4f4f-ad26-08ded23afeba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pDX/8j8ZhTYy0Rq3zd/+dnpxlgaKS35GFeJQ2OHjSRVBeA2OpWqofV0lS4nKwyT5dIF6UND4QJQL0f4rXiEnFo3wd1SuZNMV0EtWXv1h70uQxrVNjf8z0577EtJJ9TkNdWRZ8qe1O2pCM/H1FlD5op5oUB/eI2VC1SkcRB/S+bIPpQHwXfOMZYE2eFpgJBB16FBtdP9bvJpDvZOi7yXQmm6vDabqDBKmGcqc404mAuQ+i9PiO+42Epo6Vqd1D5O2+i9XZlPN277xSkwH/VQw8G6rYxfhw+x7EfT6xEOJU3U+r1kOdx8WHBkSBKq5JLhdV+M9YaJnvwlnSLZequhM0KVByAzitXtLQI59dyUb3aB0Mn3EFl3TjkkE0QL8rFR+kPWu+oXspFQgcj9DxTFm594yxjoOVv8xwR2PirM1wuorQCJq4lRbWU5DecMzOpONJa5GCG9BUQs5q/dregO3V/q78kHosB9KseA7ApVcEs7fOVPYqkM5RzCjgQ5thc9v083O61Xw1x4dbUqP9LvfuVZvGseTcXOR+bIqVdBatoLCNHYqp/vT/xWdlzqLi0bPvMuaYcesbVsJS9IYlN075p8HDlTeZ0HyKgUJb/gKrPdz16ymUjkxhjS3J5UqafAYvfoZqSVbZH1Rb5CShArTF2k3tvfPfms9KNhfemnW+5tLRmEnk71yO+yksO80jcZppQErGv+jFxbUSM6ALirI3A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	duvvXeYtAeoXptwpAVDy5EATTxfjTDPbcz8SEQcWWF42zmVMUozNnnF/U/f8uZe70W+C8BzzVFuCtOK5+xSlPxgstt0SUupFfIcBMBcYEu6mjzyI3uFM9skhTT4nQRwS70T6/B5pJI7jolIJI5jyoyVvBS/TLN1EobsW394GDHlKuuf9yiFZ/N3f5LxZzRze8C5UKES8GjeP7mRqeSinHS+ZN6OsfluHvZCYQdQPMA7526dDhNMjVgApZD/BVl/rWNWVoKY3a5VXUVgNNCSmh6fAzEg3hPw46DrkJboj2A01meNptsJS6+5gX7fwncHOxuKfnETu4s0xVBqSs9FN/fb3TdEOYDuDQ9T4ZYrrK+frJu0VNzqzGvAPc3iV62ZwJgOThzpfGI9HVKMhXWDLApV978tOjtjxO4CpKt54AcZ9DWMjdAeA1nz1Fy4Na7wm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:53:15.6175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e16fdd2-bd7a-4f4f-ad26-08ded23afeba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9601
X-purgate-ID: tlsNG-bad1c0/1782338003-44F2D986-E93C309B/0/0
X-purgate-type: clean
X-purgate-size: 1615
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,coverity.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18BDB6C19F8

On 2026-06-24 09:04, Jan Beulich wrote:
> On 24.06.2026 14:33, scan-admin@coverity.com wrote:
>> ** CID 1695359:       Insecure data handling  (INTEGER_OVERFLOW)
>> /tools/xenstored/domain.c: 601           in domain_tree_remove_sub()
>>
>>
>> _____________________________________________________________________________________________
>> *** CID 1695359:         Insecure data handling  (INTEGER_OVERFLOW)
>> /tools/xenstored/domain.c: 601             in domain_tree_remove_sub()
>> 595     		node_changed = true;
>> 596     	}
>> 597
>> 598     	for (i = 1; i < node->hdr.num_perms; i++) {
>> 599     		if (node->perms[i].id != domain->domid)
>> 600     			continue;
>>>>>      CID 1695359:         Insecure data handling  (INTEGER_OVERFLOW)
>>>>>      "8UL * (node->hdr.num_perms - i - 1U)", which might have underflowed, is passed to "memmove(node->perms + i, node->perms + i + 1, 8UL * (node->hdr.num_perms - i - 1U))". [Note: The source code implementation of the function has been overridden by a builtin model.]
>> 601     		memmove(node->perms + i, node->perms + i + 1,
>> 602     			sizeof(*node->perms) * (node->hdr.num_perms - i - 1));
> 
> I'm struggling with this one: As i < node->hdr.num_perms, the last argument
> passed to memmove() can be 0, but I can't see potential for underflow.

This gave me pause on my initial review.  On the final iteration,
node->perms + i + 1 will point past the end of the allocation, but as 
you say the size would be 0.  I originally considered suggesting a check 
and then decided it was unnecessary because of the 0.

Regards,
Jason

