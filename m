Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B09A771C35
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577827.904873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvWR-0000Xq-7K; Mon, 07 Aug 2023 08:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577827.904873; Mon, 07 Aug 2023 08:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvWR-0000Vp-4X; Mon, 07 Aug 2023 08:23:27 +0000
Received: by outflank-mailman (input) for mailman id 577827;
 Mon, 07 Aug 2023 08:23:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvWQ-0000Vh-Dg
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:23:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad1860f7-34fb-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 10:23:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 08:23:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:23:22 +0000
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
X-Inumbo-ID: ad1860f7-34fb-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEmaT4TTIK0Mfo586HrMGDe88Rrf9Z3hNoISBrvLb5PdOpoOfWnkCJNacf2fjoVWy2NZp78bLA3lafIbqjG78zbKrKzNjnw3UDVztz9W6LleMDHpDLwznN/xa69R7Gyh5NfgWaTrq9A7fTigyMmtnvFpspD5GBt5GjenS6zgWTnRm8PqAYfQTITmXSTQTdXExrMSMW8NlxRiqPWGjvt5X14VltDaPCfADpjMrzPUiDmE0Om9yLqqpR3VI8nRJVhqLKEjE+7dTd/ZVR6Xb/qCgbXe2aLSUfoyCxJ4Oi7fCmRrXMrvvqSB+6//uHfePUzV5w1aztWHzfuVj1rmprloyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ftNqEZHQAKAYL98A+V7QlXNmwwmyKY0cQXST6QNRhg=;
 b=Sc1Wob8ymz6u+h9UpgB8in1EPtaWgM3eiJMAuU4CjE6NJkFoYSRZABdU98oCoh+zZO98q5LrJvMm7RG9UobdBSgHdbVnndVOThuoDoGqHFmqc83ln10ja3yRtMT1+AYaj0PjE+FBiTj9bfqkNA1oQq0+KFlgsO6gW04SwVibcsvYTuEpXnpTJ9K+bKY7ZfPeLEYnktqRnhLaLMVcl207f7dnU2ag/ve681+0QJSSEAROd6RHHNG7hghRI+VeHRyWqDVpsDhwEdmDSNQ2f1a+j9DxmN/PX4igsQ+ZHXRmWBghX2SCgTks4HNXNz4fSmPZ7AxIAyZk8eLRQq7uulJtUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ftNqEZHQAKAYL98A+V7QlXNmwwmyKY0cQXST6QNRhg=;
 b=eKzf8gQWax1al4TC3xf1zmCs/+T3DtHJYC0hfNpxyNDAjvBKesfFCtST6Sm94BSDGJ+iRp+15xHUXGalDhL9AWubKz53tsk+Pe0f/xWnpy/V3wM78NBDhXcUNY86oFidqarJmM7bys5vEGr/dJYGaepUEhwspzZd+G5yiuL/7grVHhMqDX4UIcBi7+Ueqnv4Va4QPh6gwD/3Mr9uM3klEgvX14xvINhvhAmiaKHBdt2Fky/83SB69p5DDFnx2CX1QHax9Qk0jVzcpV8hj9J19d+FBkaNKuvs4nkBWv2vF+RChygUMMeOkn0lDPQkZervhuGYENVK3/6quZOf5eVBsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82438990-cb32-a2fc-273f-151818834c4d@suse.com>
