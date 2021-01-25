Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D37302C46
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 21:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74467.133872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l48Cu-000182-0E; Mon, 25 Jan 2021 20:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74467.133872; Mon, 25 Jan 2021 20:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l48Ct-00017a-S7; Mon, 25 Jan 2021 20:11:27 +0000
Received: by outflank-mailman (input) for mailman id 74467;
 Mon, 25 Jan 2021 20:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l48Cs-00017P-Gk
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 20:11:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 204071d2-07da-4085-8b47-8497444da74f;
 Mon, 25 Jan 2021 20:11:24 +0000 (UTC)
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
X-Inumbo-ID: 204071d2-07da-4085-8b47-8497444da74f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611605484;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z4SENRugx7bt0/mGLV2sVV1sCSWP84HqJOual2dRLuY=;
  b=aooThkYTKfGrFtO2FYdC+XfjoFvmzE/XgA0XNxheD1pEcOpU/LSUF4mZ
   QAr+mXP4A6dXGGHL0rctRM8kSONqjUEswXH0WbY9y2/4sKP29+RMMlwn7
   cmewznbfjxReU7gR1RQgBxE8WcTBmfUMdl7sKs9NJ9gR4CbwgRoVaVeZa
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NYbG5SrQEPopSlDh/LC3hjppHDNyVRAbVWbQYLdoSqLxLZWZJxaQTLz3Gzk5k17QbELX6UDHVP
 JY1ueLVWA5dELj0Ry24IA9lDfD3MbWSsmcqSullbNH3PiSTLIXZRm3PAuBWbeCXbx4GuAxNzxr
 oFtdoEEPvagKT+utoWdVGZAIJ3EtDNDpMDN6NHuiUQZ20Z1zxyRUmfWk/gSieVas+FD7HL9iee
 dzqe+CXX73etC9wJMh+mTSP5w2u6P/pDIcd8ssvpbncpG5Hhc8fQxVy4EsIuu9yOrTja94cDZt
 JEU=
X-SBRS: 5.2
X-MesageID: 37131169
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="37131169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cn/s//eCgWVfYKg/F8IN9wrCceD3LDFnJSWrVoq6y4R3EvypSsLLIxlFzszNWvbbPQUAk0p/ZN5WnWNxPI03tX5poj/CQQTmsSeWvzfYbyzxvChDEoZcFytVKaCjbCtV7F7XiMTlZIuKEFSI1vmTmaPpZOVp0EfQRNUprE9GCdO7YiCJ7+gdt5JHhcoMGN0J4CX+EQWFFDSpFRZzhJrosafzua9nSXJ/F+bu6+feDPiCUWlMYpo8atlCi9oecrfmZVLfhd5vrBLXvA171itXJK6jYD5jkqTcYQKfwJnjBSRYDslYybDl0m2LzculsaTXVv5V6IZ3ZDKQjs6B/NrzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3aTW/cWdMDeEuEvEeRXox+NDApZM8Ob+7EMV5s4Nxo=;
 b=dhhy2uN9o72d+XIFOxdcm2eg9/9gjrjLKQ7AX6sFPAvQi5BpjUYhipICL9Gfe8gD+xquLBUvgl1rnX2GEAZ7Lv6mqs+VBjGzZ8MZew3IkPPucrEp/wSZMDqzOSY60GEdSNVhYM4Pd3TNJdk7DCc4gNj7JzXJGJEQA2L1R46DF2atg8c4EJ59obtcVAZxysTrqQ4t6b69ek8qfhAV5dxH9GU2FzCpjRWM5ujN+wCOLOg+wSM1JqFtBqV/XkDmZLYG0VPptYwV4qosDDaYnzdUNEr7nYaY/vhM+ssfdkoG9FFZwQj7JK8dFbcB/627dP8nbK6WdH1a2JTJferOnJ7xVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3aTW/cWdMDeEuEvEeRXox+NDApZM8Ob+7EMV5s4Nxo=;
 b=boBZa5SmE6SkvZ8yQrpHjVIu0Fflgrjp0ny8zrsdVq67+OxYzHTJtwwInaSKNwrQrnJ1qYhu4JZRt37KDR7GxZgmCgBoTjEEnXNvmI8Yb3xA6+jJXhZj9N4Y4lLXtaz4DSRr8YsHeo4qbTMh8PT+dL+x6OT1Kh0J/tpbUcXXS2I=
