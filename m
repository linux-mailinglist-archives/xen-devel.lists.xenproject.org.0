Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99294513EAF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 00:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316808.535871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkCux-00045k-CD; Thu, 28 Apr 2022 22:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316808.535871; Thu, 28 Apr 2022 22:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkCux-000439-9I; Thu, 28 Apr 2022 22:47:23 +0000
Received: by outflank-mailman (input) for mailman id 316808;
 Thu, 28 Apr 2022 22:47:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noDR=VG=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nkCuv-000433-Iy
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 22:47:21 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27a93110-c745-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 00:47:18 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SIUvo3032115;
 Thu, 28 Apr 2022 22:47:07 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb104sur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 22:47:07 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23SMUdnV002558; Thu, 28 Apr 2022 22:47:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yph5ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 22:47:05 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by DM5PR10MB1740.namprd10.prod.outlook.com (2603:10b6:4:8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Thu, 28 Apr 2022 22:47:03 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::597f:1669:9247:7737]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::597f:1669:9247:7737%7]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 22:47:03 +0000
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
X-Inumbo-ID: 27a93110-c745-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RaQyqZm/KdFVXB0j5behBlzj3ppa9vPPyMzTd64Jn9I=;
 b=jpKVauZazIgLAdqgA6kuI+KQtPfWYu7Es4uIbNfW5Yg5Xj1YDkOnmeGqR05qJGYKCc/T
 vDhYb6CGYB6df6Ct0VrNOSZhmmiHGSJhZ+NAk+VtmF3dJ4gJNleRZVjjLG5+WrnR5JEW
 LE2rKpKhjZI/oHJlNB4llDku/Cw05Jgi3EmmYWEDbl4x5Or1LfOfz61t1CeEL9UXfQid
 o7wCyTnviZjow7PjiP58CzSy35cseWMkaHv9coiHNrOu/KhxA+AQU4fT8lEwj/cir4A6
 ky54qu+mRixKM1LuGpAXuao84+MOOz2jJe41ZYbe8gzClGRGKHhzETs8bs0zoJNjtQ/r Iw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgSPkZ31SKLotI2wwz0xnj8pZi4HiOmG79F5/yhNVspVjp+24t54pbHKn4kVGQB+8UFN+iGvIK9l5ORoLud/PlEB7/4JTuoIMNUTvmiYqC8O9sjzto/JZKWByu5EPaVpN1R/PRAOXkY+PLcMfPMdZ7w6M73uWiNFQYD69Wi+UemzEkrgTxbml8cug7ZcvIUcp2zW/eY+jgH4xc6C8me8Niq7RGzpdn2Anc0GVLKV/10kP4q/+ldURAOz2HBVyQHS8HHKQJI88GIF8/BwNWen1G2/Ws6TAaFGzcREB0tWppbf/5C6SW9qd22rtGAmlaPSB3AHd7kOO7qp9Hp0GLHimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaQyqZm/KdFVXB0j5behBlzj3ppa9vPPyMzTd64Jn9I=;
 b=I/A6gSPJSggJZ/GcBfcKt2uwJqKH9ILJXlvRCjME4jE/GxRwK9PhS+hg/6SUVlK6l+mO7nYBbwKQxGehJs2hYgdpbVOIsvAUxjIf95cO4aqD6IqgclRgBBXG8IiMg71JeJjDJF7Dyz1eJBMl/SVQEDb2z9OPL8Pa+ZGdI8ES1bFVnYiyYSXctQCFI/mC0yIUro1KWS+a6UyDncNyM8REjyZGiPykmSWp176oZO9FTzx9luux6CWabhUr7CVHX1RnZtlTQhyNVdBVd7UoyXQaNPgj+17Hh72zNgpE1kTrub9UCwem49/g7Unwqq3IX3RE22rhIPQYYW7xAVZ2JwvCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaQyqZm/KdFVXB0j5behBlzj3ppa9vPPyMzTd64Jn9I=;
 b=BUIYMf2hXtcWUpAPjWlvhwVDWTbp2RMm5BLC+IgJPWjl7mwfFG5vJid2ibTVKSzggxEkaK36C33GKhhTqJRNvK0hRfY+7Q8CojSeWtRsJgn561zQQdnkAq0wdqxgdq7XHU9Gr+VvjHy1RZN2S/EDUK/2DNpnOdJ/7XfXlNrFx9k=
