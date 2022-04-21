Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17350A042
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310114.526757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWSA-00072b-A8; Thu, 21 Apr 2022 13:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310114.526757; Thu, 21 Apr 2022 13:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWSA-00070W-5m; Thu, 21 Apr 2022 13:02:34 +0000
Received: by outflank-mailman (input) for mailman id 310114;
 Thu, 21 Apr 2022 13:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhWS7-00070Q-QM
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:02:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d54fbcb-c173-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:02:30 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-FgJ1Jr3hNqyOO0yV5wbubQ-1; Thu, 21 Apr 2022 15:02:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:02:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:02:27 +0000
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
X-Inumbo-ID: 4d54fbcb-c173-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650546150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qa9f+bBLd9Ya+rQZ51gVN9YFWARxw6AJJLnAp9CF1mE=;
	b=gtYLn6ZurpE44ogQ/0fRcvJOtXkktRpWN14wyfZNvl0mq20T9ofDS/0t40jzThoUGaBJn7
	eO05dJzEQP0kSH1/uj8LYtq/A2T+dWeWR2O4i6lez6C695VzQRHByb29zxVkXHwCJQGx0n
	e8LDlBV2uBW/NplopL5ZyvrwyUj1g8I=
X-MC-Unique: FgJ1Jr3hNqyOO0yV5wbubQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgvSWJPx1+7FVVTr18oWjqWN/O/EjwX9xUKfl+TQ9ac5FVops9cr5ImGWPx3tImwTrtZtvdE9JLpNxDUeCtCh2Az5VI9NAtrexvvGkwtF47AOpIMLku1odSA2J9B3aVMAZ8dUgZngf6mg+A30dIIZZpJ32jw7RQPGHBJNL+/hjVNoxIj+bMVA94/8c4rp4/pKsMMLJOQKw+vQIyn6xRJLj2JJsxx2JBSP1n0Hnzxjnwpp5Rd+HTZEKtiJANaQDdJKvduV6ohMRN0mGL73zgxsAWjLXr8Wv4LR/Ghnl5Th/pMWsLlBv6ZQx1AQv4OI3N4l9PnrjOmXRkLYMxn/0dc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa9f+bBLd9Ya+rQZ51gVN9YFWARxw6AJJLnAp9CF1mE=;
 b=lYi1i3GxT038jqeiKtuCUcRYWmhk5ccBn4Qp1oC4TXcK/cYHLPGYtOPW7NGqaxITFJqoMajd0bRckhWdqyik7kWgu+fwNyhMvULVEZX4uHdZy0xB1aRdhqF87JKanwcbqb1FsJnc9b6K22/JsDGmN+ZfwjvwD4fwlZ+Afeiu8aHjEXwpsUoGZUfqQ87FL9GPGewP1Y95uVC/pjMwy2oAPZNXbBOTc5l/slCaKdifFI59UGs99qFn8vL5YeDxqhvFMYM7aaLCa5SzooQbhhcRtVPHMrEPuaXbovGC18F1HDZu1duH9fFpn05pyKxTuPwuc2yBvRy9zn7ta1RO1FL3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57858c7b-019a-2888-42ae-7ce9a7c88cc0@suse.com>
