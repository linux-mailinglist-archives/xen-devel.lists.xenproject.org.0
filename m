Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1D56407E3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 14:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451983.709785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16Kh-0000Qu-Mn; Fri, 02 Dec 2022 13:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451983.709785; Fri, 02 Dec 2022 13:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16Kh-0000OE-J7; Fri, 02 Dec 2022 13:44:03 +0000
Received: by outflank-mailman (input) for mailman id 451983;
 Fri, 02 Dec 2022 13:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p16Kf-0000O8-TZ
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 13:44:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 602d4def-7247-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 14:44:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 13:43:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 13:43:58 +0000
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
X-Inumbo-ID: 602d4def-7247-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+amODliqpvLHlpiA0M0Ts6yipD5mXPqGT0YPzbfpM0KJldMU2FA/Kz4wn8geTM1B4sAJC33rLBeA5BMenNcMSXb2mHfPczlRUUSIQBO4mYOhP9wXe0YDK5ZedPcS/Y7ZEYp/z2aWeV2PSMNxNNBV/3QVNZHRRCnCSRaEQm7Hx6Mm2IN5re1Fvpnj51CpOJcbrrwAheAxBgyyp4cyOgsU/qpP27lTv1Z728c0a7OwrgQSveW+HewumG/IhM8DNLcqSXj3UHUB4xGVQPzC/SMt1G5hKoed0pTH99LTSP5ucQDJrpgs9pAFeKfhMw4IyjoogjtZOIRmcbW+/oQVwMYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydpkwNE/PnKwc6t3EGScDF3xmChMLdvX3xDJajYe48E=;
 b=aqy4RU95c10uM5stQygTLM2H+w10nKBZIa+JrM9p7d+G0nRl4DTAgDE1LMaSuvPGmxACEva+UdRh4bbEfto/fseWh44S9FsqXrkA5qxClMpqQNHEOiE4koi2MM9mCyRCtYmTx0m3go8XFOXN3tmAUgHDdJ7Lg2bjEYn5/nIeoNf0KBO2oo91GtvD5boHrWsZkhktdy2sZ0Cr0heWg8KXCzzKUh4Qu2P9+F0dTOAigPOY47j3KKvt9I9/Rk199JQcyA4SuQMYi/GoWkwR8RGc5Ng0dtRz5P+IXWcXgkc3b4luhI6ahTqTlg335GTBMpT9k8M/IWpKkOJDa5BUD8BQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydpkwNE/PnKwc6t3EGScDF3xmChMLdvX3xDJajYe48E=;
 b=F11LolewJeAD0x0GwydkBkYE2Xqc08UqpVoO0gAhc6mGgs13y/U60SFtJR9RlJKbfvZMmODTqWSC6rWJcNzYDznaF/Wwb6FPX/sjwyl46iZ2g+r72/eA3Y/7TofQlGqLyMl4FLxwSxNWio47foihgmlK9rIKmdWAKu+gCKeLhQ+r6xQSBoyAgubRghatdcCWVrbhEFjXiwD1zbUGwoDpatggWZo6iIUXsED8KLGzdq2fGwN4TtLGu0Em7BJ9sxXmIDRwUomaNW49X4TgFUXvWs2iuyiSyd8FfR8eQQi+UfSv9/W5Oem7lZwu5XqHIXSHwInM48PjOp02oWrliWDxzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19777ed9-c73d-7098-e660-d8babacbcacc@suse.com>
Date: Fri, 2 Dec 2022 14:43:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v3] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used as a
 rhs operand of shift operator
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 bobbyeshleman@gmail.com, alistair.francis@wdc.com, connojdavis@gmail.com,
 wl@xen.org, xen-devel@lists.xenproject.org
