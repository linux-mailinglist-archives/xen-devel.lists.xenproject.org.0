Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122EB3FD52B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176082.320502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLTx-0000UP-NW; Wed, 01 Sep 2021 08:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176082.320502; Wed, 01 Sep 2021 08:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLTx-0000SD-K6; Wed, 01 Sep 2021 08:20:29 +0000
Received: by outflank-mailman (input) for mailman id 176082;
 Wed, 01 Sep 2021 08:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLLTw-0000S7-0h
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:20:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b44084a-c6c9-4fc4-8545-5cb7d020362e;
 Wed, 01 Sep 2021 08:20:26 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-qajYLHVMMY2npYd-QBHA5Q-1;
 Wed, 01 Sep 2021 10:20:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:20:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 08:20:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0060.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Wed, 1 Sep 2021 08:20:22 +0000
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
X-Inumbo-ID: 5b44084a-c6c9-4fc4-8545-5cb7d020362e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630484425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOlixGbmhdbdoOvOwStsrHan61/add9PscjBGtXzO5k=;
	b=fBOn3XossWF618Z/A3eI6iXX9GTIzaqsLg8Ld/xKY9DtfI/1zHnbgBHRmEpTPaTgdGPr3e
	LhD4dEIh2Hpqsx2SLC3QwFaBEId1v3MfSYhJpEFXavuYG9OUQHapMbkB1y41XAAPvBDsTG
	HE6LZs0e1iNCVWBf55ou28egVO3jYhk=
X-MC-Unique: qajYLHVMMY2npYd-QBHA5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FugZK8BywBKbAYT5Q3bZ5Ri8iaQirK+8uQe3t8N3VNOeFOqtADjqoXBH+M9WiQTumFS1TIBX4aBKbe5FkqYtEC5E/qHQxIqC5eEjihPMqxxWKz3u1h5KncnbL7OJ2uEOplpqbJGCOkO7EimS4dl87E0Enpes9h0RUNtCotPfaNnREXsEPRvHDIZD5dCtaq0Sp/C/1Y5B/rPCq16sdhPzS7P2km1tehtemNYGLZnLQtH8lncvH0zWsSGf3shufHB8QAFbSIUJwgfRY21MwiFV0ZhHlLBhpey7gIvja60ar/hSunzW4ozyfaQ4aj5XTjNt3rYp2k51tVNevwqEta+XUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOlixGbmhdbdoOvOwStsrHan61/add9PscjBGtXzO5k=;
 b=dNTQ3HSHpNyXRfHWrOWk0pbjrUHC+fKOKsnSjYug/vvm3aHYxf/EmHhjT6jk5YWNAPWxLcqzTvos3XpDJ0qyjhpl94L1FyKH1d0y8D5Hqq9kQiF/jcGTtae/7ZV0efvXHm6ggT7e7AmMzrAFnT6fQYehZsSx2QHQNIE3KfgathEbyNmwpRygoUqFyp3CmF/pDRKwuYVVEImeEA2TA/cBZzsOBe4LVcNptZ14/WeAgnteiZaNV+VwZZ4XqEsb0YIeNjTSBK31oYg6uSoRKzRoDhyxROxHPP+dONLCozd736lxMnEfmZ2UdRBQAH8S+BWFS6VROshlSNWZEOvkr7OYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
 <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
 <3a6ca3ac-8771-2a80-285e-701c5c1b8343@gmail.com>
 <956dd02c-553e-6aa2-eedf-28703a6ded32@suse.com>
 <13eb638e-c3c5-6794-c828-04c66bb2bd2f@gmail.com>
 <8295cd88-4e4e-4189-cf27-ce83823357df@suse.com>
 <1f571749-5d41-7c4d-8ca0-afc91d2f83fe@gmail.com>
 <2f81bc05-69e0-f3e7-4a50-67b40352efa6@suse.com>
 <052efde6-bccd-b34c-ccbb-c2cc9f513f56@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b71c0339-e795-94b0-9151-c6840ce847df@suse.com>
