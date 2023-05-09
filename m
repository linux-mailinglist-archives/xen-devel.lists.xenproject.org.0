Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DB6FC76B
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 15:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532184.828264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwN1f-00066O-Ji; Tue, 09 May 2023 13:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532184.828264; Tue, 09 May 2023 13:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwN1f-000635-Ga; Tue, 09 May 2023 13:05:07 +0000
Received: by outflank-mailman (input) for mailman id 532184;
 Tue, 09 May 2023 13:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSxc=A6=citrix.com=prvs=486b9cf0a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwN1d-00062v-Ou
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 13:05:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1baa26f7-ee6a-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 15:05:03 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 09:04:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 13:04:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 13:04:54 +0000
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
X-Inumbo-ID: 1baa26f7-ee6a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683637503;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bFfA2u1bFld5ekEC5yY1hWxiny2s4iBrvx0O8m8QGTw=;
  b=ZA1q/jruHG+NTxIvgiI+c8A2J+/Zcr9/e6egsZWQRKb7F1TIrCoBmDvU
   bUcPFmC2kEzwI/20ldaOUP4gUhaNYef6Djv5BsCZoOXWS/KhluM0pBghe
   5twLYzumU/8jNJs7fPno5m0+OtjRyiUcjSXC7aDcw4p11VPbxGNM3EKOc
   c=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 107717895
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gtnfa6MFLjwGtzvvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUoigWZSn
 GEeD26GbqyPM2Okftwlb4S2908AsZXSydFrGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5g1mP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sFNPm9B2
 KwmERsITyuituedx7ypFNA506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXykAd1CReDQGvhC0Xyo4jQWFT8se1KbvdKJ0Uy4ecBBA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACAcAvd/qpdhpigqVF4k5VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:QBNhg6Ppz/HZuMBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:pQfrfGw0b+695tmHbvQwBgUzIP8rfVCN8k77Jm6DKFdsY7qbWwGprfY=
X-Talos-MUID: 9a23:nGWtGQW3MXcYz+Pq/G7NvxU6MdpK2YqnKFwmoc4EveuWKwUlbg==
X-IronPort-AV: E=Sophos;i="5.99,262,1677560400"; 
   d="scan'208";a="107717895"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBc2NL7JMxSzfKScWfJvlJKu2EIfAb7r06eXZeIIniDCbXt7+pr6Zgju5DvKvLe/DLi5VCqNUvgxxmH7MIsifUDw/XnPFptHJO/YGDXiP6Mx/4KZzWy9mJG6BUS4egGe4THQj872zCX5/3BZ0ViIhhxCOknbGkUKeUtVc5dyVekJ4THDSVTm6ScUH9S0FWWhAflnTdYAwIikSDwiBJpvN64w94k0C0bbiacs/VqEv5FGlHic+ngwuQ1rb8FjbxIgVGASDZVWnEhBkXmpjFzGLrW6RYIWnn5yq7YR7ZM7W820M7H2qt51Ub/gIRPlao2hchkG3xNxYt8W7AUIHnxgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPJaUOtLXSna1hDllO7PoB9exQDqte8dXEP66cZMgqI=;
 b=UVLnDBv5DpZl2QpFmoPbIFJk0zkLue0D97nsM5Mf/hMUovFiWL8/woYwm+THDab/7GBDPgUuMvIfdVdpsY5pwiuvH18ysRlJ+DUrxVhuSY5PKu9O1ztItbyLkwSjLBD1HfygZQReTMPMHa0KzqD1Q88eY4ydMD07DnVvGfVJ8nch1z62E8KXdEjaXXgtsucQptx7EhtLAUnQ18E9LfjfrkNFcvU9szjllSIMII88GgZmNECQIqdFpmmJnY6DpiQ+NlxZm41ubyYVqEsJEJ/5TjJTowcTcbT1a6AsLVz4v77OtLej3pbhFEdgfiD3oTykglOOrcf1uQKuVSNNxk/slw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPJaUOtLXSna1hDllO7PoB9exQDqte8dXEP66cZMgqI=;
 b=YC57gC3KxOzSlW7FHgzVTlgTRW//jC/L4H9x6p3PRcs4WeVz/CCSiEvszlA8IPC4V222n9jqK/UrILL3u0bKRg3ac+AXap+pgX6FClpl24LuREesucfUV3pop9cvEQkCHAJc8H+D6Do4/NBv63Hq5OTxuwSLcdFRnIcrSEitOYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
