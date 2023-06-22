Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1100739922
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553334.863834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFTg-0003JQ-O5; Thu, 22 Jun 2023 08:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553334.863834; Thu, 22 Jun 2023 08:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFTg-0003GR-Jz; Thu, 22 Jun 2023 08:15:40 +0000
Received: by outflank-mailman (input) for mailman id 553334;
 Thu, 22 Jun 2023 08:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+egu=CK=citrix.com=prvs=53080a007=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qCFTe-0003FY-Er
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:15:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6401485-10d4-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 10:15:36 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2023 04:15:32 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5174.namprd03.prod.outlook.com (2603:10b6:610:9f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 08:15:27 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%6]) with mapi id 15.20.6521.020; Thu, 22 Jun 2023
 08:15:26 +0000
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
X-Inumbo-ID: f6401485-10d4-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687421736;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TXZhjy6E/HE66AXCHOrtlqG07p5zVUtWF65iqFaydjs=;
  b=cTzw4TBEk8V1vByR1MSVlZNntOaic2317w/tqQas2lF2a7wakJuVI/vz
   LuUR2XVzOpP65qys/0nh2vs6E0ULgwY02yONluy+pz1MdIzOqSOYFjTdY
   Bl4drQj3gMwACbaYAamq/A45CuWgktVy/nRC09keLNgyL1QSLMuMmPBii
   c=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 113739223
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yNSf3Kl0sqstFE5D4jv5ivro5gwTJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJX2iBOffZajajKd1za9my80NQsZTRztRjQVBl/yo0RSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5gWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cIKcykQbBCIvby32rSfEOdmmf0pFvC+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqgB9lDTufjnhJsqFjDxVAwNicbb2W+/OuF21eOcOl7d
 HVBr0LCqoB3riRHVOLVYRq8p3KVuw8GbPBZGeY69QKlx7Ld5kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaHiwYLnQLYyMeeiID78P+u4E4jh/JTdFLHba8i5v+HjSY6
 zKAoTU6hr4TpdUWzKj99lfC6xqzorDZQwhz4R/YNkqn8wd4aYiNd4Gur1/B4p5oN52FR1OMu
 HwFncm27+0UC5yJ0iuXT40lBLi0496VPTuahkRgd6TN7Byo8n+nOIpWvzd3IR4xNt5eIGexJ
 kjOpQlW+ZlfemOwarN6aJ6wDMJsyrX8EdPiVbbfad8mjoVNSTJrNRpGPSa4t10BWmB1+U3jE
 f93qfqRMEs=
IronPort-HdrOrdr: A9a23:NFtFqKstzagUtew/oIY2UGT97skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3A7F6uHmolGFFw5PRQrPGzehDmUf43KWTAznfbGRG?=
 =?us-ascii?q?5E2BNErOfVmaawpoxxg=3D=3D?=
