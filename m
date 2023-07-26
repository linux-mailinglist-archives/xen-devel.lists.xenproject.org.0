Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A7762AF7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 07:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570042.891303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOXSK-000098-VR; Wed, 26 Jul 2023 05:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570042.891303; Wed, 26 Jul 2023 05:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOXSK-00007B-R2; Wed, 26 Jul 2023 05:53:04 +0000
Received: by outflank-mailman (input) for mailman id 570042;
 Wed, 26 Jul 2023 05:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOXSI-000072-Pe
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 05:53:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad9ee7bb-2b78-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 07:53:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 05:52:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 05:52:56 +0000
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
X-Inumbo-ID: ad9ee7bb-2b78-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxNSldRVJi9nkXyvlTADH84U0QjSr4eW0DFLza0l8O9d8+lNjElFa4Z+hfL1ROiFD8ct5QJowmDgZFji+VBoDLE3OSeph1Y0Z0/uCXxve9Tk4TtkDKNCUfnxvRFq6AFd0O0GdKnL7BJYBTBwk/UbKHWoXd9oPe4LcmuXAjUfws8jUAWhdU1xFDGZkSWXNxJ2kAnq8X8niaXnarG/3jLTnQu1V5fyToeI5NDj2hkbPzv4cd95IDJ7OjUcbP2kPFxsxSa0iYcOvFmtTvZA7cPWiXR5PNuS1zvwXn3sGV2kF+D2n4oV2l2k0ITJ2oa02Gode5DvCy5RzaIIFxyWL/tlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS6UQ+TKDV/R5njROLJvzhx0AdGNSS1JKv1CcpTuLz8=;
 b=Z6UC9yt0R9JvmxUmtFv/m+mO/UDdIVQSrr5FAUqFYh4RqEMcLpnMYgZmSJWBhb1O7GiUNuBGa4EzrgKVCtkGQd/ZHAGC8tZTQ0yqnmEgfwnTGjRztNCT2aH63jDlUtGzjmWyESR0v7/laGzaEA2A2z9rxp7j7wrelQX4kYUEsHSdV82YecpybciVjOnoZ3FuEfg7+9c6riaXoc7DjtlJXp7XIeYPp10djqThad7JGKYDWRUs/cmrS1R8Osolz5QdMgBz+m1fg+3a7f74TRy0BCaImyxKVR2Rspttw3kxPJ3uop+yZjmtLOJ85vpsipIjq/tsbFCwzcnOjfIf+PshoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6UQ+TKDV/R5njROLJvzhx0AdGNSS1JKv1CcpTuLz8=;
 b=O/+001xRS4jyYZuRjblPiSN782ihHNpEPXBqFHr6rq1QD+00k5l81RcLzRD8nPgb8UUL1XEh1bsx/cWRq4UrmAWs9t90Zr9uzbViWig6U7/OQNIzJLtACHNfzaKtLXnBBNU76F6dq8qQMIfFotvxKC7b+9U7YggqzFssR7/CIirZ54XtakMo6ECl/EzGa1d06P3j+hU2ngvv7T66FQfrVQF7koxxs1rvGj6zMicKzKRvyMKpqtp8hwn72MPjvLSXz/zTTHtt4Z4yc7BeEm42tuHGya4HUCqOHvlFo+j6g7cLQMbe1EDG1uglF4O74g9YqP3kg2ohCVsYRB7CLuS6fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6cd0c3e2-ecae-971a-5c86-cf408591bee9@suse.com>
