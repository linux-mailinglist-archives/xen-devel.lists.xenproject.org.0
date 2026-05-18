Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GW5FonFCmpC8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:53:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E956829F
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311616.1581724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsmb-0004w3-G7; Mon, 18 May 2026 07:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311616.1581724; Mon, 18 May 2026 07:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsmb-0004uO-Cx; Mon, 18 May 2026 07:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1311616;
 Mon, 18 May 2026 07:53:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wOsma-0004uI-9w
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:53:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsmZ-00EyT8-M5
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:52:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0ac556-e002-0a2a0a5209dd-0a2a4506eb6e-2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:52:56 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0ac556-7371-0a2a45060019-cddcb120411e-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:52:56 +0200
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64HNJD3J2322921; Mon, 18 May 2026 07:52:21 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6gxwsqtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2026 07:52:21 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 64I7oaGM005686; Mon, 18 May 2026 07:52:20 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013069.outbound.protection.outlook.com
 [40.107.201.69])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4e6f1dv765-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2026 07:52:20 +0000 (GMT)
Received: from BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23)
 by CY8PR10MB6875.namprd10.prod.outlook.com (2603:10b6:930:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 07:52:16 +0000
Received: from BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83]) by BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 07:52:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-oracle-onmicrosoft-com header.d=oracle.onmicrosoft.com header.i="@oracle.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2DYLrisA9YHjHvUtgPqN6/ILH4lyDfLYR9ldEricVTk=; b=
	ALpvJanNJlTAIqjPWx5wrFrfij11PrIrB4DvTkN4EVS6DP5jO7FSVz26NIV0cyph
	AhFs8AMXKSGMieWKKanLMs4IgauDkjS6yv0jFv/YuHtN6gnZtY3d6nHr04ZB2i+t
	UjjCByRJHSRPonxkqgS2zbraIaAG2uIJ81UIvV4QZFIy7tVt9lQFPWj7pJS5lsXt
	gvr/ftSIE6jbNrIHPAs91Nb8UCxRJEo6Ch+Ep/aK59HbS1eIOvd9ctdesfSl2YTa
	HF/lQnppz54TP6miDom6vMGS0Ht3jqVUfOWAud3W6Gw670iKuOkQEha/rcz/KDaB
	uHpmKiUvMZ/xmYJeYXL0kg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Irxan44eqM6YFwtiXELYu2uswYnXajtF2bPhyO8bLjW7io3szfU6HAhkUMxt99fdI4swx2e7hDMsuNWQIYTamjUMlQQyiy2V4AH9juRB5eb4WUlurCNUOyWTW/ZCzecUPIhKl8nL2bav7b7QH4Y/WPqZSkvjmBz2c3+8pflpSY3Cc1PciwXZFxNNXWPW/ElwXLcrh+HBkXu8bCJCpOfXUsqk5I5ge6O1H+Foox9IrlR20ItNLqgcmWqJ7kFSn7feCTFhiCIPHW5RBc59P3EU/PgwjtfQJvewlpdO4dlOg4WJnC4F5WlPxFX9/pXEmqUbZdpdSFvTKqngSWDpJ85s6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DYLrisA9YHjHvUtgPqN6/ILH4lyDfLYR9ldEricVTk=;
 b=JsnYF6uWWyTVBz8wSMPkPgIyOkV9JraT9/JWa6CRvdwUuhFZ39yNUy1pmezug7OcT3tLOicPsvN1WXiUwXH6LVbSX72CcIx30kaVmMToJjVnosQCDj3HLX4HDTHXoC+xZinilcswPBBXWhjaFYtL+4Ak80Chp5PiQUNfz01IS59nKho8k0qytUMfNgoodMOlBKNgQUOUFyS/E4QPDk90lCt/zZFdOWsxC1V+58o5hDpBUd64ecis0rXjGsEhHYUI9uGkDR/RNjBykBJHTac45AvWlbi79kWpcMoJKGRsYSIfC9Ur/kikSa5MonkKApF9IqDkrPU80AdQvbsxFGl3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DYLrisA9YHjHvUtgPqN6/ILH4lyDfLYR9ldEricVTk=;
 b=mYz6gwAyzAcz5ffFMf6J5sWNKqFrB2TSuaESndF72haOL22xcNM9fJ60ypmhyouWoMZx6AoLz9JpmxHet7UbubLbhmWYDo6FEjYaSu4XF+M9CVcGz3SFJyvoiRzKMVu88Z+j+i8ZgK2tB1+TwDxyUxyWReU79sW2eC4f9noEpew=
