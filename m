Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D33460FA69
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 16:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431076.683591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo3sk-0003eL-0U; Thu, 27 Oct 2022 14:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431076.683591; Thu, 27 Oct 2022 14:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo3sj-0003cP-Tr; Thu, 27 Oct 2022 14:29:17 +0000
Received: by outflank-mailman (input) for mailman id 431076;
 Thu, 27 Oct 2022 14:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a7vm=24=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oo3sh-0003cF-PT
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 14:29:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac722c03-5603-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 16:28:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 14:29:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 14:29:08 +0000
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
X-Inumbo-ID: ac722c03-5603-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGKrn/G9fock1u8k06sqA2WtvBa/vwNueCuJqPoa+7paeBMD3HRLEKUOXXPIO9Da+11MgAiRZ2xNS1s7+eApxLdv8Q744Ha+CQOHGueOIVxeHwjfe5CdvNh2uXQBkpBmb5vuZ0B0x/8Z870Gnsk1nlQKY8tVHY27o3BiVxgBe8qTVx4Cs5jDDIfOIepc4XlEcrAPieazbWXFAh1kxRKtxWMrC6QeyrIBk6qhStnwLJApA6pcfkMloq3/DKITmZi0cf+p+gzhIx30PfIrMrjeJ93lY7mpZA9OFAHA8FV/7wlpzN02rufDwdgWAAz6/YVt6/cfA+tNO1t+iGXbZEM1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25kprHdriuNril/eVKR4vAB0OGMSnilqE15qTFK8Gio=;
 b=HNA0/StC3ZfaJ6NrMTfP0ZNn1XW+NPOgUoqfGWGQolvxBaQwHxQlWAUamYsU8cYhSFt4NzFYr4sUUPwHBxZgimUQ8z3o70+L3hCyNM1TsQGzXT7SJvV4pACIyNclWuaHde3rGREXJe2b+1FhdC0T1B/tsCNWSRFoz6O8X6crI/wpg6Pc9LGuKBZ3tOL4QXyRWQYXCk4A1RR1hjPNq4h/FQhWtpNL8Z2jHLPaVNLM/HeVHcn3waPzkvBa4wKVm3D1Xj+Dag5Pb4zU+UkO14CY8pVfMo4Cd7SXqZNCEnMalXHbcZmXRwHLzJnGG4UcqzRrAljldX2Hb8aDv9WHSERv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25kprHdriuNril/eVKR4vAB0OGMSnilqE15qTFK8Gio=;
 b=XNHCe0OsFVt9vXdwsi2LwpCp1Zn62TbEFKwMLlQF8tsNqwDgFmfFRV8T8jN9j379yUbErPNRDH2AZQLUG+0lrLH6LRKg1GVQNx8KtWGYwQGfierAgbJBaqNowGVaNi6MKpjouEHRJRu0ARvqOi3e3gsF4eWKXITVnjcHXg9UErCndXuwVha58GD5cMCCuO+WcC34N7ZOM4q9shiGkqFIoFxTMuExFhExVnLHph4qt1fyWpsPfOH0uE+SJalsX4ZKrRK9D/OyXKoDq4SqpWSoFQrcZFQSsKEXWuUa6ZyEgA9BKpC8a+hfKH8sGUCi8T4bFO45nma0gDmuAb/yvgX5uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b8eb76c-2ec3-c297-b2af-7fe0521d6e61@suse.com>
