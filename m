Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB5BDED40
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 15:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143610.1477293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rI-0002ej-DG; Wed, 15 Oct 2025 13:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143610.1477293; Wed, 15 Oct 2025 13:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rI-0002c0-9c; Wed, 15 Oct 2025 13:48:04 +0000
Received: by outflank-mailman (input) for mailman id 1143610;
 Wed, 15 Oct 2025 13:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v91rG-0002AF-N4
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:48:02 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 910a3c23-a9cd-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 15:48:02 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5176.namprd03.prod.outlook.com (2603:10b6:610:97::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:47:59 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:47:59 +0000
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
X-Inumbo-ID: 910a3c23-a9cd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0BkMybkNUXFq5Ay8rwziW+NuXZuVpYfUgNaxhHlInYZhoTzv4wM5cHBEmnhFk+USr3GkixwddErAdMVHBzOqyDTzDJwErY7PoKJMqtI5+kuBI5d5BPgh40ThotC7y3sj+kqIX3HrjwdVoL98b5x3bmDEAuOP/eONJH+UEw7Wpg0T6BYrC4PfbFiJv2bXKfGU1M1vdJFXnRQdnaWWpzxlTpp4bhdJaUGwvzWfR7oQJ2yIt585HF7Jw5hV3jSTFZkj9b3FthukXX0Y5qmyox86OoNmdjErFIuqeJYhUAIpjZieNiPM7g4irBn+f4EZKdQS88yC4Bkcy+dfPv2dMEK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14kYZ37eR+zBgiRMbpoPo4RJmcTjOY4j9c/vWRzOLaQ=;
 b=aqkW27WHo3HYYjRVLSgXwv+7Gt99gyXmV7Y6uFW0qrU/QXGdQFtcZTKpTCny0WSIDmPQmuCKM+ivHUi/EHewwSu2mGmqC2VfHfva38Ni9CbumbcQL5fL7aI411dsqtJQcRDVrv/6QGayxmXm3OwIy4MkYrIaclWz+lm2aCz8EzG5FjPW6oOKOGsFPzDpKur1AKF3S5FSCp8AofLt+X3RHR3YvmcZCTUiC/aaKQnCHM8rdtgRa3hASdjwxmca/17Kdw04FJjCJXz2CePF7Fp/tMDsFT9/sahfsUUQRp3xTLiY60AsBtKhtnYzixHj6xoeknW4qBD87LoVJaWglvTITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14kYZ37eR+zBgiRMbpoPo4RJmcTjOY4j9c/vWRzOLaQ=;
 b=cN35uQB9trHvUYzFZPhN/hY3ifgohxyOP+vofVBXv5xEinc3ninIybIKelZr62MxzSVyvAcxafX0XAGDiVjK+YFjIk+H9vHmaOwyxhA9C2AlAb0e7Q0GFL3PWzBmZBW9YZzyfsWYmVCU3zjgPNVc4Dll3FuG6fRuPx0Zn7UMoeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.21 2/6] tools/libxl: avoid freeing stack rubble in libxl__json_object_to_json()
