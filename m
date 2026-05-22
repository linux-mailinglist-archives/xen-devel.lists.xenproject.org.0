Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDn7H+x1EGoZXgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:27:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABAC5B6DF8
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317012.1586323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRmR-00062O-Cp; Fri, 22 May 2026 15:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317012.1586323; Fri, 22 May 2026 15:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRmR-00060j-9Z; Fri, 22 May 2026 15:27:19 +0000
Received: by outflank-mailman (input) for mailman id 1317012;
 Fri, 22 May 2026 15:27:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQRmO-00060a-Lf
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:27:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQRmM-00FZyv-R4
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:27:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1075b8-bab6-0a2a0a5309dd-0a2a450ba54a-26
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:27:14 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1075cf-212f-0a2a450b0019-94a38ff1adec-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:27:12 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MEpU952467985
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:27:11 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4eam6ju8vc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:27:10 +0000 (GMT)
Received: from BY3PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:39b::18)
 by SA2PR16MB4058.namprd16.prod.outlook.com (2603:10b6:806:134::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 15:27:07 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::78) by BY3PR05CA0043.outlook.office365.com
 (2603:10b6:a03:39b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.9 via Frontend Transport; Fri, 22
 May 2026 15:27:07 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 15:27:07 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MEQCwT3201534
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:27:06 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eactprtaa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:27:06 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id QRmAwzCFxxj2GQRmCwdCe7; Fri, 22 May 2026 15:27:06 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=4v7
	HXgYZWteTNhxjPIQmScJWvSKX0zhIjiK5jHjOeRc=; b=lK6dLIMUhuk67MWtKdk
	PiToe5gAwK3t5+mJZPm6GLitz23TBaUUxtPpQnsNvZ34IwPnjEVuRp4jArEJp0sm
	Z9wT1mrxWQFkEvjFLdZSwX6eU3m9KFeB5YVBKXTUjnQaFicbGIXR81odpH3AlFH8
	geY3D4KHFP0heLgSPKgWLpgV23QBW8ktR6YsTiROGqHgt8j2Pqjmv9QA8yk7RAqy
	ljt321g4EOAc/CzMFWTZygkh3ouPpIRy+PvpT1q1dGX1HHKUdpA6WgeUH1NW1GDs
	90hIvcDa9AD4IlfWJAp84tp1WUqyFzyH2DYPiT4f3a8x3TkUfNSji9h6G9ZiRdcf
	XGA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geiAJxYVCs62dmGhregtHqHoTvJ4J6ghOuo3MkNS7EGJPm94fcl08ZiWJnn2qwedw/GDkvC802S5zIXJ6WwyL92M/anl1If9ZM1VMU57IgbA0T3/Lz0GakBGG9Fdv8uDwOECr9f+AYmwWZBZaoyBU7zseyELGGLnmvH3jl3vzAN8Vd9gnzT5Lf3XM84MX4uqfR9JepAanPKrXO8fGz2TzwKdd4xAij/k5WV9dk6CcJHC+wv+G1W510g5A7WOYXk4DXTJj5vO+O+LtzUL+UnTaQ2giOtt7N3a9E5zH3B4ZuZMRvlod6O3E1tRYDMEd0JTE2LQ99DuMtV9M53/gA+y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v7HXgYZWteTNhxjPIQmScJWvSKX0zhIjiK5jHjOeRc=;
 b=JZL+kj5qpB5Ey5GWMxERDNnuOk9dqxfpUDEcR9fdMm5/jbNxOr7AOsimyqPBgcKsplTZHMGOHzpTeSX+KV35dTC1a7DcaQPlFBFG0dlrBFDqcaI7LfaJcuPiW9NeqnDyQu4Rsu+vEP3DZJNzxMwW7gNCsMYe46J/wnCkmxIs1crwX8Na3PyTyklnKhEyS/dnORmfvT7ATb+m0km9fabHEI00hjAbL2DCnlvdoTSO/Zz37DFU/X8LGsaAK5vDnwc2GF4G+6JP8qy7Mbq8AcEGRt8Jo5ssDc8x9SaSCZs6H+mP5fZdcXBiPcxqc262ujPqmUcrpUsvfoTVnGJE4ggIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v7HXgYZWteTNhxjPIQmScJWvSKX0zhIjiK5jHjOeRc=;
 b=VFpC1sdUGspJvkM+zcnO6zDhQy9ow7p/iv45t5XVXGY4tH4biFvF0o/4Fd5PF+8sVwda/ZhYecVnjQeirN4+qo0aoBsoEQNWvJ/xQM3p9QnsYVF+YszxH9KFWCmVDabK729ERCULHDCowQZMNEq/FWNQcVTeiyWAaIzYK2pu5kY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=4v7HXgYZWteTNhxjPIQmScJWvSKX0zh
	IjiK5jHjOeRc=; b=KtG3LpPz5benh4uFEjHdTw8iuuhCugsPx+T6jnNtX8AzO4c
	7ZgwC2NN/AgtOnbPCRoeGF6uxGMyVzn4EssVCu14ze6ORTAwlhgn0/SR1RJUj+yh
	YmjxFKLF1ncUO0pFdJCqyLfhXdIGM1ZU9f8zD8RChtbK8CALBSU+Mw2Fw4vCqhFw
	kmHaEU4GwimVojdvPyUUR2wbZk1+V+OB9xsI0nsaS7HvmQWD9irF5vFTM+uh5Dc0
	qDjRrLd/9u5An/vFeF+Nq8g2kVusdzKyjweecSHL7GUhbd9+QxxkABRVCWb+Tcj5
	Bl4M99ANXpXUukwuduHe89lxYC/OyJNLjpGbnJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=4v7HXgYZWteTNhxjPIQmScJWvSKX0zhIjiK5jHjOeRc=; b=mXww8VOw8CtC
	u6MHhCW2WRiZW0hDa6r+y+8n8PgOk05ZjHjxVR+AAXc68rM7OOlyU3cVo4mkok/N
	DAuBWWyoZXOiaimPhAfN331Gk5YnkaBchegpnjADNA9XYg1clD5BRVoH1UYKYbxK
	HZP0oVeXraYYsTd9/Q3YlVOQKOeurL5i/xkRwuhNL0cZXMFeRCunG8lK93Q27Y67
	3UP0n69fIpPQQPCAt+zsA23FJRuy/NAxnybBTbmfKc60gsq4JK/4ASiH5igbqC5s
	ULOJzFh4QfOWNUL6VV+s58FSIMNXQiBngMnQet+MaITkwj3JTNXvizJhFPh7I6ag
	GBuoy2qDMA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QRmAwzCFxxj2GQRmCwdCe7
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 22 May 2026 08:27:02 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org,
        christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Subject: Re: [PATCH 1/2] argo: lower level of noisy connection-refused log
Message-ID: <ahB1xm8ltR+jyVv2@kraken>
References: <20260521232529.694570-1-dmukhin@ford.com>
 <20260521232529.694570-2-dmukhin@ford.com>
 <CAGeoDV9L5+N7nnhY1A4on0L1+aAfb8JxbBLwoV+XxMwnoTS8xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV9L5+N7nnhY1A4on0L1+aAfb8JxbBLwoV+XxMwnoTS8xQ@mail.gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220154
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|SA2PR16MB4058:EE_
X-MS-Office365-Filtering-Correlation-Id: dba771ce-5b79-4ff4-77f9-08deb8169597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|4143699003|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ix+q9VbX25HyyvGaxAJjZ03hMtEcw5ymj4TE9G7FcS2X+epYXgHFyCfMZ9OdkRP3K7YtvlCmIOoy1t8h6mU/w9NEH0ia5ufGhKe6EqGS2Is7yr/Sae4OAbrYOJ8PW3J1qcvBIXWPRC3Wql0y/ab6Folvu0qhaCuwFQJ3Uz6iWMA8KD0q1PGeLmohrJ9HKtiwZMhbBVjIV5mfHN2r9xgIIBvgu0jwRhHlYqv4Fa9DmdqwZ1bdpY5yuDtec2XTqhP40XGEMkPFboChZF5HGgTX0KgUwVp9dMRsb2v0xsPnHUo70vv1l7n6Rxv69orGxHCkBuyOE58+b9kPLCSxqV6gK8iErT3yqqTRObTG2anIpaajEeW2ba7h2+u08yho92jmga1zrcRtiVux2Kk+hL3X77UIKyAEpTqZiNwsSAb9750Rx0F6lbsveoUwtObRtakBpRtuheld3elChmarYDRdsDAyRMtRHhBAIhAy6+Nu/RB4pdHmOOLLzsdjq7hCugdJ96WgDhkirGUvC+pm3Nu6sivNowPHtb005sdxOoqlednKkCQ8lt6O+366kpbMm4aTGP5VYeJwJBYfL/cgtoYo/2qYh7zcQ/YPrvI73x7SKpiYbRjIA5BKLoJBdqtSEonxeKPgb3X34MifACoZErUhdhENP5MapBEakK2gm4vZcVLx4UFDsYFRxrhx5eRTTP88TFsuMmIAaFamnfmoyaAPGZU4aT8L08qmCMydn+jv2DM=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jsRAmrlkg+EG+W1ClJCRoyLktGXa5Dx6cUB6c4K/OAemaf0KmEPSM2Ple915FORfBjcsdCE0/q2gTV0wawoEYVfkJKdRGYfjaGMEQf8f0yeQd5c21jhNwbR29nVn8XIgv3rl7hljrFj0vuN2efZLGK/LByyc+phLO1A5SH+8EbzoGSFg+/ZRus7jZAbFPMwHERXQF7x1SZEnqWC0voXmDVFepFOLoBhkRzcbxU6Fu2ONh7EtJTUtFAlPMRQ+Y05dh0z19UFoqyt23Nhf7b8L2LDv44YDCb2ywT34j16VNclH+fe6E1LM9C3f/pyUCAaQsmFlKy8JxrEPis8GQkuhGfhwVOuyyn1u/yV8Khi/6ioV+EEywI2BOT06BejuSc0KKn4Zwr01cN64sCmqm8hee32DyB98MJ7MebEnqEzavmXXVDaLEd1MM3hHh0uy1if3
X-Exchange-RoutingPolicyChecked:
	SGt4E+uBdt15m3UBTfGVevYTF0kR9pL0pF7oQRsdwUCdB1QYmNl50L9ROjhZ4EW0y++jELAIqhYHhkhPSFoCL7bkNS911FCIuWNFFC0H3CvcYy5CDgUEaXkk9VhjsLG6AJROIv133Cf4QlhziELfEB4Fo+ycoIdtF31MGhaqN8d9+FkEQK1eUk/eIDNgC9zhDU+0+jr5Q7jqvB++xhaGm1K2aoAiaWj/NxfbYZmugIoEmFHxFAZiTMUG3HIYxnaUxFZ0ik+5xNKurs3agBrO1+K8y2oRMQhcsvWaIqK6Q37XeT2B34lPiKHPoPS3afO4JX165KOLUiTZkE6T66tsBQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	32SqQb0+NoFI/L0WalbKffQNMOSX69kP02HxIJfriUsnbbFJ5HiDKUvK1uXJWPzgaS2cPOWhwmyQmh13UcoTRSawRG/75KnYsJvOuPcIqxF9H4Zfh0kzkpHGw/tismMQPJZUrv7td0RH+BD1N5q4xEC40GmkTirFyBHYCJCrmXNGvdqLRebg1I5ApXqyUKL9vPkeUkjQU/j/y3BO+wHkF19M7ANAQ1/3eAiXuOv2wDVdaDVzDTTKIDd8CxVupvK8GRNyjToHWPqgUWL1DaKLAQcOW48vkPEEkFUnB1lSgsnmQtCP+8sk0yGCVQ7Bv9UbZXPYhueswaTHolZhS38OtCEjcsN0tKlziDfKiqj5cS8v8skGJxxEkmzS0FYsveN7CpKuRhSyrlcpRYnW2jWks754iwH4gFmmel84/MweevCd4yMFAsoSwG1jQiSgmfFXOi686kzenaMyb+ye/km/QD/tnokaZc4BLo0ePqzk8qnU6J1U2LFRsspRlnChr2QbKMpSs9QamFao4mptHFqWeiMaoATMsgfkbUl1CYAGufP8vVUt3KHtcgfVXYGaqvTkFlFjiF8hk1yigJhMg5LI12qDgmJUZIPzQcYEtqwN3DDMf68cbw6lQiPYo9geP3WR+CMvWbvvsmoGfPtL1N9GPA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 15:27:07.1224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba771ce-5b79-4ff4-77f9-08deb8169597
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR16MB4058
X-Proofpoint-GUID: eGyx4FYDstEsSsL2jhxq3jHg9ehiu46Z
X-Authority-Analysis: v=2.4 cv=Vp4Txe2n c=1 sm=1 tr=0 ts=6a1075ce cx=c_pps
 a=2EogD3SZGC0twO92opjmhQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=cbNQJ9GKAAAA:8 a=KpvztcgoyaSwxilgUFoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1MyBTYWx0ZWRfX6IB0RZmN8STC
 PyPo4Xt4A4nbvx3o7QB+LmiVsgXMHsUj995mGNEqnRSFmHd8I3CGSviLi850lRLk4IFJ4XBIqeX
 VPoh93Go0PrsYidy75lhCT4nq1hu3IjMuFNUzGkZP2MqqXpQtkZM9fiwy0CGNkXysCBYGHwE+pG
 VvUizfuahe5eifCZJXUkbTwLJEC3xQzuOyHDxWKnxJpBxuao5aDXXG2sihk0gJ0gAWb5GpWh5PP
 j+LN/DLFbfYjPa/5OVLwb738cfRGKiiUsmLQoELwDteBqh76MbW4guP2bmwWxNRMf3yAu8JlPGA
 3hxkdjGQZlhkNCFlML1PZiLLzGA636+FOzeoYci3AO3d5Xy1hkN+DbpWb+gQF3lrR3a8myXuKH+
 hxz0cD5zNkR+gLMhP/8KuO+KyLh0c2Bn+247L+wetSizJazSM/MBJ9cq6rBX+jPU4yFsBYFN2qk
 NXky/W2QBCVuKJtrpBw==
X-Proofpoint-ORIG-GUID: eGyx4FYDstEsSsL2jhxq3jHg9ehiu46Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220153
X-purgate-ID: tlsNG-42698a/1779463633-20678F3B-308A0989/0/0
X-purgate-type: clean
X-purgate-size: 1467
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:xakepamatop@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 6ABAC5B6DF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 09:53:18AM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> Thank you for the contribution.
> 
> On Fri, May 22, 2026 at 2:57 AM <dmukhin@ford.com> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Lower the log level of the "connection refused" log line, as it can
> > spam the logs when a dom0 service using the Argo hypercall tries to
> > communicate with a domain that is still starting up.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  xen/common/argo.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/common/argo.c b/xen/common/argo.c
> > index 28626e00a8cb..4f894470698e 100644
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
> >                                          src_id.domain_id);
> >      if ( !ring_info )
> >      {
> > -        gprintk(XENLOG_ERR,
> > -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> > -                current->domain->domain_id, src_id.domain_id, src_id.aport,
> > -                dst_addr->domain_id, dst_addr->aport);
> > +        argo_dprintk("argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> 
> AFAIU, argo_dprintk() already adds the "argo: " prefix internally.

Thanks!
Will fix this and the follow on patch too.

> 
> Best regards,
> Mykola
> 

