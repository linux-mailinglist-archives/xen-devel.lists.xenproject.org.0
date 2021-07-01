Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F293B94AC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 18:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148959.275318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzYN-000493-Ln; Thu, 01 Jul 2021 16:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148959.275318; Thu, 01 Jul 2021 16:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzYN-00046b-Ii; Thu, 01 Jul 2021 16:28:39 +0000
Received: by outflank-mailman (input) for mailman id 148959;
 Thu, 01 Jul 2021 16:28:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lyzYM-00046V-FC
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 16:28:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62ce21de-da89-11eb-834a-12813bfff9fa;
 Thu, 01 Jul 2021 16:28:37 +0000 (UTC)
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
X-Inumbo-ID: 62ce21de-da89-11eb-834a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625156917;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dO6qQWqwyorMYGU7047AcVjW2mxs/SQxbE8+jVjUZWI=;
  b=ByXBlmBNYdB9ugbnI9INh6mDIL1OLa/LFpn8mpNx8+Vo/HRjlfGGDoQJ
   glfKYX4vNFNaQ01ARDK3ELxW9/KW4AJ8HQiKYN85UgmeAb0l1GwXIR6f1
   FJTHC1G5dA4odyM++AWdXMFQeQehoBf3CCuuTVtUIHTfIWEgahfRZG8gD
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MckqqaUWzpl+kSosY7VrEv+yDz6/amnJt6NQWllmdDNpuc6Qufdef20kgUP/pgXanXQ5Dr9iOC
 WgFtWMM9PADZkplQBx0tISiwVXezP2XwF8x1mcAwu3remqrwnydUab4hk/8Hsz2eI6DgW061yo
 d9cJawgrxeZJBqTroxi60bnVkfXHkuWaLmEQ5X07NZu1cbX6kocr+HZ2d1ztswa6n45NpgHE8/
 CLyaH31pb/qG6Z3Z6Qig3D5ZoumS+JbMH2xRMBD0/HkKPQy/fkFpuolRHE2OMGkMALgpPZEGWw
 6sU=
X-SBRS: 5.1
X-MesageID: 49024238
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2pcpYahlRlYpNpddzo9X7mGYM3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="49024238"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWYt9vbgBRREqjxjyp+x0YJS4vbOmDFc9i8uaZjaCW8DtGVtgqxREsU4aDQ62X2/ZUPfo99iFViS1v+QwUw+H3TI84PDM2NTAwSIgn+JIJUyc6eFd1Z38BRr8BwsmQksJ2sXQynnlB91zW4CLLDBoRJW/MQvnkGtVdY8+BQcGYj36OlWRCNcfMOx4kvGFQ0TGspRI6EfP6FGztUzKw6APSXQh5VOmQQ2WQLMxzLu/QhsPF2GL3CNOdyYAIGf/9q2fBxKCleoc0tSrZriO4QuONfcuVij8SJjBs0brwlJRsl03ETh0WZ6MqLwjAnZdZfUDhsgCCgunkgAqWNkjjoEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO6qQWqwyorMYGU7047AcVjW2mxs/SQxbE8+jVjUZWI=;
 b=l+kcMhYMgSxzE5imh4hLEOk8L+0dLrhfjnxXV35+sdB9Mtt/HwDaS8RtTdD3W2jtAJ7zzjGjyCULAeDAg8ZE41CNsRMQfDP3jvBSQQrBRvP2NLnsvCA4RnG5DZ3kK1/TleoTpbuLmfMSdbi61XclX2bMv+Xo4OcGZuePVQypZMzOdRJFhkGEegwkars8Kyv/lw9ovzZi3nNLBo301ViqUCYf8166Vt7PtmA2MXAHxKwsxP7z82+va8xLDrhib13BcKahKeIIUydZ+ZwSUhECUDbOJmw0lm7OGBLWeffj5oqOAKKosMhI3Mn73qvRSDgChgZO9iaX9Qky/k6fErJ9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO6qQWqwyorMYGU7047AcVjW2mxs/SQxbE8+jVjUZWI=;
 b=gWgkisaODfoSLdV4kbIjfj1gT2anbeFdrIFXpnqR4XXqdrLvPmDiKzN7vQK8+TNBJw/qF9yM0HhUfQsY4Jc8QwSqKqOFHrH8DM8lnLlxhno24enU3HVZeo49Re0hXsxN1H0uM8hoq30KEP3qbTaXXcEn/KHOKlmzwzb37EV/WvU=
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
 <20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
 <20210701170009.5a8be33f.olaf@aepfle.de>
 <48cfe27b-70fe-36aa-833a-7d78e205528c@citrix.com>
 <20210701171819.67968d4d.olaf@aepfle.de>
 <dc9af473-b613-721c-87b8-d259a2448c09@citrix.com>
 <20210701182303.53756e1e.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <967b6463-c1bd-6ced-bec6-bafe02310e09@citrix.com>
