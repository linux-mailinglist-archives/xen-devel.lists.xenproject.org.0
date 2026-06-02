Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kI8AG/QOH2phewAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:12:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186C63091D
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:12:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=hR7Ypihv;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=Zx2bKI6N;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=Q7nWo9GQ;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=jkFew1dE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325315.1590818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSeI-0007cQ-4B; Tue, 02 Jun 2026 17:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325315.1590818; Tue, 02 Jun 2026 17:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSeI-0007a8-0p; Tue, 02 Jun 2026 17:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1325315;
 Tue, 02 Jun 2026 17:11:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUSeE-0007a2-MX
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:11:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUSeC-00CzmR-SH
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:11:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1f0eb8-2eae-0a2a0a5409dd-0a2a450ba0fc-10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:11:24 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1f0eba-212f-0a2a450b0019-94a392175088-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:11:23 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 652E4bo52519383
 for <xen-devel@lists.xenproject.org>; Tue, 2 Jun 2026 17:11:21 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011014.outbound.protection.outlook.com
 [40.93.194.14])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ej0m8t5ns-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:11:21 +0000 (GMT)
Received: from IA4P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::15)
 by SA1PR16MB6485.namprd16.prod.outlook.com (2603:10b6:806:3dd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 17:11:19 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:559:cafe::49) by IA4P221CA0012.outlook.office365.com
 (2603:10b6:208:559::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 17:11:18 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.0 via
 Frontend Transport; Tue, 2 Jun 2026 17:11:18 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 652GKRmg035127
 for <xen-devel@lists.xenproject.org>; Tue, 2 Jun 2026 13:11:18 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eghss3m0m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:11:18 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id USe2w6dUOYPuRUSe3wr0VF; Tue, 02 Jun 2026 17:11:17 +0000
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
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=cHyMdNdm4E9FT7rs0Vccb3T6Sks
	wOhnENdmRdS9sf+I=; b=hR7YpihvQJfKaIh12s4auiPZHP02VrpIEDkAw+fDnUH
	vieUjE65aaHbx5cxJKiy69GXOuj6eE5/0PPQ9HTt7xsv9whhVyyokQse8e1n1Sbf
	5xBY78GqsAxm+nzUPWeTJTU489/BIIsoWLi/Wj4Y0roUFN0blTDQaVqrLIC6PaXP
	IdHpg6CQA3V7Wvl7A0q+q497X7QxLMu0/J5o+Z9Ac4u9X+9aMF98pY8IY10HqQj7
	NjifSdamWIBoCvK7sCXoT6C6Vgh4MB02zFXabCeXTSmTSFXUYFpeXidGhLz2xOFG
	WrHgEVLYeLAZkbeyTMDDG9VUHhW+P0SY/1ymwNgGQVA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ+Vv1VqmYS7QUTULraL2RiylGDeLumMCI8o/j4DdwHYIeed/UfaGVnr1+xHnY6anHetpM7eUqSzZ3ohw2VsCTg/qlZBoyhwV2BQQJf3Wg8A5wT0qFpTnVmgS/nvk/uLyZrQaC+scjQ5wMc2GoICCD8nSrI3TYADlVgpKNGyHQctd+57iEcwtiWPcaHZkaiNi5zT7+/XnT+DyauUd9kOKG437M6aC7aBGwDugTvhKxfThbb3u7/Y8TpFW37P6PBZfGlpJ2nwP5IEKcHJnBuUcIiiYEODzq9ryYnOwLuCwp2eADVD1aAVLkuJU6BO3l6x2fLHH8PFa82Xeg5enTg9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHyMdNdm4E9FT7rs0Vccb3T6SkswOhnENdmRdS9sf+I=;
 b=Lkf8qfu/98E4DXECWbUDOsmgvUgunZoSGUIg+3cF/29h+UY4EjJ7e7Irly/DElF8iKjYlvb6VAxyVnn4bKSvATiOHxOXFAajF+xZ2pfDbLmELR6ONc7h27484VvP5nCa0/GFW8V+2LFwsGGV2KLjSzIMh6QxD/1/NknLmErr7QmIlkRPFQrfVIbSaDPOqFmFtqzIalXl3tv0s7nEBuiLEprt06lC4FrUGzdFW1peypwBPAkxBCnMP4eoXgCU/+KD5aLC1Org9aYoBCglPvSAYTzWNQQlAUGpwG6B2gCW92XTat4YDNBG+Z3hWWweptjaHvM468jHrLYTbmc/EV+s6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHyMdNdm4E9FT7rs0Vccb3T6SkswOhnENdmRdS9sf+I=;
 b=Zx2bKI6NcEwxbrHk6hRe6lhOoKUvYLp7OEF81v0U4LIy1zlxBn2tIXd9ndklS+vw2erF7HXp7d9jqMwe/cUhFhAb1LeUSSPM/NGqrVrk43YBrDOj0wsS67uhHzAVkJz4iAa79Ufm7rCa5Oy9dAwJoVU/NZ4GTqX1P4WzRRTkN8o=
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
	 bh=cHyMdNdm4E9FT7rs0Vccb3T6SkswOhnENdmRdS9sf+I=; b=Q7nWo9GQU+ZX
	UwJax7LGY/8W7nAtMW204lVWBwvSRDMUGOmmZ5y9wtEWg4eEIx9JAQlDXRh8o42e
	mYmVuKCXSF8kBtxWif/NcH5GcaonUuTGRieK6+BU2KK3OxUswNZxX+H2kWP6mR3G
	V8t4bSJ5lQ40VxrUc5tquc9wj3SgaGpAoeIHbB9OOoQfm6T6enAeIK/J8kxX2efa
	FDMi/6EI2CQMW5+Tpfp7xZh3TUM+o7SzbCGxtPN24rzUDH0gmE4tuVIAbDDAqh45
	0uPvdmVbTIEg7RHKuYcbSRI0U2cacaw6vBFKhfmTT6tQ3+pD0q2sc6oJ8+nZ+/bR
	WvJE8oU9Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=cHyMdNdm4E9FT7rs0Vcc
	b3T6SkswOhnENdmRdS9sf+I=; b=jkFew1dEO/jsnBMDN2yBYutgVD7xE6wj6aoO
	E3vz5BJekzRktNgGi7D8e/Wh4rXGHml9uCgDWjBBbCKR46cdEgIJh3olXCOzYENq
	CIkdY5a2hkL5ADlt9inqtd4xhIUvadT6Jf8FQ4tl9Ez9E6WzDa//TL3z95h7MvX/
	dcONHy+hH0xhM3F1kgzXRQJH6tD6rZo78hbxPRh4aCD4sGwcAAL8eS5/iuASoPkK
	ibjVYC6v75cpxVQ/tco/vZkkHtIggDeb5cYgTp2j35Pk4eyWs0R2Pkt4QVNCodwZ
	XG6UG0jX5ae6qXGpEOB6SxGqhHhRi20t1pzxm63FY1KYyaWhow==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: USe2w6dUOYPuRUSe3wr0VF
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 2 Jun 2026 10:11:13 -0700
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Michal Orzel <michal.orzel@amd.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 1/3] ns16550: properly initialize booleans in
 uart_param[]
