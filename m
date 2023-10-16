Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8827CAA3C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617601.960337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNvW-0003SR-MT; Mon, 16 Oct 2023 13:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617601.960337; Mon, 16 Oct 2023 13:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNvW-0003Pg-JW; Mon, 16 Oct 2023 13:46:34 +0000
Received: by outflank-mailman (input) for mailman id 617601;
 Mon, 16 Oct 2023 13:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsNvV-0002io-PE
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:46:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ab61f67-6c2a-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:46:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9832.eurprd04.prod.outlook.com (2603:10a6:150:119::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:46:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:46:28 +0000
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
X-Inumbo-ID: 6ab61f67-6c2a-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bgrk9Z6DEiZ5h9wG3XZwN13PuYV1kOjWEzb5ADFiCVta5zhfDGVB0fXdEPhgxCyIZDUHNO4l/GK1YbIgpZSDgE/Gg9T/ebaS6bKZv6RZaTDBlF57squoKipJbH+/sB2Jl/kHzFLcObjg7zAAZMfloUTbQU8LaxD+x3+MbkJzafzrCvfz1bDP8URISDG95Pb/VDmywdASht0obHOvQQCtR4lRwi5TGsWHQi6HCaOsANcGm+KCeFmvMG5fv0qN3Hoq4egTg2U2duaqnJ0yJW6mV/d/l27CNkCxJyjcSTVnf4KArOedn7tAZIJgPQYDVC9n6o6m8d1t1rYIL/5DXx2a0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YBYUd9zr4aIu1nkPk8WLGBE4ZzQT6DzC+Sv39wG8QY=;
 b=Rr6q528yd0/qpAIGc/qGZce71Wsp3cPBzXI/UYyqqcJFO+2C4GTIMZQQGw+onV11tqu7WUxFl++CnU5rn92an/fi76eX1tqbQ1LKkB8hfRGVJzYGjJQwIU7SVwPlUokBv7Hxx8G/4GhdZJklK9gXOKUXzR741zMKFFV2lKne2/T8h1ieP3wsjEwCTECFk+WjWyL0SXtBoU+ffmNgGvxWw8z3vvcmQfjY3Emi/m5GCbL/SUXjETRKQ8UyWaSbRT/Fq9GFbLrz/9tpPpOtXKOLlBB9wzUTLTG/4DebH+JmVOEz+oEa/BLHlAxbu724U20pVxzOzzeCwS3dxWJCUulRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YBYUd9zr4aIu1nkPk8WLGBE4ZzQT6DzC+Sv39wG8QY=;
 b=XBt1hSfQ34+DXlTusNZwXLl0vPeYC83Vbg+MARUwYf2Pmcz8jU9p8twPDjYt6ulcHUHbnFwoxDgEmc0wUS8NJf+D+3hl5qSu+BplUsRy1hG08iUJbFMu8q5U4F+mmS4Gnhl6wE/oCkqa+QkYEhskdcHqiEauDNH71AbONIOcdqhTwmCmC0nqvLC2Z0zuncl7lAVdUvfkiJEe9aabhSetqrZ+rbxgprwk4kxCkWiuE39iHej8BgdH+7vwnr2CcyNQUDheOPCS7mnU4ELYMfU2VR/djSwM+X6/MZd9AoHV5IwqDcdfxE3l/ygCul0JdOjcExFUjbUP8yhypeHePiF5Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3356cce-2531-cf5c-2114-ffbf52bcd50f@suse.com>
Date: Mon, 16 Oct 2023 15:46:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule
 11.9
Content-Language: en-US
To: andrew.cooper3@citrix.com
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1696948320.git.nicola.vetrini@bugseng.com>
 <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
 <9c728576-16e0-4d72-9019-d6f5fe8f033b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9c728576-16e0-4d72-9019-d6f5fe8f033b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 105e2c1d-8ad8-4b00-8ab7-08dbce4e4c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9LJf3IkI8c/KnssUcs1g8GkFHtXpFxVLDfF+LraC0xHnnSzOD0t10HSePAZ8ATk4GYFDFFnyNBVa2ILjCsZZsfMX4C6Eb12LfMTcTvMZ4OwmxALdfp9hDQ/ZIjZuKN+mKBJAJU8NxCO39hG8Thr7mOZ2jw7niJh2fpf0nvRdJPIqjVvjaJdmqc9gPehpMkaQJ3TIMU1hHu0q+2TsRfn7L7dRplCxIzQwYeZeH8Xro0r2WmzayNvf7+fA0msxOaXIFg/KwOGhKKJRL2yLQs3AyH5l56OuiXDA/FJW/Qd52uJLbvpMkaYTBfbWHDBOklOmUzfAxtsIZGTGLomWnn8kwOlPnq8TxJMquV5SnRQwpZSsPnpJyHLvzf/zUjyx3KS+vNYP3aTUSzen+oBE+8Zhzx5we2cdiRJzsLmVmcRUJCR+LEHbHshWqcW0+irjcjtw0wwKMwm+TzKcvntA6rZc6vvrAVVgWfywxLKMaeZfoQBTxHGDsfTkhCBnTlwYreEGAb14j2Kgdgm/Zvw6k/ZJcgYVwbC8ZHLFSO3eSp8holxV7/+E5+Ky3lEADtUcOgUlmJ3vZjP1miViqrHvVaVtgbYZWPRU/6gDfne6tZsmd2qOsPwtzY1WWqHSavqy8dIGkBCCRKq1Q02U5oYAuQ+zLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(2616005)(6916009)(66476007)(54906003)(66556008)(66946007)(478600001)(316002)(53546011)(26005)(6512007)(6506007)(5660300002)(8676002)(8936002)(4326008)(2906002)(7416002)(41300700001)(31696002)(86362001)(36756003)(38100700002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFA1Y21tSk0vRk5kNGdkWXUrWmxUak1lWWQvZUdmeVVRQXpXbFFXZ0VQV3ha?=
 =?utf-8?B?TVBtUklRVmdGTE51eWl4Q1pGQzZlckNmT1BwY29Zd28yaDh1YXZCMUEwUVRM?=
 =?utf-8?B?RE53dy9PQnQzVFdiV1NvWnpJMXpJbVNSQWxDY0QyMHRaakNjQ004YVd3MVFY?=
 =?utf-8?B?bUgzcTJvd0FUOHNMT0tqUDhGY2U3dExnYXZEQmppbVNQZ0dCbmI4MlpMUFpS?=
 =?utf-8?B?MCt6MmJ2MDRreXV3bEY4OVl1R2hzS2VoK1M1Y2hia0hxYnEzMGNEWjdkNmxZ?=
 =?utf-8?B?aDR2WUhjUEtOMk1vOU1sOUpIN1YxRzVGVjYwdVRJQW1tcEJKYWVnbXpQNmxB?=
 =?utf-8?B?NW9pcUthUkxRM0Iwb3doejRycW9mdFFqK05vemFOWTZwM2VDVFpnTUxoZFNC?=
 =?utf-8?B?RlRVT1cxS1MyRE5VbmdoWGYxaGs4RnAxc1NoMFZxMVYrYWV6NlpXV0J1MC85?=
 =?utf-8?B?d0R5N3dpaFkyaUdkK1dlR05saEQ2N1QyT0ZmR3FOQjBJKzNEQzN0L2poSnhw?=
 =?utf-8?B?MnlCTDU0dlVFQ2liTFdvcGJqZWFzbUI1NjE1V2liT1d2U1h1ckV3NkR6RWFG?=
 =?utf-8?B?ZFJzdlhBbncwZmtzbk5FMG1xcFZxUmZieUFmM2Z5azg2ZHZUOFpqaHhQbkl6?=
 =?utf-8?B?WG9FeXFhWDlvWjVXU1R0MUYxbEk4SStPWnJZdXZsV2cvak9Zak4yWjBCTDN2?=
 =?utf-8?B?MDFvV1V3ZWt2Yzg3SjFLTW96Y3RtcERaSnVFdDlaNU5QVWdJcTZJNXdpbkFJ?=
 =?utf-8?B?TnZuamdWNDBvemNoK0UrMGhVckdHeXRYeUMvdGF6MnpBaHZFdEZQOE9teHNW?=
 =?utf-8?B?YnNHVWVxQ1NlVGY1NWROVGZYaVlJaHhhSmhRUllYUlEwbVluUWl0NWtoMC9n?=
 =?utf-8?B?a1dTbHdDSkpRR096SE1SMDN2SDJsVmZka0g0bHd3QlB6MGJjOGtxbjZLTTQz?=
 =?utf-8?B?SlFCanlNcGZ6cmU2U3R6cVlCVlorT2daNGZibEp2dTBXRlZrYzJxOEdWNEJH?=
 =?utf-8?B?SFFhQ2JtTzNXQ0NiQ0gvNzZjZ3pxemRESEh4UDg3YStVM0xURXloUytOQ0dT?=
 =?utf-8?B?TStxTHVLNmpGM1dXUTNoRXBjWFdzcWp4VXR0UFJjM3hzNjhMOUJ2Z1R2VkRM?=
 =?utf-8?B?ZnlxOFdzSXZjeGJLQnA5eHJqVllGUnNjNmpDYm1EUkdvajN6amc3SExrbTdN?=
 =?utf-8?B?WGx1a3YvQU43S1RBUVBxaG51TmVySXlQS0VWemsvM0w1UHVBVzVpK2EzUHlp?=
 =?utf-8?B?a2t6YlhpenFGenlWRFR1SHJYZVp2cWtJemZDVVNpbmw4ZDNzOTRKRVlnNnFP?=
 =?utf-8?B?SU9TeGRvVFpKeHJQbzU1N3ZjTThVRm5peit2a09leFNmdUl3QjNxYUs4UkVi?=
 =?utf-8?B?MnIvQmN6TFRYZDZDdUFQMUlQbCtTT3h6ZlZVNE90a0FWU2d0V3RjRFBRblIz?=
 =?utf-8?B?OWdWL0pxN1BvK2FkRVNueG1qczFoTitQWWRhVGgrenlaa0YrKzZJaGNJNGNw?=
 =?utf-8?B?VmRGZk0zWmRuSGxjb0dvUEhIaWd5YlUxVlZZRHpNY0R2Y0tjTUJKeHBneFV4?=
 =?utf-8?B?MDI3d1o5dTI5MmZlL000akVGdm1vZVJEbkxPajVHOWtXdk8xZkZUamdXZ3Qz?=
 =?utf-8?B?c2RDNVczaDg5eTVQN1Jlc2NYcnBiZ0ROUzU5c3dSUlE1NFFCc1RaeWt6Uko4?=
 =?utf-8?B?VG9OcWJ5YkErUTBqTW5YbjFtU1d3MERHdDN4TlRlekFvN1VDVDVaMVZxUU9u?=
 =?utf-8?B?SkUzYWZDQldCUnN5K0FodWlzeUNBRG14NEJmM2s3U3lZZmpQTVhzWXFhejBq?=
 =?utf-8?B?QmhQaGplaFRTblV2WS9XZVliSVVCZ2ZOTktSY1MwRVhKK1lGWENmLy8rZVlV?=
 =?utf-8?B?VGMxazc4YWxvZ3pqTkZiaVFlZG45SzA2OFI3R1JrUHdpOGpUWXYySnBibUFa?=
 =?utf-8?B?cDcvdmE1N0JncHFVRHM3K2hDRnB0L0d6TFRxc3pUSUlyZjBRbVVrdktJdno0?=
 =?utf-8?B?YWRSc3VSZjhCR3EybzRqekJMTmNLUURtN0UxTkxSVFFpODgrWDZML0txR2p2?=
 =?utf-8?B?aW1kQTNoTEVVYkJFeWU2a0pJNFhUTlNxekZBaThEQzNiRGp2cnNibWdUNHVE?=
 =?utf-8?Q?V106pfO+FCoexZzsFcUfguCNu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105e2c1d-8ad8-4b00-8ab7-08dbce4e4c51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:46:28.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVRI+E9UCZr2Kz4jy3F/Rp9Z/gDW47sL7M+0zsQAyF/M8j539HM7aD3HRqvAsfVntLlqFM/XfvAaZrJWwrEAHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9832

On 11.10.2023 18:56, andrew.cooper3@citrix.com wrote:
> On 11/10/2023 8:46 pm, Nicola Vetrini wrote:
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index ee7aed0609d2..1b00e4e3e9b7 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
>>         See automation/eclair_analysis/deviations.ecl for the full explanation.
>>       - Tagged as `safe` for ECLAIR.
>>  
>> +   * - R11.9
>> +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if a type is
>> +       scalar, therefore its usage for this purpose is allowed.
>> +     - Tagged as `deliberate` for ECLAIR.
> 
> Really?
> 
> #define __ACCESS_ONCE(x)
>     (void)(typeof(x))0; /* Scalar typecheck. */
> 
> That's not a pointer.
> 
> If someone were to pass in an x who's type was pointer-to-object, then
> yes it is technically a NULL pointer constant for long enough for the
> build to error out.

Why would it error out? ACCESS_ONCE() on a variable of pointer type is
as okay as one on a variable of (some kind of) integer type. (Sadly the
check as is would even let floating point types pass. At the same time
the check is too strict to allow e.g. single-machine-word struct/union
to also pass.)

Jan

