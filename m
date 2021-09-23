Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD51415ADE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193557.344765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKxq-0002GV-7r; Thu, 23 Sep 2021 09:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193557.344765; Thu, 23 Sep 2021 09:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKxq-0002DE-45; Thu, 23 Sep 2021 09:24:22 +0000
Received: by outflank-mailman (input) for mailman id 193557;
 Thu, 23 Sep 2021 09:24:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTKxp-0002D8-2q
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:24:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c772bf84-5cf8-4869-b1e7-d5b57c2b4fb5;
 Thu, 23 Sep 2021 09:24:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-uOx-q_-GMNWLUp22WaTgaw-1; Thu, 23 Sep 2021 11:24:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 09:24:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 09:24:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Thu, 23 Sep 2021 09:24:15 +0000
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
X-Inumbo-ID: c772bf84-5cf8-4869-b1e7-d5b57c2b4fb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632389058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1fFr37HGDC+ZBiUGHJDEvBCp02MANs3D58TdZg3h5A=;
	b=VPUM/P1OmY5flANP8DMGwz+7XB1ckbIYTFO4toX6n9apjC/gL/XfvWL3YXD6HRtZtgUOVA
	xdAf1sv16dRCidtFFuH9VCYEj67oV9JyYsofDEdBRBysbv+XIIwIjAb8ws/IA+/KKugFLD
	oQizDRyypohE3fBJJ+w+0o6waWXIdpw=
X-MC-Unique: uOx-q_-GMNWLUp22WaTgaw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McxchkuwyM6C9fw+16jxCNjI+2EyTT5cJN1HnH1+ztlxpE/DfVkPlveHl8FzMl69x1ZfAwoVsmvAHhw60WgF3Rf5iAh91qzP3QEzBKrdxveVnIvM3BWFogqSf+okYKq3mnDgn+u2j+DgziNq6VRPFE46EyUoth0nPZ0TBpCH9ShU8q4oLNNI4cBqE/J/EFlTZcOchXQY96r7w4HKaKjCydYn2SZipYo2Cn94Kn4YFJcOMRNC/FgC5nLLij731dN4V8E8bguLTfrDJs6M1Uz8MVCp1e6K9BYBr55LcVPlbE2QttAukl8xLuZ9FN4LpmUvD8WbyUuV54VjNfa1CvD02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=a1fFr37HGDC+ZBiUGHJDEvBCp02MANs3D58TdZg3h5A=;
 b=Vt5S+4LDSC8blQ2Nij4cn1dwx6+9iGecjgsoLnnEY49tD/2JiENqv1HV3wTa3ZrwUv9gI6Xti+ff8ZtwfpDNoJeF1P1MLUjV69icwZ/Bv/Dlr0xy7lRZ7U00xT2dzEMR9OA/lpDDmzEbZEzp7wt12Cp3mIJ3fyDXAR0EFOMILVzQ8+HO+GZMdfuxWvY8okKr2s5JDAfliitSCd/mwzFMMAJj4V0cEQu2PdPOrOPYQubrunFokggifl2JidN9emP7Ob2oWZOyB2ozNo7BBv27/g1CYbdRKuMfya1VZneNFgvxLngMONAbs6HE2mxvd6hhkfsLglDT/sWSoRb6hntKfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com
References: <osstest-164996-mainreport@xen.org>
 <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
 <24904.44119.940679.241639@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
 <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
 <alpine.DEB.2.21.2109221807131.17979@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93fe57d7-0315-c5b9-0edb-c7d02a2b825c@suse.com>
