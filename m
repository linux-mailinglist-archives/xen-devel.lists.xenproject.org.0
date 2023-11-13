Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5D7E98C4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 10:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631455.984773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2T6C-0006fo-La; Mon, 13 Nov 2023 09:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631455.984773; Mon, 13 Nov 2023 09:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2T6C-0006dE-IZ; Mon, 13 Nov 2023 09:19:16 +0000
Received: by outflank-mailman (input) for mailman id 631455;
 Mon, 13 Nov 2023 09:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2T6B-0006cy-Pz
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 09:19:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b43e511f-8205-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 10:19:11 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6932.eurprd04.prod.outlook.com (2603:10a6:208:182::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.13; Mon, 13 Nov
 2023 09:19:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 09:19:11 +0000
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
X-Inumbo-ID: b43e511f-8205-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEffV831n0xZBFcG74Eg2kT5P2UXknkkmkarENXIRh0rrWsBsWaELaslhsh0AFvr01noYxHGVznVMb9t/7Br5lEDIX3hz1kE2dUVc7fWQ6odgbkpQPdu9gBbtyDYzArMYnD0FmSifZwRdAJe/VsfazFkqOdZD9g7altcBNTYpL5th3U/b6N9a9StYUo1/fB/ZZ4jxW8ZQVIHlbe1V5dk6wcMCEXAGvsEmVIjuxuFVIkGJuRw+cetki0CEZAoIomeRELuRFoceru1SN57a1RRuwFaoT3wzfz5qpQ6x3nw/dDRpPjA3Ok7lCvGm85fG3AUQ0f1tnfFfujsbceHbOxkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNTVy8uxJIwlYlPTIDqOvfT2fBv+NJBFheSi8uY64D0=;
 b=KD95FYJSAJjmOqyBHx6ptu1Be4brLzk08zD7pRDhvwUWbNMNGm6fn8Y2CdUCdsM5babYxsAlQbl+gjS+xGioP31NOPA89GLDXdD44mX5l0WNNPTK95HAmcym6Fu5q02fMobA+I9RyvdhjGr12lOzfEmHtZVBkgU41tryGktRLhzOuBYWcePo7zvty3/u27tiTU6fSZH2aWhvmvM99xhtEPsf0k7NINSDFMhf4Bb83vbfL85/gxeAvknbLzkbThYfU6lzdnfzoT+AiaOX3Q/lY2MA3jsDmJ3IkiMQqE1ekX5qvEUsXGTCSawzUZ8df7X1YhgtRgaJH+/tRQvN82/VAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNTVy8uxJIwlYlPTIDqOvfT2fBv+NJBFheSi8uY64D0=;
 b=JfE8u3sIUzexmynSD2lCdfb9tIalQUUQxFvVgev+EtSPVbbLJHowfigf+L6dSCjCFiBUpZx+CtbsH4TLCZ6EKAbqyogVhwIkLpDRjSczCi0wSjU4ISGNRjXcgCK4QgmTdLHdSGbriI3FKACEOdNRzOOxAQbw4syFS7tPMmY9Eob7rYsYuCbbfjhWIH/zLEGKZdddFwMUqqQyUHyIAmJU3mYkoaf1YNAp7voK64Qjk2zP1SljFEj0sbxwowmT+dzMnpYyA8TCeBg+gLB9kt5iv0mHp1pnAZCWqye/Xpx5isVUUZuGr6Gd9TXYlAdnRQdUXWVwfyO1Uu1mNu+hE/L/6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9e50f75-6dd2-5845-77e6-d58ece774f77@suse.com>
Date: Mon, 13 Nov 2023 10:19:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] x86/time: Fix UBSAN failure in
 __update_vcpu_system_time()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231101203737.3441425-1-andrew.cooper3@citrix.com>
 <7ca0ed7c-e797-7894-80e6-5d6497db9a99@suse.com>
 <e8c03b95-2b17-4d3f-af1a-4dd53e57f9d8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e8c03b95-2b17-4d3f-af1a-4dd53e57f9d8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 2119ca45-3631-4d6d-90a6-08dbe42998aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/KpbQOpeLSwxwEnhS6fyd6xV8IOfmgWoFmZNft3Sn0Bcr2LGXeFRBH1FId6amOsujSpuuoRI2IQwV/A9ov8vAxCTjcc4h95sMYo0tzpTYp7RNTvflWEbolgwtqvreR6dIuy9JbWN7P5NiZrOzxK27odAUA0es3+PMCHkGUuq/8G845vBM4KwDaMFxIKBUdGhIdLh34gDL87q9PJb79dFg3elGHpNNkQ0P9P/XoCW3dC2cs5cS415YdDFhJYRfAQpkT5yG9f1GfXSHO/aGzjqZ2eMkJiMNKayCzwQYvfI4+ui8766LbuzswFtLQVdAhPnGzHcCx2zlwwFB9OAeK9pa1R4IGXdCBmt7b061b+aTzkbsgyFcZype/xiyfUP5kH2V+mBcAvrfuQ2sxfeq27H0rm5NZrap6z/7LEZfTTQmNy4cydde/oiJ/817Jt9RscfxRo56WGEZ8+WrKAbQEgLkzUnQBnAJMqi533Uq9uleRgURcdn8CkDoKPsTzec45LW+MfY0lmFyJ1p4nwOpziiWOyerh5VmPczsBj+04zf4fG07h7U/ZJHUY29AQKKkIgHlswRxearnmkFwPN6hoCdKb3cEHbuDeyFlH8zLbUzX6ddf882jUOWOkN40dsNcerxymddN1YhYZYOnAvz+mZ3GEAGlUAsGwkmxHcMFL9Mk4n0kG4z/YlJPsVA51DeNxwGqIAVhosAoNMK3U9n8mvv6Z4hcVz2yhaNms97XeRTSFcbs8fWDw0MkF6c3a7KhDhb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(54906003)(66946007)(6916009)(66476007)(66556008)(316002)(478600001)(6486002)(86362001)(5660300002)(31696002)(41300700001)(36756003)(2906002)(4326008)(8676002)(8936002)(26005)(31686004)(2616005)(38100700002)(83380400001)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVQxU0EwL3hQbjc0WnVuNm1DeFYrZTJrMTdwNTh6RTJtd1Q4K1h6akNNY3oy?=
 =?utf-8?B?TXpGTDhWaTlaR3lOMTJneVl0SlQwNFBYeWQreFdReXNVamkrUzNBN01ScDk2?=
 =?utf-8?B?OWoyVjhHZjNJVjIrdzF6czlSejdWbS91UmtERDZIOEZ6UkhTL1laaUZXVDVt?=
 =?utf-8?B?SUhDVTVpR0tBV1lMaE9TY2dtdXl0bGZ3eXFkcnpLUjRoeWR3d05vRnVnQ3l5?=
 =?utf-8?B?MTVUdUhqMm5qSFowcDEvL1hxbUxkMkt3YUhWRWJrd1B6cFJBVnNJOWdpUEZ3?=
 =?utf-8?B?c0txaWJ6Ykp6YXdVandBbHNxQSs2RWxMNXdQS3dKdzB2dHpNdmhWSXVaV2Va?=
 =?utf-8?B?ck1Eb3RXOWgxcjNySDU1cUJkdDUxUEphSzV3b0FQM01VdlNtS3ZEZkpIbllP?=
 =?utf-8?B?ckJpWSt5WWwveDlCRnVWeitodVBkZDVNdUU3RXhpU3dQaGRCamV2bU5yRml5?=
 =?utf-8?B?aE9MQ0l4OFR5SVExajNrd0lkclpiZFl6TTlDTzVmRkVnSmhROEdzR0ZNSng1?=
 =?utf-8?B?dFV5ZnFoVkFjQWJIaWN2b2N3RXRnNTJpUnQ1Z3d0c2lLUjk0YUN5WEw1eDhX?=
 =?utf-8?B?cVFKT0hjRWtwT1Q1b3hNSm9Ob1AyejlhbnUvQnlKOFpyOXBRSXlnR1gwT2Zu?=
 =?utf-8?B?U1h3ekh5WkhIbTQyWFkxODF2T0ZNLzlhV0czbHpqV1RNTHk5L092VzJoUnRW?=
 =?utf-8?B?eEZDL0dDM1QxY0FRYmJuaStudGw0azRrdGJXYjJzcEtpaTdpWTFLUUNOM2p0?=
 =?utf-8?B?RmdJVDBQMnpIQmRrRUtoa1lvNFRCRkdCeXUxRHZxQnRCdkJoeU1qMDI0QmZn?=
 =?utf-8?B?ZG95cWNPeVdZcTF2dVd1NHJzSVU2RkFrNzBMREtkVmIxU1dFaUJDMHVHbDJ3?=
 =?utf-8?B?NWZwaWJVWkZSakIxTW1TU2RFcElLWjMvMXpYbkxoVUtaaGoyVmdBNU0rMkNk?=
 =?utf-8?B?b1NFdUpPY0tkTXF4dkxSOWIzMk9leTJaNEYyM1pYZDFuRXA4Q0dlUHVKK01n?=
 =?utf-8?B?dWExZkJzdHV2Z1ZQQ3U3K3pxTFh5aUVNQTlPYzgyWVV3ZWtIWHptais0aXRs?=
 =?utf-8?B?WVNmb0FFVjNjQ2ptRXpwOHpnV3I0UmtWVTR6cVp5Vm9YTVNDRG9FakRMZkVv?=
 =?utf-8?B?cTl2SzQ0Yi9lVVNrTFpqR1RZVnJCRnJoQmJSNWpvUWFDem5QSlUxV2dWVWFT?=
 =?utf-8?B?WUl0SThmMXg5UVN2c3dBSTVQOTk1TXdNQVFYbjN4Qk5IcGh4SzJOaFJBVmFP?=
 =?utf-8?B?STgzNEhLWGdkRFBqa09vdFBaV2ZVSUQzOVgwR1hWdnQ0YUR0WDdLd2E5VXhI?=
 =?utf-8?B?dXpTYzlVOFpxNWpnMld1NFNnOVJYeW4rNnh1TFRNdXNnYTBNN0kwQWFlSVB4?=
 =?utf-8?B?VWwyRmpObTZSbllmWldQclNkUnFEbDhoTGJHMllsS2FCbWlzYWZTaUNvY3N3?=
 =?utf-8?B?MXBmOUh6WHU1eVhKemQzZEllRDhKQ2FvWGwyMVA0Ym1UZUwrQi92Vkxpcncx?=
 =?utf-8?B?bm5sKzNIK1pTbmtyV1IxSXNKc09VUlkrcnd2cHZkeHZBemFOTjlpQkxZVk9B?=
 =?utf-8?B?TUZjYm1SM2ZsL1l3SWl0ZGRHK1RnQzlTUWpJZUpRWFlKT2U2eGNadkc5YVFm?=
 =?utf-8?B?dEUxNmNEMWwxcGQ5aUFJTzd2OGhJcHpWYlZUSTNaUXpITXZ0ZW8xZ0E1VWVE?=
 =?utf-8?B?ME10M0ZxeS9SZXgxUWQwNHZZTXdSaXBmc2RRbXhrUWQ0aUZ2U1BVNVpEL0xP?=
 =?utf-8?B?U2x0MVIxVHVrZ0pDNUlCYi82VS8yaEMzYTFJMzVhUWNQT1JTcGRBWlkxaDFp?=
 =?utf-8?B?YUp2YTBsa3lQUmJEWjBwRkZUbWVTbUZiM1ZWWnIyVXRObHRvRTZzN1RhYVZ1?=
 =?utf-8?B?a0dCNnpyS0pmTFBHWENhOXVaMC9PM2loM3FQdVQ3SEZEVklZMkFsUEliT1VZ?=
 =?utf-8?B?M1FWMmNFL3NMS2pDcTdaQmJRN1BwTFlnT0Vna1RTWTR4YlNsQ1p1cWY4YmxP?=
 =?utf-8?B?anMwb3pSRVdwWmlUa3NHcTRWNHlpTzNsaGFTeFlkUXEzUHVhUE5UbWtnSFBQ?=
 =?utf-8?B?elVObFdVZ25mZkF4RS94UnRpZEExeDFETE1SVWlJZkhJd1dPTk1UNzZaSllP?=
 =?utf-8?Q?o8eQBLDKU2hdNgUFcw/D+sEGo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2119ca45-3631-4d6d-90a6-08dbe42998aa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 09:19:11.0334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HePJZiAZ/J/7SbegbTS09eDLHQJVY3USTHMZZDX52zf7OYY0MJLIBmMUAydJlsOlaJcoZBKgR8QAimz7Xs8Rww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6932

