Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F232548C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89881.169747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKTA-0004nX-NI; Thu, 25 Feb 2021 17:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89881.169747; Thu, 25 Feb 2021 17:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKTA-0004n8-Jg; Thu, 25 Feb 2021 17:30:32 +0000
Received: by outflank-mailman (input) for mailman id 89881;
 Thu, 25 Feb 2021 17:30:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFKT9-0004n3-96
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:30:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b4cc6a0-968e-4a6d-846e-ab33cdf14b86;
 Thu, 25 Feb 2021 17:30:30 +0000 (UTC)
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
X-Inumbo-ID: 4b4cc6a0-968e-4a6d-846e-ab33cdf14b86
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614274230;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zTXBL6wvcVLi1sVQaiP/6gIyNSA3VsLUSxgimK5THA0=;
  b=Teecy4+Djr4jY0V+TDDoPQGULhrI8RcvrM5j9hxoew2w788BtA7c7od3
   x02Ee4+/eeKTdCpl1Kzh2RMi60KyqUj37HG2qt7UDJeH52GUfwbgrohvn
   kOuQyqBF5kpX3ziEkAzTyheg/E8m8LihJQvFAkF8igvn3Cp0nDRvXYfv8
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gSIKiFCzRJmIea7cXePnFdofIoLVGidRly/gCaC4OlEvU1qi0R9BDQYqxUJiORYvbxbRRljVTq
 YmRpDoa93P3Q1G2SlATkF04ERHD75trrptGuDSvEJlIwZ1AcUzV3zqXPMTSUTuWZ0D4hrhY2kR
 xtQ2FYG6El97yygKqVlvXSQQbQq5h6qYiiwRfdcuQH7G6ADgjRiEA4uUnIPx8ioEwisOWUTMFX
 GFpZvq9BaeZXA+CTzWChQoaGyyqA7/ikln92tJeSAHVf50ZNfE71w5hcoAe0IYJ6cka2laKJzQ
 auA=
X-SBRS: 5.2
X-MesageID: 39434610
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,206,1610427600"; 
   d="scan'208";a="39434610"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn2yVX9MGqcWvT12cxG6paRC2mcjWd04qpzDltIRH4Wd9hS7cly58Wh97X6AqNUB1Mdw/6pE/cOl+7phkCdB9GJxZNRNtQCf7DNh18TogZ7WhkKf97KMsJnTC6PhZJchoqN4sU+pu6OJ2woqLgtdR6Ufhf/oEbVhz4oqK1Ps/MJ656l9kJFAT9OQIzYB2q4PltFe7+RSgxfxWoK3VEJxB9vKvqRuXjpZRQFwWD90FD4/PInasozaSs7VblVj5TSZCgKQxwFVboG3nwHTgndmafkpeCa+cehyZk6HxmNkJh5I7fZacpApMkcPp+D4EBtq14YWyT3mAKohlrk4/97H0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJMxrc93AYfTb0W2zQjsUvm/jjcfAHB6Z4+rCGsFggo=;
 b=d5AoX1Q7nAeaxquOzSm19FDGjoCd2tbFtfT/pk5DzHwn1WW3vMUt7qaigWp7HbJX9P9ZkBYQvG4NeEVV3JAFwP78x5ugkSBMr0FRiVZxaOlwADahEn5wUjpsUq5AIrK6Jx7dgFX9X4BubVDjwOPADEI8myWyHE2tGAtOcBXJkFdGELEQAa6WtQ/rHTyWhrrqiT7dWaOyn/tzf1OFds1oyCA3LqmKxGO6P1NYE9Zb0Q3/Osn0PsjLIchR8N5U36kGrnbyLAWm0UNzpVa9ld0Dz/6kRAPjQF7SCKivxdGUBgrI3zcJ9vc9aNamBJzgLqESC3A5dTplmoUw5DtQ+wxxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJMxrc93AYfTb0W2zQjsUvm/jjcfAHB6Z4+rCGsFggo=;
 b=oD+8IfIhN7D3x9N14vxBPAclVw6tWqo6gJQBu89oIEoXvemZ0g310x8MwZ/fhmKsZYIOp7sj771UDiIfIJz8US2TWv72/Iuuen6DBsP8zewuf351AO2hPWxbKCUjcFaELeNTER+n/F0Ex6y1MKbGsrm0ONz/MAGtpuPP9x/VfyE=
Subject: Re: [PATCH for-4.15] dmop: Add XEN_DMOP_nr_vcpus
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20210225170946.4297-1-andrew.cooper3@citrix.com>
 <24631.56478.814418.802877@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <12e99519-201a-89c2-eb4e-b67e1d1d3849@citrix.com>
