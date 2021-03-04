Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCA832DCF4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 23:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93394.176334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHwOc-0005Hi-S9; Thu, 04 Mar 2021 22:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93394.176334; Thu, 04 Mar 2021 22:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHwOc-0005HM-P8; Thu, 04 Mar 2021 22:24:38 +0000
Received: by outflank-mailman (input) for mailman id 93394;
 Thu, 04 Mar 2021 22:24:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHwOb-0005HG-4p
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 22:24:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89fc3cdf-72cb-4eb5-a325-8ac7476718f1;
 Thu, 04 Mar 2021 22:24:35 +0000 (UTC)
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
X-Inumbo-ID: 89fc3cdf-72cb-4eb5-a325-8ac7476718f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614896675;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=87eFYA642zQgH8yPsb4Mo6TuButVlMk/Pk8ZFdS3QJM=;
  b=fw2T0Ocjp4+PbiU2MvlWG6Kqn0Dd9qWnSzf8tFma+lH8tu0H7L1EnIdk
   +ib5SkCh6Jzm7ziDYilL8uEo9Hn6M0z2lh+TeisSwAPMLbKk9LowNYV/N
   6Hgt79IGDOInPl/fy+tY5Zf0cAe1wYQzRPToJf7CkeEDueGtQy0wmmmt4
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DUuVPUC2wmOQBNbzrDpUn/DeAWuw8hajHjLfbEl3FRgLWtP1HBmN3RwgvfbbuC4Cv7HO+599aR
 S/SaxPmZ1xBALdySA68Bzxilq4n+29kR5aO10446fy/QjISAlZE/e1goiU1ETmBMp1CKIAGLMc
 0KXBz3nsnD3BfSTqKXOKXI96Ih/YPZjR4GG+eX/cQxwIIEBO48tGLkDEN1e3yfyV+CQ1GI9Pjn
 Cp1Tfs4Z03Ie/4Zga7qd7XKvZKvWa6aQr83WkFOPJYCpQsAagHevnfPOUlgFeKpsfaCBYrINfR
 3No=
X-SBRS: 5.2
X-MesageID: 38582394
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,223,1610427600"; 
   d="scan'208";a="38582394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6CsKd/pMptu2NE/BjHX6rZKrFhAdE10wzjDxukIUziFNR1DepdOmYNyo8jvERN6gS0UeW4/TAa+nuNs1l/DJ72fG/7TSVxKYiZ0d4YczQUTEp4C7h0eV9yw0Xuw+TsawLSkq7cMwsOKMNeWs6CH74kZHYb8u10ayla62Kcw2phhThNLZHKrZKlZG767o6Uhf2JM/DWVHRYzQDHk56ftJfIrvaOF2FddUEuzM25PiaJTnod3ehWZrM+nIqbcFz+ihDs0VzKq3GFPt1DsDN9J0mmO7/25zA6w0qAYYCKBR8sccsJsklLO6ygYK5iB5R3ZwbNtEGp9Sp71TH3cszxm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHGO3gHLGY48Ws0T1aa+wPfhzSC7Xj3ox0pREaBXfuU=;
 b=aQ5fG7r3Zu+2nOTlxlGlukPCrDuTvn5Xp262FWNsvYhb5ZIka29kTjvYtYiHs4c62sKDir66l27us7d4VDhXgV0Phyi+HyR51kCyHUK4udBQqb6qj2Dq81eKk888g/v5GMKoznHnydlmMfiax0dJWdFRTLx8SEP9wLZ42dO+LD7npHRYymP1noXMmSpI04Ih97RqhKWt9ZMKY4feyz9APWmRMKKpzxIbzRUONwtguB6lGpx9qhahpSyZX88uY8V4C9tbZWbAj9z1weT4AicG+pvA4CA+qJq2QMkSRDxhX1VmcjPpgqhso0UGBMUGB3+4Pex5jOIY6JTgnnMFHZqXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHGO3gHLGY48Ws0T1aa+wPfhzSC7Xj3ox0pREaBXfuU=;
 b=IMpkyBqBIcdJQk2QvDEyhwkm5geNSiON6b9Nd6TryJaZ7b9DRVfH5R1wUrmEyK+weJJZQi4rfLPhLhvCQtdjy49fthZ7ghbc8JYuTaPrKDrUSSKiGyJQC7qT1hWKpPZJxxGUnI+4nSK74MM6SaY9+7Z1f5g/oicEnlcxmbNYvYo=
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210304130319.10719-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__
 header guard
