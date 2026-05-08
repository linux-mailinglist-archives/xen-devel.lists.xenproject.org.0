Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFYJBdtZ/mkWpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:47:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B974FC081
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304319.1577401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLT2A-00032V-61; Fri, 08 May 2026 21:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304319.1577401; Fri, 08 May 2026 21:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLT2A-000313-2v; Fri, 08 May 2026 21:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1304319;
 Fri, 08 May 2026 21:46:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLT28-00030q-Dr
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:46:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLT27-006YP8-Qr
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:46:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe5951-5cb7-0a2a0a5109dd-0a2a4507b6c6-42
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:46:55 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe59cd-229c-0a2a45070019-94a392178832-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:46:55 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 648JTLPo1653719
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 14:46:53 -0700
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
 by m0482516.ppops.net (PPS) with ESMTPS id 4e1kp9adj0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:46:52 -0700 (PDT)
Received: from BLAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:208:335::17)
 by SA2PR16MB4026.namprd16.prod.outlook.com (2603:10b6:806:148::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 21:46:48 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::4d) by BLAPR05CA0036.outlook.office365.com
 (2603:10b6:208:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.7 via Frontend Transport; Fri, 8
 May 2026 21:46:48 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 21:46:48 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648K5cmE599475
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 17:46:47 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e192us5en-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 17:46:47 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id LT1xwVfWWEDsLLT1ywYTze; Fri, 08 May 2026 21:46:47 +0000
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
	:references:subject:to; s=ppford; bh=njKxrDWggm0LIULwXaj5zpeN+aG
	OrSKm0rRA71M/V6g=; b=XmF51oPX21bQx1qabXlTfqI+r3S1CAPNIVfle9xs8EU
	hYWCrQ5+bqx4K4hNw1IZ5mSnARYcDBMDR0tXRpF7i1vO64VfEUCzrPUuAfBetlvP
	JvXp+iNFcIcqcxctolJSzBF2MCqKlzGSrRF+7U6ZJYbSWVRCGYH6cck6R67/GTwe
	dvUV62K0swVQ37NixbRlNGSRznQe0JqgyiNo/m30tqS+AeB/tF2GIPKoEFvPK6UA
	Uyzo0zwB4vTP4T6zkz2o9rrtnSTc48YTFXEI1TXDNCo8nL6vvfuKm6fExpnHwVld
	cJD0/Oh+yfhxZOFefa3v6YAmd08dx2blY97MGGrrU9w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaEMrTJXgDUUAtsyqyrfW+v1VZfv58ohQTxDxS1VNKGVFytllDTkAbYxqyPKH+okFVhvuC7RRc56JlA02r14KewIdvYxY98NWQBKTAqiO8dg7FJk0YxZsnK4eBfKrMHE/4HE01+QiJQn58bORZHkBH8NQ7n0bhf0Ior5udgmq8W5+O633+KvAcFa/oUgEoDgfHyvokRZJ1PXXkwV03NJ93DCISJ+BAasVenGQ5slwukv0llD9qUG+OptRzPrkWunedZVu5cGx0ItVLklDuMqZ3xdzcfVYP13p1TGNYqASch8w37xIgwtJO8cPQQ1+qXu8SIy5J2yBtFEypZBXfsWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njKxrDWggm0LIULwXaj5zpeN+aGOrSKm0rRA71M/V6g=;
 b=enmBK6sjhhNUXWcoLOOtttRONEjYToMqmSD5kL1bktzJO0J1AUIw0nEFXZJuR7XZ+uGtJ7F80w/+/WvSI9RBUR7Agx/+1j6eneUvQPHmOTbglIQq/iabNnMrIbKKI2oI0r630px3jiY216yUSbWLBKtqRMKqeZcxxy1v0f5MzZ0wRmHA89I/5rya3rT+FMWU0OjxEVGSu5QWipzv0yJf+8SlWb2Ab9z8wQXbVmboKeot38dHzweSiiuS6zrhTzJB9UfjdYOVZOp/6vTmgtu9yfA2AQyR/URGmpk2Jiye7ossD7CdF0KkYjsuZTfRMdgtIkJU3Zb9KselO/MSCYc8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njKxrDWggm0LIULwXaj5zpeN+aGOrSKm0rRA71M/V6g=;
 b=C0pN3Sx6WPbwgCUuUR2UFijlDkygJub/5eXRasF5sXIe3r8651/NxShAnaigIR/4ycTYg83wl6iHZgFrajNASgpYR8K1v+SfWjDUqEE2ifrK1S934CsB6KcFcpjKAIWVFJ5RWxBIZaMGwwqCAZ4aOY6s+ZsE7LbZwIe2Myqlo88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=njKxrDWggm0LIULwXaj5zpeN+aGOrSKm0rRA71M/V6g=; b=EhdFAzifoOMM
	Uhyhu6V5csRzNa1Bqvm4FCbVi2xWM39kO5+CyYjgzA1UIcaoiluenj+KpBwEH4Fl
	AuMtagSmQIXpJ6eVr7qom43zhvvALrX0rOzg0Boif9y9aL32yt1ehWbCL4XanJQ/
	OCZDwJiUjDX8cml7Ks0MtksF4n9HqXAbelSIvzz85JSp31eeKXsBiUQ8G1mhMxtH
	AP8KBptUJotszjIuZGhUdMu/n0jR+WwPDMUO+WKFlf+koE/i+f2v1Czl9u0CpdRC
	fy8vNNiFT/ctA3xyCXO+ApeVvaF3KLkYYqoe2VX+7TP+Dq/VPA21+MClw40/cFR1
	CgA6bKAo7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=njKxrDWggm0LIULwXaj5
	zpeN+aGOrSKm0rRA71M/V6g=; b=O7EpqIWx4IdZ3wsc3GfLxSZitmF7dbHr4q0+
	ua78Tms4c6woTon/HbHTDlulD9qeLHQhxc727/uaheXvjzuV6JXhPXiX5BYRYPjp
	HNrsInTnlxRswwUsQqt63gT6ezlThIzbdKXH2wHUwwx1r2a6sapdBspOgPV9yACU
	BeLjiICFUR/7NmLgNH2q3micB8O+n3JDwMk63p9oPkYW3KRwjOMT9Nl3owEEasOn
	GscJr0pbgXqdSIgzrOpvPz6hxFDHqA4ZONr9Qtyn69wfd1Ykrw+GViQ3/hvUBZLa
	UgC4wjdEL2x4afHDbOHjMLSsHfw7gtDEr7ONnyE/OeyFHQzKzg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LT1xwVfWWEDsLLT1ywYTze
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 8 May 2026 14:46:45 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 6/6] xen/console: add conring buffer size alignment
 setting
