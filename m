Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPE5CBiDD2oBNAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 00:11:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091C5AC495
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 00:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316023.1585627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQBbR-0006SP-PN; Thu, 21 May 2026 22:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316023.1585627; Thu, 21 May 2026 22:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQBbR-0006Ps-M9; Thu, 21 May 2026 22:10:53 +0000
Received: by outflank-mailman (input) for mailman id 1316023;
 Thu, 21 May 2026 22:10:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQBbP-0006Pm-0n
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 22:10:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQBbO-004eE2-Cv
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 00:10:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f82a9-bab6-0a2a0a5309dd-0a2a4505ab00-36
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:10:49 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f82e7-aaa8-0a2a45050019-94a38ff1daa0-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:10:48 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LKEgf22171701
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:10:47 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ea8909b72-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:10:46 +0000 (GMT)
Received: from CH5P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::17)
 by EA2PR16MB6204.namprd16.prod.outlook.com (2603:10b6:303:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 22:10:40 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::b0) by CH5P221CA0017.outlook.office365.com
 (2603:10b6:610:1f2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 22:10:40 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 22:10:40 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LM0Jkf1923806
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:10:39 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e9u9ys1sk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:10:39 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id QBb9wAeoTl9zvQBbAwKNpt; Thu, 21 May 2026 22:10:38 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=7djpnDKXX78zsY55yf381FaHrzR
	2Z9YAIdLj82cXheE=; b=jWeWn5bGGgmVkBwmUVkM1hRiWn3HyICf4Acmtd/7fQN
	KFWDR5N/oi+8gj2qbqcK4y0tpvZ8orYGCLa+H0jj1nHKMnTHZH+qk88/xsu3rLS0
	BBbvK+fWThmanD49ikPeYaDLxgm3hR92qH0BeYwC0qhA1HeIcjiIX5qNHcvcD4b8
	40CKVO9f/assEow6MPnSzjIMm2gTrCkuIZlLhSU5MpZF30AJomXuCltIZvmHlVGZ
	pQteAm+W3wilZFeW9cbmF+w78Ie0MKhLf5VZ/aOSxa0IBb239n9hPv3jnSGVYLND
	p2VaQpYJptrJERmnX6LTZtDp8DajMsbgJF/2BJkBOng==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6eQ4PURLahNmnrbuJopVONKWLGdQTvPArvExhx3KWxdq3PnVipxbfQElIE8y64Kak5wqkevCSbmwNt+HtcCu6E/A/HrgQAxBEtdPyjxovKmj03rRdv6D26Ys4EZOEE5X8spjLCntNbCduUSHZbARDWh/3c0310dfyqrs3SyH1BxzSJ1uU7OxMV8xMcCBK+iG8zBEh8uhmD9H2oRpLnRT34G0kLTvLj1A0OZMwwUTBXYxB4IFQfq1rgcTmjgCBITEZW/SAMLZr0GrEXoh7mihDjIOrd2z+aes3orBb8Ui3Joc6cFOvSwopFrP2BwSgVeWK+9rYKcPaHzuSymFTJN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7djpnDKXX78zsY55yf381FaHrzR2Z9YAIdLj82cXheE=;
 b=jdBrKCaY2+faPSyMIGPk7oXmLzlEpdG30G5HyLqvsBB1uYz6KAiT/oI/c8po48idGcu5tXVQKPLf23ZlXA8Drsfi4J4mZ6qKFFQ+FgcFHHtntHYyAU+VTPhiwTlJsvDTKsi78x3N6XhjY4bPoaJbvNKGljqsKb9p3OweweZcU0N0KYAAN+2Uju9yge6soNbX9An1M0XIu7jRLrWS6gEi8N8+7wN3TL+E3xTVcfv0ugh1ajY8pVCAt1nUdvs0D2iW2PlnaXhOZtDKz1jf/nWPLUshVkDJEtNgQKYoMg8Sl0kfjII57hdiQjJyJHH3g3sg3ZCQ9iH08lbqkTX2GG2z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7djpnDKXX78zsY55yf381FaHrzR2Z9YAIdLj82cXheE=;
 b=gBPCKv7/NScoSiYYdKASdwRaRDkxtksNJbhpAxcjN8TuQPWVKSAV2x+6o4uKCTFhqruwHoCbuXcJ1Q/P9ZIeze5chi1gB3YQftyCQEg89DmxAPGhL37SIEZ2Q07XxmJ3WQODCP+BKFrJs9aBqA/5ZSzxyfWlPLGDGSo+HTrQKpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=7djpnDKXX78zsY55yf381FaHrzR2Z9YAIdLj82cXheE=; b=eMhe4rky7iMI
	me8mw7otM3dEu/eZUZNRYh6xvpONHCBxWzrHoTVKDPLSCNWm+HbSn1QhFfyQKIFC
	Cie3w3wQGm82a2/EuZLU0SYw8mrh75cFn367VKt94o0ymSiIvCfmfe0pyh70XBbP
	eNmQ0cV2vauhNK9jtLc/2Bz4zWCuOWWcXCX6syPfRvaqsAyTa5Jnsky26ek/yEm8
	pwXKq1AtfdhSe1sbdzAiStAAOEBCHncy/xoi3MoClyhSlwXwrDqN0BbAFVBJmCVB
	X6OZ66rdeaSL0Ge3vzFCel2jIIPKSsZg8JQaPOh2MDAd1jaji83VOWkaTvhLGKa7
	OFwfob3eoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=7djpnDKXX78zsY55yf38
	1FaHrzR2Z9YAIdLj82cXheE=; b=NrebCysjsR4BysrAs51zgkSydHqRLJcL4Q3L
	9MSrvokcqIFzZmOdksV9VyCO7jJtSS1sDwij6b+/ICz2YmfcCV9pWuOzaso5lOjn
	8hrenS/S9RxmR9xBXYonJXpep/48q4k1MDEQ9bMOx9WNdyPJx9UiNUHfC/RsU20r
	nQ/tuO9xoxV43e4mRU1867z53QIh85Kj7EW/o1Xw0dnz0bf02FxiQuvG6KI+6Du/
	jKv+mq/4q3duEVdZv+o3arDBysql2RIeiLKmD9lqmCGofmKciJ0b2GWYMlAPFzOO
	tzzQIEOlBZbcHN34AoQmeQJrEJTLwsdX8Ze+L8kM5eced6RJKg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QBb9wAeoTl9zvQBbAwKNpt
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 21 May 2026 15:10:35 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Jan Beulich <jbeulich@suse.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH] device-tree: size first hwdom bank for boot modules
Message-ID: <ag+C21L9WoH3ngg8@kraken>
References: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210223
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|EA2PR16MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7232c3-645d-4ec5-d8ba-08deb785cb75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	nyGQrM54Guc+dGrjhzv53ogY5ye66fUNV0ejtGfW1LyKtxOAglZqfrsrPwgnDqV9eEWbRyFOpFKvDoHYn3iByF8usdLHVnTzsWNbVPHH7RlxtMkMjc0mHJhO4BlxjTZo+97txtIayT488dXGwaNbQLEbf5vsYddBHnJexX4ADJvpGd2wUeYldp1iNV1OGAugwUz84E8q+TcQd5G4lTRgYDrjaXv5cUvAlJIMtfGmBWaTK+YHN3WqEmfm2egGOeTwRVy8Gm01AlcnQe84/bL6M2/8v7pTMhYSyHut6FXiKqn7wb1htx0kyR5hA9iBdSbI2d0NSdn8r06jdqcSec2Tb3sDdlCpQw45NxG2eAAuFij7+zyKLBKlWN7FsrbVYROfx2SUcD0+rm9vvj9Qr8tV7DRD0wmfkvKIxcTn2X40LW6qqlc0v2m8PqMoM5KPDtJOfmwMRq1mNBqzcfMUOLSqCNo9eikrTBRyvOIbn4qaqFGCVNr6XKKxxdtKcf+5HyvjmMdEUguvFZWG5nTJHukXC4dvoeqGqueOnpjWI+x5MSFRzySpzVr6aUlkfRe9xA+lEublcyp8mI7PBa2XOy8ucFRUNXz6zX/2SxVKpCe8Lkju8MgDYRX7UXyJ6mcG4/3Mm+c7e9jl9nbSg/ja2oFb2XPbuAJPFkSuiwMuf7zxwdANUIzrT4fRnliTaZJ29tUO1sfbE/yDKUS3qPfpTTb/M5qHJKKnUfThwp0NvsEzB38=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yVjgsmHkqmAfEUCPNCcJFBLOS3aWKEkQRQujyvnd6pXFycsrte1wIatXz0CxTJOqAPxYAeF32tIozsybMs4MN+/wedR07wT5JUSA5+NTMPl9p15s4xxdOlMLarzudblEb56Qdt5VB7jKHkAC7IydtcmHZeHyFLZWSNYGWnksbJlV8nav5REZ4CScrqwgiBQD3XoXeSTeMCEoQWKS5aTUaNQgVwxNluezD2LAWuxS/WlusYf3F3809xXpDji65OmTsJ60yfJy1EH7h/X113CkGG0FuhM/lRD6r+IlX0Vloscq1zan4H2YA0N/kL4w0oUrVM3wBSCj6JeaCUfGwr3gqQ//pNcSkyzLzwDvdraexs9wILHoh5Ff4nw6tdmIYES2xwgUrbzD02s2r/F69FLAnlavA/Z46kEdBdIQkqy+cYxRRJL69lUbJDJbzv48P/Kf
X-Exchange-RoutingPolicyChecked:
	jbUda9bKtD5RsVzApGIT2hF94ud75cx/o2LhcLUvtwpJk2bBI2ySPUJbyHV7YwQqaq8AcWyX0RVOA2D0c7lRYSyzqTf0x25Gh1weWn7voT+33VeSDBnAAO04w0wYALZFtyh3vSkzVoO/CJtZbCpbgY6hpLEoW6aqr7J1YRQnVxHD0BbRhJTuqdPLsmZYtSl4Wh5UOpHG2JGigayfPu9UGg/WVOHzsHA5aTSrSOZNqGbBId6VIMouxCY6FmdkBmvEPtYTgDnjX7KJEg/w5dthcD9hF5hJ/MB6geqJUH3BkIRs+5tGp370/ujpyV2G1ataqQJjG2BJCKtukWLP3x+Plg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DzFBGOHI/S9X9uYptKZ6kT/EdubOeX1oOas5zngZ+k9/fJS06i8vlY6b1uR4Rvl8GeJv+pSAR3Aey8cJz8VfNwkmk81t76gmuEhorpV5WwnN/hFHM6FZHtEqWb8dtEsuBod2mQ4IwLA5U3ny6hwre5oZOV5OxVm4gQgKmpVdZfkatJG69fGQrnLh++RL015FMalbAo9wi7er1q2KqRMaR/E9F9svCK0WIxNZLzGzIQTtsH9USE/Pnqbg/Y4He53ZMQlzAJemwf/mZKXVGa1NyIsWAZgnyBxbjmfBSeXTQmk/zTfdZz4NA96UqarMspkDMJHcNgxDopACVDIg0ZsjIFYLJVIjHhQFwIULsqhv0F3H0U+5DAfQigmTBcxj+TWYMGw87GFC0PTh+V795e18nV7B6Ncelk9O4P0s0t+FegkDeIdaYZGeI3dhtMKZFlHZLBZA/nbv3WMo2HmCuUvKAj++JRphFhrJaej2QtLvAPpdllNXlyalv9jLsXvu2ChiZW12+nwBofERVtn0JP22CH25yIg1ijPdeV1sW6OK4lkD/8PaZWhBlYzDZvlQmJRk7xZ8NCK+L5euTVZOENbgwFgKJCsbQEYsZHCNdm2BNuQYXzCfP3qdjpqMPV4sxe3pmKSe4noKIWilClHK145gzw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 22:10:40.3095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7232c3-645d-4ec5-d8ba-08deb785cb75
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR16MB6204
X-Proofpoint-GUID: ZjMq4sR7Gk_GVO42wkc-Kmet4KcIy6x_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIyMiBTYWx0ZWRfX9Ic3Fn4bAwW7
 ObC8SqiksUY/8WPOtm5wR7euCbotDI97wn9KA2ts7mfwjRcL9byZeu8lx8EP4b2bmlV4b0clCe9
 K1FGTwODbVnroP66BFHMK1FTGlTNMcEgf6R/OVKjOj1PRuYR92N87yeB+TYoq1zmh8TaIWGLdyq
 EkAK+Erqk05PVFOQiKI0G1Luzdr8/7gsHNX1MIfqRewUcyDjs09byUkminn3RWxtDQjaT5k8GhO
 CyCKvCRCw8wxuNeIrlxPiOxcnSnDDBi51VAITq3R2BRBQBV12PskhshfmqBPwom0LaHKnX4bdXV
 qkae1MrDeaL8l5eX6aVnnVDpjPn3GrJEVJ03xTgnXH1DXlljZKFsM7WUny3YexQm+zLzonI2Gmt
 fU1iXc3PHOx/C2XhQ2INcP4F8aYjyFqw88KUPRAj++NbX7c9jtir9z/ozMwTC1k01SCUqe6f6BI
 T73IgFeMrR9+Wzt5QaA==