Date: Tue, 9 May 2023 14:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
 <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
In-Reply-To: <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: 908d2fcc-4275-42f8-ea88-08db508dfb57
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CerlIj75R0D47iEnKpAYcb3kadtSQBL471dR58LKcfkgQctP5DoS2+2cj//8kKa1w9D/uF2gR+YiYGSSK4XxAZh09v3d2jNjxAyVf3Uu9DKwVA7CeQObfWaW7EhO9K2ePEBB7/fPdYbvVbH0e0zohXq9xMHXTrkEQLYjNc1OBdr+mfcdkNNXuGoikaYt3C4GR9UTzKOx2SIEsDj4QUQXzKKkGYBYMT96m0QuFL4vHBS+y/uttEIWqDcN0EPUz8QeE3QLAZAnlOAM+8sEwTdQdtAxXYmL7EXpoJijwy9ox7odiReKGjYW9p6VO8wyYWFSI7ImpphXsFs5tuGhaVePYYkETejsI70DDTE6lEvTu5W2teVC6AIQO5gw2AAIRs/+/QhIzHKQD82KSGEtIoSp4pLZ/zjVZwHZSpxpXFyj3Z5P3V7gSvw64SmK4/FKrF4rszTVIv4HosJQ7D0zLWa/BhJGxyfsZzSu4gZbv84pmXrAbjJl2u2m+jG35tBsr8IBAaEXcPIwbDrCDRfeldgsDDyRsIBkQ/PqjP3J7o2QL3tz1xPmSgPXGewaVR8gkrxQ9m6RGeDUgP8YFJS5anbIV690VXKeEQ/3VactFSC/TKyKtp20I702dfZSq4h8Fu67CWOgVosmuhBGbR6iFCYJVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(31686004)(83380400001)(6506007)(66946007)(6916009)(38100700002)(41300700001)(4326008)(36756003)(82960400001)(8936002)(8676002)(316002)(478600001)(53546011)(31696002)(6512007)(26005)(66556008)(6486002)(2616005)(66476007)(86362001)(186003)(54906003)(5660300002)(2906002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0xpMzliNytRQ0luL2pydzE1dTJtNmxWbFpaVUU1ZUd6RzNDcjg5a2o2aGh4?=
 =?utf-8?B?eW84Zm9Uc3QxZkIzM1NGZWlXR2VKUEtNbk9yVTY2T1dkNldDY1VpSFdIQUdz?=
 =?utf-8?B?OGxqT3Y5N3EyUjdrL1hXQkRLVUlOQ3IrY1dyMEtjVmRuVGpCdlIrNC9aNVBY?=
 =?utf-8?B?UTdVMlFUOGFUclM0M0dGYVo1UFB2YlZuYi9ncTkyQkRxRTljN1BtU3ZGRU1Z?=
 =?utf-8?B?c3JtMVJFMC9KbDJnV2NSMERSLzVRK053NlZmN3BLRUQ4ekczeGRBTVpkUHJv?=
 =?utf-8?B?ZFJ4NXlyY0R5R1J6S004T3BkYzNXY1Y0NlZhOTErbFNINGxNV1Y5U2doR0gw?=
 =?utf-8?B?b0xpbWdPbHZmK0dPTHhZT3ZXUEFZNlNhd0g3Sk9lWWJlM1FNdXdmeDhWdWU1?=
 =?utf-8?B?NE05UnNLdVhmSnFSTjB3S3JmZWdrcDZYaGVOVnYzZXFtTFdtaGNrVURVVlFt?=
 =?utf-8?B?NVF6MnJDTTVvYTFlSEMxRWJMcFg1YUZTVEc1NHZhWGZpcVFMTkEvWWQ5bmkx?=
 =?utf-8?B?WFZWVkY1akxkNzByZ1JQc2gvbVN3ZGFnQmJWTHlHYTVWTGpvbUVFU1NUenRk?=
 =?utf-8?B?dEVwUjNjbVE1K3p3cGtCNFBGb1orZm5mcUEwSjk3SVhPc0U4TEVQancyNEhJ?=
 =?utf-8?B?KytrVk5UU3F3b1IxUWRiVUNyNkd4TnB4Q0taNUo1Skx5Tnhtc3VnVTIrQ09G?=
 =?utf-8?B?VXozdUZZbWNBZ1VpL3RtZUpaZ1JWTGorakpoQVFhdXJOeUlGVGJDN1FiYjdK?=
 =?utf-8?B?dmtQR1ppc2ZFMDhxOGx2b2NUNDBGR0hqK2VkcEpiamFNdjJWbmhrRG0veU15?=
 =?utf-8?B?aGdIOXJsbTl5eWpZZ2UrazVNYkRpN3BBUk9Hc1JRRzFHTDE5NnZZa3B0bW1l?=
 =?utf-8?B?NGdGK29pUGZDTmlPYUIwUkVrR3VXaXIxM25BRGxOdTZVWjRHN0dsV3cyUysz?=
 =?utf-8?B?YVBjdCtqb3RKMmpZUkRUSDdNRTQxWVVWdEMrWkZxMU9hbk1JaGczaUJxamo2?=
 =?utf-8?B?cGxIbGpXSW1QU1NGWkhjQWNEbldNTnBvc0Jlb2d1dUxHbmtWb1FMSGtoRG9T?=
 =?utf-8?B?QWtLN1l0djBscjczY3VINXY4Uis0clRGc1NwZmZuNlB6ZU5qQXBkSUxGTDVi?=
 =?utf-8?B?cXhvQXlOTmpoR3J2YXlmTHhlMXVOd3ZhLy9mOUhISGtZVmpCZm5KQ0ZUTHJy?=
 =?utf-8?B?ZUgzUUE3MHRseG41aTZkZ1FSdVA1SVpzY1d5L1ZXazJLNXcvVlM1L3R1ZnZH?=
 =?utf-8?B?ZVRIcklYbGQ3R0MyTWRQdmNMWkRTZktVOXMxU0gwaks1UC9TVzZEblZlNkt0?=
 =?utf-8?B?RCtqTUsrc0JTeUpwakNkZjR4NC9BeGhFQUpFcnFxTzRHaE5zdXVYOXJGV2FE?=
 =?utf-8?B?WFNrMU41a3E3bXM4eEtzYWNtTXVhL0RxckV3M3ZtaENOeHgvdGx0dWhHS2di?=
 =?utf-8?B?cWtpSm5WMlVSajRkVFFLL2V0RnJlUFdxQ3NOSHlXNGFIbE9kbCtzSUFVTW1p?=
 =?utf-8?B?M012S0pUWml0clE4RnpQTEJvVUJ0bUFzYjBjNGZHUUpPNU1meGxVeStxZjQr?=
 =?utf-8?B?Tm5reTlFTlNUZjZUeXlyTGQyc1VCYnJZa3ZMdCtPd3VkWm1KYmV6VlVQQllj?=
 =?utf-8?B?ZjJHaEErb3YxbElYNzJZU2xrZFh5VU5Kb0tsTDZsQ1VnVzlFQkFNRVFoZ0dU?=
 =?utf-8?B?dVNJNXJ4eWdoWFNHOWZ5cStMYVdwemNrZWw4N0JFbkQvTUQ4YlYvZFQ1eGtk?=
 =?utf-8?B?UHpodlZpRlVtY200Sytkbzk1bmNweVRKQUZZTGJ3Q2tMS0F6RitJYkxDSCsy?=
 =?utf-8?B?UHVHUGtLRnMwT0N5TFZLb3JHNzZqbmx0MlFkcUt2QXJraExoc2MxUFpTWjRY?=
 =?utf-8?B?TFcxRGxXV0JyVGtJeGh0dnc4dDZ3aFFyMElEOFowMlhZQzJ5a1dFU3hScC9n?=
 =?utf-8?B?T2djSFNtSkFiS1AxaTllckpmVWExeVdOQmpVVkNLQ1VPeUlobnVkVlQxbGxw?=
 =?utf-8?B?aFRxbFVjZmpyRVhyaVpWWWk3WVlwQ2dkTG9aL0ZaUG5wQmpoamtnUDZoTFVZ?=
 =?utf-8?B?d0luK2NwSEUxUDhIVVdLbHNranN5VnpUMTg1RTcvTDVCZjBIb2NWeldJMFQ0?=
 =?utf-8?B?NWMzbi9mdlpsOUhWS3R5dy9Xejg5aTk5ZjZmVmhCS1kyVS8wWEp3dVRjZkNG?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oD2krNlm+VBecwmQwtnrOpmEFBRlBt0CQIa5GaHjO5pKm6jJuqfcjTSrgdMoM05GYO28OtzON2PcNL1VTjDMZmoLvGi+iMPbfV1+47W44EQzvqzcaDiZLfNazkZOQ2vIllXxk9PM5wee2uwHWPGj1WhwU9Vl3ZATjKbPHYQoar7BEE8zENSdO7kuIZ2iRKpLRPNBPQn2dEFvJNLDfGJMHyeN3izn19nHcmTu0GATrFrZcLLSXDoqbphLdj6dIfTpfQazIpCavbdm0sMcarQG/4JXNar/I0fsw39kSj3oQSa4RC9iTLYiq2B2tTB0OHXnmnd6O3u2qpHXN76VNJdIVfrCskDqXH1lPT1fmfweagR1lCkzHGYahaAYFrvkVqkHS0TOz6C9rGAkKBqlD/gu1s9fu7j5dX+sqedoz3YvWv1FFXzP6TVa0gUzgbfzYRo66NwNckIvvV2xj2okPPDMHl8EJ/9jooAkSxSI2SzlGTKCICVe8sM0iufTuYuvu/coptUvBmiNQr7hIIiCXlwuwIS7Pz8x7+frbf63x1a832LdsQmKm4yNFMplUOvxR8CToBidpiQtwJWgBP3CJU7HA7Oz8WsCkXFN6GwXzl0lkARWvNh9kL1zeChHZ0xF7RQD9FiXlXV32x3srY8bW13Egm02fews2aX9imuUopVi7jisk4/QWz/K0+kHkyl1p+eSeU3PB0abCW8ozzhr1UO9gITsjFSdONGFtkvjuSd1KddcVHM3O66Ghg7NxEdCZbxJgmVSGeGz7J+Ld7iAbxpQ3j2e1q/8pjmT4xQhakr9GGNwsuPWU+ECRorPhhb9uRLV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908d2fcc-4275-42f8-ea88-08db508dfb57
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 13:04:54.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHV24YY2oekblI2EuqQavQD0J7SyQQoRZHdmaI0q7g7uWyXvcY4Xl/g4dcUFPAlkngNdxCxjhNZZj11mQXmj4IVAvgjm1OdGOe8SaN6UDYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5328

