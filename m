Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B185950A09E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310169.526842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWkv-0005Il-Im; Thu, 21 Apr 2022 13:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310169.526842; Thu, 21 Apr 2022 13:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWkv-0005Gv-Ec; Thu, 21 Apr 2022 13:21:57 +0000
Received: by outflank-mailman (input) for mailman id 310169;
 Thu, 21 Apr 2022 13:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhWkt-0005Gk-SW
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:21:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00f9627d-c176-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:21:52 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 09:21:51 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3649.namprd03.prod.outlook.com (2603:10b6:406:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:21:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:21:48 +0000
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
X-Inumbo-ID: 00f9627d-c176-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650547314;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jZyrjLFF7c26fEoKVpZ5U3W1KX5PPxiSRBxQXY3VBOY=;
  b=XR1XMXW9Mty9Q527f+GEx+CLqddsAaHFjfxNtnzVdG/a+MBCyDqfQ9y8
   YBqtY8XRqD0+1HHlIWl1K/mzV0TTIfnR8W+ylp1M1RX6ToQUR6ZNO4OPh
   BwSvBJTELAEeG/yjFgkuisla4BD/xBbSxvN+0OHqZ4NCzCQwEDbVoKF+R
   o=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 69628143
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Wi78SKOr1hOd+qXvrR21lsFynXyQoLVcMsEvi/4bfWQNrUpz3zACz
 GtNUWrSbqmNMGekKYt3a9njpE0C6JaAyNdhHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2Ncw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 O9dqpqqSFoTMoaQnuEmaEd5FSpMBPgTkFPHCSDXXc276WTjKiGp6dM+SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HNaaHP+iCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/21yelI2QE8zp5o4IXuHH0kE8y0oLoMYX7IYy6Y5QLhnmx8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHslh0RRdtWVfE74Qely6zI7gLfDW8BJhZZYcEinN87Q3otz
 FDhoj/yLTlmsbnQQ3TN8L6R9Gm2IXJMcjVEYjIYRwwY5dWluJs0kh/EUtdkFuiyk8HxHjbzh
 TuNqUDSmokusCLC7I3jlXivvt5mjsGhotIdjukPYl+Y0w==
IronPort-HdrOrdr: A9a23:qqV5lqOFaG8lVcBcT1z155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj5fZq8z+8N3WB1B9uftWbdyQ+Vxe1ZjbcKoAeQZhEWiNQtsp
 uIGpIWYLOQMbETt7eB3ODSKadE/DDoytHKuQ+IpE0dNj2CJpsQmTuQTW2gYzxLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUGzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4EoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKlQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgYdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfJsRLQkjQ1o+ao7bWPHANhNKp
 gvMCic3ocdTbqiVQGXgoE1q+bcHUjaHX+9Mzo/U4KuonprdUtCvjQlLfwk7ws9Ha0GOud5Dp
 z/Q8JVfZF1P7srhPFGdZA8qfXeMB28fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69628143"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaH5qi5fFEkyBpCF6gUewO3xE1DhH0OoypZ9uf0xjk6nCvD34JgjS3jdXKfU3nNkI561Xv0FdOrsTBkTmvOQrKr/jXeQKss8WNvg1H4AcyEoVzmEWNF/9lvfj9m8nrU6MmysrCWa5gkxglWixuidufAJh+mMT6ebtHj2sVMtWS9AMp4MDyyGeeBsAd/C7WN8KYkSbY4y6EVlVzUbQ/Y256JPF3O1sY9a1S05+J57urOKNsdRFy1hhYh5FAL4RE921Wc4SE2i7Fvl3cDr2DLxJVCOeq/nLaHCVoSaHe8ugV3Mv/DjL+WSlcrk5oIxyXzuGQX9Swby2lMCk/4WZLz70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0eLGIcM3P4X+NUpoJY3mSiSpRD256XuFHD/XZ8SoOc=;
 b=HEPg8uSPqP49OiWpOlhol7Xz3T1HznCLw+kzPbVo8wh5+p9/A/Aequr4eu6QMj5ej6OR87prOpTa3lHRPyjdzJuRw/gK/JqFx9Z5FMkww+CexBy94NiKiqxm8fDAo4DJsGxIM8TFo46/fL4R8KCFgC553uXL7rLwsLBNqNXT5LEJcd5hGsetR/SbZRu3QQkRwnokZGN4RJddPGDuW/szxzzarRZ3K7cWijRQe1slkYDbuvZ/8C3CpiU2h8218wCDKnrfTSkU9+M9qvcBexZr/YishGA1qUyi0+xR6Hz490Lcbr649Q1SU8YcJjOp5wJyt8bwszpf16ixjtF4ujkBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0eLGIcM3P4X+NUpoJY3mSiSpRD256XuFHD/XZ8SoOc=;
 b=K4fCB+Povrrk/cFCL+DH0nkZ/cnVFVDBLDYP+em/CwNWW4jH/vX+d7QDuajEjS8JZLtFVlHFqF1xSMpIKYBTVNkR1bMLpOPXrvcEQ0PKYs1ioD6CA+6rkGCPg6ibKYieO2CZCdxQvkHHLDccgD+zAUXMaBqWpU/S2CTGOhSxH0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH RFC 0/6] x86/ioapic: fix edge triggered interrupt migration
