Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D833BF355
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 03:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152792.282257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IZb-0004ta-NX; Thu, 08 Jul 2021 01:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152792.282257; Thu, 08 Jul 2021 01:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IZb-0004rh-KI; Thu, 08 Jul 2021 01:11:27 +0000
Received: by outflank-mailman (input) for mailman id 152792;
 Thu, 08 Jul 2021 01:11:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1IZZ-0004rb-SV
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 01:11:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34175ce2-93a2-4617-aa4a-100137b1ac5f;
 Thu, 08 Jul 2021 01:11:24 +0000 (UTC)
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
X-Inumbo-ID: 34175ce2-93a2-4617-aa4a-100137b1ac5f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625706684;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i8FAv9IDgQu+DVEWgwyu0whT6GuC795fF+5/SB+oysQ=;
  b=JdG39nvyz5EbCL5+xmSP6SrPuBJT4PxKFpRbfxJ9SXTbLAL/Cwm5gCoo
   EwaxcSYJn2T9rBSdzvP3qESI22PxYnxBDH1BQkwWaaY4cEmMtQHhp/ur9
   MR25S5nctduBppgbWjNyYLM11UiZagnx19lw4vyBt7HozAXgfhc8XMq+M
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HiOKPLIT17ZNjUUowMGWiZC/eXCB0SZ3feXCOptZZOq6uJ0blGUA13Nq64bZ0lvSUHnf9innor
 K0UJdSzFv4T3gZEAgFpup9sFejTU/v8l/slnXMVgdAvIyQJd6bFh29GCKvVZ7VOofCNcPI4VtU
 KEWS8QZb9nsUgFw+GUTWwouxSz1tt4oPKykHMqkc6pApiXyHaFgZ8TFoN1bqQUIg23huYrD0hB
 UyPPnTn+bEnZk6zbo/irtQIsk/zypJWO2Sun/0lW044vp2PRAYZTY7cHJD0oN46p0mxy8bjYCe
 O70=
X-SBRS: 5.1
X-MesageID: 47496529
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kaWxvaPeGAxLxcBcTy/155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyGygcZ79
 YcT0EcMqyCMbEZt7eD3ODQKb9Jq7PrgcPY55aq854ud3ANV0gJ1XYINu/xKDwSeOApP+tcKH
 PR3Ls8m9L2Ek5nH/hTS0N1ENTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87SsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsCuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Rs5Vma/pbVFZtl/1ZwKsMe61wWh4SqbpXUN
 WGNfusocq/KjihHinkVgAF+q3fYpwxdi32CHTq9PbliwS/MRhCvgIlLfck7wA9HaQGOtJ5Dt
 T/Q9BVfY51P7krhIJGdao8qJiMeyDwqSylChPbHb2gLtBdB07w
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47496529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpAYrn0SpZ3QwZ1EM85IOviz4Wo4ZM+Sne/N3gGlzUvmjAgAabNJ3w3FtZrfTgBp2s/ZMdWlgPwhKjLPJfUJnh1+alx0SNt4DYG2ahox9x9hAiWDAB8c4l1a8T3IzXOXq1i8gPY8IaZL7oUJg+JDWSo3xccXxWKrkTmBEkqB/4MxklT54NatEXP1FZ4BaZXMX+xq5518+grG7IuqWbGn4jKaa1o38A//XA0KBGrWNINp3JdBaYX12/aHYaSYe7L/CmHoPR6rguPYrU0CLYZqi15yeb8m49VYA6MSKTq2nTIiwTaafPKLwFqrvVpCA2s4tmCeOMvmjJlZvp1CwBjXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8FAv9IDgQu+DVEWgwyu0whT6GuC795fF+5/SB+oysQ=;
 b=UKIdqzdS0ieNuPtMfJ0Y3Phi+sOP2zxcFDvRJzEca4Z2tLGSOZoZTxBHn5m6+EWZO728t8yUrVdclRMuuEoAQNCdX7q6K+gyrk47JAU2gklsmmiV9m9f2Y9cb2Cb2THvW/Ax7QUQFox8gVfk2CVy9Uo7bTqitzdnLPl6WjINn1xfv6voKrdsVCnSt6PFNmGSMmbYiVqiomB7bJjjnCTW0OlstrtN2TUxh3/CQZRUTb5yCPx4BDzTKx9m8T4fBw0eUC+NIuiJ3J+/GoYALBwkXOONkX2eqbNMWkM6rD09abIOHNGXD6hyq+uVG+Ke6riCytRs3OC/Z0dMRIPF18fqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8FAv9IDgQu+DVEWgwyu0whT6GuC795fF+5/SB+oysQ=;
 b=AgI6ltQHxacg0gD/Zd7I1PhvGkmWG37z8DZSKUJuNS/UanqIjv/qma1dLFBuKgPZUqBRBc5Ue7PMCn6+uenXLjmuNZyvsicVpIM3rPN9LCGdihMOJsxLyTWJWg6fyhALLP5yr/120puOSA84FBTF6ql9S9OjDXc3tSjacV4np4U=
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Igor Druzhinin <igor.druzhinin@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: <iwj@xenproject.org>, <wl@xen.org>, <george.dunlap@citrix.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <jgross@suse.com>,
	<christian.lindig@citrix.com>, <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
 <8567bc8e-27a5-2f56-2765-e9b249764aff@citrix.com>
 <5dfb0321-ca52-5464-8bbb-c29d329d24cf@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ea392b06-6277-ced8-0cbc-40967fc1ca61@citrix.com>
