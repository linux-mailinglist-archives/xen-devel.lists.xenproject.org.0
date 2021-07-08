Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F63BF3BA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 04:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152827.282321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1JQd-0004KT-5j; Thu, 08 Jul 2021 02:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152827.282321; Thu, 08 Jul 2021 02:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1JQd-0004Hn-1u; Thu, 08 Jul 2021 02:06:15 +0000
Received: by outflank-mailman (input) for mailman id 152827;
 Thu, 08 Jul 2021 02:06:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFbg=MA=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1m1JQc-0004Hh-74
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 02:06:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77124ee7-4800-43a9-a21c-5cda207e8ce1;
 Thu, 08 Jul 2021 02:06:13 +0000 (UTC)
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
X-Inumbo-ID: 77124ee7-4800-43a9-a21c-5cda207e8ce1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625709972;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lmP+s7hj4CGXQYdv4A66k2V6bBjlpcIds+s1MeLU+h4=;
  b=dzD/RaKfK3zGdyKjo5iqA8RJEU/mRgzRhJ1dcsHopBDjCT9JxBPIpHTI
   CAmQ8idKKxf9H+xbwpX5hCB6GY//7OefzHl/ow/qsoutFv+m31Or5FqDc
   XY5blMy/nKerrcjn/r0Bv6aGYLA2dhYnenj5iVRRm85wULnop3mDgRjEU
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N9pNVU/J6k6tWZkopQdavz1+mSioRJyQE5qCeio68Fdf/axsevV2Tbx6nN3sEEYd87sP+5w+w+
 qQ1GJ8feBn2WYIu0eC+ssba1YnvZiqXiDx0Nx6iZt+g09xlUjvVrvAIIIg4X3tIg3a6LQ5Dody
 TL2mX3m4ns4+e+dukTztCUc+nGGY4EzQpXsuug2PMtW4n7fobsi1BJYSMBEj7VcOX1rBoDh7F3
 gKsZSDNB3ykZygHeVZxTHwXRJe2iUJgW7762MvlnwG82gcAvDyG4rRCuVGMwTewVI0PecJIsMG
 olQ=
X-SBRS: 5.1
X-MesageID: 47856587
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:y189FKione9kr20LZYSxuj59HXBQXzR13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskqKdkrNhQotKOzOWxldATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkGNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAU0+46MHf8LqQffng3OXNTLu
 v42iMonUvFRZ1aVLXAOpFTNNKz1uEj2aiWLiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsllP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtjgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4TkWUmxjIQLH48JlO81Gh+e9
 MeSv00pcwmMW9yVkqp+1WGm7eXLy0O9n7seDlxhiSXuwIm1kyRgXFonPD2Mx87hdsAoqJ/lp
 P525JT5fpzp/8tHNZA7dg6ML2K40z2MF/x2TGpUBja/J9uAQOEl3ew2sRv2N2X
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47856587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaVSX26S6AiB52xOD4iC8oBjlRmkE/6yVkq7pq0e4XGaNLI8dBig1fJr5kFwAGY7H30TLAtMnN+jJ8DDCZj+e2fLyz0XcsQgz6IOdii3INCT9XT+WkrnYvzRNCCSIcgwwOYsg+K5RPQf1ufZ0F1w3Hq+2RxUk8b0NiG2YV8YGp3Sl2gX3xF/TS55bImVKpj84SEUn8NN8OGREuq7FWg5vJwkODdYSloX5zaquN8Ffn3Zqk1dgumUM4YawqblnzV0T1kXfxU+ugCvJl6J0JmeDyX9BNIiFJzZ/3rRPv4th/IrKhzvpxH1QzaceqddPYhsLH/HNcr2Eu+jphY1pz0uxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOrYbItSG9VbjUWIXGRVeYj+90dusnZu5+vaJUfv72M=;
 b=HPAStzO9OW4V4RWtYnLY8MHXl6JZqMqXv6cH+J3lcjwPHYd/c6A/4C9FebdRKnItxyP6Od8AYiQpTQ3Kf9ZoNwwZ3FQYjLDJfqfZHK0eRZcOXZ6UqN318t3e1dxB7qYhsfTlG2/pC0et896FDXiBLG6tnJWeRQUIQVxf+PlHQ6EFCwYzTu220RVmd3CNjF+qlshWIox+1pUyes31m86MNy+CUJSBzgkyU9LxPffSJZ9WUKK4gYV8SGMsk0Cn1W8FdBt+bryrKP8OFdhQ7Mptjh7J4RTGJAKWsF/S/6AH02MQ3OVwAF6xpwO0IiONg651lpnPGkjfCRigsF+3GIQPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOrYbItSG9VbjUWIXGRVeYj+90dusnZu5+vaJUfv72M=;
 b=mqeTNi0fJ3ZR0TziNjK9C4Jc00256LHP41oi1dOayrFnG6bgHvdYZlKQONDMvFosRwu9EGFfXuO9axEbjlJ0WYlQ39+L3TjsYFSyCFBeY/ICh/kG7jGG8M2wB1J9CnRKThoVCyAimB9BzkS7MHVLxniTSalnh2yIOJOkTY0PGUg=
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: <iwj@xenproject.org>, <wl@xen.org>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <sstabellini@kernel.org>, <jgross@suse.com>,
	<christian.lindig@citrix.com>, <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
 <5e454ba6-3d3f-9402-140d-f576f9124402@suse.com>
 <927c1c59-734a-4013-9286-137fd7026c26@xen.org>
 <e2def3e5-8e00-8b52-2d0f-5231963607ee@suse.com>
 <54b5ff4b-09ae-429b-4468-c1b4691079ed@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3aa3fa32-f17b-507c-aafa-66ec3d41d29c@citrix.com>
