Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80CC30E0F2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80988.148762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Lv0-0007At-Gg; Wed, 03 Feb 2021 17:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80988.148762; Wed, 03 Feb 2021 17:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Lv0-0007AU-Cp; Wed, 03 Feb 2021 17:26:18 +0000
Received: by outflank-mailman (input) for mailman id 80988;
 Wed, 03 Feb 2021 17:26:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7Luz-0007AP-3v
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:26:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e23f8b3-68cb-463a-9059-8af6f2fd6dae;
 Wed, 03 Feb 2021 17:26:15 +0000 (UTC)
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
X-Inumbo-ID: 1e23f8b3-68cb-463a-9059-8af6f2fd6dae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612373175;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6y+IWSCPuht68Kt1rqKSydh47wdhXdI6U/4bh8ybAUE=;
  b=L59SFOWmqSFayv8LeWWehsErss8ASb39iflWZsgNgzkFemuCzIYV867R
   gxbH6ZguWJZ6F6ome5nxGv2YNpagH9Q9JIuqDUJrHJK4zrSHE43Z6MNan
   /e+ZNMxREipWDnOljvgJRJNW6Kfgcd9LdzPY/v6ahAOn5Ib2RvyqHimGE
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tgPX8heHvBp/yqe6+MJa5PhGsaSzlq+kEs9/eNfpcsTGIO6hsAKEAnS6jVok80IijHq55lYM8B
 qLNdvdchY7G34jrJMljWIzUYCM8f3DvpiJsfh8fDVdVt/+SHLjEh7fnAAn5ujhiRzVZq6qZE13
 kxhZZRpKoN0+DVfjmF1gXleXxFWhSz6SQLIW1sRE0gXmevoi9rsXGc5DePLAr8BnmZ6luTosXP
 0CceYUnkq+fk2WNQzAIPYu/OKRmfblPThozAHdvuSMXwyhKt0G1gqq8kpHDIEcREP0lr17qnH2
 X0Q=
X-SBRS: 5.2
X-MesageID: 36862857
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36862857"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFfDnu08iuf3HYulGPOLXa/kFbNPgV6faieoDOqqYU7PEC/JtZpCxNvXTFOr2gk+mCfmre6rQLJLTtjyqDO9b0W+h6n4WnZIm/9AUIymCQrsVuZqmB4aHzceIYCMC2HW7Cfd7ksnp+kjRy6U/EPBlexIsQFVTzRAT7oY7Kv3CUlb2r5g3xXKPUPBhrk2/g5Afj5C9HuMCK1RDFy/i+Qzi9uwG63hDthea7GcOnn2/AkkO6boE5+ZlwS2PMetPSFXh8omLrcRJDb+RJs1e4qc3Rio+eied9ea5XjF8jkZXZHAX3fIfcLJRLHXbOB7clWpIxKRSQrXtm3NNXBp4MOacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JLhdE93bHB9SpQ6drUbuNUQHREO/ZYr9kTsziNRNYk=;
 b=Q1He+dBrcEn83HBdHmxBNhicRI3xUDoYGPGLzdPFNmk1pqSqOBqRK4uaNIUfklGbs5sIH9DrV17oFHviTwh5SWaAA8miSA64SXI+BS9Xtg0vyJYSCoaI+2oda+vryPS4Ur+DSJumNjTkoqg0iKdZ+QQJC1X5WlvN6mMcsi6NecMmNeN1Wk0gbhsGNWjbYXC5WSU0Oz9XsJUe0XS+g5zxE8draN22r9l+OjJd6IT3uiuyIPlqnlquIM3+jNM4mZo4/41aduIg8pv2sc/QeZrf4VYMWALBrXhNgsUZ4z1d8cE9TEP3oYQH5j8/9IJ8MTUJOBIpLnZtsD+9UcsI82wcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JLhdE93bHB9SpQ6drUbuNUQHREO/ZYr9kTsziNRNYk=;
 b=IGvDPUglywypcaeln/CU/7bjmCr5uHhnu4xYL3klMDQkJnUqHbMgix16sdJhyAADB5XDAY2Xt0j3tfJZRmWbIPWS6WsEWNtTjyJl4CLes/n6xcA62NDDXGsUP2P4/WmJ2467BfbwWvtac45tIESnN2tg7j4CQBactnRTyFRzAHE=
