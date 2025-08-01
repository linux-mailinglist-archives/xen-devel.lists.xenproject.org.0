Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C15B17D36
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 09:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066875.1431919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhjvc-0004mY-GS; Fri, 01 Aug 2025 07:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066875.1431919; Fri, 01 Aug 2025 07:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhjvc-0004kE-D0; Fri, 01 Aug 2025 07:11:44 +0000
Received: by outflank-mailman (input) for mailman id 1066875;
 Fri, 01 Aug 2025 07:11:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpGp=2N=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uhjva-0004LS-N4
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 07:11:42 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5b914b1-6ea6-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 09:11:41 +0200 (CEST)
Received: from AM6P192CA0073.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::14)
 by DB9PR08MB6377.eurprd08.prod.outlook.com (2603:10a6:10:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 07:11:27 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:209:8d:cafe::d9) by AM6P192CA0073.outlook.office365.com
 (2603:10a6:209:8d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 07:11:27 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Fri, 1 Aug 2025 07:11:26 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9653.eurprd08.prod.outlook.com (2603:10a6:10:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 07:10:54 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 07:10:54 +0000
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
X-Inumbo-ID: c5b914b1-6ea6-11f0-b895-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=c5kCaFbIMkM5lYLK6rZNBZZATg0cQq4WY6qvshTYKOCY4rN7FnoSAfB0hoLJSlKWzbPB5bjPwGF7Nim0YXvoOWNaWq1kX/gK3ecgnBCOi5X/HM1F/JgSVPdwSquwj8WfBLFns4S+6X1fmzWbD32HNY55d2X/gBkF4NSsOrPeAbWNA67eUkiYdtxSbux3E02K0jYmV7vUyqGtBiFbRG22nLc4MiVhCMkIRkKK+BotGjuyLYQDfKkKrbn3Vft4FASVWm/yJt/5n303Yl3nOBRGhUWuYcB1j5SX0QmR5I0cM8PSgsbXX2rb+5Yy/qDiA9fAtj38Hy8ki55yCscyghoj7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALOs//xUM8fOs/AdT4f1GGnMIeqL+0xTf/QhGePVeE4=;
 b=Tkf30MOEbxSYP0hWfgucquPEmDBLh2oFGcny+YHwaFXIM6AZjOXFPBwMFqKnz/EZt8bOT9G2f9Ftk5s/UZ5SHrfPwYpQzqkJ1SkGKkvGmS7+NlFc0NAp/JpA3IETc/hVunWtcQHJWisUMtTYVyP7AwgoDZqgfxt271f7bZKRDX21yhmDDxk3uchhPNkF+jphy3EGOXSCnnQLQzbMls2yM9kMemzj6t+fXvyg4X01Rs5JwB/j531c1jkLTPI5onExIv04hk5RmqicgxZehfvOm7SLrxF7Xg0hFBvPcdQOk0stJMGWU/aXh6UlQ0Nb+JSRAHxkUrfyIr2FoKFluAyTzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALOs//xUM8fOs/AdT4f1GGnMIeqL+0xTf/QhGePVeE4=;
 b=FOZNiMRnYY5M1Fl6XboXT1WthBG4SVUYu+ZoRw8kpJWlG1XmzU7T3oSDJW5qDQXJIM1ZKEX4vYJl3tnNQbNXU2zAMNvT3b/SNTiY43H5cXn4KN3OUtHDcuhqguHgwpalY7heYIbAkJf+5fkdct80iV7ooRN1AsxvvVMIQgOETmM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnZYnHjZWc+BNQoldV5fVhrQuf6XrR7MkauN2d8X/z2Kg0t6x58abeg5gYr6+zRJdq+4vibz9GRcXRxFJbAnG6AN95B22YipX+Dpv/VjN2vcoxqyztDOiA+d3xqEt4WZ/5Tag9DEgdZWtdkpyYm0aIGGce89yIKCcbYpXJpeo7q9aSE32k2zU6RWw/9UyFWDG9AzCTJrQc/6sTNNlWiP1FSuDs3ULSe1YVDS38kl3HtzK3jQykI3TPp4E4wnQHUFyNec6/9FSzgETco/y2p/dBFmLoJRnL3r24S3edX/FImkSk6bA/jqiyoGkGAlAC1arto6HmfPluZHoQ0yfhCRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALOs//xUM8fOs/AdT4f1GGnMIeqL+0xTf/QhGePVeE4=;
 b=aRcEVH+eTDh30/2BCear2LHhVImuJFZ9V+2K/zE7JBvsXGGFFELU8DdU2jyOKEMGM8bsU2Lqd4jKYdT2g9z/AKa5hcseWXE5of8d6LTzUy8RVVNVkIW6lIbYIk+IbefhLAnO15yOjYj2gvG4m9T6rSyXPUAVpyDLShMFx7+aJTCtlw+iutRjZdpm3ZYtqIax2ZYQY7y0/NOqFnHr6aHI8KmqFb0PS8olE8XwPx26h7Nlcl3HonOyId+9rsjgBTyCp5NchReifab1OLVN+wDjBrbFfBucR0S0v5Kcle8S/lqIAt/N9Pzgz0uAbsosIHitxo+moJ78SMEBce8yAedpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALOs//xUM8fOs/AdT4f1GGnMIeqL+0xTf/QhGePVeE4=;
 b=FOZNiMRnYY5M1Fl6XboXT1WthBG4SVUYu+ZoRw8kpJWlG1XmzU7T3oSDJW5qDQXJIM1ZKEX4vYJl3tnNQbNXU2zAMNvT3b/SNTiY43H5cXn4KN3OUtHDcuhqguHgwpalY7heYIbAkJf+5fkdct80iV7ooRN1AsxvvVMIQgOETmM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v7 6/6] xen/arm: ffa: Enable VM to VM without firmware
Thread-Topic: [PATCH v7 6/6] xen/arm: ffa: Enable VM to VM without firmware
Thread-Index: AQHb9xP7T/VoLAfGvk2gcX5wpv2f7LRNeKMA
Date: Fri, 1 Aug 2025 07:10:54 +0000
Message-ID: <A9B4FBBC-1FFE-4473-AB46-FE04C997A515@arm.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <9ed199ef3be4b6dc665f19f96ba4063c61ccbf00.1752754016.git.bertrand.marquis@arm.com>
In-Reply-To:
 <9ed199ef3be4b6dc665f19f96ba4063c61ccbf00.1752754016.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9653:EE_|AMS1EPF00000047:EE_|DB9PR08MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b7b228-0210-48e9-cea5-08ddd0caa13e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?cCyegifALqocElyUaAe46eU50QyNAo5cROWZFoYe6vOVRiRRdXoJagkWZsh3?=
 =?us-ascii?Q?XjjoQ67urWiIOflOOde5LFo0UA4gx+d9p5iYTrHt84DpM1hD3IWV1AQdH1k6?=
 =?us-ascii?Q?NFHhFGvzv5TbAjKRRApeP1ZJvtua7GTWn3SSzU/H9Qh0worDm3mCszpf6kEo?=
 =?us-ascii?Q?/n9eD0Yh0MxDNd6mMqJd0PoglwZLskqwUtPEY0sJ3iGZ1Szvfq5dVrARnkww?=
 =?us-ascii?Q?/A9IACCTJ2rQt6dBpsWo4ANq5Nips1ZhgoEXjyDTzw1IGBP/TiDVsIVSM3nI?=
 =?us-ascii?Q?BNS7ahXf5Bjoc1ER9+o21XlJ9vw/EQldhcTuAL12R9GTlPxvy8pYo0zNuhI4?=
 =?us-ascii?Q?3g8ZWUMS6r3C4s/UmCCfLC1JSmLdWp9eB70o8UCini9dKEVMDYp9JxHYaIQ1?=
 =?us-ascii?Q?EgwI6UdykSF8ydlvprCvM8iFg9eDHCe51KffybzjRtVww+oTJHp153gqoIhL?=
 =?us-ascii?Q?PQk+FBuf+lBZAKX4oLfRI9xNWrsUm9ylvVzuRxxUbnF5gW9BYsXSM2+3v4D2?=
 =?us-ascii?Q?s23RNzGTb08nA+ixixlenrJsCox5E5ff+t/09LwfZck7ujfgpYfv0wnNy9P9?=
 =?us-ascii?Q?HyO9i9M3ElITSLdVyq2ilimBAhc/8XDF/xavtgbTIb0k9KUy0NhWzc/I+2Yi?=
 =?us-ascii?Q?Z9GQLtCgMQuTSi1JKsni7+KS9Q7PoF7A23aHmT+x8xu83PK7/jBbI5lvultP?=
 =?us-ascii?Q?z9+xQAYuNGRCOGg2hB3snh7aw36rgkWCwEu4yU1aTfasNK86GBo/EaVGcghw?=
 =?us-ascii?Q?vBRUB3SJblsfRnnAXnjmzDJ3eAGnt09Cp8yHso/B0sCnerhncOg7SEocNVJO?=
 =?us-ascii?Q?N+dDXGI/tv3u7fjt58gRhzvINL8b4IkJELWaUiIqcpv9UWAhGy+OyU4178Mb?=
 =?us-ascii?Q?SUfx/1dL0YiCwofWOpl+bz0xNpMdA9rNPahatXsGZjEl/WTgEjyMGeOFSjKu?=
 =?us-ascii?Q?BtmS/UPHVAPxPRhfOr3IZGY+9nmQ/ntrcDskg24nmVYiSXBVsUH01lpJo5c4?=
 =?us-ascii?Q?vSKGn2lal11hzcgJXt3+byzlXg4liJxkqbuoc/92veXubgTztmJpYRzstjr2?=
 =?us-ascii?Q?+I1Kt1ZAC2bc4DfyKKDtAChrvnCSvJU6lzZPJvEPY2XaZl9Bjiw++H7yThjX?=
 =?us-ascii?Q?msyY6yXNE9aybBTqJGMpQ9LPccR0RDmFF7C7g6NIriXBRA5HYJ0Qw3n5veZN?=
 =?us-ascii?Q?mgyMIhF1WX81e0zgYd1KdbItm2uS8eARDYFKYAH060Ke+/4H+gW0ShDAnWAy?=
 =?us-ascii?Q?/zvexke9xx0wZYPUJ9j+hR7xu72TtTbVkVHQyKoVSl5Yp9nbRYUmbSE59QcI?=
 =?us-ascii?Q?D2rIYVIHBK5dXm30rgiRQkDqymcbK97Met7GcF7j8JAeEr7uvd4DkitqK25V?=
 =?us-ascii?Q?T3dWzD6WzgbYAPGCofH/I7KypXKwu/HbTEe01EVSyVEkXB6M45ohCk0R2GgB?=
 =?us-ascii?Q?R8NmU4Hh7Ev0jTiLjZI0wiSkep2eWMisYGqoeu55RUOtWWM8Cf/ccQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3A3070771BED74FB4DDFB5112FCACAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9653
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c4528c2-197b-49d5-853b-08ddd0ca8e2e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zsc73R4kb8TJJ7X9ezOXuVZUHoUVSN2Gr5Cw0Hsypw6BCBfWt63meyetDF/D?=
 =?us-ascii?Q?4ap7+TCnmhbb0tnvmN7jv1Yb2j45Aits2F4c6NPuMjCgjPmOltwfxhzvvV1Y?=
 =?us-ascii?Q?E1YczBzbnKdIcWZGpNb95Rl6CMGedbHDSmjaefvpGIApHWHT1DQ4NJjs55GD?=
 =?us-ascii?Q?G4fDssLHhmJS7j30OvsuklTkyIJTomWJmEChUjUxFQLP67anLVBoxft9lxIu?=
 =?us-ascii?Q?dY5axZDa9ORUJUDNTDSCe5i/o6LGkgInSd9uOJBUeS5adp0gRI4zyqlTw1uY?=
 =?us-ascii?Q?I2vHlpZhRSYN9gi+P7cfU54ymv2+nzKZXApx62CrxuC3RalDdDPAjesY4M8v?=
 =?us-ascii?Q?DEipIOoturL3Wvoaem7i+ED7fVupBPOsgUCYiKtE7EfKLVKMUU5RTN18eBJU?=
 =?us-ascii?Q?uopH/hW4u1fDsVbiCxIPTEFWqEkMSySIaUbzt5SuI9+dLzeDUGXyvJDLNM06?=
 =?us-ascii?Q?HKx/KMrm+8G1L/9SC2mV2T2PjElMvwwM1s2ACAUFubSeQT64P7/+UK+FHxsI?=
 =?us-ascii?Q?sp8fKqiiobC4D+iv96SXQZm6hYRAKs2BjrzykgANG2eeLcBC5PIPAfqUYQl/?=
 =?us-ascii?Q?MtYL7rP0LaXxA3NNyOrtqstXCLnq54W07QDSe9MY8q71GT4xFSP7EUYbbxWb?=
 =?us-ascii?Q?L0d+tNyeX8N/pA2kExT9guk/G2D18IYSr8ciUgXjQbgNKYgNkNDPgo5gIJY5?=
 =?us-ascii?Q?hzy36v7pxa/M+HcbVJLwXev4veaqFnwp/wMcCec+CqfU1JebmRdPmGEpG0qo?=
 =?us-ascii?Q?kMZQQkNtfH9Kit+6Mwzap2yHSFhfLkAnsHcmXgxLtUW2xWOmUGOsOnDWO2FB?=
 =?us-ascii?Q?2fd2NXsC4LK7yj2O75f1pk12VxVjWnJiCAnRd98FjbxVjB7IoudJ9SXTIz1z?=
 =?us-ascii?Q?woa8LFr5hRMAcm/DgpZbh+bAJXZGjQPzpKxBxnBAimrjJ8FUSe/kCuE0XUGg?=
 =?us-ascii?Q?n7zzuIeGRjIg/WseQxb3egLVq/hyhwO4fBppd76LEXK9x61rD4HMG5Wj2Ary?=
 =?us-ascii?Q?2CldHMN9UpooIlNZrTErWHpGDyvFh7qMy2dST7nu+S8RTfYhX0/d+BNFKALe?=
 =?us-ascii?Q?YdCtM1O2L81gmGxCgJnLlAV6XlFSFBLg1bsO/n08A2O6zBtlFBn2ThdurAko?=
 =?us-ascii?Q?o0ugKXCc6YjB8XeQveLd/I791H5u8xedxDAUgQhe2S+5q3egVnhRCI+bzrD0?=
 =?us-ascii?Q?LXZUjpB0PHbtSLosPbk1GcS4pVsKLymnr6C2nf1jhR6KnUmKROd+XMmv0r+Y?=
 =?us-ascii?Q?3GggAKZB7u9mgRx5z/OAgl8EWcWO5s6LsW4wQlRIrziLR/FzfvXiQNd+F55R?=
 =?us-ascii?Q?2sKgnObeul5WfcrlPhs5slyUMhazSeM7/TpwthwUInguoO27tNLBqQjzzsci?=
 =?us-ascii?Q?IbiGFJjFkhxv/slzlHgp/QYzWR4gUfQmiaX+q1q1sRAnUwXe3sV/7hs7uvFp?=
 =?us-ascii?Q?gAfx/Uf9yfwN8Xmu+8EOx1ggqZCesCe7SU0/awcDoTScU1VFqfy9INjigBdk?=
 =?us-ascii?Q?kZNkC6Pu5kCsp0OF2qzlnX87sVpVPMPtaeds?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 07:11:26.2712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b7b228-0210-48e9-cea5-08ddd0caa13e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6377

Hi,

A gentle ping for someone to review this :-)

