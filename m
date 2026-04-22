Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEthLdei6GngOAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:28:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D37444B32
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290228.1569874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFUnx-0007rf-Mo; Wed, 22 Apr 2026 10:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290228.1569874; Wed, 22 Apr 2026 10:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFUnx-0007qD-JY; Wed, 22 Apr 2026 10:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1290228;
 Wed, 22 Apr 2026 10:27:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFUnw-0007pV-2h
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:27:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFUnv-006nB1-FW
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:27:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8a297-bab6-0a2a0a5309dd-0a2a4507b6de-0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:27:35 +0200
Received: from [40.107.200.57]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8a296-229c-0a2a45070019-286bc839f262-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:27:35 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5251.namprd03.prod.outlook.com (2603:10b6:a03:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 22 Apr
 2026 10:27:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 10:27:22 +0000
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
 b=F7l9QXZEEovabm8X/6ezGHvwSjvmQcOfeeNuPfs83fZd8Vj0ytElCUJBMDclt53YT9Cp2Zn9H+8nHybI35/hXgPlwTK1PTzJbjDTTQEa1tVxzsybYYvyJ8ktOj4a15lsP+5dKPV5R8At4uw7N0XjpPhNe7/7zouioiUO1hYbGl8y/wUE0dxwT3aL0iZAYufvv6bIcCDjQPc0HecP6AA1h2ezuDPGak35NS3XOAo54oXstS5qLJBoAKUylUWr12icsCu0RS+1hJS4qhvrqpLX8+LpjsA43uBqyfGZZikDrQi3utYCu4O+j4roIZJ469jumrNASw56CM1MIH1wggNMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPpR9LAK3a8IX9sxYpGyRv2J62/E71yO4bObAKY0j2I=;
 b=o8+3KJGp/eEWkbGT4tTA3zTdZY/MMadfc8lyUQVmrDru8HIbNk0l5d9wJU84q3xkI4CYXKjHemsXzL6RA7zXwB8TNOy90AquLN5fWqS+5QgJoUDQufHUEGphWObHx6NPpqD0tbzqohBYw3mB3OUUnMoeSAKXUaJVwjMTXlxSllh3FXD/RugINe/Va/Fk/ss54CxQoV9a3JhBIWYQuFRbTpYGai2+mLL1Xnsc1fSzv/Tz7qCYc4DgJBh8as2c7mggb6NOtPn2EtxYg2RPszZGWsoaFqApJlrA2kNey1+A+8EudfmK3XVU8z512vQQKowe5YgY/DHyEq0gxpWY75G+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPpR9LAK3a8IX9sxYpGyRv2J62/E71yO4bObAKY0j2I=;
 b=EwTWz9KfUQCXcnkr8dus11sAeX16gl0+TrqbA5+kG0vBszqA03PDkTl6TIZCoWgJmpk4hTGGbOgqGPAlbry3M25yqkniBq9B0DR9gwfUdHGOkyqba814GFVa8OV44wXHWyLSiOFoYw+ACUEmrm9u5xJl2y81erEMYJBvNKfEoZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Apr 2026 12:27:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 2/7] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
