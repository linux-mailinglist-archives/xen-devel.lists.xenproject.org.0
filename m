Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED773BC2AA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 20:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150604.278440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0TMF-0005El-0c; Mon, 05 Jul 2021 18:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150604.278440; Mon, 05 Jul 2021 18:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0TME-0005By-Td; Mon, 05 Jul 2021 18:30:14 +0000
Received: by outflank-mailman (input) for mailman id 150604;
 Mon, 05 Jul 2021 18:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0TMD-0005Bs-Qd
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 18:30:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6379040d-04ec-4ddc-9679-cbda562abf9b;
 Mon, 05 Jul 2021 18:30:12 +0000 (UTC)
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
X-Inumbo-ID: 6379040d-04ec-4ddc-9679-cbda562abf9b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625509812;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SNRljlSzz5o0A/b4RbsPTwoYjOO1FVIs86J6blI1ZM4=;
  b=KX2EtjpqPp9ewxmS6OZIbjs8j+ELvn+vifTfXNTa/q1xiALqOght5jPr
   U+9Ek5XSbkGLy+jtgY+njx5gzxM/+u0qoKosY1jZqvEWuC/HWwoL2vbEP
   DeJ3wDIV8P5LKX2pGSYnNoLGaml5vJHkR+R2/H+Npso66n+ucJS8LpPRa
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iuxNDfQKVXqHBa+css/9udJYtyeGX/ifvc7FYVlr6CHl+lhBJGjElsZxMAgvHusV5VU8rNv4jI
 6rxsCs7XeF+8wSL/9PfIRhryrmG/OX+TIGLaNhFokSRXkw0BwX+X5Am3FeVJjP0JrFML+wTPR4
 DJjJSUDH4LQHKjv9NOzht7Y3PuFVsoFeemrstQ/JN/6/dWjS73wpQI4jfxG3FZmYuH/SUcrdrA
 Y0QE2lw9xnPEmIx5AGyQmXb7qoDVcGlbAqnHdva0gxyg6JLGHEssytysC7natigPUm9txW+9Ge
 aXE=
X-SBRS: 5.1
X-MesageID: 47588171
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EfuAv6kh6NKp6BCXlY028cJcVWvpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="47588171"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap79JJc/3sL2XM7jk/lsuHXvOZfuE/OqrAVDcglox4RXTsLRCA0ZeOkeem0OVQuxn19irgA8EFESKaQ2oMhJT/ZvmFKF6NAgvNeHRStdfX1wYSHaU99uF/c7oJkUNf9gaI1wlnoaVMZGNhptZeGLh1jhSd+5FW4C2CWNjLFuM4dv0zdcDkP1ONKpY5guMPD2SS1s+ZkTaRY4KBHt6KoLCb/Wtm8Yn8NiEMQG5YhH0Yw0ORvSvBYGx3posaAra005oQzGAbr+qPoCPc/EuapEphRpf45oShMM7XbRuPGXutheq0rZZOVhj9kJPwkZ4oTjEVkb1STSEN7F2YFKdO/W3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNRljlSzz5o0A/b4RbsPTwoYjOO1FVIs86J6blI1ZM4=;
 b=biTbCgIbnBMkfNKWvoKB+8GjBXDqv57mC8oH4EmIxxsmCCk0uszWqdNeis58LvK42HgE76M5mZe1RhXtEerr41eHBbg4RDjUKrwYyuBJxa37gONyFcjURvBh2/sjRBVdi0MIsWsvhUnC+jPAvfmJDX6OUFVVCzAA3SR5nNgDsJD65TQJQai7R1ifSAJI6mfDYmRZMQ6w/DTILD8/zEe6diOL+EnKs5ndPTUG29VOnJa7gvMjCwSRFSgKgcWDKy79Mtb7aFXUsuwOf7m+EmDSVdYoSmjv0+jX1ANkVW5gwO6h6I8UncuUodkg8gWBQ4+P3+flf39c3npgjWJqR1UxQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNRljlSzz5o0A/b4RbsPTwoYjOO1FVIs86J6blI1ZM4=;
 b=lqmZzIKSKD9PAUaO7pLUGO4OSrd2jb6MOguP0b8OpbvGq69wNrkPZ9gOONqn1ijP6v9qMsAt2J9pwCzciqI0FWRld2zk3p3DFVhK4oYTJUXM5DkHHx9I06E5l4nNkXrWfqaEBKAUGQdSofRRGfc7NuGe7BXfJ1s6OCEuXGDYPUQ=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20210705165633.26077-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] tools: unify page type checking in save/restore