Message-ID: <27d39d5a-3b79-bdda-b7e4-f4477667919f@oracle.com>
Date: Thu, 28 Apr 2022 18:47:00 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
        Christoph Hellwig <hch@lst.de>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
        Rahul Singh <Rahul.Singh@arm.com>
References: <20220423171422.1831676-1-hch@lst.de>
 <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop>
 <20220428132737.GA13999@lst.de>
 <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:208:23d::12) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdacc79e-b164-429c-14fd-08da29690344
X-MS-TrafficTypeDiagnostic: DM5PR10MB1740:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR10MB1740508C662D3FFACDDE4E8D8AFD9@DM5PR10MB1740.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QpsZTpP6qyKqCaoEAaI/jXTncRen3gwXmAaB+BM90gjt6/IC8u2o3KTxrPgkfz+zUtyyX/ICml4Btb8W+FOxmQMNpvShUrjD+jogRWBtlqItNEXMKmDZn1h43NXSZ9mPt8GQV8gPozF57ojzrltgA2raJZEhGts8hdE1gqNFE83IvBf+fmKScrxxOUpPYvufMeT8sk8Err+L1C5X7nT0fUZUSfabFjr4caVflVxyT4IvIiGWluqpsIUbotKnl7HYy4fpnhmZH6cSr91Gtzw/z/H7TPf9+Mv4LT7N1JLUFDs83X6rZXhnKgaAyx95hYefWMS8Whfb8sanefrjAT5RKHNVpw4maLgCllTteIiZEJFNVK21FnFBO4mUWL50PCY508wW4R5EvaEbtP6ghKM4LZqI0kRO0OpypaAU0YBylc1KLvfz6LPltJmpBM5kIjvqlVAgxT/WhopjZQp/32Y/dzajqcsh1rfAGLhDOpN0RmpjGjIS+2zwXbw4beuWDs3NBjTQIJZ1Dlw3ZkhhudQJbh9a7cDJbuFN7oaR/sbYfrrP5dzYgh2zv7qLbu3L1tG/BZCXQIyUVPHERnjHZFUIWKPhKnGuWg0Bfriv7izOxhoHxsc8f4QPMhBJaTxIOE2IxmLepe8R5r6ApKpPwTZS59Xa92lELKxz1Q+ev205XtesgjCtRF1OJLXezeXsrEu5wjvqQ5iF51BREu16pN2kn7DnhHFiye5Er0wM2Fddpyc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5020.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(83380400001)(6512007)(36756003)(4744005)(31696002)(8936002)(110136005)(6506007)(44832011)(66946007)(66556008)(4326008)(5660300002)(66476007)(8676002)(508600001)(26005)(2616005)(38100700002)(31686004)(2906002)(186003)(6486002)(316002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1dodEVTTXF4VmNrblRIQldKdXExeEg1d0xFRWdCbnpMNGNYaWMrL3lsdU54?=
 =?utf-8?B?Y25PVnRrcTNGN0x4TW9LbThNdktqNVl1VXhGbUdvUk0wa1pkajJxQXVkVVlu?=
 =?utf-8?B?N2RCRGxESnovQXVkYWN5VTJmTzZ0dXBrNzRyOEV6dk5UNm5BbUhDVEFLN3Zs?=
 =?utf-8?B?aVRFK1RhYk0zUUY1N0ZzR1d1NlRSUG94d0NJZmR4aDdlbUFDaDQ1UTdZcWFi?=
 =?utf-8?B?aCtPSk9RdUY2M1A2UEphb2ZFb2M1YkhLN3daWlR0SHVra2RTQk1pYjB5dlpK?=
 =?utf-8?B?NENwNnpXS01ySDFhZ2tGQlhDQ2w0NXZ5cWEzOHJLbXhBMWh2ZmRRNjF6bnNP?=
 =?utf-8?B?c2swSW1vSDBRMG92eXlrOW1kelBDRFN0cGJMWVgzc2dTVU9vWlVoT0NSL0dS?=
 =?utf-8?B?Mks5bjcyZm0wQlJrTTg2eG41RUJETG5qcCt6Tm85NGRPZUkyYnZKNTNacSty?=
 =?utf-8?B?SGxnWDFyakJFYk53cS85akowS3JxbWJmUFg5b3VrQytaOU1xTmFJejlGLzh4?=
 =?utf-8?B?TWphb0cxZUlUV2x1Nm1vTm1YeEcyZkMwRFpJM0tIQ0REWXVRSDlMVkNWOWNN?=
 =?utf-8?B?cjRoUjA1YTlHS3ZvVGRObGxYcHM4TlphTyt0VVRiU095bGI0ZXRYeXFNbVdE?=
 =?utf-8?B?OEdPeFc2bitLN0MrTW5sREZpcTVLRnQxTkM2RDAxWTBGUEczZXVETkltcUdX?=
 =?utf-8?B?ZDFHTm10dVZvKzRneHEyKzFsV3BvWUlnV3hqcGZ4MjRwOCtITEJQOUM4dlVa?=
 =?utf-8?B?cjU3b2xibzBSZjNxNzE1MkxQRGJNdXRFVmlkSE1BY1htTnBjSUxRbG5WcGI2?=
 =?utf-8?B?cFdwYmV0M1BmcFZpM1N5eFVoZkpjaU5RMjR5RlppZXR6VER4OEt5TWg5OXlJ?=
 =?utf-8?B?cUNWa0JwUlRaV3g4eGc3dVJlemRyalRhcVVKU3lBWHZ2b3lpZ0JGQmtrRFNY?=
 =?utf-8?B?VnJVWUFBby8vejlFYWsrbDRGVkJCWEhwVDREa2pTeEU1Zjd4Ny81NHpDeWVq?=
 =?utf-8?B?SVdURnNiSU1WVGxJKzN1SzhaQ1UzM1BnYVpGbXpibGwrV3A2SHVlZkt3ZHQ3?=
 =?utf-8?B?c1U5V1RLWUxPZ2gzZnNuVVhydjFNT3hKMWxmYjZraVpyUmd3M3pyMkFtZTNx?=
 =?utf-8?B?dUdIZTRSRnhBZUtieElUTm45UW5EVEdLa3l3ZDl5WklNM0crODJzbng2Q2p1?=
 =?utf-8?B?SXZiYVV2WHJHYWNkNy9MVDRsVGpVWGVCVmNXUkQxUVlaZVZSRFVkbjB3NEJZ?=
 =?utf-8?B?WEJ1Q29lSy9LWXA2VTVtZWlrWG9ubVFCU0xudmRtZUFncFNMZHBsK1BwbFp3?=
 =?utf-8?B?eG1HZytuR2dzUVBId0NMRHdwRUFMTEV3U2FFVUVCZkZqUXhUS1pIT2ZoUkNB?=
 =?utf-8?B?SkJGU2RDTVowdEpGWmk5SEJYYUpKcTMrVm9xM0tSSUtLTVBMMlZwbXExRTRT?=
 =?utf-8?B?WGtNYllGMStSMTc1d0JRdkE3eXhwYmJINU9CRnRvN1JRTDU4RXlIbVpHS3d1?=
 =?utf-8?B?TEZaamFiL0x5YTI3aXZUbE13UXFxaUZvRUtqbEllei9XWTNXaXRKeFRINVdr?=
 =?utf-8?B?YUF6cE9aZEUrdk5hQjFwekJrNHkvMElGakZIOHk2NHExVkRsbEh5b1lmNHk3?=
 =?utf-8?B?VTVmdEQ1NzR0dUh0bnV2dW9xYnNteUd3cThqK0IraXlpWFkxbnpJWnpRVGgv?=
 =?utf-8?B?bHdWUUZpRnIyVWxzQjBIaGVqSG5TNjV2bzVZWEhJM3pTekpCZFdPd3pOQjd0?=
 =?utf-8?B?MGpPM1BPRkJnMStVTU1qYmR1YkMrbjN3WUJJbW95cFFEMzBrZVdJWlNmd1hS?=
 =?utf-8?B?YkZ5cm5zcWFiR0xIOEljOVpYdGJ2UXJPR1JkTzZiYmJ2bEprTlpkZ3lhSUtZ?=
 =?utf-8?B?QU5veUVKTnF4VG9SZEZpYnN6aHoyc1h5dkdPVnpsN1djeVVGTEpWSHArNXE4?=
 =?utf-8?B?Q05QaUFBbWtIeVpGQ20yanh4eUVmS0ZabGpYTTgvTnFpdHdJZityNFBSOWlH?=
 =?utf-8?B?eWsvTlZseDNVYUdpUElxNDJZZm5yUjcxWkZuOC9rUncyNzZzQjFUNWZSMktt?=
 =?utf-8?B?aW1sRzBwVjBrTk4yQWtKQWFHWjJkaGdkeEtHV3RiN243THRrUzlOLzZZTWs4?=
 =?utf-8?B?OW9sZldjMXlFRmdEVnNwRXM0VWUzQThmK1A3b2xPeGc4WHNzbjVPTHFoeGp0?=
 =?utf-8?B?aEx2RVNXemxGaWFvVVErY2t6cnREand2N09wa3dRK1phWGg1T015ekxuQnFu?=
 =?utf-8?B?Z1BhTTEyMHBSTnJ5eUxuOFZyRGFUUEwvMVhrU0o3R3RNTzBMK29zaDVwK2pP?=
 =?utf-8?B?ZVNQR1NrL0FBaDNpVW90VEIrNmcyMi9GS2R6bmZ6UklRUms3bzR3N0h4OGtQ?=
 =?utf-8?Q?DJ3IMaRUAnkJkua8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdacc79e-b164-429c-14fd-08da29690344
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 22:47:03.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezlsJdKjaWedZYEPIcnlEnV/WEOKoADgJ3m39r6HU1EthRq3N4G9KLbo+Qgrr3w6n1tF2FxWpAORD1yuIGO3ToofVkZ5tFd8M0w7zhI5L6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1740
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-28_05:2022-04-28,2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=994 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204280130
X-Proofpoint-ORIG-GUID: zTCihHKElX2Q78BIphPErBC54OnRTVQF
X-Proofpoint-GUID: zTCihHKElX2Q78BIphPErBC54OnRTVQF


On 4/28/22 5:49 PM, Stefano Stabellini wrote:
> On Thu, 28 Apr 2022, Christoph Hellwig wrote:
>> On Tue, Apr 26, 2022 at 04:07:45PM -0700, Stefano Stabellini wrote:
>>>> Reported-by: Rahul Singh <Rahul.Singh@arm.com>
>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> Do you want to take this through the Xen tree or should I pick it up?
>> Either way I'd love to see some testing on x86 as well.
> I agree on the x86 testing. Juergen, Boris?
>
> I'd say to take this patch via the Xen tree but Juergen has just sent a
> Xen pull request to Linux last Saturday. Juergen do you plan to send
> another one? Do you have something else lined up? If not, it might be
> better to let Christoph pick it up.


We don't have anything pending.


I can test it but at best tomorrow so not sure we can get this into rc5. Do you consider this an urgent fix or can we wait until 5.19? Because it's a bit too much IMO for rc6.


-boris