Message-ID: <ah8OsWLjojlMiNSA@kraken>
References: <20260602161322.1039349-1-Zhao.Jiaqing@amd.com>
 <20260602161322.1039349-2-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602161322.1039349-2-Zhao.Jiaqing@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020166
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SA1PR16MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 05387a66-0727-4244-2a8b-08dec0c9f65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DnErrn2crmVAi7E5Py5r05VZiKZVHQBHvbX8Uk0Cly90/F+s8dNclG9YDwAE+7+KQIcAY2nqYlThjcM+2z2wUbgiEtSQAwYcjpg/1XqCuZ7BN3SuB42YiE6Vj7qsq3UyfD2A9MJv2w5ldD2XdJdI72wrMXhPMzDKnmF/JZ5xWSwVh32+/W7hXe3PX3BqGB5VmVSFxjaoGRVs9UyC8u/OYWwN2l1mRYRtia8UAkXLbUzIX62nNMOyb9iQ7A7kmxS5Tb7UO+WlFXVWVtSVsWKgaZ7cwvMBgeIKk43nysjPf4AO2edjWk+cpHP+f5bH/5qVWhRrrHTbC3buEMufDlVBPsH/1E3dBzcafPGXgjoxvnZicP0587sW/aKbBySQ58KPIuOefFd0qPDehOMRj1GprYbkGeL27ctgsC22nqPd2GQg2MWJt4v//SGbUzf93rcrzzK1nnIAcoIhsJvzKLUFAZAJGv/he38BE8f+ejzNWMbxkXskxvfwkcnJgptldi5MMCZI5uNK0ANenWpm5OAHiFvDOsYm+pnkI11whOmxtVm4oNhtn1eI8tckdYdY1dCzWti2pRrAMWf2n9vdG76Z5VtKSX6FmhY6BI+Ub8BZ47MB8JxYhC5oVS1nPr43CqhMRqLTXPpJUSPngZcic9j7EbKT7CqQDwoThD7nmb5kq7wWiv7SACnAEBDJ8Htfg8ZL1UxXMAPYudPzO1pB/OPGj6m/nnJ7P3RZfTptbdcLZD8=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c+2U/zI7mGNFHzaemru0MDhq888kQaBDF/zlnWqNIRBXGGvJN3fuPq2NzEpqpDfRF9hH76QWBCNC3EruiVw7puzQshny0VVRuVvRSV+gdSw5FmFKWZDSHR/v8GWwEpeHkxRL/cXIc4P4EyxU/1HUTYUaL/P46raCXeE41UNNcyRteD4eegrP/uh+rBCzpOf/vVPly3+masO6AKiYymApVRvfoImrz+7wLwPG7dt5CHcWNaciGEPMJtCdCZxVNoLNy8zQwhkd4DSfB5i8z/nWGYOER9JMkfbfMq9FfEVXqNe7u+u4kDlPg3msN/cf/Y8tOMv5FMqgGCBHNPGW0SX+mayfN4WuQ+NWOBWrjI7NXAovcx47RNppnvwyH3ZIRov8+dm3m8AieIvq73o6PZ22w9EqPyDTeTxmN88GMkdbaQ8ZRMOuXcjdxeN/3l82fOin
X-Exchange-RoutingPolicyChecked:
	OvqE8iKDj7uQOc2MCAi8uOCbh9fC3JKyn7gLuGVn2dwE6w9WzBs9Un7eOO4knV/3eH62RevWmXxdiqJuosx/r0hF88E2iVVJy6S971kcgtDQyZxGHa4myPmTsLsmsqPtuRZwB0s4aVNqY644yz45/yI0Bp7vBVDYRW6SjcsInx1zzhNwSKowr1T51vbpCFMcmd2BT4YDEi7qoVA2U8rbwMNhCNJovqUblvzid0et2ObpMQuhU7t2Urm6YWBZCx3DXMsH3jj5W8l9vbP6gaDhqrLyATY7y7oRS/hc2muKz+uaekmuvKo0KPAP4X/qfhQskGR7W0yCkWRfVuULa0sLHg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YYYmeW6br07RwTRJtrWZ2wEdc3mzZh1M6vP65MT/NvbuVeK8JD8MHKEmC2RWmDywVleINFcMTYRAsZ3xwyoGryX5hQLqV4j7t79pk7FtAnt2LvoF4BpK66bxF6RKQn7VbC+Aw5cpAXcRS9MqRD3P5/Iu6voBJSSpwH9d3JLkeBgQQ0QqxhLze+qWCFnAvKnt7AkIGOIahHgOZ6lgFXVQmZq1FFVoxx19UKAuTGS00GuaSb5kVHnn89bTV0xQXO1UVwQ3Fr3hXtDcSlu2w3mtEA8scAH76naa5edjYnDXrsQ2SXaFM22JpU7Br4tH/k0eddqLUqXpkJuMS0Rb/25u6lkZ42jmwSOzaCkUzhzwKMlZ2UHh8RAK3oxtmekRaN0rBcu9iXKlNSGTQ5FpZmoHM8UfQkhvrIEWu7eb3DeYiNvHq7881vG8DDJbsnTM+jVHwL4Knwf49p3n9iV56qmPlFN+uTOeDCYc2jphGdgxPwmS9PvHpTWmx92b2XFK6SISfSEqcdoJKjwlnYhk4t9D/E/5Z4nKXxrZ+/qzpMSjhlQyziPGTf6SVXec2+8jdrjSwxTE327AeDbZNIkigW/xFYLTgZWTj77RLQnz5AXSfEIhdz2WsV1aafq54MalyzqR
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:11:18.6595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05387a66-0727-4244-2a8b-08dec0c9f65d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6485
X-Proofpoint-ORIG-GUID: o9pEoFUFMR3CA5MXZuqTTE4eG_JaeLXq
X-Proofpoint-GUID: o9pEoFUFMR3CA5MXZuqTTE4eG_JaeLXq
X-Authority-Analysis: v=2.4 cv=DpJmPm/+ c=1 sm=1 tr=0 ts=6a1f0eb9 cx=c_pps
 a=u5a0R1DJIqwdmu/eAz29vw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22
 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=0od0BgLonnU7ZigJK8UA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2NiBTYWx0ZWRfX6JV6vW3ilNz/
 MQIP1xDiFhrk6m5wIPTBJu3FHwywwXbwgGmKcjCSfPWohWmMzbsbXxAnMfdMbEjcaxvCQfBcPAU
 5dcXO0bcgn0ZW7Rp73KSwk3FZSPd0RBBVTNi0FhEbGhuUBANqOCKuuHsccNGXkovw9icSvj8giU
 gmJjP0z3nKxuUUo3yRK/lcuBSHper/a0cQXMKzCxwJd3nZyvwlUXqQoXy4bkgtmfn+/XsYiUOqU
 RJjQsvH+WWJ6Zqp8GotHpD3A3XqotqNuP+2ooBagcy0IFWZMc6lN97cU6hM31ZyNFXXXKZ+/I3H
 3vrnk3+j0CWvsyijI3E9xwtu4uKUqRrg4LN7HxIGOfKRIg0PzsqMFaZ72ozUR2ZjM/8MTDZCQc/
 WpR0APoGInShRy5yAUNmQ/QHqKA15BO3vvfpZ0eF0U7Vx1wvlzeQzdrnRl9bD4RM6fzvZKptz0z
 hSDxYynj/9twRQRWdjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020166
