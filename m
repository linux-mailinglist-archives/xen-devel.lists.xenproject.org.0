Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609693B46F9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 17:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147309.271437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwo6D-0000dM-6v; Fri, 25 Jun 2021 15:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147309.271437; Fri, 25 Jun 2021 15:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwo6D-0000a6-3J; Fri, 25 Jun 2021 15:50:33 +0000
Received: by outflank-mailman (input) for mailman id 147309;
 Fri, 25 Jun 2021 15:50:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwo6B-0000a0-LK
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 15:50:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5a04fa3-11e9-4926-a0a3-97e36c102e20;
 Fri, 25 Jun 2021 15:50:30 +0000 (UTC)
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
X-Inumbo-ID: c5a04fa3-11e9-4926-a0a3-97e36c102e20
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624636230;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lbJX1sieZyhnA6aRPLlgk83XxJE+uHXwtEf1cPZZ3l8=;
  b=DxvU0DYtsDQ9ot1FcUNzc7UcGVsDp7dZ+531LXG4SiFxG0v3TSPOTrWu
   Oz1A9+//7tNeh4tPqG0tP2jM5lVTr3I1MUoNvF4ZUfRoSSd2K0X/HcwQX
   EvzFgE4+b0DHq2CXrdumC37bEeAksSWGBz7M0Ybrv15imgSkprIjT25N4
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Vp/VasKC9PgWJrc6VKPIXpSqWww/PmtE6Wlg9toU5bzl0MI/iujibC6oM2K59DqPNv6SbTOiaR
 qi7vPNNUZghl/6bETIpaxyq+UhD/12gltxf0ByW4E6KzPT5W5F129FjeRitiA8qz/Dq+Vlq7em
 DsRXd8LHOs4zwuLxmMWkrau2YzxvAeguXa2gVFQN0fzMGM3yu3qZIVmlIdopdv/3JD13kGpnAQ
 2qsF24i5TOrvCzYfvLp4JN/cdIIJQiql9D/b+87qC38ctoDrzatHBe8r5DX3gf84tlHI34Y8N3
 kzw=
X-SBRS: 5.1
X-MesageID: 47357318
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oMjtyatA3019UNrm9oLRS67M7skC8oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKdkrNhR4tKPTOW91dASbsP0WKM+UyGJ8STzI9gPO
 JbAtBD4b7LfBZHZKTBkW+F+r8bqbHpnpxAx92utkuFJjsaCZ2Imj0JbjpzZXcGITWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/HOVwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5h+7Y23+4oowwfX+0KVjbdaKvq/VfcO0aeSAWMR4Z
 zxStEbTp1OAj3qDzmISFDWqnTdOX4VmgPfIBmj8DreSIXCNU0HItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3GlpL1vr5R5ziJSFcZ4KYuZkZkIMAjgX5q3Pgi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwQ/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MF/x2aKpUB3a/YQ8SgfwQrLMkcUIDdCRCeo1JcEJ6e
 X8uXtjxB0PkmzVeLOz9YwO6RbGWmWyNA6dvf1j2w==
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="47357318"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHQxzmFqt3IW74Z+Xco9nS3XKUb6ztiaZmajn2YPt4gGmXtXFjslGLEB7CRDGbtxUjLw1hHcRLQa0g52smvVmfAuruYA64LoHOO0h49F9sb66jwuq+7vQm4ncRJh6ZFZ77+rQruwYBjvvfbKo/2pakEcaRBJSkanivLBPFL+cjCPvBgEgWUMadhT2tBUmoHhbVD4GIhsRovR7S1uFIOMNyGaftN4LEATwDn+A1o+ccp89YeWMpwnH5H304zKu9mgLL2DeEiKISDI3klG5WerngHXtkFvu9+UKUi6AFTldzlmH4wwXQq7FfsBkjDlMCXlidTfq+CTjpmooF1GkacT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ak3tPlxQkMh5vBXIcYSQwADNQwkBWk5FyZpeHaInSCI=;
 b=Rn8NDaq4/VHrMnz7vdng6Gci6ozz7DQ1yI+Cgd40k39WYAL/wqBHtVW/0xuK3+0trp9ivru7yDFryhtQ3TntwGDbISx510L1NS2hu4ePnoj2YKR6i5y+dkcXD/O2cthysRWMpHDLVORxp3vzhTPDGF3zoQHGdxJTJpKol7hNEjxNzT4IMYcM5eWtjn5FmNbOLLly9S+lKXiDTjrDAIFBw/ah7Ix/kE0gtpKIwATA+oQ6HPiRofBXsSi3UJk3DX63uR7XCbq1FyrQ3LlP6206ChWYcw0B11NvKsyu9Pakm0/c0xnNaWu0RoHs10Q5FbOVbjuxeyad4RoLxzxrN4oLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ak3tPlxQkMh5vBXIcYSQwADNQwkBWk5FyZpeHaInSCI=;
 b=OaHQE4Fw9PWnOaE5XIZ35NlnG+DQFqPG7BbNA0irczIwukMJqNtLzhfvwtg2QRdeuQn4lXaOfacYPIyz8QRdjAWbfoDS6kYS4pJWKiqcNMCcoo4XyVhKcfyLV0TU1sK8Eww4txoqwmIFUUkyFWFk7+Wy/p1A54xVvByZKZlbTmQ=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Marek
 Marczykowski <marmarek@invisiblethingslab.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <e928490c-d13c-8041-0ff7-e8b69ee73d6e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 01/12] libxc: split xc_logdirty_control() from
 xc_shadow_control()
