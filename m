Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0A0764964
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570818.893031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvoW-0005gH-SF; Thu, 27 Jul 2023 07:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570818.893031; Thu, 27 Jul 2023 07:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvoW-0005eA-PJ; Thu, 27 Jul 2023 07:53:36 +0000
Received: by outflank-mailman (input) for mailman id 570818;
 Thu, 27 Jul 2023 07:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvoV-0005e4-76
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:53:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af8a5037-2c52-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 09:53:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7868.eurprd04.prod.outlook.com (2603:10a6:10:1f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 07:53:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:53:04 +0000
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
X-Inumbo-ID: af8a5037-2c52-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9XGLro4NiKNppWBVxev77fH6n+ZeyiI3YEiEtXjBc8fvKS4NZ/YdmEXBsk5USTyOQb2dQAvxq1V3MGHmkRcURpm+E9f47x0WS+WSCdEEjnEBgq134Pt23WET/L1Uhqn6FsyNSnYT/Bmw/7JpzwJvVLcQet2guWTrnFNfJUH4MLdarwEaRLft5kw9ZjNlsfQxChCevZeJ05I/D6OnjZI+l3Ci4oJju0BI//fR9AF4x5fEJb6bztSNRFwhEmZh+YYIInstNgV0q8TKQU9kcM2SXNLp3FDlJnr8edI14+hRh5d0RvJ/JBhMgCpkTGubcc6iMTqbKBCCAAYcaoLDlYwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dasr7o8iHHwkZxg49CQhbvh0zVtG2GDXonEtaYW5K6c=;
 b=W2LcyDLZnpP68haIgakulkJ8LJsFN10NC01vNjGzAviEUK2n/BFiapEqLFOPptW9GgLVPnLdNTqpJMBJ6TZODZHROfRRIdoxXBiy4IKWKdJ3LD122qRQ6ep4LkTBx7f31Q4x0T1KyoXEn30h/FJvVenC38XHRol4kU4R9XGN7RWz1geiE5Lt+fal06GBhMwiuJRKM4qI1U3a3B5UD4JupPsVLzOU8GdG9LADkxUSS7JCcB+8PsjTgtIC0WFboolzDYWu4skr5Kxtn88qHopK0w/9NFtdXOppcgEu88XlXGw8n4UrFGXnJqEjI1Gx1fAJ+adNIyovumDyPgpwskHO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dasr7o8iHHwkZxg49CQhbvh0zVtG2GDXonEtaYW5K6c=;
 b=sodf5q+JVIIt+ulesBqjJu1X2AG02Lb04cSV+4T9YvSiDIGhZy41lNvIgorj583xWOJyJ/YMrxEXrCoQs7vmUmgEx2nyhTorS+JX5wT1AwLzJWJOxdt6Ly1e3VRIfuv0SiDoh5bUF+eGf63r0Gy6Zh4e8rXllGUD47xmuAyaIwcnoiIXOBUfFCYlSIXOwo62HhBfTNiH6re1fhFcAHEe830AOp0LFj8YsEsGsC5VvMFZ4w7ZlIizqIRjY2vLdgQ/n7A8iYZTolM5qT1qM8Dxn3xs+pwbHO7wTkO3w04o4Y5tCXnYLC2LP3JbkbfrawZnJuVsAv6TNZLCdRlagasKVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5aaf37aa-cb7d-59e5-5e0b-40fa73177d35@suse.com>
Date: Thu, 27 Jul 2023 09:53:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] tools/xenstore: fix get_spec_node()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20230724103324.4207-1-jgross@suse.com>
 <20230724103324.4207-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230724103324.4207-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 418333a1-8434-426d-2987-08db8e7681be
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WN0fPD7n5OObhPQy32DxnJixINKG9oKCKzx2DmuTrC062b5ReN+UJWspCXokEBlPX7JAmXKLLgb7ihCQFyeO4DmRjjR9So+yYnpYY8Cb/OojmLe00098k8wCWLJWnKu9lp0NYPzK3DZBGG+WuRGwApugz6Habn7BKJ/CLKghYbU0lHEXV+MY0t2JzRVTIQ4KBOEfSEdRMpD25BQwf6dORJwQNVuCWmOcE+bH+T23YgdnYU88TOmzmAG6OPOkA2zpEAb8oTLNooLVLbHIg/b5Hq1VCuzTThrM9LoypTcLFCS8bWv7zDQexNGrQbWNrfshZOqi7ptIS9NGBv0HCTQ3ZnDqafgk0NIKJ3c7QHHsuh8P4q5aJ6DsIlRv26/PaQAw85swntuDc+tIxr7hT88ERhzKIQlMZ4TmZ/fZIKIhJAKZ1PQwS7X0ULvv4i4nZquBUDX+oxSp11G4JeSxIrb7ko5kocGOFR6mHSVVMKZTHulReUOrddQaAzMYCUFTul/yf/VPBOJrDA4Jf9xUWGoDtdd8CGHVZA+n3arGy6JsYRnvf5YzXNAyAl9wqBY6UNsGabNGXP95b2eqqyfY07Tu6idRrUpAtWHPhm7AVbdT/CEmmIYaXMQiMqVbDREBArGkAZ8h1M1bechjh6mZxxpKZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(36756003)(31696002)(86362001)(4744005)(2906002)(31686004)(83380400001)(186003)(53546011)(6506007)(26005)(6512007)(6666004)(37006003)(38100700002)(478600001)(54906003)(6486002)(66476007)(316002)(4326008)(6636002)(66556008)(8676002)(8936002)(41300700001)(5660300002)(66946007)(6862004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXdjTlViNW1Ka0ZhRUlMUkZ4dU04RjlUdUtYYmtGTmExMmtJeWxSV2VRdUNS?=
 =?utf-8?B?K2V0YVAvOGNYR0lySGtWc2ZjVUowMjZHODM1ZGk0N1dSRWFtNURIUS9qVmE5?=
 =?utf-8?B?QWl2MHQ3K2svRVVtKzlEaFJremVpeUZKRTNUbERQWmNReVpBRmpUbXhVWm1G?=
 =?utf-8?B?MVZPeW9TbXZ5aGtkS2tWTjF5VW9NSEFiZVY3K0UrMTE0MngwZENrWXM1d3U1?=
 =?utf-8?B?bWZlaU04ZVZSOWU2UmVHUHJ5Zy83cjJUaE9NSDNFcEV5SDBIREJYRUd2cVBi?=
 =?utf-8?B?VFBkaXRuTTlPRDFyK2Eyd0hoSVQ0K0k3ZlMxQ3kxY3hSRHNsaGxORmd1TjhK?=
 =?utf-8?B?UXRnRWlsWEplOElSSVFVclJuTWg1aVgrcDFRODk3ZHlKU2Rwa1lJQzFXNXp2?=
 =?utf-8?B?UTM5Zzd4TEJWK2wvUThLNnpmQjFJa0tEWWZOV1JxOWdVVzJXT2x5TzJzK0JM?=
 =?utf-8?B?UFBpbi8zYXM0T2xHOXVTZ3VETmFqdndtT3NrOFh3NmJZVWxlT08wajFqSVZr?=
 =?utf-8?B?S2hsTjNlTllRZmxYZlQyNmtUVnVmR0J0YTBwRFNNUWNuWGxGNjdZYWRTUEd2?=
 =?utf-8?B?bGJWcExDMk0zS25RaXM0cjd5SjgwYXY5OGVxR3EzbVB6YkR2MWd1NDIvVE1N?=
 =?utf-8?B?bjdWOGhUOXpwOTFVZ1pGNnF1cjZJYXVwNFNuVlVnOS9uSWxRcjZRektDQ2dN?=
 =?utf-8?B?NHliUUhtcWxzbHVUUDg2ZHgvU21neXl1KzJkL09rb20wN1JxQ0EyOXBSMW9q?=
 =?utf-8?B?WWJOTmxWVWhpTWJqTWdWbGpNVSt5b1NEZTN4M0ZRUkxsUFZvL3U2MU9HMyth?=
 =?utf-8?B?U1o4d3ZxUFd3SUEvNUlMRHhISG9WaXhYTFJzajdqcmYzUUl3Nlg1OC82ZThD?=
 =?utf-8?B?blhxUmVXeUNvZDZTZmFyTi9QSXVNT3p0UVpKQ0dMOWVidDN0SzdqaXNjYTI1?=
 =?utf-8?B?YUhPTFJ6cXFWMmNpb3NZN1M0WjFDdFdRZVhYMnFSbFNsNW9tdmJybGVaRHV4?=
 =?utf-8?B?VkpjQXFYdTYxQnc5d3JHVVk1UXpCc0FhTzVtNEdKNHdpR2wvUnk3K0xVdHpO?=
 =?utf-8?B?cGd2VTk2eWtUOStJN2ViYzdqbHBsSzN3dDFQOWtJWDRFVVVXd3lGZFVUblZr?=
 =?utf-8?B?N3V0SnNtWmVlMmhmdUJHc1BpRlBzN2U2NGxQa280c2lVSGNpdktSVGp5YkFK?=
 =?utf-8?B?VmlGcEZsODBMcDZ2WHAzRXFUTGJESTQvdDkrUUZ2STc0MVBMaVhKS3ppMEVQ?=
 =?utf-8?B?OVJydVlZWHd3U3ZPcTdMcUNVazNhYkkwMWhRUEgva25SQ05wT0hzUVNjN1dH?=
 =?utf-8?B?UzQ0MER2aU5FMHBOYUFiNWlWeGtXc2pQaXNVMVcvdjdNbG9ybmMweE03Vyt1?=
 =?utf-8?B?d2x5WlhoSFBQbmRCSDdrSTMwRjB4Z1d5ZDdmN0wzNGVpY05LSlF2L05pLzBH?=
 =?utf-8?B?THdad1FoZ2NIQjVxNEF3RERQaW1RZFJxa040QXNCY092MmREa1N1UWZrdWVj?=
 =?utf-8?B?VThFb0FhQmZyUHJFQi9OTksxWWNKeiticFdwalo5S0NnMk95b3pmOEVDQXpp?=
 =?utf-8?B?WkthemRCZGlGazBMWitPMVVjYndqakJWcFcrd3lEc3Vqc3RuVW1xTmt5Q2pC?=
 =?utf-8?B?VEtWazlwY2pPdWo4dTVzLzlpNWExUnd4S1ArSXg2V1BuVlFiU0Z3SUVhSmtO?=
 =?utf-8?B?YVNCM3FRd1BYOGpCbkk0UktyVjg4Q3NybU5rK0dXbGEwbnJLU3JrNXhvZ2Uv?=
 =?utf-8?B?azlyS3k1dUxJUGZWZjJVZVNTb2JDYU9PeUlGczFmQkowb2xrMDVwZ2R6WE56?=
 =?utf-8?B?NVovUzFkeW0xdFVLemFneGhTaGtBYUFybHAzc0E5SWxYdGl2NEpLZVJrZ3Bo?=
 =?utf-8?B?V0dXWkhkNDg4YVpjTkUxbXo2bW1TOWVJMCtpb08xL2JvbFBneWxCSTNxSzRU?=
 =?utf-8?B?K09ialpzRVZjUXRGVVhWRkpKdUdYbVpsSWE3TjZScEVFa0ZnTitSL1l5cWNU?=
 =?utf-8?B?QkpDdzRITTlGUHBGWnFVMGQwSnFDWjNQeEFQNGlyMWd2RFZmNi9KTVBGOG96?=
 =?utf-8?B?RUJOdDE1aDJBUFNJU0JDS1BBSHdPYkxsbVhBTjNVcmFseVhZZmZPdHREaFRG?=
 =?utf-8?Q?P71vfPV/VkmHIscqRS1MGcRIF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418333a1-8434-426d-2987-08db8e7681be
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:53:04.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTAzm2yp+e8Ek3/l658gmyXiayiGMt+fj8fYD2Vm6727CcOoi9xJssL/1BE/LbUaXuUlcOofU4hxGXHW+zUJOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7868

On 24.07.2023 12:33, Juergen Gross wrote:
> In case get_spec_node() is being called for a special node starting
> with '@' it won't set *canonical_name. This can result in a crash of
> xenstored due to dereferencing the uninitialized name in
> fire_watches().
> 
> This is no security issue as it requires either a privileged caller or
> ownership of the special node in question by an unprivileged caller
> (which is questionable, as this would make the owner privileged in some
> way).
> 
> Fixes: d6bb63924fc2 ("tools/xenstore: introduce dummy nodes for special watch paths")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

I've committed the two patches, and I've queued this one for backporting.
Can at least one of you please confirm that the earlier patch is not
intended to be backported, and that instead a cast will need adding in
the backport of the one here?

Jan


