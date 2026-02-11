Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ll7Hhh1jGk6ogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:24:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19221242C3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227433.1533820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9GX-000065-Vd; Wed, 11 Feb 2026 12:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227433.1533820; Wed, 11 Feb 2026 12:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9GX-0008WC-Sk; Wed, 11 Feb 2026 12:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1227433;
 Wed, 11 Feb 2026 12:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq9GW-0008W6-N6
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:24:20 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9574ae92-0744-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:24:18 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7166.namprd03.prod.outlook.com (2603:10b6:a03:4f8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 12:24:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 12:24:14 +0000
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
X-Inumbo-ID: 9574ae92-0744-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/3jnqMFdCMf/DzYtHEsQrCy7IVt772P6xvFreCf30OktWOJtXYI3bCMFeWF6FXhTbyzmqtVuqORt/rhXe1Bynf+cbWNb+ebEO/bO8/ZXlHQNVZf/uUlYqJkvBg0sX6HsIOtSoE+RDaSQCcqoBDCtiJzEJ3NzGgFRUZVG533dAdnkWikDlDNDn5XVqSFidypSCdOGPDykCWz9niYurMyVq7YxYEDkl+MouHmm7B5bPl8qkYQa0SzXMpfoQimcNEcLDim7+r30kqbQzckgncFfU1vqF/05PK9MJTCSeEBmQCx6/KFww+X4ccXuQHa434SOVTEomXAHGL+RVN0fgMkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe8nDJkQ063EUuKX9Kgyms4o9znzSot29vNm7q0yrkI=;
 b=Udb20abHl74KMc5fsBfzCK/9dHJg1P+opt9qN2eGCgYlxxScvAL3gx85+LMAWgB9Mrd98nb5s6GUMsKfcy3pUmbnCpuKa6swDGk4z+gVcay8yAe7jp+Kbtw94CNsskDkW+Nal1Meb9sBTDaRiYgu7gOEhpiuZDa1h5yfAbQjnU+G9vKktTKg0Z1oi5qUb4e23PVGxuLMzSvLtqYctKUt2yiuj/xnXJPiFFn64MmIfFJX6RsSFkNE+WeVadxgvyFo+waDX+UYSqvySqRK7/7CGr/TpRae3WlwFnB1TXWbi/uuqR42SdTIliXl5i3T4UHMV+SVsnSTqCme0u6htHBHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe8nDJkQ063EUuKX9Kgyms4o9znzSot29vNm7q0yrkI=;
 b=KXpir5ikOJOUtyZmT58jUDEr2YGUCSb+ktbTNWBSXR4Rr1cIS2jmkYP/pkznX4/dQ9mu8EmNW3llpzUvLkdgwMO09S9nYATOQNJAOjACakrtMJF647XAgDexx03ytPQlv+VebMzCBtBPKZc3T3ddD9QHP8opeMrvOXW7ha6AkJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 Feb 2026 13:24:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] xen/tools: remove usages of `stat -s` in
 check-endbr.sh
Message-ID: <aYx064WIMMNmLAza@Mac.lan>
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-3-roger.pau@citrix.com>
 <35bdb10b-d39d-4e67-9ed8-c0b85ca5bd54@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35bdb10b-d39d-4e67-9ed8-c0b85ca5bd54@suse.com>
