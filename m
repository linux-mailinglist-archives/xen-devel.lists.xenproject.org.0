Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F077B6C4677
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513222.793925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuon-0007RD-UP; Wed, 22 Mar 2023 09:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513222.793925; Wed, 22 Mar 2023 09:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuon-0007Oc-RN; Wed, 22 Mar 2023 09:31:41 +0000
Received: by outflank-mailman (input) for mailman id 513222;
 Wed, 22 Mar 2023 09:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peuol-0004un-PV
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:31:39 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe12::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58d7008b-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:31:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:31:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:31:38 +0000
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
X-Inumbo-ID: 58d7008b-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMrKUvcqLWLjhDdfVyxXBZv1X2rPhrseSUGE2Nlyvv+Q85F5zJkwxtSfOYxzvDZURO64hWP5Ct+tNgoCHt1k0zVQ3L85RUhTwvR5/eb96cCW/uB3If1/lw3MS4te332P74W0LWVgyKFyUPw8KJVSVAzs//fKMw6aruTJEbJKzdDAZLa0gtPOSqkICAsFytLNeiSFE/JVDFb5wN5305vVr2V/7PHN0ssv7Si+mjQ5xg3p2jU05Aa8hyc6S6tX1qgRo3iCZiKuxWONPdtRrtjFzFXsuGxM3sGI8FO20EDphb9xPyagyRlKnq3CJTf/E26vgSLwfuL1W8C/bPz52vI37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1Dsj40oRv4OjoqF3xMmolhrQ7JzGMarXChK83LdjUg=;
 b=cAxPkxMAmUytH/XVgZ+wM0DF1qC5KLie2owEsa+13saGonfRI+eqyxWQ/dVfpd9Bd32ru8YHboZkmADfPGyUHRAjPYTHUSTciyLa9DDC6N0BHfyljKJq0aRQ+/YA0/zDCFmO4W/kVbVxg+Uxg/hz9A5c1x9tsf8m0q4ZP2l34vDN5O8oOvP1SE5Lf/zs0T7J06szsbldL/aAbbC0UFgSr41WqfMY0rv30nmvCCcg00AAKbIMWfG31JFT7dxiplbavj/YuMG16l5Z1n6m9RtaxeGMGep6gEb1vqKpiWOqo9FIWpmBYJi3H1jObGQhfrH0wmqFoaiSEh+W53PqtKoARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1Dsj40oRv4OjoqF3xMmolhrQ7JzGMarXChK83LdjUg=;
 b=b85gIroNeVae9dF8A7LjE4RQTJTA73jsELNgvvSwtB4cK5Cs8ppfEcFrVNHnxsPyLz2/h74qPe/ubdE6uFos6PG0+ZGdT8or4TNmL3bziLezoYeJ6iOnSMltfzTTmqv+NlC3QdqrNsQgR/cs3PYN1j69lytGfH7E9B/AC4N6/urtcuMKEtRM7cEyIYwIO/DESfMeSNohZlESnP52Yc406OJpNAEVgSSh+B3k3y3YGzmeY5JTK/k8GrYkRNK7Ls3tVDxA1A1oGZnTWqFTIFbDEqstS9zBdnp4LnbJbwhu9WWAXtJtrPEKNweU/AcxFcmBDRTSfQYOUTbZ/Hnug3qIcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1433e82-10d1-cf7d-eebf-fdf4aab8a2b2@suse.com>
