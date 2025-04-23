Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E93A97D9F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 05:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963922.1354820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7R7N-0004Lj-PU; Wed, 23 Apr 2025 03:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963922.1354820; Wed, 23 Apr 2025 03:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7R7N-0004Jf-Ks; Wed, 23 Apr 2025 03:49:49 +0000
Received: by outflank-mailman (input) for mailman id 963922;
 Wed, 23 Apr 2025 03:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EGKH=XJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u7R7L-0004JZ-Jh
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 03:49:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc2908ef-1ff5-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 05:49:41 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by CH3PR12MB8259.namprd12.prod.outlook.com (2603:10b6:610:124::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 03:49:38 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 03:49:37 +0000
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
X-Inumbo-ID: fc2908ef-1ff5-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOxPf5Fjh0OnIZpXdTgngW5TD7x63oEeJ4FQnYllEWowX0U6ingtcXfOQOMrddri+GG80zJCY4FE6R+CfnObKpSu3XGvnhCjgIs81iBvhs05hqrEzdGD5cmbTLqjrGCNATUc7+F+C4iDiFX61nh9Q8Hk2eN1eHA0KaDYcWzOV9KCqYEBVUgerHqqwC7YzFkdrSr219kXj5KNo1xT+dKHD++4zxpaRPfGMy7PvKp/1YZnsmdhPZzz9aGfdTsTHkHxL81Dq4+bSfg790Qu6D9LSUT9uLFbemyFqUy9DMk5ZH+baoCNFMCxA/1Kci+bu4VLMJI/Zp6pZwtcEXnKwu8CeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heckH4zwfJlPex+mRGYYqXGFR9rnvefybkN6MR4COvw=;
 b=HIoH7KNn/uSBCGjSOhWLYzVYfUR0ARQ4mufopoFMQJjIkGOcuKVJ4nz5vDn9HBYTTz87GIB8nazUf508myXwgzPXNo2RuCoJF5wI8syza15wHf56v2j+tMiiiyhB+0Gv9y9Rz1u2edeWJb85yGspF2eLRLHtbuMxDNmjpW+QSBeHXIc+9m1zxqvWkbzmYkBD1L4X42zSLFkt108CcfAS3DZb/a2DT2zGRxwAT3wbzq+qXISA0infMo0lFT9UxpbdghrZMyRINz70C35bwXCRzaTuDA7j2taLfyrd2CUnwl30XYj0LmMjSbLRcEdVytoiTk4BOQA6BwbilZfL0stqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heckH4zwfJlPex+mRGYYqXGFR9rnvefybkN6MR4COvw=;
 b=Ca8Nhdi5XC8hw/F7mFZJJPW2RGt3aFBGSKetLSuVnbPzddfB6l2P7lf3HU4jfj5zbtSNidrXiew+x7+ouTvrSjNiUH9t3dX5YY25pi4/vroE+6oNyZKuZcXWiYSidj4MyhyjjA0k3sEFINEM+6T739pcS9Kot7TzbbKxUYMj07s=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHbsoVaTdJd8UN3wUOnIdqQLAHMILOv2xuAgAFJegA=
Date: Wed, 23 Apr 2025 03:49:37 +0000
Message-ID:
 <PH7PR12MB585404EEEC765754A3DE458FE7BA2@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-6-Jiqian.Chen@amd.com>
 <545079b5-7159-4f47-8100-df387fffe57a@suse.com>
In-Reply-To: <545079b5-7159-4f47-8100-df387fffe57a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8655.031)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|CH3PR12MB8259:EE_
x-ms-office365-filtering-correlation-id: b49f9199-df00-4d92-ea84-08dd8219dea3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2o4VndyWUI5dEdvM2tISnU5dFMxekFXcm5YWjRZa1JSZUFtcmJqSzdHNkNH?=
 =?utf-8?B?ek1xaUpCQjYyTlVyUTNPUXpiczF0U1JtTzFFTExsMUF4OXROZ0FBbGJCbTJJ?=
 =?utf-8?B?OW9OQzBwZjBpRjYwWnprcDQ4KzZ0cDcyRW5yTnpvMzB0MVRaK1NLeWYyb2ZH?=
 =?utf-8?B?NnVRZUEyK0c2T210UDhNUldvNTdzUUpXYkFORjBmN1ZOQnIwRzFzRTU5ZFZs?=
 =?utf-8?B?Qnd5NUp2clVqZld4bkJjbkdXcFQwdUhXUzhlQlM5OG56Unk4Zk1CWGJzREYx?=
 =?utf-8?B?cXFyc1lTRVRvaFdGUFZlWlI4VEJ6QmdmeFErR3o5a05naHJKME1WUHpGTmtY?=
 =?utf-8?B?NUxPQjBaUlFLVVVmR0s1MGk0b0lNbisyTnQvQXNEcWJKbk42endZODdpZ2xW?=
 =?utf-8?B?ZjBLendacFduL1A1Nm00SFZpOWFVNHZGRGY3MWwydndYOTlHYm4yRmJ5TkE3?=
 =?utf-8?B?SWhid3JTdEQ0SnhNR0MrdzdTTGRZeFRDaWUyWk1DMHU0MythTmU2Rk1WRjJa?=
 =?utf-8?B?MmtyYW5CVHkyY0o3NXdkaEI0alYrcEhRY1pOYUJYMTJ3d1lzZ1dhaXZhV3FD?=
 =?utf-8?B?ZGxWYXhlTllDdjBCalBqd1BTL0hvSGhZbC9CRFV4YTJoS2N6eEJkZ09yWVo0?=
 =?utf-8?B?cGRoZi9CRjlWeFhZK0dwV0dJbXZpRHVFNlowWnVXRFVrTXl2amVYLzVJbWZn?=
 =?utf-8?B?T2htNnF1bEhiM1V4NUFVN3pVQWhmOWh0ZFBWdW8wMUFzMFlKZjc3LytVeFZl?=
 =?utf-8?B?Nmg1Y0dvZHdqenZXYlhFTnZVa1ErSGEvK3BTN1RoRS94b3lOdml5Mi90NkJU?=
 =?utf-8?B?S1l2b0JKYnY5OEJmQnd6ZndIanQ2NFQ4U3E5UE05Y3prOWRUK2tCMDNPL1NO?=
 =?utf-8?B?b3pjTXdmSVhHVExrMVJ6ekhoUURzdytSRnpLeVROd2NvYWNVQk05OVFuKzRh?=
 =?utf-8?B?WU1STUZaZHhpNHovQUg4R0MrODV4UGlQbUx3K29sZldUaUR0TkJTMHRGZThX?=
 =?utf-8?B?TjhkMlUweFBsYkhBa2NXZ1JUSFRTYUFadkxZbTJnajQzTXBTOFJIVmZLbTBS?=
 =?utf-8?B?bU1GRzJkYXNDSmxBWmZYcE5VMGVhOStWSWc1MDFYZVcwWWNISGJXTy9May84?=
 =?utf-8?B?VHZYM09mS1haNmhWU1k4amhSVXJhSjlKTk5FN1M4YlA3K21jaHJWVVlkcktF?=
 =?utf-8?B?SjFUbXErMGg0Y0VncFRQQ1djbjkvWmRzYmR4bUNxbUk5L2NQYmRhaHJjdnpP?=
 =?utf-8?B?dTlHSFY2NUdFZ3BZK2VDcm92VlV3L2VNTFJhYVlMYnNJRGN6WmREUm96OUNm?=
 =?utf-8?B?bUlmOUdmUjkrTUNqZjlRYWluZTFPdmdxc1o4YkNtTlNscjY3U0h1Z09Wbzg4?=
 =?utf-8?B?Q0hZN0JjaTJ1Uk1KNXpTaWhhd0s5TGNOUWV3SUhPeW1sVnpSb2RtS01EUlVX?=
 =?utf-8?B?U2tlTU9MOUJBNWIwWGVVN3lHcEhFRmgvWHZ6cE9RTHBDOHFUaFpKeEdDeU5W?=
 =?utf-8?B?U2YvcTBkMnlja0JCcnlkbW1aZjZ2ZTBkYjUwYjZqY0tRQUVxTTVraVU2cldG?=
 =?utf-8?B?ZURDV1pCK0lJdmVpdkY5NGdPbENGQkkzaWhod3FmUmpkSTZ2ejAwUzNPbVJ3?=
 =?utf-8?B?cENham1BeVRDaVVVNFdXNnVCNzlhT0ZmZlZwWlYwdVlaQXcvTk5hOVp5VC9o?=
 =?utf-8?B?bmFLTTdURE9WTzViZXlxVkY5M04rdmpVdW1xY2NCTkVYeDFxb21tcUJRbzYv?=
 =?utf-8?B?bkIzWkJCTmVFb0FvZ2JRWFdZNnNJdFFKdW9Oc0VjeGg5dWp1dEtGUmZpUHEx?=
 =?utf-8?B?UGFFb09YbGdRWFlIcTZwc3hkcVlZTFl1M0lNRU9rNm8wdlF3MWpwL2FOSDV6?=
 =?utf-8?B?Uzh1WHd2L1hGOHVnWTlHdjl6VEN5enVZUWxpbWphZHdHekg0VGFVLzRmN1VX?=
 =?utf-8?B?SHRRVDg0SWtabVBLTkFEVUVPRUZvWDBwRmtDajlYeWRuc1NZUnZyZGRpc21Y?=
 =?utf-8?Q?W2HxhAV5npsbxjHwi24EIEfV87Cf8A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2MwckVucGNvN2FJbzZYZ0VOZFVBdWNXSk1lWUh6aWo2ZWNGblhXMk4zSE8x?=
 =?utf-8?B?a1VkbmZ5Zm10ajIvS2Q2eDJaUGpSTzdTemU5akJZWVJmRVJGQnlKT3hReDZW?=
 =?utf-8?B?L0ZDTElZZGl3c3Z5aHNHYnNwTlhUY1hXdXk3Z2VNWXpuNlFRcEk2Y1pWOTRO?=
 =?utf-8?B?N3R2NXVyT3haeFV5azlvTW9rL0pzcEthcHQwSGRxQmtKOTlUSGg0R0VrRE9u?=
 =?utf-8?B?aEZzUXRLaG1HeUVMdU1leENudmxhU25rVnRRb1hOd0NsL1RhYnMrU2VlSEdV?=
 =?utf-8?B?R2FYYUxydUlJOHhqUjhFL3BwSVlnVFpKS1FrMm8yMDVlYmNvbTYxVndVZlps?=
 =?utf-8?B?TmRlbWFadG1YVCs5aW9hamJQTHU0MkhIMFo4aGhlaEs5aVhKR2N1NmZLTFBU?=
 =?utf-8?B?b000QXpwSk1CQkh3SFgxZHM2SEtvcTFlUG9qWVVRQVhPMXV6R3hkYTJyRDVo?=
 =?utf-8?B?YkUvNHdVeklDRU1XUDFRVnk0VFVLZ0dodXdUK3ljT2RoamdhdHFqRWw5TEpB?=
 =?utf-8?B?QUZXN3NLLzBhZ0pmbEpqcFNTWXg3YUdqb0VLcS84UWNrNVZGZHdoM3pLeXNS?=
 =?utf-8?B?V0dFOFU1dS9RYjJUTXVyUHNBbnFCbjVzQVduV3cyMFJNYkRiL0dDR1FzM2lz?=
 =?utf-8?B?Yk83M0w5TjgyaDlzZ2tHV2JtazlIT3YzOTkybmhBVUdxQUNWeU04Z05JODdm?=
 =?utf-8?B?bnFyK3FQaG0zVlRCMTJGYUJBRGxjSnpOeHRiNXhVTVltRGNtL3d1dWNBK1NR?=
 =?utf-8?B?THcrVzRVemZPdGRxTitJbFRWSmJPY3IrbjRqckZ5UUdaa21YWEkzZklZTkpY?=
 =?utf-8?B?aDYxRFZLbkdtQ0d5Qm95OU1VRDIzbUdxZUhFSXlRL3l2NEVDbU56Qkp5Y2VL?=
 =?utf-8?B?Mk5uRDlOTFQrRG4vV1pWZDhQOG1QeDRKMmI2Q1RxWmh4ZWR3cTlXTUFab0wv?=
 =?utf-8?B?clZudUJUejVtekdxdlE2RExvd3ltTmJWeFFlTnFFaXZ5K2hJaHJGSmlrYVFy?=
 =?utf-8?B?TmNCelBodjJhcUNEUXZXWGM3Z2JnSmhCRTA4bVFyTDFhUFpYMGZMRkxsZUM1?=
 =?utf-8?B?TWlubU1PbEM0UjlhMmMwQitKRXYvWC84Wlh5MkQyRUdCbkVaTDZaemJrZUdX?=
 =?utf-8?B?Y1JjQkZrZTVGR01nYlhJekNlMkp0bko2N1RvQjhneWhxZlN6N3NxaHlTMkxZ?=
 =?utf-8?B?TzNJSUhxUThIdkY5ZnNMbHlWUHZHWGQ0YW1QQlhmQnVlc00zNlhibVBFMWZH?=
 =?utf-8?B?VFErMlA1Q0wzc1RndENkRWJpQXlPWVFKQzIvbWhObUJ3cGZLRVE4ZEk4MW94?=
 =?utf-8?B?Mll1M2ZFT29vNG5OTzcvYzE4dm53Q2dybmlPVSs1bUxFZlRKQnJFUjhWTkc4?=
 =?utf-8?B?anJucDBacjgzVkR2M2hhcERySVJqcExreHcwaEErQlJMeEUveWhYV0FSNmwz?=
 =?utf-8?B?czBmZFNuQ3JvUTA1T01VY2VXSnd6Nm15dWZISWRSa01iRWJES2RCVU5rOWtU?=
 =?utf-8?B?ek9aWGRzNWl0NFlzSnIxWHpEMlZGRzkxTHV3cHMyUDJZaVAwS3hXRk5zM25r?=
 =?utf-8?B?Z25OZDdybTdWY0FHSGJGWjFQWit4MmFkQ0hraTdhMVJUc3d4aS84eTFnS2hE?=
 =?utf-8?B?U2U5RVUzTm92THhqL1kvZ0xNeDhsbnpxelRjTEJWbmlHc2QwSi90UWI0R0t2?=
 =?utf-8?B?NWVhK1N5ckpIbW5FSklROVR3cVVlNU9MKy9UYjFiRjVPZjRVUlNrN2E3dmN0?=
 =?utf-8?B?ZFJsMHY4OVRoN0dlNUREOFowb2ZtVGc0M01Bd0ZWWUJLTmMwVlE5bmFGTCtx?=
 =?utf-8?B?aVpxQ0JnOHhiU3JHMGV3OEFRR2ZWRm5oMUhxZXJQZ010K2libWZKM2FQTTBT?=
 =?utf-8?B?NnlsL3NkcEVOYi8xemtrOE1DREp5Njd0RnVmYStETWZtVmNtVzhlKzRrVnNW?=
 =?utf-8?B?aWJTeEVBZ2FCZEZhQm5ubXBhKzdOTTVqQ3A1UjluYnozWXJ5TXBzQ2FGYlVG?=
 =?utf-8?B?SHFtNUNKcEp2UTE3RU1jbkV2dFREakY2WmNZM0dOVWh0QzJITDFGL2FpYlVn?=
 =?utf-8?B?R0ZoSjJ1bmVaRS9FaWJHcGtqc1ZabHdoN3A3Y2pHMllMbjl5blFQVlJueXZu?=
 =?utf-8?Q?Zvzg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCC28A16FCF10740AC5257D2D62C2ECC@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49f9199-df00-4d92-ea84-08dd8219dea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 03:49:37.7088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdK2FAm9nYWFD/P7tZ3HUKacM6kMKBT+ldBXsvwA7nU4oVqgDfc1XUYZinrTZkeNbtDDJoOmpIue7+kcljnHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8259

