Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91B6ED141
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525497.816740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqy41-0005QF-RD; Mon, 24 Apr 2023 15:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525497.816740; Mon, 24 Apr 2023 15:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqy41-0005NQ-Nl; Mon, 24 Apr 2023 15:25:13 +0000
Received: by outflank-mailman (input) for mailman id 525497;
 Mon, 24 Apr 2023 15:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqy40-0005MZ-Dh
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:25:12 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33da1089-e2b4-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:25:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:25:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:25:08 +0000
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
X-Inumbo-ID: 33da1089-e2b4-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzCT/GZckR47kM1kOmh+sRqT/8NTqq9L7aAefpoq4guURWg25gxotN/9VRtTOVCdAoBITS2QWVBHecIzUpx3+tsrMu7UTvi5Uxgses18TxQjyp06jY75odMwVBE86O+kMDz6xF0kdQI0wMIspFD1wlxJKXEjzWhbTpCwt2O12PxAFuFAclLF8DnSympmJMH1i/Kr1zTvPXAgRTyR59w8EkH/r4DspTh+hjdGowm05zQzhoMZxpuBzHKq+2dna3cvEPGRPrIHcA/v/i4zhgv7QZOD0fZpQPPmtD3AmgPY0m0lrPCxgGyFjn/PFW63EQdVyEwYGlwDfgeiWfEf/6s8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5P9msyo4VrLRMsZH+r6p3iSXdvlDl7JHUBUiG/6zpU=;
 b=c4VVurWYtwxoZ3MyDq96Y5gj2ofSaQs4aC19axqof1LScBWotFpBKJI43OBJb+KoYWFmNqQVJ8xi7CBURN/27Z9TFYouK9SmIUPl58EuaFPBkabm1C/2jzWAv6lHgBOExCQTZQURkLa1fTOzJTQaXeaLsVdtL7xRbkDAqRaP7JRmaRC2CzXtnZg9wnJWit1z+jGjVkLbQBxGod+aP0Kq5dSqyLZpOC5I4BxvOfWdDnSRl16kbpEWUYo3xRG7buLP8GCOuCFuYSBcBHC9djZ0mLYOcQrNCzmcRt1yzA/vUnNnb11wqBubDM0c8+USlEEJwt8f+JLqo32+iOmiFw9trA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5P9msyo4VrLRMsZH+r6p3iSXdvlDl7JHUBUiG/6zpU=;
 b=aIGIL3EJtpuWYpIJvHezxihyJgFBa42e/nd4+mQ65zUbFK8N/TlywsRlz+XTqBP676IlV0/EPvfz2g9EGmRIAEHyxpDDNprVDY7jFLEJ21brqh4tLltQfYzd+O/SuH5Pqqk/Qi2Ykuwczss8iPRuXIERU2rJTKLIw85dYq/cC8M/OyhIyxKIAzR9tgqtFfNtOaij1MUelsQ89mzqpjNXh++g31lxdwmEbEBqRgCS6DaBJiS2qbR8ZQmXvoqjsZv5qEJKCr2f2H4LtPEnTl4y/m1dVRmZYtZldaJQ69Yky3gKi8QneWeTVCFifv66wxRlSNn9HoSCcATc9St+u64gdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
