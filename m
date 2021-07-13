Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B466D3C738C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 17:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155498.287032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Khj-000307-Dm; Tue, 13 Jul 2021 15:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155498.287032; Tue, 13 Jul 2021 15:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Khj-0002yB-9q; Tue, 13 Jul 2021 15:52:15 +0000
Received: by outflank-mailman (input) for mailman id 155498;
 Tue, 13 Jul 2021 15:52:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3Khh-0002y5-Lv
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 15:52:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49625a36-e3f2-11eb-8778-12813bfff9fa;
 Tue, 13 Jul 2021 15:52:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-Aa9hmHAYMcKSR0EuWBX9tw-1; Tue, 13 Jul 2021 17:52:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 15:52:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:52:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 15:52:08 +0000
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
X-Inumbo-ID: 49625a36-e3f2-11eb-8778-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626191531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4kWRIDVcbNzl4v12lZZtVM45qrpJCA3fYxM+m53KQE=;
	b=RVLD2mnjQ9RKkGxvbGVPfyOJw5nVXu+6K0teb2dKZTZ+BcfMC3+ZH3N/Gp3p6uxUvbmc7X
	ibDFkoaXWYTpTi+/5qzAt1qGHUSezo6UJDArf5btOen1rcIb+GkK0bo4dJ6rpVz476Yap+
	ETr6dVNfI/mNKGVajg3uZ2JoyWz02Ao=
X-MC-Unique: Aa9hmHAYMcKSR0EuWBX9tw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iERb2B4OeH35MQ8imk++0xJuVD4dOhQS//biFIIBJNhQ5Hw6vV2IzyY1vYBApooDRIbbOv638DDA2mraY6ndy2PGuvbYoBRgcVkC5YHmPZm2bHLzCXXFbnb+W1uGVgMvUgSrYkbejNH5FtW0ojfmrTy5czBuaHUisop+B/yb1XNaInNgB0SD92OUsR6U1j+K/NRjIxPAkBHHLvPuBSCUcUagWAFuAcytxbcvE/+mvm5k+vUTXZANJqVrCgqSVyGDjgTjarl+RjliwjBkAilADwU7qAVym2OlwdHVdRMcRlM14QODZhA+ZPIgJZdU4YucnVUxiL+NFvxXwxuT9jI6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4kWRIDVcbNzl4v12lZZtVM45qrpJCA3fYxM+m53KQE=;
 b=NguPme7hxceHvAMu9QouzDnAzNDBikdbHS89v8RGVsTeB8YjSMLjaA4JNyda24Ul6LJxb5izuB1zdSrSxX8PMSG8osupsCo1THuKBV92wKuF/JCvEcQLx+PvITsyaguhN9DVi6qDy4RiwtB2Y2vxocqlYo/jJGs0puwsWTBNApjVAccJUO5beybqEr/zPd+EJ/ybbVWW8MsB3cz0kqDc8u3ZitY1jFqJatAwFQebzscTg6BYzmiCoH7fPKph03+MsD1YCkIIgICh5irRMWSlFjOUvqnXyTe7+oVm2V9+1XUSFpGbtlUsDtIKz973CX2NwDLwUBExcPmttNJsm83QqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Juergen Gross <jgross@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <ce9e3ba3-7e1a-b592-7e9a-e35099c8d483@suse.com>
 <b27990f4-ac98-8221-ddb8-fa4699a0d43b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c6afbc3-4444-7c3b-d6ef-2d3a2baa0b53@suse.com>
