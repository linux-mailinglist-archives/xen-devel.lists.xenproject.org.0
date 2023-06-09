Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F572965F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545809.852399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z4l-00077G-4v; Fri, 09 Jun 2023 10:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545809.852399; Fri, 09 Jun 2023 10:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z4l-00074P-1G; Fri, 09 Jun 2023 10:10:35 +0000
Received: by outflank-mailman (input) for mailman id 545809;
 Fri, 09 Jun 2023 10:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7Z4j-00074H-R4
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:10:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbf15a94-06ad-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 12:10:29 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 06:10:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5626.namprd03.prod.outlook.com (2603:10b6:806:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 10:10:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 10:10:25 +0000
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
X-Inumbo-ID: dbf15a94-06ad-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686305429;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wjpl/s0Ng5vqFXOP9g2y5WT0Sro9g3sPniC+E+tUFrM=;
  b=WBiAlkavXLqt4ZxunYP7hQcraE67eL2m2esznBQoGTP+C/5dm7UnMw3a
   l9BxF2FYxYgl9gsEWyzzWLSNPdF/MwzQk3X1sEWPitC505IjXn6pDEjT3
   ZlfmRLKs+8VJGQv7AYJMZJSlfT3uGGG51ZaaULpToT6z0Mu3BEHb5rSK7
   A=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 114708743
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iS9H1aohuLBYZxTAjtqHI/vPMvFeBmLZZBIvgKrLsJaIsI4StFCzt
 garIBmEbP+KMTajeNsibtux8hgEvZPQx9NiGgRo+SwzECsT85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzylNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACEAbSCmg/uU+/W2Ztlzh+0qPcvLE5xK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWNEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6I12A3Mmjd75Bs+CBiF4ue/1HOFXfV8c
 Es04DAFpPIO6xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsSiNKYZoovck9SDguy
 3eAhdavDjtq2JWXRmia7ay8ti6pNG4eKmpqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0ADa647iMcK0+C3+A7Bijf1/5zRFFdqvkPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytalUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:4lmoTKpElZya+rkgcGfpDZEaV5v+LNV00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXcH2/hvAV7CZniqhILMFusC0WKM+UyZJ8STzJ8+6U
 4kSdkCNDSSNyk3sS+Z2njCLz9I+rDum83J9ITjJjVWPHtXgspbnmBE43OgYzRLrX59dPwE/f
 Snl696jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy6IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/O1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh7rD3vXklUqvoLhiKrLzPI9
 MeS/00I8wmN29yWkqp+1WHBubcB0jbUC32GnTq8fblrQS+1EoJvnfwgvZv30soxdYFUJ9D6P
 3DMqN00J9zbuJ+V9MnOM4xBfKtDGrDWBTNN3/XB2/GOuUoB1LhwqSHuoncwomRCcA1JV8J6c
 n8eUIdumgod030D8qSmJVN7xDWWW24GS/g08dE+vFCy/XBrRXQQFi+oX0V4r2dSs8kc4Tmcu
 f2PIgTD+7oLGPoF4oM1wriW4NKIX1bVMEOoN40V1+Hv8qOc+TRx6bmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuXnPjmhDeV37kZ0S695NtF6rR+fQV1eE2R8ZxmxlQjU786tCAKDVEvKBzdE
 xiIKn/mqf+vmWy9Xag1RQfBvOcNDcg3FzNaQI5meZRCTKFTV8qgaTtRVxv
X-Talos-CUID: =?us-ascii?q?9a23=3AiI75w2j9Orx2E2eRbCakA1y8sDJuY3De/FLUOm2?=
 =?us-ascii?q?DTmtFeKKUYFaB+oNLjJ87?=
X-Talos-MUID: 9a23:79B7UAhVuKPlA9QZsO52FcMpaYRWoLqoVn02l7Il4M6kLzZbMm2hk2Hi
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="114708743"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyGzLOSdGRaX50umAyHqKVfGLcqqwOTtkB4lfq1ab+sLhHPOT84hfCz5B4XWM3K5sJBveStR5SjKmYb7u7Y0CrhRI5D2G42gLU0bgsAD/jMYWOS52LMO9XeDnLC+2c7t/d2JP908vPt8q+T+G2cjiPNAXkUDGhV3PpEif+EVgSdrBUlbkVrdD1cMm0pv56T9HVE3LqnCrC8m9mHIsaGTQ91KNdN5R7Zj27CgxiP8lcH0ELXcSoz7P3iYpPpsJLHFakbHTXuVFVw1QFVtjIt8K00rY55AHvTLboyHEodPxJyqaXv5awZomLXB+VUVK4bXk/ZuumYTiuLCwR9kH3fE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff4nZVtzN8zb9/AOwMi8Rs+t6C439FiqvtWuwSUXTcM=;
 b=CvOjpmVc75ldNrKT/0kHCrlMimFE0eQKheVSR1UvMyAERfxQwXn9PnzUAroyjDYUfVNrazIYzamsIEIMHOe2XQGS3ZFqG5Kn9obugMAORrzDc2PktmHfXtILs3Qw8Iwqj/FT669v1hmMaPGy1vqxzwIanQTP1tfPNqEyIVmWieV2UIHPUzr9IelbYgmqGNMiRGJyKEpTTIwGgH1VThts7FT2GJ2kEJ0eHJitXp8i+BIB2uL2lMPaY28WbBfxsUyzcS2tCEG2OVHZhkA5MPJeEjXv3QwxKzJ9yVRAahKrXn9JAShZ6xQu2sKSjJ9/XA2WyKoaRswMag02tjEFbYIJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ff4nZVtzN8zb9/AOwMi8Rs+t6C439FiqvtWuwSUXTcM=;
 b=q7KshDGLg97GpIbGyBoLTidGYf8hzEBI6Kf3TOmtxMGAucl03QdN0J/qV28H6CyohXS0XMLHoE3KGXDdgxu2Qq4BDv48nmCpF5eqSoUNuiAHpvKValkUTANI6VxheReK+Gr+CN6z5xm2bP8SfmMwoHTUSIONfj4Z57wds/bII5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5005b885-c6f6-cc45-c65b-df9440964c24@citrix.com>
Date: Fri, 9 Jun 2023 11:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
 <d9162ee1-a6a7-96ce-652e-54eb30a3db78@suse.com>
 <de4cb4c7-5087-80a4-7420-799fb468526b@citrix.com>
In-Reply-To: <de4cb4c7-5087-80a4-7420-799fb468526b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: e615fc77-c04c-4a24-01a7-08db68d1be71
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JR4NpuKSYg8C8L1m6yxOh2qUJEOihyyYKZDZ2NyvzuYeZxzaN8jEza/VRz8RuYmY9r3l7gCfoMRhskkA4vKK9NEdA73ZINXpLCksTkP0/q818racvhhPznSHlmUUIAFFvl8WE5jNeTJq8eHgEMKh2fRlNoiDMVO4svmUGPPquQ3H1AJheKfKZ2wsiskr7rHNng7/KjqdpLm3yc9HWopp5Wl/AsjQZm8sPsxc1R6dfvIn7Aw2mB3GpTqy0L4yEzyRjcH56dSpKlwSzZixXs5xPwroY/aghhavO40aaV1yXJvXDdoJbs0FDqFHiZ7h9Cx4y57PkVcPulKJ00auaa7I5OMfFx7GPMcqIhO6LvZlrmu5runCSXYGuGrIoH118CT32aZKHSYHqhbhdjDmJtFwtbZWtNpaRqMtqcDs5CHse5jB08IPc3c1yE7shhHsn+m3cXAK5zFSfgM/zeCiunoNsr8qui8pdbmLohcNTAjThsBKksc3C+rYDqXPGlyzCzifgpxTh4WpuLBZ0A2u9H2nYpQBJkpMglCaHHF+A8d954aeQQj6dQlS6CHFH8t5HwgTEIfZNyrdoiaQVyA/KVDjYon7LAD/sJmATerus091dwbGLtv3adOFSqCSeTh7GOHGa8yOj5BlEQ2oPrvVFqrI5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(54906003)(86362001)(110136005)(2616005)(31696002)(53546011)(26005)(6512007)(6486002)(36756003)(6666004)(478600001)(186003)(2906002)(4744005)(6506007)(38100700002)(66946007)(4326008)(31686004)(66476007)(8936002)(5660300002)(8676002)(66556008)(82960400001)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEdZcFpUMUlHWVk0a3BRQlFFRVNZdHJERDVyekNmRmVqL05aSGFtWmExMnhx?=
 =?utf-8?B?ZmlYdmJCU3p3NkxYUFUza0ZxZXJ5SHI2UlJYa3lhS1p6bW92ZWZNWFVwRG0x?=
 =?utf-8?B?NXo1eGxqNmlZWW9YZEwvcm1JazdoM25ZeVFIN3k0VVZJeU5OdytvTzhHSzla?=
 =?utf-8?B?bGtMWHRxL2JadmI5a08ycjdHVm9XWDhPS29xWmNrbERiSmZkODJZeFg0RUo0?=
 =?utf-8?B?OHhIRnhNWkFxU05sZE1MWCtxLzJ3U0oyTll5SlFJSmQ0S2MwRTRHN0tWYkV6?=
 =?utf-8?B?cCt1TmM2eGNUZjIrZi9ucXYrdkYyZ3U1TklLUkZQUW44dDBOT2ZTRHdWby9h?=
 =?utf-8?B?RDRVdUdVSWdZamp1RTB1YVN5TlhrdEtISHg1R1U5SXM1VUxMZEhmc1N3dFVq?=
 =?utf-8?B?RkY0TjBBSktGbGx0WWRKR0FWUXJ5TGVYS1RscW5FWU42aUZkeXMrcGhMVEpS?=
 =?utf-8?B?SmdDLzZ3b05CS1VPNG5qZWNLdWJTN1JQU2x4YWJPUmJpNlB2T0U2T0xsZjhF?=
 =?utf-8?B?WWc1Mmo5SE41MDR0eFBqMDZVaDFGN2hiRysydTl5NWNxRlVwOWpteFZ6OUtO?=
 =?utf-8?B?OG9TSTVGWTF4bWVpd2J1a253MEc0Wi9WbzBqRHZ5T090N0IreWgrcGdyTmE0?=
 =?utf-8?B?WHhUSURGcEttemdMeUdXakVpcGdkV1Uxc2VXL3l5M1JrT2pBMXhiM0d0MkdT?=
 =?utf-8?B?bFZTL1E3MHBIZ3dtbEZkUXRGUS9IeFlsZDhwQnh3dWN3WjFFZWN6cVN0WkY0?=
 =?utf-8?B?TGFocWtaUGNMblE0dXpMaGFZY2xsemFOd2JubkNUbDBobjhNUU9uYmR3dmc3?=
 =?utf-8?B?OE1BeDg5ZlBxZFEvUXlBSURBcWpXY0ZPam5KWFNQTUMwMU90N29pSDFJNHBI?=
 =?utf-8?B?R1RHdFJzTFNVaUppNmwrVms1eXhCejdWYzdncTg5ZjFDay9vTHc4Nm1FM1VO?=
 =?utf-8?B?ZlMwNTJLRE45YzQ3aFRkQ3dYc3pHcGNJTmVxOThJSkNPUC9jQXlmaXRHQ2Y2?=
 =?utf-8?B?Zm96WVRXMjZmN3IySlU1UFovQjRwVU5vUWJhYzI5a25YeE9DTklDaWl6ejdp?=
 =?utf-8?B?dEdpeDFTRDNaRUJ1T1VOZzN4djRaYTQvT1I3RnVUVjRiNDlDNTdHYVNZSEww?=
 =?utf-8?B?bWZOdUFHR3AvYXAxQWVNUi9Rek4wK3ZPRkN5ekpCM1V6MHdXMCs5REo5aHY0?=
 =?utf-8?B?MjNLYVlNVmh3bDJtTFMrQ0RYZXNqdnFFNDdxblI1RTNHU2ZnTmcyaUw0VWxV?=
 =?utf-8?B?MFNPVVFEL1F4aytBZEhSUkVzcVBNYkMvbWhqR1o0cFROTGZWU2t3REEyUDUy?=
 =?utf-8?B?UHl1cWgvSmg2WFRPS0xhdXltQVQyL0orVFBVY0dMUVVlWEp0eWEveUxMTll2?=
 =?utf-8?B?L3AzMHl1T1F3bGJNL1hBSnArU0prOEgwaVkwM0ZYVktmRTJFVXBzd1NXTEFM?=
 =?utf-8?B?UEt3blZ3L0VqMllkR2dOTFJwakQrVldCUzZsZ1ZGb2NPalFmcThZSjJMVUZw?=
 =?utf-8?B?cWlndVJnZFZCa3FCaGg3SkZoVzRIRlR0WGxnczROcFhGdWlQeDRQZ1hsWUZG?=
 =?utf-8?B?Q0R3QjNGRGMwZWhwLzZDRldhVkJob3JDbGN0cXg5V3NaSlZ1b0JxUGV0WlpP?=
 =?utf-8?B?aHZsSUFvdklHSC9mUU16ODZnNlozSlFvUU5TanVxRU1iK2dZU2FBNzNHbHNo?=
 =?utf-8?B?Z2FkT2RpRG5DS21CR3BIZXhGS0VJZUV3THU5YXA4MlZzWUt0eFpFYkZZNTVt?=
 =?utf-8?B?T1BvNUQxeU95Vk9UTjd2V2FnTGRmZDltTUtUYmNoUDIxcFVuN1J1SXNyS0tz?=
 =?utf-8?B?TEdYVGRpajNSTnltN0U4V1ZteUg2NlRRRHRGUGcxaldUcWJSMFREak9UUGxI?=
 =?utf-8?B?SDRPbXhobEN4c3BmK0NpYmhZZ1k5RURhM0JvWGNUU2ZVdXlxaWhKb0FlTnMx?=
 =?utf-8?B?KzBQUHZXQWdaQWdIcy8wK05La0YzZ3Qxb2svSGMwMzR0elJpcU9vUGI2Q25i?=
 =?utf-8?B?S2F3M2E0V3g0S01jSnc3MjJjdEtjRVhOd2UvYldTYnR2Vi9MbXJqK0VycGlP?=
 =?utf-8?B?c2wrUTdMSlhvLzlXd0ljZnVWZ0FldWF2SkdLcndlSXBjYlkzazNZKzhSaTNC?=
 =?utf-8?B?d0JMZm5DN1F4V0RsS3MyWFdpWlFFZFNqakZUN0lQNGlocE9LZW4xelhuTVFO?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5DaS2Ol0z1xtsfecoIfylbDIpuIDPn2Nzv8hJ8iO125O51WMD7I83JMujHFB7rT4J8SCeNGxbMcUBSX1yZDT8UUyfNFOS/u54NeK2XGd/DVyytbnmUbeWIbE0q1XBxeNvbKQhyB0PPZyChxX6IWzTAj99E8pyjm8JLPFyRA+m1FU6X56fmZPvXRGGalU57CnTS2qiEx2ljmoEvH31HUOwHyG5QKrjd35heqpx0Osvea/1s4ez36VPth9suMYcnQBtnIIVyF2K0N8/l87HJLerF6gh8YtTL7YAWzXF9EyBn5p2nwXnS6Re8O+ThhaE748icBItD1JTNs9a05+dhhwiiUqrx77IMapKoSQQf+yvOkbKOZFijhDFwO4sxjfmNhLT72o1JxK+IqtaxDnwHaMvhF6JOBjRDgS0jfdLRCAkAQifKhIwav35gAZPuioUayr9evKtHP7VBibQE7dO3Rwahp/mWrN65q2vM4o/o6JXpgw7iFBTnSPhEp8+85ssPDWkmJ1TjMnpNYdOIIOMwXC9uuRsUzLHdbXKdQrWiDDTLjQXMGt2NDfudX+u40G4V3FwXk1sxjZjPjbin0IB2ssjJSId5X+8O2FAFz0lkZTCYOYBmetoGDlGe+02MyUn3bGmsOMPHoxW+5FNhVGl+fFu/EDhaOhfj4R3/hb7ee0CX3Z1yEEXVcDxsGoCV2rtG42LSN5IpMmj9wko/Lt8ZUmqwGBrQre2sttaB/0rKT/TX28PyXMpVx9eIBBcHtMks9M26O2+XvwUinmxJdW0Tj9zlXlFX4asD/teStTDoQ8bhdOvriIZdTRvoiEi7laPKgt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e615fc77-c04c-4a24-01a7-08db68d1be71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:10:25.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ahw+QDZM7vVIb+l17Sxo48HBIAh326A96MRnxk3KubyRzZ9l8toIVx3/7953EkFP+fT8Ruc1IzJI0zQqJKh0DPXNBg0SVNFpJWjJFwZycHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626

On 09/06/2023 10:33 am, Andrew Cooper wrote:
> On 09/06/2023 10:31 am, Jan Beulich wrote:
>> On 08.06.2023 19:40, Andrew Cooper wrote:
>>> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.
>> Right, that's one thing which should have been done right away.
>> The other is that both macros should have been purged from
>> tools/tests/x86_emulator/x86-emulate.h (which includes
>> xen-tools/common-macros.h). Luca?
> Hmm - I explicitly checked that, and concluded they didn't...  Happy to
> purge them if I'm wrong.

I think I was looking in an old branch.  Fixed for v2.

~Andrew

