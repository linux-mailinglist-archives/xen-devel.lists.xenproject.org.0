Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A073A63E9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 13:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141344.261114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lskZR-00018l-SL; Mon, 14 Jun 2021 11:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141344.261114; Mon, 14 Jun 2021 11:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lskZR-00015q-Ov; Mon, 14 Jun 2021 11:15:57 +0000
Received: by outflank-mailman (input) for mailman id 141344;
 Mon, 14 Jun 2021 11:15:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbqA=LI=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lskZP-00015k-JX
 for xen-devel@lists.xen.org; Mon, 14 Jun 2021 11:15:55 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b156149-2019-40f9-a6c8-e4e9d11b2c27;
 Mon, 14 Jun 2021 11:15:54 +0000 (UTC)
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
X-Inumbo-ID: 6b156149-2019-40f9-a6c8-e4e9d11b2c27
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623669354;
  h=from:subject:to:message-id:date:
   content-transfer-encoding:mime-version;
  bh=8HZBenymHg64BucWeXqDtfdc2Z3bnJwGmoXVxoU0QZM=;
  b=fG4USH8JgvTxIAY2VCZFKKXSAgKHLKsmbxIYDTKsmYyotW1Cvke4paRj
   6cn+L9huGmgEhzR8OETebXwDd2bC7VKhenQ0KDKpSYbdNNMJHZ0gnF8YJ
   NGcLDHND6G0qfH9HUxtgLre7eneuCXoTrLCqwmRDbt8QZR1xylaThbSru
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dKmKC9Fpa/NUpDcnAXRybM7rw8FvtvOwlzoNaa2YDD36zc3JJg7KwpTLwz3G0crxTzk1/8v/it
 SzXHOgNaV1zsr5bJpXVfL9ye17RH8rZJ7zftMx5DUBef7JFsgMFALkVKIDgMY3joUXQZmT8R3C
 yP7lNxNmshPSJZRjng2zGF2S7gAqrG/qgZfhxBSaXlrQxtrQMYAeriW3pP8GYMk41iP469lFab
 l5aarYOxuAIXlCQEgqVu3WU1bU6SEr4A3Sy4xoF0S5FiDQ7oCQzRTl2DVfZq503EwsuKBsBwar
 gKs=
X-SBRS: 5.1
X-MesageID: 46036397
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mD2IFKoqgAYp8WqtV5ImCoQaV5vaL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+exoS5PwO080kqQFnLX5XI3SJzUO3VHIEGgM1/qa/9SNIVyaygc/79
 YQT0EdMqyXMbESt6+Ti2PUYrVQoqj1zEnBv5ah854Hd3APV0gP1XYfNu/WKDwPeOEQbqBJa6
 Z0q/A36gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy8AwdkaWK0hIHgd
 PMqxAvM4BY8HXKZFy4phPrxk3JzCsuw2WK8y7ZvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqptsCw/aliiV3amIa/hTrDv3nZMeq59Xs5QGOrFuLIO57LZvsn+9Ka1wXx4Ts+scYa
 5T5Ki23ocnTbuYB0qp9lWHjubcGEjas3+9Mz8/U/euok1rdUZCvgIlLfwk7wU9Ha0GOu15Ds
 T/Q+9VfeJ1P4UrhZwUPpZ2fSLhMB2wffuLChPKHWja
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="46036397"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9Mz9KYKkZN/54SsPA7c5vqFYsGKC3HGE3HKwy56sBrSHsHmWb7jh3FQDlcGLN3Fcg/OnZ6j+Xo4lIJZ9QTE2p4ObNPs3en2XGUgCMpZeXTA5Zn/A85CYNJ++SaqTcefN45CWD4O75ykO32mOiFYwuYKsfO41rbeNNmXOEvzDmXMYFijqmjwYuU1ZPyRnrUhq2VBmMUOKgC7JLxzXDFlnmM2RwbJuaBYKpwNlz2knaCrp5gSzEh0MJBARivFTbel85AJxcznLliIM/eZEe6R97/n+ZER7/iZI17RP0KVAHl5SP/XXKbq0lYH9mJBr2fCccG0f8PSK4XLzQJjj8HuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3VDvPhjn3tj27Bj+t9BHbFR5yJS7KEvtm/3JBs7nfA=;
 b=Jm+lj/2E9Z8OmpNKNVbo/FZrAwAwbGm9ngVTdty0AdsZwff8Bm6Xp7HME7/V08+GnuHgLM8Kwi6QNLUqxJrXOneHZfwQe8NVFkGA3ssBzytcyaEhQnEgBsLb2dt7K2C1Y8cpp/8dfBk7SIB1ckEg6uySEx+vDDToc+uZSbG1q+wgp4AbZroBwpDIJFyD0lCbWiD0qNiw/FlxhdnQI7s60Dm60KOvoY/63iG5QBEQ6b/8l4GnxOnatG/CRZW2TMjJtwDrr4imXZdIyEe2ldCu+CCpDy+j6SZU19FLIHu2bKTsSmUWrDgNd6lyBqy7y4ESYC20brVpSJX81iY/RXFlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3VDvPhjn3tj27Bj+t9BHbFR5yJS7KEvtm/3JBs7nfA=;
 b=xBX76cJwQr9eNA/b9eBk+N2VHF2Fb0EC0+4ed6wKiUuZoaf5hwJyeuvbXqxtGPZ3Gyyufv1fqbyB6TD/nQRhmqyUkxWymMgS7adgKy6fapwjLviHIVpEIPqwGUBO/OEe1BOyuXqELWDeZ9raPovci5E/tdTXeARWLYm8HTG9nXY=
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in some
 cases")
