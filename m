Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A170515B
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535290.832997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw7t-0001Ca-58; Tue, 16 May 2023 14:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535290.832997; Tue, 16 May 2023 14:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw7t-00019G-0s; Tue, 16 May 2023 14:58:09 +0000
Received: by outflank-mailman (input) for mailman id 535290;
 Tue, 16 May 2023 14:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyw7r-000198-Io
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:58:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1057dd41-f3fa-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 16:58:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8445.eurprd04.prod.outlook.com (2603:10a6:10:2cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Tue, 16 May
 2023 14:58:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 14:58:04 +0000
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
X-Inumbo-ID: 1057dd41-f3fa-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPtBLE9yNVGUPbyDwZU0hHOv0ZQ5N5MczuoEMNlvF1uiX16JNFlQjbLQGfAcJMJuarba6HBknzsLIySPm/0FinOMqfwL/hdMcXEAlvcTc5ey0elqFzHBp91oEU3+kjVE2pnTYjYA2OVBESuHeQ6HNYs5cvMm0ghICLvOh97tXv3/HCncX6eMsaisnYbobL1j96RRTH1wKOxpJrq8Rippdj+X+L+6ObN5lQAVQY74P8zh0NbX+Z87LYbCwIhO/dW4UWfggtzThRz+8o04cmmSfro6r4cez1kqWV5uH5vYFco5IgH6OPcZrTMg3DWQnxFwTMk8d1XULTXH5zLin9ZFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOWyj1RNtyffmMO8fnLkKiE6NI7uYuHL2YVFcqmqZg4=;
 b=KItRshzB5Ltrn8BdBhABsQdqUVgb9o+OnlwWKEBCfle4UEq9Bt3EUwnWjimAjuuxA+XKe7Zfpq3iMLNCLuNIrWtX/BklKMUE4MWGm1aKvhUeKJ9kjZ3dd8smSdLGUOhDzeb4r5XB5Afo7hxvu85itIzJ7Cr9kNKBLWOhRACI7hNzSLUtbxVBnfgRt2QZR98s445QaWx4ToTbX/goxGssRSHF/Xd+rmMUZwTylo/2MtgGtTotCk6MKiOtsFfoLIQOkQLR9mhd8hxL8lpC6UioONTl6zFLYIR9nXnpZdOatQtjgoWFpDmo236jrJ441ZLiPflPETfWM8tkTBvSpyLkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOWyj1RNtyffmMO8fnLkKiE6NI7uYuHL2YVFcqmqZg4=;
 b=QTOnae0ardATfmda7Sp6J27V6XaIgYMTrh00kKFcIM3RXdlzwobBEkbkBEPv8sFuZo4mkJZnNWnWe5vxxbXYpWz3PEJ3M3AqZkjHCe5Q2/2WPIdLQnbEb+Tlg/FGLjlR9Q95Wvul1OvPJlVnTGveUzHOOCKCQJH36afZb6SSw57WqQB/1uziLACglseoQqFq7wc+HqVR6rQSk2GtiieOWsX/bcngBvqMB3su/qTkrflrFa9SGhKwt+XdS1DWgRk4txpm6k2fXBR5UzKf7mWz/WCuai6AT/9ATdpYT1TrZOz7MOrvNnldRn8+zMblI3QHhLwPrSba0ZUSudDhD48bzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <327eb858-f5f5-bf09-edfb-53c5c23a6c17@suse.com>
Date: Tue, 16 May 2023 16:58:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515144259.1009245-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d693d98-51d0-4c9c-552e-08db561df3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wAFNQu2G0ozE1t+XuaSdugwqTuXOxGC9fbdr5FLIVF2lfe+gtZ+U8latCC1rnm/pe1PvowX+BT+JkguPwydie3wk3oiHi3/AK5zxwV8Y0b2i7lXybYH513lhwS7KVLRPRKvhXg0GJmhRwpLuNiXGM3zvnH8viqBt/Xjs+3R6qs4Z1HG5iLfXkA/Nd+a75TRG25Y963ulcrx39v7qf6wQ+og26eWsGcU9DcXxpzyMJrLfRRd+nbcKYB61K4aHg3ZCgMg0pwT3yQpMwt6UcuHYEu781WPwQG1lT38aIo+bCZ+WEkyS8ad17DcEdzOTlRcunf4w6UukAviDkfK+5KfwGg2T6Osg1gCxKnzPK5IUKB7HuPZhPnQVuUHlUIJhL0QObBZQl2GgAie8O33fNxWV6xRXLcCZ4rFC6duYOWFgr53m9O1jO5kUz6Bx1KUeIKiFSO3ROetPPEqMu4fT5eBU8tqYbfVlaIe5I4SsPy+voxKfyudJzy/y543mF3jwm4ppPgypULfMGzFyMvLK8IHxWAobu3R814k688FlHjy0AlJ466er4SQ7K3FKe/++F3j1KluCAaIbYzkG9Wa0uBwbhSA8RlqnHrPejTvVyWS+CK/TjlbJ82M0roJsZm/jbvElVVz9c1nwc0i+mJJZ8Rmo8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(31686004)(66899021)(83380400001)(2616005)(186003)(41300700001)(4326008)(66946007)(8936002)(66556008)(6916009)(26005)(53546011)(8676002)(5660300002)(316002)(31696002)(6506007)(54906003)(478600001)(6486002)(38100700002)(66476007)(86362001)(6512007)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODgzbGF2bm5mVGl4a3lHUTFMakxqVGxmdlBmSGwzYVJpSVRjYnZjRlE2aVAy?=
 =?utf-8?B?VkdHQkxzV3ZTZzR0Si9MdEplYVFNWTFFSlkzaDdGTzVKRlhraGM5eGxZRlU5?=
 =?utf-8?B?LzdZRmM0SXI4ait1T2JqZElQTUJZa0ttQWZ0TVAwVU5rQXppcG9hQXdnem9j?=
 =?utf-8?B?TzBXZ3ZBZjVHUTJBSmJncEpjUVczSk14SjllYWlkTVVraDZWbE8zTlVjQ1M3?=
 =?utf-8?B?S0VTekIwWG5DaVBYcTlRWkE4UWpiZHF6eGpiYWJvNldQaElXVmppc1M1MFNm?=
 =?utf-8?B?d1FxQVY3NkNqMExUb2M4eGdEa1kxQTBPdzJ0NHRzQzhRdmZsR0RSejRhbVJY?=
 =?utf-8?B?czJiS1cya1hMQzRVQWh3R1R0OUJIdmY1dmlMcWpadm0wbHJDR0RVd2dtbGdX?=
 =?utf-8?B?M1RIZmRVbFZJWFVWTFJPQ0pGUlpsMGFZVHIrR0FBR05VcW1VbXltZHVteENu?=
 =?utf-8?B?VjlYVms4cFB1WEYrUHJ6SHVNYmR6Um1tVUYrNFNkRXdzVzY2eW5OY2xpMzJp?=
 =?utf-8?B?UFFzM29FUk1sSlFOMkxWMStUdFhUelMvbnRvaUVuUE4xSDB0RlAvZ0pTdjlD?=
 =?utf-8?B?NUxnZC9JQklVbDhWVmhRSEVsWVhtazZDSkRMU0RMRFBiL3VvL3lybXhnUkFi?=
 =?utf-8?B?eDk5dWhtTWN2b2t0b1Fqa3dBMlFYcE5zbHpwVHA5bHpRS3NETythYkwwNU11?=
 =?utf-8?B?c3Y2aGVxcUFkejFDVXdTdHo1eXVrQndLanU5MC9PdlR0cW1rb2lCWVZvd1Fs?=
 =?utf-8?B?elN4MTVPejNSRGUrOTR5cDhSc0dOOXVhcmpXdkozcHFaSlZRaTNOTXl0L0Jw?=
 =?utf-8?B?TUdvenliMmxZM3dMcHJOUW1KV1ZMVEFTa24wM000ZGJ6SGFrZDJwY05PREUz?=
 =?utf-8?B?SkZWRzAwbmVteVhlUlcxSStxa3UzT01sUHJzQUVGVnJ4SEJRK2wxeG9yS2py?=
 =?utf-8?B?MVZLSVZhem9SZkMvZkkwWWFGK3ZiVjNjWG9LOGl4WGgyQ1dnN1pqenFlcjVh?=
 =?utf-8?B?MVd1allHYVJHQTdsZHRZWG1FQzFuQXlNWnVYWDN6MzRaRWtSMnhuMWw5SXpu?=
 =?utf-8?B?djF5dElPN1hxbUV3UEo4YXQyTThHUy9FTTdWZjZwZjJWMWFJaGJFeFd4RVZa?=
 =?utf-8?B?RVcwMnVaRmJuQ3M5UC83WnNSUGdNVGRrVG5lK1RnUk84ejg1RUpvRlVkZ0Yv?=
 =?utf-8?B?L0tmTHcvN2VzZmxqVWduZ3c4MUdSNkZVQjRJYzhpTHErN29UQlIycEt0Vldv?=
 =?utf-8?B?dDFXeHpaT1oxNlNkOXorVFhvQXFzV0xNdmJOc3gzQ1hXQzliRWNIN0RwZzdK?=
 =?utf-8?B?bldCT1B6Z3owdEVENWE0SHRSdmpFNTZES1N2MlFuc1VXWFRaZzZGVTFhQlAy?=
 =?utf-8?B?TUhhRDJhZFRsN2o0d0wvODB0RFpzL1F0eHNVYWNSZmZTQTlrTkkzUHlDMU1i?=
 =?utf-8?B?VkVtY1NMZEFhd1NpZ1REcnR2a1BYamtNY0JwT0FBVkpwZFdtQTFzTGJvYUVm?=
 =?utf-8?B?QlZveUs5NVRScDMvbXMyUys3bmdSUm82Qm5XVmMrM2xSVGZ5ek9xdUwvcEM2?=
 =?utf-8?B?QlVjUXdMclEycnF4WXlsTnpoMU5aYmZwckJsRnVTSGxhTWdOZTF0RVFZZVI5?=
 =?utf-8?B?M0VJZ0tFM1JQMWgrZjdoTm82Tk1lc0VmeU12VTR4RUl0UUR2ZmJWR2J6bU8y?=
 =?utf-8?B?elRZUEIyS1NuTUN6SzJGRkhVQ0pubStuWkNUT2RWUE1Nb2JkUkx1UVJWNjkv?=
 =?utf-8?B?RVNHaEpVbzVzb01jUjRMZzl1Y1F3aXhIcGc5ZVZabGtqYU96WjJEditMbzdp?=
 =?utf-8?B?MU5QQU5sZG50QmZIZElHS1ltVThlK1lHOTViTitRUWNUbFlKb0pVVnYxWnNU?=
 =?utf-8?B?bEFTUXN5RVQ0L3N1L1NsN2lIdDc3a3ZHLzAvemlaUThiV2kwR2NvazVHTysw?=
 =?utf-8?B?K0gwWFc5U1hkRk0yVkxTRThaUFIwT2hFUUthbCtJQWhnVWM3RnhkOUE4Skg2?=
 =?utf-8?B?VngvaVdKd21TbjNEV2JkUGZhYVUzYWpyZzFrT25sNjIrY2tqMktSUTNQNTRt?=
 =?utf-8?B?TVkxa1ozS3p4OUoyRFBPQkF3VzZiSGZiZGFiTm5NNTBlbzYzVXArRS9Lc2ZE?=
 =?utf-8?Q?9lTsaSvaH9hebqDKTmenFsM3h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d693d98-51d0-4c9c-552e-08db561df3a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:58:04.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QG8aJ2VRx1DtyW1IYHNh8TE9Dm5qLJye0NiV1WP1dnhTwsnFTkOi3kIhAm0SlCFtV/GAQ+mtS3oKy4M0DknkzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8445

On 15.05.2023 16:42, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>  }
>  
> +static void __init guest_common_max_feature_adjustments(uint32_t *fs)
> +{
> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
> +    {
> +        /*
> +         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
> +         * unconditionally, although limit it to Intel systems as it is highly
> +         * uarch-specific.
> +         *
> +         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
> +         * system where RSB underflow uses alternative predictors (a.k.a
> +         * Retpoline not safe)", so these need to be visible to a guest in all
> +         * cases, even when it's only some other server in the pool which
> +         * suffers the identified behaviour.
> +         */
> +        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
> +    }
> +}

Wouldn't this better be accompanied by marking the bit !a in the public header?

Jan

