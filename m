Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D84FB9F6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302955.516879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrYU-00087U-Dq; Mon, 11 Apr 2022 10:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302955.516879; Mon, 11 Apr 2022 10:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrYU-00084I-AC; Mon, 11 Apr 2022 10:45:58 +0000
Received: by outflank-mailman (input) for mailman id 302955;
 Mon, 11 Apr 2022 10:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndrYT-0007mG-1b
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:45:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b6f2ec7-b984-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 12:45:47 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-r32M0Kt_PCSPt0Vz4hAA8Q-1; Mon, 11 Apr 2022 12:45:54 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0401MB2629.eurprd04.prod.outlook.com (2603:10a6:4:3b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:45:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:45:50 +0000
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
X-Inumbo-ID: 8b6f2ec7-b984-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649673955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQIt2KH/LPlOVO/K1JQ2W6WZuAzLqxdu/AirvMUWfP0=;
	b=K2+mYz9hiyPIwgzAa+usPorBv1fGcRoprtWGEoM3S/rDUiZaedAGRavw43dJgKn9gXOuSr
	/JoAr89fCBIdlxxFGDlAvuUMu+yjsQFLoIZ0SbeKg6FeIg8dWaglfFte22Sd6knpMgFtv2
	6LY/veXl3TlSKGOXrJYFgYnrY8D3i4o=
X-MC-Unique: r32M0Kt_PCSPt0Vz4hAA8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc5GdXunLuFx407oxI/gB1jy1g9YMumaWhx3YnmdKvS4E+3UBwPT0dRYc8C0xhhLNcdfbbqElLLrfC5xeoJdwqt4xBHHO+T20oPEBwupWvvBQgYmuqA/lPn62th6a1NRmj/FDExW0j5diZM7rwrwtkKAaP87XRFbmf98FmPFptK3LX0eOCbb496vrqccIcs6r/qVOyFTdsU0psxSZKE3Gr1hvwhNKBv6+TjGoV4wtDNTIe7ZkAczrh1IUfNOO1pqIFNIpVEp0Tr/ND2tYVCnBiu9YNeS/Csf0yVxXPWyjD3R0JhLv1yeIc9DHESbD8embfRvTAMFuQlvsx717byxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQIt2KH/LPlOVO/K1JQ2W6WZuAzLqxdu/AirvMUWfP0=;
 b=muUUJG/ih9WNTjzx8k5/fn/CgfZ1J5Bv9jwJ9+E5UTcILr3Ftbn4bnQPVN7s6onamxoHsWSIeAnc4HKA8wzA7Sel5wQSw64fXR+IwQZrENlEXfGXHicecGc3JrvSRU5UatzQuSdfGeSRT8CAs4zdMiM+fGFCN9ekf7oT5C06/O8sKEDL5/rHnBEUnqsf61tbdiOhjihZItbdHwSS/51/yUXsQxBb7DAwlQOTBZf3doueHkdg8s2O1n0jDXErTeT2Du8nm6Sb6TTFUhnzV3xkTOIxkC27c3vRfzP+hhdfulKNxikr3hBQx4iUliRG7bjFaclR8lYx7QQzINNqGtiXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e41da164-7aeb-3d99-ef4d-17c591af7e37@suse.com>
Date: Mon, 11 Apr 2022 12:45:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
 <42d16ff2-725d-ae10-ba6b-561487252125@xen.org>
 <3217803e-16d5-6e2a-bde7-ff9a1237dd39@suse.com>
 <decf721a-8062-a23f-a810-78fb86a42d1d@xen.org>
 <747017ab-9aa9-b958-8cbf-42c2cc3ffdb1@suse.com>
 <0f18eb04-7b39-da75-fcf4-f765d8ea28b1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0f18eb04-7b39-da75-fcf4-f765d8ea28b1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0091.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57aa1ca9-61e3-482b-50b4-08da1ba871da
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2629:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB26292D97C9BF1FF9FF4A2EABB3EA9@DB6PR0401MB2629.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XJe9YfMpMax7E0FdWzRiUCdYl2NeEzu8YqtAqRoBx/YfHG74YgHf4N9JjKVBYnXBLP/UNxyVX9U9xjZ/XsmXzDtBMvedJNssUw0bHAQHsbLVt4lUC3VyK/plSm1K7/5vtBHpCHyZg9DwCg1nPBCC8NtwmTVcpnAg7cDpFvxh5ySTOxP2vUMx15ICZAnHy3TkgNFvhbcMogELMHd1fJt+vlE3iNn8OEviNdDr13Cs2BL3M0Tkb3oUTxwxUn49Psofx6faIQy4Zb51TarzCcD4pK3sfWxYUyMcYMdC74d6kg+Zy0MBFXJwSlg1igq4qN7rY0FCl7inucIqKxIVCDvITgJXHa4FIe4MZWLovVNCLGtcXK+xMRwlEFAkcyTj/Ae0yN6yCtm43Y/b0hpB1a4AcF9L9cDxyOGkJrkI4ezB9rCymqPRYbJUmzTXzWPDrBq5r3MhU+w5NSyAGMXjbERB/KdcX2B4NKomS06B5QlKES1WDwEParOz+XSP9oW41EeDs+KpciCpHmbuu0TFE0x6g3ZN/0DIf5uEXr8cc5gxNMsUlrKNsm7Or4j8dSgScEl7NFo5MRUnbuuAqpxlhjITRz0H/hyHed+wqebZhnqF4R54vl0O9aa1p8BotjXn+IIYPiYwRApF7hX4ohWerwePdgkJ8pvSuV3SuY3jyE+oarq4mjYXHsvRsVFBjDne9GLGnnpf1fHTbztwKlfqLrmnVWQw/INjk6yQpo7Qq1McXbn1I6tkHlRV4OGWjVqoSVzM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6916009)(86362001)(66946007)(66556008)(66476007)(54906003)(508600001)(2616005)(4326008)(8676002)(31696002)(53546011)(6512007)(6506007)(8936002)(6486002)(83380400001)(38100700002)(2906002)(36756003)(31686004)(26005)(5660300002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFgzVlBiZHBocGkzQlRISzNXOXhQRlVwQnc4RnQzeUhvWmsyRW8wdzlya1dq?=
 =?utf-8?B?UmxXcklHWHJ5ZVg4ZXhMcHVTRHhzVi9kdG92M2M1VFFOYy85ZFU2SkhEQ0My?=
 =?utf-8?B?WVl2ZzA1QlFidzhvcnE1anUvV1RoMEtYOWgwaEZkRTJBWW1KbWZLQTFndGJN?=
 =?utf-8?B?VDY2ams1alVRemwrdHArMm9XMEZsSk9ONkxYbWIzaWVCQTNtVnBtbEpOYVBM?=
 =?utf-8?B?cWxjbG03bnlUdW0zMlVaMm03NTRjMVBxd1VKZlpLQk54Yk9lSHVFQ2JUbzM4?=
 =?utf-8?B?cjY1OGFGVVA2OFlkL29mR29hWElhQlM5NXpNbGljVnVNbElKY2FoWGJtbWVo?=
 =?utf-8?B?dWgyT0E5YmhqRXZVa3d3cDdqLzZiSnpNVEtheSs2TDV6WWNoTzFEalpGWnN4?=
 =?utf-8?B?aVBBa3QwSWNvQUlOOW5DMFhFcUY0bVUvUkFiR2w5TzZBWFIxWHQvaXYzbG1C?=
 =?utf-8?B?cDN1cytRci9XbTF4VEVRbTBjZ1JxRFQxbjFERm1jVFU4ZEc4SURLdHNRRitp?=
 =?utf-8?B?enV5WTRER3NuT2c3Yjd3bElkSzdISDN2cVdhQ3U0a3pPekErR3RSbkorZisw?=
 =?utf-8?B?dWdUWVRITkFYaHB2SXZzdndRYVllbVZnRzMwQlRYUGZXTmF4cnB3Q1VzRy85?=
 =?utf-8?B?V1pnQ01IcGdVU0ZSbVExY1VIRGJlV0hCNWtYVDZOdGIvSXp1eVZDd1Rwa1lN?=
 =?utf-8?B?cjRqeVIwUDRrL1MrT2lReXZRRHA2S25FdkFMN3hYaWtpOHNmOFZscnh0cGkz?=
 =?utf-8?B?QjVGdHZPTWkzbndDb0xDaWdQR043encxRFkwdTZ2UGp3cWdDQ0g0MFN4cTdF?=
 =?utf-8?B?Ykk5WkF1WUFHYjZYYlp0aXJ1ajkwNCtwNEMrVGRScWVjWTJWUklxYXA5T2U0?=
 =?utf-8?B?YW11OTFkaGpTRDg4NlJNOE42UTZXejV1NVBuczFLRXAyWjdXZzBCWW9McFli?=
 =?utf-8?B?cS9GV1JWcmI2bHcvbWtzUy9sektwbEk1YmlQUW1mLzJRaDJXbEhWRWZYcXox?=
 =?utf-8?B?SlJzNFNSUFY2VmU4ZkhXWTRzTGFTbnlSVXphMy9peFJxenVRWWYrcWFrUU5s?=
 =?utf-8?B?WFk1UWRuOUh2dmZCWExUbEtrdkNSa3hOVVhwR3dGMXpGazFGa01UT3hxZjla?=
 =?utf-8?B?L2pjZVlISGlqR0NQdEp2bGlkbFhONE02NDkvNFViK1FYazdrSHVSWEMrTkdN?=
 =?utf-8?B?eVJ4NzRWcXhRNHFhRFB4TEVHbk5QZ3dWU3pDWjFMZ0dWb09Jb2VjbWZsOVBV?=
 =?utf-8?B?ZzcvTHpaRll3SzhBRDhYSnBvS1c4VHBDNk5mYS9ONGhmenVzMmY1eHVMM25S?=
 =?utf-8?B?cThGeCtHRnpsN25mQkk2aTV4a0hZNlBiS2JGNTFsc29uV0VFUDN1cmFjcG1I?=
 =?utf-8?B?bmw5TnlkNExQb0NRQldpWTJzTTc0UnhSaEx2eVJMY3pVMWtDVDFIQzlRMjAy?=
 =?utf-8?B?bVBKN3Ayb2ZMOHFrR3hMMGRTeXpvalFXV2NHQm1zNW82S3VycmYxOXlhMHFI?=
 =?utf-8?B?VzlJU01OKy80V0ErakE5QmlvYlNCZHFXRk5Ndi9ZcThSQVNiTzRTbklTNEIz?=
 =?utf-8?B?aWJOSG1VQmM5MVlVMnh1UGdPYzBoZkEwTHpMQTN6ZmRzTU5YcmtlVTFUZ2hF?=
 =?utf-8?B?YWF3Qm1XVmkxT2tvYVQ0Z0RYQ2FTT1JuZDZjMFJEUmZjYUhMdjlzaDZPN21w?=
 =?utf-8?B?OEZ5SlhGYTAwL3hCdHhXZGJVRk9VWFZiU2IrOUpjcXNHOGk1ZnJZdUlOUjlH?=
 =?utf-8?B?SVZIbzVxR3NFRC96L3huT0V0OG45SGJYcVc3WHJENHVxRmh2dE03MGRqbnVx?=
 =?utf-8?B?OXg0Wno0bzBVdlIwem5hZ2RsRlFjbEEwUjg5R0d0eGRZYmp6UGhiN3Ivc0dm?=
 =?utf-8?B?TXRYZytPaTFwbkQ2WmlkNCtGa3VBSTZ0WGZ3SVdpTDNMeVpzQjNoTmNtK2ht?=
 =?utf-8?B?M2pham9EblpCK2hpSW5oVTRKVGpsSG1CSGtqTXlaeVRFMmUzQTFzN2k4dmhN?=
 =?utf-8?B?SC9RTkFkRW03QTV5aDZpY3B4TVYvVDdNU2lkUWFkYVQxT3l6OURYbjJoRVBX?=
 =?utf-8?B?TjhZSTdZVlRDUG4yRyt5SG43dlo0TlpvWTR3QzlydWtEQUROMTVuOXJsM3Yx?=
 =?utf-8?B?cXVWVEdtbHJOTzBmUzJyR0F5ZWt0K2E2d3JTUkFLb3RDWVRnZC93NGV0cDht?=
 =?utf-8?B?bTNvbldXMkxZY29QSno3dXdzRlVaN2JCMEdHaVZpcENFZnI5WlkzUGhDbEZq?=
 =?utf-8?B?V1dvZlR0NmxKOEpGQXkyTXZSdndncmhnWTRZdlM3N0s1Z0Z6Rk5PdjlXZXpR?=
 =?utf-8?B?R2tsbTNLNzBQK2dienU0OWsyN3FqakEwVDZET1k5Q21JVGh5N3ZGQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57aa1ca9-61e3-482b-50b4-08da1ba871da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:45:50.6028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UW6/41Szyi3KJ/MxEwadB8+8HyeguRUthWN5IvW9aiIRbA7c3nZNyGky6MhRzweR0Mr8Vv/weRVi+JroNEKQEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2629

On 11.04.2022 12:25, Julien Grall wrote:
> On 11/04/2022 07:13, Jan Beulich wrote:
>>>>>> --- a/xen/common/event_channel.c
>>>>>> +++ b/xen/common/event_channel.c
>>>>>> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>>>>>>         unsigned int port;
>>>>>>         struct evtchn *chn;
>>>>>>     
>>>>>> +    /*
>>>>>> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
>>>>>> +     * vCPU-s they're to be delivered to run on. In order to limit lock
>>>>>> +     * contention, check for an empty list prior to acquiring the lock. In the
>>>>>> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
>>>>>> +     * until the vCPU is migrated (again) to another pCPU.
>>>>>> +     */
>>>>>
>>>>> AFAIU, the downside is another pCPU (and therefore vCPU) will get
>>>>> disturbed by the interrupt.
>>>>
>>>> But only rarely, i.e. in case a race would actually have occurred.
>>>
>>> Maybe I am too paranoid here. The other side of race is controlled by a
>>> domain. So wouldn't it be possible to increase how often the race is hit?
>>
>> Yes, of course - just to harm itself.
> 
> Are you sure? Wouldn't this also harm the next vCPU running on the pCPU 
> because it will get interrupted more often?

Possibly, sure. But we don't make any promises here. And recall that
this optimization as a whole has been put under question in the past.
If we'd drop it, we'd also impact various vCPU-s in not really
predictable ways.

Jan