Message-ID: <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
Date: Mon, 18 May 2026 00:52:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/30] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
References: <20260509224824.3264567-1-dwmw2@infradead.org>
 <20260509224824.3264567-5-dwmw2@infradead.org>
Content-Language: en-US
From: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>, x86@kernel.org,
        Marc Zyngier <maz@kernel.org>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Paul Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        Jack Allister <jalliste@amazon.com>, Joey Gouly <joey.gouly@arm.com>,
        joe.jin@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-kselftest@vger.kernel.org
In-Reply-To: <20260509224824.3264567-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_|CY8PR10MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 488aba30-5ddb-42ca-083e-08deb4b26135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|3023799003|4143699003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8Vg19lPJm9hKzndgfuqY/3b3gFc9xikWjVZ8siJNcGDxO0lSfahYzLEupACnfVCIVnZFPO3QdL2K4M+IhViNMclCrDPmgxXTjEC7ONLSfvDWCqY3jqk8G66uPktxtCU8HWHPui0hcAzr/ffedXvue2Cuvfx/vFUbjTuEjsqDtNHYKagnDC8vPaDnR24e93+SzQi1QV+TT+98mLbFPoySF21qev/LJDGF2i221KFZRptJIowCmN+mFHF0J9HijaOgX/4kXSGW+XUeSEXWL9CaFBovna1hYThIfyh5vN5VbJT8mpORyAe6pLD9mmddU1x+Vp4sHXejEJ7pCVr89oqlCu9fMyx7S9C02u7JmiNqy5+47hLKViOA9ZokLOzKK1bf7j0h3RUNHrZvvVPgcvaYrDmFeugcKim11iviigCqF8VGW89S70EMAYlBAmf0ceMOCGO560bG2wov9QS+g4Oj28qGyKMEG/ep/3uhfxf/V7K8aODZeQY9NMJR5B4jZRpLkYWDkHb0aHsEp9uFDnC0ZUIR3vP9LmyrlZ8cI4kcadPob5IQCOz7Gvb8Hferse50KbadT4R8zWWhdp1QfXzN5DP/YDlSanmSJmsiyIPdb6GLaoFfmNEn/ajNyil8maCXgM+c9A9DFFeZzu/O2JH5oei57CifCTh4/ZNrTD0aUZTD8RrC7bz57nX5eojPjsmM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5109.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(3023799003)(4143699003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHlGVUNneERGQWk5M2NMckVFTCtDSzJGUU5FZVM1OTd0eG9XRFk5K1c1VGVj?=
 =?utf-8?B?SkdYWlNCeHJtdzNueWFKQkFocmFwZ095TmFUNVRKL1pUWG5qKy9lYXJxaUxT?=
 =?utf-8?B?RWd3cm9VWGo3cDZLTk5HWUI0ejhYSlY4Vm5Qa3l1bHpNTHpDU2Q4ejN0ZEtJ?=
 =?utf-8?B?UTk3UXlIeU9saklFYktnM2RXcGZ6VG16U0Z5RHhSTllTektFTndsa1hFai9W?=
 =?utf-8?B?QStXckdNSnVsS0FkbW5vZ3VNQ0FrWXhnR3FhbDRpb3RobFBZdmdlb05MeDdN?=
 =?utf-8?B?RjJjYzUzQWRTWks2Skc2Yk9uVFIwU25NYzZtTjNjTWZTclNQSnlCbldmdVM5?=
 =?utf-8?B?MEZObzBHbHBHT2VMTHNYUkYrbW8rQWNpM3hHOVl1VlhpT2JLeGpJU2hMMVJS?=
 =?utf-8?B?WWtqYUdrYmxLcVVadENXd1pObmFyMGZkM2RtbGtqaUl5ZGlpcVhjK21jZ0R2?=
 =?utf-8?B?dVJKT0dkSG91NEluMzZXVXBKZlB5YzhjeC9xNW5lTC9CeStDSjZBaXN0UzRU?=
 =?utf-8?B?MFpvcjZoMDBxQ2kwRzFvRDJ6TWxtN3BuSDZxeERxbVN3bEJTRFdVUVZCakNW?=
 =?utf-8?B?Y2FEbDJXUlZhRUtTa0FuT1ZXZ2pqSDlMTUhPMEpqWWVSK0lJV1ZGanREVDk1?=
 =?utf-8?B?VEptMXlOSlJOSnFzdC85Qk5odXpLSjUxNFI0SEJDQUdJY3BxbkVpRERIYTRr?=
 =?utf-8?B?dmt0YkJIc2JWMS9nNVp4WXFpWVdDSFJaWGVsVmRRdDY0K3BhM1RQL3FRQWQ3?=
 =?utf-8?B?RzJBVmU4ZU1Vb1REOWQ4RUNnUUpNck9RSzBnR2F1R2pERmVBUzMxUnorVTNj?=
 =?utf-8?B?RStaaHJMMTVaUU5JdFgwZndKYjUxTnZydnphdld3cjhmcWZWVWdQWCtTQ1Rx?=
 =?utf-8?B?d0tTcysrU2x3MHpXeW9jbXQ2Ynd2aGtCeTQvbzFINEhLUUtwbnBtSkY1a2pT?=
 =?utf-8?B?WmxMRGRuV041L0VxSm5OSEgrZDdSeVJrVTRlVzdUNTd3WkFic1dRZkNzdytr?=
 =?utf-8?B?c2lzTmMvRUNLTkdHTk8zYXRKOHExZzlaQ2xuWXNFNUlKRVFSRGU3SFF1M3BI?=
 =?utf-8?B?UFlhYzlMT01UT2M5TEhVVTh0WkYyOXc4bCtGYVZlOEVtZ2JKM0NCWWdNaC9P?=
 =?utf-8?B?WjFNRmhCc0RENHV2Zm1oZm1zRHlVTk5EcDlvVkFoMko5T1JQcW1jSEpuZW1L?=
 =?utf-8?B?SGVjYW11YkhjYVhQUVpwQjAxVC9pYTFUZmVkL0IzTEcxdDBMVFVyM3h1aDFX?=
 =?utf-8?B?eVRGL0NOckZZYnlobFRBTXpQR2kreFVjU1B5b2ZtQTYvbFpyejFQUk5rQ3V1?=
 =?utf-8?B?SVN2Zkl5ay8yQVl2b3dSc3JxTVU5cFB1ZUppNmMrNk5WZFFaUDdRNjVxNExu?=
 =?utf-8?B?U05ZdzJocGdBdGxMZHM0WCtNWnRGYWEvUlhyc01lSzJwSnJlNHhkQ0d3OVIw?=
 =?utf-8?B?eTJmMUJxZGY3eUxPbDZqOVg5MG5HZHU5QW0xNEp5MEF1VmY3S2dSaHpzT2c1?=
 =?utf-8?B?bFFXZUhmTk5Ma05uL3d4MU9mNXYzd3dTRE9GWTd5OTBjOTFFWUdyRTlxeTBK?=
 =?utf-8?B?YTBJRnA0ZnNGcHZwdWlXMytjQmlsa0EyZitMSVkwWGFvQjFsQmpEK01ENllT?=
 =?utf-8?B?dHZ3U2IyNHhMSVNvOGhxZDE1bXdPbUxqSkpCSkxDdTdOREcxTERTdWNsUEV6?=
 =?utf-8?B?ZkNXVVU1VnZBK2ZMWVMyMTR6eGRUQnRScmxrbmN5ZEF2TENJdDNRTURldnVm?=
 =?utf-8?B?N1g3cGhlYU9lWkJCSDRyUFBibkxUam95Zk1CcExIQldyRXk1NHNOZTZENFE5?=
 =?utf-8?B?ZHk1Y3dKSHAvSGpxSlBJN0hxdGxYRXZ0ZXFmSWYzR0N2cmUxdTV3Y0pUZ0o2?=
 =?utf-8?B?S2NWMUwrQ0dOdnRrNlZoK21EMHZ6TmdsY3ZUeVFnVEJITEdVdEkzRjIwVXBH?=
 =?utf-8?B?STZWZXpzUFZnaVkyRnZoSjhLWHl6TnlRcTRoWnJIMW83MlFtUVo4UG5uWmtp?=
 =?utf-8?B?YTg1YmhGVkU2clQ1OVk1eHpIeHlYNEYyTnQrRnkvU2YyM3AwRVVzRkoxVW1v?=
 =?utf-8?B?MkZ3SDlvbG1QUE9GTEhvLzJwREJmOGpmcVRyMnlkVmxPNE5VSkU4WTRDcmJY?=
 =?utf-8?B?Z2pnaDl5aThuQ0U3RE15WFhSNHRQZGwrQ08rakMrVWoxazV0M0o3N2huVThw?=
 =?utf-8?B?MUd2UGpnMG1hak9qQkJQWjR4eUNJbFpScWFBelk5ZitCVDVyZjZPZnpHbWhZ?=
 =?utf-8?B?aXdvOWVXNWtDWHpTUk1DaGNZM3g5YkRjcC91eGE0aDFldTh6dEt3dnQrWE5Z?=
 =?utf-8?B?U3RaaU9sb0c2UEtNVkk5UWVuYWJUZVJKSEZOcnQ0Q29ES3U1bllsZz09?=
X-Exchange-RoutingPolicyChecked:
	Z4aKAVgDYLq3qXpJm0nNugBi8iIZmCvGjyz4mbdhE8dS197KN42sYVw0cL9pgYqE4mQo7of1xKeJpAwhflGdQWCR8rtb4dcmqzhonZuPw4xQ06QoSLhPyZPR2xgyr7cRDIsd6xWOOjXKtGh69LGpjFWvm4JLiliM0CjoBKUF6Ua18+VpkrSjIHevtccpDEkgKflwfQzhwxTEOdvvhT60L4Lg1sNQmiX41Uk1I/cseIasoVu4VbA47vgkaUl70lSr0dlNqnVcPl1d9KmxHEd4YXou6E2I3AARp0Q4cdd1w+IxT63T+X7F0wtonfoznI7dUsdxCMXvDHZHhDKZv8PDVQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9l06ycsdisiOO1TlhWrY3L36qDvJ4srWZZP6dT8vZ5WN3HdhDw/CLHTagNEFuXdgEys0PQBPa25QJqI9n2LJg2vaAg/f2O2qs2KrkqE8vK72en6Plhwto4xC3Vbkun+o7cW/vxvVCxJX6EPbjA0eOj0Lb1Vgwy9HmhyvBKBmDYsPyu9KthukvvGOAcz5sd47B91pXmnyrJGDh8zq6mAUqZ6NOP/4koRJqekLeH5vDRJQ5KoHJZO1BuPaS+wUStYIg9KKZOKm1ZaFoxxwGozzVF7Oi0wOXwPA/5gwNfOv/EJu+ggp6Grd+Q7pdbwEC4Q3lRtq2wLn6CxWjSd5K2gvag9UYdIG4hqenQN5YCFKIIR8O0chP79G+Ke0mO97iduD02tWQpE6RrkC20KhBy/UFYBeQ95eiTY8ttUu/Jk9AFdLjP1DnN4+fy7b+WEGtt14eN/ajS4/f49M3NcLatPMxY4oxjttQPE76DxGm8q4ibPxeaIA+zmaVPpqS72ZYYKn8OikhU0Pr1G9sAkmeDiRvkm8g+6+ZPUXTA7iBQQ7jEXMCyDjtC9YkgyUFuGrrD+UHT/7QlRVTlcqlRVcJ/Wr/XsUuyXF6ddvW7zDk1ACoh4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488aba30-5ddb-42ca-083e-08deb4b26135
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5109.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:52:16.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wH1lDYpEJ3gWHo+5FldKzMrDc5UYtShZGes6OXNM1rtZb2EVCdYzzpk0498X3Nh4YFEfgKN/wCbPXEOybRQaRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6875
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605180074
X-Authority-Analysis: v=2.4 cv=UOjt2ify c=1 sm=1 tr=0 ts=6a0ac535 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=vggBfdFIAAAA:8
 a=pBOR-ozoAAAA:8 a=mLnsDVdbAAAA:8 a=yPCof4ZbAAAA:8 a=RXWFDia8kwHKEAyOmR0A:9
 a=QEXdDO2ut3YA:10 a=xnp1pY6zelCj5OLna2To:22 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12298
X-Proofpoint-ORIG-GUID: H9fT60eQHa0s8depqHRz7ThOIQXgNtd9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NCBTYWx0ZWRfX52PZ4ZTH9UK0
 /nOm4s7e5/YNkHzURQavpkWDkyE3+T4RwBNsIKmx4upscp/Z/tvak5LSSfhpGJ8+X/TdweaoAwt
 LN/Wp6Iak+77F6uUTTk9MEWqtjFgWebxlkzvRBgHTaCMVc+x3NyOROpByrP7RALVxloOFjDoz4d
 dLnS8i620cvyJhd0gsLpfQqPVpI2kWoyLpDBBzaUGi9P51tpxz35FTLIlDI8U4QODO6GCL+Y9uv
 B+Fwu1PFDRxe0ulpmUCAU+ctWnNtz3K1lzatFbbNk61+Evajj6PPduwLs6b9aGkHs1Vpou0ch3Y
 wDzlko4GmDI/ggy4l6qubcflAzV8SZ1GzV0bT0xgxvzwSlPyTormmtMJiFgwokXvHTFgLDHXStz
 J0Rp71Q9FRk7HEEQefpozHQ2vW1dK3UnDE0mIutbOWgbJtyp9fr3TSh4vCeHmB6mxXgB0G2cjek
 Lc9mVxmgQg2vW5IbQm0ukzWlZ40WXuTuHFYW+Hqk=
X-Proofpoint-GUID: H9fT60eQHa0s8depqHRz7ThOIQXgNtd9
X-purgate-ID: tlsNG-16d1c6/1779090776-84D62D75-207BCD71/0/0
X-purgate-type: clean
X-purgate-size: 12409
X-Rspamd-Queue-Id: CA7E956829F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:dave.hansen@linux.intel.com,m:vkuznets@redhat.com,m:x86@kernel.org,m:maz@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joey.gouly@arm.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,oracle.com:email,oracle.com:mid,oracle.com:dkim,xen.org:email,amazon.co.uk:email]
X-Rspamd-Action: no action



