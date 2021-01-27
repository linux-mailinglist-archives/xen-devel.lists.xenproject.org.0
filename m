Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E43058A3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 11:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75947.136958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4iF0-0005I8-Sr; Wed, 27 Jan 2021 10:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75947.136958; Wed, 27 Jan 2021 10:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4iF0-0005Fr-ON; Wed, 27 Jan 2021 10:40:02 +0000
Received: by outflank-mailman (input) for mailman id 75947;
 Wed, 27 Jan 2021 10:40:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4iEy-0005Af-RL
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 10:40:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 522e5576-2f42-4c65-bfa7-01550f3738f7;
 Wed, 27 Jan 2021 10:39:59 +0000 (UTC)
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
X-Inumbo-ID: 522e5576-2f42-4c65-bfa7-01550f3738f7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611743999;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ThX184qfrumHJvF+Cwm12uF1mp8wf/YrOzzB+DCtv7U=;
  b=T2VBgbbtU1JN4/Cwvk6KuchG/E3ya2iLGTmTt0kQQTdF7EvOxu9WDdqO
   tn4rQE6Hx41nZGST1J4znaYtM6xesWlz13HsEmv/atv0VxdE3XTGsABcF
   ts4Jt1P55oKsR8ze0I4SLls8qTrWk6nANngXSwtbN9bIGzkDPlTCwzoOL
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: seqHAVkGhPKoKwHjjAPbS4eV0DfjUGZOobuXzTmfG/g2XcEZS1IOr36XQFRRqY3ffMkHW8Ztxs
 b9RznilKxh8wexb3f0M03JSwbhonAUlQYul9QYgT2udL344VQu19HLUOoXWMxHY3MiXPt3JIWi
 VcHtnYSE8VMwfDR8F+ado6ttnnfHDb7fBjpK1cbnUsdr/8bEanvSYiVHpC+SgpabJTiGSKf2em
 eDAL4Y+vbrWteXwVbMMYFHZUxw48sDYzkBs0dA+TJd2J3b8qcRdGJEghaND4Iya/7OZCbolIFo
 Ihc=
X-SBRS: 5.2
X-MesageID: 36322466
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,379,1602561600"; 
   d="scan'208";a="36322466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9OyABo8WXXz4n2UXzx9HmtksZ8P2S928ek2Jsh/5ErgNpEbxtCT6xVRFm7gWXC/q3HKg+sL4BLODrZpxEqdzjKZeeEPVgR8lLKqIBdDxuY/Yo6RccKqrYRwoMp4LV/wvYYX+2oMM1noylLBsT41ElW67UGU5EJVPZ73AOoL3xG6l7kteLGy3nVUq7RWhiEHzkshXE9MLxe4ZWaWSse0vUwWNqCfRo2QUUz5m7VKjPkyk99prbja1d4fwbj7NnIPbJLoZfN1kKVwDt/uAnBXMeRDDQNzQvW2brumVo/3cOwcK3lzKndtVRattYzXHfpZuYgWDA1ubd6+Z7oVgCPSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThX184qfrumHJvF+Cwm12uF1mp8wf/YrOzzB+DCtv7U=;
 b=P35CWSnwvej7i06/re94Dx6CuTkqWnTogxlKMEqVdkE7J+MCBYg2cdnDqufF7QqQkT+gUimHouLXetloH6oMIEN9oSy4Yp3j+6QBo6lXYIq8thwPQvoes4q7ko9y2+ysOYJDnOF8JWcqO03pPM/g4XHygm+kb3cwtG+e0R/213mYZlHZ6jhQvsCZypRlUWHSU4G7kDHsLBW6Ivw3hbEfQ/Vx+aDRGVnPXifUh39lUHbB85tHjFwLOZd7+BaFdnoPLvDET42eKbyj0mE0uK9rct7e5qUfPOsn1nDza4pNzF1ZDV8upoHb/wNuXWjmNKs1lFqp1farKQ/HNJw2ZrV8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThX184qfrumHJvF+Cwm12uF1mp8wf/YrOzzB+DCtv7U=;
 b=n2UYDiRkfurC05LMMZBOTHWhtPtfj80jx8+HJC8vreaNaTEc/+Aa0tIsOi1qsHlQqSJgjw+/1hP3SolqPkAebTxkYwSjpyTxo5/4E5743/s2ihx6rwTarMS+NbXQ9RiHth3e0ecFY0EgxWp5xvNJtpFfgZ0ycFu0BZXkFnJgyD8=
