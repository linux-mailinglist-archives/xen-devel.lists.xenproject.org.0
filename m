Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8A802D80
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646613.1009045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4b5-0003E4-HR; Mon, 04 Dec 2023 08:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646613.1009045; Mon, 04 Dec 2023 08:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4b5-0003C8-D9; Mon, 04 Dec 2023 08:46:35 +0000
Received: by outflank-mailman (input) for mailman id 646613;
 Mon, 04 Dec 2023 08:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4b3-0003Bz-UQ
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:46:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a00880cd-9281-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 09:46:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8138.eurprd04.prod.outlook.com (2603:10a6:10:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:46:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:46:30 +0000
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
X-Inumbo-ID: a00880cd-9281-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiZtZgYReO0klZSIvD9GAJb0dYHCnG3WQV3/ivI+HueZO11W0+AVZZ+mmzFsT6nAewz4vGARVXOw99nsFTIh2UnIkzUAIozpdbaE92omQzYnADE3eFJCIryEXsiNQs8UEmbTqz1qtk0YkMYXa5Q3iiL2X0hZMDty/xgbybvLmnki2KPr4WM4OZITs3dVVDlhBHXd30B2qFcYJAwuUEVtrP66kwWO0gv2Go2CI8bB1/QxTugUjOcFxO1eL5BT5K5rZxTXWIPnY7H8db8pRgOq1tjHGoZak7/Ir+xlApe0g/CONmfhKuSDxPO48S+k7MM5c6M23TyDUV9eai8vMPHlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnD8V+ijjlhacRYMNNogsT3kkSLmq8e0R1KNQSIUpws=;
 b=bf30C+zUAI6EhcIzSDNVFWARBZ9ihjSJ9AE8Wx3KyfnEsUDMYZ59MBQa7a+scSPsNrZlEWgE5quQYNCa1jhmdYNBhklrJWmg0Sw1wUNq3DZiGs+l6173LEMUKLUkko51JGJ97eJZd1mK9fOkPPZNn0m1qKhnt9Co73P0QbFRCqes5lQkPMPZO4h+WktRO9PfvOW9PmaM+AI7QlGshPVAEDfQ0Z8FHORArTr6clsZ43Eyl72BM3jqv4jcoEGfw06gGu0wKOVhyYdc33SI0Zf9gTrUPwtwdjh5Fn5m9zHbMKOmqLVK8MT16YoTLYv9NllFlmv0nQ0IkrYtcWF1DhgXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnD8V+ijjlhacRYMNNogsT3kkSLmq8e0R1KNQSIUpws=;
 b=BYCxqorTQ8yj2zdIWRfp5J3FxXvO0ANcqi58h0YvvGUSgS6RU2+e1JvfW+UjWONc+HnmjvGfCIHnz4GP1tcfz5w63kuOQLwYTiTUkmWS3Qfgq3tBwcgQgybw7c5Jub+rLMda+cVh3p4f/mV5M1H89JcUDhu3CALm7Qp+OPN0exU7bN+4i6z/pJfloKvqwUtq2pf2KhHx0Cf1X+oxtlDowzZRKWsZLfJVmXeXMObyrjjy7wxcQ+rEX8OsQlcrlqYAv8TD9TRBw/5lhjkI5aycW3jGNEZknIyFTPAkcLrj6A16l0/o4LRnpPMYt5Nn3Q/fja6vyuYGxnbTKRSBo/5j7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14d0c19e-2a40-4669-aaf5-ad1bfc8b77fc@suse.com>
Date: Mon, 4 Dec 2023 09:46:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
 <d42a34866edc70a12736b5c6976aa1b44b4ebd8a.1701453087.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <d42a34866edc70a12736b5c6976aa1b44b4ebd8a.1701453087.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 672981c7-86fd-469f-11a8-08dbf4a58254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0jcvl9iJSUFNM1xl0JR10/X97Ti/IZfejIN0IuSvVUBXkps/6rT0+mV1n2TunWVbuyfyUHdBnAZNiW+tLgfn3A0RJDG5yxnS8HWzcq2uWGo8OWG9StbLpt5au95VGG6KnNBeyvdqgyWkTIo95cuylaDBp5VCcq8ao87EZUhdFPglbHb7FSpw6NutSL5UABxHKkxEeJCFHaJQbQd7FElAnD9amXrSBUR2m5U/EOqoRTLQf4+DmyM5AyS/sItrmtAU4faXqNfB3/eihrEASackXUegJTeIszciVm2cI/umIx/Q8FuZ0ZtW6+fY71E+OT2QIHmoZcawbgXSm959IJIsNYGzfPz0fFvLqzd9EwTL670i2UHyuA49A9TSZlCFa510cklvMAAh55eCcI7dYn/VDMg1FoDQ+0f+cJXwn3uHG5iW3kGTAU7lHKsybnwPwyNs/eDBo6ocoepkAWGEHWj06J2hIKfL27PG5FX04OxiJiUr3iJ18ul2L2YYMwz+Z8J+ieMsQP2c1Yl0IQprhPYg0ho/xE9VjGUnYFQEkRKvbwlqqFQ87jiOG0ah38GO9+kgV8EkAceVaUE+Pe6TcGMPk1BvHZ2Fq3iUquoWmKKLTjTjUgwWnxJo1d/4yQ3MfNlMvXft9WG1xOexB2YygX1VeR1rq+eTIF+g9c2tLGyV/vE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(7416002)(4744005)(5660300002)(31686004)(54906003)(316002)(4326008)(66946007)(66556008)(66476007)(6916009)(38100700002)(41300700001)(2616005)(83380400001)(26005)(8676002)(31696002)(8936002)(36756003)(86362001)(6486002)(2906002)(6512007)(53546011)(478600001)(6506007)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdwTDl2Z3hvdHMzRGx6a0xmb3lxSnJqNUpQeU1BMldaWHlDcEpJVWc2WE5E?=
 =?utf-8?B?ODNxUjlkcnBDUlNLWlJaS1ZWeEJlOUhYSWdDSVpXS2dRa0ErTFlET3lnMzZx?=
 =?utf-8?B?NUVXUFpiaFlQbFZNdVVuNnU4UExTeUttS1pNY2kxUS9yRXZLcks5ZGYzMmNM?=
 =?utf-8?B?dEM3NXk0OWptY1JCUklIelF0aHY4Rk1hZEJ3Tlh0K3NJcVNLMTJDQlBZU1FM?=
 =?utf-8?B?aU02Y3FhdnlwL3o0enpuM2ZjQXp3cC9UbVVEQkNUcEZTS3o4WGo4QmJucTA3?=
 =?utf-8?B?VnV4dVMxeVJtOFFxS091QjF6aEJvS3ZFRHBqeEgwUlNXUWZ2RVRxYnBFUVdI?=
 =?utf-8?B?ZHU3YkhPZ1ZNclAvaEZkYVExbGVtRmcvUFFlem1SS3o0Q2NHU29Na2toSDMx?=
 =?utf-8?B?NHlCanJpNkJZWGkvaGpteXhwL3NDeEhyOXQxZ2VWV1pUN1k0QnlmTERla0JP?=
 =?utf-8?B?UVlnV1R6NDVlM3VndnMzY2gzSnZTNEN3dm9JRXkvYVFOKzBwa0U4dDlURnR5?=
 =?utf-8?B?b1EvZ2hyTktESXhjc2RHdXJ2VG4zM3VWQWVLTyttK0JZVG1ZS2F2VHJXWllU?=
 =?utf-8?B?a25NUEFIbmNyNmNXS1RRTVZyb3BDeXpRWXpYZFptRlBzSXRrRStXWXhhZEtv?=
 =?utf-8?B?enhmVXhaQmVBT05vUlZnbjN6ekRRdnRYa0NNNnFKNDFhK3dKS1lXNXhXdUJl?=
 =?utf-8?B?OWRPTURZU3AvT0ozZWJZa2FYemxsQ3duRVVSU0dyb3BkVWZWRzNnTGh1cEVs?=
 =?utf-8?B?STM0SmQ3SW1QMlAzZG5hZkJiRVFCUzgrOGgvOTdKR0w5eGViWFdYTUh5WGdE?=
 =?utf-8?B?a3l1TzBYZ3hOOTVLbXJHZ0hJYldJY2hPcC9lK0dZMUc2OXlEWGxadmNKRUJ0?=
 =?utf-8?B?UjNuMVRSeVNqdVlvV0ZLLzdnZnhJVkgwUXhwcVc0VHplOFk2TTlSQzNZcnc1?=
 =?utf-8?B?NWoyandHbjE4RlFKbFk5NUtXUW5Uck5scnhhWFBTbENQVHVhMFR3UXpvc1hn?=
 =?utf-8?B?anE4dng0UEVEVFduT0Z6SmJ5ZVJtcHFQcXVzTnN3eGxJU0E4aXo1QlBOWnpI?=
 =?utf-8?B?VnQxY2dVSnZOYVl3bVZSZVY4dFRsdFE4bCsyeU9zM0dOdFpiQUdCb2treHdh?=
 =?utf-8?B?bjlBRHR1d2RxK25ZSXhWRWw1SXQ2TzlMVEZnVmdYVEp3VGQ5bzBlWDJkc2lj?=
 =?utf-8?B?ZlZsRnNnYk9lN1E4SkRqd0MrMUxJc1EyVWFKaDczSUxaVWxPOU5rSmEvS1hH?=
 =?utf-8?B?eE5RRXRVbUw2VEQxSkEzSzhoVzdWS3NXamZxa2l3YkZ5azM3MmFpT01NUWsv?=
 =?utf-8?B?U2VHYUpjN2d1elFaUTVMaXpxTy9MV05wblcxaGpqZ2p4UFZKN3IvTTVaZEZi?=
 =?utf-8?B?bzVIdEI1T2NKK3QrcExQVG1LWDlXbDlpQ3dlanRwenEzVGk5dng3V0hIRUpZ?=
 =?utf-8?B?YytkSCtDUC9ZNUFRWnZwdng4ZXdCUXNXOUYxNlZOdlFrd0l4VkdkZDQ2Q0V3?=
 =?utf-8?B?Q0J1NXEwdURiVnRaOXpaaVZCOXJiNi9sVko4OC94VVc3dTMyMkxVeC85VW5n?=
 =?utf-8?B?N0Z0cndpdzZIWXlBenJrM3RMYUFsa3NTTVRUSDNweEZoUjZLK2hUQTR4Y3ZP?=
 =?utf-8?B?czNPaDBQbUVQNmkrSWdmNmZLL3RJS2VqUFRoUXExcXNnZTdIN0drd1BxV3lL?=
 =?utf-8?B?UW9VVTEyUy9ZS0JwQ2J2UkZkRVYzUGJ0VWl4Vm1UUU5zYllwUkN5Skl6RG5K?=
 =?utf-8?B?bmswb21DYXdHYjdJekVLTkN2K04rcWk4ckQrUHlhWFAzSVIwYzJxaG9mN21X?=
 =?utf-8?B?RkZLRnVHRU5tRXpSU3M5blhvSTBiUFh0UGZnYUxjc2NRUHN1eVFQS25zUWxi?=
 =?utf-8?B?UExBVHNRQ3QrRysvWEpFRy9RVUx3ZWZPOFV1T0loU3JFUGVqZURyNTBOSS9a?=
 =?utf-8?B?Mk03U0E3eDZxdlBMM205MkQ5YlNhb2Zhelk2Qytybm4xNVBvNStMYk9RYVo2?=
 =?utf-8?B?b285b1JNNHZoQ3EzZEtwOGk1a1pMR1BMTTRiM1Fac0tNdWY4ekQzR1ViWHR6?=
 =?utf-8?B?ajI4RENNUFhaaW8zcGF3UnJZaXA4c3cxU1A0ZVlIdjY1aUtabEVBc0pnSmMx?=
 =?utf-8?Q?JitSTVYlssuZsCcRoo7QXpbM/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672981c7-86fd-469f-11a8-08dbf4a58254
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:46:29.7807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0vgyVk7y5qW2twg9xVSIpnQiN71JlwLe4MIL9vEQ8vBNStNWVL20eFsv7mvsv1M1dztw5q9+8ObPJzx+ipXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8138

On 01.12.2023 21:48, Oleksii Kurochko wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -87,7 +87,7 @@ config MEM_ACCESS_ALWAYS_ON
>  config MEM_ACCESS
>  	def_bool MEM_ACCESS_ALWAYS_ON
>  	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> -	depends on HVM
> +	depends on HVM && (ARM || X86)

While - unlike for GRANT_TABLE - I view going this route as an option, I
still think it wants doing without explicitly naming architectures here.
There wants to be a HAS_MEM_ACCESS, selected by Arm's Kconfig and by
MEM_ACCESS_ALWAYS_ON (which in turn x86 selects). This could then also
replace the HVM dependency here - x86 ought to select MEM_ACCESS_ALWAYS_ON
only when HVM is enabled.

Jan

