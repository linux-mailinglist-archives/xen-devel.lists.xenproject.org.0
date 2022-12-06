Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8E644251
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454754.712296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WMB-0006Ai-C0; Tue, 06 Dec 2022 11:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454754.712296; Tue, 06 Dec 2022 11:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WMB-00068T-92; Tue, 06 Dec 2022 11:43:27 +0000
Received: by outflank-mailman (input) for mailman id 454754;
 Tue, 06 Dec 2022 11:43:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2WMA-00068N-GI
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:43:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3181bacf-755b-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:43:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7109.eurprd04.prod.outlook.com (2603:10a6:20b:117::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 11:43:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:43:24 +0000
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
X-Inumbo-ID: 3181bacf-755b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPLBREYmmENATGioee0gmXtLZGlu9OS1pAnu+EJ4uhKUBneiIQiDO3JAkDh8DJrQbAdpawkkPwG6v13HPy7b7W/bi3cCEq8T4SDzKCSUuHKSlszqlsLm9Tk9+Xoj7m0P0jpgw+Dqb7t7ISKwfs84xzoPaA2HxRh0lBZMJH/I7WneVUtu5Y0ImC23mupcWevLcdAtdFP6HeJm0FdGM6L6enNI4o+47z6YkKdYyoNsXuEcRUrF7CRpE6Bp3lkCCWegItM/Qf+gYs4ZAJz+jO8M9tjFQto9V92CWdkrXMIKvBxe7+V11li6ejjoL503puUw69M7H6cmVMMdrkFjrQxZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe7AtQLNKWCZhEndLa+dlDjAQaD97SDOwq53gWxLKlE=;
 b=Z3Kae0vtpkoMkJe46ZKl/Ctq7n181Aj5sQ2V3uRl+ElQks7pVyVeQRc1XYUOIPCCkm/9h32Vq1lpZT9vmq4dcvXuQ5nL1v0aKQOaZxUFI0pmJ7aY4lIOJ5kwb5zCEDWZIWnOo7ueN10ZMyS2n/7ZpYj2zvW1Ly7LdkxWqhmJm95pKxKtytoyWvzn/okA9fXhUs03Tck6rv6I12uACNxgniNn+TX+YuKF4Ahb0c6AlomCDRgr2bea2GFpnLsm60zvARIO6tVycZNUadgTGSFb/tGSjy4ll5Y8JWvcYK6wDFYdA30kATeR1jgonBvzeJSRzZByu1+39SKqaH4rLpKX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe7AtQLNKWCZhEndLa+dlDjAQaD97SDOwq53gWxLKlE=;
 b=w718GAaxPmMmXi3xQjtkpc0c/NiezurSdF6lcbBFh48jx9ShmGkjyp8+hhdHQgPFHOkj6IwxhV9tO2BIDwhbXGDO2tplYjgAbT4/UmDzDvr1irN2d/O6hNT4Y/AuV4EvPmFTKP2GHrYHbtKCoFVrZP6RGkYJsgTJGS0SfHVa2v5gJf7b6TaZlbq4EP0f1sDzM/QjiWkJ4O7TYQD8xscGd2nI0VLej1R2Ryn3XXhRRTEQbBilkS3LrkKQq+gBINvo+vXa1jPfbo8/1MWouneqWw7gV3MryMxBwFe1a2+iRD4NgbyI+5nZyFcHAzT5qT1Y14tXsz76e+jAhgbQPXNXGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7213b37b-63a0-2d45-7f7b-bfb6fcce0f46@suse.com>
Date: Tue, 6 Dec 2022 12:43:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
 <ac0605b2-5c1c-09f2-9526-1aa7e777e7dc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ac0605b2-5c1c-09f2-9526-1aa7e777e7dc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: ace430fc-a001-4a9c-157c-08dad77f14f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rn/Ip41W6x7MF1F8G7Ny0PBsWjNNGDctIyefpi7LE+GHvANWStQFKdzjPWqeh8JDXZ2BHgCinkHlyE1nYB1E6KrYc5Df6rWWT7D2/kiHXukp1pgsiRowXt5amrwlDeLvd5sAnKhFjz68NXFFCO8JxoviSfJwf5cTSna26phwzV1Hr/s/2rDU7iuJK8IM/KppNACuMOPKbOEdIU0YivpYGIXJUsNsEuHm8sksBmGvepAaE8wpVMyyVSRN0Zr2FPAimmeyZOp+MgQuGHTYOel7hZDCVaP5FwMpEI02HS2lq+gQ7YZuUlD9hLEovVFAuqMFXnq1Ed2LqomHzf+OpwLuG0EV+u7oAYJ182iaLDsP2psG/MFSi+TBTkuIN6UKNhVzdFpuiODGDu2kUVsXgUKDGwO8Fn7qFzNx7QJJG9v2V2/bgh6meIeinFPF2vc1ntTvEFQUPm7CxV8XZvY/Y+4ULED4dZqCGrt+acDImIcbSuLi8s54HwvZcziBGheaGMNOVzNRh+QpeVTNNoaFDUzVu8MY0FZFKeN+4CjqUFO8d4TIGSBMCs8iEDItznDHsgcVPt9pEXlzgfAG3U+jHnlcNN6qHDby8n9Igu7yn2mu61szP6uNqb1N7BT5cNRA1/Twz8Uf5Mt+6WtZ1LvjUhmPt8Cz0useQ6NSbZKHbkJ6u4/wz/OPQoHuuiMZj0SJVsxugG0u3q0WMNMklczU3QlEagLfCGbxmJ4jP9h6z3DO1vE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(86362001)(31696002)(6486002)(53546011)(478600001)(6506007)(36756003)(6512007)(26005)(5660300002)(41300700001)(8936002)(54906003)(2906002)(6916009)(66556008)(66476007)(66946007)(8676002)(316002)(4326008)(186003)(38100700002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVBvc0pFMkxkcTNsbmluNkkyZEk4OHVyYVlzU0JsbDBOVGtBcm1zaUxsSjdM?=
 =?utf-8?B?RFgxVXplUXF0bXNyMllqYWMyUTh0b2w2V0lFSzY4OEpaQ1FpYkFkN2lUMXRS?=
 =?utf-8?B?N1A0UEtBNmpNaFFxanJLQytPT21naVBVamxrS21FamJKMWRYRzcyRnZuMlE4?=
 =?utf-8?B?MFhUUzJZM3U3RUZybVY2S1VtUXdKUTQxYzVxZ2EyQkpDVDZML3NqU0xQNFp4?=
 =?utf-8?B?TGxvTy92d2lwcE5ZKzgxbkdOWlp2TUl3b0orMXdOdHkrdkU5d1hrNmJ5SWV6?=
 =?utf-8?B?NEp5VFNIZmFtcGV6YXRPV3djeU54QmE0ZUxPNzdnR0o0WTBWM2pJRGk0Q2wv?=
 =?utf-8?B?OVFJS2Z2ZjR6RWhxYUNBZ2pCRTNoenMyS05kMEZLOHd6NXFGUGkrZk1JVHgz?=
 =?utf-8?B?Q2NzbW0xYnNBYlNKd1NuaGJUZGdqRWNMcWRLUnpjWTlERkY1dWhRb0NtbHJn?=
 =?utf-8?B?V0ZGcUgycGprRkRjbjc3bm1VckdBU2JXMW5DK3F2a2Z3WVZHRUdnMUtzVERK?=
 =?utf-8?B?SnRMa3NaREdmRGZXTnplWDhLWHNlNDFwQnJmU3doOG1HUlBDZk01SnVwYURk?=
 =?utf-8?B?ZXNwNk1pZzl3Zks1UnVIUCthM0FKZmF0S1h6THBXbkFHajJrR25JaU1STFFX?=
 =?utf-8?B?YStlUWlWY1VsS2NVcVMraE5oeEtWMTV5WWcrMUdVempGb3g4QjB5NnY5Z21i?=
 =?utf-8?B?RlVyN1BNcG52WnZ3Z1N5VEJ3R1NXS3lJY0pFdDVoWjhsTDRGeWZLZTd6QWxV?=
 =?utf-8?B?ME5odnE3THdCRWh6dkhZYThVWERtN21Bd2xtbm1NWmdpUlVQbGhDV2FPbG03?=
 =?utf-8?B?NVd4SktNaXVHK1ZDSE40N2tHUW5qZ3ZlOWpaaFFOSGdOU0VmeGxDMkE3QS8w?=
 =?utf-8?B?Z1NJTEFwcWdaWksvb3lQYW1LNmU2c01TZE5Pa3hrM3ZMOHVFcHl4K1h5Z3Ja?=
 =?utf-8?B?cGZ3SjlHK1B0azlWck5GOENCRW0zYVd4R2tKMVhleTE5QUZjWFJiTTlNQ0V0?=
 =?utf-8?B?Y1JpUUN1RFFCdUNKUU1XTjgzNndUWFpUOVd0M0ovbWlKSkNWWjlKQS9DeGM3?=
 =?utf-8?B?UEJucDJ6RmkwbEpZNUd2TFpxbFhJMWcxTVljTEFFQVc5WlZocFFRWVRVTnAr?=
 =?utf-8?B?TmtRTFNVWlJpTDBYMzVQVWFZYlVqL1M2UnpZUlFieldmYWpzdStSd1dJSEh2?=
 =?utf-8?B?STFsWUhublorNm9iV2VBZUlTQ1hQVXFKd09VYkFhanc0NmJKaEVKZVR2VnBj?=
 =?utf-8?B?dWlXcGhPVFpFaitBS0wzUWc4UHVhL2p4TGxJNXVrNXducldzUFVNRzM1c3Yx?=
 =?utf-8?B?UUloMDhhVlI1dzF4Z1J6NkJPa3VnNFhzN2JCVkhZRlpONmdZNzhZd2VVNmdq?=
 =?utf-8?B?MTBXNDNZcFV6ejZPWXhKTm40ai8wc3dXSTJtVGZRR0svbnl4VjRrbzNlY0tx?=
 =?utf-8?B?RVRTQ2hqU01rcTNvd1VSR2VDL05zVkRqenQ0aFAyREdnTDhjT2RwZUFrWmRM?=
 =?utf-8?B?QzZWQ0J1aFhrVUxUM0FmZDE0b2tJUzJBajlkY0pGZFlYZWVESW90WmU3bGQv?=
 =?utf-8?B?aHJPd1JiRWJGQnZpanV6dzVJbG4xdGhBUExXWHY4T0k1NmdTdndleTJmb3hj?=
 =?utf-8?B?UkZlNWpoaElMN1hXcXVKL2tZR0F6eWJudmhMbEQwSHY4OUdFNmpuWUJldlJv?=
 =?utf-8?B?TTIycjBLNFBqa0I2QnFaNzFXTnF3dnJndFcwYWRKK2x2OXJRdlo4WFZlTHBh?=
 =?utf-8?B?MkYzMXhERUExdTZPMlBrM0lwcHluWGZJR2ZsVFdHSjNBeitzVWZsRnNBWDNn?=
 =?utf-8?B?U21yenB0OTJxYXMxTXBZVi9WdHBYQUN4dzh3MDlwYzFYQkYwdDVralJkdkJx?=
 =?utf-8?B?bVh1Y3R3YkN6Z2pFVjdoeHJvQnNISkZvMko3S3phRmIwRERIdDRaY1BYU05n?=
 =?utf-8?B?N3FSM2FNTXZGV2NjSVFKd2N3UGpML080RllYSmVCb2x4UmJZbm0wTkU4Wmpv?=
 =?utf-8?B?cTE5Q0VoN1ZhMmtnWXlHd3g1UjZucHZzZzBpcDk3cFgySWs5R0RIKzFua0p1?=
 =?utf-8?B?UkRkS3lzQ3lEbzBMdW1vcGZDV3R1dDFjTENrcFh3SDFkRHBURkw2c21RK05X?=
 =?utf-8?Q?EkY9t9I897EkL61+WKnuWG/qY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace430fc-a001-4a9c-157c-08dad77f14f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:43:23.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvNFOhjpJ+/3Ss0TQR0vl7Kjz5r3Wo4e39ABAmt+Bzu6dEkTJn1V7Aq3L/SzLP1HaRtGGSJza3OzRBNWYoKyoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7109

On 06.12.2022 12:32, Andrew Cooper wrote:
> On 06/12/2022 04:33, Demi Marie Obenour wrote:
>> --- a/xen/arch/x86/include/asm/processor.h
>> +++ b/xen/arch/x86/include/asm/processor.h
>> @@ -92,13 +92,33 @@
>>                            X86_EFLAGS_NT|X86_EFLAGS_DF|X86_EFLAGS_IF|    \
>>                            X86_EFLAGS_TF)
>>  
>> +/* Individual entries in IA32_CR_PAT */
>> +#define MSR_PAT_UC  _AC(0x00, ULL)
>> +#define MSR_PAT_WC  _AC(0x01, ULL)
>> +#define MSR_PAT_RESERVED_1  _AC(0x02, ULL)
>> +#define MSR_PAT_RESERVED_2  _AC(0x03, ULL)
>> +#define MSR_PAT_WT  _AC(0x04, ULL)
>> +#define MSR_PAT_WP  _AC(0x05, ULL)
>> +#define MSR_PAT_WB  _AC(0x06, ULL)
>> +#define MSR_PAT_UCM _AC(0x07, ULL)
> 
> This isn't really correct.  Constants for MSRs typically live in
> msr-index.h, but these are architectural x86 memory types.
> 
> These ought be
> 
> #define X86_MT_$X ...  (skipping the two reserved values)
> 
> in x86-defns.h, and the PAT_TYPE_*, MTRR_TYPE_* and EPT_EMT_* constants
> want removing.
> 
> There are two minor restrictions (EPT can't have UCM, MTRR can't have
> WC), but they are all operating in terms of architectural memory type
> values, and the code ought to reflect this.

The unavailability of UCM is common to MTRR and EPT's EMT. WC, at the
same time, is a valid type to use in both. Which makes sense - EMT
after all merely is replacing what otherwise is expressed by MTRRs.

Jan

