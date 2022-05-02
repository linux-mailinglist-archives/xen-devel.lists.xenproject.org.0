Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471F516AD8
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 08:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318638.538483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPUB-0004ZQ-Jf; Mon, 02 May 2022 06:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318638.538483; Mon, 02 May 2022 06:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPUB-0004XD-Du; Mon, 02 May 2022 06:24:43 +0000
Received: by outflank-mailman (input) for mailman id 318638;
 Mon, 02 May 2022 06:24:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlPUA-0004X7-C6
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 06:24:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c5fb2f5-c9e0-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 08:24:40 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-YkxAbIVsMiiDFAzEGMWf4g-1; Mon, 02 May 2022 08:24:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5491.eurprd04.prod.outlook.com (2603:10a6:208:115::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Mon, 2 May
 2022 06:24:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 06:24:29 +0000
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
X-Inumbo-ID: 8c5fb2f5-c9e0-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651472680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szyDTvul2sT9/3TeSOuZRAlC7ZjpaKimGak3PGjvGhg=;
	b=QXIFykRudOCpl1Q5ZBS3NpmBFDQIs5ZDLMDEPrnir8DLq9B+Yq58UTNHFUT71kMx4iyRc6
	1Hsaoe60o8YRq5jyJMVqhPLz7VWIvZHrOCvqAbmldtxDDWMwADIQuaYzIbBvy7y6x0IsVx
	fBasMfY9ztFKTyex4G35xHe7fS/CkjQ=
X-MC-Unique: YkxAbIVsMiiDFAzEGMWf4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV3/dFyCrFc9E4PMVVO1l5kHP52v8B3yHzf82blYCtVWRQvaCrYMeEi2XBaXewj6gP4bCTsSnbhdl0j0dhm1eTzHi3GSN3xIYJRgeNhXA2AZaUi47dTU/jP3L4Hc/e0urSaoI9WQ96cojcQU07anD44vCvweiTlRBGR2jgmPmtxM0HLtWEzF5M67ySHp5NdebqdMsomvLQfiYpm5MGk6ZU+H6EMO9KzXS8/ZmDvJanJaFfC/njSGKnrldhPU2lCjaIhOr+9YJLTi8l7fLnR0WeULe/4XyGHd+aGiKzL6xidz2eFtFgxv2wuTONojnwH7lbIX9/K1lJz3KJtbJ6nz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9R7I3NO+z+nhzpo7DQDK/nIYJ5x5gHtybATPYsmPzgc=;
 b=gEJ4QIudWUXuLkuxrmkzCL3o4gANRoqhfSWJunFrhH/WdZ32oy3Ag8ItW6Qxf+OLSSTh8rhO85gdGlklsglDTn9Ipt43eaMcOMDOHw6rD6vCRVv57ZJH52Vx2sph7HnQkdNzuf4+F/dKcHnCglCwC/mh1/ndswfs0PrbA2oCR1f3qKEAIPXM49yxoN3/aXVCU+uz2jEFNq2JRg7CVS+VpVgKsV/21e7eWgqnuwNE6vkylRQvTU7iRskbsA8fIEihkH0x+CW/gyR05gDrUpEUoogTW8gzvRkTl+4w4VhkezYrxYeVV8Cd38o+vB7ZYRL4egJmHL19nqsCZfyY9GOxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ad22939-1096-3d81-f998-4eaf1d9a1d8e@suse.com>
Date: Mon, 2 May 2022 08:24:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com> <YmmUtiBkhEYvXHUB@itl-email>
 <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com> <YmsbD9ktQqB4U33o@itl-email>
 <c9a57c65-05f4-b566-10cb-92ce9ffe9e0d@suse.com> <YmwbKwJh1Fft2F1H@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmwbKwJh1Fft2F1H@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0295.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::12) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33f70be3-d27d-4dda-2280-08da2c046a04
