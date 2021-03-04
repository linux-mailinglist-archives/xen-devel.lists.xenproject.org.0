Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA532DDDC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 00:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93417.176386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHxOn-00037A-Hy; Thu, 04 Mar 2021 23:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93417.176386; Thu, 04 Mar 2021 23:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHxOn-00036l-ET; Thu, 04 Mar 2021 23:28:53 +0000
Received: by outflank-mailman (input) for mailman id 93417;
 Thu, 04 Mar 2021 23:28:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHxOm-00036g-92
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 23:28:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d51a98-76d4-439a-80b9-e7a529185aee;
 Thu, 04 Mar 2021 23:28:51 +0000 (UTC)
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
X-Inumbo-ID: 62d51a98-76d4-439a-80b9-e7a529185aee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614900530;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p6PP0uN44K0TS1I3kmOFI4MwcXkRW+LjFnsAehpQr5c=;
  b=HVgAxpe9ELWtrI4FzWa91TvrYT46GPEQaL4XsQz7HxMn2IaDo49YKGJ7
   QjCuQcMzI5aVaPwHXNwrQwgfvQc/WfbMLiwB3RUh68yVdT5MhYGHxQIiR
   H49OipwMhxoKYdaihjy7OiL/E7pDyYCCO6ZzVQe/2fgu64KhlZaqLAQ5g
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CF2w7RCLiGsHjt+NW/ENbAPKXuGXI7fcthHfZKH2VyhpQ22itbEtFygW37PRUWFFGYuNC1xUAF
 uprcyaRTP0y+FKTfOSNeghbgRQjeIpYCzYa/Js1aA+ONQbdu48/g6FjzK8aLov3vw51ycMub7p
 BvWwBm0+SAsMUxUJWqn7ViXUbhm99qhjE9oLIaHdZPcO3rlK2u5E83G4HKf1lKmKsEb82ex1YS
 O98PnQg9MzPSpxmWFQBog8GNQMGBSu14r4uY31Nuj4fDzN0KuCBv+dYLOzBFYAaGHzIidKA2l8
 B84=
