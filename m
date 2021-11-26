Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E703545EE48
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232729.403558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaen-0008WE-Sr; Fri, 26 Nov 2021 12:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232729.403558; Fri, 26 Nov 2021 12:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaen-0008UO-PU; Fri, 26 Nov 2021 12:48:49 +0000
Received: by outflank-mailman (input) for mailman id 232729;
 Fri, 26 Nov 2021 12:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqael-0008UI-RS
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:48:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 318165d7-4eb7-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:48:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-RD_ep5dJN6qKAnrB9ecCCA-1; Fri, 26 Nov 2021 13:48:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3294.eurprd04.prod.outlook.com (2603:10a6:802:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 12:48:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 12:48:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0159.eurprd06.prod.outlook.com (2603:10a6:20b:45c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 12:48:41 +0000
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
X-Inumbo-ID: 318165d7-4eb7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637930925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQDITo9f9lV+o4bl/4+B6uaN7dki1K4r7F5gTsbexGQ=;
	b=bVm+ecub2GT10iCww2QrPMHA5p2b4e8LiFwxU7kzwGP5d5bZLiFvwtYMK/q5ryTt8o3PAV
	8zHlLY/LxtkdwKFiWkq7U3iG3qznLriH6zJ0EQIQXyPz0hGmZ2iug+p1SGwjuDW3/Z2hBv
	MVwdDPmR4rGn6dyfcCFMcX3na+M8wTs=
X-MC-Unique: RD_ep5dJN6qKAnrB9ecCCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fF2IurVRqJdZL7wYymHMEurfy7dMbmqVedKh0oiQWfL2fwkTnNf348pJEKLkk2git5F7B+hpxE6QgsyRDuUF2mY7rCB2THUWws4XfvgBigwc48rqbM480wtk5kXAVhSJ5mqP+YeygzmvHHOEA/G2QkX1iTAVTTeWwa9/h5bm+9A7ChiDfRbEzVw+ffkjpBU0x7GQPONfJFKZD3uNKBIW87cpaCzmdO9/5vElLiT50yoGSo7GOaThXhbJkPiVt1J5S+QLO05ANJr40mIcWh2hxVE0JqJ1fuBxL6/3ydMML3ps/wrk7tcKfOl7twYoIWu6PREsXxofgJhBTLqe0eR2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQDITo9f9lV+o4bl/4+B6uaN7dki1K4r7F5gTsbexGQ=;
 b=Ye+gqIXYWf4JyEfRnQV6zCPo9eKEne0t8Qrs+zUCz1vz3+E7WvzC6tu6l4hVwwq6/MN8Jg3HN/ZNp8NnNZxikMvVieiiENxEBQqGtPib1IXNeEcQW/qz4q9d8EQAWMGlWuSRmLEhYFPVF+dDSiQBeTSrh4aPGW2Fsgibt436b2I6xQ6q2ShYSGsQQclufiTbk/N63e1j0RMk/hGWLPHl26oD4pCA1DiM+R1xb1f2llctscWxoyflIC34b6L/SB3NOdwguqvJPkm6v7RuDY+J0cdrKv1MTqaTc/Era53sy8/Ue0tckHmtdUXrYovEfaurf3xA8nhIOJg3pv9JDgnXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2bc4eeab-a69a-a953-e09e-7b87f7dc4b85@suse.com>
Date: Fri, 26 Nov 2021 13:48:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0159.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5b5fc6d-1bea-4616-d304-08d9b0db139d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3294:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32945DC984A9CDEC1ADB30C1B3639@VI1PR04MB3294.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	th6l5T+hzLdmxa4jf7m1skouzhr3DlwXVaFCbHttM2byNhoQDmgPUdLvQ4WWWtPXb7MZRKvGkphVxqHlE4plvaO1ZCzB+WUpp9oUTd6dIR3ll8RbcSQcyz8+ACTTchGdshcL3qvohQtiMcNvzjVEGbFJxRs8f8ax+UnxpH0kJhmTXcyyznBMHsrt5XoSaju+UD7T+VC6HTkEcw1ZJasJPR0mPEBe4dyuce1GCvXs9zOoePqcsNnCBbOun9t/0v8ZQ/7M60WJxlnvONZh140cHpyNC3ajwOLWTZQOcL+sju2Tf5kYNlmgC8PxkVl2mTSAvZPYNmqFSExOvSRIEM8c2KxHwxq8p8R6RDJklmjqPujZso/gqpW9U1Q222UO3hn9Xu0jPHeLx+fn+AFzYElA/hyxz0LcDeMSc6263XgSj7iBbVj3C5X6ZiyVwQwIEq5z5C5yfxK2oPocDGGN/TvGEk8CDa5BDHXgQ3/IMbI3WS4i18l9dbKNqJ0nFNKZdZjNt7N4xOmUb8E5wF3oH9REz7wH3koueJmpN4qgCq8ftxpm0ksaoADIvECZh+dHoIdBHwme/pp0Fus+E2SAeFyXuyRPLmbFKQAt5F4ZQywdqtw2Q1Yvha5SlTKfS7w8dFY2iP/xc5uRRGV1rNPcLhbkyw6j+zboWLoBCVvtPj2gif2rOXh9JmlDhgSODNv94sEC6oM8npFByOD9p2NJRwS2QII2jTL9qOnRbHuaeddLKbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(4326008)(38100700002)(54906003)(956004)(8676002)(5660300002)(16576012)(8936002)(6916009)(6486002)(53546011)(316002)(36756003)(31696002)(2616005)(66476007)(26005)(186003)(31686004)(66946007)(86362001)(66556008)(508600001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0tMbTFXSmlGY0x3WmdwSmpwTXBCRUxwWUJBM0tMRUplOElvdGdyVGxWQ2RJ?=
 =?utf-8?B?S0Z4dnMzenQrWmNwR1hodVB6cVpMb00reWRFMnh5UmhLUStLaFpuWVFUWkZC?=
 =?utf-8?B?OGxhaEN5eWlZRm9HenRzUjhjVWZkM1A1bHJUNm5YR2JUU2xIWE8zZ3d4Uk9B?=
 =?utf-8?B?d29VN0FHK1VzT2grQzh5K202Z2srUGJWZ2U4TkxXdmd3cDU4ZG81N3NNSUts?=
 =?utf-8?B?RDUxVnplQ3hSZVFEbW1NOVJ4aDcrK0RScFpITmVPK2l0NXJncTlSdHVMWTJG?=
 =?utf-8?B?SVVtaWViTXhaVUREckhiWXJiWm5pdnYrV05LeEllK3BWbnl4L21sdWo4NnJk?=
 =?utf-8?B?S2lsYW4rQlVsdTJ3c1p5VlAwYnJkYTcrdnBwb3YzQ3NMMlJBREd5SUI3bFMy?=
 =?utf-8?B?RnhiVGErZGxwbmxmVkpXbkl6ZVBtR1g0Mll2RXB0L2k3WFIvaTVzV3JubitP?=
 =?utf-8?B?bENqc0QwVGx4ZUliVHJGdUdJbzFTdHN4U1FIeVFUZG5mY25UaXNqSVlONzd6?=
 =?utf-8?B?Q250VkVoN0lDU2NQT1ZzSjU4TkhIVjlYd1o3ZDNHK3FUbmh2M0pwVkpKejdT?=
 =?utf-8?B?ZWxMUGZUM0MxUHZOZm5MTGx0V1Q4K1hmVVNuMFdmdHI3NTNXZDl2cDRVK3R1?=
 =?utf-8?B?dDlWcWIrRUlVQnZpSFVpTGJUNDBDaitxV1lCeHVjOHFxVDZLUnAyQXRZbk5X?=
 =?utf-8?B?QUd2ZjNpakwweElIUXovK3FHYW4rUlEwK2Y1ejk5L3Ezc3Y0M3BnSjQxZndC?=
 =?utf-8?B?VDhZNzRMNU4xbGl2VVNnUWFrT0lwYnJSSjk3R2dNVXZiOG1icDFocUhTd3No?=
 =?utf-8?B?dlNlSUpZTlRXWW9XQ3phUlJRb29XaHAvZFZneEswSW1mYUtwSnZCdEZZUi83?=
 =?utf-8?B?eTR6TlJuaEpidzc1MTc2V2FNTlhWWjRFWVJiZFlVQlNDSk1CREkxY1VwMlVE?=
 =?utf-8?B?Q0FCVFBGbU0xRDVRUXdOTGIycDd4TzdmaWVkTUl2ZDhyYTAvcUxxVGRxUWE4?=
 =?utf-8?B?ZWRtRGlCUWlhMWZzVWw0Z3FoZVpuN25lcDhnZDZETmJFT3JhdGw4MEN6L2Nj?=
 =?utf-8?B?U1ZyVzF5YU94TkVCRFNlbU9IWmFzbVdTbDI4VUcvSVkxak5ydnBqREZyaUtm?=
 =?utf-8?B?WVd2Z3V0WTZNZmk3SWl1RWxpWXNWVkljWDhnNGVkQWpOZkVJNWZ6Smp5UTF5?=
 =?utf-8?B?MVcrSVhqQ0lkdWRldjg4MWppRjBlYU83R2JTeHFqeGJEbWcrRFJ2ekRCRnE4?=
 =?utf-8?B?UUo4UDYrTjVlOVUxbU1ITTBnWkVUQTJWUTRIdndmNnY2eDlZQ1ZjQ2U4L0x1?=
 =?utf-8?B?TDE4QmpQM3p3eFZ6U2pzQzR6b1QvOElVTFhRVC9NbmRkNkg3a2lwZXIyVDdV?=
 =?utf-8?B?Z1YreDNtNmZHQ0txSS9DVyt5Vnl1V25VWFRnaU13TVhkMTg1N0VoL1hUd3F1?=
 =?utf-8?B?VHgzQzF4MVpQQXgwNDZXTjh3Z1hrSWVyWDhNS1BmMHRCQWovL25SRm5JUG8x?=
 =?utf-8?B?NUkzT0l5ZFpzcmJUcFFKaVRNbkZLeHhxREwrVGdMOGhOWkhPTDExOWdPdWEr?=
 =?utf-8?B?elRUanYvQ2VHRlBWbDl5djZyWlhwOXBYdFJmM25ZUTkzaisySmZIMndQdURI?=
 =?utf-8?B?RDd4dUJhamNnTEdvVGtCSnR6KzZ6UEtQV3M0Nyt1SFhFb0RmVUlRNnpBWm5p?=
 =?utf-8?B?NzBLcHJiL3UrMTlabEEzSkpPUk5nRFNkQkhKV1FHd0crK3hEalo3MmYxdkhu?=
 =?utf-8?B?Ny9GSHFMSG8rRzc1R0czY3VPM0ozY2xYTm9pZXFEdFNVVmZtNHJsRTYrYTh1?=
 =?utf-8?B?UENvUEhHRzh2MEo3QWFuVXFFUlhYL3REOVA2SWdOOFFPZjFXbm03TnZLU1l1?=
 =?utf-8?B?U3d4cHRKT20rOHJVYkRtdmdxb3ErNlEwbEJla2k2MTBCRkZpSDU2L2xpL0pQ?=
 =?utf-8?B?KzhQdjlnY2N1Nk8yTlowdzRWV0NYY1d4SXJMVWxGOXRmTkNPbjF5TENzU2FB?=
 =?utf-8?B?d1F0TXdtcnhETFRFelRUdzUzK3E1V2NMMk8zSFpyUnFPRDRsV25nVzkyMkQ0?=
 =?utf-8?B?MGpUVnBPS2ZTckFTcXJTNEN0RG94TmFLbUpUdTl6NFg5S3AwMUI1ZWZxZmhL?=
 =?utf-8?B?YXF4QUlFT2paU2w2aFBGeDlyOE00TS9nYjRIVjFLTHZrbE9GR09nRHFBeFRz?=
 =?utf-8?Q?9GECuTtaZRckhk6AdbWjtpk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b5fc6d-1bea-4616-d304-08d9b0db139d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 12:48:42.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBOF1aHBYtjnxDvQGvhftERexmoNUxsicFRZJPGMrCGg5yfO4aMbJQm/WJt4GcaTLLUibD8zz4e3t759bfHfDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3294

On 26.11.2021 13:33, Andrew Cooper wrote:
> CET Indirect Branch Tracking is a hardware feature designed to protect against
> forward-edge control flow hijacking (Call/Jump oriented programming), and is a
> companion feature to CET Shadow Stacks added in Xen 4.14.
> 
> This series depends on lots of previously posted patches.  See
> xenbits/xen-cet-ibt for the full branch with all dependencies.
> 
> Patch 1 introduces some compile time infrastructure.
> 
> Patches 2 thru 56 annotate all function pointer targets in the common and x86
> hypervisor code.  Patches are split by API and in no particular order, and
> largely mechanical.  As such, I'm limiting review mainly to The Rest.  While
> doing this work does depend on an experimental GCC change (patch 56), the
> result does actually work properly with GCC 9 onwards.

I wonder what this means. Are you talking about a gcc 9 with the experimental
change backported? Or are you saying that things build fine there (but don't
work as far as IBT is concerned) in the absence of the experimental change?
In which case what about older gcc?

> Various note accumulated through the work:
>   * I have already posted patches fixing some of the most egregious (ab)uses of
>     function pointers.  There are plenty of other areas which could do with
>     cleanup.
>   * With everything turned on, we get 1688 runtime endbr64's, and 233 init
>     time.  The number of runtime endbr64's is expected to reduce with
>     Juergen's hypercall series (see later), and in common deployment cases
>     where not everything is compiled in by default.
>   * I have not checked for misaligned endbr64's, and I'm not sure there is
>     anything useful we could do upon discovering that there were any.
>     Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), but
>     this doesn't account for the structure of x86 code, which is most
>     certainly not a uniform random distribution of bytes.

Do you really mean "misaligned" here? The 2nd sentence rather might suggest
that you mean byte sequences resembling ENDBR, despite actually being part
of other insns. If so, checking might not allow to prove anything, as e.g.
displacements change with about every build.

Jan


