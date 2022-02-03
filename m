Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8D74A834F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 12:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264644.457802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFacN-0006tF-O1; Thu, 03 Feb 2022 11:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264644.457802; Thu, 03 Feb 2022 11:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFacN-0006r4-Kh; Thu, 03 Feb 2022 11:49:39 +0000
Received: by outflank-mailman (input) for mailman id 264644;
 Thu, 03 Feb 2022 11:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFacN-0006qy-55
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 11:49:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d03c9ea-84e7-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 12:49:37 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-KPQz_b0_OaucMiZwYjhr_g-1; Thu, 03 Feb 2022 12:49:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 11:49:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 11:49:32 +0000
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
X-Inumbo-ID: 5d03c9ea-84e7-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643888977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYMDiNNJZEYIZtAM370eRo8i7YpH9n8Y7m1ru+rugHk=;
	b=h2TR21nlshy1Qjm6yiC9f9SNGymFkjMZmYTk9WWssEUtCR7cXNriWR1ncLNVBBfV2pTzmR
	jpXOxaye/yfZ5f3VgyHIbgl2CF49P/ucuM3Bg4ZM+M4nCovk9GfSkmXWtIc6D18jyIcsdi
	udYN0ZeSrCmGFqRC3fvYYXy6MsBvDSk=
X-MC-Unique: KPQz_b0_OaucMiZwYjhr_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc96rDDx0FvNgNP5iVeWxlAp/ZOVfKSZifXgcqNV/7PU3/H2ELAdJEMf7cOQU5zGrK0u737Y0FblEDofH70bGeuVjagK6gKCSWaaeybvM22eLOX2f8rTQsg22CDIdE5tjhUiW73HGeQ+XzZdczUSmI6St9g+YtX4cl58MhK2aU60awSgD1bprT8WhZkeRJEHUmABJq4rxNJ2RliTdqeXWWIXMlvxGh+Zmqa5BJf29WvWwga3ACLyA8dz8GqGOj0GgKktBty0tDsd9SSiTuSfwZOuqD/YI3Cs0JhJsRvmNET5u1svxTOWAVdSR97vVxVAywlSdqeaL5Ji6WkF8qqzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYMDiNNJZEYIZtAM370eRo8i7YpH9n8Y7m1ru+rugHk=;
 b=N7FgROfKy/cYca8sXsIe5S4p3/bcbGzZtgBCh+rrbr3CLpqCMOGdwrQHP/cyOHIus0EGNYpJaY7baOUaP8dlawUq0PiovId14uLxqasdz95XtGwBzxOayfIhB7aMK82NXD2D5NRsKbnUzrdUEl8DDxwGm3eV3ajLcQddavU3HvH8OYSd6R0yASrMMEVNXWmeLhtM2sKMCmUfOiomN9f885nUmltKwo0AgyFN7fwyebkQqzx/57WqM/tqXkYlm3XabVYT1gpDPWfV830at2nlXPdznrsZl/AWrJTBATnm4f21VECF3Q3/TreZiJxMsydAuXVb5Z/EWWB5TB/IDNsSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f491b77f-a0c2-09fe-7c7e-939f9a3210a6@suse.com>
