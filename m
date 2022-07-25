Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0633057FB6A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 10:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374458.606520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFtUv-0005IQ-50; Mon, 25 Jul 2022 08:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374458.606520; Mon, 25 Jul 2022 08:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFtUu-0005Fy-W1; Mon, 25 Jul 2022 08:31:28 +0000
Received: by outflank-mailman (input) for mailman id 374458;
 Mon, 25 Jul 2022 08:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFtUs-0005Fs-RW
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 08:31:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb328e3-0bf4-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 10:31:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 08:31:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 08:31:21 +0000
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
X-Inumbo-ID: 2bb328e3-0bf4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYT2IEoQd8425oRLuFV3OYDUXG5Bs0zG68a8MGIPLTV+yXh+WcVlZrx915v8WxPONuzLF3uXDPVRMrWv3O0kx7VqTPqZyGQm1GRyHTn+sqH5VGPCjFUhHZAqDAWzdJWf5cZpK7fmlQGKztctw375Tgk9IM5M2LJnbhQ9wPrlVup1vCMLhHMfHECSKTdBibf5cs34vdvO4MXssu3ErtvZmEOAeJM99uHaQLh8W4X+kKESD4bLCIBT6bJUPoQiwqfXLnVwqOl8d1yeivZEFk9pChZ+BjkfV0vOkhZH22A+YKKvn/tNdItLVNnnzt9lyUwY1bsLafl2E+eOsb8kBurXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIKnc8hrWldqcpl27vlFISaBuD349hjOuyHFj0Bg/RQ=;
 b=OXjL9w2kTj643+E1qr2pzzoNXE+0hdd0EHZZAQSD36knPfu22GPrFWU+6KFlPuKtXZpViVCj9OnncZrp6YRagg5Li7lTT21PpSqnV9wPDnv9DEbeMWP2tQMIXd+Jor5QQyYbOgx6DRFm3RmJiNTNZcwHBOzUyzFW/yJTdEBe3J3jkHd8IUD/G9PwjG7fVSnaZsAUhU9u3cRbMZFcyeEbDCyZ8UJgNHoAf15NGmGrbfvAt0G+kvRGXjgCtFko+itwtObUqiDPCSHEeo/OrpNAA6KPVuwjcP+mLurYepw1mC6oUsNWQhR448XWU+sUG2uZMLf5gzkHfMPdWBwQVt/ZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIKnc8hrWldqcpl27vlFISaBuD349hjOuyHFj0Bg/RQ=;
 b=P1tiz+7VfcgWGzjp8ObXJeM5/fngOCVC5DBXycyZMMu0KVGjtYqEJijBFYb8MumZHzuqmlP+VTRF+QX8YbtRTViMpNWtgUDKp9T+b65ry6Xtkkhff9S4Ce7hrg/63l+xZLTsLe8BWQWXDf0eBiQ9gOS5LpSCZH+qJPnSPVyxvHVAtMgp0hWUeckORl4pbsEjYuRxAuKcbCA/gGfivw8pghy8qM1ubkx7xWUOyNjEEDSL3PHWzfqtkzrZy1v5H5YNYNNifwoSGB9hbr+/+zR/prb1aVKQDPb4yOZ2JuE86/VK4G8YwVazb7it+9HRu6MpeMEgdNEoj4bZ5F7LiIZMSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f18499e-57f7-ed8d-f3fb-9a0ea9d8ac05@suse.com>
Date: Mon, 25 Jul 2022 10:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/hypfs: check the return value of snprintf to avoid
 leaking stack accidently
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220724173159.410535-1-burzalodowa@gmail.com>
 <69b5906f-163b-b7cd-81ed-98be8e45bdf2@suse.com>
 <1d64331b-5258-6c91-82a7-54fc7f2600ab@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d64331b-5258-6c91-82a7-54fc7f2600ab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1280982f-f217-4290-7b11-08da6e180de9