X-Talos-MUID: 9a23:tD554QpF31HZVz5zlwMezzQyN/tL3Z6jMn4IzIc66tC0HhdUZA7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,263,1681185600"; 
   d="scan'208";a="113739223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtO5y6ji42YuQbtp7jYe1CsbUCfg5k4MKjCmLaRiebLjkpdBTvDfhRyivKvwdHQfkzPXZuonE/CabiDEhStKGN6WpjrBX9NwNF8Aa6gsplkLMSkFDu1zTZMMXyw4vGPUY/rCc9q1ktOx1Oe/9TTm19FsbbqXTjrgN48CuJTiWEw/lHpkom3PzRzjRXI969DYHQX7lnPfDPifXpIEDIhp9shalhtehDyqorQ4sm+VpkFci+0vIQdQn6GHnZeNBpCD+Tqha+4nioqgetfYOr2Te2/K2JiSgPgb/QsMSW68YnAuLMYjXp6rbTvUXLjqSWhuisugspUO/QHqYFh4UCgwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBWQaluGv8p5xtOMjIrR3uIbrFpSciKpPmLvQgUj4E4=;
 b=dOMu+Gj8XllhwI2OXA5730n1Zu/irF5r2zHUhf9YUQCPX9Vj0FIo5vS419lgXUr5scKojugVg+R/+cwiG2Le5+DT/sZz2xARhAR9j+1/G/4pu8FQBi3WG6qxrtVV6MP9dXrBCpkDUej92A+aUTfq1LkvyXy9ResLzwsl5PZXy0kL5iKkxKu7SrSfNGjmx5qiE9kISVCy14G385ocSgDr8GFoPF1d6RsT0qW8nPhdC1nEfnvHkv1lC6W0sbO9iHwrGL9z3Ruo2CO8xt7vZaLTviWscJ4xxmYVmJSIqCQryfZD5cMkEgxJwWRIDy+XECiHUuYXb8GirZYqeXWQmT8nTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBWQaluGv8p5xtOMjIrR3uIbrFpSciKpPmLvQgUj4E4=;
 b=wU46ViUcQBPg5gGLDhxIHeZ6KL1B0n5U4M5zqt2VkWmAl/s8WZnjLbPvH7J4fTYr7hl7qbNqXhblF+7zVvjtigjhLMysl7x0FbuBJdx6kKD1jzR/deFBLuQlWZhjI9L3O3+Vx0pHyifvvsKTsd5wtA+WUL+K/7dKlvxKNHLSmoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jun 2023 10:15:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Message-ID: <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local>
 <87352kpj04.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87352kpj04.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0396.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: 86237ee6-1451-4c36-e5dc-08db72f8d596
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0sP71ABcopaHUNkWWGw6TO5RHdDnrIBduZkp7X7Nj+hSeFhb6Swp3dXIRUkBqOkQWdEXhH1z+ekSTZq39tCFqbzuLPtvJNKtRd//R2TX80dhCDbl8fLxKS44/TJmTYFAJup0ENrawvHDMNffTBfIaVKtT9WogSbbiNHyZIUPCRDu1SuzVHsLJfHE69hWzSE7s4sgQIKSbesaQoV/LC4W2jEfQlWsX7zjlZrcmbWD3Qlj9PU0oodSxYclgwKEkVC1VZ6hwndj6lyC+bYAY9TYHdqN/dUuDhqmrKrIw2cN9or3VI1v2hye1lhAuKFjz/tDegkaY13TxNa6WTyNpQjYGVwjL+OjHqEEmV1RyGmUbN2No/OeQ49zM36xRXulqtY/dHDNSOZVX69GAxf1dgRuhTxmN3uGFORsNFu2FiNRNazaX1NqCGs2wnab1brhpCMrtdItc+RjF6G5SArCRC9Q/X8wol207P7XaUyb5ruZ6/RNcvllCv1fCapLvNq1oiokWz3Nff5Zgj/mq8j/1VhIGnGWxXWQslne4+uGcqcJcnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(6486002)(966005)(6666004)(38100700002)(83380400001)(186003)(9686003)(6512007)(6506007)(85182001)(66476007)(316002)(6916009)(4326008)(66556008)(66946007)(2906002)(7416002)(8936002)(8676002)(26005)(86362001)(5660300002)(41300700001)(54906003)(66899021)(478600001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXlqeDRQQS8wNTExTWJ1VmdjbkFseFk5T001UVJZN0xkL0RzdnlPeEVtZVMx?=
 =?utf-8?B?SitNWTZMcGR6V0VqZ0NDMVZlSy9Cb0M1d1A1ZGYxSkRSZ09lK1h1SjVNMnhm?=
 =?utf-8?B?TmhmUnRpWEJLdUNHam9UamhwMDRDLzF6U0cxT2dtcW9pdVZiSmpPN1VhUHUy?=
 =?utf-8?B?RkN3RmMrSDJCVjZtYkJ5eWZEZDBmWExvSWpkVWVNNGFTMmtiZEVveG9tSmdl?=
 =?utf-8?B?YTFGVTlSby9qVXVRTVFRV0Z2c0R1ZjlmMXJqajR4eFlQc2hGUjA5UVJ4aWJC?=
 =?utf-8?B?ZU5US1FoZm1NUXFSRlhya2hGcFMvOG5KYXN6Si93Z243S3FjakNLS21pcTN3?=
 =?utf-8?B?eElQdlA2bTIvZlB0M3gxYmRBSGlGSmljZXNzV0VobWdkT1hkTE1wSXFxQ2Iw?=
 =?utf-8?B?eFBzYXlRVlNLMGg5QWcrcmxZaEJIMGx4eUYvVmZLNnZmNjV2SkpySFdPVjhi?=
 =?utf-8?B?NWpZVTR1TXRob2NIZUp5SFVUZ3JFcHp5ZXVjcVVIeXQ3dk9xdmlCVzZPTkFh?=
 =?utf-8?B?Nld3YzFtempxaThiOTF6UUFtaDkxUnhNSENFL1lQWkZEb2lVMUFkcFY1bmQy?=
 =?utf-8?B?YWJzdGFydG1zNlZFQnBVWUVTREVBeEV1RHNqTkhLU0Y5ZFIySDkzTHdjcVhu?=
 =?utf-8?B?b1Vzd2R4WFU3MU9pZlMyYUx5M1VMam1OQ3FvbTdLaTVLQTdrYXJKaG5MOHZQ?=
 =?utf-8?B?ZXF5aFZLaDh6N3hHa2hqUm82a0x0TS82c1hsQTZNTm5Hc0g2cjBWU0lYbXVa?=
 =?utf-8?B?K1F6a1RIRGFmK3J1VXBLeFE4dk81aWUrMVRjWjF3K1V0TnM5NmtSMFFEdFpG?=
 =?utf-8?B?d1pIMzJldXNpOWhkOFNPL3dIVDhkVm1WOElDMzlxczJjNFdxMEpzM3ZrWmRY?=
 =?utf-8?B?eEJBMXFvc2xwbVFzcllNN3hUUlVITW51SG9oeGJKdlZYMmVQVTRBWCtmeEEx?=
 =?utf-8?B?VXQ1RkVQTE9WWUVWZWZXdzFPM2E4eDBRcnp3ZTJUa2lwN0hKZ240VUVqeDlZ?=
 =?utf-8?B?Z1NPU1o5bk9RT1lOUG9GWDZoQUlpc21rWStKR1NkQnAxakVzUXl5allFckZU?=
 =?utf-8?B?blNyMlVJcVZ6UHVJSVVacXJTS1NOcXRwTFBvalRaenU5d0RsbjRiNk5xck51?=
 =?utf-8?B?V29kYUdWMzk1b1d4MjVSU0tnWVFROUxZd3hTTVpvTm42VVBkdGZIMDR3SVFD?=
 =?utf-8?B?YUdWOElGakNjdmZFTnYzSnJSekl0VGNPam5EclNKV3JaZHdqVHk4NjVtUlk3?=
 =?utf-8?B?TkFiakxMazZjUzBBYUgxdzlSY0FEeWJyYldFckYxd1AyeUZTbHJUWEwxUjVx?=
 =?utf-8?B?VStVaXJ3VE9ITll1VXQ5QVNoeWFhdGZBc2s2d1ZJYUZBbkEydStPempFcjNr?=
 =?utf-8?B?QmJJQXhMUy84bGhLT3l0MTRFQWtCeFdta21IT0VzdUxtazNZU3FjQlhNeCtW?=
 =?utf-8?B?d1QzYzFPbjFVV0FyaFVLRnJYYzAxLzdwb3Buc1Bwb1N0dFpYQkRycEZRQjV1?=
 =?utf-8?B?ZWdHR0U0cTlXRzM3R3FrdjgwTkFWVmVNdm9UQzBJdEMvM1krTXk1YnRQSWJu?=
 =?utf-8?B?TExzclJrdDUrOUxNNklTalY4VWxnTUJDYitjWWNDeElqbmxtS0hWdk0zczN3?=
 =?utf-8?B?NGtYWHluWjlCV3NvZ0VHamlydS9Bd3VOd29zdDVaMk1RbU90ME0xdU15RzFQ?=
 =?utf-8?B?c2VIWjRlaWVlTnVHZzM0dWtzNkFXaUdLUWtvK21Ncm1JUzlXUisyZWRhR1p4?=
 =?utf-8?B?NDZkZ3ZMOGd0RzBST00rUFVuVTBNdzgyaFh2bEh6RENiZUY5NytMT3V2c0Zz?=
 =?utf-8?B?T2hNRzRkS2VZcDdud1RWdzhTdElOcnhMclEySG1MSVk4TEZyM3NKYjh3elll?=
 =?utf-8?B?aENpSkhlNllwWkg5QlJtZlZ2dUtzS2pUVCtFQ1B2bkpLZHJoM3djNm9MbmJK?=
 =?utf-8?B?SjJGMGpVMjQrY1A0dEJlVm5yRFlYaDhHczQwRzZwVHp0Ni9acUNpeUYrbFBE?=
 =?utf-8?B?NjZlaFlVdWFpdlVQSlU3TzMyM2JUVVVCNmNld0VQWWluNXlWRjVtdm9XRWg3?=
 =?utf-8?B?aHUxVWFEV2NaV256Wk1EY0ZkZEFPVWsxZmgxc2FqbXlWazM4SWxJNitKTkN0?=
 =?utf-8?B?R1p4RkFYNHllTWxnTitxM3BtSmZ5RWtLQmNPUFBrTVRuWndENlRPZE52QWpD?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L6QEhTe1Flufnfdb7VY+68xbHR/q8IhonKV7Z2ewf/flfAVnpvkiHVNeSe9DTlee5IcqyGnNYodfKrHsfF3U/2YThGkUiEfQychv/jzvLzmF5oWPSQfOmR81f4VOtRgPhOeLCJoR1dNQKgASlavMUqQCTAJnV3LuCa6R9hx7ipAxmm18aWlUePZPfD7krvF+O3iiZQJegVxcONofwZpxc3hGrQEVRT/jxVYEN/oILxHIHYeqNXJBKylQpYVAfbTCZK5yI/U2t2qi8CH9cxTheY1JHbJQ550Ta19Tb2XpGNO3bYSXt6ns/oc7aprjLG4cbn84qM7orXiMybexRMRMLcaiT8ls/l96YU2pH/0cQfGD6MjnxwufrcsviBqFP2Y05819mzbGx53wLg/jwecfdq43kIr7Iz0FI/Xo03B+qrtjfCuoMo35TuJDrzRl/MtF+QPPc4d4KbLRcLPTpWSHi6ui01XcDMGV6iwjwt1sAiz3PVzga6aCGHRAj852/gPl6Ln+J4dqRcANr/2x3RhqRBnyJJMSZHSVXrQO8apCzwrJmeKV/x3wSWYzwZk9v7lSdy7prGKE0Nn5HTh44dTNEnn0woRQ5ZI3kHDHM0fvhnigeDXrB3EkwWBXnkkiZ2X6OW237r3bo/GhCtF/q2qQy1RtW7SwKvOtZvXUPS2wgu2Eu38mfUwFTraO0KEUwINekkjpzjFTUL5qY/vly71aIBX63KloHroFqxYOrZpbtdCVbv+cZAGHnWxSeZ2SfzZrO97WaqfWv2ngIaooFYUi/VQTMtsOHwXbZHyQpXIgHl0VRRkK6W2/qUdCQiXp+5JgVfvq8l6c940J1Hjd+HQrucyXX7s2J3OfkEQb6OZh+d/rZ5p8euaockComkiTDiR3
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86237ee6-1451-4c36-e5dc-08db72f8d596
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:15:26.6086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+HX2NRH91GOV4u9/lm/EtyDF0lDBM6wlTsHz6UHrDsahjvpmsxKs/p7ZyObxUH0cxPLjqlrrVXibZWPn11udw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5174