X-Proofpoint-ORIG-GUID: ZjMq4sR7Gk_GVO42wkc-Kmet4KcIy6x_
X-Authority-Analysis: v=2.4 cv=ZfMt8MVA c=1 sm=1 tr=0 ts=6a0f82e6 cx=c_pps
 a=as7enBq54CXVX8P5rkIU3g==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22
 a=DBfv99YmAAAA:8 a=xaZr94278_T5iL3VQHoA:9 a=CjuIK1q_8ugA:10
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210222
X-purgate-ID: tlsNG-c201ff/1779401449-DA374443-C32BD03F/0/0
X-purgate-type: clean
X-purgate-size: 7355
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 2091C5AC495
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

The patch looks good!

I would try to add a CI coverage for QEMU aarch64 tests, since QEMU
supports multiple RAM banks topology.

What do you think?

Also, few remarks below.

On Sun, May 17, 2026 at 11:57:56PM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> With LLC coloring enabled, the hardware domain memory comes from
> allocate_hwdom_memory(), not from the fixed direct-map banks used when
> coloring is off.
> 
> Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> DMA") made that allocator sort free host regions by ascending address so
> Dom0 gets DMA-capable low memory first. The first bank filter still only
> required 128MB. That can select a low region which is large enough for
> the heuristic, but not large enough for place_modules() to put the Dom0
> kernel, generated DTB and initrd contiguously in bank 0.
> 
> Ask arch code for any additional first-bank size requirement. On Arm,
> compute it from the actual Dom0 kernel placement, rounded initrd size and
> generated DTB size hint. For 64-bit Image kernels, include the text offset
> from the candidate bank start, because the returned requirement is compared
> with a bank size measured from that start. The hint covers both the normal
> Device Tree path and the minimal DTB created for ACPI boot.
> 
> Check the first-bank threshold against the size which will actually be
> assigned to Dom0, after capping the host region by the remaining unassigned
> Dom0 memory. Otherwise a large host region could pass the test but still
> produce a first guest bank too small for place_modules().
> 
> Use the typed min()/max() helpers for this normal allocation arithmetic;
> MIN()/MAX() are intended for preprocessor-style contexts and skip the type
> checking provided by the lowercase helpers.
> 
> This keeps the DMA-oriented allocation policy from de99f3263555 while
> preventing a too-small bank 0 from reaching place_modules().
> 
> Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for DMA")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Test/setup notes:
> 
> The failure was reproduced on a Renesas H3ULCB/R-Car H3 (r8a7795)
> arm64 board booted through U-Boot/TFTP and using huge initrd.
> 
> Relevant Xen command line excerpt:
>   dom0_mem=2048M llc-coloring=on
> 
> Boot module layout from Xen:
>   MODULE[2]: 0x0000000084000040-0x000000008e75d92f Ramdisk
>   MODULE[3]: 0x00000000a0000000-0x00000000a3ffffff Kernel
>   MODULE[4]: 0x00000000a4000000-0x00000000a400ffff XSM Policy
> 
> The initrd is about 168MB. With LLC coloring enabled and the low-address
> allocation policy from de99f3263555, Dom0 can receive a 192MB first bank:
>   d0 BANK[0] 0x00000048000000-0x00000054000000 (192MB)
> 
> That bank satisfies the old 128MB minimum but is too small for the
> rounded Dom0 kernel, generated DTB and initrd placement. The observed
> failure before this patch was:
>   Panic on CPU 0:
>   Not enough memory in the first bank for the kernel+dtb+initrd
> 
> With this patch, the same boot skips the too-small low region for bank 0
> and reaches Dom0:
>   d0 BANK[0] 0x00000057000000-0x00000084000000 (720MB)
>   d0 BANK[1] 0x0000008e800000-0x000000c0000000 (792MB)
>   d0 BANK[2] 0x00000500000000-0x00000521800000 (536MB)
>   d0: extended region 0: 0x48000000->0x54000000
>   Loading zImage from 0x00000000a0000000 to 0x57000000-0x5b000000
>   Loading d0 initrd from 0x0000000084000040 to 0x5f200000-0x6995d8f0
>   Loading d0 DTB to 0x5f000000-0x5f011c80
>   Linux version 5.10.194-yocto-standard
> ---
>  xen/arch/arm/acpi/domain_build.c        |  2 --
>  xen/arch/arm/domain_build.c             |  8 ++++++
>  xen/arch/arm/include/asm/domain_build.h |  4 +++
>  xen/arch/arm/include/asm/kernel.h       |  8 ++++++
>  xen/arch/arm/kernel.c                   | 35 +++++++++++++++++++++++++
>  xen/common/device-tree/domain-build.c   | 27 ++++++++++++++-----
>  xen/include/xen/fdt-kernel.h            |  8 ++++++
>  7 files changed, 83 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 249d899c33..db16f7fa94 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -26,8 +26,6 @@
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>  
> -#define ACPI_DOM0_FDT_MIN_SIZE 4096
> -
>  static int __init acpi_iomem_deny_access(struct domain *d)
>  {
>      acpi_status status;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1efddc60ef..226e053c68 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
>                                (NR_SHMEM_BANKS * (160 + 16)) : 0))
>  
> +paddr_t __init dom0_get_fdt_size_hint(void)
> +{
> +    if ( !acpi_disabled )
> +        return ACPI_DOM0_FDT_MIN_SIZE;
> +
> +    return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;

I would invert the condition so it is read more straightforward:

    if ( acpi_disabled )
        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;

    return ACPI_DOM0_FDT_MIN_SIZE;

[..]
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index b72585b7fe..3644663e2f 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -128,6 +128,41 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>      return load_addr;
>  }
>  
> +static paddr_t __init kernel_placement_size(paddr_t load_addr, paddr_t len)
> +{
> +    return ROUNDUP(load_addr + len, MB(2)) - load_addr;
> +}
> +
> +paddr_t __init arch_get_min_first_bank_size(struct kernel_info *info,
> +                                            paddr_t bank_start)
> +{
> +    const struct boot_module *mod = info->bd.initrd;
> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
> +    const paddr_t dtb_len = ROUNDUP(dom0_get_fdt_size_hint(), MB(2));
> +    paddr_t kernsize;
> +
> +#ifdef CONFIG_HAS_DOMAIN_TYPE

Perhaps use `IS_ENABLED(CONFIG_HAS_DOMAIN_TYPE)` to reduce ifdefery?
My impression that IS_ENABLED() is preferred.

> +    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
> +    {
> +        paddr_t load_addr = bank_start + info->image.text_offset;
> +
> +        /*
> +         * The caller compares this value with a size measured from
> +         * bank_start, so include the text offset before the kernel.
> +         */
> +        kernsize = ROUNDUP(load_addr + info->image.len, MB(2)) - bank_start;
> +        return kernsize + initrd_len + dtb_len;
> +    }
> +#endif
> +
> +    if ( info->image.start == 0 )

Here too: invert the condition?

       if ( info->image.start )
           kernsize = kernel_placement_size(info->image.start, info->image.len);
       else
           ...

> +        kernsize = ROUNDUP(info->image.len, MB(2));
> +    else
> +        kernsize = kernel_placement_size(info->image.start, info->image.len);
> +
> +    return kernsize + initrd_len + dtb_len;
> +}

--
Denis

