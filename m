Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD696394B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 06:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785408.1194851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWc2-0001fv-8v; Thu, 29 Aug 2024 04:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785408.1194851; Thu, 29 Aug 2024 04:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWc2-0001dq-5c; Thu, 29 Aug 2024 04:18:22 +0000
Received: by outflank-mailman (input) for mailman id 785408;
 Thu, 29 Aug 2024 04:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N580=P4=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sjWc0-0001dk-Fm
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 04:18:20 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:200a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7cc3d75-65bd-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 06:18:19 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 04:18:15 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 04:18:15 +0000
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
X-Inumbo-ID: b7cc3d75-65bd-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpX87+616XPT/uw3/Wa2fcjqSIicKhi6AAs/a/vNLhmFJbwpoDZYoBL/iYxXwM9mx4GnHGWSJz5OXM3wRQjMUf+0YxU75MCeaDYvVKrDqA/PLAk1eZlrvLKrUKJ3tCktQ3MeVE5V3X/QAEOj8ci+nMT/og0AQfcjchp25P5Yu6OB89L4RrLCDWVd8BUkYNkQ2n/FnHjX2DH9tRaeqWoAlnW1RZOvEnW9eau5PorNVNuUseioYGLwlKVxfj+UOSg67vN/ZZ0r67+AKYqXLwdeSdOMTTxhkp96Y031NjbR+aG8Y9KQq8enkq6pvn39DyRPFwSGr0LLjVf6ZhJKW7TbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuIZrbkzZ1dOSGUoyKupye1CIvOEvqvYkiVLKnr3yLA=;
 b=VwgNa56HuZepH8OHlA3oX3xJb7o6NlUVBHmTSeCPvFrqOIi0EGvIpX7al/zhzeOK8neDRkmxI16InOa1vIeVg3AvLqJ+j3TnAVcZN0Mlo2Y0ddkK1FCclbY7r7PZMsEKN3mjt28zCXBvlI/8+El0Nh/fpHFHQJuom87Ocjr5zgUYCwQVwAahkHS3X1+jfWA1cN72AKBA6hDw8gi2/EM3XpQ/B9CqqnJaNzLgpQd0Y/YIseVVR4nTiI+Eeq714ll3siLPtHBSYWogyseZ8c4RTMsNmuLcMYk9laMWCoVi1QtbxBPdlALEjBPQtYFqczKSUp6lQ02Qutiq9tS2KXu5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuIZrbkzZ1dOSGUoyKupye1CIvOEvqvYkiVLKnr3yLA=;
 b=zxzct24mHZX0bIaPAak6ARIunREKwVCtfdsYqaBd7zdaG57ujFTaF5hOv8rOasv9Qi9Q6yaFr9icsBsBYLxuktCRrS+ISUeuTZYEHTkRCMW6Ua4VCjHbugMJfqeD0bk6p2bjdFGXOGuXu9jjyJYdsUk71EdvLVIoOiEmA7aVZys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <553b3468-39cd-4f10-8036-15726c5054e7@amd.com>
