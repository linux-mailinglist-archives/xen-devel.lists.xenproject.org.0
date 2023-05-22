Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C870B8D4
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 11:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537827.837375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11lH-0003if-6m; Mon, 22 May 2023 09:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537827.837375; Mon, 22 May 2023 09:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11lH-0003fh-3n; Mon, 22 May 2023 09:23:27 +0000
Received: by outflank-mailman (input) for mailman id 537827;
 Mon, 22 May 2023 09:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q11lF-0003fa-3W
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 09:23:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cbc4857-f882-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 11:23:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9408.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 09:23:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 09:23:21 +0000
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
X-Inumbo-ID: 4cbc4857-f882-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxioQ/An6iRYnTi0j60hxS12Xgko55OWSknr2PlVJhk0/74VS2pGeKg2+HOn1Gc72C9TG3k9nXI4VR+U3tNyjy2oF/3WNbkvwO3IOzK+edgXQLbJlpEC96d7HxfaRkAaVJPxoTn0vSRp8QlvVLyMiKuvuDghjTEmFwair9ydwKuym2PWVNPnkBSg3/3Ctwfk8McJttN/1eqQ9l2mB0O3HQcmGd+yNyU28sSe8iH273OW0zE2G/0AfwYTnAZND9PC35M8rI4WisGS40c7MT7uz3PDNZp6VG7HT9lah73xQTAeupk184iYnpJ5FyNVuIigYapFkCCtg58xBhh+Pxnb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0RQAM99YhPXWe6dTITvTbitjWSiSjqtTMVsef9V3/k=;
 b=Q/8gKIh6Qn59Rl1edNtbPKzfIg73xr6kMJ5J7vNWcr7pn+HC5zTxJ9i4lanbVObd4ar14KlT0QcqZMLScNFpDqzB+mCQowC2bjC+RPeB/D483OGRkwNZgkm2eeQOsWoNvU8JNsBkJp3stcUwQ+43bRUbjktm9a1xhncMAp+eXnFZRD5QMN199pqqp3PcyK/awPW0EVZaaZSXkhIRAroIXnXZcHYev6e5w+NunRrBxHHP5iqJFsI/1fwj3fcTsZ/gAsqv/amvHz5uSsVPFiSyKYtiQyDkHXY5QBZVAGQVUv9t+YrBHCFxtcuC1kHL1iY9OlbTF8h+x4pz9PNNAi82TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0RQAM99YhPXWe6dTITvTbitjWSiSjqtTMVsef9V3/k=;
 b=4Q7rWGmDtuSGjKU/UzM/EW3vjUbcexSbUJ/BPz270ouSQCXZzP5iNCdmCXIgDTHfdI6MSluUvU2Rc5bOzeA6rdieXHvtcBsX8oT4d2K204tDLZgNuQh80CwXowFW3u9JcgsCBaIwMCRUFHMBJPK5FSGa0knXPXWL17cRzCxc3NRMd85Xnaty81XGHWSctuM2ditrHnaKcHUArhrnswKW3/oJ5wNek1V6zSZXPZwejQcMXP3veGT0s+4rnrdvU2gKmF9TezaVJ/IJ23gv6Ft3XCkmwOh+/nsXVRzj2XQuLrc/MkFKBjWu03bSPdvizunb8yZWkV8oRrRDhWrJ7J/39Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a8c30bd-ebe7-3800-37ae-9e3e6c37a7d0@suse.com>
