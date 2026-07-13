Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VWEcI5krVWpskwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5574E688
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=eFvFugHy;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=Lxn8iC5F;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=I76+8Nr+;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=pxrdxCpF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361819.1613922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCz-0005Vh-A7; Mon, 13 Jul 2026 18:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361819.1613922; Mon, 13 Jul 2026 18:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCz-0005SS-6G; Mon, 13 Jul 2026 18:16:49 +0000
Received: by outflank-mailman (input) for mailman id 1361819;
 Mon, 13 Jul 2026 18:16:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLCx-0005Cs-O4
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLCx-00EXP1-4V
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b8a-5cb7-0a2a0a5109dd-0a2a4501c2ae-8
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:47 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b8d-3ea4-0a2a45010019-94a3921789ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:46 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DI3MDU4009463
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:44 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011024.outbound.protection.outlook.com
 [40.93.194.24])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fd326sp79-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:44 +0000 (GMT)
Received: from CH0PR08CA0004.namprd08.prod.outlook.com (2603:10b6:610:33::9)
 by SJ0PR16MB5126.namprd16.prod.outlook.com (2603:10b6:a03:4d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 18:16:38 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::69) by CH0PR08CA0004.outlook.office365.com
 (2603:10b6:610:33::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend
 Transport; Mon, 13 Jul 2026 18:16:38 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:37 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DHcXsp2030352
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:37 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fc7qrspvt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:36 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id jLCjwqKDWipGjjLCkwe9kL; Mon, 13 Jul 2026 18:16:36 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Feu
	l+agJDwY1vxKZsQEfjMl+EX8xLNQ6j7CfHECsy6w=; b=eFvFugHy63fp55PMoiB
	6qptXVP29IXqC0z8U8g1xGUjW7veJziNMtp0WAnJCk+GiB9Si+iYMISwfOG7N3pI
	C2aPmsPcMUUBfQISSliTUz2kVizO0jqjUp8OS2KmFVshaEmDV2lsD1gfywNp8amC
	up8U8L5gFQ7hQNwQi6XsXqBRakE7RYRrihkxKiFkULZJ2k1njiwIdM06FFgsrA2i
	QrjttiCek1rnr80BXwHMAEdrd0L5zbsN0iKMjrCjqab5Dpk7hYTzrFRn6mVzdgdI
	8Udj/Z0mKEVNCMBebwHg1/+ssyXx+z39WCDkjZCggaHZXW3IQfazraru3dZWPLTc
	a4w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJ+TP9ZEWZ+mqf2Zen3hoQ+I+VaMbTWxeIUiJ4zd9CR2B2vAxzvkHrdFB8s1KCtBaRYrF9hEMdOPT8y2KmWb5SX7F6mM8C9Tez6TiZa3qmBXZY3XgT0VQJAucQXS/S10K/2aX/ftKPt6T26snsDBobXWVxmeQl3D4nLoC8Mm2EwNj065/ADC1dLlP1g/LIuWL4XPr1h2mq1KpXFbuLtjo5KQ460FxXCc6H1uEphqnZnE/2kWNq6k89dRegjqu2A3neBPUSQJeG5MPwY3UimACNM/YGGJZzEon5gymoB4j4jbkVPaHj6VHaLGeTdsf7kC+m/ALI9hIGqtulXgpMXONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Feul+agJDwY1vxKZsQEfjMl+EX8xLNQ6j7CfHECsy6w=;
 b=fha5eAm43vfZwv88WYNqJ1N3JAmPUWIA1V6FIQecnBZ7UgI61WG4ROi25efsnGc18n+OxWX+Frd7j9JE6mN8Ye6ZDNfuC4u0f5Ud4rRDYLXHa+BE7Y1FpTywf5Wi2ShpXyKTFRwbW9KO/y2JjbcOpoLLcvqjwrlJotfY6xqxKI6J+oJSw7mSopDyqdmrk7JtdK7xqw4IdhuI94AGqCSgIxWOtH1ijHANf28Ac30WvV0uUMbCmTz3N40bhcG5FWck6iSymCdv0G+fnzeiMVbIm3yMTz08M4gZykXmnOrGLQkg0YjyG51DrUhImWI7nSvk568KaR5L/Eag7+JkkxLN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Feul+agJDwY1vxKZsQEfjMl+EX8xLNQ6j7CfHECsy6w=;
 b=Lxn8iC5F5STBvVGqyh1GqBT/dPyQhWFrs29sj1Z4WVb0bHHhR4j/ZHapilujIH2N1Miisq/Cd7mdjTc8irMSxV6iaTumR/e6x8wc29LgW9FyCFSDFEHqhTSV1SNCiEVcLr6SNKxkMeCgvjq1/qkJz+8BsHnDMOpDFCX97h6oHP8=
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
	ppserprodsaar; bh=Feul+agJDwY1vxKZsQEfjMl+EX8xLNQ6j7CfHECsy6w=; b=
	I76+8Nr+kjHA2KfWz4hLgOoxQRH4zUiWJ9DmqQxhPLXRUE8l5v8T/g6iS82a6Z05
	54VhFnM0qE+5vesgG5KlUu1OZlQQSh7v/2wMihsenmBqRFMs7GGs7GgnJdz6rxBb
	Qj1pdPOc5tk42NSA7tYqNBCUC/37FK24cGWqPhn5HUDKC4K3gbVicAXCQ5snogvL
	pf+GGT4v4uT0xLWAT0dO4xXeGFhjeWpQk2rC1+xrOfP2wTzu27wdE4EsBXLi1ZWN
	j5ImB4Nizt66xUboaY0l36Ww1B+OK1WoP6HQWNOcsQXACeExsSnmYxcNK4/cW2MU
	cGyOBVVTv0lFD2XBSKvTIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Feul+ag
	JDwY1vxKZsQEfjMl+EX8xLNQ6j7CfHECsy6w=; b=pxrdxCpFE3tUzwqaYbZkh2J
	9pJd2A+USsVxxzl81PnST3QRp7589Mxfk7Umn0/1PToK4KN8ZnJx7n2qq7FsIjLv
	uonPMOUuON+1uhui3kOW64PKJIZfY+NlaDI1hr/KM4E5pG3zpmL+/aheru+7dzvE
	O8ZE98EO64e8qQmpm7GJgeu/DYq/IDchMkqDNo7vWDnh/iP6jeqYMFavms8oqI3x
	fHCS+aUqhkRpvFNLpPD1pqrttBHuNFIp21K8gYqmejT1ypXZdD5gl46xvXSC1g6M
	+sMjKxi8LWQLKSDaCJmgE49zKMcHuEeATPQ/c39oecfEnvJP7bRB/xjV0O4qDdA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCjwqKDWipGjjLCkwe9kL
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 4/7] xen/console: switch conring runtime allocation to xvmalloc
Date: Mon, 13 Jul 2026 11:16:16 -0700
Message-ID: <20260713181619.672176-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713181619.672176-1-dmukhin@ford.com>
References: <20260713181619.672176-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|SJ0PR16MB5126:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ec140e60-3bff-4de5-d0eb-08dee10ae139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	13uNBl/mLzQZHeCvm9jPRiBV2N+R+5Fb/16QZEdUdvFDvsXG5ukQVgEMCEt/2NkJiYcwlqPGNQZ47OUUZJtiynCFH0EwLWUwyKSYcEzQmr8HJbtihy/cCpxCjjlRMEz8Gsf5HmpPWG9vD7916aFvoT9Fev4AlJbL/n/99/DuGuOnWhONqEYQCeWPUxrFEJxHQIf1ddUYW6QJZ1As2RXlkhj+eWdNv/+Y7EnsgAkjMnMsBptef9QUl9j3SEn85G94B9DAle/QInhw05YsISlMb4tgVurIktmMZoRYgPx/cOoitnCiI3YBKmIuXceDrFibWpzOJZ+9IVwM8iNtUgF4XxoURnj88SLt8a34fwZRMfnaPRYYS4N9XNKxGC0ZX9DT51vsvhXwMFAuAgD1rmwznfZGcXkqGOaQ64DnJmVGaQXRgD53JkRUzwJ0UxG9Eyvhv02f94P6fLoS/vrR+4LDUNqhgFizOG1Ekz8fICnlrtPcEYgqIQd7PXv5cI7Ux+wc6W2LEc887QhEjqcCrzeG0Iw9QSmkF1U+dc3bC3Fpg3InwvUNfy1U2z1O5lv9kpMHw5SuY3ZWxjCH55G5VvGA9jswkmmHzpKKrBtJoTQuZnBFIX3mdTcHOnHUrBgGHAfjkl9gnDHifsvaIKjOyQaHjRPd+mtE1Jo316GS+u1pVZJT0Rtuf9EPfvkSz+ffargK0UK4NJUN5CfnXzJQC8G7Bg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ngxLHaGJVYHFVvNGCnzpqV1WPtOzjUrZCsAlXzwOR7RWM0jsXNxztDVWFaoD++SFvAUGLc1oPJaOyxZ6ul2iHzFjRnezLAvGh2QCk52MHCLICVuW09bKUtZHc7EB30GdhD2Oc7lTmJUpLrZ8WT6JJmAYsqnjWiOphD4FYV5c7weSyiF2g0YgpntW3DONog1aY8fy5z7n4myW29+Buzq1P9Hh1cer+E5d1FZLcjlLboZY2LYsFgIz/MamnQmFwJ8RJ8opvW/Bxl/Rk2zvI6ps2f5pCpd+0Wcob/aC7evM4RCgeCzrLdTY/GQisNTr5HkhyYIAwtmZUkeq9l9Nc/ijUwQXnYD6/QW1ezBGFWlILcwOYWQk9E/8a2rgbmb3W5CaZDpxSC05Pgaqay6ivKR0NVSbghJn92K+mNxnWt9gHClRHrQxfTrEIH2PSCHA0Ke9
X-Exchange-RoutingPolicyChecked:
	NYLHsNn98WMrXIDfCbNGTSboCUjaKbayuu6yyUDgwDnu5JEBsHSWmCISXvYI2TqozCjFNH8WbAMGJ12WC01Qg3SkkCeZEIratSa/LE00uLBK13EUy7qyEmRPTLLgY9uUW8LYmg0cUPc2x/upqgJaHHWXnihjaSQEYnmNR4MaSgnJDpr51bKQlSF57k5y9hAOf9bQCWKQ0rjlDyYFdk0haqdKgu12BA8o9JpUUgsnm+sSAOvWAZp+veOuDBlY3hrF/sntjZQnHLDrQNuHkeOqUKUDvaRmKQSH8J+aHDZZohSUspTKJi2MXJsPaTFl8RSc0kq0SMc14jj4uD58MUErIQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Uu8zj6psLZdv8H3qQLi3EDXLDRHYCc7cTrD9XJ9iEaMR02MrNnra0ABRMWtXvNk7SB2Gcf8jjUrmU4sSNphK2mnT48+wWqJKv01LX7bnMlgqP69agwX4UvF1jJ7/w0WY4n2MxctmOCibhMU+B55b+Vw73Bbp1GZhfVdBOHHp4ew6hctY/vekc9ldHJVJqcLKtoofqX1aT7gNqfqF5+W3bjyFrzDW1VSLOZcAflKlSGr3PMUDn71cEuH6pvN5oQm536aDB3Sj12N7pQF39S9Hnb3kdQwZS6vPRj30GGE6sJ+gPGZJYlut8kgylC1eWFeWtImeVjg3NDaOdAg1SHdCu51dWSegUR6fPUmYNKIs3xh3tHFdxwfCEXXBMwIYHtAVqD1Of76gc/Ia19pwtwXDmxeoY3k1GHc3SvfCMf1EEEVryp+hdzBnTnHWSPdD1eAv0Nli2nXineLO6G74Rm4kLc8LcxvosFYkQaBylr4BpkrYsm1I9GjLoYmM2IAeofm5UzqNLcdb16hZus+nPtLMfMO2DlFOLoyXDDj6zduPeyERyhSwwEJX04ioYf6gLyqrguusO5Dvu/eFGjOXMc/vuPzkD1aoqMmqvGc3LZOBMUIhT0cnp9MEQxqjgorhAJVvinACppLlpmKirYQOtGuzdg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:37.6329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec140e60-3bff-4de5-d0eb-08dee10ae139
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB5126
X-Proofpoint-GUID: LMYkOeSy5CZHqhCADgc_wqPCZcXCw9fd
X-Proofpoint-ORIG-GUID: LMYkOeSy5CZHqhCADgc_wqPCZcXCw9fd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX/3Kk7Q8pEZJs
 YmyFC2spctKCi0aiuLSak6Ql9cZvxP9aK3+aVlhyYPzsPA41HKHY3KdEHkygRTmO7EoQsR/Z1bJ
 hhR1jSP/9Y4WgEzf4oPOig78WHAXShr5DqMf7631sOakuzeqMEWm
