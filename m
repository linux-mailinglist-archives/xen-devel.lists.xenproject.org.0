Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A186B9C8A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 18:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509768.786208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc89t-0007ib-6T; Tue, 14 Mar 2023 17:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509768.786208; Tue, 14 Mar 2023 17:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc89t-0007fD-2m; Tue, 14 Mar 2023 17:09:57 +0000
Received: by outflank-mailman (input) for mailman id 509768;
 Tue, 14 Mar 2023 17:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc89r-0007f7-42
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 17:09:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08368aa6-c28b-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 18:09:53 +0100 (CET)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 13:09:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6780.namprd03.prod.outlook.com (2603:10b6:a03:40f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 17:09:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 17:09:38 +0000
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
X-Inumbo-ID: 08368aa6-c28b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678813793;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TNh78obPd0Wzoa/rKz6MLHBTOhxQgBx2L1v1Mh9iPss=;
  b=e/5d88uK3jzZ8gaLH6KfYXyXLiQLb2T2dkvC0GjI84W5VMEjyWADIshh
   5yAn/mZAM0vla4dvhPx9uHofaRCyxNO6C26nJTD7B6d4EwRgKnw/AtEtx
   Q0TqL+Vg/4H8ceUizyUgRW36dRwmeHjRik4O86IGOfyzVcecPPPclnZlf
   c=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 100729575
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:o8rgTKjHdxK43EKwY9n0NYnqX161+hEKZh0ujC45NGQN5FlHY01je
 htvX2rTbq3bZzHyKIt0bI/j/ENSsZXdzN82T1BvqHxhEiMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRDMDoXQRGTjdiHyZWja+NLisc9KtnkadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGzYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXgqaQ73QLOroAVICEPBUnr4qGHsUGjVOkcC
 FUY5nUskJFnoSRHSfG4BXVUukWsuRoRWMFREqs59RuKwarX5C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdFjD5x
 TSXpyEWnbQNitUK0a799lfC6xqmoZLDXwMu5gHaW2ujxgx8bY+hIYev7DDz5PJBN5qQT0PHs
 mINncOf98gRAZrLnyuIKM0GG7ev4PSJOSPdmnZgGpAg83Km/HvLQGxLyDR3JUMsPsNafzbsO
 RbXoVkIus8VO2a2Z6hqZY73E94t0aXrCdXiULbTc8ZKZZ9yMgSA+UmCeHKt4owkq2B0+YlXB
 HtRWZ33ZZrGIcyLFAaLeto=
IronPort-HdrOrdr: A9a23:GQyd1a4miJcOQd8hlwPXwa6CI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6H4BEDyewK6yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh4tgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5an854Ed3AUV0gK1XYcNu/0KDwReOALP+taKH
 LKjfA32wZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLhyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQmgoG2jvH8xu1kHHjqcv2SHYTDNdAv5tQdl/851A7tN9x/a
 pX1ybB3qAnRi/orWDY3ZzlRhtqnk27rT4LlvMStWVWVc87ZKVKpYIS0UtJGNMrHT786qogDO
 5yZfusrMp+QBe/VTT0r2NvyNujUjAaGQqHeFELvoiv3z1fjBlCvj8l7f1auk1F2IM2SpFC6e
 iBGL9vjqtyQsgfar84LPsdQOOsY1a9AC7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBalVFrmQ/EnieR/Fm5Kc7sSwlfV/NHwgEkqpllt1EU/zHNfXW2BS4ORATe5DKmYRaPiXZM8
 zDTa6+TcWTalcGIrw5rDEWa6MiWEX2b/dlyurTe2j+1f4jebeawNDzQbL0GIfHNwoCdyfWPk
 YjNQKDVvmoqHrbFkPFvA==
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100729575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4m6D2gXtumHJot/Wi6Yko/kqcAonV4HTbgr/RalYY7nCoh/SihSXqXgYtmwg1FJkroHQnDebQ/vXS6isI8z4pZqfgF0zWMkMSBeb04974zO5uM1AZlNTVWFz7G/8SsUOGdfxkqkxTaRDrAZud47012JlalPRds125rpJ5eattJoxkTLJdQYbMY0628RdEpsC5dBporUr+URjR/s2KqSd+fxZqys9sq5TPd0GcNYm07syghpDZGOBAX0bPI+qdbLdIgqOAyaSP3RM/lD0XpMksv/FJ546egq+IPrf+8uqpGqQ/eCq5mI02WkLUkDNIeRebxTqgR3L9tZ4gRyzGrvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H13SGxzXdJ8ZNWlHRfmycM9ZGuAohEALcooD7APUyg=;
 b=dJ5mzCAd7OSmAPaZjo2dNiUYMtPKy7o3iqx4v3qgYqI3hMSplU/sblfIOitgv14YGNU3fDpW4TDyMKfLCIZoPwDSvfP+EXNiLoyTbDrsP+I5UJ8kSmqQGs8mpOmQFvMUkog1irPr0xKuP7yYnPY3oG77uhcg2YpOZQtPJubdtc5UFr+6wcHKGyuMGBt0czm2n1LIk8OyanXZkXo/52tmOhivvr3CZZ5Y/tWcndcWx1owR3i+me4I5T+A79hKeivmfcWFAwlZIRo/7iI4GMh87oH97YUdOeOnFxg7qc6hXPx4Pfv1t1iMPs8OH/JzkgEW6qDfS4LPyd1tFrdj2gm5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H13SGxzXdJ8ZNWlHRfmycM9ZGuAohEALcooD7APUyg=;
 b=Bc23kNGG4Sd3u7FlKK9AWMybWPluhgOAeproxOCNyCx8r71UdZKhCo7plhLKgfHFHAm3WpTGcOprjEXfra9OpvqvNcCCkfNxBJRLgL+lIP/M9yR6OphDRkbPlCwUS1QgalAtP22fEZbRqzQHyiQvPb7BL3kBgnTXbt65KEZU4+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
Date: Tue, 14 Mar 2023 17:09:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
In-Reply-To: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: f783a216-9f82-4e0c-1422-08db24aee440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SDjhsmo6Mi8VFAauLvL+G8X0QpFCetaQdiWP+Dzx/mQTrRALQO1gSrpwxpWYAZjtDG0dgHRnN7LSO81GnqRQhrxLAU3meVI5BLdGUlhXFE5lJGx9aBmm1zLVVrTPLKoD2ljoVSnTqZvUj5SiynfCIAp2NbbVpr1vdOk1f9RpjQeV1Ztrf58ydMvr+ucsKgRlm4OPZm7rfOVyFnFQkraiK2Ba2cQUezWzIokN1Yy9H/a3mBqXIzDDfTYNf0ls610aDUfDa2xHHa+N0cMFNUjVY0QmkQ3Ayf/Pe9qBxNB+w6TtUToXYR3Qrm6fmHC7qg34XWEn+ULxrOeXcmvnROP47Qwm6UmdtjuzcKf8pnHuqRxZGeRn8RUDHK4GF9oyzuEoB40zo5N8xg/AFodfHl0XZ1S7q6CaT7oi5Q2V5+CXn0l+Xo9JUkvcNBjyDhFXhEgZjigyAKp36GFHCOeW4magocSiC70bxxJblchVr2+LETompO5nfN0MNFO+qxSBd8TdZAbOsgyRfiUq2c2oTiZYir3OSdMM2Kpp+vZDC3U6MyzYY9d1SSgr35PsiRsmaJXHf8WVzAMhHnC+DJwWxq3kgbUr3EvdjrgPTH39xqYji5bH1np9DKGkh35ZVhFzEbfRxzCeND680F3yTQ3E/akwhet03BH6sW3nTYEXD0TP0B/UZS3IioWdPL53OtFfG0+SbUTwmb56tG3RkCNCLmKlxXzEgWWKKXTaDnGCoIlLB2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199018)(86362001)(31696002)(36756003)(38100700002)(82960400001)(8676002)(66946007)(66476007)(4326008)(478600001)(41300700001)(54906003)(8936002)(66556008)(316002)(5660300002)(2906002)(83380400001)(2616005)(53546011)(186003)(6666004)(6506007)(26005)(6486002)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUhiVmNWSUtRZzh4T3hSVTVpa0NnalJlT0N4cTZaMHlmZ0pKY3hjQnhSOUJE?=
 =?utf-8?B?MHUwQkExRDlVS29WV3E1WG92RlBTVUVNYzJ5S1BrYVB0UER4Y2JRSW1NYUtO?=
 =?utf-8?B?VHVXbktkeFRtMmsyRnBHaGxqdWhYcFF4VHdIa0gxSXYrZ0tCOUpuZ29JRnlU?=
 =?utf-8?B?MDdYamExdW8xa2NSODM1K1U1TUlndmJ5WkkvcXU2ZnN2RmQ2d2U5dithRWVE?=
 =?utf-8?B?NHIyQjBLOUlSbE5tay8zb1owZ28xZ3dhRUtPZU9PYXFTZ2pTM2NVcjNZQ3Bo?=
 =?utf-8?B?ZjJOY3hWQTZpYzlpbWlacTh6NTFGNVE5Ui95djFrTllpZm0vODF2bW01OVhr?=
 =?utf-8?B?VU84OHdUWVp1T0ZPR2RXcGVaZ3NZRmw0VXlzaTBKaHdOSmR3SkMzQVBlWE5M?=
 =?utf-8?B?VlRqYzFqZ2tRUkNBblh6cDhYWnJlakdBWXJ6OVJhcXlwZkRGZGZJQURIYXlq?=
 =?utf-8?B?d2F3NmJSMFhpS09ob1dBRzhVYXdNWUtrZVNPMUtweFlNZXRQK2xGTjkyaExI?=
 =?utf-8?B?VVBWaG9BS0ZNOEljZit4QjVHQ2NFUEpRSDU3TGYwS0x0aFJnaVd3YzAvYzE1?=
 =?utf-8?B?Mm5pVk9SQUlmOUFqamVBV0R5VDFNR1B3eUxPc3pBazNRMUZDZFQraHpZMk0w?=
 =?utf-8?B?Q0Q0NW9Qajc2VURUVU0weDMvc2RJZEZaVzJqZmlPN0Jmampwai9scEM3Wm01?=
 =?utf-8?B?Rit5NC9aYURFdGgxZWhPajQ3Nm9ZNDhDMWk5UXY0V3p6NStwZXA4SFNRNk0z?=
 =?utf-8?B?ZDlaWVRYRUJvMGcvRmYya3BsVklncXVreXZ2TkptMXM5R3hpaHVMUVlscXdF?=
 =?utf-8?B?MXhMdnk0MXRrTGZYd0QwQndJWjRGeGdrcWZTUXRDMHNyRXp1NHBTODZuTm1q?=
 =?utf-8?B?V1ZDODJ2WlA0MkhPUjhsNUlYU3ZNcitVNWc2em1xZGE3TlRNaWFySVJ1aENw?=
 =?utf-8?B?bEwwY1FTMisxdkdmSTVaNGFxcU5QVTJ2STI1SW1lemdrckpWUFpIOExDU1B3?=
 =?utf-8?B?U1dTamFlMDV6STlHK1B4VCtkSWxsRWRFRjdKalNHdGJ0SjdJZXpiU2JVT29N?=
 =?utf-8?B?QXVsWXJaaXlOQTROOGJ3U1JoSjJXYURRV2ZydkV5RkQ5ZExMZThJcHB5RWVB?=
 =?utf-8?B?QWVOMFplYUg4UXJGZC9zNEt6ZVNETW1zOEhEU1NlRGphR1F0MW9UYVl5TjVw?=
 =?utf-8?B?Tyt2allHd3g1NHAzL2I4OGU4cWtaTWlKREdyRVNReUduaTg4QWlEUFJteDgr?=
 =?utf-8?B?Q1RZOHMzb0xhSE96dDgrVTllaVllR3J1OVNCaDJlbHBsazJIQnBxaG53RGU5?=
 =?utf-8?B?a0ZUbWZ5bXNXc1crK2FhL203UUltdFE2RHl6bzRMRU8yMW11eDV4TEZSLy9i?=
 =?utf-8?B?ZWdTdXVodXZNTi9FS2JGT2lwVzAyclhlRHFrMnFNUFVCS281TUg2bkdTdkU0?=
 =?utf-8?B?U0V3ME1IUTRMZ2lmWktiZkF5WnBJRjAyL3FRS2VVVEpGM2lHdHV0SUZFN3hq?=
 =?utf-8?B?dTJqaHFqUlRBTTBRMGI3K2E4NWp2eGlnS3c3enNMNjJISmNOczI5YXI0elQy?=
 =?utf-8?B?V2o5S0hxQUY5UEZkbUJZNkF3OWM0ODZuT1VVa243OFlFTG1POG5kYUZHdDNQ?=
 =?utf-8?B?bzYvd0E3a2x1bVNEV2d2OU0vdW0vZUdoekJqVWRWcHE5VE5LLy9JT3VBSGZZ?=
 =?utf-8?B?cVVKNllKMkFPcFNua0orOTlCazJqSzQra0xpYzRKbCtjR3B0cWUxQk9OZUJx?=
 =?utf-8?B?NWxzSG5pTzZPdGJSNEt0SWkyWk45K3JVQ1RxaGUrVXdzeURvQ0wrYitoYnpv?=
 =?utf-8?B?Q3A3ellLVlpSZUpzOEE3S2hHTjJmREwrRkM5QXROVWY2SnFRcW5VVWh1cWJD?=
 =?utf-8?B?Z1lCOGRDaWtjSlhoQlI3TmpmWHZFaC8xSVRTMFI5V0ljWTdUTjVFc254anlZ?=
 =?utf-8?B?QWNHZlBJeGM2OFc5SGtIdEZCMTFLdVdvaFhDV2xHeXhiVTh3ZmozeSthTGxx?=
 =?utf-8?B?akREYklRanlxOGRyekVJcU1UV0dabFVRRmRGSW9wdzJqendYbUh6UzJDL1lh?=
 =?utf-8?B?MVUwYkZmSVBUMjYyTENmckNBdGNxNnlpRWt1NVZJVXlnR0dOekFhNG11OW0y?=
 =?utf-8?B?cTRvNFdXL2JUdlhKWncrY2MzYkVHVk96V2VobEo5T0FPR2FQOFhJSWR5WCtw?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Hae4+tjKvrPo24IcaMujczVD6J5WH/pUFfUB1k4quiuBXXRGz8kYMeLcz3HMmiMK+pGlRkqAQcOi2lOk0tjzXNblFOjumxeA0Z5wQtgvzxB9Zz6kLeCi9uwVsnOvSA/FvVjd5SeNxQAsy253AlZyAW4/duKWcfTVvLD2mQmXo5syH3NK70jxfH11zB6p/JrGXp6NSIwWqqRY3j60j3W+tPNP5tgGcoM7/b3o/yeLU1IettfAhbL/IH6yBROvHygMKs0s2cxG+F+USGurZ/s3PV6VlcRIaBP1inuIZ+AdXIp2IwhN1YRfsr7SNLZf1ThPbb2YufxPwp8u36kWNyA3A9Kf13GE3b4AsCo+q83ltHBqafG1+JUK6htR5NlIIdIEDmYpg4+0z4jz8eUIxSe7Pht9uhIWs+egDwvthTgudGkdT2dfbYozWGjl4T2UuVLkq5E6qtBGEDOy2pKmirQ8Ba/60WTVK2oYqL9YjiumD8mzauZg0iFsy3fTIa+m6MoI3TWU9kFhMorBOI5M+WR2hJ9jUz9PPXkpPhJq7lqzegaA/k2HNTlg5pEgs96rdLM5idWxPmgTxb2HdNHqtgNqvYSjgwL9RfEIlnF2SUvAYwGgb/VvNkH4By6Wk4s65mSc4tcJT5oapqCLDGXEfMCYxBdNLvWVglFVGUG4VnpsxdhKABroEysoNnJ/91i+ynVPwaqvyfK2g0dIRFeXGMQfnE9rPSfEydU0r96E+a5DFVMNrgeMuGJ5kTD8FdPqNg+LedWkR8qpLxcYALHxyo9x95uopsSFj4+f3n2O2A/e9hkf1CPNTOp49VvuwbIAijtK4kPyzuO9usml+VvsM0d7W/S0fiKN5O5//4MOPF1jtvK0S4g21AlpGAO+bnfajOa03t7JWAnq6tL3TrTBcxmow==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f783a216-9f82-4e0c-1422-08db24aee440
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 17:09:37.8183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHFBK7TwZ9teXtPeXCH4xnxPMO6urrGuCTFURbpSj5QWapfkwf/PcKRtSeR84tyWffkdvDUgs9ljmYWui7rrjEC/lN1cTGk75ZYCyLqg1Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6780

On 14/03/2023 4:00 pm, Oleksii Kurochko wrote:
> The patch is needed to keep all addresses PC-relative.
>
> Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
> 'auipc/l{w|d}'. It depends on the .option directive: nopic and pic.
>
> Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
> cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
> where all addresses will be without counting that it might happen
> that linker address != load address.
>
> To be sure that SP is loaded always PC-relative address
> 'la' should be changed to 'lla', which always transforms to
> 'auipc/addi'.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/riscv64/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 8887f0cbd4..e12d2a7cf3 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -27,7 +27,7 @@ ENTRY(start)
>          add     t3, t3, __SIZEOF_POINTER__
>          bltu    t3, t4, .L_clear_bss
>  
> -        la      sp, cpu0_boot_stack
> +        lla     sp, cpu0_boot_stack

I don't think this is the appropriate way forward.  It's very much
smells like duct tape hiding the real bug.

~Andrew

