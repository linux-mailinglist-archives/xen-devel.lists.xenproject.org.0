Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1FCC58C1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 01:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188495.1509651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVf1J-0002iK-Cp; Wed, 17 Dec 2025 00:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188495.1509651; Wed, 17 Dec 2025 00:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVf1J-0002gG-9g; Wed, 17 Dec 2025 00:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1188495;
 Wed, 17 Dec 2025 00:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9rb=6X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vVf1H-0002gA-Hw
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 00:03:55 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de803369-dadb-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 01:03:51 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AS2PR03MB9930.eurprd03.prod.outlook.com (2603:10a6:20b:641::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 00:03:48 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9412.005; Wed, 17 Dec 2025
 00:03:48 +0000
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
X-Inumbo-ID: de803369-dadb-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hld0zTCpGmT4+9yJsWD0ZFLYFUlRfqUjiLixp0sxyvSzF5DY1addz18HExWzzUOYvnkmXLSe0y5JSpf5Snvw/LGzyqx51/IfCpmqalgf16Nqsnm4HnDaYFQpreDYwg+cJlmfEpuF5sAadoND3p3iy8cXkcYdZNAg2EU7IvsTda0ND7vgNsXmNufslaEsf71Lo8APYh1L0CJHyGeNAyDR9Ush4X88CY/Ek0xfM+Mxxb3da2/bNPdqEwLeaKuQctougxJAFmaK4P9RzxVvcNJM8CMWLvTN1lDJiT14UpLgOL59o/dpOGAI2jKAVfRnncmVBtfQBjx/G+TwJnOJ4k4WCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8/BE/sof/AYBwOHcH1aEOatyd7vO4x/dB7RRZwu800=;
 b=gZBnPQfmRuWrFJfTisBbeuQrdcMPWx2CmLp87yqe28mJjWN8Hlj3kXVFBsAs4MTv2e1z/yNSEqrfyz7Z0zZBd3sHWNLbmzc1net41fqOMKwjQBmmhkGp2aghoypKNXGjF/dx0WhD4juE4EheWmHKSykFHm0qSnNG/d7so3/3sZbCSotX4xizwLulBFPL8765xnzXKGB8pjkRG18DXxJBqAq19XO12xXkx5zrX4O02xAe1y5ZxNKYioqlK3O7xV1zIvWvwpmZ/YpoVOusrsQAOTBsEUW8teMyDwmY50soWRtJzbqnR1jbmnaP777LArT2+BFaYB2QaD9nSSjiD1WT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8/BE/sof/AYBwOHcH1aEOatyd7vO4x/dB7RRZwu800=;
 b=mYvy6jowmPxlPhwflUexreQoNd7kTVMIclLP22wnkxE+PY793WUkhu7sZIAVJ4HxqItLiFWE2qAYSGiroLxCHFFbAmiX/EZd8uNYKQ7DktGMrvhmomyEDAW5FO7iMXiqBFFHE2gdKv3dAm4Xp0LeDyizxQa/brqBOz+kj02R1cIAGcyPv5dP6VE4YTJEBN1V7GpUIVb4EDT2BRNkZ81Z4u30PXobDbf5/c7urJuxlXBEbLKTUfFddMkohAjgeLmGyjGlh+PLiOywz4WXImGSpqUqdc+PhmH0ltEovafySpt2qacsIYoVhi3L7OnKJ3IAlpWw3CF+zDBX20HG4lDbfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <627da606-d82c-481f-8f1f-fdc5dedb4dbd@epam.com>
Date: Wed, 17 Dec 2025 02:03:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] x86: move / split usercopy.c to / into
 arch-specific library
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
 <0ba4df43-e071-4705-a18e-d41636946d3a@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0ba4df43-e071-4705-a18e-d41636946d3a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AS2PR03MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3e835f-d605-4afe-ce36-08de3cffc0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wks1RGhVcWhLRjBNTnZaelhmREUyODZ6N3laZjc4djFZZWt1ODdHajNoQWdk?=
 =?utf-8?B?elpBQjRrV01RbGlFN3JQTXlHMmFGUkltMSt2OHhoUkVHQkx1TERhZkFSOUhz?=
 =?utf-8?B?Rm9qSXlhU2hHK3ZmZ3dreEpZTzVFQTJRbDh1TDR4U1JxTDNsRnNkeUJpQU9I?=
 =?utf-8?B?N1V2TVphdEVHWTBVN0I4a1VXd1VubmFKZzNMY21XU1kvdlplZEUrVnFhZ1M4?=
 =?utf-8?B?aGU2RHpBZ2RsbExPUXhERTM1RWppeWFnRjlEMEpaTk55WEJuV095bktaL3Jq?=
 =?utf-8?B?S3pKc2lYMHBoTmsrRUtNM3RaMkdJenU5b2t1RzFFMkErSVdTbXJiMXMxRER6?=
 =?utf-8?B?VmNTUzdQcXI2S1MyMGthc3FKM1JWQ3BaM0VGcDdkZ2s1blhIMDlnRFBmbGM3?=
 =?utf-8?B?dDV2bndIb2N6T2MrV0VjSkJLTUVJMGRVSG04ckRFRmkzRTdIU3NSUTdXem0w?=
 =?utf-8?B?K3UwOCt6WjNBRVJXbkgyY0RNVzdPV0Y4bG13SnpGWlJBT0RZWTlWL1c3aHBG?=
 =?utf-8?B?SEVVajRFZEc3bEFaS1FmYW01THFhSi9FLzU5UER5Z2I4RG1GTis4UWhpMTFx?=
 =?utf-8?B?ZGZVTXp4ckF1QW9IMm5BbU1JOEVveTRoU3FFdEE5Nnpoam1OMlBDQlEvcDlB?=
 =?utf-8?B?TFZFbXM5MWxtbXl4OTExWHFFK2xCY29ldVNnMTZsOWZJYmVHOFdQcmh1ZlNL?=
 =?utf-8?B?MTVTUzh0dUdkSHJkNTIyQ1pJZnoyblFnbUVieFVJQmdyWTdkbDhkeHIwS0dF?=
 =?utf-8?B?ZVQvdmZUNmNnUzlpMEZsNDZTb0U4dzJjU21KVTgwVWM4QmZrU2xOeFV2VFBq?=
 =?utf-8?B?Y2ltejRjTGZGZ1RnMEVZaE1QcVpZM2VBL0dxclhWcnVzMjM1ZXgxRTN2ZHJ6?=
 =?utf-8?B?NkNGU1dFNk1IR0VabHNlSkF4U2RPdEY0b2Y2OTFTZ2tOOGlQNFlXSE12bEJ4?=
 =?utf-8?B?c1VqTG80YzFkaHMwb3FnTml6UVJsaFhZbzhOZFdDbGk0TCsxLzZsTG4rdFQy?=
 =?utf-8?B?MXVWZjdUc2ljbmlQU29UM3VVMTlMUHNFMW1IL3hlbHJYTThIQVB0eUlvTmNh?=
 =?utf-8?B?MWpWWXIxRWFFbFUwM1M1NjhiSW9BSStSd0M3eCs3NGpqMktobG5Zakx6MzU4?=
 =?utf-8?B?WEJtUmNWaSszRHVrdkVLQmtHYVM0eWZtN1lNcDlKcnBZU3RQZGkzbEtjRlA0?=
 =?utf-8?B?MTdqQ2pMb2tnU0k3ZmxIOUJuNmhTYU15UDhHQXlLL091L3NCQzE3SDl2b3ox?=
 =?utf-8?B?WmFNSkFmWEE3cnVFQkpnSmZiNjNDRmRhOXpYdWNSL2YrN2dlSW51bnMxTm1y?=
 =?utf-8?B?eFkzcTExZG1pMStBNzJickt0bzMyZUtKd3c1VFFkNk40SllZRFIwYW02eG1z?=
 =?utf-8?B?YUR1RkNIckZDTkJSYUhBbGhtQnc4WDNXclFpTHJsN0NEY3dmb3NNanY3YWVB?=
 =?utf-8?B?M0VMVVJpUmZGeGNNRUhzQ2syblY3Y043WWI1bmxyMnZtbmdwbXI4enUrNVRP?=
 =?utf-8?B?M1BwREtJMXkrMEg5ekxNY0piTTN6SmpvV1JIRDJ5TFFBVWhmZ045L044b1Nl?=
 =?utf-8?B?Tkwwd3FQbVNDSS9PcldxS3gvdktxN1RJK0xkMlVpSythTGpjOS9GSXhCR293?=
 =?utf-8?B?ZDNnMHBtalRTUEd4WmJ3TStHV0Fja29FUGxEaVV0QUhNL1QvbjVNVjRPZjRR?=
 =?utf-8?B?aGhpUWVxcHJ2WGxSVWM0eGEyV3lEL1IxdElFVFQ4UFh4Zms2RytoZ2NkR0Mv?=
 =?utf-8?B?QjdMZWN1QUVrVkNrbWpzak8vbGU2NTZLOFlzSElwcGhRTkRBT2cvbkVSNnpr?=
 =?utf-8?B?SUE2Z1R5ZWsyc3FnaWdHcVNQbWtYUzkvdGpadVVFaDBZQk1zL0c5dmczeUpV?=
 =?utf-8?B?VFBlb3ZiNWNOUllWLytIVkFrb2FxTE9oMWdwaEtwWDhVR3VwR29CSG1SRWxM?=
 =?utf-8?Q?A1tAAyVolzFotq2do7c0DGP8pNdM41g/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTFIeTZBODJYenR2S1grSDJjbkpwbTlRbTJxbHVja3lFRGdXc1NXTUtLWFpD?=
 =?utf-8?B?UHJvWGhRdzY5OWZTeEcwOTlrdG5DQXVIMEl3NHZxS3kzSmcrWE5MZ3hhZFZv?=
 =?utf-8?B?REZYMUxqU29CTnIvMzhQdmUwcFlHRGw5QXlYR0dLeUc3MGdsckQyWEdDQkt1?=
 =?utf-8?B?bVVMVHF6dGhwODZmejJwUXBxTFRZRVhvL1dSSStEV01CNFI5RUYyL0U0ekp6?=
 =?utf-8?B?WnBPR05IN0duMUxQQm1zaXJTNkdYK28wQzZjVm8vRVc4RnhJbEZuNWU3UE9x?=
 =?utf-8?B?WGNXSHhpdkg4K3U2L3Juc2JzeGY0WUt0c3lQdTJXNjNCUW5veEVrQmpxMFRE?=
 =?utf-8?B?S2hDYStFcjlmQitMb3g1anZwYi9OKy8xeXJZM3IwdEZvaFRsMDBZQ2FIYmx3?=
 =?utf-8?B?VTIzN3JxV3JFMmpMVXZhdzJIM1hodmpBUUJWQmZZQWJKZ1lRMzAyd0N3T3hX?=
 =?utf-8?B?akhKWitpSkFBRloveVhWdGRHRGl3YlI5NjFBT2M4ajZDWEZFcFRaek1ta2F1?=
 =?utf-8?B?T2hrOTcrWjQxRG0zYWZibThyeUc4eEtNbUw4ZkYxMVV5cU1SLzlrSlhNdEZ3?=
 =?utf-8?B?enFRbUVNU3phZjVDQ0tUbFJLL1FsNFprY0FiK0RJZHR2T3Y1UG1jbFBMTG1E?=
 =?utf-8?B?YnlzbWtUanNnSHRtOFZUVW4yS0R0MkFjOWtnUlJvd0tIUkRRcmdGdDJSVWxn?=
 =?utf-8?B?V0RvMnJ1K3FLTUFxdHQ3M0x1REJ4Ynl4ZXFaZGpTeVFHaXlybkFjRmRybmFr?=
 =?utf-8?B?ckt3UG5qM3V0a05mSWJFK2hQVnljbUZ2RytmQ1ovRHdkWXpJYmRXVXh6dk16?=
 =?utf-8?B?aHpEQUlxUTNtY0V1OXl5OTBBVnc1UmhpN3g1dXBvUGhYdUxLYlp5bzlTSWt2?=
 =?utf-8?B?WUI0MlhBSUkyVHlvUE9MWmVnN1p5emtTZHJ0S2w3VzlQWWFWRkZZZDBNYTZt?=
 =?utf-8?B?b1dJdVJIdDIyczNhU0E4VFYyNExJSGlhU2szQ0lPVXo0dUh0cHFjY0IvRXp5?=
 =?utf-8?B?M05YQTNWU012c1dSRTB1WlRRc1crTWxDZG1HVGtxdmVUaEtaa05TU25rVVZj?=
 =?utf-8?B?NDNicmdmelc3eWNHQWhCc1RjcGtkc0h3T09EYTlNblFTdWdSOUFReFlUeUdV?=
 =?utf-8?B?M3R6Slp0NDNidEQ2N2JXNGQvYW9tOVpvS0wrSVpnZ2YzOGhSSS9pVTF5YkN1?=
 =?utf-8?B?VTU4S25EQlpySXRLSnhaMVdydFZtVlIxNVN3U0I3dk9LNklIRDlsRlY0ZkpT?=
 =?utf-8?B?WUdiQUk3TXRna1p3MXNMaEpJaFZQRzJsb1ZBbEo0eGt2TGtVbVpheStFYWRt?=
 =?utf-8?B?bjhBcTdKM0FmZDVDRFVURHo4c0N6T2NhZTZUMlA0SHN0SlVUeTVEZHlCT3Fk?=
 =?utf-8?B?djdZRzN6ZnRaTk50YnBpcThxSUdUSWhIZmxiT05VR2lZUGhRTUtkVnFLb01O?=
 =?utf-8?B?bnZQOFczQlBlRXBUbFhLZG1BL3BLTHQ5QUh5bXUyVndSNXFiVVZ5RithT1ZC?=
 =?utf-8?B?ajBiWjFydk1lUkhoNkNTbitjWHFuV1FwbHZBZngyb1JOQ2VZU0k2OTNDMVhN?=
 =?utf-8?B?WXJGVGltZ1dlUW54TC8rS3RBS0ZrSGQ5UTVsN3M4UlFRMVNrQldUdGs5ZjZU?=
 =?utf-8?B?SEZqMDdZdnJoZ3ZvL1h5NnJrdjlFTW4ySkNCU0J4aU1QZXJYVTMveDR4L1cv?=
 =?utf-8?B?WU5oMGE3cXRIamk3c3pMTXB1RXhBNjdwY0tPZ0Rpb0w3M3lQVEhGUk81Y2dy?=
 =?utf-8?B?ZFB4UGJHTzd0VVp0UmRFbFcrRTAzeFQyU0dEU3FnQjl2eERKUTBSSDZOYWRl?=
 =?utf-8?B?N1lNTjdhb3A0aWtZVU5pN2hYNXFnWFdySyswZ2hBVHY0eHB0ZDdBSGdzd0RB?=
 =?utf-8?B?L1Z0U09sVmxRWlovZ3d4Znk2NjBpWGo4UE0yejg3N1Z3cXRvNjhoYjNUSkdx?=
 =?utf-8?B?TUZ5eS9JcmM5QVlReVY5ZTFidkxTU1NwNnR3WWluSTJqRS9QVGRMWC9iRGRC?=
 =?utf-8?B?NEVnWGdBaU5MS0tDeGM2NEpSWGw4YzZabXkyNmJVR1gyalhjMlVFOWxXdVFQ?=
 =?utf-8?B?TG92MWRsMTAyQjYvQ0ZDMWw4MWxXNFdJNkdRbC9oL2RYSnpVNHZlOFVIVXk1?=
 =?utf-8?B?YkdRM2xadmRnVHN5U3NBR0R4TDMySlBiTitoU2pEYWIzSnJHUkJKR2h4M1hI?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3e835f-d605-4afe-ce36-08de3cffc0b5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 00:03:48.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CsHI9HThhrRNszLeBmFD5CXewT4v2xAsMZ0Qj8oEPAYRWKAfEnghHHjdIqrNKd/UTuALQQjiE0/d13FzsqqZiS5MTQ1+FMlDpVAGT3ot5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9930

