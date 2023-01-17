Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C969666D93E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479111.742733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhtu-0004yv-DH; Tue, 17 Jan 2023 09:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479111.742733; Tue, 17 Jan 2023 09:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhtu-0004wl-A6; Tue, 17 Jan 2023 09:05:02 +0000
Received: by outflank-mailman (input) for mailman id 479111;
 Tue, 17 Jan 2023 09:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHhtt-0004wd-0c
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:05:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2063.outbound.protection.outlook.com [40.107.6.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04671866-9646-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 10:04:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 17 Jan
 2023 09:04:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 09:04:56 +0000
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
X-Inumbo-ID: 04671866-9646-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDC2dz3ZRx2k7uJx2Xty4g6m1YVJViTxpzHTRRLtScLUBwrB4cCMSPbdPfaILzNNmN2f0KQ6HiYxl84LiViRrIgkGEjmBVo833dZ9lN+T1wqKWlaaxJTUPFFIwqh0/vS4NGUh3/AMvQPxT02nw1yf4G6hudDIbz8jjf0EAaNoq4qJ8txqQD1mULvk5Nx8acsXZC+5OOZv0tHDvlILgiZYxv/iYfaGL1vrrcsjY2PHvs2D2wSbb228jr5rDkAEk/l/dGNhVCF4qSr/NU/Kf1fKrRXs7qAkNu5TrPn5FYDb4XeWZL8uqDUJcGbBTrp3wT6xQIQ4wobe4ATBhiWIQt1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A8HKecoo09GKxdSKjuaI4KhNvuu7fq4sN6QkVn3eVA=;
 b=YxX8FkgblhbLy2KEmqnkldjxjAkRmtEIWltR73Cjpr4MHcMgneKS3QwhfwYrAt7DgSVv+CVHsRANkBNrUSHBm/bxC47+TJjlNpr73BUiVBfS28Yv3MjoepKYD4Yd+K+ku2k3r3fqGVDM4jmfvNoRcFmiHMQTxOB50k1R1cw2jCKM2yNKVzj8+XLYRwTQhiRNIQPKDJLDmGq25wjlr94N3COFw2jhiW+zSV+UeIOgGUcofHMK6M0hpEJcKdf2KAXHSP4hPCYaxa7YWIlvzN1yTV6+QHibWgtoJQq3O1jMntBeAYyOG+v73X6LSTDhUWc5s9FvC8Z8M4VCOJRjeztHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A8HKecoo09GKxdSKjuaI4KhNvuu7fq4sN6QkVn3eVA=;
 b=hoObRQKf7lVlebUZW1eY7ZuGOWkjP+zzJkrU1Ko09PhnFMtaLHFqJ78kq9Cw03aKlZqOHPMmeWrLO1XB6k3CBwpgDCfdWx8ag767jRvhP7JtL7bZITJuv609S99CiHMmcj+sDGrc33TKP1Ar16b3PH9QJ7hVmLrPZKG6HaPwY7LzxX4neRXtptoBlE+lIU+4ANuP70a84sR8sWhy3W5zvMG02i3PQJSIy0QokvtzQmEzWORAxYgHM28DkY6DDy2OHgei9F2xeDCsNnJq92+agcHIgq4mYHpMNCAHlFjk0d4VNRqI+2CGBrnAIvNA7AAkbl4Mh15J/83kKX76ZUiN3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <790836eb-c5e7-a768-c759-2cc7554168a9@suse.com>
Date: Tue, 17 Jan 2023 10:04:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/5] xen/version: Fold build_id handling into
 xenver_varbuf_op()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-5-andrew.cooper3@citrix.com>
 <f92334b1-7819-d638-fabd-91baca711615@suse.com>
 <4639aa6c-cef8-3434-1607-fcb4b563a991@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4639aa6c-cef8-3434-1607-fcb4b563a991@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: d35a8770-7bae-4651-f42d-08daf869e730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2gVN9kiDkKzJZOBfRVGOAXRdrg1Tt5VTu+FBpfyhwIU8nem185s38GNEb7+LMAhDDInoxRJKqVlugeiBnandUUSdC1VhRJFTBmbxnJxzG9pGgM8i1jNMrLpTz8bQV+bq1Gl1HaiKl9cZfJM068lvFeLm4Tlcx1R/UpnWbVRRMPZQXRDcjQ3NQOPnErbLUlL86W6OZOtBOiadw8xrOrL2NqgZwidc4OzgTXFn/lqIjG58SDPYQr92l00oA+bOW/j+/5a+3VAqwC2HyhGmipow9XFX24EWxqZHdrSA9q/xDSE3iytY6smx4BABjLN9PPKsHYyLQxtPc64denPf6AlJgYK9um+XmY9VGXm7KoBOxjDhXZ4GN5VasTSAVHrdn9qwkasAgC0In5Z/lZgRRzLSjxq3RSbcUnBQYbXlnJDXOcnGnltF0V0+jAPqFcztwGcpmbiTNSaTuxe+6mBc1T+2H+3yQt7qYXNm6h7G/kaTc+fQdRsTeE/JBjkOWGuC9yGx2CvL9YN20OLx16wyTxRngX/zbyWFUOo6BNvyGbMycc6L2vr84zfdN7RvS8uIIhWTTGF9zPbOLqpmoj2G7f88HF/Nmr9FSxL97uLDlVVe9iYmGO42Bl4I1fPza6mNTFj/fv+VcFYiLAzGa79L30EzLywoII2kpaHBeR8WHO2i8sAnCH6KHOff7K40pQQCxwohoqIgAf6krxyOMVUUeuKvUKxwxV1QVrO6Wb1LLwt8W5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199015)(31686004)(66899015)(36756003)(66476007)(66556008)(66946007)(2616005)(41300700001)(6512007)(186003)(53546011)(6916009)(8676002)(26005)(4326008)(86362001)(31696002)(83380400001)(5660300002)(8936002)(54906003)(478600001)(6506007)(316002)(38100700002)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTFmaWJZUFNsKzlTUjRDOVJUZllQSlVZNk9hUGZYT2RWNEZycU54bkpxSFpn?=
 =?utf-8?B?dm5GcGdaSG9qSjdjMi8rOGQzaEdRN0JhZjFaRDYxQmhnWEJkYjRnMEZtbGxX?=
 =?utf-8?B?TUkxYUp1L1N0WGMwZlBhY0tteEhzRzEvUFhqcVRFSWMrajA5ZXF1bnRzWk9x?=
 =?utf-8?B?RFN4dmVXakdYeXVTL1J1ZjZhRUgrdG5EUnFqRlJkaktQRnhHeFBlMnRnQU1v?=
 =?utf-8?B?Y0lFZitrNHBwcFVGZ1R5WlZmU0IzS1lQTTV1RktkdlZwbFVWSEZQeHdKVXFr?=
 =?utf-8?B?bTZBTktEUEtRTGRlc0d0NVVRZ0doSGV2cU5WNmUrYytDRncyUzA0MmhZeC9L?=
 =?utf-8?B?c2hLZ1hlU1Q4TW9yMXRIcnVta1Jwc0ZZYmtGektUOVdiU3Y2MytadENmTjd5?=
 =?utf-8?B?TDNVVUxHTDAvcHNKTlFSZlRnMzdFVkZRTUI2UUZGRWcxcW11MGk5UE9uSmIw?=
 =?utf-8?B?YXlEOXRieHVEcG5JUkFPQllDWTBpVTMrdnIycXE5aVp1ZnQ0NjF0UzNlT29C?=
 =?utf-8?B?L3F0WHpxWWdSZkt5U2JmUWo5QytOR3BwaXFqdk94R01kNExYcm8wVTBPYS9J?=
 =?utf-8?B?K1ZTaDNhKy9VNFJ2RmVQejlTajNkeGJwUU4wZ0t2V1NmTEliUFZsRkwwdHZF?=
 =?utf-8?B?cDdDRWpIckRDSTE0dzF4RjJvR2hUK0NWcUhJMEJjUkxhME1zVXZDZmZONXdk?=
 =?utf-8?B?QXd2SWtTdmVudWJaaHh1UnYybXQ5N2ZVcEVRdWpGQlBDUWZDTUI0Njh3RkJU?=
 =?utf-8?B?YXpGMm1aanRVVWIrc1lCL2laaW5Qd1FMQTZDT1hjRnFWdHBUSTA2SHp3bkFZ?=
 =?utf-8?B?clBQeVhlY2dkRlpzazduT0lSN0VrKzlFRFRQT2VyYThaYXdiVWhJTXI2ZzhR?=
 =?utf-8?B?OFg1RjdPWk12cDVwSkl1bzVlTHBkM1VlUXNncUlrdnJaNGMrVEZzTjJCV2t4?=
 =?utf-8?B?VmxQT3Baa082SGpUaWNhMEQ1bTE2UXFYalVYRU9weDdNeXE5YVRNNVVSTDQw?=
 =?utf-8?B?SHc1UXhXZldyZ05uN2JpTmNnQTVTbGM5UGFZZngwdFdCNmY4L05ZUkM4MHQ2?=
 =?utf-8?B?eEZUa3FZY2U3YzQ2eDkxSXhETWJrSjhlYnl4M1o2Ny9BY1Fac1E0d2p4UDI1?=
 =?utf-8?B?QnRBaS9OY2h3Yllqczk0czl1ZDhoaHgwdTRLU3IrMDIyeG5xRVkzRUF0cE5l?=
 =?utf-8?B?cVNISUdXZWt0bVBCeHFuMWZibHBaVlpZUjdDakovYWJvbVFwRTkycG91NC85?=
 =?utf-8?B?QTIzd1hSajlmNGEyTHdkT291MXA5Y1ZDRE5tWTdUd3JKcVZoWGFTRkdkb21L?=
 =?utf-8?B?WGlHV3pXc1lzbnN2eTMxc0FWTkRZM2pSdjZUaUR3bWR3ZkR5OU1XaWZWczFE?=
 =?utf-8?B?TDJadEpVajg3NE81cGk0WkhRRUxEQTY1aXpJUEFGMkkzbW8xeDRXMVBnU0Np?=
 =?utf-8?B?VVkyRjhWdW9MMzNqUTlhdHJWZnZzMDZJNUdvOVhneDlLc2ZjYVpvMTV0dUJL?=
 =?utf-8?B?U0x0S25KNGlzb2pQQm1IR0xWWUNHb0Z6UTZQL0s3K2pMU29TbCtQZyt5SHBI?=
 =?utf-8?B?WHJRRXZCcFRIbU9NSkJybm5CWHFrbWZYWWNNNHY0TTVsbTVlRWlaTnVkS1Vh?=
 =?utf-8?B?Ti9rdlE2LzdDSUdoRUovWWhqYWhQaFpvM1J5QTJ4T0t5VVI1aHJQTHhHTG45?=
 =?utf-8?B?ZWM1UkxDVW44VzFraHhEZndoak5uU2dnTWYzQytzZzRPMmh6YWJVSk5hT0Ni?=
 =?utf-8?B?bnJ5MUJ2L1Q1dVM1c0haYm1xcURxZklKUDZ1UG9waEE0bFFBaTJuSEROTjZD?=
 =?utf-8?B?dGVDMEEyVFRuL3hEMUcxRTB1b3JoLzlsY1kzVW5GaHlTOVRBL3VtSXluayts?=
 =?utf-8?B?cFhYK2pYV1liQ1RPTmQvaDVUTThtQVlJWnQ3Umh4VUhpdXpyNzlEcGFqRjhE?=
 =?utf-8?B?QXJqZXlVM29adWRQZC9heEtjaU9lQ3VFRStUbFQyeXhZT2hrbHBQaVZPZW45?=
 =?utf-8?B?aFVueFpGZ1M3bGRUN1BPTFlDR3FkWjRiYmorT2tGa2dobHNhdUhOaTdFb1cr?=
 =?utf-8?B?Y3UyM045clpvWkRNS2MwVUJhWmUxVTVlR1h6U0IvWk1rWDNNTDA2a3NXTWJu?=
 =?utf-8?Q?K8WHL2Vm1PzB3APd4/mHUSnLU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35a8770-7bae-4651-f42d-08daf869e730
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:04:56.1908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlkyYEcnMOjOyYAm3YWNk+fz3QUCXyX6zy9iPNMZIH/JXY2tvZFVEDMD1qNWKbYSa6cXYT8DN0BJKLUBut04hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900