Subject: Re: [PATCH v10 11/11] tools/libs/guest: add code to save a v4 libxc
 stream
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-12-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e4413ce5-68d9-2231-7394-17557b1ded64@citrix.com>
Date: Mon, 25 Jan 2021 20:11:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-12-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0420.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d553c251-e4b0-412e-19a8-08d8c16d61a1
X-MS-TrafficTypeDiagnostic: BY5PR03MB5332:
X-Microsoft-Antispam-PRVS: <BY5PR03MB53327D6715011FB7338155A6BABD9@BY5PR03MB5332.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6JTeFzDeBYYgV2aCLZ2iU/VW3ywCkT0jYKFMijbeAvc4gfCRFptp6+Z4ZH4jvrRptgcO5hKco6cHDIWcNFYx4fkKvx6JSOyPpd4EffDQMyQJU5U0jWmVcTC3VfMZwLMuVBPomO9S6RWwM84LyZQ9MAbtpPiMwhRdjULg/M0/+W5zek2L7Xo86rXktWQWrs/nmx9sC96YMpBV36h0XYYHF0zEw++3dvc6ztdRHBj/FcqAez67jWMyYl+cmq4aDQ9wqk4s3RwHqf+0q/gQwGCIx4nXPd2j5tnj0Z6cvN1GRUnvAR3QjqpDHcyQ9hbhxZDPyeer97xF2G7LmXHo1FMiIDBxjdH27+iqW34FR2pWekrv5LxvKJlzfVEeMUTQRUMJPkVRvW2sHVOq540FVRyU7ETOKcU8BcHsVrYykBak1bFeD0zP4lc+O242xgHuqOPeHC3wGpNT47RZinbElhT16WAILUeLq1yet4KsMU6/bRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6666004)(6486002)(4326008)(5660300002)(2906002)(956004)(31696002)(2616005)(26005)(36756003)(53546011)(8936002)(16526019)(186003)(498600001)(54906003)(31686004)(8676002)(66556008)(16576012)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3Awb25pdHc2VkFGL0hoOHV0TzA2UkFhK3lQWkFpMERGaWNkL1U1OU4zS3Ev?=
 =?utf-8?B?M1ZEclJVa0FsVCsrZGRpMGcvWWJDc2loZFVGcXkzZjRqYmxwZkY3REplWndL?=
 =?utf-8?B?NHhZbVZRbUxqSkIvRlZDWlZXMVNpL0M5eko5WEhacThGNnZud0tSd2FLejRu?=
 =?utf-8?B?Vm5qYllMNlhBbnZLSGEvcmI3RmhiRHlHeWFjcnFwTTNaN0xSMGtHMEtaendt?=
 =?utf-8?B?MnNnQzdaZG1xSkQ4QVB5cHZzc09QNmU1NWJkTzVDMHVXZFNKV1pWZ0pQWUgy?=
 =?utf-8?B?VU1GVnREd05yVElHN1dkVW5laTljTS9OcmRBUUlFYTBTS211cWpZUDdEUUtX?=
 =?utf-8?B?OWlkYm5WOU5sdjBrTjMzSzl6V2xIaytqV0FqZ1NaRkk1YmhBSlNTcXdiMHlp?=
 =?utf-8?B?WGhkT3NzalExc1drTlc4VlpmbkgvTzh4WEtNUzU3SmE4SU5JUVlWQWptNEs2?=
 =?utf-8?B?TjMyOEVXQmFHakpoUjBlc2dudnQzVHdwbTNHeFNtbCthbnB5cHZ0U0E5NitS?=
 =?utf-8?B?WXVQVmRaYXgyUm1KeXNTa2JucnpLeENOR2NoZUNIS2VJOHRpVHJLZTZUWHZk?=
 =?utf-8?B?aTZLeEhpWkhsYmVTRFBabnVCalY5VGZrWkMrOWRCUnhyVzF4elhZSVNZUXlG?=
 =?utf-8?B?MVc5S0pCUFRnYmt0TTcyc1R6KzBLR29uOXNOZ3BETUV2Tk0rVmg5dURaNnAz?=
 =?utf-8?B?TWw4MWFubG1qL2hscHdSWFFyUjkzdUlYR2hhMGgyNGpwZVlWczF6RjB6Vkxy?=
 =?utf-8?B?LzE0WUg1MCs0dWtIOVdPM21ia0NUTjRiQThnVEF5RTkyQ1U3SjZ2cFl5UW1x?=
 =?utf-8?B?TmRjeWRTeGJsdjNtYVRUQ2lvWWVSMmY0MUR4azNiZGtHanNTcmVxN1BMZlAz?=
 =?utf-8?B?UDAra3NEL2NoYUZwMkVNRDg4OFVDRTZZRVUzdUltOVJvY1B3OHExU3dwYXNQ?=
 =?utf-8?B?ZEYvbFgweDNLQmdlRDdYY0c5RFdaODNyK01DbmovdGxSVlM3VGo3Q1lIRFRx?=
 =?utf-8?B?d1lrbE4zMFp4MHZyNURJMzB3V1luUGtvTk1XVGtreG1FbnV1azlvTVN6Szd4?=
 =?utf-8?B?d2hLMG5POFJYWWhtRzhDaUdVQlpMaitLdHRsVzJsQ0p3eHRQU1FneUFRRThr?=
 =?utf-8?B?WjhGYURVT0ExTjJZa0FIWGtvRWc4OTRweXhmQU11YXhZTEdGYzZNdENUam5G?=
 =?utf-8?B?aVpLRTI4emlmWUFUNGQ0WWJTb041QjFrWEJyMmVWNUhCUis4TnVoZ0ptVSs5?=
 =?utf-8?B?VGY4aTNaYmlCdld5WXdOSk1XZXZVTUVZcFp1YTU1NUo0d2YwNkVhalUwdWJT?=
 =?utf-8?B?ZXNOYlBnNW01V01pZ1F0Q0Q2YjBWb3JMMUFXTUlWTGRiOXBzOFJlOTRhUlVG?=
 =?utf-8?B?RStyWEpUTTdST1Z5bDJYdXJaL1lDQzQ1bThMdjR2MEdrM2FVWEpUWjRxRGJX?=
 =?utf-8?Q?TxVFXwCE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d553c251-e4b0-412e-19a8-08d8c16d61a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 20:11:20.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhiLrVqZ8lEXR+lg/Vi5rp2RdOhY+uXFL9kbNCiI98+5JCdAXXz41YiqaGGRhFsM0XYjICBCaleX9gwYG59IU6rqhjDnCQkrEIeny3ovb10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5332
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> This patch adds the necessary code to save a REC_TYPE_DOMAIN_CONTEXT record,
> and stop saving the now obsolete REC_TYPE_SHARED_INFO and REC_TYPE_TSC_INFO
> records for PV guests.
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Looks broadly ok.