On 5/9/26 3:46 PM, David Woodhouse wrote:
> From: Jack Allister <jalliste@amazon.com>
> 
> In the common case (where kvm->arch.use_master_clock is true), the KVM
> clock is defined as a simple arithmetic function of the guest TSC, based
> on a reference point stored in kvm->arch.master_kernel_ns and
> kvm->arch.master_cycle_now.
> 
> The existing KVM_[GS]ET_CLOCK functionality does not allow for this
> relationship to be precisely saved and restored by userspace. All it can
> currently do is set the KVM clock at a given UTC reference time, which
> is necessarily imprecise.
> 
> So on live update, the guest TSC can remain cycle accurate at precisely
> the same offset from the host TSC, but there is no way for userspace to
> restore the KVM clock accurately.
> 
> Even on live migration to a new host, where the accuracy of the guest
> time-keeping is fundamentally limited by the accuracy of wallclock
> synchronization between the source and destination hosts, the clock jump
> experienced by the guest's TSC and its KVM clock should at least be
> *consistent*. Even when the guest TSC suffers a discontinuity, its KVM
> clock should still remain the *same* arithmetic function of the guest
> TSC, and not suffer an *additional* discontinuity.
> 
> To allow for accurate migration of the KVM clock, add per-vCPU ioctls
> which save and restore the actual PV clock info in
> pvclock_vcpu_time_info.
> 
> The restoration in KVM_SET_CLOCK_GUEST works by creating a new reference
> point in time just as kvm_update_masterclock() does, and calculating the
> corresponding guest TSC value. This guest TSC value is then passed
> through the user-provided pvclock structure to generate the *intended*
> KVM clock value at that point in time, and through the *actual* KVM
> clock calculation. Then kvm->arch.kvmclock_offset is adjusted to
> eliminate the difference.
> 
> Where kvm->arch.use_master_clock is false (because the host TSC is
> unreliable, or the guest TSCs are configured strangely), the KVM clock
> is *not* defined as a function of the guest TSC so KVM_GET_CLOCK_GUEST
> returns an error. In this case, as documented, userspace shall use the
> legacy KVM_GET_CLOCK ioctl. The loss of precision is acceptable in this

