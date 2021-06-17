Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9993AB76E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144064.265235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttv2-0008Dd-OA; Thu, 17 Jun 2021 15:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144064.265235; Thu, 17 Jun 2021 15:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttv2-0008B0-L3; Thu, 17 Jun 2021 15:27:00 +0000
Received: by outflank-mailman (input) for mailman id 144064;
 Thu, 17 Jun 2021 15:26:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lttv1-0008Au-Lj
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:26:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 653f9a43-12af-4f42-b663-cde94bf8f718;
 Thu, 17 Jun 2021 15:26:58 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-m6y2IWkkPjW4X5CoyqzPfQ-1;
 Thu, 17 Jun 2021 17:26:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Thu, 17 Jun
 2021 15:26:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 15:26:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0015.eurprd09.prod.outlook.com (2603:10a6:101:16::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 15:26:52 +0000
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
X-Inumbo-ID: 653f9a43-12af-4f42-b663-cde94bf8f718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623943617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDQwX7dHwh3cGulwT3yX6Ge6wlI9RopclW9K6b0DM2A=;
	b=G6nMXWLX78CagCspCKQiHA0udG6R0AHUluGYMo9GPcBATQnaMLE9cxaaZgeLGtO2ot20CP
	SOGLChfVDixyMHYsKXu6GEkMK2l3l7v14UQN4IJoBS9TB8aZckWG2zwDmxFUA90/eZDmEO
	Ovh7cTDmIDthoIi+bIl1739qHc6G9xs=
X-MC-Unique: m6y2IWkkPjW4X5CoyqzPfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwoXRd8xSJEWixeqMokhaA7JKa4R+UOE1f0SZaDpteoMwuo2kuvDWpf8mYdTRSlTivNe6FQxPllkOX8Gs2VFbUBzKNkkUMRq8jA/I6jFgeMldhxKEgoKKpSMuEMDsrKQBpp+7vLxwsAyUMxbo8qvWaTMHXSnHjdHD7Eu8Omv+q1lQcxjeoFB8QtMXulU/oicYQGCnJetMXHg1wxEhtRY3KR32CJ0UhdmWfrpsxCysmLFOcuZHr6tlQ3JTE8RG2xMGI8zuTXrpZcrZ9rMEhMOgUPN8S6k1RrxhrU2Qm8UlWLEeDBYij++/2mrdDiB61XHnWTsrNeP1ijlD+JQFd/8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDQwX7dHwh3cGulwT3yX6Ge6wlI9RopclW9K6b0DM2A=;
 b=gfjk/HEpeH+7AVOtHaFzaHouIcLirlBCP5oruwAbl/K+8rYVqJmryyaCKbleQ4V7LOME0yNEBtgZ5tZJ9D04ArJBx5/W3frtReFwSSyHHc+8pcJdRnekYzaRU/1FssUQjfwCc0OWvE267La6eph8vfykqBZNtQl4Rki8H3horC1lyEqNXVzA1nnaya8tGeU0TlsS2uHCGRE5RPuUJaj+Pt+ZKXjMnhP94PIs+zG0ybMKQmosR6f1NiaUJyPe3OJ0t/EI5zOqT6wuYJcnPuzApWRboW3Ns4diVNZ8QoeSOm27rdMZ7ePSvU5mH9+5RAFPG8ZUR8QdSzU6y+NIScp7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: hypercalls with 64-bit results
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
 <cf751696-5c9b-b465-67d0-544245d8563f@suse.com>
 <75d84a60-1857-f62c-23f5-eb3bfa3b93b2@suse.com>
 <c151faff-5ff2-af59-fe95-1675aeb5be33@suse.com>
Message-ID: <d956f5e0-3640-df99-df39-905652713e7e@suse.com>
Date: Thu, 17 Jun 2021 17:26:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c151faff-5ff2-af59-fe95-1675aeb5be33@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2PR09CA0015.eurprd09.prod.outlook.com
 (2603:10a6:101:16::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ce4bda-a889-4f53-9792-08d931a456d5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63848522AA68BA45964A79AFB30E9@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sMdm/xdRa/lSx1U7dnCetSn3GaUd4AV2o91pRglafhmIl3FID+b1EBKbsxPwqMN30rdXGMNip39DEy2ZhtKr8YpUB2hFxGHERWszb/2MG3P8A+lF5eGsX1pJdL7aJsNOMklACS2CZCyFsZ34ldnTbKaf4mrkJzhM67ZMLGXVVh2qnaR6RAxakAgMBJAC1Rt29PmPYLmu/112L6T9SgI5s0aOl9u6DNoes/jYp4g/pkxPpHjp+AFlHeOUfNESDfAc4COg25OcpdfWjeniSj9T22IGxZv5Ticz9mtrLcs01k80p1T5QAn3UIT2A/myEhE00pdrSMt0WgdLTL1yj+kRSy/OeRqLsOd2m8qmWSLvCiGM6zm/RfTq8SXsgTrj11ODAwmAts9V08tS01cPZULHjxuI9ZrnmZcBe1Q8TLxXcXlV4EavAoIUvXhG0Vmq3+C4sxhTBJkCsv7muEatV4k0ZGVOSnuxlteLRxA7Vu7V8Mg+SRGFp+wax8QDdDOia0m1OYULncl4DnadnVjgMB27bfJiuratTB3PbNo19xbbyJounohZdgIK2adJuPhA+4VhqNu+QSdiFixahHxVHek+X6EuCDc60JsD9WH56Ud+fQMgGSuUaux4zSxmVgf7scI4V6e9spwoA+WftN4azluY6oWLSYJ3f5xi6CnbI0PdxRcQ0RqhvsyeosLhAWyqoBDN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(376002)(39860400002)(346002)(53546011)(8676002)(6486002)(36756003)(86362001)(26005)(6862004)(31686004)(2906002)(31696002)(16576012)(316002)(66946007)(54906003)(478600001)(956004)(16526019)(6636002)(5660300002)(83380400001)(37006003)(38100700002)(186003)(7416002)(66556008)(8936002)(66476007)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHAyTmpOQjRDMnozdmdkTVdYWHlCT1k0RHpFaGc4UmV3M1gxMWtITkx1ejlB?=
 =?utf-8?B?YVlLUXdXQnBHeWNSSjRrMmpMbWtVYzF2VGpKM1N2VDBRKytlWTUzQ0JpRGlv?=
 =?utf-8?B?RVRyU1dEL3pyK2JZZU1jZmd5bE1XaHBXaGRDalpyN0NkU2dWeURQbVpjT0Zm?=
 =?utf-8?B?YThwM2pONjNWVkJzVjFubmtjc0ZialBaMjJpMytkWUlFSGtrSTRvaG14aFZM?=
 =?utf-8?B?WG01ZnpoalhWQ2R6SVk4L1BBbDR6OVdJSjlJN0lWcXpiMFYxTFNoZHF0Q2hT?=
 =?utf-8?B?Ny8xUFdER1dLOXA3ZU1PSXBjcXk0bDRLV3Z1dDRkNmhVK3F4ck1qYytZQ1l0?=
 =?utf-8?B?elA3MTFjY0N6Z2FyM2tBVkpoQVRZUzFGL09kSjdFbXFOK1VLc2FKL2s0TWZx?=
 =?utf-8?B?UmZRZUU1VWRNN2tkMzlFWmowYzBZUEt5NUVuR0xyUXJwUllLbFQ0d213UGls?=
 =?utf-8?B?RWlNSy9yRzRVT0paRWFITDhoTDNUMmxhRDEyaWJiamVCZmVHMisycytPbGRC?=
 =?utf-8?B?dlZMdlZMc0NuSjM3NklkYkJCTHFlOVc4QkUvcVNKYjYvZ09pOEF0eEk4MUJL?=
 =?utf-8?B?KzRmSDJzSHVnN24wbisrd250cEVpNG9LS1A0bVM1WnpWeEpzWGZzM1pRNWF2?=
 =?utf-8?B?SzZYTWJLNWVrMFJ5d29HMVBoRDRDQVJzV3NpdVhDM29lZDRqektWZU43Y01v?=
 =?utf-8?B?QTBjc011aHlNOEI2K0lYbi8xaFVSRzFKLzdDMlMvSm1YUElyT1ZORWRkb3Z3?=
 =?utf-8?B?VHVvYUN4ckl1VURKbUhQOGo2NHh1MVBzVUh6RnovRWFISFFhQmZYZ05XUDJu?=
 =?utf-8?B?Nm1EOTRET2o3Wm4wS2NvcENKZTQ0TCtxeU9DS0U1bDdFTmFXRVdOT25FNXB2?=
 =?utf-8?B?SVRBU1BkWndrelBieVFheWtzSWhrSDNsNmFwcHoyT1dhanlVMzN6NWdKMUs1?=
 =?utf-8?B?VlJ0dDY4T1VSamI1MFRYZjg2WmRKbDhNM0VldlM3dW5lR2d0bkVmVXpTZEJy?=
 =?utf-8?B?ZGhMdU9RSGhFS2kyaWRhbUlKQkU3NHJITHVSdWgvdHNBMHVsaVZwYXl3ZGp2?=
 =?utf-8?B?a0JQa1hGaEVmbi83d1Q5L3VZeWh5WGZDNkVSbUlZb0tpZTYrUjUwVTR5ZUF3?=
 =?utf-8?B?Z1B3NExSWXpMSGQvRHVLWXQ3RVRYQVd4YU56dyt1L0N0Sm85dGd5YW1Gc0pp?=
 =?utf-8?B?dDd3ODFRWFBnc0tNcEJkeHB5bG05Z3ByNDJwazljRmVKRUtGTnh0VXJPQUox?=
 =?utf-8?B?V3Z0b2IvOVNSZGtjVGZ3WFRMSlRxdVQweGpneEFSb1MvK3pPL3I4RThQV1lM?=
 =?utf-8?B?L0xTc2tsWmxxTDBsckhQUzlkUTdKU1MrZmtFRUhRdDMzSWMxMWpOS29hcWpD?=
 =?utf-8?B?N2I5VXhYa3Ivd29WczRqYVJ4QUdzTmZaUUd0THphT0xyMkVndTMzSmJCTE02?=
 =?utf-8?B?bkZ5cndaRnIzL2l4ZmFrT1kzcUNocG5mSUszT0paRVNjcWRJcjU2OU1nSXFE?=
 =?utf-8?B?dDdMYkJrRUJ6dStkd1NLMXpqMWFRV2k0eFFTZkVpQ3V2bEU3RzRWck5RdVd4?=
 =?utf-8?B?WTVpU1RPVGoxRzhTTHRpcmVCY1JOL3lJd29xempKeHQrcnkrZjBvV0o4a2lC?=
 =?utf-8?B?SldzempJZ3F1ZVlaWVkxaVBMWnM1RDVFb2dXM0Y5MldEWXl5bmQvazBkOExj?=
 =?utf-8?B?L0FqZjN1Z3FSdTFkWStmTDQvQWVZT202MlpEanY2LzVYcGtGL1hmcmRBZ0ln?=
 =?utf-8?Q?LV9pUxzwmhvkWJS0nS0bwbQr7tEE78HSpCbpQoe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ce4bda-a889-4f53-9792-08d931a456d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:26:55.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMHAzNbpiZpd2+T5NftmkAvgXB/Koh/Uz620u0/4EI6Isywjroe3+o93ptjzTkwnuvSXgHNqhvGqxKL9FIIxFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 17.06.2021 10:08, Jan Beulich wrote:
> On 17.06.2021 10:05, Juergen Gross wrote:
>> On 17.06.21 10:00, Jan Beulich wrote:
>>> On 17.06.2021 06:55, Juergen Gross wrote:
>>>> On 16.06.21 18:04, Jan Beulich wrote:
>>>>> Since hypercalls from the tool stack are based on ioctl(), and since
>>>>> ioctl() has a return type of "int", I'm afraid there's no way we can
>>>>> deal with this by adjusting function return types in the libraries.
>>>>> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
>>>>> subops (for those cases where potentially large values get returned).
>>>>
>>>> I think we can just use a multicall in libxc to wrap the affected
>>>> operations.
>>>
>>> Hmm, we might, if we're happy for these to then not work in HVM domains
>>> (PVH Dom0, which still is experimental only, or PVH/HVM DomU-s using
>>> the libraries for some purpose), or if we finally wire up multicalls in
>>> the HVM case (there ought to be a reason why they aren't, but I have no
>>> idea what that is).
>>
>> Me neither, especially as on Arm they are supported.
>>
>> And TBH: PVH Dom0 without multicalls might be hard anyway.
> 
> Okay, let me see whether, while trying to wire them up, I run into
> particular issues.

And, at the risk of stating the obvious, this isn't going to help 32-bit
Dom0 at all, so (assuming the immediate issue wasn't going to be taken
care of at the ovmf side) would help only one of the two tests preventing
a push right now. (I have a patch set drafted, but it's yet to be tested.
I did find though that the tool stack already uses multicalls in one
special case.)

Jan


