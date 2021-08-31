Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D23FC449
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 10:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175571.319797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKzWy-0004cK-UK; Tue, 31 Aug 2021 08:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175571.319797; Tue, 31 Aug 2021 08:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKzWy-0004Zp-R7; Tue, 31 Aug 2021 08:54:08 +0000
Received: by outflank-mailman (input) for mailman id 175571;
 Tue, 31 Aug 2021 08:54:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKzWw-0004Zj-F1
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 08:54:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4916e1e7-92ee-46f6-a630-72da02217f8a;
 Tue, 31 Aug 2021 08:54:05 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-YjnYAkTTNje2bA5jj75SGA-1; Tue, 31 Aug 2021 10:54:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 08:54:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.017; Tue, 31 Aug 2021
 08:54:01 +0000
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
X-Inumbo-ID: 4916e1e7-92ee-46f6-a630-72da02217f8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630400044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgeuQQ7IIPihzG5U9FIyFNYN33pFkrsOJM5NqFbgJ/g=;
	b=B3V/HhMfxO4V0nJsjW0mFW+K/o/zNVLy93EFV7AcuYYdCGWOxL42Ftgkr5h1qUSQQ9RJyQ
	oZWksn1QQqozEoYLnP7aCkDsbS+gJtgPOCSW2zK1MX/pByMSicxROOJV47/sdQ3wuR2mgT
	Z481v0MgnNbB2r8OP2uEB7ghVXAuzg8=