On 08/05/2023 7:47 am, Jan Beulich wrote:
> On 04.05.2023 21:39, Andrew Cooper wrote:
>> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
>> code which looks like:
>>
>>   uint32_t foo[1] = { 1, 2, 3 };
>>
>> However, GCC 12 at least does now warn for this:
>>
>>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>>     884 | uint32_t foo[1] = { 1, 2, 3 };
>>         |                        ^
>>   foo.c:1:24: note: (near initialization for 'foo')
> I'm pretty sure all gcc versions we support diagnose such cases. In turn
> the arrays in question don't have explicit dimensions at their
> definition sites, and hence they derive their dimensions from their
> initializers. So the build-time-checks are about the arrays in fact
> obtaining the right dimensions, i.e. the initializers being suitable.
>
> With the core part of the reasoning not being applicable, I'm afraid I
> can't even say "okay with an adjusted description".

Now I'm extra confused.

I put those BUILD_BUG_ON()'s in because I was not getting a diagnostic
when I was expecting one, and there was a bug in the original featureset
work caused by this going wrong.

But godbolt seems to agree that even GCC 4.1 notices.

Maybe it was some other error (C file not seeing the header properly?)
which disappeared across the upstream review?


Either way, these aren't appropriate, and need deleting before patch 5,
because the check is no longer valid when a featureset can be longer
than the autogen length.

~Andrew