X-ClientProxiedBy: MA3P292CA0008.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: bd188171-c044-4916-76a4-08de6968782c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzQxYXYyeHlpWmdJMFdRYllaZVdnUStpV2JwWURPK000ZTU5RGZBSHVobzJr?=
 =?utf-8?B?dk50c2pGUkFEbDJQcDFsa2pjbmE3RlNNbWlpMllXUkVKK2pOcWdqc0JXK3pn?=
 =?utf-8?B?TzNVc0hrS0FlV1JLVGtNSXFDTG4yU2d2cE12dUwrSFNoZU1ZQ05LVFpxWE8r?=
 =?utf-8?B?ZzNXbHU4cWkrZGRrc1UxdjcrYlJCSTFKalgvT1lxQXZRZnpnT3FOQWI4MnBD?=
 =?utf-8?B?NjF1bkJGeGJLQlNVM3JrSnpjVEFCR1B1STNIOVdBdmdXOExsQlowUmlkdmV2?=
 =?utf-8?B?Wi8yL01tTDFWbXo2TnNaaTBSOS90UE4vODB4cmhWN3NCNnA1T201N3pwZkow?=
 =?utf-8?B?UjBzOEJPV3E3QlY4cWpNb2RjRVRXbnVibFNRUzlBby9yK2RMVkd5UzNNN1BI?=
 =?utf-8?B?V2lJNzJ2UGVHdVdSdWF2TkZpTGNuYkFpdHQzMHZTZjErL3FBeFJLY0VERUpP?=
 =?utf-8?B?Y0N2K3RwL0loTVFUN0FkTFMwWnFPMEZMWnVaNjRXUndKdCs3MGh2dkFaVEpE?=
 =?utf-8?B?aUVJMlFQVmQwT3Q3a0R0WWRSN2ZpOHVSS21BTEd4TXN6STN5U2s4K3QxMHdN?=
 =?utf-8?B?N0I1bWNrYUo4WWhmVnBJdXNSWU9Yd1U1T2ozYURKWWdiN1NFNXJiZEsxcFJw?=
 =?utf-8?B?d09JdGQ3Zzd3UUNSWTZsSVNPcXlIaFQ3cTdrVEZxQXAwYkcybVlLS0xIZW5E?=
 =?utf-8?B?TksvaCtXWnlzdUJXOFl0Y2lqT0NzZFp3NlNSVmpJMno2a1NCcW1TYi8zR084?=
 =?utf-8?B?TmRCdDVrelJIYUVQVU45T1lERFFZU256bTRDNG16R3VZM3FiWVQzNzBTanFC?=
 =?utf-8?B?TEdhZXNGNE0wQ3BpTFpiZ0dha1lIMFJtaExGUVlHbXVtOHh4c3YySmptVkw0?=
 =?utf-8?B?RkNSaExKanI4c0JwTjdTK1dvNGc0M0tZRUdsNjA0eVQ5OHk0L3U5OUc5SWZP?=
 =?utf-8?B?RkRNWEhLSWJjcllFSW16TDJOeXdDRlZnUkNyeGZkMHordWZ6UDB3eFh1bTcz?=
 =?utf-8?B?WkFjdHU2ZjhjN1ZKalNXRXRkMm9sNk5WVWJLQXhJcEEyd0E5a2g1WXpteExP?=
 =?utf-8?B?cGJmcnJBR0JNUllZei9rSmRDSkhVNjk4MHVUT29pUDd4ek9sd210OGZOQmVK?=
 =?utf-8?B?SzlKTFp5d24zZzRWQUhjemt1Tmc5SWd3Z3dyRVloMjBOL2ZNWG9vMGY5QXhK?=
 =?utf-8?B?ZTVacWZzUHJWT1dZOG45UXhDenc4Tm5vTWV2VmpuV3VVV1k1eFhtRmVwd09L?=
 =?utf-8?B?YW9MWTNnekt1WFA1ZHZCWDJYd3ArbXhMQUd3MDk2OEdNMXpURXNJYjk4Zlhj?=
 =?utf-8?B?REpvWHU3enNwdEkvWmdYaDE5SklpWCtvUUlBcFN3VExGR29jZkpWYlB2cFhV?=
 =?utf-8?B?SnM3UmpZOGRjUVh3dlpNc3lTSEY2ckF3alJ4ZWt4d3VrVEQ2WUNXSTA2R0px?=
 =?utf-8?B?VU5UNzAvRnNIWDU1Qzl4Zk8vemhRalhWZ0NRZXBSWlJwVit6UUFGTXlLV2RB?=
 =?utf-8?B?c1hpeEZZczlmWXRHK0NwSzJnc2xhdHNlYjdFS1duQWZ5RUhOZUxNZVlwSFND?=
 =?utf-8?B?R0NPR25RZDlzRERWMTJLRVI0aGlDZysvSVNhRlR1bkpWeTM0ejF3Z09QRlhQ?=
 =?utf-8?B?V2UvUU9acENxczArRFdoVStlaVFjWGMxVXNMNUtMUW5HMWRoNDQydTg5UE1N?=
 =?utf-8?B?Z3o4M2R0UWFNNXlNcmc4d1ByalFvVFdGS1BGSEJUTitKbGpSSmw2UytRVTNZ?=
 =?utf-8?B?eVR2L0hqdlpvd0RjVkVEM3RIallRWXR1YURFdjA5ZmwyeGNPZzV4TFFDTWM0?=
 =?utf-8?B?dkFxMnA2cUtGSVRsR2FJQ0xDU1c1Y2tWYUpGOE1wdENqaWYxZGd3dStUamFF?=
 =?utf-8?B?U3puWW5nUmNqb2dDaVMvNyt6WDVLK0FGOGR1b2o0RzNaU2RIbFN0a1RUM0d6?=
 =?utf-8?B?bHJKN2taaXNjZkZpcmN4WnJWakxsVm91dEE0TWlNUTA2UWtjSzRseDlORDBI?=
 =?utf-8?B?YlBTa2J2VlZMSDVkeVI4cW5EdFc3UTdweS9SSU1reWw2eDR1OWlKS2lzSy9w?=
 =?utf-8?B?aDRBd2tvWHl6Q0VIM0ZEWVUvQzFDcDFVQ3ZwWklTdTBXZCtuRGxDcXh6SHZM?=
 =?utf-8?Q?qvx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1FZaDhjUkI4VDRHcUpkVWx5cGdqai9WMWVWdWY5S2k5UGtmTzRoMi9oZzBC?=
 =?utf-8?B?YUYreTNNUEdiM1g3MWxiejh0Mmo5MWRzTVNRdTFPVm1CcG1IaFZsNVR1N29G?=
 =?utf-8?B?TkU3aVFrdEpHcnhXczd3U0pDYlNLZUd1SUQ4bjNPY3JDbFVTVjI0aVAvdmpx?=
 =?utf-8?B?Myt2Q3ViVUxZcjhRYnV6U1orVFlnS2lXdEF1a2NNKytldTZFVW8wcXlhNnJp?=
 =?utf-8?B?SG4wcU0yd3lyY0lyYzY4VERXbUdnVVRKQ0pxR2RlenhqZllyQm5wRXAvb0Uz?=
 =?utf-8?B?ZGJMM091L1l2elNhUVdsOVpYM3Naa21uMmdSVHNIOU1NL3RVSkxKMHhCOHR6?=
 =?utf-8?B?UzVnNkg4cnhHSEIwSXZSVUVMR0pQSWEzT0FXZkp2NDQ1NW02U0M2NEhCYUZN?=
 =?utf-8?B?dnkzYXh1QkNWUUdKMGRVL3llWUpuNUJkTzRMcnNJalMxaG5oLzBla3A5eUJt?=
 =?utf-8?B?d1dDQzlaTnpPekJwdEZldTdKMndmZGNqNVVtZk5MVXdkbUdSYzQzZnRDWG9H?=
 =?utf-8?B?VjJFTGxBWmY1SzIrOGRMcjZGZkhrNzI1akZwU1VwNjhGWmthZWh3c2hlZnlU?=
 =?utf-8?B?b1lDanFrYjNOblplQlEvVjEyK1VUUEFnQjJoR1YwWlU3U1VpdnM1RnJOdnNq?=
 =?utf-8?B?OWErQnkrMy9Ra2dFTXJaNFRkMTFNdFBOVmh2L0VMc3UrbnlXV1lWaThTMTk2?=
 =?utf-8?B?clp3NlFBRHNtMWZSQXIzTmhQUWFoVmFKTk56ZjR1K0JkVG96N1Ria0hnZmNU?=
 =?utf-8?B?WFEzYXpIYi9ZYWJQOEpYVjZkeFNnNHRFU040NU5jZnVRcVF0c0RkaEV4bFVU?=
 =?utf-8?B?OUlMQlM5Y1pES3ppdUlhWEFab3dvd2x2b0pVaU0yNWdRNkpWSWxHdDNqd0Vt?=
 =?utf-8?B?emNZTzZmYVBJcUI0T2FPKzROSzRVNkltVkRXQ1B6bGIzTmxmbWh5eEVvNlFL?=
 =?utf-8?B?b0JENTdSWjdpbmk0R2lqY1AwWVR1TDBwYkEvUzJFMk92b1Z5NG1KczZLV21H?=
 =?utf-8?B?QkROc2NvNE1kVDVBTXNoM1NYNWZxQ1JvK2ZkbEpTdXJOVzc2ZDB6R3poakVJ?=
 =?utf-8?B?Tk4xMm4vM3BnKzRraEUySEF2NVF6NnNqUi9scER2V3AzQkVMS0ViMUJlL1JZ?=
 =?utf-8?B?TUxaaFJ1bU5xZ1IzcDJFUklNUm9tNm9RN0MvM09zTkttdi9HNTZrenZrU3ZK?=
 =?utf-8?B?Sys3OEh1N1hubkFxcUluU2ovaC9HMDlwOTJzWld6NVlXaVVhd1oyQStJeVV1?=
 =?utf-8?B?WnVDczhkTWdmM2JpMDZqTDhVamF2QXdEUXlmc21lbmtHaGIwKytCNitRWnJ1?=
 =?utf-8?B?ZmpoVndaN0xleTBBa0pyajJrd1ZoMUdTbTRTeGJIcGZzZEVXc2lVaGpmM0V1?=
 =?utf-8?B?SHRYNkp6OG1SREdscmJkVFhCclVWbU1LSzB2QWI0dENTSnJuTEd5UEIzMlFP?=
 =?utf-8?B?RXBUNjFJNVdxclVLWFhGSmUvUlZQdC81cWRyR2VHK0piQTAzZ1RmMUlPM3N4?=
 =?utf-8?B?bzQ0WlVrWWpCRkEwVXJJNFJuL01IMkYwRkZCRVNiY2thZGFsenRabzdrT0s0?=
 =?utf-8?B?d01zM1cwbVdWcnpjK2ppUXFUalBxUllyOWZPeEdXdWhSNi9lZU5hWDdLMXRm?=
 =?utf-8?B?RnlnQ2plcG5QL2tHN1NpVHEvcnJSa3hVYnpvdkZGSVlzU2NoVDFKUHJKenZQ?=
 =?utf-8?B?NGxiQnYyL3FTT0wzbFFpaGo2TmJ4bnJtYmJWYnZvL080WXdmcDFVSDBuSysz?=
 =?utf-8?B?MjRFaWxYZ08vamRNS1dlMFFLVzJBb1AwYzZLeHNWUnI4RkRNRWY4YXhzNm95?=
 =?utf-8?B?Ui8yVGcyaEQ5OUtkU1orbTBpdzFKYjAvd2xXcmNZYU1QN0ptREp6ZXVNV0JL?=
 =?utf-8?B?UnRIMG1GR2hpd0VEN0w1blBlMkNSeXVjeTVoaWdRQ2hjYmtId0VGNkFxNmFt?=
 =?utf-8?B?eGNVaGl2NTlTR1d4L3A3QkJnaEpHYmlYTHkzanRFTEN4eisxK0x0QjZPSElE?=
 =?utf-8?B?RVUxelVkSlR0dk5kQjdvUzhvdnNPN0dQTUFzdWZmQjVzUVF4eUx4Z3kxTURr?=
 =?utf-8?B?SlFCMTB6ejVJMTR5WnhyZkk2TzhQaXdJeDEzbGUyY2hKTlN0dEFxWE05dFpr?=
 =?utf-8?B?Ui8zeHRLb0tGL0Q0RVUrZDc1Z21KVkxpcmpwYS9ZdVhYOEQ0YkdJYzlWNGJ6?=
 =?utf-8?B?STYyM2c4b01MMlhZOWlmQjJWRmQ3Y2JZenpGc2dRNDdiaFpQMFJrelpYcVNH?=
 =?utf-8?B?dXBENnZyRlJDbDNOVFJRSTZUZzNWN2xPUldGUFBXS3ZObU53Vjc1bXdUY2ox?=
 =?utf-8?B?cVVWRVBacGh0OVJIOE16MmhVTk5RRWZPM1hrUjBxY3RCaTBmVmNsZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd188171-c044-4916-76a4-08de6968782c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 12:24:14.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6MYDfg9Qt1jGDdOjirUgY99x/ZB6N6u7t5vxmGrikx8G416PJl1rgBarPEqINaOZLQ29BesJHehMy1+s1jPWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D19221242C3
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:40:58PM +0100, Jan Beulich wrote:
> On 11.02.2026 11:46, Roger Pau Monne wrote:
> > The `-s` option to stat is not POSIX compatible, and hence prevents the
> > check-endbr.sh script from running reliably.
> > 
> > The first instance of `stat -s` can be removed by fetching the section size
> > from the output of objdump itself, which the script already parses to get
> > the VMA values.
> 
> In both paragraphs, s/-s/-c/ ?