X-MC-Unique: YjnYAkTTNje2bA5jj75SGA-1
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4607EA7A49124490CFAAE83AB3CC9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xe5KyYxgE9BVj+PwF41fOXI5gAYBkywjV2qWAlY9fKeUm/TIZPeX/ew2TNDyaYUDJkg52uB0RqECLeVUczw7fLNOvKnBqgzt69coGu4QOMrzrCpSuvUfgUI9huT3YFlXesfy4SLAmz3lbMLMGAu+bQ7MZvrw+tedhOYBd69JMEpF4iKoMUqmlLeMHFsD69efS4Qk3tGvZGKclj/usbds0HSGRjd/0ETryCqGEC1y+lPqXNDdbBr9NS7cfPxwsRl5/YptmBRCBIck43BipjhS6BBbdCRjMku2lD5paZHDEosH/WnHWt4t9Dii4HBupaTldQI26+VzZLCA6jMDZuA+39db8TV9gRJKNwgklV//toDG/E+1CA0n0/cx53q9DccCIZLvmxspTAS/+oY3vDnAs96PXzkJ3sKxfoo50R4F8JyVX3nl69ddHRAx52e9NIvUoBmtKmSH7ZW0dhy0WZlpHHK4oUMjiZ+fnP4bnHPicOxCUnBhcr8n+ywKr7JfwMRQHveAj7ZzeNPBY03ZNoXgxdpzFJ6K8SpcKFAky5LU6lLsrI2d5NIae7ZTTGlzkiRrip8f17mNVZZBEMVrTtN04NNG1P3prMJthrG1GRFoWYeUpRiPCAsHtSrjPhy5G+v3OvAbo5O3jBLfrCvq7IoGwMy0e15I20u426z1nwa1RJXfFBVoMRYWozOXMf2RAg2+ZczSMTR4ysh3bmyYplp0bG9bU4UXr5hAQyg272UlQGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(4326008)(2616005)(5660300002)(186003)(478600001)(86362001)(38100700002)(31696002)(26005)(53546011)(66946007)(83380400001)(956004)(66556008)(36756003)(16576012)(8676002)(54906003)(6486002)(2906002)(66476007)(6916009)(31686004)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0JSZkQ0ZnVQdXI1Q1BuNnoxaWlhWEl4Ynk2YVUyS3k2SFNXaXZFYUhRbGl5?=
 =?utf-8?B?V3Uyb0JicjRuWFo1MzljQ241UWtydlplMmdvUXNVTmNlVUltcUJkNElvR3VL?=
 =?utf-8?B?OUg1UGY2Tkp5cUdBd1p4VHUxVHJjcTRMaFNTODBBWFhGZWNVUFl0STdiR1Qy?=
 =?utf-8?B?TmtMa1NNclhSK0FxdFFnbVVmdlgzckpzWS83MlMrNUUySGdRNXJPeEJSK1Bi?=
 =?utf-8?B?VGMvTUd3WWtiT2xFL09kY0dBUFNVQVlPcWZzd3FhTFBNR0tKUE55a1hoYWMx?=
 =?utf-8?B?SXBZcm1zSWZENUk3Sm9ia0R5N0RoMUlwZlA0MzQzaFpPdkVMMXNQZlIrQlN0?=
 =?utf-8?B?LzJDRnpRVmE1Z0ZWTS9tTDI4VUFhS3NiZmtLVU5kM3A0MDNTcG0vUEJSZFpP?=
 =?utf-8?B?d2N0M1UzUjRPVmxUeDMvSGowSzNUQWZSelZvUytaZGk1c0hxQnBlMDNqeWow?=
 =?utf-8?B?b2NHTU5SOG9LVUhXWkRnN0F2TnUxaUpLZitzYWU5REErdGJBdCs2ZjBLZTVF?=
 =?utf-8?B?R0FlaDkyMDVBdDRieDJLN2lMV2Z0U1VwWmlmVjc0OXlnejBiM09SZXBERmhN?=
 =?utf-8?B?THVLWm0wT0VZNGhYVXRnRTBGWWJLa3pFclJwem1rWm1aR0NwSkRRUmFBRjh4?=
 =?utf-8?B?REozSThaRW9FSithSEhZNWZSdmdTbE9OMm1wdVhTejIzeFBmc2gyTUQvQXRP?=
 =?utf-8?B?dnBBK2xMNkRFekJQbk81aFVOYzBQTHVqZ2JJY1NZbEhDVlY2L3ZZQ003aVB1?=
 =?utf-8?B?YnFGRUxYUHg4S0FHWTM1Y3h5S08vRjJZS0ZWbWlQUUpxMG1IaHNEcU9aK09w?=
 =?utf-8?B?NWJmb2NWMHNIQk53S1hpVEs1SHk0OVREK3c4YkpoSWRKV2dTaVlBV2xXYlVP?=
 =?utf-8?B?QnpOT2dNanRhOEpnWEZTT0lxN3Z4S3ZTYUJrN0ZlUmJGb09iNThkWVJjeDcy?=
 =?utf-8?B?Yi91WDFReHZ5YmtnWFZUSjFFRW1Md2ltSnlrNHFDTTFBQ1gxaFF6M0YzZmhw?=
 =?utf-8?B?NWhnd2UvR29vaGRmdXJtSTNUZlVQNWlHNU5NV2twV2VUNU4xUXpVdzJpS3li?=
 =?utf-8?B?c0lQMEovWHB0akJENjNJY3BWWGJYM21TKzVSdWIvTkt2YWFERkNIQWR4MnNX?=
 =?utf-8?B?UHVESzRDK244M3RUWndvR3ZUSTViUTNVQ25qVGhoUlRScE5QTERidlJ5UWVP?=
 =?utf-8?B?Q0JRcGRHbndrbUI0NlpmTVJJZU5tNG1yYmdaRmw4d1NCdzZ4cmc2WDU2N0VC?=
 =?utf-8?B?NHZSQ0FJZ3l5aDFwWTVJWlRxanQ1K1V1NDhrWnJaSFVZODZSbW1rNU5xeVdp?=
 =?utf-8?B?NC81ekpjbUhhZzhTZERnKy91OVc5TG83OTBvU0wwUkVKbXIxck40d0RmaGlk?=
 =?utf-8?B?NTdhQ2ZnUHRSS21xUG1rVlhjR3hvbkdhNU9GVlRLU20veVc2bnh2UGdNUGRZ?=
 =?utf-8?B?c1crV0Y5dDM3YVkzQzNmeFB6UjRRNEdmN3o4ZnI5c1FQV0Ywd0RQYndHS1cw?=
 =?utf-8?B?REY4UmJNNHdpeHNaZ2ZtSGpSUlJQNGFpUmZyU3BjcVRWSGZId1VzSzNxMmMr?=
 =?utf-8?B?dHpxL0x0RnlrejZ1MjlsWE56VWdjNlc3WmFDbFFDTWJaTU9SMGlTQXFhZnVo?=
 =?utf-8?B?OGVMRWpYVTRmTU5wVEpmZXRRbXczNE5XcmFXZ2tFZnNIeU90TTU1R2ZsaE9V?=
 =?utf-8?B?R2xXdDZKUWpBU1Y3TVdYMzdoOCszTUJWVkZWVXg2djlXMStlRE1xRGRlZG5k?=
 =?utf-8?Q?hS5X+/JWrRAGSP8IBEcWHyGu+PY9+1Fc3Xlxvlj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a6739d-c336-4da2-1edc-08d96c5ce0e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:54:01.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mHtd0Y6W8VT3aAA7+rjIMZvUJRLkCCyXCAPISUk669lDSHby4x4yQ6XISumkvwRTYdjOHFFQYRhJfQBYp2cJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

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


