Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFmoCvUbB2rnrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 15:13:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A645504BC
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 15:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310008.1581005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNsLg-0006G6-Ro; Fri, 15 May 2026 13:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310008.1581005; Fri, 15 May 2026 13:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNsLg-0006DC-Ov; Fri, 15 May 2026 13:13:04 +0000
Received: by outflank-mailman (input) for mailman id 1310008;
 Fri, 15 May 2026 13:13:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNsLf-0006D6-CO
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:13:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNsLe-006b0n-Ld
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 15:13:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a071bd7-bab6-0a2a0a5309dd-0a2a450be4a6-20
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 15:13:02 +0200
Received: from [40.107.208.63]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a071bdc-212f-0a2a450b0019-286bd03fba1c-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 15:13:02 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6018.namprd03.prod.outlook.com (2603:10b6:610:bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 13:12:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 13:12:57 +0000
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
 b=U18Y2Gqd11I+WoVgeT9i3f7umP6zSyCxkypjP0e1uEwSP5q3hG/LOhUZWN6NOCqRVBNHbVpC/2IxERpj7or8UaMqhLJbVNR8Ow9BWY9NWSzD4HcgLpsz5co8gK02KF/GKw6ZEsb0q7FRpCFr70tyi4iEUmQuWANmOA1hcNg5g8p9ynFX0EWK1IgcgZwhJisU/PN3WngU4tv2cv1mw9ZIxB7WyujlsblNbaUB3sdoSjk9yVmnHMFtcHlUmQzY3jhIA+gPFRJOV2x5uropPhXbeeqpCQDFS034+5xdRHtE566TPITYr/kDTYgvN0GZisjj9O25w+5EU5pZbkR71IzJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbeEDFUBqb23n3nj9F6l/iKheCEK7+Rekln3WihDiF4=;
 b=ZVCAbbLA9km6K4lXvMH2BnkW9kO6UFKhhpF0rAdvTgBdY5gVaSKCn51QS9dkVaTs4FKbACnF+OxNhSQMOCOaKGcER8hQ9yvkWfKW2I8jiJWcm/8I7Z8EvY70bDoGm9y+wSLhhAnYhUgXuzRUN+jXWIqOY+XiBF34Cmv0cD0Xk9RxSICR/YoY22FyD13EP8qRLsWXYWdF6mAFODQbGXYxoljVftfC+j4gSAcXu+yc4T7AC7fZVwe5OsGmar/NLf7Py61mBi8eJfgUOvVpYI0mkSxZaoOvVRb7zCBbAN9VD1CJ54/xLAjhH/7BTbRBDB4MHn9eyUO71xDGV2iwO1Is9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbeEDFUBqb23n3nj9F6l/iKheCEK7+Rekln3WihDiF4=;
 b=H6PTT04ld5y7hpZlorWExv/XSpcgbFBrDzqDoRvsEwKfiIP9kWU9czHzdUXwAEyQGnYJdzvA557eYKc3n5o0BwKqO2qnQLh4jYaL9LbQoT8rpt0vtQ+ZMQOZDGLwekUU6lEM6ISd/bIaLdD7+Jl8yi+ylPizaHpp4T7FQ4rRk9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 15 May 2026 15:12:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 RFC] x86/time: avoid early uses of NOW() to return zero
Message-ID: <agcb1WAGLWDRYZ06@macbook.local>
References: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
 <agXwsshLlV50dcnV@macbook.local>
 <8fbab1f4-3078-4ac3-b147-84d1b5f5abd1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fbab1f4-3078-4ac3-b147-84d1b5f5abd1@suse.com>
