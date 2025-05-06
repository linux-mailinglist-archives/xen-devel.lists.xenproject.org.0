Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0DDAAC3D7
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 14:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977131.1364196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHMc-0003pM-SY; Tue, 06 May 2025 12:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977131.1364196; Tue, 06 May 2025 12:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHMc-0003mt-PG; Tue, 06 May 2025 12:25:34 +0000
Received: by outflank-mailman (input) for mailman id 977131;
 Tue, 06 May 2025 12:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p1E=XW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uCHMa-0003mj-VY
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 12:25:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f403:2612::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fb414f4-2a75-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 14:25:25 +0200 (CEST)
Received: from AM0PR02CA0182.eurprd02.prod.outlook.com (2603:10a6:20b:28e::19)
 by DB3PR08MB8892.eurprd08.prod.outlook.com (2603:10a6:10:43d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 12:25:22 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::5) by AM0PR02CA0182.outlook.office365.com
 (2603:10a6:20b:28e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Tue,
 6 May 2025 12:25:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 12:25:22 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB10084.eurprd08.prod.outlook.com (2603:10a6:20b:648::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 12:24:49 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 12:24:48 +0000
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
X-Inumbo-ID: 2fb414f4-2a75-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oblvwEVcl6nHCQ/v25RAPJ8iUm1TZHtkh9Zyrd3T9U6//bLiY4FfKYgoADqi0wrwpEyD4tuIP88iIinP61B9LMPqApEWgHIGyM3ZTcnvFMFkP6A8OuzmA9YNnUtq6n5nb7X2qqAxBsjWdD+0EIwBmFfORLl0Xosz3KL1NqyMyvsM1TqENy0IUX6SY3RCXXC8UGsgaVLvDpNOfHG9XGT51FNhA4/WjmMD9HVptWFjrdIOGKYGDF5PuHyRelN+UkQKz6mynzBupdkATvuqdYMb38gmw7H2FxoNQRnbbMBLNbDT+c6dY6xaGuXqZOejF+ijIajaAai5GXP+GkWfxjo0cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXQ13MP1qQOUxa75Dmjwu+oy1XGll8PGOuytf9nVLPc=;
 b=eBlFM23ThWDDLiMP5HfL3knTAu2qIMeUvHc62wduudmkGbqPWrPYrwwPMJ3TG4tA65zsn3lNMavglSyyeOTyeM9QgPLNxyygpXkhBoU48PLXKVlfvWXxOrNO6XFKMDkYhzSWsXYobEgqFbr9R63Yk1WEO8PWbH5sUZvw6JRQLulvGf68TjSjms76BgH1pYgLbZeICKdh+4J8sHNURwZJO7vs1UM7tuJHc0mv8SwDBkI/koLUmLW4ZrnY3JEF/YQal9AgM4sssf8kdOgqGy1fLA46Zyshxt93r9GqybcIDmHIbyoLITjM8pPOiPBScB8ejlkBQklAAFXi9iCgdnzmNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXQ13MP1qQOUxa75Dmjwu+oy1XGll8PGOuytf9nVLPc=;
 b=rSvsp0nqZOy9FrMgUzl3yjKarz7NIL/PiqnAT+f0rlRL0+UEPU4dlhKP1eCSorrW862BNmQAHMD1csvS1PDrpZ/eTvfjHAHKCC/Uxr9xxSLZQUPvAVaNgrIeyLdxA4UbTmSo9NaTZpiHMb4PTdZrgAgkS+lyVPwcK7Q1F/N5Mb0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6j5Fx8Z41oEw56EiH/o9ZMr2iE30X63e9oo0VO3MIpH18zDDV/BFAbjWtcz31uTGFR/Sit6Ktku3f0cGZKoCn7uCeZ+i3L7TCNmvl6j2fdO2d5/guFXaHu9a2CiXqLGShfxT9Kr1C6PxD9UyyD1cFFo+tavNdu2TclIgPqbdMLDl26uDg463aGfOTluIJZI2GSr+LO+zKixopAN5lgH59eHGvTeFxe+O7HZbys+SrQOnffIiI1Ohrk+C2HTdEEpHwdsW2vceTjSgZNkjXSuntOjcDt3qYv/UEQlkr0tqxeuYJq4dqTGUtTepGHr7dRXpTMddPMf1UJ7aANtt9YpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXQ13MP1qQOUxa75Dmjwu+oy1XGll8PGOuytf9nVLPc=;
 b=l1w5Yrrf97WTmn2aXssFgyEJDFWzXmmwBs+v2j8MU+Zu/BQJut8VpyUVVjtyGnAZZtdv5h6SnKLC0OETbmatVmBBVCORW4mLPEac+nQ7aKbd7qfN6Sdsb3+NUZGCZIVWGVyeA26YowsQ3YEyATz5NMgzLsyM8FsTs7yUg+FuB3Ye/hcHGf1U80Tq5rMixkNDYeTxMsciXZbUOrfj129GOUzGtmv0xcobXlaXPXDVh1zmErDF4hHgT5AYdD3xTw6nqm71rVT/5CcvOj1+cTHz1eWCgfIY2yml9k5IhyvhT2rpIF9QYwUccx+EtSGvPOovsBP1kZ6qaZ03tsF8wN9ZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXQ13MP1qQOUxa75Dmjwu+oy1XGll8PGOuytf9nVLPc=;
 b=rSvsp0nqZOy9FrMgUzl3yjKarz7NIL/PiqnAT+f0rlRL0+UEPU4dlhKP1eCSorrW862BNmQAHMD1csvS1PDrpZ/eTvfjHAHKCC/Uxr9xxSLZQUPvAVaNgrIeyLdxA4UbTmSo9NaTZpiHMb4PTdZrgAgkS+lyVPwcK7Q1F/N5Mb0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Thread-Topic: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on
 Armv8-R
Thread-Index: AQHbuRpmN9lJogKQoUiVWa6WakCsQrPFhjEAgAALLQA=
Date: Tue, 6 May 2025 12:24:48 +0000
Message-ID: <FB60F408-6ECE-4396-BAE4-E9D70F9E9DA6@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
 <a96a2e51-7b00-45a3-9f75-0a062c8defd8@xen.org>
In-Reply-To: <a96a2e51-7b00-45a3-9f75-0a062c8defd8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB10084:EE_|AM4PEPF00027A65:EE_|DB3PR08MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecdf117-394b-44a3-d53c-08dd8c991270
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|13003099007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?iHcRMeb3rznWu0IE6ikUH0HL6EpmdY22zXXYnBxjSmhAMdURk6a0zZrsstF5?=
 =?us-ascii?Q?q9Nr4Z+7WyCZl2t5mmpktWzYb/FjNBUHAogHbP5lqNWGn+Orhqd+HgHIjnwn?=
 =?us-ascii?Q?BZfcS+n8yzNLxE/yR4KrrbCisk4fADgvlE5bDb8bd4hhoqXiCWbhjm5IYgbR?=
 =?us-ascii?Q?fmOQceavHcs156lXZ3Vc+l9mPnkghZ8kqHGMYD6Wy+INxC/N1eOIobcKyFeX?=
 =?us-ascii?Q?ug6B8ekANFV3mOK6B3l73M8SSH+6fyUFAQU6UxXHbIZTKd3FTSApqHlzjsl+?=
 =?us-ascii?Q?AGZpY3RETLn2RaF99LWDM6lnRd9BCF9K7iqtNIEA9KWYogpWCagvHtixQbE3?=
 =?us-ascii?Q?NjNk2hmkSafWzeIiLjD920btxK5W2QSrqHUDxn1R8kYnIgoixiqJa7sYZEwU?=
 =?us-ascii?Q?Zhgb/TGMMrcKixSN7/4G9HFEVZezTbzHRj4cvrBNaYrCS0RBNwMx9Ag/L32u?=
 =?us-ascii?Q?j8vJhRcUtc/SfKqDSTjsqewXIV0gs0bm5e2acPJBWsHz/6K6MJHMe/NiayaK?=
 =?us-ascii?Q?UrxdXEcEJCkLxE/qfLPjeZEK8RGlovjQv4gjHgMYI8SDbXHVEwmn+u35OJee?=
 =?us-ascii?Q?PW2HGnEqnLa0CWpO60GQCuSmPgSkWKfvxJ19IZTpeeI1x9Rh1yJsAi9PgGR5?=
 =?us-ascii?Q?brc+SDWCXgDMsONeowbcW+Js4OaFn/Bu+9zIxfJG9rHTaWOaHoeWIZNdd57+?=
 =?us-ascii?Q?JtyRIFmK6zQ63I/GT9uqjoEjWFU7erjPNC8vSZEIRiF5PLEH4UwyV0Xv4S/4?=
 =?us-ascii?Q?RXEtt0iwNAe9/pS5HE9og4krCWv9CLHnLDsRzZ0nBDwSDP1vs5AqaH8zrzNC?=
 =?us-ascii?Q?8ALswIBn5WwJnY5xN8ejluhme3vG7S9xQCQEfJpch83p5Xf0LpK+2AHe5fYQ?=
 =?us-ascii?Q?bTxHDxKk+VWjtlhSlhc0PUqIXdzD7gtjtypPezq8GbYrMqRi7bArZ/dIP/1G?=
 =?us-ascii?Q?u8A6AGgK8pJWzyq/R7baiwJfqdxUk6CHdwvj1I9sJcC4w7HMzXdthtAoSzPo?=
 =?us-ascii?Q?dPbC02fF/f/V60l957Xzztu0GPEPtLFeawvvFp7V+K15ZBRVIkUinKkm2t+V?=
 =?us-ascii?Q?IoEsva2Gwyg13t0El88ZDNlGlOFpZaFdg+XfYttKM4DU36jdpVREV905CJk1?=
 =?us-ascii?Q?VXP8y5peGSP1lHdVY1ecLm3Vs3qfGij4oY9iTa8K459A2W4/A9j7wi5QRX92?=
 =?us-ascii?Q?/o0SvUJ7kOmsMYQSzFKr8l2Yd38D2IkXzpCbDm7Sh/R/jWpiZw4ZNe11OEwE?=
 =?us-ascii?Q?y2DkHqJwk5YlYNxU/TjI7lCXqtA3JAW+ibsF1GULguMpE1RPWoVUX1KpIAx2?=
 =?us-ascii?Q?ew80NONup8KYQ5+6MEgjGNBjAQjwzaW9mkszo5gIJHmQwCLIdISEZBnohvlE?=
 =?us-ascii?Q?ZnwWD8lFcFSTCqRVn1lTSf+uSjV3MJBXodKSOhrhXNMVY9LQWXTw3Q+bNTDk?=
 =?us-ascii?Q?OaSAXZSBM1oPbeYNuElm9oigwGzwnYeo6iTa1SyQAL4hNIMyOwoIbUXIZlLO?=
 =?us-ascii?Q?ujvSpZazGQ0Yd3g=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(13003099007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F1A85F98BA9C034397DF5AC1DEFF8226@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10084
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ebdcbae-f539-4978-82ac-08dd8c98fe7d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|14060799003|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xNeoardmXDe/DyAtM01UnIFxW9N1n29lsg/teWhUuGNqJooG+lUvo+RJpH5R?=
 =?us-ascii?Q?zDQCrROfvJtugSe+taWU2EMpkDnIqrGh64nsiHntdrJPSr6Q9xtL527JHokE?=
 =?us-ascii?Q?nfoqSi7VBBNZUPmKBHDfvSy3cwROvGCD0HJ9rxnG/ih7pwPW1ZpD+wfDpH6p?=
 =?us-ascii?Q?KlVFZ7GYkrawIq2WWLD4rg1Bibmxq2UdwXnUiiWslY8V5hZVB2T6d5/P9/QW?=
 =?us-ascii?Q?OBrKHrIsp+QCd0b2b14tW8vjstP69EkEWUY0ZEr9MuAUTmKvpdD5khzdtB4n?=
 =?us-ascii?Q?TVUq2rel5dO7JnVP+SOt9K5qT+M5qaQ856B0yJdYz7pUg42fhT2Ci2CTGTHX?=
 =?us-ascii?Q?DRsvJW/XTpv5zmvJZGa16+M9pDwe2i0cl7SumK7ZLYMtUO//AMW7rPfPAbM/?=
 =?us-ascii?Q?PBqK2dIRA0Vl49FORS3ZI9NnU2hVKIHnDc2uJmtbkOZkwCJdDfruD9HGDTfG?=
 =?us-ascii?Q?VTQvFafXDmAZ+OS+F5koEbA87J9dmnEhfhDnhVr0ZbdznUp8b6MLHTbZATIS?=
 =?us-ascii?Q?kiwAHauKIvOelf2httYQVLxGSV3XOjP0ImAF8uRsk9lo45R2/rFRpISmmB8H?=
 =?us-ascii?Q?m4mzSGNwL1zYwBbfLFEX4pcXVyxIRoQ/fA0WkmERjsbrmQTHnhlGQmdxcUx3?=
 =?us-ascii?Q?UiuxxQ12KZBRbIEJaW1CvqIkIWt9xXOYyrIhO+4KY9M/Zv6bF5Yz1/ee4mRk?=
 =?us-ascii?Q?8JdXuHg4Xzkztpu/qe/8jqQFeG+NHz2WVp1Iw/updzoYEKDhrAEnUi7TAseH?=
 =?us-ascii?Q?mBAfykYEv3otxVuAayN2PzTEjr3dY6rUC+Gk3WAEhTkafevMt9j74kVObCza?=
 =?us-ascii?Q?OSSkXxfXY3vPfhl64FxVU/kkcT73iPYCX2V++EWAcQHhDz98BkX2RkRmNh4G?=
 =?us-ascii?Q?dT2/q1VAfRvqlqymDp2LVFCUYV6BheMB6CTgtxtEO4ctBOQ7xJF8MKh4scyo?=
 =?us-ascii?Q?k/X2YoYTAgikkQl64XrMyQeaYYnGx5GRUx7Yg6ANm3JqjPzNsmuhlWqbCTuc?=
 =?us-ascii?Q?qv+1zwt3BjoNSpfb8h2txhd/gDPJ95jSBEO1ECYjgZnz/Yow40SPuz7ScImm?=
 =?us-ascii?Q?xWu6jqi4ojM1aFBVjI81hNgCvdqC86eyE8lz2+d48mK3wsJhROQXGbzonMsY?=
 =?us-ascii?Q?fiAQL46iTD42uazmUtK3q2FauJ8JrCDJ6ni9zkWbwCQvwob2aAvhKBb4vVhl?=
 =?us-ascii?Q?sCwL/cGG3k8r9OTjW5df9RejqIKRMzi1p5v+T8G/1kjg+3spuM6gpB9+9lV2?=
 =?us-ascii?Q?D236RdLCPv6TSLSu+j6r7BT4ZQY6u9I/NmMoQOskNy0RKhm5TPd2a9MrElTR?=
 =?us-ascii?Q?bBB56S2zLg2kGRh/2PV8IwTmRT6bXstb5v+GGUVPQliA0guwlqD4xzyPRJiS?=
 =?us-ascii?Q?+QtCvCFV9SkaCKVB/w8KF1J2/UquU0J65QbdiRN4RKxlT9d6v/YZwt3FnBZq?=
 =?us-ascii?Q?0m6Xmfdd3gmz8WQWCeKpA1NLw6pEDHyRgIGm26QqM9j5yzFzTWkRl81JJZJL?=
 =?us-ascii?Q?nEwzVnmLDT8jfeQ4R0pD+KBpja26sBSBLiGYWqqRHYMF5PRLG5V2y1Xohw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(14060799003)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:25:22.2762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecdf117-394b-44a3-d53c-08dd8c991270
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8892

Hi Julien,

> On 6 May 2025, at 12:44, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 29/04/2025 16:20, Luca Fancellu wrote:
>> Document the requirement needed to boot Xen on Armv8-R platforms.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v4 changes:
>>  - New patch
>> ---
>>  docs/misc/arm/booting.txt | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 21ae74837dcc..719af74f1e69 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to confi=
gure in EL3 before starting
>>    * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1=
.
>>  +When Xen runs on Armv8-R, the highest exception level is EL2 and the o=
nly
>> +available state is secure (S) on Arm64 and non secure (NS) on Arm32, he=
nce the
>> +above requirements need to be adjusted to this case:
> > +> +* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode on =
Arm32.
>=20
> I think it would be better to update the line "Xen must be entered in NS =
EL2 mode" to clarify the state for 64-bit Arm.
>=20
> > +> +* Xen must be entered with MPU off and data cache disabled (SCTLR_E=
L2.M bit and
>> +  SCTLR_EL2.C set to 0).
>=20
> This line is valid for Armv8-A/Armv7-A when using the Image/zImage protoc=
ol.
>=20
>>    [1] linux/Documentation/arm/booting.rst
>>  Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/li=
nux.git/tree/Documentation/arch/arm/booting.rst

Just to be sure to be on the same page, are you suggesting these changes on=
 the original file?

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 21ae74837dcc..c00c651805d7 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -58,10 +58,14 @@ Firmware/bootloader requirements
=20
 Xen relies on some settings the firmware has to configure in EL3 before st=
arting Xen.
=20
-* Xen must be entered in NS EL2 mode
+* Xen must be entered in:
+  * Non-Secure EL2 mode for Armv8-A Arm64 and Arm32, Armv8-R Arm32.
+  * Secure EL2 mode for Armv8-R Arm64.
=20
 * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
=20
+* Xen must be entered with MMU/MPU off and data cache disabled (SCTLR_EL2.=
M bit
+  and SCTLR_EL2.C set to 0).
=20
 [1] linux/Documentation/arm/booting.rst
 Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux=
.git/tree/Documentation/arch/arm/booting.rst

Cheers,
Luca