Date: Mon, 24 Apr 2023 17:25:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
 <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: f01eed67-9039-4e70-3a5d-08db44d8168e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S39pXvZEPHe+FRRLaI2Zsy5XY5InPUUUm1wDQOwGdF+DdD4H/HxUri3Ni94Srk7UDgiRq6J3Jvx6i9+jEejPUPXirhfTQtKa1surMmlnYjkJtsEAxE0Drj1ZNUWy3zawUryVi7qegb1jBa9f21btV5RsQ9h9/PlVDUKfsWZGnvxM73jNY8azdEbII7bKUcsAmtyq8grUISWQlm0r6HtHflQBlwE39lTLZU32w5uXxZrx+XzQjVESPfvYXeMGCiYHvFbF9DgekyjxXJYz1bKWhyK143+Nsm7H1F17RCq045ZDqAoKI0sYcIhsWaRABtDPOXo1iS+BSIquMw5zRwjL/w9TWq5uzxTsxufG5BGyzzh07QYI0WieiT8i4zqBkecWuJzlXFhDmrz/T1okX76OZYVJnsHtck8iPLcfGZTiPFd3tL5c3MzZQMRheSrui1s2TTnWQWCLK8X+fHNf0s1jV4K5ra5IuB3GywQKqgJX5VB39/WEPB3Dl/CS9vKFVrp1RX4CTcDG38Gkk6IIfIkLNHCrNd4SKvGKoKw13CoZqZ0Ejt90t/iJxTVOSc/j2F5xaKNzz8eDQKQ3VO8RjVz+D+RUU0yxc9BRUPdrWLx8bjpeZ+3huWho4MYpQTPyZ5yG1RX7Bwe9HvoSjaJXoW96Tg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(54906003)(36756003)(478600001)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(7416002)(41300700001)(2906002)(8936002)(8676002)(5660300002)(38100700002)(2616005)(31686004)(6512007)(6506007)(26005)(53546011)(86362001)(186003)(31696002)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2dpYzRoNXk5V3dZejZpQ253UmdSeUFZam9CaXZlbU9zMmQ5UTBKWXZvQ1Z5?=
 =?utf-8?B?Ym5JK3oyK2l4N01hTTd3TEthNndNMkhNUThzNy9SZHZuV0F0NncybUo5VDRB?=
 =?utf-8?B?am81SFVzTjJlWGVURjM2aTBoQ1dmSTFDTEZqblQwQmxtZ0V6RDN6cU1hMDQy?=
 =?utf-8?B?YkRJWjRkamdwZnNDZ0dTSGNHZGtwYThmcnVFdEM5MEd0MUlnaDlYeEJXaFln?=
 =?utf-8?B?RFBoUjBBWUpObTg1Ui9EOEhScUxTdUM0N0QwSUh4clJxanUzYlU5N2xadHZ4?=
 =?utf-8?B?SlpqaHBrUFhydEJSdlhBbGhOM3pWcnJVWS8vQVd3d2pnbkZhMWw2b09IWlc3?=
 =?utf-8?B?b2x2WDBTUkF4S20rUm5tYjhOL3pmRFJraGlvckE4UEkzUk1CM3JyRWJzSmtM?=
 =?utf-8?B?cXFvbE96cWdsWkdyczNLb01NdCt0ckhnQjh0THlqOVI3SGxRZ2o3VzJnTHgr?=
 =?utf-8?B?dlZPMUpvKy9xSk1xSndzRXF4ZC9FeEFSRGtFSDdMSzNRbTdpM3FBMU9CVE1a?=
 =?utf-8?B?MS9ydklvdFY4Y3dkVVlQaG91K29wS1F0c20xOVpJaWVmNWxaRS80bDQ4Yzk4?=
 =?utf-8?B?aTd2TkFVbTU5ZWUyVVFtYm5tZ0R2aXdja2wyTlQyc21aL2RjZU9vR05EbzNB?=
 =?utf-8?B?akd2TUxtcmU5YXh1b1lsQ3NTanFqbkM3TnNxVlF6eHhQdGhqeTNJWjIva0Ro?=
 =?utf-8?B?OUlEZlNFOWhlM3BrbnFGUkltaXYwb016ZGZtTUhycURhekt4TG5TVVZRZkM1?=
 =?utf-8?B?SUVLc2NqVjZDUkZ2ZFNxcHlKUG11SUlOVVQ0Zkl2RWVmMFF4aHNZU3BKSjlX?=
 =?utf-8?B?TW1aTXZaUStYbE1UTzVhczh4clRUdkd6OXdqS3J5K1ZtQlExNytuYWlhTUJh?=
 =?utf-8?B?V1Fqdmt4N3Z5NkNwbVZDS3VqMStUSGNaZVhWTktzTGlhaXVmTDNURFZkN2l0?=
 =?utf-8?B?WXN0MXNjcmdDTGsvSnZzRHZFcEVZS0krYVg5S0I1bHVnUjhIejUvSVg1L2tq?=
 =?utf-8?B?TlM0aWdTSWVWN3hBVC9rdTM5NWl0K0Nhakkramd1aVB6SDlPN2xXUENFaGNn?=
 =?utf-8?B?bGw2ZEd5VzNFMytYd3U4NHpnMXVDclJFYjZPU0UzeHZWTGFUK2h2ODJPNk5L?=
 =?utf-8?B?K1VLVGJRQmxNQ0Rya2JHSGpzL0RodnpJanExM3Q3OW5iK3paZE10NUpYN3dr?=
 =?utf-8?B?enZmckhST3dLSm5aRTJ5L3V5VE5tZXlKSUZzb3lyNjZ0Y0VMRFV3OXphQTRI?=
 =?utf-8?B?clp4L0hjcE1DYTRjaXlRUVZmSng3TUsrVURjN2tUdVk3emkyM1M4cHhvVEp3?=
 =?utf-8?B?UGhPakliY3pDbWVaQ2JMdkVNalhlQXFsaGJxb3ZJemd5by8xaTBqWE00eVpz?=
 =?utf-8?B?dnRyNHE5SlM1L2hlMFpWbWNNQzRwS3ByNkpwRzluQmdyTHppcGlkWHRSa0dY?=
 =?utf-8?B?cFFxV3FhdnVUbXBjSWJRSjNHVDFxSDF0cFg4dVdKYTV5NWxudnk1M2l2eTMr?=
 =?utf-8?B?SFNvMUlrYUUvcy9SYjhWWHJpcExPaExYc3NzNXcybXNkWkFzUWZJODRwZjRY?=
 =?utf-8?B?T21mVHRTUDdMU2ZFcHhYbk0zcHhYcW0wS0s3aTM4T3h0RjRmS3poeWF3cDN4?=
 =?utf-8?B?bFFYNHdXcTlLby9BYUx3QlFRRzlIZmM0eEpjMUMwMUtGL2NCRFhRREw1VFE4?=
 =?utf-8?B?MnpRSWR0Q1lDL1NKQUg5SlB4enFJSG10WlFYTWpUY1dINVdweCs2SDB5cVpS?=
 =?utf-8?B?TEo1Q2sra25SdDdWbmxJNUlMTldrNkcyMERVTU43RUIxVTkwMTFzSXBkYWxZ?=
 =?utf-8?B?U2hNUDY2RTZBM1JnR2JOYThnL2tKcWhWbUR5U0VvSnZhRmdtbVhnMys1U3NK?=
 =?utf-8?B?cXl6R3ZodDVDUjdqbHVuRW9MS0FqMm1JSVU0dkwzdTV1alpibTZETkx4anFo?=
 =?utf-8?B?cEdRNXBUbXE3OE1SbUU3Ly9BZG9qYk0yd2Q4S040QU5zZllWRm00bWsveHJm?=
 =?utf-8?B?aEtveU84NEZldjI1TGdudlppdkpGV2xBa1l6OTJxeTdKdFNpc0UrSzA0T09l?=
 =?utf-8?B?aXRGWXg3dTJWcmRST1FRK2lwVS9yci90SlJHQThGeWRCYmQwbzlyYXFNaS9m?=
 =?utf-8?Q?9csYqWIyhme6P2TiDU8AGOrnt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01eed67-9039-4e70-3a5d-08db44d8168e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:25:08.7213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DshZB9t4C78m2sjutYZSZUHlSd5tsxUKPs1p+nNKysDLUYv0i41c3zIQTreNTRP8ju7Os0qY8nyPBU4UJmS3WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805