X-purgate-ID: tlsNG-42698a/1780420284-23374F3B-1B8F9AB1/0/0
X-purgate-type: clean
X-purgate-size: 4290
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ford.com:dkim,ford.com:from_mime,ford.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5186C63091D

On Wed, Jun 03, 2026 at 12:13:20AM +0800, Jiaqing Zhao wrote:
> .bar0 and .mmio in struct ns16550_config_param are booleans, hence they
> should be initialized with "true", not "1". No functional change.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
>  xen/drivers/char/ns16550.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 878da27f2e..ed4e29ec25 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -758,7 +758,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 16,
>          .lsr_mask = (UART_LSR_THRE | UART_LSR_TEMT),
> -        .mmio = 1,
> +        .mmio = true,
>          .max_ports = 1,
>      },
>      [param_oxford] = {
> @@ -768,7 +768,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 16,
>          .lsr_mask = UART_LSR_THRE,
> -        .mmio = 1,
> +        .mmio = true,
>          .max_ports = 1, /* It can do more, but we would need more custom code.*/
>      },
>      [param_oxford_2port] = {
> @@ -778,7 +778,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 16,
>          .lsr_mask = UART_LSR_THRE,
> -        .mmio = 1,
> +        .mmio = true,
>          .max_ports = 2,
>      },
>      [param_pericom_1port] = {
> @@ -787,7 +787,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 16,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> +        .bar0 = true,
>          .max_ports = 1,
>      },
>      [param_pericom_2port] = {
> @@ -796,7 +796,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 16,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> +        .bar0 = true,
>          .max_ports = 2,
>      },
>      /*
> @@ -809,7 +809,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 16,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> +        .bar0 = true,
>          .max_ports = 4,
>      },
>      [param_pericom_8port] = {
> @@ -818,7 +818,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 16,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> +        .bar0 = true,
>          .max_ports = 8,
>      },
>      [param_exar_xr17v352] = {
> @@ -827,8 +827,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 256,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .mmio = 1,
> +        .bar0 = true,
> +        .mmio = true,
>          .max_ports = 2,
>      },
>      [param_exar_xr17v354] = {
> @@ -837,8 +837,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 256,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .mmio = 1,
> +        .bar0 = true,
> +        .mmio = true,
>          .max_ports = 4,
>      },
>      [param_exar_xr17v358] = {
> @@ -847,8 +847,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 256,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .mmio = 1,
> +        .bar0 = true,
> +        .mmio = true,
>          .max_ports = 8,
>      },
>      [param_intel_lpss] = {
> @@ -857,8 +857,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .reg_width = 1,
>          .fifo_size = 64,
>          .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .mmio = 1,
> +        .bar0 = true,
> +        .mmio = true,
>          .max_ports = 1,
>      },
>  };
> -- 
> 2.53.0
> 
> 

