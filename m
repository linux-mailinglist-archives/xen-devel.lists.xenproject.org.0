Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583243762A5
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 11:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123877.233719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lewTL-0001ki-36; Fri, 07 May 2021 09:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123877.233719; Fri, 07 May 2021 09:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lewTK-0001hu-Vn; Fri, 07 May 2021 09:08:34 +0000
Received: by outflank-mailman (input) for mailman id 123877;
 Fri, 07 May 2021 09:08:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lewTJ-0001ho-IK
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 09:08:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83febd23-3032-4600-a440-487bd5397f40;
 Fri, 07 May 2021 09:08:32 +0000 (UTC)
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
X-Inumbo-ID: 83febd23-3032-4600-a440-487bd5397f40
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620378512;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bttZZDHKhTCsJHYHd2TqwvJKWpdXhYD5+OubWwFU1F8=;
  b=RYMyFjQ/GxoEKzAYKfDd++MlSNmhXh5boax4op6wVcbG237EWQ3+wBUF
   Xt53WETdf0PM/WI85tOMsZq3LD7o7kJKtffR2aYPZ3mm0ZTRjVMePhVcu
   z53ZJ2Z5XerX3Nl/LW8H+S5ggM6EnhqkYV/a5RslcaFI+EoUgUAAYY/fY
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ma3UhxK+KIQIHakJOlsbwloHL47bz6TyWzK4sKrBe/JglDOadCuoGNg72lK3+xFt2CMb74BqGk
 Qe962F80Ed02RD139JswH4Kqs8v8mHfehWIRC8Do1c2ut12qGZQtxkke+GRM4Vg//FsTRnxD94
 sHLJhxx3EFpTCf6hpntjwWlUeGS5LdJUTirnzfIsboF3K86MAmG/XVSX9RFBE2COvmtnD0NxAx
 QwxjWRZTx6pNE2eBfAjcE3DwBIM7rm27mE1zhCRKhHd3ng04o6HlosfaveqtyIzCkAqYWOeqRg
 YLI=
X-SBRS: 5.1
X-MesageID: 43089387
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B8XrsqmNv7C/+p1XTry10WUC4hTpDfL13DAbv31ZSRFFG/Fw9v
 re4cjzsCWetN9/YhAdcK+7Sc+9qB/nmaKdorNhRItKJTOWw1dAdbsSl7cKoAeQZxEWlNQ86U
 4IScEXYuEYa2IUsS+Q2mSF+rgbruVujciT9J/jJqNWPGNXg90J1XYfNu/iKDwUeOCwP+tcKH
 M03Lsjmwad
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43089387"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGwjTfrO8bP7NCr+E1tLDO8BODvEadnXZWI9+4YJMBEI/ShlX1RwsLiyNfY6CS28hK7SMYq/rLHvb09g/tEFt6OKI5pBwWsCAsrMInyYpRfqxrF/CIagczcO2bfSTKvqhfSOjwI/n70kkjMTrLq5IEzNeaq0cFIW4zHZ4fv2eXojWl2NUzsyq8JrA4HUri+ZYdal1AxzybLI3faf2Ix7iSzsNzCaP9gL9vRmee9txeh/wd2UVc/K2qEwPZXTFD/MpVDWoIiz6Zn4i1UuJJmVLVBzVTSl7g21bqDcDJFGz1Jp3Cqjn6AtNJrC1rYRC4gUweY94zLwzMbD+f9k45le0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IkQx80Hb3xVr4x6PYdH59pgvItJyMAQ6I1uyU1oXWE=;
 b=jaXSaOaE4nwvoBqhOE9eOTnM1Emb5ZcM5gClexhxwA8FSZOW+Qixou7NBjJdGxuSsFu/Cco6b0M6va9bASYFdneX1tZjofDVybJ8shvEDfKqh9EeoePWRcmMkJKsnGigBi8k39aDIBzv67HGecgsHGHmQdGXmMm3VEmIrHJC9tfQrJKmjBk+Gy3pJr1gHgumdM/GvON8e7cOndRK8LlWLMh0AEo7mcD7zJqra6utWlsJh0GfkMq6SQuCHrS/ziNbfKv4n+EhnlRgVZWeHE2dmgZi9na3giafL4mRM+XzhqlfSxWJQjOJxX5KgaRlfgBPClNUxSK76c1K5iFzr1MtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IkQx80Hb3xVr4x6PYdH59pgvItJyMAQ6I1uyU1oXWE=;
 b=wmBG9q/IsBXmUh2RIrg/iYhTjHYevWCvHvWAiO0aPcz6q/b9JErD0yxVCKhCHRtcUxIQ5k46ZJLZRVIN4vATBxh5TMofknfLxjAjVT0BPsdS07lxA2IFvPRV4xOfk+mpG/JNsBevI2zIhhWW8Gt0ImVi8bUhonEr4vSZnmrDsFk=
