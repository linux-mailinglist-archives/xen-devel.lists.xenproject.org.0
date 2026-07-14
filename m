Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pnOAKAsVmr+0gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 14:33:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B61754989
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 14:33:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=GWXjwdST;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=RMp+hWFf;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b="Z6DB/ojH";
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=cMy4fDrQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362357.1614191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjcKF-0001QF-LD; Tue, 14 Jul 2026 12:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362357.1614191; Tue, 14 Jul 2026 12:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjcKF-0001Oo-Hl; Tue, 14 Jul 2026 12:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1362357;
 Tue, 14 Jul 2026 12:33:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjcKD-0001OI-H9
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:33:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjcKC-000xOU-TU
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 14:33:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a562c71-5cb7-0a2a0a5109dd-0a2a4507d574-48
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 14:33:24 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a562c88-b4ea-0a2a45070019-94a38ff1f4a6-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 14:33:13 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66ECX6gk2549608
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:33:12 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010049.outbound.protection.outlook.com
 [40.93.198.49])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fdaygmetp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:33:11 +0000 (GMT)
Received: from BY5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:a03:1d0::20)
 by SA1PR16MB6487.namprd16.prod.outlook.com (2603:10b6:806:3e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:33:07 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::8f) by BY5PR04CA0010.outlook.office365.com
 (2603:10b6:a03:1d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 12:33:06 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 12:33:06 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66EBS8P8190560
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 08:33:06 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc4wqtxdb-7
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 08:33:05 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id jcJrwzqw9UUmPjcJswUC2A; Tue, 14 Jul 2026 12:33:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=qoG
	3Gz8ZSeVLoThnROpMdrDqPQyPBZqS+jU5PPXUnWs=; b=GWXjwdSTGPZ1e0sVEl0
	vEDQ3HHCje2jeq2j1LdbklO9mb6hTCKh22eC7bdayKNDm6j01rupLem4hDIL2NNE
	nhwh7hdOoVwrmLrTSA5f36rSMfUZBQ69rJNdsIy/Yayse4TCP52w9AlBRW6PVcAB
	Rmc6B8k3ulPWDNN4oueCO6q/3tTIUVQSP39ddi3l63wVY+nm1PEdTpocAXiKAEMc
	StNyVBaJMXRmkoGubUcNkJWNH+CDLIbrEy5JEXI0B0fiCw+BKZsWoyPd28h6ZYlu
	QC+jzRP5I43IHrBQddRcx9WDTmfO+dY9zM3/isigA/quDfP5ef9BJF3vo235Oqy5
	o7w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMH1f2dV5L0s2ZqhZv40mjuejmCFInfpgxHvWLe4mrqaE01z9lzvqFwpscRQdgoY/cHeBeSsjGdWYOkuepkttVi1dQ7Lxjdmwvxc6SogBnKZaFAJ/OGH8Dg+0JC64BTaEmXmjSqWNWjSgKpMwg+/VRdCo+ENYJQesr1124AMC6YpT01n6W1mZ7OJkLJTK6L9Fxo5Fy+6kI1ONji0A3gFHnD7okYyifo7J72YdbHtVuHKi9I8QsjKD2Yvev3CZvrIhSllQmPU4qYA5zgyB7tudib8onAodmkkCRZHSgJeUsBczOcteSa6qIInfrJWl1xPb/H5B4oxBe+u+6L47tvNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoG3Gz8ZSeVLoThnROpMdrDqPQyPBZqS+jU5PPXUnWs=;
 b=fmnGpMb0sNrpwDWT/0v8wUqevG9nELhzOQd+rVq8s4m8FTXDJZqfSGmBlLiMWetbm8gCSC9A00Jyy8RLjW/UTfPWClvLv6W1Rk7Rkc3HkXkx1k6iqXXOVFouO3PUbgsj/msOy3VfI7CE+dHH7u8EuFPViZ7X8SspClyHo45bGX6GokJXhen1R1hUKOohlT41kndBbyCj0A7evY+c3Y6qjmmZaoxtMJxKbPD5U96fBxlfgd2R4KPlczVydcwH0ozVmuvV/JwH/F8TvBdNi4lx3oTqPV4VeFkys869zAg2kRBBMyjrZU4VgS7aWenGUmz04JBShEwRPWSeizKNHKMuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoG3Gz8ZSeVLoThnROpMdrDqPQyPBZqS+jU5PPXUnWs=;
 b=RMp+hWFfOYV/pF5rbB4Xc7DsEb/czhC9+8636k4LBuWtRfnpgJK/y2UvnAyC5Y01cP/OonuxQkUQO08PDPJjKGNimf3F7F3Ai7MWOwGOi44K/RNDw6P/J0dT52UxROFR6ihOlJ6EYVsVFmX10bnTH7mqCZkOOST5ykz7RJ6hq6g=
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
	ppserprodsaar; bh=qoG3Gz8ZSeVLoThnROpMdrDqPQyPBZqS+jU5PPXUnWs=; b=
	Z6DB/ojHdsakafqqNIL5U+/A6wXdkoKFbBZgrsnVz6QnruQ/rrCMXdgsnRidxLuC
	Sz7A4DnOiuvCUCduUVCKa/DotVzQVbB2OMO88PbiqsVPpuhzdpURjxb8WTF7kGri
	a4XRJPkAJCkgB27s6e5/KgOf+6vFQJRV301viVXUrh+sUvq/onExaLaEaj3fsftl
	I4Z6e4xR93Qj2+0Airx/YwPDEzaWn6MWg0CUnjG30STZxXKMtOfWw3QpZetQNjff
	pWnx++Z8CcyQvBKHiCE0SUMWC4YQ95qTE7mX7H201exVlNRjh5gFHOp7hlRLCidz
	QWdJKfYFf+BJaQIBUs5HAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=qoG3Gz8
	ZSeVLoThnROpMdrDqPQyPBZqS+jU5PPXUnWs=; b=cMy4fDrQU8szWhVA7j8bBfW
	kI1Q7iHzmTQ8VH1zGxQ+soHO2e3mJ6C/QXkiB4ByIKSvejTWa+vIwxLT0tLgoTtb
	CNvtz3Sq9W+7JOy8iZNyX3rOOTcJF6vADjbOPIMzgHqXnVDf/zMl4A2BSU+iDqZj
	ktkuFCklU4yCE6/ABVhB/wU9ibMzjvlLoTEiwO0+hYk41E4Kv1yAISxuAzYUPWCa
	a2mmlrz6T4aWz03oMWjE/vhS3GeWYFu4R0knl16RLB1+q8oa/JVbYXLKYXueDyFp
	CjI2td8W5pM1mYiF2W5nepK8bSmB3WsLCQQZ0OYO1X3fxycHac0ueAFn5PXm2Vg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jcJrwzqw9UUmPjcJswUC2A
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, dmukhin@ford.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RESEND v7 1/7] xen/console: promote conring{,_size} to __ro_after_init
Date: Tue, 14 Jul 2026 05:32:34 -0700
Message-ID: <20260714123233.1114737-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <93763802-ae88-48ce-ac3f-2b0ab79b4431@suse.com>
References: <93763802-ae88-48ce-ac3f-2b0ab79b4431@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140130
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|SA1PR16MB6487:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f031d39d-6b9e-498f-315c-08dee1a40e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|22082099003|18002099003|56012099006|11063799006|3023799007|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info:
	h2o4tGY0KR+c5jMLmbh58Nq6ZM0ZASlsh9dQjM41ljxsAiEExn9E4PFfPz5SSKtBgHXo6wMN/RxGT0sQBjVvlXNnrdqw6vn4QLcD9Mcds6kfJHuXcS4WccEtfW2tdQlIg03EsaE2/PHDRfQjbof2eKjTjsdX8llcJhA9upyVI/JSfb7GDBPeMzQbVRZuQx0p+RI7Abo6TlSI6xwEoWIuUrVs+lsz9sQbOAR0Z6ix86YAw8En30UCCh/fh22fc6U0YbVde3RiyMprVI206Efgo3sb3YOpT4dgSuf0VRZ6tfLwa6D9WKaibriie4+I31zAm74YsOm3SxB3FitozHbOjHkqtekm2Z5qYFpJW4jV3VPMvDA5sbD/xqT6IBS/LlnCD5APlWzbk7o1AIatDuriwtU8QO1qXvGr/ai+PFxq4t6Wc49Uhjb7MpTSbTtHF0jWYsT5Po8paTCUnaX0/f7T8uR9WXXNhtK8tkgAv3r3ZP0Evl9F7rX/lSKUUFSVeYYG7BrRfNqfWK0KP2y5gubRZkVjaOJnLV5c7U3mDw5Y3E5ofTv6LvJy7+5REafCYqJV9OuQG7oSI/xhFUSIQUk7oPUDHwaN7AN1p52N2KoVtc3yX1R6rxiQqB0UV/7lIyuLic1+W+io8faFTiFjKcXZt3cGLqNQnJYKbk3KzF6DKLaQSsUgbFc2KK/VP1zIH2TCIa3/t8KzLkI507Xpiy1sHg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fhRevS2aXG6i3Sj1Tx8xdTwrIF9TZsCdtDKbCLxEHSo6CqNGGdAR3MUZsN2HWtfoJeWjKRx7YKijLwQbJlSqHnLKCOKJZM6pHRRsztunmQfEFo+EjOOYILWRJJACvTwN1qTKLJNEgRP2BMmbDekHVxtooSYhohe85ObyDOooIVvt37ANkf8QN4FGtn6KWS38aRjsoVey+Y1zMZIe7Yl1Lblh7HkofPveR5a3abI5DuEl4gjOPOJW+BR3KUEI3SrkPNlQIV1l/3S7isD+z4+Iykn+rHmx9lwwnz7NRUMs8FqF0qj4jwLlACgS9/ds7tv9jJFAZF5yoZl9SdJO9asEPoQzmYo7KxE/fchUCHyV0zyG5bZAG9l9kq8rZWte9xstg4ccz/LrDFZVOTtRW2tOP4ZHGEUXU/m7drCTcJDLoUXDHpJCDVvVD/tCQFmO/Cbp