References: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 782731c1-ede6-433d-d566-08dad46b4380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lg5hNl+ImPn3MK5Ir2SXU0QSeLXZVSwdsMCXCAB9Op0r2uSjuXO2GTkJb25AUb7/bd/su47ayVIyMyiZ92N2Y0Kot+bqDUkzOBqZvQgza0YYacWziPFqXKC7OfLFCrGwtpSDQUxxUKPHyVpzAQxwPTGCmRiQ8StLCdTTSXXE1bvam/EjMpvvmC8LBXvLlDOQwZaSxrYEeT3ZVjyP90RjyjVWo562M7htOsUGUqgOHLhxpucD4oGaQCJ8EpH5fKIqnW5D+MJK0mv+2pOd49yq70Gwspy8Dy0/pjbpftAUmBopmzuGKtl2WvwJu5FzFCSL/C/d9BZaPWMmKsHyZJJ1joME/dyIvgI0jwbmN+FZR8mYZGRYtKppTY1en4XVmxJgtTJ7hoZ9moXZ/IyjHYneBMZYdFmIBj3QNBo5lytwzEwVK6TcvNtByGq76D8IF+e1B0J59pV+b/Dqazdfo/qPx7y0jH8X5e520IB5G88CTc19Tgz+jUzZnsdGoyyoe2fz6GDFpcJvOZz1dRo4bTBzrin+M5iOThaxUaijxaOt/iknGbH+aU8sItk+QkPJzUBuCIlufUS3Q7ZK+Yxv4kprnkyi322twoglZG1sUpeKlgnmTqbsEPpWG9nRVipMQxBVVB9aRftBYEwCDp7UAREczC3WkjsUD+qMJNGYbreRAfCU8kdRJEK5FnARjY+eqQ/jZCFQmVpHDJ1J6Uyxv/HWBZuPFLn4hreKu2x8A6pUV1A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199015)(53546011)(6506007)(6486002)(26005)(6512007)(186003)(316002)(478600001)(6916009)(4326008)(8676002)(66476007)(66556008)(31686004)(66946007)(2616005)(41300700001)(5660300002)(4744005)(8936002)(7416002)(2906002)(83380400001)(36756003)(86362001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVBKUzBTWEdDUzNhdVZlTE0vZGR6MGY3RXMvSkpyTEpYck43SDlGZTNPZHlx?=
 =?utf-8?B?Y0VYbGlDSzA4VHNXT1N5VVk0eHRhenpXSEcxc2l4NldEdHFGaE5iTUx5UEpT?=
 =?utf-8?B?SzRnVXRoSUEyQnJaTnNSaWU3bHVIZWhyYzNiNFhjeEFKSjRGSXJxQTZYZ1pL?=
 =?utf-8?B?dERZM0RkY2xZaWNkMjhwQm1MMjhDZmhZVW5LRXgvRmxBdW80UDh0RlQveHcx?=
 =?utf-8?B?RTV1UjdhcDgwSHFoSXZhc1VqVUh5QjhNMFFHdGJPVGlaTFlUODFaOHhnd3pJ?=
 =?utf-8?B?S00xSG40VzNxQVFyTGR4dnFaaUpCUHJPNzh5RE1uc0hJcnFmSDhhdWppNlRO?=
 =?utf-8?B?WVBHbFBTU1M0bjA5U1Z1MXM5UEd6cGJjLzlRNTc3VU1kNzJaaG5EZlI3WXRn?=
 =?utf-8?B?aGE2MkYrOW9Ed1k0NTFKQ2NhRWRHQzA2ajZDRldEbmFSQnpIWnczMVVFWFM2?=
 =?utf-8?B?RDYrSlJRc1liNmFoS2lEbzlnREVjczhnYjJPall3eUJpWHoxczU1Z1J2Uk5J?=
 =?utf-8?B?NTk2OWtqYnB1bW5EbzVrbEx4eElVMXhUbGRwanl1T28vdmozR3NOaHNpejJh?=
 =?utf-8?B?TUt2TmpNMGp2L0czS3I4QWlpNGdJL3dCQmRsOCtQRS9ycS9WWHFrOUJSUGdM?=
 =?utf-8?B?R3dkTlR2NWJqOTlyVGhudVcyb2ZVTkxDR2dmYkFmeGY1UG5lU0F6OW5SSzZR?=
 =?utf-8?B?QlBrQmI5M1FaK25qQkExaU9CUHcweTBqUlBwSzdlTW50eCsyZTczbHhEMUlu?=
 =?utf-8?B?NU94MDJDb3ZjY0kzTitFQWE2SFFBdWk5NDFRWTBpa1FreURvYkk4UVJsSHcr?=
 =?utf-8?B?VGk5VldvSm1LeitycGo3R2c5ckIreHE5Yld0cUxpS1R5VHVpUGtOK0hqNkZt?=
 =?utf-8?B?ZGRiOEhPSFo1S2NVY2NTSSs0REJBOGd2a3ZlMjc5VFdQQ0RxdWd1Qm1MUlJV?=
 =?utf-8?B?K1FNcnc5WlhrYmVob2JrSktyenY1RjlZN2pQaVZaWFVIMVhxM0VZdmpHQ2tZ?=
 =?utf-8?B?bUI5TkxKMnhLeGdZZ0hkM3ptM1VMVXZEeWJpU24rcWEzZFhQU2hEN2R4S3VS?=
 =?utf-8?B?SWVGQlR4Z1hrMyt2N0g1dlJOaVpOTTlWM3pZVVdYSHJvR2JMOFFaL085STMv?=
 =?utf-8?B?elF0OXhEOEh2TEJDMllYa0Y5NlVvV2MxUEVOd3dKRjhZNU1hb0dtd2l1dlU3?=
 =?utf-8?B?UWw4eHg0RzF6cWdJSjhZOUtOUno3QWtzWGtLajluaTJETjRpdGpRend2SGdN?=
 =?utf-8?B?ZkdpbHhFNm1rYVZQVXA1dUt2aktzRFFSTG9CcGtOREtBRThwYUdIR0Z4eHIy?=
 =?utf-8?B?TGFDUVZLZzUzM1RVditwRnlrRmxKZzVOZ3hEbytITjRYeXhXNU4wUVR0ZVcz?=
 =?utf-8?B?YmhmZktTZVBST2VsSGRUU1FQVU9YRTlULzVFRDBsWDNBVDZHVzBqN2JkTjFi?=
 =?utf-8?B?L3QxcjhvaHdJTkVPWEJwTGJFcUtJTVM2QlJ2cnpTdVduaWtrNjErZjhqMTJP?=
 =?utf-8?B?QUw2SHIydHRYeUxuU25uVUl3cUNXNFVBK0U4dnovV3dwNWlwc2ozVG1lNnBS?=
 =?utf-8?B?Q2p3OUR6RUJQaXUvUjRCdkRadFFwL0IzeU5pL3pFd1JMY0x3MkNKNU5pUnNz?=
 =?utf-8?B?bTlyRlRoTjNzczRpYm5pRmh4T2kvQlRjeUdnV1pjSFRVVWZtalU2YzJxRXVh?=
 =?utf-8?B?d3ZsMlNURkVXNGxkY0UrOGNKaXZrNk5jaHp5dDhGZTNMbVFlT3I4QmpwZ3pR?=
 =?utf-8?B?L0l1YWlXQ2ZmNGdQZE5kN2cxdjlPMFdnV0RibHJFa0V1ZjJic2pMbFFSZ0Y0?=
 =?utf-8?B?RGFVbFRQNENlN3NTTHFKT1FvUFpHcTlNYXU4R1N0bGF3UnJKM1VVTXByMUZD?=
 =?utf-8?B?SGJscGZORFlsS09NTzNrY0RKNEF3RVFPV21ta1JSdmx3QUE4QjNHUTZKUHZs?=
 =?utf-8?B?V3FrOWppVDdrYzd2ZEI1L2tYYXI0SldkOGhTdTJEWkJhMEdkaEJ0cEV4dEQ1?=
 =?utf-8?B?MitCY1B4N3RmekluanhXN3hvY0hFM3VTcHpveVNaRXc2a2R0aWJ2Q01pZjk3?=
 =?utf-8?B?RlpCckN3Yzl0Z2gwaFR5SXI2ekMwenNpK3NPTFI1T1BrL3FDR3hCOFJ1ckVx?=
 =?utf-8?Q?+1qBbukSti6mrr+aSQb1F08lh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782731c1-ede6-433d-d566-08dad46b4380
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 13:43:58.7327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAQXm65/76iRFPamNy+r+YRkIKrsjj3yGYzxS7tZjhx7nkEGAZbs8If1asU4VtKzNXVtsr9XXQmI2cw2WDyHgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

On 02.12.2022 13:35, Ayan Kumar Halder wrote:
> We want to ensure that "xenheap_bits - PAGE_SHIFT" is strictly less than
> the number of bits to represent unsigned long as it is used a rhs operand
> to shift mfn.
> It is also important to note that the "xenheap_bits - PAGE_SHIFT" is never
> used to shift an address (rather than a frame number), and going forward
> then also shouldn't be (perhaps unless further precautions are taken).

Hmm, now you've lost why you are making the change in the first place:
The way things are before the patch is quite fine for the described
purpose. (This then also extends to the title. I should have noticed
this in v2 already, but didn't because I still had the v1 title in mind.)

Furthermore in the 2nd paragraph instead of 'the "xenheap_bits -
PAGE_SHIFT"' you mean '"xenheap_bits" alone'.

Jan

