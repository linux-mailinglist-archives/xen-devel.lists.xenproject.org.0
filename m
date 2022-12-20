Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9B652517
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 18:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467231.726265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7g03-00076P-0i; Tue, 20 Dec 2022 17:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467231.726265; Tue, 20 Dec 2022 17:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7g02-000743-UK; Tue, 20 Dec 2022 17:01:54 +0000
Received: by outflank-mailman (input) for mailman id 467231;
 Tue, 20 Dec 2022 17:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7g01-00073x-V8
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 17:01:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2051.outbound.protection.outlook.com [40.107.8.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 001d5f94-8088-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 18:01:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 17:01:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 17:01:51 +0000
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
X-Inumbo-ID: 001d5f94-8088-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lULTcHBwPglg8ujZAkagSFakw6/MrK9dodZPLHNRzwjsRbKYn5a46780aVTo9aeBsqvLvGghm/pwVYTBKMYIa8Xocd/xB9+rnwiliFhraWvHKmR28xA8KBGd9McylHOi+RfQMqBdqB1eoGOiqOWOgPc5bISi7a6KXkuhc66VjRQ2Qpx7lPTZcJBnyi3XvltkBAG2XAvUJ8VR11rErc2QHGlHywYux0uoQyo0aJyu4yQvpxVHahCVFAQ+Yb9lzitcDH1um1kQka2SN59KbvgED0gPYyWl1gBVYjoRRsZ7tlvlWijISKVQ+HKVNWL7oqyzDPDpizvKYH/6QFFGqvZ5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xA7NX3RceTIHXEDDBCrr4AsSoQVS/CluVFtq3qSJzns=;
 b=kSrDFGazW5V22cCLRcxjSh7IQIH+lia7bgDWa9LJyvQQO6C9Liku7to/rzWvPE/ppXMZH4G3DmzK2CSG2157KTd+cKFGC9XoaVyiMb8pPxfUkJzHw7UFlrjzo3cZ6kh10+RrlzqteFSWkIKviwdF7aOiSPmEImh+hM1ro19oNTi7sc0xckOE3+nca9H070dgs88YQ2/KrsF3q9IzVtR+qHyQIaU/w1v/hN+CzDs2ONmiJZPh11qXc9ZtH7d1ltPYBY7OJ9JJA0FmS+ldLAJSE2HZCxdK+JFLcdEg2Xz/xYQALvSm2u7DPADdPXJrm9+VyjVJkSnEYHeDpLxELIlI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xA7NX3RceTIHXEDDBCrr4AsSoQVS/CluVFtq3qSJzns=;
 b=QsNWQXO4jwsjwnYJg8urPBzMNN/R0yf/QpyuRf1RasO0aeVo25MeT2cKfw1SNhQiab1WPe17E7tZmXwVSTsUF6DgBndeRMH2B6DdVDYDDKl22UPsI+Rk4vF2qvA0RdoEkFr8Lyx4NtqwXIKRQEZWToh8j/qZYUHqcQi4X0eHkw8yPvcb7CXwGeyhp3kRuuZUDBX8AYkDi/9uWVl8bZfLzuSxNaZkoLMoj8Ko6cSmomqQqPfUxUN+uhSa+VsYolHBvYWb2x/3dUSzs7NFhz7AUIfGfBtAk+Jysbo5Br9wF+lpRHw8aJr2kjBMmhd5RVSp1SYdUVhMP2GDzEFCkH+BfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09997785-ddb0-c464-331c-618349f418f2@suse.com>
Date: Tue, 20 Dec 2022 18:01:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219063456.2017996-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de3f34a-cd95-4212-1da7-08dae2abe360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZbNJsbJoqvrfodfmhIJjW9a1UQA0irvSWit9wNnOFsY0EWZI+isQcB8VamgrWj/4JCwG+vPgtg0JGZMGxh/UrtfJS66xxQC/kKcFnHU6U3Pi4VZY+L8C5TO0QUlvYyYGtLFzsQGrzD/r26xnGhWE8hz1RG8incbNyIu6Nkqv5AYo4pva8krPmv43sAZVjeIjyzdbyvC/lPeTzMh34OhzZRqgl/NX5bCYSsG6yvQF5nJODehzPNDXy9t9jrwuQponee8rGakZsP0necjVhJft3BSyFIsQaL2r4kulDzZTbrvTvCV8NBsklYLZiQGRD2XW6E75KKykiQouYVz0vFDO9/7lCPj/m7wVkzQFAANWaEka1AAMo8ZM8+MzI6KDWRDtWhxkiUq3jGHjnqw5pXFKgVeWE1wisnoxfmBSe4svU0o/m1c4Cj+Ud4AR7akI3VtkAJ5RNcMGz3Un0C9xiOqtMm4EmoSvNpkI+MTt/3Xop3N+2gRe50/8uYDhSgUl4Gmo5lUCDNBvhft9htTP/bBH8exQdKnL/8f4IhTAGZLljWq2Je1jyk2H/+YfIFC0d6RBLNyw5KOnuOD0My/0V6KfwYjluXJqdfTjQnmlQ8xLdn+K2f5tdChleXqldEHA9NRc0PxrZNkhpwjw0Lim+KIdh6zVAVNe4wHfZRaLUTM9wWvoC6yb1Jsc14gqXP+c/OPn5YJYsQbg0rn9QgZdNL1n5UFVkCvFEBzVRgBmKPiH15M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(86362001)(6916009)(4326008)(31686004)(8676002)(5660300002)(26005)(6512007)(186003)(66556008)(38100700002)(66476007)(316002)(2616005)(31696002)(66946007)(478600001)(6506007)(36756003)(53546011)(83380400001)(8936002)(6486002)(41300700001)(54906003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2lRbVN0NkRjWWt6dnFoZnVKdVE1RzVtRTdsVHhnOFZ0QUU3TGxnRVMyV0Ja?=
 =?utf-8?B?TlQyaE5IOGVZalltNmplbi9veGcrMGs3Yld0TmhtOWM0czlkWnBHWjRheVdE?=
 =?utf-8?B?YzloMjliNFNyUFNzV3JlMDNQbkdOaFFzb1V4azFvcEpNUzJQaHRTbU9TOWJI?=
 =?utf-8?B?WHVzMDZLQkhZc0xid3Zwa09wQ09QQ0Y5WE8ycnpmak8vYjVNazlqVEZOaE9D?=
 =?utf-8?B?b1dIa092VjRJTDhLblNZRWlKcVBabU4rcTg3VmI0N0RTWVFxNzZpaWVidncz?=
 =?utf-8?B?TUVlZkQ1Y0ZHc01UMUswSWlBbTRCOGFoQ09PTmhyMjZRakJGVzNFaTlPZHRw?=
 =?utf-8?B?TEhOMStwY29NMTlUdnJRaHJweFNiUC80MFFydFdSQzUxVjF0ZzJuWFJGQUpO?=
 =?utf-8?B?czY0ZHBSWXJmeWRvSEtJbFlaTTFyU3FiakZIZ1dJQVJvNWp1a3Z6WTVMTDZC?=
 =?utf-8?B?aDFPakpGSWMzaGMvdFpBR3RTUFRBOTVFdmlGMk1jQXZQckhQK1R4R3RtZ2hr?=
 =?utf-8?B?NndXQ0VvbGJpYzIyaXRlTkdaV3hrODhXci9hV2hJVnkvRndnZnpiaGk3UGxI?=
 =?utf-8?B?STVkTVBmY0o5cFpLV1AvTmhSWkxnN042N3M0WDJGc0FRcW1pQXRWN3hNVC8z?=
 =?utf-8?B?eXhTdHVGNjFwaVhaQzVBcEpyTmlnS05NQmZOdkNTZXhQZCtPZ1JmUlIzSjNr?=
 =?utf-8?B?R3JiTmxZTzUxdjl6aldHdENIOUhQbEhoNW0wN2x5NnBKcG05MW12TGZDN0o0?=
 =?utf-8?B?L0pZSnBmaWJJMGU3dDgrS1IrZ2FyVFlIMWNtUlYyVDgvWlF4NW9sY1B0TmR4?=
 =?utf-8?B?Z3BtaERNd0t5akJaUEM0bnZzclVxYmcvWlJTVjFpbXFkYXVLbE8zZXVoT1Z0?=
 =?utf-8?B?b2pkdVU2YlBxRGdBWDQwTVp3ekdmb3lxSDl3bDdDYmwvZGRCanhBMXZNbUFS?=
 =?utf-8?B?eXhVNTd1SFd1V2NTT29SVUYraUZvUmdmdVRmM2xDd2hzdm4rQjY4akFRYzdO?=
 =?utf-8?B?TTVKb3lTQlA5WDlXNUZkazFHemxvTTNTRVdpTGZZUTd4Y1lvOTNoM0tHZGNu?=
 =?utf-8?B?a3VyaUhrTjZvQlBkTE5taXVMNTFRRGZ4ekhZVjRUd0I4TVVwTEFBRUlGOGg2?=
 =?utf-8?B?R3lCbVIybmlhWSt2TnZQZ3VkN0pUSm9EN0V6RFZOOXRtOGV4cnJ2UXpZM0kx?=
 =?utf-8?B?YzJLSlJ5T29GaDhFMlVISHVrZzdiUXhmN1VxdGlITmd0Mk9HdWRMUFAvSit2?=
 =?utf-8?B?YzNKL2d5eGFPYm1HRGtWbWc2S2lwK0piWWtIb0RFeGcvYWZXRThibFRMZ055?=
 =?utf-8?B?dXFUQmdHRlNvSVdjeU1JNkZFeWcxUTduc1JmL01ZSXQrQVdwbTk1VSsyR1h0?=
 =?utf-8?B?S2xremZkRTVqd2tJS0p6aHd4SU45Y2RZUUhUZlRJb0ZiREZvNC9ESzY1cmZC?=
 =?utf-8?B?cDZJMjA4ajgvOFhGY1BnVGVGUjNQODdYbFpHTEVxZTRJNE9RRUlGS2RIQTJj?=
 =?utf-8?B?MStncTRFWDNqZldkRW1XZEF6M3VtQit6L2t2ZEY3K0k5VnVzdzlHNmQ3ellt?=
 =?utf-8?B?U1hRZm5zRGdJbWlKeHhPSk9EVlZrMnlXb3o5Ykw0TzgxbXEva1RHSU5pZXYx?=
 =?utf-8?B?YkNsN3daRE40dkpCNlpDREFYZjVjNEJxeWNibllVcktpbHVFK0ZMaGVocExL?=
 =?utf-8?B?ZDFacDZDRU5aVjFEenZhQStxZi8wQys2d0NzZW9HcUdSYy9MSzlJcTZJZUdo?=
 =?utf-8?B?WHhIYVp3MWdiMlhUbUxxeUc5WW9jY1hZNkl0OHJIZEZiVmFJbDV0dU9GTVgw?=
 =?utf-8?B?c1h3YkRmN2FNK3RVVUM4ODJFdGRvbWFzcThsNUMwekVaUkJaTlZENlc3OWFV?=
 =?utf-8?B?TWtlcUI1eVBWK0Ira1dubjhmVDFBNlVtdHhGVWJIUE9QL0VjcDg3M2NHVUhC?=
 =?utf-8?B?UlVTSERPTWY5YjBDdUEyaGN3WGRjb2N0MzFtU0N3WXJUTFNQMmhPUEVTRDQy?=
 =?utf-8?B?VVducDBra1JWN2l1TkRJUzdERGJHTGdqZW8yR2JiNStLRU1QaTdWaFJRZ3c5?=
 =?utf-8?B?eGJ6OWJxaHhGOGdLaTJJV0Q4czdvMEVBVDYvVjcwbTZNeXFnN2FZcThyN3BX?=
 =?utf-8?Q?v9U5sbHacpCNbmDV3d1aoF29u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de3f34a-cd95-4212-1da7-08dae2abe360
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 17:01:50.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGH7YdNBI/pNLS02ioxmtmVgeTiEZeDHrtKBTfvX2gCLWxjYdn1WnCgOabGaT6YSxpFNV6SKomkuwqkHPWA4Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

On 19.12.2022 07:34, Xenia Ragiadakou wrote:
> Currently, for x86 platforms, Xen does not provide to the users any
> configuration control over the IOMMU support and can only be built with
> both AMD and Intel IOMMU drivers enabled.
> However, there are use cases, e.g in safety-critical systems, that require
> Xen to be able to be configured to exclude unused code. A smaller tailored
> configuration would help Xen to meet faster certification requirements for
> individual platforms.
> 
> Introduce two new Kconfig options, AMD_IOMMU and INTEL_VTD, to allow code
> specific to each IOMMU technology to be separated and, when not required,
> stripped. AMD_IOMMU enables IOMMU support for platforms that implement the
> AMD I/O Virtualization Technology. INTEL_VTD enables IOMMU support for
> platforms that implement the Intel Virtualization Technology for Directed I/O.
> 
> Since no functional change is intended regarding the default configuration
> of an x86 system, both options depend on x86 and default to 'y'.

But do things also build successfully when one or both options are disabled?
I have to say that I would be quite surprised if that worked without further
adjustments. In which case initially these options want to be prompt-less,
with the prompts only added once 'n' also works.

Jan