Date: Thu, 27 Oct 2022 16:29:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v3 1/2] pci: do not disable memory decoding for
 devices
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221027132315.80592-1-roger.pau@citrix.com>
 <20221027132315.80592-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221027132315.80592-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0410.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: d49f3eb1-1074-4baf-6b96-08dab8279bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wGC3WWoyxld81Wbm3OZrgOhKO/EAKwLRbQZhfw1H5UDPA1gZWE/gvCOlJTh4gCK8QSWDwANgAW37EgVNh2nr/LQ9zjeSt5hLK4oJu42AbRIM0T1MZlkXJXDP+sN0enxCggqBQnxA/DCqodg4aSPR7+NsDJdMAtqtSzOiVAnSXlMFCX7QuUhxZwx9FPFQMNvBedtQooSCJYEHkrau9UCBxzptHJkCjxY3VFWHPCRc8NnBMrLzm9Zp66eo/o3IDmkU76DRM/HVYcAdfxsVjQSss5KTocDTcjkLn6fvd9C4Jem4rbTUCw+GeIrpQghiBYpWeJRpbzgdn5LfO1k2HcA+ud8n1zR7aoRBh1XSTqJG/ABnlNJKYzZep39p5ltDGLJAlbvhCbXOzRc9qgv14y294CaomOUnLKMR9npLVgTENnWhTK13Mr/qZ8zut6fZqWR2maAgMidAuhQziDloMr8uiLX/FC7KKIDXyZiHZtAaxxfWUOHZfm63N4VzEPBGIKDGt52OlhOqMGmNIXY0/wZlfRc+DJabixNx5icPPkbFjqFL08ma5G91j3G3Q6Z+S+RjOEgch6rwSQYSVS4QmOZdL6nHFD2kMGOhR0JT9RySAjA0b48UbOUo86mInSG7MfMMYlLSiSlo9aRwwuDs6khPCL4ZRY9lZQUDfAtVEEY0+3GRFu6BdpiRNPYQra0oWjTiKzGvSmNcfmed4X9V0AcKGB4Fi6ZC/qOTa1TAxkEhqnBE8fcWeYa7xx5XFzIgCsvDUply72E95rHILn00IwGJai+3hIcj5CgsK8HV4hk0RJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(5660300002)(86362001)(36756003)(31696002)(31686004)(38100700002)(2906002)(8936002)(83380400001)(6666004)(186003)(6506007)(2616005)(26005)(6512007)(478600001)(66556008)(6916009)(316002)(53546011)(41300700001)(8676002)(66946007)(6486002)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dll2QlJVUC9RUnBFUlNKaDF4M05WUC9zVTgzY3Btc0J2SCtsSSt0L1B1d01I?=
 =?utf-8?B?NUVwSHhFVExDbU85bEtwQmliSzdIMGNTMm5FOVV3dkxwM2VnaGx6WXZPOGZL?=
 =?utf-8?B?RUs1aVNQOHB2eVM0cDN0MHg5YzQwOG94SzlGMCtQWnlVaXBJKytjcEVSajJK?=
 =?utf-8?B?NzJlNWdubU9BTVh2Z2YxV3ErOWVacUtCcXVYN1ZSeCtlRlhXRitrVmcxb2tu?=
 =?utf-8?B?UDNrRVBrUVpYRFM1b1pReDRlbUwrTkU5eDRhYnh4VEFPS0EwY2cvcmNxNEp6?=
 =?utf-8?B?ZzZVYkJvclBTSll3cklRWDFuczg5Qy9LeW11MmZWTmtPQWVFL3JLakdhTFVB?=
 =?utf-8?B?NXZBSUdCYlNNWW5XdkpZT2tsWXduM29sa3lqNmpkeGQwMTJ0QUYvTldmQmZs?=
 =?utf-8?B?Z3VSUGtLMlA1M0gzZVdJUE5xT2swcG0xWVF1dElGNUxLOVpHVzkzenZxTW44?=
 =?utf-8?B?ZldxRXYrZ280WTZLMG5ocXI5bUFLeVdFeUl3TGliZ0RNK2lsTUJYazFCS2l3?=
 =?utf-8?B?Tkd5T1E1NEJoMHRXZVRPb3I1SThkc2VYQmVVakVFdGhaUEczSmdWb0pPLzVM?=
 =?utf-8?B?dXlNNTl3TUM4K28vQ2lQWUY0WElYL3N6QkI1cXdvMmppMzVYeURqeXk3ekIr?=
 =?utf-8?B?WndLSU9JQkoxTGVBdFRWQmdpR1ZsajVXQy84dmlqQ3Q5MVU0VVhIdUJHV2Jy?=
 =?utf-8?B?Nk5QTitOWFBlbVBZS1FWTEZMVTQzNDJLRzNJRHZhUFZrQ1JTWTcybFBvc0NS?=
 =?utf-8?B?VFBPSXJkVmNPMEFjVnR0YUNNbzk0Z0hJa3NoRzVXc1pOc0NJY2o0WHlXN3Fj?=
 =?utf-8?B?K1BpTjExNFcvYUs4YkpHUUNaVExuc1N5ai8vRGluMiszMDhzNXorZ1FzOVZT?=
 =?utf-8?B?dEF3anVMVEFDUm9Za3lKZEpTQ2daSERPVTZlL3pjdEtRRmVMcE51WkR3RTFI?=
 =?utf-8?B?Zmk4STVEQVR6dlNOazVEOEpMREFlY0JWVS90TUxZY1ZFeVkxaEx2T1UwaWVk?=
 =?utf-8?B?bVBEUXRXYkNOVGk1Zk9CWlpsQmlqUkdiRWF6Z3NsdmpsUEJWUTVid0wxaDBo?=
 =?utf-8?B?K09ZZ01HZGUybzlDZ1NLcUJGdmZXSDBUZ2Q5azVYYW9BeVg4ZGxCc01hbzdV?=
 =?utf-8?B?RkhiMmJFV1N0WDdjdndTaHBobU5vZW1ZSjFXVzZDeGxFOGVBdlBYa21yLzdI?=
 =?utf-8?B?Z0wra1NId3RQVGtLSktKc2VsUENhWmMyZlp4TEkxK0R5aThCaUNNeHpuSkho?=
 =?utf-8?B?cVduNnQ3N08va1E4TzVNNk5BVHB6OVJKNkN3dWg0K0haMFlSZytzQWFScEYw?=
 =?utf-8?B?ZmdqM3p3dXZYRE9pR0tlZjQ3ZHNlQVVGOW1VQWhpbnVleExZYVJ3Y3QvQXFR?=
 =?utf-8?B?WXM0ZVNiMmFXa25DbUgvbmZNclkwMlZxRHlndnFZVXZpQlZvRFlreVp3YnBx?=
 =?utf-8?B?VWlHR2NGV21aODcwNUVhbUhOSldWb20zSmpsSEpQOVdUdFZjaGk5Z0ZtczBw?=
 =?utf-8?B?dkNpb2dSc1F1M2dWMTlwRWNWWjErU0ZsSEs4MEY1UzVwK2g4eTJNSitIOWgr?=
 =?utf-8?B?ZXhISit3TFhnU05TdTRCY3RZMHV6d0lRR3RWZlV0NW16L1g4SVdZVlBqajlU?=
 =?utf-8?B?R1RmT3NXY2JobUgxcEJZTGJ6a3ZBOXlCc0pwQWtnL2JzSHp5eW9kajJ4cTFy?=
 =?utf-8?B?amlaY2IxUFBxUlNxY3pDUzlSZTdRSm94ZlBXekhCWjNtT1JrdC9CczlOY1NC?=
 =?utf-8?B?ZFJhMWlCbGFLWkVUVkgzWTZGekFUdkFoSEIxVXhYNzRIZnZDWkNlSTVSSUVj?=
 =?utf-8?B?Y2V2UkV3TDlGdWV1cmNHVytLS0JmTjBBM25DaVFCbzhhcEFQVGFBUHBISmta?=
 =?utf-8?B?WjVCbE16QUszalQxWjV5UmtaWjRNdlU1SjVRam5PL3pJUHV2dnF3bmpJVVVy?=
 =?utf-8?B?V2RZTG9UZXdlejNpZjBjZjYraTFSTWwyOHkxSDNJeWZiWStZd3NCNnhrdS81?=
 =?utf-8?B?UEZTYURHd1hSVGRTTzVFbFQzdTJKblNVOUVoR29KblpCWm5HaVBUYWl6cUF1?=
 =?utf-8?B?ZFQrV0loaFh0SW9HYk9uci8rQ1BzcVYweHRMNzcrT1AwWmYxOTRJTDVncnZT?=
 =?utf-8?Q?dyB45Ml1y06ogyzkHcGEkrhdz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49f3eb1-1074-4baf-6b96-08dab8279bd2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 14:29:08.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpkRM9i4fYRD1YAb+koJsHr76+M0xsW7yW1rx+zh9mI3cgCxOhjHqAn6hQ8TLbhf/0UVmof43P/plIU1qtL86w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

