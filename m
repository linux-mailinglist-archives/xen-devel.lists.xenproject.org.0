Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E77F74D7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640693.999293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W7u-0007Ca-GI; Fri, 24 Nov 2023 13:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640693.999293; Fri, 24 Nov 2023 13:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W7u-0007AK-Db; Fri, 24 Nov 2023 13:21:46 +0000
Received: by outflank-mailman (input) for mailman id 640693;
 Fri, 24 Nov 2023 13:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6W7t-0007AC-6p
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:21:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696a1b97-8acc-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:21:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 13:21:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 13:21:42 +0000
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
X-Inumbo-ID: 696a1b97-8acc-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dt6gnZO1XMF9Aob+FFhkG6NsOUkguqLGC8mwvy8zfSsPLo4F4QlJartXT/BOl4t+4+0XntT5umo7p7O+hxE+bQve+YYg1Wqj+dFoFRTrS/Gec/kSui4gq3GUI5m/TyNrBI4P4CceQziNufr8TCZd6xpJOvx+/oSFRrp42PRj6vN1YX5r/ID2r0lAF8vuSf2MQsaZX9w0e7q22eLvbnmf0kq8x+cGCKr0+r7PapOXpeVQpEzCu3UIMXXWvgIDs4KY1ruNpaCBmi63YWMRqh2nzqd/2N416Mtp8pk35ydfjc+vadzN4HALkFG72evk6Q4jkyOu7YIzZ3xa9B4MdC4VCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp6wz80eQlDToaoHsFELXIRGZd2smX+6sKRVULs4A8c=;
 b=cxWk3+TKMDhdCNd4Zv/UszsrZe0DtA/MGuLnrlJNCCG6hDI8n4ThX00SYR15bnXV7/571nYA9lwRxt+FuQ5zgKiw+KnB6L8XwWAWA5vNlLPAfabck90eDXlDIXIHGqO4DX6rcC63GLQnL4dSDeXOjaYid3QTER8eiP49yU7FvFIALZUfQSZMONgdZly5E6T4NIAdPsRH+So6ZUGf4J43E8mpcYhn57cRHCQ9y8li9gnmRMcnNMentKczsExmH+tMD7MLWfBLgONMsQljCkBU9AA369usBJbfZomQpIkLzZklh4B+3StXe9idJF74nwAanuQGANSSyDffHhuTiVKDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sp6wz80eQlDToaoHsFELXIRGZd2smX+6sKRVULs4A8c=;
 b=MMIvv/IhtZJFWQJQJjO2QrJHy7gA0vH38pSrwFbIxll9CxdS76tw3QWDMKL6M1hW+m+VOpOe5J3GoHCigMCrz/QelJk9D8mM+p/IKgvpWtBF/9FOHiGQ9+LSK40IgW4nE0NNQf6Lh0j0TLpZmqzbdgfSimIVrrMx7qUbV1k/Hu5UxSlFimiYXMYeArmMq6Y1/AiBQ+WVjcf3HtzdV5xbT3SjmRKQ3gY5ztiPB8ZRyRxwIVTPyrPYD8BDrBxtR/OoKoHZEecIQwSLfc6hKrtYFzqjg6qqZ4n6tWsJtM/oNuyEzVEBp/qeMXdPO5rB9mqnT1iYvveknJtoJ67qPe0u0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6dd0b64-9977-4e86-ad20-b46bfa4023c4@suse.com>
