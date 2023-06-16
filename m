Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29F73320C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550227.859214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9N2-0000xx-4O; Fri, 16 Jun 2023 13:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550227.859214; Fri, 16 Jun 2023 13:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9N1-0000qc-RO; Fri, 16 Jun 2023 13:20:07 +0000
Received: by outflank-mailman (input) for mailman id 550227;
 Fri, 16 Jun 2023 13:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9FQ-0002qy-37
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:12:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6726d063-0c47-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 15:12:12 +0200 (CEST)
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:12:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5736.namprd03.prod.outlook.com (2603:10b6:510:37::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:12:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:12:06 +0000
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
X-Inumbo-ID: 6726d063-0c47-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GZpr78/jfVQj+rN1NN3ev3EOcCzUwsdsDYWFHWDJN/s=;
  b=h+/MITMEn8Bo/ANbwyHFP+JkDrg8jcPijWNtYqQZ8YH3BENX/8gALHrx
   NnG4LXMP8kYeKDzXtGCbiYklgBzUBezKPjmGe7GOGsU9nagmUgpW3yzrx
   uhUXanBpTMWwZJ60RzcW1Gfv83Ovdkky0bl1ivaDCLYs6GmSGEs7OpMkY
   I=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 115608599
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JYSpGa8Rqhy+pGg0Q8DqDrUDpX+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2FKC2qHMv6KMWWjKNokYN619U8H6JbSz9EwSAZl/C08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6kV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkJ1
 t8RIQAVbimnrOS2xouwErZUn+E8eZyD0IM34hmMzBn/JNN+G9X4ZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilAquFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aSw3urBdNDfFG+3sdaoESKyWsKMhA5U0rhr/Plq0C8VusKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHfildSwIAu4PnuNtr0kmJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:0KvKT6xQ0xvfQr8YNi5kKrPw4b1zdoMgy1knxilNoHxuGPBw8P
 re+cjztCWE6gr5N0tNpTntAsa9qBDnhP1ICOsqXItKNTOO0AaVxelZhrcKqAeBJ8SRzIBgPa
 cLSdkFNDXzZ2IK8PoT42ODYqodKMHsytHNuQ9HpU0dNT2DbctbnmBEIzfeKGJabi9cC6E0EZ
 KNj/A33AZJKRwsH6KG7mBuZZm7m+H2
X-Talos-CUID: 9a23:yyI3SWOI9Bxrwe5DHwpE/UckAsAcVlbbzHHpKBfnMX9MV+jA
X-Talos-MUID: 9a23:O+uZHwvtfjYrbeCpos2nvQFCLd5n5L2UBW8LgM8IsZWlOy59AmLI
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="115608599"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DN067OZThGHKGGZBLIdgV4zXVcbDq6oMZNzLDpZK+GKVeP7x6wSuYewZmfkG1GeH87auB7VWXPbDAjqz3u8XnE70ZkRP9f3QXN5Dk1WNP2toA0LiEVrRLoRsSgIydvt7XKGnq5KUjzBeX4rKkDJJ0Z61nt3jySzVBIBj1vNA1kmOpjRR5S9kDZZ+kFXNr5M4Imjw0zUfeHl6ub1KYjuCP2X9Rjji5GQGVWdkNs9S/7DFXH9nPyxE53x0JPK2cBBgBm59reavc2CSC1w/gs0w8iNeh0Ijl+yo8rC+1g7WMeMXBxionwl43FEAThoceDWxgcO8V2YtzSbvHdxpeF94Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwvFq2qizFz52+7Nx4padiTvAhqPe0/kcagVO7qnwS4=;
 b=OvccUVtkToW56nBSp8QUs0Q7X6vtRZ8X0u8lVpzd6EqfAK9paHuSTG3afjSMcwOOO02IKs+NvJFHwS+Q59T7wmXNL0yhuWtCxztXQuP7CJ6cH964vnEag9jvUOTrs32o9k2qd4F7qV4HfiLS7/CKv3oM1g5wdrtuX4p+xJZQPsdvR0+49eUwPMZZ2nf5B4VIJ530RgfYwO2dYFRrtl2KegLCMGKIcqOHj034taXwt3HdzObsqF9TLzUq2WVWp/JiACWLiBNaHj4EKmkZYyiNvDNziYZDCkDn7i4iBvNGRbpX1Lp5vAigqCh0PHdb5ODMbrVZThp0liGeDKQ2B4zahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwvFq2qizFz52+7Nx4padiTvAhqPe0/kcagVO7qnwS4=;
 b=fs2iKz429zldCcmq1nBrft4FIYdxCSi+1eqoHK4Fh+OECeq/qxUlH/SKX55BdQ/oaa6LmW/WGniWVEUmtvLobptqwsbASCevU/yxu1xbBADx8eyWwe1AbQwmyyLVX7iFQU3aa2I0s5w3r1V8hd2orecUm9UEu3wppvypHnKqLFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 12/13] libxl: use the cpuid feature names from cpufeatureset.h
