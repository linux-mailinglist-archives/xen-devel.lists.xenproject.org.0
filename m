Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0723051CAD2
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 22:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322399.543686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmiVR-0005xj-I1; Thu, 05 May 2022 20:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322399.543686; Thu, 05 May 2022 20:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmiVR-0005uz-F0; Thu, 05 May 2022 20:55:25 +0000
Received: by outflank-mailman (input) for mailman id 322399;
 Thu, 05 May 2022 20:55:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LiDS=VN=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nmiVP-0005ur-CJ
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 20:55:24 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abfe04d4-ccb5-11ec-a406-831a346695d4;
 Thu, 05 May 2022 22:55:19 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245Hd2cq026110;
 Thu, 5 May 2022 20:55:15 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcc97e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 20:55:14 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245KotsK008820; Thu, 5 May 2022 20:55:13 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj558nf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 20:55:13 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by DM6PR10MB3881.namprd10.prod.outlook.com (2603:10b6:5:1fe::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 20:55:11 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::597f:1669:9247:7737]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::597f:1669:9247:7737%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 20:55:11 +0000
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
X-Inumbo-ID: abfe04d4-ccb5-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GIQO8laz2Br665gbcj7aJdEW2CqtFMVfO3pK2txAhxE=;
 b=ATlsqs8ZkS1ySUOJCUIhjCuY3u0pG2NLDRJK0QW8BRN//i9jtdaR+7QxpHWkWBiGqWU1
 oDrX9z/6kusfREiLSWi8iqzA1Q3iwfHuyKT2mxjlVlm+HK+kXNaj5jZp6Sf6F4Va2TBF
 dJ3AG0aixUd2AyyForesxkDsNGEIltoSaAsuaWsYE1Ak281p5rq8E+cPE7q1JarCEPXG
 dYA/1rpEOeV2A6pegLqmxLIs5WAmpyhGs8ech4R9KGFHpTlQiDdnKVrGoeSLseYr3fy4
 RTQ5ncoUSZh0rrHF02sjUlYVt3/1RjIDgYjKQRWn+AS33C8BsiLdw42MY7KJw5WEQ63v vw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyrEqK8qm3gpCM3J6d6Ae/nwNC7JZV0jLwmoF+4qXqOUadWfZc5DEWMLCIsFvwUcm/xEM6P6MF8BpfroccaENfNDwYbmbr09qyd0gKKIzKOkWTPtVmh6xnJyQs3nb57SkKhYQK9ugzmSa7cOcdmKjwJete3653cQnPkYJW6dIUdR75PLLas/FbS7wCpoNXbz3TbAGGu658KkjbPXi96ueeoVg2ssCiz6xWVzlBGRH07zEGQmTbx+vHH75w89V7hr06X9l35P0E9ZfrEQ7Lxz7HRUucmx2i81mSsCQxtQUxDy+dYqfceyNPZIjaHZi52wsLU3kXBHVEAf4MYDrIkOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIQO8laz2Br665gbcj7aJdEW2CqtFMVfO3pK2txAhxE=;
 b=KGgWCM5ZnIJsmizEJ07Xyj2yS6MNOJ2o2Y5wCm0smq5WTOcyEv7GrCpZ0u/9hmxARnP3qtxJwAWcTCCX2UmK7CV1SlKGiAkeqp+GaAXCoK9C6VGMo+s74krHSHXNaWHkE9lQ72dJ6iZSFzYGe8Vo2HrHNXv/23U6aOOMHaP1ASAtIWZFbUP6Wwo286rR6vFIe/HQvskv7lVL+n9C1fXIjTmlb+Crpnn0dciZwJh0BI3JQeCC9505b2AhBL7bdohuhMp/EOjXs1LlnEzNWrItOj3uazsmEDviAv3MOjj976oB31KS4Xz/DgwdJCGc9Z4lsqOONzVMt5g/C+CB61CtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIQO8laz2Br665gbcj7aJdEW2CqtFMVfO3pK2txAhxE=;
 b=o4uOBc2es715z2rFIpS9D/E/Jo0CHAhTXizIKzqahjPWBIlFSPC5KDcA8n/dkcpHYFSWqNORhs6mmKXN9WHQV9pHFaEEY/lf4+3RfreE4liOg+JCXAmP5DIepI1DyyGCEa8TPlMQkt0JJiu9XvEk+ka0AdUlF3hZi6uIIRtJ+xI=
