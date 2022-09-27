Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844C5EC785
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412763.656200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCPE-0007zm-HT; Tue, 27 Sep 2022 15:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412763.656200; Tue, 27 Sep 2022 15:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCPE-0007wo-DM; Tue, 27 Sep 2022 15:21:56 +0000
Received: by outflank-mailman (input) for mailman id 412763;
 Tue, 27 Sep 2022 15:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odCPC-0007wi-K5
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:21:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d75a580-3e78-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 17:21:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 15:21:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:21:51 +0000
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
X-Inumbo-ID: 1d75a580-3e78-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSbCOFTgTxAUjArXcxHAiBx2ca6znvMJncQzW2YZNhrmMTYl9xnaDR+kj1aNmxaVOQfr+sx/eAuomFW4+dKcqh3AcP+ZFSqVT6t6LJfAfIsWFXgT+J7yttS8baFLoeICkzOPpfpk+KN8865GV3mHgZYsHEsnbIOZFiEpHOdspi7mT2kP4IlkrP6yMf7Na/5rp8S3M8taGhS6f7zoQQZ5mN6u8ITx+iMDIcXzG+3+H8ueuPJs5QL7asifoyE0hNcLA/QccsS1IY/TAcqGuyVIZXm1dCDFU/xSzqSM9RTecONHkA92T7UclAo6rCSy89KxD0y/igWkKk32XfqPNl/WVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcDSxOnQG5nOtWuyCpfsnObR5HOAxZ7DEIRp6E7ww4w=;
 b=EmbEZ4U3OcB1T7Vy8UBtDVF0+dCw4Eg1zyOsbIkC2xd1nI77DkXTWy/sWgnos8P0PKdzRXYz3jnUU684mMKMpIHDrhHbF/KPH7a6pND84eFWCOAdd1T90VTrB7EetwfBxZu7CAHbbreMj8GXNnE3eyps2IynGXsR58d7gNWtdrrXicG4Ulal7i0uH8p8KLj21sMpLAc3RUwQPIhGrbU7+cKzHFYDyRjaRZ67COsZph3jFB0q5P6dQkeJPQdKewrD3FqMRxTABbKtQ+AcjUZ3yNr5OPFOnljxI4LOlKJTbX/ddZ40RqxuuucKa5jNrPtJjI2ZDDNDvn2by/lHTXBBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcDSxOnQG5nOtWuyCpfsnObR5HOAxZ7DEIRp6E7ww4w=;
 b=VpjXkC3cSoDzoWtzb9mwoqr+VfZ9ZHAug22mkTjf9tCMWL7LkX8kmWNBbHJPCZOxgMcMPTLYUsui7fUGOHpjwkoRAXIie6aMykkJxXmadWMeOPdfiaP6FTxPICkH5ue5Lj2o/T//mMBpa/CdoF9sPUCUeRdDSNOXwmnjJ5Pu/htmdWk0EfjySlMOr3aIYUDKJt+dHr1p9iiHD5idBEZ1fmbmey97xviCV46N4mmiFaf3gMbuPYADnpskxaZlq1qNUYfMGd9CVV0/9d8x7W2Dsu99OjA4YEY6v3eF41QIvSTJx2Fq34nBHIAzS6FgP2wZlCTHiFiptrnG+AsQRRcXZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7858bf8-2cc0-80cc-3294-eb146758dc9a@suse.com>