Date: Thu, 8 Jul 2021 02:11:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5dfb0321-ca52-5464-8bbb-c29d329d24cf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c097eac2-0930-4319-d510-08d941ad49ee
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6270:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6270A2907E65D33F1927E845BA199@SJ0PR03MB6270.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUc9wX2L4LMHMSn383Uof/aBh0I6LhJ1sG45emt9FuORmJJr8H350vy4TpedvAGTIa2u6tl724fqMpaKpN3Fm8ETRunru19YgJDBZPPvxk0elDM8NmIYOPJ4kB5kaQElwyJMb9EqBm7q5GkGkNua9cbf4Ma6Kvxwr26I7OT6IcnJ9qaq/y1VcbLjwohyOgjUF0Z9TBRh0putzsPtDsI3XiR9ZOM9HdK1F0GnI0hSfqF33M9pvfj0f0wAWUWXZYgp8mnmHFp23OqnK01TPVb6PhbRRDxNC3fqBv6IjY2J9uF9lkRfJAthXwUNpki7PS/TBPtmgO8O3k1xAPPlvsihnb8Lg+XXoNoWQ0cJ5RaPA6pYtgRPgzcDqYqoE7V6RePAhoM9X1AceTwqTgbgD/MfXstLn4iZfFDbWqg4xUJJ9DjZw+nA2P6IYqjB9ZoabFq4Ftv54dU6DViM9Yna/fSZXyAeuIBAshP7y3pPFUvoClOkDnNAfU5efCzIu2Gyz59kZ1eXeqCMaRn9Yfj+uvHRl6kl9kQNCoZwCz43SysoQnP3pdDyO9Ohk0EcfR1TKhpBXBZdAvzz4nutUavRlV3pnjsQiguSmy7LoX+Uq5rDL1fcN7FNRKU6j6Fpu4mEC/PiZRAKH90HsOIwBoP4XPkiDwBaNL6PdkZr4//JlTdhQkdxY57tn7Xfp+zb3dQmXa6HsLoPXV+fb2SADsM5HHXydVsbw10VOAYgb+r+Q4HvsI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(316002)(110136005)(86362001)(186003)(31696002)(36756003)(83380400001)(5660300002)(956004)(53546011)(2616005)(16576012)(6666004)(66476007)(478600001)(31686004)(4326008)(66556008)(38100700002)(8676002)(66946007)(8936002)(2906002)(26005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWp0MEltekNwZzM0VTdHVHdhT1BKeWlHZE1nNi9QUnJ6MURwNEdRSld0NTBS?=
 =?utf-8?B?aVpiK2hKdXZpNkVYVFl5Q2VZSnJWK3k3UWlzTGFTNmh1bWE3a0ZNanFZWEZ2?=
 =?utf-8?B?Vm1ZdVJDWHdWbkRWWjIzWFJSZC94ekJYUGJmeTVURGFaVVU5TlVHTWdmWmwx?=
 =?utf-8?B?d0QwbnByUm9HbHR1UlF4emdwczduTHNmZVBPZlVoek4vcnRmbkthaUdQejBV?=
 =?utf-8?B?aFVvZ2U2ZkF3T2ZiT3g3Ukd1V0pjZ29wYnQvYlZsQndNUnBYNWVvbnl4RFA0?=
 =?utf-8?B?M3EvZTZWM3dYWERweG1vejRXMGRsSXV3K1NmeURuR0NORkFWNFR2azVIR1Bo?=
 =?utf-8?B?OW5ad0JONjNSY2VWQ0RXS0lEMHllUkNrSnUrMTNlYnBSOEpTTlhvRFBTaEhp?=
 =?utf-8?B?UWJUbml2T3FWMEJLWUFhUEc1cTlJcHFZM1pHUVovU0tXQTRBNElpUHVySExm?=
 =?utf-8?B?ejlKZThPTE55ZFVRRHRGTVhGTlBiODNmUWQ0bnZpa3ZxRXJmNkkxa2VPRmhI?=
 =?utf-8?B?cWtSdXg5akVKaEI1cWxON0RGQTNyczErV0Y5RlNqTDRPQXlLR2w3SEVWUUVK?=
 =?utf-8?B?VUV6d0RjcVVTZDgyRVQyS0ZBVGZIUUlqaGpMeXRNZ0d2cmQzblFIS21rc0hr?=
 =?utf-8?B?TkR4OGdobzE1Y2RwUVlBc0d6OC9GQ0J0U29jS1l2cENyaVBZSDBnbVZkY0Q1?=
 =?utf-8?B?Y2MraGJSYmpFUjBsYk5KTHRTK1Nud3c2TmpSNmhocmNHWkFHN3BvV1p6WUgz?=
 =?utf-8?B?VFZzNmdTQ00rZVM0Tm4wMXdNcVNUSHdBVTVOYlVHNkMrWjNiQVBQUk1jQmpL?=
 =?utf-8?B?dzBmcmJnN1hHNW5WbWZPeVlIWVBHZXg1dWtRbTluaHNmMFl1UjQ4U1dNaklH?=
 =?utf-8?B?bFRrenpYVVhKN2NHajFvUmFxekdmOGNLc0xTTTNMc2hMQ3QwWlBnNDA0emRw?=
 =?utf-8?B?WkNHcGJuWmd6NEpEMGExUkwxQndiTG54Ry82RWhKWTBKZUtQWFM4NG8zMjFu?=
 =?utf-8?B?QXZlNTlSMTZyOHZ6dmVHdnEwRnFQTW5RT2hvRnhJUzJsaFArY2VkMmdGb1ls?=
 =?utf-8?B?eGVjcDZXMEx1K0lIR1B2eFdLVkd6bEF4VW1Jb1pDNktiQnYxSU9yYzUwTjFt?=
 =?utf-8?B?eEE0aWk3dU1ZTS90SURvbHNEa0Z2RDErMnUreG5kdmduM2VFOE1QU2pGS215?=
 =?utf-8?B?ekhYSnFDL2RJbmt5ZFVGWTIyMDZPRlJvMXFTeWljWFdlWmFDWStJcWs3SWt6?=
 =?utf-8?B?US8rVWdLdFVuazd0U0ZscXQxTG5DaTZWTDRJbENkRFp0NEt5YTdHNEE0Kzk0?=
 =?utf-8?B?SW9kN0FkeWhuandjZllheWxOMGhuRC9WZ0VHMjFpeEIzbi9CcFlEbmtlc0No?=
 =?utf-8?B?LzFzMVp3MTg1REJjR0d3clI5cUhla2hDdE1ZZzluUzN2UDJNcVVkaVZIN3Z6?=
 =?utf-8?B?b1RxWDEwNW9mZzRwVHRpWktTOHF2YjhYOVY3bW54RkJRN2FzeS9JNjhhS0F3?=
 =?utf-8?B?cjFEZitaanNPZXo3akZCcFZIdE1GcmlKamcyZjV4eVBxWFNDVjlxdk9hTVpo?=
 =?utf-8?B?QkNCMWVMUHVzSE4ya1RTV05jYjhHdHV0TmIzb0ZkcW1ZcENqWU41NXdUS1Ni?=
 =?utf-8?B?NUpqcDJUNGZIMEtUOUZaRzdnM1V1NTh2czNRRlljTnV4S3gzdTlEcUkrR1NF?=
 =?utf-8?B?Y3pycmw0eUNyYjZBQllOLzl4bFZ1eVZNSnFLRUVqeFpPQlNPYVVYQjZTeC9r?=
 =?utf-8?Q?fLwJYeFfdFy/benY2+AP/dprLyT3DuSQE8MoaNu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c097eac2-0930-4319-d510-08d941ad49ee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 01:11:17.6621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/biEVnZFzwgBNABrVOcEwcDRQtgDyqhYuZgTTrmFMqDYVxYXVfFg3b66qdAKIUZk6uZUffOMKQFGoSnLD/dRH4MrZDolwvgIOzKT/BMAHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6270
