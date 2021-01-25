Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940A302C29
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 21:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74458.133845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l486X-00005u-U3; Mon, 25 Jan 2021 20:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74458.133845; Mon, 25 Jan 2021 20:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l486X-00005U-QP; Mon, 25 Jan 2021 20:04:53 +0000
Received: by outflank-mailman (input) for mailman id 74458;
 Mon, 25 Jan 2021 20:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l486V-00005O-IK
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 20:04:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 065b5ef4-d688-4577-be13-030c604e280c;
 Mon, 25 Jan 2021 20:04:50 +0000 (UTC)
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
X-Inumbo-ID: 065b5ef4-d688-4577-be13-030c604e280c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611605090;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DGfrNFsBnmNPTTFiq5vVjWGXdTRVJ3H77rgmnjDwPCU=;
  b=hASBszZta3UwiQDcwVYzhEpz88EwSj5s3mxI7hRysOk1DXz07j/eW1+D
   //2HAUlPctqfu5utVX0AIJBt2Gjfui7qaGRCclvq8mrqELlrKI2QgEI4X
   UcKyNhOF39LhXzv9O2/qmbX7upI2vMNwJT6qzalS692Lqfy3Bh6DAR4wM
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KOxj1gjePNzZ+0eylbj3b2EyNp6oC/o+6pWghljGPB5l8nGnW6G7gLPNtbpzwM8BPs4YZoioGU
 Xph/yD640K5OarGnnvqRabGpV7dt/yuDQDg0UNKYCeUjTutQ07/fvbElti5bJqXysX3cFQTk89
 N4eWIdu7L2IPaxbeDbL+dD29hVET3CjEch0oFBWOlEBI/8ObbJbVe/Om6/S1X5iwUn9hixn2Wa
 APuRlgtl/faiJY/UABmLrJYurE86fJj/xy3vRrdu7nC+k2sjeqAPvApCQDmoN5TB7u1xMAwapU
 zm8=
X-SBRS: 5.2
X-MesageID: 35786175
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="35786175"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCwOBeLzstRZPicbiZOEJ8k3NZMqxXdwJpwdLJT0uZJWZdvdBEImlUj/jKPZISblAv5rqOeldwQ0mzD78WPbPrrCyDQ1tOOPQT3zgW9ydNTPzmk8uNM33wyDNRwc+bhP1a4s75qfAAdeFuzDXNnRqhhYRhAZkXHneOp4J3MSNeYnpTFyPl+486Oqx+MQFvWUlLt4+s07DV1nBCKQtJUOVTVHvTWDbIEPXOaA7wBNpKf/fx1LsavTxYR2qi5bNnRFh00eOvDmlg1CQMlGGmufeLnFENRruCxGzCAiOkhNBCKtBp2G01HGkh2AJ3JR2MqKCeOIene2IkEBMsB6/kqS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fcBiQGC406WOnOmzhwlnSF0p3wwtTyzlFjtiqYcW9k=;
 b=ZhQ3sBhsqS3mHDAADR34Skoz+ZKH6Teqz039/x5rPJRZqOrn4sWviGkhjgpbAxhWMEWvtM/Fe97pBqtFu0aV+fN10ZeY6jLgiw6T8lmphBtlYEJmFcV2Y5ukYKL0+YVhj5rnHQFH7aeMgSIFVKjVTILzjVrCp2R53ibXzP3DGW3pimH/XXx04gM2SK9jVvXPLd+8HkaqRM9r4FEXpufslkzr1WlDC4j7be6R8K3BMvKhbKf5IKmKDGYdsHRPnFtYqCBMfABgdTCfqm6fcgb0NCcQQWJ+QarQmumNa97t3o2h1DDIuxc6P1g4t/MLafYqcciFbOaIhpOA9ZgtsMErug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fcBiQGC406WOnOmzhwlnSF0p3wwtTyzlFjtiqYcW9k=;
 b=wLQUEFHIXrbcnChKp9lD/Plp+nNGtnLhpYPL+ghtwFAAgxQM+9+lCKKwRYgi6nguFHhYd0TypzlD8XnpU0mrijgH0wztaI8tBHCfmITBImZeqMKe/vWmRoKDxueNTSYrc2daKkJURL0pThQB6t6Wdao4UhfWrOJwVeWbmHWM1gk=
