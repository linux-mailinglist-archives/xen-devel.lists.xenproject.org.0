Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28A301147
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 00:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73158.131908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l36KN-0005Nx-7D; Fri, 22 Jan 2021 23:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73158.131908; Fri, 22 Jan 2021 23:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l36KN-0005N9-3o; Fri, 22 Jan 2021 23:58:55 +0000
Received: by outflank-mailman (input) for mailman id 73158;
 Fri, 22 Jan 2021 23:58:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l36KL-0005N4-21
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 23:58:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4da9b9c-5ca4-4eb0-ba0d-d23681804ad5;
 Fri, 22 Jan 2021 23:58:51 +0000 (UTC)
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
X-Inumbo-ID: b4da9b9c-5ca4-4eb0-ba0d-d23681804ad5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611359931;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1oK2CBXkr1I4knziAIEYuUJHrSoSnUJ7D6a3FP5kVKk=;
  b=cqY19BdpGgUd0/zNqKLPd0fkTdlS8SmMlX9KhxkDXr/l8UF8vspROpvS
   AmkvLD253cW5OTh8aSBSeQy6/iksrBesCzUW1W2bd/QF15orJh13Jg+h6
   qicWYbnWOT6qt0rMJreW/Z6xPbDCDdzBUKN5qyLvh8OrR/vmhfAfF8mTl
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HwVFHo+wK1kxpp2BRcMRwl9ytVVC1lECtExxjUNitjJGE9n+8D0dH5pCMx8mu/8kLs/c9+bhgB
 Kw+YoUaQtkAcPZ+wFloIye728z8gWoEv4iUQDreb6DIwa9u7YsjFI7qU9CJQoXcTy4a7uU80R7
 OjojVAzORtIimY7E7f2LbCby4pqcwco/BjeR7945ixbon3VjBdNs7PNs5t2PHvop3GOC6GwoAP
 iRkBOfq7wDgqV4fnfuxVTUO5TDlrmuUPNbrN22OzFkiMn8frOGBAUozKLsKdlCR5Hje1rgZUfp
 Z+M=
X-SBRS: 5.2
X-MesageID: 35908125
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,368,1602561600"; 
   d="scan'208";a="35908125"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDHo8XNrRDJEf1L7ExsPOkvmbYczTDVraIqnmL/3EaaCbACtPSKijq20yreWOz1LXiuPGjuoVzRhRKvmxHJETvINJ2B/KrhI1VY/YWQRr9exkxEtgyw97sPrAgQW9bkFeM1KTWxU0r3xemIFbo1jlYixZIjcEpC6utEV6cvFAji6CsgGr1MJ/ATppHs0dfL0IH2zcxOJi3w5+/E5ixenjKC5P1UEy8kBuSonSbs+LPvHqWUbHMw79NtTej0mhsL1dtKHg9InmVDBqAwG6TNTbnC1d9/j8hMRfQGa6ff/YDLgfO8+ZOrV4ghwWxxfSCmhKtFs51d1doh+REJTAb+UHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oK2CBXkr1I4knziAIEYuUJHrSoSnUJ7D6a3FP5kVKk=;
 b=oPX7i0mopwsLjR33xe+cTdEVwq5AIuh/yFwRg1Ywbq/nh4g1e4Df7KkiTXSkLodPIUGlR7CdFEnAoUCnghuhYiCRb+yT21UVLxCMuYr5sUlb9yYU12AzR79MGQR3WKw0rht16krLA1qdSO6/hdNRyBA/H0JXtOfRExTK4TSTPmmu7UGwjXsljzGP0e5d2Gds+ENRhXfgvfcQN1/dA5gqKvJAc6lxcAzGbHiBGUxbG6BZv/90CkOvWtY9h1hyZbAtl0a8kkwM0FbNmSr7PuLo/Mm+ZhQmR6adB4lzi+wnMLtdcaD580eRYcgwnXNG1PRtaPPuAiQf9k9mgYCD+G/Nqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oK2CBXkr1I4knziAIEYuUJHrSoSnUJ7D6a3FP5kVKk=;
 b=bSrxgEoZ30KJmLysPqM/SAjOEVMk+dv6CLFQ9Cf58D1cIR+nXVSPoCX2h+i0KYmf4MSrgX5I7dWiTIH7KrA7h3chc46KkXlc5H6PjGwMXbCm5fQXqqB/hjEnrnSXcPI7lUcu9bwQhGZIce36vDxrtEKp1cInV9rn+W66aS47G20=
Subject: Re: [PATCH] automation: fix qemu-alpine-arm64.sh
To: Stefano Stabellini <sstabellini@kernel.org>, <cardoe@cardoe.com>,
	<wl@xen.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20210122235337.5414-1-sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <89195f07-9df0-32b7-ced6-7231b94f9e26@citrix.com>
