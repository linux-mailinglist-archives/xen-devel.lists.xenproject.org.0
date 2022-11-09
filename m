Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68010622580
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 09:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440728.694869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osgUU-0000ao-Le; Wed, 09 Nov 2022 08:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440728.694869; Wed, 09 Nov 2022 08:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osgUU-0000Xy-Is; Wed, 09 Nov 2022 08:31:22 +0000
Received: by outflank-mailman (input) for mailman id 440728;
 Wed, 09 Nov 2022 08:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osgUT-0000Xs-4O
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 08:31:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e26608de-6008-11ed-8fd1-01056ac49cbb;
 Wed, 09 Nov 2022 09:31:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 9 Nov
 2022 08:31:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 08:31:16 +0000
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
X-Inumbo-ID: e26608de-6008-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD/kGhs1xQJpwa15E1DIR54T0dEOiAk9wgfZv36ZSyCPu8ATwS6X66OJ4K2oleGdh3XcpFRF2mn/lLD5op0Eh9HvtEtgpBfXJNGQ0nuOHaTOGYO0IraVGx1ytT3TnIAWZyiXETYDdeLexfJLtfIVFlX6swkMhrP3tNWX6wMUMKprFOpMW1Wlj5lrbnex5XLbcMt4vRmcMYPoHX+OpvwL5GrpOFGhnl2cwBUvRSTyg75O2JO3mp4E36ZLWcmQbOYXQ2KJOZf1i2ognUWrontNonsUhNtB05EG63PWW1hJI5MMbmm4/x4oowMw44qo9mCp+zshVGZ9aV4QJuclOILIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF2wgd2j5PFcPu2SLhKzUP207Hw36puxEx9XzYmuV8M=;
 b=LAk2c67CKAX/JFqgOTcomMYqjFF+7EzuMtHdbF1MMX62rYWLhPYetSG1xyCTMyuA/eOU++iEqsU72hgEYOIfjokd+4drQNJ5hCVIdckDVfgqIKYu5XzAMG97bymQQQ/NjgRcC8yEgpyQf8RJoP8PO532s00Nn/9L6eNViv5psQnZmzJojwJfTQlDaIrUa7nCGNO1Vk0ndWd5HJDKReZlk0FMekKbTXo4PorSFdieusCBMALdJlvULigti95uxWA+Y+a41XM1I9XSGqKm5pV+aXmMpCMa20vNCMnI7RwPFHm85hFdSzqI3Qv42hSf6AmEjgymAchfsmYibN4YRHIv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF2wgd2j5PFcPu2SLhKzUP207Hw36puxEx9XzYmuV8M=;
 b=y95hvGILWkI7dj8NsgjcHFjy0/QrkrrMMKVfSKX+SiPr22zrBf2chiDjWR5GRJ4qPPSMWLYrt/cjz9s9jVDvU9bZ49AIgNy4+JQi46TwL5qfC1XNMklYe9gLVoBPj9fjOVxLRhjjeC5EHjgb5ZwMK8FUaIH5w/9N96sJzMdMQeoNfDt068i5LeTBL0tAJWMCcauP7rZDyysVdu8XOrM1pbXTP5abIJ9+mJkvmHKsYD+NEX+3OpX2HFf2OzWUv0lIRH2Nu2888H0SwrHp074/yXgAJtia0Fd1V0uKKudVSARLEvwvCqn0+1V/TDBojt5o7i/t40cIgvSfwmWMsg8pfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa05f64b-fdc1-ab4e-e751-e19309f88eb8@suse.com>
