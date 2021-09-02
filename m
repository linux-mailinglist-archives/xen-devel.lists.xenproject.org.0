Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E83FEAA3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 10:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177132.322365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLi7m-0006Xx-43; Thu, 02 Sep 2021 08:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177132.322365; Thu, 02 Sep 2021 08:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLi7m-0006VT-0z; Thu, 02 Sep 2021 08:31:06 +0000
Received: by outflank-mailman (input) for mailman id 177132;
 Thu, 02 Sep 2021 08:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLi7k-0006VN-D1
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:31:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f51fa1d-6613-41a3-9899-677809f43e6d;
 Thu, 02 Sep 2021 08:31:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-nYqOpu4tOfSFDLmcRm-NOQ-1; Thu, 02 Sep 2021 10:31:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 08:30:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:30:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 08:30:55 +0000
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
X-Inumbo-ID: 7f51fa1d-6613-41a3-9899-677809f43e6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630571460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k4ggceMNvf4IRPKEMkkUaFmoZHmRsMaw7LT5S9Zt76I=;
	b=mLQHJxW/8r4d8ZJyMdCJONtumbTxG8k9KCGMt8810MPppKDctjRBIVSE3DlQRiwSZTLXLK
	LyhsskIwk2iMP6vsevNw+ucox4YO1ruszMpwmFFfgy9/ZEnmZJ5vyBwpigSiQf4jN6NpLP
	h4xXoiSXSwLqx5YzTwc+1B0clv7tCgk=
