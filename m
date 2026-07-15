Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xKL2OniNV2omWwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:39:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91075EC43
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:39:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=dHqYzneZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1363101.1614928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzp8-00069h-Eo; Wed, 15 Jul 2026 13:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363101.1614928; Wed, 15 Jul 2026 13:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzp8-00068J-BG; Wed, 15 Jul 2026 13:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1363101;
 Wed, 15 Jul 2026 13:38:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wjzp6-00068B-US
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:38:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjzp6-00BAsi-7S
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 15:38:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a578d69-5cb7-0a2a0a5109dd-0a2a4503d74a-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:38:52 +0200
Received: from [52.101.193.31]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a578d6a-fae8-0a2a45030019-3465c11fc530-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:38:51 +0200
Received: from DS7PR03MB8265.namprd03.prod.outlook.com (2603:10b6:8:266::20)
 by PH0PR03MB6336.namprd03.prod.outlook.com (2603:10b6:510:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 13:38:46 +0000
Received: from DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2]) by DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:38:46 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueOIckZdEtR/gOBT0IrME+3hwKnxOHl731xh1DBltLk0Iigm2R8lM193pme71MzvVmBBtZxtqkbyJKfN8N2bR1UhiDVGQepgwZcreCemtBOteNgrXvpLWJWbopD43PF28ymoyGy7kc7UAkLeQ1KfnZDi7Igs0/HYcQakE0WsaOhSLhTbGEn/ShwjyVT6sShHazwEXwWfo4zhS027RvkNNWnbtm87XGnAwJHu18XvnME1uvEqZzvQK/XoQoqOeUil97v4VlI5J2EufE8jX2/Ut/SUoFYZME8lJHuj1TTKpJFwq50l8Ka6sYaFGf75hSV49Cpf6ZIJe6crzOZGJoeseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE6rxWidoQX4WeHszNLS7ODqrTNA38kasOCFHMnPUvk=;
 b=cxeXt0GK1XL5wHRfvbzlaD/V6VjkqQ1oL+sLET9jqNaE16eetEh6uioreu9Gb9KeWSnf7CU6ZZ3h1r3GSf4xSlaVswbpSmWYEq6PGsxd6cbFVZ6GaAH6ru9rAbB9wmufu+ihZMcre/R2Y27BMre+20pwMkGTxntnLOc1/dvmXfBdgyMV4xiGnMO31X2dvWUiwKK3f/prX6z/ow24xsAIUCUYX5DQ8mGfufAcYMN7I2HOqXYFMU3CUAJi1+fDpgMDTC24PG7ufkaBV739Acs4+Qc7/S7RK+3WWd1zf6udqygp4f8E0iqPgoeRfCkN7LClL4WD6ZDMPEyacU6oNKVjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE6rxWidoQX4WeHszNLS7ODqrTNA38kasOCFHMnPUvk=;
 b=dHqYzneZuoj/hrnGWKibprt67xq/rQCUqaL4EmYM1tLiX7tJfETv+etBLZBB3gs06uCi4EjZdrk6L4uCTK4CFJbGH42tcKE2mBgpFElPyZDMLEMY3d8rgmflt2YgfVimflnCwRl+wHgxozb579RcpfBZLPf2uZr5r9d+ZSSqF7U=
