Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFD3903B4
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 16:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132212.246696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llXqn-0003ND-MT; Tue, 25 May 2021 14:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132212.246696; Tue, 25 May 2021 14:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llXqn-0003Jr-Hi; Tue, 25 May 2021 14:16:05 +0000
Received: by outflank-mailman (input) for mailman id 132212;
 Tue, 25 May 2021 14:16:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR7Q=KU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1llXql-0003Jc-Ej
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 14:16:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f134f0ae-0563-403c-8202-0b2ee20bf971;
 Tue, 25 May 2021 14:16:02 +0000 (UTC)
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
X-Inumbo-ID: f134f0ae-0563-403c-8202-0b2ee20bf971
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621952162;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yPmoX+4s/u+OuGfu7XB3qwrOFAaaYZypgOrJaH/07vU=;
  b=Y2EOgrBUPN1xbnw61Qh5AcUId5q5c+z1T7vHNWeO31vLyM1HhvBFGheg
   vMnNyhQ+kfnIefauRtR7yDiY7Fb8tDpsTmxJpdF90/w0TqGPGFZPrhEQt
   zlR6aO4GFvMMrn70588BXniKuTdGjgkVrnS8q1EUNqzyAgCAXer8XGplR
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CTo68Y8WR0BBXJq54gF5ZuPw95gYJlYXYe7keAoYHCe6V1orD2XpVaSF0uvoG9klVEzahpGgRo
 RNoa+A0q0NLpwCZLQWOX761LqW/LxjQwnBsXIIuG5UESXmEFRz47aeFnYgsaEb3iPZX+mRaksq
 eP2/Y7Nidim+6C1PLQA1U854hBneuwzTm5S7UGR29sKSGvnGjOt52y19Zi0x4lMv5A0yLDg+2x
 vzfi8GoC5dpRWAqe7/URqCCiV8lr1YlrtykwGGZOJC/0l+CyJZ5ZCIMH9IfaXg5oq8/kWwPNtR
 /7s=
X-SBRS: 5.1
X-MesageID: 44953532
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:MDR9IKOpRhBsipfvrR3Ol8FynXyQoLVcMsEvi/4bfWQNrUokgjdWn
 TdKWjuAMvyJZmunfdklbY7g9hlVuMOBn9djHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF/VHydOCJQUBUjclkfJKlYAL/En03FVUMpBsJ00o5wrZk2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 +dd67u3YA0VMrzAw8Y5UjZiFAN3IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03TwbjvqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgGth25sTRqy2i
 8wxQzEyTQj/Yj5zP1YRN5gnp+eMiXyjSmgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQMDDUGWF39puO24ma/RNB3O
 0ES4jApr6U56AqsVNaVYvGjiCfa5FhGAYMWSrBqrlvUokbJ3+qHLms2XmBmb/UsiMMnSWcI8
 l6mpdTLDCM65dV5VkmhGqeoQSKaYHZPdD5YP3FVE2Pp8PG5/tho0U6nosJLVf7t14OlRVkc1
 hjX9HBWulkFsSIcO0xXF3jphCiw7rzAUwI4/AneWm/NAuhRP9X+PtXABbQ29599wGelorup5
 yJsdyu2trpm4XSxeMulGrtlIV1Rz6zZWAAweHY2d3Xby9hIx5JEVdoAiAyS2W8wbZdeEdMXS
 BS7VfxtCG97YyLxMP4fj3OZIMU216nwfekJpdiOMoImX3SFTyfarHAGTRPBhAjFzRlz+ZzTz
 L/GKK5A+15BUv85pNd3Ls9AuYIWKtcWlTKLGc+jl0z5uVdcDVbMIYo43JK1RrlRxIuPoRnP8
 sYZMM2Pyh5FV/b5bDWR+okWRW3m51BhbXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:EOlCDauHFnyFycMQmxPBoMG17skCToMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXqF+rQbsaG6GcmT7I+0pRodLnAJGtRdBkVCe32m+yVNNXl77PECZe
 OhD6R81l2dkSN9VLXLOpBJZZmNmzWl/6iWLyIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH5zr/LiYD59jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8Rry5uiwvqu3H0idrrD
 D1mWZkAy1P0QKUQonsyiGdnDUIkQxeqkMK8GXow0cK+qfCNXQH46Mrv/MqTvPbg3BQ9u2Unp
 g7hl5wGvJsfFr9dR/Glq/1vidR5wGJSEoZ4JouZkNkIP0jgZ9q3MEiFRBuYds99ByT0vFuLA
 A4NrCj2B8RSyLDU0zk
