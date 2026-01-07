Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A426CFD3C4
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 11:43:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196659.1514414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdQzn-000422-3y; Wed, 07 Jan 2026 10:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196659.1514414; Wed, 07 Jan 2026 10:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdQzn-00040b-0c; Wed, 07 Jan 2026 10:42:31 +0000
Received: by outflank-mailman (input) for mailman id 1196659;
 Wed, 07 Jan 2026 10:42:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGs=7M=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vdQzm-00040V-16
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 10:42:30 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df7623e-ebb5-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 11:42:26 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BL1PR03MB6022.namprd03.prod.outlook.com (2603:10b6:208:312::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 10:42:22 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::4af0:a6d4:e568:ac0e]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::4af0:a6d4:e568:ac0e%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 10:42:22 +0000
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
X-Inumbo-ID: 8df7623e-ebb5-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeOXdQFJTa2TDDxynChQrKNt9VU6AT85FJE7zZj00a7Nul49c3YonR4EVVTScVbaP9G1UdDki388aXgfFdo03VUumeyG0GQTHHkOuC0aPheMojod99r5MwZznkJI/OH/L9B9dXocLbXLF4hDEko/CyKG+6uFh2W5eA3KxR9yqxVYj3VGh0kdyPWhLGh0vnv6EeOGwHxhF7tXJRovUYbbFrlDKf9QsxPIrAT4M0Yj8tEI1loBBwUOLsn/z8+SrSdyLh4VOh02Y0ak/9yQCFyKcVN9XZm308CwBn7GoEIROcvA8SXDHb7Leiiolfhu6K9Oj+5zchT1bUJSERDZbXwNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF455ridIJIOwrXs7Eu8RJ5A454cGJPrSBMOt+Y9C4o=;
 b=scYj990GkY/OQnb99Nv8bTW/RAWUwfHDO8TaPcfbjy2PdVJZVSFc3sY823maM1E0T/Z6AnezM78tWSFRIy9s/Em0NxIkNwJe3yrSDoeYrFrtQrk7HzYOz20ANcwrLwrBJqgXztZPYkE6Mjsi1IBoFMLVVX/5kdtX8bRqUEEppt48jQjG7v6gZatcGiIWtEpQg+9nMhnnkvvHtI6I/WXvltuwo+7/toE99dENQkGDOqteovnr/pS4sS3iBCotLvswV3ZXg3s6WkQS78V4OC0QDZt6ieEjoV0aNmoL5JNdDZ7vA+qLGV4rTO6/oQC7ZRAU0vR+GubxpIEcbzSOPVgHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF455ridIJIOwrXs7Eu8RJ5A454cGJPrSBMOt+Y9C4o=;
 b=b6uBd1WOwVdfVlKn963aBOYarAlC+urzrZL5J5QWy+qhotylqFPWD5y3UHx3VhQ0/A70LtnqG/sB1rN6KIddVXPVsz0VDKEk0Mpaiaw1iSbdXYGFmwhpi/z0EoUGEQA7G0OyzQd/1E5+KoAVkHlQNU3qFfB/KB6wC7Fa7YfiHyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a6106419-70ed-4a7a-80a8-026766d419ab@citrix.com>