Message-ID: <af5ZxWVEiUPFT5xW@kraken>
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-7-dmukhin@ford.com>
 <75df20e0-70f0-454c-9797-e62725f53b63@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75df20e0-70f0-454c-9797-e62725f53b63@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080215
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SA2PR16MB4026:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff1f3c3-c4bc-4ef4-7a94-08dead4b4e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zNO4Ex/Ekzx34UXk/x2THHwClCX2SP+fn7dbJigSUe74YfBmeLfGOI70mhFu9DloMh+3Yll9IGsbCta4W8Zon+4+sKIkFEu7FJU3XQTGsBjxHNo8fnWdVdKp/aAgd7qCiF+441f+kCZICqyWVeWPgYQfUI0/GxJcOCN7Ah98mmTe8P4YrGZDu7uG9vZaSLM0WMSn6VSi6qPCS5D4+DLFncBiM2hYuxRTK14sSPxu5sGXVUcw0l0Cp+U8JjZM7dRnhiheipuS172Lq5u/gN/ArFoRdKlXwA3KctiR+moptJ8MmmroO8apIWNUe//Fiex7imGWai+SYfVvPRV55XIH+BBid80wHx6OJLZPYP2eW4x2YnLFnL97tWsRWZpATU/4pSeo/jis5gmVMA3rS5/5YkUe8tF/C/EBJDFoBAkBLucfSbkwxo8MQHrRscBfaXPZRdroMIfnfvPan/RtxMRkSjNQN/nPZJ6Vwm5cCtbaYg1HVXCFapS3416s900QZRQBmJWi2cmt6fvjHvkTDlezni436ZYDZbQyWMyP18ELbYNdLjsSnrfo14WEWBe+A6ebvN5dyq1t2hPuOF1A6xFrv2zDbtUrI3QS+/a5dL/SoojjJq01ItQunQvh1ADbR+f11wjnWfINa2xMLN9OmsMAAdv/iI8OvHhhxhPr/yNRMQFRyBVieMLQMcSOo/GvM6Lm1hvIYab0gHzH2lg9GVqWZCm0znYXBz/FGp4RowB9UtY=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eVFvumgfTkBQZ8BIAD8wBR9TEuYaANcchPUQwaKRwn96pmMiXVS31BzaZ7/Rfkl+G57g7XgfKAvIbi6ETyXZXR9yy/QV2askJnz+XWn4UruP1R9TA1qODK7FYBHdgwJgkuxxO+3aV/jG5ILCTTb5N4ymlNT8zn5/Fq1k1bHQenhKD4yCiJVIAcY9MV4bM6QtV8jrzUwpDvGWXEs3iAwp8rAxJklIiSfI7StR7dUvfGd1m/t1uepv64pQVvaDcxRblJFj5Qw+2SP3eHnOyJPziTg3hO74JYmRt0doVXmO1gazbb/Lyq7z5SwnZ1c5ig1eCCOUw/Wslwxz/kshu6Up5ezuWNLH0l5rGDc7yvwbrbtdnbD7SFdgMUhqmUmEKm80OBou2WKhX84QxpzAEJFzN6K33T4cHTWJx7ct+GnLZwEr7e0LpeKDCGoB87RMolvH
X-Exchange-RoutingPolicyChecked:
	X4o8ykj7X7ePOnWPN6yCqgtbdrr2h7qUMUuUvG+wh2q3W+HdjAMqTiLUHeUCiyLKxJtLLc5W9uZlh2/JWdjvRMTJfXWTT0aQrhBRSsfdHz8/wXQFSUvfIK8LRNZWSmJXOEo9oOiGLQWj8cPUnZLmd09Pj6Lko1MMjWIxHS+E0ZrYURTFYepAqIE1Hmwse2ZVX7XssyTKSOtUIy4bqG8ydPZe5JiYtU9ByGtOK+cRBAiIVDiCzHX7tfZg8Nkg89KYSzIrwxSZ2QCZngX7BxfYBI0I5WhKTdjrfIMOSebsgQM1dhdz/2udaumcJy3nb08r4xL7tNR7pONXS3f0krx48g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+74RFtdD7g64Sjt+q5rpVeaK1Plkmx1HPjESjUEI1CBJcGEJhzUkoZETZV0qWoMt5yP7MXvpZFcPgcAh6c6SpS1QTHHiXsdk47K9M0tJfHpLXggz8Jdryg2KMjnmlG60YUgqmtea7Fra11vM6vZeSt/ZrvP6WHZ4OnP9Ep35jxGyIUW9dGn6z2a2l1dgzmAdYlODxxrCxCP6ThqY6HVUWawMEH2JLTy6XI0PYHLIcCpyMa37T+UHXzhN/2dxyGn0aAC+esrMdtCphsWBATx+DR3hrHqzAoMYs+9QEYX3KgBlIBQlT0cxt2Cpfq4dP4b17Om/Wo4vyGTok4BwUSJVQSVKpPAAPotuoz5f7ajSsDf6FyQYKBKUTIhuX2BvsA4vFW9TafyjUvPdAnkSMFZcCZ7KyghJC6fysfXOMSn6kESG8uxDvuEOoYu+8XNtnjfaLq8Keuy4aYYqnjGFlGu9i/DfAZPh4r6uEFjrEWPNDYQdNPQPjTC+SJedcuW3FrFtHFhi7nNU7PGKGdFFtp2KMwTbO7tSGIPPttE11EnqBV7i6UoK2rlQnFWj5V/SuSs/JX93pqCyUhszXkUBksq4COHsPweqIn95+Qp1C+3TM/rLcAY6Vk72+q6V9aiB9U8k
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 21:46:48.1987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff1f3c3-c4bc-4ef4-7a94-08dead4b4e6b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR16MB4026
X-Proofpoint-GUID: Vo61fQ4IEE8X0kQegS02l4aKugcF68hI
X-Proofpoint-ORIG-GUID: Vo61fQ4IEE8X0kQegS02l4aKugcF68hI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxNSBTYWx0ZWRfX1r1KKLZYhA3E
 39v7Mq8NK1C5WOAYLjY6kr0E/P/8wZEnlGwnorUyclwKEddwALyQSGh27WD+9fBVDlEX82767VL
 RbyU50H/gv9VVhOtXgd6TZbwiky4g2f5tXA7LpERGj3UmNRYDU9mQczbxZpdCZftEFjdLjoUQPe
 Eo9sRl0OxtHT6+lSukPpCaRwGkFNsaazZ7XaW0YoVyKn0c2J+JlWZH0DpDdnfcHi8mUjCZm4wco
 dQWkBGZY2uaC+/RBw9ciNstJeSKhTMEj9qoayj284TBXtrLGB1VYootX88KTtELHG+mxhlt8sKm
 jNdG+TQIXcc2SbRuRGRJudX2o/inHJq0lC9YKqRq7T834gJFNu9iYxkGlBaIg5UTbNCcLJbkF8o
 2RuGHTEkSTcGSEbMfom5nbIS2vEEp+hbaOE0bCmF2T7MkonojM/8+z2wD3gxF7Ek/Tbn6ubRpcQ
 V3d87xx8OvSjy3CHJ4A==
