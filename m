Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791BD727BE0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 11:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545224.851538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CG6-000510-Sn; Thu, 08 Jun 2023 09:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545224.851538; Thu, 08 Jun 2023 09:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CG6-0004zL-PM; Thu, 08 Jun 2023 09:48:46 +0000
Received: by outflank-mailman (input) for mailman id 545224;
 Thu, 08 Jun 2023 09:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydti=B4=citrix.com=prvs=5162bf623=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7CG5-0004zF-IU
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 09:48:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6844137-05e1-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 11:48:43 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2023 05:48:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5026.namprd03.prod.outlook.com (2603:10b6:408:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Thu, 8 Jun
 2023 09:48:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 09:48:33 +0000
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
X-Inumbo-ID: a6844137-05e1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686217722;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=otLtSthc3/zbrH7rJpdBQ7hJg5KtQblmMCWQORN/gi8=;
  b=gklKX74eoMwq8j4k+9Z/MxEuiCf2nPT0Y7SbwRa5seiIeQ/0NDAX6wG1
   TXED6uh/lGT1AuNBByxrLbI6d9IfbFEbtHyyv02pZm4I7TS58l77Vhb3z
   DyAskeKXKwuz81719g7Wz0rHWQ3M4x8mi+xG1c5F2Ou+1mzSfcG9F6Xwd
   E=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 111366894
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VqRgeKPB3Mux2BTvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUp0gTUBm
 DBKCG/TPqyCZGWkftl/PoizoxgB65fSm9E3Sgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gxmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t1lH0Zqz
 uIYEzlXYhaz17/vmvGQatA506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxHilBtJDSNVU8NZrmk/J62YUMCY8RESarPuDgBCafd92f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBSBRf5dDm+ds3lkiXEo8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:9ap46awWlAdM/x1zkyBiKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AHP/LuGnsda7JFlhoHd26YdIRPobXOUbP0lD0GFG?=
 =?us-ascii?q?4Mm8zRLulGQLJouBPs/M7zg=3D=3D?=
X-Talos-MUID: 9a23:OV53lAu7ytIfgxsQfc2nhStwbupi5JyVIlESsJgEgcPaEQp9EmLI
X-IronPort-AV: E=Sophos;i="6.00,226,1681185600"; 
   d="scan'208";a="111366894"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkr8suNJJOKTUQrfjHYzdYRO0oT32zCBGbX4FCyGOpjmZ57cWhPhusjmmr1RSyuz3a2VukyZ228gmwYpjbkm/DPXpE5FP0cB/SQB6/K24OGcX5B3Wx4ckIH+WifCfdk1yRl189Ty+j+PgJdoY8V/RGGQKctExFO9Vg8+VSBB0vz05iHIHEkr9K03SYgPAZjXT4ClnGlxdXRZ+rZ1Rtl66ZSmdf4lE004JaTC63G+CQe0G6pIkeKO+FgczWxxTEK9o8iQyzjSNgBs6VfKrx1A8FjYmwDgddNQN+pfCuNYMUgzHrYGIen+GjzwobNi6S07nJoZ1g6nFc0p5Szli6nToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnX6xQdZ+BbyTiZmTs7DyQy14pw7XGe9QvfyLNYMAHw=;
 b=k4Sbdm8RU9oXFGWjorkTRu2fLgsXBKY3vSm0/WDPR1uwoWPRNbOUFtz+Tqymf1Ps1nrlGTNFKnTShYY3ZfPS9/sozFTMr5O+4UxF0BbbIAc5iNTI1WufMIx18T9hnD+wjjUEKv0b4DwL2ldqhgIProqLA2QZXvkDUMgjjQL9/9Jc7VRebM+GDGf4DsscwjiZxkIoTc+pm/d0w8fXw79Kzmi2OmwKFuGxxYI96/bPZkvQm9lJHDmj9s0K3vKKP+XVfe6ugp9Qi/Vbq27BHFhW1711vVjClmGBjQnZf4Rgk/vA8LzGOeVwbtCEORBvm0gs2GMH06NLzkE61NDW/i/Hbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnX6xQdZ+BbyTiZmTs7DyQy14pw7XGe9QvfyLNYMAHw=;
 b=d1++bULv4D3Ox3FoCcHPgvgg/8w2fh6frA90QrddDHolY9LjwxqRzCMYP6udBRcUW2GiuPozUFwR382XAL6BV0v0qBpHdXBHWNM7JXuV5zJ5OpeyWq9W5zFN8mADW4j9EfzVW0n5MVFc0wmHCh9VIun0o2FhJ18tm/AjgBXV4hA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6f5bfe07-a0f1-e05b-b727-2dbc19d06369@citrix.com>
Date: Thu, 8 Jun 2023 10:48:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: print valid CR4 bits in case of error
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230607134638.53070-1-roger.pau@citrix.com>
 <728efea9-2d30-fa55-473f-df3a18742ace@citrix.com>
 <ZIGJ9ZYlGQD/oydT@Air-de-Roger> <ZIGLhhIHcydMwT9Q@Air-de-Roger>
In-Reply-To: <ZIGLhhIHcydMwT9Q@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: 46107d47-546a-45a3-252c-08db68058592
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jGgCObX2BQBiSOFYibCnHeJcDKIjyYxWIxO5rEnzG4v9rHh7iUpOlK32t5gWTvxbXh4tfSTvK84hvn+ZsStqevWpcotjsV4uTX6KiyjGiEUbj0Clyu/TzFdTJxcinuD8+LqL3F5mp+jx8dS9L9ivVETOibqDBkLJpAlGmLNizCU/DK6ahNIDbznb5r1JSjD+7pc1CccJu7+LkADnSrn03YDC/8K5qMsZk6Hn1R6XSgoY+JJJxAOu7FGiyNbctmAY3bQmsnnwZ1hrVurnMjN9EGJd22krOzZhz0/x4pVb96zGlwCwSVt7BBZQpsHFmEcsxtSAbs8uWztRYb/RX6RMDYjoYc8pcNVoyG7kjeo3sffDfyTpZw3a7KqKo3BWJMT1CI4N/42dEJrJ3O8VO7niqQW+g1cl7fbtIHc6DIHAp4Dd2hGtR4KuItZQwry0P96+BauVUdliOAEbNeJec6WQMQYf3jXtVDadMxOZ+T0xTUQ35+hjGWHeM6R0YC2tZ2j2OPAR7Lmh6NMrMKM+s5eP0dQ06UAzk5I42yKoYAOKZLARX5ZP94Hx9aapvr8QCXLQQ1XCNlremBpWDYb6B8IXRcxNVCaJKO181x7qNcUIKnwj2u34srsDwAf2CSpgBFQazj3cyz8O4+sRfcey5XkFMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199021)(26005)(6512007)(6506007)(53546011)(31686004)(2616005)(83380400001)(186003)(6666004)(82960400001)(2906002)(66946007)(66476007)(66556008)(6486002)(5660300002)(38100700002)(8936002)(86362001)(8676002)(37006003)(54906003)(36756003)(478600001)(6862004)(31696002)(41300700001)(316002)(4326008)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y215K1hQWWc3WGpWNldPKytwa3o2d2FrZ2lxWExkYUpKNmx6TnlzMVZadmNJ?=
 =?utf-8?B?OVNGK1luREx4NHFlZ3ZCSjNOREJlNzNNWDJ0aVFHVjRZNkdCWXgrYU9xVXIv?=
 =?utf-8?B?SEZUVGxtM1p3Unl0TXpSQitIdUk5MmJrdEZMVmtrSlNhVGo0VzFZWElBZW1U?=
 =?utf-8?B?TFZTdGt0OEF4MmVjNFNidlJBMksrZnhjeS9rUnJrWm8vNDNvbGdYREhvcU11?=
 =?utf-8?B?a2RnOGRGZkFzbDJia0NPUEpwcG1TcUw1c1F1ekFLU3ZXTGtpQ1BEV0VET2kw?=
 =?utf-8?B?K1dISEd5WVJZbzdkWHdQT25QUUUvSzVmOHJiZnFuZGFwbUZxcThMQVRVL2tO?=
 =?utf-8?B?RDN1bzFweU5lSUMrQXJuUFJGODQ1MExHYVdtRWJuMWh2SGV4UG53d1BEV3A5?=
 =?utf-8?B?cnN0UVVqQ253Y2tOZUxLeXRjaXBMbmM5ZlpWZTJqaUZCUDhXcGpxTFBnQm0r?=
 =?utf-8?B?K2VNQ09DM0NPaTNKY0dFTUk1ZEhZYlZxSFBYQ2ZlSlBHajAyMzdqbWFzeklE?=
 =?utf-8?B?VjdVUnh6SGF6K3hNcW1DOHFJbE9JK0s1TTJPTGs1RnV0NjBENGllOGNySFNQ?=
 =?utf-8?B?My9EdXZVd0dkTjh6Z2lXcDNRaStOa0RaMm8vUFNTcitTK1VxeFJ3UmFGVURq?=
 =?utf-8?B?MFNZcThEUkw3MW1mVWJoMlhxZSt2c25vTE1GdTE3MUV1d1BBc2lrbEpsYmtE?=
 =?utf-8?B?QjZDUFB0MGpUcHZjYUwrRjhjNmgyWnpBYTlhNWsxUTk4VG13aDJPa1MrbXd4?=
 =?utf-8?B?VWh6R2MxYnJqNklGNVhxcHM4UEw5SVV5QWduaUpjendVM05BM2pPMDNCeG12?=
 =?utf-8?B?WndjT05OdHJFK0xyck1uaUlaeFlyOHlOclVYa21lQ2F2WWFyOHdOWGlxVEZZ?=
 =?utf-8?B?Ymg0YmFyZXFKbEcxV2QwZWFpN1lPa0kzNEpNODFjczl2VlB5YnhoZlFXcDFk?=
 =?utf-8?B?VkxKY2Ywc05xVnNVNVlCV0pJNE50OWFqWmFEdFMrVHBXTzc0L0xEZFNxd3pB?=
 =?utf-8?B?TUdYTDNobURyRUVYZmRTYUNLT1QyaFJQbXpRNGc0QTNFZHNXMkFLWUtMNWJ3?=
 =?utf-8?B?dVFISVFCc1cxdkJCcjRGTkdnM1NZVEdyQXl4aGJtTDZpRW5RVi9GY24zS3dn?=
 =?utf-8?B?WlZGZDhUV3BNUVVkVlJ0K0RVSDFaK2JCSDhRaEFPUHRTb1lHT3JJZ0ptSm9u?=
 =?utf-8?B?T1lJd3huOUFTKy9UUGVsRlpXd2RFVU1LaVI0bm5RelpKMFdnMFBlbHRodmZl?=
 =?utf-8?B?bWZYZW5PeXEwbFhqT0I3UGoySDVBa1dVNGlEdS9lUEVqaXVpOXUxT0xaR2g0?=
 =?utf-8?B?T2NlSE80VGhZaXJTMXlIWVg4OWdEVUxac1hWd040c3czMHFhRzdyT1dYMnZR?=
 =?utf-8?B?UTdjRkFSY21wZHRDNmpjOVgrVWR5VHpwcGpaY3U4bWVnT1RSa0w3TXBQejZJ?=
 =?utf-8?B?Z3BIZ3RuYkdRN3gwZXR1T3UybC9kQnhpVUFDYkNveitQTW1rTHg4QTVXdkhh?=
 =?utf-8?B?SXQvQjRaRXhFZ1B6WTZKOVFxUmUrYWVIMVF1Qk85TUdOaFRCeFJuRmM0MHVh?=
 =?utf-8?B?Sk1KL0ZWQms1U1FpZzhucE9JWG1UVGRDd1pDOHgxVEtsMWs5MkhjaVpac0tC?=
 =?utf-8?B?Yzl2OENNQTFibVdqa1RWcGhMQTduam1yR3ZYdlg2N0MzZzArRVpObC9GQVFj?=
 =?utf-8?B?U3B6R3hiMkROMXN3WEVqMGt0Y1UrMFNMRzRKZURxcnVZd3hxcTRSQVZlYW8v?=
 =?utf-8?B?TGEvczlEUkJIYUdnMmlNMVZMRnlyYjNraEhVa3dBVXgrK0VkUnJIMndyR2E0?=
 =?utf-8?B?RjNmS2lHZ0RCWDBReDNjcmIrQ2FaeWs2NXN6bXZXdGhjY29MelR4TDZWRFlX?=
 =?utf-8?B?RGZMS050bUJjVUVJK0xCSnFoeW5LR1BYSlBSdUUzNUh1U3V3SHNTQWVVV0ZH?=
 =?utf-8?B?eWNZWWk5dTR6L0dST3ozMGVESWxMUTJqOVRCK2Z5R2NxcFljTlN1TC9WVDAx?=
 =?utf-8?B?VVZrN1ZlbHc4WkMyMC9JQXFreXpmb0lZNGh3VTZHejBRdDlzNEJyS2dkRm9C?=
 =?utf-8?B?SHdMNys4cDF3LzlyWklFUTVBOWZoSFA5TWhJZUVuWTZvOGFUdE1uQTlCaThi?=
 =?utf-8?B?a2pSd2VQc0ZodFpzK0YrT2ovQ0dOZHhyZUZOREJVVitkR3o0OUFWcmk3NTNk?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	agNemfOTOoC6Q9ilBI7/iFrHC5E/j3e7tdovgAGDr+pXUZUg/Eb6UpUQpEgNCwKg05JeWfPGOiHQLy6IHQNJxfHTTSN4udKmB7EHguVjWBsyVQQjkzqMZNE09e0pSx6FfPvVKH755TMsotyNRFZkfTEWK1VvR0dVGQhtZB+uN61BTjpwZ35F58wpJy0L2PofOgopTTPMXtj6tugnXo/Pb9ZDyd5BZ7/HYuYFJwYPySS5q6laT47SRlM2QO+7EcgfXJjapj7071f3h5MLfmtdsksAX9/BPDAWJa6DKjaqyDmrZyd+n4c8tVJ6R/WlBwnYw6WzD4hfEIshtaHWkr/ljWfbUWNgPltuvbxDhpgkyO6oFCzsE36HRwvCPfXsIdFxXaQwo5/WDVwpG1TOyVa9n28868RnQVE/qAEnt/yzmR1jFOfB1HKrFzPMwQ8XOlimQyDS1WGrHlfu0X3M5Tqu3AZ846BXTzIV469Sa43Ua6apG63Q2zN2oykLw/iPWQbiLU5cUN9K2pfOXY+J+GydKEOrhHNOcDzbGTNRwZ7ec6ekjWNxZTC3j8rdNQ94EkHTQ6Z8z2ztFiVPExZWNMu338o0b88Zh9hps06T6B5BeDBjiFFRadig/KmgNq0v5QXPXSIOcjKm/C0G/t1lMeeoCxhZomSKf91QBSMH+tbFTz9BPlJDyn8Zyur4wB9Zn5AzCJlM/dDFOc0EmAKOfHli532/YqnIkigi+lJVz8dlEJWb0jkGWsVP/xHaO35rkFpXP4Fvr8+mGMeoXKjjQwmmodbqmhi5DhdQvTkuhbJcyEU5+5SOV2pS/rp+3xPtmd5w
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46107d47-546a-45a3-252c-08db68058592
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 09:48:33.1242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfVX42iJQHhX03bH23RIJ1JiiNUTD+CBKHp+uwjhSDRsAsO7+HlgssPAw5ZgVMVa/ABq33gg5jI7ht8dHmlrB+5SNF/l20pC3q1lym2P6w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5026