On 27.10.2022 15:23, Roger Pau Monne wrote:
> Commit 75cc460a1b added checks to ensure the position of the BARs from
> PCI devices don't overlap with regions defined on the memory map.
> When there's a collision memory decoding is left disabled for the
> device, assuming that dom0 will reposition the BAR if necessary and
> enable memory decoding.
> 
> While this would be the case for devices being used by dom0, devices
> being used by the firmware itself that have no driver would usually be
> left with memory decoding disabled by dom0 if that's the state dom0
> found them in, and thus firmware trying to make use of them will not
> function correctly.
> 
> The initial intent of 75cc460a1b was to prevent vPCI from creating
> MMIO mappings on the dom0 p2m over regions that would otherwise
> already have mappings established.  It's my view now that we likely
> went too far with 75cc460a1b, and Xen disabling memory decoding of
> devices (as buggy as they might be) is harmful, and reduces the set of
> hardware on which Xen works.
> 
> This commits reverts most of 75cc460a1b, and instead adds checks to
> vPCI in order to prevent misplaced BARs from being added to the
> hardware domain p2m.  Signaling on whether BARs are mapped is tracked
> in the vpci structure, so that misplaced BARs are not mapped, and thus
> Xen won't attempt to unmap them when memory decoding is disabled.
> 
> This restores the behavior of Xen for PV dom0 to the state it was
> previous to 75cc460a1b, while also introducing a more contained fix
> for the vPCI BAR mapping issues.
> 
> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


