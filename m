Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD3E7DCA48
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 10:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625570.974974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlVc-00067Q-GE; Tue, 31 Oct 2023 09:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625570.974974; Tue, 31 Oct 2023 09:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlVc-00064W-Cn; Tue, 31 Oct 2023 09:58:04 +0000
Received: by outflank-mailman (input) for mailman id 625570;
 Tue, 31 Oct 2023 09:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxlVb-00064Q-0O
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 09:58:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9bad251-77d3-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 10:58:00 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6933.eurprd04.prod.outlook.com (2603:10a6:20b:10d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Tue, 31 Oct
 2023 09:57:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 09:57:30 +0000
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
X-Inumbo-ID: f9bad251-77d3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2JzINe+Hw14y1n1AUv8Z51910JBarNB8qnYstDKPpSU5i048ZzpA1GLbKIfPxP0sXKjBWmwMk906vgPQDxtACjdLPIHJe4k/4ThwcJflCmnAhnj016UBZI3ieQpkLQSUVh1jWPh0N3HBpAt6PHfwBFW/8IEvVE4N4qMM6K+FD7H/H0pULpE8ikvjP0XuaW4adbwfAmGXX+RDfpc/nTyMbHQ+9KZsrdvNt1r/jtMhEF+pWNp2qzdO2LDTIxdQ2fLdc70tpuOeqiGl5rYDfCqpchvivUP0DROOlH9lkJAXQBTAKb9JJeLnVvNvufkjKYRIO2fvBmbP9KOTm+I5HRLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1D38uPzaFMzd7NCJLM/b4hMJZyhzPA94GGVN+5qZiU=;
 b=SMOSaSfObNFQa33smpo6IQinIp9E3BJYxT0dvFCUXbmvcLWGrl0E6wfHy99nhS5M5SIgnzsMbUpSy9+k2CkYjQDpBVOdRejfozxb4XpXMFQ+XHbpU/1RnyYG1FR8RZuIsd/sLTC558AQpREy8/XuzrVmhbrzXa5AWu1rzR9JDFUJwB6dhN2BE2N39RlXKuRZ1TY1DrllKi1IUXcynljOOpSHKWUDwwdhk2qDC3BeyikADXdkoOcFTzYCHMbKt9L6zZVwInmk0UGpsBvSk+xDIjBUHB852hXOCKsXuH8yd1LU1UUlfaC21ADHZTMbCIBjWM52bgdjk5X9ljGdBCGkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1D38uPzaFMzd7NCJLM/b4hMJZyhzPA94GGVN+5qZiU=;
 b=mLI8drT1qO6cfj9d41izfYd2lDrC/x9487VJGbgVHWdPNv5AXoAemZ+YrgwcFQTQd0i3ZXL5MgrRmGizYrHvCB1qcQrEtR3Y/LrtNQfYnrdaI+NLfnz2ooJ1qrtuSo2Q2OVleLjYpwg0LgvK02Sl0PK+MZqweEaWX8gx+tSz+wu0K/qsf9F92klTuoPhAEzrMedUaxByMvdpybrU/CB85UXRsmwtXLhbajJzzChfayFoYivuvwmwH2IZoKJjRXaUxntXAb27jVRuEeVPjUDfIPYUm9idKkx7fQ4oqma5yNCNbqntVohcdVSHkuKpj5nYI13PCO8BrAJKEsdJskjNXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a2927b0-460b-eb52-54e1-3777dae66d11@suse.com>
Date: Tue, 31 Oct 2023 10:57:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 02/22] x86/msr: implement MSR_SMI_COUNT for Dom0 on
 Intel
