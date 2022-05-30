Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953C537796
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 11:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338417.563188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbWK-0004C0-NW; Mon, 30 May 2022 09:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338417.563188; Mon, 30 May 2022 09:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbWK-00048Z-Ju; Mon, 30 May 2022 09:17:04 +0000
Received: by outflank-mailman (input) for mailman id 338417;
 Mon, 30 May 2022 09:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvbWJ-00048T-7F
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 09:17:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43cbfed5-dff9-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 11:17:02 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-TApxVWC-P0Kv-O93YHiPxQ-1; Mon, 30 May 2022 11:17:00 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4373.eurprd04.prod.outlook.com (2603:10a6:20b:19::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 09:16:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:16:58 +0000
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
X-Inumbo-ID: 43cbfed5-dff9-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653902221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvHV05W7r0oNDbvKIvPwBX3cTsKAL6QeC/R0z6RZ6uI=;
	b=Lvv+Lerc5cHxMRPdk0TQWgSpefI7z5QM1fenIx+jPwhe0cU8fA6gHj4ODNRy/hAaqFSSZH
	t3OSqUKulMptkykXopPJHgbeO6epwBWMSDuvFD1ZJVqfi0Madr0zH7v4csM/E9GXxxr6zV
	kuFHZ7NCYA3QRmWpYEykTg4plzDJ1cE=
X-MC-Unique: TApxVWC-P0Kv-O93YHiPxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iE/z9nUAa5MQDRrchdQaNbf89+BvCN25yvizK02XwM1ZNXXLkT3y/Q9ukFCTdM1Da7SxCvTrw6yooTjJH8+t436E0ILl1XN8aKEofG20wEWKTvbOTuo7WGuJRYFG1PRwxrNOatnXQp6zBeE0l5K7B7g546WXuzf1FnL0sG73PXKqIbUlRLwG5I/h7gEZLWf7NIwyIYMbPhvnKvwmVNxpGdl0LLXh2NQyGOvtAWX8ewtcGTmfcEKz1kCH4UB/hv0wN42uSFT0Ed3O0zGg+hskGCLvzEPSIwri34LSGFsL0xQVTuzKadU8EdzlkrCsiFmnLuvNHw0Xy27Omiaddhuotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvHV05W7r0oNDbvKIvPwBX3cTsKAL6QeC/R0z6RZ6uI=;
 b=iZZUvyYQ/ODYvCMws9dsquJJu1eXgnGNK6DFOm4NLB2XnbMvuIg+VNxX4OZDRbiT83/OuFp+PVCjgsoXep6ErTrlyzyHj0tPiTp5pMRZWYROvGHiNqE7sAn6an/un2Lhv4Nw9RdjbmSqnIb1UYiGi0sEtnsEYWlsOnU0ON3LN0PN/jiFdXvsZj1CIok3SteQmdCX4F2ZJthiYYS05zRNOSRDh+aa4AAbAoEb53WG7O6pVqYQSbRX+8OaAopvzOysuht8qvARAureDOhbDTVI/ENKe3kuJ9oaxZyMsmwWBBWXFfIcNSd/3JMVIpVne5xoCjJyTQvaBh6bV+kiXqD+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
Date: Mon, 30 May 2022 11:16:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0255.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 989c32ef-7f87-40c1-2d9a-08da421d25f6
X-MS-TrafficTypeDiagnostic: AM6PR04MB4373:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4373ABCE8D8811AD365CDC08B3DD9@AM6PR04MB4373.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vMplQPZiqS1wfOCASKwcZRE9wdNBSFSkfED+z5RHGVQ6URvdLVh+Q8k2ypOHz2RbtOsFC6PQfkafsAyYZ8CjRsMVkuTXBdbdA6afHcKnS24L5DR7UlH4CqqlcV+WYZMIUCkE+zc65RNU2Ahgm92pDgELUY7blcXte5pMlJs9DkAliL6dhD3ZJZdWunm0WZqyyi6GMvd/PfendVpVUU4P4gmaOi93WBH/wYTc/v9/9GNGKQABdjG1g67OmJ7vHqIYxPPOtUoPY+YTJ6CMJ1rjB9r0O3jfPU8VUKxJ7/QQ6aVCdpBgrVdl1I8w3rnyXHmfRtow+jNK5ZI72fsfK2RXUDi+3zei7NKMwEjTvieo0nPkC6XYKIlop+i/zMokl6asHm2Zc9iE3hPXjc5fd8ewQExRHCDXsGluLLVGFaNMPOx7HM9fLOZL7fEHXN5xeRm6lNi9mlU7Mv7kmGU6rLRb0SrEgGQ4JpZ3+5mY1s+cWahD9ak56F3p8T0s2s5+0o6wGMvY+Orn5w9p+mgmV6nzSjafmOjMv9c9mgGZ2wPhOd7WAb5+zRCE9LqToIdp5CzzFYWBzCdN3XWdj2rdv2KbmbYHWcESkJ5EYA1bAc8lzPCx5bp9t3ZJJneq/Im9Vjo9b9jaLfwZCgKSL7szesL+ETbNfDcoQL7AKMkFJ46QShIwWlaIbzZSmC2uI7q7BM8oYORDxZtuMtZkO/+ZdUlv5aFCa7hBMh79WuDUelj64Ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(186003)(38100700002)(86362001)(66556008)(5660300002)(4326008)(66946007)(66476007)(83380400001)(8936002)(36756003)(2616005)(4744005)(8676002)(54906003)(2906002)(6916009)(316002)(6512007)(6506007)(26005)(53546011)(508600001)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFFUMXl0bU5wUkdkYlNPSUlwbjJmRFhaYWhjSmlZTzZwL04xcUZ2K0E4NCtt?=
 =?utf-8?B?UjNhUHdJdHdiVnhBenJvZzVRczdxNnlNZVJaZXhxT3ZOcDlCOEpIYVB5M3Nq?=
 =?utf-8?B?OTYzMytndjlWazlXNnl5TWdQUDU2WG5YZTNyU21LMnZZR2hIdEs3R1dPTW9W?=
 =?utf-8?B?aGQvYy9aVm5acmg0Rkd4Sk1pVWtkV0s5eTBWUnJJTmFZUjBQcTcxWVM5WEds?=
 =?utf-8?B?TmtJMEw3NXN6WUp5bjlGN0hGRzdHenVKVGxlQ0FKRFQwajFDSm8vWHBTRkht?=
 =?utf-8?B?cWVNVVN3MmQ2Tm9TSjZKdDdwY1AyM3Q5SnU2ZnJ4MFNlY0tDWUcyeXB3K0FV?=
 =?utf-8?B?Z1A0Mm5Qek5vUEpsR0RneFFTTGttY0pUT0diTzlpQ0ZnMTJRaEY2RTl4Y0NX?=
 =?utf-8?B?NCtGRHh4ZzgrY3p6Tm9KQm1wNGJZUHNHQXZOVTBuN2xlcXU2RUtWY0JlZlVO?=
 =?utf-8?B?MXY3Q2tFdFZDM00zL1Z3V2EzcFpBV3pOSDRFemdKYUdNT2FFYVhTN2w1eTNq?=
 =?utf-8?B?MldFamNmbHkxc3NHNlFrRitFa3ltcVp5c1M0WjNUVzNOam1IVjdaQXErRUor?=
 =?utf-8?B?ZXFaWlByM00xb29seTNtdUhIMzA2RmxrV1RBOVI1NkwyYklGK0dIK0ZhQ0tB?=
 =?utf-8?B?M0RXUmQxbHc5RHFKUjFNbkU2ZllidWwvOEN2Z29pOC84UHYwK2JnTEZtVW91?=
 =?utf-8?B?TCtsdGpwSHBPTXlBamhxZGVEZEJLaDQ3SS9oWmJvNUNwWWpMWG1PaTdSOFBr?=
 =?utf-8?B?S1dSblZKY25uUUJPVTl0NHVRdkJkNmhGaklJeE05YWh2bXlzVnY0R0YzeG5M?=
 =?utf-8?B?K1ZNZ0xGRCtLZWk0Zmpsa0ZZYU5vVzVVZXZRTVNtd1RaR0VIdEQ3dmFjNE84?=
 =?utf-8?B?QnRMM1VYMUkxMkdrUHpaWmF5WDlNZHZydDY5aWYyQ2RNOFpyaHRkeG1GMzBy?=
 =?utf-8?B?MXRHUUs4a0ZlUllrU3NyZlgwTFAvWVRuSy96S1hsYmI3QStwZS9OTXI5YStE?=
 =?utf-8?B?Szg2b0xmZVBOaGtNZWxlOVRuejNKYVdaNElHaWMwS29EZU1EZzlaZjRGelBE?=
 =?utf-8?B?SDFEb242OXdpY2tFTEwvZ2VpSy9DeEl1dUJ4R3R1eFZQVU02TTZacEZLbkdr?=
 =?utf-8?B?b1ZQdllsK0t2WnMvVHJ3dWFLMm9hcElvSkxRNlpYeURSbW82N1p6K1BqZUZW?=
 =?utf-8?B?UGpPV29FeldCNVIvdVl6WEo5MDJsUjV1cUVRTkNzemljRmpLTUNoZUdzZFNt?=
 =?utf-8?B?UTE4eEovZmVvYkRRTkdDM1RGZC9zUStpNDJ5eDFZZzVZcnQ3RmNPdzYyeHRk?=
 =?utf-8?B?ZzdlYlRUaEpHMFQ4dUhCK0JjZzBEV1FUM25pQTRzUlIwR3ZCR1NjbVRWalNX?=
 =?utf-8?B?U0c3WUtzU1o2b0tRbjJ1dlc3TjBJcDRlbnorTWlrRzFFak1vbk5KYWJyd3ly?=
 =?utf-8?B?MGNySzF3YUh0K2VQd1pER0oxTk83ancrOXJRUEd0NmVtTUc4VnFaTTNXWlJG?=
 =?utf-8?B?alFIUVV5aUloZGRwRitRaDNKby9FUkxYRDFBbnZ1N1JzNStCY0NLVWpwSHF1?=
 =?utf-8?B?M3hMdkFnQ2ZLekk1R1d1MTRJb1pqcDJEVk1iR1RLbHhwWWNNdTZ5YXVHSkhN?=
 =?utf-8?B?cjU3b0Z1NExOUEQ4Tm53bWRkdlZ3S0xjS3JlREpySHYrN1hWMkZZbUdCU0FQ?=
 =?utf-8?B?cExCTjFpNFoyWUlrYU1aYmFUZ3k0WXVKeE1VRmJhK21KOWhwUUJQWkU5WWpz?=
 =?utf-8?B?Y2dUUVNrZlZwcGVtNngwWkxEQ1VNWGE4ckM3MGdUYUlaVzZ3MncxMUFhcnN4?=
 =?utf-8?B?cVZObGJMQ3gvbTNjQVRwVmZrRXZFaGw0ZmZqTVl2dTNNb3RVbWp6bFAyQzJ0?=
 =?utf-8?B?b2xHZmlvNEhFai9UOFI4eTVqQWFWUDh5Rm0yWXJLSUdkSGxYYnhXNVZ5cTNm?=
 =?utf-8?B?V1U1dUJ6WjRXNGhuc3IyQW5YU3l4cVZmVFBrQW9xcFBqS0svU1BRQVRLZzRO?=
 =?utf-8?B?RDNWTnpaeGZ5YWRPS2FTajZlK2NqNDJzZjVFYTJkWTFpK09ncERPdTFEQnpw?=
 =?utf-8?B?RklMK1h1Vm9KaDl3cFVFaExUM0YyZzQ4OFBhRWdQMDVuTzQ5NU1ERjhFd2h2?=
 =?utf-8?B?T3B6cDU3dlpXRW9yb2hsaURuY3k4OHdCS1ZETXpHOEsxdDhpMXdMdzBmZ3pk?=
 =?utf-8?B?RmQ0UE81YzdWYUltRDNtTW5EMTBWRXpTRWhKSmNzMFlXN2lpOFJrYmJoZVhI?=
 =?utf-8?B?ekxWbjFlb0JEMU54ZUV6MXU5WEc0STd0YlFhZmVkTHFlN0lEVEQ1b0tvM3NQ?=
 =?utf-8?B?TEpYeXhZK0hRUnBEdThZNTZoMjZHc3lybDZOd044WlZCUzZ4TzFRZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989c32ef-7f87-40c1-2d9a-08da421d25f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:16:58.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/pnp2+UIm4FCaf/3wDF8bxrVxuLmkBTKOE/9sAw7oCfj7yMYHUu/UvUIvNQOdeqcgs/PAfQwRnPY/uwEBzMKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4373

On 30.05.2022 11:12, Julien Grall wrote:
> On 28/05/2022 00:16, Stefano Stabellini wrote:
>> """
>> It is possible that in specific circumstances it is best not to follow a
>> rule because it is not possible or because the alternative leads to
>> better code quality. Those cases are called "deviations". They are
>> permissible as long as they are documented, either as an in-code comment
>> or as part of the commit message. Other documentation mechanisms are
> 
> I would drop the "as part of the commit message" because it is a lot 
> more difficult to associate the deviation with a rationale (the code may 
> have been moved and you would need to go through the history).

But this was added in response to me pointing out that code comments
aren't standardized yet as to their format. The alternative, as said
before, would be to come up with a scheme first, before starting to
mandate playing by certain of the rules (and hence requiring deviations
to be documented).

Jan


