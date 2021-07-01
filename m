Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5AD3B9368
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148885.275184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxlQ-0003DR-Cf; Thu, 01 Jul 2021 14:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148885.275184; Thu, 01 Jul 2021 14:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxlQ-0003A8-8o; Thu, 01 Jul 2021 14:34:00 +0000
Received: by outflank-mailman (input) for mailman id 148885;
 Thu, 01 Jul 2021 14:33:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lyxlP-00039z-6z
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:33:59 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e768744-da79-11eb-832e-12813bfff9fa;
 Thu, 01 Jul 2021 14:33:58 +0000 (UTC)
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
X-Inumbo-ID: 5e768744-da79-11eb-832e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625150037;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O+qBSKO2+RUDIgebvioIm+C3sLL6oFNRAelxqHCs84k=;
  b=BybZb352AEPxijSZ8XS9NKNBZM1BdfF1tYuYcb7KnoMPcupm7a+4pqG/
   hOFKHXFCVNU0HwHXi/rM8bfOlhnq9lWntlwuM2KOkv2sfMqJYZ6qO7SFy
   az7wGcAXCx4SaHzGaoDiUup7xMVuaFBuhKrQCkP0EE8c5ZRejPwOtdIrn
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a82aOPRQx/nSrCKDlwoAPX+syTSqIQMruZz6N7vZvfjX53EuxnwUx5Y5U00pKK1V5aESPaCPqy
 LbfG/z/C1aJwhCNpDZprRt1VZZ0A/9s3neohdXPFIi41wi2irekK3ejEYd/uHei3m7/+0P7K86
 lQxY7JbO+BP6PqKjxwNWzxqlKNRGdG40JdW+zWDXoNx3OPdJ2C8hI24+iVQPWDH7G/gEtaRp9I
 ye78RetwUPCClRYJEw1ZSPlcaUR5FqwKp7kSY5jRMyOb+FqM4cDckMKDXTIsPuWAPIb7x92Hta
 stc=
X-SBRS: 5.1
X-MesageID: 47095733
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RqCfVa/rb8CwgErhkKJuk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qADnhOFICO4qTMuftWjdyRaVxeRZg7cKrAeQYxEWmtQts5
 uINpIOcuEYbmIK/voSgjPIaurIqePvmMvD5Za8vgJQpENRGsZdBm9Ce3am+yZNNWt77PQCZf
 +hD4Z81kGdkSN9VLXLOpBJZZmNm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZvA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MBkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/j9iuLMlGftsRLEkjQRo+M9qJlO91GlnKp
 gvMCjk3ocSTbvABEqp51WGqbeXLwYO9hTveDlJhiXa6UkPoJjVp3FojfD3pU1wg67VfaM0rN
 gsAp4Y4I2mcfVmG56VJN1xDPdfWVa9DS4lDgqpUBza/fY8SgzwQtjMke4I2N0=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47095733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORCvRhTxcMcbFhHVBzx5dBP6q90Dbidu+UgIrbQ95wTnvG88orMYgiQ/L5mMF4CFRghmMChaxzdMHqvGMtJHIX/N9yYHCX6RucQ3dM+p2bkjhG9AX7ilvBzdaHn7LwARAr17q2NVH7H21DILhBvy26ZXNc6fITt7s8oGkkjHfWrHX9jUB4SJTk/Sn3afhNaMJ9II+dmsaXhFH6cZ049fKYf+6E1pP5NsMaGzD29JaCDnzH4lHkN/5nlZfpTkwqrnF35EALVHAPKIoRY6IuL4+yMo1o6xNcckYdftJN+hVXzK4t6sRoH8efEhHibWY1SBVfwhRI1gM6otAbMCtCmgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+qBSKO2+RUDIgebvioIm+C3sLL6oFNRAelxqHCs84k=;
 b=fcdthvYqjpJT5i/BpEpGoN2l0TMBWqO+Daw4x3+q7uKBkV5xPwHeCiC6pcupYtjMyDKA3dviV/Rv8LidOiPnfyZy+4aIWMisWKeMNQ6aLemVP2xOESSCd0/KmkQbPJZpllJLrCYRg4dtMHcUggp/E7TS3RJcnSgCHqdirCcgFEcQxPiyKce/n5uk+Tx0/mys1t25J22FBiDa70RjZjYkdzTiXth6gC21jlsCrLzLdUO3NEfN7zHFIdFtDrWPJ6HrU+BPMzaWGSOKHFtOYi9KPXVLY5o51Jjf+cLnBV0xknlifwyLmLB2HwnTuBkayNLmd1L6OEzr6Na/wECdeXmOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+qBSKO2+RUDIgebvioIm+C3sLL6oFNRAelxqHCs84k=;
 b=eDMaATME1a0urN0y5W1vG+FSPC/YctRhTMz7eJjU6Sat8enGcvw/SH+pOlwe1Gz3MM9YpayiIcTFZ2BHxFeOekD2jTQlhjBcCUtUI916Dimbuy+8Pq+NoQWgAMV26+IxnXRr1Rss4THhCj0Ou/Kxv7U1ehn8QEuNf4xXK9nqx8o=
