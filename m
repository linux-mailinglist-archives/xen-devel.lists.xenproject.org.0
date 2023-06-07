Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2BC7258E8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544533.850383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oyJ-0000Mg-3N; Wed, 07 Jun 2023 08:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544533.850383; Wed, 07 Jun 2023 08:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oyJ-0000K1-0R; Wed, 07 Jun 2023 08:56:51 +0000
Received: by outflank-mailman (input) for mailman id 544533;
 Wed, 07 Jun 2023 08:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVY=B3=citrix.com=prvs=5155b7726=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6oyH-0000Jt-8K
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:56:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a3bf29f-0511-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 10:56:45 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 04:56:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6650.namprd03.prod.outlook.com (2603:10b6:303:12d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 08:56:24 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Wed, 7 Jun 2023
 08:56:24 +0000
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
X-Inumbo-ID: 3a3bf29f-0511-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686128206;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Y3Fpgo8nY2m9lgyDJQmGgrPbgr+iuosX7fwpbBrw91A=;
  b=Zusiak0uRNduwtJHArmzt7gWtmkrbxFcwuC1Qjl0YdyVDSUBqSF1sS5D
   qZJ0rCZpIkoH08/wurWrytIG4mEDH12N8wyV8dZR2u1YRK1zZ9x7GEmWC
   MwxUZCdzRJXD8M3iSD1jC3BXM1++UOyjYnBs2qQnXVIRvXpKMF4WJ2PjL
   Y=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 114389810
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b0b4zqiTzcnZlv9QdQwy7Lu5X1615xEKZh0ujC45NGQN5FlHY01je
 htvWWmAaPmMZjGhKN0iadm/phgBuMPTydcwHQdtqyk8Q3kb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4geBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQecxECRwzbv9mx65GKG8pFt5sjFubSadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGyaLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiBNlCRe3hrpaGhnWjx24eARA4b2KwvNCytUDnAOpQD
 ncbr39GQa8asRbDosPGdx+lpH+JuDYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty9Puup0phxTDCNNqCreoj8bdECv1h
 TuNqUAWubIXisIa0rShynrOiTmsu5vhQxY840PcWWfNxgFzaZOhZoeowUPG9vsGJ4GcJnGeu
 FAUls7Y6/oBZaxhjwSISeQJWbuvt/CMNWSGhUY1RsZ5sTOw53SkYIZcpilkI1tkOdoFfjmvZ
 1LPvQRW59lYO37CgbJLXr9dwv8ClcDIfekJnNiNMLKivrAZmNe7wRxT
IronPort-HdrOrdr: A9a23:l+3vz6gE4g7fKSyBL9KO6mE/OHBQX7123DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/hSQRI+Lpv+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbontlrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBWlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpP1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjjkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ1yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBXaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg17wqV2GLHfQI/xlltpEUuWWfsuvDcTDciFgryKYmYRePiWBMM
 zDfK6/AJfYXB7T8MhyrkrDsqJpWAkjuf0uy6gGsm2107P2w63Rx5vmmaXoVczQOAdhfF/DKV
 0+exW2DPl8zymQKw3FaV7qKj/QRnA=
X-Talos-CUID: 9a23:CGJbJG45+N55DbCyA9ss8hU1Fek5KkXmy1zzEh6bIFc2SIe6cArF
X-Talos-MUID: 9a23:aBZgMgQIp5MwxZftRXTchTNvPcpG2Z2lFWkGrptf4PGLEBd/bmI=
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="114389810"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0ajfO0Wld7q0MahRFz+of/PFS35PQ5ihOIrEhH+ISL/C2i2K0zBGPVDSUQASsPaiPeGH7JKXak14iJA4yTN2kTfdKdYlZJOljMnhhb5tH+OnTGnbMAitm+Jjb3GiN1bJzCnDAQI9qmronyaEgCsHfcXfVkJb+YVHNmHhs/SDPBCXw7tuK/A5B5fc63EKDqYjyK+NDsEcE5zz6tdytL4HRO/y1RxMgh0nSe6o6gn6YOMzImJmo8SEF44SwkMZI0edsbfhbf2gCceXcumWv3wVOcG6PxzGAskh9sbtaidz+CqGm8cvporLVAu8tky/BF35q1NvPJXRn/0K8F8bRLCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt2f7KVyWIbz4YeWnga6LibsjXxap/b3ciX5xZjwqhI=;
 b=fa6K1b6RYDePyHAm7s1h1nmSdCBVuWUJVEBXusC9wRVQmcr/LtY53R1fozAZL252g87F4Nf9Y64hI/NgHddO/13IIMGcmaFi43qTIfoZD6GgqYs72NkRelJ6UnWuZoP3glk93szKokg0wi+hD/Yqnquen+vmSdA4JhIlfr5wL30CJz34zIJP0DMzzrOXkv/cuJeIM67+p18e9cS5UYm5GBAAiPOFiLxP/hWdVQ94SyppMMSmfUuhXax9Bt64kc+hxf+Fk0Q2CxN4frhpzH2Pc9FR2/C7ph14UKZivrLEEqP6tygTDDi1z2vgxThb7JBezmzD4vXlknZ2tuXp/Opl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt2f7KVyWIbz4YeWnga6LibsjXxap/b3ciX5xZjwqhI=;
 b=Yc5MxTaV0M5e5Mwn9+WL9Y4cPpNvs3Ql5v5H7zKB/k8ve2+e9wrx/nUuzX0boFOGqXS68t7mmF1OMUah/XDC66Dg3tPoemvr1eSz7Y6Q82R3zZcGh8BMXx8e+mjKJNQiGC2n3trfLz0Ze/whN2QAWmzIJwPsGrjfoy8Fa3kAL4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jun 2023 10:56:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] livepatch: apply_alternatives() is only used for
 livepatch
