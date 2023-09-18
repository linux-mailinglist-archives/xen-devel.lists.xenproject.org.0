Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7562D7A47FC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603933.941082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiC6A-0005SP-LE; Mon, 18 Sep 2023 11:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603933.941082; Mon, 18 Sep 2023 11:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiC6A-0005QN-Ho; Mon, 18 Sep 2023 11:07:26 +0000
Received: by outflank-mailman (input) for mailman id 603933;
 Mon, 18 Sep 2023 11:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiC69-0005QH-DE
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:07:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bb189d5-5613-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:07:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8608.eurprd04.prod.outlook.com (2603:10a6:102:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:07:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:07:22 +0000
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
X-Inumbo-ID: 8bb189d5-5613-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwzfry3lWq3DuT9zHOWjgiuEmppXADva8/AMoTcMkm5RKmgyRxBBNfgphYQfnfKm/p3fOl719cbv5RtS6Ubq1L9z5loA4Zrzrn41UB3tWzkKszWnltKxjzDHf5tOTs+dU4RbGfl14grBXmCL0BhBXikRnRRXzUqhZLU501SYZFsvJJW6ha4fa5r6r0HHGgk0jesun5gQHGG+k7cTECYvAeA2asNpxyKq9g4zUPDsFKWuee2JBMP5GoBTy2j2LCaeT9NBZFT5FxSu0V6kj7ypj3aD6g7UL7uXJaNOj1vqPJE3ROCJ4hIVT8cajuIS2hG8AIrSb+Wv3cn46AcMkays2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlLy2xw/iIDJLB3hZJl5DpxPqrnxRAjvgfU0DQKpTdw=;
 b=lWEyzhphJ1fgkVcNmWulPf/+DorvlWPKVHnJI2k2rwNK3KsTBoTceBMqv0iQunuksEG71KjEfqZ2mXyrLJ69Oer9E+aD3qT5RGIikl2EoN6kfNjQLiIVyuKnQkf3Im8FxxrIt/ZLGrbU+6pfBEV4Az5VFcdAz+Hc4LJuHn6Tvc4OPucDwh2BsmlBdQBO3jt1qkDpNqDZibQ3ec1p92CqRfARv/sF9cQRZ0O4n/NsJJ1JOUFB1x7+WfN+2HMyUAOs2W2HYSssHKUDEXsL65/uKG/Gz8y4vYhTYYwFXwqNaSXfnCJmPLKCYHZiucK5PcEWzGdyD5C0GgWcjBBsPB13EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlLy2xw/iIDJLB3hZJl5DpxPqrnxRAjvgfU0DQKpTdw=;
 b=Z0m21KiSXmnaEvVPuodH59xK4R0KlcFD3xjrZIlsMn8PmzoLLSYQiMAZ6F80o7K/MrLS00/DB1YJ1XHq//2BF1kkbd9nyD19ZODY+7rJXdZaeCXByOSPfRbxfyEtcbDvx8PlkR0+DjOj4HQdm3qlaRvB27m7zpsSvv8MVCDHWwgrTUN5e/L/Ftep8KTarWvfVqYZaOMTl7p372CMS8kyN98t8jYECt1GvIq92CfYFrKZBJyYl2H7Nz5jTRBS1DozI7ORLL6/ZsfMnm/A965Deg+zWd9RtVLMPf6gLgI3uWjEHaRSpOgaQ1Rph5Jz1HpQ+jORdt1Qo88q/D3hh4WVyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e28bbdf1-31e7-9500-ca5a-00cf15ceb33d@suse.com>
Date: Mon, 18 Sep 2023 13:07:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 8/9] x86/amd: Introduce is_zen{1,2}_uarch() predicates
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915150038.602577-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b42c268-8811-4fbf-9869-08dbb8376e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J0l0ZB9zidSHo0kAgc8goD1ZC5fwLiM17DvZWDf5BeXjzE97H1kRh7iBV/wDKsERZPERzOLbfYXYoVBuWR3NHTtBCeXBLCIIs6lkCoBnwlWyUU6vbSxN9jfYZmqPn2Bo6EQ5HGAI+uu6kYgbYhEWjLIUtrwIkjwziBclhWBkekM6hz48U95BH8PMylKoZDj2UyT0MrYEx/l1bsF1ELjoE2KVZDoW0x3y3Su1op9gaoia445aK5+bFji3yqFs3xomNesiw8JwvJNBu0LHfChq+aGV+lSkk+xn2NfPXfyKSm7j4w7N560Zabh4qDLkTY0ReScyQRUzDvI5csEKYHCd+C/WPiX+9Ft9AgBhCFeOwMvQJu5lFnucpiQ4mfknKPLINkSg5mvT7+NdbclnVwhJWb/bK70e3eeQ3SOrOl7cEVBrP9Zi3/JqdsKzBbyTUoG62mHJFByunW5tcdHQKkdqbDcbgiNpnxqLCXA36uy8MdSHKmuadfiDsnXqLSXVZ0TjH8wSjS9JOYWvY8lnT4g7221i1H0oL0TjAVUs5kLD5yhAjxHuFJSepEw7y8vhXFfT1fayTUN4fX2p+R6W8ICXnoHVRuESPWLsg+n4Jnv5w2x0W7tkdwHGm/OI4UqaYyUDfdIfE3qSeoeXeC7QVxXUdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199024)(1800799009)(186009)(2906002)(5660300002)(26005)(66556008)(41300700001)(316002)(6916009)(54906003)(66476007)(66946007)(478600001)(8936002)(4326008)(8676002)(31686004)(6486002)(6506007)(53546011)(6512007)(2616005)(36756003)(38100700002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VWVDQ1UG1GWUhxMlhEdzdPekhmck1pMG9YOU9RM2d3MjYvU0hyV25zR3Fs?=
 =?utf-8?B?S3k5TkxvM05PcXorTVNXb25YTXZCeWdrMzNMS2xLWnhYTG9YSHRqR1p0bXB6?=
 =?utf-8?B?L3BWUGtoVXlpZkp0K3BrN1lwd1BGSWw3QlJLVnRSdEJMZTNzb2x0R2lBaURQ?=
 =?utf-8?B?UWJRUjhPWmtYN0Z5ZHlESVh4TTB6S2N4SkUvZ242OFMraFF1MW8zcDNwM2I3?=
 =?utf-8?B?ZTNEaGw4UHppZ0taWWlLd1l1cVd4MlpVVTRzcnkvS1dWcjVTSm1hSWQxakpv?=
 =?utf-8?B?R2tadURGSnZoNGRNMUtOd1ZSSzlkWkYrcVVrNzhrVWFZRGxHOG9UaVEyWndY?=
 =?utf-8?B?aXFxZ0NIdURGTmpIa1VTQS80SXk1WXpzRXFnV2hQb1ZhQW1GVUZhcllHdWlC?=
 =?utf-8?B?Mm5hbngzQjhJODRQREY2TjkwZjUyalJUZEozdGJkNXlpaWJXRnZrc0g0OEcx?=
 =?utf-8?B?Y21qSDJxQmxCaGdBQllXb3JZWjNjWTYrdGJkSDBQWUpRTXY5Z1B6YmhHZkg0?=
 =?utf-8?B?bUxoQmM2aWNmbnlyRnYreFRWdHVFaXFhNmEwNndIWm0vWlkxc0NaVU5teU4z?=
 =?utf-8?B?eUxoVWx3cmpncWtUUGxDWlRiNnR0ZXk5aTg4N09yOFZTZ0lvSFB5d1ZPaWRI?=
 =?utf-8?B?TFZZZnJxUzg1cUFDd2tJcElsUU1xbGFJN24yOHZTSzJVeXNyNGs1dy9rSkJ2?=
 =?utf-8?B?cXpuZG00RTI1MmpVL0JOS1M5cFRIOGZXK1lWNER2SnlHVG1ybDF0RDUvNVFG?=
 =?utf-8?B?RFFqcjhuRDFER0J6cHVnY21XdkxqdFpZZnVoWURNRXBrRVJ5cUszMjZ5c3dm?=
 =?utf-8?B?V1RtellsTlhtcmd4QmdmaFpVdkFoWUJURlVadlV2bmNGSklXdkk5RmJ0Ymsr?=
 =?utf-8?B?WmdySlRuR0wycjZmMkRDOTlMNjJaM3ViMWNDVEljemkrSlBiVzB2cDVLU01C?=
 =?utf-8?B?dXZ2K0xsRkE5WHJHeWdoV2NKc1IxVVpNVkZTMkwxS1Y5WlhwNVdIZ0o1MFI1?=
 =?utf-8?B?NWlDL2hPNm9HcHNLT3p2S2p4L0NWU0ZhN29zR1Y4enB4bnB1b2ZHTkFFaGdI?=
 =?utf-8?B?bUt6UElVQWoyRDNTUC80Y3NJV2YwVll6YmhpdGU0MWx6U1FKR3Y4SVNWL2VF?=
 =?utf-8?B?R0d3MFRlU3RFU2J5bWxLNFZlOFZyYUgrN0VuV0I2dnpUdTJRejVPMjN0bGN1?=
 =?utf-8?B?T0tMVWlrZUxDQis0VnVHZ002V1AzbXArbW96ZTI0UUx0SU5iZ0xVNStPcGd5?=
 =?utf-8?B?eUhpbkJMc2tPZ1U5TnpTbldGczRmT0tmb3VBaWhzUmhqUDV4V3dMb2VwODBv?=
 =?utf-8?B?ck9sd3BtWUhQa2ZPVUg0M1V1VGp3c0RHRm8vaEZsYXNBUmswWFFXaGJDTHIr?=
 =?utf-8?B?SDlMRzE1Nm1zVWVtbXZydy9DelRNZm8zVlhkd3NOZ2FpcFBOV0x6cVlKOTR4?=
 =?utf-8?B?dTVjK25nUnpJTnZzZEhJZzdkM3hUei9mR0ZjNzJoa3VYZEZhQ3pkL21wVEVK?=
 =?utf-8?B?MmRJNmIydTRSYitaaWxwbTNPNWpnL0o0VnMvWDBERStBQVJSZ0RMcFpBNmUz?=
 =?utf-8?B?RFBsUmtDTkhTYVI2TFljejZGQWFOUVdEV1VhN1RZQVJBbDl4YjU2WjNmblFk?=
 =?utf-8?B?QmZWNkdjczhnM3ZWSEZzUHpZM3BNRS8rclM5TUpRZVVLYyt4N1pQNXBXbEMy?=
 =?utf-8?B?eDVQRmVXQzV1WFFOQTgwV21WOW8yK0VXR1l2a0xncTV4QlZyRzdRRW5MTDU3?=
 =?utf-8?B?N2hqWVhmUHFIOTUrbzZhcVpRU1FTdTZnbnMzK2tBcWxER0xocnk0WWtCdWZt?=
 =?utf-8?B?OVgvVkxxTEhpNXhwd21KL1ZwUFpWSTY4Uk16RkJ6RkRXZmdGdmpwUDZkSFdv?=
 =?utf-8?B?Z05IQko1bmRxWmoyanFuYllabVdLRDgyTU9JVVlkSjBkMEpuSjdPa05JcWZk?=
 =?utf-8?B?Z1NJMCtNaVMvY2hPUzQ1UnZHZFlUSTRlSTk5YmhXdGxsWjFucjZXMXlwb3BT?=
 =?utf-8?B?RXBud1RjQ3Mwd0ZDK21mZ3hyMWZxWlBUZHhUQTBnQ1lUaFB6Q0xaVzlWc0di?=
 =?utf-8?B?OVYxUzF0M042WVVCNXFSS3FYVE15KzJSRllmYm5LdnNtd0k0c2p4ZDI4VjAy?=
 =?utf-8?Q?NpZqB0C/2CgASZdv8zHkwh7he?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b42c268-8811-4fbf-9869-08dbb8376e9e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:07:22.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCVxVTMI6ydzVcEnrsROZyNgv9bilUfYbqWEFCPVwqM+RRNhrAO8aQGvDOE5KvKrFAxByqZ0paNEDqTOPDS3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8608

On 15.09.2023 17:00, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -140,6 +140,17 @@
>                         AMD_MODEL_RANGE(0x11, 0x0, 0x0, 0xff, 0xf),	\
>                         AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0xff, 0xf))
>  
> +/*
> + * The Zen1 and Zen2 microarchitectures are implemented by AMD (Fam17h) and
> + * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
> + * as a heuristic that distinguishes the two.
> + *
> + * The caller is required to perform the appropriate vendor/family checks
> + * first.
> + */
> +#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
> +#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
> +
>  struct cpuinfo_x86;
>  int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);

With one simply the opposite of the other, and with the requirement of a
family check up front, do we really need both? Personally I'd prefer if
we had just the latter. Yet in any event
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