Bah, yes.

> > The other two instances can be replaced by counting the lines in the
> > respective files.  Those files contain list of addresses, so the size in
> > bytes is not strictly needed, we can count the number of lines instead.
> 
> Hmm, indeed, just that ...
> 
> > --- a/xen/tools/check-endbr.sh
> > +++ b/xen/tools/check-endbr.sh
> > @@ -92,14 +92,15 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
> >  #    check nevertheless.
> >  #
> >  eval $(${OBJDUMP} -j .text $1 -h |
> > -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
> > +    $AWK '$2 == ".text" {printf "bin_sz=%s\nvma_hi=%s\nvma_lo=%s\n", "0x" $3, substr($4, 1, 9), substr($4, 10, 16)}')
> >  
> > -${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
> > -
> > -bin_sz=$(stat -c '%s' $TEXT_BIN)
> > +# Convert objdump hex reported .text size to decimal
> > +bin_sz=$(printf %u $bin_sz)
> 
> (Alternatively without this line, but ...
> 
> >  [ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
> 
> [ "$(($bin_sz))" -ge $(((1 << 28) - $vma_lo)) ] &&
> 
> ?)

Isn't that bash-specific functionality?  The script interpreter is set
as /bin/sh.

> >      { echo "$MSG_PFX Error: .text offsets must not exceed 256M" >&2; exit 1; }
> >  
> > +${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
> > +
> >  # instruction:    hex:           oct:
> >  # endbr64         f3 0f 1e fa    363 017 036 372
> >  # endbr32         f3 0f 1e fb    363 017 036 373
> > @@ -116,8 +117,8 @@ fi | $AWK -F':' '{printf "%s%07x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' >
> >  wait
> >  
> >  # Sanity check $VALID and $ALL, in case the string parsing bitrots
> > -val_sz=$(stat -c '%s' $VALID)
> > -all_sz=$(stat -c '%s' $ALL)
> > +val_sz=$(wc -l < $VALID)
> > +all_sz=$(wc -l < $ALL)
> >  [ "$val_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty valid-addrs" >&2; exit 1; }
> >  [ "$all_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty all-addrs" >&2; exit 1; }
> >  [ "$all_sz" -lt "$val_sz" ] && { echo "$MSG_PFX Error: More valid-addrs than all-addrs" >&2; exit 1; }
> 
> ... the variables' _sz suffixes then end up a little misleading. Not sure
> in how far we care. Perhaps not enough to warrant the bigger churn:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> (with the description adjustment).

I could rename to _lines or some such, but I didn't see much benefit.
If you don't have a strong opinion towards renaming I will leave
as-is.

Thanks, Roger.

