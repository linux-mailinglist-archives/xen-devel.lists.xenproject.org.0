Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E483ACE40
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144742.266371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG3e-0003CN-HW; Fri, 18 Jun 2021 15:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144742.266371; Fri, 18 Jun 2021 15:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG3e-0003AY-EP; Fri, 18 Jun 2021 15:05:22 +0000
Received: by outflank-mailman (input) for mailman id 144742;
 Fri, 18 Jun 2021 15:05:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luG3d-0003AO-Bg
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:05:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 338245cc-a8a0-4467-8a96-979c10d41936;
 Fri, 18 Jun 2021 15:05:20 +0000 (UTC)
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
X-Inumbo-ID: 338245cc-a8a0-4467-8a96-979c10d41936
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624028720;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KLJmfR8do5vTkflz9Ft7WCK9vvsmW6S1RPOOkiEzXJ0=;
  b=THiIKvBi8aPcLOH+7fhW1UkLoDgMW9krpttLj4kMZ08L2EzW5BOy8Ss3
   viPMdQYN8iwV0Bj9ak9gsFLGp3mj3C9ox2d+ebtLQSlJ8mW0SUqQdN75H
   oiTDUDM8Aa0JYBGYrHwf4SqcagWOopnRxar4JGo9F/h9zMgtgT1TQjSI8
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RpjsP+j61I9W94Ea/15K25cc/RsRilGUnpYrONBTDqrR1nM9vfFAqcKRPJVNqALAJhu6x5EgWR
 yEkFPDxgH7fG050xMjt5xORvmmK+UqXSE1y4G0YcSLrUgwalePPtMozHhSUMny+LdVz2gExRNo
 zVrCS3ed09mvZu7LyCcJZT0R/icS1s2IcRP1WRnQ2JxU/9PaKM2hxT7dXRzUNGtvMW7rTMAoAc
 FHGlSIn6CJlmYsAWUOubGaDhMxSFuVkv0vG+OvQapP1Xb2r639klfjZsfAmYiWLgDyZ6HuuybT
 +Ms=
X-SBRS: 5.1
X-MesageID: 46469213
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iT97XavLAIBTcfL2Ypm0hmqH7skDS9V00zEX/kB9WHVpm6yj/f
 xG785rrSMc7wxhI03I+OrwX5VoJEmwyXcb2/hyAV7PZmjbUQiTXeVfBOnZsljd8kTFn4Y3us
 ldmsNFeb7N5C1B/L/HCWeDc+rIuOP3lpxAWt2z80tQ
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46469213"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frNp4RJglU7NZyCmDo2/6p7wV1KmVn3+/1e2fLFHDT9tAhtkreRyPimWrk0EyF2c7rZGvSinZi9b5LmOAg+k5o0pwnO7iBjLp9jMswqSKWuFDC2Qw2faRKMkIMr2eTDyUbDrcm1nqeIdTDTehviGTr5ryUIx9jMvCVL5BHVgi5aQT18dBsCC1b2xKJt7ptKRvtuY/68V5LNmO6gwzvfF2ozrHIMMEEKwHosv5/n+IGmGr0NqKdoeSYasz3HS1O8DS/sjbjoYtzxG/nQdjafjJe2ZYacEa/gdQlt9hxtMbSLyoCaQxaL/clwEMy0EbhVZtwOyhZJ+ALGs6sbN/1ADFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDjMWsaj6Rl70hTYyswO6JVzleQNxKz4HMeMONl6Ui0=;
 b=La1KwRCHkkei5z6elRlEI4BrTpiHivrsf4kBzIG9KaiC9XXJGk/4oeNS2YICu/wzxXXWQctPQJL+GaniVSTC17T0frvWxNRTKxJL9D476TnRWicYnAY+6cSrzfiDpwbkq/QIVx5AJDWwIU2GN4GnnE8hiFqXhZIMMiTxRQxD2WDyFb1nPDsRyJSgfiOjrXC4XuKU5058laeQktiO+OagzYtksjPN+IXE73M2dQC/0pYzlAZ7ZnmDBbW29OJOjMT4vHUixMP9pDNLPRGJb7i0bz8D7C9NLIDubvz5ob5PdnxceSZSwSB9V0qk4Ykd1oqSzNRgDgQZx6FACPApOp56dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDjMWsaj6Rl70hTYyswO6JVzleQNxKz4HMeMONl6Ui0=;
 b=LMZLalSO4merkOp/KVjUX1SO8wLkjrd8iBLnZfgFcUBww8nHW0aT3O5sk1D73HJvD1r7aRIL0liE12I7ODAeLXbCWkDmh6AmUXCFfExUa8KBxAbAnVNq0Bz1kAUJpveuLr2MgyToRoD3M+abWnVcQ+b4I27mp8hTr830QgJJ/qo=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <8a5284e3-a029-27c8-103c-cbc12642d24d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] libxc: use multicall for memory-op on Linux (and
 Solaris)