Message-ID: <7c8b93d8-a20b-a859-265e-bb4b6aefe10b@oracle.com>
Date: Thu, 5 May 2022 16:55:06 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/2] xen: add support for initializing xenstore later
 as HVM domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>,
        Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
 <20220505002304.401417-2-sstabellini@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220505002304.401417-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::27) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24b8968e-cdc3-45a0-622e-08da2ed98bc7
X-MS-TrafficTypeDiagnostic: DM6PR10MB3881:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB388135DE8B5274CC9F913E168AC29@DM6PR10MB3881.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J2p+JHfb8MrH5CgNJ5dya6CYE7FUn3kPowWXufhyXfVW6sS1AsjxbezhjCnNWYScIbxOuAhq9X6j0D5OzvQlRyvbXX8eNsoWTbmP7sVHgv/0EPlWXVvZAlKjqb4KeU8G1HDKaZnQlVwSnqkrKHrvgNGfKBEcuMSCypibUm9lmSgc8T7JZPM58Uc/xw8yEtEbWIvHJvnGNFspEVmAXe6FZmeRT+Bx9vxGS3mBvxzmd72aBfIOShQI6gYckGHHOuSeIyxJZJmhIegGNsy6RIARtxXVLVZmGyM7BxD20/ScWBZq8dNwL5dT6+gSxSCSxuGgZYUTpT3rqZpywsIRtj0setmerprzh1h57Q8/k7sk0SGeUn9VduPsKStOcRVpv/KncMGA3qbsNtltAl2qriXDsk+/9sG6WfWdjd3Nb+l9NiImLHFwEpmWq17f74gnY1OVs7fyMq30pjVaVIEJ39E8/58TwWwQU9jSKBE1NwYyEXIOenNTUUUl9rfXEXx+UUwSzgF2ido4Azua1XfOKZZL7pkL5K2OwWXn3B8M/fkobyCToT3X4AeOca9dGgKIMMheyJNpEl8LVToddv84IQpJBdUDZkl5a4yed5/Yq2NQoja16V2jutk3R75tYpx/rsyyQPaJOFQ5ISkNSyzuJ46xW3hWMa/sGKFyF+hfwp5/L1jz3eIVWtpdcJBXZfn7GTk7TQMEr6XImknwhDQvwxqS3HNHCZ8vdancL75xpEs7jZJ9NrOPYG8QUvPEZEWGBEHM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5020.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(53546011)(26005)(508600001)(4744005)(44832011)(5660300002)(2616005)(186003)(2906002)(36756003)(31686004)(66556008)(66476007)(8936002)(4326008)(8676002)(38100700002)(6666004)(6486002)(316002)(66946007)(54906003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blNLQUNLa3d0ZEZpeHJvQkVBOVFaSld6SVRhMG9XZCtJelREM0p4MjFUTWFi?=
 =?utf-8?B?ekttV1JPeGFKL0tIbEphUnFFWk8vOVhHV1VtVGJCOTR4QnEzbGtINkIzb2ti?=
 =?utf-8?B?WWRNMHI1a3V5Zm9sVVVkeVpPU1R4OENNY1RzY2FnNzNwd2xTNEVZc1cwcXdq?=
 =?utf-8?B?Tm5oS1JkY0VKd3V0S2p5a1VEa2FieGdMNkVLOXRhTWhJck5SK1BWRXc4NnZm?=
 =?utf-8?B?Ylp6RVRTN2plQjl4Ti82bG1SaGoxb1Y3cGV5S1FBdDNiajNZYjFWTldjaVc4?=
 =?utf-8?B?NlBlczB6T2g4b05UT01kbDVlS0dIcmpJU0pqSFVJaVJtY2tycThMK2FrY1JB?=
 =?utf-8?B?MVF4ZTdpck96TFJoLzdoVHcyQXY0Tjd1dlJhdUx4M2ZKZTkwM0Y5L3NmcDcy?=
 =?utf-8?B?R0R2Z1Rkek0wdXpYSnFoTWRKTS9TQlBZQndHVDRwcTlvMCtSbGFXS0E0TGl2?=
 =?utf-8?B?bk5tdXhVYmxwSlBnQzJrZmUreFNVOFNCU2luQWNmQmhzZlhDNy84TWlEc0E0?=
 =?utf-8?B?NkFoL2NxemhqUDFSWkRySmFaUVcrZDBHd1Z3YTI0ZnplVHFCTkl2ZlF0YnlE?=
 =?utf-8?B?R3VkNS8waHVSMFVqNmxJNm5aN1ZJTHMyTk9NN0ZUUUNOZVRvR2NKYWFid1Nx?=
 =?utf-8?B?SzBHcXA0UTBDa3didlZZelNBdW5YaTlCNHMrd1A4dW1TejFEWnhJcGpPYW11?=
 =?utf-8?B?ei9kbXZDRGx0bGgwUkFrMTI1eVZjUE1LSkxVS2RjK0tkMGxleml5Vkh4QTRR?=
 =?utf-8?B?MzlIbmptSGVvVWRhNDBOWnhkSElzdDc1dHkzczkwRGpZZnZ0dnpEOXFWSStG?=
 =?utf-8?B?UlBxcVNHQWJmUXRoKzhGZEx1ako0OXZ6NTlQRkFORitjYzd3VVlHZjdtU2dO?=
 =?utf-8?B?ZHpYOXdWUG5jdEloa3hKU0JhS3Npcis0d2dYNFFvczI2VGhKQm5OY1RTeXdn?=
 =?utf-8?B?UVRVRW1GVy9KL0kxZGFqOHUwMkJWdXEvQ0ZOeGxoSThMYlZPK3hiUlNjRXJ2?=
 =?utf-8?B?eG1VT2dZZnVleDg5Z05LcHNxaVc1aktQL011U29aS1N5a21CWlJOckR6NGkv?=
 =?utf-8?B?L3MrNHhkZit5NkRyaDBvSjhIY3NPV3JBVUZIdEVNV3pNRVFhbE13RVFpYXlk?=
 =?utf-8?B?MkRvVGNSWnVJK1Baa3hzdVVYTTByc3JXMWxFWHhPWWZ4OTFtcW1XV3ZBa0p6?=
 =?utf-8?B?NU9mazBSTUNVeW83VmN2TFJJODRoTWVyRmZSV3N2MjRzVFJ5TlVIL1NjcWZZ?=
 =?utf-8?B?Z3FTZFZTMFdxLzhIUjE1NUUrcFFDRFdubWtYMGxnUkVUelkraWQvNWEvNy9a?=
 =?utf-8?B?aGQvZUlYR2UzazRjWFZCc1RUTUhDVnl4Ynl4U2ZnN0ljaDkvVGJ6aUlLbDF6?=
 =?utf-8?B?TVJJWmM5a3lLYUJjT0xSU1ZvcExjUld5L3RDZFNQcFI4RWlsV0dVaUE3YVpQ?=
 =?utf-8?B?Z1ZNeVNoMkxzQ0Q3WDk1NU0zSEI3WkRYRVdvTDBRYUFmN2VnbzlpMEs5SEM3?=
 =?utf-8?B?RTBmQnlNV05lQ0lrK1lPYWdUTDE0cmVvd3VNS0NERnQ2aEppOGIrZHZlUTBJ?=
 =?utf-8?B?UG9wZHZjMjZCdEtFU09hMW9RTFdKdzJrNmJZaXNad1QvdEVkVEs2TmIzYktX?=
 =?utf-8?B?RGJSYXFLMzNhaFJrMzIxODQzZSt2ZVQyaStXYXNaRGVSWXM3WVYvTlAzRW5H?=
 =?utf-8?B?em54anZ6TUZjbmQyb3F2WStHR1ZTNzJOR0RvTG51QXUxajlWcDJaOFo2YkNr?=
 =?utf-8?B?OUJ3UFUwNDEyMFVtRTdZeWIwSXdEcHNpMms3bm1FZXVFQUZ1NTRnQ1FvRDk4?=
 =?utf-8?B?TzJ5YXVST3NlSkVQQm1qeVZQbUppcXArb01ia05vdkxPT0lPSE1OWXBQeWR1?=
 =?utf-8?B?MjNZOWgya1M4U082ei9lTWhGWTZCbWMrNDVFOG0rOTlPSEhsM1EvSEtOOTJH?=
 =?utf-8?B?a1QvNWxxZWNMeTBTT2hjTTBDZTVleGJGMUZKYWhxVWhHVHRwWTJUblZyaFV3?=
 =?utf-8?B?NDVRZEdTUnUwMkdOWng0UUxNL3lGV3ZtZmFGRmpiMnN4T2orV1Z1M3l1VHYx?=
 =?utf-8?B?YWNneWs1b213a1NZeDRVWWxWeE5jaExRVHlITllNQ3FpVnRYM3JUTDJoN2Ev?=
 =?utf-8?B?eGdvRjYxZzd6VnJlY2pKTjRVbnZtaHh1SjNZL1VDNzdDNGM3UjQ1TGRYM3pT?=
 =?utf-8?B?Z0JPWWhWc1BiMkVoMnNicUJqWlN1SmxVc1N1WjdOWXlVZTFDTG5IemVKSExR?=
 =?utf-8?B?K2huTUFpWGQwVnJCRnlDSjFxMmJiTUpEdVZUUFhKTjlmUndmOS82T1ZoN1Vr?=
 =?utf-8?B?M2s1amsrM0x4cTVQSWR3c2tSL2YwWVJ6c2lKUmg2Zkk4eHArdGVKOTVmNExr?=
 =?utf-8?Q?pQ/lRDqCdrXCZ41s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b8968e-cdc3-45a0-622e-08da2ed98bc7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 20:55:11.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCkAidHYUFC/VMHLR48hwRNBc6GvYFt0tViMfwY8BnHddxzIZuODt86XAJy7Ms/JTtHV1qfyf+n8O0/GOugxNQzx0MIYwl8eN/6CoTnMO3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3881
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-05_09:2022-05-05,2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050134
X-Proofpoint-GUID: MtU7Z8Z7rEHBWyhcQGD0cKpMIfa78j0S
X-Proofpoint-ORIG-GUID: MtU7Z8Z7rEHBWyhcQGD0cKpMIfa78j0S


On 5/4/22 8:23 PM, Stefano Stabellini wrote:
> @@ -957,25 +989,44 @@ static int __init xenbus_init(void)
>   		 * been properly initialized. Instead of attempting to map a
>   		 * wrong guest physical address return error.
>   		 *
> -		 * Also recognize all bits set as an invalid value.
> +		 * Also recognize all bits set as an invalid/uninitialized value.


What I really meant (but not what I actually wrote I guess) was that now we are treating -1 differently than 0 and so that comment should go ...


>   		 */
> -		if (!v || !~v) {
> +		if (!v) {
>   			err = -ENOENT;
>   			goto out_error;
>   		}
> -		/* Avoid truncation on 32-bit. */


... here.


But this is ntpicking so for the series


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


> +		if (v == ~0ULL) {
> +			wait = true;
> +		} else {
> +			/* Avoid truncation on 32-bit. */

