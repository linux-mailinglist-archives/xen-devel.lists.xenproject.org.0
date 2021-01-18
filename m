Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF812FA5B6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69856.125183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X8y-0000k1-NM; Mon, 18 Jan 2021 16:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69856.125183; Mon, 18 Jan 2021 16:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X8y-0000jc-Jp; Mon, 18 Jan 2021 16:12:40 +0000
Received: by outflank-mailman (input) for mailman id 69856;
 Mon, 18 Jan 2021 16:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1X8x-0000jX-10
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:12:39 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 304f544b-9e31-4c4c-80ff-ff7f95c1e2f6;
 Mon, 18 Jan 2021 16:12:37 +0000 (UTC)
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
X-Inumbo-ID: 304f544b-9e31-4c4c-80ff-ff7f95c1e2f6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610986357;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LzEh/jMPhSyNWH7VutvjF2OzCvFhsLL8ozxHGx760Z0=;
  b=Spm0Dd49bBCsEXqBemnuaGjdQ5TwNLMsdIMuIxYjWkiufcvgWDPynNIN
   NmILwRjjaW8T/Wh3wF6Enmza29izFeOYaiFLOI0WPF1AR/TorrIFdku0O
   IyyJTE28LJA0kmKsMccehmGYDGpiNzvg1SRjXpkPn5DxHeJePBZS6RcL8
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AqzW31EKOmRmDgwM7gGSCGgz2B8j7V0rffNkhNPy75jzOC7NkNgGecPAWum+l+Q9NhFi1Gdhgh
 8p+lhRIVIMZARpSMiQsDlYUAidur74e9gAMoavNnznn/yqp57gjFGy58BLhwyaJKUKyJsyKC77
 OQDVxai2D3ud54sK7eeUKVfBK0e3rnercYdIVBw+mshW07M6rqswGPGh8ANPBGW9uezwENF6ey
 eSmxxU8+j5KLS/WbSq8ksFRhk8DgLeozK1lqsyzCL1/HXz1psIXBH9nBcbtXxYYzUXXJci5etU
 0OQ=
X-SBRS: 5.2
X-MesageID: 35361359
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35361359"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqQBMMkN86LTIoplttZe8rSrYLUfuV6PSqQSk1B+pTC0obzQpq0Z0SQURMludoic+1M0P18y8wWzxoHMOy8uM3srhugU11SGN9+Wn2G8oWek6iOId2Pq9VvsqSMLuX3Z2AVKZ2n+aPSaof+8lAsHjeMf4xjR4AU7qDmNfp9wMKvjhzpeXqldG8TfyIx/KRUd380Ko0WZ14G7yR82npNTlp9VnR0rKj8d3WRu54RJR7TeQbcTbqtcmdNugsbhYg9SlFv6I8ELfcTgB4uc7AScCUvCtp0nQnixNOdFHROJGNeE1gCilm1jY42EVRIxMWGoo5rDFkz2v6oAmxTTQBi0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzEh/jMPhSyNWH7VutvjF2OzCvFhsLL8ozxHGx760Z0=;
 b=QvE/6OCGXxRGOLdaX6zrTV3RtCw7tb3OA0Zv3MW7pHgI4EYWhc2VGtN7SEMHi+H2mqbbhaLK63bJ2nqZ9RMoCWap0AoOAmOxqnwQSC2GaxvV+I7LKLquLaubGbkmduHLM/+wkwvl3lLEi1GcjZERFM1iXuil6Me53FtbCMDyX45ZiVHRJhz5chDsy1FMjl2dmnyXZW6ZdDkSK9+OZ4P7vHd03le4LtszOkpRNwfaZus09p5MMd4WhffeMD0xusRiK3I4bYUijRC1FpkHXRyg88rGJCHflHuh9gfkvtpbTylAS//4vsNpmBp0iqnQoC65lP+DasBRF6qbRVaqd27awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzEh/jMPhSyNWH7VutvjF2OzCvFhsLL8ozxHGx760Z0=;
 b=Ciug8wkjs+hykkLFHRXkcQlVfxDKsKgPfo85BkQWr3gacg2cs5KTAUFz14bmFQQ8OWxDI6GBZGKYQGOxglk9kMjkamgNWbcXad0jlrEZq9cLOxBZUGEaiX58FHXtdV8uPDLXeGbYLhDHJ6IUwCFMA+vnepMTLSAajZC++L6bDT4=
