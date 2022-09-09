Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143C5B3AA5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 16:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404418.646885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWexU-0000iy-Bl; Fri, 09 Sep 2022 14:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404418.646885; Fri, 09 Sep 2022 14:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWexU-0000gx-8E; Fri, 09 Sep 2022 14:26:16 +0000
Received: by outflank-mailman (input) for mailman id 404418;
 Fri, 09 Sep 2022 14:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWexS-0000gp-Vj
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 14:26:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b142d98-304b-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 16:26:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9010.eurprd04.prod.outlook.com (2603:10a6:20b:341::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 14:26:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 14:26:11 +0000
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
X-Inumbo-ID: 5b142d98-304b-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STPZleN/Xh1fYruCPhIYxappdC4DM1iu4fgl/+ylP2IyycoLUsQNu0r5a0wGN8rwcf/2pDbMYEnYzkXpXaX6UWeJF0rYpweVxOj+PII2qKlYz5ydyr/j5OlxPYS7oWGvDs1PEHdSL7f9CzFrr9hVbRr6FeXLF+DW1m4TMQAgB6nzK5CkQF3Fs6qcbIsYyXfYSY1PMsbCnV3Sx3QtugKDNmekg8XqYL1uuy/18ZOK5SvNWABykBZDlRQx0pcaChNTvYI+iuI4xw5cqajnA60DKVrnGwKn0nckKsk8R96ezXpx7IGJthTBYjFCuSHJGpef80PBiKl0cX3hlLuT+ylFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PNFK4QrGosaJFaEnRBcEOUvt/MRsw6suUnT2k/Hc7c=;
 b=ERFUGghBFZqa3gV/y4r8m0bcKp9FMfMe9gpTZh0YtdKFexiRifoKICttOjbvRnaDamwL5ciPyOf3UjymRLWbx3J6MvUGvzx5SfV3rRtrFdsPGZQU5f63HFeTE2n6XWeTRBQrZ+6crm5lGDY8S6+P54rZzWDZolS8pbpGf2RsEjLR3do4a9hacfJUCkNLTPqA3QZ4doJsC567weDqcBUF8DHW4a7o66qOkTyddtCrU1nF/nXWkGYdnGvqoWO5sbV8H89y3uRm2F1KMa+ZNYwUc8hw0hck7ryKPdF/MYQkp9jeEMb9hOu1TsTjSDt1C5GuVROojSxGNHp1S5dwS3kGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PNFK4QrGosaJFaEnRBcEOUvt/MRsw6suUnT2k/Hc7c=;
 b=5oliie+yqFeGn49THtW2AT0FD3B5LJCEouFhkuNj03zb0Om6FTxENFqGG90gsiSVsnzhP9TuPZKjl/2Rua2CtQds0P3P/V9f3F5GRKaoqbo2FYDIryL87Rh/pqVq4k5ImTcvHZOZrz5szUxpw5+kY93vDAH11FxLN4e0aNa01K7MlngLEXXjM6kopNR6IIVgm2SKV7M/ass+ytFjo80vCWXHsKlSULuzNnpMHTXrgnjbvi0cI5IiNGIX40UyCdQ/fG0ifEmIq1Rj2eU+z2PhFMQqv22Vzw5qRkFK8RztKljNpRIFtSsnq/vEWR2chH9F2CBvGWUJkCvCYxgOIW3NLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d56764e8-05ae-b097-fcfc-eb178ec71b51@suse.com>
Date: Fri, 9 Sep 2022 16:26:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] build: correct cppcheck-misra make rule
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <0dbef17c-be73-1d88-cd20-83f3123361bf@suse.com>
 <8FB0B363-FE6D-4BFA-B5D7-E0C00737D3FF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8FB0B363-FE6D-4BFA-B5D7-E0C00737D3FF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad8af74-c9d5-4864-6c85-08da926f3de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hmHbvElBFKvc58ZhkCunhcgQsmdKDiHx84tWGQChAMaAHsUx2PwVW+Jl/NpGLCDxmr3V0VToCYeRG5ZASi5jaZfntjWBDnjN7l/WBI3bbSoQtCTJPQYA5CqooaA0Z2RcybuRxRUZh9rDeYfih1OgYjlghodIo0Tphmt9ysVfHuQ+QuXv21Do0qKya2QGEQlaUc/JBMqS9OQvepFVRs+HqFVmQpyU+qTov+D6L3pxQxG9bEOSHhp6NLQLuw2WmA+UahaVDKnuHWsEVhb5y9xDKo1UD7b8vngo3KqQB9rtXGqvB7d3ulfQaSwHpLWuVOvaon70pnJibvrTjpOD6nySjBf8sgmXIvhp4auQCOiDTiHg5S+TyOQVTXdkx2dHx7OYHx+cii0mm3y9SrboXPMeg5VT9u4cGVQq3c5Aumr249/Kk3pFXWz5UxGaxmuqLxV0aBKYpWEuzi3W7KLw7I1EbGD6o+3c59or43tnOHVQCArMdsc+TQSpNCw6MoGPh1Pb2gEe1pLhzHe3c1eWldITCLigtChBTZtFYTBEATz2sPXUqtb22ZeiKnCFGZv8rWtV7ZZAvCr3kWmPW8lZQ+Vi2yewogRU6OULFfLWZVf7EeCCWIUoeWIboxLaf/7NFuOBOWkDz558WXboCbT1vMn0X1neL5xIX3ZQmJeNVzdhYY/+SF/D9HwTCqaqgXs7T47OQD0jB3lHZVE0XCe6q6I7V9HGUIGgQVfWLldvp14gr8ovu7ldkkUcITahq1SiooE9Uk4ZNHui1U+KYYH5GZKc/9NB9FtWFLgsK+/enOXjXpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(136003)(346002)(396003)(83380400001)(41300700001)(478600001)(316002)(6506007)(54906003)(36756003)(31686004)(6916009)(6486002)(186003)(2616005)(38100700002)(4326008)(66946007)(66476007)(8676002)(66556008)(6512007)(8936002)(53546011)(26005)(86362001)(5660300002)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OCtuYjYzZjlMSWZUZHEwTHh5M1NwbElIc1V5VzN2SjIycFh1STZHNVArbk9o?=
 =?utf-8?B?OUcyQUxqQnMvOTdKUzlUN1VEeUxWQytUeVBCemFOcmNCMDZ6dUl5OWFkOWF6?=
 =?utf-8?B?T29Cbml5MkJVM3M3R2hRYXBsbU8yQU5rRW4rT2w0bm03bW82djV6ekZiOVN4?=
 =?utf-8?B?SnlZTlZuRHYxL1RxczlmSDVCeUpFZS9zVHBueGVwTXpqbEhSRzlId291VXVH?=
 =?utf-8?B?dUJnUktOWGc1ZjlUMm55TXJzdEM1Nys4QVVObE9sMGhvZElsOVhTalM1VnZD?=
 =?utf-8?B?OUNRYmNBa2VLa3dyVnFYa3NQSWljS3dRdnBqOXFsZkxIelhkSnFldFNCV3A2?=
 =?utf-8?B?S1dGSE5uSmg5N1FsQWxGQTJYMGVzbEZOd3YwQnNrTDRGUWdDVEpnRzhjK0dM?=
 =?utf-8?B?WVR4bGdndVk1ODNxZWlUeWxERkx2bk5IWWl1ZkpJUWRLMnp6TnNvakM3V00v?=
 =?utf-8?B?VXBvM3VydURaK053L1ZNSDRydjB4K0hKZjRtQnRoSWRkZHMvVmdGb2kxdHYy?=
 =?utf-8?B?T3FuSEtEeUVhbEFsSldmZzgzcWU1Y0IvaWh1K3lVR2xXZ0Z5ZWRxa09FKzZp?=
 =?utf-8?B?NWpkd1dMUWNLemYvbXc0STV5cWZiSmt3dEZpVzRhUDNibkhJbzJsZVFzbW4z?=
 =?utf-8?B?eWozd1lQNitmUVM5U0lFOExuMWJqbFlwblE1ek5vUmREMy95TXFQZFR4Wmxh?=
 =?utf-8?B?WXpIeURrRENxNSt4NUFzWDVxU0tnUFVFR1A5MDJmM1NsWmpBSGpqRmxITlFu?=
 =?utf-8?B?ZHIvZ3B1Rlp5MkV5ck96dHk2b1V1TUhVYmJkelhkcXlLcmNHMDF4aFZZT2hY?=
 =?utf-8?B?RG4rSGxudi9GMEpZZmRSZ1dDZXVLSGQ4cEpvK05jcnJzMHozazNwM3JxRzZZ?=
 =?utf-8?B?MmFxeldiSmRsM1Zyanp4TDFIeUUwUGgzb0k5Mjh2S3l6aDM3TWhIbG04RWdr?=
 =?utf-8?B?MkcrSUovblZOSzA4SVlTblBFV1lWYURZUzVnS09uWitEY0pPTUJNcVpzaGlv?=
 =?utf-8?B?elJzMWF1SUo5ODBJNGFGQ0tPWVZqTmJZMDZwZGUvOFdEcjNyQng3WStML3pj?=
 =?utf-8?B?a0kvMkhSRkRaSkxERXovenZXMXJ6cmd1LzJ1VUdGUEdUTy9zQng5VVV6QzJ0?=
 =?utf-8?B?ejRwaUFXQXVkY1NRRHNTVlk1L3NQWndST3EwSkRubktVVHdpWE10Z0FhQXZ5?=
 =?utf-8?B?WStRcFZsUnozN0FnNTRxN3pDbW04WnFkNXZ1NldCUUErNUc4d2xkc21EM3Qx?=
 =?utf-8?B?cDhySnlJODdWK09aQmxvZDFURGw5Y2lkY2NFbW5ZTzhlNEZDekFMS0toQU5h?=
 =?utf-8?B?aUJwSXZGN0wrblFGYXBJVzFiRGxpcUdWa1U2OE5JNS9KNjF6a3BGalVydGN1?=
 =?utf-8?B?Q0VaVHZEcXpjMnhLMTJteDdnTUwwRVhGeCtSNHFOK1FQTGx4WUI4b2JadzdN?=
 =?utf-8?B?SUdlMWszcmZsaHBUaS8vdXAxZDNaTFFGZzNhRm9zc0F5Z1dweGV1aXBWeTZH?=
 =?utf-8?B?Q0VkVzFOOXVyVTFmRUtKUFo1M01pcFVwN0twUGxOclJUUVQ2VGlHRm93N3pz?=
 =?utf-8?B?YnVRbVJzSnJsL05ETC81WmNVbjJhaFRwVE5YZWlza0JVbU1iWUIxY1BCNVcw?=
 =?utf-8?B?bkZ1V2phaDZOaVllVGpYUHBkUXRPeVVxQVBrT1J2UU1sNWFNUkxRb2F4b1Rh?=
 =?utf-8?B?aU9QV2ZUM1VqNjU5TDg0dFZIZHAvdm9nTE1kZVNVUCtCUzNzTEpnM2pIbDM1?=
 =?utf-8?B?Y3NyY05uZkl3bjZrZHQrNG5GaGlpRENzV0tyWTNmZnNKenkxd25DWHFrdDVE?=
 =?utf-8?B?dUtXZ0IrZlJYbG9mSU94c3J3TklnSjRobXJibnRsQVFVL0hHQk1vWjRON3Jl?=
 =?utf-8?B?aWtMR0FVekp5S2NRem8yVjBXaCtiWUNRV2JYWW9QYTZnZ3ZqeWx4UXNacitL?=
 =?utf-8?B?WTVxdE1tR3ppU3VIRUlpaVl0S053cmNwaEdLSktIazJzVHJ6ejd5NGhQZXpX?=
 =?utf-8?B?bDZpTDhuRktQcHhnbDJZaFF4TVRBMXd3aDdzVlIzeVo0bTRwaHRJZWpoNzU1?=
 =?utf-8?B?OTBZYURWVVpONkd4SW9ndnpIMjhJNmVkU2tGcFNHeGtaRUVMeStKMFhPNG1V?=
 =?utf-8?Q?ECI5WBkZgoc15FVW2jZJy1IKs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad8af74-c9d5-4864-6c85-08da926f3de3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 14:26:10.4936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzqUA+m8FsaXd7+XvB0tEtfOkNrVMbS+pFYdhAGnD1IBpkPBmdycGyktJp0n/DGV58zYquQ6d0/extzLhIfKBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9010

