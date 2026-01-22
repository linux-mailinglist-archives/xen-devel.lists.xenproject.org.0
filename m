Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHFdDm8IcmmOagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:22:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4644265EA6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210809.1522421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visl5-0005WF-8L; Thu, 22 Jan 2026 11:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210809.1522421; Thu, 22 Jan 2026 11:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visl5-0005U1-4X; Thu, 22 Jan 2026 11:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1210809;
 Thu, 22 Jan 2026 11:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1visl3-0005Tv-Jp
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 11:21:49 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a570426-f784-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 12:21:48 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL4PR03MB8051.namprd03.prod.outlook.com (2603:10b6:208:58d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 11:21:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 11:21:45 +0000
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
X-Inumbo-ID: 8a570426-f784-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXRJEkKIJR3vW6MjGQ1oBd4EXCtlp1RX30QDd98hRlSB06VzIzBqN0yFxboPq2U8MOxTwo74CHOb28CjukCgX0mmuOaquodLcUj1ZIQ9qT0kclLKlap7/a9NRbrGM0tc+L6h/NN+LevmuhhWyoKSM8X1mEO3ewNdn/WD1l8KLMwNbsCwR+ibYRPZjqLEc7b6tJ0NNLxfo58w5IAMClmJGvpqXBwgugBPKmcnjA10NwIzK5W2TXaNAN3qwM+malSVP4D89DsbBJBxD6kaLsTOylBpjfS8GN7GiJSl1cuD5RR0aXf+nkHxyDL3BVz70oIy0GpKKSjMfTPtrCJK1KDsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1umjDa2o12H+ndM7WMGAge8jra05SYf+bYKrmKi5ig=;
 b=q/rIse4E2T1YPLsh6ihTuRqHNb0ccfbpWsW6Sb3klxoa8NsTp1CtGxjpwoYs+Rj8f+tEsn2NZ3SGrc2WSmoi/oYnh/Rt3xPl+e3T1ra5yKe6MM9GrM5SK1WWr/jZHfQ9GktvYwzcO6sdYvVE4pn/GDBGQwhIbCTA05PRLizKKnzNSrvQAEUycEzzm1GWu0QZ6I+UhCjTphF3p6/Xmu1hTQmveq7wRnqDm1H9sAAA+uvnFbPc0RRl3VJBNwD9uf7RTeAFiOWv75Q5W4N0m6bcWahYG40PCvgcRn5EJZJqp9ftTwPup5zYMEzxTW+wfkCmOHEhOzNkoRpaghs+hiyrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1umjDa2o12H+ndM7WMGAge8jra05SYf+bYKrmKi5ig=;
 b=PgE7JdlrB366KdYBRnXFYozNgjZagZ7U2jCYBuZvt1tCpFwXGwRthW1cGjvd66DfUJ2a2pdNADJp2BYhHj9qwJQYaCg1xycDMcyG831d1eaRQuUoNs4bjfbTAGyjI5lUE/PFf6EoeDJXB9ZwaorP1s3gTfTIiiy9NP7etntMQyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 12:21:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 3/8] x86/HPET: move legacy tick IRQ count adjustment
Message-ID: <aXIIRtrYegADdz2o@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <f8ccb446-44e5-4939-91f7-ac17f660f56d@suse.com>
 <aXHkvZaxl5E0QL0F@Mac.lan>
 <cafc144d-5c75-49c1-9231-a854389382dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cafc144d-5c75-49c1-9231-a854389382dc@suse.com>
