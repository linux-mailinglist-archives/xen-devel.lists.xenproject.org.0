Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98193FC448
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 10:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175572.319808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKzXD-0004wb-8W; Tue, 31 Aug 2021 08:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175572.319808; Tue, 31 Aug 2021 08:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKzXD-0004u9-4o; Tue, 31 Aug 2021 08:54:23 +0000
Received: by outflank-mailman (input) for mailman id 175572;
 Tue, 31 Aug 2021 08:54:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKzXB-0004tY-LT
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 08:54:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb0c099b-7c2c-4e05-addc-99a648fdac32;
 Tue, 31 Aug 2021 08:54:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-EIIfp41lMXScMBLC_15Oqw-1; Tue, 31 Aug 2021 10:54:18 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5585.eurprd04.prod.outlook.com (2603:10a6:208:133::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 08:54:17 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 08:54:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0210.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.22 via Frontend Transport; Tue, 31 Aug 2021 08:54:01 +0000
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
X-Inumbo-ID: bb0c099b-7c2c-4e05-addc-99a648fdac32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630400059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgeuQQ7IIPihzG5U9FIyFNYN33pFkrsOJM5NqFbgJ/g=;
	b=OadSjTijD8UK8DNHcq9xgf03RCg0iL973xm/HOs7Mi+GHU8fvZiRwEDSIvCBlRW6a3qFej
	h9ij8mOjs4sHWvl7+Syc9SDt9l27tQxiQEK0GdXUvCOoVF+aXglFUpugcYRtfLSASXsnUx
	LWMl7VrTAVwOm59P9/DRTpQk2foB/44=
X-MC-Unique: EIIfp41lMXScMBLC_15Oqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPi8jQOmty7KQ+1Pf86nF4Q+b1+9VsIUvnCtlt+W0BZwYq28wmiyarvqV5RlomqbcsDAR1+nEN5tZkvgI0WPMoOd0nIc1bfnFS4QWfHPrnlbd8Rrt0CO1ioKqT22QGtMo4mLB1CBv01YOyiIriGtyrf2D5IAL4VXcgdy18yBf79y0z8ECGWmfp1PY4dGttHu1uanmgemvhZIDXtlaGO1ULolGgHCJpOh6rPeHRhCD4o5noYoTkQeU6vyVzbHdMhHVTNn1TGnm4M0cSLLrzgwrGTnP59thVzrpWbn83FNO6BjqAoDv6aMFAAFvq0fNUAsV6PXmRmVEBP/rlW2xZHjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgeuQQ7IIPihzG5U9FIyFNYN33pFkrsOJM5NqFbgJ/g=;
 b=DG7ShmEsJjfd8Aav9apFNjFV+RdtfDyUIcDk2Rmg3ZlnQ2+DobUDN76qCZnG8y4WTVToCL9B2Fi6/hBN65Gp9ioPZ1e+fWpS9X/6UQyihWmguYrRwGpzjwFpNX7RxDKGJUXAcMj2jAVA19DKcLuhPUA/udDzTd8eG1aADJ1bDo1qzZvpRhRXyfrO/iOje6oy9KAu+8Dahp6WrGLeRvuxpir5BioEZyN3JJ8IH7EZ8rDJ20ReaG88pztP1OjeN1ZJaY7jBCbC4rDK8ywtDBqxEmUDfnA1rV0ynsbR1Ue2m+QKLyL+9YrWczySz0nNJJ+7OkD5QPSXJH01yxl3ErPNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Message-ID: <a2b8421d-e608-2abe-b78c-924ab0bf529b@suse.com>
Date: Tue, 31 Aug 2021 10:53:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0210.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a6739d-c336-4da2-1edc-08d96c5ce0e7
X-MS-TrafficTypeDiagnostic: AM0PR04MB5585:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB558537728E6B711120AAAB20B3CC9@AM0PR04MB5585.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HVwoGkR8ydd09qL7FOsYJbqWrrElh5hhsR+dSmGiXC9mp2BKbHupYpiYXJdseDQMI+b8VgxiGiicO+fB01OcIYhWQju373fvC2l+3rCe3UkNHSBu+NiwlgsPlopr1SaO8GXlYZ1FKSsq4xE7CIG703olZUde7y8mRiMxmqODvueKJ/6rfQo0gVwpIRY4tDXl7YyG5f208mS/YML7Ix7f8lMeqrj58ZaYU7/5MXXtOm0Kpx76iOKzN8zOEKOxBExeIx49c3gmIQIEx6FjVTmTkpnDLmvIvKPmC3mqSTyaHLuhQ8DHJm3IJyb8Wzhqtf8O7Hpk41TqOpge/a0D6sEktTwVigY6EXl+H5nSerftLGN6sd5NTocHBeK0GVzqBsi7wdKJsnGnuIjgRrkdJW18wdwBzvtLOtZzgiTp/7PUMxh6n8N7Uk9jwtui5AnKRwC0IGsExgx22zZrfB0Jp+zIskdI4VDojaDhyTo2msxAAHFRtaXA3ja2BFcQwrv3Da8sUmrQXyn0uCy0S6IubjwV5vwRLzSGOCwzsGLCfiVKwKlNFe5RLLd9UDI9bMTX/tUVZJsOLNlZt2U8s+0wG21y/UsqvSuL6ENcqJ6oWBqSegd8MqZbA6POZtDH46gjru3h+4vY2wffo3TNefv5YN5xY9HBSC8pMh8RyzOk6PaGVFTM8FMRSdhhD1+xVVIHm48dlg2zJdE/NU10CAiuXxMOHvgTSOgQrNk60VeSHOhTKGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(396003)(366004)(346002)(136003)(31696002)(16576012)(83380400001)(478600001)(66556008)(66476007)(38100700002)(31686004)(2616005)(316002)(8936002)(956004)(66946007)(53546011)(54906003)(86362001)(36756003)(2906002)(5660300002)(186003)(6916009)(8676002)(26005)(6486002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmxsKzVRWkd1WFlNQytWQ0c5dFA1dnpVMXJDZkMrMmZudFZLdGFGUTJnMHJj?=
 =?utf-8?B?MjFtcU1XeHdVTHlKbEgwZW9sTk90YmNna1BaN3ZjSTBia3R5QnU1QUhqUkto?=
 =?utf-8?B?cDBtOVNqbzdCR3kzUXJhbHZ0ME9WcDdyYmVoSm5WZXJ5ME01ME1CM0FQN2Fj?=
 =?utf-8?B?WEhNNjIwTnJ4NFAwcW5vbGxROWxIM1NvcUl3bTBKOUtBVEgxRFRKcHk4bWRw?=
 =?utf-8?B?cHVVVTJ6Q3dsS0lCQWE0S2N1clNLZlJNelhseHdUWmlkLzNQRURpVFcyRWwv?=
 =?utf-8?B?VlJMbXFFK0RMMVdWV3NWTkw0bnM4dFl3dDlEMk05UTQwU056MDJVSU01dTlq?=
 =?utf-8?B?TUxFS2RSaFRNNEVrbVByYmZHL2w5YmNTQ251cnY3cGVrWWxFd0J6R0lpSWJX?=
 =?utf-8?B?U0xpY21ZVGxFQUlBYnFnL0VJbm9acU9KaUVmUG5PQUlQZlN4WmxTaFdyK2J2?=
 =?utf-8?B?QS84SkNoT2lPd2l2WVVldXUvNitHWjBTdjZ6cGZ5b3V3N3RaWEEzeUtMelQw?=
 =?utf-8?B?M0FVejJDalpiWVgrYlpQRkFkR3BtVE5TU0lVRkxpK29FaUR1NjhtcXh4WDdF?=
 =?utf-8?B?di9kM1BVbG80Q2JhVE1ydHN6L2N4ZkVMbnlxTFM5cW9lN3M3bnJjakxLODBC?=
 =?utf-8?B?bGpTSERzN3kxVERpTUE2QjNZSFBBTjE4K2EwZ2tvM1RSMmRQT1pBM2wxbnN5?=
 =?utf-8?B?UFFPYmZvK01URU9YSzV1a0FVK0VNRzNmRlNOcTFNdHRxdkpHQlBXdmU0bjdw?=
 =?utf-8?B?cVRoTW83Q3FIdGhWQXRZRTdWTlorbVJONW9hMERvVk9YaDFlU051TUh3dHdK?=
 =?utf-8?B?T1M4a21BeDZxakVITldnM2F0NUl0SnhvOVQvYnp6eGU4VVJhRzdPNWxvNUdN?=
 =?utf-8?B?RWJwMnJwc2pCMEowUWQ3Ulhib29lQ0k2Z25HNGxwcjVqTUNhdVJITktvbE1t?=
 =?utf-8?B?YVNKTkFUNXppTmNsdEFnMURuVlpjRUZYSTEyQlRpNFM5cGNMSEJGQUZnMXdl?=
 =?utf-8?B?cUwxT25RMjBmZ2lsVUNiL0htRlUwcEVGdmQ0dHJ0OWlnOERLMkVET0pLYW5y?=
 =?utf-8?B?VitsUnFyNTRUREpSOWhiaXhmUENCT2lDNnBoQXNSQXFOSHJEUXFmK2VjMFht?=
 =?utf-8?B?MjZyUU5PaGlJRUFMb093UnpUdjJNdWNPNDlHa1NLWnZEOCtuMEsxWHlScG1N?=
 =?utf-8?B?WVY2UFFNT2U3V1JSN2trK3RZdjg0djNEemRaNldNc21XeUM3TlVKS3JjVFFD?=
 =?utf-8?B?cHdSMXRhck1IRkNIcXRZbHhWWjNzYkxUZGJKUDFvQUtiaGg2dGFqemVSZkcr?=
 =?utf-8?B?bDFVWFZNeUpBY2ZHQnJNRnY1VkdGelZreEtOOUY1UHY3K1E3ZDVNVW5PVGFr?=
 =?utf-8?B?eWwxUkVkWTZSMVRUNGJ1WXRWWnpuTldYdFVPTnpiT1dWeW9xTjNIeUs5Ti9a?=
 =?utf-8?B?SE1ZcER5d2tTL1JaWlRuajJuQUVYZ2JnelV0WXpnbUpSNkYxV2EvZGZ0M200?=
 =?utf-8?B?dVArOWZkekJhbVEvRGFxZ3I1VkRrNjBrYklvQ0NPWnk4VGE0UFljQk94a0xB?=
 =?utf-8?B?V2RmZlovZHFBS0hGUW5ua0xnT3gxVGw1ZG5NcjhQeGd3YUY2ZitqcitzOWR2?=
 =?utf-8?B?aW14Q0tjcTYxR2h2c3lzWUdCd0o3SDJWWWNkc2NrcnhoamJkVHg3MHdKblgz?=
 =?utf-8?B?V2FKREdnRWtGaWl4c2ppb3FZWDNwSXNMSDhBZWhpNHdUMDNMalBnY2w3S0RJ?=
 =?utf-8?Q?q3pOSvF06qgacZZxcq7TNQvPcxacifSQmmtJajW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a6739d-c336-4da2-1edc-08d96c5ce0e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:54:01.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXhmzQgT1RIH53Yak3DYNyGzIdsLfnAf6oGRM8+YoMYBsnMFC5d6WHyDo1ap2BkW72WoBZKvHwEj1UUrAS5ecQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5585

On 30.08.2021 15:01, Jan Beulich wrote:
> The code building PVH Dom0 made use of sequences of P2M changes
> which are disallowed as of XSA-378. First of all population of the
> first Mb of memory needs to be redone. Then, largely as a
> workaround, checking introduced by XSA-378 needs to be slightly
> relaxed.
> 
> Note that with these adjustments I get Dom0 to start booting on my
> development system, but the Dom0 kernel then gets stuck. Since it
> was the first time for me to try PVH Dom0 in this context (see
> below for why I was hesitant), I cannot tell yet whether this is
> due further fallout from the XSA, or some further unrelated
> problem. Dom0's BSP is in VPF_blocked state while all APs are
> still in VPF_down. The 'd' debug key, unhelpfully, doesn't produce
> any output, so it's non-trivial to check whether (like PV likes to
> do) Dom0 has panic()ed without leaving any (visible) output.

Correction: I did mean '0' here, producing merely

(XEN) '0' pressed -> dumping Dom0's registers
(XEN) *** Dumping Dom0 vcpu#0 state: ***
(XEN) *** Dumping Dom0 vcpu#1 state: ***
(XEN) *** Dumping Dom0 vcpu#2 state: ***
(XEN) *** Dumping Dom0 vcpu#3 state: ***

'd' output supports the "system is idle" that was also visible from
'q' output.

Jan