X-MC-Unique: nYqOpu4tOfSFDLmcRm-NOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSZ/CGTR841tgVVIFefnw7W1STvHB8Y87QlEZlFUrN8b/VY2Joq+qHPMM6OsnLGTa0pgaJvHatxUYNdLs7ar7S+232d9+pmJ02owC62nT+Xrep0QopFG7cmgtBX/MNCXpKxUot6I1HK6zswfJ2W2tOXrqKeSyFrtdx6sGjKkNF0bgqjqS+6/l6/CB5i34Y80BnOBYcoctX3lz9880439HgbYpOplHIuY5p1+ovkWl6tWjVpO2TCy9fh+Uumw+OgSY33gdRu1gPbnzDJVh+pX5ihJUEfB5muaq30ZPFAUiVuTJw00IvynV10wYC/HS4BHgfXhVP4s3Lw06LQ6hfQ+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=k4ggceMNvf4IRPKEMkkUaFmoZHmRsMaw7LT5S9Zt76I=;
 b=V9kYmAZo3wOL90yX3vpomujPPRJ8OpE9lwj3O9TihoZCU//Vfn+ZQRpFtfhEv6Dp1DVjuTUNvsDIdjgJX1Ysj2bn4SXEQQuvV/wvsFS1IiMpDZuYfMpUXXRLiymz+n4Os/a4pc5Zoz4Mo3H9gJi5BobmloNQbfC5+riM0ZKmKrnAnEe4PimJJnkxgh1udZwF8wCeaSLXplMfA2hFwiTvxxd89GgHDJ0Vva2N/aJb+FKBNdU3moCzoqjjNGIc7LsPedukr9Pbi/Qk26sXWfl3amMwxJXh4a0vyFaHH6f7nxJpqssWJw5PFlj5iDfM6mVNIU/n1HCHG4ehI1KVdxy+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/6] x86/PVH: Dom0 building adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Date: Thu, 2 Sep 2021 10:30:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::35)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ce5d787-71a9-4a44-7abb-08d96debfbb0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4189D37111B49187237AA39CB3CE9@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0uSdjd5vYEr33F7X5LJOgQobq3EsVDtEBtUCq0tj2aJSoBKjmfmSB9B6u0M0i5rvkWYiaTHGOnM+8o/rFdqCnxHJRkGSliJPt/ZrxEcZwzO9YBF1IU89A4LJAdljbHLY+QqbZCMt9B4gnR84CrYndTEwO+XOQuRAPPA1rXg1dAiFI6HtsqoSmqsaxMw7juAU/a5j1k2TCzOaPert9ILCTb36wv+S7kq3iqjtEyz9HZGukwVhTiIJVhpuH7LIOSd4i9xHso3JqCf+OpdN3eWqqAKeqaLaTfons+H2DDvrAKQaCVHyOI9O1Y0hT3XHnBWcS2EMBelUpzD/EysGo0RmUpLJML4t2BNOFuofVWtxDhULPr3p/S2jkfFY8+RZwd7AFseyFdVwp5cfJlZnhpfro+dmuZYeVNig5Grr3rncLxstvEPdTeS8agcveO+Fd561rVmlFUtVLEovtEfW8eKdE05Lp9GqW8d4XXGLgwESynwLNOXDaUPdBm6aJZ34nFZpotD4rjkqM5/0i3snRw8z/j+FGneVW0Ws/rdALfJJPs1V/RA11ISTzqLG/P0Vah7dB/bj1e70wsQgjHKXv8RTcleiRpM3ilAXC/15Rl6EIfKxeQABGRrXrnJ7hY/l9UYajTFVWTxWmN+j8Kqdu+mKy9rMJ9JC8CfOYCV6eY8nFua4ojVjT5XaKOpSNKquiQr97H6hcWY6nC+voBTtRbbyu6S3o03zeBCY/VEuwkCLKY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(2906002)(4326008)(508600001)(36756003)(5660300002)(31696002)(31686004)(8676002)(54906003)(38100700002)(956004)(86362001)(2616005)(6486002)(8936002)(66946007)(83380400001)(66556008)(66476007)(316002)(16576012)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGo0dUhJZHFqZ0tZTGs5bnExbUFOVFFMUzJCakx0czk1bWhQTENOQWdDSjVL?=
 =?utf-8?B?STlNdWt2elNWYnFQUnVDYnZKWmMzNHUrRzVKZ3pzc0lTcmQ4ZGNMOG1DNWk0?=
 =?utf-8?B?b04xUG5HdHdVOSt3N2xDbGlWWWF1empyTGcySEh3Y0xNTVM0d1VOb2ppdUVP?=
 =?utf-8?B?dG9HRFFRbWRhZEg2T0ZMSExKN0NYQTdudTJlUWFWQU9rSnZzTm5ZaDZGZVBr?=
 =?utf-8?B?cktOYlpZckc3Q0Q3cUFYamllQUtCUHFFSWQ1UWZYc2xhSThHQXN0aEZVRnpz?=
 =?utf-8?B?Q0NKVmVkd0xzZmpwa3FRcHVBUHdnYUMwc3dBcGtJM1JhVnBYV1g1YkpLZ3Zn?=
 =?utf-8?B?V2ZLYnB3UlZNa0V3SmhIY0owalAzRTJPVStFTkhKd2VsU0I5WFBYTnhOTGFS?=
 =?utf-8?B?cGgveEp0akJJSVR0STBaV0ViR3hMQ1p5R2F5VHk1MUhjUTI4cE1GSUcxUVp0?=
 =?utf-8?B?NHM2STBMd0E4QWZvd1VWSTdVazA2QmI0R2U3d3VKazFyV0VKM0ZyT0F1anBx?=
 =?utf-8?B?Rm1NNDRKU2tIeDluUXVMcUwyWjF2bDZrY0NsUFZQcHozTzJPRm5naTFRNGE3?=
 =?utf-8?B?ZlQyeVdKVFloR0p6T2RWdEIyNU55aUw4dHdXUGxHNE56SENTczM1S0krVnhU?=
 =?utf-8?B?Y09XbGNSbWxZbUZyOE5seEVQNzNQdFlNc21kNkV2T241YytHR0JDa3krbDMz?=
 =?utf-8?B?TUVTeVFKcTBIR0RGZEE0RDg3cXpiNmpUNXEvTXhMSjkzWmtCSExraUhlQUEw?=
 =?utf-8?B?dkpNMkRVdmZzTGZvZWRmMUdYajBHNCt6Qzlud1pVK3ArOUZLSlZKZUMvK3NG?=
 =?utf-8?B?Q1dFTUVIeHRLK0NEMVhFdXMrWUFnelVOL2pnNUtHSHIvRGppVXlaM1N5RUZx?=
 =?utf-8?B?ZU84VXJ3V3RTM01Dd01BcTBTRkE4RnlXQkpJbTNmVmtWQStzek14ZE1hU2hB?=
 =?utf-8?B?VjNTblladlhDMkxXUTUwN2V4VDhaN2VYaGpHeW4wN0FMc2ZPWFIzdHU0dkJn?=
 =?utf-8?B?V1RvcGF5Mkl0YTZxcUJqUkNxa0VlZTl1Uk5zU2pvZ3R5dWhMdlV0bk8rSUhk?=
 =?utf-8?B?aUU0MTVMNzlWKzlrS000YVZjL2F1Z1hiU3h3VDQrSW45NWhaRG0rbmVmTk11?=
 =?utf-8?B?RXdhR241SUdHRjhWNnVXd1FudlBJaGZJdFNHOFpyV3h6S3hWMGord2VaVVlq?=
 =?utf-8?B?ekxZUFpGRFYwZis1NWk0ZS9SOFpDYzlndEJKTHRQVFdNdExaNTJJd2lwYm5j?=
 =?utf-8?B?UTZxYWlZNFg2ZkFIcjA4bi9MdFFQQjFMbUhjM3I5czg4VGxJK1VVMmxPVHVP?=
 =?utf-8?B?V1NnK1Jjc0Ntak5iWm9OVlAxMDV1TUZPdmlLMjl4UE44RkhjaEFYWUQrbnVS?=
 =?utf-8?B?OGlwdDFQQjZyNU5uUmpWczM5M0p3Mi9QbmthdnUyalI0alRCbW4vVmZ6ZEdT?=
 =?utf-8?B?K0hnM2NSam9tci9zbjFFOUlLaDB1SzljcHZhVG94UGhGbDBwVEwvQnM1a05L?=
 =?utf-8?B?b0UrYXNDVU9pVWxnSGNHQUQwZTlRTzdRQnpvTEVMM0J3RDBqa3h6ZVhTbmRr?=
 =?utf-8?B?NXZ1K2dNbzVETldGQWk2QnpFZG10STMxRmFtYWxxd2hLOE1VODJ1aUdKT1pO?=
 =?utf-8?B?OVhEbUJvOThBZXFCaVd2SDVvSHMxeEhoL1QwN1FMbE84TldKOUVHQkxFN0RW?=
 =?utf-8?B?azRxaVFPSU1JRFBRWU1kdmxoWWtTajRUYm96U3RxdXBDeEI5VThSTFlzSGND?=
 =?utf-8?Q?Q5tzl4rNQ71g5RGrPnION4UxC73S5sgLWC2tQvf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce5d787-71a9-4a44-7abb-08d96debfbb0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:30:55.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7AZYy9lWD23se5Xc7Bkhdkb2YayuXgUtI3BGPbHnnjjIaie4psptz7UenHTFi4jjlS8pHCQM4zMK0JBc/QAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

