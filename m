Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95943CA82
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216960.376767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfit5-0006Yb-2M; Wed, 27 Oct 2021 13:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216960.376767; Wed, 27 Oct 2021 13:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfit4-0006Vj-Uy; Wed, 27 Oct 2021 13:22:38 +0000
Received: by outflank-mailman (input) for mailman id 216960;
 Wed, 27 Oct 2021 13:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfit3-0006V5-J9
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:22:37 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9642b59d-ee01-460b-90c0-08173d1a9a57;
 Wed, 27 Oct 2021 13:22:33 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCThLl016751; 
 Wed, 27 Oct 2021 13:22:07 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fyjrj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:22:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RDLXCD187936;
 Wed, 27 Oct 2021 13:22:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3020.oracle.com with ESMTP id 3bx4gcpjjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:22:04 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2979.namprd10.prod.outlook.com (2603:10b6:208:7f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Wed, 27 Oct
 2021 13:22:00 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 13:22:00 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SN4PR0501CA0129.namprd05.prod.outlook.com (2603:10b6:803:42::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.12 via Frontend
 Transport; Wed, 27 Oct 2021 13:21:58 +0000
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
X-Inumbo-ID: 9642b59d-ee01-460b-90c0-08173d1a9a57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=gEiO1xZ7xTyZWBanmfxng6/b7T/MSvtCaGAWP6qE6Ow=;
 b=HYZE37+4Uy9qdC3P4YoMWH6RhV5kgiARU3psiLfqJ6jgdHHdfZcGmM4H62+2jz5oedmI
 wV6HNu1FusfjVD/gkpRTTdIdRMtpEG1aICaJUMJT/dbPxVdyzB4VQx4Q2Dzkh6Vzp+VK
 45PHKqQOwyrFtWQLDVnUzVe4JY0CZoLArHtpQ98K8ZrOVb4djwz1Mh8j9Pgyb+M832OX
 d3jEe5MZn4a4nVAWmFI0x6dfCzO+zRRtnj+WE5f4KjICE0GW8hbNjk6z3zjADnt7WSia
 nhMlgaLac+qUt0YRFUzBUoD99ciDKF5hZriOKWBQX9+/sgBgPcPzHjPffnLXzLgLRCOO rw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrPdJ0PEZzxInUP96LPjRuJr44d7VigoQXYMnQzAOxejVXfHFjiu3IjVCU9GWPcFrPyDLDBeKyZBENaDfUcdB/MTCm3OZ61fKPodxxGl+1MVBy2BcmvS2QhMlYAmpxPPvEpnFEt0xnTq2FuPzoFVTzfaQusd45S31Ald9EBeYoFLkx+R0yeIOvUHyctaFx9qSln9aTB1MVi4Dix6X8LRejfsPr+2eiq/rg5NTfKq6UYTOcdl/CkQKg8joizYxVkL/VhcbKxfdutQoeQmnic6BsYJIylQDKRixuH5hSMKl2ezKyT7dAm6TnL7X1zSWUVnCN6qUwI35AkpKKXcEo3MYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEiO1xZ7xTyZWBanmfxng6/b7T/MSvtCaGAWP6qE6Ow=;
 b=Go0jVe78DZuBwguk5EZwjz281vApnxMlGvVOMqWu32Z5IrsIbXWLRSyONL6Hj0u4NGxtkyCmHuaEe+gOPjEV//u6HDJPAaYgzXsgaYxPeCor2MsuMBJuxHfVB/bdBBq2ipuKdAoBBuu+YKbfoeq15lQhgvNet4BJu+yVcOn70RaOAubZmlzCsOpG2dGmNbsGJIyEuoc/fhu5PBdkujmGON+QRzyeGs/Sojlxyv24Xl2hkT1eWNT2XRKS5pCaf8datFdS+tmCtJQ5Yq3etwpQO5cbK4l1/0ZJ8dwfqx5d0/kCvITCqRx5mnoM+CSqlC/lPfwYFlWOgogifAzCrtVIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEiO1xZ7xTyZWBanmfxng6/b7T/MSvtCaGAWP6qE6Ow=;
 b=KB6XeR1vvrDYLrjoaAbmVwL+blLIHmBU08HO5uQBKx8ul2VHALEO+nosyYjQ1TXFcF50fWdMU3dSu6xa2A5M8cIN+vSa3S+Qaiji6LAlyyNkGQs9RB2rlOCKXJOk7MTQkr9MweSufxc50zUJrdyz/MmMNJKvdvK00Y1do/jxe8s=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <7f6dd8b6-8b6b-54a7-35d6-da78b18ec59b@oracle.com>
Date: Wed, 27 Oct 2021 09:21:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v2] xen: Fix implicit type conversion
Content-Language: en-US
To: Jiamei Xie <Jiamei.Xie@arm.com>, Juergen Gross <jgross@suse.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1635233531-2437704-1-git-send-email-jiasheng@iscas.ac.cn>
 <01fd083e-e9a6-c019-0a74-bf28b2982412@suse.com>
 <VI1PR08MB30564CABD02DBB0F17BBDCDD92849@VI1PR08MB3056.eurprd08.prod.outlook.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <VI1PR08MB30564CABD02DBB0F17BBDCDD92849@VI1PR08MB3056.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0129.namprd05.prod.outlook.com
 (2603:10b6:803:42::46) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c119ab2-2e95-4b64-09e3-08d9994cc22f
X-MS-TrafficTypeDiagnostic: BL0PR10MB2979:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB2979C8E9F8348182922DACB48A859@BL0PR10MB2979.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vOTgBT7lBDEIH9Qg3oV0gPWbODaIa62AN7Y+N/tEI8aePO0H8dVFjdspn2WBxipRwQhIJpN7LzsCmQUlUxxgFZSkzQYOQ37NHpnRYR0L09jFc7BygSGohCl16TUZSb0yw03V8eQf0lHnJHOV7Rw0mgjR+BQmBzbo/IW5fJL2537xwie3D1s5rwFfB0ivLEAH1+sn4B4+fGWjHHwgeGHR7aSVlKNSV77EHaIcL5rpw1dNrkgxTgFBmsS/1426z0m6RisxVBeEl7B6AiM12pg16F7yKW++Pw3t3kp57rOcxPQAkixEsi3+UkxfL0wZzaDeRWCEUjS0ksLyQ+gWq9azTlttpHx7zwEbiKgx577sEKqd5wTiVQA0hBOFKl5vlY64HtP6AvY+CCTGEz0vMnBp2b2octYCrhsGaLk1dVsffY/0ElgeG1BebuPAcLEY3fQSWiD9AK2dJsVtafLbkyo1DC7Pl3DGwrKRYOdf1LpDCS5IzwCD1ZUoDWBpuX/g1FdX428vuk5gfloAVB/D4pGnkRuXDofK6bvt4rMDlZtQ/5+XVW7MMk0n/AI9cAjoUDJGcmBwZSdWllT4Q0Z0QHK4L48wUfku8I9/vRPGCCyV9BvnUiuB0l92rfnkwecGe17LT3EUMoYv19iASBpiTpeeayl3aT9bCyNU62gzVGPIt43R2vPNOr4zZKwz0jQxSmXe47F6UM1J2hf/BbbG7yrj7M9z0VccuFS54Ijn564K0Do=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66946007)(83380400001)(316002)(956004)(66556008)(26005)(31696002)(186003)(66476007)(16576012)(5660300002)(54906003)(36756003)(53546011)(6486002)(8676002)(38100700002)(4326008)(2616005)(44832011)(110136005)(6666004)(2906002)(8936002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUMycVhyb3cwNXRSS0VmRmdkNkhSem5hdlNTalV0Mk13VXRjMHJiei84UkJY?=
 =?utf-8?B?Yk5jWVRsczA0WkpmNThJUTJ3MGd5M0l3UDlzSnVZOHk5WVJ1eHdjanhEcXE1?=
 =?utf-8?B?WG44VCtLVUhIeWxnNUlvajViV2MzSmhpWjBWMFdGNnZ3OUlrOXlZeEkwVHRC?=
 =?utf-8?B?V21nYTJNVzBOY3F3cXJHaHlyTXYwbkhldit5TUlyZTdPNTgxcHB1MGVYeGc5?=
 =?utf-8?B?TERDbTE5SFhvZ1FzdFE4eFlWbnJwMnQ0V1pDNzBRM2hxS0lKZHgvbDZVQ3kr?=
 =?utf-8?B?Z3lzU3NtdmpGTWhkZW40bXRhcDFFaTBmby9LMEw3eHpSZFk2U29lRWZtMUZn?=
 =?utf-8?B?UUhkSHh4cXV0SWhOS1pVbkNGcHVUSDJoWVllVUk5R1FuY0NtVGVuM3RBTVpM?=
 =?utf-8?B?eUhvdXpNQVZBWFQ5OFJnRzhQSjNQODNldC9TOFF0MDI1RWxFdG94TWR2azNM?=
 =?utf-8?B?SGdrb0hQMHhhVU14UmNseXIwREp3YUFySTRENjBZeFlNS3B3c0NBWTYzMVk1?=
 =?utf-8?B?bGNlYUdEN083SmFISnVmUjc5TXlBaHFCQzlPYi9jcmx6OTNHSGJ5cEtkUE13?=
 =?utf-8?B?TnZQSU9nWGVBSmRTWUhJUXJnaUc0TGZSRXVkdGpzd3dveTVxYVNoMFE2UlJ3?=
 =?utf-8?B?cDU3S3NDQUwvVjZ1bmMvK0ptMlE3VWl6dUN5ZElqeTl0a2J5NkpDLzNqSFdM?=
 =?utf-8?B?Y1Y2bXkvUzVBdWxneWZNaC9sSzJjek5pVXVtWThWdXF4SjF4Vy9iWmZIRVZS?=
 =?utf-8?B?SXR4ZndycXhpUDdoUVVVSHNMSnpYd0Z1Smx2YVVCTkx1T3o0Q0U3ZXNjaDdJ?=
 =?utf-8?B?UUxzNXFXbk9xYXk1S2M4UWxMOTNvb3h1dlZPOFhOUEJnY3dyUVp2bVBMVTYx?=
 =?utf-8?B?WU1wM1d0Ylp3VVp2ZXFBK1JtT0p1R3U0dmhDQytYZUVyWFlHVXdtUnRYSE9N?=
 =?utf-8?B?bGl2QmVSSDNSRXNEMXhRaFhGS0hQL09VTk1FNTY0TklVL2NERjgzTk5mbUFp?=
 =?utf-8?B?dHVOaUd5STdZcUcyZVZJUlQybTQ2OHRTbmFXd0orWjVRcDhaemk1eWxtZzVH?=
 =?utf-8?B?ZVN0Y3duaDhUV2ozelJXWHRqakM1NTRXZ0V4UTAxMGdlMWtZY3NVcStiMGZa?=
 =?utf-8?B?NnplVTdyMlEzV1NzR1A0MWxjYVFYcUVtc1AvMk1MaFdQTVVDRzFSSTB3VUkx?=
 =?utf-8?B?OFBzb0RQSWNzUVUxazBhdWFHVHk4REFvRW54Q1lPRTl0YnBXTXpZNnd6QVFx?=
 =?utf-8?B?ZXhEQkF3TXMvaVlrZEJ5cHZqNEh4SkUwa2hIVG1wcy9ZQzFod0g5Q09CSmc3?=
 =?utf-8?B?TmpRNm1qNHcyQXJ0WE1DQUxzc1NzdTQ5OGU1T1lPOVVUOGh0SFpoN1JzNW04?=
 =?utf-8?B?blFqOFBGV1phN0NOVHhJUlRqVEdYOU1EVkpGT2VhR28xNzlZdnB4YjB5UnFZ?=
 =?utf-8?B?UjZ1S0pUUkxMNDJUWm9vTHZpaHgyNWRIL0RYR2hlOTNvSG1IOXlXQmdPcnhs?=
 =?utf-8?B?NFBXQkRickNOTEdLL2ExZ2pDTnMyTGNMNWpkYUszeVBEQTRaK1Eya21Ib2o0?=
 =?utf-8?B?TkprZVZaTHdCWXNQL0VRTEU5ckNBeEJSd3BqaTJzSmFzaFozZGJkY2ZsZUtr?=
 =?utf-8?B?NzdQZEhBeGVzYTdyVTQrUFhURThaVnpqU2x4V1RJd3A0VDFqTHgxUDYrUVBz?=
 =?utf-8?B?OXVJMHpsMENQaXIwN3hXRlBYa003SU0yOXBmTTVFekhKYXM3eDk2U3NCcmxp?=
 =?utf-8?B?V1o4REVXQWtCbHloa0JzSU5MK1hUS3BTMlZFZklyeTd0SVNxUUFDZnpWSGw4?=
 =?utf-8?B?OXVsSnIxMmJwR0pzclVXa2lZUXExbGdlWTVua1NwUmdUTHo2bFNYdmlTWkUz?=
 =?utf-8?B?SlZ3bWxUcmJUa1l3VWhTUXJNUk1NdUR0dnRDYUkrbXc3QXY4cjZTRzdmS3VS?=
 =?utf-8?B?WEk3djVwOFJueEhhVElTb2NMMWd1NkVOZTR5QVFIZEpVbFp5c2xqOEk1VFkx?=
 =?utf-8?B?T3lOUnhoRGRMTnYvMUhJcytSNUg2UzdyQmF5TmkxSmZ4WUMxYzNyUEJ1TWpT?=
 =?utf-8?B?dDBaSkg4K3AyVjRVWWp2NktFMVpGemdsZUxHdUc1YnlyekRpM3NSUVJiSWM5?=
 =?utf-8?B?cWxVR0c4ejFDZG10YnRORS9kSVJyMmZnTTFsbG1NZ1pWRHRSSnVZNS9lOVY4?=
 =?utf-8?B?YTVUNWNoSEV3Tm92cWQ1OWdVelhMVFlFdDN2ZTcyRUpiR0E1NE5sRjlNM1VX?=
 =?utf-8?B?MnNVTThaN0p5WVJzYjFWL0QyMXlRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c119ab2-2e95-4b64-09e3-08d9994cc22f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:22:00.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6E/U6TfPsNHQbL0DfTJ7ngyZbez1QtpL9n2LtAt1thRq+m2R47RligHm8/BAOsjTYSOsRhq+LWEYGxWo1IvfJ45h9tdKebGL4YfAn+JPzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2979
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=945
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270082
X-Proofpoint-GUID: Ud_BLW9H_LV1RsX4s-gURqnzf7Mm35-T
X-Proofpoint-ORIG-GUID: Ud_BLW9H_LV1RsX4s-gURqnzf7Mm35-T


On 10/26/21 5:59 AM, Jiamei Xie wrote:
>
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Juergen Gross
>> Sent: 2021年10月26日 15:36
>> To: Jiasheng Jiang <jiasheng@iscas.ac.cn>; boris.ostrovsky@oracle.com;
>> sstabellini@kernel.org
>> Cc: xen-devel@lists.xenproject.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v2] xen: Fix implicit type conversion
>>
>> On 26.10.21 09:32, Jiasheng Jiang wrote:
>>> The variable 'i' is defined as UINT.
>>> However in the for_each_possible_cpu, its value is assigned to -1.
>>> That doesn't make sense and in the cpumask_next() it is implicitly
>>> type conversed to INT.
>>> It is universally accepted that the implicit type conversion is
>>> terrible.
>>> Also, having the good programming custom will set an example for
>>> others.
>>> Thus, it might be better to change the definition of 'i' from UINT
>>> to INT.
>>>
>>> Fixes: 3fac101 ("xen: Re-upload processor PM data to hypervisor after S3
>> resume (v2)")
>>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>
>>
>> Juergen
> [Jiamei Xie]
> Reviewed-by: Jiamei Xie <jiamei.xie@arm.com>



Applied to for-linus-5.16


-boris