Date: Thu, 23 Sep 2021 11:24:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109221807131.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 907ef154-f76a-4578-230b-08d97e73e96c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293473D4CB613B74F3C66D5B3A39@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xyt/DO2+4aELjxzBkcrDXzWzIdb3PyiN4jFXvgBZmiqqsYNwXHreRh7TWbBLgOd8t4K2G4YyryymS9m7Yqauubj/0VDovfHk81bvAF5REdT7QDgA/8WQzZWXfHJ/Cg5/ceIU1oAF8zoIblQ0W8ska0wnTl3m0GMopuudW9yLKStxvdjBpPFvubS3ZXe7HRFXO65xabgfe/bxikBtg8niHsYa+cn84qK+KehRS03zk2zNHKEfwiCA5ig92/UpBnb585DCFNwBmHoL8R3/OS4x2v3txOlIGZieYgeW28QnYU6sqkeKRUC44TfULDpM4SkfAln4dOcnDMIyYBtbkUmSvZu8SBtRYRQ/I+YMDsmuNGnPQyHX8gi3mdWJEHGlBgrhfD6IuGiNUEhvklRw9loL2agMXuxig9qUsz48I3qz5QUxkrlktNy1tt9ERtGkXdoO8Or0vd4iUJ9YR5MfPWMhxNvSoBpLuHXpTnWTSnkZ1uZyKmYSnyd28F0XVLzSVu9BAP/pc56BdfSLP06pqld4VLSOGb5Khf7EyvkZy2wE/9czos9yoFhWTp7LStfQYko58KBdh8XoNeDwITbO7CZ0wpvELH1DKVYlhOOIQhOTWPOBPBJxKuixOrSUVoxgThPGdpnvzEocsQzLv/9ycep+r+Q7R2RrB+jGxcKIYO5P6FpScPuhtJBr3I1kDtdt/WQ3dnYLqhspdJYX7IGUdccqWy4dmAKNDR0DQpCWjR/coyMVno8eZwlRZ82PqwC3znbJV5wvie901Le2JtjaM0xoQJWT+k9TCyJWH72HJG+TQqikBcZZyp8kIFieUOxrbeEW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(83380400001)(16576012)(316002)(86362001)(6486002)(956004)(2616005)(36756003)(966005)(31686004)(31696002)(8936002)(66556008)(66476007)(8676002)(38100700002)(508600001)(4326008)(2906002)(66946007)(186003)(26005)(53546011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2FQai81d1hZRC9yeFNmcFZwaVlpMHZFNXAzUkFnb0V1dFBrNC9ENHlRQ2Mr?=
 =?utf-8?B?RzM4ZGlQYWRSY2VPV2k0ZjlEOHNEWU9JSjVYV0RnRm9PYXI0S2hzakVqcUp4?=
 =?utf-8?B?L29YeW8vdnBWMkl2YzFHOW5ML3ZvdFVYU25rZ0h3Nkc5RDFocFk5QVlJT0kr?=
 =?utf-8?B?ZVo1NFhMQVZMRnZhT2Qyb0YrTzRlZU5FMzR2eHQxOVcrVzEvbHRTQWNQU1RN?=
 =?utf-8?B?TnZaOEFQM0hnY1Y3MGhMb0N1RzJaSDlSdjhhME5nOFFCQ1gxS3M0K0FObC9T?=
 =?utf-8?B?a0NTQUlBbFNtakV0TUlBcEJrOXVvR0JjbGUzaVVwVElPeHNWV1VNS0ZyS29U?=
 =?utf-8?B?YmU3WkVPSk9XQ0pDSGI5ZlB5UUsyN01yR3ZkZUEvYUE2Q0hKUnU2Z3FnczBF?=
 =?utf-8?B?MVc3NzFFOWNGaUtqRCtNZ29MRE43emIvMTRYTmVpTzdHOEFZODZhb1c4YmQ3?=
 =?utf-8?B?bUFraHV0aUJUYkFWN3NKanNEVXJVN0NYVnJDOURoai9TRWNQQnBNYjI5Zk56?=
 =?utf-8?B?aVZXak1SOURxYWJwL3M3VU9oNy8ycTh4eEtNbE11a3M4bXozRlJJR2dwS25K?=
 =?utf-8?B?aEVQTlROWnpCczQ5cGRJNmJYNEM2Mi9VRUVQWWkvME13ODJpKzVzTUtHSUoz?=
 =?utf-8?B?OTcwTUhuNnpoVitHZXgrcms2bUNBVDB6enpsMkNPTCtjVko2Ni9iSC93c1pJ?=
 =?utf-8?B?VEluZSt3UnpwSkhLT05kSlo4M2E0ZDV6eFAxWXZiaEJ5ampuQkNJN1F3U1g3?=
 =?utf-8?B?ZnJEVEIyWklTQ1ZlQjlocWkxSmdSV01yVEplSVhSa0xFRXdmOEdIY2ZGYzBr?=
 =?utf-8?B?TzN0VXFzakNSMVdJaFRTM0xzRGgydXRUUjFFQlhrV2psL2dHcytVYWxXOUp2?=
 =?utf-8?B?S3ducDZFOHBDVU00c1JmZXlKSStnZ3pTd2hMOEQvM0h4TUVGWi9ibHg3ZUoz?=
 =?utf-8?B?a1QyQkZqUjBRZGRqU2hNd0xMTEFUand0KzdRWVp3OGdGSHYrZ3U1WVNqL3Zo?=
 =?utf-8?B?YnBnL1NUV0l5VEZKNk1tNHIySW14S01XTTdFakNibGJCaWU1WlpjRXJVQ24v?=
 =?utf-8?B?TW5sR0kzQ3M0YkdVdUtXMHptYkZMVjJaemJyNFk0V3dTVndOdEFiemluY2VH?=
 =?utf-8?B?S2RDWXJPUCt0NkRLdkdkVWEzZHgyajFXaFl4ZUtpcFlBTTdGWlhUazNRbGVY?=
 =?utf-8?B?ejNoVldKblZWc0s0N3BMTVZJWXlSSExzYm9xdlZ5bHJ6N0wwanRKQWpUVm5M?=
 =?utf-8?B?MS9PMXpMVnNZNlZ4RjBuVWJGRnpJbUxvNURTenUzZ1B4YjNwN3dSVEpKeUUx?=
 =?utf-8?B?SzFSSklyRE5nSVZlNTlPeTdmdXIwZG5YMlVXb0E2Wm1STHh6TXh5K2FFOW0z?=
 =?utf-8?B?eXhXVjBNRmxGTldLRGlLcEpkQldrbWFqa3VIRGZGRWVtZUxIakFNbXY4Nndw?=
 =?utf-8?B?NlJ4UVRabk9XcEdWbDkzNGZ2b1YxckRUM2lRa2ZtOVQ1MnNseEluY1IyRFZP?=
 =?utf-8?B?VFJReUtucUxnUlZBemplRUFSbC9RaVEzOURxWjBEYkZBd0ZZT2J0OGUreFhR?=
 =?utf-8?B?WVlPWVB1dEtxTmpjc1lMSlpCSnFmM3ZYSndXNGoxbEh5a1l2R2RtUVVhWU9n?=
 =?utf-8?B?WE5qcXhqbzZyQjk0ZHB6aFBhM3JsVUdFQ1NiaXdSOXIrMjc4c1hULzRaVGN5?=
 =?utf-8?B?dGdUMVFKUVlKcjlFQkpvMHMvRkJnaGlwUitzUWxLSmtJWjRyY2UvRjZNYi81?=
 =?utf-8?Q?XM2tczcJ4rIE3BKM/QUUF8YqKXFIkLxX+7GtH+W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907ef154-f76a-4578-230b-08d97e73e96c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 09:24:15.4431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWEJwTHU3IYpDk2Oe6JLlC7ZIYfz67wVDwnV12+ss05b58xbXZ0LDb5DeIKB38hmmUB2KOyHStiU2OBhYWFUjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

On 23.09.2021 03:10, Stefano Stabellini wrote:
> On Wed, 22 Sep 2021, Jan Beulich wrote:
>> On 22.09.2021 01:38, Stefano Stabellini wrote:
>>> On Mon, 20 Sep 2021, Ian Jackson wrote:
>>>> Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
>>>>> As per
>>>>>
>>>>> Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
>>>>> Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 inactive_anon:15857 isolated_anon:0
>>>>> Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286 inactive_file:11182 isolated_file:0
>>>>> Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30 writeback:0 unstable:0
>>>>> Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922 slab_unreclaimable:30234
>>>>> Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975 pagetables:401 bounce:0
>>>>> Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100 free_cma:1650
>>>>>
>>>>> the system doesn't look to really be out of memory; as per
>>>>>
>>>>> Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
>>>>>
>>>>> there even look to be a number of higher order pages available (albeit
>>>>> without digging I can't tell what "(C)" means). Nevertheless order-4
>>>>> allocations aren't really nice.
>>>>
>>>> The host history suggests this may possibly be related to a qemu update.
>>>>
>>>> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html
>>
>> Stefano - as per some of your investigation detailed further down I
>> wonder whether you had seen this part of Ian's reply. (Question of
>> course then is how that qemu update had managed to get pushed.)
>>
>>>> The grub cfg has this:
>>>>
>>>>  multiboot /xen placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  ${xen_rm_opts}
>>>>
>>>> It's not clear to me whether xen_rm_opts is "" or "no-real-mode edd=off".
>>>
>>> I definitely recommend to increase dom0 memory, especially as I guess
>>> the box is going to have a significant amount, far more than 4GB. I
>>> would set it to 2GB. Also the syntax on ARM is simpler, so it should be
>>> just: dom0_mem=2G
>>
>> Ian - I guess that's an adjustment relatively easy to make? I wonder
>> though whether we wouldn't want to address the underlying issue first.
>> Presumably not, because the fix would likely take quite some time to
>> propagate suitably. Yet if not, we will want to have some way of
>> verifying that an eventual fix there would have helped here.
>>
>>> In addition, I also did some investigation just in case there is
>>> actually a bug in the code and it is not a simple OOM problem.
>>
>> I think the actual issue is quite clear; what I'm struggling with is
>> why we weren't hit by it earlier.
>>
>> As imo always, non-order-0 allocations (perhaps excluding the bringing
>> up of the kernel or whichever entity) are to be avoided it at possible.
>> The offender in this case looks to be privcmd's alloc_empty_pages().
>> For it to request through kcalloc() what ends up being an order-4
>> allocation, the original IOCTL_PRIVCMD_MMAPBATCH must specify a pretty
>> large chunk of guest memory to get mapped. Which may in turn be
>> questionable, but I'm afraid I don't have the time to try to drill
>> down where that request is coming from and whether that also wouldn't
>> better be split up.
>>
>> The solution looks simple enough - convert from kcalloc() to kvcalloc().
>> I can certainly spin up a patch to Linux to this effect. Yet that still
>> won't answer the question of why this issue has popped up all of the
>> sudden (and hence whether there are things wanting changing elsewhere
>> as well).
> 
> Also, I saw your patches for Linux. Let's say that the patches are
> reviewed and enqueued immediately to be sent to Linus at the next
> opportunity. It is going to take a while for them to take effect in
> OSSTest, unless we import them somehow in the Linux tree used by OSSTest
> straight away, right?

Yes.

> Should we arrange for one test OSSTest flight now with the patches
> applied to see if they actually fix the issue? Otherwise we might end up
> waiting for nothing...

Not sure how easy it is to do one-off Linux builds then to be used in
hypervisor tests. Ian?

Jan


