Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5455E6BAB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 21:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410450.653443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obRlv-0005PW-8V; Thu, 22 Sep 2022 19:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410450.653443; Thu, 22 Sep 2022 19:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obRlv-0005Ne-4g; Thu, 22 Sep 2022 19:22:07 +0000
Received: by outflank-mailman (input) for mailman id 410450;
 Thu, 22 Sep 2022 19:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1obRlt-0005NY-O1
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 19:22:05 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6660c85-3aab-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 21:22:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 19:22:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 19:22:01 +0000
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
X-Inumbo-ID: d6660c85-3aab-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9b3EuY3RU2vIMp8jtEPxO0YkT64p2gETVTXxbsk9uztCLlvoWM1pXGN31mhQ8mVL7XJN1rrEQagq5fXYIUuFqNJrk0aN7bQhPLD42JQ16rf26erMcgpkgWDgoBEIWu3pJNw87zGkhpJBSBhP28vjFBn02iF+sk7PyTp3i3T+H6bOpHz4jNXZRjcKZEX14YedR7KiHJHxGpirBPKV2jjYTa/noBX7ncGci4x4nGfEuzQY/1YQc0Lsx0EdL0nj7N5EUVB0q9ygNhMbnN/hsZusnqdfKxITlKOqB0BHqyoLrpHELNy+L8bzjC2ESn2WZJUPgtyw+epcK9AI7les4LRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyZNMrj8cvt+y2w2yr3PUS/ScdXrCb9S/TOIQmJ/6jc=;
 b=Cr54wxPN19AxAs0VS9dqMWufzRj1scgiCWqq4tLA9a8S0meBCOhtDewfGfOz5jMHsAOvmBWysT073R0ZyDt2lBBbN0RR1qbgswNhqmJ1l8vRWnWAmQB5VDkaKZLBioMZ8Sry/4AbXV5QGRnyQOb3faFlsYBMD8a3o7izSn/gd3rTjt4BLxFKTHZQyGaRo+iSyPZmf40Lu3W0m1zwKvyrIK6pEVBNCHaLAnazR8rYW9yKPPbqfVwES0wq+REEr/pQ+IeFRqunyh9Eau1/1F8btRR+4wKDJ2lOEZVFd+mmjXWg+QlKoHqMoxSjuvOif6KpIY8rjpFQ9voCmPQtT68Ogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyZNMrj8cvt+y2w2yr3PUS/ScdXrCb9S/TOIQmJ/6jc=;
 b=lotIu3PwfMpJlmpNRlRd3Kn2FEGv3wiQGloIQl3++Xkul4qrLUjJG70xvB2kG2hQSxIRExPY63cwV2tNCVmZayJphBpoPlBVLb3veXjEwyDV9tgkds4GGTyFc7JsQlbBnbOgsd3XDKsOOqwAqCsgQve2wr3sS4kW+jn8xEOeC3xEKU2lsZY3aa95ZcEoOCXGEdA/Lglq6uE8gLIssif7NMtLZEE7QaP7MlSYnPVwJApW8zvGdPTx+WLZ2z07KLU9zKFKqiF3oIE5oLJWAIEtpgWgvDCIwx3j5XMoUnJ81/N91Ijg/wT1oWt0mdCN8lQxvtdRqnjzk1qN3fm0zSjzMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
