Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3531C3AC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 22:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85360.160023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBlWa-0002br-5w; Mon, 15 Feb 2021 21:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85360.160023; Mon, 15 Feb 2021 21:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBlWa-0002bS-2b; Mon, 15 Feb 2021 21:35:20 +0000
Received: by outflank-mailman (input) for mailman id 85360;
 Mon, 15 Feb 2021 21:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1d0k=HR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lBlWY-0002bM-5D
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 21:35:18 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7897ad91-ddde-4cbc-8b5c-822bea6edeb7;
 Mon, 15 Feb 2021 21:35:16 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FLYvnH117107;
 Mon, 15 Feb 2021 21:35:14 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36p66qw3tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 21:35:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FLU4Ld029654;
 Mon, 15 Feb 2021 21:35:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3020.oracle.com with ESMTP id 36prnx7r4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 21:35:13 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2808.namprd10.prod.outlook.com (2603:10b6:a03:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 15 Feb
 2021 21:35:12 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3846.042; Mon, 15 Feb 2021
 21:35:12 +0000
Received: from [10.74.96.113] (138.3.200.49) by
 SJ0PR03CA0323.namprd03.prod.outlook.com (2603:10b6:a03:39d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Mon, 15 Feb 2021 21:35:10 +0000
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
X-Inumbo-ID: 7897ad91-ddde-4cbc-8b5c-822bea6edeb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=t6ljEiRGC4oNugrEri7bzXoKa0KoqCwTlkn+NuRj/AI=;
 b=VbwkssN0brvGGRD8meq6qlSZiIlS4+YPDCvikRWgyv8Vp2QYhHxVk5yH226EC2ER3gzl
 usFPmmsYtNao+jQeI9qVeq0rTjPj26Zk8+5hA8L0xvjkBQG0Lj6NQxf+VSrtsxwWF9qb
 5EciVMhpeb88X9VkRlSoCkolNwPK+MxL9iHU5vuZBiRyr4SHWNh+qLslQogx4k7p5fRH
 MQcAjJ/ENxZru2wOThZfIlkjyvMYbm2hZ7uKmWExN3UY9qKUURmKqfiMQOHZYavkZA6v
 cpYZy06SMNlYVknh7CnfnNSpXQZPaQy2iYR9Y3/TQUromsYOBgbqqjh6eVeTvsEUFvGp YA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erVomIEROZIaL9vYiXh6qwSwCM1nVj3NXDuYih2+HjuBpVcCy22mhTBVA7Cd8qQm39+wUmlKiAD0WHH3xLfZrSQwosULiL8xCo2KckFKkCznjYPmqm3q6L4JK/+5ZTiYy+A4u+1rE+Bc/YHOI6gywfBrFFb7jQn4oaaZZafbwvIUZS5OMIXMtoulqIWkJskOC216LVgtssBrEnwRkjWfRxGJCurwIturTjVUKo/sxy7u4h56ifOsNwkQbK45dY2of/x3hdGLJAfeDtxSrdlaFkeZBxkJBf9jqyfB+CFCXyq5IoT58cmFT+TEJaCiZlN0Rq3/7HF0YZhMznpz/Ay35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6ljEiRGC4oNugrEri7bzXoKa0KoqCwTlkn+NuRj/AI=;
 b=T23XqMzxxujybVqwhEwhhda93JTgVRtGBfrggv0Fb9poBLRWspNywsDutUxWUTVrbx7THFRtTMqMp28uXUargHBFtH60VQMtTOlBe1pUIuAtRdhTKXowA7o/3xG/hFxxkSTr3HCbA7l9BLgvQsrRePXpnbhVwoapmUo4b2xhXqcEs50sRbVsVnEthFwpDiC9axe2qN8ZqEZwmzf/vf4X8XNHW+eeETuLTrGEBFJdgC8vUqhJoTEIpulDpjnomQapmJV6UHo3iCIhWhtZQ9InlEde7g/q6UC1z6caMlt45ujQ+XwwQIl8PGeNGIB6EpH3bw2EErS1Tz3o7mjS4IAQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6ljEiRGC4oNugrEri7bzXoKa0KoqCwTlkn+NuRj/AI=;
 b=bFZTFzIVHuJp71+F+Rcx4+CAzny/CgntECGCWIoXtz6FsfG0T1gFV4yasw4NzGMpVdXOOWTkGZLXNJ14uw/cbiaL6X+i9ZY7PVU4XG4mJh/YQW5ac70U/dKYiu6hrWVaNxCipwlgwF/LkCyQoEd6W55/5aVZCSjd5DND2zogNlo=
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 3/8] xen/events: avoid handling the same event on two
 cpus at the same time
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-4-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <6cc74d6b-d537-0e9f-9da8-45456f6b703e@oracle.com>
Date: Mon, 15 Feb 2021 16:35:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210211101616.13788-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.49]
X-ClientProxiedBy: SJ0PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:a03:39d::28) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa3f262a-dd60-4324-ed13-08d8d1f992e8
X-MS-TrafficTypeDiagnostic: BYAPR10MB2808:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2808846360EB00018A10E2868A889@BYAPR10MB2808.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P7ufO7x2Aw0PLH2cBYQjA2ICh98Wc/0dwBzs95wz38ejeoPoLrOqQ8V4Qbp93IgKSQTm7+zwqzJ2q+/0l96ZrSDZwWxm3crLXAgPKUVarQytsu0q4gU7eV+y4RpsTPcZt2V3oc4m9XWqpZpcSVCV8LK/Vtjwsv0fzxa+tyTnoiuo2z+QZN7cqDEvKbf8Qy1NqpYm/fi0c1xg2pGnwpXVj7iVueG6MfCK2VDBqhfFpxInrNNCyIs3BYGg2r3d1fNoXofGFGe1c8NBNCe+fjwZlJJnVPCMRi20z9J34q5LCswHUwgBG3vEOvjWxOA0nLsQWx6wHu7d70ZMk11gYXQIt04we1USvjVR4SNMc19Sqh0ucyUWEv7q9vx536Ug86H2GCTRa2gq5H0a6YdUNbY5ducl02zwuLkUvP7dTGgapKnTGy4XsMtdFzBKpxQ4IQRk6hcWSlO4C+rkQuQcajk2yUqCYvfgwIYqNWgIm2E1KoVwmwTuVnuoTiwttpQWKz2xOCU4rj4cb+sZ0PGyIjqCMEOPIrED4jiCq2sU1O7XXxpNEd0N1e2mfO1FCNXy17jzzlLQ/BjHLVDBGLv3fz4M7Ghb5uqkljM0FFWIo6ao0ws=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(366004)(136003)(39860400002)(2906002)(478600001)(86362001)(36756003)(83380400001)(31696002)(53546011)(66476007)(4744005)(66556008)(54906003)(66946007)(956004)(16576012)(316002)(44832011)(2616005)(6486002)(8676002)(26005)(4326008)(31686004)(5660300002)(186003)(8936002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MlBZWEhVdTdaT3lmVi9oVzNhZFg5T0QyVDhaWlc5SVFDMzFNbkFZUTg3UVZq?=
 =?utf-8?B?TTdxWUVLbXYvQzRxRkxKUGg5LzZ0c1RCZHM2aXN3M2lhTWJCdU9YRkFRUU1F?=
 =?utf-8?B?UU5STVNSdFcxTktSc2FwbllSMDlrUElKOWpSSFpjSkxLYnRCVVRVaVJRbmNq?=
 =?utf-8?B?NXFDYmIzQTBDT2s5RGY4Y2tuZVRPS2hxRTJSR2RaTjBldzMrZ0FCOTBxZGF4?=
 =?utf-8?B?a0NqRTBwaDJCZ3VVNnJPVDM1ems2cldVaFZhZjllbklOeWpCUU9KcE55aXpL?=
 =?utf-8?B?Q3ZHL2NmZ2JsbXU1c0NGTDRUTldCTjhYN3J0SE0ybEp0MHo3OU5PaHVsb0Zk?=
 =?utf-8?B?RWNYdWxNRDYxRGtoTkhXQ3o1eVVEVy9lWFZtQmpmRVIxMXh3b2ZnZ2FWRlo3?=
 =?utf-8?B?MmpHY3AyV2JKMTZ3QVBlNHpCM21aYVZuaUM1QTVHU29GRG9LUkt6dDZpREo4?=
 =?utf-8?B?SVBWSldnd0Mvay9WNEt0V1ZMU2U5d1Z1VUR1L3VNNzh5Y1lCQVU0UFhRV1BX?=
 =?utf-8?B?d3cwOGQ2OU9ZWUdnYTNnTW5tenp1ci93TkgxYmp3WnlpUVFray91N0cxaTRh?=
 =?utf-8?B?RTdSNlIwQm1IVXFTQ1NlK3ZlckZRWmQ2M29CT0xKSm9OQUtSWm42dDMwQzhY?=
 =?utf-8?B?ZHFITzk0Y01vM0dRTG8wVFFnL042OTN4RFFpdUFJbWlHSVV1SGJzbXJsV1l4?=
 =?utf-8?B?WmR6SzIrMmMvaFY2S1p3NmRTSG1kb1ZDSVFWYko4TnlGK2NDQ3BhbWJZZTZo?=
 =?utf-8?B?czFlTnAycVhOaGl4WGliTDRWMXRXVEtCWi8xSHJORjYvYkJrU1ZrQmtSSjlP?=
 =?utf-8?B?MkpmQ0ROOTUzeDZvd1FjbzRBWGF3TlVMY2ZaUDVuQnpyTmNVV0liU2xpYTQv?=
 =?utf-8?B?dklxSDRabU9YdVVXNkI1d3ZGVitSeFBUZFVRSXY5TWh3NE9jUUsvckIzK0xX?=
 =?utf-8?B?MEZhMUVWdUZUakVoUytjdlZlTEVJZ1FRS244T09Qa1Q4cDBuY3E3VkJiMUxP?=
 =?utf-8?B?NGczdGttbWRCdXZWVW1ZS1RhNnplaVNkZkltMEw5T085eHVDTS9tSGtucDVy?=
 =?utf-8?B?WFphOFRYLy9lTm0ydE13TjUvcER5WEtFdGlDQ2NPWFFGQURicjN3cXZoZzRq?=
 =?utf-8?B?dFpDaUNkUTlMUCtna0N3cm1rOXhCOVhPK0dRYTc3K0NwZ3Zxd2E1bWdLUEZj?=
 =?utf-8?B?VlUrTUxmNkdCWHRUbkdWUXh2Y29XUlhzYjNZNWN4Zk5hUkNHU1ptYUg0RFJi?=
 =?utf-8?B?UzQyekQ0WU5Ha0gvV2NydUZLYUo2ZGxUYkJ3YmExODlGUHhsL3lPYm84ZkpF?=
 =?utf-8?B?UnFuZWVKQ1NRcFJwczN5c3hYRjBCUUdVbjN4ZDRuKzNrNVRSRFN4RmhkVDdV?=
 =?utf-8?B?Rzk1c2pobFh6czVrdVF2ekJwNHNQeFFLUnNlRjhjZHJTVHM0Zy85dXZ3Wkhu?=
 =?utf-8?B?R1RSZUxpWUk0RnJwZWhwclVtSWJFS0psNTh5bVZCazZTT29JTFN1M2lQb2Uz?=
 =?utf-8?B?dTNVTVU5MnljenlML1orNzVmSXJReFZxZGNpQW55WnA3YmU4Q3Ercy9TUVlY?=
 =?utf-8?B?K25Uc0FVWHR6NDVFVGlZVGxWZVdpRUNJZXpXSHExTldvY01aSFNxd0czTTg0?=
 =?utf-8?B?TCtCT3NtVlVlYWRkdWRFdFBYQmRhVk5QWDRpUVNVY3I4Y0xiQUFSQ0pvOVdj?=
 =?utf-8?B?T2pPZXppS0MxcDlvRDM4blhjeVROZVZ2RlpZZTJPTnFhQzhkMmxia0FvUWxt?=
 =?utf-8?Q?qGsknww2O2eYTHhqJQRRvKUyzcWLMVD268LiD3O?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3f262a-dd60-4324-ed13-08d8d1f992e8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 21:35:11.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5y5OG7lZIri+uLa/pbR1Ndkx3TVsUByP9zfh8H6FcYHMzSVhjWTvWpzVpWkCleLZAROUThYXgG7A2NAImMty7UM5ViwqZFqV0/Y6VkZ4ALE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2808
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150164
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150164


On 2/11/21 5:16 AM, Juergen Gross wrote:

> @@ -622,6 +623,7 @@ static void xen_irq_lateeoi_locked(struct irq_info *info, bool spurious)
>  	}
>  
>  	info->eoi_time = 0;
> +	smp_store_release(&info->is_active, 0);


Can this be done in lateeoi_ack_dynirq()/lateeoi_mask_ack_dynirq(), after we've masked the channel? Then it will be consistent with how how other chips do it, especially with the new helper.


-boris


>  	do_unmask(info, EVT_MASK_REASON_EOI_PENDING);
>  }
>  

