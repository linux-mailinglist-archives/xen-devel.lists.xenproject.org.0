Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB970F97B
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539112.839669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pvZ-0000Q3-J3; Wed, 24 May 2023 14:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539112.839669; Wed, 24 May 2023 14:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pvZ-0000Nq-G3; Wed, 24 May 2023 14:57:25 +0000
Received: by outflank-mailman (input) for mailman id 539112;
 Wed, 24 May 2023 14:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1pvY-0000Nh-Jv
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:57:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49b3de63-fa43-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 16:57:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:56:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 14:56:54 +0000
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
X-Inumbo-ID: 49b3de63-fa43-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1xl3fcCDO91g/lo+Jjh79g5WyjUdWEivVqjORrmoLzpevIzDtV+L42wgR9uQ0I+oe+rDb4ZwnEHDgM59bZM+6UKcRfPJtuOxHxkFT3j/eyNy/cx49MIPXKMFw28AiHYQrLUrolJS+BJbeHxtq2++nGuw+EQLIdSTyY8giGTsYoXb7Vr0PP5GwuGlP+9QezKGjMNGN4f/vWD1u8DqIJS3KJqi5qw6vVvlzrvdkRXwOlpgi9GmxmyNJ+Fo2v88XmmpIxrFse8gVA7vTBVz74+lshHoB/KF8QnMP9q5d7TAauMcxi1U3RBHXhyQ4IaS5l8c9YBLFR0P1Ywbg3CLlBnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNlnr0yZ83DXomo0p/RPSp3MCGoXzjUP6EIcRAG2XGk=;
 b=dE+orfZVP2Vb/pLSCwEcQkSfrcl1Rwx/sA6UQqxA1XbnLIHRPfK1zX9UiahsxdGB0RhVjzPBnC9EoOtxwFEVxLBraqEAYgd6spSFbnDF77aS2H6jf+exJk1h9BcjkBrsqlF/opU/mnL3jY/P4Nk33mqNp+rq5XLMgLHY40Y3UiFWJljJ8sPGJiV66dvUnW/5RX6P3n9wW+cy3aX3A7jbJ/mR0x8gobbBJB0EzM/nCdABVpFA6xeK45sy+xLkXmPM5bYoyxIhtu3D+jPNHn82ogunR1SDg3t20QyI6bztk3jZlqB6Hp8MtGT+T2pZGtOT+2r/AP5pouBsmTAaTfDV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNlnr0yZ83DXomo0p/RPSp3MCGoXzjUP6EIcRAG2XGk=;
 b=vs6clhdrXgvhycDlU17GmHt2VqL9bA7i6pfZrxomXKv7mKpdP+hXw1llmcR2QERmvhC/XTmaC0FiPf47JlyeRaDkVD4Lu0c4aglUE6JPvNM9mRF0TGbep6rwMpeVH/R3yXLXxD+kHUoBNe+o0g9RcgZv5QoTwp5IvfM+QP2OwQQ7X6Ka2Sa1QUn5r3n9jU+mP9D5iMrBJbNEkf8fT0oWDZhQhcO3wd0rkJB9EZL9fSofZb7nTCXFkwDMA6ubIuvt68qNHzkoDwpvPfPkWz3ASFNagAkgOJItxMuYhGeeRk6HG9nfMug3nnfy0Bro15XEjla7AeIlOTHMPZXEznmT8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5a723a7-3403-52e4-de2d-ad787f894a6f@suse.com>