Message-ID: <5fe61a81-942f-f527-43a3-2496ca168186@citrix.com>
Date: Thu, 4 Mar 2021 22:24:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304130319.10719-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43368fac-6b44-4c70-44d0-08d8df5c445c
X-MS-TrafficTypeDiagnostic: BYAPR03MB3943:
X-Microsoft-Antispam-PRVS: <BYAPR03MB39439AA9145E6E1A7935C9B1BA979@BYAPR03MB3943.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uSmPBtmJChDQ2aeNRjcb8At3U3Ag8J2QbEsFG++1SLd+ZEyU+MAi75rKDhjFGsO32jdHrzO9O+lZldvivznaxAypnlwizOgO2E+W+Y1kp/UEZnUFSOuRX1+yFgi2Lx0JudVfCuz6uHOFaE9TjyqpKfz1Mr6EeVB+cT0MkPjQc2HNvaKWO4rWIlEjdhije50K00dN9saU5qhAEckXO6x5WWAB6TYD/X/E9+Vh66DeDI41HTDT9Cv5v+F7MPb7XgXk4NEbnUHfUKe/roLWJUZZmQqR6quL+AYIxHMh0r3iVJeTabyn705n5V3dl+hZbWO9phQ8l/QlYojJ2Ij1xoyGDNRHeEbhKou+faX76F9qpGWS8Gk2yvkHFaPYQE1CT993vHYnZFk6f5gnXGA4UwcCsQU1xsBEYybd3HDq0JxMu4nUxgb8Hjcmtyv5Ixaq2w72JGFBoLVXmCfu1eTvnnAAy3fhulQENUHwYkj6PNA54qspVIGL54CuhNe7VNoactF4xeU7jXazCiWUIDDHVFGcyqD35QQrfF/M1jKmvcyoaGg9v0OlmBErBUobtbhDNApy7LKn/T0jm1R2SnGqBYT4hmdT8XVoiuKHzOFBaN/GeOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(6916009)(8936002)(54906003)(2906002)(31696002)(4326008)(31686004)(6486002)(16526019)(186003)(6666004)(26005)(478600001)(8676002)(16576012)(2616005)(86362001)(956004)(36756003)(66946007)(66556008)(316002)(5660300002)(53546011)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTJVQk1RZXpuZitOem1id1dsdElYMkFrMjNtZnhjQUMrNUtuamd2dDU3NW5u?=
 =?utf-8?B?Q3k0WENTZit5N0V4cjZjT3F5cXByQWp3bEtxY2tkKzJLMFdQK0JnRjhUd3Fz?=
 =?utf-8?B?Q2ZrM013M0prakdLeDdEakU0YjkycUhGdTNvSTNhZi9nZitjb2xnUzdVNDB1?=
 =?utf-8?B?eFhGcUhXTlFaUWYzb3NEZWFJQmJ0eVVGVm1OU1BzaW04dldlVitYUVZTbTdj?=
 =?utf-8?B?ZU0xdzQ3TmxnZjBMTjhTRlBRUHM5aTdEQlB6QlJPRHI5M2ZLeFhkSEtnVUFW?=
 =?utf-8?B?Y1d4b3JCVXAvSjR5ZHRqSFRPN0w0ZE9CRjRLOGhKbXlzNUVWcC9qVFJSYWhX?=
 =?utf-8?B?QjA0dXUzelJDK21mNzVkbHZ3ZWFQM1NhMlVLTDZDQ1NtcThLaVZHRnk2YThV?=
 =?utf-8?B?QTJXM1JpQkt0VUlvYWFrMVU0NElOMHVxcmV4Q2picklKRWcxRWZralp6eTZo?=
 =?utf-8?B?ekxLbmZVOUQvZG9ZbEVKZFQxU2daN2R1RFBrazU1eEk4NVBuQ1psdHc4RzZF?=
 =?utf-8?B?a3lHbkZDSnhxenlmOXIyQ3YvZmErd1FYNFZNZlBsUHVlaFYzOTRlSFdDcEU0?=
 =?utf-8?B?VkVQeWtQQTY2enZiZXduMVlBV2ZuaDQ1b0JWSFE1dEw3YVhNemlmbGFqaVBR?=
 =?utf-8?B?M05GRHVyeWFuU3p4SnZYZXdic3ZEaGFGL0N6YXo1aE9jZ3hZWk9FcXppUGRr?=
 =?utf-8?B?NFB5aU1hV0tuV3hXNlkrdldWeGN3L2h3Z2pQcmNnK0R3TjNueHhiaXpuMWxL?=
 =?utf-8?B?aUVZVFcwK00zTzVmaHRqS2tSVVNXL0RwUE5HcGJZdmhrZnZuaXIrTDZTQkp6?=
 =?utf-8?B?TEdPOG9vNHNZTEtTV0hxS3VxSGdqbWVkaERybUtWSkp6Smxqb2sreDd1cC9q?=
 =?utf-8?B?YXlzcTJqaHVQSldwMWI3dGY0czVoZ0FBQVVRN1JpOURGbUhVK2hCSm5DUDVa?=
 =?utf-8?B?YWpvZ0U4WFRKVEIvL2RDVnE0dTVtdzFLVkZMZlRpU1hpejZYT2JFVEx4eW1V?=
 =?utf-8?B?dzVVanRjUnpBM1lFSllKMHZjR2ZITTVtb3NIV3RGZnBrdjAvSE9zcGxGbXdh?=
 =?utf-8?B?bzl2SWlZK2dJTldYMVQzSUFpVEFmVGh2dENxUTkzTURucEJsbU5HOG8yenBr?=
 =?utf-8?B?SnZSekF1RWgyOC9EWEVJc25wVVR0dFZyTlNRYTNydUVMdEtTTDF6T0RwSU44?=
 =?utf-8?B?NXFhb1R2V2M4Y3Zvak1QVUFjSFBEYTA0ZDZzT0VJL1g0Tit5NWlORFZQMVhE?=
 =?utf-8?B?aUthQ2Z1UjRhUmxrd1h6bUZJdFVTRzdKTC91TkJjYTU5MmtFYVQ0REFPWGFK?=
 =?utf-8?B?akVDdEg4WkY2bVlZc09JYTJuYXhLbVE3cmFSeFcrbGNmS0U0RnFzYmxuaWlv?=
 =?utf-8?B?c1h4cFNjNXk0a2dnQ2swYk4vVkhSdmZaMEhmTWFUMzd4c2lZSytlVTJzZjZh?=
 =?utf-8?B?UlFDQkpmd1RLN0hDakdmK0pmWjZWa2NZemR4OHFFbXRyUEVaOXNLMXBadVk4?=
 =?utf-8?B?L1ZDNFhTQTV0SU9HTy9TYTRaUmVSWXhsS1pRWDgxMk42VVlvWGpBaTF1eGdt?=
 =?utf-8?B?UGpsQ012b1ZIcDVTSC85UXk4SGZyMWx6alRjVk1QMTh3VWtqOUtKMHl6ekxL?=
 =?utf-8?B?WEJSTm1VUUNTMVVGVE5ZdVJZVisrMENvWWw3VjV6eDhpb3ZrWHhucUV5Wkdx?=
 =?utf-8?B?NDJ6a2R2NEpxbHRYSEV4OS9IdVV3RE9URVJCUXpLTGtqWVFXN0daSnhadklu?=
 =?utf-8?Q?d7jSgmwXn4JbI2hwrNSbxb0X+vemHIeAyLmjvTj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43368fac-6b44-4c70-44d0-08d8df5c445c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 22:24:25.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGpX+uIKBOmDuGGM6avRCSR4NTpn3fnbCxAExZJHoEDYOt4Hx49RsZO1IENPL9N+aDlJvO4OunCCb9IuERyHeTBApWA6mNNVr43PIFklErk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3943
X-OriginatorOrg: citrix.com

On 04/03/2021 13:03, Andrew Cooper wrote:
> This is inappropriate for the header file of a standalone library with st=
able
> API and ABI.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
>
> Discovered when trying to actually remove the use of unstable libraries f=
rom a
> trivial userspace emulator.  Current users of xendevicemodel.h inherit
> __XEN_TOOLS__ from libxenctrl.h (or equiv).
> ---

... and this patch is broken.

But CI doesn't pick it up because we've also broken the header check
scripts as part of library refactoring.

The 4.13 header checks do work, and point out that there is yet another
set of bogus __XEN_TOOLS__ ifdef in the Xen public ABI, which hides the
ioserverid_t type and (rightly) breaks the build.

Which in turn proves that the header checks (for xendevicemodel.h at
least) never ever checked anything originally, because they didn't pass
__XEN_TOOLS__ in at the top and just saw an empty file.

~Andrew