On 02.11.2023 20:05, Andrew Cooper wrote:
> On 02/11/2023 8:33 am, Jan Beulich wrote:
>> Furthermore, if you deem this XSA-worthy despite the generated code not
>> resulting in any real misbehavior
> 
> ... we've issued XSAs for this class of issue before.  XSA-328 is the
> one I specifically remember, but I'm sure we've done others too.
> 
> In this case, an unprivileged guest can control the NULL-ness here, so
> if there's a practical consequence from the compiler then the guest can
> definitely tickle that consequence.
> 
> Alternatively, the security team could decide to change it's stance on
> this class of issues.
> 
>> , code patterns like
>> (found in free_heap_pages())
>>
>>             struct page_info *predecessor = pg - mask;
>>
>>             /* Merge with predecessor block? */
>>             if ( !mfn_valid(page_to_mfn(predecessor)) ||
>>
>> or (found in get_page_from_l1e())
>>
>>     struct page_info *page = mfn_to_page(_mfn(mfn));
>>     ...
>>     valid = mfn_valid(_mfn(mfn));
>>
>>     if ( !valid ||
>>
>> would be in the same class (access outside of array bounds), just that the
>> checker cannot spot those without producing false positives (simply because
>> it doesn't know frame_table[]'s bounds). We're fully aware of the existence
>> of such code, and we've decided to - if at all - only eliminate such cases
>> (slowly) as respective code is touched anyway.
> 
> I don't agree with describing these as the same class.  NULL deference
> is different to OoB, even if they overlap from an underlying mechanics
> point of view.
> 
> Nevertheless, I've raised that "valid" pattern with the security team
> before, and I would certainly prefer to express it differently.
> 
> But neither of them trigger UBSAN.  GCC can't see any wiggle room to
> potentially optimise, and I expect it's because __mfn_valid() is in an
> external call.
> 
> If we had working LTO, I'd be interested to see that alters the UBSAN
> determination or not.

I'm not convinced it takes as much as working LTO. With PDX_COMPRESSION=n
I question __mfn_valid() needing to be an out-of-line function. Converting
it (back) to an inline one would better not come with the risk of breaking
certain use sites.

Jan

