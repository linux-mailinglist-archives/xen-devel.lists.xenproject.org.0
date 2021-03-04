Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C032D51C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 15:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93275.176087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoo9-0005GQ-Rc; Thu, 04 Mar 2021 14:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93275.176087; Thu, 04 Mar 2021 14:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoo9-0005G1-ON; Thu, 04 Mar 2021 14:18:29 +0000
Received: by outflank-mailman (input) for mailman id 93275;
 Thu, 04 Mar 2021 14:18:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHoo8-0005Fw-8V
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:18:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcc6d47e-9f60-4f93-81a2-fefed51fe8fb;
 Thu, 04 Mar 2021 14:18:27 +0000 (UTC)
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
X-Inumbo-ID: fcc6d47e-9f60-4f93-81a2-fefed51fe8fb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614867507;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+n979Kpzz3wOb0UKzWhsUCl9o6Pi8vFOEIIokHfCfXo=;
  b=h51B/1f0+FQNHM1wBSZFO4wKp7bo5pFjMDJu1aJkbJ68MWCgCj9vKTXJ
   QYJQ07fhBR5c3PEuRaockPGH7CMRviIO+Qq2SJezePacm3PvV1VQXB1a9
   vqAhPU4L1PrbNoYu9nWtaa3pnUKnO7TfbrSy4n3HBmjS+jAApzJeTye86
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aYXISfdobRBRLsnE99fSDYABW+YJxhXhnATtlMnDKrwA10lJPuHbOUPV4BblQIHogQttc0RT76
 lCZDlfgVwabsGAOsgtN1P0sPFpwSDLPWcEfW15GgKRwYsjWlicf+V9a5xJt/qzxGkElHjApHmQ
 U19l7oZjGvDIfT16DQcLM6PumD0aRnxAeAMARRjgScVe5iHKtDpQnWv2+knNpjsBGAWGOwe7Hr
 IKfo5VOTnBk+naNuhgpDDqTNHs9uK/KG+yWoY3SIqEZMj3XH29wfwxYmZaRU1a5jyGfKKSh0J9
 eBI=
X-SBRS: 5.2
X-MesageID: 38551321
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38551321"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBC7jsPxlYoQs9kFAp216EJTHU/6ybnGkmswRQBoV30m0stC/O5M13y2F4zBuUTZdnwU0APo6ev439r3Kfeq7iVT3W08oJYPBWM+B/fSjvjoeXqhh4zW2RAbsZEpF4j7F8b+A7YjEZcUjSPYKuP+mTTf7SDw43xst4tZ2kUawm0IBgfWtxOLEHxXtCY3Sbp8zPAX0+F18V/ABtca3DhYwO+CSQOapyEO4pAxdRua+OZJhsHl0VEaj8vn3sW94+4u0YKh3ZbydanOxsPl1w8HTzbKsmFiyf9eeufP21YltHAYCWngdU8BJbhJLMSRfrOZ9dYziC3WZJ4pzi8xBZio7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+n979Kpzz3wOb0UKzWhsUCl9o6Pi8vFOEIIokHfCfXo=;
 b=A15GCECx6rVJDPINYoFGVwG28RlwoUTib+J7uEOWVzSKMXE3iJ05mdY+9a9HhOIQ/7uT4QzqRNvwfWySozyISk95dwLVqNsHEkpbx6luSFG/VtK9tELEnkKxqsg6hJj+2dgiAKgO/uZNmYAsP2G6jF0eYyOaCOu04iTgOsr/nV2N5e6Jzn2a0s55LwB8aLlFhqnKhAqUoCYiaLs3Py4/qA6Lr8SnaTiqFv/rgDnaKfXuDP1JrxN9bKPXRnmU4pfwldP1nIvgxflhZUPsX5sqiXwQwSVnxPCWyFddwyOEPZnsfoPjFYAkkTt+KB8mROZIYYJHoo0QXneFJ/ATUXJwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+n979Kpzz3wOb0UKzWhsUCl9o6Pi8vFOEIIokHfCfXo=;
 b=H4aX7pdMZ+oUNOpGURL8a6MRFuEMcR/7eTKn80JTrq4jIk32vWyEnbSEU00/VkTyUh9T4Ab21wwZDUfwJEaYOBucbFHtiylppw1/2RBMNS0CyMcPl+ApbxzCVV7IGRoUNzWKBDgrViqgwGO79aGo4DLaZFdhwgyCVh8mBmTks2U=
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <ab081f2f-265d-78d6-0af4-21eaf2b9de4b@oracle.com>
 <ca3c4ab0-3bef-5b9a-550b-b38dda63db30@citrix.com>