Date: Thu, 22 Sep 2022 21:21:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220922160516.5929-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220922160516.5929-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:205:1::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c06fa34-88e2-4231-6be7-08da9ccfb966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EQHaBH6bn+sUSCYZMGyXINn2d7f9wu6V0Fb7eE6EaG+kV6rwT8b/PXEj2DpJ07YdDJeIYvwE6bLxciw0W+t5ZipBSEHEFeI0cN+gmzRwToS7SzdYoF29vysBeTJnjMtP+LDrTmPagNwb/qvHMqcOp3XbUg0s+ghv3Q831TY3bWtZJD9JaZAUGIOm2naGPRwuiJGUSLFkTZDXmcYVo7CEgF4zktmu07LITGCYANFzZQMGd2Xcw6bfU/EHR7lkx9FFZKUBXmSI+xSJ0SLyBnVe4enJuK+5U5Twbk6iaQjpLeqTshJBNK8XVxCYraXWH1SMkV9VkK32QE2FPGss/xACf+Z00FNkHnKUSySG9Yj9NiQzyrh3e6UAzUvO1nocm9WZ6HKzevOpjv1LUDypalZCsqA5ocseB7ay74TBqGW3cOphixxWr4c1MHcGBygnvfWOV01sh6RMitw2Wi+slt6gETHuuI5U7xausBqy0dhZaOxEn/kDK2DAuYru8WOB++hnMKjTi5OlPpqgU6gBzZH7EPcBO5BOuvQZcrY6gbJgiWdb9C+EKRGFeGD9JESfnHG7x0K6T8qCwM5Dt9W858E+9Mo33lEXDTXIrQZ55P2uQfREuWV3bB02mtRIB0lWXL4KpiRM49yONA8ZOJUQowG4uBo8vgzzYBdSZtI62yef8/coabzwRTbfIGPbQtzpHiZhymTSa7rxJsgJqJk8xbDjm7Lm6OKes40vWbY+T/wk3RJD2xDb6Gq/PMOdu8Ef1kt4LvoO290NpETisIs+A6v9r/JzpFdd/Xwb635qHqmYMP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199015)(66556008)(8936002)(31686004)(2906002)(5660300002)(316002)(54906003)(6486002)(36756003)(66946007)(478600001)(8676002)(4326008)(41300700001)(6916009)(6506007)(53546011)(31696002)(2616005)(86362001)(26005)(66476007)(6512007)(38100700002)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmpDMkt2U2J4RnFTT1NHMmJQM0pZQ2EyM20zbVhWZnd6bDVXSWFSWGRTaXU3?=
 =?utf-8?B?WXAza1pQZ0prK1J0ZXlMTVE3WEZVRHVxemlWakZvZWxFcWJpVjdtcVdxMk5w?=
 =?utf-8?B?V0lnbWZKTzRFTytOYlV3MHl5Zm04ZWtMVktnY1FZZnR1N3hXT0FMcGM3U1pB?=
 =?utf-8?B?MGl3dFkyZWxMZ1hlNmQ0L0xVVStOYktkWEc2QmNPeUR3UVIrdTgxaVd0WERm?=
 =?utf-8?B?MHFUUjY3TGN4Tm5JbG9ZUDVMUlJnQnhRNk01VEx1Ukkyb0pzdGtwWnN3ajhs?=
 =?utf-8?B?TEs1RGFGY1Ewc2pTWW5hTEJ0YnlUalBVOGhlUEo1WUN6dm5UbUgrYis0ZGt0?=
 =?utf-8?B?b1ZzNkxscmRrK1RrRnZrT0VSbEh2QUZwenVwa3ErbWpYdGpHcktTYWp2M3ZI?=
 =?utf-8?B?MzV0TEl1cXYyQXpsR25uZjJqcU5PK2oxMWNtUjJQT0hJQUdPRkZHOUI3M2pI?=
 =?utf-8?B?VUNibDBNdDhtZVYwN0JESnEyS0NpZTJOaUhtbUFzT0FQT2tKT3V4UE4xbXo1?=
 =?utf-8?B?R01NSnc4eVdkMnJFck5UVHRaSkpKcERRUW1icWQ0WmdmajhYbmNLU2F5cks5?=
 =?utf-8?B?cVZ3VzhsWmw5U0lUNE5NSEludlRpOENBRGlzYnRIbHNCdU16NUdSeEorVjAv?=
 =?utf-8?B?K2VtSXBEWlI2RHM3Z1c3MmRKNUlvanFwQ0Vxa0JpS0p3dXJGSE9kRDc0UERV?=
 =?utf-8?B?QnpGZkRrQnNidWdjMktGcjJNOWdrZlIvWjJNdnJmR21YZGRWRVFoWHBwS1J0?=
 =?utf-8?B?T2xNKytLbys1L00vRVlIK0N5WTJJMjR0VkVGVkorTHpkcDZXNGs4U25kc2Yw?=
 =?utf-8?B?b2dsMlFhbWk3MTRFUVZhQ3A3c1AwT2V6MmNjd1hjQnVKekcyUzg3M1BwaFpy?=
 =?utf-8?B?WXpzbFhsekdiZVFwdmU1OHBqOEJLY2tyc2dTUnFtTjdBYlc0TG1oSDRiRkx2?=
 =?utf-8?B?M1BSVGRCS2xRUklPZ04wWWZRZkpQY0pIN00weVQ1NGRVM2FRcWJ4TW5PRmd5?=
 =?utf-8?B?NzdrdnBwOEhGR2REeDdKdFBMTjl1QXVvT2w1a0gyaGdtRzlyemp3Q0NqeW90?=
 =?utf-8?B?L2JzcnZsK2NTL2pqWUVGQkhiNEFyOFg3d2E3TERpTTV1VFBmOFVmQUtBb2FF?=
 =?utf-8?B?Mk1WWW5tcnBwNEF3ekRrZDJRRlVnZlFGeFp5cVRQRU9YNWN4Vm81NjhlU2R0?=
 =?utf-8?B?RUNjLzB5WXdRb0w0cHJGRlJKd0ZRT0JEMzVyRldWanRrOXdqUE03WUpwNXYx?=
 =?utf-8?B?SU83UGY4SkU1T0w3Nm8xUDlvUFVDYWFOZDZiQ2lxZHQrbjJaNlJoeXBWT1ZS?=
 =?utf-8?B?dlZ5dENEbXh4RGIzRkRoVUM5VFBIUWxhN1FvNU5DS3U0cmc5N2lxRTQ2WlI2?=
 =?utf-8?B?NkExRlErT1pGa2NGQ1hvVmdmZll3L3grUTFyL3N1ZHI4Z0hBRTVIRitNSUZk?=
 =?utf-8?B?Vk5nK1NrQytxdzFQNjZhajViYU1mOTZKeXVBbFdPYzdRd0NuZXJkVVV2Wi9y?=
 =?utf-8?B?ZmYzWjRteEYrY0E1dmIwYzBTY0NTUERsNThSS2NoNG9wWUxDazhnMFZZNTkr?=
 =?utf-8?B?S1JidW40QnlzSUlRRm5qVHZabURyNEFsMllub3hqTTN5clV6RzhlQ2l1SkNG?=
 =?utf-8?B?RitKZitBcXFLWXZmb0V5YTIwZkJhVVpjYkxWMSs4MWZvSGhlVkpZL3NJa3dK?=
 =?utf-8?B?Qnl3WFlKeHlNUURwOFRIOW1TUDJBVHI1VEUyL0N4aGtxbUUzN2JkUzhRY2gw?=
 =?utf-8?B?VGx1QXIzOVh6cDF3eFIreXQvVThJZlRxTnhPK0hiSHhkem9FQUFkYWxENU5q?=
 =?utf-8?B?ZjZ4YnY5NU96Y0lnUWJ2NFp5eDRCSHNKRS8rbDUvQ01pcGQ3VU5LblBMYmhv?=
 =?utf-8?B?WFhMRjVncTB3VE51TFJZQmcrY3lTTFByVC9DdmNPYmlIMERzUk1LV0VwVTRm?=
 =?utf-8?B?VEg1Y0Y5b3d6TE9rOGgwTTBMeEQ2Z1BVdWExK2Y1NVlmSlp0YVQ1eXRRcFND?=
 =?utf-8?B?Z0JuWDlzN2F5N083bXQrWnhyWXEvaXlGWnd0TUJ0Q2ptWUxQSUNFRFNnNFFz?=
 =?utf-8?B?QWo4ZXgwRlRVZDA1Z043TlFPanFEUFZiR21QZzNMcGQycmF6VXUxbUpycm9U?=
 =?utf-8?Q?qPeN4jNDFG7qhIxWkgf2FDu58?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c06fa34-88e2-4231-6be7-08da9ccfb966
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 19:22:01.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3sgb39K9B2kjpGPYWg/YKZqI2a0JTrGRs1cn0gHyH6KTQkpKdOk85k5tBy1JFXT3RqUZMtrOomv/4X6N/imkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802