X-MS-TrafficTypeDiagnostic: AM0PR04MB5491:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5491BFBB2F7FF4FA52E7B3D0B3C19@AM0PR04MB5491.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9BhicGD4lPq0mPYvcsAxOAwQNTn9Nv//dP79ih1vPhHwnZPnerMDMebdtDxoVFG05d2fWxjcTXkfntGQSVOKStdlKNG7nDaHM82ts/QPwPpAtf/KIGhqFgAYDNPnYL2JpCRxl93yaSYexDqQOJ2X6VJ+eBa2BvvpaLuSYQs6EN9Zp5BGXULcw04kb51Van1IR5m6ZoEOC64pZxH7UpEnRNnMgZeltiQFHF2wxQoTHPIjeljaYZ2cnkbebgiAWNlFD2RdJae9W2Wx7OD76kTpPLvinMpBmIhLkNb6QmmFJRe29PGY0LbXkr6fVLrjDP0ZdKxGV2rgbCHoN9JTHr6CXwBJHaD84VEC73p5aoSLxhcoOkSmg07m5nmJGCr4u/pimhfiF8w+9p0DALB1HzQgP7beuPe3sp4VleCVO6YS3BYnxTUz2sQRgT+HZmmI4GXGP57fD+P343DqeRZzjr76DV82btc+XgUb+sQR0Oa25VAd7Tgg2Sfb4mbZWjA3qYJqbrf5YdWHkiZBTxMI/O/B6D8TRBIIjLGZz2VXZyu5u+rMfyeREGPLdQ+UMJXiZAlM/Mk8elAIpJZilAWzxYk8q43YI4/dEmoNd7UhXt9YBvlt9l/s8t7p0yPpmpo0Bt3Jb2ONSq+J3LuMbBjpPUsa0NmVQM+iMvYeWxFrH9MA31+YkeUr3E0muRYGl5/j4F4/dYFR0ukRHk0JlltnMtoE09LxYMJn4Aap1hCFbDIHPZdK2OVn04T2kFFwQTV8ftrfYuNqDSRX4m8wfTcHh5tHDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6506007)(6666004)(53546011)(5660300002)(66946007)(6512007)(6916009)(8676002)(316002)(66556008)(66476007)(4326008)(54906003)(38100700002)(508600001)(31696002)(6486002)(86362001)(186003)(2616005)(83380400001)(36756003)(26005)(2906002)(31686004)(15583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2q65q/FYTazDFBuyU8XrzqNMuKqbJumWhXtcDNtHQg29H6iMKXSH28RHYaYQ?=
 =?us-ascii?Q?bFJDYFQRHEn7nDV0Y/imcZhTjmLuRvTwmpOUiy2HS+ayZ9Sm5lDwFSGWtc3J?=
 =?us-ascii?Q?lyVeWLQ7kOZYZ5SustY5BQcfzYWpgzcgiBRH/D6l5DMFtECL65QhD4xg+L52?=
 =?us-ascii?Q?o22IPfUfP+6WU9oPOmYn++4Rql+008HYGbl8ldrDnkYlWW9AsveAezMXqTO8?=
 =?us-ascii?Q?jCn8QBpaC6euQJt4pQ91/R5cRZORFffgfGmcObDrbekZdm/fzwqc7gR6ZUFT?=
 =?us-ascii?Q?5YLrxivtEcHe1Nj+JTu6Q3qUxN41MyXUqAT/ioE9qxZqyDnwAonCVw2EO3v8?=
 =?us-ascii?Q?LHkxO+PvMYV/cYJ+f5CNbEbofTw3wEEl2ZmamH2LHQ7ByUQMQX8rT6gRLytZ?=
 =?us-ascii?Q?PTd566VpGlBeYo8yRiA4umIeRb7YWI1RY8R1BQ+Jz2PuP1TSyfIC3RZ7prpk?=
 =?us-ascii?Q?LTfRrUS6/ya6Doprk6+oYuqcSHbYCA72X9na72iUsMGiwho2kvuC8F4zog/u?=
 =?us-ascii?Q?9JXkUBMk1xotYgt0agZuoW3aPwouMb+mC+MbYw3+FTjUu74RZEJAXj+gaBl9?=
 =?us-ascii?Q?9GE1CqIispj65XI2WJ/Y45ERBfdIuGjcid2q22yCfRGjw1i4u8G4I3bxfj2B?=
 =?us-ascii?Q?MvB9r5RvvP8YZ2X0cAYFAcMB+1/iI1eWdFtLztxQguuullGtrpVyeDEXq1oM?=
 =?us-ascii?Q?hPwOr4gUSAlyLy/pCXDQcU726AzKtQ+HO2EHy3eEQNVHDRPkDy7jPdFwN4zD?=
 =?us-ascii?Q?pH9g8LirnHiIpH2JktPLVgJ5CEg5O84gZ92cRNWPMOXPJ6i9WqgpsxbKgscm?=
 =?us-ascii?Q?Cu/x198fgQ/StQIBxCLc2HiH0NgDpqBsGpTF1ZsxHa0DEk1XnYVOYIDYeuZw?=
 =?us-ascii?Q?CyKDjN3TtMe8nEbPAix1XeLRfnz+VCTMo3goob9Htwpxly5FSCAeevw/F3+N?=
 =?us-ascii?Q?0IFGrv/n5og56+D1fMlI04cEs6TJGT5Gp6TEBYF72sDlQoUZHFuTf3AsX5pF?=
 =?us-ascii?Q?JF+HkOxPud2Yi1Mk6IMcnVoQdFT6ItB8iOEwigi0xCN1PcGx6CrMAxpqUat2?=
 =?us-ascii?Q?nmWkFr+3GGdPQWawo/1vHS3w2Qe4NTshZRa331j+OVnfhGyQ3pSHet5ewrPm?=
 =?us-ascii?Q?6DaE+ZIqK1NzdOVWDj4zVY0rHkJWkMMymiGnfaE+98wiqfXAm8tY82gFm9op?=
 =?us-ascii?Q?6eViaifGuinrtixlEUtrLrH8pOZks0YmRiAIrap7+uvWeXRVXHPHVgINgZZI?=
 =?us-ascii?Q?PypcgiDVl0CTF8+/2TaRoV/fKrpvJARXbEkjIMJDmEMFT82dm9k7YAUBjXnk?=
 =?us-ascii?Q?6r62DJX/mj8hd3xbuRwEF8QcSo4sbzhKfbrMjs6FYW9lJqidJAtw2PHirgI7?=
 =?us-ascii?Q?1sW05e63sRjz6EO08KFgeWGJbW14n8d62fF2rCuWLS3Us3KzPrg1/OC8fhbW?=
 =?us-ascii?Q?WIDqRbdAo0ZBpJ2uK5ty7HfQ6BcmkT/Hv3Uf1YW8mwi+OnjCxnNoWVyJlUwR?=
 =?us-ascii?Q?vrxzyxhHq22ZtzOdpc06RrQ76lVSb/SSaWJeWmjwSDTdm/QADAbj53I5Z1jI?=
 =?us-ascii?Q?It2uxd9cE/VKTRf3ugCcjv7l0EwSZdh8lIUY2GxEj7DAjB9c4SQyX9r6vVD9?=
 =?us-ascii?Q?W04SwH7S2os13NDHJKbFK5N2FmXB7391T37raG3HIXQHAnw+Youb5jsPYB+B?=
 =?us-ascii?Q?PTink2/gt8vDUALaypqI0I8B0uiCrsIleAU5wyU0CWwAIBdEXx8fbWPIF0Qd?=
 =?us-ascii?Q?QDPgGkN0wQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f70be3-d27d-4dda-2280-08da2c046a04
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 06:24:29.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8xv4VALYPe0yWsh1o+IG2F5tDLH59UnuBEzIRcaQA/Ls7uMgiQ9TGQMgZZ4ixGLZSY1WyuHFfE3oz+tLmHTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5491

