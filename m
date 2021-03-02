Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4603296D0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 09:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92177.173925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH0BG-0004tN-FA; Tue, 02 Mar 2021 08:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92177.173925; Tue, 02 Mar 2021 08:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH0BG-0004sy-Bz; Tue, 02 Mar 2021 08:14:58 +0000
Received: by outflank-mailman (input) for mailman id 92177;
 Tue, 02 Mar 2021 08:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IOGE=IA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lH0BF-0004st-7F
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 08:14:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0318466f-0369-4cbc-b8c0-9cd3dd555162;
 Tue, 02 Mar 2021 08:14:56 +0000 (UTC)
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
X-Inumbo-ID: 0318466f-0369-4cbc-b8c0-9cd3dd555162
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614672896;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tBpvr+jtOURdNRVLQ+jynUJ2gNvQ6OrYPr243Nziiwk=;
  b=ZFp4O9q8AM7xdnE1yZJ0g0ApDdnK/+tBXnwP2sDTT0EQl243jeVu31Hb
   zV9kXUQ2vXLyWQK7Fv5yFJ0Ao+CvpAO13LdAAzYWXBpWnTnAkTrDdOiSC
   /Br5KsY3Zbz73ydDupyrBp4v05MiwxLTPEu9yE21o29WzoDJEvWWt8BQG
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Rk29h0pua5VNOheRRIUYNdeoS8Q1YOsOaWCgIsTUkUUH64q+NjaPXNg8PWoNquvIjc3MSDLCf/
 4CewCH7VKVSR65vHjGi5KPsvsZnb/g+qyFLtij6Wmw9zvOiLs1mkD6W+MfkYEU/Y9+Sp0hDVHI
 xhsti+6t6lowO14OMlH2I9xCbTAroDFc+T8R99OMZvgS9xne0mpetnJDzaZYDeovLGEP7Q55+r
 +8OOgk2FnSCKVTL9QogScnNw0V20pGMPoi3dIRVTJJPYr4qLNlr4s35Rn7YqtgB1pmVJ6A9FLP
 HCU=
X-SBRS: 5.2
X-MesageID: 39710801
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,216,1610427600"; 
   d="scan'208";a="39710801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1sJELANcE07129bXmUM5fzyPp1GnV6pz99xGGXNggyOE3i5Dmhp+7kRWIM+m8HZdWx/n6wJNYbBBPIgFMzMvPc0ke0tEYs1e9U50TqRBA0ajTr4tjuOn1IFh5clqqlP5vtQ9J0RUzpe8vcwjQUyVyCS/p3ZB4g8XYJ2dGCgP4pRQlFgrenRPEDjOIipIBhFm3IUkYUK2B8Cr3wdw9/RH60U7vte+/fvQhjELlX5uIlPXphuvjo5wfSh2n1D9jGNQNte3V0yjwNYRZpcESRZiQEl51dwH3r6MxE6jSMRM0GrX73omHijGzDOjcnFVK4LadMXe6H/bozmPZlEKUofig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mASKKHPaFRe5yQZgz7bVJnp0oWA64tl9OWZueHvhBo=;
 b=NjXLDXMzGedhxvAc+EVPPAJdgnmeo5LRgLz9QlrO2AxT0jgcCPHjkRlPVATYFVrr7i/+JzBVri97BgLk0lBrNVCpC8ow4N9G4NgKiAz/r+dunrrW9pPs3lXsB+mjXUXoebUwsZJZ/wQ/QQmaRUZM0R5HHZsBbehUurCAAXyGIg2/9gU8nT2H9uksmiaLWebGctbodRvCIkTXhemlwR1T/kvvJ27DXQ6N51w8kyjx0Xy75G7DZqlFGVfs+zBeJssAZOGOqa647zxhzHSA7xwRyQT/13w1o8+7KXmbZiQTCp1dWMZxt9HowpejsjfxwWS6NZA0N7IBcfAtW/RmpPEIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mASKKHPaFRe5yQZgz7bVJnp0oWA64tl9OWZueHvhBo=;
 b=v4A2hL/MnJDmrGKTmMOfF/331YROL3sQAVOMGfSIRDoFnZw3ClyFRfHYZ/6Ntlz3upe00gfLAApejp5Ljc+LeH1oQktmGcyUKqLzRNuTTWvKe9ftYBqVucdBuz5tx2ioYedCE0E6alqC3a4x7IJnp137oCNOtGYPrAaSjEIItP4=
Date: Tue, 2 Mar 2021 09:14:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build
 depends
Message-ID: <YD3z9LNpzbOfqmpu@Air-de-Roger>
References: <20210301095806.68518-1-roger.pau@citrix.com>
 <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com>
 <27ec9db0-69bc-df9a-8511-109f57972046@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27ec9db0-69bc-df9a-8511-109f57972046@citrix.com>
