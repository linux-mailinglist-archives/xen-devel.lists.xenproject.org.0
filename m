Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E284A9FBED
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 23:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971168.1359645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Vk4-0006Oa-8Y; Mon, 28 Apr 2025 21:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971168.1359645; Mon, 28 Apr 2025 21:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Vk4-0006MG-5C; Mon, 28 Apr 2025 21:10:20 +0000
Received: by outflank-mailman (input) for mailman id 971168;
 Mon, 28 Apr 2025 21:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS6=XO=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1u9Vk2-0006MA-Hs
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 21:10:18 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d834e32-2475-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 23:10:14 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by PAXPR04MB8592.eurprd04.prod.outlook.com (2603:10a6:102:21b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 21:10:11 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:10:11 +0000
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
X-Inumbo-ID: 2d834e32-2475-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvtIAoCFgK4Ew3QK++2gKa5bxqrtbKSszpkGY+sLePCVKb2qwLxpbx/09Qs5n4dQrUncepZ67QsdKzMdfG2cq0ePAXREYN4QTy+0KdhxULXTuHynmhNTiRTzdwmrdfkhaalr0V78VfYh6rq/ewxgQMZlbuHsk2rwx9Ugavl89EL9/wzqKFa7RgW/hqzB4xCqB6DmN03G5VhbFUFp8t4kq0Q+E3HAg4Pr2kmluK8wkUCznFzZVagToljDcEhKPuv6DW+DBRsNXAi3y7tCbVFxNPzjN0d1RcxGQIUynIhP+rbo5WSz6aPe09ktbRc6wSH3dUEEWDKkJk9vyy5it8KTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGWSsNNXV7CjdiC8jqKdZ7OZwAbLCfgHq6W3XM6odE4=;
 b=q/qwRjLcPlkl/MlK3Mg2O17rTV+ufSUUj11uX+4twyJmpfBpmpd4gnuhsIbQFEtSeTpAtRbHVg3/svVuMd7GcGqrDM8gsLBtWnT8M8vwRVuHiqBDSZzQPrPZM0XFymZ23d13dvz7yp/hx15TDRhD6q46RqAQ0gXhdPnYmiCGUlgHkwtYhxulMZ9hdGvOYHJ415ZV4NrXDLwAdWnooBQWjKna+B21xx0LO+e0lgnazNHdNM87Ze194sRP67uQaW211hWkxHiCvE09WPvtYOrxcBNVPGeWfPWvUEQ4lNzm3Oo5faipjJOS14zZ640FjZz8stYm18/01cBnHZHkaVHFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGWSsNNXV7CjdiC8jqKdZ7OZwAbLCfgHq6W3XM6odE4=;
 b=LQWanBi7WeVMiVMpAmD/EygK1jlLQKsyFZckiGUEDEPN72rrZCesDoTvws0aJIk3Pt1g9wxJ313GL9LbGwReLvbfjw4qEDWRc1drzSC2VNcf/T6J9ubFmnUyUXEzEKonLVIuKbjPTT7m2/uy8YK+XSfnImkPNWG2iUGNdOG1agd59vPWMyHs42kXsj5azsO50k2z3Mcsjw6QLbgKZehaZ7lzTuzNVjP0p5MpQET1NfV0pTcdodXYVYQga42TIc1UFLOpdlI9nnKFs8u6+CvDYFwiXQwiJGSSw3WaQv9mXhATdGFpBNLn4BminIMnZlXxeBT8pR1+xA9jwLfApHDb+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <f4cbcb7a-cc60-40f6-84dd-96d0d7d008ea@oss.nxp.com>
Date: Tue, 29 Apr 2025 00:10:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] uboot-script-gen: Dynamically compute addr and size
 when loading binaries
To: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2504281312280.785180@ubuntu-linux-20-04-desktop>
 <PA4PR04MB956574A1DD21388CB1632481F9812@PA4PR04MB9565.eurprd04.prod.outlook.com>
