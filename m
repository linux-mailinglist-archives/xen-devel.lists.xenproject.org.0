Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HX0DjKf52ml+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 18:00:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C643D107
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 18:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289154.1569358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDWf-0007w5-O9; Tue, 21 Apr 2026 16:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289154.1569358; Tue, 21 Apr 2026 16:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDWf-0007te-Kf; Tue, 21 Apr 2026 16:00:37 +0000
Received: by outflank-mailman (input) for mailman id 1289154;
 Tue, 21 Apr 2026 16:00:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFDWd-0007tV-Ny
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:00:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFDWd-00FC9m-4F
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 18:00:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e79f14-bab6-0a2a0a5309dd-0a2a45068e62-36
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 18:00:35 +0200
Received: from [52.101.53.57]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e79f21-7371-0a2a45060019-34653539d9b3-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 18:00:34 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7745.namprd03.prod.outlook.com (2603:10b6:610:243::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 16:00:31 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 16:00:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUn+o14qziw57VsQPhhN3jzr+lmLSkuQ6HXNAnxL7tFMY/qh8ffFfDc84P6j6ira3R9Br4gMaexkfo30ZS4RX+QLQVUIcwhoHBKRKGJCnF8wl5wtqV5vU0Fjcq+54uHa0lR5kHg/HWh+atfICh1xqLqTRzuGhlRRL3/1mjZ/xF5diAWmH3LTGKWAD48uSiU0q43saMWq+PF3cEgslaR/bStwFblUnR/zff5cLyg3PHWy/Rrnhi4j55X/JGdqTQM50U2HtGJdC3xgrSEwK4+LmNaMacnA1yMLONJxy9OA1KwDliYWGV6esaVAOSWwYm+ZxA8k+epMQNY4VAZlOZRfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcuE4DhWVgFQwYKSSn/LhiSzXgWL0NKT55XH9CJAbWQ=;
 b=i3k0T2SKLi01PYxYF/F81rrH7TH+c8NuIcRmfqGVQD+xox5hcTCmQ+bQChHiYrzKzDnQFVTSB5zYMCXBmiHdTS84UPvIsfZOlhciRd73oh9dTHo/t1KP74Fh5RBizbrNm9WU3pXToty875w2mt8TvoExPxIc5Ukjz9pZ2XDE6OTYbWbJj18PW5knOQht4ENVVZraUsNNclyaOHN6L7HPhG9rKKSASgDKE8TgRAiS6jwb5vhHlJidu8iHg5x5LJK4MdteiY6SRML/ID2tGxaJByStBqbFTVrEiESAb2QlBFfDbrVmmwPqfQguESsJyDQirVpbN7LtdaUXtsh4xqAYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcuE4DhWVgFQwYKSSn/LhiSzXgWL0NKT55XH9CJAbWQ=;
 b=NA4y99IzmSRQjwmXUilFV9Me7za3HOjxzHDka4wesyRqPJ1NA2/0nQ1wJSJz2fu2EbVzhc9o+pLkpnR1tpIkgCA54bF3E5tfBC/rAgiQT4WjvCvpFXCGqHn6JxPO9o5RPTkDQMlYmtAWW1Dy3MqyaqCEiXI7eR6FusrhdXfsuJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Apr 2026 18:00:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
Message-ID: <aeefGjsN0EAVsvxp@macbook.local>
References: <20260421153224.36368-1-roger.pau@citrix.com>
 <1776787083.8631fc262581453bbf619ec5b2062170.19db0c3520e000f373@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1776787083.8631fc262581453bbf619ec5b2062170.19db0c3520e000f373@vates.tech>
X-ClientProxiedBy: MR1P264CA0216.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 355c37c0-ebeb-4467-eeec-08de9fbf1d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4tMMIGIQvWlvg0qRXCfdglKvWx4RqOOj7hIY1Xc0MDAY6o694rMnuL6y4Rb21ATF7eY/rAkSNNGfRGY2tceBGkP7GQCwtCLcTg2bhmtbHE12582fQNo4INUyqN+iSQo4ovOMNlHOccEt90o3eY60RfGUJtBQ0VKasQ/irynK9Bdj/S9+XP/bSPsmKjGQB8jzz2N++8IYNeJ0pZ1gWLcsMkzPJLrt5KuW3ZgLigcEF/0gl2ClUkzZYk1sG9JRomPIEuF4Wc3EaZe7lE5P68BmUoBJAABoMNocthqptUpUVrA7eAdknytc2rewB1Diu7TtnLx56DT5pnVwHlJLB5ACyJWVSi6yk08PGvG7QZfoC1a5TnUc4T199/LiQlvQIleVPnkGOER7ZGEezAMvvh7Hc8is5Vw0jX6UnyYx8s9urnmQSKuK4aK5IKc62kutk4kqpXXUnmjq0DNdUoySrjknJaXQ2HNnMDbLaRE9QPbs2dSbL5KiyfeXJLBetiV0R+/UDJgmvuuWrsmdbCuLFTfLlKl58AVOIN0TMFcTLKPQlNVbASFVadlwLXAqK31jfWpniofHpvtqDSRjsS35Mc6p93ihI7jA36INnF3NihEVhZpCtNV/Zx1FUldubccu0azFr676Zm7ft19gcXAzdPoToEoCLTQE3zVoX2ukU9PT0+aW4fm7g+LGhNAsp+nu7f84
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjRSemViSkd6cnRPTDdoeXY5Tm9rNENmTUpWVVBPamRoem0wdEpzc2xUZlZS?=
 =?utf-8?B?TjdQRkg4eTJmNk1HUGcwblRhUUxGRE1vSEROdDZTalNHczNLN3o3bC80VFVl?=
 =?utf-8?B?M0V5V3h1MThiU2hZYk14QzVQY0xUZS9Nc2sxaDdxL1EwdmxscFNpaXJNV2xY?=
 =?utf-8?B?bWlTSEFJOHFOMEZ1YkZ2RXFlcFJQb0FiSWZObHdqL0J6ZDZaSDJPdis4TUxt?=
 =?utf-8?B?Qk9DakUrZHpDdWNtaGVrVG0wZHZYNFlIUWt0cGE4YlpHVG1PcFA5Y1QyQlN3?=
 =?utf-8?B?blFGa1M5WXI4WnFMWGFzZGhNTEdzVmp0UVNNR3QwYnNSNnJVcmFSUUVHK3hX?=
 =?utf-8?B?L2RvaHVqYVh0Uk5OS21kdmpCbFhUSERCbU5sem50WjVuWGMvWUZ5Vm9tZEdr?=
 =?utf-8?B?TUwxUlp6cldTOGY1QmhuMlhzN3BLQjRkQUQwai9Pa1JvUk14RUcvRDEwdk1E?=
 =?utf-8?B?RXFpQVZwWTNPOG9VRVRxRUpWMFNpSlQ5dmU2M3RIRVZoZFpCMWNVVVdmRktU?=
 =?utf-8?B?Nk9wRmM5N2lkdGFLczZxWGl5LzBrNGRaQjJvUjlCTW9Hdm1TbW5Henk4S0FG?=
 =?utf-8?B?dXhvczN5UU1NNkFhWU1WZjZSL2xqTnlwNlVEcGxUejliaUNBcS9vUE1QOHZu?=
 =?utf-8?B?cTN0TjQ0SHU4UkFEcDZldGQ3WEwrUUpPenkwSXVFTktpRGJTRW5ZSitYUkcw?=
 =?utf-8?B?QUliU1F2dE5ZK25YbEFmS0J2V0ZHZ2pYSHNYOHEraDU3QU51RzMyNmh6UWxX?=
 =?utf-8?B?SGs0ZVk1ZFZNbjFLdk5aRFlycER2dWYxOGJUYmU0Yy9mSjdBUHdQdGJnSFpi?=
 =?utf-8?B?WWNzaVR5WnVVOUlHTUhodWxCbFpoWE40eWxOeUM2Y0g2THVvRlFjQ1paSDBR?=
 =?utf-8?B?NjMzNUo4dUtueFhNbSttUnNTMG5KNmIvcFArMWd5UzRXQUpmU0QxbTBKUUJW?=
 =?utf-8?B?cHFzR1lGUi90Um9yLzUvNVE1WFpSbFp0dXF2N2Mxd2dHUG94di9JYmpnZTVD?=
 =?utf-8?B?UW4yanRpUDk2VEJvVmsrd2xKbG05ZnQ1M0FuU2pmek1LYnBBeDVhcmpheWky?=
 =?utf-8?B?RWorT0kzbVUrQnpieG5UaE8rZTZ4bXVsZ2RmUmJDUkdLVEJVZmtoNjd3S1Iz?=
 =?utf-8?B?aHhhWEdlOGdtL1IwWmp5cHg2WVRGRHdWUG1MUWVJemNQWDJsRmMrVUV5bVZG?=
 =?utf-8?B?TXFJaldWSHVsU0xCYngwVWRMRW80cnpMVDFOeXNRVVN6Qy94dGFSNEJGNHBE?=
 =?utf-8?B?aFN0NzJUT2ZvNU0yUm5WNmpHRzRzcWM1YTF2TSsvV1FpaTArOFlhNHlXZlNJ?=
 =?utf-8?B?dUdCZldUMG1yb01TMlJQMXlDQ0p2REhnMVh1Y3kxSTBYNUpNYjlCTHkzVHZS?=
 =?utf-8?B?WDIreEY0YXEwN2p4UlBUM3FTUDh3ZlpqUGVwVzU1SGJ6cmFtNHJGeVpnYlF6?=
 =?utf-8?B?dFBVSVFkQjZkcVd5Zis2SFBkb29yZDFTdmI4a1N3VXFoS1c1Rk1kcHlkNnJv?=
 =?utf-8?B?NHA0bVIrQkpRVEdNcWNrTUNVMkF4TEVpaWNGcEFIN3htVEVxMUZidTV0TFRp?=
 =?utf-8?B?Szgycnpoc1RGSHJ2WWpFMmNiYU5mazJwb0diejJmVi9KelpzTjFLcE5xV09N?=
 =?utf-8?B?VU9pRnJreHZ4WitHT1BPUDRCUngzTGJVTjdWZU1ZNW9kdFFMYU1WcFhCZFFK?=
 =?utf-8?B?ZFo0VnNhU1crcHNkZ3ZKTVI2MVVYcjZzbDNlRDJ5NnpzYmJOb2xJbWlXdm1o?=
 =?utf-8?B?NXJRY1JPeE1wczIyaEZEYTF3aVJ1d1BaZ01xYm03STBvKzgyVUVKSWtGclFL?=
 =?utf-8?B?dVNVMHRvZmxrRjl3UWhwemtRVWljcHArZlhQREVONWFwbWxJYysyMnpzZU1N?=
 =?utf-8?B?WEdseEV0Qk41dTQ3YmpPU3RlN0hURkh1SjloUDB3V05FdHlCdEYvTjgzNXlz?=
 =?utf-8?B?WGFwTUU4dml6Z2hZbUl2NXJNRk8rZTVvMC95Sml2M09JK1lOTCtBbjVLS0RK?=
 =?utf-8?B?SEFxenBManFJcjdYcWJKYnhIOUhZQkJGdlc5TW5GbWVpNndXYXRoMkEwbGZU?=
 =?utf-8?B?RjN4OEZwc1NwS3RlUHpXS2U2VFcyeWYzZjhlZzByYjVGNkdCcU9LekUweTFJ?=
 =?utf-8?B?M2RPZkVaeGhJem1hVUZXaVdOL29TSmtxL0VMZURNNEtoNEhtb1hTajNjNDY2?=
 =?utf-8?B?VFVycGJlYkdNbXBUcGx6MmhlWmF2dUh5dElQM2d4Uy9RY0o0dVlscHpKMkxx?=
 =?utf-8?B?MzN1dnhkbE1mQTdZRDdqbGk4REFaMGVUUTVVR1ZZelN1bUtKMTdSZDlwTnM4?=
 =?utf-8?B?QXh0Ry94S2REcHdvTnNpM3JmamJuQWxQMTNUaGJYVHRkd1I2dElEQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355c37c0-ebeb-4467-eeec-08de9fbf1d09
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 16:00:31.0756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8MeiTK+Se2eU27vuYtQVYvbFXeDogv6sz2B9eUh7+OJmibabd99kaR0bFdCNmciKJ+n2Z2C2qf4/N6NHplC4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7745
X-purgate-ID: tlsNG-16d1c6/1776787234-91D83D75-A8E38BEC/0/0
X-purgate-type: clean
X-purgate-size: 1285
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D9C643D107
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 05:58:02PM +0200, Teddy Astie wrote:
> Le 21/04/2026 à 17:36, Roger Pau Monne a écrit :
> > ENODATA is not defined on FreeBSD:
> > 
> > xenpm.c:1380:17: error: use of undeclared identifier 'ENODATA'
> >   1380 |         errno = ENODATA;
> >        |                 ^
> > 1 error generated.
> > 
> > Fixes: edb657887a60 ("xenpm: Add get-core-temp subcommand")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >   tools/misc/xenpm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> > index 87107bd6c617..ecb39c911d84 100644
> > --- a/tools/misc/xenpm.c
> > +++ b/tools/misc/xenpm.c
> > @@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *te
> >       {
> >       case 0:
> >           /* This CPU isn't online or can't query this MSR */
> > -        errno = ENODATA;
> > +        errno = ENODEV;
> >           return -1;
> >   
> >       case 1:
> 
> I wasn't aware ENODATA wasn't available on some BSDs. Even though it's 
> supposed to be a part of POSIX.

Not in the last version I think?

https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/errno.h.html

Regards, Roger.

