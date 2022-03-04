Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EC74CCE44
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 08:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283960.483074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ1x6-0004vJ-Cu; Fri, 04 Mar 2022 07:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283960.483074; Fri, 04 Mar 2022 07:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ1x6-0004sx-7w; Fri, 04 Mar 2022 07:02:12 +0000
Received: by outflank-mailman (input) for mailman id 283960;
 Fri, 04 Mar 2022 07:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ1x3-0004sr-Or
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 07:02:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 006f0ce2-9b89-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 08:02:06 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-cPUy5g2FMB6P4JcitluEOA-1; Fri, 04 Mar 2022 08:02:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8367.eurprd04.prod.outlook.com (2603:10a6:102:1c7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 07:02:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 07:02:02 +0000
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
X-Inumbo-ID: 006f0ce2-9b89-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646377326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2B0lIJ9tAjzbrUIlL9HmnypKenAbC+cZenZHpOlip8=;
	b=ggOSxdEXodBTmA2YC5okwY7C54XY4qY6ov3NIW6sSzBCba3ERohteuylS+QQKyfRZfa/Qq
	8YVn38bvf+pi/p7HgyOAak19aDpOkpOWsOjvb13gyaCewcI01/t5pGkfmm9rilSiRhzYhW
	9HVQlEkLkTLZ+inc+4c4J6C2Vas0+L0=
X-MC-Unique: cPUy5g2FMB6P4JcitluEOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdnAhoVKHeoJ/6hdHOgC3ZJtBSTpICAWzre2uEis4/ZtdFW9tf0CKgnZ2rEY6AGlwDkSsnKl1sx4ui5dENQ2hWYSfmiN9agMvoE3LDHPmwoVllUvmTYp42D79POiqQKVhNjK5tnigy/4hhWBGmCLq+AlIrNT3K7HD72eaWJg84qTo6iGreWHiqOsaRHkIw95EejDJIItGMIo2QLnPlYm95ZkmGxvZwl6X9aIv9LoJeFKLZ7dT1Zaf9+9ordP6NAtDiAPtv2SXP7GWXj5echfwckUg83X8kzhgOZX49Avj5vKh92u8wghhh8EfNzYd9wistk6393MnUJVwhSnJSfzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2B0lIJ9tAjzbrUIlL9HmnypKenAbC+cZenZHpOlip8=;
 b=e9rJBM0VmYNJ2JsaYU5Nj9jyWIHEAmK0ZL4BGCggpKKFBIV0ABYI32WHHguaCgyoa3N/rjR42NDCiA//kHpOTMh5IDCVP18hTxWu9+p406Igs2UNG/V9DD/+LdqCU6Tpio/OHtbOTXg9F1sagdKzhaBdHDNtqo0brk/DnOh9tWlfcrHLq1rnqdk9ZMhAHrWLn4WpsO/ScxGMRmrR/Nc+L6JZf/av21BnqWoaWy/sNH75HJXsENWkVENGFOarIg9cyGPiyBoKYwq6Md8YDcH5vlmmkewhSh/N6BR8/EfQA+B6maFDQaqhQWasoiUn2evDAY1MHeLRG14CFTPfSYdJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd668aaf-441b-d7d1-1a07-15f0aec870b8@suse.com>
Date: Fri, 4 Mar 2022 08:02:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Content-Language: en-US
To: Alex Olson <this.is.a0lson@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-4-roger.pau@citrix.com>
 <9a02db6a23b269fe774ad4a0bc4c662e5e4df37c.camel@gmail.com>
 <c416bfc2-218a-e641-5fd7-505ea4f7a322@suse.com>
 <8a1fc9175a1227e8f7271face85e5a38671e0891.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8a1fc9175a1227e8f7271face85e5a38671e0891.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7695ea34-4410-4448-8df2-08d9fdace250
X-MS-TrafficTypeDiagnostic: PAXPR04MB8367:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB836742DB16802E232C9AE4CCB3059@PAXPR04MB8367.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GLcwiWmU05dSXanRXmTqnsqt2QfXKWjjaQQRkKNyPnELi4tKYau04/T2EAW89jlRpRNOSR1o4jBdkBBcOjqGKCu154VhUV7lBAbOA+SlteUWT3OtluNLghPDdxyKLO0KdwdTj3Tzlf7oG6oRrhfObzZ+DpFFCGhCq1zE/AKqmtalpBxnVVAjvVfrRU7AZXxerJjqoelThbQtQeopVKcAHbOdXSCuORp41JnP00mlDncEEOEVt0/pfBVINEzmtpRKI2Gi7LC7i16/H4EX0BdiL26jCaAIwqir+fEMQh8mXW1RHZnePd6PxbvSKhCkYz84YqtZA3Wzg9qYfd6iFCJEagc82iyePxIE41yXM/VT4wOzeX3Q4Xua5qag2cii3gxqb3tVRiv6/H8QhlHQgvq8jweruOnZvYS0LcYD8xtmGqU7OozyzLgwq/uhKM4OgdFoEk6Wdu+FoKw90+QnuClcqVMbqlvifCIr96piGhgUl2TaBhZ+QXPT1vy0xT9xi70q07kFrzJwRPVGTeIEV3yFlhYLAe4zuej8LIU0R2BDVqObsvFHe4MTik6qo+q2wfnCX84Hg1nEcAuGMtfEgE0awodlT6VPgyOJR4HFqjIeoqkM4NVRJE1W0Ok+XwodgtFWCiFE96kRCLKY9wC7kAvy3zzrq7OmjvDGRbIX4pAAvHSouqmK2Ibna+JpVCPloDWJYqN+RZb07iqGiuSchDiySVGTmT6PnZbG6eO+Qv4bDb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(6506007)(66556008)(53546011)(8676002)(6916009)(66946007)(6512007)(2616005)(6486002)(31696002)(316002)(54906003)(508600001)(86362001)(83380400001)(26005)(186003)(38100700002)(4326008)(36756003)(8936002)(31686004)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXBZMmREc3g5cWxRZFFxc3J3cERXUmxmc2dqVkZzVmZ3bFhvaHMyekdnVG1t?=
 =?utf-8?B?RVRqaHFUYjJYbitxT2dleUh2ZUdFOVhUWEw0MU1SK0YxSkJraDZxSGpTcHVh?=
 =?utf-8?B?MUxZV0lSem8zVHhhUEJub2RpYW5YOUl5WWtPNE1aKzB1Q3EwZlBjT0pzTEF6?=
 =?utf-8?B?UlFEWklTazRlTDdDc2ErakZTRzBuK2FLN1U3c0RxNUhyV0pSTmFvd0VTcnlR?=
 =?utf-8?B?MlVJQSt5K1JlQW9BVURRdDU4ZkJ6a00zdG52VG5jWElKY09yem5QZy9xcm1h?=
 =?utf-8?B?QzVnSldFcVVqbEk0WG14QUk2NDlqU25aTWpmdFBzbGxjRFBEdWE5U2tKUUla?=
 =?utf-8?B?Z0QxNnlQUFZPcytZYzBOcjdzaHFYN2JXRmdvc2d2NitVOUlUb2Z6TGttVS91?=
 =?utf-8?B?aU5VOWppa0Zoa1ZheHBOMEUxcHF2ZDFHRFZCQTlRM0VPVWtBY2hNdmNheEhU?=
 =?utf-8?B?TWhwd0RYR3diQ1JsQ2J2Zy9JTVRFMVdHY0gyaFYxS08yNUV6aWQzeE5IdXRV?=
 =?utf-8?B?YmJUYnBtYW9NL2J4dm9QMlY1U0t6a21HbVlvRGhCaFdtRVFtNmtENnIvdWdJ?=
 =?utf-8?B?U2szSjQ5VHQzWG5aVDByc09HazJoMDdEYy96WW1JYkpZSlA2YUExRjlFQ2lW?=
 =?utf-8?B?bVJuKzBSTC9lT0hpeWowNmI1U3JKaUk5SHV2OWg3endiM215Z0VDVSttTVZa?=
 =?utf-8?B?N2pSc255aUVKWWpObVFNSVpVQ1lGQUhOS3UxWUJncERJSDBvbVR0bzA5bnBn?=
 =?utf-8?B?enA3b2MwRCt6OEVMYTR2SE11ZHlxT0k2QW5RLzd3TWx4bkhoVjRRV3owMGtk?=
 =?utf-8?B?TGNQWm9nRHlzbWk3b2hNR2lUMGVRbnNibll2T3Zvc1hMMy9GeUY4M2Njdklt?=
 =?utf-8?B?R0o4TDJYaXp0ZlNZc2dlNzFTR2pMN0NFSjN2aUJONWdGTjhkQWc5U1ZGRENX?=
 =?utf-8?B?djQvWno5MDlJczZKL1MzcFVheWNTeHRoSDZFcGZ3aUhFSGM0Rk1pYlFxRW1Y?=
 =?utf-8?B?QXNuOVA2YWJNYU5ZSDhLbTF0azZLT29hN3VIUk1lak91QXMxTkZkRGEvd3Nu?=
 =?utf-8?B?SmFLM1B1RnkzUTdKdHVHWmlDTm84SEc3Z1BPekVDUzdoL0Q3VWsxZkFxWmk5?=
 =?utf-8?B?L09kbVN4anhoZC9hdU1lbFVvRGxnODcxenlCS2E5OGNPQnJsVGdDaVlEeVdF?=
 =?utf-8?B?L2FtS2JrNXdRaWtoU1JtMkdNT0VQenRiTGJHOGJOY1QxcTlSWVFTc2lnS1pP?=
 =?utf-8?B?d1dURmNCWlZJdjNYKzBFUDhyMm5HLytiUVhzWVRkNU5FOXlWN3JoOHF3SHdN?=
 =?utf-8?B?NlM2ZWtJTkVEL3FSaG94LzB6UjVvQzRqR3cyYmptN2p4RmVQZ2NGWld2M3pL?=
 =?utf-8?B?MjAyNmRGbFRGNllBSnp0dm0rMVVYY3dDRDQ0d3p1Zk93ZVBlUzNRRGFuTVBK?=
 =?utf-8?B?ODM5bTEzeVEvUjZTODRnbkF4cndyYjA5Uk5YekI4aGhyRktxRjFzNmxYcllS?=
 =?utf-8?B?ZngzNWkwYVdZN3NnYW1VUHZiNlpvb3h6aXUxVGNPY0tNRmRVYUZ6b0xmTk85?=
 =?utf-8?B?VFlpOU5JYVZHMkNCRTZBT2F5cyt4K0cvL0wwZHFLbURRbGV5VHg0czhYQUNT?=
 =?utf-8?B?a216bzdFOHRoV2RRUlZwT2VhRkNoeGJWYTNGQXhGaDI5N2JBQnlITWR1UHlq?=
 =?utf-8?B?eW5mOTExSmdGMGxvMW9weDJzUEdvOFl2Q0VyMjBlMEdnd3pJcG44b0xQTlhh?=
 =?utf-8?B?K0NDaVltTk1mYSs2Nm9kNjBwdUVPaGxvWklyRm9vWW13WmdoSXRHSmVVeENq?=
 =?utf-8?B?aGFIUlVjUndPY3BGQSt1NTkvUjVGdW9GdXVkR0I1U2F2ZUJmc25Hbk12RlRK?=
 =?utf-8?B?MEpMVWg4aXQyQlpIU3BNY3V0TjBPVENScjIzMlh6YjZCZllQcXp2QVM4bXYr?=
 =?utf-8?B?VGhTVGo3WkxjTDVoN2hvK0hrb0NySWJPZjdEVk56K2lTWG9hTm1UZlUreWN2?=
 =?utf-8?B?Z0w1dWJ4MzF4cFZnVnhwZjUxVUZNVC9ZVGhuS25kLzA3MllkY1FlZ2tPdVl2?=
 =?utf-8?B?Sk1tMlFMMnlkZmlTb3Z0SXg0OHRpREVRZlVZalNOWWoydm8vRXlEbnJEMHZu?=
 =?utf-8?B?T0lVbVRPVUlPY25IUzVtWUhyNnVJajZCTlJtSm5CT1RDeFVSVXk5UUQ4TTFo?=
 =?utf-8?Q?N4bfMzGKbRNbEoj1/ZTuq74=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7695ea34-4410-4448-8df2-08d9fdace250
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 07:02:02.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKV+59YAADT6evw4VrzupmT+Cwf/mEJzJUIyZilZlxo/bv7GAn9ZqQOFfYH4Hz9+DjLjapiwx035V5OBxUu3gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8367

On 03.03.2022 18:14, Alex Olson wrote:
> I wasn't sure of the distinction between hardware domain and control domain for these commands, but they appear to be blocked at the moment when dom0 executes them, including a lot at boot.  Are you suggesting to use is_hardware_domain(currd) instead in my diff?    
> 
> Or should the hardware domain always be able to execute any physdev op command? (such as to bypass the switch statement entirely)

No, certainly not. It was on purpose to restrict PVH Dom0. Only PV
Dom0 is supposed to be able to access all sub-ops.

> It looks like hvm_physdev_op() is the only real caller of do_physdev_op(), and  several other commands (besides the ones in the diff below) are also being blocked by the default case of hvm_physdev_op.
> 
> PHYSDEVOP_pirq_eoi_gmfn_v2
> PHYSDEVOP_pirq_eoi_gmfn_v1
> PHYSDEVOP_IRQ_UNMASK_NOTIFY // legacy?
> PHYSDEVOP_apic_read
> PHYSDEVOP_apic_write
> PHYSDEVOP_alloc_irq_vector
> PHYSDEVOP_set_iopl
> PHYSDEVOP_set_iobitmap
> PHYSDEVOP_restore_msi
> PHYSDEVOP_restore_msi_ext
> PHYSDEVOP_setup_gsi
> PHYSDEVOP_get_free_pirq
> PHYSDEVOP_dbgp_op
> 
> Thanks
> 
> -Alex

Also - please don't top-post.

Jan

> On Thu, 2022-03-03 at 17:47 +0100, Jan Beulich wrote:
>> On 03.03.2022 17:45, Alex Olson wrote:
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -84,6 +84,17 @@ static long hvm_physdev_op(int cmd,
>>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>  
>>>      switch ( cmd )
>>>      {
>>> +
>>> +    case PHYSDEVOP_manage_pci_add:
>>> +    case PHYSDEVOP_manage_pci_remove:
>>> +    case PHYSDEVOP_pci_device_add:
>>> +    case PHYSDEVOP_pci_device_remove:
>>> +    case PHYSDEVOP_manage_pci_add_ext:
>>> +    case PHYSDEVOP_prepare_msix:
>>> +    case PHYSDEVOP_release_msix:
>>> +        if ( is_control_domain(currd) )
>>> +            break;
>>
>> These are all operations which I think are purposefully permitted to
>> be invoked by the hardware domain only. That's where all the devices
>> live when they're not passed through to guests.
>>
>> Jan
>>
> 


