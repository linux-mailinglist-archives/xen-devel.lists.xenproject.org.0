Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70D7739D0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579619.907678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKOZ-00033M-Uo; Tue, 08 Aug 2023 10:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579619.907678; Tue, 08 Aug 2023 10:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKOZ-00031B-Rl; Tue, 08 Aug 2023 10:56:59 +0000
Received: by outflank-mailman (input) for mailman id 579619;
 Tue, 08 Aug 2023 10:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCDA=DZ=citrix.com=prvs=577c1445c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTKOY-000315-KA
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:56:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 496d3e19-35da-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 12:56:56 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2023 06:56:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6931.namprd03.prod.outlook.com (2603:10b6:303:1cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 10:56:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:56:45 +0000
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
X-Inumbo-ID: 496d3e19-35da-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691492216;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2jNFxlV28QRE3OEi++L+SMgSEc3ioujoxZyvZzAKJN8=;
  b=S1ZiSW7sHlWY/WXjqFxOnFPWEnugxDZysqnRGwmaiAinsPk/OPl7tvRv
   ywcmcxljK97V17rtPPG7+ieX9kblI5uKsMRAio2re/6T41JA8qYjeyFTx
   +rME/NdLIwxu11Je9kc8Zc4xwI5QYZHPRbfPmwhO1iwUNhTfPft4k4I41
   I=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 121486593
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KTWs762jGTbI7kH1PfbD5fBwkn2cJEfYwER7XKvMYLTBsI5bpzMCx
 zBMXW7TMvfZNzT1e9lza9zkoUgE7ZWHzoBrSQNvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxmOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfG3Fr/
 OM/EysxYh3eiOWfwYmLRdVDr5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqhAd5CSuDprZaGhnWh6mgLLxRJCWG3it2Ck16jBugCc
 WMbr39GQa8asRbDosPGdx+3unmfpTYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAEDs9/qpdhqigqVF4gyVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:wxLoNqBXEFI0LCflHemM55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V/MjzuSWUtN86YgBDpTniAsa9qA3nhPtICOAqVN/JMTUO01HHEGgN1/qF/xTQXwH46+5Bxe
 NBXsFFeaTN5IFB/KLHCd+DYrEd6ejCyqyumPzPi053SwJnYbwI1XYbNjqm
X-Talos-CUID: 9a23:usFcLm8ZEebeIQj/GsyVv1QEP8k6VUbG8HvdfkC/IGdSeLKpZnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AxRtolA1bwkmQDuntNAT9HaOZrDUj0YiqEGcEzsk?=
 =?us-ascii?q?8t+KgDjVgJmqn0W6YTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="121486593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6P2zQBJmJogMPGsZOxiZbGtXRCHylIPw/rCDL0jyIAZrSitBew8ZgbIODyjyjiEXFZJi6TKsiJdfBu157+hfUUL4/TU/31fPZgRnC2n3iJhe6xwTGLLH+a/8bgio4gB/QEp7/VlKcLPlzjzadaF9yayDdCvmrP1EbZWRMezv8SmWlEJ2TxI/4wO4gD+Ria6g26uR8+iGeGPqBe6xXVnH+Ijgrepdoc58yPX40igLAWQJqArElGxYxIjm/ZXEFibSiPiPf9SVJxlc60RJgNNQdJhlLI2wnEQQK866Voxmy6gOQRs4MMxp1fwfWaSUKlUAs4n6MDdf+4GX+fpCx4qZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qCSSSOg1/cz8iOPZBvc5n7Io6CJH4Cb61rXtF0d+tA=;
 b=fqtrXpp3H/VH6xIUuPjxTZoNrNqbpa/PSriFGOzC4k1mPEhHDB8M7xVG1ZQVQ+aAheqC8+GOp3utuQbBRGwb+m8EFWJyVqNgN122NDshiIe4PyRxHPgIUxXi1iDPzOBQjBdeu8o+OXXLCJ7bg6IAn8HfJNg8RD79QNZOfJ7y5dg29TByvwN2LbNtJmlD/ZDdM44I1Qi9fNpP/l+SLcG088Rld7W5IqpciiAGlr82gylWF4L5UkkyklFLHTq3yCVV6s7tRWiHWY5k4J9yte8HUQ3XesWCe6epVtprY3pVC2LVdbXkNi3b2XmmbU2FRQh3MX95D0E6u5oNHdyRGhxU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qCSSSOg1/cz8iOPZBvc5n7Io6CJH4Cb61rXtF0d+tA=;
 b=EnE9ege0lZ/+ZdkFK7mw47dOx63Xwftp5LeLyWNiRgzBtdz+0m/kMBk1FLRL+EwFas3wWRYANqH9Ci28DB5QEFezdolRihFT5HD8/iM08QMKhJNRkLY13OSzsXxlUUPxGmAGEl8PqK64m8IEUXrOOzEE8fYTmQBQmdFtjTT88KI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e6f63e6d-af0a-0e2d-b9ac-68cfaa083c7b@citrix.com>
Date: Tue, 8 Aug 2023 11:56:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] tools: add configure option for disabling pygrub
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-2-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230804060000.27710-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::18)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: c83f654e-fd11-4210-4638-08db97fe27a7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nLcHmpzCxM1/ZiecxS+rId5b2bPtigaE3ENtZL28f32/ObIWDGStzRcISIaaZg07gUKWbRL7Gq0CzNYU2LUXJynwNE1Tei5rnIoVScuYJ2ps8llasDjJI1KmtiF0JzSCqDq7T+eN0WWpf86eOnCN8qSUIlA2R4BNbdaCtnAJbB1vtORUZ+JcY798cOc5cl4xFuEpTBPaK2Va8sU5yOIl2S0c82WSN7ibS+ZBI3KxF5/7IXQV1l1yStJZWChi2MtPi7EKmrOHHboUH6BfTv1N2FyOdotKZfVzI0tnjEkmY5HxLWTwHpIXCvEGabZelK5nS7lhoc4fCv6W/UrcFK69n2Tksi5NFGVIfMpINPncedLyb1T10LiL7ZwqHzCqIPfqVT7JRIyxWSw+i6lUpyQNygYlIP9URhz7zO7Dj3wpZzKHJEcz0QgxSEPwIWyLgNsE6fpo+PkHUko/w1RvwstYzPsbprKQ6SSRau4yYaQqsLacpHhfNvvcaEOH/a66k1sC7t9XhEeED8GwFsc5S+oVgYe7mTzi9MfsKD3dAGQUd9HOOiROw9F5qxHEuygM2/4gBieTlnPu5hSLRFv/A9ouHXgwDTkspggAJWT3fR0iS1yeIHN661PHMqM8AF6JTOEN7XkxBgJYvfku2GTj5iR6PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(1800799003)(186006)(2616005)(6666004)(6486002)(82960400001)(478600001)(86362001)(31696002)(6512007)(26005)(107886003)(36756003)(6506007)(53546011)(316002)(5660300002)(8936002)(4326008)(38100700002)(2906002)(8676002)(41300700001)(66556008)(54906003)(66476007)(66946007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWlEYWtMTGRtc0NvSjdvWG1ncHh4YXdrL2NtTW1BOXEwekcrTnNRRTVPSis5?=
 =?utf-8?B?ZlpsK1hjRkpaamRQMVRqMWl0aHB4azZFekcwTytjN2w5UUJBenpETUZwcXEw?=
 =?utf-8?B?SldjM3l5OEpIRXE0b3dRZHZ3UTlCZ292MGdWN1ZiS0dubDArcVVjdTlsZzA0?=
 =?utf-8?B?NlFNL2drZHU0ZnBicmFIYVF3N1dDTlRyeHZ2MDZWUi9COFpDQ0VQVzlOZnNi?=
 =?utf-8?B?WGxSMG1nVzRyM25LbnM0YkNhVUs1bHdJYlJXSnBLRGp3OE5vaEFzOTIrdDZB?=
 =?utf-8?B?cUJTVVYrK2kvU1VNZ0MrSVovMUdBZXV6S0g5NXhkRTV2N1EweDFPR3p1Ry9o?=
 =?utf-8?B?R3djdHNEMzBpVFFnZkZGdlh3Q21zQlVXR3FyZTZJZnhhRmN6YlE0ZDRwOVQz?=
 =?utf-8?B?ODBCczJzN2VZcUs3RGpkeGpmdURSUjhtWXd4V2FCUVpkS0YvTE9PcjdHRzhK?=
 =?utf-8?B?OEhmZXpaU3oyWmI0QldpaFhtNzZIZzBhOWxBb1FGVTl3M2FzWEpyZCsxUUJi?=
 =?utf-8?B?bHh0WDRCT1BXdGlsUUFKbU41Rkl3ZXFmdVFhNlRiWDZmUTUwUjA1MTVvdXRL?=
 =?utf-8?B?WWxDekN2ZjZpcitVODA3UjVudmxGMjJMUDNEdGxKL1RlUmhURG5lNEM1bzd1?=
 =?utf-8?B?OTd1SmdDaGV1R2s5Zm1seS9hcjZnMnlxeGc0SDFpRTNEYVRlTXY3WlR0TzlV?=
 =?utf-8?B?UmVELzRSTk04UEFSV2IrVVVON3BIRk04QjFFY2RJQ1ZGV2tuS0JJMmMvZjYr?=
 =?utf-8?B?SS9VM1NaOU84ZVZlU2JVdG1nTzVvRisvUGkzaUowaW9UYXU1cWN3OGFTVkNR?=
 =?utf-8?B?NDRoWUZ1c2lnWjNteHZBaDJ3blRtY1cwcHZMcnNLTmJZd3JjWGpLWEt3QVc0?=
 =?utf-8?B?bG9oMjVrejQ2ZHlHTEV3SllZOXZhaCtxSC9zbTJZd0pYTWZHRWpXQ0huMnRw?=
 =?utf-8?B?VUtVZk9WWTR4QzUyNHNqRFdzYXdrNTRDV1BYZjNPakREbDZvb2lsdHlLWjRV?=
 =?utf-8?B?RDdSSWQ3eEhRQUJkRTY1V2ZJcWxlMXNNSU1TTloyVDk3eXlYVktJeExldGxi?=
 =?utf-8?B?eEx5TitsWENUcjFSV3Ztay9MbnVya1o5cVFtRjRkMzgvTVFvdUI4a0tlelhE?=
 =?utf-8?B?MXZ4VHdLeVNEL3UwNkN4aGEwWkhNVkVaeUp1aDRaWFJweGo3Y3V5UHNRSFpu?=
 =?utf-8?B?Qmo2Z3IwOUlMSkxDTGEzWXNkTmFHUXF3UkRzNGtrektKQlpQeWtxeHhwMFgz?=
 =?utf-8?B?dlQxRDc3SWdzRVB0TXlwYldpQ3FnaWxCQjdzQ0QyNEh5RkZPMGVUYTRGblRD?=
 =?utf-8?B?dFlDUzF6NFJKL0pwd0lva0hwUFdrOCs3QlFFek9vR2pMZjQxczByRVVSY3Zw?=
 =?utf-8?B?U1poaklyOFZ5andibjFBUHEydmxIbUJDUk0zYmZsUDdkdlJZSm55MFE1RmZ1?=
 =?utf-8?B?SURGK3B0aTcyWVpCbTFLNlVncmV3b1lNem15alNmZlRmS3U2RzBHTUVHY0tl?=
 =?utf-8?B?c24ycWVPc3VCaEt6Q1ptY2R5SVVKZGRnaEp3WkVnNGplQkZPeVRySTlDMTUw?=
 =?utf-8?B?dEZvMmNubHRpNVZsekdWNEg0YTFtZjV1UnR6ajlOMzdNZzdpZWxMbEVGT25j?=
 =?utf-8?B?ZzZCSXBlMWpmZmRaZ05ka1RTZm95R0dmT1Rxc05DRXhNTDFhSzcyYi9vTnpy?=
 =?utf-8?B?RlFWNlhZRk44SkRFMTBLS0x2c0UrZm9rK05IamFwendNTFh2RlE0aDFXTyt6?=
 =?utf-8?B?SEtxdncwOXpZYjJJQWpnTldXbm0zQS9PM0pBTUZwR2hCYVU2SkZ2SG5oSldK?=
 =?utf-8?B?WXVOeGVZakxmbFlQZy9meFpwVUVkUEgzTDQwcEcxNGZSTnJ3UHJnRUNiNWhK?=
 =?utf-8?B?U05CR3Y0NDNGeEJ0eVdxZUVIVklOcjR0NS9VMUd0ODVtTis4K2NuY1U3OXpr?=
 =?utf-8?B?bm9VMnBIa2tTWUtGSGlZREd5MzgwM2JHeWVrUnU5bTNuQlJUekN3anZ2NllR?=
 =?utf-8?B?d1hHTUNtQXNmYndCaWxabzBoMS9kOE1MZFhUR01vamVDemZSK2tTS3pPL3pa?=
 =?utf-8?B?T0wzVVh6eVQ0VDFyd3dub2xFKzdBY2FYTlJGViszSlloQ3ZieTVxaXo4R1A2?=
 =?utf-8?B?S1ZpNlBDRnIxZm9Kc1JBaW1ZdERMWWY3eU1hQlovQVNFVEhvSldNSG9WVUg3?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m6AGP1w9yqw8AvGf26qoTbTAPThB7Q1ghtVqpuWevWxR7dGYkqDwaIw3b4QSLciezBBnjyskiHfNh2Gi3yofI8skp9DDsMn9GtG/7qlAR6T2lW/m/5SSgLw1kDVxSPUrmFO8Q9V8kxY8QU4qjjSjODkY/ZGXHn5qWvIBkxf0NJ67lJsR74Zh7o4yNKFEIFIkJ3/XZYWyWfQeUdyIjB11SHEgiQp2Sas9k74nlMi3cYls8B+kkQ41BF+be9e7w7UOmEyjvMb0HGqdYasgoKBt+l/1pPb4zpUcnIb0t6lr/NIjIcm0VqMfx8X1vnEgF0PvLhhtrXmpFyAmcSeThr1kJfxJtv2+7rmJuK5wi9EcmSe3gj5Jlxk9AH1Bu2XpI5LLZuVWH2p7wrJ66ms3dhIjctEKC3br7ZFmomVa4in2+gC6CTHDbmPFDAo1EBitvy+8ABIAUzATbjqovRCVerE9ddU19Nx1IAmEvrG4KvbE0VPYnp2LUgZib2HFiAWMEkJyzFucfcHBpGeSEFL4hacGz+GaXniZGfL8NYl62ucHj42knbC6VLcG4GjyRyG58Gelx9xFDtALH9nxKuYyNdLnw31rwV+TvMQTyO2bpph65aHfnjz/WuAJmosDnei8SWljvZJCCAZ4yCyuOHKtE+KjaPSoGc9T5s86UbgJc8BOTaq4ZhsDoJtPQZZ9d5jrqj1UhBKeu/6z1+Oz4fzC8eRurJFg5IHStu5WT1TbgE1/U+5BdLDF6GC+squuXWJFcxudI0Wv+/ZVqAv8z1AFEmWaFHDRy2MWLeTVyC/YeoTa3d1L7LAiX3T2sXpazT66nQ1u
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83f654e-fd11-4210-4638-08db97fe27a7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:56:44.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfZCsaI1CEC40kA4DWS6j0wCqjeGkS1XzvkTA81E/MPiiC6H57bTPRuuDUS7wuJA+FPOkBdqtvETsYNvwLEA4QHV5tJy3TNxtopxMcqmIBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6931

On 04/08/2023 6:59 am, Juergen Gross wrote:
> Add a "--disable-pygrub" option for being able to disable the build
> and installation of pygrub.
>
> There are two main reasons to do so:
>
> - A main reason to use pygrub is to allow a PV guest to choose its
>   bitness (32- or 64-bit). Pygrub allows that by looking into the boot
>   image and to start the guest in the correct mode depending on the
>   kernel selected. With 32-bit PV guests being deprecated and the
>   possibility to even build a hypervisor without 32-bit PV support,
>   this use case is gone for at least some configurations.
>
> - Pygrub is running in dom0 with root privileges. As it is operating
>   on guest controlled data (the boot image) and taking decisions based
>   on this data, there is a possible security issue.

This isn't really a possible security issue.  It's a high(er) security risk.

Pygrub is still security supported, so falls under the usual security
process if an issue were to be found.

>  Not being possible
>   to use pygrub is thus a step towards more security.

IMO, the phrase you want to use here is "reduction in attack surface".

> Default is still to build and install pygrub.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  config/Tools.mk.in |  1 +
>  tools/Makefile     |  2 +-
>  tools/configure    | 26 ++++++++++++++++++++++++++
>  tools/configure.ac |  1 +
>  4 files changed, 29 insertions(+), 1 deletion(-)

Shouldn't we have a patch to (lib)xl which provides a clean error
message (rather than -ESRCH/etc) when the user selects bootloader=pygrub ?

Fine to be a separate patch, but not something which wants forgetting.

~Andrew