X-SBRS: 5.2
X-MesageID: 38779846
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,223,1610427600"; 
   d="scan'208";a="38779846"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g558SdPuxR4hjtvjqQweCKRHsl4hedoTXinq9DztVY3XNsivkSHUlr42sX6XjCzyX9kt+Y4qO3ABURI2wA+yFpgs5Z+UGcUS40zNOoCe7WhRdsSoBvI2skTYOcQga1d3lXBwCudFRs2asuh/NN29OkSsHY1Ob59ULpb8ci79Xo4xDlAgPfKoEfQTUyrwn6cUSmY/qp/23jlRidkC5+jzAYAlhOPbk5ZKubhzNYDcWMfZur23mBbBhvDEfjb22EEXgDE1VyacXyhWgpOKo/qJIwintvipyXQxPb8A2KQeHjJ9mEiMVQtYikNQEF4UvAvT0IISrgnXusgIc/0aqh5zFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zht4K8WtOcQDjXZ6cTEgTKJfAZyNi8lX3hG6b5f56Wk=;
 b=Cdoi9rCJiuIHw88ElKrF0PgUZX63P9ALXGWRYnXPbjPq4zZdMAFqogwg5duVTrQfR1iLLqNM9T8HbiuCDQGh405XRMuHrKVkyfAc6h5zMaLpczmoXNIBLFppsoJKtNqImQCkT3C/esIjK+V5bHSy1sDkLEmIMgg72VvlKRhDRmIO/LV7Ppj50Kds6fvn0vEaRpvKA3JqllKIFlbEexZKfY7HNbPtDveV5Bp7P05TVB5xMlsBE1ki9OkWWJ/BYX2EXd0DtE5UHg2+mkGCl/jzXz7Et7K47XkT14sw8FU2eipGDeopM3HmVeT38j0vqy5DZJAh8yYnOK1rI/trbu+4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zht4K8WtOcQDjXZ6cTEgTKJfAZyNi8lX3hG6b5f56Wk=;
 b=TPuyKM0PmuNk2JIje16QAyNhUV96QFXPdkP5KvoumNNSA4GZLuhtz9sccPMaKd1+c7uv1yUCh7Q43qUeI6zwyKeuiov1I3K0tNNJ3Xy3X+v9aNQiwZTE0xx7dGolHhrcUezhcjAUKMbIZLfc5mRAi3oJUwziOeDha/hCmzoNEvE=
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <9fa2be52-9d1a-e841-5bb4-3180b4b5b033@oracle.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c8bcb182-2f6c-accf-6b94-440de8af3617@citrix.com>
Date: Thu, 4 Mar 2021 23:28:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <9fa2be52-9d1a-e841-5bb4-3180b4b5b033@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f1df0ee-2d16-4501-80bc-08d8df65341d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3671:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3671DDE8578B3D9C49527C4CBA979@BYAPR03MB3671.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3L4rDwvuWNsqRiwv9JD96Ni+HJJpfsc/3twbQNOQzP5HfImfiZpxZd+6o6liaPPSGJrRxZlUSpUPDlP7howIOeXDmT8BfUt8+BAqofNIckUVWfk4aLRmiYYxz4RF+nhaJBxbKYzVgitN6aCPt8Oqe5OgM4ZupG50vHx/h91klQAOF+0De9HprKbiwJK/ol7sKrFNqyHkR+H9EsELhr2qHtzIaHxOoxGgORrCwow8TuIq5p9IGy2x4Maf0E1kRgih1UnoTYtR07S1oOEIHzIPtFl8CNSUpVEdnb6xfL56d85OVWVt4al8vr6zJMhn+VKCP9/ebJoCSeWH4Oxk9u/CBGN0EtWnu4WEEqc5nl3RrAeW9mIIXlbEPioq5+bF2kLq4vQ9JUhaAKIqxaGKsoFOU9oTTL3CA8CMwL2ES1ysjHAgJzHDhEVzSvlfqZpBx5oFsxs9p6W5C0g28zL/0kAKPpKtSNiRAXLqLnf0vBC+jVrYmI/8ny0tOSU8J/xbhn933xJdQzllMINWz5GSBiaCGh6+W37n/103i1elfwSQa/IT6D0aVp1QJWAePOJiw1w2Tnx2B4ezdLuN/tJBVFERY98Kq+B9OAoyZxyhuAg2BEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(66476007)(53546011)(66946007)(2616005)(956004)(66556008)(26005)(2906002)(36756003)(6486002)(186003)(6666004)(86362001)(8676002)(478600001)(16576012)(110136005)(316002)(8936002)(54906003)(5660300002)(16526019)(83380400001)(4326008)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a1hsdFJqTG1ORW5kRWliTWh0UnNxb0gzc1NnZ3V1Mm5Ld1NGaFhxTmc3aEdS?=
 =?utf-8?B?OWlHUzN2MnNlL0o2K2dXKzZFeUFqbWtaWG56Q1R4QUN0MExyT3hkbzhPaEM0?=
 =?utf-8?B?Tmx6eWZpZHU0MHQ5aXVTeGtYWVJ4b2oxN0pGbVNySEZKRmg1cDFvTVl3YVFk?=
 =?utf-8?B?WGNkRXlKc0lUZHZZUElXeHB4S0ppT05MYnBSQ2FKZU5JRzloSVlYeVRTbzZr?=
 =?utf-8?B?VEtteWFLRTgxTnBvT0dCRDFBMTFwV0xySW9jRExkSEg4bHczRGpJTVNpNWpy?=
 =?utf-8?B?NnI1Y3JyVXNod3JwblpUNHpOK3ZaZy84K1RiSFVVUmZoRURaNkx3aTVSdWpL?=
 =?utf-8?B?RmhSRThTeGJoTzk0YWxrcTQ0SktIZUdPSjE2bmJ3NjZqa1V0UWJaV1RnSEVW?=
 =?utf-8?B?azVMbW5aOFgzRjhPQ0tIL2RnSE9TVGt4NktpODNlc2dvSmJRSzFNOFZnaXJW?=
 =?utf-8?B?eHpzRERTWnhjMXlXSktRaG5zbkVScmJySVZ1L2NzZDUvQ2VOZk1UaUYvNEdZ?=
 =?utf-8?B?NDlxMTJDUlhVVGgwQUxNZmJhOTFkOG9HZEJRMUxJMXYvaWVaQndXd2ljekZK?=
 =?utf-8?B?bU4wWnlSQUJ2SlJNWWo4Q2Y1ZXd0a2JGZTBJTXlGUk11QmsvTlVwVFl1MURR?=
 =?utf-8?B?V1lIN2F3c0s3QloxeVVWZy9GQmU3MytCUEZUY0dzVGtTdmJqSlNGMnExZjhG?=
 =?utf-8?B?cTBQOUhCS2srNUxTVWpPMVYzUEJxSFBxZWg1NmE3UzRXNHE0SUF3UXZnL1BM?=
 =?utf-8?B?OGFpMlpIWHpQRkc2MEZKRFpzSmJYdjlaMWpMUm9pU1JJYnZqK1ZuUUYzYzY2?=
 =?utf-8?B?clF6cWhma0NVUnFKcE1XQjVZYTE4SVRvMDM1cDMvUjUzclpTcmlzUTAxYmRp?=
 =?utf-8?B?S01UQVNTV0ZVQzRhbmFCUWVSU1YvZmxTaVJ3YzVRbWJjRS9hc1k5Skl2R2c0?=
 =?utf-8?B?VVcxcXVzMk05SUtJZGQ5bkg2dnhqQUZTWVVuUFk5VzlWQ3J3K2lvaTF2OVJR?=
 =?utf-8?B?VkMxWUhIYzNydFdKK2taWm44VzhNRmQyeU4zdlVWaWlSQzAybUVGMkRWeUQv?=
 =?utf-8?B?am80Q3VvNEkrTGNhYTJjNFJmaktyN0tNeDZ6bVhzOTVqaTQ1cXZVZFEyYlJG?=
 =?utf-8?B?VllVT2d1R2JwRmJxWE1Md2txK1p0c2REanFFMjBCbnVxQk1hNGVzanM2Rnp3?=
 =?utf-8?B?OUlHaFpnVkxFYjRaQVVYK0lULzRNeG9XWFZJY2tJMWNsaXdMK2tGaHI5YUZZ?=
 =?utf-8?B?aG1GM3Z1UGQxYVgrZ0tzT2x5ZU0vei9ON2JBbjdvQXJLOUtwaERnZGR5NDNj?=
 =?utf-8?B?S21HQjdwNUJXd3RueE1NNWY5R0hwdG5tZGZrN25Gdjd1SG9vbTQrTlZVN215?=
 =?utf-8?B?NTNVRUlMQ2NUNmtRYUExRXluRnhVVTgrZTFTNk9OTjQwbEM0ZjdsS2JHb1d0?=
 =?utf-8?B?ZTYrQnk1WnhEVHpQc3NUeEkwbnhFMW5QTnhEQ3N1UGxlbW5ZLzJHb09FMnhp?=
 =?utf-8?B?emRpY0w1MzRPbHZsVGV6RGoyM0hXVEFCQzhnV3NoQmkzSnpKVzl5TVdESkNJ?=
 =?utf-8?B?ajJSR1hMK21vZ2NnZGFCQnQ1VDErWEcraEdCOGpXRUFVSG1HVFF6TTk2VUVI?=
 =?utf-8?B?OHNwd0dMUW8wQkFwd1orWktWRHNXQVFLZE9QQ3RoNXdUcHluWCtEZ21Jb2tJ?=
 =?utf-8?B?UnBZUkR3RUJHRzNpM05aa1U3TkJqR3dFSG14d3NacEF1RE0wR3BMZXNJc3VL?=
 =?utf-8?Q?VrvikfO9WohzwDWDy0so7jIw9xc98qonprW9MKB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1df0ee-2d16-4501-80bc-08d8df65341d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 23:28:23.3583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxnF4xOjGg8CVVJ1mc0R+A4YeqVHpWSiX9i45iW7TLDJGIBdG2nqxoWhz68b+5VjEfqgHMLuOCogItjuxGfBoWQBVSBuSSqaCeyrozKfXSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3671