On 24.04.2023 17:18, Luca Fancellu wrote:
>> On 24 Apr 2023, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.04.2023 16:57, Luca Fancellu wrote:
>>>> On 24 Apr 2023, at 15:05, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.04.2023 16:00, Luca Fancellu wrote:
>>>>>> On 24 Apr 2023, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 24.04.2023 08:02, Luca Fancellu wrote:
>>>>>>> @@ -30,9 +37,11 @@ int sve_context_init(struct vcpu *v);
>>>>>>> void sve_context_free(struct vcpu *v);
>>>>>>> void sve_save_state(struct vcpu *v);
>>>>>>> void sve_restore_state(struct vcpu *v);
>>>>>>> +bool sve_domctl_vl_param(int val, unsigned int *out);
>>>>>>>
>>>>>>> #else /* !CONFIG_ARM64_SVE */
>>>>>>>
>>>>>>> +#define opt_dom0_sve     (0)
>>>>>>> #define is_sve_domain(d) (0)
>>>>>>>
>>>>>>> static inline register_t compute_max_zcr(void)
>>>>>>> @@ -59,6 +68,11 @@ static inline void sve_context_free(struct vcpu *v) {}
>>>>>>> static inline void sve_save_state(struct vcpu *v) {}
>>>>>>> static inline void sve_restore_state(struct vcpu *v) {}
>>>>>>>
>>>>>>> +static inline bool sve_domctl_vl_param(int val, unsigned int *out)
>>>>>>> +{
>>>>>>> +    return false;
>>>>>>> +}
>>>>>>
>>>>>> Once again I don't see the need for this stub: opt_dom0_sve is #define-d
>>>>>> to plain zero when !ARM64_SVE, so the only call site merely requires a
>>>>>> visible declaration, and DCE will take care of eliminating the actual call.
>>>>>
>>>>> I’ve tried to do that, I’ve put the declaration outside the ifdef so that it was always included
>>>>> and I removed the stub, but I got errors on compilation because of undefined function.
>>>>> For that reason  I left that change out.
>>>>
>>>> Interesting. I don't see where the reference would be coming from.
>>>
>>> Could it be because the declaration is visible, outside the ifdef, but the definition is not compiled in? 
>>
>> Well, yes, likely. But the question isn't that but "Why did the reference
>> not get removed, when it's inside an if(0) block?"
> 
> Oh ok, I don’t know, here what I get if for example I build arm32:
> 
> arm-linux-gnueabihf-ld -EL -T arch/arm/xen.lds -N prelink.o \
> ./common/symbols-dummy.o -o ./.xen-syms.0
> arm-linux-gnueabihf-ld: prelink.o: in function `create_domUs':
> (.init.text+0x13464): undefined reference to `sve_domctl_vl_param'