Date: Fri, 16 Jun 2023 15:10:18 +0200
Message-Id: <20230616131019.11476-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 2beee5bc-8fe8-4644-9983-08db6e6b4897
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ignTJg1N/ZrumkJwExQdYs5RgU3qvlhBusqBG/dPxOEYOCl9CvfxF+FHsjze1Hx3kQc+mDAM1nozN2dNTvZdQSJNATFFMuebyFJ8LoszGbRIQgVHjO+PisRdvuJ3PtjKp8+FZzAmto1xsVPgrx03NQLK4p3UIlES4aglC1PECDDupyeF/fxb1H7IX9Gc6kD80OF94IsP0ZXZhHyUw6HmBKAk0soLPVJGh4gjTnZmUF7omDZvK5cBSIzMvrydburmQsoGreeWII9Uz0qk0rdP3RMHHTju9uRrjgVaDKgfdQaqkuFnLpNge0R/mAFmU4Vm6IjmV+1cWT93Szh5i7DW80EfDWiGVish1gLpgeTJiS7a9XFOILYzss0uaTsQC//gyz4Dr46fCAEEi9149HFHNogl5/b7lBvb1LX92lxK+djzSfQkUC2JXt0N2eSjS+LQl002BYALJ1+PSIvDY856f92yqENFuCwJtZ/7pMVYnfLbMu7pDC6KjOV8aS1SCLcIFrUsnfrtrWWI0qVxjOxln/fduTHzM8NTqBMOHpqfH0XIB691h4+ymVn2FHL4L4tVYXxefglXtisSu7giE2GR1Ztawi7tf0lJplEbAd/sOMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(54906003)(41300700001)(8676002)(86362001)(66946007)(66476007)(66556008)(6486002)(6916009)(8936002)(316002)(6666004)(4326008)(36756003)(478600001)(6512007)(30864003)(26005)(5660300002)(83380400001)(6506007)(1076003)(66574015)(2906002)(186003)(82960400001)(38100700002)(2616005)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek92WTNqVURVTmtwVlZwMEJ1TU1uS1Z6QXJ2RUw1TWJFNHREWlg0cGZYL0JF?=
 =?utf-8?B?NW9GNFNwblROWmlQcThXM2F0MURIR3EvYUF2NWFqSytUTVRzZVdaRFN1Yi9P?=
 =?utf-8?B?SFkxZ0hpYmZ5R2wvb0lwQWF3UWEvRGt3NGliU0J1QVZIT1diMHdFZS9LL0ZV?=
 =?utf-8?B?Z2MzRGdPT2p1V1orOWhDbTFkVWhhOFhnNTdPa2VEZTZNWlVWMjY0S01TSlpD?=
 =?utf-8?B?STl5Z083VG1qK0xDaEJDSkFneWhpNlowRXIzU2MvcFdiUVVKeHJ5RHJXSXZB?=
 =?utf-8?B?RVVJT2lGWnVaME9hcklxUW02U21tcTFRZjJhdGx5MjBFSDROaURtZmo4NTAx?=
 =?utf-8?B?NXQvdmJlOXQvcjF2VUovdHFHVWhzcDZkQ2Q2ZkkyTDNmbnRINFdZY2M1NHNM?=
 =?utf-8?B?TFpVMUhnUFNCOWhCcFc0QnloN1Y0c2REaFFlOCtPd1pHS1JXYkVydG1qOEJm?=
 =?utf-8?B?YkRTeVVHVC9sVjYydVZQVnY0NnJkSzN6T0N5aEcrZE03bmJHQUYvOHhTZ2cw?=
 =?utf-8?B?SUJKUkNjbnNJNElGSURHRTB0djZFZStvMkhHbWx3cjN5Y1pFRGJ3WWwyeSti?=
 =?utf-8?B?czhrWkczaTViSGh2R3o3QjY2MXNZWVZKMkRHMXljUHNLT0I2MC9JRC9PRzJl?=
 =?utf-8?B?YWtJZE1VWG9PUXVSc2ZtRjB0eGc2dWRjUnFoWmxsU3BGazZkaU9PYWlVeUpw?=
 =?utf-8?B?S2hGY3BEY2hjeWhuZGNubDI1WTdFTkc2cThFa0o2V2pWQXJIeWszMTVhL3lQ?=
 =?utf-8?B?YW14djJYN3RuemhoMnZxd2F4Mzl3QXk3bkxTbE5KUzBuYThyQlhMcldpOWFp?=
 =?utf-8?B?YnVPZjVmRmMxRXY4TVptKzIzMUFRbC9aNmRNaGxFVDByR1lEUGx2cG9JZmJh?=
 =?utf-8?B?NTZDNGlRc0lXbWtHVFRNTGluOStuMGV5R2hIYkpWWHkwTU42VWt0cWY1bmI4?=
 =?utf-8?B?dGJzdlJzNnk4MmYweGVZQU5sNVptVFpWTzFteTR0dHB2MjBkR0k3aDBncWNM?=
 =?utf-8?B?YmVFYVJuVi9NUlFjWnN4Z2dZeDdMV1Q4dTFjRlJET0h6c0xISkxrK2gvckty?=
 =?utf-8?B?SlZuRVMwYU1GZXBDeitnVU1LL2hnUG1xaSt2dUhRTGxiV09nWTBEV3EyM01J?=
 =?utf-8?B?WkhmaWVLMXpRRTUwazV5VG4vL1ZBL0Q1eU1mWThzeENGbnZKbW1lQU4vTjRE?=
 =?utf-8?B?SWN0UUI1SWQrN0E2dVJ2aVAzV1NhRlJUMXZaSGI4RHFQVEl2UmNpbmFIcUVo?=
 =?utf-8?B?biszOEszYVBZd01SWCt3ck5yeUYwblRQV2F0ZVFFd2tpSjBvTTRqQ3F6Z2xj?=
 =?utf-8?B?aXBnWE1HQWlSODVaOEErTlkva1gySUQ4VFh5aEcyQ2c0UENVWmdSSjhhNVlY?=
 =?utf-8?B?NG8wb1ZBaTFId01KSjFuN1puRmg4MEp4L3RFYVJtWUVuR3pYU1ZzWldNbGkv?=
 =?utf-8?B?UG5iSVllQ3hQL25CT010S0NyQXEyWlU4enI3bmZTS2x0dzJoTjVIbUNMdWZX?=
 =?utf-8?B?NUZocUY4UkFCNFhpUzh0TWMxTEtEOGtjV0xsRzA5K25taHRKbWpGbXM2S2hU?=
 =?utf-8?B?M0xJeVFGa2NrQ1g4SzJUMm5aamVUVGRhWTFLZGNLN2NXWnVjTHZKcEZBUGdr?=
 =?utf-8?B?cEZJcjNNVm90aEQ5RXZOanJCQkhlMDVGNVJVMmM5Uzl5MVBuUkZsM0Fqd1I1?=
 =?utf-8?B?b2Q0cFJsVnZjWTB3Z2lqMGFaTmg1TlBaREp5cEVhcUQ3bzgxd1FyY01ERlhU?=
 =?utf-8?B?VE45THlienZudmVGTk5qN094NnExR1RLZlA0eStqcDNVbmFpcHRaZTZtMDJV?=
 =?utf-8?B?Z2dIQTJuSG1BMTEzK1pFb1R3b2N1QXlnVlVmVUJrWmFCSWVTbDRvRUQxb2tI?=
 =?utf-8?B?ejhpMjZINnZXTFhnUWxwc3VjdEdmWXhZeU1pQnNuOG9UZ0RpMURhb3VWbCtE?=
 =?utf-8?B?MERWNElJcEF2VkpmRURUd0NOMzJ4eEE2Q0VUd2lwalRvRWVhcm4rNXg0NjBq?=
 =?utf-8?B?aVZsMWQyOTd0YXB0SS9wNk54ZkZrUnEvM2VjZ1RUcXJpMWFjZDl4TVN4NTNs?=
 =?utf-8?B?dG0wU1pJc004b01BYy81N1I0QTVGeUZwdStxUm1UN0hiYUhLQk40TXNlV3o1?=
 =?utf-8?B?K3BQOVM3UVI0cTFvTjNrTDdxYUt2bXloQWMzSmxUTDh3bjBiSys5ejc4YXVL?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oq+K7avRGJyFR6axEsxr/UgU+0lJutCEyVuy+iZml9vtIhzk/9w5LZF9syKQIF/WqvIz9tC0GgdyRPqlPOVQwodPKN5rRWgFhdZqUwxz1uttV578pbUXcT/zf6Y0k6MVKcdo3ATEhkVg0NUTJUlSVPUhY4q9IMgl5kdiFnKCTkCOT7B4tL4EN+ACyL8TbapwG3RDZ0ZfmjIda1obNS8N12DAuZ9jhukJOQ8CziZ4DIG94kAyBAJWc3SqN72zy+pE1fVXGT0QurGcOWS+xrNqLi238EAdeOyEwfBNMyL0UzEWdPNLczKX2fYTpox2QN3+QGKQ6d25qMhnG+70a4ztirK7D2lnPybQ9RQPkCZvGC7RjZpk8QZOyC+pOvldpqcUjJsbp/uXe5I4/WtMCrGh5/on0DQiWufXF7W2Vg9d2Bwv7HQWQvSgJadxLMZUAZM65mgGKQz9Bx4+q5p0daFqVdsFViv8ULO+Qv3xOWBidAEYNjH0oUTegRawbLxGaVqP6x2re/0JhEtZ1zKYau4y3zFE+1cHfIOyjKGocVhTMAkhOCnynqbOCF3ULhPKHyxxIowJWxDChHRXxMxaop4ote1fk8XtpdK5BYYe8pUgB4RASs5NbZoQpbEkh7cM4qZ/NLc33zTbimhUXBJY5LZrRGNpIiNBXVbPbutUEaQdXhPKzgBHicFqW287AkvXFaIjGZjLjmxJf0aEcZ/xQKvxNC3oWC/YhKTeJ7Wfj0I6Ly43gsUbSmD35qFvCIW0VLKmgWGfZ/qojpbMXlsRaMTUmDw2xRoPtRzjN8q0B3Kbdv5GqHM2dMI2ryzM4wwfoxG8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beee5bc-8fe8-4644-9983-08db6e6b4897
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:12:06.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMPvi6aEsTEocPlbtHgUmTJCjAEHS0QTR6fBsbEtSQGQisyOd8Px6svwkB65uOHnLHKUUY7GXGFJMVSLaCdYyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5736