On 29.04.2022 19:06, Demi Marie Obenour wrote:
> On Fri, Apr 29, 2022 at 10:40:42AM +0200, Jan Beulich wrote:
>> On 29.04.2022 00:54, Demi Marie Obenour wrote:
>>> On Thu, Apr 28, 2022 at 08:47:49AM +0200, Jan Beulich wrote:
>>>> On 27.04.2022 21:08, Demi Marie Obenour wrote:
>>>>> On further thought, I think the hypercall approach is actually better
>>>>> than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO to
>>>>> return anything other than the actual firmware-provided memory
>>>>> information, and the current approach seems to require more and more
>>>>> special-casing of the ESRT, not to mention potentially wasting memory
>>>>> and splitting a potentially large memory region into two smaller ones=
.
>>>>> By copying the entire ESRT into memory owned by Xen, the logic become=
s
>>>>> significantly simpler on both the Xen and dom0 sides.
>>>>
>>>> I actually did consider the option of making a private copy when you d=
id
>>>> send the initial version of this, but I'm not convinced this simplifie=
s
>>>> things from a kernel perspective: They'd now need to discover the tabl=
e
>>>> by some entirely different means. In Linux at least such divergence
>>>> "just for Xen" hasn't been liked in the past.
>>>>
>>>> There's also the question of how to propagate the information across
>>>> kexec. But I guess that question exists even outside of Xen, with the
>>>> area living in memory which the OS is expected to recycle.
>>>
>>> Indeed it does.  A simple rule might be, =E2=80=9COnly trust the ESRT i=
f it is
>>> in memory of type EfiRuntimeServicesData.=E2=80=9D  That is easy to ach=
ieve by
>>> monkeypatching the config table as you suggested below.
>>>
>>> I *am* worried that the config table might be mapped read-only on some
>>> systems, in which case the overwrite would cause a fatal page fault.  I=
s
>>> there a way for Xen to check for this?
>>
>> While in boot mode, aiui page tables aren't supposed to be enforcing
>> access restrictions. Recall that on other architectures EFI even runs
>> with paging disabled; this simply is not possible for x86-64.
>=20
> Yikes!  No wonder firmware has nonexistent exploit mitigations.  They
> really ought to start porting UEFI to Rust, with ASLR, NX, stack
> canaries, a hardened allocator, and support for de-priviliged services
> that run in user mode.
>=20
> That reminds me: Can Xen itself run from ROM?

