Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9435EF4BD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413691.657501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ods4Z-0003ft-TC; Thu, 29 Sep 2022 11:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413691.657501; Thu, 29 Sep 2022 11:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ods4Z-0003dR-PX; Thu, 29 Sep 2022 11:51:23 +0000
Received: by outflank-mailman (input) for mailman id 413691;
 Thu, 29 Sep 2022 11:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ods4Y-0003dL-6A
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:51:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08dc0cd5-3fed-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 13:51:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 11:51:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:51:18 +0000
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
X-Inumbo-ID: 08dc0cd5-3fed-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjI51F9RBc+L/9/ya6KIMWisD5uK1+DLpiZ5TpuETCQgCC/lBg4b8REkB8XzuhFCRFjtYgYWst5VT5bTN8zCV1yTMmraGZ74MMiuqtkF99c8ckTxuH8fc27CfSHrfb5vvCUfOEfXyduRHCWVTlMpWpGkObbbDoM8B4TtQCxShlzEvb3Ewcmp2r6MF7IFrHpAoJosoJgfhm46ZxdOHsM7xPqGv8zsupmI34K1IymU/K+BW5yap7Ckp4ZObxAIBKu8Z7dSq63dF+IistzwWyWmuIfzTRIMZ3twZqpU1lVew2asD/EfBfSYiH1LQoI6rjOseXuNM0BM9+S5uzL6kRVBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2PtSB3OT0mrizKCvgBTMsnzXOjkkCSAzDqw7JVJSiA=;
 b=eAfJDaOxOEvI9/53tBPx4wN9GZBZkY7nuY9ASjvIdvIflWVe1toFaebrFpcZ1kQVOTbRrsAhmtUMX6/OFF2/RBdaDUs6N8OOH3gC6g28MhNLpHghD7F17pcIvEn96LxZfR2kHCrWOkVubYhXWGjwWg9bdz2XS99hJOgb2vT5V+d5TJB8W8G4JO1EI1MAFGnnPT3Wly8bFtPF/8ePptDtUIKLptz0ily0bG0HGt3J7i7lDbcD2xOLW04Yp6j48s1kmxLxREramd+BNerwmKA6l5mYi6fPNkDLn4NiM/jtl9O3xktW2SHcwKSONPVm3c2ZeDj/h/W9LOw3ExfXsCn5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2PtSB3OT0mrizKCvgBTMsnzXOjkkCSAzDqw7JVJSiA=;
 b=WDqRn+eubXHmjWKFHitSNCYr7SACDzYyhANB9vtPs2i7ai2Ye6Mb61fSJy3CjsDv/unbbf0mmypW3mks/Sy2v8uqJwpRNpbBSS3lQd8THmNcmDAFhtc3siZImy/Nioi/f32PzckZGgQ4VgkCV3KWFrZADWOA0yN0XKBJxikpvYuzEMyeyVjUluT6SF8KuQQPMXzMZC7YbcWIpqsbxjPslx9GNSGco4pn7BxgT2yIKehrX4Y5UFwkXuEDrA276yJpX5BkcxYbP4Qrs4IX/dbBo2eKtrV1H7XjqsdR/WcaHNW7I3AKXLx4EDr7qDgEm0qt8rknOhe748aoZFdZz5YoWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98012eb3-a591-e6ec-8ce9-baf00506992d@suse.com>