Message-ID: <9e679925-5d1c-3a43-10ff-dba1bd2ddff9@citrix.com>
Date: Thu, 4 Mar 2021 14:17:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <ca3c4ab0-3bef-5b9a-550b-b38dda63db30@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0475.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::12) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b45c8074-8635-4dd1-b699-08d8df185304
X-MS-TrafficTypeDiagnostic: BN6PR03MB3186:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB318654DA597327BBBE71FA48BA979@BN6PR03MB3186.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ru8WQPDfLJK4dJUw8FU7C/cr6KxgqU4t8pjFf1lOtr6SVloRqigdlyEVLCo7mqjw1YavohL6D5hb+oWee4KeG9QRAubUKGddh45s92vjK/dpXxYIoNvc8+hUJ6hktw1KrdjhbbhRInTBZ6QTe/B6FKmbhtLJ6NlG7hrB6c61rupDiF0KlbT1jllVJ9pMIDfu1lyzkQxvnIh+Bm7CGxkW33KOfiBoNQ7JMl/JPbknFytOyJLVuPfqaHx8WCmCLtmW91yKZoT6a54ok7PjqSVTrsZFR4Q1LOcFVT83KIpnEKWJmU4/GioThviOjHjss8LAcI8ZPEEZITiUc0AToeuf4YhHoMFJdr/ho+2I8xxXXLj7zJdMohns59n3H0Mkkcj5KDYNTHPeubsh1bYwIuQJel6qbij32yCbnt9qwpha8YBAq1rvIz/F3K9iY2Vuu6MMWdUXh9eNfaLOJmufE+ziBgjiKVMizjX8+N5bbbCkQ3wxVtdhF8AyLWsIXWryjXaJT7Gp7i1BWJ8tuo6Zc22oWnZ2S8mlqZYRQh+j/FjQXqNzQD31qCPkFaXR0b3fh2CBbNhMMyKmHljDWBZn67aw00K8mfPpKAxCqBwrl0M6Xzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(66476007)(66556008)(26005)(66946007)(53546011)(6486002)(83380400001)(5660300002)(16526019)(2616005)(6666004)(4326008)(186003)(478600001)(956004)(2906002)(16576012)(54906003)(36756003)(110136005)(31686004)(316002)(8676002)(31696002)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXIyT1dtVkpHU291SmdUWTZnbURhTllNUmJ5dndMajB4WmhOdjQ4bDl5ZWo3?=
 =?utf-8?B?UVhuSWJ2REx0YjFVL0YxQmc4bkRhamlHNjlxMUhWSmFaNjdHck1WL2daRnNU?=
 =?utf-8?B?RW51bWk2UlNhaVZmejdqMnhEL0toWE9JVEF0OThlWStHdGpoN05WZ3BLMS9k?=
 =?utf-8?B?Z0lwTi96NmprdVJ0cUxJUFM3akZxakZsQVdvcW5SUkh3eEsrWkhmQmxBQ0ox?=
 =?utf-8?B?NjVkUEVzWURIYUFrTzJMQVFUREZFZXExaTBST2ZGYTBVSkxic0dyUlBQeVRw?=
 =?utf-8?B?ZFRGdHRocW1tSlVuemNCVlNabnVvRnNielFwSm1xMTJxRW9tNWNiWlFteFh4?=
 =?utf-8?B?aXRUSzl4OGRXNmQvRUJjS2VnMmlzUVFpbUlWcjgzcEdJdVJyWnNIOWZGZ004?=
 =?utf-8?B?dHFjSVZzSEJDMHZBM3dPdnRXMWNUbmgzYUVaSVZ1MERBWlZnUURLUDJGS1Aw?=
 =?utf-8?B?SkFwMkJBemp2N1ZvdDVPUGROZFNEM2V6QW1hVDFwMDV3clcwQWo2L0tkSXFu?=
 =?utf-8?B?cFN3dlhRWXg2TlNpeGxhNlRrK25aTlp3Mk1hMld5UVhRS3ZrTVJSY0pGS3BS?=
 =?utf-8?B?SUp5eGlNVjIvcVcxbDc5aDQzb2xxZmVWMGhaUm03aUVNdVg3aHpKaFd1QlB6?=
 =?utf-8?B?UTQ2VkprNjl1WTVlcHBRUFoxbHlMa2djOGZuNkVxc3VsSlBqckdXM3NVS0lS?=
 =?utf-8?B?R1dFWDlZWjlhWDBYbkFGRTVhTkt4NmZSK0RLVWdYSDg0ejdkZ2x1OTlWbzZO?=
 =?utf-8?B?T29wM1BFM2k2RDlSUjZkblRERk9Jc2puVW9IV0JjcVZRTUFRWUpzTmNtN1BI?=
 =?utf-8?B?Qjk5cW1qU1hDak50TW0yTUQza1l5Z1VvU25oOVRZY0tCMlpnaXRUZGdxcUJR?=
 =?utf-8?B?MVBlSEtqLzdyZDV6cDNtWjlkTEU3dUhpcjFUR0pYWW56cDAwaWZYT0FXbkJy?=
 =?utf-8?B?RURMUEtwbmJjOFpvSHNBV3FxZ0R6ZkwySTJIMWN6bk9ZS1RnQzh5V2IwV3da?=
 =?utf-8?B?Zk1XejRGMWJsWjdFNGlxeGdmNWZWV1JvazByRm13SFFWTnZzL2dicHNYdWpL?=
 =?utf-8?B?Ui8xR1hqSFBjaEVud3o1ZHp3dlZqZWU4b2lBM3ZqbWkwajRyVE1OcXpESWZU?=
 =?utf-8?B?SUllV1RWVHB2L1lxSTFvbm9jbmVCR2NxZjdFOTgxcjB3SVY2N0dGK3M0VWpK?=
 =?utf-8?B?YnZHWXVpeGllQXF4Ull0U1Q1aEZqQWZxdGNpRmMza0pyTmNUZDFKRlV1RUwv?=
 =?utf-8?B?RG5VQm43c29jK2NaaDZsUlB2OVVJYmlHelF5T1gzMjlscGhQMUtpQzQzUVAv?=
 =?utf-8?B?Qy9VVko0bW9adGdQQ3hxa0JMWm1FYWNObVRMenpoY3AyWVd6OHNKWGdRQjFX?=
 =?utf-8?B?RkVMQk0vZUNNZDdEZUVuSmxwendQS0drMEY1cFl3Yyt2RkpuOWVsVTZwSWVu?=
 =?utf-8?B?UzJRRUw3YS9vbStqNlFQRmkrZ2ovbVFSczMxeFRKZGFqeUFIVksvVjV3YUR3?=
 =?utf-8?B?ZlpjdGRVWmRUeXlpS2xaNGY2K2RVOWRudWlCQW4vQlVrc000Z2xhSzBUa1ZY?=
 =?utf-8?B?dS9zcEdmd2F6T0g4bW1hVnFpbmhCYUVKYzdzVmRzUzZBcGJ6TmVOck1UQktY?=
 =?utf-8?B?SHlOY3lQYW43dk9sSVNMaTE2eHNFT2FZWFptY2NuRlhtT1lGbXpTc2lsNWdI?=
 =?utf-8?B?L3NOMHpXQnNIRzVJTjRCaVIrN3pPT21kRjdVNGVueUxVYklXQ1U1cm9xV3Q0?=
 =?utf-8?Q?wvbCN3YOlpj5VI+r3/gRcz4oNxxvCVEUNu3obrU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b45c8074-8635-4dd1-b699-08d8df185304
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 14:18:04.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBvCavDtZhRJNwsTgoLgD7sdO2xHraB7MoqOmmePfWzil2JCz2QjAQTF+iu4yuTfWCI8/AZpiHKojE2B94QlJUIko+obF9owsTHe2dhlLWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3186
X-OriginatorOrg: citrix.com

