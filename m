Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2349143E8D3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 21:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218256.378606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgAlx-00065S-9c; Thu, 28 Oct 2021 19:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218256.378606; Thu, 28 Oct 2021 19:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgAlx-00062z-6S; Thu, 28 Oct 2021 19:09:09 +0000
Received: by outflank-mailman (input) for mailman id 218256;
 Thu, 28 Oct 2021 19:09:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dsiD=PQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mgAlv-00062q-R8
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 19:09:07 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fd5fe2f-1a45-4395-a34c-2eb3a89499a5;
 Thu, 28 Oct 2021 19:09:05 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SIjZp1021616; 
 Thu, 28 Oct 2021 19:09:01 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byja2ccdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 19:08:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19SIu2RH087373;
 Thu, 28 Oct 2021 19:08:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3020.oracle.com with ESMTP id 3bx4gt97ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 19:08:58 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2980.namprd10.prod.outlook.com (2603:10b6:208:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 19:08:56 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 19:08:56 +0000
Received: from [10.74.110.188] (138.3.200.60) by
 BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 28 Oct 2021 19:08:54 +0000
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
X-Inumbo-ID: 4fd5fe2f-1a45-4395-a34c-2eb3a89499a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=MF0710uZFyMs26KIjmJUd9EACMS7DQrZSFE1vH8ah9Y=;
 b=ve9DyOXfj7iinpnWGgA6SDZrMSICmDdStG3tcgXEEDmU0bfWbFnYZUBIdPwqd+YltJrB
 wC5xVBqL0jf+rkWmoJBNFgqb6phpeYQqI8Zl01rO8Bxanna3zk5KqwJu3TF1KrXd2Tm+
 /JVsp7jGeNBKUMm9o/dJLcb+ugJUcaGE72k38FTBIa8EGTBP5YZ3f+dcQtJ33Uf6YAho
 rHzFWMGgfz3spDJL0BLT7D118CJkzj7rW/cKUT03ARbBS292ryLbqklOFhqpLKcDGdyx
 8z+pE9caQgSRrl4jkY0VSfK2UMIxqHRUvA57RINvUcI1i9l+MrIV9NRwO/5WGJ0Kr/Vi 9A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWO8yqg6Kd2e1r0umMOS2vohgtXioIbSbXdOh9YkBecBfsxjtqWRZn80/QTzDwTKDRSnbplw/7i/Ssap42OFwIKx7eyPJX+qdQkEfkdP3FGIKSsZt2xwFCmW5D2j8o82kOYhJ96YCK2fbHEuSxl6AoN+OeV22cG1LiXAWFJHq6vwwyRcRT2SXdSnOJEZ8eELqak0uTMVoqHJQT0wn7y84GVkVUhkWHK2ib6IiM+5Qc3Mw7UyoeQx3EDIEwOv/tVJJXZxzMuVXCFTPsUe9B7i2PnFxNbRA+uxnFnXJCCzUkln0c6i9/kRqSykjezl8jndoamuONgQmIK6lUdWB6dPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF0710uZFyMs26KIjmJUd9EACMS7DQrZSFE1vH8ah9Y=;
 b=AKKBSCT9pEDbN/2ivhVXYuYM58ZlXIF+MEAaFR2bFKBqJLxVFKg3n8yLMyvpnyPahcqRUZF+yi3PMno/D/mONQxZsPf4FP2/OPxAethj13qi6Zr7hVxfKe0/PRpTgwSwzqAesfWdwct7j0Pj/BwEvgG3qCv0eagqq1SPpmwCKxPdJicDk3ZWyc98jxQpsX2AMIe/bIThNPng4RHpXEJ+NdYT1nVRO79hfBL+wo3SAdqDEWbZzAUBfqAF741JZdWdrvYJSDoapuBGlyy0jqqkXcObVTzNr+6eA58+oVbY/kjQt+yJ4ejQKVlQlPRpPEia3QyOHsT5KTWTirlmKmxjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MF0710uZFyMs26KIjmJUd9EACMS7DQrZSFE1vH8ah9Y=;
 b=LWnRZHtmcmryH1ypUHZwekXQOXOte64U069lRGPu9G6C21foEGH+w1PHFpa8c0rCGIHAMauAnRQkfKRI3TDEy2tbSz7JMG3GWh0vB3sHJSa1NZKXQ98RHxem8K0Nk2Rg4RP3M9Za+nO2EYaAT6/eYN64LwXFCm2WG+J1ntOx1Ns=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <0b1837f9-57ef-8deb-df78-cb7841d93d68@oracle.com>
Date: Thu, 28 Oct 2021 15:08:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88bb9532-1987-45ec-6265-08d99a466389
X-MS-TrafficTypeDiagnostic: BL0PR10MB2980:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB29805DDA338C841F5F3C8A8C8A869@BL0PR10MB2980.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0OeJwAGjgf2L1aEr/iFW9CImlCIDEzFnR4N4zYGDr5XDDxTHxsCUuZuE/zoRci1ef7z9LewTOhx4bMslOmWgLJH2fct3f2nAeOuNjXDKjTKkd1K5WMpkDUrPgIRaOw4oPoLwGpSG33fUZ/d15SI7a3fd0E9RcyCrfDwfp6vLMqMsRXZKs/Qx6Ppabx8n9UgfX02dUGIN2u1t/obPsy+Y+NM2uRoZX1j9qK1AM+SGgTc+nbDlSLBFnaHVXnyeEjFWvU9Wh990oXhlJjEe+dee9ECVIwc7md+luFC5kBXQHdH4r+W2kl1zIcwoHl17QgRGHHDozpEO8KHQ0qABvqgQ8K8DlcisyQEzgIuZozvH6Z6QhfwjxSeVbLolgcnSLsaZ5BsPQNGkOzT6YztDh0LWSnvN0+R4OoHzYCW0C94xXdx7fO+sFoAs6VZvBPCQNrRQChVMy5dgOnrQ3tggeYvyhy9KaYRnC7Nnr7DBSfqFWgRkgC9MLEy7drfe3LXBYhG4+DAMVSp6BJD6WE79Ad73l3dM2OOYOe63/3ZlA4eykLMoEIaaBGQPTKbCphIpJS9AG5SdNtIltlOWhEq9uY8ieS46fXPA49XR6TIoZ/o39MzLhiqbVHQbq3M+4hZ6acxF2U30X4k/lwQvkiozOlebqVjRwZ0hekMXAnw51zYJM6bjko7oJIJWrprDk0Qvoame3HYhk49BqZkyE7+SG/Q8wQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(44832011)(4744005)(8676002)(2906002)(31686004)(4326008)(316002)(6486002)(31696002)(6666004)(5660300002)(54906003)(36756003)(66476007)(186003)(66946007)(16576012)(38100700002)(66556008)(8936002)(2616005)(956004)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NU5jZG5KSktGNzBuZXdOaWlsK095VDVYOFppb0Uzck1HelZtY2t2a0p6bk80?=
 =?utf-8?B?b0p1aUJwSXY2cG5zc3BaanViMENjVVJtSVpCMHVHZzZFZUxNL3J2anNsMDZL?=
 =?utf-8?B?eEV4cHE0TU9HMWIxamxBbktHaU45a2lhMEdhU1BhNjhLY0NJUk9TaW9keExO?=
 =?utf-8?B?NkFYTnE0NzNsdjd3U2VpeEFjYy9sMWd0VWZtK2x1VmVQKzdORGxubXVQR0tI?=
 =?utf-8?B?bmJaZUNWNFBnVURtWUJocXhnWE5xQUZJdnowU0Y1c2pFWFFvV3V4Z3czczVo?=
 =?utf-8?B?U3FJcWI2bFUwOVNtcjc5cEtRV3JhQkxaZzhDN0JuOVo4OTErb1haL0FhYkVX?=
 =?utf-8?B?clNVUzhuaHphcmhYTFFMazUweVpLVU12UUpyaVVGaEgrOUZ3U3pwdW0zeG43?=
 =?utf-8?B?bUp5MkJ2OXRzdzFkeXBnVWZubFRUa0czeG5UTmFvRnFDdXlkRWlhalRtN0JU?=
 =?utf-8?B?YXcxTlA3QnJ2aVk5ZW5MMHhTbU5WOXo5V25aMEs2Z09nL1FQajU4ZlVDVDJS?=
 =?utf-8?B?YmRQc3gzS2hQdVNoL2hOUWtBdWhCRWV2M2lIbXZiR00xL3FhbTMrWmFSZjND?=
 =?utf-8?B?MTczTTg4MExlNzRBNDduVnBud2ljTTl1OGtFZ0lzM0VvME5TWnhxL0UwZEYv?=
 =?utf-8?B?aVFJYVpuUDZZY000MWNDS0pLcjZCRTNhTlF2dXp2MXlESDVZKzdEaTF5WE4z?=
 =?utf-8?B?cUxjOWlWa2xjQzh5d3NnOGVlTzNPYUxQZXpMYUQ3M2pyMG9WQnk0UytoSnpV?=
 =?utf-8?B?MWNlUUpMVExjMTA4YkJWVkU4RzJnQjVzZHdFSzM5Q1Y0N2xSa0VNQlJzeHU3?=
 =?utf-8?B?SnVuNUl6VHRUcXI2VzZ3bU1jQ0RNc0pTa2p0U2dPQkNwbEtZUkJ6TWsrblA0?=
 =?utf-8?B?RGhWTnZCaEs1eVlUc0NocU1kYWpmMzJkUWdSNmdPTGxoanBjdkZ6bHNuTVhm?=
 =?utf-8?B?cktlcU40ZmVLRlQyZkt4YVBtU08zMGVKbWVJUGNpejZzZ3AzOUJDMGZseUZ3?=
 =?utf-8?B?YlVobnBYLzNING52MDdOckRZeWp0Ny9aTW5CT1NJazlvVXBsYjFtL3hQMlN5?=
 =?utf-8?B?U0YzUGg3YjNiaVpMNmgyYzhTUGYwNlF6ejVOUUU0dGVPODlqZXk4ZEdYNGJI?=
 =?utf-8?B?ckFCVFdRYmZ2TEVKVzl1d0U2ZlQza0V3ZHJDdXpsbUdydUpKcURrbURqNTNx?=
 =?utf-8?B?Vzk2NHc4QlBMK3EvRk8zV21NWmNSdCtBK0o3bXRpcEpRZERldjh3SndQN1hp?=
 =?utf-8?B?SjZ2WkxJRGJRMll3RFVQZ284dmFrMFlkMkJoRjBOYXhpRlhWbGRDUFZkTjhw?=
 =?utf-8?B?MThkL2k4ME9IU3libTUranhuakdwNUhjSHdlNDZmTC9tTFRLNDZ1Z3RmTEpa?=
 =?utf-8?B?aXlpSnBodEVpMzFSZW9zaVlHM2daSE51UlNwaG53ajhSa1UvUEF2VEdRT25V?=
 =?utf-8?B?c2VvUy9TaDMvOWpTRzZLVVdrRExucUowanVQYUt2eHR6UWtZL01MM0VqUG9Q?=
 =?utf-8?B?V1RlZGcxQ0RBeEc4T2ROek9STUVhYzBwQzhxV2Q0ZGhtK3lJM1RmQm1xTXFR?=
 =?utf-8?B?U2s5dTFkT3NTVU9IdGdpdmFMZHNsbXdUMGNrcHc4dlk0SmVsMi9tSWUxbmdO?=
 =?utf-8?B?aGpucU9zVkFNQ05ZZVhHOWttMnZxdi9QRHBidzIxN0pVQ3VxdTlyU0dIZ0Nv?=
 =?utf-8?B?VENwZk9nc0ovYmg5Rk5CNWFqbWpSVE9EdFNhcnVLd3ZrQ0tYODErS21BODE1?=
 =?utf-8?B?QWxSdElDZDd5OE8yK296YzFiV3NNa1lKR1ZmQitHa3FYbmJHTER2a3AweS95?=
 =?utf-8?B?Wll6M21aN3VGTUNtTnY3Z2tSWE5oRmgwUUI5Y1g1dW1meUc3enZ1UGgyaUZ5?=
 =?utf-8?B?MUJUZi9vdTBWSmM2aTZyNkVTVWNhYjVzWlBhbUR6aTQ1cjZzWGRvdGZ4aUlF?=
 =?utf-8?B?N1NHcGV4Y0M1VW9QSXl3NytLVUxGWmEzWDdUaVRZbks5Yy9WdmQrVU0zakM2?=
 =?utf-8?B?NU9LOU0rVkt5d3lIVnVpbHNJelk4Wmp5YklrUXV1YVdaWm9UaXkveEM0enU5?=
 =?utf-8?B?Vlk3WU92SkpYaTFTSnVFeXdOUUR4dzYrbmpkcWtLd1RoRjFNVm9EWTIxZmk2?=
 =?utf-8?B?L1pxMGw3a3krWXNNNTh6UWx0cnF2RlQ3MjlycXlEdzJDczNRQmNRZVBnYnZq?=
 =?utf-8?B?RURocUZNR1liQmk1VktKaUZqUHJhdk9iY0R6eE5QVWFLQWJKamhuSjNZS3dC?=
 =?utf-8?Q?6phB7HTmS99wQBboBnLDhg0xceDPaKyJqz9EoC/vG8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bb9532-1987-45ec-6265-08d99a466389
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 19:08:55.9624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nnkcjxKWK0q00HGxr4/be0nFfL3PS1gE1U+k7NuJWAh5LpvdIAsXQQmgCSFUdmXvTA4IvgN1HlrtpQv1Bl3J0V1ZftqDgxRXU30hXP6B7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2980
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280099
X-Proofpoint-GUID: HKPxr1Rf9kkDtqz470HThbNiVPGDYUBf
X-Proofpoint-ORIG-GUID: HKPxr1Rf9kkDtqz470HThbNiVPGDYUBf


On 10/26/21 12:05 PM, Oleksandr Tyshchenko wrote:
>   
> +static void unpopulated_init(void)
> +{
> +	static bool inited = false;
> +	int ret;
> +
> +	if (inited)
> +		return;
> +
> +	/*
> +	 * Try to initialize Xen resource the first and fall back to default
> +	 * resource if arch doesn't offer one.
> +	 */
> +	ret = arch_xen_unpopulated_init(&xen_resource);
> +	if (!ret)
> +		target_resource = &xen_resource;
> +	else if (ret == -ENOSYS)
> +		target_resource = &iomem_resource;
> +	else
> +		pr_err("Cannot initialize Xen resource\n");


I'd pass target_resource as a parameter to arch_xen_unpopulated_init() instead. Default routine will assign it iomem_resource and you won't have to deal with -ENOSYS.


Also, what happens in case of error? Is it fatal? I don't think your changes in fill_list() will work.


> +
> +	inited = true;


I agree with Stefano in that it would be better to call this from an init function, and you won't have t worry about multiple calls here.


-boris

