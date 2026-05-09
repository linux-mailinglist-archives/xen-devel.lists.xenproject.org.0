Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0t2RILaG/mnSsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E34FD27F
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304390.1577454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0r-0006AO-Rw; Sat, 09 May 2026 00:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304390.1577454; Sat, 09 May 2026 00:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0r-000682-NP; Sat, 09 May 2026 00:57:49 +0000
Received: by outflank-mailman (input) for mailman id 1304390;
 Sat, 09 May 2026 00:57:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLW0p-00066j-Nl
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 00:57:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLW0p-006qJL-4T
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 02:57:47 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8605-bab6-0a2a0a5309dd-0a2a450bcf24-44
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:46 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8689-212f-0a2a450b0019-94a38ff12a26-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:46 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648KKbcv1047156
 for <xen-devel@lists.xenproject.org>; Sat, 9 May 2026 00:57:45 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e1psk1fq8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:57:45 +0000 (GMT)
Received: from SJ0PR05CA0184.namprd05.prod.outlook.com (2603:10b6:a03:330::9)
 by MW4PR16MB4629.namprd16.prod.outlook.com (2603:10b6:303:184::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 00:57:40 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::f4) by SJ0PR05CA0184.outlook.office365.com
 (2603:10b6:a03:330::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.6 via Frontend Transport; Sat, 9
 May 2026 00:57:40 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Sat, 9 May 2026 00:57:39 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648LHoDj652918
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 20:57:38 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4dx35qqsff-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 20:57:38 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id LW0dw72zAiHenLW0ewLgxO; Sat, 09 May 2026 00:57:37 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=rg7
	pAXaVnEF31+yMkdbfvgcrMi8aNPrCpSyJqn+Du8s=; b=GuoaqaWIKZMni206Xtk
	idFtw3C6/SAh6EDbVJgiPYpAi8I7g373c+y/a5Trva7ZJw9LrJtoVtHtrhwE5p/s
	7BTBy7VkrzMOBOtWfhcjoi9Ljc7p8JyCz+l77vPw6Uy9BHDdkTHGklMdOp39uH6K
	lVLFh1p5ggl90NcrOZ6rqyx9tc3DlCft04LC58FOdUWa8/Du+oUH0G1hchE5rh7y
	5B41zn5jkWcMR5vX+fSwN+4BdpWgcAQ2oLR8yzIGVCi4ydbcQVPihbyJXJ5KTiZ2
	jS67EM7rtMHAS/p6WitMMCRNz332kvre6czv2yHXJTr0NuQMYVolv0VhUrAnvuuu
	AFw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y78meKgYTfgNra5iJ1vh/iDGR92WWVJNMXSr/zkY4ULZWxd8Drw5H95jRYnTjALQ1AfrkIamogD9p7FemQkoqgnxrmb9qY5BTg65d+BNyovucfFQ33GlPZi/E6GRZhq8GqfVLNXyv7vOXDy4uGlez8VUM/vwBPqrDi5L37nrTWRD2DAlyKQWwg2SEz+QExbFN9tytdRMXQl4bamnWZYSbTPO2w3gXxoj6VrQ63vNdKdBq+4yzCpRlvQ8Ul8jHawG2xCP481DdHL2kZIek9kV4rzqOg/FIdSPUr/S7G9NgYRPKb62eJ7PkLZSKb16RASyTme2svf5Wlg7m7SPt2LfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg7pAXaVnEF31+yMkdbfvgcrMi8aNPrCpSyJqn+Du8s=;
 b=LrSDmXZamC/zm2TrtMIAtLMhp9fSUYpemxsq7AC25+tWbGuSLA0LN/nbuZlZTpgP3NAKlpg7eeDB/Tz77k8scyMQswA7ZBbwYhAhKdAksKJvsnw7ChrZZH47OUEXYdNBmOEdRcSANvozbot8Qk8GHgM/TMl7OyjStPms9igkMU6f1ToKkKtw+WHrPfCNDoKKIuSXxI3/w/ZZt6So3HQvQfVdtH2ytJEha2RMG543Wde5Hv9SbfhAqIJBvjSq/Os4cXQt5qgIx5y/pEZYWzpISuUIU8SswE0+yOrbKP1a01+anppHEHelBHfdQLRo8SXEsczGMRiqSO2rYPIksOqdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg7pAXaVnEF31+yMkdbfvgcrMi8aNPrCpSyJqn+Du8s=;
 b=I9DwvQ+kyFQP2BTCIrWaPh5Qs3bMOxym+4MGFb6m3+cPrk7b/gioXpu4wiE4DYQDhMDbH2B6D3zLKETfx6Tqei+4Zbu3rB571vWLrzI4zW+CvqR0QEJAJkxXHwCljZreQYASUk4Czwm0j/Yt4PL9yct3/H1RQJ18ibdChh9t18c=
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
	ppserprodsaar; bh=rg7pAXaVnEF31+yMkdbfvgcrMi8aNPrCpSyJqn+Du8s=; b=
	QOo/bhIpI2IHPOgcbzZCfaJnFhf+5DZAYjmnKnmKq9Kx5sLE2oFXNAocHJKiwjtW
	NqwGfwl6T8iIgHRqJiNuHZIjda1+qLCj7dUpc+T36K3qX+9vnNA9xbAGlfXWSQh4
	DnDvU0wGYlAjAviahBBm7gMYiqYlZrxtF5Qcr/r/cte7GZJT3ghE7anW6LSc/63X
	4aUhGjV2zNzm2zs+31tFmUF5t3g+X/qGMDGShArZMmFTB8ClXRNkByanI6cIUsaW
	T8PXAKPVdNuH/OICkftFfMAEKu1RvV3WmvZXFeq3z8lEcMHS7abAOcaG2y4eYS8o
	yZ4blqlQ3Ssxfj6DstRj2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=rg7pAXa
	VnEF31+yMkdbfvgcrMi8aNPrCpSyJqn+Du8s=; b=SpuA+NiITV7V5B5yUrrq1En
	S6br6n4d3d41pX3AGZ7UfHRdxkYeZFXOD67gsvzibEkyGrKQDR3bHfBIVtYcf2Qr
	/njxoW4MXqdHFmUFxKWw1lAxbbPMGkPgOlVR2OrDpNq2fpbuKueSe/DE9Ue/oJ/Y
	d2XYGW3sxXEuwUKrxrm7rcvVJe7hepxpc/waHYdBf4RWORpPzkI99TicwXB3wwpW
	hZCGBaBZq/5mfHvDEx88hQcP9sQ7EYjMEhPNKWAOacO7JYVbGq3VzPM2fpE/1agv
	8piUgshwl1SwdtLFDpXu5DjTUl0gecjvscEgPokEd4f7SMOoIP0GZGi/0AO5+GA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LW0dw72zAiHenLW0ewLgxO
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 3/4] xen/console: use memcpy() in console_init_ring()
Date: Fri,  8 May 2026 17:57:13 -0700
Message-ID: <20260509005714.892018-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509005714.892018-1-dmukhin@ford.com>
References: <20260509005714.892018-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090007
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|MW4PR16MB4629:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3a733f9-cf12-4ff7-fc01-08dead65f827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J0IUFd6YJITBmhJ/vN6H5VJkxFc6VuN4mowSvKicotRW7A/+MW+PQEs902qPY4iKCxyQhmHMHcm1s/Yicv5BspFYvYxQo5oiqsoSncsNaKzhAi6t+/mcMlJkkBnOgv3wwDMRyqYkkK7fHOyFflx00eLpvGbqgLyFZWQ8RI5cToOgmrjpPzF4VPdKAOOLs6Ws33NH+f+WB7p/aO0PdEZXYds4KAwtj/myW7d3B8OqyEjrucqw8PZx1kLs1b11yK9GZfgMMStki2ePy8J05sjrli/0sQ6XT/G1nRuo/znaAOgHqwfhZ7kOXGP+5eG/DmKFAoTMJqCB08aNhcyB+p1EupS3fg209wEZFRZmMTSDZEcrfXWAQSWj3oi+JU3Vgf8OVF8E+mAFhkVpapCNhSCoB/JtyAqbWrAU9TQSxgoXKF7/1jL+tEf8fzV7B343ii8xZRwmUknXFPJ4AyPFmIVDhL69oyjMOjVjB5bab8pRJaAAOoo8q3mBzQsc2yKu08E7ppw2M8JvK1LaLOeOwDT/Tx4IlEskmiWCQL1bgljmzKOX8ytcTxD+iBfZjmUlRyRwqRY1Gsc4zOp4ZGVKND447ldFQd8uk+aRZLSOEUX9X2q1PW5xemyG6KaMEyDWmF2sigXS9M0JZzok+N04qy05sqVZ3Ijv7afuwnL4qj3odt8DOg7M+uGzCEd3/szVfuLBA5mJTupa207aowGpgfBU8GJDWz7yU7Wpx2F+GCRJBm4=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UuLtYe92wWJu6Ua7KRCvfCs+sGqnQMZqot17NSSYvxUvn2SG7u8pC6LpxtyfkudF7BnbcL4WAJQ0Sr5pZ/eq67NOqRvIb/AV9+FhAluo08RDfrzotAFQMmOEUI316tuH06SzHalM98Q9BRy1HVNP3y/yvxAWQQV5dJAjDCWypJ/QwosJ0JP9h7lpSsrjEek95yooBgD5sUG44qYmzebm26QklmAGk+k3b5k8zYvpoL1X2vjv8nScJ5GmReYqTwlALaEM/gEUwL3XGuXh3v2MYYHcv1Bhplovz12+umh2NqSbkkxsTeKIoDzEsXhoDiOCyzcm2pVv+1kwXPsKR8UY5Rnp+r/WQlPW7tuAnYfoxqxndZFT8RLFbIQgasfxzABekzDJQvPclJ33kvp5+uuzDC7BJVwf7qPZJiPm8xXTA0VBcHgvBE2OwG5eBuCWVUZm
X-Exchange-RoutingPolicyChecked:
	B6Kr0hBHDfn37K9t3puPzPbhnizl0nRCK8uQ5o2Ujb3bvhlc1wEzap7y2xQeiXocmIf1Wm2vs0veiKT7QFzCneQifmnl7dFvJZTRrlI8RmIPdlc52+QgE3Q8FVzBj8jDobUz9n/Xct2NmVxxxwC/wlNgshvYnqbhbvAOFeD6ZAAva97xUwttBPLuRkNrNJCOFExP6qOh5k/jtDg2a5fFRu2OS89n61kEX/5C/VENhOac3+47ZaHVzssrYXBXx14X6FApRD1pZ7i3q/gwnSAFW1q419oFGnwhOnhgKipcuBCs74vIzTz29zMNX2/UYmTQqsDkBtslg/0tdbhugb0Adg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+32Q5kM61IKBwKppI4CMoV/cpsnNkxguT+8OxLW9+WS9+6HfwA/0YttoWMADKOHRCzHIOb16IC2p3Fs2Wnwq/6n5oHCjxv3xxwLH5/t17luYOiI3T5c5bISN4t/tEcAicbuxcgqGkQuL5lfzaP20z7j+7gx0lzAmj40oT0DdzsTmQ6UNcXIWdzTkFx6GFm44+noayUxVILAVXEd91WaCVvvIwW0+XLsEbCgAXm6xa/qYna4BH2EiavG7mUxGJzkCK5ulkImDtkKMSxuL5hpdlOH3aJGeRVDBXSVm1cYm2HpcOoGqwybNqHIsx3wy2+8gMszMWE4dRVygbI9i/aqvR/VpALyJvZcZUADd9NXGUwvzZUa+ugeEwXuqyb2rJVL34HO9R3a0dSRspZeutF9keiCagu6UmiZbQi3DnmY3pswERgfQiqDA++R1AnKD+nm8KwyeZHfjS2IrTx9J8VIdjhtwzZrRXHQuXoEVugKaqoLI4aA3nNq8yZqXd8GR0g5epMCcxYL0KLlNnxhnW99koev4IrKF2PvftU4N2gE305ZR7vnWnVWqsGZEXYrjNiteT3e8iaMMKbp8hqYccaE9Qe22Ua/bJ+Sn5BVmIk1JN0twzqIY0iLLYIsATVoYU1NL2tLxBJSx/wRyGv0F27HeJg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 00:57:39.7041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a733f9-cf12-4ff7-fc01-08dead65f827
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR16MB4629
X-Authority-Analysis: v=2.4 cv=aZpRWxot c=1 sm=1 tr=0 ts=69fe8689 cx=c_pps
 a=Getn/9gNXKMn2yU3BA3TiQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=tHz9FfFoAAAA:8 a=bfffGLb1BPHTRRR5J6cA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-GUID: Uwifk5Vg7PLgJZekokj4yi6qrcJmA9Zx
