Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4D4785B0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 08:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248450.428569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7w1-00066n-38; Fri, 17 Dec 2021 07:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248450.428569; Fri, 17 Dec 2021 07:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7w0-00063s-Vm; Fri, 17 Dec 2021 07:45:44 +0000
Received: by outflank-mailman (input) for mailman id 248450;
 Fri, 17 Dec 2021 07:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1my7vz-00063m-05
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 07:45:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 556867e7-5f0d-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 08:45:41 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-SRvdX3doMpeHhn2cOvbgag-1; Fri, 17 Dec 2021 08:45:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Fri, 17 Dec
 2021 07:45:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 07:45:38 +0000
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
X-Inumbo-ID: 556867e7-5f0d-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639727141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcUuXRJge8RWhJbZRHFg8OMe8tfU/g5vm435YLV2DEw=;
	b=GmxxdIcq4/dhdQJmLYwDWps0FHEWsCw/wFYSTeVB1n+diLLSNE/dFdKOaPh2b8/pGhxsfy
	aUerMJVQwPPcxMpD655mYa8AbKqsaooWQhINYoCmMGTCfXosHsoF0LukkutzEmI/rrMx1L
	okn6nYoRouanf08EkMaabPBJEooVw6I=
X-MC-Unique: SRvdX3doMpeHhn2cOvbgag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVu0FHmLwsdjT3lRV1s1qUuuiZgXiuv+4JlUiREON3L66hT59fKXsHJ2rfq2p2JmvodV0dsarMvWM/OcsbswWHOeX4VOdpItEQdg7qx9hZ1ctSOA5axyRtRWz/6kMvOJAM+rVRWG1EhwhAZpnttp1IvXMlx8BU9Z1rkDDETqTPZS/LKSWLctyzdPjrC0Kemj6b3AJOpmJNnJR12Ux5PKyHLa0/0cIH/6hN4Vd+CZxOyuvktGdfkeKRpLvGn1+hoabvV5n49l8rilfYrIvG1C0NtnKYTt7b1Y83Sy1WYp2VYMTelfbPPSkgprZzLEB3y9QR+NEkl6FFoe/sYMFbxCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcUuXRJge8RWhJbZRHFg8OMe8tfU/g5vm435YLV2DEw=;
 b=Bk34KXFISe+4EsRKvbt8HW0GQLWwx327GlfUjuE4u6yLXGpcR6YbOuc8thdoMIW/DOgBTo7cvg4fRfdPqfKkE4hxRXd9FHR0nXyhOrVffG5DPrt0TjtbvKGoZp/DjPvocD4xx7tWYy10Qrgmm2dE59FUylNBvCCp4BTimuzB4avxzJKLlfGKpUiCfZRGcdjlJhMoVXUuQoj/s6nT4kOZwQcpYNqoU6xofGzpLv6h7/JtBCquUYwbnkdzeJHF96pJrwHye0YePmEbRK7gyVQPSqyja8tkwjXvTu1tcBYGM7cCDKUozGyvA97V5rWAkFM37nbjsd4+K4DPTL6+/YUn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>