Subject: Re: [PATCH] libxenguest: drop now unused le32_to_cpup() from lz4
 decompression
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <72d7e54f-e0df-03e6-0752-9d8937f666f2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <aba69b7d-f9a8-2d49-1400-09b9ac43cdcd@citrix.com>
Date: Wed, 27 Jan 2021 10:39:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <72d7e54f-e0df-03e6-0752-9d8937f666f2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ac9befc-9695-456a-6f51-08d8c2afe297
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5519:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5519CE87652FBE158593A569BABB9@SJ0PR03MB5519.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8SAjUbTaVwXt4pR1juYPfVeSTC9KFUdtdt6ASw1rH8n+ODdY2n2WKf3+m12y8pTrpgx8c+Ln+ZW7WcTYYbAYpwnABoHS7gR2Jbe3rFQn2oxGjAUbT/s979RgKfYr94Ph8bH3mcOKig82lR5wq0oRJ8L4PruREW8HCXDu2njyVoGh1rz7K0fb0LkZkZW12OgKXHOd5hEV2Vu/O/59PbK1vsi9l69k3a3MkPzN1otLg61E4qfDi+p7RFmGTfh+oVdBp7UZLGyVz00qGOdrSfgNAHGXdGN2w77Hg+wjQRIBYDa3Alf4v3BnPyV9lQD69LMzjwIorUcUlF6ecWa/S69i6+0Wa2s+i+55pBbUE+81IueTkbQcYYu9l/IP+z4KWSKIocSfJ8oBu1AAJ5bjjey6yici6lSFnee6Ur5yHivtnn30BaQn9vT959QusuEiTj3Uts2fnzlaYJFEm8UnKTdd4GF5U1EViZYJy5UhA+LtuEP5iy5Whcut6pAI14RMWoU7hsAk1oBaiCjEZ7ApH3M0/8+vKIzn2fP/eSiR2/UfxRBh6KvCCUp4dzOhJjfDTCZO7aukYhF9DRzz4QCBy907vhDFNuxvBtMU1ooeuTE7VU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(26005)(316002)(53546011)(66476007)(66556008)(956004)(2616005)(66946007)(5660300002)(54906003)(16576012)(186003)(36756003)(16526019)(4744005)(110136005)(6666004)(6486002)(8936002)(86362001)(2906002)(478600001)(31686004)(8676002)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T21kOFJMeU5TcG81c1JEckR0TXNPOUZBY3JvZmg1eFdGaGFZb255bkZReXpa?=
 =?utf-8?B?dWpLUjRER2QwUDV2VXdzdjlkbnEvVkJ5SFJ0OU1ZNmZ3M295ZkYrQWZLYTR5?=
 =?utf-8?B?SFJJS3RCUFFtcmk2T201QnJvbmx2aWNmbHdNTjBkWXduZW1PQmQrbEp0WUMx?=
 =?utf-8?B?eVJCbUhYelJCSzhCZlBMRStZajl0UGhOSUlpbjZhSHpVNCtMNXZZSUNpRzAz?=
 =?utf-8?B?UFFBYklGQzhDRXFQblFKU0lscitOVlRuR2FIaTIvVHhyM3dabGZ3KzRFZVFE?=
 =?utf-8?B?UnFYQWkzS3pnclc2WHA0QmhhT0EwQ0RxSmdIWHArekJuMVozVTAvRi8vT3do?=
 =?utf-8?B?NElBbVV1RUpQN085SVorR2M1QlVHaGRCcmJhd0M3YS9KZmJtb2wrUERvbjFB?=
 =?utf-8?B?WWRlMmNLRWhxWWtZWWtGUkF0QTAwV3pCSVVaRkh1ZEtMZ3B0dy93NkI1NitO?=
 =?utf-8?B?QmJWajVuMkt6dkRMSmNvQjQvUnl2SHozNlFIaWJUaUMwZFM1blhwYjNZVzht?=
 =?utf-8?B?Z1ZOdlMwcmVkVldXVzdRRlUxdzR1Si9HL2RTdWltZnExS1U1YzNNa0Z2ZG5i?=
 =?utf-8?B?UHpyZE9aTGdWbTd0blVkMkFpRFByd2ZWNko3M0FMbHd3TjFwOWJRRytSSGlv?=
 =?utf-8?B?YkFoV1lOWTQ4dDloSnlqSzlnL2ZhWmR3YXhpUm9SbU9nbzBUZUpHRWlxVnBu?=
 =?utf-8?B?c2xlOXE1VXpPWWxrRHg1cmRuY3h5UHIzakRjQnM2a1oyZXZjbWhrMzJHU1My?=
 =?utf-8?B?N1lab0crOXRhdlMwUHJZQzkxdnF6eWVPTzVKT3RNaTI4R0hrVzZISlFVaU16?=
 =?utf-8?B?YUtBWk0xSTdmVW9MUXNqeFY5U3dlaldlTTNLZkN2Z2hhZWx3Nkx5Z2RsUW9K?=
 =?utf-8?B?M0FTd2h6NjE1SUgvZEhCU1l2NmcxRUFpQmlxQ0NNaGdKZ2h3aXdZM3M0L3Zm?=
 =?utf-8?B?aUdWb3FrWm9ZM2lkQnVMOEFEY05vMGR3UUk0TFIxWWVaUGxSM1R1RkU3ZG5T?=
 =?utf-8?B?MkxEMGl4bDVFcUVjNjlBbXB1cy9xWlFtMDNNTlROcjBKUndDK29RL3g4ZnVm?=
 =?utf-8?B?Y0lTVkNDaVVsbXlGT1RyOUlIekZPa2lwZVRwNytSSXdkNDJEa25JR0srS2N1?=
 =?utf-8?B?RFJjNGtYcHZKQkdhdXB1WHJYcitpbUQzNm9zSC9HOHR1VXZsUGlpTFpZUUEv?=
 =?utf-8?B?ais3akNsdUxxd0MwT0d0ZWtubEh1NzZaOERsNlNuUkZ3cEsydUZHRzBic1lM?=
 =?utf-8?B?cmgwK3JGZVpSQmpTRzRsZnRva20wOUpvM2hwTVRLMllNTDFmMTM1Z1lHZXl1?=
 =?utf-8?B?K2xpMHRhdG1zcnZObWRBcjZZSm1zNzJjMU5EYUpKMUE1UXFSSnFSbGdwNXBi?=
 =?utf-8?B?aHlPWnl3OHRzRTNEazhCNEU0WDFEMitpR01YMjhlOE43UnZjZW9BcUV3YjA4?=
 =?utf-8?Q?6p+JlJ+f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac9befc-9695-456a-6f51-08d8c2afe297
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 10:39:55.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lfAE/929htrRbQbRk/z766V0b3RPtF/L4+TfJYHQlzRvenDjeg+Uj+Z1Om/PNF04ZzLhT3h6SeJwo4rt9Pt2uJa7Qvoeu+GrxSSaiLJb84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5519
X-OriginatorOrg: citrix.com

On 27/01/2021 10:34, Jan Beulich wrote:
> While gcc doesn't warn about this because of it being static inline,
> clang does, causing the build to fail there because of -Werror.
>
> Fixes: d8099d94dfaa ("libxenguest: add get_unaligned_le32()")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

