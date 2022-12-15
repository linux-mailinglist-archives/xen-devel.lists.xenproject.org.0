Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C164DD7E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:13:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463489.721681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5pv6-0000VV-RF; Thu, 15 Dec 2022 15:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463489.721681; Thu, 15 Dec 2022 15:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5pv6-0000Tg-Nc; Thu, 15 Dec 2022 15:13:12 +0000
Received: by outflank-mailman (input) for mailman id 463489;
 Thu, 15 Dec 2022 15:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5pv4-0000TP-VH
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 15:13:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc043b87-7c8a-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 16:13:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7244.eurprd04.prod.outlook.com (2603:10a6:102:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 15:13:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 15:13:08 +0000
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
X-Inumbo-ID: fc043b87-7c8a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAKQ3l3ZcWUdhBgvJsJGfqVjjPKLaGrC53S1GI1fSvj+ynMBdF+IrlJlpgV1f7T9w7oHT7T2y0EYZSTSucmJbrPhN/5jVsieV7gLLvPHmA6Q1nnQV2/7i4lQRU+d4EJoVbtRdEgQrexENes/dUPToLp2IL4eR7g38VyRtICyrpAq9eDiePn5m2kdCATEirGo/Vg0DReaO2e2Kv7e6LTHTK1BybpSAWEFFK5aQ+BohQuhOcRcSfwBSU0i5czRw7UXusKeLYBsEtjUhki0UgKONPVF/qWe/MxgXp6W/MaZxmydEUlPayU4vrivay62M6VjKVKLzilhhipETo2i1+eCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXBDkbfbYpCohXYacU2kjKm4zqPmNAkvFh77TK9mYWo=;
 b=DG4Xm/1FrVbZTZQJwlDmVNoa2lpZQ6nKMcjnRFHlErI3TLY7XydbMBn8l8E57RabLpJIHC44Rmfmf7eVQEUESl+qKZvNZ63n8dmayvpTLPDNfgSRthUgsZcty5itcIIH5qpv4KZXESZuarPd9jY8hnTGLobPdsnifrgRqvli3jHFd0XgNfKfYXWA6j0EBUJip6UDiljHHdrZ/SdWvwX5efHwbIGFq/QGtMrxF/tbYoHGcO8OMNY8yu8MVD48oUne9FBrEd4rIr9/0FUspLspkYNeeCUl2L1ipPkJy/hYy5dvwVt6OHLIR7QMppLbYnPNMlEDldnnVzj6XGn8nPm98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXBDkbfbYpCohXYacU2kjKm4zqPmNAkvFh77TK9mYWo=;
 b=XjVMjHzpsfOe70HPj3a5WkBLYj417lW4pObM9+RPry1BL6Ex3D5feTBqoWi9d1OvgGLJxml5X1D9Pe4PLxiZORXT/BamByw5R7RjXCHBhEcwPHMxXXrJndiVo9Am9DTMPU+yciuysnAgqg2EjnGCXShnI8EcON7CN+I154CR1RuhawrN/4Kj3lvyNJWqWQLLd5IzVpfgG5NMS2RoQmF3iicPzLzurrBAMZXHMm/lttkHhWcpXI7yIbeTiWtS7nhtdyA8HMYoN9UwqOpflhKX2Ey2k9IByZrWv8/etkKOg/qBL+7CpsQgG/bE+v69chslzDudnU1dhEyFfUk8KjBwBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41dd24e1-806a-341a-6e13-1984269e3fe9@suse.com>
Date: Thu, 15 Dec 2022 16:13:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, osstest-admin@xenproject.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a822ed6-e48c-4c4e-14f9-08dadeaedf5a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90yJuwYFGLgsqmCQ6aoEEEXqo7qqINlub4fEF778axIosw+6DLAxn6GEAOcfOoIVH4aN5Ee85D5oLrnbSTLDT7icqAc4d7eP5lLFNWvRZGe1UZ7ksdyzzydzrPb5mTdYQXmS7RQeBlS1WVK+PROUPvJVglWpyP4AI/w0npF4FPgpxWGVfV/XTggviYVc+9Q+OTdsbO2oqdwVRCMd+JsRJEuvWeBERMJV16dg+HlSA2I9eY2+bslJkSgF7kJpoD8RtpULMMAwTvBbey42NGSsqRZmhUH5sBimeSgjVqlZTdByn6WQmhuEt1l4UVk+mZpYCIRPWF9rJNCP+Sri7E823RTcegHmMQVHc88ORNLPPSoB+4hDiYfZFnSZ8hZnFl7Q2eceR1y2FHXjS5DTS5IvkoU7UQWW4UqsDBaXzgBVDhHoBguDpowfSQBCNBf8wk+m23V6q7IHDulHEXs79ZWbHdwPimlqoA2wbynw5MB7531A5DL1JSwplxMfrqJlIzL72ffo5lvGqS0ashMUCBAQQzKrnHfYvF096D54uYjFmkTP6d2XtjENuZtw6TThc/PRcmjoU0+1KA3HKes07Cnk52hlhMWff8j8cfjwOZiKD3Wf8L172F5xXGsVR5LDUlzwo4U/3wDxBB9tqzxTygLTW6mqKdyt9TeW0Uaw5kStlkaekEm8f76dHL6Y3Y1Mvs8uZOsDuH/8Pil6JCyY4wNtWqZzMrJQzo6unFwmDUOGtjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(66946007)(66556008)(66476007)(41300700001)(8676002)(7416002)(5660300002)(4326008)(316002)(2906002)(8936002)(6506007)(110136005)(54906003)(478600001)(6512007)(53546011)(26005)(6486002)(186003)(31696002)(86362001)(2616005)(36756003)(38100700002)(31686004)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L203WkgxbTVzYXJqaTVOcHBMRTF0bzQ0TVVjQmo1TlZPZ0FxR0dPSWZ6YU1B?=
 =?utf-8?B?anhQK2wzQW1sUTl6Z1o5c0dKekpKV2Jadm5JVTB3ejN2V3lqWkNRVU9PbVdT?=
 =?utf-8?B?Z1MwYVg1M2V0RmFnWkZhN2dQM0JIdlJseWo2SXJuM0ROTnlmb0dPRGpSVFpC?=
 =?utf-8?B?ZzZJWGkxYVRaTWNaRUYrSHdPY0Q3Unc5L1NZeTRyZEhiSFZhYVJiY29Va2Fq?=
 =?utf-8?B?ME9pSkNsaEJpNVBuYVlMOGxwVkdFN0Z4RC9pbnhTOHN0cXdicDl6aWNTR1FN?=
 =?utf-8?B?NG05dFVuRjRSOWZRL3lnWUlXTHE2UmtrNzE5ZDZHN0ZEU2hlNkFnMUZjVklK?=
 =?utf-8?B?Q1Q0VWxxaE9TRkR5eUpkOVArTzJLZXVYUWhwYmxxL2Q3MEtQazZtWUNHWUhw?=
 =?utf-8?B?Y0cwelVPUHdIZVFQVnI4aWU2eDVHVlBPNmhQdGZtVmxUN2VEYy9FQXRRdi82?=
 =?utf-8?B?Q1NXQithT2llU3gwZC9WeXVDUHFYL3FWdWhrN1doNGFqVFZiVWJ3UXFKT2hG?=
 =?utf-8?B?dlZUWmZDbjBaR0djSEtMZjNsdUYxMWhDYUd2Y3Q1djZSRCt6ZlFPTnVydVJW?=
 =?utf-8?B?Y2gvWFNmVU91ejFDb0xucDFxYnd2VnN4MDhXUmJrbFhHanVlelFNaE9NNFZs?=
 =?utf-8?B?RmFZWXh0YnB0ZUpTeVoxaytZUnFVUUU3eTNZaVhVdmhvdGw4dnE0Z0c5aVJo?=
 =?utf-8?B?L0pkNmNjSGJKbUFWNDdUd3FRUVZpc1hxRWQ0QzdJSHVicmszNFdadCtwOHNZ?=
 =?utf-8?B?a0NPZ2x6VVp0ZXNUUHBEeTROeXpnbUVBL2ZrK1dVMWpKNkFETUJIYTZ3OW1F?=
 =?utf-8?B?VGtiREI4SENod2xJRWxLakVNRk1objlZaVpFN3V3aUExU3ZveXBBM09uRjRH?=
 =?utf-8?B?NmgyNWVqOGFQN3hPeCtZanhwL2FxcnN6U0g5MVNncmdHQkt4VDJUcDZNU2Jr?=
 =?utf-8?B?OXNmMnE0RzhpMW5nbVhZRzFWdEllNVhEMjVVUnhpMVo2WUtpc2kvYTJlS2py?=
 =?utf-8?B?VEZDVDBxWkZ4LzRlZklxclUzSkhXMDVRSEh3TjkwdjBwQ0cxYTFJc3ZlK0lT?=
 =?utf-8?B?ZjZLR0g3bzRjbHFRRnJGNkhXTmxXVXlOdGpzVGpSMDA4Sm5XNU4zNU9nMXQ1?=
 =?utf-8?B?Mml1V0kzK3MwbU9kZ1NleGFjU0psR0NqRDFvNE5neERwVThRcm1HZTFwR1cr?=
 =?utf-8?B?Y09LWk13M05BcVh6K2Ixb3IxY2V6UHZRZGViZFFFNmpvOTN1WVdCTFQ2UHFn?=
 =?utf-8?B?cmlWeG1QR2VrOUQ2cHhmNit2elJLQ3NydEZ6WlBMQ1d0YzNGV0hIM2wvMGJX?=
 =?utf-8?B?c3JHdHZtQVhTUzQ0WXRkZk9pZjNqS05peWs3eXhTdWsrR2E0SDdyUGwrd1p4?=
 =?utf-8?B?MGgzb1RGOXVDN0tZSXp4b3Vnd3VJK3NIWGVuaUJCV3RKZU92YkoreGFnc2E4?=
 =?utf-8?B?NUs5dlk0c04wc054TGE5MkRJMGNubUdWVTFOZTl5eHc0a0NBcXMzVkV3NDJq?=
 =?utf-8?B?Zkxwb2c0cHlod004ME43d1ZZMWM2SmhDalUrMWoxVzBzbkdyUFVTbTZjcUtW?=
 =?utf-8?B?ZlYrL1M1d3ZoTk1WZk5jWHEyYTFqd25yaG1zeDZJNVJYd2h0akNSQk9SM21h?=
 =?utf-8?B?ZHJoSkNlM0l5bG43Q0Y0NFhyVjBETVJFeVZCZGR4ZUhNRm9vOUpZWEc3OGd0?=
 =?utf-8?B?Qng1cHp1ZzZTTkYwQ0VjbUdQaGhNZzFlOERhWktQUTBJQlZpNWlYUFUxU0FT?=
 =?utf-8?B?RUNEODg1czNQUkpHTlhndzk1bFBZc3Z3TUhxaVZkRk5oSnloQjlrcjBWNmxh?=
 =?utf-8?B?YXhJbytnUHlGVnQvc01YRmtSZU9vb3Y5WVlKem5DYVNmY3E1U2F0QWs0dXhq?=
 =?utf-8?B?S00wTDExajZhVG1Dc1VmZEI5b1BhVFZJRXl4NG5tVit0alI4Rno3dElYaVBo?=
 =?utf-8?B?aUJFZnhVUkJic2p4eitERkF6WDdPbFprdWpPNWYvNE9zcEJyQXROR2tLVmQr?=
 =?utf-8?B?KzlTYUJFakJyYTZNMjkwOUNZKzQ3RThHZnJVUWJ1dnpKZTVNTHppaC9EeFV1?=
 =?utf-8?B?OFdKYWNXWk9qK3k0RnJMaDJ5RERRMUVocHhSRHYycnUrNWxNZXZINlpDalA3?=
 =?utf-8?Q?Y98OJg4eWIrBnGiW/TuJYwP/s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a822ed6-e48c-4c4e-14f9-08dadeaedf5a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:13:08.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVU8qn7LK7Fp06EuczfFdy9bX91xej0ZjiISnvZR0yCjHa+F1W1CZlGDQmO8rdmsTNuGpWWduR84k8DyGG5iuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7244

On 15.12.2022 14:31, Viresh Kumar wrote:
> The field 'base' in 'struct libxl_device_virtio' is defined as uint64,
> while we are printing it with '%lu', which is 32bit only 32-bit
> platforms. And so generates a error like:
> 
>   libxl_internal.h:4388:51: error: format '%lu' expects argument of type 'long
>   unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned
>   int'} [-Werror=format=]
> 
> Fix the same by using PRIx64 instead.
> 
> Now that the base name is available in hexadecimal format, prefix it
> with '0x' as well,

Which might better be done using "%#"PRIx64 ...

Jan

