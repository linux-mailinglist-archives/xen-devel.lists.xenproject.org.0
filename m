Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0835E517
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110040.210034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMuu-0003Qm-U8; Tue, 13 Apr 2021 17:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110040.210034; Tue, 13 Apr 2021 17:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMuu-0003QN-Qm; Tue, 13 Apr 2021 17:33:36 +0000
Received: by outflank-mailman (input) for mailman id 110040;
 Tue, 13 Apr 2021 17:33:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6X8=JK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lWMus-0003QF-UV
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:33:35 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 137e3283-c317-4ea2-b792-8ecb80613e20;
 Tue, 13 Apr 2021 17:33:34 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DHSYFI042436;
 Tue, 13 Apr 2021 17:33:32 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 37u3ymfvfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 17:33:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DHVfnX065599;
 Tue, 13 Apr 2021 17:33:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3020.oracle.com with ESMTP id 37unx035tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 17:33:31 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3574.namprd10.prod.outlook.com (2603:10b6:a03:119::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Tue, 13 Apr
 2021 17:33:29 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::819c:ca1f:448d:3024%7]) with mapi id 15.20.4042.016; Tue, 13 Apr 2021
 17:33:29 +0000
Received: from [10.74.99.115] (138.3.201.51) by
 SJ0PR05CA0102.namprd05.prod.outlook.com (2603:10b6:a03:334::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.8 via Frontend
 Transport; Tue, 13 Apr 2021 17:33:28 +0000
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
X-Inumbo-ID: 137e3283-c317-4ea2-b792-8ecb80613e20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rSIENCFULaZ33oR3BUSZ4yKJ6d9Ag01uc49jK4wp90s=;
 b=xsSu4TPGPsxzwmkRPG0kx+MOqG10N9/HK/XmfCXN0Q/RPSlLA8zVkBjulEoAQ5uDz88T
 7M+aVKYsXFgLq4zG7I62LzNtxmfTo3ZVfoRjw+uGZSwf2jcnZYEX5MoMrFtyNN2Y493G
 vEmmEabtdLms/Kh1fYxGvUYX0etr99exyDCNuyNt1+Y34liyjuY1EFHNQUf/ezwlfmEv
 y9U++YC+UEY990h49wq9Cwgf+O8i+f0ywgMrkniEBtKKajR7TkP0T2eUTZiVic6Ckk8W
 JlfGP/1/jiubFTLIJNjV41IEmftfTBIRXA3TjcI35G51PPsImMPw9FXUFSLwFhC84rjs Qg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkP5IxYkTMJeJsCSqYsx4PO/SaUi8vX9siFtJYVqaylN1d3BzKjXtq68iYSnUSCq0dhQHhaRE9PF2VjhXX7lUYVrDg52XxGC9jGuB2Jb1drpSLtpMxtU9yIF53N0oxsl3wsDMoFynggNIc9d9Nbu6OMLBwuhwVL3OIsG80Dgl1GeTY5afvaBDUjJDyZ+HP5aHF10sNiY8nP4KO822P1kWRPwHrIxNfgUCHYyUaTkjvPNOjQQcvsPd8K7pXkL77Mbu0Lym0vI7nXz7M0R2k5IWUDws8MXinUmQb0j3ayJKOJRyDba+z07MAZ+JDW6lb51x3JFko8Ip2eNJ+LE8nB4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSIENCFULaZ33oR3BUSZ4yKJ6d9Ag01uc49jK4wp90s=;
 b=UqG6CURv/Nl+pYxnjWqGfY3THJsV6bR8mXP0loBoZTUHTjBuXdRALwGGy6OqMLlTIRkH/qYkIA6uctszIyTX4qqcAlmP5XZGjqGctPP9VZbPOYfTjYn/08u9R8BpM3shKvP1q9XuxpESqBVfUpLFPSk71lL2V1xFF1nLUHTy0H56o5C4aepRr84xw+okQSUWn71NxGhW/0ljpwmGXcWiXi67a7onpmL5pHIMXyhejH/bp8nraUMs/jgNAZlQ6+kmB9hXOQIW5sJWZ6RFJyLX/tO/8LfnCnNlJrJXZ+2S01xMsgGdfM2RN+L9ogFg+bLqNiz7QkXeyETcrJ47RVBlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSIENCFULaZ33oR3BUSZ4yKJ6d9Ag01uc49jK4wp90s=;
 b=aSJg5lBzQZ6kpvDhW5WuCyN9DUESKmk8bJ2GXXPJElgTm+mP4xotsfmRFyl7b+zWDs/abdZlgBoHD2DZbHWaumzZqRP1o9j780V/KK7foLHYtOeE0LEcUoL++I1yxT/1Jk3BVv1uWygBH+gY9eClxPx4rb53vX06s79tbREBQ7Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: Support of old Xen versions in the Linux kernel
To: Juergen Gross <jgross@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <1e4dc7c0-4364-1095-bb6b-c6341bc58e60@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <b7684e00-8675-5768-b4b2-f9435620b34e@oracle.com>
Date: Tue, 13 Apr 2021 13:33:25 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <1e4dc7c0-4364-1095-bb6b-c6341bc58e60@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.51]
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bad409d7-f466-4e66-74fd-08d8fea240a0
X-MS-TrafficTypeDiagnostic: BYAPR10MB3574:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB35749E472D09C06ED695DF568A4F9@BYAPR10MB3574.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yf87TReA416NaPAHXHs+vv+Cpp4PvTbk0+7iqUXNFNrlYQm5/mtLQ9X1KrO3qgW4R0y2nId5PbuAxTteVV0YtrE60dRG2T2vuXE1HWpeG8JQhlF9RNoO7YrrSYNdFolqlLFmB6CaPn62e9tg1qY7z9e46IY4HAsn9QvA9pByGg/3ieuC3xXAhFNnNRyRnA77yHYRobWWDDo/b53eQvsy68iUDwjAAY4f/hjXOcRwXqfCiZcVL4+mV17/KJSnjrXM/Vb8j/34tHXMkGJisXaaULAklYITTOLLe/dOJtdkWeJmk1sEmAsu9FJ+pvWU+6aCTdFwbk0C43x1J52T5BA26yVxer4BXCjaXiz6tVetzRHSZ8Q2fTtFfX+anQZ/mqgeprMQsytGHIPjWxIR2iVUQLSLu199XKjZEaiKdFOi3W34/14skmMJhR01zQr9wXcMlb/n8nlcB14WTYuGZC5Ywq8Aa/aCtLLoKlMyRGTPAtQUJMo+3zvmEQv7bJlz3Uw7ooGUae1WF8+SbwVXJA9g9cdreJVOiuBrsJrBOgCcAy5GCu4jhHZOwptpP3m6muiPX4GCdYq/XaWI4N6fsCP2JVbKZpTxnppAyjvMr1XwXewSBo1UKyGqhN4vQe5cSyHCzKyHwUR8l3tgO+epqj7QNcQ1W/TvVbrimJj/0X6jBwrr625U8ffOdNWy6LROnSPw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39860400002)(136003)(346002)(376002)(38100700002)(316002)(31696002)(26005)(4326008)(4744005)(956004)(186003)(2906002)(16526019)(86362001)(5660300002)(44832011)(66476007)(31686004)(66946007)(6486002)(66556008)(8936002)(6666004)(53546011)(36756003)(2616005)(478600001)(110136005)(16576012)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RkhONG9rekJ4WlhhdmNhR1hFOXBDVmpkZjhJY3o2dVR5eHh3M2I3Z1BES2Vu?=
 =?utf-8?B?bUJsVFUrL3k3aW9oZ2MyenpFc0NZYUZib0NRR2c2K2VxTS92VXBKWUZ4RGYw?=
 =?utf-8?B?MERGNlUwNGN6NU4zT2tuYlhlN29aY2FwSjZOci9HM3F1eE9JR3loR053a2pt?=
 =?utf-8?B?ZUVKL3ZVY2M0eTVFL2R0d0ovcUhXc3pBZlNPZDhTbjNZdWJobVI0b1dXeDNt?=
 =?utf-8?B?RldZNGw0Zk1ieVliRzFiY0tNY3o0N0o1ZFY1WnZObWl3VzdVcWc2OVFORVdy?=
 =?utf-8?B?dU8xYTR6bXptRTlQNis4ZmRFRkc5M2N6QmRFcENSQVhzMXNnTlNhSTlUdldX?=
 =?utf-8?B?K1RBdW5VdnV1cUY2QjYzeFlpRnRsT1owMlZ0dmpXRjJTMiszaVdMQUtJQm5R?=
 =?utf-8?B?T3phbHpZUzZLbkVYRHhKVzQ4YW5VZlo2RHAzUldLQm9mSnVsUUlEYlVtTmtY?=
 =?utf-8?B?MUZpMU1yV2VvL1BGMWxjZnQ3aDc2ZnZpdmhzcmJBNkpnU09LekVGUUZKSmtL?=
 =?utf-8?B?VFhPZUNNVWRGd3FoemNlRDRPVEZjRzAweWpzdlJjRkZBbmUzb2pyU3ROdzMz?=
 =?utf-8?B?M2REZ1FxckZCQmJldkRQenRUMUptOTZBbXhLaDVhdzV5S3NTeHg4VU1SOHhi?=
 =?utf-8?B?bFNNejVQbTlENHNJbldQQjV6cDVGS2JvS0ZPejNSSkZjTXZXMzBnMkJWalVh?=
 =?utf-8?B?Wks1bUZkYmtEdHkzUDFpa1lmTWFxSTZ1QnBLbmRwb1AvbFFjQkxtajIzL1Bi?=
 =?utf-8?B?N094bTRrQjZCb1VtNTFRbjlIcWxNaE9YQWRmZzgrZExqOGlwRzl1SWFkLzdU?=
 =?utf-8?B?WnYyY3BMQmdJZk1QYWEyYkFCSDNtdVdOc2ZtdFZMdTJrY1h5ekgxS0JmckdV?=
 =?utf-8?B?aHpkQ2kxa3kvSWJMSmsyS1JJek5MdkRVcWdWVysrTjFtUitjdnFjSmE5OWhS?=
 =?utf-8?B?dDBJRmZKNldUaWpPNTV0NThjK09tS3h4Q09CcFF0aUxKVXlFRGx1WThTNTlZ?=
 =?utf-8?B?NkhLL0hGR0NwTWh3RElZRUhTMCttL0RzMU5rc28vZHNwQWFmcUYzdThLa2Jp?=
 =?utf-8?B?RXhvVVlJbWIvZmJsVGdBZEg5Zk9DVkVJYTloWjZkWTVoYm4xcitKTEZOY1FR?=
 =?utf-8?B?VmIvZGladXVMZTdzWkNsUTRxYWpuOUkwY3Jkb3lOSllhZXVDYUN2eGg0a0xN?=
 =?utf-8?B?bTAvZDZPUVNVdFJpVFNnVm45UnUwZnF3aC9IeUZmMmR4R1k1QkhVb0ZxczFZ?=
 =?utf-8?B?WlBTNTFvaVkzQTdUU1hNNFEwM1Z0TkhUN1JCS2ZLL0xxSHhpSER2WEZaMVhS?=
 =?utf-8?B?N2ljeUtNTHVpeUwvTVJnNlRiRnMyQXU1K0p1T1FnRlhud3gxRkpVcnFLL3l0?=
 =?utf-8?B?b1JPQVNTN0FReGsyTk05ai9kWXlsZHAvWFZTclZGMGhpczdmbnBjSzNJMWVu?=
 =?utf-8?B?ZG1CTm1od3ZFUU03L21WUEFQVE9Ga1NqY1EwS2NyZk1BdjBBamtkUVREUmlP?=
 =?utf-8?B?SUhwWFJXY3A4dERrbmJJS1hJQ2tyaU4rWVh2dlcwNWxQZFBNUk5Rc3lmVERs?=
 =?utf-8?B?T2ZXTkNUNWZDcmVZZmhWSlFWVzM4R29tZHQ0L2lVSk9kM0Vocm9SWkltNUhh?=
 =?utf-8?B?eVNRYXplUU9kdjNUNG8vOFZTeW9RK3VNdktZUjBzeVVDMVVkemhtZlB0cklG?=
 =?utf-8?B?NFBlSURCUURpNjhBYnlSZ0VobTNjN0lKb2o5dGh6VUZKV0JrQ09ISDd0a01X?=
 =?utf-8?Q?WA6gsqKtg9kmTsrAieDqRFJ5btK+dS5Ho+h4JJd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad409d7-f466-4e66-74fd-08d8fea240a0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 17:33:29.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TOT7TgPxnUlDU+zpWwE01WeRvbChheF6XJRhJRnCC17N6a7mPv6ej6vTTdoZrfnXeSAcAtqeSHsxQinBq1lwHsm7a6FKPbUzekslZffkWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3574
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130119
X-Proofpoint-GUID: -hE3ceXJ1IGsxjNyj3m1nCUIc2Eiyd9A
X-Proofpoint-ORIG-GUID: -hE3ceXJ1IGsxjNyj3m1nCUIc2Eiyd9A
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130119


On 4/13/21 2:14 AM, Juergen Gross wrote:
> In x86 kernel development the question came up whether we need to
> support XENFEAT_gnttab_map_avail_bits not being set when running as a PV
> guest.
>
> This feature is active for PV guests since Xen 3.4.
>
> So the basic question is: which is the oldest version of Xen we want to
> support in the Linux kernel? As far as I know there is no Xen based
> product in productive use with Xen older than 4.2.
>
> Would we be fine to drop support for older versions (feel free to
> suggest other versions than 4.2 as the first to be supported Xen
> version)?
>
> In case the answer is yes, I'd post some patches to clean up the kernel,
> including a safety net to bail out in case a feature needed isn't
> available.
>


Sounds good to me.



-boris


