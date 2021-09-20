Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB704126E9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 21:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191146.341076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSOzO-0000eO-FO; Mon, 20 Sep 2021 19:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191146.341076; Mon, 20 Sep 2021 19:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSOzO-0000cU-90; Mon, 20 Sep 2021 19:30:06 +0000
Received: by outflank-mailman (input) for mailman id 191146;
 Mon, 20 Sep 2021 19:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AtBo=OK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mSOzM-0000Ji-3m
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 19:30:04 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4031643-1cdd-44e6-86c4-3dae62ba97a0;
 Mon, 20 Sep 2021 19:30:01 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KI44sm026691; 
 Mon, 20 Sep 2021 19:30:00 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b6426cf7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 19:30:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18KJJuGo041061;
 Mon, 20 Sep 2021 19:29:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by userp3020.oracle.com with ESMTP id 3b5svr5n48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 19:29:59 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4160.namprd10.prod.outlook.com (2603:10b6:208:1df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 19:29:57 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 19:29:57 +0000
Received: from [10.74.117.74] (138.3.201.10) by
 SA9PR13CA0133.namprd13.prod.outlook.com (2603:10b6:806:27::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.7 via Frontend Transport; Mon, 20 Sep 2021 19:29:56 +0000
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
X-Inumbo-ID: e4031643-1cdd-44e6-86c4-3dae62ba97a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=twx/poF39noCLQs4aAkBnBA9IKpiTltwMBDfusJ7u+c=;
 b=Js04bF9R3n3f8X65KxGtwf4q/4ZEqYrv8MMsZsSw+x+JqYc813FVQVqaOCEExmkJXH3U
 n9y2sCV9L0sd3VCc7LdeqVGYJ88cpnQFEgfyIA68f7f+r5euO2TIBvtLtH9BrGLS0oCf
 c5I7ynDxMnUU15VBm7kSF4aWkC+VGau7i2iHgVOMIbFkqS85RpGz2TlaJJ6GTL8lvvm7
 vVhsbdQK4yf04yXvyTGQnkAsMdoJpkMYrCRLELMx+RysXZDiu56VsJHf3VwHsIf7uvCb
 Cjj2IdtDTI6wDas6uJN0ZOD0blGpiLq6grIDu6Ri03IDK1Ssc6s3Lf8KKDQog+cyEbxq uA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTN0oDPsNO7zVLU+nh6/JcEc65bV5TopVBBna/TYRUNGPW67FV5mw6EnBUrp3A3qAFOLpyjLXHaFF0ReA2/Za87MG/3Ita8kmAuXo79am225QvkiOXHXxBikOlDQRrYyNbv0L482LMjRdcinN7RHeedKRblHhzN/gN8oQpZsipCFEuYWumAj7WknN/uU6ueC73piOQc/HOfTzXJsY2KuqRKWHzB/s8FXPqn8xn03J8+L2Oy1ICJv86ZnNcfZ1zV+/SUa5J2dkwJsXXqiOWkQZ/KdIJ6W7kuQawKkeVBkDxWFMRV/bBukDhzTo0dkwRy6/g6nqygDFBeBU+xhRFCFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=twx/poF39noCLQs4aAkBnBA9IKpiTltwMBDfusJ7u+c=;
 b=gkhp67FtZoNaPT4fn/MMbonagAbedxFeqZsd9voWTHVDpJ5EDlfkogf9OysWGlcHnZVrgDAaCAN5URQx64hUqIBemksnTyXAwyWD4Ldszh7feSOaLaYgrBNC0EHo+W3kapGrex8tFJdDEQYpRTq5E0iH3faiD54/0suoJ1YB0JjPsOaZT7qobXSX3rm/IzdEOiOk5QwBcvPK1uBfn4O4fY1sGb/8U0PJHpxKj88Tx20ci9JDmoZYRL5YOP0wXehGJD1a5k8fUMVj88mLrheQPZVBt8oBFCUlrOng3A2M0VTc1gONJAcmNS00jZvYnPjkj5Jk5BRKuWGHLZFq5M6fYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twx/poF39noCLQs4aAkBnBA9IKpiTltwMBDfusJ7u+c=;
 b=b49yOdN+VEcegujH0+nSWKIWshjqD1Eelb6s51Q4Z2BBlyIrMGfQxU057gh6jV+cKRtT5QX4io98v/6tlzZigQNb95vSdgtYBpzyY7TBscTfrCqNna5daeH0Gvhou7xxtBON9cCTljUykV1rgVJ/NDRTOMkwUY9BjOBVxm1kpgg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/balloon: fix balloon kthread freezing
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20210920100345.21939-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <1b13768c-d2ba-196b-c3ea-8f9375bb94b8@oracle.com>
Date: Mon, 20 Sep 2021 15:29:53 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20210920100345.21939-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:806:27::18) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a317567-b3c4-4ffa-5855-08d97c6d07b6
X-MS-TrafficTypeDiagnostic: MN2PR10MB4160:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB41606534071285001ABD41B98AA09@MN2PR10MB4160.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:318;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RjZqus4HPjkDDRmxbWY8tgtBpAeGNEODsiCwh6urgqWVGZ4QAoG+veaG0ReisTU4mIVzhy8Nkp6ZIwg25vk4P3zvumMfevCXlTS5ZE5Ck+FDlWQL34/9nO3TKxTkHB3aNii0Oktkq7ESAXOy+/3QZaaFVJ7zW1rX6onPF/Pb7oBxLUnm5yrB/uqwSG/krNaUiiPkpV5xFPGGiHpnRqFDxLJ6vtKPcgwOa+eM7wvbMFFNzndcc+S2qb1eSLojYLmzCpkiBVkCkSZ32XZZbHq69fdNGmNwLqvjd/99OGZESfHnEiNjwSbi7+5gPfPKxqrEdScLggpYK7qC9qBd2fF6B3v/e702hiIjR6suztVr8mHBmfzjAh45aDqkHO22/1H06A70y5L4fF+HLyPfSEkCsfKwuPfM/91DFhEZUfXUbzBd2e9khElH8oDXFAclXOcAjC/9rieygChWW7lLn1/yqo6XIJBB2ZKABt+MJFIp8LqM0jtgLXkRJUeAAN0WwG4APXSUzj9Lsrrd6/1gUekxeeS77lWkubNs9XdHODS6b1WfmL9hXCYeaeMWQQAjeixq9rRcfOijTCbumlIuSAuWJctUOR/nxlLR5s8dcoug0Igs+wH0aGC8ugu8by636i7TU0CJTDasxAUpqRrnKG9vUi9NWO9JqXSw2x2SL9a4HoEKFN3KIWQLqY++wLu29GK+valxHEgnfR+doJpe71nrqD3KIGOQVncz64VqiVbugkEMmEnw7U3vO7Zkg1yE+Gja
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(39860400002)(396003)(346002)(478600001)(44832011)(31686004)(36756003)(5660300002)(186003)(6666004)(66476007)(66556008)(2616005)(956004)(2906002)(6486002)(31696002)(4744005)(53546011)(4326008)(66946007)(316002)(86362001)(16576012)(8936002)(83380400001)(8676002)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?em5GU2FHMzIrUWFkM3cxamhhUjN1TmxCQW0xelpNOU9aQWdJNHhqMytQVGZP?=
 =?utf-8?B?c3VDV0JPK3pPeEtmVkZFNTVCUmdnamZ6ZlRPZkF4bmVmSVVBaTl5YkxSbXlX?=
 =?utf-8?B?eFNKNkhDejZub25kT0xLcWVJZUxKNUdmRW9lSXk5a1Qxd01HQm1HQUw2NHFx?=
 =?utf-8?B?MThXRHVZNEVPV1lGQWFOK28rRjZ3SWhnTjdKNjhFZlN0ZzhMd1B3am1Ld1Fz?=
 =?utf-8?B?RHFrVlZJZHUxbysxNjgrajNySnVSaDFXZGsyTlBza2JTTDB4Q0FLOHJOYWhU?=
 =?utf-8?B?akg5UUpVRWtCem1XOXpLR0ptMDdJVmY5SWNWellyaURaLy9NdXFjRmU3T0RR?=
 =?utf-8?B?bHFpOGNJYVBiYW1zdG5Td0xMeUxncWdBMERnYTJZdnY1dmgvb0hCUWlBblg3?=
 =?utf-8?B?Mmh3SXB1dElYOGh3dXZqbko1eUMzU0N6SWQzd3ZNMjJRT2lLRTBlM3h2ZU9I?=
 =?utf-8?B?K0doaDQ5UzhRV0h0VjVkeEoyM3BaQmdlNXNzNG81eEJzanJYSWx2QlBGbHlP?=
 =?utf-8?B?TDBJMHZZN1dxMnRqWFVyUURQamxaVElnNVpRRWtwdmwrUnlaTG43emJMOFZr?=
 =?utf-8?B?dURnRS9pYVVCd1dHWXZIckxId0pwOGozVnlwaWk1emRRTi84UHlrcHRaTTJh?=
 =?utf-8?B?Y3B0Z1ovWGVtR1I2VHpxMHpaOVRsSTBMRk9IcjRuL29oMUVtOTl1am1Ea3oz?=
 =?utf-8?B?YUNKVDVSQXBZZ1lzQnNlbHV0a3ZlSjVEQTVpcjNBTVhsREh4QzBZb2tqUDVP?=
 =?utf-8?B?cTAvUkZKRXNFT0VOdEhCWXhjZHZJRVdreE94L0YwQlQ4ZExwdFQrRVYzVWVv?=
 =?utf-8?B?QWxlRmNnd1ZKMHdKR2JSNit5ZmVUa01WMUdJZlpUVjRmZ3o3VEpzQ3ZsNi93?=
 =?utf-8?B?QlpNZGZacnRKNGVZQVhSNVA2ZlBRdVhSdTgzU2FOYkZkbllSakI3NHBwUUlO?=
 =?utf-8?B?UEwzcGtYK3JIbkNzQ2tiamMzamIxaUZPdUxLcEFES2RmSDE4Z3VQS08yQnNs?=
 =?utf-8?B?ZDZwM2tjYjN1eEJLeWRVZ0d3TlBzWjh4YXAwVFJQbkRTdU13c1ZPeGh6aytE?=
 =?utf-8?B?eG1HODJmQXM4QXM5QnNUaTVxeGNtbXpZL0c2L3YwREdxMGRhK3IvWTVQT1Zq?=
 =?utf-8?B?aS9ySUlNVWdnR2diYUpOT2loM3ltVkNITnNNWXAvV2R5NmpmOTMrMWFRSkhz?=
 =?utf-8?B?NHd5ZVIyaWRVVGlhd2FXWUlJTmJJcEVjNXJLcVROYmNWQnJPYkdiVnJGSDZ2?=
 =?utf-8?B?SlhPdXpBZU1MUHlRWnJFcVRPblo0NG8wTldTTkwrYk1kWmtUVzFtUG4wK1NK?=
 =?utf-8?B?RjhhdDh1MWJYRC9RRTNDWUN6ZEpSNmRhalpwMnM0NHZUd2tHMEk4V25VeFd3?=
 =?utf-8?B?YWFEckdNM3h3dDUrc0RwdFVqREUyQ014d1ppYTlLMkNRc2ZxdVRJaGNCcXkx?=
 =?utf-8?B?SGFmaWNQMWNPRkZIUThZeW5CN2I4UWZMRWhsWm8wK1ZPeDBUSnVXVFAveVB2?=
 =?utf-8?B?dWk5SEtuNEZKUFc4ZFJHYm1rUFF3NDRvNDZJTTg5U0IwMU94cW9zZEIzNDVy?=
 =?utf-8?B?RDFTaVFhVGFDamFaYmcvMUQ4RW9MMU5YQ2tja2FiREpSdGJzVE4ySFp2T1hl?=
 =?utf-8?B?N3lSc2prRUJTVFFUS2JtTmFLNW1hUWFCUFRpcEgrMkt6aHBwZnpjL2RSSk12?=
 =?utf-8?B?dnIvUW1JSWhXUldXbXhvbGRadTQwSitMMkdMMFNrQngzM3dnSHorS3RuNDZK?=
 =?utf-8?Q?BShtY4oQ8T7qNXNUgKTF+jq06CEThc/FAZoJn8k?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a317567-b3c4-4ffa-5855-08d97c6d07b6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 19:29:57.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJALA8IrJeEP53x88yiDwtcvML5aS0XQ1KtPW72iZt+6llzTqfuwg/A43XDsBczHwfShaimBt2tAnuNKm3o5dciCLKRtdUBhlfAkX45famw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4160
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10113 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200112
X-Proofpoint-ORIG-GUID: MuX1xbbT9VFEqIxjO6dnjIflt9JJNKMR
X-Proofpoint-GUID: MuX1xbbT9VFEqIxjO6dnjIflt9JJNKMR


On 9/20/21 6:03 AM, Juergen Gross wrote:
> Commit 8480ed9c2bbd56 ("xen/balloon: use a kernel thread instead a
> workqueue") switched the Xen balloon driver to use a kernel thread.
> Unfortunately the patch omitted to call try_to_freeze() or to use
> wait_event_freezable_timeout(), causing a system suspend to fail.
>
> Fixes: 8480ed9c2bbd56 ("xen/balloon: use a kernel thread instead a workqueue")
> Signed-off-by: Juergen Gross <jgross@suse.com>



Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


