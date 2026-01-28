Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nn5Fhn5eWkE1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:55:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD77A0E61
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215547.1525714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl488-0006y9-7t; Wed, 28 Jan 2026 11:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215547.1525714; Wed, 28 Jan 2026 11:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl488-0006vG-52; Wed, 28 Jan 2026 11:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1215547;
 Wed, 28 Jan 2026 11:54:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl486-0006ul-Li
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:54:38 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb0951e-fc40-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:54:33 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB6007.namprd03.prod.outlook.com (2603:10b6:208:31a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 11:54:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:54:29 +0000
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
X-Inumbo-ID: 1bb0951e-fc40-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZPWpCRtaX/EfAGKbPWZmCNsU2vhh6oyVHiFe333nNBAXO/ae0udbJji7fXyYmHORkuQexTu82G70Z08xEvCUGrb3yFlSph2aR/ymT5dYt9i88a2OwB0KQPfa0nQdT39gioCPUUZP4OJErN1N413VN10Cfc/EdsgYonhvIxU9JYjJST1PIbehxp14iT4d709tZODDFNfexYvx3aUJdWtFuh6gbgGsNMjEeDUxerDpiRqgQMfv42iTaozla++Ihzdl91cOyYFuTfb2DFQBfIKCLTFd3AxJ1r6jDRHi021xQRDcX60xDfyY9P2ZnYPO3ULDuP0fyoUeoUWoJ51/AU+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g34bGOa3m840N64Ln1MeYtZ3Vit5X0stVySF50CdSH4=;
 b=POvTSOukIPyU1QqxwvfCckvzmqhF8sb5dWHGLgZiT1MughdWqv0mt5OQyRZu7Jiki+MYb2A/8B1uBNLKLSa0Y5ioxpPi0DCpoI8DKbLSaDDHqdctR3J/Pk9UcPXcQildEjATr+iT8YMP9xEInSAOHIkXqmLS8f3gSF1Rfa7IX/VbWEZTL5OrC6ViDm3CfseufCnk4EEvXbuyPZau8u+G0VL//Z7pjvswhMeePWEjjf8/UTEBaEA1fDaN9JjopxTyfTmj4zQQpp3rYppaBf01yWpvXLqTQdp5KDe0I+jzes9PasCvr25NsLpfHBx4HVcjhP3GmN2sCuMWwdE5gtci9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g34bGOa3m840N64Ln1MeYtZ3Vit5X0stVySF50CdSH4=;
 b=xFxTm3ubqPyyzI6bU/dby9IozstYParbvRfUQZgIAKaj8WKSigGTksIRn/TsFFLO5rLStKmSdwwo0nnShUl8sxn8O/vDfmHeK6eOWql04IcuvPDNVd5+IMN3e/gTUJTVwqLGpsCXoZMN0Nr5cE5x8pUOGcUyLqIl00YnXQpARHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 12:54:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon
 target for dom0
Message-ID: <aXn48ZiOucpu61CY@Mac.lan>
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-3-roger.pau@citrix.com>
 <596b08db-dc0e-4d42-ac17-570ca6e06bca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <596b08db-dc0e-4d42-ac17-570ca6e06bca@suse.com>
X-ClientProxiedBy: MR1P264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: a07e9891-d182-42a4-1d1f-08de5e63fe57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTRmU2NXZjUwc0V3NzRpa291VTF0ZmFhVTJTMUQ1QkxrTGk5Smk0SldEVkJ2?=
 =?utf-8?B?ekF5R1cvWTIwemdwSm9aTlUyajYrQ3RUZVZsOHdaYkRDL3FTdko5V3FQRGdO?=
 =?utf-8?B?QTlTSHNRRGVoL3pIT2dPKzhjeGFCVUU1MjB5L2N5bno1ZlVxSEFrSS9wMUsr?=
 =?utf-8?B?QVYvYm9EWkM2WTAwMDArNWdnajJrODl5cm5Mb2p0azI1bVVnTmVTNmxxRWdQ?=
 =?utf-8?B?QisxNCt5RTZYU0VuSFpXWFZHcUJFdlljTjFsNzREa0JBNnp6S3hLVWVDVVVs?=
 =?utf-8?B?OU9vUTBRY2s2Q3hCQTlvY1lhT1RJM0VmN3NLeUZnM1RNMTlYNHcxclhQRXhx?=
 =?utf-8?B?VFllaGt3ME8wQzZtR2Y0OFBFSHVoQVFCV0xsUkxBRCs0SjNoVnBtMmlHdTJF?=
 =?utf-8?B?RXgrS0V1ZW5iSzZSSmtqNjBsbENudHN4eEFMRHlzNzlkUjFuMDNSNDJiclN2?=
 =?utf-8?B?YVNIOEV5eklrTXFUdEltbi9zcWZSZ3R4bWx0QU1EU0lMVjFMMnZmblZhOUpv?=
 =?utf-8?B?bjE5R3Fwa3JHdWRzY1BaSnFrNTUwbXQ0NW0vQm1ic0JCV3FWSnF4R1dHOS9T?=
 =?utf-8?B?RTFvREpEYi9zWm1DV2svdW42eUFMdisxeG5ycUgybjIrdEdEbm1waUxneXNJ?=
 =?utf-8?B?Nkg5SjBjQUZVR2hETE90TmtPbGtRU3JnR0VRbUFZLy9MTlpWMDJYMk1hKzRr?=
 =?utf-8?B?bXFtODBiaFhCUEhkWXkrUU96UVBaZk1Wc2FucURPMVpTSnl2VG1aRk1LTDJv?=
 =?utf-8?B?aHQ1cHcxUThvZHhQdDNmZmlSYjNpekxreHgvVlZXaDJXNnFaeW5pc2w0Um01?=
 =?utf-8?B?ait0WWVNVThNTjdQTHV0V3ZJNU43ekxReThtZ0lwbDRjQllYbXVoWXlKaERj?=
 =?utf-8?B?SVlVQ3hMazRISmFnL2dnMWVpbi9MVU1ncU13TlJCancyOVB2SFZLbXQ2b05T?=
 =?utf-8?B?amJBVkExUjRQdjNQMXJkUHIyVEo3cThHRXZlUXJQRG1tcFZXclBlbC81TkNY?=
 =?utf-8?B?M2xjUTdMVmxSR3laT3hRUjMxWEhzVllmTy9aRWpFTkQya2M2ZTVWS3oxVU1y?=
 =?utf-8?B?KzV2OHE0N3FHS2s1NFJnMldYdU9RZG5aYm9IYitTYkhjU0VRUDBKZFNVU3Av?=
 =?utf-8?B?YTdxZGE0RmFQZmdsMk9wbGJhdzl4YnF0MDE2ZGsyMjlPdG9scjVHRXB6TXJQ?=
 =?utf-8?B?TFZady94ZFpWQ1J4SExvV3VYV2Z4VGtCb01vV2FYN282QXVRcTZodnJ1MjZM?=
 =?utf-8?B?Yy9uMjI3TFh5U1lQN0hIVGJGZEMzZHZNQ3ZhTFMvQUNOT1JXSThlS1luLzhn?=
 =?utf-8?B?Z2g4VTdKY3krZG1uQ3BUUFpienMyTTg5cFVHdmVocTVsckJVS2ZJeENtSWF6?=
 =?utf-8?B?NG9nZmFUR1dXcUtIM3UzdUdtR0N1SmxpNHB3dHM5T2FMMW90TzNxdWJHMlgy?=
 =?utf-8?B?SUdDY0E5cGVrNjdVbm9Ga0E3ZzNvTk1zQVl3V1BxaWpkMlc2blNKMXpQUGI3?=
 =?utf-8?B?YzlrVm9QNFNVdC9maXFlVzNoc2hqclhxeTIrK05jU211Q1JSbEZ3d2FaNVlQ?=
 =?utf-8?B?TUVjczRkNWFKTnZITENEaTBzSTB5Z1hMWXVYT1ZTb1hSZnB6L1VtemN3WGxC?=
 =?utf-8?B?QW1UdXhIN1RYT3RGMmFPdEhPc1RBMGJHVXZCaDlEOG5hYnI2Nk5lV0tkWS9C?=
 =?utf-8?B?UW54YWJLZ0pJSEFqaCtrd1dnT3psR3pxMDM4N1hYVm1aakNwVlpPdk9NaWtj?=
 =?utf-8?B?UjVZVVZDdTVnejJYZXNNYnQ3SGVGM3dYcGJ1Uk1wQ25UQW01YU5xbUo2RG9z?=
 =?utf-8?B?dExWMGxGZHFRbm1KVE9zS05FVnR3d2VzcldqbEViQS9GcFFBaDljZzZ3ekF1?=
 =?utf-8?B?MnM4TFYzWVB2VHpNMTVWT0orY0RBTEdqYlp4djIvcVNkc2tGYitTYWlFK2FK?=
 =?utf-8?B?bkZsd2lNNmZxd0VnSFVia00yTHlLK3hYWUY2WHhBTG15Umw2M1ErMWo5Qm5z?=
 =?utf-8?B?ajdKeEc5NlFDMmlMRzl5eTI0eUVzc2FqdDFVUVN0L1NYNHVDUmNZdnljeVgx?=
 =?utf-8?B?VFFsNVJYUDdBWkV5djdJUnhwbDl5Y2l1RHByMHZtZmd0a2drRUV6WE40Z1BP?=
 =?utf-8?Q?MzDc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTFxZFpGUSt5bG1UQlNSaGtBQUEyTHpWZ01OYjJwT0FIdzM0MnQzNkoxSlZH?=
 =?utf-8?B?bnM1ZFovOFpCQlN0NEx5M2cvK0FuSnpibEZvVnpVNEpDdFhuMFdjUW5iSXc0?=
 =?utf-8?B?UkFtTXdPaUY1QzhPdkpoM1FVK2RoOGlxM3pMcHF3WnVLUnN3UWNTZ3ZSK3dD?=
 =?utf-8?B?Q2Nrc2Vza1NURktkbnBMRllDS0RwV2dpZnhVQU4zbWJ5eERacmp2dlJ1Mm4z?=
 =?utf-8?B?UmlVOEdRUDZid1lEbjBSL0wrOUpNQi8wTGpKbjhEM2syUHRWZkswckYzcU9G?=
 =?utf-8?B?WUFOb3lkRWMrUzRHMUIvYWFkZHY2ZFBmZWRPaUFucnNqZEhKM1l4ME44Ym5R?=
 =?utf-8?B?VjlxbDF1NUVwaERwT1YxZzdXNVprY3BuaUtuVWV3SUE1SmRWTW1udnZqK1JS?=
 =?utf-8?B?RjNST3N0bGhiczI1cDRxYitESE1XNmM5QmdzRk9jdVM2ZjczcjdmK3BjUlFz?=
 =?utf-8?B?WFZsVFhVM1dEdjRWVjBVMGpOVU03TGRKTGZFNEROanZIWG1ESUhpcE5yQjkz?=
 =?utf-8?B?N2NYSmxnN0ZFZmE4S3dIYklTVXZuL1dtUlZKdVBudE5ESnl1SmRrbWFMZVcy?=
 =?utf-8?B?dysvaWxEUmZBVHFKOVptQ0huTWc5a2t5b0I2MWI3NGgxNDNpREpqNnFKRGds?=
 =?utf-8?B?L2ZkdkpZMFZpZCtxUVhubS9HOGlpbVlHRERvT3AwbFoydXBJRGFob0dGQlkx?=
 =?utf-8?B?UUZ6RVJBYitjNkU0MVB2bFhIejlZR3M1bkFlUS9uQTlrTlp1R01NaGc3dzVl?=
 =?utf-8?B?cmZ6L0gzbzEwTkdNbkZXdHkrRzVYb0paUFhaVDlCakRqSUJHZGJHUllaTGI5?=
 =?utf-8?B?aGtpOEplRXhKTExGVkRxZi80cTM0RWJXdVdLY2lpdGo5a3o5R1gzRG5nc1Q1?=
 =?utf-8?B?Vk51aEMzZHhlakFRUUpVMkFDdFJlTmI3QUhobm9FU2V3bzMvb2xkampPVEZ6?=
 =?utf-8?B?VHhOSW41TTJKYlpPQi9KN3hDZzB5anQ5ZGJ2cGliSVRDZ2xZcFFqR2VGMisv?=
 =?utf-8?B?UzhMNzFhN3R4cFhZMWdwK2VLK3R6WXY0SzhrRXg4TU95d0l1cElHbDlFdzh1?=
 =?utf-8?B?Mnhpc0k0Z1BEbmtQd3ZqWWVXc3Z5bnIwOWxaRHJIMW41NTYrWE9kQ1gzVGo1?=
 =?utf-8?B?VFRKalBWUmdCNm1rbEJxNnBiN1ZsNUxCanNXU2wvTEYvUzZGakpEZTRsZm9v?=
 =?utf-8?B?bnN0WFI2bmIrUEkya3E5Kzk2b1dkd1A2WStzcXpCeTgzNnVhMUFrT01PWEdN?=
 =?utf-8?B?emhpYVF5YWxjTnd6N2xubUE1ekN2M0lpdDhYdEJ6OVZxRCsyTjc1NEpzemkz?=
 =?utf-8?B?bWRKbzJ6S0lieWVSamExWEptdi9MTkJwQkhBLytORTZzYkhiYzJjR2tPMVZJ?=
 =?utf-8?B?ZmxBUEl0RHM5dkdaeTZ6OWRBTzBhclJUNjRiMDdlRUxoL2NSeVBsR2E2Z2tX?=
 =?utf-8?B?aW94OEI2c0JJSHhub1d2ekdoZXk4NFBMWXJ3d2ExU2JyckFpZXRlN1RQakEz?=
 =?utf-8?B?UlpSMnlDQVJJYmhwTEVHOHh6d2VCbWx6Q1M4MW5mWEI5QW96MDJzbDRNOCtU?=
 =?utf-8?B?NWNualQ4K3I0ZE5DYUo3OVJ5cGNWck9XYnlzK0tBNjNkOEhKMU9DTnR1VGh2?=
 =?utf-8?B?d3lTRVo0TzQxUFp4c2FVcGpVSWpBTVNpQ2FFSkQ5dkJUQzdUYWJSMG1tM3RE?=
 =?utf-8?B?cFRoNU5ESkxtTWsyMVJNY010cTRRRGhrdno1WkJiSWlqTHY2aWZlL05BckFo?=
 =?utf-8?B?MHBwMjJ2dkFBYm4xQzBSY1hpWmRTdWVKUnNzSlV6NzZyZ1R5WTZmTXZ0WThM?=
 =?utf-8?B?bTdBMmpzYUZPKzZJMzd3MDhhWFJKdkZyTUJPWW54U2lDOUE4QVUvd2sxSjZ1?=
 =?utf-8?B?OTlKZDZQYmpOZktIUC9haG8vZTBhclo0N1d3c0JVazNzSk45Q0NHS3FpMUVJ?=
 =?utf-8?B?TWl1bDBjL29sOHFxaGpOQ1B2dnBWenByTkNvS1hCSGF6Y1ppeXVaOWQyaHF4?=
 =?utf-8?B?a3lFYTM1SkRLRHF0cDMyL1hEYlFPVDEzQlFkUnplMkVhRFE2bktRZWNKTmpC?=
 =?utf-8?B?aDFMZVRQTjZnVUpzZWJQK0lIcldmdGM3NlVtSktYVUUrTGxWd3pWOTRMK1M3?=
 =?utf-8?B?T3kwT0FvQ0tWdHpxZGp1elBZUzA2UDc2aEYzZzVsOHRjNGhvVXhXQklBaXA0?=
 =?utf-8?B?SXowR05ZU2cwYmliR2Q4V01nVDBIZzd0UzNabjNFci9vdTh6aUREaktGcnZo?=
 =?utf-8?B?THJFZkVmRDZWZnRtYWZXeGNyL1RvZE5BeGs2Mk5qVEZCdGtSdHE2U2F3T1Fa?=
 =?utf-8?B?SkNUeW5BbUhacUtEUkg2WWdnZEp1SnZOZW1KdzFKUTFOb1lzTW9kdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07e9891-d182-42a4-1d1f-08de5e63fe57
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:54:29.7056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcAEecQKEIVSKPXgc78jCQbT81q0zaBY7eKkL6ph1jm045+/4nrd94uBq8o204mv4YpFIXk6GvrARXSYAbRWnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[192.237.175.120:from];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2603:10b6:610:24e::14:received,2a01:111:f403:c007::2:received,94.247.172.50:received];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6CD77A0E61
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:31:13PM +0100, Jürgen Groß wrote:
> On 28.01.26 12:05, Roger Pau Monne wrote:
> > The dom0 balloon target set by the toolstack is the value returned by
> > XENMEM_current_reservation.  Do the same in the kernel balloon driver and
> > set the current allocation to the value returned by
> > XENMEM_current_reservation.  On my test system this causes the kernel
> > balloon driver target to exactly match the value set by the toolstack in
> > xenstore.
> > 
> > Note this approach can be used by both PV and PVH dom0s, as the toolstack
> > always uses XENMEM_current_reservation to set the initial target regardless
> > of the dom0 type.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >   drivers/xen/balloon.c | 27 +++++++++++++++++----------
> >   1 file changed, 17 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> > index 8c44a25a7d2b..9b6531eb28b6 100644
> > --- a/drivers/xen/balloon.c
> > +++ b/drivers/xen/balloon.c
> > @@ -724,7 +724,8 @@ static int __init balloon_add_regions(void)
> >   static int __init balloon_init(void)
> >   {
> >   	struct task_struct *task;
> > -	unsigned long current_pages;
> > +	long current_pages = 0;
> > +	domid_t domid = DOMID_SELF;
> >   	int rc;
> >   	if (!xen_domain())
> > @@ -732,15 +733,21 @@ static int __init balloon_init(void)
> >   	pr_info("Initialising balloon driver\n");
> > -	if (xen_pv_domain()) {
> > -		if (xen_released_pages >= xen_start_info->nr_pages)
> > -			goto underflow;
> > -		current_pages = min(xen_start_info->nr_pages -
> > -		                    xen_released_pages, max_pfn);
> > -	} else {
> > -		if (xen_unpopulated_pages >= get_num_physpages())
> > -			goto underflow;
> > -		current_pages = get_num_physpages() - xen_unpopulated_pages;
> > +	if (xen_initial_domain())
> > +		current_pages = HYPERVISOR_memory_op(XENMEM_current_reservation,
> > +		                                     &domid);
> 
> Is there any specific reason why this should be limited to dom0?
> 
> I _think_ this should work for other domains, too.

Sadly it doesn't, I've already tested.  The value returned by
XENMEM_current_reservation on PV guests is slightly different than
what's in xen_start_info->nr_pages, which exactly what the toolstack
writes in xenstore.  I assume there's some other stuff that's
accounted for in d->tot_pages, but don't really know what I'm afraid.

And in the HVM/PVH case using XENMEM_current_reservation for domUs
would also take into account the Video memory, which skews the target.

This is the best I could do I'm afraid, at the expense of having so
many different way to fetch the information.

Thanks, Roger.

