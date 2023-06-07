Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F90725979
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544554.850423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p71-0003Zq-Ni; Wed, 07 Jun 2023 09:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544554.850423; Wed, 07 Jun 2023 09:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p71-0003XH-Jt; Wed, 07 Jun 2023 09:05:51 +0000
Received: by outflank-mailman (input) for mailman id 544554;
 Wed, 07 Jun 2023 09:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6p70-0003X7-6A
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:05:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dbdc605-0512-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 11:05:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7842.eurprd04.prod.outlook.com (2603:10a6:20b:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:05:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:05:17 +0000
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
X-Inumbo-ID: 7dbdc605-0512-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j61z2be28LWX0FYoqOTdoh++6WvL3zZvqtDJplHtvmtkpFuhPmUNkg9F1JZRS42+DuTOjM63hIYkfx/Nv8LDuWtG9zDL58MwvimT4tOOwhIDqJTsbv/8RPryQQiolwkqX77O8+eCrh/0TWofNBz/0VUFcVFFlR8FzpeJjIjryT7se1cVxwFVHlIZON37ZsG/Ckm2Mv8h43xH1pRTY7gLbtNeqAvvl6EcIdRJpmPiPkKjJD/1KlAINKum34zd4KlC8wUh7hiOmiPMFqyf+9MMNx3hHnWgSdsqabXSt+i9cW3iA78YgE7s2pvogj0NVPdCwYxf6BdTeCsF9BI7lt9kRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+3oVSBcD7IM0Z3l0dlg0CNigJthDWljpZG+kthmr/0=;
 b=ko6dmPojmlqKgpXYlVPhidTi6wKeYSCI1AXPmJ59uEkVU92WxorRfp46J+nW+//CU57MyPgWvY3MppJf3ohQW2FAcHHsochcGBrBHr5Gb6UcMNdQDGJKmYvoWehOi4QECEpzybanNpLP2du7dMkL+kFIJsEQ9cnu1PSl1hYfBmhN8FU0qiwLK5h5xPf9MYqdh9bope2ox0nzOPZu4rZSMdGHUVq4voAQv40HvCSwMJ5ekmk4ngbDMEa9Q/0QvZgQxWKx3aCyIw2zk5b4dKtWaCGrzsWz1G05jFGCNWhOHKyT8v+VeguMqnQ3ftjez9gwJlSndVYlbrmqmFJ6nCOYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+3oVSBcD7IM0Z3l0dlg0CNigJthDWljpZG+kthmr/0=;
 b=JXjxvt3NgIuJvN361j7n/ZTnFvEChj+YCScDUWiMsgr9PGxSZ2aZrvhaKxK9jFQvNX/1fr+++PwuUcwNPGp0ppno9vofw3dmaDJMYuJy2VY0sM5OTQFwSK+KzdWK62/XXRICHWcrN3QAu6uGMzy1ByLSS9lSABBf3OHy4dTC2M100D5C34Au2a/RWuht5GliB735BVBz6kQn9BXLAK6H+dIwng1IIm5RoYqdWQpfoljsG/lNHlxJTv6e5iouGughWCLVYgp2m9MDGITrK6WJaDVY3kLyMwDm5mM1jQ0/EO/2NZgaqZSS0BIlenC/KEXY1etsiPUbOuKnoxS94VaGMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <680b23b6-5f2d-b513-92fe-6f91c4793915@suse.com>
Date: Wed, 7 Jun 2023 11:05:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] libs/light: use the cpuid feature names from
 cpufeatureset.h
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230605103657.14191-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230605103657.14191-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 8209983b-93f2-41cd-35e1-08db67364ff3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OoFcNi26nHvOArxIZXlxv+a5VWVzeXPRzYJzhA8Ih1f9aY/Rs/tyA+vIVciydn89FYAEzOqNFXznUM1oer+9EH5YhlfmIRIQvZnSKP0vAw+IdM1hArFEfqSgvZybcX76hBsduWt9xGVWf+JA8DlDQogqDSAnn8nkGq3KWwQs+Avzcza5dy5DODtyp70BV9f9q5WhuFEMplap2lBu41/Fby1nmn/fmNVO1lH0g4z527zq2F4fzE8GJIW2SlzBgogl1nbvQYniM9F9Jj1eiH1alB7DsjTZab2vnD5iI6JZ3B7W/NE76LUyBH8mjctm0tADo26o6r9ER8YSt9x/wcFbKVlZecWLAIsS6k0CVAXb8h1VV5vKftRTDfNBMDrIXzV6gI0Ra86DMomon/chtVoGxYIkDepctNXK8dQrw6cC1g+K+3QJnkytp/e6iJZnfoSPKJn8R8G+XgSTo8lgddsZfgFaZfSK9H7MXkWFx40hzcYgjnCV2aLeXI2VTFTK6aWf1ZHoehQSFCWo60l1d2dhezH6ghoSQaNYYrgxVm+mGZdMg4SpAJGcDHFgAuUNnUtaWBw/fUEkW7ic5evfOmflZrPTPPlgofqBGZ0K7dBKOO9oDHUd3WvWxttbCZ1B/Jz02rLexFvLI604Mf52pnHhWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(5660300002)(38100700002)(53546011)(186003)(6512007)(26005)(6506007)(2616005)(54906003)(2906002)(478600001)(86362001)(31696002)(6486002)(36756003)(66556008)(66476007)(66946007)(4326008)(8676002)(6916009)(8936002)(31686004)(41300700001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azlPcnVWellkb3RCSHB2MHZaQnFIYnBEdmtOQkpReFdnU3RjeGpLcXdIODQr?=
 =?utf-8?B?aWVoNC9RNDhubFF5bmg0NEtRME5aM0liNFVYRTRFbXRZNGNoNlpwK0ZLVzFp?=
 =?utf-8?B?c0dRUFU2K1lUR0xHMytUai9Cd1dibk9tRGxMOFZFUlB2aXZ1T2lpTzBSc25L?=
 =?utf-8?B?cnFSb1dkYXh1eVArUWlxZTRzWS9rZUFqeEpIOS9xN1ZFTHFxaEI2Z2grZ3My?=
 =?utf-8?B?VU1udWRMb0hOYmxKL3BLdGJxcVhnQzZQRVhNUjBMQm5FQm5NcnROR0lNdlBW?=
 =?utf-8?B?OEVjKzZ4N25RU2k4cGgxeWZoK0F0b1poVml3Ykp5LzZETTRDQUtRVDc3Nktk?=
 =?utf-8?B?T1ozRzRJUFQ2Vkd3VHg3MktPQ0lKZ05MdjN2MHZjMzFvT0gvMy9QTmlkOXly?=
 =?utf-8?B?VU9OZnNpdmZoMDF4NHNjeGEwS2VXYTVlV3JuQ2IrekwvUFdGWm1nQlRBK3Ex?=
 =?utf-8?B?aXk4ZnFuTkJlc1dldFdNY1RZS2FCTHIrZ1kveVFXTWdRczVzY0VIZ3JxL0dU?=
 =?utf-8?B?YlJNZ2daWDl6RDM0ZlB3TzBaNEF1OUdYdEtXWEkxNVJkQndBbUd4Z3RRMGNC?=
 =?utf-8?B?ZmZOb203V0hNNWJWVkN3bURUTFNvWnRCS0RSU3Z4MkFHQnB3OXU1eUdoYkNp?=
 =?utf-8?B?S01Ld1BKSGpVWjk1bEUyYUpndUFGMTJLNmNVN0taajBwZmhJNjV2cmU3dDRB?=
 =?utf-8?B?Q3NoeGdXRGZIdW1PQ0VWWHRCR3NqRjNGWU5qTW1CRkxXUGhCYS9wWjB3dVAy?=
 =?utf-8?B?UHJrS2UvTWpiMVp2aW1PS3hIZWNyenVIQmZjbGY2MWczdUNHbjUwZU5yakEr?=
 =?utf-8?B?N3dlOUh5a0tJdWhnNGFOZG51M1YxWXN4V1p5a0VNemVYL0dnQ1QwNkFIWTIw?=
 =?utf-8?B?RzNZeHRsWENLMzA0cTRJbW12di9ON2M1VW1VMkJwYXk1Q3creWtrbmRWM2k2?=
 =?utf-8?B?YlJrRmM3d0NValhGZFA4bGtON29IMC9FOGdmWVlXdVI2OHBudkIxTm1RZzR5?=
 =?utf-8?B?Tkx4Tm1MeE5OSFpjQkdBakQvajMrcEoxSUdOMWw4TzBiOWs2M2VabTRXTEwz?=
 =?utf-8?B?K0M1aHoySDBBTWhWNHN0LytRN1ZreGZaM0IrMnl0VjZZaDVxZEhFUENiYkh3?=
 =?utf-8?B?eXUwMVgxVEZzbWZMYUF5RmM1QjlUK0dxOHlSWnFBUHBHcFRjOVZ2ZDFaeW1L?=
 =?utf-8?B?OGg2ZVdUcTdqWW8wTmJJeXNDemxSQW1SM0ZSVVozQW44dUdkYnRBMktMTlVC?=
 =?utf-8?B?Rm5pWWNObDZ4bzQ2ZTVhQlNCVkVvYnlLZXJ5OXBDQWVrK0NUUFBSc3JMTWpj?=
 =?utf-8?B?U0dwSlZQOTRueUxJYWE0VDE3ZnNSbExzWE5Wb2ZpYlhZdHhGcWR6bHNGQWxj?=
 =?utf-8?B?SWRiMWRUdnRaSXphZWxFbDdxQnBkUXJBaHpHekVQU2pBMTM3VjZ3UHZQd0tN?=
 =?utf-8?B?R1VaenNFWTl0RFBvTDFmN0N5dmhvU1hIdmhZMkJQdU1jcGVrL0M0RmdMWklR?=
 =?utf-8?B?RWo4ZjFmbCsvaXRJSkk2a3VUOTNaZG9xY3hrMlRjeXZzRWVad0VrdTBRcmlQ?=
 =?utf-8?B?eVN0engvQi9mU1lSUGd2bGh5R0s2azhjbEVFcm80M3pNTytaMGo4TTVidWZP?=
 =?utf-8?B?di9TVlFnazQwVXE5SWFHNW5GNTNhOU0waWpUMWVKWSsvQTlGQmhVTTRmN3Jq?=
 =?utf-8?B?aHAzOFNTdC9SNnM3N2p2MFBzajlHTGx1YjlLTmZtU2gxRGhMU256VUkzMjhB?=
 =?utf-8?B?MlRnbmRVNHhVNmhJRlI1d1ZMZGFBMUx0VlRCTE1FaUhEc2V3VlNLNy9YSkJN?=
 =?utf-8?B?M1NrSGJYbjJURUpGYkJXaVZaM0RhcU8veklpQldWcHZ0MWFPZ1lWNjJEWllN?=
 =?utf-8?B?Q2RqQTEyekVyZGtPNno2L2JQMHZPOW9xQ2U5QUdPTld1YXZxOTFUR0d0bzdT?=
 =?utf-8?B?T3RsNWFXV0Ryd2YzZjRuejNjQ0hVeHpnYmRnQmZMVlU3cm1sZkpWWlU3d0Jq?=
 =?utf-8?B?T0xtejJhb2x0R0tLZUlROVJkRUdxRXZUWTYva3dDOEVDQnFicnZLdmtUR2dF?=
 =?utf-8?B?cE1oaGJ0U0U1eTlhUXhaRTVOSzNZSzJYclVVeHhKdTIzbEk4VGdHYnp1emhN?=
 =?utf-8?Q?/8mCOnBZpSh4jjpLOBObs2q0a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8209983b-93f2-41cd-35e1-08db67364ff3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:05:17.2008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kzs+KEU63detT1yXcIL1ycKZDWVozX1zndq/Hg/HwLC/WSMkYvlMdlgGAVqxF6N2zVKf00nXuE2XMUIubXIFEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7842

On 05.06.2023 12:36, Roger Pau Monne wrote:
> @@ -51,7 +53,7 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
>   * Used for the static structure describing all features.
>   */
>  struct cpuid_flags {
> -    char* name;
> +    const char* name;

Nit: Would you mind also moving * to its designated position at this
occasion?

> @@ -81,6 +83,14 @@ static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
>      return *list + i;
>  }
>  
> +static int search_feature(const void *a, const void *b)
> +{
> +    const char *key = a;
> +    const char *feat = ((struct { const char *n; } *)b)->n;

Urgh - what a cast. There's no connection at all between this and
struct feature_name in libxl_cpuid_parse_config(). I think you want
to move that type declaration out of the function, to also use it
here. But if not, comments on both sides are going to be necessary
imo.

> +    return strncmp(key, feat, strlen(key)) ?: strlen(key) - strlen(feat);

Why not simply

    return strcmp(key, feat);

? Both names are nul-terminated, first and foremost because
otherwise using strlen() wouldn't be appropriate either.

> @@ -342,6 +214,28 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
>          if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
>              break;
>      }
> +    if (flag->name == NULL) {
> +        const struct feature_name *feat;
> +        /* Provide a NUL terminated feature name to the search helper. */
> +        char *name = strndup(str, sep - str);
> +
> +        if (name == NULL)
> +            return 4;
> +
> +        feat = bsearch(name, features, ARRAY_SIZE(features), sizeof(features[0]),
> +                       search_feature);
> +        free(name);
> +
> +        if (feat != NULL) {
> +                f.name = feat->name;
> +                f.leaf = feature_to_cpuid[feat->bit / 32].leaf;
> +                f.subleaf = feature_to_cpuid[feat->bit / 32].subleaf;
> +                f.reg = feature_to_cpuid[feat->bit / 32].reg;
> +                f.bit = feat->bit % 32;
> +                f.length = 1,
> +                flag = &f;

Nit: Too deep indentation throughout here.

Jan

