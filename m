Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F813736C16
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551783.861493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaeS-0003oM-2v; Tue, 20 Jun 2023 12:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551783.861493; Tue, 20 Jun 2023 12:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaeR-0003l8-U4; Tue, 20 Jun 2023 12:40:03 +0000
Received: by outflank-mailman (input) for mailman id 551783;
 Tue, 20 Jun 2023 12:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBaeP-0003OP-Tx
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:40:01 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92345066-0f67-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 14:40:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7476.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 12:39:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:39:57 +0000
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
X-Inumbo-ID: 92345066-0f67-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQFCUYVvIKw0O3vaI1N4E9MzoG3UCnOKtZnZfqu/XY1LffX0hAwQKjTjv4NI/Repq99pu5zoaNbRJUvw5P5+iVzjJYH6nkDJITddPWnYskUqvwAi7/j87Ul+b/Q17fErsTQnexf6fnzLjoi+ok8LBc/arxBnDBuOMTI0lOWOa4t1IaVHjr6nCCsSp0GGXfOUKTFQ2C6X2Br+F5QMWBXolxxvJY7Z2FYJUtl4wL2ctC6xRjwpf56HL68J94KgF6rwDKcWBQn8nEuvQ2V56zZGYp0DDVUZ+b5Q11X3no73t3QGxsZXjmdTa3xjzeVfo/WhuP7l4bxukQf61Rue7J+vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AveoQ8cmZdJz2QeFEoXVf37UbdP2Go3jTrt1Zgj5rsI=;
 b=Qz3+KgstyfwWieEh3HVEkbFAZBCifZoDRkxpKkXvg6ROIk90/R1VeNzMh4MAWrx5EPUMRUmk8aQTxlj+hB2tMVMbZcPEtHudZ/xZwTCwVplNk1kZSaUMSA5cqUSVaiLeJKfScmjlrbn5X22l5c2YqrYoc6o6s13koLxBnQbk4PI2ocBKF9qGx7makMTIbtDSwYsjCpyAJEEA7TSkFUtkLBe5g5G8Q70SOeoNZDsv6SAuskii/penmjQJFct5nVhcyb6aW8HMuaAhDww+NKjLreMHMb4vFjAZG6rP4t88ILsFzlQ4bP13DtAfGnwli0BPimxXyP1ANLOpa87UEGp2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AveoQ8cmZdJz2QeFEoXVf37UbdP2Go3jTrt1Zgj5rsI=;
 b=xxSMC7+6VVRUYaylmV/HK+Jt9qpwhlj2tFoy7EaFV1srr04LdCWStwa/f65Yxer0umZ4SUdeqQcbnpDVk1HnfjRwRCNCYpl78a3iWFg5UHC7V8wTccl7tS02p332QNpC9sS9GzP/jjpq8WdZ023eMuODiTWUtosE/k0W/O5vzIKB7+5lzriAi8RmpR+1i3uJeye1HDCl4lPwTkCeyK+ejB40IG4NSxuhFcUF0rpkzjX8HBsH0IjjW3aB/6NgUv3ytGBZEw9Bbl1DkcUZ+KKBhc+wwVG0To+R5n64lazEMPc/EpbXQ9BpDI2TSFX7G//OZR3AnmUAU1Iv3FCTGr/P+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7cdd53c7-4d57-39f2-10fa-2fa2ddc98389@suse.com>
