Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329DC6CD954
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 14:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516263.800114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUrB-0002Et-MD; Wed, 29 Mar 2023 12:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516263.800114; Wed, 29 Mar 2023 12:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUrB-0002Bo-Iv; Wed, 29 Mar 2023 12:24:49 +0000
Received: by outflank-mailman (input) for mailman id 516263;
 Wed, 29 Mar 2023 12:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phUr9-0002Bi-Kx
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 12:24:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b126cc2e-ce2c-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 14:24:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9494.eurprd04.prod.outlook.com (2603:10a6:10:32e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 12:24:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 12:24:45 +0000
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
X-Inumbo-ID: b126cc2e-ce2c-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/1RzJqoJvrMbDUato9JW20HWqlwiIu1cBV2F6DB8RrfMjYAIbSdlpjNPC+E0lXotTz2lD53XuJ+DjTy8IRV1xogpLs3RclgkNfBwdnydyjtsHkwpL492pFjamwgpiAGcylFXfoNB8rjbsMWCPpnfbrBB46jbEN5zLRXK/pjCrvV+W7IO52xcUL4YU9Ed7Xd9rWFnx7fjvc+VC63IIJqZHrQb0ivM5Kt5iLP5OMcGxGVzModEe5OQ+c35/HanIZriyKwg1guePrZeKdMyx9J2JtQIvhvIBPdl3xzhpktDQ/5ZnbTi6GaMTmPVtTvysKzJpCx32pMFnkBAANI9UgCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyYg3i6dNg+T7AwsZ7nfIl4RxewkaT43X+v0JHlgckk=;
 b=Ix1c8EWhpTV92aVhyql/WbkaTKL7Pbm2shDSDE6wCTT8KV7hmJpXOLqBKng025Kqt/9ZuONFAXVQgx/m3mD5zayfM0XCN71MDgTq55kAa9NU0vMFu4ZM9vbGvZfm/cXAXfRy5lusSiIg/NpGO7HM51Yg02GAhdBY8nzWKTeGAGZ09QobY121Eg0/ToWfD+NDVcsslETo01vAIg7XFW0gaAvruMhNIrdF5gdUqNRStDM/bkEs61W2E1LjUJkAKQLJTcUaPO5UIn8Cl1fLXkbIIIt2tb9ndV5i73clr6AAApDhK4WRo4rzBKQJV+Lki5tGaIh89V8Ym4Y4y+MNEmbOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyYg3i6dNg+T7AwsZ7nfIl4RxewkaT43X+v0JHlgckk=;
 b=ziDaWNBFrBrZNmpyKWgVV9dY8mZD54yU3SY/HmoBT0DdTNTlJ9b5BAC1fgonXo4Zx350hDYG8HE2G2oTi8wSkxd9ie94o9iZg1wW94ZRFUA5WxX96Ez9Wsl9MYoCh7NpGX7U1I5NIBM4g65AP2r1B/DRqahjQfLCuspOZsjjqMERSFRUJfZbA9sTgy0Q/fY6vLM2f/84KDR9WvJmH7Dd02e/w75a6fwrb3OOUdWSaLCQtecCkcOHvJIBhUs/7XnvexEzXtYqIK1n+QYgGkrzhIQRsOVWYwHagxi2Wvpiw7dOK+dYerkp1eiDLvq9gpjtD9VQhp8Nm25NtyHotEb5+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f1ac2d6-b772-e25b-7170-5de896aed612@suse.com>
Date: Wed, 29 Mar 2023 14:24:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-8-luca.fancellu@arm.com>
 <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
 <B3F6542B-B6AC-47F1-A273-CC2E0F347E59@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <B3F6542B-B6AC-47F1-A273-CC2E0F347E59@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 609e43fb-019e-40ba-b347-08db30509479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QmIB0JlOdZxyo9Iq13J/R76gB6BeXcBBJUeVwp81+wdzyjpmDzR7wk9ipBJMu16+NrSBxKQlrq7ZrkXQpGJ+FY3o8xhvVAn88V4wdhgrcOHtGu+o8zmq3xhIk4ca8Cjp52QkCAFylPezZMWdBZeJHgLg7djj9l7ey8MyM7I2xioE2N/ps/r1l9q0nAnQGGwrNxObr/+IhmCXw0o3bj7iaKOesIXOSNrASsGL8eX519cPpGkISKbyahgP2czIpYxMHxXCotBpLzYHhlzZFYvn0rZFWgGvioHOYHtUY9924TFcMeKEaCQsCbHkK58K9EqRuscwsMbE+76fs1aN46a8TzfOPGWxN/S4lNce9g/MYEXAQO2ONyVKjrvFirWRgxwXl5WrSgufA0qkzZdkR5D1KhMPm7hZUwu6+axzjNX1eGZyb7SPygGBVO+CUXHTrp5D7t2mK4+WhwTY0dpDYLyzhmT9+DfabL++KVYJ170/B8Q+lY4VCpRwQrJCpmhZzF96zbSv4PypeldLrkpj32KYaHDPcKe3HgGME85r6rdtgw/P5mh2hh1IqJR9gRGPJhBeqIYNQXxDrdNCnSfEwF424NqGTRSq5nGRonpOhzFVGWIlWtBFkqEngKOZhWDnerAjlLwr0JHDurAa4YQUGJiGnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(6506007)(6512007)(26005)(316002)(6486002)(4326008)(54906003)(186003)(53546011)(66946007)(66476007)(6916009)(8676002)(66556008)(31686004)(478600001)(41300700001)(7416002)(5660300002)(38100700002)(2906002)(36756003)(83380400001)(2616005)(31696002)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2tEVVZiQW9GbVFaYVNwREpMUklsZWkyOW1COEJ3ei9lckFoYnBZYUc2cC9s?=
 =?utf-8?B?QS84K1dEeUNQZVJPM1VKRUcrNU9mZFhTNGQvVFQ5dEhDZVZDVEZYTzRqbEV6?=
 =?utf-8?B?MENHclNZNzMxYUdMZmlEaGQrZGM3RXpGZlRnVXZ0cmNZL0xkUmRJV1Z2dFI2?=
 =?utf-8?B?dDdVL3RMa0Y1TVY2cUF1YkcvdEx0S1RuV05ZTjRKSjArZXhDcGVNQjJtdlF6?=
 =?utf-8?B?RXMyLzF1aEo2KzZkQkpaZ1ZGR3krSHM2SzhxdzlGRUVRZ2NrMHkyQlIwb24r?=
 =?utf-8?B?MXdsRi9JdGlwR2Z0dnpTNnpFQ0hkNGpMM0IrRkpzTlJkbVJOZUk0dW9GUGgx?=
 =?utf-8?B?RjQzUzR4QVVSSi9NM0JLdjhzaGhaak5kSzZWWC9DcUc2eHkyVFdkOTBFT2JG?=
 =?utf-8?B?WVF6eGh1MitpU2szNk9yczJPM2hjOWc1NkZsZXJQL2E5MVJtTXlyZ0FmTWpR?=
 =?utf-8?B?ckc3bFhjaE5CNUNFMGdPRlBUaFBGbk1YcDU2SDFiblQyRVViK3crLzBPQTh1?=
 =?utf-8?B?YmxUQ3VjaXZ0b3FrdVJwczFRdFhHMzNIekdNK091QzdGYkk0SlhwR0VhWFRD?=
 =?utf-8?B?eDZmaUpxeTJMVXBwck1HeVloUEVwdkRjVGl0RWVNNUVpbk9ubCtNVWVlR2NM?=
 =?utf-8?B?bDh0SjVKM2kzS3M2bFF1UFNtN3RtYWtuSDhpVCtOZnR0MmlKeDdGdHNpY29n?=
 =?utf-8?B?MmwzL1ZvdUNIOVpPdWZ5MkR4S1AvWnJreDdNUTNLSFZIbGRSVXY4V1VveCtN?=
 =?utf-8?B?VnpOWE5HTDlqYWQ1a2pNQkUyNGtKMjNMUGQ3M1cwK2pPMzd4ZUt5Yjk5ZnA3?=
 =?utf-8?B?RWM4ZEN4QTY3eVFrN3RxMVAzOW5mYXpDbHFrS1RwN2dmV284OUlCTGhrYVVn?=
 =?utf-8?B?OUtRWE1rRjhwVThBQ0VyUUl5b00xSVFMMWtPK2F6LzNjbVU3WGI5TWdUMURy?=
 =?utf-8?B?RTJ6RzlVbVpmcHhOUmRPYkwzVThMdlpqVzFUUk9vMTk1OTFMcGh5bXMzL2l6?=
 =?utf-8?B?SzQzUlFKYzhKSFFoQVl0Z0VlUXNrdGY5SVRhYjdKdFAwR0pWd3V6ZWcxN051?=
 =?utf-8?B?V3ppQ25wRDhHWjdld1pVRkJZV2tJVnJOWGdpSDduRENkTjg2M3MvZnlBSzNH?=
 =?utf-8?B?T3RhdVk5NjF3MnBTSmIwTkNrZ2xmeXduZ3g4bVdObnovMUI1MURKL2s0OVNO?=
 =?utf-8?B?UnpxbDhqNHhiUHlnRm5HNmRmWUU3d3FBeUxVb1NQNjRsT3ZFTEFNVjZ2b0hp?=
 =?utf-8?B?bUQxbXRWNzN0WXJLMjFmUTFOLzhGbXV0YitKTkNXOUtDNVo0ZUJMVk1tak5Q?=
 =?utf-8?B?alRZazBUdVNxT0NYT0lsNWx3RWluWTdiTDBVMFh1SkZjNXdOZkdHeGc5TUVJ?=
 =?utf-8?B?MlFxRTZyc2N0bmZHTVlUR0EwaEtjd2RNQ3N3V1hSRnlVNENsUWlyc1Uzd2pH?=
 =?utf-8?B?T1ZXSFk4RjFYU1VlbFhOcHlHQ2F1T2p5OXF5dVMrYnhmTldQY3J4QTVPYlVn?=
 =?utf-8?B?cEJGa1NOTkVoZHhpZlFlcHRvb1pyZk1RN2ZhSDBKQkZoWGdmbUF5N1BoSTdK?=
 =?utf-8?B?SEFkckppTWxTdkpSZFpkZDd3VnZ5ZVJ4bmh5dmdEYWtFaE9iWjcvZnhOWTlC?=
 =?utf-8?B?NGtnaGpiTHhDWnNjNVh6RUx6Tnp1emd5QlpvYk5Vd3BwYlFYK1orcE96M2Vl?=
 =?utf-8?B?dkVmcVN6bGt4MGx0a29PYitndGorODhYZTFiUVVKSjlhZTNIY3RuZE41c3Fq?=
 =?utf-8?B?UDk3ZkFuc3BsUDh4UG9OOVJhRjNJM2MrWlpCbG1hRzd0SjlZOElTQUJIMXFC?=
 =?utf-8?B?WnJMdVNhQjRONE9EYnl4aGlWTXBxMTJ4cFYxUE5hTmtma2d1S0dMOUJhQWlM?=
 =?utf-8?B?eFhCRWdhazRaREYvSUJuUDhGT3Qvem9wekJDbEx5NDJ4aG5QVDhGSkFWam56?=
 =?utf-8?B?ZnkvaXFGZC9JTGRZRnBnZWVSbHRYS042SWNJME0vbG5LeHpackh2WWJLak5E?=
 =?utf-8?B?ZDlZMXNsMHFvVXIxaHFadGg0anlLbmpsSXNjYWxLUFVLQlpqZTdhWEtNVHBw?=
 =?utf-8?B?clN4SmFqQ2Y0dE9VdytNUFJnR2xseFhvOGhDcW5jZ3BJRDVxTUR6RkFIVGM0?=
 =?utf-8?Q?qyqzV1ZVGLfpE1+z6Zzc8k6A+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609e43fb-019e-40ba-b347-08db30509479
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 12:24:45.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ww+azxNlzjOpGC/bPcDvFO7SmZNC+ZxF9ptKSaTmUT6HeUKkO/92xx9x3+Qr37YVQa0sZNCwK3kl9HCnjjljfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9494

On 29.03.2023 14:06, Luca Fancellu wrote:
>>> @@ -61,7 +62,12 @@ custom_param("dom0_mem", parse_dom0_mem);
>>>
>>> int __init parse_arch_dom0_param(const char *str_begin, const char *str_end)
>>> {
>>> -    return -1;
>>> +    int rc = 0;
>>> +
>>> +    if ( sve_parse_dom0_param(str_begin, str_end) < 0 )
>>> +        rc = -EINVAL;
>>
>> ... can't you call parse_integer() right here? opt_dom0_sve isn't static,
>> so ought to be accessible here (provided the necessary header was included).
>>
> 
> Oh ok now I’ve seen why I’m doing this, because ops_dom0_sve is compiled only
> when CONFIG_ARM64_SVE is enabled, so I’m using sve_parse_dom0_param()
> that returns negative if that option is not enabled.
> 
> Otherwise I should declare ops_dom0_sve anyway, but I should not accept user
> customization of it if the option is not enabled.
> 
> So I thought the use of sve_parse_dom0_param() was the best way to handle that

Maybe. But please also pay attention to the existence of no_config_param()
(as in: consider using it here, which would require the code to live outside
of sve.c).

Jan

