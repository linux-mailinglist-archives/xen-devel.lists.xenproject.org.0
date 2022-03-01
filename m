Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D200B4C8D8A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281508.479867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3Kk-0003fC-9q; Tue, 01 Mar 2022 14:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281508.479867; Tue, 01 Mar 2022 14:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3Kk-0003cf-6L; Tue, 01 Mar 2022 14:18:34 +0000
Received: by outflank-mailman (input) for mailman id 281508;
 Tue, 01 Mar 2022 14:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3Ki-0003cZ-FB
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:18:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78687fc2-996a-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:18:31 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-61HUAGoiPaarM2g6_TOSLg-1; Tue, 01 Mar 2022 15:18:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 14:18:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:18:28 +0000
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
X-Inumbo-ID: 78687fc2-996a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646144310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvD4MMtvcaPKx23Cg8/gsE0qHf/waojcPXGHwdeZSik=;
	b=BcRxVv9Ea28e3fwyJZoda78rcxVVBvL0mrFUNv5A9MN9QVbM6+iN/+3bdfiIgfrrp3wXkO
	WprxFi5afaxE9C3Jcqlyp6AmglRV4xDiC/irXb+ozzqEzAP53RkQ2+ZSIFqfL+CJU2kNYx
	5Em8Li17MqxHbCMxg30uIbajRIFRplI=
X-MC-Unique: 61HUAGoiPaarM2g6_TOSLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fexer6soqBZV4SnTpz/iod5RtLEEaCH08Ouxsl4+7UAxFK+7/ta6y1H2edy+E6wvRJn0Lf2lujYtq4fJlW3HoZnZrgWkBHSHfWFwRINytL5rCaXZMWd7B8T7UK3BpjFLDLCLxj1SjvErK/zK/dRSJYus4Z2DUcIMgNxpO+iZ2nO6/PyGkriNZzjluOysDiUFvlvcKjOq0ak5ml7cegOnPE2xNlq72iVH02EDW+bHiDNgsNm/oOqtOrP3lpHd8ikrKdQJwg/8tDTqJFd0K/qxUYE1KGbe239afFt8M2nPQOK8aJriD4j5VGHsMsCcwZqxAEEbcPQbjsdvIAanFZrPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvD4MMtvcaPKx23Cg8/gsE0qHf/waojcPXGHwdeZSik=;
 b=NGdgHcKpD+5CqKlbHef9AbZh9bSLGI+vKC+91DcF/Njzs2jc+SYW+QAk3f2+uYiox7JEDemyTp7kWG7XTEvPO2wKE6jDTSo9YPnnJrXHrKO27HdvwWfi9GqU4oEG2F32/V/YBvOP/E4JhSanU/aBBNF0Qob0039MOYS9T/HSY9TlOGJgy6aohUbFK7kEJXOmO+O3ja7UvcwPZCrcfbe1uzDoTAG3LuKiO1cryWpzgoytivH/k8e/47F3OBbS7hG0fxBgZz9KcdBgUr5/NJmLMpexS0RlOw1mNSG0m3mToVa0U9+3vxS6g+fK9J8Iua32pQWb2/0Y12sm3w2lN4V/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40ce913e-4388-2d2f-45e3-e725a927da92@suse.com>
Date: Tue, 1 Mar 2022 15:18:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] x86/time: add CF-clobber annotations
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
 <20185a89-0a2b-6bbd-5484-31b6582ed200@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20185a89-0a2b-6bbd-5484-31b6582ed200@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0208.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 718cba1f-9da2-4f66-bfd1-08d9fb8e5b1f