Subject: Re: [PATCH] xen/decompress: make helper symbols static
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
 <24581.45760.653861.613333@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <30b5ab62-8125-d0a0-46c5-61dfd0a2c0ef@citrix.com>
Date: Mon, 18 Jan 2021 16:12:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24581.45760.653861.613333@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::10) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81f2022a-93b1-4de3-8678-08d8bbcbd6b3
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5807BC94F164A3431EC0366CBAA40@SJ0PR03MB5807.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36oBRO3/VdQ8z4COsJjWdbys7xfFO0GtBF5H0L0OCF+7QNvZJWyqY0tGUoCpjtsqSiWVqlXCJDlYr1X2aq3rD+O7WjS9ljrfLu1/a9VLMW60nbUfglvh7PTlw3Mp8IgHTV81gm9/xRlGBP66CkVUP+8zQBDcTZzKt9hX0rC+A9wM8IJsT1tqk/YxisoPk+SEi9hWsLlrUqAOjfUz6lXzREGpYFOEio3pYOT/AgUWM52ZjlS4lDVNywqJtrlCxhKhDYHEUfGR/kEnvrUpbn7xWRvcP/H0eg3WFLTKE623GW7Fej9roK+k99cf5CVGSwFgO5sV6e+u2K1ubgao5SzYOPO738i++QQ6WpHPNzxvmx+O0voFr6pWFgzh28539JsXFP2QoCTbpnDmpFCndX8kbrkk3C4Hp4jPCvgkg0sK3CIclNQx5TVdB9R7vK2ehJuSBWwA3nYJT6T30DyhexxNvzf8zbDWHPcuKGUWjbvANr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(66946007)(36756003)(8936002)(66476007)(66556008)(478600001)(5660300002)(956004)(26005)(8676002)(16526019)(186003)(2906002)(6486002)(31686004)(2616005)(4326008)(54906003)(31696002)(110136005)(16576012)(53546011)(86362001)(316002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWh5ZjdGUGVTb1MvLzBmclIyOERNUFI3amtpYnN2SFdZZHZXR2g1V2VkRE5s?=
 =?utf-8?B?aEJ6RklGNFNiMDhqMFVNR1plNkkrN3drUTRZdmlEdE1UaEI3Mms3SjViV2Uw?=
 =?utf-8?B?V05UU1BLRHg3UWNFSjJjMUJUYTQ2L3YyY0hiYXV0U2lmT3FCLy9CZ3UvMW1v?=
 =?utf-8?B?Tm5wR2hHMVZJeEwyN3dXblgycTNoRUR3Vjg0ZTRmaUpWZm9YSDNBVXNWNHRn?=
 =?utf-8?B?cXQ3VUV5azFPRG9OWENCM1huUnB0bWZEYWd3VWVNeVpZS0pYb0htV3ZXVklY?=
 =?utf-8?B?dG5NOVUyREt6UVcrMGhyRU5tbC83QmpVbGJmcVZmL1pIUzVpZDd0QVJjSGhh?=
 =?utf-8?B?SURjZXZvSWZlSElIZVVOVXgyZHd0cWlwMVdSS0N1OTVoTUh5RjRlY3VjM05i?=
 =?utf-8?B?bGFCazY0OXNIcUZOcVQwZU1TL2liQzhycTc3QURXdzlVdjA4R0lNakdhTVBx?=
 =?utf-8?B?dmNPa1JuYXpUYTlVT2NhUXErdG4zSlY0Yk91Sy83cmdHN0hueHZQMTF0NG54?=
 =?utf-8?B?b1lrQ2wrMUNFN3RTT3MxQS9oZmxSOWFyQVRDeVBTMXNlb3VsRjlEMTVTa3d1?=
 =?utf-8?B?Q2NWMXNQWkhwMG10RUkwYm5EWlU5TE1kbHhFRkh6dzY0L2hPaytBWGphK2VN?=
 =?utf-8?B?RVBRbkg3YTVqVkcvRDdCdjJtbmVtMTdVNkVaUVRWMS9aNUJLSlNYN0kyWUtL?=
 =?utf-8?B?ZFJnaWExREdnWTlvR3ZqclpRU2M1TnBUOXdycjNyVUh5WWUzZ0lndXdLVjdv?=
 =?utf-8?B?SHRLZDN3aUs0RVNsT2dtQ004eDVCbVFjWmxTY3lKSzlXNStxTURLQ3B1VjJk?=
 =?utf-8?B?UldESGgrM0FVQUlVUXNuZElIV0MyWFdNL1o2ampzd1NlWkVJSWIrWUFINmk5?=
 =?utf-8?B?YjMrM0dXMysrNUJsZ0l1K3luTkhBVGtiQjgzT3FjS3BnWkt3SkNkUXgveHFO?=
 =?utf-8?B?dXVUeVJqZWtOdDBld2ZlVW1ZemlIeGFyK2hQd00xelpjWXdYM3VHeTk5ZWRZ?=
 =?utf-8?B?Wko1Y3VwR3dGRDFsV3pUSWZ6N0ZkY3dkY2tYSFVXeWN2c2N3aVZvdGZQakFj?=
 =?utf-8?B?SCsyS0EyUi8xZWRUZTNObDI4elozdHNFRFg3ZmdZdXhid2N2b1hBeGYva3Uw?=
 =?utf-8?B?U0o3WVo0MWR6TEE0M0Q2amhEaVY0U1FQTEhXY25HVG9RdnBkd0dXQnRVOXRW?=
 =?utf-8?B?WWp4MDZtMTcvNmU4ajVBSmpUNzI2SjVZbmp4VTJWT09aQkpYTEc0aW9XOG9m?=
 =?utf-8?B?QS9YTHpkaHNLQU93dE11STBZOWJOVWdRak1BYTIxSHdtOS9SdmpMbGhFSW05?=
 =?utf-8?Q?hOCPBGY1i/+F8HIHqhypWrkyMk/PkjSEHB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f2022a-93b1-4de3-8678-08d8bbcbd6b3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 16:12:22.9229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //zIFjbL8DJtA4SXaIMEllq3K/Ngf0acXzbNxJOGoRAtJuCwVceK0dnpP427biQMa5ttJf9ohsWDIIaH5gR7kL3TY16O5u0UTZ3WLUD5HOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5807
X-OriginatorOrg: citrix.com

On 18/01/2021 16:09, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH] xen/decompress: make helper symbols static"):
>> The individual decompression CUs need to only surface their top level
>> functions to other code. Arrange for everything else to be static, to
>> make sure no undue uses of that code exist or will appear without
>> explicitly noticing. (In some cases this also results in code size
>> reduction, but since this is all init-only code this probably doesn't
>> matter very much.)
>>
>> In the LZO case also take the opportunity and convert u8 where lines
>> get touched anyway.
> AFAICT, this patch
>
> * was first posted after the last posting date for Xen 4.15.
> * is not a bugfix.
>
> In which case it has missed 4.15.
>
> Please correct me if you think I am wrong.

It's part of unbreaking Linux kernel compressed with zstd, which I put
on the 4.15 tracking list.

Without the work built on top of this, you can't boot Fedora guests. 
The dom0 work is committed into staging today.  The domU work is in
progress.

~Andrew