Date: Tue, 27 Sep 2022 17:21:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
 <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
 <bb89a942-3d34-b290-3977-3165f71a737c@suse.com>
 <YzMRv67Bf9QJt+Ha@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzMRv67Bf9QJt+Ha@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0175.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: e558ed5a-ac12-4d6b-3419-08daa09c0033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dzpfpFjLqukhN2VUMDQ2+bHIQDt33AGPsdoesZHdtBIY5YIUW3GG3+291yHhC9DLbaHesrL6AuftykJUuizh5UgH95VIrhjinTRVWflS5xaa1FY1ZOUqmvGc1rpyqt+CQ6noHyn7bosX7WS89fAU42LpNbrxGsUC6yVJ0EXKPo2IJuRX3RAgUGdIvquDOhR4M+PFBiOkfXUrMxZmVPxcN/bTBGlJm9wFNZU7pv0Ifv9YckFpcSpCZHku38P1OoKFUfS0PADb8HpgCeP8FCsAq75C70rVPL2Ms8ORvquzrWZyMJrsEUU8+PRonHVTrsrwCWgYPHmlJGH1qR0eUxchWwjZ74LfpvNRfDl+64GdtUUumdFTTuYLgOWs1dmJt4g6Q+Vl6/NTj3LOLEccWi7arlnLdNgV/WHJ5rB6LUYsMA+nHoPZoXn25sd2PugUtXLPDJppW5WUm9NbsiDXdVPnymcfO6AbpC/Q4kCHjDf1Bw/vSIIW0ODdKIXyhyZp/qxlIPUcTyc7BlKpodpgEjIwcjhjF5TszRlTeAzqMVJha5Qww6w85TlTFjrAWwJsFvZpvapD0AnmkZwcwupFKk3Adr2cJan76IPf0T+TX+AjxqlFJGOQQNWNGzPrS4LQjcdRpFm2HeyqOGgMmBliGg1Z5Qy02htoEQ+Xa9vjhSk00Zz/9d1BPALsgIhPA+LJD24Qql3q8om62SUGD0mr/ukRUXMpvmtnVJm/uKMetHXm5+vUXgmvmaxPyTG6uCatBa7XgkbU+hkNdnOqBTOd5mJ8Fe8vdJiSS7fUI3vfxcTT+x0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(83380400001)(6486002)(2616005)(86362001)(31696002)(186003)(38100700002)(6666004)(8936002)(316002)(66556008)(2906002)(4326008)(5660300002)(66476007)(41300700001)(66946007)(54906003)(8676002)(478600001)(6512007)(6506007)(6916009)(26005)(53546011)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0R1YU5HemI0dFdMbEUzQkRvSDdBeCsveEgvZGtjZ0RmdTJxOEhlRVJMT3Nz?=
 =?utf-8?B?TVMyaGxGNHh3TzlSQ3orWnF0MVlTVDg0Y0dRQmhpYkdtVFUwYU5LaVZ5RWgy?=
 =?utf-8?B?Tkx0SzBick9EaDRpam9VVmYramZweVBDMWxCVStJMkh3dEhxNEQ2SXZkdk1v?=
 =?utf-8?B?RzhMOXA2a29sVUZYaVA2YUFCcklLUjFYenFYSnJYaTk4ZGQ5cFk3c2pKSXI5?=
 =?utf-8?B?OW1vN2E4SGFXMytoVXBJZHprdG9NdDh3N1UwVERqd1ZZdVhtOVcvcGVwYmdx?=
 =?utf-8?B?ZnkxSDBUTGhXeTMrTW1odkhUd3V4MnR2QXFFd2kyNmo5S1hnbXFoMUQ5cmVo?=
 =?utf-8?B?d1dxRGRXd2M3cDFUWWhDaVBhYkJxUkZFazhKNUdmM1k1TVl5RTRXbmlSaHpK?=
 =?utf-8?B?OHhxYkMxUlBOT0VSL2dwdlVEN2hicW1aNUlWZSs2UDhUNWVTZGthNlJtOGVo?=
 =?utf-8?B?YXpuSFRHc2ptdDhlbHg3eSsrcy9kT1pTcG0yR2ZnbFVMeE9BWkNrU0xodXZD?=
 =?utf-8?B?QldFTFZYbWM2NThTKzRjS1ErNnVQSzcvMXdnMEtVczFSWkpqMXl2bm5VS0No?=
 =?utf-8?B?ZHBreGRxdEM3OTJXdG15dVZvMmZsNUR1aklOcTNYSHFCV09rdTVhb0hhekZk?=
 =?utf-8?B?OGRsRnQvdnlKZ0JRWXpCUlgyQit2Y2pINUltbkZCR2I2RjFVTitqaDUwN0NV?=
 =?utf-8?B?UjFSMDZsQnBjUEdraE1TM3kyMDlpVVkzTmUxbCtYOUFraWVaWGg1SXVlUmRT?=
 =?utf-8?B?NGpFZjQ4a2cvN2VnNnZFMGJGRkZKNVg2Q3dtZzRtNWsyUlhjcjNvRE9BNWZo?=
 =?utf-8?B?anFTcWVSR3dWQ1RJeTNlTU5Ta3lBV0VmcGdiN1NReXcyT1pBakFiTjFHb2ZU?=
 =?utf-8?B?Z0RPT09FQlRkWHZGT2twUmNBeFFibnZNN1VmQXBqUDhKOXMrb0E4cXRtS0dX?=
 =?utf-8?B?NlpJRkNmdmFQNHZzUUFFamdKNHpmVkFYdkRLaUllUjN1U0NpSmx5ckFkaEdn?=
 =?utf-8?B?SXNYclVJZklnOHJ6b1JmcUgwTzdkaGdlcTcrc09CK3RySEZzaGw1ck1JUUlX?=
 =?utf-8?B?ODRtTjJWbU5aNkwxei96Ym1yV013WTd4aU1SMW5xOHJpeUs0V0ZIcCtLalc3?=
 =?utf-8?B?NDl3YXYyeFNJZlB4NmljT2l6bnYvSzhEdG9mNDZGSjNOdkhZRmJrZGlGZi90?=
 =?utf-8?B?cnlZaUZKeS9RYlZFYW9KTXB6dEVWcTQ2Q0xTUGxkNDNNSmdzTUdLTDVFZG5k?=
 =?utf-8?B?a3N1ZXhEOVhXckFra3k4K1A2TnRxWEJ4ZGIwWUNNRlN5aDBMTXRtb0phZzVt?=
 =?utf-8?B?KzhIdzVYa0Qva2hLS1V6QmZwTWQ3aWNkclhTdUNTYUtjTVpqR0xiYXp5Y3JP?=
 =?utf-8?B?YXhYejIwVVc2TGdkZ2l1L3pkVGw5UTJYa0QwbERNOGdleWpaZ1d3bjlZMDRl?=
 =?utf-8?B?TVJHZGhwSTVvTWFMSXR4SHprQ3h5dHQ5NEozK0UwY2RTR0JiMTBsMGNqQTRN?=
 =?utf-8?B?Q2M4TlA3NWpXVkRuZDk2LzdpTVVYcS9iZ21zSkFFbHBPMFRWbHkyR1krdW1m?=
 =?utf-8?B?Rm1sckc2cVJCNGJRM1R3UnlsMnFJSDhHYzB6bzZnbzJkZXpHR0s5cEVBaGl2?=
 =?utf-8?B?MWxUenhMbkh0S0FPT3ZHZ0xTN25EM052Y2svSFNIWjVPSmxOV2JpZURlUk02?=
 =?utf-8?B?TXg0L09zbm1GZjdBNDkzWkdNQzRWcW13VVJwajNkTDM1Y1o3ZjZOZWJXYUYz?=
 =?utf-8?B?YTJBVDdobHpBQVBYT2d4bkdSOWpyUEhoSzhJQWliTkhqWFVneU9JUXdkdkZt?=
 =?utf-8?B?OG83ekVVWG5zT0s4SmErc0dZS2t5aHdJTVVpdDg0OXlFd2U2ZnduQWRyRlhx?=
 =?utf-8?B?WEVWcVNlZzQ4NDBNeHFTd2xxU2Z5L3c1UW1VSW9aM3VLcEtvSUQ1bXpibXVS?=
 =?utf-8?B?d1V6U0hRV3NuOGtLT3hlbVczNlNmZUhvSzEvT0dXbENPM0hLc3JycGJZd1Rz?=
 =?utf-8?B?VUQ4NU5zNFdPSHE2dzZHcUl6RzkrVUhCdWxpdXV0S1JOSnNlOXk0ck92Nk0r?=
 =?utf-8?B?Qk5BSkZhMjA3WmdmZnNaRmJpQ0xEYjhSUU5vQXBzS2cwdDN1azg5OXVvU2Mr?=
 =?utf-8?Q?q91+uim1UxiMJf6LFi6DR0jIY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e558ed5a-ac12-4d6b-3419-08daa09c0033
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:21:51.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VO56ivf1D96dHX+UazaaYpMUytg8wKpiepTC8tMCxLlM5aOR5rCkPcwVsbFERlKB3Fs5pjiVAWzzk2pSfIxHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

