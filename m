Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kwAWJLkXFmr2hQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8BF5DD06D
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320181.1587568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznT-0004wb-PW; Tue, 26 May 2026 21:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320181.1587568; Tue, 26 May 2026 21:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznT-0004te-Lf; Tue, 26 May 2026 21:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1320181;
 Tue, 26 May 2026 21:58:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wRznS-0004iY-J3
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:58:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRznR-00CFSu-V4
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:58:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161713-bab6-0a2a0a5309dd-0a2a4506eb32-38
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:45 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161794-7371-0a2a45060019-94a38ff17416-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:45 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QLjmSm426838
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:44 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4edkqj82af-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:43 +0000 (GMT)
Received: from SJ0PR03CA0061.namprd03.prod.outlook.com (2603:10b6:a03:331::6)
 by IA1PR16MB5456.namprd16.prod.outlook.com (2603:10b6:208:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 21:58:39 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::af) by SJ0PR03CA0061.outlook.office365.com
 (2603:10b6:a03:331::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 21:58:38 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 21:58:38 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QK08vu657994
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:37 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4ebx4s35y4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:37 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id RznHwWjCutNm4RznHwiaTM; Tue, 26 May 2026 21:58:36 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=Jx0
	pRbwqLwu7lyevOfiEqPs8vsOpi5AqYJ22rIZsQkQ=; b=PQPPJie115nDhWPGle6
	vMGbk3tEJyRHcwoReL3HWgnOX9Sh1htFDSa3Z0SPt9gWYkPqBJrYZpcssIVl+saq
	cYSBHwc+tIKBBYx6Xaq52XOp3qcc1wsijx/2hYapM7NdK3OhpJaOByO0AHBsf0ke
	MFeyl+A2kVSylkz1OdMucExm0VtblGeYAbJvDv1v4pyXGmZ8iuvN6EvWERDvCPlQ
	g0b46PNWfoy5JYkgC6iOOvQtxUIkSG1oF/4YmJCWgfBjnOQM2SMKE//qKv5vofNz
	VhunUuwLU5G+xbJiWX4kinL+yzpQ1D2UX4C7qbZzLFfXOOzerEMBahLxwAAlubZ3
	8xg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPXl3lQWkKCfeMCxWLXpEg2RbCdkiElhe2umqQf0lQQBqMPW+wW+U/QnKToYn3lWh3SEQGvTeMLHrZdQAICdBRKK9GmH/FdWYcd7xnGF7g8siIqWD11pheJOd+C7BzXmoWxNl+/dVv67GEhdF0/kFdX27FpR5AWmC5QwNWBtTQBKjNxdorGibAZ3EPAj9oY6t7Ba+GMcXEtyjTfeHLtgJSNe75TPuGnrSpgpWSAlMzj03P8pP/txgpN7JnNdp6WkU3ToY01raAqo4+n7ngeMickkHamF4ynnp8l2o2H9pPH7UWkfbnJKAG/xrvMcuHuBmG42e8sBE8ItEETyqlNmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx0pRbwqLwu7lyevOfiEqPs8vsOpi5AqYJ22rIZsQkQ=;
 b=A0PldRBWZdsSNBV5tKqUyoc/hO6yXKz4Hmb9ehBQWehQtC3W3GVKG4R4TTeabjVzvoXTccj8ydWRZfjntOuCjWP5/vRrdxfSewOf1vi9WZuAstbbxCQzOcaZCgOJHDT9KJDHJxTp1FB+h6Uy/rcva2eT5Ge0hHF9eUitjocI26VNzel9rP6jsm/Kv8IidmmrqT+Dhp/CGiHyVx6Qk34w+m8ZgNSXfANNSpfcHCyOdismj4u842/I6hNgn+7Upkkbd1IgEwPVh6lQ0Rht6X/Uk0Vdkf2hXrArQFotsom5k8fgVUFPfdpncu6sPV7mLQgKfuW2jYjamLkk6mlH+//Pvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jx0pRbwqLwu7lyevOfiEqPs8vsOpi5AqYJ22rIZsQkQ=;
 b=hqtDGyVpjB5LidDGSqvMoT8a0129ygNskraAefHDwoAjOQaaG4qWrB3Z5VvOiV9oRt9aT8L9BSJco5G/8johePT5EtWea/M61xJulmvKKTGKfGZSh12LacN/eHLj3hAXY3ky1ZlvQagj0DRqZwWfh+0kRZNzIhCXX38UDqoB6CU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=Jx0pRbwqLwu7lyevOfiEqPs8vsOpi5AqYJ22rIZsQkQ=; b=
	bZLdBOiP9mYoOSwAIkQ3dMTaLMCKq+Y9MMD9+68Ukt25BczlMOBP/fO7GkCK7DrM
	yCpbxcKYFEZYzF2JKfSZzCyTFHFmJQMtYCr7VcB0CcC3saYwK0WYr+qG00AOmN5V
	52HVBA+RSuYD1m9yrEh/1PhC3pjBT+2u4WeNt/IVRzKQLn7PMdTESsVMkxoIz0pu
	xHhwKdjFJeONZSS3WwiyVGDQpjZCPgi8ZIC7I21Aqhn2BinSujqokxL9JJePDpoN
	zGfrg5hNNfZpfHgRnr1pQo4VASEqJ2gjJjCnezTaTw6zpN/xGCnLos+MPkWmKxAI
	IlYKOXsEbwZYlRpVxzVn7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Jx0pRbw
	qLwu7lyevOfiEqPs8vsOpi5AqYJ22rIZsQkQ=; b=LNro+0RrbaI2t++EQGrvacy
	LZfvOTUheunhB0YN3f7ExbPkfbGUBWyUVeBtP0x5YwZcmHsHiNYKNaqLZhc5jLGe
	vGYz93/2nDH9utFsDxlHL1k7+YPTsgdiE7M1mjiGBe1fyNT4uKIauss90JV1wSic
	8QGkINm7vPqT4iTh9hUWZurgH640hMUoNR52zRvLcpVsYyRkdDHKG/kxexFIvnE7
	WLhEGEvHVCtwE9tJgKsQOT0c/RmU/gLRAJf5j12qGxTo7AyUnbgyQrOENOO0tlC7
	3sh9FBnQjdQfSeRn8nEoC64JYS8dO5G9FIHzK5LuAmdGjApU4x/vAe2TJ3ciUnQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RznHwWjCutNm4RznHwiaTM
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v3 3/6] argo: drop argo prefix from argo_dprintk() calls
Date: Tue, 26 May 2026 14:58:20 -0700
Message-ID: <20260526215823.1452619-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526215823.1452619-1-dmukhin@ford.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605130000 definitions=main-2605260194
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|IA1PR16MB5456:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eb79f924-0569-48e8-a8c0-08debb71f12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	DoFqn1R9LKZ34fNs0QzPEG4IV5H0HbaQr/faYt4c9ExAND13y5LALDudp+d1Jly3YgJD+0FI/S3Qk3k1erSYSwOBhfzKW/+mK63h15dY4DPXGSP0FiVI21RhMFuNOi1AI+A2p4LAwMGK2PmQ7IVXe+Gcb6g4PSf5I0nnXdPe62NtBWjlL1ynBZ0/yi5V08wa5IEU8R7oXW8Ic8sBll87m3Tp1/IoSgOiUgN1xf8TBvP2tST0PJdD6zasACyvq4WEQALmV2OO4WNYBanjqI1t/fi/o9e7SveZYLaHwItr5nkVqCJGLCNB5vC1eOCQNe6BKmIt4y+5AM7XvXyK1xS7llN08h5T3yZzBG3FQkQAmnuU/gqP7uvd18mE8U575IL/FNpCpoPuCca3AvuJXnqO41HOkavnVlEBqOI6icaX2wsQ/qECEzsXLWq6sG1tWePUsorbzskz6GLstcTvUBpCJUvdK8/3yUP06AfmDh4PoGwUL2bl4kLwzeu2t7pV5y+wp00sC0FaUKoND+/MVe06fkDRQQheyK1RSL94fiYUSoZFYvFTrFx7tlZOPRVTUkjM15IkxNtz/DdV3uuyJ+Utr5nEmcgOluO9bJw9Jgx5xxAho7e9h02jpMyy0IwTeWq3taWPVImWd0GhDSn0Q5Ok08g2lWnl2TZEKdD/KY7X3W9qf2F8nXR9abqQaqrBrogHIgErX87oYm0GKVD+FNvJGe/mjDmE5jMJIy9LA8NE4Do=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rvtOIP0cCqf3YmMeXhuemvKhxAVM0wxsU3h8qel0Xllh2QMhnX/YCKPa4cgvFps73VhV/21ZvU1gNh1fP0ic7530bZ4ZBRJvgPvuSd4bgcQivKZHqzhiOGPGVzZvbvXFjDgSPfHot6vMcybBPLug/fRiQvBXaflma2LxP8diTOF9wCofSz3qCHQAlRwSxN/7dUK294v50Lv7++7jzlYH6ucBDi+UKwE969QTeHyXnGJtxRXjJKGYSXK/ja+VcnleI0rApg2qBlzN0jCtq/G7mKn9Nmlfwtm8VHurUnyfgq7euQP+AoLNrYEVpnx3ZblthAFUUwiS05Fm8xWr9yuiOJrKb29qNyMWJ24uANyoIM0aAMTao+Heb6u1zqOVV5u2uLa/c5y2DMfdQ35Ata9zGVKd48hDIp7Z+uN+X1tONKKvyfBSxKBRNwUXS0bjCL93
X-Exchange-RoutingPolicyChecked:
	jPY2D+4GolpEzPReW5HteYeGPooHRWz5h/0k4CJ7HrjxwBWS5FUIFTEfIwGK+ia+wkqwqRuekkr0GlpBmPgNrc0DqZ99bwDtwbsVlbRg+fUJ+O0Vt2Vl1fjpYxpl+d2Y5JW6SZdqyO26eghTOzR1ccHY9YQiAFQYH/odfFM76K/h5jufnTngx7uqDvReALV7ZrNY5sjXsCJG6ab1W4b+YrHv2js8lOECraqjmL/SSu2Huitbzq6ZYGJ4CGOwoi1VqaHT/xz39h2yqRK4d5Sdx64u26R7Ye7IcTEw+GStcUHi7Xdxp5fD285WZqQRaextx4IwTTb6EizM0DqGEZuG0g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZVrtVPLDPKXaY9N7fNUJiPEKIIglXf/q+/9JbSP1zx33Ozlz4hgBb9EqNKumX1NUw0zSkBuiyj9bOZ/BwHoG206EtgivAteNQa0ftFPrzYSh+dVY5xDGjnve21o1OulYqrNgPkIwnmOqJzx1c5BqXX3pNMjWqZnOboZu3dOxaIpRgsuEPAlqfx0gSRwPkNbUx/QGb67ddGW6cdA5y5b4ATPg76DYmVuFq/LUgRgANhGZ4qjaAqa83gvwYthxvQNy8JP9Gg7HGxcpt/lsI+TDrRAxb4FHipOxGqE7vxGeUjoITFe+CZfBG3peXOCoBtquJ4sLTT2g3YfCia/tfc+97+9X4Y+auUbPsdTJzxhZhXfv52rK4RSL2/bP1ehVXhN822eUML9RVOnlJrIZHwQUkbHz3OCkXbBVGx1VX86ckomHBqvn8Le3YF/3DvVmtObTZGM7fmIFp5H55nnADjZ8htjmBImq2WgWHNX50LkMqW1A7Hhoz+QkJ+pmGbJljB8mi18fPN/11fhyRl7dei0gO8ctXtHcPViTCZTNeEzMGp1CtOg1rax1eGvtp2SVZnhzx4CePQ9FnKOJ3j2Wrz8OCYmcU54mAD+qgkFeP71ROGn0RR7s+y1LwUZOGjSrxflL66MPs/JgWPrEoDgflwxkVg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:58:38.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb79f924-0569-48e8-a8c0-08debb71f12f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR16MB5456
