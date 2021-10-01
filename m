Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318B41E75C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 08:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200393.354918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWBaB-0002Vu-7A; Fri, 01 Oct 2021 05:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200393.354918; Fri, 01 Oct 2021 05:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWBaB-0002Ti-2W; Fri, 01 Oct 2021 05:59:43 +0000
Received: by outflank-mailman (input) for mailman id 200393;
 Fri, 01 Oct 2021 05:59:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWBa9-0002Tc-C1
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 05:59:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0835b70e-57a4-45e4-889e-47fb2d937ef6;
 Fri, 01 Oct 2021 05:59:40 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-FEFkweeIPiWtwPZ_ROhyIg-1; Fri, 01 Oct 2021 07:59:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 05:59:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 05:59:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Fri, 1 Oct 2021 05:59:35 +0000
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
X-Inumbo-ID: 0835b70e-57a4-45e4-889e-47fb2d937ef6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633067978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G9G37LirOMccvt1T8p/BOjzvkJxVoSMMiY2ReACiTdQ=;
	b=asVqOwgkpgKR5Nu5VBvPO7Rz0NMTBw0uuJTWbISEKAhQjsELPpwmvjI8Jod/Z17+RySlMK
	Z+GhXrBNfSQQl8e1qI6cRvIfdzZQ5S/X2HltNrcFtJTvCEs7R/Yjt22a99T7cknanDIO/c
	h9jePlM/NvHIBW+2dcaVxornQdzIuz8=
X-MC-Unique: FEFkweeIPiWtwPZ_ROhyIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5J3yCYFXvrsAqVxQD90bC1jvUQ2kPkfHMvHkxdR/jISnNr8+dcOxHgZX5h94+ZI1PQ3PePVuZoqF1ACsFeGRJsKlcSYYDqpxJvGNPrDvtciz/h5W1UyL6sAWafig2Zp+wyYDEuuVWgaTdsBMfK1uJpoge/maADfYufvVKGcqAhOTpZSQjdy3Oo9KGyyCbMM/uPT1TszvrAb87i6I4ZeVgUlvU2yUwHVdGUiO09CUU6be9rCj6qHGRGkQiBTjToQz6heZ11l7UKuzUS2U9xu4KcCCFj0Od639ZM+GFtq3ujdz6KGhBaMmhFwzZQYoxd4ZZPAdQ1ULFCdc5AjchhRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9G37LirOMccvt1T8p/BOjzvkJxVoSMMiY2ReACiTdQ=;
 b=WXndeGLlDb2XBUCj0P2AzaDzCiZfEZrbhvO9vPIVdlutCljqThIhWf9xTi4YX7ImoslM+7kMe29I59LAIuRBQo5IWDKhRzIosHFbBcIZFMQHiCl3G+YskdHxY5DbupIglTK6069ODsUCDJGeflVEVDvGS9mBFn7JLuc63Buo3nLl2roXuvNiszOueOUqm4sb5P/zbBFPHS5VK8IbTZ5VXL18Q98PyrYYIW+CCor7w22gDxMNTvKGbBLnsFohk0NmrwfXtSXrmlezqFNjDbhhzJS61o1uVeTZoTEzpK7WrITvL+UqOmF3gPPw8HTfGwpILQPPVXYw/oobsqxr2cRYrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: sh_unshadow_for_p2m_change() vs p2m_set_entry()
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ae8b6cf1-d1ae-8a55-7b88-7ef24db0c554@suse.com>
 <YVIo1sR283L/MUeN@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59b46317-e0ce-afcb-55d0-90379c4600e1@suse.com>