X-OriginatorOrg: citrix.com

On 08/07/2021 02:08, Igor Druzhinin wrote:
> On 07/07/2021 10:19, Andrew Cooper wrote:
>> On 07/07/2021 08:46, Jan Beulich wrote:
>>>> --- a/tools/include/xenctrl.h
>>>> +++ b/tools/include/xenctrl.h
>>>> @@ -1385,7 +1385,7 @@ int xc_domain_ioport_permission(xc_interface
>>>> *xch,
>>>>     int xc_domain_irq_permission(xc_interface *xch,
>>>>                                uint32_t domid,
>>>> -                             uint8_t pirq,
>>>> +                             uint32_t pirq,
>>>>                                uint8_t allow_access);
>>> Take the opportunity and also change "allow_access" to bool? Or is
>>> use of bool prohibited in external interfaces?
>>
>> We've got bool's in the interface already.
>
> Where exactly? I couldn't find a single "bool".

$ git grep -w bool -- :/tools/include/xen*.h
../tools/include/xenctrl.h:1844:                          uint32_t
domid, bool restore,
../tools/include/xenctrl.h:1846:                          unsigned int
nr_features, bool pae, bool itsc,
../tools/include/xenctrl.h:1847:                          bool
nested_virt, const struct xc_xend_cpuid *xend);
../tools/include/xenctrl.h:1954:int
xc_altp2m_get_domain_state(xc_interface *handle, uint32_t dom, bool *state);
../tools/include/xenctrl.h:1955:int
xc_altp2m_set_domain_state(xc_interface *handle, uint32_t dom, bool state);

and loads more.

~Andrew

