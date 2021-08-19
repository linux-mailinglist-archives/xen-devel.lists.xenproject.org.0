Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256B3F1888
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 13:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168569.307776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgZv-0006MO-6y; Thu, 19 Aug 2021 11:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168569.307776; Thu, 19 Aug 2021 11:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgZv-0006K9-3i; Thu, 19 Aug 2021 11:51:23 +0000
Received: by outflank-mailman (input) for mailman id 168569;
 Thu, 19 Aug 2021 11:51:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGgZt-0006K3-K6
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:51:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c430139e-00e3-11ec-a5f1-12813bfff9fa;
 Thu, 19 Aug 2021 11:51:19 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-9khJO1b-OXqzOydlCOGAkg-1; Thu, 19 Aug 2021 13:51:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Thu, 19 Aug
 2021 11:51:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 11:51:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 11:51:14 +0000
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
X-Inumbo-ID: c430139e-00e3-11ec-a5f1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629373878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lp3kkWOhwolFkz1ZnDsJ2m7Hq2sngPtIrkrQHesJJbo=;
	b=VhwCLyeN/IT6FB7gazQ7COMa1WujlvVY8yE33yyyCqVV7VIEpO+mhu/Fg9VC6d7R0w0pXM
	VLu+W6dDSRwAyjVmjsiYM3uFJAyygdEMbNW/QjOqnOCmczshOsAvQ+Uzg0dc68o0Gv71Ev
	LWag1hrysOFRM9CMzsWeY3j4wP0N9Hw=
X-MC-Unique: 9khJO1b-OXqzOydlCOGAkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPcRSbO/T5efQRQ3Mi8G4iWgdjEYp0QKE80jUhM+K2NZdGGDnv6r3DQUBRtaktaWscAGAAYAGuFsfOAkOQxFSqoZIkOvbZ1j4OKtrr3tFsKvfMRpN4KgumKDronrVZzIyEEf60u6qYjE7yb506KtEK4E9B8U2/XFgkcGnbEHuxCXoPa+srcrOl3FSJQcuI13OiiCanKaUSOcS+qrynkC5J4ioNvOf/QogRcISMQdtVyRmDTOqGmNA+dJmpmXW/wX8WTensj9RtjRYbtIPWMRpo/GtcCfeymf707MIPJdFZB4DPFUilil8AHcYNy8QmxHLSZY3WmYrygO68qhMOdp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp3kkWOhwolFkz1ZnDsJ2m7Hq2sngPtIrkrQHesJJbo=;
 b=RIw50PK6WCUMdYeJeN5stUOZN50NNTOKUpsJcJoaFU+eIcr2PhdCy9THt2AXlVu4yqEW67LMzMjZq8JrHdFuCvztKeJ2PUSMmLts8vEohXL4Rk+xY9C/bJ9JICERo0kCHb+gsbMXdenZvcHI0JPkQKtdHQILCYXiV0zHmHFtd3NYamk+cmngQKm3PlB6VEnTlWhKCmUi9tyL2Y4Olsy7OAm43QjJ1QAIs4g2hLoe/S90AAw1YOnhsg6SCdTvKAy8y4ObUn3tKpgABAkwiLsin9DY7hEH3DCIfXT65lRFuAQKXhpICcxDdnk/P73366g9fX2K31LnSCG+SA6m13uWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <f69e5a2b-cd8c-3534-ab7b-427fb1fc1cdc@suse.com>
 <f0e9c8ad-dfa2-77ac-b3db-02cba59e843c@suse.com>
 <347edc1f-a104-1bc3-0cb2-2cfffcb6214a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>