On Wed, Jun 21, 2023 at 10:07:20PM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Tue, Jun 13, 2023 at 10:32:26AM +0000, Volodymyr Babchuk wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> 
> >> Introduce a per-domain read/write lock to check whether vpci is present,
> >> so we are sure there are no accesses to the contents of the vpci struct
> >> if not. This lock can be used (and in a few cases is used right away)
> >> so that vpci removal can be performed while holding the lock in write
> >> mode. Previously such removal could race with vpci_read for example.
> >> 
> >> 1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
> >> from being removed.
> >> 
> >> 2. Writing the command register and ROM BAR register may trigger
> >> modify_bars to run, which in turn may access multiple pdevs while
> >> checking for the existing BAR's overlap. The overlapping check, if done
> >> under the read lock, requires vpci->lock to be acquired on both devices
> >> being compared, which may produce a deadlock. It is not possible to
> >> upgrade read lock to write lock in such a case. So, in order to prevent
> >> the deadlock, check which registers are going to be written and acquire
> >> the lock in the appropriate mode from the beginning.
> >> 
> >> All other code, which doesn't lead to pdev->vpci destruction and does not
> >> access multiple pdevs at the same time, can still use a combination of the
> >> read lock and pdev->vpci->lock.
> >> 
> >> 3. Optimize if ROM BAR write lock required detection by caching offset
> >> of the ROM BAR register in vpci->header->rom_reg which depends on
> >> header's type.
> >> 
> >> 4. Reduce locked region in vpci_remove_device as it is now possible
> >> to set pdev->vpci to NULL early right after the write lock is acquired.
> >> 
> >> 5. Reduce locked region in vpci_add_handlers as it is possible to
> >> initialize many more fields of the struct vpci before assigning it to
> >> pdev->vpci.
> >> 
> >> 6. vpci_{add|remove}_register are required to be called with the write lock
> >> held, but it is not feasible to add an assert there as it requires
> >> struct domain to be passed for that. So, add a comment about this requirement
> >> to these and other functions with the equivalent constraints.
> >> 
> >> 7. Drop const qualifier where the new rwlock is used and this is appropriate.
> >> 
> >> 8. Do not call process_pending_softirqs with any locks held. For that unlock
> >> prior the call and re-acquire the locks after. After re-acquiring the
> >> lock there is no need to check if pdev->vpci exists:
> >>  - in apply_map because of the context it is called (no race condition
> >>    possible)
> >>  - for MSI/MSI-X debug code because it is called at the end of
> >>    pdev->vpci access and no further access to pdev->vpci is made
> >> 
> >> 9. Check for !pdev->vpci in vpci_{read|write} after acquiring the lock
> >> and if so, allow reading or writing the hardware register directly. This is
> >> acceptable as we only deal with Dom0 as of now. Once DomU support is
> >> added the write will need to be ignored and read return all 0's for the
> >> guests, while Dom0 can still access the registers directly.
> >> 
> >> 10. Introduce pcidevs_trylock, so there is a possibility to try locking
> >> the pcidev's lock.
> >> 
> >> 11. Use pcidev's lock around for_each_pdev and pci_get_pdev_by_domain
> >> while accessing pdevs in vpci code.
> >> 
> >> 12. This is based on the discussion at [1].
> >> 
> >> [1] https://urldefense.com/v3/__https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/__;!!GF_29dbcQIUBPA!zPy31CWFWlyC0xhEHiSj6rOPe7RDSjLranI9KZqhG4ssmChJMWvsPLJPQGTcVsnnowZpP8-LaKJkIWIzb8ue0DoYhg$ [lore[.]kernel[.]org]
> >> 
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >
> > Thanks.
> >
> > I haven't looked in full detail, but I'm afraid there's an ABBA
> > deadlock with the per-domain vpci lock and the pcidevs lock in
> > modify_bars() vs  vpci_add_handlers() and vpci_remove_device().
> >
> > I've made some comments below.
> 
> Thank you for the review. I believe that it is a good idea to have a
> per-domain pdev_list lock. See my answers below.

