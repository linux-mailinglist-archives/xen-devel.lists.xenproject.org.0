Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4103750555
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562372.879030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXZ9-0004xX-80; Wed, 12 Jul 2023 10:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562372.879030; Wed, 12 Jul 2023 10:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXZ9-0004uC-58; Wed, 12 Jul 2023 10:59:27 +0000
Received: by outflank-mailman (input) for mailman id 562372;
 Wed, 12 Jul 2023 10:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXZ7-0004u6-ST
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:59:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe12::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28f2157b-20a3-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:59:23 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DBBPR04MB7833.eurprd04.prod.outlook.com (2603:10a6:10:1ef::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:59:21 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:59:21 +0000
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
X-Inumbo-ID: 28f2157b-20a3-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPW+j7P8W4En8zUbAAz4f50vLBpnAXZ7rEyyVn0w5q5HvnggI3vEcVOZup3AMPwQuT714UvZf481IhftMjBvmibTK8sPR3lLjxihVpZoHyirthw6zb+zMkyVjonYxjj5Grra5N9uwcuwICnrnWPX/KkJ5ILCVa8MnmeLlzBBNiD+NtvNVMda0yFB+ja+OAh6OdaIUMBoqGU5N4rI6rfWk3JJ8qDXf4n4ARMxiFwT2oXRxBE6edbbo+6ctvC4WxFp6rNokZYnj6v1206j5sK04rXYVWAnlylUhWLcLd60AEYa+UMytJ56qcyV3H9MMiTEUlZgFdNa/HuYb8Add2aoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mhO9XPSu9CQySCs0dqtRatUFWGeHo7Qth9MqNNK4FU=;
 b=YIz7riKW//pI6nMfsmTkt/qCJL6jyAXadGugy0WZUImQwa1WmqpFQDs6/V8Hbr3rv0/bBODVrseCy2AOgevAjjEuDJqtt1TR728G9ZzEEPNtPfEnUNYymCvLyDVBddheRM2+IegSxkoe8Grjqde4Mw3zXoIGPVF059n/7QwwOfuIQwkHXu4Bb3oKPDCkXPlN3UPitZ2nMs2sSxV+fcQuc/yJ/npJkj7o0UAbgSFTT4Cf4gfW5Ti1jga7ZqNxREzOplxVt7qiEiGUT9C3ClmM3zFBhkw2vCvjT3LeeSKeACmlpXK2v8UJM819cFxE/3ATame5fK6havC3bgqvCxiYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mhO9XPSu9CQySCs0dqtRatUFWGeHo7Qth9MqNNK4FU=;
 b=oz9gb+rxIvczTFMc21FYj2iQ4XQvKY4a/AG/2r9jkzuq67bjUZn6mN4SftkPcxbVQ8cORaHbvz+c4dwL0/bNIAki5JdRaOvvRv+OHNcYwqoDCAvndVGlJl1fuT9N5K0qzwikoeA+kvPg63tU5T+xuvL/MKAxhttyqXEpgK3CivpJRMaG/iU8qtnfmsSkoWDSw1s7ccuR5oXEvIzU0CSFdLtjYnR1Nx94krOAgLeb0sjZrrsB7FpkrypM/5hjEVl4IA8g4mws+yTy6TKywlCOd0LapW0l0q6SP7tvuK19WNEZXuUz/F7CDdJF8G6rkH1KDjKIfoAsDVvck7/hnFYF2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ffe43685-77fc-27bd-cd40-a447e7094129@suse.com>
Date: Wed, 12 Jul 2023 12:59:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 15/15] xen: fix violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
 <7a58c9341d10ef79e117ac35da048bbb088ec5d0.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7a58c9341d10ef79e117ac35da048bbb088ec5d0.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DBBPR04MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: cc07528c-1de7-4fb0-144d-08db82c70bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j2E9GgE4g/ptloFszVgf4rWK9M/V9OQuJ/MuxAXjfNUG6q0JeXYSCdenBVhBofrvy7287ssRNsWE7jSfvpeAX/nepw/sQec3KxH68IJkZ1DegLwTfaaJihbQEZAeQzG1G9hO1bshREfecb3QB6wOGdZkq3Z29s0mhGfjU3sKvEzaAdWnxD35wavFUnZH0WfAtjGWPVCLBwPi+XyJT+HPVGENU9CLvU2FsH6PKuKd0NseeKmd70wn9OF2HxcrmuVJQfjDhEQoRvFHizZOV6lEukXCDTICN7oV/VlhM0K923AAFzXpD5zLEuBL+mSWOSQTczidFXwG0SamkbkxOqq7zBmwFF5XxYHsXWgcdB7CdKUzmgKcSq42XiTSXVjy3qf2cEwI4ZZz68iEG6j5jjVaJNqSs8+3PDm/NWdSfETT0kFdJ8bkNIEYlaloS2xR94FJV8KJ9OhD/FkhGsc0JDr8Xj3nrDHpCrSwX7cd+2HwL9Hurgu0btjNiGdKAsKIKA5Z+GbIF1FPCuKYm2N7OcpBvyI0PsLIaCbjoWG8GqbygV6JIkoioHgsR02VY1RZYtZsFw8pHPPIoCm2vG9aLBvJw4GTWs/E4QjIZGWp0VeLEhEPCYsh49nv91ZWYbERvFxW8b1vei47ecQMGTbRJ5BMLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(7416002)(6916009)(66946007)(66476007)(66556008)(4326008)(316002)(41300700001)(2906002)(478600001)(31686004)(8936002)(5660300002)(8676002)(54906003)(6666004)(6486002)(6512007)(26005)(53546011)(6506007)(186003)(36756003)(38100700002)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEQxTG5aZkxhM2RCTS91bXd1am1pSDZKaHJJRzZweWloUVNuZWlOTDIrSXZ6?=
 =?utf-8?B?SHhpT0hJZXBjeHB3ODRJUlJFaDhXRnBjT3p1dHl1MWZWWDlTaE9nbUJJZTg4?=
 =?utf-8?B?enF3d0dGemxnYjg4R09ycVkrQWtOalV0Slo2NEZvcW9vaWlsd21BZ3FkWEY0?=
 =?utf-8?B?NHk2Y2drY09ncUxTSFhqUm1PdDdDNW5aSTljN0J1elBJLzE4K0ZRYzNXSUx4?=
 =?utf-8?B?RXBaS1g0UVE4ODhrSVA0M2dOQW9lSEF2RGNIVWhvaU9CNXZwMVZPbFlTcGg5?=
 =?utf-8?B?alo5d3pjeHpLTUF5ZHJHQXVYSzF1OFc4R1dva1c2MWdoY25nZ253MVU3cnVX?=
 =?utf-8?B?TkRQR3dWbHNlMjlWaTRBeDFHTm4vSk9ldGJ0a1NMWjNrb0tIM3NXam1WTy9j?=
 =?utf-8?B?OFR3dXRuOS9udHYrWVMxaG83UVNiMk1XQ0NTeW9OTWZ4eUFORmVqT3RqQ0VC?=
 =?utf-8?B?aS90aUQxNXNhd2ZxUGJQZmNZWFpSdHhTTUNxQUF4N3Z5OWp0Yjd2OG1XVFY4?=
 =?utf-8?B?WkxxNmdGeFNra0xGbmNTNnlTU2lhSnZyV2RtL3F3N2ZQcDhNNnF4cjByRDJm?=
 =?utf-8?B?ejRMeEh5b2lWYXNlUVRuajR0a0VwR0VmVDdvS05Cc2RxTUo2T3FyR1dNODBu?=
 =?utf-8?B?ZE1nS2t0MmRzaTJRMCtOd2lLMmJNM0Y4WDd6d09VQ3NYNFhFWTgwbFpqUmtG?=
 =?utf-8?B?Y2RyZWRnaVhqUzRremJXWUFHZnlBN201SWREd3g5MkRvT1I3aWRkSVI3Zzdh?=
 =?utf-8?B?T1lkT2RZYVFmaSsvTWtUdERiYlNId3VyVXhUbG4xb21VK1c1M1RLRjB4NWQz?=
 =?utf-8?B?S3VVMDBDL2JKMENLbjdsdzUzOU1XcEl0R3JxZkxscU1pL0ZEMUN6TUIvVnpJ?=
 =?utf-8?B?YzVmSUkwbWt1K1RQaisyVlYvQUpENVN4RjlxWldBSnNjM0swS0dGb0hkZ0l3?=
 =?utf-8?B?RHprbTdIRmE2bU5aUWkrcjE4aXA5ZVAzanV3ejM5LzRUWTFadHBsU0dqTEto?=
 =?utf-8?B?WTlxVTFOb3dHekYzVk1Xa0tiK3lsVjVITmFIZ2Rvek1zOE9QYllIUHFnaTla?=
 =?utf-8?B?K0YyMTBIcmtiSDZqQlJTdlF0Zi9PN25nVUdUc2dsZU5qc1lLSmp5SGNyYVNy?=
 =?utf-8?B?azYwQjNrU3hBVmh2MjdrQ2t2ZjFaSFlwcmNwSms0c0tQaGptNUxCMkw3NmZG?=
 =?utf-8?B?b2tMdkFkSXpqV3JJMnpvTFMyRHVJOVR0WHNNSGFlTlppazExbDdKbTNaN1hV?=
 =?utf-8?B?cUhnZ1ovalBFRFVsOFdnRnFFbUlHVUpEWk5jOVJGZFI2T1BueU41WXkxRzM1?=
 =?utf-8?B?WGVRd01RZUR2Rk00dC9LMm1QMUlka0VUbWM2Zm5IcURBd3BoTTNqVkVHVk4v?=
 =?utf-8?B?cUNZaUc3VXpoanBuYllzVWR2RmFHZmE5NjJhZkltZE1vOGpraVJ6WVZvY1Jn?=
 =?utf-8?B?NEk0Sm13NkgyOStTVm43TXZ1TlVRZGVvZkpicmIrRWRmanE3OFhvVGZscmxD?=
 =?utf-8?B?UEt4Q3BvRHlYNmlCekptSExDUkFYTWhYVFEyNFRPOGUwR05CQitBVC9jRmk4?=
 =?utf-8?B?VWxnOUsrTGx1NWxmaDE1RVp4RnlkRzVoL29rbkIwU2xkem8xL29ZMXNYMXF2?=
 =?utf-8?B?N1oyVEFhalVrSnJ3ejM0QmczYVUyYkVIeWxVSjY2NGlnOW9IKzlTbG1PbFQy?=
 =?utf-8?B?WlNZODJjVW1MNHoxRms5SVlOQVB6b1QrTXRFQWdTTmtUWDZTRUF5QlVPcXR4?=
 =?utf-8?B?Zi9JVVJtK24xcUhpcU4xbzEwOFBhMzBsMUFkTlNsTzBnazNQRElyWHhqM05X?=
 =?utf-8?B?SXBjdmw1RGh2RVNrVmZlZ2hLUU51SC9uTDFremtORFJrUmNsVUUwTTlQQzA1?=
 =?utf-8?B?OWFLWUJPTkVRNitQRktsWXMyV2k0ck40TkVydVBrd0VnR2lUSkwwbTh2eUZ4?=
 =?utf-8?B?MDhSYWpXdXp1T2grNWs1U2FEeCtZUVkvRVRneEthMDJjS2FrcHMzdkswQXZv?=
 =?utf-8?B?VUdpdkhKbHZVU0I4aXhSV3NKT3grK1E3enhDMDdvMUNnSGRpSENMMEQ3bHpT?=
 =?utf-8?B?VGdHN0J3a3NIOWJZblBvYzhIMmxaemxtWUZTRklwSVhQbUxTSkxZdXBzb0I3?=
 =?utf-8?Q?j/LapEnxmkrIV07HmoZi6mrhA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc07528c-1de7-4fb0-144d-08db82c70bb3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:59:21.0513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMmsZtCIRQL3O7+X4NUM8BSKTe/5K3h2WhtEf4Au0ExuMz3zPhmOi1BMh2AanS9MXC9ZBIKx9fOXdDtp5AiD/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7833

On 12.07.2023 12:32, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> Fot the sake of uniformity, the following changes are made:
> - add the 'U' suffix to all integer constants before the
>   '?' operator in 'bitops.h'
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/lib/muldiv64.c
> +++ b/xen/lib/muldiv64.c
> @@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
>      rh = (uint64_t)u.l.high * (uint64_t)b;
>      rh += (rl >> 32);
>      res.l.high = rh / c;
> -    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
> +    res.l.low = (((rh % c) << 32) + ((uint32_t)rl)) / c;

... the excess pair of parentheses here dropped (which I'll do while
committing).

Jan