Subject: Re: [PATCH v10 10/11] tools/libs/guest: add code to restore a v4
 libxc stream
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-11-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c957b77a-2b72-a669-9123-f028c94a2698@citrix.com>
Date: Mon, 25 Jan 2021 20:04:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-11-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0385.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::12) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4159c88c-3451-46bf-b885-08d8c16c770b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4054:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4054C44557379A6F9319B794BABD0@BYAPR03MB4054.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFqawGDJ2YjqcC++DGfhaowLP+pmnshNb1bZbPlA+NxRt576F5iVKH8qfrfGkb4cpvmn+La5ni0Fifkitv7kvOD8FHT1p7Y6UOQvjLCh0YyS7eNjoTKbryjdZk/cb+v6a+aCOtToHcY8INTnIG1CY2YE40tZcM8xIzJrCkFHKFksSg9lQOOMvEXDM0D+630+9T8p7QxY3S3GvEbmRCiBSWDSqbqanCtZSv5RUitBfQqhJwwC8JcfmXY88E2DXaH1Z6uNYmU2Mcb+PoIZJTGT3CEnNObDgcx5lDVv1zmtNlBBPOPpJOXS98EYO6X8pzLnmmj8urCaRhXnF2FHChEpciB+2yHI62/p1NNCxPOdG1v1LXwMsd6rvfiRu+jekZhxGpPyjzROSlAP3g4ItdeoRTeaoFef4zzqGk+U3fhY22Ipqjx3WudQxe7lnGorYQm1ef3CEwTfEJ/jVJgnSjs0OiO2rFXI15gNV5PW4PMHgjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(54906003)(4326008)(2906002)(83380400001)(66556008)(16526019)(6666004)(31686004)(26005)(316002)(8936002)(478600001)(8676002)(16576012)(956004)(86362001)(186003)(53546011)(66476007)(6486002)(5660300002)(66946007)(31696002)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXJWNDk5Nkx3MnFXUmtMMGF5T00wVHVHcHpGK04vOWd6UlZEcXJEWGV6clNu?=
 =?utf-8?B?V1MzempzRDV4TVFXQnFrOVR3VUlqL2w2Nk85RjI1dGRHa2xsWjBNR3ZBRHk0?=
 =?utf-8?B?RU1DMy9jQ3o4THo0TThTVVh2SGZpcURaL2NsSHZESFZRVGprNER0Y1BnbjlC?=
 =?utf-8?B?K2hSQk1qenVObHRmb1NlelBzSjdmNHpDLy9KVUlzWVA0S1g2RXlLT0JDdnNP?=
 =?utf-8?B?TTNMT3lrU3NVVXlSRm5xVHpKa281SWZxZXpEckpKeWt1TTlGeUEzbTgyU3Qz?=
 =?utf-8?B?SkhWNXlka0N6OWk2VGpMNmZOcVhMUnV4amo2NENOczJHV1F0d0NsVDZ4VEdR?=
 =?utf-8?B?OTd4V29kcVJvV25Ia1RvVnc2L0dEdlFVeUlScVZ3Um1RUlFLWG1Uc0hudmJ3?=
 =?utf-8?B?K3VvbnU2dnVOMmt2dy8vb2xqSGtBM2t1LytDVWtqeDVzMVJPN3Y2UldEYmlp?=
 =?utf-8?B?QTNVWSt4ZjdKdi8zaGhYbGllTWhJYnFKQXRQUHNpdkFwSCthRlVNOSswYXRp?=
 =?utf-8?B?dnhqbWM0cnJsdUdMcE1wdm9XcWsyMG9meGJXSTl6ckQyb05yeXZBMjZNdFlI?=
 =?utf-8?B?Ty9yOUlPNWR4aS9kVi9FSDR5aktyc0xxdDV6N0Q5NHV2QWFVUnN5TnlKWm5K?=
 =?utf-8?B?UWgvVmRsS2tobVBKZ0tPWjNHUG1JdzJQM2J4YUpiRHhCUFJySFBJRE5tb3Zy?=
 =?utf-8?B?UnJHbE56ZFF0UDkycTVEWGZsQ2dSSTlzWFcwQ3JUV3FEUE9CRUZMemJVelgy?=
 =?utf-8?B?M3l2dlZPdi85ZUNYOTUvSmpVNURhT3lMNjdWQnAxVTVJUG1IeTlXbG5LUUZD?=
 =?utf-8?B?NGVxaVVVczJvcFR2VEluTjVTb0U0bXRaNEtpZDFHVHlKNVdpVW9FYUNicVV0?=
 =?utf-8?B?QitOSXpWVUxrRFZGQThkeFc1SVhMbm8yRjRLN2pFbWhVTFd2Nm5RSmtVSjkz?=
 =?utf-8?B?OWN0dEVIVEN3bFJrMzYwa3NuRzU2djRYbUd5WkRXbTdISTFVWDV4VUFaK3NF?=
 =?utf-8?B?aS82OXllMm1HNnZidnF2SlBLSXdaVG5HMHJBS3hTSFFPSHREUjhRYWIxNktP?=
 =?utf-8?B?b1pjYnFYQUtwbHdoZHdkZjgyMTk1ZklKc1JJS0tsQm1YWFltdk1BY0IyMlZB?=
 =?utf-8?B?REpZYXRabHdTVDJicDZqaUtUbHhsbms3WDlDdk9rdkVFeFZMNUZ5UDZFWHIr?=
 =?utf-8?B?VW5GM1owd2hoVDUyK3AwN1dpS1BrdTBzUkpDM09aTjNBUTUweHJUU1IyOFlm?=
 =?utf-8?B?WC90UitQNHlHVHA2SXV2YkFqQXh4MEdnNzNFNHNRbWJqNUtpckx1UEF0VllY?=
 =?utf-8?B?d2w1UGt3NzhoNlMyblM1NmZ0dEZnNW5hK20zODlSVmlXRXhLdkM5RmUrRXpa?=
 =?utf-8?B?dVExK2ptd3hBNmczVlFLZDBWeG9Pd1NadzhVV1pwUXVoWXhuV1hiQWZyRHhE?=
 =?utf-8?Q?/zcZA0m+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4159c88c-3451-46bf-b885-08d8c16c770b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 20:04:47.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXV2gEQt5FUjECR9AlQdZ3/lszOU+WRzUiNzwU/8NGkAerLeRihJUhmpyqix4HEjmlEFYsRDcbv2a91O/IkiDCgsjCr0R1xynti6v49Ckkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4054
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> This patch adds the necessary code to accept a v4 stream, and to recognise and
> restore a REC_TYPE_DOMAIN_CONTEXT record.
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Somewhere within this needs to be logic to reject the forbidden records
in relevant stream versions.