X-ClientProxiedBy: MA2P292CA0024.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::6)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL4PR03MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 280d122d-895b-4d17-4ea5-08de59a86cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEEvd1RVUWdGZzc1QmFSa3hWdVBrNTIweHRZTVQxM0NLaUVyZ2hEWUwxR214?=
 =?utf-8?B?cElZS2hpYkhzVVg0UEhkYjZ5ZW5uc3Z3VWxocWhuRVg0WnJUZFNPTy9yMHk1?=
 =?utf-8?B?WTBrc1FJbzlUQm5JYkVsV1F6RjRJSFBhbHRvQ1Rrc3MvWHJ2V1RqOUpWeXlO?=
 =?utf-8?B?Nk9FYVJSWWZYUGpmcG9QU2dsUHlLaDM4RjYwNGJXL1Eram45bWYyUTBEL2hk?=
 =?utf-8?B?WHJXOVh5TW8zeE5JSGdoSDBNbHZsUGU2UUlJTXhQUUFzck1GUmc0bkpuN3hi?=
 =?utf-8?B?RXRSRHhpd1Y4cXFjRWwvUGlGdlc0VWd6QWdJUkIvK3A1cGVianpGbUYwd1I5?=
 =?utf-8?B?VGFtbUU5ZG5SQ2d3czhqZXMybVlZRGdnOWp0MHVTTXhhUVFuVko3YUZoMkFq?=
 =?utf-8?B?UlZXdlZpREkwanM3ZWJqdU9Ud3RYaFlIU2NmYlY4K2p6NXFlaXdheTJEbHB5?=
 =?utf-8?B?TVFLK3dZZDFxbUtrdWtuY0FXbmFaSEtuWHErSnVGZE5MdmhPeUpyLzFJNEFQ?=
 =?utf-8?B?N3hLV0diVldWT25LditJRi9ab0cwbEt4cTF0MFRvUjJXM0xzd2lJL2oycTd4?=
 =?utf-8?B?V3RlOGNFL0xkVGJkeGNNKzgwTFJWNUxBZmJpRURRajZJQVVoN1JxRTlWc0N1?=
 =?utf-8?B?dXRSTWZISkg0QThJb1Q2azAzR2kxOXVLNnVNaWJuNWgyaEJWN2RPbW1CSVBt?=
 =?utf-8?B?RURnWm00NG9kclFSSjdnZXkzL3hBNm1vcXBQU1JpOHpiWHNCakZzTzdFc05o?=
 =?utf-8?B?RXlCWTkvRmFkT3lraTN6NW5VdmdPR2Q2SEM0ZVJTcmdwdFpjTWdIZTNveEtK?=
 =?utf-8?B?bWZML1A5QVhVUWRUdXo3ZDhmQ0FiUXovM2x6ZjhrUEhLQUZEN3pibHdMU3V5?=
 =?utf-8?B?RXhiN205bFZiZmVNbHJDeW5GRnl0TG8vRWdqT1JZZlcyZi9hRjVjRWRRbzZG?=
 =?utf-8?B?M21JbWhVbDRDWjMrYTY4Q3ZhVEx6Y2VJQmNoQmdsRnpPL1NzV1l2N0prdGI2?=
 =?utf-8?B?ZDNVRFNmTDJVU21pSGpjaTcrV1Fxbm12ejRLRG1ieERzcEROYlJHVzdBQkVx?=
 =?utf-8?B?emdGNGhINkpqai9OQ2pJQnBVV0thT20yY1dCakU1MjhXNExwMVBGK2JCNXNR?=
 =?utf-8?B?WE94R2owWG9tTy9kTHpnRFRxVkdlVTVTMjArMVdDVzFrRjFIaGU5aUVFY0ll?=
 =?utf-8?B?cG81Y2tQVnUwOGJRd2JsR1ZtZTY1d3V4WFArN0lTejVVdzZFWXhCRW44NmZG?=
 =?utf-8?B?dHFpQVk5anNCbFkyTWNmUW1RS3hIcjJWdmpUQ3NSQ2hhdUtjNmxQOHV0N25h?=
 =?utf-8?B?Qmx4RUZ6QkRTUS92Y1FqQlF3b3ZoS0ZHcHNtaG1wMUE1d1g3bXRoZGFPRU54?=
 =?utf-8?B?ekFURnBBVHl3RFlTUTRUUkdIMTlzQkxkSzNyNVdKbHJ0UENTZ3dhZ0RkdU1s?=
 =?utf-8?B?aUtJalY4ZHBsUDhmcklrU2dqOVBMdlRGT0krcHcwMkdGSzh6NVFCRnRHd0dL?=
 =?utf-8?B?M2FJUlladEpuQ3Y3M01HMEZQWXJYbUVid2V0cnFLeFFDbHRkZ2dvL2FuLzQ0?=
 =?utf-8?B?L25nWVJOdXZSQUJYZGVUYTdQa3VxZWtlTjlLc2Z0T2daUzFMQWE1RlY5bHhE?=
 =?utf-8?B?S1JCSmVnSmplTUxyc09GSkZzZkUvNzFvbkE1Zzk0NjNPMEhKQkNENE9WWGRU?=
 =?utf-8?B?VEtnZ0hJa3NTcDNMa28xb21Eelptb05TNEpCS1ZQZlFlb2pTaXFIS0RQcDNH?=
 =?utf-8?B?Ym1vcnZzY0Ntbk9UZ2ZNdmtkbWJhSytRM1QyUEt6dElzaHFaRExtdVZJSTV1?=
 =?utf-8?B?OUhMcGhMZnJFYXRjQWxadnB5QTVqanU4Z0VRUjBnVlVROFJaQ2VaYjNyeHMx?=
 =?utf-8?B?QlBlVk1RSlVGTW1LczRZS3g4OE9tdG4reHZkRU11cElyRFg4NUpSak1xLzNh?=
 =?utf-8?B?K0YrUkdyZkhrK1hTdmsvT09CWittK1dZKzV2RFpTSjg2Q2NWd0ZpOVhCYjJL?=
 =?utf-8?B?ck1XMTFHWG40RWlyUkVaUzVJZWgzNm44NGxIU0h5ZkFCTTFFUkFTaTBQTXYz?=
 =?utf-8?B?OE1XdGpQdUoxZ084NWNmWE5IaEs3eDdrNGo2RWtFVmRyTENSWmdLVGUyQnND?=
 =?utf-8?Q?tnoU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU1nOUdUakJBODZuRUJ5dVhoalpwc2dISTFpVDdqTGdvRGlYdit5WWRjSXJ5?=
 =?utf-8?B?QTMyOXhiUnR0RklaODVwK3lWWi9LeFNTMVZTbjR6U2dKR0JValhSUXlLcHJj?=
 =?utf-8?B?ekM0akZWRWFHY0FXaVIyK0pyYU13KzF4cFl1RHJjUGFWMDVPU1V3SjFhVUt2?=
 =?utf-8?B?aEFOdC9TMENSb2dMNzlHOEEwYlN2TFBuTVhDbHlLVjlzUzZMMHMvc2dHWFp4?=
 =?utf-8?B?MlZjWlFZT2M3bmVyd1dFcFpUNnhlekpoMnRRblR6QlR6dDdKRENJSHVFd3p0?=
 =?utf-8?B?MGJ6aHlUL0w2Ymd6dEFVTzJSY2JjbnFJbnVWOWR1QUd6YXprZ2ZaZUxmeDdr?=
 =?utf-8?B?azVxOTcybmp6UGlUbzZjWXQ2WUFFdzltemNReXRjVnBnMXZEdEd4d2k1NTV3?=
 =?utf-8?B?WFFnRXZJUDNob05wYU9OMkpXYXRUUDRFNmkrM3NxeE1JN080VTVEYldnb2Rr?=
 =?utf-8?B?dlUvSkRVU2VMcXJMZ0hENENKSlZqbVhFc05vVUFNK0RVK0ZHTlRCTWkvMnJN?=
 =?utf-8?B?U3hGUWgySDYwNCsxcXp2T0xkY1VIR1JrL1ZKNkpvNm9TQXZXanVuTkwrb2VB?=
 =?utf-8?B?WDV1QVZZNDRTWTh3ZG1EVi90Y3VuZ1hTYUlmd1l1azJiejFVMjFSQmFVTm44?=
 =?utf-8?B?WVNUSWdhSHlrWmdXMUZFVEV6ZThKaFpnVjIwaVp1Q2N5RG1PTEJvMUFMM3M5?=
 =?utf-8?B?UnFXcC9nRnJScmJFL3Z6Z1ZpemhycGVCTTU2elAzSHVGS2k2bkNHaExBdlYw?=
 =?utf-8?B?Q3pSY2JyNVd2UGJNb3dOUy9BeVd4Ym1pSG9PSStYaWYrSWFheHBDYkRNRG1T?=
 =?utf-8?B?RVlnUnBHVmZxNjFsT1BtVzBzanc3TXdXcWlJeFJCcGZKMlhtQXU4TWZ6UXBN?=
 =?utf-8?B?d29ETml1bjZQZFJqM0IvUXVJVWpOSUUrdjZXSkZSR0g0WndOd1FacVhvVFhr?=
 =?utf-8?B?NWpadUFPczNQQlB6RWk5UnRGS3Z2WTArTnNYZHVpaHpNdk81azVnSDUxbElz?=
 =?utf-8?B?NStZQjhVeTF4MUtpZWlhK2Fnd1ZSaTFvREJFTnZVbGxlQ1BzeVpkUXZjMVMr?=
 =?utf-8?B?Tm5sWTZYVFR1SENTTWVWSVFWUkt5ZnFITi9PUGlqTXlObU8vRXo4Y1ZJRkxX?=
 =?utf-8?B?c0lPdHBrckVoa3h6dGZSMjlXYU1ZdFpwMHk4RzE2TXNoczh2a0thL2NFdVRW?=
 =?utf-8?B?ajdONC9Lb2ZSNG9DSkp0VHRUZDBtYkVncHdTRnpMNHlKdG5CSHZ5VjdvdFdQ?=
 =?utf-8?B?Yy9qTW45ZmNDZ1VXTVpUb3NkZnE0NUwzZXFJN3U1TUtvNWd4elVhUlFCRENZ?=
 =?utf-8?B?MFlZUVl4bmwrbStyM2Z0TVdKc244Mm9zeUxDUmQ1VFlMRGRGUDlWbzkrNTZH?=
 =?utf-8?B?WjVLa3NoMXJrYkdycmtyNVd6bFFOR2J5ajUzbU40dWg2QUsxWkRZL2xpNmVX?=
 =?utf-8?B?N1p0ZzlUOHBWL2JvQ0sxaXJPNWhOSm5hNWRlYnBvV0FUT2UwUVMyd0RFcGgz?=
 =?utf-8?B?Q3F5Rm1FNTdjK1o1YytZZXQrdURkcksrTEVsRkNqZ09ZMEYwR3pCeUkrd2RD?=
 =?utf-8?B?VUtIbFhBekJHRURGN0JiMnQ1eVpyeGRlRjkrbXYwU2xzelE1K004REZJem1I?=
 =?utf-8?B?bTFYYzJDbmk0RGFmQXZDdHFma0VBNlg1QnVtYTJuMzdYOEdOMldwcTJsWm9h?=
 =?utf-8?B?OFN4V09tN3l0NWVyY0NEVUpzeGNmR24zbzlSQzZmY2I1R3FtMHVBN25Bc1Fv?=
 =?utf-8?B?T3VML0ZsTkV5cWRaSGlXSXR6UFp3ejFzYjkrM3FwbFp5S0RrdmhyZXBTQ0Ix?=
 =?utf-8?B?SnFYZkNSZ3ZQSExWUlhiVXFPNktIUFdnc0sxclJmeGwxU0dZMnFJRmZrN2Jq?=
 =?utf-8?B?a2JlaUtpaE50MGZXUU9jUDY3MmRkMnZVUkFCS012ZXA1bW9tdGw4clc0cW1a?=
 =?utf-8?B?cjY2clBGcUNxMWswaUY1bmtCZ2VKRnl0QUtyN0VLL2QvbjduYVBUVGUrbDVu?=
 =?utf-8?B?WWVtWXFxbVBPRUhxK3RQY2xEM3p5bGhFa09ocis4MUhXYmhGOEJmVVJrNHht?=
 =?utf-8?B?UHVXVG4vOWJ2MzA1eDZvai9sWWFFbVR6RTNVRDhpeVdhYWJxOW0wenhHYk5v?=
 =?utf-8?B?azlIMkhTRFlIRzRIaEZvYVJ2QkJkb05oKzBncS8zditxS1FvNUtIclZGaFZr?=
 =?utf-8?B?NmF0U05BWmhrRjJpU0ZaRWdQa3lld1plSUhjOEZFK0dTZE9YSjFvUWphdVZB?=
 =?utf-8?B?ZFZPZEx2UHI5TDJ2dW9VN3NpS3ZGMDFTTDhKcGExUzNiVm91VWUyMmNYV3lx?=
 =?utf-8?B?UUZmNGVSU1I2ZHp6Yi81a2kzYVRpRlhiM21kL1h3TnQySTZTaXVwZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280d122d-895b-4d17-4ea5-08de59a86cf2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:21:45.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YpiHMKsu40YHTpfXT8j12CkQ24wlVQ3ohGtZKHBsZE2ltxVr7czOFJmIAEJrC2VjXP8J71LcQZJljf9weydBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4644265EA6
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:31:52AM +0100, Jan Beulich wrote:
> On 22.01.2026 09:50, Roger Pau Monné wrote:
> > On Mon, Nov 17, 2025 at 03:37:45PM +0100, Jan Beulich wrote:
> >> If already we play with the IRQ count, we should do so only if we actually
> >> "consume" the interrupt; normal timer IRQs should not have any adjustment
> >> done.
> >>
> >> Fixes: 353533232730 ("cpuidle: fix the menu governor to enhance IO performance")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> _Why_ we do these adjustments (also elsewhere) I don't really know.
> > 
> > I think I have an idea of what's going on here.  This accounting is
> > used by the idle governor to decide when to go idle.  On Linux (where
> > the code is imported from) the governor took into account the inflight
> > IO request state.  However that's not available to Xen and instead
> > they decided to mimic the tracking of the IO activity by counting
> > interrupts.  I bet then realized the timer interrupt would "skew"
> > those results and make it look like there's IO activity when the
> > system is otherwise mostly idle.
> 
> Hmm, yes, that sounds pretty plausible. Except for one aspect: Why would
> it be I/O that the governor would care about?

