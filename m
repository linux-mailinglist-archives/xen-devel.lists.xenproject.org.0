Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGipH1T2/GkTVwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 22:30:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA44EE9F3
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 22:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303045.1576608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL5LK-0000sY-R0; Thu, 07 May 2026 20:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303045.1576608; Thu, 07 May 2026 20:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL5LK-0000pd-O5; Thu, 07 May 2026 20:29:10 +0000
Received: by outflank-mailman (input) for mailman id 1303045;
 Thu, 07 May 2026 20:29:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wL5LI-0000pX-QJ
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 20:29:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL5LI-004uQI-3X
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 22:29:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fcf5d3-e002-0a2a0a5209dd-0a2a4508bd08-24
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 22:29:07 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fcf612-63b5-0a2a45080019-94a392172df2-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 22:29:07 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 647HZuJO1923238
 for <xen-devel@lists.xenproject.org>; Thu, 7 May 2026 13:29:05 -0700
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
 by m0482516.ppops.net (PPS) with ESMTPS id 4e0y9asq0m-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:29:05 -0700 (PDT)
Received: from SJ0PR03CA0132.namprd03.prod.outlook.com (2603:10b6:a03:33c::17)
 by BY1PR16MB6455.namprd16.prod.outlook.com (2603:10b6:a03:4b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 20:28:59 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3e) by SJ0PR03CA0132.outlook.office365.com
 (2603:10b6:a03:33c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 20:28:59 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 20:28:59 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 647JNvO74098353
 for <xen-devel@lists.xenproject.org>; Thu, 7 May 2026 16:28:58 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4dyxwd2db7-21
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 16:28:58 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id L5L6w9YKDkayZL5L6w6vbQ; Thu, 07 May 2026 20:28:57 +0000
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
	:mime-version:subject:to; s=ppford; bh=q67ScFnposfBacpLN1VEv9jZn
	oXMHjhDvCroqH6/dkU=; b=vQ1Ftyqh/Duo9Kjc9sShgEZFdRY1N8YIpu8Ehj8PF
	yPHisjnuUz9+8klrCCz1lovhDCCcTGbKQ6AM6pDFzt7Bx4agAwJvAWyiKsjGUdHs
	DWIWnRjGVFcgMtZqnr3FVT7VR/I2cV2qqNo1126S9PK6GFjXefc0Ifb1WZm61k3Y
	kVuUjAtagTtGEyUAjb6cZ7PBQu1gzT4fK+gWuDZIIyYOWl4r8ZzxVXypx6Otadpt
	7dyvscnkIujm/q08LRyZmaCO/Rn0107/Xguefx2F+qGCMN9EWpJ379qMVz+qmuEp
	NX/ak1NdWGxF5eUfDiun9lNQvtcqyq090UVDpd0GzZF+A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaeQj/d10TTq2IuLxxovdBmcqyPtaoKYrIhP9W9MUO6WbhtQf/fwTG2PEaspSWahJ+Q9PPR5fvdz1Aa893VQ/IVQskSMKFemEBHfwQVHC35nVyAoIdrspGukPxZg3juqd/3WPjMiyfXbgqG+Gj/rnwbdqhEZlRLbJ3Uq5V1vKjFWYk4bbunw8SGINgtRvVg7TSQnh9X7TRGpAYbpnnIu0lNOGkoywbV5dbte//WSVLB2Wz3Umb/GxjmAVMS896+xhA9Z0j2uKuITnx/UMKWl0RaxD0K8n9gzy2dPZyBAa495NQ1DSHBZFvrFmEsBOeJTQUooQPp/ElBf+YCTWKkjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q67ScFnposfBacpLN1VEv9jZnoXMHjhDvCroqH6/dkU=;
 b=AnSfq+RrnJAfiEFALPSPrAGZIy6vQtli86tf1fyZ7he1IP/FM63lwmSBzZW7br5yz1RGKEkC6kps7zK2legh48GXcE4VrZ2nOVY94vOpZhT7iD2xanD67buyhSnBgelVzoZSKbailQbAOcr17u3GCiAV6ONYvHsy8jctPUMynoaf057aqGNjJxcooDRGmAmT+3Lf4zAEmWbsqpAYopJT0WMhj3Ze8CdgIYoFgx3FzGu5LUETmJc2ztan6+An8wQNo/szyZ3DQuTmL8tXMC3njGgpwuJaPFroWfB5mgmQQTHx8lakEI0QlLdKawvlvYb+QMikfShtzSWHRc5ysWhZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q67ScFnposfBacpLN1VEv9jZnoXMHjhDvCroqH6/dkU=;
 b=cHqP2kXfH0zpYGvphCrozwHBqz/rG0Miv/Yt7xiOydmg9vqJfmZ89hDkm2ISQkixNDNihG3ODMfBKk9LtoehjmQkHa+GYHOz+vD9YIhS7B/l9Ep+N4ELdgtdwLWeDf5EbBafnNvvZTBe8TWBeuWDnkfx/cMQvRRrw3FcvtzEY80=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=q67ScFn
	posfBacpLN1VEv9jZnoXMHjhDvCroqH6/dkU=; b=OUAD/pipF7Y+NC5W93CopmD
	8lCckd5Llpaw4MzHYlb+15YfC5G+TgxF01HFKFzGOoLAS4eEE/rCbQ2isrzNyAWX
	R9IH+2bpQi0RajU+yZHiqYQ3ka4CFfp5CtAu1nAMcZMafNDbh5i9CsSPdLLxM6F0
	Cf7huWrLuc9TrjpwzPip+T91aWuWIhS6O7FCxESqmPz7I2i5gYqye6fPB2tF/HK4
	80rOkS7sjcom88yRBsdMkOsvyd7TW6A9Uuob7treCx2rAqpl+h97M+r1e0U/e9WV
	ZRp/niT4YeGMRWNtDLcYUgidtI+YLdawtw6QNkJy05ZSwBC8Ou9vE7oF627mlSQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=q67ScFnposfBacpLN1VEv9jZnoXMHjh
	DvCroqH6/dkU=; b=rf3G305cf+GNrPmj871SPrPRKjGLtx4xVhljjMQWDl8dmyj
	EmXLeW0yfcYG0gjsxTXXOzfTT2T6Jpezw9KJ/dWgr3B+wxYwXlaPoQi5DzV88Tas
	zbTIQf9xkVWndeJ1legXRxwPl5VPXmogKia93hvKqYTl6KQspFPQEV8j5UhL2Rwl
	mQrGF6x/RMrTdTzhJ6vOv1iAGKofM4919lOupISN9aBVIbp+SNBTIeOJP1yqRNbS
	ToUKJ2aIUS4JXxvz2LOdZ2MxrG8txgEfBUczdBYA7tbkTUWw92ZC/GAiew/06GsY
	7J60dFprqKFCQbz7GpAPE2sFJEHucg+rtQ+zcaw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: L5L6w9YKDkayZL5L6w6vbQ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8] xen/domain: introduce DOMID_ANY