> diff --git a/tools/libs/guest/xg_sr_restore_x86_hvm.c b/tools/libs/guest/xg_sr_restore_x86_hvm.c
> index d6ea6f3012..6bb164b9f0 100644
> --- a/tools/libs/guest/xg_sr_restore_x86_hvm.c
> +++ b/tools/libs/guest/xg_sr_restore_x86_hvm.c
> @@ -225,6 +225,15 @@ static int x86_hvm_stream_complete(struct xc_sr_context *ctx)
>          return rc;
>      }
>  
> +    rc = xc_domain_set_context(xch, ctx->domid,
> +                               ctx->restore.dom_ctx.ptr,
> +                               ctx->restore.dom_ctx.size);
> +    if ( rc )
> +    {
> +        PERROR("Unable to restore Domain context");
> +        return rc;
> +    }

This doesn't match where you specified the record to live in the stream,
and in particular is reordered WRT HVMCONTEXT restoration.

Also, it appears to be in the middle of a block of code which needs to
become `if ( guest-aware )`.

> +
>      rc = xc_dom_gnttab_seed(xch, ctx->domid, true,
>                              ctx->restore.console_gfn,
>                              ctx->restore.xenstore_gfn,
> diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
> index dc50b0f5a8..2dafad7b83 100644
> --- a/tools/libs/guest/xg_sr_restore_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
> @@ -1134,6 +1134,15 @@ static int x86_pv_stream_complete(struct xc_sr_context *ctx)
>      if ( rc )
>          return rc;
>  
> +    rc = xc_domain_set_context(xch, ctx->domid,
> +                               ctx->restore.dom_ctx.ptr,
> +                               ctx->restore.dom_ctx.size);
> +    if ( rc )
> +    {
> +        PERROR("Unable to restore Domain context");
> +        return rc;
> +    }

Similar comment as HVM for the reordering.  PV guests in particular tend
to be far more sensitive to the restoration order.

~Andrew