X-Authority-Analysis: v=2.4 cv=F6FnsKhN c=1 sm=1 tr=0 ts=6a161794 cx=c_pps
 a=OTtHDJnq+OHIMh0/YV57GA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=TweWIa6zg6WzoLAQ39YA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: Ud2VHzoTXWPdIejEg6TrDMH7Y21es8Ph
X-Proofpoint-ORIG-GUID: Ud2VHzoTXWPdIejEg6TrDMH7Y21es8Ph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE5NSBTYWx0ZWRfXy3u63me6lOA1
 WDR9he525ydlgEXcFayW+dfSONYVlQuQqfE4JIIGxz+DCNWARgmgVPhfkx5i42t55idUm8HrB2K
 SA6mj5wvQgRZAcRuZe7Nw65luv/C9tFTzbMOG7ql9QKDZM2WNbe8LoSEfKSHenPcCjMYO5vaAua
 QRIm4zTz7+E9cAf+xLDTjL3gHcbNGhHlZxjTEB0LSFBLS66EuypI3H200SsqkrI/yRi97JBC3Yc
 eMrLtWYPtu/VbDedTT71uRGvRkOZbRqUgD58LP6Rx8W7Y+scwLoxMuMkmXwOLtuPsYLjlUNXPNG
 sI8V7q2mwL+YFTpzdgXQ2vcKqsREZe8z6odVvVVsANNQQJd8+Yw42tR0sEIUFmtOIURmqD1yHN6
 19hb2oETEJDLf1WOzCNNCX6Xq9jI9VRNXp4I62DGNW1jxIr0pnbemTcAxoO71T7qga+h1n+qdFe
 Wrva62EvC36cYJCTk/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260195
