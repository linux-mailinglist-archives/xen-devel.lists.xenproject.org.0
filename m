Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00291599652
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390048.627229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwk0-0007P8-Sh; Fri, 19 Aug 2022 07:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390048.627229; Fri, 19 Aug 2022 07:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwk0-0007M6-PA; Fri, 19 Aug 2022 07:48:28 +0000
Received: by outflank-mailman (input) for mailman id 390048;
 Fri, 19 Aug 2022 07:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOwjz-0007M0-GH
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:48:27 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ee63237-1f93-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 09:48:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 07:48:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 07:48:24 +0000
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
X-Inumbo-ID: 4ee63237-1f93-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXBPRWsnhk3UcpL7DqOXNLwGN9kyRkZmIVzxLr7EPeAKsQx5kC9+GlcsqLjDaDQbMKlAzgYlxk5Gbx5ElzG08qOdE/BF7Dyt4Wh+kLZhBOkoBD+DPlcM52sykFnSXlPkCWqTqcgdiTuhNECMJ4bF4BXKg9c8d7gTv8VgEVUpBPq8Vc4XWdiShEV4j2PbeLJDLHDyYb09Y9USMrrfxxRNL2JpTbTbQYNcygQX7Vp/vUJNtOa8wxiYxTFatj0r+QB703wW9Gmim8VwX9c5hSfbAoTbGybtYHdHtRMy9PtiNuafIPHSQfsOblzf8pU0treiOm/U8214JxZEV7JlkdbeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IINQmZD7SAqioJfykJlPHHVBkvs9TlWVDAVi2OGY9ko=;
 b=PC1nzzDdiDh4MqC7+kpMxvZoXc+H6h73myQvBSOzEPSH8AOInAVz4YGvtCYS/ZZ7WgpSQDksW91XPnaQrU+ebfxCTXbvkYaQsthBYkHs+Y8Pw9qQrWnHPgD8OufS5HVZNB2zwHoLHQH+oHHa1XkgS7K/o1g9H3sP7paE6XtYD93vaW+A8kAOjynW0jffIrEnuEWARZWe/DRxztzA+bdmrO+1mUQ2wgngs3UPa9nwOanHd0ZCTEGvvHbD1tTpynHrAcjwxSWD9Ziza4Fn+WCSOn1ZLs9MfS4HnbJ8QxUyWc0LbSC5B5QCwZjkZlggXW/Trj2Ea+o5vWjHFWx07WKL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IINQmZD7SAqioJfykJlPHHVBkvs9TlWVDAVi2OGY9ko=;
 b=pG9AZVabnAcTcBRtx07RzRFNlxwdGfY06rKFPP19T4yZt+c96A3nHEhuDxX+VxyNlRbHXDJZXj73Za8HZvP2mq5d5i+gvdmPha7rqz5Qlm6cdvrWdC/Y+JPvn33vy+JIxag9hJbobfBohbE3bS+kQkXhONt2yekkDRBGQGyApBMW2P5qLNU3GS3goEU9U1vgsUFkfaUiUmfLyaKnc5RfbcN6+auZ9osaUvNypFXLOvi9drCfmYUvweFjRLXL8fp/yTXgurcfOMeibyjPayQBJJbzTrFJxR6aqyciJ6bC0UWk+G4F+MGcnn85ThLhrA0jkNw2Tu2T8ZlixNlfEU3yIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
