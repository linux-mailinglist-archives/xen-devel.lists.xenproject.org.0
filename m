Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD44516ACB
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 08:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318632.538472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPJj-0002xI-GY; Mon, 02 May 2022 06:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318632.538472; Mon, 02 May 2022 06:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPJj-0002vJ-Cv; Mon, 02 May 2022 06:13:55 +0000
Received: by outflank-mailman (input) for mailman id 318632;
 Mon, 02 May 2022 06:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlPJi-0002vD-0g
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 06:13:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a45f07a-c9df-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 08:13:53 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-GOGpI-3DOdKRq0_0z983pw-1; Mon, 02 May 2022 08:13:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Mon, 2 May
 2022 06:13:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 06:13:48 +0000
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
X-Inumbo-ID: 0a45f07a-c9df-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651472032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxA6Kdh16VQRJkSgCwqkesGGmB0GksnhnerCMpWnxwE=;
	b=WUXjDPBTLBSjpbj/WzqTa+2vZin9gymhY+2ruWQ/9Qa5UwgVFe5tce/7zlHelgFQzeuhSi
	0WYjGnkLem07DgDjKaDOolDnYSwSaWFkRdQy6j9ordHFAjI91zS/SEVJG7vaQYvrXjISW9
	uRJ/D2b/VENi9swZrf3p5em/Dcv9+aM=
X-MC-Unique: GOGpI-3DOdKRq0_0z983pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnXxes3LU+panu5urfx36bEHYprXnMzxI0eDlBhwqUDIFHGJ0kbVrwxj+YVZs5UbAR9h7WF++vKpx4eZkZjmhwizDSjKGlJBFhXa3sz2GcUy7YPmKIlMwRftWhbtBrmAyT3Rmc7yAeboN7SKQ6mYQVODoQjgVbFs0kQwUQ5b4fd6agqBi8dwpBbJ8bkwT9qdHo2kR88cFW4z9wkQn0uUXOp5X3MyI0kRYPVO6NHUn1tHSOjGotL/daqlRicNswvHlgVNINIzvd4/ZYCXtiqEA/OIEwKUBdit57NkYVk9enchpBkpLXiFZuyr8CY+qpLzIppeoxmnlmR5/maaMBTCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6SrEPP0E+ZtWJrOeWA0W0GiswQNM23vVzM/o5CocNw=;
 b=T8u2wwBjUbyKzdEPKNDNcDiAXZebt9zoAhm3UqaXrZ4rWqdcXDAe3SY7llm5PPZCAvht+GWQ8ZjtlPSl/xMCDmvO88PcYTVTe8/5r6infLMbJ4q4ZoUpf1p9U3yGOUCbzwOGxAmQxOw//aTxIvFGHnZQul0Q4jXqDPktOboz3nv0AH+lEDZ8LZKhyA+X0UNIsthmSy694RsgR8A7WLUB0jPXPOCM/zb6kp3sgZSg7187HFVby8EiUR2XKbj8WYc+iBJoIzjeW9orYHF1PKUncmqozDtdq2cSpstWoUs2FbZWQ8jmGHPOgTGGrWYMqPt4U0TmtWvIWN2Rw3smqsR3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97f2c436-42e3-2c35-a544-4763c3dc3401@suse.com>