Content-Language: en-US
Cc: Andrei Cherechesu <andrei.cherechesu@nxp.com>, dmukhin@ford.com,
 Michal Orzel <michal.orzel@amd.com>, jason.andryuk@amd.com,
 "S32@nxp.com" <S32@nxp.com>
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <PA4PR04MB956574A1DD21388CB1632481F9812@PA4PR04MB9565.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0026.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::20) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|PAXPR04MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a6aa4a-b3d4-4a92-1c57-08dd8699102f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzgvdVpKcGZ4dDdsYWZCR2NUQkdVbnhBa2IvTXg2b0U1b1R4aWs3M3g3eWR0?=
 =?utf-8?B?b200aStaM25iMlN6bDdKaER0TERwNitJL3pYY0RjKzdwL3dXUkFENnA0Rkxm?=
 =?utf-8?B?ZjgwZ25QY1BLOUZFeWNnOVduMGorNVJEa3c0VVFZN0VGSGhiUlVvdEhuMXpl?=
 =?utf-8?B?blo0ZHZUTVViT2pIU2tCT1NrMnc0U2wwa1E2cmlkYkpvSzRrWnR1RFhOT2tO?=
 =?utf-8?B?U1BUUmtVMkQ0TWIwVTEycnh4ck5sMFdLc3UvcEJXUmJBSjBIT1FGZTlxWXZh?=
 =?utf-8?B?eWVOaGRiWlV0UnNmSkIrbllPL2xzaWh6bW5Wa2J4ZEJ4UWNOVVo2dUVUQkti?=
 =?utf-8?B?SGYwL2FLR1NBcm90bEFBbURUbXk0KzdjQ3lPSFIrM1lYaHpaekZ0VExDRHNO?=
 =?utf-8?B?RWlQK282ZXBwejY2bWNTU1hQdHNLdTBXY29uWXJBVFI5MG5iZm84dEEzcTlp?=
 =?utf-8?B?YmhKai9oWE1CeFliNE5neE9ocXJqMXo5dlRuZnVSVnBJcGpkdC8zTmVJaG8r?=
 =?utf-8?B?T2VrTkVKcDNlb1F5TXk4ajB4RWRWcmxiZ1BDYm5CRlhQdGhEejhoNVpreFFZ?=
 =?utf-8?B?QkNEVUt6amUxdE5wTk1VM2JEMnFRMmxhdzdSTFpHc2RHeUx3K3NxZXVjYkZP?=
 =?utf-8?B?bVZwbnU3TnNyci84WDJtL0hWREJVOWk4UkxRTml6RWhlS0RxNWxkZ1ExaC9u?=
 =?utf-8?B?MW9tVXVnSXNkZDdsVllSRTJOMFNnOCttaTZmaFdGcXBEY1lLcWE3cWdDdFFm?=
 =?utf-8?B?Sk9Gd1JEN0lleG9nNTBQRkJ0SEFoWTZMOEpUakVJM1NzaDFxNDZEYVhVOU55?=
 =?utf-8?B?dUtOczJMcFlucW54TFc2dUNFWDhsaFRWNHBrdlkrUENWWVpkQ1RVTUFla01S?=
 =?utf-8?B?M3RPaVRlTWVQSGViNUh5SE1HaExRdk9yQmhvQWhQMWx2dUZQT2JGWStXMXFT?=
 =?utf-8?B?NjR0M3NzeVpjR1RyOHh4RzB4L05WY29sakVmcDF2eXd5VGJQeTlWclVPWWJq?=
 =?utf-8?B?RGNFd21kdHVoUkNKcGU1QS9pNHcrMTFYSmtCRmY1M3VyeWluKzJ3Yk45YUFH?=
 =?utf-8?B?VkFvUngrRlFzaVRsczhlSDBmdDlxekxXWGdMdDJNQy96bDVkcm5HU1RudUoz?=
 =?utf-8?B?WlhGZ0RWd1NFaWVSTmlaNVFoK3NHWHdCSW1PNkd2WGJnK3l0RHBxVkdVUE5I?=
 =?utf-8?B?WEt1QlhXOWdsSnNPVHdGSVEyZEh1dmxENS94QlV4RGJKOER2cjR5aThjeCtZ?=
 =?utf-8?B?aHViRll4RXdKVXJKZUlJeklSMHoxR3IzdEcrWjhWMzZXUjVLZ1U1cWRBS3Rz?=
 =?utf-8?B?V2pyQUc0b25KN2s5bmRFS3M5eUVkeEswSHJRQUwrVHdhWXVtTDJ4bmFUeG1z?=
 =?utf-8?B?THBweE05eXNHbGRBb1hQSWxxc1dhZ1FSdEl3MTR6QjU0RmdlTUNnZ2dCVkwy?=
 =?utf-8?B?NExoelo3cldIR0IzTXRzSk9VNjlkY3RndUlaS1RYZzJRZzVyQ0VoYk02eWVi?=
 =?utf-8?B?TXU1UTU3Mk80WlZIRjdUakMvYU5rWFNlclIvQWVNZ2tNRW1YR05yNjNjTW9i?=
 =?utf-8?B?djVUTDArQ0lMU0FKMzA1NUVNRTBsWTdZU3B3R0Y0U2JQSU1oNmd5RmFQdzhF?=
 =?utf-8?B?dVlHZzVYY3dIdlVPOENHM3JPWWNmbFRDd3NZNUVQaGIxdStxVG13MFMwdHhr?=
 =?utf-8?B?UGl4TmJiODJndXhneXhYSVdUR2IyT05PQ0ZxblRDb1JMRDR6RVgrL3NFVXZX?=
 =?utf-8?B?QWRURXB6OG1TcndDTXZnQ2p3YzVkUjduR0JMcVliVHJXWHFuMkxiRnJrbGdk?=
 =?utf-8?Q?QeeUCO4eXfKMLMy/JOJM2aB+1ZxEa/V8PUvEc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGJ6M3ZuNnByN0ZJcmwwc2lraTdOTjgxRXkvUncvS1lRNnlJbFk4MmZ1ZTRm?=
 =?utf-8?B?bm1lek5Ic012TTU5eVJxZWRHak5sSnZVOEhBMWh1dHdNcFUwQ0x6eVdtSzlK?=
 =?utf-8?B?NzRPbnhIMzBmZ0NRL3kzdHY0MXRTeVBFRTQwZW9rRjZsam5mRmcvenpwb09S?=
 =?utf-8?B?NWRMZVlscFpSRHVpN2xibVdXc3pjUXVyZXZ2c3J5bDA0bUtSN0w1ZG9pSUlk?=
 =?utf-8?B?TVMrZmZRYmZQNU9lb2lmanZmamNOcVFlQSs3UFFHUGhxcmQ1TXk5aWxIQ0lt?=
 =?utf-8?B?UjB5OHl0cCtEZUNPZ2IwaDM1cUFmdHlDM3VxWjlCbXFPb1FsS0J2Z3M0MVQ3?=
 =?utf-8?B?T2dha2hBY2dQVDFsa0pERW1QNlpySno2NkZraEJ4U2Vud0lBTHIyWlE1eDlT?=
 =?utf-8?B?Sks5QVMrb2lQWk5Fc0tyTWJxczFUYXdTWHdlY3d0RHptRFE2bjBIbVhJRS83?=
 =?utf-8?B?UXFMUk5FamRFWG1MbEJTd2xZdGZEK1N1NGxVOGx0M3k0c0d3QVRyMFQrTFFN?=
 =?utf-8?B?ellwdzdYWDFseGFTZzFIMmNhZEpubCtwQTRKbktmb0xIRm5GZGxkWThUeTUz?=
 =?utf-8?B?K1dQWVNhc0drT0NXOFYxZVlzYjRjblJPRkFMck94aWFGaCtFZG90VnJad2tk?=
 =?utf-8?B?UFBCTUI4ZTB6Um1MOWE3ci9YS0VWSEYxVklMT1M3V0V1WlE0T250cGs4eHRK?=
 =?utf-8?B?QnQrNWJGYnRWRGVma0xQUlZFKzlPdFgvZE5rNDFKcmNFZHFwcG4rTm9sdWcz?=
 =?utf-8?B?Z1lTazNBV3N6d1BpdHAwWTlRRjc5UFBSSDJqaHdLempZbjd3Q1E2Yk5ER1Jn?=
 =?utf-8?B?VHFrWWRYU0ZWRUNKK1VTKzR4T2VJZEQ4UkpvNlpwbjZwUXhtRnRiM3Y4RzQv?=
 =?utf-8?B?bkcxOVBTbm5yZjNwRkNvYzlMTENGTVpTV3ZkZ0h6dEZVM1MvNHpZcVZTZnlE?=
 =?utf-8?B?SWtxZ2xhaDB1VzM4Vm5CcUw5Z3VvWURjMGRhK2NpVjh0dDJMeVY4NjNHS2pl?=
 =?utf-8?B?KzEzODhHeW5iUU5pUVpCY3JoVmtvQkdDMW1mcXdzVUk1bWpzN0FPVm4wRzZ4?=
 =?utf-8?B?S1NtVFBmUkJqN3EyMTdZUU93OEVxbHdhNFpXYlNaRHIzek1yNTZHRXJLQlds?=
 =?utf-8?B?clNKSkc3WUxxc29vbGFveFdpdlg2QVZoQ1NWZDJCVnMzWEZrU2JJeHdjVXlI?=
 =?utf-8?B?enBUeUxBWHQ2K0ovb2pVeHNrZ0FxODJNalhqZU40dUpzN24vSzl3UWJHMlN4?=
 =?utf-8?B?QkVzYm9JcXNhRlQ4c2U1QkQxN0dvK09JaERoUUdEcjh5MzVqUVB5QTJIN3Ja?=
 =?utf-8?B?NG8xQnZmdmpOMmNTdCtLUHFKY2wwd0pKK3lQcnIwd0dhalNEZEFlU05uUGFn?=
 =?utf-8?B?d04vczk0NmZ6YUpQKzVlcnRzTnJ4alZvazdsL1lra1ljcmdOTVY4aFcvamVL?=
 =?utf-8?B?Z25Gb1RkR0syWTBpeWY4VWowcEtXN2RMdTExNU9JcVBPMUN1cWpURW5veGhM?=
 =?utf-8?B?K0dxL3dKS0tKMWJaYmFBTkpqWi9qcWk3VktxQ24xVFhnNDgrSmFSc0NJYi9B?=
 =?utf-8?B?eURsUlN6SlpiT21oZmQ1YUp2bndxdzNDdU5FQVpNbmh4UmJGalBpcktMeXJm?=
 =?utf-8?B?anhVMXRGQTRPa3orRHd4TEhGRWFJY3lsN1VVUjVneDZKeUR3Q05xd2RKbWE1?=
 =?utf-8?B?b1cyaDhmUEsxV0ZUZ3RoMDkvT1Z5TWF4VVoycU1idVlWQ1Ewa01JT3k0THZR?=
 =?utf-8?B?aGYzcTVvV21tZ3paR1dWNEZqb1JYc0FsNzFNZHlPQjlsL2prUEdWL1BjN0Nu?=
 =?utf-8?B?TXR1b1FlMlFmRGRJeXc4QXMvUXZpdmxYV1ZsSnArV3AxOWhNTXdLWTY3MHpu?=
 =?utf-8?B?ZjFyVnlkSFEyRXA5bG55bGFDSFpLSlYxczRvcWFHRlkyeGg3VFR2ejBYdG0r?=
 =?utf-8?B?Nlg4akRya2RHNkIrb09nUnhvRlhOeVNsempueHNlVVJSS3ZqanNIOUk5VUFy?=
 =?utf-8?B?SHhIakozRjU1cXljVVBWbjBPQlRzaFNQVm5idDZXK1kwc2didjFTenJKRFhG?=
 =?utf-8?B?ZEdNOHd1SkFDVkt0T3hjVENGK05kVVJHWkNHRlJTQkVvdWhYbXJNNG9HU00y?=
 =?utf-8?B?aW5ESkhQckZzdFJZd1VDN1hFZzdJV1NlcUc1a3lTZ1BVS2oxK0VNRnpINmVX?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a6aa4a-b3d4-4a92-1c57-08dd8699102f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:10:11.7686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7nmq6hbpiw/w2K/LhuSUnznRa7JzRfJ6tMxM1X3v2wTb4GLm0cl5FBzO8CnCp91Visn4WeOX4rTGcGgUCUYKkhp6uZI938zqsCkyAOSDPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8592

