Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECA3ACCAB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144664.266240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEpm-0005k5-D0; Fri, 18 Jun 2021 13:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144664.266240; Fri, 18 Jun 2021 13:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEpm-0005hX-9R; Fri, 18 Jun 2021 13:46:58 +0000
Received: by outflank-mailman (input) for mailman id 144664;
 Fri, 18 Jun 2021 13:46:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luEpl-0005hR-CE
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:46:57 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3d132b3-1585-49c4-810d-7765698482cc;
 Fri, 18 Jun 2021 13:46:56 +0000 (UTC)
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
X-Inumbo-ID: b3d132b3-1585-49c4-810d-7765698482cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624024015;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+H0QPI8UXFeGtzRvZHyjPomcsgEF8e+Y1bIOv/9++U0=;
  b=PUDpPGM1GuNMrO229f4RyAl4d8hoLf9FLspJ1F6ZZhGO4RVRHvuuGjc9
   zB/1AtDDqHCpOKQA/to03AOm1dORUsspWfXg3ZJfOzLXu10UFrkgpMVY/
   vDcsx83FfDR31kkPApYr8NA20k8IzlBt7ibqdZG9l7zwucFGedI8VDFzb
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zjYhc3/OKy9xSIK8rYMZ5Ce4pdO58Bf0e+6YDECEImotp/fEDQPvfxbKzYX8u/gWl1AYv74Hnc
 NgSQvblth5dVg1bknacRvmkCCZHhl/1GoR26dqiU3CSMU5bzq3VDRr9FaAvYlfJ7Veh4T/wqRt
 T46qQ1WOBcfIFYFXnFvEEqYznk2SRvxPFlIEMa1+iPxNRQtgxL4YRSE3+8Yukpn+SEO0WCk6eJ
 6l9ax85g6RCelxRv/fQBdD9dDzZ2dn/cFCaQadtREfxpM7fcK3T+QEQTWfkqyqJmXJgxsGXJoZ
 jNg=
X-SBRS: 5.1
X-MesageID: 46447123
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5KRhuazuORAjE/U5UkRkKrPxGOskLtp133Aq2lEZdPWaSL37qy
 nIpoVT6faUskdmZJhEo7q90ca7MBbhHPJOgbX5HI3SOjUO/VHIEGgA1/qH/9SfIVyKygc178
 4JGMUTZ7PN5BpB/L7HCMzSKadG/DDtytHhuQ6x9QYPcShaL4xh9Q19AgaeHkAefng6ObMJUL
 q2wo5umH6MVUk6RPmaIF5tZZmym/T70LLMRVovOFoZxDK1rRWOgYSKYCSw71M/eBcK+64r9U
 zCnhD96r/mifu80RPHvlWjkah+qZ/A4f8GPtWFjuwSJynohhztW4h7Qb2FuypdmpDf1H8a1P
 zohDE9Is9093TdF1vF2ycFozOQqwrGkEWSsGOwsD/busr+Sys9C81dwaxkUjax0TtWgPhMlJ
 tR2WSXrpxWCg6Fuh/cyZznazFG/3DE1UbLq4Qo/jZiuE8lGfRsRdp1xjIoLL4QWCjw6I1PKp
 gQMOjMoPxcaFuAY3fFvmQH+q3fYkgO
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46447123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cM6NlDQilVAeu/Y/fOO2/dv4mDYq6xbfvCfCeEmqY2oINv0p16tsMxMtRaRCxejuJ+JIMnUx1JRl8QvoCnHfo/LerbOTN69fXcvgQGvkuTrp/+9MThPlXV0Tu3hSmxCcgo2/2+3q8ct6Ig43i8JJfi13hkFj1wv3TkHQb+/zgnTRxs+wgVBSyc0AA+7Ek4w9UHek7nldUrA2IEihUlztSRK++ARTwq8KDmRrsGkbbSdDhLdmsiJkyr4fKSRcLlkM8OtePVV6zVVAjlUa2XmMuwmxySZnkmLmcKaz3bhQ32A2cG/docfgrJKhY6sWTuMuCpSFrN9BOSx+PeMVgCyw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFP/azzJ8RUG6I3mvukqgsz9SL0FK3W1+CM0M5NPNNs=;
 b=BNGG0/CN7bSD4G+Lkba6ccjqqBaMGkUUTlgBJp7dOqIFc2sXPxKUAvA+B/KBqDPAlB56R23Mn/G0aaabAYjGfZA3L8kYC97Gd1cOcRUoAufEoyDj6+eVdm3sZhHb6uAKZwDOKLYVkBWT9Ncu1/MYwanctYKYHvqBrloqudQJYsytpJLG8FBrakW2EBj+1l/BjjwYE4v26AkCMqIkr+MzDLbdVgI8LsqapkZcL65CCkIYjDVq/V7y3E/16OSrfuMIEz5/UsmktnTZxG1t7DTnXNPjA81KdVMnxUgiZPJ7z53tzn2VHuCRDaYswMtVW9xK9FdeOSkIAKuXEpMu6V6pGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFP/azzJ8RUG6I3mvukqgsz9SL0FK3W1+CM0M5NPNNs=;
 b=Td8uiChq1ZgWa+pQNfLK2iEN6mImpuMC7UyKIkxx8L7za5uLgexDOECnQ3yARXYgqN89ySGVH5+qlDSmjZI2lIGnk3rsj9lwXjlUJbxcsNDcysFg+wfV66WBK070WjwJbK6oDW1yVxz2tGzKeMd1juKWsqgJOxCe5vDXA8/h030=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] libxencall: introduce variant of xencall2() returning
 long
