Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF33265F1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 17:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90470.171278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgQ4-0003Co-AL; Fri, 26 Feb 2021 16:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90470.171278; Fri, 26 Feb 2021 16:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgQ4-0003CS-6Y; Fri, 26 Feb 2021 16:56:48 +0000
Received: by outflank-mailman (input) for mailman id 90470;
 Fri, 26 Feb 2021 16:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFgQ2-0003CN-Pb
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 16:56:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d20dde0b-11a4-4d7a-bc24-7dc151004b72;
 Fri, 26 Feb 2021 16:56:45 +0000 (UTC)
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
X-Inumbo-ID: d20dde0b-11a4-4d7a-bc24-7dc151004b72
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614358605;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cWYB9IsTD+qrlGJpq52pabGhea51goCLkz8tNK+CHcw=;
  b=S2Jdxjir5Z1dHejJaXm/T2HIF6UTnWTbO52DPeCGRyJ4TLPycpl/Nou5
   LjSdF/BdLFiS2kKNlYStfGVrHk6WLmPGNQxYp3YKefRZrC/nb0006NDLA
   xGvioLUtQPplDn+w6Da+LHeWP/KYcNNFqRd73cRhngXzhjYPmdzoY++Cy
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FWMcR9mtOiyoi2rPVN6rkM/o8QDUh6FJXGbkHTy4n1rOA7ULk3UAswna5Du4Em7hdwksVej4ep
 ABVytrtdlkvxbxO7H5yPXuMQy3lneEUQZXhf3kpYd353DeT18yENZiK8BckkkmD4eIOA+I8ruz
 /9Lu1E5ckj1o44/6LwlYu9aaCMqv7STQwba+sHRiUus+Au602bupr3Qar2UiFmbqqM8VPfttal
 nzG2IyZJmMxivGMVgvx/Rc2F6P6OmqEkTkXAKkns5g3LcRTGPjlKAW8StL6blyaQcZvJuXPhbV
 kR4=
X-SBRS: 5.2
X-MesageID: 38137569
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,209,1610427600"; 
   d="scan'208";a="38137569"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXIZfLHZJOL3Vt43JqA67bidLDugjzm01WA74kYsh4hKPvtLRrJzWnPLkGrcmaWZDTWqs7touCtW/gpkdimHSacdcuNXFQzZ24gYjHCPXrzqtYhIF2syMxXXkLIEsCZvydEcCCv0dz85/u9VouTxz1fbpR4qdnsq8FXD/pa2eKZyL9y0iafV2jX5R/GS98PA/LUy+2bBRUrBSbpUPozQgZv997P30OnRThVDY13jhRjhwtviPPicVn6YXDccMyGxLgIvOfpzTfju4qRxjjFNms6DbdNZwEIqnftWeHmZC1fxDJpy1XRmFiA8SIowLAyY6ysh9eynZ4PfrqPYcR93Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hoPS/paFSn1bbFxqzXZ9/mrVuQvZQ+8Ti19QRzKOPg=;
 b=MW3HwasM8UlL9MBIUJ2TN1279A++OkIgSxngRFNeLZbe3Qty/1asv2radZgHTkcKnvymGTifLMYxpuTidqTaYtJN5+iHF2RWAiBkUc8eCkHueQqpxH0YgdNw+xZ9a8aemBbZeTDYXmzwYqfydSayzwY5ggWLLFm+tH2R30pKwpmzn3DXmZSd5cqzk3qXcxQKJbtdwZanjgWdR7NyozHFNAe/N9+36cOkTcNRfPdLhziNjb6ukvRgD6lLLmx+9NsoQhHJxpGUKpNuc9zjTfTMS81aGz3hJ99X0I6Rvekr56zdL/2LR4jT7HI5EnCOA4slGXMVHjz0PXFU1QwvMgcEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hoPS/paFSn1bbFxqzXZ9/mrVuQvZQ+8Ti19QRzKOPg=;
 b=h1ylYR4JwSbaeDzPpJdTp+nTokVWphsFsKFsDU2PCKvsLIY7E0i1X0T6xgED34b1MBaaZLTOU1MezAu+RkWNanwSb/1yNvQhfZiHDKEOlVngeXaykIPcKv1RDaC+ECEAWLkeBoSLE+HjIGJzM/f1cf2lXqkE2QiDDywDB2wvJuY=
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
	<connojdavis@gmail.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
 <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
 <0d58bca1-0998-1114-d023-0d8a5a193961@gmail.com>
 <c6ed745b-3847-b878-f683-2d1041be22a1@citrix.com>
 <247706ec-c011-5217-7b6e-deedf22cac84@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4834f606-d691-88ab-6a75-34ecd4721389@citrix.com>
