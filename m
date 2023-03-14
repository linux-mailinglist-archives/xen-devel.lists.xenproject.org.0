Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22236B99E8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 16:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509717.786031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6is-0004L5-QD; Tue, 14 Mar 2023 15:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509717.786031; Tue, 14 Mar 2023 15:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6is-0004JB-NB; Tue, 14 Mar 2023 15:37:58 +0000
Received: by outflank-mailman (input) for mailman id 509717;
 Tue, 14 Mar 2023 15:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc6ir-0004J5-Id
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 15:37:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 309b5c6c-c27e-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 16:37:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6931.eurprd04.prod.outlook.com (2603:10a6:208:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:37:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:37:53 +0000
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
X-Inumbo-ID: 309b5c6c-c27e-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et/3A48iTeudzBqyoBLzrSin881ulo/ODxHucmUTBhaEvF00na2K2NF46243kxsI0mmmWF2Idzk6kqx1TcmTPE8DxzVlfR8uYJiv70JRKVWqGPuRfvc6tAN7JYvrplROOV7BuSqz+tw7La5DgplTq4q/E54PpHpLsWw4jXFRzJ1vdvlO2Pig2oGZz2/SbQhSY1EDNfvybOduSZcjYtXFRnBNcZjCLhpBmPlV3J71wFKAunmgMh3Vd7OlsRnmBZrshvTJ1K+A7b1F+1PgJ81RtmGzxHpyAcQmHPKgu7FFvZCr8WiVFXBYSDjba09b5q2egJLm/brXY9TgbXG6SWmqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnbAd56Khn/dLy/qQaM/IW4PhtzO3DQ7mpq6dIXg25o=;
 b=cmBWA4vEPmPlNcgSbJf82bcYzNp1VMPIBsTAFTr2reV+yHjVL3bKqYy9zygOjsghen/Gp8pcOAkBaZ3AtqCah320VWZXRXNMz1OkPXbu+nZRU3l7rwBQuR+TD+NHbHHug6zg4tJrmI8p+gFEwdwAVvUf9az6vSe8+vrejy9enoS28thy2RbPyge/RwFXCx8Rr9QVEgfaPwuHz4kGnnDU72peL56gd64Xozynlz5nHpwqDbS8Jj6Bl+/+1mgg7ENqRHps66ekd4rV9N36QkqrHfW65DYQe43duzs9/IdttPbwwVSreMKlSir5co8Vn6TBwlIbWsZO80pfzE0MYSknUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnbAd56Khn/dLy/qQaM/IW4PhtzO3DQ7mpq6dIXg25o=;
 b=FK6Y+TwF4q/NgjcfCZNeW1e9W3vf/wjcpWUkeAeG0G8Qv3i+U0bXzBPE23q7W5Ju4G+FproevTEYKhlDkJbFycR1BY4CfYiROUXl0h2dk8ugZBPNIgoyCEBkLBcSa2NlhPERr4VrSaVl7KDC4IsWemdeL+KqZzIUsQ8imEEQauWeXcJqwpoXNrg5Xi0BbHlx6wHHw7KUc4qf2pRGqi4tkKHHiHcz3ePoUvZr9FBxzjQ9Fz0DIDa53OzZpUy3J+ItFK944AOkYGbUR3jc9r5HO5uP40AxHV3HdFAt5+TINFSdow6B9qhyaJGkFItB0vlFKI8vrMESZeYGnlCiPdd9PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40da0146-21fa-d5a9-7ae1-4ed2cf4a5785@suse.com>
Date: Tue, 14 Mar 2023 16:37:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Aw: Re: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression
 from Xen 4.0.1
Content-Language: en-US
To: Denis <tachyon_gun@web.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 344c4733-9d9b-426f-55a6-08db24a2137f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZcrL8XNYSJg5b4j+xfe4yygmMZ3o4fGzmlDsRyxWhue7vbvUGNzeO1+hpqQJeWi1RzTF+n3u2PEP4GhiSsYs5hkEYJoqNV+78F+Ph053TLs/F8GRImkZQo0RrzbGp8e3Xf/6f0IFoA/KNQSYE7TIsk17Mkk46Fw2URTVdJOnU9maLsZuBArJNldcjmbh93FGZwK2c/VQ433bGwDmr3Wst+5h2R/VBJnxCm1A+mdO1cclr0LBuWsEE+X0uCWO1JGvD2uLpVXTCwvjYf+R52DflVkRL7ZE2g3sNJB6J28iw7/w8TT7J3QPwA/TtBOC0dR1i4RkLHWvl89Q5eVawG4fTmSe77lSXJnC8ycD+eEWn5mJhf+NZnPqDS4SMkUlyc2LhmmEpPZs+5z+QE/VwuSRPfUXa1kGRCKlzsGsFUgg05eQMjbvOB22gKzdVwLacwjU3rRsUPoIHwk8uYFI7nWSsOEfj9T7EIijFJV324c1szf7pTRuYmhrs2iXu7viN62Tw4JzPtzbNQGKA7VR5BAaxo6b7V/C6Eg6dbp76OWD/VULBFWSbgenZ4f6u2xc7wrDNV/hXw7MSHRdqXKF3e1Z2q/NIMuZEnTUq06J1CNJ5u41yLpZvXGInS05B/qG0doV8wc5soxfWIaHCmjZ4KtvWBRGKp+8oXHytTfXlnepPacc0/vwqkKiQ9kxSpB+zNuJU73UD07R2D0oQrP7OhRowoIiVjfTN9ajEQkU4wH4cnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(8936002)(36756003)(478600001)(54906003)(66476007)(316002)(66946007)(66556008)(6916009)(8676002)(2906002)(4326008)(41300700001)(5660300002)(86362001)(31696002)(6486002)(26005)(53546011)(6512007)(6506007)(186003)(2616005)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFNsdys4dFFjL2EvUkFGS2IyRmVNa2tGWTVUMVhWSDFDbWRiZVBJNmU4T2VC?=
 =?utf-8?B?T3VLT2VOMDVRekFJc0ZkVFVKNjhpWGtaZnhQQU53NFY1STJIZkNuMDVObjRG?=
 =?utf-8?B?ckN0NDVwcUNOL0JCR0dpdVMwM3pwMkZUODh2T2NTdnpydmY5ZUdFU0s3SERy?=
 =?utf-8?B?SjZrTUtWNE43eFB1dmNSS0xQZFpLZHNBazJDcEdHOG1keDUxUzVGZVJ2azRT?=
 =?utf-8?B?ZmZiZU9UeUNuT2JnZnZFTmMxWWU0QjNpVEd6Y0xQaVV1b3ArazhHSFNXNTJB?=
 =?utf-8?B?WlYvZVc4bTFOY2JGTG83YU80MXVFL2JjK2xHdFFkKzk4dkxaK2pCeXVKMVRm?=
 =?utf-8?B?b3g0ZUtuZFJZcXhnd1ZGcWdZK3c1RmdaQVpUSU1XQlRQMm40ai8wT2Q1K1Y4?=
 =?utf-8?B?ZTlEMjk5MG9oMXgxV2V6WnFveGZjK0Judkd4ck4wNDl4Z25SelhuTTEwRmZl?=
 =?utf-8?B?M2cxMkQrUHBRTzJNRElpM1J3SHp0NWhvMmd1bDJLRnhyaHR3V0ZnN1N1Q0ZT?=
 =?utf-8?B?T3JzcEFrSEpjTzlyL3loOFBPTzVySzZyc3VjSlhCWStzQ3pFOGJoMHV0cksw?=
 =?utf-8?B?Z1ozcWgrL2ZpOEpwTG1ucFptekhpTnJrV1kwenVwL1hzS1VRSXZjUUFkNkFF?=
 =?utf-8?B?Vm5iNE5oVloyellYdWJCSk90R0YwVy9RQ3JaazU3TzBLTWtLQWtGSkVFbytj?=
 =?utf-8?B?UG9uTGRnZDAxOWpaa0dnZjRvNDVwR3BOaHdDbEpmTnF5Nm1sR29wcC9ObUN5?=
 =?utf-8?B?TkdEQWRSWjVLdkc0TTlUcGd1eWJsSm1wL2Q5eHNZYnRDaEFlQkRrVmw5bUZy?=
 =?utf-8?B?N3BrREJHSFpJckdOaTJSSVZFNzNiejlqVDcrWkRyZ2I2NC9WNE1wV2V6ajhQ?=
 =?utf-8?B?aGp4U2NWYXZac3ZTOWZ5UVlqdTJLWFZqbjEwdis0aWh4WUNjNnlSRHV5aHRo?=
 =?utf-8?B?aEVsWXh0dWgxZUhtQzhuUmJ1QUJPVzBBSVRuU2xiQmx0SVZqQ2lZZVpMNUlG?=
 =?utf-8?B?bDRPeUF4ZEswZ0V1dlVFSHEvclNDa2ZKcGlmODhPTDJOdHoyTlFaZ1J4Z1A5?=
 =?utf-8?B?eHhLRGVGdlpYREJEdHVIMUQzUit2ZFRlakhUZVh3S1E0OC9FVmlSMS93b25k?=
 =?utf-8?B?SEdyZDBSY3pVUnZ1bnBSMWhBeG9ST0tVdmdyY2YyWHkwL3V0WHBDV2o3dDla?=
 =?utf-8?B?b2JwVzZ1TnRqdFVWekxvZHFqOXJia25ZQ0lERlF1Wi9UQXhpUzEzNUpvbEUz?=
 =?utf-8?B?RW5sMTdnQ3pJQ003UFI5czRaeXg3SU0rT3gvaGVSNytWaTlZMlhLSlVzSjZy?=
 =?utf-8?B?ZFU1MU1vNndubElmYUxYVlR6UVIxcUMvaVh3VVRCV3hLZ2g2bG1ZRHBVZG9n?=
 =?utf-8?B?WFhiRDNIK25PNlhId2dDTFVJa21CeWozTllBYzFlb240SFpDWnEwUnAvWUtP?=
 =?utf-8?B?SFRHRXB3N256SUZFTEFPY0p0SyszekExR2Vua2k2dFlrNFY2NHNKL2hHelBC?=
 =?utf-8?B?N29NUXMweFFLei9SNm9DcjBrUEZHcEpIR2JrczA4STJKRmorTWY1bzllZ3ZP?=
 =?utf-8?B?cy9Cc0xtbk9kOTdwVWlOWDNTY0hmN0UvTDdFZ3I1UlcyRDZKWTBTZjFGeGU2?=
 =?utf-8?B?ejdpNzY1cGtvNXVBWitsTEYxWnJIeC9IendQeXEva2xkbUFqUWdzQnVBaHRs?=
 =?utf-8?B?a1R3R0hoV2pla2VENGpUcDg1UE9DM1h3L3ozZmkxSHFScmdMV0g0L1dtcHgr?=
 =?utf-8?B?T0t4dHRsSnB6THBVbU8wdUxEL0xzcWtaVitncVVrU0pEalJlM0I4V014cWdB?=
 =?utf-8?B?RDlHRC9YbzdjUXhpVTdyTklOZzlWblI0TE5LSmVZUlI1RnF1TC9nbm4vUk80?=
 =?utf-8?B?NW5DNVRWYzJua2lWUDRQMFZjcjJDa2lFV1JQSUZpUTFRVVNwbXp5ckxYdVdD?=
 =?utf-8?B?SGcwcXBxeVJWVG1jb3ZWYXZhQzFEN0ZkMGxlc0diN1pKcTBxMmJCUDI1akJi?=
 =?utf-8?B?TUkrV3doWVpxeEtFSS9QTlEyVnVPQ1FEQ2I0WEYvamF3SWk3Nmw2cmxJbWw3?=
 =?utf-8?B?MldNN2lRMTE4aGtyU3NOeld1Zm42QUpqekF2V1lsU3BWaUtEaXpYc0Z4NEFt?=
 =?utf-8?Q?jbHYG5FZiqwl4T2QT7TO7ZSs/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344c4733-9d9b-426f-55a6-08db24a2137f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:37:53.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d9SHAuhrmN2BKeLOfFRJZtbIE5CvuOu7elusIffFCo+2AiRKlp8omkh90pHEbDu1JcVMXrfqE2pUZwfeGuClw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6931

On 14.03.2023 15:53, Denis wrote:
> On 14.03.2023 07:37; Jan Beulich wrote:
>> On 14.03.2023 02:15, Denis wrote:
>>> On 13.03.2023 10:36, Jan wrote
>>>> On 10.03.2023 21:50, Denis wrote:
>>>>> Should I test something else?
>>>>
>>>> ... there was no request for any further testing here, for the moment.
>>>
>>> ah...sorry, going by "Would be nice to have this confirmed forthe system
>>> in question, i.e. without Xen underneath Linux" I thought I could test
>>> something which might help shed some light on all of this.
>>
>> Well, yes, that Linux-without-Xen test would still be useful to have
>> results from. I didn't account for this in my earlier reply because
>> I had asked for it before already, and I did take "something else"
>> for meaning anything that might have turned up as useful from the new
>> data you had provided.
> 
> What tests could I do or what info should I provide to help?

Boot plain Linux (no Xen underneath) and collect the full set of kernel
boot messages (some distros store this at /var/log/boot.msg); "full"
meaning we want to be able to see all output regardless of log-level.

Jan

