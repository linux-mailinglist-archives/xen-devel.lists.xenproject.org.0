Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C464A76FAA7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 09:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576917.903613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoty-00047w-DJ; Fri, 04 Aug 2023 07:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576917.903613; Fri, 04 Aug 2023 07:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoty-00044S-9z; Fri, 04 Aug 2023 07:07:10 +0000
Received: by outflank-mailman (input) for mailman id 576917;
 Fri, 04 Aug 2023 07:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRotx-0003nz-DE
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 07:07:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 865b33c9-3295-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 09:07:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8684.eurprd04.prod.outlook.com (2603:10a6:20b:43f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 07:06:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 07:06:39 +0000
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
X-Inumbo-ID: 865b33c9-3295-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7jkVNfy+4US+nK4LWnvkjiyUsYsIJHdh9caaygz2IGhuWrGUR6vN5yKQN+LcWOeXaGlBox9ce9NnTZak7NpvOr1mI61pCShUUmzNlT1Z+fN83+ftUdZiH/LGd03R4ngWx7v8ssh1clXT4061Lbade7cOaQG/SFItBMHmwM1vUesdEYauGtm00/jHLApFrZ19hugCS3spWnapUNxuOjyh/2Fg2P0vIJA9nfkNunLDOqI0FAXa63qqBp2o324fSxjl27WtdkaFpdyCJH1l/WCMfCLzoizULuHLwqVxrA93e+TD9WIBAMPrOUTJLmMaMC9+Iz1k3zlXplrZzFOXKwNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfNCjNqvwJcHjKXYrq8LaYLXSHZkrzWwQQDZYgtVdUE=;
 b=FhQSab2Ag4Nu8JwWPbrg2jyxvTQb1FGjfM0FN6u+rXIy/XrOR//WFV/ZaVntuDmowPA3I+oakUc46//HbhgonLq3WTILWOtdeyA3uP482+7bxMi3E3A86Q0k4EwNoLWUuaGp6rpC5JAX3WepVQzCWXIiqRA00YXk4uwrNlO400I3eMyEoCaq8WnZ/miNiGWrzdBXGm6JHm23xiUBAEl/HLIuNvbtl8w2pVQ6zq5KkZ+bWD7oBiHU60hkhYDszs6ctGA9LqjwDqxVvrqMcmBB+P3PvKkI8rj3aMjx6/CgPx1OXlVUdljbOT7bmcYbcCar3oRCv7TaLZBX6zJbPKxmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfNCjNqvwJcHjKXYrq8LaYLXSHZkrzWwQQDZYgtVdUE=;
 b=kR1KVOiH+DlHn0lf28p2oF8EUUDKkH7doG/JxL6kz7VQKS2f7gLdqe2vREVL58uuKqKl28S5PXfsIfcb2TZFTM6i7i+yqsrKQPD41nWiZp+uKplJz6dI6Q/UFa59ch9dNhRBI+01+m4jMq8BRG0UgtmtM/NY+BYCV37BY33+WSHK12u86VqnbM4tQvesb630NShfTqvEa9+8/RyBO4PSPrQyL0iaAFBdQxZFxyqOixSo4sIQhAj+qIRGXY6ysjjkC/jEY8k60knsYdBnB09XJZQ4f4lSGcDhJjMR4Df29EASuMmSBV8+VmLlF+HPG3MyVvN1bbwcSDqoz4DhF1KEyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8672f79a-3e44-1cc3-b448-9ee4a4ed9090@suse.com>
Date: Fri, 4 Aug 2023 09:06:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop>
 <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
 <6a5260299c5822abfbd74749ebea8f8f@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a5260299c5822abfbd74749ebea8f8f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: dcecc94f-cdf5-4808-fe3c-08db94b95936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rN96SaNeadZgInREF69IvrVSdLTiny8EsKy9IF9ecYumatZ3t/umrhkyiBZRQM79S7VrPt1Rj9gBvaIrnjleVOZqsbqCVuCXD/DU7tMFsHYaiLEg9lxm2AkogZMwSLJQ2fr+/LqsSjiaf/2hqSaWFXs8DcrYOKpFH/kw6x3iuwdPbg0z4b2N/luspRd8b1sgMNwk8v60LYugYcypvl/ioUwpC878eZ8syD2WP5mgIQ4j4fI4qd3RleEGsZ+Zw3Meljama44R0Z9rrBd4Mm1ciiMNoJ7sWgEqhRk0LPEzghlIxB6ixt7Nkx2ZqgCLTlPMLq5+vp4DhgBlCY5KXmTA7ZwzTV2gXEvqFuLexSAr4CSR29++zDGy2YE/Xuuxpc/OpgojsuyI5DBw71E17rchQ/lG4//j/AB7EuM4FBQ2zvG0DBLIkzik04vXvJjbOo+CNM7W1cHGQ22ECpssXJi1Tw6gUHBcNOIPnEWhUfKmcFXEjoDzZW7AXMSRI2t0whQ/aa9QeuqOFCERFbem5xyf7Ydh40L+ydTxVjAjKB4EutmZ0irV5KC+pGBcaZMp7ai0YfoP9keZeY2/zYuycCq5M1V6eUj/fQGvkXIsfV0y4h6RZggCkOpYoNGjPXdzZBL4jLMCbDtRSO93lDqA91WCGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(1800799003)(186006)(2616005)(83380400001)(53546011)(26005)(6506007)(8676002)(66556008)(316002)(2906002)(66946007)(5660300002)(66476007)(4326008)(7416002)(41300700001)(8936002)(6486002)(6512007)(6666004)(54906003)(478600001)(110136005)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDQ5Y01WYjE5aVlJcmYwZExFYUZ3S3p1UlNlbTIzTlhMRnNvalpuREZLZHdu?=
 =?utf-8?B?THUvM2VNcDlVeHd3ZXJiVThvYmZMdzdDM2NiamZWZy9DeFI2NzFWbUEycXpj?=
 =?utf-8?B?SHgyNW9GNzY0c2NHNXovUUFVYkJkM3ZQRFI3K1ZBdmRqdzBJNllFZlBFc0Zo?=
 =?utf-8?B?REZraGpTSTFGRVlZMDBsaDFlMFdyNWk2dlZQYXZoVCtFYXFJdGdTVk5zNkdW?=
 =?utf-8?B?SXN6Z3JkaVRTMFdnUDZJVFNlTXNqWUxCcTBFeURRRlVmMG5XVHZtOHl3cEFI?=
 =?utf-8?B?akNHYUlNVDFjUHVjRkR4RThOMjFrbE5ra2d5ZHcyQlJFODdHMnRjcGNTSFpT?=
 =?utf-8?B?ZHBERGk3Zi90a3Rya2E5Q1l5eTgyakF1TVdNTnBvUi9uRGFDc2hTamk4NEEz?=
 =?utf-8?B?VFpjZzVjVmhOMTA1amJKa2pKMUUzT2VSWWpnMlZ5ZzY2TWhZbDdrZ1REM0lF?=
 =?utf-8?B?cXhydzB2SHFNYmhFemxRbkY1R0dleGI1L0x6NDk2d1FpYXB3SkZKd0o5cmpG?=
 =?utf-8?B?OEZaZ29FMWpsTGxtTjhvQ2U1UGtSQlJUdFl0akc3Q3d2MldUdkIycEFGRGN3?=
 =?utf-8?B?d0dnUnJiTlBVU2Ria3gxb0JMR3lzTHJVTFdwZkZpSlFFblI4cERYZ2RyeUJy?=
 =?utf-8?B?L1AxQVM1RzNCem11dkRGNVd6QkxYeTAxNmQwWFlnQVo1eVRpdGpuVXRDK0N1?=
 =?utf-8?B?WE0xdnR0M3RoeTBoYVNNbUVXdkxrRHpTWVRjQnErMitIL0JXTDNxbkUxZ2FF?=
 =?utf-8?B?dHFxZjlLZmFVbk0zT2tpMHk3K2pmcVBEMzFHQ1ZZYUN4aDdvaGdTWnJXckxt?=
 =?utf-8?B?MFpkcjVPY2RoYzlpTS9VazVHbDJhQUxUa3NpQ3dCQ2dXUGloczlTc3E1S0o5?=
 =?utf-8?B?Y3F2YXNpS2ZXTE9OSEJlRkVkUDI3WFZabE1pUUJxOGwzK3FrL2YxWEhxUkJp?=
 =?utf-8?B?T1dnM1dJaGpUdVJoS3NGSW9nRnFuM2plaUliZ1RSWE45Q2xoWVgwdVBSSjhu?=
 =?utf-8?B?cDFMRW5iREI4K3RHdmdFR01seWEwQUxiYy9YRU9MeVRuOENoc2J1K2FFZ1Vx?=
 =?utf-8?B?Q2o5R1ExMkRTYWR3ZTJEc2RKNWl1d1dVVDVWQ010K0RHYUx1N1ExWXE0aTlk?=
 =?utf-8?B?UzhMN1ROenpVZnhaN2YxZmltN1RJclVPQkNEdTEzZHlFaHdMa082Y0RpNDBv?=
 =?utf-8?B?Ti9HdDdNYmtPallzZ3B2Um14QUlkdkpDRElvNDFFQTBIbXRxdVB3M0YzdU4r?=
 =?utf-8?B?Z1RsWW9HTkRISTJSR1YyM2h0cDZ5bmI0QThuVFNqN1ZtMGxlQnJKRzlZZXpQ?=
 =?utf-8?B?T0xvZnRreml1eG1HRVJyVTZ4a05TSnJkV2pzWHYzam5nTUhJVllMY1RvdG9S?=
 =?utf-8?B?T1hEbWZzL1FBbnhINHhSMWYvaWY2SDhybU9oanY2QVc2T0ZrcERaSUUwWmIx?=
 =?utf-8?B?d0xYK1pVamlXa283OW42YlpsY1FMNzFnenI5TVVQNVE2YVBVeWVSK3RBaEZX?=
 =?utf-8?B?bjRaYXR4WlNpSG5wbk1MNHM2Q0cwK0RoTVFNQWVZbDVDNDVHUTRnN2VKQTRk?=
 =?utf-8?B?M2ZVYU9ZNmRYUS8veldSQktqNGd4RU01VUJVdTJOQnNFcWhMdTBzeGpNYVlk?=
 =?utf-8?B?Q0pkaTVycmNrdGFGZFErMzROaTN1d0hrUjd3M0V6NDBTZmZvcTVFZklyYkEz?=
 =?utf-8?B?SXUvMzJwTHZjaFB4Uzl1TmV3SEdoUWxFWFU5eVI1c1J6by9oWmt6LzV4WEZq?=
 =?utf-8?B?WENPWUd2SFlzSUl6aW82NlgwTlV6SXNLNTZDT0R1OGEwNDZaRjZyV29ibXdI?=
 =?utf-8?B?VTNqdW5PUTVhUVpDYVBVdy84L3luYXdWSS9VZ01RVFpGbDZlNWdTMWlmTmNM?=
 =?utf-8?B?QnZZVFZMN3VjSUhOb0ttZ2pKTC9VNUV1enVEZTFkQzEyUDJxSTV1WitiMitk?=
 =?utf-8?B?ZEs4TkVpNnlKT3lPR0ZCNUdrZFBhSU85amtNNWZNQ25udXFTN1Zwek5ScktZ?=
 =?utf-8?B?VFkzejZjbDlSenpxWERhRVRmbnJObGJONExFMDlDeUVMR3ZoOTFVRit2emgw?=
 =?utf-8?B?T3ZTaStsVXpySzhiRWYvc3NZK3BBL2RxUmgwVVB3cFhjVTk0T0Z5YnltOTVs?=
 =?utf-8?Q?1oqK2SIT/B1+3VX82LFgVpeL1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcecc94f-cdf5-4808-fe3c-08db94b95936
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 07:06:39.2035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hS0ZEiNATKFgdt30ZlgCyqywdmpnij/P1id2LHsQPJBj+wAbzIdtGeq9eGpGFFyOTTO9YbWWzCEgSTHHJlfGdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8684

On 03.08.2023 16:22, Nicola Vetrini wrote:
> On 03/08/2023 11:01, Jan Beulich wrote:
>> On 03.08.2023 04:13, Stefano Stabellini wrote:
>>> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>>>> @@ -1169,8 +1170,6 @@ static void cf_check 
>>>> irq_guest_eoi_timer_fn(void *data)
>>>>
>>>>      switch ( action->ack_type )
>>>>      {
>>>> -        cpumask_t *cpu_eoi_map;
>>>
>>> It is only used by case ACKTYPE_EOI so it can be moved there (with a 
>>> new
>>> block):
>>>
>>>
>>>     case ACKTYPE_EOI:
>>>     {
>>>         cpumask_t *cpu_eoi_map = this_cpu(scratch_cpumask);
>>>         cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
>>>         spin_unlock_irq(&desc->lock);
>>>         on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
>>>         return;
>>>     }
>>>     }
>>
>> This pattern (two closing braces at the same level) is why switch scope
>> variable declarations were introduced (at least as far as introductions
>> by me go). If switch scope variables aren't okay (which I continue to
>> consider questionable), then this stylistic aspect needs sorting first
>> (if everyone else thinks the above style is okay - with the missing
>> blank line inserted -, then so be it).
> 
> Actually, they can be deviated because they don't result in wrong code 
> being generated.

Only later I recalled Andrew's intention to possibly make use of
-ftrivial-auto-var-init. While, unlike I think he said, such declared
variables aren't getting in the way of this (neither gcc nor clang
warn about them), they also don't benefit from it (i.e. they'll be
left uninitialized despite the command line option saying otherwise).
IOW I think further consideration is going to be needed here.

Jan

