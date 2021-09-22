Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E705414B50
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192796.343434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2pR-0001J3-Gm; Wed, 22 Sep 2021 14:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192796.343434; Wed, 22 Sep 2021 14:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2pR-0001H9-DK; Wed, 22 Sep 2021 14:02:29 +0000
Received: by outflank-mailman (input) for mailman id 192796;
 Wed, 22 Sep 2021 14:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Psju=OM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mT2pQ-0001H3-3n
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:02:28 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b97125e8-7656-4356-81f7-5369d6edcb7d;
 Wed, 22 Sep 2021 14:02:26 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MD8Teu027967; 
 Wed, 22 Sep 2021 14:02:24 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b7q4rc5yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 14:02:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18ME0rL9096014;
 Wed, 22 Sep 2021 14:02:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3020.oracle.com with ESMTP id 3b7q5aqfr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 14:02:18 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5201.namprd10.prod.outlook.com (2603:10b6:208:332::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 14:02:16 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%8]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:02:16 +0000
Received: from [10.74.114.106] (138.3.201.42) by
 SN4PR0401CA0019.namprd04.prod.outlook.com (2603:10b6:803:21::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 14:02:15 +0000
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
X-Inumbo-ID: b97125e8-7656-4356-81f7-5369d6edcb7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vjKfXFb7ybIVhkg0g69KskKhyPpx49YcvOPdtRFCrm4=;
 b=i79AmjsSOBLRMEsbAAHkVlEQwF/wF1KrPsJ78rOUHXEtXHFsrFrB4jHImvkknYr+Qoof
 0hy7qiY9KW//SIBEYwI0JaqjEcLvOaC3fcYiPJOVnPPtu27Pz9P2cI+rAON5i4WSqRKL
 pzdbs7oz4LvmT+eGHMpUx6kFjed5PQGI7++dSYQgsHr0/bF37mTVtf0+/NsLIM8KUrf4
 WtJ32fMxJoSzd+j7K756FG3DXXGY0LpawlwpM2WocJZU0pOACrhW5gOAp+KJhlZmjYGS
 cLJ+/y4jPTjbG0bPHRZUd2Jd9U3CP9l8hi52trP3WhumixXqVUOcLdXcvll8n+a1xsaD uw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdKKwC6YsgBgQOggfkWZb9AjEgJKzAHxt36FmH7wOtNeSVOXKpwYbFonFkMBmDw+qP0lNk2GzAhdFDg8J6geKD/6Q30TYBIWs5J16vOmj9t00pPcivQBaOIFmMune/Mz0bUE1R4YnKYh2P4MRG7ODKr/EMlfqu884IRPTHSZbI4GlUGf90auZ7QIizP3UhdLxa5/WuJrtgeUmAj9nFJ7YzEfndbvZJ7BGfD2Xm5j750gSE5qGEal56f1LIL+RnPefIm8WnhYF6gQqI9ol+zLppgRpEmI7S6wiWntTDtEsCS/33z6oCRXAwBcUGBTB8ilpMu7uU+MdejQPoeC2BcBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vjKfXFb7ybIVhkg0g69KskKhyPpx49YcvOPdtRFCrm4=;
 b=Pe7zvmIwzilfbYq+pNXncD2MMOe6GLnvb+Yjb9CE839wXrrFhxIJojte9wdVtPiSIqYBS7ZP0bKABP3bNjSVFozkWO3T/ZFmWkgvifA0evYahQwOaFKdfq3SztbEWiorAuqCZ5WiQISxPE3sArE8aZc0K6+lQAnjK7+00C3wYJufXNEt3JEozpLCwzYJDmxYIQkoqVBLu32kl6+bSkSnABfn/uNhPKW1uxiilp34ZmSKmgdEj9uXsl9ZGX+GxWlbB5u5k69AoX0REWH2o1M8Xlas3pIRdHHYm5nk+Ut2j6Dv7TZ5sK+ZNJqG/T99A1FYD7Sy5K/sB+E0IBMO5j4kkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjKfXFb7ybIVhkg0g69KskKhyPpx49YcvOPdtRFCrm4=;
 b=ACTUAfh8ghMQcBCY+gJR+b/HcDLGAhEeJZg6A7Q7vQf84BB5jzQhq79RKUrRgiLRecWqhRzXB40aR0x4DRbrwSHhyGAC35q0/yvlmCpP2L8gi0mUIeUAweAFx7WxiIS1PWJmOHi5DVSPyFHBPG3Z+yJp4LvJd3z4QD0p02rlf+g=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 3/3] xen/privcmd: drop "pages" parameter from
 xen_remap_pfn()
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
 <036ad8a2-46f9-ac3d-6219-bdc93ab9e10b@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <53732207-cd36-2214-94b3-be1837957d8d@oracle.com>
