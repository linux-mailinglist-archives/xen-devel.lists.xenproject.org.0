Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7FB08FF6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 16:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046995.1417375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQ4P-0000CX-RE; Thu, 17 Jul 2025 14:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046995.1417375; Thu, 17 Jul 2025 14:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQ4P-0000As-Ne; Thu, 17 Jul 2025 14:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1046995;
 Thu, 17 Jul 2025 14:58:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tNy=Z6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ucQ4O-0000Ak-4o
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 14:58:48 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 895816ba-631e-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 16:58:45 +0200 (CEST)
Received: from CWLP265CA0339.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::15)
 by DB9PR08MB8410.eurprd08.prod.outlook.com (2603:10a6:10:3d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 17 Jul
 2025 14:58:42 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:401:5a:cafe::dd) by CWLP265CA0339.outlook.office365.com
 (2603:10a6:401:5a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.22 via Frontend Transport; Thu,
 17 Jul 2025 14:58:42 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Thu, 17 Jul 2025 14:58:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9842.eurprd08.prod.outlook.com (2603:10a6:102:31e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:55:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 14:55:19 +0000
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
X-Inumbo-ID: 895816ba-631e-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hk/I28mSdqQw5KVSK4irGDzpH4R3fQa1uKIGromeb5D/jw26gQuex+UEYcy4cWSvQGVPe5gI5tTMnpnFh74NohuG8lK1ZWAuh94kg8ipKBUoGd0z8tww/a/GdkxAMLQ9yUCW4MHNXB4AEf6dRaSdw+B5GM64u6F1uPGL4gETWHiGI0dW2TsunxXLnuCIVs4so8dNIwM5bcWShD797OkZkdr2Ly9gKdAEtAGzLk7xVcq73SF/m/OQvNVrfQFfcWBeqMCVKhTZZzy0JHknhSIPnIV4Wobqs3xPmpZK+5+elMfmiT2a0puLSno8Zwkqmu9aj7aEj4nrCvZdvGjW3RM1mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCOUp3zybXuRnUus77EylJ7lIH4OXkT6lWLlPlk3fcQ=;
 b=BbUv5ubQ7hA/dwUGe4A6DgTIRr0TIAz0j021zB4J7wlWrtDK1nQ6E6eHzKJjwwyTP2LV7I6oROJZYTrEBOH3NLeCgJBifCLWWxw4yLDkHYnqZwE3mn/RSPHNYB/RdgUVDDh4Mv5P0AFBczM8/Aucbt1YNUuBmFELUOBgX8hjR246cjkdRW1exBkEtPpTSM45KggTC5TvQNyXHyQPJhsBWdQ0N5mA6GZUwp1PAElcOs2BiWJB57vlX4Wk8dPYklhQf56wrLA8HlrIIfihOLshnE6qCnf/z3qH7uCMNa4PvwINx2H+V3mB7967xHaxCNlnWuBeCSXtBAicvq8SIZIYDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCOUp3zybXuRnUus77EylJ7lIH4OXkT6lWLlPlk3fcQ=;
 b=RKxpaAqW0104KsuQ+ltHynaAgWMUp5bCaqgd9taHPXWAn9u4nnET1wi0fP/IUqPJm3QT2DaAbmiADiEzyp9cnbUV/rvjXoo7lwN5F4Qx4VVNTh5CaO1jSQvXb/5OMz6tPU6cbwUW2wRMoHMUn39J2fRkQkhE+XYBJJWfN9N4aNE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arZJokadE1SztxH4Ql/OV7BW21d9DU1Cx2fH2BvoyV5eST3avHqyvWeL515hfbr424d6cSWLjQMYeH5B8RoOm3QeSkBnMXbHzZSI0hMiTV3yZOoKRwhBCUlmc2EGXQzhpLXm0thGOMFmO1rz9JJk+eqp2FRH90RXvtivxGYDLRpyyINc7//R3q/t1Z1y6M4KrNHYv9JUrEbR9TZBGegLgNNacl+OYB/nlTfeUy2Df8QHhDnPiphlSCxfB+YnWdDBJ1nLsIGr2NrnvRA/8DNBl4klNQcYWW4s/9T4z9bRr8awXsO5CKNWnrM6o5ZqROocw9XklCTp8N9SGtnHdwnLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCOUp3zybXuRnUus77EylJ7lIH4OXkT6lWLlPlk3fcQ=;
 b=lCPEtqUv4FIX9GsZP2Dw0YmGzVHBuDRQipwiohgSQqwx2wNJFYT5O2CkyzHrQzj0b0ppyQHrRfCBpkv03N3RSNYkLe/qprAzO4ijRaiJYxo7Ep7HIn1pS3pEOrtwWOKmPRpvTuD9t6N8mc67lFHUJKC16Rp4vUJ97HtG8t9XozY72l5FcH9ESEyNHxMudvG7HPnGcClC19u/kwM0ZyqVp8Oazy8ImbS5aLctZ46k3IP0feYXx2so/hVlC+aa1IRzMO4Msbt2b8fX8Vx9EJT2iqIpq4VsQ1o0HIRl7nfXhLfgqOHUMViGvqvlD2wgnKwh4WNm1Cs2ugzQ1CMQFJmXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCOUp3zybXuRnUus77EylJ7lIH4OXkT6lWLlPlk3fcQ=;
 b=RKxpaAqW0104KsuQ+ltHynaAgWMUp5bCaqgd9taHPXWAn9u4nnET1wi0fP/IUqPJm3QT2DaAbmiADiEzyp9cnbUV/rvjXoo7lwN5F4Qx4VVNTh5CaO1jSQvXb/5OMz6tPU6cbwUW2wRMoHMUn39J2fRkQkhE+XYBJJWfN9N4aNE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v3 2/2] docs: fusa: Add the requirements for few commands
 of XEN_VERSION
Thread-Topic: [PATCH v3 2/2] docs: fusa: Add the requirements for few commands
 of XEN_VERSION
Thread-Index: AQHbwNT/t0poWSgC+UCvRirhbzGp97PdENyAgBSxyYCARRFFgA==
Date: Thu, 17 Jul 2025 14:55:19 +0000
Message-ID: <09C806B4-4C30-4469-A908-F948C4B78EBA@arm.com>
References: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
 <20250509112447.2931909-2-ayan.kumar.halder@amd.com>
 <F4CC8423-AC3F-4F7D-AC99-047D4F8C7BF3@arm.com>
 <d99b0d90-d792-438d-911d-bcabbf9444c2@amd.com>
In-Reply-To: <d99b0d90-d792-438d-911d-bcabbf9444c2@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9842:EE_|AMS0EPF000001B0:EE_|DB9PR08MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 31efca55-271e-44dd-f190-08ddc5426b62
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?2gWemWGo5g9rZYPqsW0V9pXFbme4KkH2tcjx4AqiUUDVDC03E2pXhAsIQp8e?=
 =?us-ascii?Q?oeqWnRlIHCE7RYwRxpe4nMjjHdk7R8XOqOjhsjwpgiq1IEvHmj1as7Vn85xw?=
 =?us-ascii?Q?j4TKsCCXyoDtpHGF+8+/UdYuCIHkHFy2XdTuG5kNMOuW8ijFWLbrApvBzfBN?=
 =?us-ascii?Q?LneJHEykIU5veGS3QAnZwYNwf8J7wt2zmz3hQadLZBQh55EbnBwovzNIeB09?=
 =?us-ascii?Q?CvnPz1LmgNWbrkMMA+lwBMFbrdkX8WtJoPbj55aMdqW0kVG0NIFKgLCvlGDv?=
 =?us-ascii?Q?BYN3nPBSc1DsYSLjKYQryvnSn3NS552ZFQJLcSlYTyZc+FQdAwN+kCeOn2nl?=
 =?us-ascii?Q?NXE2iHnzJYqrBkt4XZ1Y53d0TCnRP/XeIipAV2wTUO3gi2+ZZm8DNv9NYVLm?=
 =?us-ascii?Q?Jxi5pKg8YgE3SgOC5ZKjNVIL+Tslm2ntmUZY1ETIFhWnP1qzOWHjhfqEidmw?=
 =?us-ascii?Q?Ej9mG7p6RKTNVdtaFviQM3V7oJPH1g4KrSEBXgeYbO3QuRdGAjfl71Jib+aI?=
 =?us-ascii?Q?PrN2enPHlAzAMt0fbjM7OOeTtK09OcIEk6+Z3wYplv/ObOLcHV6wyAIvteGQ?=
 =?us-ascii?Q?Zo26iKqTx3OWdiRhYz6D071PwSa0QzceOlWmrOHFbIvSNfs/UA23LbahDBne?=
 =?us-ascii?Q?eugKs4GtPoCZAwz/6ItrJCgK0NU//rOj8GvXoNtTfABdV2DujweJKc+YnHgn?=
 =?us-ascii?Q?GQMAzew047T8F9URLNyB92H5Gcjcz4wGS+KJXHpZM37pIB2v0fECUPRa5EOG?=
 =?us-ascii?Q?WyIUkbyew+BR1xE/lmwbMFk+lDcjz8bheIqOJy3HbSq9tQEwdRlq+d8ETA9t?=
 =?us-ascii?Q?ErK6oM5rSDc3XwVL876CVX3BPY080IckQirJubvhrE4yI1YeKDJCkkevA7oQ?=
 =?us-ascii?Q?PT4ilc6YOzJuinCJeiyMSB/VhVD77iv1gX8nVhXNOW/uH66c2f8iLi8zi4NE?=
 =?us-ascii?Q?OheD24J79dthdO0td7dDzxh20awu2+By+7MiyJ4XG1s1a+l2q6TR3p9mtJSJ?=
 =?us-ascii?Q?OjjDZr8fqfzo+BPYU0u+KZUBXk8jfN9zYNFZWGvKcMmRdUFXt8NJGhkUn5wR?=
 =?us-ascii?Q?XSNzZgBKEEuqNBvw2vujmqsdIoiXPI+8Te4ruHN/loGtuX34d41JVNxgd8t5?=
 =?us-ascii?Q?Tbl197lkxwJ3RiR4xwP0EGr9JH/30DXEZ4X/BA95MUwhUilAv2qkV4L4LJU6?=
 =?us-ascii?Q?El1XIxU53IculjXcMEIUMj313Hq8IotZSfHOjWTQXWWGfNEgILhfj4gcXplT?=
 =?us-ascii?Q?FhcHxKVMW6uktFL1po3k6Py+rrc/H0bKU8d6WBN/HH4ZPuaz48an+tEpLAff?=
 =?us-ascii?Q?ak4KiZv8s983b3pfA/FFN5SCXzlg9y1SnoTQU7ZgD0JOu+FwgS8LnOwcAer8?=
 =?us-ascii?Q?pbyPYA3uSON1790DYcjDOJqzKljB5TR+VteWWmvyk+MxxDA4YpsgDlrlQ4pb?=
 =?us-ascii?Q?IoRDDq4SGN0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9E5ED7DDB29AF14895BC5A9B7083EEF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9842
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	58e84a7b-f774-404e-08d5-08ddc541f320
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|35042699022|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RVI2Xr6aLw5bMvHglDCDpWtI9GiAXkTJM9MpZdYBJ5ZDc4DJE1IeYIBBpGK7?=
 =?us-ascii?Q?wJeZA9B1NpCAYrtRgdZseJ42WFozf9t3zXfiPj5F2U1N6h/QEzrojeZR4QAx?=
 =?us-ascii?Q?s7WC3Om0+C0QuWl6cHZtv9nP5+vzl/iljs6GTg35eCNQivr7v80sxfQGDUXg?=
 =?us-ascii?Q?KBAeclh5vJB9WG44haBDqQ3UMKbns58fycyRyy6eaG+t2/aTY2lAXXKPUdq/?=
 =?us-ascii?Q?QQuj4iaXd1mZi+KaZgPOBrY1WkviAW67zAzRdcjXyAYP2hQ2uDuLJiVV0yvr?=
 =?us-ascii?Q?/dNyGD5cJLgUNDgE/yrUKexXxbORwtJH0Qf7wuAoT95b3o9jsQKczuXXPIZ7?=
 =?us-ascii?Q?93xegyf92B85j7V+gEcuBdp28jU+NaPFO3wv6te8sFKqoWUaD9DcbuRdY7J/?=
 =?us-ascii?Q?/ZFuHGh3qnCQ5HF2PcW+NjfWS7oJ8e58TvVXZxj4rVsG/Q/IufOKl8ZU3Wad?=
 =?us-ascii?Q?oa6NlSSGGlMME1tzFS+9OKRcPnrcAAN1XPSKdWLz8h+KqeWNm4/X9UL4gk3V?=
 =?us-ascii?Q?Rxhiwd795sRQ04QUmpx5+R9vWXnw7MATfyqFep6rAf6lzeHtP3TIfPL52WWY?=
 =?us-ascii?Q?SiRt6APhuaSLyW8WpJcbubxpr3ahRfXHXpQmubipjRhUvC+MQ59ciw3pbirA?=
 =?us-ascii?Q?LL1l3I76spzMAH60XcHp4mVyn71apcoY30p6y061GoS+f2ivxe2ZnkoNTbhd?=
 =?us-ascii?Q?mWz0RSqIRdJm6qebVEzhQiC0gpk202Mg5aiy9jMSLcoWwksd+5nssrrHMmq5?=
 =?us-ascii?Q?/Xb7U0Hj/vaLs3S+VhqQqo7wvftyFKGJc1Q6+3zAxBzyAJNESKRrCkBEhVgt?=
 =?us-ascii?Q?S074gl6fPwjJQZSeOeMpwnxvZclh8uO/b6n2185l8KwB/B/U70l6XXPZWI8n?=
 =?us-ascii?Q?VWDqvBvL86kj4XxeTKC0WN6Tc4c1hTkdnLKQKzQb2CBQeGITNOrrVbm/QfCa?=
 =?us-ascii?Q?snMrkLz29pZR/xif81JH3R7sE+TL7orXOuSqZaFvngUNfWVhW+p0/CYrjFcM?=
 =?us-ascii?Q?QBH8EW1LivlPPL+I4cxlzvjPTB1mljtUNI3XOTwgi57Loky3dAatm9Mdo0bw?=
 =?us-ascii?Q?tdnlMPfuACU2XxI0ISO2vcv/hEud+fFiCeKdBreTWhnT6upTDBHuXAn5k++z?=
 =?us-ascii?Q?Esv8N4yhVmuFKMgLmM0KyI9Vx+LVhz2cKmM+gpoJvoiWCnD6RNBW+EhW5djd?=
 =?us-ascii?Q?RyTr1SJPe2byqqZg8w9x2zn3JoH1oDstZprhddt+WZqQ7VzkDXMAYnYCnke6?=
 =?us-ascii?Q?R7fmfiUPkB6ZRKkgqf+DAmqcZXWM17r7pCHJnxGBQzpFZxmKnP1/ACZP/c+q?=
 =?us-ascii?Q?ZsuVIFVDrMc/oyR1/F5W1YIfEAdQbNkrSiCbPealiuWQQ6oL7KzNQriTsjMM?=
 =?us-ascii?Q?EwRORJyqQ9cv1+Hnbn1mYczpAUmaklTBFSSGstQpeJFzveUpm7GsCQYBMGo2?=
 =?us-ascii?Q?ndX2DtRliVZk2mKkfIkGOgh+NYNPb8RP3YAIyr+zOn24DP8Yckngqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(35042699022)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:58:41.5648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31efca55-271e-44dd-f190-08ddc5426b62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8410

Hi Ayan,

Sorry for the delay.

> On 3 Jun 2025, at 18:11, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 21/05/2025 13:10, Bertrand Marquis wrote:
>> Hi Ayan,
> Hi Bertrand,
>>=20
>>> On 9 May 2025, at 13:24, Ayan Kumar Halder <ayan.kumar.halder@amd.com> =
wrote:
>>>=20
>>> Define requirements for specific commands.
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>=20
>>> v1 - 1. Reworded the requirement so as to avoid mentioining variable na=
mes
>>> or hardcoded strings. Otherwise, one would need to change the requireme=
nt
>>> each time the code changes.
>>>=20
>>> v2 - 1. Moved few changes to previous patch.
>>>=20
>>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 15 ++++
>>> .../design-reqs/arm64/version_hypercall.rst   | 34 ++++++++
>>> .../reqs/design-reqs/version_hypercall.rst    | 82 ++++++++++++++++++
>>> docs/fusa/reqs/index.rst                      |  3 +
>>> docs/fusa/reqs/product-reqs/hypercall.rst     | 20 +++++
>>> .../reqs/product-reqs/version_hypercall.rst   | 83 +++++++++++++++++++
>>> 6 files changed, 237 insertions(+)
>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.r=
st
>>> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>>> create mode 100644 docs/fusa/reqs/product-reqs/hypercall.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa=
/reqs/design-reqs/arm64/hypercall.rst
>>> index f00b0b00f9..f58a9d50aa 100644
>>> --- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> @@ -56,3 +56,18 @@ Comments:
>>> Covers:
>>>  - `XenProd~version_hyp_first_param~1`
>>>  - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Return value
>>> +------------
>>> +
>>> +`XenSwdgn~arm64_ret_val~1`
>>> +
>>> +Description:
>>> +Xen shall store the return value in first cpu core register.
>> use x0 instead.
> Ack
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~hyp_err_ret_val~1`
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/d=
ocs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..3aa12ea2c2
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>>> @@ -0,0 +1,34 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Capabilities
>>> +------------
>>> +
>>> +`XenSwdgn~arm64_capabilities~1`
>>> +
>>> +Description:
>>> +Xen shall have an internal constant string to denote that the cpu is r=
unning
>>> +in arm64 mode.
>> This is untestable if this is purely internal so this cannot be a requir=
ement
>> I am not quite sure why you need this, can you explain ?
>=20
> We had agreed on this wording in "[PATCH v1 2/2] docs: fusa: Add the requ=
irements for some of the commands of XEN_VERSION". You had mentioned this
>=20
> ```
>=20
> All in all, the design just need to say that it must be stored somewhere =
"bounded" to the source code so that a tester can check it.
>=20
> ```
>=20
> So, I infer that needs to be validated by code inspection. The string is =
set in init_xen_cap_info().

ok at the end this might be tested by inspecting the image ro data section.

>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_capabilities_cmd~1`
>>> +
>>> +Capabilities AArch32
>>> +--------------------
>>> +
>>> +`XenSwdgn~arm64_capabilities_aarch32~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant string to denote that the cpu is ru=
nning in
>>> +arm32 mode.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_capabilities_cmd~1`
>>> +
>>> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fu=
sa/reqs/design-reqs/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..aac5896965
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
>>> @@ -0,0 +1,82 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Version
>>> +-------
>>> +
>>> +`XenSwdgn~version~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant (XEN_VERSION) storing the version n=
umber
>>> +coming from the Makefile.
>> I really have doubts about this and the following one.
>>=20
>> If this only goal is to say what should be returned in the XEN_VERSION h=
ypcall you might
>> just need something saying it and mention this as a comment because you =
will have a very
>> hard time to test such a requirement.
>=20
> Should I say
>=20
> Description:
>=20
> Xen shall return its version when XENVER_version command is invoked.

yes that sounds better.

>=20
> If so , then ...
>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_version_cmd~1`
>>> +
>>> +Subversion
>>> +----------
>>> +
>>> +`XenSwdgn~subversion~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant (XEN_SUBVERSION) storing the sub ve=
rsion
>>> +number coming from the Makefile.
> Xen shall return its extra version when XENVER_extraversion command is in=
voked.

yes

>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_version_cmd~1`
>>> +
>>> +Error copying buffer
>>> +--------------------
>>> +
>>> +`XenSwdgn~error_copy_buffer~1`
>>> +
>>> +Description:
>>> +Xen shall return -EFAULT if it is not able to copy data to domain's bu=
ffer.
>>> +
>>> +Rationale:
>>> +-EFAULT is one of the error code defined in
>>> +http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/pu=
blic/errno.h.
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~hyp_err_ret_val~1`
>>> +
>>> +Extraversion
>>> +------------
>>> +
>>> +`XenSwdgn~extraversion~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant (XEN_EXTRAVERSION) storing the extr=
aversion
>>> +coming from the build environment.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_extraversion_cmd~1`
>>> +
>>> +Changeset
>>> +---------
>>> +
>>> +`XenSwdgn~changeset~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant string (XEN_CHANGESET) storing the =
date,
>>> +time and git hash of the last change made to Xen's codebase.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_changeset_cmd~1`
>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>> index d8683edce7..de19b0cda2 100644
>>> --- a/docs/fusa/reqs/index.rst
>>> +++ b/docs/fusa/reqs/index.rst
>>> @@ -11,6 +11,9 @@ Requirements documentation
>>>    product-reqs/reqs
>>>    product-reqs/arm64/reqs
>>>    product-reqs/version_hypercall
>>> +   product-reqs/hypercall
>>>    design-reqs/arm64/generic-timer
>>>    design-reqs/arm64/sbsa-uart
>>>    design-reqs/arm64/hypercall
>>> +   design-reqs/arm64/version_hypercall
>>> +   design-reqs/version_hypercall
>>> diff --git a/docs/fusa/reqs/product-reqs/hypercall.rst b/docs/fusa/reqs=
/product-reqs/hypercall.rst
>>> new file mode 100644
>>> index 0000000000..b57b9acde8
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/product-reqs/hypercall.rst
>>> @@ -0,0 +1,20 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Error Return Value
>>> +------------------
>>> +
>>> +`XenProd~hyp_err_ret_val~1`
>>> +
>>> +Description:
>>> +In case the hypercall fails, Xen shall return one of the error codes d=
efined
>>> +in http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include=
/public/errno.h.
>> s/the/an/ hypercall otherwise it is not quite clear which hypercall you =
mean.
> Ack
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/f=
usa/reqs/product-reqs/version_hypercall.rst
>>> index 400d51bbeb..2ef1c4f9ca 100644
>>> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> @@ -41,3 +41,86 @@ Covers:
>>>=20
>>> Needs:
>>>  - XenSwdgn
>>> +
>>> +Version command
>>> +---------------
>>> +
>>> +`XenProd~version_hyp_version_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 0) for  hypercall (num 17) to retriev=
e Xen's
>>> +version in the domain's register 0.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Xen version is composed of major and minor number.
>> How Xen version is encoded should be a requirement, you can add this dir=
ectly into
>> the definition of this one in fact i think.
>=20
> Do you mean the description should be :-
>=20
> Description:
>=20
> Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve X=
en's
> version (composed of major and minor number) in the domain's register 0.

If you want to test that the version is what you expect you need to know ho=
w it is encoded.
So might be something like major number in bits x to y, minor in xxx etc.

>=20
>>=20
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Extraversion command
>>> +--------------------
>>> +
>>> +`XenProd~version_hyp_extraversion_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
>>> +extraversion in the domain's buffer.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSIO=
N' command
>>> +line parameter while building Xen.
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Capabilities command
>>> +--------------------
>>> +
>>> +`XenProd~version_hyp_capabilities_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
>>> +capabilities to the domain's buffer.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Capabilities related information is represented by char[1024].
>>> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
>> Isn't it mandatory for xen to return aarch64 for arm64 ?
>> This could be turned into a requirement (easily testable).
>=20
> So should I change the following design requirement
>=20
> "Xen shall have an internal constant string to denote that the cpu is run=
ning in arm64 mode."
>=20
> to
>=20
> "Xen shall return xen-3.0-aarch64 to denote that the cpu is running in ar=
m64 mode."

yes

>=20
>>=20
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Changeset command
>>> +-----------------
>>> +
>>> +`XenProd~version_hyp_changeset_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 4) for hypercall (num 17) to copy cha=
ngeset
>>> +to the domain's buffer.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Changeset is string denoting the date, time and git hash of the last c=
hange
>>> +made to Xen's codebase.
>> Does this has a standard format ? if so it should be explained.
>=20
> This is a implementation level detail. The format is autogenerated in com=
pile.h
>=20
> "Mon Dec 30 22:00:31 2024 +0100 git:0d729221ab"
>=20
> How do you want me explain this ?

No then the sentence is ok as is i would say.

Cheers
Bertrand

>=20
> - Ayan
>=20
>>=20
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> --=20
>>> 2.25.1
>>>=20
>> Cheers
>> Bertrand