Date: Mon, 2 May 2022 08:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427104718.81342-1-roger.pau@citrix.com>
 <20220427104718.81342-4-roger.pau@citrix.com>
 <38f0e56e-f72f-698f-c4c3-5973ec9e46a3@suse.com>
 <YmwJFqcfOX8oFcyI@Air-de-Roger> <YmwOLRUz/mgjOBt6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmwOLRUz/mgjOBt6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea91f76-c3dc-4815-2ed5-08da2c02ebf9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469B26B9B87FCAB6E29EC99B3C19@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3E6t7KsEFypyqd5VXIsRXodEadnvHHlTqTvCv297auStYh3ZKJfyRCT1UCPmwE7pK5oWmQlcrVjMtCV93qKDaUG+y2Bhpfe0wb23k8wy009TuA+WpA9lcG54ONGfWuknx23st0ciVawXRRc/zdPjgv0YKLeC2IGlrLaHrAz9a82/A8jOgTO0UumX36ejwra85N7sa0ediNHYIoW/63+MYhCAGba849W98L45YS83D3AhdA1UpB8CvApoJF4bv0yCWgb+X36nxGsUSVT/fnvz/oaa7BtLRW+OFgraV+J5lWZ/rK0E3MWE0xO7ghgTIWmCtdQf+BeWDZQuRgsw0KOr4mxMdfWI2Vqf1JTMCOEzT1URymUMvgA/JRoa20GGgEGtE2eWU+oWzD8D/nFbnlYRsER2qgY1woMkaTrMtgm4BXu5cXxqK33TMHOjZHI24jZP4VCSaoTg+0IidNQeE0scxo5fJSdyRFW2WrBgEYYPz4B8mboSreO0GeP6THw4qfsOUontXLzZeIsOwTdcbDUXPKStMWPzlCJbL4/D257G5K8K67W5455+jj4jJlPRtPnsQQ/trDC4CQe5z6rE5usITgBeasbq60eDQD8x+hx8XBJqrTX4x1p5EUXlwQ1Ktb+FVxz+mWB2wzHw1V4JnBavjW8GUquSE3l7I+qWXDJ0uHDy3sbMNdnP2iFw0hd4oBFdv5CKfJeLOYJIfKrLOCHAIHV2nXshPUR6DyaLAxJ/Xt4vWPPYvK7+9KYdWebv5mxR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(54906003)(316002)(4326008)(8936002)(6916009)(38100700002)(66946007)(508600001)(66476007)(8676002)(66556008)(6486002)(5660300002)(2906002)(86362001)(31696002)(31686004)(6512007)(26005)(186003)(36756003)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HDUZlauEuQmyVPcYKRIw4SYmRchAB4DgpZuEyk0HHKM4arXGPrr0V2ap4dZm?=
 =?us-ascii?Q?e090xHenHi9UlmJnMKHHsWsTF4/rJRnglbcrxGxfLcopdwBs15mVbQzWhhcg?=
 =?us-ascii?Q?xuRaJxSrw/LzINjZdu4jzPtV1tEwBIhKl+y5gH288Jq7S22M0kTQ8KSPVWUK?=
 =?us-ascii?Q?2VJacxNNX7TN3Y6KvHDp9kpERN57+xEDeT0suRamAoJymAPgZ57NsExFds4m?=
 =?us-ascii?Q?VR6dN4gwrvNUM5k+QGr4zgfXUHWAl5SnPoIsN0qO5gTHLc2zXJqEIAtaHpYg?=
 =?us-ascii?Q?oA/JPoFr2YNAuPRgOZV9NwUbxp8vkwrPUYNrHZC1KUQd3Bup8Bo5sPSr2yHH?=
 =?us-ascii?Q?+HPXHboSDNE6hLQ7+t14MKuoHjOXvHaWowFCmi0M4gyHnOm86gPAlqaMQNUM?=
 =?us-ascii?Q?ETYXsrLbpahXiXqUDRMNGc7N+w7/jvkKR1edSvOi97Mt13e4uwTNSyWfIyHR?=
 =?us-ascii?Q?PjUglWFjmFP9sn5KsTA7ebpegoegLIGIfyMhAKxFPF8/p+TrtmEyS3h/4dIT?=
 =?us-ascii?Q?WSMdy98qnTWCrLz0gX6lDDOyU5RK/STrZX54yJdN0RAZ1+/qeRVEQuEg4GUR?=
 =?us-ascii?Q?abxc7SNY4jncoLvbyd51vkTBB6zZc60+vSkuQn2wQFqMnhWN/MVMHJ2ppNJs?=
 =?us-ascii?Q?qC+0hQL3FSPb+UsK3tSDX7GmVgARMEncArbWLlX7pqv9W3ZJ+kLlFuIkTPwN?=
 =?us-ascii?Q?jaCCHg2Vu3tgkTtzcXTnScZtyE/r9E2H6giUaAQ6bFEg79tpsy/hgE5ztreX?=
 =?us-ascii?Q?vmN+71WxgqAY8YQDxtReArlpsY9N364sc8+KmzSG2xNQhrZ6c+416vBJrC43?=
 =?us-ascii?Q?NRfx8521NXUOly3TWUH8MOB5IvgkRj2+eZEVLSPaxMVWof+PJdQNUHFZa1v0?=
 =?us-ascii?Q?skWwwILmNaWuoOezEh1G2KXK8GNY6b5H3xOe8spL5UCAseGBazOfjXF53pTH?=
 =?us-ascii?Q?8pjX8/JBmpymXOeuTiRqFlzxlj/uJcDOmUmlIzNqsTHy5EynjTaiTQ9vD7px?=
 =?us-ascii?Q?EQSWGDQz9cyGNBIgauQVAesywslRHHGdGUMcoOut1KmPhFilqeKPOcmDsofb?=
 =?us-ascii?Q?BSpRhvA5sKu3ygeN4CRegHFWFL8c9aGBX2ojLFo02BSBwJL+cl1734y6sRX5?=
 =?us-ascii?Q?vbieGZwRLZwx4f82wumDeQuAfLzLn0vlMXXi6oBuqs/9Pp46OfE7OZBn/2Zp?=
 =?us-ascii?Q?bWhX+nMk3G13iMhXKKoIS7PkNAwX4eVnupnjZg6q6MsaPfBWRyWaDj6I8mvJ?=
 =?us-ascii?Q?EU4k7/EbepEMaUUnWYMWNnB5h7DqoNMuYAHnrlMsop0jYDz6TwZdYmcGZK50?=
 =?us-ascii?Q?oKAhbmfjWC1Pe+tXZsUFyE3L18ZqGrkB3v1Z6IBBfvUh0eU+yFTIzfkZzL8G?=
 =?us-ascii?Q?P43mb2vYk3QH6ueNqMDw4iU/Q+lDu7ys8yTBPokuzFglSGrXeDRxvtIjc/rR?=
 =?us-ascii?Q?0I+nAuz/uvZpmRujFPGj5+k7N7l3wki4GQ1iLKPDb1vC6TEnL5naqlGaTIx4?=
 =?us-ascii?Q?+lDDI46hD9TNKfTTnI/RF/7YqW1WDLy7bh5TID3HXMFNGrSppMjqhbSGUlOq?=
 =?us-ascii?Q?/QPwApqEgBi4aBu2oi3qoCwsx5TD77tVmlvBsBKcu7nv7qloKSdI/SZgZcPL?=
 =?us-ascii?Q?iEXA36WfOHJ6qXwehP56sJQq0QmK1yOgJTzCVFchLAExWEIrxliftY8BhWnq?=
 =?us-ascii?Q?LOJckRZ8Ln8+Qe8iv6K19JVnr4lo56K9E9pd6uL77vNb8X60zu0gX6kovSy6?=
 =?us-ascii?Q?4Li/uLMDUQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea91f76-c3dc-4815-2ed5-08da2c02ebf9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 06:13:48.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pj3IiNX/kgVzavRy6rsb+R6A3H0mHUGVRc+bFCa3uqvaT3IAZDDLe4AlhZV9uHYXtRTQzI57qGjfc9jJVLCMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 29.04.2022 18:11, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 29, 2022 at 05:49:42PM +0200, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Apr 29, 2022 at 12:59:58PM +0200, Jan Beulich wrote:
>>> On 27.04.2022 12:47, Roger Pau Monne wrote:
>>>> +void amd_set_legacy_ssbd(bool enable)
>>>> +{
>>>> +	const struct cpuinfo_x86 *c =3D &current_cpu_data;
>>>> +	struct ssbd_ls_cfg *status;
>>>> +
>>>> +	if (c->x86 !=3D 0x17 || c->x86_num_siblings <=3D 1) {
>>>> +		BUG_ON(!set_legacy_ssbd(c, enable));
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	BUG_ON(c->phys_proc_id >=3D AMD_FAM17H_MAX_SOCKETS);
>>>> +	BUG_ON(c->cpu_core_id >=3D ssbd_max_cores);
>>>> +	status =3D &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
>>>> +	                      c->cpu_core_id];
>>>> +
>>>> +	/*
>>>> +	 * Open code a very simple spinlock: this function is used with GIF=
=3D=3D0
>>>> +	 * and different IF values, so would trigger the checklock detector.
>>>> +	 * Instead of trying to workaround the detector, use a very simple l=
ock
>>>> +	 * implementation: it's better to reduce the amount of code executed
>>>> +	 * with GIF=3D=3D0.
>>>> +	 */
>>>> +	while ( test_and_set_bool(status->locked) )
>>>> +	    cpu_relax();
>>>> +	status->count +=3D enable ? 1 : -1;
>>>> +	ASSERT(status->count <=3D c->x86_num_siblings);
>>>> +	if (enable ? status->count =3D=3D 1 : !status->count)
>>>> +		BUG_ON(!set_legacy_ssbd(c, enable));
>>>
>>> What are the effects of ASSERT() or BUG_ON() triggering in a GIF=3D0
>>> region?
>>
>> So AFAICT the BUG itself works, the usage of a crash kernel however
>> won't work as it's booted with GIF=3D=3D0.
>>
>> Maybe we need to issue an stgi as part of BUG_FRAME if required?
>> (maybe that's too naive...)
>=20
> Well, better in panic() or kexec_crash() likely.

Yeah, lifting it too early may be detrimental.

Jan


