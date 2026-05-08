Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C1SObJZ/mkWpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:46:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5704FC071
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304310.1577392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLT1K-0002Wb-NQ; Fri, 08 May 2026 21:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304310.1577392; Fri, 08 May 2026 21:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLT1K-0002UX-KU; Fri, 08 May 2026 21:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1304310;
 Fri, 08 May 2026 21:46:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLT1H-0002UN-QU
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:46:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLT1H-006YP8-7L
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:46:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe5967-5cb7-0a2a0a5109dd-0a2a450197ce-38
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:46:02 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe5998-c1f2-0a2a45010019-94a38ff143b8-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:46:01 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648JU1UN2438151
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 21:46:00 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e1f4hdvf1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 21:45:59 +0000 (GMT)
Received: from MN2PR11CA0014.namprd11.prod.outlook.com (2603:10b6:208:23b::19)
 by BLAPR16MB3907.namprd16.prod.outlook.com (2603:10b6:208:27e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 21:45:56 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::fa) by MN2PR11CA0014.outlook.office365.com
 (2603:10b6:208:23b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 21:45:56 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Fri, 8 May 2026 21:45:56 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648K0YLM4096769
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 17:45:55 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4dyxwd42xp-12
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 17:45:55 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id LT16wnCifMM0lLT17wpoAc; Fri, 08 May 2026 21:45:54 +0000
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
	:references:subject:to; s=ppford; bh=AzW29ifmTy2q85zPQ5kqe9FGXxf
	BzpBT4chc1Y/NQOg=; b=Df7wjx7jk/GzqsJMZCS91maoHTlAKX2nQ6c2vnmX+OP
	+tPhkiEDqbm6pVnlP5SO0kD82ilDs9wRLFYKCTRzvtIrfZ+7h8PjtZH2Rx/R/N3h
	gXEt65Hxlnka1Lab6plCT4b06JboQn3sdohUtxK3yEbj8K+sdbdeuBKNj/eDEi5O
	REvyT9wZTs2UgrZR+WgdPV3wxSg5pe56lQtZlU57lBI9tR2Vpd3D2d1oH8HvMGaT
	v0q7cwXfIsOkmCoypjcwlpeMv3gSBJDe9mdH3r+N5WTaJOqDEHxrRYE6IgSxP3Q7
	a1e7bgfK+hU82OdW7/u1aiQeP4vr/5GhVupubDhVfXw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHiI5ee8jrBdRCjaLv7m8oc3NFYc+CDvdcD/+KKtHnQ9nQd0lHxxQRbXys+ftTSt0ip3sbyWN4wqPJaMr2K+FX12ckEoyxx0gkZ+unx21h+4XVoCdf1KjpW4aSamMf3EyR82bDP9zl5Aenn/TFtLSbcoTprFWTZ6wOedraaj3/rd2VmsWUpf/qOMgFsQNM+kJaSA07ilg5o68cbcu+pwsm6+a2r/mTkUlxLzNdxjFPYTFPNcXMKJzQe8nSUnJng8uUzfmTbj/XI6PxtnPMtX616yHkX2PV8AcY/NDpR6ZdiUtXGMFS64yaCP4m0fBg5auAZjyF5ieuF0CjfRE4/xjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzW29ifmTy2q85zPQ5kqe9FGXxfBzpBT4chc1Y/NQOg=;
 b=fJzAbt6i9uV3VsSgHxAiU9OTqjs6iDbVsfpqBRmHr/scIrLS25JUzdnv1gXrXmwioLm7Sh59kIypuO+IdpCorVMlOk9Rc2AKSU6XDbfcmFspprH0yHRLqFnZKfC4QCEcZQQAy7Eqw4Atl7jUadzJL+4BAUbmTTZvUw/2CctZjic/LrD2wea4FwZ2BZbbWCzh7BjFGKZ1QAWXOPagus6cW8VWCeOuKEMzsCvw3B4jSXXFiF2uQciDKXDiXvWnWGvCEMuMIam9xrRnC2/Fn6wydsrc0VQCKO70t/+Ll6tn/IXAuCqTM5Ew/GzpTw0J0tIrd3UO9cccyMONKCyK9vCrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzW29ifmTy2q85zPQ5kqe9FGXxfBzpBT4chc1Y/NQOg=;
 b=VLR0Mu0LfuBQlsuTRc32zRNIj1xufYg7FCvPaqM50c7imvxqR7fLlGM9Z2RjW1iMmHvYDfI8s+SpJtAbbArsbmD3yQPNDx8wUvZE5yn5p7WveoC21Ze6YRKADw0RILtadX7eX5QP57wIyEnw+qePN/P0932werEqw+rb0PsEMSE=
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
	 bh=AzW29ifmTy2q85zPQ5kqe9FGXxfBzpBT4chc1Y/NQOg=; b=l2o77qeHwu93
	kDjhUgdQ5ahXkqmRXuVCgDPDvt28/FozUdkygTXvMf4OyVkC9dKHx7zRFFYdSGvf
	chkAvUUrBW9Z3nuSpyt/Ssv/fF9tFIY9VlsmHMSrUDX657Y3U+p7iBQImND9/ziy
	pyzkKQaT5MjK/shUNGoIoEhewBvZOMrLgL7y4SBkjBBlwvzNe+GvA9blL2Qr5BeS
	lYcbrG6Ct9AccybJql6SU1e3UNXwk7w8+V0dmpKGmeqRthpycNULVPU1JNgVkhOU
	EP0ZurAzfpLa0bgVd7xxnsTr0PE8z767R1TRGIL2NLvhvGqe/A5gvc7xbFynof1Y
	aW3/13ePXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=AzW29ifmTy2q85zPQ5kq
	e9FGXxfBzpBT4chc1Y/NQOg=; b=gTkm0cexgQxYXtIvdx+HGZ4BEh2CHwkQa4pD
	TG8DBm8w2LtNkZ5WUrN2N6UYT9fbs9y6S0UE7MUUppfRdAaU7TJmZq2eI4K4y4q3
	/aQlXWbXSPhigrvH2HjRkYqYT0t9DvRECYQNbwlLLNwzUv7ubj10N+1cZCl32FQp
	J5V33UpiwgKDqWApy/WL8e65nuM+dL0TgniMtDa+GD821xkXfK3MotzRVdfJ/eX9
	hXCCKvw4BsGr5eXeBM3O5j1JNK5llX9HJoddc9XhD0857wY9R0MKPAX57zY7LMzw
	CcbeIoc/safcVYrgH7pRYAA6bm8f3iSX38wwhFU3j5pUE+lF1g==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LT16wnCifMM0lLT17wpoAc
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 8 May 2026 14:45:52 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 5/6] xen/console: update conring memory allocation
Message-ID: <af5ZkFyE+LO63BYh@kraken>
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-6-dmukhin@ford.com>
 <b5c89f74-cdaf-40a7-b32b-6c54610a5d9c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c89f74-cdaf-40a7-b32b-6c54610a5d9c@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080215
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|BLAPR16MB3907:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6fdaf7-fc35-4e3b-ef64-08dead4b2f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V3XyphsvSPGWwmL042M263aTYKr5qksFMInm3mV0OlAXs4UWDXj7qUH1wXSBLqjBYphQYwg0JCx3esQEE3h3DXlF9D8KOHKW8QX9jgG1c2+W60cUroIaVrzuXO4kQsKMJ3ThBCC+sSFhUOyh5DS3D4M87JuJUI4e/H8UBE1ZUZsKJmBk+Jd4Ln2lU55XCWlyUUWTg1fXxJxvVikGEK7iOqigfp0lqcN/Xl6FnNKkwnLu/nnLHrvqtdD16qRrdRhU8iJ3ubX1niWPxm0wSIuxzjadyJrSxki7XL18t9a6y/cmUk455+7I02uq58JUHqV+lsCYEHUwfLwdDEThO9yedf25EgXGoenoyTEWO7gqYhdGN34N5V/C/uCPFlx7X388YqUx1w3AY+to/oZf7mru0u+QR3r8+Z2sLL7zaDmR0vxY7JAUt4OmeE0cG0OMlGRbENspkSVnkeIdoddjxAluK0lULUqkJ07XnZomRWqT5Bx4h1nsKPgot9j7wBur9bbxdkS/Qbjb7LGtQksoPB1V9BUDLQG+h8EQ3lxzauN++887Co//7M121YMbQ6Uce3XwuwQuqjkfCInCEgVuJyApDMdB7WNqQMKWIGl+ylgq/HCoEYApxJWaCEhGACxcUZ0X+DAt9vnt63ywCQoUmgc2MRS55GlUhbytV4NxVm4vGuY8tPb0I93sIEjZ054CLr5YmLOruY/mJRzrabFNa3/EE31LMwBoe2UU19gKGv75HKA=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7enshLvSoo+/MuxuRxQSidG6h3zuNrTcc4EiK23fuqBn5Y14dNalH40da96cKf2GpMBF5STiLe5DbZCgDGOZ+SONpyYup4jwJlNUjUSZismWcCvYLmIgkoZ1GzSS+qDtIo2zY4sJWYnNy/JnFZC+rjBPjX3sse37fJ6Odp3qxbD4rDC40HiWIOnsPOFwBK8rJmBQBsMk/pEh3vg3aPwmn99LKxSRWXN4jRS3WH9EHd8lttTkDokPlvuezVIfE+GlLkrspSRbd7sv+bIPkPAPVuUqfmB0hS0wxZ7cfkh6n5NlO/fmDZCj8jJfkl+Cl2mKVyTzPc1rZuB9UjidSda5TKvHOW8gyRmLLORrJ+SIfqF/EyLcE4vDp6yKDNcRcN4a1ChnUaAlInq3EwsLhwE+F4kpL+JVkD+XmfrGRXz5XKy0AXn9pQt98L4vAqn+ePrV
X-Exchange-RoutingPolicyChecked:
	EOgA/tXfS4PYU7XblIFDOMseKb6stt+mUyYV4laK17ebjGmoSnrB3Lvzgk2TUzl7xnRNH60UAUJ1QIkA5K22DWb/B+ruf+BrV/HVGLjEl8voT+g5D43mjsdnW4ZHq494oVHG8Jm+PHLfY08yqOnPNYnmz+pj/BcTVqmTRUpPN3bIQh2Wgbw8SQl/mFZjOLAgPMAIDRjVl+FbF4lS7hinlnSYqVResbYL4rWsclsnQG+nNVG1+HM3ESdxvd47Irto3mwvToo3TIGNnBnWpUlUpIYuS1LZriHGxzHGWtMjKJ594Qbh8HW0Y8W8L/jYrtneAzdwySTRnYZqyMyXcqbubQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aHFuly8ArJ+FTiMfszBoxrhtTUrA9ebVBzg9c92bGCBYerqEzL2ceRzI5x5m5FtY/vd8WoeDHT1AG1C1f+G7owsB1u0hLHiaOBY4qfVEmIbWDFEdnqguY77M+XGbEx5Qg4Z8GkeLkzNAyq/pW/xlLVmNqc/WBTJcb6kWahwO80itxTapXpVxmoTlRKCKcAUjYdgZJVEJoeqVhwPtjx2yQXNF3RYsDgJCvawwhzhGWWYZ/N4hkwkTggi7xYBvunAC6QKcjTiUkIg5ES1DyaQp2SjysTXIWHfpIx5MgATLf2aFGa96VhvW/ohEKzb3DOFsTzTEiPf9y1RI7VFsg6YhYVDbR15bfuECcMDS9GHl71vp/i/YHMWywlj1hlezQckEt3ZKxz9LGD6fIeLeU/09+Hlpgmp/YQV0BXPvbNxTY9JgaIRfhP/Qw9hU/yutFDaeCd5i0VXwAoGYtOI9dXpoGYt7c3S5+Qh5xDLrISN/TqDz3hnz2Vf5UuxMBhTTCRYNKSv4T7Qjmg/DnezXrFcP4/g10Af6hdJKQxDA4ZGhp3/i0EipmcimdHx3t7mnakFgMtd7/nHO24klhBdj2rAdFua+MepTZlAvzXnHmaqlI7QWo5+hOnkLSjhiULPOugOX
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 21:45:56.1424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6fdaf7-fc35-4e3b-ef64-08dead4b2f80
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR16MB3907
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxNSBTYWx0ZWRfXxNMf1qm8yY45
 9FF1W2g2Z6Xd7Uii5kn6ieioTI/CAZZT4ccWxrFMawI2KlQ1d6Ay/YzcJdcn5d9kCZWnMS/wU8i
 L7LMBlCh4SPXOQ6qKuWGPMpVFNXlRg5echiLdMe1GLFDiGQ/g0twP3nGcoMpid1LorEcdFLIrUh
 2OktMnfrchniepzEROfwsgH+LZq+gb6XWMgi6M4aheFVf/T9/N+idLLAwgooW2bM5dTpBA2uprv
 Z3uRCSJgMidjTxpSa4aofUuA5uosq/K1mtMNl9b2+WhLub3blqjwp2C6QJUlprjIxxEE7eWimxm
 LuPbqkWO2PD8OHE4OkG6n2dOva9WjKuzQ+ZUxBdQEaqLLKo81YrIwjHL5Hb2fgrwLLryVIpM7ek
 8MgcMfnRMrMLmotIDQrBlgkgVw1VC7qXefxDMoeob8o+JBvWZ9zHk5KNGC4nemTnBrkqXOdKXYG
 Uia5I1NsrdKcNiZzuRw==
