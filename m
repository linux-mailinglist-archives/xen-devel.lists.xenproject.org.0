Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7BA3F75E5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172324.314336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsye-00019d-J0; Wed, 25 Aug 2021 13:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172324.314336; Wed, 25 Aug 2021 13:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsye-000176-Fb; Wed, 25 Aug 2021 13:30:00 +0000
Received: by outflank-mailman (input) for mailman id 172324;
 Wed, 25 Aug 2021 13:29:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACUI=NQ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIsyc-00016x-QX
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:29:59 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a17e1dd8-beb4-4012-923d-a09a184f85e6;
 Wed, 25 Aug 2021 13:29:57 +0000 (UTC)
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
X-Inumbo-ID: a17e1dd8-beb4-4012-923d-a09a184f85e6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629898197;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wsZkufzV4CQDK5bfgvhQQik7S6ylj+QckcY/+jFaYw8=;
  b=HxAPGw6/Bnmaz3GL7xyqUVkLH4k3vTzioFZ/2n64c5UPYZOdFnc7pfkz
   dp4ETwYDcY0k7/UjyGe8waKMUHOAAVFZ4CQOF3d/Zrr9Z9gCWJIXyx8np
   nrSQqlA2MBE53DlfMDTS/r08nn7GLJHD81QjDjE5J9C1QQUM3C/LF6TBJ
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dxpGZNa9bzNwfBVLIGz7qGXDxxGEfRro8yxfL+SI67Ug6vsVVSQiwUECm+Ct2+wxRXOYtQ7Eo7
 Q8hs+vlKFROysWfFqkknInPTD8rCczvqYt7ibrImYE2vRRMveD6ivvBvw6MHYtMkcagYIDSXkk
 pEDdgbT3hUqD7PxuU8ciZZkYBG6R1M3s0GPjHWfl1twe/QdRoieESMz50M/M2AHUVfP+xalXlW
 4fu6AOtY29sstxpgyF1ah0z1d66mn3VFHwKdbCe9nPSJrWWC319xawA3LO6P/ncumh91ZPwO9R
 ChZiFv9yqFgHrN5WAw6b8Y8U
X-SBRS: 5.1
X-MesageID: 51276390
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oQMtSKFCEvhZDkffpLqFf5HXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4hgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pat854ud3AMV0gJ1XYJNu/xKDwVeOApP+tdKH
 PR3Ls9m9L2Ek5nEPhTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHpVIKM0lN
 gtMcxT5flzp4EtHPtA7dw6ML+K41r2MFvx2VKpUCHa/Z48SgXwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.84,350,1620705600"; 
   d="scan'208";a="51276390"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKdiV0mzjxu0XlewfWF1HzUcMgQHpCFDcmH8uQgXLa4bcqCHGFLxiVbIOzwuONXDJqpXTHI/38FOOi9ieTZ9Rw2GBqhzeBlcdBTkLAqReJWQLh3hQVUfbEb06zhBrj+3LH+Mxhvnd+XBCPLDi2NTryZx9bMa+Ffcp9LrC+wnu7jhKAkWz6ZW6jRcUkXJRu4ve9D0rydvd38Xwz/M9ip6qN3KRChuyTTNlTKL5M/54SMG7ArUwKgrWs/D5IFcOt/dDchSMbba8C57/T0JAqifCos++NHBp6OvcvfBz+X4M8boGXctf23zsPuBTsddXvnahX+fBWBymdLDhK18kjJNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsZkufzV4CQDK5bfgvhQQik7S6ylj+QckcY/+jFaYw8=;
 b=IPk/bciLAENVZg6BvSi+FfXvbFHkG/DHQ68iC6gsMw2XWhrcUkQ9rWTBWmqf430hisNHPrZ+hssR8V1mtZQT1fhaiOZp/AjSL0Pzbqa24fofF89RJFREbXHXENwVldo0ezPx6NwazwOpzS385RhiVZFG4quhWfr62eCxPjQ9ZCvf+1DDPUqP5URvXDmVLxNr9mE326hcp6JK3B6JEEkUwgC7BpBsbk2Tshy+7h8ustE48AlUNiJJjF3YHodgQe6z6Tz+4EnEjh6gt8gOF1kGJKk9VkSzKI0//+fDQ9ZZbuwMyCgpy/vgIRQPaHlW0k6kvuOlemhUwLsXew/e+PjkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsZkufzV4CQDK5bfgvhQQik7S6ylj+QckcY/+jFaYw8=;
 b=Ed6Enj5Si1fpRhL27yPVEDXzgsvqc+szOMRUu0RS43nKSTxs9jsOSw1tA3H2ceqEAGn5/ooH2WmmHVMCss2XwtVwNd43iSe/4RuCyWbzminbydhLNt1DOj/BtTp1+yD9nK8N5DhS0rEnUIlPytykArcJhdLCcy70GcgBQmBG/K8=
