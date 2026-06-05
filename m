Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OQQFMdkPI2rahQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 20:05:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A826764A6F2
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 20:05:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=AFGWVxlK;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="iCO/oPIg";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=XWjEq5E2;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=PsTAuqFD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329902.1593765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVYuQ-0001i1-0i; Fri, 05 Jun 2026 18:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329902.1593765; Fri, 05 Jun 2026 18:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVYuP-0001fD-Tq; Fri, 05 Jun 2026 18:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1329902;
 Fri, 05 Jun 2026 18:04:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVYuM-0001f7-4O
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 18:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVYuK-001zDS-1d
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 20:04:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a230f99-2eae-0a2a0a5409dd-0a2a450bc3ca-10
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 20:04:35 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a230fb2-212f-0a2a450b0019-94a38ff1c148-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 20:04:35 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 655GdtsM2672913
 for <xen-devel@lists.xenproject.org>; Fri, 5 Jun 2026 18:04:34 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4em265rtfj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 18:04:34 +0000 (GMT)
Received: from MN2PR14CA0028.namprd14.prod.outlook.com (2603:10b6:208:23e::33)
 by DM4PR16MB5387.namprd16.prod.outlook.com (2603:10b6:8:185::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 18:04:31 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::3f) by MN2PR14CA0028.outlook.office365.com
 (2603:10b6:208:23e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.10 via Frontend Transport; Fri, 5
 Jun 2026 18:04:31 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 18:04:30 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 655GWGVN913026
 for <xen-devel@lists.xenproject.org>; Fri, 5 Jun 2026 14:04:29 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eggry2eju-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:04:29 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id VYuAwv6Lbpgi7VYuBw0DLy; Fri, 05 Jun 2026 18:04:28 +0000
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
	:references:subject:to; s=ppford; bh=+gXG3e88Uw6zWaw8ucqlkQXZkzn
	itqT4UT/zCyF0dOU=; b=AFGWVxlK3mub6BuGWu2AvmER4sv0A2/LwJJNr2RlkaO
	6tc28UXENsKGJF+0y5kyAfCY8M7nzZ8vGNwILdBM09QDgOnxIV2F1wek1R3K3IZj
	RY97TNxjWLbN6g6m7xTupTKDcQup8Z08SnxJm2v+RfLsqYz7Wll1qRD1GoyNa0U4
	mTzB6et5b6WZ1o30QdVvJIRf8u4tx6hDcJc//s+8Uw+nvty8QQVP9SemcRp2jv24
	AAkeF/za2a8j6awrw1ricjeyB58PCjaZZaqdczwUYDVHBtYBsodFaGvzLCM3695W
	zlHL7ZQyWS4gHBZ6VM1fnSC0VoFnobhAf2XiBnRfHBQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+Ytp39l1DhRVP5pyrMIry17++6K7x8bYhG7TdYZTsaz75FlnqMBc4nQVhTURMMxgCXYwMYjGkFDUEZvUaGST4jHQoJX8XWmft/eVhVu4xQXRdqZFyJcFYfYKf8Y3lxGq6zooPh+33WkSMA0dnacTudW+yfs7WiFQOP82sTakMThMtv7b7PDw/BYLfguzgJ6ldCRHX2ykMYMFd560JtvyBxwjXf9rKMHgnbowFHfHWC0kuOiyJdDOUGC5B8ADxJq+tp8gRK/PtQgLyG56+l1HTCVC1wIKwxGnHQYrHB/jhnVYI5GcPwv22iB/A4ujwl66vaZCTJiJKn+gh+wPfFaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gXG3e88Uw6zWaw8ucqlkQXZkznitqT4UT/zCyF0dOU=;
 b=qW7yrXUlblsjDgcIgaBsu67Uenm5qx2tEJvhMgZMDMJJI3fB8j8cou0j3I/uFK+dUvfOnrHOvq1rbOJO5yukyyoxCsaFlIEWzGD7BbQmih68XVt5KLft1S+3EJBOjw2DrJJ+5UnK4AaSSwgoHurFUdPj/OviWdwnCSDBBDvAi461qX2IPJjUOEd2svLFP5wZb3uQ5TROzo9gBptFOMW1tf8HZ5aeDT2BZRe4Ml/coBEv0vhN27SbaDGaC5JVGPC0SwqeQ6QAUJf9QvIkTijPolwnQ3dXPLdYHbx2O4Pufcb0L+4ZUlZlR4MnKJKzbm6BeGBEuoEgxXGD9aAWYEZk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gXG3e88Uw6zWaw8ucqlkQXZkznitqT4UT/zCyF0dOU=;
 b=iCO/oPIgZ+Gsi2B1T4KxfabduhTKNz8WZ8laHI2lXeTTwXtSdB7SIZA1BmpHxfx25ksv/hlgUCWNGa5qifjVct0UeNl2WPK8MjamdtWKD5NV8j8Q/topsz45IefiOHbri0xDOMT8Eln2byXTmJBL7dTm8Ax5uRdXN6SNIFq/uNM=
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
	 bh=+gXG3e88Uw6zWaw8ucqlkQXZkznitqT4UT/zCyF0dOU=; b=XWjEq5E2A5eq
	3TaZ45AyW7xPzFnLm8GuYqxaHmTgiiFmtwv5cJURFzaIDt913m7vdmFJmXDktwHk
	9ocpsXCEmyGkJ9b9sKlbmNYxYsodrQtmj4WyHOWnbf7z8SAHo04UaxONexLqo0n9
	cgm9iumP8rW2SDDpUo3wzmpFn+lYMQonSFTzvHst4AUf3u7n2bgLOqtDBqAna+1D
	LEbVdo6CoBpSTjiPgemyE8Dmc+c8BaOxi8LULkv+di4w+KMCKlqlYhgDzL2p8JV1
	mMASHt/hLZ+V7GD6KBr8lhLma1GmG3S2FFweIqURjxRSexakuVAG2delow3Q+pS4
	4SJX7tY9dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=+gXG3e88Uw6zWaw8ucql
	kQXZkznitqT4UT/zCyF0dOU=; b=PsTAuqFDx7paBpiROG9eZEVQoDwlFTGwJinP
	RnHLFJ1PCRhJC4DUwF+KtDbGJo9Hug1WMmHTlNae4Xip/MNsLsq0EZRYD3AooD39
	s1xQ4tEJF2/5rL1lhmRgjl7VvwfFjYkoF8jom/KPwTC1e/yYUhw0q1uFm3jq+eut
	NmiKCeVXqCoxfAqhVWlVOnRPiocwFXNk2y7j7zQayV3aXDnREPraILm+96s4BTj3
	DBBR2HOZrD3eoZDLhm979u9bWUI4v1EP+u2pntvxFF3rmSQ4iN4jSk6/YQWxa8Qs
	BaxzpSBAD+alHP7auaImdBbEEHygXbzQ5oRkjSVGxJP4eXafMg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VYuAwv6Lbpgi7VYuBw0DLy
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 5 Jun 2026 11:04:26 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Michal Orzel <michal.orzel@amd.com>,
        Doug Goldstein <cardoe@cardoe.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 0/6] CI: Update distros for build tests