Date: Fri, 7 May 2021 11:08:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/shim: fix build when !PV32
Message-ID: <YJUDhB1dBVDF8vmd@Air-de-Roger>
References: <08ea57f0-732e-fe12-409c-5487fb493429@suse.com>
 <YJT4cV62lqFgFKq/@Air-de-Roger>
 <c00c73a5-0d9c-9e1e-20d7-5d65ac23976e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c00c73a5-0d9c-9e1e-20d7-5d65ac23976e@suse.com>
X-ClientProxiedBy: MR2P264CA0071.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b691b29-d32b-4f23-39c6-08d91137ade3
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3371B7AA53898CFAF9E71E768F579@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ImXLum0dX5ku03Rb64z5wyb1VgAUHd3Bx70LptmZMCih+ff9AfYZEtTYBJ9hdsR8NjTh19q+NoHXp7AWdSd8oRScs9w0skg69z8mp0zM+TfNwb9PMEJvGYHoWGzVoT3qQIoL1gThYNETU4O4lG244AT58jZQMYSQG+d5YH7ASl2Ky9NV8TXfwwFKPgJ1j69eqZ1OX0RndSDy6qzD3cBKMGDaE93H7Z+g+0ax+z1fkOzPH+ZQ5ELwgq+dmu+xH6y99Zg8NQ8dTGXm571P3Lo2hdJyxCmSa9KUYSyFOJlzY9IVpG7OXTsNJ0zglK3z97e7OSX9eiLDV84ClORKoGfrX3sovruoPDh103CDDkXKC+OaoV33uftaJZ8CS6GkM8dGZVJu4Z+LZLh2S3TgQI8KskLxFPuAhqshuJePcRYLp38me2ixtyTPeLNmXrSShvscyE3wYbhg/5V1C6ESzk1yyJljxPkOz6mrfNqJlqxD6LKSOqfUFvujJJg7vMHugGkKxaalOPXN0xdWlzpAGhG9ZC2gS7/xsNe4KBbWjlKY9wFx9B/ySqeg4hTm97JgFrVycgk/Cwfw3Z1Jc0rv1Wm01Vd8KbojnpKBw9WaWXpgsok=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(186003)(6666004)(9686003)(38100700002)(6486002)(16526019)(4326008)(956004)(26005)(5660300002)(478600001)(316002)(66946007)(53546011)(8936002)(8676002)(85182001)(66556008)(66476007)(86362001)(33716001)(83380400001)(6916009)(2906002)(6496006)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnVVWUh4SXZPS0RHU1NRa1NzYWNyQTFxQk16VGlRL1JndHlyZndEMjBQa1Fa?=
 =?utf-8?B?bzl3dnREeVhLaHZUK0RVK1hPbm94Mk1TdTVwaTRDdE1NMHJTZHo5R1JndkI0?=
 =?utf-8?B?cG5IY1NlOXpkME9QYk5nVGtUY1hEUExEUDNydVlLT0JqMC8rZnBkU1BXbHRT?=
 =?utf-8?B?T1ZMTWswWm9LTkUvZ0E4bnFJUHl6ZWpVMm9VZU5xd2lLV1dpblRhekZ5Y0Ev?=
 =?utf-8?B?a3pmaFVDTWROdzJHcTg0Rk9rSGxQemg4K01oYUZKUmI2LzMyR0hVQ25NQ29o?=
 =?utf-8?B?b0NoeEJ0cEdzUnU5U0dFN1RGTXVNa3lzelZxN3QwODQzNWhpWjhYUHJEYXJs?=
 =?utf-8?B?dnlUTkJmc0xwNHpNcHhnbENUZXdZN0ZVM0lQcENMb1I1OEx2ak00ZnNUZDhT?=
 =?utf-8?B?eHdEVEE0SmR1ZHlQdkVNeGN5MVMyOVpuNm5JZGJ6RUtORENaWDJLQkxaU3d4?=
 =?utf-8?B?V3QwR25ZTm1WUGZwWVVHNUxTaVE0KzQ5ZFI0ZUFkVU82RERpa3JwbitiSUk3?=
 =?utf-8?B?eG94OVQzRUxPL05tV0ROUGU5QS9EUEhZdnZBRVZybjFVYmRtd0hrcTBCT2Ry?=
 =?utf-8?B?d2ZHemZZSUdEbnpjV3NiWHVZdEVjMDdYMnF2RVJCZHVQTTY5RFd5UmtHeHF1?=
 =?utf-8?B?aHkvWGxsZGhYd2NqenFLRjNlQUgrR2FoUzVVenJpVzdpQmFQaWpIWGpKcFdC?=
 =?utf-8?B?ajd4R2xpMFJqd01OUVpWTEJhTUlvWUlPRHJaU1h4NVA5VkF0TXJKLzB2WUhO?=
 =?utf-8?B?ZldoTTVac3VXa0JvbUxhbjJwTUpYejRGYWlxd2ozOXNkMkV3VThETlpPaDNt?=
 =?utf-8?B?Wld4UUhSQWs4TGtiVndCK3ZFNStJRHF0ekxNcnFRNmVEeTZkRWo4RGJZK2lI?=
 =?utf-8?B?QWtYTTJtOFQvMDZMMWVFVWxFenFTbXY3eEtxN25mWVYvN1h1c1Voa3M1ZGNH?=
 =?utf-8?B?eWI1WGNjeVhxbU10eWY3RHMyQk1xQUwrOTFVN3NBcVJ3ZkN2Wk5YUlY5Y0Uv?=
 =?utf-8?B?cEVxMGg3R2l6TmZuRmJEV3gwV2ozRUJaZlFmRm80dzhZZmRGd2plVFNJalIy?=
 =?utf-8?B?STBzK3VXZlpOQTk3T1M0ZDZ6eUFDbDI5MEVxcEdDLzBXV2RLbjRjK296Unhr?=
 =?utf-8?B?ajMwMlU1TXZiUFpCQ3Vnc3BkQk5aenF5NHBMUmJSUFBuSGg0ck5tRjI5eVdw?=
 =?utf-8?B?eFUwV3VDYU9mdWI1VWVWQStEc20yOWZ2TExXS2hoUGJzMDdxTWxGbWswNGx1?=
 =?utf-8?B?Tk1rdERWR09tUGFGa1NlbEU3L3Q1ZnFhTGZiemFhK1J3UGNkWkRFOFpkRk81?=
 =?utf-8?B?c1B6eUhIRlBTdWhUOEtjbUhCTkNhRy9xRDlGVmpSWHo4a0pHNnJkVm5nQlZF?=
 =?utf-8?B?WlFSR3JHTittc3ZBZWlOeFJXMUsrRXRFUnVOWHdTTFdad1lia0Z0R1A2NWh4?=
 =?utf-8?B?YXVrdVQ1Q3VlZkNJSW44Q1crZ0U0RU1iYXRzSVNMaFladWJUUWcwZjcwMTB6?=
 =?utf-8?B?Wmp2OGxZUFhxbmxMS0p0dDdRbmdzanJGYmVDTWpUZWdzMjc3cXFSeVo2WHVv?=
 =?utf-8?B?RDNjQ1Z6STdMdTAwbUdoVU9Qd3J4L3d3bHI4WFdRZnVFUGFxQk56Wlh6WG1E?=
 =?utf-8?B?ME1vT3B6bDBhSVAreGhwbDRqQnE1bnRrT1NXeVUxVDg0VU1YaGtNNjFwK0Iw?=
 =?utf-8?B?SkJ4a0Y4R1MwcWRIVlpTbjQxTGgwdjUwdENJWm9jQmQ1aXlENEY0OVJ2MmdN?=
 =?utf-8?Q?/7Q/evXiRbsH/ZJMx9sgk2lV1vY0qUBQsC2b+Bh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b691b29-d32b-4f23-39c6-08d91137ade3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 09:08:28.9750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Q4Oktz3wXWx4CJn1g0yH2kiCOKszqDRqGPQiptBW+8nXpeKvJC2V0YTDuujxrNCdJcsVc8vGOv0xUutxnQ+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Fri, May 07, 2021 at 10:34:24AM +0200, Jan Beulich wrote:
> On 07.05.2021 10:21, Roger Pau Monné wrote:
> > On Fri, May 07, 2021 at 08:22:38AM +0200, Jan Beulich wrote:
> >> In this case compat headers don't get generated (and aren't needed).
> >> The changes made by 527922008bce ("x86: slim down hypercall handling
> >> when !PV32") also weren't quite sufficient for this case.
> >>
> >> Try to limit #ifdef-ary by introducing two "fallback" #define-s.
> >>
> >> Fixes: d23d792478db ("x86: avoid building COMPAT code when !HVM && !PV32")
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/pv/shim.c
> >> +++ b/xen/arch/x86/pv/shim.c
> >> @@ -34,8 +34,6 @@
> >>  #include <public/arch-x86/cpuid.h>
> >>  #include <public/hvm/params.h>
> >>  
> >> -#include <compat/grant_table.h>
> >> -
> >>  #undef virt_to_mfn
> >>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >>  
> >> @@ -300,8 +298,10 @@ static void write_start_info(struct doma
> >>                                            &si->console.domU.mfn) )
> >>          BUG();
> >>  
> >> +#ifdef CONFIG_PV32
> >>      if ( compat )
> >>          xlat_start_info(si, XLAT_start_info_console_domU);
> >> +#endif
> > 
> > Would it help the compiler logic if the 'compat' local variable was
> > made const?
> 
> No, because XLAT_start_info_console_domU is undeclared when there are
> no compat headers.
> 
> > I'm wondering if there's a way we can force DCE from the compiler and
> > avoid the ifdefs around the usage of compat.
> 
> The issue isn't with DCE - I believe the compiler does okay in that
> regard. The issue is with things simply lacking a declaration /
> definition. That's no different from e.g. struct fields living
> inside an #ifdef - all uses then need to as well, no matter whether
> the compiler is capable of otherwise recognizing the code as dead.

Right, I see those are no longer declared anywhere. Since this is
gating compat code, would it make more sense to use CONFIG_COMPAT
rather than CONFIG_PV32 here?

Thanks, Roger.

