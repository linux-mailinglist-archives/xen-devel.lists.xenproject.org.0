Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9BBE7219
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 10:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145033.1478186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9fhn-0005BV-Hd; Fri, 17 Oct 2025 08:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145033.1478186; Fri, 17 Oct 2025 08:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9fhn-00059q-Dy; Fri, 17 Oct 2025 08:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1145033;
 Fri, 17 Oct 2025 08:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9fhl-00059k-0P
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 08:20:53 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30ccedc5-ab32-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 10:20:50 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by MN2PR03MB5005.namprd03.prod.outlook.com (2603:10b6:208:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 08:20:46 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 08:20:45 +0000
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
X-Inumbo-ID: 30ccedc5-ab32-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpVoSpG7CQopQWx/2JCy7keWVd9JxBFaM3bwgPhITIDShxtyJoAfSm8yiX+/HYdu4KAQx6lFY8MP9n6Uv/+cwkUGuYxkZB2yMtnkSzasB98IZAO5AvddT/bJhfTH2B36k/HTHcVcptlWHfqKhCRSLvtNiwOyqNiTz0qwS0FkajzAwzpY5UDiXJf5vbhwWZDeFbZ5sxzjRIGYDdhy2JRqEVWCqsoa1rOXJXfhm/LLtGBhLGkAkgKUhg4at772BmPhyV78cskj6iWvMlRypAW2Ibkx+Wn9xufnxas1lENpgXQt7cDJSjyAn3yvcK3wUa/hzIJDBDt3jWLN2/ReKwQ2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+YrNMuJRG7HSNdPyubwNjHFZpShc6ZOekQbTXP3uec=;
 b=iD8nCUxzz1yWjK0ut09k03dS/MQ7NUVTcDLizGyhds4WA0GutTr2e+j8VbYH5QsABN2vNrx1LADW6Ov5a7EhlI7cIOY6uYIoh40gkcQYt1Wqtug4w0uaLlOsoeY85XbUTCL5d29SkTQesM4bPdFkuf+WdinLceIOhQxvkgYziGQg5nA0PucXOm8bfZ8WVjw379CZgH6d0fYeuwCxWMhrWwU9MBg60/dzbsfXodrqh330vAt32a8cVFEiqr42T3IprqtiBGzr0QxLqnNxwuFV2+ZPcd8vtVYZQZc39+wT5dnvzNafhCo5AXzjbdzQNprIhkazzIU5o6j8NwdGpNuU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+YrNMuJRG7HSNdPyubwNjHFZpShc6ZOekQbTXP3uec=;
 b=dZnVh95F4XxP0j+QDTaxqWDpVN6FbaIcvOXCd4MMpjRYB7nbpvCdIfVFdJk6L8g7Uu8VfJimYnGUoLw4kT59rEK41DhfC3iU5IdWvpEtR55AtrsioZZXTqp4+qD2vEDoRmnXF4GeyLME33awlw8pHEvaC/cRJjg1j3iu1Aa0rtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Oct 2025 10:20:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPH8Waqi5hJyCuzO@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
 <aPEc3VWLI0ofq22f@Mac.lan>
 <39f00b12-a3f7-4185-a8fa-2c99c43695d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39f00b12-a3f7-4185-a8fa-2c99c43695d9@suse.com>
X-ClientProxiedBy: MA4P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|MN2PR03MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6c6e7e-c94a-4e9e-d60e-08de0d561226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bi9ZYWRtTUpjWVZYNnAzQkkyZXhMT1VFdGFpaGtXM2taUzkzcVBVS0x5TWdI?=
 =?utf-8?B?T1B6TExZUFFXTjl5elpEMXBFTkdUWENmNFVDSWF3NWFHUjh4VTNXYWtKOHZN?=
 =?utf-8?B?QmNMMXhKU0JVVXBUSHpMQW5rakhaRXRoOUJvWUEwUTBLWFVuM2RyZGRveklS?=
 =?utf-8?B?QmRCUmRmS0FyZVhtMUxya3RsR2tDSTlsUm5SWjNRQUxwc3A5WjZWZnd6N2ow?=
 =?utf-8?B?bFBkNTFsWFJCMlNxUVVlclJoYXBMZlB0b0NxcG5IUWM0VVZyTHVtMURIdURn?=
 =?utf-8?B?Ky9CVEM0RVJVb0pyQVpTS2VqdHVqNTdjWVB2UHJ4bzR1RCsrdTIxZlhwU3p5?=
 =?utf-8?B?R0lMMGM4eFdPcFU0MVpOUHFPNEJ2QzZHcGl5YXl2cFZpRHpxSWpRRTlPRnpX?=
 =?utf-8?B?UTRZN3VqWllIbVBqUHBYNlFxa0hJN1ordWs4cm5STWJsZ0ZGb2VVWkdQMGlv?=
 =?utf-8?B?SzcyVjRUY2VJVldKNE5YTWdRZEtmaUxGd3NjbEN5TnRtZDd2ZnpFQytVQ2NS?=
 =?utf-8?B?Y1lmaXljWWJldDVFQkpaN05vWjduNXg2WHY1dHpPd3hXd2diYmp2c3RrTk9w?=
 =?utf-8?B?K0JqQUZjMGNJZmhmZWt5REFRdHBnYXY4dDJTMVVlbS9NSFA0TEFsZmsrUk9s?=
 =?utf-8?B?aXArd0thS1lhSjZJajMrc1pvSFNDeXZVVSthd2VVU2ZpVzh4RTJiMVBYREhD?=
 =?utf-8?B?QU5xejZKaXV5cTZrajNjS2d2WGkrYXh4aVhwODVsUytja1hQdUpNbzhXNWFJ?=
 =?utf-8?B?dldNQXpsOHcxWGdpYURZZFI1M21mdndZWHlFakg5emxVUkNNODNaL0dNMXZJ?=
 =?utf-8?B?U1JNMHg3UTlpZXFaT29vTm5wWTBZeTVUUTNPM0RhK1FUSmVKai8xR2hmRnIw?=
 =?utf-8?B?Q2ZseFNJbFhzcEhmRW9nSzlNUmplRVpNK1BDOE9heUhudnYzYmRlZWtBMXVx?=
 =?utf-8?B?ZnVFUUhTMUtkdm1VMVdETE5Hc1hnOWw4eUIrekFvaWhGa0xhdW15anpndFdM?=
 =?utf-8?B?ZWZmWmxNOUVYY2F0N1AwdW5BYVZsZ1pwOUpXTmpSRmlCc3d1ZGYxRW45M1Ro?=
 =?utf-8?B?dlVUT2lkVjZROGUra1FIZmdDUkxlK3Y4aTZRUG1RVkc5NTI3NkxFeXhzRzNQ?=
 =?utf-8?B?WnZHZEFBZE42NTNPVWxQNDkyVk9vUEtKR05lNms2bzFoQ3ppTnRkRW9PN1RS?=
 =?utf-8?B?NjMxcDBjc2NYc3hFT1p5MkJ3VFB3eTd1R0YydDk4U2Q0TUZUc1JhQUU3S1hW?=
 =?utf-8?B?MjFLek10UENyM1RqWGFIcDhBTDJLTU9xZ0E5anY1aUYyOGV3N2x6bTVpemwv?=
 =?utf-8?B?UmdEN2ZhTlNsQXhrVkliMndwYW5YS2NscUpwQW54enpPNnEwTHNySmxiSUxJ?=
 =?utf-8?B?em0yNzFGcGY1YWlESXdGaEFpSmZzRnJrUUNGTVowQjEyN0pwRTl1SlRyMy9l?=
 =?utf-8?B?ZXk5SWwxUVdDTlEvWm93MTNwa2tPUUNoeDJnOHpBMVlxaGZKK012eU9ESlZx?=
 =?utf-8?B?YnNydnpXenR5SFJIQXg3UVNzOVBERnFhSFZuVERnUHVLUmY0Yy9lN203YmJ0?=
 =?utf-8?B?cnFIM0dOR1g5bms2T1VTK1VqV1lId0tMbXJhSmRpeG9QRmhSWjVGMDd6T2pC?=
 =?utf-8?B?ZTJqQjVzRyt0TG9LMFowZVJ2anBhcjliRXova1NQVW96MFdNTG5NeHMzb25n?=
 =?utf-8?B?NUN2SVBVVFIrR01qMTB3Yld4VGJKRVAwTXVwbGhyTHdRKzVnckhQcVU5VWNN?=
 =?utf-8?B?Nkt6SmhCVmYxQjBHOUMzMmVybHhrMXhCMVZ4NUczb2g4NEdQQ3p5azBSL2JF?=
 =?utf-8?B?Y0FTRmgycldLdFkrMXFXRk1UUzNUbWJNTko3dm5xNlZDYmVydFhycEhTZzFj?=
 =?utf-8?B?NzJ3bk5id2oxaGsxbU01NitKem5lRXBZdk5DNExoRDZUSksyQkROeGNFZFFG?=
 =?utf-8?Q?h0OTjK8IgpBE90VQml9mHUPNLN45DHpP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1ZRbHRGbmR2bHFYVXdDd1VTU1FRcUp1YzU4eHV0eG1OMWNkN1ZXQUZCOHUx?=
 =?utf-8?B?bGZQQjhlUE54dmV1eUorNHltVUZXM0pRdWpqRFlUcU9UcHBRTm1qeVlWczJC?=
 =?utf-8?B?TjRZQVlzRTE5Wjc5TFJwSVE1Q2VQZGt6OWd3VTJLR1pac0cyNUcvaFJCT0po?=
 =?utf-8?B?NDNUUVZxM0V4VG1maFJtc1UrVEhxY2VLUDQzOEdsQUpUcUhvaVVEWU9nUWFx?=
 =?utf-8?B?cERwSGZ6OUtadmxBR0dEMllRNUErTVhMRFJ1MDdiWUVzWU1KTjBMTWltK0p0?=
 =?utf-8?B?VU13NzgzSFlsUU1HOG1XY2VTUjg2YjZPT3d2eDVpUkpaTnRJN2wxakQyV29N?=
 =?utf-8?B?NGhqRVdaRU5xMENJQ3hpTk1VSHZUb2FYbFcwZExuUDQ3WHY2LzNvSG43bm5u?=
 =?utf-8?B?OER3RmJtRE1EdjZaTmdRenozaFZzTGVXN245ZEVrVzBsbWY2d0F5eVVTSHVQ?=
 =?utf-8?B?QkxLd0IxWnhRRTNPSkZGWU9HQjUxTFhld3QwUWh6OFhUOHlYYThqaUVrbWJW?=
 =?utf-8?B?ajBKdWtiend0T0RMbDVnbm1LTytyajYvZzJqcEgvdG1oNjlDY3hPL1dpa0U5?=
 =?utf-8?B?ZVFiM1RIZGZMTVp6LzJncVNpSTZFUlVDZ3kxYzREVERNTHcvaElYZjluejlv?=
 =?utf-8?B?Y1NFMjR5Tkx3SmVVYm91Y0ozamJ5MTVhSVBqZ3JPeXFmUlRHK0l4cmMvQnYr?=
 =?utf-8?B?b2o4T1hnKzUxT2VwZHp5UEJUL3AzQ2FFR1c1aEp1eWZHeTAzVlJlc2VEdjNF?=
 =?utf-8?B?WnFvclQ2NzNYQlY2eUlyM1NVM1FLSzllV3BKM1FvSUNzc0ExZldScGhBZDY5?=
 =?utf-8?B?RkJWUmtxQnpKYjcxbjN6TzdZd2lXQnJxK29sUllVakE3Ykc3WUZINHhRM2Qy?=
 =?utf-8?B?UE16YlFrRjJWMTVXbWd1aEJFRXp3WmRheGtjTkFQKzBzbXhocTczTktUcGp6?=
 =?utf-8?B?QmFtcjQ0ZThVOHEzSGxkZ1JSVDM2MnNFc2hGS2szT21Cd3dyRlFLMzk0T2cv?=
 =?utf-8?B?SmpNaW5UbGlub0tBT1l4d3hlYnNpMXpiVk5qQlFsQ0VYcGJvVG5jUmIwYXZQ?=
 =?utf-8?B?bjN0cU12cUVvRlRSbG5Ob0dJd3MrRzdDdUFIempNa2E0RzFjQTNWME9JVHRV?=
 =?utf-8?B?TXI4a3o0MEpoQnNTaTl3K0FQT1ErTUtrWUdMM2c1ZkdIL1RRRi9paVJZY0s0?=
 =?utf-8?B?WnJMTzNpY1JMU2V2c0RmdytFQVpZUDZVWWZ2aVlteFNnZ3NXbGRwSytuUldk?=
 =?utf-8?B?MER2NGJJSlhBcGJRZDhYS0tVTnhLdG93UXozSWhJNHFvYU8xcVU2Slp4VGJY?=
 =?utf-8?B?WnpsNkdyZ2RUYmlseW5jUStDYTJ6ck4yZHBKd1I2WUpBU2g5YjlmcWZXU25V?=
 =?utf-8?B?QUZrR0o5Q2p6VnZLTnZUYVdpQm10SnlUWElLSkZ6Z090b3NqNE1JSllPa1FD?=
 =?utf-8?B?TkFDYVhkSFNVYUd2Q0RUdW0wbHdaM3RqSSt4Q21pcWE0THBKWnljMjdGSFNt?=
 =?utf-8?B?RzJDdWpWdzRzUjc1YVhGL1dlQTJoRGhoZHRiN29MdnN0VzVSQUF6dzIzelVz?=
 =?utf-8?B?eHFTQUhOUmpHSWxrOVBqQ3lDTnJjVDRCbW9CV0t1c29EVkhpOTAvemVVTmlU?=
 =?utf-8?B?NUF6ZjJudFYxZXFKWW9RKzBPeGhoeWNPZXNEbG94U0xoSTJkQ3laNDRMODZo?=
 =?utf-8?B?ZlZvcW5kWEl5Z3RDZ204T3dpQ3lvL1hOKzhmc21XWUduL0RsSHBMVnZKblpG?=
 =?utf-8?B?M21YRlc1ZXJMSUhDY01pQVZhQVc1cllYbDNaVXRvZVpqc2Rkb1F4ZUZiTTZi?=
 =?utf-8?B?UTNKZ2ZRMG1jMnpIR2doVlJ6R1lZL1JyTmxraE44eUZRRjNDcEN6bktQeHZZ?=
 =?utf-8?B?ZVFERkRjT0xZdFZIU01VeFZFYVpoVWEwdHlsZm11eTNxeDcydzh3U2VRYzFL?=
 =?utf-8?B?VVM2cDVVRUpsOWRiYlhVUlVIOHB5eTU5RmNCL214UUxyalZuZjNzSENIdUMv?=
 =?utf-8?B?aFRSZ3NCeTByN3hKaVBjbmIyc25BNmsvMW5BK2RrY29MR0pENk5TTHByRnV6?=
 =?utf-8?B?ZUticnBkN2VZdHRuZnJCUTF2SitWdXNpemhoY0p5cE5NRTNhNHkzeHFmNngr?=
 =?utf-8?Q?qh1nq7E/Vvxwy6wzizQEdqjyB?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6c6e7e-c94a-4e9e-d60e-08de0d561226
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 08:20:45.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8gsUb8hiGTsqFeQOnIXCZ88vfEfFBq2Jpanzo104cIrU1jHOX1WP6C6WM94cZKQswd4B3UyjFvdTHVgQ5UU4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5005

On Fri, Oct 17, 2025 at 09:15:08AM +0200, Jan Beulich wrote:
> On 16.10.2025 18:27, Roger Pau Monné wrote:
> > On Thu, Oct 16, 2025 at 09:32:04AM +0200, Jan Beulich wrote:
> >> @@ -307,15 +309,13 @@ static void cf_check hpet_msi_set_affini
> >>      struct hpet_event_channel *ch = desc->action->dev_id;
> >>      struct msi_msg msg = ch->msi.msg;
> >>  
> >> -    msg.dest32 = set_desc_affinity(desc, mask);
> >> -    if ( msg.dest32 == BAD_APICID )
> >> -        return;
> >> +    /* This really is only for dump_irqs(). */
> >> +    cpumask_copy(desc->arch.cpu_mask, mask);
> > 
> > If you no longer call set_desc_affinity(), could you adjust the second
> > parameter of hpet_msi_set_affinity() to be unsigned int cpu instead of
> > a cpumask?
> 
> Looks like I could, yes. But then we need to split the function, as it's
> also used as the .set_affinity hook.

I see, I wasn't taking that into account.

> > And here just clear desc->arch.cpu_mask and set the passed CPU.
> 
> Which would still better be a cpumask_copy(), just given cpumask_of(cpu)
> as input.

As is it, yes.

> >> -    msg.data &= ~MSI_DATA_VECTOR_MASK;
> >> -    msg.data |= MSI_DATA_VECTOR(desc->arch.vector);
> >> +    msg.dest32 = cpu_mask_to_apicid(mask);
> > 
> > And here you can just use cpu_physical_id().
> 
> Right. All of which (up to here; but see below) perhaps better a separate,
> follow-on cleanup change.

Yes, it's too much fuss, and I also have plans in that area to deal
with it myself anyway.  Just wanted to avoid changing this now to be
changed again.  But it's too unrelated to put in this change.

> >>      msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
> >>      msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> >> -    if ( msg.data != ch->msi.msg.data || msg.dest32 != ch->msi.msg.dest32 )
> >> +    if ( msg.dest32 != ch->msi.msg.dest32 )
> >>          hpet_msi_write(ch, &msg);
> > 
> > A further note here, which ties to my comment on the previous patch
> > about loosing the interrupt during the masked window.  If the vector
> > is the same across all CPUs, we no longer need to update the MSI data
> > field, just the address one, which can be done atomically.  We also
> > have signaling from the IOMMU whether the MSI fields need writing.
> 
> Hmm, yes, we can leverage that, as long as we're willing to make assumptions
> here about what exactly iommu_update_ire_from_msi() does: We'd then rely on
> not only the original (untranslated) msg->data not changing, but also the
> translated one. That looks to hold for both Intel and AMD, but it's still
> something we want to be sure we actually want to make the code dependent
> upon. (I'm intending to at least add an assertion to that effect.)

We could still mask when needed, but the masking would be
conditionally done in hpet_msi_write().

It seems however this might be better done as a followup change.

> > We can avoid the masking, and the possible drop of interrupts.
> 
> Hmm, right. There's nothing wrong with the caller relying on the write
> being atomic now. (Really, continuing to use hpet_msi_write() wouldn't
> be a problem, as re-writing the low half of HPET_Tn_ROUTE() with the
> same value is going to be benign. Unless of course that write was the
> source of the extra IRQs I'm seeing.)

Oh, yes, that's right, we don't even need to avoid the write.

> Taking together with what you said further up, having
> set_channel_irq_affinity() no longer use hpet_msi_set_affinity() as it
> is to ...
> 
> >> @@ -328,7 +328,7 @@ static hw_irq_controller hpet_msi_type =
> >>      .shutdown   = hpet_msi_shutdown,
> >>      .enable	    = hpet_msi_unmask,
> >>      .disable    = hpet_msi_mask,
> >> -    .ack        = ack_nonmaskable_msi_irq,
> >> +    .ack        = irq_actor_none,
> >>      .end        = end_nonmaskable_irq,
> >>      .set_affinity   = hpet_msi_set_affinity,
> 
> ... satisfy the use here would then probably be desirable right away.
> The little bit that's left of hpet_msi_set_affinity() would then be
> open-coded in set_channel_irq_affinity().

As you see fit, I'm not going to insist if the changes become too
unrelated to the fix itself.  Can always be done as a followup patch,
specially taking into account we are in hard code freeze.

> Getting rid of the masking would (hopefully) also get rid of the stray
> IRQs that I'm observing, assuming my guessing towards the reason there
> is correct.
> 
> >> @@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
> >>      spin_lock(&desc->lock);
> >>      hpet_msi_mask(desc);
> >>      hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> >> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> > 
> > I would set the vector table ahead of setting the affinity, in case we
> > can drop the mask calls around this block of code.
> 
> Isn't there a problematic window either way round? I can make the change,
> but I don't see that addressing anything. The new comparator value will
> be written later anyway, and interrupts up to that point aren't of any
> interest anyway. I.e. it doesn't matter which of the CPUs gets to handle
> them.

It's preferable to get a silent stray interrupt (if the per-cpu vector
table is correctly setup), rather than to get a message from Xen that
an unknown vector has been received?

If a vector is injected ahead of vector_irq being set Xen would
complain in do_IRQ() that that's no handler for such vector.

> > I also wonder, do you really need the bind_irq_vector() if you
> > manually set the affinity afterwards, and the vector table plus
> > desc->arch.cpu_mask are also set here?
> 
> At the very least I'd then also need to open-code the setting of
> desc->arch.vector and desc->arch.used. Possibly also the setting of the
> bit in desc->arch.used_vectors. And strictly speaking also the
> trace_irq_mask() invocation.

Let's keep it as-is.

> >> --- a/xen/arch/x86/include/asm/irq-vectors.h
> >> +++ b/xen/arch/x86/include/asm/irq-vectors.h
> >> @@ -18,6 +18,15 @@
> >>  /* IRQ0 (timer) is statically allocated but must be high priority. */
> >>  #define IRQ0_VECTOR             0xf0
> >>  
> >> +/*
> >> + * Low-priority (for now statically allocated) vectors, sharing entry
> >> + * points with exceptions in the 0x10 ... 0x1f range, as long as the
> >> + * respective exception has an error code.
> >> + */
> >> +#define FIRST_LOPRIORITY_VECTOR 0x10
> >> +#define HPET_BROADCAST_VECTOR   X86_EXC_AC
> >> +#define LAST_LOPRIORITY_VECTOR  0x1f
> > 
> > I wonder if it won't be clearer to simply reserve a vector if the HPET
> > is used, instead of hijacking the AC one.  It's one vector less, but
> > arguably now that we unconditionally use physical destination mode our
> > pool of vectors has expanded considerably.
> 
> Well, I'd really like to avoid consuming an otherwise usable vector, if
> at all possible (as per Andrew's FRED plans, that won't be possible
> there anymore then).

If re-using the AC vector is not possible with FRED we might want to
do this uniformly and always consume a vector then?

> >> --- a/xen/arch/x86/irq.c
> >> +++ b/xen/arch/x86/irq.c
> >> @@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
> >>          if ( !irq_desc_initialized(desc) )
> >>              continue;
> >>          vector = irq_to_vector(irq);
> >> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
> >> -             vector <= LAST_HIPRIORITY_VECTOR )
> >> +        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
> >> +                        ? LAST_HIPRIORITY_VECTOR
> >> +                        : LAST_LOPRIORITY_VECTOR) )
> >>              cpumask_set_cpu(cpu, desc->arch.cpu_mask);
> > 
> > I think this is wrong.  The low priority vector used by the HPET will
> > only target a single CPU at a time, and hence adding extra CPUs to
> > that mask as part of AP bringup is not correct.
> 
> I'm not sure about "wrong". It's not strictly necessary for the HPET one,
> I expect, but it's generally what would be necessary. For the HPET one,
> hpet_msi_set_affinity() replaces the value anyway. (I can add a sentence
> to this effect to the description, if that helps.)

I do think it's wrong, it's just not harmful per-se apart from showing
up in the output of dump_irqs().  The value in desc->arch.cpu_mask
should be the CPU that's the destination of the interrupt.  In this
case, the HPET interrupt does have a single destination at a give
time, and adding another one will make the output of dump_irqs() show
two destinations, when the interrupt will target a single interrupt.

If anything you should add the CPU to the affinity set
(desc->affinity), but that's not needed since you already init the
affinity mask with cpumask_setall().

FWIW, I'm working on tentatively getting rid of the
desc->arch.{cpu,old_cpu,pending}_mask fields and converting them to
plain unsigned ints after we have dropped logical interrupt delivery
for external interrupts.

Thanks, Roger.