Message-ID: <aiMPqmCphM3RW8ol@kraken>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050178
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|DM4PR16MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d08cbc2-a836-4e69-f66a-08dec32ce445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0/FbI3cbNIEG8rG+zYYr3P7jERqzjk+qPAZKInyitF/LfDGMrDGip/x5Oi44GR+senthlIjzXGx7jwcieHye/C6LNeBIl2VXYf7UCMkic+NNNi8g2vS0vnOGq/Mkn81gtiWUXP475fpkLrcH4ahkF7tpGl9tZprNCc1pVaBY/A4ZTnyUGPTiYJFwb7jOGD8HCqrBglg/3HbqwcOtBwBP3tl0rfKxiupu+z/4l6EL+by0s0CwQsXRbJga4NsD2J3Sow/CpFPE8nemxUww+RPXkdFhWLRC8KlU/MPyP/wwpctr0TUL6UMMGE+CArkUHpw+mw1PjRmenqCn2Oiiy7C9zRIPb+Uc6ZAs9ThmiCAQxH4jFN4QpipXkgrU7l59X9/sGDum2ZCy9DdS9yt1lFkXtrKqckBUxE/bGCkmEpFuaS0eyMj+764dLOJdPtVXH0zoozrJQfIHtVKdX0bq2OTrZOGjYiNpVwaS4SwYCSHSOD0OJcZwuaAqV+Vu5PesUuVMS4iDyMnqkpslOfpadoXHB+rCRcvxyvXqrDKit7yyPPir2Nu9XXK8haWkrfw1CvOAANrUSc734MIeJg1DvH9i38f+htE24pSKzWCUM+524x5bIrhBhi1RhqE4lhM81KjWqP0QAnrfZR5td8+Sz4l+0z5qORzrQBVSoP3C3v+BKvMJIFKzxozIhSX2nRc8hZum3uv0xyqy5i1/qTn701mbOJ3mDIeliSi6QzSbk4FmtB7e4Sv7GD0LbixhDkSosxka
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fe7bwl0skHGhglMKSMlAApLrITK5HNlv+57JFxjlujOeExRhv83yyrjWvXIhUeG76rYts4mnl/7TYzKOXyhiyplxpjRrerqrpYEiy6k6Tyz8+cJuGNkIO14aOnStZpwbA4M8S0vFgYis9rR/J9cft0R1fI7036tZ9KA60Dq/pV+NCbzWQqUkMIZdCe6bW0lcLtVGnsql148zgp8nlgSdtolIum/dxELId0cpFX/OoPEoYnXCLsFeVQ+idLhtdRPCSQtEz5YcXQGvoUm/Qs1r5kyRvFomeXUZ7HPM50fJhzjtB1IPTlKqVJ4rCKdxfbgZRdIwT5IP70xwUufU+ahIBDTNer/isaDpYAdAHFu+pjfv4Yo0H14giyO71AOtPF1qFeTO65VC+lJZ1Fx+2zEh158kIGnIHBEuDqWEy7rPuXNZhTo2WFezNNUPqw+1uoYG
X-Exchange-RoutingPolicyChecked:
	YmKDgI3WZH8AYUqvOXCdz+49J6jGa4PnBYFtYpDiHje3E0h/joCB/KrgaEKg3+3R/lldxE+fy9wVdQpKfluaTiE7n4kvmMizkPaCg+oFcrFUIzZkqmkTVsF0zM/U7LRyDQWZaNXAzI/6C5KlZQKuFnDfbnQOZNmfmwAD9rdrGtRN7y4SfDJeFB1lxZmihHL7fzUeVUZHMBbRiyFcutROUCQKoSwLOi4nwI4/aE/SEcjdVs0oQ2dWMwskxuh7MYH+6QIWZqCbXC/q/GndIrIjfYaBJOGCiUczGAV9EmR7Q0kTBrYC3hcIAovBpr9ntVdIh8abwmX8v4V5THs/0aEpDQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eHvPICrCm582W2NbKGeFPkP61yKGHln913WVLc0efX71Og2u+zTD1W1BAHkoJmVMGKWMD+7cbX8nala/vrkxbqh5YO0Aqbad1Aevk4cOk0SiSUGmYvdM/OBm/VdLrNE3+GiAni1om/XDcPYG++ok/1ZBTJBP23JacJsvOzPE2TSAt1I9eY85hYoBmSdNIvp4aFhxrLORAPUyKL2GTUNTkPDi77EyTQP8kZp88Uwu8d+k+XyjTBuSa6x31EcLUdD2FzL9TQs618AC6KZ6ou511D+t/v6YiivkTcUwrmhJVnKsL/CP0nwypAOt2bn+lyGxSOQFWX1mj9YzqlrFyv5hX3drxP0O6lKScAsu+nqhmR0GPmnFc1MznS6x53O1pIV4HukWCYD2Y2aatbAJnzYHOjCDgB9zILRS+B49LqyzkROjVSRUn8005Mlc5uGigeWLYEJWngyNFe97Iv12gZq8S0NBHCgLSx3G6fbQDOIidDT/Dp25m5wf+p6Z3JnQxOL/fUSKjF023We9qKtNCLeYZ5CXak+2h9EuPfnrnhLV8BcOpCVT33cJukYazP5E9t2kdUXjXTYNz1w4BU1/+v8bP9OEekza0UoZNKvMXK7kfSXB0G5qMubsFtVxI8hI/VD7
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:04:30.5594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d08cbc2-a836-4e69-f66a-08dec32ce445
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR16MB5387
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a230fb2 cx=c_pps
 a=yinnKzpnBJ+MbdtTFrOrGg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22
 a=p0WdMEafAAAA:8 a=cbNQJ9GKAAAA:8 a=jHmAWONDw_5HHNalCEkA:9 a=CjuIK1q_8ugA:10
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: 7QPdFiRU8169EXYHF-0LX0SepJaE4k3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE3OCBTYWx0ZWRfX+LARozbVwEu7
 BqkDgLe99qkKXftY5maKWj/cVLsziwFjNFuTKaMlvRpC+JI9FBx8XeVS7bEu3HguHPi+x87spf7
 wNA8I+McPXuaXuwnf/VKy5AqylpF0yB7xOrVcAj0/ccpPNLsnZdUDVywzorUQYGvKbbL9BV8atI
 uthv+eaaJ1Y6nJorKDa+fAfUBOjNiP/E1T/ym0udXg6CV0YJ+ArbLT5b1pVOyvAOckkw186fmXF
 oLA/YotaWRia33xHp9hCVCajHFd5DbsA4C6Skaf5pHNoASebK+ZtrEPEofpaB1LB+JNGce2+ymx
 /PjI2skdBC5nbt5O7eBObAVMdCROTxqErvbBz3xiKVAd5kDiS4NnTnXEUMeNHhCjmlxMVjmnvH1
 xcKuldWn/DJjcepeQjalZx7G+MDh8P1OCCLTd+3kiFUqDuPwJ+59QKxGeE5v1f/CGnIr20F8kzt
 BtAAeAqVcF0L4k9ux8w==
