Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AAB61FDF3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 19:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439591.693634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os7Ga-0000TQ-Fr; Mon, 07 Nov 2022 18:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439591.693634; Mon, 07 Nov 2022 18:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os7Ga-0000R1-D6; Mon, 07 Nov 2022 18:54:40 +0000
Received: by outflank-mailman (input) for mailman id 439591;
 Mon, 07 Nov 2022 18:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaqQ=3H=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1os7GY-0000Qv-Pq
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 18:54:39 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f65e2d3-5ecd-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 19:54:36 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7HOGV6000820;
 Mon, 7 Nov 2022 18:54:29 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kngkfw1cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Nov 2022 18:54:28 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A7IXpkX025580; Mon, 7 Nov 2022 18:54:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcqf525k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Nov 2022 18:54:26 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by BLAPR10MB5300.namprd10.prod.outlook.com (2603:10b6:208:334::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 18:54:24 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 18:54:23 +0000
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
X-Inumbo-ID: 9f65e2d3-5ecd-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=BOQHCEKNItzUcaRwQTeD1VqXzU6bOJPafFZLtlCHtGc=;
 b=pxWKjt3DzH4lZdEQAfsctO94mnMnJsQ74zMrZoFw2ZjnpR3/zr+65Lg/tuzvw+KLNS/Q
 xYNvkJ2G7Nt4JxhwrH/tQy5FhR9nMHTy2kMm9x6PX3MYAnJy6K5AQKpeVjwK+rHFigWg
 ob+8Ii7rwYqQQpv+MMFd9ZNSjJflzFIr4Haju472GMZK08yJcJe8pS3wfotkpOpsPccy
 kfmCaPBqLYAt2VNTPXE5XM5m+ZWJ3UA9mzJbY5MHaUlIFPz6BCSb5imUSYW1nFYIwlh/
 uMuLmNwExVCs4tQIJ8hNnhXevlmM6+pmvl3qOV20Wn2UOI4B0YVO3JfK1FGlI9GD/llA rQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePVDdWHQ9+quPSBXMej/VM4woyxrRhA+sg7nK5D7ttpug7OS4EVMgzzudfqp5IP4Kgnu3J2wxqy41S9qqAgWtfxvWOyRORCesoLFLCJAKD8QwhZAZzumLdsqKc9Qu1u92F7EC5O2UOfAK7H9iiCBLZFxpjWEzpv7B9Wxow67aZAIcZnJWcd9/zM83i98ycDfSpiCV8ncBF3hosKhx3AXj/VY/2R7iLmJlegAmdxN8lBpP7xIWavtC3c/Ai3PCR0qVjeNWehx5qiIq46c6QtSpaEOFK/qbNIliqc3yrbzH2pmtMa4uD67gDgO+OmVOYCzAEQO8+m5wUplPTB0yp1YJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOQHCEKNItzUcaRwQTeD1VqXzU6bOJPafFZLtlCHtGc=;
 b=hCHwNTt8WBr9JbRVw2yioDM3jsBtCYyRDFPRlRV5AXVu3p5qcngGHMwstk1xhojQ7dOX5FNzcRfZsKu8STG9l4FWoMzyurH4cNyHYxkEn4qlI+NtAf7CX7OpBpO0xKt/rFzuvUfJPd2tW3imJQ6/Aik1vfGCPnqgVTgSB2ghC/1FBAf+yIvvpYtwgCvqwJUdPQWbNoKQTI5t0O2zXNbdPTULjCgkFxkwZkPNJgACQQjEmmXGUY/5htNQ3+Zt4iVlSdAkc8IApOg24nje+VhAfHIvOMHgpD318uvzkaJ2JJ7PM9MVUkLMbj5UrVz11CEBYTXfDEkrFvajYm8BvU6XhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOQHCEKNItzUcaRwQTeD1VqXzU6bOJPafFZLtlCHtGc=;
 b=BAzLuAhQ4Xs4Ki1mTkHUWe4lfIE5sZWvTgV8x7LgF14DYNdyygUEe2EaBZ/DLPB2LPeLztIRVP6Ra/Qjdk2WPydO/ihA84pT8EU/l1R94y3hvWSB3bs6APrnRkdxSuQomI00lJNGCAxmJPmElLQtH2RxgeyOiy2ZhwNuqZdh5Ao=
Message-ID: <4cf7aef9-d791-5bca-4a08-d7ecb0d4e96f@oracle.com>
Date: Mon, 7 Nov 2022 13:54:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Xen vs Trenchboot: TXT AP bringup
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
        Krystian Hebel <krystian.hebel@3mdeb.com>,
        Daniel Smith <dpsmith@apertussolutions.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        "trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>
References: <6ccbcaf7-29f4-6477-2f1f-0aa4de64e8c3@citrix.com>
 <82d4aea8-aa23-fc6a-47ba-deb7d182012d@suse.com>
From: Ross Philipson <ross.philipson@oracle.com>
In-Reply-To: <82d4aea8-aa23-fc6a-47ba-deb7d182012d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:408:e6::30) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3793:EE_|BLAPR10MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: b746481a-aef1-42fb-65fe-08dac0f17c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zNFj5d/bOJ3LbJNLs7832hpNrL3uxsAsFd3RoSblElYhbnwPesAykzxTlSeGmBITJXb5BJQ9gjZ7+jX5V2pHqYygGcNoeZRVdUSygFi659htxsqaG6ghGZXP+468FN+kKKH1R1UKY8wvJdRjwwIxAdkG4PvERnEMdXkf18x145A4kJprG2iqdLlaooHDZj/P0u/J6OD3WhoKAVDD5Hz7RIv8IQRRy59fpBmT6imUbBzGLEregeKd6To0W8VslvSd0lEu/eF/tZ+SzdjNj9g6YWAP8iK4ICDJsD8sec/BRpkN3alQpjIN3CI5nmVNS9SX/PPEzlE64VL2L6FW1qH5bsro3Gc4+qJRxkU56c7qn865Bu2+MO42JY/z5siWFj3r8D1dAwcP/qbuhF/utRQZdzROCjhUke/AmObdHjOmaLL2uLmcJwIwlYIjDcx1D9nATG1rYU7oAarw4OXtLsr2XjzQO8R/NJbdTOB77YySa2Y0v8NFAFhoqDJZhDH9aDGJiYdM0GVfmNTmXWiw+jYFWBeDHmlHjFvU+PrH46SMWLtk9z5Kco8AZuFQ9886tKPMp7lYeotDJxKGOKNdDozWvDrdQCfBw6cfIKFlIe+fABRh8N0Efwt+5cv+AKvT9lpl6p13lIWGei3P5ekzVait5k2mxiyZTBjST7WJ63IPATFRtuL+4x7gYMbai5RM44BItW3ZhDY/3TST9IExxMTBom1hVQuJifQFelGZE43SSxA9hn6Fdgh9UE3ZsIuIQ+B9ZO1J5AueKL5EmIVnYpEUKZhPL2DioiMtk1eDU9oS2tDzInhEWf5zlmmp4PIDkLIF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3793.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199015)(6666004)(54906003)(6512007)(53546011)(6506007)(110136005)(36756003)(478600001)(6486002)(966005)(38100700002)(2616005)(186003)(86362001)(31696002)(83380400001)(5660300002)(31686004)(8936002)(2906002)(44832011)(316002)(66556008)(66946007)(66476007)(8676002)(4326008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUxsRHlPT3JPeXNFTEs4TG82NjdCMzV2UDdoaUR5d1V3a0M1akRFdGhxQXo3?=
 =?utf-8?B?dDBCelNJS3ZPQmhCS2h1SXBCWk5yWWlLRnFKb0ltdG9kTVE3ZGNYVEdrZExS?=
 =?utf-8?B?RW5WWXQ4WS83NXhuL0xoT0NMYkovMmk5QVRuM3U5MUY5NDcwcTBtTVlUOU5K?=
 =?utf-8?B?bmhzR05vb1krSFF5bmpGQ0JpOSs1TmNFSjJYN2NGblJDUDl2TkZlRU5rYzYv?=
 =?utf-8?B?K1o2VWZ1NWdPR3FqT29CQjBTS3c1NUFTbENhWFR6QURFSWlIdWNzVGQxNHJr?=
 =?utf-8?B?NjJLK28xbUs4akw2L2NLRldBRWxMdEQ2Y3Yrazc0UnpWbkpLRlV6RUdzY2lo?=
 =?utf-8?B?VVBabWxtT0JDS0VkOW5QckZWUnp0b3hBTjY4Nk5CYTJBQlJyU28zUzNRU1Zx?=
 =?utf-8?B?RXc4WkgyWnJyblh2NkpPWm1ZTHZuQlo1cFFNL2JTM3h6ckQrTDZxODV0dUxL?=
 =?utf-8?B?ZUtoK1RYRk56RGkxenZLdWpCNkVRdFFHdW8vek8xOXNxbVZJM3Y5dkdXc2ND?=
 =?utf-8?B?ZUNjVUZzUXRFTUl0UHBxeFZpSUJyTmZuU3Fpc1EzMnc3QTNYMDVacjVnVitW?=
 =?utf-8?B?ZDNRZzZ1TmwxZmJRQU04aDU4dEgxRDRDMWcwc2FUU1JqRm1tSkF1NWtCT2Rp?=
 =?utf-8?B?dUlsTlJMTkFRTUdMTkIwNmlXdEdRTXIxd1huUWVVMnJXa0lQYkhSOGdzTVBm?=
 =?utf-8?B?a3RiNGFrTUI4YWs1bitMejhyaG9GdHFXUWZmSVZTRCtXS0JWU3lHWEhBajUv?=
 =?utf-8?B?a0RMWk51cDF6M1hxYjFaU0RFd2pBMG1PSFN2VkZFa0lmdGtEbUZyaURBYjdQ?=
 =?utf-8?B?UGhZSlVLckpJMTFMb251dWtqUC92N2xOUXBrU3dmaUdMcUYzclVhdjlCTEls?=
 =?utf-8?B?NjZTRkJNdkNEQ0ZUejZPSDlhaTVNMnV5c01CNFhLVnNuRzR4VTZXUSttbnVE?=
 =?utf-8?B?Q1p6ZjZTcGFiS28yekE5TUdRemdHTlBuczNZR1pOZkZRTlhFQkhkbXgxQWhO?=
 =?utf-8?B?Ukg3ZFlMazhFSVJicmpsWm5WZXpBUzIrZmFIUVFGK1BEZnVSSk5MZTNRcjZM?=
 =?utf-8?B?dFAzRGZCM1NFZS9TV09XVDJ1MnkvY1NoaW1aTEZ2VVJzU2JzSjNnMXZiU0Zu?=
 =?utf-8?B?MzRWMTFtU3ZrZ2dFRHZrc2tUYzAySXpUYktXTE9Ub05EZlAyNFljSElmNUh0?=
 =?utf-8?B?MHZKbEJteTh0V0E1bjB2alArdXFzSkxOTXJXR2JOdlBjeGtLSFBjKzN1MGc2?=
 =?utf-8?B?ZE5xaWk2d1dSMEJmM1RoZks1Ty9zc3VmYzdEOExmckdiWDA2WGlzZXJTVy9m?=
 =?utf-8?B?eFhVYmcyS3RoTk1vbVg5SXJQazF6a3ZvTS8yZWVCUjhvVVlFb2YxZitySjhM?=
 =?utf-8?B?N1I0dDhORE94cnMzNEU3SVJwRFhzRDZkd3ovYXR2SktqbmRiNDFwenZZZlpp?=
 =?utf-8?B?WlhLbGZLY05wMFhPa2hsNnI4VmdQSDd4ckZFc2ttTzJlbTdONTJjNVNYYVIz?=
 =?utf-8?B?T1Z0UVhKSmtYdVBkNzkyb25XZytaV2xBN3hHMFoxMGowdGhSMEJ4UURXbkRT?=
 =?utf-8?B?elE5Q21NZTZ6MFcxK1QvMnk4QU1ZS2NROTBWMGRyelpTQmVqNHJVcThLMmRZ?=
 =?utf-8?B?bXZZeit6MXE4NCt5d2Y5c0VBWmdNV3hsUEoyR3IzSlBvUkdlTy9CbnNUMW02?=
 =?utf-8?B?Z0ZHOEZXRHpSbno1QWJ0Y0h1MVRCWWptZThwT2pQYUFWTC9ZRUVOVFhwa20x?=
 =?utf-8?B?ZFQ0M3BOMG1HTnRTRmRpV1ptTmxRTWtManhzRUJkbWFjZWl1ZkZ5dXYvSmhI?=
 =?utf-8?B?YkRnSThCYWYremZrWDVWY1dQZm9HemdoSGdxb1dON2U5K3BMQ0N2NHROQk9Q?=
 =?utf-8?B?QTdxa3lvZmJuc29mekpCSmZ1MHZBYU1iSDhKUjZIazZTdkZ1QzRoSHpWaVg3?=
 =?utf-8?B?SUZydmk5OGRpTjl3K1RZM3FiKzdvT1gxV2RtMG5adlY1VGduUHFYMHF1MUNE?=
 =?utf-8?B?WlNldWhoUEZTMSt2dlowNThpWFRMQW5GRDRkc2dla2p0Mkp3M1N0Uk1vSVVL?=
 =?utf-8?B?MTNRR2kwQWhzd0h1TzhkYzVib2pyZTM4K2tUenhiTS8vMGR2clRHSk9JNDZU?=
 =?utf-8?B?Z25Ua2JyVGhGWnJtdkU0L0FVT0p3L3Q3LzEyVnBYaktDUjcwd2k3NHFURlNW?=
 =?utf-8?Q?fgwWbe3dSore12UhTu02Sus=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b746481a-aef1-42fb-65fe-08dac0f17c08
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 18:54:22.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5l8FVZ+bGCFn+/AXJbm0885JGY8ONrQXR3g0nAiFVIutbyQh0LddNb3THj6rkEV4w/fYhpyXfeXYXhkTV6IanzcMaAy9QYnuKEpkpKjB78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5300
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211070150
X-Proofpoint-ORIG-GUID: gbnSE7_FwsNkFrsomeGJ8S65D-zIHEsg
X-Proofpoint-GUID: gbnSE7_FwsNkFrsomeGJ8S65D-zIHEsg

On 11/3/22 05:29, 'Jan Beulich' via trenchboot-devel wrote:
> On 27.10.2022 21:37, Andrew Cooper wrote:
>> However, we're also very close to supporting parallel boot.  The
>> serialising point we currently have is __high_start loading %rsp from
>> stack_start, because that's a single pointer adjusted by do_boot_cpu().
>> Everything else, even the processor's idea of Xen's CPU id is derived
>> from the stack; specifically in the cpu_info block on the top of the
>> stack, which is prepared by the BSP.
>>
>> All we need to do full parallel boot is an array mapping APIC_ID -> Xen
>> CPU index.  The AP boot path doesn't use the trampoline stack at all.
>> Given some way of transforming APIC_ID into a Xen CPU index, the APs
>> could pull their stack pointer straight out of the stack_bases[] array.
>> This would allow us in the general case to boot APs using an
>> all-but-self INIT-SIPI-SIPI.  (This is how firmware does AP bringup anyway.)
>>
>>
>> Thoughts?  In particular, is there an obvious option I've missed[1]?
> 
> Well, I don't see other options, but I'm not sure we're as close as you
> describe. I'm pretty sure we have assumptions elsewhere that multiple
> CPUs won't be starting in parallel. Those places will need finding and
> adjusting. Plus the generic CPU infrastructure also assumes things are
> done one by one, with (for example) cpu_up() taking a CPU number, not a
> CPU mask.
> 
> Jan
> 

For what it is worth, I can explain what I do for the Linux kernel. 
After SENTER transfers control to the setup kernel (the MLE), I wake all 
the APs up, restore their state, disable interrupts and park them (hlt) 
in a safe area that was setup.

Later in the SMP boot code I detect that it is a Secure Launch. This 
code is being called per CPU with the APIC IDs. One at a time I bypass 
the normal boot path (INIT-SIPI-SIPI or direct 64b) and call our SMP 
function. This function sends an IPI to the particular APIC in question 
(NMI in this case) and vectors it to the normal SMP startup code that is 
in the rmpiggy. From there everything else happens as it normally would 
and the AP jumps through the unchanged startup trampolines. There is 
actually not very much Secure Launch specific code in the SMP boot code. 
This is the one patch (well commit where the patch came from):

https://github.com/TrenchBoot/linux/commit/c81d3580bea8f0111e17ad0cdfce15149b46249f

And for anyone not familiar with the rmpiggy, it is a blob of machine 
code that is fixed up at runtime by the kernel proper and placed at an a 
location < 1M so INIT-SIPI-SIPI can vector to it in real mode.

Ross



