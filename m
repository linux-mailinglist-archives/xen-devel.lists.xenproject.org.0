Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F086E6871
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 17:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522979.812676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponTi-0007Ct-FZ; Tue, 18 Apr 2023 15:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522979.812676; Tue, 18 Apr 2023 15:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponTi-0007Ak-CC; Tue, 18 Apr 2023 15:42:46 +0000
Received: by outflank-mailman (input) for mailman id 522979;
 Tue, 18 Apr 2023 15:42:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ponTh-0007Ae-3T
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 15:42:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74b8755-ddff-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 17:42:43 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 11:42:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5677.namprd03.prod.outlook.com (2603:10b6:a03:2dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 15:42:32 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 15:42:31 +0000
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
X-Inumbo-ID: a74b8755-ddff-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681832563;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=QNJaYcfp3uTRR3yCJmGaeDRdpgauMlX3e/Mo3bOiQr0=;
  b=I5KitI+Ip2cmeiOT+WBBY7+NI/VOMO4cQs3+v+G0FSTxE4gpIVydz0dC
   rGxq57u91r9ZPbfeKqAI0bWNIzhAVZag10Ar9+cSjJTEfN3a87sKCBQhq
   KmyqTEzMp6xyo9S6/KfhQxOXwaBxb0aE4S2bxfYTy8QvgqrQ9mXBDdSVy
   Y=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 106384467
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2XdY16rdIxtonwaPuFwtCLnRm/1eBmKcZBIvgKrLsJaIsI4StFCzt
 garIBnVafncZ2v0L4giPovkphgCucDQzoVjHAQ4pCE1ES5G+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzilNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABIcfwGAneWp+rCmEPVNndZ6CMftMrpK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpMT+3kqqA16LGV7lMUDAYSBX6dmsuSkl7gdsgPN
 B0F9yV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcWSDowx
 xm2ltXmLTV1tfueTnf13ryTqDavPykJPCkHbCkNQgYfy8nuppkpiRDCRcolF7S65vX3Ezztx
 zGBrAAlmq4ey8UM0s2T/03Dgj+qjojESEgy/Aq/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpl
 GcAs9iT6qYJF57lqcCWaOAEHbXs6/PbNjTZ2AdrB8N4qGjr/GO/d4dN5j04PF1uLssPZT7uZ
 gnUpB9V45hQenCtaMebfr6MNijj9oC4ffyNaxweRoAmjkRZHONfwBxTWA==
IronPort-HdrOrdr: A9a23:U8uNe6NgzWT0y8BcTvujsMiBIKoaSvp037BN7SxMoH1uHfBw8v
 rEoB1173HJYVoqOU3I++rwWpVoMEm9yXcd2+B4V9qftWLdyQiVxe9ZnOzf6gylNyri9vNMkY
 dMGpIObuEY1GIK6PoSNjPId+od/A==
X-Talos-CUID: 9a23:fdEM723G2EeMaihfC09TbbxfONE0Y37Hy2jqIVLiFUdyWuSxR1mewfYx
X-Talos-MUID: 9a23:uA1Uewq04ti6zMov6iYezw5lMNxss4GIM3ImiYVYltPUKn1hNjjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="106384467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3goudBVEvvF3s4STo5N5Z/xrBZx56IGydA+KTIscPzlKfSePA8p5evZ2+q4kzqnWu4TOtXqIz/Bcc8E5AGF3DeKNjzLPtz1iYxMNP1ByCRFxf2z8FKBbdfBBX4t/GFaIdLHHJaj24dv3cIchiBBfyXtEYJ+6Gv1wkZHqi76KMLJCqF6ojUq0uU+KDk2yWI52QgIo1l6jFVC1Dyv9ptVS7IFYQgxFdXjPXdYrnA7a+qmk1mtLZ1BuJJQMH2oXGJ/KzYTEPN23BwrmxqCSRpp+uOI0yxBbIRJ77rCNpXMehWWQ/co6+rxk4SOqONKZQimUXi8v6FEUMJYf3ZTDr3yBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUnHgYjtSUltMVGFEA0os/QHQZE4foAxTSPRIIYyuQQ=;
 b=J62MtTDUe/c/avRQDCAkuRAsNVlius8NSj1Z+TeMY/9sprFmUnvA7giTrEaoC979tSuw1ql8EKhBCUjwPnU3KYiUbUYTEwyjsL3bztM+fh45T+GTw4P4Yy508aiHIJ5SNOooYAyjOE8MPoReZ3SOcEkP6nsszMsq9utDQ9N3+cWeGjEu5wjNImL3wjvZrKR6k54SsLRc879UGLZWcryszapgsd9Bm1267QlgPpg+sjh5QR5NNx5FKZnM59Gk6e43BVtklFNoakNxvPJJaGNdSPvrBBmaD3OFXneQElRY8WloZyMcG/HgfQplw8AGenMOnEiRXdenE93Y1eSumCGt1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUnHgYjtSUltMVGFEA0os/QHQZE4foAxTSPRIIYyuQQ=;
 b=EgQXFgvpOKI9trPxbqNlT1RHrALnfQgYWMd0hyxQ1Qgs0lm0O5B/ssEDMqG4ivCEpKAnTjgwfvAizYYiZvxCnMfe6fdA/aceJaDtEJyoAul8FQCwUXmiYh/FOWI8FRS9UVWhjui+1wQILipkw7cQZWCCdJVBp8FktFYcnZtIsho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Date: Tue, 18 Apr 2023 17:42:23 +0200
Message-Id: <20230418154223.20181-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: e25a8800-1147-41c1-97b1-08db402385c9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iap20tkaVeEppaor6wwiK43ERKjwk16QfTMHQdzaHxPec60XvjV1Hhh2RfrqWYAx5ik/Ia8mBWxkCOOBE2U2s1j/j8zwCSdSBvZpVpnzWf+YuhvJMW8qOqir5BqXq1j3nXQDjtJmxT2v5l+xGrx0HEvTHfSBi8qSaV3KT4WiefUgW5Y5wp3GwZy962g2JoGWXziOKYR2jXy3MU9SurHUvhn9b+pbMLv2DILNHCMINIpXMctInNV2GwcJ6ZcvNmHCLhli5IIxzcn+E2JtMIgDARDeLOqPb5CoIbW3otb3t/pqoKQ+lC+PG8+J5z4jbzle+OU0GOEZw4oMhBd7OSqkbiui/sgxgJCemOgcumoJnbNfFYRzoM+JoOJVL3EhEJWxeg/GYdJq3vhUPrQg6OhGXJ/tlga6scYSeh+cRwg0jUlIcCCI5uIl59cfR6afygTixZ/7DIDEqPzVWIQCMI+0U1pr2cak/xcFjU4/PA7QgjpgF3tIPkRktTjGBMXKS0/5Od611RF8ZRaQBe5id58zLZkRbSBhopoQMmYRbezUVDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(36756003)(86362001)(2906002)(6486002)(2616005)(6666004)(186003)(83380400001)(6512007)(6506007)(1076003)(26005)(316002)(4326008)(478600001)(66946007)(66556008)(66476007)(6916009)(82960400001)(41300700001)(7416002)(38100700002)(54906003)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnE1cVpWV1R0Qy82UG1Vdk52OXVsUHBJZk00Y0JVY2c0a2Y1eUxFVTUxeENw?=
 =?utf-8?B?NVA2UlRaRHl1N0ZMcGFzWXU2MENYRHBkUG5CZzNlZ1NTMm1jbGN4cE5uaEpB?=
 =?utf-8?B?NEYwOHNheStKU2VjMkJlQjRMSWpVOHAxU3dRZnpsRTlFWjhkaVkveGlmV1FU?=
 =?utf-8?B?RVpWM0ZFVEpDNzBFUnZqSVJzM2hhS3BmczJySnduZmJtZEt5RVRvKzZtb3dn?=
 =?utf-8?B?alQ1dkl4aGY5cEJrOXBHNldNbE04cEw2VS93L1lQTjNsOEQ4cmxpdVJ2ckJD?=
 =?utf-8?B?SDNJWmJxVVBjK3FQMmJvRjdDbzl5dVdUdFNZYjlIVFp4TEM4YlFBZDNobERr?=
 =?utf-8?B?UDFZOWlpb1RjTStrWGdwSjQzajBLcVFKeUY0ZlRrZWMzS1hhUk1ON3FxR01v?=
 =?utf-8?B?ajdmaGVDM09rZHdJdnI5dW0vbVlPcUtscFNFRE9ZZ2pXQmFQMGMyZ0dRTlRZ?=
 =?utf-8?B?aXJvY3EwMWZONU1RZGhtVlVtMUlNMjgzV3RDVkljdDNIUUhWQVlQSHB0SHBV?=
 =?utf-8?B?YS9nckxPSGRabDV1bDRycmRHeEh4bitmMWFoK1NzR0pmOFBMN1pKeUtLS0pj?=
 =?utf-8?B?K2RjaU1UQXBUQzZGNmxQRjFJYkpiTjYwSGxKUlNTUkpaeWtKNGVNTEVwNGJ3?=
 =?utf-8?B?U250Y0RPdUQvV1V2b3IzZHhMdU5hblc4K0ZKYmluU2h4YkZyTndnTUhhYjZI?=
 =?utf-8?B?WGt1V05NM1ZwdUVOUGlDcEZVMVpIV0JScUNxaXMwa0pWVnVhWUZZMHE2STJF?=
 =?utf-8?B?TmFXNmhVUXNSVkhxc1lqczdWa2hNRGhhVGNzdDl5OTFTNUpWaXUzbllDTTBn?=
 =?utf-8?B?MjQ3bnZkcSt5V0VxNHhsUm5UQ0ZyUFVOc1Ara0FzT1pheGh1Vm5CZU53M1VZ?=
 =?utf-8?B?MEwvM2F2UkxMbTU5V2RJdkczVUwwMy9qSmtZb2N1eURhVHFNSHc0UUs0UWEz?=
 =?utf-8?B?N1BnelVxcmhvMlBkanlkd2dRWWUrc0xrRU81WmNmeUhKcXVJOXAyeXk1OERC?=
 =?utf-8?B?Si9hQ1BKSjRnakJ5SFhTaHV6NUNLY3dEcysvbk90a3dpNG8yU2Q1R0dJUk01?=
 =?utf-8?B?aFNiY1ZWNjFHdm9pZTJHNTE3bXFJREo1N1o0V2t0OUp5WEhqZW5DOFJWVG9x?=
 =?utf-8?B?UjFuRE54bUFPak0vUnJiNzRTOU9DR3dmbjI0aXdMaWd0UlgrN2RvRkI2Zkgx?=
 =?utf-8?B?cXRIcWZoWTNEV3EraUtteXBRM2tRTmp0Qm5IV1JZbFh2WHBDOUR6ZkJXQlZn?=
 =?utf-8?B?amcwK2c2Zk9xTnlXNis2Q3pTR25rY2JVNUdSMWVmL1JlWnBUcTBBcCtDbWIv?=
 =?utf-8?B?QWJFNFkyOXdXSEJuVFJ1VzZUTGcwNlQ0bWhLSXFwaE1xUlY5bGR5R1gxWlo5?=
 =?utf-8?B?Q0l4enlqNUpzd3BYK1UzVnFHRlNFbzVHbEZpR3A0cVl5SEZuOTd4R0pQcFRN?=
 =?utf-8?B?L3UvUTRxaGE3S1VFaFlUUUxQbWsrcHN0VGplMUpvcUxPK01PcGNRZUQ0d1BC?=
 =?utf-8?B?eEFmSjN6anNsTE9ZcVdablNNdzUwdWt1RUVBYS96MUVqeEhMZ3VSVFM4d3Bt?=
 =?utf-8?B?VG9ubW04QmV3TmFKdDVpVDBCMWZJSCtzTjVtZ0NhN3BaVEJXUHJKaEFpN0Qx?=
 =?utf-8?B?S2d5N2t6VW55L1gyMjFydVF5T3gwQVVPMDBXamgrYjZHOHRSRDk1RURIeVUx?=
 =?utf-8?B?WmE2UEZ4UGFTUUF5VG52aGU0SlVQclRaalFrWkdkbWh2STdDWUNpT1drdUg1?=
 =?utf-8?B?bmF5Slc1Q21VaEdzT1JuU2ZiMXphZHk2ZlVnTHdxaTg2VVJoeGdBSGh3UHMy?=
 =?utf-8?B?YWNxa0FEM3c3RVpsRkEvb1NBckRHUTlFTkNKR0dzc2RYQ1JPMVp6Q3lkMDdm?=
 =?utf-8?B?dUpiTGFlRFIwcVNJUGlhcm8wSGRoa1RDZTYxS0pDRjlTanNZa3BDcjBZbDEy?=
 =?utf-8?B?NzhpVmNuTXdVK2hHNzhoTHNGM29HZFNTQjl3cTBQd3Q5Rzk3S1hXZFIxSDdN?=
 =?utf-8?B?TjFIbmJhUlYvanY2MlYxd0t1eUpPemJMWHZzYW1vdVJCODRCOVlVd1pINUFs?=
 =?utf-8?B?a0FxWERqYkpaNkthK09hekJhWHhHaExldnN0b3ZGdzJvdkk1bHd5QlhGRTdE?=
 =?utf-8?Q?OuP3oZghW9JyPHiVqjD3pp6zt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+xCC2+DS5whec1F4NXKJBhxTZO+da2oIL43krN+2xablTMgvZYl3acsK6SmABo3oWzQATr4kDhOM0muoFBnLXXLv8kLw6XWiyGtkmTEn5xNP+AKDefoQWr+QItF2QZ3tS4Q6kNWeBexB2tynUBrbtgnOWs748llxcABSVkDFxdgdim/u+sjUvsYSYkL1MwZNBEtq0p1mERKjfTg1T72/eutnPHtzGtop4rLc++i5KXeXyQf46mwNbTspDuwMWL3N0ZjxwFU87IDHEf8lKbu6SWGpWubc3/egjEkAzTP4HKBung4uLkFQfpDyNLq/YNHomWQYz9Jrrc8mujMDWI+b0gFGxcW8r5ujL9sm+MjxjHKw7bhuiax6gCnSD52fpKQL4DOjOYcaeSjQY4LTS/briVQ8rEN84RJxJo6bu51PlhLYM/qWEzXutttulKy/YnRibFcxKhvbiI69UUOZ2/zeVCRLCpW5Q7jMuDDOA3s7J92YmWRj3iT77egzyNjv2GuUMu1G9BCx3LhOlF6NXZBKA7OLPooeD/CCAQ1wtEyVEvhnska0ly6dvLx8FQ//S0y17U9eznombn7E13mGxnflJnH1dizt5opZs3IsHwfA0L9IeG4yV4XJ0V9IPnhtKAr1HUsuT8+ge6ruH5yyCZRfYlx2ncFWa5VPkJX62Ww8D+wUZAbGvoyue8kzk972fDVlrEB56h7PP5Pz5XejHVy7UWrkTMcFoXozD8AU2+XRexnUdMjvANi0T9pPYZHdKRWyVE2qGwYG/rPKaK9APUlGl5A5SNmZ9vsJ2eEy33ViPC5UlhyJMrOtfocYIU3CSKtL6DNpyZFdI9UoaKk0PNxez43RtWejX1Skk3hEpzIxe8kbpXV+650w2iyqQu4HNyGRJsrL17dTDkatdvU7zmP0qYIRphO4qRIhMwXRl6h/JWc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25a8800-1147-41c1-97b1-08db402385c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 15:42:31.8510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4rgbHxv3tz9BTGbMwhZsVbypdrZ+E9PcNKlMpHZpgf5RBX2sPslyEvz9Xxd7/2cSu+wvi1fMFfGP/RPcvmjYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5677

The addition of the flags field in the vcpu_set_singleshot_timer in
505ef3ea8687 is an ABI breakage, as the size of the structure is
increased.

Remove such field addition and drop the implementation of the
VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
value just inject the timer interrupt.

Bump the Xen interface version, and keep the flags field and
VCPU_SSHOTTMR_future available for guests using the old interface.

Note the removal of the field from the vcpu_set_singleshot_timer
struct allows removing the compat translation of the struct.

Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md                    |  2 ++
 xen/common/compat/domain.c      | 18 +++++-------------
 xen/common/domain.c             | 13 ++++++++++---
 xen/include/public/vcpu.h       | 12 +++++++-----
 xen/include/public/xen-compat.h |  2 +-
 xen/include/xlat.lst            |  2 +-
 6 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5dbf8b06d72c..b0d9bf4edbda 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
    cap toolstack provided values.
+ - Remove flags field from vcpu_set_periodic_timer: its introduction was an
+   ABI breakage.
 
 ### Added
  - On x86, support for features new in Intel Sapphire Rapids CPUs:
diff --git a/xen/common/compat/domain.c b/xen/common/compat/domain.c
index c4254905359e..ffc73a9a1dc9 100644
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -16,6 +16,10 @@ EMIT_FILE;
 CHECK_vcpu_set_periodic_timer;
 #undef xen_vcpu_set_periodic_timer
 
+#define xen_vcpu_set_singleshot_timer vcpu_set_singleshot_timer
+CHECK_vcpu_set_singleshot_timer;
+#undef xen_vcpu_set_singleshot_timer
+
 #define xen_vcpu_info vcpu_info
 CHECK_SIZE_(struct, vcpu_info);
 #undef xen_vcpu_info
@@ -97,6 +101,7 @@ int compat_common_vcpu_op(int cmd, struct vcpu *v,
     case VCPUOP_is_up:
     case VCPUOP_set_periodic_timer:
     case VCPUOP_stop_periodic_timer:
+    case VCPUOP_set_singleshot_timer:
     case VCPUOP_stop_singleshot_timer:
     case VCPUOP_register_vcpu_info:
         rc = common_vcpu_op(cmd, v, arg);
@@ -116,19 +121,6 @@ int compat_common_vcpu_op(int cmd, struct vcpu *v,
         break;
     }
 
-    case VCPUOP_set_singleshot_timer:
-    {
-        struct compat_vcpu_set_singleshot_timer cmp;
-        struct vcpu_set_singleshot_timer *nat;
-
-        if ( copy_from_guest(&cmp, arg, 1) )
-            return -EFAULT;
-        nat = COMPAT_ARG_XLAT_VIRT_BASE;
-        XLAT_vcpu_set_singleshot_timer(nat, &cmp);
-        rc = do_vcpu_op(cmd, vcpuid, guest_handle_from_ptr(nat, void));
-        break;
-    }
-
     default:
         rc = -ENOSYS;
         break;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 626debbae095..6a440590fe2a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1762,9 +1762,16 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&set, arg, 1) )
             return -EFAULT;
 