Date: Thu, 21 Apr 2022 15:02:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 1/6] x86/debugger: Remove debugger_trap_entry()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420141307.24153-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0084.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64163717-57c3-4fb6-6cad-08da23972fd8
X-MS-TrafficTypeDiagnostic: DBAPR04MB7271:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB72712C92F079A633CF54D0D0B3F49@DBAPR04MB7271.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0jUUKGz/Y9paIaqHZbCBQA39TG5a+8otjhl64AFHbYy2H8F0kHJTUCnQvmsKjKbS2NpCaDOm5jur5pjey1zrK+Gt5LsbOMPSCV2XhWla0Ox9tkMZmhWvuxXMcgOfPnKq2IZoeQJc3+HHJsw88/Qj6mkCczVgm81pd4ad7BkEoG6L11mIjZOJmMUshYnkJ+0klZNjTi4QNMmVMaEiztF6thBXPiGpaq6Gsx/u+/y5DsmoEyzE4h7zt6FJBXuZ7RrNsdicgEQQayBxtw2CfbVXcP0ZxmROLCotQfgBSQEDE/m0piAA3YtQ4PfcKFo27xNMUmtmwZh5tV0yS/CZiD+6HDZhPR5dSi0Z+at+tEb7N3LCvDLI1+GFjxhMua0tsFmmDcC0OLlUNy1blPFRgytmIfY78RUvec1jO0SRIFMjJiFipqI4FwuJXg+ftoyU0sitcBA5veT5boJ6iYMh7gBFd3XDjzeuQkrfWVz1igMWTw0pWdtcIZVXaQvdrUwkS96zmIHJr2Nu/rucaDhrBTB4PNav10pTlIqRTWXEXgTTvPhtrFgi7wbTfXll1wOGbTUaZANAbJhVxqOYa7MU+xUIDn3OhQIZeH8W7m5ZXCax2lxxsvMLuI7OJ1MvDf8G3hqeHRwWPRMKhUf8tGOSYTs1CJvDKYefNvmcvxFJrpZQhlqZCsylBtdP2AITwTx53hS0MWZk4jJHSBlLTfBqbi7f1gR7MTOLD5sENKPAdA4YrrBJwACiyZtC1OZemcHE0Dx0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(2616005)(6486002)(186003)(508600001)(6916009)(53546011)(31686004)(36756003)(83380400001)(54906003)(86362001)(316002)(66476007)(6512007)(8676002)(4326008)(6506007)(5660300002)(4744005)(26005)(66556008)(31696002)(66946007)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE92WFVhL3Q5WUNSMmh3SE4zczNxZWhOSFFEd0FVcHpmc1ZodjVrRnpieE02?=
 =?utf-8?B?Z3pSMVRVc3B4Q2V0TnBpc3I2M3hzSHp3d2xKaHJXamNnT21ScXBlNlVDSFNB?=
 =?utf-8?B?UEQyVWpTTkFTNjdFZzNnL1pLSDRuV3MrZEIrT0VHY2V1R1B4WFd0WXJEOWJY?=
 =?utf-8?B?RnFvaVdJWjEwaUgwV05QY1IycVhycTB3VXVxUkhJU3UyN2ROekN2MW9nVE43?=
 =?utf-8?B?YVo4QVlRMWFoMDhuTjBBZW9mZTJ2QVh4VTRxTEpmaXFNcFdobkxLL3IvOEor?=
 =?utf-8?B?UnVweVFhUWpuNlc4YkZyMGxYVysxeHFsM2NoandzYXRpUjBwRmV3WWRsOFdj?=
 =?utf-8?B?Q2t2QWc4aWd6WjRqN0VVZEplUzczalg5dk93VnFBaFhIMURSeXkyT2k0cWlw?=
 =?utf-8?B?S0JtY2JsR3BSNkl2dUZ0TVhxeDA3Z0NTMlh6R3R5MFNzMnE1VHloaHRyY05u?=
 =?utf-8?B?RnU0LzVxeERvaXBiSmlTQjNaa24wT1NVWitkK0tJZ1VLVjZBWDJwdDFQRnpM?=
 =?utf-8?B?ajRiZ2JiYWhlV0F5RWlLZ1pJQ0M1emRKVDFabXRnTFNITlFBQW1kc2dWRDVV?=
 =?utf-8?B?OGZRNG0xVWNEck5ieUNISC9KQWNHbUYxY084S1RuVG1FQ0kwVW9TL3VYTEkx?=
 =?utf-8?B?WEhiWks2WnlaTnE4OHNmMXZyVEpwdE95cWVBTG0zS0RuZGRjMEh2NVpMTTNO?=
 =?utf-8?B?RmZUcmw3OHRSaThuRDlFOGFmVUNzYyt5aFNERC84UGMwdnpMejQxS0xzaSs1?=
 =?utf-8?B?RFZvVElEcmkyZWJYcm45SGt3ZlVPY3VuUzM4Y2lob0ZnK0djdUQ3Uy9YekFl?=
 =?utf-8?B?bkt4RHNUVEhuYlVESVZSRDVtOVI0emYzMHBkWnNLM05ZRkVwZXBCOGRnQjY3?=
 =?utf-8?B?U1VZWlpCdGhITzRjZDBvVHFyUGxwQ21sN3JLZ2RaQnlXajR3Sms0WU1FQ0Fx?=
 =?utf-8?B?RG5BOXlLZlNTTW00RHVFd0E5VkxRa0pKeWtSVkF1MU1NNjFnWlpuelhQbnMz?=
 =?utf-8?B?eGRPN0o1cjVtaXlMZERlWUQ1MUFhUFE0Mm9UZlhyRGFVa0ovaWd1V1lKZ3pH?=
 =?utf-8?B?eVdMV3hmSmRyc2l4UlRTZFJPTHd0STB2RXBWaGpEV3VHVW5wNkFGd0k1aEth?=
 =?utf-8?B?QjZoaXc4VmQ2Nk40Q2NvcXZKWGoxZkVPWENMQ3BYMW90WjNsa0VOUVdKQWJt?=
 =?utf-8?B?SWFJT3hXSjFmV1VnengzbTliMHQ1MHcvSlU3YThVL3hkbHFtZXNiUHRDdXp3?=
 =?utf-8?B?U2kwRDlOU3cxMndZaFNSWG5sUlhsWjRMYjB4M203YnQ4TUI4VitzRlQ1aHQz?=
 =?utf-8?B?VUpkUEd2eVpmcjJLTU55WlJjKzJZTlphRUs3Q2VNWWgzaXdZbitkMVdNYm1i?=
 =?utf-8?B?eFdCSW1STGptTHYveFNsTDVRcUgxTXdFNnp0L0x0MUZhZGFXdVJEbzNCSkhZ?=
 =?utf-8?B?emg3c002WlB6RFQ0bFRCa3hVWXN4eGZEVlBvcjNaOWlpWkRQenY4RTdZNEFU?=
 =?utf-8?B?VTVocm5ualhjSDZ5QUdtdGx3UjJ3YjV5bDUrZW4vY0xwQ2FmVkw4TFZqTExE?=
 =?utf-8?B?aE9FS0VvM3NlRVJzREJZMlJGWC8zejZyUFFKd0ZmR0ZLUWdMd1gvTkdESnM0?=
 =?utf-8?B?VTdoRXN6SkNuMUZiei81ME82VmdwRm1GQWxPOWh0MzQ0ZHBHYVhKTlpBR0tQ?=
 =?utf-8?B?Ujc4Q1BWWFpvN2RhNC9TSFlxR1FJZC91Y0U0T0lHeFhOeWhjZE1IL1MwZWF2?=
 =?utf-8?B?QUQwT1pnRldzMGxmRm41Qi9OTnFVSzY0aHM1alVFbVhuanRHMUlEUHNjbWtD?=
 =?utf-8?B?TFcza2xWZFlJSTA2QUtWZFpzY0N1SjJQNXk4Y0NCbjRpalRkLzU4WjRJRU5q?=
 =?utf-8?B?d0JuemYrSVBlN1I2ZUtYS0Zia2l5dVlxc1NhMWFHMXFPTXdnR2prMTN5NmlD?=
 =?utf-8?B?QmpGaU0yMDlJV0dQSkhsZHFTUHdGYy9FRnhUOVVoZXM5SWkvK0Z5R0JnZWxE?=
 =?utf-8?B?MDZzbE11cXI5TStvbml1NzVNOWV4MUxVRGhyMEwzTG1IajNMTk41RVNJdG1P?=
 =?utf-8?B?U0g1Wjg5KzdqeUM3TXU3TFB1bFJwSTd4UHpLUSs4ZlVlcWU1UmZoV1Aya29a?=
 =?utf-8?B?ZW5uK01nK29lT1BwYmo1UnpNYkVEbFJld0VTbEVsM3JYaTJXNnMzejQ3Sk82?=
 =?utf-8?B?bnhZNU5YVWNpZmpJRThvR0lQQzNScno5UHlyTDB1c3JzNWh5OWN3MlRwUUxH?=
 =?utf-8?B?VElNdm5vd096VENOYmJEMmdLOXZEMnBBSTVnbmFiKzB0TXA0RzhlV1llT1lJ?=
 =?utf-8?B?ZlJqbzJFbTBiNTMzYWRsMjEvdDhBWmFPQW5xRDBiWUV1K0lmQythdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64163717-57c3-4fb6-6cad-08da23972fd8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:02:27.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnkrslAJ2JUBSa4Yc0MOxk0l7zaHzDFV5GVfrINJGkva7yj2p00pSN3N0Lr3d2grO1DS69DsJE/XKeFLsOPrlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271

On 20.04.2022 16:13, Andrew Cooper wrote:
> From: Bobby Eshleman <bobby.eshleman@gmail.com>
> 
> debugger_trap_entry() is unrelated to the other contents of debugger.h.  It is
> a no-op for everything other than #DB/#BP, and for those it invokes guest
> debugging (CONFIG_GDBSX) not host debugging (CONFIG_CRASH_DEBUG).
> 
> Furthermore, the description of how to use debugger_trap_entry() is at best,
> stale.  It is not called from all exception paths,

But on almost all (before this change) - the exception looks to be
#NM.

> and because the developer
> is forced to modify Xen to perform debugging, editing debugger_trap_entry() is
> not the way one would efficiently go about diagnosing the problem.

Shouldn't it be the remote end to request which exceptions it wants
to be notified of? If so, removing the hook invocation isn't very
helpful.

Jan