On 27.09.2022 17:07, Roger Pau Monné wrote:
> On Tue, Sep 27, 2022 at 04:32:27PM +0200, Jan Beulich wrote:
>> On 27.09.2022 16:14, Roger Pau Monné wrote:
>>> On Fri, Sep 09, 2022 at 09:22:52AM +0200, Jan Beulich wrote:
>>>> While I was suspicious of the compiler issuing a diagnostic about an
>>>> unused linking-only option when not doing any linking, I did check this
>>>> with a couple of gcc versions only, but not with Clang. (Oddly enough at
>>>> least older Clang versions complain about the use of '-nopie' now that
>>>> we actually use '-no-pie'.) Filter out the problematic option in all
>>>> cases where the variable is consumed for compilation only (which right
>>>> now is everywhere).
>>>>
>>>> Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
>>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Arguably with all users of EMBEDDED_EXTRA_CFLAGS using these just for
>>>> compiling, the option could be omitted from that variable right away.
>>>> But if any compile-and-link-in-one-go use appeared, there would be an
>>>> issue.
>>>
>>> Is it feasible to have compile-and-link-in-one-go in one use feasible
>>> with what we consider embedded (firmware or kernel like binaries).  I
>>> would expect those to always require a linker script and a separate
>>> linking step.
>>
>> A separate linking step doesn't mean this needs doing via $(LD) - it
>> could also be done via $(CC). There's also no connection between using
>> a separate linking step and using a linker script - aiui the linker
>> script could also be handed to $(CC) for it to pass on the option to
>> the linker.
> 
> There's one thing that puzzles me, if we already pass -fno-pie for
> code generation, do we also need the -no-pie linker option explicitly
> added?  I would expect the compiler to be clever enough to
> automatically pass -no-pie to the linker if -fno-pie is used,
> otherwise the code won't be correctly linked?

For -pie gcc doc states: "For predictable results, you must also specify
the same set of options used for compilation (‘-fpie’, ‘-fPIE’, or model
suboptions) when you specify this linker option." I infer there's no
deriving along the lines of what you suggest.

I'm also unconvinced of there necessarily being issues with correct
linking. I can see there being executables where mismatched options
simply don't matter.

> I would rather prefer to remove the -no-pie option from
> EMBEDDED_EXTRA_CFLAGS and just add a note that users wanting to
> link-in-place need to review the set of options used.

Which then raises the question why it was added there (in a mis-spelled
manner) in the first place, years ago. That uncertainty was the only
reason why in the earlier change I didn't go and remove the option
altogether.

Jan