Message-ID: <ZIBGMniARzdndoid@Air-de-Roger>
References: <20230606172307.38857-1-roger.pau@citrix.com>
 <0fd63050-7592-c308-51d1-f8445d3fbd4b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fd63050-7592-c308-51d1-f8445d3fbd4b@xen.org>
X-ClientProxiedBy: LO4P123CA0305.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa54213-3766-40f6-82b8-08db67351249
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5bOT+YkOMDJawsQRiYrRhNUkD1F1XzRlpRiAjdKTf6nDxCX68ibigkdSaKzoZOiU3lT9crK4SaE4/6XmBNpR9S+3TjZMWD9Hcg05k7AYc0AO8ZBc4PKf+3xnpd2ljxQsozczT2JMCehCLzMXWPCwblaTY93kaRjjigIGuazUsV6R3lNQVCxP8LBa5Q44cEWDBuwKwghPx19jrfCyQZ494FwpG6tpZiA/FRCTxv73U/uF2ZHY4A2JFweYVYDSWjjx7abMim6raC4f7/e5JZTCi+0FQYwE/jCiAIEH9ByZZYxFDn7Y2gLV880sxJc82PetukWHGTijEtz8Is6vFLxM2Getn31lg+pgWQ/BoDHywhAU4myrwB2eXCNj5xqYgQYUrHUH+RVoSMSN1qoa1PAvP0BLWxC10McFZiATEoVj3XK9tyipSMPBHLTd1fBOTc9/xWPUG2hAMbPDIGipRXSgRr/kV/puFAFwhqbrlZtLrqO8da3JWIbmfK8zHklKJ1m5skO0aFl1Rf738JvGE7sHn3zkAjNMfwiD5IwPVVCa3nvRv2De275cgt+QVddx+2ST
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(9686003)(26005)(6666004)(6506007)(6512007)(53546011)(54906003)(82960400001)(478600001)(6486002)(186003)(83380400001)(6916009)(66476007)(66946007)(4326008)(66556008)(316002)(5660300002)(38100700002)(8676002)(8936002)(2906002)(86362001)(41300700001)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZElFUTN4MGV4SXRhNSt1WnprbFo1UndLbHljaEo5N0p2dGMwRmErR2ZtdjNv?=
 =?utf-8?B?K2NZV3pYQ25tNUVNYkZDd3hGSzc3dFFZc05hUzRFdGdvY2R6VFVyZkxERmF1?=
 =?utf-8?B?dElUeDJNa1lrVEdJSzZ2NzI0ZUNWVklNSThjcFpocFpUWVdtYkhDb0ZFdTI0?=
 =?utf-8?B?TDNReVR2S0JXQzNlVTBkWUJpdm9pZmJVQSs2WndsVjcvQVhsNlUvT1VGQnpM?=
 =?utf-8?B?TGZQMTJjR2p0QWVNdlNIWlQ1SU1MdDBycUljSGxhRG5SVHlsN3BzK1l5Wjdn?=
 =?utf-8?B?bG5YcFpvYVNxclN3VGthd1Z1WWcveXNzdjU5WHVpZXM0dDlkWGUxM1hRbnFn?=
 =?utf-8?B?QVZmcENnWFdwYTVaVk51blNkVG0vQVR3MnhnVy9PbkJLb3JwZVdpSFFBakpt?=
 =?utf-8?B?SmhuTytnTVZiMmtrRVJpZ0hIaUY0V2JaWHlMYVZuelFyT3BqQTg3b3V5eUdv?=
 =?utf-8?B?T29Iejh5Z005azlyMTlCV1dndzlBODYramtKNDF5bWF2dFZiYWxwaXpYZlc2?=
 =?utf-8?B?eTBjTCtWcC9zZ3JtT1htNktpOFFzYVI0R0x3WVJVSVRrUTFadWcwNXJ0NzA5?=
 =?utf-8?B?MkZUMEZNZC83dmJ0SzhUSTdRMHlleUJTZVdFbHpHNWd4WStwdWhPSU9nZStX?=
 =?utf-8?B?b09YUVhBMVkrci9qTTg0em1IdFIyK29Md3hmcE9wdkFJSWpSRTJzdXRTWkFy?=
 =?utf-8?B?NkE1OXVXQmRyR1dLNU83dDhlMThrd1ZxUTF6Zk84RWpTVFRScDRkaGV5RVZv?=
 =?utf-8?B?TlVxZWFNMnR5WVFOZDdHbnFCVXhxK3VMYmZmeHBNaXBZRThFdGlaQTRQUlpU?=
 =?utf-8?B?Njg5Zm1YMloxZjR5bFFWVkNkOWZHalY0cXJ4aDI3TkQ4QnRXaGJrVEM0RW1y?=
 =?utf-8?B?cUNvdDVmejgwMkszQW1UYkk4Qjl5d0UxRkd0SWFCdmVmK2h5VmhjTFhmRUhL?=
 =?utf-8?B?NVA1bmozZERicTNKZU5Ha0xCcmNMREhnU2NWclFyME5zNDRUUUltV3liaUxT?=
 =?utf-8?B?V1d1MkljS0JyNFhTRXNrRjZVRTRDeU9UTEdhbkQvMUhSZkk1S1k3VVVkY3RS?=
 =?utf-8?B?MW1LbXZweFJhZDlaaVF2Rm1QVll1UkR1Zk9uR3lNMXc4a09HK3lRcDlYbm04?=
 =?utf-8?B?Yi94VGlLMTNxU2ExZi9vSmJwSURCd05tcERhZy8zcHlCWDhZcXFML3VtUEo3?=
 =?utf-8?B?bllUVVRSRUxTZ2VCeGcrTGVXT0R2MTVuTFJxZHo4eEpHMW9QZ0tMMG8wMVF6?=
 =?utf-8?B?TnhDa2g0dWE5WFBZbWtXWHpZdWcxZUprM2RvZEtQWUlac0haOTRpcjYwMWNx?=
 =?utf-8?B?VHJrK2l2RE4rcUh5bXkycUhlN2hEdExNQmgxMW9iTjV4aFRJYmN3ZEpVc2g2?=
 =?utf-8?B?MFp1N0dLTnNnOTdRS2pOdWNYL3FBa2VnRGNyV1lOZTdiSUJXSlpYbjF3dXBR?=
 =?utf-8?B?Vkc5Q0NZbnc0U3pHT3h6SmNzTmNZdWltczMvOGxVUzhKQ3l0MWxENHVPMm53?=
 =?utf-8?B?RWNxVTh6REJzVzYzeFhRVHh3c1V2MWpTUzNNY2Y0QTFDam5vcjZHVE5JcXVS?=
 =?utf-8?B?djQwenNSYmEvU0llUUU5UUNLYm9KY1V4T3QzRDVrckUxakh6T2VoRm5BaFhX?=
 =?utf-8?B?US9VM28xd0RlbnYvcGhxY1NKUmhidUFLYnlrWUpva0Y5aG9hN0hkTHZCYkpO?=
 =?utf-8?B?aEsrZmdRRDNiUHI3R2RETklwT2k5TktUb01wRjVqdTVoOVJFUzlCRHpPQVdw?=
 =?utf-8?B?L3UxdGdCVU1IWHZJWnE1N0lEMVV2eUNJaGVRSlllQTFQRXlUTzczcFQ0T05T?=
 =?utf-8?B?U1hWaE5WdTVpT3E5czFnTDVWZGdibGhYbEd4YWNjWENlRGhWbE4wbi9pUlNF?=
 =?utf-8?B?MXZ2OStXUlNqT3dNd1NtZkJ5SzBVNlVCZitwWEl5Z3ZWeXlaa3VJbFdSeW5Z?=
 =?utf-8?B?N1EyQmZ5U1B1UllHZFBqTzU3TXNIcmlSQkg0RW51aW9wdTRJZGFYRmpKcURk?=
 =?utf-8?B?RGRJYkV3eGhabE01cmJzRm9hZC9UM2NSdXB0Z013VEZOakpPa2JXdlFHelFG?=
 =?utf-8?B?NmJiYkZ3dW03SkN6SGlkUHVCRjJWU2IyY3cxdS9iQ3ZxbURNaGlSc2Z0L3p1?=
 =?utf-8?B?YTI3MVRmWXUyaEVPcmZCVjlzNkdiQ2xMY3crMGE1VlhyLzlBY1c1ck9CK3pG?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wBR3Cx+T+OkDJxUJfGeK9/tdvJn97YZdmSzquvJUbt663NEQknrE7a+Cpd2gD9+YvWN1hRJFGkYYRcASb2BoFE/gtU+TvFVk4hD3uOLWYeD/ZP8IL2Udce0S2tyK2vRrIFiBI0RfI9ydq7Ikwq8drr+FlT04c8YJZoXrSxcIC6sSYgx74n+pDi+ebedoccXmPZGarV8nAdXdYmSX4+lsxO/XfllpMq13kf5RK45VjtWHTVgUJTJuATUMEL2CeGEz4T/sr5fJhIQETXJL0m/V3//pBvz81vlHPMrT6xDTAhUEUeVtReo4sf7cfIVisHkdXpT+/SCpX8l6PSDN4EH6o3tfT6Qln3zV+9AkJSXbvbl43RfQW1rjYbeBzVsWkdy+dkhUTwODRJOjkXqv0N4u3n7f9/yi6NxHMuiGS6nTSTM+bIJLY8K0YtNeFggLCTkyWN8eAULhBwEStJcxdDuh5jUXFOze7fYJvTOhIxkVlWoX6CXWhNiwWNkYufA/ymFIV8YP7uGeS5U3TGvvtz6dYVQES95y1h6uSH92BEbaIkeNUeFTL1I6HzitmXR20cpDmU8oSR45j5UjXQnF5UIZwB3USqc+a4hQHaNLS5NxPav3AXLV5KzyAas74zhd7F34hXIk2kxAUfK4cZ6w/4ZDziWuYFwIn+9CkUodcH5zyi7aah3yx7rVRO4A/MWpUa8ojn7qNYEGRaSmn5WgPgpaTDSN31vJwD+kVkFoltCupZ5z2U5Etrbp92mu8M43JnxWKbQ9Y7+J909muSA/U5sXbfffRNAwUrbNuSLhwPc0W6cJyYN2/DTyzhxODkgXQhhn9gZl7nCSumySFGR0L8j+1YEELvvCb7ubywhVnvcty60EDE2WqGpPrOIY3RrdFHEW9iUOfv07j3koLZcPBhy8Bw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa54213-3766-40f6-82b8-08db67351249
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:56:24.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJnZ5wJRoQ7BJhxc48THbRnerHwb2F8OszUCcE/E7OmSipYpC4q263Q0EmhWX3G48cYIhLpOX1l4Qxr1IdPXOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6650