Message-ID: <db8662c7-9641-6fb2-54e9-c0e64e03b990@citrix.com>
Date: Fri, 18 Jun 2021 16:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8a5284e3-a029-27c8-103c-cbc12642d24d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0359.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa5c52c4-20bc-43e8-92ee-08d9326a777c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4117:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB41171C2C41C158D138F25211BA0D9@BYAPR03MB4117.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oC2NotAPihnZpZuFEZF8uy05S67pU56xmINkjoilY9ZPlXByuMItpSoHZnj08bMrFIG0TS/5L/+HpeL2aoEPrvBRv8gw8ZIJJ9QtrSHrYmeYgLYER2L5vhfzn2CgHQnRJdSni2FRqsbPrzxHKi4pTGKjWc0RDl+hg9ybcXmJodO98IjfkJj8ACBKpDcde4Z1GL0ThB0iustywBfgDDIhNPsWZ9T3e1XCJaNAaRa5b+bR0ZsfdL5/+Cst0u8Xl92NjRRjfvBRXOCq8cvJ6nQDq/WMwDIxW3wTLVgnF+hiKzjEptY0EpksgAKme9TJOM837O0uTtx6cGsWV22KoMmke0cRVy0N3sqEz9WJ3hBWLixVj6pJL4E55L66mu/Sr355aRsxkHY8fXRWlZ5gOWZ4y7aWI7tWqx3qmQCf7+PTRwTtZG0eUD50eCE9L+F1H4NStGxNli95/9ofh7+zvDCzWp08SeP50tp2f9epDF0E+Dm86PhxkdWvITMcBMcMAheGYNH0sMePWaih5ZaVSU0jYKN2yFJubmXAjYpYgW5s9P33Jcd4u1Q0gFPahb+QkHhpOeC8UBWF01hBkq1bOU3TGUYgIW617aPtGf0a+UutPbbuCsKDL1qymoSl0sn5hl+MtxGSthZ8u7Dh0ZOe1mmlLaehL8Lrz+J50Ctyx0rFjFv+T8s4wToIz9zgMg0J6ZH6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(956004)(36756003)(16576012)(6666004)(110136005)(316002)(54906003)(31686004)(53546011)(6486002)(2616005)(5660300002)(66556008)(66476007)(66946007)(8936002)(4326008)(8676002)(31696002)(2906002)(83380400001)(86362001)(66574015)(478600001)(26005)(186003)(16526019)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzBlN2ZESEkwUXR1UWpIK2dpTytxakp1R2k4ZWpWVHp0eXVBR3g1TGtwMU12?=
 =?utf-8?B?U1dMM25BaW81OXdBVGFjMjRZeEFIR1dTTG52T0lvcTJPSHRPMVdOYU51UzB4?=
 =?utf-8?B?YlVZd0RPOWtpazY0VDk0N2hMTzBaR1NMdjVoc0VhYlNBanBub3JLVEZmV0c3?=
 =?utf-8?B?YVB3ZFNTSHJwQlBpVWQrdmtUSEJ0bUZMWXdIdVRDVGNBZFNjQTdPMkF2QmxE?=
 =?utf-8?B?aGFIMmxacEhvMkFXekNON3o1NytyclVSK09NdDdlS0t0N0YwZHZCNXc5WjdM?=
 =?utf-8?B?bkJlVUUzSVdwSjFQUGpudkZoYjRqdFRnbnYySmNQNWVjWTZWSko0VDB4S29s?=
 =?utf-8?B?akI5NGhlYnNCeElyU1F1a3RFSnJrTERLQ1BQS3JUYmxQQlRKZWMwN2E3NHp1?=
 =?utf-8?B?QWZsZUhFWndhTnhDUy9QRUZLK1pzT09SRDhNUkE1bGxZVTVtSEJrc2dsbVV0?=
 =?utf-8?B?ZFVabTYzYlRmTXcvaUZCai80Ti9jOFYwUGFZNDRxQW52K3JpY3ZIQnhHWCtn?=
 =?utf-8?B?MkJQZ0U5TU5ZMHE1cWt3eG8rVnk3ZzB5YVFuV1dlQlJnK3N0MTVsUklLeEdz?=
 =?utf-8?B?WTkvL1RJaVZpN24zU0k0SCtyUEtjRGpHWFNHNGVhbmFHZDM5TEdxN0VUYmg0?=
 =?utf-8?B?U2M5aU44K0pNaUIwSEoyYzd4czRqRWgwQUNtOUhKbXR0ZlVFZHFHeGFaT3hG?=
 =?utf-8?B?NDUxaXhYQ0lLeUcvRSsvSjRSeG5pQW5UM3BVTE5SNnRrb05oa1RranBhKzVW?=
 =?utf-8?B?TlA4Smt5TTJtWUJ3T3djQXozbysyeHhmWXNXN25zbVB2QzNGZlA3Wjd2U2Z2?=
 =?utf-8?B?YVRIMEF3SU1rYmpYTzdZbDYvcS8xa1N6a2pzM0NwcnNVaE9xbFJkZlVhUGt3?=
 =?utf-8?B?ZFd2WGlmUW9hNnNCRHd5dTcyNm9WVUE4SGt2aVBVVjBKa3dYRUIrMWxTdE5Q?=
 =?utf-8?B?dU5ib2ZRZjJJZHdBZTlzNDlYc09KZlJoU3ovUllUREVnNWV0cXUyMjE1czQy?=
 =?utf-8?B?V2dwaGJtNno0bHJnQXhjcHExQ05qRG85M1dqK2w3bGhNaGdFbnNtLzJHWmh0?=
 =?utf-8?B?NjFnRm1qbGNmcldyNjhZNE4zOVRONFJVT3A2ajYxT0dwRGVGSWVtUEhWeHpI?=
 =?utf-8?B?Q3ZrVkw1bjVpL1VqR2w3ZGY2Yis2TjgwT3NlYlZzbWYwN2lrc2Z1Wi9PblVo?=
 =?utf-8?B?UkFkZGYwNTRyaTFmMTlieHlvVTFyOW83Z1NLNkF3VjE5WVVPWUM5dEE5Nk81?=
 =?utf-8?B?U2oxdnFycHVlTlM1dFVucGx0bVpNVWJMb3hzR0Q4b3h0YTY0VlFxMWlTRmE4?=
 =?utf-8?B?Z3BXTXU3WTNDWDE0Q2FEY3ZlZnU3YlVja21YNHZmY2pWa3FvSWtXL0ZnZGRa?=
 =?utf-8?B?ci96UHJHVnMyOHEzd0pQWkRxalBpdGRWclRJNFZTSXFOZzB3OVFsV2lxNkdH?=
 =?utf-8?B?MU5rdzZjUW4zK0Eya3JLUUJIekNqUjlselFXRGJyRlIwTzNFWW5uT2VYL05u?=
 =?utf-8?B?RTZCemtTcnltM1lTOE9zb0ZwZnd4aWl3dHpXQXRVWXBzbkZsbnhYd0FpTEh1?=
 =?utf-8?B?MjRNaW0vZmxwbjczM05Db3NVa2kzVkdHVGhOZEdINkdid3NFdkhRQkVZd2dC?=
 =?utf-8?B?dWZGTC85S2NiaTZYdTNEaUxGZm13UEJ4bGNWbVI2YjdvRWRlV3ljNXFyMzZN?=
 =?utf-8?B?Wm1vZFlZZU5hb2YxdlVqUDFEcmtiUk5HR2lENzI2cTRlUDA5T3MxMi9MSDlF?=
 =?utf-8?Q?CwewiCrpF9TD9q8j+v8+vO+sdWepWL7+s8B0HeY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5c52c4-20bc-43e8-92ee-08d9326a777c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:05:10.4869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfHwT8ebIu23BDrByD/MI3wk5bhRd73KLSEyIuRxk9M79oy44VAHhadNoSVwLJWpJPI/MAq60JBVOJ+HWh0H981fItoI7w4AqedMNRYcNEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4117