Date: Thu, 3 Feb 2022 12:49:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] docs: document patch rules
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220202114448.8608-1-jgross@suse.com>
 <efe591ea-36c9-0ead-727f-600ae3c5ed05@suse.com>
 <42d7815f-aa16-d6e3-8e9f-379f678a1387@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <42d7815f-aa16-d6e3-8e9f-379f678a1387@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0054.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d07225d7-df54-4ed6-a92f-08d9e70b3dec
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3355:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB335561D37EA506C41A6BD2E7B3289@HE1PR0402MB3355.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	itRFBP6iFkKhLbfdmD3YwzuwiePlbxyYfRo4LoT8XG1iqZJ27/ncFsMHlKU7Z5SyYNzftBFg15OShw+jzxHM13mvSyz6t7Nb3svdvWB8JhHWthnAAm1gWDo9seknOMs1hPklKL0n/6r1AUAQTthg0S3c/Achjg4xhTJuVijJ6ZSA8ShuFIKy3y7r1qRfQTF9xGI6Naocq0qQ1vlGeTVBYGWBHZ4G+e7cGqm8gjqA/EBhyVH8HQnJ+bRzFie5FvZ6frcqY8Bst1Tvsa0zjfAz8PkXkXyo+oNeNJP9WHe7uqbiz0BuOKzeyz8ezCtHDB540sWEMGnYcm14XhJpD3s/tSRiwjswJG7/bo8ymSgf/ovNmz1msiKGOyoprx54/K7olfbvy5q5xo5OHR+RiMMGR1xrkoNbBIEVWL1A/aD0HYVjaaiFqFM7Hgk0rdcUnwl7glGChUG57LgVms7qgQN8HHi7EOaIhEcnaIXIzc7U0E1vZQj3b5Lwl3qCWU6QfDWBhfEz4LOkpkTlYboTCclRiUeor831wO1shZtWlq8laBbGAhBOmXjQLsvAUJIojDlwoqfvmRHI+5qU4QvVOZ1Wmx+YH6Uiq8kLrAPnGCZ9eTthSx+taJICHxT5CWusSPCSveC4uloRgvqbpIgkT76XjOIoQE3AayiCBeaYWj8EZja1UVy1XE+SKCKQ7JVgoOBrGWcFoCfU1q2bLx/CNkafdPzBSf3mowd4k708C1ZT+c7ThNTdauEmHW2yQMLOSOew
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(2616005)(54906003)(38100700002)(2906002)(186003)(37006003)(6636002)(86362001)(31696002)(26005)(5660300002)(66556008)(66476007)(508600001)(66946007)(6512007)(6666004)(53546011)(6506007)(36756003)(8936002)(31686004)(316002)(8676002)(6862004)(4326008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEphcDVzbStITHNpMXEzMThCS2luMjdxVTZWTVV5N0dwRHA1OXdjNitzWHpN?=
 =?utf-8?B?VEZ4RVFjblRCanlnS3hZdFVMeFc4cUNRUkhWZjBDbzZLSmJJMDViN2d1Risx?=
 =?utf-8?B?NnB0b0FxbjdYMy9rbUVJQzU4UG9XbFhBcXhlTEhyS2JiMWR4UWV4dFRCN1cr?=
 =?utf-8?B?ZzgyUlJhYVVCRCtrTE91azlHc0ZCakt4bUY2d2ZDM3BpYmZjS3dmOTJ0aWZ3?=
 =?utf-8?B?TUltT1pqTVNWZEl3ZERZTENHLzRnWkt1V3VEUkhtL2ZFdzgvRGswOUpkTWg2?=
 =?utf-8?B?L292N1dsVEtSS2xTZCs2ZTFpMkVHOHlRaVFNUldDQ2VEUlh0YXV5QzRNcS9t?=
 =?utf-8?B?UitZRkR5Q1VtNnJZSVVjR0ltdW1hNmdyZTNhejNwVnFycG5vS1pGelNSaVBH?=
 =?utf-8?B?dlhjdlpKTnBEc3ZjeXhockl2cVVjNG5WdVJaRUpwRHpJUzkzdFFLMEwrY0du?=
 =?utf-8?B?SWl2RXJrNnkvbFk2RkJnSlVud0NNVVNCVnBQaHN6MEdGcE9zNUNuSSs4S3Bp?=
 =?utf-8?B?T2k3RjcyOVZqU2JsOVlRaEMwMk93T3BaZWFDbEIzUW42dEcxQlliUm51UGNm?=
 =?utf-8?B?ODJ4aGZjRGJJNmU0OFByK2lQWlpvTmQrREJlckJJeGxXcXJTWWRabk5BaERv?=
 =?utf-8?B?YkNhNVN2NEN0QVJNVmpwR0NQS0NLcUIwM0dnclFRWmxHRkdnMkNXRGxSeFdT?=
 =?utf-8?B?eTcrdVlaTEFEWkp2RFp4dDdPbU5Va2xkNVN0R250L2w1NThLNk0rZUdkMnRv?=
 =?utf-8?B?Y2k2L05HeDZ5ZU5ZblJjQzB4VjhXNzJrbTlMVkRGSUZHcGVhaElaWlNOeU1D?=
 =?utf-8?B?eXR3WVNYQXBCOHV6aEZPV3V1RkZ5VkluTzk5RGpBbDhSLzZOMzBjRjI1blky?=
 =?utf-8?B?WTlHRDlQSmFENEtxVG5sYnk4WmRZVzNZdG9OdER4U2pXbXhhUVlyTnYraW83?=
 =?utf-8?B?blYxNkdVZ1BoVlJqM1dwelhtSDlmMk1UVVdpUFl5S2RFODA4TUNsTFhja0RZ?=
 =?utf-8?B?N3F1ajMvNU0yVnI4VmJ2TGVVM1dBekE1YmhGbDZzeXRYcndMZzc3QnBuTzdr?=
 =?utf-8?B?aFYvTE5wUVptbUpncTVXNjRpd3p4bGZjRFI3cloxTmdLVmhqUWJLQThOZk5y?=
 =?utf-8?B?VkhtV3pTdzhFWUMwUGV2K2xlendsZ3FFTjFIRkswRHY5eDhML0Z5QndIN0pN?=
 =?utf-8?B?dTBQS3hIRHZ0NURhMkdyQS9LRlVCeVBuUlhtZFEwVTNwSDdmUnlIRmx6QU9i?=
 =?utf-8?B?SXNiVzI4bGcwMDM2ZUZOT0NVMEtodlBVTnE5anNUNVgxOXh5dkg1VHp2V0Nx?=
 =?utf-8?B?VEcwZmkwY2lOdmJNSkNabDRVQkZIT0Zqd2g4UVE5cmFFdElWT1FFSVIwVmJF?=
 =?utf-8?B?K08xaHViRkk5eU5pSEhkUUxDZVF0aVNRVXc5dnp6UjJoUVhEQkJxSmtuVi9X?=
 =?utf-8?B?SHRteGUwN3BNdGVwM2g5SWRKN080UEw4OGN0elAycWJQekI1K3ZUMWJ3cGlC?=
 =?utf-8?B?SFgyOXhQUjBSdENHU1E2VG12ZFlLY2E0K1Q0cy8wVVZ0NW84d2VjbkY1UzlR?=
 =?utf-8?B?MW1uQnR2d3VCcDgySnF0NXJ3SU9IMHhGZkFsT3pYa0RWS0VaSnc2NzNaOExR?=
 =?utf-8?B?QkF2YnU4YzlNRENHNG4yQUViajI4eVlkUHlIMmQyZi9OZGphNnJoVkxCZ3ZN?=
 =?utf-8?B?b3dYSWJZdklGSGdBTWVoMU9zUlRMYzVQYU02Nmc3NTF4clBuSjdlTGozUnZL?=
 =?utf-8?B?TWU3akFYL2Q2Ris2ZlNwVXRGQm1XaFR0ZWJDQ2RrNXpJL1FXSzBrbUluQllK?=
 =?utf-8?B?T2tYOU4wekNSdm50V3hDVUNMbE1VcUlRTXVFS1ZncEc4V0dOVldZL0docTZW?=
 =?utf-8?B?bzl4d0VES1JPZGo2RDJqVXkxTmpEaTJiK2Q0b0FNelYrSUYvRVB1UkZMYTNR?=
 =?utf-8?B?b0t6MXBkeDVkKzNHKzYzcU8rZFQxQ0xpYnhDcVhvaWV2WXgzTHloYnVEWWNR?=
 =?utf-8?B?bC9VNHNYMjJ4TWJLMHFSbDdvWlUrM3VSbVU5eUdGdittQmptdWNmY2R1Ui81?=
 =?utf-8?B?WFh5OERGcVdnL0FhMmdrbG9QNzYxUVNvdlBmZGlWdjFFSEtSSEhUQ0JVbEFa?=
 =?utf-8?B?VHVNSm56aEVHM3NhWTVuamw4eXpOL3VXbEZ4VENkQmRvZEYvejBpZmdMSGUw?=
 =?utf-8?Q?PKBAjOmUimkncbgA4BdQvsI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07225d7-df54-4ed6-a92f-08d9e70b3dec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 11:49:32.0930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pGxF+XqrMh434s17/M7zY8a0mJLE+9C/yHE+WjpIDdU8cMf15eMgogYxvP19Nkpdvtdj25ulfR2jE3gWyMVKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3355

On 03.02.2022 11:31, Juergen Gross wrote:
> On 03.02.22 11:07, Jan Beulich wrote:
>> On 02.02.2022 12:44, Juergen Gross wrote:
>>> +## The commit message
>>> +
>>> +The commit message is free text describing *why* the patch is done and
>>> +*how* the goal of the patch is achieved. A good commit message will describe
>>> +the current situation, the desired goal, and the way this goal is being
>>> +achieved. Parts of that can be omitted in obvious cases.
>>> +
>>> +In case additional changes are done in the patch (like e.g. cleanups), those
>>> +should be mentioned.
>>> +
>>> +When referencing other patches (e.g. `patch xy introduced a bug ...`) those
>>> +patches should be referenced via their commit id (at least 12 digits) and the
>>> +patch subject:
>>> +
>>> +    Commit 67d01cdb5518 ("x86: infrastructure to allow converting certain
>>> +    indirect calls to direct ones") introduced a bug ...
>>
>> I think this should have a reference to the Fixes: tag, as generally it
>> makes the text less convoluted if it references such a tag rather than
>> spelling out hash and title a 2nd time.
> 
> I think this depends on the use case. If the cited patch is in the
> Fixes: tag I agree. Sometimes a patch is cited for other reasons, e.g.
> when adding a fix similar to the one in the cited patch. I always like
> to have the commit id in such a case.
> 
> Are you fine with me rephrasing the text to:
> 
> When referencing other patches (e.g. `similar to patch xy ...`) those
> patches should be referenced via their commit id (at least 12 digits)
> and the patch subject, if the very same patch isn't referenced by the
> `Fixes:` tag, too:

Sounds good to me.

>>> +### Reviewed-by:
>>> +
>>> +A `Reviewed-by:` tag can only be given by a reviewer of the patch. With
>>> +responding to a sent patch adding the `Reviewed-by:` tag the reviewer
>>> +(which can be anybody) confirms to have looked thoroughly at the patch and
>>> +didn't find any issue (being it technical, legal or formal ones). If the
>>> +review is covering only some parts of the patch, those parts can optionally
>>> +be specified (multiple areas can be covered with multiple `Reviewed-by:`
>>> +tags).
>>
>> I'd prefer if the comma separated form was also explicitly mentioned
>> (and hence permitted) here. I'd even go as far as suggesting that this
>> should be the preferred form as long as line length constraints permit.
> 
> OTOH this will make automated parsing harder.
> 
> I'm open for both variants, just wanted to mention why I've chosen the
> multiline form initially.

Unless commas are expected to be part of such "identifiers", I don't think
I see how parsing would become meaningfully harder. When the email address
is wanted, parsing would strip # and everything following anyway.

Jan