Message-ID: <aeiih6d3_YpHolrl@macbook.local>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <904786c642136845234f94fb522a0a0d0fc8a1d5.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <904786c642136845234f94fb522a0a0d0fc8a1d5.1775742115.git.mykyta_poturai@epam.com>
X-ClientProxiedBy: MA4P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5251:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc747e9-45d4-4ade-1374-08dea059bd91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+lgT91V7qQq6WbbHQlCdanvcsou2hb6wkcI6uO3Qs3uGs7AN6ZGeXW8MLNXXvCvRHNWMLQ0YaPyt9J5X+d+ti2YtbX+sa1RAMQNlhHgEo/6zeqnEB72ou/0ro/1s5UGJnc1oupuO9hG70+Le69OzFCb0mKkO1ssvZoOco+CeDdlHSlXS6YuBP5w2JDZ7Bs3g74rnKUmn+dB9ytnRpPbRN/mbHjslIWU67JMlCHv/U4e1fBUgd3lkw4uRB1iHIS84+sE0IXBKQJCTNI+cPhSgGzVjToXL025xyhLi5Vx8kaBvmzSzrIFvifWK9DgDV+A+O+qCSPr945rI6FhTuAEtXZKvzFsWubopqJUY9ic3iY8yrBgUtRkYbf5BVs4yiecx2S/xAa0+JC+3EimsmtRE6lhw0PpbnYXapTs90A3+BLZpOD/MlHyZuBFTJ7PgprusdbLswh1JuFqDJGptlUdvipKw9Ehmrd2gZdHKBn15xiKMAa6lnBS0k95uDPceo1XgMezOjhMAs+qZITRrt1W7rt2XhsEkh/qy/bZpttMlAnRiH42VUx8BOhp5GX6lvFxeKajveTmdEFZcKW/rdMlhmHoBUNTQ14I+vqa07EWajsz5um56cRUvsrz6MNEx0C9cegyWIdKXIWqXyzzj2eHiUxC82RG13MvfZuc+imcCDF2iPOoMtMrpyzXZe526NWw1hfHE5tsDS/tAVwTW0/lyMVDihhN18QhNHEN0ZJLTqF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDhMNVFDZ1VPVnR2WVBvL0JpNTViYjh3UzdYei9vbmZCVjdUMFRFMDdsMEVB?=
 =?utf-8?B?ZG5rWm4vb3pwYThobFpSKyszMlo1VHNsTVY1UWZaZTNhMFpoUWN3ODZnV2U5?=
 =?utf-8?B?NitNMkcwdnpoaDJpRDNkSkpaSURmV2F0Zm9STzNVaUNOdHhDQ09xdkZjaC8w?=
 =?utf-8?B?ZU1QeldKZXZqbDF2ZVlrNkFmcGNSdG9hdy9EckJDZ21tM2treVdTYkh2dFU5?=
 =?utf-8?B?R093N25sS1NvOWFoVHdRQXhjMEc2SW50NUxqKzhpZmttQ1hOMnZvclI5L1FC?=
 =?utf-8?B?dFZ2eWtBeGZMSUpPTE94Z1FNbStxaGpISm9UclpkdVBEcWV1VEZsNlBqMWVn?=
 =?utf-8?B?TVhMTDlqSDc0MCtaR3ZBQ1VuZ3dlNURJSWNCYjZ3RXhOVkRiUnJ0d1U4TG9u?=
 =?utf-8?B?VStyRVlxVlVOVnArQVcyV0hWOEExZTdYaWtyWXkvK3Vja3QvUWVkRXRiaEFs?=
 =?utf-8?B?RzFKS0FKUHJUMjBwU3RaSjBxalQzQlRNMk5UTHBSeTNOQ1Y1UzFpbUs4RjBB?=
 =?utf-8?B?K1NVTVdDTXk3S1prd1hjZnYzL0IvclkvMmt5REFKQU1DbDBBeUlPNC90b0ZV?=
 =?utf-8?B?L0o5RU9jaGhJeTUzNHBXWmlldW1Qak1PZGhNa09BS3E4aGlQNWRHaWh4UjdB?=
 =?utf-8?B?dFRoL0NpZDRLWnpPTU9hWitqU29PZTd6VzJLdTF2dml5NnlTMEJDMy93M09D?=
 =?utf-8?B?enN0R1hLVVhBYWFoeksrWW1zbVlaRzJ2VTgzdHg0dzdpcjIwUHM5UllFMzVh?=
 =?utf-8?B?cE5qNys2Mm1qUENpNnFTUlJJamhvSmVXSHpnczg5c1VvNGk0d216ek9lanEr?=
 =?utf-8?B?MDVIb2Y0U1RWQnE3OXBJaUU3MERYbnk4ajZyc2Z0ZUZVcU5LeW1uODZWNVpv?=
 =?utf-8?B?UEg2UDJlZzFrYU5HSlF6ZURFT2lxa1QzczJTcVViOXdxak9WMW1scmFmWC9i?=
 =?utf-8?B?M0ZYejdyWGVZV2xoeFA2V0lld1g1eUxkYThBcUlqbW53ZlduN0hEY2FwSm5J?=
 =?utf-8?B?eTljRzJiQjM4ejVJUFFnNnBkNTlrWTZCYmxSdWlEeDFkYnhBcDVlMDVuOUVl?=
 =?utf-8?B?bnRFMEk2c3c1YlpWRHN1ejRSTEcxSVJwOU5GdXlkcEFsSGY4M0ZOeFZJbVly?=
 =?utf-8?B?Y1VEYU92R0VLZUpFZjZWOFgvRG4wMkZZTUpWS25FTXJtR2xjMnFIM28xd0NH?=
 =?utf-8?B?a2toNEZNVWl2WnFaY2YyZnpwVXVoZHpWL0VEU1VmVnRlN2dodzAvSzlSM2Vx?=
 =?utf-8?B?ZjdEam9kVmI3M3JvNWJFUnVoRkx6Q20wc09pK1JnM3JuZzdlU2g3akVNY3pV?=
 =?utf-8?B?akE0UE0vRHdBdFlqeEcza3loU2NKa3dKeXlLS24rYlpJcDFJSWF5WmNvd1Vx?=
 =?utf-8?B?QjZ0WGZMZmhnektXanNra0RtdlY5b3ZHQmhkd3BJYlNUbXZ2dmg3NGIvTExD?=
 =?utf-8?B?UUZVd2h1ajNYV3kzMHNMQzd1UC9aamZKbkR3cktEcWtYWGhQL2Y5aHc2dGU5?=
 =?utf-8?B?ZnRQY1F1Nmo2RVUwMEhQT3NDd29DT2Rwb3k5VFViTkFvcXVHTkVFVlJwclhr?=
 =?utf-8?B?T1hzVkdQbmM4MFNybVNWY2kzR3pkTUw1TDFtS01MMUhNMjFMYSthTUpDSFdE?=
 =?utf-8?B?ejZwZk5jalpkSlBVenQ0NnR1emQ1Nm52TU01WE80ajlXTnNaN3dYV2o3VUtr?=
 =?utf-8?B?YS9KQzE4dTRKd3J4SGp4T2Z2dWdOM1d0cjBqdG9HRmhPYmdnSEhkQ1RmN3Zs?=
 =?utf-8?B?SjV3MlZTRHV5LzRJSytuSk9WeGNVa0pvQThrYUc5ekJ6ekE1djdXcjVBTGNJ?=
 =?utf-8?B?aGZTUW5Zbk9KRHdUaWswYXJNK3dCV2txaHJraUJsTllBdklLbi84Kys2MzN6?=
 =?utf-8?B?bnhnV1RDOStSL2JhcVIyVzBzYnFmTUFZMDM0YkNVS0d5S0tqNnZXVlNSaTNY?=
 =?utf-8?B?bXRQOHRacWlGN3BpQ3RPd1VSb1JEY3ZJN2xTNkFKbmVYcXplTW9mL2RvTGtw?=
 =?utf-8?B?M21sVGVncU9lbjhTblN6TzBiYmlWWlVySWo4VUZjSjdtSFRCS0I3bWlOZUtr?=
 =?utf-8?B?cmErNjRObjN3QU5jMkhUZkNjSlFjWkI1VGFRcDFoRlB2emdLY1hRTFYzMjgz?=
 =?utf-8?B?Z2Y0S3R3STZHKyszTlJZK0dwS0t4ZmFTTkVIQ0ZEc1ZzTCtFb054QVJQSXN4?=
 =?utf-8?B?NjhDT3BTK3lBY1JHeGhRNjlCdldOWTBJOGEvQjRyN3Q4WjVhSHhHa09sWjkw?=
 =?utf-8?B?a2VBaDFTVWEreGhla0hUUW92R2p2WnVZVytrTThlbWNJWGlKQVRyWTFYdTJv?=
 =?utf-8?B?SFg0azJDNGx3MkFZQ1BpRDc2bm1MbVhmaCtQQXBGWlJOcDB0TmtqZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc747e9-45d4-4ade-1374-08dea059bd91
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 10:27:22.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sW0TKLpPzZtkFAbtEYXxUF2AxUR3rZTKGyo/qe33+kV4FA+cUxmgH7uxlkCulzMJGIUEX4NrAAgAcKaRC+u7NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5251
X-purgate-ID: tlsNG-ef75cf/1776853655-ADB68C48-11D196C7/0/0
X-purgate-type: clean
X-purgate-size: 508
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 27D37444B32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:01:32PM +0000, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Export functions required for SR-IOV support.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

FWIW, you could possibly squash patch 1 and 2 into a single patch.
Both changes are just exporting functions from the same file.

Thanks, Roger.

