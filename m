Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPbBHsbPeGmNtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:46:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9095F53
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214883.1525134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkKW-0005bP-5S; Tue, 27 Jan 2026 14:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214883.1525134; Tue, 27 Jan 2026 14:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkKW-0005Z6-26; Tue, 27 Jan 2026 14:46:08 +0000
Received: by outflank-mailman (input) for mailman id 1214883;
 Tue, 27 Jan 2026 14:46:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkkKU-0005Z0-Lf
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:46:06 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8317336-fb8e-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:46:05 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5545.namprd03.prod.outlook.com (2603:10b6:806:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:46:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 14:46:03 +0000
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
X-Inumbo-ID: e8317336-fb8e-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nat0+8dlE8BEic7qToUg9+wYCPSPtwq26tZ/iJsx7kaGUBpaGcWyH8XQywazrH05UbiEJVWCw6Icyqnk5GKDImTE6t4JA8n3QQ6U5KTPioUXv0ame2xSWEBTNuEUyg86oIjETj4Gp/NBfnvG206heu/ikxZS6B9sruFUHIOGnlAASGkowIm9Gt0kLErEkEDD+S5s3uj7xaIJnjgOdSK8NFOsiIUBEIb4sbKzZOfQBZLXtqed7yEiHTUmDcJdGAMWgMP3RleQAGxK1kmpULw17joBEkPrJLs59hUJubr18xtRTMqFK92jYfyfuDIJ8sVDmqdxkt2Z+TesNFfcGb3a1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu8zaKn5GuS/3bthpExxlER8nFf8r8KahI6boM1p2CM=;
 b=w527hRSZZffJ3gsD5iWKizH6U/e1t84VcirTZ0sefTRCEso+DtiKhok5Sb/MfwhND2u5cOe2mhd4hGoJnq9GCKAqzMT4Z+eKU/0IoWOtlJp26gwSEAegbxvri1l+G1NmTrdj9+V4pZnv+Vu1djOTJ/D9KBOaQbJljhdCUDqh/QJBm5tj5NZwntauxVC7cOxc15ggSlqX01ZRfQ99WmY2tBxoIxvrAFVko3IcehEcWIXgp4B0qKM0bLFG7AOLgW2WQeDbQrsdzo4TzuOTBzI1dNcDDLO6qBmZQ8E44iSUIluafEuWmkFhL0q2BMtiNpJp87HENTNyvszFZKlWOCZ6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu8zaKn5GuS/3bthpExxlER8nFf8r8KahI6boM1p2CM=;
 b=ULH1LvDzZWzkotes2vYObaY0SOspcv3cMPWfBZ7JwCc3Ql4YlKvBPWzwSvaZMsUonbskhi9aapSqpaQlEctpgM5NlfGxMZTYqwX2YEsCsdURcnbS58HatGCd2M9wXSzKBpJHbcjTzR4tB2w/sxKwiVOhRWh7M8A6gvCs4i0z+5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a34b1424-f274-4c65-b94f-009d5f3fd3b3@citrix.com>
Date: Tue, 27 Jan 2026 14:45:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 09/16] x86/intel: Always check MSR_MISC_ENABLE on all CPUs
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-10-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260126175345.2078371-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5545:EE_
X-MS-Office365-Filtering-Correlation-Id: 304ab24f-35bf-4a3b-51d3-08de5db2cb41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUpGcjdJZEVTRXgzcXAyNGtHWDB6UkF0a3A5TGw4UnlIaklwL04yQ3p6ZEFO?=
 =?utf-8?B?WGZYQmNLQncvbkhwZHVhR3JXV0NDWmVaRmdMSCtCM1lHWkxQbGlPbnlyUmF2?=
 =?utf-8?B?c2RnZ0lvcWt3NlBPQ1dhSVd6WnJpNkloYi9TRXBLSkgzMjRjaWdWbUIyOVZa?=
 =?utf-8?B?eXJjNXJTS3NhVmhoTGdsdm81MWEvcnJoL2dRbHZBd1BZQU80L1JsVHd5TVRB?=
 =?utf-8?B?TFp4S2t0THpXbDArb2lWVjJDTFNTQ05kVUJrRVNhRFVXcGQ0aXdaUjhpY3c1?=
 =?utf-8?B?NktBRm1GUGlSRHdZa1YweHo4bmkrYXlER1dWVkkzTVZqM2JXbGlvYzBCR2R1?=
 =?utf-8?B?MjN2MFpxbUNRL2NWQlgwS20wNFljRnBGM0tXVjFNQTc3bnVlVTAwaXA2a083?=
 =?utf-8?B?QWJEZzAvUVhzRVlmTEd6Q2l3a3EzTEdoKzRFNEMvTTcrSkMrRTlMbFZHVncx?=
 =?utf-8?B?Zm4yUWFhTG1ER1I3OXFNcXB1MCtBOXpKV1NjazJibEZ4UkxYUW5sSExmcGR2?=
 =?utf-8?B?UEpXRTNqU0c1d3hqbG5wSHMvUXhvblNBZG1yMmZuZFVzaUJmaHQ2ZkVDcTQ3?=
 =?utf-8?B?dDlibUR3UnJ0TlAvK2RHT1FQcGZyTzdzdVNCM2xndkdrc0dhT3dRQ1RqWlZM?=
 =?utf-8?B?cjZjK3E1NTA1L2poSnFSL0dTejZ6dUgxeThzTEpvbGRLMGxBazhxYlRraXBO?=
 =?utf-8?B?ZEdqQXFabitIN3JtOG10V2JSYUdZbmE0b2I5OWNLY2VENDMzamtmTTJ5aENj?=
 =?utf-8?B?Z2dHdUd6OXdTcVREUng1OXAvUWZaZ2wzT1BKZTZpMWZ3cjBEeW53ZFlSVUE0?=
 =?utf-8?B?Zm5NTGRkR29ZWUkrb01rS0REdzl2c0dQUlFoeXlOcU1lellGRGNCS3U2c2tq?=
 =?utf-8?B?MlhuampqTGVIZ3FmbTI1SUhPbnBGUUNxMzliTUEwWUN0R0V5emNyYUs5UlJi?=
 =?utf-8?B?UmNxYnMzcG1ldk5PTjJQZGY3OTM5bE9mMmFJNkt0bEJKZEMweHF1d2dCaWFi?=
 =?utf-8?B?eEMzaGxuanJoZkhFb2NBcTZkaVMzRmxWSzd5SWpsQnhXSk42VlhOeXl6NHlp?=
 =?utf-8?B?VSt5clNOSVYwNCtEa0p0OCtIUEpsQ3dvVUdhaTYwS2ZWUUhYbUlhNW1tdzJC?=
 =?utf-8?B?d2pWNWdaWWdGMXBjZEM2SDN5YVdZS3liek9WN2hzTXNKQUZvQytOQUdla2pF?=
 =?utf-8?B?Vy9qbmVNc0o3WU1kV1pCSFhZRGpuVEFQRzFQSUJmdXBUYzhadWtWRWozc3RW?=
 =?utf-8?B?ZG9YL3JBWkdpcy9qYnFVbmJBa2JjbWIxdWtPSVlteWI1emMycEp4dC9GRzM4?=
 =?utf-8?B?bEpFazdQN3Z1VU9kN0RDek1ocFBmZlY0MWl6YjdhUS91ekpnZTNNRzJ2MGw2?=
 =?utf-8?B?Q3RBNSs3eXpITzh4V1hDWkhFZngxUmxhOTVYRVR5dGpwbWdZQkcwYVQrMUxi?=
 =?utf-8?B?UFBIbFJRTTBqRGp6bnJINDVuK1BvVVN3alNjbTlmZmk5TVQrK2tSQkFOM3FT?=
 =?utf-8?B?NG1RV1luTGU1Ynl1cGdPOWxKckZoeklkdSt1MXl3OUZXWlVBWU5oeG9mT2Mw?=
 =?utf-8?B?VzBtc0VMMEJIMjhnd3BRVkQxcmNhRnFPcXh0Q1ZzbVBQcTlmKzgrV254R2R1?=
 =?utf-8?B?OVduYVR4VE5CbXhERk54MFYwSHYzQkJ1eWZTdy9HdzNMZVdlSCtaSGZ2RGJM?=
 =?utf-8?B?TzdoL2xwLzRvKy9GSWozV3Ywd25JY2lzZ05TTVAzbXJ4VUlyRDhEb1NKSGJh?=
 =?utf-8?B?WU5jNHI2Lzc1YWY2OUpLUHJJSTQ5eFgxZUZnZzdSZHpvTmlyaTNUNXJTdHo4?=
 =?utf-8?B?Nk5MUjhiTTZIN3ZRRlZGdElJS1JMLzFZamhpQk9pQ0MxN05nU1JtcmJaOWM4?=
 =?utf-8?B?cHpFZHhrR0xIUi9qcmtVbTBheVJCNzQ0YmxLbFUrNzFLMDExT3lwV1NNRE9X?=
 =?utf-8?B?WmgxTGdXWWVuZVFrZWoxNFQzVzRxd3lQL3g5cVlEYTZDWGxqUXJ5Vi9YWEhW?=
 =?utf-8?B?WndjQS94RFFsdTh0TTVCTndYQmV0VDl5U0VzbHd4V0x4Q01ZK3FldUdJSUVX?=
 =?utf-8?B?d2VVMWxZdFRDTUIyTDF5VTdVSWpHUE1XQ2hRblk4R2ExeGtCZDRYbVplMkhP?=
 =?utf-8?Q?nQik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1FtYS92NENmaFdhdlIrYy9UQWhmR0dwOW96cGtvbEJ2dUJZU2pZYUIzTjRm?=
 =?utf-8?B?UlhWQW5veis0RHFWZDRGWmNWdXA4TmJWa2JOOWJSUFpFOG9sWVFQWHdkazY5?=
 =?utf-8?B?WEpkQjV5MVRsRUQwU2NSeUFORjFRSDhGdVRuOXVlait0cWFveXZlVnU4SXUz?=
 =?utf-8?B?SFJ4N2RPSlkwZUZRMldrVHA2RDBGZWl1dFB4R0w3YldYOG84T05SaTNnQ2FW?=
 =?utf-8?B?YndibFBpWDJ2NDlPUXQ5YVZMbHgxNHIxcGJFUzhTQVdUVm0rOFVqaC9wS0hk?=
 =?utf-8?B?eEhOc2ZGeTA3QjdGZ0NFeDBHZmtEV1E2cTErR2ZlMTVTenhTb05iRkVmdnZI?=
 =?utf-8?B?bzc3ZVAvVkxWYjZRNU5Ld3NzZGJGeTYveUUrZFFCNlZsdTlSeUl3ZGRQRWFW?=
 =?utf-8?B?S1d6T3pjaWtXcUc5RnE1cEF5MG1FeHJScDNnNGp2WFRQM0xidlpucW5oRDAx?=
 =?utf-8?B?Y29HOWtjOGNYcm5yT1ptSDI1UlQ4QUQwMTRTOG5wWWd5a3RUUUdhMkhVazJx?=
 =?utf-8?B?cUtKK3FlZEdYS1JBQUdYQStnbEJoWWdqV2ZtYkZOd2RtOUg2UHZNOVp1clpx?=
 =?utf-8?B?TEk1eG45aEZUZjhoK1NhQ3VGM214NkFZNnNUeXp0VW42M3RiS0hUZG5XTTVJ?=
 =?utf-8?B?aDhjVnNqYkdGQ3JQczgwUWoyeWpJQ2N5RlV1ZDk1c01VaEc3OUh4SXpjMVli?=
 =?utf-8?B?U2ZUTHpOd1JKSXVsdUQwbXNnNDM5b2dPZGI0UmJCeUJZUmFjMC9oTDB5ZS9O?=
 =?utf-8?B?KzRhK3hOdU9RQlpMbEdncnR4UUlTY2gyVXoramVTeXU0ZWZrelJHT21vakh5?=
 =?utf-8?B?K09RS2pqSEZPWDJJMEtrL3BhTG0vbG1JMFhEbHJrd2hBMFRVUUo1VldRN1VP?=
 =?utf-8?B?UE9Xa2xRMzlESTg5cEZEb3ExSTJ1NmQ5UWRLbk8rRE4xK1hUZHNSektpK3RY?=
 =?utf-8?B?MG1CMkQ0QVdYMEp5S0VVMFVjcVVZeEF5Q0hKZTVvSHNta2ZVWWl4ay9TdDR4?=
 =?utf-8?B?NW93ZWFlMEZqTmRWMllLS0RGZWlUS1dvdFgwN1k3U3hNazBYaWxrdWpGeFln?=
 =?utf-8?B?ZnNWdnM1R3M0QTIzdXRzclJvQ2o3Ni9WNktDVGJQekp4OTcwN1lWK3htTzZV?=
 =?utf-8?B?UXJqRGFLZHpXdEtiS3JRbHBlMmQ1ODRiN2FhTlNLVy9OUUJ2U09URjVNdXc2?=
 =?utf-8?B?d3YrM3ZEZkJiYW9wbFRET1B0Z2tSdW43WEZNSi9Gb1JkN3ZwOGtVMXcyQVpy?=
 =?utf-8?B?alBacEZhZkdjODcvSmlQWjIrdzFRdE11a0tKeUZxT0dLUGEvcm5UV1ozeDJn?=
 =?utf-8?B?dUNHSHpjTVpCL2s2YkxsUzlTUjNsb0Y4VzVpeWdaczhWV1l4WGpVM2loQVUw?=
 =?utf-8?B?MWJJUVJldWw5VStnTGJ1cStGSGVDa0R6enMyS3dYMVBEa3V4REwzSThQRm5a?=
 =?utf-8?B?d0RCbldnMUxjMHNQWGI5QmUyenNtVkFLK2tvWXJ0SWQrU3ZMZ1Z4dzhrNXIz?=
 =?utf-8?B?eFNpa2RmOHBSbjdxbkZSNk1QbTJRME1ZeEMzcS9iSVdJMFFseVF6SGg1NllT?=
 =?utf-8?B?WFZDSDN6NGdzeU9SNVVYMGVEandJYUZYdWlyZ0V1bHlWSFZiOWxQNEdEclJE?=
 =?utf-8?B?N0pYTzduclpnVy9FU0l3ZXdHckUvUHlzMkhNSDFOOVpWVk5IazhnaXhsZmJp?=
 =?utf-8?B?VUpEa1BmVy83QmVvRWdaSmEvVE1kR3lXUy9mNHlheU1POE9icGpXcmFIb2NB?=
 =?utf-8?B?THVyaFlaR1RXV2l0NWZ3ZHZpYUxOWjN4UGkxVzFIdWxJS2RYTklMUUpQZ2Uy?=
 =?utf-8?B?M3BtQ3NzbHJxL3h0eVNKdGVwN0Vuc1MydFR3MGRYaVNVZC8rTElzejJ3Rzhr?=
 =?utf-8?B?NGVyVlFtYlNEd3hyaGhaZ2QxdFNFRlZKTytCYUlpR1lNZTA3ZmFSSDl2elIv?=
 =?utf-8?B?TEF4Wml0clFTYXF3MW92MWZCdVBPNGZHOE9jd0RYSDdtZEpEVWw1dkMxbFJq?=
 =?utf-8?B?NW5wWi9FVDBSMkNWcEQ2MDdiL1BHeS9KQ1ZXczRTc000dmxBbCtoU1hxY1do?=
 =?utf-8?B?RjFhZXpGTjQ1b2RnSDhPZmsxbkZMMHlpUGRmTHZUQ2V2VENydUxEY3V4dVJT?=
 =?utf-8?B?RWhsaHl2RldqQmx4TzFiaHllYXlGeWg0d1JmSGdpajhhWG5QNEtnd01BU2hL?=
 =?utf-8?B?Y0k1dTNyNlZGMVAxc0xNTmdzTk5XcStOUFE0b1RReDZ3dHdRSWc5RkxJbmVE?=
 =?utf-8?B?OEwwdzM0MHRhZzE4NXkzSXJtOGp6QVZ0TkNmT0w5blJFQmRhNnA3eXYxK2JY?=
 =?utf-8?B?YnVhRml2bGZqZ1A4QkVydldTVy92UHNNMXBta1o5YVlWMWpIS3NYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304ab24f-35bf-4a3b-51d3-08de5db2cb41
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:46:03.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gFooS/nU5xeCm4cKNL4RUyTlYHcvfdHW5uMRs96KzSr7SgSp9OU8/XXojWHlG1sYQktkPpsaiXdmvcsWknD4Nv2TBPpt2LXT1N5hqVA6bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5545
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BBF9095F53
X-Rspamd-Action: no action

On 26/01/2026 5:53 pm, Andrew Cooper wrote:
> Currently, the BSP only leaves instructions for the APs to adjust
> MSR_MISC_ENABLE if the BSP is found to need adjustments.  Particularly if
> XD_DISABLE is needed on an AP but not the BSP, the system will triple fault
> with no information provided to the user.
>
> Rework the BSP and trampoline logic to always read MISC_ENABLE, and clear
> CPUID_LIMIT and XD_DISABLE if either are set.
>
> Repurpose intel_unlock_cpuid_leaves() to be intel_check_misc_enable() and make
> it static in common.c.  Replace trampoline_misc_enable_off with the smaller
> trampoline_check_misc_enable.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Julian Vetter <julian.vetter@vates.tech>
> CC: Teddy Astie <teddy.astie@vates.tech>
>
> This temporarily removes the printk() noting the reactivation of XD because
> the earlier BSP code has already done it, but that logic is about to be
> removed.

Actually, I'd forgotten that this is still reachable, via xen.efi, and
is the bug that kicked off all this work originally.

Julien has requested that I try to integrate the two series together,
which I'll do for v2.

~Andrew

