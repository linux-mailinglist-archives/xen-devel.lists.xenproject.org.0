Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A083F43CA78
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216944.376744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfir7-0005GF-8X; Wed, 27 Oct 2021 13:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216944.376744; Wed, 27 Oct 2021 13:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfir7-0005ES-4a; Wed, 27 Oct 2021 13:20:37 +0000
Received: by outflank-mailman (input) for mailman id 216944;
 Wed, 27 Oct 2021 13:20:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfir5-0005EG-Fo
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:20:35 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaa66c2c-3728-11ec-8460-12813bfff9fa;
 Wed, 27 Oct 2021 13:20:34 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCTXgI023707; 
 Wed, 27 Oct 2021 13:20:33 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj3hjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:20:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RDK0YE078610;
 Wed, 27 Oct 2021 13:20:28 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by userp3030.oracle.com with ESMTP id 3bx4h2c3q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:20:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5251.namprd10.prod.outlook.com (2603:10b6:208:332::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 13:20:25 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 13:20:25 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SN7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13 via Frontend Transport; Wed, 27 Oct 2021 13:20:24 +0000
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
X-Inumbo-ID: aaa66c2c-3728-11ec-8460-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=L9W4r73MtAXDYeLPSmVSL8I7yuybLpV30uuTJpDGZkU=;
 b=GXOwsif/zXyYPmjJHLQ0bHv4oWuuB8BCYizHOdZX7PqwdPIVtf6ucFq4+FTE8qJoJlA3
 N9TVhWvmk3GpKJWf8MdOZNbDyW7WMFAt+Jq1ZAfA2uoNggROJXF3S5lbFEzdNVZ+Sy77
 haQrx9Zm9GG0IgfdJvjjMPK+BJ5A4/DC7qoDEfBJV146ACvqsP3GFR7V9JDM41X8VSmC
 J/9xWBRql0dfF9z1uNPSA8FhuMUVhtK/MyrmyAs8VLbdQ5248YIRaJN6spiLfi6pTWTa
 QiaazvebUxh9aH/p4XXqMIt+Jp8QONUclFziBY2YG8p+55D5v5Ot9PQA1WeXwdpa9/ms KQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5eOWHKoU0xcQpWjilVDUyRgCDsE9yc1Mp9HImX+29N8KeQ0WJPI1fWkZHGSqmBzZg3V6AtA7z7kXW9CGpBn7FBSc3n2N/M5I+UBMxREcLZCUoUMrHZQjVYlaNndE83qKgD2LaqgBueARhwI47kJQuWASojSKfdd9l65tcG8YrvFAhSBoSOt6w6HIbCzNbCHiwfFtJbwRpmXx3+uuoYWr/ZDozTsXNxS6k50yvcSKmv4l6DOUe6gaKduPsB/F61QR29urUJETlB0lP5CPG5TC2W4eHlqCVttE17YT94DZzBFIXHHGKTQeC4rYjsxQt5VCsXpkmCBhpwJSBciMKlQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9W4r73MtAXDYeLPSmVSL8I7yuybLpV30uuTJpDGZkU=;
 b=NPPjcAi3rsM4TW+UO+Z5ifWOHSV21EYlKU709N4V0hb3nhJ/DsylweBa3enZb87ZL9uyr4V62Vx881XchfZEHksA2j1gYMVCWoO4iw8R/j3157gjcT0AEPcmUN0dEoZVSWRKgqz+LGM9vc2I+O6z/qEHjqqSZzPNFpPO/kQ46A1S1V1v/x8V3ijvyTZQja505BP9d0P/sJGO0uWxD6+yanyldZtIdxwNO3rXgUFYrJoruTuwUlN3OD1OXTg+HjBU8Q4+Lb2X602jWzXspE7vvziO9jzqqmvIhFDFj6/qtz6hy4uazGvz8cIX5zhVMB7O5CdJ/xVn90sJO2qOzRPJiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9W4r73MtAXDYeLPSmVSL8I7yuybLpV30uuTJpDGZkU=;
 b=tG03PjNEiBAb6CMRdB/Fp7opGnxS4nrPgVvG4n7s5izBmx3jomm5TenF6RZWANPxcNHY9kC5eAePZlXZ3XEA565DUyR2MHrjez7lA37DBmBdNeLO0ZpSz/ihlZuejbVfTkCoiUoLXlUW2OqzmToAFVt7JlOeOWq+QVDd55juf2w=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Message-ID: <34c7914f-c647-c110-c269-1c1fe51d6f39@oracle.com>
Date: Wed, 27 Oct 2021 09:20:21 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/pvcalls-back: Remove redundant 'flush_workqueue()'
 calls
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <2d6c2e031e4aa2acf2ac4e0bbbc17cfdcc8dbee2.1634236560.git.christophe.jaillet@wanadoo.fr>
 <alpine.DEB.2.21.2110141242320.9408@sstabellini-ThinkPad-T480s>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <alpine.DEB.2.21.2110141242320.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::7) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 463e9f9e-6a95-46a2-7e88-08d9994c89ad