Subject: Re: [PATCH for-4.15 1/2] libs/foreignmem: Drop useless and/or
 misleading logging
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@netbsd.org>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
 <24602.55938.208939.124502@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <684c5f26-64ac-77cf-4b24-8a83376f8f70@citrix.com>
Date: Wed, 3 Feb 2021 17:26:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24602.55938.208939.124502@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e75b243-12b7-4933-ca9d-08d8c868ca6b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB453540628B83BDF5C528BB5CBAB49@BYAPR03MB4535.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E05QpDohsxAhoFaqquc9kxrpY6ERMTw1TxLOZYf1rgJ/w3UDuTGeQrgDUBkcZzFNI36mtljGJNBKa5izJac43GDmEfHA1/a7mUoIRbf4agkJX+yfsejOkDgv7obTg76ohBWhRkIjLknGapbnfRiyQj/yrEh53ry7mbg9T0Us4ep/uJl9+MDTdNcrcHEC7/12OCvlotgcCf8c+pDv305e4X5REMTnVhK+5Ey7ubjbq0X/pIVvBkhbi1pscwE44HBaoruLp/otmWh0XxX7xBV28mVzBhLnOOndgBtOvF2GYnMeD5Q0V/oeIzZWEz/NoodgkwnJKay1Ipzlx6uGr/t9FskS4qWjqG+DGCJzL5coTGZ0MlkeZKYqxpW8N8SpkAcyZlkOdcj+vtg+egh/XJaQrwAzzzQe7VqwUYBARJTI8kGrwZD8zntLg8/SJkS5q+GZcuWP5f4AqtMkEiSnYXNBxe/ouIJ08g768zfkIw5lPARV3dBSNkzrKjPfvNqXaKC5PmzadwUPthVwoUzcFhEOzRVCN7bPf2Kg7fN/ijwXBYl7YiXqn9pzhapsgN6LsaL0QIQMVF2wJugLpT2qq+z6FRhcqtaja2iqBXEYaxSGo8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(86362001)(66946007)(6916009)(6666004)(36756003)(26005)(2616005)(66556008)(66476007)(186003)(31696002)(31686004)(8676002)(4326008)(2906002)(478600001)(5660300002)(53546011)(16576012)(8936002)(54906003)(83380400001)(316002)(4744005)(16526019)(956004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUU4cElheWQ4WndsYU54UXNhK0FFY0pWWUp4VjJUK3NQeUFWUlFkS1Vzb05W?=
 =?utf-8?B?L0JSd0tGbnpyeUJnMVZHYjFvbVRCek4rNjk0aDJLclJQS2NRSTFhS3VadGkx?=
 =?utf-8?B?ZmRwbmRkaEhCcHNWYVV3OXZCOTNPUGRQYUY3KzZtQ1pKNHgxazFtKzFjV2hi?=
 =?utf-8?B?emJQRmtnMjZ1MmZMS0pxekJCaHBweGY0cHltZGRTcFdhTE1DaTMzN0NYWUo2?=
 =?utf-8?B?ZGhaOUJYV0tCOEpZQWxPdXpIK1BPb28vWmNVaURwNFV1TEdqSlVIY3E2bGxC?=
 =?utf-8?B?M0VuK2hmT1NHL3c4dDJSMEZpRUdJOWFIMUpMU0RYSHpRTnNtenBlVzZXazZO?=
 =?utf-8?B?eVd3S3RrQmhFeTRhNzNOZDZlMWJlWWVWLzR4K1M1RDJ6YzZsOTRnWVBYM3pY?=
 =?utf-8?B?a01lTm1CSVBZTVR5MFpnKzZJZzhWWUFqMjRvY2hpMkJLY25BYUcwTGJvVDlF?=
 =?utf-8?B?QXh5UHZKOFB3UStvSlhVeVdzSXVpOUVES0V4ekUxNnY4RGJ5Qi8vcXRPSWYz?=
 =?utf-8?B?TDIvT3lzb29WeDYvbU9QZTM2U0pFM2M3WE1OdENsMXlXYW92SG9MZ0VvTElh?=
 =?utf-8?B?YVdqR1lSaWR2MWxPSEJmQWtIZDhVWDNjSzRBcXZMMFZsVmNaVTlVVWUwV3NE?=
 =?utf-8?B?UkcrQkxYVEl6NXhRSU5TNmhPT1FmS2ZyR3RHQnlpaFU5SmNkOFordjJpb2ZL?=
 =?utf-8?B?TUFIT0JnZzVCTGF6NXVGNG9OaDZGRUFXZlBDellNOHdHWGJ1bS9EcGhscFdl?=
 =?utf-8?B?OGNXelduWklUSFAzQ3hXT1pJUkRuTkN3SmNWbEQ1eHBka0xObnNxamJTVmNP?=
 =?utf-8?B?NWZYMHo3RzgyUVdJeXlDS0JFUDNidTBnUFM3OGFvV2cybXRhVFR4ZmM1SGEy?=
 =?utf-8?B?akhDdFRJUTI0dXVoWk80Tm5pY2dTZDk3S2VKTzF3NEd4SlBCZnQ5Q0trMnlS?=
 =?utf-8?B?djdlR2J3aHNjSjRaTEtVS2g3R3Q3Z2cyNjFSWlNQUkRBdnUvTVhNd2ZUQzZM?=
 =?utf-8?B?SHhUU3lZZ2p1L3ZLamN0Qks4NCtOdXBsNnIrSitVYndYYTMwb29mTGx1c1BO?=
 =?utf-8?B?Yy8vdFd4VVRQZlROZUlFRm5mWnMxVkdrY0gzV01PT2tHMDQ3YkZ3WFEyNGlY?=
 =?utf-8?B?dGRzOUNFcDFFMGU1c3dwbVJ0L3ZjUGlkTUp5K1FHRng4SmdFZFk3Sm5pRzV4?=
 =?utf-8?B?ZTRzTkRwNll5R1FNd0lBRkhVeVBEbnB2NVVZVGpZRW03bnNJZSsxT3ZjOURo?=
 =?utf-8?B?UlJMSlMrNlRHK1Y4cTNrendINERHQU85cWN0S2VhcjBtYVdvQlNvZDU2TWxR?=
 =?utf-8?B?WGRwai9ZditlWmFUbXFaMnVySlZCRGpsQTFPTnZ3dnlzTVUrNTM4dmoyYURS?=
 =?utf-8?B?b0lVUUx6SDNTVHZTb3htMXcvSTFxS1kxeVZVU1dtM1lBODNwTC9POHZRMGJK?=
 =?utf-8?Q?ZHMYFfp5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e75b243-12b7-4933-ca9d-08d8c868ca6b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 17:26:07.3269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsUQlPtZgzuqfXmluRLZO6GGFmPVl0SF/cNjnpNxLJW8FMl6sFsWz1nqXPym8QDnzxozMnxjiEAhFc535gnVThqexSQi5CEu93Xlr78mMxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4535
X-OriginatorOrg: citrix.com

On 03/02/2021 17:16, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH for-4.15 1/2] libs/foreignmem: Drop useless and/or misleading logging"):
>> These log lines are all in response to single system calls, and do not provide
>> any information which the immediate caller can't determine themselves.  It is
>> however exceedinly rude to put junk like this onto stderr, especially as
>> system call failures are not even error conditions in certain circumstances.
>>
>> The FreeBSD logging has stale function names in, and solaris shouldn't have
>> passed code review to start with.
>>
>> No functional change.
> Thanks.
>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks,

>
>>          int saved_errno = errno;
>> -        PERROR("XXXXXXXX");
>> +
> That's particularly wtf...

My thoughts exactly.

~Andrew