Date: Wed, 1 Sep 2021 10:20:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <052efde6-bccd-b34c-ccbb-c2cc9f513f56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0060.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb9d599-0ed8-420a-5456-08d96d2157c1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4943EE608E482ED1289B3573B3CD9@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7hd4cg9hRXEaJJabae8cOR8zgdh5QaVO5snykEusDtvbnpqohPy9UVDWpPk7/AF+U6axjFAc7ix9gpy9xaxZHRL7hWKxVWGoVTfsAI456yLSnCSiEWjxxL5crTkLW6yZWlzj/yfgOmDz/gdF8//R7EDRFn0s5rfWSIxTf4UlKbXAAyHieTFihRT67QVahyOXlHUojCknkZu53rogwPNOWwvpexH5ue6Dhw/yLoJq1vB7Sk35MrHpYD+GC9zBTRWDtdiNsXbYrW2sXHoMhUwCwEeTFO2W8maHGoowMCQQVI/yAeQuVoCUItOiu8w770DBGu6zHpqXzuAd0v//Cs7XcFQSZNexdLU/WggtHgVMzV5Qtk4nH6EMQEmhwAF7j1FXoqBAR3fBR4/1QMRmOVqERU5YRC+tkd+mZFXXZY6hhTzuP/XgxqyqQl6aDdwKyKmtnwBcp/KpeKU7AHMpl9GI1JorGGXqloHuOsXiOBRvD6YQLEmJE+5gLr/5a7SazJcbhbIt4kt8hvr/errsZOdNZSYDdtp23ha1KQSFt5VhT+MLDVwJFBI1GEppk8gwuCsfDKSrnsUghPKyiz9WHkrwbNWvsG1PttHtWPxq7+7/ObRVss1cL8GrchcojHPj++p0m2ACdYGpmdQtFdo1CuLuU2J5MgO2G7rMSBD/uYIEJgg7gK2fVlIBk5acjogl+kM32WTwzDjppvtrUgzQYSHRodZ1qHvmjI8WQPKwXgqLEi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(346002)(376002)(366004)(31686004)(53546011)(66556008)(8676002)(2906002)(16576012)(86362001)(66476007)(4326008)(2616005)(31696002)(36756003)(38100700002)(26005)(956004)(66946007)(5660300002)(8936002)(478600001)(186003)(316002)(15650500001)(54906003)(6916009)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUJ6SEhJcXhHK0VKOUFteHBLa3ZlSTNpZHh2Q05nVlZ4NkZ1VkplMkt6UWtu?=
 =?utf-8?B?bUQ2V3J0eklnSGxsMm55eFRBREVxZWQvdVpUbGYyMkVWd1lnMVZ0ZjVocnBV?=
 =?utf-8?B?Z0drcTkrcFZDbld4dlRScEQ0MXdhUHZRYTNyblI3S2FxR1d1VDFoU2RwT3Av?=
 =?utf-8?B?QjBvazlNMnVIUzc1TFhvd0hPZVlSZVdDTm1UUlFkU0JIbkZMcHQybHBZcHh1?=
 =?utf-8?B?OW12bE1xZWNlV21Yb1hYUVNvdG1XK0NPZGR2TnE5RCtsbHAyNHoyYi84M0o5?=
 =?utf-8?B?VU1HSTdVRFNJdjJQTUZ1Y1F1VE5wN1RJU2ZDc1IxblhWRTJidSthYllQcHB6?=
 =?utf-8?B?Nk9WNTZjbmxSTlBGS0RNc2JINzFjSUs5TGFQMk5vVDZmb3ZwVWRyMmkyNmNQ?=
 =?utf-8?B?TjNtbE11T3J2VEo0azlULzEvUC9QNjlVM0g2TTJ0V01qNGRNT20vUlBFd0JY?=
 =?utf-8?B?VkdJd1JhMzlpM1VRNnBhdGpkYVREcTNMQ21VOFBxTFZ5eitoRGFNWTZxSDJU?=
 =?utf-8?B?UkI5VTRBb3hiSkVXUldQS0hIOTEwZitWQVZPR0RWNFN2dVk2R0UvdENJRTR6?=
 =?utf-8?B?MkRVb0NqWEp1OVQrNE9LalJGWTFtRFVBOWJxMUcySG9IMHk2WWRpMk9EdUwv?=
 =?utf-8?B?eXlwU2FQR01TWU0ySjhYK3Fmd2tiNVd3YVBPSFlIN0VleklQdVZFWHlRa09O?=
 =?utf-8?B?VUgyZ3d1V2U4SzMycnVZM2U0N3dobW9kb3k3M2h4OElLTUMzQ2hudVF6Njdn?=
 =?utf-8?B?eWlUem5ZN05sNTBmdHBUcGdsYjRFMWxoeXpndXFueVlSQTJtMzBWR01sMmlF?=
 =?utf-8?B?OXNNSnVDSVdTYXBCaTJsdkwrNlJ2M2ZtUG1XVEpxbG4yQUdubi9HUS96RFIy?=
 =?utf-8?B?c3NoWXJPMDJjbGFiN2xIS2UxanpPc3k5NU84enR6dEZyRjBsSWw2Z25ySmY0?=
 =?utf-8?B?eWk3YVcrQWVaUVZ5T2ZwOXFnZnRhakdBd0xKcDhXbDdjcWJDT2VzT29qZkJE?=
 =?utf-8?B?cTdXcHBRVHhydGNZelNLb09zY0hYa09sQS9reWJRdWhkZ1BBWmZXcjgzZjhW?=
 =?utf-8?B?Q0NPZ3M1UVB0N2FLYWY5T3RRVjZqQ1J0bjhXVHZMYytOTm03ZXkrK0FRcmQr?=
 =?utf-8?B?NkF6YXJ4bE81aXhlQjBhOFJoS1ZVUTIxSENRZHEyT0FyQzFZVzlVVzZDMS80?=
 =?utf-8?B?MmphdTJYUkx5NW91N1cyTmg5M3VYeVJGMUY1MjZVQlZBcVQ3SzRsbFVsSzBE?=
 =?utf-8?B?d2FmSEd2QW9lRHF3Y3FGUGkzZDc0L2tnV2ZYSzZkajA5SlZMMk05MWFEVk91?=
 =?utf-8?B?YWVsYWZaMGRSVDg4UzdxeUxHN2lvUHhsSUduakhkSTNvYXdZL0oxYnVCdmhT?=
 =?utf-8?B?bUNYWm1ramlWMU1LcXJjZENoTFNvRWV1UVIyTmRXK2VSREZ6alJnT1IvRitS?=
 =?utf-8?B?MmludHJRV01wRS92bThHTElFSkZqUEhNYzBISnllUzgyb3NkYUpXbkYxbUM1?=
 =?utf-8?B?dzNxbE9paXlHa2Z3aG85b0U5dFdaMjFha21obGJaU2tCUHhiUVdGeFhrNm9R?=
 =?utf-8?B?dG9hSUV1Yzlta2FDTk45emtYbmtsVTNrOEZZM0hqc3FyaGFzT3ZSM0dUMHJ3?=
 =?utf-8?B?QnJseWNRdlpTZXlFV0hublczaWEvQWYxd09MWjNPRmtPVHVBRmJYQTJqalBI?=
 =?utf-8?B?TUxJOHlRR0dYSkV6eFRmWnRPSnZ2dEFkZTNXbmNja2d1NlBVN1N5S0loUkN6?=
 =?utf-8?Q?gzAGWXiqfGyiCz+Xj4xgPpXxgW/PpRt9tawvNc5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb9d599-0ed8-420a-5456-08d96d2157c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:20:22.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+/ghNczzfkfYIn82ugKg8uRStfxs23bm7Nc8WfHqbqYWD2lkQ5jwZJFoI6V5NgwP4mZP604IexPctRsDmyL/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

