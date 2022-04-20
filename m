Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFD50812C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308860.524723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3o6-0000ZM-Ey; Wed, 20 Apr 2022 06:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308860.524723; Wed, 20 Apr 2022 06:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3o6-0000X1-Aq; Wed, 20 Apr 2022 06:27:18 +0000
Received: by outflank-mailman (input) for mailman id 308860;
 Wed, 20 Apr 2022 06:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh3o5-0000Wt-6J
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:27:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec07c335-c072-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 08:27:16 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-vFnyL7U6NqKiGPh0e49RoA-2; Wed, 20 Apr 2022 08:27:10 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4998.eurprd04.prod.outlook.com (2603:10a6:20b:f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:27:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 06:27:09 +0000
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
X-Inumbo-ID: ec07c335-c072-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650436036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mF+8wfBV4l29vYWlrfh5o9Jb8pNiIIu7yo85Nbqj+QE=;
	b=mHlN7C5RyJVPOUGvpRzYU7ezC5LqpLzzRd+egUwA2LVXkaizqu5hT58uS5Sh50F67Hy/H2
	RkUo412qo56YzGPwvnCjWp2+h+FUBYHbYyE/HRPbpUMVGAshCEWpFO91px1jgQ66hPxkeu
	Sa5n201/obfjSGyJPanK2QEnUcCFKd0=
X-MC-Unique: vFnyL7U6NqKiGPh0e49RoA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHzoub5ypQZYnvrUlT6jRMReyLp2ckiPL+cdUup9rSKg9O7rnl0dveVu6ZjGd3feSIoEZx+D2ZM9C7O0UxgUb0p7ZfDVGbUGQ8YCkJrgtupTAstMESG9svCaYVqX+tSEzgB9sBfj4fVcBO3GQu5sLbIDDJfpNd2XAzjnbpnGvOrsWysxtRyG31hkP2W6TbSnFUfOSjqYDrSYDNrluzMf3YWE/HoTaZ9fjVXZ1sIx6qy44i69lIKbE86IWRYvGkqXxpUFbp1B0qX4rE8QVNdS84t6wKQ8ocqp8r6miUXCq4tghG6IM9Qq1wY0FvNpqvk0qfyjfUfEtKxuHUkRdDx3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF+8wfBV4l29vYWlrfh5o9Jb8pNiIIu7yo85Nbqj+QE=;
 b=crC0cZB/gW+G3S+U1N1yK9MdfknKnKGH5LUy1IryF1/ON0d4oDQk0KyKqBrl9uSrGgEIT8h2HYPKm6xlYHgGYtcIYwOKAf3zxmQ1qT8GL7rjUn3YkVQ97rWrhH5PoKPmD/Qf5bNYML8sJZJ+YdTlpitmyz7pnFhImtcoT/lMI/gr3uB+R72MX2LMbJJNalFMkhuF4JDiBt01sfFWA/CxCrnE9Z6TJntvU1Bhd8T8pDP8RlQdifjR+++Mqdb5lELTEEaFzsd28QN6mfBMyoOtrr27JI9FG7DiqVBsVocPcBDLp3H6Fs6N8Vr4MOP5e09kiDje2E/8AMlluIEQ40Fz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74f6105d-d3a3-6508-3c6f-3aac53285c5f@suse.com>
Date: Wed, 20 Apr 2022 08:27:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220420055736.27901-1-jgross@suse.com>
 <927d3bbd-64db-15dc-9bec-270711b9c1a8@suse.com>
 <a2489d58-883e-01e7-1b7d-0413b4006fbe@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a2489d58-883e-01e7-1b7d-0413b4006fbe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d448d1c-3321-4f1b-ea46-08da2296cbfc
X-MS-TrafficTypeDiagnostic: AM6PR04MB4998:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB49980BE2293DB70714BF1AC6B3F59@AM6PR04MB4998.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UQ4Fz2KLveuw2zsG9DqRxOjyK1Fy5tU1goFeK4PdofCRmQO4UZJ4pIdUc0FulOxoDBbNC3A//Vw1QU+1jc2BvDmSEJP3QmHhKm+LhGfHFcc/PwW+1Oh4us2r0Wk2ab9ABqC2uewX8VzZHH/tsWhLxVDoJzKmz1VJNA6DvwiUXLVff3hMRAXh83V1A+QhZzHAi5bjRs9Oq9yY7D34qqsYNsXAwOKA6bvjGsGLzvihf4HCXKXtLOxCoN29Cn13tuM9geF0/5PDlQaWAutCKn5MXGtxMpxGwDjZthrCkYIhiw8RSGWynp1V4RwmzAUymdxU2lALIYu58sQMMZ+IX/mGUd7VuDJcWIWJyzzN913hAzHI5ca5fNgVFxTAAWcYOQOuIvO9CfgDCQrgJyV1sF/5x9Nwp03egqz5ShvVjB/gpIQps8Sgy4+UAiv3vgyVRaOUbesBVBwy/5uHyp0o92ygfXqZEcMp8bVtygkejL/Wcoem8F44ItUJ1QQMkdTcs/bfol0KvgM/ShR9HgHT9MDmBScZjiQlvAB3lahjb/zMzYsGbdgJKLXQQIrC23YhjtGC1skoS1xcpqenuOxS/r4l1Q7st8WhBjAeyl6CprSHhrePbJoleydbse7LDZSe2i3jvNAQNfV14A4B0GH3BpXn9l6iXSS2iPTmOryaMZVWbsB6aIgnHeAIQmXhFv9jEaGaNthlyylCjTVHTNYBsZ4O0R06n6c2XFkEP5x7OXi+AHFKbF8XWT+vqqeze+qbPGWZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(8936002)(66476007)(38100700002)(6512007)(6486002)(8676002)(26005)(31696002)(4326008)(2616005)(186003)(6636002)(6862004)(54906003)(83380400001)(53546011)(2906002)(36756003)(508600001)(6506007)(7416002)(31686004)(316002)(37006003)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2QwTGs0Z0ltRE9zQTN6MGdzaDJxZ1pOMkxEZVZidk5PbkdMdWhud21ZOTlR?=
 =?utf-8?B?SUZ6UEhpRVV3RUVENjJnbnRBMngybDlZSkkyTUY1TDNrTmR2QkY0M2k3WTBn?=
 =?utf-8?B?a0JJTVJRczBPNklDbkY5bjM4MjJiakxZcmlsODhpY1BocEIxYWc2bmVRUnBr?=
 =?utf-8?B?SHJucnNVYTRCeGVuZ2Z3THRxbHA1cEVFSkNGUVE0Sno4RGlQZEsySll3cy9L?=
 =?utf-8?B?aUhFY0hRZ3NsaCtZWmFSNjhIa0VLUTVEbEJza2lTaXVvN2MrL3BBT2ZkUU10?=
 =?utf-8?B?K0IycVBXRnpmOFpJM0pPd0NUQjdia203aG56cUV2M2d3NTZXZmNKelhLNyt5?=
 =?utf-8?B?K2IzT1JRbVJ5ZkRQR0VQaENYb2tteGgxdUtEajhqWGVqK1NwcVBFUk5LL1Jw?=
 =?utf-8?B?VHVMZ0JaWnl6aFptM1RVUVFtM2dnTzcrL0U0dUE1bitRcDlwaXRKZC9GT2VN?=
 =?utf-8?B?RGFhODZRV1g4eDNtN0wwTzlsL0RhS0dkb3BUK25uTlFHSGpyUWxXMzNEbzdR?=
 =?utf-8?B?MitQdG1kc1hIdEp3Mk5Bc0htaGd5djUxSTJGbCtSeG5LaDU4TzEyNXJ1NFVD?=
 =?utf-8?B?aTBlQ0hXS000VTM5c1hsejJVZThCZmY4VHB5Q2xwbjlveWVDb1B4UW9DL3l0?=
 =?utf-8?B?NmlyZ0g4TFc5ZHhWWmZJYmU3LzNjYTRzUG5TVVJwTURYczZpaUdLM0sxcGN1?=
 =?utf-8?B?Y0JRVElTTXFZcEtEd055bTVTWTI4L1Q0bWJXRjkxWlplZzhLZUt0TVVsWVcz?=
 =?utf-8?B?dHhZSC9WRVg2U1FjKzdCL3h6QWR1Y3NjTDlVTk1oS0NQSzUyamFtZUtjZ09j?=
 =?utf-8?B?enRDVW9Tb1FMQm9LWHYwM05EckkwMi9LMi9CUERUMDJqYjNWNGYrVzRUem5l?=
 =?utf-8?B?MExMMHpqZHZ4ZWxDM2J6TEdGc3d3eFBnVWJTN0l5Z2VGSG5tRzU1Y0hVK2ZX?=
 =?utf-8?B?b1hQMU9VZE9PQVJIN28rZVZJYkFpUFZSbE1RdVlJeE4xajNvekFQZTlzbDJN?=
 =?utf-8?B?Y2NIb0NISXQ0SnhJTmZ1LzZwVU4yTW1qNkF2UTVXeGhja0dlcytaODM1SEhn?=
 =?utf-8?B?TGRFYlNLKzZpdWc3K0ZQTmN5by9EZzRublE3eGIyM3FzK1dzTU5TamdvaS9w?=
 =?utf-8?B?SFdDTTZLbUZnTlJaWFAwNDNKUWFTeXh3clBEOUxUa3loejZTbVVLWXdZYUJN?=
 =?utf-8?B?M1pZM0RpQkpXK1dKaHpTUTU4NllsTEVIY2ZVa2o3YVhzRGpHMVp6N1dkY2FS?=
 =?utf-8?B?elFBbmM0YXRvUE5ZTWhNWEtXU1Znek15aTkxZzh4YkZ3eGR1OHpaVE5yNXlR?=
 =?utf-8?B?N29CTGRyNk5TVXh0YncrcGdxZTcrMFArL2cxTnhhOGtSYTNUbFJkUkpWdFpU?=
 =?utf-8?B?WVRhSURZbExMYm56SncwSkNGb0tod0podi9PQm9MUGFidUlvL0RseVphaVVM?=
 =?utf-8?B?ODVyc0J1cE9SN0QyVmZ4SEM5dUVoN1hBYXhtcFlSL1Y1YmtsVUdtQk5paWNn?=
 =?utf-8?B?Q1JVcGNUY0pHZFllakxVYkx4YktKL0JydWg2dFdtelBtUERZeGZXUlpGQ2hq?=
 =?utf-8?B?bk9ZbGorc2JQRm1Ea1pRVW1nL1htWFdvYTRHNFkrWmpaV291QmlSSFBLMjVM?=
 =?utf-8?B?Z25ielh5MXF3bTNmdDgySWxabU40eGpCaG9CblJ2cTQ3cGdsR2RVd1J2SU1y?=
 =?utf-8?B?YkdVNXlpTW56MUxqbWRIK3ZoR1grSUpZdGo2b1ZqUmYzdHQ3QkY2L2U5WWln?=
 =?utf-8?B?RzRuZExwL01FMWVQazk5R2RjTXhwR0lGR0ZJNDByOUp3eUp2UFp2cE9NSlg1?=
 =?utf-8?B?Tk5TOGZ1QVBML29zdldCQ3RUNmZZTHlGLzZrUFdiTXpQM2ZPTWtNK3k4R3h2?=
 =?utf-8?B?czV6MHJxbUNwc3JoU2RZVC8rU05aTUhabVo3c04rODFqNGhjK0J5QUZFOU1x?=
 =?utf-8?B?NnUwZlZkV29maW9LRkhrcllRZE5FSkVTZCtnanUyRUxacGd3R3lCUUZuWUZB?=
 =?utf-8?B?MkJZTUJVekNJL3pKR1FNVmF6RUdjdlJhWm1vZzFzRVQwUEJIazR5SHh1TVBJ?=
 =?utf-8?B?ZHN0MUFwdFJBbEtDUm5kdFBxZXBGWkNheTNLcmk4QlN0Tzg1aU45RG9KOVBs?=
 =?utf-8?B?Qm5Rb1lrb3RKbnFhdWFIOHd6S1pRSFlwazZsQzkydEh4R3d5ekZmWE9CdkZR?=
 =?utf-8?B?S21LdjVTN1VZNEJFSSt5bS9xdFFsOUg5dThPTHh6SlBYNlZ4QXR3RGhIMnRY?=
 =?utf-8?B?WkVMSHN0cWhGZTc5YzB1cHFWL2FKYjJZdW4zaEdUd2VseENncEhRcTMxWlRM?=
 =?utf-8?B?RGkvL0I2L3laNm9YY1FJMTJ3VFFqajhkZmhkVVhWY0J2U3pvRTJtZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d448d1c-3321-4f1b-ea46-08da2296cbfc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 06:27:09.0072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJ5Nx1XXTosi9uOvoakD6/pl/wtyQpSjjdOf+FJG2Ss2Ff8CeEZ4XRy7oBvn/SotwwD4/cg2enNwgfiPZi+t0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4998

On 20.04.2022 08:22, Juergen Gross wrote:
> On 20.04.22 08:11, Jan Beulich wrote:
>> On 20.04.2022 07:57, Juergen Gross wrote:
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -341,8 +341,17 @@ struct domain_iommu {
>>>   /* Does the IOMMU pagetable need to be kept synchronized with the P2M */
>>>   #ifdef CONFIG_HAS_PASSTHROUGH
>>>   #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
>>> +
>>> +int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>> +                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>>>   #else
>>>   #define need_iommu_pt_sync(d)     ({ (void)(d); false; })
>>> +
>>> +static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>> +                                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>> +{
>>> +    return -ENOSYS;
>>> +}
>>
>> As said in reply to Andrew as well as in a number or earlier occasions,
>> I firmly think that this wants to be -EOPNOTSUPP, not -ENOSYS. Views
> 
> In libxl there is an explicit check for ENOSYS being returned for
> assigning/deassigning a device, same in the xc python bindings.

Urgh.

Jan


