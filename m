Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3BB70499E
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 11:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535094.832707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyrFE-0004oc-VB; Tue, 16 May 2023 09:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535094.832707; Tue, 16 May 2023 09:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyrFE-0004m2-S2; Tue, 16 May 2023 09:45:24 +0000
Received: by outflank-mailman (input) for mailman id 535094;
 Tue, 16 May 2023 09:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyrFD-0004lw-VL
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 09:45:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ea51607-f3ce-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 11:45:21 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 05:45:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7284.namprd03.prod.outlook.com (2603:10b6:806:303::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 09:45:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 09:45:13 +0000
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
X-Inumbo-ID: 5ea51607-f3ce-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684230320;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wz16RpBAU+WLkMITB2r5LJynokysZuS3mkSNShEQL5E=;
  b=ghGO//JFicYkGkxUPah5IPJ7GeSEpiSjMvyl2qy6eVikuvQjCEDcflyg
   ptVXhl2KYiO9d4X14E8OdFPX8B/OEVwwZ6YDvV81v6t+vNxLiobSvEZLm
   kOcuP0W6MHYekWtVa4ZuagszuB0xlo+wAX3JrH3epOjwkEOXS5A2pfLwo
   Q=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 108521730
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YgaFFajPCZKPcmjfCdGzW+PnX161TREKZh0ujC45NGQN5FlHY01je
 htvCjuBO/+ONmD3c9l+PIu09U0BuZDcn4djQAc5pSlkF3wb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QaAzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ0JRU1fjWevd6tyauLUNB3mM57AdvCadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXoq6Qz3wbLroAVIBM3DFXmrqXgs3SvfoNaL
 1A/9ic3nIFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ5iELJR9M6Sqqt1ISqRXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:qzU3sK3PFXu9NyBT+KmiKwqjBIgkLtp133Aq2lEZdPUzSKClfq
 GV88jzsCWetN9/Yh8dcLy7WZVoI0mslqKdkLNwAV7KZmCP0gaVxedZnO7fKlbbak/DH4BmpM
 BdWpk7JNrsDUVryebWiTPIderIGeP3lJyVuQ==
X-Talos-CUID: 9a23:EMD1m20MXrTTcb8+cQLnubxfNs0ASm340U3sOEahOXxQU6OfEXKC0fYx
X-Talos-MUID: 9a23:oRFQBQgkRhZvSSzfKUbXL8MpOuYx7fmhVBk0q4Qj6syAKQd8Ni6spWHi
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="108521730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yu0b5Au0lUHeN1ThAGBh0Is3mw9qL/R6ONFxPEFHu98zDskNADXoOX2ndys5N+naRuAW5k4wdzmdVtYw3c7+giPkUsWuYVPyG68px3a7PPoAnq8pq2fbu/5EXVy43biDgg2rmesg3W2ZQVcpG+ruQaG0724nZRTQ1WL3PDcvBDyocXdrAZmhwBDMLGk4Ew05mtw1N8XoqubUzlgJZjoqs2bgY+DqXg5nja3LTzYXp8YAN4wZsjRxF3SAqHjgQijEL612/cpC+SUTc4TTvZ2tvGARvXHQSWQ5y0RaRRZywnArFWtuTWmlTS0MlZbS+WYm8VsGlWb8yfdz5shpogrz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pb/4DEpQ/IOoganG4SgFpoSATg3+6drrXwMDE97cgDo=;
 b=f7SYF/rnlqu0Jm0EzOSAXZGIuI9cMaEG0eFiCSfI1ibEQ2rabdDskmXD33aSdn20yRzSnUyxaaVMo7knWeyYeCBG0JmQJ67xvShGQvOjY6t3PcWQkXvrhikb8kVG6jGkIk98RwXUzVF1noTILqky4W/5E0v3XsotHAuClgLR2W6mULSb0FZWQDVeMLSta07f/EQoqNZNofbxg2KazdsREID+sYJEHOIAgBjFAcwhawwtci+nAAPJP/I1jY738dtcH54iLBLq3Hdgmmwlqrn6ZK2hR/P+XgSQEmkR7eMZ9qnjzCzTHIp7+MuaJYgdAypUSAqlNmaftTz1YJkiSGGNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pb/4DEpQ/IOoganG4SgFpoSATg3+6drrXwMDE97cgDo=;
 b=HP7KTy2j5PdYzbIi7fO2m5jNGcezsnPInlZ3JYXed/HZqXeMD/An6ulAhfTAcPsnP+JETWQOaoQWKcKFDVQwfZSwFm6CWUaqJMbofjneFJunvA9c2SkGNQsKoItjGO+GrsXO3iXvNotz259pn/Duieotv/d6UoJhHI4rSpZDIZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c819848e-d20a-a83e-9387-dd4fd95a6daa@citrix.com>
Date: Tue, 16 May 2023 10:45:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] x86/boot: Rework dom0 feature configuration
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-2-andrew.cooper3@citrix.com>
 <97825c89-87c5-1156-5621-9d03286fd865@suse.com>