Date: Wed, 22 Sep 2021 10:02:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <036ad8a2-46f9-ac3d-6219-bdc93ab9e10b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN4PR0401CA0019.namprd04.prod.outlook.com
 (2603:10b6:803:21::29) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10cde072-fcad-40c8-65ab-08d97dd195c8
X-MS-TrafficTypeDiagnostic: BLAPR10MB5201:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB52015EE5B096EA8B73AE71138AA29@BLAPR10MB5201.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NfWL89EPl6jiPr8MYN3fa+FydfBe36MoCAOf9Fu8roRxqXZ/G6Rs5urPe42ArFDUR/tOeE8JHbVoe+FDxu6Ycc15Wd5MMRH0Ef8cZTh1QC+KD25bSTdIwVx0vQboxR1ri7zPlgbARnzWH8wRSf2KSWf2EV/8lL3TbfLLur6EdEU6+pWCb08tP/GFbh6qtb3MGdTplBaxn9/+8SP+YgxcRLi/xDjYFrGK8e22ugE7tmhH4wbYg+fjPB8u7dMLh/zdgfU7UA0UCHaJluCZ2S6dBYaj49Ej8TJwjZSoDsOCJBqo6zdonI7awrqOMcIYoxlmGUp1IhGWxc+eUjpKyEnlrpXSsdRlDND1RLoZ7OmFJKguX0EmH9YTXmuP8rPeqjhd4yYjOHmi5S0q6Uwygk8U4P/4MNK5tv8H1jifkVmrfILMWeU+VhNi/ZPV9tUOW3PtU64/yxa5aQF8huO+1sjn4KMN66m/8+xwMYZ86vpV7q09Zguv4nemSWefk5LCKdSksKtL7LEduvWEHYNZl3lqQsNKtUoyJEzL0PdTLLbDEV+lubVPaKNGc5yNpXoS9/cTe3H48KQl3MhV1bQ7mhK24QKfiGVOJZfipTgTG8d5OurADB9A8LDDPM1OHB8GWO92M0BOimV2vrk58A/ejljlBSj2+XqNZP7VkOKMyu5AWWnPbnCuCVfZNFX9C7E/Xaqu8IWsD/tTFrPBEHkTMJi+PmS+hAioK9WW65nnngtPwrbx+HDuONODyuRiCq42D1GC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(956004)(38100700002)(26005)(16576012)(53546011)(5660300002)(31686004)(44832011)(186003)(66476007)(316002)(2616005)(66946007)(66556008)(6666004)(508600001)(4326008)(54906003)(110136005)(4744005)(86362001)(8936002)(2906002)(6486002)(83380400001)(8676002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2NGdi91bTF2QUUwWHRYQmY0cDhmdTJmYjBqZStDVHdLL0NNbWs4dGhsS2s0?=
 =?utf-8?B?TmhMTjNLVnpROFJjWkI0Qi9ENlRENG1WL3laa3RKNzRIRVJMUmlLNk1ObW9u?=
 =?utf-8?B?Zk1WcCt1S3ZSa051cnBUVU5zT3B5WU9adHZFKzNkV3pIQ3k5aDhrTUlFTWth?=
 =?utf-8?B?UlRYbnVUOGJyeFZtaHJMNDZEWGtodWFBSk5VSFcxaVFONmI5djRjUkxIZVE5?=
 =?utf-8?B?WEtZbTk5SkkvVkdJY3dxdFFaL2l3MjYwbW5YUmhxOUhSZTlGRDEycU03N0hj?=
 =?utf-8?B?ZUlXb2IyZkRqNTc5ZG5mQWhmVlR5QWd6Vkc0cU9nZEpFTEphSXRLcUJRdzB4?=
 =?utf-8?B?Vko0eWo3bG1OTFdVK0hEL2JKNzJKZWFjQXozbWtpa0oxcEN0cUZwQjFwVm4x?=
 =?utf-8?B?RS82TXRoRXVHVXNEMHIwRFRJaUtIekNFcFBmcElPUjEramFFWTIxamY0M0F2?=
 =?utf-8?B?dStlNkxhTlVFNFlXUU9GUDNNMzRGSW9PTkpqV1RlMHdQSHgxanJISUVtbE5h?=
 =?utf-8?B?SmNjN3V2eGtRSWNzTnBzeDU2RXFLb1NSOTBhek5pRGtPQ3hzbmY4NGJ1UnNK?=
 =?utf-8?B?OVhxeHdwd1FPd2dXV0RYUHFzTkhWd3U2dlFJWmNCN1Jjbmc4RFBnMVpZV1RR?=
 =?utf-8?B?L01xQUhXTVhNRVY0bUdOOU9SVStOUDNqNjNyNUVnaXY2RFgrRkMzZ25GdWk2?=
 =?utf-8?B?WDR0VGwrUmlmQzNQcEhqNHVSb051aE0rL3cxbTYxM3gxcVFtOHhVbjJHMUZV?=
 =?utf-8?B?K0hEUzNaeXZObG5rallHZ0pza010MlI1ckxSSHcyTWUzWUdqTDhkZ0F4UE5t?=
 =?utf-8?B?N3l1WHdHNFBaSEdKWHdjWklDc2lZRUt6UDFsZHE2VXhtN2J4cjZhc0pYSkdk?=
 =?utf-8?B?SnI4VlViSFlSZVMyMnVaaTVDdVNuSmtvSG1XRWRNZVQ4VC9xdlk0SWtycnBv?=
 =?utf-8?B?cWhwZk9aWG4yVVh0dUFtSk45OUliSHVjSHYzWVNON0s1NjhKVXVRdFQwZXMx?=
 =?utf-8?B?VlJ4SEtDTXBmZ3FBWWhTOGhyQUZia3pPVWs2YmM4NGpDS0pFMnoxQ09oeU9a?=
 =?utf-8?B?MStqZUJpNXdldGt1ZkIyK0xhMDdRS0F2QXQ5dDk3WC9jR1E4ZWZiWkE2bVZU?=
 =?utf-8?B?WXBSdTViK2p4My9rMzEvR1J6ZkR4MlBtbFo4N2RkSjYwTGY2aFZjMEIyb01F?=
 =?utf-8?B?dEErdFFlSXdlRkx1aFhrOE9NdmNtZEJLOG44cHllN0ZPaGhDNTdGM2J1RGRq?=
 =?utf-8?B?a0RncnR6aWJWR0pkNUlPYlpIRU1LYkptYzFibnpKYjE5YUFNYm9iWmtXVEpN?=
 =?utf-8?B?NWUyQnI1NDVEVlBoK0xFVDRsQk5PRURsalUwUmFMWStzQk5UclJJNTgzWitR?=
 =?utf-8?B?N3pueG9Fdjd3OENWM1A1MC9OeEV1di9TNjRubldraGRQZE1qTWRNdnV4cjUy?=
 =?utf-8?B?V3g4cjlJSGJUOVFXM0Z0M1owZ3k2QXJXYkVzeFdDa01rRk5YbHhLMy9EUkR5?=
 =?utf-8?B?aFoyWVlTYUovazN2RWdBSFZvSkpIRUh5K0lmamlPeHROdHZrMlRqclFZdTNo?=
 =?utf-8?B?YjlxdkFJYzFFZlBxa3QwMmczY3F0RlNYR3FSVThlR01iQ2EwZS9zZnpqcW9l?=
 =?utf-8?B?ZzBXQWY4NkxqYzQ0ZHhoNnNoUjQyVytDOWhHbmg4SHRCSC96M1ZBUVA2TDZa?=
 =?utf-8?B?T3hJZDI0ZFBuZm11Z2htaWp5MklkR0JMZC9tS01Oc2JUS1dPK2l1TmdDTTdk?=
 =?utf-8?Q?YC5zzDaMsCdaN9ram0scRfckdA069qW8dG65uE4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cde072-fcad-40c8-65ab-08d97dd195c8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:02:16.6291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8hvdfdMbSDLTyzuQddvfFiK+JWMKBkhE8SQFf2nO4M0HRE4vDnjTkFqRc1jkBHOygZWbkmtYmLGvS+N4ksApWh+ms6iaUwfPzRxgw8RQBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5201
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10114 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220101
X-Proofpoint-GUID: cloD8LtIeUPUxAx6a11sZF801fOJ2kPS
X-Proofpoint-ORIG-GUID: cloD8LtIeUPUxAx6a11sZF801fOJ2kPS


On 9/22/21 6:18 AM, Jan Beulich wrote:
> The function doesn't use it and all of its callers say in a comment that
> their respective arguments are to be non-NULL only in auto-translated
> mode. Since xen_remap_domain_mfn_array() isn't supposed to be used by
> non-PV, drop the parameter there as well. It was bogusly passed as non-
> NULL (PRIV_VMA_LOCKED) by its only caller anyway. For
> xen_remap_domain_gfn_range(), otoh, it's not clear at all why this
> wouldn't want / might not need to gain auto-translated support down the
> road, so the parameter is retained there despite now remaining unused
> (and the only caller passing NULL); correct a respective comment as
> well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



