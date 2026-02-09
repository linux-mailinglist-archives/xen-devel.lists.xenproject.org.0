Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEq8NN/1iWl7FAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:57:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C58111461
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225559.1532089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSha-0001Pb-Gj; Mon, 09 Feb 2026 14:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225559.1532089; Mon, 09 Feb 2026 14:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSha-0001Mi-D7; Mon, 09 Feb 2026 14:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1225559;
 Mon, 09 Feb 2026 14:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpShY-0001MG-Nm
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:57:24 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2eb7282-05c7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:57:22 +0100 (CET)
Received: from SA1P222CA0039.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::12)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 14:57:16 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::a2) by SA1P222CA0039.outlook.office365.com
 (2603:10b6:806:2d0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 14:57:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 14:57:15 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 08:57:14 -0600
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
X-Inumbo-ID: a2eb7282-05c7-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JD45f10Qjxn1XpIaFNQknmAqeSA3ZAqH5HBTzg3Xxm7kKlY029Sl++wB955AVmq/snCtIv4ZLX1Bhchh7lgMkeD4PG9M+8B7LLBIwikFSv2O9wzHa4qqqSHO3JElPHWhr+fF3wV3muPqR6d43VE2AxPUUn63jMSkkQztI4NWHKWhCie77re7oyedQaPJQXdVzHMtaJUMPLU4KC5kt34FuUPSbV6zRIC6YKhdBmkSqEDkgBGFEacHtiJi83nDSKVxisGKCvKMY8isISS0lp2N3A5ClNO8drDIwyyY0TzgfWPKu29Jjz2CthTjd4AIlWLRR2cxERgmiwPMynkVgulmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MaOyptQHlRKwqMZqT+mE2C696UimjYruyVkbjwRA7k=;
 b=dtXbIG+0iyQKR/QsKi94MLGPUSDEqKQ9FT7qlsRMOWyPtNNfRlFmJ8mOYhAY2zi7w99YHVFmt5C/4jRGle3hAzIZUuFlR+9ZROfmebx/R6pw6ci5fhg+GelmdytgMlbtWMAG5qI28aUQwfV45PyUcrM52994xoqpWmVwGVHc57Llsgnws8Y9KpZyz1pzgCsxtZn5y2oNmRWpX5i7Ipc5KIdeSJPPMel2CTBPmC2LyPFlOnbgJ7vaHY5+RHJAK+8EJeNbSXlWdu5F0wOs8VxWegEy5qa7edMoTBDylrETEUslkp59n64GqSu6YraoeOuCvLZkkCVa36210oL8sDDcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MaOyptQHlRKwqMZqT+mE2C696UimjYruyVkbjwRA7k=;
 b=UY9C9tVAVfgfpvMr9ibId5YwKQP3bav/jEwZX79WqblEpXQFWgZEeJhnpUQ6AtLRGyQcS/5V9oKtzWPODsMg3cva1W0Imp5UXHzbOoXbvnkmm5HnFf4kBPeUWW6f8kxsnhIcrkRnm+5s3kTT6Y3jfsGKM3XHKBQeZw4Rsfkfanw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 15:57:12 +0100
Message-ID: <DGAIP3VHPCST.1K994JSQW3LXH@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/kconfig: Reflow the SHADOW help message
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260209103339.6466-1-alejandro.garciavallejo@amd.com>
 <6779b2e3-c324-481b-ae20-20a40fb1eac4@suse.com>
In-Reply-To: <6779b2e3-c324-481b-ae20-20a40fb1eac4@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|MN2PR12MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2c20bb-a8a7-4b68-ce84-08de67eb83a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWIwazF0UUV6WEdRc3hydE9sNFF2SDdkRDVwTUh0RmhrWnoxMWlUOExmTGJR?=
 =?utf-8?B?OGl4bDQreWIrdmx4OUhqYVlBR1AvSmZKR1ZXM3N3OHcxaEFOUS9YNk1lbHdi?=
 =?utf-8?B?bkI1N21OeXh6aVJwRjh2eURXVEprOUNndWFvbTZzM1ZKVXdVNDZYcFpvTGR1?=
 =?utf-8?B?ckhwdkNkdko4YUdGZ0VmNjJtZmpyU0Zwb1NoaTV0N0pyRHZlV3FGaW1CYXRB?=
 =?utf-8?B?ZmdMSWMwb2tvVHZ6UGFMSEpFWXRGV1FRaHkxeTVNZ3VEaGErdzlFUzJpV3Qy?=
 =?utf-8?B?MW9zTTRzQ251TU10UHVDbmNSOVFHVVR4dVAxeFhVL01nd2pQZVd2dHMxcHZv?=
 =?utf-8?B?cTRIQTMwOEhzNUdnMnoyYXV3Ry9TdmxNMEdKdVoxZWJ1T3BYZ3BzZzVLRXYr?=
 =?utf-8?B?TlA4L253Ym50TGJVVm1Tam5oaDhoOVZPMUg0UjVuenkxcG5HNnM1eUgxLzN5?=
 =?utf-8?B?UkpmR2xkZkRPN20wWkVJU01wTU03aXdTTFFFNkJlaUQrb0hvUXV4NWxtekha?=
 =?utf-8?B?S2FncFh4YkE0RWxwRk9hbFlvczBEcGJBVTV0Y0lzeVFzQlVlOGhtK3pYL1Vt?=
 =?utf-8?B?NHdxL2hpZWVES3hPMUhTclpmeU1NVmJGWTlhdjA0VzR2YjFaeDZNVGFXYUxZ?=
 =?utf-8?B?RS94SnFGT1ZOMEVUZG1iL0JUOVBVQnhmZHlhbDV2NmIwMEZ5cWdVS1VIRW5p?=
 =?utf-8?B?ak9vdklmSzV0bFpablBFdDVFMjlMSTg2SkJ5aUdjRTlTQUFTY2c0LzZEZEEy?=
 =?utf-8?B?WVUwaEQweHB1bWdpOHNlbXJBNUt6Z3dIenIvMSt4SVBKNnBlTWpJMWxjdVps?=
 =?utf-8?B?ZTd5N2k4blhiNnlHQVRaMmc3WWR3aXF5VjFhckdhMzRZKzBCbHFnN0p2aFBT?=
 =?utf-8?B?aXJ3bnc2dUJVQ0dFajdab0l4MVRPVHpmUUhQc01SVmhpUVNRNHQ5c1o1WDBj?=
 =?utf-8?B?ckNjcGgzVDhOUUUraFhxeUljblVkMUZzbFo1REtyYzV1WlJRbitXS3JVQy8r?=
 =?utf-8?B?b3ZoMGp5Zlk0bGl0cm5LVngwNVRYS3FmMmlacy8xUHEwN0ZVVG84Wi9lR3Uy?=
 =?utf-8?B?ZHBlZW04VUlkR2t1U0lUcWxLYmNaeHhETXdCMm5sK24wajdSVDZCSVl0dnU2?=
 =?utf-8?B?NUwvUWlkKzd0TTBtejRrc0Y0akJsanBCaElCM1pXaStValpOSlpCeEg3VTdw?=
 =?utf-8?B?MDFQUXJ4SlF5S1duRUcwRTV4cnRIbFpIYURvVkRiMzJxSnRlNTg0UTdaSWxx?=
 =?utf-8?B?Kzd4YSswYUxUZ3VlYVZCd0VmSXJOZ2tkQWlZSnplK0M2SzYyT3h2RlpqRlg1?=
 =?utf-8?B?Y1Qva3hkY0hLSFE3MEVXQUh1OW52M1FUSlpQMHE4RzJYUkk5QldpZHorb0RP?=
 =?utf-8?B?QUhNMmozaE1xd2xHQnJ0b3RMRGZKNlFSd1VUOVhVZm0rbU9NTHlSeGppQzdu?=
 =?utf-8?B?QWFoWitONTMxSUppdFlnVnBzcEpBMGRWZkVQSFZTaGZvZkJnUGhQZHA0eHZr?=
 =?utf-8?B?b3hjbjRXVVYxNHNzczFGdWNGTDZ6ZFIrUFVwS3FvUlF4aDZyM1AzVzRmQUhB?=
 =?utf-8?B?UUx5SE8vVWVXNGhPeEtXRHNIeHMyTkdoZENoTXlxb0gxQjlBR1E2QVlwK0ZR?=
 =?utf-8?B?amlyRDUrVXJaUUZKaVovYnlxbUNaaGVJcFA4dEcvRnJFQXpoQVlGOW5reG5R?=
 =?utf-8?B?WVFEK2kyMTlJVC85dUFYRUd5Y1R0ekJWb2VUL01vL3JHRmhENHNaak45SnI0?=
 =?utf-8?B?VngyUVlzTzA0ak5wNFRDdkN5cUUxUnRaVTJZeFoxMlhSVUJBckpLL2p5UUQ4?=
 =?utf-8?B?dzJ3bXRrTVN0QUdsSUhHK2c4NnY3cGVrZldJWW5rczVTTXYzSlhVM2tUT2Z0?=
 =?utf-8?B?dEtNNzhjUFNoLzlscThaUk9uamtiWERyU3Z5MjJVenc0ak1oMkJHSUxrNGFC?=
 =?utf-8?B?b1pVS09PdjNTa2xmamkzSW5hN2FHSmV0a0ZMNk9ISVZNMzAwL2QwN1EzVEpD?=
 =?utf-8?B?S3dqMHJXRzg0bzU0YjZ1akx0dUJ3UzNwaEpzWmZVNGxBR3ZNT0JZckhscmpD?=
 =?utf-8?B?eWFURVo3SjBsK1hkQnJaeVNaTzcvVUZaSE9BYitWYTZrcWxLaXY3bDhCVlhT?=
 =?utf-8?B?YjE3SGJ3STExbTlhK3FtNFNGRjJ3bVM3QXplZkl0cmRpcW9kOG5KRU4xMDd3?=
 =?utf-8?B?UVF3d29GTXNseUdtdUZxZlJjZUhpTkoyeit5eG1zZlBleUFMME4zTzhYdGdH?=
 =?utf-8?B?ZUYya2R1eHBDQ2w0c0NFeTlkYkdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YmK+fe9HGD05wTRdPfF713/05PtbjxmFOqhdvbvxpJv5NUc1/GAa+EWUivmwUZ3SuEs0u+HdBR/phsmKp/ALEIaoeYeDdcJYPM/qXDDIu1J7Kns1Tilqu2SJMMJ80IThf76YRraskE1zy0ajNhPf9eCVxrSpsUl9CI+gVWXmcqjpVyiCbsZJVp8rVMsbTgXZfalLziL9Hs4+IVaojm6l8RzwbYJ9dg98fvjxmoM6Rc7BXbAwNOZQoEuQcAbQhX+8KbzfWmzhuLkXcluyKQq756Hi696mMKh9Z9C5Wly2E2SD64Owvm3S8FpHCPYEcqyQ1N1z68Lm/b5q4NW34HrnPMnCu3OFkour01N7UPstLtWzQqsUVz8uN8fjjg2hGDFkqW7+o2AuZuEyO7OqidVH2uNzObgEB9V7DlExjZBj60nRvugdlOJyJl3TPXRlANAa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:57:15.6307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2c20bb-a8a7-4b68-ce84-08de67eb83a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 46C58111461
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 3:26 PM CET, Jan Beulich wrote:
> On 09.02.2026 11:33, Alejandro Vallejo wrote:
>> Wasn't following the tab+2 spaces convention throughout the rest of the =
file.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> Largely:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -148,20 +148,17 @@ config SHADOW_PAGING
>>  	default !PV_SHIM_EXCLUSIVE
>>  	depends on PV || HVM
>>  	help
>> +	  Shadow paging is a software alternative to hardware paging support
>> +	  (Intel EPT, AMD NPT).
>> =20
>> -          Shadow paging is a software alternative to hardware paging su=
pport
>> -          (Intel EPT, AMD NPT).
>> +	  It is required for:
>> +	  * Running HVM guests on hardware lacking hardware paging support
>> +	    (First-generation Intel VT-x or AMD SVM).
>> +	  * Live migration of PV guests.
>> +	  * L1TF sidechannel mitigation for PV guests.
>> =20
>> -          It is required for:
>> -            * Running HVM guests on hardware lacking hardware paging su=
pport
>> -              (First-generation Intel VT-x or AMD SVM).
>> -            * Live migration of PV guests.
>> -            * L1TF sidechannel mitigation for PV guests.
>> -
>> -          Under a small number of specific workloads, shadow paging may=
 be
>> -          deliberately used as a performance optimisation.
>> -
>> -          If unsure, say Y.
>
> I'm trying to establish (among the committers) whether we're indeed meani=
ng
> to drop this sentence from Kconfig help texts that we touch. If I wouldn'=
t
> get conclusive feedback, I'd likely put it back in.
>
> Jan

Sounds good to me either way.

Cheers,
Alejandro

