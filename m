Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A29389A9E
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 02:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130533.244469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljWh8-0002Rq-H6; Thu, 20 May 2021 00:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130533.244469; Thu, 20 May 2021 00:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljWh8-0002PP-Dt; Thu, 20 May 2021 00:37:46 +0000
Received: by outflank-mailman (input) for mailman id 130533;
 Thu, 20 May 2021 00:37:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYVO=KP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ljWh7-0002PJ-1d
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 00:37:45 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08c007f1-a27a-4b3b-aa3d-5bb7429f5cfc;
 Thu, 20 May 2021 00:37:44 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14K0T4BE079521;
 Thu, 20 May 2021 00:37:42 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38j5qrb77b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 00:37:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14K0PNSK110291;
 Thu, 20 May 2021 00:37:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 38n4917d7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 00:37:41 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL3PR10MB5492.namprd10.prod.outlook.com (2603:10b6:208:33f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 00:37:38 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 00:37:38 +0000
Received: from [10.74.100.102] (160.34.88.102) by
 BYAPR21CA0009.namprd21.prod.outlook.com (2603:10b6:a03:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.7 via Frontend
 Transport; Thu, 20 May 2021 00:37:37 +0000
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
X-Inumbo-ID: 08c007f1-a27a-4b3b-aa3d-5bb7429f5cfc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ciWryW7wUTAk64dSUZKF3sWgeCfje7xc/ZurcNjaL/4=;
 b=TtFlm6ARGePbut7rkWEjw356lZfoE6tE8TFkkE8Z0fyqMnQrStMhDcjekwqy9B6AzSsS
 IgWpxavrIMPjPbW/4WJLtz9A0pzbI8Zj55Ljd815PBIKeaXyAEdeNO9eRFJLsRtZaJ75
 dqArJNxkCgKJ5KHH2HkTpcj0fpw18HLSTT6z7PyJtmN1yeVGMKDCIK9n79d4t93Kh03w
 32n4YYka2ta9xpLk7joFrq39xYj/fduspau3Tv0J0fgpBTQFi70x9HgZM7uCi2hgmRQJ
 MwaiPnMwtSMjr6AzY09syvkeYQ1Jk58xBf5UiXxdCkuGanT8XTL1v4+ZlDJpPrkE0g49 XQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyFQejNH3ng3eirCC+cm1R6vB3XVwZJDz1/md8ySuRaIFO4K0NNYgIoDkDI2dzLXVSwuDJKM945D1UxMvHkNPcwGQz4gHz5nlNv6glZLd/7d+Akvy8IWPun11HKUQsSOznAXOtNELWeGevsrlXjAHk0QcLD3gPC82LBS2g7uddnNmWQPs2y/wUAT9ohKmbPa0iXuzz7Pdt4BmUuQwgEI2JyFz7nZR4rwz6ZMfsXpWFoI0QxsePQyWPZQIlexuFMhzj7FPXRFuRkuHeNlPDmepMXj3M8X+u73CnLspL+/MgyN8eurp7nX51KQ0O4aB9Q9QN/E1a1K/s3/IvvygsICDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciWryW7wUTAk64dSUZKF3sWgeCfje7xc/ZurcNjaL/4=;
 b=NLYquX6CkddQpyGYWMcn3vuo9U1gl6cGa5dLtyI7avOi8v6/MWTy7WpGt4I/w1qyLWsXslo6HnILq7bQkgKG6m58SFFlvAQGpBu8nwTElD3Y3qqFNxHFccbhV9z/L6zzAQAQIZWxmVvh3bdLq+BPtOtTqdLNbSqBUFHykBucCqwI5G2CqXdeC4eN/9m8H2H3AuMhIr1M9aFtgN+wZI+ILWdEvvP9IyTeTXzpo/JxbxcCNJZR0BC3mMU7NqQFrOcCqJ5jX+Zu+E5VxKcSVUPx0PO7mnS/nGVp5Ucu1ebCDWetCL+Sn0m/maYZrs6MsEADZBD2I9eOimYij2xcN2+BSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciWryW7wUTAk64dSUZKF3sWgeCfje7xc/ZurcNjaL/4=;
 b=DL1V/6vZFqR8cva274/CXe6U6QSOc00xc+uoJjeDbVDgPWlUyf7uF8b20VuFHGnSqYAdT9KnyJr3s3lUHJmPbyW0khctIiH174uKvCYG7+FovH9MdvqkjAW9X0/ubLHGE4NcJhqCNLcE/bPGRqLhdxiGmecbIwR/3adu8YWhYSM=
Subject: Re: [PATCH v2 2/2] xen-pciback: reconfigure also from backend watch
 handler
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>
References: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
 <2337cbd6-94b9-4187-9862-c03ea12e0c61@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <7ba55a34-f1ef-2c2a-86e1-d2b104b88e54@oracle.com>
Date: Wed, 19 May 2021 20:37:34 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <2337cbd6-94b9-4187-9862-c03ea12e0c61@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.88.102]
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7c3cfcb-54ca-4d8a-d6c6-08d91b277827
X-MS-TrafficTypeDiagnostic: BL3PR10MB5492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BL3PR10MB5492E9E9BB2D75ED89E7F34F8A2A9@BL3PR10MB5492.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c388O39tNJYWZmcUiwZRqjiAPa7dMIJCNvLTTOdobekvBW1wo4bTEAMSm8EZ0arZh+KXfhD1JznO+DesW/R8rBQu3WLWsdwxhA94PVIAE51cd8WuJkZ5gtMPezXvOWeTDqPwJbj0jY714LJ7vQlkt0JpG6OIDWa1SUvI+wd95XNMmn2Ktt2zsnDkKmRuZ7CbiGB6kgksWvs6JQJ/ocIy0k4zQqu622gfIhsL0pjDRn8sWg+SNOrfWA3nWFqAD2coWKCE16/d1gWDQY+U8k7sahaxBsnA/oTN/oFMdCWzKiNbCKk1bl+/mjUDqV7uCrIxdlITnHVRmwsFJaZie3XQr3N8Uq7jYqMzM8Ljm4zV0voC4Kujt4BptxHyZOvF2Lz7SPeZQbDTP98Bef44gDPeIVCvNmryOErP1xCe5FHTZxOrKQKwNHIUD5JiEVlJb9nZlDPsNtGY3XTtCDL+dvK/7Cj3haMXupCNjr+8+92jXPap9aAaFROPoavJQ4CZQ+yczqd/uwGl3FpDySB2nyfGnBBt3NwD3K1VURBUTkMeMcREqjd0xPm4N6GCK7zPjRoFnkDmfj3fAvdQP6nz5peKrGmAxqQ8LckaQNxNCRST77iaeMqRPXSGX0NzgBuowO2mct7MJ8adiClZoC2NGDXLkEtbsLNe5UFCXvl5W61Syj5es5nTwKKk6zel4fukyiN+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(366004)(376002)(39860400002)(36756003)(16576012)(4744005)(110136005)(38100700002)(54906003)(316002)(8936002)(86362001)(107886003)(478600001)(2906002)(31696002)(186003)(4326008)(956004)(66556008)(66476007)(53546011)(6666004)(31686004)(2616005)(26005)(6486002)(44832011)(16526019)(5660300002)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y2ZZSDBUNE1BMStIcWRBVXhWek51YWY3TnhjUmZlYndMcEo1TW1HUjVWeVRL?=
 =?utf-8?B?eUdubmZBb3Q4YXN1ckZIMkhTYTVnc3ZISG8rZWQxOVBIS3Z3YXlQZWVYUUJ5?=
 =?utf-8?B?ajNvaTZUbXR4R1V1RUVVV0tUSXIyb3pGQzlTZ3NJWEZuTit1WDJueFU2NVV3?=
 =?utf-8?B?YkZ5WlJHS21hVmlWbGRqbUt4c3dYak9tU0FhaFd5UkhYdTBaUHU0QVg4MWR0?=
 =?utf-8?B?OTlRVlRqaDFpcWFsclBIOEFrYmtGNzJMVFlMRnlBR0ZmdWlvMGNGYUVxTVln?=
 =?utf-8?B?eUZSTWdiYk1VZzVCam90Q3p4TG9MdFdyRWVkekZBakg1Z29vTTdpa1ZpbU9F?=
 =?utf-8?B?eC9WWlBDN0IzRmltZjlyTmlEMjVKYkFyN09tcDdoREYrOFAvcW5lMHRieXBa?=
 =?utf-8?B?dlp3MHV1b09hN2Jocy9jVmYxWnBvMExBeDFYMzNEVGdPNXlwbW5tNWdYd2gx?=
 =?utf-8?B?Wm5XVS8wQWpXcFppbjBhQnVwcjMrbEJxMGN6SGhnR3ZWWlh2SWo1NlpTZUFh?=
 =?utf-8?B?SHpqZjV5eXd3K3JUK05aSkpZYXVIclZXSmhldWlQT0xXU2c5L0MvUDYyZ2JR?=
 =?utf-8?B?V3dTbmpFd0xoSlQ3TVdBQzQyVWpFUzRRNU9Vc21RdFp1ajd3Wm5kT0QxWmRm?=
 =?utf-8?B?OVdVSW5sSDZnaG9qbitkNW1laTNYeFhwRUp3M2lVajBySklpeng0WjU4b0Vt?=
 =?utf-8?B?NTU3QnprVkcrYm1DSnMrU1diOU0yd1JhelprWkUxQkV2em1xNllQelcwM01j?=
 =?utf-8?B?Q1N1Q0IrVEt6ejlKQVJvSFI1R0wvL0tIUFdSS0pwY1dnNXovcE9NbWw1OUR0?=
 =?utf-8?B?cVBVaEtCbEh3M3lFRENaR0pLejAyWEMyai9HMDhjNk1TdGhNbzhlSUdLc1hq?=
 =?utf-8?B?ZEkyemIxMExkejlOcGtGOTYxMy9ZVlVoOTZScWhnZkIzRm9IY05lalJPZ05q?=
 =?utf-8?B?d0ZNdkV3b3JQenpZRzlOOUVyNjlNSzNuUXl5cEhFVkEvUGZmbFlnWktxOWhs?=
 =?utf-8?B?YVd3WURQRGI3N1I4L0dkcTlYNHN6MTNMY2ZOZ3AwY0dONENiVzArTTBRdmoz?=
 =?utf-8?B?bWdqcE9IV2xkaC9oQk5mWFEzOTI4MDBqRDZoMDZQRmlyMXlUWHBudDFyUUlq?=
 =?utf-8?B?MTd1SXRaazlpVTN3bEJwME51VHcxS201d0xnb01PdFNucVRCMUU4YjdVUzIr?=
 =?utf-8?B?dEc3SnRUeW1DQnJqQmxTK3RYbjBpN0pkU1hmU2pSekkyaDBoUXpXdlV3MVBE?=
 =?utf-8?B?b0t0RmwwcWZtMWR0dkVSTUswcEI1YVVDb216TVZHK1N0WVpERnQzRGN4ajc3?=
 =?utf-8?B?SmVqalNyOXQ2L3JNcS9zOERsSkJXMThDZ0hYMENySWwzeVRlRHpkb042VXM1?=
 =?utf-8?B?VkdNY2JBZW5LdmMvVno5SzdZSE5mRTFNR3FkSW9BbW1qa29kQ29YZ3h2WEh1?=
 =?utf-8?B?NXVuUzVldTFDRERlMDNqTHJCS1NKaWgrSytqc2phOENmRytmVmhxZjYvTUpU?=
 =?utf-8?B?QmJXVlpwL05SeXQyLy91dnppeEVSa2V3Zk9jL0dzajRqeFRENVhTS25EM2or?=
 =?utf-8?B?L0pwVmN4N1FpdU4yYnlYNUI3aDRxczUwb0VldnkyUjg0V05qczEydi9ycmo0?=
 =?utf-8?B?ekVCTlNNYmorOVJuUWlrbGpMdmhKUWh4QVlmSGhRVnMzOHJDQi9lOTNDQjJH?=
 =?utf-8?B?ZkJGVng3VW42b3BvMGtjNTlFZHBka2lVdUhEbklZUmUyOUVXRVZrYUh0TDlQ?=
 =?utf-8?Q?OdgmZ849457rcRKq6FM7FUfdxgk1Hxrlm7Po/bz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c3cfcb-54ca-4d8a-d6c6-08d91b277827
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 00:37:38.3923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KM4P2WPpoEXy7J32ECXdlKKvRaD/9sUL6AjGsLOemISdR62x27FSZNQ2S7mZOglsSzqauhC/kSLuHu9Q/uoRIxg1e1uUjH9QhpFaPihssnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB5492
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200001
X-Proofpoint-GUID: VD7S5TTupQOwMdUknHP-If5-tN9loCKD
X-Proofpoint-ORIG-GUID: VD7S5TTupQOwMdUknHP-If5-tN9loCKD
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200001


On 5/18/21 12:14 PM, Jan Beulich wrote:
> When multiple PCI devices get assigned to a guest right at boot, libxl
> incrementally populates the backend tree. The writes for the first of
> the devices trigger the backend watch. In turn xen_pcibk_setup_backend()
> will set the XenBus state to Initialised, at which point no further
> reconfigures would happen unless a device got hotplugged. Arrange for
> reconfigure to also get triggered from the backend watch handler.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: stable@vger.kernel.org


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


