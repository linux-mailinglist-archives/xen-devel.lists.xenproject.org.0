Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABBD7FA33F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642193.1001526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cpu-00062Z-39; Mon, 27 Nov 2023 14:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642193.1001526; Mon, 27 Nov 2023 14:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cpt-00060u-VX; Mon, 27 Nov 2023 14:43:45 +0000
Received: by outflank-mailman (input) for mailman id 642193;
 Mon, 27 Nov 2023 14:43:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7cps-00060i-8L
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:43:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c8ce707-8d33-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:43:43 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9348.eurprd04.prod.outlook.com (2603:10a6:10:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 14:43:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 14:43:11 +0000
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
X-Inumbo-ID: 5c8ce707-8d33-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZceEkh66Gwd44kMWqOmtAuzcL6qxAExeaf5gnzYERU+b1Vg8xQEAevRJHcv/4RrsjYcskScuye5X9etkycf4Dx4kG2NFuL6ViraB1CrkCliktp2bk2ibw/JqafzhODggEa2s11yq+4YPGX0C2YT6rLydepyYfJusm7iRVTl/96rtJ2mOxMc5x5z52e2+C1MWDtahSxO+g3LF8+K+2XM/7cVkF5R/Q5ywikPRjX55cJYT7T21WS1rbBiWSBp/WI9TX4OeLI3fN+8ht3Hf17Eo2FKVSiQT6TxYWFGWuLSPK/mE8NgN2G5xEUBSj3uYsLo7U5aeWBHlhXPvRqpii81HxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny3XMuhL1fS2aEtPNShVNKomRw2WuywK/O+QlDi9HMw=;
 b=d+3pOHzBHZPpjTwc8SbmHqS75IB4mWGDw4Rs6qdiNiZQTgCHa9d4dZIqla9qlFVaTwIcb4he1/jFniGJ/jkXBShjhbisHjNXOEyyHSk4SGiO38ZcvF4Cdt0RyvadSDIuX87bo44hIZPLPn009LQcdYuKvB0OCdA/6hyLFPANDf8soi9s0+d5gXlkgNBctNyEWsgar42o2DMDDShtHN2OjtM5lmMUrs7ZkfkgycCAYVJIM1WoHV/O94AziMn3dGNfB+ZoRXyonWvJYPHnGSYdIOa/zajkylRliWDmbzEk2rBX3a2tTnw08deuxIaJ8WQAuf5bO65opp/ZkGrfuq/c1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny3XMuhL1fS2aEtPNShVNKomRw2WuywK/O+QlDi9HMw=;
 b=oh4P2BRkv+kWHmLUUXIoXO8JY0/4NfMX+uXll/48AnX36e7QWtyEvVZm5K/s9fby2r/5VUOUz3p2nPyjV4dJWtVjFJvAjk+yG8xeqKWr6QEn5JYtlyb2FbZIuYCS7oBOpKCwyXi9D2mzeNvyQWjxQaUYT+sqABWh9m0B9ucBKXAMKX+EbKlXs6rS8YYplRjRXdwPRbOV69eSqoLwjJicb06s9eN8exg7RyAo8NoAwvq4nVVGskG2fUYWqvFaDy3KJa/1oQEGoY0uxaTVHMDlGrD3yCNainYkpTmxXyIx2EuUR4NLk3pFg9JQCLk63iNaJq1hbv52r1JsvuHfF2BgNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61d33ac5-0523-47d7-b786-dfead58c46d4@suse.com>
Date: Mon, 27 Nov 2023 15:43:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <c89f80900a0e2dc6188cea79b60a68604938f7c9.1701093907.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <c89f80900a0e2dc6188cea79b60a68604938f7c9.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a5d14f-f2f9-4558-a226-08dbef572dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pJRdgNyCiNbLlIecayfngIp3JRshPx+abDUCFc6uwm7Gw9Rc0LdXQb7K37SQUstV8xK7ZGIDsPO/UMfUp2pkdCS48ZNo6pU2yF2Oso5rSi7fd+iThJjubD6xtqlhX63T9+aBy1wLlukHr+KMDdlNb0js87CMW5E2Yqi2DarNKJmIN+bT5vFHGM7HbAaNOKfB5pVNpdbTHca4c4wlYk7QSnKa+E2u5ZRV6Ni28/xVGJyJK7r7pS2C/tjPUecNUWsPPSmmhkK5b3h3haD24IN///yioKWJcGSWwEHIF8MFIzoYNH1aJJUzZTxi9j16pBDLVJY4axZvDyQM6PckcDj6Nyh5N3PZ8VIl5APTTPdiEqsFmtW21U5T30edyG7epXHii+cAJv3RS7nk4DTUFxf0XM8CFY3LbXMYVrXVOwygHJE/fgC+AFOP1aKjhYkbo72f5hyPsQPe5tJL9iW3gj5VufC3T4JwjyENHxOrYQ0a2BmGlUuCZXsYfii9xN3oQ5EFSEftM1tlp9ToSsfB6qhClU3rtmZO6tNFRoVOOvObhbxJeHbrdDLBCFG47pj2eljGEq/k/Tg52a+RdsmPGYZlVmk2n5QanUPirA6V79X1jNAG5vD7LAq0WxcAHXfXye4zwTnWzg/lTxWtiqjkpM2zy6OG4UzKHJuWMD5OokJrJR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(478600001)(6512007)(38100700002)(36756003)(86362001)(31696002)(41300700001)(5660300002)(7416002)(2906002)(66946007)(83380400001)(4744005)(66476007)(54906003)(66556008)(4326008)(316002)(6916009)(8936002)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDhZOFhjdXhBTXdsVjZRZmoxUkF1MVJVRVFrUnNNSDE3cGlaM0wzQlYwZ1RE?=
 =?utf-8?B?VmRSNVF6bitNd25ZM1hvTGZ0SjluR3gvN0lUditRMG83YzJIL2tmN3R5THFN?=
 =?utf-8?B?UzJZWU5vSHVMM0NZaEQrUjBVWVA4djhxWEx3QXZhanp2bHp3WEtuMFNXTTVv?=
 =?utf-8?B?SEpkbTE1a0ZtNkJtUlVQaE9VaSswbGNlV3QxS0pOZGFwUHpGeDhKc2RqQ3ky?=
 =?utf-8?B?aHRzMzE4azVFY0p6RXBMaGltUGJzdlBtdXB1aG1TZW1JK2pnT2JZZENpNFVV?=
 =?utf-8?B?Q0Q1ek16TVozQnA3MEdQVXc4RkZGSEFPT2VGakYrK1R5UlMzb2R4RWVUNnRn?=
 =?utf-8?B?WksrdGpDN1NRTFRFamkwTWhsTnBSZ2VjWGlYWGlnaGM4UmY2T2hwcGk0ZFY4?=
 =?utf-8?B?R3VvNWhwRy9wZnI5NDE0czE3ZDNjdFJxQ0lIeHBNazMwUWVLVzZYbkN1bi8v?=
 =?utf-8?B?cGZoNXlRNm84ZGkzQTQ3cnVmSlNWQUw0WXlJci80SXpjd1prQmNnUlc3QWVC?=
 =?utf-8?B?Vkg4THNQaHdRaWJIeXJSRC9UQ09jOTVSU3JUSWVOaXFIdVVGeXlacUtTdjhz?=
 =?utf-8?B?cHQ2eHFSRGx3Zzc5dVl1d2ZMZGorMDRLN01PS0tMMFp6aTBBZE51a0xmaWM1?=
 =?utf-8?B?UGIyQmZiMERrL0VnVTV0RlZpbFVTY00yWm5abWtEN3Q0VWUxQ2RqZEY3d3k2?=
 =?utf-8?B?WlMreEpnQXF1TG5YUWFVekZwZVVxbzdZdkczZnBUSkROZnZvU0cwOTRrTjU4?=
 =?utf-8?B?VlVOQVFrcnFvamQvTjR6by9pSWF3VytVRkFuV0tGSVJJQjNubisvUFNMdkx3?=
 =?utf-8?B?UDVXakhUcGRaU3RMQ0NaRjlUd3B3Z0V4UWNZRFhHMVNIR3pkWGplbDRtNDZM?=
 =?utf-8?B?SW1Ydm5LZ2tzeHRnZVVSeVlIK2RiMHJBTzVQQzFxY1ByYU85WlFKSDhxRUhC?=
 =?utf-8?B?WGNlU3hGSEtyQVhhd3BOTUp4SlZqeGVGb2FVWmFZb2VNOUh2Y3hMZ2tDcmkz?=
 =?utf-8?B?RUllazVoSjBzMjE5ZWRVNmpSbTFPSUVEdkVtK1l0MkY2S3ZCRWp5MDFVckEz?=
 =?utf-8?B?ZkJLbzNDQ0I3VEx2QzFNSEo4L1pqZkdkSUpnTUdMNFoySi9FOXdsVS9EWmRP?=
 =?utf-8?B?Qm0vcnJoSi84WE95K0p1ajhmeW03RGpTUS9tSUFFajBDUHhGVnNySUQwdGRF?=
 =?utf-8?B?S0dpUTVFd21GaDlLWk5NVkMvUlI2OWs2dG5DN3UrWGN3RjJaTTVVY0VEcU5r?=
 =?utf-8?B?OHV1UWZJWnF0MmJkeWtMSGFVVjVFR1FiNnNGbGlBNW5FVWhiNVJ1L0QwVmZ4?=
 =?utf-8?B?TVlLSWhJOW1aMlBEQjN6dkNMS0xvUy9pNHptTVlPOTJPaU1Ua0FUTG9lTEtt?=
 =?utf-8?B?RHVkZm1ldklHQnp3aEVvMTFSd0w4NW4wQkNWWWZqOFM0UEhXMEJkTDVSdWtw?=
 =?utf-8?B?MTd3VVZ1N2RkdCtZZ1VXU1pYaXNCbW5LakxOd2FHYW5IUVMrMW5yN2F1Z3Qv?=
 =?utf-8?B?ZDNEUDhUeEwyR1hVbVJ2QTV2ekhrUVNyQjNXM1BzYU82VkxVNTU3TXBZci9T?=
 =?utf-8?B?ZzRYNk56a0wrTWN2NktaR2ZjbFROQmxVSS83YjdMSHE0MmJhZVJ3QjRzYXV2?=
 =?utf-8?B?d0JDZXB4ZTlNZ3AzK0FHZjdBN2w3U3E3VEVTVFVxRmtpK0J0VDM4TTFUTDc2?=
 =?utf-8?B?bnhtbVhpUE85V3dGZmNMWTlwM0ZuMmNuUGZvMEcxcU92c2JvSkZEbHNZSExn?=
 =?utf-8?B?dWc5Vld5NlJDYjhoYzNNeU9qNVdtM1Exem0xWVpEY29qLzhyanhVM1FmZUUz?=
 =?utf-8?B?YUg1cHFrSmFzcDFPdWZNL3dRc2R5Q1d2RlAzSjRLbGhjQXJuL1dsOEtUSFNt?=
 =?utf-8?B?MWFZZ1RTRmpCSCtsWWx4VkxjUlh5OGhtejlSWEJua21rTmkycktLVXZOSjVi?=
 =?utf-8?B?SVVNN0F3NzdQc0RHNjlhcU9Vdm00MXY3STFaRzkwVmh3Vk5pZEI1Q3VBY2hS?=
 =?utf-8?B?Z0Y1ZzV5bDBVMW1zZ3FhcmcvbmltYzZ2WC81ZHVlNVdtU3grd1Bzb3R0RjAr?=
 =?utf-8?B?ZTh2RS81ZlJuSG1HMFk4TXo5QnJQQXFZZmNIellQV2Qxc1F0ejJBUzlCVE9X?=
 =?utf-8?Q?IYXpwz9t2pVXtvRlpBIjYn0oH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a5d14f-f2f9-4558-a226-08dbef572dd0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:43:11.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oXNdukW3NQb68z+VMkBnEqKta8QQUg6I6FT4qAfGch9MfecjYzr0QwDMhYTZN2PxGZrso43fKGQAp4r2v941Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9348

On 27.11.2023 15:13, Oleksii Kurochko wrote:
> --- a/xen/arch/ppc/include/asm/mem_access.h
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef __ASM_PPC_MEM_ACCESS_H__
> -#define __ASM_PPC_MEM_ACCESS_H__
> -
> -#endif /* __ASM_PPC_MEM_ACCESS_H__ */

Same as for the grant table change - if you want to remove this header
(and not put one in place for RISC-V), MEM_ACCESS needs to be impossible
to turn on for PPC and RISC-V.

Jan

