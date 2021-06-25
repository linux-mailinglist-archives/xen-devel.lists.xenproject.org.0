Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFE3B477B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 18:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147321.271469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwop9-0005PP-9P; Fri, 25 Jun 2021 16:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147321.271469; Fri, 25 Jun 2021 16:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwop9-0005NL-5s; Fri, 25 Jun 2021 16:36:59 +0000
Received: by outflank-mailman (input) for mailman id 147321;
 Fri, 25 Jun 2021 16:36:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwop7-0005NF-Nq
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 16:36:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f5b6475-67b5-41a1-9539-6b92fe7ea763;
 Fri, 25 Jun 2021 16:36:56 +0000 (UTC)
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
X-Inumbo-ID: 0f5b6475-67b5-41a1-9539-6b92fe7ea763
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624639016;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a1hyDjeIWUFoZ8OSnH5eS0/OD+auhAmwHDe4oVB7pGM=;
  b=helsjrGtNw2TAm9VIvhdPE+rqO/LlMB/7Nr21GVxQs+Y3YEZ4BvxWjLM
   nQEq15EkXRVIqKAFgOTYCj9Pn043XvfuMDQX7O52mrMDwp7TtAe0IoK1V
   ASGOy53CyF3F4Uh9f9COQpMOSdEJjKjqWOaR3yvAaWAt+FPUY9UubeZmI
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +9aCOyYyNyO7pM3XfxZ9oQz1Cv9iTzym7IIX44Y6ncgqxRYl2esvk15Kul3FDP2A3ePzrBf79n
 1him43Iaxqq612FyO8RL+gH3BYTSqIQjA7idv1OGmeCdxQ3VTYzxjLsWicnInQysGFjYrLJ8Dn
 nz9xISUEZMFKp7pf6WhAuFOxR1unrtw2PD8lPJdFPCm+imSIBlolom9sXeOMw3XJYDAFWokanr
 qt+Img8KmOAFbfulcmfzwPTSuSEZd3h/1g09eYYE0j36Uk+I9d+Mdv6L9PADOytd6nNTrc008I
 kR4=
X-SBRS: 5.1
X-MesageID: 48599959
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:A7AE/qG2PMIJB6fEpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="48599959"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQJmf+sY56j+fw3N/vRQnNwjzP4MKFC7oDasDGth7aKkbPJnEnjCk2nG62qsDTwzAMcfzKAo/t9PD4EGUpjwxRbEm3AlC5IQJ0j5a0OdbJWY6mDbNLk58ssKEODnj2K/s2ZVU/Ogn8LeKoBze0JSs74LbZoG5KeiIP9DRDKT3ipksfNYrJz0SrmQJRlRPWGlF8AgpXE/QEFK0zJODKC2WuO2hq8kBnPDeDkYlXmw5Kv3JFcHEI0QSWITGIGBtJG0BS2MqjsX9fFN3XbvpRZClUVY0eryGImeDx+QdwZW8EtV9tfMNVgZDf/W1atnFQQg6wZGkmIvMm+dnoGy+PQKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9aEG+Zut38SWBHt4g05EgKetcQtmvpylvG0L86KFPo=;
 b=jpSVf6u4jxQBCzfCyoFHAbFB+lhdx8RsK6nDqvr8Be79TkQn5h7GffJKlmrROneUffcM4o8PXjJvzquqrWPzcr/HQLVkZ/wXXRJQJWE3HMX21foLpyjXqW5sqvzxhW+8+OH06NPL+/lobNPeL18u0VJJ9JJRhMgZrLnpPQkAQUuE/TFy1B0lCSPSwxnnR+5+X7SjXQ9qVIT1X7Xl8FVLmiiSflzU/zTuXviKiuLDCHkQbyvgft/bnExpOTkAuDs7KHKX2Okl9j4S6m96jyQHeeiSVJ8Bi+TIb6V5/7Dept7zVpRApq2kZ411QlmqTFIb25XodxPcGW+rTT+YfEtbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9aEG+Zut38SWBHt4g05EgKetcQtmvpylvG0L86KFPo=;
 b=cBT41zN0nPPeuB1IHlKoAxqX5byxGAL4jhHoEwPqMVM/P1gp7S0Fx+UO2nHUcvWieRDC2g+gx557ajGZpQTZ72S+zMGuproMpc/iUhJft+9JQAI9csgyOV7b2n+o3nWfHf6JZjlA0IJjpyIb7MsdGk9YpExzjCLlyosSgD1TolA=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <46831816-a5f2-2eb4-bb91-aba345448feb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 02/12] libxenguest: deal with log-dirty op stats overflow