Date: Wed, 26 Jul 2023 07:52:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20230725135557.20518-1-jgross@suse.com>
 <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
 <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: cf97cc64-70f5-4f2c-e362-08db8d9c8f92
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4xKC1Z3b9panNnWkt9MY9x48UMTfW7aCg/amIdhOWrYSflXAyG3vCU+pZWdb9hkAlXqyNl0nFtn+FZemPIIvsOGOXIBcBkrD8MUYDaKIckEUCcB/z8AydWpib2vAd9zo/02j+OTlnHPJ29k63Qfdx7hye1z6hsNfEf1DFWefplnjgbGbpahKpCaSOOZPd2ogXSc8o6uMJS++DN2qpE5I2LjG0QM/3x6FyMd+lMz50TNmvk2d8pSqgbMKNuJq73+r50760qZgNIoODJruO3VweStymyBAKKBKGvq27VB4Ek8Jbk58vAWSzL2y/9Fjp9tejnKTE4lJ+Sa5mr1FjgUBM/CtEMFIcBwqA3SGe84SCpDYsE3rcAHsUzaqB6y9pmO7JdSSqxZARywoBkA0x2LTao2MnsQc/K8yKjKANoZmVmbp6QaftqXL4CQc16AWJbt7RCVfT9t8eQv9Y5rYJmUIZcCnT4jwwHSw724Cw8Bm+zUEbXRXWsC4i7aOpIZwBTziJVEd77GNE3XZP7dBVwS3Wu67cG5uvWoq4NbzYgRlcQRpE43YsSMaDNqlyPh3M8YwAuZOcHBOKWEZsS4kfFuZKud6ykQSLGZ9D3ropewPn5xkb8D2adi5MQKkbs9WuSC7vVSWLzwI5kfLmPIUksqsyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(107886003)(186003)(26005)(2616005)(6506007)(53546011)(4326008)(83380400001)(66476007)(8676002)(316002)(6916009)(8936002)(66946007)(66556008)(41300700001)(5660300002)(6512007)(966005)(6486002)(2906002)(478600001)(38100700002)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXdxVUVmMGEvSjBleWhVWTF0ZXdTY2dNK2NTT0owQmtjOGUreXlGTldxRVg4?=
 =?utf-8?B?anJoSEFaWHgwRFQ0RFMyNGVLcVAwRWowNTAvV08zTU93RHVtK1VGRXF1VzFp?=
 =?utf-8?B?WnhvaFBYaVBwc3AxZFBjanNMdTAzNnZzanJTejhMQ0FHVlN4bkFpYkpQb0Ir?=
 =?utf-8?B?UnJ6dEhqUHRPb3lnUGFlbWdMOHRFTTdCdGZFUTMxMnRDL093U25zQWRGOWZx?=
 =?utf-8?B?OWUwQXpkdFBpeXVYU0VtcmNRZzkvZXlQTjdaN2NSN2lkZmJrcFNTU0NvdVpH?=
 =?utf-8?B?VGNrTXgwZ1ZNUXgvU21RQkh5YWZnZnlFc1FndEtDcDBRWkFmT1R4dENndVk0?=
 =?utf-8?B?dVh3ZExla1VGNGNVSWhoZzdBY01jSnI5QjF3UlNIbkxjd3ArbTZZMEJEeWpx?=
 =?utf-8?B?M2J3YUNaTW9TbU1EWmxZa01WNlZHVWZEaFlIUmVnOUdpSnZQN2cyeHhKN3Jv?=
 =?utf-8?B?S0d0MjFoeGF6OEMvM1RYa0pWOTc0MzNhdytJckJZeElLSVptdUlmN2xVZUgy?=
 =?utf-8?B?aERxcER0b1kvN2lXWFlBZjBJcCtzbFBPcnovS0o0VUJBRTZxWXRPSkRtQkV0?=
 =?utf-8?B?bXNyNW1sYWx3dEFFVG1xbkVMS3ErTTJUc0FGcE1PU0FSTHlwc1h5NzN0cmhS?=
 =?utf-8?B?dTNzNWpQM1pnclA4a3R4aVdocVppbC9GMTFrR1oyaVpnaVNFeloraU1KTW1o?=
 =?utf-8?B?N1I5S21xY2diaDFaVzlCd3R0QnlIbjBHb3VYdElINE00Rjk1WWxpL2hRdDE2?=
 =?utf-8?B?ejFYWlUyZHU2V0lTeGxsekx4ZXA0bU5weW5hb0g4WUI0RE95RGlaVUU2U3gx?=
 =?utf-8?B?Vldza0VDQ1lsNXdhUFFXUkJGMXdMaXNOUE1yYUQ1bnFrS0FVblNxZ05xSnZF?=
 =?utf-8?B?bm94ekZ6ZUhqelEwWVgrRXg1eHZDbXcwMEdPTkxYbklnaGhwdUExSTlmNVNE?=
 =?utf-8?B?NWM3YW5LWDg4UWZFYm02TmpRdk9mQldxRmlLelJsbEtFWjNvUWtNd2ptOWdF?=
 =?utf-8?B?UzNsNGV0dUFGVDBQTWt6OW1Od2EvSlI5dnl0WmFxUitDbVA3ai9Lam5helZw?=
 =?utf-8?B?ZFEvcUdyeVBlYUd1akhzOXdNK1pXSEZXR2pPK2E4VlRON1N1SnFaWXN5ZHBR?=
 =?utf-8?B?WkZMaExQbkEraFNaRUFaY3gzYjZTVnIyekxZeU9EUEhDSjVBRkpjNFh4MUc2?=
 =?utf-8?B?dnNOS25EMGdQM2FUdFFuY0Y2ZGErM2laeXRtM1BwVzlreXkyTTZja0xCRWlG?=
 =?utf-8?B?VlhBTXljSWorVzRLWUxJQjlwZ3FyUzUyVGh3N1RoYURKSy9RWU9FVlloL3lz?=
 =?utf-8?B?cTkveGhQSWZHbllZdXVDTGwzRW1rbzFyU0pHZjkzNmxPSkw2YmtGNld0K3Vr?=
 =?utf-8?B?eUM5djFFMThBbFU0Nnhqb1plM2pDcXNCRkhQcFhVZW1MRFFXb3RGR04xTW4v?=
 =?utf-8?B?Wmk1ak4yWWVjVUtKc0h2TlkrbjVLTDVBdHMrWWo0RGJHRWN5SytYTFBpZHNT?=
 =?utf-8?B?UC9qN1BMR1N0dDhXZCtWUS9iWlFSV2FaK241NGFnMi9ZMzNsZGpJbXQvYWx3?=
 =?utf-8?B?bWg4VW15aEhmWGk5QTFJb053a0l1UThRRkh3OE9ReVRsY3FwcVovWW42N2U5?=
 =?utf-8?B?Umt6VEFWTFBHaS9TQmYzMzc4bSt2Z2o2ZlZNLzlneDNaa1MwM21nL1FKMmN0?=
 =?utf-8?B?QTk5ckNmKzFINFhienFjWG5pSlpuQ3QvNGlGei9zRG5RR1hjeE5QaytKL2ZB?=
 =?utf-8?B?L2kxKzNXeUZIVCs3dCtjVll0all6Z01vK1NvK0kvZXByOFkzN2tXd0NTbDcy?=
 =?utf-8?B?eVJ3alFySXNXOWF6ZnpWd2VoejlBazFuSGIvTmlhMDhsVlRrbGVaa2IxTG4y?=
 =?utf-8?B?WXVQNmRzd25LMmlYQ2hqZXZtdkNqWWd3NTlQenpKSUdXejYvMjdZN0Nvc0Nv?=
 =?utf-8?B?eGVnbElUUDdlU1pRTWRRN3gzYjhBOUxvcTFIYWQrYnlyWXVXTFdlMXJscytk?=
 =?utf-8?B?cWlhSjB4RitqSW80ZEFxcnd1em8yajhaSm1YaDBpVEY0OWFMaHNSOEVIVWNH?=
 =?utf-8?B?TUcwdm9LWmFDZUVwTERMNjZ3eFArTGFkd0xkRWxJRGRHK1pTQ0poa1habWRY?=
 =?utf-8?Q?5GCwJP5ZES79HH70LSDx0kaRN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf97cc64-70f5-4f2c-e362-08db8d9c8f92
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 05:52:56.7980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhECBqxdr8QsktLwS6VJucgCkEVWWUey5/4ezxEMoGq+LmihPBHSdOGdUpdMW+brGzxzL+XjtfZ3u/3VFyXUAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7071

