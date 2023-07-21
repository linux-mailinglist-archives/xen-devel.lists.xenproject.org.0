Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F023175C010
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 09:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567383.886359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMko0-0004uf-1t; Fri, 21 Jul 2023 07:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567383.886359; Fri, 21 Jul 2023 07:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMknz-0004sl-VE; Fri, 21 Jul 2023 07:44:03 +0000
Received: by outflank-mailman (input) for mailman id 567383;
 Fri, 21 Jul 2023 07:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMkny-0004sd-LG
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 07:44:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 598d0cfd-279a-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 09:43:59 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 03:43:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6603.namprd03.prod.outlook.com (2603:10b6:303:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 07:43:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 07:43:55 +0000
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
X-Inumbo-ID: 598d0cfd-279a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689925439;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yeJrAmxElL62e5LKYhCfnLZ6HRcOgQgNeA308PjnD4w=;
  b=OMNxv2z3Y/oyt3km6Tfy3BrJk5u/UU85n/xIZBdCa5PcseB0XO/BWdbP
   FBzkPuZGFpwT3G6C2aKBPWfx/mSxO/mfNUSn/Fpvj3He4kgkUxBIFXxn+
   eRictWoNdaO0SxJMGw4Dr8Bu1FkJJceDxQYLA3qyDO9aShNmoxsp4oVZ8
   Q=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 116841522
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fBYdbqy6oDJLEKcQTUV6t+fnxyrEfRIJ4+MujC+fZmUNrF6WrkUOz
 2IeDG2Ha6zZZWemLtEjYdy+8kJSvcDWzoNkSFY5+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP6gT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVhW/
 MUFEwgXUjWGi9C4n7nmbNRBoMt2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aRzX+iBdhIfFG+3vlMjGaJ5i9CMhY1SEudgcvlqEiFS/sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwD+Kzq3Y8gOIHF8uRzRKaMElnMIuTDls3
 ViM9/vOATFsq7STRWiq37GYty6pOSMVIGkBYgcJVQIApdLkpekbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lW0rmBqpr5nNCwsqvAPeWzv96hsjPdb1IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz0k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:/o4KLatdbUwui5HkiOcTz9bS7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-Talos-CUID: 9a23:1t+rWWEcUDQj14zuqmJe7EctB/sdaEH4yXviLRCzVEBUZZuaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AsqFhywwV3kgnM5fXQwm/Cdy4VyyaqKOIBHsXsdZ?=
 =?us-ascii?q?XgcKnKDxWGwXBrjKMUqZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="116841522"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I26TCpBtTQzLCcmgKPxYL2QahkijLHGQQ7bHxM0ENLMfETBsmIjsEdcafXVkkLMK3fhY/qTmmugA+d3w+qPMG8YxwQzTYEhRBsiY+tmJ/+xuTE4wNJOIcLXj/d7q2P/5KdbA4jrzWITCM961mZmELcaAbbEtHlumJstVK/CtLZPild8C8B1zZqPvv3aaSNJzVj/QBbVkzzTKNpgtctDRnPbFx0D5uZ80sd/bdG8tMhBideTGiFY30eeeb7MuN7GuXlSNZW/1zqANp58XowoJuvk/HkOTskz6Kwx7FCvNr8qfLO7qnPbio2cCbeVOQtDV8lFwQNUYNz7mx9jXjxIUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o9FARo0eOG84FGqt1nysGSmKwavLPWF7xFvPEsgPh8=;
 b=d6+H7AjHC0NP6QBzP8XvPOu/8uU9iYjDL7A9dDwyh+hQJ0SQ4lG6OxyQqXXkd9O7gxjtx3ZXRhhN1qJSSrIKtpK5I/N1xqNFgThmNfD4criwepEE9ZzPQzZbnjstAsp7zLSX9tm0S8tuY4FNtq/KQTGFmP8gL93VjhutEuy8STGrGSyFcfvqKIXhWzM+dJtY9ic6cs5D1Whw8WlE/ehVv4Qz+I0ueyjfJzHQbOtg2ZbohJyExr0FkE3LwNT67D3+NpmR9b11SE1gTaD7UcsgY1K9dTn9h8C3A8VaSuXesZf0kVM7z+h+l0MsCp9XrcqhOt273D2yKZ6HzlgsDrgZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o9FARo0eOG84FGqt1nysGSmKwavLPWF7xFvPEsgPh8=;
 b=gSmWdScG3ZzNXf/hazDbD3VmSk17j/K/YauKLWo5Gld0s8F/HFAvx1ujV5g72sTYb3odOksIYIkt3Rqu9qs9Qd5hsj3Na6FW6HTms1FQFnwzEQEOOelBZlttWej9HHf5Qa+llJH/0ut7pn/VGbm2TOC8E1FNTfMp8drFIOk65TU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 09:43:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZLo3NY2KX-3fuMGr@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <e9331a8c-69b5-b803-7989-7e3b95b815e4@suse.com>
 <ZLldU9ZNM5BRXqeY@MacBook-Air-de-Roger.local>
 <96b95858-c83a-5703-f6b2-6bee852e62e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96b95858-c83a-5703-f6b2-6bee852e62e0@suse.com>
X-ClientProxiedBy: LO4P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 625ef23b-d378-403e-991d-08db89be3c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	loqbrjFMDQemztmjg1KuLudNMNEFdqh6gdutqKH5+cZBUBRYlF5r5v2TCmLOGVcfbVTRhuioa+kDTyIBHVbmoIW77PUxEfrGQ6DFHQ3j57H3csCDAcH1+/uTq7ZzsfU7INlXv8SdbTESwTg/VlnX7zLh9p0amHiQ65xu62iEuoVZcGVvyZ7395mjnD0y+nWXOKbp+vlepO890G5Q9AJ3dcQVwvN7goxF0G/rs76O0Vl1MVo55a2nqBCW/aLlmUIR58Srr0ZKfdH+RuQet5KeXrFD/iv7JTEZO0MhyA7cpLNmdOd1yJhKRJnKOqBi9TD5g5xq2kg+lwaNDH6wUWSa1PAer4a18osAa14Th97dz1z2wxLFBIcyFDANXV/9x1QxeU2GomXg0XTdkwI8yHU3rTVTneSjbAQRp50BCsME5qTjPcU2c0x4B+jBSbyQfpBiyiFtOV+9g1S2hcS4SWfD51rYdOUxLLt5zXY+lDTXhh4v/bEHVTGVEh2/pOPRBiMT2egyVCYM1r2Fe0GmHL0GtxQ90eCK9mxPq7ArVEjx8rM+RcdEeNKCZUn5aFcVp6fG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(5660300002)(8676002)(8936002)(41300700001)(316002)(2906002)(6916009)(66556008)(66946007)(66476007)(53546011)(6506007)(26005)(38100700002)(86362001)(9686003)(83380400001)(54906003)(6666004)(6486002)(4326008)(85182001)(82960400001)(6512007)(186003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2ZsT1dRTU0ySmRNdnViTlZYRVJkMEt2S2tLbS9LazBJTW1mazRTczFrYlV0?=
 =?utf-8?B?RVJVSnZLeldqN2Nmd29KdWpWZHhyc0ZpYVJzd0FQSTZDYXJsbm80ZkROTG52?=
 =?utf-8?B?Qy9SUzlSSGRSV0NnMURvbnpuSlFaV3dCTWpIK2I4NDBvSlJLaXN2NEVxM1Jy?=
 =?utf-8?B?WjgwZzRuSTBwNDU3YnM1R3A3anNKTGs4ZWdBZ0twcCtPZ214emdHelNBc2d0?=
 =?utf-8?B?T1pkME1nbDdrNzh6L2RHQmp4N3ZCdll5U0V3SC84TjNib1QwSTYreGU5QzJp?=
 =?utf-8?B?aUNCZS9GdVZBa2VKNms5VnlxeEdFdWE2a0g1aUl0b2RzUW5va0lxQzVpOGw4?=
 =?utf-8?B?WllSVnpGTzVRcTNoZjFmbHlnS2xrOFp0dVRVVG9ZN2xoTWRPNTlvY3J2ZGZw?=
 =?utf-8?B?TzN5akxMZUxSR004Z1BUYzg1QXIvT1MycU1ITVRISFlNSXB5RnNrM2tZV2xL?=
 =?utf-8?B?NURnTVNZbDRSSjlDdlRIbzZ0azdpOHoyaHFFbTZmT0VUKy9qYTRHT2hZM3Nt?=
 =?utf-8?B?RmIreUlPTjk5RFpaK2pHWjRUeWh1MEltZ3VUUloza2trbWNLRkJJUkFXbDV1?=
 =?utf-8?B?UWRBSVNLZWRUc09FM3MxS3ZWOE5rY0EwVWU1SjJCM3JOSUhrOGZtR3V6OTRY?=
 =?utf-8?B?d1ZIRk1mbVluNkhnVlF2RWI3c2dJa1B0N2Y0aDB5WmE2QnI2Njc5UytvNmRD?=
 =?utf-8?B?bmlOeVpDWENqRldxWm9UaGNyQ3BzQnFDbS9uLzdaVk1CVFI3Ylc3MlNkaXNt?=
 =?utf-8?B?bExCTy9xUGlrcGZFRGhJU3NVV1EzVm50ZU1ubk1vZUJLK3ROVFhtQWFlT2Fj?=
 =?utf-8?B?NzdWS1JxUGk3SU9mQWQrZHZkakVtcnNGSG9zT2hQWTVieDhQM2RJbE96d0ps?=
 =?utf-8?B?WXVWQTE5Y0RDWVZYajlLTzk4cktYQy84bVNMci9zQUhtcklnc0FtampkU2NO?=
 =?utf-8?B?eVBqc3VqZmNFNVR4UDZPOTBNNUZjYXdVeXdXUFlCQmR3MWQ0MUNWdzJteS9H?=
 =?utf-8?B?L1hsbyt0YTRXamNIK0pHWnFnVzVIT1dLSVJSMUVXTGVOaC9TVk5vSEt0MFlp?=
 =?utf-8?B?dDd3SUNLcm9UVUo5UnV5Q01YWGhmUmVnNW5Xc01lL2VoOHl2U01pUWpFNFJJ?=
 =?utf-8?B?aWRLcitZcVg4QzE5TjllMXlQQVg3MHNKME91cGxWcFpyc1N3aTRmUUxVRG9U?=
 =?utf-8?B?ZEVwSWRCb0hReTdTR0xIUTJsVGJmSm0ySGM2cWI4MFFMeDJoR0NXYmhyV1ps?=
 =?utf-8?B?L25UdTFsalBNSTU5R1drVmlPZEZyRVo5a1pPMXdnbVEydEh1eXBxT3llTzhJ?=
 =?utf-8?B?MkVCWnIycVJOekt1eVkrTWhTZXFENFRUNE1BUTZzSkJTTjR0Q3VEN1d1NVJ2?=
 =?utf-8?B?ejZpNm5NTFhwVWpqQkJjN3ByY0tsdWcreUt4V3lzdXpuWmd4QTVxUFJpSWNI?=
 =?utf-8?B?Q1Zkc0pOVFowbE5yTENyQ2djcklCVEcwTEE5M1Q3ck9ESGIvTE9XeXJXdkMy?=
 =?utf-8?B?MjgyMjgrUjdEVVpEcWh4b1NGSHFhZE5HWnpTTXJZUUhLKzRpUFF5Z3JTR2Ni?=
 =?utf-8?B?YU9vTkFQVUp4dWM5cTVRZGlGOG55ZFJrbkZuU2daekhNTUZhOWZIbFJTYUlY?=
 =?utf-8?B?dHJCT25vaVo3YUFCeG1vaGYwZTBTYURnUmEvZG5kQkNONVdDdCs1d2lSZUhM?=
 =?utf-8?B?YmQ2eVJiMnprM3pZRGl4U3NnMHlTTUNBMjdYZGszNnZ4aU5BbUd1TGZ2UE9q?=
 =?utf-8?B?VHN6RVU1eDRaZy9vaFFmQ014dmIyYWZreW9Db1I2VnRnL2hGMjlCV1JaZWpj?=
 =?utf-8?B?Y2Y1NTUvN2dWaXdpMTNrVHAwRksyNUcxeXdSUFp0a1grOEV4MEl5aEI0Y2xv?=
 =?utf-8?B?amRmQ2ZkOXdMVjVGREdncjVWTW01TU1leEZ0WWM3ZkxYYlZDWE1ETEJqVC9y?=
 =?utf-8?B?VVcwTTQwcmVNaGV6YmUzcGRBbnMybnlFMTVDTVdWellkWDB3SXZ5M09yak9u?=
 =?utf-8?B?eDJ5anh5NDF5S2dMYmdpUWY3N1hMblZyREJtSWQ3M1Jac1dkUWZoWno5aEpq?=
 =?utf-8?B?S2Q5WTNieTM1cmhMTWxWY3FIVjg1Q1Bwa3FEMjQydU1sRTg0KzdXMWNSdnU1?=
 =?utf-8?B?OEdmSytQckt1Q2psZXlvbzF3L3kxT1pRR2lIUEoyV1oyNWVNS21XdG1aelB6?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U05ezwwjBoDgflRJju2URfnUEuXIW1rUAG5K+oVWCxcg3J54k4z+l2Xk1LHVxiEQ3UnnYPAshpxi08ONkZVJO/lARAX7eCDjxuDYdNPHUXLHjF3Ny00BQjyw+AmXFhHe1tTdfTggNXGRAeJAFkmFTPkkXrq3zcYw6klviPpJeEl2a3vcJk3odUBPKfzyi/uEqTMX/eQqk3zVC3XryZjwVk+kxniEnQxU1fo+ORMdxM8nislI7khEkezTy4xupoFT0xgYvvYSxWxFvFEYqYHAdS+wCTORLfQP16ZOYSDo03vpW513GoFXUZIyYlxB4iSLr5TX4nCq/sVFpGzMWnir9MJ3vw3o5PsxHQCjxeAJPPJl3ciBOOy4zn9exSdGItnjyTbi+llRCL5VuPxqYodPnSZDH75rwFL+BISQKy9Rrpi/TazaYcB4AtXIVEt7N9BSL1XaHc8/myzeiHpeCjmzECq11BRZtuDCKaPaFT4njsXt8CK5LMNdYnyxvn+e3VYbsS8WWPX1wJBMXLzBtGu0EyzDlFrldhKHTtPluJRjFEPv5IRHZtKuNGE7rMDl3T3nGzIKB3KhyYwC8kAbxS5r8IIEsI5dvBDirx2UWqCQhLreMuTHYT6umut2qNLFtVlzDLvAxqr7yxVw6jqi6Bs8/L0N9iVlydQ7fBFeh9w1gj/pUkqanL1b9Lb6m60sbeGW7fdgU6mwzFrg8JijdXxedu+v3DNYzPwkS0vs8oBma7sZlwJWMjD97bFLdhk+3HWS+TWB//pTKwYy9Vj8nOJthFFpoZy4PZLlPGSN9fBlKs36DXK719+NotnNOxftGHq/HKeuhLKzU24fixgrlyBtkw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625ef23b-d378-403e-991d-08db89be3c07
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 07:43:54.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/XLTITj55vr9QSi//RSYxEUyt4zPW6ElApgwUnHZ/EOUPrfJ0hlIdJhW5v+hxG4n4oAlotIcl8SFjdjouEilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6603

On Fri, Jul 21, 2023 at 08:02:33AM +0200, Jan Beulich wrote:
> On 20.07.2023 18:14, Roger Pau Monné wrote:
> >  Strictly speaking however the init
> > handlers don't require the lock in write mode unless we use such
> > locking to get exclusive access to all the devices assigned to the
> > domain BARs array for modify_bars().
> 
> Aiui in the present model modify_bars() has to use the vpci lock for
> protection.

But the current protection is insufficient, as we only hold the vpci
lock of the current device, but we don't hold the vpci lock of the
other devices when we iterate over in order to find overlapping bars
(or else it wold be an ABBA deadlock situation).

So my suggestion (which can be done later) is to take the newly
introduced per-domain rwlock in exclusive mode for modify_bars() in
order to assert there are no changes to the other devices vpci bar
fields.

> Therefore imo in any of the init functions the assertions
> should either express the real requirements of those functions, or be
> omitted on the basis that they're all called out of add-handlers
> anyway.

I'm happy to omit for the time being.  Iff we agree that modify_bars()
requires the rwlock in exclusive mode then we could add the assertion
there, but not in the init functions themselves.

Thanks, Roger.

