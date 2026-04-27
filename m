Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNbbNlws72mb8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:29:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4146FED0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294746.1571444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIGZ-0001f2-Ub; Mon, 27 Apr 2026 09:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294746.1571444; Mon, 27 Apr 2026 09:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIGZ-0001cT-RF; Mon, 27 Apr 2026 09:28:35 +0000
Received: by outflank-mailman (input) for mailman id 1294746;
 Mon, 27 Apr 2026 09:28:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHIGY-0001cN-6J
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 09:28:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHIGX-000bGV-Bw
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 11:28:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ef2c33-e002-0a2a0a5209dd-0a2a4505bed8-42
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:28:33 +0200
Received: from [52.101.43.51]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ef2c3f-aaa8-0a2a45050019-34652b330ef5-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:28:32 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 09:28:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 09:28:22 +0000
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
 b=PodwrolwoghAIPPgI4NbBsKeOZx1JI2aO6kxltdLBpCUPLnRdDkUng+wmEja810R75+ckdlbdAwpw/jm27M3R8ppq39fxZTsll2vfWbaNsbIswjyiRbJ7aaKW7BRR7GriXz4HUZPARhx0M6Pukc0NakvOp5D/JzHQKRFfw0WLKPNGSqv4grOh+wsH+WSf+zj4nLm0GbEFX/+Fq7m1T1BEkLyjL/6uCnU7k1YuC3Jnt4PxbXDLI+CqGoyjnLj+fqmVPEngGMUTX6ot1DZrcmmHUba6Rgs/flRR+Y6F5YvRW7UmqXNiqKH9ZI2vpyieY9z1g4ZQyekf/ZJdz5J0zGx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUVEuANS078iwanolIFjuksttSocqy9RvJT1TwThFfA=;
 b=TDZtyDR81RBiWWOtJOV/ywmZjf3Y/vAUvpMRzKQgCASN7M7lOTIWBQo9WQdliYIZCRQtONs63xVN5fDS0tvcWtaeyJ9gfRp5GudgP2SzicKaUgSfIp9cNbndKTCiZ+HZX76nz/JNRhQ59Mn0ksOyzk8O8F2SV02VRAM38daP3/Ietldtp9FRXEYer2macQKX1MjZwUtwoUlxsixb6/G8+0JHycTPwF+3ylPOyzAOVpS1xROrGDipNyE1e4On9crrhbfGVlAHvZ5Vfz4hzp0DLiZJAeZSOWQLq/olFoBS3NlJH39fH7tSYx69jzTLkWdGlqvm2A1qNPVxKFoYVHrQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUVEuANS078iwanolIFjuksttSocqy9RvJT1TwThFfA=;
 b=lnD7B+olKQLar8Brc/E3g0kL+fuPJNn0znwxt2vf44PboR0llYCtPhwb5iP2VcdW/ix3d4eA+K+PcUXZmVGSQ84zIDIgW/Ke96ScVppYMMwAmO3/boxeq+9OriRT9CZtCwocpHR4J2k3d6YrTGU95McFvXGCKJ+zixYKKio3/+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Apr 2026 11:28:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/shadow: VRAM last_dirty tagging
Message-ID: <ae8sMiXAWjeXI3o1@macbook.local>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
 <8559db88-5f1d-4ced-980c-e71c4e229c7c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8559db88-5f1d-4ced-980c-e71c4e229c7c@suse.com>
