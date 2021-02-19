Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E486431FB74
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 15:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86908.163473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7D3-0005Gv-AD; Fri, 19 Feb 2021 14:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86908.163473; Fri, 19 Feb 2021 14:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7D3-0005GW-6o; Fri, 19 Feb 2021 14:56:45 +0000
Received: by outflank-mailman (input) for mailman id 86908;
 Fri, 19 Feb 2021 14:56:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rPBP=HV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lD7D1-0005GR-Ci
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 14:56:43 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee634ed7-9bdd-4ad8-8eb7-60b73af9827c;
 Fri, 19 Feb 2021 14:56:42 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JEt2uu037831;
 Fri, 19 Feb 2021 14:56:40 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36p66r9sd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 14:56:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JEtlTH009114;
 Fri, 19 Feb 2021 14:56:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3020.oracle.com with ESMTP id 36prhvqwnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 14:56:39 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3654.namprd10.prod.outlook.com (2603:10b6:a03:123::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 14:56:37 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.029; Fri, 19 Feb 2021
 14:56:37 +0000
Received: from [10.74.102.113] (138.3.200.49) by
 BYAPR06CA0065.namprd06.prod.outlook.com (2603:10b6:a03:14b::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Fri, 19 Feb 2021 14:56:36 +0000
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
X-Inumbo-ID: ee634ed7-9bdd-4ad8-8eb7-60b73af9827c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=bRxSbWplBavRs1LQ1gzX3mYcuKe7una/4Vqo3LzU7p0=;
 b=Qj3nhrhI69EsznbQ585tQ984C1xGOc1mGuXFxNkNm0Y5Cc4bYxPnn+6rvYNBgw8YYT3L
 KokV+2iqObSLYiCRuTuOS79+cUj76Si0NAnHZY6Dw09ZwI5U83NI8k33Go4sejuUURST
 dlcXgsHDXleYr+pYmecZfoNCAlY0IbnbXYJPkn6ZlNiEWdcHFZvDYkeF1LgOEhkQSo7M
 TRcEmJergrxojdrif5atLGi5AH/hxzybbRJ+q62qzMUhe0pIKhpwn5FYEtzl1XjQFgDK
 xKT5Nag9kWZvt5IMOBVadKJgzcunehTXdtHOKYxuyRVfflY5xGHGrGVZM4LekCgRadu+ 0A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6qprb7UXLoQkqSLLU/7JdgOKi/RKegWj7v+YnD465LNgBS+CvQKWuiLj6+t5DXOO4IfS7YGkH4wCVbb8TPTRlPt0+XZ0MDeBUoLUEZs6wuJ1lVDjIPIcypmJJ6wtYc0/0/sgLyWRzfODdAK1VVXR7newOfyV9C5hiW3I5EVjiqQFmACL8ejS9HB8ipPjxSUkN49iDfTxofzzO8f612ulJ9uOhC13oKQBx1pYXEpm/q9e5fC4N5M8xpHR2cQSTjvbHjN2pqAOUYOEK2kUGPZozyKGaBIaajKZ1zerTekouqdgxoRBJA3KpAdOCXcXAftuYWWhEXx9u4bCw9Q5GKmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRxSbWplBavRs1LQ1gzX3mYcuKe7una/4Vqo3LzU7p0=;
 b=Xzg7ubfP0IDg8rQxMz+fIOPkLQPc0scxX9DnmkbPFq/aQYV12BAkLZjPi9zyhH5OClQZ+CYsA76a5V/lrf0UIOLXc7fzsKJ12syfuvdSAHMOlv3tLmhdtdD3kvmBc6eTQKLqSw9bBL7jypvvRqg9fH9oRYK4xHE7bgzkbOIi+uIWLVEETKdSFCpxE2Eur9vxVkgYA8UyS/kcxkt2RXs3JioQL7juKuyGjIyFVC4FCsOOvFzfoYa7x2Odn8QyPWreN7KBT0zkR87SQLFoYPJo1EFcRTDnrmgmXVBNaE7IE/QwihVwi+44u74FTKN6asMxgTjQ61VwJ+nweQIidm0CrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRxSbWplBavRs1LQ1gzX3mYcuKe7una/4Vqo3LzU7p0=;
 b=Uw1ptUWt2zS3YZ3p9lsQVvDTrHPYxLmfWdgzpS1VKeAVcOQMXKkqkqV9LYHd1Cl78p69hY02ydPm2apYeeva6loYFiv7CgHsWuPTSoQeTWCw6jrpmnUZcdI319L/+7iAg/YUM7jZWlXvatioLxZczdf56+DkbsUAhI3exjWeM6Q=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
        anthony.perard@citrix.com, jbeulich@suse.com,
        andrew.cooper3@citrix.com, jun.nakajima@intel.com,
        kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
Date: Fri, 19 Feb 2021 09:56:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <YC5GrgqwsR/eBwpy@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.49]
X-ClientProxiedBy: BYAPR06CA0065.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::42) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6029434-4c19-49db-8724-08d8d4e68e87
X-MS-TrafficTypeDiagnostic: BYAPR10MB3654:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB36542292772E13AC4295E4B58A849@BYAPR10MB3654.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zikiqoz02OsF5q6jmVWNx3g83h/oQVt3Z903rC03TJMW1D4w+cxzR35R5a64zvJlQe+XslAHqnw/WPRx9CVam+4nqQ2NmaF+VNrdgPACsfWmOeE+UPeKrhSD8wo5vJaqPjYO5GYw9/nsFzaJAr5g7MFp2V4woGlXNzBT68wPPSF9FkzYGTT4XLn7DDTyim1oOl3FNCUle0ogv5fc6NdKqyYuOHY+28WEZELg4OTqLNuTE2DDDg+tmdy8BJlGQWPR9Aak9mo9cWbP48coTiLX5TBBoKLrfQBdZxt7zoAzOab+zMU8Cp6/z5iYzCnoMxJBY9AIAICbJLQYaRfdIAaNQhqrVi+d+8FnrODKtX9+5N+67XzpkFAJzi44mDuXB3Mwf2sVbJnrJoHrvwh7+yF0GVOmEtoM6GeNhAAHDhcJ/KqxjzE7PimYl3Sg7WnpWczbWivmXY494De+UH2o94I9gwVJJPXASnN0OrEEOhBuzYIqq+d7Q2DNZ83S8a8rt8K1prC8sukbabpXDeSwZI9MxjHG1X9ZM4qdU8uJc6dDLhavEJW4DBl5MT48p8RD43iEr/QohbAXykCQ096UBHiOTrKBo4qYWLkTFi/ZkNYgT1s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(376002)(39860400002)(346002)(66476007)(83380400001)(66556008)(31686004)(36756003)(5660300002)(186003)(6486002)(4326008)(53546011)(4744005)(6666004)(44832011)(2616005)(478600001)(8676002)(2906002)(956004)(26005)(316002)(86362001)(16526019)(8936002)(31696002)(66946007)(16576012)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QTR2MmRHNnJuSGJ2ZWFZNGZsYVhFYmE2YmhQTUFiUkFGRXhndUlLRU9JUDlX?=
 =?utf-8?B?WHFSWmNPWTk5K3kwWDRHVC92OW9pcjVWdmtXb2VhWG1xM3ZFREhoejh6RDRt?=
 =?utf-8?B?SHdWZEFheTlIYjRMMFdIWjF1Z2VOclhTQjlEMTFpMUxseGJqTm5aQU1lVVRO?=
 =?utf-8?B?QUhiQ1hnOFF1MzFFS0FFRzd4R0YzVG1aN2hpbG8wdjgyZWpTZHE0dmNKWFR1?=
 =?utf-8?B?aEJ6Q3NsMXFGaWp5b0d0UU1FWG9qY0JDWDJsNE1CTFg3TlB0ejIzN3BXeUFh?=
 =?utf-8?B?dUtLbFlrS2c1Ly93a05CT0FzTytjcFRkSklQM1ErOGs1Q2RHMGNwLzY0b3hs?=
 =?utf-8?B?QndBSnREaWR5aGp5Wk55Q2NkUW1QN2U0VnFsUkttRlY1YTNoL3MwMEZSV28x?=
 =?utf-8?B?SFpBKzhXcXpyWXZ3MTZkQmNuamZYT3c0YlJSaTZzWWJ1MXdLVFJwd2VBMGMx?=
 =?utf-8?B?Q0lPWjQxcTRWUW10UDM4Q09rcURlcVZRZWFlN2pIZm9OT0VaTFVMRTVSbGVW?=
 =?utf-8?B?K3BlbU9mUHhEVUpzeW4yVWwwQ1VEb0drZGhMMWRkYkx3SGVldmh3ZGUrRVd5?=
 =?utf-8?B?ZG5XZmtUNlRUcitodTQwS2FCVjNaVHV3TTFFUS8reEk5eUV1N1daVDdnMExT?=
 =?utf-8?B?WFJLYjdoRVlobjl5bUdobzhiUDh2MktwWUpEMGxuT3RmN1BuVkV6LzE4REJH?=
 =?utf-8?B?Zm55YkVaL2NpQUdvSmpFNmhHd0VVdmh5MThvRnVYL0hqekFtcXFCeWJ3RkZs?=
 =?utf-8?B?T2pkeXdYMFFTR1lYZzZOVGo0eVVVN1hkbjhSWTlzSms2SkhraUNWNk5yRkNN?=
 =?utf-8?B?alpFS2Q2R1VPbWJzYjA4T3k0a0FaaXNnUUxiK2REN1dGT3NnaFdSRzRKUGor?=
 =?utf-8?B?UUxEaktuYUVyOUYyKzVYdVVsc3J6VVpmbStqY3dZMHV2RkVXUU82S29pNzBy?=
 =?utf-8?B?U21PWnF0OVVucmNSeTNnN2FJaXJJaVdOY01UYjJUblhDLzFScFNnZWtDRzhh?=
 =?utf-8?B?RGtnSkRlbjJLYkV4ZzRFa3VOeWdZc3UwWGM3RVZMQ2QyYXpuRGNzRG12Y2h4?=
 =?utf-8?B?Vmg1T0NTYi9DTUV3WVNpUzltQldiUHZjYkxTRzhrSXg3d0RLS3hyMHhJZ2Rk?=
 =?utf-8?B?TGVwWXBSOVZLZjFDL2F6bUNoMEExdEZETFVCZEVWaUc4eHJZTFZoTGw3Q3JM?=
 =?utf-8?B?SldCYjZoemR5MU1MbS96cHNtT3NHVkkra0hiak5OZXFCSDhGUmw5Y2lBV2Jq?=
 =?utf-8?B?QVlac21OcnIyL00yQzY2OXpWMnRGOERsdUFQR241ZmRvcmJjRW5sV3M5YTdE?=
 =?utf-8?B?K2p5SVlMRTI2M0VXQis3dGRuMk1MdXJEMVp4NVFXeE95Wk5QQXVLaGVqY0pS?=
 =?utf-8?B?MVF1cmx4MUJSd0N0YWIvWVJyemhpU3ZRV080V21uelRDYXFsTnhZMEN0dG5h?=
 =?utf-8?B?YzNZcjJHOC9sVnBvM01IY0NPTG1tYUJPZXYvajNnNUZVRXNkeDdJTEJSQnYw?=
 =?utf-8?B?TWUrMEFxWDJQdi91b2EyM1hQWEg0SEJLV2s4QWJhc09DWXJrRjlxdUtFOTFR?=
 =?utf-8?B?TUI3cU5qeEpUUWVFNWo3ODJRYWh5OVNJeTZCbVcyMHB5Yi9GdDZTR1JFa3o0?=
 =?utf-8?B?RTFjcHRTNHMyaUVHM0FhMVk5MUtvbUVWSHFOelJqSXFadzhPdGYzRFpEN3Zo?=
 =?utf-8?B?WllPSFpYdHZHNkNyc2tTdzd0THVLYllXWnVQcGtLZEMydmtlN0U3QnZLSVEw?=
 =?utf-8?Q?seiQx9pmzFVZdirYV6zm0d/WXB/4xiL52nQFzHt?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6029434-4c19-49db-8724-08d8d4e68e87
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 14:56:37.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRyKB4SJVqeW75lPIkDk2ROM0Qv2s54fQwkmtmsbZhJG1abD8BXzdn9jF4r44ojNvnp3xo9jWKsxbFk1tk90QzEgWr1RbTnAHmcV0klNPCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3654
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190121
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190121


On 2/18/21 5:51 AM, Roger Pau Monné wrote:
> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
>> When toolstack updates MSR policy, this MSR offset (which is the last
>> index in the hypervisor MSR range) is used to indicate hypervisor
>> behavior when guest accesses an MSR which is not explicitly emulated.
> It's kind of weird to use an MSR to store this. I assume this is done
> for migration reasons?


Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?


> Isn't is possible to convey this data in the xl migration stream
> instead of having to pack it with MSRs?


I haven't looked at this but again --- the feature itself has nothing to do with migration. The fact that folding it into policy makes migration of this information "just work" is just a nice side benefit of this implementation.


-boris