X-ClientProxiedBy: MR2P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b495ae4-6a59-45c6-58cb-08d8dd5340fe
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB559171B839CF292EB79B3CA38F999@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJf61a8WAXXJ/CcwNQjHZ06zaHopVfzrdfd/nXNmACaULQoprv17pF8QUh8NCKe2m9laHgyYMLJrkujTaASsf1tt6PS2BHAzGOJj0YwNKuPj9Pom3dtvf9G1stvhmv9OHprGLzn+BWTqoNN7OM9JPO3O8irkuYyeiQmXaXTQ4QI5LMPyzSx0Fjarid4CPEfG0wrMTd56mYX0kwMhRIDxoz7/LCHtSzyxBdXGf36KQJuyprVFTdf8jR2xrxs8lLmrk5tiZvuEsRmadQFpFVxGdyYrwV7lxn2qCOTmMDeZUS5k6e3u0TtCRQl6KMSAdwmdPZbAVxNZUabQwgPybRBBTwFpvFaqzrOBtc7CC899xJvlNbWWPxsPAJ7zykC+f0GYRD4JeO7Bj9hKpNBRxCaYl7lPOvtPmUw3H1iwfhcmTDBSTMv9+r+Ro2XpP4dvE0wvIATZmkcBfPRrMVgq4jBpCNQaGnWJ2Kv7uMNl+rx6qQJzCuHbaNkuV06Q69psjflYoDDGhkRJwSc3LmIjtXPyQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(376002)(396003)(39860400002)(136003)(346002)(86362001)(8676002)(9686003)(83380400001)(2906002)(6862004)(956004)(33716001)(26005)(4326008)(186003)(6486002)(6666004)(16526019)(66946007)(66556008)(66476007)(6636002)(316002)(53546011)(54906003)(478600001)(8936002)(6496006)(85182001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnMzblFGU0NPc1o2ejM3QUQzc1VPZ21oQVVGMWg0RHphbHJEcldYR3ZFZkFv?=
 =?utf-8?B?MXk1eTRIRDhBMDl6Tmp3aTYzdjZoVWdOeklFZUFGR1FDcCtTTGpOcEhpR2hm?=
 =?utf-8?B?WDh1b1RCTHFSK0llMlZaZmEyOW40bk0xZy9rZmpFQWNITzVIMDRMNFVYOEtv?=
 =?utf-8?B?dU9uajdoSTVXL2RMTjRHNEJGTHRmTWdGcVNRWVVWU0lLZzV3SzB4L2dwdkVv?=
 =?utf-8?B?STFCSEhnQUc0aUE3ZkxxT1BVUXhab3E4YlhHNHFaNjVCTFdYQVZvUHNIUURQ?=
 =?utf-8?B?V3RhVUFBc1BmdThta1lIUmtWNU1pUlFGVno0TU9ObVpKWjBKdFEwSkZFRFJa?=
 =?utf-8?B?T0Qwd2VNZ0ZQYXBiK3VEcUFMVmNnN2NUSUdsOGo0bW9HeWRyUTdiS2ROdTdr?=
 =?utf-8?B?RUpYaExsOWMwM3laMDBXTmZWVStYUjBVWkdJeFNvdTduT3p0QlVrY1Yvazho?=
 =?utf-8?B?NWRWSE5RTjhkVm9oYkF2QXN0RzR1VkowL3NXZWJGYk5kajVjMXBUcnlqU3ky?=
 =?utf-8?B?em9lMjUxS09Bam44WFNzZUQ4Qkc5U0ZvZzYraGJIVWtLV1RpU1dldTJUMmRx?=
 =?utf-8?B?NDd3VnljYXdtV2tsbzJhS1lTOWkzck9sbEhsVmVtL1RlYVlHQ0ZwTkE1K2FR?=
 =?utf-8?B?UHc3TTBLL3c4cUdLQmxVQytrZWVVT1BkaEpKRnRKV3pFOWVjK2N0Q1JjbWE1?=
 =?utf-8?B?SlNwcjlBaWM5djJuY3pRYVVhMEVwR2dhaWUrZFdvZEE3NC9CL0VoV2dXY1di?=
 =?utf-8?B?cUluR1RVZlJEOTJIbEZZaWRFTU5mZUxCaWlGNHEvdWxRK1JOZnFrZHBBUVE5?=
 =?utf-8?B?V0h5WndHQ3NCTkRkMlVHTjNvd2hOclo2S2xaZzBpKzNRclZtR0JoaGFLeldO?=
 =?utf-8?B?Y2RtaVlTMVl0Z3UwSHhJV29HR21CdDRPYkYzV3NwZWZKN3RjSlBZQ3NIWXJs?=
 =?utf-8?B?YlRVV3d5RWROYlhTL20vTThuNk8zT01RME5ET3prVXpibFRxMDAxMitQOEdn?=
 =?utf-8?B?aFNyL0EyNWs0dVRJdklNc2xQU093NGZtV2ZSSndQaTRMUnFCVStBWm5QVXR0?=
 =?utf-8?B?OVJUbC9Ja2VNSlpWSHdMbW5GVE1ZQkxZTkluLzFMTXMwK3M5MHdtWEVqTlBm?=
 =?utf-8?B?TDVNVEFQYXhUMktDOFZxZEVycHVNS2lBMEF5QVpJNVpIUEU5SGtKMjJaUlha?=
 =?utf-8?B?a3YvY3JtN3c4cklYMHBKMStzcEdvbXFpb1Q0cjJrMXZCNlpUTFpsejY3ZDV2?=
 =?utf-8?B?U2Y5eXI5ZldoVldWcEJSOWVxVUlOTmxZbjNLVnQ3UjN4K3ZJZGcra2NKeUI3?=
 =?utf-8?B?NVlnYnhXOERGd2dlYjN4ZjRIcXAxU1JmTHZodm5HSGt5SVNyTEhYYXo5Y2Zo?=
 =?utf-8?B?MXBVeCsybUJNNVhacjFqNHBLT0t1eFIrNXF1VVZpVkJXeE1DUVpLVVpiMHlh?=
 =?utf-8?B?anNqYzFWZDB5dHZYK1ZFZjgxRkw4dHJFMm1uaFdQaThWRS9BVUNubzBxU25i?=
 =?utf-8?B?anVSL2ZGcFVVczhtRGdzWjR1b2E3RlV6d2FBMis2TkV2RWprZit4WVk5QlJv?=
 =?utf-8?B?dWFmTTlueHhSU1hzYk9RNmJocThPdkN4MFAwZjc5c3hLRXZndXR6eDE3MjVO?=
 =?utf-8?B?dG5uYzc5dFU1Q3Z1MzNmNlRRcXJaeTNSRlVtOGlDLzFVS2h0RFcyaEZHZzNZ?=
 =?utf-8?B?dGZIUHBzMkM2ckthQmJEUlkwRUpxSUJNaVd4S0Z0UjNhbGszSDl5Z0JyMHps?=
 =?utf-8?Q?Yd2Ed5/Bq0PVETX+jwLl1TA/zym5/fsbFZ0snz4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b495ae4-6a59-45c6-58cb-08d8dd5340fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 08:14:51.8207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4twD7yEMr6CEsr5lYu1wgyDmzdrBDYUAZX2Eljgu+VqCEuovmVEPFCwM5iQWtoXkzZeO2Jcpe20O5N/x7BTRLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

On Mon, Mar 01, 2021 at 06:01:36PM +0000, Andrew Cooper wrote:
> On 01/03/2021 17:59, Andrew Cooper wrote:
> > On 01/03/2021 09:58, Roger Pau Monne wrote:
> >> clang++ relies on the C++ headers installed by g++, or else a clang
> >> build will hit the following error:
> >>
> >> <built-in>:3:10: fatal error: 'cstring' file not found
> >> #include "cstring"
> >>          ^~~~~~~~~
> >> 1 error generated.
> >> make[10]: *** [Makefile:120: headers++.chk] Error 1
> >>
> >> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> Cc: Ian Jackson <iwj@xenproject.org>
> >> No real risk here from a release PoV, it's just pulling a package
> >> required for the Alpine clang build. Worse that cold happen is that
> >> the Alpine clang build broke, but it's already broken.
> > Shouldn't this be fixed upstream in Alpine?  Its clearly a packaging bug.
> 
> Or (thinking about it), we've got a build system bug using g++ when it
> should be using clang++.

No, the check is using clang++, the issue is that clang++ doesn't
install the standard c++ headers, and thus trying to use them (cstring
in this case) fails. Installing the g++ package solves the issue
because it installs the headers.

> How does this check work (without g++) on a non-clang build?

It works because on a non-clang Alpine build g++ wasn't installed, so
the check wasd just skipped. The headers++.chk target in
xen/include/Makefile has a explicit check for a functional CXX.

I do think this is some kind of error in the Alpine clang package, as
I assume installing clang++ without the standard c++ headers is an
error. Regardless of that, I also think installing g++ on the Alpine
container is fine, as we would then also perform the C++ header checks
with g++ on the normal build.

Thanks, Roger.

