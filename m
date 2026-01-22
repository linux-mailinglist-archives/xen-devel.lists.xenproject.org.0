Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN9wBIlicmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:46:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBAD6B9D4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211754.1523239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viylK-0002QP-Ee; Thu, 22 Jan 2026 17:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211754.1523239; Thu, 22 Jan 2026 17:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viylK-0002OI-Ap; Thu, 22 Jan 2026 17:46:30 +0000
Received: by outflank-mailman (input) for mailman id 1211754;
 Thu, 22 Jan 2026 17:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viylI-0002OC-Le
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:46:28 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43bd1a0c-f7ba-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 18:46:27 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Thu, 22 Jan
 2026 17:46:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:46:19 +0000
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
X-Inumbo-ID: 43bd1a0c-f7ba-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLafgYG5oXeC7PU4+BD0Y/aZ+D0iH/v8qPrxrbkstrT7XQjKZDnya+edwMRcvlgXE2WPElYweJxxNfOft7tLhfer/oWfL2dWB6pT/sOktbuVelni6So8kjcLT6SnAoijvkprNZYjTbeIpPtAkgjrZrHA+bFmWbo2rszTz2yErdVzeVlLjcVa+gC21eTUCaAnVQYtBNGx68QbmN5AaPryWiNUf4odryPXsnk9GO5rxbaH/lVPoN5jofgkSVXT74pRYPp3D5ZVwUK2Fr7eoGTa/X3pv/UB5Ks0rl+ZsX8iimsDidzxxrj8Getu0Ld/B4vYACNWs7FsuQjX6XgDqE5dCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umdk8Dz3+SgrY+A6+i/QveUMdiCuv1WF7xlrptnDDXw=;
 b=xL9m9qCbtwynyhcT/5U6WOieqkD9WNqqXkBF5CoDeAdJ7Tww1ZlvZDLlv74fM7Ux+ma2n39iId0Ieahq0NAjZT0YpFR/3jVAXQhsQvXXQvG7BemkO5f1wul5IgYFBHZcn4DJQbQ7nJvziPNFNE1s5eSxy6kIQCOh5Q0myRYuBfiCRsAVyjHkab7Lf9SiZ5C3STrKczSKHDszQUrXq/DBmiZWgrjU0aJNjnkJxvtK5aJKKUoSEEU7vCzJ1Di+E4ya0M9KE4G/EXkrzOQVy0QJD7eGI1uPBIHao7cUbKlXqODqMjfHrkbBe4L6RIz/bQEi8xnPxwq4DOXebiGaJiJqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umdk8Dz3+SgrY+A6+i/QveUMdiCuv1WF7xlrptnDDXw=;
 b=0sS6Wlu8TK/01XUBJZQLwCcjdRmlmh7URdHT+rO3Yd9NpJnlsryvJQ8BVVVmupxpWdOW2P+PNAzeHHBHO4g8BCCP081mO0UZu2oTROOfAR+O6fApUFg5J89yIS7bZq7wtFad+8SsfzIA2b11Hb2OJIftXttvlHj52tESVLQk7bE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 18:46:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	James Dingwall <james@dingwall.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
Message-ID: <aXJiZ4zKvHzlg6dB@Mac.lan>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com>
 <aXC1sFjIRUEB7qOW@Mac.lan>
 <d6e91265-b045-4257-8a41-6cb77a785924@amd.com>
 <aXERjdPS3KlcD3C-@Mac.lan>
 <a72553d1-3d79-4314-aa41-11a09dc60089@amd.com>
 <aXJW-9Ken2pbkCsm@Mac.lan>
 <1357dda0-bb5d-4f59-a53c-d584099bf65c@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1357dda0-bb5d-4f59-a53c-d584099bf65c@amd.com>