The current implementation in libxl_cpuid_parse_config() requires
keeping a list of cpuid feature bits that should be mostly in sync
with the contents of cpufeatureset.h.

Avoid such duplication by using the automatically generated list of
cpuid features in INIT_FEATURE_NAMES in order to map feature names to
featureset bits, and then translate from featureset bits into cpuid
leaf, subleaf, register tuple.

Note that the full contents of the previous cpuid translation table
can't be removed.  That's because some feature names allowed by libxl
are not described in the featuresets, or because naming has diverged
and the previous nomenclature is preserved for compatibility reasons.

Should result in no functional change observed by callers, albeit some
new cpuid features will be available as a result of the change.

While there constify cpuid_flags name field.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - const unnamed structure cast.
 - Declare struct feature_name outside the function.
 - Use strcmp.
 - Fix indentation.
 - Add back missing feature name options.
 - Return ERROR_NOMEM if allocation fails.
 - Improve xl.cfg documentation about how to reference the features
   described in the public header.
---
 docs/man/xl.cfg.5.pod.in       |  24 +--
 tools/libs/light/libxl_cpuid.c | 267 ++++++++++++---------------------
 tools/xl/xl_parse.c            |   3 +
 3 files changed, 107 insertions(+), 187 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3979be2a590a..55161856f4c7 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2010,24 +2010,16 @@ proccount procpkg stepping
 
 =back
 
