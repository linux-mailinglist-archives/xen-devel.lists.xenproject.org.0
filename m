Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAhrIxWKEGriYwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042C5B7C95
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317109.1586353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7M-0005gb-Nq; Fri, 22 May 2026 16:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317109.1586353; Fri, 22 May 2026 16:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7M-0005eZ-Kq; Fri, 22 May 2026 16:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1317109;
 Fri, 22 May 2026 16:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQT7J-0005eN-M2
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQT7J-00FO4S-2D
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 18:52:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089e0-bab6-0a2a0a5309dd-0a2a450983ae-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:52:57 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089e7-2497-0a2a45090019-94a39217ae96-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:52:56 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64MFdgDH4159975
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:52:54 -0700
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
 by m0482516.ppops.net (PPS) with ESMTPS id 4easyy0p5y-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:52:54 -0700 (PDT)
Received: from CH0P221CA0040.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::20)
 by DM6PR16MB3863.namprd16.prod.outlook.com (2603:10b6:5:2be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 16:52:48 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::69) by CH0P221CA0040.outlook.office365.com
 (2603:10b6:610:11d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 16:52:48 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 16:52:48 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MEU1AG3360448
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:47 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eactj8wk2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:47 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id QT75wLP5TdhUUQT76wxrum; Fri, 22 May 2026 16:52:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=+Qr7wpkHVnwSuR63RBoxd8x1a
	tsKCQ3Vdkj3nv3Qhow=; b=BL45QKKodd4sEfykF+6951IAcS4Kh7pATZAvvZo/t
	Z2KNgxustUf1vTvJU0e0i49IgZ46bINICkgQi0LBNyYOmn6S7EJ7VCzk7Dh18u7p
	+2e92GuBkijbcYT9hPnhDRATc6nf4uWTDtY36zyb0/CfisixUkAebutmGv+BG1Gl
	skd/g/p+G1DZqIhDk3wdA/Q/KPe2JHnF9ky1BIPhH6D5MKYjVjBZr4awIHG73OME
	KprOz1eNBGCsDP0xidSl9rOva7BYOA2F5FJcbgbskIATnQlrR7mnFWIx8+M/ABB8
	gAW+QDg2X3HnUpMAFLgnQ7MwBwI9OHhRTPPEmqRXY687A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLJpXXZz0EV/ca+CI1Kh2Gi14DZyP6kkWrNUhCPBBxy7YQtAKgfdf1fJ6VLafy1g53JMZy9Nbs6OcYH+g5EOJ2+jHsUzk2dJwVyZ2GTF6WP45Jh9kZjFzn8EBGXDofXO/zmC0AiPwJZjKEKR4zFp/kl60umEcr+lsHpS5LTQrrf4PguW+ZBhYRLFSIjkgvbDMnjQ2MWnjrMhiT0P7qF03TVAFp5xaOUH494NpZTazukqJZy7J/xL6LLYQfCiI9BXV/UfI+1vNXqzxZeskBHACP5W1i8YIIpFLl4ZYp/2Beu4R3ipU+ksxUkCMM7qkYvP4vxXAsUnuIDHsWbyRUXR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Qr7wpkHVnwSuR63RBoxd8x1atsKCQ3Vdkj3nv3Qhow=;
 b=KnmYlfIxGg4hzTjiTY6XonnxSHPXv/RrT5TCRp0/q/EFay2wO9MGHzP4e+LcjVKjqRkYf7dGUZtSq36YsOWFUOEXmgcJqQqbLMQ+a5D9tzPXGvgfGPjZBU4hG4i936JFsDp3N/QipT21Cgy1ZVngA+u7A57IYUDb1lkr/Mk7n9UKExyCNqzesjBueoU+QufQKbepXT5utcbMIG7WH1WjB/B7gJ/F59xctW+YBXtF1Y6uXnx8jA3uxSH6raGNZWxfH8w30L0lOWJjntgMNEe5oj3jzAG+DXQ4PkyXpVfKJJZBfREujV+wdaGiVmofkwJBBcu/arfbGNAcd/8sw7qG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qr7wpkHVnwSuR63RBoxd8x1atsKCQ3Vdkj3nv3Qhow=;
 b=SoAYAKFCoEaXbB+BqFB4vgzviOR+APtY9gD2wTWt/pAYA9aC9nXU3QcvRP2mI9/kUdc4OFB44rKZgTGrmquvfciWQrsTfsx1tk8vypZNwq9KmujfloHcy4+IZ4GnzY9dr1uRmfZXq8Te0bRf7MXv0ilx/6FXts7ACASQrcY/S9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=+Qr7wpk
	HVnwSuR63RBoxd8x1atsKCQ3Vdkj3nv3Qhow=; b=AvYqVk/7kG0GuKiNUtk3D2R
	KNEhIlxFS4YTmRh758uplsgS++s4kekK+bE1DZ84O84pv8bJWi+zuBdTw1m5VUBY
	xWzl8iI2AabVFHDLUvGu3Xfm98pRPpX3TSO54LdlxWUDrPf5H0vgwVc9HxAgGHvs
	+5HowheQL2sK2/ow0XwUdJQl4IubSIxnv4DCIummnXmBpbQeskg38BZWGyVrV+TD
	Y7L3wlbAvVSi7YdceX9Qe6OjmyoTGmO3vxE3Di5ApfPcSb50er4a8pPBi8eaTG3o
	cI3RQbCC2qjhnvHPbWQgs21Iah3GHd5VRZWbZtZ0hIFNagu+PKv9LL1prxYQflQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=+Qr7wpkHVnwSuR63RBoxd8x1atsKCQ3
	Vdkj3nv3Qhow=; b=VYiWkjSEw3P8c01NaybhwyuL/cMigcijHz1Mt6MhPV4/+WY
	TskxbVOzPLDi2vhuybfApM37IkF9FWrBy4A8KgzcVVbsd+O9o6XxZ7Imx7zlQboQ
	cZvlgbmgTj4iHl9IedUxA3+Go4Ai8ZjL3haDoWxAH+Q/OYqWhUZnXwDPaaaU+mL/
	FnNgp/JQPdKDmouhtKLzGbSDcuRcrSxgc1orCnuU6OHxYJi7aBRgMtFU97d5KfRU
	kz1rYwoEAV10kp6ZscznXHB2bQJUOi/QVgTy0Re1Nwzl9Q5AsQK9OQDFEzyGw+i3
	GVKa/MG4m3htTpkFAa7g84Ob0frqryiWW/RA3cw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QT75wLP5TdhUUQT76wxrum
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v2 0/3] argo: few loglevel fixes
Date: Fri, 22 May 2026 09:52:35 -0700
Message-ID: <20260522165238.844649-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220168
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|DM6PR16MB3863:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26d2e6d0-dc4c-4448-9f8d-08deb8228df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|13003099007|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	b/slkLlQOXjVoeMUy5IWFogdJT4XzgXbG5oSomtCUdt3O7pEq58Ka0Z3jC0s1tNAiDjQYowCnqc5BjwXtoHz7Ts51AtknGVMqeERxQByrh5MF/VKuXzfhI2uZMSzTbBKg2etiH1YtRqBHGZTpdtOekAgZySUPoiHv8ym9aVJRBoc2iDFBp+rW/xzGfstpuqnkxcX9kKj+stb5dWsCYZUa/OXiOB41iV+tpa7ihjz8ACygM3Xu5uaInsXPOHJyl/l/oVUVGibklYtfs3X63M7mMpVzWXCWVlnlar+xOb/L2JMk0BJA5kOYu7gf2NMgLQ9mzszhVBNdx3FZZGqBKP1p3Zn4U+DMCuH+Uy83MZvHKt971F0HkQw4vz83ZhlyCVJ0iXI9LUt7g7w/zbjouYaRaQLul0KgfZpES45Vf4p10mBnpBMr92lWJ9/GqGzVu0wRVnY36NWNZRG8L4HFWwnfpjC2EVbHh+LbwZjnQ5doYkqLn0zekU3RygXVg6tQIahbofFVLs+1O+gN+xrj1vjzyXsIqNqzh622kVB+Nxz+mSSxFyT/Bub/SDdgA89yoDcDsevD0Z7PclLeNKc1A4eJbjGL++Yb0Pxr48N8bdlGcaLJCcr7lj1D16BAqAU+VRwpod6yNlzQiJhrQQgQ9t3maQ5Dnw4H6NTbSBmtBUJfPT8yvIHc+4eOKW07pK4YB6KFETKvMeVM937tPVnIwMBL8Kh7yQxT355OXPGN1FIyTifox3uDe2S4cZMQ+ahnl0y
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qSzu5wcAoNc6vIiJZcF1AFZyRqT4SDJPYdJoi/PlSOePkVCYGCZAkOFSAgfSnjFQHyb3dt7NVNNH7A8m1CfIdvL9m4T6TzNZvLIysBKOSi4oOi2wgon/Qwu8SjqMGSgZvQn7rlkLgIxdN2A4a0RAEeeM64M9WnvUy3JKGGgfWKVG1ESlLDoNJ7bsDSs7eExKRGHz2LIJyFBnzrdGnqlYK/PEiSEtgXdzpy4IMRusXyclqqJXrUtOtqEbeSFHV+krLG8VbkzSCxRdbOMoQZ0UrvsQMy33RZBd6fYuxEgVaTT5DsshSJyR7LXlnbyYKwOh4U3UmCoMCiT2hm0MNy93pHYh3hviowse6+GOZKcDGIA/Qiqz9DkG2B5ZHrOQIo43s/sJN6MXWKCxbL/NnRxd0uYeKSH0McZtTBYZdjpO2BCRzVtJP0T19AG50n7D1VL3
X-Exchange-RoutingPolicyChecked:
	rNW80AnC6FiMaVrdXb96IVBN4WrgyNUCgdsfEKoeT20SsJi1hXSWFRDiVk9v5vpVsY+xRP7ti76OED05NmNUuVaTj4MpsGUV1dBQ1NP7NHquE63a5Ds9y64tqPPDTnJdoSq4+BPDctegyBFICMIia5btJxTrfslvth99K7yk2JZUYSm5GvLLQzG0emdQIOIGPL92/7yvn/MJIuFxOE6NgS/9rxXuYTj+L4Ckxy2y2teMqSL+VgxsguXCa+UGajW+KqS+SXEDwDxTY5l/Z9R+lEMuYshJaepOMGHYbbTf26qZoN5JTAdHyM1NAoLWgFybx4urVW1fV2rHYe83ObrJ0A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S4ig0gn0HLPiLjTuIVa/+1fmZMprP0OihXkFrI1kOTz6Qkyd8LL8zN++lcEOf3R8YmO1nUb3z0p1jvjaA7miQA3ppJs4A0XIoQc0giVhwnh+JAgp91WCJao4/N+NboCY565QOdbm3xVnHDIcvfMtZfkbvp3EVHLyVQISA/iMHJort9BkReuqiG8lUwMj8QpSWOLrJlR6SV8p7Mv7U3RMUyCOJiAsiHsAjuGL1pHSX0gNRCv+/M33w0GTHljX17dgLbXOzJ3bjzFWkA5VSQcc4mLMWJsoGeH8fXgFssRI+2ovS9TA3zSRqtOHd+PvRyN5oWZR+tB8aT9RtpbGJDn+1OdvmaoOXFJ4LkJylHQq6IdeaYNg1pZ+SmYY3vngQuwKhMyIjtsZH97fRWTPg6lBNB0P2rXjGVRP695ziofhqlidBvGxLfgN2YONMSb6NCw/EGeQ2t9FFKZDyAwcPfVr3nWm2d21YzBYxR3lyUFnH8VvZGYanveEad6qaCLexINlqZxKpqEorEIWRbZ19xT+GybE97ypSqrakMnP5RelK+O7e1cysr2Oc4X2gKOXASHDi/9OPzT33O1aujr7dZI2SafgEANEthInVDSawLXx+J47zhRuRzLu4rGr2NvTvAAakLTrHYT4PJoJa6xBiDvEDw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:52:48.1940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d2e6d0-dc4c-4448-9f8d-08deb8228df3
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB3863
X-Proofpoint-ORIG-GUID: 07Sl4udhuZRBdxw81IYke99EphAjKlpV
X-Authority-Analysis: v=2.4 cv=dtbrzVg4 c=1 sm=1 tr=0 ts=6a1089e6 cx=c_pps
 a=UdDD+omNl1Ext3Jod4IcCg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=p0WdMEafAAAA:8
 a=98mQFhz--LAxPS051FAA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE2NyBTYWx0ZWRfX3Xfk8gwPvMbJ
 ukTAUzbP/LUQqAP5LwrX5+oX2lMpBHkDNpZRKhK07iRMu11mh3sAlofzVun8VvHPRm1Qh4vRSFs
 Il+n3zNUo1CsYjXNC1Axh8/x1WYauSI5U9RTdf2sIE1kbIxieycMmJ+KMKLT+6DGQ5EmBanQEnM
 G8Sf3moyBvu2X+gbBYXouDtiF/lWfQWHTi8SmiFmQ+ax0NoFEiDidPZYwGRf7mgg5h0pLttyG19
 SHEVw+tQOaQPa02ot009B70+/FO4pJZsqp/5ciJtDdrTWCYLCjWLeQg4YogZifzUW0HVwqVP/m+
 sKhPsmYyuDjV6N0BSEerpazZp1D++pEUo8ozZMHQ67EEh8IskU4aAm4t7qEP0Gm3ojAiNXdHoVO
 zBKFnhRgxTIfrdBgZSou5DPfHx9/oHZN1xpvyf4fzrNeJsJFYd/ue1jlViXzVSknNCf1GAc3ExQ
 lXqzPpN62E8Jl1A9AKA==
X-Proofpoint-GUID: 07Sl4udhuZRBdxw81IYke99EphAjKlpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220167
X-purgate-ID: tlsNG-bad1c0/1779468777-43B78A53-DA138D43/0/0
X-purgate-type: clean
X-purgate-size: 585
X-Spamd-Result: default: False [2.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,gitlab.com:url,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 7042C5B7C95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This mini-series fixes a few log messages in the Argo module.

Patch 1 lowers the verbosity of a spammy log message.
Patch 2 corrects the debug logline.
Patch 3 cleans up existing loglines by dropping duplicate prefixes.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2546842322

Denis Mukhin (3):
  argo: lower level of noisy connection-refused log
  argo: correct logline in ring_unmap()
  argo: drop argo prefix from argo_dprintk() calls

 xen/common/argo.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.54.0


