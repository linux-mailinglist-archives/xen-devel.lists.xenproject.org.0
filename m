Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0417D832B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623805.972002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzqG-000131-Qa; Thu, 26 Oct 2023 12:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623805.972002; Thu, 26 Oct 2023 12:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzqG-00011L-Nw; Thu, 26 Oct 2023 12:52:04 +0000
Received: by outflank-mailman (input) for mailman id 623805;
 Thu, 26 Oct 2023 12:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvzqF-00011F-Dp
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:52:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7541fcaa-73fe-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 14:52:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9799.eurprd04.prod.outlook.com (2603:10a6:20b:650::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 26 Oct
 2023 12:51:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 12:51:59 +0000
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
X-Inumbo-ID: 7541fcaa-73fe-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsHO9iCJrmD8wfNiMPv4cD/vriqu9ZHWnxKEbcM1X6RCaVP5phJJlPd+vu7UdVjJ6SAtEpAhTvCLZpfQgVnIPPJx9ap3Zrq6HwWJXrdRQjR9j0LYlvBOAuPoKiXdXUPwW1oxzQRxgvk0nedRCIiUKvtJFU5eKmk5uY1fTJuJU9+gdhgF3LDStf03bRP5R5rrFm0TktxbGkRK8uHGStK0vFK2AAh/yxGt7mRrtXOZT0F+rfEH4NG/Kl8Kqg3wRU5Ju6ji7oZfs/QhrGvMlURnTRfvLLWghjvhv7sOljL7tYquGTufAw9/VQdhjtNkVCj6ow9ngufa1Q4f2x6hUXnmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXAMHMuCJERcxtt0Dm7d2ZZhd1RzhcRCfpNzWo3MrWE=;
 b=jZjym7LyMvRwLYt6LSpLwvK9rUDYbvS2joMUkO8zuKcdTTvHZsSaNqc0dmg0kycAyNtIthY2McbgR2vtSALrfe8apH3loLfZXnzPgbryQoaRdS3IQcGRqYtxLHn1IhxW3Yc+Qvoy74hR0ZkWfPIZvNYG4hQDPuZ9+xkJbrB20nq3P/F9AWVRpnpZ5HbpR7Rqpl6rtOUVjn9d0BjZa/F+0mCop2NZCyuBCQWP/pqURDSf5EvQhhu3xuY9q/hnu36fPLQex6ZsKChQlOZy+Cx4FKWZNzse6Mryrm9GNkGjBxAhnmIyMg7U2+fLA8c9s+aPTB26Rmoy0nX0vncWIEfTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXAMHMuCJERcxtt0Dm7d2ZZhd1RzhcRCfpNzWo3MrWE=;
 b=NzSOd3f3UtAupSau0mBjv991JGZRPesHzX4vrywrYn4qIt7jVh5YuFNCt+pHSlqEmOqYxcYqirCv1ZZhnvdfHJVV+pxRrBZ5hby4OAqVUorEVgIm8c1ZRluKiDr9nMdYPmxJn/0u6DFDvypz5mlv0pVftF9j91rc82yDMJEMVAkBehZ7kaxry+BwZjlfBySy2//nQIDSG6KySjIzS261iU2KEn+Cw6EFRc4IgRnU3Pf/89Z8GAOpABTwhwZc7QduNLj6SMNW2X7xjsQJhpJV+P5RGyAL3qZ9ir6+5TcgT3maWwNCZP+g2tZBGiOV595+gfO06/yOcTT4FbR/ejlsYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <683db2a3-3b7a-1ecf-a0c0-d2d739c0787e@suse.com>
Date: Thu, 26 Oct 2023 14:51:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/7] x86: don't allow Dom0 access to ELCR ports
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <118fa3e5-e1ac-ab3e-8b86-1ec751513434@suse.com> <ZTpHUzeBbDLe5Lin@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTpHUzeBbDLe5Lin@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 61963961-8d68-46fe-2db6-08dbd62257dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0IH1PnVixuVGJYPZ3TtM5lHbeS/1S8mn33iTj9GpS9n0wTfB+VaPw6Gm7iHH4C0MttlJPsiefUIsfAlMZxSoUbnuDwrHe4LPLqjxgx2M7yIgYQunxBqftcHya+aUUYP5cEcwgcbJV0sRGObLD3n43ypzj3i/XaKDsDJtLtGr2nkSgHozsDM91IulBMgOA08ZgSEjKMkRoG2BlVvotgrLWQOw4vtYZJ5nJQFvJuZ8UIaiBE1LOHGNQdYW4f0KLGNxuQGZGXfuLp4y8gpAHEkUErPKjJswo2Z5BmbC7eckcKEM2BxeeXm8/lykEzoSrpaVoayvW/VYoBAHLBgZsWJjrTnAJKcMaHpNAeX2QIst/jDqP3VcTPsy0KloHbfKH+icLQyuL8EnqQiYDFa3QRa6sPwH9hDBve7VKSduoNWEJ0LZNMRq4BVosGCOgZh0DiiSO8HbH1S2TzQgCck7Q2c6ISYlSKN4rUr7F8zyoCHyCNSjinwfTXYktaRYCuXvJnqY4iZC5Q0+fREmi+jRGAxpraQEdRUzF1RqfFw1p6FEVblPYNOH0zlapR+Jhnal85bEEcpxsUQBSWBWX1vCiN0/qoA8qWYtnGxA1VVCpwrsSDAUl5EXd6tmxBC2G6oSzbsTJtH95w4t4fGnEUukilkV/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6666004)(6486002)(36756003)(478600001)(8676002)(66946007)(41300700001)(66476007)(54906003)(66556008)(316002)(31696002)(6916009)(38100700002)(8936002)(4326008)(2906002)(86362001)(5660300002)(6512007)(83380400001)(6506007)(26005)(2616005)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzdZZy9DUzV0ZmFOTmdFVWpmdFZCYVFYK0pVdndlV3FXdy9NQ0xwTFMranc0?=
 =?utf-8?B?VWFzSkgvYjRDVHZ5VkVJNGJpQW9DV2hFN1ZiZ3lHdFBlZC9kNVZZNGpJL0dW?=
 =?utf-8?B?cDVOczhuRlVoRU9tZlVPSHlwbXd6Y2VmbmVkb1U1SU1LWHAvUjFmUU1namxn?=
 =?utf-8?B?Z2VHUjhzQnZ6M2lIdW5zZ0lLZWFvcXF6bUNJNHBzUnF1UmMvQ0RaeFNkNGZX?=
 =?utf-8?B?dndRWFFURHlnQ1dMamYxeWs5WXV0bStiRW1YeG9aUm5oNEdocWFOcFJsRGtK?=
 =?utf-8?B?dWtPQXBMb2lGVFEwQnR4NldDUlRPbTBUMTcvYnNLZlBHcGxCQW5keTIweXNM?=
 =?utf-8?B?c3Zic1JiREdDMGpLQ0VOSnVXMlI4bzdzbjg2clJsR1B4YXBvUkRmTHhZN2JV?=
 =?utf-8?B?N3RYNXNodjlUdkRmVGNaK1FUblJvR3NFYWhxQllUVmpRc0wrTEFYUGRsNFFE?=
 =?utf-8?B?RndHTE1aMnZYdjBTMEdSb0RqVTkxdmVuNHlHb25mSFVCRVVlMUVXVmQyUXVp?=
 =?utf-8?B?ckg0ZFBqaTUzUUFoUFRxaDcxcWhuelZnVXV0UmJINUYwVW5maE1xdEhvSWNH?=
 =?utf-8?B?ZmM4czk1ZEdKZ1FKaFdwRnZDVVg2cGF6ZFdscitYS1JWUGVJYjRNVnp4a2t4?=
 =?utf-8?B?R29CbFdCYkxtUENUemJBd1pMVnQwWjhFZTlPSGxUcW5UZnRBR2Zod2hGSjN6?=
 =?utf-8?B?bVNGOWZIaG5oa3hWTkxpRkthamxxbzJJQXg2TnFTTG1EZFU0SVRmNWFET25N?=
 =?utf-8?B?enk5OWVNSW93TE1maEptMTc4OHZ1cHZzTVR1bVZ5amZ5WkRMc2RlNU4rZTNu?=
 =?utf-8?B?VEQzb0Fjc28zV2hPZGtBaklQYWhuQWNRNkR1L084ODBMTXd4UW44VG9TY2pC?=
 =?utf-8?B?QlFZcy9adUlsWHpNLzB0VTh6TDNvYzNSbWlJdjQ1QkU1NFhTR2dmckF5NVFO?=
 =?utf-8?B?OGx5WUZWTUd0K1dWNEtYYUR1eWo3OTR5SEVWR1M2N28zK3o3Q0pMUlVoUWVy?=
 =?utf-8?B?eHQvbEZiRVVwMTNhWlg3S1JKS0xPeEV5eVVIVk9RREZoampzTjBEazI2ZmMw?=
 =?utf-8?B?T3lFRzBEMGZLT2tUdjV3cVZHZzhTaUVTdDlYV3RHOHN0akhZd1hHTnRDcisv?=
 =?utf-8?B?TUUvNXZhcElLNnNudjNrL3R0QkxJUnorb2ZZekgydmU1bHFpSW5OV3Q1eGNp?=
 =?utf-8?B?Y1VXQUhGa29ad2tnT21vcDJyWHhhNzNFRXoxSUFRbGw2ek9hNzU1U01qbXRq?=
 =?utf-8?B?VFdmQk4xL09XOWFOUUt6NXhVN1BCS1hVWXk2K0t3WGV2MWtJbHNFTTlpVlhl?=
 =?utf-8?B?QVFlZVlMMzhKM04xb2lGZHZPTmhWOEIxbllqUzYzYTR3SVMrSk4rTUdwclIx?=
 =?utf-8?B?aHc1L1YrNzBWNWNTbXd0Zi9hWE5aRFVGczdBYVRYNmhBVU41S0ZHQzdsYlFO?=
 =?utf-8?B?akNmR2lnaUg4bkJzNkdhK0o4bEUwRDhrcEJscmRVclVZWjEzL2g0K2dZTzdS?=
 =?utf-8?B?dU5FVDZYTjgwQkovT0F5RlIwM2hUZi9uZ29LOEVEUjUrY3lXdXFpa3g0Z2JP?=
 =?utf-8?B?R1QrTXFzMXpCVzBURTRMRGZuU1BHbzFEa01FdGhuWkFVakZhcWxFUlRhQmdJ?=
 =?utf-8?B?ZVVQazEwVVplTUFjWno4TEc4a3FnVGJIUHRLcmJqMFczOG1leXRkK2pFcHJn?=
 =?utf-8?B?TmxaTG5DcUxlVmQ3aXBmVFE4NkNIVDJGeUx2N1B5TWEyMXRQdkJPRnlGenUv?=
 =?utf-8?B?N0lLeDdDelR2a096TGo2SkU1RXJKWHR2eE5PVytMeCtSWlFKenhzSG55MlF5?=
 =?utf-8?B?WXA3V25NK2F1NklqY0NJYlduanJuWWF0c0lMUEFCeHZ0OWNrWUxoa0paVzdV?=
 =?utf-8?B?QXJNM3oxWENWWjBFaDVLdzFyRHBrWG1qYzZpN2pTaGlyanc1QWZ1U0prTzUw?=
 =?utf-8?B?SldDaXIrMUdCSTMybGdGYlJvdXZwUklsOFJXbDZteko5eVpRUVpTYXY4VHJQ?=
 =?utf-8?B?VFZiK0pIY1NZWE13S3pXZ2JoNm9jbFdKNW93T2FrR1lvN1dnQUxZZk14anFi?=
 =?utf-8?B?UEQ5emgvL0poSmt3YVBZY3plSGtDUnVqTnZtcCtWaG9qWnFZWFBvYmhFNTd5?=
 =?utf-8?Q?Z3SiAcrgF2Ii4lEn2Ws8+GXsC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61963961-8d68-46fe-2db6-08dbd62257dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 12:51:59.6065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwXj9DdJ3GWBGmBcdRlxAGRJwp2UQF69So06BANsKFsXNPpPkPOmsmf8WgutsOY3krRE/zkS7oP1NC3CXp/DMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9799

