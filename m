Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCFE348510
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 00:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101221.193437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPCdc-0000PY-WD; Wed, 24 Mar 2021 23:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101221.193437; Wed, 24 Mar 2021 23:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPCdc-0000P9-Sw; Wed, 24 Mar 2021 23:10:08 +0000
Received: by outflank-mailman (input) for mailman id 101221;
 Wed, 24 Mar 2021 23:10:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egK0=IW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPCda-0000L6-SD
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 23:10:07 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb2f6a94-c328-4ed2-a7eb-1251200842c7;
 Wed, 24 Mar 2021 23:10:06 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ONA2xb038970;
 Wed, 24 Mar 2021 23:10:02 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37d9pn4g4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 23:10:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ON4tsp155571;
 Wed, 24 Mar 2021 23:09:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3030.oracle.com with ESMTP id 37du00fc8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 23:09:57 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2632.namprd10.prod.outlook.com (2603:10b6:a02:b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Wed, 24 Mar
 2021 23:09:55 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 23:09:55 +0000
Received: from [10.74.100.232] (138.3.201.40) by
 BYAPR08CA0053.namprd08.prod.outlook.com (2603:10b6:a03:117::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 24 Mar 2021 23:09:53 +0000
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
X-Inumbo-ID: fb2f6a94-c328-4ed2-a7eb-1251200842c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Io2lAihE3mQOuQ7rki9suM4viVm/JFb91YPnIilRCI8=;
 b=Py5k8o6l/pgPCAR7DEx9bYMqNKJOuzBB1gOZ3ig9hdVpySreWYt/U5TGwpZ5H190seEM
 JO2n8iivHCmv5b+Vbkk2Z17KP5lopNMJMK/pK4rTah9UqBZbKeTfQ221sQCMERa6mgJL
 7sH0Z+S0AY6PUJE1qGOTq4ujfcMyv610Co0OvMtOrOJh4dqzk6TqeaOsUDgKNwkwlDzv
 NYOxFBRLfRz8Peg0jhZ4pymWUnBtzS9vP318eiqgEwtFeXYuS0F8R8QXetmbrObxE598
 +aNf2MroNep2X7w3HtX70bk2WHesjj01dLKe/d2SCFTq1ZR3nABni5tYG6XPPsH7DXDe Jw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcTG725W8jhbRDeKi+s7n2vqKNSEmb1l3VYfTnaKMr9BksxkE9jxabsdo9tfLeFUYrsqGDIGE8YXnRT44jcL8/xJvF9RNWKGMbcEkQ7Vpe8oXGm33oz4xrVee3f/SLJZWPjPCs8UNCWNkF2h8KmMhFaGjh/lZvleI/91xgEBFspvL2JOYQa4e3gwNew60jIhrrjcWsLfmDwanOYdHH/y2iA4L8qt/8xdOhjz4g28AH+Hk7hI0RbMsnpUmMvuJPlJz80D2hLv2FYZZIrh60AZWNEBv1cuvlQsv0J9vrWR0+FW+YfoDQ0ZVC94lHX3TennUIaRMyt24KLvXkANjbIEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io2lAihE3mQOuQ7rki9suM4viVm/JFb91YPnIilRCI8=;
 b=JRLDFR2UguDD5VfbX/PBw4YtNpt3x/EUyByI3GNGVJQGiwlOCVIUfBsvoAWntb1XvreE+1wlAaIwfAM/5gYEBod4COFJ45AiUbGTdCuggqZbS8OsrJ09AUy2KKAIk2DJ535FAvFBGoLKwTUnDzY+Zd7tfBjKgIO3DhDwNvqGhrEpHea6OMAZxJusxYOVfRoV8hR1mR+5b2I3N5v2fXuRwwxO3Q81Fwj77XVZWFcOkbB66ykzNg5NUNYmgZx+/ufixRDVgH9pxJzVv+W8+arD5nW61kG4HBs5uyWAKYAuCUyGsTFEf+SWdQbt/WJ+r6h/Qo8qOgAaKQW1se9/kBPlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io2lAihE3mQOuQ7rki9suM4viVm/JFb91YPnIilRCI8=;
 b=Ha9MghV2NBbBh9wQGSI4JQ9+HHEoIppGIzHImk0iThVRoG6FG7PScBDbBVnx+tidiaRC7nYDmljIKn8/6GRkvz3GCa0SBxX/vZLOGmH7DcUghggDg207AzkG6jrQXUtyTwSyxHaRubwJ48YxO9iUpsQzIeThkTuC6TA06Sqqw8M=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2 0/2] xen/x86: alternative fix for XSA-369
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20210324122424.58685-1-roger.pau@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <6b70700e-667b-03a7-8f5e-937d5c45c79d@oracle.com>
Date: Wed, 24 Mar 2021 19:09:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <20210324122424.58685-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.40]
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba059265-bd32-4aec-fb63-08d8ef19efd2
X-MS-TrafficTypeDiagnostic: BYAPR10MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB26321C4A17F8B96D17B5F7CF8A639@BYAPR10MB2632.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ckQb0z20JdOZYGvomBOSsv1UDlYotxz6NLc7tQKpsJQ+P1MrejO8LFokvU+39nELzUV0jz0lUR+Fot4sL/CbN2WteKe9Ldo5H8yOywoyxyTk2lMIMfSGByJavwiwZSm5DkiKo3vEbLl8AGCzeL05UgFwPOZ7O5mddF+lwRmRGEdzzAbd59N5Syoe7PAZc/m0ZkzP7q1Vuke9MUkVAEnFvpghSkmGy0N5VNy3VqfXMULTlK71Cbp7smJjXuUKVYNjyUQ+uS0dQcKiamTm2pP4AeEH1tEj9euiDBnUUhg4ql99twELCkDeKBEGbqJNMZfH40LNaPzE9BBzrpTXGZfzJWM5uwRmqnyyPcZwmxIBrdYASSob6CthaqpKlzPTUHGc5HuAisQuAJsMfo8W9rk2mVjP86gGTE0wSw7uaOVbIwvp198Pyui9bG6q+vGGMMFTwOvWGSE6sLt0bX4AG8jzMuwLqXsT63OEydylbXoZIRig+byucEVyw5XEPcfpWfqrycxFQBNWh/WL/l0ZfrQmm2ZRqDA1CaAkDHFjUIiQOpbDymBPW9LzSlXZ9xh1On6EhFfA3XyxUlmBh5PR6mCsDlqQp2+ZcnneD9HdFOmhHZhNviTFFGUojwQptvFHUPkAGvh82BLoIuaeWMIjhoG+2OG6LHFpweQDiR52LkPoXPKyblyF00B3qw4Xt+QMwC0V6rqPC0ZOZlI9yyhRGDgAgk1HtIlllh5ayHGheS0dXf0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(39860400002)(136003)(366004)(2616005)(956004)(8936002)(44832011)(478600001)(8676002)(38100700001)(5660300002)(2906002)(53546011)(54906003)(16576012)(16526019)(86362001)(36756003)(66556008)(31686004)(316002)(4326008)(6486002)(83380400001)(31696002)(186003)(26005)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Lys2RGZSZFFuUTdNQ21uL255Z3hVeDk0eVZlM3IyNVBCaDBNcDJKMC8rUGlW?=
 =?utf-8?B?SVJhTkJ0bjJRMkRKUng1bS95ZGV1UkllUHhGTlI1akc5SGd6RVNnYlpVZFFO?=
 =?utf-8?B?MkIrTGZkSHBWRlpRUlFINE51RGlWL1FZT3hBQThQSUhsZkswT0UwQVZvMTNR?=
 =?utf-8?B?dFdUUlhvQ21kekFiTk9MZm1lcVc2SFZ2RXdkaTNQaXJyQjczdnVibXczZFRs?=
 =?utf-8?B?Z3NLNSt5dHQ3QkZPdGJjd0FydEFZRjI1UDF1VCtHT2pldGN3SW9aR1Y5cys2?=
 =?utf-8?B?VTlpOStUalNaM3ppL0d3dS9SYnBIdHZEeDcwa3JFME5KclpVbzZpZTFvTVAr?=
 =?utf-8?B?eFdJQTlBdWpOWmF0cXE1Tm5UUjA3SElxb3pUb21QcE92K2tjdzBxS25VNHpv?=
 =?utf-8?B?Qm4vUTVxdmFHL1pXVEovVWorbFJZZmlmRlF2MXl1RFhxZ0dkR2ZZUGZKUFpa?=
 =?utf-8?B?MEpaRHVOMVpkcTlaVWY1VXpyT21sU0pXdDZWZWFaUTMvYTVsSGEwWHVPdFJP?=
 =?utf-8?B?L1phWkRnRmZhQ09GTFBObWJqRURoK1UvRlZ6c3VQTHd0ZFFHbkdVWjRudk1r?=
 =?utf-8?B?RmFBNzNQMW9kRzB0NlRCaUJZeUtTZUduZ0RZNmdhdEtiVUFxZTRUa1FJOWZt?=
 =?utf-8?B?UUp2R3d0aElzbncwZUV4cWVlNVdUemFGbVlKUnUxVWhLaWh6U3puQzZPZFln?=
 =?utf-8?B?UFJOVDJadG12b0pzSTJ4ZGpGNmhKTXAzVDFRV2ZhRmNxZTZpZnkwZ2xNU2Y5?=
 =?utf-8?B?N2kwMFFWblBSNmRGZDQvbzdKSzFqSWQwODJkUGN2K3o2RVdWUzV2cVpxNkpv?=
 =?utf-8?B?aTFGOUhwRHpmaVFlbmpVUzFXRVAydUkwNUhWVDYzS25IZk5EalAzNFRkbmVX?=
 =?utf-8?B?NFFXZC9veXcrcnR1WE1SU0xWQkI0MXp2cHBzNDcxNCtNcTErbnBFWm0zZFhK?=
 =?utf-8?B?WW5XNnBGYnBLY045M010Wk1nbkJubzVrOHR2T0NxMnVHK0RSdTdyOHV2czJH?=
 =?utf-8?B?aEN5QkE4a2d0RDg2UEFvcXQ0L1VXV1Y0K2xKeGtMZzk3eU1VY24xVU1zTGRS?=
 =?utf-8?B?U0J5RG0yTHNuUWdXT3AxQUQvL3puc2dreW5LWkFLaDBpRE9ITExCdjV4ZDVZ?=
 =?utf-8?B?UGJ3dzBkRkkvZE4zNkdCSjZtaGx5b0llZkpWT1V1bzhMN011cmRQb1cySVRN?=
 =?utf-8?B?dytrMmRmWFd6ZFZGU2haUEd0b1VoWmVFQmJtWTFWSDFlZU84dVN6bU9lMCs1?=
 =?utf-8?B?WXh0Q3BwRnViQlRXRmFKS1RyMnRVZ2p2bVBtWWRteXg2RkpDUGlGMDJTN1JG?=
 =?utf-8?B?bUxxNmtUakczbUFBTEljYVNUZTd1VkIvOThST2dpZWIwaDhub0czQzE4ZUU2?=
 =?utf-8?B?WHpMREpHUHVrNDJMUjloT2lHUVNiZjJTZWFnR01wVUVpRGw5anhFeTg2cTIw?=
 =?utf-8?B?aHVRVTd6T0V0elpuYSs1NW5UeWdNM2Y3MDRUMWRQcjFqZDg4dnV1ZmlnZS90?=
 =?utf-8?B?aEpPc1piOTExSkIwYThDWXNnei9uWEN5TFhBd1k5ZExqN2xRWnA5WTlaSUpL?=
 =?utf-8?B?ejFPZ002ajB1WEhLWUg3N0Y2cjA5WmxZOXgwUi8ySmhkRC9xbGpzZExGL0th?=
 =?utf-8?B?cWhBN3Q5OVo0T0ZHUGJoZEFkUm9SNzZHNmZxZzAwNlFXZ0UweldiT3g5RVk1?=
 =?utf-8?B?SXA3NTc4T3F5eVBoNU5GK1hjbitkdFJaa0dycEpHLzdoQmVYY2U4NVc3Tm5J?=
 =?utf-8?Q?vq5BG4J4X7F3IZ+gCCzy9bbprgJT1BM+LG8NvfF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba059265-bd32-4aec-fb63-08d8ef19efd2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 23:09:55.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bdPrtrKXm83xqWLSEvJxX57gmUUNJd+NYprHYbVupfqGXA44wpZ5J2NiLNpnCdhKpztHM/guuY9ZlsniF18ep+qWpYomUlHRdlFDt9fYd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2632
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240166
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240167


