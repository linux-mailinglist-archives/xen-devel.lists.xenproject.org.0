Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A131C3CF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 22:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85365.160034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBlp4-0004Oy-Oa; Mon, 15 Feb 2021 21:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85365.160034; Mon, 15 Feb 2021 21:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBlp4-0004Ob-LD; Mon, 15 Feb 2021 21:54:26 +0000
Received: by outflank-mailman (input) for mailman id 85365;
 Mon, 15 Feb 2021 21:54:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1d0k=HR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lBlp2-0004OT-QO
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 21:54:24 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9448ec0f-5bb7-497d-aeb7-b6a2e62e687a;
 Mon, 15 Feb 2021 21:54:23 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FLjSDL133829;
 Mon, 15 Feb 2021 21:54:21 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36p66qw4cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 21:54:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FLk3dk072646;
 Mon, 15 Feb 2021 21:54:20 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
 by aserp3020.oracle.com with ESMTP id 36prnx835m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 21:54:20 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4557.namprd10.prod.outlook.com (2603:10b6:a03:2d4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 15 Feb
 2021 21:54:19 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3846.042; Mon, 15 Feb 2021
 21:54:19 +0000
Received: from [10.74.96.113] (138.3.200.49) by
 BY3PR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend
 Transport; Mon, 15 Feb 2021 21:54:18 +0000
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
X-Inumbo-ID: 9448ec0f-5bb7-497d-aeb7-b6a2e62e687a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=5TcrC9CRttlghKdwb1T/jMH/Irp34EOihRLM/Z4mHX4=;
 b=czj40iN734tbMeCZq+3V1KMFMRGNV5N/MHCLJ6C1PF7CMGpUMu3bVjQIEhgAd/CTejS2
 u2qbGARJF5kSF4tzQhUkvUau9WLhgG26jH2LpOe0UTZ1d2oAAqpA0pCUfESpfqyVi2K9
 XriISX4EXz4AtUg8xuOmNjNaL2hgbzy+s9+oP0t72DGNvQsISYADVh+IVwVouAwDyqfW
 aXGKoANyNInGstmhuztDTHJSjyEL4RDrE9vsdz5WkwG3/NlV+ScccDv+6pDKu5HpPCYQ
 4p3oOBKF6dpa8JXauXwvqVpoR+Ec1nQGlS6TS1c4IDgHElhK80uitrRPbT4IhDp5kq7k Mg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkcAOqKxAmzYpl2tzY+z8JFdlfPvYeckKd75UukjvbjrRYy76+GtWhZgSMmc+YV+DpHjefgvIm7yDDm+oZGJ1jJVh9untA4HdSeuEvqqDufrM6lHCQfHX3c90sP12U0HOELl4wxMeZBCRP9JWyQg6kaLfqf1iZiYMKOa0LRyHuoe3lbrg/kEvgf//Qvgy1xmdSrdb/MzbQN0rSV7kdkkErtU/GfQ/lr4A0PcdB2ThOenrNtQEOro99EaByo3VXhgQ6avMpx+l2E8ufUjW5A3GQgbGv4h9yXuuozUVsHEcI0wcNQxBA90zMW80ftGAJOYkCueRLvcVbJV3VTRzVDTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TcrC9CRttlghKdwb1T/jMH/Irp34EOihRLM/Z4mHX4=;
 b=cf2P/50/wB/odezndYa5vPjakowfkbjtsdPO2vFvhlQTh7saw7FhgzWwvR3RoZaAv/xNwWLbWfbMXfKMXf6JRW3OJ7FAeTWpmDWpQGP8prEvsFBTtBtGUo7j8w1CMD4TpXVQkijUhpRfrYbdwPV32WlaODSMpPOmIbHWhYiufk0XT0tGRUw/hF4+VL569st4L5Ub50gqK9N0ZIaRQWSPE7gKrzjrqjzbyzWFBXIRNMstCouvsk/wadDFcIs1Ea4fvfSQt9I7aPU8g6fJePj08ZP3j3UXPGoYnVK+WSMQBsw6/rEdiNoQaNKWu9SFHtmz3sblLcGGAIJ0FFqlSeLVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TcrC9CRttlghKdwb1T/jMH/Irp34EOihRLM/Z4mHX4=;
 b=cweXIZ8A3uqyPARtmwYe4vBNHOxtv6H6DD08vp7s8vPyUvdQWaBQFRdUANICqfc5eQbHh0E5daL6+d/2625MDG1qv/wcBevd4mUxrjkvzIbf+3YmYOCYh8ro3jjnRNci0eCcAM2U+dvn9TdCY3y8QdxgWcVKfKJjU0x98/h0EcQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 6/8] xen/events: add per-xenbus device event statistics
 and settings
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-7-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <afbd1081-53fd-2cd2-5504-a6342d38a5ae@oracle.com>
Date: Mon, 15 Feb 2021 16:54:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210211101616.13788-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.49]
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afbbd218-c6af-45e4-5216-08d8d1fc3eeb
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4557:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB455748EE35DA12BD74E2EB678A889@SJ0PR10MB4557.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ab51Y8PflCJSeK+DTB0U7SDta1bgkp9jmz8lzVL+s9sk4BV7SV3/gh7WikdXIipMJ3RBsHUj/Qi4icbaJSGz+Xh/d/89bqKkDv+z4ZndZi0IdEVDGjGo9gT27zarBUifcsJpGQUqkF0a/wmhHkVShVBLt1Kbk54zZNQBlHabNVz7XssKsDRZpEKRLcvKwVcVcubOO0fyttKx4S6LNL5m5wxRwIcAAHL+Wgu8GpySh16mzWXgZNlgiZQUP6jzNglDVQ3yo5PEmT+SMLKSXtoHspNJOwKMLt1JOrMqi6eP/gaEV/xgCaTw3TuitSFGt39M38YLXbI7YZeY97oHdahULVMLwvFT+OFqq1GRb+h1QQMdau4XKs5WBffRRV05Q7+CdSjbBk5Hcw9DVT7DBckCEWyFX7X5zTc+Lb6HTN6R+paS4I+omnJYke6seLwx9TNfnyBWfhlGiiJ5oEumyezwz8bBBTX7d/0DEs9xcj26OR79vn/g56yH7Nnkkzc+xmrf29HOG7vXXFXBMPf+ybCENwMAhkV831OGCgcVYuiX48pW/WOfXTpsqEf8ejfBoROv7F6gX9LQvNX3AyBNuuO3e6HMRlTrOmVwT0M6nWN4h4o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(376002)(136003)(346002)(4326008)(26005)(44832011)(16526019)(6666004)(478600001)(2616005)(956004)(66556008)(31696002)(66476007)(66946007)(8676002)(186003)(8936002)(86362001)(2906002)(31686004)(5660300002)(4744005)(316002)(16576012)(6486002)(36756003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?blVYMlRKUkhzOGphODBSY2lrVlo1TktrSVJydGRVOFRGUmE1ME51Qk5yUlNY?=
 =?utf-8?B?QzU1bWtublpQdTJPaDFRM1hCMHU4QVU1NjFsSk9PTlBGdHBONmZ6QkkyWXlQ?=
 =?utf-8?B?WVhySWRDZ0tWeitDT2Mzc1ZMaTFZSzFYUThWRDF0NGdXMzdwTndJaTRBalF6?=
 =?utf-8?B?MnJIaXJBVTlPUDNWWkcvb0lvUXhpRmw2amdpMG1wT1JWdHFyY21OSGxJRE43?=
 =?utf-8?B?ZmxXcU1VckoyUlYvamJtb3l1dDVXQjU4RVVpSjZOc3M2N01mTFZaRXI3RHhE?=
 =?utf-8?B?M0FQSHhpZVdyUzNsdjJVTkVhNXozdUNtYzAydzVnS3dqVkkzSnJ2b01aRzJk?=
 =?utf-8?B?L28ydEZvYnVoUzVvb25jenpCbXZwVDk3MlRLYjF2ZFQrVUgxQU1mcnQwdStp?=
 =?utf-8?B?eU40ZlFGblkxVzRQbi9lbUt2V2MrR0xQMzBwdHFCMmZncGZPZXNISDRMYVJr?=
 =?utf-8?B?UTYwMzVRblpURjdpOEgzOVN4TGNTSVVCSXZLeHBBKytqQWdXaUVlakwzUlhJ?=
 =?utf-8?B?Q1p6TWZOUEVLQ01jUGpMeEFlZmVLL0drUVR3aXhqdVRwblFIUEIrV2RkcStB?=
 =?utf-8?B?bnRxRktGZEZpVm1Pbms0SERWVmFqaWROanljYjFwMFp4bWduUFpLTGZPY3VN?=
 =?utf-8?B?QjEwQjdoeVBmakc3TlVDZ01XN0FtN1JHUUx4dVVVbm8xcWR1OUVrWkpwam5Q?=
 =?utf-8?B?aXo4eDZEMHBOdVhGQVRXVDlUODVDdVhJeHdMWVZPeWZ3WHRVR0tOa2VZQXBp?=
 =?utf-8?B?cUlISFFkK1BucnVuNXZkbVoza1hmODBqcjVKZE1JYTgwVlhQQjhZRlZaMzR6?=
 =?utf-8?B?L2VZNnpKN1MyL1RlTHp2SVo2d0JXQjJLUzVsZzByaUwxekdVVVliTmpWd1pj?=
 =?utf-8?B?TXRaYlF3VXFKamFMVm9WaDZmZ3E4QXNpekRKeWQ5L0VZclQ2dkJtakp2dE8z?=
 =?utf-8?B?NHVIUWhwM0w1aGFSYzk5c28rV3hZVUdJL0xkSnQvcFd4bWJ0VXhvVzkvVGFY?=
 =?utf-8?B?NHlmNDMvSXFNMzlwblJQeUtPNFczbkFBVm14ZnQvcGJ3SlIwQ09yTVQ2dWNw?=
 =?utf-8?B?WGVNMVpOTWcwV3N4OVpTM3M3U1pCenRPTFJjNmtCNFF4aUhTWE04MlNucFl5?=
 =?utf-8?B?Y0RwTHRENm9JZEs0aWIrRmtwc1huRTkvelUrZ1BQWFp3NGVNV0JKRkNoRVdN?=
 =?utf-8?B?ZkRmNWtUbThIdjRncVNiNFRqcFgxOU1JWW9ydHl4citmbGpybDR6YmJXLzlP?=
 =?utf-8?B?MWpnVndTenJKWjI2aGVvRVBSV1BOekNGaWlMbzBINi85Z01FTEZLb0I3clkw?=
 =?utf-8?B?WGVSTWlocU1KaDlrSERwTm9nLzRGYzBHSzVPcHM0TFNqRkQvYnVlMTZZRkoy?=
 =?utf-8?B?U1dVaVF6OFlXckszNGxNZFZIdlFCdjNSbDJUMUIvVVV2Q0I0WUVmV0pVMDg2?=
 =?utf-8?B?R1ZsNHphVVdFZHBBcEx5T2RYOGlOZ0p0eEc0WkMzb0xhYndTb3hiOUpmRTlU?=
 =?utf-8?B?am9ZZTliZTBrTkRWZlQ4Y3VLai91OWJZd1NIb1JKQ2duRk1iSTRDaWtGZVpJ?=
 =?utf-8?B?NVl4WG5DWGJXSG5KQk5rV3g3akpwQnNXWEJXUFZrUWd4WGhBNUk5ckhPbFFL?=
 =?utf-8?B?bnpQTisvMFZ4NzY1N0hEQjdWTnd1K3F0UUFhYnEwVmo1cEhnSXJWcVpwZDJT?=
 =?utf-8?B?TVRvQ2JpOWo5blBQZnFmd0MzWEk2UXhQblZ6SXZnUnRuODh5aG43Z0tvaHRj?=
 =?utf-8?Q?WnIK42xs7OTdgLzhIzTkwqDBPnElkupX28unS+g?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbbd218-c6af-45e4-5216-08d8d1fc3eeb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 21:54:19.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ9rz2CfcbWokm7kPZfiB7bUaUxKtH5lnTNKecce84RAU2NVx+TrZqlLEwSiCOJ+XqSm5M9uqrXxsnDvI8qwxKxbEqY+xvGWooIXjCS/8GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4557
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150166
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150166


On 2/11/21 5:16 AM, Juergen Gross wrote:
> Add syfs nodes for each xenbus device showing event statistics (number
> of events and spurious events, number of associated event channels)
> and for setting a spurious event threshold in case a frontend is
> sending too many events without being rogue on purpose.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


