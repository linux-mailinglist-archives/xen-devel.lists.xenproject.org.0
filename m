Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B235A876
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 23:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107983.206347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUywh-000121-Go; Fri, 09 Apr 2021 21:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107983.206347; Fri, 09 Apr 2021 21:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUywh-00011c-D6; Fri, 09 Apr 2021 21:45:43 +0000
Received: by outflank-mailman (input) for mailman id 107983;
 Fri, 09 Apr 2021 21:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vRME=JG=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lUywg-00011X-HT
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 21:45:42 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac609464-afdd-47fe-9c77-60c5a5bda2b7;
 Fri, 09 Apr 2021 21:45:41 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139LVwbn096277;
 Fri, 9 Apr 2021 21:45:40 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 37rvawat94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 21:45:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139LU99K005383;
 Fri, 9 Apr 2021 21:45:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3030.oracle.com with ESMTP id 37rvbhh7jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 21:45:39 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4782.namprd10.prod.outlook.com (2603:10b6:a03:2dc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Fri, 9 Apr
 2021 21:45:37 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3999.035; Fri, 9 Apr 2021
 21:45:37 +0000
Received: from [10.74.96.191] (138.3.201.63) by
 SA9PR13CA0135.namprd13.prod.outlook.com (2603:10b6:806:27::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Fri, 9 Apr 2021 21:45:36 +0000
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
X-Inumbo-ID: ac609464-afdd-47fe-9c77-60c5a5bda2b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Iqx9bxYvrKKNV6xJKE4/+ieCwFlSVLWcJGc+Sc/7Tps=;
 b=PiK0q1v1tabvrZB78liuob3R6F9msmvMZu2VD/By4RzieS85DebHoajJDSZNuL9x089w
 MY/BLeYsB6hTb2LPtKoTXt9dt6x35ApzM/nMpR484FsGxBZMBJoGc/dxSC16MUsFNPGa
 NtfRxUGVYHzYJ+rMrleJTwJvWb7HvAQTe4KKXlJfUIoRiea6NrSaNpXN4zYeln74pyi6
 qt8+Rhyl2Sz8sS6ppU29u9C4d9NiSMcIVaj+Atp4e/Vx1FPMGwS9c9bf8DuexAofvwT0
 p9VpOKi9hFcxT3ZUtwM2Lc0ZBC+0xdqNCW3PzCQgy+0pHij43DEEE1uXt2qAFMTYXojG 7g== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVJXYg+sqXgXKfQN1YF6UffheiFOZsqU3kq9pk5UkRPj1lpvlfovMxm3nWW4271BLBSw1IpOxNd0Ip2czYgRYszU75DSSpXA7JvAlph7aVthVA5EATUsL93H09rpz1LU4mBdnU18FyeFBomSp6y12TcWmX7zFFJcri2vJKeqn2GQBNslFOC3lxGACnXlNkWtOwN38xMXrLhlas7iyBUHeLFJlNqR+fUucRv2nWb5VgTJN+sF0Vyn+N8ZWq7wFoa+O677MK9vZqcLkMfqHu1WDJrPbnhiN6DXHxTKWXjSvcpSd9RYleVNC6f59QZ1iDgznxMPr28fOIuQSBIRgxpqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqx9bxYvrKKNV6xJKE4/+ieCwFlSVLWcJGc+Sc/7Tps=;
 b=O9/CnfsdgpB8xxooLIrV+buqEgHrXSlAley7vilbpZdrsqJ2tL+5CvN/X8KCbbu4tq4g6pdu4S+va3Gv/eXNDoR3zueaQWHBEogp+WPOGlDc9XaaRpNVlyIflGkM2MscvcgNnPSJYFX1xRGoxxcy8yr7R/LVBgTXP/3UGAVlhon6fV2DUAv6v9qD0LpWtxrxk4WW1CHRD//MZAEv/dTQspDYeb6P9uzk9ggn7daGr8Z/AzkEmk9MM/IVm1bfVoHHwV7OpZtjQrPJXPl+hUZK2bPD+QwMEspoJCZiIRxagDVdxL43AuzHmVjZncLMqCquQfRtWK7ZVVfaR0W3rlu42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqx9bxYvrKKNV6xJKE4/+ieCwFlSVLWcJGc+Sc/7Tps=;
 b=gNmIpLBdDygWBtRYrCOGB88AOdw2VFgOJTGBVw7GFN8bBPYI8iwgsrj/HnO5vOoJbBdbYC06j1KCLfMTcoEw4DtP82YTd6PyR6CcszqTNeppZTsuyi2sbaRHC9tJ6hTfJ3G9TJSuOQmPxtAN9uGeNn6NGOFWdgXv9Jyf0qLkWTA=
Subject: Re: [PATCH 3/3] xen-pciback: simplify vpci's find hook
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <158273a2-d1b9-3545-b25d-affca867376c@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <e9f358bc-e957-e039-235c-6a9f68328554@oracle.com>
Date: Fri, 9 Apr 2021 17:45:33 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <158273a2-d1b9-3545-b25d-affca867376c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.63]
X-ClientProxiedBy: SA9PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:806:27::20) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eddf57b9-9efb-494c-a6ea-08d8fba0cfc8
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4782AAF5FD1F14BE8475AE268A739@SJ0PR10MB4782.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k9U8ivp7EuQWbj56QiQU/V4yWSN0adREYhVVM3Rn8wk87LFcSPgAQ0Ce9jxkLMMfaSFracz2txe+IR2rwxRn9fFiqtOPqU/IKtPD+gr4aS2HO4knjvh98NUl3CUS5wgwGIhpXJBrqKsd1gLdXKCZHLMYeRIlZfK2gyb230dMmi4KU38kWQ36PyJgR82a2aUGiN2zTtjw6/hLZfWWXueNeWlE0AAQSzE7H1Bq6rHZiq+GkKEbAAu3aH3Csfe30GOvCzdKdF5RsG99+AUwUSRxHPWrOc38Ex3xrEGq2hKmi10+Z5Vu+8QXYdb3OSNWgO1/hkuvt0j64si7GVa+JfIhqyD8Ojg4IB+IF9Hgc/eN7d7fnuqLWSiLWVPc0rmVJm2hJdWy69pZ9W7lwMyV2aDl466g5R5LeHzIRCIp6FuxlJ+CHLuVlMCGSs61tbXAN7el3oSYuTfYpw3aUAoJ4HVCCP70i/oU1VtLpdBn9kUkpbIVEPUNYIb187TxUGSqFMe0zEVNAJc4yvzeuruHtTrYLtba3Xp/11IvGHwPtcoLxGxET56fBPCqjHaoZudY9ocECASQvLbFHgcHgGmv8el0ULQUsk9pzGazoVTiJrcUBQJ4Tw+S/5RmsxFhfacyHAQm9e+NS6+7FyCm4I+4kD20biOVvSE4Gj7rMaSkyB8TO/WPlIXJ2QGzIj6XVuA8I+IBdh2eNXIyF4qx8d65aiKnxXTJz2wQvNyRNEMIoFwztw8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(346002)(366004)(396003)(136003)(26005)(8936002)(16526019)(16576012)(66946007)(186003)(8676002)(54906003)(107886003)(2616005)(956004)(2906002)(4326008)(36756003)(6666004)(316002)(478600001)(86362001)(31696002)(4744005)(5660300002)(66476007)(31686004)(66556008)(53546011)(44832011)(110136005)(38100700001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TjVES1VGSGVRdDdhUkpBSVowMDB0YTZqUGs4c0YwcXI1MVJ6bDVtd3RwbWwv?=
 =?utf-8?B?T1hjUDRwV1l2cC95WVM2U2tFbEhiNWVnTmc0MGtnc2NKSFBRSmdCWjRFd08x?=
 =?utf-8?B?UllrS2dxSDNCdXBqNkFFWkEvMVF6VXBjUCttREN4WWpTWFJHUStZM3hUNkxQ?=
 =?utf-8?B?R0JGYnFyODljRExsajZTaXZvU1JCcmtkaXRBT1llSmkrN3d3UW1uYWVBVk1F?=
 =?utf-8?B?Mk5ac1FWa250czg4TnM3dDd6YnVHeWwrNmF6c0Y2b2VUaXNBby96TTZQS1ky?=
 =?utf-8?B?QWR2ZFk4L3pnSzV4SjZ5TFc1TlhrcnFVL3NsLzRyOEJ4UWRmQjdYa25oaXpY?=
 =?utf-8?B?eEpCeEtYSUE1QWVIVzVFQmVvRC83VG9ZRjFzSmVYZnROODJXZnNweXNpcDR5?=
 =?utf-8?B?VTN3U2pDL0tMeFRXemdLOWJGNjVSU3ZGYmQvWGtxcW82c055MHlyRG15Zk1i?=
 =?utf-8?B?NFZVQ3NkRmlRRkFJcjhPb29mVTQwT2V1NVhnb3UwN1lqeGN5eUQzaDB1d3hh?=
 =?utf-8?B?V1JJMTJtVkM0SVlDZFJwNy9UbnR6NFhkRk1tQk92cHRCQmNRKzkvWGlpRDI3?=
 =?utf-8?B?eXlOT3JvWGh4OEJXYU9TVnZoZ1J6WU5EeVpPRE1vK2RDRE5sZFFBY2dRY24w?=
 =?utf-8?B?QUovdkJIUDI0UVcyeHNhOUR2V1dqaHBGTjB6aHpHUVBSRkJXZGU2cFY5MW93?=
 =?utf-8?B?LythRVg0d2pmSDNKOFF4Y3FjZ3ZXSjJ3Y1diYW9ERnEzZ0ZXc3BndzNjYnZL?=
 =?utf-8?B?VkN5d0FxTmZTUzFiL1l5VVNXaVh6c0xvM2p6alAzeVpOQXpNbUc3RS9Jc3ZK?=
 =?utf-8?B?VGo0MnU4UmlIRjJFUDFWZUVPK2ZIcXlkL056NlQ1NGlqSFdCV2UwUmZ6UFNZ?=
 =?utf-8?B?Lzh5bXlBc3FlUUZ6YUdRVjUvNzZLQUtvcE1DVTI3ZVh6V0p4QkJhSGlOQldo?=
 =?utf-8?B?eW45b2x2ZFNSL1pUZWc5YzlLaFNlUERpNmNyWjczeTJ1VlN0RUk3N0JPbjc5?=
 =?utf-8?B?cWJXUFRNRWVKV0piSWRQaU5TcjNjUlM4MnY0Z1FnbzZtWGZxM3Qvbitva1pw?=
 =?utf-8?B?S1pBNkg2aTZSR2tZSmQ4aktJdFhkUTN6dlJ4dDBsMW1qaVB0Tk1rUVRFaWIy?=
 =?utf-8?B?MWlWVzBpd3BvVkJpY3RkZ3daaHZJb3hFeWRGUEJ6UFQ4a0pFQ3pCWlByYlZ1?=
 =?utf-8?B?akJ5eDc2eGxxOEFISzUvdGw3cTFjblExSStPYkNLaGg0K09UMTMzYkpHZGo1?=
 =?utf-8?B?c2hWR2FJZktrWElXVzlGNjc5YnhFMTZ1T05BV2ZnczFKYmdMZnNGTjJTaVMr?=
 =?utf-8?B?NXZNWVliOUhwUGpSV0VuMi9Ca0xQZW5oaklsYlc5Qnd0TlpLRDJWMHE2c3RZ?=
 =?utf-8?B?MHd4VUpGNzhrNjdROFlqVUVucE4vaGlSbDBrVDlDb3FTYjFsR1dtSjlic3VD?=
 =?utf-8?B?Yk45akNOWGtJcjRmamJiZDRDeis2d25lMFVwZU9SUTlJR29qQWJTV0dzRFJL?=
 =?utf-8?B?ZUU4c0IyWVJlbmc1SVJyaktCY1FtamFNUHBDSmxmejdLZlEwTFZSUG1tWGIw?=
 =?utf-8?B?RTRmSWZDdVI3OGtxMHE5MGRmMGFMSE4rZUZSSTlwMk5aK0hXUzBuNzRxWFZo?=
 =?utf-8?B?cnpGY21oN1pkbG9CbE45d202Q0lwUVIvaXdkVlJjMTQrbFZQejI1OUpsNzd2?=
 =?utf-8?B?OGxzVlVwOXIzYUpTODM0NUdTa1UzRnJsRjJuMzZoQ1d5dDFUR0pVUVhHbW9W?=
 =?utf-8?Q?Ruaq93pqFkPlK5VHRPSbBU3LuRwMWJXUgHGIGRA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eddf57b9-9efb-494c-a6ea-08d8fba0cfc8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 21:45:37.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U00qX3jz+p/FKRDPI9pNNLfk3iD61sWEaWNkyOXedDNsXBAzkNx5os+SdfwNwx27895HqbG9HRNWfcFWIboylze+Kuv0MZC2Hz9ExLMAuBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4782
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090157
X-Proofpoint-ORIG-GUID: KCSW-CiNeRI83mGjHM3UQvQFKUQauU38
X-Proofpoint-GUID: KCSW-CiNeRI83mGjHM3UQvQFKUQauU38
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090157


On 4/7/21 10:37 AM, Jan Beulich wrote:
> There's no point in comparing SBDF - we can simply compare the struct
> pci_dev pointers. If they weren't the same for a given device, we'd have
> bigger problems from having stored a stale pointer.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