The description here confused me a little. It sounds like userspace should call
KVM_SET_CLOCK if KVM_SET_CLOCK_GUEST fails. However, I assume it actually means
that userspace should do nothing extra if KVM_SET_CLOCK_GUEST fails, and simply
rely on the prior KVM_SET_CLOCK and KVM_VCPU_TSC_OFFSET workflow described in
patch 07. Is that correct?

> case since the clocks are imprecise in this mode anyway.
> 
> On *restoration*, if kvm->arch.use_master_clock is false, an error is
> returned for similar reasons and userspace shall fall back to using
> KVM_SET_CLOCK. This does mean that, as documented, userspace needs to
> use *both* KVM_GET_CLOCK_GUEST and KVM_GET_CLOCK and send both results
> with the migration data (unless the intent is to refuse to resume on a
> host with bad TSC).
> 
> Co-developed-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Jack Allister <jalliste@amazon.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  Documentation/virt/kvm/api.rst |  37 ++++++++
>  arch/x86/kvm/x86.c             | 151 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h       |   3 +
>  3 files changed, 191 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 52bbbb553ce1..2268b4442df6 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6553,6 +6553,43 @@ KVM_S390_KEYOP_SSKE
>    Sets the storage key for the guest address ``guest_addr`` to the key
>    specified in ``key``, returning the previous value in ``key``.
>  
> +4.145 KVM_GET_CLOCK_GUEST
> +----------------------------
> +
> +:Capability: none
> +:Architectures: x86_64
> +:Type: vcpu ioctl
> +:Parameters: struct pvclock_vcpu_time_info (out)
> +:Returns: 0 on success, <0 on error
> +
> +Retrieves the current time information structure used for KVM/PV clocks,
> +in precisely the form advertised to the guest vCPU, which gives parameters
> +for a direct conversion from a guest TSC value to nanoseconds.
> +
> +When the KVM clock is not in "master clock" mode, for example because the
> +host TSC is unreliable or the guest TSCs are oddly configured, the KVM clock
> +is actually defined by the host CLOCK_MONOTONIC_RAW instead of the guest TSC.
> +In this case, the KVM_GET_CLOCK_GUEST ioctl returns -EINVAL.
> +
> +4.146 KVM_SET_CLOCK_GUEST
> +----------------------------
> +
> +:Capability: none