X-OriginatorOrg: citrix.com

On 18/06/2021 11:24, Jan Beulich wrote:
> Some sub-functions, XENMEM_maximum_gpfn in particular, can return values
> requiring more than 31 bits to represent. Hence we cannot issue the
> hypercall directly when the return value of ioctl() is used to propagate
> this value (note that this is not the case for the BSDs, and MiniOS
> already wraps all hypercalls in a multicall).
>
> Suggested-by: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tools/libs/ctrl/xc_private.c
> +++ b/tools/libs/ctrl/xc_private.c
> @@ -337,8 +337,47 @@ long do_memory_op(xc_interface *xch, int
>          goto out1;
>      }
> =20
> -    ret =3D xencall2(xch->xcall, __HYPERVISOR_memory_op,
> -                   cmd, HYPERCALL_BUFFER_AS_ARG(arg));
> +#if defined(__linux__) || defined(__sun__)
> +    /*
> +     * Some sub-ops return values which don't fit in "int". On platforms
> +     * without a specific hypercall return value field in the privcmd
> +     * interface structure, issue the request as a single-element multic=
all,
> +     * to be able to capture the full return value.
> +     */
> +    if ( sizeof(long) > sizeof(int) )

This is very fragile.=C2=A0 I spent a while coming up with

=C2=A0=C2=A0=C2=A0 __builtin_types_compatible_p(
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typeof(ioctl) *,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long (*)(int, unsigned long, ...=
));

