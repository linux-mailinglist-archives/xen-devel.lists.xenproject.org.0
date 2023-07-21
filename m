Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCA75C7F8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 15:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567546.886751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqKX-0001Pz-G4; Fri, 21 Jul 2023 13:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567546.886751; Fri, 21 Jul 2023 13:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqKX-0001NC-Cp; Fri, 21 Jul 2023 13:38:01 +0000
Received: by outflank-mailman (input) for mailman id 567546;
 Fri, 21 Jul 2023 13:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMqKV-0001N6-Q9
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 13:37:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc6ffbdd-27cb-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 15:37:57 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 09:37:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5259.namprd03.prod.outlook.com (2603:10b6:5:245::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 13:37:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 13:37:52 +0000
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
X-Inumbo-ID: cc6ffbdd-27cb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689946677;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ocFNM03bu1GLAWB2YhELFtuETRzhkA7qwTWdavaVb3g=;
  b=AKFK+d99BZQy4akzbzh8ImZGoZ/JHWgZ2kZlXtVCKt1q2fsa3it4yaDj
   pJKVA6dIhp486e4l7wUQh4j+gvPCHj73bqtVs3/AiR6xcOckfh26vvrSf
   wNmQ9q2z5+qGKRyIRdHNIJlp+e0DM+gHwinKfEA7I2DgbnFjD1Ph9PX+X
   I=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 117435073
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TUSCG6px2U8TD+toC5IoXshPTmxeBmLfZBIvgKrLsJaIsI4StFCzt
 garIBnUMq3ZZGP2L99za42y8kNXuJTczIQxSVc5qywwFC4T9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB8oMiy5vsW5+amQV9NJop0BItj1MbpK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKLEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtNSOblrqEx6LGV7mdQJDonCGWWmNee1nyFRvd0A
 lIW6zV7+MDe82TuFLERRSaQnnmAuRINXstKJMcz4gqN16n87h6QAy4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9CmsPZjQNSwcf1PDlrJsulRLETttlE6mdg8X8HHf7x
 DXikcQlr7AajMpO26Dl+1nC2mqovsKQFlBz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6zt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:Op9a8qkRkWQoMJUPG7IBI6c9eZPpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3AK+VXDmvgbrp755EwB+cO0KRg6IsKVyHh9k73LHa?=
 =?us-ascii?q?jIntTbZnMa1GB5q5dxp8=3D?=
X-Talos-MUID: 9a23:PooLbgniATxf3+gTSWVndnppd+tP0vmQJXkjtsk0gNShHgVuOSaC2WE=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="117435073"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc8gVSVBut2vOyXfFQn0pqWO+ecA22EJm/X/VLU7L+sbcftjydeUJqSHG7FLvBSbrvwgKzG/sBXROPC4u+qGC9ZXXN5A45u66i8LeDdcByoIkTfwRkgkGeCZCLV7dGmEayLjSKq9wVkr8hggvU1fDy2SymbaddJNFtJJP0nC6lBWT4y2s5e9s5h0DYlbfZSQ4+ML4BjVr3fn7lB2iTHPn8C9/say36xdnXVpezBU+3ga+HzIK9x5UBCm1xe8mAQaFqnarLEKidpsGTppLqsZ7OseiQWNG0OkYm5RVtGlLbL2vV4aMbCiT5Xr3n0euwcxtziGQyQODTlQmhMgfIHAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGp5KHGWaERW7SP9NXvB2lhSCY8j+ezszZlvZ3qdXjM=;
 b=aXGklbL1sfnbx5QCUf+RnsdryHBU2mA5HhfK5HwlHDSuraXmPz/PzN8y16AID9vJwXLCaA8/+LYGGpaDbMEvoxckovpOUzoAOX98Qw44vhbhiUGOXUdH84Ep2pmB/cqLhonPCVuETyq8f3lJEh4/spvBggSLb0YQySuf73ZCr7rLvJdCTCo3W8INvWABvMB8YHsTadpZJW97dz2ii7ZaodLqlskYEc8LuLxarTKfENH0wfu6z1a8dU9QyEkRZWBQDAX0jT2rXe/j4p6nkQb2IKOdPbabizYixJWLHv1QENwkrzESih47cHzVZexU0M1+uzej2pG1o+/xhdcHinKGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGp5KHGWaERW7SP9NXvB2lhSCY8j+ezszZlvZ3qdXjM=;
 b=kBHA4MtdbgHfMlfRAr6bPwzMXheqBMHNqtt0kQZGkwHJYncpZxPA+ixNHklo3xAEoi70cOBUmHEcm20audEo2d4pBRHonHRViSdlcqI0t6XhQ/tZ3uE6fNs8gTXOcTF4fiZFLTcVSv7WihoHFmkq5PDp1DqFXMkyhfjT0haUQWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 15:37:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 10/13] vpci/header: reset the command register when
 adding devices