Date: Fri, 26 Feb 2021 16:56:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <247706ec-c011-5217-7b6e-deedf22cac84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0421.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0935b7f2-7367-4a7c-41a4-08d8da777d42
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5597:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB559739B1BD03B38790ED038BBA9D9@SJ0PR03MB5597.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3r9p77cGI2wiq8fLeoOQahGQE671LkdYBGNvm9yNFHIIzlslX1rL3LbP3TQCF4hnfIKRwY1QeoJPHxjdViQn+h9vEjqmFqHYX/NFBWQFUdyOvaEux9mWjOzIK1eY87eR9FZtxlE7jiw5aUMSwe1qhv9l0NWiPXYM/Gg5FA3y7ZPMUrwf79OuH+O5z7KFMPnR49ugoxawGU5/PEBH7Z2oiKYJKIhUh9uaS62dHMZua8TlsQwAHLVTZMH3x1Dm9Ftn2ulea9x1o1eymoSth9+JR1e4ug6TyTrUuIgFkfB69lcmuL2QN8WNGloECAdsBp2JwF9jNmROEwHe1B3obU6xspAxsXa6QpSnwRD8LAZCFHCbcOJZFobwUR86hEOCZd7r82YrQ0T0dvKPY/LSptjMLhv0S2UonhM8Po84uE3TVbPgozoXCr49LmonjqfjpLZQfFkJ+s69Atpun9uGs3wkYcUcTYojmIOuNjTJQJKBJ5NRwLmx7K2Y9HfDOa/f0upbJea9FNppZJ0ob/JLT7Ixf6wkAnweap7nLiqP1mfMN3NYv4YEdE+JZ7e7Pptihh0dAPfS9AZglc04QeV43cGQ4KaxA4udcq71obIAA2Tt0Gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(6666004)(66556008)(16526019)(186003)(956004)(478600001)(6486002)(26005)(2616005)(66946007)(36756003)(31686004)(83380400001)(5660300002)(86362001)(66476007)(4326008)(110136005)(7416002)(316002)(54906003)(2906002)(8676002)(16576012)(8936002)(31696002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDV5UmlRMWhTVHRVK1pjNGZRV2tCd0kwZzhTcXd5ZmpSTXZmRDVWUlhZU25S?=
 =?utf-8?B?dW50YkNwUWpBeVFlQ1FvTFpEdWpIbmxSRFMxUUJBN0tjVTY1UXYybUJCejhs?=
 =?utf-8?B?UlVyMXpQeVdWZ2VXQmw5QUwvTzAvZmo1dnhLWXNwT2xCWml0SnBmV3g5ZG9N?=
 =?utf-8?B?UE4wbzBLQ0ZqanZwZ0UyRnZKeUwyWW4vdjN4aFk0dWJFM3A1T05pMjEwL0x1?=
 =?utf-8?B?T2gxYVg2WW0zcHhITk0raE9lSHRjSFM1aVZsOXVCL0NOb25heGM3aE5QdjJD?=
 =?utf-8?B?ZWVjRWx2MVJNRUNiUm1vdUJqUUxGS2wrSnlsSk01MXV4eWljU1hBcG4wRncy?=
 =?utf-8?B?SEdRNnJjL01mMzJDNXpRVFlxNmpxaHdldGtjbHFYT2s2RnFBbndRMWM0a3ht?=
 =?utf-8?B?ZUpWZ0Eva1FpUVp6WWVtOTVjeUMwaWVrdjZFWGh4TmhYWVJxNUxxS2JrOEE3?=
 =?utf-8?B?SGV5alZ5eVRVL1g3dmx0ZzBCSGE0NkRsakcwS0Y4bU8yZG9wSGVsZmFmVGlO?=
 =?utf-8?B?YlFxYUV5aTJXK01kdU9heTdMWnUvMFN6VHZqSlVyY2c5dWZzSkxXQWpoMGl0?=
 =?utf-8?B?QTdCRGFucDBRRnptTDc3dFlWODdISjR5TW5QUEJpQ3A4OExZbTh1NTUySE1k?=
 =?utf-8?B?bld2czFCR29tdjZRK3JCVFBYTHNCSUlDRWpUcStXNWs4NkpyQTV2anY3N1J5?=
 =?utf-8?B?MTF4M0htSFJIU2tHQzdJQlR6UmZnL0dwWlR5NlBjem11SDNrL1BOMnNwTWZk?=
 =?utf-8?B?WVpsb21aTUJjQ25ZL09zTEM0YURtK0JucWEvS21rREw0Y1BiVU5VQi9LbHNC?=
 =?utf-8?B?Sk1mTWtUcXVvUjhhR0s4citRcyttcm91V3VzcVNJOWtaaTVlK1BoT2tXTmcv?=
 =?utf-8?B?TkluN21nZ0NWdjRDODVWMk1LdGIwUTlUMWRYRm03TTI2UEFYTzZsbmJaYUNG?=
 =?utf-8?B?L056WXlFWElyNzc0MWRFamJpY281QXB4bzNESFBKWEFIZkc1MXRBRUhJQm5z?=
 =?utf-8?B?V1V0aHdLOEhxc3hUZkpjdGRPemdzS2VOMjA3U0pQdjVRdEtNZFczZjY1elIr?=
 =?utf-8?B?aTNwT09qZGIvSkc4c2c1TmZadnBpODVUQ2lwY3QrL2Q1WkZObXdYRGNxbnVX?=
 =?utf-8?B?a01nR3JXa1ZFZXBJcTRGTWxMaWFrZjlDOUY1WTZsNkQ4WFVoNGtEY1RlNWQz?=
 =?utf-8?B?SXo1ZUpWS1luSEtMeThuQkhOYWdSQzJQVnZtQnRUcHlTanB4SkJjd1lhc2Z5?=
 =?utf-8?B?cjBuczZjeDBSZGhzeVRldHBBYjF0S1VrY1MzMnlSK1lBN0pHK3BrRkNFeXRy?=
 =?utf-8?B?aGRHU2dYd0VlRndaR1U1aUhGOThNbndpNmM0akFwZzBOcGEyUFNCZCtuNlBp?=
 =?utf-8?B?OXhDUll6aWVZOSt4dngweHdNSVhBYTZpZ29rTURhN0habDU4bVMxUHJVOFFJ?=
 =?utf-8?B?YXhwZDRhaFFYV01zTURkY0Q3bGpCc3VCUHNiNzV5K283NzdaME4weGRhelpq?=
 =?utf-8?B?MFRNRlk0ZTg3RVE2ZkJTSEd2a1VNNS9UWXErb3l3VUJmdnhtVUNrdEIwbGJm?=
 =?utf-8?B?ODY3aWhKNTUxVFZkbkJWWVg4anhtM2VQT09VTVcxZkxRT0lhcUNSRzgzeCtn?=
 =?utf-8?B?aXdCc1BFNWdnOFZZaHJzQlRzblQ2N2VybitHS2FqUStic2dUdjcvR0d0YUxR?=
 =?utf-8?B?OWVQWlJ3NEpMR1M1OU43QmlBa2hpQ3czSlNTSnJ1aGsycmdpR3hVQzFOdjBG?=
 =?utf-8?Q?MOMM6v8Uxlk9Ft6mw1GWtUJKy1Jf4+AVaTOuFzh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0935b7f2-7367-4a7c-41a4-08d8da777d42
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 16:56:41.1921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RUdJwmWXOsDJmTllDREdZqMW0OhprdgufP53sJ7MG4RWu62C2WEUXHMc827TD4Td2IfJ++kurFccA/O6OySnrMsoduIgm5E/pQUlFobFMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5597
X-OriginatorOrg: citrix.com

On 26/02/2021 16:21, Bob Eshleman wrote:
>>> On 2/25/21 3:14 PM, Andrew Cooper wrote:
>>>
>>> It sounds like you'd prefer no common to start and none of the
>>> arch_* calls it relies on?
>> We definitely want "stuff compiled under RISC-V" to be caught in CI, but
>> that doesn't mean "wedge all of common in with stubs to begin with".
>>
>> Honestly - I want to see the build issues/failures in common, to help us
>> fix the rough corners on Kconfig system and include hierarchy.
>>
>> In light of this patch, there are definitely some things which should be
>> fixed as prerequisites, rather than forcing yet-more x86-isms into every
>> new arch.
>>
>> ~Andrew
>>
> Ah I see.  There's more that could be Kconfig'd away and if they can't be
> Kconfig'd away, their should be some commits to make it so they can be.
>
> But things like, for example, `arch_domain_create()` would still
> be stubbed, because this is and always will be required.

Some bits are very mandatory (at the point you start compiling
domain.c), but it absolutely shouldn't be necessary to implement that
much in the way of stubs to bootstrap an architecture.

~Andrew

