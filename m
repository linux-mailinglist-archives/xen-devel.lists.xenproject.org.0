Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D5376359
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 12:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123940.233880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lexVb-00055X-UP; Fri, 07 May 2021 10:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123940.233880; Fri, 07 May 2021 10:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lexVb-000527-RD; Fri, 07 May 2021 10:14:59 +0000
Received: by outflank-mailman (input) for mailman id 123940;
 Fri, 07 May 2021 10:14:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lexVa-00051z-LA
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 10:14:58 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d3d20c5-d192-45ef-b5a6-74bebfeeedaa;
 Fri, 07 May 2021 10:14:57 +0000 (UTC)
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
X-Inumbo-ID: 6d3d20c5-d192-45ef-b5a6-74bebfeeedaa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620382497;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=crvJVVwu53PjMIdGcMshT3EFT+w/5RooeQPdEJL2Vb4=;
  b=cLEENRKgoC1/vJZE+H8n3EFYXH9GO8hlF/lzUq1AU00XK3kvv7JVmJ/A
   HLtK38a8I6aNOaNbey/uLNy1qy8a8aJpf92Pb6r03uWXF6mRbc6LkS4mX
   SC0Y/f8tBbxwIKVT7BEYsuBd2vy/d6IGrM8DALJAba0g8b2OSmzDroCK5
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8Bl84VTAmdh7GC1iPuNLzhpmdaR5IutitRmWgDTVZGNcwMjEyeXEk4KV0UjUgts8GbyLfR2Dv8
 kVtKmuAdJD9BBcv9Wr0nBfk5hQenSVtfd9cPfkpW3aMkPHsp+eoLczcCRp+iyCwBwvd8qXzVo2
 l8RmWfB4kwEuPhvKrq9ZDP2bl2amIRDay0MUaRFDs4tlNqwOM6JxriFQA2B0EqyMv/JHKtomyJ
 FWCyQpgUtQzP2w892ngX09MUckHIcsMyXcjDxtdlwuKNNPt0Iuhedt78oW4aoR1moOhW1Lva9G
 PMs=
X-SBRS: 5.1
X-MesageID: 43283749
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jMdXzqqgNjyP3cvNxPLRm9QaV5sLL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7CZniqhILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eAQWSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+ww+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRi+erRfb8yvT9GA+cyDpAV74RHoFqewpF5N1H3Wxa0+
 UkZS1QePibpUmhOF1d6iGdpjUImAxel0MKj2XozkcL6PaJOg7TB6d69P1kWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wGJSFcZ4KcuZkZkIMMjgX5q3PgiFUhuYd099eLBmfYa+c
 xVfbThDdptACCnhkHizx5SKYaXLwQO9z+9Mzo/U+KuoklroEw=
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43283749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0rBNT0/Zpi/q0gSFvA/MC8EJAIZ9q7MzZ3eJSQhQ74DyEMdYUpMGpaiZxe0uA0Vo5U+XCXXCWkl6ODeTZcj/ITFL10nTtv/k/iSYkhaEro23paHiR8tSONEGRlRICT1LzAfq8wzNXixDPwgW8XjfudTrf0p9e+RLgwPdKrC3hkRzoPxt4jeJVHP67bIv1fSczEpv/Lr3NAW6fWsihbEV2swZfpLuE75DGOueN7seuD2GuAO2s2MjLzYeRlA8C80MSHaW7d9B7st83D5zMe8n/7GgX8XGi0/QB+u3AsI6RSHp7NKgXd/bG28GQ3KgxRqD/z0KDFGJAYdF83tTA+Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTEfHOjGNfS+EPLJAsyAuMcp1j34OhQGU0oOEQMhYgI=;
 b=LWPry6PUOPf6ayfdOuvKzzWHCShd0xX30I1Nit8pQM6rsKpg/wcWvaSJXff9gPr+CX6bsbafHT1vvS9cUDQU4oQeB38kas+UUSI8+1h9HAsxXKaJWem/I9eqan18e2/LlzbNP24KNq0AdYPsJ/Uti/FSFwQ71zqHDLHeBrlBN8Qw7DTEYhiGwK4HexgA+45+07qc2duT9fOgYVN3Odf4lZLZ/xoC3i473BB9va8/0vY/rOEjF3tIKMBCH06YXyXxFuREqP6CGdb+48oLIRsOxyDgiAss+Q9kycJvstWZDpVKx434ScnvXUakEMZOdAVck6J0Rtdn53jPJorEaFFjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTEfHOjGNfS+EPLJAsyAuMcp1j34OhQGU0oOEQMhYgI=;
 b=dNsXw/Fs2YvTQhz8WVENbU1zWdemt/6vQRQgytDOlNgIknS0EGPnozLIDA5iGEsGx/9ZmpHpY+TX3wZK75s5FbII4UpcWC/duCDtdM5pImgLxkKco0IfagHlDQPW8j0ayAy7O0LgmsPehuyzRHWvSvYLC94ty+P8qbFLsEXwlx0=
