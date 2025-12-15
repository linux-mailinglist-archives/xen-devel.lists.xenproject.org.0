Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90216CBF8CD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 20:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187573.1508936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVEH6-0001U3-Pm; Mon, 15 Dec 2025 19:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187573.1508936; Mon, 15 Dec 2025 19:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVEH6-0001Sc-Mp; Mon, 15 Dec 2025 19:30:28 +0000
Received: by outflank-mailman (input) for mailman id 1187573;
 Mon, 15 Dec 2025 19:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GmU=6V=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1vVEH5-0001SW-7k
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 19:30:27 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f9dc211-d9ec-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 20:30:23 +0100 (CET)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFJCG1R2854637; Mon, 15 Dec 2025 19:30:07 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0y28aq8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:30:07 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5BFI7WqT024713; Mon, 15 Dec 2025 19:30:06 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4b0xk9aypc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:30:06 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS0PR10MB6869.namprd10.prod.outlook.com (2603:10b6:8:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:30:02 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:30:02 +0000
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
X-Inumbo-ID: 7f9dc211-d9ec-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=G4Te4BEmegoyq/QJD9RdTuKf2jsNZuNz/mwX+Tm6LJo=; b=
	UwW/lftgc5k7dgvuDt7SlnZjWyXr9UqMN+yZXyfc/nWzUHEo7TduS7ZBU4AkukeP
	34xcPQ+kzUaYz21wXgNh33mtqoHi4o4H5OCeaW4W1eYobztVcuR6z8V40Umcb3Z2
	ysDjWt/9axwA1TEc64gyN20q5Ofk30ztucz3Opy+UXFDFbVzwOnuBO3Yq0CUx4Ng
	lG25B4IaMDzs6rbhpE6t6KeeIEwAwRwIC/NpnkF6U4ubHR5iOWJ8scyXEqmxEC2D
	fdEoMDUtmf84zyTH1dWlg3Ui06MRK1s4CFU1xohpCAozt3Cn27U1Z91Px2jV2M7/
	Ea3pbfnh5etsDKIQ/5vSvw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yltADPkiFEBtpvisHb6zgY38VC+draL7rdrj+XiqSs9S2PubNeddo1sEMypYoHDVM0Bo/c2m2HX3gLll46CPXoCvIcuINGwCWZ6DcyVij4WSHGNxdiKoeFhx9wn0Xy8N9JcV5ULc+pjeWYMcHymKTGPMoEd0FHAJ6XgchCJJaO4ZeWkujXscMb8UNiS+lnKyl4F9Q4QBEJO0cDfRt4tPREhViFntiVvGPKte0O6ZfYQBgOoK9H5qZoXEEF/IvlZNg2AxrLTSBZdj7lg6gYm+Cmizluqiyeb4rdS+U0X9crjkjcpQYRw3WKk4YVTfNM49dOpFawr0FMRiCBIoY6GbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4Te4BEmegoyq/QJD9RdTuKf2jsNZuNz/mwX+Tm6LJo=;
 b=df45QB0AX/tB30gRnGMEXqqAxDPevSSBLEdlfaMFeY5K/uBMOZliRnkqvlY8LQENFSxN78o7v0d/4uYz4ykoAqJi5z/NYP1iKYF+be5kyHHMLCIbWy4GeM8J/Zeff4VOFc6ktAmRe2LCR2g3l67vh3wCL8hJJSficB+Fh7iZ8o4oyy8LkyMaiCE8JbPEZ4a2vEMCc0TC5m4eykThrsl78pYy8V+iW8/wDmV4vChXoRdYym0v9/hVmMNyZ6TaWNGkLSUOlQsjupFCl1zcZBe50BhhAvqbCiy5p8vEWLwsqNp/fO4Awq3BgqTJiyfg8AIX9sekvd8yh28YoOorCicOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4Te4BEmegoyq/QJD9RdTuKf2jsNZuNz/mwX+Tm6LJo=;
 b=nCLDW9yTlW6mKV16ItaTi2KbuHL5BBjuQ0lAV0/66pmQMPIVwBb7w0Zvu0vqz7g2yzThYXVv5aBCbk7J1AorB+p2usn+Kwb+NU+jv52QEYhJkUyjYRnR7RwWAnz09jVmCooKumXuZ4LmiYpIx2ufetJQfiVjeN6aB2jkh0CoJUA=
Message-ID: <fe4f5cce-a82e-4216-868e-eb906edc53d1@oracle.com>
Date: Mon, 15 Dec 2025 14:29:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix sparse warning in enlighten_pv.c
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
        kernel test robot <lkp@intel.com>
References: <20251215115112.15072-1-jgross@suse.com>
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20251215115112.15072-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::14) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DS0PR10MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a6aa42-6264-48b4-7ec7-08de3c1057c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Njl3QWtYN2xKL0pmOENkNE1vcXhMNXd1Nml0YUxtUjQ2RTV1cHhsZlJqYzRs?=
 =?utf-8?B?VmpxR1VoUE9jb3AxeTM2eWxlbFFtZ3dSMXpkMmV5cVVUNVA2UytIcU1lZFlm?=
 =?utf-8?B?ZE1sTHZGUGlXb2lKaWlJTzA2VWtlRHN3V29lUVp3b0wxWlZhZ0JOcWwrTmk0?=
 =?utf-8?B?QUhJTUJYdmZCV3lONENIcDd1YktMbU13OWpDNG4xS3p5K0lub1VPVHZ5SHlD?=
 =?utf-8?B?NFVIQjY3enVOTEFOV1A2MGRCZGZsWTVBTGhlMHY1TnRSWlFJczcwMitueTFY?=
 =?utf-8?B?OVdqbEg4dFZjQlZKM0hCL2FYR3J1MklRS003aGxaZi9zbk5vWFRQZnNWWlQx?=
 =?utf-8?B?cXlqcncrNDY2YjZVbE5LWER2UW9kdU9IQVEzNllNMzJTTEFSazhIUzN3eEdY?=
 =?utf-8?B?WkR6KzlMbDZiVExzOTEvdmo1SWlLd3gxMnY1Uy94UVlNZll5ODF5aTlYeFdE?=
 =?utf-8?B?VnlBTnBORDJpd2txVG92NE1zQWkrYmFvRGl4NWZIbzhZV2VIenE1VDRsc1lK?=
 =?utf-8?B?ckxGakN2T3dPbFc1K1J5MjdiTVdLWlZacFFWRDVnU2VoTlNreVVrcHN5bHJ0?=
 =?utf-8?B?a2RJYlBwd2cyUk1hWkhyYTZ6OUs0WUdGTFBwQ3M5V25pT0wxOXhmZmk5c3BX?=
 =?utf-8?B?bnFDRWQ1ZkVXUzlXWjBIVTdzSURSUzYvdmFidno4R3J0Q1NQMjVlTHhNdG1j?=
 =?utf-8?B?N0d6SHdmT2Vna3JWLzl5S3hSWmNZQldPSUliMzkxQXQrYjc0RDBPTTNhaVZV?=
 =?utf-8?B?QmNrbnpudlRieWwzeW92MWg0ZHlBcjlEL2hmL0ozZXJJaFo4NlpsTlBadkNy?=
 =?utf-8?B?Sm5PYXNCdUs2RkdZemplL0JRODNadnVBbUhyc29aTzQrTDFhQjBJd0o5alor?=
 =?utf-8?B?L1RJQm9FSkc2NVhDMlk2NDB0ZWVuak1rSnAxem5vU3Q1bXYxMHhYMmhNZ1RZ?=
 =?utf-8?B?djJxQTdyQmYyS0Q4UllwOXRCcExlMENVUllXSlFDaENaU0ZndTZBb1NBVTcz?=
 =?utf-8?B?YTEwekQrNzJXL2xSM1VMaDFobVQ3dTRJRHF3ZmZzM3hrck93RXAzaCtuNmFB?=
 =?utf-8?B?ZHNFeUFXR3lkcXUrY0EvVVp2OStlQTBza1gxUENvbjJ2SmxON2hRYnAzVmJz?=
 =?utf-8?B?ZkEySFNDTXlTeFZIWHhtalBnVGZaL2dzU0p6d3RrL0g2ZVpsTjJEbTZzd0lm?=
 =?utf-8?B?NnQ3blU2OUpPL3JoNlNQcjdYS3NqZDdOWVkwbU5HbnByM2Z5R3BWSTd2eHVJ?=
 =?utf-8?B?K0lUUnFRZ1VRdkhUSThRc2E4amU2RjgvNHpYSlNQL3lnRFhnRGE3SmQ3WGVv?=
 =?utf-8?B?bk9hSjJFbS8zTEFNRFNSRWMyM0QrU2VNQXNRVU5uKzFJVzZlQkYzUEFpd0R5?=
 =?utf-8?B?R1BSMm1PckJCVHdKMFRoR2ZWWnNRdGhWNjV3UkJnQUlUbzFRMnp5L2NhVmlJ?=
 =?utf-8?B?cTcrVTRCeFF3cUlEUHdCNXpyN2pXT1lpRTNubTZFR09QdW5qKzNnSVNHc0U3?=
 =?utf-8?B?bERVOW5EenhUTDk3b0ZzazU2cWZzLzZrYTljS3ZDR05PeGZ2cjRZVTJaR2tp?=
 =?utf-8?B?a0tUazVBckU1R2RvOGFLN1Voc2F3eWpoQ1JNdWJ3R0pwV2Zvc1ZWQTFoOXBC?=
 =?utf-8?B?Y3R6RGJweVoydSt4R2o1WEYwazVGcWZBVWVQYkkrdlBZOW5IdVREVFR1L2pV?=
 =?utf-8?B?dStxOG9DM0dEQUI0UXRLajBWNjErRzRTSGd1bVR4UXBMYXQ2ZXQyMER4eHBK?=
 =?utf-8?B?cG5OQm5yTWx1bkg4Yzk5RHMydys0VFV3NFN3WmN6T25XT3ZiVGdTUjAveitk?=
 =?utf-8?B?bG9CV1R4KzJDb2U5RTBSQXh0UUxzV1FKc1JkTHRTT3p2Ky9VN28yV0F4K0lj?=
 =?utf-8?B?UW4yMkhjWW5yOHk5ZER4Q3U4dWdva3VMN1VMMVludEo2bmx6UVF5Nk1HMHJL?=
 =?utf-8?B?MmpadWJFcXkzUkZxOFZRQ0ZISHJicVB5T3Zja0hHaTVpT1pGRjYvQmFQd09I?=
 =?utf-8?B?S2Z4QS9BTTVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blFOREFGanlmdUNGaG4zZFRiTndaQ3VCZXdVSVVENENWRWNTME9QbzRRQ2R6?=
 =?utf-8?B?dFZZVE5GU2dPNERHNFQ0UkpyYVNtR1lGZGRReDVEQmY1TnBPOE9zRVBNL1E1?=
 =?utf-8?B?dWJ3R1pSREIxT3IrREpiZWhMQlE4SkVIelQzRHNzZTRsRUIrTW54MEZzMmQv?=
 =?utf-8?B?THplZGV1MXVMTGYvZi8rV1dTbld4ZVg3cUJqTkgxZkFUSEQ0Ry8yT1BkdW9v?=
 =?utf-8?B?QlFFYkhYZXFDemYzbnZnVGxYSTFNNzgweVBNYXNUcDM2ODkrWWZLMnIxTy9K?=
 =?utf-8?B?VXp4aFNJRW0rNWJYdHdkUkRiQU02LzJIVjZUb1h0Wm40U25UdEV1WmNUZm05?=
 =?utf-8?B?VmFuQlUweGI1R1YxRzVNSUlOUjFMaVJDaDdDdmpTQTZTNXN4ZkVqUFZOMm9w?=
 =?utf-8?B?MnphbmNlK1h4WFh6eGh5N3I5REdTazYxREc4RVhEZlZncVVFbnpkQm1TeWx1?=
 =?utf-8?B?TEFSalAyVE1QZ044VXdwZDNiOTUrYlhCSE91OEFveW5kck8zUCtWZjZzc2s1?=
 =?utf-8?B?UmZ5djBQU0RxZTB4SnMvSEpsM0wzTnV3WWw3NTFQc21XM2tYUEVBQ2VPRTdY?=
 =?utf-8?B?VG9LNU9WdjZGRG5aT2svd2xRT3JYQlRyRG16VURHRlMyMFBxcTVWTm8wVkRz?=
 =?utf-8?B?bVNnalhyT1VCeHVnQU1GY1lEZHZVWDYzSS9VU1VNV1QreWdEV092VFVJR3Zs?=
 =?utf-8?B?bGlHSDZiWGI2WkprNXZQMGZtcXhTV3BGbFBCMExrdFJlREZUMmUva3VXRmlU?=
 =?utf-8?B?STNJNE16eDdqR0xCZDNtcG9hbEVKS25nK0U0WWxpTDllYm1aN1FJTnpoNTZU?=
 =?utf-8?B?MTZvMkZ2NTVScmx6N2tMQlJSZUltTFd2VzVtV1M5S2NIUndiZVlqdWY4Mkxj?=
 =?utf-8?B?eHJJMXBtTWprTml4cXQ0Zk1lT2FKSllxbkQ0aGdiYkh3VS9QaklnMGxBdS9D?=
 =?utf-8?B?UTNiQkVjRk12ekllSmVsai83SDB5bWVmM3RpcUpNK1cwQWZ3VTJES3FoTzJV?=
 =?utf-8?B?SWhhVmpjSFJVZ0llRVVsYmlvMHRFa2M1a2xoUTdURHJLcE80SnZ0Z1phcFdq?=
 =?utf-8?B?ZzU4TlRIUjc4bE5zOHVta3dXUEhobTE1N0FvSWVtMkNlanhJaHBPbFU3Qits?=
 =?utf-8?B?VW9iYkt6eWQ2ZjZwRDhJYUNTeW9VMHVlaUhqZnBEOTQvbE1nRnlkMW1POXB0?=
 =?utf-8?B?amp5Y0lMZVFzc3FqZ2JTZ2VpeDN1OHV5L3Z5bFNRZS9OWXFNTGUzM3VTdkJm?=
 =?utf-8?B?eGhYWWlpdTVuMElNa2lva0lHYjAyRnJVN3pDclFGblRGOHNRb2haUUNHVUR5?=
 =?utf-8?B?TkR4MGV1TVBSanR0ZDRaOXN2aEZCU2RSbitUUGNCZWhSdmNTWEFqcU5wcGpB?=
 =?utf-8?B?NyszbjZpZXV4TUFzVWpSZk9lWXNpU0tYQ0c0K1N3bjBoNFhQaUQ2SGdycE1j?=
 =?utf-8?B?YkVuV2Zud3BjeTBSdVpMcXp5S0RUOVVCYjFBMmcrRzdkamZ0RWtPNEF2Z0ox?=
 =?utf-8?B?U0dHSm51VVdSYVB4aXpHYkhYc2ZOMVY5dm1NdnFReGZJY242VlpNMmZlazRo?=
 =?utf-8?B?RU9jKzBCM3VQZEx0OHN1NS9KNkFFcmNsVjVvTHNXeVRkN2ZYd3hBbFNJV0JJ?=
 =?utf-8?B?NXRRZFdKUXd4MVZRd3FvMGdiek5iVWg3aDNxVGRyb2R0aVFDS3dpaTNUZXRV?=
 =?utf-8?B?TWtEMGxiWDVYc1NWcWl0LzJVaU9NeVJUdVBQdUQ4QjhUTUUvUk9MZ2V5MjFt?=
 =?utf-8?B?bVFURzRQdVJ3cmFxQmNlZE9iZWVrMG53eWpGNkxpSFZxeHlNSXNsYlZtTGZY?=
 =?utf-8?B?SFFXNkQyalhZcVVpT3FUc0dJcW53OUNzVktVcHRvbXl5UHpDUjV0WGdvZytX?=
 =?utf-8?B?TTl2Q1FySnVjR09rN0MzajVGZlRrY3ZVOEZwTUJHakxKSmxPdGpna24vRlB5?=
 =?utf-8?B?TjlSTmNCT3NrWE16TnBJWXdGdkJsc09KenE4WEV0M1VGN1lhYTZFWFZTbDRt?=
 =?utf-8?B?U2tZa0xjYzBlbnBQSHB6dUJJeWhTbUZHZHNLZWs2L1d3dzZsK2xud0FPWkVR?=
 =?utf-8?B?UFZ4Wk1CWld5djVDVHR4amMyNFlTZmNtNkQyQzI3bFpvNjRBWHBmSkpCOVcx?=
 =?utf-8?B?WUx3bFFBK2J6bUtPTlZIM2RBenU3MnNTdWJJdityQ1p6QTB6alVLblR0bTBW?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mlDujJumNhpKb67u7kJgOkXjn+gLlDFFDGB5ewlDSEM89+umKkDk5OtzsIrCANJF9yordOND4AeduJ5Xz9rX9cMfS5xMX16C4Coz29IXq1iLTgIIOX1HPY1qlqCr2hmlxaB/8GQg2cGND/lvZCLCefNDoGvnIDdPI1CD5IJi2Yl0OZHgsEmPWMRU8w8LLuX/vYxmRBRVGXUlozDX8+AdzvMq3RDExoI0hK5i623hnQdILiXZdMhu33/ZKwscolZpAK2NVPebnFCmZujy8cuOhVcLAw9uRfYG9rYiX+K6MN152aLaQCVWwmOGDimxzDOjIkVS0jB4jfsrtpINDaJKLpNZchx4464V49SHxgeER3Y3ZlYdRg5Pw0wpEBALUYrZPwUQh4OoTlQuX/hMJOPeKBa8KmP+hIrFA+jbn5703XTiOwiz6lU128ew0HLMQMl5JnPZHovcPPaWU3PQWv62uEu7sLYKQB9d9xNQo8brIITNMNJh8fY1/iVI2E1MvX5f833MAmC6O1tW9tN4hzQDsWqVMxw+Wv5WZEa3gCn3SZy6MdjouzZr2FUskPeF/gIZig96RC/QriBvOJWW/FPFSdf/ZuqxzMLhbYd3EI8gm4w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a6aa42-6264-48b4-7ec7-08de3c1057c8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:30:02.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76bLTu24/qgS+CRJ72A7lcDujrDu90CH0+ayvxc55NVd1VrCPUXfsGpiW4Zv2kl/5m4PcEdEikZaH9GCbt7PTC1KdnQzGxniKpUEBi5NfXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6869
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512150169
X-Proofpoint-GUID: 4WvBGC5IZip0cTnrUz4SuoDm1m43lELl
X-Proofpoint-ORIG-GUID: 4WvBGC5IZip0cTnrUz4SuoDm1m43lELl
X-Authority-Analysis: v=2.4 cv=fOQ0HJae c=1 sm=1 tr=0 ts=694061bf b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8
 a=pgsPH99h-XJVn1JYbbAA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2OSBTYWx0ZWRfX2US/eezg0OTu
 eThP0MJgpYM2NtNEeGK/miAAz2iD8ED40iGUv0S0FZPk3E57/ugJhMORfzidAdB1ib4nEHOrjuP
 sbV7LBIV2fb1FhO0nxJdGXgyVG+pHdOIhgs0pl9Htw6KwwXiWX1qqFdi2VfvY9nK6CaDPHunP+T
 xChgVbSEinVF2tJfaMqYmk6td1cZdra/tNluT/VdWm7Nr72pME41trYkH6yL2OlW9Q/ar318ZhG
 IG4IaDxrGlMelYP8SvMYBkxurMnCTaAUmCiMFgRUSLYR9JRJjQSUiaDXV81edSQxbx8pNxmdLLv
 z89Q/v2ufgr4qrn52Eb85DzhCcF823c5IuHNgTjRMJT0pVa14DTdCV2Ft9jnmZ9TlelBo2M7iri
 /IirJee5RBvuxqg65TPxQVnQbBvpBA==



On 12/15/25 6:51 AM, Juergen Gross wrote:
> The sparse tool issues a warning for arch/x76/xen/enlighten_pv.c:
> 
>     arch/x86/xen/enlighten_pv.c:120:9: sparse: sparse: incorrect type
>       in initializer (different address spaces)
>       expected void const [noderef] __percpu *__vpp_verify
>       got bool *
> 
> This is due to the percpu variable xen_in_preemptible_hcall being
> exported via EXPORT_SYMBOL_GPL() instead of EXPORT_PER_CPU_SYMBOL_GPL().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512140856.Ic6FetG6-lkp@intel.com/
> Fixes: fdfd811ddde3 ("x86/xen: allow privcmd hypercalls to be preempted")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