-        if ( (set.flags & VCPU_SSHOTTMR_future) &&
-             (set.timeout_abs_ns < NOW()) )
-            return -ETIME;
+        if ( set.timeout_abs_ns < NOW() )
+        {
+            /*
+             * Simplify the logic if the timeout has already expired and just
+             * inject the event.
+             */
+            stop_timer(&v->singleshot_timer);
+            send_timer_event(v);
+            break;
+        }
 
         migrate_timer(&v->singleshot_timer, smp_processor_id());
         set_timer(&v->singleshot_timer, set.timeout_abs_ns);
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 81a3b3a7438c..6d86a661bd67 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -144,15 +144,17 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_set_periodic_timer_t);
 #define VCPUOP_stop_singleshot_timer 9 /* arg == NULL */
 struct vcpu_set_singleshot_timer {
     uint64_t timeout_abs_ns;   /* Absolute system time value in nanoseconds. */
-    uint32_t flags;            /* VCPU_SSHOTTMR_??? */
+#if __XEN_INTERFACE_VERSION__ < 0x00040f00
+    uint32_t flags;            /* Ignored. */
+#endif
 };
 typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
 
-/* Flags to VCPUOP_set_singleshot_timer. */
- /* Require the timeout to be in the future (return -ETIME if it's passed). */
-#define _VCPU_SSHOTTMR_future (0)
-#define VCPU_SSHOTTMR_future  (1U << _VCPU_SSHOTTMR_future)
+#if __XEN_INTERFACE_VERSION__ < 0x00040f00
+/* Ignored. */
+#define VCPU_SSHOTTMR_future  1
+#endif
 
 /*
  * Register a memory location in the guest address space for the
diff --git a/xen/include/public/xen-compat.h b/xen/include/public/xen-compat.h
index 97fe6984989a..dc43cc9567c0 100644
--- a/xen/include/public/xen-compat.h
+++ b/xen/include/public/xen-compat.h
@@ -10,7 +10,7 @@
 #ifndef __XEN_PUBLIC_XEN_COMPAT_H__
 #define __XEN_PUBLIC_XEN_COMPAT_H__
 
-#define __XEN_LATEST_INTERFACE_VERSION__ 0x00040e00
+#define __XEN_LATEST_INTERFACE_VERSION__ 0x00040f00
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 /* Xen is built with matching headers and implements the latest interface. */
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index d601a8a98421..5463961ce26b 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -168,7 +168,7 @@
 ?	vcpu_register_vcpu_info		vcpu.h
 !	vcpu_runstate_info		vcpu.h
 ?	vcpu_set_periodic_timer		vcpu.h
-!	vcpu_set_singleshot_timer	vcpu.h
+?	vcpu_set_singleshot_timer	vcpu.h
 ?	build_id                        version.h
 ?	compile_info                    version.h
 ?	feature_info                    version.h
-- 
2.40.0