X-MS-TrafficTypeDiagnostic: DU2PR04MB8967:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zUt1VKLR5zvXrBAzY4Nu0GB3P+/GIKvKgLSZ6H92jOPhHQQzQYKSOpMxu32pstWA5GrY3Mu/pVWd7oDaTQr3roPXH5XM1CLIUvoasBjPFfrVYnAmKObVz+c8/PBlr5+jRdsEtqU2tJgYWFrnlN28KIHDf4MtjPGqL9jeG8iRhpT8eUm16Ty6scX5J8LzkS5r0sqRDSDq+BstTBYu1IEJYdi3D6OFEIYelbQrmost0b+/NUSLI8GousSZ4MTvNaHFHZjOq85O0Pkblsw1Vv3SILExiSjXxF0HzSJcZpfNPI2ZwpeS8C9j1Oezno/OFpRGow3gV+6k0EY+b6+Cl9pZkF/WwDZwY38MD+g2mAQeFml17ESgr//kLeAc8mC4MJg05XeGzs8GhRRtLWhDnpVUFX4QSKyDvmlc7oEa8b4KQhGyFl9VlDTPhuLf5iSVCdpwvIBhQxyBR6EqY5loJuMlO+E42ueDXDv/7iRMT55CDNI1tEkCwujAeJFNSZD0IaLf0OHMthwA49eh7+4r8ba9OrDy6OzOhr4IxkvTE5K9WQf/fWwuNHxCdxQ6r48dXVdwTtqRHlbSlwXwfzB+4YQD46EiNEH/9sCRBhdHzrW3k9eqZN9tnqec0yPc2ZqBmFgqkDCB5stu0XD4+33Ufd7Nzno81f/89iPSRdpUEX+HSwB7v+Ef3HRfUHJEQmaU1/5aa6vzYnvjE8u5Q3jERkSRDewbAV5/DvyLJXJsvLt2nhmQl42qycQ3L3A5aYqAsZPoLMYOEL6FlJ3DtMU2die7lmmjvRyWKr/2w0TqRuEXoK7lOL/FIl57DFaUDFbOTZdXA2QAohyQxlyQjFvbTUCm6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(376002)(346002)(396003)(38100700002)(316002)(6916009)(36756003)(31686004)(186003)(2616005)(478600001)(8936002)(5660300002)(6486002)(26005)(83380400001)(66556008)(41300700001)(4326008)(2906002)(66946007)(66476007)(53546011)(8676002)(6506007)(31696002)(86362001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0ViTVlpYmNEU3hVeXIxODFCMjNIVnFHVWhaNzB4ZGtzRGhmb3VVaEJNYno3?=
 =?utf-8?B?Z09nR2gxTGE4WHltSmQrNXdxOGFzL1B6bEtaYVdLTVBoOStIYmt0dnVYTDcz?=
 =?utf-8?B?ZmFHcXJrMXV2b056OW9nVEtiVHZNUUdjN1dPMi9CaSt3eTFSQmZ4aDRTci9i?=
 =?utf-8?B?Q21TeUcwVmE4Vy9ETlNRMnAzNjNYRnYxZEt0SFJhejVGMzFxV2pqdzd6VktJ?=
 =?utf-8?B?aml0dURPa25waUdPZ1pSM2xjdm9nZXQ4NDMvVTkvZi93RGxpbXhmZGhrdGoz?=
 =?utf-8?B?VUhXK2xIWXl0L090RVAxUmozaFRhdk9tS0ZpN1BkZm9NMGlzb1V0UkkzWTN6?=
 =?utf-8?B?SWNtNkNreHBKLzRXbEpGRHQ0MzEyWnJMR1ZwVUpEUlNsU21GWXBpNTVYZzdO?=
 =?utf-8?B?SEFPK0hRMU1CbkFCbHhhak5TY1I5LzJoU3lkNHRTWktwemJDRkZaVzVINy94?=
 =?utf-8?B?MEhtYXcySGp6UmpqYVBjcTErL09GZW5TMlU2Ri9Lc3BKTGFlbDh5Wk1TYmJi?=
 =?utf-8?B?cUEvbXNtTUxNOFJNYlVZTHNESWVTOUJVNFFCTkhzcUdobXF0VlNUb0J4dE8y?=
 =?utf-8?B?bVRIZXp6czAybTFuWW1mMzB2cVpwbDVBK2NqU3ZwK3cvT0MrVitDb0t2SCtx?=
 =?utf-8?B?K09EZ20xcjB5NlhGRGdHalpIc25wTVc5QSt5RklqcTVoOFJ1R3lNcytCQWVJ?=
 =?utf-8?B?MlhkdUtyZjRSdXhwcGNlTEVqMkN1S0FkS1BmbUI3UXJRaXFMOStmZ1lhN1F1?=
 =?utf-8?B?N2NvRmovdXQ1djlqZ2lDaDM2aEx0bjM5cG1OSjI0UnVJZnVPR2tEbTAxK3VE?=
 =?utf-8?B?S0xVY0NEb0ExTG5hZWE4bGZ5TVJPSi9MUFNXMFZudkQvRWZONVUvWk1vYTFR?=
 =?utf-8?B?VUxTWHJtQjVlZ09JdHpIMHVWai85ZlVkTnI0VnFTZGhwQkxzRU5rOVloelI5?=
 =?utf-8?B?bDMxV213K25TK3dOcE55MmovZHJLS1ZKdTZjRGt4Y3Y3WmNmY0ltdnFPbFVk?=
 =?utf-8?B?eC9mWUQ4Qzh6OWE2aEZNdFY1M1cxSitNRlNnTC8ySkZYSU1XdGZ3ZzZVYjEy?=
 =?utf-8?B?cElYUjcxaFd2RkVtTnJ0RmJVeHdIVGxqem9GcDBrL3VNZVp0VXRHMHhHbDhE?=
 =?utf-8?B?YnhGVzdHUUZRc3UvNjRXeTh3Ujh5WU1yYXVxU1hCcCtqWDJmVjdMYTNQeXgz?=
 =?utf-8?B?Qy85OHZKMlBPcTZ3U0Mrd1AvZCt3blVVazdHTDhuYWhYU3VqbjlGY3BHejJS?=
 =?utf-8?B?RFFoR0FyZVFMUTlXcTdONTBpaGVja2hjVVRtQ3lweVVjUTdvWHh1MmRkV29L?=
 =?utf-8?B?NUhXUXJKQW9pdVFxQ0ZISklqQWNwdmJLOFRJeTRMSGdraXBpRkJYNVp4RFNW?=
 =?utf-8?B?V0tDaVFFWGxBekRtU04vMXgyYjNGbEJBMkVFd0NNdUM3ZnNiVkdhemRJa1p3?=
 =?utf-8?B?SmpWTjdteUs2SU80UzRlTkxUWVlRY1ZXalFOaldDNkdIQTZLdmZPVURZY0M3?=
 =?utf-8?B?dGNzVmJjRHpZdjU4MVlEeVlyMHB3U212dWtFT3pIdjk5ZG5xQlptdHBuaUJB?=
 =?utf-8?B?WHcyU25SV3dkRHYwM28rV0diY1dyVTJDRm5hM1EwV1lWU2V2VDZsWG5FQlVK?=
 =?utf-8?B?RklKY21hSG0xTjlkTW50NWkraVQ1UW9MS2Z2MlZaV3BMRHFNYzRtR3lFZzRj?=
 =?utf-8?B?aXFPcWRZUUxrWll1T01iZVlxdmk3bTIzdW1jZGRMTlUrOWxWeERKdThBb1NI?=
 =?utf-8?B?WUFaM3BGcUgyNmd0RFYwTTRiaWNYelhGUTdiZFZQWFRvYzlBbzNwc2k4cVpV?=
 =?utf-8?B?MzVkYmoyLzZlSlRxK2crZHp6anhKRFNCK1dEY1JUSHJnN0Q1eTMvWXUrb1NV?=
 =?utf-8?B?Z2lOK01BemNZY010SWZielV4V0s2WEhGbGh0M3BwZEs5RkFjWS8ydFBEZVha?=
 =?utf-8?B?YVVYMWk1MmtUSGdGOXRGeUJUUTdERmF2aGw3ejQ1akRuVUZOYmdsLzYvOXVM?=
 =?utf-8?B?bkxOUm1hdzBWUVdtRFNiUDJSYjJGNzRJVlBZK3YwUXk3ZXMweklSRDFmN2kr?=
 =?utf-8?B?L2U1VnZ2N3ZsTTNoaGZZVlI1bWJDaXRLUmpRelBTMGZPZnBKMFk2d25RcWN3?=
 =?utf-8?Q?qMgg+B8sFW+079P7bHSNZhCes?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1280982f-f217-4290-7b11-08da6e180de9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 08:31:21.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiP+HNVbGyAOBGquxTrZe/kpaIbt3HDlEI0QJsEUVomyu1v4zk5I294u4sq4uj44yQ/6T/3g+cCdGePuA3gsCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