-List of keys taking a character:
+List of keys taking a character can be found in the public header file
+L<arch-x86/cpufeatureset.h|https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,arch-x86,cpufeatureset.h.html>
 
-=over 4
-
-3dnow 3dnowext 3dnowprefetch abm acpi adx aes altmovcr8 apic arat avx avx2
-avx512-4fmaps avx512-4vnniw avx512bw avx512cd avx512dq avx512er avx512f
-avx512ifma avx512pf avx512vbmi avx512vl bmi1 bmi2 clflushopt clfsh clwb cmov
-cmplegacy cmpxchg16 cmpxchg8 cmt cntxid dca de ds dscpl dtes64 erms est extapic
-f16c ffxsr fma fma4 fpu fsgsbase fxsr hle htt hypervisor ia64 ibs invpcid
-invtsc lahfsahf lm lwp mca mce misalignsse mmx mmxext monitor movbe mpx msr
-mtrr nodeid nx ospke osvw osxsave pae page1gb pat pbe pcid pclmulqdq pdcm
-perfctr_core perfctr_nb pge pku popcnt pse pse36 psn rdrand rdseed rdtscp rtm
-sha skinit smap smep smx ss sse sse2 sse3 sse4.1 sse4.2 sse4_1 sse4_2 sse4a
-ssse3 svm svm_decode svm_lbrv svm_npt svm_nrips svm_pausefilt svm_tscrate
-svm_vmcbclean syscall sysenter tbm tm tm2 topoext tsc tsc-deadline tsc_adjust
-umip vme vmx wdt x2apic xop xsave xtpr
+The feature names described in C<cpufeatureset.h> should be specified in all
+lowercase letters, and with underscores converted to hyphens.  For example in
+order to reference feature C<LAHF_LM> the string C<lahf-lm> should be used.
 
-=back
+Note that C<clflush> is described as an option that takes a value, and that
+takes precedence over the C<clflush> flag in C<cpufeatureset.h>.  The feature
+flag must be referenced as C<clfsh>.
 
 =back
 
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index d0ac5b2bc102..cbbd5d31d63b 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -14,6 +14,8 @@
 
 #include "libxl_internal.h"
 
+#include <xen/lib/x86/cpu-policy.h>
+
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
     return !libxl_cpuid_policy_list_length(pl);