Date: Wed, 9 Nov 2022 09:31:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-2-luca.fancellu@arm.com>
 <aa989d27-45c2-6cb8-160a-b0368b1bb2a2@suse.com>
 <8632FA78-B316-4866-8E78-D4CD127C8602@arm.com>
 <d1d5ce85-0883-9217-ada9-71204e02239a@suse.com>
 <B26247E9-BD4A-4868-B977-CC451F7A095D@arm.com>
 <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com>
 <2E0BFEFC-5BEE-4F8B-BD9E-94CB9A5B2BC9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2E0BFEFC-5BEE-4F8B-BD9E-94CB9A5B2BC9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0193.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f69a44-8059-48e8-5b4f-08dac22cc4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LAtsuHNZNPIOgdGTcWpEEpn9DGPgnyJx5p26G24Js28jjuPSFixK+9m08bhNtNbzRCbzlVXvBnp6p4vOGuSFFDn9MjrBJWHLHJ4gMd1OyMObrjvIspbasQ/88z7bgn55HzjrtXRghVLtw+m1YY0iyquFa1DsxlssydLgJQP3kCLVEohHVBp0yLPTq8jXqkpaMTAH7XXrsvFMMxD5j/tnw9uk0hXNK8F2t/nGxBK02zu0R+2C4+swNaawoXMhy5ZA+/zxaW23c/aYd02kS3WJeSP69Wd48wmgKp92yNevshE0GYumvOKR8TTpeRegiv986qB5yQebyQDCEdZN9pI47cx/F1tJ8yuUNK4ae4fn+EBks37ILw9JMPMEY4tQgYuTI+Ct3t4YStxUPya+jmOxy7P2UYdcikSEFcPIYnRqQ65YHjv8cxe4LXtL1G56uzuD4o8GZckqECm1/dIaIZLK1ZSZek8GTVDzSDFr3DgtdwCMHbZr/+tjjBB0O5kNnwuevzKrjhvuhBI/4+rlj8cQmn7RT/8J++14mJpLsjOnP46dWRhxlT2C/4N3l/wY7EcSIXdmSVbFDJE+vyOcjc4htDuN6MJjkpCAV6Z43/uHTotqf0INY1bnMgArRIjhfARDzoctzuUOm2WIH+E+cwaTdgcD6vLtjm0iJrM1gQOnQJ/XWqoNFXpl35qZ0ReVFqWcFnhvSVrDoYR7vKjEWhniCFAx6W7XMw1Vx22iKdG5DKJ/tKRQbUlp7M8AkE1fh6mZN8BSznsSJN3QO8TjzoINVn/HBrQw7brbL1BlLr6gfIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(66556008)(38100700002)(8676002)(66946007)(4326008)(66476007)(41300700001)(8936002)(54906003)(316002)(6916009)(36756003)(2906002)(83380400001)(6512007)(2616005)(6486002)(478600001)(26005)(6506007)(186003)(53546011)(31696002)(86362001)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3JTemlDVkl3MTBqTEJ3Ymc2RGhjV1BGTGNOZlJGS2xXdW1lcy92UC9vd013?=
 =?utf-8?B?NDI2SnR0bFBiMHRtMUpHRGRXdmhMeXZaY1dOMzFqQWlRQUZZdGMxTW9rNDVW?=
 =?utf-8?B?VHliSVBpcHBQekFuNXhSRFNvQTdrSDZQL296NDZ2ZFZWVjd1UmNnSjZQdFdF?=
 =?utf-8?B?dkttUnBIdWNMdC83NVpwbjhNRmRlT3pqSXZqYmt6d29JeGJEaUExL3Z6SVcw?=
 =?utf-8?B?cUROb1pJTURVMDM0d1RtbjJ6TEhFNFU2SmpzNFFxNmJUVnVUd0o4TVBMbmwx?=
 =?utf-8?B?VUR6RVlaUGtreEkvVFZYVnRLUEMwNVlDQ3NZZklCUWhvNUVHd01jVlJsU0FG?=
 =?utf-8?B?V0J0YmxCN1RrN3V4N1NUOC9STGtIcVJUOFZwREdlMFNLb3IvS01hZGtML082?=
 =?utf-8?B?cy9uUlBJWHc2Nm0rMEpMU3RHR2FOeEZrRzRZQ1hOZVB2RE5yRjZVWVV6M21R?=
 =?utf-8?B?NzJLVU4rdC9USFZiYWVUZkRpNzRDRUxvcTV4dFhwTTlOaUlhQ0JGbGtTYmRM?=
 =?utf-8?B?VVYzNFpPY3JpcW9MNFk5cWZvVDFGMFlGYzdXWlNVVmY2R2l5T0tvYXl2cElY?=
 =?utf-8?B?TVhjWVBQTk9XRFNlVlFZUnozdTBMTERpRDlXSHV4YkxTZW05THFOSjE1SCtC?=
 =?utf-8?B?RHdZN2JybVloTEFrc05tUEUrV0tBU0YyNjF6RFUrVGdjUkdZOTdxRVBkMEl1?=
 =?utf-8?B?bGZBRzlwMTFDekk4dE1WT3A1ZGNwdkpMd0RKWnlUelZ1alUxR2RWYVovQkN2?=
 =?utf-8?B?aGRLY0hFZWpGRHhrSkpwSHlxbUJlbFBLV0hObDVxT0RZbWRNZDhFQ1dVbG05?=
 =?utf-8?B?Rk1HK3RuQ0ZFSWdaN0FWSDBTN09pYk4yS3Y1MmM3bjZYN3RuUXN3cEVBYU1S?=
 =?utf-8?B?YW40M0JwQU9ZaXBIczE4ZTdybVZaWVVSSHo1Q0xVTlljcitNVFIzaldPSUdm?=
 =?utf-8?B?bllkZ2c3U3paZWpNZG5ZdTAzRERqVVdlVlExWGhKdlppdENWRFhOQ0Q1S0xS?=
 =?utf-8?B?QW40UTNoWFl1THF3eUxkcEZsbXBkMUFHRkpFWDJSM2o0MmlSSWJ4KzFWdEth?=
 =?utf-8?B?bjUwUHVTYWVkZGx3TC9EUW5vRllVNGRqNkt0WWJ2cHBJc3B6Z0FDdmgxaFFL?=
 =?utf-8?B?NXZsSTJ5TGRrOXltOWJZcjhweWFzZ1NielU1SThwODdvYWpVRGM0c1lDRE1U?=
 =?utf-8?B?YjJYTlNlUkVRZy9MeDg1aURvczUvNnlXRG1mQmREbFBVTFpGZFgwci8yVkc4?=
 =?utf-8?B?VGlqa2kxWHNtS1B6cmFRZGgzSVM1WjN5YXF3TlhkcERhL2p2QUdsZUR2WGxN?=
 =?utf-8?B?L25Sb3NXdkpQVTNOc21MazRaR3F2UE5KbkVSNTRnTDVoNUNrbU01VzltbEJk?=
 =?utf-8?B?SnJscWNCNEcwWFZvQkozaXc0UkI4UnJkYnBrdTd6Yk9sb29RRGxDMHdrQ0NT?=
 =?utf-8?B?LzQrVnlNSGxTcGxFWjMzRzNEekRtcDdCcFV3c20xeFVYSG5GZUpPeXJOV2sy?=
 =?utf-8?B?Wm1hNEcwYVBRZUt5RGtvNjJGMHNXcmZwak5XWEpQbTRUbzhtZ0VDQmhBeDNE?=
 =?utf-8?B?ZE5lQ2VLRUdhSUdoQUJkZXg5WkNOd2RmWHVBaVJLL25leUF6R3ZEbXVuY08r?=
 =?utf-8?B?ZmZTZDBqWlk1UVk0ajRWNkNMNDB3WWNOaUU1M055TmRQNnVCMWtJMjNYWVh1?=
 =?utf-8?B?OTJJcVRJTFByRHNWYitPdlhOdlh5UEQxUGpEayt5aWNuaU40SW5SVUJaR2cy?=
 =?utf-8?B?Y3VZVVJGSmZSQWZFK3B3WDlheDl4K2Rvbk5obExyVXNZdnExc3hscEVDTzlm?=
 =?utf-8?B?bWtjdkVRd001YmJKd1UreDdQK2lzNEpwTzllbmNHSGpIZzllTXMzTE1wdFhD?=
 =?utf-8?B?RkZQWW9OTzBnUE95UXlQeHRiRmg2QlFzUzNVekZZRzl4UUNwbUs0ZTV4MXc0?=
 =?utf-8?B?QlMrdDRLeE0xeEgvN0pwT3J1S1JFbmQvNG5iUURGMlZqUmgyVDM4VnlVTEpU?=
 =?utf-8?B?Nm9MaTBvL0dybGIwRUhablNTRngvRkpWMHRnVlFBMEt4akhlOGRuMXBOdGF4?=
 =?utf-8?B?c3p0a0RpRzBMT0VGT2dQMUJScjVnTTVoZHFDUkc1dFd3Q2M3RVFjbHlvdXRL?=
 =?utf-8?Q?sWWFcIGEC4jNqrOjgjacZlJ7p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f69a44-8059-48e8-5b4f-08dac22cc4d5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 08:31:16.4419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdOmA6pZj/UVIu5OPrN6THHiTqCIm1dMMZRI2fUMAE3VUqscNHvvk9zBhsd6rOJTgnW2+eBQGcO6iVzDPetMCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192

