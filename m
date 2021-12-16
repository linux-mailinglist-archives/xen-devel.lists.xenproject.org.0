Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39AF477956
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:39:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248080.427869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtlq-0002aK-9e; Thu, 16 Dec 2021 16:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248080.427869; Thu, 16 Dec 2021 16:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtlq-0002Xc-65; Thu, 16 Dec 2021 16:38:18 +0000
Received: by outflank-mailman (input) for mailman id 248080;
 Thu, 16 Dec 2021 16:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxtlo-0002XW-SB
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:38:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90dabfd2-5e8e-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 17:38:15 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-dNV_sfdJOlOKnHSYONrufg-1; Thu, 16 Dec 2021 17:38:13 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR0402MB3780.eurprd04.prod.outlook.com (2603:10a6:208:f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 16:38:12 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:38:12 +0000
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
X-Inumbo-ID: 90dabfd2-5e8e-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639672694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9fVBrIu8Eyy5mI7mHuVMZhP/7KqArnv20cCL6W0zP0=;
	b=KwmnA68wJPxQCVnd+ZU3KaTB1xfcDkFs1FSLNAF5fnVh+Fz1fLANrfWfl61M1ymYF0q8Gy
	8mVY7pzRu3loNSwRJTg8F9hbrtDLEPPhFsJT1xE32WTg1JaXI6zTt+aBMrVduWM4YvAz7y
	J3nu70Bfis1KLTmNWJnOnTLEFbkhRoA=
X-MC-Unique: dNV_sfdJOlOKnHSYONrufg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8FD3GVQ5MvkNb8CRhaNKAms8lWvAuci5gCtIe8wyXLwSQL6c8kRT+G8LJCjEveJY2Sgysz3eZcM2y/h8OEdexn29cqOks0MuXVeg7bJgeFXy/+1ny/Byu4TCMrY8gWQeBrA4pi9Z35KkVst6CkLWDXh0uYG59ggzKjH6KnydbXxm0bCrKpIKVnYdfwzR/Cr9XBnWYKvZmj7K+k0w4+sJGU4eKHo5WA/EK/T4PjtkGyzpK87FWmMyWT1hujmyffV40NktJpVJBUxLdOV1Zz7fmRikbP4Cz7XGxIiov/pqlLueVXvf6LdIaGi7W7qY7z/FkeGxloKxdemHwyVQqtt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9fVBrIu8Eyy5mI7mHuVMZhP/7KqArnv20cCL6W0zP0=;
 b=T4zXE2DbRl6rr/V4CMGijAQy8sHAEFou6VsUE9db6zXSPK6IbFT5BDVs3i8XhwoKmns7tHAZKrsHZ7CEbA3sL9KqkwUGrnz1U9QAvTNWrGktRhvt1mnyDPq99tPqHy2/KW1XH+YBBTuzaOG2MW1t4d2e9NkUcin8FaAZ8nkHNZTy4cuY06/TooXD6f3u2EwZLBgVCgK97Pn+SfGxqoF9wHdH2LVsWb1EP1k5eisCRJUJR+HRFr+iDj3DDfyIGOe3l0rB+ePY8dYAhHGfoLJsSIrcNQUrbE2Icn3bqzyZ+bwD6G+RaZ//Q3RSE20lhGssLAlb9Qezu/i72mBiwcUxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b95bc243-c4ca-824f-1812-1f0a74e22193@suse.com>
Date: Thu, 16 Dec 2021 17:38:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/4] x86/cpuid: Split dom0 handling out of
 init_domain_cpuid_policy()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211215222115.6829-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0147.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::19) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37789c90-3a1f-4b87-dbe2-08d9c0b27342
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3780:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB37808066C560E7A21FD962B4B3779@AM0PR0402MB3780.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	15p2kZYuwVpGqd4MHGkjF98wgonHgSfdsPHb1tREX0riOCGaeFY6z65rncOOwIsGL3Z52VjtZhcN187k8g3EPYq+Tdc55mdiSKJN6TuzyhisOHx4t49qO8ny3RUF07TO9lLsPorzTX4CNCW9j4ezrRn0Q285Q8RFgLaKS3m0SwZGEIqazjg1DRv6RaoDIzLrGQTcbrAa8p5XTrV+caCIdDvn+4b8v6HfcDub8gliK8qM//Wcu6cagXbeZxWdBXsDFsryHiNi00PIGSFZjb6s7UastpsMeUhCW+9qqzuXrLPQyWdtDJ13/Q8gQUQdmRn+ek0ziFnGbNaQCsCBT1J3ASjWBDC5XYSsU2kwV5Xycq/oJhPlF4dJqdKzHBurMjXFpqfSDlNCQHsHGmpz7t/1nHAxHGavodO189PvE+fHdmSnfObb1ydz2biPLImVvPIfmCSPi5guQE/tpe0UHlO9XZkT1+yr7nz/LP2Im9AFhHkHZx8cs2S8LZTPisxwAjYD3N5Fdb5PmRO+YqU4V4jjLII1xgGb5Cs0RqE0MHdzvXwF99Z9nk5DRb1jZZZQ9IDi09vJ0oco+XPUvs8jWCx2m/lAi12V1aM7rzv9y+u/zdiY3nSRdgcBxXwKa/i2VgGgqGQdAyoUNfKxyzc/M+8/ajrZwB5AA0BfvSeVhoJsF5BFbt4jDCMKIofXBQ7ouqcc5AouRXPFJfuo58zUoZhacHRqE5VFrNvqxmxdxz+UukK7WHPUBVTi1DbnWsL0OQJ6I23XkUGMPfAPwujui70ma/cNYUayAoB6HpM907UoVYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(508600001)(66556008)(66476007)(2906002)(186003)(6486002)(26005)(6916009)(316002)(36756003)(86362001)(31686004)(54906003)(31696002)(8936002)(6512007)(66946007)(53546011)(38100700002)(8676002)(4326008)(6506007)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTloSmlidm9TQWlNb1BwVUQzMkNST2pXcmtKS0thZERtUy9yT1pwSEtuSEpC?=
 =?utf-8?B?QzBUQ3A5cWhKcTJTN3dVQTExUzNSMkNGcVViQWZENWRQUUpLYVZ5MFRmZDBy?=
 =?utf-8?B?SDl5UGVoSEJBL3ByWUJMWUdHdUljdm93Njd0UTBRUXZZQ3E1eHFvZXc1OGpU?=
 =?utf-8?B?blIrMDhHTmE0OTRuc3R1bEVDTGlvalZtaEdNcnFJbE5QNHVYQ3I4ZElzU1Fr?=
 =?utf-8?B?NmF2TnpRVHBJZ0lLRUxobDZCaU91aWJuQU1nUXdLdE41Uzl6RGowWWpxMUZm?=
 =?utf-8?B?MDdHWDExZEU1N1JyRHdYSHNtdEI1di9paDkvb3JmWm9JZk5nL05pcS9sVHdJ?=
 =?utf-8?B?bGhkdW1yZFVmVytkZ0lwL3M0c2pGWWNSUDY2ZW5uSVh1azBxV3B4ZkwrYXpD?=
 =?utf-8?B?Zi9SOXd2TDFSZlB0ZnY4RExvWmZ4MXFXMUNSWXRUTTVFWnJlK3A0SE9Od3Ro?=
 =?utf-8?B?Vk5OTDJJRXZtZFE2ak91WG1PKzZGbUVPVjU2ZU4zOEtmNmNZNVlHSWJNcGky?=
 =?utf-8?B?TlpadXVpZGVTdXFsNFA4dm16SHRUQ0psanlqdzlpS2hTL29qcVFkZE1wOXJx?=
 =?utf-8?B?MzlaT1c0anBPeXI5YkNRMTEwTHRMREpQa3JMSEkxc3EweXlxZkJNaDBaZjVS?=
 =?utf-8?B?bVRhT3lOWDVxQWNpNHN1citTRnpIU0pGRTdYMWxTcWxteDVQUE4rTGN0aWp1?=
 =?utf-8?B?Mjkxc0d5c1FUdFZpNHd5d3BISWQwWUxDMGVhM0tZOVBNQjQ3ZDRWdWtaTWwx?=
 =?utf-8?B?WVZFYWp5RWhOV2ViNEp1dlJNVWh5MmFaaU83MlFWMmo1SEtvZFpFMWtESGIy?=
 =?utf-8?B?bzBUZVgyUVBRdUhvM055WDJ6VHFia3lmNmNISUxqTE85KzdZcnlmOXhxYWFm?=
 =?utf-8?B?eEx5M2pZM3lRYnJLby9ydEVOaURpcHJhRGFjdE0zc3FaVHZ2Q285R3Rmblp0?=
 =?utf-8?B?TmgyMmdIWmhKS0NJREJVeGJJZk1PRjd6WDZPSEhLT0xkWk5ncXcrNHBKNnpO?=
 =?utf-8?B?ZjVzK0x4aGFDdnhwZDd2S09oYXg4NlZOVzI1NTNjNTIxampxRnBJNDVuN2lx?=
 =?utf-8?B?YjUvUHZJbGVVU2VrVHZTRUpjME95RndVRUk5dGF6TU55RkQ1eGhiVWtOMDNo?=
 =?utf-8?B?VEdPM0VnLy9HYytJak9yRm1mTnVTVHdpVEVqenJraXBtTnBIc1M1dG94WVlS?=
 =?utf-8?B?bC93Szd3b0xmNGx4MElWY0lJN0NFLyt4YjJLWGdaby9nbXg3Z3dqNWxzTk1M?=
 =?utf-8?B?bWF6amdsUWFGNG9pbXVPUDRRUDNyaGVrRzBsZmtzSE9NU2Mza01STGxQN3VD?=
 =?utf-8?B?eUZ2VnJjNVZnSEw5eGcrQ1k5bUFFNkNscEM1SUVnYVR6ZnZqVXFDQmNHYzFj?=
 =?utf-8?B?M3BTM2JLSTZLeC9Fa2FTV1JIWFloRzZIdHZPbHI3bUpmZUJRWHVYYzB0Y1h5?=
 =?utf-8?B?ZDlac2NSQnY5SjJyOVdEZU9Qc3lFU0xTSENOQzR4K2RCZ0paNXZwTnZqQnJW?=
 =?utf-8?B?aDJRTXZlS1Q2MkUrNlZDbHBPOWZtMUxwZlFnOWxxQ2JKYXMrUjJWZGZ1VFl2?=
 =?utf-8?B?TWNMNkJFZUxIb0hZekR3Y0dVNFh5R1F3b2RFSXpWaGttMjZqcXgxRnQybEJP?=
 =?utf-8?B?VDZudFpOSzVkSzZMaVQ0cWhRdHZjcnZLcW1vdm1vYmhrWEU1QW1NaDZIN0l2?=
 =?utf-8?B?dmdUSlJKb0Y5Sk1ET09SVUNxWWNQSlIxNHZReHA5UXJaY2NwUnRzY0JGOFVJ?=
 =?utf-8?B?WXFrY3hkVVRyZmhzRG92aGFWdVk3UXliVFlDeGIzR2ltTG52M2NOa2svazho?=
 =?utf-8?B?QXE1ZUl3YmZIaUJhSW9YYW5iV3JzNElvalp6UEhCY0daSU1Pd295bHJKZHVX?=
 =?utf-8?B?K21NVXRXZnZRaUlCTU9YYlBZTzF6eWEwNE8xUlo4SktPRk5sQ1ZiQzYvK2Za?=
 =?utf-8?B?WnhFZ1JVcitvSEo4U2EzVks0RFVXNUx5MEFWZHJORUdCUmh4cmVkVGk4QmJE?=
 =?utf-8?B?eDhGVklQR1c0TlFCbGNUbXZhOHlQSVhxZzd5d1FwMXcvT2Vpd013amNUUkhD?=
 =?utf-8?B?bEZ6aXBOWGd4RTZOYWx4UzlROElEVnNYYTNmQlpVSk1tQXV1OHJZb0ZVeVpL?=
 =?utf-8?B?ZHBvWVBVbHVvVjhnTjBVamNKLzhhVk9lY2VSdzZXS2l3VHkxOGcvZlcxd3RH?=
 =?utf-8?Q?PcTE0TuDQJSC5G1ycrPL1lo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37789c90-3a1f-4b87-dbe2-08d9c0b27342
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:38:12.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXaUpau4Gd5ev5ylbCv6ZozeuWiE3cK5niD1Zb12I5UL0wBx/1IwEgkgJk88f2BGeB7YuSjCiV0Q7gzo5EGcWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3780

On 15.12.2021 23:21, Andrew Cooper wrote:
> To implement dom0-cpuid= support, the special cases would need extending.
> However there is already a problem with late hwdom where the special cases
> override toolstack settings, which is unintended and poor behaviour.
> 
> Introduce a new init_dom0_cpuid_policy() for the purpose, moving the ITSC and
> ARCH_CAPS logic.  The is_hardware_domain() can be dropped, and for now there
> is no need to rerun recalculate_cpuid_policy(); this is a relatively expensive
> operation, and will become more-so over time.

Would you mind leaving it there in a commented out form, hinting at when
it may need re-enabling?

> Rearrange the logic in create_dom0() to make room for a call to
> init_dom0_cpuid_policy().  The AMX plans for having variable sized XSAVE
> states require that modifications to the policy happen before vCPUs are
> created.
> 
> Additionally, factor out domid into a variable so we can be slightly more
> correct in the case of a failure, and also print the error from
> domain_create().  This will at least help distinguish -EINVAL from -ENOMEM.
> 
> No practical change in behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably with said comment added:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


