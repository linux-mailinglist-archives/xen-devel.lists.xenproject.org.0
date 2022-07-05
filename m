Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B2567239
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361408.590910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kFJ-0008Ei-KH; Tue, 05 Jul 2022 15:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361408.590910; Tue, 05 Jul 2022 15:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kFJ-0008BR-HS; Tue, 05 Jul 2022 15:13:49 +0000
Received: by outflank-mailman (input) for mailman id 361408;
 Tue, 05 Jul 2022 15:13:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8kFI-0008BL-4b
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:13:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130089.outbound.protection.outlook.com [40.107.13.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 110437b8-fc75-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 17:13:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4145.eurprd04.prod.outlook.com (2603:10a6:208:57::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 15:13:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:13:43 +0000
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
X-Inumbo-ID: 110437b8-fc75-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIK2Ub9jErLO63a5VKz+lVERtQ0GD/zSX4fMUz0JGU9zGfTppLa3eHsGmSK02t8Vj8f0qC1Lokj3NMc3320d8T/3GblkyF4xR3E8EnP7/veYHfJz2OBvL4g6EempWC2iY6bCBx2sJbWRx9Uz1BeHbNUhJc4SBghyXWebmQNf1mbxnInIrHFlxDJ7/mqAxg/VXQkjt52PBgbSevl+31na5Nql8WfieVNiFPMT1cBPBj/v8E3LRGENE8KP4vflhemgCi/n91ZM20Jd1ZkZXWv4Zu1e/K6/LC2v0exxj4GUHBERzJNSOIfTGMummDFvKUaJW9X8gueZtTNZr0sT8XUznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBT/cGpCiJBEjCK8Jt/7h3bw8PB3+nQ5GhQuxfrLH/M=;
 b=NNXiWznXTo5eZw70HVewkMZ8vvVM7O1L2XhjO0d88sU9jX4GpfnheutDeU1+FVUO1KvVnmw4Xt1W00SfbdmMAft0WzyrHYZ3kCFM53joMakO8utjw79hW2OeUcoIND2ne0yYegM+mQAYN84H+JvpLvIOwfk1MHr9FZ1x4P+p1+y6hxiM/LRKeFOAcAyuh4HUzkxZm+f+3XWc6G5XMs4QTTz2+i5ofli1fD1s8ELvVjaiOl5ycplYl3v9gQ5C8VullyIZjF8jDpSJdCzTbEdlw3u5+HOC+OZ1sYzO4H8yKa7rkrVXHQfctxiBbWGUQCT3BOoFIDPdddS1O9x8ivt5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBT/cGpCiJBEjCK8Jt/7h3bw8PB3+nQ5GhQuxfrLH/M=;
 b=k+nhFCd5gS9T+qEqvNM4hzXFG2R5suscFbAP6GPQO9O1QQ0EVGs413MDm4QR/5jHP7jrjM7jpIxZFiglO3N1JZzIUPyvugFBySraD87T8lqZE+F9O/cSLT17A6Er9xTpgNpNZ4om6GbB+U0U+k0DQqlaarH38zLW8AZrRze1waj3KG4tvnyN6zpC7N/X4/3t/K3xn1tcXg20jM3enZnnYKB9eJGBB2zYoOo4pypI1LKppnsVlrsvsvQ4M6N146YzkiwWlIrA3t0IK0hbQCJitfQG5AIqu1bj479ow/WPLh7eQ/vIGE+8WZ3RkGpZvvGdwxFBAreSPCkvEUqg2+kPgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddbf8e3e-d2f4-a7a9-f858-2ca4e5c056be@suse.com>
Date: Tue, 5 Jul 2022 17:13:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/8] xen/evtchn: modify evtchn_bind_interdomain to pass
 domain as argument
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <037b30aa5186cff516f8acf17a3a465663a8194a.1655903088.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <037b30aa5186cff516f8acf17a3a465663a8194a.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0039.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88694983-3591-473f-a8db-08da5e98f316
X-MS-TrafficTypeDiagnostic: AM0PR04MB4145:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xr6QdVBHj7IqjiTeMzBNp48nkzUi9PHtygXYbsTjBH4EvJ7wjCt2J4O5jf/Bpu1pbVW5IQx+zQyi7PolWKNIF5M1tP01bs5IiWY1pxEJR1M3dQ0DYlW+HjTImkyBXSm25Gbl2WTHbcqxQKE31eiM8rw3X5oaOGOVzdbAVqQEhm4I4u1aN2QWFmspmlZ3gU7aOgOUSEFvchHLv5PfPItgi9mHo59/cbBGd5FFGqUgYYuMEukNjVU+8ZDK7Y+ecOFfBcD5Icjsaaz32DoRN4L9oFVmJRsAPoZDecLzNFBpgOMdJ8SFMLYxwvayw5KdD4jdVyubOGlYQeZMNGZTTwNrzY9b6hWo0NbMtY/qjF+/jmc8zMMReKbhr6mBRQqk2mApuRGJLiOsZhbTAf8n0zOSlTHYtc20XUvBAvGVKbZLnxBNhRbbPWF8/pbLXa4EDW+DqS7XrrGqHK9vOzhxfGKRzTyiaHdDkfU2nS/NfP2xqWtybQBM1YKX2dYQ9Qa3CunpsFgUQfV/kGK65VUeGXmxF2x4qtBz0aRmfoBEc+y2JpBNQtHS2YK3BzRrPJvUL+Ge4PJtujSJBO4Y00mwHPBJbgVm8SgC8lD+ysnELQJ1kRD0KaDbX8haZHgvaeHeWfIwKcGTVHphBY93dv5xGSw3iLDm5m9aIvDi0l8INz76CobAyeYVWKgDdrZ0XG5Y4sfZ1aphibQeKR8nHBsnakubdSBVb80TlQjTohqIF1Gd+8Bm6QV+pEqru0ByuiSDzhlVEWGbQCA/cgvWF/S9egl6xQddjbgJY7nj8bSEUOIKSQ6LKv+F6cM8W8lj2nXDy2pEeviSADbP7OkONBgJuSn/dwQyuQxRiG21R/xrHrAuVu8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(366004)(39860400002)(136003)(186003)(86362001)(31696002)(38100700002)(41300700001)(53546011)(6506007)(316002)(66946007)(26005)(4744005)(478600001)(6486002)(54906003)(2906002)(66476007)(8676002)(2616005)(4326008)(36756003)(5660300002)(6512007)(6916009)(31686004)(66556008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVkvakdSS2p3Z0tXVnpIR291ZkFDcmkzRmFyWUl5dEhlYlM4clYzNUZRNzFS?=
 =?utf-8?B?cDFyaG9XOVR0aVIzNkVpb05FbWJMcmM1MjRWWm40c2twOGhyaEg4RUpON0dG?=
 =?utf-8?B?OGwzYzkwMVJHTkJ6SnNSVjh6ZWJVcXMvZmhxSjFQR1cwUEt1N0cyQ2tKU0FM?=
 =?utf-8?B?a0RhajQrVlNKT0xVZTQxVkxQbEpXWWs5U1ozMWlYK3d0TmlaWjNCVEFRUHlk?=
 =?utf-8?B?alJhSVlUMUhNbnMxSzNlbC9PcU9yQ1NoNm8rLzMrbTNYdExKVFJHNHdRZXVt?=
 =?utf-8?B?TFRMdmVtWVJmR3YvTHVIdTVzZlZMOWpyMDJXRmhjbkt4T21PRUkzanlla2Zj?=
 =?utf-8?B?a3FhUURvb3pEK3pUeWxDWk9wcmtacUNTUjl3MWY0Q2llRVF1TTZCd0NwdnVM?=
 =?utf-8?B?S2ZSYmxLRllQMk9mUzVKZi84TkNKM0g3R01ZbDJzbTVCVzB2RytwTTdzT3dh?=
 =?utf-8?B?Njh3Q29pUzZ4amhRaHpQVVkvY2hyMEoyMDdoVzZTaFZwRGVjR090UlZueFZH?=
 =?utf-8?B?OVVvWFEyeTlKWTIzUmd6L0lNV0pTQS9MUHM3ZW95SDA1L1N5NkZRWCs5T0xQ?=
 =?utf-8?B?S09qUTB5L0liNHM5aDc1aXR6TTJZcXhDVy9VSWhNT0paUjVJa1FCYmU4c3Zv?=
 =?utf-8?B?NGhRbXJhK0pvY2k2Z1hQbEsxZzZTVENQYVBKY1hrOGR1QktUbXNBbXlvbkNo?=
 =?utf-8?B?cy9VTjJJM0xGeVdIK1djUWQ5VXA4UGlncDZWbnd1RTdHWG93WWl1UjVZUnd0?=
 =?utf-8?B?UHA4TTNjRDFXNXFNT0R4Y3dDYzVER1ppOXJvalprVGpXQUF1S1Qxc1RoSlB4?=
 =?utf-8?B?S3hOZ0c2R0Iwd0lRTTVpU0pTb0xFSUtRVVkzNURSZGhISDBoZlZMMm9PQ1hp?=
 =?utf-8?B?dk1FbVo0UVc0TDRxcVdaemRibHBJRlB0bUJuT2lqRm1IcXhtOGNQRSs2ZzFK?=
 =?utf-8?B?RnY3L0t2bDRjRjlvK3hSN0VlaDNhQzBWN2ZlWDZLaTRkeUpXMXhEblJTM2RZ?=
 =?utf-8?B?RjhhRmQrTXA1eW9JRXRLMlhUWWlMSmlqdlI3QlhSNHZRRE5tL0dmRS9qUFNj?=
 =?utf-8?B?eFlHRVNFSEkvMmRNdlZSR293T2syaGF4NVVzczBzYVZxVUhvS1A5RFMvTEJl?=
 =?utf-8?B?NEt4WTlLaVhaMFo5ejk4SXhZZkdodmJRaU5PNU5rWVZ3QnBYTDVsRDRhS0po?=
 =?utf-8?B?STdWTUdnWW1ZY0dVUEJaMktUZjBXOFl5QnRzNG1TNzg3aUppWEg0RFlmQk5i?=
 =?utf-8?B?dlFVMEJNanVFV1h3YzlBaU1uN2JGa2l1ZGgxNXpralcwanFpcWUvbGtLS0Fn?=
 =?utf-8?B?NUlSUmFEM1V2TEhiMXJScFlGRTFsUmVmUUhVZDdIb3BIaDZrS1d5RkpvdnEz?=
 =?utf-8?B?ZmY2WjJXWXFHL2hwSEdiUmdraloyWVdZNTUydEtFWWJ5cU9zWk5nQjQ0NTZx?=
 =?utf-8?B?bTZ0Ykp0Vm9qTTU4d0pHUm1GdWJ2V3JaYUFsYVlkcFNKMnF2dGFqaFVvdWJm?=
 =?utf-8?B?OGdlT0U0V2JlK042ekZHKzNNVjJrOVlDTWNOaGVuNCtFRk1RRG5sTkoyRDdI?=
 =?utf-8?B?S3poZ2o0Z084RVhxOHdDT01YTkd0SUJFM2l5d2xQNmMzSkxLbS9kWjNDSmZh?=
 =?utf-8?B?dnpGbDZIUHAyN1EyQVpTT3p6aTJXNTIyQ2pma3BpR05KQzVaRTVFVC9qcTJk?=
 =?utf-8?B?RDlUVUJpYWZjdWZTd1ZBdkdYYnQ1bEtEWjBVYVJ0VTllY0lHaEs4NmVpb2Z4?=
 =?utf-8?B?aEJCTkZ0WnpteHhsbFJQMkZETG5jNHhGUkZ5Uzd0dVpHQXZMa2h6YVVqSVNF?=
 =?utf-8?B?Q1VYcWtzdHJ4SHZidTNKc1doWklyYVMva3VnWFRqdEpXd1l2ZDNyc3UzUFNm?=
 =?utf-8?B?UFVES1VGMGczT1Z4ekVUMng3QU1qejlVSEpsT0psdWhZVjlvZXE1UVVrRDFR?=
 =?utf-8?B?UnpnUlU3K09uZTI1eTFBcU1kbTNRYkpNRWVOaHk4SGRNMlc3b2lUYVJ3SEUz?=
 =?utf-8?B?MENudUFHSGhabTVFL1Q2MGhRS0Q2djBVMkJFT0RQQncvQW42MzhWaXFIL0lV?=
 =?utf-8?B?UzJtKzZjazNFWnNOUHN2bHI1OGJ3b0JYQ21sN1ROWVp4Z1Yya3ZreXo2ZEpP?=
 =?utf-8?Q?RJwg3yZwa/pWjpamhyN/vP/6D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88694983-3591-473f-a8db-08da5e98f316
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:13:43.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmuFZ722ARtn4ERLj1HAz4mkml2Br8M8A7K86ipXCDpE0aA9Ze/dQk87SOC1d8QJs+8n2eZDRuSInngi2/PAzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4145

On 22.06.2022 16:38, Rahul Singh wrote:
> evtchn_bind_interdomain() finds the local domain from "current->domain"
> pointer.
> 
> evtchn_bind_interdomain() will be called from the XEN to support static
> event channel during domain creation. "current" pointer is not valid at
> that time, therefore modify the evtchn_bind_interdomain() to pass
> domain as an argument.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

I think this wants folding with the previous patch.

Jan