Subject: Re: [PATCH v20210701 03/40] xl: fix description of migrate --debug
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-4-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <038fa686-c7e8-4afc-e84d-216c3a3f6d5b@citrix.com>
Date: Thu, 1 Jul 2021 15:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-4-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0396.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67879142-c152-47e9-6bb4-08d93c9d40c0
X-MS-TrafficTypeDiagnostic: BYAPR03MB3991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3991DF4E79825DDC659E967BBA009@BYAPR03MB3991.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0DdLtBlum8CrVPv+HqM8us89Vd3hFwjWFj4S1AIt88pfEy60Hntw0UpR4AzGwBJpqSD4CSotI6ChIhQx0LEY3LykKgR+J9AKT00Hy7xlRA7KZYIN/scuiKMgyKU2ho1CFhuJ1no8Cy9jYqflHRRyfbcY4mPhWu5XylM9ovXERvbyQVJgCT3oXT9aiHRx9C22DkRj8+lNz/B0NECThl08TPSwMyqK5vIOif3FZ+mjZeyLQOA4s/8IknR7/AEPrhoYuEaZBim36Ps4eDO3QB2bUhDMvdQPLdQiOQdllO/c4O39kU1kcpq8n3377KbbUZdSZypwUOUUDKhrI/y/KC+yPNgU1uhdDmKSnPCIxxezF0R9CNZCo/yqjmYed3iP8hdb2ew/yx88QiU+d5AYYa19sS64G0eqKrWXJY8/eJAd4vkvBA4AgCYkLB6ZFOuE2SSJqUbN8NA1LoWiL54RyXXbJn75Kv3akGscUoTDUdHh57Ql1FFunKCUfnnM2euEdQnqGwu9bhTgOZafIls8aER8bvpGHMYt/nTb7LIaz/t6TlNPJvXV6vpEvnT6JsIp9hTsM+SycH129PZltaf2lrKjVTOjE3tCoyEMsvI200fxLKgQ+HX7Y86SK0xSE639qybkNjP2XmMzF+4bliQyTkXDHvZ9asdD8ud0jA82QoHSaEFoZNLHneOpYiaf52faeqmhRpwj73+4dXIfaZtlSy0D8pY/G4UIc/SM/wbnjeB2AEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(2906002)(316002)(31696002)(54906003)(66476007)(5660300002)(6666004)(86362001)(4326008)(16576012)(4744005)(107886003)(26005)(38100700002)(6486002)(186003)(66556008)(16526019)(956004)(36756003)(8676002)(31686004)(2616005)(8936002)(66946007)(53546011)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnlWc2lDUDJvb2NvNEViVWRzRWNwRXg4WEp4eDlrcEhMMDYzV3lmbUFrVzYw?=
 =?utf-8?B?UlV0alNOVTRIZldTY1ZwNW5qb0w3UnNIc1hQd1RWNXlPVlJKS2JyVTN4RENz?=
 =?utf-8?B?NURYZC9XYTFxYXM0S29lRG85eWtIaDkxS2VPS2llTTkxWHNZclpraUxnUis5?=
 =?utf-8?B?VmRhWUZ4MkRhQzhjS2Q2cXo2RWtIVEVsdzFBcWRxL001Y1lQVW5oamhtSkZx?=
 =?utf-8?B?N09XcjVrZXdObzUwcTRCbUI4U3hwYnZIbkZ4NHpHQk5NVExaTFdUMlFmOFhu?=
 =?utf-8?B?d0x4SlFtOFFURFRFN1B2Y1dxK1VqRTM3eEtrT0REZDZNSkp3MFpFZHF1ZnlU?=
 =?utf-8?B?MnRSVXRveDhoRkFna0NTN2RNRVVUMFFnd2tGRWVYVFc1OWFnNlJ6OEdYN0ls?=
 =?utf-8?B?ay8wUjQrekFrMnRXOVMvM1l2RlJ5dmt3N0d2K051QzB6Zm93dEZMaDM1eVZM?=
 =?utf-8?B?TEJxWDR0b1JhclF3bW9BVTBZNDBVYXlhRXNWR2Y4ZUVTRXB1TXdJZm1NeEk3?=
 =?utf-8?B?N0tlejhmekp0ei9KL3FSSXdrbXRkM1lrbVJOVzRQanM4TWVEaVdzNENaMzdk?=
 =?utf-8?B?c0ZVNGZpSVhWRktqZnFxcWdqcHJVM1kvaEowSjVaUkxYYVlzRk8zYThkbDRq?=
 =?utf-8?B?dnFJbTVQZERjWER5cWt4cUlvd1FEVlBQb0UwWjYva3o5MXlvQ3RrQ1U2OXpN?=
 =?utf-8?B?WC9jd2RkbXM3OE1NRXVsZ3NTZVUybUx0S3NqQW0vMk1ueFhPeVAyVEtwdUt0?=
 =?utf-8?B?bFpLcXJmdFBBb0tralNGT1hqTDVxSEpKeVIvNVRpMFpZZHRaNWo3UU9BOVBp?=
 =?utf-8?B?S1dINmMxdm0xczdUeGVtc2hWWTBLdmpSdlAyV05tb3E2UFVRZ3l1N29Dckp2?=
 =?utf-8?B?TFNjRVVUb1RvTHUvbWNHMEdhYllxbHN0TW13bWljUTAvQll0cC83Z0dyVHpU?=
 =?utf-8?B?bVFLTStrdEpSU1BmWkREMVk5Mm9WL0poSFdwMDNmL1FTb3pjRmt4blFFS0pa?=
 =?utf-8?B?NjE5eXlkTm15Z1NKbkVZdVQrSmJYRkhzeElwaTRCMVE1a3dOSnduWFFISVRB?=
 =?utf-8?B?NjBpb2Zyc3FzZWhXNytHNzRDZ2xvK1JySGhsYUd0THZUTW5MQXVwODROTktQ?=
 =?utf-8?B?bDFXVmhmSUs4NWdwcHl4a3plWVQ4U256TVliWWhaWEMwaW9oNkcvSjhtT2lB?=
 =?utf-8?B?QjNYS1ZRQ0JnbW84WWR5RW5CZkdYWG40cjJFRVhIRWpqSDdEQWdHU1Vtb2VK?=
 =?utf-8?B?UlVDbFUwL0tDZG0wb2Z3WW84ZVoyclRDclc4cENSbVRmVlJvWGxNKy8xaTI0?=
 =?utf-8?B?NnlpSGJnbDVLSXRWZVFpOEh2SHR5L3BmUkNXS0lzdzdGSE5iUHJidG1hcU5s?=
 =?utf-8?B?U0d5RiswVDVaUVQwc2NyMzh3YWtiLzJjRXNnQ1Jnb0NzZ0FFU3BoMEZnZzIw?=
 =?utf-8?B?K0hRaXJkcEFqakVRQ3F2OWpQVGpIQUNSOVIrQnBtMC94TzVvS0o4L2ZjYXoz?=
 =?utf-8?B?UWNDUTBvNU1GTEZ2cmxLdUZTbFdLUWFYbTkvRmRkZmRRZm8vOUhRdmZyZ0hR?=
 =?utf-8?B?MzlIbnJBa2RrMXB0cHliQnlRSDBtdnFNRGFGaGgzQUxEQVFPOXdya0Q1QUJz?=
 =?utf-8?B?clJrT0ZMbm1uSStkZ3dWLzRQcFIzVVNlWXFvZU0zRFJNazZWTVdEdGRHMzhu?=
 =?utf-8?B?WmtjaFE2UHNqQnNqMWVkVFpWSm11UXZxSGJRd3YvQ3E1Z2h3WS9oZDJMTW4v?=
 =?utf-8?Q?7DNzGpO0AgOZsWPRSsRywFS2y2sq/QUC+daWfhi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67879142-c152-47e9-6bb4-08d93c9d40c0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 14:33:54.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDBjX5j/JH1QJABXqGWJCWKX1uowpdwWzAzSqeu+6uR3PMsVdOEAtHd3jF3oPKbEPVTUt0DdnJu3gphzBVvZHb+078M+SAnnxgr7Ih8NgkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3991
X-OriginatorOrg: citrix.com

On 01/07/2021 10:55, Olaf Hering wrote:
> xl migrate --debug used to track every pfn in every batch of pages.
> But these times are gone. The code in xc_domain_save is the consumer
> of this knob, but it considers it only for the remus and colo case.
>
> Adjust the help text to tell what --debug does today: Nothing.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
> v02:
> - the option has no effect anymore

Since when?  It was absolutely critical to debugging issues during the
development of migration v2.

~Andrew