X-MS-TrafficTypeDiagnostic: BLAPR10MB5251:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB52510CB7E7B799FC61A385878A859@BLAPR10MB5251.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	noGnT8sumRBW/FshnbUF9/CA+PbVvujSMc0cazwQ2muoH9cucCu8roDrOUmjhwCPE8zZOQlR9lsJZI5RpDvcFTmbPxC/4bntBO/Daa1bJP5WNpRqz4xY4j1FGV0EvlEtxmIb75s1Z3EyCFsbY0mQLkva51//BBhumi0KmsDcrfCPNG1y3bv6sqNAtdBbWQAhOngu+zcdtY2Ihlthkked/w2CwORUjjgcuRHicVPdLF5+0iOROmNaLq3qucj0vAbOdIzeFy7ehB3E/0LYTi8W7lS0jg1YuCDg1URIHWPVSiJStv4LrcyiobbMFqXEvxvdFcnKavmudniO8MI7UF4EJWz0RQMMfS740EvixmtOR9lCmz+agRvh99aBlyOefokne0UnGz0SyjNDhrDYDjVKI9z7eNNSHxRJC4RwBvlrizLCM0hgoWFyDGVS2J55UFo79zujYO/jLbyiIvMztmX+x/V1wyP2/LOGl4M1YHVEMkl6cb7Q5FeHrP056v/wWeAYR7zyepAK6TyWckEGxHkEwA6v+PV5y2OXKW0/7pnnYM/nfRJgagtBmRd+TdYDCdk0/GRws/AswW8JFBEHpzmBs5Q+tA8jIT6MyQByQgerjBA0+HS38F3gZFhedibzob9MGsADjQPBgRsws/7wAItLiR//TPmGg0K55N16DHiX6yyETMOFNce+u0BLJ2XMgLNa0wn0jBZV2Y1qKsITLZKEPJ23xPcFlfpBNK+fg5a6rxE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(110136005)(508600001)(36756003)(956004)(53546011)(8936002)(31686004)(2616005)(2906002)(4326008)(86362001)(6486002)(8676002)(26005)(186003)(66946007)(66476007)(66556008)(44832011)(38100700002)(5660300002)(16576012)(31696002)(4744005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1N2ck1rQk5HK3EyQTRIUldPa1NPVGwvUVJ2eVI5S1Q5TGJaWlVYcjZZQkdT?=
 =?utf-8?B?RG9KWSswL2ZNd1lOS0ZtQ05zVE9zUWJFTVZCT2NvUm9wWTBpM3dQY09oS21s?=
 =?utf-8?B?WEVYQTM4SGJqSVFGaThYSGEvMGc2MThkVjRZaXJsbzRGUXd3VzFFSFJFVFo0?=
 =?utf-8?B?Y0E5WEtlQ25UdTBUUnJCMlFqSmVFWGZEMFQ2TS9uekErR2hmczFZQ3EvemVu?=
 =?utf-8?B?Vm9scVFIT0VNemh4Y25pYUhvTEJDTUl4OWZLam1GRjJibWplc3VpSHdiSjZ4?=
 =?utf-8?B?bjYzNVB2MUhtWEtYeThoM0hzY0lJZGpzem01SnMveEdmdXdaWGJ5S3hVM08w?=
 =?utf-8?B?aUhRT0NkWnViMXk3VllJKzByNC9qaExTMXVvNmZzQlpQVHh6bmg2Q29SSkE0?=
 =?utf-8?B?dlJvMmk3bUM1UFM0T2RORGhVTUtzSXFxVitBRHE5MVIya2p1QVV5N0Q2Ynpt?=
 =?utf-8?B?UFgyV3lEazBONHg1Sk9VQmQwdzBIQVY1NXVidUpoWHhHVFl0eVR1aEY5QXBy?=
 =?utf-8?B?Y05Vb2NsU0Jlb3FUUmU5QVJZbytFMVUxNS9wKzR5UHg1OWttRmYzVnFQMXhG?=
 =?utf-8?B?VGc2UEZxcThIUi9lbHB1L3ZNUnh6WlBMQ3Bibm93UUUyN1NUOEFjUDJmTWx1?=
 =?utf-8?B?em1nTGh6OXFDNlpudVdQanBNS0RMcUtwaXlKOTNQMStUeUN2dEpRb1Y0Nlds?=
 =?utf-8?B?Vzk3MjNRN3JJYmhYL0k5cmMwOUU2Rm5jQ080Tm1vdyswbEN6L2FtUmJMeXJq?=
 =?utf-8?B?K3VLR0NCWHQzeWEvZlM2MUk3WldXbWRqcVZIZ1llaG80RThaRDFuZitmVmlO?=
 =?utf-8?B?ZGJmSDVyT1BKRkdnMm5hNDlDSGhPVm1LS1BHVWpJUzV2MkZ1aHMvMXpLRi80?=
 =?utf-8?B?WXpBQndQVEtoc3Rady9Zc3BKazZrN1F1cTFMVUlNS01jVkdwRmFPalZhbVZ4?=
 =?utf-8?B?M2pqWmdvS1pRLzRwaldwNFMrZUdvUXZFR25rLzgyNFF6cnBURFJhdkpSaXho?=
 =?utf-8?B?TmhhRWQ3aFoxQlo1LzVFbjVKNG5LRXp6UUl3NzdQUzlDU09oejBVc3FjWVN1?=
 =?utf-8?B?R1YrWnlUTmlaTnh6NFV6blp4RGpuUkFHTFZsWUNNTEFUc2NqMjNtb3Vib1RK?=
 =?utf-8?B?dHdFVGsrTkNuajhXd2ZKUXdwV0xONWJUMFBraE9pRWtSQ3JPMGVWQ1lFSzB3?=
 =?utf-8?B?YUVMQStNcHVsWmFHS1pjOVowK2JPaG9WOVpScnMxRGtiTmJiK283K1l0d2Uz?=
 =?utf-8?B?Wnh0WHlYQ095dWtjOEtsTEx6MGk2Wno2R0UwTEwwMFhvenR4MC9nRXFMVHRp?=
 =?utf-8?B?c1BaYlJtR09mU3ZFd1o5SE5RNk5mZ1NuS0ZvQXp6UjB5YUFkekM1bXpTR0xQ?=
 =?utf-8?B?TTcwVnBaZ0FkUjVVNkZIdVJaMGlIUy82VjFDaHJvVFQ4N0l1OVVSc0x5bGJo?=
 =?utf-8?B?MG5KS3drbFEzRDN3ZUFVOWxkdkU2L3Q5cTJkOExqc0VZWGI1alUxTDUzeEFR?=
 =?utf-8?B?dGU0Y0MwZWlSeUJGbVFzTnFhRVdoYXhqMTZXeXZnREhOajk4WnhQSnBxbmcy?=
 =?utf-8?B?TStReWthQ09CR0tLUHQrMUVka25Fbm9SaTVsME1WR3BzT0VMVUNYQkwxK2xa?=
 =?utf-8?B?R2dpY1loNDNXRTZuanJsSVhqREhoNXRSd21BSEJmZGt3REp2Nm5tbmpYVzhI?=
 =?utf-8?B?Uk5VbG1NamNmUW9xS2R3Z3pRZUZweCtvWHRzY2tRb21naTB4b1Mwd0ZESkNx?=
 =?utf-8?B?RlBqT3VxanZPdFJvYlhteVRXMzVoblFzOGl2bjFqT3J5cmMzakF4SFpJTDhm?=
 =?utf-8?B?aUY3am4wRUVVRTlpUDFkR2lsT2d6LzhmSlhyN3NhVTU2bi9ZZ3ovaFl2a0c1?=
 =?utf-8?B?VlZrcFhnbFZKQlY4N0ZjMS90YzU3V1I3MGlDU2h6RW5yZ05kWEM2dS9NR3lK?=
 =?utf-8?B?SFlkbVI0UmV0UExweTdJQ1VreGRTV2k2ckhYQVNIalAySjVZYzN1NXlPaEFU?=
 =?utf-8?B?T2kyYW9XVVJscTZxWGZFaXpyTnozTjhSVWt2dm5ucFhUd2lOSUVCbVNZSnlu?=
 =?utf-8?B?d0JCOWtmSy9MYVlBVm0zbFFxWWZhT2JkNHZrRGl3alZvaEtQRUpUbE5obW5k?=
 =?utf-8?B?M0E0YS81MUxFcjUvVnBtelIxSEs2V0VOTmExUHlWWE16b1Q3bFJkd3N2MVFJ?=
 =?utf-8?B?djNDUHFpNTJENENiempNMDNDUnh3UEF1NzhhWFd5TUZsZFppd0FaamxIcFZH?=
 =?utf-8?B?N05uRVViSVFkQ3llWktUU05TU3JRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463e9f9e-6a95-46a2-7e88-08d9994c89ad
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:20:25.8129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRtforF920aRPKwzBhUlGajh7h+pG0/pv+08mzcKtHecM8tasqR4Ss+dOqIShyvR9ya8kWGIuKwGnB1nJ9I/FddSZrKpgVajNaLCuMgiMp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5251
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270082
X-Proofpoint-ORIG-GUID: udi5c0VZCP_WOdHgimML04apw505sWvu
X-Proofpoint-GUID: udi5c0VZCP_WOdHgimML04apw505sWvu


On 10/14/21 3:42 PM, Stefano Stabellini wrote:
> On Thu, 14 Oct 2021, Christophe JAILLET wrote:
>> 'destroy_workqueue()' already drains the queue before destroying it, so
>> there is no need to flush it explicitly.
>>
>> Remove the redundant 'flush_workqueue()' calls.
>>
>> This was generated with coccinelle:
>>
>> @@
>> expression E;
>> @@
>> - 	flush_workqueue(E);
>> 	destroy_workqueue(E);
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>

Applied to for-linus-5.16


-boris