X-MS-TrafficTypeDiagnostic: PA4PR04MB7936:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7936A09488C8D63B48D53C28B3029@PA4PR04MB7936.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zmUUNpjPBlumjhI7H2ojQoUKgWRUIODuKfd36lXgPT5eIiTwm9YvQ7hURXRHbXu9jEjCSmSqO7DJvVuPdKxjxN59aAAf/c8/ioCRhy1RO5RvXWP5TNSbG/PBmbiLj4/k4y15AVR3JteAS7AAuYb4Bn2L5IMi224HOuJ2R6/pmY8PxAhR4qNXdP8/WGgLpeYVf1ZdGfiLT5A2QOyPI4U8syb/c1kR84AXytND3m9CXt0Q6yZYP7ep3HxeZbI0O4tjiVwOfyafGpgv1Sq4U1zvfv/RV/RTnqdJbTkKGknnchFg5brWEx/UKULpAfShJ9NqgPlY52fvwxtiqd1lHjst/N1ySQ2m7TECvzLrCXf14M07+YECfyPP3gmC7skmAIJSsfUF31XYYSvlsTfvltPZkJxqVyhyZh5w9vJ0GOhP5h2DCqoPoOhfUNO1hvxyN9jeRIICjfAQUEKMw4bMfaviJRZe9Sq0ZjXUjB5UrgnThmCoc1qMVz204pUttqNkaCEgGINOP7lMf+L56PhBOjjnQDwi3zUgZEXx434Zdp5GI2dBhskWLi631KFH+KHT4aSwBw0cM1bP7ppymZTv0St0hnsGxfCFHeeNjObUKBBjX8QysyCdG4dPwqxb5YIP8ttbLzxg+vbCl3Vb4g/ZBPrB8Q2lz4ed7iQ1e9339r7NuQcDGVFrc08e5uT2kJURzv8cprxsKECOxnpH0PBVc3Q9/f7rLGl56zlLs9P/OWrKhLaGAbyh9szygTYIR83OkPZx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66476007)(4326008)(66556008)(66946007)(6916009)(316002)(508600001)(54906003)(26005)(6486002)(86362001)(186003)(2616005)(83380400001)(38100700002)(31686004)(8936002)(5660300002)(2906002)(53546011)(36756003)(31696002)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDBnVkRJUmpxMWtqekcrRDVER3kycTJlV1AyNGROcVVQWCtTditaOW90T3Rr?=
 =?utf-8?B?NjF6NExQeWRqdjNVelNmVHg2QW1Jb3hVT2FKNDR2a3RCRDNUMWl3UWF4V3pu?=
 =?utf-8?B?QXdzOG9FS3FZbFZWV2xhclRodDAxaVNyM2VsSUlvTHpuQmxRamZSRUlPVldv?=
 =?utf-8?B?S0VCZUtNOUxuZE45bDBvdjI3Tis3ZTRpK2pnM2ZCVkJpRUhWTU9JTEpuN3Nw?=
 =?utf-8?B?OXpKNUR3dTk4dnFxN0Znd3VCTWFSS0lkNUtQc0pjZ2hPSlNJd0FyMVJOWHdr?=
 =?utf-8?B?ZEZmR2NQaFpFRWZFeUE0bVNZSEt0MTFqZ09SK0QveURTNHBwRFZ1N0xMSU5r?=
 =?utf-8?B?V2VNcVRqbWN6bk5mRFBZYThldUZkS01INUZUZ1QweUs5MTJHWm5oVFNhWnR2?=
 =?utf-8?B?VlJ3Nlo4blNFZVROOHc5WUpHZlZBRElNN3Y2SlUzRDZiVlNHdWR2VTAvMThQ?=
 =?utf-8?B?WjNLZ2RlQlM4WTBVQ25tbVNOZzBzd29RcS9lWTRUL3hTc3VkZEo5OXhTeUNz?=
 =?utf-8?B?cjk0UUVVQnFtY09mQm5LdXB2ODlhYzNBRnhlTTA2cXFHS1JabmQxRCtHTHU3?=
 =?utf-8?B?MmtPRFMvUGZtMmJlOWg2OWJ0Rk8yem1oNHZ3TGpUeElsMnNUSXRGZkZiTU8z?=
 =?utf-8?B?aTAvWEJIWTJIMkhjVEJuclFNaXh2NXdUUks4UndhTnBxMk15c2Rjc0QvL1hx?=
 =?utf-8?B?MEFlU0ZvMHJxeFRVZTAycGRLRDZQV3loMnVjRWhlaXNTWFNKUlQ3dlhyNy9t?=
 =?utf-8?B?THdWQ2YzOGxUMWpxRXI3RHFHcTRBNjMwRkkzL3g2UVY5TFJwMm1IaWVvalUx?=
 =?utf-8?B?VUtkVlI1Z3VKdWdWU3J3SU1WeThnelpxV25Eb0hHcW9nRk5ZK1BzZ0J5dEx5?=
 =?utf-8?B?TkRMQ3VDYTNiTzNwNGIzamJSRVZlQUZzRStuZ3Ewa3lWUUxDNVNGRlhlZHQ4?=
 =?utf-8?B?Rmk5UjlLQ2NtZVlOS1c5SU5IcEIrNWRsR2RQc2M2N3J5NDVYNityeGIwdkl1?=
 =?utf-8?B?ckNsclpxeWdTUGZhbURaaHhCVVdFZy9VUXBjVENVL3M5WWIrcjZ1VENoWm1q?=
 =?utf-8?B?Vk52S25IZGpMeWtrZ1JQUE9Ycjc0K0t3eVNVU1REeU5JTHA2ZGNybzBJdzhl?=
 =?utf-8?B?RllZMGhYREV0end1amI1SExYdmJqNXRnbTRWeTdTcUtVRlEyZmQ3eXBVQ2sw?=
 =?utf-8?B?amZKSTlGWUdvSXJYTWFoWGFaSitVK0V2MEloMWRMT09JZ0sxTjkrS1hPVEpi?=
 =?utf-8?B?cmZQZk9CUkpIZ2JOMTdjYUFSTmN0WXhHSTNGcXF2VU5LT0VuTU5vM2tOZllG?=
 =?utf-8?B?MUNDdHlSd2NoMkU1ZWtEeGplV0FjRFhkQ1lCbkRVMU1VellKeTZ2K0dnL0Zy?=
 =?utf-8?B?djRpK1FaSzBZeUhiTUd3R1dia3NDVUJoU0I2OURpdlk3VHBjWDQwa3hkWFpN?=
 =?utf-8?B?bjJGZzg5M2IzQ1VDcDE2emN6M0NjNFRma2hFZFdLOG55WFJNQ3Nvbnh3VEx5?=
 =?utf-8?B?OWFSZWV3b2RDM1RrVG9PWDZIQkVjUmZyUkM1d0NBeVFIbittbEdlM3pHWlRm?=
 =?utf-8?B?QWY3TWI2VzUxR21iWHhuTmNvUWtkVnp4ZklXOEFiMEFsN3l5QTZreGNrTHdj?=
 =?utf-8?B?OGRhYUdEOGRsUWVkUDBFbzRRakkyY1JPV2dtTFRVZHFEOThCYmZkdytySjJJ?=
 =?utf-8?B?cnZJS3pKSDEzSHBWbVZjQVNWeGFwYkorRUgrcnpRTTJtRDgyUHVhM21OWWEr?=
 =?utf-8?B?NVFlVVB4MHVad3huakJHbnZvUnV2bGJYMTZVbjB5S3RIZktaSllqRnVrNnpq?=
 =?utf-8?B?RHFkSUFidStVd0xra2UrWEt3L25SMmJod2xPcEdQSTBtTnFVK2RhUnIxdnJr?=
 =?utf-8?B?NWMwNm5nV3hTUFp6eDhNenlvVU1WTWN3ZjhRMWNHZzNzR2VBNVZndXVmeTFo?=
 =?utf-8?B?ajFka2RSa1p4NXh1ZDhIRWR2bTI1NGswbjRWalk2dzlCK1V3M3RoMlI5QXhv?=
 =?utf-8?B?TDQ0cWZ4V0JuQXAxNEc4WldTSXBBdlRBTjJCYlZ3Y1lCbmR2VzNtQ1Z6UkVE?=
 =?utf-8?B?dmdBUjJoNWtzTmoyNzBpTGo0ek9abWpqWmFIekQ0c1ZhTkZIVXJEc01lUEpC?=
 =?utf-8?B?aU9BNk9odEFDVDRvM2txaDJnSUFkdWZMQ1hSaElBL2V2dzM4SERPU00wK2VV?=
 =?utf-8?Q?wYPBOtTTfMmx3rIgzmeeyAE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718cba1f-9da2-4f66-bfd1-08d9fb8e5b1f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:18:28.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +34IuQ63i2WsKdYlv9Yw7zfu5QvXEOAe5qhf4FaTtnQm4G9tA3E9xdU9EVIps/KocYKTiGEWx3+wZltnkkdgog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936

On 01.03.2022 14:18, Andrew Cooper wrote:
> On 01/03/2022 11:06, Jan Beulich wrote:
>> With bed9ae54df44 ("x86/time: switch platform timer hooks to altcall")
>> in place we can further arrange for ENDBR removal from the functions no
>> longer subject to indirect calls. Note that plt_tsc is left untouched,
>> for not holding any pointer eligible for ENDBR removal.
> 
> I'd be tempted to include it, for consistency sake alone.
> 
> It is less likely to go wrong in the future if another hook is introduced.

Can do, sure.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> With the commit message, I'm not not certain if this is linked to the
> previous patch.
> 
> Overall it looks fine, but I'd like to get clarity on this point.

Converting read_tsc() was discussed (with Roger) earlier on, so I'd
view this as a separate change. As said in reply to your comments on
the 1st patch, how exactly read_tsc() looks like is orthogonal to
the changes here at least as long as it doesn't live in .text.

Jan


