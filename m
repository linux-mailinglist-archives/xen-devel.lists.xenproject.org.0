Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M9xJm77vGmd5AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 08:46:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6E2D6C40
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 08:46:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257831.1552100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3UYS-0002jf-8V; Fri, 20 Mar 2026 07:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257831.1552100; Fri, 20 Mar 2026 07:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3UYS-0002hc-5t; Fri, 20 Mar 2026 07:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1257831;
 Fri, 20 Mar 2026 07:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GknJ=BU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w3UYQ-0002hW-Nk
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 07:45:59 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1fdb465-2430-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 08:45:52 +0100 (CET)
Received: from DUZP191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::13)
 by DB4PR08MB7958.eurprd08.prod.outlook.com (2603:10a6:10:38f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 07:45:46 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::83) by DUZP191CA0039.outlook.office365.com
 (2603:10a6:10:4f8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.30 via Frontend Transport; Fri,
 20 Mar 2026 07:45:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Fri, 20 Mar 2026 07:45:45 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBAPR08MB5848.eurprd08.prod.outlook.com (2603:10a6:10:1b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 07:44:43 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 07:44:43 +0000
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
X-Inumbo-ID: d1fdb465-2430-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ulkqic8tjTFJM3dNm7tEerLg5QPK9TEGW5UhiRau/ovihjprZwRl0zndvoQk/xkR35Ve4xjHfoJ1hv/mpdeE/Ga1nIbVE6t6MzoH9VAxtJJ9wS2YDEWlGUAGMwjnGk/7URvX1oAdWmqtpPIBGXm93MR+CVAEEdH8uPoOzVy58q+NfB39JZZhUn9yqeuIomKKWkQ1rfy2FceXsjMqBinnlpyMSp+rsX53xNF9uEumwEdmr+n8YL/1vDkPbj/erwF3YASVoejY+/b/ZlEdc8DcyfCdqR6IaSmArH3rJW485c03R0Y/h5mGE00EwdkprX47YSew1cfin6mSxTa9SfJtLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84Q0rWdzY+4rSHbm7cliyjzI/VC72AVwvDvmYKV+/XQ=;
 b=y8jnLpBOalCWsspJN+297HzPdvMe1qrdwmxejTZXANksJhO6O6PxquDI0PnEQ81icYB9QA7x2vGcx6E/xi3hF5fmPbLL8RoyyVAOkSQ1D39QxzLOz8MnNxTemsbSjk3S1a/hOlB9k54h/aj310IOmvPmkznJsk8JMCyS9DMy//Thq83oaJF1Qd50mtpgFUZEzH99rXefE4Hcc41b68Zo4ovP76DXxRxj0Ru942SQB6iYi+t1EH3OcM3oGUNYxlL+kmvl39Jy4uH386w60GvmCWNJ3RcgHIhEelfREpv4SIzcfRdvkQSPby3i4dkE2e+o7Y1XusZMKCTqvFrSEk4ueg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84Q0rWdzY+4rSHbm7cliyjzI/VC72AVwvDvmYKV+/XQ=;
 b=Zuq/7eBVlkOAfuzwCUUl2dCKAp9NMA1z1hl1FUm/rLih0NUWiu8nmOz3D4PIK1qVJFktj0f+Pu/Bl/CWcFVbXU9PoKx/kZMHqbCYUJptgLD6nqjsecy7KE3cnSwYrCY7/NtRRWaO4abz6g2kmfT3E4SmkD9u9CKiifTPoHIEEVM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA4SNq+BYnhsO2Pckv1Df5MNWcMNH/vQLoM9/nAhCS7VztzYm9gMizNEe1oYeapoNx3pES7fseZiY54Ty4yyKiTHFAVPNwAbJVQkj1BPBSnCuhOtdrNKrlZ6eyAHICCGhWA2DNWsjTtD9SvfBkTJDBF9dh1YMHFwiWR8YE9r84D5LMNcTwNKYBG9zv22wTMRaIfh2Y2slN4ElC8r4LNpdLBlkl0uqs2QcsOxJC8a8EVvwkgkdoihPVDLvHLdEvRyFocwtw1INfHCEBd+WUiCGK2MwD3zFMyiDa5odLsU6EmIU27y7eMcx1JJGTp0H03CS9/LRDtMW9Rs95FrmDJz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84Q0rWdzY+4rSHbm7cliyjzI/VC72AVwvDvmYKV+/XQ=;
 b=FTp1I1pJNzOl2vaN3M0AP7WqeA4uvKXrAts/6YzXAlAxRJ2f+hY6fIM73rf00BsAmq4L3vEDaouJ/ozldlzHFrGlZEn1XEOdK54l3WQoDpO1VcG45HuG0FZCknEYnhJZbQaTprZRDOU3paPE5xGRChqznobNmBAvMl8TuB4Li3krjrPJbNfyy/LaAqueAAnikbF/poXoxv8RB+2irmLpiK09KN0drYVaY4J0kqtMruR2QlahycGwdQk0e/e/YavWp/PAgzXyg3wHbM1F599dn0Jn0UkaOEZ/s5ju6mw8yLV4WrpsLY6lxjGQlbZnQknOmd4l3BDBPG+r6TtTxfYcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84Q0rWdzY+4rSHbm7cliyjzI/VC72AVwvDvmYKV+/XQ=;
 b=Zuq/7eBVlkOAfuzwCUUl2dCKAp9NMA1z1hl1FUm/rLih0NUWiu8nmOz3D4PIK1qVJFktj0f+Pu/Bl/CWcFVbXU9PoKx/kZMHqbCYUJptgLD6nqjsecy7KE3cnSwYrCY7/NtRRWaO4abz6g2kmfT3E4SmkD9u9CKiifTPoHIEEVM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Topic: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Index: AQHct91SP+heAl5ESUaIOkxQ7VfzerW3Cw6A
Date: Fri, 20 Mar 2026 07:44:43 +0000
Message-ID: <2E014D71-DFD1-46BD-9715-D6EEB0E3ED31@arm.com>
References:
 <e7fd1f75146e7faa520414c4ffc1bd9572914039.1773951370.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <e7fd1f75146e7faa520414c4ffc1bd9572914039.1773951370.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBAPR08MB5848:EE_|DB5PEPF00014B8C:EE_|DB4PR08MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fbe33d-9ebd-47e3-4ee2-08de8654b24a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 miVqY6WFecg1em0Ry2LjcEjoB7EQwTq83PF4SvrQ9jAcZu/jsNNvX54ldLU9Klnju+dus9zIJEX2tL1tyuSmQCkaNtNb6cWAhBubrKHrP4TxpUHCkXbuIOKQQfbTZkXHn5c+S37Yv6DwgZCA6l+6bYtT0+QryCuMaOtN9kITRAfo/QFdWYx5/ZIymf803JmkShMLHe/IveKH04EXGTaTOWXOm+7+6/6c2+YR6WqHATpcmi7KVYnRXZmc9yOOXutM+1ff92guc6ux9ohq69B7fv+iw0HuzNGcnX8EUwvc7V8ynKs4cHuuE4qo6ccSl2ZmNxGSMm+aRlZwnPlcLYgxeBobrn6JwRWeOk16bS3lTOhVza3nDbgFprKL0aS8AjEDI7WNIbYVMQgMNZK+B3uWRdD16tuBPBONpOBsWNyTLMxPj3C3k+jrldSBrl5rRyxNb+4wRcb5GBw/qVV3OlI/EJCdwax1eLCMh1fVJrWGGYP0J8GXeW8HvKUfR870HMcNLK9UtlEOtyvlP5/wm1Z5QIn1zhO8oe4A6nRW6CZ7ISvUlVC2877KLcSJgkwIowZI0fFVCaePcGxGuQj8ZJ/BIABFqf7VIv8kOQACZKyYKAS8lQXysg+jEOYxLtkW6MsjfEBB4u0iYgJHqTPH0GQ8x4fJ3igJ9+/rRV1Evwn9fs0dKi+htOj+0RBwVWvZWqdVc8rZpABbbLxljdTuJ2mSY4Ypr6ou9riOY3FJUIae3DVEuSjercRPERhVhUu+krhhKKC1GAD4c0mpMvg9V7vu+p246e/XVAstps/iSODut7M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FDA13181EA074943915A2B18EA2A4DCD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 K025t90eKaWLqL5/vdByOMkaU6vvod4chmMglZNtavpbDvo3XCSzTIAlEv2B3k4ORPtbtkHnvsxQPp/xsiHgijBgr7jNzKXUSNVYF8UEt4u0r0JAhj95ulVBnoBTrOJKm4HMkM3Z3REGi5FF3r1rRmEHNdoVxiXCqjMkYfMy3DYf2jhsZCFR0jubJ42E00QTfCoxyzCjGk8P0V4k/FPcbuag2VIl0BTklB3tP1oOS7Teo++g2zYthpS1aVE/RGpI078F1z8nQqrytxL/8wFXyhaR9UJHBPo3s6N1Bp0k0v+Sia9AwbYKmcXzQ6ktLxj9O6pumqT73uCagu1uxeulmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5848
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0823016a-95d8-4ac8-f172-08de86548d03
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|36860700016|376014|1800799024|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uj5n1cVmuH9f3jBWCTyNZbIcrKyvmXDfzTFjIf3GJ6w1HbBBKi06vQ7Fc0fa2k7p9OhAb6ZPCOVcYC+4w/PKhNG90CNGO815HJ6Z3zTgEj0M309fieH/vCQh2n2/71srzdl0lXqr/R3UYq1aW2Z8KLkR2+HBIUBjnVNFyzR5GQfo7QwXUKzd2numqO9PijUJ6mWzhm1jfe7trHCfJ2JWIghi6SKbEThvKvsHjmpl51YHW3bU1+swS/5TOUZA22lGsYN587Ut0TGKcDRnd/CVz58aW7D8DlhZMmOlpCD/cjbyV99AzrpL4xWoSG3obA9AJ7JxQexgosvPCjO1TQdfEtGtLlFC2kJfThcyUojHf7YXt7P/phnxSpHFpWZxRpKHbHbjwyZkO5nqALzbgHVTAqhJR8nVDu52R10nsEJj+rVAoMIytHoYmY43I+0TkcQR+V5nGxYgLMnhncG6Nl0uSvJcwOvmVbNFIEi7TY8MLZZNqKlnNZAtoMEGykKiko2OmVxmoECGss4eqdF6UgGIdTGPpOreWPT+QkmAO7+Kf8K0H+g8KRZCgNZTLJ7qIJ8tyB+dHluEREX0Yh+DU7ty85dzGzJ6DrwbKFJsdaQn5q0Jfd4tlauGGaRzwSiqMGpjjmcUNFzC//7Ao20NuM/BhXpUVOc1HnjMIe+E6RrfvOKT9N5fQM5/XtFeHgKugSo73Umi8e7DoVyIVPiDug0w/Hs4BuqyKas+q1zmE4cuYV1jLdtXFXZfmYlK6QWT/a5B7BvExSVn+NHWQ5/dBTD9Dg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(36860700016)(376014)(1800799024)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9yDx0UYKv6MaXhA/hM7GZTc9OrWNMGDyDlKL7zxnwPlsmMeBwg7da2mpnXN5fxvHdw2zRwFtRBRZz3yXtcQIM4k1gJ/tLT2RNWy3XxxDE1ARS0bUvHKBbJIOeU1jTPmSwuxNVcHL3RMmWy2cvoH9UUQc/ezyLaf2UR6ktQQXLa7yzuWKQ2UDqBwnnpOYHf6lOQZ2aYZCRUXOJRsiDmD52q+iKSBYLvFLAUY/anl6ydCNqE0Ge3EOG/ekwPfvqq2LZ33s45xG3B2mCXFWgbMf4/qR60oXCM7dJgoiWhOPhS+C5DXt/j9ibkKHm+9KcQXHqwwJqsAJrzzrq/7zwYiefk6FG+hAEfmHNy4Nv1Av3HusfGgfbo63qBQM5SXy/HsreRt79+9JMfev93JhS22Zd6P6+d6DqsNq+PyKKi1L7pKczq3GuC7uvi+t3DPstmf6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 07:45:45.8709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fbe33d-9ebd-47e3-4ee2-08de8654b24a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7958
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	APPLE_MAILER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B0E6E2D6C40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmytro,


> On 19 Mar 2026, at 21:16, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com=
> wrote:
>=20
> The local variable 'ffa_vm_count' shadows the global variable, declared
> in 'xen/arch/arm/tee/ffa_private.h', therefore it is renamed
> 'ffa_vm2vm_count'.

I have a patch in my queue to solve this (I am just removing the ffa_ prefi=
x from the local
variables but does the same as yours) and a patch to solve the other misra =
issue in optee
but happy to to use yours if you want instead.

I was waiting for the pending ffa serie to push them (should be merge soon)

This patch will not rebase cleanly on top of that serie which is changing f=
fa_partinfo code.

Do you want to wait and rebase or abandon and use the one in my serie inste=
ad ?

I am ok with either solution :-)

Cheers
Bertrand

>=20
> No functional change.
>=20
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> xen/arch/arm/tee/ffa_partinfo.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index fdb03dae9a..473507ca3a 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -265,7 +265,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>     uint32_t dst_size =3D 0;
>     size_t buf_size;
>     void *dst_buf, *end_buf;
> -    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
> +    uint32_t ffa_vm2vm_count =3D 0, ffa_sp_count =3D 0;
>=20
>     ffa_uuid_set(&uuid,
>              get_user_reg(regs, 1),
> @@ -310,7 +310,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>          */
>         if ( ffa_uuid_is_nil(uuid) )
>         {
> -            ffa_vm_count =3D get_ffa_vm_count();
> +            ffa_vm2vm_count =3D get_ffa_vm_count();
>=20
>             /*
>              * Workaround for Linux FF-A Driver not accepting to have its=
 own
> @@ -320,7 +320,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>              * the requester endpoint information should be included or n=
ot
>              */
>             if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
> -                ffa_vm_count -=3D 1;
> +                ffa_vm2vm_count -=3D 1;
>         }
>=20
>         goto out;
> @@ -355,7 +355,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>             goto out_rx_release;
>     }
>=20
> -    ret =3D ffa_get_vm_partinfo(uuid, &ffa_vm_count, &dst_buf, end_buf,
> +    ret =3D ffa_get_vm_partinfo(uuid, &ffa_vm2vm_count, &dst_buf, end_bu=
f,
>                               dst_size);
>=20
> out_rx_release:
> @@ -370,7 +370,7 @@ out:
>         if ( flags || ACCESS_ONCE(ctx->guest_vers) =3D=3D FFA_VERSION_1_0=
 )
>             dst_size =3D 0;
>=20
> -        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size=
);
> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm2vm_count, dst_s=
ize);
>     }
> }
>=20
> --=20
> 2.43.0