Hi Jan,

On 16.12.25 11:17, Jan Beulich wrote:
> The file wasn't correctly named for our purposes anyway. Split it into its
> "guest" and "unsafe" parts, thus allowing the latter to not be linked in
> at all (for presently having no caller). The building of the "guest" part
> can then (later) become conditional upon PV=y.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Retain xen/sched.h #include.
> ---
>   xen/arch/x86/Makefile                         |  4 ----
>   xen/arch/x86/lib/Makefile                     |  2 ++
>   xen/arch/x86/{usercopy.c => lib/copy-guest.c} | 12 ++--------
>   xen/arch/x86/lib/copy-unsafe.c                | 22 +++++++++++++++++++
>   4 files changed, 26 insertions(+), 14 deletions(-)
>   rename xen/arch/x86/{usercopy.c => lib/copy-guest.c} (94%)
>   create mode 100644 xen/arch/x86/lib/copy-unsafe.c
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 61e2293a467e..dfb258d7ac1c 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -72,7 +72,6 @@ obj-y += time.o
>   obj-y += traps-setup.o
>   obj-y += traps.o
>   obj-$(CONFIG_INTEL) += tsx.o
> -obj-y += usercopy.o
>   obj-y += x86_emulate.o
>   obj-$(CONFIG_TBOOT) += tboot.o
>   obj-y += hpet.o
> @@ -93,9 +92,6 @@ hostprogs-y += efi/mkreloc
>   
>   $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
>   
> -# Allows usercopy.c to include itself
> -$(obj)/usercopy.o: CFLAGS-y += -iquote .
> -
>   ifneq ($(CONFIG_HVM),y)
>   $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>   endif
> diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
> index ddf7e19bdc1d..8fe2dfd88553 100644
> --- a/xen/arch/x86/lib/Makefile
> +++ b/xen/arch/x86/lib/Makefile
> @@ -1 +1,3 @@
> +lib-y += copy-guest.o
> +lib-y += copy-unsafe.o
>   lib-y += generic-hweightl.o
> diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/lib/copy-guest.c
> similarity index 94%
> rename from xen/arch/x86/usercopy.c
> rename to xen/arch/x86/lib/copy-guest.c
> index a24b52cc66c1..73284b3f14be 100644
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/lib/copy-guest.c
> @@ -1,4 +1,4 @@
> -/*
> +/*
>    * User address space access functions.
>    *
>    * Copyright 1997 Andi Kleen <ak@muc.de>
> @@ -6,8 +6,8 @@
>    * Copyright 2002 Andi Kleen <ak@suse.de>
>    */
>   
> -#include <xen/lib.h>
>   #include <xen/sched.h>
> +
>   #include <asm/uaccess.h>
>   
>   #ifndef GUARD
> @@ -139,14 +139,6 @@ unsigned int copy_from_guest_pv(void *to, const void __user *from,
>       return n;
>   }
>   
> -# undef GUARD
> -# define GUARD UA_DROP
> -# define copy_to_guest_ll copy_to_unsafe_ll
> -# define copy_from_guest_ll copy_from_unsafe_ll
> -# undef __user
> -# define __user
> -# include __FILE__
> -
>   #endif /* GUARD(1) */
>   
>   /*
> diff --git a/xen/arch/x86/lib/copy-unsafe.c b/xen/arch/x86/lib/copy-unsafe.c
> new file mode 100644
> index 000000000000..a51500370fb1
> --- /dev/null
> +++ b/xen/arch/x86/lib/copy-unsafe.c
> @@ -0,0 +1,22 @@
> +/*
> + * "Unsafe" access functions.
> + */
> +
> +#include <asm/uaccess.h>
> +
> +#define GUARD UA_DROP
> +#define copy_to_guest_ll copy_to_unsafe_ll
> +#define copy_from_guest_ll copy_from_unsafe_ll
> +#undef __user
> +#define __user
> +#include "copy-guest.c"

Thank you for doing this.
Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

-- 
Best regards,
-grygorii


