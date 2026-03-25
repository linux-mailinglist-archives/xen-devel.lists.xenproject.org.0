Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PcaMTL4w2nPvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:58:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E51932751E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262509.1554982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Pgy-00037X-BD; Wed, 25 Mar 2026 14:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262509.1554982; Wed, 25 Mar 2026 14:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Pgy-00034p-7z; Wed, 25 Mar 2026 14:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1262509;
 Wed, 25 Mar 2026 14:58:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5Pgv-00034j-Px
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:58:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Pgv-00DBmH-5E
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:58:41 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f806-e002-0a2a0a5209dd-0a2a4504d036-46
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:41 +0100
Received: from [52.101.62.41]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f81f-c823-0a2a45040019-34653e29455b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:40 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8032.namprd03.prod.outlook.com (2603:10b6:806:45a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:58:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:58:36 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWQ/XXY+vFl6ksggvzys+RvATkXFredh8b8uiq7gXZ6r7bDCbYwKlRhcgYimZeCsZQqZGmSmxlFsM06XDXCOQ2igis/Sh4LkUbLMaWsXCnvs2FvPE9pv802vlDuzCCd31oB7qkAo7A/Dy4K6t6CcOWus36gYpfz8nE6eMI+8IfUORDN4KbaBzxXbbz4JrPG756WoN932L4JgDnM2SVnLjRrSRQCnNFScWEauZihIea1Z576ZizPWpF6eSZOkqx+8jG0gH7+MbiyuQsXDO+Lr8nIfb/Nkz7vgynTd9epPnXXfP+oiMRPwdduQrTrfBnxPQkarOzTygjEN3lG4nKJvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bw+fm6hju0Q38OCLE/W6SziFn74bzUBojgYD8xApJk=;
 b=gCvAtMtqvFTTsMjB1+qXu4jUsIHvJV6ZK7085WjDEtwHgyxzSKrBTIL60n/EZiPrYiLXww83VnUatzufXn3V6Fkc3IwfRECglnAggnqI1mYbInklzTIHX++mOfFeMi+kF53M7Vo1pI7cuo1x64AQq2sn1TiO3AZQpo5/JLGjRMyuzdhCBGmL7VL+8bpOw/Oo4E2nZcpwiKjf+XgZyypULGMI80+mkRrpftegKwu4AdMRyPffTAquHTvo9Qbj2uW/7d0KtoJjlKCtNU+faAaTPVe6Xkwf2DKgCg76TUjtqCIvdmLYmWjFaylq5n+boHDCjVM44E5qVP9EMi5QA0ab9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Bw+fm6hju0Q38OCLE/W6SziFn74bzUBojgYD8xApJk=;
 b=BlnRc3xOzXTwyTvm3E/zXeB9xGjx319ygwoM4JdhW8c4JiZZD2JsPLnk6j0LV0coJKY9IISczdTjv54fAveOwDPIlxNOWggx6IV4hQFRIk+U48cr8OkiQRMqKGvQeRd8RS8ngzSUE4YDeQeiDepsRHN+AouhIniObUgvff3ApPU=
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
Subject: [PATCH 0/4] xen/uart: some fixes and improvements
Date: Wed, 25 Mar 2026 15:58:20 +0100
Message-ID: <20260325145824.31601-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0068.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce32d55-1b4e-49c5-ceac-08de8a7efd94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Bt7GT0GBxu2EowDKxmS41qBhkRPi/y+KUvxVkdEPrxpExA9JLPMuWXPrLmotRrDz1aNFhXGCxV9ECRjwzfoVxJFT0oXwkox12pky3lXPD/KGkSXEnUZQlnLFhQYVNqBNlMSY1/wmYzdBdFSb2hfnDnOrZecH+V5oxnRCoou+xSNvvdqFVKQwK5JUj8xWEy7/wx9BjYC/rbxHcFhZiPyZY0ZT8wppYqiiLhJmLSm7Ys3NFVpexO2GLRVFvu8S5NCduf+d/giPs4cO0rRoTZLtX8Ntg+PUvmqeFGdJ5M583sBxC7MD6EHepOW06v0LQEoqQ/bsXI0omnvf3VQNxOdgndSxiwrx4yu538vMShQKZ0nRYNwvkFCWGWSfjh6G4oIG1QRZgjOVjGWIQ2B6BWU1hCH5k5V772e4LoSsFZdW9PL2Jp0K0B8Wd21b+XNuiIdImZxaSCX9sBZ3vo+2PvonxsAM2vI+tDX5xo1f5pzOzrAqjheGuWs4LULJbiod+UUxhgimu8jU1X2/ey0BVuE4pKkAAlC8DnW4WxOtXIfOhRsym5FuvvAjfwSr+KyJg1nHYMUXk1jJioYYK8qyJwk2rJPaSTCjDt2miAGf90RydNZ3mlUYwIooBllTz+e9e34bTwRY62tEIQmldXimQyEFMpalq449lWMsy2gwzAu4ochKz2KGrL/Xrxooz0CNcG/VtYtj7voC53oVKLYp6kxnLvONkBaS4QjEN1Z7xuKsePw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?andpcktYQ05XTEJzU0trRjlzcmR1VVF5c1hXc3kwOTFFaStPdGVJWTR4ajJk?=
 =?utf-8?B?OTdWYjBvWk9ZNnBneERXUEE3S2VVdi9Ec3o4VlhocGRCcWVSd2JrMVEvaCtt?=
 =?utf-8?B?S1hneHc2RXI0K3JSSjNjUk1GaEJSeGRiK05CNk5hOEl5cUZMaWx1emRDNGg2?=
 =?utf-8?B?d0JUWHROYzhnMWY1bHlzb096alp3dVFaY3FXdCtXUUwwdm9xbWpidnYyL3Q4?=
 =?utf-8?B?S2NMTmxmeXdvSDVZT1NGU1BBS3RzME5kV0pVV0NWbjh4ajh2VGVBRnBJT1Q4?=
 =?utf-8?B?VGg4Z01DVXFQcGhkeFBsUGZaZG44TVpEU1IzUVFGR1QzYVhCWXh4TVpEQ1hV?=
 =?utf-8?B?MlF3MSt6a2JTeXpqWEs1QzdGRStKS2Y1VmFzdWxhcUc3dnpTWWV4NEtwcWk5?=
 =?utf-8?B?RFBpWDVxME5nQWRBL3NMU1c1TXU1bDNoRjVaeGorWmZHLzJGTWFoemdidjky?=
 =?utf-8?B?NS9tSS84SmpGWjJ2MHp4amVpdUp0VmZoWnVVcFNDblFEUWlDSFF4NjNLdXV1?=
 =?utf-8?B?Wk5PSXAzbW5qZU96amdwQis3amh6Ymd0RnBzQVdoUVlZaE53QlRKWHIxeVJM?=
 =?utf-8?B?ZVQ4bVYreU8wRklaNkEzWlFleG5wUklidW5UbkY0OUw4OXpZaTFsOXlkVVgy?=
 =?utf-8?B?bVJUV3IwOWh5MFdQME5MdTBzU080SVp4Z2JhRzZEeUZtMGZ6bzhrRG5sblhM?=
 =?utf-8?B?cmt3Q01yTTY1WkVrbDV0V3BPQk02MTFadk5UOVhHYWQ5MUhhaGtGanFhdWJp?=
 =?utf-8?B?MXhUdE44M1Byb3lGMmc4dDdCb0V3bWFXSmM0QjZDU0NRMHY4RElUc2Mwa2k3?=
 =?utf-8?B?eFlZdTBBZ0I4emtPS0J5Vk5QV0hxenRnNTVUVTEzdUxoalpMcjVEbTFlY3hJ?=
 =?utf-8?B?dzA3Q0lSSWVWL2hoOXdXdGo1MzZ5T1luYVJhbjNwbzRXQVJxN3dLb1FVc1Jh?=
 =?utf-8?B?YmFYZm53Y1o1azgrUCtRRWNiWkQ1UTA4aWx2T21MVE04dnd5SjkyM1JoVFlm?=
 =?utf-8?B?dTZvbThkY0NmY1E4VHRtOEZkMU9iaHBYUjNkajJTUXdJUXEzbVAyUEhhY0VD?=
 =?utf-8?B?RVBKT2RiVXl0TTk4ZFNHamRHa3F5WUdtNEt1NlMvYytxdkZEVkpiMkIwQ0Uy?=
 =?utf-8?B?Z2hmWVBsZGs4MmV4TTNDMDNMejBRdDQxVG80M2hRU0x5V0NTaXI1eUZlTzVV?=
 =?utf-8?B?WTRWanlYd1lkSkdlcVZ2aStpZ1dJRXhhTGxMdU5lY1AwKzFSZ3EwRmFJNW9X?=
 =?utf-8?B?OXlPUzhUMzhHdkU2c2FxVkRiekwwTE81b0x0SUtwcGwyZFRuUE9HQTdaaEtS?=
 =?utf-8?B?U0sxVWQzQnhNVFNxVERlRGRQWGhTQmhHcXNLNzdjMnZKdGpYNzBPMVlIM3Fs?=
 =?utf-8?B?MTU5NGNtUHNqK1JMb0tvdlgxZHUxYUhyT2ZCV0s3cGZXWnByQXJrTW41YTJz?=
 =?utf-8?B?TmpZNU9tdk9pelV2MS9QMXh4Z2h5ZU52WnR3MmRSdi96TDUzYVJMZXc3M3FJ?=
 =?utf-8?B?V3FKM3Vta0xXK1VEbVlLOVRMMnNWb2N6RzBiOFlzSzlMUHdURno0SXIxZHNi?=
 =?utf-8?B?Q1Z4c1RJUzF2NFRsVjQvcjdHZERzdFRWMmttdVZsWHZydXdzM3FVRnlhUUV4?=
 =?utf-8?B?T0RXbmdEMC8zT3dObjRQeHBtN0ZHYUNWYWtTbFUybk9WN0p0cW5qWDh1VFIw?=
 =?utf-8?B?NEVHM2M5RTVhSmVsWHhweFBKdFM5MWVNSzFMNVcrSUh0cmNFZjZFNm9UbHFV?=
 =?utf-8?B?VEtnbG43TU9RQnFnV0g1cFQvT0pwKzR5ZkxNVWFCd3hWTStvUTkrQ3J0ZnFV?=
 =?utf-8?B?aENDaFBRbHpNZytBMlNRajF6eWVjdFo5ZEw1eHo5anZhSDZndEtTbEVhSzRo?=
 =?utf-8?B?a3lXWDdaR3JUZ1hxUHd1cDdFcnVlWldVbjdJTWlzRUhtK1FqK01vRUJZQnZN?=
 =?utf-8?B?Ym1RaEI4RUVtMU8rc3d5eDZ6cVB0OEMzdlVUbW84T0Nub3BDNExPaHhSblBT?=
 =?utf-8?B?TVY1a2g5bnZnY0ZzSW5lbG1RenJ1NDV0RFBEUGVnb1huK1pMQlAxRUt6NGFB?=
 =?utf-8?B?NmhhSHRpZGtEeFBwSWlGSFFDTFMvVm5RRzBLWm9TSG02N1hocmFIQWpTWnh0?=
 =?utf-8?B?WWNsRCsvTlpiYVlSU00rUXBFK2ZJdUNJSldzWlZBQm5uaWwxellCUEd0Sm8z?=
 =?utf-8?B?UXdZNjdtY0NSd0N5eGhMR2cyWVB1WHl3SG1jdjd5M1crZHlpY1RQVlZDWEdK?=
 =?utf-8?B?UVhyeUoweGQ3OVJYbUVtQjgyVS85WUVPSjVJcVpkckMyTmQxOUNzR1p5M1lo?=
 =?utf-8?B?OW5xOFFRZGMyOUpKZU5ranlYNmFZdE53OUxDTThxVUx3dzBzSHZQUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce32d55-1b4e-49c5-ceac-08de8a7efd94
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:58:36.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4gauN+Iot59s8v2cNtVqiPnK/RXYhrycyAr4jTgQyrxm0851LRYXY2Ocr2FkXXLuKLj7caDKX/GcJmUBU+7dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8032
X-purgate-ID: tlsNG-ebf023/1774450721-BBC919D1-16558651/0/0
X-purgate-type: clean
X-purgate-size: 887
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7E51932751E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

First patch is a fix that otherwise prevents using the serial on some
(newish?) Intel AMT devices (at least the one I have).  Patches 2 and 3
are general improvements and cleanups.  Finally patch 4 adds support for
getting the serial configuration from ACPI SPCR table.

Thanks, Roger.

Roger Pau Monne (4):
  xen/uart: be more careful with changes to the PCI command register
  xen/uart: switch ns16550 to use pci_sbdf_t
  xen/uart: report an error if the device type is not supported
  xen/uart: enable parsing ACPI SPCR on x86

 docs/misc/xen-command-line.pandoc |   8 +-
 xen/drivers/acpi/tables/tbutils.c | 131 +++++++++---
 xen/drivers/char/ns16550.c        | 339 +++++++++++++++++++-----------
 xen/include/acpi/actables.h       |   5 +
 xen/include/acpi/actbl2.h         |  10 +
 5 files changed, 346 insertions(+), 147 deletions(-)

-- 
2.51.0


