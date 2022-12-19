Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F467650853
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 09:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465873.724682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7B4R-0002dJ-4S; Mon, 19 Dec 2022 08:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465873.724682; Mon, 19 Dec 2022 08:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7B4R-0002ar-0O; Mon, 19 Dec 2022 08:00:23 +0000
Received: by outflank-mailman (input) for mailman id 465873;
 Mon, 19 Dec 2022 08:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7B4O-0002aj-SA
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 08:00:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e60f923-7f73-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 09:00:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 08:00:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 08:00:17 +0000
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
X-Inumbo-ID: 2e60f923-7f73-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPAJY1BftHgqd0VbtBD8tiXacW0eErBDEitRjxZHiA4DPWmT07wLYq7QtXidjB3Z6e0gcmOHV4hrJ+gQfot7pbjWLlyk23QDPzokSpbFptM6gKMeVukVkhS23moVBtnuMt5WsG6WeQYb2KJU4mu1XiNDsbqucuHZngkoG1lxNrv0kfgvtAq2dd3JfLSmJFTxoYp9sVHAnpfN9HSh7yNh/ZUfOmTzfeQkbkGSb+4bapxUDNkJyKgnpfUwFyzpJezQNrPjpYfU05zb7HngYwtdaANW6Br4Has4RCRIq771fdRo183/aV6XE0ab+qd3i9C9RnlHQ89M+V/ckFwJb747rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMyndYZUnLTMLkva3quh8ckMGWLs72XD/+H1dEL/45I=;
 b=VoFfsWNYKhn5ijZcvnmHEJzQSO2lXSv8Jf0W+IwYyvRp8Qlg2Zk4zempat2s3P8fwna82ReXU7MXWkTsKJ+eUkOX97Unr4DyJgpgxmXXd329nRtgIHkA8JBi9nUlMVIW26mCHsSvSyxkq4pTpNEUFCN6zJODAe4qht3Ja5fe8O3WCl9DENTKz6MpUyLvHmXQNzWWhp93KMu8r8/4EcNNXIXhJk2HB0cEIJwYxd/qp0w4UNC0kblF6bIui366bozsbGTU7zeAU2veRzppYGOd/KoCvDgQaCWI9x8dcwfWArQJKOsmfXpkbPl9I9BMnq7POsITdIWSyEAlI6elFRMZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMyndYZUnLTMLkva3quh8ckMGWLs72XD/+H1dEL/45I=;
 b=RuHyEfFi+EchK6poe9puBLOrQhDMvKUD7wnwvCkEnkJIGv3xJFfXxKleM7NTQsSmw0xsQKn3IEIm7zDxdg7WnSxmit634N1MsFqROfkX6AVgA4HvEHNahbLbV7Zu6xlJG8wxUmyQf9R/32O2HKG6nRP/Y3jGdriC7HP62lIFAM+tkSo+vIs72k0fIo9IMhVclwZxT2AKNV02fJYp6GBfZb7NBYJ+WRFb+8NlYnWqtT7MFtgLrbtH5VrD0P+ukYeGIylrWXOvw7bE5w6r/lT27Er/P9hE47mHc95Zk4xoAvtOdFfe+bPYEFCSvCmwB8cGE78nW6CTyyo1MHvsL1gwAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be1e0ba4-cd88-330a-aad4-2ffc14b075a6@suse.com>