On 08/06/2023 9:04 am, Roger Pau Monné wrote:
> On Thu, Jun 08, 2023 at 09:57:41AM +0200, Roger Pau Monné wrote:
>> On Wed, Jun 07, 2023 at 04:48:42PM +0100, Andrew Cooper wrote:
>>> On 07/06/2023 2:46 pm, Roger Pau Monne wrote:
>>>> Some of the current users of hvm_cr4_guest_valid_bits() to check
>>>> whether a CR4 value is correct don't print the valid mask, and thus
>>>> the resulting error messages are not as helpful as they could be.
>>>>
>>>> Amend callers to always print the value of hvm_cr4_guest_valid_bits(),
>>>> and take the opportunity of also adjusting all the users to use the
>>>> same print formatter.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>>  xen/arch/x86/hvm/domain.c       | 4 ++--
>>>>  xen/arch/x86/hvm/hvm.c          | 8 ++++----
>>>>  xen/arch/x86/hvm/svm/svmdebug.c | 2 +-
>>>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
>>>> index deec74fdb4f5..8951230a9f52 100644
>>>> --- a/xen/arch/x86/hvm/domain.c
>>>> +++ b/xen/arch/x86/hvm/domain.c
>>>> @@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
>>>>  
>>>>      if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
>>>>      {
>>>> -        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
>>>> -                v->arch.hvm.guest_cr[4]);
>>>> +        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
>>>> +                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));
>>> I suspect you want to call this once and store it in a variable.
>>>
>>> It's a non-inline function which also isn't marked attr_const, so it
>>> will get called twice.
>> I wasn't specially concerned about this, it's an error path where the
>> second call will happen, and there's already a printk which will make
>> the cost of calling hvm_cr4_guest_valid_bits() negligible compared to
>> the printk.
>>
>>> Also, if you're extending like this, then you actually want
>>>
>>> (valid %lx, rejected %lx)
>>>
>>> passing in cr4 ^ valid for rejected.  It's almost always 1 bit which is
>>> rejected at a time, and the xor form is easier to read, not least
>>> because it matches the X86_CR4_blah constant of the bad feature.
> But cr4 ^ valid is not correct to represent rejected bits, what about
> valid bits not set by the guest?  Those would also appear in the
> rejected mask for no reason.  I think we want to print cr4 & ~valid,
> like used in the validity checks.

Urgh, you're right.  cr4 & ~valid is what I was going for.

Not sure where the ^ came from - I'll search back through my debugging
patches in some copious free time, because it's relevant somewhere in a
related area.

~Andrew