Content-Language: en-US
To: Edwin Torok <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <9d950b3c5502b5fb5fad62845b56b15d1bacc2d6.1698261255.git.edwin.torok@cloud.com>
 <6fc915a9-4415-3337-3b3d-cef0e9f735c1@suse.com>
 <E50DC831-A8A6-468C-9CF1-C60F6695304A@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E50DC831-A8A6-468C-9CF1-C60F6695304A@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: e96e754f-5113-4b33-7256-08dbd9f7cc0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GpIKIYlvCN76fxSc6C0deAOVTXkX9AzDH4648z3zkO3NtXW59H+SsvS1gpJ1UBmiZvIp9Chn8Oh3MYioQCB/D6ngzNhAScjAJI/WTL52hUs08UvZaR4H313TrGksYKAHNqY107vrMeljUbiR1qNGEbVNTq5jul+SD6jVO2iGZDL2P6PUE7Q7yz7jeEo8Hg72Wqtd1BYHDQtVDoRm3mJu0d0EXJMDQtX2A0xkw1QU8vtHaz+76AN5C/1D+MK0MT1m+7o72XVNwo+eytElfNDxe0+yt0UQ72avgmWCmLtwOHt5A1okflyblk0aEQuYg06VwhOnZKxdOB6HlytNDQD3JwAh0AqilV+N+in4MlkuvShIZWdK6LgySElbzM2/ylsHFlPrWujZJq4WOIFsGq0ccZRWDP9haK1K36ec1l958OgTx60EDreSJvz+AjW/h1yKWJ5mV2LdErIShKFvekKL09d/E/cU5NDciEZ+6K0wly6fRIPLE9U1ssHhlrOyfqtdjGX/5Vtpd5PPu82uCpjy7NH5sEvL5+MB6AoeqNkyeSxwNNl9BbchvT8rIqyXk1mWQsswgYS7iXcNb4ieWJWtPeI5KMymNf8goEJjQjkqNhd/l9BD6dTbLcNCZkwqI9Nt4LTNPPWMGT4OIIsETPj6BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(5660300002)(6512007)(6916009)(41300700001)(66946007)(316002)(54906003)(66476007)(66556008)(53546011)(31686004)(6486002)(6506007)(478600001)(2616005)(36756003)(26005)(86362001)(2906002)(83380400001)(4326008)(8676002)(8936002)(66574015)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkNrWVUrbzBXTmVkaUtRUnN3QVYvNjJuRnRiRGd4MFRQbi8zakkwdHJUazl4?=
 =?utf-8?B?Wlh0eGZPcHlTanJwMUcvbmFWbTJyRFFzZFd2OXlPdmUzaWMrRnBYRzIxSUNH?=
 =?utf-8?B?eFowTHEzSmNTWjFiZnFOY1JhSVczbExrUEFHUjZCVTMyVXJvQ0gremtyVUZy?=
 =?utf-8?B?eEorMElSV29UUjVaaFhoVUs4WXNXMGZORWlYNkZVelhRZ0w2ZkRtTVpsSEoy?=
 =?utf-8?B?cjlENnNhdy9NcWVmOWpNQ1hHQ2FkNmowaytGQnJYakl6MHNpdmk0QTNuZnNZ?=
 =?utf-8?B?ei8yU0xaNHEvSzdnOG12NVlCcWg2S1RXbDA1TkJwV2JzWGhjTjNSb09PSDk4?=
 =?utf-8?B?elhQRWFTWjRnWVl6MEsxTVRHWjR6UnoyLzRuazhlQUpybHFyMXlqRnB0d2pI?=
 =?utf-8?B?VDl5YkYrZGh2M0dtaEQzanB5Q05WNkk1NTRuZ1VST1V1NUV0ampNVXBrT2xG?=
 =?utf-8?B?ZTJQVHJGTWZic3FaZ04vWTNnVjh5NURndnZCNUw5UXhmWE94NlVabDk4K1Np?=
 =?utf-8?B?SmdMem5PdEZvNjcwVVRzSlFUanJsdXpsbms2TmNmNjM2dUZ2ZTkrSTIvNmZw?=
 =?utf-8?B?SU1nR2loRk53V0UrRjNJUXM4NjBCYTFFa2NmbVdWWW1NTUN6bDJGMjJaWkFI?=
 =?utf-8?B?WjB5M05oTm1pY2t1dEJxMXVVSVhJbi94MTYyZVhkQVJQQVJ1aUtCcDJieCtx?=
 =?utf-8?B?ZUxqSXU0U292T3JGRnJQb0J2OXdlYUVRYy9FMWJSekxlTjk0SkpuRDc2ZGRC?=
 =?utf-8?B?OEt6MEtJQ1pPeXlla1Rtc01lcS9qZ0VXdkUzeUk5dzhHRHVkZ2ljaU02ZjJK?=
 =?utf-8?B?THNqSzZzYzdUSWxJYml0U3NTWVRsT0FOdG5weWZORUd3QU5PYUhqMlIwa1Fx?=
 =?utf-8?B?eW1xUFdkVDRCSTc3dndiR3luak9DVHdDb01BYTM2NlZBNmNRSzgrNEJhOFQ5?=
 =?utf-8?B?ek5GYXZPdjlEL2trcEZRNXFueWVpYzJpdzB2dHhua3FoU3JUNmtWeTRZbytu?=
 =?utf-8?B?eGpCYktBQWtmVlkwdE53SThDQ1dpL01uQWNrMmQxUzZlR2pYNDhlWHcyQVVO?=
 =?utf-8?B?cWxZL2gzclA2b0lyQXNjYmlIMW91RjAxOXZ0MENLN1d6dzNSZXc5NytiN1BK?=
 =?utf-8?B?UjlZREQzQzIzVFBRdDBXc0UyU2RwMDgzRXBlU29FNWdoVUlWV0Z0clJvRUJF?=
 =?utf-8?B?c3M2QXo2ZUVkOXNETlpqbmlqZzQ5eW1Wd2RxWlllcXhESmFXUjYzZ1FZbXhT?=
 =?utf-8?B?V1BQQ1hNVUU3ZnRsQWlKZ3FBdUNyOVFlRnNJTzdwMnNFNk1aa0ZmZHRoRWww?=
 =?utf-8?B?d052U09QaDFJMXcxaTR2VzNWMHBnUGZUMFVtSTJzMFZNNHh4NkthREhlSFNP?=
 =?utf-8?B?Y0lvcDJuZGF1czN6ZTZ6c1Z1dUJyblZSSmh6Y1JxaERVMUdPSXhWdmQ1cWZP?=
 =?utf-8?B?OEQrZVgrenVGY2pkakJsT1l4cnFyN2xZamFla3FxRDlYSENPTDVsSnA5b1o5?=
 =?utf-8?B?VThkUkVnNm1xY0oybmRYYURMSWR2OVNteW5XdC8xd1h4WHZia0pkUm5veUd5?=
 =?utf-8?B?VnNHZ0gzWDRsZ1NUOVROK3R6SjB3SUt4YkpSUzRWUUlrRVlOVTZnMkhFam5S?=
 =?utf-8?B?cG4rYmcvZmF3dVBYa1k4NkRDZ1psMktPdjVmTDVNMWpBUEZGUE9jMXBmZnpz?=
 =?utf-8?B?ZC8vaDlzMURzOXk3MnpTL0R5bm9jRnJZeEhpc1VhbFU0UEhhb1ZuWFdNSzk4?=
 =?utf-8?B?eUpYYWpoS09HZDdxZzV4TjhqUVNad0ZOaEhkck9iZWhVVmdsQ3VVQTdtcXRR?=
 =?utf-8?B?S0VGc2dHVnJVWHBSSFAzZU1Wa0tXY3dHOXc4dDV1TzRUbFVFaWc0V1BTdU01?=
 =?utf-8?B?OS94RXVSbjliYitQczhodWZyZjZQOGNxbHJIbnI2NUdpQkpZL1BianBNWHJu?=
 =?utf-8?B?NXNBaGFoeG9RZVhteTFZZzRveElRQmFoVit5aDIrSWh4Q2xEL1lFWk83a2c0?=
 =?utf-8?B?RVExZkV2NGNXUzZBV01yTzJwQ0ZoUDVlM2xOczd3dVFkQ0kyamVtWldBWExR?=
 =?utf-8?B?U0dFUTVKNG9rblZCR0xmVDF2d29IRGI2Z0NpUWhLSm5zeVRZdTFDVlFNaWw0?=
 =?utf-8?Q?CwoNotsWsBWOQRSP9+7EbB6w8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96e754f-5113-4b33-7256-08dbd9f7cc0b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 09:57:30.8273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPFb0PV+TgON6hXbQ9ZSuPWod++uLkKiieW7YIFCbIsdT/6tolltrWZ+FUOjOku+0yNP+zo1/1+YCGO28ung8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6933

