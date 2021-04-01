Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7B33515B8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104572.200167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRybc-0006le-EP; Thu, 01 Apr 2021 14:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104572.200167; Thu, 01 Apr 2021 14:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRybc-0006lF-BC; Thu, 01 Apr 2021 14:47:32 +0000
Received: by outflank-mailman (input) for mailman id 104572;
 Thu, 01 Apr 2021 14:47:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRyba-0006l7-U6
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:47:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c26569a4-d98c-45c6-98cb-1e7ba1857eb4;
 Thu, 01 Apr 2021 14:47:29 +0000 (UTC)
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
X-Inumbo-ID: c26569a4-d98c-45c6-98cb-1e7ba1857eb4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617288449;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bTrgLIOdK867y1sJMrIi4ZWeW4jmhLnYojvITth1ttI=;
  b=ifdzTrYMohL4WBUqPnPokW1xdDj5DNs2b/OoQS1AZu7JETnalECi0hie
   KffjExDxQ0GRCA9MBFeHUpqzN/+jxya3p7MKWLqDdlUkUoRXvj8utQCsK
   Aa3mR9nmM62omvZ9ZMYuG5ibdzrteuPt55/K93EWesBVnRxA68/GKmNjb
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K5MO/ez6rLT1bri1vxUdscuqCOLn8iP0U2I/M5ELx5ImDbV59ijZD9lsRnAZy/MS2Z8KJiTsDY
 5iBu/E37T7VY1CZxeJe5VgRA2cLklCsGffQ++vbUzpHuUQ/o3tpzV6aS4MCwd9cX27wQufvroE
 o5AfjmjYbT4kFsyEE/rmVjWTPEHysjuYQxnxcAUnlbTVTZ1bBpYKvtoq8jQVLxA3KHctJjdUku
 i6VMogeX9Ay6jtpz2MmgsqS2mdd0bAdNBhw4lzmEeda2D/LeQ+MNxRTY+AL+jfxi+9MZcdEgVI
 Grs=
X-SBRS: 5.2
X-MesageID: 41084059
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YFw1iq1a9f/Zr+2Dvr1TRwqjBbByeYIsi2QD101hICF9WMqeis
 yogbAnxQb54QxhOk0ItNicNMC7LU/02oVy5eAqU4uKeCnDlC+WIJp57Y3kqgeQeBHW0uJGz6
 9vf+xfJbTLfD1HpP336gW5DNosqePvmMvD6Nv29Ht1SBEvVqcI1WdEIz2WD1FsQ01+DYc5fa
 DsgvZvnSaqengcc62AZ0UtYu6rnbL2vaOjXDpDLyRi0RKJgC+j9frEHwPw5GZ4bxp/hYoHtU
 D+1zf0/LmnrpiAu3nh/l6W0rATsOGk9sFOH4ilk9EPLCrhh0KTaINtV6bqhkFMnMifrGsP1P
 H35ys7M982wHbWdGO4rF/W1w7s3C1G0Q6Y9XaoxUbG5fbfeQh/Me59vOtiA2fkwntlgfVV6o
 4O+2qFvZtaACjhsU3GlqH1fiAvq26dm1ZnquIIk3lDOLFuEoN5nMgj2GtuPNM+EDnh6IYhed
 Mecf3h2A==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41084059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpQIobgfWkvCqnFmU/olJ2NRUfSGJxdEOgcbcPbAcKmY6kjpp6JzmhDIR2A/xWCyahghu+gZwG0dkviqNVmEe493XOKeLTG3FTQUkuICposiCg4d37GMzcPpB0QStDrZadm2XsEMqgAL7L1n5aeKIAKPPdV2r1OtvmyV4wRP5zf3byAlIpeJtfXHVHGXMwMt/mrRxhbhdXmWeI2aa8EThTkz2ovEC8tBI5zatkMjbKmwcdO670S6B8q99EiS4Nz+tIprdhcS6r8xRxALOSWHz5FQ5/1gtvJ0CEp3TLl3ikXEVlGaVqEjqdnbBw9J96eEW0yIZQTlcNzRooqxkZUheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+qothyvfianGc+oCmDzsXnEORNndPWHYlCGJwKnB6I=;
 b=bJY97WrTUlG37036KM4rirDx8ExYMLVJS1cEYpd4SAm8TAJ04xI4hQyozuJGUldhn+SGsvpRtaG+DaoD6W+MfAcQXR50HeRb8Wz5d6zEGL1eWWuNbjyoOGhUJcltvfbCunofT9l8rLutWNv3HvSGPAFEsL+9/3enW5Ozf1Z3/Z5bYmy4MWXGtCpwoRn0IdlTL7/495y/TlgdJsF2F3VrUb/F8zI0Mro4ojl9l1Aig2ijkmLvW/dTEPRF7xZlVR6DN3P7aVHktdLaRjANY8GKHbp8MZzAprohbNl/FiKtE1mfpwYUv7Emcl8TbJlK38ItbpED75dypYIhtwvgyf8Aeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+qothyvfianGc+oCmDzsXnEORNndPWHYlCGJwKnB6I=;
 b=Xw0cfTq2CKw2a16q43znuzdfY2CWfV5h2m8FWJc4fuAsUtKXcPrRTO+NsMGkhryQiXNdnHIpSavwVAvihC1UwofcF/0gqLHE73LLJKJq4+rUcXLH3GyUn7YmwqOwDqGc5qwRc0PZsDsANYvB3iUE2A+gNKXvL8WmomBD4Lw292Q=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-10-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 09/21] libs/guest: allow fetching a specific CPUID leaf
 from a cpu policy