On Tue, Jun 06, 2023 at 07:10:05PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 06/06/2023 18:23, Roger Pau Monne wrote:
> > Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
> > using _apply_alternatives().
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks!

> > ---
> >   xen/arch/arm/alternative.c             | 2 ++
> >   xen/arch/arm/include/asm/alternative.h | 2 ++
> >   xen/arch/x86/alternative.c             | 5 +++--
> >   xen/arch/x86/include/asm/alternative.h | 2 ++
> >   4 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> > index 7366af4ea646..016e66978b6d 100644
> > --- a/xen/arch/arm/alternative.c
> > +++ b/xen/arch/arm/alternative.c
> > @@ -223,6 +223,7 @@ void __init apply_alternatives_all(void)
> >       vunmap(xenmap);
> >   }
> > +#ifdef CONFIG_LIVEPATCH
> >   int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end)
> >   {
> >       const struct alt_region region = {
> > @@ -232,6 +233,7 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
> >       return __apply_alternatives(&region, 0);
> >   }
> > +#endif
> >   /*
> >    * Local variables:
> > diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
> > index d3210e82f9e5..ce82dc1ca0d2 100644
> > --- a/xen/arch/arm/include/asm/alternative.h
> > +++ b/xen/arch/arm/include/asm/alternative.h
> > @@ -29,7 +29,9 @@ typedef void (*alternative_cb_t)(const struct alt_instr *alt,
> >   				 int nr_inst);
> >   void apply_alternatives_all(void);
> > +#ifdef CONFIG_LIVEPATCH
> >   int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end);
> > +#endif
> >   #define ALTINSTR_ENTRY(feature, cb)					      \
> >   	" .word 661b - .\n"				/* label           */ \
> > diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> > index 99482766b51f..21af0e825822 100644
> > --- a/xen/arch/x86/alternative.c
> > +++ b/xen/arch/x86/alternative.c
> > @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
> >       }
> >   }
> > -void init_or_livepatch apply_alternatives(struct alt_instr *start,
> > -                                          struct alt_instr *end)
> 
> NIT: It sounds like the init_* was a left-over after commit 67d01cdb5518
> ("x86: infrastructure to allow converting certain indirect calls to direct
> ones").

I think it doesn't warrant a fixes tag in this case.  The commit you
point out should also have added the livepatch guards in x86 at least,
since that's the only caller of apply_alternatives() after the
patch.

Thanks, Roger.

