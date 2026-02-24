Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICP3Gh6InWnBQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:14:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE2185F93
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239850.1541264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqN4-0001kL-GX; Tue, 24 Feb 2026 11:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239850.1541264; Tue, 24 Feb 2026 11:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqN4-0001ip-Dj; Tue, 24 Feb 2026 11:14:30 +0000
Received: by outflank-mailman (input) for mailman id 1239850;
 Tue, 24 Feb 2026 11:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vuqN2-0001ib-FJ
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:14:28 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f845775a-1171-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 12:14:22 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH7PR03MB7954.namprd03.prod.outlook.com (2603:10b6:610:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:14:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 11:14:19 +0000
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
X-Inumbo-ID: f845775a-1171-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrGqf2GMwdzAuZTjjgCayWvUDyEmv+x1zTvHVSGUkJKuv/4PcANB0Bork3xM8xokz2OikdfcgGD7UCAZJus995syhShCZU432t4LSEPhbbacOWHfcfG4U8k5FykeeBQG/HEgPn/jBPHkOEbXFFbSsEucyHufc9QQ9UYJd68ApBSbI8qT5pKDMFKCLdRBA1CubDjLOnhzK78/CB4HhxBNbLzMp6B3knQbtWXpiPF1VW7R9AiHfkeOsQPQoKsrpyKhwa4vR/ZCXL+QUUJmiUhMIEyWz2ld8ees219og8lILBluKk9YkaIQGbnjM3OulKT8DvnX7G1z9S0hjn+y5bL+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsGmmv6YNYndQB1jx4xcYBYgq16FvSjljFZ0bE9ntag=;
 b=uUUsOSJTfF5arFnQ98H5kOYo9DkfCDmjGOZtZURWqd8GdVJbvoRpnK3P80eU+6hqK0hbuFvn0DOBQEqlDa4NRD7hxC74TgPkSmIRxqs0CBIVCv5Si+XdEu808HqER8dn3ZS4dCSyubA3gKKv04EZ6kcUVFVT0kwh7SkM5NI7mBgKt9QJ/dsSq+YZvYGhEAmUimIQ06qdtE9ucOyjgpWpyDc2ndONZIUcjXcCH+jrTDbxNXYePOKVSh7iGk0Zownrg0up/6CAdc/UptG1uNVI9YrVO+NNUXcDDInIamlbeXjflsfMrsR2cHSIE6sp+NP5Iz63FBIhKiScDUAq9eld2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsGmmv6YNYndQB1jx4xcYBYgq16FvSjljFZ0bE9ntag=;
 b=KCPtQE+GaZ8ESaDso+PsLU6OAO2HeWUiLrHgqYMCwVG2qc6mBwBRcIztB64c/uouCqXFUgbuYumySYwcwZXZFuVmqXxek1+FXaKRKOsjQtRXHR3cg3jMyZb+eHK5h6zxXXdhmlTyEN2ciAKQT4nrnkYhwlnB+VRJg5K9pq+v4lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Feb 2026 12:14:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
Message-ID: <aZ2IB9gBo_DrZLSf@macbook.local>
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
X-ClientProxiedBy: MR1P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH7PR03MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3a66e8-4566-47eb-6dd5-08de7395dadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TENSQ255clg0dlcyTTR3M0NPNjJJbmZmbnlzRmYwS00wMXhUNUs4aTlOODhU?=
 =?utf-8?B?c24rMmw2dE5HZC9NTVkvUlRHZkd0dTA2TjZWTzdQSjdlR3pTRFdiYzFGcnND?=
 =?utf-8?B?RTdxcFZBdlF3K0dRUisxUTFhNHB5NjdJdVdBTWF4bnRaNXVlM0Q5cmtBWVlG?=
 =?utf-8?B?SG10Y0lYK3hYQTk5K2dodjkrZUhSTmdVdHhTOEQyNmNTMjZTY2lJLzVraTFw?=
 =?utf-8?B?TVpWL3YzblROY3JpamVlRzY3b2ZMVEtyQjFWVm1vbFdXMGUxTUdOMVc0aWxy?=
 =?utf-8?B?bjFqWmxWUlIrNWVFQWh4UGFzcCtRRmRnV04wMU9nTFk4bEM4Tjg5ZFZnRDQ2?=
 =?utf-8?B?aGpFellvMXRRT3hVRjZyOHQ0ZjRQZ1E1VUJ3TlJ6L0hJcWRaV3IvT3BvcWx0?=
 =?utf-8?B?YnFVWG5WcUJ6SHRmQ09qMkRDTEVWaE1SSWlBcERQNG1GSUk3aEc0WlRDc1pw?=
 =?utf-8?B?Z2ZNVUpnY2VmM1Y3K29hSzZSTGZCV2lyNGJhZDhvR0p6ckhyTUhLZ0dXYSsv?=
 =?utf-8?B?VnVxRmlnRDJhRHFsaXNiemMydkFmSjFmalJ3OXlDVU01N1p5eU91b3prazJ5?=
 =?utf-8?B?NVlIQUFLYUtXNWE2UU94eUdkWGhNQUM2RkFVd2JtQS91SVRMbDNzNUhranRK?=
 =?utf-8?B?dXVRL3N3c2NZSjBMNlFzQ2ZKL2lFV2hXWVorRnVGNXYzZVVoV0cwZFhxY0Zu?=
 =?utf-8?B?SCtXbEVIa3czbkk1cmpDYVZUUU1VMjhjT3RJbjRTR00rVjFvbUlvSWNUWjFG?=
 =?utf-8?B?c2RET1BMTThEek5RaEhWaXRUcDZnVHZ4VjJBV1djMW9haEpNM1ZNZTVBWEdn?=
 =?utf-8?B?NEZGUXYrMFRLMU92VURnK0prZXl0T1pSekNkWmxtSEQzTjBmTlJ2TUhoUFd0?=
 =?utf-8?B?eHIwMWp6eEJrRzVXNVFLUkdUd0RwM0xjUEhzRTZJUUU0b2I0MVNMb2w4SlB5?=
 =?utf-8?B?eFV5VnpxZlFhVHczMGhoRkhIZkIyRFZUZEQ5cWtrTDlNM0oyNjZLVG9pY0Ja?=
 =?utf-8?B?MXFaQVczUENEVHFlaEdUb0tvL2Y4RitRZ0x5SytGUXd3SDZ3NVJyenhHdEIz?=
 =?utf-8?B?dlIwYjd5WHQ2aXFydXg2anFjNVR1SWQzMUQ1UE5SY3M1d2RjbmVvQ1JUUlk4?=
 =?utf-8?B?TGRXQ0ZjNEJCTFQ3NkJTbW44cUk3aDIwaGJKZllKVndHYXBGN0M3QkhwZXVP?=
 =?utf-8?B?djhOdHNVakhET2xIY0I5WmRMQ3dIeVcwNllaOVNZdW9NczNMRDZOS2FYSlpC?=
 =?utf-8?B?a1JYVjhxUWxDeVRCU2RIRmRYVVY0MFJoajFoRkx0RWY0TEZ6S2hQMTh2VUZN?=
 =?utf-8?B?MFlWeHVtK3dYUFVpQ0VHZURZcVFDK2o5RGh2LzVSbzZwYmtqa2c4dlBsL3pa?=
 =?utf-8?B?ZHR1dTRFMmJ1aW1oeTZSRUNvbk5JMisrS2JOaE91OUpiNHlxRi9nZjl0MnBr?=
 =?utf-8?B?L3J6eWtPSWF1VzlXdHllOGFYNG5mZytwZUYxajNVbHZDR1h4dXJUTUhSc2FZ?=
 =?utf-8?B?cGlMQXJaWlU0bmZWcTNBbnV0N2l2TVFVMEoxL1ppL3BkbE1VR2ZoL3pSaE9t?=
 =?utf-8?B?VHJDR1g2ZWdDRTMwN0VnK2E5TXJvNExxSjFzQTVFTUc5TWhlVEg2NHBycWw0?=
 =?utf-8?B?blBxUmhoRGszWmp5WkEvNWdaVERpUHFnSkJtR2RndzZiVXlUUjh4eEZNWkp0?=
 =?utf-8?B?MDhVZmw3b3NDZ3IzQmo0cUVvcHpJZ210S1h1dG9WbFgvNVJzUXpSY0ErZWs0?=
 =?utf-8?B?clhPRklPT2M5T2M2bGVBNWx0ZmZNODlJUVRqTDdXSkxpSDFWb3g1bXZlQUNX?=
 =?utf-8?B?M1g0MG11VlBUMVZkTTZ1dlNWMmViLzNJdXIvRUpPVlNHazB0dDF3Z1Q4bUl3?=
 =?utf-8?B?ckc1MjZQU2VNN2RsSm00VmdnMDY5Um5RTldqM1ZtTFEyNzRCRk5yelhVYjhS?=
 =?utf-8?B?TktFNHZmdXBiL2pydHpGMldaUURDVW1oTVJ0YTl6TFJ4cWRwMDBzb2Rac1pB?=
 =?utf-8?B?elRCMnVLOWRoRnFWc3I3dmR6NXY2YXRWQ0E3T2drSk1FazlncU5YdnRlZWEv?=
 =?utf-8?B?bjR1c2h2My93VzZzVlhjdVFLb1Jqa0I1UCtyQk45dEJLZDJlRTRsYTdBQ1Fw?=
 =?utf-8?Q?LVXY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG1oM2RzTUlkc1hGbFNsNy9qbkJ2ZkZXQTdZR0dHczZ1YVdPYlZQUDJMYjBR?=
 =?utf-8?B?RjBoZzFyNXdGZUFKaGx2eGtFZEwwVjlFNmR5WnJON3RNaFZocU95WkZTaG1v?=
 =?utf-8?B?ODMxZzVyNEM0cWFmOURKZmZjUmxYanBtT2IwT2RPeFhIZ1JxUlBEQ1ZySVND?=
 =?utf-8?B?QnFiLy9JT29jNzhJTkdHSS9IUCtmbm1COThmSGg0QTU0YURab0pJbnJMRmRT?=
 =?utf-8?B?QlBPTjFyLzZNckxjMUo2MTRCaG9oU3FPNGxUQm92WGVKK3hMUkZZOUR4aXhn?=
 =?utf-8?B?bFZiSC9PdlRqTWRObEFteTBUM09nT0gzcDAraWNQYTB1ektKT2xRaVZ6cDgx?=
 =?utf-8?B?THIyQXNmNlJPemVzaEtZQmp1SThMRnFwUHJGRkdBZHJFbEJUQWRZTTZDaG9v?=
 =?utf-8?B?VzR2djBKbDhWaUdLc0NDODJodHg2MW4vTTM1UHZJQm1BcnY5aFVpMWdUb0Rv?=
 =?utf-8?B?OXlqWm1ZUmtRT1lMUVZDM2ZLNmRBMkgrOE9SSnB3Q2l2UE9OSGVESWNYWDRy?=
 =?utf-8?B?YlRHY3htKy8zSWMwVEhYVnpYZ2U4a01tZkVzM0hRNFhPelBVZyt1ekdDY2M1?=
 =?utf-8?B?SEhsY3VJbzI0WHlRVGhEd0pJNHhNUm11US9OdFQ2NEdFcWI0dWVaMS9qNitr?=
 =?utf-8?B?MEhtUW9HVURYeWZQK3poWk9pTmwvV3NqQ25sVFNGN1Uzck4vaE1qaWdOUnlq?=
 =?utf-8?B?eGtSQ0ZXM0VaRHdqcUJDZHQxeDA4UDIxZnRMZFd3ZGpublozdDJyMGNSNDNL?=
 =?utf-8?B?bmVuVWk0bzlGdE9aZ2FpZHVtYjdTb0JaaXdJYzE1ZmhONFhRcnNxVStlcXk1?=
 =?utf-8?B?R1ZLbXJzdmhDYUxuVjdacWhEb3A4cmQxejBiT0RLeU5KZzl4d0dIMEU5aHp4?=
 =?utf-8?B?WXJRYTlaWGNHbW5XVXRtM1ladE9lMCtyazdKQWVWSWtIdmxGSFk4TEllVzhQ?=
 =?utf-8?B?QktmMHRvMnB4TE9qekFTM05qRzFSMlJDNVVFQVBrQ3VQL2VVRlVVRGtXOHIy?=
 =?utf-8?B?M1dualNZMzUvT3dXT1FmY1I4VEJuWDdwVUJYU0RNdUZNK0hlWlcwRHdnKzZq?=
 =?utf-8?B?Slp4Z3FVa0dyY0JnQS8vekpyNGhva2FDWlpMU2N6V0tqNG1JRXRnWnVPekNV?=
 =?utf-8?B?c3JDVHhVNlFrLzBOVjVEODVOdHdzWDF6SVNSL1lyVjh3OVdvSmxyVWg4eVZG?=
 =?utf-8?B?UHJDSmpnT1pHdmdGT0NnSll2QmRaUGc3bHhsNzluWXlWS3plZ0dpWFF0RktO?=
 =?utf-8?B?YmJ0bzBlSEF3OXhCajFhN3EvVFNNS1lONzJWc2h5UjNXZzRHcWRNT3VNY3Np?=
 =?utf-8?B?aUFZdllkV05BeTFBYklJeHJRRk9CYkZJeXdqbHlPTkhnTENRYlQrY2x6MzRM?=
 =?utf-8?B?MkNLWnV5ck9BU29aZXZnY0hNMWRaYVpGQ29pbTEwZUV3cXVCUkN2VVRTYUJS?=
 =?utf-8?B?MUYyYnlEeFdYdUNBaG9ia2ZNTnhEcGxqa1gyRkVDQ1doVVE2dW40c2VHZGdC?=
 =?utf-8?B?Zmwwb2ZKNEdxK1gvMlN4aWxJNDh0emp3NXRYYStmZlk5V2xoWFRZMkE5Ylg1?=
 =?utf-8?B?cUtiYk1jRE1rUHJkOHVMWVRRTTFuNkdyWEZ0NVRkampDM1RZZDdUallsVUFn?=
 =?utf-8?B?Z2FzalVmb1p0TEpvbkJwL293WVdYRm5NRkVzZlVueUMrdFNncjhEWGlLOGdF?=
 =?utf-8?B?MUZMdEhJNzZ6ZWdnUXh0RWszQjEydkhSUXpITG1IaHNoVkZMRnpHYWRnazI3?=
 =?utf-8?B?eTRmbmdnVmIwRm1sTkVERk9jRGhxT09ack9hbHoyVm1qVXlKOCswOUlEZ1NV?=
 =?utf-8?B?ekxtRXdnU2owNXhod0R3ZjlWVXVxaXg0N2FTOERKcmoxTTVPeDBEU3NMS25E?=
 =?utf-8?B?Z2dHbTVYRGZjVHoyN0pRZGg2b2V6WHJ1Tnl4MisyaURmOWdJS3JITDZlS2Va?=
 =?utf-8?B?ZDNNSFZkVEtnakl6YWV6cklIMlBxNU13QTRsUnhvVHRlbFQ4S3BEWHJnNWxT?=
 =?utf-8?B?NWZCbjA5dkJrNnRLb3Z6RkdkUWFuMWw1dDdaTmFMTVpPdUx6TDZTanZ2cHQ4?=
 =?utf-8?B?QzZoekFaaUM0K0l5WDFpa1c5WlZnYVpvdEh1UGJYODRlVVBHY29DWnl3c2tk?=
 =?utf-8?B?V0JDTHMxa1lxQXJHWndPaW5ibGU2Ny9HOCsrYjcrbEZLalZ0SnNqaW9lUWJI?=
 =?utf-8?B?WnNMcytOdXo1V2E0QXhGRTg4MnNMekh1Zk03VHhDRm5aTVppajVXandzSWVN?=
 =?utf-8?B?RVY2RHRlWmRZajRHbCtGZ1FEeVF6a2tWZnltb3dQZ0h6cDhnMzdzeEdmUVo5?=
 =?utf-8?B?YXptaXRWRVdtcGFEZXB0T0FKUVNKYk9rRmY3RExDTGxNQVJwQ0RmUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3a66e8-4566-47eb-6dd5-08de7395dadb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:14:19.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4LZVejp6cjBIXZeik4++AgUq3uqnxywemY67WT+O4JBb67yGUg//RvsxhfFrKXsyVjfqKLqbOfsv/j8wsl/wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7954
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B4DE2185F93
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:51:35AM +0000, Teddy Astie wrote:
> It's currently possible to build Linux with CONFIG_PVH|CONFIG_XEN_PVHVM
> and no CONFIG_XEN_PVH. That leads to inconsistent kernels that fails with
> "Missing xen PVH initialization" when booting using PVH boot method or
> display various errors and fail to initialize Xen PV drivers when booting
> with PVH-GRUB.
> 
>     platform_pci_unplug: Xen Platform PCI: unrecognised magic value
>     ...
>     # modprobe xen-blkfront
>     modprobe: ERROR: could not insert 'xen_blkfront': No such device
>     # modprobe xen-netfront
>     modprobe: ERROR: could not insert 'xen_netfront': No such device
> 
> When built without CONFIG_XEN_PVH, PVH-specific logic is disabled, hence when
> booting with e.g PVH-OVMF, Linux assumes we are a HVM guest, even when we aren't
> actually one (in the "with HVM emulated devices" sense).
> 
> As it is actually possible to boot Xen PVH without CONFIG_PVH; and that most
> Xen-related logic exist within CONFIG_XEN_PVHVM; consider PVH guests support
> within CONFIG_XEN_PVHVM instead of CONFIG_XEN_PVH.

So the current CONFIG_PVH selection done by CONFIG_XEN_PVH is moot?

> Keep CONFIG_XEN_PVH as a shortcut to enable PVH boot, ACPI support and PVHVM.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> A tentative patch, I'm not sure of the way of dealing with the KConfig part,
> keeping CONFIG_XEN_PVH as a shortcut is interesting, but there may be other
> options.
> 
> There are widespreadly used Linux distributions that have a similar configuration
> to this one, thus exhibit this issue i.e fail to boot.

Do you know the underlying cause of not enabling CONFIG_XEN_PVH?  Is
the default set to n on the defconfig?  Or are distros specifically
disabling this option on purpose?

It seems like a step backwards to merge this into some bigger generic
option, we always try to fine-grain as much as possible.

Maybe you could introduce XEN_HVM meta option, that selects both PVHVM
and PVH?

Thanks, Roger.