In-Reply-To: <97825c89-87c5-1156-5621-9d03286fd865@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0688.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fde6aea-adfc-4e99-9a63-08db55f23ecc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9vdCYsSe8jy8krajKqvvZf3NHyRLPgjkVg0aA8/hTBr+3Ne9SspgnP2uOHsCJlxNQJFyVIux4fKTgh8IkeBBjcxvkO39yjvAoN6Okzz6TMuYb0Urt04bj1JbISi6/0Pnu3TMm8SPkGGO2H0vMpPBlbkKYlykq1HGNgXkLco7JdbwV+WY59vwdJb4UqZSxli/CDmW0Khc12G0ViKVDzW+7S273JzfdQi8TprdJ61n4tIUPOLr+5ViMIR/UQd6fPhMiTh/+Pnw+flNsDTQiPmhWZMCKJKcSTSCmoOPJ15dKWLxOmd9wc2w3a/MB+JjnsdoSlcge1SWN1rD/jK6UfqPMg8tEpibc+WB0Eb1+leo5uhogvQ8sP2RgQ15LPvkN5wo5rRdPiNkqzhpLCpynekRmNMCTf1QcLvkak4Z80HdvkRPHGZnU5wYjySpMaF/YFbrXBLS6Hac0xLn3b/vtMfBkmqYERvX/R0mqzx5fdoOL69ru1+HqcPVBulf+3muF/waD1B5kxmorlON8h0ItGuZ2Jr76H5TPzCRdJuq/CkhgRQotZcEuc3YTh8Kuu6OS91fFYJPyvmRuQ7by43nx0TgEIpWUAovnnyB7aMjejN/xnGRRngkd5Ar8EvzhvysHSGJ8Wrie2h+Kb5HABVBxEm9+p+D2erMlG8EaDBkJSe2RDHXlIx/ud91m3Hv2tJm8O0u3u+RWalBh7xKHt1oNOEn4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(83380400001)(31686004)(5660300002)(8676002)(8936002)(31696002)(316002)(2906002)(86362001)(2616005)(54906003)(186003)(6506007)(478600001)(6512007)(53546011)(26005)(38100700002)(6916009)(66556008)(66946007)(41300700001)(82960400001)(66476007)(36756003)(6666004)(4326008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE9PZVJUZjNsTmJ3SldLNWN1cmVsS1BzK0NwT1R2QXg3K3crbWhPTExNUHBU?=
 =?utf-8?B?cVhnQkZsS0Q2U1hHM2V5MklxYUcrS2hNdmhBYU1DVm41V0VTSDRNNWIwM0Jz?=
 =?utf-8?B?ZU9Hb3M1Si9UR1BrUHNzSkdNbkNxZDNMS25MN2NDd2gvOE1DK1cwNkFlOEc1?=
 =?utf-8?B?RFF2WDJYNHFKNlVqeU9tWFNmN1lRbXY2QjJFdEsxSDVxa2M5V0kvUG5MeXRH?=
 =?utf-8?B?ZHF3OFRCSEwvQmdwSHEyanZ1RHJ2RC9UcFRhZmNENk9wVk9vWWFkR0JNVW95?=
 =?utf-8?B?ZkZoUi8wYmtid0hXRDByS1U2cEhSbGdzYnZDdWc3VERFL21Vc3hZR1JxQk5R?=
 =?utf-8?B?b1NORVhGSXJCSXZRTFJZYU94elRYQ2VjYWJJdjM1TWlISFFoSUUvNER1RUFL?=
 =?utf-8?B?dzByUnhhbk9CU3RBYzEvelQxMmFLMHlTMFArU0pEU2VTTzBLUWlma2Nyb0ZF?=
 =?utf-8?B?THdROXdmT3BnVEFMZXJoUENTR05vTm90ZU9FT3JteUU4dzNWSjBPcGxtWG1K?=
 =?utf-8?B?dEcrMXdzNWUvN3pPajZnR1NLc0paRyt5ZS9Kc09CWko1ZUVRajZCZHc1QUZR?=
 =?utf-8?B?dmM5WkFpYkF2NC9aV2pHM05yMWw0U3lpeXFwa0JDcnJTOUUrUHlHZzgxZXFN?=
 =?utf-8?B?UVp0Q2VHaTBKWFhOaENwU1hNd3BGckR2aGNxenFLTG92cWYrN29PVkhaaU50?=
 =?utf-8?B?MituMW92MHpxZG9vcVhJWlZHdHFuZ3hOMUdWTFRKR0VZcGhWM0Q3UDBmRTRD?=
 =?utf-8?B?V0xFMy9FQndMR3NPQTFBU09JT0RHOUtQbktyVXpsZmh5RE9DVXJjdTBvTm03?=
 =?utf-8?B?MU5lV3NvSTVCRnZxcXBjaDM0MlQ0Q1JBMDh2aEppUSsrZWVMSHNHMWc4K3lG?=
 =?utf-8?B?aW1TYm5uNTZjaFl5WlNFY1BiZzZHWG9zaHVxZGRiSmNtOHJsUFJEbWFvM090?=
 =?utf-8?B?UjBGaFpNMGVTVGVYcXN6TlFWRGt2S2RoTXhGbjlUbnc3Z1BKL2lMM0w0YWJB?=
 =?utf-8?B?bFRoQzVrbTZpbERwSlR3S2VJMTgzZWFRdkF0NXBLd0RZUjdaTFBrdG9jYjVB?=
 =?utf-8?B?alQ4MUUvRzFWZjZlb3EwNDc1ZW95aWx2MndlUC9EYXhqbXArdlNFMlFPcFEw?=
 =?utf-8?B?OTAyUm0rZnNXcDN6MDYwVzhZSmVlOUJLSUVWWkJhWnVlUTNlOTcyT0grUnJt?=
 =?utf-8?B?RnpxZTZsMXVxSXp6OW5ER1Qyay9xTEV5TDRtejRjUlZ4aWt0NndhenZlRWI3?=
 =?utf-8?B?TEt3dnhtT0NZbmZOdkV6TEIwbFE1cXl6OHFhS1FmZERvWnBYYmtWWEM3YUNi?=
 =?utf-8?B?Q0FFaG5PRUhIL2dTWXYzVVp1bXQwS1ZmZzAzejlDS0NsZ0xIa2ozb1IyejQ2?=
 =?utf-8?B?VDZSVk1QK3VGTTNaOFU1OE1sVW1BaGtTNlpFNVBWUzBrc2cyZmNocFBSa2NJ?=
 =?utf-8?B?aHdzcHpDRHJiTEhiMGdka1dMOGNib2hLbTNaZXRGdVk2SWFFSVRscUZMRVpm?=
 =?utf-8?B?QllFTnZmSkFZdlJkM3hDNERFTmVWZm1qRkk5V1huNmlscThYNUpNdExBWVNP?=
 =?utf-8?B?YkFIM2JzczN3b2x2QmlIWUJmS1BRVklKMm1KVkVjMllxd1BiK3pRRXNwOVpt?=
 =?utf-8?B?NitwM29CMWM0RFJvVGRCdEx3eUY0dDlZcEpIczFtK3I4Nllhc1RaUWxON2I2?=
 =?utf-8?B?d0xIdmcwTi8rNGhQWEt1M3JkVmZqMjVyTVY0c015VDVCc3NoY1BYcURyTWFo?=
 =?utf-8?B?RXFsY2hxUEdjY2tRb2o4cEdGblNjcnRDY29aWEVJU1JTR3dzU0ZQVk1XclVD?=
 =?utf-8?B?aHZtd3RXMmgycEtBMFY1RmpXZzJoVDNvWXhidlpSYUZ4RXg4YjRIaUhWa3lm?=
 =?utf-8?B?elNBaVhCZURJOEYzUUVtQURqNGJrNGE0WEhIWXd4SHRoQzlYbW04SHlBMkpR?=
 =?utf-8?B?UXNtVnFsdWFjcVVVdWYrSEpMMEtCanJ6aWxaQTI2bzZMTmgwZG92K0ZqQy9L?=
 =?utf-8?B?UXU2ekJLWFNnY0x5QnU4ek1MMVpYdjQ5VFk3K2ZvR3dtZFRqOVdXNHBTZ2Q5?=
 =?utf-8?B?ek9XbWhaUjAvWHpTdjFxWkFoNEphK2htYWJmNmxyb1BhWW53SThIb3dNS2oz?=
 =?utf-8?B?Vm9Qbkg5NG9VdHh3eThTbFpTaW5lZ3B5Rm9pOEp2cVNIN2JaQmlHYlVWcjVS?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tm+uXat/WQjMGBH/uozvTpWprha0wYKo7JQnoyl3Deojo1ziravaZO1p6fGy4+7Y/a1bwCcjh8FkUJHxPnmoirShrRo8Vhqq6hlON+Pu4MQc6d7OotOAwwZDNYBMS/HsH+5W86Fg+fUJaVMWHHSzOogYcPdAVRjtBpfytE0CvPHc+tfUNOr8PGco+H8ZjykbxAfRg6LQQIpq0Obp3ZKMRWLVPyLM1YazVtD2tyIgVXthFurP9fuLv6PngnoG7o9wsvwaa6eFABuT/7R9sUA0Y0NGu27FugK9juUfZI4cVzJtGRGH2HfGYO2LAI2XGUtM8tZ7PWtp3cGgXcWw0jQjzhpN4e2x4Zn5eUvSpzo2wPVG3+r9Tn7uo94EeCmkYOizBz8gz2pqcSLoGnOMZJiwm4OxzJT/cnPLMW4ekjvi24lAMWqdIyt8QDJgGaH75dHlz+xv/5rlubn/8l4ECoRCMUJwaaGp6pHkE37nuhUtc+qFrL0/58NSW19vhFnkYah346BZYBdNd9YfZWyvB2n+tWOp6g+ub/ysEZGiPnFjg7ZBdxJpYtpJmxAi/RYVnbFKNubx1+zi6Au0pwcFcccd1MknVwu/CxVh3BOeiMLC8wbo5Fa4bbhycoLZ3Ben1kr6WIvKyXIL1FeRAi7XTkcPydGu/0DQb24lCseTbEznxUX40b4zUsRPmJEDjzaA5t37pSphSc9tfmqslJb76QRLFhRRShiVXH+4kpQ7VKQaiPH2JigU1rhEeKxMnQpw+kH2SIX/j4YTbTlcSYztzNxJFd2gd7Re2RRz62Bqg4AgPq4n8JmzX5laxD/9oYypSmkS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fde6aea-adfc-4e99-9a63-08db55f23ecc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:45:13.0734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcB268PBWdlp/AvNaELjRjhLOnNoH5p44X0FdQ9csnj9Z16VZlTK5e5O8krzkn8mk5OEks4OXkhiJByviqsVk+WO3Hmi/xq7dK6N8NEa05k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7284

On 16/05/2023 8:58 am, Jan Beulich wrote:
> On 15.05.2023 16:42, Andrew Cooper wrote:
>> Right now, dom0's feature configuration is split between between the common
>> path and a dom0-specific one.  This mostly is by accident, and causes some
>> very subtle bugs.
>>
>> First, start by clearly defining init_dom0_cpuid_policy() to be the domain
>> that Xen builds automatically.  The late hwdom case is still constructed in a
>> mostly normal way, with the control domain having full discretion over the CPU
>> policy.
>>
>> Identifying this highlights a latent bug - the two halves of the MSR_ARCH_CAPS
>> bodge are asymmetric with respect to the hardware domain.  This means that
>> shim, or a control-only dom0 sees the MSR_ARCH_CAPS CPUID bit but none of the
>> MSR content.  This in turn declares the hardware to be retpoline-safe by
>> failing to advertise the {R,}RSBA bits appropriately.  Restrict this logic to
>> the hardware domain, although the special case will cease to exist shortly.
>>
>> For the CPUID Faulting adjustment, the comment in ctxt_switch_levelling()
>> isn't actually relevant.  Provide a better explanation.
>>
>> Move the recalculate_cpuid_policy() call outside of the dom0-cpuid= case.
>> This is no change for now, but will become necessary shortly.
>>
>> Finally, place the second half of the MSR_ARCH_CAPS bodge after the
>> recalculate_cpuid_policy() call.  This is necessary to avoid transiently
>> breaking the hardware domain's view while the handling is cleaned up.  This
>> special case will cease to exist shortly.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one question / suggestion:
>
>> @@ -858,7 +839,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>       * so dom0 can turn off workarounds as appropriate.  Temporary, until the
>>       * domain policy logic gains a better understanding of MSRs.
>>       */
>> -    if ( cpu_has_arch_caps )
>> +    if ( is_hardware_domain(d) && cpu_has_arch_caps )
>>          p->feat.arch_caps = true;
> As a result of this, ...
>
>> @@ -876,8 +857,32 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>          }
>>  
>>          x86_cpu_featureset_to_policy(fs, p);
>> +    }
>> +
>> +    /*
>> +     * PV Control domains used to require unfiltered CPUID.  This was fixed in
>> +     * Xen 4.13, but there is an cmdline knob to restore the prior behaviour.
>> +     *
>> +     * If the domain is getting unfiltered CPUID, don't let the guest kernel
>> +     * play with CPUID faulting either, as Xen's CPUID path won't cope.
>> +     */
>> +    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
>> +        p->platform_info.cpuid_faulting = false;
>>  
>> -        recalculate_cpuid_policy(d);
>> +    recalculate_cpuid_policy(d);
>> +
>> +    if ( is_hardware_domain(d) && cpu_has_arch_caps )
> ... it would feel slightly more logical if p->feat.arch_caps was used here.
> Whether that's to replace the entire condition or merely the right side of
> the && depends on what the subsequent changes require (which I haven't
> looked at yet).

I'd really prefer to leave it as-is.

You're likely right, but this entire block is deleted in patch 6 and it
has been a giant pain already making this series bisectable WRT all our
special cases.

For the sake of a few patches, it's safer to go with it in the
pre-existing form.

~Andrew

