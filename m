Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015956FC700
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 14:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532174.828243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMkf-0002sj-PP; Tue, 09 May 2023 12:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532174.828243; Tue, 09 May 2023 12:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMkf-0002ql-MW; Tue, 09 May 2023 12:47:33 +0000
Received: by outflank-mailman (input) for mailman id 532174;
 Tue, 09 May 2023 12:47:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSxc=A6=citrix.com=prvs=486b9cf0a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwMke-0002pI-6H
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 12:47:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a78cfba0-ee67-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 14:47:29 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 08:47:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6590.namprd03.prod.outlook.com (2603:10b6:510:bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 12:47:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 12:47:17 +0000
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
X-Inumbo-ID: a78cfba0-ee67-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683636449;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LpLOEd0MUaX+8R/j7ZUV6UhwMA5YT1XIl3diOMCxcwE=;
  b=Kghwq6aIROqRkmmbg3YYyFkPK+l2H4j+BmwTVsL/a+O4qadSnU/io26E
   rtwgosr168mWZblqWr92zLDbYAhF5tB2UYXnVMc+T1E+tDgs92WiJtrKQ
   0IQrlHaUUe8JcIPAPfgWZUm31qHt9eTYYsl4xfSyUih6IeF+/3dJ5g7hD
   8=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 107140754
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hPtvparieGBD/L2l0FUf24D2M89eBmIkZBIvgKrLsJaIsI4StFCzt
 garIBmPM6zeYzD0KN1xOo7i9BwB757Ux9MyTAprpXtnQSsT85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyhNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD4xMzSsnNmu+6uqZsRL2MklF9K3MpxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqEz3AXMmzB75Bs+f2GE//uhrhKHcd9TM
 EU/pCBzn4w0+xn+JjX6d1jiyJKehTYbX9NeO+Q38A+Jx+zY7m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WpDW+IzkILkcNYCYFSU0O5NyLiJ43pgLCSJBkCqHdszHuMTT5w
 jTPpi5ugbwW1JcPz//iowGBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHXlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:AP+3g6O1lFGo1MBcTnqjsMiBIKoaSvp037Dk7SFMoHtuA6qlfq
 GV7ZMmPHrP4gr5N0tMpTntAsW9qDbnhP1ICWd4B8bfYOCkghrUEGlahbGSvAEIYheOiNK1t5
 0BT0EOMqyVMbEgt7eC3ODQKb9Jq+VvsprY59s2qU0DcegAUdAE0+4WMGim+2RNNXh7LKt8Op
 qAx9ZN4wGtcW4Qaa2AdwM4dtmGid3XtY7sJSULDR4/6AWIkFqTmcXHOind8BcCci9FhYwv+2
 jdkwD/++GKvvyhxgXHvlWjn6h+qZ/OysZjGMfJsMQTJzn24zzYHLhcZw==
X-Talos-CUID: =?us-ascii?q?9a23=3AB2peZmjKs2elDg/QdFZawCAJqjJufEGA6FjLGFe?=
 =?us-ascii?q?DEHdFZZrLRFmr4/9qjJ87?=
X-Talos-MUID: 9a23:+fEWuQlfTqNbGlwb1idJdnpIDvg24byKVHknnJkdsuLaP3FCHzGS2WE=
X-IronPort-AV: E=Sophos;i="5.99,262,1677560400"; 
   d="scan'208";a="107140754"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXODCYkUa0V1PDCahs8rEguJm+eZMCePeZ+Qcoa4vR3K1kUHLnEg0MRXXnLE+BvN+ZbHmq0D3oq/GW0mYlaC5Tl2sDl3xpMQ3rFjCNg0AZITRQoIMcyI89Dpl+N42G/4QaX2Br/GN+6b40A5gS6fFCA0EEwtCqqGh7dosYqICM9NeCZct78vCDaZWAlVJF9ebDD1CafkJuMdzt1wdvIqp72kn1SXsUHA/1HLBy2UmJJmnxTa4X79A07gntO0f418PcG4e+jtEtckLv0bxLQ7I2SgMSk0/kYwjiFoqHHvseyqGDytJuAez0SmsiXXHss2Hz57mJHafifIdk/gDbCatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrt8osdwbVzW+5B6L7lGqi/dGheX57n61YDc+SVC4xU=;
 b=Fr1XP4mvtXLOR8Br1UO1wdn2LsMpguUOokKIJo1kUWPGp4yOrAHBtt9hkO8untzQcuEXCAEOxN4u07PWFoxqRjUoVi8gX+1o9z6BPUmTA8OjiLFORbbz40JKOlSb5SnMGMBIofDB4cDyxmk8ATMa5pHzeoQDMQZUIVKWnosqxAxPyaQnA2xzmbosl/AOG/xIGHoE1GnRagPboQvPblcprmPrpJtLfV1kmZELxzZnKQeJdo4EfHUnU4H8W+XvQcJw1ljUjvZzOewM0jXYoLYiASExQSxewNDJ6a2IVt487KHTHEkpSeJ5qdX7Leg/FaQtzh3oSExrN6mtjX2rhXfteg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rrt8osdwbVzW+5B6L7lGqi/dGheX57n61YDc+SVC4xU=;
 b=aXhX2j2ZXHDiwUdavcrbzE7uofHvBP1RsSL+nMRkpauuIoCSdQPcrig4DosgpurZeTTy8NvaDUkrShj+gmWn5ylWfVuWWns+UzvkDFXIfUKXVWO80WFcLASHPNDJCOKICuYw+wnTsDslFGUXNPKwgIeFfS4Omr3/1tL7k73wvpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0785a316-1920-f5de-61d3-ed21ddbff0b9@citrix.com>
Date: Tue, 9 May 2023 13:47:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] Fix install.sh for systemd
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230508171437.27424-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230508171437.27424-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f2066d-1acc-4129-06e4-08db508b8506
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1na7UNiqRbLaKbX03dmduWnyGOOJc7lAYq/LOvLMSNqMFiaTZG6A7T+nrNas9lbeijtpj6KOocOfQgVTiHWivjL73EzZLCCDgdab4atM+0WnIqC20Z8fmTLnNlQDZ0xOUNE+Xtw+6sUvWQnsA260fU+EdSWe7xQplUIQUyKOlDpzZa+mPq7IVp8iTncPMRGfPgXWHLyjXb25zOgCXxGiMGMP7w9RthEVJirMj5dF+4GgTvGemCUYBRgRiLQRWlr1SMtGdAQpFRY+oUHVXvqBPSSQGiN4nPJELCdTnArVn5Vvkf7gsQHhNGnl3MBhV1sLKkc/vvNhfJGhUMGBYuQB7LK6khYuGv10dD//OdqkWMOcTBuLtRsju3DpU3pC5AxNY8qmKL9XIbQOI75hjSDr7tLAzeEdPQcnynQ1D12qQjdRr8n3i5DFf6J/qQ8+lVa84jJwOLplXT57rIEgwYQGV/TRJmD/ZQWQmrhy9163lvYWCatQ+rvjw/KPherPGoZKrM0lWTd/C7OA5vFTeTC7tw7zU0ZdZU4SEcFaTQDtW609KPF0MyUc4ar8x/PWXXx5Qrn3VdNEXNnXoddT2XXVQzHuZKMTiNqmOYqzvQ4TUlo8lZi07U1rZfQ8znq6OGWBGwYEY/kijPrW0ddU3Wvgnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(31686004)(54906003)(4326008)(2906002)(8936002)(478600001)(316002)(66476007)(5660300002)(66556008)(8676002)(41300700001)(6666004)(66946007)(6486002)(6512007)(53546011)(6506007)(26005)(107886003)(186003)(82960400001)(83380400001)(36756003)(2616005)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0wvdVVRUytveE5FQWJUZlJPR3JDQXdDVFQyNjRZZXM2dlo5Q2VpVnljbGFh?=
 =?utf-8?B?SlVrTHp4aHZxV3RjQ3h2YkdaK0F6Y0JOcENJZVZoNVk4OFlTTEtFaHhialNU?=
 =?utf-8?B?UGd3eFRLc2ZDaDBxTVU5QVZRNnM0RldSdmxlb3ZHdkp2S3RQWTYrSTFBVWFl?=
 =?utf-8?B?Q1k0Q1FwR1c2YnoyaUNvUHcwMVZhYlpQYmZnQXdnc1Q2M0Qza3dVWDQ3Q1JX?=
 =?utf-8?B?cVkzNzBpNVZJZDZtTEhobDFRUXlLUi9TdE5EWTdDbG91VUV1LzhqOU9OY1hm?=
 =?utf-8?B?aEpPaktNZEg5VTIrRlZlRlBQNFFrNDZLV056b0lWYndEK29uU2JHK0ovSTZZ?=
 =?utf-8?B?S3NUbzhPQWhBWEppVnRsV2VOSDErM3kvSERlTHlUNDNRa3phODc4NHVuazBX?=
 =?utf-8?B?OXZKMDE3SXM2N3FaQjdlQkpvbExPZnhxOWhxZlpYemYrOENLT1A1Q0lkYzZW?=
 =?utf-8?B?dHE1dVZqV0pMZDU4Mkd1Snk4dElUR05nY3FFa05rSjZUdUdxNmtQaGV1MFBZ?=
 =?utf-8?B?bTdnMEloVGFINGEraE9YamtrMThqZ0FYZU01c2I3bmZzZi94R0ozRGlRblZt?=
 =?utf-8?B?S0xQN2dpTTIzaDkvakhaK3dINURsVlpGVlNMNDdKczRiZzdwZmhPRW5KN2F2?=
 =?utf-8?B?WGlidUc4MDlOUmVYMFdWNkx6TjNrTyt0dXozTGR3RUlzVTVHWkttY29ydURW?=
 =?utf-8?B?UjN4Z240TnBLZVFoVDZnSkdpbmRHLzhvdmR1ZEJXSkFwcWJSSlZNS1BuSHRP?=
 =?utf-8?B?QU5mVGJiUTA5bk5DZjYrQWowdDI4MUFwSkdubEw4UTVlZVI3eG5rdXRtTE1S?=
 =?utf-8?B?bGtBNm15am0xUVdxWkNwRDhPcEFvd1RGZU5ZU2JoWDRqaFVMMVFQdFlqemhp?=
 =?utf-8?B?ZStEU0k5Mm9xaXBTSTNVTU9sWG95UnlZa015RG10OWJzZHQ3bXc5ck1Ocktn?=
 =?utf-8?B?ZFUvL0hlemtqbFNrZ1lrZis1MzFCV3JseEFSNmpUTzRVNUJaRy9BWXJyTi9E?=
 =?utf-8?B?RkZHRGxDNVZSbnp1WWhleWtlYjZjQjdkMVFTdVorWWpQOUJMOXR5d3dNVEVu?=
 =?utf-8?B?OW1oZkt0Q04rZk90NHp1T2dRY2dsVytDa3A1c05kWWtTa1kzci82bXZXR2Vr?=
 =?utf-8?B?SHlrT01kRk5sL0hUc09pY3c0TFFnOGdQVDFwN056bzIyeDBZMUhtSklZNXVt?=
 =?utf-8?B?UVNOdDZKcjN2Um9POWNFOFk4L0g0NDM4UGtEekxmV3ZZV2dDZlZ0ai9XSmds?=
 =?utf-8?B?dWU4YWFab0xsaktuYURHdFFDTTVUYUlOdkNHbWowWlZHQVd0WHVERzQveGw2?=
 =?utf-8?B?SjNMVFBGZ1hLY2FiRG8yc0ZzVkpxUFE0ZmRYV2FGZ2oyb2JxbVYvUGhRalVo?=
 =?utf-8?B?M0plRURYU09mRWJjNFVXK2xmbHBnY0E0cFV3MnlsVERhK01KVkFFRU83M2Q1?=
 =?utf-8?B?bGZsQUpCZ2pqMWxkM2J0alhpd28reFlnd2p1dUpmbXpERGdGdjc0am9UbWJn?=
 =?utf-8?B?V3BXb2JDY0ZqYXBnTVk3VGxxUVdHa3lQeTQrY2NOUFl2OFNoRnU1V2JIenoy?=
 =?utf-8?B?T2tjbTdjRHVGMUhEZGpMbE4xTmdPenNweGNtSzVkbnN4YU1wQmR0MWk0eU9u?=
 =?utf-8?B?WnlXaUQyeEQ5MllEZEY3R1J3WXdEaUpseXVqTkRid3RyTmhwZm9vQnowUnNI?=
 =?utf-8?B?eTNtTUVNNFhKd2NJSzhBSTRQQmw1dk84RDh4K2lzRXBnc2xDNGcvcG1uL1lM?=
 =?utf-8?B?ME83aSs1TXRWdFJQK2RJa3lyVGp3clEvN3ZoRndnM0lEc2Y3cGEyRXlueXRi?=
 =?utf-8?B?bWJKRG9Mb25hRGUxajdGeEJqWGx4YmpXTXhHdSthY2ZRakJjU0x3dFBlcDdN?=
 =?utf-8?B?c3pOMTc5VW9KdGRIeVBSRUhjbEZEcHBUU0QwM3haVU5CSlQrSnJrRG9jRVJQ?=
 =?utf-8?B?aVI2N2RoSkk5eC9KZ3JCY3RiWmluOTNDZGMvYXlnenpnOS9PY00wL3lmVHdF?=
 =?utf-8?B?SEFWTXBVcGY1ejF3Q0M0amR5Q2RQeGFlWDFqbFkwOTFxVDY1YzJibGVRZ1Jp?=
 =?utf-8?B?SDQzMHdGNFJRczh3dnFNc0NYMWZvSUJENnI0NVdzZGdvTDRvM3V4SHQyOXRK?=
 =?utf-8?B?eXZDd1VDZlFiM24zai83NmZPcnc2Q0hHOXZ1Z1d0RzVqcStFRVpyMjhqQy9k?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vFjWc418nf9Kf88DCrLRhUQptbAZc4HCoEJqLpY0OuNFFtujpz2DkE8WKVA04AbKJfAulVjw47/PPCaVqtxrny/bKmfkOOyFERtX9oS7ReDpL8G93nFF9WThuIHs7Q0EO/rmJqpMEYNsEppnh1dJ658jvObQPzLjqMgWDC4HhBivtFY4V6ue/DyRwdAwUB/TqSAa7gLfFYvawIHvH8vKBJVq8yCA7BtBiIxfMfzjI0bVaVvrEXPSP2caBUIpJaAOYgFi7lPBK+Rsn6KPPk+QyfpWDI7uQai7/Ku5WYlKUI4LTUep9JKBPIvWqlkgNyACYSBDsA6Wku2pqyC3F9OIDwh0cMF0dj09BL/UJ3i3pSoPkmuO3CnCeZ7FlVrto6i1OiCr+2QwqFwRVuOhU9ntYchg8d/oJq3Wv9ifOIsbSRL48+j3etgLAHXEmf8aiPxlo0r05sPOCrOok6zBYXp8iAtY97lLYFANx9wJJyOwX/kD3BjjP3hz+N6lzDlGny6XZCTh8tXIH9UGTCiBrwq/dg7u71yAoT/rdcvVwcXyvb4ci4oCh5yzUBfrD8BSifEC+IyQichIG1LtSb0TAQJolsinlcnsh5PZhKrQy/ssrOL3OvyRmBLFCp51gP67DY0FKOtvrCCu5MPe9u69b6vTLXycf3i77k4BKwvt5SCVCIT+JUP5nHxC9SeMm2xBJRHRamXlSGE1y4jayUsj1cZfR45w7zW0CLSLyey5ugoBXN1upHXZu9JELHLzxXt6OgQyPrmeahUoRVwbEcvKvo0v2YpVZHQFgoyILbN42KueIHMMb0cIsJXK4qszzmtkOErpVzjZ+Gw8PhAacAAwnUou6IJgHIIgPI5jtO23H+6DO8M=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f2066d-1acc-4129-06e4-08db508b8506
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 12:47:16.9960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EugyueS/cygIKTH5GQaqYM5Cpfgos3M7UHqS2+TcJ3JRlapopJMVbLQfdHBqDl5EErf5x+TApc9x1/e6GjHHr64vg8CllKrVJPIKsLziBck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6590

