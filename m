Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l745KZgrVWplkwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339AF74E679
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=BSTRIxo1;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=Nfherkxk;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=IunAWzya;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b="qU/RAtBH";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361816.1613904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCv-0004yC-Kd; Mon, 13 Jul 2026 18:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361816.1613904; Mon, 13 Jul 2026 18:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCv-0004wh-Gh; Mon, 13 Jul 2026 18:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1361816;
 Mon, 13 Jul 2026 18:16:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLCt-0004us-8b
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLCs-00EXP1-LU
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b8a-5cb7-0a2a0a5109dd-0a2a4501c2ae-0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:42 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b88-3ea4-0a2a45010019-94a39217583c-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:42 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DI3J6S4000180
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:16:40 -0700
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011029.outbound.protection.outlook.com
 [40.93.194.29])
 by m0482516.ppops.net (PPS) with ESMTPS id 4fd4wfr67n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:16:40 -0700 (PDT)
Received: from DS7P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::21) by
 CH1PPFF9B87097C.namprd16.prod.outlook.com (2603:10b6:61f:fc00::a2b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 18:16:34 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::3c) by DS7P222CA0028.outlook.office365.com
 (2603:10b6:8:2e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 18:16:34 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:34 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DHfusS3407614
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:33 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fc4f7svev-23
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:33 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id jLCgwFUNAaHu5jLChwDmN9; Mon, 13 Jul 2026 18:16:32 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=ce1
	jhMiaBy/3W2Uv2mKNvHf2zWc6VTi0DOZv9EOD9X4=; b=BSTRIxo1K606vOOzWAH
	Z25kptxC8S4QA+3yQskFtoqH4O2zg0/n74TteRuSDq97ZjDTC6rGCAZTr2l2b69f
	ZOykhAO47E/5NAssN8c/DpuD3d6ebE/g96Nw+SHC29YS0Ihdcnkvf0jDBMY40g1j
	B7KljmP2tg8nRgX2ZKvxUVF26WZ9qP04+IXlvEq+jyXlGdN2hHLmBfVeJu/sbzDc
	wuqU8cZ+i5K0924LDKfoEKo8zqgyBNt4YmYhpsz5mzu5YCTeIhwBhMDgNMv5UFRy
	ScsPXexn5D7xeY40y8UouJKvWDXWu3Xt3/IinRfoZMPBFmPfQRg5byCre603c7qd
	Cyw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmo0uvp4/stlE+Gcv6Lwr/SLFmCSi+RBtXqfYcslQI7OhQkhm96e5XBj2ed1iS8e047LN2ER0WtLcQAQBdBksh7m15d2Lq3VnY/vubq9qIs3R/TbRknIcEFRrVofFr2uWGzg99qxODUNI3beRVOwKOvxAQaMCwTGQx9tFDshQs3b4ywt+X1YByJmhKuDNUbdRJ2K/M3Hp4747O2s29XI6DUl+fUOPh8V7H4Q1QXkfMKhCi+9MioJFsrWG4xIOcMk1L5YTTu6A23F9OKCBCOIhY4qr00vpH/tfjT/OdjYkmtLYbxLwm8sfqbTgtT0WS80lrIPuwKp2mWcVFQKSZvO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ce1jhMiaBy/3W2Uv2mKNvHf2zWc6VTi0DOZv9EOD9X4=;
 b=QAYnyqeDn10UBQUyLCft+YudOsgrfXK853E+XwURMZGdJnJ7vC47tjAzVxLsJI8RT7gtCUsIvJtgQfiweaQptTvw9+UrS9/UbTykwaexgr5AVKCCm9T3NR+M/8wMVKPh+xABkLC1cpmZfdQrLydbb+SsJHKwbZS1u3OxF4oTA3i3I0ENvg6asLLFCHlLgMawLH+RM3MtgLtBQt4mr4cDQMwldOzuR0IuV7Ryah/UYzfB6NnTccSAcqlwp9QKJ6oDWiLiwRMakcJaCyDCjHjo0i8z+VrvgJlzK6H/zo1tZJEWwrLVaxpN9V3Zrz5k/KdU82fexgPfhFg2WvlbkM8uow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce1jhMiaBy/3W2Uv2mKNvHf2zWc6VTi0DOZv9EOD9X4=;
 b=NfherkxkX/KlilcjMHeGicKIsm8F5gWpErcVn0JdHaLoXLQTDC24+kGuFmdvi9ypElPrWSXVXqvfGA6icZC0bGwgsqWvQvEv8oVcF3BojDdFDd9ujvBvZOUlT+6DCLR12FoC26y7+Hn1mvRq+w7B7We1w1Tv7gb5wg5kjP7ZGmM=
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
	ppserprodsaar; bh=ce1jhMiaBy/3W2Uv2mKNvHf2zWc6VTi0DOZv9EOD9X4=; b=
	IunAWzyajqN7VGzGfxXUBSMPk6iStHkqZzWjMY/dScGGrwnVe0/x+6o4KKyvL2RZ
	axpG8aSFaVWSH3j7wK5bk2Zh6oMLUn0eiMc4ubGIdotlVF8dqSg/t7ICF23RLsWh
	X9bx4GtpbIQm8CySi7SVhYvMrSQVIa13RylZSytV4anAvK7t7RAsOohEzdHeXgUR
	fVBCqaIFeFVyS4nAsV89dRCENU3jxe6CvSYapyTJH6KE7jwKGHgkZ3BZT0m3yoTs
	9ZbyT0aYaD4ziBBwJ7RmdAnp0AcWVHTdhbK3yhr/QhZGkKtW1vNFNjo/FUl+JLFW
	yYOpf8+1KfD+P6BwGGw0EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ce1jhMi
	aBy/3W2Uv2mKNvHf2zWc6VTi0DOZv9EOD9X4=; b=qU/RAtBHvf7PV/vX/KbQYcw
	mD2HYmAm1lSh6HR1HsNuOVpZnyW4UlUAqEQDvSaqsI+gp59uJJ31l4rG2fRJLIFu
	HhjqXawOihewV3amswJ9hhQINtg4DncwWbBS9oIwS/t5jc3GGWfk4ejQCC4A0z8R
	ol+hREoL1wZFGvoANDOkHqwZrzlHnlQLyusOraRGq3JHVZC2nocJ0FDaRC4vBC8D
	HTVc0JF3abGtjsB5UfZk/cpX13Ko+mN694EFqvI/VgYZBgGvmkN1rc86mzjeW0l3
	omDfXajtScsv74AvkX+7LSBXxzm179OrfuC2yc/bBroJ3rCsvVij27Se/Z9KhWQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCgwFUNAaHu5jLChwDmN9
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 3/7] xen/console: use memcpy() in conring_puts()
Date: Mon, 13 Jul 2026 11:16:15 -0700
Message-ID: <20260713181619.672176-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713181619.672176-1-dmukhin@ford.com>
References: <20260713181619.672176-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH1PPFF9B87097C:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7e3cf7a0-c933-4cfb-07e6-08dee10adf2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZrmtgJCc/Ur7ufh8Xq6MZBFFODH6RJ6Zkklvwf3hI8c7QmmODWdH1nB/hlXwKDDy4fGI6v/qwdG8ocLOBn29mVSayr9ohojU4HGs7GVUhS8V4A1zypOiANa4gTDPNnPZS7OQTmiqELDa/XrzgyP6QDyY45YkL86MxUzFenFglLiKWTTcGy/IzdmsYk5TuNN6jE0WpNb5znT0OEsqbVWbrWQ6MRho/OUwYiwGX9/mvEIz1W3NZgtEwOacmde/EjC1rcLSq+x/SJT8int9Cb29V80+6WDxYLFUDI/MyM0+RAkKcFh6g0cC9iEMFkB/vTxT6av0r5Yuk9yD9yyG+1rtSrVdy8anyOdJDy9xzA6IOZpaXbw5vjfQ+bYzWyB2ESMtVRUMdgwjHG2TBI4zsfzlnVqds06gfsZ9cmB+2MvWqEF7QTcYcDr83ujU6jrzx7KwQu6AcWIt81yoa0E6WspNwNyJpBRPw/pyrEffeNzvYApRIl6OyeU4+BD2dGpgosbxheRydo6dN1f2WmOQwQwx6UCzl7upx+/lkZeSRXTLdVYUG13iuJOeOJMstltFoKKPL3eHqmVoF9LsUBjdYsA46hlD0+mHxX2dmpJrD08pYVZpIIu+0ZIv7mcT+4JGdMoopvXeK8d+5jDzdY5sk/K2EcrR+eVq9Ww8UWLXFWLpKE6xhlVSIa1ciexBAd8RepcqlGjHfcOUt5OaR0S6tsMZvA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NBilErHaKeOMYCITYHzE01fhsq69dC2MtnBGlxBd6BIhz5W9cRLDtER/FCapbRQ2qc1qZWiGef7IRFbn9KCkcQxjcYkdZatZzazEqkLdBfKLwh48oMSoANsGXuuE28HqhVbG+/ZmtT0eh6dCZhE/ORgxFrjP40HzD4JzK3ouci9d6Ni2+ionAevhgG2Ertu81wBcZ7E/vJRthPoeu9XZVNzDZ5P/+G2EoMhyxU3UclXLHsv+gKzHjWDlojhQgbNiZZ3XXj1zYChkHGskm4p5qzTUA2Dq6+D6RhsXUb1wdvU0KVoqm57bUdZq9jxh7QquD86zRZ9pI2jrieTMvjISL87F10zQQzj+cNNjqkqUB4XYqL1OAlaYtIH4CJT9UuMA61ZpTz7i8iH9+Zuy7aOLadcujYSVHPbnWTwafMbOCNBvzo+Q96TAcQesw7i68Whs
X-Exchange-RoutingPolicyChecked:
	XywAiqBzJn9rjpyUXZ3wKjsSzfsoBKGXT6U7s651yrgO7NeIqtFeGhX33xvjWkvxVstAXjQcXDu8hkuh+nn4X6c39OSTLYM9wFKGLH3fpSPJYG+pDcqipLa09Kchp6z6buuO88YWd0fhzWJDyIQjObL2M93WwySVLgRvJxiIjjYsI+NDJxyrPJzr2Q4nJVrCbrA+MeSixB4NjBpzW9EMloGiZ42WPqJ1tp4BQRxzS664YvvKP1Fl204w3PvhyVddV/gSEbSCDo7fo5DL83ga0Ahqpzk1Yz35oBLSB6TfKhqY5bJ9sDzoLp/PzNOtOKeozpblatB2p7NrnowPN7lUYw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kIMmufvfpTfsVoIygmyfwK0E8/QDf5EmVT/n697r7ARUCcZstmkQKWyx2NkEWJS0Lnls8urZTIErIxyxOhw5v/hhlahBYkDfvMT0zedEFicHUWjywa2X2TrcSHtECngH+N+Yq3wvD0sEHc7z/in7aUJN3GWJQ+lO5yELICAqnets9yg75d/HxlOF4nIjAiqeVK8CqUaDHkpqjnXsgJJcWmXM1HndlECtLlEnUvqBknaH5U2yNttZa/5I9XZ5vj0/D+q0ggSi8MJ/bCJjbYzNUP3s2s3BBvISz5/dqkEJYYAu4SlH++VUsmbpS/mw5PwyT5iPpL6JTdRLoIjhiawb/9X7FRU44Jg+w3xSV6sG5IhzSuDN8MRG4/Pjj+o+StGeLyxO917keJeK+OinQht6akEH690B0fT0Ns1YM0ZrPQWbF+gy1irblHCnuShT9xi6o1+uX7+5H3e4RaU5hiudlg9KsYNjyoHLGmXHxySKipqkXq83b/1wdonugxMTKlR262xMuJj92gv2jax9+KHivNT4WK/Mh9THJyaYGsIr9VlB5CupWdglU9X4CpTWixrqc9iXXlJmM3al1SqkDbA7ul8carUlFkzBTSKoG3xKrMrRB5N++08mAJHLTr4LHqy0QyRvE7OcQZ7X/xnX1IZ+lw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:34.1623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3cf7a0-c933-4cfb-07e6-08dee10adf2f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9B87097C