Date: Fri, 17 Dec 2021 08:45:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
 <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304fc689-83e6-48bf-edea-08d9c1313788
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71502250D8ECD90ADC73AC16B3789@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PmLdjnfuuIv7y7decwER5DWKKcA5B+Kd/g/gSzP8neTJ+srLfQSiDJ4MAaQ9deIPxrmzDAJf7k7+seMC0+IK/a/8lG/roipDQJAtly5jHct92tRH/Hjq+0rY15fHNYbzQxptBjMAQL0+8hBIanZuXpftlJyULY0wk2zdwFQHv7/2XvjQLsUoBi6rlEtSIl4pEidbxRx5pBx3oAUKypJEOk8ElwIc/3tYsP2ccrZjvh65Ga73Ly4PqXOA3hFVDlTYwW2qjc5ihYD2ja+NtDG91mvFFUXSW6mIZmValEpCWEbdxTuokpxQy2wXfTpmm3XBQQr2Jr2UtZO89FzpS5BuuU0PUoBiQLGyzpqIgIrm7MQFIVTaSAFae5zmgWIOAaBzt/2dtjVeX8NzXQG/pg9xEIVmAjDCREEGZ+MmMvVqae5+iMtf/z/89k107avrd6UwhUvh4mCvLTh+b6IhyK7tJG9lO24s7xgRMbrhLSmCaKUSxiBtZQzUSz+3JjBGGXwZsk7RG0qI0z3wYLtuftEuQn6D7IS997cQOASGvHrLWoGOMMFyLGlnaR09oKNubYpC7jBKedfs1fBmMwT1IH4AQ61qZLe8fNMzvsmH/UhmR1N92/drr41f2S9hHUSfNkB1nfwTyMLybcup40XxbQfHep7X7AIbDAkgeM5YWOGWyYD3aqiYypDgGL85VcR+yZ99+7wS/qbf4EFYFMayQCsd8DWHC3Ctq9D9FggikMgLKRhJ6At9ErszQb1IQ2piAhKj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6512007)(37006003)(5660300002)(4326008)(66946007)(8676002)(66476007)(31696002)(66556008)(2906002)(316002)(6862004)(38100700002)(36756003)(8936002)(54906003)(53546011)(31686004)(508600001)(26005)(7416002)(6506007)(83380400001)(2616005)(6636002)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFJzRk1UMmRSenVLTGh4MUFZR2pXZ3ZWZ0VKKzlINUZaU3czZ2Fkc3ZWWHZK?=
 =?utf-8?B?eTlaOC8raWk0YmliZE8yNGxjSGVXd1dzUWRaS1Y5TmJkQVBjWlBzSXArT2t0?=
 =?utf-8?B?V3lCYXJTL1ZXYjRBT0c4alBmQmZvS3ZjN0RIaXpNZW9yNkdoZU5OZHdNTkpO?=
 =?utf-8?B?RFRhQ2tRdURFZ0ZvSzB1YllRbnU2akFSUnNrQnVJSHJZaDNDS0huaFMyU0Qz?=
 =?utf-8?B?Skp5SzFmaFRzK2xFRFVuZmtMVEMzbDJxaUd3WG00VnF4aTBId0Y5T211RXl5?=
 =?utf-8?B?alNIci92c0ZyVmdmbWNpWUU5eVlRNDRhWnA5cXBTNkVtMjZxdi9qbWdSbTl1?=
 =?utf-8?B?TVd1cVFETC9JMWNKS1MzQ2RjUVNXYjZ2bTdsOUdTdkZyQVR5Z2pxNUNHdmVi?=
 =?utf-8?B?cGI2WDIyUnQ0OEVTVnAxNlNSblBtWHlHTEFaN3R1dytHWXoycjdoRWNvaUxK?=
 =?utf-8?B?dFczVUgvZ3BoOTY4cUlUUE9nWjRrOVlDYnB2N3MrV3ZGTXJEaWdvWGpBMEw5?=
 =?utf-8?B?cncweDhCZ0VFTmlUVThGWE1HU25UN2hjWEZFOHM5ZjMwTmZSS2N4Qy9naXVG?=
 =?utf-8?B?MDZPRDZ5L2lEY2l1YUpzRzBndjRvRmtKSGs3RVNFQkhpSG1oeDc2Lzl2ZGRl?=
 =?utf-8?B?ZFlUQTh0aWxUcURTV0ZIcWpyUU92dVlsd3pabmFmUkFzZEtFNm9rKzllOXdD?=
 =?utf-8?B?YVI3dHZjOUxBdStiY2ZPQ3IySmhUalFaN1FnVlRZaTV5byswTzVHajhidytt?=
 =?utf-8?B?cWFHazE2ckw0Y0pKYmVSRDErR0xFdTNpWFhuVTdtMjdIc2pTWkRsWlB5Rm1J?=
 =?utf-8?B?YUlNN2FKMnNiZUtWOVA2azg4SEx3T0ZKbCtGMjlFcWtwK1lBcjRLUDcyZG5B?=
 =?utf-8?B?ek1FdFR3aVhFakt4bXVISTR2SG1iK04valdlcUNUbnRnUjFtQTNnZCtOQm9p?=
 =?utf-8?B?cThoTlI3aTNmTHlydFZPK0FLSHNieVdSQTBUcmhyOTRGRk82blgxZlk0dzEy?=
 =?utf-8?B?cWEzWTBzaXRCd2pZZWlaNXl5ZzBPUzNmelNvdEp0VFN3N3pTOW1IZnJGbXF3?=
 =?utf-8?B?Ujl1Nld2Q2ozR25NNlpjYWRjcW5pZEFaN1UweWRJeWdmRGZFeUhXZ0NuamNS?=
 =?utf-8?B?bFQvMzl5ZzdpK1I0R2ZIRElITlVSS2ZhWFZ0ZFNiT012VDBBSzFCamZIOFE0?=
 =?utf-8?B?YXpReHBjUDFoVExSTFIxdkVRNWFYNE9Ta3JQdC9vck51OW43R2h4MUZGa2V0?=
 =?utf-8?B?ZEdOdmRJd2dZSE9LQktxWHBmWkRjdE5pYU9RVUV2RkVzeTlmQ28wdzgxL3NL?=
 =?utf-8?B?S0FQUVhTTDcwNUp2amx0ZzZBM1haT3JQUSt4WVdWZXlwR010blVucGh4eEd6?=
 =?utf-8?B?RFplOWFCOTZOZEE4Vkh5aW1XQWs5NnhGcGlBWGxndHJtT1NaWWdKYzlVYjdE?=
 =?utf-8?B?K3RlN1RBaEoyQjBaN2ZhTHFMa2V6OGJPTUh2RjNaUzVhU1QxVXRjdVhjYjhx?=
 =?utf-8?B?eXp3S3laU1doNVYwQjZMRXlhRmlJUVdsR3NyWkZZYzFVNHgzRzBLSTZONmR6?=
 =?utf-8?B?cHBmNGlKWTZ2cFVLbC9DSjdsZSttb05oOUlyOFhqNE1aOGw3VXY4TG5GVURI?=
 =?utf-8?B?bkNhS1VMM0VjOHFMZUwyUVlMKzkwWXA2YVN4ei9VbUdIL01mVHJKbk5CU1NK?=
 =?utf-8?B?RFhCVjNETHdGdUlJemMxMTk5N29KWUFYV3lpU2dGZ0haQVlXZ2Z6a3dzWHNJ?=
 =?utf-8?B?SmJibkVaVCs0RWUzcFdkdWNKMVZaN0JmamhGbmdwS0c3UVkydHFlSXFFWmVM?=
 =?utf-8?B?ODgwSG5wSDVCTmp1SE92K1dTb1hQbW85NUhCaFFMS0w1Rm1ZNGZ4T1JQMnUr?=
 =?utf-8?B?cXpGTGFmY3RKcXoyWnVpYU5pSUQ4NC85aGtWVkh5bEpJMWVqZm1CWklmbVd2?=
 =?utf-8?B?WEJhQ0Z2cDZVdjV3VTUySG9EbnlZcjNwK3JrOGlJYitpYVpUN1VyOXZNbksx?=
 =?utf-8?B?MEpNUmhiYyszRitmaDNoaU9GZnZkQkEyQnJtN1pJNllsRHpmQUExQVhYbHUx?=
 =?utf-8?B?aUpqVCtRV0cyVWxPRFI0UzdpSmdzR0xxZm5FcG9nRW9PQnZhWnRuTTN6YmxQ?=
 =?utf-8?B?NjJvKzljMkVsUEZGMXY2dHF0MEFJT2NrNVBDZU1FcTBDQkJObW85ZWhqQjNM?=
 =?utf-8?Q?Mu1Dl5bCKZ2Pap4Xt1Gw/CQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304fc689-83e6-48bf-edea-08d9c1313788
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 07:45:38.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdeA7laYw9gqAPQI6xOjEIHqwpzOGsHvRAZK13EMqt2CaqP3uLwfMSGarIM20RxtSODz89crY4+4pCrFBYwnxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 17.12.2021 06:34, Juergen Gross wrote:
> On 16.12.21 22:15, Stefano Stabellini wrote:
>> On Thu, 16 Dec 2021, Stefano Stabellini wrote:
>>> On Thu, 16 Dec 2021, Juergen Gross wrote:
>>>> On 16.12.21 03:10, Stefano Stabellini wrote:
>>>>> The case of XENMEM_maximum_ram_page is interesting but it is not a
>>>>> problem in reality because the max physical address size is only 40-bit
>>>>> for aarch32 guests, so 32-bit are always enough to return the highest
>>>>> page in memory for 32-bit guests.
>>>>
>>>> You are aware that this isn't the guest's max page, but the host's?
>>
>> I can see now that you meant to say that, no matter what is the max
>> pseudo-physical address supported by the VM, XENMEM_maximum_ram_page is
>> supposed to return the max memory page, which could go above the
>> addressibility limit of the VM.
>>
>> So XENMEM_maximum_ram_page should potentially be able to return (1<<44)
>> even when called by an aarch32 VM, with max IPA 40-bit.
>>
>> I would imagine it could be useful if dom0 is 32-bit but domUs are
>> 64-bit on a 64-bit hypervisor (which I think it would be a very rare
>> configuration on ARM.)
>>
>> Then it looks like XENMEM_maximum_ram_page needs to be able to return a
>> value > 32-bit when called by a 32-bit guest.
>>
>> The hypercall ABI follows the ARM C calling convention, so a 64-bit
>> value should be returned using r0 and r1. But looking at
>> xen/arch/arm/traps.c:do_trap_hypercall, it doesn't seem it ever sets r1
>> today. Only r0 is set, so effectively we only support 32-bit return
>> values on aarch32 and for aarch32 guests.
>>
>> In other words, today all hypercalls on ARM return 64-bit to 64-bit
>> guests and 32-bit to 32-bit guests. Which in the case of memory_op is
>> "technically" the correct thing to do because it matches the C
>> declaration in xen/include/xen/hypercall.h:
>>
>> extern long
>> do_memory_op(
>>      unsigned long cmd,
>>      XEN_GUEST_HANDLE_PARAM(void) arg);
>>
>> So...  I guess the conclusion is that on ARM do_memory_op should return
>> "long" although it is not actually enough for a correct implementation
>> of XENMEM_maximum_ram_page for aarch32 guests ?
>>
> 
> Hence my suggestion to check the return value of _all_ hypercalls to be
> proper sign extended int values for 32-bit guests. This would fix all
> potential issues without silently returning truncated values.

Are we absolutely certain we have no other paths left where a possibly
large unsigned values might be returned? In fact while
compat_memory_op() does the necessary saturation, I've never been fully
convinced of this being the best way of dealing with things. The range
of error indicators is much smaller than [-INT_MIN,-1], so almost
double the range of effectively unsigned values could be passed back
fine. (Obviously we can't change existing interfaces, so this mem-op
will need to remain as is.)

Jan


