Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F133E83F1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 21:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165471.302376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDXlE-0006h8-Ce; Tue, 10 Aug 2021 19:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165471.302376; Tue, 10 Aug 2021 19:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDXlE-0006dO-8o; Tue, 10 Aug 2021 19:50:04 +0000
Received: by outflank-mailman (input) for mailman id 165471;
 Tue, 10 Aug 2021 19:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvVY=NB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mDXlD-0006OU-1w
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 19:50:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d2ddc9-dd4f-4894-8779-619bea60bfb9;
 Tue, 10 Aug 2021 19:50:01 +0000 (UTC)
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
X-Inumbo-ID: 22d2ddc9-dd4f-4894-8779-619bea60bfb9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628625001;
  h=subject:to:references:cc:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YNxCxirxpUBrUqMu7sLOOFJ99bvj23/TcHgmFgvqAZk=;
  b=e7WyATZIqv3piwxRaD2KxcK35ySnSJdziQBcpBW1KG6ARzBTQUOtmCEm
   CDUS5Pdvd8l9Yib0Pyme8UWk9REOnHVlRHg+rDsPkdwx1lcEZCKFN9dfw
   8B0siHgQVm/Or6Cjn78AJ8Eu2YgDElG7xF2YT/53zg0bOW8FZ7aN4P7F9
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N37LiArgoc1wZOKmB0k3MBJmvo/QhbZCVLnB8J5Ywk6nFfRtccpvoJpwYFnrHaJRl2yXYkRm3E
 ObRuX/16sqFiZ4c+rYc4G59rCXZJBhK1XCfBxDs0UThfCm/Hir1pGYw3ytEyqW8/PpLpE6sTMC
 USy7TfbOijzg4B7DU8wYWxD25z/9GLI8Lvyytz+x5Gscs/BONmDZaitRYZ+1sPW2TH2rOp8Gut
 Y3/0+Z9PXCylj1MEvrpqx5WoflyK8hwOSznN6SpFylXe1t/2cEgXd7bUicAdqEDydPrplnKjnC
 rm1nsLslfLAlxLiAeRHbBkjK
X-SBRS: 5.1
X-MesageID: 51855747
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2aZOo626lkUgPILu4sYaTwqjBTxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YHT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPz2CKZsQizuRYjzrY3GeLzM2Z6bReq
 Dsg/av6wDQAkj+Oa+Adwc4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsKuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DgfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjPkV1FUsZiRt0kIb1C7qhBogL3S79EWpgE486Ig/r1bop9an6hNEqWtjo
 //Q9dVfLIndL5cUUsyPpZYfSMbYla9Ny4kC1jiVWgPIpt3c04lm6SHlYnd29vaD6Dg7KFC1a
 gpA2ko+VLbRSrVeISzNdtwg0vwfFk=
X-IronPort-AV: E=Sophos;i="5.84,310,1620705600"; 
   d="scan'208";a="51855747"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsyXQBRQ2G7yqHYA3TTac77yx+joNYeeAoB47T1KFb67XkwYpYE7OguTu2zLv2+40/J3RjuDUrn9OnUnpY8pQqmQiqj2LCr+LJCsyVh32oGkB2nSb07q+1zC8aMa8wH+1uIDylMJjgdhM9PURDRat5NXRYnCFqdvg2lfQf39k4O86b0IzKs+G3TadVyoC/klDAsru+g4u/vb52dvc6VX+tKLhaAWZHg33aom2RhihvgwSmnetH9G93GSiwmymDhaN4GngPti0jQzXOnm6pczPifcq+WePV2HV/lHmdm/luD8VSNDb+Wz3OQOIRROhVoCpV8MamdxQkjvI3KScgsvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNxCxirxpUBrUqMu7sLOOFJ99bvj23/TcHgmFgvqAZk=;
 b=Qpxp40nPq5x08MjfkoEQHkBERIxU80gXY22VnDpVVjYVtdICmcl9Vl6xROJl3jeZ1bZAxy8X6rh7eY+NJ4cw8uFlmiLnDu4M9lanS0ZHTPp4gAG9ozUKjnogQH7B37NHBW8jfOoIiomMhW16VAsO3/P9T9g86WS8IcNZdUhbgLl+iFk38vOZJQOy00fRCCx7tURruJBAensi2WLSEuDiZp4Tp0DGFQzmIA49etQGM7oCEDvbrKOKPcwE8Qg1h6CP/SMzfB4YM5Y/imKOmhEIRG27EAtjzPqK03ra5gxvPLLQvh6vERAD5G9MFeRcg+GAgt57uxbUz5P7wnmE9PLX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNxCxirxpUBrUqMu7sLOOFJ99bvj23/TcHgmFgvqAZk=;
 b=gO8ptPvCp/+5NwjuhBVbw2QwUSL71QlE7/wXPWfqeI6WXpj0QgRXj5Pzzw2lRzxI0pXhvi5BEkSxamqteato92SX00Z1qKY6RV3a/qjE/JnGt/exxdOp7Vxqzt10yUtNcL+L9G37d3P5Zv566I15kPYBDA570+CQnPgFGyTrOqQ=