Date: Thu, 21 Apr 2022 15:21:08 +0200
Message-Id: <20220421132114.35118-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eaead84-28d0-4593-54e7-08da2399e399
X-MS-TrafficTypeDiagnostic: BN7PR03MB3649:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB3649FA6213E3C2F6117457C48FF49@BN7PR03MB3649.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V8q2XbyRzlrNNg4Hk35yQ2OTZ8+H7rkawrS9o8soSsMfKwDoiCnLB0MP3sFOgtrz5eAVAwWnn8a988b0PZrQsOHP2utJrl+12Ju0YM0ypD9ZT6m3gVEHCbJY2DSVwUuQBIqsuJWMpog1GlXcO5LKCFpsYDuV4FL16K6L2rLYw8/TYXlNmkGuM4s39oHVEOhN5bM9qblzYX977Lkng0A9cxIg8LiElMxuOw7d6MGXu/BaKlSFmI56IHxWqBjTPvAmFoM2VkQTHV9zOc8jPkwXtTleeysJ4tAWGy2cPqfHJm7+0SBGai2XCn/H5+5WpfnNcOUG2SuL1oLc22Yfc76WUR8SWWj9ZEGSu5mAo/zhMDFYr2yPK8fa8JfOr51xT9F/isyPZYWf67l0YNkmkZ6pLD0L8R1ye62VZAiLJ7JUF1fFhGi1mLRuDiRbCJUgKBityT+DK860x2rl5xoeBDSea6X7A/SS9AiOhZ8yyXaS49F7AdVwLAvjmYiLo9xrVIyvT+T4o839vK76bSIjZ3dLSLyN23HUFzVL6Na8j3/8qnxcCej7FStBDgT6KUOxkYA4iEoknIjC0eeUPQPBjsnWVlEecJZW7UBaQsnhmwOAGq4ANtHbbFkhsmHH0yYcErgvPZ2I6XdmJKiu2qIYWaL3YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6666004)(1076003)(6512007)(316002)(26005)(36756003)(54906003)(6916009)(2616005)(2906002)(6506007)(8676002)(4326008)(83380400001)(38100700002)(82960400001)(8936002)(66476007)(66556008)(66946007)(86362001)(6486002)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0VDY2hqdS9FVDM0R0tlWmQwb3JnUjRhRHgrMzA1dmV0UDZqZ2RWbCs4OFZI?=
 =?utf-8?B?MFZCc0FuMjR0R0ZwN2ZGaldxZDE5cTgzZnpiRDJxTk5iUlpoS2JFaHc1STI3?=
 =?utf-8?B?M0oxZmJnUlNoUTJHNXN6NTJQWmlpWGhQT3dsc0lVTE1HaDhCWEVaRjFtYlhB?=
 =?utf-8?B?OTN3UzNCM2tNZmdMWDFQdHNRZzdTWGJPWEtjaHhiNTRWQVRqbGwwODgyZ0pD?=
 =?utf-8?B?dU9PUDhKNHlBTm5ob2RFZ0VNMDQvbGNHS3VKcjN6RDAwU1VXQVlDMTh0eXdU?=
 =?utf-8?B?N2E3Yk5abE5uemN3VUsraWRYYlA3Yi9kUnlnMVJPdk1uZ1JpU1lBQStmeSs1?=
 =?utf-8?B?VmEyZ2t0cjEvNExLVnl0cmg0cDBiRzZCOUFLWE1SNzZKQm5rbnJldHVQNTgv?=
 =?utf-8?B?NFIwNWd5Q1lHQ2xLUDY2YWduVFVyTER0enRpaURvYit6WnRsZnN0VlUrSklI?=
 =?utf-8?B?VzFCOXp1bWx5aVNMK3Bweld0cmlpVTZ6cE1YN0xJbTZzL09BMjI5ZFR1SC9l?=
 =?utf-8?B?R0FDdExva0dLSVhNTmhucE4wN01zUlhuaVdHZ1E0QkxIU04rYVU4WVFQREdR?=
 =?utf-8?B?SjZ0K0U3WGNzOVo3SzBWb0lCenV4TlkxSWZiRXVJbTB3cEdDS1RZMlR5cU12?=
 =?utf-8?B?NSsvWUtIWmttTkpUdGdNVVBKVURjbjhOYW54SDhjS1BhREtvejQ0VlFKMUtH?=
 =?utf-8?B?YTJ0R09tb2N4QzZUS1A3MVFwZVUyd3dJK0pRMEdLalBVRUxuZktVZ1kxNko2?=
 =?utf-8?B?RmMrdGR6R0VlOXU5QVhua1pOS0RwR2dmdWI3VTVFRnBTZlJwMmFTL2VNTkta?=
 =?utf-8?B?WFBwdHZJS2N2NG5ZTWE5V1h3dGNLZEVFS0dwb1pzZzVzRGpROEc4L0EyTjBY?=
 =?utf-8?B?em81UUo3eXVUNk94K1IzSFQ2dHN6MklLdmFMNlZ5Y1lHQzhnVjNBQzg2Zkp3?=
 =?utf-8?B?MW9qd245SCs0ZnJjUUJmQnNUcU8yNmVMNktzMnRwS3c5WDM2Q2lLQndSTE10?=
 =?utf-8?B?VkdzRWtzNFRQblJKaktIbittdjd4Q2tRb0dya3NWV1FzOTFNQyt2WWM4TzE1?=
 =?utf-8?B?Z1g2dy82K1dUUmp1bjNITlJZQlIwMGRMZ3U2SXZLWDhnMUxtamZlai95NDRn?=
 =?utf-8?B?ZXJLUGpPdEN5bDhsZnVmNUdEUjhRdjJpZEt4UDN0LzQ2dTVhVlc1Nk1VZTZB?=
 =?utf-8?B?dVR5bUhLcnExTG1KM0tMTnIxU0hyZUtYZ2U2S0JDVWNOWmI3UHdVZ05OdzdD?=
 =?utf-8?B?T0VSWmx1MFVvcEVCRnVUL0NTcXZNSENYNVU3TGJWY3J4RWJjNW1WNVNENW10?=
 =?utf-8?B?NDBnNytJRE9QWlJ6UTREazloeXRDUzJMQ2lqcW5qU2g2ejBlT09aZ1FmVGVy?=
 =?utf-8?B?YzgvdUM0R1VTRnF5NUxhRDFMdC9qMitTdUxLb2VXalFDV1I2cjduQmNUNFhk?=
 =?utf-8?B?aGxFandRU3FNc2ZjNjNrYnFISDlNaCt5Mm41V1JqZUJReHJjNFRPZGhWK0NX?=
 =?utf-8?B?b1ZGVnlEcXBiYWFFL0FkYkNqZmlaS0IrYTYzcUJEQ0w1a3dOVHlDZlVITlFZ?=
 =?utf-8?B?Yldab0Jkd25pZW5TMXIzSGJyalhVNFVKZUUxU1dGWHQxUStPeTJoKzQ5R2RL?=
 =?utf-8?B?S0ZzSXBUM1I3MS8ySDFOdkpmT3hYY3hML1lmQncreUVmNEltamdoeXNCWDdo?=
 =?utf-8?B?eGhMRXF3RG9UbWplTW1aYW4yT0pydEROZ1A5MG1qa2ppc1NaQW5HNm9UVGkz?=
 =?utf-8?B?aS90OW4rQlZJRnk2U05XamdvbVVGNHRYRWlmM0JtcEhkTll1NWQycVg0ZEJt?=
 =?utf-8?B?YytJUXZ3MjBZaHc3QlkxcUZIcE1hMWRJUzh0aHFKNndTcjV6K0JEQzlCYkZX?=
 =?utf-8?B?MEo5SjVZWWpmMWRqancvdXVLa1E5eTJqRzRaMG5hMm5IeDJ0RjlwQy96ZmFr?=
 =?utf-8?B?Q1hXSzZvc1NmMjVacGdQL3NvaXRNdXRUQ3AzR3R1MjY0dWRzZndWR25hTjNl?=
 =?utf-8?B?czFxS2pWOW52d0xKVmpudHd4TERWVGgrc29rb0ovaFYzZ3ZmSTNQd25FdEJK?=
 =?utf-8?B?TlpYZEFWMTd6T0REOUUzV1A1Qjg5T3FkY0M4clQ0WlBhMXluSDJXYnNQNTUv?=
 =?utf-8?B?YUc4ZGVsY1p6d0t3R0FubnJ0dTcwdHJHNFg5L0t0U09vUEUvSkdjV2NiTys3?=
 =?utf-8?B?NWJKaHVzK0VsR21UaWg3a2c3a2Z2eWZteFFXY3FqMXVRQ0xEdUJjS0p3MGd3?=
 =?utf-8?B?SGI1ekExUlJOejIzR1hHY050VllUVVZiYWhqbEY1Z2ZZSnJ5SEhlWUNxb0Ez?=
 =?utf-8?B?b2dpSHoyQ21lVHVzcG0vM01PZDhyOXljM3o2c3VzRDhpREJnOHJrQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eaead84-28d0-4593-54e7-08da2399e399
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:21:48.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjddaoNO2ao/nfF61A9tq0sNaps8IApB2LCsCZmmOLq2hLL5kcmPvLrfdBT/k8TiDKGykt8srJWC1RzXzeBedw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3649