X-Proofpoint-ORIG-GUID: Uwifk5Vg7PLgJZekokj4yi6qrcJmA9Zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAwNyBTYWx0ZWRfX1Vl+mTCAJDer
 gaszZfw0LMzc8Qu8psvHzCcXyqRC94qMKViueNd0KIqjVHkJgrKTa/fKhHo8SoKjxgAYK+czW4h
 o84vwja6HKESa9LZCOyYUsHaHpIzLIZ23Y4YZy+5ytZ5vvCjxIvVH/61PAv6Bm83RcMURo1ASoF
 P5AFYVkTN1ha0M0PpfMJiiOZmZYCw6WRAcGGQgLKvXQwbb+iZUxCQc1+boKAX7JPCgkOwbh0LIB
 UeSIcmzYN0TJ01BTSW9l0PePc2l6T1xAmA1Dg8jQW/l/KWgqAnk1Q9wSp5JqpSXNBxhq0C0S/5w
 8WqWmzaUWUup/7LWf3H0X/OGl5HvZ5ue/JZPjoLT4a2Lhmg5eA4nQlyMVfU7BB5B40McoEY5DLD
 Vt5P9NDFQcfC2Gu8NmhccoatZTqViLLquIrMcTJj9kSxavJ9eu0R4Yaw24uDzQnZzFun4Wvmyda
 CtKj8GEqYWjCBzZmSuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090007
