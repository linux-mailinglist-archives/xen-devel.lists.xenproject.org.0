Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24F34206D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 16:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99328.188862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNGcS-0001oy-2M; Fri, 19 Mar 2021 15:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99328.188862; Fri, 19 Mar 2021 15:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNGcR-0001oY-Uq; Fri, 19 Mar 2021 15:00:55 +0000
Received: by outflank-mailman (input) for mailman id 99328;
 Fri, 19 Mar 2021 15:00:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2B3=IR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lNGcP-0001oT-TL
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 15:00:54 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96fdfc40-1b93-44e8-8bb2-1df0875adc22;
 Fri, 19 Mar 2021 15:00:52 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEspZ8124537;
 Fri, 19 Mar 2021 15:00:50 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37a4em07be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 15:00:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEu6pC014063;
 Fri, 19 Mar 2021 15:00:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by aserp3020.oracle.com with ESMTP id 37cf2vjgga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 15:00:49 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB3939.namprd10.prod.outlook.com (2603:10b6:a03:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 15:00:48 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 15:00:48 +0000
Received: from [10.74.102.27] (138.3.201.27) by
 SJ0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:a03:39f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 15:00:46 +0000
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
X-Inumbo-ID: 96fdfc40-1b93-44e8-8bb2-1df0875adc22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=yTvQAh21u5lJPTBC4tu7w6h3+TwtqNoE7L4tquNswHI=;
 b=DfBqhLY4/A142S9gfZ9hrlWuM7uRo4xo0S9vS4O+JsfVJW9erJKSnhJvWUpv88wq871f
 CoXx4hCC/g7tKU93h3S394surcVvITzTXY7j68yacMhboo43nRNYlSlHfk+4LVcebqVm
 6vNKtDHvXlXiTM6jWeBhfEUdia4qYIpiwSLKYWyEQlq34ZN+bZdg5rWYMs2JNxr7PNkY
 Hray9RfYNL7NX5LNDIktcQPZif5KdjLpgssXdYQERONE7XEWukaquYtht1Sx7yUogK60
 AepReKaw2Vrri1UojdjLD4o5qhl5zmd5xjkBfVcP/d2Icom6hPlgRwUg15GEZosNFDNc xQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q542thT8pik9jqMNJG88KY2YUKVs6EsWRSKZry8mrUG5rgBri+hyOWkSDD0Ckp0rW7xib37bB96iCIePEVMLOj8wTwVCx6+XoPIFhNi0O5j1jcQ5f/Q/zLfuYbhb8beNKowttBr/eMdTPRqurLCjdrbrD3oST5CwRlf4KXaxK/giYMU+3C8NSQpBXlUvXuRqa1iB+NuujhXClnJW4hOOPMPllKDunWjx1YZpo1p1oP1nwxv/KjY7VZ+5Yy/Bya1EHxeAAu/2z5Z68keYW0IL52xn2+eemcphfWAGc10pOpuy3pmnalCwZVNndGSJUv5UFBSjNSJfKzSM2Lu7jJYg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTvQAh21u5lJPTBC4tu7w6h3+TwtqNoE7L4tquNswHI=;
 b=oCiL0lplrA5gdkcQ4lbCl2r+Hl+GgGwbfeymh7FCkGOO1CooXVcWJqUMxzjTS+ULUz66m62y0xGqRvCe2/RpaTMedtBW4fJxaPKp0/cF+vn0vugLhhc4ziMXGtn2NVHbOm17w0XEsIQPNjudUYI09DNR0nt1tk/WEuj8PI4Lw4Ma6rT/2VAv9DIwqC8pBXo5s6jpm3KV/QC3CnFgb2GcXQHgcz8uAhV2SXq6P90EVb/tuv6pC0CH6ivyR4vlMFO3QVqCWOzdI3vEJUd6ak79Ftgs9sx9vPs3L87POElayA+NbGHN4QShoKCFQv3exdED7yfT6aaD2Jw+kLrvQRSkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTvQAh21u5lJPTBC4tu7w6h3+TwtqNoE7L4tquNswHI=;
 b=zSPpUP49L4cjvL8/RMr+O5BZJ2J4PXQ7MlkDdW0sRGAfEOp90s1Gt+A6OvpQlckQ03UqXNQnyY+HP2HLyI3lUmFnHmkJphmHatlXX45Q2sEW3EWbPsSOXPMD5ayMsKpl0thyXGmhYsHPl8tlK5LNJQe/y44MTGqtM992OTQq5ls=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
        Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210225235158.24001-1-sstabellini@kernel.org>
 <4707b219-eee1-22e8-8dd3-6b7d821de333@oracle.com>
 <alpine.DEB.2.21.2103181612260.439@sstabellini-ThinkPad-T480s>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <47d6b423-5414-f14a-2730-74834bfa18f5@oracle.com>
Date: Fri, 19 Mar 2021 11:00:43 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <alpine.DEB.2.21.2103181612260.439@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.27]
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59c3f1cd-c920-4a5c-d670-08d8eae7c763
X-MS-TrafficTypeDiagnostic: BY5PR10MB3939:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3939C9647223E19352592AC08A689@BY5PR10MB3939.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W9tC2pawP8oA3+L3mRLJv2mRAtiaBYbS2bU4DQ1harHsIrFlfQuU4evqrxDHmibmXlloKjppCk300ZtqHZkGI3eTVkWfcfPqZuL4Aclw0brR09UfhZxO3F8QXy7EBNrpEaqxn9WptW04trZj65ttfF1Odq4Zq1eV4dht1/YXMa7ZPBgnn6OpzfZDsUu42oguyw3JWQUOgKHkswb7uyQO91zWcGh9u0RwyIQA1E/bdVVX6heF71nL3Sz5U5DPEGgJ4ACsFUvVT0NhVuQ2RMi7ZhU3MDrKiXi7UcURYhgOGldjxh8AsFcQIque/eR0s9xGt2LVhEmZ0MBwMfpsSr2djXKSmc5zl0dhEpsfNH7fB0vgQC42e7Exg05pmfWOlivVz4fJJfXHgpCyALe4j8oPAIUpfKlpVtw4JyMrpu8jX+mUUXuNXq63eoxuwoQVCSY3rJy7mH75L/loheHCeMH+7W6SDken7jM2JEXL9ZsatPseUhvKdLhdavj+8d3bV+J27etMggc5yPnPoNVdP2M8LdpunRUAJr3gcJbflH1ZKuDw8i4UC/1rPtgmADzxI7cSncnL7DtE1Dgz84Cbeu7WjsOiRHVeqvGgT0mRwWtovIRGR+O9cRkIVPddm10cvoCkZnjd0HxrxdpIWQ1wKOrh2UFzgLDbWp386U6+/vSBnw6e4WeqpGbk+SoalQeS3ZQUOj+XHfwl2fJ12XVIH9pTwxWkdu77aPnzqUgIof/pKJs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(376002)(346002)(136003)(956004)(86362001)(2616005)(6666004)(31686004)(66946007)(44832011)(53546011)(6916009)(316002)(83380400001)(31696002)(38100700001)(66476007)(66556008)(8936002)(16576012)(186003)(4326008)(5660300002)(478600001)(26005)(36756003)(16526019)(6486002)(4744005)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eWlBVXhCNXZPUnBuM1E3VC9sN2w4S3hOR0dnaUJuY3FTTVBPVUxDSnBwS1h0?=
 =?utf-8?B?NUZGc3BaK0U0cEVsaThBSG1UeDVURlFiWWlTN01LQlU2ZjdsOVFCN0dHUnFJ?=
 =?utf-8?B?L0lHUE1hbkFwTm5QZnRqMitmVFd1WFczYS9LdDhFQ3JZdmVYS3N3aWY2aTEw?=
 =?utf-8?B?WEJVQWZCVWNwdnV6YmFSejhyRkl6S28yU1JBQVA0RWozc1ZhZzkwTFJRR0o2?=
 =?utf-8?B?a2pWRlhqQWJaNHhXb3JHM2xWUnVGZ2dINVhXSlpRRlFTWFZINEo5SFlQYnUy?=
 =?utf-8?B?bVhqUDJBMXhEY0ZoYUZmeHpnU0lMK0c2WWlWejJ6V01RWnpaRkt0bDlGYmhF?=
 =?utf-8?B?VVlyMW44a3AvK0gxUFliRHBvbUVZdGxEVTdtK0RUcnJPUnBZRTFqV3A5Qmpu?=
 =?utf-8?B?KzVZT1VwVVV3enErdmxlM1kyQWVOVVFtYUZLWnJKZXlaclhzd3lVRjQ5TlJi?=
 =?utf-8?B?SWtqZjdINk1UanRtSHU2TzMxcHVvUDJCVzNzWlB0TVVvcmRFbEpRWVR4U21P?=
 =?utf-8?B?eVcxcWQxR1dJME42WTljWUovQWtRbGN1eTNZbXdHUWdHTU9wZ0cwbXoyZ1Vp?=
 =?utf-8?B?VlVqYnRzNTg2ZXhpeHVla0t1NTZ4SmUzZVZkL1FTVWtNNTFaWmN2N0U4dGJp?=
 =?utf-8?B?aW9iRVFoTmc4S1I5U1FtZ0J6M3ZDNDIvbzdqZW1ReW1EdzNPa3ZKMmt2SUtj?=
 =?utf-8?B?UVloZDJwdWJMeGhQR3JpL1VTZG5BK05MQUY0ZWFXM1FJTXEzenEvSmh1N2Yr?=
 =?utf-8?B?SDBDOGhVNkNzdjIxZ014RUhZb1NEUVZUZjVidG9kTHBQL3p3NGNRbzV5QStr?=
 =?utf-8?B?VHZUV1hSeE9yK3pFQUg5NGUyTklGVEFjMG5kOGxnVkQzNFZEMDZwNzU2L0JM?=
 =?utf-8?B?THljS2lhalB2SERIN0haYjdQd3JzUSthc3lnSVJ3Y0g2Q2tGTVRHZThpTkF3?=
 =?utf-8?B?OUhGNlVVQ3pESlBOSFluNGQzWnJ0THlZb2NvT3lTNDVUV0E5L21tZWt4a2ZY?=
 =?utf-8?B?YURvaWc1MTgreWx5cC9uUi9aTGlBT25BS2xJWXBTdWkyT1RXYS8rcVd5TlZl?=
 =?utf-8?B?TGcxOXFjZllKNGFtMDhXZlZuL29Qbnk1WkhMTE11VUJiTXByR3BWVXhVQWZM?=
 =?utf-8?B?MEhrT1QwVnY3YytUbnlJaGI4ajEwcXVMb0gvd3FCUlNkbXphb3ByR2lYQTBx?=
 =?utf-8?B?bHJJcUl6dlhkR2cyc0ZWYTNJOHk4MW5tdUFQd1pCbHA2Rk5UbHZRL0k5RWdE?=
 =?utf-8?B?Ky9vMjhVL1NwSE5zYU5SZStXRHg5cFZ3a2xSaEtKS25LNzBsZEpkSjg2YnBj?=
 =?utf-8?B?cDlzd2RKZEhRS0x1WjU2V1ptdElwV2hFN081aWpXaXZsRExvV2xWQkw5N1JG?=
 =?utf-8?B?MWJhTm4ySXZZS1VZZXBkc00vcTBZUjNTOHdaSEFJbGZCL3k4dnJOSzVGUDFq?=
 =?utf-8?B?eXE0TG1EaS9tUzU0QlRwWmZXMkxGSjFKWFJhZmhzUm1PU09zUDg4dUZWQlY0?=
 =?utf-8?B?bDdZQkd5R3JUN21PRkZ4d2RCMnBVMmJWMStDT2VsQ3hQaVRRa0hsc1MxQW5J?=
 =?utf-8?B?emlranVtUG5DS3hZM2NXa0Vvclcyajg1bk50c3Ywd3FWSVA4MkJmVFBtQlRM?=
 =?utf-8?B?cmNnY0t2cG1tWVZXdWZZQjV6UktKQUZUOVRtMGsrRGpBbW9EMU9kNUZ5TGJz?=
 =?utf-8?B?N0U2eVNaeVlrVmhRZkVzY2Y1TWx2dlpwaDE2SFVONHRXek9JaDVvcjdINTI3?=
 =?utf-8?Q?RdcZADjqLll1y6R0bpmvxvR+SdjLXZ1uiusmgNl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c3f1cd-c920-4a5c-d670-08d8eae7c763
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 15:00:47.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgoxI5buHhMC+v+X0cIhu8lnTMOi48lmpBNXjmJy9fkMF6wG6DaAiy9LhRHwfNsMP4PWEAJyo6aKu1H2y0iSvee/6udyR8fhGqv5rWWCI0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3939
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190107
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190107


On 3/18/21 7:28 PM, Stefano Stabellini wrote:
>
> So, I'll follow you suggestion, keep the x86 side named as it is today,
> and provide a tiny wrapper so that we can still have an arch-neutral
> xen_swiotlb_detect function (on x86 just calls pci_xen_swiotlb_detect.)


But now on x86 side we end up with a routine that noone calls. And pci_xen_swiotlb_detect() becomes not __init and so it will have to stick around after boot for no good reason. (You could have made it __ref btw).


I think we should leave x86 alone. And if there is a declaration in include/xen/swiotlb-xen.h that's only relevant to ARM --- well, so be it. Or perhaps you can create arch/arm/include/asm/xen/swiotlb-xen.h


-boris