On 25.07.2023 18:59, Andrew Cooper wrote:
> On 25/07/2023 5:16 pm, Jan Beulich wrote:
>> On 25.07.2023 15:55, Juergen Gross wrote:
>>> Flexible arrays in public headers can be problematic with some
>>> compilers.
>>>
>>> Replace them with arr[XEN_FLEX_ARRAY_DIM] in order to avoid compilation
>>> errors.
>>>
>>> This includes arrays defined as "arr[1]", as seen with a recent Linux
>>> kernel [1].
>>>
>>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> I think we need to be careful here: What if someone somewhere applies
>> sizeof() to any of the types you alter?
> 
> Then the code was most likely wrong already.

That's possible to judge only when seeing the code in question.

>>  The resulting value would
>> change with the changes you propose, which we cannot allow to happen
>> in a stable interface. Therefore imo it can only be an opt-in feature
>> to have these arrays no longer be one-element ones.
> 
> I don't consider this an issue.
> 
> If people take an update to the headers and their code stops compiling,
> then of course they fix the compilation issue.  That's normal.

The code may continue to compile fine, and even appear to work initially.

> It's unreasonable to take opt-in features to a set of headers intended
> to be vendored in the first place, to work around a corner case that's
> likely buggy already.

The original intention clearly was to allow use of these headers as is.
Anyway, I've voiced my view, yet if there are enough people agreeing
with you, then so be it.

Jan