On 26.10.2023 13:02, Roger Pau Monné wrote:
> On Thu, May 11, 2023 at 02:08:09PM +0200, Jan Beulich wrote:
>> Much like the other PIC ports, Dom0 has no business touching these. Even
>> our own uses are somewhat questionable, as the corresponding IO-APIC
>> code in Linux is enclosed in a CONFIG_EISA conditional; I don't think
>> there are any x86-64 EISA systems.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> RFC: For Linux'es (matching our) construct_default_ioirq_mptable() we
>>      may need to permit read access at least for PVH, if such default
>>      table construction is assumed to be sensible there in the first
>>      place (we assume ACPI and no PIC for PVH Dom0, after all).
> 
> Unless I'm confused, thise ports only control the triggering mode of
> the PICs, and hence a PVH dom0 should have no business with them, as
> not having a PIC in the first place.

It should have no business, but the code I'm referring to still reads
these ports.

>> RFC: Linux further has ACPI boot code accessing ELCR
>>      (acpi_pic_sci_set_trigger() and acpi_register_gsi_pic()), which we
>>      have no equivalent of.
> 
> If access to the port is denied, ~0 will be returned, and hence all
> IRQs will be assumed to be level.  Some bits reserved and must be 0
> will also be returned as 1.

As with any reserved bits, the party reading them would better ignore
their values (like we do).

>> Taken together, perhaps the hiding needs to be limited to PVH Dom0?
> 
> I very much doubt Xen will ever use the PIC unless forced on the
> command line, and we should likely remove such option and just
> mandate a working IO-APIC in order to run Xen.
> 
> My only doubt is whether some Linux code will get confused by poking
> at ELCR{1,2} and malfunction as a result of not being able to fetch a
> sane mask.

Over many years this code hasn't changed much, if at all. So simply
from it being okay right now this would hopefully be only a
theoretical concern.

> As a last resort, we could make the register RO?

If and when needed, perhaps.

Jan