X-ClientProxiedBy: MR2P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 869bbdd5-460c-46d8-5da0-08deb283aea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|3023799003|4143699003|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Pck0/ilnasVioW+xrjUApyXNXdV0kd7pKlVJBcIR/ciLAyJeCJ3F7AnarSEJNLMuFxkr0AWz1AOaWu4a0ELhE4J/Y2oUG5qUE3BBOkpUo4H1WrvLA4YzMB8ZQRP5OpNkauMb7727iR5AaubtDvgFm4MKlbCna6atZrdzRyGOhx6Gb3nNwkXhYJS1kodr1jEiYMIbPHGnIhIlK0Gcyt29ERgKkIX/esJI+OjAJNdcjfYvyqueXPXpYLwqH8qNHUBQtOrvuVDFMEaKliU6zBm9kB2XlbehFNxtRA8xTdYoNXHE+/rETt4Ha9R8Z2gLa89D11ynDfMQ1cbI3/0XTsVBjpuksaGuPZC88+txO5oe9i/YeLVLKKeIEqpDha8RhA19BeZcgi0r5ks+FemctSe5zUjv0lJMQqW3DNEQwyuIYvo1amUYFryW1VguzE2y2/oPMnUWWd9WPgmKajoicTf936BKV8WnO2oC7v+qbb7+DTFMVC1uzWf1ZNqO1McNwD6vnQ5IcvdPOAn0lRoUzpuNF+cwDg2joEPX38SvH2LQ9brBH2anKO4JEWtWh/Lhp7hKd8icGRqYGcdp3BovXuGoP9RVlXE3b7JxLfdsMA90pM6vnugurj3oNrb/WZDnKmargOumVGxgHqfEYyVbeN98Iz8cYHb7Vxpqk9KaPMsNvtEqN7GIBKq6EvilKkThAcEu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(4143699003)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3pmNktHRG80YnRFQjhHcThpbTJOcWhsQ1M4ak1TQ2hMSFI4N3dZemNMZ1Jx?=
 =?utf-8?B?cmNkaVR3eWlHcysvQmxJWUV3RWxBZ1NSSVFYbjlOVmhXNW5SVXZXcElnNjIy?=
 =?utf-8?B?MGRmNjcwUHJBZjRsSDBUZDVlSjNvWEtaWW13c3psMnk3dmd0d1JQN3RHTEJX?=
 =?utf-8?B?VFJwZFFsUDU0K1Q5czFqdjNZTmlOSTFQUW1tRGMxd3JTRFFNa2tFMW0wcTcx?=
 =?utf-8?B?cTBlaWo3ZllqYnVoV2VJeFlJanJBSUQrbEFMYnlIUS9KNDBaWVVhNGFlcVdN?=
 =?utf-8?B?UG9pbW9EZVZRWklVaU11bGl6d3lwbjZMVzlvdExXUHRhQ085a1d1Rks3cnE3?=
 =?utf-8?B?ck9uTVpKZlgxakN3cS9acTdHdmlNQnd3U0FmOFZxUnJGKzh5Y3pPanM0dkhJ?=
 =?utf-8?B?cEZLV2Noa0JxVmxhOWQrWFBQdXFPNFNJZStmUUltL1A0elFwSVc3cXpYMXFQ?=
 =?utf-8?B?alN5cStsazB5VWZUZW1hVTRGZUZ2c093bEhuckl3dGJTaU1iQzlxemdSa1Zr?=
 =?utf-8?B?MzA2cmFyRGJSeDd2RFhKVzBZajFmd3VCajVIWFRKRm5uaFRWZmF0Vld4K0xO?=
 =?utf-8?B?emNkRXVIUU84V3JSQmc5bXhkOUFwZ1djU1g4UEhOM01LTms2V2wxVG00V3Zj?=
 =?utf-8?B?ZUZzbyt5WG9uejZDakM1Y0Vab0RmZHF0Nk9YZGt4cUNybXd0aXZJMGp1ZmNJ?=
 =?utf-8?B?VXN3Y3d2QjMxWXRKbGNUTDIwVFRJVUpJVkNOZ0FQRldoWDJ4SURaVk9vc2Yy?=
 =?utf-8?B?dlRBQjBHQ3V4cmc3RjBEN05URjVGekVJMElONFJodHBOc0prekw4ZmJYeEtJ?=
 =?utf-8?B?MHFnWlBkTit3YnJxQXRvRUo1eGUySWtOYXZpUC9aaHZDeWg5T256ZGwzcUFu?=
 =?utf-8?B?Vms2d2JPUXMxaW03YWlFY0FndHJ5aHFjb2xmUk5YRVIrVDdEOWtKYXZJR0dp?=
 =?utf-8?B?QjYzKzNLWFRoc2kzUjEvdlYxMnNZU1E4ZFZTVnZrNExmOU1ZQmJ3ejlxWHND?=
 =?utf-8?B?L1N5ajczMlhkZi9jSXROVFBwSHdld3VvQkFBMy9GSGVuc1g3Q3piSDhnU043?=
 =?utf-8?B?YjlqWUxaNGZTRVFJUncrc0x6V3F6cnhidi9HZ2QzNnAvL2lXZVNiU3RPUGdy?=
 =?utf-8?B?RHRCMVFwYVBoWHNvLzZtaDU4N0NmaWhyNi80amc2QVpWQ0RQcnZKejhleFJQ?=
 =?utf-8?B?RGdta3UwcVZWTzVkZ2JIOXh6c1VmNmU3NGlEaVg1bTh5VVhocXBSUDZ0WTR1?=
 =?utf-8?B?SXVKazFQY3lTYVpTVW9RZ1BicmdPVDk2Nm1ON1JVSFl5ZEliWnV1MUJ1QnJW?=
 =?utf-8?B?c2pPWTVmUmtDTXJJeERzYmlwZmNKZlVXRzFEaTEwU0JJaFVWTWpPNXg0Niti?=
 =?utf-8?B?RUJoTGF3MTFTNDl1T3hQNjNQWk05V3lTUlJjZ2VRRDdsZC8yNWhpalJRMnIy?=
 =?utf-8?B?a25DeW5mWENxS2pHYWtaWnpTWWVrKzRSZGVNN0xLL3JyQlErWmViUkZjdnpp?=
 =?utf-8?B?YkF3bkV3S1FMdVYrdldGclk4eUlsYU1OS29XWFIzZ3ZqaWJaVGpPeDBxT3Iz?=
 =?utf-8?B?YnMyR3BBVzRUazh6L3diNSswWDBFMzBTT0xjb20ySWYvN0pRRnlzR0N6eDZQ?=
 =?utf-8?B?dWtPZFZxUG9WVGpwMkNaTEk3dEM0WUprL1doVHRRRlVLVU1wTzFCK1NwNGhH?=
 =?utf-8?B?NFN5aUIyeVFOVnI0bFA0QTRPOHF0eTVTeGUrN0ZiQVJQWHVHdzljWmZjZEo3?=
 =?utf-8?B?OVdUOWpucnpWeHBSVFF4dG05SmtxKzBhcHNoN04vT3p1M2RFc2dMK0FMT3p1?=
 =?utf-8?B?TWc4UkNDWU54ODdsRk9BMmI3Y0J3VnF5Q005UlBYSy94YmFtUUcyMVVyZ2xY?=
 =?utf-8?B?WjJubVk2d3o3Y1crZmtMZmhNSC9vQllmK3NmZUpXRWZjcHcxSHZhTnJOeUVl?=
 =?utf-8?B?a2doZ3Jhc0pFWDN2ekIvbFdpQWVPaXEwTzN6cHY2RGZ1cEY1aFdGQVppMlNL?=
 =?utf-8?B?RU1IcG5teUx5cE9yM1czeUJUNW5aUFJRME9GbHF2bCtPejNmRFJiOEt3blR2?=
 =?utf-8?B?b016QzF0ZDU4NnhDVmtESCtXalFwOVJGdVBkTXN6MmVnQ1hKWmJoaE5qSEta?=
 =?utf-8?B?Sk9STURzNXZTM0s0V3pVTzMvRjJTTEJLVElCTWwvcVJ0Tk84enJVa2RCWVJk?=
 =?utf-8?B?eTJlUkwwdzROVmRtb3FhUlY4NUlOMFA2K0gyNG9GRHY4T2dzUS8vZzhzQnhO?=
 =?utf-8?B?QVdITUF3dDRESUU4SzBydm4vYTQxQ1lVMDJhcWQ0Y295S1lnaUxsQjdyYi8y?=
 =?utf-8?B?NURVLzRYMzJsVjhnS1lQelBuTUdrRWNTRzFEVE1iTHhZL3BQa0hvdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869bbdd5-460c-46d8-5da0-08deb283aea1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:12:57.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO0wzlw/gVGPKT9xrHjTxO0gIqfSysPtagTJ/xYWse42FXZnSRCaIuUx7sqqdUsDyN3wpG/GJRzYBqGD9tz6cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6018
