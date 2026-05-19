Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B/QIpYTDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:39:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C22579390
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312483.1582573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF2N-0005WA-Bw; Tue, 19 May 2026 07:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312483.1582573; Tue, 19 May 2026 07:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF2N-0005TH-92; Tue, 19 May 2026 07:38:47 +0000
Received: by outflank-mailman (input) for mailman id 1312483;
 Tue, 19 May 2026 07:38:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wPF2L-0005TB-LR
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:38:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPF2L-0010F1-18
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:38:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0c137d-bab6-0a2a0a5309dd-0a2a4503dd40-26
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:38:44 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0c1382-672d-0a2a45030019-cddca5203c4a-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:38:44 +0200
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64J6Qnbe1882529; Tue, 19 May 2026 07:38:15 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6h86uhdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 07:38:15 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 64J7Yf2p032194; Tue, 19 May 2026 07:38:14 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4e6f1aepg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 07:38:14 +0000 (GMT)
Received: from BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23)
 by CH3PR10MB7140.namprd10.prod.outlook.com (2603:10b6:610:123::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:38:04 +0000
Received: from BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83]) by BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 07:38:04 +0000
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
	corp-2025-04-25; bh=wVMIqXlaDGVHOYRt4HeJrHuQKFcLBAC9G+SLJY6E7yg=; b=
	Jr88k3Vvaisrr2u4xIdjA5e8uNmbOhwlMMmxu3nt2oo7RDtzQssHnOz21wnQy4Tg
	wNPxbeVTnTsumiMTP/lsYeYGjPepAPhNE7eMiTZ3b+dcYn+K8iUPGjAi2HuYHI8C
	tRuACaRyNtMC5Ubf/5OsKtXycwKU7AJZ000a4bGP/89suAbv90t8NgZ9HGQ9OAnE
	CrzscsvdfD/8/Y5O/cu3B52taXiUTGyutkUNwdH8/hz5S+OBKY1ED77gv5+I3jZI
	SIgNWEHkimWWVemR2qdjtQF6Ksjn7LT2CQ5H3YLu++c+rEq30OxiyQO8ao/Fy6IP
	eDqevgNa6NwdhaHCOc4NdQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVAif0Ut5FV05g2UFy3L1fiiBVgPQ0n4d6+6S70MRF4iWCtal2bjGWPKhmoJzY/4SvfQHccEucOGUMy1qXzKjY89tJgWGdeuuDCgvbMNZsFYY0gpMc3G6dyAudFgqJHOFxXa/Gyyh9laI9mw7sAYxNRpkCqPEXCjg/Om2xu+u6gl2jQRD5EDjarZudoAa0xk+ldoGQQaD/hV0O4BscMNCvLl2Nq0SXdMpwqYJl7MUjLHrjrBT4p/xW7FgLw/yFddXcCYt4XaFutvEdbUM8Ld0KppdiROvP7I4XbSQF0LDEZvoUNODmQr9JaPOuDVH+P396UFL/OttKwwNJIDknmSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVMIqXlaDGVHOYRt4HeJrHuQKFcLBAC9G+SLJY6E7yg=;
 b=Ytrk2TM1NpGEg9nKSLTgLvmjKKi5j0xRrFtu8mvDlVvMRKV6qQuL7Wb4iASYzc+nuzXCAx91RJ40pk0uBGLivmOV745yEZKUI4tgqucoG/edXhepLK+8RvjU1ytgy+3+cN/qTckDowlSogf/0Ifa04XPW+psOB22pj6Z1ShohSF2B+9wVzghF9qZQ3y12GLVr4XNt736LuFUKbDm4tZYeQd0+Iy+iscisu2GsU3g+TlhlWDeTNgsEQMEs7uXywGgIcuWF0bv80Ejo8dlEYkG1HQzINLOgYrFiy7+FehWlHuBqof3gTs75bgZWYq3Y9Gu0t4u9YwCOdoB6UV8TjQL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVMIqXlaDGVHOYRt4HeJrHuQKFcLBAC9G+SLJY6E7yg=;
 b=fg1+UwAgKZj+KiJI4xl4D26N7PCdXy1lKxuqKTCy0Cs8OoMKLDcJCJT2j99pCC62XQsP+znfbocjQKUI0Jx2CNtREqDGovuFJri2/H1EHdVCScPll6G+2Ct/a6t2WGA3nj9lqnJOkaOtwigSj1JIcCwW5lt+DteSBJNld2h77Kw=
