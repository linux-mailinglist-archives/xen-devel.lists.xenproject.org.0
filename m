Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7952055B
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 21:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324774.546984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no9Ak-0008I0-1H; Mon, 09 May 2022 19:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324774.546984; Mon, 09 May 2022 19:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no9Aj-0008GC-UT; Mon, 09 May 2022 19:35:57 +0000
Received: by outflank-mailman (input) for mailman id 324774;
 Mon, 09 May 2022 19:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALVS=VR=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1no9Ah-0008G6-OJ
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 19:35:56 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c52620f-cfcf-11ec-a406-831a346695d4;
 Mon, 09 May 2022 21:35:53 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249H0G8S011683;
 Mon, 9 May 2022 19:35:48 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgcsmr85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 19:35:48 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 249JFGaV028936; Mon, 9 May 2022 19:35:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf71d3r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 19:35:46 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BYAPR10MB3653.namprd10.prod.outlook.com (2603:10b6:a03:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 19:35:43 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::125:f19d:8eaf:b8e4]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::125:f19d:8eaf:b8e4%3]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 19:35:43 +0000
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
X-Inumbo-ID: 3c52620f-cfcf-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=T+CgMYyjQkCeahmqv0vL31WZfcvhBPwpDW5yq5QCD4w=;
 b=HLGY4f3/XvdBmheMkWhEfwTvqBp0HFh5+ZMf5wOPL1+W0z/NQSWsP8t2fXFW3FNbBwRK
 4TO6LYD0TEqJcQFD9/FbLi90+FXZy97xT81RsadaASXQY7H5YkSwcg2RSajE5ysv4c4a
 D/Nsq85tRm1bEU8cIIhFAVAXtYvouCDHyPwzet1VJMA0L9L4sU+6b4LR6vxY/bNZ3nED
 /JE9m2O4BBsh+yuFOxex/y0+beCKBWpOqKgMF4LTVtGF9EojzD+OcmGr+v3WxcEBGHbP
 HsgpM273DZ4qWwebUEwFFIk6w9q94Mkl0liZmJBk9gCNQDVjGqfYmFTrMmgLWNqYn7Uj bQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJ5aAVafm5E1xynfgxxw2lNwqApDpr8UzpFOzmPJ0GzwosXYgYmezP9My8URLzRndLQtg1p/N5EICTYuEGWOgKxeUc2wugreUvx/nehv3+2CWNFGrtXjcexPY5/C/pV9jbpYEf4kMVixkOZWSkajktj4rdis226wS2Leq8cYuUrPSC2or7XvkUIB3j5GY0zS31HC1wiJmz/vxL2lDdtholRsMBF1iHJUFcfm6JnT/1Bip3+3SbbMrLD2ZUnSqt7WI0PG2LC6cy1bFc69r9I+Ph8dJL1/KJG6uZiz4cXQRvtferMhAdaDWJzqnxWd0l1yze+N8mu6+qxTikLPj8LtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+CgMYyjQkCeahmqv0vL31WZfcvhBPwpDW5yq5QCD4w=;
 b=DtAGsA3mkQOToJg5q8FMYRcG1Q0qN7H0wsiKEBFOt5fZqjsgQoEfVC6a+a7pf8rdA6zE4p7lJHPNdIT2TXu0bOruACUzgip+x2vFuHXsnRy+58ZIDvu7uZlH2XPuFrxpk7oDBxHz9UPeVkdw1uUxo24pnGf0z1gIwcFgm/TNxAcIJBLRgLCCK8/IpErdTLvxEjngEz+taMvBkrM7qUWKaDAS7hLSqcEV/+AZ7Ypz8bZd/kgUmRMQpOCM7on1dN5fEwzrp4w7zXmSSMcaefHJ37GH3cBlXQ+qO7iwf9UgP24YC30pn6MMPIxCDVVPYE/bIrjfNyoNV2FrfoyjQTrUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+CgMYyjQkCeahmqv0vL31WZfcvhBPwpDW5yq5QCD4w=;
 b=FIN0bFZedhCi6vCPOr0TU4pGxgtZrueg7a/UFOmvRJ56qT6ZAuE8eZ5KZf5YuwKgBDz9/Gd9tgZnmcnL4F2rv1PvamOPxPsIirnyzTj/6isMtBOuP1wqKWB4j/sLbbAxk8UYHNysKOCkicWYS8YDSn9ImekQ2Iko9tawgPfgaNM=
