Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7891D7495DA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 08:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559628.874768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIim-0005X2-7C; Thu, 06 Jul 2023 06:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559628.874768; Thu, 06 Jul 2023 06:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIim-0005Uz-4F; Thu, 06 Jul 2023 06:44:08 +0000
Received: by outflank-mailman (input) for mailman id 559628;
 Thu, 06 Jul 2023 06:44:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHIil-0004zI-4S
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 06:44:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe12::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80b0a40a-1bc8-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 08:44:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8145.eurprd04.prod.outlook.com (2603:10a6:20b:3e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:44:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 06:44:04 +0000
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
X-Inumbo-ID: 80b0a40a-1bc8-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdjhvDArecvF9rvdUcaBCxtJV9GlAZ1QMKblbnHCfEW+X+xOH132E7YV7PGsWp0M3JNOVdmZaXInXyU1/WHTFW+gHNY9qDoj6Ki+t4mwJ+2EuVHHMW2eHfsimIH8y6OdRbT8xl+obLLkYn2jw7YmLLh9tGZd5cOOrs+W2Z49s7i7vT6KXi7B+4Rpqfn8AjGtcmog9bGK4vZH5Vw+jdP7AIVDD8n51XDIRcAFGmR6Ygk4hKA/donISgGEOJENglbjtO7smatHDe06zyzrGGjASVCvtxzKjDI5fI+on+kCeDtzKYGMvzF2Pnf1TugAxosPv7jt1HfzTb38KSEcO6/05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvTXt4pOUkcAXx8fS3hBkQbH2/Hl9K9RB7E6QAy7dDI=;
 b=NNz8LKyqLwXoXuAYbtqvQewu0A5huDxkp5mQ9nl8kMDNeW4PEHCWdbskVXu/IFq4mit2wJzNgAwAqjaxQ/FdCH5anOOjbDK4dRRu1dm4njKroDjiDvkwMf4L8r/s+zNepkFGsaTENgLUq3Mus2el+Mym+SLt9r0m7hOoIkrmuGdHi34d9BZugnMQE/88hxxeY/Kfoc2lxMBFEAPtqf1miwSSQIOqSiLg0n4h4TsAY6P2+A+yN41vgkoKfvpPj8DbOIFt9IuC+QBl41qx5TT7ish8BX3HEXpNhoiOqDAG1cpEO/3UgLdiJ5scpC4ODAG3dwkDLm65rAaGGfx2WVm0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvTXt4pOUkcAXx8fS3hBkQbH2/Hl9K9RB7E6QAy7dDI=;
 b=ZKpAOLni+uIDW9Hd6+1hYy4E9/hsLZ7T1LOk7My22wQgblswYwYsc2ViSQ8nPp5E7z1wNKMHVkEA19HSRQg7/UDXb8ErExhnAu1qTZMsFoBQs8jNh/W2zOV1twHzxCuzqocuDhrdNXpdq4cjvbsx6L0b7HTVv/alNG2fSgZK6WEP8m83fHdggZAXxZuzM2c6iD5ezqFXvO2+hMfWBM0qYXPLrAXvxKKKnTQgos86I68aff3Csaq1KUJ9VhtnJOos/mqURg6Z1g1y7rMKoLtQsz2yuyG2Fzq3XGM6VZkRJx6h1aNJmt0I1wdA3PPZKe7ehZpMrKDLqKyKe9XWaR6UWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dedb7736-3998-991e-d3c4-c830ac73b3b1@suse.com>
Date: Thu, 6 Jul 2023 08:44:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 5/5] x86: make parameter names of function
 declarations consistent
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
 <0076f2d6-03b7-0a1c-c423-1f55b7195407@suse.com>
 <alpine.DEB.2.22.394.2307051550070.761183@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2307051552080.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051552080.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e92fa3-2093-4ed2-40be-08db7dec640d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sFynyDEqIl4ac1awnuvLBHWA6/KTrkuPL1cESmKDEt5yMRtY5LE7grWFw/0KTeFm1VlnCgDMSP0sOORHfm1EqTcP4j7zHwb58asEgSvEaAJeAfB32g1KlmwyixNKxTJxwvzDtZe58G22cVR6n0x6hoL6yevxHtV5kwcT/SagJmAvUZZ2e+sC7hQ5e/B0N0Ke3wNbJpzeIKaKMmEp+Vs8i2czjp9Wisj1Fe/LOSZSBAFtaW7g9j/9AEct0qKixQgXyncwJyF+G0QSfwgMmX/X+rTpFqfWhuK3WcP15J1Frz6GLs8kjbP1btP5DCmhgvE1meo5NxrFobOEv2S5hd6tDCtNAnQAJwwRnMTXynNkcL8wJ1mhrbke8YYJrN/FA7hRuD+5nS6TytaQp68BV0X3KfXYPxL6qNHWpdVCAuAQ6N52e1v3j7c3ZSrrmqIUGYXlDbldw1BAoxkQI8bi2BQI9xYYon81af1YBNjvDcfMpt4LMVDkE95+E0T7qTbMysAlGBbKYPSJ4eYUtXsMiMok6agivTmdP/MLR69ErhK31KKETP4kMHL3j3Vt0RwjAvel/HPlE2OFBMqmls0M2hFOAbkz6j+ljEv6v2qmSfCXp017W+axFCzPd1GBRdzQdhVm55/MDq6M83AX/j09swv5NQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(31686004)(7416002)(8936002)(8676002)(5660300002)(4744005)(41300700001)(316002)(2906002)(2616005)(66946007)(38100700002)(6916009)(4326008)(66556008)(66476007)(86362001)(186003)(54906003)(53546011)(26005)(478600001)(6506007)(31696002)(6486002)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkdmL1p4dUk2KzBEMmgrbFJaQ3hSVTdQaWlaYmdJdEVsNGpJU3E5K0xEb0g0?=
 =?utf-8?B?RmFXbm1sN3g1TmVhUFpyL0ppWVpHekIvRmNwTkwzNzZ3S0U3MEdndi9WSUti?=
 =?utf-8?B?NXBSc000WU5KQ1hGT2hhVmNGRktxays2U0lGM2JEbHRqdENzc0phWkJyc0FJ?=
 =?utf-8?B?c3RyOEJIOHVMU2U3dC91QUtpWm5Kdm1sa3h0ZXFGNDRlOHYzVWpYMzhWNTFP?=
 =?utf-8?B?Mi9ibk1pM2xGYlROU05DV3psdVY2ZThuYk5IU01URVBOR2xYY0FKUEZkc0RH?=
 =?utf-8?B?SWlKQWMxVUFFVEpVKzVFUEZaekkvVXg3UFBOY3laWlVtOVczNExDSXVYRElP?=
 =?utf-8?B?QXBkMGt1bCs1YVhNMGI5VWtwZk5ETE55b1crU1FRRndzTWoyQ3RmL3Zhck1Q?=
 =?utf-8?B?UlV1K0UxakVQdjIzMUp1TWhKRjVheWUwUnZmVG5Ja1FOWGErclJpRmZpTkhB?=
 =?utf-8?B?QXZONkMwMStCNjY2dlJMSDZTeHV2RFRsUHR2UGpXRTd1N0xHQXFEbmN5enVJ?=
 =?utf-8?B?VUhkNHgzZmlQN0pHcExDaG1FRGRBQjBYZFA1R2N5QS9yUkFDYVoyZ3NtbCtW?=
 =?utf-8?B?VnJaRGZmRHJicHZoWTQ1LzlSL0tDTko3YnBrcmhiMjFWY2hMbXB2Nlp4TW9F?=
 =?utf-8?B?ZVdNZXlLUlpRMFJNa0JIYXJoK1VlKy9vWG9qRlg1TmJSdS9aZ2kyMUdVSW5V?=
 =?utf-8?B?ZTlhOTByMllXa3dMallpTlA0WG10Q0ZCN2pvb0ZaN0VjNW4yRzZaZ0hYZ3VS?=
 =?utf-8?B?MVlXaXVjRXFlWFk3WjUyeG9OZUw5RDdYb1VaWS9IR2ljY1h2UDBidUxxOFpN?=
 =?utf-8?B?eU9LTWpYb0xxVDV4Unc3RWxiWHRxdVJQSXZVOVA3M0haUUdGQW1VS1BjdlRK?=
 =?utf-8?B?RE8zaDgraVd0MXFCeTg3czN0dVQvTTFnUEU3OG1udG5QOEUxalJVTllvVXdu?=
 =?utf-8?B?UzVDbktPK2J0eEppcnRXamJ6anhzWDhjNHJWbDdqQVQ5T20yTzQyQm9oZ2ZC?=
 =?utf-8?B?Q2FHTytXcXJGdTdNSVFzQkU4KzYrcDU1WnNOUmlJU2hNb0plOUVBQW93WHZt?=
 =?utf-8?B?MC9GVDVPUDVEWTlCMHNmTlFjK21NZElpamFteTUyS0R4N28rOWliZVM2RmFM?=
 =?utf-8?B?UjRjYkxHQWxxcGRoZDljMkxvZ2pwVjBoc2ZFcmxUd2xoUUhkajZIYnpPcDVn?=
 =?utf-8?B?cVRadk9ML2ZqNXlyNVRielVKdktWWjl5eCtib2IvUVB6b0pFMXp0OFo4OThB?=
 =?utf-8?B?ZmtlRndTT0J6Q3RPcHl2R1FJNU9lbGg0Sjkwb1UvS0ZnbEdxcURpMFRkTnpR?=
 =?utf-8?B?cC94cmxqTXh5S2lQdWhGK3JEbFlFbVNPQWI2cU9aSkJBbE1TNElDd2UyWUxx?=
 =?utf-8?B?c0ZGRXhYTmxQVEdEYTZPNEtRYXZOWmNyS0M4WnBSV3hBYmQ2dm5SaFRDV3Nx?=
 =?utf-8?B?MmRzbUJvZDZTNyt4L1hlQ1hsTjFVSmR5Y2xlOTBaZzdEczEvNElQM2ErUjFU?=
 =?utf-8?B?STZ2NE95WlljbUVrdm5BeTVvRm5XTnJXTlZoVngwOG5rdXk2bjFmYzBFdFM2?=
 =?utf-8?B?TFlGRHRqeHM0QnA0a3dTWEVZcHcyWFZYRmZMN0ZwcDVOeGVKcTJSSGtSSHZy?=
 =?utf-8?B?NlJPMDB1TnZUR2dVMWRjMGVNeXZDeFFwbXdSVzdZMyt5OTY1T05xb0ZJdk1w?=
 =?utf-8?B?NldGbXU2d2RzN0t0VytpaDNaVWdUQ2d5ZWpQYTFGQUhEMGNJazBTYnRmVDVy?=
 =?utf-8?B?ZlhJUFZUeUlFSGNvQVhuNlZIMnV6MTMrOFByWEdwckh3NjA5ejIwa0ZmTzkv?=
 =?utf-8?B?bGV6dWdhc2hGSXZkNDZKbVF5SE1iKzhkYW1OUXdEWDN1anJkTFhTQW14RlRX?=
 =?utf-8?B?YWJNcUo5d2RjWnlhVk9xUXUrZVlxa3dKaGV6YjZTR3pEU3dvQURTK1IwQlYx?=
 =?utf-8?B?UjlyVUphRStjMjdMWW1sTTUzTDFiTjNqVUlnU211b0l3V2RWSjRoczRlRkVJ?=
 =?utf-8?B?bWRqUEVSZmlBQlhNRC9xQVV6aFNJbjYxVFVOMS95Zk9wMFQrSDluSGkyU1p6?=
 =?utf-8?B?NzhPMjR0SEc2dHNDQzJ3NTNlQlBVWCtzWmZrUXNWOUU2aU9UMTNvRXlVZERm?=
 =?utf-8?Q?EWUTHix1nNngNHZtNIhJM4bdr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e92fa3-2093-4ed2-40be-08db7dec640d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:44:04.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZVO6mpA9WA+gTqzR9ymKw3qxGdjiWyf+EQZoM32jhiV5lBWIehtst4KKJEraV70MAEA3W32H93tK4n/S1/Muw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8145

On 06.07.2023 00:52, Stefano Stabellini wrote:
> On Wed, 5 Jul 2023, Stefano Stabellini wrote:
>> On Tue, 4 Jul 2023, Jan Beulich wrote:
>>> On 29.06.2023 17:55, Federico Serafini wrote:
>>>> --- a/xen/arch/x86/cpu/mcheck/mce.h
>>>> +++ b/xen/arch/x86/cpu/mcheck/mce.h
>>>> @@ -44,7 +44,7 @@ extern uint8_t cmci_apic_vector;
>>>>  extern bool lmce_support;
>>>>  
>>>>  /* Init functions */
>>>> -enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *c);
>>>> +enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *ci);
>>>
>>> Supported even by ...
>>>
>>>>  enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
>>>
>>> ... immediate context, c is the name we use for parameters of this type.
>>> You want to change the definition in such cases instead of the
>>> declaration.
> 
> I should add that if we are going to change some functions in the other
> direction then it would be best to move those changes in a separate
> patch to make it easier to review.

+1

Jan

