Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926747327F1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 08:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550003.858857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3Kz-0001q1-PL; Fri, 16 Jun 2023 06:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550003.858857; Fri, 16 Jun 2023 06:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3Kz-0001n0-Md; Fri, 16 Jun 2023 06:53:37 +0000
Received: by outflank-mailman (input) for mailman id 550003;
 Fri, 16 Jun 2023 06:53:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA3Ky-0001mu-KD
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 06:53:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8348be34-0c12-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 08:53:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 06:53:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 16 Jun 2023
 06:53:31 +0000
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
X-Inumbo-ID: 8348be34-0c12-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETnXwClJlySsaJ/UnF+V+tjr7n7/tC9IwP7tSgRZVNXu1IhnVp6RWDeFvaKCw8N5ySFRSGIZYXB9qbz6dIutay/rCl4nrcsv6TsmaZfc5/H8u5HSWi1R89bw/NcnGGmcfY3EvPuxJC1vxPrrNdgbKhu2GCNwOIKSfgn1PQEruG73CQRIvA8SG5/mmbBKziXnRWqWJAVZkDHpYdQm9cmGsHrsNj8uQW9WJgE447EY11gusVhrIB+FDr0gDpVKdSl8amiHiTIdFAVE1+0UsYLZXnr6oNppIlnAiVNfex4ufFQPGFYGotI3j9inrNuuJeyyqsN+UOTi6Tg5g4IUBO84vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVo+TBSYQf/729ZD3ntmDIto7uHW/kHofae0lkEKJvg=;
 b=hE1mM2gb1Gow4Xl0KSBGVeOk3wap9X//UgstQ5Yjoom2BuS3MwYC83jAMLTwtdLKh+iKvY87GLBSjBzygm8JU3cgRl1xhvhrync2A+DTO6KYKekLGJNjJWT23K3csiLov3Ir0Fk2+hr89RAbrnfj+JwqcLTmbQPL0fvp8IHPb4wxPpDKnKNfvK6Y4Gif3DPJV2gV2IBouJQ0SnPxqx0Ie04paIKbC9+/kc57tDOKr10/6n79mnkEn/AFMKo67Nx2A4QXtcP31DIald9PXx3CTzA2ZDgSdxhUhfuYBWjAKg6kL7tyGVSr+3Kw51uAxTt0zdHYdlh0ztuJ8ONfjEDVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVo+TBSYQf/729ZD3ntmDIto7uHW/kHofae0lkEKJvg=;
 b=ABuKTWWwsx9VNuTDrsLbWJdBLHrGhLykpWfCsEZqci2wJ4velAeNs3yq8nFKLVpLWJCAd46nCVd+zMZDCTsW4xHbUxTE/eENSaN2QHVEAjBMklXXitdrqFwLv7NWLfhHNBGFnzguAHLUixWjh/ROuq0CWJwBcYKVRbi37hGqoQO4rWxbcUvdp69Y4UWK4DNoSY4aC1eH5XCCrvjmV7XXg51iM5wM+MCXKUQaBUMCLA3YlssM0UTJeTay62LC1lF0X5C9P9szac9lz8PFPPure7+UPwdfYPDzft1vrl3wKgZrnL8dzKnEfRCq4XC55NLFEVyDgLdYexFDN3MGBy/89w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7eaadcb4-8580-b240-4451-5a98c66ebe5a@suse.com>
