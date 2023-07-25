Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F033076194B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569669.890574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkL-0004Dv-Eb; Tue, 25 Jul 2023 13:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569669.890574; Tue, 25 Jul 2023 13:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkL-0004C1-Aj; Tue, 25 Jul 2023 13:06:37 +0000
Received: by outflank-mailman (input) for mailman id 569669;
 Tue, 25 Jul 2023 13:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOHkK-0004BN-5j
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:06:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6341ec4-2aeb-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 15:05:44 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:06:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:06:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:06:13 +0000
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
X-Inumbo-ID: f6341ec4-2aeb-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690290393;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=rfePr69IWK0mWEXIQo+D3kzuJGWGZb68XMqpUFQEXd8=;
  b=bCY0oXftMsuNmhXoWyIL5kulJcEQomBlq881dmHei6ie2E/SaCVJZHEl
   sLEB14NndzYqAGswRkWHiwb3aM3H1hhEmPUOErndzzzXp2k/UfnqBGxAr
   1BE1JF7QMzgYnNh87vhdEGb4v3uCGm2zgAR16Xt2zHGuLYtzghFr7f1Tp
   k=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 119981262
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MTlLTazq1CXm3jXC2m56t+cQxyrEfRIJ4+MujC+fZmUNrF6WrkVWy
 WsbDW6PbveCYmH0Koh0PY/no0pV7JPWztRhGwU9rCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP60T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUtg2
 No5AjILVB+CmMSfwZiGCa5vhu12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMouFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aezHOiAtxIfFG+3qRbw1ew+3xQMj0TCQW/m/+fmFW4CvsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHbihdSwIAuoDnuNtq0UuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNT5D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:gc51laBawyfUB7TlHejpsceALOsnbusQ8zAXPiFKOGlom6mj/K
 6TdZsgtSMc9wxhJE3I9ergBEDiewKuyXcK2/hyAV7KZmCP0ldAR7sSjrcKrQeQfhEX/YZmpN
 hdm8AVMrHN5TMRt6nHCMbTKbsd6ejCyYTtodr3i05qSwQCUdAT0++6YDzrbHGfgGN9dOoE/F
 /33Ls3m9PaQwVyUu2LQkMdWvTFpZnijYuOW29+OzcXrDOWiC+u6vrQDxic034lIk5y6IZny3
 HBjwv6ooKqt/3T8G6660bjq65OncfnyJ9kGsuBkaEuW1PRozftXp1lR7qB+AoUjYiUmS4Xue
 iJmQ4kI8Nwr0ncZX64ujzk3wWI6kdU11bSjWWAhGflo4jHSCkhC8xH7LgpCCfk1w==
X-Talos-CUID: 9a23:ZsTcjm9S/GSACTTnZXWVv2Q6N+YEWH/b9njRPGmRCExUC/qWSXbFrQ==
X-Talos-MUID: 9a23:aSYqCAsyW7EcHtLaZs2n3gAhPuRV8+eUKEVRz5E8ve+WLiohEmLI
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="119981262"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0deDAX7/86042r7eURrgTu9cN3kwmGMaSNe1pi0YDhQSE2Os1VvuHpiHD/++7dQ2jklmNst0Fi3nRFo4le+VTaHkYs+fy64VIY9ah5uGISwHOJyCVqBx5hgpjLYBYjRBQF53obM/zV+6fW4CAgAYzudTVgtDPHpvoZWoV7KmYZ3fGra4Gy/LUNjBniJBH3rZ9mahEr89lAMiNp72GsEeNZN1n6uxabGQvJ78oq3sAYrYD8lAp6q7mwMQ9w3Q2ip88mk0tpD3XApDPMbb9BsVVKNTCR99COBgdh4N4C70UaYjCwbxORv09N/siOL/tQ7Am+HTtJdVsiKXjRiR6I8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3D+sCBu93lJN8h/uBwTlirz+UK81IB9FCSryAPCYQ8=;
 b=EAqbgicPNbA03HPFPskRIKf8T/8csDo1dwyx8SjzAVP5zPxevF/sbJvHdNk+QqIIOIvYFnuKwypsX6ZhpIyZ4KFewfZ/ypjR1/t2QgaE8PKldv9UBw2KHFJY8WVyYA6bnKui8QBIoB2OwfK1oo2kUO1dbFb280FsH+FM1EzdZzuTa7+vckPFgwt4pW+XJvuneiF6PcnK5s+QqFdFA/R5KMKkbvXzhlGxtI5GEwSzqDsJIjIeUrABR62orHdUAc0Hv1r+3Pnm73gdNbHSQ2PdVteCpJENNrUkWIXPYM09rNqV9Zu6dm/RI8l8nxk7odFVF59yGFq6eqptUX4YDqVA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3D+sCBu93lJN8h/uBwTlirz+UK81IB9FCSryAPCYQ8=;
 b=WGGFj4mt6PuSahHWZEr8dluYx/0luO2L0OBnkxEBYqmjfcbG7/z0d0MemcS5E8kfH5oeQ4EfgHdN6pjSYYuH6WXwZ7Z8/adRJnPI92J56xNR6Rz9UQ3Ejb3uyjZKUYvaVbA1kwQbAJX0DSCd7m29vn0LjwbRsB3aFqW/i2xFceM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/6] lib{xc,xl}: support for guest MSR features