On 08/05/2023 6:14 pm, Olaf Hering wrote:
> On a fedora system, if you run `sudo sh install.sh` you break your
> system.  The installation clobbers /var/run, a symlink to /run.  A
> subsequent boot fails when /var/run and /run are different since
> accesses through /var/run can't find items that now only exist in /run
> and vice-versa.
>
> Skip populating /var/run/xen during make install.
> The directory is already created by some scripts. Adjust all remaining
> scripts to create XEN_RUN_DIR at runtime.
>
> XEN_RUN_STORED is covered by XEN_RUN_DIR because xenstored is usually
> started afterwards.
>
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

TBH, I think this goes to show how many people do `make install` by hand
on a system, rather than using a packaged version.

One query...

> diff --git a/tools/hotplug/Linux/init.d/xendriverdomain.in b/tools/hotplug/Linux/init.d/xendriverdomain.in
> index c63060f62a..1055d0b942 100644
> --- a/tools/hotplug/Linux/init.d/xendriverdomain.in
> +++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
> @@ -49,6 +49,7 @@ fi
>  
>  do_start () {
>  	echo Starting xl devd...
> +	mkdir -m700 -p @XEN_RUN_DIR@

Why is this 700, and the others just using regular perms?

Also, doesn't it want quoting like the other examples too?

~Andrew

