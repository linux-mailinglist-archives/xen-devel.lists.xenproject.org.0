Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN66K/ojDWrctgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:01:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250A587052
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313504.1583613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXAS-0002kL-Nj; Wed, 20 May 2026 03:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313504.1583613; Wed, 20 May 2026 03:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXAS-0002il-K2; Wed, 20 May 2026 03:00:20 +0000
Received: by outflank-mailman (input) for mailman id 1313504;
 Wed, 20 May 2026 03:00:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPXAR-0002ib-51
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 03:00:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPXAQ-002H1d-3B
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 05:00:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d22d2-2eae-0a2a0a5409dd-0a2a450baed8-48
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:00:17 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d23c0-212f-0a2a450b0019-94a38ff108b2-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:00:17 +0200
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JLGhEB352742
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:00:16 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e8ymtsrhn-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:00:15 +0000 (GMT)
Received: from BY3PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:39b::16)
 by SA1PR16MB6314.namprd16.prod.outlook.com (2603:10b6:806:3cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:00:10 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b) by BY3PR05CA0041.outlook.office365.com
 (2603:10b6:a03:39b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Wed, 20
 May 2026 03:00:10 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 03:00:09 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JN4S332213539
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:00:09 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e77nrbgrp-11
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:00:09 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id PXAFw9GwnvRqcPXAGwPoBq; Wed, 20 May 2026 03:00:09 +0000
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
	:references:subject:to; s=ppford; bh=fRi9H6nH899Pi7a2qa3EUyS/cVH
	iPDhQqk/JIJtR7lI=; b=OIokd/IqXRvW/WTPOZ86i8+ZF0KQjPmP/Zs0ntMVGSn
	AG6JCF/mEegMFogogAQO4eIqco+xmKi6CkgvXl59ZP347MhshofLZNaLbsY3y0VZ
	aLYSQj4F/HfqyQTvr8Pz/biCWGD/GGtwoJ0cSFxWBrNJAjf0S/XTNqAdhuEq0Xzd
	/MkdJqeoICyhL4ItlFNPXcfeL3nRutvPTGGTW/B7BSG980VAUh/bezi+2rOze4IY
	pQGY2iLevxuSfInQdKeTFCs/58GL9AK6h0ng/t4e/KBqAQ+rQmyve2j0k/sfns3+
	icHPKiDaakbJk6c/86kJMhYGjA1Yg9WIGsmxt4vfILw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOgUCwBUoNdMR8xwd9ugyBYuvIfnRbT+6u+JNdt3Up9TyYwtRD3jxQdYDB9pNVYwG4jmpHY4u2HB8u1gUEk7LkSxe+iM8w3pru7SOn77jdPeh0EGc0HArtcSImr31KXwz78tDSPwCNePZg9cfW87v8yN+EZpcfLv+yCB7wOAb2/WW8wrk26FQqm5XGmzhPZCwEnKL42jyTn7pGd3ClfVwqmiFxsu46wiT4T9d6J/Crl7T5e33LN+rsZZTw2XWofdAPX7oQfRfrZx3UkTnHEbalfua7Lz6P+BnA+nwA2Sj+tRQEBqGr1B1JVMFfJ0Y2JuL1cKz/WVhH7jtK5mYwk+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRi9H6nH899Pi7a2qa3EUyS/cVHiPDhQqk/JIJtR7lI=;
 b=eihzzELllLZvc5mWf24pFv9YWYEFviVWlvPo+UZVpQF6MSqul0Le6x8hZ/f2WJbQ4fkg1VYtbyMMMJB9QnY1DLJU0sOJHWPSjt3W2Il2gJvSXp4lGU220TGiLNzQWXO7FDUnlTp5SbvdGif/bWphwJDJEzQo2MH7kHCXusaBYvxKc/w0iP/YbILLq7ruTARBDXwlGq1NlsUVtVr9Eo+bF8ZjtJ3/wmrDMhwx07JGBCj72dahWM/fVlnqsATo7pws5dDs74yFFGRgbdo86rP9O/OZGC+MWCRFli/z2FUH7Rp/VrIXh7l2pjNccIcEKP5NxmXZgXzYTu/39Tg+7LQFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRi9H6nH899Pi7a2qa3EUyS/cVHiPDhQqk/JIJtR7lI=;
 b=KQi+AjhbdUlpOiTs/Eza4tfWjkSOavZbSaZiYb7Wy/bG9+NVYDemutfdTFLs5nWuZUHgFudjQCPkQRtb6BSWOOOC+ZVmqjv4rEdEhM4ipKhXVSCQRGahp8PHAIqzNGX9JwkEOrg8N4nbR4bhXwEQP7sQoBBIH/vFzllirEU6vGA=
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
	 bh=fRi9H6nH899Pi7a2qa3EUyS/cVHiPDhQqk/JIJtR7lI=; b=ctYJKF5nldB5
	qg6uU8wFrTAYWjBERLNq4Ev95jiq2GPo6hsMkwnQNhyCEZi02jhHpHZL+3GVElnm
	D7WNsuUOhUUrYsamVAd7XOv/AXG6H//PIP69+03iIr12jjUpZ6XB8MF2OaI3h+Sz
	U8mvO8Wxri5miOp8y79CgzR40WRHIbn91kdVJtW33mECqkAMBaPL98t7Mx41RRM/
	f0P7Fqy8TIZgDPZ2Q4+nIRgDN8UuOydOis8+yUclnxPOmo2I4kdPuBw/gs2uWabo
	dLjkBGNMYYYQiE+ir629wNXdFmuKyRrnIQqCYIrDU4nN/2XGgTpW6l40YoZnBYrA
	URs1/mCM+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=fRi9H6nH899Pi7a2qa3E
	UyS/cVHiPDhQqk/JIJtR7lI=; b=qX5jSU/rDFG2BtIMYFcQ6s8qipi8adZibjxs
	h3OvO39fW5oqBBzsy4VyLuaFZ9r0/VHBooXbbjO1lIs9WldNMq2vAoexbeGCePkT
	mvc4xyQaNnjNcihgcTTdd6ZnClgnMnYozt043W4EGYn6e444mVqZtykOeCqUAyO7
	XCrozSjbkj/SJmCopERwPOw2fc8I/3bh8ajwhfGnKh05B4Ektiodx8CNPY8nGhTc
	tKq3BImeEPo95dQKvi17KxBdlcFKdCWK9+Xvlyk0kLqo68DpxfNUIAy5FhnG3bTK
	AQot44D0Tn165OcCJM2X2Xdh8DqoY+wNWWYRiLE6SHLckdVd0Q==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PXAFw9GwnvRqcPXAGwPoBq
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 19 May 2026 20:00:07 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/5] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
Message-ID: <ag0jtx6yNpPI3ZTD@kraken>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200027
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|SA1PR16MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 785442e8-fcfa-41b4-df86-08deb61be79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|22082099003|18002099003|13003099007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	xL01NsokkIfjAu4YJFoqqEsypOH28UAQkFIXtd6WTdaO/S1tQ1ZRYJt8mxwCXfFYJONta5C7eK+7Xlnw4gERBaVO0ig4q0fnxc8hccIKZvSzb6PuaRM0779SEDKW45tcTBA4kVWly68tMrRcuGFS2MoeiDIbOQSToZ6m3ZvbTP5CRX13yb89YwyRglRUCUN2Kh57oG/KQQHU+tGDL8OOWEvjc82FhX3e4rK4sFosuVdF39MPe4LA859HvYvKcMymiCer8Zi+Ln8cy10d3gKH8j1uTdMl7gVZxgZzY1GSQnGFpytcl2igZVjJe5iQTO4gqYhspYaCoch2fM7dNizNQyjR/HIMwnGE422YTOp1vZF5obg5zHcEShltCd7K82miZbcQs/MQh3+5lURXiSas8rQLKAd4h17dJvWokT9ircCbXsrklaQA51Qbg35BArZMG9kiJpWSt6MKXyrW/7X9V8d9E+XBgvJIWu6eGX4m56iiEbNd3fsT3vt1wbkBCxZVRtCRp6XpQEkILET9dStScExXsjmzAXDKKm5yXGTe7a395GPKu82bM8dVpPXViQxxE992i29OHFu3592FNZenF/0e7A500FYkJhv89QDx+YRuMyKz2B6pxX3v0qY6RKDkZdJZSkEi9NwN/Sq6qUr3hyNvMXqHIn7MwMY5v3GM3o+vdkO5yyyqammd01MsJSw1
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003)(13003099007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XM8s6QF5M8TrkFgxLM1MKf/jw53ouUmwYBPcZeLY9Gh8VFjOY5xbgxuqFR0AYUqcY4HGFExB+jXFZ2p9RqfdBvzGBIbojCznYFLKG15W+T0qRlcvo4XlebGm1eHxt3zQ5nkTA12Trpamb9KUqYirinS/EEU64ELrKvOpLQy4udZWzaSBRjKr5e+a5tfl7PyQnzsOnUetyFKlzGgZ9cak3pAjXzaUb3kWXgxkVZ77GqxRh1VRBTlVjmxgQVhTAW5UFU9EEN/GYkEXao0TqvvTYTIYJkMn+vuJ/F4uTlwElJ6DuxvvkrmEgibtsDoAatXUYT6JbyYsuOktmV7HkNQ4d1C9Fbq5/SWt2Vix3i2SM2ohlCrVozKrALFzRX7xT4OSsqtAi/X2MxR18Een9rjFW3fHcf6qSaHa4+yip0XR2geu3irKjQYkuaXW5fCWtG1I
X-Exchange-RoutingPolicyChecked:
	gOIfWRlj+sIiCa/zUQvSAKk1G4dK5XS+04k6wvUdv70AalU1OQLkvdCnc9egrfAR+KtUJqCFkk0n2PJVwf/ICKi4esquLaUNsFHTsMyurw8cMBag4rlvXvd+VSuRG1xmSw0lC1DKTbMhIleYweifb6EhWSwkbn4Ua1H8fCdcQV+ZLPJU3h1UtflI/ikieJVEQ3GwPAGj9jkBi+EtpkHgzKwxheK/vzd7mGaSV1gshbXv426O451+kE7TDfkyKBpQZMZBour4F7UHWSNCDzmXhIQm0+JvBxDqq9vPPkgHPf03G7nbwp1kOciHMFpFTI/M4UB9ikoE435jSzzpoWRFPg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hRDQXhrPy+st1LasVBd76d0naq7SOK8PPeuvA+2QDZ7CwUreFhROE3fsursPc+8bFWHTSZ3dlCupdIRC8GMiIRmPt1ZDPwQSZ6k6HT8upV658e3m9RQgXe59GpiTKkDP68Ol9ikpFdmxEhJs/KxNGKj9nJmfWySR03ULThCnSIBCvdUeRhPX93WFJVY3iCjMQFqEBdG7yrj+2+YToGEqydEPOHyf0Bv57EdT+MJ0oJcguA/GjgG3dzio0N+W4KSQch+9CzZDOof/CqB3Q+Rv6ySABTOPwMdb3D7NDInS8dKibZvzLy85piEBMXWg5KonHufzeIsjDbEGtNO/0Y4URCEzhpvoeUYvk1beQUy2xosnqyBFGSh9f8t/UOJGz4LDXxjdi9LlZnVsARC3+Ory8ToEqHmFDSl6/gtR6Onl+BoWxJsHt6kkrS/ZdlAFAQ8wNe419pS3kCiEwx8c7LUk8EguG8aQpL1Ccxne972GLo7NKmnZQWhy+nH1YnEDhM9uNhWdOwJMekKhdxL6EJkIlvGzmQVAlO1ThG0EbHfIrkMurCIPU1U2hWV1mdgjh1CBB69lJd7hdyVzToPeoCtH8AOwKm+5wbS45E1bYf36JQIyU2YUrgiI02eYlsHLIoUtPOh/DHRqZN+8hOGDz+fUtA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:00:09.8803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 785442e8-fcfa-41b4-df86-08deb61be79b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6314
X-Proofpoint-GUID: 3voTNoDNdW_-mXm5MTe9XCv6Fg56d15z
X-Proofpoint-ORIG-GUID: 3voTNoDNdW_-mXm5MTe9XCv6Fg56d15z
X-Authority-Analysis: v=2.4 cv=Wuob99fv c=1 sm=1 tr=0 ts=6a0d23bf cx=c_pps
 a=tGmZTgOEbyl7bSJKA46FEg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22
 a=-RI0ju8yAAAA:8 a=hxWUZ_UOAAAA:8 a=m3qrNmg_BWMN2aNSOiUA:9 a=CjuIK1q_8ugA:10
 a=P0bj-C3X3jJDpopQwM1U:22 a=UsJdYLK5l2RqpxBViBoK:22 a=oJOWNcIRgaUypOnx_dbc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyNiBTYWx0ZWRfXzIFdnDgw9lP/
 44q84x1wZn8jC2IV3stRKV8fLrYartKRP3rxiUVjJbfFqC4ZDfFLBTHLYaS6J3NOhz4SkSJUvZl
 vMg3/4BdQtQPXtGFYWiITZz94MxaPdyq8nRfWqCXj4rfzO+L3/xF1orq160LuBY8kJlvtY4fM0h
 ruh6mqN/7AHgqyy/hl6jt2vt5Utpv+/eywZ9MXxc9QvT2XpkyvS6ekhTROJAF+os5xtz/bhSfCV
 3wZeJyQJaOJCs6AybEYJGvPgwBhbjPFimKXKqeY0asm3s4/YMtuZtHQV/duXL3p5fH/sWzqmf36
 l3i7SYVcIOFxh5XL7rr67qmBWAgaiUOPYhqGAI/uiCWrMeXgOtzLjXvphxFqHF0GeOZ5tNwlJWE
 590TFXuCtKoFZc/gv/EodV0x7PcKbEp8WNdg/uepDQWU7L+SxUcfT0p+vDWH7o3A1juTvUz0aAg
 dTZw5TNoGzulRX92YMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200026
X-purgate-ID: tlsNG-42698a/1779246017-1BB78F3B-55C19546/0/0
X-purgate-type: clean
X-purgate-size: 6379
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,saarlouis.ford.com:dkim,azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 0250A587052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:21:26PM +0200, Teddy Astie wrote:
> Use a dedicated pci_sbdf_t struct that we update instead of recreating
> one each time we need it.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/passthrough/vtd/dmar.c | 42 ++++++++++++------------------
>  1 file changed, 16 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 2a756831a6..c36f4bbd7b 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -310,7 +310,7 @@ static int __init acpi_parse_dev_scope(
>  {
>      struct acpi_ioapic_unit *acpi_ioapic_unit;
>      const struct acpi_dmar_device_scope *acpi_scope;
> -    u16 bus, sub_bus, sec_bus;
> +    u16 sub_bus, sec_bus;
>      const struct acpi_dmar_pci_path *path;
>      struct acpi_drhd_unit *drhd = type == DMAR_TYPE ?
>          container_of(scope, struct acpi_drhd_unit, scope) : NULL;
> @@ -332,29 +332,26 @@ static int __init acpi_parse_dev_scope(
>  
>      while ( start < end )
>      {
> +        pci_sbdf_t dev_sbdf;
>          acpi_scope = start;
>          path = (const void *)(acpi_scope + 1);
>          depth = (acpi_scope->length - sizeof(*acpi_scope)) / sizeof(*path);
> -        bus = acpi_scope->bus;
> +        dev_sbdf = PCI_SBDF(seg, acpi_scope->bus, path->dev, path->fn);

`dev_sbdf` calculation depends on `path` which is updated in `while()` loop
below.

>  
>          while ( --depth > 0 )
>          {
> -            bus = pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> -                                 PCI_SECONDARY_BUS);
> +            dev_sbdf.bus = pci_conf_read8(dev_sbdf, PCI_SECONDARY_BUS);
>              path++;
>          }
>  
>          switch ( acpi_scope->entry_type )
>          {
>          case ACPI_DMAR_SCOPE_TYPE_BRIDGE:
> -            sec_bus = pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> -                                     PCI_SECONDARY_BUS);
> -            sub_bus = pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> -                                     PCI_SUBORDINATE_BUS);
> +            sec_bus = pci_conf_read8(dev_sbdf, PCI_SECONDARY_BUS);
> +            sub_bus = pci_conf_read8(dev_sbdf, PCI_SUBORDINATE_BUS);
>              if ( iommu_verbose )
>                  printk(VTDPREFIX " bridge: %pp start=%x sec=%x sub=%x\n",
> -                       &PCI_SBDF(seg, bus, path->dev, path->fn),
> -                       acpi_scope->bus, sec_bus, sub_bus);
> +                       &dev_sbdf, acpi_scope->bus, sec_bus, sub_bus);
>  
>              dmar_scope_add_buses(scope, sec_bus, sub_bus);
>              gfx_only = false;
> @@ -362,8 +359,7 @@ static int __init acpi_parse_dev_scope(
>  
>          case ACPI_DMAR_SCOPE_TYPE_HPET:
>              if ( iommu_verbose )
> -                printk(VTDPREFIX " MSI HPET: %pp\n",
> -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> +                printk(VTDPREFIX " MSI HPET: %pp\n", &dev_sbdf);
>  
>              if ( drhd )
>              {
> @@ -374,9 +370,7 @@ static int __init acpi_parse_dev_scope(
>                  if ( !acpi_hpet_unit )
>                      goto out;
>                  acpi_hpet_unit->id = acpi_scope->enumeration_id;
> -                acpi_hpet_unit->bus = bus;
> -                acpi_hpet_unit->dev = path->dev;
> -                acpi_hpet_unit->func = path->fn;
> +                acpi_hpet_unit->bdf = dev_sbdf.bdf;
>                  list_add(&acpi_hpet_unit->list, &drhd->hpet_list);
>  
>                  gfx_only = false;
> @@ -386,16 +380,15 @@ static int __init acpi_parse_dev_scope(
>  
>          case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
>              if ( iommu_verbose )
> -                printk(VTDPREFIX " endpoint: %pp\n",
> -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> +                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
>  
> -            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn) )
> +            if ( drhd && pci_device_detect(seg, dev_sbdf.bus, dev_sbdf.dev, dev_sbdf.fn) )

Looks like `pci_device_detect()` also needs some refactoring...
(Probably out of scope for this series, though)

>              {
> -                if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> +                if ( pci_conf_read8(dev_sbdf,
>                                      PCI_CLASS_DEVICE + 1) != 0x03
>                                      /* PCI_BASE_CLASS_DISPLAY */ )
>                      gfx_only = false;
> -                else if ( !seg && !bus && path->dev == 2 && !path->fn )
> +                else if ( !seg && !dev_sbdf.bus && path->dev == 2 && !path->fn )
>                      igd_drhd_address = drhd->address;
>              }
>  
> @@ -403,8 +396,7 @@ static int __init acpi_parse_dev_scope(
>  
>          case ACPI_DMAR_SCOPE_TYPE_IOAPIC:
>              if ( iommu_verbose )
> -                printk(VTDPREFIX " IOAPIC: %pp\n",
> -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> +                printk(VTDPREFIX " IOAPIC: %pp\n", &dev_sbdf);
>  
>              if ( drhd )
>              {
> @@ -413,9 +405,7 @@ static int __init acpi_parse_dev_scope(
>                  if ( !acpi_ioapic_unit )
>                      goto out;
>                  acpi_ioapic_unit->apic_id = acpi_scope->enumeration_id;
> -                acpi_ioapic_unit->ioapic.bdf.bus = bus;
> -                acpi_ioapic_unit->ioapic.bdf.dev = path->dev;
> -                acpi_ioapic_unit->ioapic.bdf.func = path->fn;
> +                acpi_ioapic_unit->ioapic.info = dev_sbdf.bdf;
>                  list_add(&acpi_ioapic_unit->list, &drhd->ioapic_list);
>  
>                  gfx_only = false;
> @@ -431,7 +421,7 @@ static int __init acpi_parse_dev_scope(
>              gfx_only = false;
>              continue;
>          }
> -        scope->devices[didx++] = PCI_BDF(bus, path->dev, path->fn);
> +        scope->devices[didx++] = dev_sbdf.bdf;
>          start += acpi_scope->length;
>      }
>  
> -- 
> 2.52.0
> 
> 
> 
> --
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech

