Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFFD4E8E8B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 09:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295316.502478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYjNQ-0000FA-3m; Mon, 28 Mar 2022 07:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295316.502478; Mon, 28 Mar 2022 07:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYjNQ-0000CI-0Y; Mon, 28 Mar 2022 07:01:20 +0000
Received: by outflank-mailman (input) for mailman id 295316;
 Mon, 28 Mar 2022 07:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynyj=UH=citrix.com=prvs=079c560b7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nYjNO-0000CC-Bo
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 07:01:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db26daf2-ae64-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 09:01:15 +0200 (CEST)
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
X-Inumbo-ID: db26daf2-ae64-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648450875;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2M89eonQr08RQaDD0R0tTFWOs5VEC2Y+godJffoMz3I=;
  b=fEcrYfGstBvhZ1AOB+any//xu+B/ZzSa2u5RZw7x3zKyp+v4oH/eR4F6
   WtelyCGnANj3mMTO59HUteSuXkQ4LsEJs/I+NXEBtq1pEu4mV7tQMg2ls
   ymSA2D9wukjI1o3jGnUqvAb8VgEKZdkc+aGvTmV+mL19qm5RimuQ+yCa8
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67705459
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ISbulaj60d/8b4wtXi+zXinoX161dBAKZh0ujC45NGQN5FlHY01je
 htvWWjTa63cNmSkLtkkbt6z8kIBuMfUm9ZlHlFory1gFnkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFnS4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVt1N4nniNgyaB9/I354L5Ue0YHbPEHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBO
 JJENWc+BPjGS0xqY1ISK584pvqDlFfETj5WknuUoINitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4T7EzzCqd9oXv5SGpWW4WdmZoVsA7jZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HzgbQ4xawZRGp8crVnl
 CJe8yR5xLpSZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBc1apleI2GyP
 h+7VeZtCHl7ZiHCgUhfOd/ZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWP3CPqNVJfAlQRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:Oc3906rH2PVoQzyNX+tH3okaV5oveYIsimQD101hICG9E/bo8P
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.90,216,1643691600"; 
   d="scan'208";a="67705459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIj1yy9Mx9jWmwtzwWBscwN43oZKbyLVsA09wW2dRh+YDt2XpR3sKZgAZt4tYw9Fn+szl3Hhs1i69W+szKd5ABG+dkm8OuIm0mR8Jbd7RNUUgkx1TzyLEuJakPafBaAXUGBHSj+QoN3yPpekETHnAvzhc4LfiUv6NQeB0k3XHaifr7z0nd6uP1jsx1zvcwwumOwDeTz9KaetvWbEufx6ilJ+4gG3DPhI0uNeGGv7DdFRFyb8UN6xYAw569HHw+nWqDO98UsVHKTcA2YooMS/nefjgf0PLQBq/GxDdkGT6NJJVuzwV26yY0zRIVVEeA8Bl08HQE/590wDrdcCuAGrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M89eonQr08RQaDD0R0tTFWOs5VEC2Y+godJffoMz3I=;
 b=dqg2DuRgBoun32RZt1b9fFSZgZ+q4Qp7dHYT/3M0dmBWDutVMxwtf88TTQelBeriFRO/tzxYkClfjoKhNGmwVurMzhiLkbAYiyMrEeUQGfHk67SVp/O0wf3Iim396kACSKeHPZOxKTDS2D2bSzCyOrh5WGRqW5vRsoQ/S8IyoYmsxhySZcp8ulxEAdo3jYHReVSaOWGs/EJJwwEmtep2ILjW5Sez1A+/KFMz+sEGkv4XoK+r/YCCIpETvpWDsoUaShi7AxBdVvkZsESm8o1qwJG8LQxEjAtgSwcNT/qmQIfrzKvjI1B2y+K/4zY7ledCKQvOggIKqUBriJuwRBhVqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M89eonQr08RQaDD0R0tTFWOs5VEC2Y+godJffoMz3I=;
 b=S/2g7deoNcKCvenTW7L0dhT64hyrE8LlUPn7QE2sVJO5Y0OUei6GzofVILkAbxh9jBJm4cG+Tz7agzcVuUQPyg+jQAokfGEt7oalALIxV/Af56fg4PIQVrkVQQXvCW/maPjOH9B0OEqKv0TxEGqZjwfyTPdYKtCFsU22bjwja/s=
