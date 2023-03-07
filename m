Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A26AE025
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507371.780781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXAz-0004bw-Ef; Tue, 07 Mar 2023 13:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507371.780781; Tue, 07 Mar 2023 13:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXAz-0004ZN-C0; Tue, 07 Mar 2023 13:16:21 +0000
Received: by outflank-mailman (input) for mailman id 507371;
 Tue, 07 Mar 2023 13:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZXAy-0004Yd-Cs
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:16:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f29b254-bcea-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 14:16:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8019.eurprd04.prod.outlook.com (2603:10a6:20b:24b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 13:16:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 13:16:16 +0000
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
X-Inumbo-ID: 3f29b254-bcea-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgbOcfcjqr47eOSCJDR5ZqtHR8YHSwiokWu1qzS8oXDz+VZyg9qFUGVCJM//zVph1cOdV/ihFPU/SEaadoR9Oxe/mCKxVhlBTO+FOQpk1YpmdEvVz2AUiXuDtm5Yh5+EiesXl6py/jBinXr1RvpTMszsZ3IPKkzjPp3YY6XqUTdgXJXd4A9kseps6aU7GT4n5OCLM8IjcUNcsQe0j58chNbdE41M5djOiW7mQZrpozbOhuZQLenaw5GoPZah2otWD2qJeSHYnzameJUPJ8ZN2A1n3nJBujzPzSE1X3pMxaL3IQypR9Oo6fGrUi+39bsjiY0wVtL+9Av97z11qRVXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnkl8qHeuIo2xSv5AcVadwAmFMvyNJ3U2Oj/yZGo8XE=;
 b=TwWPhbrg/I5yYFEBFs1gtL3zoVzoaBNbyHPfoR4fo6SCXrCIIA929vM6IEmlBqtSpGazm30sqSUNZ5q77SE0iiPYMcR8V8LLqVisMN4GzPn+tIf8kCrUwe7dENdKyaAsRCteeblU2xRllaVW01JCnn5vuJqaHV8dwKzd8iJ+he2lRouSOS5Kh6w7HG+aIKmhjbN2/p80fkD57cFk6A8IXnEP1O/bto1coT5JQ92l4O2RtCAu/G11cKQdOGNl4YWa37NklacFjKGqGSn0LqJUWu/y28eBScPEam2l5urSxo1OIfGYMd0auJYrEjn48xM1GT20HarDeUIDCI4PBWDfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnkl8qHeuIo2xSv5AcVadwAmFMvyNJ3U2Oj/yZGo8XE=;
 b=R70NJQhvxug8J4lhRexu2sFrOYolx2elqwOiNanPoADiiuI4IfrlGf4tJUDOD1u5w8pO6ngnqCgjajkhGwWu+47s+ROe6OOlb5ebmZuyOCxYZ7w2wv7C1H7Zg/LJO53mxj6oqGSQjXjsKrW65c4AB7zK4/0/8apFQbazF9w6PrUT0gH7ChaWZ3cr2grEvbgZ2IQELGJbo4DlY/ndPfCMoUux/0LbSpR7cXpceFeFEjr8CNLH/a3h0G6mTOLY52545fDwtIzQF629uoiVCKG6iX4dwDxDPDHONnIq2efj1pFlX4d8p2GdO4a+e6thXVXiHoOX9rlAb9NC9vs0Rq4Jyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7be952d9-efea-23ec-0c5f-cfce03bee6a0@suse.com>
Date: Tue, 7 Mar 2023 14:16:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
 <91343570-3532-521f-9bfe-3a68902426d0@suse.com>
 <17d7dc28a767ec9012d4a7ac3d337c4b9c34d98e.camel@gmail.com>
 <46e7e298e52afcee46bb7fd52ddd181227356c98.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46e7e298e52afcee46bb7fd52ddd181227356c98.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5b699e-d032-40f0-a76a-08db1f0e2215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PwRvniyyjgZrYI9gDo6kOhgXafKZLkePhTD4QN81lGlmd/fxx7b0DS5S+4DKGo13XtGlbJw3+0rXpUerRpYFxng9mSWi4FXXvO8gZayGRFAuaZsKOSTjVbPwa9pe8+J5V29Ndvyyqv/n+RoOEVFzB1/pHcsVjVAY1P19qlHQtIM1x20YrZl4lNtQL1PW3Y2CCAp76YgGK6J0UnmrW26utCvHeG/o+QkjiMAtjL3WS1/xHvREMYglXokXRQG3ry5D2y2M9ELz/Cgk9PwMHojbwpeKZ/iv1j3avJ2E9OS5sgPoezedhen4UwKLU4riqtJvVq+K9A2lkxZIAbuqkfOwge93SOpsV2ZyuTJv3laomemhEi3oU7UNWpKEUlqfduXrOhM7WDQ+bvGM71yKDfuEbLMq24vk4kWEhAeFH41xahKvJne1n/PlpuvbTMVuCGe7iccXkWdZ9br52f1UQhe9nlv6CDWJFNfke821upwWxG6AuJt8wkcvNDxDI2Il4uM+178AnMZJah2F3ROR6ystdZ61GEoeNKS2no8UrVggegI4SQMhWZoZnANUUIB0Lx9xevjZkGw6H2oNeX0S2wLDPTkZl/BrIgWyKup3D90goqGwPhY00v52CopcrKSLOdc2EalqwofnO9kVVBDRGDeJSFfNUP9cBNzKq6yswCu+HpcE81ty32FovB5XyBp1kfSHF5aHOqenxGg+Lj1pCjiiEcu4CjJeLVncVbv1aJGS5mcXffWFc7o88n3qqud+/2sp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(31686004)(2906002)(5660300002)(8936002)(41300700001)(4326008)(66946007)(66476007)(6916009)(83380400001)(66556008)(8676002)(54906003)(316002)(478600001)(6486002)(53546011)(6506007)(6512007)(31696002)(86362001)(186003)(2616005)(38100700002)(36756003)(26005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHNuMDkvM1NzQ0RPQ2sxZHpmNUZiaThuRzg4UXBFbmhiK2d4T2hnUzBoR0Mx?=
 =?utf-8?B?OC9IMTJveXdVRm1JOEw3K2xYcDBOMnRROXVvT01SZGVCSGpyN201ZG9BWkhx?=
 =?utf-8?B?RG13Wlg2MlpWN0FsV29WejlqemhzUnMwR1o1czlxVU4vcjAzY2NobUZwanla?=
 =?utf-8?B?OU5IclhoTGYvVWN3RzBlTThCVUpoZCs5QWF1d1pTVWt6YVBsVHlTUHlvZkxH?=
 =?utf-8?B?S1dEVUVLMTBLSGhRVWhuSkpibEFrQkgwbVdkZUFJWlYrRlBLNHlTVk0wOWM2?=
 =?utf-8?B?Q2pOZUVwY2pLR0NQR0dNN0dSUlQrV2RGWWh1Z0VPWFJCcE91Ti9XdVlrMzJF?=
 =?utf-8?B?ZGhhdTVjR0E2Q3hiWFRpT2JTcmxIMFFJOEs1RElibGdocEt6WjdybVBld0FS?=
 =?utf-8?B?ZFZPUERRcGlWVjVRZnBHM0lXcjA2TnBUSXFjd2kzUGJDVzR5WE9zbkNEZFJK?=
 =?utf-8?B?KzlPMVRPZkRYRjJ2UDVndkNxNEpwSmpjTEJXMS9CZDl5TnVhWG9CT2s1UThw?=
 =?utf-8?B?NmsyUExYKzJTUFpEeEN0ZCtLME1XbGFBRkJiZjUvOUpham1rbjZFeEVGV1dI?=
 =?utf-8?B?aXE3NFM4Y1ZZMCtOaXIvMXZiT2Z5T1ZPS1VFdHUrc1I0WkgweG5SZURja1Bk?=
 =?utf-8?B?ZXgxMmNuN2UzUGxxVkdJZ3N3eUpDQmZCTXp2WndxYmZsMytHSFJXZnFaYlhh?=
 =?utf-8?B?ZXcvRFdtSVJObm5UNDlhTE56U2FvTXYxRGIvQzVWcmd5RmJiVUdzcHB6V0cw?=
 =?utf-8?B?RHpLNGVOem5pVzdDeFFxZ0FLMUsycm9ySEdLUHNOOXFGTXRQemVPZFJRbUVT?=
 =?utf-8?B?UFB5OHhTMkt2Wmx0QUlWdGIvdFZIWDR6QVVySkJ4TTJScVVlb3NsY0RiVFl2?=
 =?utf-8?B?Vi9kREoxbUhNSlRBNGJuUlhxNUxST1Q0U2FJbHVocWoyVG03MUk4YmRrZlc1?=
 =?utf-8?B?a1BuRTRQdUIzS1dVdE9zNzRjb3ZIVnFkTnhzRnBlZ1Z2WDY4eGhxeW9EZ0VD?=
 =?utf-8?B?ckNjSkc4SmtYNkdEWS9iOHdkZmZDY2w1K3dIWG1CSzRqMXNWZTFyN3FKVFZl?=
 =?utf-8?B?bklBakVSZnlvSjUzQU1GRnY5dEFrZWdCUC9YTm9RdHZMMUV2bnQxZ2t5TTNj?=
 =?utf-8?B?MkdscUl4TE54K2pyRnV0bEhpSEVVaXJkaXIxa1Z1L1c4bGpGb296ZGZ3UWEw?=
 =?utf-8?B?V2lGZEdOWWJzREY2Z1hKWXc1d1lPbnFwOEVVbG9DcnFWT1Q1UzJPSG9KZ0du?=
 =?utf-8?B?VXc5YndkZWRtQjJ6eUZ1ZGlCczlFRzFseU1aenRBZ1l5bnBFR2dRUFZpN3dP?=
 =?utf-8?B?L0g1LzlXL09ZdHkrVkhUT1g3TkZXSWNsUDVxZXpYMEZmSWNVTjdGd2xtZmVm?=
 =?utf-8?B?V1Y4MW0yQVlCSWpQeGdBRnMwMWFabmxBUE5GZDNyUDJwQzFKaC80aElZOERC?=
 =?utf-8?B?Qm5wRmgveTJ3bWVWN2VlcDRwd2V1cmtma2dGWnJNOXJnZ3ZFVlRRbFAzUlZt?=
 =?utf-8?B?NHhBTEdhdlE3bUFHUWRqcWtwUzg2U0FnT2w4OFlRdU13VWk0OUZxbGhWaFJM?=
 =?utf-8?B?MG41bXpQODc2c216elY3M0xwT0M1Rk9uY3NRd1NkSDM2bkFGaTJDZG9tbWdx?=
 =?utf-8?B?Wlh4ckRWSTNMaXhLMUlyRFJvR29mSWVzUXU2YTVXdVptZnhNWUgyaHlqaksx?=
 =?utf-8?B?cG91OFpMeWJTVC9nbEdhYzFQZTVpNnBiWWk4REkrakY0amxyRFFVNEJaSXlJ?=
 =?utf-8?B?WGFUdk92bUVxTW1NWEZXZUZyNG5ZL05Wc3V5NDlycTgyem5rWitHL3VxYkNS?=
 =?utf-8?B?STArdGlHMlFNWGhVWFVzYXBISVY2QjlZbjUrVXVpUzJPQ1NjRmRtVXpxQm43?=
 =?utf-8?B?cTBwS1J5MEpVNFRycVc2V0Qwb1B3VHR2U09KTk9EejZxQmNNUDZBbGpVVjVL?=
 =?utf-8?B?TUpGZUY4V0lCb3BMelg0ektKbW9RL05BTHdnTXdlNTdXWXltM3F2Nmd3dm14?=
 =?utf-8?B?emdCczB1VlNzOFpSM2dZbXF1UGNxSXBnWHJkR1NmUTkvd2I2RXZ3RnJkRzVo?=
 =?utf-8?B?ZHVlalExMTZEWXRiZVgwenZkVUo1dDFKcmJoeVRFRGpqNDlIdGlNeDk0eWEv?=
 =?utf-8?Q?V4jJUUTU0oK/MyUPZqD6nZLkP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5b699e-d032-40f0-a76a-08db1f0e2215
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 13:16:16.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7v4L4hRkRqrVbuVPoCYBw9fV7P90aalYOyfx6o4HfrPkIvlOLL1T8TESUIkZUYID6eD1px2AghQn/lx8td1UbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8019

On 07.03.2023 14:13, Oleksii wrote:
>>>>>> +
>>>>>> +#define BUG_FRAME(type, line, ptr, second_frame, msg) do
>>>>>> {                   \
>>>>>> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH +
>>>>>> BUG_LINE_HI_WIDTH));         \
>>>>>> +    BUILD_BUG_ON((type) >=
>>>>>> BUGFRAME_NR);                                     \
>>>>>> +    asm volatile (
>>>>>> _ASM_BUGFRAME_TEXT(second_frame)                          \
>>>>>> +                   :: _ASM_BUGFRAME_INFO(type, line, ptr,
>>>>>> msg)
>>>>>> );            \
>>>>>> +} while (0)
>>>>
>>>> Isn't this tied to BUG_FRAME_STRUCT being defined (or not)? At
>>>> least
>>>> the 1st BUILD_BUG_ON() looks problematic if an arch wasn't to use
>>>> the generic struct: With how you have things right now
>>>> BUG_LINE_{LO,HI}_WIDTH may not be defined, and the check would
>>>> also
>>>> be at risk of causing false positives. Perhaps it's appropriate
>>>> to
>>>> have a separate #ifdef (incl the distinct identifier used), but
>>>> that
>>>> first BUILD_BUG_ON() needs abstracting out.
>> Missed that. Thanks.
>> I'll introduce that a separate #ifdef before BUG_FRAME:
>>
>> #ifndef BUILD_BUG_ON_LINE_WIDTH
>> #define BUILD_BUG_ON_LINE_WIDTH \
>>         BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH +
>> BUG_LINE_HI_WIDTH))
>> #endif
> I think even better will be to do in the following way:
> 
> #ifndef LINE_WIDTH
> #define LINE_WIDTH (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH)
> #endif
> 
> #define BUG_FRAME(type, line, ptr, second_frame, msg) do {            
> \
>     BUILD_BUG_ON((line) >> LINE_WIDTH);                               
> \
>     BUILD_BUG_ON((type) >= BUGFRAME_NR);                              
> \
>     asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                   
> \
>                    :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );     
> \
> } while (false)

Not sure - that'll still require arches to define LINE_WIDTH. What
if they store the line number in a 32-bit field? Then defining
LINE_WIDTH to 32 would yield undefined behavior here.

Jan