X-Authority-Analysis: v=2.4 cv=ddKwG3Xe c=1 sm=1 tr=0 ts=6a552b88 cx=c_pps
 a=Y+Of8T+w2jezINbWzwznEQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=xRmHRjTGlWJa7SWEWMMA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-GUID: M3oZr_2FFyLSK7bHSCag-x5yiHkWYEmo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX4j/1gj8cPqxc
 /5JlsljOFzxC+geXap2jCeyRYB3/hkvymJnG3n9rppQ79UxandKWB7s7q6Kp+vKKgvHUHZVMxzN
 SC83IrdZm8CVUHmjKTX/cBSidNwrDLBd5vxzzHWRFcz1oE1BUA5u
X-Proofpoint-ORIG-GUID: M3oZr_2FFyLSK7bHSCag-x5yiHkWYEmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX9Q06vLfE/s1Q
 y99sGDMEsaxZUEiWkNu6h8sLLf+ShKIC1FHK59zyeLeSFU6z17lOY8cYEYUaITiVhn52ET6cUny
 fU3jlZBDzHCl1lPZKh6dNqeGzSYFJYXiUAQR3+bjCZPwR9ykhmSybW266UIhXeNcNfM4Z80r7Vm
 f8w3yfss+adimW2Cc4lzKmSZWafMV8eyk1fZdtpYMAryTryGTHG2gwSJUgGuZE5eF4uTsip6fiE
 tG8jakL9FqdjvdjLraFy+OJzP6PGvpI/o6BCQ9rBaufA6JHQArm4Ro6SJhzTh6xUzjiW1TvdC9u
 0KKocpJOOVyUlaUNeF7gkCUSzg5mFVhMWYdyQCNHdpHA+RKZdfb6D93YMcgCdNw0xvAjrVNHRpJ
 zgTAVs6c17QYaLfvUsm58S/BLh7DCF5y/RFV8MeBT9H20xYYpqEdET24+b49FUsGjRTqKColFxr
 VpAGRK0cn4Gwbn3N1Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-d62444/1783966602-3D6EA0A8-9B239F92/0/0