Date: Wed, 28 Aug 2024 21:18:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: fix false success in qemu tests
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e4de45759723b28713ef205335c4d79b9e7074b7.1724904269.git.victorm.lira@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <e4de45759723b28713ef205335c4d79b9e7074b7.1724904269.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0166.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::21) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: f577d0cd-ce61-4dae-7e5d-08dcc7e19a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGlSVmxUSGRGV0Znb3plMzlOU2tXdCtKM1MyM3JPMCtnOW93dGc1cTNLeVl2?=
 =?utf-8?B?bS9RV3VIb2hZQjdxWDRzZC9nSDRkVml4Y2xXcVZYT1E2TGFHV3N0M215V1BD?=
 =?utf-8?B?MmVURDFNYzlmRVR5REJQNWZDRnl2Q1o0dU5TQ2RjOHdPMjBpMXB4QVJoZWZn?=
 =?utf-8?B?RVBMMVIyQUVMVCtaWnRtNnd3RHlVMHhxTGFxSFcyN3UxSStyRkVjY3JJNGFW?=
 =?utf-8?B?clBxTkxESThQcTZIdVhGU3JPWHhyYS9Lc2U5dS9VZStMYU9GMVJTVU05aDBT?=
 =?utf-8?B?MG8rNFF5VTU4aTlxNDRicmdGQ3JQNkFKYlpYWS9zR3VZL0pUaGZOb0ZTNFNr?=
 =?utf-8?B?ZEU0cXpibzhVM2I0VGJzc0txS0F5NDc1KzVJai9od2xZWUN4eEN2aTJQanY2?=
 =?utf-8?B?YTRQdjVmRDRpMFVaV0FnM1hjd0x5TC9UZGVLRTFQY3drTExoMThySGh1ZmhE?=
 =?utf-8?B?K3pUckJ0eUtvakx2eXIwT0tlbWF1eEVmM3dsNEJURFd4bURwZ3V5SnpoMW9M?=
 =?utf-8?B?SThLbG9yY3dpdDNNcnZoRThiaTBOZ0JBMldxbVpPTGlRVzNIR2ZFdEhpYzhO?=
 =?utf-8?B?QXI3R1VUVnRFQ0wvYUJxUUYwellGRENncVN5YmdDbXdIcEJjUlJ3VUN3d0Nv?=
 =?utf-8?B?OHR5YUtVbzNSS0NMQWhEQ240Yk4zemhXYUhHdXhibHQ0VVJic1oraEdIWDA0?=
 =?utf-8?B?c1Q1L2J4SVZTUjBGWXdaWmwwQWMrVHFtR0lHanFyakRoRi9EeE9sOUJLMUo1?=
 =?utf-8?B?UWgxazUwS0VHVGNySGxoWHdDNlNxSVNITGFpSmQzL05mVWJkTVdaNEkzenpv?=
 =?utf-8?B?T1BhN1ZpdzNwRjdWUUFBWldJem5ORGttMnJyNG9DZ3NjcVRkQWxoZlZnQlZJ?=
 =?utf-8?B?WUJ2bDY5SnU1bXBRb1I4MmxLN0xrMFdQdDByVUJLQ1kvd2NaamZCNGg1bGlz?=
 =?utf-8?B?cWU0SVBvSk42MkZIZ0c1RDJLNEZHMVJMUW9IRjRuMTRqeTFFVWJHUFVqbzBi?=
 =?utf-8?B?YURpc3U1M0NHTnFHM1NZNTB2dVgzVVhISnBIMkZsQjIxVFFtUnR3UTVoOG1P?=
 =?utf-8?B?dFdVcVRnYjQ1dnI1ZnBKTndMZGZMLzhHZHRlQTdpaWVHc2tkWlhnOURuZmRT?=
 =?utf-8?B?U3k5THlPaWk4ajNVY1g2dHNOaDBQdU1CZm1Qc0pFWEFncDRTMmxLK2w4bWVz?=
 =?utf-8?B?eUt3dkJaYll2dmpjTmpNNC9mVVdES25FSm9xZjlqdW5aTXNwWlhjQ3VZRzYv?=
 =?utf-8?B?bzEwZUtSelhLS2NqZ2dWclkvc2Q0eWd0QTNlZTRseEszNm5Kd2JxeGptNDda?=
 =?utf-8?B?MWdPU3RMcFUreHBBSVV4emdWVVMwSGxsS21COUh6RlZQazIvTTM5dzZQZU4w?=
 =?utf-8?B?YWJIdnVSUjFLZHJTM29vbzVSbGwybmRmWkJ1WGx0Q0h4Z3V0Zjk5TVdwd2Vx?=
 =?utf-8?B?RE5RbVRvUHhwVGNUZi9kaVFpenNDU0VTYk01OW15OUk0SzE0SHZVYnQ4Qmg4?=
 =?utf-8?B?QXcxUERWaUNnRHdYUDdkangrSDhQbjNHaEZjdytkRkNqWlBIekgwT0lKbnpS?=
 =?utf-8?B?RUlSK25QTVk4MEJ6b3Rtc25ZYTdDNVdRbXZ1cndrSG45NHNINkFlWGZQQ1ZE?=
 =?utf-8?B?ZmZRQkw5MmpGRDFwSDZTYXgzRDlIKzFpb3dncVJrenVIZGIwSlNJSy9SMW1E?=
 =?utf-8?B?WXhVbnM4VkVrbVRJeU1PV0R0ZjRBcVAvd1NOZGVKamc5NDR4TlViblpMYkdG?=
 =?utf-8?Q?tu8Bbek/iqu+mQcCpU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anIrdm1qRzJwcUFXY2dSRy9zbVRIRHFPd3hDdkp6Nk5mYnJEdDNBakh2Rkhq?=
 =?utf-8?B?d1hmYXFUbkpnR05jMVZWWnE2NnpRcXNTRXdHTndXRkR6YVgya0FFT28zNnJo?=
 =?utf-8?B?bVNBT1cvbXQ1QzhJQXhBNWNEd0FyWklPVzFoR3pGN1c4YzNMUGc2b1c3U2Rn?=
 =?utf-8?B?Y1ZmVEZ4NEpHdU9EVno5dC8wNm1WeGhwZ2pOdW8vcWhqcnNoVzJmYUVvclNL?=
 =?utf-8?B?UzA4RGxRRE5jOXpoZG5MbVoyaUN1aGZOc3UxZXRoejJ1ajMxNSswSnNPQmxI?=
 =?utf-8?B?MDh2cmVvNlp6bUVMVmVZQ2NXOEFlaE5oVWVsZk1wNk9hdFN0YW1vSnZXbW5C?=
 =?utf-8?B?YzEzdFhjTUl2VHhKemdERmY1UVZuVmpXWVRPbmxKdmJWNWpFZjBLTjRKQ1Q5?=
 =?utf-8?B?NVdmbm1ZTE51ZEt5WjR4bi9MbEtndjNISHBRRjRLc1RhWDcrYzdJb2hTc0hN?=
 =?utf-8?B?bm5sYk9DVGJDREhoYk42R0Q4QTdGSktadEZGL04zL0VSL0pGWTFSeHcxVnB3?=
 =?utf-8?B?N0RGeXNmdEJaM0N0UTJBMWpINGZ1all2VnVYM3FRT0pFUnRiZ1ZEbXZ3TmFN?=
 =?utf-8?B?WHplb3FNanJQaitPejR0NlZzc0ZqTWI0OHRDbHhOT3kwNlF2eHlUNVdGUWZH?=
 =?utf-8?B?aXkwN3E5SGVmc1o3NHpEQzRJMkJoc2VhMmY0cFVuNEc3eHBZeTZ4emJDdUcx?=
 =?utf-8?B?d05zMG83Z2lweVhiZ3NwYzIwRVBEc1BKNmxQLzl2V1Y2WjRwZDQ1WkZqY2lT?=
 =?utf-8?B?K1drNC9ua1VCR3VyQkhsM2FIakd3SHltUXlsUXkrR2JWbkliZHVQajd4S0NL?=
 =?utf-8?B?YlRYcnNqemdsQnJZejdCRkhPcXVFK2hFN1IrVTRYRVdZTk0xdDgvOEViNjhm?=
 =?utf-8?B?Sy9FaHVYeE9TMzFRemZrcHNVOWZ0QTBKdy9SUURuL0NreElXY2l1NmlhY3Ri?=
 =?utf-8?B?alNRU0hNbC9jeWhXQ0tnaC9Zb1hORnJyODJYdVp0SHMrT3dqanNTK3RnRnMv?=
 =?utf-8?B?TGExU3VqQ1ZXekZ5L2xOOFdsMXlVM3VXMk1pdXlZUEFacmJ2ZnRGYm4zN2VK?=
 =?utf-8?B?N0IwREUrY0p0TE1meHE0eVRBVXdBd3lLeTZxaWFXMTVTeHA1S1hKWjd5dVZG?=
 =?utf-8?B?YUsrZHY5OEFGTUgzcms0ZXBaZjZNRTg3ZUp6ZlBYZVdUSFlZM2VTWTBuUVVs?=
 =?utf-8?B?WSs0NUR4Q0tsT0JCUCtnTUdKOWVKbS9hM2k4WlNhOGY4Q2g2S0VNdk9SUWY0?=
 =?utf-8?B?ZDZWZUk5YjVobXF2cyt3QVJSaE5IOWUxZDB1TkcwcUZKMlAzU1kyZitwL2p0?=
 =?utf-8?B?c2l6SzZMR1UybU5PQ0Fab3FVZEFic3BDc2lSM0VldlJlQ1R5dzhXekZ3RHpO?=
 =?utf-8?B?VjFBYkZ5K21HbU9SZHUrUE9tRmZ2bEFMSXBKbEFEOHhCbitDUHE1VWQ1YVV0?=
 =?utf-8?B?ZDlZSmkrdVI5V0FDc3g0MEtmdHlXVHYvLzlGUnVVVFc0ZmNpdUw1VWRKY0g2?=
 =?utf-8?B?MWFpaHJhQ3prWFRIbno2M1VYblB4WS9iTVZyZUd3anVqWDB2cGVaR1JDRVY2?=
 =?utf-8?B?clVLdDN4bEdTanlLdzVpb2I3T1lSVnRXRk00WU5WWTVBSGU5S3AxUGl2N25x?=
 =?utf-8?B?cFR2N3Q2cHY0TEJ3NjNWdjRRTi9vVVNMb2dzSmF2Y3VzSjdkVGlaU1lCcG9H?=
 =?utf-8?B?MVEyaElqeVRucUIxOG0yb2E1aUVxNWNQbU9ab3oxOTdob0JIQ0p2SURidGpQ?=
 =?utf-8?B?YXVjSEFBVTdRdUhNZHV5a2xrRldBOVNhZGFPVlEyNWI1SzlhM0FOdW1OTmd3?=
 =?utf-8?B?ZDc5VFNyUlVKSTJBV09ZQ3Axa0Q4RTVOMVFVMjdlMHY2MlF3TU55UjFQNDY3?=
 =?utf-8?B?WjFrdlhuQnhmdjlBUlc3dHJQdEQ2eUZlM212YkxVRFRaeHd0aktmZ1lGNE1y?=
 =?utf-8?B?OVFueWJLVHFNaVdMNzg3T3lRZzUvN0NmV2JsV1RETTM4bUVOdGdWVFhnTFZz?=
 =?utf-8?B?Z1VMNkRkR3hHMzFSMm9qNWRBS3U3WWZKQnlPdDl4bTlxdWhmeC90ZFNYNmdy?=
 =?utf-8?B?VC8xaFJVWG1YTXlkaVNLK3lzeHJiUjkyK08wbXhZUTdiaittY1BxWGhCMVNZ?=
 =?utf-8?Q?YesWrt77W2tLj41xm0ibEz4zZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f577d0cd-ce61-4dae-7e5d-08dcc7e19a4d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 04:18:15.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kctZOdNR4ujjJrBbo65Ucdeu2uVU/T/xjcjiYFLjZmRMWJ63TueeL/CH9cqxM8D9EwoYIbsDLdpBycc1Ta4UOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

While developing a patch to update xilinx tests to use the "expect"
utility I found that with the current use of "expect" in the *qemu-* 
*scripts,
it is possible for the test to produce a *false success *if the expect
script returns nonzero due to the following lines

     set +e
...
     ./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
     (end of file)

The first disables exiting on errors which is needed for cleanup in some
cases such as turning off power in a hardware test. However, here the
script exits 0 on reaching the end of file.

This is a serious flaw in our testing system as the result of the test is
essentially ignored.

I have been able produce such a false success here by setting a random 
passed
message and short timeout (line 142).
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7693194287#L142

I have sent a patch that fixes this using the same method from my xilinx
patch but suggestions are welcome. For qemu tests it may be enough to
instead just remove "set +e".