Message-ID: <0804f068-c016-0099-cebb-dbb8b7f1b794@citrix.com>
Date: Fri, 18 Jun 2021 14:46:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2b58b02-067a-4c3b-2279-08d9325f86c9
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5533046315C992E02F2CD1BCBA0D9@SJ0PR03MB5533.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/AVK/t6uMepIgE5Jgfaj7LmZiRqkE/cAMC6vYpmy68g0im+0Lf9Jz7Uc1UOlIXaIYVlMxM50CgKoTHdBXWDj8PZ2DLt7Ym2udR+J3tihADMtNYJbNn8A0lpZY+VRIhvLgS5HzkQMvzMm3ZaPsT/3vBO3YErLSWNnT+rJ0lxhhivbr0vLMM46efoB3+9ChFhIXcy2Frr8ECSW67o59Z6ccxNloL2FSKS5hnjRn4oguDaokEXrSOJ1OOzyh9XvFm9WP3luu5wLnDC33M6A0dE8q4nBNDtr6w76KB4NXCnJYqo9TyMPosNVvkSzuH2k8Y4cqr9nxs2yTUQwE4hrbRzzEuc++0BIvShRK387obCE/8Ott8pHoeCFtBxMxFROkt5Q2oRQTLCi2nkFf3DXQ0bl3DKbgbMKsltrOcKdEYRsprAlack5KbxtgIx4XrCJ/iSMCU51LBtuQ/E/yA/woZA/ANMJu7BAWmLSYhmrxpNEY9ElgA1ZL6jxZn8kfgvA9IFnJpSeqQGuJIPTQh8f/hzYuvh8ERX3VtAH4Lfy0KPr4oU4H1BHJaS+PQaX84NI+Bq0od6yq/CPRyezQw7/8RbhcOrXBNXYKka46RbzLw8FrwPkZBs9cUzzreZAERnu+awHgPkikVvQ2DrknlR18NBIt8NgGNG5JcawMfPVQCs6tyMXE0BdE/DqtYn3s5DmDtE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(86362001)(83380400001)(8676002)(54906003)(478600001)(2616005)(956004)(2906002)(36756003)(6666004)(66556008)(66476007)(16526019)(6486002)(16576012)(66946007)(31686004)(316002)(31696002)(110136005)(38100700002)(5660300002)(26005)(4326008)(186003)(53546011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0xhS0FpOFhpWFN3L0dKMlJEOHprMEUrcU5KUGIvRmsyQkpCK25qMjh6VUs5?=
 =?utf-8?B?L2Y1a0FtbXR2WFo1dTl4UnlwMVFJOXowUUcraXlaczVnSmx0T1lvakNpRzFw?=
 =?utf-8?B?TjdlSk80TDI0WHByWWw1N1lwMHh4ZERPRFF3R0k3dEpDc24xNDA1Z1A4OWVm?=
 =?utf-8?B?UDNYb2hMcHBSZytIY05pZHJWQzB1azRTZFMzN2paSzRBOFA5eUU5dGhON3cr?=
 =?utf-8?B?K1FiY3AybDlIS2ZCUWx2UjVZayttb0p3eTBhc3Rtd3huWlFvZmFKTFNocFNR?=
 =?utf-8?B?Y0xDY0Y5RHJYdEppenZHZ2hjSW5FSm1XT2Q3L1hXMlpyZ1hxUzVKazFDNEor?=
 =?utf-8?B?SjgrZ3Eyb0JLcDZISURndGE1QXRLa1FJVWVYRDRKWlVwc3VQcGtGdlNkVW0x?=
 =?utf-8?B?ekxiS1NzNU92VEFWVHFvSngybVJGOFZvUEZnS1NvdWFOcHFjR043dlR4V2Fp?=
 =?utf-8?B?NFFubUVBOTZMdENLdm9GeVkxYTlObjBZNVVQUlM2QjBzLzM5em5xVnM5cDVS?=
 =?utf-8?B?WCtmTTFoTFUxNUFZemV4dWtYbWF5b1FMWTNZQlIzV3lKZitabjAzbWJmWjNK?=
 =?utf-8?B?RnVGNkNrN1FHdmJEeENtYjNaRUtDSE9QbFV5RW1TSEladzh1OG5vNlRMc3hr?=
 =?utf-8?B?Nk5Bc2o5OWJJcElnU1F0akZISVhUMUNMcmxtNnZoYjN4RDNJUkpUMWFUNks5?=
 =?utf-8?B?V2d1R1NUUVBXVmtJS085RWkydmZRT0g5ZEZHc2RNUDVDNmRrdG1nMThlUHBB?=
 =?utf-8?B?emJyTkwzOEp6QzlLcmtnT3FsQlFxQzU2cklvTzU2V1dUMERuN095MWpreXZP?=
 =?utf-8?B?anpxbkgzQjJoaGY3VTdmRHBkT1B0UWNhbGJ1THJHMlJmL1ZHMkVmSTNrc2dt?=
 =?utf-8?B?ZWlwTk44K0dyUVF2TFVxVi9ZVWZCcGtWSk9EQ2FvSWRRV082SVJyaW45WVk0?=
 =?utf-8?B?bGFjTEJTcThZMlU1VWR3VTZzL0prdUNwRzdGKy9oU2tRTmxwMHdDeUUycy92?=
 =?utf-8?B?ME9UOWoxQWlzaFp5bU1NcDg4WlQ5UHZPd1BUZ2Z2cHZGaTYzZit5U0NvOWFk?=
 =?utf-8?B?dW9paVpPZWNYK1Nyb01HRCtaSzNxaUpkMjhqQVBjNnhuL3NrMG10Q1ZoaStT?=
 =?utf-8?B?NFRiV0U0OWh1RTI1RVlGSCsybnNkNzhzRlJFcktPcFJYZE1VcXprL1Y0Vmdo?=
 =?utf-8?B?Vmowa0FGYTlvejBpRDlTUUZYMnExU3MraHpuZURrdWxTQm9Cc2ZFN3VJWDRG?=
 =?utf-8?B?VjA2RHJvTVUwUmlicmZRRnVyd1l0b2dnUzgvMmxVRk9lbWFZQ0tKOUFEdndv?=
 =?utf-8?B?Q2prU29EYU55andZbDhnaE5JdVRxN1lzVlI4SjVWdjZFVVhmcnpySG14UnZN?=
 =?utf-8?B?T09GOGpNb1FCejBGWHZDMStRNUFUNW1TR0ljdzdxTkQrWUJRRUlZK3Ntb3dK?=
 =?utf-8?B?bmxwTS9BTFFyS0NVeGhMekdkekladEFWNUFlalRLcDFLT1FUT1AwU21IRGdM?=
 =?utf-8?B?VnpRSG5UQ3RQaXFEQUQ2a3JDalVoVjRQRlp3UUZjNXZBMWh1Ty92MFQ5bGFY?=
 =?utf-8?B?eXYvS0h5T3kvdDZ0cm9OQmJSRWVOZlkxdWZGRUgzVU9EcDhXSU1iT3Q1Tlc5?=
 =?utf-8?B?Wko1Y0puNjM2YUhyRUFKYmE2MUZPTncyVVMyZjhGWEhUeGVOK1ZYNkh4dFNI?=
 =?utf-8?B?anBGejVkTWRaeUpxQmFiOTBIbjc3S1ZNL2JTTFg4R0thRjF3ZlJ6NHA2aVVr?=
 =?utf-8?Q?YKxclrAfRGNxsqMgJXBkbcCXCa8ePcyn5UrDWTG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b58b02-067a-4c3b-2279-08d9325f86c9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:46:51.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmKcLNyq7Woraz+G6IJQzDDCYNW8P9aJu05rRNZrhMxVeJNsEclTjkWMQeRbUU32rP31wec4HJ+FBXWZ3FhEWOv0gze0LSS87IcA3nH8PFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5533
X-OriginatorOrg: citrix.com

On 18/06/2021 11:24, Jan Beulich wrote:
> Some hypercalls, memory-op in particular, can return values requiring
> more than 31 bits to represent. Hence the underlying layers need to make
> sure they won't truncate such values.
>
> While adding the new function to the map file, I noticed the stray
> xencall6 there. I'm taking the liberty to remove it at this occasion. If
> such a function would ever appear, it shouldn't lane in version 1.0.

s/lane/land/ ?

I'm tempted to suggest spitting this out into a separate change anyway.=C2=
=A0
I'm not sure of the implications on the ABI.

ABI-dumper appears not to have picked anything up, nor has readelf on
the object itself, so we're probably ok ABI wise.

That said, I would really have expected a compile/link error for a bad
symbol in a map file.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wasn't sure whether euqivalents for the other xencall<N>() should also
> be introduced, and hence went for the minimal solution first. Otoh there
> is also xencall0() which has no users ...
>
> --- a/tools/include/xencall.h
> +++ b/tools/include/xencall.h
> @@ -113,6 +113,10 @@ int xencall5(xencall_handle *xcall, unsi
>               uint64_t arg1, uint64_t arg2, uint64_t arg3,
>               uint64_t arg4, uint64_t arg5);
> =20
> +/* Variant(s) of the above, as needed, returning "long" instead of "int"=
. */
> +long xencall2L(xencall_handle *xcall, unsigned int op,

If we're fixing ABIs, can we see about not truncate op on the way up?

> +               uint64_t arg1, uint64_t arg2);
> +
>  /*
>   * Allocate and free memory which is suitable for use as a pointer
>   * argument to a hypercall.
> --- a/tools/libs/call/core.c
> +++ b/tools/libs/call/core.c
> @@ -127,6 +127,17 @@ int xencall2(xencall_handle *xcall, unsi
>      return osdep_hypercall(xcall, &call);
>  }
> =20
> +long xencall2L(xencall_handle *xcall, unsigned int op,
> +               uint64_t arg1, uint64_t arg2)
> +{
> +    privcmd_hypercall_t call =3D {
> +        .op =3D op,
> +        .arg =3D { arg1, arg2 },
> +    };
> +
> +    return osdep_hypercall(xcall, &call);

(If we're not changing op), I take it there are no alias tricks we can
play to reuse the same implementation?

~Andrew