X-ClientProxiedBy: MA2P292CA0003.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b789827-68f3-4881-908b-08dea43f534e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kWaP9J8h/RM49lrRcWUiuuOMdQagi+hblI4nqgiNNl3JfvbCTdmHO68Qtm3ljnrZw1OdLZhLvMFsy4fmrHa1AyZihsWCkURMtznbg65dtg2VEO0Ud9TabH/Jilh6i2t9t+jrnkGQttFNA//AyogJBAKmEcxphJjoUwxpUAac/wl58A2Gna6gRwkWnER8PELkeh06ekjxdWtyfC0SPPF+9A3K2YuVgglTYqYviiz2rIkegNh9IA4l1Q/b+8PetjKSe7BhxYkyIajQeE2beWvvlEKMVkV+McgAa1BrPZupQoaKncu9wwpsVoZgwh/9q6Al4rGhhI+Li/v2md9Pky0Hr3/rXZGFlIOGJSXhwpBWWPJxUpCrgOTQXp2moIPcEe3MeRmonB3+FHaf3H5EeAKUP1SMu1sA8hEkmVLSyLXair1+Kv34pMKGqkwAejQJ83PYd/+izsURhH57n7kxp4BfYvXxNUdDu20YJsr8RH4XTQrkzA7KV8610oTdUmM0A4lT8ZumRJk2tjoeVKj60cmGbRP7Nljlxj2JuepzO0Hn+oldGmsIrp7E9pnY2R7xELzLcbZIUqzIrZZdDwMHR38FrZ9yLaPJzdC3KzGIHdPf2q7bysbKbbsjPcfGswFijsFc+mQThrXLyWZILuwYjsHrWv0p19dN05uoAkpKkRJVF/5SKz794uyPsrNZq7Z4JXYezWM0Z3PeROwaPvlai7mICS77yaGSN3tOdh9psfKLybk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0RzV2oxcThCazFDVGJZQmcvUTNGWTlPN0dSMEMxWVJOTmcvWXhJdWUzc1Jq?=
 =?utf-8?B?ZGYzWENkR1J2SGhOS25TN0kxWTRxSm1ucEdFK3RLMkljTG1WU3YyVFdtK2x0?=
 =?utf-8?B?elZMQ1JFZzlTaTJ6N3lGcUNPUXVaMHNPVndDWUdmY205bjhpSFBFQXk0UCtl?=
 =?utf-8?B?SVBlZDVjVHcwelRudy81b1FMUXVsbU41clNybWhrNlp3d0xUenZ4VitjVTdI?=
 =?utf-8?B?dlRIUHRIV215amVvU0xLc2tJdGZKc3ovam9CeVlmWDh6TzV6bHd3blhTdnZJ?=
 =?utf-8?B?MnRCZ0xScm5aRU5nbi9CWnp6NDhYcmQwS2ZkRmIrRjBRbHdTdGgyc21wc2Vo?=
 =?utf-8?B?ZXZvZkRWQ3ZxQnkrRlZ3dzlUZTUyYkF6WHNqZjlsNkFHSk1RTE9vdkNpUGFJ?=
 =?utf-8?B?UUZFR0l4U3hzTTdjSktuRDNEWjIzNWNlSkxVMzZ4cWtkU1ZXYlhoS0phZ2wy?=
 =?utf-8?B?Q0FyMmRFL0VDNVBtWVVVOFZhS3JnSTZsdUxoc1R2Y3o4YXdrVHhIMTJ6a00r?=
 =?utf-8?B?U1AyOEdzMWFVUFpFck5veHBYSVZCSk5COWNnYlpvSVdYZHRpL21rNDlsc1BU?=
 =?utf-8?B?N2kvVHdSSmpTNHhDR3Bsd20vTU5BM0JSM3JuMVpwejhXSFdzdDJzOFYzVDdq?=
 =?utf-8?B?SUpsOE95bEU4Wm5YcExTR3FRU1NSaklJblpXbkovVFdwQkVIRUFSMFdsVGJG?=
 =?utf-8?B?SDNiNnlxSHRsOHFLYjdDRmJGV2w1MlFQdnBERzVZeHNFQndrKzZrUkx6QUVW?=
 =?utf-8?B?ekE5bHNuMFYxb0hYaFNtdDY0c2NKMER2YjgwTks5ajlEZ0FRQzh5R3ZzSW1V?=
 =?utf-8?B?UkxkVnZGa1NucVY4NzN3R29ZcHQ4ZkdTWFNidWE3RitpNjROM2dqbDNKVUlL?=
 =?utf-8?B?ejJCRjJIeXQvNFNiMXBPbEM0ZjRXSmhwSVFZckZWd3ozR240ZWFyMDlrSkZq?=
 =?utf-8?B?bEVEdlBHelFjQU5YcGdYN3pNdU0wL1BiVmErVDRCTUpsZWtLVVZhVnp3TzFq?=
 =?utf-8?B?ZU15VnB5SmVYZ1R5Qlg4WUs5Y3ExdWtETWUwcGRkaU91T1hjRWZsb2xiL3Zr?=
 =?utf-8?B?QkRkUGhwMll0M3VNcStrT29sK0pwQnlqNkhoOTBMOGVDaVBKc0FHMk14QVlB?=
 =?utf-8?B?OWhscnV6TndXUVV6ODNnMktWUmJpaS96bnFOVUhQOXV2MGxqdGo5VHlGYlZp?=
 =?utf-8?B?NC81QjBFZXA1R3p5ZmI2VnZKNHQ3K09YZ3J1czRsTGxLV3hVTjNndmc0SjRZ?=
 =?utf-8?B?WkowczNhMExlOVhlRmhFNWRESFJaUW0xWkd0RjAxQzgzd0ZLd1hSTGVyQU52?=
 =?utf-8?B?RWxmZ3dWTnFpcCtMTTY3ZmxsbnRtYm9RT2tFVmd3c29pUXlpemdUS0R3MlRQ?=
 =?utf-8?B?bU1STFRINHJzVDh4VFNVa0R0dU1pTDdnZFRwQjIxTDN6ZGNOTm8vZTE3dStY?=
 =?utf-8?B?aUJXQTR3YlBXM3QvM2htYkk4UitERmpoSTZ4LzhMb2F2WGlMb0ZNcHJKSVZQ?=
 =?utf-8?B?QktHamdhNGRLdEtqSytiRUNZODBMSGZWaE5iOTRialFHNHJTd3F6emNRK3g3?=
 =?utf-8?B?TjRTTmVQcTI3TGJUUG5tdWNCaGxuZ091YnUrYTNkb29TS3ZHQmxxSElkdjZm?=
 =?utf-8?B?bmh5cFhhM0d4eHJRRHNkVVV3REQ0ZCtBaHFKckIzd1hpK2Q0dFp6eVR3UTZQ?=
 =?utf-8?B?a0JkY0RTL3VuTno5RHBWT0lQTmd3UFRIRjFDTnVqTlBBVjJlQUhSNFU2T0Nq?=
 =?utf-8?B?Zm04d1p6RFo2amhTMk0zWitnZzM5eVdnSitIOUdxZUZiWGV3T242YzFlak9r?=
 =?utf-8?B?N2xqNW1XSnRvc1NpUC9BQk9QMXJqMllIM1JzYkRmRm94Y3pwUzVHZEhKNzVa?=
 =?utf-8?B?NWxITW1WSnZEWVlmSGZObWtKSnNCZXMrVG1zT01ZQUhWYm9rNWl0eGJoYkVG?=
 =?utf-8?B?RUtYV2hPQ1UvbDJtL1ZSS1ZBZjJ6RHVqRm9yOGFPcTFLeGRrVGc3NGUvL2Ry?=
 =?utf-8?B?Y3dLY09YaHViTU1lNlJJaDdta1RoODhtY25kNWVqUUxIRU1WRTMzaTFkU2Zo?=
 =?utf-8?B?aEtQRXhtYVJURGI3OXd0QkliUGc4MzdocXNtcWhScDY3V0cwWldNdGVNdFht?=
 =?utf-8?B?b0RvZDVQRTBzaG45d1dhV1pDdVdxRlB5N25RMUJLdjF6TVI0aGJlTWNjZ1BU?=
 =?utf-8?B?V2wrMWxEbml3ME9wWk5ZV2p6bVpvQlJqcWx1N2JXTjNkUHZ4WktFRkh1UmFH?=
 =?utf-8?B?WmU5RSt3NU8yVGl0UFV1Q1FtZVJOS20zRWJ5YWt5RzBhSngvb1lqQzkwVDk5?=
 =?utf-8?B?anlrWThLUkhJbFBFUEx1N3VLcHNxMVNOUG9xK2Z5MGNIZDF1dklmdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b789827-68f3-4881-908b-08dea43f534e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 09:28:22.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCbjE9QJASxC/FcSJAEBccy4D634JISYCokp/TGYjtsp18e1elpVtpw+/7aYLPC7mAsAN5Fni7z+1gCAwhW/SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6368
