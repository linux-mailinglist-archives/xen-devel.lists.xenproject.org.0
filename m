Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC4CFF429
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 19:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197104.1514759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXrF-00043v-2K; Wed, 07 Jan 2026 18:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197104.1514759; Wed, 07 Jan 2026 18:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXrE-00041r-Vc; Wed, 07 Jan 2026 18:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1197104;
 Wed, 07 Jan 2026 18:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFOO=7M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdXrD-00041l-Pe
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 18:02:07 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f74701aa-ebf2-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 19:02:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV5PR03MB8411.namprd03.prod.outlook.com (2603:10b6:408:360::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 18:01:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:01:59 +0000
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
X-Inumbo-ID: f74701aa-ebf2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSdaQrPPas3r4DmDVsYDPbpWld91majtERyOWjFJuLHvCdDSPQ1mtSj7rNJsiEUnBqdnXbOl5HmFdBi1jUBGUZL4LQOftsTwfT8ahFfnp5pQdxopVIFObXwRKyaN+SEj1uLkJgH+9T/xq7msPhfK5YJ+bMuBKUBEpDCspHXGPBZmJV6mRSAVi9kZGs8V7/b4hy+SsSNkECt3qcFxa0h8f81XjltRultuV7flN02r+wsMhFSvsFKORpEnuWsuK089zL0/IQ3H33bluBpgFXZTtwlcpnbhT/kWo+YJlZtynISm0OJD6joBdz4j3m5rnCLIuE02EB+qf9mjn8Cbvda7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHsCGsnpSWYt16lVqmzOOp06AU35khhTb5siHQs4e94=;
 b=pdJ/N5UGyG2zu4XebiJouXqJC4iWzyOusF0R80rXAwOEAH9ylqomDP3gULks+W4wC7p4dbMK4zqKk1pp3evs+saFK7oQX3HeaWYi4fgEDrtGRAZ/gqHaTizCasRJulZ2jSlfU7xm82vBL42QsQztSNclcAX8uVO2DymAuo98ho0BbX5OWV5cE5vjQ28eKsNjYocyAfImcVZ+RAycVvS1VYrB9Ff8SuXvCVFGA2MREJyGV8SF2uPSU5liCWsmYoEEpTj85tz3UEQFH+M3AabF+Pzu2fVUNwaojrLQxCXayd9ZyWh+mBrZeWOQWA8Ygk/Zw9BkW9cRbRAY2FLbjaSfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHsCGsnpSWYt16lVqmzOOp06AU35khhTb5siHQs4e94=;
 b=Xe03Lo6IV5WjF6E3pvQfBB/pAGmX/0hxfUaSQa+i6TKFDHFjYqDirdvq32aaVIbytryGsLz5uJkHVHPfdu74kAuEB1dlFlRmR24sX+6UPTdt0bcOJGeluCPl0y1fJ22sN3orYvlbj/JyOeo3pvLsDwTnJgVrGnDFDAUE7dWV6hA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/mm: move adjustment of claimed pages counters on allocation
Date: Wed,  7 Jan 2026 18:56:05 +0100
Message-ID: <20260107175605.56617-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV5PR03MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: ef52875f-0bbe-4490-f82a-08de4e16da15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWNOZWtTaEhEL3BxTWNwRG5LbHNuOHRvTVJmTXZ4SW13N3U1cHl3eTNXTkIx?=
 =?utf-8?B?L3JUMzR0S21WNVJwajRodjlZamxuQ2tnaG1yaWloLzBmR2Q0OE9TM25uNGJ1?=
 =?utf-8?B?aWVWa3QrMUpVWHBlcWJHSDY1Ulc5d3NwUU82eTh5MSszQlUzZ0U2N3BDMjMr?=
 =?utf-8?B?aVIrUkErTks0SHRGR1RuMTBrMDMxd3AyVFBCRXBReVp6UCsybTNEWGxKaFd3?=
 =?utf-8?B?TkE1c2NpU1ZiK0dsMFpBZDEyNURUclBGT2hhZk9FcjdzbUYzcXJwY1V6ejFr?=
 =?utf-8?B?dHpBWW5hRnA5MHJ4TlYwcTN6SWJsSlhOT1JpSkU5WlR3cUhqdGV6UG43SDIw?=
 =?utf-8?B?TUQ2U1BZMDFjZ2dsUjBWeVNPemFidE5rSTN2N0FjNHY5M1F1ZUVwb3lzUFZS?=
 =?utf-8?B?WWtXT1pFYmdTTkFmWURQR1pOTGxXWml0MDRPaWlpWVBPb3gxdUJzcCtCdlpP?=
 =?utf-8?B?NVdnSFplNThBbHRyaDNPNmg0RXdES0NBZW5Sb2liVjcrUUJSNlRFdisvelVy?=
 =?utf-8?B?QWkxUldydDVWN2d1MVZvcHovc3NmN3NkVW1iY2NGTzJ1Q2E5cldMOHVaN0Rp?=
 =?utf-8?B?dkJtZ01EZVBLR3gxbi80RGo1SXl4L003ZmVZdExyYzUzdXIzckdGdmFOSWhH?=
 =?utf-8?B?R2lBQjhIK1FXd1JRbjVuTitMZGc5WHl6N3g2TEdSVmVMckkrYnpTdXVnUXVi?=
 =?utf-8?B?cTdiMVNEaTNZcS9nV3F2TTBwVHVOZjhsNU00SHRSd0cxSE8rZ3lNSlRkSHNE?=
 =?utf-8?B?aW5peFlaNkdrWHNmWUsrY3Q5MjF6SGMybWE1MzViQzNrMjJlcjd1K05HTExK?=
 =?utf-8?B?NWxZSlp6Qm01N0pZbXdmQ3Z1TnlzSUFUeEpBNzJBNjJjM2JTV2QrTmZxM0N4?=
 =?utf-8?B?NU02SjZ6VVV0eTFiUmRUTWlTWHQ0Y0VHVm11cUROZkdsUFgrYjM1Si9ybG1v?=
 =?utf-8?B?QUtGaktZVlUxVWU5YTNDM1ZOdWlFaWVyOHB0SVV1MXZRSWMzSit5S08vaDZC?=
 =?utf-8?B?OFJpKzlUYi9nL1M5eFk1cEdsbTVTODJwZ1lmd0dFZVMra0hIRmlvUHVDTjhM?=
 =?utf-8?B?L1R0bGdaa1M1b2tuZUNNbEZJTWw4b0g0eG1Kdng4NFMxT1VhTXpmMzFta2s2?=
 =?utf-8?B?MWdNNkJGZFlzaWtIMWhzbFNwRE9CQ0VQbis2MVVlOGNoU3ZtdGw4eFI5MjVm?=
 =?utf-8?B?blp1UFkxQVBVZENZNmcrTkxQY3BNTjB2aThOeWtsUm10OHlhd0FPeVV5cjEy?=
 =?utf-8?B?Wjczb3Z1Qk9PVGZoNTlmbytFUzEzelhlQS9LNWJTOEQ2aUhhMXFsd3o4SHFs?=
 =?utf-8?B?ZE15blMvMmZ2S2ZmeCswU0MwZmpFZ0tRVzBMMGMvcHpwc1duY3pIcVhaV3Fa?=
 =?utf-8?B?VjlvRXhvN1cwOUNlQlI1ZGRqK21nMm0wbW5STWlQQk1GdmkxUHpqODNaNVFV?=
 =?utf-8?B?VUE4N01Sd3FDU3BEZmh2MmJtdlFJd3RCKzh0L1g4QTR3OWNQcjJRamU2dlF6?=
 =?utf-8?B?am1UL1libFNZSGNBZVZmZVBubDUzc0wzVHNkUkJudW0zaEU5OGJyalN3WkdS?=
 =?utf-8?B?c09jMS90VFhwaE9CM0hwYlZ1TVhxWmRxT3RKNXdGTjJib3pJV3NxNFlzRlFa?=
 =?utf-8?B?NkVxaXgzVjRHUFg1dWNJL0syNVIzZWV0akdFTTZlUndBdU05U2V4aU42Z2pJ?=
 =?utf-8?B?N3ZTQUtOWnVLd1k5ek5mOVNxczdxLzN2ZmNMSXZ5a1l2Nm5YTTdsdVVsYTNw?=
 =?utf-8?B?enRCeDZNYm9VVzd0UnRLYmc2WkQ4UmdqUThqTXNhUmZqL2pJeHZLM0xzZEZ5?=
 =?utf-8?B?cDlSMEdLb3lDejVkcjluN0Y5SWJjVWk0VzF2NjRPaDY4Z3kzc1pVVG1Qc0hm?=
 =?utf-8?B?UDM0b3p5dlpoNVBxZ0xhL3dGbTJ6Y2NXMlExWXRxQXZGNGNOcW5yRkRocU1q?=
 =?utf-8?Q?TEOADmeDieeFi1KGG5YTH83FX5QuzNc0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTBQK1Q1M00wWW02VWlFaE9vYmR2dStQbEc3RGpZQ05IVlZCR1dTUE5oT29u?=
 =?utf-8?B?S09uSWRlVDJHNXVTRlppR0dRTm9XNFRJbXQ0Z21QTU56ZGtWV08rRmpLTUI4?=
 =?utf-8?B?UzhrMWx4VEp0bXRlRFJYMW1MdDNrWllpc2FtclprRW5QVWFoK1M2dEpUWDda?=
 =?utf-8?B?SFhvOHNxZGtqUGpHbHdjZzV2TGV6d1NxMjdlbGwrL3RIU0t5QWhoT0hQRjZU?=
 =?utf-8?B?THRqWkFUaGY0YlAvVWVkZDZ6VVY0UlBNSlBMdmhVdUY1TldUOENzaVZCMktW?=
 =?utf-8?B?dzhIeWlZL0tzVTdsVERjd0Y2YnpPVEhyTWtPbTJtbW01WUFCcTNZaW1YdU5P?=
 =?utf-8?B?Y01sUUQ1U1c5clhmMXVPYWVTZ3BtcjdLa2tqcWtrSHBEcHpNSGpVTSs2cVRF?=
 =?utf-8?B?RUJKaHMrM2NOS1RrUys0TWc0MzRxZGhBOTYvbmxUS0owNVZpdSs2MGFYZGdI?=
 =?utf-8?B?Y0Y1QmhWU0Rqa3pwb1JyaDVmMHlhSW5FMlh5aXpYMkp0VktybHJyd0t0ZU1S?=
 =?utf-8?B?dVlxdDJtSU92RVBRNnB6MlJTU1lzQ3lIaXRpaHl2N1ExRllabElDUC9Bbkpz?=
 =?utf-8?B?LzNtTHRnWDV5R2ZSdlpFQ2doRWRxTGJxZHpIUmQ1ZmQ1MkxYNGZ4Q0RFR0xv?=
 =?utf-8?B?U3lFb1hLVXk4d1ZPZEhWTTVleFJyZmNDM1NsY211ZXB5NG51N0RtWjNLaDE5?=
 =?utf-8?B?dk1YdVdqMlVTUGtzOUpOcVJqMjQ5QWJDUkZ4NmM1TWd5dHp4NkZmWGlhdG9u?=
 =?utf-8?B?RFc3aWdhNlRxL1RoYTd2anFhbXhHRXA5SVhuWUEzQ3VHVnAzMVdmRVZXRXpD?=
 =?utf-8?B?VWxhZjB0VjMxdWZxOWVSbmxzck1KTjNSR2ZMYVo5UWp0OCtUL1VSY1FCaXZB?=
 =?utf-8?B?WThrRVIwckt6R1Zkdlo3cXBZbEl1SmJ5V1k4N0YyTUJDWE95ODRtSnkzeFA0?=
 =?utf-8?B?eHl0UnBKRmFxRHRJUWc4a0lWcXNIQVNvWktNVnNKQUdMU0xucFlLbTRjb1cx?=
 =?utf-8?B?UDRtekRHV2xiMTByazErb0t2dms5U1BWcmQrTk9oTlJpZ0oyek5tL2FkNG5q?=
 =?utf-8?B?RC9Sa2pDSjl1SUVPdVlnak56bU8wUVVwQVFRUUUra1ZMTGozQjFubnE5NGlm?=
 =?utf-8?B?UlRQNzRuR3FyVkQrcHhNb0l6c0F4SnpGNjhueFVPRTU5bk1oY1FMb1kvWkda?=
 =?utf-8?B?RFo5YlNUcVFsc3RvOEYvWmptdER4cXBDaHh2MTdKRk02UXhWcWV3ajVEREcy?=
 =?utf-8?B?d2M0TnpEelJHakdmN3h3KzdPMk9sR2c0VUJqRVVZdDR6alA4L2lPZnhPR2k1?=
 =?utf-8?B?cGhoOEk0aFdpMU9UdkhHLzlXSHhBVjRLNmhETmMyamdnWDRscjlVdTRsK2Fw?=
 =?utf-8?B?Yk44WGZoOWRPTjVwci9wRGQveGRsdkpLeEhqRHpzaFZmbXlDR3NrZkNKM2da?=
 =?utf-8?B?dk5QSHBZMHRkTVJUZTNPbklSQkNRRUdTWWROYXc0eHp4MmMyNE9qMGRkbFJv?=
 =?utf-8?B?OTYzaHh3b2lLRmRyc3N2SGZaVGcvNFJPdkxrQngzS3JyRVQ3ZTR1ZzREV1pN?=
 =?utf-8?B?U1I2dDRmOS9kczB3Z1ZVOWVYdHo5SytXUjZKZktOcThjdFdmay9GS0Y4SnBt?=
 =?utf-8?B?ZU5OOTc5MEo0ZmNUd0tOQ1A4dmtwZmVaTDhuaWxzTDhpZzJ3aXd6cGNaTXd3?=
 =?utf-8?B?S1U0YklXT0hlV1h6V3daNGgrcnBYR0dCTHBsNTN4KzV4bjRiMFFUK0hjK0c0?=
 =?utf-8?B?TWIvVDBIYVF4SGV5aE1OWUVUR2dmMWF2aE1wY1paUmRaUjEwcGJjZVU2VURz?=
 =?utf-8?B?MnZQN0s0cEIxaDlvbmdLaXJkYkpPNUZzMDBvU2IxczVsNGprYXVobHczd1Ni?=
 =?utf-8?B?NG9EZldNTDl0aUErQ1Z2YXl5TFEwS3pseUFrZTZnM0hySmRrMVZsNW12dGUz?=
 =?utf-8?B?MTFhOXpqd25URlFMcTl3Z0dMTGMvZFVIMDFvQ3FHRms4SVJVc3RFOFRGdUxL?=
 =?utf-8?B?blJIb3A1eUJJVkdKeVh4T3VGeEptT0VhL3FhNjRpRmFqdURxNk92U2FITzJr?=
 =?utf-8?B?RTMwbkEyTmhsNndSa1Vrd3NBZDNEVjB1ck9WNXlEbEo3ZWROYnZEK0w0MEEr?=
 =?utf-8?B?NFNtQ0x3N3dTNEtaSU01am5lWjExZ1cyL0RCSzJHeUJSNDVrU3NIY2dQUXRE?=
 =?utf-8?B?YnVwd2ZtZG52MGptRHJxSXhMU01VWmJGUTZZZzZ1ZTVoc1IyQzlBSlNQcWIw?=
 =?utf-8?B?NkwrT0FtQVpkZWI2NnV3NlBHZGcxTS9CaFVVb0FaYTI4cGUvYTB4c1ovc0ow?=
 =?utf-8?B?T1JnUWw5V1lDcWxPK0dhdmJqQ2FHTnZraDVpOHltRFFVaTgxN0ZtUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef52875f-0bbe-4490-f82a-08de4e16da15
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:01:59.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aizouMNBN+qSS0YOimmBlCd0PorY1dDp/+Fxr1bRp/RVbWefa3Hm9nPP/LVEKhfj+DtxXQH9zs1bGU/H6GGS3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8411

The current logic splits the update of the amount of available memory in
the system (total_avail_pages) and pending claims into two separately
locked regions.  This leads to a window between counters adjustments where
the result of total_avail_pages - outstanding_claims doesn't reflect the
real amount of free memory available, and can return a negative value due
to total_avail_pages having been updated ahead of outstanding_claims.

Fix by adjusting outstanding_claims and d->outstanding_pages in the same
place where total_avail_pages is updated.  Note that accesses to
d->outstanding_pages is protected by the global heap_lock, just like
total_avail_pages or outstanding_claims.  Add a comment to the field
declaration, and also adjust the comment at the top of
domain_set_outstanding_pages() to be clearer in that regard.

Note that failures in assign_pages() causes the claimed amount that has
been allocated to be lost, as the amount is not added back to the domain
quota once pages are freed.  Given the intended usage of claims is limited
to initial physmap populate, and the current failure paths in
assign_pages() would lead to the domain being destroyed anyway, don't
add extra logic to recover the claimed amount on failure - it's just adding
complexity for no real benefit.

Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Revert back to the approach in v1.
 - Add extra comments and justification in commit message.

Changes since v1:
 - Regain the claim if allocated page cannot be assigned to the domain.
 - Adjust comments regarding d->outstanding_pages being protected by the
   heap_lock (instead of the d->page_alloc_lock).
---
 xen/common/page_alloc.c | 59 ++++++++++++++++++++++-------------------
 xen/include/xen/sched.h |  3 ++-
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1f67b88a8933..49ca70334458 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -515,30 +515,6 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
-    /*
-     * can test d->outstanding_pages race-free because it can only change
-     * if d->page_alloc_lock and heap_lock are both held, see also
-     * domain_set_outstanding_pages below
-     */
-    if ( !d->outstanding_pages || pages <= 0 )
-        goto out;
-
-    spin_lock(&heap_lock);
-    BUG_ON(outstanding_claims < d->outstanding_pages);
-    if ( d->outstanding_pages < pages )
-    {
-        /* `pages` exceeds the domain's outstanding count. Zero it out. */
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
-    }
-    else
-    {
-        outstanding_claims -= pages;
-        d->outstanding_pages -= pages;
-    }
-    spin_unlock(&heap_lock);
-
-out:
     return d->tot_pages;
 }
 
