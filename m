Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B5651E73
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 11:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466918.725892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZZ8-0004Ql-47; Tue, 20 Dec 2022 10:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466918.725892; Tue, 20 Dec 2022 10:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZZ8-0004Oy-1V; Tue, 20 Dec 2022 10:09:42 +0000
Received: by outflank-mailman (input) for mailman id 466918;
 Tue, 20 Dec 2022 10:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ZZ6-0004On-Gl
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 10:09:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d2b735-804e-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 11:09:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6845.eurprd04.prod.outlook.com (2603:10a6:803:138::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 10:09:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 10:09:35 +0000
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
X-Inumbo-ID: 69d2b735-804e-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoUHknB3o9xGxmg/o83hGvzC+q+B0H3z1DuY3aLtvATFn/lsTf03HhVp2vWVAYq4dnHBUqxKS+w5KUZVeZc96xZh869NYSK8KVAfjwfEMZDhQtT8GP1ZczK6ajCgsA+4rD46NALkz9bY21Mr/+unLvbOvc3udOHYzv6NHtLp3ngR2hGZjuiYwQxV0UN2hCskA1xvhcx5UCptWEiiOgL/X5WmtFV078uWGacK0jHQqzz5YTmLQYlcjD1cIogl3Aa9Vjp6Jts3f/Kq43n3QBgtzlnxKpl6bsZp7vLgJDIxofvG6OP0Y1+pMtog2lHU3B5LIM7aiDktx4azFigNdEe4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJgwyheY1nbA1kwZdxLhgY1wrXCNf02fI8FmSUuOyPU=;
 b=mZik+mOxMoWTOJiPaonzIKgbudLRcpJpu4Jlj5ak2037HN4P/rLfIBotqhs/NYeXLMf/UihJorRndTPyqYJ/UjEyEXYm9Exnb8yGJaF3MHUutS3IQrlLvRerYJOYGtV2iuSwXbao7AKlhqkPcmU6tjV3bIh7wN4CTHXST1zRqqalT67vQIG4dZJq5pUf5+NVeLWRBi72Bh9g+8s26/MfMwrYF6O3YNWcKigu/IOi7fmx9e0gkEBMSIZldXImx/9UC+VHBR4eqo6lctoJESRR5dVcK5NCVNO4TJVRW4Qcchamo5GCr37DzbuTI2da5nlKvdK9ezQDNEvLBgXL9okqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJgwyheY1nbA1kwZdxLhgY1wrXCNf02fI8FmSUuOyPU=;
 b=0o1MBOR+bvda8YInjA9lHXMJa4r5fi8cY911lHS2uUt9VACg7QuorxybnplwcvxAl043Sp9/2mrLanckEnOKdMJxUuTqJyjQRo8kPQQAjEVTXDJLV3E9KDwxNQlD63VelZyyHz5kVCHG5lLXWtrhJCcQYaQOpUJ2xz8KmmKN40YAOp7h5WJuozWZqExpTYjcMRREWVrmoDqR1Aem0EOQi06oOdf/hQXz/fEPWdg7iK0aM0739p75ew3878XqIXX1TdSPNlXCMCmPRe6xr4nuOJzWfOwgA5RlxzylhrRug8VEgARZpt9MCdkPkJ6tnZ4QEUwu4tcjOZV4RLnuw7GGbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6966791d-23d5-2613-da53-044b1621e3b5@suse.com>
Date: Tue, 20 Dec 2022 11:09:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 0/7] Proposal to make x86 IOMMU driver support configurable
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <4b45cde3-52e1-15ae-7b6a-84c0d5141cc9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4b45cde3-52e1-15ae-7b6a-84c0d5141cc9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e44a51-1395-415e-97b2-08dae2724c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6c/ITP0ao9J7AZCRaqCwcTnJog6xDylPHMT3Z243/wm0onj+kBDT5bvpHtid3vHrgd+4HBCuK2X+9EP0rs0U630yYFem6dXIZ0LhkL5PqbufnvEt2Pgk6xOs4E6co+Canqw4MOhiitCiw3KzigAWeCZbiwVyJbd3rY1ORVkbZUv+IrGLcR5B85ZvsK2jHUuihfWOXf+2DHQTu8CX5pv5VxAnjKyTc58sfSzvqgzMAj/BB4RBrIsEfAk6mQH8YhJM3N3sl5P7Hg42A3djmxsW8VlYss3Zxt1U6h2TEo+TIEfVbyPFPV7zOjSpJlfK5ObeYQQVNihkAHhvnYKVvFOuC+h2mQ5vIupcj0QMGabbeNXYmnjbrL4bw2QtidQvY37e3bY04Y10F4WRq9o+mF+ZeFssHRSCaYQFZ+CCHra4dEmA9V7CtY2XIeHi/2puXkGrOmVuetlEUBNxHr5u39ihKGxBjMJoCuWwby9QjA0FRQQUhhKCAZqQO1XxnFB78X4ZGvwBl/NeS6onfjcWqXuRmRE3VE/z+chdahUAxEJekRSHwMk7e1K4r0L+Ru+IizuBNBCzWC4ioTjNunPtasDKw9h0BW1j1oMCTG6d+Q8iq3oe2D99r/CaRsvzoZjtg39lXnho+MPpMWxteCD29NmjHPTF6PEzCVPIwylSZ09YwnBJHVINVRn4XgUgh4DuiveIIIA82NC1YI0XrMCbvaYMjZNFm9MsnQ8/zdtScWQiylU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199015)(66946007)(66556008)(6486002)(478600001)(186003)(6512007)(26005)(7416002)(4326008)(8936002)(66476007)(41300700001)(5660300002)(54906003)(53546011)(36756003)(8676002)(6506007)(316002)(2906002)(110136005)(38100700002)(2616005)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmthcVdEbk0yN3VxaDkzcDBuNzU0WkQraFhIa1dSRk8vU25CUjY5MEhRNGpZ?=
 =?utf-8?B?VllwZmtlcnNvQ3dXQ2xDU25PMWhvNDdmSlJuQWJTNFZ5M3BsRmhTR3psMGho?=
 =?utf-8?B?Ym5ZRHV2ZFovUmUrWmxnLzFXdDZrbGFtOHEzLzlmRG40QnBrOHA1c05INTlS?=
 =?utf-8?B?TzRGaEZHdENlMkVKM0N0OUR3KytQazBraXVMZmx3cGMyaEJWSG16eGRGR3dT?=
 =?utf-8?B?bUFVUU1WMHVKdFFpaVFWRzBVcDU0M1NXU0tGOFJiRDRxeERqYkRqUm5Jd29r?=
 =?utf-8?B?bzAvSnR1N05EZkp3VVNaT2w2K2xsM3pEUEVJWmtnbnNyQXM1YXlZbG5mRzdy?=
 =?utf-8?B?WHdaSUNzUkFrZURsOEd4WGs2bk5XbU9jQzFmcG9wRXRqaktNc09YNVY4MG9G?=
 =?utf-8?B?SzFPZWk5MlBLTFF1T1NMZUx1SzhQa3RNMUgxMFlNaDEvY3h1c1NxNk1kU01l?=
 =?utf-8?B?TDJpU1BLcWdJTlV2R1lhUlVsU2pCLzV2cU9reFJxR01sK3dXbTA0V1phcmFz?=
 =?utf-8?B?Rkx1c0U5V3VJaDZETlo0c3ZOZkNtTEN3OHpQQVhLOW91b3BPSzM4RjhZMlhN?=
 =?utf-8?B?WEZRdUhGM2ZHMEJIMEVwZFg2NHJ3YVJkN1JmWHgxbjNCaUhmZnJuUFRDNGVK?=
 =?utf-8?B?WjdEWkx3QUMrOHR5eUNiZDQvZ09tRHlqL2RlR001NWJxYUZpTFMvRU81eEY5?=
 =?utf-8?B?cXVBZGtXaFFRb1IzZC8vbGUrYU16RXZ0aExEMWYzdlFTOWhVMmpjaCtXZnVC?=
 =?utf-8?B?SCtYVnBYSzlMY0xaOVN1aTVIc0ZsSTF5bUdQMzdjdHZCeXo5K0FMallwbDM5?=
 =?utf-8?B?MU1kWURxbkdvcVdrZXljZnI4b0Yzc2YrQlE0RWpiUlFYaElUcFNPT1F5MTdZ?=
 =?utf-8?B?OGJidTkwWVBMbzIzRmJBZEpGOXhvSWlMQ25yak92aE5oYXZqdHBDazduRkpB?=
 =?utf-8?B?TTd5eEFyWnovTUpBN283UlpNeXJ6U014T1FNMUpOa2pFT29JSmJIZVFYSzF1?=
 =?utf-8?B?SHA5aHJRS0hFT2tpbzRqVnN5dDgxR05kZ2FZbTRsL3FyeW9jUHlXaFFFYXpw?=
 =?utf-8?B?UkNYdFk5MTNVeWRmQm5UN2N4MHBwOGFCeEJ3OSs1MGM3WmdXT2JnUFB6N0ox?=
 =?utf-8?B?WEtNTEFMV2tBcGpCMDhKak04NHNjNTFQd3BTN3l6bS9OVHBVbWJiRytmUWlF?=
 =?utf-8?B?RXdRVW91ZGorSkw1UkxScEFPT1V1bnNjZnFqaTEzMzhQQ253MWlLSU9JcTRz?=
 =?utf-8?B?WGswY1dCWWhiL1hVaFk0dlVPbldUU1hYTWkrMmpKK0Fid3piMmFOMjN1Y2Z6?=
 =?utf-8?B?ejllR0UrYkp3OTRDcS95Q1EvdlhFWG5LdDVubTZxbVBocVJKUXZVT2ZlU2xq?=
 =?utf-8?B?TlNoeWFGcHM2RUlqK1dMNG1DU0krUFdTclpXNVl5dFVrZGNpSDVTQVBRYW1E?=
 =?utf-8?B?c3Z6VjhEWEZQdTh5TTBtNWFJRnA1T0xteE5LamRIbGZOeGVMM2c1SjIxTjhj?=
 =?utf-8?B?M1lSUWtYdlVsNmpDMmJQWXUxcTdyNUVOak1kemoveWlBcGxwelVTL0NTYkRi?=
 =?utf-8?B?eE1HR0xhd1dSUDIrV0xLTzB2MzZPc1Q3cTZ2MHFjdG5GOVR6ckxFL0t2ZEYz?=
 =?utf-8?B?OGFwZ1lqNjRNNHZTb0pVbnZLSXhQczFkMnRla1BwM3pOME9FUTZrNC91ckQ4?=
 =?utf-8?B?eXRXRWRzdHgzYURaY1oyelVHcEh0YncwUlV6SDJGN3lxOWhsQ1JrSTc0djgr?=
 =?utf-8?B?L1FzcVFLYTlVTGgza1Z4dDU1UWh0RWh0K3o3QjdNZmY2VUxEMHFsUlVlcTV6?=
 =?utf-8?B?YXU2dEpmSkNqdDhibVhSKzhLWjdwcXNqQ3o0cGRQZ3FuUHdjaXhWZHJiVDZ6?=
 =?utf-8?B?NG1NcGwvMnBJS2hOWlZ2a2JjKzJTNWd3dzNWNGw2MWhmNmhCZ0hkelZGQ096?=
 =?utf-8?B?OERvdVVaaGo0R09FSC9IdmovdTkyd1dXMGt3YzFxUzIrY25CelZDUHBQaXhU?=
 =?utf-8?B?WjJZT2VhbjJFOWtrczhpUDBoY3FWL3NOelhuVWtrb2xJdnl1c21GS0pQTlJu?=
 =?utf-8?B?QXRnNW1DSGt0ajNVRDBqSUgwUFQ2RGtGd2h5VlZwbkMvNm9peEwwVWRCRWYr?=
 =?utf-8?Q?Vf7uck9JZ82lSUvywGQbkS3MO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e44a51-1395-415e-97b2-08dae2724c00
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 10:09:35.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hD2YrcZv1PEevAWVUX45FQiK7dHiLj1DFxvJyxuBnrxp+LfiqDNtqWIsGH4uXtIOa303wpcdeaHXFaWj6CUrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6845

On 19.12.2022 19:28, Andrew Cooper wrote:
> IOMMUs are more tricky still.  They are (for most intents and purposes)
> mandatory on systems with >254 CPUs.  We could in principle start
> supporting asymmetric IRQ routing on large systems, but Xen doesn't
> currently and it would be a lot work that's definitely not high on the
> priority list.  At a minimum, this will need expressing in the Kconfig
> help text.
> 
> We need to decide whether it is sensible to allow users to turn off
> IOMMU support.  It probably is, because you could trivially do this by
> selecting CONFIG_INTEL only, and booting the result on an AMD system.

One other thing Andrew and I have been talking about: We probably do
not want to tie the IOMMU vendor control to CPU vendor one. IOW we'd
like to be able to e.g. build a hypervisor supporting Intel (only) as
the CPU vendor, but at the same time having support for an AMD IOMMU.

> For the names, I don't think AMD_IOMMU vs INTEL_VTD is a sensible. 
> Probably wants to be INTEL_IOMMU to match.

Or simply VTD, covering the case than some other vendor comes up with a
clone. But of course we have that same issue with "AMD" and Hygon ...

Jan

