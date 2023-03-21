Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DD6C33C7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512701.792840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecj2-0003I1-KM; Tue, 21 Mar 2023 14:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512701.792840; Tue, 21 Mar 2023 14:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecj2-0003GF-HS; Tue, 21 Mar 2023 14:12:32 +0000
Received: by outflank-mailman (input) for mailman id 512701;
 Tue, 21 Mar 2023 14:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pecj1-0003G9-H7
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:12:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66d999d7-c7f2-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:12:27 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 10:12:17 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6764.namprd03.prod.outlook.com (2603:10b6:a03:40b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:12:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:12:14 +0000
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
X-Inumbo-ID: 66d999d7-c7f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679407947;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8Iu05Fgb8n7Yzh60Dmw8spipcps9kXT/KUq5SpIs5tg=;
  b=Bd7prwJQ8FvRcMSdVh6yoz/2OMQ26Qxwca52OIrB8G4pEBGyjdIiZeo7
   7FrZeX/LE0Nyqx90XElxAl9+BmQKXAeouuZGxTiVvgsP1i4tBtOv0ymne
   BSwsu2IQXO8s2cR+xpK1t3W+z2qaAhKfYo9Lj7Hy154l+w7m9iqReru4a
   4=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 101079609
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7mwt/6PxB4DCZ+fvrR2RlsFynXyQoLVcMsEvi/4bfWQNrUon1jwHz
 WYaWm6DbqrYYjemKt0nbt+3oE5SuZGDndQyTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r4sPztu1
 Pg9FBVXQjubl/qY2J+QYMA506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr13rCew3uqMG4UPLGU8NM62VSa+mwwCzQuCET8jMKrrGfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBHTVytJWFRHTb8a2bxRutPQAFIGlEYjULJTbp+PHmqYA3yxjJHtBqFffvisWvQG+gh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7DJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:j/TUHqx56qmyJiYbJo2mKrPwKL1zdoMgy1knxilNoEpuA6ilfq
 GV/MjzuiWetN98YhsdcLO7WZVoI0myyXcv2/h1AV7KZmCPhILPFuxfBODZrQEIdReTygbzv5
 0QFJSXpLfLfDtHZWeR2njbL+od
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101079609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrAvjMBqxx5jAZ/6Xhxvx1fhJjaIopv1HM4Gz1q2D07kys9ci0wW/78bxubCZzTmuQLVBT4IufU/KN0sImPG3hNOc5jkMKzOEe9MAqu8ZHw6yyKSkNMwULLMAos80WhqOmUXIVlW92dBzmlpWKYRHZvyFpmKU1PmhPwZvHdkjvui4EEEQH/xXdy/eDX9hKhQu8mb0Oc4tvyhPjoyu6ivLfPpe5JXHrhf8jdG+oLEGtZUugGRFWnkqGWVs6ZQ4sHOCQ8ZgySsTMYGQSCfgnNsewSgF8tRw9Ow0WQKg2EbQ4i4YoZzeNkh8fGTsnG/QwMRljxLX74SRWL0YEljHWs/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCnVkib/T414/cDllS1/34kDxVQyBuWOgh7LngwejbU=;
 b=MyH+2vriW2092tPoXVGOr58uXzDyRSHVvT/mGNRUUDl0Jbz+nlk516fjPfmN664VyzTsDD5klbzeZbijSGQiKa9voYYW95CCiG5gXPjO6tNfc78K/46HQykFYnMJfCWLIPsClmg/EtgpAGRCzsXm8xrdPmnHD34L1eHWfWe1UkAsCCJ6cwM3xtIjcjYljGDe+yNn2G5dDfHhKbBsfV9v1rAcJzK9fz4dpJExqd61yflvteQhMoosd1mwWcfiNvM9mo+YOHY+ps8DdCTk6N/06VqSoURmkq0LbkOq1aSpTMnV7BQywsIbM+XkZGwbj2b8/YhMOw8ekgNdGyIz1LZDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCnVkib/T414/cDllS1/34kDxVQyBuWOgh7LngwejbU=;
 b=sIZgPhIwtI/uWZUMDorStOfBc5WlcsHvfEyYunZcnSJnNCJujQ90G9EPHdFJ16SyjoOqPeStQ5MVxXP8VcrgEWpjlAfC+xokVpbJ+5FC5RSX7gnfBDUe5sLDLN3JSGBWAW/e6WDoDO54Jh0uutEg55g+rLa6cGEO7yovK6Fa6ts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 15:12:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZBm7N7oEDPlPmZ87@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6764:EE_
X-MS-Office365-Filtering-Correlation-Id: 5818b3ca-ca55-47b5-da2a-08db2a1644cf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3h/gaAO6j/TClrl+L80l0QV9s2t5ae7ZnXrZ7vZbFVV8czSMpDL4pPHN7IYczljONUstXHMKzlmrZHYpJhL/nbUZmVQQxl7ik47DvJE5hlmfnZvv4TA0/WK7zkLm42wBTBgk7CHQxNeqPTFGRAqY/f5sm40xAMI6255s0TZ454KKbJLCCkjXBYfRTYEcyBk2k/GhtumcPlo/q/ALS3v0814ecn6uGduwq/92r/nVlg7yetSNDd8r1UA8TJl5Srs8fmjMOmjr7XVEaXQmwQNDt16gfnhS7UfW0op+qpwjtX/qCprAfikUrTpGY6hz/31N5xXlLOF9QP+Jr6ECztS7NETzU5KTrdIFpHvQ2v3BN1y6RK7YAlYBAD6GPgB7fAGD0Cmy+7sqQZqkSNMBzBmBQPueF1voLdbDic0Lu1OSlFcxS3MAo/ANn/xZRh2z82zKuU2jIxuwPokztOURn9VpZKBR+oorn5e400RmrBYKjVeCwPKmXOKS4pXsn2+i8Up3R4z11XsMjYeDVScBsPURZ8xbKVgVYRdPWfJy9x1+nnBIPSehHlhQQnSMvJGxP5GD+kULnS88+PtisEPXS6aFxZdY0Onicp581/4UV6oKMBBrlgvuuKgRO7X6FJra31rs9OTpX5eYWcFtq2UXXs7a5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199018)(4744005)(8936002)(41300700001)(5660300002)(4326008)(86362001)(33716001)(85182001)(82960400001)(38100700002)(2906002)(26005)(83380400001)(6512007)(6506007)(478600001)(6666004)(186003)(9686003)(6486002)(66476007)(66556008)(66946007)(6916009)(8676002)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU01VUJOQ1BVMUhSMTVxd0l6S3pJRldpYlZ1bCtWOXY1Q0xvQnpYSkJveWhp?=
 =?utf-8?B?Y2FON2J3eHh5RFQ2L1lWOEV3V1hYaVdmbnRyVlFEM09ZblcxMlNFY3hhdEdK?=
 =?utf-8?B?b1pYUXNaQ2JHcGV5YS84Smk4dVhaQVJ5L3M5aGdLcFlxdFc4OGlRbHVnbnN5?=
 =?utf-8?B?ZjQ2ZjErNEp3RUtxaVJIL3NMR3dIQ3hMTEZsQ3h6TElGaXV6eGdCdHZVNDVt?=
 =?utf-8?B?dlc4Ymk5K0RZOXhPTG1QZ1A3S05McHNiUDVTdHJ1MHg1SytMVHBKak9XMTlx?=
 =?utf-8?B?OHFFYzJlSVlRR3RNZFJUTnIzL2d0N2IvUjV0QkVmMlRaU1FwNzcxVjE5M3BM?=
 =?utf-8?B?aENSQjhoK2Y5ZjErSWV5YkhiTFdhdWJyMVpkK0NDSUFuejBRTkp0YVU2ck1r?=
 =?utf-8?B?SVF2emFNZVI2cVhYaUVjVXA1MnV2VW5ia2luNUZpTFIvaDVCTTZaWTdSQnhH?=
 =?utf-8?B?cE84aktEOTVkUGhvZm9ldm55WFRjSEg1MzZWRjRXMjlYbStVL0FaK3JDTC9S?=
 =?utf-8?B?TE1lRCtuWUJYQWJLSWVQNFpkckJiOHU5SXEwYkRQeGF5WWpSSFZIRTY3Nndy?=
 =?utf-8?B?NE90Nm9xVkZ6MVl2SXJkaXVQejZjbEwwUndzbWF6MEtyZmt2QjViNk82UkNM?=
 =?utf-8?B?RHJjU3NBc29hUFVjWjBtd0lkY3gvbjNlaE1DeG1ZdlhaM0hiaEtoQ1Vnc3JG?=
 =?utf-8?B?eGNKQytMdDhZTzhRRUhtSmR1dzRUNS9SLy9OMFFLc0x0bGErVlYzL2dHOWp4?=
 =?utf-8?B?clZwZ3lqK3RiUkRyY0hEdEZ0bEkyZ0tTaW5CMEdCemFzV0JkeHFWMnkzcVBZ?=
 =?utf-8?B?ZTBNaHlHNWltUFpQMFZIdFRqOUpBWEpKZ2NoNFZnWVNWbE1MV2JzTk15ZkY0?=
 =?utf-8?B?WGJKb3NXMVBrZmZCbUhDaXV4ZXl2blNoZ01UWStSc3NQWnRhcFdtMVZhKzhk?=
 =?utf-8?B?TDdQVS9JU3R4SGR1WXNoelNOSXI0Mk1sM3RMSjR6NmF2TnBGQjVTelQxZG1O?=
 =?utf-8?B?dm5icldpWVBvWU9KNkpZamQ1UlR5TEJBSDZvS0dOaytqSkpYTktsUDB4ek12?=
 =?utf-8?B?dHdCdzRWSy9BZEo0WW9ZWFArcHpDeC9GZzhXKzM1aWE4Z2pJdk9uY1djalhY?=
 =?utf-8?B?eU1QQkZNRjVPeFY5QWd4K2Zkc01kTXQzNm0rMmhVZElINHFqc2JiRWJ6Zytt?=
 =?utf-8?B?elJlZlZXakRwVWdMMVNJTnI4NnI0cG13dVRua2ZBZXVNQzJJSFFObHFoT1dR?=
 =?utf-8?B?cjlPVllTNXFiUnIwS0lzS3FWTEUwUWhmWnNFdzYvS3gwS29UeUsvKy9lZHBJ?=
 =?utf-8?B?RE5rSDdYZ01kdEs3aVhBa2JFUW8rK2cxSWkwdDJGeFZOd0VyejdzbW1aelNO?=
 =?utf-8?B?bXUyUk82Kzg2K1JjTlRKNDN4eGpNZ0RpNnozOUxkelBCUnhFSmNyMlQrTnBy?=
 =?utf-8?B?MElSZzNpRGlOczRTUjJjR1VsVHVBUzA1bmxxV1dva0loNkZsV3ZZYmJaWFdz?=
 =?utf-8?B?VHgzZnJjVjZHM3N4UzUyOVN2YUZIdHNMUUt2MDFsYjhNUXdJSU5sUmlUSTRt?=
 =?utf-8?B?KzVJYmZhOStjaXFZUFJSejJRa2JVSEg0bmtYbEJJOWJodGJUQlBmVGcyand4?=
 =?utf-8?B?UVBzRmFGWmJ1ajJ2M0FpMVk5WFFCMzlCMEpDcndEeXBCdzJBVmZlMWRrMU5X?=
 =?utf-8?B?cHMrQVVxT3Q5NC9kNWRsSWFCODZLYzdIZEVjYXd3L3V6d0VmM1kxZCtwS2Jq?=
 =?utf-8?B?QXVDRTdyOXcyVUN5emZHQVNDMzVxVWludlJzRlloQ2xDSTdpVVRVZW1WNk1x?=
 =?utf-8?B?WisvY3lkOUtFNlZaVUNWbm9rNnhteFdrWkpnMGtiMlU0UmNpRGRMa0paNkhB?=
 =?utf-8?B?bVh4bWR0WkVOMXJLZmV6VWdvT1ZyOUR4MS9BVUJ1WEtabS9wK2FPeHAwTTRW?=
 =?utf-8?B?TlBLcEFYSStDL2ZRVnlTTk4wOGJJVlF2T1hTZHRDRXdZYUE0MWFMSkY1ckVZ?=
 =?utf-8?B?RzJvanA3cXR0NGw1TkZaZVEyUDlHS0xBdXFCb2ZCT3BCSWZHcDR5aFpMZXF5?=
 =?utf-8?B?UHJCNVo3M3VuZ2k0dUhHdFJnd0d0aW9mOTJ2MDZ6Zm0vOEdrQUVDZlIzM2ZV?=
 =?utf-8?B?bnVUUEZzQlBva25vbGJ0aUU4R2NpYWtkTnZoa3NMNGo1VGhzSnlWcVdnWndW?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jU6jNHQTJ73tfByNq6EpN8/naj0tZqPlZcO9KGIyz6+xgiLuPJMevOR1Px0gf6zZGUByn/FACLwvdpwEVo/34G9U8y1Y+oKwAN0Q8UQ3fUB2Yg4VDkWbzw4hkB3WWl/zEOa6gBtx/kefiJCJvwkxp0jODsav5eXMA/Yn3MK7wDOFZ3u0D975U1Axj6y0/9WTUAHejUaj2wDwHLFGFEkfUq3X9wYwP7zcfODfXSnFhEQpSFwv5m+WruJTVfWuoRSAo93mna623zNm6b64Ynzc5xrFUfYedgXjyuED5uaH1cBGMTZSJKwjkeKRobzd4DQ7jACJjVHsKTecoVmJvUuGrlfIKe0V4WMIVjmhpxGYRKoPfazxlqEmemEB0ZavgPZ7h3SMIovB+mNmVmZ/wQcSQhvFeUh/hG9n/6knO25MtX0WMkcgR/gDANR/QH5+UMyI+81BMfHzIuICVgPBlk59FLqS4CuWI1isdZ/rDZpj8C3l+hmYyohwQJcU4gWxZyvVx+GJcmGWLKnx16gzkNTs4tdTDFgZ2iLY7jFCDSOliQyVbPPr2dSQGyRWa3tWb0w7tFaCxhsWmDbuJqcc7YCOr5gul+X+XW+sdmzXYAykl9EjKjut0U/WEVcR1bShXQfFzG/EZ1qfQ+AbKK8wx96UpRArgtzCXaIW8oAoXmCyQKy3YupEWtmcg45uGvnDCtE5+0kygPEGXvcL8Yor+MOKCBsgEaWfwi1MW/c2DkmHyEvBRjV0YNQwPiwNFp8FUmGCbMrDZukTuOl20iy9/I+vrp435W1JHs3hKlS5TPrN3k7hfOmxSEDnGhAfT1YMnH2L
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5818b3ca-ca55-47b5-da2a-08db2a1644cf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:12:13.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlmZnyvZuZzh3ixN2qE4tys0z3OGfWxOupTuCQi2nj7Lx1yVI5hEujYzL2BCczyNdAxLlySMAYu1W+r6Ix2Jhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6764

On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
> ... in order to also intercept Dom0 accesses through the alias ports.

I'm trying to get some documentation about this aliasing, but so far I
haven't been able to find any.  Do you have any references of where I
might be able to find it?

> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> use the CMOS RTC.

Could this create any concerns with the ability to disable NMIs if we
no longer filter accesses to the RTC?

Thanks, Roger.