I think it's important that the lock that protects domain->pdev_list
must be the same that also protects pdev->vpci, or else you might run
into similar ABBA deadlock situations.

The problem then could be that in vpci_{read,write} you will take the
per-domain pdev lock in read mode in order to get the pdev, and for
writes to the command register or the ROM BAR you would have to
upgrade such lock to a write lock without dropping it, and we don't
have such functionality for rw locks ATM.

Maybe just re-starting the function knowing that the lock must be
taken in write mode would be a good solution: writes to the command
register will already be slow since they are likely to involve
modifications to the p2m.

> >> @@ -213,6 +227,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
> >>      raise_softirq(SCHEDULE_SOFTIRQ);
> >>  }
> >>  
> >> +/* This must hold domain's vpci_rwlock in write mode. */
> >
> > Why it must be in write mode?
> >
> > Is this to avoid ABBA deadlocks as not taking the per-domain lock in
> > write mode would then force us to take each pdev->vpci->lock in order
> > to prevent concurrent modifications of remote devices?
> 
> Yes, exactly this. This is mentioned in the commit message:
> 
>     2. Writing the command register and ROM BAR register may trigger
>     modify_bars to run, which in turn may access multiple pdevs while
>     checking for the existing BAR's overlap. The overlapping check, if done
>     under the read lock, requires vpci->lock to be acquired on both devices
>     being compared, which may produce a deadlock. It is not possible to
>     upgrade read lock to write lock in such a case. So, in order to prevent
>     the deadlock, check which registers are going to be written and acquire
>     the lock in the appropriate mode from the beginning.

