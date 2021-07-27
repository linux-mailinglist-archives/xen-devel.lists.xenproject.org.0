Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7193D74F7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 14:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161147.295889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8M69-0006di-1B; Tue, 27 Jul 2021 12:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161147.295889; Tue, 27 Jul 2021 12:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8M68-0006bu-UE; Tue, 27 Jul 2021 12:22:12 +0000
Received: by outflank-mailman (input) for mailman id 161147;
 Tue, 27 Jul 2021 12:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ggmi=MT=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8M67-0006bm-W3
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 12:22:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43da8956-eed5-11eb-96e9-12813bfff9fa;
 Tue, 27 Jul 2021 12:22:10 +0000 (UTC)
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
X-Inumbo-ID: 43da8956-eed5-11eb-96e9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627388530;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kxwXzCdeGLxyz8buSNUAS85+Iqaxgsc86WelFEVJz4I=;
  b=Bhoj5C7Bki04hmRThBOdCtcj1fXmkVXh77Gs1EQ568HB4+IEdpcM9kEF
   uglSwE/6ikdHZuGz8Vqa2P5e5B36VS5d60x6JLvLd5hzLTV1zWe3srfRk
   vmvG9Hb5v8CE9C6JK68nNCA8HIN2gzx3CgREMPFlKZUCbmPcIG52YXWaT
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FuMni91RZuLajulGVyi59JAMd428fUEbhf4cj+ukBdnMIGTT4fwjOrHpkoeR7eiJd8oDK820Bi
 VyiKztwfDO7jY0oeHeei6OehK5Zv0Q7lye0yU1kqg0/85RRD5yIx+2bjqiMUnc4KFtozbODnoI
 hNS0VqrO/DShFh849sCc+KzfUcRHB/LOT6o1mYYmcHlGoE0xcUZJgdXoTGdWN9a9g6Q2rl5pON
 P4SDdKTGUepWR5rc/IxkfgDFwaR7U0A2S06rR00hsHyY2sTJyaDO69hj6womN77l6hV2R8E2Lh
 1njsRjTUUPCPuCDmCbS9pfOv