X-purgate-ID: tlsNG-16d1c6/1779832725-87170D75-0BD86CE6/0/0
X-purgate-type: clean
X-purgate-size: 2379
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com,epam.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:mid,ford.com:dkim,saarlouis.ford.com:dkim,epam.com:email,azureford.onmicrosoft.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 1B8BF5DD06D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

argo_dprintk() prefixes all log lines with "argo: " automatically.

Remove duplicate prefixes from log messages in the Argo module where
applicable.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes since v2:
- n/a
---
 xen/common/argo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 5da14c929e14..ffa1f43437ab 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1467,7 +1467,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
     if ( ring_info->mfns )
     {
         /* Ring already existed: drop the previous mapping. */
-        argo_dprintk("argo: vm%u re-register existing ring "
+        argo_dprintk("vm%u re-register existing ring "
                      "(vm%u:%x vm%u) clears mapping\n",
                      d->domain_id, ring_info->id.domain_id,
                      ring_info->id.aport, ring_info->id.partner_id);
@@ -1527,7 +1527,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
     {
         ASSERT(ring_info->nmfns == NPAGES_RING(len));
 
-        argo_dprintk("argo: vm%u ring (vm%u:%x vm%u) %p "
+        argo_dprintk("vm%u ring (vm%u:%x vm%u) %p "
                      "mfn_mapping %p len %u nmfns %u\n",
                      d->domain_id, ring_info->id.domain_id,
                      ring_info->id.aport, ring_info->id.partner_id, ring_info,
@@ -1741,7 +1741,7 @@ register_ring(struct domain *currd,
         list_add(&ring_info->node,
                  &currd->argo->ring_hash[hash_index(&ring_info->id)]);
 
-        argo_dprintk("argo: vm%u registering ring (vm%u:%x vm%u)\n",
+        argo_dprintk("vm%u registering ring (vm%u:%x vm%u)\n",
                      currd->domain_id, ring_id.domain_id, ring_id.aport,
                      ring_id.partner_id);
     }
@@ -1781,7 +1781,7 @@ register_ring(struct domain *currd,
             goto out_unlock2;
         }
 
-        argo_dprintk("argo: vm%u re-registering existing ring (vm%u:%x vm%u)\n",
+        argo_dprintk("vm%u re-registering existing ring (vm%u:%x vm%u)\n",
                      currd->domain_id, ring_id.domain_id, ring_id.aport,
                      ring_id.partner_id);
     }
-- 
2.54.0