Date: Fri, 1 Oct 2021 07:59:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVIo1sR283L/MUeN@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d660c41c-b59e-4eed-b373-08d984a0a57e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445BC4806AB11E80FF4DDFEB3AB9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S46aK5uDZbDviF1ekL9mSHctBrNeIU+n0zsEwRcL44XzHCuSqnrgcJuDxHstvGWjNUqYAvoQX5v6zasscts9q8ayFMEJiqbpYNCQXUhkSgzhWEDnXbCNBiGU4BLG9MySV8SMKoRwxq8hj3rW4i1+PX7tBCMsC/pNnEbyYNLT8a3jAPZ+IbmGJVi/y9hEEIL0wRoJcSybcyGOLkPSfqvAXnANdr5K0s2Jg9e2KzQydV5C0jYPbOMJNtc+IP0+hVmZKSi8+/jrTH+DJPWndLg8a9nDoACpRejNaxVta3N3GPBqdMTHnwKoocl/+HQBbtbVtm4x8VQZ8NVX3LBPZHAA38/dg9JA+0MHg1LNjt4H1nvVNi38mLX2ek3Ecp27spfugod3DXOw58i5EsX4b+tQBL86ZIgin+WW8LiKRkf/IpE1HCnsGGpwA+jR1AAg9qObdeolHkUHaPHqcyo78tsOQqMizFbaHigAnhpzGPABf7yX9GD+rffYza/Bm7AgmWR1UPeRUyo3vUl9t90Hdig0TUd7yrPm7RwVouhIDlxG4zytYd5BWOZpLwI9LQbKRg9ATZ4cVTshrkpeUerrwgF3N+gtg5IJEaUabbeNwZogJ+zNA1IKLOF0H9boWQOzu6HRMeEKY3U97VhapaQz8GTX83Z/Z1cp+BjFN389TBd4N8YSw8nkbpulLLd8ST1azWSGNlzO3BZRVubZPEg9aryt0dYeON0VnURCirve6LphUR59dbZS83pHqPoN08wCYSZFsBPlRoz/0aUFqzu8ESqCdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(5660300002)(16576012)(26005)(38100700002)(956004)(53546011)(2616005)(8676002)(36756003)(6916009)(31696002)(8936002)(31686004)(508600001)(4326008)(6486002)(2906002)(186003)(86362001)(66556008)(66946007)(66476007)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0hER25qVHVmL3FPc2YwdWlUNG1HMXZYV0lXakNLR3cyY0hWdUpFU252M3I5?=
 =?utf-8?B?U1ZMbjE0bTUwUTNpOHFYTWk0VXZ6eE9CUVZ2VFhQRy84Y21nWDZGcVVPSDVx?=
 =?utf-8?B?bjhoN2dnZHpMT2kzTktURU9aWWFXT0JHMG5lV0NHWGQ5YTR0U1JRdTFZQmNW?=
 =?utf-8?B?amY0NGdEZHdCYVhMbjRmaFNZT1lKUWgxOGxCVm1rNHNBRTE0eUZZVGdYeXE3?=
 =?utf-8?B?MGtVTVA0cVZmNHYvQUhiV3JRMTMwVWhVUk1wUWM4Ky9wNzYyTW9jSkZNdnov?=
 =?utf-8?B?VjF3UUNxUEtSWjFZTDYrNW1CdW9VV2pRRjRrRDF1OUtoY0NiTHJxeDN0aElp?=
 =?utf-8?B?a01rdjBaZ3pMYytjWFVhdkpKaUF4UnRkVnc3aUVkSktVd2IwcmlKQkRZNUJ6?=
 =?utf-8?B?RU4vMjZQNmI0RnNXWFNMNDdhRDdjOUU4dVdMWlZUTHJoWlpiN3Jla1Y5QzZn?=
 =?utf-8?B?SVpxNDUrVVhUYzdGa1krTmZXQXZGa2FoU2lVUW8rQ20zNjJDZnhKblNsVHJq?=
 =?utf-8?B?dUFUSTJ5cmJpY09qS3BZRVdSaUxwK2FIMXpEQTIzdExTdGs2RXl1eml6WjRi?=
 =?utf-8?B?eTJKbU1tSHkxb2JmVzV4MWxMbkJ2bTIvYVNlY0RIRFJ1ZFZ0K0draE5JbE5G?=
 =?utf-8?B?R0hWWmJZU0dKYVJxRkZCbWZnL0FnYkszY2JhWjc2eXNaUUVocGMzdXp2ci9T?=
 =?utf-8?B?eWtHMHFGUEtUVVFNMElEYUZNb1FrN3o2QngwbGZ0bnJ3NzNIRWdJM0ZXZGRn?=
 =?utf-8?B?cWhsdkdhNVNCRzY1TDkyWlRQckx0Z1l0N3pLZ2xBVmtOeDA4VXNzRlpydTNB?=
 =?utf-8?B?Q2Mrb0ZYVXYybldCSXl6N1pqSzI3NW9mcmRWV1dmOVlOYnFWQmRhaUJac1Nn?=
 =?utf-8?B?dnhXNk0xMklpSWJrbUg0UElxdDhKaWlvVUFiekh6dkMySkZzd2V2ZWpkUURn?=
 =?utf-8?B?MStsUzUzWlluN0hGdVpGQW5EQXJTc1lQZkxwSzdVSm5UbDVlREh5Nm9EYnVN?=
 =?utf-8?B?dHlXRnRwOG91TjRFVE9WSzR6TVJkRExuMkVaT0ZMdXFjRGtTYzdzVG1JUjJu?=
 =?utf-8?B?NlBMRDhtODR3VEJoOWpUMUlHMkJsUDRraHhMNXA0LzltdytiQzNvN2YrNzEx?=
 =?utf-8?B?dkxLUTNYdmRRcjZyWjQ0WUdhSjRTWE9uaDMwd1o2NitMVWNGODlKTzNwRG4x?=
 =?utf-8?B?WnlsWUYzYzYyQWxmb3BuN0JKck5FS2cvelVTRS9KSm5sSENKVVhvZ2pQajE1?=
 =?utf-8?B?c1ZsdWQ4TDlTZnBac1crUUN0RTdPLzdrMUV3QXh6NUR1WHluRkgzR1dzQWw3?=
 =?utf-8?B?NFJXODhVNDMyTHAxV3lxMUw5ODVvQnEybjRscFZZUzBHOXdJRk53SWZKSjdl?=
 =?utf-8?B?MmNPY0Vqc0ZieXR5aTVTMnpaLzdHdzUyMzVOaHpNUGVNQnd3Zk1TcmlvZmdE?=
 =?utf-8?B?R0RBSVE5bHlHT0VNVnMxVEpaR21OMFpLWVZQWlZyZmZ1SU1tMktkeWRiL3g5?=
 =?utf-8?B?eFlpeDNkY0pibEJUUjdMUXVCVE9BeVBCeG9OTk41NEFUb01TelJweExlM2lQ?=
 =?utf-8?B?N05mcWwzcm84ZnZZdkw2czJNc3J4V1Y5ellBeHRXanZoVVp0NC9JWThYaEhF?=
 =?utf-8?B?aVh1VDN5dm5IR3BSdmxYaE1mcFJEN1M0RU8ybGNKZ3Q4V0lYQWZOT2RaVXk2?=
 =?utf-8?B?WHFFbXlYQStFYnA1dWpVY3FyRFFOWXNhRlBjTnNleWpYMVpybkdQMGZYcmUw?=
 =?utf-8?Q?2Y/srx5jMZhMrXfmMQ1Re/f8dCtsdcByL+Zx4HD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d660c41c-b59e-4eed-b373-08d984a0a57e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 05:59:35.8712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UF93w3NtHjniZCPkyXZhlUYGiQd1iX7wAbTR+Uy5PiRazDt8yEUa6oPHhAdge/Y76zHoqjmvhnSMQiywp9voyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 27.09.2021 22:25, Tim Deegan wrote:
> At 13:31 +0200 on 24 Sep (1632490304), Jan Beulich wrote:
>> The 2M logic also first checks _PAGE_PRESENT (and _PAGE_PSE), while
>> the 4k logic appears to infer that the old page was present from
>> p2m_is_{valid,grant}().
> 
> I think the p2m_type check is the right one (rather than
> _PAGE_PRESENT), since that's the one that the p2m lookups will obey
> when causing things to get shadowed.  But the extra _PAGE_PSE check
> should stay.

Actually, having transformed things into patch form, I'm now puzzled
by you explicitly saying this. Wasn't this check wrong in the first
place? I don't see anything preventing an L1 page table getting
zapped (or replaced by a 2M mapping) all in one go. The full range
of GFNs would need checking in this case as well, just like in the
opposite case (2M mapping getting replaced by an L1 pt).

This scenario may not be overly likely right now, but would become
more likely once we start re-coalescing large pages (which I'm
planning to investigate using the same scheme currently proposed
on the IOMMU side, to see whether this actually happens frequently
enough to be worthwhile).

Jan