Date: Fri, 7 May 2021 12:14:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/shim: fix build when !PV32
Message-ID: <YJUTFZWAt2VFqXw6@Air-de-Roger>
References: <08ea57f0-732e-fe12-409c-5487fb493429@suse.com>
 <YJT4cV62lqFgFKq/@Air-de-Roger>
 <c00c73a5-0d9c-9e1e-20d7-5d65ac23976e@suse.com>
 <YJUDhB1dBVDF8vmd@Air-de-Roger>
 <31ce12b7-b6c0-c8c6-13f3-fbc6826d2810@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31ce12b7-b6c0-c8c6-13f3-fbc6826d2810@suse.com>
X-ClientProxiedBy: MR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7208aec2-1611-48e4-342f-08d91140f3d8
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB33709FC6A7308B8D05E1F0F98F579@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4oWk6upONqywsdiI8ynUZWXsboJKmkYPsmBDpY7roGnoen14bT3CLQH3Y1vEPozNAtvDtUp1ulKUpG7wyPwWq8i6U0IzOi8moscLGDoMdfPx+y14X5WzW/UtceHgIQcRUarXulla5hDuzANSObKIHN9OQjSax/t7OFUQrJo0ssEVAMYv0xVfkkhe6Anpfxlc0p3+AXN4wfaFxSBsMlzAk7CxFzc174JtbcD03nKjnZ05KJr2fxvBUJkfRg/QAmKieq3cVqaDeh57ANBq3X8hyYcavOdKDkCQ+DKykS61kYwS7dMfQrinjzXoMPLZk4SQ0RSoSEf3QG5AzayMO4wYXRy8EvoSuNsIYcKzceyasFb0NJ4Xb6VzVzxfS1XhnQ+gjMw5kSTfr+RtrKvbCBc1xhXbynUfVoNHlXXljTRvEdPHEzZS3ZYpKC3MvzzX9CZsCRdZcD5wca1TQADSwdoa9OjyKMJoCxdsTuid8Y5WM4BauXYAjJTnSyrY27vu/oeg4VlFxUzXBz0GHqw9M53TxlD7b8sxmLTQO5AckamvRckMufgtmhYaaPkvLKPVcFGvffSQGmfm86ONz1at4xe2hKul33KGNp07CQO5cDUDQEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(316002)(4326008)(6496006)(66946007)(66476007)(33716001)(86362001)(9686003)(66556008)(26005)(2906002)(6916009)(6486002)(186003)(83380400001)(478600001)(38100700002)(8936002)(16526019)(6666004)(8676002)(5660300002)(53546011)(54906003)(956004)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a1dsRFdXbHRudnhvQTNCYTh0bVR2MitTaW9abVhYNU5HT05scFZocjFWSlZE?=
 =?utf-8?B?VUt0eGd4TER3L1lyZmZqdUloTld0RXZqTjNodGhkWkc2YkZwMkNkbzZSOG41?=
 =?utf-8?B?SG5BcnZTV1NRNlljRlluNzN6bnNuWktYbFBZYjh2UHhEYk5RMTl4b1lvSFNQ?=
 =?utf-8?B?cHRzRTd3QVhUSyt5SXV5bjNFdFFNczFWK0dkTzZsVmVvN3kxVTdseDRqWjBI?=
 =?utf-8?B?UDVxTUZPSk0vaWMyYkFuTmxnMDR0Nkt4cHRSakdDUEZKbmhpc1o0Qjltejl2?=
 =?utf-8?B?ajJ5akhwSWNVWVVDdVNiY25xRnJpellVS0hmQmpkUmVhdGRiRUk5TGoxcGNz?=
 =?utf-8?B?QVlrWUFPUnZWZmNTNmhrcVg4bGUxT2QvbDE1N3F1R1RoMDA3T2U4aEwyMGVB?=
 =?utf-8?B?b0psbm9YY3NmWXV2enU2TFZRdmd0VU9PM2s2UjVtUDk0ZVlKZ3VwNS9RZkx3?=
 =?utf-8?B?RTMzY1ZGc0llTzZoZ2ZQOWJUcm9ObUwzR0U4MHpmdE11Y2EwU0I5ZzExM1RR?=
 =?utf-8?B?S2pEeU56WDYrMmpBWDc4c3RydXVObDZyRnJMcWRMT2pEUHV5eXNWVks0M0lk?=
 =?utf-8?B?RlFoVTAzOGVxQXFERjJ4OHptUXhPaFBzTVhkWjBXMTdKbU9lTkk0R3k1b1JY?=
 =?utf-8?B?bmEwMDBYdGdJREJoSHpRci9aNVk3TEpxcll0K2tZNWZZbmxCUlRYdnZnUStI?=
 =?utf-8?B?SWZzQVQ5WnhmdTJZOVdQVU9FWVVjUXR5RHF2TytPMXI3dU5ncStsMURLTnhG?=
 =?utf-8?B?U2FITVAwKytGbGlLOUxxNFZKUEJnTjBkNXpHZTE5dEI1Zk9kT3dyMWJucERV?=
 =?utf-8?B?bXRIbkVEOE1vZUlYalc5bm95YkJaSVJQRmVCUDllaDZ5MEhRYXNzc0ZRbFI3?=
 =?utf-8?B?ZWV3aTQ0VWRoNXJNUHp4cFVzMWdHRnNzV2dGckxiSy9vTllaZWc2ZldVUjB5?=
 =?utf-8?B?Z2E1b09GemdVZEhjQUlKMkN5bEJrMElpTUV5QkkxL1p6bzlZRlc5RkNiYWVr?=
 =?utf-8?B?WVZCeHNkbTQ1c0cwSXBtRzd5RDNVK2NWV0wzUEZlczlvV2VSQStVSTFSWndN?=
 =?utf-8?B?Nzd2ZWZaY3Y1T0NnMVZzRi9qblpheVRCcG1rbWN2Zk1WU1JYM2MrRFkrMWR5?=
 =?utf-8?B?ZW9pMmxGODRzMktEUXo4OFY0L3dmS1dWQkdCRkJPaHFOWC9zZjFDelpabHlE?=
 =?utf-8?B?eFVDMkpWYnFZKzFrWExpQ0hNOVppSGVHd2U2RnV6dVdFQU5wNHBZYmVRNi9w?=
 =?utf-8?B?MVp2Ylh5NWl4NGt6ZWVHaGZjb3liY1JDbklWVThnQlJIUHdZMFNCYloyUjBi?=
 =?utf-8?B?eUxDTDhsVnY5amE5ellvaEIrcWxyalArUXZLZTNScHNzS2VLUy96Y3pwaEVl?=
 =?utf-8?B?SkdrK3lGZkR2QjNCUDY0UkZLZlNLelQ3STJSdEJIbkdpUURUTzlnRE1TZko1?=
 =?utf-8?B?TWd3RE81U01KbGVEb2xoUnhSRHA0aWlPUGJac0VNbzYrSDBRd1hGMjBucEtS?=
 =?utf-8?B?dGx6a3d0Nkd3S1ZNTy9TQkhneXd6OWRoM2tVZDdlQmZqL3o0QXRrT3RFb2Nn?=
 =?utf-8?B?cVhWdGxxUXdocU9BaktQTXZuNmo2OTlUOC91L3hVK3FiWEE4TTRPejFBb2lN?=
 =?utf-8?B?Rk1qWGYxTzJwWHpVN2t5bDI1RWhnZ2VMenlqck45MHB0ai9aZzFOZGFWcGFM?=
 =?utf-8?B?S2xUM3pteFVGL25oc3FzV1ZpNWZ4TlpjOUNvRnVIZTlsSFpUeXAyeVI0aFp1?=
 =?utf-8?Q?fpBfXeZ5PZpCQz+EliQUZCGaH4NinYbfoBR5JSr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7208aec2-1611-48e4-342f-08d91140f3d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 10:14:51.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYFbqnvpMXbeqdCEtuCWis+aCvjj6QmrZnn/4RDgPaIKtVV008WCHqAa+SYnbJuLKJ3iavf3c1sNx/NWM+h2Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Fri, May 07, 2021 at 11:17:26AM +0200, Jan Beulich wrote:
> On 07.05.2021 11:08, Roger Pau Monné wrote:
> > On Fri, May 07, 2021 at 10:34:24AM +0200, Jan Beulich wrote:
> >> On 07.05.2021 10:21, Roger Pau Monné wrote:
> >>> On Fri, May 07, 2021 at 08:22:38AM +0200, Jan Beulich wrote:
> >>>> In this case compat headers don't get generated (and aren't needed).
> >>>> The changes made by 527922008bce ("x86: slim down hypercall handling
> >>>> when !PV32") also weren't quite sufficient for this case.
> >>>>
> >>>> Try to limit #ifdef-ary by introducing two "fallback" #define-s.
> >>>>
> >>>> Fixes: d23d792478db ("x86: avoid building COMPAT code when !HVM && !PV32")
> >>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> --- a/xen/arch/x86/pv/shim.c
> >>>> +++ b/xen/arch/x86/pv/shim.c
> >>>> @@ -34,8 +34,6 @@
> >>>>  #include <public/arch-x86/cpuid.h>
> >>>>  #include <public/hvm/params.h>
> >>>>  
> >>>> -#include <compat/grant_table.h>
> >>>> -
> >>>>  #undef virt_to_mfn
> >>>>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >>>>  
> >>>> @@ -300,8 +298,10 @@ static void write_start_info(struct doma
> >>>>                                            &si->console.domU.mfn) )
> >>>>          BUG();
> >>>>  
> >>>> +#ifdef CONFIG_PV32
> >>>>      if ( compat )
> >>>>          xlat_start_info(si, XLAT_start_info_console_domU);
> >>>> +#endif
> >>>
> >>> Would it help the compiler logic if the 'compat' local variable was
> >>> made const?
> >>
> >> No, because XLAT_start_info_console_domU is undeclared when there are
> >> no compat headers.
> >>
> >>> I'm wondering if there's a way we can force DCE from the compiler and
> >>> avoid the ifdefs around the usage of compat.
> >>
> >> The issue isn't with DCE - I believe the compiler does okay in that
> >> regard. The issue is with things simply lacking a declaration /
> >> definition. That's no different from e.g. struct fields living
> >> inside an #ifdef - all uses then need to as well, no matter whether
> >> the compiler is capable of otherwise recognizing the code as dead.
> > 
> > Right, I see those are no longer declared anywhere. Since this is
> > gating compat code, would it make more sense to use CONFIG_COMPAT
> > rather than CONFIG_PV32 here?
> 
> I don't think so, no, from the abstract perspective that it's really
> PV that the shim cares about, and hence other causes of COMPAT getting
> selected shouldn't count.

Ack, and we already use CONFIG_PV32 for similar stuff in the file
anyway.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

It's just becoming slightly trickier to figure out what do you need to
gate with CONFIG_PV32 IMO.

Thanks, Roger.