Hello,

Following series attempts to solve the issue with IO-APIC edge triggered
interrupts seeing an inconsistent RTE or IRTE when injected while being
migrated.

It's currently RFC because some patches have post commit message notes,
and because I'm not sure if patch 1 is really needed.  I originally had
the idea of suggesting to only backport patch 1 in order to fix the
issue in older releases, while leaving the more complex (and thus
error prone) IOMMU changes in unstable.  Note however that patch 1 is
just a workaround to prevent interrupts seeing inconsistent entries
while being updated, masking the entry just makes the warning go away,
but the interrupt will be lost.

Thanks, Roger.

Roger Pau Monne (6):
  x86/ioapic: set disable hook for masking edge interrupts
  x86/ioapic: add a raw field to RTE struct
  x86/ioapic: RTE modifications must use ioapic_write_entry
  x86/iommu: pass full IO-APIC RTE for remapping table update
  amd/iommu: atomically update remapping entries when possible
  x86/ioapic: mask entry while updating

 xen/arch/x86/include/asm/io_apic.h       |  72 ++++++-------
 xen/arch/x86/include/asm/iommu.h         |   3 +-
 xen/arch/x86/io_apic.c                   |  81 ++++++++++-----
 xen/drivers/passthrough/amd/iommu.h      |   2 +-
 xen/drivers/passthrough/amd/iommu_intr.c | 115 +++++++--------------
 xen/drivers/passthrough/vtd/extern.h     |   2 +-
 xen/drivers/passthrough/vtd/intremap.c   | 125 +++++++++++------------
 xen/drivers/passthrough/x86/iommu.c      |   4 +-
 xen/include/xen/iommu.h                  |   3 +-
 9 files changed, 195 insertions(+), 212 deletions(-)

-- 
2.35.1