Date: Thu,  7 May 2026 13:28:40 -0700
Message-ID: <20260507202840.293269-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070206
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|BY1PR16MB6455:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ec3bfc0b-ce4d-4b55-f279-08deac77450c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	szRrU+PYGKnJ7laBWvyqDgOJsCLFoycaLg92PMBBNUhABBu7DFKoEf7sl6sjrrzs1HA28eLEm2J8nkrU5U9IB3I8rSAb6PAtSsVB1E1w75lMcGI3fR4/crprhbcxet0A+lAQc25wJXerxfOg/AkdK0Thhq2pmgj9v4NpqWQFvpEaNRbz/n+xPIV3wZjqw2E+vV4+40LicqYYZkjE76gxGJ6Zm8Zpm78FFM0fcrglapY2zscIKSRRow24qbbZ7obsMTVygecBf9lKWV48YyfFTK8V3Qoo/pLRJuFcPy+0TE4idq+1DRh7jXxlORNPlJXvjkQA+E4xizIVKrvOFKLdW4hY2S7FqwOXbFTxBgvYNac7kmJLabHcxW6spje5VkpaAOO5GQbPNOQfBlxNSU7JVaisKgkyCuBsqAagSI5nh0Yp3OB75HxjosiFYjWboxjE/aYJyJy7QZZ5L4JH2yfXfu1/4k7AErIC/Jvl78nydPr5iKYL7c732+qtEU4Eamw+ghYfPYB8NkFyDSUCPcjW7neZY4GUyn9SXFs8m5We7BhS2IcZkZr4DKvtSL9EDnnJIOXhwZL1liIuhneaqL10FHHub+FCP20W61Jv3J15WJfA9Oq0ju1fktah2Oj4tHfYgPN3x2pDTa8Q7Qlnlv+MlFRHbjM8lqkY63ifg+C7BpvXnND6IxMlYk3t5Aio8J9M8WapamrRE7B7ACuIXcVrhdxaxOASS2H9QJUENiXHHbj7EoYint98UcyAa67v2FaP
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ow1MhhT1d0TxzKPVhDvQGLot9Zxck/1iw03TXlrE3Ojj9l3+ikrskS0EinSwUzKPaU5OEiB10NLTnFfyYtH6Qej4Ph67G//R7m0xazPHYcuD7FsYk82/e5eGnLPDDCqF+z8WAPb9AesPPQ+/jzJNnzv2Ei+d0kO8e89Z1KtxEVUMdPohEzClgX/5zK+IJkYUyDqy0ST0qr63EpSeVMiuXthS6SZPqJ8QWK6C/2NaSBt0Ul18Xj68uSbGIn43vdglV7WZMcu+qpyf7QHd59R0EUX2/FfIJ/U5SeWM63wwMyuJ4yttS8F3UTZdAxCxH8zXU1H6BKOD+/dvr/hcTHVj7Dyb5SUmXqyJTyB5Bqch+4yuntm5CiOrJmbVOSmH7UH8G3Xdvk1mR2KY3Fg8VXQKoRXtAZbA/mPuKfNXSahvUeIpyp5pWnZhUA3AWoURivjS
X-Exchange-RoutingPolicyChecked:
	kfQXIp6MSNgatpj6oNyE909n1PlRVeNX3tRD4n9o4jUbBQ4/KF8XPayQGiXHXyaf/JmkLeSGrDD9SKGBPakeiqUCT6l6yTT8xDoryEME662HvF6HorTUIePtQQoWHatX0IFAdlYa/+VZU51S+T4fxALdyo3MqRH5bXj13/ChHtZJO297Qj15jGX5dv+RbueiXUMlq6o2uftPHmtGcd+W8kFehuDWSuVx8nELv47asIUbbHs/e56LkIyAyrXyY0Ytkqknpu1l7LNOgC7gMfgQBFVU/9AM6wc2j426oVP/CWgOaJ5J1B4dvYkKDFx+4Be9M00RrFNKJ8YjqutLWa6m8Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MHAlpU684UYZOtuggl1L4W9bJ3eI9k8KYcvVDMwKXNtAM0MP692mc2woQRjzYiFi5tb1fuCy/0JUO0IB7K35NbpkzKsB4vOW8+krmu98/E7yRQ4AtR0F4NnlGxnFYO9Ep9qzjPum0YcV4jks/rpWtwRq300ag4CjZLh1MrOWkqniMV/IPEUHFrtDGKzcXC+XZmof7Naml9uwPNhudyFELpQ5XmBYdFBFvfOBYZZDVsZNvIJdOLQFnhLScddOsujOTuSEmVz4Nzm55+fWOzp0GlWFG9eZ3uLJPYZ25wBJPtoN/FvQmGgthBbdDO290yoOhgHFDmJPk8yzs24Fj6QG+fh7Vd+dxaYw18+ui6Uoc5KQQUXOnWUzOS4eXbZWlN1pyX648HNZj13Af0f49rPGODh4Lv+q46UiLz7AnjBBF7xmKwkzwFuK9327IT5LR8HOnj2BxEKzC0JrxdDHcaKNIVL/gpehSrMBEYhxxIPjMf5OclGSyJU6O2cQAZXaKqT3oJVC6SiYXZC7f2QgND8eRc+/u3LOhQzXOAhoHMZh2rW8c8U69AxBWfbvFsIwKnJ75OngYVh9E/6ABsfIBawXF5RsUs4wna7xFkrZ+U3+agx7YObQBt0XE4Qv35zVXPIl
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 20:28:59.1650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3bfc0b-ce4d-4b55-f279-08deac77450c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR16MB6455
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIwNiBTYWx0ZWRfXx8Qkt7KSI2a+
 auABdELgLmCY4VUaIthe0L6f9iWpCi0k1ITM43YHsbrEKukh86Yf2iTtZQmPutKphAebU1roI5Y
 6gfg3bvNySZ7A23KooXZhsGJXF4jT9twKS+j3di10XokcoPSG4hIUy/yCGJENYgvzengsQmPIO0
 Ybxyu2mvjTuc59PAm3QWb//Owbey/Os6Am/uUcQVJiENg5nRJ+3hTtcNZfL6I+unoxcLoZaIBAh
 3zDR15FJzkn4BQpJni1eWmwcEZTug8v0xu8LCTxH0uK42yLxQ2zwqNbM+fGD6e13aOZ2XbpetU6
 epebTe/TyJ3csE0R/z2eWWGBl7TFaaSCwWLoqFox8eIF23e2yxSvzljS3f6RqXvrslNOIbfgAHd
 EYK+PsKKfSGg/qWB9RVlD56PMlIWBA61rh477TcwttEngX3aQODWbCopxBgRyWxEl3kBkqTL2YR
 YXfpbdf532hdLKU/i5A==
