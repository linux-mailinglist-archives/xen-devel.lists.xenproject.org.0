Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D440205C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 21:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180210.326772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNK8N-0000bS-7R; Mon, 06 Sep 2021 19:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180210.326772; Mon, 06 Sep 2021 19:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNK8N-0000Z5-2s; Mon, 06 Sep 2021 19:18:23 +0000
Received: by outflank-mailman (input) for mailman id 180210;
 Mon, 06 Sep 2021 19:18:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNK8L-0000Yz-BF
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 19:18:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa6e8fd0-f2e3-41cc-83af-cf6374ad21fb;
 Mon, 06 Sep 2021 19:18:20 +0000 (UTC)
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
X-Inumbo-ID: aa6e8fd0-f2e3-41cc-83af-cf6374ad21fb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630955899;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QtUSp3pvvZZv808XCaHgs/kPOkAFV28WuV+5wXilHK0=;
  b=A5FX0Naz0LBvGYH+HwWbyzi3T+aVfkE1FiQN5k+X8ss28e4w3Etp7Rud
   FqxwSgh/5XuUhbxfwEVehxNbj/nolurW8wz1e+f7MIHcE1NmKuo5Spn9A
   SywQplyfvyhSQoV4uQi982h/nbOrZNyJjktE+kaLjMDRkaFOF+/Ne3fzQ
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6B/Tzs0QA46+CNAFqe01cQ9nVn+/Aqt6rO72D7+txkl0ZpJ94XpmeO1Ff8SGxJ2jmDgmhez3AX
 RZY0EVxnC3G6dHZ56ffxWBATfgDJkqOuZL1DOZwA7yOWHBx1kVMKapM6bMjfVV3uuCHrX73Rqh
 4uSu9m0ljuK8n1dv2gs0ENCwQ8CMZfj/hBPgPWLa+fyJomvrHW5on32MwEywbSmjK8NcJKSERD
 TGwkfUYuqtCji1rAJ0XXRiYtnZqija+1RtPqLADRDDHSq6qAaaAuA9t/lPuhygjy8RNssmp4OX
 8JzKtLu3LWwQq9LZDn37bw8I
X-SBRS: 5.1
X-MesageID: 52508607
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XV9dIqHKGLcyP+ESpLqFeJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pas854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXoHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1nackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMG9yV0qp/FWH/ebcG0jaRny9Mww/U42uonZrdUlCvgglLJd1pAZGyHo/I6M0rt
 gsfJ4Y0o2mdfVmGJ6VMt1xN/dfOla9My4kD1jiVWgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52508607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTSxZ79Nmu07vS74qNVRDIamhRusfk2uBEp3y7QnxeCqKXozhxHMDTDxAu708Y7ys4+LTEcEfE7obviTOAoSoo9FGmf8+0E3/WxIHKdHgg/bcBfp9GgF5V6rWzNeTkwJtQGwYD9pXMwsnwS0XLOkkrlBIpFHA/rRILcfv5MvBomBZ6sX4vaTYdKkmFOEud/RCzPhtpAD8qS44a1L93pCTKXWTtTrKPPdrzz/t0h1lUOFD+lGp5gCjiR1SzSjLqkmBTIBEDLIWrQbJRcoCbfVMbBdTNQT9sJi/ZB7XRIKiTHHZoLUgdhCIYcc7LDwJFFgvQLUyMNeiKRYd3JB2UDblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gvTsw0FNSL5+s3kxRMn/xBfkLyPZHLX0DVmJG321wyA=;
 b=h+3P0OgDMcsGTxgrTvp/Voz8nDws28mFvKLPVHWnO7p7vhvzSiBHDLESIMSvkh23N1KC11txf1gHgJw/vXAYOxnBbs/LgouUXi7kNhakVOiuKJ7Jn93OEsABa4CZJfUE5sy0nyUKPbszs4ItUvblH+mULCJt/msdV/Yk1/81vCIXyQSMgvlvAAeXHv3sx+t81ZykqW2X6SBI314gg0DlBTmGz/x5BBCS43UNcAuIIaU+g6+ENFqjy6+WMpaWNsLDdeYT7YxUH8J0qnNcBf0TnnEc1z5KbOL/RWimqxJXa6RXLFf3N1l0D5MPzw919rfPsqDeGXnXALUD/GHLb6jk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvTsw0FNSL5+s3kxRMn/xBfkLyPZHLX0DVmJG321wyA=;
 b=jZK1tR2Gr+pHvu4O4CTwSEzAnAAEE1EDGdwA+AD6/JdmDCYPy6+BeUe6Dps1JYnrWbDX0s7P+5YzfTfxEI2SYi2hUMqve0EEPlUMFPWeDae9rbkph1oxfmVTxz+sld2O8LdM8kB69RGS4H8UNAVrgMan8Rj6PQ25q8s+GltRVnE=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-12-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 11/11] xsm: remove alternate xsm hook interface
