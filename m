Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F6669186
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476859.739258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFiD-0004ib-Kb; Fri, 13 Jan 2023 08:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476859.739258; Fri, 13 Jan 2023 08:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFiD-0004fB-Gu; Fri, 13 Jan 2023 08:46:57 +0000
Received: by outflank-mailman (input) for mailman id 476859;
 Fri, 13 Jan 2023 08:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGFiC-0004f5-J8
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:46:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2044.outbound.protection.outlook.com [40.107.6.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d48bd93b-931e-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 09:46:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 08:46:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 08:46:52 +0000
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
X-Inumbo-ID: d48bd93b-931e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5KazfsCpkdnLqwmSttL21y74VyXhANyKi2w57+kFiW8GXGxhNu06lWzg/5sKp3eG4WEPW8yYjz3JVPgJH3SJ9FcOUWnlUA/CIsVYFYvcZ6MflUGAZLkAPsPttpW8/D7irEhnaYIfcmx4FeW3IqhVQF6YUAZzcA7mM6lvHgItnt/alZPge/uiEWpuOPGWW3f+3BkZW1l2QhohCCTYzR/c1ex1cllxceJlO+qCq2A4NMieogu1/mRjrTF2NsbPdgFWmZ8GD2IupkdxUwbiceKiIsBVHB+Y8I2AiOGUmG1tslcKwcBYq0bDiiS7nVi1XcXJXWM3Q0FCbcF43VPNqF6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKEfNKB9Lh4zFo/AYJGrhFntaz82rAreSJv0LvWBp9E=;
 b=mXak62sMKO3q09vk72pg2YRjRqq2X7P/pGHHffPMjkoy5n8BWGc/KfdcHSrUBF7buyVm0q7duKcWNtuq98BPPuCa6nJdrhX6wBQG8+dXXKZKrvy+u9jxEMNV2CK4+Ua8ZyYleTdqIEqN5omQNs5YQKRtQx5B/Gwqy4YQQYJWPYeEz4gCFrQ/Xty0uAPfSkbUMGpcSyIeQVjMwtfyht1o6e+qncgRwbZg2+IsdjhYLH2Zt5+DMShM4BbNJHeyhPcwy6Ad2g8yxDLx8GhQr0f+UbVTtBiFCNfgWVe7eLmb3EGxLaSdyDM+S7CH81eryomJfcY71w+asLkLk//vGp1p9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKEfNKB9Lh4zFo/AYJGrhFntaz82rAreSJv0LvWBp9E=;
 b=SmbvCNm5UQqbcvgCyFxMxI1NxbYLVFQbSCpdeCWgv1KLFwOa1g5b3SCOrUwbRq7cyeb1r323TzN2uJURQRGUCTxyTNPiGP9ysOSNczjmAvZhaBzQ70R7JjKffRWVcKfnH8VXDfO4qV8ZDiGHnmMVssfzp3+iqxl26Qv0QojWMM13SJnpzdJXShTjyq2ywhY4mfCvfvCwLjcRy4zoGc2tN3VvcPHNdCN1YaoypGsW3xrqEEFqqZFb9z0xaSFzPFM3KHQhtM55lfsW71NkXFAfMRwp4IOdP+llZNrINRLj63u+LcTSy8ObiLDBenJP3VEwRewPSEQZwCL2ccOgbDkgig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
Date: Fri, 13 Jan 2023 09:46:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/shadow: MMIO treatment
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: cbde5a5a-d873-459e-3b7f-08daf542b794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IngCBRJIEc6w4OzZNRBanczn9nLd4ebrZLIsn8uWJf0aXEKipFckRoTwRELu3n2KylxCeAvDA9HtnOP+Mh0mZcmPkAwU2nvs1XOegwBbKuIuG+L1P10nrGgV53fFL7qkwH21Q9NIffS/syz4dZwRcQCvLEbenOcfqwPMLgqByG1nfa8e4jNzVtpz7SbVy1IJnsV2AsAlzqk0mS2kfB22xRUKQiUg0moW748+OENhMJH16reAp+k+d1DhM2ASmzH7q+BJCf/QezbGcigqO6wLT2Wd1NnIFKKrtW5zRe0H8Y9r+VuEl4Gwr2bAsNsTRZF7XlArNtQz5MyF2ju3O/nVnwe45qtLdS+LXR9BbBPC/fU6qMxPNbiy8ktsG+ohhueJDr59qAgERclmmyJ6n++Syz8xokmnrWSzPHAFUa1R4myZGxQ7scqFzkf4XDt0Q4K+T5sJpx48uETVDNlsbOlSJPYK8LA28+or0KTI9zHKs4Kpm5zxJwBvz/0finzPaALMibnmXQbIrMl20a9xDYejn3BjvxAPa5yMMqQ6geZWsQDAxJfMmtICiRxpD1194l3IRUVdE1QDMRfALLdskQEGtCD/erFJvBNd49X11Hu3uPrfuq1ImFRNWggYWv7d0KMuj1SldnXKISIiM1a1FipvezB9lD935tkxlbR3c+JxqiKJdST3OGzmjvcNK1bAXGnP3E3+anI8hydaCwKf1rE42aF4e3vq5EYFekWdOJVc7yY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(6506007)(36756003)(6666004)(26005)(186003)(6512007)(6486002)(478600001)(38100700002)(31696002)(86362001)(83380400001)(2616005)(558084003)(8936002)(5660300002)(31686004)(2906002)(66946007)(66556008)(316002)(4326008)(66476007)(8676002)(6916009)(54906003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzJ1NVFEdmNyR1ZIRTNUcGFlcm1UQTJ5bU50U0FhNGtZR3M3VzhPUTE3d1hp?=
 =?utf-8?B?eEtYRHMrNGtWeVdxYWFTZ09GV21TL0NnVGZKTkdOaUxxY1JVb3did0VqNHhE?=
 =?utf-8?B?UFFFc2FZak1HKy96c3ZrSTVtVGtnaFFlWEdRS2dldEhqM1Z3dVdyek5vdUZu?=
 =?utf-8?B?elppbEJjaDg4T1U0bWJlZjVsc3UzQmtlWTNXTDlXUEtzcTZ1Ty91RkhOakRi?=
 =?utf-8?B?a2RBeDBvb3FvUXB2cExaY3NuQ3M3K1hQckRyeW05MXBmVURLamZNUzNpOFR1?=
 =?utf-8?B?akJGR2pQd1V0R09sQ1FCU3F5bkV6c2NUcUZWbDlZYzBQY0Q3b2w3cWtJb0RW?=
 =?utf-8?B?ZGNHY3laM2JRekk5T3hQWit0ZTh1aHNobVJzUVpvaGdVMlNPODRHMEtBMWRK?=
 =?utf-8?B?UGdFSklZU2RscVc5NjFLVXZVeHo0YUZ1RFVnUlgxMXhvZkV4cEdOQW9IdFV5?=
 =?utf-8?B?cnZRczdnMk1aanBrWVREZ0c2UDR1eThkRHZVbGUyMDJMTmMvMW9CRmVQVG5a?=
 =?utf-8?B?U1dSY1BCSVA5dGNiNGR2cDFTamdVYnloeklHOHp4Q3Nqelp5aVBCalU1ZUxG?=
 =?utf-8?B?ZFpGNnRvSWg4bTMzdDVsUHNNZlZlb0l3U01xeXVDL1NDSTkyZ3dpdVJNaFNR?=
 =?utf-8?B?NGRXYms1TGpkOTNHd3hMZU5YUDdwVmhmZXBWOUsraG5WVC9NcUJLUVhhQW15?=
 =?utf-8?B?c3B3dTJVb1N2VElqLy96RC9Ed2pjT3grc2dncTdMdC90U2kzQ3ZubEFiWUhK?=
 =?utf-8?B?VFUraW1WUmVNWjVwU0dCcEJjOEdad2xTRHh5R1YzRTFUWHhSeCtkS0ZyRC9q?=
 =?utf-8?B?TXErcElUa0ZkeU5SamhwWDFmMkJObFhab2gzT21IUTFrdUc4NnZKUUVidFJ4?=
 =?utf-8?B?dDg0aVhESHR4a3Jac2lvbVlYWVdLOXp2V2RjTjVPRWhpVFpBTzRLWW11MkIz?=
 =?utf-8?B?N0dHM3QxSEc1bXl5eEtXTUZYMHVlZ0JUUVh3bFV1bmMxaGJhNzdvS3lONVZZ?=
 =?utf-8?B?MXNieXh5YjBjTEVnWGtac1gxSHFzTnJXZVRwRGFzVmtIVU5KYlZ6dXRETUZw?=
 =?utf-8?B?U2c3UXBZYXZZelp3VFlIV01vRDZZK243dlJnYWh0MjBQNlQ3TGtZUmZQNzlM?=
 =?utf-8?B?TjA1Q1doTmNkbVYydmdjUzhsdWI0RTc5OVNrQmJVZFFOeGdrWGdQMzlkYzBZ?=
 =?utf-8?B?cjZEU0pwSnBlZllUNEZHb2ErODNoTjRMRzBLUFBWVU8rQ2ZiazY3UnBCVDNK?=
 =?utf-8?B?OFJheEY1R0Y5bzhWUjZSNldpUVNuWFV2YlFOSHpJc2p6bVUzRVdOd29ydW1K?=
 =?utf-8?B?ZENWRVdxUTlGbkVoOFpZUVFONmpCN3QxcmQ0QzNqT0FIdEROaXJvc1VDSk0z?=
 =?utf-8?B?bUJobzlWVmx0MGtDUDNtMkpkQk01bi83bExqSXlicVhJS3pkNG92LzVLQmpz?=
 =?utf-8?B?bFcrZXlFUWQyZkRleUpiZmN2OG9tRmlJUkxOYi93WXZmV054UGdTNVRKTG9D?=
 =?utf-8?B?VU5SdUF3QkVPZDc4blRTb09XUFI2NGRSSGtvT1JxekpDdXFGRDJXMHdncEQ2?=
 =?utf-8?B?RlFtaWw3UFE0ZWgyYjR4QW1iNWxqWFZ3SVJtMndsOE16VDNtWEJhZ01raHVT?=
 =?utf-8?B?c3FSYlFzQ29RKys2emJNWnBjYmZXbUd6NXRlMHNFZjF0bk0xRXJxVWxBbmNk?=
 =?utf-8?B?SlB5WWx4aWttODZrWjE2ZGRSdENkNmlTWlg4VW5iVk5TVGtvYjBORnhKbkdQ?=
 =?utf-8?B?cVJuaXdJdnZEVXJxemdneFNhU2RCa2Q5cjR6a3dFeS9GOG1pMjY4R2hWdmtz?=
 =?utf-8?B?Zm8xdCt5UFJtRFhMRE1HR1RIUzAzcmdhYUs2ZGJPVDhyTHBoNkxFOWlxc01K?=
 =?utf-8?B?VVBVWHZZcGlWZTVzN2F1WFN1a05UY0FYdWNoNHFyRnZpL3Nja1hJQWNadXpQ?=
 =?utf-8?B?dTNvbkxYYVA2b25jSGNpUm01UEVzYTZhaTdtVVV0bDBjcUZCbjIwcWtCYldr?=
 =?utf-8?B?SVhmOERRMk5ZK2lJdUsrelBYRGExMHd0TFdZa3oyblNvUTAxMjFmNTRkS2lO?=
 =?utf-8?B?c2t4V05Id1pNSlNmL09KZ2pWSGl6K0JqWEV5RU5JWmdHVmo4UExjak12Tjg5?=
 =?utf-8?Q?SaIt4ohV4MReMS6CzdTYUT+ev?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbde5a5a-d873-459e-3b7f-08daf542b794
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:46:52.4188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSmwboFMXHaNrPVg1SMJtQEu0jT+W8ASINZIxdexdfr/gdL/+hcV2FEf5O72CpQ+u3XcETDfP3gMejChGdi3Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732

While reviewing Xenia's change to iommu_snoop placement, I've
spotted a shortcoming in _sh_propagate(), fixing of which made
me notice (again) a 2nd kind of issue.

1: sanitize iommu_snoop usage
2: further correct MMIO handling in _sh_propagate()

Jan

