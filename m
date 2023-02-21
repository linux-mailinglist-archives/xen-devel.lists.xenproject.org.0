Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD1369DF40
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498838.769771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR8i-0004L0-PB; Tue, 21 Feb 2023 11:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498838.769771; Tue, 21 Feb 2023 11:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR8i-0004Ig-MN; Tue, 21 Feb 2023 11:48:56 +0000
Received: by outflank-mailman (input) for mailman id 498838;
 Tue, 21 Feb 2023 11:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUR8g-0004FH-No
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:48:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7532602-b1dd-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 12:48:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7299.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 11:48:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 11:48:25 +0000
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
X-Inumbo-ID: b7532602-b1dd-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+VPP3GaegmU3UMpqrxXWuMT/wT1wF+cSLIwxTLX3DPBYaJUttmtFLk1TT3NeemVKt2z5n+k2L0hMrTKfqkDyTk4zjSsorRfTdbFExuLJmyqEv5G++Kd4Ko0Ka/69UTQiiWdAK61Ns+1+S3+vEd6HRwh3vBwuQmSIzKU02AoNLN5kjpFGCVQW+Xmiz09qyZh9JxjQDEgCkEgEJAclqjWvH7lnyf0TS7anOM5GlFliArcTfpX8i8G4eRkw6TDDYsB9vGEEAElA6KCFGy+XDkiMNkn2FDl6RDxUJcZBalkGBgwA+FO+LcAvKaLfpxyH5tJEklRH1baNg2EUhYTNCyZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEA3FPRhxZI4b8KGHvOf4M0GjIBAL+TyUWa2A08BYyA=;
 b=nmBc6Pg0c0iJKGb2BPtLCdgrbOalO+9wmZ6Zaj9R5GePyc+ytS+PYvI6OE/YdXSPd2u/oqoM9Y75Z4wrUGeUoC99X5uRoKKxtX0QjEdPiOqu3h3SyR7+7Zzv7ce5JIMeaOSy2Tn+7vNJxJMtxV4uHPckYFARZ82Mw6OvYgCpgRwEEOgWSfsAiMKq+UmOFnNNlEuKwmMmJ5IlSasdLS3yMniVV/HzEugJM3zFp7RHBaOLvEmNeMybB3UnkXm6EXRPbCfIvNd6oakySXsWpOQffKRMqnDw7mUfXiRXtO6Ot6o7wL+XoTi8cVJC9kteDvhRAaGYNaSE/HgWQ9Jd15hnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEA3FPRhxZI4b8KGHvOf4M0GjIBAL+TyUWa2A08BYyA=;
 b=W48MtFq5XrYLTmaQKLRQK23iqqwBAfJw37YKe0J82XYeFX/Ynl/vvHO43gHqzwf78Zzja2dczNyJSfcV4YER49OFQsO1gMGHRsQkARLXYe3t/KAIP1bNVHw3kAii7944q4VsqaOfpBcR+e3ve8ga9DfPtoIyMLY5cbSTYOgKxQ4UMOEjwybc5AwgO9CAc5jbcg9d0ZjsIgFReA9ml4TkvKXMwzIbfqgr8F0ObnMUNItNYz10OoOCJ3lqZWhlMrpKTJDJEt2TVTd80ovcbDAhC9N33OwL35wXhbyuyruSmZCk4pNnV4owgPhOBjjiuYGFxJaTiZcOO3FfcqYUPkQwpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c9ccd64-0d4d-f77e-517d-f99e6023aa17@suse.com>