Date: Fri, 19 Aug 2022 09:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] Arm32: memset() & friends
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa497d8c-a79e-4178-705e-08da81b731e7
X-MS-TrafficTypeDiagnostic: DB9PR04MB8122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tEWWT9ZtHVx1s63wk6XrM6d+NjhY/dN2Z5ywsI9MhrtqgTzns7OSEBpS3a636x3Qg0hColacWKOmSeCFG4Rt113NelwSOJHfEFxVro8l8WiHavUS+XTVTBKr6IqZkqgPWhUHrVsjQ7jwJ7wgG6XCsjDcTbb7Ik+Tb3xklY990q8etOShudO/KY6SDNPXykawBbHKe7v86uDZkW2q8i8Vff5REjwNY+RFwEc04EyfVPEjv4DLh/sSPICW2+Hn8k0fQGyA49Dxzpw18qI55VAHGf0EJEGYZV0jQMLJF5C1p3Nah910FZd4YNuxdlVR184xxDmhXgKDBqXH6CyeGp6hvKIdvqQpNxhoRLq7RRwdHUOnatZtYRfGKk2q9aeJbAkmpFFaIVpABbkriMY/2ZCrfU6zDPTpjYqV6QmwYaVXFFaFE1mGet2xCzz25pUWh1PVxjAKzmt2lrMqjng/YNry2iFBqq3vIzCRM4R9QERq5GReW7g2wWE89oLbI1vVs70TyBL4CZOvcNJIymouXzqx9WGqggh3MKKZrgXsmz1obLMR+CWJ/8dhRDb0XZponuWHWT2tCjxoxZy9Evm2Ky66ERCUGaGJbfqLp/dMomtKV3lMvWQTGEXy91L6v9FBv2LQq5mY+3pb09PfT6NjMTFoM0AOHcHe0m58809CPjltY9uKk8GVVHFcwwsa97nrG34s4RkBEiU1QW0ufVkFnZ0k+2vprxyrSC3ZYPFqJg+h6o+WD9QWzIU9yPbDHaoJuZabJEcA+ggGgYQXq+Fxy+qzlZH4yqNZ7iVzRs+LC70ze/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(366004)(136003)(376002)(5660300002)(38100700002)(54906003)(6916009)(4326008)(186003)(2616005)(316002)(31686004)(36756003)(8936002)(8676002)(66476007)(66556008)(66946007)(478600001)(6486002)(2906002)(6512007)(86362001)(6506007)(31696002)(26005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXZnVHpUczBwRHNrVDZPdHVnaTVKeHc0QlJRVzlndTIxQ2VKR2padlFIdzRE?=
 =?utf-8?B?RUdiRE92WVRYcVpXM2JXY29hbGkvSngyVTBHcy9SNVdFN3ZvYnY5UmxjMnUz?=
 =?utf-8?B?WG80V2xGVkJtc1NReUxWV2NXNHZLNld3ekR1MWhFMDlIdktyaEpZY0pYdE1o?=
 =?utf-8?B?Z2J1UE5GMTY2a09GRytDTXRZY05TZkc5T04wSG9DRjNEdXI4a05WR0FOTGln?=
 =?utf-8?B?UUpEWEY5L3B2dHpjVG1EbjlNMXFoMElSU1pGWnVaTTE2Vi84ZGJJbXJ0eGJr?=
 =?utf-8?B?LzQ2RVo5bGRvN3pkWHhHT2lYUHh5RXZXV0d6TXZ5ZGZWMU9XN0Y4TFBqdTZw?=
 =?utf-8?B?Zis4UWpMZ3JJSnk5c1ZwZDh5WFNEWG50NFAyVEtTajVBMnQwY0c0b0s4ckFC?=
 =?utf-8?B?UnBUVDY5bjRWeVV6TUhHR1ZyaUNNaEVpSm92THhaWTQ2YktrNy9xQ3dpcWl0?=
 =?utf-8?B?dGdVWXBkMU5lZ21JdW1TUDIwOTVkU0JLZHlLNmRjNG5ML2ZQZ0h4d01PTzM5?=
 =?utf-8?B?QVpIS2t5cG9FVUo0Y1NDMk9NeTZnajZVSUVvUFF1b2s4d0IvMFpwMDJMSzRa?=
 =?utf-8?B?aUMrN3R5ZWU0YUx6VHRNTnNleTBvVVNaNjNhM2JHbE56amVPZjhtYlh2cm0w?=
 =?utf-8?B?eDdFWC9wcS9KdDRFaHIxelFiY3RPS29kZk9VRXgvY0tBSU5qeEpMcVN2UURr?=
 =?utf-8?B?cWVibEMxYUR4ay9UVmh3WEFoZUpFNXlzME9pZStGOEFnTG5wUEtZeUNVaWhR?=
 =?utf-8?B?TGxlNDZ6cU1TK1N3WFhBWjB2RDYwcUdOQWxnNDZDaEV6RW16Rm1MdW9ZZFdj?=
 =?utf-8?B?cUtsWEVpVUZsSllIckYwMTlvTTFmNmpPdFVobm9DOCt4WTJmeGxpeGVVMDgw?=
 =?utf-8?B?Z3AzT215TnlRVkt1OHkxb0FScCtkdit4ejF1UFlJUndvSEtldko3Yk1KZm9D?=
 =?utf-8?B?WEFZckhtNXZVT0x1RlZER0NzanUxTDNKa2MxU1hpYWp0dDZRTGZFN3R3MFI0?=
 =?utf-8?B?S2c1SVBJa1UzMEZzR0M4UldtcysyLzdFZHN6Z1paVDA1bmlSM3hUNFZtcFhp?=
 =?utf-8?B?NVYxT3pEUGNhVEtnOXZRM0NlNU91ajFMOXdHRTdoblVhNm4yNkIzZjhEQWtm?=
 =?utf-8?B?VmtvcThEMEFRSE1TeWQ5Q0J3aWJkUTI4bnk4TjZzUUwzQkhFQWFiRmxYNUdx?=
 =?utf-8?B?LzlrUU02eVdPeGRaYWFDM0tzWWw3YUdMWnZ3c1hDck5LdUxiT05HZXN0L0dE?=
 =?utf-8?B?Q0RjMkFkdUdkN2ZNQkNUeGt5YlZraUlNYk9VQVV4NUpXVXFVMTVoMklSZzQ2?=
 =?utf-8?B?NERZKytNQks4QWt4amtlUllsRXdnYWhWMEwrcDdBZG5JSS83Z2hqb2IxSFRr?=
 =?utf-8?B?VTlDSDJ0SlduQzVLUXh3OGdiclRkVEdBalErbVg1Ynp2UUdPVnI3TWtPUEFP?=
 =?utf-8?B?OFM3NnJaTXkxNzV1ZHd1RGFha1QzdGZmU0Q2dkZibW5PUXYrdHFGVi8vN0ZJ?=
 =?utf-8?B?V2w1TmsxdWpPSFNXNXdCaVBFeHcwOVBLc0RHNGliWGRuayt0T2ZKM0hQaFVx?=
 =?utf-8?B?QVpsZkEzdEdRM001dVFGSWpYTXlNMTAybU1QK0tPMTNMSlFiREtZbS9FblRF?=
 =?utf-8?B?WVJ4ZG5aQTd3V1NHczUvMTNPYWcraU51a0luWGJLNkxwcDJ2T1FUS2htajRz?=
 =?utf-8?B?WGFDczlDa2F5NktQb3lxdk1vM2JOZzB4cXVlTXRnSkllOUF0Y1IzMStuejAv?=
 =?utf-8?B?UmNMU0RWdy82QkE0UkNjRExTbUpuRXN6cmFlVFlZdFJhR3I1NFpxZStNcEQy?=
 =?utf-8?B?c1Z6RVgwN0tZSGdWWVBiUmZFcHZxUlUwVDE0SGZRdzFiVmVaSjRMdFNMRlhZ?=
 =?utf-8?B?RHJHNFFOaSs5K3J3Yk9qQ1krNXZsellSbVpSaWczMGFSV05xanJqY3gxQjlO?=
 =?utf-8?B?V3VNTlZ5K0xsbE02V25EU0xhK0hOMU9PZXVmVmRDdzJHU1ZpZGxtc25IRDZq?=
 =?utf-8?B?UEJJelFuN0FudGVFbk43UzhNdm5XcmJVWEJPeG9Ja3hPQTBZK3RGdWRnWDlU?=
 =?utf-8?B?MEE4RjBtL05Bc0lPTGgxbDY3Tzd4UTI3dlppSSsvWDYyZUhBcXM2Rm85VUlG?=
 =?utf-8?Q?ocu6JeLHUmhr6f/3EkgeLnP6o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa497d8c-a79e-4178-705e-08da81b731e7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 07:48:24.3845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6C/yHYTRWp5ZO/oEl7v3fmHUjAr+gaRk45ZCCwve6sz+3OdWNrCEGRKNvDt1j1PMw5JRwpGVDta9iV4o3UsWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122

Note that while the original Linux code has the same issue, I don't
really fancy sending there a patch similar to patch 1. That's because
my XSA-307 related "make find_next_{,zero_}bit() have well defined
behavior" was entirely ignored, so I would expect nothing better here.

1: correct string.h functions for "int" -> "unsigned char" conversion
2: tidy the memset() macro

Really I happened to be looking at the memset() macro, being a little
surprised of the special casing of 0 there. As a result I was curious to
see how much more efficient __memzero() really was compared to memset().
The first thing which actually caught my attention is that part of
__memzero()'s code lives outside of the function (i.e. ahead of
ENTRY()). This saves a branch (and interestingly memset() does _not_ do
the same), but (a) renders the ELF symbol table somewhat wrong and (b)
leaves debug info generated with gas 2.39 not covering the entire
function in the new subprogram DIE that it generates (line number info
and .debug_ranges are correct nevertheless).

Jan