Date: Mon, 28 Mar 2022 09:01:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Message-ID: <YkFdLq4mWy0bY9AJ@Air-de-Roger>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309123936.16991-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MRXP264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ef1da83-c6b1-4553-c99d-08da1088bc77
X-MS-TrafficTypeDiagnostic: CH0PR03MB6193:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6193AAB2EA9FDBA47F454C208F1D9@CH0PR03MB6193.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iPMlxEZf8KtiSIiAj6ehHNHVlTzpNUvv7Ue5i+DlpYD9XDA+FGw0VquoDFTquKtRUtK8luUD3qEN8+YuaK078NNxbHTea3R8/VxtphZLmza7U5AUV9SzI8/diu7iJ9toR+37g4AeHZiTVb/bXHF+MuJ/4Hc+asqVFLhMhcgjskaxP+l9535uQPBiJnfXaAj+vvNbZdtSbFyX4aNpWT6r941ao2L+JohayiHv9QwISh0sY8F0aNzn2UAMB063t7qqA0QAWBxXSOoX1F4HsGm6tLg6PWV4+hlCrW3rPOu1kT1YRvylsM7ScOmVQQDqeUcI47JJoYxAiZd3LEsOsm0K3W3/RbQlx30lx9WmHceHNwEg9U/zeY68chmjyAT5Ye03diQGSKi/qCw9751u3wWMISl3is+ZwY+/GmvxWlE48MxyFU3PY1engAeuaxTqS9knn33heC5JAErLn7Puq7CZF1CCQW8BSbHNorMbu1KMjxlyNDRji11P+sX5YC8tsQYxrbynHiJhL+O9M1taWoDRKzmKCyBwF5vesKR60i9esvK0MH2D361ElgNfnLvc5Z8m8D92nzwlBx0NRI+HkbvFs0CwX9Cvu7wxb6q6fg01DOQLKfZiUd0dv8H4HDRcvlSla/Elz322V0/KzRR9/T4gr7K+1u6pPl2Z9qgDDd3Br6EMcSRP4/SmmeF09W79aPFTycglclYEXPw35sq6LFTxs+Iy9ev6v4pixu1Lr2OPJthlWiIZ7Be5oCdRK3kclz3a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(6486002)(4326008)(66556008)(66476007)(9686003)(85182001)(6512007)(6636002)(2906002)(54906003)(6862004)(6666004)(33716001)(66946007)(26005)(86362001)(6506007)(316002)(38100700002)(558084003)(8936002)(82960400001)(508600001)(186003)(5660300002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FCbkFKZVMrY0l5OUVQS3M4UkRNZi9XdjUxR0dJZ3RxUmpwNkIzcHh4MTd6?=
 =?utf-8?B?TTBEcVVVL3lPeHUyQ0V4em94YnVrenpjVVNQT0t1R3gvd1FBQVJCNlZ3cnFM?=
 =?utf-8?B?V3U0di9xYzlXdWpyM3k3c1lGRjQwZHJpSlpTSkplbCtFaFRIM2dzWUptUW1Z?=
 =?utf-8?B?czhmdTN0SndTTVlSamlML3dtUVQ0MlBpazNrajUwdVNJRjVrekNKSXdIWTdX?=
 =?utf-8?B?NHZaR1I1UmsxU1o1bmwydElpd0hjTmx2M0h5MnhveXNHNE96am9uaHhDTTlt?=
 =?utf-8?B?Zlk4TG5mb1lUZ2tyT0E0TkNxdlMxZy90TWQ5VU5kWTN1c3NIZmc1bC9rK2li?=
 =?utf-8?B?R284bGxtM1NUbFF1VWdBbDZ5Z2k5QkJyRGVZcVlFbTNyTVdVWVRsSnNSdGhi?=
 =?utf-8?B?UXJram0veWwwbU44YjVMM2xndmFOTmpCYnUwWUtxaDVCbWdmK1p2Mm9vV2Ji?=
 =?utf-8?B?c3Mwem9jUjM5TDhKTk1qWnJZaWx5RmY2RmExWGlCOE5RNmRQR21qOGRwS1kv?=
 =?utf-8?B?YUVEU054aXlRQnArS08rTTgxK001VUhVSzJnQzhJemk5S2FZdFRFeDdtOEQ4?=
 =?utf-8?B?S3NLb3F3UVhudzNYQUMvYmF1VWhZMjlIdXE5amw4cUZ0Z2hMS1lVMVpYZXlC?=
 =?utf-8?B?YnN5ZCt3UTQ4azdLMUYvd09QeE5ZekVhZ01KMlFNa3AxR1dkZXZ1eEYxVWdH?=
 =?utf-8?B?eUI1RVdkWkRnais3YnhSMXUrUzNvalo3MVVjcFY5TFRjamhKZUlwbGxteXZO?=
 =?utf-8?B?OFNRbEs3Z1FjZ0p3OFE3VDNDSWwrOVBLa3gwZEE2STkvcTJ2a1RoSVBmUjJq?=
 =?utf-8?B?VkxYVk1hM21VSVc1OGxnM2t4NTNINU95VmNFd2F6SjY3aGtXMUJuZVBUMGEx?=
 =?utf-8?B?OWpCckN0bmIxa3VzRFZ0TDVwVkE0RGkxeDFUZmJuaE9vRjB6QXVKRmRrQWFr?=
 =?utf-8?B?clVXdWdZVTZTaWxzcGdtUE56U1p6VFFKWUhMVmF2MkM1YWhrTlVaZmFhM1ZS?=
 =?utf-8?B?a2Nwd0dzalJRektKZE13RFI4MlZSR040eUFYa0FPekhraFVMM0FyZDlNYXB4?=
 =?utf-8?B?NlcyUHltYzVTbTdGVHkrc3l4V29xVEVsZnl1ZG1wWlpIVXJhMHgxOTlienBw?=
 =?utf-8?B?cDN4QjJ4Z2xPUlJsT2p3cDFncTY5dlRNcjEvVHRuTDdJRUlNckgrZ1E2cTM5?=
 =?utf-8?B?TThCQUMzV1MwOEF0WFVBYjUyWWVPSFd5UURrejZucStMSlkrcEF5QUNNQS8y?=
 =?utf-8?B?aE5IR3AxQ1JpcnlCNnNzMTZNd0JkR080UEtLRnEwSVM0MHh2cWd6T2hhNitt?=
 =?utf-8?B?Q3k2Y2RzVHBmaXB4MVgvSWVGMldweUJWNCtlc2ZKM2haYnlFVnUvelZicHlp?=
 =?utf-8?B?OVNjeTNEc0x1QU92UFh0RitjeVVVOXBUaGh0MHNqamZMTXgxSWZlNlFQWUJT?=
 =?utf-8?B?TlJOeVc3eFNSVGNncHkyNVZOdWxCcTdkd1NMcU01YWl5QXYzT01PcTdwYVdo?=
 =?utf-8?B?T1Y4dFU5RDRaNWRNT25MY25BQ2lJSEtVdGk3NWRLUVl4Q2lsdTlDaGxpZXpO?=
 =?utf-8?B?YnhlUXIvd2dNdkp1S1Q4WFE5MFVaUTRpQUlFSDhvaVlzYVNPRzNLazErWFNS?=
 =?utf-8?B?cTgrNENTcUJIOFM5aEpVT3QvdkF1U2hsQVpEdGFtNGVhcGN1MEsrT21ESklO?=
 =?utf-8?B?R2FhamN6QWRybDZsa01vSC9GYTQyU2FDcWFmVXlNOElkNDJGeFdFaVlGZkxu?=
 =?utf-8?B?MDBRalVJbTlvbTlRRjhQWExHaVQydGFJclYwTHVPbnk2VTVjaEdmZ0svMDgz?=
 =?utf-8?B?SmVBSVhHN3VLYzIzYmdlZVhnWE9Yb3pIQ1MxdjUxS3R0aWFFMTVKS3FUdmNn?=
 =?utf-8?B?d1A0OHBlSHdQTitOckRmdC9Fd1h6ayt5RHpBcll2cTBuaTRFQXFONmhtMWpT?=
 =?utf-8?B?MU8xTW1TS0Y1Y3g4WU1Qek9hNUREYlJZcFlKbElQWUl1VW9DbXFoZGEzVTU3?=
 =?utf-8?B?NFBTQlRNSlVQdXJBSVdKY0FVdVR4U3pPR2lRb3FBVEZKdWFLemJTWmdhTjZq?=
 =?utf-8?B?bThUQlVzYmg1MVhLWFYreE9lZUU3Q3lOTHFYelRjRytRRXZLMDU2L29wNkJa?=
 =?utf-8?B?ZTNqM0M0UkdVcVQycDlQUWkwaVRucVRycjVNbng1eFl5TkhJOFZUVUNnSUxu?=
 =?utf-8?B?MXNaY2hXRHJSZC9EcXJxZS9EaHdHVi94WEF6YXU0cHpnclZQVHVPcnFzaDBs?=
 =?utf-8?B?dFVGdnVTenQ3ZlhHVW5oL2pSMUEvWWkrTkExUEEyRVpGUDBzMW1pbFdCTEpC?=
 =?utf-8?B?UkY1dEtkWTRGL3VINVpsYXg0bENpamRJc0gwbHFiVVRhdVVYSjIvQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef1da83-c6b1-4553-c99d-08da1088bc77
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 07:01:09.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhUhsyUQ5Y3b+1FL/SpeDzZCUewKWnaWaiOoOZy24P6wtYUfuMCogTA8TgcWijc6pnT4X4ovKXE1eD/pEKrb1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6193
X-OriginatorOrg: citrix.com

On Wed, Mar 09, 2022 at 12:39:36PM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

