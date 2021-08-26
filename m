Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581313F8844
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 15:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173028.315718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJF1d-0007M4-Fq; Thu, 26 Aug 2021 13:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173028.315718; Thu, 26 Aug 2021 13:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJF1d-0007K6-CZ; Thu, 26 Aug 2021 13:02:33 +0000
Received: by outflank-mailman (input) for mailman id 173028;
 Thu, 26 Aug 2021 13:02:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJF1b-0007K0-Vd
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 13:02:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b58afcb1-bec7-49f3-abf0-a61cc9c87da7;
 Thu, 26 Aug 2021 13:02:31 +0000 (UTC)
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
X-Inumbo-ID: b58afcb1-bec7-49f3-abf0-a61cc9c87da7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629982951;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WbWWBMHUiLKqgk5UeGGu4iTc0TkCXDO2CWyE5KpIl6I=;
  b=X1HDgsqdNe1BKMLsW6Gi3tZMAS0d6ndEH3sivAVTaNPJESGRK+b7qlaB
   1xBtcYT9ZTvuxQWTOKiOA2e57AjVY4VF7UeI+WExrZYoC5j/uUcwhWVi9
   TbyAjTkQw4T1xK2y6Bvjwztz7u2ap4qWkqyYm/55NzurUHL6wzc+jrHFf
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: umnlxIWvqNOcTr5C+4K5naNLG35wlsLghbVkB0rekGV3PGtfhWA2hP06+El1o+XSBcGG2UzScZ
 FVnwWr5hsLddsTob4KrhLAN/JsHnLYtETbAkmO8h1sF9i44ijxrgEz7RtSAn7zzcI/mi5XlzJ3
 f6wMu3gHz1LFtP+0r6mv47Yr+6jhMsBAIACNkXjT7sMhX9PV8FAWK3jlmOTm60kfDRi0hXMypj
 MJ0HBhJjY352zoLmKRXmcDZMFFik4uO+BOFnyg3I8JPcSS9T/qQBZl1lrjfUBCOvcdWbnGpRFA
 L1y6ObgNqJBdnNAXdaSZ22V0
X-SBRS: 5.1
X-MesageID: 51363034
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KzDjr653FQPqLlLAowPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51363034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkThKU9xr5lsK3Ka41nkEafeNqHJ/oWJ6kQiGqC3LUxfpH3nlhW2ytkqdLkYi1BpdxgNs+TXN+8VMlyAlJND40Llk7xMeGB8NIcZkeoO7n4+cfKf3v9DSUFmOFjnWoC+rhUVy4zeP41QtAxW01tsUaKOmHIjL4580+c2n7Pok7dCqOfSj2h8s3cClyqxmy8IFDEifs/8SYY2x/QPexsKtTkXlbh/lRwq9hi7FtRe02UuT2iU1kV9g90qur1JYbbAwuLA0PgOVvsK1+ZLW9UaGJj1yQ9Vp2MJIIAi8PF8v8w34fGmPJOo7SuEEsAY6eEnr0Jhde+Y+SIkYdw+wgJlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbWWBMHUiLKqgk5UeGGu4iTc0TkCXDO2CWyE5KpIl6I=;
 b=FlDt259W9fST5lWmpOcvsPkUXwGdoosf1LP1W5FacRu2DwpJDw58qaqcDRwVKyXJ5ajVrH2PXREgbZ76CdOCYnXVQ1E7RjG7aDc+cVPC1Ci17gxMLMLaxHInFaF66Pz8ixrdBmQ9Yz52RA8Q7Pz2vyA+WZTa0pifvAKz5VORMmp3POZ/KDDM/oZji8aRd7Z6lvRv3hCyk+4lCZhv9jBRGSj/9l1jOU2TlE//dyNDPqjtbmgucujz3yW9doD770CDCB+k4ej7/TxGeroQ48a0S3v5UhXhj9OErfA+0Ip3QBiOYHu1St3YE6GKvCkvJA9gkbcai4LghPFEZftT4yx42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbWWBMHUiLKqgk5UeGGu4iTc0TkCXDO2CWyE5KpIl6I=;
 b=xUYcgx8h3jomNFGcODzIXPv5bMpFx+qFKpMV2B8irznaySf0/mREy1OKVr3uxYUGUPhBXfc6hqZFCYqinZP1jxfWfj0n5kpiKe/QETpVsY5BTZKXVwvhNKmJD4cR+AVPgTVd0dWe29tUsKtAHTXcAffdlZaWEiXS4hhEXMUS3DU=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <6b6b287a-c5b4-06f4-6f7e-78273cb74d64@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 3/8] AMD/IOMMU: improve (extended) feature detection