To: <xen-devel@lists.xen.org>, <boris.ostrovsky@oracle.com>,
	<roger.pau@citrix.com>, <stephen.s.brennan@oracle.com>
Message-ID: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
Date: Mon, 14 Jun 2021 12:15:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e08e659-2ee3-41bc-f134-08d92f25c0f2
X-MS-TrafficTypeDiagnostic: BN6PR03MB3060:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB3060EF5B28FD8D2F7A4135A0E4319@BN6PR03MB3060.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ioj5LAfbl+GmN1/lq86VS+QWTL0e5/Y1VcP4KhS44DC9UrS8adA0aIdDGjMF1qbW2bXDGtrRL7v2zqeJkJyFu1Yfl43RDa4tV4EA6dQnM5pYP9sEpNw0NUCtDFpjPMcHAnc1mcQlBMDAnKtEYhHolgYD8SeDulQwUd6F5mLvMFlXDZ21m6uxiO2Oa05KZjxhKrziVbywPZgQlCwU7JYyRpJfyNoixOYOrIIWl+kt+ssLC636ZFqDkks4chqd64y4EXS01DnqiQHlgCr3nvS4FL03EnxaHTPX42gxPlFCAMY0cEtnJ58qAHeREAlmdXXPSjifsYj10ukna3TvuMylRT8iaBdG+h5aYeDEMwqbrQSv6e4tHe9rIxrqSZqEsB14ElUBIF39vq0eRQHvgJv2nAnBkjQVTmTuo7TYofEfcILVzQJunzY2y042rEqloRwJfMGBXEzaR0LtbDXU+0RvyLWzcuKwEbRhpmUGLtHJvdAHcj1UpK6LPY1pKy7V7TbljQ1FmxR1axrl2Y7YfXjrhhsfBSUFXCxAVEn2PZ4oKm+lOONkM4gI8bC4BuJo9h6nuGwDAYfxhbXulH7EAZzS4KtnTwTh1y2Gyfq3PwSKM/sfWjsNrkkI2jBECW0stl1F67+XuaIS39CEfSHoga1Af3P3Sd+TT5hFfQlpsckiJ0DSkN81cb55RmrzdY581bS1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(2616005)(16576012)(44832011)(8676002)(316002)(956004)(26005)(2906002)(66946007)(66556008)(66476007)(186003)(31686004)(6486002)(6666004)(86362001)(83380400001)(36756003)(8936002)(478600001)(5660300002)(31696002)(38100700002)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anJia0dFaS9KQnFEL09KK21ta085ZFZweHhvUXF3NGl6MGNQcWdXQWxPNk1L?=
 =?utf-8?B?cEEydmpha3hmT0JmYmZ3MmpuR1VGVjdma1ZCMi9lRkl4TjVDbC9taVVyWFlh?=
 =?utf-8?B?UTFHTmFpKzlsUjI5MlZpV0dyakpLcUhiSVI2U3l5T2VlSjVIeFA1S25Rbzg1?=
 =?utf-8?B?YTl4a1E5WGNNMVg0WUN5N3MzYXhnTnIwa0U4b0xucVlCVXhNRnFobFc2VnFu?=
 =?utf-8?B?bUFmRXkzM3pKZStMR01nTDFBQS9tS3FPNnhjaW44TjZLWm1FR2pLTUpwRUpK?=
 =?utf-8?B?bmdBeTU1d0xGUHIwUVRDMkhqc1g4M3N0REVHdEhmSkFpYVgvb0RKL0FsY0s2?=
 =?utf-8?B?bnpMaGhjakUyMEliTUxMcHJ5eDlOZHBsUEJUdzZZL1dHTHUzNTk2aW5ISjY0?=
 =?utf-8?B?QjRjMCsxbklyZm1kZ2JJeXk5Q2MzMFpNVHV4MElzS250WnFaQWhOUzdpNkRw?=
 =?utf-8?B?ZWZEOGduc2RXRzF5NW5sMU5ZWTJ0dUdaM1dsSkRkRThmSHBxRFVkbjFBM3ky?=
 =?utf-8?B?UW1sQmNKMUx4c2F4ckZmVHp5dHgvWEVmRXVwNDc5TWN3cW95YUtqTm9ZR2Rq?=
 =?utf-8?B?eUlOcGM2SXJHTURPSWJ3SEUrUTZiV0ZPU3F1MmU0VkRmc0lwRE5vS1FQbyti?=
 =?utf-8?B?WkZ0amdzSkI5NlV1T0JPaUdtdUdFZkRZdEN1b3VsSzhyWUtJeUplQjEyME1R?=
 =?utf-8?B?V1N5eHpVVUk0bTdGd1NnL1dOeWQwY3IraTJCN2RWbUZHd2t5cmVTeUx5VmJx?=
 =?utf-8?B?Z3RYNEpFRThOTGo2QzZFeDBYWVBONElyVCt3Nk10OEZaVC9wa3YvRnJFVTdZ?=
 =?utf-8?B?ekMvVUcrOC9HbVJQS2E3dEQ5aVZWbnQ3eGcySFNiVzdjSDI1bHorRmZmbnpw?=
 =?utf-8?B?cmkvSlZ0S1phUHZHWTJTSUdSOWcwOFhYUkFXWWFqRUhYR1pBUFk4SFlZMFd3?=
 =?utf-8?B?TllOVTVMbko4MmhWNlZPa1pmK1RTQitxUC9PUXZBT2ZnUjhzVWFVVkNwUUVX?=
 =?utf-8?B?MnJCTTc0U0VLQVFEcDNVSGx4RkZsbzFTSmF2dTEyMkxGT0dUZ3B3MUtYZlUx?=
 =?utf-8?B?UWRwR1UvNVRTM1Yyb2FsTmgrM1RJZzBjcDRJc0thcCtCSE5tWUNrVUI3a29a?=
 =?utf-8?B?QWZiUkRNUVVsME9BdXpUZnBzNk9ZdU15MkIveTF1cnUvNHpWeWhMZnlGZHZL?=
 =?utf-8?B?SGlNcWs1SnZTRDFUemNNSDY4b1NhTllLM1lST3NaTUxXSUVDaWNBdHA1SWYw?=
 =?utf-8?B?SjF2L1BDNlpEd05UdWt1U2l5SVpvbk1CRnowbklQNXNBeDlTL1hwMVRVby9X?=
 =?utf-8?B?dHFtemFTaUg3UzhiRmo4UUhibGFOaC9MbjBPb3ZnQVE5bytJQU9UUU5sRm9a?=
 =?utf-8?B?R3lhZk1pbjFxWkRkK3ZITmo0WWJTQ2FPV2ttK1ZJTU5GeHNBSGhYb21VeUwy?=
 =?utf-8?B?UmIxVG51alhzdE9lQnNlRVdFOVZQUnlPdkRiUVpBTUhhS1lWSXZ0Q2ZadlBP?=
 =?utf-8?B?ZWRFbnhqVGVYeGZheEgyUEE4UXQ4bDh2bXh4WXU5ZWhETzFIVjhMdE53RnRq?=
 =?utf-8?B?REZKQlhPamRkdVdxYTNtUWh1RDREVlJnd0N1KzNVTlc3WFdtdll5UEZEZ00r?=
 =?utf-8?B?NG45MGpLOW5CdzFKUFhFbHRaeGVoYWp0SVJhYkh5SzlYWnhFVk02TGhvUFI1?=
 =?utf-8?B?UVd1WkkvNjgwc3pUaGJLU294Q0lRcjVQRHBtOExXZ1ZiY0hmSy9zQVFZT1Zr?=
 =?utf-8?Q?tagGU3BnvxrCtWYYrcIvKJdrEIJPNjfDHN7UwXT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e08e659-2ee3-41bc-f134-08d92f25c0f2
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 11:15:44.8867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSBv/F4fGvJEMzzJ45CWqdETzpKYGk0y4Km4Dz0N6DgvsFmV5d4S2ivyxLAdHsed+NvDbCmnOh7SCuAinibfQcWIHV5ycfVkj9Lovo5zUAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3060
X-OriginatorOrg: citrix.com

