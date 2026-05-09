Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aea1IraG/mnTsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E094FD280
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304389.1577446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0n-0005uU-K1; Sat, 09 May 2026 00:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304389.1577446; Sat, 09 May 2026 00:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0n-0005sm-FM; Sat, 09 May 2026 00:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1304389;
 Sat, 09 May 2026 00:57:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLW0l-0005Sn-Ej
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 00:57:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLW0k-000YE8-Rb
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 02:57:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe85dd-e002-0a2a0a5209dd-0a2a450cbf7a-44
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:41 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8683-62f1-0a2a450c0019-94a39217d3c8-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:41 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648JTU96704811
 for <xen-devel@lists.xenproject.org>; Sat, 9 May 2026 00:57:39 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4e1fcnpf67-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:57:39 +0000 (GMT)
Received: from MN2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:208:23e::19)
 by SA1PR16MB5690.namprd16.prod.outlook.com (2603:10b6:806:3d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 00:57:34 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::67) by MN2PR14CA0014.outlook.office365.com
 (2603:10b6:208:23e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Sat,
 9 May 2026 00:57:34 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Sat, 9 May 2026 00:57:34 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648KjUhP4003054
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 20:57:33 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e1j94rstd-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 20:57:33 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id LW0YwZiQTCO1sLW0ZwwDBo; Sat, 09 May 2026 00:57:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=Fd/
	cvDA7hUY/F2AucVo92dmDuZ0icoSx7MoWE0cO4vQ=; b=IaWti8CPMQI+PD5vswJ
	59fItcgkmx6WCp88zOFKMQFrehQ3ee31yIiGC6Qu1iS2n1xF+sBBcqNPP65a8Pxa
	l7R6lN2xLncal+PPiidCPanw/15RgnvNkkMoZhL/D1aRqZK0jOr5gx7pY5HxaYUN
	TNAyRJO/hmOl2YxSH/OFsSwgbWe6PvKXM2RdY12e7e8PYoJvmp5VSdDsSf+ELsT/
	C8cX8ZvXFRDt8/+XvIXlk6ph84ALfO9GH1DiXoXCiHdBlNQgfkmZnzR6a7UY9VrY
	atrQasyMFjGXlSUNX4R8arV1JXf4zFADmAy9z8MRxjHyefiDLHCfIiFG2HbuA7WQ
	CWA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uALeyOANVEKTdw5OCx+rorWo80ToRKtAq8OskWajJtNHIUVjn2fP+CUTkTVqpsS9aS4MFW2AQpy97P/nax39fe96jD8ljKb1Jt6JzFDu7PJtEc5CEw5+uKEfV/CeNqTS+TB6dyp9TrnspUu+taa0MFTGjVKLmiXT9cR6Y/eS8RRWCuuuMJNSSXQAhva5GBFrymjbMyNv/324EGM0TABS6xOChwOenYgykQ+nnGh8e2W5E8lMynEisZxqErrqkR1vpITjPpd6X1eNILUtpRPuA319llbHElZAHVqUdIrcrgYpOvBUL0VCsEQ3oQF/26sI8hk85IdBscXsy5KvwX2H7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd/cvDA7hUY/F2AucVo92dmDuZ0icoSx7MoWE0cO4vQ=;
 b=UmmYFwGIoCSfjn/nV/N42+rLxsYgjDB/JHBBVZ1qjvsexKrdbLe6Ca4LuQErGjgWwY/oYQAhoBEldYZIJaaSVZSgavKktE8XaAF6nrKVMKUZwW1l1Gvu4Q5L4dkt1n8MUA2zRVctY8+dgIJYuVZ025ZgFcmBZxtV3eDjXbQnH/GIDAoXjAxrvG4I/Of3b8n2W/cxushPVsYxDWviMoEBld6aIzawFLUxdK1KBKeFycEZsdrBHpKXGXpFyBZTN46nLvfnkT1k68cnY3ZVDrYaVzPjYA4S6lsmEhqmfA6U/64iJ88j09xJLC7k5woiJGtdls0V0BpdNBkdayAIrLO3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd/cvDA7hUY/F2AucVo92dmDuZ0icoSx7MoWE0cO4vQ=;
 b=NR5+w2Ikafv+RENuAy27QhKiXd5rkHwxiw8aXIPgQHi6cJ9uUxIU49vLgWoedApuqxR9WZp/Jl2zGUGFslai8hIyLe36U86pXriPc7yXxLmu/wHsj8Vo8oXgdCo/Fud4yhD+GoM6nxTbAwiwx3m6jg2ZPIY8rKWroLzRalsgatY=
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
	ppserprodsaar; bh=Fd/cvDA7hUY/F2AucVo92dmDuZ0icoSx7MoWE0cO4vQ=; b=
	dX8KbPfrhPBbSQaidxewQyXtMd3IJDnWdMZ+5p8cO8qmyTB0NhZrjG2E3IT01PYE
	+VnoaSaKp6AUUyOPaaCYou3guzgZ+Kro4m7as4aad0F1Z9OUJ0Poa3sF9L3khrqO
	d4z3WhzXbY3P8P/8boKGsClwy55PgA6SSRfNcHyD0ZxDnZmcvvvMBeNtiGGTDG8X
	jesBCZebuyko+nhmIEHYizdAD9dbBxBe8flDAEHTHiaYnYC4OVhI9AlKkxiCh+cG
	50FE5eeysGBe9sw670MuvJzH6jP55nks5CUijRi0YngK0TphH/6WpfhpIL2YhiZs
	MYqti/nzv7sQit/k3OvngQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Fd/cvDA
	7hUY/F2AucVo92dmDuZ0icoSx7MoWE0cO4vQ=; b=Y+qHoetsSxI8dymg6iX/Wtd
	CJU9DDBmUxvQaKkTuDEJIJn6ZWgKU7MYjt873PBJhekhlcsPSUF7Wp19yCkxL3qj
	lSsYZZjj7IHx3VOYZ9graVzBB4/ZbPLPEYv8bh0rjjtJLWoDp02nIhGKQ3WTIwB6
	YcU/B5wdAKYrdyjvsi8oYlIeskFVs3WvCjN8Yob0gAmSFBERtj5FN8/u6NLoNM+I
	Ns50Nv2eVjeYgHEAL6OUqIeRXvmKqg/xFnhDlOfnZP1XhvgvNvTt5Q8ah7jmfOkn
	ZE0IS/ayAc8FZPEWuOTsBb138MtjFpSzP4+RLk4ziufVGkl1jyabfd2DsD11qHQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LW0YwZiQTCO1sLW0ZwwDBo
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v6 1/4] xen/console: make console buffer size configurable
Date: Fri,  8 May 2026 17:57:11 -0700
Message-ID: <20260509005714.892018-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509005714.892018-1-dmukhin@ford.com>
References: <20260509005714.892018-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090007
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SA1PR16MB5690:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e3d308b-5413-4296-641b-08dead65f4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|13003099007|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	G4HFFHdRKbsOTsSOOk8tPF/fbtOhXQVFmsTxH7pOiJmI4UolzSgRyUejNY+PK/6At6mNgqQSRvg6DGEXpva6/0OIxG3wyqeo/mQ5VTaHNLKWVLgo51CTbTrdlDYYC1I7xr+02Hep1uZbyiH0M9Pt7ayljHLWLB0FurHa17n92Fr1lRxB8Vdfu3V3i64MKwIGsMf6qxSv0TXzrfzScoUP4zLZgbVy/InpwXazSVv/D/6Bni60mOe33lxWSX57LofmTfEZKCHJKdk1WQPMsJjDIS6HcvyUOZXVcOIJZwUTEPxj+QXgCzhwJscgP3DfcnuD43xN9H29AT5ePp9k9hM6AWlfV+MnAKVCX63kmoLYF91ZYZUbATTXtga5o49T5DrNXiSnJgAVbsOIagvIG3Qt2ePQEDz3dqB9lKdLutrHULDQndr/rsMQSnNdtibieZCjnepx0VUj+eAc3yYkEEmPwIZoxaUbwJqdzlfiHcsVU+HLQ5IotKYJXVlL3IYpzf6hgfFuWxPRiV0bQ5v3FNcavouGKWjwR7E6bgRES859Rdf1hf8gazBzKVXbk/3Pwh3WV6t+bX/0P/9VzmRXh3isIKtT3exWpMMv11jDKWU7sxcZQBlg+MtX1/9/VWqOU2MevK+DtmvPqpTkXaSxYEmS54rnudAybw2q9f4oNcumtqJc5dmFLIdc0Tg0MbUuV7tfG5ZnrGQIquXX7Sz1cahvdWYSmw4sxHOGkZrqr5NqSNs=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kds82okT0lXpjEk2Hox0Y6TqSfGmGq/Yd8RXQ+R01rSYyTlOqddNj19k0bgA1mP8IHVl+n0Ck20dnQ5RA//7sWItKhsB1OYHl6A6I4hrZAFflBHxiUbZcqsgEfKjyDohUBFYoG4WJjSTc1n+GxBWS6gJgU+za4OBWoZuwzsfJ8MzjJf2gbI0HCFUOjxS0hGV3o4Xn6SKZnGa4J4ivb/cxdC3jfuPznX11MjNgv0rJl4svw0LzDNl1tdfSujhSaide/zz8FIGOiDvm1Y/xrpPTrtJIJsUErGbeQRrH0FjpEXKTbpXbGNQ2de9eJl5SMpAOzRGYZJS9NN/yMy2yw1fBdAW+pjlQJ7yTPhEG1GMI9iw92oAYGcv4ijDzNMXGjCg8pB9QwC9rNolyhTlOvMN2RAP1W6H5V0xjct3Rj+Yn0HT7isZszxq7onbqyCILAGm
X-Exchange-RoutingPolicyChecked:
	Ii0JXc1hCoDzZfYCSsgcO/whuTau8Zvsyv1HDkZkDrFARaHkWk6uLAfJj0SpmzQaI1SjJXeYyXc99X4bKP/32vicvjZv+wEc2JRg9Y/LIECmBH7CKgTymY0KC2A0Jpb10sd5j1iTUoeYVnvaLVHIhtzDHVRGQo15LysvM+JiYDUuHAAi4zLeHFN3zeKL8PlS8RQkpWISQGLr0Xdl0Z8H1zuustH/nWvkeuBQSSzS5xze5Jq01xR5EbmwAf2sS3rlSAIBmYcK3AtepuFXvtX+DE7/JoZ1Yd+qqThruoP33hwzKIPV5aekysYnZY6M0T//YT0+dEscLuMyLeEhA/nEeQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uuNI3U8jGRz0nk6lX3ZzPHUYPlT+6l1JZhHuexdtdZ4ExWlT/aZocv+HvslM4eKpoQKym/8RRhe0L8skIXsfO19OZhlFb1QGHRooC1p2NQPlfMsMOcsxnyzFwygNQNir4XGRTJtnUrdgfELUI9FqgjDaSAbcZd53U12Ootb5XyQiTDMip3boOCTDJzufy0Y9G+nfN4k6gs4AfU6ye+WgG1bTQz4QQAJERrkGCBwIzGLqcyqQbcdakNHBpW3lkJ7nkr7LE4KZg1yN9IEuoAXoEIEOiRCNaF1Td9AQ+Lf0+rRB3107aRJ2Lq7+4QXTIk7hYJmdlN8bl0LSgOnqa9BSyRD47Caltfqsy1Oau/jsKhs28g/ew1Idtp30zeCjWYyt/97JnH3BYDD8RZk+msav+KbFA4VTon7iyPl5aZfhSNT+vizK6KyOyBCl2rFyAQnVkmrMpEbrAAXBLW9QWmdNizyFECgby8JnC3+hwH4iyP4FWkpS/11M0XkvUqxC3R6oKm0EodJ0DTIpuEVtqoc18nFwi9irfsLdh/S3L/snkurM9j6Bju6wW+cDyyUJKFIyUjLm7UOJXx9Z534gQoLaE55MHZKweDEjPIW/st1zbdM5TzqA4TC6gDvGtkLjuqVP5x70tSXq7Al2gUba52nuLQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 00:57:34.2622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3d308b-5413-4296-641b-08dead65f4eb
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5690
X-Authority-Analysis: v=2.4 cv=e+s2j6p/ c=1 sm=1 tr=0 ts=69fe8683 cx=c_pps
 a=+HTpKnCyMzx6Y2VIV8u7NA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=zd2uoN0lAAAA:8 a=-724Dj084dJivNeTSg4A:9
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAwNyBTYWx0ZWRfXxa3M69hwulQN
 fM5h9UcgYteuSOf6s6h2b2Ag1etgf2acKRAzSLgRGHfpndZSDpVYIRJv4KnAm3atNYYX49z3rK5
 3SjtHr+4LCSO1wlrACyvAdKIR8XfO5YgsGbEqAlud2H7AxIhFbzIwTpg2IUqQxJ7BWXQM7NHOG1
 /yfxVQ233If0FO3csNEP6KTmmgQ/iLAUA/SpDaFRAL05aCcgSyKb+MD1fODQt9oqAVM2AUVBNse
 qYx5p2CtCXN26+TX+TzKjxCvhY6/GXF2MFJzaI5toFbt7Si2sZ31HFwnovdmQQGLMKkxcuh3Vyo
 gaMRhqdONCBsu1Gvu35HiWPlhfU3N/DDiRlG6D1A4FUUfvnQ1Gz/sKvdqcH2ksV9R064meHgUgR
 plKvnmNTforGgbk+AL3RVM8fLHJz9UYneI6DTiwTglGbVi3+14goHlaMPO+mTcBMhrXT1x2dCn2
 gNyKoxeOHpDzKzVY2hg==