In particular with seeing this: What you copied here is a build with the
series applied only up to this patch? I ask because the patch here adds a
call only out of create_dom0().

Jan

> arm-linux-gnueabihf-ld: (.init.text+0x136b4): undefined reference to `sve_domctl_vl_param'
> arm-linux-gnueabihf-ld: ./.xen-syms.0: hidden symbol `sve_domctl_vl_param' isn't defined
> arm-linux-gnueabihf-ld: final link failed: bad value
> make[3]: *** [/data_sdc/lucfan01/kirkstone_xen/xen/xen/arch/arm/Makefile:95: xen-syms] Error 1
> make[2]: *** [/data_sdc/lucfan01/kirkstone_xen/xen/xen/./build.mk:90: xen] Error 2
> make[1]: *** [/data_sdc/lucfan01/kirkstone_xen/xen/xen/Makefile:590: xen] Error 2
> make[1]: Leaving directory '/data_sdc/lucfan01/kirkstone_xen/build/xen-qemu-arm32'
> make: *** [Makefile:181: __sub-make] Error 2
> make: Leaving directory '/data_sdc/lucfan01/kirkstone_xen/xen/xen’
> 
> These are the modification I’ve done:
> 
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
> index 71bddb41f19c..330c47ea8864 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -24,6 +24,8 @@ static inline unsigned int sve_encode_vl(unsigned int sve_vl_bits)
>      return sve_vl_bits / SVE_VL_MULTIPLE_VAL;
>  }
>  
> +bool sve_domctl_vl_param(int val, unsigned int *out);
> +
>  #ifdef CONFIG_ARM64_SVE
>  
>  extern int opt_dom0_sve;
> @@ -37,7 +39,6 @@ int sve_context_init(struct vcpu *v);
>  void sve_context_free(struct vcpu *v);
>  void sve_save_state(struct vcpu *v);
>  void sve_restore_state(struct vcpu *v);
> -bool sve_domctl_vl_param(int val, unsigned int *out);
>  
>  #else /* !CONFIG_ARM64_SVE */
>  
> @@ -68,11 +69,6 @@ static inline void sve_context_free(struct vcpu *v) {}
>  static inline void sve_save_state(struct vcpu *v) {}
>  static inline void sve_restore_state(struct vcpu *v) {}
>  
> -static inline bool sve_domctl_vl_param(int val, unsigned int *out)
> -{
> -    return false;
> -}
> -
>  #endif /* CONFIG_ARM64_SVE */
>  
>  #endif /* _ARM_ARM64_SVE_H */