Date: Wed, 7 Jan 2026 10:42:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrew Cooper <andrew.cooper@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.21 v2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Jan Beulich <jbeulich@suse.com>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <693449f18cc4480ea2cb2161a9361354@DM4PR03MB7015.namprd03.prod.outlook.com>
 <98855b1c-2cda-467e-8b88-ff24e7862b61@citrix.com>
 <0ebbc19a-724c-4e2f-89ce-58325342c4b5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0ebbc19a-724c-4e2f-89ce-58325342c4b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0605.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BL1PR03MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fac3c8-6a6a-4cc9-e42c-08de4dd9702d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXdmQmtndlNwRkJHODJaQnZaeTFDbU05bm42aTFDY2d1VUwzZXYxNHI0b1Bt?=
 =?utf-8?B?UGxBODAxR2RqSU83NUloMGZ5SDAvQXB4d1BLQWp4bWpSbWpkcGZZMmxWWTJE?=
 =?utf-8?B?eW9mRGdYNWY3bDB5blo3a1NJWVN1M3RPaDJRRXE4aFdjQVQrNGhFbHkvTktj?=
 =?utf-8?B?NnBUTlg1Tm5ubjE1a1kraXB6YXVmOVVVcnFZbXVnRTc0elhPZzh5TXArNUdN?=
 =?utf-8?B?OGsxZzVFQ1U5MWIyZUVEZ2xQVDZ2aXRySDlTUGxKcGwxMFJZWVNOSzkzVDJE?=
 =?utf-8?B?TSt0cXd4d3VNYWNhVVV3U0c2ZnNjWGNLMlJBQzJnS0d0TG14WDU1V0dpaWJi?=
 =?utf-8?B?M2VBMjVHNG5Eb3EwMHo3b1ZhclNIMnJid3JXc3VpS3p3MXA0aEZ0b1RtS0xD?=
 =?utf-8?B?YU8vTmpHMVlDa3ByU2xPb042VzFpOXF6S3dLTCtzVUUyOWJYQi9YUFNnckxy?=
 =?utf-8?B?NVRiQlkxdzdDSnFrWTJ1SGpIVUMvNFpMZlpHdm8vWjlzVVJUZUM0ZndzRndt?=
 =?utf-8?B?b3pEMlN1QTQ5M1NvWkNndmdTMHhCTWk1QlM0eGlQMkVCMGpSbGx3NmJmU1pR?=
 =?utf-8?B?WGZTcWRvUmVtcWRMYXAwRjdHT0dMTWQrQUd1VkwxTm5YekdnOGNJaW9Cd3Js?=
 =?utf-8?B?Z1dVNWp0MXJlNkhOTWpoWmhjQlhuQXZzUWVnSm5PZ3dDaE1FOUJ4L2xGV0tK?=
 =?utf-8?B?STNoODFPNnZQV2M2TXhKWjJaYUNuVlpyQWc1SnQwMGovMXFaTjNvVzlpM3FH?=
 =?utf-8?B?b0VIcjdMQVpuN2Rndlo0a0dBcW9DZUFHUm1yNzdqRk8vQ3FSTE53Yi80NFBU?=
 =?utf-8?B?bEJkQnpheHJIMGh5RW1Nd2Z5dmFvN1REQktvdWxpSWxsS2MxZmZkRUNZRW9y?=
 =?utf-8?B?UWxLOG1VNm14YlM1R2N2WUNMWTAwYnpkMk8yTFRGSlU2U1BqNlNzOUEva0tW?=
 =?utf-8?B?d2pxNjc1MXdPenpqa2l1c3hHd0ZtZUd4YVluTTNQckNTdjZUTmlTTlZaYjhK?=
 =?utf-8?B?OGhPUEgzVDIzdWMycUNkNEpuUFlPbUVhWTM4S3Y0UHNFZGZ0OG9TeU5KRldK?=
 =?utf-8?B?eDhMUUhFNlpJZys4Rkh4TE1mL2lJdVJseGFqaU1JMXVnVEFLOEt2MkxtT0x4?=
 =?utf-8?B?UUVQTEdDQWlHNU5BV2MzVUM3ek84SmhZT3IvRmRlbmYzUlZ1QlIzVGc0MzUz?=
 =?utf-8?B?RXJBVVRzTG1pVDBScTNqaDJHd1A2UG1qYnVDVFZOM3dzQ0d3aVYvcFkwY3dq?=
 =?utf-8?B?TUg4a054amcvV0UySS9YU3gxb3kwMWkzQVR0QlBnL0JXdGw5VEVoVnpDMTht?=
 =?utf-8?B?VXhyL3NtWWIvcEN5N3hiUDNFQXFHdTNVaTRycUhTRFp0c1ZwRDVwejZKakhp?=
 =?utf-8?B?WlpNVkFNL2Q2QUp4cUlvWUgwbjFGL1YrV3VQY0lkNXhrNjRxdFlOQkZCbm1h?=
 =?utf-8?B?NGF5aDZBaXYrV0xqN3QxZ3JjRVFrMFJsZGRtc1Y2Q2dVSW0rMmlRYnRwUmND?=
 =?utf-8?B?a1pLbUF5Y2VOM1owcGRVUjNNMHN1d3ROZHl3Nlp2WjY5OWtkTjBEa1diU2Nt?=
 =?utf-8?B?Kzk1K3k5M2hLQmptV3Q5ejRVOXhHcjMxclE3aWZvQmxicEpEL3Fod3R1YkNy?=
 =?utf-8?B?L2xYRTl2SDhHOGlJSDc5bHZRTmhsczZlS1VoUlZTM0NLSmJWKzYzeHI2RTNl?=
 =?utf-8?B?ekJmUlpIWUQ2c1ZkbnhsV0hDZU9jR0RhaDRoZWVCc1BLMU44R25oVWV2Rkx0?=
 =?utf-8?B?bTJ4Mk1IZGJrUXg3SWJkUElscVB6WUFWbjM1eXllOVdDT0RxTVRMQkVkbkpx?=
 =?utf-8?B?VGZ5ZklWMFFOVDNCRCs2YktqbHp2WTc2MFphUzY2VlhlWmNMQ3RuVENXVEg5?=
 =?utf-8?B?eE5OS1JHaTRTSm5SS1hzMFcwcFIxdUsrUG1oTUFSOThjNSszL2N4WkZTTklE?=
 =?utf-8?Q?yYEf+w0fA9PnCbVGu56pmBPy4TrxVQh6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGVrMzdFK00rRm1Zb3dJU0c3WG9ScGw4MXY5OGJrZmNod0c5WGQ4NHZ0cyty?=
 =?utf-8?B?bWxjblg4eU5uRTJObzRWemhhRDRyTlFORmlZMnAwSEFyYm9OekdlNkJ3MWdw?=
 =?utf-8?B?RFdneitBT0FYVUtoNkZjdGI2dWF2VjVMNVFFeFUybjZyUmM5b2dFMnVGZ3Yx?=
 =?utf-8?B?bE9jY2hFMDVWd0VwMjF3SjhCNzdZamJDZEZpSXJoVjhmcEFmUnNGYVFIckNo?=
 =?utf-8?B?OVAvL3dzZGVVNVJMQjBPK1BVcklNSnFzKzBVOEkzNXljUGdMajY5YnY4M1RZ?=
 =?utf-8?B?VVlWMkprRHFuTEJNQ3N2WTBSRmsxNUZlMU4vQlExTFU1NXBMY3N5NnNKZCtF?=
 =?utf-8?B?b3REUkJuazEvWVB0aDJIOVhUbW9OMzR4VGEvbzZoKzRBVGFBNFdlRDdtcVhj?=
 =?utf-8?B?NVZmTmY5emFmMGdWK05LdXJvTENYS3NJZWZscXowYVNNcFY0TVJVeWZzMURr?=
 =?utf-8?B?RS9ScFJrRUJKUGt5LzY3Y2JoR0tEb1R0M3h4bytiWVhiYXhoaFkyeHpFRjAr?=
 =?utf-8?B?aVdUakZTTHhWamN1SHl5VW4xcTkwclZhcHhTUS9PVkoyL1lKVXREVjAwd2E1?=
 =?utf-8?B?a3M1SVE5QzloWnhIZFRIYTRBUDVNUjl3dkJtS0Q3L2V3cEg3b3RUZXlqYTFk?=
 =?utf-8?B?VDFmQkttNmc0SXA2amJPSmxySjJrUlhHcUczMy9EbjB1cThPUEFjVkNRdXlr?=
 =?utf-8?B?RG91c0ZEZWQwU0lwNVM3YUtpdGxXb3FoVUNqV3M2ZVFNbjlyN0lRcGliYUtN?=
 =?utf-8?B?bHgrODFyVnkrR3dZZDdJUkQyd0FncDJIZitrdk1jMTYyVzAxVDBWY0hrSmda?=
 =?utf-8?B?bjRiWUtyL25iSXVpeWtNbUk0VTZYZzRiNm1BRTcyTkkvNjdLaGt1UnUzcW1t?=
 =?utf-8?B?SWVrQnIzcDBMUlZub1I1U0NqekhnRUsyS0dTNm03b0ZRcWRkNThJR2lsWDlv?=
 =?utf-8?B?TVBDbFNqbGhSNGNlWHZpMWo0SUFndWZoaXhUWVhiYXdCWTV1VVpPOUM0NFE0?=
 =?utf-8?B?cmxQSkI1bS9DWkM5OEhmQUNGU0xGQW5KUGtRc1RhRldWa1AzSnZHUTJLbVNK?=
 =?utf-8?B?NWlRZ1MyN09kS1dHRThtMGdraUxUK2RuQlpYdmlOcGRQRHBzandIVkYrYjdn?=
 =?utf-8?B?cjJGbGtBdlMzc093WkU0M0hBYUVzYzd4eVgrSGNZYnUxeGJoQXlqVkpya2ky?=
 =?utf-8?B?UUF1ZlBuMjJpbnN1NWZEdkRHZm11dlgwdytyYTkydDVkUkYxamQyamJRbVZD?=
 =?utf-8?B?UHNhRGRaejFjbGVXZzFRSWI5Z1ZxNHVoWWNBaS81OEZqeXZSRGF3N3A5R3Zx?=
 =?utf-8?B?VjNJWDBCNnpsWEpGWllDN1BiSWc4bmZWSnVGeHRPc1FvTEJoY1ZIYVFmQ1ZS?=
 =?utf-8?B?WDMxK1Jyc2NlSXIvRmx2cG90Wm9CMDlYbGJLQ0dockkxRXRWK21HdGI2YnJs?=
 =?utf-8?B?a2dEM2hOTzJoVGljQ3BTZEpuUmhRVUV3aXRlcjNFUktiaUF4czRSRm9ib1Nz?=
 =?utf-8?B?cjJndW5NNFM0YlBEcndrQ1lSSlFDd0loME5oWjhybDNYc3ZETFRpT0ZQaTU1?=
 =?utf-8?B?elE0QWVvZURUdThMMDRsL1piZDFHSjVKbTBQK2s2MXQyMDYrbjR6Zlc1dHRx?=
 =?utf-8?B?V1Z1YmpwdmUzZFlTYVdHajZVRERhVjl1TzAxZExmNjVhRTFKclZqTEs4c0xl?=
 =?utf-8?B?R2JQcWpTaW1tTG04TXJSaUQxTVp5UDJBd1FSQkdTeENEOWplNlVTaXlQZzd2?=
 =?utf-8?B?N3hlYXlkdjlXTW1VRWdWK0pVbXQ0N1FjTlYveEo5NE5kd0w4VFc2ZFFwcjRE?=
 =?utf-8?B?eUNtaGZqRkRrOWpzQXpadkFsT1ZYVzZGOTZQS1JVbWxFU0VrcythNzRTbkFs?=
 =?utf-8?B?b09BS1U2TnZpL2R1bVRnNnNpQjZCcHdoZGhnQktEQmRHdXlHQ2taeTVWcXFq?=
 =?utf-8?B?TUJoWWdEanJ4U1BsaGNVNm5hVnNSMU0zQ0FSb1YrY3Z2UzdtbXI1VERVYjds?=
 =?utf-8?B?amF2dHdrU2FUSGw1bktnQ1hTQnVhUzhIaEZPKzEyRE1xdEFQcUZ5bzZhVWFh?=
 =?utf-8?B?emF2NUpaekJ1VWt4L0V5aGdpRGFqQzBwRVpoczdDQ2VUR2p4Q0tEK1c0dWRF?=
 =?utf-8?B?YjI4ZXZKOFZYcHpGK3VCM2dBTG1UYVBrT1h1NXM2QURQMUw0YkFmSTlMVlI2?=
 =?utf-8?B?czZzZmNPYnhxbWdveXhNT3BxNCt2VnRXM1pLUVdPNU1NUlNramdUa0RaUkli?=
 =?utf-8?B?V0tEK3N5SVFQQ2pvRU5WZ2FJQTdkMWg2ZDI3bUxrNCtIWGVqZHF6c2RwSDFM?=
 =?utf-8?B?VU85SCtSWEVBdkhIc0ovcWFXV2FVYzNJZEl1Sks3VkVuVUNtQUt6U2pZNDFO?=
 =?utf-8?Q?buHsr2ccEU0G5CzE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fac3c8-6a6a-4cc9-e42c-08de4dd9702d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:42:22.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2Et2E7m7dofOX5OEhrXaCMSwb5Et45vCzQxmEuAlQQhWwrfNBrkXsow9e6AMu33Cw8g/K2kPlnExI+n3FEboZxzwFaIl4rUh7KBYuh8rA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6022

