Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5E4450AB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 09:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221302.382949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miYWs-0006hq-OP; Thu, 04 Nov 2021 08:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221302.382949; Thu, 04 Nov 2021 08:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miYWs-0006g4-Ks; Thu, 04 Nov 2021 08:55:26 +0000
Received: by outflank-mailman (input) for mailman id 221302;
 Thu, 04 Nov 2021 08:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miYWq-0006fy-Jy
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 08:55:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efe5d2b3-3d4c-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 09:55:19 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-N9zeJZk6MuiQNh5n33aF3A-2; Thu, 04 Nov 2021 09:55:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 08:55:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 08:55:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Thu, 4 Nov 2021 08:55:13 +0000
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
X-Inumbo-ID: efe5d2b3-3d4c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636016119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShUlOTLU116Krk8rATLYXHFG9Lxg2GMVu6mfRYYR3XU=;
	b=b7lmQt3PqRgh4UllOBr2rJceQdFXw6SIGVIVk7jligY28oT46CHRxVcJVfi7NXO6na2qJv
	BgpNhEqYNszE7GUP8MIIPuPXGcrTNxXKuUYkZ1Gn3DarAPxO+QsjO5OnqSi06rCDA6TvBk
	VXx08jOr67CygfkqK2lOPI7ta0j7JR8=
X-MC-Unique: N9zeJZk6MuiQNh5n33aF3A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTquDklSdtNjM2D9MelTC3a7qHrY+hHA2VurmF/g4iLosc4DkSLDnc/DrM9xVWHTpKQr3n98SA1GWCNj8m1YSzT/ETkqIoj5P0E7ucHhBiJpqsNunJpA4tkudKsgfkU7DDrAqCTF/Cs7MWMpSCM3oGLjzisUsngUB4waMhVE1mi6ZbD9JCiyO76ZQHZ/yGQWZKunlNpXnv269HlNXWjbCOF/6dChABfCsNMFY2/kliNUnORRU9s5kVs2HD9mtLJeuFOY+CvimHctbDQusVb6rqy+aASjezaunASv9IRW7M7JDBz3s96PHke3CX5m/tAPI7swQrNyMxlaoEt0njKBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShUlOTLU116Krk8rATLYXHFG9Lxg2GMVu6mfRYYR3XU=;
 b=HS7yGQmiURDvKIdtv91PIQNa4Eu7/2ZolTXWB/H/Z3VOfLPWtW4q8VtxEmDldg+vw3rAMMPWJKCdSBsQpP4NUpWM5KKmKoA50k9pXZEQbMyO9E9DCh7wL/PwJz0yZ/KMg46U7e/6b5GF4q9zwAk2iEakRJXD44w2X4bEYjlctK+X9zMA8f3hA6FLv3f70cWxTtkGDBmsjIzpft1eDDvC5QkmckLcpcEtaEw8h+gnYKnNCXVy1vPdcuTKMqQ90iju5Fzw3dYAMLyyajueyC9db13JUhcWykQs+cSTaqf6YvALQx5dguXtJNBqgkQFlVHf7+OrgJI3H6aaW0nUZKeJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e50141eb-f776-4b8d-024d-709614143ce7@suse.com>
