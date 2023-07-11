Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DE74EA51
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561661.878172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cR-0005o1-EL; Tue, 11 Jul 2023 09:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561661.878172; Tue, 11 Jul 2023 09:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cR-0005lN-Ar; Tue, 11 Jul 2023 09:25:15 +0000
Received: by outflank-mailman (input) for mailman id 561661;
 Tue, 11 Jul 2023 09:25:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9cP-0003sM-Ub
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:25:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d49ac06f-1fcc-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:25:11 +0200 (CEST)
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:25:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7465.namprd03.prod.outlook.com (2603:10b6:806:39d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:25:05 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:25:05 +0000
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
X-Inumbo-ID: d49ac06f-1fcc-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689067511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=EKORR818BvAQ8NM1Q8PjcPTPakvjfGrsZhV8oVVgJcs=;
  b=I/m8oUOAn2Kr6iIjmJWZvFIAwRAX5wmvKxIFKft9Thj/XBL5AISzt/PT
   m5gQTjvpsG+RQcab9Zv8wExVo04se0hlg08+lpwkAd/poMJ8W5yS+XyOt
   1h8mJ+FiA3sVXsWufsmHmIuUcuonj9RhCeYG5COcknl0bwwW1JwWARi8h
   0=;
X-IronPort-RemoteIP: 104.47.74.41
X-IronPort-MID: 116231404
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bQYj1K/1dH0fCPXPFl1LDrUDpX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mcdUDuHOPmJYmuhfNx/YNvg9UMAuJbUmNRiHQBsqXg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqkS5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklH7
 a0GDiAiNiuBit+b6YqrUNFWhNYKeZyD0IM34hmMzBn/JNN+HdXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTePilAouFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aRx3iiBNpOfFG+3tlHj0OY2k9LMyYbf3yjufvgl3aVGN0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHbylUSwIAu4XnuNtr0kuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:gLQPo6Fp7RROOfWwpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3AkfAa+2iSeqRB5Ue2/GOYh3MoszJue2WM0lHADBe?=
 =?us-ascii?q?DC2tUZZStWUWowqF2up87?=
X-Talos-MUID: 9a23:HclhsgbR4YPtUOBTkBLjmjp+F59T2KmEL1gVk8wbg+LHOnkl
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="116231404"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP9SHOzJVJ8z+O5sg41C0TPtUBcMU1VAlxqGdCvQGLn0aS8pCmJao+mG7ngiTSG9M1zcXFWSLLhAs1Bb0fGNPzG3Se5E/QYDGC83pi1yZZoI78hAb5IFfrdjhv+A2KkiS2dlhTHp6N2duutA9+0PIqBNPwE5JR2lHTSGfFiKOBLlVmC76Xlo6S7FoTc2xxj+UkOyP6fefyOO/JG5KZuS3u2IS0UsC85fwSlH/lojG0FYilJ9jOb3CAB8N6enN4IbvJGWT2Py7IjgRo4WoF76oKq+gFcy9gc4bU9fxfNjDBad0xcr0Hq2+EBaA+tSEIIgHGlp2NndScCu5nnj/hvTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9MqF37yhxfStVG5/mzICSzNPnqlgbtuAxZ3VZTvJSY=;
 b=UZwyl9EMXnzHdn7X6g/sj8BccO+U+UXxglHL1/NkQeiLA8UQ29yW0xelEQq5oC+Ii8D0ca5ZU5pFQKIpHjuy4ei+od4GrBsMg6oRnhCuHHZRhIgS6zsbzhr3bA8Yw8uw3nEt7317PJTrK4GMxDJP59g4sILjwyce0jyI0okXHPt7rWwNhmCbRMs1zhcKF43ky2Dsyg8UtYAlpM2ItgGtuDDGYE4FnK/PMtC0p2PW6Z73GUyGyPcQJNGLfPaL3J3AMSOykvgvg6Uo5W69i+4fu/i16WY9ifix6x04AX5/J/VEy1IZ57a1rbPtRqWnekTLCDa/ZlnnvnQX5MrhsmK4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9MqF37yhxfStVG5/mzICSzNPnqlgbtuAxZ3VZTvJSY=;
 b=JkyvdnuywDgeFPRQAaRAaHNFUtDIX/amBZNQyNLQv5KW2QsFZVpRH5xdQqBVl5i7n12ub7IOvDRNt/dLsENXlgxj9wlhU21gP+KJ2Wilps6A+ek9kjKKk2bsogJFKaAMViCap0Dx7yl1V4MnJIiTzeiD3ccIlI3ZxZEGnVwKZqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 5/6] libxl: use the cpuid feature names from cpufeatureset.h