X-Exchange-RoutingPolicyChecked:
	XD0RuXdg4MZcq9Afi9ljBRMTgnCNHg5hFM3crvLDGasoWYi8tWeIirHBPv0q5LuRRqq5lz3Nu9SICHInWIjet6KjebsQXsk4QZONZIrOT98h4ZiVvxLgXvoj9HZG9aiHOvs8IhPq+ookRmx/HLJU71rcDtXAHvqjCElkqHtr6Q1jr8253glQurlfoj743JR5gIFzqolOF+Vjn1nlHcmvdvFIi3C6U1LhXE+WUBEHG7yP46Bq2p2J6D+6aoQStVGcQaIft564Mye5nqFc/DwK5Dw1J1ECTREmlH+chP1qFqHk9aW11M+TLvgTs5ywpR5sF4voXnosD/llH7EhVMilpQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XBJcJBasHIKm+1P4H9AwBLStTSCAZhNcfAlj/ICiRBdxAodQm/lOMwzR7l8Fy/HkTYSBt3p2IUKk2EWJX0V1hc7bNixHpnpioLNwbhoODp0fzKaT8XJfmh6Bi/9VB/y3ODEZy+FZGNSV1x2H/ky5mi3h5jqOiUpnof/vp4xY1kyDI7+66GjWz/pPYrxwTWGJPtRS3C3q4iptXnPQPPNLQZtyvGjAgYGaBZPijghqe+WnMHj+K8lOyXnYpoXxGAXs52huW/Utrxi9HoUBzFnzfLexBUMNBlrAR8YXm2M4e3/4GuTG/Jm+iYfayZu7jzizYFwrgG4Ad5Di7o5RKQsAHEEA054AXdvpdcC+RF13vZ/ZQMY72iFFWi0i33mBIS76kGu9QF2V+XdVPzZOOxLzOHSo4lTOsZiGBozjdOrMHaFBPvTKXnrm0MtilSS3p0VnFb8Ei9V9Em/ue9+LZkwierrPCuGtZ8um85mS0gFY45Ion3pPAT5GBRHeMOk4FSgviOjBJvXKhwA/eBNjGL1LjQmh+Ow0rfkC86wKrVKywunB0MrhDUCf8i1zEVEShUQfmjI14YYH78ELxVTU+4PXaeqhfwv7rpaTIQXMlPIbdfwP9abxEQ+JpYonom+DlKm4z4SWkoEeQzOsAEqzGesDBQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:33:06.3120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f031d39d-6b9e-498f-315c-08dee1a40e47
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6487
X-Proofpoint-ORIG-GUID: 0DJcIJLu8KEVB9iM_pV_fmi3F7kBWDQI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfXyqcHGwct5Eaz
 7wZTgqAy+5Sqp3gd6cu29G5J0/FH+bKLAfMnQGiQnzVSzlx/NkvM/8Ac4zSiLcSYq3Cj92oGyi8
 Qx68VKazDl/fSZsdfwkBJoBQks1k2WJwgzq552QRFTwgHMv4vPOo