X-Proofpoint-GUID: 7QPdFiRU8169EXYHF-0LX0SepJaE4k3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050178
X-purgate-ID: tlsNG-42698a/1780682675-1976AF3B-538C7F8F/0/0
X-purgate-type: clean
X-purgate-size: 1751
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,kernel.org,amd.com,cardoe.com,citrix.com,suse.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:url,ford.com:dkim,ford.com:from_mime,ford.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A826764A6F2

On Fri, Jun 05, 2026 at 03:42:07PM +0100, Andrew Cooper wrote:
> Refresh which distros we do build testing with
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2579549654
> 
> Andrew Cooper (6):
>   CI: Drop test-artefacts/Makefile
>   CI: Swap ocaml-nox for ocaml in newer Debian/Ubuntu
>   CI: Drop Ubuntu 16.04
>   CI: Add Ubuntu 26.04
>   CI: Update Fedora to 43
>   CI: Update Opensuse 15.6 to 16.0

Please consider:

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

for the entire series.

> 
>  automation/build/debian/12-arm64v8.dockerfile |  2 +-
>  automation/build/debian/12-x86_32.dockerfile  |  2 +-
>  automation/build/debian/12-x86_64.dockerfile  |  2 +-
>  automation/build/debian/13-arm64v8.dockerfile |  2 +-
>  automation/build/debian/13-x86_32.dockerfile  |  2 +-
>  automation/build/debian/13-x86_64.dockerfile  |  2 +-
>  ...x86_64.dockerfile => 43-x86_64.dockerfile} |  4 +-
>  ...dockerfile => leap-16.0-x86_64.dockerfile} | 16 ++----
>  .../build/ubuntu/22.04-x86_64.dockerfile      |  2 +-
>  .../build/ubuntu/24.04-x86_64.dockerfile      |  2 +-
>  ..._64.dockerfile => 26.04-x86_64.dockerfile} | 15 ++++-
>  automation/gitlab-ci/build.yaml               | 57 ++++++++++---------
>  automation/tests-artifacts/Makefile           | 19 -------
>  13 files changed, 59 insertions(+), 68 deletions(-)
>  rename automation/build/fedora/{41-x86_64.dockerfile => 43-x86_64.dockerfile} (95%)
>  rename automation/build/opensuse/{leap-15.6-x86_64.dockerfile => leap-16.0-x86_64.dockerfile} (84%)
>  rename automation/build/ubuntu/{16.04-x86_64.dockerfile => 26.04-x86_64.dockerfile} (81%)
>  delete mode 100644 automation/tests-artifacts/Makefile
> 
> -- 
> 2.39.5
> 
> 