Message-ID: <b35d8b3a-c398-a101-8893-6a3ca6906e94@citrix.com>
Date: Mon, 6 Sep 2021 20:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fec7ad68-569d-44aa-57fe-08d9716b0fcf
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5597:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB559794347B6707B055624D3EBAD29@SJ0PR03MB5597.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: My09vHhQTv9vimrF9fR6V7n2ANeaRjupRzQa98VxXNOBOUia8rROr7fP9LqIlCn/gxJ4XyjQiTGOh3yp6DqmkdFA/hHw+3q7zD9P8D9zMJff0jWx6prlTMPJ2ANijDRB6MUUTtH3cg8syWHHdxJ6vtRO9pP5ZBuX5YaAztOjVdjtmhS2HwiGMqO7LDITZuKhyibXEQyOZNA0aUsSeTpgW+Vc5ar66sBGFRP5QE3oc3sfCehZZNLTCO0huO11+sBqDqIyTEIqpt+V45Yay5sKja+SwBfHiwPAeuKDq1FmgK4hyejI1WT0tRFZDfvc7ffjrB22tRQ1o9tsK4DXpm8G+k1zLlmRnElEJOTI+F4ycBDMs0Z3R9kygP8EWLeAnOHgAa/oI6RxcCfQ3qLnWb95pg9hsgSUqvXEGpzdU/eCqUqBihDK/jPC97DyDsV+CbPKHoDK2S3buxLwTnqceL/m88EBqYVsZ3iMX03cvv5ZH5Vl2RExU9WE4fnGHIP5GzxDcgsfUSLwYBcPuua1C61tnkODWthn/9SyQgPHgfipzPe4L/c0AZnDYkSYZufwqm5h5EOUquhJouamOQc2/Brgx7UCIopAhqIEQxreOCWAi6G5VK3+NZBOKn+ACpp1UgX8o3nWlgm72SIv49B4DBwOxmY8sE1TnJfqoBxHpnfWPSCNmqwwwBIcyAQy/TE45Ee3ItTbPJcfy9+OvbobTkjOOyV3zaQLSuWEdNLR1qtPTSCZQ5uzRblVdYCovZ79Vgw4Aanuw7MTJCg+EYkS6FbYgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(31696002)(2906002)(4326008)(956004)(16576012)(2616005)(55236004)(36756003)(316002)(186003)(26005)(6666004)(31686004)(5660300002)(38100700002)(53546011)(66946007)(66476007)(66556008)(478600001)(86362001)(6486002)(83380400001)(8936002)(8676002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkNBWmhHOURZUkpuWEU2Y3NpNVljWDIvdURWa0ZEWXRwSHJxYnNCQlgydWVa?=
 =?utf-8?B?WTI4eml4UE1WcHNxYVpDK0tpQ0xwTGs4aG9kR2E2U2FxMk1EQ0lGNUt4ZWxk?=
 =?utf-8?B?Zy96aklBOGZPcHY3dm4yK3dmUEhROEZla0l4YWROeUFIVzY4ZENaUTlZMkRE?=
 =?utf-8?B?Vi9kSURNaFZobVNFVXFUbGRLRDFNdDVJWjNHSnZGYy8xNHhGSFUyaVZRa05x?=
 =?utf-8?B?RTJ2Tm5FcWdoSnpuU0doR3B4Uk5CQ2NldmdtUmYvVmNJYmR2MkNMb2lXdDhy?=
 =?utf-8?B?WFV6OElxc1hVNHF4b0xVNDEyTldvbnZQWU5OVktGOGlqQ3BRWFJCVkJwZFV2?=
 =?utf-8?B?cS9CR2MrN0g1RExPaFlGWk1FeWkvMnpXbUdsSzRuMkVXWEpFdmNiZjR5ck5p?=
 =?utf-8?B?ZzVpYlVOZW02dzYzU21SVVhsZEJlWGhhMVdjUk0xY1VIM0xuNmZHNHdJTE9i?=
 =?utf-8?B?bnViNXNHTGx1Y0NTZWljUFczSUtBZzhjK2tRbDYvV0x6djhaaXNyeitwdHdR?=
 =?utf-8?B?SGxpZjVIdG1ZbU5mZWVoUUFpNDFvK3U5Q1VGanBidHhBS1lieFhlbVNKTy91?=
 =?utf-8?B?b21BYVQ0OFd5T29aaUhacmZEaFhMN0t6RUZja05YWFNMdlpHNlRpZ3JwZmh6?=
 =?utf-8?B?U3NCZ01PR3p1MkgzeXVnbE9sK2trYVhMaTV5MW9DTU9paDRuRC9mbUtFaEJu?=
 =?utf-8?B?Wm5zUDJWdHBlVlZXa2E2RzlIcXp0eUlPNVRVc2I5Ti9uQUp6REM3RE1VMDRY?=
 =?utf-8?B?YXozWHhTVFZZeERSM1ZyREpwQXlHWUVpbXpJVVdVNitTNlJScXBMMGFKaWcv?=
 =?utf-8?B?elFOVGkxRW1xNlplMndHUXozdFl0cEQwcFNLMjBCTEp2K1RtSEcxVFlTVi9S?=
 =?utf-8?B?MzJBbEVvYXA1clUrZDhVSStXb0Rwbk91c3dlWm5zQUhWZnlaSklFcmNrbm1R?=
 =?utf-8?B?RVBvdUlzczA5NTdlY1dpc3pmSEl4UXhqT05vU2FOSUtxSXloYlRybUx1VUxR?=
 =?utf-8?B?SVFqVUhHQkcxS2NvQ1ZGbE9Vams5Q0VvM1YxeStBRWFCa3A2bnZTaVFIN2VS?=
 =?utf-8?B?UVZhaFNpMXpIVDNMeXQvUDNLRys3UE1VZmJFWWpIaEtWdkoydkNWQ1VzY3VH?=
 =?utf-8?B?S3BOUkk4UFdkV3I4Ny80V2llYnBxTEgyaUM4dCtOM3Z1OXZiUGgxekJBSXU4?=
 =?utf-8?B?STE5ODFjZ2ZwTVRhdjVEUTIrdGxmVmg4WVhGdTJkZjhPOXZRVnd2QkxSZlQy?=
 =?utf-8?B?ZG5ERkh1RnFIMGhnR2tBWGtZMGhuL2pPd2xDbWU0dUZQVmp3ZkpxWlhLWSto?=
 =?utf-8?B?UHltUzZ1bEtFaGMzM0h2ZUVPRWRzNFplQk9XZ2g3dmR2dFh0YUF4dkt6bnQx?=
 =?utf-8?B?ZGc0dDllZ29RR2g4dUdmZ1M2MzhQWE54blpKRDBhWndzeXdrSDlkaExqTjRK?=
 =?utf-8?B?TWJZei96R0htbTM3eU5UMUtBTkNJenE4OFRVMUk0ZzV2RkpUN3VlNjNQNVNK?=
 =?utf-8?B?am9pQjZaZUQyRlZsZjlhdEt0aHdtem1XWDN6Vmt5TXIwU21DUk9iRHJqdDE3?=
 =?utf-8?B?dHVxRG9QejJYVE9hSEhKbXRFdlBEQTVJQ3Evdkt0QU1HMENCWndIL2VCZ1NR?=
 =?utf-8?B?UUcrSGdpcnBDVTArNUMyWmhSWUk5em1vbmcyUmtvd1hCK3RrUEo3NUpKREhm?=
 =?utf-8?B?b2Z3Q1JMek1uQzY0VmJJdmNsOThmNnp2WUMrZEdjRW9QU0s3dTRhT3E5TFBa?=
 =?utf-8?Q?i8OE+E5U/7iu0YTne6nyz0QP0oEHoO3fxy5Vixs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fec7ad68-569d-44aa-57fe-08d9716b0fcf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:18:09.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNXRHAmPAbFfK2WzzHaJ3muilch85ZR9USj3jpf+/uGB/+w1plrHQfUaNK1+ONnYlS0To7DN6UvK+yZZXEsr/8ChaHsyXK585ik1+V/LPnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5597
X-OriginatorOrg: citrix.com

On 03/09/2021 20:06, Daniel P. Smith wrote:
> -static inline int xsm_memtype(xsm_default_t def, uint32_t access)
> +#if 0
> +/* Could not find any usages */
> +static inline int xsm_memtype(xsm_default_t action, uint32_t access)
>  {
>      return alternative_call(xsm_ops.memtype, access);
>  }
> +#endif

There wants to be an earlier patch deleting dead code.=C2=A0 We don't want =
to
retain this if-0'd out.

> diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
> new file mode 100644
> index 0000000000..b9a7e8c40f
> --- /dev/null
> +++ b/xen/xsm/dummy.h
> @@ -0,0 +1,739 @@
> +/*
> + *  Default XSM hooks - IS_PRIV and IS_PRIV_FOR checks
> + *
> + *  Author: Daniel De Graaf <dgdegra@tyhco.nsa.gov>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2,
> + *  as published by the Free Software Foundation.
> + *
> + *
> + *  Dummy XSM hooks implementing the default access check. Each hook sho=
uld
> + *  have as its first line XSM_DEFAULT_ACTION declaring the privilege le=
vel
> + *  required for this access.
> + */
> +
> +#ifndef __XSM_DUMMY_H__
> +#define __XSM_DUMMY_H__
> +
> +#include <xen/sched.h>
> +#include <xsm/xsm-core.h>
> +#include <public/hvm/params.h>
> +
> +#define XSM_DEFAULT_ACTION(def) xsm_default_t action =3D def; (void)acti=
on
> +
> +static always_inline int xsm_default_action(
> +    xsm_default_t action, struct domain *src, struct domain *target)
> +{
> +    switch ( action ) {

Either here (because you're moving code), or in the style fix, the brace
wants to be on the next line.

~Andrew


