Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0075A937
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566463.885294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOzv-0001gX-U9; Thu, 20 Jul 2023 08:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566463.885294; Thu, 20 Jul 2023 08:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOzv-0001do-RE; Thu, 20 Jul 2023 08:26:55 +0000
Received: by outflank-mailman (input) for mailman id 566463;
 Thu, 20 Jul 2023 08:26:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMOzt-0001O5-DN
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:26:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d618f33-26d7-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 10:26:51 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 04:26:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:26:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 08:26:48 +0000
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
X-Inumbo-ID: 2d618f33-26d7-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689841611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/jv+CyPM3neLkaA4oQq4tIsXoYzSYlUOZobTjS+1d6o=;
  b=JqxdOhGYN9ytGTt38sZIIM2cHsvqD6WsjZ/wBU+NcuGgLQikjCjOJVVs
   RP5pgB9D7rHWgSg9LKjbhEL0fUfwPNwn8FhxVlHiItDAZcVNODkdMAxH5
   f3o6OEn6g+loN0PphL3lJBm3mqMbXxL7w6jg7rwysUDXnvAZKelofMrVF
   c=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 115538984
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:diGhKaqZsANmw6TTtCh3SEQeA4peBmI8ZBIvgKrLsJaIsI4StFCzt
 garIBmGPfeIMTakKNt/O9u0oRlSvMSHxtRqQQZpqi09E3sV9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABcwV06dq/mp+oCmUOUzp5QqMeTPGIxK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWPEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtPSebop6426LGV7kwBDkVNT2KKmtqgh2qea+xcK
 1MV+TV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A6N66pog210vLVow6T/TzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:VMB//qMs1pYPBsBcTsKjsMiBIKoaSvp037Dk7TEXdfU1SL3/qy
 nKpp4mPHDP+VUssR0b+exoW5PgfZq/z+8W3WB5B97LNzUO01HYSb2Kg7GSpwEI2BeTygee78
 pdmmRFZ+EYxGIVsfrH
X-Talos-CUID: 9a23:rIq9jm4cCjRNPVFsA9ss03MtRN4JaWLn/mrKLxCZWW90ZZmxRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AnF0I7QzWjEm8hVEQmvaqL2/kfmeaqIS8DhhWi6w?=
 =?us-ascii?q?3gOqdOAhQCwmejCu2QZByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="115538984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYHZmw3onIMwlx+x2QcGuggvDor1AZLdhwWYsq1bkEXNjtI7XPWLhe6UNNBTky+b83n+a+ZqALGIW+k6DUtm0vzCkPZVKzPW2O9vMc53btgoPcf2kGvR5Ml8OcDrffyRo34/1k7Ga1Em13oIiDqU1FiGjTmfJO6Ow8FbVyedwjHlEXsjLPC9w+kgdDjOP5RCoCrCp9hDERM83z6QlhdllFu2SD+Ofudq2gs9n+H4vyup3vl1ALwM+3Z7PQ0VKl2JU9MbfqkdFRmcs41spMPlcrZcPvguuKv58PWxwsrFKaVEL5kp9iq3fErVEsJxRy3tzN6Eqid1ZKhO1L4pSNX6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf40HwzFigWxi5/seuFzBWojNz9BnyuqK0PdkFX/FF4=;
 b=K2nhdNIG5pidwhGsM5yLxAW+81jnANx8QC1Lp23YUlUtxrf4HVSxjYY7fjGXtUl7tObo0qdsw/GaApqsvK6LigD4wOP6BpP2/3FakZydUM0jR0y+aCLvgp9siOLipb4amsfc7GnyPTAuhQMDsHlKmU5wVuv79If74OMnkkIjbWH9K/bsKbqfKcPGpOpln2iuEFRVGe5F3OIeJyYAhqltRuZvDrFb87jFYytIa0spBMsVUvo8UgrVPhPgWZ5Dm6Hyxmgkk0E/uoZC9uiaeGN8uP1kyVVaeGBZA4AeFE7FDVLkVIEdkxf0oroerjgoYdliyTAa2I6GpIerN0H5dlc1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf40HwzFigWxi5/seuFzBWojNz9BnyuqK0PdkFX/FF4=;
 b=psy35O/FuEGcFKSbz6pdf4lz8DhsofDj8eWwpzQ4CwdVsPCx5Ma7evjCQweMoZNlMM5B74LwtQjAfINVxqyHVJaAjz5R9aukDIN6/ModqcNYx3EgPli5lF63/SBtAUc6fqcsr/lgD9mTgtg73Tg6ycn5TOy4vS8UE/0+diTi8Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 1/6] libs/guest: introduce support for setting guest MSRs