Might be good to put part of the commit message in the code comment,
just saying that the lock must be taken in write mode is not very
informative.

/*
 * The <lock-name> per domain lock must be taken in write mode in
 * order to prevent changes to the vPCI data of devices assigned to
 * the domain, since the function parses such data.
 */

> 
> >
> >>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>  {
> >>      struct vpci_header *header = &pdev->vpci->header;
> >> @@ -287,6 +302,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>       * Check for overlaps with other BARs. Note that only BARs that are
> >>       * currently mapped (enabled) are checked for overlaps.
> >>       */
> >> +    pcidevs_lock();
> >
> > This can be problematic I'm afraid, as it's a guest controlled path
> > that allows applying unrestricted contention on the pcidevs lock.  I'm
> > unsure whether multiple guests could be able to trigger the watchdog
> > if given enough devices/vcpus to be able to perform enough
> > simultaneous calls to modify_bars().
> >
> > Maybe you could expand the per-domain vpci lock to also protect
> > modifications of domain->pdev_list?
> >
> > IOW: kind of a per-domain pdev_lock.
> 
> This might work, but I am not sure if we need to expand vpci lock. Maybe
> it is better to add another lock that protects domain->pdev_list? I
> afraid that combined lock will be confusing, as it protects two
> semi-related entities.

I think expanding is the best solution, otherwise you are likely to
run into the same ABBA deadlock situations.

Thanks, Roger.