@@ -57,7 +59,7 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *policy)
  * Used for the static structure describing all features.
  */
 struct cpuid_flags {
-    char* name;
+    const char *name;
     uint32_t leaf;
     uint32_t subleaf;
     int reg;
@@ -145,7 +147,19 @@ static int cpuid_add(libxl_cpuid_policy *policy, const struct cpuid_flags *flag,
     entry->policy[flag->reg - 1] = resstr;
 
     return 0;
+}
+
+struct feature_name {
+    const char *name;
+    unsigned int bit;
+};
+
+static int search_feature(const void *a, const void *b)
+{
+    const char *key = a;
+    const char *feat = ((const struct feature_name *)b)->name;
 
+    return strcmp(key, feat);
 }
 
 /* parse a single key=value pair and translate it into the libxc
@@ -168,208 +182,42 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {"proccount",    0x00000001, NA, CPUID_REG_EBX, 16,  8},
         {"localapicid",  0x00000001, NA, CPUID_REG_EBX, 24,  8},
 
-        {"sse3",         0x00000001, NA, CPUID_REG_ECX,  0,  1},
-        {"pclmulqdq",    0x00000001, NA, CPUID_REG_ECX,  1,  1},
-        {"dtes64",       0x00000001, NA, CPUID_REG_ECX,  2,  1},
-        {"monitor",      0x00000001, NA, CPUID_REG_ECX,  3,  1},
-        {"dscpl",        0x00000001, NA, CPUID_REG_ECX,  4,  1},
-        {"vmx",          0x00000001, NA, CPUID_REG_ECX,  5,  1},
-        {"smx",          0x00000001, NA, CPUID_REG_ECX,  6,  1},
         {"est",          0x00000001, NA, CPUID_REG_ECX,  7,  1},
-        {"tm2",          0x00000001, NA, CPUID_REG_ECX,  8,  1},
-        {"ssse3",        0x00000001, NA, CPUID_REG_ECX,  9,  1},
         {"cntxid",       0x00000001, NA, CPUID_REG_ECX, 10,  1},
-        {"fma",          0x00000001, NA, CPUID_REG_ECX, 12,  1},
         {"cmpxchg16",    0x00000001, NA, CPUID_REG_ECX, 13,  1},
-        {"xtpr",         0x00000001, NA, CPUID_REG_ECX, 14,  1},
-        {"pdcm",         0x00000001, NA, CPUID_REG_ECX, 15,  1},
-        {"pcid",         0x00000001, NA, CPUID_REG_ECX, 17,  1},
-        {"dca",          0x00000001, NA, CPUID_REG_ECX, 18,  1},
         /* Linux uses sse4_{1,2}.  Keep sse4.{1,2} for compatibility */
         {"sse4_1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
         {"sse4.1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
         {"sse4_2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
         {"sse4.2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
-        {"x2apic",       0x00000001, NA, CPUID_REG_ECX, 21,  1},
-        {"movbe",        0x00000001, NA, CPUID_REG_ECX, 22,  1},
-        {"popcnt",       0x00000001, NA, CPUID_REG_ECX, 23,  1},
-        {"tsc-deadline", 0x00000001, NA, CPUID_REG_ECX, 24,  1},
         {"aes",          0x00000001, NA, CPUID_REG_ECX, 25,  1},
-        {"xsave",        0x00000001, NA, CPUID_REG_ECX, 26,  1},
-        {"osxsave",      0x00000001, NA, CPUID_REG_ECX, 27,  1},
-        {"avx",          0x00000001, NA, CPUID_REG_ECX, 28,  1},
-        {"f16c",         0x00000001, NA, CPUID_REG_ECX, 29,  1},
-        {"rdrand",       0x00000001, NA, CPUID_REG_ECX, 30,  1},
-        {"hypervisor",   0x00000001, NA, CPUID_REG_ECX, 31,  1},
-
-        {"fpu",          0x00000001, NA, CPUID_REG_EDX,  0,  1},
-        {"vme",          0x00000001, NA, CPUID_REG_EDX,  1,  1},
-        {"de",           0x00000001, NA, CPUID_REG_EDX,  2,  1},
-        {"pse",          0x00000001, NA, CPUID_REG_EDX,  3,  1},
-        {"tsc",          0x00000001, NA, CPUID_REG_EDX,  4,  1},
-        {"msr",          0x00000001, NA, CPUID_REG_EDX,  5,  1},
-        {"pae",          0x00000001, NA, CPUID_REG_EDX,  6,  1},
-        {"mce",          0x00000001, NA, CPUID_REG_EDX,  7,  1},
+
         {"cmpxchg8",     0x00000001, NA, CPUID_REG_EDX,  8,  1},
-        {"apic",         0x00000001, NA, CPUID_REG_EDX,  9,  1},
         {"sysenter",     0x00000001, NA, CPUID_REG_EDX, 11,  1},
-        {"mtrr",         0x00000001, NA, CPUID_REG_EDX, 12,  1},
-        {"pge",          0x00000001, NA, CPUID_REG_EDX, 13,  1},
-        {"mca",          0x00000001, NA, CPUID_REG_EDX, 14,  1},
-        {"cmov",         0x00000001, NA, CPUID_REG_EDX, 15,  1},
-        {"pat",          0x00000001, NA, CPUID_REG_EDX, 16,  1},
-        {"pse36",        0x00000001, NA, CPUID_REG_EDX, 17,  1},
         {"psn",          0x00000001, NA, CPUID_REG_EDX, 18,  1},
         {"clfsh",        0x00000001, NA, CPUID_REG_EDX, 19,  1},
-        {"ds",           0x00000001, NA, CPUID_REG_EDX, 21,  1},
-        {"acpi",         0x00000001, NA, CPUID_REG_EDX, 22,  1},
-        {"mmx",          0x00000001, NA, CPUID_REG_EDX, 23,  1},
-        {"fxsr",         0x00000001, NA, CPUID_REG_EDX, 24,  1},
-        {"sse",          0x00000001, NA, CPUID_REG_EDX, 25,  1},
-        {"sse2",         0x00000001, NA, CPUID_REG_EDX, 26,  1},
-        {"ss",           0x00000001, NA, CPUID_REG_EDX, 27,  1},
-        {"htt",          0x00000001, NA, CPUID_REG_EDX, 28,  1},
         {"tm",           0x00000001, NA, CPUID_REG_EDX, 29,  1},
         {"ia64",         0x00000001, NA, CPUID_REG_EDX, 30,  1},
         {"pbe",          0x00000001, NA, CPUID_REG_EDX, 31,  1},
 
         {"arat",         0x00000006, NA, CPUID_REG_EAX,  2,  1},
 
-        {"fsgsbase",     0x00000007,  0, CPUID_REG_EBX,  0,  1},
         {"tsc_adjust",   0x00000007,  0, CPUID_REG_EBX,  1,  1},
-        {"bmi1",         0x00000007,  0, CPUID_REG_EBX,  3,  1},
-        {"hle",          0x00000007,  0, CPUID_REG_EBX,  4,  1},
-        {"avx2",         0x00000007,  0, CPUID_REG_EBX,  5,  1},
-        {"smep",         0x00000007,  0, CPUID_REG_EBX,  7,  1},
-        {"bmi2",         0x00000007,  0, CPUID_REG_EBX,  8,  1},
-        {"erms",         0x00000007,  0, CPUID_REG_EBX,  9,  1},
-        {"invpcid",      0x00000007,  0, CPUID_REG_EBX, 10,  1},
-        {"rtm",          0x00000007,  0, CPUID_REG_EBX, 11,  1},
         {"cmt",          0x00000007,  0, CPUID_REG_EBX, 12,  1},
-        {"mpx",          0x00000007,  0, CPUID_REG_EBX, 14,  1},
-        {"avx512f",      0x00000007,  0, CPUID_REG_EBX, 16,  1},
-        {"avx512dq",     0x00000007,  0, CPUID_REG_EBX, 17,  1},
-        {"rdseed",       0x00000007,  0, CPUID_REG_EBX, 18,  1},
-        {"adx",          0x00000007,  0, CPUID_REG_EBX, 19,  1},
-        {"smap",         0x00000007,  0, CPUID_REG_EBX, 20,  1},
-        {"avx512-ifma",  0x00000007,  0, CPUID_REG_EBX, 21,  1},
-        {"clflushopt",   0x00000007,  0, CPUID_REG_EBX, 23,  1},
-        {"clwb",         0x00000007,  0, CPUID_REG_EBX, 24,  1},
-        {"proc-trace",   0x00000007,  0, CPUID_REG_EBX, 25,  1},
-        {"avx512pf",     0x00000007,  0, CPUID_REG_EBX, 26,  1},
-        {"avx512er",     0x00000007,  0, CPUID_REG_EBX, 27,  1},
-        {"avx512cd",     0x00000007,  0, CPUID_REG_EBX, 28,  1},
-        {"sha",          0x00000007,  0, CPUID_REG_EBX, 29,  1},
-        {"avx512bw",     0x00000007,  0, CPUID_REG_EBX, 30,  1},
-        {"avx512vl",     0x00000007,  0, CPUID_REG_EBX, 31,  1},
-
-        {"prefetchwt1",  0x00000007,  0, CPUID_REG_ECX,  0,  1},
-        {"avx512-vbmi",  0x00000007,  0, CPUID_REG_ECX,  1,  1},
-        {"umip",         0x00000007,  0, CPUID_REG_ECX,  2,  1},
-        {"pku",          0x00000007,  0, CPUID_REG_ECX,  3,  1},
-        {"ospke",        0x00000007,  0, CPUID_REG_ECX,  4,  1},
-        {"avx512-vbmi2", 0x00000007,  0, CPUID_REG_ECX,  6,  1},
-        {"cet-ss",       0x00000007,  0, CPUID_REG_ECX,  7,  1},
-        {"gfni",         0x00000007,  0, CPUID_REG_ECX,  8,  1},
-        {"vaes",         0x00000007,  0, CPUID_REG_ECX,  9,  1},
-        {"vpclmulqdq",   0x00000007,  0, CPUID_REG_ECX, 10,  1},
-        {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
-        {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
-        {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
-        {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
-        {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
-        {"pks",          0x00000007,  0, CPUID_REG_ECX, 31,  1},
-
-        {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
-        {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
-        {"fsrm",         0x00000007,  0, CPUID_REG_EDX,  4,  1},
-        {"avx512-vp2intersect",0x00000007,0,CPUID_REG_EDX,8, 1},
-        {"srbds-ctrl",   0x00000007,  0, CPUID_REG_EDX,  9,  1},
-        {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
-        {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
-        {"tsxldtrk",     0x00000007,  0, CPUID_REG_EDX, 16,  1},
-        {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
-        {"avx512-fp16",  0x00000007,  0, CPUID_REG_EDX, 23,  1},
-        {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
-        {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
-        {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
-        {"arch-caps",    0x00000007,  0, CPUID_REG_EDX, 29,  1},
-        {"core-caps",    0x00000007,  0, CPUID_REG_EDX, 30,  1},
-        {"ssbd",         0x00000007,  0, CPUID_REG_EDX, 31,  1},
-
-        {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
-        {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
-        {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
-        {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
-        {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
-        {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
-        {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
-
-        {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
-        {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
-        {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
-
-        {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
-        {"ipred-ctrl",   0x00000007,  2, CPUID_REG_EDX,  1,  1},
-        {"rrsba-ctrl",   0x00000007,  2, CPUID_REG_EDX,  2,  1},
-        {"ddp-ctrl",     0x00000007,  2, CPUID_REG_EDX,  3,  1},
-        {"bhi-ctrl",     0x00000007,  2, CPUID_REG_EDX,  4,  1},
-        {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
-        {"svm",          0x80000001, NA, CPUID_REG_ECX,  2,  1},
-        {"extapic",      0x80000001, NA, CPUID_REG_ECX,  3,  1},
         {"altmovcr8",    0x80000001, NA, CPUID_REG_ECX,  4,  1},
-        {"abm",          0x80000001, NA, CPUID_REG_ECX,  5,  1},
-        {"sse4a",        0x80000001, NA, CPUID_REG_ECX,  6,  1},
-        {"misalignsse",  0x80000001, NA, CPUID_REG_ECX,  7,  1},
-        {"3dnowprefetch",0x80000001, NA, CPUID_REG_ECX,  8,  1},
-        {"osvw",         0x80000001, NA, CPUID_REG_ECX,  9,  1},
-        {"ibs",          0x80000001, NA, CPUID_REG_ECX, 10,  1},
-        {"xop",          0x80000001, NA, CPUID_REG_ECX, 11,  1},
-        {"skinit",       0x80000001, NA, CPUID_REG_ECX, 12,  1},
-        {"wdt",          0x80000001, NA, CPUID_REG_ECX, 13,  1},
-        {"lwp",          0x80000001, NA, CPUID_REG_ECX, 15,  1},
-        {"fma4",         0x80000001, NA, CPUID_REG_ECX, 16,  1},
         {"nodeid",       0x80000001, NA, CPUID_REG_ECX, 19,  1},
-        {"tbm",          0x80000001, NA, CPUID_REG_ECX, 21,  1},
-        {"topoext",      0x80000001, NA, CPUID_REG_ECX, 22,  1},
         {"perfctr_core", 0x80000001, NA, CPUID_REG_ECX, 23,  1},
         {"perfctr_nb",   0x80000001, NA, CPUID_REG_ECX, 24,  1},
 
-        {"syscall",      0x80000001, NA, CPUID_REG_EDX, 11,  1},
-        {"nx",           0x80000001, NA, CPUID_REG_EDX, 20,  1},
-        {"mmxext",       0x80000001, NA, CPUID_REG_EDX, 22,  1},
-        {"ffxsr",        0x80000001, NA, CPUID_REG_EDX, 25,  1},
-        {"page1gb",      0x80000001, NA, CPUID_REG_EDX, 26,  1},
-        {"rdtscp",       0x80000001, NA, CPUID_REG_EDX, 27,  1},
-        {"lm",           0x80000001, NA, CPUID_REG_EDX, 29,  1},
-        {"3dnowext",     0x80000001, NA, CPUID_REG_EDX, 30,  1},
-        {"3dnow",        0x80000001, NA, CPUID_REG_EDX, 31,  1},
-
         {"procpkg",      0x00000004,  0, CPUID_REG_EAX, 26,  6},
 
         {"invtsc",       0x80000007, NA, CPUID_REG_EDX,  8,  1},
 
-        {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
-        {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
-        {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
-        {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
-        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
-        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
-        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
-        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
-        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
-        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
-        {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
-        {"amd-ssbd",     0x80000008, NA, CPUID_REG_EBX, 24,  1},
-        {"virt-ssbd",    0x80000008, NA, CPUID_REG_EBX, 25,  1},
-        {"ssb-no",       0x80000008, NA, CPUID_REG_EBX, 26,  1},
-        {"psfd",         0x80000008, NA, CPUID_REG_EBX, 28,  1},
         {"btc-no",       0x80000008, NA, CPUID_REG_EBX, 29,  1},
-        {"ibpb-ret",     0x80000008, NA, CPUID_REG_EBX, 30,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
         {"apicidsize",   0x80000008, NA, CPUID_REG_ECX, 12,  4},
@@ -383,17 +231,63 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {"svm_pausefilt",0x8000000a, NA, CPUID_REG_EDX, 10,  1},
 
         {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
-        {"nscb",         0x80000021, NA, CPUID_REG_EAX,  6,  1},
-        {"auto-ibrs",    0x80000021, NA, CPUID_REG_EAX,  8,  1},
-        {"cpuid-user-dis", 0x80000021, NA, CPUID_REG_EAX, 17, 1},
 
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
 
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
+    static const struct feature_name features[] = INIT_FEATURE_NAMES;
+    /*
+     * NB: if we switch to using a cpu_policy derived object instead of a
+     * libxl_cpuid_policy_list we could get rid of the featureset -> cpuid leaf
+     * conversion table and use a featureset directly as we have conversions
+     * to/from featureset and cpu_policy.
+     */
+    static const struct {
+        enum { FEAT_CPUID, FEAT_MSR } type;
+        union {
+            struct {
+                uint32_t leaf, subleaf;
+                unsigned int reg;
+            } cpuid;
+            struct {
+                uint32_t index;
+                unsigned int reg;
+            } msr;
+        };
+    } feature_to_policy[] = {
+#define CPUID_ENTRY(l, s, r) \
+    { .type = FEAT_CPUID, .cpuid.leaf = l, .cpuid.subleaf = s, .cpuid.reg = r }
+#define MSR_ENTRY(i, r) \
+    { .type = FEAT_MSR, .msr.index = i, .msr.reg = r }
+        CPUID_ENTRY(0x00000001, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000001, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x80000001, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x80000001, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x0000000D,  1, CPUID_REG_EAX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_ECX),
+        CPUID_ENTRY(0x80000007, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x80000008, NA, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EAX),
+        CPUID_ENTRY(0x80000021, NA, CPUID_REG_EAX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  2, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_ECX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
+        MSR_ENTRY(0x10a, CPUID_REG_EAX),
+        MSR_ENTRY(0x10a, CPUID_REG_EDX),
+#undef MSR_ENTRY
+#undef CPUID_ENTRY
+    };
 #undef NA
     const char *sep, *val;
+    char *name;
     const struct cpuid_flags *flag;
+    const struct feature_name *feat;
+
+    BUILD_BUG_ON(ARRAY_SIZE(feature_to_policy) != FEATURESET_NR_ENTRIES);
 
     sep = strchr(str, '=');
     if (sep == NULL) {
@@ -406,6 +300,37 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
             return cpuid_add(policy, flag, val);
     }
 
+    /* Provide a NUL terminated feature name to the search helper. */
+    name = strndup(str, sep - str);
+    if (name == NULL)
+        return ERROR_NOMEM;
+
+    feat = bsearch(name, features, ARRAY_SIZE(features), sizeof(features[0]),
+                   search_feature);
+    free(name);
+
+    if (feat == NULL)
+        return 2;
+
+    switch (feature_to_policy[feat->bit / 32].type) {
+    case FEAT_CPUID:
+    {
+        struct cpuid_flags f;
+
+        f.name = feat->name;
+        f.leaf = feature_to_policy[feat->bit / 32].cpuid.leaf;
+        f.subleaf = feature_to_policy[feat->bit / 32].cpuid.subleaf;
+        f.reg = feature_to_policy[feat->bit / 32].cpuid.reg;
+        f.bit = feat->bit % 32;
+        f.length = 1;
+
+        return cpuid_add(policy, &f, val);
+    }
+
+    case FEAT_MSR:
+        return 2;
+    }
+
     return 2;
 }
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index f036e56fc239..7bf587455d08 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2620,6 +2620,9 @@ skip_usbdev:
                 case 3:
                     errstr = "illegal CPUID value (must be: [0|1|x|k|s])";
                     break;
+                case ERROR_NOMEM:
+                    errstr = "out of memory";
+                    break;
                 default:
                     errstr = "unknown error";
                     break;
-- 
2.40.0