X-Authority-Analysis: v=2.4 cv=T768ifKQ c=1 sm=1 tr=0 ts=69fe59cc cx=c_pps
 a=6Zlfg0iwFc/B+5Yb0ubQ1w==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22
 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=tHz9FfFoAAAA:8 a=YcgBAMpYmrOwQzKETNQA:9
 a=CjuIK1q_8ugA:10 a=3whSkbs7g9Me0DR5EJEX:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080215
X-purgate-ID: tlsNG-ef75cf/1778276815-2887FC48-336338A0/0/0
X-purgate-type: clean
X-purgate-size: 985
X-Rspamd-Queue-Id: 55B974FC081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:10:42PM +0100, Jan Beulich wrote:
> On 05.02.2026 02:36, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Introduce CONFIG_CONRING_ALIGN_PAGE_SIZE to control rounding down of the
> > user-defined conring buffer size.
> 
> What's wrong with the rounding? The more that, with the original behavior
> properly restored in patch 5, it'll be a power-of-2 multiple of PAGE_SIZE
> anyway?
> 
> > Also, update the logline reporting the final conring buffer size to report
> > bytes instead of kilobytes, since the user-defined size may not necessarily
> > be kilobyte-alined.
> 
> Yet making the number harder to grok.
> 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Having talked to him, I don't think he meant what you're doing here. All he
> apparently meant is to stop using alloc_*heap_pages(), which needlessly
> supplies order-aligned memory.

Thanks, I will drop that patch.

--
Denis