Date: Mon, 19 Dec 2022 09:00:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Content-Language: en-US
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Elliott Mitchell <ehem+xen@m5p.com>
References: <d018f50f439c4d8dff8add022d28698a2af3c320.1671365645.git.xen@neowutran.ovh>
 <Y5+KgBxxmlYfq7e2@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y5+KgBxxmlYfq7e2@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1382ba-4f35-4f5d-c3c7-08dae1971167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L6Ax0ouYLXY0ewk0BwsC8Hb85XzyRa9vWmGBnLKPrjAH9THZlIv3NUYQkiFrz5M7+CedzcLPykZC95t2QWp00fKJamQpbw/egyz0OWckACFmtUftGVCYpbDvLeON2T0/bJJvboMVh9PHZeCAw3Qj1bZCuBSo+KYZRN1udCso1OYnzaj5RfToh7zXrLs1/9EIkIHiKsdoSSBtff1we+YrOo9bndOni/YucaZ3XEfXqJFvV89xY319UPpfR48KgYZUC0xmtYg88bTxqz6rkXJIS7Osj2OkIIAvgB5pAzyBmxofdqRTa82Kvpg2AzRHWw0hof+hCMtdosGDVZSs+gYxDV+Wp4lrC755NDhygr6P+32v2nI961jZHcwFKpQlZqmv6Ruc71+fjoZHShF31iLwcGBIoMPT8Mh2rpEyUoP58lo2YGzFWkhn4NHiQzw0OU61NNoGSLA84UxsVOLkAETlpP6/YFEZo72PLE8us2yKKL28wNx8sf8v2u7u8NVGiRilosPi6Fxcmg0k5YLNdbs/d+b3j7gnTR5YCgkqoAL/vthwA/D+bV5u1A3asCCkgkBrhUMtL6UHfjRIaU/aalJ0k4GWZTFxTtG8USEk78NpenHgznapu2YSTLiglqdSkZv0C/4A4aa2uwW9FpitIosxhsrKf2QEgFlRGhPln1iyTX7jcCHL2FxCetJz7MBc7866lkYtSWdmAJhvlC9xJfdsyo89mfxxEiuIkGCyer1uaF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199015)(8936002)(31686004)(5660300002)(83380400001)(4744005)(186003)(41300700001)(6512007)(26005)(2906002)(316002)(478600001)(6486002)(6506007)(53546011)(6916009)(54906003)(36756003)(86362001)(66946007)(66556008)(66476007)(31696002)(2616005)(38100700002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHp1cTAvaG45TXNpZmJaRC92ZGdCS3hBald5SUh5djZYaVhNclNzc21UeUxs?=
 =?utf-8?B?WkM2S2o1bmRmWDcxbkg2M0M3WGU5bXNMNVI3U1RUVHJFVXNZMHpiSjA1enRL?=
 =?utf-8?B?empFRGFpSVVNT0VwdFFvbnBNNXlPT0U0RXE3eG5oSnlKR2s2YXA5MGYwdGhM?=
 =?utf-8?B?ZlVlYVVacVorS0xGWWlZc1ZMU2Z2SVNyRXJEQmQzSlpUdnUzVGNlRHo3d2Qx?=
 =?utf-8?B?Um5JMTRhM0tDVHZQblNjVUNkTFNRT0VJTWRTSlRTQjRVRGNZL2JGK2kwc3pD?=
 =?utf-8?B?K0hSZGFHTzcvSTYvZXJLUVpTcm15cXk1aE1QR3dYVERMMkljRjNhYm1hMlFi?=
 =?utf-8?B?M0pXT2FqcTRIRzlPOWNVR2VCRXNQQ3E0aTZ2M0xGalZFdmN0c0tNbHk3alpP?=
 =?utf-8?B?cUJCRWlOc0h3Y0N6amZoVm55Rndvc1FCaC9nUXh5VUd1WE1qNGt5ZFpjQWk2?=
 =?utf-8?B?OFdrek9NRkkyQ0FuWjVvWU1vM0NNK3podDlSdnNKMWwrV2ljZVlUNWxJaHJn?=
 =?utf-8?B?OWJXcDhGd0JibDMyanJaSEZ2dDNTQ1B1Z3J3Z2c1VjY1enZRZCtTVklXSEhZ?=
 =?utf-8?B?RXJWc3VYeG5KbUhWc2JtYU5ZOGdSZERWRjFUaUFPNDJwTVVBcG0rVVpxb2Q4?=
 =?utf-8?B?eXF0WDRBdWh5RnNNSFY3VjcrUE1TQjU5SnlaOXN2MHRFbnRUenkxZkJCZmV5?=
 =?utf-8?B?NFV2UDRKSzZNNHRmK1dLZ2VwL3p5N0ZSczlOaGc0c1RIMUIrdmhmL0t1T29S?=
 =?utf-8?B?MmdTcWlFMEpnRmQ0VHN3OXcwL3lvOEgwM2gyRlJrWEt4Q2tJYVVyUWhuY2Jx?=
 =?utf-8?B?YmhYb0tVMUdvWm9RRTZUa1hRWWtleWlTUnZzaTRkaFB3MXRFUms2Y2N1aDBQ?=
 =?utf-8?B?NTdVWkNaMFZQMVdlRmI3WDhNM0pjT3ZYdS9mUzNCLzhIR2RRMUo2cVZBK1Yy?=
 =?utf-8?B?eVZyZmpPVW9iZXBkcy80ZnNsNmgwZ1BXOTF4b1IvaWpxNWxNbTdId29wUlNy?=
 =?utf-8?B?RVJtNkVJL21RcEN5aWNoM25TUDNHN3JXQ1NVbjMwZmtiU2NtQStESjlxb0Zm?=
 =?utf-8?B?TmVka3YzN3ltT2R2YlNKYmc2YnFraWdlT0VGMmVEZElZZjFhZnUyYk0yM21Q?=
 =?utf-8?B?NUduR3BXL3JUcFB1dUxnb0pwbi8yc2wyNWVnWk9MSmQwSXNDRmdQTUp0SVBj?=
 =?utf-8?B?a0lwMkhvei9Xb1hDRmdZcG1wcjkvT0RWUmZiaCtjR2pNc0M2SDJpOFAwcDJT?=
 =?utf-8?B?STVmWXBzZy9SVkdTSmVWL2gyZWpwdFU1cXFUVmp2UzJvc0tHRzk5MVZKb2FG?=
 =?utf-8?B?M2dtNUN6WCs4MEhtYllHamhQYkh1a1RCQ3JpRml1SUdrVFRiQlN4ZFl1UFhT?=
 =?utf-8?B?Tk85UU9Ec1RxMW5UY04wZUNWdGl2WFArUTcwNVIySHZMT1NXczg4R05rM1Ax?=
 =?utf-8?B?L0MrNGRKQXVyazVWcnBpcG5KMXkxQXY2VTlqa0hMNTJveVhYRjBTVU0rb1c5?=
 =?utf-8?B?ZFRVMk0vM1Z5THJaM3dKeFYxQ0dkc2xmQ1FPMFJ3UENyV0JFcTBkblpIdmNF?=
 =?utf-8?B?YVhmVVo2V25PS1F5eHI4c1FDNmlhMzRGR1IyemFVaHpXb1FIZytYbGRjalNM?=
 =?utf-8?B?aFV0UHlBTDZpeUViM1dTQ0FMZkhaWi83ZVRNdjJpcTRqR2VwYmpXYnJmSXlN?=
 =?utf-8?B?T2kyMG1GVlhsS0lYaFhpbExpOVlSUTZRR2NjN3pwMWFkaGxUNml6OVlNakgw?=
 =?utf-8?B?Y2hSVlByaStUK1RqZTFBbzlWTThXblFERWlPd2dBYVZyRVZUSGVEZytmTWxz?=
 =?utf-8?B?OEtCcHZXOFBHdHV1T0dnQnROL2tiRmNqL0NJZkhLbDIrYUxDTS93SEVjRUR4?=
 =?utf-8?B?WmdUOXl5YitwYWN4YzRWR3prQjdLMUlYejVoSTNiek9rbCtveTFaZjBMQ2E4?=
 =?utf-8?B?czUxVWRGK1lrbmVtZWY5N0RNSUJCcEs5ZDlxdEl2NnpYY0hjU2NtQ043N1JG?=
 =?utf-8?B?M1h1cDYwb2dGQ3prVGlpZ1lKVkovUlNmWkM1bW1YS1ZBUGI2MmludHdFdjhp?=
 =?utf-8?B?NWgxMG05d0YvYjlpTDBSVUtVOHppYnJHRk9DTFBVb1o4K21uTlk1Z045Sm9G?=
 =?utf-8?Q?pKEOvstpQYMhpXMKmDMMFHrja?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1382ba-4f35-4f5d-c3c7-08dae1971167
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 08:00:17.7014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vellI4AmJVDYQ4QMUfWd50qRyOD3xl1CdqYcXTQywVp8U45RWxbbg6e1QMjNKTRsU+dttthcPY0FmfwOUyzLXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697

On 18.12.2022 22:47, Elliott Mitchell wrote:
> On Sun, Dec 18, 2022 at 01:14:07PM +0100, Neowutran wrote:
>> xen/x86: prevent overflow with high frequency TSCs
>>
>> Promote tsc_khz to a 64-bit type before multiplying by 1000 to avoid a
>> 'overflow before widen' bug.
>> Otherwise just above 4.294GHz the value will overflow.
>> Processors with clocks this high are now in production and require this to work
>> correctly.
>>
>> Signed-off-by: Neowutran <xen@neowutran.ovh>
> 
> Needing a bit of word-wrapping, but that can be adjusted during commit to
> the Xen tree.

Right - also the first line of the body really wants to be the title.
I'd be happy to make edits while committing, but as said in reply to
v1 I also would prefer to suffix the literal "1000" instead of adding
a cast. I'd also be happy to make that adjustment (including to the
description), but I'd prefer to do so with your agreement.

Jan