Date: Tue, 11 Jul 2023 11:22:29 +0200
Message-ID: <20230711092230.15408-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711092230.15408-1-roger.pau@citrix.com>
References: <20230711092230.15408-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0362.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8d3ebb-9875-4274-de9f-08db81f0b65a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qHfk8f3aQvNjn4Rc/jwrxSPE8KWHWv2iKkfuNyES7rIIFCcT2FYrj5lH6M7zba3n+TvPib4+AtV8XV9MQJ7hSDo1Pa9CRcKHf2B7yAVZWSydTw/cECIwsJlD8xLcjbLZlny/mIN+MtsynpRpUzPdYhwjctNt+DKKbTJNntITgOfMvAIYLwEfk88V4Taxq5mADobpE8DrjNB8dTxQGTOfSF4GEoF1uBP+Dk3VywS8wmbQHEEU/R3sYcnGlHDzWD6d4vxBh4xrpoYnK2DMBd4rG+iqzl5jeU5x+b4dsnFJ0WH4Vw9oQPl58ZX5kFKshNnx6kmpevFxjNyElSwGFkUBz//WK4ImW3cvq6jNPAYKq1xmUeRNR6U7i/az3eEBXspXh7ZeA/kTvTLi3qRpt/cuf9rSOaaB02rcyEV7qFnPEt7IfpXO4tQuSQYyhHM7NJDahJHYl86Tys8I949UB5+djVL8cIiR8L8ANqBSXmHf+Ss0qKMeASeHUyJoDZfWGivKTSoakNDgvj/ZYDt+tLT7rjRMwZzfNPDjLAHhKCyH32PWZ50k9sdHIXNWZeY883QdODzofTB7FCD88qvMIYYEZieXUjLadk7AMHQxc/7yp2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(38100700002)(86362001)(36756003)(6666004)(6486002)(54906003)(82960400001)(2616005)(26005)(1076003)(186003)(6506007)(6512007)(478600001)(316002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(8676002)(2906002)(66574015)(83380400001)(4326008)(30864003)(41300700001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXB3U3dCR0YvVHQ4R09DRkErSHlxT2NhRHFRUFBNY05PbnhFU0hwKzRRU0R3?=
 =?utf-8?B?NmxpS1VtNkt1cEhqdkNYaGI0WnZIZjlzWlZNT2JKbll2WGpwSDFXYk41RnhX?=
 =?utf-8?B?b3ZxcjhBbG42dktjUXAzOHFMVXU3a2Y4aEJtR3Y3TDVlZ3ErelZhM0U2bzlx?=
 =?utf-8?B?K042anN4Mldwc3BLWndwTGU2RDlScFRPTmU5V05LUVFnMDFWWHBPSmdOd3Zh?=
 =?utf-8?B?M3FXWDlaSVoybkhtcmVUYTY2VC9qSlpLTXpnb0FrSGkxTnNWOTlKWTNtOU5u?=
 =?utf-8?B?VTFVNlFCYXd1VnN5WkVmZkJBc1BQdjlqeFIrVXVhWFNJc3FBRXZtNUxjQ2JC?=
 =?utf-8?B?TlNvRkZTc3JzZXI3dFYwRFV1blVmT0RJVHRYMnNrQkYyTnJLN1RJWGpOeGl3?=
 =?utf-8?B?ODZEcHJZbkNseHN5cms3djUvMnBtdThZa3NoY2VCUTVZM05PZUNqaktUUEps?=
 =?utf-8?B?V1VobytFdTdsYUdKWnM2NHFGSlIxdnVQRm9zd2h6bkxlWU5QMm9xSVY1RlVj?=
 =?utf-8?B?L3RXbVJ2VVFKNk5zV0ZYSEg1SjdPbWVmS0lyZlgzUXpBWHRON0tIVEFNZWxH?=
 =?utf-8?B?K1lpRXlCeHowY0NMQy9WQXdXOStqV1lhNEk5TmsrdEpuSllEL3JsYjVTTkI0?=
 =?utf-8?B?WUl4elNxRUNDM0JDcktlS1BuTmxHSUZXUm0xektOL1VDRVdWRExTRURINWhx?=
 =?utf-8?B?cEtaL2tIRk0xNFpPT0twQVZnWnoxeVZ0UERXMGROdlF2SWw1VjBHWVFXT0Zi?=
 =?utf-8?B?ZXhyMTdibElNd3VQd3greFNXOFdFTTUybG9LMElMZ3ZxdVRhenppcndLdSsy?=
 =?utf-8?B?WlNWYjlIVVFGK2RyZWZmMmNFdlc3OUxGQWIxQW15QWVOcGJNT0Z3a1JYMDZp?=
 =?utf-8?B?dHFGREZsaDZOV0hrOVNaVW9VT0s1Q1B6aDU3M1BiMDQ0MjhrZEpEM0pkVVV6?=
 =?utf-8?B?WnlTZ1lBSkQvNkFYdFFjWDRndXBXWm50ZFdQRGwxNWZIM0t2R1dZSDZoLytC?=
 =?utf-8?B?UTJxaW9SWk8vaW1VWFJRYVpXMEkrSTk0UWh6d0FQYlNqRFVST2hqMk9FME96?=
 =?utf-8?B?UUdxSjdyaU9SVnNKOXA5US8wOVhPaVUxLzBPZEE4bzNEL2VjMkR5QTlpSTlz?=
 =?utf-8?B?YWxuQUd4MmNiRzVNZFh3dTgvbmp0QkIrOElGWnltd21MaGZuMmpxb3BJcU1V?=
 =?utf-8?B?MXdVWkpXb2VEeFRmRnlkaC90ckNJalRNVCtWL0VEOGpqZzB2a21UbHZqZG5a?=
 =?utf-8?B?eUhGYnhweVNYUk5ScXBoK3BlcG1SQTM1WGNGSk5Rb3pqeTdJN05KWnhhd3d5?=
 =?utf-8?B?YWFXenA2MXBnZ0syN2Z3NGlrUm9LOXVrYjhtV2J2Mkw1amY5Sm1lZXN0dFky?=
 =?utf-8?B?TnlCNjRPWlpQNDhNNHVOcjdyeUE0L3VWRlVDUHp2ZjRKL3VjbUhZYkFpTXpi?=
 =?utf-8?B?Y08wcVVCcG0wRm1UcGFQTW1mWEFDNWR1emM2OFJjbHEvaFUrckpkNHhLYWFU?=
 =?utf-8?B?UXRYSEZXOVQ5cnJleHJXY3ZSaEphQ2RMVmJta2hidVkrZHZINGoyMG52MDNF?=
 =?utf-8?B?eFVrNmhsYXordW5rVFBDSUFEWlVEMUF6VWFvcWhOaUFPS09uM0JSOVkvV25E?=
 =?utf-8?B?YUFiamZ5RFdIM0ljZWtyMi8vMXR1ckVmYWl2eElZbEdXY0FKUlZDL01pMy8x?=
 =?utf-8?B?RldXaEtEcHVXSDJTV1RIWUJzWW8xWElnUlcrcm1QeC94aklvZTQ1RUx5ZzdU?=
 =?utf-8?B?L1ZublFTMmczdC81UjBEV0xZejNmYzhQUEN3UGNScTRaNTh4VE5PUlBlQW9l?=
 =?utf-8?B?WXZ3RHE3YU1BRnVxbFo2VUFZK0UxVDhQU0MyZzVoSndTZEl6Ui9ldUd6OGZ2?=
 =?utf-8?B?VjJ3UXZZUkNlbXhsRHFXNllzRWJJWWFIY3NDeHI2ZUJNdWxBNEtkT2hxZWRB?=
 =?utf-8?B?cWttWmk2RjVua2U4S1FLc1MyT1dLRWg0UVIvREhSeFRUZTFqek9Jc3NxNFkz?=
 =?utf-8?B?ZWtKR3VhR1JpNUNKQlkrVzJRQXZHeUxxbndtNkh3eXF5QldYbk43U0ZRRnEv?=
 =?utf-8?B?ZmQ0V2k1RGV3L3M5SGZXVkpCaGZYNlZhMDRFSnpCZHoxVVdyMXJ5UWRRVHVl?=
 =?utf-8?Q?wX60NgBWDCKNdhIXBpHu3F+yP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KZlfFlpe9E1aFu9vx+ePRtDBYhnBTaLNNMOsjAWzUm4/P+z2PB292Qr+aVjbXzFBfzfAK9c72IUZYFdcnY3pnNC4S7uxPBpdAN/YehhPwoFDKZKagCXWohzzJWD9MUPF4sc/VAErLFc4H5yr+m7hbDZa0+XBKU9Tc0e56WhTgadveoz9mZ/DvAm2YecGkvlVta+4FvHGolXHlVoQ0tEDWWErbHw5ZLQaZj0aMqifOjn1As/4e6KYXRD5HW3Emxr3chAzNBaDZcIMnOkkQ9sT+9tYPTTgF7FDEWBhVZ0+pK8p+bhh2AL16APB39aIqFxXWtPON94MVrD18BuTUtbd6UQxlWUfS8OyjeC7ASplI0QzTzwu1QZx8dqLycKDuID5fP3JPxcP0mh4zFeNKf3KBTqXa4JjIbtxmnesZZwNYhZn80MmEwo0opDYdV/YNh1MOELeC1+6HW/gNgV5dDxjswvEpLbGPacYbDhRsgkcKcZWi1X7MHHTeH0afXGwYuPhJ3BOCsBIcVbBz9DrnFA5KptXukI0VqzWSWv8l2Njbc5a8UJWsuQLtAMvXmnyqE7Uk3Fje8vcLfBFIvhM2YhJJ6MOgiNoC+7xMj1BEBfOhIzrDyGZnPwdQ9V8aZ4tKmfw6134np6bllN07s047YO2izySD8fHlXl8a+F0+5KTvDpjFaUdOtvUv6ORRs17Rb7fNEPwJou6k8+eRIvOhQiaDfDnOAHoPbItUNfiHf3VclOUV62yr2mYvfTEV/r5zAm4sknqG1LhjCKf7+r3R+mAIWP5WhvTYzBOuruXZFeNCTxyi96B3WW7EbcMW/mtn2Cq
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8d3ebb-9875-4274-de9f-08db81f0b65a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:25:05.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnavnJrVSvGXQkZp8DQVix7hkDJfs7b1r9tjVlMWiXkIsFw9kLTwzDkoIM9uKKR8w1ZYtowZ1nWm5mHwF6+iiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7465

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
index 52e21de81fc7..b1c4f8f2f45b 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -14,6 +14,8 @@
 
 #include "libxl_internal.h"
 
+#include <xen/lib/x86/cpu-policy.h>
+
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
     return !libxl_cpuid_policy_list_length(pl);
@@ -61,7 +63,7 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
  * Used for the static structure describing all features.
  */
 struct cpuid_flags {
-    char* name;
+    const char *name;
     uint32_t leaf;
     uint32_t subleaf;
     int reg;
@@ -154,7 +156,19 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
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
@@ -177,208 +191,42 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
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
@@ -392,17 +240,63 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
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
@@ -415,6 +309,37 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
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
2.41.0