X-OriginatorOrg: citrix.com

On 04/03/2021 23:09, Boris Ostrovsky wrote:
> On 3/4/21 9:47 AM, Roger Pau Monne wrote:
>> Introduce an option to allow selecting a less strict behaviour for
>> rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
>> commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
>> Xen result in the injection of a #GP to the guest. This is a behavior
>> change since previously a #GP was only injected if accessing the MSR
>> on the real hardware will also trigger a #GP.
>>
>> This commit attempts to offer a fallback option similar to the
>> previous behavior. Note however that the value of the underlying MSR
>> is never leaked to the guest, as the newly introduced option only
>> changes whether a #GP is injected or not.
>>
>> Long term the plan is to properly handle all the MSRs, so the option
>> introduced here should be considered a temporary resort for OSes that
>> don't work properly with the new MSR policy. Any OS that requires this
>> option to be enabled should be reported to
>> xen-devel@lists.xenproject.org.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Changes since v1:
>>  - Only apply the option to HVM guests.
>>  - Only apply the special handling to MSR reads.
>>  - Sanitize the newly introduced flags field.
>>  - Print a warning message when the option is used.
>> ---
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> ---
>> Boris, could you please test with Solaris to see if this fixes the
>> issue?
>
> Yes, still works. (It worked especially well after I noticed new option name ;-))

I'm afraid I want to break and rework how this bugfix happens.  Solaris
is still broken on all older branches and this isn't a suitable fix to
backport.

~Andrew

