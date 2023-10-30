Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90827DBD71
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625258.974372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUmk-0000vU-H6; Mon, 30 Oct 2023 16:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625258.974372; Mon, 30 Oct 2023 16:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUmk-0000td-EH; Mon, 30 Oct 2023 16:06:38 +0000
Received: by outflank-mailman (input) for mailman id 625258;
 Mon, 30 Oct 2023 16:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUmj-0000tV-Kk
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:06:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cc01b74-773e-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:06:35 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9799.eurprd04.prod.outlook.com (2603:10a6:20b:650::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.14; Mon, 30 Oct
 2023 16:06:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:06:06 +0000
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
X-Inumbo-ID: 4cc01b74-773e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqVT+lH5it+8mFORBULzOCbEUF66KRRsENJ5s2Mrrpu0jfnj+dFKQ5k4MTjtR1/g66ekY7N3Ar6feqZU89t/2s7Lydt2P8+aq8SwxvR3riBBG9KNHwN3BxrGD50inyXxIEfM3E+zSfY8N1KeRSg/W8fnAuyTnzdbpm3lfWIcK3eqbfpcKQN2tzrORwHOhmu4kpIMQYd6GbG4rpv1xwo/Y5i7vrfL0pnVxSTPaazyUCrwLgWxc90YqXnk5Ut5pWdONL8VPYjHp2UlAS9k2z+9WCECwnpITSI06MkPxDu1hDLm2e+O/t17cRQ1oz0Gt61N+zlvwiWzZddL+0vddQP4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cAv8akFaenkTCx0mhcfE/Di1PvMLJQxn7lQ1lqkWqo=;
 b=L4xlyLtfYU21V6dkd+iGp7nXf/lA0/cZG5R/uDIR6sfeFtsVkL0c3SjSKu1xZFPBO30DiRaPgzw8xmNoIkTR1DXEQIZyF/HJvXPvBk3SmjLSeNB9PmxQBAQ0hOWvLh8/cx4G6+biJYAhA90pPGjshJ4/m3RdzDDF5if7DpJh0a88ZztrEN1SyxpBUlWdL5bTK2F0sQ8WUBM94bI+c9y6CTEYAQvc7dMneYosbnPoZYRjMseN8bakJUr+dmQibF0C9Q7DB3jE4xbF+YAW+ADIjuD9/d/wOEn23V/DVXYpp/NIfrrXfk59IEzWZ4/tg0pvUgOvy326DyZuRkqEgyV9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cAv8akFaenkTCx0mhcfE/Di1PvMLJQxn7lQ1lqkWqo=;
 b=iN541qMvm05gvlHe2L7/fSbw8HeU7Q44gIJk1vjtCxqbYuyBisVAlLP2TkaEVuLlEP3T7ixgDqraekxcFqq2sf/xRd6yKTxLzuUy9SpKlgjCGnMP/VLoTD6zcjJYSw2jUQI+8/91foOhVMOwNtBdweTLV5U89Yawu4FeQq6RhKrPdtvmcBUbWf/tLuuPltRyCmk9xT7tt0RQJT6vla3mkDIKijsl5ddMGxgH7hUOpgWZVYfosC+VP+g/NUXG3wGNFsFGdhllOheleVkOwYMJjFOQJbLcDCOjtVsz4PUODpBp2SrmQhDzpBFeeSHFsBqFvFCwQW6Mx/5p9DUJJi9VhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d26efc0-caab-76f6-c02b-cca9f421c88d@suse.com>
Date: Mon, 30 Oct 2023 17:06:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 7/8] x86/platform_hypercall: address violations of
 MISRA C:2012 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <40839b7484878109b3096347dfc113bf177f210a.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <40839b7484878109b3096347dfc113bf177f210a.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0432.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: ecdaabb9-06a4-48a4-dc5b-08dbd9621fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1nx3VMdwGQnaA7jOctp1GzOeCLU6DP//cFsVmaWh7Cl9IPZmTOlEZgrGfX+OdOrbxuv/jY7RLFpjyA6hbisxRxqlidHD5z4KHfl2vOhad1ch7OnHXf+rupPjT66Y9MVD60qHrcQstY28/t6wezTGcusBFgdxMCsX0tyHTDqt2bpty/KpNKjqTsNfGMrWgWGvuH2OWmvOEMtuRPJbojRtUOj6lZt4dwTLw/yTT/JvQ4KqL56IOA6/68FKPkhAspOnimD6SrcaWvmeGBhFj1fl9ck2Pyi0nboEigEX3Imj3IS0XEwIfbvMHIElmj6UgxM6rEarInkfaMG65Mta6XfHQO6/W4WVL3XHHO6OicNiTGf+iPVU3dmlvObp5+G8W5cVFDe1UMFVOM5Weyo2HTrUw/AfXJvZLsO7xRbB1Ks+bdRVL4PJw1XwIe7iy17YIhsg01RhoRQbTidxmXymC54vlNNsFKd8S/EKZlMPWKmtPrc5QI2bhdhJAFZmZwwlEYoL2ltlCRbIul8PLgZdm1m5DQ+v22EXd5Kp/h520IT2pBs0ieT+zbP4DFmH5hTZb/PJ7j0BYGwHV8KDYavQpMqeZ+efNu5VmqF1oRNttES2/UZf+e78H0zsFNmvOOgVQCw5LigWJh9YzSh6/0CSlbWrIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66476007)(66556008)(316002)(54906003)(41300700001)(6916009)(558084003)(8676002)(8936002)(31696002)(86362001)(6486002)(38100700002)(2906002)(4326008)(478600001)(66946007)(31686004)(5660300002)(36756003)(6512007)(26005)(2616005)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clZCK3BkK0YvMituZ1RGZFY0K3BBaksxVlJxYVp6RzJhaUJ1K2xya0dqbTRm?=
 =?utf-8?B?UzF5Z285NTBaZENENi9BNHhXaVpJbC9MNldiVmxiS1N1NVR3Y1YvNi9FOTRL?=
 =?utf-8?B?RXd6dkYreHd0blFXODk1T2IyemlnTVlRZXpLSTNVeGFQa1lybHBVWG9BYjRG?=
 =?utf-8?B?dXBCR0tOYXBydk9xNk13MDNMYlJwTHkwYXJSdWlXZk1QVDlaaGVzaHc1OU9K?=
 =?utf-8?B?YlFHYWxkWkE2WVEwd1grY3hrS0Uya1BoL2Nuc0gzcURteEVZRjY4eTRVUDI0?=
 =?utf-8?B?OXpRSEc3a3NZc2Nid2dRZVBzUHFqMjB6TGRrcElwc2tLTjU3YXNDb01Qd2l5?=
 =?utf-8?B?YjU3TW1XQlZ2bWhvaG9FMW1mRWhEM3NNRm51WDdzZzdoUjdZL3kvV3pDYzVW?=
 =?utf-8?B?WTZXUkp0S0RBRVJyYnRTK2R2V2dwblRCT05aNnBhZUJYR1VUakdZc0x2cGhv?=
 =?utf-8?B?ckhPNm5XeDBzQTA1V25iVWtkV2liWlErZmpmQVp1UncwcWVvRTFIK2NMV2w0?=
 =?utf-8?B?NlVMYWZvRW54RlBoc0haT2oraE5YRlN6YkViRnVaVFlVUzFFZFNtM0dlQnh0?=
 =?utf-8?B?RGxHT1hlV1VUL1ZCUTdPV1VBUW1RSTVNTWFUck9sQldGcHJEM0gvbHpiek1z?=
 =?utf-8?B?ZVlSTDRGdmQrTitOZmJ0czVLRC9FODJ2dVVDNGxhNFU1bE5mQm5LaTFqeDJS?=
 =?utf-8?B?b0hDR0tXMG5RT2c3V3RmVDhnTlZtaGtHWGRySEcyR1hocGZZK0lNN252TUdL?=
 =?utf-8?B?UGxtMEtUQ2tyWFNsNXZPb01WczFpMzJyZERoNDlldllMa1VINVR0L2prOXpL?=
 =?utf-8?B?ZUN2SklRR3RMT2hSMVNFMjJzdTlHYlFiREUrVEN3UXJ4aTdnaFNtblhVbkpY?=
 =?utf-8?B?aFZkQUpWTVdGeFVobGk4TWR5cEFKZVMxMlArY1J2MmZHSC9ZVERPM3VHTGhE?=
 =?utf-8?B?V2RUZkU0VXppK3FWZ1FVRHQzdVVXT0VBVnpqb2VVY2lQUDVaYWZuUnJKclpv?=
 =?utf-8?B?U1lvSFBEL2I4U3VHTFROQ1FpZzc5RjZQRVRuNWRtakFZaGYxNXhmWWRXU2Fr?=
 =?utf-8?B?Z3Rubjh1SmR6KytzblJYTmV5SEljY0hVM3lUN0F5eE1yQk5YRzRnU0Nwd0gr?=
 =?utf-8?B?czg1cVAreERxR0pHNWRzNG5QcVpTeWNJYVJQWWFwN1RhbC9MSmJLek9pV1JW?=
 =?utf-8?B?dVF2RGtWaXlZNGZlSVIvTlVjUHQvYkhSTitoYkdYUXJ0OUIwSUJvUG1aYlpG?=
 =?utf-8?B?MkZROW1MTEZiY254R0xVbmFiRzRlODlHRWZQR2UzMW1nSzhtdzNwSnVlSFZn?=
 =?utf-8?B?ZEEyY1VPN0FiQ0FHQ2ZyT1BrdlFmdUhOOTBKUHRzK1RmbVROcGZieG5mMFRQ?=
 =?utf-8?B?bklia3ZPMEpCNWZQVUlhOTYvMEcra3dhQzRZODVtMzBPSm90MldBOG1zTVlH?=
 =?utf-8?B?VlFuRXhMUGl3ak5sdUpaLyt2RENXL1VMNWQ0eXFTcWRzSG94bGJtbTIxb05w?=
 =?utf-8?B?STNMR3lhQW01aElnM3RTeU5nQlVuOFN6OVdyejh5MmtLTnVkUTJRcDB4allD?=
 =?utf-8?B?OWk3MndCRnpMUnB6b3lXa3VmanFJbURHWG1uSUhSYTYxc2ZUN1pZOEkwRTQv?=
 =?utf-8?B?TnZycE9YczJ3d2t0bng0M0hyb2ZsQ1VLRHpzU2JLd3d2OFdZY0ZWVFYyWmRm?=
 =?utf-8?B?NDQ5Tkh1WHlnSG9EYWs1bEI3QnhvbS9XeDFiMnFPTHRRckM5RU5lbW1XK08y?=
 =?utf-8?B?cyt6Z3dpWDVyVmEvd0tsb0M5Szh6ck5tdmZ5QzF3SVo2Q1VQamt2WHJ3aUp3?=
 =?utf-8?B?akJWS3hiblA2dTNydUJlaWhmWGJQM2NGbEpJVjhwVmgrTlhrelBhcDlKdU9G?=
 =?utf-8?B?d3FVZi84R1RCbTN6NFdnR1lBUHM2Qys3S2JqMDVoM1hNL0laQk9TSHk1Q0Vw?=
 =?utf-8?B?WWk5cEF1bzQybTc3OFhSMDZnc29QK0doMXBkZEFqVHVtRklGa2Y2MVZYTEsx?=
 =?utf-8?B?QmFUR29MQitpOWdaQ1VaeFNOUUY5emY0RzBVdDcwNWU4eW5qQ3Bjam9IV3hs?=
 =?utf-8?B?SkZwUHR6YzIxc0dqMERKT1lVa2VCNjY4MGFjSEMwUElKekM4NVFtL0RZQU9V?=
 =?utf-8?Q?oINzkJMt6yQl+awdwwxras3LV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdaabb9-06a4-48a4-dc5b-08dbd9621fc6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:06:06.7848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgANgW2hrrVASWHix7HDgQ8Ibxs0x9lRh9wbQU6hNryPR5xT2PmScKtleH2qg0yKXG5PjhWGpz+wBGOH5l85mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9799

On 23.10.2023 09:23, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



