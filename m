Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE5pLVLjgGleCAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 18:48:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676BCFC03
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 18:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219031.1527899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmy1Z-0005oC-Vc; Mon, 02 Feb 2026 17:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219031.1527899; Mon, 02 Feb 2026 17:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmy1Z-0005mI-Sa; Mon, 02 Feb 2026 17:47:45 +0000
Received: by outflank-mailman (input) for mailman id 1219031;
 Mon, 02 Feb 2026 17:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmy1Y-0005ks-HI
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 17:47:44 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 460adf99-005f-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 18:47:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6625.namprd03.prod.outlook.com (2603:10b6:806:1c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 17:47:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 17:47:37 +0000
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
X-Inumbo-ID: 460adf99-005f-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af2ziTgbBmI6B8VmUkADtgG+B/Qc6v6hH+dDt3MdSzXRQxJryGZcu5HaTvsfiack+sM0ouQQdiGTKLhWFZyiVX6lqkSQvpFxo/usJmvTYojuZa4A002S1ruUdtLrkBbDW/+SCBF+UyEC1rLDI/hiLXRceD6YCESjBmHXZK9u0DemhFLkqlVTycp5/JPqVemDJsHZiX+uXffVSZX9fhtoAOqFZLkW5wCXSOI9Z+m8dajt6nXgXGCBMBLJxkR3QhjGRU8tc+pEKGNh9QjrvUd2tX6kMnk2puNhqabttReSW1sgY3sq7JiaY96GM4wmI4Li8gRqAVpiRHnAxVXiEpIL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14wrngn2w6vEI+Giqf6ydZkY3Hc5fSj4Xf8LvepCggo=;
 b=coJ2fEkTNv7EPahqDuKwNYEfv1Z7nNmYR3bSy+p9qJzTy/g1I7WSgZ5ReaooAWH+9CvpsFf9xJoIEmOncmNL5ho7/iAmVb9TZ7S9U4RrfSUTJVnmH40dYAjpSbJzc1llCAgtBRI38+lTjkz/XDIm9M671oA7p+/tZdY3a+emNeNxNqkUQnvb6Sf+/4puXu1jhHlmKPaeOh71lDdW+Yr99XSGwyBWlYnSyGrep44QANviE/YFqDhFljjDPqFXkqXlay/8E1aKmhyllpbLJ4A3OI9GiF3XnYGORydVR8TP1yt5iqF2udGaTqV5KrXio5kJFzBSs07GEIzEwIXO/bLb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14wrngn2w6vEI+Giqf6ydZkY3Hc5fSj4Xf8LvepCggo=;
 b=fEkBMFa/oA4lPAqdJXlnkieOVeNGGaNcFjcbAA38PwhJBE1YMgVAZHClwtXkQ7fJZq7cykBKXhq001CE9mrhx8YbV0er809WhLu0auXOzzEdUvyXG8B/6P5rXKqHeidFLapjms8e2Li6dqA6lbM9bqWSa/Y2VPZ5LcTTog/wc4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 18:47:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/MSI: adjust permitted vector range
Message-ID: <aYDjNlYqvaWtSXLK@Mac.lan>
References: <52227196-dbc9-4f6d-9c64-a5da5037b1ec@suse.com>
 <aYDIusUCsFZaSaQH@Mac.lan>
 <858301e5-2ca0-494d-9032-bf5802771e8a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <858301e5-2ca0-494d-9032-bf5802771e8a@suse.com>
X-ClientProxiedBy: MR2P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::24) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: be47564b-b1fe-4463-1f7b-08de62832786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjRkVDE1UGR3ZExNcXVsVkVjN3ErdGlBWjBoUHlGRDBLQUNQSnY1WXN3WVQ1?=
 =?utf-8?B?SUhXemJnREdUN3A5cCt5YSthMlkvV3lvejIrTXhpSTJkb05qMjlSb1A5ZGUv?=
 =?utf-8?B?Y2RISGFYQjg1MDNrcTNRcmNuZCszSnVjaXJqQnp0VmRPRTYzRHNXTnNTcjNE?=
 =?utf-8?B?SURrRjRaRjRCTkdDVUc0MGZ4OGN4aE16UGV6M0hYMzg1L3R0OWhwQ0Y5b3NS?=
 =?utf-8?B?d1BqdHVKRFM2QVFwMlM5eDM4K2twTng2RjNxWkRJQllFdW5tek9SYU9aUFlm?=
 =?utf-8?B?Tk9iRGpOVzh0SmJZbmNuSEd3WTQvajM3WnR1N3grdWgrbHh1QWJCR2tFMUJu?=
 =?utf-8?B?a29jckJLckVpKy9TRUZFRjZPajhrT3d2R2JmZGhuaEVPdXVuNGFUU0FvcFRw?=
 =?utf-8?B?WWxPbkNwOUVQOGRBa3JzL3hOdnJnR0pHZGI4RlVSWmNENkpXMEhMRVpnVG9E?=
 =?utf-8?B?RExRbllqRGFzSDJBS29CWWFOWHBIK3RFeXM0bFJyOEFGSWdrRitsdVJCUzF4?=
 =?utf-8?B?dDVmNis0N21FM1I1RFZTUndqTzl3U3E5UmpCQTRMODdXU0RxRFBVbmZXeS85?=
 =?utf-8?B?Q1AxVVd2Z3l6TWpLQkpwZTEzTzEyLzRTMmxlYVNJaXZGOUs1OElDbGpMbHFV?=
 =?utf-8?B?NHh5RGgzajNqbzUvRkg5Kys4Ny9PUWgvRzJiN0NmaDNyYVFrWEp4cVU0Vy9I?=
 =?utf-8?B?RnBPWGgrWU5aL0llQ2lyM3NzRWVLWk1rTFRpa0dUaUM1NmNndFNrbEYwemdj?=
 =?utf-8?B?UUNobWlmbEJJVTJKVWJQam9yTXRrN2lhY0ZvNVYxRTRnN3VOR0ZXL3JPVUV0?=
 =?utf-8?B?ZjlVMDRMYTZZdjdid21tQUs0NnY4a24zTWkrc2M2K3dEYkNMQzZNVWFhYlJo?=
 =?utf-8?B?OEVlWjY0NEkxOXhCNDl3WFNOTXY2ZEx4RHg2TzlnQVcwNUlkYk52ZENUSUt1?=
 =?utf-8?B?ZXVDUU9WMWpBQWwxZU1mMWpTQjBpZG1OZ0ZIMDloQnI0bzVDeXVvdytJSVNt?=
 =?utf-8?B?RnlTcnlMSVFuZHhCeTkyVWhhWjBoVTljQUp6UFNRcXo3a09TQnNESG5LSFMv?=
 =?utf-8?B?R2w5eEd4eEprYnRvV2VlUTZxcHJuTUFoNXVPbnJiYXRsNGh6QlhWS3IrK2Yx?=
 =?utf-8?B?MTZrTG16YThlNnh6cUFGaXZHUlBNSnpxMVZSVW9uV2FibHZVMEZzNDFxbmVh?=
 =?utf-8?B?NnNEVHM1UjU4U1J2WjlyeGxkZ0V2YWZXeC9DdUt1R05MZi9IaUQyNWlsSUFq?=
 =?utf-8?B?WDJtQzV6U1BHWVp3UFNIek11M3BDQW13YW1ZUUtJOEFNSi9sRXY4cTdER1FR?=
 =?utf-8?B?UFJnd3RmVUYyaEtCSzNQVEdHVHlWeDVEREQxekFXbHFEYUdLd3c3Z0Z2YWZt?=
 =?utf-8?B?N3BzZ2J3Z0MrWkNjRzMvOEVlRDNrQ2hESFJvODJHdVAxVnZoR2lNMUJ1T2Iy?=
 =?utf-8?B?SHBrdDhrcDdvMXBNZzI2RVVsYzhIUnJtKzdXdFBNM2ZBYWsrbnltMHJBeUlV?=
 =?utf-8?B?SFo5V0NxWDMvUHNXeGIxZnJja1JRSUR3WE4zc29QemtzeEdGVGF0WUZZSWJk?=
 =?utf-8?B?dnRmeHFUNERhMi8vOWxEMmFUWWd1VzBLZmlOcGxHdGZiSXAvRUo2RHFwRE5a?=
 =?utf-8?B?VHk0bmM2YTd6VEcreVJVSnlwdEdmN29XN2RQMHZ0aFVzbE9jTk54MTNmYkJV?=
 =?utf-8?B?bkd6Z1dXVXhoMWxXQklxSmY4ZDFKYTdYMlUwVlBHZVNuSmZWUE5YRjFFa2pJ?=
 =?utf-8?B?UDMxRnd2d0htemlnOEZtUWZ3N25mbkh5MGJDcmNDU1ArVDFwRHExd1IxeEUv?=
 =?utf-8?B?MEZueC9rUzBUY1RWL2s3djcvdlpiQTF5bVBIWjlWWno0ekFEYXZJQStkLzRX?=
 =?utf-8?B?NmY3VmcyaFdmcEpHbnFlenJzZkQyMjNFV0tzMHgydVZDbGxkdEZXcEFRUnhO?=
 =?utf-8?B?TmhzRGU1QmI2STRKR0pjMUtEdWFyb3NtaTE3cXc3QUdhNE9PYjI3ODAzT201?=
 =?utf-8?B?UXpjRjBSK05FOXRGWWZydUEvSHZPdHFYYUdEeE5LaFRYVmhiemxKTXV5VFJZ?=
 =?utf-8?B?TEtjR1U1N05QMWRtc1BtVDBSZjlYK1dlaVRiRnR0S2ovU29yWGd6SHBjLzFs?=
 =?utf-8?Q?2fk8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2c3UUE0QUlidm5paUlZQzNRaDQvcGVFYTlzME9tK2IwOVRFQnN3T0FMa0U5?=
 =?utf-8?B?RVNWdFBxNERYM3IvNnc3bHA2M3lMSjR0MUxYVUkxYVl0NE5TNFdCTXZhWGpq?=
 =?utf-8?B?WDYwS0NxMHJnQmR5bHZpU203VkZqSkxhQ3R4MDlvU3hWbWZiQnM0cDh6RHVZ?=
 =?utf-8?B?NGVTcDdWZFFLRnVQMVFONVQ0YitBQWhDVnVoMEJ3cFZuQXhGRjBRWm0yWk9q?=
 =?utf-8?B?N2lrdVFtamg1V2laeUoyM3BucG1pUUJ3SThMUW5RRkF5RGM0Rkh6MUc2dXl6?=
 =?utf-8?B?dktDbVcvWksrWkluZjZNWWIyZ0hqb3RVQmU1empoRzhtUEV0em5wd3FYcDlp?=
 =?utf-8?B?azVJNTJUTEd5UldERytuRkxiWlp5bUJ0UHZON0dlWWY1cG5mWlRWUmg5SzFI?=
 =?utf-8?B?a2ZiM0xjaEFWSy94ZC9GK3NBZkkyT0JhZHVkeWxCYXpGVWg2aGJheDJWdDZU?=
 =?utf-8?B?T3dIN0lmRWZvckpDMXl3S2xudEozbW9zQ1NvWSsxbG5TeDhmQWkyakozcTZT?=
 =?utf-8?B?MDBiaFdjMS9SalZyVkVSaWZYdnhEOW5ac003TW5CaXdhcDMyaGRTeXpRckV0?=
 =?utf-8?B?b3NQL3dOdGU1c2d1Zm8wN1UwUS94VGlLOEt4anN1NDNRdUZJMlFXL3JZam1F?=
 =?utf-8?B?OVZwNS9mWUp2OUdBTWpNWTIwY0ZKVHQwVXdOQVRxRkM4d1BLN2lodmUvQi9D?=
 =?utf-8?B?N24xZnJTU1BMZGgyNFNQYTNGRmhsRUFiQ1Nldk1NUmFLTmV5VnRMOC9PK0Zs?=
 =?utf-8?B?UEZTK1hZNlpNYzdjQjhhS212SSttMTRIc280eWFDODI5ZDU5dmZLZytxNFo1?=
 =?utf-8?B?YkorbWNTcHBlRW5pRUIvQzh0N2tMenJCUUdMdmNrSkpObWNBUGlwUXZKSWZr?=
 =?utf-8?B?K1B3UkIxV29vVkNSYmhVemdUUHBnZm1OL0U2S2YrOWREMktHWDgxS1d1S3k0?=
 =?utf-8?B?R0d1enlwYUhpeUJ4aEc5K3ZPT3NMM2pZMTdsUzJHQ0h1K0hReFRqRkJUUjNz?=
 =?utf-8?B?aXFaWFJHTlRaUnNOU1NsUG1XT3pCZEpseUhJOUp0SVRzTnZ1R0JGdXJzWGpP?=
 =?utf-8?B?OWdHRVo3WVpKR2x5YzVwbTZSOSs1QUx5OVlkQ1RZd1BHTzc2Y25FaFBVUTlv?=
 =?utf-8?B?cDBUdW5ySHFla3ZQSjRzZjM5S0RtazNxa01DZmF4RHlLb0N2M0EySXliQnc4?=
 =?utf-8?B?bUkrWmlJZ0gzM2hVK3IxOXN0VFNBQnZkTW5mMWk0bEFCNGRPc3ByWU9sOCt2?=
 =?utf-8?B?SW05OHUvdHZIQkNpWTFLRjN4ekpIeGFwdDB1RVEzbjZ5QUlzd3F0ZitMTk5x?=
 =?utf-8?B?bldTZUtTdEoyUzdKTVAyMVRlenJTV0x5OWtPRllrb2dkVzdHVk1BOFhYRmJC?=
 =?utf-8?B?SkRKTFRHUU9yMEtMekQzencvdm9SVEw1c3JSbUw5WEZTN2RTQ3JPZmpLVTJV?=
 =?utf-8?B?ZUw0V00zcjJHamlnK2d6a0RSLzVEYzRpUkVWNWZ4ZFdibEppVmRaWi8zTnVw?=
 =?utf-8?B?b1pENUwvWm5sNlczNmFEQ2lBb2RXdjVSL3BPVU51VSttclQvc3BUNW1ETzEx?=
 =?utf-8?B?K1FJRWVPdjZYWUkrTFB3RXkvUEljRDlPM1JJYmtZSEx2bXN1ZjBRVzhCWnl2?=
 =?utf-8?B?cEVkQ3ZBRGw1UHRIVmJidmNpU1dIN2x0V3dUWS8wZzNDQnR3cjlCZVhFSHho?=
 =?utf-8?B?NWUwU0t2V0dyVXcxQ2k4bkExVWprU2kweWVIVmJxOXlsalo4ekVHYXgrMFQ5?=
 =?utf-8?B?NWdxSXd1bEVGcHBiWkZzRjBUWm1RS2wyOEMrWU9yUXpuSjBwaGQzNkxRbVVY?=
 =?utf-8?B?SGhIcDRGSG8ycEtWRmNrMllEa0NRQ2hZWkMzbW1YTC9DUjZpbWNFQmtJem9M?=
 =?utf-8?B?aUZPVGRrMVlUaTB5ZkVXVkg1ZS9uNWVyQ2d6ZTJ2cnRYREJDU1cvc2RoSE1I?=
 =?utf-8?B?N1FEem5OTXBvdzRrVVBOcXVVTmdiQ1QxSXROWnZ6NDN6TmRhd2YvTDhDR0lw?=
 =?utf-8?B?a0syVGJIeTJpQUhSMG1Ccy9lZEJsdTc5K2ZLaXUwY3VwUC9qOXB2OExudUc0?=
 =?utf-8?B?Y2NLNm5YR2dmSGJqc09rT0pzZDZkMmpRcUpzTmFJMnRITTd0OEFTOFVhL3lP?=
 =?utf-8?B?TDdLSitXL3Y2eUU5Mjhnd2tBTUxxWTRwYWRQT3NFQ3crcDJXNkRmZHIxYS9i?=
 =?utf-8?B?VG5Pbk00M3A1aktHRmdDRUtZQ0dSRGhtaVpndEp4cWxrMG1RU0xKaVJuS1hY?=
 =?utf-8?B?bitQWHNLcHQ4YTBXczhqL1crWlZ2WWF5ZVEzWUZzRkVCRi9CSER3NiswVE9p?=
 =?utf-8?B?eDY5dU5FMHRLVE96SE4yb0JCVjJGNXBYeXc3SmkzVHpsMVh1b3dvdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be47564b-b1fe-4463-1f7b-08de62832786
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 17:47:37.8520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xbG/JwxQBNhQb3sZcpjWG43plPT0mCLYqShNPdf8el2PoQCUZ7m+6Pwy+q53FPGGWRAP3SOrW921H/LNUABzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6625
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2676BCFC03
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:12:40PM +0100, Jan Beulich wrote:
> On 02.02.2026 16:54, Roger Pau Monné wrote:
> > On Wed, Nov 12, 2025 at 04:45:05PM +0100, Jan Beulich wrote:
> >> It's really FIRST_IRQ_VECTOR vector which is meant here, i.e. effectively
> >> there is a form of open-coding in use right now.
> >>
> >> No change in practice, due to the present aliasing.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> While doing the HPET work I had to fiddle with this, even if in the end
> >> no vector below FIRST_DYNAMIC_VECTOR is being used there (for now at
> >> least).
> >>
> >> --- a/xen/arch/x86/msi.c
> >> +++ b/xen/arch/x86/msi.c
> >> @@ -158,7 +158,7 @@ void msi_compose_msg(unsigned vector, co
> >>  {
> >>      memset(msg, 0, sizeof(*msg));
> >>  
> >> -    if ( vector < FIRST_DYNAMIC_VECTOR )
> >> +    if ( vector < FIRST_IRQ_VECTOR )
> > 
> > Should vector also be rejected if it's > LAST_IRQ_VECTOR?
> 
> That's a good question for which I don't have a good answer. I can't exclude
> that composing an MSI message (for purposes other than using in an MSI
> capability) might make sense with a vector above LAST_IRQ_VECTOR. Originally
> (as hinted at in the post-commit-message remark) this change was part of the
> HPET work, where it was an actual functional change as in an early version I
> needed to move FIRST_IRQ_VECTOR down (i.e. decouple it from
> FIRST_DYNAMIC_VECTOR). There the "composed" message was used to fill
> HPET_T<n>_ROUTE. Something similar might be wanted elsewhere, and it's not
> quite clear to me whether in such a situation LAST_IRQ_VECTOR would then
> also need moving (likely it would).

It's possible that we could add a range between FIRST_IRQ_VECTOR and
FIRST_DYNAMIC_VECTOR that could be used for fixed low priority
vectors.

> Right here I'm really only after the semantic, but non-functional change. If
> we can settle on also enforcing an upper bound, I think that would then want
> to be another change on top.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