On 25.07.2022 10:22, Xenia Ragiadakou wrote:
> 
> On 7/25/22 11:00, Jan Beulich wrote:
>> On 24.07.2022 19:31, Xenia Ragiadakou wrote:
>>> The function snprintf() returns the number of characters that would have been
>>> written in the buffer if the buffer size had been sufficiently large,
>>> not counting the terminating null character.
>>> Hence, the value returned is not guaranteed to be smaller than the buffer size.
>>> Check the return value of snprintf to prevent leaking stack contents to the
>>> guest by accident.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>> I 've noticed that in general in xen the return value of snprintf is not
>>> checked. Is there a particular reason for this? I mean if there is no space to
>>> fit the entire string, is it preferable to write only a part of it instead of
>>> failing? If that's the case, then scnprintf could be used instead below.
>>
>> You will find lack of checking particularly in cases where the buffer size
>> has been chosen to always fit the (expected) to-be-formatted value(s).
>> While in a number of (most?) cases this ends up being fragile when
>> considering general portability (like assuming that "unsigned int" can
>> always be expressed in 10 decimal digits), I guess making such assumptions
>> has been deemed "good enough" up until now. I think this also applies here,
>> so ...
>>
>>> --- a/xen/common/hypfs.c
>>> +++ b/xen/common/hypfs.c
>>> @@ -377,6 +377,8 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
>>>       unsigned int e_namelen, e_len;
>>>   
>>>       e_namelen = snprintf(name, sizeof(name), template->e.name, id);
>>> +    if ( e_namelen >= sizeof(name) )
>>> +        return -ENOBUFS;
>>
>> ... I wonder whether you don't want to additionally put ASSERT_UNREACHABLE()
>> here (but leave -ENOBUFS to keep release builds safe). (I also take it that
>> you haven't found an actual case of the buffer being too small here?)
> 
> hypfs_read_dyndir_id_entry() currently is used only by the cpupool 
> pooldir and the name needs to hold an unsigned int. So, currently there 
> is not a case of the buffer being too small.
> 
>>
>> But of course the main purpose of using snprintf() is to avoid buffer
>> overrun, so truncation is indeed deemed only secondary in many cases.
>> Which doesn't mean adding such checks would be unwelcome - it's just that
>> in some of the cases your options are limited - see e.g. the other similar
>> use of snprintf() in hypfs_gen_dyndir_id_entry(), where the function doesn't
>> presently have any error cases.
> 
> What I considered an issue here is that when copying the buffer to the 
> guest we use the value returned by snprintf().
> 
> copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name, e_namelen + 1)
> 
> Also, if truncation is not considered an issue, I can remove the check 
> and replace snprintf with scnprintf.

Well, it is my view that truncation (if any could happen here) is an
issue which does not want papering over. So I agree with you sticking
to snprintf(). Still I think there's an internal assumption that
truncation should not happen here, hence I've suggested the addition
of an assertion to this effect.

Jan