@@ -548,9 +524,10 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     unsigned long claim, avail_pages;
 
     /*
-     * take the domain's page_alloc_lock, else all d->tot_page adjustments
-     * must always take the global heap_lock rather than only in the much
-     * rarer case that d->outstanding_pages is non-zero
+     * Two locks are needed here:
+     *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
+     *  - heap_lock: protects accesses to d->outstanding_pages, total_avail_pages
+     *    and outstanding_claims.
      */
     nrspin_lock(&d->page_alloc_lock);
     spin_lock(&heap_lock);
@@ -999,7 +976,7 @@ static struct page_info *alloc_heap_pages(
 {
     nodeid_t node;
     unsigned int i, buddy_order, zone, first_dirty;
-    unsigned long request = 1UL << order;
+    unsigned int request = 1UL << order;
     struct page_info *pg;
     bool need_tlbflush = false;
     uint32_t tlbflush_timestamp = 0;
@@ -1008,6 +985,8 @@ static struct page_info *alloc_heap_pages(
 
     /* Make sure there are enough bits in memflags for nodeID. */
     BUILD_BUG_ON((_MEMF_bits - _MEMF_node) < (8 * sizeof(nodeid_t)));
+    /* Make sure max order doesn't overflow the local storage type. */
+    BUILD_BUG_ON(MAX_ORDER >= sizeof(request) * 8);
 
     ASSERT(zone_lo <= zone_hi);
     ASSERT(zone_hi < NR_ZONES);
@@ -1071,6 +1050,30 @@ static struct page_info *alloc_heap_pages(
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
+    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
+    {
+        /*
+         * Adjust claims in the same locked region where total_avail_pages is
+         * adjusted, not doing so would lead to a window where the amount of
+         * free memory (avail - claimed) would be incorrect.
+         *
+         * Note that by adjusting the claimed amount here it's possible for
+         * pages to fail to be assigned to the claiming domain while already
+         * having been subtracted from d->outstanding_pages.  Such claimed
+         * amount is then lost, as the pages that fail to be assigned to the
+         * domain are freed without replenishing the claim.  This is fine given
+         * claims are only to be used during physmap population as part of
+         * domain build, and any failure in assign_pages() there will result in
+         * the domain being destroyed before creation is finished.  Losing part
+         * of the claim makes no difference.
+         */
+        unsigned int outstanding = min(d->outstanding_pages, request);
+
+        outstanding_claims -= outstanding;
+        BUG_ON(outstanding > d->outstanding_pages);
+        d->outstanding_pages -= outstanding;
+    }
+
     check_low_mem_virq();
 
     if ( d != NULL )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1f77e0869b5d..d922c908c29f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -413,7 +413,8 @@ struct domain
     unsigned int     tot_pages;
 
     unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
-    unsigned int     outstanding_pages; /* pages claimed but not possessed */
+    /* Pages claimed but not possessed, protected by global heap_lock. */
+    unsigned int     outstanding_pages;
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
 
-- 
2.51.0