(which does work if you change int for long), just to realise that this
won't actually help.=C2=A0 I'm suck on trying to see whether
privcmd_hypercall_t has a result member.

> +    {
> +        multicall_entry_t multicall =3D {
> +            .op =3D __HYPERVISOR_memory_op,
> +            .args[0] =3D cmd,
> +            .args[1] =3D HYPERCALL_BUFFER_AS_ARG(arg),
> +        }, *call =3D &multicall;
> +        DECLARE_HYPERCALL_BOUNCE(call, sizeof(*call),
> +                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> +
> +        if ( xc_hypercall_bounce_pre(xch, call) )
> +        {
> +            PERROR("Could not bounce buffer for memory_op hypercall");
> +            goto out1;
> +        }
> +
> +        ret =3D do_multicall_op(xch, HYPERCALL_BUFFER(call), 1);
> +
> +        xc_hypercall_bounce_post(xch, call);
> +
> +        if ( !ret )
> +        {
> +            ret =3D multicall.result;
> +            if ( multicall.result > ~0xfffUL )

Wouldn't this be clearer as > -4095 ?

~Andrew

> +            {
> +                errno =3D -ret;
> +                ret =3D -1;
> +            }
> +        }
> +    }
> +    else
> +#endif
> +        ret =3D xencall2L(xch->xcall, __HYPERVISOR_memory_op,
> +                        cmd, HYPERCALL_BUFFER_AS_ARG(arg));
> =20
>      xc_hypercall_bounce_post(xch, arg);
>   out1:
>
>