On 16.01.2023 23:14, Andrew Cooper wrote:
> On 16/01/2023 4:14 pm, Jan Beulich wrote:
>> On 14.01.2023 00:08, Andrew Cooper wrote:
>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -476,9 +476,22 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      struct xen_varbuf user_str;
>>>      const char *str = NULL;
>>>      size_t sz;
>>> +    int rc;
>> Why is this declared here, yet ...
>>
>>>      switch ( cmd )
>>>      {
>>> +    case XENVER_build_id:
>>> +    {
>>> +        unsigned int local_sz;
>> ... this declared here?
> 
> Because rc is more likely to be used outside in the future, and...
> 
>>  Both could live in switch()'s scope,
> 
> ... this would have to be reverted tree-wide to use
> trivial-initialisation hardening, which we absolutely should be doing by
> default already.

Interesting; thanks for giving some background.

> I was sorely tempted to correct xen_build_id() to use size_t, but I
> don't have time to correct everything which is wrong here.  That can
> wait until later clean-up.
> 
> Alternatively, this is a pattern we have in quite a few places,
> returning a {ptr, sz} pair.  All architectures we compile for (and even
> x86 32bit given a suitable code-gen flag) are capable of returning at
> least 2 GPRs worth of data (ARM can do 4), so switching to some kind of
> 
> struct pair {
>     void *ptr;
>     size_t sz;
> };
> 
> return value would improve the code generation (and performance for that
> matter) across the board by avoiding unnecessary spills of
> pointers/sizes/secondary error information to the stack.

Sounds like a possible plan (ideally we'd check with RISC-V and PPC as
well in this regard, as these look to be the two upcoming new ports).

> The wins for hvm get/set_segment_register() modest bug absolutely
> worthwhile (and I notice I still haven't got those patches published. 
> /sigh).

Did I ever post my 128-bit retval extension for altcall?

>>> +        rc = xen_build_id((const void **)&str, &local_sz);
>>> +        if ( rc )
>>> +            return rc;
>>> +
>>> +        sz = local_sz;
>>> +        goto have_len;
>> Personally I certainly dislike "goto" in general, and I thought the
>> common grounds were to permit its use in error handling (only).
> 
> That's not written in CODING_STYLE, nor has it (to my knowledge) ever
> been an expressed view on xen-devel.

It has been, but that was years ago.

> I don't use goto's gratuitously, and this one isn't.  Just try and write
> this patch without a goto and then judge which version is cleaner/easier
> to follow.

I wouldn't have given my R-b if I didn't realize that.

Jan