Date: Mon, 22 May 2023 11:23:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] maintainers: add regex matching for xsm
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230519114824.12482-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230519114824.12482-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 39de45e6-b1fd-4e99-bbe1-08db5aa62fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XnaLCJbcbySk0WR4b4LG29OQ1851JhV2JunxODOZyMpc2WvOGihTUOf2QOY+tS4RazYt0x/3QoYoWFddPWzdixgf1vPecbByZfvwHkXF5SCYR14+gFuSXbWOAp3GVOZCpxHsYUkW1fEm9NP+dKBrzBaeIlai0HOwWXuEgWfLECNF7LfzhLkLxHuaLJF5hEPwT5QT2gV0kAeFTTquqHRg0PrYHhUr6zfIMGyuYZQ0A83+rWbkonqNw/p4P8wJ1VTNQ06NiZuBbdSJ8Jw8pw8mNiKDHJKlk64OJy2cyoInkSPLcgdcj+k0H6FD0yRMMwOO4wXVgooWyFbsFk7ZkJy0oJEjuQ6rQxCz6LbMBqyavPgbCOMi2lbTZkHU5LRcPu51YuFPEloEDV9vk54tjwUrUVk59euovk/2EboNQBCTIedBhRQZk2h3bsuXWWUklQrwk4Ts7tVgvs3MWXjeYGfzsp4FmE3oy4M38dQb/YcJ+lMk+IA0iRUmMquvxYE2FKYVTS3tEIy2wa6+nBPpN76rLoy+LgyOtbKRKTh1uimkhRBkCPL+KjHOfFS878I/7wKNjT01yO1gIWKePe4nESyogaLF5IJmqQ4FhzRttn9VkljJsivDHiyhsSgXXZ++IzLfym06P8MCrjJLTnidZPt7Nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(31686004)(2906002)(5660300002)(83380400001)(8676002)(8936002)(41300700001)(66556008)(66946007)(4326008)(54906003)(66476007)(6916009)(316002)(36756003)(6486002)(478600001)(2616005)(6512007)(6506007)(26005)(31696002)(86362001)(186003)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW5Hd1ZDY3JQSTRMYzlKQm12R2ZZUmozbHVHUVcva3FlWnFIUk5jbzFRQXc2?=
 =?utf-8?B?bjB2NmlmZmJUTEJZdC9vQkVFeWRveXhBMGhSdFJpWUFvcVZoWnphbVVOV0hq?=
 =?utf-8?B?VUs3VzRMMElFOFl3SFhTYTIwU2lCaS9zbFFGQzNJR3lwbVU1V3A0WDhabWN4?=
 =?utf-8?B?UzFlZTlza2xUSXFoOUdReTFCdkFrV1RlMFNuL3RrZWNuRWlqU1E1MjhoRjhl?=
 =?utf-8?B?KyttdGV2S3ZtWWdaMUpiRWw4R0oxWHkyN2VkalN2aFlydnlmZ0h6bTJkbEFa?=
 =?utf-8?B?OWdmN3lrYmM2bUZ1djZBRnhlZzNFaCt1ZFJFWlpTVmQ1VFFwalk5b1VvSnRQ?=
 =?utf-8?B?NFRZN1cyWTZ6V3JKUzFZWm4zVi96OE1EbnFlOElvRmswKytEUXFMMVVOUmpP?=
 =?utf-8?B?SElnZjZ4aFZ6aEhMMjE1RysrRTE2alptRlRzSGZsWFR3b2FkOCtrMWt2ejlz?=
 =?utf-8?B?SHdSbWl5OGRWQ3pxWXFzeVp6UUIyN3JFMDRsQld2eGVxaGtmaFQ3Q013NWZn?=
 =?utf-8?B?bkJZS0I3SzkyYUtqYmVQeWRIcThEczNKdTduR1NpV2E5dHJTWUZ6aDRnU3hH?=
 =?utf-8?B?T2Q3aHJ1MldYdlVnTTlWQkJrMWYwN3VHYnZ0WXlLcEplZ1FhOVZOamlNNkpK?=
 =?utf-8?B?TUxQT0NmdFRZODA3cEJ2aEliQ1VML0RyajBzb3lWNllEVHFFQ3NiQ09oeklu?=
 =?utf-8?B?NjhJMHlUK3liTmhxQ2E3TEh1YWVMNUticEZRMlZ2R21YcTdhYkdaVHI1Uncw?=
 =?utf-8?B?VjFXR2F6WXJWcGNnU1dCSmxjbjIwc2hRS3g3QnZhaUZZbmxBODRkYXQ3THFW?=
 =?utf-8?B?dmp0bDNEVHZWK1p1VFhBTTdZTFN6NzBEc2srd2ZNbENiT3Y5d2VhZnRXS08z?=
 =?utf-8?B?WkpWVG8yVnlCcmFCSjk4NnF4R3VwS1l3amswYlJzaHN6cCszelowbUFFUDZ2?=
 =?utf-8?B?SGJ1QVdoVVV0YVUvci9tY2NIdnpaT3pJWTZTbWpKelB6VFBUZkl5amJORjlN?=
 =?utf-8?B?OFlRaExTa2pEemJKaW9RRUtTRVVvN2E1Y3Q1U1pFUEdRSVFySlNmNCtwdXha?=
 =?utf-8?B?eHlveTQvQmwxQjZYR3FERnp5ZllnNVllekN5VGlIMGNLT3JuT2wvVXpUNXlt?=
 =?utf-8?B?QmZCV1NtaHd2VkpmYW9lMXhOR1ZxUmZXbFFCdXNOQU5JOHJqR0tuaHJLeHZB?=
 =?utf-8?B?THJYV3dqS3I0ZTd1RDgxcXBSaFBpVG44aXhhYkJFMmN1UVExYTFvVTR4Zm9W?=
 =?utf-8?B?TzBVbkhaeDJzR2xUYXJRcGR5RGtrajYwZTJBb1Z6a0k5YWlzOWVnZG5XU3Q5?=
 =?utf-8?B?OEFZZkFkcmRINDRxSGlpSytLOWd6NzZ3K2xxVjRud25DUUIwVUt2bzl4NTkx?=
 =?utf-8?B?d3BtSlhIaks1Kzc0amNLeGVwd1pHaUpWNFByL1BhQm54bkxKK3JVcWw3QXgx?=
 =?utf-8?B?TGNpeWZqaUFiRGFYeUJUTHNaUGZrSHpVUFZvMVEwWGZuUmFTdGs3b05ZQ3FT?=
 =?utf-8?B?cUtTN1NEWms1Y1JOUlV6ZTRWazhjNTV3UnhHR1VYNEpuTm55RU1YSFFlVEFF?=
 =?utf-8?B?b3c5UnZ3eURpK1RZUlZQUG0xVW9hTmk5ZGNoa1hFd3p0a2VKRDBEOTRHWmdU?=
 =?utf-8?B?MkRVUDJwRDV0Q0svc3hpcXRtRVc3NGlNQUNweVIvS29MejNJVU5IQml3MEM0?=
 =?utf-8?B?cVNhYXNIVHBuQmdkMlViRE4veSs4Sk1lMjQxY3hGTEx3LzB0S0sveTZCYjBv?=
 =?utf-8?B?QzhhM21kUEpDTU1HU1J0N3hwbzRKR0NiOUtaQzJXTS85aWN2dVovY21oOHVK?=
 =?utf-8?B?Y1daa21GZHJ1SDFjeE1UbndjdlArYlhDLytxNHB5Rks1VThkc1ZNVkpadUV2?=
 =?utf-8?B?bkdROUpWSUQzc0VlY0o4SzUvNE9YU1dxeDlrbElCV2tXSWIvVitIYjFvZXUr?=
 =?utf-8?B?MUJsVHl5UnpGUU5TM3JDOU5QNFA5ZEUzUk90UzZzV1c0S00xeVorQitWN3p3?=
 =?utf-8?B?aEU3SXpxS0Frc3laSE9QNktEbjlTZkk4NmFRb2JsdWh1RFhGaUkwR3d2Tldq?=
 =?utf-8?B?QTFrTzRvUUJRMTA3ME54TlR5clR0Y2pBbVR0RWF1OHpLcHBuQTlNWWpUaEtJ?=
 =?utf-8?Q?aQ0mD/EPEUj3pPJaSWc1mKmmB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39de45e6-b1fd-4e99-bbe1-08db5aa62fc1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 09:23:21.8207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsdbKpJtDpqniocyx3YCx2UE6Fe9aNpory+BsDn4HfvltFrEcSmoqU1TIB42sAnAKlVgVa7d9KCq0mZN0yOcRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9408

