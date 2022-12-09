Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E2164808D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 11:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457779.715767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3aAU-0002BV-A0; Fri, 09 Dec 2022 09:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457779.715767; Fri, 09 Dec 2022 09:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3aAU-00029B-7D; Fri, 09 Dec 2022 09:59:46 +0000
Received: by outflank-mailman (input) for mailman id 457779;
 Fri, 09 Dec 2022 09:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgrE=4H=citrix.com=prvs=3355af1f3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p3aAS-00028p-5p
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 09:59:44 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 320a50da-77a8-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 10:59:41 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Dec 2022 04:59:35 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB4994.namprd03.prod.outlook.com (2603:10b6:408:da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 09:59:32 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%8]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 09:59:32 +0000
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
X-Inumbo-ID: 320a50da-77a8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670579981;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9PLbwSmciB0fc9L1wH0pje760Lk0m8ONU2htITtY6tI=;
  b=eJ/U9duVZGVSc66K6q9lisTC4k2KWPQJyltqE+7E92n/aXIGJeKLZNBD
   KfW9U45fcfPSYXQBNv9d3JRFpxqOTYuTgjf0WkD4k7ubGvcE4cu5qfXVv
   imMNwvr3CrHBdXE9e0hjbS3YRCJQ0qD1n4siEi0UgiIL3Jhm4t5pczKNh
   A=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 86514834
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uMYyJKxwJgR/67lkErN6t+cQxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 2QaUGGFMveLZ2H8Kt4nO4qxph9Qu5Ddm9ViTgtt/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPaET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVxFp
 fs9MRYsVSigle67ze34Y+s22Nt2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rGSxH+rA956+LuQycUyumWs2FYpV0c0bUL85uKbhF63RIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICUCHQ0M5oC6pJlp10yfCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:nxgYr6A0ozZEqe7lHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="86514834"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXjxmY9L/qxMlAATPilGjiNrJ/askKvt+OGhTmQZlFv8uV+ZrFCuHb0wViBL8W6q6czcz5ft83NrDT9QaALV6P+iHEZ1MBjrgR28V9GRUdeB9vDGCnQ19iRQdbY+aOJlwIUoIXITfuUnXC1Syw2gaqjF082VKknl2AvJSuo1eZUHEcHnfLYR7GVI7bhPlq7dZjp3cclQbatjQAnuv+IWh+NdIpSSHoI18nLrLvxAt5MUiJAUUJfmcCKd1tzRQin0iLlq8wSc7sfr3OwYA19sn59hx5HM4JWrkV8UpFziTVM7NZpL9n2ILnsC+E1F7BetQjNsJ4LeW7LFBRM2SNESIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xORGWa/PrkmSH7TG7scmXXVlksUsjoPw2X4myDpJmvc=;
 b=fXIP69BiaVZZH3pR/NRn7QFMKoUo0dIIFVGi29xsKAhRu1VTmjyCcpcoT3NocFIisZGJAMXchL938pmiPwsHHuNbx/fQNpRrLpuDvuzddpb8rFCZQxvWGMWIugahGkA1+rs09FGid12IAHq+JokfU+WuovWl01EmzPom0Hwy7vTXLQ5qg3tpAdTKuRu2ar9t/faZqUOzzOjFoLkBp+RN6SRpUWrxTnC1bR4k6Hmuts9FLniWtc62STckmhLYSeFy2itskqW41OQbvAKtVOz4xXcsUg0LPGVXXSDDEhSwSjQuQBjlSyDGk3hfny9FxY3HjE3/ofx1a2VMSe5EEoWgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xORGWa/PrkmSH7TG7scmXXVlksUsjoPw2X4myDpJmvc=;
 b=AbQKjdY3N+Ve86fGD6pi1w1h9RCGw2DEJ1VA0fRipcTN6c85cnQbx4AYCmRsgBqLyk5KZMT3Cpl2xnS8wyfmXKHATxkGb46J2rc0KjRePmMA+RIGOT5dHY8NqbGGmFs+rRJsw8m72Eep2Xx7/MCg3Z9YvkZOguZeRAk5Mo2uZbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 9 Dec 2022 10:59:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Message-ID: <Y5MG/osKnrCMsztu@Air-de-Roger>