Message-ID: <b5a8262d-4128-4fd4-b3db-fa718002c4cc@oracle.com>
Date: Tue, 19 May 2026 00:38:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/30] KVM: x86: Restructure kvm_guest_time_update()
 for TSC upscaling
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
References: <20260509224824.3264567-1-dwmw2@infradead.org>
 <20260509224824.3264567-17-dwmw2@infradead.org>
Content-Language: en-US
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky
 <boris.ostrovsky@oracle.com>,
        Paul Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Jack Allister <jalliste@amazon.com>, joe.jin@oracle.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
From: Dongli Zhang <dongli.zhang@oracle.com>
In-Reply-To: <20260509224824.3264567-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:5:337::12) To BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_|CH3PR10MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: dac31658-0e53-40f8-5b31-08deb5798ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8FMB00QR4NHXx1g0GjWMsf7JpVb0fhzD1uZyihLFUAx7HYTBVtT36WhJZMXbvDvB+uPnbstMPso4NJTYPLbCyofZRPDlzoY1XIRUo30VlqvnpjoUW/TaPB9tJIGQJEUZyATXb4vFfqMdvPKVgeH+welhtOuohtwE4hgqbOvMIOGw5UAUXhLtGYrukx4/2Ioi4q9Pz0TvoNyj8ZDESxO9SIw2tQACH6h51KqchD9sD3vPeXPwgxKjPsZUTzxYmFdGnfw9awbxixyKAMSJmbkkvMGl01Y8rp+CdYBG1nD120VByHVRQOuO4vyZBgYqJeWjtEePlNTITEuOKTRQoYHFDbzC/Uor1mB+5M9xqPD0tyvd5Z2IE8Tvrqqrchodha2NG6vMXbw4BYRsoSAknzjo8Ce94ScCRRj0JLC302rNcbhYiiK+NsoQ0da1RiTM31C3eo/umC9r6BZ0Ve145U9/+MXcsXfb/Uq1nYgjw2Jx0sZRhHPrA9tQShDhE9qzqWysaYPGDvsyMxTFCoJW+C4DU7VWSsZQL6I1RmqnkXoQcQqhvH77vMdSotDS63ye5di2wXwMWf+T2WkWhAFT1Iq25jCHAb9MIgZzhCuZk+6I1Kj2Me4GqNEb0FRTQxCj9pUlKpf0UlZ3FcIquOmbWx7yfxtPkqfYN8pY5hfmCPOLimSpNhLYfcQ6VCCMVToFkV3F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5109.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzlrTVRvWXlkQStkWG0xTXR0dTlwa1NIS1RSR0t2cVVZTGI0OWxpSGlSQVF5?=
 =?utf-8?B?dXNCWVB0QmdCOHF1eitBYW5zeW9uTHZCb1FzRFpBRnRUN2ZHSkRXcmc3dGts?=
 =?utf-8?B?SmV5ZCthOFdoZk9vQk9JdEhWeFI5em5uZlBJTk9QbUduRHNPTGlSck5jb2VW?=
 =?utf-8?B?bHFtdDNCSnZsN00ybEw3aEtYVjVTQnN1TEVpVitzZjRsb05sdmVWU3BqeWc2?=
 =?utf-8?B?eHVGQWp0MmJ1Ly92cmdPd3EwNTJpR0EwMlNTdzZZQW9nWkNlRnhHRGxOazJ4?=
 =?utf-8?B?ZFJmTDdIY2Vua2xVVWY5UklRekhYN3ZPdVlzbDd3ZVZiQkNuYnd2QmVXZTd4?=
 =?utf-8?B?MG1aSVg1bzBCSmhoVUNsVjNRN3BMdTBqSWFhdFp0RVNFRkRFTmNocHlDUTdz?=
 =?utf-8?B?N2swc283SUgvQ3piU1Z3ZkhTWWh4R2R6RjVJbzVDMVFlbTk5Mk9td1NUM09y?=
 =?utf-8?B?dWs4dS85QThUaVRsQWt2YzIrWnZqeFlFMHh1STdlajg2dks1R2luREFxVFpK?=
 =?utf-8?B?cnhMYzhLOXdQMm15K29hdVFEZ3Q2R3p3TUd6QmxJbVhBNGJxc3ErTWpkSjdo?=
 =?utf-8?B?VzFiQlY0VzQ3azE5NEd3MHpTREhBMWRnVmFRUjNsSkZham1rRklnRWVoUSsr?=
 =?utf-8?B?dkJFbXIvckpYbTA3RHcrSnBXZ3hGT2ZlM1JIanJOMEFDNjQrVENFeGhTenFB?=
 =?utf-8?B?K282WlJxLzhVY0tZTEFRb2VRR3gwR2I0M202RE9ES3lZRUdtNXE4R05KZktP?=
 =?utf-8?B?OGlheGcwZ0tmMFlVT1dEaFdmK2l0alV5aSswS2tUd0RhajhWdXFVNWtFSnE3?=
 =?utf-8?B?allmWFk3WEhCaExEekhYR002Y0hNUGovYlJEdkdRMnFhUWFhMDlRWGlEN1lK?=
 =?utf-8?B?Z2VyOEZiQjFiWlNkbThpS0lDZWRiT1NzYmtjTDF2UjRSUmRVVUZGOHNyQnNw?=
 =?utf-8?B?U0hyc3YzVUJxbXByTFhRbjhMcnd0QnR5ZkQ2NC96cEt2bWw4ZTZlMDZUa0lH?=
 =?utf-8?B?SDBENFgvM1M0STVOc2VENDhMNkhtMFlZVm5tZCtLSnVUTGRnYWpQWGE0Y2Vz?=
 =?utf-8?B?Y01XWHppbHQ5STNVWERMaTdHcjVaZEVDcytmTXBnYk5mQ2NBU1FFL3M2cTJn?=
 =?utf-8?B?Zkk3TitoSlFkQXRNcHZ2RXZGQTM0WXVDRlp3MEdGekY0NEpZeFgwdFVwNHR5?=
 =?utf-8?B?eEo4dWpOMi9ZVDBVaG5YaFlMUkVRWlZLTC9sbmN6VWp5RWhMekgvTnZJenN3?=
 =?utf-8?B?SlIwTVlwaXF1RXpac3gvUEhVLzlZb2d3ZGRMZ1FveFN4MzdObTVvVm1vTjNV?=
 =?utf-8?B?YS9GckJ4KzNNWEh1OC9WY0ZTYnZnTTh4YlBmQzRxUjNiSHNVTy9xNi9udTFM?=
 =?utf-8?B?WEJvQnVWMUZ4djVSMjJLcnI3em1NV2lyTkJsV1NWYXNGY2JtaEF1OG4zRm91?=
 =?utf-8?B?cVQrY3FrM0VncDVnUFFCRGJ2UU83aThranVKNXRzS3NVY1pzQUo2QXUvQ1d3?=
 =?utf-8?B?NU92TFFPaGxkRFptWWlCaHB5TXk0Ky8xL2MwUWk0dDIxTGw0NlM5cmZuZ0I3?=
 =?utf-8?B?cnpOL2w5UHo4elgzOUpWaFRIWkV5WnpzazZ5T1lrVmpsS2hYWC9QaEpQWWZx?=
 =?utf-8?B?SktudmtCcHgwZitpTysyaXozZ2UrSUxZTnl1UytEN0R4Sjh0MG5FalA1Sldo?=
 =?utf-8?B?czNoUUtTdnNISmpYeUpyWklGUjRodktsRHdNSUlJLzBIMUlFeUZwbFIrSGdX?=
 =?utf-8?B?dGxadGpUTXRxRy9aNGF1MldDeDdGY2dyK3RlMmlVWG04ZlZ3RnRITUF4V3V5?=
 =?utf-8?B?QlBNdDJDeEt4eHBTbU9KTW1sQmx3K3IzNGNxSXVUdHlyVHFGeXl6NDNXc25y?=
 =?utf-8?B?cXdYT2lBd0RFWGRSM3QvMWNOdnNNL0pYZFFXWnVLb2NoMVFFYm1CekVSVExy?=
 =?utf-8?B?QXJ0QnhXeVR3MzN4K0puYVFQVzM5YUk5Smk1M0dFdmhNRkVmdW9RVjNRWXpn?=
 =?utf-8?B?bGpxSmtuK0JKN3NSNXR4Y05LUEpkUGdNMXFNd0Z3MFk5Ym8xNFdieDRHdTEy?=
 =?utf-8?B?RFQwVzFDSkpSTTE0UFkwRlNxdWZjb3FjbWREbzYyeGZMVENlcVlCMmpzM3N5?=
 =?utf-8?B?M0ljVHpWNDhlOG8zWkRtekNqQ1JMNmhSZUZjalhzNm9STW1rL0NpczlGUE1a?=
 =?utf-8?B?SU5ycVp5MlA5TGMrdDhicDhuRHVnaUVtSHU4S0J1YnFxdEVWWG15cU5vOEgz?=
 =?utf-8?B?bUFrNGN4aG9kQ3BZRVJPK0lPUnJVdnBTdGdnYVoyRVVVZWZRaTgxSFp5ZnNm?=
 =?utf-8?B?dkpuZVZwRjR5TGJ0OGpiVFoxdU1BeTB3N1RZd2RRRTJ0NUtOTjY1Zz09?=
