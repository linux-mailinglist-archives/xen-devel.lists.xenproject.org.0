Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5651ACA1269
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 19:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177064.1501481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQruk-0005M2-Bu; Wed, 03 Dec 2025 18:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177064.1501481; Wed, 03 Dec 2025 18:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQruk-0005JM-8E; Wed, 03 Dec 2025 18:49:22 +0000
Received: by outflank-mailman (input) for mailman id 1177064;
 Wed, 03 Dec 2025 18:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh3s=6J=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQrui-0005JG-Ux
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 18:49:20 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c380d05b-d078-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 19:49:15 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5034.namprd03.prod.outlook.com (2603:10b6:5:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 18:49:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 18:49:11 +0000
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
X-Inumbo-ID: c380d05b-d078-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZ6Ikd2GTz8ioAM0QAImi3cR6Of03OhQ9zAlfl9by0o5d39atP+YwDokvl+10vmqYKgaFJ4+wKUgawmtWnec32lZEsFFcvyi+0Fzyv+TLf/HfPlhfOL4sqCYnynNqnoZNqNVejmN6d2ErrOoF2J7gPHviAqAjXIYOc006eCZ2+xV4exwM6RCcsQmrTwO6Il2UUfOd8so8iAL6izil8UbDpGrxvHyp7pPiMDnUvUoeqvaq3Z3frxM8P5ft9QxEY0MyZYoRGxC5Du858wq5QDTxDDOucd1ykqfXlYo7brUn0QlAk07H86yekqZMVpHYDzTlyqEdVRePFZdoFeTp4G9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpUj48lRI1FbM4YrNv8sWLXbzKw3mYvzQFe0VxENfb4=;
 b=Vu+JVwZwU2R/FGnOEG8qzrwDKRH+2Ht7+qDyGsozEw5/N4mlbO7Bxw7F4I9PC7raLrD/UAQnx7Qu0O453LTJ4eskUuVsAzlrV42V2ydrorChOzpOKNUCaUk2qBVhTKDqhg7e8EDnpqSv4fE9vlNmKGNhnZYw9qArb+PcwCHURxovP7PBOroXC0qSxsR/mnIaGRUaZRn7DmC1YYQxcKh4I/n5YkWQhiSDxJMCiWjm5fFKv8JGNuhz55GK14/KESTpnVsBkcda3rnOAuFtSOdX2aQ7PC+faC6Qnc+z/jWGzzuZagCP2RNL9bVd2uZ8yUODXSvuA7bl319HC7T8YROZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpUj48lRI1FbM4YrNv8sWLXbzKw3mYvzQFe0VxENfb4=;
 b=oZJV1OSK23BrCXSSD+l4E00tCmYhH5IOfLEVABa/lBFp6fJFHEeWpyB1YeaG4kk34i9nLuOnj4BwyiEz4VvSX8L3ufFUZoBX9eEK3iKQSyOK95DCW98nz0v+E+0a/cYtxQ1LFcQ2In5KJ5e77X0PNorANaV67Uek8hEP436r9zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <875a6a6c-f81f-449e-bd57-7e720d07e8a2@citrix.com>
Date: Wed, 3 Dec 2025 18:49:07 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Hans van Kranenburg <hans@knorrie.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
 <f081cd84-a626-4b02-8c8b-6c0c0b723b84@xen.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f081cd84-a626-4b02-8c8b-6c0c0b723b84@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0240.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: b46a1ee4-c4a6-48f5-ba58-08de329ca600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXpPR2FVZ2pGQTZqak1QMHZucnlrNEpZakticno3VG44NmErVTAxQjlEcWlJ?=
 =?utf-8?B?dHVxY3JmSlo1dVh1Q0RzWnlsblhqVXY2aDBvc3RsTC9xS0dQeVhXRDdCcGlm?=
 =?utf-8?B?aU4xd1cydnIzUzUrazdZR29mclcxMWVGRWppc2dXeHVIdGxNOEQ0UTJKWlAy?=
 =?utf-8?B?MTBYQlVnazdQU2JVTnFQOHppVldMOUpNaE5uUHlTTitraVRpeE5wUjQxZmh3?=
 =?utf-8?B?Qm9GaWNMcHFLbEhGS1RTNWVEWkxuT25MYmNuUWthMHVDS1paWXJVQWFIdGpZ?=
 =?utf-8?B?WHhTUWRnanNybkxyZmo0cHd3QlJxajhEZ1EvTUdKa0wyYW5PWGFMck5yL1Aw?=
 =?utf-8?B?SFp0a2x2ZlN2enhuV0NNeU5ZZkw2K1J1WjVYSjNOYURQWkFUYWVGZDhOYzlF?=
 =?utf-8?B?V016eDNZZFVaYTlXdXAyV1hCR3I3OFJ3NmFvNHp5dGJldHZQb280V1M4Q1ZJ?=
 =?utf-8?B?NkV0Z0IzdnJOOGpBN3hGeXV6ZjNWSURTcUt6MzJtNkdYZFRFWU90VVBlRk4r?=
 =?utf-8?B?U0FsU0tCOWlpRE5ockRseDcyT2FmOUI4MGJsTThXSG1vUC92SXZtQlhjeHpF?=
 =?utf-8?B?S29jbFVjeWNLTlBkOWtyalBuNWkrV3RNTmo3cDJHYkNQelI3WUV6MEJKWFBy?=
 =?utf-8?B?ejBLSUFxeXRIWmFhd3k5NmpTMm51YlZxL0FqUXZUakdHbmNWVDEvUGZFZStE?=
 =?utf-8?B?ZFUvUDhLWUxIRFl1bXNwcmtFU2E4WGNxblppTkdtbkdRVHVBUWlBQ3F6VElV?=
 =?utf-8?B?MzZTNnNZVVZiOE5IWXNpMCsyK2JnWDY0a2swOXo2ZE81OFhlNGhwZXUzeEhv?=
 =?utf-8?B?WjkxMmo5M2dhUVlLVlFwVFEzSFlmalhBbTFEaHlKTTdhRXRwZEpCVTdWUzFa?=
 =?utf-8?B?dU9jYmM2NzVVZjRyT1IxUHdCd283MmJHNHB1azZ4enZBdzkxZVM1MEZJOS9j?=
 =?utf-8?B?aVhIQ0YvREJIdHJLQWRrU0lnRmdRK3F3anFxaDB5OW1pdzZEQ3NBZ2Irc2I1?=
 =?utf-8?B?WFhVREtmNmt0SXVvaTFOWVZ3QUZhSjdrYzBJTThXWVBoYitBNzIxTDFkMHA5?=
 =?utf-8?B?SlFTVlhqZGRoYWxGNG03OU5RNmF5Z1orTmFYKzh4a2h6UGFvNzhYZCtMN29O?=
 =?utf-8?B?a013VEN5R1dzMzZ1eHlBWEV2REw3R0lxOFZjRTJ5ZFhGWWtpWmNLanBWUHhD?=
 =?utf-8?B?VTNML0puOFBmZ0FWTDhtRml3a3hkRkxmbFozZWozOHhCRlQ5LzRQcGxpUWVB?=
 =?utf-8?B?dnplRjlKaU5NQ0VxYXE0MDRKTU1KYndVWVJmSmEzdkVtVGloL3BubS9JTmhF?=
 =?utf-8?B?WVhmN1hlVHRURTN4Y0twU3VSU1p6bHphRWZuVWg5eDdJdE53NnJ3eXpLQnh5?=
 =?utf-8?B?VHVDR2dmTzM2TGlTdVBlb3lON3JreEJGcDViVlBvYkVFUTJ1U2tlTjVBUG0r?=
 =?utf-8?B?K0hRTkRsbXZ2U05nK1BCbFBlQ2ptSVBYZVpmQ0MxSWtvZEFRRVRiMzI5bnUw?=
 =?utf-8?B?djVBNlYyK2lFQ1RXcG51VzNhNE9uZ0d4WjE0bHpBYTl4QTFiSUdZL2pDT2dr?=
 =?utf-8?B?ZGdyaDJlQ2pUOTVkcm1XSk9YYUFUTUlGZk01aWU2Yi8rM2lob0FrYnFXY044?=
 =?utf-8?B?WlhCOExBUWRhcmNpTzJZZFVXU2t4cnVNSzh5Ly9Zb2lvTEp5b3RSMWNoMVpi?=
 =?utf-8?B?ZldHM0kvRWZNaTBZYTlHNlBYSUwxMStURnNEYVlYYkFsbEtxcmxPTlBHcWlt?=
 =?utf-8?B?VnZTZzhvTVRkYmR5c25ZcVhQTThaSjlSOWtXdXoybkltSHZGNUNOUGNuSUtj?=
 =?utf-8?B?NjZlaVZkSTJkZmpUb2FwTHRHWXg0bmtKNmI4T3hxejhUWTVGckNMWmJLMUIz?=
 =?utf-8?B?RnN5OGNvT1A4YS9rZ3F0RkRoVFA2YkozYURRbmEweTVuNXN3a0N3b0hrNkRY?=
 =?utf-8?Q?6xF2ZmJ8/Tzs/UHgmb9cq9nn7JiQF549?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0pYbGxERGdLUlNqY1g3bXoyS04xRkVEVUVsNlpUb3g3OUZZTlM4eDVGemZW?=
 =?utf-8?B?MnZIMnN4MGlibnJTTkYrUEpka2RzZHYrUHhySjdwTWJnbEVEekNTTVRrVmpC?=
 =?utf-8?B?OTlkUnJYTjJwQTZQejd3UWJSeTh2WERtclptY2JJK010LzR2WUNJQXFUaHVU?=
 =?utf-8?B?NEtwVG9BMExtbXBSSXJUNDFuOWppOWs4NG9XbWltSElhTDh4MGlzMmp4VHl3?=
 =?utf-8?B?MXkvSXRBSExUN0RaRnlTUVQxcnc1YXVOUGdwUjc4UENxdThQN2tqRTFrNnE0?=
 =?utf-8?B?NFNzcVQ2dURjQjl1Y2hrT0RBN2l5c3JDZ3pBSS9oUFRNQmE5ZVBkQVNGcFg3?=
 =?utf-8?B?REJ2SEVsT3JlcUN4VzhEeHFWbU03MmtTOWwrbC9admVROE9oZWRKL1h2VTFv?=
 =?utf-8?B?MHdZU2RJd3JzM3hGRjdDd08vaTlNbmYxcHlqbkZCa21ZenBNSWJEOWQyN0kx?=
 =?utf-8?B?M24xNXNuczFkRnNkMGtVL0pwZUtqdXArTHBQY3g0STZvVGlJMU9hK1UvdDdK?=
 =?utf-8?B?eVNDWDNaVDNzUjMzQ1VWNERhNlNPZGZYWXB2SHJlWldJSWZ4NlBVcFZ5dWV5?=
 =?utf-8?B?Qms3NWFoakp2R0VpbXB4anc1ajFwczFsdktjaUFBa1NwYktuaU9tc0tpaFFj?=
 =?utf-8?B?QUtOYjNZdVlCYkNwdDBMdXZ5Uzc4ZnlKU0NnMnRMb0lTd2gzZmk5TGdqUjRK?=
 =?utf-8?B?QkxlUUZHb1FtNlhBODdISlVQWTBGbFZXMHdUd1R3UCszZjZqbmF5alhyRlBC?=
 =?utf-8?B?SnVPdCtVSXgrbG9mUGhlZjhMT2NvUjJmbllZUHp5U1pZZjJkMEdnd0NVclZW?=
 =?utf-8?B?bjY1dUhBbTVSZFZjc0hWeGVtUEtCYUNISmtKMUVZY3hBUVdGV0loMzdYSC81?=
 =?utf-8?B?aHN6Q1ZhaTkxd0RsMkhCeFBSU1FJVkNWVTJVNjRoMUIweStJVFR0M3NQb2pu?=
 =?utf-8?B?V2plRmZJK3RSUmxXSDRIdWQrM0RyUjVFRnduQkhxQlJnTkZ2SW5yODcyTFA3?=
 =?utf-8?B?ZXpQV2RhNkdWRkM3Tk5NbDlwYXJvd3dsNy95dXhvcEw0UUJZaHAxN1NYL0pE?=
 =?utf-8?B?WjQxMjNVN2s3YVR6UEdVSjU2MWh0UzI5MVhESlV2K3c3a21Id3YxRnlMUU53?=
 =?utf-8?B?R0RvZTQrY2YyTGVjdmsyRXRpUnE5UmZrRFhDQkZiRHkzY1ZOSVdITjZzSWw1?=
 =?utf-8?B?UXJjcWdiZ1hTQzMvQzduQnFoNmVjdmUwc1c3bGk5ZW4yT2xhWld6TG5oTEZE?=
 =?utf-8?B?d1RaV1pzbUhZNmxaQnllRW91V3M0b3VBZXpWenpGTEs3WW04K0paMVhvaWhB?=
 =?utf-8?B?dnkzeXVTalNmVU5mVkpYSFhsMisxdFJIQmFLZ1dMN0xNM21kUTl4SEN3TlYz?=
 =?utf-8?B?WFcvdk82V091d0E2enhsa1JkTkVWKzdXZkhhSENsNUlPNW1LeHA4Q2hPVkJG?=
 =?utf-8?B?dE1ZaE5MUklCemsyUTIzRE9tajZWT2Z0TTBvWkk1c1NsUVc2TytFdmhLQi9h?=
 =?utf-8?B?U1ZQUlF1WEcwbS80ZUphUFVTdFhSOUZ4U3Jwd2thTFp5ODVodnNsc2FYdU9Y?=
 =?utf-8?B?T2UwbmphY0FKZTF1RE96cEF1VnE2SXN4ZHl6YnIrSHA4ZzlKTEhMVW1jNXBC?=
 =?utf-8?B?Wk9mSzV3K2VFSVhwYWRoSUdzL3FCbC9PdG1LS2NuZlVDYzlGVyt2U0krT3lR?=
 =?utf-8?B?Y3kvdVc2TWRCREY5QzZ2UjgrUzZzczZnbG0yOElwZ0x0bW5TQ2I4dkc3c2Rh?=
 =?utf-8?B?bTZsNUVxYXZLOGZYTUdXNnVSbytLMEN6bkJMOHlCZ1dsUUo5Q3ZyVGt3a2dG?=
 =?utf-8?B?djlWM0V4SEsxTGQ2UVorTG1YRnp2aXZUTDdKUE44bVAyMEU5VFpvNE1pbHhs?=
 =?utf-8?B?WVVSUzJ3cldEc3lJd3dBVzcwSDlxNnlKOFVndW5sSjRkTTBhZHAzOHhwOEUx?=
 =?utf-8?B?WGZqTTNXbUpWZWprYUcveFh6MmovZ2hMM3BZaXBDamZZaVg3NUJWNTFEa1JT?=
 =?utf-8?B?ZHdOeE1LOCtJQUxVSzc0VHhhcGM5Ry94S1NGVHhJNkM3M2Z4dEYzS0kvdWZD?=
 =?utf-8?B?OHZKMVZFd05lakQ3MCsvVTNSbVkyWWNaeXpsRXRYbVc4bkoyV2hvQXNQNXdt?=
 =?utf-8?B?N3p4UkJpVW1rUjRRaGhvWlhuVmN5S2lsVG55dWw2ZUdTcHQxblVEN2ZGSExQ?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46a1ee4-c4a6-48f5-ba58-08de329ca600
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 18:49:11.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FGOsr+grLn9VeyF+FZK1u3rWVGwLRl8iOKqDZPZx73Ue6cgtHXxfDPh2/ItutoWyoI05mogcCZRZEJuvOzmyKdB9Hf83vvuKsfQACqO6EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5034

On 03/12/2025 6:23 pm, Julien Grall wrote:
> Hi Andrew,
>
> On 03/12/2025 17:16, Andrew Cooper wrote:
>> to keep it working, but there was apparently no use of ThumbEE
>> outside of demo
>> code, so simply drop it.
>
> I am in favor of dropping support for ThumbEE for guest. But I am not
> sure I understand this comment.

There's no production use of ThumbEE known to ARM.

> Are you saying there are no processors supporting ThumbEE where Xen
> would run? Asking because below, you are removing code to context
> switch the ThumbEE registers. But I don't see any code that would
> ensure the registers are trapping (i.e. HSTR.TEE is set). So wouldn't
> this result to a cross-VM leak on those processors?
>
> If we really don't want to support CPU where ThumbEE is available,
> then we should check that "cpu_has_thumbee" is 0.

The registers exist in ARM v7 only.  They do not exist in ARM v8.

I suppose yes this change would result in a cross-VM leak on hardware
supporting ThumbEE.

Can HSTR.TTEE be set unilaterally, or does it need gating on
cpu_has_thumbee?

Is setting HSTR.TTEE sufficient to cause an undefined instruction
exception to be thrown back at a guest which goes poking?  (I guess this
is really "will the default do the right thing")

I'll freely admit that I'm out of my depth here, but the build failure
does need fixing.

~Andrew