Date: Fri, 22 Jan 2021 23:58:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122235337.5414-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::33) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f58a43e-d65a-4e2f-6a1b-08d8bf31a8bb
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5520:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB552020DA78A79F6A245DBE9DBAA09@SJ0PR03MB5520.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XaDuuEZgbfJXluFEIfvFQg8f+G/94RlkfVEqJcTNK5biY/1FIjMmumYqJbE8ABBuv7mtSU4Xo02qa+IvJQECgFEcdnmXKNilq9GsPxQdkIxerD0MqELPq2iQUapN+u3lobusqjOovg6wbQwtwkDydMKw5eU/P5L5PF+Kdr/n8T8TBQ0DUTHWNwTylGlsLvj21rrXve5tg4OSsC6Eak5fu4UCb/by+aayYHSlVXHoWmUpQDjEY/A22IYSEdmu2vOMzGIxG/E7xcW+aCqwYJv1lfRmbSklzLgRP6bezjjrct3R6KJRzuFqi58u2PPchSItI2AAXclWmUGOnMnZ7PwQp+e4rSHg51GDhq7cv5ywa6dOQ2tSJWsAh4Y8x4zXGWDq6Ju6RSzenRkzNoRy+le1q7jeu4KkG2moMbnOKUR3GjYPvF8blJIErcQiZ6NQgGYS1k8jbfZrgrI8dDWdRxyKje3NW4gYi3KHKfR0sriClZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6666004)(16576012)(8676002)(66556008)(66476007)(4744005)(66946007)(4326008)(26005)(53546011)(6486002)(2906002)(316002)(478600001)(8936002)(36756003)(5660300002)(956004)(2616005)(31686004)(16526019)(186003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZTk0TlVKVnVLb092TzAvODNlZXgwUUdSeVBkTC9Tei9LUjRycURHMG1MNTlB?=
 =?utf-8?B?WFJhSythNDFPTEo2dTB6NG8rVXRFWlU5NUY3aFFiNzIwYzh4czRSdFFTeXI0?=
 =?utf-8?B?TTBYS2p2bk1rSjVrZVR4aVlta0d5RFJKS0lzWDYxU1VtaXBzdXpIVUVwRGVG?=
 =?utf-8?B?WUI1cmRHSHJrRGNpdTlwaDZRUDJlQjgzcVVQL3NvNUJvRm5ucmgwa2F2bDU1?=
 =?utf-8?B?SnFSbzdVa2hpd3IrcEhVZWVCeklxSExubWRqRkJRWU1sakJqczJVQnRld25D?=
 =?utf-8?B?bG5qOWJBR3NQTWFDbmplWSt3NVF6eHhJbXM0Q1JoK1RZRGdHeGFuck9yNHRp?=
 =?utf-8?B?em1PMTFhN3Ryd1luTWJKbFVGTWJlZ3BSWHcvSlZNbTFXZHZPOTRJVHFkclVa?=
 =?utf-8?B?cHc3c2d5MlREaERPSVM3ZHgwcjA1Y3ozOGwzM0lUaC9FMnpmeFRMcTNla3Fv?=
 =?utf-8?B?WDJBU1NvMldLYlhkMjZ6MjkzMFhCdFpTTGx5WVVrWmN6RkZ5U1p2UnlJWkV3?=
 =?utf-8?B?TU5VcEFDcitTS2F0bW5hTVRCNmFqZWtHYTlxMDlVTWlJdk56V284L0dBMnhN?=
 =?utf-8?B?VFdJSXM1bjFkZXFualUzYVRQZGJ2dnZwOUlUQzljZm1pSXo0NDBWZnNYYUFk?=
 =?utf-8?B?Sm1lalNQdXV2Y3RURy81cUJ2VmgzVGFpSDdHMWhYM284aVh4VFJNT3g5TVhl?=
 =?utf-8?B?RlZLOTRJL2ZHYWVZVVBOOWxwNm5OT3ZPNlNTRDJQUXEyemxaK0VzSzZCMG05?=
 =?utf-8?B?cDJNVGdsMnY2TENoMngra1JmN25YL0UxalF4Y01UYzZEaEJnTzZUR0dDRHN1?=
 =?utf-8?B?am1RTnRqM3h0clJXWWgrMVVRNVpmUU1LUG5OdUVNWC82dHdYdnRXNTY2Y0py?=
 =?utf-8?B?WVB5Y1NLSUpZb2dVN2haWUJ4ZTh0WGJSL0lsa3d5d0dpWkFVbW9ZbXZhcWZ6?=
 =?utf-8?B?RGl5SXVXdzZLR2J2RU5rRXkvN2tVNjE1dXd0UGRidk9jNlhxK0hmT05mQ2hz?=
 =?utf-8?B?VlV0M3dHUE9BS2NjM25LL2hOZGxiU25WVzAyd0ZXaWVkcXM1dmJBZTBPYlZO?=
 =?utf-8?B?VTZKWXpac1Rxcm5TVjYrWjFlMjN3alU1UjM5U0N6dzh6c0ZZdkNuajRYL05j?=
 =?utf-8?B?eisrdzUvUmxQNDBZL2IrR25VZXFGdUZwYlIybTZUNnhOaWVpRElka2hZR280?=
 =?utf-8?B?WFArY3RXV2hUWFdWbUVKN1pZakM1ZkRnd2tUSTNhUjFQSVF4VU1OcUl5UENC?=
 =?utf-8?B?Nkx0TitPeU5UMmw0RDVjWkVDQUs3WDFzWVo0Mm5pdjgybFN4bEsrejBwM1dw?=
 =?utf-8?Q?GDP2HTYEvyRgfnS7QUBCTHsnxAAKeB/nE2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f58a43e-d65a-4e2f-6a1b-08d8bf31a8bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 23:58:47.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1UyB9E78wQLcj0Oz8QfgYCHiS3TPP312Ou/nfS1YXXqcPEQvUCOZe1A9XgbfqQsqtxKdVzTlsLWMGXU2aqmOFVsWYH6i9gEW+jNsPI5GHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5520
X-OriginatorOrg: citrix.com

On 22/01/2021 23:53, Stefano Stabellini wrote:
> Remove copy/paste error introduced by f58976544ff4 ("automation: use
> test-artifacts/qemu-system-aarch64 instead of Debian's")
>
> Fixes: f58976544ff4 ("automation: use test-artifacts/qemu-system-aarch64 instead of Debian's")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