Date: Wed, 24 May 2023 16:56:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/10] x86/cpu-policy: MSR_ARCH_CAPS feature names
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
 <20230524112526.3475200-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230524112526.3475200-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 267f9964-82f8-44ee-820b-08db5c671cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jr4HTSYt0ptcWeuaZhv+fGuhauuAVwbHKhbFBGtWvNaFDV1cvATmiHly4CbMQDREti/HncD2U2dW4tMq8NqCDryzJymWxFWVjgkzSJNUgRTUuCk3Qodszw982MIitBHDCzf8Y1o4C47GpqCYyU38oHXT6PdrwuaLgzbwdyOwG6IVbLnsmmfdoVO/yi2S/A1X4n1hiJ/u3umlht7plLx/uTElJc/hr9QJE2TcRDHr5klXgRvf+55AtacvpKY+ZvbFCGLWGXHQyDrxVsqQzo5izqGdxidS+6KJlk0Yeal39rjSPTxmxhB2SdB34uxSGPfs4yE+vy5sxZcSeB55145/noAoNtBjcFLTuKnAkNKRkhcWL7dhNItM4001CM8nlp682Ed38QcCRcR+Fgp4DqRbIz0s5uZ0WLmW8yewNAgdaxnxWgG3iZV7K5cJMkFoE1EYI2liUYJMctRdgNSQfdSUJJ+FssrOLdHBISKf5WKZH69ozSLnpgmSec9ISG2bFRGMU60gXVJBcFATjG/JzDjNo0i+EfuNyz+LAzengtD6uyvOWHv67tpKzzrhVvowpfwz1nu9oTw7b3b+egk+UcixIKN9hr6vEL2RsGolHTy8W4saBxt0jhimdOhrifRQXH4lFqylcKwvzEtsjliskFEJZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(4326008)(478600001)(53546011)(54906003)(316002)(41300700001)(66476007)(66556008)(6916009)(31686004)(66946007)(6486002)(38100700002)(5660300002)(8676002)(8936002)(83380400001)(2616005)(26005)(6506007)(6512007)(2906002)(4744005)(186003)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTdpSUo1N09TaVU4ek1pWHF0eEhqQ3g0d2Jabzl1Lzl6RlNpRVduNUx2Ym4v?=
 =?utf-8?B?aURFVWJlWHVGb0swTkdSUUkrK3kzNW84ZDhkSWFlQTV0N1g2SFFRVTh2NE1S?=
 =?utf-8?B?ckwrbHpTY01OSDRVbjNNNzcvenpUSXpyR1NSVTJrZXFhU2oxNGsvanFnN1F3?=
 =?utf-8?B?MEpKTG4yVUoxSlVLSmR0UTd4QTk4bWdKblJjUWF5eTBGNDkzakNuVzFrbHpL?=
 =?utf-8?B?KytoTUxNblRFWHV2cHBYV1RBdEVJTnJ5UVNVVFEzRjV0TThtSHVGOUEyU3BJ?=
 =?utf-8?B?TnJ2eUY2VS9vUDB4SVI2RGptYytJNzQ4d1FTTGE1aG9hRjFnNU0rYVhOVi9x?=
 =?utf-8?B?clpvOGFwdkkzYk5JWU4xYUwvZDJVZXgzZ1BJNml3UVZWS0tZeE5tYXk4S0Jo?=
 =?utf-8?B?eERTWHd4MDZUMDhuZXBORHRENWpYaWs3STFtOEw4cHF4ajJ6MWRZZytzMkZo?=
 =?utf-8?B?MjBIQ1dIeHdUdFpqTVFzZHNQbkpBOHMvT3JUQm1TOWNHdjNkRDBpWG5jM3I3?=
 =?utf-8?B?aTQxeWJ2clZJWFRWZEk1cE9WRTNMYld5TlYrMzRzaDcrMm9GNmM5K0F1R2dW?=
 =?utf-8?B?T3hOZVlveDY4MEhxcDRpQUdBd3lNdmdMOHl1QnlYUUNxNDBjb3R2QTRvMXU0?=
 =?utf-8?B?T1NYeDI5U1lvbzB4eTBXS2dvbEtuK0RuYkNIWmdNQVNILzJpYmlqWkxSbUhm?=
 =?utf-8?B?YnpURDlPeTI5ZklNc3gzMmlLK0hoWkNLRXltTmtScXM0bXBqemJJMmduWFNT?=
 =?utf-8?B?MTdCSkVyb3lub3FrK1dCcE9mK3dOM3FWdnBxeGJyQk9udWp0UENYaHJVUnNm?=
 =?utf-8?B?K3RRT0J2L3RUZ1ZtRW96ZElVSy84TjZMSHlxbHRma3cyVENDTzlPcVR0N2w3?=
 =?utf-8?B?cHFTdzVESU1mYlZxdnI4eFZpOTJKd2dLZ0FuZTAzQmtvYWlwbUhpUG92eU9x?=
 =?utf-8?B?VUFnMUh5SUtzZWJCcUVXMTdIWkF5ZzQ2dExVV0t1TUZnR3dlaFVONlVMTmtR?=
 =?utf-8?B?dFJLT3FXMlZBQ0NLcXZsRGRoVGlvdENZK25pZ2ZHdEtEUHQrWDFqYk5CK2JY?=
 =?utf-8?B?dXRwbXVmZ0pnMDgwWng4ejIwV2R1c3ozeEtPR0JGVzBZT3EzVERueHA1NnF6?=
 =?utf-8?B?VVkvb3FXbWJ2T20xMEFrU3ZBYkpPeTJTMEpWQXdiaGxIY0hncjl0Mzc3Z2p2?=
 =?utf-8?B?SVU1bXlMcTNkVEZzVDNoMDNtWUJGTG5HY3lKd2wwZjg0TUxKQm96NmJGZXFY?=
 =?utf-8?B?eVRCVnJlTGVadGRFWFlMcGs4OG5oSVUrc2pIUmIvZS9GbjFheFk1V2duRFFS?=
 =?utf-8?B?YkZzZGludTQvVWZ0NzhZWnRvdzg3SVg0WjZMSDRhTHlyMVpMa3lVUC9qd0pD?=
 =?utf-8?B?ZjMvQnpLTlZaekxDNVluYWlxWGM0cjBFaGQ2Y2pIalFQUG1DRDYrZlA1RGJs?=
 =?utf-8?B?UHZWUXQ2OHdNOHZ3VnlJRTA0bTRXd3BYajB6TGl0NFBaUDBtWFpmWTlBRW92?=
 =?utf-8?B?cGpiVDdMd3JhbzhZd1ZLRThnaTh6dFBsWXYzcGFWNTFmaG8rL00rd3I1UFJL?=
 =?utf-8?B?TFFkMHVLb0IwMkVCc0pMYi9BamJabFJ2K1VIZzM3R0VSL0V4RTlKRVMxNzgr?=
 =?utf-8?B?TmV2Z252bXV2cW5IUXc5UlZQTmVNWksxUnRwMm10amNSVTM3MHpXcjZHajBr?=
 =?utf-8?B?NWJMVzJuNjVySnlTVm0yaFp6ZlpkRkVLT2FFV0pRQ29pdURpQXpkMHRFV3Fj?=
 =?utf-8?B?a3pGRWZyT2FLYk1zc0VUR0Y3Qy9UZURxRTM2ZVBWdXlkQ3BFakJnUytXVDRQ?=
 =?utf-8?B?NjBSUEJlOG5MS09uMFlpQjQ1Q090aFk5dm1DWDN6Sk0xZ05iMGE4eHppRGxU?=
 =?utf-8?B?cmpUalgxUkZZS05nSkpFOTNTS2xYQzBaNGVRaDZnTjVsRTZ0ZUhrUDZ4a0Mw?=
 =?utf-8?B?bVNuTzBmK1NVUlBiSXAyd0YzaDRGbUlzQUlkeThKbTNQMjhDbDlRdjVwOGVX?=
 =?utf-8?B?Nk51NDAvOHBkL0MxYmltVzZUNTZqR01PajRaUzdVMDY1Z1NQekl5Z042VUZz?=
 =?utf-8?B?eFp5ZzhBRlJ6QitvemVjRkIwSmZNWlhQWmd3cUgxNDhQdTRjUS9UNVc0SktV?=
 =?utf-8?Q?vIZWlP10DriX0xkIESye8M+qL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267f9964-82f8-44ee-820b-08db5c671cf5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:56:54.2740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lco+n1+b84l2gCU+S1lW4mkgjg85uDpgWs0HBmcHwavGAyvn2CKytJPAXUpT83aMnrXS3tAypxAAlbCavffN3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291

On 24.05.2023 13:25, Andrew Cooper wrote:
> Seed the default visibility from the dom0 special case, which for the most
> part just exposes the *_NO bits.  EIBRS is the one non-*_NO bit, which is
> "just" a status bit to the guest indicating a change in implemention of IBRS
> which is already fully supported.
> 
> Insert a block dependency from the ARCH_CAPS CPUID bit to the entire content
> of the MSR.  This is because MSRs have no structure information similar to
> CPUID, and used by x86_cpu_policy_clear_out_of_range_leaves(), in order to
> bulk-clear inaccessable words.
> 
> The overall CPUID bit is still max-only, so all of MSR_ARCH_CAPS is hidden in
> the default policies.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