Date: Wed, 22 Mar 2023 10:31:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 04/16] x86/shadow: replace memcmp() in sh_resync_l1()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: e18fc211-c4f7-49ec-debf-08db2ab83c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Apt43Mnd5053D8QtUHgSVL3zVI+V12QaNodawusNCQQRstHX5S6abL2aiCFEGtLeCAVx1mNmQviQYodjzWq/JJ5L35tLKThWJBILc49wiUpUPA9gbi87fukILnARoDZbpuMZblRC9bpWjBzOB0kC2/EIJ4RZfFS2p0QnRymypVcVULNurTOk7fHknJkvGwJdUtBNrRht2RbUGJpnXpP1lsR4OFnQ0tLbLdp5t2uUsiD9hKOQzThj94o0yyzintePmfobol9mhyWJarJk2sgXK8Dj4mKdxzOVFAM6C1u91gl5GCjrdL1UbVrz6Z1L/OtCi/2CrCRdHhzzREiATOEEI/2iFPWto3RIXLiOR/QinfJtUSq2lb4WBvVAW+4WzxsFa5iPTufkL05i8zBJHLAptCOs0sfoA41wPJHPgfEe6oSQgViohfwbln0n6aIjAS0JSPAa7JH9TUCCIWO+Asi48Q298XC0WNF+JSkCs83SkgRdx7mN8myWlvzEu09Ga0/Op/AmBsp1J6Ph/Iz1jFQxNeItKzqIf6bfqsoVf9XfvhkguPMCgNmEVNMYnvSTpNOvY9N8VBVogzudOoTRMBgRKvc6FOF1NMYWLhOxmdgkwoShBalwpcB4NxSosHSCGxHj3xRqeUcQr7ixMoz8eHJ1c1gb+UF6baA1ErpX4eeLdMYCjVhchd7QXK99JsnWdCfJaqFgGoLbWOMGJAbaCgcSkgOWBsbita+/ikF8oAC4095yBdQX5lwkiNFfN8cQWcvgRnPZFmICvQbKah9Lul0ANG//CGtLBn31yl306dzSSoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(2616005)(6512007)(54906003)(86362001)(38100700002)(31696002)(66476007)(8676002)(36756003)(2906002)(8936002)(4326008)(66556008)(66946007)(6916009)(4744005)(41300700001)(5660300002)(6486002)(6506007)(26005)(316002)(478600001)(186003)(31686004)(45980500001)(43740500002)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnpaNTVLa2JDZzJldmlKc3lYVzhQVlNhQlQzdUZIZWV3bHZ5eUpWR3pVenlT?=
 =?utf-8?B?bkoxSGE4M1M2UDJKMnZxZGhrdTduZkdhaG45bGg5UzE4czhITEUyaU1LQzgx?=
 =?utf-8?B?QXlLL0oxUjBTTjhJZG93WUZpYkY2N0FVSFdIUXJNMVJhNk4rZDhhc0U1QzBM?=
 =?utf-8?B?dGFZRHlNYW05MkRPVkgvcVIxY0hxMjNsL0NsdkwxVUQzQkJrS3hUS2lUWnBN?=
 =?utf-8?B?YlpjblZHR0NkNEJSM1RGb2xDaGFQVzhZNDIxdTlqTnhUeGZ4S3dnaFhiV093?=
 =?utf-8?B?Qi9vRVNUZjdRL1dzVW9zWTN6cHFYcytqb3BMZy9IZnNVeFYxU0wrbllPV2Qr?=
 =?utf-8?B?U250VUF0MyswMzI2SDN5cUFUcWVoKzdsb0xxc1ByRWNCNk9tWldMNDNrbGEw?=
 =?utf-8?B?MnJQUEpreVVNUE9WZ2I3Ti9kZTc2Z1lrMnhpbDdCTmJxMHY4bjA2QUJObk0v?=
 =?utf-8?B?ckdPTlh1blhYd3lWVGZHSEFTNm1mMUI0MWJFbkxCY0hXSWNUNzVSK3lNblp4?=
 =?utf-8?B?MzdoQnhQU0VHUnQ5VEhvVDZLdld3bmZiZFdINTNHS1ZvdnVmelY5aU9pOXlZ?=
 =?utf-8?B?VGEyVUNXMUh4QjVXdVdFeVhHZGp2K1VKUTVuY2w0WDJkY0hXTERTdmhiYUQx?=
 =?utf-8?B?YjZqT292ZS9wR2ZIREpWQmx3ZjI5TWlzRlkzaXJBbE43WkpBdzdpMi9ZZXZD?=
 =?utf-8?B?TytsS0dtdEVpT1NoOUN0VW9ZRmREUlVjTTlQM3AyclVoL0U4ejlrNnprN0xm?=
 =?utf-8?B?Wkd2WmQ0S0ZQbnBrTmh1ZytmTzFEZ3FZRGtmK1F5ODNYWHZRUjhZa2RkZkY2?=
 =?utf-8?B?NmRSblZ2bmhRcVJNTlNjSlRzTkQ0b3QvSCtBMk9UWlpabE9iazN4Y3B2ZnQw?=
 =?utf-8?B?cFRlaGk5NUZNZnJwdHMwNkNnVWxRUVU5aG95RG1nRUgzWUQwVE5VYnZtSjZB?=
 =?utf-8?B?VUI5dXRXYWk2ZWllOU9pdWhmSzg5cDRsYWFMZXFTOGlYS0YwMmVnNmQ4U3Ju?=
 =?utf-8?B?QnFUNHI3eTZScmxrUjRubUlYelNXRzErQkRRSWtmeHJoNGpDVUlQNWZLYTRH?=
 =?utf-8?B?YktlZzY1clUyUm1tQUw4RDVPbFRCMzJvUmZ6L2NNUytKVVIxQWlDSTJ1SXBn?=
 =?utf-8?B?enBMT2F1UXpNUzNoUzE5WHdpNmtWSEhvUlNKUVA3WnYrZWhEM0I5NnB4N2VI?=
 =?utf-8?B?aHZVWFkwbFRrclFvUHFIcHdUQkhsR2U5QTJTZ0VHSUErMUJTSUxaMmttd1pp?=
 =?utf-8?B?TkI1NEtoY1F0QzJKMlNDQVJUSWgrMCsyTkJPd1pDUW51R1VtRjFhWUZmTDkr?=
 =?utf-8?B?dlY5b2hlbEphMGdRUjlYT0hQcHB3cjVVSDRkTVNoZzVIbGJYelhPcGJYMVRk?=
 =?utf-8?B?WmpDbzIrMFFnazdMRWFLclVOOCtReHoyWTNVQjYxVmp6bXIwQmV6Y2ZkTy9Q?=
 =?utf-8?B?NWNwbjl0SjdtOEgyMkFEc0Q5QmZxR3lwaTQxSWYzaVN4Wk1yM210N0hKbEZY?=
 =?utf-8?B?ZVVtdHo5MkZDeFd4RzhiUDJYMmVRUCtnOU9xaE1Tb0YxUERrWEZ4Q3JhYTUy?=
 =?utf-8?B?S3FuT2UzOVZlVWpwbldZMDI2RDIrR2JYbVJzYURTSExvbmZhQXg2M1VvYlB6?=
 =?utf-8?B?M2JFYUQyeG9YRkdOOWVmVWZmSlE1SGpjNDh0Qlk3T3NTb0dTMnJyT3ptcUhC?=
 =?utf-8?B?L0V1bjM0eHBBdkgxdFNHUm5Bc1BBM3Y0RnN5clN4WnFqeGJYMlU2MndzUGs2?=
 =?utf-8?B?aDFocmJNK2JVMzhJcEd2Yi9qZ09sZE9OWjJDcThGOStBbHhqSGVtM2E5NDRn?=
 =?utf-8?B?d1JoSjhCU2xkbWVhRldiYllFaDk4dlVqSm1yZ05NMTNOUVJDeEFHbkJSdGJw?=
 =?utf-8?B?eFM4b2swdEtQMDhzOUhSTk1nODhYemlEaDlleTl1U2dKNzBtYktiTTNyUGlN?=
 =?utf-8?B?OWpSenRhcDNWUzQxU3lvS0RaaldnNDQ3UnFGaU56Q3AwdHJSeS9TTk1ONFAz?=
 =?utf-8?B?UnpQbUZseXJuaHM5UjdvN0ZRcGY1Qzluck9Wai84bmhFdHM5ZU5WR2I2MDFC?=
 =?utf-8?B?V3VrWWZ0ZDEwZFFOZWdVeWxEeUg2Q1hDeE5rblFhNFlleW9URklhWE12UFo3?=
 =?utf-8?Q?51lMQCX1ticYqF+T0K8aYScaE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18fc211-c4f7-49ec-debf-08db2ab83c5b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:31:37.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Zw7fPro1C0kus2bP5ILOOdF/g0oVNYhMh8fxmZfTJIEBS8+XrkKSU1vCkn+69cfR18OpTuZHyIsxc1hMdht5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

Ordinary scalar operations are used in a multitude of other places, so
do so here as well. In fact take the opportunity and drop a local
variable then as well, first and foremost to get rid of a bogus cast.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1659,9 +1659,8 @@ void sh_resync_l1(struct vcpu *v, mfn_t
 
    SHADOW_FOREACH_L1E(sl1mfn, sl1p, &gl1p, 0, {
         guest_l1e_t gl1e = *gl1p;
-        guest_l1e_t *snpl1p = (guest_l1e_t *)snp + guest_index(gl1p);
 
-        if ( memcmp(snpl1p, &gl1e, sizeof(gl1e)) )
+        if ( snp[guest_index(gl1p)].l1 != gl1e.l1 )
         {
             gfn_t gfn;
             mfn_t gmfn = INVALID_MFN;
@@ -1677,7 +1676,7 @@ void sh_resync_l1(struct vcpu *v, mfn_t
 
             l1e_propagate_from_guest(v, gl1e, gmfn, &nsl1e, ft_prefetch, p2mt);
             rc |= shadow_set_l1e(d, sl1p, nsl1e, p2mt, sl1mfn);
-            *snpl1p = gl1e;
+            snp[guest_index(gl1p)] = gl1e;
         }
     });
 