X-Exchange-RoutingPolicyChecked:
	KfpWThmt6bxxm9uXXkQtxchv9zLPS9FOSpPfAjrYJPS3AirSA+cG4CQaCqD0HW0IO7fETP74VOVzLZehhU0vyaggEvGtX0UruH1tFtwUTZgwWuEywW8hlw//9mcinLtNAxYODMlr49Hl6lNdQCWl8UKaEIjNKx91rp4Hu1hMXaSQ1O8yoenp3DRuBKSWk0EP485sBl3LcvPYlPfxGCXcap7woeg/NGZB0dPz1q9T9IUCfpKu8aMlT3QwXXmvpDdiP7uWHHS80rd+1sB5RFv28o9pcN1LekjHNM73NmZfjLG60StCFSjx8IDSmqznqgXK+2+3SZJw9cmlEeZDDzlgNw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Qd2shfWABmZB+1qeOKWw2kjunf5VnFwYX7pwv9VeI8haAesF8V2DEk+Isaa3QGF5yY0DhoPJwyF5xNHpUwZONPXfIjTz+tgpFE2W1Z+AaS0JbalXiopyQ5r7BNo823kYA/Va4U7vyVJKvO6hL+TrA9Pm8NQG+cB7FYoPeG8BojUputTPSYjhDHxE9kLbT0plKvN95WGf6pVu0LNJRFg+tu3PH+do5PevyoFZJ/BurM2g11NMvaCTsYiPWOdCBDUUncq6hMe6m4DyXYZopQEDzivvE2Dvv9CV5rs2Vfrbth5KBQIgaYnn/NGSOH3Ke5pIJok9JvdjFhiQIrLYPWk8MIKXEcAc0DVTULR/tA/0RT8/MRbyoJyebCi4OLDqqEvzSw23yybI0qXM1gx9QE2CI8ray+VJW9xW2ZHlJRq0Z5kA437+lrJ1k3qDcqD1/yLWvWigCGhvafRR9QbKJl+ng1jy7JoAhxoZdE612hCKovpgXuavCM5XBaNKor28/r/305ikDNX34+133kTIUF2Cew0CS38EAKc3HM+d6/3WQ7s35BmpwRMu/zdjcnBJb9thbvwyuLlzIHIVnCksQk+XadWOiRiGpbrwqOYZvZAX0k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac31658-0e53-40f8-5b31-08deb5798ff7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5109.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:38:04.5132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ERiowJv5imdCbpUxuLqHTK07Tpjwa72GP8e4XeLw1AH6P1jKosxM9GytGiZOVfOdfHeRVTQCXHEE6v3gL8XKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7140
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605190074
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MyBTYWx0ZWRfX4blUuN7yZiX7
 mb9xGTX3iH0paZ45euSbm/C83oPiZXZkmF+MhxGIlYRdIzyNT7L0YgbqDg5LIz634QhFV7al5NZ
 oYgOhqz9tE39Q2A1n1BU330hDI8NgyeNGVQqojJnvMYkjw6cRIz0KgUt7o8HlPvTt5bvxs6FYjV
 LnxaSYp+4xS8bFoB5WnNYvmX1npQBIQDlL10XWp54qivaMcGsgho5KBhRGOfJ5p4h7ZGg0fgpiC
 jethFEtUHjf8b8t+ncRDJoinRDKdH82EJzCkQ1RTtP4P8IZZxrWKTxEo88DDALPzragfoJojHnu
 8vP8akOV7yL1zJP5pF1QFufRFVR0f1BCUI5Se0hvBgn7XGJABy1l71eiPaI95IlRCwv1xNz2ErJ
 yTKm2BrKemn1xj8wsM8yYaR0MHHg4pPgchHdOY5yRVzWx9e/JZXE5fF8rXsz6XidEux++JBYYwY
 jXhrvXCVbFTgSV8S6Gw==