X-purgate-ID: tlsNG-c201ff/1777282112-E1DDB443-CDEB3C46/0/0
X-purgate-type: clean
X-purgate-size: 3589
X-Rspamd-Queue-Id: 52A4146FED0
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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

On Tue, Feb 03, 2026 at 05:49:55PM +0100, Jan Beulich wrote:
> ->last_dirty holding a valid value (one other than -1) is solely an
> indication of the bitmap being entirely clean. (The opposite isn't true,
> because of _sh_propagate() setting the field to a valid value without
> setting a bit in the bitmap.) As a consequence
> - setting the field to a valid value right after having allocated zero-
>   filled space is pointless,
> - copying the the all empty bitmap to the output array is pointless; with

Double 'the'?

>   the output array also having been allocated zero-filled, not even a
>   memset() is needed there,
> - after restoring bitmap contents when dealing with copy_to_guest() having
>   failed, the field needs setting to a valid value again.
> 
> Furthermore invoking NOW() in perhaps many loop iterations of the main
> loop is wasteful, too. Record whether any bit was set, and record a new
> ->last_dirty only once, after the loop. Then use the same NOW() value also
> for the subsequent check.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm/shadow/hvm.c
> +++ b/xen/arch/x86/mm/shadow/hvm.c
> @@ -1087,18 +1087,18 @@ int shadow_track_dirty_vram(struct domai
>          if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
>              goto out_sl1ma;
>  
> -        dirty_vram->last_dirty = NOW();
> +        dirty_vram->last_dirty = -1;
>  
>          /* Tell the caller that this time we could not track dirty bits. */
>          rc = -ENODATA;
>      }
> -    else if ( dirty_vram->last_dirty == -1 )
> -        /* still completely clean, just copy our empty bitmap */
> -        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
> -    else
> +    /* Nothing to do when the bitmap is still completely clean. */
> +    else if ( dirty_vram->last_dirty != -1 )
>      {
>          mfn_t map_mfn = INVALID_MFN;
>          void *map_sl1p = NULL;
> +        bool any_dirty = false;
> +        s_time_t now;
>  
>          /* Iterate over VRAM to track dirty bits. */
>          for ( i = 0; i < nr_frames; i++ )
> @@ -1174,16 +1174,20 @@ int shadow_track_dirty_vram(struct domai
>              if ( dirty )
>              {
>                  dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
> -                dirty_vram->last_dirty = NOW();
> +                any_dirty = true;
>              }
>          }
>  
> +        now = NOW();
> +        if ( any_dirty )
> +            dirty_vram->last_dirty = now;

I'm a bit confused with the setting of ->last_dirty here ...

> +
>          if ( map_sl1p )
>              unmap_domain_page(map_sl1p);
>  
>          memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
>          memset(dirty_vram->dirty_bitmap, 0, dirty_size);

... as here the bitmap is zeroed, and hence ->last_dirty should be set
to -1?

> -        if ( dirty_vram->last_dirty + SECONDS(2) < NOW() )
> +        if ( dirty_vram->last_dirty + SECONDS(2) < now )
>          {
>              /*
>               * Was clean for more than two seconds, try to disable guest
> @@ -1216,6 +1220,7 @@ int shadow_track_dirty_vram(struct domai
>          paging_lock(d);
>          for ( i = 0; i < dirty_size; i++ )
>              dirty_vram->dirty_bitmap[i] |= dirty_bitmap[i];
> +        dirty_vram->last_dirty = NOW();

I think this is doesn't deserve a 'Fixes:' tag because the setting of
->last_dirty unconditionally to NOW() regardless of whether the bitmap
is zeroed?

Thanks, Roger.

