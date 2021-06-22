Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7003B0CFA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:34:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146058.268684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvlDr-0008Im-LO; Tue, 22 Jun 2021 18:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146058.268684; Tue, 22 Jun 2021 18:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvlDr-0008GI-HO; Tue, 22 Jun 2021 18:34:07 +0000
Received: by outflank-mailman (input) for mailman id 146058;
 Tue, 22 Jun 2021 18:34:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvlDq-0008GC-6h
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:34:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdffe248-1a4b-43e2-9b61-a1748a031563;
 Tue, 22 Jun 2021 18:34:04 +0000 (UTC)
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
X-Inumbo-ID: bdffe248-1a4b-43e2-9b61-a1748a031563
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386844;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ByaQcM/oTyhAHtsKoD/+5z7Z8WiwSvG41oOTw0CkyDY=;
  b=NVnLTV7RDZTdzGMjMtBBkXcemHzzktkEMMym+DAlis1HQo9+nj5yyklP
   XipQxzAujya/2XnfbqGrN5ckB7pROBppWOQ6vSwUmXKkOA9IJ6pj2bb60
   otTCdlGNloF2w4bh/I8Rv+6MHWDs6yey170b2XwRGhlE9LeenF0f6hPLK
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j5SJrXeJznnNPYhhwAlkUtgo5J+WR4WqqhCNqJtnckj/eLUV+8SXFF+Z46o0OuqQkBdXdyeSK7
 9AO5fqN1sDyg9JJcaaR3nuWBZCksGxT8CKPwlD0M/yKsrURP8a3V4rwOAdtLuzk8ZHKqPBOagZ
 swmluLvf0qrOpxzWvmnKZ2WQ1TZlmWl2HLjyWnsTTLwHpvDyFLuAAJLveeVbFBKhTz+Obi9Nm9
 GQOAa2oyFZjrvwkApt+auXeZCpgK4sm6EU0wcCroxW9lg9y966GeBaJheRQn9GnnaYZ6t5oAOd
 G3s=
X-SBRS: 5.1
X-MesageID: 46717711
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JLQyKqxeiw8YKKbl75oKKrPwSb1zdoMgy1knxilNoH1uA6+lfq
 +V9sjzuSWYtN9zYhEdcLK7VpVoKEm0nfVICO8qUYtKNzOGhILHFu5f0bc=
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="46717711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jn9dmYYkO7jARu+a4Rq6V7903IH7FhXivDuHk8p1vbK4PRLhFmvDeHHKRD7kf87R7lb+HC7cFTKR56qAz/BiEFfrX+cLhpSKE4K5vLoCBNY6mEGm9/YwUQzbXhKk9niBaiSN8Lyyns2yjyhX+bMqaGw4BmejiJJuy6o39F10oTaZ7Yj2xi2iAdpMcHf3SlA5ANP+FnGWcBGcWC5X2dO8qiwpUZJf9h8W7yEH4yR507m8gnSgBuwlF/tBOLROIiL5TnW5MZoD8nVHo6V1otA/6RGuhF4+3BR3BsZFLEmDF+poAqEgDaj91RnKxq9XQMA75d+SXpbBe5KTvweCK5dVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByaQcM/oTyhAHtsKoD/+5z7Z8WiwSvG41oOTw0CkyDY=;
 b=bxfE9EoRxEoe6lIp5QlNWiDLLFXVGYWRbPlDRxF2IJFrED/xAdqku6NJqIMqdVEsTC0wJzmLSXZFGOtjGtAn3r4PTISzGJF6TMogRjB5SYAi97RSldbmTzxynv6xFJiXjjLLCyJ6xkNTK2cc4sba+vqe84730DMtiEYpFjX4yOKxjNRQMrr5ml2Dl0YEL1v4UoPAx2SxK5kgCTMqq0PiZo/3JChcBkMyoqVH5xQclUckmo8nG6GqqeKzOJA2ijNqTPB2DZ6uPbCXY3jygpsHBZAUHD2Nqco6CRXbunDJsPE/ed/w405sVZfRLXzDVBjszXflVwXu5MD3RIqVb6uSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByaQcM/oTyhAHtsKoD/+5z7Z8WiwSvG41oOTw0CkyDY=;
 b=ewq/qzfwfcH+bSEGSaWz7KB6F/LRbJbevDRhUoSxsnz7YxpSknQV8GoEtk+Rpwj7er5uH3CPkPQxQc43z0gacjfGEq3Yp77KUmCsY+/wcGC5fbzBnJ8jVUjyclcy3EQ/krUVPdoCaW2UOf2o2fGuJEbCLWgPJFFgNKq2GadNZDA=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
 <fed4cdad-950d-6d39-d372-37f88dcc2819@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 6/6] libxc: make xc_domain_maximum_gpfn()
 endianness-agnostic