Message-ID: <15ec8f3b-7d04-9fa2-dd32-b834fb660a89@oracle.com>
Date: Mon, 9 May 2022 15:35:39 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: Attributing linux related patches on xen-devel
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1c5619ff-0872-8c0a-9dbd-9f419b9c957f@suse.com>
 <alpine.DEB.2.22.394.2205091159480.43560@ubuntu-linux-20-04-desktop>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2205091159480.43560@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed0e3372-2a42-43d2-c17e-08da31f31b5d
X-MS-TrafficTypeDiagnostic: BYAPR10MB3653:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB36531BDD1190BB398BE897BF8AC69@BYAPR10MB3653.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RgUFAWZYf7YaV/cHQqUSGPNcytX0i7ezGEAyIOmMhgKUFowR2P2DcDboXUj7pvXh48DlC8sV4y5TYs7RnvNV0z4Zvl1ILW6NSfJJAY6tVHbMcamHT4khlcVjkJNz+RWU4VlAbXbEo/H38P3Gp7mGU5G+i3bgCdKYccKEkoRH2zYT5kaToUAMeFnLxRoh4SGsh0qOTzKaonrcwkY/6QP0Z8cDCuLkSpi8gv+dh0CEx+KRc8wXMlAqNiL1WYXf7XZYRIWjMHey9eXyPQxV6Z5mGn3cCr5qLr2B2dDmOxb6pEvsVd4frNyx7cK5ywAiXyU6GOOAMvHt+csg31GLUPft4pRmw86z3+dKBneYSwfmkSQ2tO5hvhXfA18VLOl+T2hD4Rd4DMCjRtwbh3+2VAbusIntUnLjC4Dhgrez/LsSN7JEdXvgZU487ltJnneKzvCoJeHru+eVoV93FyN3Qao64D3aR/jd4zlBoD7PAqXhBz1yyPKmSCMZ9whljWyrrIuAvuVD1sIUKrggCBpf3ZMFjFd3/cMSl9KAA4FVBFywq45AaOjgsWxit0rbEfBiNvWktkgvbT83S2rNAuYPOKUdNPnNrzw1Gimw5LTuWzD2gWAU4APSV54h+NSb65Cos4Vu4p1cK74fTc3BF8p1eJqs1/FvrWXbQih7cBiiXcG8egTzB4U2utn5w5O9sdbC73sL1qQTU/9P9o06T/b+bjus1A3FoYK+zIjBJMa0SKcPlBPj259Fsa+vVCezXCMpKGo0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(6506007)(53546011)(38100700002)(6486002)(508600001)(6666004)(8936002)(2616005)(186003)(26005)(6512007)(36756003)(5660300002)(110136005)(2906002)(316002)(4326008)(4744005)(66556008)(8676002)(66946007)(44832011)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjVvSzh5anJlMndLbm5SNC9aM0RtOWNQNnN1UDJvdWRQZXE0ODlHRXFvSGdw?=
 =?utf-8?B?Qlk0bHBKZFJUSloxL2I3K041T0VMdFgyWFR5YkJYTitqY2VIN2dtazN1ZDNa?=
 =?utf-8?B?Y1dGMG9telRJOGNROGp4bU91RVN2VlBVRHZqVzJJaVdodERZSTlHT1lITHkz?=
 =?utf-8?B?aEFnUFFEZjREcXdTVVJ2NU1LRjdKRG1zM0swdHBhaHR6RnQwZXFUVmp6dUdt?=
 =?utf-8?B?ZytJaUkrREljT0JZeFpwcXhaU1dyeGxJZXdMRUpoRnhIZWQzOXZVSmJuVXla?=
 =?utf-8?B?UjVNSnl5N1RYUTh0QW5wdnMwZG1YSzJZTWx4YW5LNzlTMXdsQndXREhEWllz?=
 =?utf-8?B?ZGV4ck1qV25aK1pHVGtTRXRDWjZ3Z2VGNXBjWTMvcHZGalFMWEIzUlZ0dUlS?=
 =?utf-8?B?S1JNRUF2aGdHdHFBaG0zR1FGYWl0WlcvODhVRC9qMGQrNDA0OGhJVG5XQW5F?=
 =?utf-8?B?STJjV1ZJeVg0U244eEl6Ykk0TXJwamFSdCtmQk50UVgvTS9CTUN4OGF3RzJR?=
 =?utf-8?B?eG1Yem5lbTZkeHV3N08ybTRjZzIvMVhhWDRmUHlRdk16REp3SnZDVGpjdWdB?=
 =?utf-8?B?N2dwU1ZyZ3NPS2NNTEhBclZmdmJDZmp1Mi9NWGxJOTdoWlRTYWRKUmRlU0hs?=
 =?utf-8?B?TjV2cWJRZFpLS1ZhYkdrYXpteEJvbGRVU3hsRjlRQXRFR1Z0YTR1MXkrMmdo?=
 =?utf-8?B?cm1keWl4Vk43T2d1TmdOclBjakJSVW8zaHRBd3I2ZjNNUVQzaGtwRHo1MzZ4?=
 =?utf-8?B?cWRKaUE5MG5XVk40eEJvWUowbkMyM2svVzNNNHdrTnhhVXVsN3FYMkZ3Ylcw?=
 =?utf-8?B?OEl3TVJsZ0FBZXZtUXZEckU0OGNOK08xalg0Qk9ZY0xydFN5c3ZuVVNCV3BF?=
 =?utf-8?B?ODhPOHYzMmliTGVHQVh5azR6RWVhWitzVHA1WFhuSnNwWk5OZ2EweWZCM2J3?=
 =?utf-8?B?dG5KaS8xbDc1eU9ROThrazVZOFlnREdFSm5ZQi96Rk41RnNRNFEwbDRjL2NR?=
 =?utf-8?B?K2N4UHo2QWdwVmlNSHIzbFVnTWlQdVp1VmtjdEMvbXZONy9KTEhCT3MyeW05?=
 =?utf-8?B?djJKY3phRnEwby8zVXZUUmVUYVROK25ENENJZHdmbDk4QjZrUDIzZWhPKzBR?=
 =?utf-8?B?R2g1MTBLeXk4TEkyeGZGVXF0cW5NZ05KbWUxeVU4ODNHSkw5NGMwNnZEQndS?=
 =?utf-8?B?MWN5VGM5Qkk3TDNxTWpqd3VVcXhKKzFWd2tOcUs4WTFabmRLeTJxekEzb2lH?=
 =?utf-8?B?UG9CUFliblhkSStjbU1mbGd2OEg0RW9GWkR2YzFwaEhwUm1jS2FmR3U4YVpy?=
 =?utf-8?B?NjNIdVBldi9yajZjb214ZkUyaUFOY25UaE1UejlIM0c1Wk1RdHQ2T3c3cUo0?=
 =?utf-8?B?aDVlY1NxTkFUZktwd0dxM3htQlZ3TDZwUVlZUTAyUHU0Zi8vS24vc3ZydDNv?=
 =?utf-8?B?MkVUcU9EejlPUmc3YmRFWmpHK0h2cVFHbXo3a0RhV3hJQVA4NjVweVBXSGYv?=
 =?utf-8?B?MS9ZSU9GcFBIb3ozRlRJY3Q0c05Na2pDTjB0ZmV5MnRtN3VLZlViTmdzeklW?=
 =?utf-8?B?M2xzNXc0c2RYdGZwK2lNSkF5dTYvdTZmclJUZ0U3RnVFeGZLY1RjZzF0WFIx?=
 =?utf-8?B?MDRwZytRUm9qaklDWFdmVHhtVXAxUXY3aXJUTS81SThyL1VTaEpuMzA3Yks2?=
 =?utf-8?B?Zkd1NEkwU1VZY0hKcWNnY0U3RkZNNWQ3ZmZEZWdueHVaZXVYb0dheXNmQXBC?=
 =?utf-8?B?RzVFNGZJTkhhUWhQYkQ5dC91SjhsbHZVVFcvOFVtUjBNZkFUUkVvKzBYeDZU?=
 =?utf-8?B?QU5LZ3BJZ09ZN0dXU0V5TnRCNVM5UDVOSWJzNmxsMHBGL0FjNzQxNDU4djQ5?=
 =?utf-8?B?dTBWd3FJMjNEbC9PN05VODg2aUpLMmUyNzl3WDAxRDJnbTFnRmwyMm9HTVRm?=
 =?utf-8?B?TTRESEY2Wldwa0kwQ2x0T2JuWENRejltQ0Y5UWFRWU4vbXZhU1JPU2ozUUcx?=
 =?utf-8?B?cXZzQkdvcndqWVBKei9YT0hnWDRXajQyOHEwMkc1TS9LTVJSemJkSE9mT09x?=
 =?utf-8?B?a3dxREtaRENodlZBOEdOMHV2UUdCaVk1RjN3WUtrVjdGZmpVanNzR0NyaUxM?=
 =?utf-8?B?QzZVejZUNndJQzR2b1I3UzZUdHlCb05VbXd3ODZlZXpHMzRyZlF2L3liYzNx?=
 =?utf-8?B?RXg2cmZZdzNNMVAxVFMwZk8vZUVWcUhqRlpxR3I2OGRweVIxVGM3M3Joc05T?=
 =?utf-8?B?dmYrQ2REUW5qR2Z3SjJGa0praHU2VnJlOHFyMXZwbzV0dkIraXBjK2dZVGky?=
 =?utf-8?B?YUtzMWVnd3RHV1YwcVI1blQ1Wm9YTUdDSWpMNFNRbjhHckRiWGQrVERqTnpq?=
 =?utf-8?Q?eKFe5yauzNivSZkk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0e3372-2a42-43d2-c17e-08da31f31b5d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 19:35:43.4164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BPqSGdgfs2szPqfyyCtBfvRFrD7aVARwDPgFmM8RtvszgjQ+Nd8XVAk0oJXPU9yDLEBKoEIYk+4pONXK0D6A2U3KjlBXpmyE+UsJM/Gmuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3653
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-09_05:2022-05-09,2022-05-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090101
X-Proofpoint-GUID: Zl_cvVY6YTMI_57jwDDROJW3S240xOcc
X-Proofpoint-ORIG-GUID: Zl_cvVY6YTMI_57jwDDROJW3S240xOcc


On 5/9/22 3:01 PM, Stefano Stabellini wrote:
> On Mon, 9 May 2022, Juergen Gross wrote:
>> On IRC the question came up whether it would be possible to have a
>> special marker for Linux patches on the xen-devel ML.
>>
>> I suggested to use xen-devel+linux@lists.xenprojext.org for those
>> patches. With a patch for the kernel's MAINTAINERS file this would
>> be quite easy to achieve.
>>
>> Any thoughts?
> Fine by me, as long as xen-devel+linux@lists.xenprojext.org works :-)
>
> The alternative would be to come up with a different subject tag (e.g.
> "PATCH LINUX") but that doesn't work as it is not supported by today's
> Linux MAINTAINERS file.
>
> So I think xen-devel+linux is fine.



I'd prefer '-' instead of '+' but either way is fine.


-boris