X-Authority-Analysis: v=2.4 cv=LecMLDfi c=1 sm=1 tr=0 ts=6a562c87 cx=c_pps
 a=+3f3g5PcVU0WeXiSVbezXg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=cbNQJ9GKAAAA:8 a=tHz9FfFoAAAA:8 a=KJnTikxRzMM2nk4UrzYA:9
 a=3whSkbs7g9Me0DR5EJEX:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX+4ITlH6+3f5a
 63CTVSiqta805jORlx+3WlSfmIFxIlQ3WBWzdBrS4hNuwGRMmlpe0vpySP4zhbjdg3enlGDPGdB
 a1/f7DSX4qQM2aUErgJlwRqGcR/EmcK3CgWb45y/YyNvqgWVDykUoshaopyQ4HYGwMB59I3vTta
 925XTw1oWNFd/oVu67lQPsOtMPYwc8dn6RTy1Fh1SiWXYVO4wR3rJkekVYjiLOHwyCQo6UDDm1H
 /BcGgyIUK09TM/O0ESI1p1QBY8nHdP1xXJWSEQDy6qcYfiNHiV+vSRcaKDSLFehCb7Sf2MZ+ZXg
 6aDs3eml+pPioCpvL41UFgPjSpwu8WBAwl5BTCPD0YiddNUs+HQQxGT4Q6sGutBKmUdjEigwMix
 lDQz5wnbWEcLVwpvgP4032Bdm1mW4QuqLmxym2WefdeAL4potLTKLxEQLNCG6B0vWrOcisWKDR0
 DDSWJuJkzvgdoGArhhQ==