X-Proofpoint-GUID: QefB-DN4F0QhuiXd-c63Gr-oftJJW7Up
X-Proofpoint-ORIG-GUID: QefB-DN4F0QhuiXd-c63Gr-oftJJW7Up
X-Authority-Analysis: v=2.4 cv=cZriaHDM c=1 sm=1 tr=0 ts=69fcf611 cx=c_pps
 a=wPn5mG08gX1eKnPfDThLSw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=j4ESyb16A0szqJZRwzQA:9
 a=G69WFyCBNqGPyalROSdv:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070206
X-purgate-ID: tlsNG-c1860d/1778185747-BD360DB1-EEC701A7/0/0
X-purgate-type: clean
X-purgate-size: 10152
X-Rspamd-Queue-Id: B3EA44EE9F3
X-Rspamd-Server: lfdr
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
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:mid,ford.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Add a new symbol DOMID_ANY to improve the readability of the code.

Update all relevant domid_alloc() call sites and harden the domid_alloc()
input value check.

Also, fix problem with passing invalid domain IDs in
XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
uses 0xffff as domain ID.

Fix failing tools tests too.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- aligned the DOMID_ANY comment with another patch sent separately to
  unblock xenstore series: https://lore.kernel.org/xen-devel/20260429120619.1013440-2-jgross@suse.com/