X-IronPort-AV: E=Sophos;i="5.82,328,1613451600"; 
   d="scan'208";a="44953532"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9yf+J6O1sVEVyTai8LIy7O1zOFZIzG3C1dWdkzd00yiXcJlEusJpm4E8f9w+AO80rV16A97aXYD9OnWaoJyw5JTIyF++xebRf1cwJy/K3MyuJcHnNpnVVA0ekGXvWZx3LuLj9E5e0gTGDP27K8ZpdHXE6u26XmtXJRVKiC3izejRHK4XGQzpr8xucT8XFp8MlSGsImgH+PwbMoTGne/LBkD4p/lx6noTvPpbPzNX+o3oeCdaZUPSwWkwByNdpFYWhrh37mIwvDiNyJKveymavNW1rKfP8dS6w6014YKAL9UVyw7eukJqnooE0ZgLP396y667iEbToOjrUllCtgfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPmoX+4s/u+OuGfu7XB3qwrOFAaaYZypgOrJaH/07vU=;
 b=SNrlEAZoeLSIqyQlz23cKs+ED1plh7R4OBrzd5PI8wbWPPFUNOJN/MarhVtqabJ+AxpsbgS3uUvf/8+xF4dx+1BWQrhYXdGGrKAf/MiNWKtuXFPed1CmxnPwBDYBCgkWyCR9oOnFHSWT7fl3uSFZhBkhlurAr+Nnlu66A0fi8YhTWi+gBb20d0o9h4+MtkBooT8iallp4FyZXMlrWLA9HsyTHZKvnyrik1JQ7i9a8wSCOUCh16KwpacLitKp2efn8ZrcX4QCayYJCeYIHrfKZN9jYydGI5lC6gNORUOnHm5TPSnyvX+USjIYA/i51oCeAbIT7WYi8qUGtPpaZn2Quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPmoX+4s/u+OuGfu7XB3qwrOFAaaYZypgOrJaH/07vU=;
 b=bZPLK5XAjNTxFNRKOyWgtgJhC+8GCP/lbTFc6rvA6kCx+Gq+Fh9dPXrvNHTmxNOssYJersqhzSDOpzwXrvtY2n/qgIZC/wHmOuSmo2j3cfDb9jDzeH80j2FaTZKwQf10R7SVtXiyAcbyDWUsXfg55js9Bjey1Ml5z5SVhCSo1UI=
