Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840E274101D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 13:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556451.869000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETPq-00045P-EA; Wed, 28 Jun 2023 11:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556451.869000; Wed, 28 Jun 2023 11:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETPq-00042K-AN; Wed, 28 Jun 2023 11:32:54 +0000
Received: by outflank-mailman (input) for mailman id 556451;
 Wed, 28 Jun 2023 11:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKaW=CQ=citrix.com=prvs=53677329f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qETPo-00042E-M5
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 11:32:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83190690-15a7-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 13:32:51 +0200 (CEST)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2023 07:32:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4955.namprd03.prod.outlook.com (2603:10b6:5:1e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Wed, 28 Jun
 2023 11:32:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 11:32:46 +0000
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
X-Inumbo-ID: 83190690-15a7-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687951971;
  h=message-id:date:to:from:subject:cc:
   content-transfer-encoding:mime-version;
  bh=4OIk/274qQ20YnMD/8rPK0rrt52xpMux86cXtadDmSo=;
  b=aoghuPW0/aDRXfaRJeZp03joCP4lSCsA96sureGviq2cFH9vCXYuxy9Y
   Xh45P0AtHh06miWfLN7S2ohcYrhz6b0jPhgFv8MQhvCZjVdm0Ab+jH/D3
   1u3N/0cv6Y+HS92ExSkBCTB1ddbe6U6OrAKGkiIoQRnQStKFHyCSxmP5A
   8=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 114869216
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DAc2m68Xf4ywTRzQjkqfDrUDkX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WUcW2GBP6uMamWmf992Otm/9hlUusTWn94yTFQ/qX88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmO6ob5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklhz
 PsROWszfiyjoOGz7u2lRrcrucYseZyD0IM34hmMzBn/JNN+HdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilUuitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtOROPprKc06LGV7kIeLFo7X0G7ndqglGCla8l7c
 2VFoyV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdGyz0w
 j2MhDgzgfMUl8Fj/5u8+VfLkje9vK/jRwQ+5hjUdm+95wY/b4mgD6Si7lLR/PtbLIKUS1CHl
 HcBksmaqusJCPmlnSiMW/kEHavv6eyMNjbdmnZwE5Jn/DOok1aoeoZW5zNyLVloKe4LfDboZ
 AnYvgY5zJhXMXixbK4xYJ+rDM8qzq/IGtHsV/SSZd1LCrBqfQmO5z1nfk+X93rkiFQri6w5N
 padfMu2DHAVT69gyVKeW/8Q2KUwwSYW32rLWZfhwhKo0LyTaWSUT7hDO1yLBt3V94uBqQTRt
 tNAbc2Dzk0DVPWkO3aNt4kOMVoNMH43Q4jsrNBaffKCJQwgH3w9D/jWwvUqfIkNc7lpq9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:h/h3cqwQFpz5n1o2AFAUKrPx6+skLtp133Aq2lEZdPU0SKKlf8
 DHpoVj6faGskd3ZJhGo6H9BEDgewKgyXcb2/hzAV6dZniihILFFvAY0WKm+UybJ8URntQtlJ
 uJXcBFeZ7N5HJB/InHCDDRKadh/DFsmJrYx9s2tk0dAz2CCJsQjTuRaDz6LqQsfngLOXNRLv
 P1jaAry1WdlGwsH7CG7zs+LpD+TvLw5dbbiHU9dnoaAWe1/FWVAfLBYn2lNtZ3aUIE/V90ml
 K17TAQac2YwryG4y6Z8VDTq75SmNfn1/tbbfbstiFDEESSti+YIKJ/Wvm+pzg+rPrqxmoLvb
 D30mYdFvU2zWzROlyvqRHgwE3B3V8Vmg/f4G7du2LqpfrwTi87Dc0pv/MTTjLpr3A4tNVL26
 pRtljp/qZ/PFf7hSz40cPFThdwiyOP0DIfuN9WtWVWVb0FYrlLoeUkjTVoOaZFJjvz7LY8Gu
 90APfd4+s+SyLsU1np+lZVhOaUdlAYNiu9biE5y7mo+gkTo0s89XIx4PY0uEwtnahNOaVs1q
 D6CeBTrZlrdPI/UI4VPpZzffeK
X-Talos-CUID: 9a23:5XTAf2EcmgnyPkE8qmJIzUkdC5sbYkH963TVDRCmBTgud7+aHAo=
X-Talos-MUID: 9a23:CPiAfgqDgQo2goGAHfIezx9vEIBF6b6uNGMUj7sdi9KgbQUhYjjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114869216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUVdAmRUX22JWIGiiXL3ZEQA/FO3rCmgGtU8lPMBsLmzCU9XaDPlzXlCESrmhXG5GlNX5DVMTBuBf2Cb7SToYp7w4tDJ6uCJ4FjNfH2iKT0a7AsF4UEUy27iSpeh+2qnktNB5IFhiNyZLDinw99ZlSm0oPHtQ+rWFi6OYwO+FsR9UDRbcTfCvU4sIywMNL7ozYpSLEOuJwBIC8w7/29VCFmX/HebpUMmGGxhgNHzgadUyI6GOYpzVix52MUFxWfELncbjt8Kc9hn5jdLYSyumRtS9/bx0SPc1MjSUP85zzPtCrAk54bh7D6rWPBmzWd+3TkK2oG/0ucP6Z04NGtQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OIk/274qQ20YnMD/8rPK0rrt52xpMux86cXtadDmSo=;
 b=hN5xWAF/nvnVISPDC0JaDavLKSJo2kpa3nkQOGiPPHOJeIxyE87I2DqwhfcpwIbBaXz2UcA7iTazGXZBnteNunyn6npvYHFkJuFiGUz0SfMT/o3HCVZKP3QbAGtXskvV0+TJc6Lz6riC2qtx47p3wFI8gSyeimwVPv+/b0Gfk7zgd5fokSsQT3KuhaME6yW6iGsb22zBQi4a7G+4w5j65zWBJdbv95ru6Yg2X9cD1wMyEE4YTSBcPsP6UuCDbymVLYEI1U/bJASn7b8rqJJs7Xx6s32QlgM6MBDjEcBdpAAcYjIMWYEsyC0KAYYE+IRUv0lYRzUJQLLSh+K6XJuCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OIk/274qQ20YnMD/8rPK0rrt52xpMux86cXtadDmSo=;
 b=U9opAoBGpIA5oX4fabsoxQMyUWDPwsk0lbmR19DefolEyqTwVnOmvwEnsQ61e2hkIeGUW4RD9oq9Cut8ZTB3SjEyF6FNgupv1rTeoYCjx8dtf0FnZMWtF0H2Del47t7/k8pgmvHVycXxJwFtPV3AOZwEsBa77cRFjlJ6hDHatUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
Date: Wed, 28 Jun 2023 12:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: XenSummit: Empty per-arch files
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0633.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: be5471fb-f9ba-4cb8-9800-08db77cb652a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ea5teCUjku+xslzKrNDwPpB6cpIiDh2nMYcK9c8RKJV2pxp/iv3Fr7WujWbTtOILFmq32LcOT1LmHtt2pjluRTWB5rQfqsSAJZsIe20I1naLP5Y0nE9NvVWP+OpLC7b63U9EXWpKVXWR6UfLLJQVGmMiZYzgecK1/l0IANUMuwndmtSQLJ1Y3Oi/2oJEhYKnS5nvfxnPKFRfhkKaO6sVX9ydJXgf9JGbO0kgBgpRd1BRNtHpPZzH3+hCRfn1zYQgxUNmVN0cF/DqR3Lfh2d0wR0HOkLdgZtML5ihfwljk0wStTtVbjtWxGwThqzgH1ivxGDBNpUJgx5at1DnwrZa4SY4FIkjfmfEDZLUx6bQBdM59BPDamowxv+KTZbP3ZK+1ju1OoIawJhuK+ji9T9Lv0RUMoKzZBEQbTC9TCRh54brMwtugpszNZZYwRkrYCHAzFmbi2t2wdXYBZ00a4x6gZaec5zZjXG3FX+mfncpCqFX/8SPmXeim4J8NWDix4SgWRqPt9oQqCiB6LDMdlDKEzRYkBY7zT2n3cwXTPbtwlUdsnsGKnYZQLeWB4FzbB5papsDAsRz/6MMi1gmZ3dcias4ZRLiZq4/mLJz9W1N9QlEXdNX0j+cXeStUO2+8aO39SClCrbUBVQ0aoAwuM3tog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199021)(5660300002)(54906003)(478600001)(8936002)(41300700001)(8676002)(6486002)(316002)(26005)(186003)(6512007)(7416002)(66899021)(6506007)(66946007)(66476007)(66556008)(31686004)(6666004)(6916009)(4326008)(2906002)(31696002)(86362001)(2616005)(82960400001)(38100700002)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDVCcWZnb1JscWhhbkQ3bTNIbXJhK0hLbHh3Q2YxSFZheUNzZzVKU3puMUJW?=
 =?utf-8?B?NmE5RE1zNDNXcUs0UStRcEZQQTFHTFdtVWRzSmZlSVVjK3JIN0VZbWVpbmls?=
 =?utf-8?B?RUpBZ29SeEhBby9pNnlabUUyZWxFSXhEb0MyVzdzVW1hS2kvdG9ac1A4Yitz?=
 =?utf-8?B?UXpaQmJTYjNZWk1Icng3TitMUTRZZWk5dVErekFDSDA4Zk1hdDFjdmVuckVw?=
 =?utf-8?B?NHV6cTBXMkhNeVROTTNxT1YrRGQwYU1RZGZCcEkxUWR1ajY1bVdsQzY4MFpE?=
 =?utf-8?B?eDhnNHQ1TXhORTk4a21QeDlCLzNvZVdhVEJ6ai9mOGt0WkJTbjVzaHlkUkdr?=
 =?utf-8?B?ZEZxVDVvZW1vZUN1cDlxZzdZUHFoZzBIV2dkRytXUEQ4ck0rbFhYcjhxVVJp?=
 =?utf-8?B?am5MUUcxWkk4V0lTRnVDSG14bkE2aE9NUEVWRitBdVZsT3UvTE5LUE1saEk1?=
 =?utf-8?B?M3g1cG5OR0JqbVRYWlRtRjZuRUdCWWtKWmpMUzV0L0JnUk1YSUZ4bHJlcmt6?=
 =?utf-8?B?czhFZSt2NG1FYWhkbWlLdmkzODZZQkxuM3lwNHRpZlRpMUlTaHRSTDJzOGFY?=
 =?utf-8?B?SXdkSFgxaEY4eDRIQXljWURiQlpPeWhMZHJ6Q0NjUEZkZHdZeHNweGlmSlVQ?=
 =?utf-8?B?ZmdHUnFuQWQ0RDRZak1pRUg0OWExTmlFbUJNSVFrWHJEK0Rkd2hIYlNiTlB0?=
 =?utf-8?B?bzQxYzZHQ1cvOFlYdVArQ1dKSjk2aHNiWThSNWswd0lXZkoyaGJldW5tL0ZZ?=
 =?utf-8?B?MHJRREpSMnhETFVlTkwxUld2QWdNZmZWL0F2UkhRWExPbXJSQTlKZjg0a3I0?=
 =?utf-8?B?L0dqV3llRnp0ZFp6ZjRLTWppNDE3eEd0dHNSQmNuYVhuQ25SMElYV1NjZVgv?=
 =?utf-8?B?NmpNZlF6Vm1WeDQxR2RVdDFvL3FIdEdqU0V0N3FCWEZHZGd6WXJUVyt5aGRM?=
 =?utf-8?B?ak0wMitMcldlUnpZYndFckh2azY0aE1hNTJwdGJiN2lNaEd0ZGdmNzlKeHlU?=
 =?utf-8?B?VWdEUTdYV2NReWU3bVpKZjJrZkdVUklTOUd5S2J2M0U1QzBCRlNmRVoyWmtG?=
 =?utf-8?B?KzB6U3M2OXFVNFRJVmQ4TFhJNFFXakp5ZEF2MG96OU9oazgwVHVLZ1p1LzhP?=
 =?utf-8?B?OFBSeE1kdlQ2eGhrTGk2OG5ZZEU4cW9FOG1iL2lIaFFtWk9lTW50blFCZER1?=
 =?utf-8?B?TkNUVzhPeURNdmxlUmx4UmFzWVRLNU9VVWpyMkp3ZVZOSWZhVXpwUm12WHUz?=
 =?utf-8?B?cmlzeE9ZbXZjaXJkNE5mTDdJbkxHSTdMbFYrOFlzMmRISGlLMXBkVHhuT09O?=
 =?utf-8?B?SHJGd2l1dTFFRk8vYVpLbzJjZGtBLytvTDFQVG92UGZaTXRaU0s0eXhJZEhE?=
 =?utf-8?B?VVdWL2h5UFdWckM3WlZ6OHB6QzJKekl0UCtUdzlPTlNaYmVPTndKZDNBREVE?=
 =?utf-8?B?MDdBcGUxUk85SURwbFBRMG1YSlhXR0RNYURabEpBNVZmQ294SFFMS1EvdEY4?=
 =?utf-8?B?SjE0UTdLVk45eGhsc2ZxZkg0NUZVOHJvekYweVFWK0dZOC9JM1U1NWhFcmpj?=
 =?utf-8?B?Z3pKTXBheGwwRjFsSE1veEx0YXpTemQ1U051Z0t6Z05YUjFaZ2ZyNjJTVHVH?=
 =?utf-8?B?eVZISW51dXk1SGw3Qy9SSzhlc2FvRGJIMjRkejMva05zSUo1akZ0K0IvOWVE?=
 =?utf-8?B?eTkreVBrQkU1UFVCYVJ2VGxoTG8vTklCVngxc0tFd282b0JFNUFybmp6NCtU?=
 =?utf-8?B?UlBla2I1Qk9WN3kzcE1Fa3BPeUtIU2d3blBqUWpmaTVZNXpocHM4a1RsWVdN?=
 =?utf-8?B?VVdKcU5XZS9vK08zNmhlUlZFbGhZZ2d5SEJ5cldheWpEWkZSQ3RBUHJhN3JF?=
 =?utf-8?B?YXR1RzNZYXAzMjkyeHlYNklMZWJTMWkwYmNWV1dYODRYd3Q5NHZpV1ovMWpS?=
 =?utf-8?B?T2JuT1NkcmtQT1NSaEhxRVY0ckI0MVEwZmVWZnMwTW1kQkVtYmh4K2QzREVR?=
 =?utf-8?B?dk0rbk9xUlJXTnNaS0xwejh0UFRDazkrVWtKeENmcVJ0NEo0Q0UvcXJ0ZENl?=
 =?utf-8?B?Y1k1M1g5Umh5aTZUbnIvN3BZdXZjT2psTlhpaWJlMnY4UHdrNlhuK0d3cXNJ?=
 =?utf-8?B?UmFIZ0lJUEFVMTUxcjhSaHdsS3EwN3EybFBQV2F1Uk0xYjRWUFVKdjFvTXor?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?c2tSck9CWjhhTXFra0p5KzdvY056RUFKUTQ5US9DaXNWbnlHbG5hWXVNR1dt?=
 =?utf-8?B?SmZsU0MxeDl2S1M1bzBZa1JDOHdYUWp6S3g5Q2xPSndxYU04c3loUW1rYVN4?=
 =?utf-8?B?MWhjWjdhSUJubXc3RFZoeEV1L1pRK1VJWDZRWEgvZjhaZ1lxUDFIZVBLK01j?=
 =?utf-8?B?NnRwK0JMZ2RCS3hxTmhFYTlqQ0pnc1pFbmRMTStQQzY5RmVWU3J4SVNJcm8r?=
 =?utf-8?B?dlZvRlZ4eGRLbEs4R29sUmhmYUJ3dXBtdlBYZERSM09wSkpnMEhLNHdWb3pJ?=
 =?utf-8?B?M0FKWTgxZERBOTNOMlJDaklhcFA4Zk5ibWpubVU5dncrcFdTUjlXTTh4eG10?=
 =?utf-8?B?ckNaVmpQT0xuOXM1MTJ0QnhpM2lyam9Sem1mclJSekI2MHdWdzFsOU4yTk1F?=
 =?utf-8?B?U0hZRTlwb1k5eE1CVDM2ejVPRHhUaXVzZDlCdjMxUWtUQnVSYnRNZHhNZkxz?=
 =?utf-8?B?a0Q0UkttQ3FHOVdhSlY2N2hFRTV6dWIvYnpoQWRoZFBMZi9udnRtRk5tOTFx?=
 =?utf-8?B?NmtLYmQ5NXRFSmFDbG9JeUt2NG0vdElhYmFwbVBwZzlCQjVsSkdxZWs4RTRk?=
 =?utf-8?B?MWZtYnA2dVhhdlArSmRRY0dCUmEvaDUrSkZZTjkvOXIxWEpDMGhoWm0zelhI?=
 =?utf-8?B?NDhZVEFtd0FrSWx3QTRxbkhUN2FrT3NCbTdLOVJhcDMrU2ttNUs5WXFqZWZX?=
 =?utf-8?B?L25jd1h3WFdGc2RadkN1QVI5ZUEvN0lUNVFMMk1ENDRxR05UNHZ3WHB2VWlW?=
 =?utf-8?B?TjYzTk1veUZqbENoWlgyWWt1cXZmVjA1a1diZVpZNnlHSUtYNk5MY1N1M1Er?=
 =?utf-8?B?OEFvZDJrdE80YldqUC8xMUo3TFR4eWpkOXVjRCtTWlNzdksxckRLN2RhUmMy?=
 =?utf-8?B?a1RHdHA0R1RicTJ3Sy91SEZsRGRlaUFpY1RUQXdZaVh5MVpLZXlkTVpOVkFB?=
 =?utf-8?B?Z2o0eHBJTU1FendoS3VnS2lqY0tQZ0R4OXlUbTlYd2JuZVdOajYzb09Najdp?=
 =?utf-8?B?Y244WWNpVUtLbzlPRWUvSTJseURGT1FLZGxBK1BQbjB3cjlHUXAwRzVYYXll?=
 =?utf-8?B?WGRuU2pKUWJVQ0NaM2h1YTBDMEJuQSt1K0J3cFpadWx6d29WUU5waURUSDFO?=
 =?utf-8?B?TmdROUJXZ2REbXFnVFhQaUtMRUl6ZkUvVmxpbmw0d0xrakNKai9tZ3c2UHo2?=
 =?utf-8?B?Yk9JOGRYK2ZjZTVKT3E4TDExZEpqTmppWU5uOTh2WUFQR0twdnpHdVBjRDZk?=
 =?utf-8?B?WjFESTNxc1k4YlVyTEF4RnFQN2VBUWRDQkFXM2tUYzA4MTlleWRFTUR2eXkz?=
 =?utf-8?Q?IXUBy76SN5R/4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5471fb-f9ba-4cb8-9800-08db77cb652a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 11:32:46.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INeXXiqxW7Ch/4Ol3IJq4r/WsTafqmPD6YgIGUqOQWNkMVGyKVOZHjcuBNi9fcfwFHBMUWiVpzOue3qefXacX/gShwfBJ8bKFlo29seCwDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4955

Hello,

This wasn't a formal discussion point at XenSummit, but Oleksii pointed
out that it was still a problem, hence this thread.

As we take on more architectures, it becomes more and more important for
things to be handled in a mostly-common way.  With that comes quite a
lot of <xen/foo.h> including <asm/foo.h>, and the arch one being a stub
in simple cases.

It would be nice to get rid of the stub files; they're irritating to
deal with, both when refactoring and simply for the file bloat they create.

There are two options which come to mind.

1) Use __has_include().  This would be ideal, but would require us
bumping the minimum GCC version to 4.9.2 as a prerequisite.  I'm not
aware of any way to emulate the necessary behaviour on older toolchains.

2) Have a stub "architecture" which is always last on the include path. 
This would reduce the number of stub files from one set per arch, to
only one set.

Anything else that I've missed?

~Andrew

