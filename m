Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E456D4E9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364861.594814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnC5-0002DE-JX; Mon, 11 Jul 2022 06:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364861.594814; Mon, 11 Jul 2022 06:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnC5-0002BD-GP; Mon, 11 Jul 2022 06:46:57 +0000
Received: by outflank-mailman (input) for mailman id 364861;
 Mon, 11 Jul 2022 06:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAnC3-0002B0-Qw
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 06:46:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 402cd03b-00e5-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 08:46:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3061.eurprd04.prod.outlook.com (2603:10a6:6:a::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.25; Mon, 11 Jul 2022 06:46:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 06:46:51 +0000
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
X-Inumbo-ID: 402cd03b-00e5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7I0/o6R5xMTW7Fa/rl/vL9RCQo+c/N3ZSRrgVpejsOT/p4Fpua1FDp417eEjp20lOTZgKA4Tyon2UyXLHl5MX8ClqGypChRC+K+rcDg0Kc6BGOF5qPX4N/oiLUKN318Nitt9PsilqyjBtbK/DFNdtu85IVDUTN8p2cBdqwVsiy0tdHNT3Xi22vC0YOpoFNdFb/nEPSsF+ROWpFbEjlUtmar3KmztytUPd2oLXhIzp4+WCRrhqWmjgRIWkT3kseVjG0XPwUmykWvkP0FPQh5a5Qp0P2XsdRhIIUTxUXzSxS7EfRAQk1SyIgw54YSMUeubnYM8+hCichuysOOZgMJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jpcu0rXtpvp6BX6xAVV6XQXy3vZUyclFj0M5ksrkFoc=;
 b=BXZDHVFOaYQf+AD3AVfdDhjAbyhoFIBJu8pmuAFx+eY9b6rRPcLRBunjAaGxyLYB9nPWFQ2QOOu0zX3SgdXqsXd2akD5OzZW0DalsCk5GqiRup2Kq1ajsz9s5wUYqhZDAEYye8vkKKBxjywGK2xfi2hb9yq4E6xi2SLha6XRri0ODXfTEjhgmLbrLlk8QyMwz9qI1m+w2cwWKWKwgR/SKcKfeQHqgMKZmWuPuXk9jgJkT00JO0i/z16bbfGZHzZLvKodfm/9SFbwW1iFR2Dkfq8SkYCEgtZBPEmxZV1hjA9mEHnxodZj4LAQka0cVkwhOnMQAlxaVHGiXEZmDSCGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jpcu0rXtpvp6BX6xAVV6XQXy3vZUyclFj0M5ksrkFoc=;
 b=wURdPB6wXCFMYUv/GTUsRmTeO2LB89zpdiTNfiTsEXiaMCqe5tE4wynfLyIRG54N0NXRTaU/dR6zxKo3m92h8qOR9VvqlSpBO3UXvtP+VUsdAkVdStM3GKi9WSpt66JXmP9uVLdAfpwSReaXnKARptxncOhNsoUn6LUf2TYEwBq05mkJW7HmQzz7lITqOZe/ZrNEKocwF6VHBBRHawODEoPOk3a9z0tDhBZ6S4jaDwlHakiEYdJDBo51F/n8IT2c0Q6kmpk4TWagNWfLXhM2Le/WuFJ6fgKvemvdX5DPM63eq+zjEMChn4350ABFlxTeQGmSFzVSDZcMSNi9jmR/ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd9da172-3671-a721-dc85-954a5a38dfea@suse.com>
Date: Mon, 11 Jul 2022 08:46:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] x86/spec-ctrl: Honour spec-ctrl=0 for unpriv-mmio
 sub-option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
 <20220708161934.10095-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708161934.10095-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2088236e-1ef0-46af-0884-08da630922df