Message-ID: <1f4c1217-ee5d-40fb-acfa-057b53a8dae0@citrix.com>
Date: Wed, 15 Jul 2026 14:38:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v9 4/4] libs/guest: use Valgrind to detect various buffer
 overflows
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
 <20260713204802.105115-5-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260713204802.105115-5-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0434.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::7) To DS7PR03MB8265.namprd03.prod.outlook.com
 (2603:10b6:8:266::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB8265:EE_|PH0PR03MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a808edc-0860-4378-c757-08dee2766529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xSuKO7Jtcd6a6WF6tJ1KEF/bJO6qUC1UrYLYOtSro02Z/MCp0mIJwf80+LHZs5G3oEVvcM8CWN+8Lf5jJYOVKA72KIBn6eyYuIqzUR5vfDOmR+RqMU1IanX1FUNkt74KgXhopsxYJ1C0UZkK2a70ERv36nvFQgtLPn2xFj87GItrGEQp6jx0CcmklxagEMnJ+FGK38FWMP9qzR4QPkDzSX6lYF+R6CjdITsvzcuOMFc7xe9+zd1CnChh3A1hCibvz+bITn6vDXAJSQuwIEgcnb9bO4SWdicOYwlWruklhcCr5rsoi5IyM2UEyjaejf1/tSSS3bE5rstqcRqrszr6Qr+gfW6y7fIWjSI5DXi9cRqq3hfH0ccsJ9Tzx1snAJUhz+E2+An1N7yOoGfBaWPW2Ivhf9mpSPhfhE8ERmomNgSrja91Z0fkgaIC5mKG+9usDyBCSw2MSXS93zDmN4yELn8uYxc2s51helUj/hU3e6cnrBzfQXL31ote0hLDvouhSEsIudxhAPicW3dd7zPPkvzqzysfwdjuu8nbHwZKj/m7G5FvCHnXUCF6DIIF9KcUkAfws1wZFkWwECoOLA/tiiXioDsDFscuZUjGFPKjfULnGbYvIjWuo7ieKZmGB7mNsZkB2s+E99sYY9skK45Bgc5kPlsGqoOyMLh2NqnEIAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB8265.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUtXLzNhdW0yK2JuVFE3NDNxWmJVMXl4UGZvTTJsNjJ3NXY3K1hGWHJGeGww?=
 =?utf-8?B?MWpYTkVmcHQvMUE0MU5XN2FMb2VXc2RvTDAyWi9BWkNEaEU2K1dHWFlWRmo2?=
 =?utf-8?B?Ri9WcnpvdmRsMHM0aEtER3V4bDRWMmlXNkpUQnl2R0FqdmVJOENUcWJ0UE9C?=
 =?utf-8?B?NGZTWFF3WU9IUFVVVHlpcVB0MGUxN3BnQUY4Q1lXK3F2WnNNNENJSWNTS3Bl?=
 =?utf-8?B?QkdkT2ZWZjZaYURFVjFmQmJ3bnMyMDZBWStYTVArRnVnbjU4dk12MVk1cFRq?=
 =?utf-8?B?WVo2eEdCM3JKd2JDM1ZmMzdHU3BQeWFqWkxhdC90WFkyL29UOWRxMWtLQ05u?=
 =?utf-8?B?Qm9lV05YRG13Uzdnd0pGc0JzdVU1cSsvMU1uVlc5TExEYU50TFJTZ0dqbCtr?=
 =?utf-8?B?eEFBM09nSnBDbkR0ZnNyTXlPSGlCSERybzlVQzAyVmNydzBWVldSVU11bXFF?=
 =?utf-8?B?ZXJINHFWbnczYlJXMEhlZDB4dWNyM0swL0xUb2QycytIZTIxaEpHS3FJSlJw?=
 =?utf-8?B?ZWVNVGMwV0dZczV4QW8vMTdTU0Z6Mzk3Sk1hVGUyeEhZVWRFajJKeUsrVHJR?=
 =?utf-8?B?dzlCbGRLMWYwUkNmWldQQy9GQnh5RzZBZWpGYkNPL3E4TjdLTm8rY0ZKMGZi?=
 =?utf-8?B?N1RwV2NTUGgvNklXVVl5ZHNuNlg3VmVYRzFJNHQ2OUprWGFTdW5KZUR2TUpP?=
 =?utf-8?B?T1BFQ1pzWXI0V0lTdmlmeDJIYTVFU0k0YithbnhmWE5rUVhtZzR2WlNFVElk?=
 =?utf-8?B?Q0FTcW9tNXFlNXhLanhUMlRPVzVabnIyZmFhSGxCeHhXdGZacDRWaDZGTzdr?=
 =?utf-8?B?RUVMVi9nOE5CMHNJVUpuREZPTldqSm5Mb1JkaEhHQ1RKRkh3TjI3d3VHZW1Z?=
 =?utf-8?B?TFBCWlFoTG9URjEyRXArM0pDUlkwSTRoTVd4Uis5WnZuSEk5VVlUZUlPZ2lu?=
 =?utf-8?B?ejV2S2pSOHphVmNYcnBVaGxyTlFDQnVybWJITVFHbndrWjIybEtxd01XN2g0?=
 =?utf-8?B?Z0tKanNxSGFQSXQwbmZSRHlybVB0V0RxeThJUmRJNHd5YlR4bFJSdTJyWFg4?=
 =?utf-8?B?MlNMMm1EN2M3RDhSQ3hCZHBnL29idmZVUGJvaVpZZlB5R3FkK0hsM3N5WGNP?=
 =?utf-8?B?bHY5eTRhUzhvSUtPVDErZk5lOGc1MmZLUVB4M3BFMDFlMEt4Q3hRR0Rjamwx?=
 =?utf-8?B?MTRRcTNpb2I4V0R3Umd2Zzd0SHhBdUVXT0J3RDdXYjlpVUNDcTEyRkxXN3RV?=
 =?utf-8?B?ZTVGU0M0ZXRuWG9VSDRDOUl2VXNENGhweG1pZi8wS2tXSFFrY0c1NjhuQ1RU?=
 =?utf-8?B?REszQmFkUEFsVVU4SWF3Qlk0bDJubnJtcGYrVmNvQTc1ZmpzdzVuWkk5MTd0?=
 =?utf-8?B?SG5GUCt4cS8ya0RQL3gyREpsaVlCWmx2bnJUa1lraVZSUmt3NktQVnkrYWVQ?=
 =?utf-8?B?bDJLSForUGdwRWpUYTNGNkFraEo3Vk1qTUx3MmNRVVFCVG83SUlBdzVRMTRK?=
 =?utf-8?B?T2FEZk0vODhmSnIrYk5iRmdHSTF2UFltMmcxdkdaNWM2dHFZSDBQUm9VRGEr?=
 =?utf-8?B?djlia2xSckhUNHNhaUNFNFBMNFpMeVU0QVN4K284T2ZGUlVMc2lNTW1jNCtM?=
 =?utf-8?B?S2wwNWNzaGZpdjNQTnBVUWc1NXpMazM2MnRsV1FVM3dZakc5N054aS9xOTk1?=
 =?utf-8?B?TTl0bEJPWG1XWnlkaW1FUVVtWEljVW0xY0tuSnJocFNaR09Sd1NzYlk4eFQr?=
 =?utf-8?B?ZFhVYVdJSjhxMi9oRThZYWpRK3RRa1JxaURHOEdsdGdWTG5KaCt6L052WW5O?=
 =?utf-8?B?VnA5QXdZQmMrbmZpbFB1d3FCaEh1c2FReEpYRmxmYjYrbWtEblBjSXFjcHEv?=
 =?utf-8?B?V2JmTVY4bVM4ZktnSktFQllrdktmWTZUcUN6OGhtSytvREpNcDhIVnhNL1FG?=
 =?utf-8?B?ZWtheTNqOVlqUHBMZXZtK055SHVxL2tzM2U3YjhYc21zUU41R05qSlN6YnV1?=
 =?utf-8?B?WGFWanlQK2x1VXNlaUtua2lMNGp5dWE4cXRFOGxOQVhLNWdSWVF6VFdSRFdD?=
 =?utf-8?B?aHN4b084cWZQNkx5c2Nhb0VReW5xYmYwT29CTm14Y0VCZ0FXeUpITGNzTmgw?=
 =?utf-8?B?MVYyOVFFUTcxWnVFKzR5Nm5BZit4RW5pZVYrbFk1NHRlRWMzbHQxRUhPUHc3?=
 =?utf-8?B?NDhuczg2dTdKanVyZmt4WGFMeXFabllDWmZhSW9Sczl4SUlXWnF1RHp6T0NE?=
 =?utf-8?B?RmlWUThQWVdwOTdEdG5tLzZQalJDSGRSVExCdW5sZSs2dlJ5M2xyVytkSzZZ?=
 =?utf-8?B?Q1RWY2p4OFRHVGNNWTBWK2swaUt0QkZUL2FLYzJiSFA2TDhCYUVmbGZ3MndS?=
 =?utf-8?Q?xn/yczqX5cfb4SOw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a808edc-0860-4378-c757-08dee2766529
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:38:46.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSUQ5dM0/8ol38VCgTrW0A5INIZ4W0QJvJgVHS96oTZW6tFUuCcsyuThgVBhfwyJMzZPuQgLMmFeqr1FxBs1rZMqoNCyTZFomujhBGbxqEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6336
X-purgate-ID: tlsNG-33051d/1784122732-758824E9-4E1CA886/0/0
X-purgate-type: clean
X-purgate-size: 1723
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:from_smtp,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F91075EC43
X-Rspamd-Action: no action

On 13/07/2026 9:48 pm, Frediano Ziglio wrote:
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index c07c6db59e..d3fc7f363e 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -245,13 +245,21 @@ struct xc_sr_context
>              xc_hypercall_buffer_t dirty_bitmap_hbuf;
>              struct xc_sr_context_save_buffers
>              {
> +                MEM_NOACCESS_BUFFER(na0, 16);
>                  xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na1, 16);
>                  xen_pfn_t mfns[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na2, 16);
>                  xen_pfn_t types[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na3, 16);
>                  void *local_pages[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na4, 16);
>                  struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
> +                MEM_NOACCESS_BUFFER(na5, 16);
>                  uint64_t rec_pfns[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na6, 16);
>                  int errors[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na7, 16);

If you're going to do this, use 64 not 16, and put iov[] at the end.  It
is good practice to misalign large buffers by one cacheline, not that I
suspect the access pattern in this algorithm is relevant.

But, I'm not sure of the utility of doing this.  By removing the dynamic
allocations you also prevent ASAN from working.

We either care about them all (and keep the dynamic allocations), or
don't care, and get rid of it all.  This half-way-house serves no good
purpose.

~Andrew