Date: Thu, 25 Feb 2021 17:30:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <24631.56478.814418.802877@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0349.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7fd6819-730f-4c27-a33b-08d8d9b30a3c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4808462DA6C9F09606EF1B35BA9E9@BYAPR03MB4808.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 062pv/7wlOnHGKOrkI/7hO/8HVPx8L0ThWx3Lcstm15eKuF3TGSOicg3C1rxtTQ07m7D0A9vHBMuLXLwmC34US19Zhr+B7mwPBIBfj+mMrHqdEOO50VbOVw19ChvkATgbGVyadtOse+LxkRSjy5XxPyud8jMmbE3FTBEn1aDHx0/DyFFPAu6cNG4dGU27EUcPJGlJg+C8mQEM2Us7+9OdVEfYguFB5PEGr5i5T37Qt4Kqfbs6P408eE8fXbwdGzUIRjBRzr1Se9qspjauSBy4SOXiynaJ1g9wae5Jc9o9WGvrO1HOtBIjdmAoduT3ZSDC99OsIUgAgBwEHYdxv30XKjlT0BUV1oTML9PSz2S2CpZ1COv6d0mvtCWcKNS/46D8ykOY9FHuZT1rEasIaZjdN05BWHFymQZghgOC4X80VkGxzRMkqUz3usiee+Cg/EKg9Z6CeJx8c50hnLobb2lyWGYob0BS7u6KOEvVZwmNLWbXtlPnQBu1WeUyeJlIT+SgG3v+QCaFMkGAohlrfM8ddVpfRE+73gcIeGnUolFzs9WxdCeYGHrnQ5NKEEXC/E/hBrFHNjgomijhWJgNYZWoynlyPfexk9bHQGXY9VFREM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(2616005)(6666004)(36756003)(31696002)(31686004)(6916009)(6486002)(26005)(83380400001)(86362001)(4326008)(16576012)(478600001)(66556008)(956004)(5660300002)(8936002)(53546011)(66476007)(2906002)(54906003)(66946007)(186003)(8676002)(16526019)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUJON2diUkdLM0g3VFNwdGVCa3VYS1hWMFF4UmFDL3VUSW5md2lXOGh2Z3dD?=
 =?utf-8?B?cy93KzliaEcwVkpsZVExakRjdGFGSkhpZXRnbFFsK3g5QTNlZ1JYZmJGbUFv?=
 =?utf-8?B?VTErRGY5OGRQRCtGQ2cyRlBQQkVNS3dLN0R3SEwxODZXS0labXF4S1ZmL2VM?=
 =?utf-8?B?dDdNYnhXOW5qMExzeVhKTml2Z0t4UVpvMkJVNXVvL1k2ZEdHZlp4bTd6d2V6?=
 =?utf-8?B?SnBsOThSRTdOM2pDSjVoelAzcGppU0tkMjBhbzM4SmFOYWtCQkZOd0hTakVj?=
 =?utf-8?B?ckZxZkZDTFc4eGpVMkVOMGlSdUtwMmkxdHlMTHNXaTVIQTJKcGs4M1Flckhh?=
 =?utf-8?B?VDdYUytQUVc4Z1JXWjNWdEh4d1ZJVHhST09QVkNkOEpTYWVORVVBVk9MTVVt?=
 =?utf-8?B?enhBYzlVaWtGL1liUFJTS0dmVCtkcVlvU3Axa3QzUVdScUljeGF3bUZUY1NG?=
 =?utf-8?B?SklrK3d6cjhmcnArZkVOKzZwUUI4Ung4bnhzOWllSmpmLzZBVStyK1BFWVNh?=
 =?utf-8?B?Z1hycFRqVlpMaEcyWkVCdTVvSXZ2MFNKT05GeWZLVEo3WGpqZzJMQ1NjWHgx?=
 =?utf-8?B?a3oxOWZ6d3Vrc2V6SnVHeVZNVEt5SDlZTFJRTFF1cXIxekpKQ21WRmZhV0pS?=
 =?utf-8?B?ZDBTS3hmUjVUK1FkVkhHNG91MVFMYklSdWpONnFPdGcxUmhsaWl5QlNka21T?=
 =?utf-8?B?TDlwL1YwbkdSZkkwMWNXVE1lN0tvbUpBR3l3MEErTHR3V1grVk4yd2hHeCtI?=
 =?utf-8?B?SDNOTzhyY2xYbDJLOEJyTmlRT2ttQnpMR0xsNndudWFUNUVvcEVETW44TkZz?=
 =?utf-8?B?bHNTMFBSVUt0SmZLNUkxZjBRSWdiUGZvM05pTHFSTndlSEU4dUt4YXZjYlRI?=
 =?utf-8?B?cWt6Q2lXQ3IvQ1o1ajd2bjU3d3h0akdsaE5EY1RsN3A2SUxvOUhKa3lLOEI4?=
 =?utf-8?B?UVNCMWN2KzJFeDA5cWR4ZDkvMmI3cmROalMyWjl5UlRlZkl6V0xzODRKMllD?=
 =?utf-8?B?RXRjMnNkV2t5ak9BaDM2RW12dGJ0WklBMGdvNU1leXM1czNRWHIrM281NGp6?=
 =?utf-8?B?TlRKNUlHT0x3aG1HQXJFay82aXlEUWRjUmROVy9icFdkODdlWVJjZTZ1YzRT?=
 =?utf-8?B?YllxQlBYRkE1ZW5QQjNMVzVBSWpWOGxkcmhSZTgrNG5odUFITXY1dE5BOEZD?=
 =?utf-8?B?QklsOCtRd3RzVlM2TGpoL0pEcTlxVC9zb3dLYnVOYzZYVmxyWFM3THhhYjUx?=
 =?utf-8?B?aTRlQVJNUi9seEE4SnZ6bFRrOE9ua0Fvd2ZtR05iQnhSSlNmTnFlTTlRcCt4?=
 =?utf-8?B?TWhjNExuUjFVMG5PL1VORXMwRVVnbDZlMlJrN2hTUVIxTDNOK09hT1ZxQ2RC?=
 =?utf-8?B?YitjTXBVY29Vck5OZlcwVE1Kc3pEcFhzeUdmK25XMmJzNUd3MHRkK0JzclZX?=
 =?utf-8?B?YTdzY2NXR3JGYlk3TUVKTFNyM2tsRk50M1ZwOUxJdXpwZEc1U2xiS2NadEgz?=
 =?utf-8?B?cmtQZlBlTkp1eEcwMFl0ZkVjRTdSeHMwYTdudjJoZE8rUnRkOEk2NUUrVGZO?=
 =?utf-8?B?ZnNnVXMxUi9xVXpLQ3NobklRU0JwTytaVXhCcC8rRnNXdTkyTGdQUVFYUk1U?=
 =?utf-8?B?RUwvNmJwY1UyZ1ZRT1hoblZNMm1yWU5UM2tHZDVMZ2ladERqMHBpd1VuQnJh?=
 =?utf-8?B?aTJsdGxHN1RzbkhOcWNkaThyNnBoSFpGcUlaRnlxdUhFb2RRVXNCZnpPdk1i?=
 =?utf-8?Q?lXl6HhsYerw5ikNkLHemvzT3o7yyFw+Xvr3TJ5O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fd6819-730f-4c27-a33b-08d8d9b30a3c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 17:30:26.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBAHpfu2YAkNhtTlhA7O+lQtqihX0zdI4eOp0EGU2TgtDzNuAN9a3hfxxEZGdOK0Ag6oyMyKDLlm6m9K+OU+l2FUQ2yKZMh08gistzH0/mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4808
