Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA833403BBB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 16:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182158.329609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNyrG-0002tV-R8; Wed, 08 Sep 2021 14:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182158.329609; Wed, 08 Sep 2021 14:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNyrG-0002qx-Na; Wed, 08 Sep 2021 14:47:26 +0000
Received: by outflank-mailman (input) for mailman id 182158;
 Wed, 08 Sep 2021 14:47:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ljEy=N6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mNyrF-0002qn-Tt
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 14:47:25 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd098093-113d-4c9e-bfdf-cd34d9a9e1b2;
 Wed, 08 Sep 2021 14:47:25 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188DfEbY030422; 
 Wed, 8 Sep 2021 14:47:23 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axd44txky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 14:47:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 188EaY3x103681;
 Wed, 8 Sep 2021 14:47:22 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2172.outbound.protection.outlook.com [104.47.73.172])
 by userp3020.oracle.com with ESMTP id 3axst3x6cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 14:47:22 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4399.namprd10.prod.outlook.com (2603:10b6:208:1d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 14:47:20 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4478.026; Wed, 8 Sep 2021
 14:47:20 +0000
Received: from [10.74.115.194] (138.3.201.2) by
 SN2PR01CA0084.prod.exchangelabs.com (2603:10b6:800::52) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:47:18 +0000
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
X-Inumbo-ID: dd098093-113d-4c9e-bfdf-cd34d9a9e1b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=YxqmVh6FQ9ZKrX+i4+s2IIrwqHoUq4z1e+qAUQnB6WY=;
 b=V8iZEmW5csJHBBKS4cmrr5rOhlvGH6DmkwJ4Tq3ZI6cvigsVccRtjNNyGh3KeQzlYSSt
 A1ikX144WMnpzA9lCqKAoE+Fo/SVIaWs63Hnnttqq6zxzjwjvPWBVzPp3uyHUXnaTnOg
 GAPw4V7xNZNPznDyUsJkLMvZ1vbuziEP1TehTWOPYlP93jj/P9MS60vTEGfpQb8dTNxk
 t4m2EWmwI1PV1FCBLUc3KyiYAun+EYAdViCqF4JcJlqXPOobpJ98+d2Tf2IZLWESmof0
 tbfOoznfWKsyvPVi4Pn0GVUhWMRAi54sdivgAOGLL31ug1L4nLJwp8AEWsTEWRsm+ITi pA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=YxqmVh6FQ9ZKrX+i4+s2IIrwqHoUq4z1e+qAUQnB6WY=;
 b=S0B14uExGMVKbuhFJ/cVYxOjAs8mwfcXSsQQUxXCJOohar+oEQpv5VlqYwrwLcJBzUHL
 9PdZvVKoQY8k4OgIIMz09EbRii8kA75SMeMxJMGDjvb8nQq/MKqQRnMl1s29vwnlywTP
 L7eDC2+vfFAvCCApHy2yrulyWv2KLgV5KXR9Q/79YrTJl6U7MhVqh5MLUxHO/woNf7CW
 QQxfTIB6PHtqmIer1dMk0L1Lq+oZg9BLZ4KHXKDUVnmll+ympfGqHGA4Rk3Jqpzx9cEx
 1lzxdwos/r9kWAtyRGNUXpHotXDuLrcCE/Ab4QPBPGduXX0suE4KiJATPqRUgoDENPj9 zQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiCenKX6nm3MJVWqYptB0kwZ2SAMAqbOTE4GzayzS7tp1S67nfnQunElxzNcb+haz+6aMe0FaookqVjR9l8oxO7hknKSQicfVLXLAtv+aZtQSE9AQIRabVDL/SLuU9NN02NoH+X/ZQ45jBFSDygyFynTONGnbzTwkB6UptUXKM0tkRULawOt418gzrVmSwqt8Z6obh2iOgidFl8rWmnjIOWyADfyJXfq22UGyp6sE+4OF7h6GUGk2TiSBZm5N/bha9qGHPj+dT8WoEexdllD9aQXnAuoNhH+Zka4kcJdAyKXj0tqpw0GVcRLk3nJcdG2gUoku6bfoArVujB6Umg/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YxqmVh6FQ9ZKrX+i4+s2IIrwqHoUq4z1e+qAUQnB6WY=;
 b=llBxwXCpLhbZhUG9Tztiz4toFd4IYOrTISb9PojCS+/VkXAEv/GVOpv4m9RidTWTq8a8bd6LnMJxv3vpcWHUxbY5QzhDcUt7CqWjHuOXGSLagcqS3MGTIImOpHLMJl59r9CTzjYC9XaKosGVZ/GdaNwNYMFufu2RG0p83Tve9NohOWhZrWq9QVe7bCY6K4thcwV0kCLMq3wdfujXw3AHnWgJMpEptg+OP4LicBa0Y1hWi6prTe7mTDzvarO9Mmf7nz+WLQbXM9ECOhvckCTmq+WmiwlqG/D0e6Su4M5vIXwLyuZJBTgyBqh8qdBK94m82qcF2ITj3gwDS42ZuC9pjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxqmVh6FQ9ZKrX+i4+s2IIrwqHoUq4z1e+qAUQnB6WY=;
 b=fY6YIuKmwx5V8bAK3w3gQ1YNBOU4zrKbad6sXGZGYPhTEyA1+K0/0vckwBvsRe91HmY2MGB/aT8Sumo6myTAVeJE80wMJQC6TnCU5psp1yF968io73NmtTiCOF/io4KvWxAmEz9Vd2bcGWkgaGQcCBqmJR+FvAeQc5uMQ6bfOs4=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/balloon: use a kernel thread instead a workqueue
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Jan Beulich <jbeulich@suse.com>
References: <20210827123206.15429-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <8b13525b-0075-f4c1-8900-1be151e85e3e@oracle.com>
Date: Wed, 8 Sep 2021 10:47:16 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20210827123206.15429-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN2PR01CA0084.prod.exchangelabs.com (2603:10b6:800::52) To
 BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4b69cbd-c1db-4cf1-f73f-08d972d78f72
X-MS-TrafficTypeDiagnostic: MN2PR10MB4399:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB43999D980A9E93E91795AE4A8AD49@MN2PR10MB4399.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FyfiyvVLby/neppyX9lOwFvKyPJIiR6S+9HMmTtt2Dg+22DAk0Hc9agbR6vmby3wnlbPoik9CAcazvIlZLyDPtJEplZCJbE7VWpQ+nbBN1stG6rwYGFeqVELfTDyrmn/KY7tuplLZhYTJiz0VgW5q4C1EQuD88BRzkradyjKxL7KAhAVs3POklnxA6UitvKlaVQmx0aJlYO+pIxoXhGp2CpA6aU8V8GekAv6Fqu3Q7g+mfnm/S48YT1JaVEILXc296VKW36FDxJrmYlG3VcZsPXaX79M4fowIMqxQP9rpc3HBomBKUBE6f3F6rFUpYFTok1YHgDJMerNzgqCBzoNKZG8uMLSDtTqFknwI4m+stWo/OSTx/W5bVCgSihPxXntFj5IbJQ9H2a0AUYwwtVqfIF7uYhQfARAp4SglGrRIZ0WZKW5GJSsPnItKsQn+orSxduobcM1G+ONzri2Q3sGTjZYyJL590xpYS7ECAiz+WOnUbC3WaFuDrtuoeDK2w9k3a/YK2HTfCWdaT/DjcyWuQ+JVermDzrTDocAA58qj7N7iqznHJ7roRnU4fZxAMdmanhX34HaA7x7smpWvV0lZS/9QnFGIR8gYAwlrL6TIdyCmFT6SVSeToZfGNMgCpsEhLQitu7ZEqcHr55gAsThgIr9pzCk2eQc6eXCtgAmAi6Z5cMtL6w6+lpPye9X6lzSs1jMr2NX2hrUGOCGMeyqJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(83380400001)(956004)(36756003)(6486002)(2906002)(54906003)(86362001)(508600001)(316002)(16576012)(44832011)(38100700002)(2616005)(66476007)(66946007)(66556008)(186003)(31686004)(4326008)(5660300002)(53546011)(8936002)(26005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkJ5L3ZWQlVGNEg3UHNNMmlPSUZPVFArNHMrVnNPODJGK1JhVVIwZVF1d0V3?=
 =?utf-8?B?MkN0clJFcGo5RE96dUp4MUpSUEpqY2gvUjI1SUF3Sy9FV0RxV3BGNHZTbnBt?=
 =?utf-8?B?RUxlei9NbjE5Snl4dkdaQ2hCVnplK2M0aEE0ZVV3TGxwaWVCbk50Y0xWM01P?=
 =?utf-8?B?cjlLL245a0RKQm0yK2J4TDVmOWNENnpiR3JBQzBreVRUTXNBRFRhNTlDa0xK?=
 =?utf-8?B?aWdwN29sSXZwOUJSWW1MUFcxZEFTK3V2Zi93NEpCazN2NVhKQ1dkSWRPNUc0?=
 =?utf-8?B?d2dYdW9GNkZuUi9mYzZsUmVrZTN3aWlmdGFQSU9qRzVFWmRETHE5Q3liY2k1?=
 =?utf-8?B?ajNZTEdQWTZTWG8rZys0Sis1ME5NNUhaR3oxeDhROGd2cEl2cnkycjhDdjUy?=
 =?utf-8?B?RGRCTmtiNzF6VDIrdkVobTF4ZFFRTExGQmlQdHZjNlczam8vbUgzeU55c2dH?=
 =?utf-8?B?NjRZU2N5aFcvTjJWOU5TMlU3TSt4bXlLQnF0SnI3eEY2ZWYxakNLKzc0UnBz?=
 =?utf-8?B?V0VWWXZuQkxwaEpQRnlyZURUZzQxa1pVQVNPRnRsNTFPek5mOVdBUWRtSXZZ?=
 =?utf-8?B?dzdIUjZsZXdSQXlyU1I5NDZZazVOVnc4NVZ2Z0lRaksvNjJWb1VGVW53dWRl?=
 =?utf-8?B?ZnA3ZFo3MnErNmJJWkkzZUF6cGI0TjVVNEEyM1FtemtIdVlCb1c3dHhGL05E?=
 =?utf-8?B?NnRuVERvYkFQV0U0QjhYVllDaVREektRQTNyVU9VdUliYS82ckM0cm8rWStG?=
 =?utf-8?B?R2JjRmgvbzhLeEg5anlkbjFTT0pFVUw0bWViMWtjQVhCdFQxV1JJR1hRUE4z?=
 =?utf-8?B?MDU1V25rS2JHYWdMenlNN2Njd2ZwOWtVd0JydmNLMVlnSXhOcE9EbmhiNlNZ?=
 =?utf-8?B?WjBPbXdwajNrSHZKUEtNRnI5ZUtVRk1RNzduNTJNYmduNHFzOWl0V2txcmh4?=
 =?utf-8?B?RGErWHJuRXVpUG92ZTZ4YWxCWktZTHRFQ0Q3UnBrMHhKWDljNm5ZSFhYSE4r?=
 =?utf-8?B?T2F0SHZKdWNCT0kwMnBWTkhOaTNCeXFZN1E4YkM4aUU4enFoNmx5NTRtcHpQ?=
 =?utf-8?B?eE1uYlllTTEyUHl4eXlNWDFqUE9hOS9Zb3U1L29mc3JxeGdJMHkwem9ETE9I?=
 =?utf-8?B?TkxMaXBMcWJxUTRweXFkNHllSVZwRGh6QWJRUXBDUEYzdnpXcFFqZVBHUE9I?=
 =?utf-8?B?Z1JHTWZ6YTRIZmhvd0R4Q2wwRDRreXFwNG0waUl1WDRBc2hwVXA1OWFYc3Zx?=
 =?utf-8?B?QUQxZ3IrYzJhYnJxOGlJUjhUeEdqZWMwdVBDVXJzaHh0c1pvY050Z0c5UGdm?=
 =?utf-8?B?UFBaSEJEQ2IySjRPaE40VEJHLzN3amdkMy95SytjQ3FkOGNKOVZXR0VyMnlS?=
 =?utf-8?B?VXlRUFJaVlJUMVp1Qzh4eWlva0NkbWc5NU9ITW9kTVQwL0RSRERCMWNRRkxk?=
 =?utf-8?B?UDMraG5EdDd0Y0RveEtCK2dTdzlybzkwLzlVOTBJTTZCMmVqWmRGTEVHK1NX?=
 =?utf-8?B?ZDdmdzJRamdxVHJkdDdIdEl6a2lxNXdGWDZsbW11SEI2cU9Ja1BsbjloMkVu?=
 =?utf-8?B?cTI5R1h5eDFhNmRCMXZZaTU0aFgrOEh4ODdXdWFmUWEvdTNhSEFXS0lzaDBo?=
 =?utf-8?B?SE5DT3p4TzJxcFJ6eE0xYis4QmlSdExObDArWTZpZStDamNCU0dpc2d6MDFk?=
 =?utf-8?B?d0tMSTlRUlRBaUIrR0J6eVg5NkRlS0hFbWwvYkNjcG4xSzBrOVhscTd4WVpL?=
 =?utf-8?Q?FBF1L+Ot1A+yPuUk3olo65lVPmwiEpKXE0yTSqC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b69cbd-c1db-4cf1-f73f-08d972d78f72
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:47:20.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khy0cw4NWpFnEzRq0OsL64g6kqQsGAjnGhdF4JjTDWB+fF0ExqenXFanSbWAgjWDwvgU80bTT04zobNjFrzYKh1Jbz3Fuk16QK3OwNH9JcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4399
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10100 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080093
X-Proofpoint-GUID: PHKTu_8mP6F-M0kgjuqQT4dIkupBdrip
X-Proofpoint-ORIG-GUID: PHKTu_8mP6F-M0kgjuqQT4dIkupBdrip


On 8/27/21 8:32 AM, Juergen Gross wrote:
> +static bool balloon_thread_cond(enum bp_state state, long credit)
> +{
> +	if (state != BP_EAGAIN)
> +		credit = 0;
> +
> +	return current_credit() != credit || kthread_should_stop();
> +}
> +
> +/*
> + * As this is a kthread it is guaranteed to run as a single instance only.
>   * We may of course race updates of the target counts (which are protected
>   * by the balloon lock), or with changes to the Xen hard limit, but we will
>   * recover from these in time.
>   */
> -static void balloon_process(struct work_struct *work)
> +static int balloon_thread(void *unused)
>  {
>  	enum bp_state state = BP_DONE;
>  	long credit;
> +	unsigned long timeout;
> +
> +	set_freezable();
> +	for (;;) {
> +		if (state == BP_EAGAIN)
> +			timeout = balloon_stats.schedule_delay * HZ;
> +		else
> +			timeout = 3600 * HZ;
> +		credit = current_credit();
>  
> +		wait_event_interruptible_timeout(balloon_thread_wq,
> +				 balloon_thread_cond(state, credit), timeout);


Given that wait_event_interruptible_timeout() is a bunch of nested macros do we need to worry here about overly aggressive compiler optimizing out 'credit = current_credit()'?


-boris



