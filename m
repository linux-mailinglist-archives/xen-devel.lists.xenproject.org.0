Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6C743BE4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 14:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557464.870810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDFN-0006xe-KY; Fri, 30 Jun 2023 12:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557464.870810; Fri, 30 Jun 2023 12:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDFN-0006uW-HJ; Fri, 30 Jun 2023 12:29:09 +0000
Received: by outflank-mailman (input) for mailman id 557464;
 Fri, 30 Jun 2023 12:29:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFDFL-0006uA-Sy
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 12:29:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b287e553-1741-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 14:29:04 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 08:28:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5138.namprd03.prod.outlook.com (2603:10b6:408:7c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 12:28:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 12:28:44 +0000
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
X-Inumbo-ID: b287e553-1741-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688128144;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qmjql4GOgaE7KUyWnLmFlnIFmOBZyfunbwxAYuAZAE4=;
  b=hyYXpzwRMPymRhYH3t5kMYhSuPe2yK7c+4dMsfazEZq5DL34kuVViKou
   doy+ZHxv7taZfT2EK3/wzHr9En9kTprqecI6Q0Kyi5fRHAmw0UtrTWXaS
   9+uMnCgOJ8xlIgh4C1TJfBxvCC/O6o0VBIm9wGosljWI2V+98fFu3kIUV
   I=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 114045837
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:y+qDKqqoduLnjLXhgL3rxwgZjJ9eBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnVMqmONDP9KoslbYS0p09V757SyddkSFc9qn8xEn9HpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weAzCFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGwMRCujttjo+q34Y+RzwccILez3EYxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Iy3ADDnTN75Bs+Swe1kN2fq2CERfl/d
 3cmoTYSooUu6xn+JjX6d1jiyJKehTYVX9dSGus28gbL1KPQ5wubAUAPSjlcZJots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ5iELJR9M6Saqt1ISrSHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodtzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:+erSI6HjApAQjm3cpLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-Talos-CUID: 9a23:4Ta+9G2oow04blXomkfvHbxfRsEPSV3s9inqPAyRBHkuS5aUbEO99/Yx
X-Talos-MUID: 9a23:GUsuzwkr6zJFgXKuE4Njdnp8aMlZx4KPJnoTurVagPvfKRB/FiuC2WE=
X-IronPort-AV: E=Sophos;i="6.01,170,1684814400"; 
   d="scan'208";a="114045837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaQjwvJEPd6RLNE7RDj5PGYrBxLN8ebFUZQ/FCxoh6KVrYukBcoOokeLVIzb5WXgMiV4MS6yMRKbHGfu+hz7wUDfjqr5BgEnsTJ9j5pLi3Qmu+D+vQIOrMZy6GJi7FfnBkAmob+UYKOJKP3yL1ybWmpLGX3ylDqm9UJWHdZXLLCfH3xKuGyJzLevcdEjJyF8gBiV1RYIF4eMBqy2T+InQfDkIFedcZ1N7VyQ49A9/YwlXJ/ap1Od5RX2MRmUqSrmt+eDR6DAWXovjB8fmTXM+85IOgQkBnD8fIOTS45IwsHhEiMYXDsyezw4B4vWtmKtaOdrgi4HHLoVjuwOcz2w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAWpSxK2SAnaaX+uD85IMG2GwGydbob6sZgACDWSmlU=;
 b=jH6g4hJhuSBcoWooZDHXhT3KpFmEosn4BRqlvfsKZeUp45tXhFNX8+6Ls20aPrQFFXF60AzzGVGDsESGCz4TE5z6+ZQhvMw9iuwyR24VVJ914oam7oO64dIfebh4y5qbwjzDPOnYHLS3dEtDHW2nthVWUUelLEt0lktGUpMyHVN+yo3Hkt108QSihRN1PwoHLRkSVeUP7pkoV20/0PkSwoD6cYUD8QB8MJWCDDGGIawqudq+Ed3rBwA1I0Ds6dc0rsyQSvBqY8J7TfWTED6RLsM1uTPkZWVFgu8w6pRqgjvZmKL9JJv1I3F5EPNBZSSNiYZ5rTs3E/aejMwgXxzS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAWpSxK2SAnaaX+uD85IMG2GwGydbob6sZgACDWSmlU=;
 b=gT1J4uteqCwsdzotHAZwyxyw7e+siexQK7DnVD3nMYe4Di2jXGBOcGM5+Sv5w/OR+SnhryIiseTFMjqL8NFF0d5O/QUJ2JoNhkOyvd1+v/A5ovWl55T8w0r5W3aueW6MMlyhScVzWRBuy8gCmHd0ug/JswbbeX4/18ZnuvtfcFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <647f9bb9-a681-083c-6195-34a89606d190@citrix.com>
Date: Fri, 30 Jun 2023 13:28:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] x86/boot: Clear XD_DISABLE from the early boot
 path
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
 <20230629121713.1211-3-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230629121713.1211-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0345.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b67d20f-e3c2-4dd7-3e89-08db79658b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Utkh2OG1GdR/19iPyyBEtqvGZ6FdntOmaXd9KteJLZS7xjJNnn7+k17GzVl4IION0F4J2y0B1L/w9aP85avz6++uUasfuxMA2JR41tZbjpnZrmw2IzJFw3LUDr4SwUvpwn0/GSNFMiRR7oOxh91UmNY3SIuptoJo8tQ6FLSVudEnTVQ5LHWHpALI70tJCKBbHQIJBmeHb0q2tr8ZE+lXh5HtVrQolOqt1YFA0KYg2uRvcPNJySOvQ+9F3utBn8BmY03JxQKX4QFk/Jfpb9YR/3dBYNWnHKBmb1vR8yPghUcntTjayJpXfOn0lihsz9trmMkz/fiD5tsrqak3p5w6ayQXdYm2JCFy11uaecF8XJ7qigxAk0L/dLqyX1I5Ih2wb8sZQTa3v5CtnKj295aS8wtL0WZTj3D6JzdmTIGh5zD9SN0oQ1ZldeNjnnTqO7PMvp6/8x1Dekors3Tw1ZcIV9tWgweNgn3G5WClNWjtxdawA5yRyB3qEw61YYzPddSJ2oGGCRWF4G5vg2g4GN6JxpBN3fcmClm2rgNgxrVRRUi21veAdrITWueFfcezhCG+CINJCIoMbZqr+qhjYqgX/yTJDB5qpubP4qPsFlWXmqh+n3gEqkDUR2OgGGRGMs/hIx1YEKewUTyumPiQIYls9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(83380400001)(2616005)(2906002)(4744005)(38100700002)(82960400001)(36756003)(8936002)(8676002)(110136005)(5660300002)(86362001)(31686004)(6512007)(41300700001)(66946007)(66556008)(66476007)(6666004)(316002)(6486002)(478600001)(186003)(31696002)(6506007)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGMzT0didUMxbjB1OWRRbmEvT3I4emxINGJWdTZlYS9EKzNxWUlUTklrdC9u?=
 =?utf-8?B?K2xnd09qQk50bzJLdVJIbVVmNm1QR1E4dWZBUEIya1JyRnJsU2NBelVHcy81?=
 =?utf-8?B?cHRzdVVKdnI1VlRRM1VFTzdjU05oUWF2K2RiWklHd0xVUWxtb0N1dUkxQk4v?=
 =?utf-8?B?blRaUGlyYkl2elNiRW5HV2VIU2FyL0tQdUF1STBFZ3BmUzhHNEI5T3VTUHY1?=
 =?utf-8?B?aVhTN0VOQ3F2anZ1SW9QRFJWUXQ5dXVtbVE2VTkydXljTmlOZ2JSRzlaTmho?=
 =?utf-8?B?OGRGZ2ZHZmRRZTY2bXk5WlRZK09NQ2p1VFQzTXhSaXdreFJWZTJKQTBlTXox?=
 =?utf-8?B?R3Fkc0NlaXp2TkMySERXUmdvaEw4ejFKcmsya2lldmxGb2hHYWJ4S3l5aXJW?=
 =?utf-8?B?d2ZzMHp0WDU3bDlpTEtrS2s0dFJKQU15Z24zc1dqYXFDcjJuZ2JtNjVQSmZD?=
 =?utf-8?B?TjZQemwxTDV4MTErZGhTaUtIQ05DcndSaXkrcVg4RGFYMG1lZW5GejIvcFNr?=
 =?utf-8?B?OUdEV3JuaXlOT2kvS3dRMU0zcjZtbDVIN3VPUzlFTDdmRjNVMXQzTE5FYitj?=
 =?utf-8?B?Z1JlblNTZ2Z0cTRET08rdGJBRys1aTIvREJyRk12MEVQU1ZTcDhCOFVQWVFC?=
 =?utf-8?B?aEhRVXFWRVU1MWRRN2JVaEVGTDh0KzhlUlBHYVRwOGZpbVZVbWVFYldDU1Vu?=
 =?utf-8?B?bUFReUM3Z0JsczIvQU0vMUREZ1hhcTRTZnFVRHdLMGhRUWgxU1gxeVNSQ0lJ?=
 =?utf-8?B?OGpCUzlmVVZTSmFreGJvMU54Q2IzSFgxSlFWemhGMURXR0piS3FjdUxsVmpW?=
 =?utf-8?B?UlBWalJyS0FlZXlRdnV4ZDlyMmlBSEp3TmJEc1QwSlhaOWZickI5bmZrSzQ4?=
 =?utf-8?B?VGxGZlVvWTk1MnpRU21DWFJRZmcwbUNhY3R6UHRnYm5QTyt4djMzdlBkR1BU?=
 =?utf-8?B?aXRhd0NQa2xJZnd0aHBXQmUzVWVMR3hPRlc0alluTk9lWWkyUkQzWE5HSnQz?=
 =?utf-8?B?S0hTTDdXUTd3aTlCcVd3Q1Qwa3pFNThFTGVNZ2UzTmxTME5CMDVPOCsyRzVK?=
 =?utf-8?B?am9PZnB5eUw3bVcyMWQ2dzRncThYRkVBdmc2Rm9qZHJPYUZzQVRVQmRVTmls?=
 =?utf-8?B?azBHVndRQ2RDZHhxZ1d4Z0l4VWxXS3VwQ2tlYWhUQnA2bDlmSENRc0dpam1l?=
 =?utf-8?B?SnV6dG5oLzBNQnlxbzdTZVd1aDVKUFJhQVk3cFBQcFJ2QWxNc3FLa09yOTdI?=
 =?utf-8?B?V3ZIUG9UN1VnZTNtNjR3YWV6SWhac1ZFZDUyL3A5bWMwSDgzdEZQazdDREdF?=
 =?utf-8?B?N2I4dTBSajJGYzkwNmY4NlJPc3YwclkzNnNjRVRYUm56aTJqVnNKNk5JWHRj?=
 =?utf-8?B?YUpFUXF3RnNWNjdmK3FBcDM5NkkwS25HNTgzejJrYWovclQvY3o2QUpFaE9M?=
 =?utf-8?B?MkxnV1JCYlhqc1BjRXQ3Mm5oOUY2ODdFMVY2aDQrZWxTOHViaEdMeEJWQW51?=
 =?utf-8?B?WUVKa0VPMktqNTZRUllCRjFEcWxmaXBtVGFqbVcxY2hWWnUybndwYkt5Z2gv?=
 =?utf-8?B?S2MyVlZ4STZhUzlnSFVxckV0aElNZ1o5RmFXR1lYd3pxM214Wmk5Y2ZtRFV3?=
 =?utf-8?B?SWNOeXhhNFZVV1dyU0VQb2FhS1M0Rnhkc2lLeGtwZzcxU2pCb3A3NDRYK1FP?=
 =?utf-8?B?VmVNNER5NGZhVXNZYU5QbkJaWHZVL3FMenhENG05bTZmUTVIelpvMUhMTFhJ?=
 =?utf-8?B?Nk9nanorMW5hMFRsNkRnZHM5bUx0WVU2Mmo1NlJBc0ZMVENYZXFGNmlZc1Bp?=
 =?utf-8?B?aVlLR0JJVUk4K0xZQWQ3dkxkMzlwQytCbEVkS054L3pxZTFwUjI0MTM3WExN?=
 =?utf-8?B?bVkxVExzMHNQTGJ2SVZmM3pkWkVjSDJiekNFUDNWODJLUG1LZDN5b3lqRE55?=
 =?utf-8?B?d1Jnc2QvT3VveldXWUZ1L0syTGlVVGphWHIxeXNuT1ZNTFZrTHpnN2NwUHp5?=
 =?utf-8?B?eEZxYWtVMjJldzMyWHpWbVpQNlRzajBBek0wWkdYbHgxN0pGYlUwcC9MZ01p?=
 =?utf-8?B?Q2NFY0IzL05Xc3MzKzRvV0M3REJIVFR1bzlJejdUcEVXQ3RDaG5GcTl1Wkhw?=
 =?utf-8?B?emR1Vm1rOXZseVZ6NUJDaXNpSjBTYlY0TVdQZDdMV2ZsRFc4NHdjNVdNTXFu?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QvTp/7/xhl3lb+9m/qasB80vYHfoO4WVgydZfWbxBARCJpRI5vrXbFwizIcMpuXvjwlpcNdhYXBVJm8DQDe8v8wuKoeH2+6ntQdr0WQ7n7njjDTUIPHyTtGt9HLQJas0bYwj3xeByIMq34tgPjGJLnYPPfwpezt9XiEDlQvaIOBSrLbms0z8cVhz0an3wF6Px9iUAuURpDejYAe0DIIZFVD/C3+1Gkihq+96SHC4srPBQdfHvppBPyAUjZk7+6pezbylwU0yq/eTSUQqzkdmRJKxjXBwFeJo6oGFz0bO6s5i/WjElNG57nmQFN0QKryPbQ8TNqGTCXJ5mI2K4xdlLy1wRGxn1fVezgIGaoZT9fczZEA0v9w7Fl66+WM8/i2hmf+NPIgR70+LIL3DUW9ech5FZodExrKORBIDzgTfXU+aIGAoXHHoC0uOVakBVaORWOMEq0JqM4NXnedLumGUZrGBfsbTOlFo4zsaMyMWzolRfLcztwMjQLKbAur0jOPBi8XT0DPzCJnjlxOlfF8klP3oi9R/vL5+R8AvCJ9WMFl77NFOT7/ii1lv6hEx3Uop1eW43Jw7cheXwmOT6yG42fakrDLN0T5qhmgkbcwVSKhp13aRsTQDZi/oVCengFsYgk845TfMBZ9LyqzDLabts9ZzVR2RwdxW0EOL48FxDnE3nl+p971PbCHGqmQYAnrVM6+CbFumlkINgOko+54bil8A1XtQgmEzXyYyPUBraVfNkw9kaSreai+NPWRlh5J2Glm4dQ92LbAzUX6dO5016WD75agPaCsiNAdqN+NGpdjml1LVIu56lOVcuP8ynY+L
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b67d20f-e3c2-4dd7-3e89-08db79658b46
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 12:28:44.2976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2Y6hOvHp9/793fYGoSv0QpgmLTH97zbvAbokZEwTx9ADem4WEUZdeyNn5jl3l9N+LYzWPwSByoAxuh0yrwnG6G4Ndk6vXQ19mpU1l8rDL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5138

On 29/06/2023 1:17 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 168cd58f36..b2443b6831 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -304,24 +304,20 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
>  	if (c->x86 == 15 && c->x86_cache_alignment == 64)
>  		c->x86_cache_alignment = 128;
>  
> +	if (bootsym(trampoline_misc_enable_off) &
> +	    MSR_IA32_MISC_ENABLE_XD_DISABLE)
> +		printk(KERN_INFO
> +		       "re-enabled NX (Execute Disable) protection\n");

One other thing, which I'll also fix on commit.

This now prints per CPU on any system where we had to set XD_DISABLE. 
It want's a c == &boot_cpu_data to limit it to once-only.

~Andrew

