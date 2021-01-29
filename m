Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFF330822E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 01:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77529.140452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5HFs-0004BD-Dx; Fri, 29 Jan 2021 00:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77529.140452; Fri, 29 Jan 2021 00:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5HFs-0004An-9z; Fri, 29 Jan 2021 00:03:16 +0000
Received: by outflank-mailman (input) for mailman id 77529;
 Fri, 29 Jan 2021 00:03:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz+J=HA=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l5HFr-0004Ah-1j
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 00:03:15 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4c0e3d9-dfee-49ae-90b5-5226628980d0;
 Fri, 29 Jan 2021 00:03:14 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SNxxr1171998;
 Fri, 29 Jan 2021 00:03:09 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 368b7r6r2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 00:03:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SNuEl2112396;
 Fri, 29 Jan 2021 00:03:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3030.oracle.com with ESMTP id 368wr11v3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 00:03:09 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3238.namprd10.prod.outlook.com (2603:10b6:a03:157::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 29 Jan
 2021 00:03:06 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 00:03:06 +0000
Received: from [10.74.101.127] (138.3.200.63) by
 CH0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:610:75::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 00:03:03 +0000
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
X-Inumbo-ID: c4c0e3d9-dfee-49ae-90b5-5226628980d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=kIlesV4ySIHUA8GsVzfzRvlw+bHCbj52vG1el594lsA=;
 b=X07h92yOGBHaPDqbULhjBe2rjBtrkwCVz+Osdmb2cVuWuU5Z9hgvTehDS3AxQ0JTqosP
 hzAWmYk0nsidyR28jw8VLoAGaPXUs48++JBss5wEVWry4eR3Hs9sn7odOEWgq0l1OApP
 VbDiVeJKCIRLO8WkaF++i+y9B0FMdi8NFhZA8Jb6FomqNAGVAMzCC8y+j/UbHcBdWHY8
 qcREtdyxuNhwplh6Kq1ZotOeXbDovZQDUnPbaw9u5DGmNGJ9ymb5JHuK0fyH40Ef0isO
 L0QLL8t9NKjWVNxevCt5XhirS6HzHh9qs3hxNuEzM8Bdc4jZtnewxZuP67HDITl06R/o gw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7X7fYREfk64VhnEmUE55JVVhPowpl0j7FVcOIG5pnD/CiNDJxfrGw2yC3xjlASPmtWK4glHMlJsUmR51E42/ZeblCivb7GrxRFG0MYI33MLJn1VBYxGRyFSX666a2A1JtLCNLaEc+p+AJFhzaFBMxpMxsUxjqdddDRoKtFgLHOpyEz04es+LkLpKYflWjinlnJWpgk/U5Tx2o9sP2B9GADYNAMqDQPL12e15gkeJYELMs0/aWAwh4BfjD4HA1k93KeEyM7qofwQMNMlp0GokzCGoHV8ME0qUm657tAk4OVIEtGEgowAhQKSaJV7Hee2EKl+l3AtOrNoWcbEhHu9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIlesV4ySIHUA8GsVzfzRvlw+bHCbj52vG1el594lsA=;
 b=j4hPqyk9juZSyxFv0xx280/PIMwP/Yv0zJtvXd8suPfneB8JEPfsltt7n041k3DjmzVgMpzSiInvUajk+kUyYMygOW+7hw/HUfvNic43YUmLl4yMFHOBZshq8cRxOqO9dhXYz9pmMwCAKzlRaMoGcG7GDf4gTfXfCBB7jUTpHPqa2Z2+vzAZugQbgQHMj/e12AKRXDY8BC+4FjzP936/L3Wm3HvveJhX0nbWoTXKKv5k0OwVBqwnl+sQlEZcc8+ELVFv0i1UudNOK5TdxHpBgLClBXFW2eSHi5plEhvo0e3SLhniRxwogtiSDT+8JE+Bhxfi+6KmrhuUMymHhFrKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIlesV4ySIHUA8GsVzfzRvlw+bHCbj52vG1el594lsA=;
 b=bPp2Cv2tVVL6DSyPeKe0RBrraJbpDqP7iZtWFAs5nLAWvKiIcBi6G7L5pQ51yfdGVK88S3veUHXQC+vBmmLPL22pmXEF8Ysp/XpIOaDjq5ssqF4qta8ye11a1tZZN922zDwggAUI9jJbiG/ud5REIQJJfWnsc3zEjoBu+JmNhSU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: Problems starting Xen domU after latest stable update
To: Michael D Labriola <michael.d.labriola@gmail.com>,
        David Woodhouse <dwmw@amazon.co.uk>, Juergen Gross <jgross@suse.com>,
        Sasha Levin <sashal@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
References: <2nft2kipqg.fsf@aragorn.infrastructure.cah>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
Date: Thu, 28 Jan 2021 19:03:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <2nft2kipqg.fsf@aragorn.infrastructure.cah>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.63]
X-ClientProxiedBy: CH0PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:610:75::17) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17694743-63b1-4c86-3f63-08d8c3e94147
X-MS-TrafficTypeDiagnostic: BYAPR10MB3238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB323844B23CE70927B56189DA8AB99@BYAPR10MB3238.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:115;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bjo4f3wHycI9Jlsh7GIkbRSyjjz0MmlB+v0N1I6wmq9xD0uSk6fzfUcLWwZaRkyGbzjBuXC8V3IoXNw2AXslGX7N/L3WIlvHoPEqFKqjzd0Q2i55kUEZJ4dBd3ND1jzV2Jvqt2NTU8Y7fJHjf7EXrsjHFtz1QjkOG4xYeEoxg6H/RB39epDpVHLZkW9/OY9HXz1WLVJExPX3/1X4xtKL+eovjJqXcQM3+QCGMJGWSE2geOL38t4fHOxJrlhU00t965UfP1k0UAMTgAjnwL9q7X0ACutSEo3r7T4i7CU5CHaM9bJKyyA7w4aWNixl2iBX2UiJOcz4Zdu0tX88XPPu0K7JxwE9KtREjS/PeS7kOTycYSiKjRpdjd62HMYlOL8wnpM0m6axpMhkwYhtuAiQqSCFS6nT60fYQj6+LEc1WfSxeSWEnsbHMwTTsrYMFS9e8blpMwHwdd1ZWUTBcu+KpqziFItlmt6ttI1t83ICoSlYJVK5psJ9cobLDR0y9I/S/fbN1FRe2/FrIoDyTq44PoTsqjHl3eMenOUaGr4GzLzKJ59kRT5tcSz63y/ST93jBFuf5XJCrFwYhARW5P3cdXrwC70CILOH/30Hyo/C1yU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(396003)(136003)(346002)(44832011)(110136005)(8936002)(36756003)(316002)(86362001)(66946007)(2906002)(8676002)(66556008)(15650500001)(31686004)(956004)(16576012)(6486002)(31696002)(66476007)(478600001)(5660300002)(26005)(16526019)(186003)(53546011)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TCtIcmxYeGd6a1J0bTUyOURmUFJLL1B6dytqNzBuOXdITXRQVG9BVW0ydWw4?=
 =?utf-8?B?aEsxVVo5TW5ZemU3TlowVGNzeFpPUk5aanFtbS9VK1dRZ0s5RWdYNWdYRmkw?=
 =?utf-8?B?eVNzVlhIMW4zL1FYdUVuOGZhNTJ6TTdGM3U2S0VRczZKdnFrU2FCNmlGU2Ja?=
 =?utf-8?B?QTFHcXliQWwzVzVrYitTOTRRclJzQUxjV29pa2Q4M2xiUUxWaFdzbko0RzdM?=
 =?utf-8?B?d24yWkxJanVHWTJrOW5Pck9zOXFaU3NQOCtPYjlrUkxkN2xiL3hldVNwR3FE?=
 =?utf-8?B?ajZoVHNHK2lmNUU5cER3Z1dSU2YrWkhSS2hDNVpBcm5QaVNTbUMxOVZ3K2J5?=
 =?utf-8?B?aUZnZjhjS1FraXhBcDRNMUl2T1dlRzkwYU9pQzlqaG9aWllsY1NGZTZKNXZa?=
 =?utf-8?B?aUJkZWhjaGhIMXJkWlVYenZPbTZZWWlRM05KSUQzNnh2Kyt2K2lVZS9sZkhx?=
 =?utf-8?B?NjhtTnhUcmJ4MzBFTUZSek04TTFIT0NhWHowVk5hRDFnbUNHdkJnUkRWZVV4?=
 =?utf-8?B?MmtmRkF5OCtnVTRiV3FUQVROWFRUWncwN1diVGZtaXJkSTdsZ21aRFJQT3Zm?=
 =?utf-8?B?VUl3eU9GeUMyd3NML2M3SGxvY1p4NzJrQWZBdllsN09RWWw5UVVBY21lb3ZC?=
 =?utf-8?B?N2V0RXdRekxyM0VSSzZ4QmV0NEwrSnpHdmxuZU9odkUzTlEwUDZNcS9menZw?=
 =?utf-8?B?RkEzNEJZaDdCQ0JOeUZTL0ovakk5eUZEOHdpdzlXRFRiamZHZXVXY2RrVmVH?=
 =?utf-8?B?dXc3REhma0h6WHlvbGQ2V0hqTGFra0laVGJCcmthZjRyVDBhaWQzYmlJV0Zy?=
 =?utf-8?B?d1VPeC9abW9Ia3l4K2dvZjR3QlN4K3BLb3VhQzJXQzk1bWZVb3lrOUM4U1Fx?=
 =?utf-8?B?TnJTdVZHZEpPcHpObTM0VjlRdEFVM1BhRCt4RXFiZXc3bWoyME1MOGl2RHU1?=
 =?utf-8?B?K09MOVRkeSt3M2pVdGFPSnF5b2tleFozdTczbGtCWVNBZWN3bmgzQlNJUnRa?=
 =?utf-8?B?QkVoYmQ0QkcwSGY1WXN3THFjZEZ5N2VEV0lCOXBlR0JwSHJkSkJzZ1k0SkFD?=
 =?utf-8?B?aGVoNERYN1o5RTVJRytwejcza3RKSHQxaWFxeW5KeEFiRWN2UmJjc2Jpakp5?=
 =?utf-8?B?ZjJ5U01wZndkd1VmRFRXelpkcTN2enM3QWhVVnBZdENJZEVjWW1IaGptcG9N?=
 =?utf-8?B?eVM2T2dsa1YxUkRrUjJ6MFpRT3ZXbDFZcG8wc2l1M05xcisvMUFYU1NLUlMw?=
 =?utf-8?B?OGtvM3RKMGEvV1A5WndjTzlXVHVId2J5dUg0eU9OcUJLNm5FTktsUTFBaklz?=
 =?utf-8?B?Vno1MFNqUDZwekJaN1F3dGNCSEFacmhkalZCRmZacUtQc2xaYnpRY3hjdkRs?=
 =?utf-8?B?TXdtNllGQWpWSmh2a3BILzY3dlFYSHR2T0g3WnQ0a1BVa2s4MEhtRmExTS9U?=
 =?utf-8?Q?UsYStyNZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17694743-63b1-4c86-3f63-08d8c3e94147
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 00:03:06.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJnOPcRMDKgMht8J15ot0e9eZmjSttLMIQCzJo8xZopSnWpvTReWUKO9DmcYs+yh+Z79Cn6jKRPAbx4s1eHpkPtQataRBwIsYGholNrrDSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3238
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280115
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280115


On 1/28/21 6:52 PM, Michael D Labriola wrote:
> Hey, everyone.  I've run into problems starting up my Xen domUs as of
> the latest batch of stable updates.  Whenever I try to create one, I
> get a bunch of block device errors like this:
>
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51712
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51728
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51744
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51760
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51776
> libxl: error: libxl_create.c:1452:domcreate_launch_dm: Domain 4:unable to add disk devices
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51712
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51728
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51744
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51760
> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51776
> libxl: error: libxl_domain.c:1290:devices_destroy_cb: Domain 4:libxl__devices_destroy failed
> libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain 4:Non-existant domain
> libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain 4:Unable to destroy guest
> libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain 4:Destruction of domain failed
>
> I'm using Xen 4.13.1 on the box I've been testing with.
>
> I bisected down to this commit, and reverting it does indeed fix my
> problem.  Well, this commit upstream and it's cherry-picked variants
> on linux-5.4.y and linux-5.10.y.


You most likely need 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1. It hit Linus tree a few hours ago.


-boris




