Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BC577EF5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369460.600883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNNX-0003DV-5P; Mon, 18 Jul 2022 09:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369460.600883; Mon, 18 Jul 2022 09:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNNX-0003BN-2E; Mon, 18 Jul 2022 09:49:27 +0000
Received: by outflank-mailman (input) for mailman id 369460;
 Mon, 18 Jul 2022 09:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDNNV-0003BH-Jp
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:49:25 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7ca6782-067e-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 11:49:24 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB7PR04MB5209.eurprd04.prod.outlook.com (2603:10a6:10:13::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 09:49:21 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:49:21 +0000
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
X-Inumbo-ID: e7ca6782-067e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jgk31qrwKk2FNTfp2htxMK4tbVS71MBcNrQCOENE3olX55LyUvdwRNs2eKdbBeHI3gdG41gkNVApYqM337rQpY4pM77iffQJe+WSjy62cp4FsUOZ5NrNjgTDXrMrV8siK2KJhrPW06nAvxeYSNSL0nM6vtu8v6bAOhVgG9stCWMwkOwlQNdcc1LBurv7jbEkbJs9oonkL60jbKySTHlhGsCLqu1RjHJwEyNBMKqrtRsg1j09lV3jPWmDcG+1tkwxaishcD0mcIYx4Polf2t9GHnXJCci9o/Rw7X8pbxHOhTA/dLSEU2SVYPbhBE57gzKM0RtLwVuVwO/lL2JbwWt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ5zshumVsMdkpAYtuQQKspNTbzMA87oEp5PPWkFb/s=;
 b=iERV8tzxGAsRsaONMCPbXIv7iaoa7nAg8mYFWEbFnHctetH1oVQc+SQSARZHTrMzVFVdhY++IVkMHul5wfgrr8jrFk57L/4xpex5NlE+iWvAGQ7vE0KtB2iXyKvLGZseeK03MQw5BSeP9wvIDDRo6xe19HzVswSNaiGLm9to1/Kr15pFeVJviKFTuiDIr5ZE9qeXVzImOsD95nWeJ1M0zURNwgUHgmsSXuiYNcgbiMvvfvCRdIp7y/n2wQqSvRtAmfz2GYlhGfOXARmQmijhqgkZPzOu53oDs6Ss3zhGkLEifE+zexv4WA9kwTGBm2El3y3vQxK6x9qzTybFY54sbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ5zshumVsMdkpAYtuQQKspNTbzMA87oEp5PPWkFb/s=;
 b=bJSv8vp3lI2vOpaq0US90eNNvjNCyPyApR0YCwRYL0kp737dPceSOT4J4UzUdjPiYUyiAkyOievqD9A0AKhyyKogvQ221+4Xcbqlrw1asSkuWFgVlZ9lOzKH/TUbk1Yeos3JHksbpUzT/4nGWS3pu41Mkvc0pkIxV93YyB7Svqa2ysb98VG5jvoXf9A3Icz1E91DVt76DO6qMvpHMya1gXXx9xoNnBmxgJeQmahQ53GvvWfXhxlC047BigyE2SnbqD1AYBNxY+Wb1brqngWpaAk035+FmInO7/x2D21Sbnja/XNOZxmLKa9sVPMtLmUaZ0gABDxiAaPqAOl4TB11xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <465e44a0-2005-99bc-3fca-241b8c510df5@suse.com>
Date: Mon, 18 Jul 2022 11:49:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit
 build environments
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220715132651.1093-1-andrew.cooper3@citrix.com>
 <20220715132651.1093-3-andrew.cooper3@citrix.com>
 <dc25adc2-7e99-0394-a446-56a1e5e804e4@suse.com>
 <aa786e6a-7db5-f719-c8d4-26adba96475a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aa786e6a-7db5-f719-c8d4-26adba96475a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5622d46b-53d4-4ba4-9f8f-08da68a2ca4e
X-MS-TrafficTypeDiagnostic: DB7PR04MB5209:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqQl0f9fPFcByqqAlE2vq3LGZ3W8XsJQJKnnj2g9QdvKsZnPprSKp8HvskmlPzaDVENLHCGPE6xdbPvQrYYnly3n1TpZfD9eqjICCBP8TuvGjdUYRI3EXtYiU1PpZ8WcMCiHvJP8ckCC22iUxc3KJ9zkN0guSt2fJbbCc0/pJFMBjRwY8tmgDjXQfr3DBEzaqeKLjoBiMyjLGV+zxLQB5oDfiDgCowp/yGou3HkFJ3TZbTCJHHyYw50Sq/mPEn0wN8VvyDe96TwaccflceEFLog8XSc6TRqYQx1ty4sWB4I2+pVgyWDfl+q66umUaMSXYdl8KSF8HX2MbSQFbhcmtutBAC4rLsQJaD0Km0YF27rZkzkAps3JnOX7bih5uZbXiZDeFm+iiseooImXNBfFZY3ex8QUlmgx51d6aSK8RSl/S/qBIHt1AveG0hDnYBCcLLaGTTwepF2F76yfdHe4q7qSqTDdDqLT8GGVafdaEH0L8Pm792GIzjVoCtMpBp0xZkdxexHMRLkDmbsDIwmPkgq+mZIAm74rtNjpZ7PDZdZd4PF5nmAc/ih3kvH6P/LIaS04lCrqzMkPoz04i3aimFC3FxHDCitXxGBWTTXYVlW3wZVkEvnk/Y9ei2JGvqAX5z1kZXR4rK6//M8RhEqSZrWt/zfnbTetY8y7r+sdnEEER0/8Q9j058prYKnBhYTkgNHTyTljCRwHF0u0Sic7w4rXWeZbRGRdEBniUht0VFbhVyK3n/A0E2fIaG7bhgTimkMv5s6WNz5jmpF0QdI+wBpHmLdh54ivpBwUY/DOAOdwvwYIWGqvhIHDRWml9LnrMr3c/BRpU+bWmxsTe6bW1gwXCXelDwQiryAVnfAUzHfQXnUOgFL4aNS8TEDsPCYF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39850400004)(346002)(396003)(376002)(5660300002)(31696002)(86362001)(186003)(2616005)(7416002)(38100700002)(54906003)(8936002)(83380400001)(8676002)(66556008)(66946007)(4326008)(66476007)(41300700001)(2906002)(6486002)(26005)(478600001)(6506007)(53546011)(316002)(6512007)(31686004)(36756003)(6916009)(4290200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXAvZlVOd2ZNK3FoSmdNQVdDbDhBSDU4ZnpSdkZEcFRiYmRXcEtZY2lvYmd4?=
 =?utf-8?B?TW0rYUgvOG44ZElZcHhLSVgzUThuM1luR3Z3OUhwRHFkR3lYQ0F4VzVXTTR6?=
 =?utf-8?B?cUc2cU9wWWZCd2lYQzZFbVc4aDVQRmZnZnk4SkZ1WVhMem1DaFdtT0dqODNU?=
 =?utf-8?B?SzAwakxzVHd0SWRSb3YwUjNqOCtxb2kyaGl0VFZGeVZ5M3pXUUJHek5vSzI4?=
 =?utf-8?B?NDY0QUNremJYcndTcGRaSXJKWWdNc3RBZ1pDNDY0d0F3MW92UWxVRjNtQWY0?=
 =?utf-8?B?VXd6eEI5ZVQzcTFBeEdrQ25FOVdha1N5eDEzNXZWeFE0c2wrc1NvdGFOREFM?=
 =?utf-8?B?bzljQnhJNmlySGtiTW1HTC9yMlZ0N2JmL09peUtyVUFCNm14dDJ0cnBXVFB0?=
 =?utf-8?B?aVgzSE1CSVpxUis3SDZ5cE5CYkIyNzZDUnJFSEYzM2dOODRsQXNPR3FHRCtN?=
 =?utf-8?B?YzBIZk55dmhjVkUvOC9sSDRUZS9BUjBKaTI2Zmw2UlJWclBhZFo4cGpSeGpI?=
 =?utf-8?B?b2lTWmJrQ3ovYmNjL01INGRockhoeTEzM0laUmVRZVZ2RXRVN1Fac3pQWnpH?=
 =?utf-8?B?UlBpeEZKVUdzSGRaUlFneDMrSW1vMUI4amwyT0lhK3laVHpjM1BQdWJJa1FC?=
 =?utf-8?B?N2JPdjFycXhXM1NQNVk2dGwyZExjWVQxMHFpOHp3Uis0Q2pRQ2JLMExtdk1a?=
 =?utf-8?B?VlBNR3VWdldoZGp5WExxeVZHa3FmVnA5WklhdnhUY1RVbW90VUdyUzNBNDJW?=
 =?utf-8?B?R0FKMmdGS3lpR0pra0xpeDFSc0FhWUdkZEk4cWFHaGh4bWNOYTFLa0RHbVBl?=
 =?utf-8?B?WnFMaXVuNHBKV0hSSmZHWkMwdDlwOVNUNjNIVG45bTVGYmVHTUpDd2x4WEFz?=
 =?utf-8?B?L1FHTzdISHF0a2xvdlV3QW8vdlR2YzZDOEpGRVFwSUhoN2pveEtqZFNTdGF0?=
 =?utf-8?B?aTJUUFpSNzBKOVROeUJnNHZDUC9Sd0ZoYWZwd3haS0psNTd4L0s5NFdnVFVB?=
 =?utf-8?B?NkViYy82dERQS2FsdVVYMWJxa2xzR2xIbzZqeGs0a04vb2xqaW5LMXdNMk0w?=
 =?utf-8?B?MllpSkNTZ0pmb09hc2pOL3Q0aHRGRTBzalZtMVJkK2lHbjd0eFJNVTdNREY5?=
 =?utf-8?B?dFNubGJsRVhiQXlzOEJQYXFEQkg3aTN3VG1ZL1IvT3hMeGZ4bHdRWUFmMDYv?=
 =?utf-8?B?eStBak96Vld0N2dXcHE5S3VhM242UTVPRnloUjZTZmJRTGQ3RnBNOG1ZUWZC?=
 =?utf-8?B?Z3NTTzZFT0hOUjR4NTdCdjRLT0VZS2FTaVc0TGlCejhQbTJhY0pRT3lyZXlj?=
 =?utf-8?B?a0w2Yll4RVhKYkg5NXZobUZCWU50OERId0xFcitpSFZNLyt2dDllaEpIcysy?=
 =?utf-8?B?M1YzMTM4Q1ppbXRJbzBpMm5ubVNXZGpoZjVaVmM3TVBOVGhSZjNZUG1xcGRC?=
 =?utf-8?B?VHZYLzRwc0Vyc1Nnd0VoMlZZcm1pdVRTbjJjN2wxKysxSytYOFRDYmNkRkNK?=
 =?utf-8?B?cFBvWlBsZk5qU3lZZ0kyL2c0WHBHL1RUSE1jTVhZb2NKUENPRUt1MW5zeEhO?=
 =?utf-8?B?eGxVMHJnd2hjc1YyK0NXeC9zOXhyODRFNXR2SW0zTWt0cmZRS2JJMFJuenpx?=
 =?utf-8?B?Nlgva2wyUndtRVN0MHRyMmNmZmhoR0Z2Q09kTkZVamVRZDFRTjhCdElrdkJF?=
 =?utf-8?B?WUkzMWNuZ3ZQZ3dmS0IxcXptb3loaFdoSTYraGpDc1ZDQ2JpZnlRcmN1N01q?=
 =?utf-8?B?aEgydnZnL2ZjZlFoY0xMOUczY3hWVm9FUDUxUVNuVWlRck5sbmx4ZEFIYm9L?=
 =?utf-8?B?a0lxbEVBTHJNaitFZ0VNNVJMczZwOUpOcVp5TkJ3SlBhYWEyWGswbWEvQzkx?=
 =?utf-8?B?NnhiUzF6WDkxS1VVU1JMd0dDZ1Ztank3di9aMThjYS9zL09NbFBQUVJ0MTBE?=
 =?utf-8?B?MlVST3lWUFluakpFTjVjemNEcFgydjZ3SGlwR2xpcXgzcnlLdFZIRS9oS0sx?=
 =?utf-8?B?ZG5YOEx3NGZlL0t6ckM4QmVwV3lsQVhOUTVPN0V6TWpnS0tkUzlQN1ZDek92?=
 =?utf-8?B?UjFFMjgvbHVnNXF1aTJiUWhjZHFmaENHWjVwanlWM3VnalhWR1dqMVpEWUVM?=
 =?utf-8?Q?qKE+JCAZAfAEju4cH7WTkvmwm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5622d46b-53d4-4ba4-9f8f-08da68a2ca4e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:49:21.5581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kw5Ay9pZrP7zRuxZeMIKjn1qi4P/kbrLNmHjXZy+RMmP+WUQTOMxPRdatfKuGRGNRGyHjhCeSnGjJvQFSORVNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5209

On 18.07.2022 11:31, Andrew Cooper wrote:
> On 18/07/2022 10:11, Jan Beulich wrote:
>> On 15.07.2022 15:26, Andrew Cooper wrote:
>>> --- a/xen/tools/check-endbr.sh
>>> +++ b/xen/tools/check-endbr.sh
>>> @@ -61,19 +61,36 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>>>  #    the lower bits, rounding integers to the nearest 4k.
>>>  #
>>>  #    Instead, use the fact that Xen's .text is within a 1G aligned region, and
>>> -#    split the VMA in half so AWK's numeric addition is only working on 32 bit
>>> -#    numbers, which don't lose precision.
>>> +#    split the VMA so AWK's numeric addition is only working on <32 bit
>>> +#    numbers, which don't lose precision.  (See point 5)
>>>  #
>>>  # 4) MAWK doesn't support plain hex constants (an optional part of the POSIX
>>>  #    spec), and GAWK and MAWK can't agree on how to work with hex constants in
>>>  #    a string.  Use the shell to convert $vma_lo to decimal before passing to
>>>  #    AWK.
>>>  #
>>> +# 5) Point 4 isn't fully portable.  POSIX only requires that $((0xN)) be
>>> +#    evaluated as long, which in 32bit shells turns negative if bit 31 of the
>>> +#    VMA is set.  AWK then interprets this negative number as a double before
>>> +#    adding the offsets from the binary grep.
>>> +#
>>> +#    Instead of doing an 8/8 split with vma_hi/lo, do a 9/7 split.
>>> +#
>>> +#    The consequence of this is that for all offsets, $vma_lo + offset needs
>>> +#    to be less that 256M (i.e. 7 nibbles) so as to be successfully recombined
>>> +#    with the 9 nibbles of $vma_hi.  This is fine; .text is at the start of a
>>> +#    1G aligned region, and Xen is far far smaller than 256M, but leave safety
>>> +#    check nevertheless.
>>> +#
>>>  eval $(${OBJDUMP} -j .text $1 -h |
>>> -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
>>> +    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
>>>  
>>>  ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
>>>  
>>> +bin_sz=$(stat -c '%s' $TEXT_BIN)
>>> +[ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
>>> +    { echo "$MSG_PFX Error: .text offsets can exceed 256M" >&2; exit 1; }
>> ... s/can/cannot/ ?
> 
> Why?  "Can" is correct here.  If the offsets can't exceed 256M, then
> everything is good.

Hmm, the wording then indeed is ambiguous. I read "can" as "are allowed
to", when we mean "aren't allowed to". Maybe ".text is 256M or more in
size"? If you mention "offsets", then I think the check should be based
on actually observing an offset which is too large (which .text size
alone doesn't guarantee will happen).

Jan