X-Authority-Analysis: v=2.4 cv=C77ZDwP+ c=1 sm=1 tr=0 ts=6a552b8c cx=c_pps
 a=msEVGK6UkFBbvU8JCjtEeQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=tHz9FfFoAAAA:8 a=rFyfnguHhtC7fIK2BTEA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX0SpsL1xntHh1
 Rw1SN6yM08uOQZDimV+yHe9dghPf9cUAOFB+mkgD/4hM3Ge2jXW1CrCij9A/yELAcBUYjDMf+b7
 9z/OGL2ZljXSk7R6AqK9yYvc0XJYOSA61+VkDi+WMmQH/bzg6Uu79BUcflAMnmRK5CQE/L8k/+D
 oR3T83hRB5cV4qcmkCJqb00k2iBaxMLitbnUZBdjcEoCrZ0heub4e4Ki2QGbA67Tj3wnVt0iFM9
 w4zHubiT/zjR4ZoYTrET8iGcAqqeN4BOYoGHjPQ7W5+EuovNFy4F67gk7issRBfcobIfhtFLE4u
 Hx33RU+Xs4VoFXXPCRYE6nfxqAxFCqFiBDo+8vUK/W+Sb4VF/PgvwdzeWsTFhrL4zKGeUBKsq8s
 vn8IpA34uUH9bvG0VgAGP/1GBkDWXgNj3gelqXNI5EMKK26yc0O7LfwOwGAdKsvyaZuIqktU4hI
 A9mrWcRJCoROM25/C2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-d62444/1783966607-3F2F40A8-23BB5A32/0/0