Message-ID: <a90c24ab-141d-ef65-11ad-6149bfca5d3d@citrix.com>
Date: Tue, 22 Jun 2021 19:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <fed4cdad-950d-6d39-d372-37f88dcc2819@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab3091b8-e052-4815-0702-08d935ac4c0b
X-MS-TrafficTypeDiagnostic: BYAPR03MB3797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3797A8953700EC3257ED927FBA099@BYAPR03MB3797.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvrL5ucz4VNYuJFRdVUn+e623S/3rjH0EkTked9vMrkbnB3i+pp9ECxyxChUNYLA+Qf7q8aJd0dA6yr6BjwIzLVagfc9NGPZWoX20P1UYrzToZW1ePIwTDAHYs0AxrfEsymjOIQd6tkoFaNbXHKHtDkG9jAP/1TLerI1WwPB0Nn8rBxrA00vl77/D2X936yinOec1s2qvMgmssJu/h2kSHXtoexJzwTJs9VEKCAIDqY8zqaudEFVinlGevxfdKh7+8fVSAC6ojEFQuBD12tYCd8WTzCahF56raejCnhXJQ+b4V//OwJIXhcTCWLHSsQJZrTmJ7wuOngUR3/CLQOHsRfbFjuUSjwba0idCKxuH1abhRJWkvjSh5itw0GGw49Sp6WOZK+ffC9+7+3ZSxn+sQr7sFA+Gw1a1F79AX+dGrmXgHwD8nod9Z2yCX37yUQlsq5eqG3oHsA5YYjie3kngQpSH7TsVvJ2d+cw8Na6LwL8bm5RQzhLfwC+heRe+zzp1v2o003Pw/EtFnhd3R/U4I616Bu6J0PvsbsoxyRj9xMoKdwx9uxqHa0RWPuLtP7/jz/FqDvMk30hDHGQ3Y1U/bWr54k1+5enbCm3obaxPBsi08XQ7lRC0Bk7GVb0qfXjE0WslROjiaxjU1VIFEfjNsihjSbSfKAEPJ+eOK04n5poNHgQXyVRo0+2xtC9T3PM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(316002)(6666004)(16576012)(38100700002)(31686004)(5660300002)(110136005)(478600001)(36756003)(8676002)(66946007)(16526019)(31696002)(2906002)(4326008)(956004)(6486002)(186003)(26005)(53546011)(2616005)(8936002)(86362001)(66556008)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmtkTVpUcVJ1c1VxbnRPbXlkbXJkcWdVRlVDUzFWdTgxcUVtTTUyK01URzZK?=
 =?utf-8?B?S2VUNkYwZVhveG9Tbk9Ca2UwR0RtVUhvZEJYQXJOdTlrQjBrMWIzY3NxRW9x?=
 =?utf-8?B?Rk9sQUVMRGIvL3RSdzJWSjZZN2FRaVU1UUZXZjI2SDFCMG5TU2hEN29abDNi?=
 =?utf-8?B?eFpicFd3ZVVPWmY1TEhZejNXMERBRUpNZGcxSGYwWExLZ2JZUnFxa2lJcmtB?=
 =?utf-8?B?NzNOWVhyUURvTXNiZ2FnWmtINzFqdWx5N1FINlFGTlE5K1lwSDdQejBCdFpI?=
 =?utf-8?B?Q3ZLL1ZDZWJ6UUFEMFk4OTJVOUpickdXQ1VGK3E2dWlYOWZSbzVqVkFBaGRq?=
 =?utf-8?B?VHg0TWRlRmpFRTJNV3RQRW5vTE9TRnBOOFdEWnRpVFJGZnowOUNyTDFoQlRO?=
 =?utf-8?B?NjJRSjFrVnFUU2hQV0NrdktXcDNoSTRFbVR4ckRxYS9aTE1pZlBGZ1lBTVNZ?=
 =?utf-8?B?dW5mOWhDeUdadTZWVy8rbEZrcm9hdlFNQ0x5cjQxS2ViOXpMc0hHZzF2ajJi?=
 =?utf-8?B?K1AxS3ZFRCtUVjFjL1ZINm1Lb2YzeHRpbXRNVUxnSUc1Qld6ZWN6UFlDR3Rj?=
 =?utf-8?B?WmVvS01qeW5MYS9JWnNBeVJIczJWOEZkbGdSeWdiTXUyNFdOOXpvR3dWV0F3?=
 =?utf-8?B?MFBKVXh0OW03OVh1YUVVcmJob2NNejRHQkN1MGQwb1NZSWF0bVROVkgzQjlU?=
 =?utf-8?B?R2huRU5pMHhaZHEwSkRtUDJXdHUyN3ZXRDI3NS91aGQxU0hwZEhTbU0wZ3RI?=
 =?utf-8?B?ZlRoNFBvK21PdDlEMG0reDY3RXVWSWdmTTYxcE1XUVN6NnY2a05EUFFRNWha?=
 =?utf-8?B?eTljVGs1ZUkwYlpLcjBzRFIvTzM2ZlVic0FVeUZYa2dxbDgvSjZ4UGdhMGo5?=
 =?utf-8?B?N2pEeU5DSDBHeWx6UFExeGdzcSt0eklXMmJZVWVnRTZNakVFZGx5OVpMeTd5?=
 =?utf-8?B?MklCTjcrTU5pK0RHWWxyUjlRVVhpQk9UVVVZbVF5UVhKVFJCSnA1ZlY3NUYx?=
 =?utf-8?B?dEhwRjdxQkRMdkZ6aWNEUEdvMy85bG9HdTg2L3ZiNHd1L25XNWVWZ2tmcytH?=
 =?utf-8?B?RXkySnNYQkhJV0gvSFVTZ1VsZ0dQY0Y4WDFxS2xNSEJoWkw4OUxEazhqU21q?=
 =?utf-8?B?VDZzVGZsLzlSZzB3K2Y1U1A1d1hwRmpDczBhQjdENUl2Y2NpbXBMR0Y5c25n?=
 =?utf-8?B?RGMzaFVtL3diNGx6YUtmMVdZUzVsd0twazF6akpWeDR0R25sMjdmcC9YR0Nw?=
 =?utf-8?B?OUkrSFZLakdNSlhyWmZnTHhvL2d2WkE1TTdrbVFkcnNyUFJ1RjZ1VzZPeUJL?=
 =?utf-8?B?Ukc1QXVaSHo0MGZiTW14VE03UmhOQ0RHM09RVWcxMXFRRGVTSEs4TjFTWHBV?=
 =?utf-8?B?b2pOTE5GZjU4S0hnWmlmQWszRXJmVVc5a254V25mWjRiOEZITHQxdUhFUlNO?=
 =?utf-8?B?Tk9pVXJOU2tzRHNWdVRUK2g0Q3MrUWRKYlZMZ0E1VHQrOTM5RE9nMDMwSnFs?=
 =?utf-8?B?R09ZUWdWKzFkaW43dkg3MnJnNUtSemx3eGVMa0gvMVRZZHlWdDVXZW5veUNo?=
 =?utf-8?B?N1ZuM3c0bXBRaWpFZGxNN0dFMHpQQXVzZ2NSQmpCa1RTQkhxWVZiT1VHVXd5?=
 =?utf-8?B?anJoRS91MFhvWmlXTGJFa3l6TnFsZVdWd1k4bmE2RnE3U2xMTkZReG4yMmxU?=
 =?utf-8?B?SURXbDV4aVBMdllaa3ltWUJFU1RmV3ZaaXdYTXdHSVNCQWlvRHBBVHBJeERl?=
 =?utf-8?Q?V1DzpBzniPCTQST6ZkaUngzN9fIy4t2z+MKJ8Dx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3091b8-e052-4815-0702-08d935ac4c0b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 18:33:57.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSdpN6pWRaJCAU/Ikk01msq8VZnz3r5RFG9lqS/CikgKP/5HmEh7xg2vQb9/KW7s4/7YaA30bAMq3mKRofVEEPtJkfsxZaVGG+qmvuCwTLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3797
X-OriginatorOrg: citrix.com

On 22/06/2021 16:20, Jan Beulich wrote:
> libxc generally uses uint32_t to represent domain IDs. This is fine as
> long as addresses of such variables aren't taken, to then pass into
> hypercalls: To the hypervisor, a domain ID is a 16-bit value. Introduce
> a wrapper struct to deal with the issue. (On architectures with
> arguments passed in registers, an intermediate variable would have been
> created by the compiler already anyway, just one of the wrong type.)
>
> The public interface change is both source and binary compatible for
> the architectures we currently support.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Ian Jackson <iwj@xenproject.org>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> v2: Introduce wrapper struct in public interface.
> ---
> Together with the comment change I was half tempted to also rename the
> sub-function identifier to XENMEM_maximum_gfn. But I then decided this
> would go too far here.

We ought to fix it, but that could be a followup, or could be when this
interface disappears in ABIv2.

~Andrew