X-Proofpoint-GUID: 0DJcIJLu8KEVB9iM_pV_fmi3F7kBWDQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140130
X-purgate-ID: tlsNG-ef75cf/1784032393-376D2AE4-95C3E521/0/0
X-purgate-type: clean
X-purgate-size: 1674
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:dmukhin@ford.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:from_mime,ford.com:mid,ford.com:email,ford.com:dkim,saarlouis.ford.com:dkim,azureford.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32B61754989

From: Denis Mukhin <dmukhin@ford.com> 

Both conring{,_size} should be RO after initialization is completed.

Change the conring integer parameters type to `unsigned int` as required
by CODING_STYLE.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Resending to include forgotten Jan's A-b from v5:
  https://lore.kernel.org/xen-devel/1579e081-b945-40b1-9a72-f6c5f7ed69ca@suse.com/

Changes since v6:
- rebased
- preserved Jan's A-b from v5
---
 xen/drivers/char/console.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index dbda7f259668..5ebbbf63c092 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -340,15 +340,15 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  */
 
 /* conring_size: allows a larger console ring than default (16kB). */
-static uint32_t __initdata opt_conring_size;
+static unsigned int __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
 #define _CONRING_SIZE 16384
 #define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
 static char __initdata _conring[_CONRING_SIZE];
-static char *__read_mostly conring = _conring;
-static uint32_t __read_mostly conring_size = _CONRING_SIZE;
-static uint32_t conringc, conringp;
+static char *__ro_after_init conring = _conring;
+static unsigned int __ro_after_init conring_size = _CONRING_SIZE;
+static unsigned int conringc, conringp;
 
 static void cf_check conring_notify(void *unused)
 {
-- 
2.54.0