Subject: Re: [PATCH 01/17] AMD/IOMMU: avoid recording each level's MFN when
 walking page table
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <847bf96c-19fb-677c-cb0f-16e58a6abe55@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9043a82b-3215-fed8-6614-3cfe8aa745c8@citrix.com>
Date: Wed, 25 Aug 2021 14:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <847bf96c-19fb-677c-cb0f-16e58a6abe55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f48a1eb-7f75-4e67-34e7-08d967cc6c05
X-MS-TrafficTypeDiagnostic: BYAPR03MB3688:
X-Microsoft-Antispam-PRVS: <BYAPR03MB36881EC131D7A85A27D02B9CBAC69@BYAPR03MB3688.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnAA9g2pN2odKFvun8duf9ZdDXLiZOO+T3Ti6hVegxestu4qOKKhU4bWS+sKWQEYN4InFNoyJ8GbuHgS2BzChjUjmOYOUcTMRmmaxTtA7pS8SkmjqjUbEgjU4GhbdzPg5ToE2kf1pGLVf3jhlNGOEjc7M9zTmqgqAkenNBxNABuCRixbP8XHxN312YWHghT7IKFyOggPs+d83LwGDk9agAykrtaSWzmubXBpenVFtm3z0k/GyOsVNlQk4kpSrn83KS89T5XTwRKVOHK+pNk5AZ9sprGcavkXSBrl2nFimAum9Rn4Uhnl1astrZSa8jBgtHuBPtUeW0Og3pu1R9aPdSigewUZOgB+nJvXMJs7gqeW50rruIZd/mzZfKDoRjpiaAIBhc6cW3aD6B857P+bQj9vT4suN96SwGUjwAkX6UsLeKTClhCLaBgc1aGP/rGeupNtQQdMDJF4Wn9AWcHTSJBWHmt73r5q5+ECj5xK4K2p399kW7jxTZx1ZIDhHh1rY9EPdO9HMLs1sxWYrxYFYiE88M1XTvSm3QnXR5ageuDQZwafLhwWkBLp8lw6rSNKlHyTY701EKblVwsmLTLj8gdCdAXRC7qR3IQTfPfY6QIqQNIbNjZ35RzOH6Pj/PVdHjevn7E790AAUvxMwW2hw+JCeCUxjRdu3CgmswA7cUO6mYvngbDcwGY2LMs29s3+EMol83FOUtJvJPanAU21EAk1YSidd0feq9VRMwkynsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(6486002)(110136005)(2616005)(956004)(66556008)(66946007)(2906002)(316002)(186003)(55236004)(66476007)(26005)(8936002)(8676002)(6666004)(16576012)(4326008)(38100700002)(86362001)(31686004)(36756003)(4744005)(83380400001)(31696002)(478600001)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmkycFhpZWhseUJtaTRBY0paeWRwTVRQMForWkZQZTBWSlJWQWV3ZUZKVnNj?=
 =?utf-8?B?cnBtVXJhYkVvYWVSWnJMS0lueXZpQjNxNTJPUkRmSjZBcDhkL1VSV2U2Slc5?=
 =?utf-8?B?YjNISnN5ZEJwTE9kKzRySFpGRXZ3N1ptcEEyeGFyOXpzbk13WVBsMDBkT3VB?=
 =?utf-8?B?dU9OL1UrYlROUEJxeklFbkxqZk1xdGxyRk9yMjNRUkZjN1JUWHpib2tmNlZG?=
 =?utf-8?B?aFdTSmhwMWtKQzRyNW5yYy9sWWlXVy9XUW92UGxWRkJTbFBaaGRUSzYwaXFt?=
 =?utf-8?B?Rzd3THA5ME9VWXJQMHZhRzhzZDJaMllCYTcwRWwzME9DK3JIb1VyL3UwcThX?=
 =?utf-8?B?UGwyeXp6akE5MjREYzF1MWZBNysyTld0Q3lhVUhzMnIzQU5ZWG1CcE5qTVRH?=
 =?utf-8?B?U3JWTG0rTHVUcWVuVzJiQUFNTUtvUWtjeGNjYUV0TVdCeXlDNTNHd05hS09Y?=
 =?utf-8?B?YmpiYzVxUk9TVTBuRDMzNGNlbUlpSE9hcFIvMHh3Qm5PdXlUdDhEZTBsazlM?=
 =?utf-8?B?aE56bHMraWZCWDluNEVXeHU0SHhvYXNpTmEyUTBkWTJxd0oyYXFuYnVPcXpj?=
 =?utf-8?B?bTh0dTh6ZE5VSi9jbEFrbTFiaXhkOTMzalArb3cvaFVveFVndDJaZjNTYUE2?=
 =?utf-8?B?MUxlTERKZmpWSkFXZUxDL3hVMU5IYjFIMTU5MDVWMW14c3dPejNFMDFCWGpz?=
 =?utf-8?B?bFRXU1lNcS9sa0p1TTYwemttQnlDcjcwWm8zc014WkdianEzbTJURHZJc2Nw?=
 =?utf-8?B?dm5kQ09QeXcxMTdVTGJWUGF4MUVVYndXODczSVdEb2hkV1lmbjdRQ2kyUjZT?=
 =?utf-8?B?aUtXWUdlYVlDR3h0amczK0d3UERXQXJNdVhJZnlEWEpueFJSMGxFdkF3Vjhu?=
 =?utf-8?B?SXFjTm16azIxMHF6czNvS0ZjdE5MN0NsVG5nUXc0TlJqNU05T0Z2UDFwVlA3?=
 =?utf-8?B?WXR0d1hBSVJ0UFdZakZwT0FxQWlqMXBma241T3ZCSEZUQzBYMjZVTHl3K2FM?=
 =?utf-8?B?TGFNR0xta2k5V0FWV28wNmVzeng2SXd5WEN4b1Zoa0hYWFFFbTd3a0dxbURj?=
 =?utf-8?B?ZkU2MzVBMGVYYTFJcllHc281Q291akpRdi8xNm1QV3FLQitsNFhsZ1c1TTh3?=
 =?utf-8?B?ejgwc2wzRWlCby9QSXZEc0VMS2xxQzBsT0VTQ01nMmUxTVlQMGVuMUlBZFBP?=
 =?utf-8?B?b05WTW1uR2lHd2ZCeGQ5OHBIUWFOUkxxVGdiWUsvUjAzSVljWUJ0Q3NEdXJ5?=
 =?utf-8?B?TnNvZXh2MkdHd1E3Mmo4c3I5NTArcmI0ODc4TCt0WDdaMlVadDB3cTBUUmhp?=
 =?utf-8?B?UHNZeCtNRmZQYXRnd0lOUGxKYUlqV21qSEtUYkpxSTR0WTRhZlpVeHR0S1dI?=
 =?utf-8?B?OGtRTGsxN0VaZllldXhjY1pjMGNjY3VkdFdzYTUzY3VWTituMkZhWEtRYkNP?=
 =?utf-8?B?T1FUZkRnQ0RSaXR2bkZyZkxPSU9XZXUwaTNweTBzZCttZGdQWmJ0NXpjVTUy?=
 =?utf-8?B?K1dTT0tGL0s2TzJUSDdydk9oRUtsNTZIUFVXZUlkQnQzV09FeUMyZVJqR01X?=
 =?utf-8?B?NDJ5dzhkQnBQYUM0dmpRZUJxbmFwKzZVZmlaZXF2anJCNUwydnFuRkZiVGFh?=
 =?utf-8?B?ZDhKYkFMRkRPMDZ3MDBkV3FYTVJYYVk5NmFPTWFNVFVSSno4V2pUOWNQWHFJ?=
 =?utf-8?B?Q1FwNUZSYzQxdzZzeGpRaWlRWGFoVjJ1eldHU1pUVkM1bDIzK0dVMFlNckNY?=
 =?utf-8?Q?jgBrp0E81gYuunLRN6hdyVql7mKLbteeWD+2fut?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f48a1eb-7f75-4e67-34e7-08d967cc6c05
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:29:53.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8H3sueQgyHutgwtkLL6GLRBow1REo9wXnWJfHvyP3BlJdRq5Xc29muK+dPdoJaA+cGtb14/iupXVVyNlmdahlY2dVAR7j5O4886KYB7MUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3688
X-OriginatorOrg: citrix.com

On 24/08/2021 15:15, Jan Beulich wrote:
> Both callers only care about the target (level 1) MFN. I also cannot
> see what we might need higher level MFNs for down the road. And even
> modern gcc doesn't recognize the optimization potential.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've been wanting to delete this for several years.

