Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A83FCAC3
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 17:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175862.320222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5e0-0000SH-W9; Tue, 31 Aug 2021 15:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175862.320222; Tue, 31 Aug 2021 15:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5e0-0000QB-Sw; Tue, 31 Aug 2021 15:25:48 +0000
Received: by outflank-mailman (input) for mailman id 175862;
 Tue, 31 Aug 2021 15:25:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH2E=NW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mL5dz-0000Q5-WE
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 15:25:48 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48f821ee-c3d6-4473-a068-cd025a63ee19;
 Tue, 31 Aug 2021 15:25:46 +0000 (UTC)
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
X-Inumbo-ID: 48f821ee-c3d6-4473-a068-cd025a63ee19
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630423546;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jsvOLy2sUdYGE84OkOnPk3tNPIqNmrfXB+EjrMaBW2E=;
  b=BWgsw4Q1nQrfbVUp5yXD51TmlsMlkSaPAkATQjdM9qVJIl4P4Q9paFec
   CrDfPyc+0r65f36xX4Fzh1GfL+zPs2RbBnv2Tz6Ndr3E4fp9i8AW44vVi
   lBQWHE5FuIwfiKN73jUWdm/olgaXuF5up6/GgixUIINb3vrU1zn2QbgMO
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EpYIAtrJwCnoDuZXE0//T+szq3jFwZJ+XCMYvLs8bM75VBrzbvHrk2bKA4TAr3zZab8J0e2+wK
 wikQaMJUaKHm7V9oSoEKoHu68S+DITZGTs7kAPbLCj7fOgRTf1PfTnpMCzugoPRRiv+hgqm0Si
 lJP0K+s0pwkN/lEWyOmsd5Ra9Crn7W5d+piIJNl3VxPxBOMamKeZPJehJzi+QZpiH9ypJmc+kR
 1wB7NXcgVla+I6pDwi2qhNiz7TnKWEScoHrlrOKSDDi82xc4vLmwp++/mJ4Ev0K9SPEMywRK17
 iji9N/Sri7zGqJOXySi9GWph
X-SBRS: 5.1
X-MesageID: 51312164
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jMSjNKpuEEsCU3JlWDT91IcaV5oveYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qH/xTQXwH46+5Bxe
 NBXsFFebrN5IFB/KTHCd+DYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="51312164"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIBgfedRZfyqgChTS4bpVODtuyV4nuvOFoH+MmFOo6vHRyCEVPbDqqSx7Gwtnbq4op8YeS22vhM3ORecdt0zR/b8kv1OL3oKZggOaQWcIj1NPc5Cw9MaPXw1S3osd8T7SW6a/euPhgJenWNstlKKFkAJZOXYPB9WF4D4/Acz7bK5IUb51SU+Axht6XXi/fhssfcJMrntetUJ8uskNGagmTQK3t+bqt5qbuxNIAaWn+KvLlaI4V8XnMsLabqJZ+YXfcTmhPzdIunCPTzie4qG6y+UF0MmZLG4Bn6ErEvAHeHTr7FZG1B5iY9SnCkPo+6GFhDcXZRV5Po2Vfg2cRIoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CnQbHdPGCNJy4/jJuVsKzbrpwgrQe9EcFfe6kRh7Q/o=;
 b=lNIkLVScZGBp/GPKVGxQ3qb6V04XvB4jq33sXrbdt8B7Mfo6e6z4z0H+hZ3MPOuyDO6dd1rP55cT5M5Ic1aAfdv7pNjxMPNobC6Ec5jL8zmwQKYWc8wPHeH2uQ/pdRI7Cdu0j0m/XX6nmt42TORDjmLU+uujaDQfkmpfAbcadnfkBBgeDryGprU6rINzZM0GfSTr8izgGTndIoSleU26IqnWYEshi8VkABs1sv/KdqlskXGldE7Nd013qkp7KblrUN4BYqtyiXxNqTHqtuqDoz8uF+fu8lyCC5eGE+yFY8k2u7B9owGmQYLOJnzIIIZLGBSquYFBEbtxTm2HOMD+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnQbHdPGCNJy4/jJuVsKzbrpwgrQe9EcFfe6kRh7Q/o=;
 b=rWmYDMJLcsyzBJ4gg3/ejz10OacPeAXWl7gePdle0LsDe2UydadMwuwMmzDxrf3eegf3uHZwmJl/kUrhlSZGJATewtiL7/SY0e0p/AokLfNypvro/TGu2GSE43mF+yrNns1eU39g8Vnyn9T8yTfxNQQeP75ktdV+jtL40sQ+uO4=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
