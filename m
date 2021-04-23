Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C89369275
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 14:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116298.221980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvHr-0001E8-Tp; Fri, 23 Apr 2021 12:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116298.221980; Fri, 23 Apr 2021 12:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvHr-0001Dj-Q0; Fri, 23 Apr 2021 12:51:59 +0000
Received: by outflank-mailman (input) for mailman id 116298;
 Fri, 23 Apr 2021 12:51:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/M9=JU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZvHp-0001DY-Mh
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 12:51:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72079be5-a7d2-4048-a0ff-6ca37b738396;
 Fri, 23 Apr 2021 12:51:56 +0000 (UTC)
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
X-Inumbo-ID: 72079be5-a7d2-4048-a0ff-6ca37b738396
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619182316;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2Le3wG6gtk9U+b2oT7Z1lfVxhrgWRrGoAU6EmW7bflM=;
  b=esC0kb06iHOYRDDh/+3OSD2ZQdKRtkqTNGgnVYhijFxNCrRCsIarrAP9
   EfUGHvma3NtvCqOcJWo5sUVsBuijy4OfxFqgnX2CwqOWR6u/sEBK64Gxn
   Qdh0Nk6zTzFNQjBy7ObWfGgb5oDjovKADmECj3ggC/QLquZcJpQ7VyWPd
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Fj0nkkCQL4X7OgRRwCX1PSMusZAudidZqb/rSt1uR78rTGBHvyP3Wa86vkweac2AvDiGXQfcLh
 gCThzbz4EdH5haS6g197Vovlk/GsJ8MXuM+v4EBeoUWG1iU7N28ptYBAE3mzZz3t56NmF61tyJ
 blKz3jewDSAKn+RFcR4OCIQLo5YuktIAQ3pCKDOSfd+MyEZCycRzDIAzaHNDgd7hLRR33KuD3t
 +tkwrjft09vKU+JMS9n5MyCrvzHHNsADwbvRLXtnOsPOjPFH9l8dRCQvQZOwOy/RGJZqHzyI8l
 P+Q=
X-SBRS: 5.2
X-MesageID: 43767414
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:g3SPianGA9JvbsYjDJOIjcyoUBPpDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="43767414"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+PzE2+N7O/eWzyso6PVUIxH512rifcJ5Ywac7HlUH9yJ805++JyPwRK+Jn8X1iKQo3TW/gSuXtdjP3TC7T+pXxUAn++nFB3WHz0b8gGcPxG96rVgzr3cPLGculDB/ljt5c0DPUB9maZilUTQXGQX/vrMsx/dNiFD0CWgGnVyRK/UOOlyHuwP6+KW51CDmsCL27zmPcP8qR+xl5G8y1HjjOlIj5k8a93qGcpcoj31YC486A2WyVL9v65kqOTjaEQbyES1I9le4kmvzbwc8UUUXGHjBKeqoWSoenvracCvr008rXJL1REMOMVyBF6Q9JBwTymUp6QV6znOxDud3SSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Le3wG6gtk9U+b2oT7Z1lfVxhrgWRrGoAU6EmW7bflM=;
 b=Tin7VjeOw/5C5EaIoskgkzV5ytZ0Vy84BzwNH1L1yHAKVeW6Atl20gHi+k9QswCLtfp/apKCPGxYhbLJpZseA/e1hA9/fwg5M6LYfEyP33AAXGjTn0sSM6tj3rdlItuMPK9Xkh0spVO++t9YtaC8sPT4v49IVFxm6nMKP4r2C+5miyuYS1goZOA6ZEAz9EEnsnbHow/kNJnzUkkW4SFjkGhqPAody7pZyI/zMBacLIjN/379q+5xVBvAP9LE/PY0pjABSyohvCFF0P37fMElkjQgRz0ng0f6Dv3CRdJxnk+39z4PFJi27NBxM0u9duko9CWpvm9rj4e+Lmz6aOffKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Le3wG6gtk9U+b2oT7Z1lfVxhrgWRrGoAU6EmW7bflM=;
 b=BkSX/qEySQ2+mii1B+GliQt4Zm7zu3emTpMSN+0Ql+BxzUSEPLtAH4B1fy+aYybESrMJUAweIBPKpgalEF/eEzWsi/QnqIlXGUEuFOooiZXGzePYaWnqcggbIu8ZzFuRn74pW9w2BaBbw4a4psrLnegPiHgkDLQZkxwXRn3VivA=