Do we need a KVM_CHECK_EXTENSION capability for this? If userspace wants to
support the new API, should it detect availability via KVM_CHECK_EXTENSION, or
simply try the ioctl and handle failure?

> +:Architectures: x86_64
> +:Type: vcpu ioctl
> +:Parameters: struct pvclock_vcpu_time_info (in)
> +:Returns: 0 on success, <0 on error
> +
> +Sets the KVM clock (for the whole VM) in terms of the vCPU TSC, using the
> +pvclock structure as returned by KVM_GET_CLOCK_GUEST. This allows the precise
> +arithmetic relationship between guest TSC and KVM clock to be preserved by
> +userspace across migration.
> +
> +When the KVM clock is not in "master clock" mode, and the KVM clock is actually
> +defined by the host CLOCK_MONOTONIC_RAW, this ioctl returns -EINVAL. Userspace
> +may choose to set the clock using the less precise KVM_SET_CLOCK ioctl, or may
> +choose to fail, denying migration to a host whose TSC is misbehaving.
> +
>  .. _kvm_run:
>  
>  5. The kvm_run structure
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index d9ef165df6a1..d1327d5fba3f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -6205,6 +6205,149 @@ static int kvm_get_reg_list(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_X86_64
> +static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __user *argp)
> +{
> +	struct pvclock_vcpu_time_info hv_clock = {};
> +	struct kvm_vcpu_arch *vcpu = &v->arch;
> +	struct kvm_arch *ka = &v->kvm->arch;
> +	unsigned int seq;
> +
> +	/*
> +	 * If KVM_REQ_CLOCK_UPDATE is already pending, or if the pvclock
> +	 * has never been generated at all, call kvm_guest_time_update().
> +	 */
> +	if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, v) || !vcpu->hw_tsc_hz) {

This was flagged by AI, and I am still checking whether it is a real issue.

What happens if KVM_REQ_MASTERCLOCK_UPDATE and KVM_REQ_CLOCK_UPDATE are both
pending?

From my perspective, I am also curious how we should reason about this in other
scenarios in the future. Specifically, when do we need to process
KVM_REQ_MASTERCLOCK_UPDATE before KVM_REQ_CLOCK_UPDATE, and when is it
acceptable not to? I noticed that kvm_cpuid() already processes only
KVM_REQ_CLOCK_UPDATE.

> +		int idx = srcu_read_lock(&v->kvm->srcu);
> +		int ret = kvm_guest_time_update(v);
> +
> +		srcu_read_unlock(&v->kvm->srcu, idx);
> +		if (ret)
> +			return -EINVAL;
> +	}
> +
> +	/*
> +	 * Reconstruct the pvclock from the master clock state, matching
> +	 * exactly what kvm_guest_time_update() writes to the guest.
> +	 */
> +	do {
> +		seq = read_seqcount_begin(&ka->pvclock_sc);
> +
> +		if (!ka->use_master_clock)
> +			return -EINVAL;
> +
> +		hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, ka->master_cycle_now);
> +		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
> +	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
> +
> +	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
> +	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
> +	hv_clock.flags = PVCLOCK_TSC_STABLE_BIT;
> +
> +	if (copy_to_user(argp, &hv_clock, sizeof(hv_clock)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +/*
> + * Reverse the calculation in the hv_clock definition.
> + *
> + * time_ns = ( (cycles << shift) * mul ) >> 32;
> + * (although shift can be negative, so that's bad C)
> + *
> + * So for a single second,
> + * NSEC_PER_SEC = ( ( FREQ_HZ << shift) * mul ) >> 32
> + * NSEC_PER_SEC << 32 = ( FREQ_HZ << shift ) * mul
> + * ( NSEC_PER_SEC << 32 ) / mul = FREQ_HZ << shift
> + * ( NSEC_PER_SEC << 32 ) / mul ) >> shift = FREQ_HZ
> + */
> +static u64 hvclock_to_hz(u32 mul, s8 shift)
> +{
> +	u64 tm = NSEC_PER_SEC << 32;
> +
> +	/* Maximise precision. Shift right until the top bit is set */
> +	tm <<= 2;
> +	shift += 2;
> +
> +	/* While 'mul' is even, increase the shift *after* the division */
> +	while (!(mul & 1)) {
> +		shift++;
> +		mul >>= 1;
> +	}
> +
> +	tm /= mul;
> +
> +	if (shift > 0)
> +		return tm >> shift;
> +	else
> +		return tm << -shift;
> +}
> +
> +static int kvm_vcpu_ioctl_set_clock_guest(struct kvm_vcpu *v, void __user *argp)
> +{
> +	struct pvclock_vcpu_time_info user_hv_clock;
> +	struct kvm *kvm = v->kvm;
> +	struct kvm_arch *ka = &kvm->arch;
> +	u64 curr_tsc_hz, user_tsc_hz;
> +	u64 user_clk_ns;
> +	u64 guest_tsc;
> +	int rc = 0;
> +
> +	if (copy_from_user(&user_hv_clock, argp, sizeof(user_hv_clock)))
> +		return -EFAULT;
> +
> +	if (!user_hv_clock.tsc_to_system_mul)
> +		return -EINVAL;
> +
> +	user_tsc_hz = hvclock_to_hz(user_hv_clock.tsc_to_system_mul,
> +				    user_hv_clock.tsc_shift);
> +
> +	kvm_hv_request_tsc_page_update(kvm);
> +	kvm_start_pvclock_update(kvm);
> +	pvclock_update_vm_gtod_copy(kvm);
> +
> +	if (!ka->use_master_clock) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +
> +	curr_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
> +	if (unlikely(curr_tsc_hz == 0)) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (kvm_caps.has_tsc_control)
> +		curr_tsc_hz = kvm_scale_tsc(curr_tsc_hz,
> +					    v->arch.l1_tsc_scaling_ratio);
> +
> +	/*
> +	 * Allow for a discrepancy of 1 kHz either way between the TSC
> +	 * frequency used to generate the user's pvclock and the current
> +	 * host's measured frequency, since they may not precisely match.
> +	 */
> +	if (user_tsc_hz < curr_tsc_hz - 1000 ||
> +	    user_tsc_hz > curr_tsc_hz + 1000) {
> +		rc = -ERANGE;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Calculate the guest TSC at the new reference point, and the
> +	 * corresponding KVM clock value according to user_hv_clock.
> +	 * Adjust kvmclock_offset so both definitions agree.
> +	 */
> +	guest_tsc = kvm_read_l1_tsc(v, ka->master_cycle_now);
> +	user_clk_ns = __pvclock_read_cycles(&user_hv_clock, guest_tsc);
> +	ka->kvmclock_offset = user_clk_ns - ka->master_kernel_ns;

I used to explore adjusting ka->kvmclock_offset in KVM_SET_CLOCK based on the
old hv_clock and the new hv_clock long time ago. At that time, my concern was
what would happen if userspace provided bogus values. Theoretically, this is
possible with any ioctl. My concern may be unnecessary.

Would it be helpful to validate that the delta is within a reasonable range,
e.g. that the drift can never be more than five minutes (forward or backward)?

Thank you very much!

Dongli Zhang

> +
> +out:
> +	kvm_end_pvclock_update(kvm);
> +	return rc;
> +}
> +#endif
> +
>  long kvm_arch_vcpu_ioctl(struct file *filp,
>  			 unsigned int ioctl, unsigned long arg)
>  {
> @@ -6605,6 +6748,14 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>  		srcu_read_unlock(&vcpu->kvm->srcu, idx);
>  		break;
>  	}
> +#ifdef CONFIG_X86_64
> +	case KVM_SET_CLOCK_GUEST:
> +		r = kvm_vcpu_ioctl_set_clock_guest(vcpu, argp);
> +		break;
> +	case KVM_GET_CLOCK_GUEST:
> +		r = kvm_vcpu_ioctl_get_clock_guest(vcpu, argp);
> +		break;
> +#endif
>  #ifdef CONFIG_KVM_HYPERV
>  	case KVM_GET_SUPPORTED_HV_CPUID:
>  		r = kvm_ioctl_get_supported_hv_cpuid(vcpu, argp);
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 6c8afa2047bf..9b50191b859c 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1669,4 +1669,7 @@ struct kvm_pre_fault_memory {
>  	__u64 padding[5];
>  };
>  
> +#define KVM_SET_CLOCK_GUEST	_IOW(KVMIO, 0xd6, struct pvclock_vcpu_time_info)
> +#define KVM_GET_CLOCK_GUEST	_IOR(KVMIO, 0xd7, struct pvclock_vcpu_time_info)
> +
>  #endif /* __LINUX_KVM_H */