Message-ID: <034399e0-d79f-71b1-286c-823a97da7e73@citrix.com>
Date: Fri, 25 Jun 2021 16:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e928490c-d13c-8041-0ff7-e8b69ee73d6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0378.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c25559d0-e080-4225-a283-08d937f0e3f2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5744A758DA3ED354DEEB24E3BA069@SJ0PR03MB5744.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNBhdRSsp+D2yS6SZMCYRngMLA/NAqGMuJv+tGEIgXX6DEnilzL87I6uclD+AgGcxrpihocf6Ptx/8xD2J5eg+3oqWRI3dp5KCtFPyMwc+odkvTlmeRyj6QGNf/3JYZkQ0SCIkUjfMzxesbsvi+j8xhRwtzJKkirT+1/3x5HFV2i4gn9xAWYjCOIyhgcewQ8fv3Ur0oAZVUgykRXH1TN+WXWrkjbEjHT7UbggHH7l4TPq6kwqAQUIH5rGw/VqCZcXxZxnj7STUbWqdTb4MG+k5Z+C55LxcqFhJxRvwURtwbehK3CXDVoXNpf5zQ1dy23G2QvCmmu1EjzH8l+QG9xnR4QVUFQV+BdGOt8y2RpofGUGhUthXZVgzisO8FswF59bbaWFSYmhS+8IK0g6Xf3HyVTaz7gaxixqcKtEDtdl3awpQMhcXnbsMhx+3I+QLlXlO/75QIZ7AOZt4HdHb4Ofl4cf37SfnecxeJhNo0JWD8p1fJc2pjpodgOf62y4SoqEyEGLlgnUu6kSrusQZB7ZnO/hwx8HDYnCwQAQaQmUIB4n+PLqDyR1u1uWRNMCKiS+aV6ghXjyPlCG6kctNhPM4SzfPTaNL+I3YK4nXHETq4YtKL4B+wFrsJJ7C7Gl3RYRFGvdJSsnNc7tlQU1YvOoNAHRE79A5+RBYRmH9iEfZEicR7gF+luL9TJHJoaNlxU5Odq/QS21I18i+1bnII39TNVFFthkk1OdUoea8G6RWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(66946007)(8936002)(16576012)(316002)(66476007)(66556008)(6666004)(8676002)(956004)(6486002)(4326008)(54906003)(83380400001)(110136005)(53546011)(31696002)(36756003)(16526019)(38100700002)(186003)(86362001)(478600001)(2906002)(26005)(31686004)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG10MHB6WEc2L2tUcG1NeHRoWDliTHMrQmlZT2tmcUdUMnU4dHB0VHY2a05s?=
 =?utf-8?B?TEw3UmIwTVdUUmdOSjhkaHdSSUgrdmFxbzlPSXgwSVBjL3FObHVzUEF2YTRa?=
 =?utf-8?B?TmEwU09ncklEamZIT1lLTy81WG5yWXdKRExCdHBzdloxNnJoRktwWStHb1d4?=
 =?utf-8?B?dzV4WXRxa2tObHJPZFJLVE05VGdPaG4rVXprbCs4NCtuNHlVcGs5eGpqcFFO?=
 =?utf-8?B?Yk1QRG9pMFl0dlh4bzE4azB3YXUxbzAwQnYrUnQ5WjZ2Y1U0N3FEUFVjbWV3?=
 =?utf-8?B?bFV5ZDY1bUhXdis5aExJQW52L1cxc0hlRVlIakNCU0RibkZpVXd5NHVwa2xE?=
 =?utf-8?B?NFFDNXpkTHZtbUN5d1hRbWtsbmJNc1c0d3hDV2ZjTkUrMWxtL2pyZ1hzM0VH?=
 =?utf-8?B?aVlnTkw0WU9lYXN1NFhVZVh6YXhYUUpOT2tOc1hBQTJKOXFRT3VtNWQ2eEdJ?=
 =?utf-8?B?bWlLRGhmcVlvY0x4UHB2bDRvblpGWGFkQUk1bEl6VjljVkNlSjk5T29kVmww?=
 =?utf-8?B?dXM5TG1pMXBEdUo0V2NhNDU0UU01Ly9RZTY1VURVUUY0VGRXeG1zYWZob2hD?=
 =?utf-8?B?OWRTRnorT1k2QVB1R3lLZTkzYVJKL1A4TnpFajFiUjdwUm1YV09Icmw3ckMv?=
 =?utf-8?B?NmR4Z3ZhTGd6TmQ3THo0djdMN29ZYVc3TmllK1ErQVVpTzNncVFndkk3aFdu?=
 =?utf-8?B?c1k5L09hWitzNzdYNUlXWWxVRFFIRStiMEJ5ODRGOGNhUTlwYVM1WGRNMTEy?=
 =?utf-8?B?VGl1N0lUaWFtbUdWRVdhenE1M2pWYi9LN1dYS0dRUDkxQmJQWTZYRVY3WUFt?=
 =?utf-8?B?QWdQaTkxeDVpVFJxaUN2WkkvakZBN1JCMUhQOGI4bjd3VmdIbGR3a1lnckEy?=
 =?utf-8?B?NjFMVDhjcVRyTjU0ZU1kT0Z3c1hKS25PQVdwUFJnaHU1bVhZS0F2Qjl3c3pX?=
 =?utf-8?B?OWE0N3NLMzFTNVk3UG9pMFpCNUEveTlxcTZvSHIycHpGZThmZGtaOGo3YzRR?=
 =?utf-8?B?RWs5M2JBZ3QzaE9KU3V0c1hOYmVCV0ROQ0UxVVRTMlZ1TEh3R0Rmbk5sL0x4?=
 =?utf-8?B?RFZuVGNnakozRUd5elM2aXNSK05SdzdTTmZLL0wyMS9EWWJrd1BpVy9lSlhk?=
 =?utf-8?B?K3kvK2liblU1NXZSaFpVbm5aV2NuTzJ2bys1NHEzcGFJUStId1l4Y3hubHhY?=
 =?utf-8?B?Q0I5NVJUaTFQTGdLQXhISlRNc25iTU45SE1oOEM0Zk5aOVZnT21TaHJCWU1y?=
 =?utf-8?B?ZnhITVk3Vnh1SWNpa21YbnFmOXQ4MmFSbUNsOElkWE1pVDR0V3E3RzFRR2F3?=
 =?utf-8?B?QWptS3lLR2FlL3QvREVSaUloZTU3bzRwNVoxaTl6eFFLa0NvbFIvb0U2cmd4?=
 =?utf-8?B?bVkwbUhvU3hRdmdOMStlK0ViU0N6WUdkTk9Qb1FlMWRuM2htUXRCMWJ1amty?=
 =?utf-8?B?MlFQN0RKSElNUStBcXYwYS9LVWcwUjduZ01XdzBYdWhRY0dGcGoxeVpUdEsy?=
 =?utf-8?B?SmpibEp5T0FXclZDRXdpbk14UGl3dDExcTFXYkZhN0tkSU40Q0JldDFWV0Rl?=
 =?utf-8?B?aVppdVh1Y3JValoxQytuM29MWkpMd3dYTGV3Nmh3NTVBeUsrZFBoSmdWcDBp?=
 =?utf-8?B?WkZlTTVBUEhNbnhZMFdBNVRaS1F6TytobmlncXJnb1FWVCtzbm1SdHNNSUNB?=
 =?utf-8?B?dWFPbW0rZDJHT1FQMytHZE1iZ1BUWSs0amVLc0JaRGZqWHBGZEVqRGxDQXJG?=
 =?utf-8?Q?bE7rQluaGmNaXa6A3/AfTB8cb1sNSsGJNpo6YDg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c25559d0-e080-4225-a283-08d937f0e3f2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 15:50:00.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovaA2/0z22Gxo4HtDwaYzmEZ4IyDhHYHG1R8vBONUZop5DclEUY3v2IN0zCwSg2ownwmNeP409IqmlJIZ5owFex7Xj20f1++34DDELAee9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5744