> diff --git a/tools/libs/guest/xg_sr_common_x86.h b/tools/libs/guest/xg_sr_common_x86.h
> index b55758c96d..e504169705 100644
> --- a/tools/libs/guest/xg_sr_common_x86.h
> +++ b/tools/libs/guest/xg_sr_common_x86.h
> @@ -44,6 +44,52 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
>      return 0;
>  }
>  
> +/*
> + * Writes a DOMAIN_CONTEXT record into the stream.
> + */
> +static int write_domain_context_record(struct xc_sr_context *ctx)
> +{
> +    xc_interface *xch = ctx->xch;
> +    struct xc_sr_record rec = {
> +        .type = REC_TYPE_DOMAIN_CONTEXT,
> +    };
> +    size_t len = 0;
> +    int rc;
> +
> +    rc = xc_domain_get_context(xch, ctx->domid, NULL, &len);
> +    if ( rc < 0 )
> +    {
> +        PERROR("can't get record length for dom %u\n", ctx->domid);
> +        goto out;
> +    }
> +
> +    rec.data = malloc(len);
> +
> +    rc = -1;
> +    if ( !rec.data )
> +    {
> +        PERROR("can't allocate %lu bytes\n", len);

%zu, because not all versions of C have size_t the same as unsigned long.

> +        goto out;
> +    }
> +
> +    rc = xc_domain_get_context(xch, ctx->domid, rec.data, &len);
> +    if ( rc < 0 )
> +    {
> +        PERROR("can't get domain record for dom %u\n", ctx->domid);

"domain context", and above.

> diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
> index 4964f1f7b8..3de7b19f54 100644
> --- a/tools/libs/guest/xg_sr_save_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_save_x86_pv.c
> @@ -849,20 +849,6 @@ static int write_x86_pv_p2m_frames(struct xc_sr_context *ctx)
>      return rc;
>  }
>  
> -/*
> - * Writes an SHARED_INFO record into the stream.
> - */
> -static int write_shared_info(struct xc_sr_context *ctx)
> -{
> -    struct xc_sr_record rec = {
> -        .type = REC_TYPE_SHARED_INFO,
> -        .length = PAGE_SIZE,
> -        .data = ctx->x86.pv.shinfo,
> -    };
> -
> -    return write_record(ctx, &rec);
> -}

This change also wants to strip out ctx->x86.pv.shinfo, and the mapping
logic.

~Andrew