References: <6189fed4-2aac-8ca3-90f6-7a750a8993dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6189fed4-2aac-8ca3-90f6-7a750a8993dd@suse.com>
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d65bb1-7343-4876-45e1-08dad9cc11e4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wTFZhmu4m28LGEWa7G8NhOJM4sIElqr6wB/hlKnR/sdO58Vb0/l8kizCiLOG1iEapatL+Rq2mHQLa94I+JeIoT4VMsnzfbfg3W9ns0d66/tjVvg6vLj2ZmcOY3WJmTDdCvCbqMxUTmBAVdc1gD/vgujUG58hC8FNkTzQ3IA/2JPSUql65Wiu47PrdjFuhF2QFF7IN3uxlyN4JaYoqVLFrvLmVtTM0aUwyi6kXmgS5HSvD+GqmtTLG+Et39rrS76OY3FSJF+4pIsTkU54L3HdfZqOzGR3zSEpnyBLJK8doQ3FGLFfM5M9TOAEzsEKxnEZbyU0sV1Sym9gUBY8penS/slmqx+ILHOI2GXbMbRoEuRYFN1k5Mq2izxRkIEUUpLup5S4CyJBW7I5fC8N0ESg+2UIcr+2IhqptC+akgOA+dBFMxm0qU0bp+nKmlrGM1kmcdKp27m4Vbcxx6aCEZZJXSnC+8EyH2wY8/gcuEsHoHtMdWWIaPWhVMlnzTOi+pEAt8+VGtMegOW4Oh8WxFf18l2G5thB0DDEKDiBDYb8zytGWD/8NTBBVDXOgRPObotM0XqiHPZqRJ9kKgsbUgLZa5tRgGhC1UPktOLxWcDXq4AnF6oeXbjn9Ws08DVYDcOpf9F0LY6Xf+dyXqxBxxqSnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199015)(82960400001)(9686003)(26005)(6512007)(33716001)(186003)(2906002)(8676002)(54906003)(85182001)(316002)(6916009)(6666004)(86362001)(6486002)(508600001)(6506007)(8936002)(4326008)(38100700002)(66946007)(66556008)(66476007)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJIOHZ6VUd3U0dUMDhuVFN2S1hPT0pNQTI0K1ZUajFuNnRpSmR6R3U1V2hv?=
 =?utf-8?B?T0tOWHFpM29Ha2pyRENwRCtJNUxnYjkrR25OdTI0TzBNejc1dzZzNkpSVVJi?=
 =?utf-8?B?K0ZQSWZQR1RVL2ozZllqYVM5WXdHR2VBQ0N0SWNyemZ4SGI1anZUMkRTcU9Z?=
 =?utf-8?B?VnZqdXZKSExNR2VneWluNzNIRDh3ZkIrQmp5TzJGTzhyOEFkM2JpU3ZnSlY3?=
 =?utf-8?B?L0toUHczMzd3SGJCeXhNNFJLb0FwUm9SMEFFNDgzUStoYlJBczRXNGpwZmEr?=
 =?utf-8?B?bGcyU1BkOEVaRmVLMWk1UW9UOUl6Q3FTak1YUTgwUGdVeUhDakd0ZmprSWpL?=
 =?utf-8?B?Y0l5WTMva3Z6a084SUN2ZXRMb29SZGRhSjljM0dIWjUwMHNoYnE4MENYN2Zt?=
 =?utf-8?B?MFI3b0t4cFNvOVRwYlA4V2lBSDZycHlnOU15UElsRmZ0dTUyNFZCQWV3b0Y5?=
 =?utf-8?B?ZW9WSHdkWVI2azlRd1FnZFhwQXJNalZJMHN1MkhuUUFjRmk1eU80aERLUkc4?=
 =?utf-8?B?N0hkQXVaMlFXZ05IQU5HQUM1a0hXd2sxaWozY09wNXV6Y1VYWnR5TXJJNVp5?=
 =?utf-8?B?OUVtVFFHRENZVTN1Tk53dkJGck45a0xVOXlhNnR2dnR4MkVUdVNrWDZmR1ZR?=
 =?utf-8?B?MFpRSmJYUGUvd3BENzVVOW0wb1lOckNTeGRpZDNGS2JONGd4VFB3TkRKczJk?=
 =?utf-8?B?eXUwcXdKTFpJYWcrYXpuVGI0MzE2K3lvZy9hVkE1VDhUcUNrKy9TY0FPTmFs?=
 =?utf-8?B?Y05aaG1mUW1FT0tCbVNMV2VkSVh2b25kMkVjdkdxclhUSG9WK0orTTNZRFRT?=
 =?utf-8?B?YmR5RUFXU21abmpKYlRGUHRzZnlLdDgxUHE4VTFzcHJhQjBpK0thb2hkVXU3?=
 =?utf-8?B?SnROZWg1eFlwQkoyMGdtNWtCbVA1S0QrSE53c1pTb1kzVldYU1puS2hNUzlE?=
 =?utf-8?B?Zm1nRS85OUVqY2pLb2JxZHE4Q3k2dFNLRmxtZ2xrNUZkWTA0ZENqdkVsQ2hw?=
 =?utf-8?B?Y0FVUTBoTVNHY29NU0tCeFN6SUUvODJNUFpxN2VSaEU4anM3SDNCb1U4OUZM?=
 =?utf-8?B?L1ljd1kwcFNCOFZWUXNtcjcxcEo1dnJnZXdFUlJqTURtRTBhZGdEN3VZUWdh?=
 =?utf-8?B?VDFKMjZhSFo0YnNwUmt3WTVvdUZDS3RXUFVqWDNjaWd2eFhrRkJkaVlmNkNq?=
 =?utf-8?B?eFc3b1BNb3JXK25xYjByQmNzdXhKbDFlUXJ3YjU2MzkrZm9PZVdTd2N5VjJ3?=
 =?utf-8?B?dmdYZktwZnZYa294dVVTTlhBTHVsbkx0ZDZ0RFNaRjUvSlNrbFp5N3FBTEFB?=
 =?utf-8?B?Y1crQmVYeURJNm1TVlNud2l4WDEvdTMzODZEVDVUNy9RTU5iZ0p1SitnRW56?=
 =?utf-8?B?K1JpQjRPdkRjOURWZjlUNm85SXR1WkZTaDZFTTNFUjRrRWFnWlJxUW13aEx2?=
 =?utf-8?B?dm43cmNoeWZ2MEYzZndPTVBsUHQ0QzMrcTMzNHBTYUZhbEZJdnB0NVJ6MDMr?=
 =?utf-8?B?UXlXYlJsVXp5ZkdsTmxsMjdkTXVqUFdYM05Rc040eGt4OVJNL0pXdzZUWUU1?=
 =?utf-8?B?YzJyQ2VjSUQxMk0xMmNCQnhxWXM5bWNONkpxSmRjd3JpMXp2ekRXem5zVStr?=
 =?utf-8?B?bG5nTldhMHVHUUNlL1RoNEs4d00zNksrS2NtMU1UUTVTS3c4ZlFnSTJJSFhK?=
 =?utf-8?B?NkxyZnpscGpQUmQ4UXZVZzR1RFc2MDVhaUptYTVKRDBJR01sbUxpZ2tZVDIr?=
 =?utf-8?B?Vi9aVjdCV0lTeGRYOFAvVEJGTENxR3JLUm1WeTROSS9SWU9JZUR6VTBYU1g3?=
 =?utf-8?B?MWp2c3VXUnh2SkptTjlBZWU1QlJOUmJ3UXZTUzFKc3ZEdDZBcm1WbUZmbzBR?=
 =?utf-8?B?dmhiNUFFb3B3dCtmZExUT1R1MWE5RDBuSHV2aHhBdUJTM2FDWk5Xc3BRNDRM?=
 =?utf-8?B?aDdZais4Q2NzSE9MRUVaRDFRZ3VCQ3ZUczhnUWNLNzI0RVdlaHhlRERDamJN?=
 =?utf-8?B?R21QditsVElzWmtteThIOXF6UVdrQVFvRWszQWkzdmFyZVF6RTV4d0tDOUdF?=
 =?utf-8?B?N2JXRUpzVnMyTnRxNm9qcUNselBhQ3VBRGxCVmpwQlQ1Ymx0eU93TkUydGpY?=
 =?utf-8?Q?gmLHib5Odk3SSr2BgZbUIhiC2?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d65bb1-7343-4876-45e1-08dad9cc11e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 09:59:32.6682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DvEaKlRUiP7JBn0R92UEr/KQA86BQU9BaA0A+EBANt0LRxGaYjS+6uiD7bxxu+i/zqmRnSyGpE7MaiAzK60/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4994

On Thu, Dec 08, 2022 at 12:24:54PM +0100, Jan Beulich wrote:
> core_set_legacy_ssbd() counts the number of times SSBD is being enabled
> via LS_CFG on a core. This assumes that calls there only occur if the
> state actually changes. While svm_ctxt_switch_{to,from}() conform to
> this, guest_wrmsr() doesn't: It also calls the function when the bit
> doesn't actually change. Extend the conditional there accordingly.
> 
> Fixes: b2030e6730a2 ("amd/virt_ssbd: set SSBD at vCPU context switch")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is the less intrusive but more fragile variant of a fix. The
> alternative would be to have core_set_legacy_ssbd() record per-thread
> state, such that the necessary checking can be done there.

Hm, yes, it's going to take a bit more of memory to keep track of
this.

> This wants properly testing on affected hardware. From Andrew's
> description it's also not clear whether this really is addressing that
> problem, or yet another one in this same area.
> 
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -699,12 +699,16 @@ int guest_wrmsr(struct vcpu *v, uint32_t
>          }
>          else

I think you could turn this into an `else if` and check if the new
value and the current one differ on the SSBD bit?

Provided it fixes the issue:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