X-OriginatorOrg: citrix.com

On 25/02/2021 17:21, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH for-4.15] dmop: Add XEN_DMOP_nr_vcpus"):
>> Curiously absent from the stable API/ABIs is an ability to query the number of
>> vcpus which a domain has.  Emulators need to know this information in
>> particular to know how many stuct ioreq's live in the ioreq server mappings.
>>
>> In practice, this forces all userspace to link against libxenctrl to use
>> xc_domain_getinfo(), which rather defeats the purpose of the stable libraries.
> Wat

Yeah...  My reaction was similar.

>
>> For 4.15.  This was a surprise discovery in the massive ABI untangling effort
>> I'm currently doing for XenServer's new build system.
> Given that this is a new feature at a late stage I am going to say
> this:
>
> I will R-A it subject to it getting *two* independent Reviewed-by.
>
> I will try to one of them myself :-).
>
> ...
>
>> +/*
>> + * XEN_DMOP_nr_vcpus: Query the number of vCPUs a domain has.
>> + *
>> + * The number of vcpus a domain has is fixed from creation time.  This bound
>> + * is applicable to e.g. the vcpuid parameter of XEN_DMOP_inject_event, or
>> + * number of struct ioreq objects mapped via XENMEM_acquire_resource.
> AIUI from the code, the value is the maximum number of vcpus, in the
> sense that they are not necessarily all online.  In which case I think
> maybe you want to mention that here ?

Yeah - there is no guarantee that they're all online, or running.

Emulators tend to attach before the domain starts executing anyway.  The
important thing they need to do is loop through each struct ioreq in the
ioreq_server mapping to read the domid and bind the per-vcpu event
channel for notification of work to do.

The totally gross way of not needing this API is to scan through the
mapping and identify the first struct ioreq which has 0 listed for an
event channel, which is not a construct I wish to promote.

>
>> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
>> index 398993d5f4..cbbd20c958 100644
>> --- a/xen/include/xlat.lst
>> +++ b/xen/include/xlat.lst
>> @@ -107,6 +107,7 @@
>>  ?	dm_op_set_pci_intx_level	hvm/dm_op.h
>>  ?	dm_op_set_pci_link_route	hvm/dm_op.h
>>  ?	dm_op_track_dirty_vram		hvm/dm_op.h
>> +?	dm_op_nr_vcpus			hvm/dm_op.h
>>  !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op.h
>>  ?	vcpu_hvm_context		hvm/hvm_vcpu.h
>>  ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
>> -- 
> I have no idea what even.  I read the comment at the top of the file.
>
> So for *everything except the xlat.lst change*
> Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks.

This is the magic to make this hunk:

@@ -641,6 +651,7 @@ CHECK_dm_op_map_mem_type_to_ioreq_server;
 CHECK_dm_op_remote_shutdown;
 CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
+CHECK_dm_op_nr_vcpus;
 
 int compat_dm_op(domid_t domid,
                  unsigned int nr_bufs,

work, to do a build time check that the structure is identical between
32bit and 64bit builds.

~Andrew