The code building PVH Dom0 made use of sequences of P2M changes
which are disallowed as of XSA-378. First of all population of the
first Mb of memory needs to be redone. Then, largely as a
workaround, checking introduced by XSA-378 needs to be slightly
relaxed.

Note that with these adjustments I get Dom0 to start booting on my
development system, but the Dom0 kernel then gets stuck. Since it
was the first time for me to try PVH Dom0 in this context (see
below for why I was hesitant), I cannot tell yet whether this is
due further fallout from the XSA, or some further unrelated
problem. Dom0's BSP makes it all the way through to entering the
idle loop while all APs are still in VPF_down.

[And there was another rather basic issue to fight first (patch
 was submitted separately as RFC): vPCI wasn't aware of hidden PCI
 devices, hitting an ASSERT(). Obviously I couldn't afford not
 having a functioning serial console.]

In the course I ran into an oom condition while populating Dom0's
RAM. Hence next some re-work of dom0_compute_nr_pages(). In turn
in the course of putting that together I did notice that PV Dom0,
when run in shadow mode, wouldn't have its shadow allocation
properly set.

Finally make debug key '0' work at least partially for PVH Dom0
and limit the amount of log output for offline (down) vCPU-s.

1: P2M: relax guarding of MMIO entries
2: P2M: relax permissions of PVH Dom0's MMIO entries
3: PVH: improve Dom0 memory size calculation
4: PV: properly set shadow allocation for Dom0
5: PVH: actually show Dom0's register state from debug key '0'
6: HVM: skip offline vCPU-s when dumping VMCBs/VMCSes

Jan


