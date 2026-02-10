Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG6iIBJbi2ljUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:21:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAFB11D138
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226641.1533152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqUR-0005m3-SA; Tue, 10 Feb 2026 16:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226641.1533152; Tue, 10 Feb 2026 16:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqUR-0005kU-Oc; Tue, 10 Feb 2026 16:21:27 +0000
Received: by outflank-mailman (input) for mailman id 1226641;
 Tue, 10 Feb 2026 16:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYRw=AO=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpqUQ-0005kK-9X
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:21:26 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88372a08-069c-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:21:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6509.namprd03.prod.outlook.com (2603:10b6:510:b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 16:21:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:21:17 +0000
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
X-Inumbo-ID: 88372a08-069c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRLQczpMOnOxj56Ap+loJbHD63oD4WLUgSBFQWURmDaO81S9P2nlWi/W5pDrbiO2iSDrBEFlVgl6w2DSnU/sImji/6efDloQaubMqroh4YCIUvv/gtEqQupEp1YwssxsKa70UKUDAKp8i0Y3ue10N7rJrMGnsb4uTlAvPgYDbg450IKPREtaZFS7QMZT3b+UtS21ezOljhQcnN+nViRIaY+GmQHeplzCbEWHTZoGLwo/REPL1TXBrBw/xkwWDlVXAPf+5qQHmc7M5urFnNGLGZKsyK7QBKj1JWjzaOiebqhz0KoYvL8JRinJk3NtfmRuu3OIm8ILTMpi+COF+OASLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIh6qFKQWXJZtftb2PcCVf8CVwO630hgrWNeo3m09Y8=;
 b=DZIfg9H8c9x1nLWLoWmHJHOk2KTbt5OYZcDnpACI3tHFo+Y1yL19VcKab1bq5jlWsRBItj4W/VKqUNlQWT6MHh/AM+806vxKYdKYK9O7ga60Be7tBnIQAXGN1ZSfr6BUu2t0u3bgvq1rtyvW4nn87GKsDjRypdpJxHTSV+Y4MqP3RH/7/rEBNqSwUMJzUGHJ2clJZ2X/t2MWTPvs8z+MlBSLAln1aZOfjyJH0wdaugR+mf+zxw0barqwyhQBMwJSrPa1TmS5K/VslPrlCI7SeWylcUerNKfPgLhThcxmmtJB3N3Urn1auzHOj0EfSA2tkJEdUypfRdZVj6bJKH2nmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIh6qFKQWXJZtftb2PcCVf8CVwO630hgrWNeo3m09Y8=;
 b=m2mat6qJwKnrqwEiV5tqP27IEYmJYox8kz78u1Ka6OvfcpmQ8oamKK8lFTFO9nmpjsyNwWUf014Ir9lF3hq6RhsQp+HAWZV9/7VVQ1C/J13G9+uaSfjbUpgzgMPOSh0JxdMj1VHH61ZIF3LfEA/T8sMXM5lG3Vi7SJbNSbxAYmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a675aa8-ad41-4b09-b38e-562c5866149f@citrix.com>
Date: Tue, 10 Feb 2026 16:21:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for
 FRED mode
To: Jan Beulich <jbeulich@suse.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-8-andrew.cooper3@citrix.com>
 <e314d193-79f2-4d77-a2ed-1590375b4b96@suse.com>
 <6786174e-e00e-46fd-8b82-7eb823ad96a8@citrix.com>
 <82adaa8a-b7d9-40fa-b59b-0851776fb59b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <82adaa8a-b7d9-40fa-b59b-0851776fb59b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: c15d1fc6-78fa-40cc-0d38-08de68c06acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGwrVmVwdXYydU5sZ1JzNTBxZjhjVTJVVFR0OWJuL2NlMXE0aUdKZW5kVzhO?=
 =?utf-8?B?UjhEb0UrUUtHN0xIY1dtYmtVNmZHeFlzMTZUT0hPVE1hdVNHMjlsZjdQQnBF?=
 =?utf-8?B?eDcwOWYwdzV2T0hSbFl1SFlLMDFqb1dpYitUTnQ3MEdKb3F0R29yblRhdVds?=
 =?utf-8?B?RU0vU3lSSnM4Z1pXMHA4SllWSVprY3YzYTczT0tzUkp0VlNrQStNNE9qalVa?=
 =?utf-8?B?aTBpc2hkanA5SitFRjIxa3lFUTZjOVBQbHA3Zi9VRDhTMEkxR0pBZUNJbVA1?=
 =?utf-8?B?enFsT2xNZzhZbEJReXFvTWNTanE0blB3d05pSGRkWnJNL0VDbXNFaFNpeU52?=
 =?utf-8?B?WUE5amxNS2hTRkVJSm1mRW96UlcrSWpRdFZoRHlqa0xhQmpwR2VrOFMvbVpQ?=
 =?utf-8?B?NW9TQkVqaTRJY2JaRE9TNGxFVVQwU2F3ekhpc3JHZStnTXVGQ0VzbEV2VlBH?=
 =?utf-8?B?YmxXdDMrZVYzUDNUUkJkTC9lM2V2M1BLZGI1TEhHUGtZTTRaalllK1FvUWtM?=
 =?utf-8?B?ampGMHNaMGl4cmttdHBMZVM2TTNDWFZ1V3JBbGVxL0xxMjFhVXlXTTVwUlMr?=
 =?utf-8?B?eW02b3owNkI5eGhWWm0ySjM5UjZIaDJBZUkrTG40ZzFLcW83a1JYNDZLWVNX?=
 =?utf-8?B?MWtCQ1JBT21QMTg4V2xUdHZySFVhR3lOUkpjejVxcVhqdkpGNjFMcUpCbVBo?=
 =?utf-8?B?SkxtdTBDYnNyb09MZHZvcllYYVhUdnU2d0tLaDBWdGVUNjU0OS9YUnhFVnRk?=
 =?utf-8?B?RXRuaWk5Nnp6ampKcTQwdXhRR09pcXAwR2UzaEtxL3l4OVdycnZ0SlZFT3pV?=
 =?utf-8?B?a2lJdUlJZnpqakpWMGNaWTBZZnR2WmE1dk43U1dFQ3J5VVRTcUw0K296MFRt?=
 =?utf-8?B?ZXhuelFrNWowY1FDcTQ1Mmc0UTNKNEppS1JNZUtyWUNYS1F0OTFkTUZWQW5K?=
 =?utf-8?B?S2FNTkRxME1tQ29selhNMWVreU5mVFBxQnZYOHRLRXBEZldaSnB0WGRpOG52?=
 =?utf-8?B?YWMwb1dSdW5tNTdhREtPQ0p1S3NQV2xuMVBBZDhyVDJrMHh4ZjV5TTVseXR5?=
 =?utf-8?B?b0pBekEwdGg3M3BGbldqdG1XYjFSSXB3QUl1OHl1d3JDaVdhb0ZPa1p3Y1pB?=
 =?utf-8?B?eHk5WEppb2lzbGVFeHU1L21sR1JFVzRva3poSTJUd3pSMVJ4MFBuOXpOcklF?=
 =?utf-8?B?U01WV0ExTkFBTmFpVmVmU1Vaa3dMK1M5K3JYZU9pQTk2MWR0TTIyckVrWDN2?=
 =?utf-8?B?V0tTenU0TE9FSWVvQ2lPaDBrQWZsRFdNWVhFTFVyMEdtZzBWN2NyK1NwU2Q0?=
 =?utf-8?B?bnFaUzB3MytEcjM2dkw4YktkZjVNUUdQVEtBcUIzY01kV2VYTnpaQm9sNTJK?=
 =?utf-8?B?UXBWRXpDRFREUG9IV1k1THRaL2dEbCtIS1MzdkhhRjBYQWpJT1RzS2FYZit3?=
 =?utf-8?B?UHBadnFDdlVDVUk1TUpDdlYrTHI4d0dSODBmNW9hWnZGNWdtc2h3VUxya0Vk?=
 =?utf-8?B?TWJQemVlODFWdmc5QUF0RmRKWUFkZWhoa3pHWGsyZURMcWU3cGRIbDVQdWRB?=
 =?utf-8?B?bDIyd1dSUTFsNTFzdUE3K25CZm01UkR6eFhvdjFWQjlKNGFodTNZbjNRcDk5?=
 =?utf-8?B?RUpYbmhlVTNnZ3VoR2JEZXZhM3h1cE8zRDIvV3E5b2xBbXF1MGcyaWw0ZkFZ?=
 =?utf-8?B?WldqbEFad1VLTEF0N2tyOUlSWDZ6aUJ0N2QzT1cwS2laS1lCZ3VXTGJCYUN0?=
 =?utf-8?B?cjF3RzlLZ3AyMStseHplK0R5cERHLzhNRlIwMjlTOFlZdTRVN3RGditLRXFx?=
 =?utf-8?B?alpSTjV1QSt6ai9OVEYwa1duMmZ2VmMycUNUb1NobERSS0xZS3JRTDlWUDFa?=
 =?utf-8?B?dWwrL3pzR2RqTkdOY1ZpQzM2TEV3SXRsRVNTQlhLbnBVR3pvNlNReVIxdENX?=
 =?utf-8?B?NHpoVXUxRUlUVWdYUnBIbDN2aU9YY2l4VkkwSHpZSE5PUzVmK2dBak1mZWlD?=
 =?utf-8?B?N3phaFQ4UkgreVkrVjYzczBGM0NWL2JXTWUxa1FpSmk2RGFGOVBNV1RTOEdC?=
 =?utf-8?B?cGhnbTViTjRnWFAxYXNxanZPRmlWR1JKN1RoNlduSThYMEtUbzFSVGpOb0pn?=
 =?utf-8?Q?2JXg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFJzTDB2L1FGc2RwQlBmb2JZK1hRdVF0OUkreHhYRk5YREdJZUg0dC9VNGRP?=
 =?utf-8?B?bTBpU0ZHM0JvbDloUG9VWHUwMzhJSm9RNko4V3RFQmRGOGRGK0sreDk1NjRN?=
 =?utf-8?B?WEIxZFlXMStrbEtPdFFNcEtJRFpDZStsRmpxQWtPUkw0WUJRazdqdEJGeERu?=
 =?utf-8?B?aWFFSHVvRElUbjBQdEw0d21CK0pFOUY2aEUvMHduMk5jNk1WeFhzVXFWVkVy?=
 =?utf-8?B?cEhiTGRCZ3hrWXdROGtGdXp4TlM5cHJEaVZxaFN6Zk8rRmVKc1k4Mktkckkr?=
 =?utf-8?B?MmVvZVN5QjR3cFdSZWRMOWszY0h3WHdWMVVkRjdTMmlIR0huUDVvS3NtWlJ6?=
 =?utf-8?B?eVgvQ21NWE5lKzYxL2RMREczMmZNdDM4T0dFTU13eUp0cWRuLzhITHFrZy8z?=
 =?utf-8?B?ZStrQnkwT290K2tIc2xtb3A2MW4xekNVRGkvdlZHNko4SGNtU3IvNHZEYXJ1?=
 =?utf-8?B?MElhc3Q5Mkp4dHdGTTRmRkpTTWszcUIzQ1NzdjNpbml3Y21LT004T3hCN2Vk?=
 =?utf-8?B?eUowcFRpSU1NRktMUkhQem9xazk5NlN3bVBaWjFQUnlxd0o4TVM0dzhrWVl0?=
 =?utf-8?B?Qi9INzg1MElTR3l4aFZjSWJqRXJ1bUlrdVF5VENPSi9WN3YyNitEUHpsSEpJ?=
 =?utf-8?B?a2phVFAwSGliVFZoL2wrdVNFU1ByUVBDcUVWb3IzT0JFaG9CSHNIbFkxRHd0?=
 =?utf-8?B?bGZ6aEgwRVF5MnRHNldUSjdXTldtd2xjY09mUHJsNTdCb2J2NCtPSFNiT1Va?=
 =?utf-8?B?RXdCZ0hiMkU4aVFTTEpwSS9pV1dmNUlTZnk2c3pYSHM2czV5c1Z3WUd1NlV3?=
 =?utf-8?B?dm9ydHJGb1VTcWN6cDhnZjJBbVV2Szk0a0FqSzcxTjJnNE9Jaldjd0x3V0sy?=
 =?utf-8?B?M3Vyb3lDVnV3UnlQWnVEVnVhN095U21zOFc2ejNYblRKKzlwNC9kZEtBbnhh?=
 =?utf-8?B?cDlWcFR3dTZsYVlYdXhaaGVWcVZPeWFoZXBzNWV2Uk45V0FWNllUbDZPVVdx?=
 =?utf-8?B?SGtkN1pZdWZnWmdGaEdyTWp0NVpZYmx0WW5SMTdRTmM5THlNOU5sdEdZZUY0?=
 =?utf-8?B?SXQ4SGlDT0NHQmhFaGxIS3BmREdFMUJBVDBQaFg5b0dTYkhpY3JuUUs4N1ky?=
 =?utf-8?B?alFxWXEwaVIxby8xOWM3S0NRN083eFJqaUppWDJPdnFmNjQyUTBsdnUyVllK?=
 =?utf-8?B?eXJ2Zit3Rzd6anR2R2RoVURBU0JYeE93Q3gvQjY1WGNpZG1tVTJmcEJqN2xG?=
 =?utf-8?B?T1lJQ3ppOFUzczJEZ1VVRG8rZy9YRzlpajc2Q1I0aTczY3MybzVrYnBkU21n?=
 =?utf-8?B?TzIzcFFhM0dIY1IzeDdJTEJJQ2R1TzVUSVRJQUs4bGtocnFBWmp4VERCUlRw?=
 =?utf-8?B?WlF0WGRuZ20ya1hVb1lQZ0ZJc0o1ZGNudmxUMkVmdXhPcnJnWWcyYlFVKzM0?=
 =?utf-8?B?U1VuR01nVWIvbUZMQTVtdXNWTU5HcTYwRmJadmV2b0hoNXJaV1hlaTErWG5s?=
 =?utf-8?B?SjJEclRhZlNaY3Jmb1RvRHhpTEJBRm9ld01BOWNKSTI3R0FocFNwWUxkN3VZ?=
 =?utf-8?B?aUVkbk9id3lQYjRwdVBlOFMyWFJUSTUydTU2TkR2alhIWWpRaUcxeU9wSXhO?=
 =?utf-8?B?c2FMeDhXUXFiY2NFWm1wTUh1NCt0WVFIazFvRU9keEpnNlJ2VWlWRkgraUdr?=
 =?utf-8?B?OEpVNmNXelJCZExPVUZsTTVOWU1DcTBMUitNRmxnaGg1VlBKQTRLOWg1MlZY?=
 =?utf-8?B?eFpvblhUNFRjTk1zWDRPZ0tURzUxS0pxbDRNWFkySWhpUHhuaVlEZ1VacVU2?=
 =?utf-8?B?ay9XSDRldS8wNS93Y090a0xwRUt4MUQ4WURSRHprVzJJSThTZnd5bGJ0eXlE?=
 =?utf-8?B?aTg3cU9pOGg2aU1ndEZlMXQ0aE9remE0Z21OcWJ5WXRBWks2U0pKZkl6MEdG?=
 =?utf-8?B?VGVQT1FiZkJNdWVhd2dVT0JrRXVPZnNBWFc1d2xPcnNqZllzUTlmak5Zdjhz?=
 =?utf-8?B?V0F0ejVuOUVDVjFOczA2QmNUVXk2MERNSzBBa0daWkR2NGNsNCtrMFREMTZW?=
 =?utf-8?B?VmZKT1hjTHJoblQrY3lFbFQrS2w0aXRKemxuOGcvMnpHSkdNNkZycEViQ09S?=
 =?utf-8?B?Tkw1eHlkbjFNTE1XYW93Nm04cGIyVGUyUkNuVDdsN2tZQmpXemE1bkpOdklS?=
 =?utf-8?B?aE92cVZlaWVkUXBZajBMOGVqZHBNaG9MeXpZMU4xbmpqRmtrL3oxUWQyMysx?=
 =?utf-8?B?azZ6U3liMFlkcGdLYjRNZDRZKzFrQ1dDMDIrYjR2T2tOMFpQdTVXRG9pUjYr?=
 =?utf-8?B?UlhWSzdJUG15SzUvbjBMVm1WSi9La1hTMVd5aGM0K3FTSXhOOXlWdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15d1fc6-78fa-40cc-0d38-08de68c06acc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:21:16.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fdnx1ZXhmdROHStPrkBr+wFV/MFgTdgWJ/3O+9T/kufovp5X/JEGuSogwb0GfyjwYr/HGPx22FA4r3eKTMqV6RBthUYykqPQZl7/ApPkSOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0EAFB11D138
X-Rspamd-Action: no action

On 10/02/2026 11:55 am, Jan Beulich wrote:
> On 10.02.2026 12:15, Andrew Cooper wrote:
>> On 07/10/2025 4:58 pm, Jan Beulich wrote:
>>> On 04.10.2025 00:53, Andrew Cooper wrote:
>>>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>>>> means that switch_stack_and_jump() needs to discard one extra word when FRED
>>>> is active.
>>>>
>>>> Fix a typo in the parameter name, which should be shstk_base.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
>>>> to parse as an instruction immediate.
>>> I don't follow. Where would the 2nd $ come from if you write ...
>>>
>>>> --- a/xen/arch/x86/include/asm/current.h
>>>> +++ b/xen/arch/x86/include/asm/current.h
>>>> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>>      "rdsspd %[ssp];"                                            \
>>>>      "cmp $1, %[ssp];"                                           \
>>>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>>>> -    "mov $%c[skstk_base], %[val];"                              \
>>>> +    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
>>>> +                "mov $%c[shstk_base] + 8, %[val];",             \
>>>> +                X86_FEATURE_XEN_FRED)                           \
>>>     ALTERNATIVE("mov %[shstk_base], %[val];",                   \
>>>                 "mov %[shstk_base] + 8, %[val];",               \
>>>                 X86_FEATURE_XEN_FRED)                           \
>> I find this feedback completely uncharacteristic.  You always goes out
>> of your way to hide % inside macros to prohibit non-register operands.
>>
>> This is exactly the same, except to force an immediate operand, so the
>> length of the two instructions is the same.
> Thinking about it more, are you perhaps referring to assembler macros?
> There indeed I prefer to have the % inside the macros; the same may go
> for $ there, but I don't think we had the need so far. For inline
> assembly the situation is different: The compiler emits the % (and also
> the $), unless special modifiers are used. It wouldn't even occur to me
> to ask that we use %%%V[val] for a register operand. That really is the
> register equivalent of the $%c[val] that you use above.

We can't use %V anyway because it's not available in our toolchain baseline.

But, bottom line.  How insistent are you going to be here, because this
is the only thing holding up committing 6 patches.

~Andrew

