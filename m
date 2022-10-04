Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C25F470C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 17:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415667.660293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkJt-00030G-3Z; Tue, 04 Oct 2022 15:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415667.660293; Tue, 04 Oct 2022 15:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkJt-0002wn-04; Tue, 04 Oct 2022 15:58:57 +0000
Received: by outflank-mailman (input) for mailman id 415667;
 Tue, 04 Oct 2022 15:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofkJs-0002wh-16
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 15:58:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72a243a3-43fd-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 17:58:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8445.eurprd04.prod.outlook.com (2603:10a6:10:2cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Tue, 4 Oct
 2022 15:58:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 15:58:52 +0000
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
X-Inumbo-ID: 72a243a3-43fd-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpTt5voV+nALZm0Exe8CT+CzAQFaQf4sxrCuQBoccQD+qK/VKJ87eqLaUPmQ9cnXQZn1nx31gC99TWcRCeX+8Mo7Saobo6dONc8+dIRGJo/sF1lithCdpguNWxi8W515kvhe9JsRztHyv3CITwtz4uEixdsqz6UUEret+7CxoE+RVCmTwWdviBuX4L8EW0KcD30SbdcjkqtU5n4e6BTW0d0Lpr5h2RpeV352Y7Z0z8squlUhyrExKUrqaos0MTDoSpCbIGxP0PdxgBJALqE/FBP7Trsi+2s9X1D+v3yPbeTILZF0L0Xe/hlvLXHxMRFOpyDBXJMXiAYAwA4nsaYh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/hKQCZfc6IPdqQX0GfU4K8iCst/ETj/mfZO+u4QQkI=;
 b=gRUGyBZDDPYbL4QIz7ZTPhjhMv9NentxgAN3TOtSBL1vSFBKQb0tr9QpU+gUdoFoOg0M/Jiazjv/NSET/S9vg9wTIV9ZFAM6oNUxtV/THBa46LmUCtqn/U9s93uUOq7z3+zc7lFJFl4hE4wyv5oTqIXdZFnA57xEjVxQszfedGkrwKjEPhB+Xfsf+YvaunjaITV7SegKrksSFpadp4mRKBIhkCLV35oliOy2+b2V0UjLVxey69WZ8TDhPyi8dE512DgkgOKqP4Whl5UXrbZdJAqICFBPhuNoi8jpHHaB5MJ4Gkrv9gbwO0BfA+o2r0M+4MP7O7hBgP/zJem3I7syvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/hKQCZfc6IPdqQX0GfU4K8iCst/ETj/mfZO+u4QQkI=;
 b=F6dRbW3kE9lQa9Hns486JO/6LwB6VshSNKbxTmgkiH7M0Kf4ciYOy/Cuw0sy52fHlYxV5OM1VQvJe4eFa2jADUQ//2MvwvZddQ9Bf5nWiqyF4OyEMTFcCU6GH7d4htcoRX33xOXwv6yHx+9IWIsog7a0LCgDR3FjO4fYLMaZ9D3voO+QCjcZhhn5rcuGyRua08GTZJcM0EssHzepZ43MSACIIy5GHLyUsza7D+J9l6peeo7zInLH4OPFde+INjw4p1RwwOPT0s9BkrJWnmIu+PC3Uimiss0yWzVeymT6LyedA1bM3WnKwuaWpzI9Bsq2MBwRzrn7/XOdc4VB6bLhtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
Date: Tue, 4 Oct 2022 17:58:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab91742-78ba-4d6b-3964-08daa621557f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UFqOfDudodZfTaMTb2gXNgAD80hgV9Sjf9xUv7cX4vROe1DLJqNJANvrGAicDmLcQxNcyfuQUOgadPv5neCvNSuX/egodFouiANyBQALqVhvP3hhvVJoqyxTCZ3M7b97QZumtPKrY8CV4/vGdzqLKWZVpsaxLoA7oACAA1d2Q39X/NCHdWdCYaLRZ5qTJveRAdGPCBdsHF90O9rI+rLQmZstUgRh2Csf4V3+I1yvrPXnMYrTGwOqxgcVyFPwQdYtVJT0XUQI218Gj3G9J6vEUIEYVZ4tDgo0WTRFvUJ5Y0ZciYUwBCoEAmqOGXu7sXcgv8KEHCQ8yYOeSOO7SumI+ijTHAJXm+QZd6ahUC6tDlndR4I4O+lBjrz/Lrb4nsX+wATB7v9AlPj6/K3sqsR/C9xIR2T+sQ+PV39h/7OvC+yRJSSv5PQklqmfp5XbzxWIa5OHsuVcm9AUyJ+7zJs86qGYbrND1JlUt/YSM1qYKuIju4h/PgFH5vnB5XeVBM+0Ny5z6e04MR/5vdInRAsvP4JXExw1lqjz7/DPQyKJgJtP55zLttlmG8HH7QRmRE1BNAqwNgkQ9gbkg9f0ZKX0D8DcJ0eFtCwa1AqQj8IVyMDz5L7+FXcTOvk0RDjwjcJE+2s2l61fqSEarBp6pbD5ovM4O0AuARfD/0KrthHHjdvLiFscphky91TTDTJ+AdTY9C7YorFbJmn1au6B+oyAQXq58jEteE3JN6l3sz7lXKGCkGJ1fNAyVEJO9csVGcZwG3wTw+XYRLo5DJAp9yiT6vkvWy90yBj3++faL26P4ZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(31686004)(26005)(36756003)(8676002)(41300700001)(5660300002)(4326008)(6506007)(86362001)(31696002)(38100700002)(2906002)(2616005)(186003)(83380400001)(8936002)(478600001)(66476007)(6486002)(6512007)(110136005)(53546011)(316002)(54906003)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVNVUTE0MnFUb1BlQkNjT1kxaVRqSkZsRzlQeDFRbHJDeVZadVNKTGdPWWxy?=
 =?utf-8?B?dHhlZzJ0b1NhWUhXS1lKUk9BNGVSbEV3dmM4UXkxbnVCNVFCS1VvYXJGS1Bk?=
 =?utf-8?B?UVFVY1V6aDU2RWk2UkE5dUpxZytmUUd2bTZlVldWdlB2aDhkbEFpMHRxZ0VZ?=
 =?utf-8?B?OFhKU2JUelNvUGdDd0VLZWtJbmNxcnVkejNybVZLSUNWWkE1eDNkNEl0Nm5p?=
 =?utf-8?B?R0N2cmUrQVpvMmFMWlZtVmxIWGU1YUtQY1pHV3N2WFA2YWt2TGlhSHFza0Rv?=
 =?utf-8?B?VVNQS25TWk1BWFJpbUwrazVUU054ZER5c1NVZmR0VWhtWGZsbkhRTWd5L0pD?=
 =?utf-8?B?TFZ0aW9PSk9ydFk3QkRya2xtWTducjAzdm5mRVFUck9ZVFlLTjdtaGc4c1Y5?=
 =?utf-8?B?MVVCYnR0THZGMjNIZTIrTC9kNnJPb01DQS8vSG1BM3ZZcm1SeDBSRXRRcm1l?=
 =?utf-8?B?ZXZSQkJpalR1djU1a3JmeGVvUzRDVHNJRkVhbU5qTWNNckF0VXFvbWtmVjg2?=
 =?utf-8?B?cXpFVi9rWlNvVXlkRWFjdGdPYUhDYlZ2eisrdUxMNjQyblNOeC9COUJNWWxI?=
 =?utf-8?B?UVdEb3lSdDdJbUpvWUR1TC9RWkJFbCtCalJWREZIeGxOT2FPRnVETFJUR1Uz?=
 =?utf-8?B?RnZFcENoMVY2ZzJjTm5LZDdqZXhWT25Rc3JlUWRUbEkrUHUveDUyTHRqNUNk?=
 =?utf-8?B?ek5PUjIvbks4MjZmR2tnNE1NSlE0Z2lYQllQMjVqNHhHcXJnWkVFOHhVbnNG?=
 =?utf-8?B?VXZ3Nk9rM1RsVmZqVkhoMlhQejhLamlFSG1QR251b0g4cFBFUHlqWnF6aytp?=
 =?utf-8?B?SzZxZEF2ZFRsVUZxRVZERkZBNDQ2K25MREdMbnNDV0dHUUhNSDBoL0tpS2ln?=
 =?utf-8?B?bnFtOU43SkdXRkh0Z2E1TytubXZMY2I4a21LSGFlajI2bm9HdTU0eS91NGpw?=
 =?utf-8?B?cGhhbmF4blQ3bnFjdmVyTWZuTEt0eSt0RnpmZWNGYzRNUFUzaGJ6WG10aVBB?=
 =?utf-8?B?NmhWbWJJUG1EaVU1MWMxL1kyUStEVjA2a1pQVjFIMnh3ak1zRGZ2SkZiV0NJ?=
 =?utf-8?B?a1FOOW1RcGl5OStWODd2MWEwM0NtUG9kcnJnWlpDcGI4ejFtbVdKakZPNk9W?=
 =?utf-8?B?VjBBbHRPOTFTQ2JNRnN1TVNPMW1jUGdhV2RDTnVCaThsVGc0NklFV1lWMWVk?=
 =?utf-8?B?MGlpZUpneVMrNU5EVDJ2TEdTc0ZtdWVmaks2UWlPYXFaL3gydlZKbjVXcDI3?=
 =?utf-8?B?cWJlSUt1UkpMOHZ4WG5FcnN5MEx0WGd2Z2lVK1JZM25UbHk4YkdpbU1WdW9k?=
 =?utf-8?B?VDNSNVAvRWRlZlJ1K0dhNG5KZUljdkNsNXNNSWk5U1ZNUTlsOXBlV0UrTVNQ?=
 =?utf-8?B?QjI5c200TTlSYk1DUUlGRFZOQkhIWUFBb2F6aTIyeUxmUFljOXV5cUdWWHI2?=
 =?utf-8?B?VVo0d3BEQUFHOXc1cERsVjUwTUhmM0N1cTdFODdwL01YTy9FTE13aEYycEVD?=
 =?utf-8?B?VXkxMkZPcm03Sk1JU01jLzg5L3Uwb3UyNVhlK0lHQkhiZk1hZ00yOHBaZjRm?=
 =?utf-8?B?ZWhkTWpaa3ZsYVh2RFU0UkNqWU84NjN6d1NQamxtS2RhZGt3NnRtc2NBOFpH?=
 =?utf-8?B?UnlFRys0WHVHQlV3TTRZWXJVb2MzRUl5STh0eTREVSt6ZGdtY3A5QjRhZi84?=
 =?utf-8?B?MHB2Nm1qUUVqMFJsMUpOQmRDT0NpSmcvOGkrTFZ0N0dSdlU3MStWdGVZbWV6?=
 =?utf-8?B?NjJNLzMxZGhiRWFlVlVGM0VQcE83bk9MN3cxcnBXL3pRT2NnNVdDYVJCNy9o?=
 =?utf-8?B?OWtRMEpPd2hzTW5adklvTUZSUUZvWFFnYVNWcFJyN3IvaXo0WGpJRnZWK2dy?=
 =?utf-8?B?b3Y3NUlldTZqbFBjdXpaNWZ5QzRsVU96VjJNcW1MNE1oc0o2MUN2N0lqL2pT?=
 =?utf-8?B?VEFvOW41aEJ2MWpuK3BBUzdjRFFFd1dKVy80a0NRYkR2NjhDL1l6bG5BS3dj?=
 =?utf-8?B?SnhjdDJBTk1hOUd5T1FBRzYxS2x0eWsweU5ncFp6ZTdBZWhmL2JIem81aFZ3?=
 =?utf-8?B?bmdzZzV4SXg4MXFCWGtwWGlKcWdjeGhFL0FnU2RBWGROeFRkcUhZdlhGQm8z?=
 =?utf-8?Q?h70Dfot/TVwxZu7OSfbW+sECR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab91742-78ba-4d6b-3964-08daa621557f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 15:58:52.6129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRCq+kD7v22RMQY2hNHOyj92TOyrqidMuR61Zc5s2ahRZZVGFAEJX21qEkasoV8qZK91kxat25HLhe+XSPxROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8445

On 30.09.2022 14:51, Bertrand Marquis wrote:
>> On 30 Sep 2022, at 09:50, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>> higher priority than the type of the range. To avoid accessing memory at
>> runtime which was re-used for other purposes, make
>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>> E820_ACPI memory there and hence that type's handling can be left alone.
>>
>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm

Thanks. However ...

>> ---
>> Partly RFC for Arm, for two reasons:
>>
>> On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
>> For one like on x86 such ranges would likely better be retained, as Dom0
>> may (will?) have a need to look at tables placed there. Plus converting
>> such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
>> me as well. I'd be inclined to make the latter adjustment right here
>> (while the other change probably would better be separate, if there
>> aren't actually reasons for the present behavior).

... any views on this WB aspect at least (also Stefano or Julien)? Would be
good to know before I send v2.

Jan

