Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D86415301
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 23:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193088.343925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTA2A-0007mK-0s; Wed, 22 Sep 2021 21:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193088.343925; Wed, 22 Sep 2021 21:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTA29-0007kP-Sv; Wed, 22 Sep 2021 21:44:05 +0000
Received: by outflank-mailman (input) for mailman id 193088;
 Wed, 22 Sep 2021 21:44:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Psju=OM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mTA28-0007kJ-6N
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:44:04 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e59f317-743d-49fd-8dd2-f01cc7533c02;
 Wed, 22 Sep 2021 21:44:01 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MKdYOt006658; 
 Wed, 22 Sep 2021 21:43:49 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b7q4rfck3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 21:43:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18MLepd8093386;
 Wed, 22 Sep 2021 21:43:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by aserp3020.oracle.com with ESMTP id 3b7q5bac5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 21:43:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4224.namprd10.prod.outlook.com (2603:10b6:208:1d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 21:43:46 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%8]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 21:43:46 +0000
Received: from [10.74.85.221] (138.3.201.29) by
 SA9PR13CA0005.namprd13.prod.outlook.com (2603:10b6:806:21::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Wed, 22 Sep 2021 21:43:44 +0000
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
X-Inumbo-ID: 7e59f317-743d-49fd-8dd2-f01cc7533c02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/IBKupBcFxnA99WDInoeyscYGjc3/7VEYIAS9LPOIHg=;
 b=upFy+j1m4Nd88pfLpgkIUePVLNkdDKzs+33fijchFCZ60T+amR2x1Ndr2j4KUH3MpiEU
 OjMywOIdc3aGd5fjOJWca96X17O3xW4TZxG9Ax4AkyFMua7G4uqW3bG7zerFmVtVvpaN
 6ZepEAikfcOeSaP85USJWjWMUfMSrKlXS56/AyTupUgudm52FcAw9YeiS2nCJsTZEa+r
 sv+Jfn/eMMemUfYDgrvCsWk4B3gyoRlJAZDmMZSPWilfXKg7iIASABvAaYP6wV8e2Gei
 4xkU3JIcpUdo+O0PmYp3uMc2zG2ycQteJ+6tXfdphEASkF+IMoYmvGkTIktcYThKvk3q Tg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjvgHweuJNeyV6Aeky2/DWzbcg7Vf2BApM+ip7v6Xi9DI4UNAl/WgYeGo1GJK+n0ADOQ9vmV7VmtZtOJINE5EENyD6Vyv2ZCN6d433BaI8R7fzecacbjxCayONfhM3CbKznEcLmewBKCIsg2Z6hRM6ZAoMe+SizQltFHrI43fC112o5sqj1kJQCwuaySjfaBj0l17pVjkoSMcjelzbnMXe4oLsDSgHtlEs6fTlp/q7uFnAYpmfSOpmA+vdya9dRXHC1BBI8IqmzNT3LP8wNWvMXe9kPLxXg11iBzQEwbQBMyO0XNYk0LV2WocLPhfEtFuwpP2dblLDpDrqgwbBbIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/IBKupBcFxnA99WDInoeyscYGjc3/7VEYIAS9LPOIHg=;
 b=cZUqQ8aXsQ8oSzCrPsydmaP6aYfLN4Q4dRNLD4X9UmEv2cEjNZbeLm6iC6bFxcYF3WmLH7Hh41KnJNgFfI1crD6/Teu/OsVkzvsxD3Vf5MhwzqT3SbwmweRVRVcWPK+YhYUnEGrHM1k/q5xniB//LsQ9LLAGEdcenVLA/YI4a+tDR1jdkPWxZ9+9UoyWQ99HvhrEkM1kf5miN1NzSYFfjytGFbmdW4MvSrUnHcAPqGZ9JH6q1Yt0SNim5RBTqdM+ZzJM3MYgBqYSHUR6C02zy2U8hOfq7c23gHzDcFetHK03tS0NyNO4U7yRG8chRTfKXlc2ppxoryVjaS4N/Vh96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IBKupBcFxnA99WDInoeyscYGjc3/7VEYIAS9LPOIHg=;
 b=YuvWCdel4iHkJHFRJssOndvAyasCaZ+WM1a5A/qL1Xrddf1FLoHKLETIi+LXdcvs44i1yMmyrURjE/7dPfMxFDxBAE3jfWiDLO9nb8aUaR8LxeeQRX241IeGUW39ggKEwOGDLY4pXGoUXO/NZoWXlJLPeiCisb1XQs5kCL2GoGg=
Authentication-Results: zytor.com; dkim=none (message not signed)
 header.d=none;zytor.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 1/2] x86/xen: remove xen_have_vcpu_info_placement flag
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210922103102.3589-1-jgross@suse.com>
 <20210922103102.3589-2-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <212d31cd-650d-27c6-b523-fd4f686872d1@oracle.com>