- added fixups to mem-claim, paging-mempool, resource and tsx tests.
- Link to v7: https://lore.kernel.org/xen-devel/20260408234046.1314021-1-dmukhin@ford.com/
- Link to full CI: https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2508345752
---
 tools/libs/light/libxl_create.c                  |  4 +++-
 tools/tests/domid/harness.h                      |  1 +
 tools/tests/domid/test-domid.c                   | 12 ++++++------
 tools/tests/mem-claim/test-mem-claim.c           |  6 +++---
 tools/tests/paging-mempool/test-paging-mempool.c |  2 +-
 tools/tests/resource/test-resource.c             |  2 +-
 tools/tests/tsx/test-tsx.c                       |  2 +-
 xen/common/device-tree/dom0less-build.c          |  2 +-
 xen/common/domctl.c                              |  3 +--
 xen/common/domid.c                               |  5 ++++-
 xen/include/public/xen.h                         |  7 +++++++
 11 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index bfc9149096a3..6fd62d140389 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -681,8 +681,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                     continue;
 
                 local_domid = v;
+            } else if (libxl_domid_valid_guest(info->domid)) {
+                local_domid = info->domid;
             } else {
-                local_domid = info->domid; /* May not be valid */
+                local_domid = DOMID_ANY;
             }
 
             ret = xc_domain_create(ctx->xch, &local_domid, &create);
diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
index 17eb22a9a854..65da0d075a2b 100644
--- a/tools/tests/domid/harness.h
+++ b/tools/tests/domid/harness.h
@@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
 
 #define DOMID_FIRST_RESERVED            (100)
 #define DOMID_INVALID                   (101)
+#define DOMID_ANY                       (102)
 
 #endif /* _TEST_HARNESS_ */
 
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
index 5915c4699a5c..71cc4e7fd86d 100644
--- a/tools/tests/domid/test-domid.c
+++ b/tools/tests/domid/test-domid.c
@@ -41,20 +41,20 @@ int main(int argc, char **argv)
         domid_free(expected);
 
     /*
-     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
+     * Test that that two consecutive calls of domid_alloc(DOMID_ANY)
      * will never return the same ID.
      * NB: ID#0 is reserved and shall not be allocated by
-     * domid_alloc(DOMID_INVALID).
+     * domid_alloc(DOMID_ANY).
      */
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 3: expected %u allocated %u\n", expected, allocated);
     }
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == DOMID_INVALID,
                "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
     }
@@ -64,7 +64,7 @@ int main(int argc, char **argv)
         domid_free(expected);
     for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 5: expected %u allocated %u\n", expected, allocated);
     }
@@ -72,7 +72,7 @@ int main(int argc, char **argv)
     /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
     expected = DOMID_FIRST_RESERVED - 1;
     domid_free(DOMID_FIRST_RESERVED - 1);