X-ClientProxiedBy: PA7P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34a::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 43be4f77-69fe-48a2-ceae-08de59de260e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2RtNVJGUGF4NkpkVk00Nm5yRE1KeW81TW9GR1pXci90K0pRQ0VMTjBka3dy?=
 =?utf-8?B?eTZsTWNkcHZ4bFowN0dWeGRYYnRuc01lSm9VNldTQmFpclZvem94OHRlVFhW?=
 =?utf-8?B?aCtiZm1YNzU2RXBpWS9pU3dhUDFBV0xyWWxNRUtFSHUyL01DalpGWUtpNGEw?=
 =?utf-8?B?Yy9uRXFud1Z2dTNTQkRiN0xUSHZ6VExGc1pSMzlCSHg4bDN6czlSYjlWRktY?=
 =?utf-8?B?bktMc3ZjN2lrKzU5eUhDOVdSeFRZQWRmS0pYd204dzFMK2gzdWI1TllLUy9D?=
 =?utf-8?B?ZnRXL1prYW1vZkRJdVc3VWlFbmdnOW1SbWZNdUoxc2FSamt2N2NIbjhaVUhI?=
 =?utf-8?B?SE9GMlZjaG4vS2ZCSGMzT1plVXhEYlJXTkFLMVM2dlVlTm1VRUROQWlKVERD?=
 =?utf-8?B?Q2hmc2o1Tk55UzJLYVpGcFg5QmRIaFkxTk9jWUF5TUFwcmpzZXd4UCt6NG1Q?=
 =?utf-8?B?SU5MUTgvcDJvYTVJcEl6NmpHbXVBQmlkbis3UkE2cXR0UjFWaUpBZ2pNV3cy?=
 =?utf-8?B?Qmtab2MrdEIzbVJSNTJSbmZBYUd5OUR5SXd1Tmtyc1RabW8rZXI2bExLQ0Fy?=
 =?utf-8?B?cTJNSmJaMmRkQnczSDlHb3k0SXN6MVM4T1FZNkRJSFJYRXg0bGJqeXpQZkNH?=
 =?utf-8?B?em96cFFqdlFodkxSc3BydmVweTIySGsvcXkrM3Q3T0l6MnpKNTlMMjA5MFRr?=
 =?utf-8?B?TVJmMW94RnM3QlhWSmZUb0E3T2tydnZJZzdIU3U3UnJPUXpleGJFNEU3SU40?=
 =?utf-8?B?anIyYldmWHVBdHYxVmJVMmVMNEdiMlBoZ3hYbnhPLzI5NXV5U1FDaUYvWWgw?=
 =?utf-8?B?T1NuaWJ2aEFYZzZwd1NoMC9uWEFucE8xcURoZUREZGJBQ2RzU2NNVms4YUd3?=
 =?utf-8?B?S1FmUHZmSDhjL1hjLzgwZEVVMy9oSDRUVzcrczJ2eWwrV3cxaXQyZHcvMnlS?=
 =?utf-8?B?aG80aHJYWmhHNFhub2ltOTB4Z3NSeDVxWVE0dS9uRnVGZjhBYWJJbVNhUGhr?=
 =?utf-8?B?d3RqOVlUNG9IZURHdjNtSlorSFVzZ0F0MUVVSE1Kb3pkUEozaCs1TW5vcE40?=
 =?utf-8?B?LzR2dDN1eEZFVWc0Wnp3bFlmaVplYTRxbzlIeWgyaC9TSTdIYkh5OWNIK0JJ?=
 =?utf-8?B?dTVITGRxSG0vakJ1QkN0YU8yOEZKQ3Azbit6cFBIaXd4TDA2YkFEUzl2aXF4?=
 =?utf-8?B?NDdzek1OSG1wanBRQkJxWFhyaVBEMGdzM2lJVm9RODNOaGxNeXN3V094QXRE?=
 =?utf-8?B?cVp5R1VPaG5TQWcvSGY4Q2hxUjBuWVNoUTVUSVNCUUxhSFhMd1hXWDM1dnNl?=
 =?utf-8?B?bXVZNEdzUFZMYXRnRFp0aXF3TTY5bWlBVkJSbXpvUHZPSlQ1djRUWlVuS3Bz?=
 =?utf-8?B?OEhGaElDcGpacUYrUDArTE14N1h5SGk2TjBXcEFyNENaRkhpTXpSendpK3hs?=
 =?utf-8?B?ZXN6MXR3d0VxWk4wUk5OZVJCeFA2MVN2Sm5ndFJrbmowc1JQWlhBWUVCZXBu?=
 =?utf-8?B?UzgzUXlBWmYvWUdkcGlwWjdnaTJjM2xqTDMvZi8vcXBMbzRab1BvUk1KZnVN?=
 =?utf-8?B?ZjJxSytJUjZ0Z2pxaTZLRTVhRVJ2anRPT2dibHpROTFvVGdTVThMS0hHRGNH?=
 =?utf-8?B?SzJHNmJSTTlHRXd3bzh4QlVNSXBNQTdaWmpGWnVkNEhUZnVqTExiRXY5UjdY?=
 =?utf-8?B?K2ZlQUlpNmtMS3QrT0IxdXZVYVZ0NXJKM1VvUWdDUHpyN29Xb2orbFFxVmZG?=
 =?utf-8?B?TWZjaCtyWTVoT1Z5QXdwZEFhako2cCs5c1VlekpTaFJ6eFVZanYxZGV1Ukw2?=
 =?utf-8?B?OWpRSTdiOW8wcHpJNEpzY3lTZWxhSDN2SUZpN2l6QjFCMVplZlFDa3VSZ3Za?=
 =?utf-8?B?azQ2M3V6NkRrOUsyWUNxSVVvSGR6ODh5SnlQOEtYbGFQK2JOdkR1czU3VVcr?=
 =?utf-8?B?R0dsLzBHVkF1cWc1QW5qb1RPWWNRWFFqejdjUnJyUll1c2VVZ0xZRjZjK1lx?=
 =?utf-8?B?MnNucExJelVQTW94eVhuTDFkM2k5dTJqekQxME9ONEUyN1JQQm0vMXhsWjB0?=
 =?utf-8?B?VEFjQjFlcDFtb1Z5c2pITUt6K3kreFRoTXZnSHZGVjNWd0lWeVN2eUY3T0JE?=
 =?utf-8?Q?dH8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEZvejlqT1lwWkJSTjJnOUZYVWlRY2NlUWNjMXRCQTRhbERxcGViOWxndVlq?=
 =?utf-8?B?eTR1d0NTaUtPWDlsSnFWZG42bWpNLzF4YjExMUJmVityMzlzRGZ4cFh3TGdM?=
 =?utf-8?B?akxpc1N0MXdtWlVockdiNThpZ1BpOVdVRzMvb01SejJUMzNWNnA1ZkhGNWsx?=
 =?utf-8?B?VVg2MGY0eVdyVDJ4NjVFOWlxSW5xTTVOS0xxMVBuRm92QktEWU05SUgzRzNp?=
 =?utf-8?B?RXNWTi91UklVM1QvSDJyQjhrR1N6WVJCcEtrbHhDNGp0RjdDNVp1WGVTbWxh?=
 =?utf-8?B?aHc5T2h2bmp0VkxSVlFsZ1NyWDFiWVlzdEIvZ3d4azBRL2lJMjN5djlrRWdB?=
 =?utf-8?B?enZFYytzWkV2M0hDSmJPU1Z6UFNNcjlKTjFyTVpkNGZKcm9NOTFJMGp3a2Ro?=
 =?utf-8?B?VEVtNDBrTHlzMDZVc3h3cXdkanRRYURNSm1xaStVOEhuUVNxUnNoYlNxZXRZ?=
 =?utf-8?B?cVc2T3k5d3V2L1RuWDlJcVNEeUdtakRIbFAvTWdrWXRRblROcVNodmVRRnBP?=
 =?utf-8?B?dVh6bk9vNlFqaXRja0c0REtJVlBYWXB6dm5vSitNS0NGc21ZV0xhM0xvQmJD?=
 =?utf-8?B?RHVLQ3dSV3gvd0l4MzNVYkd3MlJaelVKK2dEWVlDWnFPRVp6dGdTbXRHckNv?=
 =?utf-8?B?VkI5ZGhFZUg4STQ4YXl6Y20xaXMwY0Z1OWZpalpCaG5wUjhoRE4ybTBUNkxG?=
 =?utf-8?B?SlBRa3RJdm0ySTg1SFVXamlxaTJ0WlFoVVd2NjJLMmdwcmpsVUJVb0F2UnZq?=
 =?utf-8?B?WS9oNkgyK3UvYm0zQ2xidno4OEM0RFRRcXpvZlZaU2wxeTkzWGpFZkhralU5?=
 =?utf-8?B?em9XYVN4Q3lBcTVzUnNzWmlXTVJROVhEbGo4cFlieWhqQWV1QUtjMUNDcmd1?=
 =?utf-8?B?SUNkM3VGbUc0ei8yeFBxSDNTUno1Z1dVSUtWSHZLd2YyL3Q4NUM2OXFKekRO?=
 =?utf-8?B?ZFJkN1YzNHhWUzllUjNlbGppd1A4UlBuOC9LMWJqV0QvZFFUdnI1S3o4ZWVM?=
 =?utf-8?B?aGtvRVk1Q2J5WnYvTG4yYnFiYm0zMW9oZE5rK3J0clgxbFUxc2JmUDRWOTQ3?=
 =?utf-8?B?SDVDS3Z3RnNHc1E3cmpQNXAxT1pUKy9wOGlFbDRra2RwdS9MMjdjQW12TWtP?=
 =?utf-8?B?djUwWjYvMEFPNGJWRFRET1BublRyRFBFeFlFRlRRYWYySG1tdWRYRDFkeHlK?=
 =?utf-8?B?ZFcxN3Z1TXM0UzVjeDl2Y2dmcXdob3Q4QkI5bW5PN1pWWklBcktoa01YL3lV?=
 =?utf-8?B?Tlg3TjcwelFsdkEybEFndGExaU9WZzVkRXlsVldLeUZuZWdIMVp5SU5VdW9N?=
 =?utf-8?B?ZVR1SDNGSEV2N1pEUlJjQnpmV2RSUnVoaEdkeXdES284Q05hWXlObnRLRGlF?=
 =?utf-8?B?UWM4VENtUSsyZXh1T0FPU0NQRlJtUlFTRThGNVAzbzJ4eVV3RWVPV0pra2JK?=
 =?utf-8?B?bmlZaTFEdVdKRkdCT0grR0NHV3Z2OFJ4ajR5bFcrZFFFeFRWWWExZk9CakhJ?=
 =?utf-8?B?dis4V3l0RmRsL1ZNUzhBZTBJTW5OS3BDL2Fmbm9tbHZCblNnSTNNSG1Hbk5Q?=
 =?utf-8?B?dVNCbWE0QmswL3JRVC8yN0RDdGpEVjZIUFA5MDNWejdPeW5UOTBkQ0VBVG9Y?=
 =?utf-8?B?QWJGTk0ycUxiR08veC83c1ZwZHp0ZWpkNXBhSGNCYWcyekhMTmQ2ZUQ5eEVZ?=
 =?utf-8?B?cm5oUGRXNmtYR1BKOE5UOWlPQjhpdkMzeVhyUnpacjNzS1RMN1h1S0dtYTJx?=
 =?utf-8?B?RlBOdklmdVlQUDZ2WER3R1NuMXdjVk92SnJZTHcycFVUY2FEUVJaQ0JiSk1u?=
 =?utf-8?B?QU02MFNvZ3lLZDNEaEF4VlR6dS9JemZPT1Q2VXJyYVREemgvK1ZPOXB4YzVQ?=
 =?utf-8?B?bWhpOHBrVVdHc2FMTElQOW1CT2d0QmNNck9UdXRKVW5pb0QzcEdmMWE5SnNW?=
 =?utf-8?B?YzB3TmwwWVpQTXV5Z25wSE56azJjay85SHU5ZkVsRVNtRkIyREt3QTlQUkpU?=
 =?utf-8?B?TVYrQlMxUFFkOVlIVDJkeTNuZDMvbllqYTVuR0VvOVFUMVJsMXlNTE5DdWVp?=
 =?utf-8?B?VXVMZlZSSkpodnVPbkFVSVJDNGRVNHZoSkVYdWFWTTJhRlY1bENVTDFxdmRM?=
 =?utf-8?B?V1JqVkNKN3p1U2hiK3F4eVU3bkpPYjN0eWVPMldZcnZRMzREWjRyOGpaeURK?=
 =?utf-8?B?RFpMU0ZOUGRIYVJneGlWTGkyZ1dSVWYvRjZ3Mzg1NHNzR0twR21RaXcrRWIv?=
 =?utf-8?B?cU13L0t2MWJLTk5sc0crNThtZElnalprY1FxMGQ2NUlKVHovMC9Yb1VTL2Fw?=
 =?utf-8?B?V005dDcyOXluSllLcTM5c2YrTDVGNDhHaEp3b2g2aUZjcWF5TnJzUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43be4f77-69fe-48a2-ceae-08de59de260e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:46:19.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkyFT+Fu5xnORI/47oCD/1fr4hYAWDSO0BEsTE73ieT+FGLEBycf/GC3SA+gKVvE4ouoW0z28hvd/k2Q6zRJ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5852
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.618];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6DBAD6B9D4
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:03:47PM -0500, Jason Andryuk wrote:
> On 2026-01-22 11:57, Roger Pau Monné wrote:
> > On Thu, Jan 22, 2026 at 09:40:01AM -0500, Jason Andryuk wrote:
> > > On 2026-01-21 12:49, Roger Pau Monné wrote:
> > > > I haven't tested it yet to see whether that's OK to do on PV, I would
> > > > think PV and PVH would be the same here, since the setting of the
> > > > xenstore target value is based in the return of
> > > > XENMEM_current_reservation for both.
> > > 
> > > On a system with 32GB and dom0=pvh dom0_mem=7G:
> > > 
> > > [    0.295201] xen:balloon: current_pages: 1835007 get_num_physpages 8220126
> > > xen_released_pages 6385120
> > > [    0.295201] ------------[ cut here ]------------
> > > [    0.295201] Released pages underflow current target
> > > 
> > > 8220126 - 6385120 = 1835006
> > > 
> > > And also for PV:
> > > 
> > > [    1.406923] xen:balloon: current_pages: 1835008 get_num_physpages 8220127
> > > xen_released_pages 6385120
> > > [    1.406928] ------------[ cut here ]------------
> > > [    1.406931] Released pages underflow current target
> > > 
> > > 
> > > So we don't want to subtract xen_released_pages for dom0.  Is
> > > xen_released_pages expected to be non-zero for a domU?
> > 
> > Oh, yes.  In fact I think the patch here is wrong for PV dom0, as it
> > shouldn't subtract xen_released_pages from xen_start_info->nr_pages.
> > I will need to send v2.
> 
> To be clear, the numbers and warning are from the follow on
> current_reservation patch.

Yes, but I think it's also bad to use xen_start_info->nr_pages -
xen_released_pages (my current proposal).  xen_released_pages had a
different meaning on PV which I kind of stolen for the unpopulated
alloc work.  It was originally meant to signal pages that are freed
during the boot process when it's not possible to relocate them; see
xen_set_identity_and_release_chunk.  Unpopulated alloc doesn't free
the pages it uses, because they are already free to start with.

I think I need to introduce a new counter that accounts for pages
consumed by unpopulated alloc strictly, and not re-use the
xen_released_pages counter.

All this memory accounting is far more complex than it should be
sadly.

Thanks, Roger.