Subject: Re: [PATCH] x86/oprofile: remove compat accessors usage from
 backtrace
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210423123509.9354-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <148bd895-17bc-188d-e2e6-c1604400c5a3@citrix.com>
Date: Fri, 23 Apr 2021 13:51:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210423123509.9354-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0070.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6382d7a7-0fa4-4f1b-a543-08d9065691c3
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB349599F1607B84723FE3F7AEBA459@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8vQpcJ2Mdeulv1FlcJ7HLy8udCD1Ymr11B/aYYjCzcsOz6f4VfNzGrT+9+oPODYk0SG0fTfuH1JcoaLQeNmGu9J7IAsU838MWmE/Bdx1nmEoox5C5UbiztWf0hr9Y8EnaZJ1fC8OEujawUrR6Rg024txZbHl9dBMv3/KOQMXkrYSuEpJcdcVDmqCPJFsT3VqOsLQCvk9t8HqVBqFt/MGoxcRe7TZDlIlFThzjSCpdyotOD2r4hy6KSWMIYarebKg039P+xXgri9CzPpMtZwUF0+/DDIQudgQFzj6z5n3QX0uLlSC8W6t4XnOaRDMmvxOUIwp+jIaSF9HVM0XPwcDlYpekG8/dnaW/cvz1DkdCfai9MjR6+nMBnTaSY8RsjG0oa1XW1luyLpJI8NDEdr4bGTyDv0vhGn+tNz1EvnyEGRLkFnc0kRVc/2i4G0IeCAP2P5r3dXcpt90R1zO627/0jQn3orj3W551cwErTTSrAGdHPggoJrV6S/ccrA4tQIPb4MRLQxcmGwdCY1Rtz6+12MwcvflyunU27FurLvmwEpTVgtef3VGoTKWjbLA9QHCkLlESlCkOBZ8Wy+2UO9m3VbPXARXegGL0T/D3JY10eOgthE0+r8qOo2MLGzO1LL78peQyRgkRXXTPp6E1bef8GQsnbBHEEFtuRaK9hlXIg+xUf2+SJqNxuVFO7WMVYh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(26005)(16576012)(66556008)(66946007)(8676002)(31686004)(956004)(31696002)(66476007)(16526019)(6666004)(54906003)(8936002)(53546011)(2616005)(86362001)(186003)(6486002)(2906002)(316002)(5660300002)(36756003)(478600001)(4326008)(4744005)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2oxZ0EwaXRWNGV2SVJiWVNGZU80OXhXaFVpc3JlckxPV1BGS2xXeW83d0sw?=
 =?utf-8?B?OFpReWw0Nm5DT2tLMk15dXkwY09hSHhKWlRpN0Ywdmd6T2pGVGlRODhhMEFI?=
 =?utf-8?B?Q3RnWTVJeHlGL1NXTlVOeG9TdHo0MkhhZXJEdlprUFBoditYaXBZeGJQaEVo?=
 =?utf-8?B?MHhNRVF6M01PZDVvZXR1V0Vwd0VjbExieTZqb2Z0RHFHanJDUnREN0ZJTkZn?=
 =?utf-8?B?bnl0aHl4QkdweFMwajR2eU51N01Pb3ZJaGxKdmV0OWlHTGlYekp5UlliaWMw?=
 =?utf-8?B?VFB0RkVXMEpqTktaNWVwQmNIV1Bqek8ydGhHZHN5TEN1bGc2czliTnhBZUg5?=
 =?utf-8?B?OVp5S0YyV2RDMU1WWW5YUEE1TTBSQkg4TDZaN2hoR2F4Qzdwa055Y0VtNTh4?=
 =?utf-8?B?V1VGOVNUSC9kdFZQbng2K2t0VlZWdnByRVNaZ1FNRkYvZjFSd0k5RWtKVWpZ?=
 =?utf-8?B?NGRYU3k0bURtamRZVUZaZk1KQk4yUklMRzBHM0RkTjJ5dzZ2WmxLbE9YOTcz?=
 =?utf-8?B?dnFaTEx5eUZTT00yZmdWQzVEdjV2elEwaHhTTVNlT1JnWitaMlQ1TlZkclVo?=
 =?utf-8?B?NmhXa25QTFZIZjIrTHhEaHlSTDdHd2J0YUZuN2pzdzliUXQxTWVzcWxpVU5v?=
 =?utf-8?B?dlZzUlpRSC9GUFlVMkNscG5JL3Yra0hDcTVnemgzMkl1OTRjb21sWjRTQlY5?=
 =?utf-8?B?ajYxb1dyNWRLVFUyL2U5dDd2WnZURE1Zc2VwZElXUSsvZk5FeXVSY2xma0sr?=
 =?utf-8?B?dStOZkJCQTF1cUdtWHlXVEtVRXpjMDdXd010RU5mUSt0cm9KNGdCR3cyeUwr?=
 =?utf-8?B?L2Q0T2I4T3F5L3lXMStnelJJdW1tUjE5TUV2emJ5ZlBSNzQ3dUZnUVVYdVh6?=
 =?utf-8?B?SmpVc0d5R2pEUFZmS0o0endodHdDOTVBZlJ6MEgzS1p0dFlwd0tqQzRYcUpt?=
 =?utf-8?B?dW0vYit2dkJvRnJ1djdnRDh5aTdKd3hxZXZpNUI5QlgwMEdvRlUrdnZ4T1ps?=
 =?utf-8?B?a2dIaFpsWVR4emlEekFrRTJqODlxaVh6L1h3bS93RmVmR3p4TStwbnpKTXN2?=
 =?utf-8?B?bGdkUWtxcEZESzBvT0I3eFBmbXpVRmVXTjZsL2grM1B1eTROQ3RsREptTjk3?=
 =?utf-8?B?MkUwa1c2UFZ4dWViWVhNMEd2UlIrcFRlNDF6M3JlU2hSUzV3eE0weExNWVEz?=
 =?utf-8?B?TnhCM2lLVExTaUlVOVN1VmNOcXVHMDh0a0tlZVNxRnk2TitDVVdRRE1OQ1di?=
 =?utf-8?B?ZDFHcHA2Tm41aTNEQkN1OE5vd2plNUtqUEFKNDBkT1FWWGo2WXcrZEw0OE5J?=
 =?utf-8?B?cTVjYzFJSFZURGRyWm1zMytFWG1lNFg4R1hNWUs3amFpelc0RE1IYTArVHBw?=
 =?utf-8?B?UG1WeUVVdktvRkkyMm9qeFo1RkNFWWlubllYcFZBQjJkRVM4NHUzamh5QzZK?=
 =?utf-8?B?Y2VraENtL2RnQTFSV1VSOUlhUUNlU1B0K2VOT3VST1hEc3VWZU5YMGhoMlpM?=
 =?utf-8?B?d1BSdVZEQjJ5YkI2cjBqNDBETXhvYU9sYUZ0cEhrNmdDSk9QSkdRaTVMdjF5?=
 =?utf-8?B?NFhLT29NdzFMSEJPek1ueWI1aGhzU0FzVE45Y2hvdHdjQ3FKWjFhRmoyVjVB?=
 =?utf-8?B?NVNhSXFoalVPQ21LQ2RMRlJRRVI0K2xSV3cvSDhJZVB1ZXJUc3lWWi9MOFgx?=
 =?utf-8?B?Vy9JS0tRSDQ4RHdXNXk2dWNpNUdrTFgwYXJ1ZndodGpkUXBYcTZ0eDJVMEJP?=
 =?utf-8?Q?n3d8gx1rhfVfO77IeHviYuJr3U4GVQ5tj2QswaM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6382d7a7-0fa4-4f1b-a543-08d9065691c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:51:53.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBrulGa5Qa0z9KWIUrY2b7RiCJkTZJcy+lFd3Gsz/eD5n6OyTbYW8LmSeWJI4xnkYy2Hs1c2xnVAkNIO0LHe4DBEsJFBwt68EPBX8JP2du0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 23/04/2021 13:35, Roger Pau Monne wrote:
> Remove the unneeded usage of the compat layer to copy frame pointers
> from guest address space. Instead just use raw_copy_from_guest.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Just build tested. Note sure I'm missing something, since using the
> compat layer here was IMO much more complicated than just using the
> raw accessors.

Thankyou, and yes - I agree.  The logic was unnecessarily complicated.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Needs a fixes tag, but can be sorted on commit.