Date: Fri, 16 Jun 2023 08:53:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a9ffe7-214b-44ab-eacb-08db6e36657b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lfhqi8IypwaowM48WHwGEPuPikAvbt9mgGpyETAgmpBBDzKGiLeznrsmAYJ3yNOGEXpQa4Rmx6xghsvu7HHeggKiWmVI/OnR7pWC5FXrrYM+GL7KrQy/4J2Ige9ZhQ7SP86mYVg+Q5U/zVFbWZss/DvE5NrviuEOItoM3QnXcbfGzx+iTpXrKdWnzivbwGf26yV2mF1cB1zYeFYSUr5wdk5wFYypb7euTfDDDJmc9+hfo8ui2ZFelJVXQTIcNSE96t57gt30DhIujyzcjojpIbiNUdMrmD64mbl5InWqQ1YWkAhu98QA/mMeaeBfmzRmS7b6VyYe4tAOQyy4IYD73f5JJQa1y0P/pvlAQz4o/vCrVNDHUSRufhYAbiTBa7q08ylRcYFrjsZxUFfe58haoKQiFFAhzlB7b1VHo5uIQ+NNxYwLDHwd9WQCxDJ3OI5/qHO5om+tat2NXnoId9VLt/uv8lX5URhwZVDNuwtBV7KWdQ3sdMa4oO9BSxQKy6sxXVRXuEM7zmqh+nd9O36+BSwWF6jNvVWSSYn2Q71BiC9X6aMgzG7KyNiM++ZO69W/bQe3F72Yy7p+k70u3UJtTF7Um4r1SnlggO95snTxq6BCXbJKe+wPfmw0j9fIE9zN4yFddreImtG+x0BCNqhWXe34+1YUao0oP6Yo0hgXuZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(31686004)(8676002)(8936002)(2906002)(5660300002)(38100700002)(41300700001)(66946007)(66556008)(66476007)(4326008)(83380400001)(2616005)(36756003)(186003)(54906003)(110136005)(53546011)(26005)(6506007)(6512007)(478600001)(6486002)(966005)(316002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUN4elpFaGppUHpRbEE5ZTVqdFoxVUJ5M2g2aHlrMmZXQjNmYzNOcGFwcTBn?=
 =?utf-8?B?b0U4TlRoNFRnbDM1UE1OYjhKdDRCbnRMa0FoRC8vaEJ1OEh1TkJuc1lEaUJH?=
 =?utf-8?B?ejJWSGhoMkRYYzJaZ2tMdzNPM2wxNjZXQnMraUpMK0gycEpYZk9GTWhjTk0r?=
 =?utf-8?B?UFZscEtjRG1wbVRFZDg5cURqSUN4VktKclRNY2hDUHRhQ1J2MGxtdzFZUUtM?=
 =?utf-8?B?Sk5Udm00akUrRThYZVQ3R0NQM29RSmZVbUplb2N4NUQ5bXpxNTlnVGF2amN1?=
 =?utf-8?B?eXdsS1BNM3lQTDFZeG1nTWF4ajF2MGEzcUx3KzgrL05vODhDZjBlNnRLMXcw?=
 =?utf-8?B?RTBvNzFIVVc1dXFudWV4Z1FiREZsOXNkaVQ3d0NlTHlkTVg3bzFVRnpkWVov?=
 =?utf-8?B?S3BZVDRsbDZEU2tJeEd5alM0dHUwcXdHWElDZ2l4TnRldGRQOGMvTjZOK2tW?=
 =?utf-8?B?dTNWZFRuK2FMTUp5TjhudmpGQkxGNHNqemdjenFNam9JdnV6ak9Wbkp5WFcv?=
 =?utf-8?B?dWJobmJEMXRTcERHVHpMS1p6S0Uya1ZQcHFhVGI0S053ZlBKMzU1L3lRcEJ0?=
 =?utf-8?B?SlRUZjQ0cnFzcEhOZkZBcHAvZlFlQncyU1UwUXZteU9KQ1ErNWVpOEQ4UDhi?=
 =?utf-8?B?MEtrNFZvRnBjcU5FMEtURk1zVFRRTnlhM1lhZjhWWXRoK0QrUWwzK05DWmJS?=
 =?utf-8?B?Q0Rqa3N1K3UveGdQUUJyWjdrbEU0aXNwQmwxcytWZ3N0cXB3UTgxV3BKYVdH?=
 =?utf-8?B?cWE0ZDZtRmx6MjZiMmhmN05tMlo5REQ4ZDBJVk4yWFJoM3FVVHh0WDhEZHJI?=
 =?utf-8?B?WlhYNFJWR3I2VUdxQjhHeldFT0JvdFNrMitrd0JESktnUy9maTYrWW9xVDdq?=
 =?utf-8?B?bWl0ZDYxVGFDdFFBb1BKTkhhN1lCa2NWbnNDZUVXN3lsRGVTQkd0dzZFdkV3?=
 =?utf-8?B?TkszQTdseE5jWEZiK2VSL0ZrM3VEbUNnRDFnRFZJOEcrUFd6MVR1Q0JsZnJQ?=
 =?utf-8?B?ZWRLeUhwRTh3bFRYSlBXWTRuRUFYWVNIRVhPSU1JdUVZTEdmYzN3aXZBdSt0?=
 =?utf-8?B?WWpRVnlOOU5FV2NkWnFVeFVCNmNod2lvMUNPR2VOL0dRSjZ6dmRMSmhsU3RS?=
 =?utf-8?B?TWJSNklTOVJNZWI0UldYM2hvdGdja1dWL3pBd0M4UGhXbXNJMVg1QnQxb2h3?=
 =?utf-8?B?V0xpTi90MHJhQ2lSbEFCRVI1cUZjSjV4a1IreDVnWXdINm9oeFE5cHRwdzJa?=
 =?utf-8?B?aEJiOGlrMGZTOXhybFV6MGlrVVdRN3V3WjZKV090M1lUWTRGU2E1cFZPZlNS?=
 =?utf-8?B?V1FnV1k2SjVsZWZDK1BuWTRQNGJLRlJPYmtGbERuZUJJcythVmV2cDdXTFpp?=
 =?utf-8?B?ZzczcmVUVUtGU3NIOGR6U2R6OXJoNDcvSllwSkdOakFEYVNCNkUxLzdKMzF5?=
 =?utf-8?B?SGl2ak5YK1NxSzQzS1hFclc5MXhGTVBqQ1FnMlI4b3d4Y09CbVJFKzJkWUx6?=
 =?utf-8?B?cWZzeXFjNWNpYm1PdXAwMDgwTWc3QTFjZHUwY25sdE1ydi9mektQa2Rhd2N1?=
 =?utf-8?B?RkdkTFh3YjREL1IxaUNkY3A0ZkRWVU9zM2tEOHhRZ1VFUzRGWG83VkhHelg1?=
 =?utf-8?B?UVhFdXA1UTlEQ0FFTWthbzRwcnkyRE1Jb2tmRjRDTENScndyTzhlSVFIN2p6?=
 =?utf-8?B?WTYrQjRnU2VPZEFxeWZmNVBaRmRNV0Z2ZzR4VGVITnZEdG45QWRvRGRzR1p4?=
 =?utf-8?B?WHhEMG90RHFCZ1RnUWxzczhoenFiTzcrdlVPQmNJU043Yy82ejREa0pjK2tQ?=
 =?utf-8?B?ZzZBMnBUaW1CQWcyWi9lb2J0Q2FRc0dqM2NyMlcwMi9zeWY4cmFjNkhEbWh4?=
 =?utf-8?B?Y3NyZ0xtdndJVUUxTTNrbC9ROVFrbE12aEdITlNzNUI5RkVyR09tcUJQeTJr?=
 =?utf-8?B?VVJKNkh1d0lWVGVGcGVybmxyZUQ5Y3Y1RGEwVXZYazJCelFQZkxvRTkwZU9h?=
 =?utf-8?B?cVozTmRhdUFQa29SVVIzVkE2dEFVTTJVSlllWTJOVVBsYm9jWWxmUmVCVDcw?=
 =?utf-8?B?RWYzRXNGM05YZVpyaE9KVjY0SkJ0L2pSSHFqdjdCZ09POHAxNkNURnhrZHZl?=
 =?utf-8?Q?iFzeIxRrxkYRXZr+Qo/FFk5oP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a9ffe7-214b-44ab-eacb-08db6e36657b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:53:31.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go0KFGjAPd4mxkofHzpIooWN0oV+xoDW8Yn/krL9Pqqyuq5snwsiU4a0aT9/55xcI2vJfTdOBEpPKv4ApLzFMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8840

On 16.06.2023 01:26, Stefano Stabellini wrote:
> On Thu, 15 Jun 2023, Roberto Bagnara wrote:
> I have a few comments below, mostly to clarify the description of some
> of the less documented GCC extensions, for the purpose of having all
> community members be able to understand what they can and cannot use.

What do you mean by "can and cannot use"? Is this document intended to
forbid the use of any extensions we may not currently use, or we use
but which aren't enumerated here?

One of the reasons that kept me from replying to this submission is
that the full purpose of this new doc isn't stated in the description.
Which in turn leaves open whether certain items actually need to be
here (see e.g. the libc related remark below). Another is that it's
hard to tell how to convince oneself of this being an exhaustive
enumeration. One extension we use extensively yet iirc is missing here
is omission of the middle operand of the ternary operator.

>> --- /dev/null
>> +++ b/docs/misra/C-language-toolchain.rst
>> @@ -0,0 +1,465 @@
>> +=============================================
>> +C Dialect and Translation Assumptions for Xen
>> +=============================================
>> +
>> +This document specifies the C language dialect used by Xen and
>> +the assumptions Xen makes on the translation toolchain.
>> +It covers, in particular:
>> +
>> +1. the used language extensions;
>> +2. the translation limits that the translation toolchains must be able
>> +   to accommodate;
>> +3. the implementation-defined behaviors upon which Xen may depend.
>> +
>> +All points are of course relevant for portability.  In addition,
>> +programming in C is impossible without a detailed knowledge of the
>> +implementation-defined behaviors.  For this reason, it is recommended
>> +that Xen developers have familiarity with this document and the
>> +documentation referenced therein.
>> +
>> +This document needs maintenance and adaptation in the following
>> +circumstances:
>> +
>> +- whenever the compiler is changed or updated;
>> +- whenever the use of a certain language extension is added or removed;
>> +- whenever code modifications cause exceeding the stated translation limits.
>> +
>> +
>> +Applicable C Language Standard
>> +______________________________
>> +
>> +Xen is written in C99 with extensions.  The relevant ISO standard is
>> +
>> +    *ISO/IEC 9899:1999/Cor 3:2007*: Programming Languages - C,
>> +    Technical Corrigendum 3.
>> +    ISO/IEC, Geneva, Switzerland, 2007.
>> +
>> +
>> +Reference Documentation
>> +_______________________
>> +
>> +The following documents are referred to in the sequel:
>> +
>> +GCC_MANUAL:
>> +  https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gcc.pdf
>> +CPP_MANUAL:
>> +  https://gcc.gnu.org/onlinedocs/gcc-12.1.0/cpp.pdf

Why 12.1 when meanwhile there's 12.3 and 13.1?

>> +ARM64_ABI_MANUAL:
>> +  https://github.com/ARM-software/abi-aa/blob/60a8eb8c55e999d74dac5e368fc9d7e36e38dda4/aapcs64/aapcs64.rst
>> +X86_64_ABI_MANUAL:
>> +  https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build
>> +ARM64_LIBC_MANUAL:
>> +  https://www.gnu.org/software/libc/manual/pdf/libc.pdf
>> +X86_64_LIBC_MANUAL:
>> +  https://www.gnu.org/software/libc/manual/pdf/libc.pdf

How is libc relevant to the hypervisor?

>> +   * - Empty declaration
>> +     - ARM64, X86_64
>> +     - Non-documented GCC extension.
> 
> For the non-documented GCC extensions, would it be possible to add a
> very brief example or a couple of words in the "References" sections?
> Otherwise I think people might not understand what we are talking about.
> 
> For instance in this case I would say:
> 
> An empty declaration is a semicolon with nothing before it.
> Non-documented GCC extension.

Which then could be confused with empty statements. I think in a document
like this language needs to be very precise, to avoid ambiguities and
confusion as much as possible. (Iirc from going over this doc yesterday
this applies elsewhere as well.)

>> +   * - Ill-formed source detected by the parser
> 
> As we are documenting compiler extensions that we are using, I am a bit
> confused by the name of this category of compiler extensions, and the
> reason why they are bundled together. After all, they are all separate
> compiler extensions? Should each of them have their own row?

+1

>> +
>> +   * - Unspecified escape sequence is encountered in a character constant or a string literal token
>> +     - X86_64
>> +     - \\m:
>> +          non-documented GCC extension.
> 
> Are you saying that we are using \m and \m is not allowed by the C
> standard?

This exists in the __ASSEMBLY__ part of a header, and I had previously
commented on Roberto's diagnosis (possibly derived from Eclair's) here.
As per that I don't think the item should be here, but I'm of course
open to be shown that my understanding of translation phases is wrong.

>> +   * - Non-standard type
> 
> Should we call it "128-bit Integers" ?

Or better more generally "Extended integer types" (or something along
these lines, i.e. as these are called in the spec)?

Jan