X-purgate-ID: tlsNG-42698a/1778850782-22D77F3B-61EEA9F1/0/0
X-purgate-type: clean
X-purgate-size: 4349
X-Rspamd-Queue-Id: 82A645504BC
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 09:15:40AM +0200, Jan Beulich wrote:
> On 14.05.2026 17:56, Roger Pau Monné wrote:
> > On Wed, May 13, 2026 at 08:44:46AM +0200, Jan Beulich wrote:
> >> Waiting loops like the one in flush_command_buffer() will degenerate to
> >> infinite ones when used early enough for NOW() to still return constant
> >> zero. Make sure the returned value at least monotonically increases. When
> >> available, use nominal frequency values as initial approximation.
> >>
> >> Do this only in get_s_time(), as producing a sane value in
> >> get_s_time_fixed() for non-zero inputs won't be reasonably possible.
> >> Put an assertion there.
> >>
> >> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: This breaks at least the TSM_BOOT case printk_start_of_line(), which
> >>      checks for NOW() returning 0 (falling back to TSM_RAW in this case).
> >>      For now I have no idea how to avoid this; perhaps that's tolerable at
> >>      least in the case where we put in place an early estimate? Should we
> >>      maybe weaken the fallback condition to take effect for any value
> >>      below 1μs?
> > 
> > Maybe it's fine to print cycles unconditionally until we reach
> > SYS_STATE_smp_boot when we know the per-cpu scale is correctly set?
> 
> I remain of the opinion (as said in reply to your similar v1 comment) that
> this isn't very desirable. Tying to SYS_STATE_smp_boot also would feel
> pretty arbitrary. Other ports may have NOW() properly working much earlier.
> If anything we may want to add a global indicator of NOW() properly working.