X-Proofpoint-GUID: 974FNTPzgHzDMT0Jk64deXyvvFIVwq3d
X-Proofpoint-ORIG-GUID: 974FNTPzgHzDMT0Jk64deXyvvFIVwq3d
X-Authority-Analysis: v=2.4 cv=TLN1jVla c=1 sm=1 tr=0 ts=6a0c1367 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=pBOR-ozoAAAA:8
 a=W_2rHOmGQDXlG3qyckkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-purgate-ID: tlsNG-33051d/1779176324-42F62938-7B78A2B8/0/0
X-purgate-type: clean
X-purgate-size: 5193
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:dkim,oracle.onmicrosoft.com:dkim,amazon.co.uk:email]
X-Rspamd-Queue-Id: D1C22579390
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I have encountered this build error with this patch.

Perhaps it is because all usage of "flags" are removed.

$ make -j32 > /dev/null
arch/x86/kvm/x86.c: In function ‘kvm_guest_time_update’:
arch/x86/kvm/x86.c:3359:23: error: unused variable ‘flags’ [-Werror=unused-variable]
 3359 |         unsigned long flags;
      |                       ^~~~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:289: arch/x86/kvm/x86.o] Error 1
make[3]: *** [scripts/Makefile.build:548: arch/x86/kvm] Error 2
make[2]: *** [scripts/Makefile.build:548: arch/x86] Error 2
make[1]: *** [/home/opc/ext4/mainline-linux/Makefile:2143: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Thank you very much!

Dongli Zhang

On 2026-05-09 3:46 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Restructure kvm_guest_time_update() so that kernel_ns/host_tsc are
> always "now" when doing TSC catchup, then swap in the master clock
> reference values afterward for the hv_clock.
> 
> This makes the TSC upscaling code considerably simpler: the catchup
> adjustment is computed as the delta between what the guest TSC *should*
> be at "now" and what it actually is, rather than mixing "now" and
> "master clock reference" timestamps.
> 
> The seqcount loop now also contains the kvm_get_time_and_clockread()
> call (matching get_kvmclock's pattern), with the same WARN for
> unexpected failure.
> 
> Based on a suggestion by Sean Christopherson.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 67 ++++++++++++++++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index e281c49561fa..8e4993ef4f6b 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3363,39 +3363,51 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
>  	struct kvm_arch *ka = &v->kvm->arch;
>  	s64 kernel_ns;
>  	u64 tsc_timestamp, host_tsc;
> +	u64 master_host_tsc = 0;
> +	s64 master_kernel_ns = 0;
>  	bool use_master_clock;
>  
> -	kernel_ns = 0;
> -	host_tsc = 0;
> -
>  	/*
>  	 * If the host uses TSC clock, then passthrough TSC as stable
>  	 * to the guest.
>  	 */
>  	do {
>  		seq = read_seqcount_begin(&ka->pvclock_sc);
> +
>  		use_master_clock = ka->use_master_clock;
> -		if (use_master_clock) {
> -			host_tsc = ka->master_cycle_now;
> -			kernel_ns = ka->master_kernel_ns;
> -		}
> +
> +		/*
> +		 * The TSC read and the call to get_cpu_tsc_khz() must happen
> +		 * on the same CPU.
> +		 */
> +		get_cpu();
> +
> +		tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
> +
> +		if (use_master_clock &&
> +		    !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
> +		    WARN_ON_ONCE(!read_seqcount_retry(&ka->pvclock_sc, seq)))
> +			use_master_clock = false;
> +
> +		put_cpu();
> +
> +		if (!use_master_clock)
> +			break;
> +
> +		master_host_tsc = ka->master_cycle_now;
> +		master_kernel_ns = ka->master_kernel_ns;
>  	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
>  
> -	/* Keep irq disabled to prevent changes to the clock */
> -	local_irq_save(flags);
> -	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
>  	if (unlikely(tgt_tsc_hz == 0)) {
> -		local_irq_restore(flags);
>  		kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
>  		return 1;
>  	}
> +
>  	if (!use_master_clock) {
>  		host_tsc = rdtsc();
>  		kernel_ns = get_kvmclock_base_ns();
>  	}
>  
> -	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
> -
>  	/*
>  	 * We may have to catch up the TSC to match elapsed wall clock
>  	 * time for two reasons, even if kvmclock is used.
> @@ -3404,17 +3416,32 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
>  	 *      entry to avoid unknown leaps of TSC even when running
>  	 *      again on the same CPU.  This may cause apparent elapsed
>  	 *      time to disappear, and the guest to stand still or run
> -	 *	very slowly.
> +	 *      very slowly.
>  	 */
>  	if (vcpu->tsc_catchup) {
> -		u64 tsc = compute_guest_tsc(v, kernel_ns);
> -		if (tsc > tsc_timestamp) {
> -			adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
> -			tsc_timestamp = tsc;
> -		}
> +		s64 adjustment;
> +
> +		/*
> +		 * Calculate the delta between what the guest TSC *should* be
> +		 * and what it actually is according to kvm_read_l1_tsc().
> +		 */
> +		adjustment = compute_guest_tsc(v, kernel_ns) -
> +			     kvm_read_l1_tsc(v, host_tsc);
> +		if (adjustment > 0)
> +			adjust_tsc_offset_guest(v, adjustment);
>  	}
>  
> -	local_irq_restore(flags);
> +	/*
> +	 * Now that TSC upscaling is out of the way, the remaining calculations
> +	 * are all relative to the reference time that's placed in hv_clock.
> +	 * If the master clock is NOT in use, the reference time is "now".  If
> +	 * master clock is in use, the reference time comes from there.
> +	 */
> +	if (use_master_clock) {
> +		host_tsc = master_host_tsc;
> +		kernel_ns = master_kernel_ns;
> +	}
> +	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
>  
>  	/* With all the info we got, fill in the values */
>  