Date: Thu, 1 Jul 2021 17:28:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701182303.53756e1e.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67977f58-f8b5-4ba1-ddf0-08d93cad439f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4120:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4120EC256EFBF4CB108345D7BA009@BYAPR03MB4120.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/1fXh+xcW1tXou7PzziEIAPwxnucCpJ9HvcQfCu2lg8XFuR5LmUvTHv7LJ45HvW2DcUuP7rYCkTiqxhfCGfsr4Msz8C89TjdDihZEg+pyp1uUdHKDAJXRU8iXYmPXtbcnuj22PFm/u/ORW0Af1GEJZFszzPrl6ibpWmjqAMGUNcOxxIm8/1O/HhJDzMlUjX5AfOPXdzOSy3tv+t3JpNGNFVtCy/N68QA58OvK7nyDDCrsJ0zD0FU58LUIPff9V237Q0PKLxS1VGRN2hnfpbkdQRvagB9adFpPk7GzcIjGMVrlcxTGCRvGY7dwstLcEU2z8ZsbVTQqY2VRfnF6mmLDCxH+SJ925nzzRhFa4gFfsSDjI5Hu2B+Ya5PovWAPsyF/psyikjLM8FT+n8+vIxgARZ909iSywskHqnxztSkEDbM2lRhvLFqGVfKJxROUhLvIJQgRQHEnB6SCnNXQU54I4HkKwKt48frhOjpY1ZyocIUsbtkmipGMh6HQYRu3HzDhBLlIOT07YtIWkXJI9wBqRcS4ZOmjr8uQEOcXcekGaV1pzatEqj+MKiGWRPFKspIhP9z0mIH8lNm9ZPjBlbrkUTiDYWNQhNSh9eFVwq5E6CvJBei40Uhohr4YtFWmHNl7Y4+hZEfqs9iocXbckfjsw1WtHxQO8vWEBFRJAqPLbOM1hPG9XyRgERTaQHEauf0G2ytIeQwAcXW+oGSrTx+RMli+UJAuTJMi1T8VwvGFfivt52ZJIsAn9VZYx9ON12
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66556008)(66476007)(8936002)(2616005)(956004)(6916009)(5660300002)(4744005)(16576012)(86362001)(4326008)(186003)(2906002)(16526019)(53546011)(498600001)(36756003)(38100700002)(6486002)(31686004)(31696002)(6666004)(8676002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzIvTXp3L3ZFam5Mc1F4WUVkUHF5RnFtTXRWVFBob0wxTDBqWTNDMHlRK2hO?=
 =?utf-8?B?T25lOENzcGtMVjg2d3B0QmhKeWRFbktJSEVzOTJHOWNYbnBlZXVpTTJDeXBC?=
 =?utf-8?B?ZHlNTnVwU0xNNTl2Ni9VMG1yREdIZGJUcTdPMG8rV2FDelJvQWN4Q2x3L0pa?=
 =?utf-8?B?N2pMRm9VdW9WR1J5aGc2YTJMZEVKRmNmeG5jWDY3VmVrOWNDbEpPeWtMYlZo?=
 =?utf-8?B?TXc2QTY0ckdSeTVzSjJuRUFtU1RrNGJvaWpKV0czUWRiYkRha1ZzZmtYbmlm?=
 =?utf-8?B?M0RPb2s4S05tR3MxVnlhV3B3MEUvMWZxeFpUOXA2YnB3NmpkN0RKSnVIbzh2?=
 =?utf-8?B?RWhyTkVUakNvQWpvaFF4NXFIL1FyQ1M1WVNaaFJZM2lsN290NGwxdmlndmlT?=
 =?utf-8?B?c0Rya2hsN1JUY21NSXJFb2J3YkdMUE1OY0FRMXA4U0JZK3dCZ1JaUzUrSEUy?=
 =?utf-8?B?Y3FFQzB5anh5WHJzdm5uY083STgzdHZYbnJ5NUlISVBodlYwdTRTVDl2SGZr?=
 =?utf-8?B?c0NvRVlmZ3NyTnRBSFp4VTZZYk1ydC9MSkhydGpNR05QdDFxMkdPM1NRS0Y3?=
 =?utf-8?B?dDRST3RzVjZDUXFDRnhBQVlaQTFsUWZsWFA2S1NQbkxKeU1DM2UxL3ZwSmkz?=
 =?utf-8?B?OGtFR2l4Q2VCYWZ6cy9paENIdlNjQnQ0UExpSFZmeU4zV2tteXdlT1pVN0d6?=
 =?utf-8?B?U21TYThUcTBUSXdsRStxVWhNeFZpa09XTm8rSlUrZGpWa0NUczdudlo3TmJQ?=
 =?utf-8?B?eHQvU01lUjRxOUV2S0FPMEpDdndxTCtjdU5VYWE5bDRzakd5K2tUbHc2MHYr?=
 =?utf-8?B?R3RnN05OQ0lDM3VJMXNCVVhSZGVLSUNRRUhlRGpRVk9nMWt4MVhqa0lXbWtP?=
 =?utf-8?B?TVNMZG5kS003TDVDcUJ3WVJDRmt3ckp2K3ZLZlloaGo4YzlHbmVLN29oN091?=
 =?utf-8?B?dHJwY0FwdlhKamlkM2FlTWFkbTBwSDlRTnFoZTB0RHBVMW5GNGU5WW9HWSta?=
 =?utf-8?B?Yk80bTMvbmFNaUlQR2ZjS2VLS0hvbEZXUXgvaXhiRjJrbkszWG5YSnhsb3pu?=
 =?utf-8?B?dVVlNHdUcE15OE9YSzRsZWE4VVpzUG5oWDRQYWtDRmttY2lYODVxVHI2aUU1?=
 =?utf-8?B?ZzcwcVhWRXZVTmsxUGpaME5oRWxOaVFwZTJlMjNmeHp1d1BjeFRuM2hMOGRX?=
 =?utf-8?B?U0J3clFoT2tMRFV4SWxQY3BYWUZYeUlYZ201MWpWZFQ0RjArV3Nmc3A2S0Ns?=
 =?utf-8?B?Q2pnNWpJeVdTVHYvY1VmcVBoTjlDanFHT1V2eHBYdXp6SEVxdWFadmhaMEFD?=
 =?utf-8?B?VXN4bVRMVTJUb2F1SnZjenphK3ZsaHJ4NVNTdEFsZUwvRGNtdmFjM0JzSkIv?=
 =?utf-8?B?bDJjU29MeXF2bnM2TzVjQnRaOTd1Mk9ST2lZMUVuS3dvd2JlOFdOMzZSUzNT?=
 =?utf-8?B?dlUvRUN0UFdaSjVEYmJHZ0ZhWlRRZFpMOWJMZmg0Z0Y2bXJNR0hhKzRZSzdz?=
 =?utf-8?B?bUFHMmVzblBTMGozbUJYOGZOam4zMnhOVDloRVFZRGpGenplNUdaazB1VFdM?=
 =?utf-8?B?OE02RUhWWU12bFlyOXN4RmpmSXZwdFJKVmxhODErTkthemFhZTEyZVMweFN3?=
 =?utf-8?B?YzB4cEZPVUpkTXY2TFJIWjBRVzVMaUwrU25UczJmU2hQU0dTMU84bFcvQjFB?=
 =?utf-8?B?OFlFV0d2NC9wSC84N0UrZ2FPbFVxdjNaOXZGQi9YSUxNYnhhcStyU1hpOThx?=
 =?utf-8?Q?P+EbFUf6T4B9TPL3OK+FYihcwPg1Ol8abypPe0f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67977f58-f8b5-4ba1-ddf0-08d93cad439f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 16:28:31.2554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjmYlwwnhZeREY6qVlXUqKbxtCqh5HqbRKSpAzLwLOs/LyGhIHFn5NiCHX25T1ecjUE45ErMPm6p4as3W8LI7xlV1PfNVESeJllMzHrPhHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4120
X-OriginatorOrg: citrix.com

On 01/07/2021 17:23, Olaf Hering wrote:
> Am Thu, 1 Jul 2021 16:25:10 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> -        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
>> +        p->extd.max_leaf = 0x80000000 | min(p->extd.max_leaf & 0xffff,
>> 0x1cu);
> Yes, this fixes it for me. Thanks.

Fantastic.  I'll try and do a proper patch in due course.

On further thought, I think I'm going to go with the slightly simpler

p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);

This is a policy obtained directly from Xen, which means it is running
on a 64bit capable system, which means that 0x80000008 is the lowest
number which can possibly exist in extd.max_leaf.

~Andrew