X-SBRS: 5.1
X-MesageID: 49161802
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9Tlx3qDY11LFej/lHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEDyewKnyXcV2/hfAV7GZmXbUQSTXeZfBOfZogEIXheOjtK1tp
 0QPZSWaueAa2SS5PySiGbXLz9j+qj/zEnCv5a9854Zd3APV0gW1XYdNu/0KC1LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2RyIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjrKi+2eGRiOerNvb8zvT9GQ+czTpAo74RHYFqiQpF5d1HLmxaye
 Uk7S1QZ/iboEmhAl1d6SGdpDXI4XIL53j+yVmemxLY0LHErXQBeot8bMtiA2rkA0ZMhqAD7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0UbWIyUs4YkWUkxjIfLH7AJlOP1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgE082IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBLB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+laGjMiq9NllVeA6dv/22y6IJyYEUdYCbRhFrEmpe4/dIi89vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.84,273,1620705600"; 
   d="scan'208";a="49161802"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOG+6gTlpAM1uPBL/pfDJbWlgNEc7N5n6eE4dDqxu+/jCp4kz7561RBnASkSF6/Y3tuEyomuJwywOq58aKxsWqwySSMwoc2XeUO4hfzqD2HTZnJRm/u2ioupGB+rgI69JRNdqk0xQsGg1BESyXvfPulVt8EeTi72duG+jr9k6u9/uVh/9odx0fV6kJp5u/QKTY0p2+By6Qf3DjIfTmkLU694Ggowmft7Bl2G5THh5sgg6Zd1sQs6SAe2tJWJpEchf42gLLzvCF3acMgfb4k9qlzr58vPHIvunbjIOu/SvJfAQzLlIJG073szY3b7Bc67iGVTRLx8PP8nfCABozOl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxwXzCdeGLxyz8buSNUAS85+Iqaxgsc86WelFEVJz4I=;
 b=a49isahVBflV+qtynM5k2kn7Vg9leyLktgO+Dt2fNmr5XAHUe5RTxCk4buYICz7ia4ZTKdOpiFsBYsDHxZzqcHufCE0a5sTMd4LeEyrb7HqNMuXzXKE7E0iqW4fUdk5R/M+5lheD+w68/NoHGA0x7Bxp7lSx1ol0v+EMcZkDur3CxuGkQf/HnlBTeqyND4BiN8FXAsCso3hWLeW3QMjRkltZJMGHSexTzptJy+M3S42sy+L/ua4kQsuGI0bwpbOs5RAdkv2AK1/xbSi4f04ZWBpF9Ix6kF7Z/QISuLQbapf96ozZRy4txs+bFuoWsqRVPTRVoZyzjOLqn7KfL11xCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxwXzCdeGLxyz8buSNUAS85+Iqaxgsc86WelFEVJz4I=;
 b=Lare8plaGiHoNDzHga2+xKk8GC9THibM2i835d5rS3uKyJfo/tLPfRVxdScAZKACAJJDaPZUyK4t53XipPlH544PzVsDASRwRc5tLa895p/gcOeLaeGh52+W0JFwE7lBEfVfFVz5tonEGkOqxmfj0ErXvCwFIk27XJDjmpO39Jk=
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, luja <luja@openhardware.de>
CC: xen-devel <xen-devel@lists.xenproject.org>
References: <43-60fd5980-39-6ab37100@54709844> <YP1taH2Xl/jxjNRz@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen-Error: Disabling IOMMU on Stepping C2 5520 Host-Bridge
Message-ID: <b5cce847-7304-d80c-66e2-a579763ea7fa@citrix.com>
Date: Tue, 27 Jul 2021 13:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YP1taH2Xl/jxjNRz@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0bd9cba-e07c-480d-9baf-08d950f9243c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4488:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4488AF3332CC8991E7B2C88EBAE99@BYAPR03MB4488.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSVxMK8Y7n8eJsQ2FkRtPN5tXjCc9fl+UR2SrBxT8CzV3dP0U3EZVrl51x/EqqnjByu/EGKM/XZC8mu0XS6DWdnfHBi8OBuLvzj5/vRU2bUUODbmQbRH71wauOrLTV2ETahGNNh/lBTy0tBqcbAjiD3eD6bbaaMo0ESkEcjXs8ugt/qHbWAucJXri8ttkxi60hAhsB6xbLLOZGyVwSCt5QpSK3lh3syEa+xI8zqN5uMb0AwqQ7GhTrly2xnj850U2VaRN4Sj3weQXHNL+alfTPeNCh0GTnrfzdrJ9EpQZty+jcVf+rDjcaquxzNx86wCjWDj8yAQkIYA9tcWGlgSwVMnPa82WT5WOCk/E53MR8UTlbd/TB9+nvxenfK1POngvXwg36VbrFPQb7szTfyRPOHSaqhJi1v6P37vAOa1suZpLQN488HsmZVKOn9nxWEvU7ZtVWUGtjr+teTOIQNE6Z1qKShjtUECe8yFb4TpPBlCA6NIs/hf3q0msh9aEs5eELpQaYfGJuqHpmnJoZgWGd6wutimrgH1mjg+y5PL79WjdU7RMzWzWUJJSN+yR+i1V1x4i5mWiFCwfdth2O5twkKe0l4qP8CCox4F+4QYaVbdY+IKAj9sc/EvwJ0fKpv6n3tgg2IW/SQnqWhgGZCjht8pzfNoynWz5BBVtk7axx1FPo6yo5SstQwDqv6sc0n+8zfeha9O97TRXyWQoH3rB69tE2YBIUCA6xL6c4eV+rw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(36756003)(8676002)(110136005)(186003)(26005)(53546011)(66574015)(8936002)(16576012)(2906002)(38100700002)(316002)(66476007)(66556008)(86362001)(66946007)(31696002)(6666004)(83380400001)(478600001)(6486002)(2616005)(5660300002)(31686004)(4326008)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OThuL0ZsWHdPRSs4MFQ4aXo4clovR05PTWJ4MVhpVUJkYjNmWEhPcWc5SjhP?=
 =?utf-8?B?YWMvQ0lEcmQ3aWp3bitJdUZYd3JNakhXUDRyb2g5dVZFM0NkU3QxeWJIMEV3?=
 =?utf-8?B?RS9HaTJkZ0p5N3BuaUVpRjBRUnBQZXpURWxNdG40b2hkVTdBaDNIWVBtTTlk?=
 =?utf-8?B?MFpoTVZvQzE1bnIyMTEwUERiZDlJSDNjT2ZBK3hYOXFFYUkwNksxekw2NXUx?=
 =?utf-8?B?UC9JUWpOV1dsUUlvRDhsVHJlS1pEWFJvZ0t1Q3gzTy9KTVp4RFBtcnZaaURp?=
 =?utf-8?B?ZHdjcnROckYwMFFMcXVWUWZNbHZneTh0TTA5bGhVKzhRUG54a2NnN1J3N2gv?=
 =?utf-8?B?d2VwdWIrRFhrNXlnc3VJR0VReGlybHpVVGtRVEFBanZ0UUNvL1JMN2Yya2Y3?=
 =?utf-8?B?NnlOU3Q2ZnV1dFNhQmxFVlgyNlV4cE5IdFloRE9ka0cvcDRtRFF1SHZmRVFV?=
 =?utf-8?B?R2FoMjJiVEVWaEdpbEpvN0NIM1pCT0dWLzFGTUhyNlVzUWJ4Z0t0SDJtaFJU?=
 =?utf-8?B?NUZjR0xOaW96VXgvb3dzRXVwMmtUMEZHaC9Qd2hYZnZFaTBVWUlVaWhSSTZU?=
 =?utf-8?B?VktlbjF2R3E0Y3pqNUl0VldxbDczNnlWb0pJSlBqa3dUc1pXaDE5S2NiNHY1?=
 =?utf-8?B?ZHhkNmpPd09aanloa1lqMUlZQU12a3FtejgwOHQ3eURJUFBiT0l1VFJVdWhD?=
 =?utf-8?B?OW1ua3hxUUY2ZlQ4WVhJOUxYV0F6aDR3eUlZWEd0Y1dwRExZVHgrYyt0b2xE?=
 =?utf-8?B?K2VpS21yRWVIU1U5LzY3Zi94N280a1FVUlJnbVVqM0VKZGdyWGQ4VUwwRW82?=
 =?utf-8?B?NXZKSlZzZjJHWkREK0xzVUF1UlFvY2FlcHFWUWQ3T25yb2dMRW83dDhDY0N6?=
 =?utf-8?B?U3lzU2U3OEdYZ1FmMUtZdEhjYndRcUJ4NFI4aFp1MTQrb3o3QVhWS1U4bDI4?=
 =?utf-8?B?ekcvQmx0NUxOWHB5OFQ3c3hSTmFlb0x0OGkzS3Uya2tON3NhQ0hFUno2ZXhP?=
 =?utf-8?B?MWx5NjZzWDFqOFVIY1g2RXMxdENGMHZ1ejI1WURPZnhHdHZzL2xEdnVrSHlW?=
 =?utf-8?B?OVBOeWJkQmxHczdRbXYwcGlIWGRzTFk3bHdwYUJLWnNDMm16ME5ibHlMdjJT?=
 =?utf-8?B?SjFaQ01UOTVpTm1KOC9oTG5IdEVkRWUzd3p3V01raU1sNGgvdkhlcDZvNUNB?=
 =?utf-8?B?bHdQQkx6dmZ2TzVsUzl1V0xuT3M4enF2YkJTc0c4Y3plZysxRXo5QjJxeXU3?=
 =?utf-8?B?VndvMDU4eEMxVkZhWW85Slovd1RCK3JaQlh4T2pYYzczakxHNzFQemo1Wnhm?=
 =?utf-8?B?cDI2RUQ1VVQ2NEZvUlREVUJ6czBCanVjaC9MTWdSV1pTYkhNcWFkUHg1VUhZ?=
 =?utf-8?B?cFJ2ZktUQUxqN2pvSjVOVzBHNFlyeHdSa1ZwbjhjL1pYSEtHaDg1Q0EzMnFZ?=
 =?utf-8?B?Ri9ITFIrTFEvMUh0UDBWRGltOWV6V3UwNGVFbkRnTm1ucG9EaHh1bzg2QmhF?=
 =?utf-8?B?ZitwZExNcmFWeGUyNFZXMTZpQlpsOUJJSVNzSkpGM0V2OExFWFRjV2lMc1Bw?=
 =?utf-8?B?Z2VzOVVEMTNZTXhiNWdYR2YrWVBmVnplOXRVaTRpdXlUZEV1WnR5R0t5Vno3?=
 =?utf-8?B?OFU2MGJIV1AxSjdrQ2czTk53c256YnROM08wN1NHU2lDMWhkNDhXTjJ4dUpQ?=
 =?utf-8?B?TUpwR0lWR25pbSsxMFJtbzdkNFgxK3A3SFpEVGxTWjJJejdaS2FYV3VzR0p3?=
 =?utf-8?Q?VgDC1qjZupj6T9ZSv062BjDSFYVNW77MVUBQ0gt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bd9cba-e07c-480d-9baf-08d950f9243c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 12:22:03.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaRH1m3J2TWI3zZ9cSxm1e6x4q8aMWHzuZ8UHwpy6raf6L6ctyIXZTFjju4fPBXCuIF1/XWchk7724NPkkyhk7Gpu7a7nrMULAHLFT0nfEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4488
