Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27B3143DB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 00:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83095.153874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9G46-0004GX-Pj; Mon, 08 Feb 2021 23:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83095.153874; Mon, 08 Feb 2021 23:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9G46-0004G8-MX; Mon, 08 Feb 2021 23:35:34 +0000
Received: by outflank-mailman (input) for mailman id 83095;
 Mon, 08 Feb 2021 23:35:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DVmt=HK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l9G45-0004G3-6B
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 23:35:33 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69b9dbea-8abb-433c-8e26-7c4c714ceb8b;
 Mon, 08 Feb 2021 23:35:32 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118NOUER149491;
 Mon, 8 Feb 2021 23:35:29 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 36hkrmwpyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 23:35:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118NQZd1156628;
 Mon, 8 Feb 2021 23:35:29 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2059.outbound.protection.outlook.com [104.47.36.59])
 by userp3020.oracle.com with ESMTP id 36j4vqhu68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 23:35:29 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB3937.namprd10.prod.outlook.com (2603:10b6:a03:1fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29; Mon, 8 Feb
 2021 23:35:27 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 23:35:27 +0000
Received: from [10.74.101.99] (138.3.200.35) by
 BYAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:c0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.10 via Frontend Transport; Mon, 8 Feb 2021 23:35:26 +0000
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
X-Inumbo-ID: 69b9dbea-8abb-433c-8e26-7c4c714ceb8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=POYpBYt3+KxDmyUbp+MzcOudNXbZt7Zq8mS8+HAxE78=;
 b=Tdyjq4ewbUlJ0Qi2cIzw2xyiWRqdOq/oIQXmnfaCtF+p44SEEozxQ1aDWsdso2kOdSvV
 Xltw5msaruw9PWCG/+XpzvnFlPuTYKtw6OfDPsKWx1IuGCIP1pmyOsSLxZtpQpgvC8n8
 bDo5FfAv5yTRQ79cUchxBw3ABLLuNa+MRCh2jjREYCZgK7oYZTVkMZbEQik/LnKFMeWW
 ZBJF18RIFLJYsY1hnZacFO1XhlsGPNxZslEFVdFdruPraaOoZRxomCqW7ZESq/j/24t6
 ijrwipd2/X7yXVafO3L82cDUJFKimB1Y3qKmucRJa6XfvEhaUt8Qv1k5AfCRB2VrzB2R Yg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWaylq31GoAWTade8UFzPHUgagvx5bwWSt54sNe3H8G3D5US+N3w9n27clkdNvyexPSl6EMty0MJmTKjpRfjAj2YYV/+dmO9W6aI5I0kVZGS8fsIwCPBnvziQKJrFI4pTsW5N2alLQNujtGY0s3ZcxvcNC/8drEH9GR69yr5LTadp/YcqojlrC+0EsP38ayVVsm4oVyUyjg5SFaRxwnV+WaNLrq2so+zVuNywud963qBvvq0dbNCtarZIk+BhCzsoBxYTR+SK0ntHvSuQKQrT07KbVOQz0wtSrstbS4P8X+Z9ocwOLSWK+NFkJrM3N5Z0+9FZx9D7WHPQyQRBQ8INg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POYpBYt3+KxDmyUbp+MzcOudNXbZt7Zq8mS8+HAxE78=;
 b=efVuE/EOBradGKK28j85Gz0iEcVR0gm0ijkDvnaTAJtdWxNNlb/3kGCLkLd5tn8OTriyO9ISwRDJ7baT3oQLqzk1Mb+4FdeY53HiFCaCa1JQ7HOsdFdttwBahzfy/Aj50eYADJEk5vUpNH5XipeEMm6NzJjXuHG2bGDkhT7OoGhGAHZV5J7CnwwY1tc9S/BkIhLMEywcm8OptWRlW+GZmuCOdJq9OBDfaXWxx8276LF0XriHfPMC4p7bHid5eIma883i1IH9C9JMzwAnugffd+byyzJUHS44J+b1dnNzwaOKBwRJ5lCLU1F2rYkfmmHeX3/c3TBg+qIsQz0KBlfXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POYpBYt3+KxDmyUbp+MzcOudNXbZt7Zq8mS8+HAxE78=;
 b=kAxMb+fKO9P4iXR2GPe4rDzmfCR4j4IG47gE1snivWfutyE3lynJQOA3EVQK8mgiNiVhfq7AL4tzI1ZfeIL2r/MCvZSS7B3YrSm6rVkxIh3FlvBgEFQY8YkIqXA2JtQuLN3cSEVclM+cUKDy0DRcq/lBW0vKSnGWnoVmHe/cOm0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 5/7] xen/events: add per-xenbus device event statistics
 and settings
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-6-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <d218749d-92c7-f995-a282-2490fb13a458@oracle.com>
Date: Mon, 8 Feb 2021 18:35:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <20210206104932.29064-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.35]
X-ClientProxiedBy: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f78cb41-f1ae-452f-772d-08d8cc8a36fa
X-MS-TrafficTypeDiagnostic: BY5PR10MB3937:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB393773417F2FF631053B40E58A8F9@BY5PR10MB3937.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uWcgWUmJhvzm0ZV2r+ItGjccmzjlbQWj5MjTgggVIlNkfM3FeOsnXbH6LvFewtLboDowpB1OMeLxuiC8mAaeyX3ki/VEh6jcf9HPWce8KHcTR39VdrfVcXWlyyOUbKe7Ga0k8n1YeLsIVyOH3UJBWK0+9INjdEAiybNjTPmCGQNddf4E56rA/qHHzVuWCjIM288BkWI5ccJBqXABonpA565nRBd+bnpe/3VnmUFyEYv21YrRyw9s7LGF5HiFBjcfQanrlsZuAEYfE4KRypLhz1c4rtM1xP98+QfKS/CWG33qLyg5K6Ts20m3eXnCTfN2WRNysxN+p2Ho8czzhCq30PEIhsGSJ7GaULx1KLROql8NLnsipqnqlkfZcZQarZyIrdsadVvfhrSQ5l6/56J+spxvzFPeOxOl1IBl/3LF0FkPtIQ6sHFZozMpwpH6jl33ijjjMXKMVUbwVODftRT2tOX50Gti3rq78Yhy0w9oRgz42KzJTfNlDNsCbFQ3SesOo7nFEwGKBglYpFMLKhrJb/kNHgimmfRTFi5yRfgmePRh1wDaJFh58oMqEwj4wuc5FaTMtetWAyXscWiNGqDzNw5BCDdG1bpRo7BABVFfsHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(346002)(39860400002)(316002)(6486002)(186003)(16526019)(2906002)(31696002)(26005)(16576012)(478600001)(83380400001)(36756003)(44832011)(31686004)(53546011)(4744005)(956004)(2616005)(66946007)(4326008)(5660300002)(8936002)(66556008)(8676002)(86362001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aDF0NkhDcXA5OVdRSitIWnNvc0VMMGVCNnV0eG9pMjBBcS90YnJhb2lJOFlP?=
 =?utf-8?B?NDl2WGZtTDhZb3dRM2NKaFRCSlVXWit2RE1oMFlGdlJzZjVwUGljNjBKTHdH?=
 =?utf-8?B?bTZmMmx5MnQrMVp1OERCTHFheEFRNGQxQlV3ODB1ZnBNUXBjMHExdmtiMXVR?=
 =?utf-8?B?U1F2UmJVWGlLM3BvL1h4QU9sSm44R0Q0aVNRZEl5bC9HTWhCdm9wQjdvVzNI?=
 =?utf-8?B?bnJJNkVPRWE2TnJUenAzRXZINFp4aVNYNnFwQ0lIY1kzQm1qSnlIejJZQUVP?=
 =?utf-8?B?RFpKNWttL3Q1SFYzQS9jYXJuSU54NWJDRmkyVCt4L1pDbFpJMDdWV0dFdWFl?=
 =?utf-8?B?UjFqWlZIMC9vWGxtY29XVVBJa0ZTRGpKMW1BWVVMRUJPRlZHZldFeEUwZVNJ?=
 =?utf-8?B?TlhTbnZiU2ZSVUhjLzBsQUs1K2x6c1JNakFhVHJtcTJvTmYxb0RmQkpOV0E2?=
 =?utf-8?B?U0crTDgxemxMOW4rZXEzK1RkeStSdXZwSlFTYm9LQTNNYWl0ejVrbEhpRUds?=
 =?utf-8?B?Mm8xMU80VGo5R1RoYWNBWlcyTEVNSDFTWVY3R0FzOGZ2TCsrZHh0b1p6eTFn?=
 =?utf-8?B?cENzazh3c2xZdFgzcmJIOW9kc2paL0VSTlhQbnoxQlJVUktuSGtJVjQzUEZn?=
 =?utf-8?B?YTA1WDBXMVNMR0FWQUxJS1NHR05Wak93SEp1cEFSUEkxaGVkWmVVQ3dBR1hH?=
 =?utf-8?B?YUpmQjhMQ01UY0x5M3BjTUM1emNkSVBiK082YzE2TVJXZXlhN1ZGb0l0dVFT?=
 =?utf-8?B?ZUpjeDd3eGxMNUtjL0dybHhxQ0phM2FmY0lMZHFNUGxpbi9IaTh0WEk1cXh3?=
 =?utf-8?B?UDF5V05jeWx0aXBhNzBpN2E4ZWtJOGVaZGM5NjNaZzREV3doY3psbmY0d0Ja?=
 =?utf-8?B?VzB1bDcyTDhxZ1FabUZxaldoOGFKRFVKT3ljYWR3cHgrU0IxcGkyUlZtQ2Ji?=
 =?utf-8?B?MHkxamxGMzdGVEQvZkhZVXQxM3psOW5MNk1GUTQ5cHl3Uk1tVXBpRWNEK2w0?=
 =?utf-8?B?d255aXArdjd6TVlEblNicGJKcGhDWkI1amdsYjFyaldOcDROODhHYVlUNFlN?=
 =?utf-8?B?cG9xTXJiRS9qbEd4VTd1alE3bEpYZXFJbk5HQVJ4aDZaWm01ZWNvamlyNmQr?=
 =?utf-8?B?T1JDTHFWNnRLSmlWTG1mazBlSTFyM1ZJQU5wQUNVSjFjWHJJd1FDVVRiRnZH?=
 =?utf-8?B?NXRaMEhjekVFcmdydWhPU0VDZDhuVC90ektrZUhrbHNMQkhrUWpKTWFaQTBx?=
 =?utf-8?B?YjFLR2RrcXFLVE9tVXZ1SkpWZGlRTXJZeTNyR1pmT2FxMVRtNGFKL05Sckl1?=
 =?utf-8?B?Y284a3NpWXhLVTM1Q1R1VGZETlNqYVRKd3ZNUG8wUmF1V0tBRlVyWlN0N2Iz?=
 =?utf-8?B?RXhlSnFxUUkxL0p1REJ4SnNCNzZCclNpYVNUYTdkMThiK3BOWG9LUi9rdXRm?=
 =?utf-8?B?cGJ3R2xQRVBjcjhNeHBUOE1tTUpxcjdLUjgxVUt2cnRRK3RlUjNNalJBZ1V3?=
 =?utf-8?B?THhveHJlcHVtUXJ2ZC81ZlZoME1RaUErNEJmazBBUlc3Y3MyWjdQYUJFWmhY?=
 =?utf-8?B?ZG1KMms5K2x4WmV3bjYzZ1l2MWZUMElTcXFoVHFINUhvNVFLaWpRNHptVWpB?=
 =?utf-8?B?MS9QUmVGa2RITkpSQkdSYmEzdDduR1ZINkc1VHVWc2NHTUZkb2dlbjhWL0Vv?=
 =?utf-8?B?NmgzTGRNc0psL2VmcS9SYk0vT3ZCUWFJTE9kT1ViQzRHQzdDOTN6SXVieHJF?=
 =?utf-8?Q?ueUk4QPbLN70cWBAWKT6vljmShqMRWhrTYC15Vq?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f78cb41-f1ae-452f-772d-08d8cc8a36fa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 23:35:27.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVdI3luxQnN5IFlbz7g9GQexEkVL+N4Z/v8g3IxRnc+tj1rEBcM//VjFq/z4V/1U6CVwzD3ciNN7BOBT0gBqRr20gFEIwk1n4xWOzDRFsjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3937
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080130
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080130


On 2/6/21 5:49 AM, Juergen Gross wrote:
> Add sysfs nodes for each xenbus device showing event statistics (number
> of events and spurious events, number of associated event channels)
> and for setting a spurious event threshold in case a frontend is
> sending too many events without being rogue on purpose.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/events/events_base.c  | 27 ++++++++++++-
>  drivers/xen/xenbus/xenbus_probe.c | 66 +++++++++++++++++++++++++++++++
>  include/xen/xenbus.h              |  7 ++++
>  3 files changed, 98 insertions(+), 2 deletions(-)


This needs Documentation/ABI update.


-boris