X-Proofpoint-GUID: d7qYcfMGYAbyd7KaQ5obNPEbT56M5Y0_
X-Proofpoint-ORIG-GUID: d7qYcfMGYAbyd7KaQ5obNPEbT56M5Y0_
X-Authority-Analysis: v=2.4 cv=WLBPmHsR c=1 sm=1 tr=0 ts=69fe5998 cx=c_pps
 a=64b+Fh2X7ngyiwpNPLbe6w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22
 a=mLnsDVdbAAAA:8 a=hCsd9eZRIN1V9IlIwUIA:9 a=CjuIK1q_8ugA:10
 a=3whSkbs7g9Me0DR5EJEX:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080215
X-purgate-ID: tlsNG-d62444/1778276762-B4D49FF4-30D6F80E/0/0
X-purgate-type: clean
X-purgate-size: 2440
X-Rspamd-Queue-Id: 3F5704FC071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
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

On Mon, Feb 09, 2026 at 06:02:52PM +0100, Jan Beulich wrote:
> On 05.02.2026 02:36, dmukhin@xen.org wrote:
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -463,20 +463,34 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
> >  void __init console_init_ring(void)
> >  {
> >      char *ring;
> > -    unsigned int start, size, chunk, order, memflags;
> > +    unsigned int start, size, chunk;
> >      unsigned long flags;
> >  
> >      if ( !opt_conring_size )
> >          return;
> >  
> > -    order = get_order_from_bytes(max(opt_conring_size, conring_size));
> > -    memflags = MEMF_bits(crashinfo_maxaddr_bits);
> > -    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
> > +    opt_conring_size = max(opt_conring_size, conring_size);
> > +    size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
> > +    if ( size != opt_conring_size )
> >      {
> > -        BUG_ON(order == 0);
> > -        order--;
> > +        opt_conring_size = size;
> > +        printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
> > +               PAGE_SIZE >> 10);
> >      }
> > -    opt_conring_size = PAGE_SIZE << order;
> > +    if ( opt_conring_size >= GB(2) )
> > +    {
> > +        opt_conring_size = GB(2);
> > +        printk(XENLOG_WARNING "Limiting user-configured console ring size.\n");
> > +    }
> > +    else if ( opt_conring_size < _CONRING_SIZE )
> > +    {
> > +        opt_conring_size = _CONRING_SIZE;
> > +        printk(XENLOG_WARNING "Using compile-time console ring size.\n");
> > +    }
> > +
> > +    /* Contiguous buffer; does not need to be naturally aligned. */
> > +    ring = xmalloc_bytes(opt_conring_size);
> 
> I'm sorry, but I'm going to veto any new uses of xmalloc_bytes(). As per the
> comment at the top of xvmalloc.h, the family of functions there should be used
> in new code. That family deliberately doesn't include a counterpart of
> xmalloc_bytes(). You're wanting a multiple of page size anyway, so perhaps it
> is warranted here to actually use vmalloc() directly.

Thanks for taking a look at the series!

Sorry it's been a while, I am getting back to the series only now :-/

Turns out that vmalloc() is not available on MPU systems (*-mpu jobs in CI):
CONFIG_HAS_VMAP is disabled.

I will switch to xvmalloc-backed allocation, if that's OK.

--
Denis