X-OriginatorOrg: citrix.com

On 25/07/2021 14:55, Marek Marczykowski-G=C3=B3recki wrote:
> On Sun, Jul 25, 2021 at 02:31:17PM +0200, luja wrote:
>> This Z600 is equipped with 0B54h mainboard as can be seen with dmi-decod=
e.
>>
>> The manual states that 0B54h mainboard has the "newer C2 stepping",
>> so it is *not* affected by Intel "spec update" (nota bene: Intel updates=
 the
>> spec, others report erratas) bugs =C2=A0
> The code above checks for rev 0x13, and the spec (page 11) clearly says t=
hat rev
> 0x13 is stepping B-3. Stepping C-2 is rev 0x22. So, if this check
> triggers for you, I'm afraid you have the affected chipset.

The ID in hardware is the authoritative information.=C2=A0 Sounds like the
Z600 manual is wrong.

>> So the way Xen detects the "bug" (pci rev 13) is not sufficient, as my Z=
600
>> shows pci rev13 with lspci but 0xB54h (board rev only on Z600) with dmid=
ecode
>> I would suggest first to have an override xen kernel boot option to disa=
ble the disablement in this code section. Or just patch this part out of th=
e Xen code and rebuild xen. If this stuff really crashes, one will see it.
> Patching it out is out of the question, this check if there for a
> reason.