Date: Tue, 13 Jul 2021 17:52:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b27990f4-ac98-8221-ddb8-fa4699a0d43b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03762694-bc46-4e6a-2a78-08d946162be8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829C12F66744835C53CF04CB3149@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2eEqwmEnvsA6h6TggLNgDr6V+uhF3hbCk04Kkp3CCAUufU3QG9HYvnZxTLR+4Sl9lZm8IVrBSvfyXWgdZtUIEnVcn8E/NgccTudL7TpCHu8ygy30P9wC+Rjw9PtvQybG7pXalrrJZgu3oTUoGpQwRu9IuVXW2uYEK+nd2CFtCf6gJmNdRnLbfwpCJ2prp28zBd3poUh4QonUZhKm0LdxLRzdrtOXlWcra32ZdAIBeH+aO7ZqZJ469KHg87Rl2a31EkNVW/oJcF54kq3HcEF8MWLLIe0Bfa20jwRnqddY8iPyDhiZ0mN+EXxcfICZmxNExIf5AoDsrhB2hC28T9Xblj0tRh48i3e/u8CZnr4w9YR1UPlXKDYOqVWDbOTnLTaM6eNX/3pl0rValQBIohu7vHSeEh79zA4Lyjq5JxAqV7q09M90niMHz93oR/rfG+5y56E/BClXZMvSzWiJpIMOCaEWGtdS3iS0ho1aJhXnZx1AQKgGMvHVEUsxh0NqQSIdDcvM44Jr77zo9Qt/pjfq494G/+nD49JMoYfFnLGp9YE8bPM+3+lDAjTjY8zRMzZeyk5xQCMzbzu/TJU2zrz6nIL62cI4gZpmR/hGPwGxQQIjAYEzY59lx3so2Clb9JIGiEl1SnqAawrQC3r3jOztBwomg/HqIdnSmZYUQvKi9fPgJHdPC0kOhKrEGF/O0Xdxd4wyHp8GuKxtNh0LGpGY3qcOdyq6HtTaDafOy88owd21dhuh9O18ZtLmQBhHOJBantO8rUQ+xiRWLlrJq2pEag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(39860400002)(396003)(5660300002)(26005)(6486002)(2906002)(36756003)(8676002)(478600001)(186003)(6916009)(66476007)(31686004)(66556008)(956004)(66946007)(53546011)(16576012)(316002)(54906003)(86362001)(31696002)(38100700002)(107886003)(8936002)(4326008)(2616005)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFgzVGl5YXpjTkRpNE96Q3BPNEJLRk9JaGNrSndMeXJjbUVYdGVDa0xyR0la?=
 =?utf-8?B?VFd4L3BPRTgyMUVzM1VlWUFyb2JKRElvWTZyVXlweVVxbXU3OExWKzlwRWkv?=
 =?utf-8?B?NC9NTEMrTmo1UXoyQXJhSFg4b08yZTJicUNHWWpHcnZvNERHblZWUXpUOUxY?=
 =?utf-8?B?akp1QUhiRkRiNER3bDFnY3dvdzRka0VWSGFleTlacTBBQ3BocUVzK0gyTldy?=
 =?utf-8?B?S0ZmUHMzRlg5dlJjcy9GcGFMQ2NmMjZDY3VMVjUzL1cyRmxGb3BldXZhdEE0?=
 =?utf-8?B?Q29MQkJ2NlZObWhPNHUvSFoyeTMvWitxM29ZQmpvZjRDWnFvY3dXOFdRbHFB?=
 =?utf-8?B?blF5Z1VUWkRuczFyM0lPbHhXRWxDbkVXSy85RjhQV1VjRlduRmtHdXVNTFpP?=
 =?utf-8?B?amNSWUxxMmlZRzRYRjA0K2piZFYxSmFVT1ZWOWd3MW9TQXlGTVFaSmd0ZldL?=
 =?utf-8?B?T0hjMS9pK3o2M3dIdStoRUZBVkpQYTlsdkdpNHZGQVJPd2p3SjBSbHJiNmh2?=
 =?utf-8?B?bWk5L3BSS0lnUHFXSW9GUDlJL29lOUxHZ21EaDRCcElQU3RVZTVWT2xCTmhs?=
 =?utf-8?B?dzRGYXhrQ1VzQ2RVTmRFdnJCSWxjQmh3YzVET3dxY2Y3M1pGMVNnQk1tbldC?=
 =?utf-8?B?Z042VDVXYXNMZXhxcUxKWDlwN2ZKMjBIa1lVV1RLc1ZVTDJubVppelVDcWZW?=
 =?utf-8?B?Uk5yYTdCZWFob1ZGNVlodm9XRlhORHZUSllmTlhRa0FJNTJxYmxScERIQXhh?=
 =?utf-8?B?OGtBL2NYNTFmTW9NQXBSdzhyamZvNkM3MUJ5ME91clY0UEVzc053eG82M0Ny?=
 =?utf-8?B?bFphbFVUd1dUMUJBLzlpaTNpNjQzemdqV0k5dWNRUG9KbzhiTGdUb1BpUVVN?=
 =?utf-8?B?c1V5QWtKaVV3L0FHNllwcTBaV2NnMk4wam1TQmtkbTVCdmc3U05zVUhLb2pl?=
 =?utf-8?B?bVo1SDAza1FaZHlOWWFlU0NvZlc1cFU2Y2RvNSsxSTZkWHVleEtFV0Jvbzll?=
 =?utf-8?B?MWIrMlFrdHhiaGpGci9YN0c2bjFYZzVtMGZvdUVoZ1V6YkwxTFlMbzZXMFdE?=
 =?utf-8?B?bmcvS2FyTERNMEo5MjVhN0dQZFM1V1dmK1QwdURSMFNvMFYwV3d0eEFvc0JY?=
 =?utf-8?B?K09lQ2xRTzhoRGRCYlFBQld6bVBmUXJ6RVNZWjhORGQrdi9CQ2RWbTNYbjBJ?=
 =?utf-8?B?M1I4SW9tbDBpV0JrUXNDb2oxVDVRWDVqZ0ltYnptdU9WREtJck52dzNwSWhs?=
 =?utf-8?B?Um5yQmlMK1hubVk0QzVPUHhOSVU3NXh5MFJndm9ubnlRQndKZU1CYjdJWmZD?=
 =?utf-8?B?UUxTQXZxMDdwV0ZoYjNCL29DL1RPajhsNzB0eHNNenFPbkdndE9qczNlTys4?=
 =?utf-8?B?cWtBWW5zM1RJQ0hXMUc2MkdlNk1GSnpHa2ZLUUkzdFc0eVZMbnAyZ2hWbjdK?=
 =?utf-8?B?S0N5V3hsZE8xZHhrQjVCbzFCV200NEV6cy9PMjQ1Y0NYZGRMZW1UUjk3WlQr?=
 =?utf-8?B?eUw5NURVWVhUZ3dURmxRR1JkVU4zZFRJU3RTTFVUWXNlUHVFbFB4TndwdmtQ?=
 =?utf-8?B?QWVMQXZBUlBEOTBEeVJTWFlCRWxXWlBBU21WRXRJS2VIYTZhTVU1c1JXbkNX?=
 =?utf-8?B?TVVFU2M2d1JRMVlxRit3TnpmZ0hiZ2VxcnVlVUFUZ0l5SnBNK21WTkZpVWVv?=
 =?utf-8?B?VmJkQkZFL2hWQ2F5eUY1M0M1MEVXeXZkU1duTTFCeCtWR3ZTSHMxUGU3eUx5?=
 =?utf-8?Q?8waR2uwWgVH+7cQ8vyw1yAYdueks4toMA5g2qgt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03762694-bc46-4e6a-2a78-08d946162be8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:52:09.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdeZCww+HrMpHERzhnWfyRybjhKrODS4n6t/O4onQp3ZKcseamZD4xs6hUAMZgoCfvXtAiOG8o7zhrQ3VQrErQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 13.07.2021 16:33, Julien Grall wrote:
> On 13/07/2021 15:23, Jan Beulich wrote:
>> On 13.07.2021 16:19, Julien Grall wrote:
>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
>>>>
>>>> Even that doesn't seem right to me, at least in principle. There shouldn't
>>>> be a build time setting when it may vary at runtime. IOW on Arm I think a
>>>> runtime query to the hypervisor would be needed instead.
>>>
>>> Yes, we want to be able to use the same userspace/OS without rebuilding
>>> to a specific hypervisor page size.
>>>
>>>> And thinking
>>>> even more generally, perhaps there could also be mixed (base) page sizes
>>>> in use at run time, so it may need to be a bit mask which gets returned.
>>>
>>> I am not sure to understand this. Are you saying the hypervisor may use
>>> at the same time different page size?
>>
>> I think so, yes. And I further think the hypervisor could even allow its
>> guests to do so.
> 
> This is already the case on Arm. We need to differentiate between the 
> page size used by the guest and the one used by Xen for the stage-2 page 
> table (what you call EPT on x86).
> 
> In this case, we are talking about the page size used by the hypervisor 
> to configure the stage-2 page table
> 
>> There would be a distinction between the granularity at
>> which RAM gets allocated and the granularity at which page mappings (RAM
>> or other) can be established. Which yields an environment which I'd say
>> has no clear "system page size".
> 
> I don't quite understand why you would allocate and etablish the memory 
> with a different page size in the hypervisor. Can you give an example?

Pages may get allocated in 16k chunks, but there may be ways to map
4k MMIO regions, 4k grants, etc. Due to the 16k allocation granularity
you'd e.g. still balloon pages in and out at 16k granularity.

Jan


