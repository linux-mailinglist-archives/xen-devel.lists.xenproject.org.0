Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D390403B68
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 16:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182105.329535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNySN-0004nV-AQ; Wed, 08 Sep 2021 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182105.329535; Wed, 08 Sep 2021 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNySN-0004l7-7E; Wed, 08 Sep 2021 14:21:43 +0000
Received: by outflank-mailman (input) for mailman id 182105;
 Wed, 08 Sep 2021 14:21:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ljEy=N6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mNySL-0004l0-FE
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 14:21:41 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15521872-10b0-11ec-b15e-12813bfff9fa;
 Wed, 08 Sep 2021 14:21:40 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188DxvcP012550; 
 Wed, 8 Sep 2021 14:21:29 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axcs1aud1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 14:21:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 188EKqcc107138;
 Wed, 8 Sep 2021 14:21:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2045.outbound.protection.outlook.com [104.47.74.45])
 by userp3030.oracle.com with ESMTP id 3axcq1f8cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 14:21:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB4914.namprd10.prod.outlook.com (2603:10b6:208:30d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 14:21:26 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4478.026; Wed, 8 Sep 2021
 14:21:26 +0000
Received: from [10.74.115.194] (138.3.201.2) by
 SN6PR04CA0099.namprd04.prod.outlook.com (2603:10b6:805:f2::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:21:23 +0000
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
X-Inumbo-ID: 15521872-10b0-11ec-b15e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=r5DkWAm23nvRRUg/jAQr5y90goAn0GgNJDof9SZXWYw=;
 b=a8GOx0ZSEoT9cxdc6ymbmx/DDIcFVf/luxDG3Tbj/1Ux0J/IJQFZtL5BR0affL3I3bio
 rhFSWXC8u9jv2O4pJlNjxdVLruPCTX7cU7lRGLQBgWRCy+z2NSA/YMVkD9Tv1eDZvoE5
 nF0YwlToCV3caUVNx2/8CioJUmkwnJ424tDkuN/xo5vGGRrZRxMtDIOknihfgXjpv2sQ
 Ze6uoerKZJPULF1K7SQzFkjGENEJPMYLQ/8I9cxiGxi9PjTI82oPOg6wm3czgT3Vkmw4
 TIj+c9Ufvy7ime/rofwasUoPMN+5GEiy0O1bugzptFJbR4bAmxKrBkcRTYYEb6Xa/4T5 qQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=r5DkWAm23nvRRUg/jAQr5y90goAn0GgNJDof9SZXWYw=;
 b=PXJDs84wWcpUFzLVKNydmNoEzffkJPyl8uUB7fYO8NRlE9tIqNVozyqAWJfHnvf1OBOF
 srTGAz0Xf6n2DLvSk/+Hqiu3mz3Cx5fLCRs68cNRAuUaF0udOZ2mQrOBF2aPTNh20rG0
 OeOKNfdOQuS6GGRhEjobQX2ywMBLsNlh7UupljH2otMoX+R5hoDL5EuFflmSj5dac/XY
 aSZhiwf5/q+itaFbiZqVpurxNduewMd+2w1aU0IgwDGT2lkc1/rNssCa/1DAIdd/PGBJ
 8a2J5WzFYKyMRXLKyLFvEqI3mzjaY0put65GKuqr/tj/soh5tqSdR2O6rCgxAxujHZy2 cw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBj2ZtJP2tO/f1n9xwbmC/R2uqwvKW1U/xXLR8Es850XznSCfLrTOnys1N7ab2GtMJ87XVAdzOkDTy5svmkho7B7oI57jMfF0eKuEWqcCsRVkTsJ4u5x+7s41iKDdZUYGeZD3IHp2VrV8GBZhzjTwoEMn9MEk5lHYpzdR2pOUsEZmVI9OyesaIJihTUz+cEMVusJE4Uf0QBbWS0r5ir4WPWcBTkPB79mlnPtCxvGEZvnw8nXUqwZwDmt6pnMN7092Aggzd5g0mWaUP6ItyMuo/p02ACHRVmCXUaoOXC9O3HsXKeiYPmucgZ8SpYDnM3FqYI1t2n2H3tPiqdL1LepDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=r5DkWAm23nvRRUg/jAQr5y90goAn0GgNJDof9SZXWYw=;
 b=GBemeKD5g5a1txp/YX8m23XfbyV6UJkk9XrusQBLsZ0UUZAKSIHOoBTXn/t2c70tMRxIOq/V+pesCg+rdKsFyQOLUaVR5jdpt4sDLbVkg6p/k060qO/CNGeM+hO6cb4vdx67OcEWsrkB13qW4aVR0zsPVeyGJkjt/X7HB38KZzXoVrJ4bRJ/l0f5qsyZnPQt78nUwX8P8hWZ582We9LiW60WYrHhFUecyIQBhhWFXLaqDz6pzNRssIfu7PEMBV+ddZTLYdQBEFPzgsknSzEfi+5BreS6AlhMU+kDJr2fDKGX7n5m9KWUsztO3VCff/yeCm47uOTGeNakz38VxPIjSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5DkWAm23nvRRUg/jAQr5y90goAn0GgNJDof9SZXWYw=;
 b=MM95ZO32D5e3kREJDDAOYpJEsgURZKa4avPypcMLWFybsLLCRCIkdm1SZekV0LZJtMYJa8vWTV01i0NFIvrNfTP1DmYCanU+G5YNjdM73M0farE2QBtMuIF6pJLpsvgt0e6BNxP2CwW1jsSLF7zMyn00LxF5xC0IIrZQz/zHwcQ=
Authentication-Results: zytor.com; dkim=none (message not signed)
 header.d=none;zytor.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen: remove stray preempt_disable() from PV AP startup
 code
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210825113158.11716-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <df9f93ae-a833-8bf0-9df6-91cf2c4e007b@oracle.com>
Date: Wed, 8 Sep 2021 10:21:20 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20210825113158.11716-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN6PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:805:f2::40) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0209f4d-e276-4bbd-ca16-08d972d3f12a
X-MS-TrafficTypeDiagnostic: BLAPR10MB4914:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB49144AA1A328EF771A9F9B298AD49@BLAPR10MB4914.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fbgEZ/aZUMVO2QfBb4NXTZe3nkm2Qeq0h+e/PY0dUHkPuEGokMlNm1xOlGQCxxdJArSJrf+gkGxq2Zkpug6uwRIHAskhBgiWE/VKZDMe/ghDq2hidEGeumwJnzrvBtd6jIWNClBUa1apJNfpK5bIDRCJBPlhmDSr2ej3lk9s8SsZsKhGLUX+nUNyMJ2BZSX9xQWdJ7K6QMGnh9hZa1TZ5Wo5rTBSS+Of4N4woXI7UxG2loUUxDBdRtuWDNEE1gkFGvGLnA5TGaEzVTJ5P0TKOLnKrNRjYwULdfWv2vOV7AJZbVmn4lx9adUXK40GwcMt7LgjRzwjnSUJSkhNnP9wxRO5YeYt1/F1sPCX3ZERCiniEehQCCRcSfR3LwoWl3N9KmHcUuU9RhE/1Zrqt0SIkGNL4QPec5QxIWDhumQhNgs1cvf2MNeD8mYDLWtTl2TChveaoxxraxwgqKXBIFrOWoYFNhRcQ8DmVNBYkaGIXA5Ska/DUy17vNqyIrLX/8YH8YH1YFAGIUfjrTlh/0iXkeSrxQGdOUf2VBKD45aOb91DOkDa750tY9E4214VR8CS2D4UyKi+tLxiUmPirMfnhHQ28gDdvqY58xryYmpqRumHifzPV6OTL4h4fUSvKvZT9ghsmQq4eZ5lK11S8tQ29J0y1Ljl2unWZsNE3Hz6+X38HJqM/7daDm2XRGVv2UIU81oYwkKcIazsxianKMTkjcgZJHxIQUWaur96aWQcIC0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(366004)(39860400002)(4326008)(26005)(38100700002)(31696002)(4744005)(8676002)(8936002)(478600001)(2906002)(53546011)(36756003)(44832011)(54906003)(66556008)(86362001)(83380400001)(66946007)(66476007)(186003)(6486002)(956004)(5660300002)(2616005)(16576012)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTJOYThrQnhiOVZmN0tHR256d3Y5V2JJN0R3dndDbW55UTI1OHRsK1AyVWFq?=
 =?utf-8?B?OVBOMno4QzRKcGhDNWkvUjM0UHNYQXVaUHA3NVRqcmZodzVkWjJUb1o1Y1gy?=
 =?utf-8?B?eTFydnlDdnd2cUxDczE5bnJJVExDbnA4aUhIZTFQOUVkM0FmZmE2Q3huZndi?=
 =?utf-8?B?c3VvZEs0Z0hxVGZIMmExM203bm1tQ0NDLzR1WFhFVlJ2Q01XbFhBVWRKYy83?=
 =?utf-8?B?OWluY09RS213Q0dhMVpES3NHOU5yUlB6TjVReUNveFdVS3YxU0hkNm1ueHpP?=
 =?utf-8?B?c29IM1NOSzBnVURnenhYL2pDL0MzMVFyektyN1BRVXljdnQ0WHZCbDNyaEtP?=
 =?utf-8?B?b3ZheE1XQWFUNk5WcndURmJ4a1BQdDRQbk53RVBZa1VmUXRWd05Ha1dxM2tT?=
 =?utf-8?B?QVNJTlFnaEdrZ3FvdGRHSEtaaFF2djUxcGgyTWQwWWNScjNiZStSd0RWbUx4?=
 =?utf-8?B?OERTblJSQUduOWNOc2NPZ3Vxb0JSZnUrT3h5OFFSUmNWNnZHTU5pYTgwNXFs?=
 =?utf-8?B?RzhhSUxlaGdBamNhck1GVlBOa3lsRTlHcVlwRjBtYlc4Qm9HNko4T3YweWdF?=
 =?utf-8?B?eFhJVkV6TUJhK0o3SFlFMjVxeWdqK2JLZC9Sd0xoWDBIMlcyTkd0ak5NVUdz?=
 =?utf-8?B?L1pINC9xUi9FWGd4WUo5V2paSHBYUUNuZGtwL2lkWm5LVzl0dDNYSGpGOG9F?=
 =?utf-8?B?ekhCYjR0bFBiQUczakhpTGdHZG1SbUduejlsNUd4RVdpd3IxKzk0TnVXQ29Y?=
 =?utf-8?B?aTgrTURZbWZJdkZWa1BaOGo0Ly9NWW9ad2F1ZnZpc3lpYjZnQk1SRDl3dG9Q?=
 =?utf-8?B?bXNBRkFNMUx3RDN0Uy9LTVh0bEJjRDBKU25BZTRLTzQvRG80YjlCNVVORUkx?=
 =?utf-8?B?Z1RVNUQvQTlGMzNBWi96Vm5QSlEyeDNMdHhhelVnNStOSDVkeGlJckJRLzJh?=
 =?utf-8?B?KysxeWtqOU54Y0Ewb0dIaXhQK2h6em1paTQ3STZLY1dkNGhpWjRXM2VoZktM?=
 =?utf-8?B?T0grTzAxTWxsSmZ1Z3ZlVGU0azFPbmlmODZkRWJIT2diSnl6K0ZaVlpVclZL?=
 =?utf-8?B?SVBJSVpoRldMSzVsVEl4UTFJa1BEQWtaVTRZNXF5d3lLZEp6Y1NqeHZJcmha?=
 =?utf-8?B?eHVTL3JUQk92dll6NGIxZTJrcUY2dGhiWks1ZndHQVBHVHpFV1JZaGRBYWor?=
 =?utf-8?B?TmluUmdwWE8wMEs2STY0anZuenBicmVNWDVBdFB3d1RqUzYwb0ZGR2dKNDlB?=
 =?utf-8?B?dmhqVU4rQmtja0tYNmN1OWxJeVJsZ1BTMTJVSHpkSG0wL0RBS2ZBZUlUNk1n?=
 =?utf-8?B?dlE2Y3BFdlZnWVhFN1BISGdXSjNFQmZ5L05pZWptaHhzMVhITXk5YzZSQmQ2?=
 =?utf-8?B?NTBoRnJmMVZiK0N4MVJJRm0xb3pQektTM0dXQ2ZDcElRR3haSXBpbWw1VWxo?=
 =?utf-8?B?a3IxYzRrc1lXY3V5OWgwazBERDQ1MUdzVDBaNFg3UjFoVlY2T0k5cnB6VERp?=
 =?utf-8?B?S3gveW16WHluRk1OMDBjS2R6TWdQNjBjdUJQa0drMFZoVllZSVdzMFRvNklt?=
 =?utf-8?B?UktXenZDbWViUjltRWFrRWc5b1h2QUZNL3NrTkNtbDlkZy95L3dKWldwcW9G?=
 =?utf-8?B?M0VCV2VwWEJwTGFDY1UyS0NYK09BcW9qQk0xVS9kajJNdHZkUnZLb2pZTit0?=
 =?utf-8?B?YXNwdXNPNm5wcm15MnZkVVBlM2lVWm54ZFZjd1JYd1ErdXkydU9rOWVvcEFs?=
 =?utf-8?Q?tIepf5V7Py4rDVoZK67FPYBFtUeslFiTP37vqtt?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0209f4d-e276-4bbd-ca16-08d972d3f12a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:21:26.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IgoZUo51MAMg8/bdZOLcLtS3BQSPlRkZCPGHHqMSWJySsTTFrzJPr7MK6rg/YVHj0HiMjwOZayxoqjdilFLB9+pyw9h+IPiyU8UkQbq5q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4914
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10100 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080092
X-Proofpoint-ORIG-GUID: 05yXRHHkwXBDUmyT8k9WE8Fd0hhC5v1L
X-Proofpoint-GUID: 05yXRHHkwXBDUmyT8k9WE8Fd0hhC5v1L


On 8/25/21 7:31 AM, Juergen Gross wrote:
> In cpu_bringup() there is a call of preempt_disable() without a paired
> preempt_enable(). This is not needed as interrupts are off initially.
> Additionally this will result in early boot messages like:
>
> BUG: scheduling while atomic: swapper/1/0/0x00000002
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