I would be fine with such indicator.

> >> RFC: While generally the mentioned waiting loops will take longer to time
> >>      out, on a very fast CPU tight loops may time out too early.
> >>
> >> RFC: For the AMD/Hygon case, if the "nominal" value isn't available, we
> >>      could use the "high" one. That would cause NOW() to run too slowly
> >>      (until the scale is properly set), but maybe that's still better than
> >>      it returning 0? (As it stands, I can't really test the new code
> >>      there, as my Rome system only supplies the lo/hi pair of values.)
> > 
> > Using the "high" frequency would seem fine to me.
> 
> Okay, will do then for v3.
> 
> Related aspect: With these family/model specific additions for AMD, we could
> also separate out intel_log_freq()'s model specific part, to leverage from
> here as well.

Hm, yes, that would reduce the duplication of the added logic.

> >> @@ -2623,6 +2640,21 @@ int __init init_xen_time(void)
> >>      return 0;
> >>  }
> >>  
> >> +/* BSP-only function to pre-set an approximate TSC scale. */
> >> +void __init preset_tsc_scale(unsigned long freq)
> >> +{
> >> +    struct cpu_time *t = &this_cpu(cpu_time);
> >> +
> >> +    /*
> >> +     * The incoming frequency is only approximate (nominal).  Increase it by
> >> +     * 1% to make NOW() output rather a little too slow than too fast, thus
> >> +     * avoiding a possible backwards jump once the final scale is set.
> >> +     */
> >> +    freq += DIV_ROUND_UP(freq, 100);
> > 
> > To avoid such possible jump backwards, won't it safer to also update
> > the ->local_stime and ->local_tsc fields at the time the new scale is
> > set?  Updatign those ahead of setting the new scale should avoid any
> > backward jumps.
> 
> ->stamp.local_tsc does get updated; you merely dropped that line from reply
> context. As to local_stime - how could we possibly set that, when we didn't
> get through init_platform_timer() yet? Leaving it at 0 is the correct
> match for setting local_tsc to boot_tsc_stamp.

Please bear with me, maybe I'm not understanding exactly to what the
code comment refers to as "possible backwards jump once the final
scale is set".  I assume you refer to the setting of scale
early_time_init()?  The ->stamp.local_tsc value also gets updated at
that point, so it's not possible for the timer going backwards?

This changed with the addition of the init_percpu_time() call in
early_time_init(), and makes the setting of "t->stamp.local_tsc =
boot_tsc_stamp" pointless, as it will get overwritten by the logic in
init_percpu_time() a couple of lines after?

Thanks, _Roger.