Date: Thu, 20 Jul 2023 10:25:35 +0200
Message-ID: <20230720082540.69444-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720082540.69444-1-roger.pau@citrix.com>
References: <20230720082540.69444-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0475.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: d2415a35-a972-4d4a-0598-08db88fb0fd7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kv582ll4mqoAmt7WbnHrrQUfsGik9kNO1b37LohTzBZ0u7jHIzsyPbZ2BYCszPXQ/1cofHNBcCCGsJdEnwW3D4zLqlNdHMO43Hky3LYyDyTKmRUW52NhYfzOdKasG7xXjrQOukO0NlgH38Ev6u90hQtSwNjSIddhQODw6xHcjuSOqCrNKTFUUQpcu2d9q63ziMbRFTmIdp94R5y+xerXEAHSsybjuu51kZI3jy3IKevoDNvG4AHQ+mMgcjxMQ/roKlxj/kjovpLTyDPs0IA+W6Ajh+0jVImFyKvn0QkKb3voKtu5DuIUnBc6BNlSB+sjwiwQwqC36GPjqGRTl8E0hN1CgBuT4aGQ/wkW2dP/lurXi504TriHKQQ3INW0cFtQWGRpbEX6xvMrf17HO3CigBSjI3DUzceUsP+YYr/bYVfAnLMSXc66ywdXHGs2xegpXzxKwY4oSPhtA31R6kfjngGg5TlbaM7laa1QRCLfEzWCuqSYkDO7IzXMLArMKG8XBwqft9Sz5a1fzqRqjZ+WWqA8iHY/IAiILtKFV3IbA88r6HbP77BHZR8Zci64zE9g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(186003)(38100700002)(41300700001)(26005)(54906003)(6916009)(8676002)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(2616005)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkxRREg4U0pHcWFleUJhdXR5c2JYaEsxcVVteHlzWmpGQjBOYW9nTlRsK2VF?=
 =?utf-8?B?OTd3MG8yRnZkSWJ1K1FnMUoxeUFZVU81RVY3YWFLWTNnQTFNTnhpbEdoR3Nn?=
 =?utf-8?B?SXpORUs4MHpoWkZ0ZTZpRkUxamlSU0FiMXdvNENGY056VFVyTXk1UzAyRmhV?=
 =?utf-8?B?OG9TS0ZlekJnMTBScHBCWFIvb1QvYzBJS0UreE43T2dzbFlLUlp0bFkrRm1J?=
 =?utf-8?B?WDVnN3FWc2QzaUZvL0dKRm5hSnpQbkt5WEJqZ1psSjZ6YjZUL3Yrc2hIK0pG?=
 =?utf-8?B?MGpZRTJ6TWhydHpxdnJERVgxeXNjRkc0TDZBbzdic2lyYUFUZ0xXdXEvOWVL?=
 =?utf-8?B?R2tKSHFFU3A4eXBuZFp1ZmhzWExBZmpnUGM4WUdMUmVZbWw5VXpxa09rcFFO?=
 =?utf-8?B?LzB0c3E1cW9zT29IS0RwSGxoRENxNU9QK3NiZDQ4OFFkUE5NK1R3M3dVKzUv?=
 =?utf-8?B?aTZHOXZlUDE1UWlXV3VlT2xoeUJnMnNlclhXRmlsTjFlZTNiUFMrVVowVlVs?=
 =?utf-8?B?VXdCaFBmTk0rMklPVUhIUjZuZndIaTNaWEZrSGZpUE9wOG5WZUszaFhQb0ll?=
 =?utf-8?B?ZkovQXRyK28yMkN5V1o5bEpCVHFRMVJ5NTVkV3NVZWY2a0dKVDNpckM1SXRQ?=
 =?utf-8?B?eThtbkx5d1ZGVHdiSHVHa3ljV2VTYkVnY1BydU1EeFg0dEVLSXptT3p2c2s1?=
 =?utf-8?B?N243L3J6dDhzdDd3SWhXTEFFQTBHWWt4WlFveTBpSXdVaUpBNXV3TTlldzl6?=
 =?utf-8?B?RDBSU1lqSkdZcnREeDBaaWRBSi8rZzluRXY3bHZiaVpXU202dEpscW80WmRL?=
 =?utf-8?B?YTNlR3J3cm0wL3ZoYXdPamdqNmoySXVFVlFlMGVHNlZ4UWNXSGdQUUdRS3Br?=
 =?utf-8?B?WEppdkZMZlFGOGwxRldON0QwODVaV3dkMWc4ZUZ4VE1tWWs3VDVxK3ZkQU83?=
 =?utf-8?B?MVBodzhtWkIwbVVGeFZMM3dvQTdpYnY3YjZ4YXZpbHZlSFB2cVIvTkYxdGcy?=
 =?utf-8?B?TStIemJyMFBGdDdVRlAvelNYcTVRSW00T2pjNmVFNnkyb3FkMVk4bDhGNUkr?=
 =?utf-8?B?SXVUMGh6V2l2REpsZ29sSmNDeC9WQ2d0ekJ6Tm1wOVAzeGVLSHhIS0RxNU52?=
 =?utf-8?B?YjZFV1FyRUZxYVJ4aUd5VnJqamlrbU1HcDNEcWVWLzE0c1RDV29YTHJxekVG?=
 =?utf-8?B?Y2g4V0drd3BXV1RzTVIxaG5BeThPYkZjZll0Yy9IaXZjb1UxSytYRXc3dTBu?=
 =?utf-8?B?cXNSQktTbXhyY09SNjhTc2FwWjkyelVZelVLK3FMdllYVVR3aElHNGVoYXV4?=
 =?utf-8?B?a21URGw4Zm4zSFlDUURaa2JobVRYK290OUd1TVhIN1F1NjlGZXc1bW9oNFpP?=
 =?utf-8?B?bHdLZ3ZaRjhHdmFnc0VoSW9sN0sxUXhKQmpzWVRpR0JkYSt2WktJejczQ1JB?=
 =?utf-8?B?TFRha2NMUm05Y2NwVC9VL1h6Yitxemk1cnJkQVAvTnJXeHpNY1JuUk1uTWZm?=
 =?utf-8?B?MTRjT1U3WGhqMnJMREE0c2dqVnlRSkVmcVJCVW1OWktSTGRTUWdzUWdrOWpo?=
 =?utf-8?B?SUpKOE9NZEM5aDM4MTRrRFRlclorWlU2TFZPbEY4ZWZyVTd3VVVwNjcwQ1h1?=
 =?utf-8?B?bVBzM2FYT1pyZDIrZ1gxQVBBNjAxWmwyMlFlRE9xV1JjWkZXRnppRVVqc3la?=
 =?utf-8?B?WjllNkVhVm84SzVTaUdzRlpLRjJEVkVOUk15ZTFuOXVkQW5xQ01NdHlwdktG?=
 =?utf-8?B?ZytxV0VWUlFxM0ducDNkcTAxcEpMUFphRHgwK1AvU3ByanFHWmhLTzRVRkNQ?=
 =?utf-8?B?ekZlR1lORUR5L2paQ0ZweG14cWlWY0FBalhhQ2NlSFlqNnh3RTlwbDdBakYy?=
 =?utf-8?B?ODVMdmhhcm5VejMvMmVtSTc3WU5xeFVTR2xrS3E2a3p4ZlhVUUlJQ2ZrUkxr?=
 =?utf-8?B?WCtVY0Z5YitsNkZTSnBXdzVlMVVuOThlSVZUdnVjWmlMUGIzRXNBcStRRnJr?=
 =?utf-8?B?T2d4WXIyRy9UVWJjRzZpTEE4amVBN0hCeThNMHRTTjhELy9NS29kdFpnb0Uw?=
 =?utf-8?B?U2t0QlRodytKMXdEOGNqWmp5cWpNNGVtcnpqSHA3YnNodGVZcUVwWEN5elI3?=
 =?utf-8?B?YVdoRERoeXB4NG5ra2RubUFWRU43NjY5Y0V3UnllYzhvUlhtTWpVZTBQRFZF?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t049lydf/QwAounfVlo7edgmcNuyYVxTd6g+wod/SzUpf2vvPv7dQZSHjJOvxp033Dl1TlHAD95G8kNXRQYG6yzBzT9BXZKmkzVxMgSuhiZp2txVVlWyxV3wnspdntH8acoRgKBLWf/+FI3Ndmbcezxcim+6rfA/kirROkMRDQn1gjVtIvfCFIxY595iX4qrm0BasJ8WgXsSz7O4y5QEdjxXl3qDz7P7vLb+C1Tuk38YH/hFQf5BogDoqiVIVA6/1ERFtNQ6gsFWh4M00ehfJB0N1ks8A9l1CPadtbuaiVedo/LCujfz8wEiIFKAMhWxDk4BriOEnps01kl6koR9GkU4AUuFYN/XKhcPKV7uYe9Q+wcmGahOttxWlArMd7Rj0k/X0zGoFr63KxGno+uTDp8uqgzPPLoiOHRGilp+XuVH6wWT3LwVhNzn9sat2ZvvUtZGYdL8wqB6t2q1yxwmJOEnuveNLY7qTVG9S3NfiCisdotpus0DVs3O0CReRJaeQTNmQnfEoPbvJNsMe0HmfKWS/dgBbL4aOvU0hJWaJLI5wxqkGJ+2GxkboOge1wcb5Efx6n6LSm1KXsRZMVE+QxUQuo5xD1UNkhe3lhH3Cdd8A1225TiiZX97dBZMmSn4RQwl4cJQxDcGBL8FH55s/TV6eWy7jh3O5lYBRfUA266BPQtfrY5/XeQvPUBrSMr2T+5NARQIX1s8Y4vCqts9x2E1i3vrSGTj0+SbpmiL2mqMZlgv8CBDiZ3bz+YDU2HTPZq81aOQfNlX4rtpQd8XmOncCHHEY7ximFWdtMpwI9BhJVgBZSK+R/D8OuL4nO0S
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2415a35-a972-4d4a-0598-08db88fb0fd7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:26:48.9311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cllahq0gLwpSYYF1HS+fsgfKF8jND9HkO5iBJWm0T5787ydc1j2p71ih2W07hBnyh2kroWo803JwH/Muog6A5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

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


