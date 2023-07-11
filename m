Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5774EBB6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 12:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561717.878237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJAaI-0007a9-MO; Tue, 11 Jul 2023 10:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561717.878237; Tue, 11 Jul 2023 10:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJAaI-0007Wr-IF; Tue, 11 Jul 2023 10:27:06 +0000
Received: by outflank-mailman (input) for mailman id 561717;
 Tue, 11 Jul 2023 10:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJAaH-0007Wh-Fo
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 10:27:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ad44b3f-1fd5-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 12:27:04 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8307.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 10:27:02 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 10:27:02 +0000
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
X-Inumbo-ID: 7ad44b3f-1fd5-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWOMNNSAjNOfWOx4LrUhwG6JBohPR9JLo3aZMAumxcWx09emzPT+HEnG4EfPdhV4KV4pZP5jRz9SlYFCaEfnC6C2IVLQQIXK6fLqeZSzb3xfkqQF1AIu7cSDG2ME6RLA0A+56AcdUuEVTbM76UOH+2EbFFUwuvTHv5jaCPCoFXq1r4h1r8qgjfHEY0QVHjj+/CCULvOGBRE/vm1OyVKHtMP9vs+l4ptz16a7fPuUd+7YXQUbXpYKjLZxSNvv9/PdmYS2IxXzS/FI+tv5fdbI17rWxzAA0sjtLE+FAYuMnhki7jEQFRKM4SCV4JqAHEKzSFgwoHirhzhFp+8PPQASvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/TVrBzVsIwR96YK41lnB70vLndn90VY8LjQ0zG8wNk=;
 b=dkF3AsdpNIkIB3XxYlLIOcVpQ0O1BFiVD0o33K9zB8JuVANcNw9B8ho+vakpiAHogCnJhjGcbLq25Tp2EblVPPKUjLf4RL+5AVOXNQrgKkOcw4zn6zBt4I0CE/4v8eMxutA/sFdNaY6PC5sN5AbAOfT2Cr9VLuma5HTFddPfQisuP94YkwUIGrDbzIbETbDZ0tbxh43EUuzXDBhC6D6fcYYbmuLZ0J9R29H/1npjjpscR66RyclFbiurdEZ5lHvwIB+eJmJU+07QesQo1g9M8B3xqy92HgKI/exoh6mEUon0kzY6nLuJCnRaphBNARnUeGLVcMyFGUvglqgDSfmH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/TVrBzVsIwR96YK41lnB70vLndn90VY8LjQ0zG8wNk=;
 b=ddKn4mMLznysh5778hl/LuYz34AssSef6oOIx6VtHn0tKu5DkR/E18DNwDdESeAzOeEF2Ge36huABLAg10nG7E7fpGBLjfDG39FAa8jUJXy85GrJV8WjEKrBPytauhJSpLSuKViOAKS5W92Axq/9haOJT8iys3HM/5MDYRtRAB7XrdgYhx1xIk/DY2vhyX6js5nfuJS++tLMHHYQ6SxZ5Zgq+gv1FlWLJ6hFO8DpOv/UOkrImvGMBlbTO4ebVW7A8rtyvbwwSFft4XdQQA4GcT0WDghUUrtQXTmhJ9IJCgvjNepupbiJQwWBuyVOWtQq0VHv6ltU7jGW1/vQy+3Kdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ae95ea5-1e41-e655-afdd-d9da764c6a90@suse.com>