Message-ID: <5e725a42-953a-c96f-3e72-f0c741b0ce16@citrix.com>
Date: Fri, 25 Jun 2021 17:36:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <46831816-a5f2-2eb4-bb91-aba345448feb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0407.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33a3e502-7477-42e5-d2f3-08d937f76c9c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB42488FFD0D818FDAF02DDAFABA069@BYAPR03MB4248.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSpVGeUHhyrFqqwcPsHuzon5ZjnIdN61+muGQBs4ep8wTVF61t1IyQFd9NuAo4s5I+hKSA1K8NvjMil4TWcnM4zGdeCyetCjdVdlQFZT2DHS/qJ4oJ+FoORi3nLlQpxDsXiZQK4sVVqNUZqTSO9WTIk/6Jxp3Q9/QrMpGQVyVDbHPVUf0FkkkEy6S6SlruXreD93kthZGWllZfiFG7DS67/KcdYvDNZvRgHedT6/ngeffDtcB8pSQPwOt8SOi6FD2PgkA/J7PKgBhtosmfjaafvcK3eHDUBPUdJUKHZOKqVmjLsU1h9H7cxYWcPm1zpL1od5q9SR0ZKG15J3QOK4/rcPvYU4Hvgv8BeSg8FFVU+WaqO0N/wLlUI4P0FEPbMMOvsyUEOrAdY2uMABD99PPlgcV4MNMJVnLxCqr2Gl+UDZiWkJFIL1JsqyexU9YWY5Ug9bHfAz5aKH0nrZZ7dWEEMhCZ7zcEnK4S11MbvFs1+v3IHAdHKck66teXRD4yShSuozFqLBRBgYlDrcCEP6uzWeimGzrICCdy5Qg/KeT3e3jNPh+36I0qwUi78rgUZVbKaTCoGgWRnCUq6ocJv1j5utqY+O3Zh8irLHZtZzpbdOb/qQC4IK6GUwXYxqffn6UF6NjpSafK+0Wl/K0798uSG1pCv7D2RYk/nv2TnlaWkTs/P568/gMv/qHeb2vKhuvJGhVIAUrCUSq4tFP6NzqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(31696002)(83380400001)(66556008)(66476007)(53546011)(54906003)(6486002)(26005)(31686004)(86362001)(316002)(5660300002)(2616005)(38100700002)(66946007)(186003)(2906002)(4326008)(8936002)(36756003)(110136005)(478600001)(8676002)(16526019)(956004)(6666004)(16576012)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1JUT0VzRVg4V0xwNkJMQVAzeEFSTVBja2IxWE9qbFVLbHROWGV2dG5YUjZG?=
 =?utf-8?B?WkRzdHlmUUtEaENXTWlUY1hSaFkzK0FGMDRxUWJzREo1RlNIa29MRjREUm1k?=
 =?utf-8?B?ekUzYThCZGkrVWRCUGNZM0M4eUQwaHB6MTdZSW0zUWNpNGV6WnZmV3hqeTV5?=
 =?utf-8?B?cTN2NlFZamVHbEV4aHN2Rks4VTZhN3VTb3hDSENCZms2dmlzVkVzT2djKzlu?=
 =?utf-8?B?YVJZUTd6YWxiZVJnWHNQdUJhZDIycW1mOHc1NGNHQnN4WlVUbG9qNnJaK05Q?=
 =?utf-8?B?S051QkhPRWVIbzRCZ0FoWjNDY0NraXovaWw1NWpXN0Q0dkt2TXdqbUxWdUdj?=
 =?utf-8?B?djFaVld4c3hXTGZUMTlSYmU4V3BqQ2J1ay9KM2pGaHVxem5rZHhvLzVRTFo1?=
 =?utf-8?B?VERtZ3A1QU10VUE5alg3SjV2cjZzcmxBbkdHaVR0L3hKL2FPRndjTVlBRHU3?=
 =?utf-8?B?WnI3Ymw5MjFQRDMra3JvSkpZYkRGT1ZYZEc4dXo2KzZNem1ldHNUbHBlL2k5?=
 =?utf-8?B?Y0JySDRDY1I3enM1VkhyNy9NN3RRRDM4WEhtMTYvbm9QWXdKUTZjeFhjdGVm?=
 =?utf-8?B?dndFbS9OZGdFQWdWWkZvRWQzQVZSZjJIZXBvYWZaQmJtS2hQUGdVZWpnaWhY?=
 =?utf-8?B?R1JRUGhLcWduSm53UjcwOG9zVmFzVm1SQWFrVGRDMytYWnFra0pWQWIrYTBT?=
 =?utf-8?B?dVVxRllmeGszWThsbU1GSlBGbStDZmY2NHcyZzhocjFVNFV4THNuRHBqUTZI?=
 =?utf-8?B?K2JyaGRmcHArdGZSR2ZWanEvcWVLSENGMFIweUdEM3REeTVBQVRWTEV5S2tW?=
 =?utf-8?B?Q2ZObzlkdFk5WWJYR0NZMnB0alVlNDE2Zzh5U1paaUxKdzJyZ2xnb01HTXd2?=
 =?utf-8?B?ODNPOTVOM1BHM0dJVHFuSlRRd2Q4M0t5bU8xYTNwRWNyN2llMXY2VmdVbCth?=
 =?utf-8?B?aUlFSU9DTmFidkU2OUI3K25rMjlPaGY3eEFub3QrdVdweE1vK2xpUmpYNkV1?=
 =?utf-8?B?UE9DS3ZjRFQ3V3dPVTRncS93YzR6MWN2V25najhUTDFnTmVSTkNsMVN1RnFs?=
 =?utf-8?B?UEM4SDJvd3pJZERSdHJuT1FUTVc1KzkrcldEcEszQnIxeWRMTG5CRXFLcjlu?=
 =?utf-8?B?aUxoMU9zOUN4R2dKeFM4cjU5QXRiZEc5UFYxMzJ4L2hXZ2l1ejNvOGJhTmZi?=
 =?utf-8?B?RlMvWW1lWEVRd1o0NXdReUdPa3pLbFJiS1didTdWTmpKYmNyVGl2QXRmZHQ0?=
 =?utf-8?B?em4waEc2RkVsNXgrbzE5V21LWWhiQ05CVFVmbEhMQ3FLelh1d204cTA3YzVy?=
 =?utf-8?B?SEdIdXVIb2N5WHM4ZXhicTJZZS9ieVFXWlVtZUY2RzNxNGxNaElNckNRYnhr?=
 =?utf-8?B?OVE1d2sxUjZpT1JVa2g5ckZVSzlzT1dvNWROZndlbGVyQ2owVjM3VVZsUmFD?=
 =?utf-8?B?UWdMek5lT3ZvZCtXeDRKN1hJdWhiNzhDTGpENFBuaWNxZnYxZGdjbVdDUlN2?=
 =?utf-8?B?L2pNY0xlSzNYTVdwcCtLTUdjSlZ2N0RaWHRuZlltenpRQys4M0tkVm9vRCtR?=
 =?utf-8?B?dDFhQlFaZVI0QXk0TFRDYzY5QXlBRjhlTGlDWHdtdlVZTXM0ME55SzRZM3dX?=
 =?utf-8?B?b3hoL2k4MDBkajVkRzRpUFhzRVluQUgxaW85bDJXRTQ1MGc4bzErNTJBZ0Nz?=
 =?utf-8?B?aElsRStWZzI0emREWFkzeXRQZEhVa0hsc3JGUWRpTDFvQ25uLzRnNzdReTlW?=
 =?utf-8?Q?dkzC0FTcqQEc7m/P9W3ClroTPIvy3wxK+Tbadoz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a3e502-7477-42e5-d2f3-08d937f76c9c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 16:36:47.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2f3TDlkSXlFZU8JCXa44RqMXcTcOOvCz0hU38Jp0Kaj00jllT6JLoufDU8R4GehOEIfdUMRPFFw0AHvP1dWO71YMMlYhyVs5jRXIzU+hG18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4248