X-purgate-type: clean
X-purgate-size: 1446
X-Rspamd-Action: no action
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:from_mime,ford.com:mid,ford.com:email,ford.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 339AF74E679

From: Denis Mukhin <dmukhin@ford.com> 

Make conring_puts() more efficient by using memcpy()'s, rather than
copying the ring a byte at a time.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- new patch
---
 xen/drivers/char/console.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 37ea84403180..2da5005011d5 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -360,12 +360,22 @@ static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
 /* NB: Do not send conring VIRQs during panic. */
 static bool conring_no_notify;
 
-static void conring_puts(const char *str, size_t len)
+static void conring_puts(const char *str, unsigned int len)
 {
+    unsigned int src = likely(len < conring_size) ? 0 : len - conring_size;
+
     ASSERT(rspin_is_locked(&console_lock));
 
-    while ( len-- )
-        conring[CONRING_IDX_MASK(conringp++)] = *str++;
+    while ( src < len )
+    {
+        unsigned int dst = CONRING_IDX_MASK(conringp + src);
+        unsigned int n = min(conring_size - dst, len - src);
+
+        memcpy(&conring[dst], &str[src], n);
+        src += n;
+    }
+
+    conringp += len;
 
     if ( conringp - conringc > conring_size )
         conringc = conringp - conring_size;
-- 
2.54.0