On 19.05.2023 13:48, Daniel P. Smith wrote:
> XSM is a subsystem where it is equally important of how and where its hooks are
> called as is the implementation of the hooks. The people best suited for
> evaluating the how and where are the XSM maintainers and reviewers. This
> creates a challenge as the hooks are used throughout the hypervisor for which
> the XSM maintainers and reviewers are not, and should not be, a reviewer for
> each of these subsystems in the MAINTAINERS file. Though the MAINTAINERS file
> does support the use of regex matches, 'K' identifier, that are applied to both
> the commit message and the commit delta. Adding the 'K' identifier will declare
> that any patch relating to XSM require the input from the XSM maintainers and
> reviewers. For those that use the get_maintianers script, the 'K' identifier
> will automatically add the XSM maintainers and reviewers.

With, aiui, a fair chance of false positives when e.g. XSM hook invocations
are only in patch context. Much like ...

> Any one not using
> get_maintainers, it will be their responsibility to ensure that if their work
> touches and XSM hook, to ensure the XSM maintainers and reviewers are copied.

... manual intervention is needed in the case of not using the script, I
think people should also be at least asked to see about avoiding stray Cc-s
in that case. Unless of course I'm misreading get_maintainers.pl (my Perl
isn't really great) or the script would be adjusted to only look at added/
removed lines (albeit even that would leave a certain risk of false
positives).

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -674,6 +674,8 @@ F:	tools/flask/
>  F:	xen/include/xsm/
>  F:	xen/xsm/
>  F:	docs/misc/xsm-flask.txt
> +K:  xsm_.*
> +K:  \b(xsm|XSM)\b

Nit: Please make padding match that of adjacent lines.

Jan