Date: Tue, 25 Jul 2023 15:05:52 +0200
Message-ID: <20230725130558.58094-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::26) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 159917cb-0db4-42a2-41ae-08db8d0fec38
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dS0uPNeTcqWTODkM9tq8AytH1SLWqqsmKThGGnvhqLp6cHfnfpsGcbVfTLaelcVDzq0s2On43WkkXppZ8KX7oqzIm4OSvDdcvq8c4rZGkPKEZmeb7wmSVDVEH3DphJooKaagSmo0zTbN0ViaeefTpb82fGoqGeg1vSbPLECR9KPWQ73d0zQTSAoXXLnmqw2wdigEKhS/Xkt2WTcIb7SVMd/7TGOEYhi1d52skmuh9KHVxblkOpTAVAQbZpCTd0PyOR61yvuzB2qd65EWcJNc73N+i/yvY6RErGjA1Dj4DoPWRWVj7Zi/uJoGKywCYeaHptBlBv42I8BUjAx/+EeMeuSQp8oGIqqBcXPdk6u8FywzQYXjgIOv2baow01jRw0CoAPEbo9OBI3oDo3kVB+sjRIyoUod6odgm/htkBBu2k9ExjGfQclUYPrwimLjHoGeGZKyZqO0/eCkvnVnSmYPUw2WEeAZb9J/rq+JqSX2EvB/CFD6qv5y1yYBHhFMGFJ4nQDHlM0kZWofXTLSiYlDQJwEuh7nrdsZOKW1vJz9l6gMN9gdCOVL6J2cIjz0acLO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(82960400001)(478600001)(83380400001)(8936002)(1076003)(26005)(6512007)(6506007)(66946007)(38100700002)(66556008)(54906003)(6916009)(4326008)(66476007)(186003)(2616005)(5660300002)(8676002)(2906002)(316002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDhXTHMzMlFDTnZSZVdFSHlwbnR3ZkR3ZjBwUkdyT3M5TFcwaTdyZEhpUHA4?=
 =?utf-8?B?WXh2TjRDa1QydC9hOG1MNDNIMVZzQTB3ZVk3VUxFdXh2YlpHWWxaVlFFZ0Fv?=
 =?utf-8?B?cFRKYXBFUjAycmhzYktIbTZyb2dzbVErZTdhbVVSdUFaaG83Wm9zWFgxQ0o0?=
 =?utf-8?B?Q0o5M2JGMzBJTDVxbFFaREFyekcrUjY3Mi8wWGdRbWE1M1FRbzUzb3c4L2lF?=
 =?utf-8?B?MnhJYzFaaFFVNDNhS0FRRjFXS1ExdlBjTUdmMnBQeTNLTm50ejRPUmJBM0pK?=
 =?utf-8?B?WEwva1lXdlp4RFhvQmtiVENFTWtmSGhSK3hPai9ZVHk2dlltL0YwQnpDdzh1?=
 =?utf-8?B?T0pQREFjMGpqMDNGUjgyS1dQYXV4Z3EwQXFmQ3BKVEZZSEQ4UzB6QVd4ZzFG?=
 =?utf-8?B?NmZMY3J1NyszTnhJRnhIYkd6bmJ3bjJQM0UwQVpDdCtoVFA3T09LLzRHbjBv?=
 =?utf-8?B?NjJnWmtjS2puL20zeUhWKzdEaHRXWDFCMUdFeG9TcWEyYlgxS05RQTBZMktv?=
 =?utf-8?B?N2RNblRTSlFrWFh2cTRQV09USTZudmU5Um5qOXVFUU5IUUIzOGlOajFGdURm?=
 =?utf-8?B?NWFCWGJvK0NnVTFmazFJYVAzSVVuakZWVlpGWmFRdHhLVjRvaWMzamcrdU9r?=
 =?utf-8?B?NmEvajA5SEZ4U3pMZ2RiTy9kUFU1b091dUFKbDFvbldVMjdRUUcxUDQrWGFi?=
 =?utf-8?B?VXgxZDJEcWtuQkQ4M29JL05yYThsZ3gyMnJyYnI3eE1Zd1MvOENJSTAwNWVS?=
 =?utf-8?B?NWlyeDRDYU9UM3ZReEtSTTY3VUluQkx5T0JmajR6Y2RnbVhSQmNoenI3QkFW?=
 =?utf-8?B?NzA1b0xrcytnR3N2TjNZYmt1Wk1lWE14VzJXVldmMkRBTjNTVEhIT2JnenYy?=
 =?utf-8?B?cTVOd0VUVi9VTnEzR0VZNzZvUS9uTzVVQ2ZqQldkWE8xWm5WcnkwNFRiRlpD?=
 =?utf-8?B?eERERXJsNHdHU2M0bTR3Nm5PSVJVTDNnOUllbHV0WGdrR09pZ25pU2M5clFS?=
 =?utf-8?B?amhkRFE2T2Q0ZzZWL0xBd0ROTEJRZTFkRXFrNy9aS1p2eHBUQ2kwSkl1N2RP?=
 =?utf-8?B?Nk9hay8zeit0OEszdk5EYU5SclNuSlVVVE14cTc4cUpFTnVSWnczWDVUUVBt?=
 =?utf-8?B?MVYrb0g3enlQYm11MUREVTByV3JycXljZ1dEUkxFWElsL0VEYmNjU2pZU3pN?=
 =?utf-8?B?WHJVeW1Da0htZ3ZWVytldjdqWHloQmFyNG1OV0RBOHlmWXN2dUZFQ2xMNDh1?=
 =?utf-8?B?bFJ0RTAwcXpiNlFlWW5TVVR2RHFIU1V3cTVIM1NFWVBNeHpwTStmQ1pRdWRB?=
 =?utf-8?B?WU1JYnZHZzVoWlNQM003MW5ZWlllQUhiaVc3NEUwSU56Z1B4UU4xRWEyOHBy?=
 =?utf-8?B?N2Y3T3VRNWc3WEd4MGV1Z0R1WCszTHRaWnlBdldnemJNR2F1ZW1VeUJmZHZP?=
 =?utf-8?B?WnEzeE5Ha2V6QU93UzBiMEUwOFNzU0loRXdlS0ZpeGZMeDREVnNGcURnczBx?=
 =?utf-8?B?NTNBaHh3bStFTVQ2RHZ0Z2tYTzE5d0lRbVJRdVMwbjdyNVMrb1dQMjFHY2Jh?=
 =?utf-8?B?cFI3NDlrQlZDeTZqcGhWOWo5aWZtL2w5VDVUeUc0dXAvdnoxRit1UjcxQXFj?=
 =?utf-8?B?b3RsaEM0OTJpY0wrVFdsWUtWWGtlRFJCNVAwZmFMRkhQWkV5Zmg2M1NDZzVu?=
 =?utf-8?B?ak5JMWJRRGwzTkY2THdiOGdkd3BmakZEeG1qUnU3NmFmQlJYb0N4SjJQUEFC?=
 =?utf-8?B?ZEN5UWNVTDVjblE2c2NPL1NHUFNaTHpTT1RnSjFFZ2lCakZtSmZjZ1pEb2U2?=
 =?utf-8?B?bkNpaVpvZlVIT2Q1dERqVCtXT1oyVlA3UWJIV2pzcjhwd1VJNDl2Wm5iSWRp?=
 =?utf-8?B?bnRuRVBWL1hvRVlob3JIK09XNHMyREJEQjE5d1R3OUxuYTRTcUZRemlOZ0do?=
 =?utf-8?B?Z0RQM2tIWDhWUG5yeE5OYmZHZ1VaZ05tZWdLR3RvcFdOZWhUSGxNaGpSZFhq?=
 =?utf-8?B?L1dKUVNhekhHRXMzMkNBWVdkL3pzN0UrWHFFUFNIZldnUENoeFh2c3lHbkpR?=
 =?utf-8?B?OXpaTm56L21VRGxteDJDRmlPbGpYaUg1YkwzQUI0UFJPK3FIU3dzSy9yMVg2?=
 =?utf-8?B?VmpKRVcrdlNlc2hGVHpZK0xNcXhRZURWd2NxajBCZUdrL0VjUFRBSDUyMmZh?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iORoeMOCo6kf+aIlRX1LgyaaKyK6NyFM6gSHhDST5v6q2h2102ZS3v6qv89uYUH0exzxbmJKnxJF2y/IHB14HmtlmIP7xWv41ZlNnh0/Mm6BHzIQtD174TXZjF6kFeLQU/DgUEeJcLkYi8gJYhL75Ym3jW7fk6Sp7QsJ7bvF0Sz795gsZvdovkwKrfhD7HBELQdJ9qmSAFsxdvHXQIVJUx1pnVT+dsONuzd1Hsmv7QSkArIBnOwZz4SBdgvAVdd6AGh67LJY95bbtiPdG9Gb3agTuwkM+vykdCHE0qhhQJTUglJU87V1lZrNSpgkRjMwqRqeUkP3XQMccbOvOG1sNk7vdhD0+BvJILZJCwcz2bEpN8rx5GLw2ishcPq0F+Yzh0+0j47PNH0GUYwZdeGpRtN4ldQD5FC/hkaWO4/TAAVc9RPJU4XWOlzIWFbQ/Ht97NRuIZFmRdT2GOP3yajKnIFtwzvx64hKfIIajqwxhy4nQ4/GbbrXXZJHWleUDFmf61Wo8e+nxNqjTbucetvlL6WLpKzWqgWVTHD9mZ08+uOn+JUgfC0avZhA/Iqqesfq0dXpptmZ/5UD5mAVm8cwfaNnsm19Q9YZKAsQUcVkbhqgpP9i+cs0fYy1OmbFTm1I4dYHyLe7436FWPzN90rSHK5R/RUIBGSIdm5OSyBtGxQ4ZcSn+hb/fhfavwsrylG8Ey3n3OxIRh504YJwWJnRZzxZREa0VwwZ1FZ6E0t8bqX1zstSZUCgJmWGVNfJsOTWvjgTvkewt6k4GdLjD7mn1WakxUTei4qrJeQOTvwYGw+A4NMh9DrYvHm/KKjEibXN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159917cb-0db4-42a2-41ae-08db8d0fec38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:06:13.1809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+HehgDM9az9wyqiwWlr50e/ViaujC2MtwwXgdUx06WB6YwQCtlWevxasGXOCZVfFn6pHtjOdbxm9SL68FPNTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

Hello,

The following series adds support for handling guest MSR features as
defined in arch-x86/cpufeatureset.h.

The end result is the user being able to use such features with the
xl.cfg(5) cpuid option.  This also involves adding support to all the
underlying layers, so both libxl and libxc also get new functionality in
order to properly parse those.

Thanks, Roger.

Roger Pau Monne (6):
  libs/guest: introduce support for setting guest MSRs
  libxl: change the type of libxl_cpuid_policy_list
  libxl: introduce MSR data in libxl_cpuid_policy
  libxl: split logic to parse user provided CPUID features
  libxl: use the cpuid feature names from cpufeatureset.h
  libxl: add support for parsing MSR features

 docs/man/xl.cfg.5.pod.in          |  24 +-
 tools/include/libxl.h             |   8 +-
 tools/include/xenctrl.h           |  21 +-
 tools/libs/guest/xg_cpuid_x86.c   | 169 +++++++-
 tools/libs/light/libxl_cpuid.c    | 672 ++++++++++++++++++------------
 tools/libs/light/libxl_internal.h |   5 +
 tools/libs/light/libxl_types.idl  |   2 +-
 tools/xl/xl_parse.c               |   3 +
 8 files changed, 612 insertions(+), 292 deletions(-)

-- 
2.41.0