Date: Thu, 8 Jul 2021 03:06:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <54b5ff4b-09ae-429b-4468-c1b4691079ed@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef2e7b45-2cda-4e29-7503-08d941b4f25a
X-MS-TrafficTypeDiagnostic: BN9PR03MB6060:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB6060DD96F743FF4B472C67D8E4199@BN9PR03MB6060.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZkI5ioJnoY1j/eGfVKb4yqtdrK8BVIMbJEyXl1OHzalM6pDXb1FG9cyfH8X3WaJU/xUCfC41hgPWGm1ulfzyCWXcLTw1DP+BuftYkhYTpgo6a7dgMEml0/hyt8EyVu+9hWrR8uag8R/c6FuFOvvfF5pM2kTI//q/1+SXcnwWjARKsZD0jX6TgU2Y/8ueH+UfFpja4g12Lt45SXgpmbmx3gGOCsFFHES8N3gaw8XcRAYqN4OSka9PwBiYlWOiiSsF4MowDYgtniBAHD7vxLQtijugtbrEZhxgkUi2wYsaRbGNRmwiUUcl/gDAvv4XpsmoINsiz0fQNfDTCJPwoz6/YzpSRv3k2wjM9vMyWZ2wcGKBgX80gqxLBT6n/Wnkzwrg+0mAJXTuO11YgltPh/28RkwnZ2LAyPPIYqAi9Cv1UnL1uQntlXALOZHSX1ex79HkH+rgL/T8FanLDQk/zfuMTM8xqUIyasAcYjB2Ue5NR+M5oSnw1hgp3wrsDXboAqR2JH//mVFULK94GVh/NQIzY5fkzS85hC4gsPb04w26s7xlnXFeCmp97qe3bpmJ7AUie6jDzfqNfKGEXJzVdKDilcW7Bh4M6u9TKBhw9lxr0tKT1SeRIFj88NlhV7pmmoLjp8ghJKdeg0chYeo/oiOvqGf/xG0t8pxty9jO0+GDRfyMYTjKMuhQ52nkfnnZCCIfYQCOXL+/K/TM1FBuoL/C7LNFENeMB1dxp8b5Zy82y8c6JBWr06VCHDNSk45v0Jr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(66946007)(66476007)(8936002)(2906002)(66556008)(316002)(53546011)(83380400001)(16576012)(6666004)(110136005)(36756003)(38100700002)(4326008)(5660300002)(31696002)(2616005)(186003)(31686004)(478600001)(6486002)(44832011)(86362001)(26005)(956004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmlpc0ZoZ3doMkgrWGNZb296TFlEbE5kOXlRYkdSLytzWVgvcmdMRURuMTZT?=
 =?utf-8?B?cVQzL0dnMU4vMVJWUTJuTVVFRHIwNjUrTjY0aFR5Y3phb1ZOL2pJWlVOSWdq?=
 =?utf-8?B?WiszT2FoQmFyMVdtSWNaZ25wSytzWWs4MVhuK1VOU1lXcU1SZkJvazF2akxN?=
 =?utf-8?B?MTl0MFQzajg2WDQwQ09LckZUWXJSak9Oc1VINWw3ZXUya0VNSjNoaHpyZFFv?=
 =?utf-8?B?M0RGQlppa2Q0Rm5YM3pMeDhMZ0xVWVBTSmRyNGI0NVNJT3l4UWFuQzJhdEZy?=
 =?utf-8?B?dmN5bXM1M2lHZFJxRW9iTE9nUE5qN2V3cUZkWCtkMnpJU2xmMVIwZi9GOTM0?=
 =?utf-8?B?bEtrUVRDRmFkclFwVW1vQk9EeWNTZGFScEZXeG9nc1pMbWpxK1V1VEs1eW42?=
 =?utf-8?B?djNhL29VVkhOZ2o0UTVBMWtwU2hIZTV2aUdsMGFoYURheWp0RXIrcFA3Qkdo?=
 =?utf-8?B?VkZWTzFPMTlsN1FjMDZGMFN2STFyV1dlSFRHLzd0RXpyKzhkWkF2dFRNYWNL?=
 =?utf-8?B?SWtoQXFzQWpicGxmUDNXMDROdTM0TkZQTncrN1AwQ2RIYTdGUW9nbThZRVdH?=
 =?utf-8?B?UktpdlJYZnBOd1dpbXhsbkxvUTY0L05FNDF1SURlMHgrdy9GWnNsbDVTUW5Q?=
 =?utf-8?B?cXVrZnVaWUtwUHVNbGZ6czJ0U2pERllwL0p4cFAxcUZoajFpUXlhWGdzTUJX?=
 =?utf-8?B?ZFpNZnBneC9XUUxCcDVmRVZSKzRYUVhpRzJxWWFPZnhnY0hOL2IwNzNOM0dG?=
 =?utf-8?B?a3IwRVBuaGJaWS9QZDRXaTB0Ymlidk51T0FYSjZrZ1JZam9qV1R5TnZ0clgv?=
 =?utf-8?B?alVlMFExTWtuWkowS3JhOC96N0FsS1dUVThHb0JpZldWcnpOQlgwRDVVRG5D?=
 =?utf-8?B?L3Z2eHZsTm5GTmZsZHBCeEMzbnVTZTk4SDVWT0pTd1lQTGpCUmdGano3QWVs?=
 =?utf-8?B?SExOZjhyN2YwaWhmTkFGeUphWlVpaFZONkFIWmJUNW5JZ3ZWM2Q5bmxmdXJy?=
 =?utf-8?B?Q1pqUTdybVhrOFo3cFdCNmNQcURHbXE3dUZzdU5tazNwOTlORDNoeEVUbUN4?=
 =?utf-8?B?RVplVVhmdFhwaitQMWwrc1dsS3dvSWZKR2VkZW9wbnRpdC9sRlZVVDhrejhR?=
 =?utf-8?B?dkdmQ3cvOVB1Z2tpa21wd1p0YlJEN1dLVjY3NGQvOEc4WVVhejhIYXF0NTBM?=
 =?utf-8?B?QkZld1IwMjBzcUJuQWc1REE3bHlIUVIwRE81WUFmUUEvQmhkOC84Zyt6aVp0?=
 =?utf-8?B?eDlMZGp3UENlVEFwWEhpUkN5KzVmSHJXSGJWUUt6T3dubnhkeGluOTdMVUE3?=
 =?utf-8?B?WmJrMHpjNEJIRTJodXZ2d2IrQTRVUEdmNU94RUN5RnlSN0Vmd2ZYb1VwNXdi?=
 =?utf-8?B?bGZva3oxb2lLbWlTQU1vRWU5S211NEdXdTlUWDZYOWgwYSt2b0lYajNKWWk5?=
 =?utf-8?B?bzBJLzVPMGRnaytWWDkwOTRsMFhFYzZxdXd5SUJYTGFZckphRks4d2RNb0s3?=
 =?utf-8?B?a2NpTWdYbi9jRWo1NXpQZ00vbSszUzIxc1ZHK0htQmRhb2dMZTRhZ0RWdHhX?=
 =?utf-8?B?WmE4aWYxQ0E5ZGVDYWE0NzlwTFFHbzhmRHIxKzFIUnBTK0E0QU0yZGpUTUdG?=
 =?utf-8?B?NUF0V0JuRm53VzBEWnVnbnMxNm5ua3AwWTkyTFA3Vld0SUx2Q3RZMXd4WERO?=
 =?utf-8?B?Mm1IZWl1c1gveEwrZkdOV3RUaGcxRE5mTkcxNndKWVRXVU9aeHdpMCtrY0tM?=
 =?utf-8?Q?v2RyPaUPhQTwVDALLqU9eAqlEYbycbB9tpfdDpV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2e7b45-2cda-4e29-7503-08d941b4f25a
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 02:06:06.7528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzc0Ub4G3dLnfxdXA1hQ+d0zOQJUZcyzz2Fgq1LaoK0abZ1fZw5BZAMuD1qnppWkqFVXSuTHDaiKYT43QCNUKrMS/9o+MjXSMHNjlMoPacQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6060
X-OriginatorOrg: citrix.com