This is all hypothetical, I don't know the real reasons.  I think they
aimed to avoid putting the system in deep idle states if there's IO
gong on, regardless of whether the CPU is otherwise idle.  Putting the
system in those deeper idle states would also increase interrupt
latency.

I'm not arguing the initial purpose was correct, just attempting to
make sense of all of this.

> It wants to judge by the
> system being busy, and timer interrupts generally are an indication of
> busyness. Just not broadcast ones. Hence ...
> 
> >> --- a/xen/arch/x86/hpet.c
> >> +++ b/xen/arch/x86/hpet.c
> >> @@ -808,13 +808,13 @@ int hpet_broadcast_is_available(void)
> >>  
> >>  int hpet_legacy_irq_tick(void)
> >>  {
> >> -    this_cpu(irq_count)--;
> > 
> > I think you want to pull this decrease into timer_interrupt() itself,
> > so it does the decrease unconditionally of whether the interrupt is a
> > legacy HPET one or from the PIT?
> 
> ... I think moving to timer_interrupt() would actually be wrong.

Hm, I see.  It's only HPET broadcast we want to avoid accounting for.

> > By gating the decrease on the interrupt having been originated from
> > the HPET you completely avoid the decrease in the PIT case AFAICT.
> > 
> >> -
> >>      if ( !hpet_events ||
> >>           (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
> >>           HPET_EVT_LEGACY )
> >>          return 0;
> >>  
> >> +    this_cpu(irq_count)--;
> > 
> > Also in hpet_interrupt_handler() we might consider only doing the
> > decrease after we ensure it's not a spurious interrupt?  We don't seem
> > to decrease irq_count for spurious interrupts elsewhere.
> 
> Even a spurious interrupt is only an idle management auxiliary one (i.e.
> really an artifact thereof). It doesn't hint at the system being busy.

Right, I was mislead and somehow assumed the intent was to avoid this
counting for all timer interrupts.  Instead is just the HPET broadcast
that not accounted for.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