Date: Fri, 24 Nov 2023 14:21:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] xen/asm-generic: introduce stub header softirq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <8b1969350a4f05758969058d47ac3ec10d80db50.1700221559.git.oleksii.kurochko@gmail.com>
 <14c1f186-bbe9-4a66-b6ad-e89d85fef8ae@amd.com>
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
In-Reply-To: <14c1f186-bbe9-4a66-b6ad-e89d85fef8ae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fd8bc5-5f13-4692-c532-08dbecf04cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2oqFxsFjQWZfdRTp68WluUwT0Vvbd0Ri9LvWUkifFJyuPg+E/HDziMreGJkofcXHEMPkswCesGiAxL18cKOmyQkWDbE/dp+WjN2nDd4/lxE7do49BxkRsXcRzPCrRXhiI0ikYDzHIRZ+Gy4PAWMQ0wXvevg1nRdI8J/1iitwJjvivP0Wl+ee3sqUAvvaHJ9lI4o5mTS+TfxNYMB+FgtepVcDMmoXJP/StSt1sAOv+ShYF7sIKH1/pM6EtWFKzB4NwfHqFrtnaqVuR4g5fsXpSR9N3leY36x8VQKSRTKjBwK37LK/w1IIRaBi8MsuWv8phsiFAgsmHpl55CQ+0ppJ8WdHO886Jxc+dZhsvAcv5fzP9waxDpGpVVqOcD05jU+b4G7RD01HUuKIJ+fwWPcKBligP9o135Vid/EtPrh1cTbI8lf/iugsc0jcQ58lXGppftW52W+BfDyPmf3soVlK4mAJdfmo5BiOeBLNF5op3IY7tN8g2ecx1Ihf472f+6BJxA/M8gRwd97Uj5h65iX55cf2pzuZtamke24sqFJlK5jV82pn6wZ0HTMUW/vX+qpPHSrGlGbkJx6A4bq+woQrjrMF9VIPqQo29fzw7FrE8g9sqv1Mk59PQSysxTDlx7cAtCsGTVIeeDuyEqE+DLIjjzQ9gHuvC0XpEk5m1DCTu84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(6506007)(53546011)(2616005)(6512007)(6486002)(5660300002)(4744005)(41300700001)(7416002)(2906002)(8676002)(478600001)(316002)(8936002)(4326008)(66476007)(6916009)(66556008)(54906003)(66946007)(86362001)(31696002)(36756003)(38100700002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2NzSlJaQ2tVSVQ2Q25ZSDY1Rm1xcHJET25BdGtyNi9WU1JkTWs2YStkN3FN?=
 =?utf-8?B?YWNKdSszalQ3Qjd4VWYyL21RWFNJdlZlQjZvWmxqVFNseE1GcW1DNmVnU3FX?=
 =?utf-8?B?ck5mUGVPbFROMk9BTXl3cGNkanl2cHpnbytQUVgvYkRUMjFzb3RTd3RhTThi?=
 =?utf-8?B?QVlvNzB6ZE1jMW9tTldHallUeXdaWkx4cTljUGVBcVhKazdHK25VZDVsM3Fu?=
 =?utf-8?B?V2V4MVpVVktZWDhqSVlYQUpuRmdTbDZYRUw5L2RRYjR5NnNRbnZpTkNPVVNr?=
 =?utf-8?B?SWlsN2JGditySEE4eVdLa0hRZUlKYkVzdzhhaVZqSU9FUGJsM2Q4T0M2WnE5?=
 =?utf-8?B?MzdFemNmaGJIaG43eGNiOHNQMEdObmhyeURIK0hwRXdHU2RCQUFhNHlaVzl0?=
 =?utf-8?B?aUdVVXozS3dIdExoUDdId3hZempjU0twWGlOanFuaGRhdElRaWRrZ3ovaTVN?=
 =?utf-8?B?L1BRUSs4ZWI5MkFnd0c0ZCtrOWN2aVZpQUdVOGQ4SFpDRC9LZmFMelF5YWxV?=
 =?utf-8?B?elc4ZWtpeDdaYWJCYkF4aW54dWpINUZqbkM2MUlkWUFMUUpIYllUM084dEor?=
 =?utf-8?B?SXVTYlgzRUlLYWsxRjRzUVV3eVF3dzQxb1d6TUxxKzRqUWp4TVY5VjRLTTg2?=
 =?utf-8?B?L0dHSUduZTdMUngwV0cySTFCRlpvcGRWR29NQUw5ZmhXamtXVmxxR1F6bVlV?=
 =?utf-8?B?YStYZHhOV1JLUzFuNlZLVUdGSW43RHlKeWQyUWhGdVcwZHR4Q2dobzZ3dGNM?=
 =?utf-8?B?TDJWMjd3T1UyM1lUbEEvdkJmS0M2Vk5MWnBMQXBrdWNaQ3JxeVNzSUdKam5n?=
 =?utf-8?B?Vit5bEZ4bDRNaStqVHIyYkpVN2p6c0ZkRStlQjQzcmJPUVFpNUx1T29sRWNa?=
 =?utf-8?B?b2h6cnluOE5aZklrcnRNclZPck42MVRYUXZjNERzR2hNV1dGeUJhbnpmb0hZ?=
 =?utf-8?B?Q0ZDNStBN1FvRXVkMHNWS0NITmxZYzQ4R3d2eXJQVEtNOWQzWitQamdsVzlM?=
 =?utf-8?B?aVQ1a08yUm9yRUVnWDZXQ2RPT2ppUFNJY0QzRUFEU0N6bHhKalA1L3llbWZs?=
 =?utf-8?B?dHIxK2JNQVlwSHJaUnJoWHFKcjg3L0txZ05zT294T21CUjFqaXNTMGdkOGZr?=
 =?utf-8?B?QU1ySjJCcG5hbHo5d21selNCVmFMdENWNmNTbDFaZy9ONlBoL1BoZkEybmx5?=
 =?utf-8?B?M3F6QUIzNVR2N3h1SEg4V1dSbzFmYnlkSEM2RGJocklVZngrZ1R5encvUGpO?=
 =?utf-8?B?Z3JBZEJDNlFxR0ljMHpTT1RkUCtjZUhVcHhJa1p2aUFDSWZoSUVMV2ZDYlFy?=
 =?utf-8?B?aFBmUVBISFJodjI0UnBQYjdHZmFQUi9FQndnakdmWXQ0cWxEVTVLTkdJL3E2?=
 =?utf-8?B?M3VzRitSQWVwV3N4WjU5aUpPd2Y2K3JSWUpDcjRZOVZ3Ym0zY1FSc3l6UnYz?=
 =?utf-8?B?bElOQitQUzhTR0Z6MjhhQjB0ZjRRYVdWWWh4SWlNYnJHajJzTklWRlhzMTgv?=
 =?utf-8?B?VTBLcHlpVUNkeG01ZjlDY1JhR2FsM084ZWVsUXJzTEt4ZkNrbTE1MzJGNjhR?=
 =?utf-8?B?MWNXa0FOcnVzV0oyM29nd0J6RXF6Zys3MWs4aHZtSUtZay9uOWlPNG1jdFNt?=
 =?utf-8?B?RFpMckZ4ZUdNRVB4OWJ2VEtJd3JnbDV1ei9nVWJrVkEwR2lEbHdxRkd5c0Fw?=
 =?utf-8?B?K2FVWVBZaFh0VWtMcDQ4M3J1K1U5SzVyZ0w4K3FPNm9NOVZ5U0NrOTRkVGhk?=
 =?utf-8?B?WnNKekJPcW8rL2RyQ1VQbG5CelZqWmFndTl3NmZGVlVUQWxvNlNLK1RiOUI2?=
 =?utf-8?B?S242RjdrSjlxbFlnWVpmc2ZONkVZNWFBMkhtUFkvaDdySXE5MlBDTXIxOGhj?=
 =?utf-8?B?dG5OTThCTHQzTThDaEJIVDJONFp0WDNPVE85T0hTdm5qT0VHZ0ZVamJweENn?=
 =?utf-8?B?OURndUR2emcwY1JRZEhWVU1yMkZrbW4vUkNTMG9lUmpYTDJPUnMvL1JVVStP?=
 =?utf-8?B?ODlHQmdTZm45YXd6T01YWDdWSHBzQnRBTUtOaDhlOGdkMFhMbEJGL3pxeTht?=
 =?utf-8?B?MHF2RW1NSm9xVFVEUWpiSG1HTW1uY0xCS3hRc1IydFhyUUZMa0JNSWl2VmFI?=
 =?utf-8?Q?WHwvLbkssjNTikFSz2oCx/NZz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fd8bc5-5f13-4692-c532-08dbecf04cc3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:21:42.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49iIznNNEpar8nNv5sf8ClQrb4Qjh/6ZLYahERc4ItkHss/ktmcYunEVqJIKLIDYtkAVqnudDhKMgyyK+kBRmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 24.11.2023 14:04, Michal Orzel wrote:
> On 17/11/2023 13:24, Oleksii Kurochko wrote:
>>
>>
>> <asm/softirq.h> is common between Arm, PPC and RISC-V so it is
>> moved to asm-generic.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