T24gMjAyNS80LzIzIDAwOjAzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMDQuMjAyNSAw
ODoxOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBSZWZhY3RvciBSRUdJU1RFUl9WUENJX0lOSVQg
dG8gY29udGFpbiBtb3JlIGNhcGFiaWxpdHkgc3BlY2lmaWMNCj4+IGluZm9ybWF0aW9uLCB0aGlz
IGlzIGJlbmlmaXQgZm9yIGZvbGxvdy1vbiBjaGFuZ2VzIHRvIGhpZGUgY2FwYWJpbGl0eQ0KPj4g
d2hpY2ggaW5pdGlhbGl6YXRpb24gZmFpbHMuDQo+Pg0KPj4gV2hhdCdzIG1vcmUsIGNoYW5nZSB0
aGUgZGVmaW5pdGlvbiBvZiBpbml0X2hlYWRlcigpIHNpbmNlIGl0IGlzDQo+PiBub3QgYSBjYXBh
YmlsaXR5IGFuZCBpdCBpcyBuZWVkZWQgZm9yIGFsbCBkZXZpY2VzJyBQQ0kgY29uZmlnIHNwYWNl
Lg0KPj4NCj4+IE5vdGU6DQo+PiBDYWxsIHZwY2lfbWFrZV9tc2l4X2hvbGUoKSBpbiB0aGUgZW5k
IG9mIGluaXRfbXNpeCgpIHNpbmNlIHRoZQ0KPj4gY2hhbmdlIG9mIHNlcXVlbmNlIG9mIGluaXRf
aGVhZGVyKCkgYW5kIGluaXRfbXNpeCgpLg0KPj4gVGhlIGZpbmkgaG9vayB3aWxsIGJlIGltcGxl
bWVudGVkIGluIGZvbGxvdy1vbiBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlh
biBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPiANCj4gRnJvbSB0aGUgZGVzY3JpcHRpb24g
SSBjYW4ndCBkZXJpdmUgdGhlIG5lZWQgZm9yIC4uLg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi94ZW4ubGRzLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmgNCj4+IEBA
IC0xODcsNyArMTg3LDcgQEANCj4+ICAjZGVmaW5lIFZQQ0lfQVJSQVkgICAgICAgICAgICAgICBc
DQo+PiAgICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsgXA0KPj4gICAgICAgICBfX3N0
YXJ0X3ZwY2lfYXJyYXkgPSAuOyAgIFwNCj4+IC0gICAgICAgKihTT1JUKC5kYXRhLnZwY2kuKikp
ICAgICBcDQo+PiArICAgICAgICooLmRhdGEudnBjaS4qKSAgICAgXA0KPj4gICAgICAgICBfX2Vu
ZF92cGNpX2FycmF5ID0gLjsNCj4+ICAjZWxzZQ0KPj4gICNkZWZpbmUgVlBDSV9BUlJBWQ0KPiAN
Cj4gLi4uIHRoaXMgY2hhbmdlLg0KQXMgSSB1bmRlcnN0YW5kIHRoaXMsIHRoaXMgaXMgdXNlZCBm
b3IgaW5pdGlhbGl6aW5nIGFsbCBjYXBhYmlsaXRpZXMgYWNjb3JkaW5nIHRvIHByaW9yaXR5IGJl
Zm9yZS4NClRoYXQgaXMgbXNpeCA+IGhlYWRlciA+IG90aGVyIGNhcGFiaWxpdGllcy4NCk15IHBh
dGNoIHJlbW92ZXMgdGhlIHByaW9yaXR5IGFuZCBpbml0aWFsaXppbmcgYWxsIGNhcGFiaWxpdGll
cyBkb2Vzbid0IGRlcGVuZCBvbiBwcmlvcml0eSBhbnltb3JlLg0KU28gSSB0aGluayB0aGlzIGlz
IG5vdCBuZWVkZWQgYW55bW9yZS4NCkRvIHlvdSBtZWFuIEkgc2hvdWxkIGFkZCBzb21lIGV4cGxh
bmF0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZT8NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