Date: Wed, 15 Oct 2025 15:40:39 +0200
Message-ID: <20251015134043.72316-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0049.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::24) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: f294ec7c-1fb3-4c35-66f2-08de0bf1740e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0FHU2lJcjk1OWl5MWovL3ZMNTU2bGtrbkQ1bWJVL1IzTGRoNnlZaWkzRHZO?=
 =?utf-8?B?Z0xGbDBBT3dVUGdkbnN5NG5KZmkwNk9JbEI5dDRtV091RlpjZzdxMTcrcVM3?=
 =?utf-8?B?S2xZKzFGVlRMNWFIaldXUy9JQ3doSnJ2aGcvR21FMm1KdEcweHRnRGxVdVgz?=
 =?utf-8?B?REZvTkhSZXQ5N21Qd2V0N1FuQkd6T2hJVndNVFFNc0RPcElkL2pFZmxPRm43?=
 =?utf-8?B?NnVrcWxXNzdIaDNBWnFaMTFwOUpMalM0d296UG93L3lXbzNCcFRYenMxREV0?=
 =?utf-8?B?TTVzbmhrK3h4RjR2b1BiRjcwd0pmZ3dJcncrVm9lTkdiVE1ESWlpOXA1MWpi?=
 =?utf-8?B?ZHJvbXdoc3E0UlExYk1lMTI2WUxOUEQ5Z0lWbXhPM0ZQVFhEUjZNV055dDIx?=
 =?utf-8?B?cWtwNHhTQkw3eWdMTmU4OWt5U0tHUEpDS0JnaHdHa09HY21xdE8wcVh5UUlM?=
 =?utf-8?B?b2sxbTlKaTFOc2lMOXZvSS9xSUpPZ2phOVZ4aEh2M21ndE5PeUJrS1d4bTIr?=
 =?utf-8?B?NVc3RVVJTXlaWEtQU28xUFdZY1VlbUttT3RLVGVwWk5CVm44NjZWRUh5Y1A5?=
 =?utf-8?B?TGRPeFoxVi9qbm56ZDlkY1kyWUJpaXVmUWV4NUN0aUlubVZNQ3lkVDlDajFo?=
 =?utf-8?B?SUw1VU1yakRodUNEQTBIOXBGeTNndlVSbUtKNnJkTkFVaVZCNlMvRmpxUWE5?=
 =?utf-8?B?U1lHWUpDNXdEVlAwOHp5dWk1Nk9KVEowZkQrMnpURWFkYjR0SEpMNEhjWTFx?=
 =?utf-8?B?cVVaMTVkeFlDaTZJZkF3TnJqSEJLNjRoSlNJTHNkRlVhdW9tZURCYitHTWRk?=
 =?utf-8?B?dG9MR1QvN2t4a2puQWxNWVFJVGdPODJ4U0F5Smp6eGJnOVBUam8zc1UrWU9Q?=
 =?utf-8?B?anlkUE9JalhNRnNnZ3FjRjlUQ3hQdE1ZdlN6QnlPd2d5QzI3aTNNaTdQb2x4?=
 =?utf-8?B?N2Y1U3VGa1praFhHc3dsTmVieWhLOEJQcEd2a3FYVFZ5VGY0dkVsb1prYndi?=
 =?utf-8?B?Unpyb0pSK05RZmhtd3h2eUdSTnFFUnIydlMvMzRTRSt0VkVLVFdWM3F0QjBk?=
 =?utf-8?B?YjBqZGVKdGhtMm5hall2eDNtR1VCT2JUZDF3cGpKYUVWVmFvK0hFZWZBcG5J?=
 =?utf-8?B?MjNhODJkUDRzVHFyMWcxRGtHN1Y4NUlQRzVzRGpGNi9KTFBqMTRFNmJGM2JI?=
 =?utf-8?B?d3QwalZHdEZEQU1RY0dhbkQ0eVJ1MXNxVGNqdGxaZkdNdnJiZ0h5Yml4UUEv?=
 =?utf-8?B?TlkxekFVWlVvNC93eUlzY0plSVpqTHlzekxxVnpFUTBaanlqcE13Y1pPaStF?=
 =?utf-8?B?MTFkQ01jbXhHRG5FQjVzQnQzSElkS0ZPem9qWlRMVHRkTXNsd0NXOS92RUJ1?=
 =?utf-8?B?bGxsME14MFc5VVluTjhYSGtsZFpHTElOaXVPazdBQUx4cFhEZHhDZTNUYzlV?=
 =?utf-8?B?bExzNFZCUVdDUVJVSkNKSW8vWUxTc3JrUUNHK2NHVGFIT2R1WC9rVng4UGU2?=
 =?utf-8?B?RkpvZ1ZDV2RNejQ1Y0hNckVTeXcrY0JPZ0NCL3lDSXY2djhyYXFkR1VYalNr?=
 =?utf-8?B?M1hGcG1GRi9ZL05MV0ltZG9RVGNwVEl5M2FJV1laUUpnMG1jNFVLMS9RNU9a?=
 =?utf-8?B?OWpGSlIrRWFhK0N2L3pUZWRhK0xhSmhjbG5CL0ZXSnozbVdVckVsV1NaSFl0?=
 =?utf-8?B?SE02TGNUTXRTalUzQlV1RlY5dTIzaUlEdUcrQlJCaHJzbytNMlo3SGY3VW9Y?=
 =?utf-8?B?WEZpbDNyWW1sUy8vbzl6OEVVRkovL01yQmlDU0FBRUFveEhCTVRTck4vQndr?=
 =?utf-8?B?dFVEbUFYMUlHMm9NVnR2dzdOWFg2TGVIemx2eDNDR09ZY1BzbUIzTHZoN2tV?=
 =?utf-8?B?RGVTYUdTeWtsT3JvQTFGbUw0R3NCbGFuYmJkcWlGblVyR2tKSjU2YXZ0U1FI?=
 =?utf-8?Q?8DmPNsrMR41mfm8Lc4OmnSCiOd2tKkqO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGE1cjdMTzJuUXNHYjlkMUM4T1p6cVFKYjVleHFvSVExRGs0V21Wa09kTkZi?=
 =?utf-8?B?MnF6MTNCUFFHSVlkZEZSby9oQnhwRDdkaEpCbFBhN0d0aFpHMGRyWFlyc3pz?=
 =?utf-8?B?TkpyajJ2TCtlZFhMbFZRV0pRcisvTCtrWERHLzduUGVYRURLOEhMWFlJMDdX?=
 =?utf-8?B?VlVLRHkzSEdwL0RiMjRJcDdJRVR2bjZ4dkhGak5DUWRQNUhsQ2lXeklkamtm?=
 =?utf-8?B?Mm9EWkg5MFl5VDU3YldXNzZnM3FaeS80dnFrZWVFaENjK3YrdkFuSW84VElv?=
 =?utf-8?B?OEthMTJkSXk4dEE3OWJoWXZnTHhKMkw4TnpWbnBOcmhyN2VrTjRKTHBiVFBz?=
 =?utf-8?B?R3QrTEhJeTRQb3RONCs1dFQ1V3VlNVI2cHlVYUxBSFlGNHY3M3YwUE1FT0Nn?=
 =?utf-8?B?WllNWWNWSlR3RjJmQWJWNzBKVEtzUnpZY3ZNYTZOMTNUdjR4cUFUdTlJbUxq?=
 =?utf-8?B?aGlZNmhJSWU0MXA4QUpXNWNZWXU2Z25MVitrS252cjZrRkJVNjIveWJrZ1pu?=
 =?utf-8?B?K2FhS1p1eTVjWFoxVEltQVNja1RWQi9GdE1lT3UvbitCQ0d2OWovb3pYbU5P?=
 =?utf-8?B?TFRSWEZ3N2hlbXVVQ0VMcEV3ZEF5ZDZHZVFjODZDSks2dkEwcFRWam9NcXpm?=
 =?utf-8?B?c0NvdVJPMnIwNFh5WTRQZE1EQlZnQzhnT1hrOVpMeGExTCtPL1NFRDhFK3B1?=
 =?utf-8?B?bndCMkE0R0dnZ2pPaXhJWEQ1em5rK3NIc1F4bEg3ZzloNlJsaWd1UGZ1aHZH?=
 =?utf-8?B?WUNCMkowbmFhSEZFbnhUUExFYm5IUlBWY3B4cnJYV1ZYVjJiQmxSSXlFVjkz?=
 =?utf-8?B?RThrWTN0czQ2b2xWZTIweXRIYmE4c0ptKzlSQVdMbnFTYm9tbXNZaVVNYUUw?=
 =?utf-8?B?OHR1OHNwZ0s0cW9GanZpZ2VRQjZwNGhMYndhMzhWTE00QVF0YkMzYUtrNEN5?=
 =?utf-8?B?Vll0TGh5OWRuYjZYOXRtVUZ4SlVVSE1ob1JTUml2eUZ1cUJNL2FjWEVIejlO?=
 =?utf-8?B?ZTRBbFZYbEJUS0dNOUVaODNzRWNXQ3Via0gvOTRFTlByamlIT1RoWmx1M3Bh?=
 =?utf-8?B?ZmxEWTV2OUpoRTVXNGt4OWp0WTNjeHQ5U0pramlmUlNkeVRxN2huM2ZycTZK?=
 =?utf-8?B?akxOMEplaHU0V2pVSzlTYWxYYlBOVitodHUvdEFOVkpiMmhidjZxNlFVQm5t?=
 =?utf-8?B?SDVIRVpXQ1UrWE45NDJ4SllxK0VtS0xFWWI2ZmU0cVNwUjdhN3R0SnMrMmdl?=
 =?utf-8?B?cmpNYVhOVG1HT1JXRlI4dE95WWlOUHp1ZUpJTkk5RkhDb0pnajF1T1MzYzVm?=
 =?utf-8?B?YmpRTFd3OUdFaC9HeHRaTCtMQkkzVnpoU2ZuUVM4SzRRM20xRzE0cTgzb1ps?=
 =?utf-8?B?emltaXVMdDRoL2d5ZG96enVicitzSHlCeG9IODVHLzRmNmV1WTNjZzlPNHF2?=
 =?utf-8?B?TkxrMkNFTG9zdmZaek1GQTJEUmF1S0ZkRE5Ld3FKbTBLVzJMSSsrWVlHYmtp?=
 =?utf-8?B?eFF3NzM1WlZFZ0FSVWNvL0VpdCtTeWE5cGZCUzZzNDFUdmgyTUlEU01uU3Er?=
 =?utf-8?B?d0pOdkJBL1pvaWRXZzBveXpZVnlZRExTcTJJcDFOYktQdjVWTmRRQXpueXpF?=
 =?utf-8?B?RmpBYk0ybWtpMXlZYVpScVNvbEpTTkUyWlNtNklFWGtwY3B3RGVMQUttMnBx?=
 =?utf-8?B?R3hzcXpQN3kveEFXaU9BQ25EcXc3VldnbFI4U2hIQ0MzTUdIaEFPNEFDQWdl?=
 =?utf-8?B?aE5RNlR0WVRSUVhGNTZxUTFLSXI5NWU5ZGVaM3RDR0VXUlJleFkzTm5la1Mw?=
 =?utf-8?B?ZmJkb0g0eDJDTlcxS3pWZ1M0NFU5L0FUQXFZVzZDaUcxa1VPT1RUMkpMb1VD?=
 =?utf-8?B?ZURCMU1iRnhDWjZHS3ZUVERFdW4yOWRETExVaVRkcndPdHdDQ01JR2R6WGlT?=
 =?utf-8?B?RUFIcDRxWmFmZ2lmTkE0dFMvVnIzdE1UZ1dFbUNreXZ6NWRjTUFuY2V3SDFj?=
 =?utf-8?B?YnVCU2RYcnFjdkFtcjJoSFJjRDNxUjdZMDlyY2tmT1ZYN1hDdG0wNm1Ddys2?=
 =?utf-8?B?RTZIdW8zSm9TWHAyRy8vczBpUmZFOFJiZzR2SUFleDNZNjM1eFFkZWFVSUQ2?=
 =?utf-8?Q?c2jCTCJj1cqkvPUZ4dsd/V813?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f294ec7c-1fb3-4c35-66f2-08de0bf1740e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:47:59.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEEFpEFO6K5gE5pHPzx3XU4hijwEIANqJzf6cbRkaFIP5faM+dLEvmIYBocMf4xCTKTBNvS0aZEW4bCVNJhKrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5176

It's possible for libxl__json_object_to_json_object() to not set the passed
jso_out parameter, hence initialize it in libxl__json_object_to_json() to
avoid freeing an uninitialized pointer in case of failure.

Reported by XenServer internal Coverity instance.

Fixes: 75fa670e582c ("libxl: Convert libxl__json_object_to_json() to json_object")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_json.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index a9e06b06932d..b01d86363550 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -1533,7 +1533,7 @@ char *libxl__json_object_to_json(libxl__gc *gc,
 {
 #ifdef HAVE_LIBJSONC
     const char *buf;
-    json_object *root;
+    json_object *root = NULL;
     char *ret = NULL;
     int rc;
 
-- 
2.51.0


