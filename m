Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOULK2+Mj2nURQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 21:41:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E967D1397EA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 21:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231837.1536800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqzxz-00051Y-CM; Fri, 13 Feb 2026 20:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231837.1536800; Fri, 13 Feb 2026 20:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqzxz-000505-9B; Fri, 13 Feb 2026 20:40:43 +0000
Received: by outflank-mailman (input) for mailman id 1231837;
 Fri, 13 Feb 2026 20:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqzxx-0004zz-46
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 20:40:41 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41401748-091c-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 21:40:39 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 20:40:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 20:40:35 +0000
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
X-Inumbo-ID: 41401748-091c-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbhZmmwGz5KB0urrK+L4aNbvm062yvifhwPJ1nEhKghIAN9qEif6Wtp4YJe6/RkbzFsWeqkUa4fUVd9JVHRoKO2BsYduC72BPvyaxYRCCk1L3i4lHdQE2SdoLlMCM0Z6ImIHhZegTYGr+cQceMIts7HGOLmsNtOyFB/YluxoTszUt3YLb54cUS4BTLbjZ8sni0cpnqnqzRC/5eeTLNtkL8E5Hfih2cPsLbX3uMI2/9fa+fftjhpd0qGWr/KfEmkhy0T5JUDeuG1K1s9sacR4Tk2FoN+ZWGT8pZH6/Th/zaY5ZbKE6ewS5ReZT2Q50iK0JKXQUW085baCtIOZAFaAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mondg1boiBf4RbMEGWYnzqx9QgyaN+LDudJFiBHXykU=;
 b=ic9ZLCSw4wGX1ORXuJBH9P5Ef4LzytKFzntR1QXnUYMMrMA8Ygf9CbSv1AMMbC0VRhHSOSySNluFBDa0JbTpxPAxn55fJ1YZa50Ce+NtrHczV2iIE12muxM++5Rsmyde8hf+SBxC8I04/UcVkf67aKUSeyxMhpzrLsste9Jy9CLOzvVB0M8UejN+P171FiNQSWzNWVukTh1HhsyD62jWp4Tl+wwZvh+XFoOtgYsCXAhQ2IIUxHOZhIxYj3lWO/97QxaFiAWQkO6poB+ygnYrQOslwigOs6UUUcBHJZ1BCxNqQIM+NZqrZdiZx2W/XmglYHSq5WFAhcE484u8L3zl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mondg1boiBf4RbMEGWYnzqx9QgyaN+LDudJFiBHXykU=;
 b=R3GVADe55p9oo24sxXCdqDYlV+gORUjQoe6xySCJGC8v7+eNgUG3X8g20E7tJUgpEYh/wAWJdYuRxcY7KZoolkzUUCDkFdUWx2cfWhZVAbHgnTpzGnr7Nn6pYA1Ixd970LiFyYW7u2LNzfQCWpBEG30SrYzGFZgHwwKqoPYG2a0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 21:40:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd
Message-ID: <aY-MPz-HpZVkmhob@Mac.lan>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com>
 <aY9Jt1-jCWhStcxB@Mac.lan>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY9Jt1-jCWhStcxB@Mac.lan>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8272da-a4ec-42c9-2118-08de6b402352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG1rcmtMMGpGMDZ3YlBBeXZtc001ei9JeExxNkNuYW9lMjFRbUkwcnZvOTc2?=
 =?utf-8?B?NVZJZEZFN3l2ajJZQ25oK2RCUUh6SGoyQUpZd3pRcVVlb2N5cTV1ZTJsVytj?=
 =?utf-8?B?QVFndVNENEhnTDc4ZTJUVGNCUE9wbjJaYXgvVjZOMHVGZzB4WW5FeXFMQWtQ?=
 =?utf-8?B?N1plc3FHNEdxR0gzWklmbDhTWFd1Yjh0bTRtSXdnRHd6RlBBcitZSGNBSGlq?=
 =?utf-8?B?bmU5RmxBNW9OQ3NkYXpSaXhiS2FmY2U4b3psZnpEdmZkUkc3Rzc2dTNYUjlS?=
 =?utf-8?B?bGZXWVZqZzdqTW8zTDFNckt3TklBeDIvMzhFOC83blBUSXJPVmRIQkVaNWRs?=
 =?utf-8?B?aHVEbFNZc3FDbUUyRjJhdllMUis5d3l1NXcyaGd5UWJ4VHc2cEZ3M1hzTVc2?=
 =?utf-8?B?WUQwWXBMdjFCQ0MzVjU3SGNGQWFTYzF3RkVWNXBuVTd6L1ZwK3g1dk5yZEQz?=
 =?utf-8?B?WXFocHpjNlIvZDFudDRKaEkyQzhOY2ZNNjI3TTMra0IrNGJIamJPbFMzNko2?=
 =?utf-8?B?WlBlbDFCbi9rd3BRNnJFYzBiak01OEpFMFNXNjhHQ1BicElEbEprWDQ5aFZO?=
 =?utf-8?B?dFM5OU02UFZxOG5CejMvbWZJWE1Ndkt4ekt2SytkZUhKZ3pWUnpQNm4xOWRY?=
 =?utf-8?B?Wmc2UnJHSXZqWWd5MkdKU1l5SUYyMDN0RHhBSVlNbDhTeDZ4TkRqd3pnVzN2?=
 =?utf-8?B?QStSMlZWL3ovQXpuSC9ncDRnb2pYUnhKOWFRbVRmNlBhZ213M2tYVFhOeGlE?=
 =?utf-8?B?dTAxVmxjU1lpQkJMQVlTUzl5VU4xcDRtYlNyeHg2ZHJXd1JVMzZRK3pXQ0ty?=
 =?utf-8?B?UGNpZ1dkT0p6bjIxTE1oTkl3TlJZd0p5aG9BZmlnZE9VMFIyb3hLOG5uZTZk?=
 =?utf-8?B?Q0htQUhQdHFXQ2RJbmpsVW5uUlZjVDVTbDlObm1LMkZDc254OXhtSjFCRUkr?=
 =?utf-8?B?SEFkQkRiaTREZlJUOUJLZ1lDTFdHd2ZVTGRtd1FqK3dnMEs0UU9rUUxBaWZI?=
 =?utf-8?B?cjNOeTgxTmQ4TCtod1p5TW8wQkdkYWlrWlpPNnE0UENTUkNXcWhHVGVqTVE1?=
 =?utf-8?B?MzNDSXRMN1NzN1RHSm9LRnJKMlRuQzk3Q3dBamFCU25EaTJOMU9sV0thVjV2?=
 =?utf-8?B?azc1M1JoZFl0cm9SSldnbXpNalFiSjB5cmd3QkgwMHJyS1l6Vk56dllTU2JF?=
 =?utf-8?B?QmRiNGNoMllLTmlGc2xaODk2YWR2dEkyQnR4emJvaVhUZE9iYmZ5M1F1aGVa?=
 =?utf-8?B?cjEwaGZvT0FmVlZTUStGL2lkRDMvbUtIaGU5V3Y0MVAxRHRwZVgvRlRyZDNO?=
 =?utf-8?B?Ym5qWDdhQ21GWHYwODVOU0FCeXdzTm0vM3hoVlZZbmJiLzFHTXBFenA5VjAv?=
 =?utf-8?B?a3I3MHA3eGRvdGc1VHp4WmFseENLK2tSQ1lLUFVsRy9HNGd3RXRGWlphY25V?=
 =?utf-8?B?Q0R5enpDbzZCaFByalBZRkxqSGFNZm9EdzhlYUVHMU8xdWFoRlpiWlE0ZGdv?=
 =?utf-8?B?a0diUk1VWDg3QVpYTmV4aDlPUzJBNFJKMHFtMXk3MDJSVlEyd0xkSDE3cjAv?=
 =?utf-8?B?SEVQTmlmT3JrYXhibjUwdjFEbnpkN3VPb0NvNThyRkRUcGRmS0VxOGFlOE11?=
 =?utf-8?B?VHlCZjI1MFl2R1lYamVGdm9TMnlnVjBvOHNNVHMxbmkzNFFLVlBHOGt1TGxw?=
 =?utf-8?B?dE13MERXU0t4dXN4UlJVUFZGWE1lTXdoRi81N1BvZXdvVkU2R2EzSjRocjF6?=
 =?utf-8?B?cUdrSERXQUlFcWxCZk5pYzE0NmxYQUNjSkxHc21kdHpvdzZXOUc1SVh5OW5y?=
 =?utf-8?B?b0pCNk9udk5zckpBZjFzWE5GOEZ0U2x0K2k0YXVCRUlGd1dqVXZ0U1hhenk5?=
 =?utf-8?B?VWtJTVlXcTRPOVBUQmVrbG5ESEhTL0FWODIzQ05YdzlzT0p3Wk14ZUFmU1Vk?=
 =?utf-8?B?am5YUFNmOGZzSHhsd2lWTVkrMm1QdDFIR0dOcXJ2MWtjVEdRTXFFdE96NDdW?=
 =?utf-8?B?NEZUdW9OZHJ3eW45Y1JHZHNSQURGMXZlcWZFMjFOVzZEN2h0TEs3Z3NoWUNt?=
 =?utf-8?Q?QUewtn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1RqVXpUdlNHc1hKVmxSSkVJakZlbWNEQmVoT1o4Zi9mcC9sMFlCMzl4N1JI?=
 =?utf-8?B?Y2lwQitUd1VVd2V6bE9xRk5OZGFBanlsWjFPMzg5NkJ0dDVJQ00rRGN5YUJ0?=
 =?utf-8?B?anJGUk56KzFZanp5Vk8zS2hCZGJCcW1BelFZL1hqa2cyanZnMzl3eG90VEh0?=
 =?utf-8?B?eGxGbU83MlRiYm1pQmttRzlySlptc2pXMEFGQmVVR0xFcWY3OXpLRGphSXB6?=
 =?utf-8?B?L1ZBVHkrS1JVWVprMTFCNitqOTZ5NGdSMERrUGNtZ01HVm4zREZ0M0lnSWNx?=
 =?utf-8?B?SG54RHdxR1VZTkdTbmpyYVlDMHFaK21GenlXODdKZUUrS3BKMDZneDdRL1dL?=
 =?utf-8?B?ek53QzlSU0xQTHlIdGVDKzJJakFBWWE2ajVtN2pjRmEwWGJZWVRhZHJ6ZnpC?=
 =?utf-8?B?UmM3MmFvTkRsbmRjUEdYanBKaWNTR1pIOUV4Y3ExbDhSRjgrOUh3RllUUnU2?=
 =?utf-8?B?MFJtWEk0aGgydVo2ZVAxbkZyMUFycThoSXErYXpVR2gxOU9KdHFQbGJpWFpY?=
 =?utf-8?B?VmQ0NHRjZGZvakxyWGtqMk5xOUhFMVU1cEl1OWNnaTVkT3BhbVFKdG5FV0lF?=
 =?utf-8?B?RTBXUHRCdmlha0FPNXdnejZwV0pIOUhiRDlSMEFWb0JJOGEwS3RaSWxGOEZa?=
 =?utf-8?B?cVBTSXZpVkFOMEZ4QnlFQXJVWHJEeWZFZ2Ywc29kOFkydDhOdXpidVZGOEpN?=
 =?utf-8?B?dm5wMGNQbkVoK21WV2l3TDlIN2laNFpCMjVISVNkVm9PNmpGUTRXTHlROFg5?=
 =?utf-8?B?ejQ0a3FjdFdjSm40WGd3dTAzZ0ZYZElRdkFIQXJIMXNTamVxcW1tQ0NRbkdO?=
 =?utf-8?B?WVRNOTV4VnVDcVA1MHV4dWp4a0JsRnVXeGxOUTNaZkRlWUg1b290K3IyemJk?=
 =?utf-8?B?ek5vRkpWUFdvWXFaa0lTUXRMZG1nQnZLWDR2QlpidU5DRU0wQkVxTm9OaDFJ?=
 =?utf-8?B?OHFhMEJvbXFrYmNER0lQTHdySlRtVWU3cVVPNzVaRS9GVEZPSFhva3ZVRzJZ?=
 =?utf-8?B?ZDdGRENkQ1cwOTJDSzQrSGEyNW50Q0dadWRhekV1VnRSTHdKWk9Td2tMclZD?=
 =?utf-8?B?R1VjdXFHS2tYY3NqS1ZyYnREcXJyQlV0eVFDaGljU0lPa0xoenJQV0p4TDBk?=
 =?utf-8?B?NytVbFQxYnZLTGhIQUhONXNtaWFwNFAveTJjUkFmdVBaaGFkakxId05KeStp?=
 =?utf-8?B?U25pby9zZjNrblZTTE1Da1JRRXlrVG9oVENYelFtdVdNaU45K2N1VlFwejlP?=
 =?utf-8?B?WWZidUtqWTRxRWhKMmEwUUlLVGNpdEtvdWJLajJXaTRuZnNRZTNJU3JmS3V1?=
 =?utf-8?B?MUhZSUpvaUQxbk9sdFhHMHhveG9qeXJTSExmaEkwTHlDSi9jS1UrVTRkWWRj?=
 =?utf-8?B?VjU2L1hCY0ZyeFQ2MFUyWnhFdWw2ZlUvNjJpSWlUaG1yajVsQjFrcCt0NDdX?=
 =?utf-8?B?ZHhaU29WVlVORUlnZWxMQ3ovWngvOXhvWjhNUUtFOGQ0eExhYmF1UWl5TWll?=
 =?utf-8?B?OGFycVMyaElsRWhOeitUUEdKeERZeUhCcnZUKzJlTDBMcHNQcTZtSkI0V2ZH?=
 =?utf-8?B?aDMxc3pEclVsKzV3SGMySGoveGtidVc2d05oRGNTYkJ0bkt3Yk8yRUQrUDg0?=
 =?utf-8?B?ajlvSHVwaUVCMzdmVmlVWmFBTzllZENQZHpyOHUybEhsK0J2Y2QycjVZUkJn?=
 =?utf-8?B?MGxLUDJnZWZLUFg3R3YxUmdvL2JnOVdvTDN0L2J3WUNqVmp2VEJsTVl0Rk8x?=
 =?utf-8?B?dlgxQ3Z5RVBUb29pY2k5NERuaU9nd1F1TDY2VGdnUmpyWTJRM1ltbmhrNlBJ?=
 =?utf-8?B?aVZBajFZNVJzekhId0dwSnJOelB1c3BWSk9WYmRSeG5SeDR4WjFUelN4WTlZ?=
 =?utf-8?B?Wm1oaDE2Q3psRlRYN0FvVHNYd0s2L2tsb1p2Y2lqY1RzWjIxZE9vUlM5c25j?=
 =?utf-8?B?ZmVrbzFpSHlkUlVsOXRhTVRweVZSd2F3VGlQUW8vY1FzMTFyUmZjdEV1RzlB?=
 =?utf-8?B?b0phVVNGOHl5V3VhUGlxVEg5VjUzUm9JMDRuNGhGWnMwaDhnZ2djQnBHU1U3?=
 =?utf-8?B?TVl2TnFmaUJlTkVTK2xQbXJhWUoyM25CVTRxVzFTVTNyOCtrTE1QS0hTbm1Z?=
 =?utf-8?B?NE4rLzN5Z05jNnplaG9xb2VkOFBzbGo1MGsya1lWZmJQcEpNejJrSzg1aERM?=
 =?utf-8?B?R09VL2JsZHpjMUhQQTh3OTZPYlY5dkI1UXNJNlBycERqQVJ6a2RaYlBjMGVL?=
 =?utf-8?B?L0ZielkvRWlScFZUbVkzUXNIYzlETnNLcExrWENVemRBYTg3dDltOGhFTmZw?=
 =?utf-8?B?dUg2UDIxSFVEN1B3cGVhZXVjYTdSZlBhamJhZlNNV0g4Y1BBWE1oUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8272da-a4ec-42c9-2118-08de6b402352
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:40:35.0290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIKvOVddvAnhis7rortl4f22oHdQotAucP4UwGcESPO3V0mQ8IkX8c0Z+Bb9faH77t9w/CSOANgtELcNzOWEaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E967D1397EA
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 04:56:39PM +0100, Roger Pau Monné wrote:
> On Fri, Feb 13, 2026 at 09:56:42AM +0100, Jan Beulich wrote:
> > On 13.02.2026 05:02, Marek Marczykowski-Górecki wrote:
> > > Hi,
> > > 
> > > After fixing the xhci crash, I hit another issue - booting with 236MB
> > > initrd doesn't work, I get:
> > > 
> > >     (XEN) [    3.151856] *** Building a PVH Dom0 ***
> > >     ...
> > >     (XEN) [    3.593940] Unable to allocate memory with order 0!
> > >     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
> > >     (XEN) [    3.599884] 
> > >     (XEN) [    3.602482] ****************************************
> > >     (XEN) [    3.605272] Panic on CPU 0:
> > >     (XEN) [    3.607928] Could not construct d0
> > >     (XEN) [    3.610692] ****************************************
> > >     (XEN) [    3.613463] 
> > >     (XEN) [    3.616035] Reboot in five seconds...
> > >     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
> > > 
> > > Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2899781755762f565
> > > 
> > > If I skip initrd, then it boots just fine (but dom0 is not happy about
> > > that). 164MB initrd failed too, but 13MB started ok.
> > > Just in case, I tried skipping XHCI console, but it didn't change
> > > anything.
> > > 
> > > Host has 16GB of memory, and there is no dom0_mem= parameter. Xen is
> > > started from GRUB, using MB2+EFI.
> > 
> > Hmm, yes, there's an ordering issue: Of course we free initrd space (as used
> > for passing from the boot loader to Xen) only after copying to the designated
> > guest area. Yet dom0_compute_nr_pages(), intentionally, includes the space in
> > its calculation (adding initial_images_nrpages()'s return value). PV Dom0
> > isn't affected because to load huge initrd there, the kernel has to request
> > the initrd to not be mapped into the initial allocation.
> 
> Right, on PV dom0 we do not copy the image to a new set of pages, we
> simply assign the pages where the initrd resides to the domain.  We
> can't populate those pages in the p2m as-is, otherwise we would
> shatter super pages.
> 
> I think the fix below should do it, it's likely the best we can do.
> Can you please give it a try Marek?
> 
> Thanks, Roger.
> ---
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4fc..8e3cb5d0db76 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -343,7 +343,7 @@ unsigned long __init dom0_compute_nr_pages(
>  
>      for_each_node_mask ( node, dom0_nodes )
>          avail += avail_domheap_pages_region(node, 0, 0) +
> -                 initial_images_nrpages(node);
> +                 is_pv_domain(d) ? initial_images_nrpages(node) : 0;
>  
>      /* Reserve memory for further dom0 vcpu-struct allocations... */
>      avail -= (d->max_vcpus - 1UL)

I'm working on a more complex patch, that attempts to account the
memory used by the init images towards the reserved amount that's kept
by Xen.  This should make accounting a bit better, in that we won't
end up reserving the Xen memory plus the memory used by the init
images.

It's still however a WIP, but would you mind giving it a try?

Thanks, Roger.
---
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4fc..3d54af197188 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -325,10 +325,18 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
  * If allocation isn't specified, reserve 1/16th of available memory for
  * things like DMA buffers. This reservation is clamped to a maximum of 128MB.
  */
-static unsigned long __init default_nr_pages(unsigned long avail)
+static unsigned long __init default_nr_pages(unsigned long avail,
+                                             unsigned long init_images)
 {
-    return avail - (pv_shim ? pv_shim_mem(avail)
-                            : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
+    unsigned long rsvd = min(avail / 16, 128UL << (20 - PAGE_SHIFT));
+
+    /*
+     * Account for memory consumed by initial images as if it was part of the
+     * reserved amount.
+     */
+    rsvd -= rsvd <= init_images ? rsvd : init_images;
+
+    return avail - (pv_shim ? pv_shim_mem(avail) : rsvd);
 }
 
 unsigned long __init dom0_compute_nr_pages(
@@ -336,14 +344,28 @@ unsigned long __init dom0_compute_nr_pages(
 {
     nodeid_t node;
     unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
+    unsigned long init_images = 0;
 
     /* The ordering of operands is to work around a clang5 issue. */
     if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
         parse_dom0_mem(CONFIG_DOM0_MEM);
 
     for_each_node_mask ( node, dom0_nodes )
-        avail += avail_domheap_pages_region(node, 0, 0) +
-                 initial_images_nrpages(node);
+    {
+        avail += avail_domheap_pages_region(node, 0, 0);
+        init_images += initial_images_nrpages(node);
+    }
+
+    if ( is_pv_domain(d) )
+    {
+        /*
+         * For PV domains the initrd pages are directly assigned to the
+         * guest, and hence the initrd size counts as free memory that can
+         * be used by the domain.  Set to 0 to prevent further adjustments.
+         */
+        avail += init_images;
+        init_images = 0;
+    }
 
     /* Reserve memory for further dom0 vcpu-struct allocations... */
     avail -= (d->max_vcpus - 1UL)
@@ -367,7 +389,8 @@ unsigned long __init dom0_compute_nr_pages(
     {
         unsigned long cpu_pages;
 
-        nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
+        nr_pages = get_memsize(&dom0_size, avail) ?:
+                   default_nr_pages(avail, init_images);
 
         /*
          * Clamp according to min/max limits and available memory
@@ -385,7 +408,8 @@ unsigned long __init dom0_compute_nr_pages(
             avail -= cpu_pages - iommu_pages;
     }
 
-    nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
+    nr_pages = get_memsize(&dom0_size, avail) ?:
+               default_nr_pages(avail, init_images);
     min_pages = get_memsize(&dom0_min_size, avail);
     max_pages = get_memsize(&dom0_max_size, avail);
 