Date: Tue, 11 Jul 2023 12:27:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] cmdline: only set ask mode if vga= is present
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230710141238.375-1-roger.pau@citrix.com>
 <9827433d-54dd-47e6-1f74-53612da21c14@suse.com>
 <ZK0ddKXx13fu1yfX@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZK0ddKXx13fu1yfX@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 08983ff1-88d4-47cc-ccdc-08db81f95d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kngTjZBsC9whx0PFakXxhXSCKPjBCyRR52eCx6WLfOSGzKMYM0GanOfH9Is0HqyRVdEp13xq2wNtjLbCw5fwg85EMA7IwFv5xe+dcNmA9bShvLmiRpLO5SpH5H+YvB3DXF3qmDVrPMeKQwz3xMzphoPJBMtjEPOQag60CFNAxu/QRXgasQ/5LlNRM6l3QWA9jF1u/1V1CYvxpMA8UwrJgQnARemf1vArM3lOO2bZvkyamliFHJ2uGCeuIlMxRUk9XGFosB5w9Br5+lCbMt1NgKE2BVGic6xyq075MNlbMPNKJIuDMfXmvWqvIaTlYCLehbSTvmxuW08lhnvTkDplZu61wws/IkolfDParB/ya9mAcJGdMsTGtuJ3x4tu+nzK60yrct6hcL2XQfM6u7ox0euR3C/o6GoRmPQD4kvR1ttLoN5FCh2/Aou+LurrJBTvHEnScd3n8NZVeksZXATubB836yN1xCoyF/p0/+Rb33LqX+bQt9P2KCBpzOhIM6CU5hHG8jJEtSwnx7wUP6ZScb8TN7zjeigCLZ6nKjNZqisLJZhNlh4ZhntK0EfVYTwYx12L3RyYNranGgiCZfrEnGUFwSfTEdt2QCF5/oHIny98CpvTKzeK1amefRXlaM8HaW+1iEl6zIR8PdEieYT8JA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199021)(6506007)(26005)(53546011)(186003)(86362001)(8676002)(8936002)(2616005)(31696002)(31686004)(5660300002)(6512007)(478600001)(6486002)(41300700001)(66476007)(66946007)(66556008)(2906002)(36756003)(54906003)(38100700002)(4326008)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekd1akZ6OEdFdHlLTlJLajluQkdGTVF0U3ZHMEYyMVcxbUozZXB5ZEVvRXE3?=
 =?utf-8?B?UGVtRTk3bHFUNFJRQk42UHNOLzlTYkxvNEVkTytaUEJjS2ZVRDFtaE1VWW5p?=
 =?utf-8?B?cWxzM05yVVc0RktyRlNwazNjZHVRV2cvdmhVUS8rZGVaUVcxWGpzUG5CUlZW?=
 =?utf-8?B?WTRPRXROamNla0NtRDVJakl0bEpuQW5OQWlFUEdGWjZJTVVqWmc5RWthODhm?=
 =?utf-8?B?TFY4RHlGRXFRcDUvc3phOUlNbTlNcW9GUU5jSExBZUVZTXp5SjVIUWJPdVd5?=
 =?utf-8?B?NDdsVER5RENkQjkvU1UySVphaFc3SjlxYVVISmFCbG9EVUxhWEJDYWJVVnEv?=
 =?utf-8?B?MjVWUFhKU2xOTTZ4VmwwYjFYUGdmenh4YVhOY3dNeUExd2lXVkNlUkRWQXdG?=
 =?utf-8?B?TU1XZC9OazI2QVNrN0lTM2RrL2dNMUZweXNQMUI1R2RmQTVrb3Y0ekFXeFVz?=
 =?utf-8?B?S0VoZk45MVEraVBlcFV6QXJxZzE3d2RtSjJjb2J0UVh6MlY2RXl1N3lGZ3M4?=
 =?utf-8?B?R3NXV3lPYTYvbkVYWDdTWk5SZWZNWkIxSlNsenliSVBwYzVpKzlzZ0YwZ2N6?=
 =?utf-8?B?RVFVOEx0RVlQc1d6U09LclNSTUtGZ3dMZ0tIdklrSXZaMndHTS9GSXh5d1g1?=
 =?utf-8?B?cTlxZ05VK0EyaHdDY2lJc2tWbnpuNUc4VUZNemtaUUV6NVBVeUUwek9pSmJW?=
 =?utf-8?B?ZEJ2S0dlbys1L1VFSmViTnBhNDZPRXY0aWhCUlU0anprTkMzRUMrMWhQSjFw?=
 =?utf-8?B?Qm84MFl1MnE2Tzl2d0NEcHlEZmJ2NG1mYlRrUy9yVUQ3ZWoyNFJPVlVjMzUx?=
 =?utf-8?B?a3BKcmxQaWh4ZmhXd3F2MmVXNmdLMjA5eHd3V1FIckxSeXRJSVY0UUtEU2Iv?=
 =?utf-8?B?Snc2VFpRK2lIL1FNQkVDMEpQMzdvMzkzcGNhUXdPZnB3dTZnWFR4c01GRVc1?=
 =?utf-8?B?UjJLWDh2ZGRQWDVkdFJEVDZSQkk4MGd3bXhlWXdmWWhLb1hlK01PY01wTHdl?=
 =?utf-8?B?U1RCbnVXUWxrcWdqS0t5M0lVZUZ3eEg2QlVKNVQ0STVvRjIrcjJJcmwyS2dx?=
 =?utf-8?B?TGZSb3hwb2luQ3ZkWnNSdk1wd0RkMjg4eGxNdjlpOWxOazFiaG1WWHJ3MS9r?=
 =?utf-8?B?TEg0c3lIZklPU2V5N0dUVGp4TWpOUFVRT0VZUXpwVStBL0ppTnF5TnJBdDJv?=
 =?utf-8?B?MVFLSEowRVQvczVFdDZiUUhpT1BsSkU5UGk3NEF3bjZZOVRsVHV3WjBRRUo4?=
 =?utf-8?B?ck5nY0FHc0JsQ3ZyL3kyWlJtMExCK1RRM0ZpSnVyMFJoSU1IeitvRGtFMUZQ?=
 =?utf-8?B?U21ubW5icTdoTFR3a091OFhPbmNYVWR3TXdZckU5OXRmbFdyV1NYZjIwMEQ3?=
 =?utf-8?B?QVNxUHlxaTJCK1IyTWloZUd5WkVSK1N0SlRRdi85L1FmUCs5dDBWSG5IN29V?=
 =?utf-8?B?Y1FxV0FLQ3JERlNuYjR3dGFqTWREaDBpdXJJOXNndndUVlM0SGE1NG1iZkwr?=
 =?utf-8?B?dWRCcmFxRVE1SHZHTzJ6R0FoREVQR0p4QkJYb0pBV2pQU01LRUpRam8rMTEx?=
 =?utf-8?B?WXV3N3R5N0xDSmE5RHZ5a3pMUU9VSTh4U1pTdSsrT2p1WlFmWDdaZjBFbHUr?=
 =?utf-8?B?MGNaRm9IbGlFNmhROEx5WlAwMENMVmsyWTZnUUt4VjRwM1FCSnhDZS80RURz?=
 =?utf-8?B?alpGOUVRTGZ2cHFUa3ZkUHRGL2lzTkNMUzJlWXpKeXFVVnNMb2l0bkZ4eCtJ?=
 =?utf-8?B?c3YyUGNDMUFFTTVmQ1REQm8rdXpSM0hBQ3pDSGhtcGJMUW5mcXVxQkRHbmJZ?=
 =?utf-8?B?OUZEUjZZeTdtQ1hkSENEQ25oOWRNTTNIeTVzaGF2R0I4c3VsUkh1UHZydkhQ?=
 =?utf-8?B?bHVlZWNybXVDY2lWVy9VNDV0N0gwQTF1b1RCa0pNQmkyb082Qm84ODdhUGVC?=
 =?utf-8?B?aU5ZTlZrNjV1bngyaFhRcmxQUG4zNFBYMEhVSmtiRm1EODBLWllORDNZWUJv?=
 =?utf-8?B?Rm9KV3lVWDFqeVJJNmNjNEsyU2NvTFlvZWdVa21jck9hZ0ZCZlY2SU5lS1Jp?=
 =?utf-8?B?OU9LK1RYMkFJc0hyOFk2Vlg0eHduT1hxcm9HQTZJbEREbFJKTGZtLzhYSUJi?=
 =?utf-8?Q?77MkS4xXYw3suKyKXEeJjFSAv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08983ff1-88d4-47cc-ccdc-08db81f95d93
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:27:02.0975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9BaV6fV34zlcdzAYVcAxckVnbn2z63uyWlUAGwblly08MfWhnW+a+l9SBMKahki/0TjPkwHlJ8vnxx07dm4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8307

On 11.07.2023 11:14, Roger Pau Monné wrote:
> On Mon, Jul 10, 2023 at 06:27:06PM +0200, Jan Beulich wrote:
>> On 10.07.2023 16:12, Roger Pau Monne wrote:
>>> Commit 9473d9a24182 set the ASK mode without checking if there was a
>>> `vga` option provided in the command line.  This breaks existing
>>> behavior, so exit early without changes if `vga` is not present in the
>>> command line.
>>>
>>> Fixes: 9473d9a24182 ('cmdline: parse multiple instances of the vga option')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Should have spotted this during review; effectively you're (almost) undoing
>> part of the earlier change, just that ...
>>
>>> --- a/xen/arch/x86/boot/cmdline.c
>>> +++ b/xen/arch/x86/boot/cmdline.c
>>> @@ -279,9 +279,13 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
>>>  {
>>>      const char *c = cmdline;
>>>  
>>> +    c = find_opt(c, "vga=", true);
>>
>> ... you use c instead of cmdline here (and I'm heavily tempted to actually
>> make this the initializer of c).
> 
> I see, yes, please do.

Well, no, I didn't (without your consent), and I wanted to get the patch
in yesterday before leaving.

Jan