Thanks
Bertrand

> On 17 Jul 2025, at 14:11, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.
> If there is OP-TEE running in the secure world and using the non FF-A
> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
> probed first) so it is not recommended to activate the configuration
> option for such systems.
>=20
> To make buffer full notification work between VMs when there is no
> firmware, rework the notification handling and modify the global flag to
> only be used as check for firmware notification support instead.
>=20
> Also split probe function into one for firmware and one for vm to vm to
> make the implementation clearer.
>=20
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
>=20
> ---
> Changes in v7:
> - add Jens R-b
> Changes in v6:
> - split probe into fw and vm_to_vm probe
> Changes in v5:
> - init ctx list when there is no firmware
> - rework init a bit to prevent duplicates
> - Remove Jens R-b due to changes done
> Changes in v4:
> - Fix Optee to OP-TEE in commit message
> - Add Jens R-b
> Changes in v3:
> - fix typos in commit message
> - add spaces around <<
> - move notification id fix back into buffer full patch
> - fix | position in if
> Changes in v2:
> - replace ifdef with IS_ENABLED when possible
> ---
> xen/arch/arm/tee/ffa.c       |  93 ++++++++++++++++++-------------
> xen/arch/arm/tee/ffa_notif.c | 104 ++++++++++++++++-------------------
> 2 files changed, 104 insertions(+), 93 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index be71eda4869f..df38b4e15b36 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -345,8 +345,9 @@ static int ffa_domain_init(struct domain *d)
>     struct ffa_ctx *ctx;
>     int ret;
>=20
> -    if ( !ffa_fw_version )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !ffa_fw_version )
>         return -ENODEV;
> +
>     /*
>      * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A ID 0=
 is
>      * reserved for the hypervisor and we only support secure endpoints u=
sing
> @@ -477,38 +478,12 @@ static void ffa_init_secondary(void)
>     ffa_notif_init_interrupt();
> }
>=20
> -static bool ffa_probe(void)
> +static bool ffa_probe_fw(void)
> {
>     uint32_t vers;
>     unsigned int major_vers;
>     unsigned int minor_vers;
>=20
> -    /*
> -     * FF-A often works in units of 4K pages and currently it's assumed
> -     * that we can map memory using that granularity. See also the comme=
nt
> -     * above the FFA_PAGE_SIZE define.
> -     *
> -     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
> -     * until that is fully handled in this code make sure that we only u=
se
> -     * 4K page sizes.
> -     */
> -    BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> -
> -    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> -           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> -
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> -    {
> -        /*
> -         * When FFA VM to VM is enabled, the current implementation does=
 not
> -         * offer any way to limit which VM can communicate with which VM=
 using
> -         * FF-A.
> -         * Signal this in the xen console and taint the system as insecu=
re.
> -         * TODO: Introduce a solution to limit what a VM can do through =
FFA.
> -         */
> -        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure =
!!\n");
> -        add_taint(TAINT_MACHINE_INSECURE);
> -    }
>     /*
>      * psci_init_smccc() updates this value with what's reported by EL-3
>      * or secure world.
> @@ -527,11 +502,6 @@ static bool ffa_probe(void)
>         goto err_no_fw;
>     }
>=20
> -    /* Some sanity check in case we update the version we support */
> -    BUILD_BUG_ON(FFA_MIN_SPMC_VERSION > FFA_MY_VERSION);
> -    BUILD_BUG_ON(FFA_VERSION_MAJOR(FFA_MIN_SPMC_VERSION) !=3D
> -                                   FFA_MY_VERSION_MAJOR);
> -
>     major_vers =3D FFA_VERSION_MAJOR(vers);
>     minor_vers =3D FFA_VERSION_MINOR(vers);
>=20
> @@ -582,10 +552,6 @@ static bool ffa_probe(void)
>         goto err_rxtx_destroy;
>=20
>     ffa_notif_init();
> -    INIT_LIST_HEAD(&ffa_teardown_head);
> -    INIT_LIST_HEAD(&ffa_ctx_head);
> -    rwlock_init(&ffa_ctx_list_rwlock);
> -    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
>=20
>     return true;
>=20
> @@ -599,6 +565,59 @@ err_no_fw:
>     return false;
> }
>=20
> +static bool ffa_probe_vm_to_vm(void)
> +{
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        return false;
> +
> +    /*
> +     * When FFA VM to VM is enabled, the current implementation does not
> +     * offer any way to limit which VM can communicate with which VM usi=
ng
> +     * FF-A.
> +     * Signal this in the xen console and taint the system as insecure.
> +     * TODO: Introduce a solution to limit what a VM can do through FFA.
> +     */
> +    printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure !!\n=
");
> +    add_taint(TAINT_MACHINE_INSECURE);
> +
> +    return true;
> +}
> +
> +static bool ffa_probe(void)
> +{
> +    /*
> +     * FF-A often works in units of 4K pages and currently it's assumed
> +     * that we can map memory using that granularity. See also the comme=
nt
> +     * above the FFA_PAGE_SIZE define.
> +     *
> +     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
> +     * until that is fully handled in this code make sure that we only u=
se
> +     * 4K page sizes.
> +     */
> +    BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> +
> +    /* Some sanity check in case we update the version we support */
> +    BUILD_BUG_ON(FFA_MIN_SPMC_VERSION > FFA_MY_VERSION);
> +    BUILD_BUG_ON(FFA_VERSION_MAJOR(FFA_MIN_SPMC_VERSION) !=3D
> +                                   FFA_MY_VERSION_MAJOR);
> +
> +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> +
> +    if ( !ffa_probe_fw() && !ffa_probe_vm_to_vm() )
> +        return false;
> +
> +    if ( !ffa_fw_version )
> +        printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> +
> +    INIT_LIST_HEAD(&ffa_teardown_head);
> +    INIT_LIST_HEAD(&ffa_ctx_head);
> +    rwlock_init(&ffa_ctx_list_rwlock);
> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
> +
> +    return true;
> +}
> +
> static const struct tee_mediator_ops ffa_ops =3D
> {
>     .probe =3D ffa_probe,
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index f6df2f15bb00..86bef6b3b2ab 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -16,7 +16,7 @@
>=20
> #include "ffa_private.h"
>=20
> -static bool __ro_after_init notif_enabled;
> +static bool __ro_after_init fw_notif_enabled;
> static unsigned int __ro_after_init notif_sri_irq;
>=20
> int ffa_handle_notification_bind(struct cpu_user_regs *regs)
> @@ -27,21 +27,17 @@ int ffa_handle_notification_bind(struct cpu_user_regs=
 *regs)
>     uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>     uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>=20
> -    if ( !notif_enabled )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>     if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
>         return FFA_RET_INVALID_PARAMETERS;
>=20
>     if ( flags )    /* Only global notifications are supported */
>         return FFA_RET_DENIED;
>=20
> -    /*
> -     * We only support notifications from SP so no need to check the sen=
der
> -     * endpoint ID, the SPMC will take care of that for us.
> -     */
> -    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_lo,
> -                           bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
> +                               bitmap_lo, bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
> }
>=20
> int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> @@ -51,18 +47,14 @@ int ffa_handle_notification_unbind(struct cpu_user_re=
gs *regs)
>     uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>     uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>=20
> -    if ( !notif_enabled )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>     if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
>         return FFA_RET_INVALID_PARAMETERS;
>=20
> -    /*
> -     * We only support notifications from SP so no need to check the
> -     * destination endpoint ID, the SPMC will take care of that for us.
> -     */
> -    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
lo,
> -                            bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bit=
map_lo,
> +                                bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
> }
>=20
> void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> @@ -71,7 +63,7 @@ void ffa_handle_notification_info_get(struct cpu_user_r=
egs *regs)
>     struct ffa_ctx *ctx =3D d->arch.tee;
>     bool notif_pending;
>=20
> -    if ( !notif_enabled )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>     {
>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>         return;
> @@ -108,7 +100,7 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>     uint32_t w6 =3D 0;
>     uint32_t w7 =3D 0;
>=20
> -    if ( !notif_enabled )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>     {
>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>         return;
> @@ -120,7 +112,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>         return;
>     }
>=20
> -    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                                        FFA_NOTIF_FLAG_BITMAP_SPM )) )
>     {
>         struct arm_smccc_1_2_regs arg =3D {
>             .a0 =3D FFA_NOTIFICATION_GET,
> @@ -177,15 +170,14 @@ int ffa_handle_notification_set(struct cpu_user_reg=
s *regs)
>     uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>     uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>=20
> -    if ( !notif_enabled )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>     if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
>         return FFA_RET_INVALID_PARAMETERS;
>=20
> -    /* Let the SPMC check the destination of the notification */
> -    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_=
lo,
> -                           bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bit=
map_lo,
> +                               bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
> }
>=20
> #ifdef CONFIG_FFA_VM_TO_VM
> @@ -371,7 +363,7 @@ void ffa_notif_init_interrupt(void)
> {
>     int ret;
>=20
> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
>     {
>         /*
>          * An error here is unlikely since the primary CPU has already
> @@ -402,41 +394,41 @@ void ffa_notif_init(void)
>     int ret;
>=20
>     /* Only enable fw notification if all ABIs we need are supported */
> -    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> -           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> -           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> -           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
> -        return;
> -
> -    arm_smccc_1_2_smc(&arg, &resp);
> -    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> -        return;
> -
> -    irq =3D resp.a2;
> -    notif_sri_irq =3D irq;
> -    if ( irq >=3D NR_GIC_SGI )
> -        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> -    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
> -    if ( ret )
> +    if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> +         ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> +         ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> +         ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64) )
>     {
> -        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
> -               irq, ret);
> -        return;
> -    }
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 !=3D FFA_SUCCESS_32 )
> +            return;
>=20
> -    notif_enabled =3D true;
> +        irq =3D resp.a2;
> +        notif_sri_irq =3D irq;
> +        if ( irq >=3D NR_GIC_SGI )
> +            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +        ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NUL=
L);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\=
n",
> +                   irq, ret);
> +            return;
> +        }
> +        fw_notif_enabled =3D true;
> +    }
> }
>=20
> int ffa_notif_domain_init(struct domain *d)
> {
>     int32_t res;
>=20
> -    if ( !notif_enabled )
> -        return 0;
> +    if ( fw_notif_enabled )
> +    {
>=20
> -    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpu=
s);
> -    if ( res )
> -        return -ENOMEM;
> +        res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_=
vcpus);
> +        if ( res )
> +            return -ENOMEM;
> +    }
>=20
>     return 0;
> }
> @@ -447,6 +439,6 @@ void ffa_notif_domain_destroy(struct domain *d)
>      * Call bitmap_destroy even if bitmap create failed as the SPMC will
>      * return a DENIED error that we will ignore.
>      */
> -    if ( notif_enabled )
> +    if ( fw_notif_enabled )
>         ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> }
> --=20
> 2.47.1
>=20
>=20