Date: Tue, 20 Jun 2023 14:39:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 02/13] AMD/IOMMU: fixed violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <21337a20c5c8d66dff552c2f09054ea82b253dd6.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21337a20c5c8d66dff552c2f09054ea82b253dd6.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 022dea53-21ff-4ca9-6c9f-08db718b749f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sKO7qnNCBCEdzY7vaZveSIBQi05NitZJTAQUzsPEQYteA0EZTn/6N9zQHQpwsV0Cs17pitKOsKxj1MlL1PghchZc8OcImvK46BffOLH6hAeyR9Tq31fe+47vWkXNjCY7s9X48O7TdnIdr7njd3QWFz8P+Bu+AYv7URsE9O9t5lBSCu664ptnx/B1/XeI7FQEBAPzsHs1IbM8Zv/ormPGhSgrxsk7y48AzpxY+CmWTHu4YfHMiB5KtAjpouT4tECNjS9WASNFmeM3+Y73uWBRGb9SJmVisImJoCVzlXb21reFYflq5HzJvPJtVbK9sWlFKZjxgj78bD0Wj+j9SpoGInlAOw4DmD5UToENbaJL5V8yBSFDzgfPdqi1A9iaaP9WuWcRHccFwYLTDOcaKCOe0fWgsg35YhHGjiHpiSIWhl0DvX/3friAtLt0DKJFmALTWFmH+JUiVAk842r0v6FZXLSddd1TioTrvd01m0VKULBvqLpR3k5XeP+fvAyZqBU8P5OADntdSo1yUYTNsVvgBawTH4WhY82mAG772u+OyPL7yzJnpvfIBuHNX7Z/7QWfJl1jVTc31v6zGkbzMth6kQ1Fld0gzgAfoIqf6oL34cD93mc0acEnWxooqzySwmicAoRJZkh7FLtimBpB4r5cLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(7416002)(66556008)(66476007)(66946007)(4326008)(41300700001)(316002)(54906003)(31686004)(8936002)(8676002)(2906002)(5660300002)(110136005)(478600001)(6486002)(6512007)(6506007)(186003)(53546011)(2616005)(26005)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0xFKzQyNG5jNVhaOS9vU25VUWhTTXFYV3FNK2pwTmtkN3NwK2tRRExjMUli?=
 =?utf-8?B?ZXRPZU5la0U0bithSXRUaFlOTEoyS0p3WUFBN3VXWVdVVnl6V2xEL0NFTDhK?=
 =?utf-8?B?VlNRVUVBald6WGQ3cmgrUzQrWWVRallUdlhqT1hITDlmNVZXUndoa1pkbzJn?=
 =?utf-8?B?THBvSDZlTndVM0h1VGVWRitaNFNFQllJWlk3OENjdStwZUtNNnJrcjZNYTZI?=
 =?utf-8?B?UTNIYkFBZ3V5VHA3L0ZkN0RMWlh2MDBWTVNXakpwTmxWNWNHSjFwY3RRZkxD?=
 =?utf-8?B?enMwRXR5bEF5SEFFQTJBSEZTSmhHY09tZTlQL0kvTWZiNWlqbzJBM01zam5x?=
 =?utf-8?B?bnBGZXFCVVpzVXQ1OVBwd3l4YmM2M2I4R0FHa1lEUStRbWxRSTNudFdFSmps?=
 =?utf-8?B?dWtDVkU1ZzA0RDYxWklaZklVQ25FbXVucytJem96UHk0aUFCVklnV285a3dJ?=
 =?utf-8?B?d1ROZDA1ZFRtOVBlZm92WmtQWXZWTk1uQVNQOFVWVXBobEU0RTRJOUxnSDVa?=
 =?utf-8?B?enpsWWFxakRBMHM0UndsbklpemRmVm1pcjQvYkIvQWZiWWw3VjVaTWZCREhO?=
 =?utf-8?B?NC9iS21FZFVxbmFPMDY3KzYwa2lkdHp6Y2hnTFZEd0p1TmY5Z01VRnZsQk9r?=
 =?utf-8?B?a2RiMk15dzZzU2RkdUh5MTFZWmFHRldDNVA3ZUswejZHNVFmSU5Nc2RuZXEz?=
 =?utf-8?B?UUc5VmJrZ3Y3V1czQitCc01kRERlUjI0U3gzOVE5OU1MWXBtRWZxVGlHUU9S?=
 =?utf-8?B?MnZMYTVXWm5rTUNsZngyQkYrSVpZWXlUODRLcDFONXVmSGgxVk9ZZGRsNDNv?=
 =?utf-8?B?Z3lvL291TGMzSVVmbGp4MDZOd05LY0tKVFVmTStOZjRYb3hBVjlmK2k4Smg3?=
 =?utf-8?B?djUxMVBXNHZFOVF4V21QdDNXZ3BsSlllNXB0TFFhblEvTC8xSFRmMVhRN01k?=
 =?utf-8?B?dlROay81SFZRYmNKUlZEZUc2WFlQTjh0WDhvejFrNElPaTZUWlhhWW1Dc2da?=
 =?utf-8?B?TEEwVjdqK0tWcnZxejVudWdMWmJDb0tzQ3Z2clE2TFg4SjExV3dpYkRiU2VO?=
 =?utf-8?B?WWtUWlJyRGthaHZuNTE0Zzl4emw4VkdYRkM3K2JmQ1R2cW9YWnRiOWNPSWpO?=
 =?utf-8?B?UXVnaElKZTJuSVRLblhlSFRaZVhYVjl1a2I5L3VwMXNQZzdHL2R1MTdFWWtF?=
 =?utf-8?B?N1JJbXRNNU9yRlVWcDljeG1FZklONHRKN096dkFGUzFoUFFoTjFrZTVlQnI0?=
 =?utf-8?B?aGlqSXRmSUUyM0dEUnpBRjVwMURiZUhLemhxck1FZGtTS0ZCeFQyTmsvakVi?=
 =?utf-8?B?R09VNGszK2Mxa0lYL0F3R2g3a1U2VFBnalRRcEozZlpoUkNtdlFPNGhGVjFK?=
 =?utf-8?B?bXVycUFya0d4MlE1VzgvQWxEbEJpYWJLbk1oa0lNcUtZK3kxRmdSekNORi80?=
 =?utf-8?B?d2xIT3VZTHRsUm9DME5zc3BPallvNDV3MUNrQ05VeERjTGtyYkY4bVh4dklE?=
 =?utf-8?B?aUZzOVMyNnVWWGhZbkYxc1JScFZyT0xFcUdad3MzTndBY3d5RC9vUWJFMlN6?=
 =?utf-8?B?eHBUMEpMemxRd3prZzcveVlUNXBHVHE2RkppUGdsVWVDYnRydjUwMEE4eDNi?=
 =?utf-8?B?cUdQa0J4STZKd0lsaUhMSXNOM25Cc2NxZXBNRkpUNHg3TjAwUEVnNTR1NW5U?=
 =?utf-8?B?REtuTDViREtaeE4xQkVpTXM2eGdyRHR0SGxpZGhaSENjNXRncFQ2dUVYRlda?=
 =?utf-8?B?elNaVmorMS81d2Rxa0o5MndNZEk0VE4rb20zSWlNcE1nbUlxaERLR1dKbVNm?=
 =?utf-8?B?Y2FIejZObXZxTWJOelZKS2R5QUgxRUtkR2FDcXFQTHBBbUR3TnBaOTBrQlRw?=
 =?utf-8?B?Z3lNL1dCRGoydDNmWVl5dE9UdTFhZXRuc28wK0JXbTNYQjV2OXFna2srUlY5?=
 =?utf-8?B?QnZMcWVoa0NZRStTekRWNkNXL05uM3J0MFlMbG1JbzVXcWthc2Zydk14Wm0x?=
 =?utf-8?B?cnlnZlV5NWpoZ0gyNVYzMElpL3c3bGNHKzd6QlNNWHpWNGlkelZsZWJSaDdn?=
 =?utf-8?B?YWJBWkQ0Nmd3VzJ0V0FWb29BR3FJTTV2b0U3WlNzSFFQelZrajMvWEEvYS8w?=
 =?utf-8?Q?GzvFPOBL0DclGHexGpoLId/h1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022dea53-21ff-4ca9-6c9f-08db718b749f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:39:57.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6frCG+4DrXz74kKWs4Wflfe0mAgCOgPg4/GxRlvfFcMbgrAsPoZzk4mYqLYOK24HMDgflsQYTIN8NYv/3vX6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7476

On 20.06.2023 12:34, Simone Ballarin wrote:
> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> @@ -38,49 +38,49 @@
>          ((uint64_t)(offset) << (12 + (PTE_PER_TABLE_SHIFT * ((level) - 1))))
>  
>  /* IOMMU Capability */
> -#define PCI_CAP_ID_MASK		0x000000FF
> +#define PCI_CAP_ID_MASK		0x000000FFU

Seeing this and similar uses further down, I think there's a purely
stylistic question to be resolved first (and hence I'm widening the To:
list here): Do we want to allow either case of U to be used
interchangeably, leaving the choice up to the patch author?

Personally at least for hex numbers I'd prefer the suffix to stand out: If
the digits use upper case, have the suffix be lower case and vice versa.
(If there are only numbers, then surrounding context would need
consulting.) I realize though that this will not fit well with the desire
of avoiding lower-case l in number suffixes; it would be fine for e.g.
0xFFul. Not sure in how many cases this would matter though, as I expect
most constants want to be unsigned.

Jan