Message-ID: <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
Date: Tue, 31 Aug 2021 16:25:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f5e146f-5b81-41e1-eae6-08d96c939813
X-MS-TrafficTypeDiagnostic: BYAPR03MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB436022E14F1650D6C4E06E40BACC9@BYAPR03MB4360.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlZZqJNBElih29FrQgCrAeXH4ognTXywdCzlceIEHc17UQn/ps0xDfiWZ+AsRdjUNJWV+AoavWXuNFUPgt1sE948ZLfSvNZgyczSB3SaHLCesLTdcUo3EiuVRpspFRssJlOYpeYoxxJgmEc2hhCH2rhl3KnezK+QPZJjpKNRFpC5echbe5wArGN9CAwSefxmDJ5pcdaiNeMfWUAIrjLXvLXKZXJeuUbtSQ+uXLUu9Jidm9rOwSYLuwRtgw6WqnV/y8InlInMZ0X8FYkRIJ5oQ0hfOpr9kqscygy4kdija6JDzsoVvwgQSYr3OYgbcZmTI6hXK9+/cKFpD6elVT9ka+YPzadrI/6Qmho+h3mgeeXfVsdffjE1b7442SSEnzMEybyuC+Q9JfccFIQni48OiHpvSKChiAD7fGRdaxruQGaCaL2Moqn97oBVOilkLZmspUntJvjiYmVAh6zSBElIHFIcIqVpvLy3BYzmk25UoWksAOvJZ1NxEso3M30h0TQPRnzSN8ACISoA3Xh25Spco/L8G8LAXjySBnzZAva7+Ot+JVwgVzlA2S7Oe7FwlY6GTjPcsGRaUe9+3Y0OA2h4eAYkDshuxqh3F7x5dHiNbDSQFIx9Y9tSsnguqdL0eJNu2ihzj9K7xGm/KLyrVBbNwejX0X+9wV141o36mgEH6rHOWurMEgQshvbllz+TiETE+BUxFo9ehh86JZ+zKb0+8IlK7VnTdvhI/0hr8B05oo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(2906002)(16576012)(53546011)(55236004)(31686004)(6486002)(83380400001)(186003)(316002)(5660300002)(36756003)(478600001)(956004)(66946007)(2616005)(66476007)(86362001)(31696002)(4326008)(6666004)(38100700002)(8676002)(8936002)(66556008)(54906003)(26005)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJVRGR3c2J6clRXcmxRdkFSNVh4UEVlUndURWhTay9NZEluSXlsOE1PWVdM?=
 =?utf-8?B?OFoxYTFNUkR0YzgrdzlmR01wamRRVllGK0VSSEtSYkFXR2Z3cEFPb0orbG5r?=
 =?utf-8?B?THBNcUs2Qnh2YUVjQ3VqNDB2ODJZK3I5TlBESXBDdUdxenhvb3dxZFJmakZN?=
 =?utf-8?B?TmtMZllTQWN0WFZWSkdHRGpkSlJIUCszSnNNbzRJZjdFdEpzemV6MGQxQ2Zh?=
 =?utf-8?B?RnY5TFRwWTkrZ2NSbzVMSzdCb2VVOTYxM2xYbzlUam93VlFsc0dOK1FvQ0R4?=
 =?utf-8?B?TFZGQnVRd3NuRWY1eGlURS9LYVQ3WUJ2S01HaXdRd0xyaGJ2U1pJZXBscHJM?=
 =?utf-8?B?d3ZDQ0NSUDc2M0Vyd21yanZKWWpUNTlzZU5NOVQvMEhqZm1XWnpZVGxob0N1?=
 =?utf-8?B?R3R2cHlCSE92YzQzWmFyM0NlKzBzWHB4eHlUU3BSWVdBVDIwOG5oOENHOVly?=
 =?utf-8?B?YmFReEZTQnRyWFB6ZTd0clZvWEU3U0tLT2w3bGtSU0c2V3ZXc2hOUVV0VUxk?=
 =?utf-8?B?QTBqT2V1OTlKL3RWenRXRWhVWDFvYnAwTTE2azQ2N3ltaDlTNHVuSDc3alVi?=
 =?utf-8?B?eWxMQTVQSnNYWkN0Mkovd1pGSnYrOXg0RWllbW9taWFuTUk0MC8wM2tjV0h6?=
 =?utf-8?B?a0JjSCtkQ2J3MS9PRnErRVhrM1V2QkZGdnJFUmxvSkFSd3RkK3VVQ0xxdnFN?=
 =?utf-8?B?RUdaVk5veW9TZGtaUTU1aktMSU1wdWQ0aEpETnJHdFdOK0FTd3RxQnRma3Rq?=
 =?utf-8?B?UTM3UU5ib2M1MzJVaG9pU1BXNzdvTHpiSFIwVHNjMGRsTmVkMlRjbzJhL3ZR?=
 =?utf-8?B?dlNzaC9qY1drMGwremd6YWt2R2NnYVQrdjBLb1huWVFZV2Zaa0Z4REpGZ21S?=
 =?utf-8?B?TVB6aW5GZ2hDbmZMbFh6c0RMMVVKWG1oYk10aDBUMlR1TTNZajdpR0MwWW9O?=
 =?utf-8?B?NDJob0luaGRDUmQzNk11VWg5VWhtSmVFTk1PNU1wT2pFd1g3VDQ3S24wb2Jz?=
 =?utf-8?B?aTMzV0FFYlcyNEdac1M2Ym1vc3VXdVJEc05kd1oveXIrU0NQdFg1Skl3VmVD?=
 =?utf-8?B?aWRQNjJZdjFkelRvWmhIRWdaeXRxQUFGZG5yOXl1aE9oTlRHWFVBMjFwMnkv?=
 =?utf-8?B?ZVpNdGFNU2VXQURDM0NoZlVhZ0FlWVVTQ0ROTkJHaUx0eDhhT3pTTkNLMDZL?=
 =?utf-8?B?SVZIeHlaeDN0RE0welpobmp0QzVSejVLTFdTN1VEc0txOHAyUDVFRkZUaHE0?=
 =?utf-8?B?UTFjdGVuWE9mT2FBM1c4RXNaVHdhbUxTVWhtdVcxb3ZnTk5oRHhNdFpicXUr?=
 =?utf-8?B?K3Jvd3hXNDZoZkFObUZveDcvS0o2eUdsWVlIc05kREtNSmJPNzU2Wlgrc2hK?=
 =?utf-8?B?VENpZ0F5UUIzZ01ZeG1vWVhlYWZzQ3ZjM0xWVGk3Z093ZkRCRkhMTEx1a3hu?=
 =?utf-8?B?VmZHRVB5NDNCUU53UWhOb3B3Y2g5dnpyZ3Z6T2gvakNjY1YvYlg1ZldyTHNo?=
 =?utf-8?B?b3hLVytkM1VtWTFWeFUxd2xOaDdudkNoUXZXeFFvd1NyQ1BjYXZkRXFJL2V3?=
 =?utf-8?B?c1lDcy9XTjRVeXV5SnlFQWVmN2R2RHlpeHI2c3VUZHBNS0svUUlVK3ZTMTlr?=
 =?utf-8?B?cVh4eG5QKzd6UnpUN2RPRUY4a09pWkJ1RUw4WG1qV0FQNGJ4VVByRjZOQ3Ri?=
 =?utf-8?B?OFdtTFlCZVR4OEdiVmhqK3F4dFlJOVJrUndlM2YzK0xwemdiZXhHajVnN3Vq?=
 =?utf-8?Q?0mLS09mBr2ffjDpp9Du1rLprewYg+8vpSkTGAbN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5e146f-5b81-41e1-eae6-08d96c939813
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 15:25:41.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ij5z2TT3fTLNVMd3g1uk0/hKWluR1kUzGDFhhCT1yVD6lLsgot/XLmRTssALiP4RNn5FJFKSzBop/gHH08NgOXkdZlUbvGpSIqg1HhON+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4360
X-OriginatorOrg: citrix.com