Date: Tue, 21 Feb 2023 12:48:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] x86/traps: Move do_general_protection() earlier
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
 <20230220115956.1522728-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220115956.1522728-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: e17c2d17-4e6f-4dc6-8233-08db14018a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I93qRhUOg2IqC69tjfh+dfaVWN80sy5refyOXaq2+omzH/bWtCytU4026SiMMpcZzKvsXmY0ShmPnEfqLgPH/khoaYdACjzkUVG/4NJ38m4DU12A3RnVpBoz1XMcY/gH4nFT4OWSo5sUdRGLMOj4QRh3X2Bu2CCDUvfn2wvyXsiJIzsNNU6J/qk02Rlq/uYNuLLH5RLb9Y3pEQkG/1HCAJazs3UlY8rquFiLAw6DSrV/jLKAi2xJYyM7LFSco407i3nq53eBMOMU+LbsCl4Sz4bSmVqLyGgDXbYX9Ya3nCWSPJdzcC8XjF5VoOLbGGmNw402rDdN/jTvwb6UdGLhFoEPvLzGadzEq0Yqe36aq4loECrY9SiFSGjJ7bBE/sXnans7QfafBRKqjNwgZKou6jiOoGY/MXf3ZB3KDJPs7ewLKHZrSQNDqXIAh5SUoZ3Qg0e5gUvgsCIAjEGEQyJlwSmE3zFXlDcciumNQ4z5Wv/eCJlTPgwhwFzLM2+5f+Wuhqmeb7OYgHw8WG910oxireWUudAXu8EYJbX2lr3LfIbq6KP5i6ZiHB06nUSGVXDxWHrpEVUs8vaodlI3tfL44RsOGvDkk8L5jHXx9QHRVLrmQRJVZP/pE8CwBF5Fj5qsCOTmUW3sZ84gW31RfO/f1Ex3jnqEHqwhE9k90b+1UaSVfN2ve6IO0XAtKXlyrJVBLEiGnL9tilXbDFtbIALKsFE4lCMaY5O+pmoBUmmuyv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199018)(31686004)(38100700002)(2906002)(8936002)(5660300002)(4744005)(6512007)(54906003)(26005)(186003)(41300700001)(83380400001)(2616005)(36756003)(66476007)(66556008)(6916009)(4326008)(8676002)(66946007)(6506007)(86362001)(53546011)(478600001)(31696002)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTdmWkdRa0VuQWtvVktlcURhWlNEOVhTSkdNZWpzMVVwczNiOTRWV2tZUFRQ?=
 =?utf-8?B?VUVleTFWQi9RZ1pLZGJqUjJMenRGUmE5TTZiQTk4TU9vUjlGLzNGU3JyQ201?=
 =?utf-8?B?bFNWNHFsSFFONjJPVnI5VjhUZEw2WExEUDFDMUMvMmhNY2RYZCtFVm53T3Bk?=
 =?utf-8?B?TGZQRVVBY09ybmZRL2dLWmFxTVptQ2p3Y20wUXJNSU9mc0FWcTAvNUpVU3Aw?=
 =?utf-8?B?TmVLVFVZMnJaWi8wcm5yOUltaUt2WkVpTnREVGdDdGxvQmh0dXBpcVRQQUZa?=
 =?utf-8?B?OEdyeHFhTzVza21ZdmZUMHQ2OEdrTTZPc3lRRy9EcTY2Nzd1QTVFS2lYSG85?=
 =?utf-8?B?ZEV2d24rby9LNmVEazJpQVVwckJmNTZPMzI5bjNsYXYxVi8xcm8yNlRGZnJh?=
 =?utf-8?B?MnAzdlBRaUJiaEZmQWowM1l4RVltMU84SGlBYm95cTV4M2V6WEo1VDUyM1N1?=
 =?utf-8?B?a2Q3a2dSdHpuU09lWGlyVFgzeHFOMUtVSVVZcTNoUlRCTWRYNEpDOW1sYzF6?=
 =?utf-8?B?cDlmSm5hTyt0MW40K2RNajVLVnF5ZFN5WU9DM0tnTUlicmQzdEZRQVU3amF1?=
 =?utf-8?B?aVBSOG55VHEyZ2thNHZTN1QwUTBvblN6T25RVFRaVFd0Q2FIMHA0WHZia0ox?=
 =?utf-8?B?SDZCSTQ2cVN3N29jWmJNdTBVOFN4TTVwN0FRaWk4RTNDQ1Bka20rSTFEbUx1?=
 =?utf-8?B?K3dSeDlNRVp4dzEzUWVhZXZPeGR6NE5BTll4dzdRUGhTS0ZFb0xkcU5OQUsr?=
 =?utf-8?B?bzQ3NVhsNTdoUzlKcGF6TXVlYXFRdFB4dVkrTkJYTC9rb3NVMlEzRmZkNmM1?=
 =?utf-8?B?SFBnQ09aMVNnMUx0VVIyMDhSWHZ3akpxTG5ON1ZiUjJ0MXVYOHhJckcxU3I4?=
 =?utf-8?B?YVFPZ0R5MjRDUlp6NEZoaHI0NWF2WDU1dUtLaU90OXhuaHVmeE51NTU3SkVa?=
 =?utf-8?B?ZXlhQU4yM2hmT21JdnRIMlp2MUhRZGlWZjBxYmZ1VTNiKzZQSXRWR3ZQcEo1?=
 =?utf-8?B?cmpTeWxMdXI3emlhSkFGUmdSMjQ4YndnNk83TTVYMklsK3hTT2IxbSsvcDN5?=
 =?utf-8?B?eFY1OTFUSlpSdTg1RmcvQnN4SktkOHNUMmdCYlA3OUdOMzh5cjFTZGI5cVVk?=
 =?utf-8?B?dCtQNSt2QkdsbWVWRnN5U3laQUJFZGgrMjllMGFBbityV21hNUN3dFMrbmEw?=
 =?utf-8?B?VzdWWVdJSG9EZGlpaVFGQm82b1ltU241NnFBVzB6MWxIK242c3o0OUdQdFZ1?=
 =?utf-8?B?RWJIR3FxMzNSMFQ0Z3JQV1pCWDV3SXhKRHVFQ1VxN1pDU1Fjbk9vMFVnVGRX?=
 =?utf-8?B?SjZiVmtScDdJNjVOK2syTGZKeUhhYndQTjFkcXMyMFg4MjJuTS9sMnJMYXhT?=
 =?utf-8?B?Q295MHl5ajVMRTIxdStVaE5wcDRHeFdseG8xN09WM3BnZmNqeStoQm5peFM1?=
 =?utf-8?B?WlFOQmNhbk1IZGJTTTRaeGxTSGgrK0ZnODNoNzV0WVBSMlZRRUQ5Z1NmbGd6?=
 =?utf-8?B?aE1aeDBnSWw2Y0JzeEd0ZHV0YThOTzJuZnFKcXloTHJNOTVqZHQwN3ZPV05w?=
 =?utf-8?B?Y1lsdGlaSUlhZDdIa2lYVGNXM2RZcW01cE05dWl4WkV2N1ppTnlzQzQwZW1M?=
 =?utf-8?B?M0UzNGxpc1pZNktLbVl1MVV2RWo1OTQ4ZUlIaThOdEFuRE91Q0Nqd0ozVm45?=
 =?utf-8?B?dmVSanR5K2JmVDJ6amM3azRSVzFGLzdxVm03dnNwTlgxZVJDcndiM2lQODQ5?=
 =?utf-8?B?U2xhcVJ6alg2dEMwSHBNTjhWR3VFeTJCdXpnblFTRUxlOEErN29OWkhxRzlB?=
 =?utf-8?B?OTZlNXRlVUtsRTVCYk5qdXJRNys4OHVDenN4czBDNVRGd09lMjU2QWNOeUhI?=
 =?utf-8?B?c2d5NDhvQ1R3cTlSNVd5NUxnaElFVnljSUY2eWZ6eGc1cmU0d1IxSWVNRkwr?=
 =?utf-8?B?bGJ1MnUyMEk2VjY1NnhYYi9BeGFOblo3b3R0TzhYQ09rWldBOHJhYkp4NDhp?=
 =?utf-8?B?M3FxZ3d3cGxQb2hKZlFvL2svdTZBbjUxSUh2MkxLSWlJRVVVWm9JSGpOa2U2?=
 =?utf-8?B?TGNjQ3BNMW1pTVFTRzMvdERUU250VlU4VFVSMW9PbFRuQkNFYVJ5TmsrYlR4?=
 =?utf-8?Q?Shg8SWzIaNX2chsYK+JAmTr9s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17c2d17-4e6f-4dc6-8233-08db14018a30
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 11:48:25.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+LlhBmcKa39XwWQhnwBaXMEMYAKJ7qYxnGoY3TCmxMhxE3e0CRD3rAkksv+ifRKkhjHAat8CUXDt3H4iikAHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7299

On 20.02.2023 12:59, Andrew Cooper wrote:
> ... in order to clean up the declarations without needing to forward declare
> it for handle_gdt_ldt_mapping_fault()
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is okay with me as long as the Misra related comment on patch 2
can be resolved suitably. I'll defer the ack here until then ...

Jan