Hi, Boris, Stephen, Roger,

We have stress tested recent changes on staging-4.13 which includes a
backport of the subject. Since the backport is identical to the
master branch and all of the pre-reqs are in place - we have no reason
to believe the issue is not the same on master.

Here is what we got by running heavy stress testing including multiple
repeated VM lifecycle operations with storage and network load:


Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
----[ Xen-4.13.3-10.7-d  x86_64  debug=y   Not tainted ]----
CPU:    17
RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
cr3: 00000013c1a32000   cr2: 0000000000000000
fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1b):
  0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c3 55
Xen stack trace from rsp=ffff83303fff7cf8:
    ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
    000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
    ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
    ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
    ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
    ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
    0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
    ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
    ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
    ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
    ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
    ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
    ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
    ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
    ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
    ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
    ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
    000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
    0000000000000005 000000000003d91d 0000000000000000 0000000000000000
    00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
Xen call trace:
    [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
    [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
    [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
    [<ffff82d08027df19>] F context_switch+0xf9/0xee0
    [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146/0x151
    [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
    [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
    [<ffff82d08024324a>] F do_softirq+0x13/0x15
    [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30

****************************************
Panic on CPU 17:
Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
****************************************

That looks like a race opened by this change - we didn't see the problem
before while running with all of the pre-req patches.

Could you please analyse this assertion failure?

Igor

