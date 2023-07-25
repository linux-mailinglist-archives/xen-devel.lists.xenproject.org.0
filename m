Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F40B76194A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569668.890564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkC-0003xb-57; Tue, 25 Jul 2023 13:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569668.890564; Tue, 25 Jul 2023 13:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkC-0003uw-0s; Tue, 25 Jul 2023 13:06:28 +0000
Received: by outflank-mailman (input) for mailman id 569668;
 Tue, 25 Jul 2023 13:06:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOHkA-0003uq-PM
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:06:27 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dc09ab2-2aec-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 15:06:24 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:06:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:06:19 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:06:18 +0000
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
X-Inumbo-ID: 0dc09ab2-2aec-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690290384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/jv+CyPM3neLkaA4oQq4tIsXoYzSYlUOZobTjS+1d6o=;
  b=ZbeF5W5raUvGtH3RBcFU3i+yrOeoSMp6FLLCCB2hEJMrwaXhtkKn+y6B
   XNf5f+XGn3fRH1ROHs2Azdn6vRecZ+o9t/+cBBAv2jzyXEcPWY0jZjTFk
   nNz3Eo3r9nRe67R3HQIVTsO0VVLQ6Xo8ATDB+8Qmmw/BL77gQmu0FISN1
   o=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 117380966
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7UDWfKyDpIWQKTopfx16t+cTxyrEfRIJ4+MujC+fZmUNrF6WrkUCx
 zQWX2qBPvmPYmWhfdskbN7k9EsAvp/cx9YxTwE4pCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP60T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUZ2+
 cw6a2wMUk2enu+PzeOnR/RHj9t2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aQxnOjCdxMfFG+3qZnhWGR/WsSMzcTbEvmgtCcu2G/Wt0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHaSpaSwIAuoHnuNtq1kyJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNXNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:G6tcK6zcXKhmelHHpHzjKrPwCb1zdoMgy1knxilNoH1uEvBw8v
 rEoB1173HJYVoqKRQdcLO7V5VoI0m8yXcd2+B4V9rPYOCBghrQEGgL1/qE/9TOIVydygc379
 YFT0ERMqyLMXFKyer8/QmkA5IB7bC8gd2Vbay39QYKcegQUdAC0+6hMHfiLqShfng8OaYE
X-Talos-CUID: 9a23:R19dVGx1Tr7HzXjQ4YA1BgUzIswVUD6BzUuNPla1MGs4VLCIYlaPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AcUDXfgzeDvCapxKQvsVDLgruqWOaqPyjDXwPqpI?=
 =?us-ascii?q?HgOOBDDwtGB64vRu2Q4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117380966"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJhS924O7TznFdejo4+eYlT8tedekz0WgmozmcLsmMf5BRrBdHQ89DqyMU77dl2tWcH+QLbBMfFQ737QEIpqmo6qzb4izUA1+vFoMDf7GHv+BzqrsaNxrCcJpsl5rFlgS7mJfnaQT0vO7roYyhdXmb0pOZwZAamAHUEuH74GZu3RXnjxFz3jclk3rXfsjLusNrGJ5hjckmo9RbRLDFTovmYkX53LZbI0Dn1PRiCf2IQyaBT3UnUJ3t7vBNSmX50rHDCfCcLYKtax1AP9p6n6U4PsPN1ZKhQ8twuyH1daaWtHWQJ3rOn60o8cBUm0r9kMQ3UPqF+KgvJpqXb/dz30oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf40HwzFigWxi5/seuFzBWojNz9BnyuqK0PdkFX/FF4=;
 b=E2rJQLdtPmYzXguFadCGEP34V7PRqEvvHJsnMXA9bLx6DjQAG1SzR4EbcidwPcZHbSSsApaPLphmp5UzyQpH3w2ZyWEn/Tx0XeCrGPAAhk0HpBGkfg98IQSShVxeN61x0RqfbOrnKfABkf5W4DXL3OksimQIsv75rn76YCZcsm7tk6J87MyeXse/C+ThnVXbOtzpcaKW9vMIViXqB7gAblbh7GX1FK2Fj92bihphbWFuKr/q4UFv2yUsuajFmCmDeQs7Td/OYHNCIR40WwC+sqanRJf6Og89mChqS1qUYkqrnTORU5fu8Y03PNpLa4/0Q1GAfAq0Yi6QFXG24eoOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf40HwzFigWxi5/seuFzBWojNz9BnyuqK0PdkFX/FF4=;
 b=uZprRpw5WEAc1yT8Z7OyMEQEiEz9w0pQ1rvG/zwG6/tNiyKBea0vhRTTQNcVCLa2OnV4D5j1WdJW1mCQv0mt/qbmGlllHW5T005zyjJSzisVq9YrwpvflT6+eNt7bq+y3wzORn8o0+NZoPHNutRk0FfzKSXUfjcce2UbNqF1NUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 1/6] libs/guest: introduce support for setting guest MSRs