Subject: Re: [PATCH 1/2] xen/kexec: Remove use of TRUE/FALSE
To: Kevin Stefanov <kevin.stefanov@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210810174737.56297-1-kevin.stefanov@citrix.com>
 <20210810174737.56297-2-kevin.stefanov@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <04c8b4e2-fc2a-f425-2570-5a92e3126cc2@citrix.com>
Date: Tue, 10 Aug 2021 20:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210810174737.56297-2-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78d81647-f1a5-4438-19f5-08d95c38070a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3862C186E79A4E9B6723477EBAF79@BYAPR03MB3862.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ff2oLZcR00VrzxoOitOYZhU4nYfmYqhPVuv6vgIg/eUmJkbTepeEboN6+8r6yIkefeZIm1F48Vj5fiX2DbwSFdlQ5f5KoE9YXveR9KO3mW/GnZWeiWOAHDUlJ+dEw1LMfZ+hMnrEiWvTU6xwYcsuFqAK64DLKJ00dJQUpiDWhk7943JDggVMrajHxBKcNcupYACNRYa8qCaPRfGMYTz1hSZ1edQAUu1APAX/DSx40B89Jupx71X/pC6OQiMgtimEK/guNb5uhqUZWvPXGCQlO6aDioFEqBXH5rVK6lYYacStiB19R5mBZcJ9ndsJRHf6qeHFip1NOXupUlUrdm5L8CrxyZk9ajuUECuvLv0mjrrbwPnucAhgAvF/ibkrmKPDPQnZUJvqauGqhZ6UeQ4CPV2LP6OBSxoI35m4oxgXvmFau2otrnRqgyYQwLLrcGVcMHm+gh9KU/9+4GBb97W4X7Onungn5pq58Hw4Z5eB1nijIuU+dpY4SKHENmhp2X+JiAEvSEHqhKvc72el6wGxzjR33TZc7+8GIwn/U/LLsRsl9t6HxSpSJsrLduO8I2cjSEYuyn/U45PeOFdlhX7BIXPyoqanbNQ8RuM3Eg4dGQWdqaUsw1tjXaKPGLW0CTMU0p9zj7e9XJj3uUPj7i/R+UwLVA1H4LtKuwn19o9TyIMv0+mFOaW/H2UskuKHUosaUC6LoVdrGN7yhJUkSxkIw/82zKHHWvAivICHkpzcu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(2906002)(6666004)(110136005)(4744005)(54906003)(31686004)(8936002)(6486002)(66556008)(66946007)(86362001)(31696002)(66476007)(53546011)(38100700002)(316002)(36756003)(8676002)(16576012)(478600001)(4326008)(956004)(5660300002)(186003)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnhkVkl3dVhLWnVvdmFCbjNnY0FEY2xJMm5NaGp4OEpEY0JpMUxDcFFla1lo?=
 =?utf-8?B?WlpQRFJSb0dlaVJFdit6UEo2WmpabDh4bVF5a0JqNzgvVytrZXNDSHpMdS9C?=
 =?utf-8?B?VkoyYnFFYzlYOThHREIyVi9YL2dEN2FPcmIxalB4RTBXcXpyc3BjQzBJL012?=
 =?utf-8?B?LzBmL0p5L0lTL0l4TDFhaENZVXFZYk9WaFFDSG1kbDdiNHdzT1RhWU9tM3FB?=
 =?utf-8?B?UXJDU1JsVlBOSXRSSTNGN0FvM1lyM3RpWW1XV2JLSER6dWNZT0VJSUVNOHFC?=
 =?utf-8?B?QWkzSDlZWkNxbG1xZnF6ZjkzOThnYUlIa29tcEJJdjlFSEVHRUZxbnp3Sks0?=
 =?utf-8?B?TTlWYUxiQUsvVGFDRGphS2QrVXJlejE0SEJYc0duWThhK3owdi9wS25keWJL?=
 =?utf-8?B?K2pnSGRrMFJjWjl0cGE0Z25hQnBHQ0ZNSWt3b0pNL0JXTmErV1dveXZpbWZk?=
 =?utf-8?B?b0pFbzZ3Uk50SkQ2VWFrbS9iOUxuNFY5ZWtodVpOd1EyUHkwU1pVcFlkWHBl?=
 =?utf-8?B?L3lJOHgwYzNJSW8rRkhQNDl4RnVIL2s0OWRLVjNtaWhZeC8rWHltbHJUSjdl?=
 =?utf-8?B?d2FEN3VCcHFpMWZJcjNaTi80bVdsRjF4czcvS09uSHRTR2Y1R2J1dVBOODJ5?=
 =?utf-8?B?c2lVQk4xVFlpWU5NajYwam5wR0VLaytDV2pKSEtqSTBBVzhDRW8vaWpycUY0?=
 =?utf-8?B?WkdLWVZWWis0L1Myb3R6bWpaWDhBTitkMVpwbUZzZm5jSDFablRja2NDWGxD?=
 =?utf-8?B?ZG5qK0tmSWk2TlBmWEZhQW1taVFvU0tKZ29wRTZTR0tKMVpMSU92SVFLUURt?=
 =?utf-8?B?cmdJYlRjTGQ1ck5hQVpLeHN1UXBJN01PWWdMUllpeDdOb243c0M2WC96MFBr?=
 =?utf-8?B?WnozRHY3YnF0TnhPVWRRZ1JvV3FiOFlKekQvUFF0RlJyMHh0bmFNK21sRVhD?=
 =?utf-8?B?MXdnaGQyemQrMkZXRGZxOVNpQi9LdDJ6a0VINUJLSkpJUWhaVExTeHNTWnM5?=
 =?utf-8?B?Rnp3NVZ5MmpmSiswWEI1TVlhazBvQlo2OTVlQ3BDaUY0WUN3QUlLMjQ1KzB6?=
 =?utf-8?B?VUQ1VVpMQ1UzaFdYcU1mNXJEK0Y3MS8wSm1jRVN5cXhrWnVWRXk3aFFZT3M1?=
 =?utf-8?B?RnFCOHVzMUdGSWxWRVdSS3RsM0ZvQkJTR2ZDR1JSVzVub29FVENVZ1NSZEQ2?=
 =?utf-8?B?MFNJZ042T2c1U3hleTF1VzRtS3FFeVpidGdSYlRuTU9tZ0syU0ljZXNSd1Aw?=
 =?utf-8?B?di9SMldFWk1XSStPWCs1a3VKdklnTVBXeFcyRUJ4ekM0ZGxRdXZWRXloOXZy?=
 =?utf-8?B?KzZuTzIyQkZuZzVsRWN5M1Fsc0EwQlBJVHh2NjlWQ1JDVmtCWDE0NjUxUzla?=
 =?utf-8?B?by9qRlVpSkpwRHc2Ynh3dGEzRjJQWmtGWWQ0dkxaUUFyeDlHZ0xoU215ZTBm?=
 =?utf-8?B?UUdJTlc0K2lSOWVVK24xbkxWNlJlV3IwOWx3TE5DdFY3c0JGdlJDVDVVSXA4?=
 =?utf-8?B?eW1mTmpTOTIxUFRXeWRQcTR2aUxBZHV6RTdFNkYxL0xVNTRzQ3kwcnN5RGw4?=
 =?utf-8?B?R0xZcjcrYjNOVEs5cDZzL3gxRFBDR2tXN1R6dUxObE85Uk82YkxVMHNmOTRj?=
 =?utf-8?B?aVVvYjRWUmlLVXQzR01JREE5K2NLRUdJNzhPcm4rNGpjVnNwdnBXbnJ1eW9K?=
 =?utf-8?B?RkpJZGpGS2dFR0lVdzBnQjVIV0ZTTnkyOEVidlVxM0NqMDNnWmcxdFJxa2ND?=
 =?utf-8?Q?l0S6wlWXnSCUsJwLl5V8UQeJwE/XZvliVtm5TUB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d81647-f1a5-4438-19f5-08d95c38070a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 19:49:55.7311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTSsO/tlxp//31fXeuP3LmrjtBDWszW+/e3erf/1TYu6iMku+3NbPeKuPN9pN0twiK7XVWISN3vPpH0fXn864Qt0mdYvSfAQ5Vc7+F18/BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3862
X-OriginatorOrg: citrix.com

On 10/08/2021 18:47, Kevin Stefanov wrote:
> Whilst fixing this, also changed bool_t to bool.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>

In terms of kexec maintainership, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>, but it really ought to have some other
ack/review.

