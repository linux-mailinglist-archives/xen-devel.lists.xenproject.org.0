Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPniCaSKxWlc+wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:36:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F733AFD1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264779.1556139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5qUD-000133-9w; Thu, 26 Mar 2026 19:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264779.1556139; Thu, 26 Mar 2026 19:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5qUD-00010q-77; Thu, 26 Mar 2026 19:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1264779;
 Thu, 26 Mar 2026 19:35:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w5qUB-00010k-F6
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:35:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5qUA-0048It-By
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 20:35:18 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c58a4f-5cb7-0a2a0a5109dd-0a2a450cec88-20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:35:18 +0100
Received: from [52.101.65.134]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c58a75-f93d-0a2a450c0019-34654186f59c-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:35:18 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB10552.eurprd03.prod.outlook.com (2603:10a6:150:153::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 19:35:13 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Thu, 26 Mar 2026
 19:35:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSRBJhs71sMJ6V5JvIJCqtyqpAAhcK/tP5wfgEDExJlSoTWMatpm/mcufYHcFe3+Vy21kjAGWbhM5JW8dG3L8pD8eBwOU81p0TnmF+Gl7aSL2NOgRXPZPtW2JNN/XtCwSJzeZ6S9bKR73Gco2aN1s4lC8+bBYnlDhN9taABFB0C4F8YfMjJ4WbO8xXZ2/TlqOOVfiir10C931f6dA056uVo9IxoV59rB2wzYvcKB/bbv1uY1kQibyVMhVjD5jgTqTpkrTrHxmsZ2QCPdgskSSRGzG5leb70FkYr1fjhRQvW9NV/qt4h9lhy1/PeFWw3VCfqD/jdE9InC1a6ebTujIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQDYybMQvCacvL5rb1fB8/Klqvp0bufgXnXFP6iNGlM=;
 b=nPa3tAKrgo34qSKAv9v/q3Fl9onDs0oEbt/mSzzbMlnNuLWrHTQuAhVGb5CNiocC58taZPoWqb6AATu7ZWYtXY7Mx8cAqP/Y6itrM1nBKlHFKh5mRnCB31dJY0MuQAAlt3ZRmXAAfif6SIMl1epZXYkKHwiDVa+qecAS0cOHpMj2svnZlp59j2QKdbc2FW7UF5di/TRH7vSTlUeG3bp4nYixyeGJnDtOdbZFbdCcIDPUA++MleIKuwa+rS4o+xIHITXyx90Horh5nKN7TnazkhRdxySMU4Gk1bGdrqr9YPpTLBZAPToMI+w9gjvxWOTfTMVr5L3CMKnT8Zed0D2yOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQDYybMQvCacvL5rb1fB8/Klqvp0bufgXnXFP6iNGlM=;
 b=V1pDk4kjClFSNgmhOfpE/8lcmuHlgwFW9B+47qULg/zJHtlQKUGS947yQmrrz/u9b9XNr6zNjPUQ9mCEHjqNw8BtqTbD7VJzy5kpqfnmUv377N6WhJIF11U62i1+AFlNNPyZ94+KRa9gqVIu+saq7euJ8ShyUSa4sIakBkb8VT6JokJoxhOHJlqnaS9Jm1C+QeP+0WQk+c6oLhlmj5pIZUky8X5SIIqI90eOf5/kS3nFrkswMWyZDQibYTPDVwEu3ITRjBr56gfzhVc6g2ZMZTPwRtceBGj7J91LvDVqzcB03NzIe7vzreoIk2F7hT2BHqbntGrohVeWwY7OYopMxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <71b248ac-dad5-4a0b-aa09-20c970aa6c85@epam.com>
Date: Thu, 26 Mar 2026 20:35:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
To: Nick Rosbrook <enr0n@ubuntu.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
 <anthony.perard@vates.tech>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <f04d9186eb3b83a4f5fb27db412bf10fb6fb092c.1774305918.git.milan_djokic@epam.com>
 <CAEN5XSFA4AdFKXGiyYW58=Ltm+uVRrsSxGrNCC3T8UdHtivcnA@mail.gmail.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <CAEN5XSFA4AdFKXGiyYW58=Ltm+uVRrsSxGrNCC3T8UdHtivcnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To VI1PR03MB5088.eurprd03.prod.outlook.com
 (2603:10a6:803:c2::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB5088:EE_|GVXPR03MB10552:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd8daf4-366f-4bbe-c4dd-08de8b6ecc68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LnDgs60ZTQHkHss48kL211teHVd38OlK1kwcsg5qFCp6cMl2if0QS8tUJMs7+1RBixFzJruZnmgxuASKYTuSmpn+bth6g63bBYDgYCD5+gUpGR0g0gJT6/02WEqDW2CfIogRfKpfW3d2cnh2R6g/ukYmNumHSqM4uF1y73IvHvu1BvgZAo60bXvdmJDjot2IAc8A7/FyyC45yoExAo8AvAdGTcBEvqmSLLey/OFOeInrRvP8CioT/HmwDh2Dc54JmP3lc/Di6wHcylWbs815p8lFaSbROvI50zBszX5D99v47NWJT5OghyCef/Ks36V3vEuDUSMcoGcLY+bEucDmYul30kS3GicvZsEInyeUeS3LcBAR1mvyApWE4mQCRZfyuSletYFRlH+cWEVK62l333/UyPrlVhYrBJkIEMegGCSwr70iu2OJCmbw+csCvBoxRMV2vFLdXgE/TCbplMmWOBV8YI/LQbK9gprC3UtfYgpFcxi1/D9040/PVGv7IR6ilJrPApqG30yuQc0jSDG0i7YhsFgzpECbeob6QsfMKme9XU9HANoZQxQCbQyxTErygjL6E2m0kGBwoLX0bls+nb1/ubnZ6xjrF5t10hxZaX+hnb8ESyWjoZLKrnyz/z/xy5zkqia0YxZL/KmMKbZ+AKVOx/4LMA0+RWz3cIHSu9hx6Et8U/BU1zB3sKisG0UpdU3GcEt66ZkAGYEQcsuOGkV0R64jpHlDOzqLDNQ3uF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnlXUkUyYUJuSEkwNy9HZzYycHJvRWh1OXZlVmJCSFFQMGIxSVRvL1F0YUxu?=
 =?utf-8?B?NFNsT2hYRmlEcjZmcVJOaHZuMVBiRitvdFptNG0vVGZna0pHdjRUUnpMVEVr?=
 =?utf-8?B?WlpRVmY4TVlKemk1azNlaC9BNXJCa2t6clM1aWFyTnFrdzV2aEx0NFFQN1Jy?=
 =?utf-8?B?bkFvVHVvRXdDdjZyTFZMNzRIejJ1NVhTM1lYS0RHU09Fb043T3JwR29jeTlW?=
 =?utf-8?B?OStFbHQ1b2xoaStmcXpsVXNuYUFnVzU3ZjZOWVg4SWd3ZFJmQ0xtTkt2bEJ4?=
 =?utf-8?B?c0FJK0gzV2I4YUNMQkpTU0ZxazhJMEN5KzhMOG1FR1ltUys1SFA3aWdOalZ6?=
 =?utf-8?B?Q0RMVzV3djFOR1U2TUhVMUhVSG9tbVJ1ZGViZW1md2twRXpuelpvenlwOGs3?=
 =?utf-8?B?eHlrcjB6VFI3eS9EMGlEWTgyZ0g0S1dway9VWEY1aXZTT1BERHBjUStuUVQx?=
 =?utf-8?B?UTlLZ0JZWkh1VDhVTzlRRno0NUJrOUR0L2I3eEhYSXRNVXFVMHVpNUJaU1N0?=
 =?utf-8?B?SmI3dkNwcEF4dk56TUN6bnZTRmdYdi9vR1RXdDh6MzRicTl1enZidlAxV3Zk?=
 =?utf-8?B?UHhKUWkxYjFXd0huMkxEN2dxOVRaRkNtU2Jsd21BN1paS00rbWRFckR1TXRa?=
 =?utf-8?B?elN5NGhadGNxQk5jQ2p2OGVpaWo4bjUrNmo2YVpuQUlsRXgyTWxKejlDTDRX?=
 =?utf-8?B?UGpNMHlodlJoaHhUNm5HY1NjOXpDd2UxU05RYzZWOHVicDF2YSswaDVkbVFk?=
 =?utf-8?B?ZnFBWTRvajZzbGNYR3U5d1BPNWo2aGFFNnBUV1V3Y2M4YmJUZFVnSjVyV1lO?=
 =?utf-8?B?dUVrdlJXYjYyT1VHdXhURWdHM0VON2ZBYXVYVnpsWVYwenFiY3VFY1E2NXZW?=
 =?utf-8?B?TW41R0FsTlRPdkhsV01FNkdWOFRQZzR2WHpKVklIK0hHOG1WMU1FMVNpSFZh?=
 =?utf-8?B?Z3BYa2lFaWkrRHdEb2dSY2lFN0xBM2tsZmluZ0N4Qjh5M2dQemMySVU4ZVRx?=
 =?utf-8?B?dXlpeEhJTlJXZ0t4bWZrbEQ5QTI3Nlp4UkpXVnpnOGhJb0Q2clIvSWtjQ3Qx?=
 =?utf-8?B?RGhUM3JoaEd4V2hIOFYyYytzc1haYU9wSVNJQ2dnNElYZ1dnRGh4NFdYZHlj?=
 =?utf-8?B?Z2ZWYncycTVuNk9WdVBkeEU5aWxYRm1mdHVPdG5ESytjMVFXb0dCMlloYloz?=
 =?utf-8?B?NWRZdU8wM251TUs4dDIzd0NJOFdoTkxSK1BKUEJzK01yTXhKSXZXMnRpVGpO?=
 =?utf-8?B?RzRZRFljY1haQkhibEppdk94Rkk1emMyTWdMbTJpZDUyWTVndkp6cmpES20y?=
 =?utf-8?B?L2ZFbkJsWG55ZWdCRlVNRXdYdnNEaktCeUQzQTN1cE1jdzdBOWlFMm14RDBa?=
 =?utf-8?B?d25vcHpqdElzNmNQRHZmMFJBMXdPeDVrVlcxNXdNWHQ4RFMrMXYvUndWMFp3?=
 =?utf-8?B?NUd2VlRGd0hmWmtnbTNLUjFlUG9XaVVqLzJadjFKK0lqdHYvbzVsNnQ1Q2Jl?=
 =?utf-8?B?ZnZpbVYrclozUzBWME1ZanJEZ25OZUNtSUNGWHBsUVpOdFFlNUtrbXJidkcr?=
 =?utf-8?B?VDh3WE5vbGFKdDV0Uzg4K1lqUWVVZDV1S3RKT2hLaEtNak5kWGZSUG0yeUhi?=
 =?utf-8?B?U08xTVRJZzV3S1RkVm4zTzMxSkYwRElJUEpjU3NSU2hodjdMMkZrV09KaUR0?=
 =?utf-8?B?RW02bUZvQVliM3pnREViREczNnk0VDlsMm5LMld1NlVDOGN6VFZkVitwVDR3?=
 =?utf-8?B?djVLUmRFNnlXMUxpMzFsQlc5d2JOZVFHMzVPNnFqK28zbTd5S01uOERrOWdF?=
 =?utf-8?B?VFpkdDMyeWk3WmZTVm14cm1pTUdOMmtLK1Z3eFM4bWNvWm9ady9WY3A1ZVoy?=
 =?utf-8?B?YTZETWZuNHpSSnZxaEtiV2IrQk1FUm1iczRxTWRlemZhZS9OTHNydHI3K1c3?=
 =?utf-8?B?TUpwMWNGQ1pJUng3M2dscVVNRTNVSlg4L244SHlReUVpY21XTDZMVjdnc1VE?=
 =?utf-8?B?bm9Cc1I2R1NtYjVxbUdTNERmRG9yOWRGWWNZVGc1ekhiZmJxcE95SkMvdzRy?=
 =?utf-8?B?eEpoMHlwVjhhTW1tcDdBaGxiM1AvSkJaTGR3V0dIV0kzR0ZqLzc3OXdsbUp1?=
 =?utf-8?B?NEdyZlQ5NXlYTERjdjZscnovMmhrRWowMFNTaWVmejQwWU8vTTBlVFpRWGRV?=
 =?utf-8?B?VVNEY0d0TUl3YWhRWUtxT0tMdFlxeHlvVjF2NE5tSWJzdFlLQW4xK0I1c0x6?=
 =?utf-8?B?L2xmODF2KzJEamNpZlFBUWR1MndFNHBmUGprZTI5WnNWZWwwQi9nL0pWV1RC?=
 =?utf-8?B?V2tWR0VXQnovTUdHMElCckdGNzVyWktLVko4aXRZdmFYZDNVRGptdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd8daf4-366f-4bbe-c4dd-08de8b6ecc68
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 19:35:12.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghOiFnHiZyg4xPWefTClvqfZaG8AuhDMj9WJGPZKDsPzClsuvSCOwR1yRSxlsXQtM+UYNsoQLomezjKeKg4roA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10552
X-purgate-ID: tlsNG-d25034/1774553718-F62B1734-F51B042A/0/0
X-purgate-type: clean
X-purgate-size: 6764
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:enr0n@ubuntu.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:gwd@xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6B1F733AFD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 19:52, Nick Rosbrook wrote:
> On Mon, Mar 23, 2026 at 6:51 PM Milan Djokic <milan_djokic@epam.com> wrote:
>>
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
>> XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
>> enable/disable vIOMMU support for domains.
>>
>> Also add viommu="N" parameter to xl domain configuration to enable the
>> vIOMMU for the domains. Currently, only the "smmuv3" type is supported
>> for ARM.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>   docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
>>   tools/golang/xenlight/helpers.gen.go |  2 ++
>>   tools/golang/xenlight/types.gen.go   |  1 +
>>   tools/include/libxl.h                |  5 +++++
>>   tools/libs/light/libxl_arm.c         | 13 +++++++++++++
>>   tools/libs/light/libxl_types.idl     |  6 ++++++
>>   tools/xl/xl_parse.c                  |  9 +++++++++
>>   7 files changed, 49 insertions(+)
>>
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index 27c455210b..f69cdee55c 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -3162,6 +3162,19 @@ option.
>>
>>   =back
>>
>> +=over 4
>> +
>> +=item B<viommu="N">
>> +
>> +To enable viommu, user must specify the following option in the VM
>> +config file:
>> +
>> +viommu = "smmuv3"
>> +
>> +Currently, only the "smmuv3" type is supported for ARM.
>> +
>> +=back
>> +
>>   =head3 x86
>>
>>   =over 4
>> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
>> index 8909fe8a1b..4f0997f02f 100644
>> --- a/tools/golang/xenlight/helpers.gen.go
>> +++ b/tools/golang/xenlight/helpers.gen.go
>> @@ -1195,6 +1195,7 @@ x.ArchArm.NrSpis = uint32(xc.arch_arm.nr_spis)
>>   if err := x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err != nil {
>>   return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
>>   }
>> +x.ArchArm.Viommu = ViommuType(xc.arch_arm.viommu)
>>   if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
>>   return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>>   }
>> @@ -1734,6 +1735,7 @@ xc.arch_arm.nr_spis = C.uint32_t(x.ArchArm.NrSpis)
>>   if err := x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err != nil {
>>   return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
>>   }
>> +xc.arch_arm.viommu = C.libxl_viommu_type(x.ArchArm.Viommu)
>>   if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
>>   return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>>   }
>> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
>> index ab9d4ca7b4..8a37b52a82 100644
>> --- a/tools/golang/xenlight/types.gen.go
>> +++ b/tools/golang/xenlight/types.gen.go
>> @@ -610,6 +610,7 @@ Vuart VuartType
>>   SveVl SveType
>>   NrSpis uint32
>>   ArmSci ArmSci
>> +Viommu ViommuType
>>   }
>>   ArchX86 struct {
>>   MsrRelaxed Defbool
> 
> The generated go code doesn't look right - it appears to be missing a
> definition for `ViommuType` and the associated constants for the
> "viommu_type" Enumeration added to libxl_types.idl. Does the code need
> re-generating?
> 

Yes, I will re-generate the code in the updated version. Thanks for 
noticing.

>> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
>> index bc35e412da..f7d5c77e23 100644
>> --- a/tools/include/libxl.h
>> +++ b/tools/include/libxl.h
>> @@ -318,6 +318,11 @@
>>    */
>>   #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
>>
>> +/*
>> + * libxl_domain_build_info has the arch_arm.viommu_type field.
>> + */
>> +#define LIBXL_HAVE_BUILDINFO_ARM_VIOMMU 1
>> +
>>   /*
>>    * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
>>    * 'soft reset' for domains and there is 'soft_reset' shutdown reason
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 7e9f8a1bc3..a248793588 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -247,6 +247,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>       }
>>       LOG(DEBUG, " - SCI type=%u", config->arch.arm_sci_type);
>>
>> +    switch (d_config->b_info.arch_arm.viommu_type) {
>> +    case LIBXL_VIOMMU_TYPE_NONE:
>> +        config->arch.viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>> +        break;
>> +    case LIBXL_VIOMMU_TYPE_SMMUV3:
>> +        config->arch.viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3;
>> +        break;
>> +    default:
>> +        LOG(ERROR, "Unknown vIOMMU type %d",
>> +            d_config->b_info.arch_arm.viommu_type);
>> +        return ERROR_FAIL;
>> +    }
>> +
>>       return 0;
>>   }
>>
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index d64a573ff3..c7ad0e77b2 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -561,6 +561,11 @@ libxl_arm_sci = Struct("arm_sci", [
>>       ("type", libxl_arm_sci_type),
>>       ])
>>
>> +libxl_viommu_type = Enumeration("viommu_type", [
>> +    (0, "none"),
>> +    (1, "smmuv3")
>> +    ], init_val = "LIBXL_VIOMMU_TYPE_NONE")
>> +
>>   libxl_rdm_reserve = Struct("rdm_reserve", [
>>       ("strategy",    libxl_rdm_reserve_strategy),
>>       ("policy",      libxl_rdm_reserve_policy),
>> @@ -736,6 +741,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>                                  ("sve_vl", libxl_sve_type),
>>                                  ("nr_spis", uint32, {'init_val': 'LIBXL_NR_SPIS_DEFAULT'}),
>>                                  ("arm_sci", libxl_arm_sci),
>> +                               ("viommu_type", libxl_viommu_type),
>>                                 ])),
>>       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>                                 ])),
>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>> index 1a2ea8b5d5..dcae8314fe 100644
>> --- a/tools/xl/xl_parse.c
>> +++ b/tools/xl/xl_parse.c
>> @@ -3033,6 +3033,15 @@ skip_usbdev:
>>           }
>>       }
>>
>> +    if (!xlu_cfg_get_string (config, "viommu", &buf, 1)) {
>> +        e = libxl_viommu_type_from_string(buf, &b_info->arch_arm.viommu_type);
>> +        if (e) {
>> +            fprintf(stderr,
>> +                    "Unknown vIOMMU type \"%s\" specified\n", buf);
>> +            exit(-ERROR_FAIL);
>> +        }
>> +    }
>> +
>>       parse_vkb_list(config, d_config);
>>
>>       d_config->virtios = NULL;
>> --
>> 2.43.0
> 
> -Nick

BR,
Milan