Hi Stefano,

On 28/04/2025 23:55, Andrei Cherechesu wrote:
> From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
>
> Normally, the Imagebuilder would precompute the sizes of the loaded
> binaries and addresses where they are loaded before generating the
> script, and the sizes and addresses that needed to be provided to
> Xen via /chosen would be hardcoded in the boot script.
>
> Added an option via "-s" parameter to avoid hardcoding any
> address in the boot script, and dynamically compute the
> loading addresses for binaries. The first loading address is based
> on the MEMORY_START parameter and after loading each binary,
> the loading address and the size of the binary are stored in
> variables with corresponding names. Then, the loading address
> for the next binary is computed and aligned to 0x200000.
>
> If the "-s" parameter is not used, the normal flow is executed,
> where the loading addresses and sizes for each binaries are
> precomputed and hardcoded inside the script, but the loading
> addresses and sizes for each binary are now also stored for eventual
> later use.
>
> Reserved memory regions are left TBD in the -s case.
>
> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01862.html
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes in v8:
> - remove quotes in heredoc
> - change memaddr to hex for readability
>
> Changes in v7:
> - use $()
> - better description and alphabetical order
> - use heredoc
>
> Changes in v6:
> - make initial ${memaddr} setting depending on CALC
>
> This patch adds quite a bit of complexity which is the reason why I
> didn't originally commit it. Now that we are enabling ImageBuilder in
> Yocto, it turns out this patch is required because Yocto invokes
> ImageBuilder before all the binaries are ready and available.
>
> Andrei, sorry for taking so long to realize why it is essential, but we
> are getting there now.
>
> The changes I made to the original patch are purely to make it simpler
> to maintain.
> ---
>  README.md                |   2 +
>  scripts/uboot-script-gen | 181 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 152 insertions(+), 31 deletions(-)

Everything looks good to me, briefly tested it locally as well.

Regards,
Andrei Cherechesu