Date: Thu, 19 Aug 2021 13:51:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <347edc1f-a104-1bc3-0cb2-2cfffcb6214a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c509981-ab77-4024-bd33-08d96307a5e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039C42EB41BC178D0AC2BE4B3C09@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HOiDgHgikfELyCrysT7ijQQw2DE8IruWOWRT97Xa04GkXab63AZn4bN7J3yJg/jj50Wi/K+gNpauG/k9kUJNaE66HjPIc66/+hWFDbwBtdowosX31QJf0xBXRJxvxQvhDT39gSPOiJxRbT9YONXlNzwFUeKY58EaBAB9b45RR3QlJOK1z6otzz8iQbhi6dY4Gj650VC78Q8OvxRIxndV4+ov9s71O5Sa0UzJxsEZXr/DwBLkmevLj52p6bH5me9S7S6FGPu2MvQRvWuP11pjE/oQE5xliprwA0OUNbxzWI56wyrMLd/KOxYtUWYKfFObHNptOYyDbaweTzHPJH0fDPHzwNpdxMmTFI0dcRKCjEqY00572NJ9GGZYuos6iMcczJGfTbeZ7Uf/864k+Bc43/yoHaOreFuJRNiM17vhbMS+TjrXGcsV2ZUtxSNdilpblMaNdyGeyrc7RpV3RfLCWRHKCK+mlvOuQSdwfHgiT/ocOzn3xdKv1Ndhe1PpsQ/XIoN/iHD8KFtZUTyHmFD7mIiubJP/TGCXUwN1teEXga2TugD2skNIJUm4BKzoFsPp42JY6A0alrtm7SOwxXl+uZ243Xh7ffH7QUndUIEU2qjEsrw+Z6dTywhbyy3CUnpBYSKcb+Cx3qqZZeGmcYbrGzDavKpsAL8ZhqV4uOjJAMgl9GJ0ldJJSqxq4ULy6FjaTaVzr+BBdbaHusTmYnNeDPR/l8SRt5AhWDwN5LQHhtEHM+z1cOuNgc+EEQHooSv1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(136003)(396003)(39860400002)(2906002)(478600001)(956004)(31686004)(6636002)(8936002)(4326008)(5660300002)(186003)(37006003)(54906003)(86362001)(36756003)(6862004)(16576012)(316002)(26005)(53546011)(6486002)(31696002)(38100700002)(66556008)(66476007)(66946007)(2616005)(8676002)(83380400001)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d010T1gzbkR0VGVIVis1SHlEMkhYNmkyWnBKcUJSMnEwZU4wdGpBd1pIZTkr?=
 =?utf-8?B?d1ZQSzNYa1BKVVBnS0gvTGtwYW0rUjBYQWs1SVpvT2l0OWRHL24zVEkxeWxl?=
 =?utf-8?B?bWxZMUlFSkJvYkNLdnMrTnMzdlhVNGVTTHorUC9pYm5lbVhqbmp1dmpsd1Zy?=
 =?utf-8?B?VFY2OWduY1oyZFN3NzgrMGQyYkJ5Rld0VWF3eUtVbnNEdklVL2o4RmwrWlg0?=
 =?utf-8?B?OVZOTEc3a1BzMU1jRnVxNFJRM0I2djhoS2prOGhVbEEzdFdsUUlsTXJDM0wv?=
 =?utf-8?B?WEZOTFRSdFpkZ1hPV0VMcy80cis4dzRNc2NkN2t5dHp0ZldWc0NiRlBzckpP?=
 =?utf-8?B?d2FPalQ4YUxZTE45QnZsVUVKWlhSN2VpYU0vZFF3Y3B3RkxXVFpSckpucUtV?=
 =?utf-8?B?YVdZOE9ja3R6WC8xWE5lVUU2U0IyaTduemhCNWhvbWplQWdrdkVrZDltNWMr?=
 =?utf-8?B?aC9PaFBScmNJcUFlL0xVbU42ZlJXVHZPVWlITXdTKzJxaG5GWEkzcUYycnB1?=
 =?utf-8?B?NXNwWmJIZFZmSjE0YmJKdkZycTZKMmlHR1IzOE1mSGlxc3hEZWx4YU9yQk5Y?=
 =?utf-8?B?L1BOY1g2b0FVT0hpN1E3MFBtK2E1N2hodXlwRVNkeWEzekdackIrYmo1WGV2?=
 =?utf-8?B?TkRoNFJwREJtaW1RbTRQN2tRT3lPdlRBeEltaDJmUngydzVOdlQxSDgwamUw?=
 =?utf-8?B?U1k1N25PTEo2Q09kYnJyVGJ4N0oyZGFJd1B1dk42ZUFhWEFRN2lqVEk0UEE5?=
 =?utf-8?B?UkIwejR3YXBUT0c0K0FxbjNaUkpoN0tuKy9UQmpoUnVsSk9aL3Y0ajF3cS9h?=
 =?utf-8?B?SCtqWGlDS1JyVmNvN2hOWnB4d2k2djBBeUJpUzFSYTJaNmxhUHFJaWlxTDl0?=
 =?utf-8?B?MzNLS3l2OU9razF0Wlkwc1RxUGkwOHVmQTNsUU9ONmNCUldHbjhLY0NCVmdJ?=
 =?utf-8?B?UVR4ZkVEdEhYTmNCWnEzZFYwOEw0Szh3cVN3YkxpR0FWUmovMHBrS09OQVZt?=
 =?utf-8?B?cDZIVDVJTjJTOHFLTm5RME1ndGxvTDBmbWVTam5jd2htSk42eVc1RkdqUWxj?=
 =?utf-8?B?Tzk5M3BwYVpzQ2hFSk9laUlvWTZQVVE5MDlIck5YMndTbFR2TWdhTUVMNHlo?=
 =?utf-8?B?dlJpRWhMUzVEYXh2V3A5NkNMZjFRSjBTVG1mQ0gybFpMUTZrOFBVVTIxR2NR?=
 =?utf-8?B?MVZCNDJIdnIvQUNhR0E1RVBQV0RycGF1RCtzN2V0NVh5aFFHZ1duRERRc2dG?=
 =?utf-8?B?UHlYaWpSa0QvUkI5RTZhNEJZN1hDWVQzOTlDWmo0T2RVUHAwMkJodTFwcHh6?=
 =?utf-8?B?QkUvOVFMM2ozcE8wQk9tdjAzOUo4ZkViMlpOSEFyZ2p6Mk81QmVHMWtsWkJ2?=
 =?utf-8?B?V1ZDQ1cva2M2MlZ5UW5rZzhIcUxhbFhrd1lWa2dNeVJManY4YzBqdVljaDMr?=
 =?utf-8?B?TWtxZ2FPbDhNblh1WUsxbzVjWkZwYXgzaFZFRWpxV0lzR2lYQ3k2NXk3MGdk?=
 =?utf-8?B?cVRLVmVnbU5rem83VFQ5MlJxbUdRcEpCVTY5VkQzYlJkV0FpTkpEMzVQUnJJ?=
 =?utf-8?B?TEFXbm1LSUtnTzNvMDduZEZIbEVRSmhqd2NuczdZQjNKeHlBTEwrMVRjd2E3?=
 =?utf-8?B?dTBSalFJOWNyVTg0V3RLRzFmUVFlR21BZ0Z3M1pMSVRRS0pLaTROaFAweWU3?=
 =?utf-8?B?aUVDMlVJbVo1N2xoRnVFZ0xxVk42ek1XMmY1TjZScUtubnhXbko5QmFoZFlL?=
 =?utf-8?Q?fjmHWjXiYwJzb2X3Jbg5ofki+O63I6ajJYNr22v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c509981-ab77-4024-bd33-08d96307a5e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 11:51:15.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPLXV/Z0SKXFPfu+yTZ3hONEHS5OW4oVJ0ZGtjWyB5GGTqrNrkYD73qS8+umaIKIzI3KpLzdQdWAWsayh7tkzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 19.08.2021 13:25, Juergen Gross wrote:
> On 19.08.21 13:06, Jan Beulich wrote:
>> On 19.08.2021 12:20, Juergen Gross wrote:
>>> On 05.07.21 17:13, Jan Beulich wrote:
>>>> In send_memory_live() the precise value the dirty_count struct field
>>>> gets initialized to doesn't matter much (apart from the triggering of
>>>> the log message in send_dirty_pages(), see below), but it is important
>>>> that it not be zero on the first iteration (or else send_dirty_pages()
>>>> won't get called at all). Saturate the initializer value at the maximum
>>>> value the field can hold.
>>>>
>>>> While there also initialize struct precopy_stats' respective field to a
>>>> more sane value: We don't really know how many dirty pages there are at
>>>> that point.
>>>>
>>>> In suspend_and_send_dirty() and verify_frames() the local variables
>>>> don't need initializing at all, as they're only an output from the
>>>> hypercall which gets invoked first thing.
>>>>
>>>> In send_checkpoint_dirty_pfn_list() the local variable can be dropped
>>>> altogether: It's optional to xc_logdirty_control() and not used anywhere
>>>> else.
>>>>
>>>> Note that in case the clipping actually takes effect, the "Bitmap
>>>> contained more entries than expected..." log message will trigger. This
>>>> being just an informational message, I don't think this is overly
>>>> concerning.
>>>
>>> Is there any real reason why the width of the stats fields can't be
>>> expanded to avoid clipping? This could avoid the need to set the
>>> initial value to -1, which seems one of the more controversial changes.
>>
>> While not impossible, it comes with a price tag, as we'd either need
>> to decouple xc_shadow_op_stats_t from struct xen_domctl_shadow_op_stats
>> or alter the underlying domctl. Neither of which looked either
> 
> I was thinking about the domctl.
> 
> Apart of struct xen_sysctl_page_offline_op this seems to be the only
> left domctl/sysctl structure limiting guest or host size to values
> being relevant. Changing those would be a sensible thing to do IMO.

Yet in the context of v1 of this series, which included "x86/paging:
deal with log-dirty stats overflow" (now commit 17e91570c5a4) we
settled on these fields not needing widening. This doesn't prevent
us doing what you suggest, but it would look pretty odd to me at
least.

Jan