Message-ID: <c09678ec-a9e8-1d80-e254-96a41b4b1c98@citrix.com>
Date: Mon, 5 Jul 2021 19:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705165633.26077-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7cb2c07-22d9-482c-35cc-08d93fe2e88d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5249:
X-Microsoft-Antispam-PRVS: <BY5PR03MB52496EF23069E9502A979748BA1C9@BY5PR03MB5249.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ns/zUaSC5dAvHXkGY1qgJmztFcgQLAJvoeuwKN8cjNwSW/zCzMpzl/XgxqY4PmSBL9BXkHYl3pBzfHTK1aswcoUruX9gQWYBJ/Zl+Q4Cpf5Vr0TN5oLUgPWEx+5FRXOTOJby3g5bLxS78N8HL9gfXlBQG+nh/ktL1UytIysdFmFKINFShRitYYJGvM4DcbhISI5yLnAhtpN2J0WhpKNCuo7OpTNOaIcrEuzWPmYIo4XdgL0qC5xtZbaSwwig9pObeG5TlUAZUf3QoC4+302F0K01sps5ANVyx9U8UxhP6R1jVktS9qdB0grYPjBUW3P3lkZPckaZLvg1oVrAVfEKFUg47OmD2Si2lrkjzmoEIDliz0/lo8tQHXlUiil9nSYXhVfEU3EDxOYCpm5x7s2uXNfY00V+qtnwuzHVxF3Uz44dA+XOcXqXdvtdO+10WRBTnneqvxo6wsjIe80S/NgEhi5kyxTr+1fwvLZHalX3GnsQ8RS1k5DiEvkw1i+jgFYqJmSP9Jgg1rQhTWe3b8MYOXFQiSCzHuDg0COefHDtfJVjx0lOkX9X+jePqQLCL9LhXuJbZwI2EkCAYXr++hjJJ0bNafyPCsBomkI8DKJqgHVe5C+Ykdw/fN9neu/ZYByfaL4lK5ItbmCSVKHsNaRC4OhvGPy/lG94kUD0DGWFZMh0OrnibyDmrS7AWfJr8Gj9kLvBSSM567J6opn1mn1CB66l4xPTOqBdyTIRGesBtRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(8936002)(83380400001)(8676002)(956004)(2616005)(6486002)(86362001)(31696002)(5660300002)(38100700002)(316002)(2906002)(54906003)(16576012)(53546011)(66556008)(6666004)(26005)(4326008)(478600001)(66946007)(186003)(66476007)(31686004)(36756003)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkk5UkZsV3ZIQnBTZkpENStBaXFGYWUrTUZid3RicWlod3lTVjZWWWY4b1RJ?=
 =?utf-8?B?T29PNTlRZ2tIOGRaMXpmYmsraDFrZDQwUGR4cVVyT3NuK1F0Vy9WdTF3NUtu?=
 =?utf-8?B?cjdrQk9QVnpsTWpQZTdJcjkvQXZ4bFdYejJ2Tk1Vb1o2aldFdldkZXhDcE9R?=
 =?utf-8?B?M3Z3cEJTdHBrS3dzWFF0VGYrdFZRSUc5WGFGME56N2ZHbFRLNGtGSGVTL0xO?=
 =?utf-8?B?NlJkdFBpRUlqekpxei90QitlT2V3S1NJTS9HcVFoL2d0dTVlODdHcll0akR4?=
 =?utf-8?B?bUlhNEw1cUJERU90QzY1aC9DUW1VRTFIZEVadnNRK05WREtlRkgrTHRSLy9F?=
 =?utf-8?B?YUFITE96Rkl3TmZHR1BtNGtWZFVYamxic3BZL0prV1k0MmtHN0szYnpMWGtM?=
 =?utf-8?B?dlFWcUNaMFlKdGhsL0NTaldEUExRWXFEdDlJWGxLUGx5RVByS2hETkhURGxH?=
 =?utf-8?B?N2E2R2tqVmg5ancrMENLSWRBM0dZZDlqeTRQcTNCbUF4TVNSNTJsWWJCSzFQ?=
 =?utf-8?B?MkMyVm93djJ4cUd1L3g1c1B1MWtaM2YrMEZGSmN2NDVlN2djUlpMTXl6MG9u?=
 =?utf-8?B?WDh4bHpuL2U3dThlNDVlVjNBYkIwOGFiOGovVENjSElwdWNzNWNHb2QyemVi?=
 =?utf-8?B?Q0Y2MnBya3FCLzV3bUp4Q2ordTV0YndYMitLZUtxLy9iMEdYbDZCNjdRQi9s?=
 =?utf-8?B?VlpvRklTcGRRakV5S2t1RG42QldMMTFYMTI1cmc1aEdSVkV4N0oxT01OaGhF?=
 =?utf-8?B?a0NzOFhKNWVIRWtHcmp3eFUwV053SnJYYW1pdXlJMVphbmxHNnJ2SWZwa3ZV?=
 =?utf-8?B?MnkvZzh4RHNMZ0xiZzdydTdTYXR3dERZZmNhdkd5aWZsOFVWQTJwQW9DR1Zk?=
 =?utf-8?B?ZUU2bE4vbFljYjZDN0xBcFFuK2taYWVia0JzWUh6OGFxSVgydzhXNm54NkdS?=
 =?utf-8?B?VUh5MWlza1h1ek8wWUJLdXhHT0l5UmVsbC9ReVJTbG4zakliZVkxaGVZaW5K?=
 =?utf-8?B?UWUwOExoWmFvYmpDU2J1OGxTNklMZWY1SXozVk5taUcybjBsbUZUeXhCZVdF?=
 =?utf-8?B?d29vOGRaZWMxYktlbTdYV2FZTW1NemV5aExaSmwzU0VXZVU1Z0JuR0Zrcjcv?=
 =?utf-8?B?WEJoblVQMkJ6bk80VnJpTE1xY2FiTDNzd0NpUE54K0RLR2k0TlJNU0pkYlA5?=
 =?utf-8?B?UGlOdTV3T1Ayc2p0MTJqT3o3TTNudjhDOGkwWUw0WXZJRndsY3RhdmI0eTQ2?=
 =?utf-8?B?cTZUbDNZeFROc25KeWtON0djaGtRYmorSzdZcWI0cUoyVlhZbzI3OUNVS2VK?=
 =?utf-8?B?TUhWQVJvbzduMHYwN0o3ZngycmpWa3hzTTlMcmxLS1dhNUlhWHRja2NyOVla?=
 =?utf-8?B?SHQ2cmxFK2E1MEFhVUxXaGlHS3ZMbVZLTVdkY21sWUxTN3hNbFBZUFlPNlIr?=
 =?utf-8?B?akVVU3A0eCs1bXJrTEczVXVndXZPd2JFN05PcEJNR1lCVTV0end1KzNZWm43?=
 =?utf-8?B?Qkhma1dlZGlqQytYSSs3eHpqVEVQK1NSazNseTJFcjBCNmJFWHYrM3loamc1?=
 =?utf-8?B?azQ3Tm1xNEN1NmE5UjlEaGRBUkpSSHFnWkhlbmc0aUM1QnQwZU9pbUFxZ3Zt?=
 =?utf-8?B?S1J0NUlHUHQxRFpEckRYWW5SN0diSDlDYXE2RUIvZkpmSlQwclFJSXhla3BR?=
 =?utf-8?B?QnNWaWRuc0FCUnFZdUwrTGx6RzNFSlNkM2lNRFl2aFQzckZVcjdONnJOakxn?=
 =?utf-8?Q?kZbiwE7/j1MkLYJW+EJkjADhjyKOUS3vbZSuEcc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cb2c07-22d9-482c-35cc-08d93fe2e88d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 18:30:04.8012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D58jbSRQfSkM6r3g9LSA+AXBq+rFiGNNyKn5Qz92MExNqNekTj6MFTsVCPkxEtZYjNjCzl3Eh+8eTq30GXlO1CAmuu7wAaYdEPp1ocnuQ1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5249
X-OriginatorOrg: citrix.com

On 05/07/2021 17:56, Olaf Hering wrote:
> Users of xc_get_pfn_type_batch may want to sanity check the data
> returned by Xen. Add helpers for this purpose:
>
> is_known_page_type verifies the type returned by Xen on the saving
> side, or the incoming type for a page on the restoring side, is known
> by the save/restore code.
>
> page_type_to_populate decides if a page with the given known type
> needs to be populated on the restoring side.
>
> page_type_has_stream_data decides if a page with the given known type
> needs to be send, or if the stream on the restoring side contains a
> data page.
>
> While touching the code, simplify the logic check in populate_pfns.
>
> No change in behavior intended.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>
> v03:
> - fold all three helpers into a single patch

Sorry - I didn't mean fold all 4 patches together.=C2=A0 I meant fold
specifically the first two patches together, so the new helper and its
users are in the same patch, as you'd done for the final two patches.

I've still them unmerged in my branch.=C2=A0 I'll fold in a few tweaks from
here and commit them as 3 patches.

~Andrew