X-OriginatorOrg: citrix.com

On 25/06/2021 14:18, Jan Beulich wrote:
> In send_memory_live() the precise value the dirty_count struct field
> gets initialized to doesn't matter much (apart from the triggering of
> the log message in send_dirty_pages(), see below), but it is important
> that it not be zero on the first iteration (or else send_dirty_pages()
> won't get called at all). Saturate the initializer value at the maximum
> value the field can hold.

I don't follow.=C2=A0 Migration would be extremely broken if the first
iteration didn't work correctly, so something else is going on here.

>
> While there also initialize struct precopy_stats' respective field to a
> more sane value: We don't really know how many dirty pages there are at
> that point.
>
> In suspend_and_send_dirty() and verify_frames() the local variables
> don't need initializing at all, as they're only an output from the
> hypercall which gets invoked first thing.
>
> In send_checkpoint_dirty_pfn_list() the local variable can be dropped
> altogether: It's optional to xc_logdirty_control() and not used anywhere
> else.
>
> Note that in case the clipping actually takes effect, the "Bitmap
> contained more entries than expected..." log message will trigger. This
> being just an informational message, I don't think this is overly
> concerning.

That message is currently a error, confirming that the VM will crash on
the resuming side.

This is a consequence of it attempting to balloon during the live phase
of migration, and discussed in docs/features/migration.pandoc (well - at
least mentioned on the "noone has fixed this yet" list).

> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -500,7 +500,9 @@ static int simple_precopy_policy(struct
>  static int send_memory_live(struct xc_sr_context *ctx)
>  {
>      xc_interface *xch =3D ctx->xch;
> -    xc_shadow_op_stats_t stats =3D { 0, ctx->save.p2m_size };
> +    xc_shadow_op_stats_t stats =3D {
> +        .dirty_count =3D MIN(ctx->save.p2m_size, (typeof(stats.dirty_cou=
nt))~0)
> +    };
>      char *progress_str =3D NULL;
>      unsigned int x =3D 0;
>      int rc;
> @@ -519,7 +521,7 @@ static int send_memory_live(struct xc_sr
>          goto out;
> =20
>      ctx->save.stats =3D (struct precopy_stats){
> -        .dirty_count =3D ctx->save.p2m_size,
> +        .dirty_count =3D -1,

This is an external interface, and I'm not sure it will tolerate finding
more than p2m_size allegedly dirty.

~Andrew