On 31/08/2021 14:26, Jan Beulich wrote:
> On 31.08.2021 15:16, Andrew Cooper wrote:
>> On 30/08/2021 14:02, Jan Beulich wrote:
>>> Further permit "access" to differ in the "executable" attribute. While
>>> ideally only ROM regions would get mapped with X set, getting there is
>>> quite a bit of work. Therefore, as a temporary measure, permit X to
>>> vary. For Dom0 the more permissive of the types will be used, while for
>>> DomU it'll be the more restrictive one.
>> Split behaviour between dom0 and domU based on types alone cannot
>> possibly be correct.
> True, but what do you do.
>
>> DomU's need to execute ROMs too, and this looks like will malfunction if
>> a ROM ends up in the region that HVMLoader relocated RAM from.
>>
>> As this is a temporary bodge emergency bugfix, don't try to be clever -
>> just take the latest access.
> And how do we know that that's what is going to work?

Because it's the pre-existing behaviour.

>  We should
> strictly accumulate for Dom0. And what we do for DomU is moot for
> the moment, until PCI passthrough becomes a thing for PVH. Hence
> I've opted to be restrictive there - I'd rather see things break
> (and getting adjusted) when this future work actually gets carried
> out, than leave things permissive for no-one to notice that it's
> too permissive, leading to an XSA.

Restricting execute permissions is something unique to virt.=C2=A0 It doesn=
't
exist in a non-virtualised system, as I and D side reads are
indistinguishable outside of the core.

Furthermore, it is inexpressible on some systems/configurations.

Introspection is the only technology which should be restricting execute
permissions in the p2m, and only when it takes responsibility for
dealing with the fallout.

~Andrew


