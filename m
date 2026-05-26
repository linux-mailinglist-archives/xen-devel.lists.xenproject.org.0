Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DWx/MbkXFmr9hQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8D5DD072
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320183.1587587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznY-0005SV-Dt; Tue, 26 May 2026 21:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320183.1587587; Tue, 26 May 2026 21:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznY-0005PQ-9r; Tue, 26 May 2026 21:58:52 +0000
Received: by outflank-mailman (input) for mailman id 1320183;
 Tue, 26 May 2026 21:58:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wRznW-0005K1-Sn
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:58:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRznW-00CFSu-8j
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:58:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161783-bab6-0a2a0a5309dd-0a2a450bc60c-12
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:50 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161798-212f-0a2a450b0019-94a39217c326-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:49 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QKuaKe986635
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:48 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010065.outbound.protection.outlook.com
 [52.101.193.65])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4edehkb5kq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:47 +0000 (GMT)
Received: from SJ0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:a03:39c::32)
 by LV0PR16MB7009.namprd16.prod.outlook.com (2603:10b6:408:33c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 26 May
 2026 21:58:45 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::a3) by SJ0PR03CA0357.outlook.office365.com
 (2603:10b6:a03:39c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 21:58:44 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 21:58:44 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QKv4k71018994
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:43 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4ebuapbcfb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:43 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id RznMwG18pevQgRznNwLuY2; Tue, 26 May 2026 21:58:42 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=YsS
	EbkHdmSN7zf/XPZCf/0ZzmkmUnygfZoqAJ/jDAi0=; b=cunJHV0qNiMWzXENpAn
	PcPY4cEsvhM6tuGk5qrh7YJ+Zf8t1EhGfmWZrCzvm/k3uY2Hs7G197gq9Y9PHjVL
	e35amSgSchycT8KYzdithIpDDLZFTvKTE5wloX7DYuDSXHPrtuEdsRhSua9KGZd3
	WajaDYd1UJZSkjGtvw3W3Cn+l9fFul44Jy3aXeksCYRXWfV3dSVcHdGY+d3yPFAN
	X3d+IutUJ+h+/CUP5mackRs0XA2ND+INXtYMyaKiS9ZJ8lG/R+o+3lsZfshwZgxC
	A84h65nc2U7W5BCtrYmZHIv1RCggBKVMdkrHNqgo0nkY2F5a+piBr6ujJKH9WSlC
	AiQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=am1d54jDjCOO6XjAG7TTTDblFmFlkFHQU8OoBClqOXS7sTQG6hKQAWThOcXZNcoC1BceEJKxR6hvv/R6aiqiCzuEQ+Dl57XmGQrCmz+Ahtpj/J6PPFf3MVhTM3MXKk6u2rRQn5MKOXdt7z60Mb2cHWCdBEpd1qOaj6OXM5ODEQy5ijOxZjy4WYaNG+WtwJ3fD2AhWkvtIn7ELbL2vEfDavCVzYkSjlwbiD58VsD0Jh188EJqCIBZbRR00Sul+H6bhE+Sxf1NKv4jgJQBmy1t0e/afc3exPtDQDyjWbZ1AACn6hsmcut2EDfNbBo4NUMSjMYWwmftTB580t9w4dZ6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsSEbkHdmSN7zf/XPZCf/0ZzmkmUnygfZoqAJ/jDAi0=;
 b=an2tc0PznRYNL52pxQAB9g8cF3xmdQ3K2nuPSD/iA5tfGwti306EYK/r9RVax2PGSV5tlXLXttfcpYoZgVYGSRGUfjX4lkrZFoxVH9cI1THkZhnK50EkmqUWZ+bqWEZkvmS8PTUQrtrStU/MWZQZsY7RqoBjkrjBKwyWIHtibcOl3cv+cju2vK7BEPOspHbr2PI0Ony+uyV36omExec8PBIBnADpkFsotZaqKOKMOdC6LlPlgg/f2kjtZ21su2Al72mkJ1T4rwK84s2b43GjQNgfqNXQ8lmCaPqD8PDbL22pRfGpx75OIAuZjYQ5IMuGcImbO4tXW5QTgb64bpp28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsSEbkHdmSN7zf/XPZCf/0ZzmkmUnygfZoqAJ/jDAi0=;
 b=GiNkImmihQ1BZ84DThBxBPQZDvn0tSRWRBbpCqoYyVTvN1qy3QvSFSdlBkfa09RlkWfFpl8Go+DV8tY0MApGJxG71gjjSFOP/xi0A7VDlj1DhGf0wJD5yk9E6jEOfd60545fc8MQ/TtawXrKHW2O91c14X2MEmxNCSzErAAnDaE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=YsSEbkHdmSN7zf/XPZCf/0ZzmkmUnygfZoqAJ/jDAi0=; b=
	KrrattWHlGC9W97/69E78SnDBIT8IA0UswlqkWyoyeK+Pvcd9qqZbZYBbLdqUyq5
	hC4a443e150LVJbgXNNEyheHqs8BbWN3zERDtulj6mjdypSEF78Aus1B0xxAOXLi
	FuYX8D1hg1b+3p+KsSWALl5blKzu3XwajmXO7ZhLHDznBD5B2JSdmPjOpqihoiS2
	RZT2mF4FEYH9BDXZyWP/n9Naom7FTDAQZT17gdUbyoQgS/P8GhAm/W3KjF0QfSdg
	fp3bsN7B0/181/8X2DfYmAOdUchtm1Q2yRlL3FGXkROzomhQwk1qFGWbevNBTPfs
	Yw8OLsiPt4HxJ20GXLOkYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=YsSEbkH
	dmSN7zf/XPZCf/0ZzmkmUnygfZoqAJ/jDAi0=; b=Q7uygcEg62OZxdUg/w0Lmvg
	B/v7LYUA5Wq1itk0vQi4Mrgh+OeOzW+/nF/UejiASnhoNArwjLtKxSSVIRWYyivA
	ShbW6kPA2/RvHhnD8hV8AiMXSCrKiK6WtNx5a3NvOaKTokGX8Fu/tHz0xMvJoagO
	qmdpWptsqBdS2/1pV+lkcykFaMy9wKrVV74zzlODIHpXjXIWg3/uku8JonWnqcIh
	M5aO+vL/z5LILiMDObm+2Mn21XJK0wN3jtsNEAeo7XmCOe5tc0laRSikDVEAlhTL
	Y6IP1ql1QCFewxxwJBB05hkQfMDI68snGI4bL/xhjeV6rTsj78i0A/3+UvBTRRw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RznMwG18pevQgRznNwLuY2
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v3 5/6] argo: introduce CONFIG_ARGO_DEBUG
Date: Tue, 26 May 2026 14:58:22 -0700
Message-ID: <20260526215823.1452619-6-dmukhin@ford.com>
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
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260194
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|LV0PR16MB7009:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d71b22af-c180-4f84-2b27-08debb71f48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7nsTckM0fyrKpPZ5Pt057X5cvtTpP0+oyi8Ty7DlqJihoMC3A1uPQYKO4VSysPC8nHyQ757e3caUsmcNqlKNYHrhyfqYqrL0wVXwKw7IQy2AsoaWP+R1Yv+Qi7/Pt5PwMf61RiOqQTNtUOGTxYz9TA+dPwcK67wy8CX7xi2+vRZNSqxOdgHca3IPP/3q3QJpXaSg5cwgiJ1fGr8Cz4a42kf3kkV6UdQfyBpRjOXcj9U+QmJR3fjIw+8vNMEcM4memuXuBxcpuJmosqQ57X/NxzANvySevFKwOoHdKl+ym6rcKbyPrB7iUjLqIepC/DuShedNvJEFvJQQkoffQIEJmKMM/R0TK5gTZDLR5Nq25GOx6TcpQ0CxJ4GTmgtyxzeSkdMz1oDYamfgV+5xVaTV57H2Qod8NwoB6eP3VThf25lw9HFTmoQ6qoE1p3/bZIPWcnG5/UL8dEcx1t4lmeMBmWqpePdyLycMFLbLAwRvjz+MeJLko0v7FmukRqYzTNEspH1RNIK5YgNKL8lnTkOwF2SeA77ZhW/rGnajgkKTDfBGEUNNUjYYJvz772bg59GovlA5pnxqbDP/vBrS6aFWeW9EVpIyPI+BXK+PngVghFSe4CVLh/ixft3KPNz66gSzOeXHs202IU3RjkkzpMJYb1X1XWy/eWvZ32GYJkQn7h9CVIMIKIcYuppXOFqv2Nw3wog+tm7s55zzipFTgaKTWpxPlWKGvAfYBaGm/OfPkNY=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PESP2XN9W+nGLy+t0777cpcYjR+iTE6vixBPzqmboK8INyegyxFGcGzti8OEnmDPuTIV96SMm4ZHG0FvscFpvOiKPFun6BvVKMpr3Nc7lREPj9+Zj0LRzTyvxI+J10psmynKu33yCc+1H3PK9ny64eWGALG6vHnqBTwFWU4DqWmmOmmouMToHNbam8m6aUb6h1gGXyWjRneIEweIPvTOhjh6oYj6mhcZ5h2ukTnq+skiJ5n1JVeVOL5Ff7YlnlMBzyntQr5O80SpAtp+2NXLzbeS9PIoA0iJ2X06qn/3CdVAzVsmYYEbJrZLl7nDpKzr/P3iYIhAPaPsVofROOHaE6lBTHS2TS/juxTkTaCnAYW9ElrVbzztsh7RaGfv3IQ3GgCPUEbBOay5BrddmBPRy/XGWQ5+Qwk6A6rZZ72NlqIoMJ6dKxzbPYVt3C0jzjm3
X-Exchange-RoutingPolicyChecked:
	wBiTKTEb4HQDD9WuMpb+sbRJEvfP91mkWtzv6Bjim2kEL3w1gsZ8+lH9VY8/7XHt6wo4RLaCk7aDZvSuEDAvOJtgzYZ42J1unHZGxpgAih+SwJQTtVd0T2wzgf3bhwOzKpoeNOmse6RWh4rZ0hG4YJiQ/+gLoNRFDiF8viT3OWvSsgC3/sAEcVee++KAPtBJub3bq1sCsMC02/yjjyh1sS2T082DrSjHpwB04hShixHJr2oYOe1UUpb8qZJoeUwSIc7BP26FWLtqteG+htdMt4lPZif7kU6UNB3vwjc1GH7coYrkAFoRKHqTr0uxXekuPTep+ad3IV5l+OP17XG+dQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pDEa8v0FVSHZVu1LadV8jBM3owmV8mNlB/JzrkEbsEy52wOCLduT0zwJLaGNv3wjslo8XICnVJYJAHJjudJ5BaeUnh4PT/f+V3QR2F8AW1eOnimn+nedJBsLhOuuQoW1jerjh082FNENOE3xxpEvXx1ASN3nowDtLbtVhIqKq8K/kSc0irgPv+L+GxeFXUnxz1rOq4gs22Eo64P9vpUxsQj6KUWB+W4/oNhSRAwkxNiqjNhNA07AqODWfXUaDHg6YML+bGoUcvpG6D1+eWK/sdwaiI5kOVzMKzASVB6NMvGMwarI1YTd+AaymgwuS2jvrorKU3XRqtG2b/SoSmD/pTnBTZJil9B7P1AKk/d73tmDvuF82iokBQJBmYcXR5A4Agv0fi1aTo0GQFAaRTiwTU/9EQiJS+7EQq4ORay8Fh7NHjlyHTJ4YOebwPZ+v34eMPSrs85k6ZVVhzol6Hmi3FDLFhgCaa47kJa2YZA0qa0lHly/UBsjvUtHiSYnKizfH7GEd3Gi0WX0xuk+ZadO5TRS1CYHZ6OZM5B0ZnkxbrYLhb51Lh5MGsdZFH+ACKnlNIG1zrzhY+nHRbq5/4x+2OUa3gkxdzoDEf25joucNN6Qhx6jrO6/7Wwul6y9spL/VXfZWAGLK2jv8M3/m+zfrA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:58:44.0475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71b22af-c180-4f84-2b27-08debb71f48d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR16MB7009
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE5NSBTYWx0ZWRfX0/5JfUII2QTS
 XmHiP7aFCS3iI40z3U3BEEAIRC4RIWAA2vd0jm552PL2VD/W2GSLZ+/tL8XhGEKtifYJsBp/XjV
 N+17MDLk3HYJPWbrCG/j7ejlT0x4vnGvc1bh8Vm64yIN/Vza/prx3YoDBOA3UynCb6vzZq50bWn
 PgvDgcP4VDcZdY58Ojtwhnp5JLFZT9YwxAwd9XmnqNWuBsXSsqxxvOg7GmxAYCqkY/S1XNCHSJH
 4cdRk/dVah7OwqT9X+9VchuhY3Yr+HIgxCmhZS7Qe2AKBtwM2MijY9BWX9TJybmoNHPKdMbfa5R
 GOUERhG6rcTRWD1Gkj3gf0+gSRDyFxKksyfq1bQb+GOEgqb6Obx2E6VXYs4dguVMM1BZpS6mZuY
 S++dJLip9mi+vyBJzoQvwki3RmfIa+ipEAhf6AGIok+CAuUb/voliTdBlP7nOpXvVR24Rj1fxNf
 VTFg2st1QduW3mZswkA==
