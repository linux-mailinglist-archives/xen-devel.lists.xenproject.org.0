Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE8620F75
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:49:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440016.694075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osN5x-00047M-NK; Tue, 08 Nov 2022 11:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440016.694075; Tue, 08 Nov 2022 11:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osN5x-00045M-Js; Tue, 08 Nov 2022 11:48:45 +0000
Received: by outflank-mailman (input) for mailman id 440016;
 Tue, 08 Nov 2022 11:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osN5w-00045G-43
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 11:48:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a3d4b04-5f5b-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 12:48:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8472.eurprd04.prod.outlook.com (2603:10a6:20b:417::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 11:48:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 11:48:34 +0000
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
X-Inumbo-ID: 4a3d4b04-5f5b-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZqm1ayY/VIjYwbVO0gRQ9R/9TCyA30ATOFLigITPPEgU8WUpFQYAwEcmF6Kp5iqrsCZOHthsxgcsO+plUUEdqn4JIQo0+0VZmU8vlL2eCLTOnq+3JDvAhp64rCWd3EKrE/jf+XnkIj4yqpEY1Pq/4MPeZdAU+UPasWop+dGXdlDn7a6o+vNDAab/a6+gl7XqnFLi0GwIAOwJIGpLQjfZATsB8eHyPLOMyDmW5GtXIjWMBQAxLtMeYKy9C3gOvrC/pOEPT4J2jE2uYqKMAraPP2zcGTISrd/n6vI6QYKGOQyyqjv1ASQAgtjLoK+iEgQ0OlwfTZafg9K7V3+2ma99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARTLt/gvXUcVxEw6Jt/uKKrW1E0ds/Sh9E1t50lsjqo=;
 b=lROzg9IDxVP6ced3lZNkQhy1a6eYfh6GFwyVtJ2XS5F8GBt1AEqWDA3j8ZoJYhdVvR6XG3h2wdVv8DfIvhKBp6yDwkKKuINgB4N5m2r706xgbRP5zAJEeFtKlQQHHmV7con/npW4FgSwqQZhicYhvEBTkNnxPP2EXGWsVmUxfeAU6/Bc4CungmCZH+faVNJe9dpqzOfSOLX5AaWwfd1YbhOOU7CNuw8nl+s0T6ARUQsz/uAaJr57MFfn8Shvr0G2aXkVWEoxWjcoOJDf75jNblgwIQlEuxsmpFAs6JG8SsrNUnGxVih2lwaMx647x+inBtPAi6X2yxGPehCsWRG+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARTLt/gvXUcVxEw6Jt/uKKrW1E0ds/Sh9E1t50lsjqo=;
 b=WDVGwhdW2PxR5KJ+prwQtPtmsURy5ptkiSZKZzfWTi2Zj6s8/C997deT0ed+RbkRIQmRv9LJi7Ola57hwQ7zA/Pw+SKOZq8KD6QctoVe0eUDI6/hmxvQFbjT0mOfnpoxsqqXPI23fZfK6LwjpMnVY2xy2dmjIKYeYbVMrik575t7Xq1OyvEpX/ba5/Si7NK+4pP7N5UohVV7mwi3Yzm3y82syN7n81JKAWPdV55KKmhDX+KW9cPvhM7/HqQe7YIrmHpujPg0MEN8IbJWaEOcJ9A1OsXxZdomkyADu4+vuQiwOtf1LbRnD+O+k9iTjn+gYoP03qYY6kcGOo3XYqEV/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1d5ce85-0883-9217-ada9-71204e02239a@suse.com>
Date: Tue, 8 Nov 2022 12:48:33 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8632FA78-B316-4866-8E78-D4CD127C8602@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 63158d59-c35a-45cb-d17b-08dac17f2a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wrfZyFt0pqi3IhcCxVPGd4Pcnv2/5XRyJpEYckAPHDfzFKZoMZsuc5ucREDLKtkSqAgi9eJOZf71MtWj05EkT19aHPsa+U9feDOE6fZXSKPIkz3Rz28W2M0WiKO6OAeagxMSmPumWGjW2uygRuXM/KJZ+Yh4UWtoCuEF1dmHqs5h4wYVqnQtkkHiYyukYLPMFQ7vF9xg3Q/JFVgK8l04xFIxD8ehYupQIzfbzuigZ7MOmpQ77/7LJ4lgG7uHJWoFQGmz3gVs5KWSJENJMx6RijY13Goqo/krcUFd/zf7Y63XVVA85tDtr8iE2GS3cntfRMjXbb6NvCfr7+jvOleFHE/r75wqLZt1Kz/8Q6ZizCeXWasqgA9564wJ62Mk1T+Ny0Bz6OWFPeX5PtxdFg2Phvz3CmIqoA8TJvjeLNwS3WbejthYfD49WuWOSGqzbVjbmA/QVvHNnr+2GxHqWFuF3KkQvAAckVBWU2I7LmkMTWIgJx/LqhRVr5Zb9o+YeFM1fbGipJRbawkPs7FCcvsTF28rVMhLwlm0mMHLuuvVe0M5hOPp41c1/Zt6Ni+8+Ult1Sggw9kjtadarnvZB79SK1AZxWRcRkMBX3Qc3Cb8FOB/rh1YjC3OEQbkAwbEnEX8chSXnrD2/PVR4RJBYbZMT2fSaoYU8qe7z2BYdjmrdLS2PXVYQQRx5F+8apvobqsJota/XRSWpCYr+vdTZY3dumcBlWKdj9XiIWeAxhSxXJ35/6GdLKQpOnKhlYVYX66wRA5zPC0G0NU6hFewMXPUevSQhKfI3Dvnwuldbadg4YY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199015)(31686004)(186003)(66899015)(2906002)(6486002)(2616005)(83380400001)(5660300002)(8936002)(478600001)(26005)(41300700001)(8676002)(86362001)(31696002)(54906003)(38100700002)(6512007)(66476007)(66946007)(66556008)(53546011)(316002)(36756003)(4326008)(6916009)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1VraUR0OS9HaW9wZmVSY0FWMFRPOXBscUpIWmlBTHMzUGFJL1dIUFllNW9h?=
 =?utf-8?B?ZC9qS2plOVYvNGlLVzhQSFBSMldacVRXbXJ1UzZ1eGtlVHR2Z2p1OFNDajBG?=
 =?utf-8?B?Sjh2Z1BhbDRQdy82NkUvajJkOHlHbGJNZUxYSmg5NEdxZFNaaE5yeTZHcXps?=
 =?utf-8?B?VGI4eE0zWHVmdXRGcFJlempLQ2lLYUVaeTNHUnV5TUJjQjlHZFZ6ZEs1RUxo?=
 =?utf-8?B?TnBPbXQ2RW1wZ01wZ3B1c1oxaCtnbjdTYTAzeVRVUDVqdUVTd1pZWm80cTBH?=
 =?utf-8?B?VHN0UEZjM1RwaTZ6TnduSWU1QkI4WFhhZkFTU0F3VnRRaEZkTVcrYWl2V1d2?=
 =?utf-8?B?YzdLWERvQ3ZhYkErRTI5VSs2cDRYbW44Y08xckFYK3BGWTRXaHVjMkdqZkZm?=
 =?utf-8?B?dEhYNk9CL01FTkNOdDNNZ1NSRTlNYis1Ukczc3QrZU9ZMDJLMFhNdEYzbzlw?=
 =?utf-8?B?T3pUenViUTZ4TXNNeDl3SGJ0SkRzYjI5aExqb3MrUlVJRkpZUHdrcDcyRGFh?=
 =?utf-8?B?RjgrY3dwQlFlM0ZCOW5UMS8weTQ5S1lrenpzYTRFcFVUWDE5aGk3M1RmV0w1?=
 =?utf-8?B?M29Sc0dBSGlZelZLVkppZHova1VXai93VjJ4VGNFcnZqK3hMV2hNQkMyUGZL?=
 =?utf-8?B?eHVRLzB1TEpJZGQvS0t5WGdCblJRTmk0bFo4b1ZxWC8xbXlzc3ppRk5ldzUx?=
 =?utf-8?B?ZVZWQ0MxMENlVGxrSnpkeFFtTDZXWXpva2VhNlNzcTlUdnA0L2VtTnZpczcz?=
 =?utf-8?B?UmMwNXdvaEtKMTlURDZ2WUxWZlZDWFNWS2tiQk4vQXBzRjI1T3Q1Q3dxckd5?=
 =?utf-8?B?Qk1LMzVoK25rTU9yMFRUSytyYzlmcDF4VlBlZ3NPL1Bablp5elNaOFhjWGcr?=
 =?utf-8?B?VXl0cW1XQ3JRWEdIU3Bac2lJNUd4LzZhUnVSRSsxa3JFeHMwQ3Bac2Q3QXJB?=
 =?utf-8?B?UWZrWisweGhtdkl2VjJBZUk3dEZZQUVHVk81Z2lhNlBpS1haV29NekZ5UW85?=
 =?utf-8?B?MUIxNXpLZjJRTnV0QnJKNmR3TW9vOVdHVEFNVGxJNGRIWDhLWElIUko4dGZw?=
 =?utf-8?B?YWlOZDQyMWM1QklYeG1TbWtNUmtRTjIrU25kZG9sTi9BQVhhSHRiOVhXL09O?=
 =?utf-8?B?TmNVWjB5ZTJMMC8za1lPQUtWR2QrMGZweUZnS0ZIWWRSZklDMW92cmMzcmRZ?=
 =?utf-8?B?U2F4RkpkWFU0bUN2MnZRdWFidnBxcFlYanJrbThUdW5FVUdDVTFRUFI0dWRp?=
 =?utf-8?B?aVo2WDcrdElVRXNsZGNBSm1RejNhenpEZW5wVzdDVkQxeE1XZlQ2VkttbkRI?=
 =?utf-8?B?eTdzRytIWU52cHN1QmdjV2ptMnBVZ2RVb1FCVjk3b3VISUp4RHFsb0hqSFZp?=
 =?utf-8?B?OEZQL09KQ0JISEVmd1BJalV0cWdXWkRZN3RJM2UzNnV2aElINWtHRTBRTG5H?=
 =?utf-8?B?bVVIek9ON1NIaXBrZmd4OHFQc2IwMU5oZVhpc3dsVkhLTGlWUDZsa1BUaXRr?=
 =?utf-8?B?VEJOTUhoLytYR1d5U29uVzFzazJJUmpwTk8yODhkMmFZYlNXckgzZjVleU5p?=
 =?utf-8?B?SEJqcGVtSHBzVEZXZStnS085RlozTW9vOXNvWGZUYm4yenJ3TVhDZnQrTUxM?=
 =?utf-8?B?N05SV0ZVblI1aTd2U2dVRUp4eVg4QWF5OCtOeUNkb2ZFcnVkRTZObm91SWlB?=
 =?utf-8?B?enJpYXNkN2tXUnpBVUlrc0JEZnRHNlkwZDlCUXkwd0FveGNQZUpOOW95WUFu?=
 =?utf-8?B?bnFPUjFvdzVpNzFTVjQ1UWl1VmVTVi9mRkJ1cm1yNUNvbE55UjFZc3hNdmI4?=
 =?utf-8?B?dyt5SGI2WW1KWWt5OGtlenRWL1ozdHdUS2J3OWp0Y0tiSEx2OHdmdkRlQmpz?=
 =?utf-8?B?ZFRJUHZJRzZZdlpyQ1VCUkZFbU9JRmZLNUxDaE94eEN0RTJoUmIrb3IrOXhR?=
 =?utf-8?B?VWlidGNwT1dwZk4wTTM3dzk0MGRCN3Mxd2NMTmN0ZVduNEhGdTlIUDgzampU?=
 =?utf-8?B?ZVIyTnFYQ1BRcHlsUElqN3pZQkVWcDhHaFNieFZ4VW1MV3pKWGd0RklxU0FK?=
 =?utf-8?B?dmpPZklVQVZ6YXNSU056OXlpSi9WTjY3ekt4VHZZZFRIOVlQU2dLK2ZFZS8v?=
 =?utf-8?Q?atERs86uc6aRxgzJTOkfFJlaA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63158d59-c35a-45cb-d17b-08dac17f2a87
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:48:34.6147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WO/UmK2re/vkKMe4FFcEb0+CPg3zKXm2pSDBYjmfDSUs+fv9N2n6UCQzCrImwNsdkAlLcqAHaVn/1B0DrzAQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8472

