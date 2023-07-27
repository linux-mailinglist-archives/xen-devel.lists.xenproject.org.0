Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D3765627
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571148.894306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2D9-0000QM-8d; Thu, 27 Jul 2023 14:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571148.894306; Thu, 27 Jul 2023 14:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2D9-0000Mr-5u; Thu, 27 Jul 2023 14:43:27 +0000
Received: by outflank-mailman (input) for mailman id 571148;
 Thu, 27 Jul 2023 14:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us1z=DN=citrix.com=prvs=565118259=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qP2D7-0000La-9X
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:43:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eea6c34a-2c8b-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 16:43:22 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2023 10:43:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6732.namprd03.prod.outlook.com (2603:10b6:a03:407::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:43:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:43:17 +0000
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
X-Inumbo-ID: eea6c34a-2c8b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690469002;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UxXEyPtG9tvTzovrzRr73H3crYyhiUAyuBilWx+06kI=;
  b=dDevvJ26hMoa2xm3I0DMLZZK0D+qu71pPvKP93M7wVyfOJtOBgtSL+Es
   J+x33YGfygBTDS3+erPvimLPIxk1hnUCMQNBpOtRxAln0GYwpTRXqc6+5
   VFIHjOjRDycDiOLm1iUtOKjBGMedEP7/tJ/bNQ8RphWk47hEwW7ZHbaMh
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 117673282
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PF4IfaPtaDTLJd/vrR11lsFynXyQoLVcMsEvi/4bfWQNrUon32FUy
 jBLWmiGaamKYDHye9tzaYqwoENQ7cSGxtM3Tgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5ANmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uIvKEFez
 tMmETYiRTaFutqQmL3qE8A506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyvz2LCUx3OhMG4UPKeI7uRVuVKM/1JNJQQ0dmvmkNil0HfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBIjhis6acT36HwZ6SoSmvIigeLWIEZigsQBMM5p/op4RbpizIStFvAauklOrfEDv7w
 y2JhCUmjrBVhskOv5hX5njCijOo45LPHgg841yOWnr/t10pIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF4n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:rtL8xq4zMDyW61fk/wPXwOTXdLJyesId70hD6qkXc3Fom62j+/
 xG+c5w6faaslcssR0b6Le90cq7IU80l6Qa3WB5B97LYOCBghrQEGgI1/qB/9SPIULDH75mvp
 uIC5IObuEZMTJB/KXHCDbTKadF/PCXtKqhgf7Xz3lrCQFmApsQijtENg==
X-Talos-CUID: 9a23:T+7/32579qFqENRYw9ss8BY9OtAeXUPkylj7BUmFMUAxR+zMYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AoV2mbA/aVyE6Ml02jP87LUSQf91Y+76RMU8SqKt?=
 =?us-ascii?q?YltCmFhwtChaB1g3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="117673282"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjPsNQ4z8eUPQmt0Vy+hzaoWZh+aZPyjXYR5sj5T0T28L/YhsbLrVAwDCHUKriMHy6TnksrzxBIw5lJyxpp60Lz+95gcHz7lErJ6eGoOCWlSN7FhUkqe5KIoB0/SuWAGmjTSZSwmp2quQ/MVOM1kenoB3KPPYG6pMNRgPlkDYuB+SnAgqc1N5kRKl5jjLIvMBTL/QX4XrdaCoRTrPdbMc5tgncAy+VmZ9myLVK5d8LQjRJ6+P1LLq4AEyDKbeEk2IZQvzIgKSf884mxxk9rbSBL6D3GKjWsXtaz7Bp/oLPuz4Aibex4m7miP/IJ9jxobHX8VDaRFJZXKG48yVpuerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IiuM0dR1My260jeFeN7cOOSGXywFDlqK5B+PnGiS+k=;
 b=D1BBv9O1eRw9GKYdpKSr1NWeQmjsn4QqQi9zqgzXsy6c9E/PxSkcqC1GTXx3MgW4zf3v3bPrLuNRRBMpAgPAfCnVWwoYWHeFaoheNTNKCGw/yTDN7O6JKlLxjZ/bucw1lCeFl083uh6BAl3dD5hTBaohsjIZhkB6OoRevxdOXy2tNIOZ9VnUmgBWlejzciX9uIs2c7ZIrQ8L0xIAE/8RMGkdJIlDf6UsVP/tPSNZIlcpVBJpb74Z5C0wUOqAWKsN9aUvm6PWcckxsOpfsRoFsEFu0KxLespIlvXtgKUioClnOGSs+CDm49lkyYfrqrZYKo8DY1X3vEzzgZeF2uVH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IiuM0dR1My260jeFeN7cOOSGXywFDlqK5B+PnGiS+k=;
 b=XK+gx0DZY/aLr+hpEaWKdRnVje0Aa5yopqEP4SZQg3cXIbySD/0jfeJRNNwnybo1KIE7+Cjec98ZhTmW3OhxbujzPYbjGmBnWmKUhNJTxhD7W+rWQo59rLgoBTGOeP7DJewxqqOW1YoObBppVom7TqgOxq5eZBmRh1/Oj8/ScVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 27 Jul 2023 16:43:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZMKCf8RMwFqjpD1S@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
 <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local>
 <87y1j2b296.fsf@epam.com>
 <ZMJmJTkSFLKZXkKB@MacBook-Air-de-Roger.local>
 <bef5cab4-023d-468e-bac0-2c71528dca81@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bef5cab4-023d-468e-bac0-2c71528dca81@suse.com>
X-ClientProxiedBy: LO2P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: de3a590b-5873-4437-472e-08db8eafd05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jLEaoNGdmFCXqSSIbjotgdi+y1FCTKxtfXsNSYKetrgkJhxFm2BiBqdVASc0knA/ds9zWLpJCYR3gYLFEpqfTSTN+Frpd13DhoST0A+W5E02o+2+YVUEy83gBeKCfw1IALiWTYw8mXNiuM8sznmLjeOzXY/I+VqwF3kUwTaIwUOyOVmTjvv5BTUuE8JI0PkaPYBCAkUbRgEhTUHlXt1gEIyQzxZgvT863fLexSypYDKKqkWxhm5f7RmhhQCyJcN+W0zLx3T9vWOB/ndbrZ7WDguG6RK1ui7ebmCcPZmk1n1FZXKVatrXg42hJCuNqjMX1pOXQyRANkaMfpGGFZThnB4ftSahnZcpVOvVC/8ItMErguDtpJzNFTQkX3ZeC+BA7TN9XAuq7qTQaqSbeuKFgRG6TORdoaR33xkVFpegHICgjMFOQM5mM/sYA+giPZ9ejtRfeJHnXdF03g1xyzf8cqBkhAc0KQa2cgTtn1K0OS79UPpJi1H7LsPq8PztQKPT327em6Y9YiwIl+WBD7AR60+gWmhlqFS7lJ2i6pABK2Fp4wp1B8rqHpbfojIdF9Wy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199021)(186003)(26005)(6506007)(53546011)(6916009)(83380400001)(4326008)(316002)(66946007)(8676002)(66556008)(66476007)(8936002)(5660300002)(41300700001)(6512007)(6486002)(9686003)(6666004)(2906002)(4744005)(478600001)(54906003)(82960400001)(38100700002)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFhvUmx5RTdVODlkajV1YWZEcjQvK0d6WWpYOG9vczMzUWpKMjRicmp5cmQ0?=
 =?utf-8?B?VE05MXhhVVF6ZG9WL3pjR0xoS3ltaU52aEtrNnZTZGJnT1ZrM2s5NTB3TkpG?=
 =?utf-8?B?WnEyVkZ2MUR5ak9Zd2VsNnpKOXBxQXRYYmcrVHNybW1GVFZRYzNJblNLVFNt?=
 =?utf-8?B?ODZDSXEvaE42dFpxUFNaRzlRclRSRGR2eDl4Vm1ONkI4QTVveUc1RUM1aTVu?=
 =?utf-8?B?UUN0eTMxU3k2NGNKc2hVVzFnZnBzcE9vekhaK01wQ0Iya1VEaDQ4SGNhNXlK?=
 =?utf-8?B?VUs5eWxqbVdtUjJjc3ExRnVnVEkzR1g3dExvcDVKYXo3aGhoYlcyR1I2S1FI?=
 =?utf-8?B?L2ozY0FWRzh0V0dZeUlqZlR2eGY1eFBmaS9HK0NWa1loZHBXMWJ2OEFpNFg1?=
 =?utf-8?B?c3lyNWF0dnIrT3pwSisxQU1XQWdmNGtQVnppOFZQWGd1Vjlud1NKTjFhNFd4?=
 =?utf-8?B?ZExBZ0srWXEyMTIyK2Y1cFdHcjFqaTl1d1NYSUsyTklBcmdWZm5EVGVBcmlM?=
 =?utf-8?B?eDBUTnRWNDVKZ08wYmZzS2FFQkhCeER5UXB1N2xkNlBITmJDQ2R0ajdtdnJG?=
 =?utf-8?B?SzhHeW9GTnloZW4rLzAyZG1makNmN3h6d0FBTmFXZ0cvNzB2dVNkU09HV0tp?=
 =?utf-8?B?QTFWYm15bmUxako3Y1YwOE5MOWFMYkRSQ0lDVXRudEpaTzl5aE00c25LWUV1?=
 =?utf-8?B?R0NlV1RwOUFJb1FoaUpDRkNGRVVVdzduc0VMVkRDVGoxanVjbHNyVGxQNnhj?=
 =?utf-8?B?akgxdXlIeHovajc2c3dsaklXZG0zR1cxRWtYK0k4Q0NIME1LMkVjMVNiMXlx?=
 =?utf-8?B?QTJZVVpVOEtNTnJoOHp4NnVJWkRQSmVjOWlaRXhIMzdPUWloUkZHSHlVaDgv?=
 =?utf-8?B?bmkvakN1eHBUNisxcDJGbXJCRDJlWVk2RkZzZXE0YVROMlFZRFFuck9IR1BP?=
 =?utf-8?B?cnBtK1BtdE5qY0lJWG1FZG1FYUdLUUxCNUFxL1VTL0c0d3l0RHZGdzBDVmlj?=
 =?utf-8?B?UEZjcjEvSFJYMjEwcnMzQWxoSzdPOGxmb3hzVG9DMzAzQmVieXJBdm9DY3kz?=
 =?utf-8?B?MmxGb0dwVXg4dUxPYWdqeHJOS3ZTNTNmVmoxejZUTUVZSXNmaWIveDlVaWFM?=
 =?utf-8?B?eUkvV3JscFlFcTM4REcxSzcxclZPM1Z2V3JCcTVHbUx1MTRVWWJybmIyZlRV?=
 =?utf-8?B?S1lReHhmc1cvc21UUk9DVTFONGt6SFVyU3hFTjk2Szl5clAxU0tKa2NCVGM2?=
 =?utf-8?B?bVlvVzBSZzlLbUk3Uml5RmwrWHl2YlJIV3U1Z3hBSCtGYzlPZUtkSU1PTG5M?=
 =?utf-8?B?R2JHNEdpTmt6dW9OaGZ0cVlVNEtBeDJjclhpMlMvbjljQUMxYXJMNW1yVkRY?=
 =?utf-8?B?b01JTm4rTFJwYXBFLzhvVm1CRGd4emFwa21aL2oram5xSklGTzhkRU5LNElI?=
 =?utf-8?B?ZWNVZFdSdVkwTW1EYmc5MldoMEd0bXlVOWZGd3NTbFU5NTFPVXN6bGJGb1Jz?=
 =?utf-8?B?ZkwxbGhsbWRhTWhZdWRiN2NRc0toMjcrV1lEVFpiMjRZNFRvZFBFMUVoRC8z?=
 =?utf-8?B?aXNvaFc4bkRkS1c0d1JwVlo5cTBqMEhSVmtiU2UvM1dNUWwrZERNODVOWEtP?=
 =?utf-8?B?am0zZ1JRbmNKeTJqWnlZWVdQSi92V0hlZGVZSkNuWUZDVzlNK0RONENRcG9o?=
 =?utf-8?B?MHlQN0w4VGZpeDk4Z3BrWEdIZ01IYkkyWWtCSGJ4cThNOUROU3NOeEFFMEk2?=
 =?utf-8?B?SWlwWWV4Y1hqUEg5R29VaEkrTUJvUmwxN1Ewck9ueWplK3poSjVSRDBvNCtJ?=
 =?utf-8?B?UTlQQUk1RDZEQ2NCY3UrNDZGRFFEZUt6WmtCem1pMHBnU1dBdW1iS3o4b3pN?=
 =?utf-8?B?dEZCWmVUVVRUMFA0TjloOFVtd3djamxVai80REdVVm84S21WSmt5V3RkR0Ro?=
 =?utf-8?B?VEpBdFVMQ1gxRmVYT0dPRzQ0NSswRDdsMnhrdk5PS29pWkZPT2VjWFNxM2c4?=
 =?utf-8?B?Zm1RZ0dPTm5rM2lFQm1KcnJqRUpvczVlTnVVSDVoU1hJSEQwcXdZOVlIK29z?=
 =?utf-8?B?RWs3TFZ6RXQ5eUNWdFgrc0lBbkorR0NvS0dmaGZ3WE05dHNwZXdLK21PL3pz?=
 =?utf-8?Q?Curk5ZqbqEg5I0frHHqkQMIQ+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TUbxFFecSV548JLeGap2b8roS2B8SQi2KpBCX8Bwexpui/RIZnQmnRYgC+keq5YvnVW7vmuvf9+/SuWZQVjNtAX88H0Lju45K5Gee1ksbAytDAPRlVNFqqr6M4w1RL/NUwGoIDRRMq0ZNEUdROeTi8FlD/NdZ14cZWB2OM6E8OB+GNSRdlG+gDyjHGS+DQlyaTPI7gU4SuVNws5TueKskcTgVPmEmqKr6YfNB09PYietw5nDsG7kgJ1S7NNU22smrLNeMdW55Jw/5rvu7sSs50onu3EuTRTiki5xuxT0Cz9XLCPd8gMRFSuYxd9K9UN1HjO0SFUNnfaqxYf12oVKDNF3QrMvS06pRcA6KqaP3ZVaC4xwLe1qVPhzrfblsBuY3HMwWDLxLu9U2GZjXoh6uJwnbrMCkvxQYJMz9vUDnw1wUbMarNk/zfdHfTK91K4bdtDz2Wi4GWBFZ6R9WklmPRQ22E+KE1KsaLD/nKrnm1l8ZcGi4RO3CRW5cLsrpf0qlf7rqSVV1RkzLQ/1tMy2r0KD3uKMGMXMLgKNFzPgI2QO6kgSffj/81vIf1Obe/jxn6YXNEobwKdSw0yVbAtEbeCvC1ljV42wDRXR4kaNAz+JIs2oql9VBJoo0f7w8zlwsDmrU+TIyPGHsd1rWZcR286dfKvrK0n56Nwqpx8mtufpUO+9LSuWFl2RLs9P/DM2uhDcdnRHIo9dXkDdxzU4ifY5hnqXrl2IS9jdbctHvqg+iFwkO6rW6bz9lWxofvToHxU/2yB33eD0ww3rd64cYFTAjsQk4ODI7HaFmwUWEraEt+5r+5zlbf8CZ9JDZE+hyB2ur/Q5ZVQrRk0XBPweDA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3a590b-5873-4437-472e-08db8eafd05b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:43:17.0465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtG5jZgA3vBmpSvyNe9xvEMz0R9g+WPnuODMcxjqTuzUvhCutas5vRHu+JIi45TWmtQRNaivrXxv6XroLyOwiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6732

On Thu, Jul 27, 2023 at 02:56:18PM +0200, Jan Beulich wrote:
> On 27.07.2023 14:42, Roger Pau Monné wrote:
> > There are also existing callers of iommu_update_ire_from_msi() that
> > call the functions without the pcidevs locked.  See
> > hpet_msi_set_affinity() for example.
> 
> Ftaod first and foremost because there's no pdev in that case.

Likewise for (mostly?) the rest of the callers, as callers of the
.set_affinity hw_irq_controller hook don't have a PCI device at
hand.

Thanks, Roger.