-    allocated = domid_alloc(DOMID_INVALID);
+    allocated = domid_alloc(DOMID_ANY);
     verify(allocated == expected,
            "TEST 6: expected %u allocated %u\n", expected, allocated);
 
diff --git a/tools/tests/mem-claim/test-mem-claim.c b/tools/tests/mem-claim/test-mem-claim.c
index ad038e45d188..69dc99cfdd51 100644
--- a/tools/tests/mem-claim/test-mem-claim.c
+++ b/tools/tests/mem-claim/test-mem-claim.c
@@ -21,7 +21,7 @@ static unsigned int nr_failures;
 #define MB_PAGES(x) (MB(x) / XC_PAGE_SIZE)
 
 static xc_interface *xch;
-static uint32_t domid = DOMID_INVALID;
+static uint32_t domid = DOMID_ANY;
 
 static xc_physinfo_t physinfo;
 
@@ -142,7 +142,7 @@ static void run_tests(void)
     rc = xc_domain_destroy(xch, domid);
 
     /* Cancel the cleanup path, even in the case of an error. */
-    domid = DOMID_INVALID;
+    domid = DOMID_ANY;
 
     if ( rc )
         return fail("  Failed to destroy domain: %d - %s\n",
@@ -171,7 +171,7 @@ int main(int argc, char **argv)
 
     run_tests();
 
-    if ( domid != DOMID_INVALID )
+    if ( domid != DOMID_ANY )
     {
         rc = xc_domain_destroy(xch, domid);
         if ( rc )
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 1ebc13455ac2..7e417d9798ac 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -18,7 +18,7 @@ static unsigned int nr_failures;
 })
 
 static xc_interface *xch;
-static uint32_t domid;
+static uint32_t domid = DOMID_ANY;
 
 static struct xen_domctl_createdomain create = {
     .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index a7f2d0464326..236da0dcd45e 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -178,7 +178,7 @@ static void test_domain_configurations(void)
     for ( unsigned int i = 0; i < ARRAY_SIZE(tests); ++i )
     {
         struct test *t = &tests[i];
-        uint32_t domid = 0;
+        uint32_t domid = DOMID_ANY;
         int rc;
         xen_pfn_t ram[1] = { 0 };
 
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index 5af04953f340..ea7c03ad302e 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -362,7 +362,7 @@ static void test_def_max_policies(void)
 
 static void test_guest(struct xen_domctl_createdomain *c)
 {
-    uint32_t domid = 0;
+    uint32_t domid = DOMID_ANY;
     int rc;
 
     rc = xc_domain_create(xch, &domid, c);
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 6d6882a34b5a..eacfd93087ae 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -871,7 +871,7 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        domid = domid_alloc(DOMID_INVALID);
+        domid = domid_alloc(DOMID_ANY);
         if ( domid == DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node));
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c575..b969f5ada6cc 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -409,8 +409,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     case XEN_DOMCTL_createdomain:
     {
-        /* NB: ID#0 is reserved, find the first suitable ID instead. */
-        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
+        domid_t domid = domid_alloc(op->domain);
 
         if ( domid == DOMID_INVALID )
         {
diff --git a/xen/common/domid.c b/xen/common/domid.c
index 2387ddb08300..b0258e477c1a 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -19,7 +19,7 @@ static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
  * @param domid Domain ID hint:
  * - If an explicit domain ID is provided, verify its availability and use it
  *   if ID is not used;
- * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
+ * - If DOMID_ANY is provided, search [1..DOMID_FIRST_RESERVED-1] range,
  *   starting from the last used ID. Implementation guarantees that two
  *   consecutive calls will never return the same ID. ID#0 is reserved for
  *   the first boot domain (currently, dom0) and excluded from the allocation
@@ -31,6 +31,9 @@ domid_t domid_alloc(domid_t domid)
 {
     static domid_t domid_last;
 
+    if ( domid >= DOMID_FIRST_RESERVED && domid != DOMID_ANY )
+        return DOMID_INVALID;
+
     spin_lock(&domid_lock);
 
     /* Exact match. */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b12fd10e6315..2149b8dd3808 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,13 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+/*
+ * DOMID_ANY is used to signal no specific domain ID requested.
+ * Handler should pick a valid ID, or handle it as a wildcard value
+ * depending on the context.
+ */
+#define DOMID_ANY            xen_mk_uint(0x7FF5)
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.54.0