Message-ID: <bb7b8cd2-97ae-09d9-61c8-1f84616256f5@citrix.com>
Date: Thu, 1 Apr 2021 15:47:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7566726c-8c43-4556-de52-08d8f51d1008
X-MS-TrafficTypeDiagnostic: BN7PR03MB4386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB43865445F069B538E05F9C15BA7B9@BN7PR03MB4386.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jlevTzxGPaXetsM0z/VNqz0QL6QB5m8jdMqhjKQ7FFZrKLLrF+/6YwN/ExKmKg04OODqtzqd0RuAaBrwmJ6fE/sFkgNawNGjuJzwZ2axK/tDdwj3k9XfhEOwV8Gho2hYyfzKZpPRPQFJsVcWR9NoDCc3ABEgepJCveiuyPfRDhqVTFzsfmqgiGjaSmRTFH264XzFted+gk7DvTrV5upPWa5Oiw2w98zkNSabz2mxml/o7GgIv/oThScUtlA4G69e2Qkug0z4bBlHYpTC8uRdv+gN75SY3dqVhkV7i3MNxFsmJswHNY9zbisLs57Lejla646fbxcxzZlk90EkuuIrC72sT717KmDu9ivHd7hV4yasJ1WksR/AJG4/CyWx+knMTfSgj/sGWNyKScXCwh/smzbICkoTTLe8UVoiCdwZYR3tWZwhUFRKrdlVPHuKtqDdLaFxHmdaMnPzZNkrbmJFVyjq9AZNYu5ZzMWEk7OrpWkB3lJ57w2gqSPAUhF/Fe5526AZCmFc3sLZEUn0B0RFa4mgC7nfzsCyMh9e9ZrKQ9uNaVpcTh/54k5mXfuQ2Evb4vTU8xj8jTQS97jN+YJLaXHPe+qOGdT/yeygkQCQf1NotT6zT7omtxOyS+xs3LafG/xP1tl4sT3tSAcD11kfCdATJSmyPkkGyslegTTW2iDxD0U0GQSB9Z/Zn1iis4LJFcFrlVxJtCZnCQ/s+VjdiIGZ6wJ4d3+t79oP6S+yXEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(38100700001)(54906003)(16576012)(36756003)(6486002)(8676002)(16526019)(186003)(2616005)(66946007)(956004)(2906002)(26005)(66476007)(8936002)(31686004)(498600001)(66556008)(4326008)(5660300002)(53546011)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VldUS21OdnNMdjNoaDZBOXlCdy9YMzY1YjJhOXpsNlFZdG9nZjN3TXhOVFAz?=
 =?utf-8?B?d0duZnp6MDFnVjhTTy82T05PNlBpWFVzMVJ5ZGplWG03UlFtQVE2Q0xtZEIr?=
 =?utf-8?B?bHRKMi80U0hXNGt1VFoyLzNpbURMTzRpeEV2WlFmWEtZNVhMSkFldW5ac2Zu?=
 =?utf-8?B?OXI2RGdqVHRIbGdOcXJLNmkzY1FYclJnU0U1RUEwTzBOdHRLNUJ3eklLYWhI?=
 =?utf-8?B?VXhiLzc1Q2taL0NacitRNVM0NE4zd09qS2R4M1BCaVkvTVBBbnNIM09xSDFy?=
 =?utf-8?B?OTd2bUNIWVlnUyt5bVcwdlBtSExad09rcnZzWjhoTFJZcUY3T3NKaFJkMHNs?=
 =?utf-8?B?VkJrR2d4b2N2NVlEUnYwVkQ3MkNXeDM1R2J1UDFGTU5JSzZtbW5JSnpVTmha?=
 =?utf-8?B?VnIwSUY5MGtyOTNsTVdlY3hvUmgxcEJsRmdZRXZuOG96VG4zbGRYTEpXMWJP?=
 =?utf-8?B?MUFKTy94SndxUUR2WHcrNVdIRTJ4VWxESmdJbHRaemdXbDdzT2s1OXdzRVpW?=
 =?utf-8?B?SXM2UnJpYTVjNlh0T1h4a1FOdFV1MVo1bVFSZTRjS3R3dk9jS3p3WFJVU2FP?=
 =?utf-8?B?dHlUVjUyMW44dE5aREg0TDRqTHFCY0NjdWh4MVdZRFlhRzhXeTFJRW0wK2d5?=
 =?utf-8?B?OHk3ZXovZWFPUFpHRi9aSjlmcjBTUjlocUxNTG5hckNUdUo3czNSdjRuaUl6?=
 =?utf-8?B?T0M1ZHIyVHRoa0VUTkd6YjhCSEdHdGN2c2oybnp1Vy94ZGFOa3dIRXRSU2hF?=
 =?utf-8?B?Z0U3N2wzUDNSdWhGRzg1SVRSdWF4ZXVHOFZEQ1BpRk9UNXYyRUlnUVFOZFhE?=
 =?utf-8?B?emYrYzBaK1kvaHVoZjRBR0xVL1NwQlZxdVhvUTBUS1pPc2Q1aE1JSlgwRHFP?=
 =?utf-8?B?NGtWZkZSM1hqbTJPVGpmWWE0TkxDakIyQmZFUlh1cmthME1reVMzMkhYMENY?=
 =?utf-8?B?TmlWL0tFTk5Lb3lFWnlBYjEwMTZaTEVrOTB6ZWQ2bXpvNzdhRmtvK1RVSGRJ?=
 =?utf-8?B?enJ1YUVNOFZTM2JtcVJ6bCs5VnBWUFV4UnpUUjRRc3Vlc0FBdzkxb2FIeEd1?=
 =?utf-8?B?b05RbTk4bUZsRW5VaDFQaHVHUEhUL2ZhelMvTGV6R0o1N2hNOTFnNXBIcXpu?=
 =?utf-8?B?akNKcGlxY3hJUUxlTnVIUTNDc2g4MXEveGtkd0hDSVBNMnFlSjRZcU5hOGpL?=
 =?utf-8?B?OE9XY1N5UjJzOVY3QnhoV015VVFub3VmSXZCTVh2TUhoYm1ieTl4ak01d1Zp?=
 =?utf-8?B?TXdWNkxldytnTEg3S2lxL2dxY1BUTkJtUVNnVGVtWTUrMDA0UzhVemx1RE1P?=
 =?utf-8?B?Uk5LVUpqV04rV2p2c29nMnBIQy8ycitiTEFONEIwRVNlbFRMSStWV2Jxd2Ft?=
 =?utf-8?B?MEZJd1hIRGVVTlVPWFJhWUZabDdzeUdZbGFVMnpvTHRmQzJndHlaU1lUWFpa?=
 =?utf-8?B?cEdMRmc4d2M3dUsvZFhVWTNBdW9EN0FQU2ZHSGZEc1ByTDFkakRnSGRmK3lT?=
 =?utf-8?B?WmNHdHhFZEthcjQ5alFrZlJ1bFpxcXB5WkZ1ZVlvb3lZT2tEdGNyTWpZajZD?=
 =?utf-8?B?ZmRPeVdDYzc3Wm10R3Vubm1hL3Fxb0ZpQWI2RktISXc1ZTRFQ1l1V1JTcUw0?=
 =?utf-8?B?RXNMa1VzekdyRTNENGthL1FuWDRWd1E4akNlcXRUdS9rZ3ZrbFZPbW1wVkxp?=
 =?utf-8?B?cExodDZoMktyUnp1SUUwdFI2blE0bTROczVwNTlCTXRuQUt6SndBam9kZXZ6?=
 =?utf-8?Q?6c7MeUpp7971+Ya69mc1QGivPCoFSw+NxeSsWUG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7566726c-8c43-4556-de52-08d8f51d1008
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:47:24.7656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4ubR7XIL4rlfPMrk+l4zl84Y2Iz7dvikiBZz0tSqhyyDKOoSIWRK0jwN2N3zMJF7Tt8TFAoJoHJrUJTrtzKKf0zGcg0AYpdPDhzNJS5JXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4386
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_=
x86.c
> index 48351f1c4c6..a1e1bf10d5c 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -883,3 +883,45 @@ int xc_cpu_policy_serialise(xc_interface *xch, const=
 xc_cpu_policy_t p,
>      errno =3D 0;
>      return 0;
>  }
> +
> +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t pol=
icy,
> +                            uint32_t leaf, uint32_t subleaf,
> +                            xen_cpuid_leaf_t *out)
> +{
> +    unsigned int nr_leaves, nr_msrs, i;
> +    xen_cpuid_leaf_t *leaves;
> +    int rc =3D xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> +
> +    if ( rc )
> +    {
> +        PERROR("Failed to obtain policy info size");
> +        return -1;
> +    }
> +
> +    leaves =3D calloc(nr_leaves, sizeof(*leaves));
> +    if ( !leaves )
> +    {
> +        PERROR("Failed to allocate resources");
> +        errno =3D ENOMEM;
> +        return -1;
> +    }
> +
> +    rc =3D xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves, NULL=
, 0);
> +    if ( rc )
> +        goto out;
> +
> +    for ( i =3D 0; i < nr_leaves; i++ )
> +        if ( leaves[i].leaf =3D=3D leaf && leaves[i].subleaf =3D=3D subl=
eaf )
> +        {
> +            *out =3D leaves[i];
> +            goto out;
> +        }

Please adapt find_leaf(), probably by dropping xc_xend_cpuid and passing
in leaf/subleaf parameters.

Serialised leaves are sorted and there are plenty of them, so a log
search is better.

How frequent is this call going to be for the same policy?=C2=A0 With the
arrays embedded in a policy, they're still around, and serialise is an
expensive operation.

I wonder if it makes sense to try and keep both forms in sync, so we can
avoid redundant calls like this?

~Andrew