On 07/07/2021 14:21, Julien Grall wrote:
> On 07/07/2021 14:14, Jan Beulich wrote:
>> On 07.07.2021 14:59, Julien Grall wrote:
>>> On 07/07/2021 13:54, Jan Beulich wrote:
>>>> On 07.07.2021 14:51, Julien Grall wrote:
>>>>> On 07/07/2021 02:02, Igor Druzhinin wrote:
>>>>>> Current unit8_t for pirq argument in this interface is too restrictive
>>>>>> causing failures on modern hardware with lots of GSIs. That extends down to
>>>>>> XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
>>>>>> as well. Internal Xen structures appear to be fine. Existing users of
>>>>>> the interface in tree (libxl, ocaml and python bindings) are already using
>>>>>> int for pirq representation that should be wide enough.
>>>>>
>>>>> By "int", I am assuming you imply "signed int", is that correct?

Yes, just "int" in the meaning "signed int" - I can clarify that in the description.

>>>>> If so, should the function xc_domain_irq_permission() interface take an
>>>>> int in parameter and check it is not negative?
>>>>
>>>> Please let's not make things worse than they are, the more that
>>>
>>> Well, what I am trying to prevent is surprise where the caller
>>> mistakenly pass a negative value that will be interpreted as a positive
>>> value...
>>
>> This happens all the time when converting from signed to unsigned
>> perhaps just internally.
> 
> I am not sure what's your point... Yes there are place in Xen that switch between signed and unsigned. We likely have some (latent) problem because of that...