On 08.11.2022 18:13, Luca Fancellu wrote:
>> On 8 Nov 2022, at 15:49, Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.11.2022 15:00, Luca Fancellu wrote:
>>>> On 8 Nov 2022, at 11:48, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 08.11.2022 11:59, Luca Fancellu wrote:
>>>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>>>> @@ -757,6 +758,51 @@ cppcheck-version:
>>>>>>> $(objtree)/include/generated/compiler-def.h:
>>>>>>> 	$(Q)$(CC) -dM -E -o $@ - < /dev/null
>>>>>>>
>>>>>>> +JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>>>>>>> +                       $(XEN_ROOT)/docs/misra/false-positive-$$*.json
>>>>>>> +
>>>>>>> +# The following command is using grep to find all files that contains a comment
>>>>>>> +# containing "SAF-<anything>" on a single line.
>>>>>>> +# %.safparse will be the original files saved from the build system, these files
>>>>>>> +# will be restored at the end of the analysis step
>>>>>>> +PARSE_FILE_LIST := $(addsuffix .safparse,$(filter-out %.safparse,\
>>>>>>> +$(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
>>>>>>
>>>>>> Please indent such line continuations. And then isn't this going to risk
>>>>>> matching non-source files as well? Perhaps you want to restrict this to
>>>>>> *.c and *.h?
>>>>>
>>>>> Yes, how about this, it will filter out *.safparse files while keeping in only .h and .c:
>>>>>
>>>>> PARSE_FILE_LIST := $(addsuffix .safparse,$(filter %.c %.h,\
>>>>>   $(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
>>>>
>>>> That's better, but still means touching all files by grep despite now
>>>> only a subset really looked for. If I was to use the new goals on a
>>>> more or less regular basis, I'd expect that this enumeration of files
>>>> doesn't read _much_ more stuff from disk than is actually necessary.
>>>
>>> Ok would it be ok?
>>>
>>> PARSE_FILE_LIST := $(addsuffix .safparse,$(shell grep -ERl --include=\*.h \
>>>    --include=\*.c '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree)))
>>
>> Hmm, not sure: --include isn't a standard option to grep, and we
>> generally try to be portable. Actually -R (or -r) isn't either. It
>> may still be okay that way if properly documented where the involved
>> goals will work and where not.
> 
> Is a comment before the line ok as documentation? To state that —include and
> -R are not standard options so analysis-{coverity,eclair} will not work without a
> grep that takes those parameters?

A comment _might_ be okay. Is there no other documentation on how these
goals are to be used? The main question here is how impacting this might
be to the various environments we allow Xen to be built in: Would at
least modern versions of all Linux distros we care about allow using
these rules? What about non-Linux?

And could you at least bail when PARSE_FILE_LIST ends up empty, with a
clear error message augmenting the one grep would have issued?

>> And then - why do you escape slashes in the ERE?
>>
>> Talking of escaping - personally I find backslash escapes harder to
>> read / grok than quotation, so I'd like to recommend using quotes
>> around each of the two --include (if they remain in the first place)
>> instead of the \* construct.
> 
> Ok I’ve removed the escape from the * and also from slashes:
> 
> PARSE_FILE_LIST := $(addsuffix .safparse,$(shell grep -ERl --include='*.h' \
>     --include='*.c' '^[[:blank:]]*/\*[[:space:]]+SAF-.*\*/$$' $(srctree)))

Good - seeing things more clearly now my next question is: Isn't
matching just "/* SAF-...*/" a little too lax? And is there really a
need to permit leading blanks?

>>>>>>> +	done
>>>>>>> +
>>>>>>> +analysis-build-%: analysis-parse-tags-%
>>>>>>> +	$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build
>>>>>>
>>>>>> This rule doesn't use the stem, so I'm struggling to understand what
>>>>>> this is about.
>>>>>
>>>>> Yes, here my aim was to catch analysis-build-{eclair,coverity}, here I see that if the user has a typo
>>>>> the rule will run anyway, but it will be stopped by the dependency chain because at the end we have:
>>>>>
>>>>> JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>>>>>                      $(XEN_ROOT)/docs/misra/false-positive-$$*.json
>>>>>
>>>>> That will give an error because $(XEN_ROOT)/docs/misra/false-positive-<typo>.json does not exists.
>>>>>
>>>>> If you think it is not enough, what if I reduce the scope of the rule like this?
>>>>>
>>>>> _analysis-coverity _analysis-eclair: _analysis-%: analysis-build-%
>>>>
>>>> But then, without using the stem, how does it know whether to do an
>>>> Eclair or a Coverity run?
>>>
>>> Sorry I think I’m a bit lost here, the makefile is working on both analysis-coverity and analysis-eclair
>>> because the % is solving in coverity or eclair depending on which the makefile has in input, it is not complaining
>>> so I guess it works.
>>> Do you see something not working? If so, are you able to provide a piece of code for that to make me understand?
>>
>> Well, my problem is that I don't see how the distinction is conveyed
>> without the stem being used. With what you say I understand I'm
>> overlooking something, so I'd appreciate some explanation or at least
>> a pointer.
> 
> Ok, I have that eclair and coverity shares the same commands to be executed by the build system,
> so instead of duplicating the targets for coverity and eclair and their recipe, I’ve used the pattern rule
> to have that these rules:
> 
> JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>                        $(XEN_ROOT)/docs/misra/false-positive-$$*.json
> 
> […]
> 
> .SECONDEXPANSION:
> $(objtree)/%.sed: $(srctree)/tools/xenfusa-gen-tags.py $(JUSTIFICATION_FILES)
>     […]
> 
> […]
> 
> analysis-parse-tags-%: $(PARSE_FILE_LIST) $(objtree)/%.sed
>     […]
> 
> analysis-build-%: analysis-parse-tags-%
>     $(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build
> 
> analysis-clean:
>    […]
> 
> _analysis-%: analysis-build-%
>     $(Q)$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile analysis-clean
> 
> Matches the case where 'make analysis-coverity’ or ‘make analysis-eclair’ is called.
> 
> Now, please correct me if my assumption on the way make works are wrong, here my assumptions:
> 
> For example when ‘make analysis-coverity’ is called we have that this rule is the best match for the
> called target:
> 
> _analysis-%:

So my main oversight was your addition to main-targets, which makes the
connection with this underscore-prefixed goal.

As to you saying "best match" - I didn't think make had such a concept
when it comes to considering pattern rules. Aiui it is "first match", in
the order that rules were parsed from all involved makefiles.

> So anything after _analysis- will be captured with % and this will be transferred to the dependency
> of the target that is analysis-build-% -> analysis-build-coverity
> 
> Now analysis-build-coverity will be called, the best match is analysis-build-%, so again the dependency
> which is analysis-parse-tags-%, will be translated to analysis-parse-tags-coverity.
> 
> Now analysis-parse-tags-coverity will be called, the best match is analysis-parse-tags-%, so the % will
> Have the ‘coverity’ value and in the dependency we will have $(objtree)/%.sed -> $(objtree)/coverity.sed.
> 
> Looking for $(objtree)/coverity.sed the best match is $(objtree)/%.sed, which will have $(JUSTIFICATION_FILES)
> and the python script in the dependency, here we will use the second expansion to solve
> $(XEN_ROOT)/docs/misra/false-positive-$$*.json in $(XEN_ROOT)/docs/misra/false-positive-coverity.json
> 
> So now after analysis-parse-tags-coverity has ended its dependency it will start with its recipe, after it finishes,
> the recipe of analysis-build-coverity will start and it will call make to actually build Xen.

Okay, I see now - this building of Xen really _is_ independent of the
checker chosen. I'm not sure though whether it is a good idea to
integrate all this, including ...

> After the build finishes, if the status is good, the analysis-build-coverity has finished and the _analysis-coverity
> recipe can now run, it will call make with the analysis-clean target, restoring any <file>.{c,h}.safparse to <file>.{c,h}.

... the subsequent cleaning. The state of the _source_ tree after a
build failure would be different from that after a successful build.
Personally I consider this at best surprising.

I wonder whether instead there could be a shell(?) script driving a
sequence of make invocations, leaving the new make goals all be self-
contained. Such a script could revert the source tree to its original
state even upon build failure by default, with an option allowing to
suppress this behavior.

Jan