On 01.09.2021 06:50, Oleksandr Andrushchenko wrote:
> On 31.08.21 11:35, Jan Beulich wrote:
>> On 31.08.2021 10:14, Oleksandr Andrushchenko wrote:
>>> On 31.08.21 11:05, Jan Beulich wrote:
>>>> On 31.08.2021 09:56, Oleksandr Andrushchenko wrote:
>>>>> On 31.08.21 10:47, Jan Beulich wrote:
>>>>>> On 31.08.2021 09:06, Oleksandr Andrushchenko wrote:
>>>>>>> On 31.08.21 09:51, Jan Beulich wrote:
>>>>>>>> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>>>>>>>>> On 30.08.21 16:04, Jan Beulich wrote:
>>>>>>>>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>>>>>>>>            * Check for overlaps with other BARs. Note that only BARs that are
>>>>>>>>>>            * currently mapped (enabled) are checked for overlaps.
>>>>>>>>>>            */
>>>>>>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>>>>>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>>>>>>>>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>>>>>>>>> we'll force running the loop for dom_xen which I am not sure is desirable.
>>>>>>>> It is surely not desirable, but it also doesn't happen - see the
>>>>>>>> is_hardware_domain() check further down (keeping context below).
>>>>>>> Right
>>>>>>>>> Another question is why such a hidden device has its pdev->domain not set correctly,
>>>>>>>>> so we need to work this around?
>>>>>>>> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
>>>>>>>> ("PCI: don't allow guest assignment of devices used by Xen")
>>>>>>>> introducing that temporary override. To permit limited
>>>>>>>> visibility to Dom0, these devices still need setting up in the
>>>>>>>> IOMMU for Dom0. Consequently BAR overlap detection also needs
>>>>>>>> to take these into account (i.e. the goal here is not just to
>>>>>>>> prevent triggering the ASSERT() in question).
>>>>>>> So, why don't we set pdev->domain = dom_xen for such devices and call
>>>>>>> modify_bars or something from pci_hide_device for instance (I didn't get too
>>>>>>> much into implementation details though)? If pci_hide_device already handles
>>>>>>> such exceptions, so it should also take care of the correct BAR overlaps etc.
>>>>>> How would it? It runs long before Dom0 gets created, let alone when
>>>>>> Dom0 may make adjustments to the BAR arrangement.
>>>>> So, why don't we call "yet another hide function" while creating Dom0 for that
>>>>> exactly reason, e.g. BAR overlap handling? E.g. make it 2-stage hide for special
>>>>> devices such as console etc.
>>>> This might be an option, but is imo going to result not only in more
>>>> code churn, but also in redundant code. After all what modify_bars()
>>>> needs is the union of BARs from Dom0's and DomXEN's devices.
>>> To me DomXEN here is yet another workaround as strictly speaking
>>> vpci code didn't need and doesn't(?) need it at the moment. Yes, at least on Arm.
>>> So, I do understand why you want it there, but this then does need a very
>>> good description of what is happening and why...
>>>
>>>>>> The temporary overriding of pdev->domain is because other IOMMU code
>>>>>> takes the domain to act upon from that field.
>>>>> So, you mean pdev->domain in that case is pointing to what?
>>>> Did you look at the function I've pointed you at? DomXEN there gets
>>>> temporarily overridden to Dom0.
>>> This looks like yet another workaround to me which is not cute.
>>> So, the overall solution is spread over multiple subsystems, each
>>> introducing something which is hard to follow
>> If you have any better suggestions, I'm all ears. Or feel free to send
>> patches.
> 
> Unfortunately I don't have any. But, could you please at least document a bit
> more what is happening here with DomXEN: either in the commit message or
> in the code itself, so it is easier to understand why vpci has this code at all...

Well, the commit message imo already says what needs saying. I'll extend
the pre-existing code comment, though. But of course the primary purpose
of this RFC is to potentially have a better approach pointed out in the
first place, which I guess will mean to wait with v1 until Roger's return.

Jan