On 04/03/2021 14:02, Andrew Cooper wrote:
> On 01/03/2021 19:33, Boris Ostrovsky wrote:
>> On 3/1/21 11:23 AM, Roger Pau Monne wrote:
>>> Introduce an option to allow selecting the legacy behavior for
>>> accesses to MSRs not explicitly handled. Since commit
>>> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
>>> handled by Xen result in the injection of a #GP to the guest. This is
>>> a behavior change since previously a #GP was only injected if
>>> accessing the MSR on the real hardware will also trigger a #GP.
>>>
>>> This seems to be problematic for some guests, so introduce an option
>>> to fallback to this legacy behavior. The main difference between what
>>> was previously done is that the hardware MSR value is not leaked to
>>> the guests on reads.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> ---
>>> Note that this option is not made available to dom0. I'm not sure
>>> whether it makes sense to do so, since anyone updating Xen to such
>>> newer version will also likely pair it with a newish kernel that
>>> doesn't require such workarounds.
>>>
>>> RFC because there's still some debate as to how we should solve the
>>> MSR issue, this is one possible way, but IMO we need to make a
>>> decision soon-ish because of the release timeline.
>>>
>>> Boris, could you please test with Solaris to see if this fixes the
>>> issue?
>> Yes, it does. Thanks.
> Really?  This doesn't stop #GP being raised for RAPL_POWER_LIMIT
> AFAICT.  Or am I mistaken about how the bug manifested?

Actually never mind.  I've figured out why.  I have another bugfix to
submit.

~Andrew