Date: Mon, 7 Aug 2023 10:23:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 5/6] x86/xstate: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <1ea70e5f8293fdca2bb69ec75f532722136e52a5.1691162261.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1ea70e5f8293fdca2bb69ec75f532722136e52a5.1691162261.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea96b41-59a3-4109-139d-08db971f902d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iOXtXntk2ktrY2bg61KvgdnH2QRuTVSxWvWDI6HzfsrH7tPqx3LcvT2VIv/ti2+hCnfzB4+F0l+Zkj7pZWTdCMstlJenZqxaC3eiNIwJHJN2gdhz+kBARgNnbi0BVEeyoIyGQZwkFmtzYRm1yydA+7iRqcC6ezkHdkE/FLC6SVtIaKh504/Zxs2BlGbHDPqG9h7VgbTWQ4IVtj4Q+L+byGinbrSvt3fD9K38MY5bz+G9ZvHVmcnuGPdgiErjEpShUtV3uYhzpbS3Gtmyqn/5wLRixflLZdr8svs11AmX+G4nbkclVPm+xkzXwLAkqdF4mJBlnV7ATguyv05oiU6ww+LC6It75kR6LPhTPIXOgQQrDI3wNqbVdd+OFBWJ0/qxSSIhqNekDRLQGaAanzRh7fwhEM5ymELAw1tiPa88HbhFiwb5Md8s0wyvWoOppm82BKds+nRbyR2Al/3+oUhd4qI8rn1cEDPoZk4z2tFMXWywbXq1Fe6rip5VVOhhFq9ePA+rHOGhMTXKMXRk4kvuaoow3NLhcZtS8B/QKOcxz/Eseeqletr/Su1wxc3NdyvcF2+Y2sYn9tKe8FPs8H2kXAr+hg7hkUuZsObLJF4PDrzZ4XWbmZDFaGdkMmbhZ3iRy/IQcBx7gigzJb423kbc6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(39850400004)(396003)(186006)(1800799003)(451199021)(31686004)(2616005)(54906003)(2906002)(6916009)(4326008)(316002)(4744005)(5660300002)(8936002)(8676002)(7416002)(66946007)(66476007)(66556008)(38100700002)(86362001)(6512007)(478600001)(31696002)(6486002)(41300700001)(36756003)(6506007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTAzMDIydUxPMkJ3VDkzM29vcDJSZkxCUXI1Sk5ZTUU0SnZYZDlMNXFMTDVh?=
 =?utf-8?B?U1FqQ3FKcHBnQVRicytTVVcwZFY3QjNTSzBRK3lhazNZSzBMM3ZnU1cweDUx?=
 =?utf-8?B?VHlpSS9JeGl2amR6UHdHZTY0aWFXeXc1MmJxVlJUNXFzSGFCMW5jM28wVUxI?=
 =?utf-8?B?OEM2MjBtMTBqWmRZOXd5VnoxZlgzb1NPcnJFZi9ldG9od3gxN04xOEZMenVL?=
 =?utf-8?B?R3luOGpJZWIyZHRCSlJGMkJnM0hKVkhUeFVkUFo5TUJSZEE2RFpCTGpNRFEv?=
 =?utf-8?B?RGY4eEE1R0U2RXM0b0dCM2x4S0RnQjBYVFc1NmlwcmR4WVNqbXdZRjFTaWRa?=
 =?utf-8?B?Sk9ySWlQekoyenRhdXl6eGMwSy9kMDNDS2ZBYUlXaVQzT3lPcXhWV1hDQVhi?=
 =?utf-8?B?anNNZktEYzRLMm1EMjAwb3pjYi9qbU1ESFpjUkRCeEtDdTg5R1NlT0Z5Zkhr?=
 =?utf-8?B?OEpPRXUrM1F0NjBrL21TZGJ1NGlFTUdhV1N1eFpXMWNUTEtjUDkzbTZXK3Nx?=
 =?utf-8?B?R09lMkk0bFFkakRVVWJJYTVFN2ZDbmVKMmZaRGEyb3NDbHhsU0NnOEcxS2hY?=
 =?utf-8?B?QTdYZmxJNS9RcnZHblFmZ2dNOHQwbW9jeUJZN09JcUxFazB0VUVkMEZXU095?=
 =?utf-8?B?b3JRWjZIcTlNWnM3bjFhY21qM0NTMWoxNjZXNTh2TUFURG1Eb3R2ZDRZNURm?=
 =?utf-8?B?M2dpdGFuRUM5elVsZEpkcG1NSFd6K0I2UTV4YUFaTU1ZUmNuS3VRYmVTZytG?=
 =?utf-8?B?S3ZNUHdTVjhIK3poUGtIc1N2c3kwc08vVExvQnhrdmtjeHljNTJENTZyOVhN?=
 =?utf-8?B?ZUk4eUUrdjNaWEJucVhibDlvVGgzSWFSRngzd0cvYnJ3R2wyZ2ltOVhUSG1v?=
 =?utf-8?B?c1p5bWM1RmJDUFByNGU4eXp0Z2RMM2ZVejR1YWJyT2xYSHlubTNLak9GVk9a?=
 =?utf-8?B?dWI3QTF1dlhNQklkbHczSklWbEYwRit5MnM2L1B4YTJMU0dOU29ucVM3ODg1?=
 =?utf-8?B?NHlsUFhIUEFXeG5mbGtuUlRJN2N6cUpybTFTaXBFOTBrNEc4aHJ4RlFnN294?=
 =?utf-8?B?WUpjY0Evb1hKYUtkWEtYWTZWQmVMOU5jUVF3OXFmZEVnTjlYM2FtcjN1WHly?=
 =?utf-8?B?WDZSc0RHVUxVUUozNGlIN2JrVmEzOVZKNUdWak5OTXNSTitVQ2NQU3FFOVRs?=
 =?utf-8?B?a0RvQktUWG9ncm56c0lxcnJiNHVIQ2REaG4zcVM4dGFMSkFYd3Z0N2JZVkJh?=
 =?utf-8?B?VmVNY2RyWlc2L3hPcmUrMHEzdml0ZEF6VkVKd0JuWUM4OEdpWVA0YUdPek5O?=
 =?utf-8?B?bVR2ZmRqc2xMTUtHYkhSQmhYeVZ3UFZKclZqTVRKNndHNWxuR3BoU0VDR0p2?=
 =?utf-8?B?c1I5M3Z2MkVlbFd4THVrSE9xdHR0N1I5RTFNRm91Sjh0dkJ3a1R5d0VyOStS?=
 =?utf-8?B?ZnFLZXJMS2o2RmZCRlhJTWJ5RFY1Ry8zZTBwUFl0Y082ZTZ5OTZTV1FPT04v?=
 =?utf-8?B?RzZEeUtJdFhpRVBJTFluZXJlVkk4OWlFMkZOVEtDMWxsMHk1NWgzNGFNeTMz?=
 =?utf-8?B?OEk4R1U4RVNKb1dzWlFveFFlaHo2aDN6TTZFWXE3bHNsWlkrUlJqT1VxYlEw?=
 =?utf-8?B?aEt5VmovcHN2bmpzZTRQRWx6YW5nOVFRYzRHK1VkcTRtSXVVZG4wdzBNRFpy?=
 =?utf-8?B?Y0VNcXZRdU9pZlJ2RG00VkhsMlZyN1RPK0RUK2Rkd2hzNDVORDdHRk5QL0wy?=
 =?utf-8?B?NE9MdE9VY2thRWZMeTRlVSt5M1hOZ05TRGF1QnhPaGVwSGVXVG9FbUdGaWVx?=
 =?utf-8?B?ZE5uY1BXQWtxYTFST05HVi9CZkdNUytQNWJGZ2NFc3Q5RjYyMXdoODBsRmxP?=
 =?utf-8?B?ZzZ1N2lLNGMreFVtOGJkVW9OdXY4L2pDazZwanZHSFVmcGRrTWU0SHUyNGtE?=
 =?utf-8?B?bXlOdkdxTW01eUpCUVg0THNLUXRpLzh6OFgweGpMMG5CY0FsdlVEZFRCcWhw?=
 =?utf-8?B?NkZnMHJlaUp2ZGZJbk9GTVpjaEtJdlBvbjdUMzZlejJyNkZGRTdyNFdBNDdj?=
 =?utf-8?B?amZDUEkxTllCUlQ0VzFlcTBPekZEemt3ekFLZXhVeWtVd05kYUliWmtGVnBR?=
 =?utf-8?Q?oH9+f4577MgHxjcgAR3+uoAIU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea96b41-59a3-4109-139d-08db971f902d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:23:22.3203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQuD35ZJcWAy4fdf1p/aMlUhEM7znPUIfOCQo73Af2jeMDOgurYgnJbksGipfxutvmnDrJ//OssiH49G/tha8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7104

On 04.08.2023 17:27, Nicola Vetrini wrote:
> Rename the local variables to avoid clashing with function 'xstate'
> defined below, but declared in the corresponding header file.

Hmm, there are two functions with such a local variable, but you don't
change those. You change "xsave" instead. The new name you use you took
from older functions afaict; newer ones use "xstate" (and use of this
name is extended in pending patches), so preferably we would follow
that naming model (and eventually rename all "xsave_area" as well).

Also - does "below" really matter and hence warrant the "but"?

Jan