X-Proofpoint-ORIG-GUID: ffQcE3wL1w0I2wIH5E_gOKqWsBXgp7fk
X-Proofpoint-GUID: ffQcE3wL1w0I2wIH5E_gOKqWsBXgp7fk
X-Authority-Analysis: v=2.4 cv=U4uiy+ru c=1 sm=1 tr=0 ts=6a161797 cx=c_pps
 a=wAiiizkMq93U2JYT/wsFEQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=dpVGQ_5JQCMJ_CPXcU0A:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260195
X-purgate-ID: tlsNG-42698a/1779832730-18762F3B-5A23E7BC/0/0
X-purgate-type: clean
X-purgate-size: 1414
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:email,ford.com:mid,ford.com:dkim,azureford.onmicrosoft.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 2FA8D5DD072
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Add Kconfig knob to enable traces for Argo debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- new patch
---
 xen/common/Kconfig | 7 +++++++
 xen/common/argo.c  | 3 +--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480eebe..adcdc51dd21b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -491,6 +491,13 @@ config ARGO
 
 	  If unsure, say N.
 
+config ARGO_DEBUG
+	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
+	help
+	  Enables extra debug traces for Argo debugging.
+
+	  If unsure, say N.
+
 source "common/sched/Kconfig"
 
 config CRYPTO
diff --git a/xen/common/argo.c b/xen/common/argo.c
index 3c38a51d09a2..b9b362064e7e 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -318,10 +318,9 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
     ((LOCKING_Read_L1 && spin_is_locked(&(d)->argo->send_L2_lock)) || \
      LOCKING_Write_L1)
 
-#define ARGO_DEBUG 0
 #define argo_dprintk(fmt, args...)                      \
     do {                                                \
-        if ( ARGO_DEBUG )                               \
+        if ( IS_ENABLED(CONFIG_ARGO_DEBUG) )            \
             gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
     } while ( 0 )
 
-- 
2.54.0