Date: Thu, 29 Sep 2022 13:51:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2][4.17] x86: re-connect VCPUOP_send_nmi for 32-bit
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
 <8b5c0b8f-b243-47b1-2ce9-f315d5c7138c@suse.com>
 <YzV9cQboU57K/hcB@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzV9cQboU57K/hcB@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 67938630-4d63-4309-5139-08daa210eba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MxXd3qrP5pQkbbrhlY47c9SXl0CLRpu3oLpAz9eiZarNnAotHgjSwG7a50bCpJgAfs+zqDMmfb8gOCUr3lzlwyNlE6egHMD419LiNb9/lYiLqhBlu5MnvIOmjnaCbrJS/ee5hiligaeYtHmIG+vE6640aplFCNJ/ZQP5k7Q7QGsHDcdVVVU9OLy1wOpNTJSzbtGg3OpYU4JuxSXX+RUCMKmA3EOGccI7m1FvQ+yOXTnDX20hHUgdB7qx+t+5XUQ7vpOYO4SrntSOr/DjbmZO14kSPW5chK0dzN7bt8oCWQ3BKAvEiQep5nudqVW2dwDqTL3EPObVKFVsQl5QVeFgXA4ZJ1kz928yTYdViP4g+nIBRqs/LZU2LTtfowAXyzJWpooGil1eYCotODdQj2w0fvtnv+QgWvY2iw5XsvqA3iI5beCTKTigfeNYvOtIMPYDQE7Fxp0FeL43eDW3xHurYLXMKI13EesXVWOErARvrp7JoRHf9R4gDGlYtB78KHmcX8Gvgr7rLNA4VchRc5FwKKs/2ec47LtfwjlQv1AS+oWyQHWHxFub5Eag/xqtPuVmccpUMvwAylEnMldY/hoMxfGM13rJr6DNQ1kDC4MYp9FfXm36h3Lql6X5Yd6LG1xHtByO3f29eVjt3UV8yA81k0IDVsiIU3R7XBo1PsXmZWik5sIegZW09VrLcwRbrKdL7mIaK20JkZx6TFZ6sHIZokJz3RIAJFfI1+rlFXL0m3AeejZHoP2/Vf7ePRP7dYQj8UdkyMAQdb2paDnXqCRg4AYK9EgGbjX4xYv1EsvPsOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199015)(31686004)(36756003)(5660300002)(26005)(66556008)(6506007)(41300700001)(66476007)(8676002)(4326008)(86362001)(31696002)(38100700002)(83380400001)(2906002)(2616005)(186003)(6486002)(6512007)(6916009)(54906003)(53546011)(478600001)(66946007)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0JXNUdNMkpoOGU4Z2l5RitDblNJaFpWdVVkc1Avdk02Q0dYVEZMVFk1QUZY?=
 =?utf-8?B?SkwzV3ZCbHFDSHJuK1BUeEwxWlRtN3pEbVBkWGtseW11akUraElUWXQ3NVls?=
 =?utf-8?B?VFphMGlCYjV6TDBDU1hCS0syZGt0WDlOSFVwRTY1QW9TQU5vVTl4TnhyZ1pH?=
 =?utf-8?B?SEdwVTgvcml2Y2hyT1UyRXVZT1A4bGFzQzVaV01FU29VcWdhNU5waGpPdEx0?=
 =?utf-8?B?NlVnT2V2R3E0NGRDdXI4THhXaVczdkQvR0d0Z3pNV1hMTkZzeUNoYTcvclRh?=
 =?utf-8?B?N1lOTDVTMCtKM01GcElvUWVDd09OYWgwc2ZPU1gybUJaWEtUMmVaRE8xQ2RW?=
 =?utf-8?B?T3RvRWFwUUdOZnBzcEJzUmtJcFBmNUJoM296c1NsNUxSWmFPQmVoY2taQWo3?=
 =?utf-8?B?aTFQQTRWeENieTRjSHkvVTVJcklIcjBZYTBJNEhPZ21NbEY4T2pEYkRUTk1T?=
 =?utf-8?B?MUlwN2tNMU9kYnNVcklHMURhOVhwYmJNakpQTEJ1L1kvN05VQ2tvYjl0T0kz?=
 =?utf-8?B?Q2lTTU1WUVN5YmdNbzR4UW13MU0rLzc1YUlxbXZ6dlBtWWw1SERyZ0tRRzNp?=
 =?utf-8?B?Yk96TEw2cXpSZDdUWk5sNlduOGovbXVMMmhPbGFOREVQNDJjVVlLV2duOVVQ?=
 =?utf-8?B?WXE3UW91Zld1QXBUL2Z6L3MxWHlHWkFtUWVUeU1OZUFsNEZKYmF5aEtWdWpI?=
 =?utf-8?B?cUdaQVRpckdOTENlY2ZzTzNreXlwMU5tenZiN3Izc2xZcEpsbTdGQk1BUm9W?=
 =?utf-8?B?WFdXTjhmNmpiVU1pSTJOV1BkaFNqRUNtbHRrUzVoRkdudmpuaHN0VHFHaG9T?=
 =?utf-8?B?eTR0S3M2bm8wbC81VmtaeFNmUEZsQ1pmS09BOUpneWtNQjJKSVhUNk1ZN09F?=
 =?utf-8?B?eXZjcC9zd21jY2FWWmEwbnpXd3Z0NFliOWhHS0VndllsSWJhbm9tTldON0RH?=
 =?utf-8?B?cU5lR2MrUFJNSFdvd3BUbTZ5Lzg3c09vZzhieVN2WXdQRHlyTkhEZFMyS3Mv?=
 =?utf-8?B?Ly9QS0c5UDVKK2NmbytqUzhHTG95VGJVUng4dEpWb2RpbHNLUENSQi9BNVEy?=
 =?utf-8?B?dVNmNXhweGpDRXZ5c3g1Wk1xWm44Q0NxTkRXaXRadjUxOWpyV3o1bFFLZ1ht?=
 =?utf-8?B?T3ROZGN2QkdvN0swdGNRZEYxS1pxdm8yQjRPNFRqa1AyOWZHbWRJL2YxQVNY?=
 =?utf-8?B?UWp0M3BvcFB2bi9LZElDVllWcjk2RiswaG5zMy9abTFXcEdYb2NHYWZnbGlk?=
 =?utf-8?B?akc1MjQrZ3NQRVdMQUI2aWp6QXZCN1FVMlZFR251eXZaUUJEbnV5ejFUM3FW?=
 =?utf-8?B?dkJOY3Y5TFBoNVNTSWo0QUljM21yRkRXTm1WR21vNkx2cDJYZE9iRXVmM0w1?=
 =?utf-8?B?eU1EMnAwNHZoaUdGdlRETjBJM3JMOGRwUEpLelFNRHRYcVpISHR1anh2a2Vr?=
 =?utf-8?B?Z2Ivb2lwbEJ5S3lMZzNYaFd3bEtRNzZieFJLdWRubThMbFFYeHBiVDh4cjdF?=
 =?utf-8?B?RVJNVk9FNzAvQ2FzbWhBMlg0dTlISnhWYUUxcThHV0dzVzUzbCtPLzU4YXFj?=
 =?utf-8?B?T2E1RWJYWWRMemMyTEllWVN5cTJ5WHRqUURIbVRGdlorSEFwSHh1V2tzMzY0?=
 =?utf-8?B?MWl6UzVGMG9HcGljSXZobEdpSmxpRjFHQVNKTVppb3pTVVJndGs2NUViOS96?=
 =?utf-8?B?bkl2OWxURm5zbEZnL3JTRlpBSkxhOThkbjJteUYrZGJBTzZsdVl2L1Jjd0Vq?=
 =?utf-8?B?bDdSUWNWWjRlNTloMWtxaEp1L2htWTI2Y1FaVkFseTd2aGEwZjU5MnJka1Yy?=
 =?utf-8?B?Rnl1d3BUeWJiMm8zNjdWdVlPS2p0VlVpRE1nUFYwVzJyT1BMRTk3a1AzSTFs?=
 =?utf-8?B?QVZIRzNxOXdIQlhyQmw4N3NOOFE1bjZkVlkzR09iZ3gybzRsNUcvT3ZxTVZM?=
 =?utf-8?B?ZXNwQnl4Y2F4d1BELy8xZHFrbWVYQjZ2QUxCVWVrSzlpdXUvS1pzNit4aC9V?=
 =?utf-8?B?MG5LTk9RV3MrMW9nQU91WHF2YUIxa0ZjYkw1WE0rQzlmRUkzbHNsMk9UU28w?=
 =?utf-8?B?UC9SZkNmd2M2VXpJajl0VDhTeVp5cExRZ1JZQ0x5OTBJWWh2bXNaMzVPNjhF?=
 =?utf-8?Q?UbWmyHvoc2zAjtTa8Qb6GasgK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67938630-4d63-4309-5139-08daa210eba7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:51:18.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhHeH5d36/Q1+Fv2hervA5+ilRdxAjsNeH/czMxPF9snFUwNwFxRV7VJIpptM176jY5TtfdQbkh5/x1Htn/FOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515

On 29.09.2022 13:11, Roger Pau Monné wrote:
> On Thu, Sep 29, 2022 at 11:51:03AM +0200, Jan Beulich wrote:
>> With the "inversion" of VCPUOP handling, processing arch-specific ones
>> first, the forwarding of this sub-op from the (common) compat handler to
>> (common) non-compat one did no longer have the intended effect. It now
>> needs forwarding between the arch-specific handlers.
>>
>> Fixes: 8a96c0ea7999 ("xen: move do_vcpu_op() to arch specific code")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> This seems prone to errors, I wonder if we should add a note to
> do_vcpu_op() to notice that hypercalls handled there need to be
> explicitly forwarded from compat_vcpu_op.

Perhaps. I guess if such a comment had been added by the original change,
the mistake corrected here would have been noticed right away.

> I've also noticed that compat_common_vcpu_op() forwards
> VCPUOP_set_singleshot_timer to do_vcpu_op(), but that seems to be an
> useless jump, shouldn't it forward directly to common_vcpu_op()?

Looks like another (less severe) oversight, yes. Do you want to make a
patch or should I?

Jan