Date: Tue, 25 May 2021 16:14:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH 2/3] firmware/shim: drop XEN_CONFIG_EXPERT uses
Message-ID: <YK0GUBthlbzoNIK/@Air-de-Roger>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <56bb5e87-fe35-75a8-fe18-ecc959b21799@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56bb5e87-fe35-75a8-fe18-ecc959b21799@suse.com>
X-ClientProxiedBy: MRXP264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47db607-113a-44b2-be4d-08d91f8772c4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4219:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4219CA033481009A5B1C9C978F259@DM6PR03MB4219.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TkwSXkNjEnQzreyIypgqhKVHfBjj7X5rRhKqJLJqDvR8ysUPyJYztFPLSxWBYZbNlJB3lh4IwSPY3AzM7DUEAPHNMla9nhyEZ+LO0f6dzA/ygeF9cSf7tKI5tazcbzp1p6OgHAMLEog6FuHR3bKom2Q52aV4A+R/ShVhPnwWgTgYEVHcB0kcEhYhsYMhyaFX5/6yhCVSroVxpGmU0Q4ArQ8gXeelijKF7o/lMfEOiOV3/V/PID06ErMgAdC9u44oHISIYro4wwad1qv5PPwmCDN/D3yAKOnXGGXmw7doox+oIDfS0a4DfoEY5JNm+DZ4/G8X5+rj2L7jTn/fyLgJeqOgVpID6MN78c25QrgD1AoN1GM3Dq+vA3q51hkgNJtAf5kppgvt+97hr2Q8WYf+UVlVojoYN/q1WjFUeweN9CB9okAid5d8LMkeqTCbCuEUTOPZnPlxXgCQ7qQ1fuf8Wc1o3kvk45SUhpaGusQjnTRg0Xj5TgyKaaQlEh00UjOle2J3ACvYyTkZ36+ijJQ0IsWnufH1AxRyU/MvUrH4O+kMqKYlwJWBxxjXEbOFOKF49smSDXkUe0h2AqE8lIot+f7bc0fjcktRhQykXfXSvZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(39860400002)(346002)(376002)(136003)(66946007)(26005)(86362001)(956004)(33716001)(4744005)(66556008)(4326008)(5660300002)(6486002)(38100700002)(66476007)(2906002)(9686003)(186003)(8936002)(6496006)(54906003)(6916009)(85182001)(478600001)(316002)(6666004)(16526019)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjEwWGw5TjRIa1I1WFRLNHRBWHczVHI5UGE0YjBIMzFHU2trTVI5U28xZlNl?=
 =?utf-8?B?eEpDR2VQL0RzYkNqTExRd0lyTXB6b3RnUXk0NGFmRGRqNVp5WlRxSFJ6cjlU?=
 =?utf-8?B?azJJWGRSa3ZMMlpCTnRMdFlQNmhIaGhsZUZDZTg1L2w3NlFXUnpUcXhlaVY5?=
 =?utf-8?B?cU1NbFlPM3l4a044OWl5WER2WENJaVg2THB3R2w1OThBYS9NcllHTG1MQ3Ru?=
 =?utf-8?B?MTZCbWpQMDdacXVOd1BQLzZxQ0ZyL0FmYTdRUnduTUJ6eVFWOFNjU0V1bDZ6?=
 =?utf-8?B?Mys0RGIycEwzV0FEZVk3R2FaTXBqSnlpVFRBNWYwaGQwY2xMNXF5Q1pYOWFU?=
 =?utf-8?B?dC9keUNDNk9UODdmREVEVUJraFlQSWNjV2JjR25DSjdDbXg3bG8zT0hzbW5s?=
 =?utf-8?B?K0QzSE5HbzFtVFFvVCtPaFBaMk55d1NUNGRUQ3ZWMXdtMHRNWm9xaXVJNDRF?=
 =?utf-8?B?OUc1OGVJL3VoRUNiV0FBN2hCUHgxR1U3SThnWlhjTmFwbVFWOFVnMXQzYVov?=
 =?utf-8?B?ZmNNelNlY3V3NzN6RlRzMHZlMlF4bkdNZ3Z1U3ExREoydzBzV1ZzYjUyL2ZZ?=
 =?utf-8?B?SGNkZDBJR0lJMEk3WkZFcWhZZmhpRnFGWkNGbm95cmxXSmV3eVhHSHhEUFlv?=
 =?utf-8?B?MlFLNitVOWdDaEZ5OVVTT2tsSEtUZWE5L2R1T0lqR2NaOEVxTVZuNDhUYk9F?=
 =?utf-8?B?cVNqOEtVTzNhUGFOVjRrakhXLytCRGJvRi9RcDhkbGw4VDdIM1Voc1FWUThN?=
 =?utf-8?B?RTVSd3YvT2d6UnJjNnE4bnVvMmJEZlU3UkYvR0hVdjZXbWEydUdPTVo3bUZE?=
 =?utf-8?B?akdPYUJUN3Jwb0JYUmtERCt1Sk8rRUtPSVNmRUx6dmllektlQzk5QTBseEhW?=
 =?utf-8?B?cEJVK2ljVk9NWXBUUGpvNE1JUTVrZnNlT2FZK0FXRG1PMXBnVXNDcW84T2Zy?=
 =?utf-8?B?akdib085UTFGNXRwWWpiSGdzTmNUb2J5Q1cyem94aFNHd1M4NmFlVUg3NjVJ?=
 =?utf-8?B?Yi9OMUltRjJhQVRqM3d3ckxZSDdXdXBKSHp3OVk4WGVOaTU2dXZaN0lnTFB0?=
 =?utf-8?B?TEVoaVN5K01pdTAzS0wydGdsRGpScmNBTHorNStIaDJZVXdFaGRxVlgwS25F?=
 =?utf-8?B?MmViNTN3L2ZyVlRsUmR0VUJBSTFXbDEyUnJJbkwyY1F0N1N5TFNWSGt5cEY2?=
 =?utf-8?B?Ny81a1A2U3ozV1B6eitraWtoL1VIcmdRQllaUmw3S3VzYUFyenpKK2NlQmtE?=
 =?utf-8?B?WFF6UDJDVjJCM0d3ZlhFYUkvTWQ3UHZBTjZOWXhOZ3ZYTlNpVXFDWlpFeFZY?=
 =?utf-8?B?U3BPekVob01pODFRMXpIZ1VwNDR6UzlMdzB3U3ZMdElwSktmNGFqTG5WYmxY?=
 =?utf-8?B?YmdTalU3VjIvU29jVEFlaHpxdCtMSHNRR3dyT2VvbDhxVmg2RlNGUzE5MldT?=
 =?utf-8?B?c3VRNE1yRGVQSENOaXh2K2krSUJKMGt3MHhKVmN2ODZrSnBBZTVNeGVzVW9D?=
 =?utf-8?B?bHpUTHF4VmR2TTBOQU1ndHI5cjFLNyt2ZjVUUEcxVUJMRlVTMVQ2Y2NqcFN3?=
 =?utf-8?B?ZjZKdEthUFo4YzNnbHFPVWpMbC9qeU1TU2wzVHh1bE9MSlIvYmQzOFBqQkhP?=
 =?utf-8?B?bVVJK2ZTZno4eDBPMVJqTmIySjRuV2QxNXg4MWQ0eXNsRlVWNDFBWkhKWlI1?=
 =?utf-8?B?NXdQOGZna0U0Vm1CTjVIR1lQRS9MRjRQeERveG83ZzFkVENaNmpEcWRyRkdB?=
 =?utf-8?Q?up0H6gLrOIN3E1hPC5ZYG/wevrUC+mCc6Fl+kNI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b47db607-113a-44b2-be4d-08d91f8772c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 14:14:45.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVSorH2TrL72Bcl60egR6Dj2SwTJ6grNha7VIry+qIdp6D2L5qpgpSZPhueK7SCNF+usBefv3w/Acpyl5Ipr9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4219
X-OriginatorOrg: citrix.com

On Fri, Apr 30, 2021 at 04:44:21PM +0200, Jan Beulich wrote:
> As of commit d155e4aef35c ("xen: Allow EXPERT mode to be selected from
> the menuconfig directly") EXPERT is a regular config option.

Might be worth mentioning that the default pvshim config already have
EXPERT selected.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <rogerpau@citrix.com>

Thanks, Roger.

