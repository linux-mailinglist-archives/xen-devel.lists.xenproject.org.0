Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827BE6E422F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521825.810739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJv3-0003jH-7d; Mon, 17 Apr 2023 08:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521825.810739; Mon, 17 Apr 2023 08:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJv3-0003ft-32; Mon, 17 Apr 2023 08:09:01 +0000
Received: by outflank-mailman (input) for mailman id 521825;
 Mon, 17 Apr 2023 08:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poJv1-0003fb-F1
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:08:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1adf9ff4-dcf7-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 10:08:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8746.eurprd04.prod.outlook.com (2603:10a6:20b:43f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 08:08:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:08:30 +0000
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
X-Inumbo-ID: 1adf9ff4-dcf7-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2lCgzE6fSIvIsndOT4XxfcZyrODK3VxW9V67XCV6JwVilE77MY9cOf2P6jLMD5fnEYpzQI0HWdbjFqlj9hoCExEuFiJlHAWKMGPFlVutFCn0J1yulnqR4jhLAfR6XBhybC24m9f2Q/JPBvYWoS2jl8b/XvqmYazJUUo9VESb4LQ/dwZg6KrxaD0RpX5JfXHBp76v0co/TWUb9nGly0psDnfBL1ohjyfUwylGnXrS3WHnxH4Qj0H5dYm5dHrB5c1ZFQJ566bCiPwN1PMLh2fKBnbDQ7sNI6hH9HKOOML73ixHmEdYXuWqBIiOBNakZPKI4nVNrX2RR5cZyg4br511g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJyVcNZsl+a0+4gqIW4m8I94oRY2MExdgWMzYzXAf2k=;
 b=Yu906kOp3QtXwiTmFJVA7yfI5Ea+egoPkdtDDTHT7b7bk7SI17JLsjKyjqM4mdWFYyFA14O/HCbPQtulEVeDqxlQ2b/v0ZJBzNpjm12ehRWhQKBrtnoHkzmVtG15sjNlZkc/vdhbwuxC7zDD0lWklmkaYBnuQqM0G1Uhmwq1QKmkeiD+vPDhBKEnvFYaatLtAUfKPaQxelEwY8ShI4pa4saUgo/+oh71MiJKDeusmfec/xSRADOueur3zOSPDLkg5eZJfk+Q6CnDU4c2IYFlRg9qwGhqa+WKnxdTSKdQwFwJt6qrPF9euzhGEQ9RS2/6D4bhwT+yqaxGtuhd/uKJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJyVcNZsl+a0+4gqIW4m8I94oRY2MExdgWMzYzXAf2k=;
 b=U/cHm4a96HrLGIVhWXSohDZtrkqxjWtmg4YqE83b87ztYAT3W949t1VPs76h7WcmnJRWzIh/KMdhViETJI4y4sIaV5QogXaS09Pm+9aVoxZm6lJ5LGCdlbTSWkedqCuwy58LsJK6KyyMXPBHPvsLIUYrClqCsg2Caq/sVcq4t5iXhvvKYW2DKiQmlirlo2nxSE6Vyc2vIlV86HLJ4hTfOYBMWkH8SPv3rg5jjw95CnefcPtUxnBN8yrLtwTI7LSyhO5MG7FSSUuUNUtxpr3dWJWIkT1VvJ/BL6OqC003o6O+0In9Kn4uVK0LP/8ir53WNDAc6QOBB2mJcxvW4TFH+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50fb5231-26c4-e580-0499-944402e6a9ab@suse.com>
Date: Mon, 17 Apr 2023 10:08:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 13/17] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-14-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230411191636.26926-14-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 49012735-7047-437b-5817-08db3f1aee20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qDBUam7sfFSsRyjlb8Lxo2uOH1UTCsfdfth/VUbymuLsCwMiTkz8t2u8L2VDWop2bMfuLUz3KuBm5cGhNIV8FxuMuWGYhw3ESFvPvf+OjSCLNtwjxSgTRPT5A+Y+laWaI7R39s8M4cgBse26IZPn0macu00WUOpwAvkuAeKL9UzrXwMyy2QW/H+DHX5jNytlJrzuFk4rutXYvtwHCe59ltmzqsRmvlJy0wjNMifB0gec2Tr7vWgpK5xmRShVrHjiggr0OagytfDnVCCJ0VM3SccBRy7FKKiT0ajcx6wh3Oj06UpBRQRlFrMayQQxvRKUTzuhslBRNsxckM22dQCto3OxdvPSWg24FmtTBxR4+6wozrb7jyb2Er1ZiO8rYcTT27beXq7fCkMwvEbnQW65U+PbJp1tmSzvKPtS4IMVZOTmmy+hdjJOLF1cPeSOnN2uCBL0FtDENbFb4Fyicox2QLKVpYOgpMOhMwC2LfMVJDfxzNfJacMIl9OESO0sAvx405sXC57P4FkNtfVaOGDhyPbGt6wHRsiypshV1VKBFuEmjTPlZh/n4XQU5Ooe0TkWrRIt+DrbVsdJVMjKEetdk3mOANlznfpgO1oExIdSBNwKUl2j0+ReeoJiCv4hMAcRmV7BqRn24C9Wf2yBbfErUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(5660300002)(2616005)(86362001)(31696002)(83380400001)(53546011)(186003)(26005)(6506007)(6512007)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(6916009)(66946007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTNCVFJxL0VpbU1ZTSt4ZEJxUXNLMnk1Q1d3bXZyVjNCUGk2Nm56OEEzVmFk?=
 =?utf-8?B?OHlEVXBuZXFsY2Y1eGhaalFUV0laMzBpYWN6T1FNQ011dlBvdkluaTBTYUVq?=
 =?utf-8?B?V01uSG9idTBCTEZxT3dDaC9hUFBaN2J1K2xib25UZjl0MVhxbVg5ejNWVmxo?=
 =?utf-8?B?UVZValgxUFVkRU1IV3h3ditXSnJlS3pYUWNOVGI3MnB1SElra1ZhS1VFdzlB?=
 =?utf-8?B?V3pSVG44MTljRXhmWDRZM0hTWFhxQjFHek9UZTY4bmtJMmhGRFpGalNkdjhY?=
 =?utf-8?B?UXU3VTlqa2RDcmdFOHZFSW05WVllYlhjTytqVm5iYUdqU2N0NVg4aTB5VDJ3?=
 =?utf-8?B?c21mbFAzZWlYTnNXREx5bmZjV00rY2J1N0R6RUprbzE3blVweUZwOXZxNzBx?=
 =?utf-8?B?b2YyZXZTekFXbEYxb3d6ek9TUXhhejdhL3c1Vnd2NVdNeER4eWJZYXRlb1hK?=
 =?utf-8?B?NGRubU91bkgvY0c5MnhoYTZCZFJuWXdaZmhMS3pnczdUdktZa0dpQjhDOUYx?=
 =?utf-8?B?QjViR0F0cE9CVTBGYVRYY1F6ZnpwMDBMbHMvaThOUG5neDU4b2ZTNmxCQmdE?=
 =?utf-8?B?OUlBMm1SRG95bGIxaWZGN0R1NThYVk5CRFZJUXBja2JsWnJXS3VOVEFoRlBm?=
 =?utf-8?B?Q0pvQ21DRDZnRVhsRUNxaXpaQ1RSZmZMWHpBcG1SSGI3NndFU0E1bUV6Mjh0?=
 =?utf-8?B?eDJFUUUyUVNwTFFQYmljTmVJQVNINkYvQ1ZGMXBKZGt4eWlJcXpCUWJGMG01?=
 =?utf-8?B?WnVHbU42MGxjK3VOVk8xZHhnb0taclpDcXRFTU5DLzF6QzJSNm52Tjg4Zkwr?=
 =?utf-8?B?NGwzdGo3WTR2RkwyNHR6WER6WmM2NW5RNjBxamVweUFlaktMV1F2KzZNUjRI?=
 =?utf-8?B?OHEvOWFPRkJxT1hBdVRoZmFzTURUQVlEU29HcWpKbHc0dGMxZGRxbytuT09Y?=
 =?utf-8?B?QkFRSEVubUx3dXhxM2NQaTdCMVk3Q1NrNnZpVFo1RE1RazJJbEkwQzQyWjc3?=
 =?utf-8?B?eEdaUld2YUhray9QVzlSTFZYbVZSMFV5d2VwRDBwOGdIUDRpWVczZU5mbXBo?=
 =?utf-8?B?K1lwNlMxcTdXYVlqSENkUE9QTEtod0VkVklkbnZPazc2N1p0QWIzY0tDMi80?=
 =?utf-8?B?UjZXYjJ1NDdGcDdmMVVTckVoQUlCK2tvVmdZdXkyYVY4Q2NTOEs0MDJjQW8y?=
 =?utf-8?B?U1MvcFZzR09vcStwYldDdUhCTE40TXV1OThIL1FDczZVZUtlZUJKOWNxb0ZS?=
 =?utf-8?B?dDBiU01JV2RqWHh3cmNPYnM0ZG9oKytrVTAyNjRGd2NuSGN0TTdKS1U2ejFN?=
 =?utf-8?B?Q1N4RkxBTFpOT1U1Nys4TkpsSlJwc3RwNFZNVmtvZkVFTHdkTFFCTGY3aUJ1?=
 =?utf-8?B?cjdYdEdyKzVuTkhJM3pkZTVYaktaNEJnZWNET1pYb2YwYjdzZXFjZVFBZWlR?=
 =?utf-8?B?aEpZdFpxZE9DWUIrL2VBVVZ4N3piU2Q4L3V6N2NDM0luV1hZUjlIWXE4OVY5?=
 =?utf-8?B?Y0lzaEd1ckQzaU1Yb0ViNzNqVEY0MjREektVbGMycmI0T1RhN1RXTDd6MVlO?=
 =?utf-8?B?bk1CNXRXY1NhQXFNVnJsV3liS1VodkFGVXJvc1JCOHBqVzJRVWVsZVFNL0FO?=
 =?utf-8?B?Q0hjTmVQc0VQU0sxS20zYTdNQThoYVA5T2FWSDBwVXRHdzRzVWpqN201U0F6?=
 =?utf-8?B?elB1WnhmVUV4RGJMa2U3U3hlcmx1UkVVc0lUL1EvempBR09OR2w0WWsxeEJY?=
 =?utf-8?B?NkhoVWhrVEpOaHU1T0VRMmtycU96Ky9sSVB3YVEvNDVFdlhyN2lSc2NMdVAx?=
 =?utf-8?B?TGVaRFBFQ0UxTGJRVXg2RHZxcGtQNFVlbFFIU1VtNVVaZ3p1UHMrbHlGUlNZ?=
 =?utf-8?B?VlFUTFVtK1hIR2dYcnlWNUZCKzBSd3RNVlRyNitUUVVyRExtL01tWitKRlpi?=
 =?utf-8?B?RGtvTHZWblNDWkJqSkZOTitjb2NmM0FDUnU4RzlWMHg2d0thOGJIeUxrOURQ?=
 =?utf-8?B?TDZveVA3alV2eUJiQWRsYWpQQ01MVzkyTGthd3ozUk1TZmt6RExNNVhSUFJ0?=
 =?utf-8?B?S1JHVGZoa1pTeG1RQkpQUFc4c013VkF1VGUyZ01pNmhzNUd4K2NncVV1N3JP?=
 =?utf-8?Q?Xcs0nU8rdEAmcTw2MwyQKKP/y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49012735-7047-437b-5817-08db3f1aee20
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:08:30.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZN7xRvuZiKddJ4IpHrs3MLyL+yOAlp4N4Cg4g7eT9yEMRZ9To80Yixa8LZoVnvx9T9/FBDWyfnoz9pK529Ucg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8746

On 11.04.2023 21:16, Vikram Garhwal wrote:
> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> device tree overlay.
> 
> xl dt-overlay remove file.dtbo:
>     Removes all the nodes in a given dtbo.
>     First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
>     in dt_host and delete the device node entries from dt_host.
> 
>     The nodes get removed only if it is not used by any of dom0 or domio.
> 
> Also, added overlay_track struct to keep the track of added node through device
> tree overlay. overlay_track has dt_host_new which is unflattened form of updated
> fdt and name of overlay nodes. When a node is removed, we also free the memory
> used by overlay_track for the particular overlay node.
> 
> Nested overlay removal is supported in sequential manner only i.e. if
> overlay_child nests under overlay_parent, it is assumed that user first removes
> overlay_child and then removes overlay_parent.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/sysctl.c        |  16 +-
>  xen/common/Makefile          |   1 +
>  xen/common/dt_overlay.c      | 415 +++++++++++++++++++++++++++++++++++
>  xen/include/public/sysctl.h  |  24 ++
>  xen/include/xen/dt_overlay.h |  59 +++++
>  5 files changed, 514 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/dt_overlay.c
>  create mode 100644 xen/include/xen/dt_overlay.h

Can new files please use dashes in preference to underscores in their names?

Jan

