Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FB53F70D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 09:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342874.567974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTW0-0001bb-5S; Tue, 07 Jun 2022 07:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342874.567974; Tue, 07 Jun 2022 07:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTW0-0001Yp-1s; Tue, 07 Jun 2022 07:20:36 +0000
Received: by outflank-mailman (input) for mailman id 342874;
 Tue, 07 Jun 2022 07:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyTVx-0001Yj-Pj
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 07:20:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 511356af-e632-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 09:20:32 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-IU6mBVuXNoKKm3v3wjJnCQ-1; Tue, 07 Jun 2022 09:20:29 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7840.eurprd04.prod.outlook.com (2603:10a6:102:ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 07:20:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:20:27 +0000
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
X-Inumbo-ID: 511356af-e632-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654586432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNh9fAllHNgEqUECja1frIxpSQ810qY0TaCPSUBJjfs=;
	b=V7Es8tZ1DtHyvZTWQQtRl7/r6RTwgU3FwluWXsldO4Blr7kDbceG/Es3c6OIxdM4UQyl1h
	1Woyt4vWbS6Fmp0SIMlx6PTMRi4urHwinwMlXIsc/13eSSiszcU5hbkSYJkaFvOfIFc2ha
	ty/z4Hpi8tU9NtpeH/6pmqDvgSaz+l0=
X-MC-Unique: IU6mBVuXNoKKm3v3wjJnCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAY/C1xaQqJ/xJunfaVyJw64mvkPe5wgOd0U5PDLs2NG1V5boIg60AN23iIYFs4TximUvIAzGLqDlvE6jtviYK/ltQY3TLm30NjPdMAS9mg+qAVwcqSAUxqlpPi/bDZzSXq+K5NKSaypPIX53jhApx+SDqp4n97n72q0N0Bf7ZMu2b06QzEcqtfBrmSgwHpo9S8VPXddzFpikelW8H7+6MN6R7Hwdz7/r7AVSIFOh1BmdZ6NdXUynujfWHRBbCr1Bv3fN2IS59eNz88JsVP6VEX6r2xFOge1nEWYqrjzsbg1ZNmtcHdhxQ8fSQivbq2KSrHyVElg8p+l/in0f6cThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIBerb7U2xn1dpbVt21+aw8L70djIOhJrN5m8BltoNc=;
 b=WGL2Zx2efmscwvboqLvLDNSNJK5+FPjJj+Vc9zyI4t3q/d2ff01RDM/jdqoywuSFDHMFIrGB0YKwosBiVx5gxxoXoWiB7mlp8xDXbq5yiHPrgGgFnnMfVyYkS9dDyuJYWoA47UhSSB86CAYHhWMhulHKUkV2f6C8n8AMmLUKdKR6rdGIx+xGpqiN0kVTLUzquQOcfrI2NRw+cMUvZfK3uCWOk+CFBQBuMpzOgXekEcZOpqQKe2SJMBmjDDmNMNmxHb9Co0lfO3ZQ79QX93+HRD3kVntrwVpRtxvq7eb23k1Jno0ZRhFE3ljuhe/bJllDNE7UTryMEaYFzcojy5PxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIBerb7U2xn1dpbVt21+aw8L70djIOhJrN5m8BltoNc=;
 b=FAVAGLUAlpVKPSlDPha0aaJX9hXrCWd0p37GWN+hYJtJ0ZImEQHiZRfspS8RR860RxdCxJgjk0EQXQ8m/mD76Oe/kV1/6FQKmOHiBqSaqYAoByv0Akq8IFB927oXJTGKeRmGlzt6Q/gH5haFhU713PMketYreLOgLItCrF4+3RNa1wdS5KBZsDCi7qILnbJ3dEDJv7m02dsDweXZNPwnqh1HMRlgi9YTX9lnGhtkx0EyZ5jnjwDIarXYRjf3lQbLU+Wk2rso6TbsJPwUD/s0js7JV687OcFhdyOvehjNb48lY3CiH7pHlB9Yc2F82upAzCmykJQqcCo/Zq6Gl2e/mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5569489c-b3f2-948d-134d-f95b0fdb689f@suse.com>
Date: Tue, 7 Jun 2022 09:20:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-2-roger.pau@citrix.com>
 <3165a99b-3a91-2ca3-80a0-af88d87e9bb0@suse.com>
 <YpoavceqO238Q6Ld@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpoavceqO238Q6Ld@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96eea97c-77b6-4c21-e22a-08da4856324d
X-MS-TrafficTypeDiagnostic: PA4PR04MB7840:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB78403AF521C7E781E7D07370B3A59@PA4PR04MB7840.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	apd7p+muIZlwoq18mpwy7qEpWpVma28qapvWxjqukcHueOYb67eMw2+vBeUDnyRme21aPfUEpP3owiAMLO9hkmQzZHRb6Pghd1dUglKFOGD3INb4fEG4i6txuUCHb2kfve0H6xKQx5+E0/L5Pu0pomN1vBtrkvuz7b4RJ08/XPfH/h3NCabJkXzT5R5qaYRST0u+veeCKiEqzK2/FtA/O6SgCU7docJrL5lIs3/z6HNI64oA3isVjQB9d9Irft7t9hWnzQcRmiCaQrE4c3+n7qWxCFtoUtXWSJLHd2fqg/fxG1xDoQzDAjgU/67pAKZzgQ/N3rxMKvpVIKO0IaqvHVchG2xeXf4eXE6w2LURRe+JEsg/UecOav+pMzEvMHyxwONEmnrV92/1C/hkjb2OdRBeVRJrZmgvsdS11mV8lqcYrDk332KX0KUZuO0i7kmVbHIaaU9y/3SXNavNxSOM2aoWiM+6OHZ2oUOMnyVX23IZVOT/5ax5clnFW11GDq/PSi4I62aAaDAdQr5F7990icKPxrhGZQWz3PM2ItnpzdeTjCI6l+i7ua86jZfs+9WIGZLaHrU95C5MrLWFO6dHFzA90WZ55ZIgza0RG1TTfp9CD+UVjDqrqHErhSn8aRLPZyjg/jyUpi87AVmtkY0ufgBzAb3mk4Sl68a3+bj66/fbCeE5lSAyZLnHzDUl2HO2oomGn9ZmUXvi9GxaqskpdAi2VDxpx4auQkjqLvP4cH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6486002)(508600001)(316002)(83380400001)(31696002)(86362001)(2906002)(2616005)(186003)(53546011)(54906003)(6506007)(26005)(6512007)(6916009)(5660300002)(36756003)(8676002)(8936002)(4326008)(66556008)(66476007)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xme2dxeW20EsFwp/WLYE4NEKG5tJIo3SduUxAB2Pxj1CPmXgIv8/gWuEHazT?=
 =?us-ascii?Q?1vo5Plncvt+KTd3IU8VZ22cFzGZe/XxvZYS1dXki0P8eT+IP/j7cyPD3pZ6q?=
 =?us-ascii?Q?ue8G6lBbbZ3kqHJNgc+iOYPVeI3hPyr0Wwa+/tRcEUEDalGw6z+ADZiFnf0f?=
 =?us-ascii?Q?YNr5WH3TFOhPu644gsqMAv3avs6V52Cwx22Qii/dNoO9+6t2UiGoAVjf6LOK?=
 =?us-ascii?Q?aw71EH4QedkSLYhBwL5JeYRAgO2BT6o4pEA5s3qnCReioxGFIt9l4t/BXIcT?=
 =?us-ascii?Q?FDYFm3SwpNnR/nfLfBpSYk8uiSCYEMn4q2/MpwR9tT7+o+32thOlMBsS+I2L?=
 =?us-ascii?Q?KjZZ9+zuQv3XKHhL7dOcjZXk+gFVwEi70ZqfkHgQepdpSZO8/bFjCcv9Wrv2?=
 =?us-ascii?Q?h1mZpk4sS2Vez1o0W/9RElZYVRQKXL/yg/IRkMiO5j4zTxL+mzhhdi20P47u?=
 =?us-ascii?Q?5pyhki6IpuN6A8FijAq4VH1aarVGnOlrbQt0zTpnRiA0gdL14wLSEBo88spC?=
 =?us-ascii?Q?UoKGyt6/5oWuplJTiMAKvvWcYbysE/KxKAAtzAiWJzmfGFP+wRnVUZ9OLR29?=
 =?us-ascii?Q?SU6TiK9Uf8+WYNhlIYYBrAzeZJPSzToyJVWtlYIPBXDecv+mXpMJvfBMBjIv?=
 =?us-ascii?Q?G9XkNnLCb+5jlkfE8nh3/oSmb4JWAJjPtaKM1z90jkzQgt6N+ZOzI2usm0qX?=
 =?us-ascii?Q?zddJRTzeTCmutjEFg/DfoZYR4wCwHWAlz2qzCLCI+M65QHgTeabyAz6oIFqA?=
 =?us-ascii?Q?8/ijSgA/g9JOIULjOgnEmlP3Isk42qpU2HYsD1lSvem8etMwtwbtwny9uCmW?=
 =?us-ascii?Q?eImaxWjprPsUOpsiqm3ig7eH4LVCENdif7vYyZzttnypTDn8cfnep3hikrUM?=
 =?us-ascii?Q?9JmDRFY/o/Xa+ctwUxmUe7DzcyJz1jIAn/2iaL1Me7K0idnNjzKDawBe/Zdq?=
 =?us-ascii?Q?T/Y21SCD6hkkdwDbh9ffLDc+7z2uvldm0tkFg9EtdYdvLLGOTKw/3Bm/zfYI?=
 =?us-ascii?Q?F7WOGKbdz1jlYD2Nd1dzHc7PUik5eDrHQ9f5C8p+ptvyUgXo51Gy3miwyd3W?=
 =?us-ascii?Q?DhpXQ2bLnn3ekV9jP4WsZm7EbDpNXwZUetLI5h8E5Qe+XgGdWYq2bxgwAZ3t?=
 =?us-ascii?Q?y+x8DKbl55uI3Q3hdZOMGOgbJ/QYCh9SdC0xrKG2ZzEXSwIj+A0UCXclCZLS?=
 =?us-ascii?Q?drnHSwLlns5m2gBFTV6QUtlA/CMQ9s8QyAbbr7VeT/6ZBsDze2BqbPZ1JCnU?=
 =?us-ascii?Q?MswMr4UDjGq7NMtTcPPRd22uaJBLzfOvErgNzbJlQmIo5M86CgEB01VhvYv9?=
 =?us-ascii?Q?NJhiPfYY2eC7HYEo/JIpjy3GOK2FNv8dp/We5Apu/UsjNZS9IijSLv3iEOMc?=
 =?us-ascii?Q?lY/IVBMW/4fUWp96AhMrR8Fbga5cI85PXV5jmW1hieCjqqHCFnb73jrkgTfb?=
 =?us-ascii?Q?TD5oo66OlogYtdF0VCdyBaw5gYHEpgAv7Ou4wdgEllfZY8dF8bTJMXYP8GBi?=
 =?us-ascii?Q?P7bNFkR83C9IyrVM9Qn22fW8EI3yo0uswe6mDHxZJyV6GsnBkVB8uf2ZXdge?=
 =?us-ascii?Q?OJTOUARiSbmlVLmFDvQw7yUcxzFTRcDz95j9fgA6VS+F2ELOede6v2Br8k80?=
 =?us-ascii?Q?pFRReWQmbqFzYw0QKsFtM0R//s4I6H7HZ3H9Fi0LVyoHpin3KOUvETJahDv/?=
 =?us-ascii?Q?TIVJnIiqMWkfg/WtoCUGLIh9vMlTqKa9CY/G5PJWCc3W9T5T35vjJ53DiwpT?=
 =?us-ascii?Q?aXCdUXa5gg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96eea97c-77b6-4c21-e22a-08da4856324d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:20:27.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vw3n+30WXW2bopwFr9EOFECjoBXyvpp9c7aMlh4n0MaaXJVpPpmHevA5h16rFMgsBhOCuQZkqZpN26obroQL5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7840

On 03.06.2022 16:29, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 03, 2022 at 02:16:47PM +0200, Jan Beulich wrote:
>> On 26.05.2022 13:11, Roger Pau Monne wrote:
>>> Add support for enabling Bus Lock Detection on Intel systems.  Such
>>> detection works by triggering a vmexit, which ought to be enough of a
>>> pause to prevent a guest from abusing of the Bus Lock.
>>>
>>> Add an extra Xen perf counter to track the number of Bus Locks detected=
.
>>> This is done because Bus Locks can also be reported by setting the bit
>>> 26 in the exit reason field, so also account for those.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> This implements just the VMexit part of the feature - maybe the
>> title wants to reflect that? The vmx: tag could also mean there
>> is exposure to guests included for the #DB part of the feature.
>=20
> Maybe:
>=20
> "x86/vmx: add Bus Lock detection to the hypervisor"

Fine with me.

Jan


