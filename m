Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B225EBAC9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 08:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412269.655508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od4Bj-0004JL-6F; Tue, 27 Sep 2022 06:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412269.655508; Tue, 27 Sep 2022 06:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od4Bj-0004Gi-3O; Tue, 27 Sep 2022 06:35:27 +0000
Received: by outflank-mailman (input) for mailman id 412269;
 Tue, 27 Sep 2022 06:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1od4Bi-0004Gc-0w
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 06:35:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90c5dfb5-3e2e-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 08:35:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7677.eurprd04.prod.outlook.com (2603:10a6:102:eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 06:35:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 06:35:22 +0000
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
X-Inumbo-ID: 90c5dfb5-3e2e-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYD49ReDlBsiO4TWWgHf/kbnNqYHZnjwwMvl+iJgdg99dvsBK4cHsr5ScHApRf+v/FC0TmyDkFFpA2BeE4spNyKtVnuELrdYLQMQWynsQ5Fu6RHqrx5n9/vK4oHgIHItAGX5OrIy1lRjZiz/jyqpAKYNGyHJM2jDGSn/iHXNb0X1JK8z40WuAgUHUfbGFdx4ah7mnVo5anFkbwu1cYkOQRIGzt4dj40NrqwNk7HQcjNeR8lcEXhM/E89V0QamqhkNxPsa68QC38ehTp5J+Rhe+Akplu8kmZG1zQONrs1w6hYRBlLv/UPHcMvdPtmcdVRZoNRG9ffVTPVDo+V1qXG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIr6NuGjff+Po5IsD9ItbZh4rwNiw03g7QwP09PZqyk=;
 b=XB9fE16yRNxlbtgABJ/wMRKFYnmlD/TXZ7dmWrF9yk7nfaBl57MzHFr7VyZ164dCvx/2/AD8uwG5vqcCo6dHrIMgJtTr6U3+yD4UXeudjioT3Rpq8DEoyGmnCM0DBZqrqAvgEP7qBlopZ57+KEzrd9d+JMzm3nJpMruhjSmv6jcyqK+otqX+FxRtDWeWreTjhO+t5z411SuosAmSJjPbX3oHF+cdWeJdwBxh+wma6SoKuYP/wUhNE4VcAvsDkmjeeAoCtZ8+yn27srSuUZBiSQ8/XAkvX+Bs5/IL91Hgb54h7oDbMiS/2ORZSZHH1gBFcvBiYtyQvoaYemIpoY39sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIr6NuGjff+Po5IsD9ItbZh4rwNiw03g7QwP09PZqyk=;
 b=ZYAEvAXsDOCyrps4AhB92SHUY0w5BEjkomMvGHXWBcNmNwzNrCYnI8JP4BiAW+9pqRJYJaeBlArQfB/1+uCMhbr03K3mtT23sU1bb/fbvSqWmiFjowcyNlosZmlzfB2J7XAHBsHZiE8SuvdPYCT1g/SaJz42fYrLQrrM0sMnMHeAE3eMEk04Rt3nRUd3h8hDkIfOJJjydjdVRfdzoCyo+ms/g7NJ49PXIBPDGLVc3cgNWJq+5mNAvf0SXsoRe2MXFOegFKqD4OnkGRbiS8miWDD2aYMm9m1MWfy58Ppfup6s98IYPqVpNLjmD/xJmeLrMnOPnITgcY4e3Bab3lXusg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82fb70ca-25cf-6e06-968d-416798f65f79@suse.com>
Date: Tue, 27 Sep 2022 08:35:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
 <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
 <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
 <YzG8Ln2cYTuxF513@MacBook-Air-de-Roger.local>
 <YzHEcdCtch7lKh4G@MacBook-Air-de-Roger.local>
 <f8c080ca-33a1-ab15-963e-9c5c02c99bce@suse.com>
 <YzHMDIxjXQ+txtwy@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzHMDIxjXQ+txtwy@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: f839abbc-b933-4963-06b3-08daa052741e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TsUipo7hJhzj2aQQusnLnpnL+n9oWeUInyl1tQptMHTQ58H3RsEOYShVWOXBdOIGgyGLb/LGkUCVvLHI5fRrcxrxBpXYDmvop/Tijx80AAF1HO1RFib3pyvb6s3J4aqkjAGhp3mz95rnOh/SqrKr9WYndL82VYLw6kMyiI/jPmR/zE/BRcmcJ/lwqSFvRfMQ/EeAVmvBhhDKZ//OJoV0Ka4BCdRASHs5DIkeLFsKy0iKTzhLqc+TEJ/OwO6PnBjHbMf/ip+QK5FBbQxrsa0esUYtVQfl2pvDBWDkSAp/xjnmxib1PuJQu/sbwHhP4EP4SCBIovYmpBLg/BS3fmOaQ1//gbPbT0LoX828Azvgf2FRw5bU4y6Izjyb0aH+Yld1i77CQ7CN9ZW8LEmU/mCyavX2SuUXWyFtQvoORbsemMNHUviCLgE3yRHpnwV9ICI+/V8KxHi3m8faT4/Uc4g3sNouWQvh3oR5dZT0xcKZ626mF2uPUXom96FzWOkbxpdFgvxQVeVpMYEW/BE/X989V+p6c0XvUbbcxX/F+IlkzlBowXbJKY4hAacgSOP9s/qEY4MADpTpmY0FnHG47MmUNITGSSIsimHrbk7lrEypPaluy+EtttRNpW3PeFFIkovRMF1P5lT2y4m+bn2Qi94Fr9k/NOAE1O3Gout553FDHpt2BBu6oYlbqhDWmCqCByYaKq11++M/d/0aEIrCdHQADW5oC429JnzzgxaiovGuPI7vB0OTwwgHNURB61CVjmxmCcHdt4gg4MtF9AhhcYl9d3NlZPbwzn8BRWmis/Yrpb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(83380400001)(8936002)(53546011)(186003)(6506007)(478600001)(316002)(26005)(31696002)(36756003)(86362001)(2616005)(6916009)(54906003)(4326008)(8676002)(66946007)(2906002)(66556008)(66476007)(6512007)(6486002)(5660300002)(31686004)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkFzSVR2cE9SbkNLRVJnMHM3ZmNHQU5sZTdXWHBQRWpJb1ZXSEpPR3hSY09m?=
 =?utf-8?B?TnF3UHVNNVoyVSs5NnpqQkNZSXB5L3BkV1JxUTBwNVZCYTRnSTVnbSthVVVw?=
 =?utf-8?B?bWx1ZTl6c0RhYzRyVTlxdHZldmdwTGFwZk8reVJVN3FxUmc0eXl4L1NWNzNF?=
 =?utf-8?B?Q001RDMyaGJBNXB1MTlnbzhmeFhETCt4em1nWFdwZGZvL2V0c2tIcnV5UmM4?=
 =?utf-8?B?Y0pybEs4MXpZemJvQWYxVFBnK29JQ0d4ZHdXaTFxRCtzcmlpbXJsRWdNRGVL?=
 =?utf-8?B?ZGZPOEtIMEFlN096bGRzRDY1V1BzdlBaWS94dE9EbUp4OGFzd3hqZHFGZldl?=
 =?utf-8?B?ZWN3UnlUSHJwTkpPRUlnQ0U1MktkQjBjZzZ3Mmxxd3NTOEtydHU3SmwwcnNH?=
 =?utf-8?B?Sy9tbHVGaVBhSjV2TWk3cjhBTGx5VTZwMlRMZ1FDQjVRaTRxbE00RkxNelFK?=
 =?utf-8?B?Sy9aZXYra1BXTVF1V0pFamlrQ2tXNFhhbjdUMGdnUzBMTmNQbXVjUXZOaTB3?=
 =?utf-8?B?ZVpYczRyRndTTkdlaWdBOUtVOVdISTN6Y2xzZEs3RDRhZ1JCVE1kYWJWWm1q?=
 =?utf-8?B?QitOQlRocEVMZ0Z4QUpQTmRwcnIvbFRTR2NIVmVGMk5PNkZnR0R1REVpT2la?=
 =?utf-8?B?cmYrSlpQUmEwcXlNbncxVER4VnFQT1NuTHlONEF5aERzQm9neUxGV2w5em1z?=
 =?utf-8?B?bnhYNkR5TnpMcjVRcjVldlMySjZDeUs1VTJsOW5BeVhLb3pMY0p6SkhzSHNU?=
 =?utf-8?B?N0tzNUk4dTUzN1NlRno4ZXFkQ3JCeVd2dEdrMisvdS9WV1lvem1ya3ZNY2Jw?=
 =?utf-8?B?VzZVMVg0RnVlcmJRaHc3eXlrMytJUXFueHJxTXRsaW1iYWFtT1BMVDhvLzBy?=
 =?utf-8?B?M3h5OVJ6SHNxVWpBeXliS3hNSlBOdU9zQlozZmRrNWpRcEd2aVZ3WG9wbXpI?=
 =?utf-8?B?aFUwUmsvTW5Yd3E1VG4zejMvYWVVOGwwQmNqQ0t6MFhkZmI1V0xLVVNPcEdQ?=
 =?utf-8?B?bUp4RXpSNmRrZzV0eGx2Z1h1dE90MTUrdmJHNVhpWktpQWxuU1kzMGUwSXdG?=
 =?utf-8?B?YnZwbkc3R25SRkphcEN2a1JXMXdWakdQaXk5S2hUa2l0ZlBRY00zank3T2Q4?=
 =?utf-8?B?aHR3c2Q2dTZwTkNYV1c4QkhxMVRRZVpsL0djdlhYdW80eGFRU3N0NUZOekFw?=
 =?utf-8?B?SEhYYXBacGFwV3U0OFJucldpOXdvaWJONS83c3ZaOFR0b2JmOWIzVElsei9a?=
 =?utf-8?B?WUtWTUUzL2lRNUhWcVc5ZHN6RkM1dTdaZHhoL0JobHpaTlJjOXRoQ3E1c0ph?=
 =?utf-8?B?WlhWYnoyc1I3TERVejlubTdMM0FmR2ZJSWtjZG1mRUpyRzdESkRxcnBTUmFD?=
 =?utf-8?B?NXJsU29MdVRSeVpiQXpPazgrN1phMDU2YVpocExRWTFYaUV0UzY5OVJQeFdh?=
 =?utf-8?B?cjl0eG1pK1BUaWQ3NFp0TkdvektNM015cUN4Q0VBTklJZm9OTHY3VENJOUVM?=
 =?utf-8?B?Nmd5U3k0TlFmc1BpL0lPUFRWa29JVkJkbWtZU3JndEN4Y2FIRTFmTHBacmpr?=
 =?utf-8?B?Z2NJckdOME5JTXd3VXYyUHZwYUJZYWpRQ2lORUNBYS9CYndreWFHVUFZU0wv?=
 =?utf-8?B?TWpUcmcwRVR0a0dDL3J2bVVnZmdkQ3IwaytleEtJSzhBdjlNSHZ0eWVNRjQ1?=
 =?utf-8?B?N293ZFJwUE02NHpHYVdlOW5jTHlZMkNPUWJPcUtmRzYzQ2RPZEJYbUIzRTZk?=
 =?utf-8?B?TVZtTzUrZXNTbjFRV29PRmRzVmc2djNPYWxtR0lVYlp4b3BBR05pMzZPM0VY?=
 =?utf-8?B?M05KcTFGOXU2azlwanhWcFcxTklSeUdmQXN3a3lxYXBJZ1dpdVR6OGFteXpj?=
 =?utf-8?B?V3Z2dmR3bFgvN0YvMDRYYlM1UTk0VTFwR3l6MnErWVBRRFo1bzRXdGdjcmxB?=
 =?utf-8?B?RUFFN2orbnpKT1czbzUwTVowK1hFZmp6bnc3OWlxb3BaaFJoSk9GdGNvVWdH?=
 =?utf-8?B?OU1Obld0bnZlYTkwSXZFMVpHNlVoeGVNalUwdFI2VnpqYm5SN1F1L0wzMG1y?=
 =?utf-8?B?cVFsUEg0UlBzWk13WlV4azc4T1o2Y1RWZVZEUjJzMlBTZi9hSzk3SFNoTWpU?=
 =?utf-8?Q?xS/kxqH9++LzAv6DIjQq7DeNy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f839abbc-b933-4963-06b3-08daa052741e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 06:35:22.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH8xlrb8nniy2RDTYHelf2clU5lScCna6ps3x4TWQYOXzxPoSvXtIRIc7gbrL+ymjiX+tKJVUSUI4JZNQIfYNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7677

On 26.09.2022 17:58, Roger Pau Monné wrote:
> On Mon, Sep 26, 2022 at 05:36:41PM +0200, Jan Beulich wrote:
>> On 26.09.2022 17:25, Roger Pau Monné wrote:
>>> Correction: the Arm memory_type_changed() needs to stay, as
>>> iomem_{permit,deny}_access() is common code.
>>
>> Right, or we'd need some other arch abstraction. (I wonder whether
>> long term Arm can actually get away without this. Even on the AMD side
>> of x86 I don't think it's quite right that adding/removing of MMIO
>> ranges has no effect on the memory type of accesses.)
> 
> IIRC there's no way for the hypervisor to infer cache attributes on
> AMD SVM for NPT entries, but maybe I'm missing something.  Guest MTRRs
> settings are completely ignored for AMD guests.

Right, as documented: "Note that there is no hardware support for guest
MTRRs; the VMM can simulate their effect by altering the memory types
in the nested page tables." That's something we imo should do, but which
I don't think we actually do (see p2m_type_to_flags()). We respect the
PAT bit when splitting large pages, but I don't think we ever set the
bit when making new / updated entries.

>  I'm not able ATM
> however to find in the AMD PM how effective cache attributes are
> calculated when using NPT however.  I would guess host MTRR + guest
> PAT?

First guest and host PAT are combined, then the result is combined with
(host) MTRR. See the tables in the "Nested Paging" sub-section "Combining
Memory Types, MTRRs". Of course things are quite a bit more limited (but
also simpler) in shadow mode.

Jan