On 31.10.2023 10:42, Edwin Torok wrote:
>> On 30 Oct 2023, at 16:20, Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.10.2023 21:29, Edwin Török wrote:
>>> Dom0 should always be able to read this MSR: it is useful when
>>> investigating performance issues in production.
>>
>> While I'm not outright opposed, I'm also not convinced. At the very least
>> ...
>>
>>> Although the count is Thread scoped, in practice all cores were observed
>>> to return the same count (perhaps due to implementation details of SMM),
>>> so do not require the cpu to be pinned in order to read it.
>>
>> ... this, even if matching your observations, is going to be properly
>> misleading in case counts end up diverging.
>>
>>> This MSR exists on Intel since Nehalem.
>>>
>>> Backport: 4.15+
>>
>> If this was a backporting candidate, I think a Fixes: tag would need
>> to indicate what's being fixed here.
> 
> 
> I used the Backport tag to indicate what is the oldest release that it is backportable to.
> IIRC the choices were:
> * 4.0+ for issues that were present for a long time (didn't look further back than that in history), so there isn't any particular commit that introduces the problem, it was like that from the very beginning, i.e. not a regression.
> 
> * 4.13+ for issues affecting only new CPU support (I think that is the release that added Icelake support). I can attempt to find the commit that added Icelake support and mark them as Fixes: that commit (although there might be several of them)
> 
> * 4.15+ for bugs introduced by the default read-write msr changes
> 
> 
>> Otherwise this is merely a new
>> feature.
>>
> 
> Prior to the default rdwrmsr changes it was possible to read any MSR, so I consider it a bug that after the default rdwrmsr changes you can no longer do that, it takes away a valuable debugging tool.

As said elsewhere, making MSRs generally inaccessible was a deliberate change.
I don't think any of us x86 maintainers has so far considered that as introducing
a bug. MSRs being accessible as a debugging tool may be worthwhile to have as an
optional feature (see my suggestion elsewhere as to a possible way to approach
this), but I don't think this can be taken as an indication that we should revert
back to "blind" exposure.

Jan

