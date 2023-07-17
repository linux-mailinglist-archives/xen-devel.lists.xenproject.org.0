Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728EF756215
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 13:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564464.881900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMls-0007yl-AU; Mon, 17 Jul 2023 11:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564464.881900; Mon, 17 Jul 2023 11:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMls-0007vr-6l; Mon, 17 Jul 2023 11:52:08 +0000
Received: by outflank-mailman (input) for mailman id 564464;
 Mon, 17 Jul 2023 11:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLMlq-0007vT-Fr
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 11:52:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59a72d89-2498-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 13:52:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9675.eurprd04.prod.outlook.com (2603:10a6:10:307::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 11:52:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 11:52:03 +0000
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
X-Inumbo-ID: 59a72d89-2498-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xam5R/J7gGlLvqFiUNOxQP/WkFWtNnyHmVivgchabfgR+JyYz59w4p+nmLuPrYfwBMOopcXjg8YbwBcYsupuCWebtd3uYXG8YDrk07ZmXDbLbft4Q7CkEHrFawvdd8Zyj7Ifqe46LK6Z/mnFD9tzOneEvBSbIcEWX0ITjCAXj563XAEmNykaagnRl56ORGLjmxgvCy0SZ21D7j6PVZ3DA4I5IWyInSqy2oVBpdJlZg0B+eh45RX3rEwe/8ZLozy4wPAL+6bPXilS9HeBHSDUHMm+4aRB75Y9/tlr/5qRAN+Dhzy6YWe+xKLlDhdtp3gQCCRamQKSZ9y+AdJ3d+0xuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVBzIRKhDWPWD4lcUpcjO3vCJbP0ot4R2AJ0zXXGXZs=;
 b=fpyhyOvQJTOLfeaoxUURkZPJ2GJa7vP3v0A3QyA32cMky3zknkvFxAjKWjsz4kJEpGIaN9JBBdKLQYi9Y2dTok0tOi1wTw567fHGHD25kQGUb8XgM03zxmIsnIxIhLAMi7pp+xtpI0xxMGD479kX4cku6rSxKMAn4a5Fn4ArnUOzUq6r8OuWlWSTpzLNPQBM++xHaddOFLr2ljcllM88T80AhBwVYHpNWIAzxWLgeRkZarfI2tAnTeF28lOjp5fTWcW5hAdqU90i6QyoOl3dK2JjrePufAODgE+wxYe9LnYAxRBBQRnEDjU63S2RoO9SkgpRFgZcQgL92R3a7SJs8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVBzIRKhDWPWD4lcUpcjO3vCJbP0ot4R2AJ0zXXGXZs=;
 b=S58G2yI3HwjTnjjRxK5EWh9HHtiE5FTwrMzURJIOtnwNMXrUPOCpW2IU4p04m8j/TwvThgONLFSTSp0mJuq1HqSo59UkOoQBCjl/Wbx9ZvTsueU2zNK+1gPPZ/mjIHGwjZX28RtYPehFlcgAeoAn2LoZLnaXN+CPRsmQpIM3VjuZq+lQTtnR+o4PYd7obSX2g0EZyAKMWYMgYi4D/rgOeA3vlAjlmAQo0ZrSbI3ATWLEKBAD1SDYw1NFTR1eK2va/ZD56cdl1ZwcKdAjv1lpyvFJTagP6+AlBxzGwh+ReX64y+7UjjYHbOFtJ6RLgd6mKV+tJup64lCqlY++CFQNVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee342a26-5f26-0e47-06a6-c74fdb3270d6@suse.com>
Date: Mon, 17 Jul 2023 13:52:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86: drop old (32-bit-only) MSR definitions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df2c3154-2e8b-194a-ec1e-472819bbf026@suse.com>
 <38707d09-92a3-2807-4bf0-167be5c3bb15@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <38707d09-92a3-2807-4bf0-167be5c3bb15@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: afb41cf9-d93a-41f0-abb0-08db86bc3ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9lozIEIvGR3oTcBijjurCxB7+smoxmkb8I9a0K9E2mSSK12XADwzzV8+1uhAwqv8ntAhu1yi4xlG1+MCO48H4tgQMzbeEf3iB39Zs6hZllP0F3xaHDBaVzezh+MhmyLAHYladsS6S2tnaHZhTAwEQFJFCV80c/Ey/4B/H4O1HZpa6x0tUqQs4F6jZChhyLe75de4M2ph6eCj1nuenG2IE/Ab3J3SiwbWOQEaCiUhTNC/sxutVxwkfqOhj+Yl4OeHHwWau9GmhcKG+Vp9iQPQo6yEMjYs8CDytfR8jwuDBlLANMusLXQ3Wrl2+I2BPVDB4KTBTLMJSemPINE388xu5/CHqDo5DlcbuLLziwHbItVxGtKktopuyxNpY6lFwWgIcIHwW7v8VG46cTWsAynIEyy7EcBzYunwDuo9J2T2VAKnBYStsyWDOBivZkW83h1xvZXuNG9KYtbOY29HmkWYRFBUgVbc75+bKpQXjxmC3KTlR9/VaOjFQtTNr5QuSPcQrNTEW+GjBTIk/xW2zryDsKUpERfcRCqax0EsAwCuGRGC72wvVZ4rWq1YNg0KMJ/9SPDpu1D1l+ai593+BGyoq21bZtf8ii9r80Sc8hN2ysDkF6NApdOdUIPXUXE7/ZNy6I+KXt/LOxsx+FyK18U7gdPNGT8x0PXcx1XqZH1dB8ABTOXhkyu/6/VGh2NZ1BS1r6x0C+WiULs+lHeH2GTuMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(54906003)(38100700002)(6486002)(41300700001)(8936002)(478600001)(5660300002)(8676002)(66476007)(66946007)(316002)(4326008)(66556008)(6916009)(2616005)(186003)(6512007)(26005)(6506007)(53546011)(86362001)(31696002)(36756003)(4744005)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FVc3l5MEFGOU14TXhZNmtPUmQzRWpDSUhpcEpFNmMzY3hjZ1VCcS85ZnBS?=
 =?utf-8?B?Lzc1d2FEajBsTW1CUUtHWHEwN2RiTittUlBoUiswc3Ria05weHA0NzBTcVNF?=
 =?utf-8?B?NzB5N0loUDZBN2t4NUhQOTlZOXNGUVFEdDY0QmhpSE42eVBvTDViVHgyZUgy?=
 =?utf-8?B?NU82VDRUam9OcG52YVNFUjdiVEFWZGdTdHY1ZnlWQVY2YUhLRHlPVmhka09H?=
 =?utf-8?B?ZkdkYldia0RPeVBrUlhRaWRSTnB2T3ZpZ1RVU1JxMVdneThqR3hXYkZGQTdD?=
 =?utf-8?B?eFEzckpZL3p6N0V4WjdGc1Q4aHVjcnkrOHJRKzJUcHVkSGV0SkJrU3B6azFN?=
 =?utf-8?B?Tk1FeGhkWjVqdEU3K1Y5WVlieVRzcG9zbUM3M21oSi92dFI3QzUvWUkyK1M1?=
 =?utf-8?B?d1EwRDJSZ3N4NU95dTVibHprcGlXb250dWJEajdoRmVBOEpNUHVwWXRSMm1V?=
 =?utf-8?B?dkRuSWFkUkZoVzA2Rk9rZ0trWEY3a0UvbjMwOEdob3d1eG1sNFhVNFJ3dUo5?=
 =?utf-8?B?MUhMV0ZBOHlOUFBhV2ozSiszZFY0dmExdzBzcEJZR1FMM0QwTVNkQ3NNTEFa?=
 =?utf-8?B?TnhxMDRTMHg2NTJnYVFFd0U3aHVYM1NpUE4wNS81WXdnSjJMU0ROWWNJMGRj?=
 =?utf-8?B?alpFa0JDbmt4ckF1ZnNSaFF0eWlTZ2tsWHJhKzdIeDZ6eW81ZjA2WHMvRXdI?=
 =?utf-8?B?VkVmakhxVlpoOWJ4M2VkMnBhZDhDNGJlYUVobGFPM3dXcktLL01tNENsUGk3?=
 =?utf-8?B?a21CZGFjcFBzZ1FMN00rTEYyUXY5bXhONU9GOHp4N04zT3JuUkNkQWZTbjRZ?=
 =?utf-8?B?d0dUblRLOUpuZU84YVZxNi9PT0c2bm5CdGJWdWtIVU4ydzAxRmJvNUFXUVlJ?=
 =?utf-8?B?QVR5SFZYWXpRQUw3aEgySjZnZ2N6RVJWTXoyeXhnK1YvV04wQmtzZGQrMEdw?=
 =?utf-8?B?bno3SzdlRjh0S1ptTUN4dVczb25nNm55djVUamN1dXJGWk5Walo4TUdKUjJQ?=
 =?utf-8?B?UWwwUEh3cjUwVEhJakhLSG9NQVJQejhFRVZTeU9ERlZhb2hFUkloSGpFOGt5?=
 =?utf-8?B?alNndlA4SW5CdC9tWDc0TjRKL3hEaFRPaHhaTHhZRWVmRGR1bnQvU2F5MWwv?=
 =?utf-8?B?OCtNWWIxbHpaZ2JYOW1SUGhLS2JWeDZMTk16Nm1tazl4M1hiekluMmh4b2hP?=
 =?utf-8?B?d1BLVllYOUhyV09sdnBxRWVUQ1pQSXgrSHlTS1ZETlZTVytXa2VISDgwcDVz?=
 =?utf-8?B?MDR2ZXVPQ3VXZVhRVGQzelVqQ0dzQTdKNUZQSDJ3QU95UjFIYmxUUzk3YVU4?=
 =?utf-8?B?N09JR01YN0JCUGZ3cEFYSDF2SEtLNXhJRXUxRzlweWdUWFEvTUorbFJWRnNJ?=
 =?utf-8?B?b3ZFajJ6QjV0NW80bXJocm0vblg4NXRUT21GaE9UbFVXME4xckFNZXNiVjJE?=
 =?utf-8?B?dGFTMzRMbFlpbmZDVWozV0hsTC9PY3lTVzE5ampDQngxQ0U2Zzl2d3BKbmFP?=
 =?utf-8?B?SjlnWjNxcXVkUVVjTGNuRmZyM0NaN3lrYTlxZEk2dXA0QTduQmpUU3JUTFFu?=
 =?utf-8?B?V1poWElJRHQ4TEtyTlRwT2JUYnF4ZEhDZGRpQ0VrVktmY1UvUjlqSHVweUkz?=
 =?utf-8?B?bG0yZDRFQ25sbHkxLzYvSnA1dzNxTDZoVzlOb3pPT0U1dkcrUHd6MmYvdlBP?=
 =?utf-8?B?cmMrRmpHVzNVUE1PWHREdlRidVhSZUIvM0llMTNMbHVGYmtEemtpaW5sYjh4?=
 =?utf-8?B?QklDbjNlVFU0RnUyY2xKQ0F2TVdqQW52a09ETGVUV1VyZjcrNnhYaHMxb2t1?=
 =?utf-8?B?dXJIREVmQkJDRktOdDMwM2NhUlNya3lxaGFwWUlyclFjTEdnZGkrVWQ5NmFB?=
 =?utf-8?B?TjhpU2pCdHM0c2xlUWg3Z2I2eXZ1bE9iR09aTE83a1lSSDVIS0VlVytzVk94?=
 =?utf-8?B?ZFF2LzRacG5Xc3Zmb2VlVnZqdzNQWk1GaHBISXgwS0VtWTRnOFgwUGdIZjU1?=
 =?utf-8?B?SFRUK1ZUd0xTalVBSzZrMHVJYmFqR3dRK3g4WS9aUFh3ZXZ0ZS92blppZlZr?=
 =?utf-8?B?bFJIWjUxYWZwV3BYQXBVUnFlSWMvN00xUGdNYmsrekg0NmU5STlsbVc0Nzdm?=
 =?utf-8?Q?qDkZJfC4m6Q96H3x8SL1hB8NH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb41cf9-d93a-41f0-abb0-08db86bc3ce8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 11:52:03.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76H5o6EPOndZbWiHp3CmXoP3L7P+XZAuNPVlK0zdyGB20M3u9swrE4MvDBx/qy6uqEsLCZz8r48id1zg3FUquQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675

On 17.07.2023 12:33, Andrew Cooper wrote:
> On 17/07/2023 10:17 am, Jan Beulich wrote:
>>  /* Intel defined MSRs. */
>> -#define MSR_IA32_P5_MC_ADDR		0x00000000
>> -#define MSR_IA32_P5_MC_TYPE		0x00000001
> 
> These are architectural.  They still exist in all Intel and AMD CPUs.
> 
> I'd suggest keeping them, because I think we're required to expose them
> when advertising MCA.

We have them twice, and I've kept the instances without IA32 in their names
(at the very top of the file, i.e. already in the "new style" section).

Jan