Using interrupt remapping on these systems does cause it to cease
functioning.

>> So please build a new xen without this stupid disablement or please add =
an override boot command for it.
>>
>> Please see the attached upgrade manual of Z600 and the errata "spec upda=
te" by Intel.
>> You see that the C2 stepping is not affected by the bugs refered to in t=
he xen code,
>> so removing that section or adding better detection of the mask revision=
 (B3 vs. C2)=C2=A0 of 5520 host bridge would allow=C2=A0 many users to oper=
ate Qubes4.
> Maybe someone else has an alternative idea?

The logic in Xen is broken.=C2=A0 I've tried fixing it before for XenServer=
,
but was objected to, and the patch is still in the patchqueue.

The errata is with the Queued Invalidation, which (in Xen) is tied to
interrupt remapping.=C2=A0 The rest of the IOMMU works fine.

The current status quo is that if Xen boots with an Intel gen1 IOMMU, it
will be happy with DMA remapping but no IRQ remapping.=C2=A0 If Xen boots o=
n
this specific buggy system, it will turn the entire IOMMU off in
protest, which leaves the system less secure than booting on the
previous generation of hardware.

The correct behaviour is to just disable interrupt remapping in this
case, which brings Xen's behaviour in line with adjacent generations of
hardware.

~Andrew