Message-ID: <1449dfd9-7617-b4cc-89b1-3e9dd8090320@citrix.com>
Date: Thu, 26 Aug 2021 14:02:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6b6b287a-c5b4-06f4-6f7e-78273cb74d64@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7367e58f-58bf-4b1a-18d1-08d96891c025
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-Microsoft-Antispam-PRVS: <BYAPR03MB349527E453726F545AD260C4BAC79@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +yIjPm8J5VkjEnkMT+cbcBGH6BzXSB3la3uDD5XHncWXMu8sUjpnO/3pUCQ/mgRYLEXP5OaeydSr57lf+g6ZkqGbRHOC8f0bTENnF8wEzZ3j4AJCnpj5PbkHyk8449Lm5FM96VeqwJHN8nwkm2R3W6/bde3PPuWKEJfpFZyRSkMbuozuDjHV1izgb8mUCd9J+3jdvCkQuBl1gNGG6SlDi7rinl2ugx3gr7oICe8p/qlXRT8eA9O+VPNmGLleCvOD0oruWVhGO5CIyOut7hbfPsqFTNQYFkRq23Vlh4Cz/58TQaQMR/aBZQ0emtczA5l3ZG2QtWn3J6bCTFt2mV5Pwyvswfo8k+jlyTUt0RTgyknfduNxV817PFbuV1CBOHVyghDW5FyyLu0zhaZnnrrhene/nzlbo7aj89cfF5qpJLpFfTpCBlDCY+pZOFk25+weQJeQePtOp3L3x8LiF3TcnU2y10POwSqXnl40zZcJtBrIA/zulkQGR3D6g0/ozZD//HNg04gcJ8o23CjWHqkrT2Kxmc7jJEi0oxcC3a+H9RUpW2A59ry2dXixruBUODvdIJegQYA9cl0Y2DEjzA4r2lGCHpYRBE6CR8RjqNq0dk6e7hmjxCb0ymUSm5ahxGTcwkvPMEs9B3NutEdwZj7NHZAsGuAqEUMjMDH/8zmS84K5EZDgygF/yJhcDIScjAbm0Uo4ixFOANvonkMueYIHe1yzGkmc1dGYdF63yLXkwHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(86362001)(508600001)(316002)(53546011)(31696002)(16576012)(8936002)(31686004)(110136005)(55236004)(36756003)(38100700002)(6666004)(26005)(186003)(2906002)(5660300002)(6486002)(956004)(4326008)(66476007)(66946007)(2616005)(83380400001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlJKU3hqQUJaS3FpVUQveDV6N2NmOFdoM3pOZEFvd0d3N1ZWNVpJU1FobElk?=
 =?utf-8?B?dG9HbFN6clN2WmExN1NKZW5mUzRoL1RWeGhGRzlpdTlEb1ZtRUZ3RytFbFlx?=
 =?utf-8?B?a1VlT3p0UHZzY2FHbEVkazlSbzRrYW82OWZxemZkbjNLSUtwalR1V1kwNG1z?=
 =?utf-8?B?WDJPZVVlMllvSHZGK1JnMkxlWkhTMXU2dzNjUEpEcGMwNWRET1NCMmJoUFFk?=
 =?utf-8?B?L2FUd0RXZEMzbEdTbFB2WTRpQTVIYjNXcFVJNnU4ZGJiMFhpVlhYOVdwT2pB?=
 =?utf-8?B?d0hHWFU5L3d1NngvSjI2QmttcHVmMVVMZUtsQTcydFRSc2Njem1kVVVhbWk0?=
 =?utf-8?B?ZEF5VXlCbFkydldtektCQ0plSjJsZXpsTHZJb0VvVUo4TWp0ZDdqMno0dWdP?=
 =?utf-8?B?dmU0VWFvNGpvNHk0RUZnUGRWdlArMlpBMmN4N21rK1MwcWQ4SkdWdXlXQmRi?=
 =?utf-8?B?cFFacDh5NlpCNk5sSHp4dXJJaHRwaUlLSkFPVms3UnVkNFJFbmhod1pBcURk?=
 =?utf-8?B?eXo5R0xvdHRyQTBLdkNWRjROSndJRjl0U3ZzdWxRK09ZaE5lVFVvOVYweFJU?=
 =?utf-8?B?QlI4MHBQc2tVVkNVekZrNGtTcWFQTVhyRTlSZndVRGRBcWFKT3F6U1FRNm9z?=
 =?utf-8?B?NVVWSS9hMzEvZnpRclRZd0N0UGlKMmN1REpVUnp1OTljNXFnbnQrWE95djdT?=
 =?utf-8?B?eldkbWhTUEJMTmF3eStWN3hqV1pLYkRCVFdVVW9pSi80WUFFME90R3VoUm9D?=
 =?utf-8?B?NysvaEovWDAwbU9VUDg4SUMrd3VQZFVpa01DOWp3VTNxU0MzRGdLYnlMTGNv?=
 =?utf-8?B?NlZlMk00b0tyOWNzRityaG5IUlIxNEJublAxSmI3bUxHZm1GSzdFbVpGamt0?=
 =?utf-8?B?MTJUeWs0ZUJuSG5DbVVQY3dzMHdjUjF1MHg3b2pOZCtWckltanlBd1A0S2l5?=
 =?utf-8?B?S1VtRnIrY2YwMUdxdWxFNkVteGI0Y3BGTGovTU53MjAxelh4SHlpQmJQYXBK?=
 =?utf-8?B?VGRwRkRvdVdGZkJ6K1RVWmpTSzlmMm80a2FQU3FzdEFZSW5SRnVaNTVpbDFo?=
 =?utf-8?B?T2o3czdKalV4bDAySHlWbzJzclp1ZlUwdVpmN2pEYWVNR25KOGMzeHRMaTFu?=
 =?utf-8?B?YW9SNFlwb1VsM3hKZjlKaTBsSXdwVFErZXdiZ2NORlZ4Wit2Y2NmS2lYZXNL?=
 =?utf-8?B?U1ZzRDF6NVpINGZrMHl4cXFRcWQzV1c5azV6TlZNOTJiKzhhVXFuMEliSzdz?=
 =?utf-8?B?WGdtRjM1QlJqMndnUmo2V1NrbzBsR2RyOTJjS2VNeEZVV2FhNGd6VmFaWjZz?=
 =?utf-8?B?dDZ1aG8wUlJ6RTRqV1N6OXVzS3NPRmwrOXNoNXROVTRQVXo1RE1HdmFVOUc4?=
 =?utf-8?B?SkczSVMwYjVod0E1azhoek0yUWlTNWNWYm5UeFdFdlV6Ym9qbTMwRkRVQkV6?=
 =?utf-8?B?UGgvRFhzck0xaWFRWnhnY20rOW9TMHZjWnJBKzFBdHBiekVuaS9LWEpIREk1?=
 =?utf-8?B?SlhhbldSZVNMUTJnbytPaGxsZHdnN21rTXg4ZzZpYktiTkdXVFVIYk5FaVZh?=
 =?utf-8?B?VEVINU9oVVNIbXVpTjdrMHRoUzFqWGgzYS8xcXNxUE45TlFDaEcwTkoyNHZ5?=
 =?utf-8?B?RkZvdlVGOFpmKzYxcllzbG9SRS95NDFUQ0NzZGxaUzMzWUFZc1ZjdHZyTTNC?=
 =?utf-8?B?L0VPWnZQOE1rT1VyNk9lbWJTekFQSkNVUHdnVFMxWU1DKzFrSVEyN01CSkhY?=
 =?utf-8?Q?/exittOA3n97SNnfWjKCawVxSEbvU+gG2ZVtNfI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7367e58f-58bf-4b1a-18d1-08d96891c025
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 13:02:25.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imK0EVL97E1Q1GSezDEdaqZ/a5uPLPUE/widjPwwowlbLKzfSNsngxew1dzR6qQrSFBWemUlC4rMH6tInCkK6sTRrJjnrI054XsfrTw6v1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 26/08/2021 08:23, Jan Beulich wrote:
> First of all the documentation is very clear about ACPI table data
> superseding raw register data. Use raw register data only if EFRSup is
> clear in the ACPI tables (which may still go too far). Additionally if
> this flag is clear, the IVRS type 11H table is reserved and hence may
> not be recognized.

The spec says:

Software Implementation Note: Information conveyed in the IVRS overrides
the corresponding
information available through the IOMMU hardware registers. System
software is required to honor
the ACPI settings.

This suggests that if there is an ACPI table, the hardware registers
shouldn't be followed.

Given what else is broken when there is no APCI table, I think we can
(and should) not support this configuration.

> Furthermore propagate IVRS type 10H data into the feature flags
> recorded, as the full extended features field is available in type 11H
> only.
>
> Note that this also makes necessary to stop the bad practice of us
> finding a type 11H IVHD entry, but still processing the type 10H one
> in detect_iommu_acpi()'s invocation of amd_iommu_detect_one_acpi().

I could have sworn I read in the spec that if 11H is present, 10H should
be ignored, but I can't actually locate a statement to this effect.

~Andrew

>
> Note also that the features.raw check in amd_iommu_prepare_one() needs
> replacing, now that the field can also be populated by different means.
> Key IOMMUv2 availability off of IVHD type not being 10H, and then move
> it a function layer up, so that it would be set only once all IOMMUs
> have been successfully prepared.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>