Date: Thu, 4 Nov 2021 09:55:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 v5] gnttab: allow setting max version per-domain
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211103145719.96162-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211103145719.96162-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54bf8578-b531-464a-8d5c-08d99f70d0e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848A0C9BF382BBC5B88624FB38D9@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lg+DsdsPRDKVcGUDsoTn60PyaAiAC6TYUGZRrcn3Yj5a9OOX0m7PGUkFa8tOjmNK9roCHJRXvlAvUUCHM6r1M92QSviaW8+ySaVpcckQYhy2lxQ2HZdKK8lSmwJyjBhQYdI5UCr+yQ5PtjxyIfC/4MR4Q7oWP+PRwkS2HvKti9ZJRLEmvCHavHYr09assT/f0S2KHHayOyAOkE42imMlo72eikXFwTw0MUEtYoYFzY6wwNcMzort8jEwrzeqVvaguu9w+eCAyayS/gGzX14vkV1deta4hvT+wJU5Rewx2C9niMvNKncygLU5E7Mw63j5kKmlQ3b3rKIe1uTd0aMvvKTJwjuWyRYKK9WfR3dKdsBEH/cY+/AfNdx9ZKa0xiu6QBkVK4b/h6dR57C08M70y6k7lQmJ7WjATc0t+pj+DcLLKoh87Vd4t94XH9lgZvqpRmO3i/IRFr+U1EMOK4LQAv95dlpSOGQTu4b2/4jBAC3cRhtOoTS31c3e6Hcux+hwsbx17/gcGGZz89sbWkESuBmv8WG3LLxVIziVXPOEElijgSpOTP0/KzCW0LhtM+nC94UohP3pJ3tRlOVLRm3OtXf82NNmt9P0WjB8ftlvBpcHyyViDZCGwX5Hl/m/sBA6WRCY0ndSWnpkekmvYX/QWne5DYl3iazpFfWh33+A3X2TyR1FZCEIf0GTwbKF0diX0O2oR6mJnsxrUh41sWLQHc6HraWq1JbRtZbogK4MHIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(66556008)(186003)(66476007)(8936002)(5660300002)(4326008)(36756003)(53546011)(66946007)(26005)(86362001)(6666004)(16576012)(316002)(7416002)(31686004)(54906003)(2616005)(2906002)(83380400001)(8676002)(956004)(6916009)(38100700002)(31696002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTdLS21oSGgxaHIzS3BCK3NsQVBjNVIramRJMGFhbS9UNGxRbDRhTGlTd05s?=
 =?utf-8?B?MzMzTFA2ZzNEb01QcFVVV1EzUGxXU0RsL1BjOXlqNEFYV3piekMycEk4eHox?=
 =?utf-8?B?MnRyT0JEbjVqSzZ6NW02c3BuNlZOU0ZFcVpsSHJEcnBQcEZaQWxLQmlPL3NG?=
 =?utf-8?B?U2k4dXJsMy96VDVaamNXVEtzam9WT3dOazVMelZOdEVUVFkzZW1mUVZsbWpk?=
 =?utf-8?B?czdCcHF4VG9CbWlkSnd2K3AvRWtZekJNZnRxWWd4WklEMlBKZTlSTjFVNEFt?=
 =?utf-8?B?bk50UnducnVnT3RUK3JURGF2QUJ0TzhKRmQ3V3pjRjdYSDlpSmtiSisxSTVs?=
 =?utf-8?B?cmpZVERBY0I3LzcwTlpkUEJaZE5RY0J0Z1ZnTTVOaW5IOFUyRFMrZEwzKzlx?=
 =?utf-8?B?TTZXMGJ0SDdUelZjY05hOU1VRmNXUFdFd2VoTFhkbERvMEU2ZzVlWlNib0Jt?=
 =?utf-8?B?ZDl1bGhsWjk0VDFXelpFVVlLQmtWV2JUM1FQbjE2L1ludVB2RTlEaFF5M0Zs?=
 =?utf-8?B?V0lYZkxQL1g4YjB4a2JmbnZDZlZCa0tFcXFTOGlTVEwyVy9rQm9FOGdzMmlD?=
 =?utf-8?B?WEpKTXFhV1NwQ2NiRTRZVzUrVnl4Mnh0b1diLy9LMjRKOHJ6WjNmbk4xdXE3?=
 =?utf-8?B?V29XeEdRZG1xOHAyc2FtcGVvTXhMR2ZhRXZaa0VzVkxzTzEvWFg2Ty9PL3dt?=
 =?utf-8?B?M1pscjFQREprVHRMRTNBRnAyY29JNjd4ZEgvYlpkdGtOUmttZmtwdHNzM3Yx?=
 =?utf-8?B?YUdOV01URk5nclFEVUdlL2NlMisrZzY4b2VtTEZ2KzU5YkxlOVdreHNUTDJT?=
 =?utf-8?B?cVFXcmhWdTN2cStGeWJDV0pLVmJnbjY1b3dOTHpTSldHRzE2YzVXbXhKOTdy?=
 =?utf-8?B?bkhBdHNpS0x0NzRWdTZCdCszaUFOMEx0bHpNVDV0MlJSM1RBNkhnK3A3dllv?=
 =?utf-8?B?VlIzZHF6dUxyUE5KNVF3RGtyc29GTS85ditBNTB3elRNSlV5dkRCMjFiUFc5?=
 =?utf-8?B?K3k4bFRaRlNZbk83UWFQV3pRdzNpN3hmNDREVlNMNWtWT2ZRaTJZc0UyZER5?=
 =?utf-8?B?ODNWdWNQUVNoNWNNZDBZOGZYRGtPY3oxUjFDVEJxYVNBN0w0NDRsYmNiWVBP?=
 =?utf-8?B?REpHQVhDTjJZa0FMRmZneGh0WXk1citqZzFiY296SU1WYW1hQlhPTzk1Nk05?=
 =?utf-8?B?eEZJNXc2c05nZjA0aU4zQXdFbVg4cnREdC8wZ0RiSGRzQ2NNWTRRZEx4c2Vy?=
 =?utf-8?B?b25FQlk1YVRtZGhJSGpYRjhRTzczZE5PR0huRDlTbXVtN244aXJDNC9oQnRX?=
 =?utf-8?B?UHdkVWhsNU1Zd2FQVzZvZnhGOEtEM2lBUnYyNEJ1V0pXOE91bmxzaDhiUCs4?=
 =?utf-8?B?M2pxb0d0SjN3cUFEU2JlWDJmNnB1a2F2R0JYR2RDOTl1QW5BV1ZqWU5QWUFJ?=
 =?utf-8?B?anNwcWVaUFZyQWVnUEtpendESHZQd0FwNEYvc29WcUJhYXFkLzBLUlh5ajJK?=
 =?utf-8?B?ZzhkRXF2OHFERnNQNUVSek93ZzVLa1dSRjhRTlVsa1pWa2E3bVVZbzduekd4?=
 =?utf-8?B?OGtpMVc4THRqcndCTDNuVVVocVlOeUVkYnYzK2VIQm0wM2tFdjJkK2VYdE5t?=
 =?utf-8?B?WjExb1c4TjY1OTBRTGZCdVBFVjQzWGdCMVZEMTVoekdzZ3lybjhxcUMyallj?=
 =?utf-8?B?SFNPUVc0RlRPblp6bTZTYXBFMi9JLzV5M1l3akh3cnJnMytIWS9jL0hQMmlx?=
 =?utf-8?B?SG9LZEszWUNKSUpKd0pzV0lIdlNaWENpQkdWbzBKVzREZWMxNzA3aWhEaWhL?=
 =?utf-8?B?dXcrU2Fkb3k4OThSaFBZLzAwOGQyNXZaM1d6c0FqVzZGY1VweUhzYUJUL1BS?=
 =?utf-8?B?dWpvV2swVnVWd3ZPemhkd29EN1ROdi85Q3Z5dXRZTlJQVjJqOTBqWCtxclVa?=
 =?utf-8?B?azNPcUpydUR6ZFlKK3VINjZlSjNMN0JuYTEvWUpjVkxTeGNIbUU4eHBPZ3Vi?=
 =?utf-8?B?bGdiS1N3b1IzZDUzMnVBelZBVXJRSDhzaWRHSlduQ2V3VUxpM0tRcHNZdnhR?=
 =?utf-8?B?aWJtQzlKUkpKSEsyRlJzSEUwcytINnhSVXFPMC9ydlNrOHhtRTRQYm1KYXo5?=
 =?utf-8?B?ekNtdTBXZndrc1JsNVZVVUFqQ0cwQStFSithcTNWbjUwVWVtTUxtdmQxQ0ZV?=
 =?utf-8?Q?VCL9oCw7zZ31PCO7MA9Vcmo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bf8578-b531-464a-8d5c-08d99f70d0e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 08:55:14.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvUjkdhHrhDEoWtkhKkPD/XbuCNtPcQoQs3wnHkXSs/jBxA5VJQSS2JiyNzSAH4vT5mbMBaOizpdi/BRlRdYIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 03.11.2021 15:57, Roger Pau Monne wrote:
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -454,6 +454,28 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          libxl_defbool_setdefault(&b_info->nested_hvm,               false);
>      }
>  
> +    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
> +        libxl_physinfo info;
> +
> +        rc = libxl_get_physinfo(CTX, &info);
> +        if (rc) {
> +            LOG(ERROR, "failed to get hypervisor info");
> +            return rc;
> +        }
> +
> +        if (info.cap_gnttab_v2)
> +            b_info->max_grant_version = 2;
> +        else if (info.cap_gnttab_v1)
> +            b_info->max_grant_version = 1;
> +        else
> +            /* No grant table support reported */
> +            b_info->max_grant_version = 0;
> +    } else if (b_info->max_grant_version & ~XEN_DOMCTL_GRANT_version_mask) {

Aren't you introducing a dependency of a stable library on an unstable
interface here? I'm surprised this even builds, as I didn't expect
libxl sources to include domctl.h in the first place.

> @@ -219,6 +220,13 @@ static void parse_global_config(const char *configfile,
>      else if (e != ESRCH)
>          exit(1);
>  
> +    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
> +                                  INT_MAX, &l, 1);
> +    if (!e)
> +        max_grant_version = l;
> +    else if (e != ESRCH)
> +        exit(1);

Would be kind of nice if out-of-range values were detected and
reported right here, rather than causing puzzling errors at domain
creation. But I have no idea whether doing so would be inconsistent
with the processing of other global settings.

> @@ -1917,11 +1918,26 @@ active_alloc_failed:
>  }
>  
>  int grant_table_init(struct domain *d, int max_grant_frames,
> -                     int max_maptrack_frames)
> +                     int max_maptrack_frames, unsigned int options)
>  {
>      struct grant_table *gt;
> +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
>      int ret = -ENOMEM;
>  
> +    if ( !max_grant_version )
> +    {
> +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> +                d);
> +        return -EINVAL;
> +    }

Wouldn't 0 rather be the most natural way to request no gnttab at all
for a domain? (Arguably making things work that way could be left to
a future change.)

> +    if ( max_grant_version > opt_gnttab_max_version )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> +                d, max_grant_version, opt_gnttab_max_version);
> +        return -EINVAL;
> +    }
> +
>      /* Default to maximum value if no value was specified */
>      if ( max_grant_frames < 0 )
>          max_grant_frames = opt_max_grant_frames;

Neither here nor in domain_create() you check that the other bits of
"options" are zero.

> @@ -69,7 +69,8 @@ int gnttab_acquire_resource(
>  
>  static inline int grant_table_init(struct domain *d,
>                                     int max_grant_frames,
> -                                   int max_maptrack_frames)
> +                                   int max_maptrack_frames,
> +                                   unsigned int options)
>  {
>      return 0;
>  }

While arbitrary table size requests may be okay to ignore here, I'm
unsure about the max-version: Requesting v3 is surely an error in any
event; I'd even be inclined to suggest requesting v1 or v2 is as
well. Adding such a check here looks like it would be compatible with
all the other adjustments you're making.

Jan