On 3/24/21 8:24 AM, Roger Pau Monne wrote:
> Hello,
>
> This is a proposal for an alternative fix for XSA-369 that instead of
> special casing XEN_UNPOPULATED_ALLOC to size the p2m relies on making
> XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on the generic MEMORY_HOTPLUG
> option rather than XEN_BALLOON_MEMORY_HOTPLUG.
>
> I think this is safer, as we don't want to be special casing any option
> that pulls in generic MEMORY_HOTPLUG without XEN_BALLOON_MEMORY_HOTPLUG.
> Without this we would also need to at least special case ZONE_DEVICE
> which also relies on MEMORY_HOTPLUG, and is what pulls the generic
> MEMORY_HOTPLUG option even when XEN_BALLOON_MEMORY_HOTPLUG is disabled
> with XEN_UNPOPULATED_ALLOC.
>
> Thanks, Roger.
>
> Roger Pau Monne (2):
>   xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on
>     MEMORY_HOTPLUG
>   Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"
>
>  arch/x86/include/asm/xen/page.h | 12 ------------
>  arch/x86/xen/p2m.c              |  7 ++-----
>  arch/x86/xen/setup.c            | 16 ++++++++++++++--
>  drivers/xen/Kconfig             |  4 ++--
>  4 files changed, 18 insertions(+), 21 deletions(-)


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