X-purgate-ID: tlsNG-42698a/1778288266-2087FF3B-A4D0B245/0/0
X-purgate-type: clean
X-purgate-size: 1788
X-Rspamd-Queue-Id: 701E34FD27F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:mid,ford.com:dkim,citrix.com:email]
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Make console_init_ring() more efficient by using memcpy()'s, rather than
copying the ring a byte at a time.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- fixed memcpy() logic
---
 xen/drivers/char/console.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 5ab3b0de12d8..5cac87d052b9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -463,7 +463,8 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
 void __init console_init_ring(void)
 {
     char *ring;
-    unsigned int i, order, memflags;
+    XENCONS_RING_IDX i, size;
+    unsigned int order, memflags;
     unsigned long flags;
 
     if ( !opt_conring_size )
@@ -479,8 +480,22 @@ void __init console_init_ring(void)
     opt_conring_size = PAGE_SIZE << order;
 
     nrspin_lock_irqsave(&console_lock, flags);
-    for ( i = conringc ; i != conringp; i++ )
-        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
+
+    i = 0;
+    size = conringp - conringc;
+    while ( i < size )
+    {
+        XENCONS_RING_IDX src = (conringc + i) & (conring_size - 1);
+        XENCONS_RING_IDX dst = (conringc + i) & (opt_conring_size - 1);
+        XENCONS_RING_IDX n;
+
+        n = min(opt_conring_size - dst, conring_size - src);
+        n = min(size - i, n);
+
+        memcpy(&ring[dst], &conring[src], n);
+        i += n;
+    }
+
     conring = ring;
     smp_wmb(); /* Allow users of console_force_unlock() to see larger buffer. */
     conring_size = opt_conring_size;
-- 
2.54.0