On 22.09.2022 18:05, Roger Pau Monne wrote:
> memory_type_changed() is currently only implemented for Intel EPT, and
> results in the invalidation of EMT attributes on all the entries in
> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> when the guest tries to access any gfns for the first time, which
> results in the recalculation of the EMT for the accessed page.  The
> vmexit and the recalculations are expensive, and as such should be
> avoided when possible.
> 
> Remove the call to memory_type_changed() from
> XEN_DOMCTL_memory_mapping: there are no modifications of the
> iomem_caps ranges anymore that could alter the return of
> cache_flush_permitted() from that domctl.

I certainly agree - this was an oversight when the two aspects were
split. One might argue this is a (performance) fix to the earlier
commit, and hence might want to go on its own with a Fixes: tag.

> Calls to memory_type_changed() resulting from changes to the domain
> iomem_caps or ioport_caps ranges are only relevant for EMT
> calculations if the IOMMU is not enabled, and the call has resulted in
> a change to the return value of cache_flush_permitted().

I'm less certain here: These shouldn't be frequent operations, so
their impact on the guest should be limited?

And if we were to restrict the calls, I think we need to clearly
tie together the various places which need updating together in
case e.g. the condition in epte_get_entry_emt() is changed.
Minimally by way of comments, but maybe by way of a small helper
function (for which I can't seem to be able to think of a good
name) sitting next to epte_get_entry_emt().

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I feel it's a bit weird to have calls to memory_type_changed() in
> common domctl code - for once the domctl that trigger the call doesn't
> change memory types, just adds or removes ranges from iomem_caps
> (which in turn affects the behaviour of epte_get_entry_emt()).

Do you have a better suggestion?

Jan