Date: Tue, 25 Jul 2023 15:05:53 +0200
Message-ID: <20230725130558.58094-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725130558.58094-1-roger.pau@citrix.com>
References: <20230725130558.58094-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 0edbc6cc-9e8e-49f5-a3b0-08db8d0fef8d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FaW1Z1yUCozNZhWPhHqLirx6wDlOnkgtJ8b9ouy6CaUKavGX2p0dafFoPS9GY+vsTICbrNegQvosUEYYmJVENUsFGGC52++GAxWbrCSETz7+FYTRSy78xGKLnnTZgslmn9KrCpR480Tv6CsGIikYckttahDrZSC2HioNQbNNG9gFqMO+j12o019A6SU84LmEAWpA4PqXZwqzXzZtIsvVuHXbcUuqzl/MHIOBg/Di6vTeg9tGRG4EEASgsndU1GWyHtB/bXsBcodbqQlOtdkjVsA8xuJcv8jiEdgb6lEQ8+RCq+lHEreCDpKeWh/GID/da9h7vXZsamRYW8xFuxNuEc4iMe6BXJx2NNCLEwTCeCmiQoJSy/6NjjCzxU0vfgwjesocUklLR3n2Xvo4iv9eFXIX9TY0gEFSraJ4DTGgLHK5PnifGX9wL2nHy3+63GcDOaVOB0VYlRgW6zhL4xQkfgAkdA0Vo4kX0WeyZf9OOAN0vbVcDbv7WwSh5+Da+3wTs0fkTjNJNOcjS3U0XvtG8T36sTXzE5k01wc8SrK6gxgPXn6OFSyEEOjtFalGP6p+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(82960400001)(478600001)(83380400001)(8936002)(1076003)(26005)(6512007)(6506007)(66946007)(38100700002)(66556008)(54906003)(6916009)(4326008)(66476007)(186003)(2616005)(5660300002)(8676002)(2906002)(316002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlpuSUdjTkpFRzV6YUZPNVVzZTU5ZngyQUZSWEloUzlnTlpQS2VMaGdraCs2?=
 =?utf-8?B?WXNQUnlLdlV6b0k4Q045L0NpejRYZEpyYXRxT3hKZ3JyVnlaUVB4WEwyd3dh?=
 =?utf-8?B?RTBKVUcxLzNCQ2JLa0JIMHNxdkxuYVlpbm14WWVnQ2d1YjU4S0Q3Z3VZRUEx?=
 =?utf-8?B?UmwrVUtGWStCR1JhQm14WThqZURXYkdrL0dQT0lSdVZCOFFXMGtHWDd4SmNB?=
 =?utf-8?B?bTliTDBFNnhWR01uMnQwcVRsU1dJVFYrdUlZeGsyTXgvZ3F0THBkZUlRcE11?=
 =?utf-8?B?anJ4UEkrd1FYWDZuVlM2SUVDZkVKNjEyOWREbXhJbzQ2Znl1ZjZQQTFYa2RM?=
 =?utf-8?B?ZlcvSTdOR0NGS2xXRWhvTUZiYWRXUmVOVTBXZ2pTbzFVMks1MHRUbTlUT2dk?=
 =?utf-8?B?MUxoRm9JeFFLMVN5VTQwMTdVZkF5d1BtRWd0OUUrb2xUU3k1RFArSHRPMHhF?=
 =?utf-8?B?aWpNM25vMUNIcDlKaVJKRU1nZlloamJFam9hV3V4MWR5ZFBXNjdrOUZXZVdD?=
 =?utf-8?B?eVlWdlZUT0FEbEM1UEU5eVFlY1BSRVluWHdQdHQxbEw3RXl2eVJuUlNQSDFG?=
 =?utf-8?B?Y1RhSnN5MTRsSmdETjdsWlgrVmxYNHViREVZcDB6QUVvOTZ0QSswcUoveUsw?=
 =?utf-8?B?dzVFeklnTUJwUC9hdC9ZbHJNUER0NElGWThLNG5tR2NKOFB2MGxDd1BLMVFT?=
 =?utf-8?B?Q3JrZ01wYXRKU2ZTMVNZZ0VFQmFnN1RVOXgwTEpPTmJOdHJkc1ZNRm5nUFdL?=
 =?utf-8?B?eXcvajJVamk0WHRVZ2xzcWFHNkhkbktMTmNZNmlkRHhOdjJQQlJ1dHcrUDBS?=
 =?utf-8?B?QjlBbWxmNkI3MDdnbHZUV2srMW8zTWdLSzlyblNEbGk1KzZWU2lPWHJTK2Y4?=
 =?utf-8?B?S3luaFVDRTc5c1NwUVBFYzV1WHd3Q0VLNUNkZUxvTDUrMW5JZVdnUXQwWFZU?=
 =?utf-8?B?ZkdmTWdLb1ZyL2NVNmV0U0FGckpqQ05WY3VEUnNkdEx5UndBN2VFMnFibGRF?=
 =?utf-8?B?clZZTURiMXhDRnpyWW9ZcWQ5ZHNaQmpWZUdBTHNCR0FydXg5alFhWjBaY1Fs?=
 =?utf-8?B?THRHS0J2eStFOWxEOStxd0VtN2pvL1RWemJndS9mK1lwN2tMemRjRG84a3g1?=
 =?utf-8?B?OGhBZEZDenpHOHBwdklZSGpvaTlTcXYvcGVnSjJNYkZURElYRmJJaWRSSERK?=
 =?utf-8?B?K2dyTkVtT1M4OWlkZTlsc25rZVJNdUVsRStVTy92eHNydVoyU1NoYkdoUlRy?=
 =?utf-8?B?eDFUN1JkY0prYk9rcFpGT1JoT1RzbzVlNllVQXBXR1VkRVpuV2pKV2hzOG9t?=
 =?utf-8?B?Sjd1K2I2cVpiVndUSTZTbXN5aDdZbUtmNys0L0NWWmdUc1FPWVp1WTN5OFdE?=
 =?utf-8?B?SHo1eDlxblZPaGJuaGJ5YzVDY0NibkNndGg1Y1lIdExHWkwxUkk0bVh5V2k0?=
 =?utf-8?B?WllkVFQ1NytlYkJrV1kvSUlrcmY5VG1wRGphTUM4WXU3enhieDhOZ2NyRkFs?=
 =?utf-8?B?NDZLRGgveHEzNWpzWnlkZFJlSnpZSjY5YzAvRHUyS2pZUDdhRVFHUVRyRDVR?=
 =?utf-8?B?OGh2VUNrTTBKVGdvSnhSaldCSktnQU94aisxSEpTZ2JhQnVPaDFoQWMrdUZq?=
 =?utf-8?B?UnVXcVVXZXpFRU1RKzVXM1dHZWczSDRPQnpDcmpPZXRRUlZnZzQ2WWthK3g4?=
 =?utf-8?B?SGZQZDlJNTBpcTJ6dFJkWkpGZlR2SHJxN1pKNFJ2WThxMnpvenhtZVUvOGpw?=
 =?utf-8?B?K1BHTE00dS9FemdtLy9aUnJHZG1qc1dHTVBqNlJyOGRTTE1FQ1NWUk1tS0c4?=
 =?utf-8?B?K0pZVEZyeHorSnVSZXdtTmdTeXZNYWJ5N0VBMGVkY0NLQUJHZzZGYUFBNDNl?=
 =?utf-8?B?N1lWdXBENHBLNVh1ampycUQrdHd3WU84bHlWM3RUZGw1aWdJTCtiNXE1UTJU?=
 =?utf-8?B?d3NTTDVpTlIvOXFyTE5KM00rMks0YWtqb3lLTXBjeEVadU5SankyYnQxY0pk?=
 =?utf-8?B?ZGtnMEw0L05aN1JsbFBJVjExQ3ZFQUZqQ3NQbDU0L05pNjRWWU9nTVlxUmQv?=
 =?utf-8?B?V2pLN2xkeXZuMXJhUUdwclJycFJZck5jaWtWUHl4Q1BJQ2NvRStlZWo4NDZ3?=
 =?utf-8?B?dTBlcUJkVC85bytkSHZFK2JiL0tGdjRoaGRSWnNHVXFjc05ySStRZERiM2ph?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UQFJZXolRg1JI4rwaY6pTPYnLVmKOgjFj74wQrA9dvsq4t9YqjM2wrGNBaUxCno+Fyd1Eok5U8qnOmUNbYuZ9iPzCXdz/M7+XZ3r2vuCvzFRq7S91RlGit9YP/tu4P/OGcYC8yriFNJzu/OWYcnjeLnRVbYNdNgQD4X6154ddNZTeyeKnfY6BpUj6XDOH9vJKK+1FMk3CyejZAyI8ozxLeVrdPsWJjQCsVbcAxAWd2jWkTjJcPw/m9S7i1LryXu0eGW6oAyvOxU1Mjdx/5dv6uepE1lCTs2m6MsqSoxfzZQ8VYG8jy36GcHliuznEJD3nGTjL+o6rJynw0xnjSYpdvPUQtAFpnEOiOYYsJLs8udIyE8T+WHpKFLruowpyGlfEL9mE5YbCVSrxnN53nYCEhbe2m3Qw6jR04fcYL20ob6Tp+rrLpzr5M1Jwn9ZM2dp6BykVDthZ/O3/cEJiA2n2pX8VJ/A2xke9vkiyF4fJtYtAQUbqlejU4zWgEyPt9ijofEzyBtgeWBXlcrUPJ3iptKkCMW9daWcDyCDnVJnkc7//6QitiLx579ZZoM9kjNW5ycGwPtcJV3sxBjlRtQND63Uo0C9CCPMf5HLv/7yUbbwTmf9E3HJq8gY7Rk9ZmrCxtxx4UUJifcfWDQXDrffakSLQ+Zv2RoptS6c3jaFgb+jglQ9SstiuVQIXmwRRPnku/bxeAGqU59TdPYgMENM2koSXvRw5xwfkChuiEKutTgeu0bYpl3AOFKYKrljzcwArEvZrP0fNQw4Bb9PYt0pTBOrsb6dv1jjg83ulBSVb35dq4PHpUHZI5VJIbJhbhc5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edbc6cc-9e8e-49f5-a3b0-08db8d0fef8d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:06:18.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxwbBhlDpizBh02WU05k3YvB3FDidmY2Yb6JB0ZumNL09ZYHvj9uvSshU6I+lG+88n36OGuCNgj8KEM7xK8/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

Like it's done with CPUID, introduce support for passing MSR values to
xc_cpuid_apply_policy().  The chosen format for expressing MSR policy
data matches the current one used for CPUID.  Note that existing
callers of xc_cpuid_apply_policy() can pass NULL as the value for the
newly introduced 'msr' parameter in order to preserve the same
functionality, and in fact that's done in libxl on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Some code adjustment, no functional change.
---
 tools/include/xenctrl.h         |  21 +++-
 tools/libs/guest/xg_cpuid_x86.c | 169 +++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_cpuid.c  |   2 +-
 3 files changed, 188 insertions(+), 4 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index dba33d5d0f39..faec1dd82453 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1822,6 +1822,21 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
+/*
+ * MSR policy data.
+ *
+ * The format of the policy string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ */
+struct xc_msr {
+    uint32_t index;
+    char policy[65];
+};
+#define XC_MSR_INPUT_UNUSED 0xffffffffu
+
 /*
  * Make adjustments to the CPUID settings for a domain.
  *
@@ -1833,13 +1848,15 @@ struct xc_xend_cpuid {
  * Either pass a full new @featureset (and @nr_features), or adjust individual
  * features (@pae, @itsc, @nested_virt).
  *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
+ * Then (optionally) apply legacy XEND CPUID overrides (@xend) or MSR (@msr)
+ * to the result.
  */
 int xc_cpuid_apply_policy(xc_interface *xch,
                           uint32_t domid, bool restore,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
+                          bool nested_virt, const struct xc_xend_cpuid *xend,
+                          const struct xc_msr *msr);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5b035223f4f5..f2b1e809011d 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -423,10 +423,170 @@ static int xc_cpuid_xend_policy(
     return rc;
 }
 
+static int compare_msr(const void *l, const void *r)
+{
+    const xen_msr_entry_t *lhs = l;
+    const xen_msr_entry_t *rhs = r;
+
+    if ( lhs->idx == rhs->idx )
+        return 0;
+
+    return lhs->idx < rhs->idx ? -1 : 1;
+}
+
+static xen_msr_entry_t *find_msr(
+    xen_msr_entry_t *msrs, unsigned int nr_msrs,
+    uint32_t index)
+{
+    const xen_msr_entry_t key = { .idx = index };
+
+    return bsearch(&key, msrs, nr_msrs, sizeof(*msrs), compare_msr);
+}
+
+
+static int xc_msr_policy(xc_interface *xch, domid_t domid,
+                         const struct xc_msr *msr)
+{
+    int rc;
+    bool hvm;
+    xc_domaininfo_t di;
+    unsigned int nr_leaves, nr_msrs;
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    /*
+     * Three full policies.  The host, default for the domain type,
+     * and domain current.
+     */
+    xen_msr_entry_t *host = NULL, *def = NULL, *cur = NULL;
+    unsigned int nr_host, nr_def, nr_cur;
+
+    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
+    {
+        PERROR("Failed to obtain d%d info", domid);
+        rc = -errno;
+        goto out;
+    }
+    hvm = di.flags & XEN_DOMINF_hvm_guest;
+
+    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        rc = -errno;
+        goto out;
+    }
+
+    if ( (host = calloc(nr_msrs, sizeof(*host))) == NULL ||
+         (def  = calloc(nr_msrs, sizeof(*def)))  == NULL ||
+         (cur  = calloc(nr_msrs, sizeof(*cur)))  == NULL )
+    {
+        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
+        rc = -ENOMEM;
+        goto out;
+    }
+
+    /* Get the domain's current policy. */
+    nr_leaves = 0;
+    nr_cur = nr_msrs;
+    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, NULL, &nr_cur, cur);
+    if ( rc )
+    {
+        PERROR("Failed to obtain d%d current policy", domid);
+        rc = -errno;
+        goto out;
+    }
+
+    /* Get the domain type's default policy. */
+    nr_leaves = 0;
+    nr_def = nr_msrs;
+    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                        : XEN_SYSCTL_cpu_policy_pv_default,
+                               &nr_leaves, NULL, &nr_def, def);
+    if ( rc )
+    {
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        rc = -errno;
+        goto out;
+    }
+
+    /* Get the host policy. */
+    nr_leaves = 0;
+    nr_host = nr_msrs;
+    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
+                               &nr_leaves, NULL, &nr_host, host);
+    if ( rc )
+    {
+        PERROR("Failed to obtain host policy");
+        rc = -errno;
+        goto out;
+    }
+
+    for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
+    {
+        xen_msr_entry_t *cur_msr = find_msr(cur, nr_cur, msr->index);
+        const xen_msr_entry_t *def_msr = find_msr(def, nr_def, msr->index);
+        const xen_msr_entry_t *host_msr = find_msr(host, nr_host, msr->index);
+        unsigned int i;
+
+        if ( cur_msr == NULL || def_msr == NULL || host_msr == NULL )
+        {
+            ERROR("Missing MSR %#x", msr->index);
+            rc = -ENOENT;
+            goto out;
+        }
+
+        for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
+        {
+            bool val;
+
+            if ( msr->policy[i] == '1' )
+                val = true;
+            else if ( msr->policy[i] == '0' )
+                val = false;
+            else if ( msr->policy[i] == 'x' )
+                val = test_bit(63 - i, &def_msr->val);
+            else if ( msr->policy[i] == 'k' )
+                val = test_bit(63 - i, &host_msr->val);
+            else
+            {
+                ERROR("MSR index %#x: bad character '%c' in policy string '%s'",
+                      msr->index, msr->policy[i], msr->policy);
+                rc = -EINVAL;
+                goto out;
+            }
+
+            if ( val )
+                set_bit(63 - i, &cur_msr->val);
+            else
+                clear_bit(63 - i, &cur_msr->val);
+        }
+    }
+
+    /* Feed the transformed policy back up to Xen. */
+    rc = xc_set_domain_cpu_policy(xch, domid, 0, NULL, nr_cur, cur,
+                                  &err_leaf, &err_subleaf, &err_msr);
+    if ( rc )
+    {
+        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
+               domid, err_leaf, err_subleaf, err_msr);
+        rc = -errno;
+        goto out;
+    }
+
+    /* Success! */
+
+ out:
+    free(cur);
+    free(def);
+    free(host);
+
+    return rc;
+}
+
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *xend,
+                          const struct xc_msr *msr)
 {
     int rc;
     bool hvm;
@@ -663,6 +823,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
         goto out;
 
+    if ( msr )
+    {
+        rc = xc_msr_policy(xch, domid, msr);
+        if ( rc )
+            goto out;
+    }
+
     rc = 0;
 
 out:
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f5ce9f97959c..c96aeb3bce46 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -502,7 +502,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
+                              pae, itsc, nested_virt, info->cpuid, NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
-- 
2.41.0