Date: Wed, 22 Sep 2021 17:43:41 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20210922103102.3589-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:21::10) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df98b6c0-31b9-4dcf-6d7f-08d97e120e57
X-MS-TrafficTypeDiagnostic: MN2PR10MB4224:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4224494F85C9FDAC2630097B8AA29@MN2PR10MB4224.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F4wsWfDh60UMGeswttrET2QoJwY8m6uKD+w9J3r7t75r0y2eqV7HdLV0hieuwNar8OmiSywqoLbLNA6M5XRxt+TifBDAXwuVkJ+gZT1hR+8D5Tr5a1sOpKRYGYIfADQoYDWkx/4Lly5uggIlyQwZBfjZ/8FwYZO3uJvpgg/JJl6sA16LSlwr4AzdMunthRt6kkY8JM1nxLoKsXpQ/tFgBSUeywyCj6O6AMGpGlTIwYI/YzZNcPNhpoCeVD3j7e5STxieKj4+/nTJio1cNkCM9kbhweCU0HmADqtcbQwZZTmuuZIr1iksfLL0wFA/rzyP3mQdkzrUHF8Ofz2mK/BdhEzQOf4YcejLws8A4VfX+B/2EdgyTi8TLf5gHb6sfqqXiyNLSxO87pJgQpQcauIuNcL70t/fEuVTTlZyKUYum1T8u+i2tzIGadxRPK9S0zyOBFyuP46qqBiHAN7wrCCOWF+i+XWzGatrsEbAjRalQXXqk65240Q6bBUN4gwL9EPEQoy8tm+WLJZGXRFgz4sDux92nGrJwrzKztmoBYf8bmioeqWBui1skQOopothaqGO9xpbny9R/32a9rDGaWxqa6bYQeFTZ808p/LmUHzDriSDw7ucomNjvoJg+Ea8MejXAyskTAwWXU6hzYq131xVr3UKBt/YtCaH/4RunVGlLCfwNwfvoDz2xZ4b9EL/dU11HGQQo8lRXAgVQfcbz1Znj+VmpKBV3v1NAD6jWxFpOdEG24lCIsl6GKYiUMh20wJ7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(16576012)(38100700002)(86362001)(956004)(54906003)(36756003)(44832011)(66946007)(2906002)(26005)(53546011)(508600001)(83380400001)(31686004)(8676002)(5660300002)(66476007)(4326008)(66556008)(8936002)(316002)(2616005)(31696002)(186003)(6486002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHh4RlRmYi8vKzFiTzd5bWJtSWhLSmIvclVDb3FEL0lYOVRhWmh4Q1MyU1Vz?=
 =?utf-8?B?SmdEM3BwMVlzcTdKK28zd0dJcUZKVkZ6SWxnTHlrM2plOUI3Qzk1a0h3Q0pQ?=
 =?utf-8?B?NExRdXVMQzRsd2E4TjJqNFMvSUNudnJzb3ZsWTR0VEtYTlh1YS9JRUYya1p0?=
 =?utf-8?B?UXRBZGozV0NGREhJOElHOE5JRkhWSTlYZ2c1RUZ0N1FkS1hmS3Z2TS9kZmlO?=
 =?utf-8?B?TStHYWMwUmUzV1Z5SkJYenFTVGE4YmFqdGR6RW1OZTRFMVVLNFQrK08xWTlK?=
 =?utf-8?B?KzlyUS9NYStZNFlPVUM5eE1tUFJqbVBXemJkclZVWWViV0dRVVd4d29qQm1m?=
 =?utf-8?B?K3YyYVZ4WUlGN3ZFd0p0WXlreWFwdmkvU1FSam45eCt1ZFBOMTBpUGdlZVZR?=
 =?utf-8?B?aXBwWk5mL3U0enN0YTNSMTRPRUxKaTNKQ2EzZ2srMks0bmZxbFlNUXNMMzU2?=
 =?utf-8?B?bGRRR1hRck5SUmdIR1lMSE43bFJIS2hhS0UvUE5ZaWFHMnRHVVVzQUpJU1Za?=
 =?utf-8?B?YnpZMnFEaERQdnpwbFdQNDlVWTBvc3pDaTR5eDFBL2wxL0xWdFRJWlpGZW1m?=
 =?utf-8?B?RzY3b0hjWE9JRnEwRlUxVFZxSm94Nk1WV1lrdFdHcitsRFo2dk1FRi9UOTFK?=
 =?utf-8?B?T25RbXNoK0lGSmN2dGM0V2hFdUdqWVZHazVaNWFlMGh1bHpqckhjRXJ4dmtD?=
 =?utf-8?B?ZFIzVWtjeFdaRlQ0M2pFMlJiQ0F4ZTJST2hOZUNGOW1keE1WNGQ5TTRLL1RT?=
 =?utf-8?B?REVabUNGZnAwWlM3M21tL0Y1VTNLY2dYYnJPeGZlV09jS2dPZGptUm9EenM4?=
 =?utf-8?B?NEVNbVZUL0s3Wm0wTW94Z1dBeWVwK3RiL2xKWktrbXBRWHIvdHNUbEZoM05h?=
 =?utf-8?B?RFNFaHBqL3E4M2swT3p5OEpjY3FCbE1TT09YdDJxQjhTMVVDb1kySnlCQTQz?=
 =?utf-8?B?cnhHUkFGKzRLQVZyRHYydUJSRUF4QVhZMXFRcUxmN3YxU1huK2o3V0JPVmJk?=
 =?utf-8?B?Wm5aRE5vSEY3M2J1ZU0wNTYrcTdjMWlqS29XR0RTdnhnN1UySXE1bkROeUIw?=
 =?utf-8?B?MGdMT3RLZExWKzBsV2d4VXlickVVWlBYY3Z6MTVyU3B6bFc2bEU2Tno2cnF4?=
 =?utf-8?B?YUxSRVQ2TTErMzZwemROQ2FSeVkzS3dldEk0cDNsdTVvME9Pa3pyaGIwckRH?=
 =?utf-8?B?emFtLytRWkRtandyYllnY21oSEhYMkh4bEVaSTlPOXRmTUkxb1k0bnlZSVE3?=
 =?utf-8?B?OE9nTFBEWTE0Q3pUTXNhTHQwRGFLVGJUSHE4Um5EL091UGtXWEc4a1VrTmRL?=
 =?utf-8?B?Ti9BUXRqZzFJT3NkTHVCODJwV0xLeHRXS1FKVmhvdU5la2FsaEkxcUp0QnFk?=
 =?utf-8?B?RnBnQ1lCTEZ6WDljT2pZWlBOQmYwemNQV0o3ZVNCV2gwbmJCK3RPWGM1M2Nj?=
 =?utf-8?B?Y29WTUYrd1hpUFVTNmdjYWY5TWdKMEVqcnBPb3pLeGxLU3JMd3ZYNE9Eclhx?=
 =?utf-8?B?VEc4YmdqTDBWSk02UkZHRUJSaFZHUGlBZnFTK3BTTzNEMHYvd1Zwck5qVUpn?=
 =?utf-8?B?VDdaUFN0OVg1bE5DbXh2OHNLQUlUbjcyNjF2Nld6Z1ZqVXVZY0hheDAreVlr?=
 =?utf-8?B?eTdNMXNPSVdqL3R0UnArWjM0QnRHYlBDaURSU1FwbmoxQjRlL2dsc0VuSWpO?=
 =?utf-8?B?TzRGSS9TOGFtWmI4cGdGU2tpZTczZHR1czgrS2dXUTI2R1V6VlMxWEJEa0tj?=
 =?utf-8?Q?yugJHjSbJSTJyWmgzXP1/b64oegQ8EocT+71czl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df98b6c0-31b9-4dcf-6d7f-08d97e120e57
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 21:43:46.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brHhu/MwxG+aOTlpMBiNKbCJcW2RIpfjXKuaSKYsKZDVVY8VPpTWgLGOjhPL8Dm/jwdCqz0BwFQNMwo+LGjhXfbOp/x7EwVAI+Z5MgLhi5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4224
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10115 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220138
X-Proofpoint-GUID: PHsEnjZ49UU51NquE_VFO0qhRzeGKNqm
X-Proofpoint-ORIG-GUID: PHsEnjZ49UU51NquE_VFO0qhRzeGKNqm


On 9/22/21 6:31 AM, Juergen Gross wrote:
>  
> -	if (xen_have_vcpu_info_placement) {
> -		vcpup = &per_cpu(xen_vcpu_info, cpu);
> -		info.mfn = arbitrary_virt_to_mfn(vcpup);
> -		info.offset = offset_in_page(vcpup);
> +	vcpup = &per_cpu(xen_vcpu_info, cpu);
> +	info.mfn = arbitrary_virt_to_mfn(vcpup);
> +	info.offset = offset_in_page(vcpup);
>  
> -		/*
> -		 * Check to see if the hypervisor will put the vcpu_info
> -		 * structure where we want it, which allows direct access via
> -		 * a percpu-variable.
> -		 * N.B. This hypercall can _only_ be called once per CPU.
> -		 * Subsequent calls will error out with -EINVAL. This is due to
> -		 * the fact that hypervisor has no unregister variant and this
> -		 * hypercall does not allow to over-write info.mfn and
> -		 * info.offset.
> -		 */
> -		err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info,
> -					 xen_vcpu_nr(cpu), &info);
> -
> -		if (err) {
> -			pr_warn_once("register_vcpu_info failed: cpu=%d err=%d\n",
> -				     cpu, err);
> -			xen_have_vcpu_info_placement = 0;
> -		} else {
> -			/*
> -			 * This cpu is using the registered vcpu info, even if
> -			 * later ones fail to.
> -			 */
> -			per_cpu(xen_vcpu, cpu) = vcpup;
> -		}
> -	}
> -
> -	if (!xen_have_vcpu_info_placement)
> -		xen_vcpu_info_reset(cpu);
> +	/*
> +	 * N.B. This hypercall can _only_ be called once per CPU.
> +	 * Subsequent calls will error out with -EINVAL. This is due to
> +	 * the fact that hypervisor has no unregister variant and this
> +	 * hypercall does not allow to over-write info.mfn and
> +	 * info.offset.
> +	 */
> +	err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
> +				 &info);
> +	if (err)
> +		panic("register_vcpu_info failed: cpu=%d err=%d\n", cpu, err);
>  


This is change in behavior. Before if the hypercall failed we still try to boot. I am not sure we need to worry about this (since it's not clear it actually works)  but I'd at least mention this in the commit message.


-boris