On 07/01/2026 7:22 am, Jan Beulich wrote:
> On 06.01.2026 22:07, Andrew Cooper wrote:
>> On 13/10/2025 2:06 pm, Jan Beulich wrote:
>>> Along with Zen2 (which doesn't expose ERMS), both families reportedly
>>> suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
>>> can actually be carried out the accelerated way. Therefore we want to
>>> avoid its use in the common case of memcpy(); copy_page_hot() is fine, as
>>> its two pointers are always going to be having the same low 5 bits.
>> I think this could be a bit clearer.  How about this:
>>
>> ---8<---
>> Zen2 (which doesn't expose ERMS) through Zen4 have sub-optimal aliasing
>> detection for REP MOVS, and fall back to a unit-at-a-time loop when the
>> two pointers have differing bottom 5 bits.  While both forms are
>> affected, this makes REP MOVSB 8 times slower than REP MOVSQ.
>>
>> memcpy() has a high likelihood of encountering this slowpath, so avoid
>> using REP MOVSB.  This undoes the ERMS optimisation added in commit
>> d6397bd0e11c which turns out to be an anti-optimisation on these
>> microarchitectures.
>>
>> However, retain the use of ERMS-based REP MOVSB in other cases such as
>> copy_page_hot() where there parameter alignment is known to avoid the
>> slowpath.
>> ---8<---
>>
>> ?
> Fine with me; changed. Do I take this as an okay-to-commit?

Yeah - with something to this effect, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

Sorry it took so long.

~Andrew

