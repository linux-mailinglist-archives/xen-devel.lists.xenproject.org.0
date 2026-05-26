Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI6+NrIyFmqQiwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 01:54:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262AC5DDB53
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 01:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320258.1587622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS1aL-0007HI-VD; Tue, 26 May 2026 23:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320258.1587622; Tue, 26 May 2026 23:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS1aL-0007FF-SO; Tue, 26 May 2026 23:53:21 +0000
Received: by outflank-mailman (input) for mailman id 1320258;
 Tue, 26 May 2026 23:53:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wS1aK-0007F9-GW
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:53:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wS1aJ-00AycF-7T
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 01:53:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1631bd-bab6-0a2a0a5309dd-0a2a4504a44c-32
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 01:53:18 +0200
Received: from [40.107.200.0]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a16326d-1dec-0a2a45040019-286bc8004625-4
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 01:53:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7938.namprd03.prod.outlook.com (2603:10b6:303:270::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 23:53:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 23:53:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqC/X1elYeeZm9ngZJ/X3EGuBJAmGDtEElEdVsBPWunspEzWl2uCzxewWIAcVtPZGuVw3P6Ry232DcjLZppyLBRGpwh+AunusInMhLHSJYvGpDnLXpa5/PjYjc2ANPxwnEOeXIYcSe3QlfXZTqPPd//gZGtIeL+qExltqXfQ2sfWE2wZGkm5BJfBYCjRdyBblhAnZJ/Qc6R9YBXUm7T7ya4jvGwawlIXCXb344GqOCqAkmgnrNruWB5CalYfdz3ENQvDlqNZJUfz9tKjG2cB3rYH9IZ1O8b8I+UxLoB2zJaeu0LmJVyqcw/KYJzaDO3sljqrg+/4tEiucAcvy/KlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeFPOzSCLTSb8RYwHS0yM7PrkLfSVqDALvWaeYKBYBk=;
 b=RXyxjOMr1YsIkFTWEgzfHvOubRrqI7ZzM/NSQBX79++qzeyZLJ9UG8qxZscftWEE2Tk9EGcHnyE6RNGiYzLsVUJHjH5Iu8epFQ1ZFPnnyszCoX7sCZXC87l9ynTipf1uTLISHmX+wmUZlzUd1NxZug/87JolqBITOx/l/kWCLdKWymJriAY9YZMSCdkmeDf1KeSoAVvZ+UzemADGSPf5l2q5E3lQ9CmUcPLw6coJKZJN4n/7THhSYiwxtopnpqiG5W6HtWmJ1Gw3Ob4N9iZCgIR5xd4APbknxdIVkUZl29m8W1fYu4v+gGgcmA7rwGO5rhEf8Y+xSON5v0T+iXRBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeFPOzSCLTSb8RYwHS0yM7PrkLfSVqDALvWaeYKBYBk=;
 b=MYmTZEvpzHBw6SO2gGPhi8yQssgWVXHHfeh1uFrdidOXpVntMFaEQTrUylwpYSWqV69VHewX+anPxdh3JKpp6j1E0Xap20JextWErB4vbAR8QlNhOCqCydykuvTas/2xeAE+0UFcsozDD+TB+qaXHoYN7PQ6XEvqTtOylndCaTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3bc09469-8613-4719-aac9-3803e4f858f7@citrix.com>
Date: Wed, 27 May 2026 00:53:10 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] coverage: place GCOV-generated .text.* sections in Xen
 text
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 73511ab3-304c-4c9b-34ec-08debb81f372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|18002099003|22082099003|3023799007|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/7NtmbfrDFDTJ3o0ImSozp+JRzoMuF/qlKjJWlLt+QHSJXi6xhb92Nyjom1gUZ1JEmJD3XA9A9g1Ivn3Y+b8sxBzNV/sv3TpxChPoKSU1PdnDoOxqS+ks3DBrDnZy5oFQ2/wDZWhWnpt7B5P0cXrmxABPNq61a4iQcpQfm4WZQZA4ZuBGBhgejxu62A1eU3TWyV1+Ie+6G8+anEeww53qSgo+tyUR64MK9qlHKYbi4XaMFPCahCDHCfwB3+7PFoG8wvcI0+IzEjaJp+ri25Nx3957JvlWcZYG4M17WC2OO1AU9BTgqLdd+1TbguVqNnLY7jJaxVTxF6VlE1o93UdL102RhkFuImttN7atj+8n54V2R33KuEj75Nc0+TCxfW7r01NvGzwsWwU4bRuVF/C1NescF9N8MYnAjtjc6MnbeG13rHwL+a4I4/vA69+f/2YDKITmkgezaCupBk7i/FgP+rROjtNATPgkKGIXamNEyKZZcpF5Hqw+1hWHQVqIAt+6frJizOrX/U3BNpo2o5IWv3kAk0YlMJ4eB725sVP2BvFsW6j++eh2yjXRDu1t8LDm5E8R21C5agKjXAYtlPq11JQ8zuiR0yvS1imq3WnafamAuFRZYzwzezQ1Q6at87D1Tl8xHMevatenGuHS0nL0aDqrk9ULz4wVEHojQ6yqFJ1rf+ysUSaynA3rd4VzdqL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3NiRWw3M0R4RTRlekR5Y2E0WERaYVExa20xT25KV0R5MjQzcVFTQ1JQdUln?=
 =?utf-8?B?VHpPTXYvRElEQ1l5alQyclFJUUN1ci8zay9qMyswdDFUMEsreXRZQitsa1p2?=
 =?utf-8?B?QmJyeERIbVlaanY2SDdJcHFZdWgyZXFWTFFRaTZDYi90bzU5c2pMNjdMVE1m?=
 =?utf-8?B?MkE4S01WZzBYUUU5cWdJV25KUDNuZTBpM3Zkb3VLd2dtNU9nRE9KWWFOYVly?=
 =?utf-8?B?Z08vSGpuSU1wYlh6TjVXRFdQVUFKRjZpNkx6KzR5QWpONlc4TG5OcmhWRnRC?=
 =?utf-8?B?akhrNmFUcFVyUFFqMmxFVWFQTGVKTUJiSnBCSXFsRGFmdFZxRnFVWm9oYi91?=
 =?utf-8?B?aFRHWG5xbXRGY0VobHZtS2cxeDhSZlQvRFRTY0lGYzdYZHBYV0p4bU9LOVg4?=
 =?utf-8?B?UkxCU0FuMjBwZVdkZnZxNWI1b293cGFVTmJXMjYzWDVsZ1BCaklTcEYvYy9S?=
 =?utf-8?B?M3YvTHhPeEN4c1dNMVFDN1BoWGVLRzZGVmg3UjFjaEx5ZEFSZy96VnE2a0U5?=
 =?utf-8?B?bThXZUtrSmRpZUk2eGptdGJRaGlqdEtSRjQyNzlZNEN5dEVPZEFPdExtTzJQ?=
 =?utf-8?B?RDlKRjBqdHhYWkRycEJaYzJnQjhhUVdjazZhNkNzUFZ2SGxsMDk1aHFyUTFk?=
 =?utf-8?B?YzRrL0ZjK1ZjYVRaRUF2dzZSRm9iOFlMZUdrdmxuTVlFOGtGU0VIdVFCSW9U?=
 =?utf-8?B?UUNsdmlNK3lFdGpSZzU5RXFZeURiTmV3M3pFalV0VnZOeDBjcDZHSUkwcHB5?=
 =?utf-8?B?bTVULzdsSGRoNGZMdHpGanR5UG44bkgyNDBUeEt0cDM0UGMxQ2RIdFJHS2ZL?=
 =?utf-8?B?SE1penJTMmJ0MHBJMTFBS2VXUVlEM2wrdlR6ODdob2FmRktKUUlNdkx4U3h5?=
 =?utf-8?B?ekljTTZWeVFEQ3Yvck5zQ3JPZ1dpby9mRUdtK3VyT3dqOWF4cXZyeFlMOS8r?=
 =?utf-8?B?RkFhVWp2RGJnNEVtK1BrQXFsaGJGeEpzb1l4VmpFQlNBb2NUcTJGV0V1cnp0?=
 =?utf-8?B?c0lzc2NyVExtdjZKa0JJSkxzbDZUbS9NODJjOVk2d3dUOE9oY014b2dycjAw?=
 =?utf-8?B?RU1KWG80d1ByeTVkVXhPTmdyZnFxSzdTbmFldUdSQW5FbFZxalA2eEZJb1pX?=
 =?utf-8?B?bHBldVNVSUVHdVMwTFBOWVFScW42SitFRHRPUWhtMjBzNkhwM2JpclR0SzR1?=
 =?utf-8?B?YlZwLzhubjAxV1pmWlhqTFNhaUx4ZlRnZk95YS9RUkNNeFRFMCtJQ3NVZTBW?=
 =?utf-8?B?RnE2T1JtV3NNUStrWlpDL3BFTlhyT2crQmxCTUJoMzlJTFE4VHN2Tm9NRGNH?=
 =?utf-8?B?VXlhTTd0c1MzZmhQaGRBRk1adTljY2lUYWl4Wm9vSyswRVg1ZFVBcDVFeVZ2?=
 =?utf-8?B?OUtRT0ZvemhBUEZrQkxub25STU1SeXFIaXZaN3FCNVlFQkdRMXF5MEowRTdv?=
 =?utf-8?B?ME4yTDdVNUtmTTRMUEE5d29YdVBQY1NZdzNUc1g5eE5lclkvcjd6TVp4STJl?=
 =?utf-8?B?VGVWc2lXblJNU3U5emVWQkdXVVVHT1gvVlBNWWtmWFVlNTllOWdvQi8xNzdT?=
 =?utf-8?B?NDBQOHBUYTJ5TjN2WHBFYmFiVW1ObVRUQTljR1VKazVmWHhPUDByQmFqNEdK?=
 =?utf-8?B?YjJNY29pTDRYTHdUdWRsdmhQZDcvZWFIenpDWkxHc3E1enc1VlBsOHQ0UHdH?=
 =?utf-8?B?WnY5QUFSTlN5ZEJkZnZ3eDhKVVAwYVJNY2RqZHhHWUkrUHlTQVU2L1Z0ZnR4?=
 =?utf-8?B?RkxucUJVbzJFYklTRUljV3lkSVRLcHZHbUkrTGVvbjhodmpTeVVrRmU2Y0dW?=
 =?utf-8?B?TVcvZjM0RWw0d1oxdnhtVjRIRmxQa3lZenJsZm8rOVVVNEl1bWpPMGJucklU?=
 =?utf-8?B?YWFOc2c4c2hSR29xT2FLSUlvRDJWYW1PazY0L0hMY01SQ21lTHN2RWlUc1pa?=
 =?utf-8?B?SVpSVFFYaXhJVTdNTUJnZnlhbkw1dDJ6UHgzUCtnQjNrU0w2bzR0QlRTMjdE?=
 =?utf-8?B?dHgxclJHZDNYZ1FzQU5RVXp6QUlUc0ljUnMrTnJpNHNmN29OZVQ4eWRXY2gw?=
 =?utf-8?B?UnB6UnBNOXBhc29IMHJ0blRadU1pYmRnRW45VlU5WkVjQnZTNTMwUjRjY2FQ?=
 =?utf-8?B?Q1NWTlJ1SktTbFc4NHJ5Y21idnlhNWUvNnUxZjJtVUo1Z21nNDhSNi9pbkVv?=
 =?utf-8?B?V0J2aUhURmtkUHlPTVVLNWdmc0g0NnMzWG9KTEl2MlU5R3Q2ajl2K1V2NWpZ?=
 =?utf-8?B?N096ZzBwTHlKWUtNbUg5YnJ6bGsyV2M5Sm9WZGVZamlPUjZhaEtNUGRnNkkx?=
 =?utf-8?B?R1hMcFFYdTh4aVZNZVZLR1NzWnJxdkRzWnZPTUJHWXdZb2crVHF6VWVhbmlK?=
 =?utf-8?Q?v9XJW57dVMULy6pI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73511ab3-304c-4c9b-34ec-08debb81f372
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:53:14.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE3I3ihsx1aNZc4diEFn/Q5s9CKSzS7nff+rtSUmxgpxNjX2Tg+lRedwwLmUNiX1M48NQIM10IdSQmSd+Yx2GDAE5YIw8Nsigjp+1hGsYPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7938
X-purgate-ID: tlsNG-ebf023/1779839598-293773FF-4A5855DE/0/0
X-purgate-type: clean
X-purgate-size: 4652
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,raptorengineering.com,wdc.com,gmail.com,suse.com,vates.tech];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 262AC5DDB53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 10:07 pm, Dmytro Prokopchuk1 wrote:
> GCOV instrumentation can emit executable input sections such as
> .text.startup and .text.exit when CONFIG_COVERAGE is enabled.
> At present the Xen linker scripts only collect .text.* into the
> main text output section when CONFIG_CC_SPLIT_SECTIONS is enabled.
>
> With CONFIG_COVERAGE=y and CONFIG_CC_SPLIT_SECTIONS=n, these executable
> sections may be placed as linker orphans outside the expected Xen text
> region. Constructors generated by coverage instrumentation can then point
> at code outside the normal RX text mapping, leading to early boot crashes
> from init_constructors():
>
>     (XEN) [   12.331193] Instruction Abort Trap. Syndrome=0xf
>     (XEN) [   12.334253] Walking Hypervisor VA 0xa00003ce000 on CPU0 via TTBR 0x000000004352d000
>     (XEN) [   12.338550] 0TH[0x014] = 0x4352cf7f
>     (XEN) [   12.341823] 1ST[0x000] = 0x4352bf7f
>     (XEN) [   12.345124] 2ND[0x001] = 0x40000043527f7f
>     (XEN) [   12.347329] 3RD[0x1ce] = 0x400000433cef7f
>     (XEN) [   12.351233] CPU0: Unexpected Trap: Instruction Abort
>     (XEN) [   12.357643] ----[ Xen-4.21.1  arm64  debug=n gcov=y  Not tainted ]----
>     (XEN) [   12.360243] CPU:    0
>     (XEN) [   12.364098] PC:     00000a00003ce000 00000a00003ce000
>     (XEN) [   12.375835] LR:     00000a00004802f8
>     (XEN) [   12.378273] SP:     00000a00004c7e10
>     (XEN) [   12.380492] CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
>     (XEN) [   12.382785]      X0: 00000a00003ce000  X1: 0000000000000000  X2: 00000a0000410fa0
>     (XEN) [   12.385176]      X3: 0000000000000000  X4: 0000000000000010  X5: 0000000000000001
>     (XEN) [   12.387555]      X6: 00000a00004e5f40  X7: 00000a00004e5f38  X8: 0000000000000000
>     (XEN) [   12.390027]      X9: 00000a00004e5f20 X10: 00000a00004e5f30 X11: 00000a00004e5f40
>     (XEN) [   12.392510]     X12: 00000a0000439748 X13: 00000a0000406938 X14: 000000000000062e
>     (XEN) [   12.394954]     X15: 00000a00004f3918 X16: 00000a00004c7bb5 X17: 00000000004c7bb5
>     (XEN) [   12.397293]     X18: 0000000000000030 X19: 000000000000001d X20: 00000000000000a9
>     (XEN) [   12.399803]     X21: 00000a00004c8008 X22: 00000a00003fa000 X23: 00000a00004e2000
>     (XEN) [   12.402392]     X24: 00000a00003f9390 X25: 00000a00003fa000 X26: 00000a00003f4ca8
>     (XEN) [   12.404798]     X27: 0000000000000002 X28: 00000a000057a9c0  FP: 00000000bedb6740
>     (XEN) [   12.407110]
>     (XEN) [   12.409442]   VTCR_EL2: 0000000080023558
>     (XEN) [   12.411291]  VTTBR_EL2: 00000000bffc4000
>     (XEN) [   12.412895]
>     (XEN) [   12.414204]  SCTLR_EL2: 0000000030cd183d
>     (XEN) [   12.415928]    HCR_EL2: 0000000000000039
>     (XEN) [   12.417642]  TTBR0_EL2: 000000004352d000
>     (XEN) [   12.419152]
>     (XEN) [   12.420327]    ESR_EL2: 000000008600000f
>     (XEN) [   12.422056]  HPFAR_EL2: 0000000000000000
>     (XEN) [   12.423809]    FAR_EL2: 00000a00003ce000
>     ...
>     (XEN) [   12.485355] Xen call trace:
>     (XEN) [   12.489080]    [<00000a00003ce000>] 00000a00003ce000 (PC)
>     (XEN) [   12.512076]    [<00000a00004802f8>] init_constructors+0x38/0x50 (LR)
>
> Observed failing symbol:
>     _sub_I_00100_0
> called from:
>     init_constructors()
> The issue can be diagnosed by enabling linker orphan diagnostics or
> generating a linker map:
>     LDFLAGS += "--orphan-handling=warn"
>     LDFLAGS += "-Map=xen.map"
> and then inspecting orphaned executable sections such as:
>     .text.startup
>
> Collect .text.* whenever either CONFIG_CC_SPLIT_SECTIONS or
> CONFIG_COVERAGE is enabled.
>
> Apply the same change for arm, x86, riscv and ppc.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

We already have --orphan-handling=warn.  We've talked about upgrading it
to =error several times because things like this keep on happening.

[edit] oh, we only have =warn on x86.  That explains why you didn't see
it on ARM.

The patch is perhaps ok at this juncture in 4.22, but see how x86
already suffers from the bug described by Linux's TEXT_SECTION to do
with matching .text.startup, and the absence of .text.startup in other
architectures means that the constructors (which should be going in
.init) are being orphaned and outside of init in all the other
architectures.

I think we need to borrow Linux's workaround for this issue (which
solves your orphaned section), and gather .text.startup properly in the
non-x86 architectures, then organise =error everywhere and let
randconfig loose on it.

~Andrew