On 09.09.2022 15:50, Bertrand Marquis wrote:
>> On 9 Sep 2022, at 14:41, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> It has been bothering me for a while that I made a bad suggestion during
> 
> This is not a sentence for a commit message.

How else should I express the motivation for the change?

>> review: Having cppcheck-misra.json depend on cppcheck-misra.txt does not
>> properly address the multiple targets problem. If cppcheck-misra.json
>> is deleted from the build tree but cppcheck-misra.txt is still there,
>> nothing will re-generate cppcheck-misra.json.
>>
>> With GNU make 4.3 or newer we could use the &: grouped target separator,
>> but since we support older make as well we need to use some other
>> mechanism. Convert the rule to a pattern one (with "cppcheck"
>> arbitrarily chosen as the stem), thus making known to make that both
>> files are created by a single command invocation. Since, as a result,
>> the JSON file is now "intermediate" from make's perspective, prevent it
>> being deleted again by making it a prereq of .PRECIOUS.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I've not been able to spot where / how cppcheck-misra.txt is used. If
>> it's indeed unused, a perhaps better alternative would be to convert the
>> original rule to specify cppcheck-misra.json as (the only) target. One
>> might then even consider using "-o /dev/null" instead of producing an
>> unused *.txt file.
> 
> Txt file is used by cppcheck to give a text description of the rule.
> If you look inside the json content you will see it mentioned.

Oh, that's properly hidden then.

>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -746,11 +746,9 @@ cppcheck-version:
>> # documentation file. Also generate a json file with the right arguments for
>> # cppcheck in json format including the list of rules to ignore.
>> #
>> -cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
>> -	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:.txt=.json)
>> -
>> -# convert_misra_doc is generating both files.
>> -cppcheck-misra.json: cppcheck-misra.txt
>> +.PRECIOUS: %-misra.json
>> +%-misra.txt %-misra.json: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
>> +	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $*-misra.txt -j $*-misra.json
> 
> As far as I know, this is not saying to make that both files are generated by this rule,
> but that this rule can generate both files so nothing is telling make here that calling
> it once is enough I think.

As said in the description - it specifically has this effect. We're
using this elsewhere already, see e.g. tools/libs/light/Makefile
generating three headers and a C file all in one go. Iirc this is
also explicitly described in make documentation (and contrasted to
the different behavior for non-pattern rules).

Jan