Message-ID: <ZLqKK1Hfg9lL4dfK@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-11-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-11-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 992bdeaf-64bf-4748-49cf-08db89efae7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmVnUScQhN++MUmlPz/l9f3fyfUMDRIt8F5Fhd3njBDtqzqj5s/uhdM15/0bBzLqzdwmpqJdexxLavnYvNuS3WOpafrcsT+Yeg+N8D4BoXf2v0CWgwFZUUAZPUjC23Fmhv+xog6IxsYS8BPSWKWUUFp8O+Do4V42twd+SuGLfD52wb5/p2W5FH3aH0e8Ig5mDahi/1F5nYNXUeUkOZWXnR4XyBjcVU3PpRJhZyUF4eqr0PiyD4awxWeIjxMPSqj6ka4fIfpN1ocjX9g2Kc4ZA4/rJD+xE7xNtG5gZNgZZmat0OPc6VCcdPC7i6jbwHw1OOxlnL2dkOkjbj2ZNRcA86rxZqDI+4E7Wo7PZN9JpGprwavYb1FWAJDdWtlz/k83EiMWMKHkk2RIuexz4XFI7KGSnP5aj8qnc+ZXV996L2uFIjmCnebrfz1iE4XyoCTRH9vsjHRlwfAZiWy8MNGIHqtIOdxUie3LlaPw4bv6qN3BXHY0RkMIdoHXql2HrvWYnZczz/8mHcyv6lx2sz7yGA/KYz6PB6Ud7JQX0re35h36UEDn3FV6R3sLDn30qfou
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(9686003)(186003)(26005)(6506007)(6512007)(83380400001)(66476007)(2906002)(316002)(6916009)(66556008)(66946007)(8936002)(4326008)(5660300002)(8676002)(41300700001)(6486002)(478600001)(6666004)(54906003)(85182001)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bThkRkQxeVhTSWZaTjZiM2EzLy9DUFNRRUk5bVBvTVJpV1dwZ01yM05rT3Bk?=
 =?utf-8?B?TDZDSUtSenJ2dHRhc1JTek9vL0pKR1R6TTM2YU45TldqSjlyRUFxbmtFVjky?=
 =?utf-8?B?Y2s0UkdVdmlIWmVLc2U2alFwSU0zUGRUZ1lyeDhYRThSeDBGTXd6aW1oU1Er?=
 =?utf-8?B?Q3dNVGpweFdpd1RWS1F2ck9ZUnJYdUt0b1Zqelp2cGI5d05tVVNoWVEyZndR?=
 =?utf-8?B?SjdOWmtFWUgzMjZORWJJSmtjNXZYaVUrYVJPdnMySGJwU2NHak5MekxJSC92?=
 =?utf-8?B?U1RwNE5oMmlDc1FBODJNcEQ5SUViWUcyeUIvUzlNT1cxWmJIYndnbDhqR1M5?=
 =?utf-8?B?VXJVcExiNUVGWjl3WkpVeVpqWnZvZlFqc1FpUll3SlZLSlJsWkhsN09SdHZn?=
 =?utf-8?B?UkdMSFJBK3U1WFpHT1FkN2F4Zm5yemozV2lzejh4eFAyclJLeG1jTkcxYUd3?=
 =?utf-8?B?TUh3OHRhendOa1VKSjlNWU1vNGFRUFFMd3lvS0ZoWWFOV3lMZXFlTG5CQnpw?=
 =?utf-8?B?MTNXNkFTUkN3RFVWRkM0RzhYVFhJamltWkpDajJaVDZIZFp6QTRZeDhINmpn?=
 =?utf-8?B?K3ZLQm55TVdHYW9nWktNSFhmWUxCVTJKLzY4NVJBaElaQkZPL01oMTAzaXFJ?=
 =?utf-8?B?cmRseGlZckMvU0xUV1ZwSW9HNTFQSDBESXo0ZnhtaDE1Tlhpa3d1cTZDbVFC?=
 =?utf-8?B?SERUZ1J4ZlBFR0NUVEEzOEtVSkZ0VVR4RGJSOW85eU9VWWRYbmhwMGZqS2VU?=
 =?utf-8?B?Z1BCTDdCRmtSTDhYN2hVOU9kelM2RXZGd2hMYzZvRmdFV0t4T0sxN3dmVXJr?=
 =?utf-8?B?YS9jbnBLSWs0UzI4R3RuT3FuZ2I5RG9lRGM3T2wyZGFrNlRnQ051V1pOU2ZM?=
 =?utf-8?B?Skx0VW1xVnZBb244d0lXaFNTQzVsNG9TRm9OdHlJL2ZGUnMvWFdUQ2VEMHll?=
 =?utf-8?B?amp0Y3lCNC9abDRuWlNOclFxOHcyeXdzckxMM0d5cVRLZlFMeHl0Z3Q1YmJB?=
 =?utf-8?B?YnMzNVZ4Q3VNM0llM1VnV2hXcDc0SDVLRkxsY010dkhwQmdyd1J0L3Z3M1FP?=
 =?utf-8?B?S1pKeDlnaGtaei9Md041NVJSRzNRMlR6amRRdTd3eTg1dUd5Mlh4VjlWQUJO?=
 =?utf-8?B?bTlQYmJ0YjN5VHlTUEhkU1FQeVhsazF2ZkpmTnRKMUZxbkZ1UzFQa2ZNQlBr?=
 =?utf-8?B?Q0tITG1Od0prQUxybG5WY1oreXk0R2xrelFhZU5BaFBYd2I1eE94UFhHL3Vj?=
 =?utf-8?B?MVM0S1VGSjBpWGJiaFAvRUVkbFJzRjA1YVpmV1ZFQWE4TnVFc2xzd3VGekps?=
 =?utf-8?B?Smgwem9HOWVhcW9TNTVTeVAwaGxldzYzKzBsWmJXUTFNR21uTmVBa0E2cnFX?=
 =?utf-8?B?UUg2L0N5YndiSnBZSUNRL3gyNityNmw5d2cxS1Q1OUYrSEZpOFIrOWhEWVcr?=
 =?utf-8?B?QlY0eEIxcG9laHB3c0FrMnN2OUJrZnh6alFqWFJqcVlxQU9HcDVkdkNpenAv?=
 =?utf-8?B?MExyeW9QUmY0ak1RNWNObEhiclRZL2kzQjhEZk8zMGNONEUxZW9tSDRWS1Jw?=
 =?utf-8?B?dmp0eWR0V2p1Q0x2VHI3UHdKYUpBUjltYSsyczdHYm93RXFBMUZzWC93MEtT?=
 =?utf-8?B?a21yT0NwVWtOeklGVHhWRnJ0ZGZWVlFQT2hhL21taWh6RHA4NWp2aDQ1Qm45?=
 =?utf-8?B?NlFIQS9seGE1VDdLS0ZLK3Z2N1BSbHRLc01zMEhmVUZDSEI2RFM4aGluM0Nr?=
 =?utf-8?B?UWx2ZW5aNk1WWTdPUnVoN0NPS2h2ZzdabnZIMk51ZDBJbSthNUFnT3VXSlYr?=
 =?utf-8?B?T0Y2ZXpGRm1hMGhMMEdvQ0dRb0lGWU1KdnJrYVRVMmszejk1eWJycTBLaFJE?=
 =?utf-8?B?R01JMmxsR0NYL3Zpd212ajhta3oyU2hLckxyREtjRHRWcGJESk9SbUhjRWtX?=
 =?utf-8?B?TjJicmhBOXV2MUZ4Y01CRGVkNnlnOUF3ajhod1dvQU05WGJCb0NlSk03VWdk?=
 =?utf-8?B?RkNxbHg0N043SHZWbGc0Nnp5SGUycmIwT2pCN3BEMkdqOE5RNE8wblAvazc2?=
 =?utf-8?B?Q0RkNjNnRFg5djVGOHIwbUNCdENhRUhrRVMzWWhnSFducm1GRVFyK2xVYU9u?=
 =?utf-8?B?S1VVTlk5NWlSaDhhQU5sb05IR0JaUnRPY2FRMGs0TFppWlR1WW5STlQ5MWlC?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0yjvAspcQ2o1l6PWapYzf1OHhhLwm+ypIYWwVWzG0MMHIaMHv9RwCzVyTgfWVU8iSQxsFBuz/bGsbekIbi3Y9YRJHmS4nxoKTGVKts46xKydbrjr8VWooEd9uk7NX4TB7BuwEzCjx5P17YhxUCaQb2eqlIUB/upNLBOQD30LoC9ihxxbaiQMVtZoDVH0K6U3MPaoZEeXCqdhD5WGQXAyxH+OVgH5fyXpLmLAjVd5ZpkQ+mIDZqOikhMhuo3cfeeQ10LHi2Iitvj7ni2GwNzb5bWETGCtePbXhyMRRFd5TrdpcTuSjhecJlqFZnTNY3FfDecD/5TzVgLQl9wKMnxUSOe5pVVBhseZH8JG2B8P5E/ZfWMyU8tunItefzjFqTw5kSg9veoWp/Va7bvHcJ8euZHF/CfYcvqWmTQn0o8KJ7pEKoMwLZ+PA+g9QfyFRORXizD7bE5NwlZ0ZZ9hFbKkdWWjDLUK8R4FXgObu3HcScV6D+EOeXLpX3NifTW7/W9NcmNJVxETGKRtHfZS0dVDrhmp2S7pKfy8tGesW+tngXECXhZqjwEPcjmCMUdZO23nCN44q+zIeDxXs1Xx58u56EDaMdQ5hdxFQDEPfMSxV7OaIwkvWlBTaz3BAoDSavWKoTm+v8R7XanOtv2M+AC8mJZwxpGeVDGHBZZHL2fW4qtuIFXRhEYnzxBpWOXAt7zGnkqBu6Zt1yUCUutqPB59hcvcSdr3y0rStbNGXnYx2cqai60ge50J5Bn+c2Ci1fq163rmn0t328URDhTXp8R+pMp6ta97X8iKmBKSBK2m76Y=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992bdeaf-64bf-4748-49cf-08db89efae7f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:37:52.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIBtGlcNScEMvCcfF8INnNZcIK71Cot5QpespFMJZbPM5yJh8aD4P0fa8Ag3wauhoDVmKU0TYsUwGcbZuvi94g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5259

On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Reset the command register when assigning a PCI device to a guest:
> according to the PCI spec the PCI_COMMAND register is typically all 0's
> after reset, but this might not be true for the guest as it needs
> to respect host's settings.
> For that reason, do not write 0 to the PCI_COMMAND register directly,
> but go through the corresponding emulation layer (cmd_write), which
> will take care about the actual bits written.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v6:
> - use cmd_write directly without introducing emulate_cmd_reg
> - update commit message with more description on all 0's in PCI_COMMAND
> Since v5:
> - updated commit message
> Since v1:
>  - do not write 0 to the command register, but respect host settings.
> ---
>  xen/drivers/vpci/header.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ae05d242a5..44a9940fb9 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -749,6 +749,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
>       */
>      ASSERT(header->guest_cmd == 0);
>  
> +    /* Reset the command register for guests. */
> +    if ( !is_hwdom )
> +        cmd_write(pdev, PCI_COMMAND, 0, header);

So the assert just above is no longer needed? (and could be removed
from the previous patch).

As requested on the previous patch, should some message be logged if
the command register is not as expected (0 in this case?)

Thanks, Roger.