X-Proofpoint-ORIG-GUID: K2vXNp7tyxJwT0fZCoPGk7vr7JiqexvW
X-Proofpoint-GUID: K2vXNp7tyxJwT0fZCoPGk7vr7JiqexvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090007
X-purgate-ID: tlsNG-d25034/1778288261-E2577CF5-1BD4C89F/0/0
X-purgate-type: clean
X-purgate-size: 3089
X-Rspamd-Queue-Id: 77E094FD280
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,ford.com:email,ford.com:mid,ford.com:dkim]
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer size
as a power of 2.

The supported range is [14..27] -> [16KiB..128MiB].

Set default to 15 (32 KiB).

Resolves: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- shortened the Kconfig option description
- kept Jason's R-b since the change is minimal - just dropping
  few lines from the Kconfig description
---
 docs/misc/xen-command-line.pandoc |  5 +++--
 xen/drivers/char/Kconfig          | 15 +++++++++++++++
 xen/drivers/char/console.c        |  6 +++---
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6c77129732bf..29393631d885 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -425,10 +425,11 @@ The following are examples of correct specifications:
 ### conring_size
 > `= <size>`
 
-> Default: `conring_size=16k`
-
 Specify the size of the console ring buffer.
 
+The default console ring buffer size is selected at build time via
+CONFIG_CONRING_SHIFT setting.
+
 ### console
 > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
 
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 8e49a52c735b..11f48415c12a 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -95,6 +95,21 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_SHIFT
+	int "Console ring buffer size (power of 2)"
+	range 14 27
+	default 15
+	help
+	  Select the boot console ring buffer size as a power of 2.
+	  Run-time console ring buffer size is the same as the boot console ring
+	  buffer size, unless overridden via 'conring_size=' boot parameter.
+
+	    27 => 128 MiB
+	    26 =>  64 MiB
+	    ...
+	    15 =>  32 KiB (default)
+	    14 =>  16 KiB
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index bcd6d261491b..522b2f489a53 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -339,12 +339,12 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  * ********************************************************
  */
 
-/* conring_size: allows a larger console ring than default (16kB). */
+/* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
 static uint32_t __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+#define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
+#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;
-- 
2.54.0