X-OriginatorOrg: citrix.com

On 25/06/2021 14:17, Jan Beulich wrote:
> For log-dirty operations a 64-bit field is being truncated to become an
> "int" return value. Seeing the large number of arguments the present
> function takes, reduce its set of parameters to that needed for all
> operations not involving the log-dirty bitmap, while introducing a new
> wrapper for the log-dirty bitmap operations. This new function in turn
> doesn't need an "mb" parameter, but has a 64-bit return type. (Using the
> return value in favor of a pointer-type parameter is left as is, to
> disturb callers as little as possible.)
>
> While altering xc_shadow_control() anyway, also adjust the types of the
> last two of the remaining parameters.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder whether we shouldn't take the opportunity and also rename
> xc_shadow_control() to, say, xc_paging_control(), matching the layer
> above the HAP/shadow distinction in the hypervisor.

I do remember this being an especially obnoxious interface to use.=C2=A0 An=
y
improvement would go a long way, but I think we also need to rename some
domctls too.

>
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -885,11 +885,15 @@ typedef struct xen_domctl_shadow_op_stat
>  int xc_shadow_control(xc_interface *xch,
>                        uint32_t domid,
>                        unsigned int sop,
> -                      xc_hypercall_buffer_t *dirty_bitmap,
> -                      unsigned long pages,
> -                      unsigned long *mb,
> -                      uint32_t mode,
> -                      xc_shadow_op_stats_t *stats);
> +                      unsigned int *mb,
> +                      unsigned int mode);
> +long long xc_logdirty_control(xc_interface *xch,

uint64_t to match the hypercall?=C2=A0 All users of libxc are stdint.h awar=
e.

> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -650,25 +650,48 @@ int xc_watchdog(xc_interface *xch,
>  int xc_shadow_control(xc_interface *xch,
>                        uint32_t domid,
>                        unsigned int sop,
> -                      xc_hypercall_buffer_t *dirty_bitmap,
> -                      unsigned long pages,
> -                      unsigned long *mb,
> -                      uint32_t mode,
> -                      xc_shadow_op_stats_t *stats)
> +                      unsigned int *mb,
> +                      unsigned int mode)
>  {
>      int rc;
>      DECLARE_DOMCTL;
> -    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
> =20
>      memset(&domctl, 0, sizeof(domctl));
> =20
>      domctl.cmd =3D XEN_DOMCTL_shadow_op;
>      domctl.domain =3D domid;
>      domctl.u.shadow_op.op     =3D sop;
> -    domctl.u.shadow_op.pages  =3D pages;
>      domctl.u.shadow_op.mb     =3D mb ? *mb : 0;
>      domctl.u.shadow_op.mode   =3D mode;
> -    if (dirty_bitmap !=3D NULL)
> +
> +    rc =3D do_domctl(xch, &domctl);
> +
> +    if ( mb )
> +        *mb =3D domctl.u.shadow_op.mb;
> +
> +    return rc;
> +}
> +
> +long long xc_logdirty_control(xc_interface *xch,
> +                              uint32_t domid,
> +                              unsigned int sop,
> +                              xc_hypercall_buffer_t *dirty_bitmap,
> +                              unsigned long pages,
> +                              unsigned int mode,
> +                              xc_shadow_op_stats_t *stats)
> +{
> +    int rc;
> +    DECLARE_DOMCTL;
> +    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
> +
> +    memset(&domctl, 0, sizeof(domctl));
> +
> +    domctl.cmd =3D XEN_DOMCTL_shadow_op;
> +    domctl.domain =3D domid;
> +    domctl.u.shadow_op.op    =3D sop;
> +    domctl.u.shadow_op.pages =3D pages;
> +    domctl.u.shadow_op.mode  =3D mode;

Please use:

struct xen_domctl domctl =3D {
=C2=A0=C2=A0=C2=A0 .cmd =3D XEN_DOMCTL_shadow_op,
=C2=A0=C2=A0=C2=A0 ...
};

I've been slowly taking out users of DECLARE_DOMCTL, because beyond
being pure code obfuscation, valgrind (rightly) complains that the
hypercall operates on uninitialised memory.

> --- a/tools/libs/light/libxl_colo_restore.c
> +++ b/tools/libs/light/libxl_colo_restore.c
> @@ -62,7 +62,7 @@ static void colo_enable_logdirty(libxl__
>      /* we need to know which pages are dirty to restore the guest */
>      if (xc_shadow_control(CTX->xch, domid,
>                            XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,
> -                          NULL, 0, NULL, 0, NULL) < 0) {
> +                          NULL, 0) < 0) {
>          LOGD(ERROR, domid, "cannot enable secondary vm's logdirty");
>          lds->callback(egc, lds, ERROR_FAIL);
>          return;

:-/ even more COLO code which escaped my attempts to use a consistent
coding style.

I'll fix this up later, as its fairly invasive (context wise).

> @@ -90,7 +90,7 @@ static void colo_disable_logdirty(libxl_
> =20
>      /* we need to know which pages are dirty to restore the guest */
>      if (xc_shadow_control(CTX->xch, domid, XEN_DOMCTL_SHADOW_OP_OFF,
> -                          NULL, 0, NULL, 0, NULL) < 0)
> +                          NULL, 0) < 0)
>          LOGD(WARN, domid, "cannot disable secondary vm's logdirty");
> =20
>      if (crs->hvm) {
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -529,10 +529,10 @@ int libxl__arch_domain_create(libxl__gc
>          xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);
> =20
>      if (d_config->b_info.type !=3D LIBXL_DOMAIN_TYPE_PV) {
> -        unsigned long shadow =3D DIV_ROUNDUP(d_config->b_info.shadow_mem=
kb,
> -                                           1024);
> +        unsigned int shadow =3D DIV_ROUNDUP(d_config->b_info.shadow_memk=
b,
> +                                          1024);
>          xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLO=
CATION,
> -                          NULL, 0, &shadow, 0, NULL);
> +                          &shadow, 0);

I know this isn't introduced by your patch, but this cannot possibly be
correct without error handling.=C2=A0 There is a good chance of this call
running Xen out of memory.

Any chance of a fix split out into a separate patch?

>      }
> =20
>      if (d_config->c_info.type =3D=3D LIBXL_DOMAIN_TYPE_PV &&
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -997,13 +997,13 @@ CAMLprim value stub_shadow_allocation_ge
>  {
>  	CAMLparam2(xch, domid);
>  	CAMLlocal1(mb);
> -	unsigned long c_mb;
> +	unsigned int c_mb;
>  	int ret;
> =20
>  	caml_enter_blocking_section();
>  	ret =3D xc_shadow_control(_H(xch), _D(domid),
>  				XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
> -				NULL, 0, &c_mb, 0, NULL);
> +				&c_mb, 0);
>  	caml_leave_blocking_section();
>  	if (ret !=3D 0)
>  		failwith_xc(_H(xch));

Not a bug introduced in this patch, but this is broken.=C2=A0 There is a kb
vs mb units mismatch, and I don't see any shifts by 10 anywhere in the
Ocaml stubs.

> @@ -1016,14 +1016,14 @@ CAMLprim value stub_shadow_allocation_se
>  					  value mb)
>  {
>  	CAMLparam3(xch, domid, mb);
> -	unsigned long c_mb;
> +	unsigned int c_mb;
>  	int ret;
> =20
>  	c_mb =3D Int_val(mb);

This has a 31 bit truncation issue on 32bit builds.=C2=A0 I'm not sure how
much we care.

>  	caml_enter_blocking_section();
>  	ret =3D xc_shadow_control(_H(xch), _D(domid),
>  				XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> -				NULL, 0, &c_mb, 0, NULL);
> +				&c_mb, 0);
>  	caml_leave_blocking_section();
>  	if (ret !=3D 0)
>  		failwith_xc(_H(xch));
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -1192,8 +1192,7 @@ static PyObject *pyxc_shadow_control(PyO
>                                        &dom, &op) )
>          return NULL;
>     =20
> -    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, NULL, 0, NUL=
L)=20
> -         < 0 )
> +    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0) < 0 )
>          return pyxc_error_to_exception(xc->xc_handle);
>     =20
>      Py_INCREF(zero);
> @@ -1208,7 +1207,7 @@ static PyObject *pyxc_shadow_mem_control
>      int op;
>      uint32_t dom;
>      int mbarg =3D -1;
> -    unsigned long mb;
> +    unsigned int mb;
> =20
>      static char *kwd_list[] =3D { "dom", "mb", NULL };
> =20
> @@ -1223,7 +1222,7 @@ static PyObject *pyxc_shadow_mem_control
>          mb =3D mbarg;
>          op =3D XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION;
>      }
> -    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, &mb, 0, NULL=
) < 0 )
> +    if ( xc_shadow_control(xc->xc_handle, dom, op, &mb, 0) < 0 )
>          return pyxc_error_to_exception(xc->xc_handle);

Here too.=C2=A0 There are int truncations on the input and output, and like
the Ocaml stubs, an apparent kb vs mb confusion.

I'm not sure whether switching to PyLong is sensible.=C2=A0 Its probably ok
from a compatibility perspective.

~Andrew