Callers of libxc interface shouldn't have been using signed int at all.
They just happen to do it at least in-tree - that's what I found and mentioned
in the description. At the same time "int" type is for now wide enough so there
is no immediate rush to fix them up.

That gets a little bit tricky with bindings - they themselves expose pirq
as int. So a negative value could be passed by the caller and, given other
similar interace functions like xc_physdev_map_pirq() are using "int pirq"
to signal an error as negative value, that could be misinterpreted by lower
levels.

We can add extra checks in bindings to avoid passing all negative values to
libxc level. Would this be good enough?

>>> Such issues are beyong annoying to debug...
>>
>> No worse than any other out-of-bounds value, I would say.
>>
>>>   > ./CODING_STYLE is unambiguous in cases like this one.
>>>
>>> Hmmm... The coding style mention the fixed size but nothing about the
>>> signedness of the type...
>>
>> Oh, sorry, yes. The adjustment for this even pre-dates the two
>> patches to ./CODING_STYLE that I've on record as pending for
>> nearly two years.
>>
>>> The alternative suggestion is to keep a unsigned type but check the bit
>>> 31 is not set.
>>
>> Why? Why not bit 30 or bit 27? There's nothing special about
>> bit 31 in an unsigned number.
> 
> Bit 31 is the signed bit for signed number. The check would make sure that:
>   1) The value will fit other hypercall (the PIRQ is described as int in a few of the structure)
>   2) Catch potentially caller that would use the number that could potentially be interpreted as negative by other part of the hypervisor.
> 
> That said, I can live with the implicit signed -> unsigned convertion, however the commit message should at least be clarified because it is misleading.

Could you specify which statement exactly is misleading (or needs clariying)
in the commit message?

Igor