X-purgate-type: clean
X-purgate-size: 2637
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:from_mime,ford.com:mid,ford.com:email,ford.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EE5574E688

From: Denis Mukhin <dmukhin@ford.com> 

The console ring only needs to be virtually contiguous; it does not need
a naturally aligned or physically contiguous allocation. Replace the
runtime xenheap allocation in console_init_ring() with an xvmalloc-backed
buffer.

Also clamp the user-configured ring size to the supported range and emit
warnings when the requested size is adjusted.

Drop full stops in all diagnostic messages in console_init_ring() to align
code with the common code pattern.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- simplified size checks
---
 xen/drivers/char/console.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2da5005011d5..dc779439cb69 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,6 +33,7 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/xvmalloc.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -474,20 +475,26 @@ void __init console_init_ring(void)
 {
     char *ring;
     XENCONS_RING_IDX done, size, n;
-    unsigned int order, memflags;
     unsigned long flags;
 
     if ( !opt_conring_size )
         return;
-
-    order = get_order_from_bytes(max(opt_conring_size, conring_size));
-    memflags = MEMF_bits(crashinfo_maxaddr_bits);
-    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
+    else if ( opt_conring_size > GB(2) )
     {
-        BUG_ON(order == 0);
-        order--;
+        printk(XENLOG_WARNING "Limiting user-configured console ring size to 2 GiB\n");
+        opt_conring_size = GB(2);
     }
-    opt_conring_size = PAGE_SIZE << order;
+    else
+    {
+        unsigned int order = get_order_from_bytes(max(opt_conring_size,
+                                                      conring_size));
+        opt_conring_size = PAGE_SIZE << order;
+    }
+
+    ring = xvmalloc_array(char, opt_conring_size);
+    if ( !ring )
+        panic("Unable to allocate console ring of %u KiB\n",
+              opt_conring_size >> 10);
 
     nrspin_lock_irqsave(&console_lock, flags);
 
@@ -508,7 +515,7 @@ void __init console_init_ring(void)
     conring_size = opt_conring_size;
     nrspin_unlock_irqrestore(&console_lock, flags);
 
-    printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
+    printk("Allocated console ring of %u KiB\n", opt_conring_size >> 10);
 }
 
 /*
-- 
2.54.0