X-MS-TrafficTypeDiagnostic: DB6PR04MB3061:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ukjbWn/5hYK0b8oCFPgL5mi6DCSp1jYtVurFVGVCmoHcEtYdTck+j96w7JdWPfGwtAmzCBwsjnq06RB5S1RtQFDYkKIEgcNsQP9HvOdSCQaHet7yVjgqMxctTXP+gcqQWqpOozCyuf1aTn1+C0Pck/ouoeNPPM9OVVyqu7GeI21yLac5soAuUbwumEULf6adnu61O0yd5HrHsS0qG8GfNxnO5ay7QqYLVW8+4CGI4dgqA/lOSWW+5VWvwZsRy9u/64DcmHug/uqOnDjdZzUKvwjC6SVtruzyjfjPkGcxHyDSZZDOPXmMusmtgu+wMkU/+yEdVl/awBLbohZnEdU7QakcK5UEg5i1aIwZ8oBlUHEgGIB5apcrvZNj9A7UNbDqWGzNWXCOxcl9rMPZQx+YQCOxGDk3utYfFsC5l2FbwByqjiUagvjwn1yJTKDomzUrGLvM+ydoL8Fg/kSh7sEyUFMg3JSE6X7rzMBTaU7U8xJHMoVGs7L6GPv3E6O3UjhWK8lktSBRXAl9NZO2CjK3c27jAXUTJeAl6BiBsm/nBLybtU0KkH4IfUOm3AsuHH3ebfRdhjgDU4Clo38wm9SykGpvstLeOO04wAJ02WtHrqUYQxNvM63zhGdpbHL701yLym8MAP1GvMubWpHNL1nzmmdw5JTSQ748AHP21rk8QFSYorAMyhP3zXpsYi0SUcqOWh/qwaZrc55MwetBuj2AMggboyi4RDVll7a9Pj2HY2ZU4BSfKU5reiQBp51rlMJikUkV84hU1BFMG/YzQGygPO/p7jLYwddt9Fsk+T5gxCo40NHjwWXJbF5O+DYcVnXS8P6EdCtyyasxHzMRrYVIOhwLjyJ3pRBrIUGYjXYCBso=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39850400004)(396003)(376002)(136003)(186003)(478600001)(31696002)(53546011)(41300700001)(6506007)(66946007)(26005)(6512007)(2616005)(38100700002)(4744005)(31686004)(2906002)(5660300002)(8936002)(36756003)(316002)(8676002)(66476007)(66556008)(6916009)(86362001)(4326008)(6486002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEVySVFRMU9CaXJwaUM0UGRHQk9wRTZOVDJ6am9rcVk4MWljdEZ3UE51WWk3?=
 =?utf-8?B?RUdwNHhZWEZtU0VNY2tRRDJXOTYzT2VGRCtpclVKR1BxMFJYYkk5VU1sTVE0?=
 =?utf-8?B?U0xvUUJ1RmhtVnVScDdOeWJTQk9jenFlc2JXQnJDRkg1MkdlalJ5VnBqakQ3?=
 =?utf-8?B?UzBia3gxN0w1cmRFZHlRTGs3eTFnWjZkaS9IUlR4UDdVT29OZTNJWkRPSm16?=
 =?utf-8?B?NGlxVTVMNnVRaTdFN1A2ZFJJdGozRGZ0Z2o5T2VWcHI1dVpUOUlGaWpCSFll?=
 =?utf-8?B?c002VDhGZ3lVMERFVG5JM1dEY0lqTVZsOEtCM1lnZmJpRjVzQlhPditFbU12?=
 =?utf-8?B?OGFpTE10ODYvUlJRVFZ0NWlnNHpuRE10TExYblZva0o0RzBmQUVnNy9iOFl1?=
 =?utf-8?B?Mk1jRHBnRmZyMDlIekhPNXZaeGs1UkxtSGJvMS9OT2MrUGNjWnJjeXAzUkhR?=
 =?utf-8?B?ZkxvaXBNZ3NieERLZlF3SmRsWE0vYzlyaHg2QmxjMlZ3NlBMaE8xcXo0K05i?=
 =?utf-8?B?SDU0enJkYWRUNjBleW11NDB0UGZGODVPc2wzOGpaMFVzM08xdCtWUFduYTRx?=
 =?utf-8?B?S044T0tMaHJMNmNxaGpiOFRjLzVxVjFBbVFaOVdsdFoxNW9aUXF4K3dFWUZN?=
 =?utf-8?B?bjM0STN6N2E2Q2t2cmZRZjVwUzBoUjJPNEtVd243eVczNDZzRkh0WExnWkkz?=
 =?utf-8?B?UmxZQWhDVUdHSUpSaWdhWUljdHJFSngzV3hMeXl1cmhrNjBuK3hzZHlwdm9x?=
 =?utf-8?B?SjJGMnZzSXBrNCtGSE5xenhsd3ZDc1hBa0NuZjlWbDJJY2M5cTNjdVFCZWN2?=
 =?utf-8?B?L0srSVUyME1lUXptNWFyKzVKU0NCMWlrNkRPMU5lZ1h0ZUhnQkRsZkdESzkr?=
 =?utf-8?B?Ym9ZMnpVV0JtQUppWXB5bjY0WGVNRnZucXdOcUpHbU1MRzlaL1VnamFsbEYv?=
 =?utf-8?B?WWFaR2tKZXpLMVhCendNVTQ1R1cvaHloMSs0MkVQWVhkdmV3VzNsb3RrQkZu?=
 =?utf-8?B?TER2SmJGeFljNXI2bFV6Q2ZhNE55WXlpYlREVWlta2I1L3duRkg0T3Fkd1RF?=
 =?utf-8?B?WG1ndi9iSjJrZFBqUlhHYy9zWkpyZVJYaEJ3TTlKelh6OHJMbzdDL1MvNW1w?=
 =?utf-8?B?Y0piYVdpOE9OamRqOGNHQmdyc3ZjbFVHZlF6TmhxbVdjbzFTdndjVmJPTDY2?=
 =?utf-8?B?cUhtejFTaWVyZzlmcDdIU3RIdzFaL1ZCbmEwdDdPdlk0eERSbUlKTW5hOWVw?=
 =?utf-8?B?RkI1YVJya21qQnE1Z2FBUjlKYy9MZ2RrUEJZb2s3MDNISU82OGF4WnVtWHJZ?=
 =?utf-8?B?YnU2SUdtWWEvZ3NqdXVGa2ZCSkg1bHY2SE5MWjlHcThkZGorYmI0VmhKS09N?=
 =?utf-8?B?cXF3bzVpalBOSW5qMGJVWEtlUU41SkNITzZZUVFSc2pHVFlTK0hJaWFkdGR4?=
 =?utf-8?B?MXFzTlBSVWs5NUJ0OTdlTFJhSmhzRVBaWjRYdHlEa3lrR2JmL1FwL0FEM3VR?=
 =?utf-8?B?MXhHYWo2UzZTTVpFeTRXc0tZT2l5OVZNM0V5d1UzYlhCeVRrdlpGQnp2MDJx?=
 =?utf-8?B?Z202UWRXemFOa1o4YkY3eXpoMzZualZRL0xWQnZiakJZVmhiYTFnRVQwem5V?=
 =?utf-8?B?NDNlYUcrU1ZsMmxTY2hLVXhKenNDcnlQcUZ4TGJMaWo3TEEva3FkZFU1YkZo?=
 =?utf-8?B?RnpyRHRpcW9qdHNvN2ZzQ2NsVTA2NnMrdFJzRWZWdUwzR0FkRnhIV3U1R2gr?=
 =?utf-8?B?b0crUHVIM3RxWnVFYm1RbnFKQXlRNVRsUTBNTXRMcmhVMlQ4OU1GbUJqYlBH?=
 =?utf-8?B?SmdCdExIMHZuR01DZXpNZklwNHJzaWMzYllaTWs2RFBqZSs4VmJHaitYZ0Yv?=
 =?utf-8?B?YnNsUUI5empJMlJqenUxekZEdE9nR1VEODRRd015cEVsM21XWjJNUnV0UDQ1?=
 =?utf-8?B?MEtJdHB1Q3pNeS9vMEo5NE9iRm9hZVFnU0FpcEZJQ01mdzIrTWt1Q0ROWDU5?=
 =?utf-8?B?bGhQb2Vxb3NCS21kc21uQzRrN0YyTFhRWThaTGVRYUZ0cFFrWEVCK0NCUERp?=
 =?utf-8?B?dS9tRXRIaXFmYjJGZWM1Y0VXenVmVXUxSUYvaTg5WjNzLytqMUlzYUxPM2x4?=
 =?utf-8?Q?h62l2uaajo5QVCEhWs62WtV+4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2088236e-1ef0-46af-0884-08da630922df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 06:46:51.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLFgpuCmqKRLMagidxKsqd6pLQELVr9Fkdnvu03xFbN1V2btNNjshOyLgNZ+OxZ5M9aQhGTcqgJmTIzZoklpUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3061

On 08.07.2022 18:19, Andrew Cooper wrote:
> This was an oversight from when unpriv-mmio was introduced.
> 
> Fixes: 8c24b70fedcb ("x86/spec-ctrl: Add spec-ctrl=unpriv-mmio")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm not entirely certain in how far it wouldn't be useful to mention
that "spec-ctrl=no-xen" is similarly corrected by this change.

Jan