On 08.11.2022 11:59, Luca Fancellu wrote:
>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>> +Here is an example to add a new justification in false-positive-<tool>.json::
>>
>> With <tool> already present in the name, ...
>>
>>> +|{
>>> +|    "version": "1.0",
>>> +|    "content": [
>>> +|        {
>>> +|            "id": "SAF-0-false-positive-<tool>",
>>> +|            "analyser": {
>>> +|                "<tool>": "<proprietary-id>"
>>
>> ... can we avoid the redundancy here? Perhaps ...
>>
>>> +|            },
>>> +|            "tool-version": "<version>",
>>
>> ... it could be
>>
>>            "analyser": {
>>                "<version>": "<proprietary-id>"
>>            },
> 
> Yes it’s a bit redundant but it helps re-using the same tool we use for safe.json

I guess the tool could also be made cope without much effort.

>>> @@ -757,6 +758,51 @@ cppcheck-version:
>>> $(objtree)/include/generated/compiler-def.h:
>>> 	$(Q)$(CC) -dM -E -o $@ - < /dev/null
>>>
>>> +JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>>> +                       $(XEN_ROOT)/docs/misra/false-positive-$$*.json
>>> +
>>> +# The following command is using grep to find all files that contains a comment
>>> +# containing "SAF-<anything>" on a single line.
>>> +# %.safparse will be the original files saved from the build system, these files
>>> +# will be restored at the end of the analysis step
>>> +PARSE_FILE_LIST := $(addsuffix .safparse,$(filter-out %.safparse,\
>>> +$(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
>>
>> Please indent such line continuations. And then isn't this going to risk
>> matching non-source files as well? Perhaps you want to restrict this to
>> *.c and *.h?
> 
> Yes, how about this, it will filter out *.safparse files while keeping in only .h and .c:
> 
> PARSE_FILE_LIST := $(addsuffix .safparse,$(filter %.c %.h,\
>     $(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))

That's better, but still means touching all files by grep despite now
only a subset really looked for. If I was to use the new goals on a
more or less regular basis, I'd expect that this enumeration of files
doesn't read _much_ more stuff from disk than is actually necessary.

>> To limit work done, could this me "mv" instead of "cp -p", and then ...
>>
>>> +analysis-parse-tags-%: $(PARSE_FILE_LIST) $(objtree)/%.sed
>>> +	$(Q)for file in $(patsubst %.safparse,%,$(PARSE_FILE_LIST)); do \
>>> +		sed -i -f "$(objtree)/$*.sed" "$${file}"; \
>>
>> ... with then using
>>
>> 		sed -f "$(objtree)/$*.sed" "$${file}.safparse" >"$${file}"
>>
>> here? This would then also have source consistent between prereqs and
>> rule.
> 
> We saw that mv is not preserving the timestamp of the file, instead we would like to preserve
> it, for this reason we used cp -p

Buggy mv? It certainly doesn't alter timestamps here, and I don't think
the spec allows for it doing so (at least when it doesn't need to resort
to copying to deal with cross-volume moves, but those can't happen here).

>>> +	done
>>> +
>>> +analysis-build-%: analysis-parse-tags-%
>>> +	$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build
>>
>> This rule doesn't use the stem, so I'm struggling to understand what
>> this is about.
> 
> Yes, here my aim was to catch analysis-build-{eclair,coverity}, here I see that if the user has a typo
> the rule will run anyway, but it will be stopped by the dependency chain because at the end we have:
> 
> JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>                        $(XEN_ROOT)/docs/misra/false-positive-$$*.json
> 
> That will give an error because $(XEN_ROOT)/docs/misra/false-positive-<typo>.json does not exists.
> 
> If you think it is not enough, what if I reduce the scope of the rule like this?
> 
> _analysis-coverity _analysis-eclair: _analysis-%: analysis-build-%

But then, without using the stem, how does it know whether to do an
Eclair or a Coverity run?

> Or, if you are still worried about “analysis-build-%: analysis-parse-tags-%”, then I can do something
> like this: 
> 
> analysis-supported-coverity analysis-supported-eclair:
>     @echo > /dev/null
> 
> analysis-supported-%:
>     @error Unsupported analysis tool @*
> 
> analysis-build-%: analysis-parse-tags-% | analysis-supported-%
>     $(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build

If I'm not mistaken support for | doesn't exist in make 3.80 (the
minimum version we require to be used).

>>> +analysis-clean:
>>> +# Reverts the original file (-p preserves also timestamp)
>>> +	$(Q)find $(srctree) -type f -name "*.safparse" -print | \
>>> +	while IFS= read file; do \
>>> +		cp -p "$${file}" "$${file%.safparse}"; \
>>> +		rm -f "$${file}"; \
>>
>> Why not "mv"?
>>
>>> +	done
>>> +
>>> +_analysis-%: analysis-build-%
>>> +	$(Q)$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile analysis-clean
>>
>> Again no use of the stem, plus here I wonder if this may not lead to
>> people invoking "analysis-clean" without having said anything about
>> cleaning on their command line.
> 
> In any case, the cleaning process is very safe and does not clean anything that was not dirty before,
> so in case of typos, it’s just like a nop.

People may put transient files in their trees. Of course they need to be
aware that when they specify a "clean" target their files may be deleted.
But without any "clean" target specified nothing should be removed.

Jan

