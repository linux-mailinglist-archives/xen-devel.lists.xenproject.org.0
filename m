Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39B328E75
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 20:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91949.173580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGoIV-0006zq-TS; Mon, 01 Mar 2021 19:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91949.173580; Mon, 01 Mar 2021 19:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGoIV-0006zR-Po; Mon, 01 Mar 2021 19:33:39 +0000
Received: by outflank-mailman (input) for mailman id 91949;
 Mon, 01 Mar 2021 19:33:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mufU=H7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lGoIU-0006z5-0R
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 19:33:38 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fd20482-7dd0-4ec6-9cb0-f0b072e2918e;
 Mon, 01 Mar 2021 19:33:36 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 121JTY7f007103;
 Mon, 1 Mar 2021 19:33:32 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 36yeqmw2r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Mar 2021 19:33:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 121JV6l2176356;
 Mon, 1 Mar 2021 19:33:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 37000w0359-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Mar 2021 19:33:31 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4672.namprd10.prod.outlook.com (2603:10b6:a03:2af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 19:33:29 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 19:33:29 +0000
Received: from [192.168.1.104] (73.249.50.119) by
 SJ0PR03CA0298.namprd03.prod.outlook.com (2603:10b6:a03:39e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Mon, 1 Mar 2021 19:33:28 +0000
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
X-Inumbo-ID: 9fd20482-7dd0-4ec6-9cb0-f0b072e2918e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=lym6hu6XGzAXanq41vcm2QQ2W5A+OouXzdcmIBXCN6A=;
 b=ZdpvdFlkJ4llXwvXB73H1hrJw5ulDfgeEzbRTbPXfTttx8XpOG5YgS4Br0HuHHDC/SBe
 DFzawc/egQOmKLivSD5xpgSJevwJ52ze1OWMH+7o+ErzIkEBpBuTKkAfRhI0THLV+iKb
 uu4hlZqqY7BafJ1oKb/FCyUe/38XSpc6JL6DjAYKc9wqEw1nm+SgtxG7rjuOD3KDJiYK
 55fuoJNRK1mEKZj97cO+lrViORhHiwuPODvBUpknr7XQnWOESuEPE0ZAcGSoMEkSUGbp
 4mXMjnLw+UAmIih0Dzp4drdjGvv4uehGV9bt316SgNATqpX80DsnWnfvWuoQzSu3+e/y aA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLYos+IB58vDZ5z/sU9H8bcmgQdIyLFMB8w/pvdkJBfsiz/94pGPrhH41z4CCL2Vj65TbOpfMZtlrQGimzLqGaSOJVY5fsrfTqC0Ln9YnePrhVNnCrRqSc3COhlhbipk7VzmlT6IWkZekdmd/ZOuzwaAquAYKGD/CJGgo7xjc/2uL1Xa0D9SxeyupKW+lCwKB9XqHt1u+sq8yrF0AbM+JnoHfZBk3qiDxY5k6D8abdQiMLm+ud+En/wsJGB+IRJz17gB4SouE0KtDjH3I5vSm/6HSCZW8sFO3D+IXaSIiA/NA4q9aQvEkNHBUFiaPre+w8nTX2e/k0GPaFsfEF1rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lym6hu6XGzAXanq41vcm2QQ2W5A+OouXzdcmIBXCN6A=;
 b=doXHNNd5rtAAjGEMl1Ul9T96edfd7vn+imFvki/JwqyBAThvxV0hpk1RkOfSNgZ4tvNXUjHqc7/UIzwe9m2RKgC7pqrhzBVXD79Uxo9yvqu80q5/zTDtoLd8iIEkYAuNVfqZt7GWCZ9RyOCZYDmwGy1bCR5tS+xcE+Lj7FYfHX3dZ5s7RtGU+NLsAzeo+f/F4q05nlWOR+WKFRggu7gTMRNm7axYkIdYWVuCQ9BfpPD+0jJs6Jy1jJKKcBWHkiwatI65EbXQ8PX8zOa6NnLXsjGsLQGt0flFbxtzVlCS4+gFuEdD0kzW9kB4ca19EpdmxeVHollxeXDTlyDTiVv55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lym6hu6XGzAXanq41vcm2QQ2W5A+OouXzdcmIBXCN6A=;
 b=CbS675pHYkZRnGVvC2n946MY/Wu1yqYSCENegYKm9MeZhEjxkcqLMN7r9NR+SoAPsfCNGu0xmgK9zY/EeGKBSluByULDh9n+lJM476ySUjUD39PKkUX3xvf18Z8+zEHNkkYaEpxpSeb8XMEmwPSctLF06ZV7uoqJiyjzyi5E+Yw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Jun Nakajima <jun.nakajima@intel.com>,
        Kevin Tian <kevin.tian@intel.com>
References: <20210301162357.76527-1-roger.pau@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <ab081f2f-265d-78d6-0af4-21eaf2b9de4b@oracle.com>
Date: Mon, 1 Mar 2021 14:33:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210301162357.76527-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [73.249.50.119]
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b739f04f-1d14-4638-9dc2-08d8dce8e433
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4672:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4672678A23B21219F09650418A9A9@SJ0PR10MB4672.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8hSSpr3Rl9lhN2+6O9vBdgj27Hc2BCjGN4YX5nVMJUrrnOt2JmeQ9F3f3fmP95VM9s/evc4xaovoVYGkUWkw9GKu7TCGRxovUxqynHU1uQZSDZ/sfndGIfwwgA6tBnl9ezG4wX58Yunl7j3yfkgx4km2wEsTbyf17MsDhwS7h2UzdNUJsdoojE55eCR3q1wL51vhdnxFZstnq8wN2BdS9NpBRucOZc7lzIZD9mnOyALiDSy0yHsqh4i1wAJ4oEACXEJqNBTY9pPNz7mFBqKIDrBgdQ+CjLIeDWWLPBRHHjqVr0mympgwZeAPkHCoXpb5pO4yTO73cCzYjta68Dm76J5/ayYxoRNB46TQIYfxPUUKp2SSYgSkpq3uE5D2WnWCrm1H1etZXnw8o9jnD6pZqg+2lnT7kX2PSQ7HDnhPlIkCu/LUJFOS8yM3w+AzIDWtPXCUIcVNwB1+fwc/BRGpghojIPKgHcBFR2weYpiBVYVfwGjGiwuDFkBC0ysgA9mXAliWag/WDnpxK/yfoTkIMnN+LKrNKbbLF7ipuiIks5VIdUz2cBBIzuFQL202yO39RCuCTImpnaGZ/KqG1srxwRdUrNGJ3cz3UAb6b8q1e7g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(136003)(396003)(376002)(5660300002)(83380400001)(8676002)(2616005)(8936002)(53546011)(54906003)(26005)(956004)(316002)(186003)(16526019)(6486002)(16576012)(2906002)(44832011)(478600001)(31686004)(6666004)(66946007)(66556008)(66476007)(86362001)(31696002)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?V3BEdDdGTXJ5QWxnUmFmbGRRVnh3ZFBYcm9IS0hQaURjVXdzU05MWjdIcVBT?=
 =?utf-8?B?anBra2pIc2F1cVVRRlZ0eFJxQ2QyQVk1am4vSHcrWjRVVmJUdkU4QVVUN3Ra?=
 =?utf-8?B?MXN4VEdEUWd4RFkvUjczOFV3Tjc2UXY5T1E2UCtUMlNSQ3piS3J4Qkx0eHRL?=
 =?utf-8?B?WnlOTzc5anpDOUxYM2N2SXJHVnBUVDJjVDJvdnVyMXU5MTF5dUF6R1BTUDhH?=
 =?utf-8?B?RTJVUGhQZ2hOME80SkFWeS9IWllVVGNaVzJGbEQ1MmRhREVsb2VsNEtTbzJz?=
 =?utf-8?B?NGJJcUlqQld3ZXNJbVZramNQVFNDQVRBTXVVMkhLVC8ycHU3SGw5VUhXQ3l4?=
 =?utf-8?B?cGQ2YXdyOHUxVys5MXcwNTZIWGE0MlBvTWtQQmRWU21PeTI0SFpncGNBdnZo?=
 =?utf-8?B?NXh6RlZwWTdNd1RRSDgzSWJsODZTZTJpWCtTbEhaYjliL1ZBcUxNbk5DbUk4?=
 =?utf-8?B?bElZL0xFd3dyS2ZqMDlyZS80bW02c0FiSEYyUXpVMDFXb3poQ2QrUGdFZWxq?=
 =?utf-8?B?UUVjSnlMWHg5MTlYVlNwRW9tUzB3Zk1iWDB3SzY2MVVOdE1YVVZaTjcxQTV1?=
 =?utf-8?B?bW00SFJIZUpxNEpPaHl0bGlDWG81Yi9CZVAvYm5aRkkrTm5xUTVZNU5uUm1O?=
 =?utf-8?B?dkxRT250ZSt1L3dFekFqUEFnK1JtRzZvRXYyMDQvYWl0RGJuUFBObjlDM0lZ?=
 =?utf-8?B?ZXk0N0FmYmtlcmdkZUNzUzhSV3h3UTBsMTJIblBaQWpsY09hUllBRWVXanhL?=
 =?utf-8?B?cUdjRVRzM0ZHaFVzVmR3dEV6RXpqSTYxbDVUaGdwOG5UekxIUnU4ZzJ0NE5I?=
 =?utf-8?B?QVpQbU9PUzIzSG1RZWhROXE0V2pSMFVuc2poK0lKdkRWQTVrc1Z0SlIzbnV5?=
 =?utf-8?B?ZTQ1aXg2dXhSb2pxOTJMWU5jejBZMTBVQTlHeHI5TmlmYXRJb2IxTUpoMzBy?=
 =?utf-8?B?eC96bGx0YkxsMzlCWmM1RjdwVFJLeFVFNHVOU0h0VVByZi95OXZZL0pYOG5T?=
 =?utf-8?B?V2swYUc0SlZvSjI1WlRJVTlRT0NlYjlaQzNPVHR1bndyZ21xWkZaZDF5Nk9H?=
 =?utf-8?B?NVpkRnJtQVlvZnFzTzhsdnpxeUNjclRMM0dXYmFoeGd3VVlCYkdQK3hFTWhl?=
 =?utf-8?B?RXpyMDZ2TloxQVVHY0FQKy9HaE9vcHpobzhaUHpWUlRlWXpOZVBjcGFwVjJ6?=
 =?utf-8?B?S28wZC8rRkd5SzVlbGRZTkZBeGxsbTNQNzYwWjJkS0trMUF6UUYrcEdLMks0?=
 =?utf-8?B?Y1h0U0FkNC80bGxPclFoRndtUndKeVVicmNpbFlvcWdSY2pwM1ZQRm13UDdK?=
 =?utf-8?B?MXJvMjJtVHhROWEvaVB6SnBwd29WNGhDTXEvdDBzV2VXUnhOaVJMeDlKOEtw?=
 =?utf-8?B?dlYzYW1oZ1A5Wkh3RHlaelJ0Q1hkUko1L091bWZ2a2ErQVp2YmNVcmIzWm9a?=
 =?utf-8?B?cUdWc2hBRlNsVjBVemdEMUFOc2lzL1VmQ2pxcTVlRy9aOVRCb1pUem8xb3BH?=
 =?utf-8?B?dzVQM3NkSkRJU2NrUlpHSVg3MzhUeDd3em5UWkY5K1BWQWF3bGVvaS9rZGhh?=
 =?utf-8?B?VEJWOEdZamN3TFVlNzNVSEdDUG03RzdhbXd1R1pGK3lESk5zL3oxUGs0d2dF?=
 =?utf-8?B?VXU3Vm1GYzNlTTBxeTNHd3VBd0NSYlF0bEJReCswUUFFU3pzQ1AyNXVHM1BZ?=
 =?utf-8?B?bEFiVlZWUVJlOFBzWlVmcTlzeERrZHFGKzROQnhwS0RncHc4d2RUbmdDUU16?=
 =?utf-8?Q?5yvLuzV1kyCP4+xnMVy0AG2M8sNAP6E05RbfKP2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b739f04f-1d14-4638-9dc2-08d8dce8e433
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 19:33:29.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXVyO3ygmYAN5c/PN0SVEgVKQ2UgENTQjs+RIuiJ19M7SPw2GhGExt40WESJ9ur/+AMApEFk2Dd5ZkcW8fbXj+5/8bbs195+rf83JELv/uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4672
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010155
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010155


On 3/1/21 11:23 AM, Roger Pau Monne wrote:
> Introduce an option to allow selecting the legacy behavior for
> accesses to MSRs not explicitly handled. Since commit
> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> handled by Xen result in the injection of a #GP to the guest. This is
> a behavior change since previously a #GP was only injected if
> accessing the MSR on the real hardware will also trigger a #GP.
>
> This seems to be problematic for some guests, so introduce an option
> to fallback to this legacy behavior. The main difference between what
> was previously done is that the hardware MSR value is not leaked to
> the guests on reads.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
> Note that this option is not made available to dom0. I'm not sure
> whether it makes sense to do so, since anyone updating Xen to such
> newer version will also likely pair it with a newish kernel that
> doesn't require such workarounds.
>
> RFC because there's still some debate as to how we should solve the
> MSR issue, this is one possible way, but IMO we need to make a
> decision soon-ish because of the release timeline.
>
> Boris, could you please test with Solaris to see if this fixes the
> issue?


Yes, it does. Thanks.


-boris