I guess that could be possible in principle, but would certainly require
some work.

>  Xen is being ported to
> POWER for use in Qubes OS, and one approach under consideration is to
> have Xen and a mini-dom0 be part of the firmware.  Personally, I really
> like this approach, as it makes untrusted storage domains much simpler.
> If this should be a separate email thread, let me know.

It probably should be.

>> So
>> portable firmware shouldn't map anything r/o. In principle the pointer
>> could still be in ROM; I consider this unlikely, but we could check
>> for that (just like we could do a page table walk to figure out
>> whether a r/o mapping would prevent us from updating the field).
>=20
> Is there a utility function that could be used for this?

I don't think there is.

>>>  It could also be undefined behavior to modify it.
>>
>> That's the bigger worry I have.
>=20
> Turns out that it is *not* undefined behavior, so long as
> ExitBootServices() has not been called.  This is becaues EFI drivers
> will modify the config table, so firmware cannot assume it to be
> read-only.

Ah, right - we could even use InstallConfigurationTable() ourselves
to make the adjustment.

>>>>> Is using ebmalloc() to allocate a copy of the ESRT a reasonable optio=
n?
>>>>
>>>> I'd suggest to try hard to avoid ebmalloc(). It ought to be possible t=
o
>>>> make the copy before ExitBootServices(), via normal EFI allocation. If
>>>> replacing a pointer in the config table was okay(ish), this could even
>>>> be utilized to overcome the kexec problem.
>>>
>>> What type should I use for the allocation?  EfiLoaderData looks like th=
e
>>> most consistent choice, but I am not sure if memory so allocated remain=
s
>>> valid when Xen hands off to the OS, so EfiRuntimeServicesData might be =
a
>>> better choice.
>>
>> It definitely is. We do recycle EfiLoaderData ourselves.
>=20
> I wonder why the ESRT was not in EfiRuntimeServicesData to begin with.

So do I.

>>>  To avoid memory leaks from repeated kexec(), this could
>>> be made conditional on the ESRT not being in memory of type
>>> EfiRuntimeServicesData to begin with.
>>
>> Of course - there's no point relocating the blob when it already is
>> immune to recycling.
>=20
> Yup.  Is it reasonable for dom0 to check that the ESRT is in
> EfiRuntimeServicesData when under Xen?

I think it is, but kernel folks may not like Xen specific code in this
(or about any) area.

Jan


