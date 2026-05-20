Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ1BLhQfDWoutgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 04:40:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F04586E53
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 04:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313494.1583596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPWqT-00073S-00; Wed, 20 May 2026 02:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313494.1583596; Wed, 20 May 2026 02:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPWqS-00070p-SR; Wed, 20 May 2026 02:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1313494;
 Wed, 20 May 2026 02:39:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPWqQ-00070j-Mj
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 02:39:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPWqP-00FI5t-IB
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 04:39:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d1ed3-e002-0a2a0a5209dd-0a2a45069578-36
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 04:39:37 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d1ee6-7371-0a2a45060019-94a3921782da-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 04:39:35 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64JKYe201935696
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:39:33 -0700
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013040.outbound.protection.outlook.com
 [40.107.201.40])
 by m0482516.ppops.net (PPS) with ESMTPS id 4e8y11j04t-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:39:33 -0700 (PDT)
Received: from CH2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:610:54::40)
 by CO6PR16MB4276.namprd16.prod.outlook.com (2603:10b6:303:b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 02:39:30 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::e2) by CH2PR11CA0030.outlook.office365.com
 (2603:10b6:610:54::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 20 May 2026 02:39:30 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 02:39:29 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K1cdjB2375703
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 22:39:28 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e79ewudh5-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 22:39:28 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id PWqDwURNYxj2GPWqEwIsiK; Wed, 20 May 2026 02:39:28 +0000
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
	:references:subject:to; s=ppford; bh=sS8YO9iyUSJc9im7EGYhEGbzfW3
	F9UgOtrWpPPBKMO4=; b=UBo/bXqfTUadIA/FcP+ZuzY8TR5SYaIGMq6UXyz3Z0q
	Vo1gS4K83tvTXCYhvmxIaC7X/hHRez4NlMlat/XM0hk+MMV0IsbfYgBiJYZ5jB2D
	zvqUsjG8cyoTlBGEOZ5A9MSsz7LIXnP5tEBFDHpZJu3FvoaPaIPzS9EzDnqcch57
	9+Rsn4zoDOYhD92uPrLSPyFV+vooqAZZdCK9iworyWDgOpmknnCj6Rre0IizuKrc
	OBpgPnP5ANBccly/Nte2306oLzE6KqqWk07SU/+Xs3vP0sLwzTXFwzPMgNho7g3x
	Ipy3mkEHOS0u0UY4VCEtHGuk69aEIVWRQVK06TFqNTg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiFC+j54HFn6juJkdFtIE0vIHbZ6TrRm+H+s502bb0Dvaerz5LOeeMOY5+wjZxrYQBMM/uySfmCeOJ+y0Tn6u2O3BIWwn41tRanmtjKwgPIkJwOxce+wB6FofRi5zkWWrBzSLC3XrGmFnhLmu1qDg2RlaUDQM2fPOEFOPP2mVTh41pmeuZ8+RlDOFyRjS19D5zuO9v6oZni3MjGofUyVaW7WWupVZQyqRxwZRF3opyGzHv+zjM9ES8Uo8yXv8lXV7eJ0MG4FPuz0TDCbTqO1KZyItdYky/3KVKeYgmCioMwVKz5jewxvXKx9aOuh5k9aqwNwLlS2QOuARUxapwIszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS8YO9iyUSJc9im7EGYhEGbzfW3F9UgOtrWpPPBKMO4=;
 b=w5d6PbD/xOgDvMNjeiUs6WyA/Vh+vTLjSqI6nHM2jMVWlnXI3C0Ql/4im65+W/JgthnezIF1BsFAULMumE2ZgjaGr3fkVd4bsj18GYh5E+xQs2g1Q2qOYCN4nkwt2YIk41WcyLFVNMq2eh+KN6hz3TV+R+6ULKZ7qq+S1dNcPBN6yulPNsKY/OjppQ06NozPm+KNC7HTku/fLdvAXvpNAgIPEwI++Muu+twWfhtkRM6fgfSf/2Zl+uJX2ln6HOWL6HYaVEtZz+4CyOP0KoZ/bys3IeNVLsF+FxmxnRCitlmfopJMkWqtqd9VzUFCZdu758n0wBqGwiIc4IwjEz/KOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS8YO9iyUSJc9im7EGYhEGbzfW3F9UgOtrWpPPBKMO4=;
 b=bpYhLNUobZ/0kBMoyON5ZE4I9T0ushS+lf/dQ/AtPQHqQe/xjxu9WZCyvZV+7zcuHnETE07mx48RgnNSrIq/bKqoIAUIePendWcyamI0oVAg9Tewz3cSNu9r0gtFio4wj042naUkrHmfHrOVTwmJ4HpOZw67J9mVdnLuT6dW478=
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
	 bh=sS8YO9iyUSJc9im7EGYhEGbzfW3F9UgOtrWpPPBKMO4=; b=oPB3OWShHjIb
	j7SytTrsOFDN2UjApJQwb38kUHciWQ05Cm/xn08C1NBudYPUaLs3Vg+QfL2W1kiD
	pRMLkOMmltCR0KL3DkNWEnAb0+sYeNo9TZJrdPaj2U1HVm1gCulD33PGATyBj3dJ
	JKBVd/xKBB/AsOr50UioFGbeMfnZ8D9SL4Fi3E1FitMIlsXWEA/NlWBw14Az7qi+
	csdfT4qVNmUBZ7vgYMJVYta1uM8vD7ho/1RMtAcMht6E80T62++oqOIoNnwxjzRE
	o8mDZkOn+sRuPd16V2ro2AsC9FC19mcX8iXvqClCZYvBLDomwcHjZH6hnYCvijHV
	AwFVeo41Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=sS8YO9iyUSJc9im7EGYh
	EGbzfW3F9UgOtrWpPPBKMO4=; b=KhyWVyetfnfVD1r/5sqe6qa8Bvhs5guFLEY5
	Cq4V7mkLqVyvRsHBvsLG2PjZrT1BK9O46Rs1UHnBeN6A3lFmmp45lW6feae+f1HJ
	WimxWVL1lLqLItBXLE0mptbOd5/sMzTbyuncKNyumuXgNX30PPyd/Lgl/19GFI/B
	JfiSFt85PUzqhyTewtLo3alKKImqng9+R/nKfO6oNmHXGeFq9Zknz9IUCFc6wcyb
	c8q6jd27aG765ymyxmzUT+udsfEQKlssaCu4oSPVX6vZP/hJnkSPlKI7sd/SeVf+
	nhAglObC0NfOjciMRNY3bGKTO3zBHstD3/a+EUhPSUTLcISBFw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PWqDwURNYxj2GPWqEwIsiK
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 19 May 2026 19:39:25 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] pci: Introduce parse_pci_sbdf{_seg}()
Message-ID: <ag0e3ZgNDQN9A6Vn@kraken>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117760.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1779117760.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200023
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|CO6PR16MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 89890542-5494-4523-8b24-08deb619045d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|4143699003|22082099003|18002099003|56012099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	3cynHu14FnE2nlA13EPCxhukuKP2s1Cb4agq3eQrsdYaAbFL1g/g8SU6l1Kq3dvQBQ0Rh2bT4tad5luY89/3FAi51YV1rn0iz+PobnnmFBTw+tKUmTENyb6Zou6NaMMrVqjUjYUpe3493pXWKSdsw687mLrhXS1Ut4PilD1sEOoImVafhg4W2ZIOgIqMnHyd0h+NYU3YJJHu10pblQLCnH82rHGsWM2Y7ve1s0D6Ej9KygYMtmezbIcd8FDyCtiCihlyqZEHI8zGTVErGsuJY3/wPpb8do7E67lITGhfWsaMxF4Jdn/4V09mg6QbSYj+coUCOfa+JW/XHapb0Ph1hTzHJisRc4Txg0AuTafhojbub6Pb3M2MzuXFU7rZ7/jFsMWw5h9z3NoZzit5aqfa3x04PTIjWbWp98xd+o0moP33pYeFWCyNGJqNNantmXNV0wLn961fmYAbHxtcl8QV5W7QlDmEKQ7g9tuIHcqkHU0zGVJNMhXZteNrVWQaTxjPonqaLjVXJRU9sNYRW4Ux/kxEscHS+sLq3T9bR7I1ajsgHX8nkY6D3eRML5jRIXWbGw6LFnK+ih1zRV3e4h3Pgeyp7slVVkfYlxcZ5Dk1/0ybDUGxwpn3CzonvC2tJ3PWHlRzJaB9VPjvZtRCi3rv8k4Vke5F/USt0LfUvjfMaET3uCwruUo+n4waLdVfjjgA
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(4143699003)(22082099003)(18002099003)(56012099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xuuOgrFqfm4GWWJt1r7AylPKJVU3/igftNwJv+syeLQIqaDqLakDsFs6FHNWNWl5+wyF24Iu9bAT5AVcxm/zrPa09ZneLYzrM/tb/NWltkEkswB2vdy6ufcCPhEIBLFzCFxRTalmAnDm5fmSeG0rpT+kaey0Gr+J+myVoHDXqqj6gnD3wKEDer/l8TrhVEFU7EV85wg/jlHOR4aJ9IOU9TdF3fhwbAOLFsPXzH9tWfJIF8pT6FhYwYnB937BdmL06ZrYWScLw9YQH3d2z/CV65ApYzcZlsYVTwDTPIS6pwgWYuwsdnHn+xD6djEzy1aREZxQZhiI5n9pPPcsk6iFHs5J/J0HyH58N3NudZPKABLD11OJewiJvILgEvwF7QRCn67qWQT79EyrcYIoW5qwETQCDUPujpKVqbYXZcWd74q3oo4TzAPw0BGWWmQpfE/r
X-Exchange-RoutingPolicyChecked:
	nDTKs5gcJ52KgJ1x+6yP16vsHDWfzjozDCJgW8wODA2tmScHXq0lJFUkBTwWadYuINygdRcbLzhkFUymaXi9zagGanzxXaiD/GZeVE1UwZDbflgG4n74A6JU3zKqqVeZ5Gfb4r2cCXCXaopdug8punQcK4sMm+qEyPKaa23cnWla9TtMscvU2S6wmC2Ta8RoBnGAaS80yuTk/Oes1KKR62M5kP2VIoiUOI1WXk8nTEoE95JpMhYVyDSSK2HSJ3CkRLottQxL4/jmWOee2uZp6t8PhkILDNSWX8eW8A85qoKUhrYrWzICJtQ1b/oZ2YwTYCEU8cjJTGcOHl6rA2Swzg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g09iVhlcNe9eqZJwLbqSMvEzAUsjGv29DI89rgpyRmZnrpwuSCI7CrgZVstve11KSd08OmSxOWIT4lQNjJLp61+/nopqDLdfYpbEDSwAkliisyzbujUSJnZLAk22aZve+Zl1aojeSPLSryBt7DY1O6+6KxoIBtOJqvTLy8nn1UvRZc2owGRezvjOeijDIQ5veCuk9rzbyUw+woJY4hs+O9be5Mw4aprnXmliI5jWxn3qkvmqmYr+2Uu382MGThBLZzwdTQhEKssng81AzM8JackDHzbFbyElT1zwQ0l8IVV6p/Tt7fIMPQ22wFOGWZM7DUv2RkJE82YoE5MPcmFDpfXWTZH7nwuRwSZ/0YA0R3+OupgZ773xtUF8UXmiJJOhqUpIL8L8DGyyi17JXgJGgmKft+nv74OCHaeEWpo5Bc4f0xhrX7gQhhlMIl+DI/bEieus1XTnIX9v6jOJjp9dHbuc7YgJZifu2YrJ0D5o/DwPt8MLWg1f5rou4mkFW/ZEhq7IpSDToLziCeD1b7OSAbV90//ZxZQpdoynMBBzzbTWjLoYh4+imJn6zm8aaI74eBkpRJfD09KfxE1lE0ZfDJ6tpOzelWC4MPBf9kzOzOH1iPjW94vPGmCAyUGMRIFbXaXoGZdmKLyuaChSXd7l2Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 02:39:29.4506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89890542-5494-4523-8b24-08deb619045d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4276
X-Authority-Analysis: v=2.4 cv=P54KQCAu c=1 sm=1 tr=0 ts=6a0d1ee5 cx=c_pps
 a=dJs83p8YoJtII+u9Eez95A==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22
 a=-RI0ju8yAAAA:8 a=VKiVTJu5s6f4S1AJKYMA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22 a=UsJdYLK5l2RqpxBViBoK:22
X-Proofpoint-GUID: 7Xd7-XAdfjrGpI8F4avEAwjelrcUfXA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyMyBTYWx0ZWRfX9AWWkqc2UBqd
 QP7qvkrOvIf2IoyThAWdiukrMDvbtN21eAOrq9J6lVloqXkkvmHo66LatpzimQqGaPd49fZCwRn
 PVvEAMws9lf3ixPeJcCB6TUpqtd208NH9R/u789cMq9cOmzjuc6/vJ6+DtZj6YzhExYSQvRAArQ
 JDxejRwFwhhZ9TF9ca8DSyXGiF33HrF7igmcW4iXYy+hCfoxnpuPa98TkfDVvWUbhpjBMZzJbV9
 CIFiRjwLATjFrVTSmOZNu/ugi17N3UYruojhhppucWrAuXBCYaP7dtzyqv8t+/wlqJVUAclUMod
 6OWkUli4McfR4f41spENgqBxPUV4mwjhyPiDh9BoBAiZ5NEFtIVjZMspWdtZDr3JOSpM4aDZfyf
 P/M9+q/yK1pkch2nAkU9uFhn7bvXI9q1F2PtxlFv27dyGSoKIdgdHT/r1CAAzMkome5BPqvanNE
 f5/ks+86EyfHDwKs10A==
X-Proofpoint-ORIG-GUID: 7Xd7-XAdfjrGpI8F4avEAwjelrcUfXA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200023
X-purgate-ID: tlsNG-16d1c6/1779244777-7FB7DD75-230A6908/0/0
X-purgate-type: clean
X-purgate-size: 2442
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 76F04586E53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:21:25PM +0200, Teddy Astie wrote:
> In many places, we're parsing a PCI string into individual parts
> (seg, bus, dev, fn) and then transform it into a pci_sbdf_t using PCI_SBDF
> macro. Rather than converting from parts to pci_sbdf_t and vice versa,
> introduce a new function that parses a PCI string into a pci_sbdf_t structure
> directly.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/pci/pci.c | 18 ++++++++++++++++++
>  xen/include/xen/pci.h |  3 +++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
> index 084be3880c..1d06cb035b 100644
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
>  
>      return s;
>  }
> +
> +const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci(s, &seg, &bus, &dev, &func);

IMO, both parse_pci() and parse_pci_seg() should be merged into
parse_pci_sbdf() and parse_pci_sbdf_seg() at the end of the series,
since there will be no remaining consumers of the old APIs.

What do you think?

> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}
> +
> +const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
> +{
> +    unsigned int seg, bus, dev, func;
> +    const char *out = parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg);
> +
> +    *sbdf = PCI_SBDF(seg, bus, dev, func);
> +    return out;
> +}
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index afb6bbf50d..7bfc59cd75 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -280,6 +280,9 @@ const char *parse_pci_seg(const char *s, unsigned int *seg_p,
>                            unsigned int *bus_p, unsigned int *dev_p,
>                            unsigned int *func_p, bool *def_seg);
>  
> +const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
> +const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg);
> +
>  #define PCI_BAR_VF      (1u << 0)
>  #define PCI_BAR_LAST    (1u << 1)
>  #define PCI_BAR_ROM     (1u << 2)
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

