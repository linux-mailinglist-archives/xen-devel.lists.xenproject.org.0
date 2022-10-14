Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F25FEAC1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422570.668680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGK8-000838-Qw; Fri, 14 Oct 2022 08:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422570.668680; Fri, 14 Oct 2022 08:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGK8-00080f-O6; Fri, 14 Oct 2022 08:45:44 +0000
Received: by outflank-mailman (input) for mailman id 422570;
 Fri, 14 Oct 2022 08:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qaRP=2P=citrix.com=prvs=27923c854=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ojGK6-00080Y-MJ
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:45:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 941aba8b-4b9c-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 10:45:40 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 04:45:35 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5165.namprd03.prod.outlook.com (2603:10b6:208:1e4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 08:45:32 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 08:45:32 +0000
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
X-Inumbo-ID: 941aba8b-4b9c-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665737140;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/bTDZ7G8znZ9G/6LrV35LIIGbmiT/3QBoDX+iT+Lixw=;
  b=QGNOzEhX7o0ZAdLjgNIGfHpHtg1Yc8S3bgIM3RJOdM+UWMJnsuJ4+TLF
   yPIHXHCwFgfANI8DqMbeLK1/1Cr68ptiz1Rp5VxYHTx3O+CdSQQtFSLz0
   q9sGLJDXqaVeY1ciwEFg1SBM8R/NzNrP7lSl7Zgs/6U862YGv0WIcoZ4m
   w=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 81838837
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:raRhi6lyZtVdz42hiGsK+4ro5gxeJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeCj3Sb/iPYzShLop0aN/i80MFu8PSndJqG1NppXowHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRnPqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXl9g9
 eY6cC83NiuOhO6o4Km+ZeNCv5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r837+UzXOgB+r+EpWz7qBnh1zNxFUpFS8QeVCcmtekt3yHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ua5QeX2+zr6gCWLmEeS3hKb9lOnM0rQT0n0
 HeZktWvAiZg2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/H8pKkjgxSJScxseIalg9uwFTzuz
 jSiqCklm65VncMNz7+8/13Mn3SrvJehc+IuzgDeX2bg5AUpYoegPtWs8QKCs6cGK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGgWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:JMlvnqqwnB9rDMCsJqVYbbEaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCAIqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP8f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aiSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7svVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wU9HdwGOtt5Dt
 //Q9RVfYF1P7ErhJ1GdZY8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.95,182,1661832000"; 
   d="scan'208";a="81838837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2cHmbXntJcJLgMqv5OhhI2uW3P1R5Aybh+xDG65lGjt3AsjJCepo1jahsRIvF3TTHhyBxWuTAJNwj7SigQIrkDE51NM86M3XFd6hcMIUhzZlHmgJ15S4dS2KCVIiW7pKKUss2Vj+S8+QaJFDtVcxOR9j9nbjR+yk/nkl6Jfq9hvgHfXUo1i5qie6f2i+H6YfyAx29sOJdgU+GlUDHH6RRfE9ITRXFnQBO9CuEfUzvr+voaLj4Q8GYg/izCzSKcaYKimB0NeSPSq24GUcAaonu8d18B2NM2h8lePE3B/DBdrhtEwLCHqshnJ+syF/PLL1Q0s5Y4tQlR0iCevEq31vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4qUQpWRWCcsZXxVbDAetC3SRE2eelJiDgZ8ZkH7UI0=;
 b=l+RdtCPpUZXxPRaGg2vNgLilQ07aiSOz0EQyIR5NrmI+2Djuv3KhoXJMfMp2PmgoNyakSHCUoe0bBNPamiDeXXlhI8+rP7gISDF4BQOZEAnxDOaBFO3tBoZndEA/BaAj1jwtO6f0PxWzauUNTQJCbDV1n0jFqQW0VOCP49lC5erSYiqabLi2hHB8DNnSWvRHXIiu4y9HdWRr9CVRDhKw2YiPC0TJ6Q42mrhfCl7Aoa5EV/1uNS3SSF7z3VhEi2JBt0s2kGaBrLtFDNAPIc/ty3zsVuLUYXOi/rXqKy6GOEqtX60zxA4qVSc8SeIixq8U75gZPSmY9L1EPTGJChDCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4qUQpWRWCcsZXxVbDAetC3SRE2eelJiDgZ8ZkH7UI0=;
 b=uLMJTy8Cu2ZB/YQYENM121aCtizF9DkLafT0b5W5FFnWv/ArhSWSs89FbwSU2XHdaJ+vHIEBTqNL7t/DuTEmtTsG2PeWNPt7KpRs4Uwk3U2bZAMTLjlnm4sQAqW+OUjewhbKyEZh92Nh8RUKIyRrsfnCVHYJkWwNgUyM0HFlUW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Oct 2022 10:45:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry.Wang@arm.com,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Message-ID: <Y0khqPp09vAfD4Si@Air-de-Roger>
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-4-roger.pau@citrix.com>
 <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
 <Y0gXnD4jsyIp2kKb@Air-de-Roger>
 <870d5cf9-26f7-f4c7-4fa2-5a18bfa163bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <870d5cf9-26f7-f4c7-4fa2-5a18bfa163bd@suse.com>
X-ClientProxiedBy: LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: b111065e-a47d-44f1-bb77-08daadc07419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y1B7/wgyluR9Cc0rJW1tKhoT1Q3TM3zFizOBr91pki78w9ghAmgF4Sza+DZmJp00+klQrReEU6UMwar7G3u0xbpubzrhmx/AlKee/mohNy26E3cNAwBi9xfKsgvc+BCl77Mnc7A6FRLeHHmCkOLzvLlqZ44Suk0FvhYfofwTXmeW5SMwwQ5i9BI9sEseL63/DazlTJ0d6sDMT4Jm3lqVEtdOXU8S1C5m2+jNTTB5oRLGwK52z5VwFXqJP1/4r4XkFf26A/z7fM25LBgsOBG7WhvluZZt8CUosPmbWqDIwpXiyZ23+nzeo41KcOT0EsAd7fQAgOHy/CVUp3jcrbIlOdNyegcTqY1lgOsp36xFAgFwhc4FM4j4eFfIZDdVS9F/TVsupXAfwM3Nq0pfDGaUw6xRiFltqoLxvfjY0eKwX88J77zsd6xZ4tHBevbH2HOyD3wrCjqkf2ogS0C1Y7/NWByuhj0F0+zVx1oPry2VtqmObIJnJ2jkiLCJ/hVRkmEGheu3vxMF+rwSXofKGPzS7I7W1MUxIzwG73+BNz35JD+7BgOMstqcDwCbsgiEFiRgzS+6ly94XG/Hm6gXDqKglkirS6vEI/m/yePoCplac+dcb5ukv0cQftzevw2c95dOIdkxa9J8QzDpYCdrPakhiMO0pY2RV3dp2eBdx6ohimO1ngChzYyhfX/XX0WoJxKSo/cuo0LtLa2NSuTzZSRJ8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(4744005)(5660300002)(186003)(6506007)(2906002)(8936002)(9686003)(26005)(53546011)(33716001)(41300700001)(6512007)(86362001)(83380400001)(82960400001)(85182001)(38100700002)(316002)(54906003)(478600001)(6916009)(66946007)(8676002)(66476007)(66556008)(4326008)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnNjSE5ycHNCNmhITGpxUk1kRGRvbHg5MEF2YkN1R29BenZVbDhsVm8vYWNt?=
 =?utf-8?B?ekJMWWV6NzYvNUNyN2NLVjJCSkNvZ0d1c0RzdjQydUNPTGE5RFB4a3MyRlAy?=
 =?utf-8?B?NHpxUzJwVHRVeUw2NThWbE9WMUtCMU9WcFlKL2dVcjZUOGwvUkxBZEREU0g0?=
 =?utf-8?B?UVJBRUNxL1VXZDRQZjlaRnZpZmpkVXhGampmRkZuRm9kNUs3Y2dqWXh6TG5X?=
 =?utf-8?B?SzlpaEJMVlZMTG5jZGpjK1lyWTR1WlVlbDQ1a2t5SkNOdnBDN3Y4cElMdzNr?=
 =?utf-8?B?clNkSjB6VGZXbHJ4Y1hYVnBrU1ZDVE83N0F5cXVDN0s3N294YTRPQ0RKUnI3?=
 =?utf-8?B?LzZYYTM4cFhhYjZkQ1FYdU1lMldocVNQSldqWlVieTl4K3haSVNqWUp1RzBQ?=
 =?utf-8?B?VHhmTmtYQnJ2QytmTHFic1ZOamNXMmN0RWhWV3ZUSmh5QTcvMDkwM0NMSThl?=
 =?utf-8?B?alM0M3dzWWl2dk9heG9Lc1c2NUVMd2RGRURPWC9wT3NVaVZBZVVDcDlBSTlG?=
 =?utf-8?B?OHdITkFZYTRNeHdOUEpxYUF1Zm5QalkwKy8wNUxWZm5neVlCQ0Fma2hqYmtz?=
 =?utf-8?B?UlhUeGkvSjlwU2hnNmpWS1hyVjRiVGhNeFB0YUoxRmRUWVBsTWdmV1RTN3Fk?=
 =?utf-8?B?TW95RmNJLzQ1Z3hIVk5NQklmU0FsOWU3UFVucjcySlMweFhEZWtJNkZ2akJ3?=
 =?utf-8?B?ZkZTZFZWV1RPSlFSMUJ1SjMwcm5RS2xrVW1vY3E3MVBteEpBbjlENVZzd2Fq?=
 =?utf-8?B?ZXEyYnlmZmdUVXV5a2gyUFhNdW5nTGhEbUEwMnN4YnNobyt6ekVBcytFd0Yz?=
 =?utf-8?B?czVvdXErSWRiTFlSbHBsL0hXYkFYTk9XRHhXNXMxMXVITmR0ZGo0MnI4TkJh?=
 =?utf-8?B?cG1DUjI3bkd6N0hDRE1SSUdHOWhORlV2eFQ2VG9GUGxYaWZPV1YzaXV5VEVX?=
 =?utf-8?B?U09ML1YrZW43WEdLaVRLWjRkQ05tSi9kMGdzbHEvMnM1Q2tlNUNtVWNvVXVw?=
 =?utf-8?B?bjRvUTIyNG5tSlZZcys0bnoxRzdnT0tVbERnSFg3bHVSY245MHVkaTVGekJV?=
 =?utf-8?B?R09CN25KT1hWU0h3eFdKMmRXQUl5cUdrams1ZWFOVjd2N2ZQTUNGT2Z3KzhM?=
 =?utf-8?B?cDEyMzhOS1hvMVpOUFlCTWtBbVE1clFXaXRVUDJoREIvTndmbVBiM09JbURK?=
 =?utf-8?B?QjFGK3lSbVo4ZDk0cElIclhmaFU5c2ZZR1E3QXVsYjVkNGlRTFBDZjJ2Z3k4?=
 =?utf-8?B?Z1Q2eUFhaWVUQ2VhZG53Q2U1K1MwYWYrbEl4YThsZVg3WG5hdW5DR3pMckov?=
 =?utf-8?B?YXNrRVRpYjVQdnZWTTZuR0NVeTJuNWhoWmZyQW9yZzA5U24yVnJDVHBjSzJm?=
 =?utf-8?B?N0N5bkNZM3pYK1BLRTYwTktwMVhkYjFDNE0xYm5QcDVWQjAxT3BqVlVsV0k4?=
 =?utf-8?B?dTI0VGtHN3RVcFVDNnZmbVFZQmZmMGFxdk1pWDhRcHVOOWRyU0dzWUNvbU5v?=
 =?utf-8?B?RWZVZjBDaGlFLzFiU3lyVEVQZWpsclA3am9TZzFkWEp2cU1meURFYWliK3Js?=
 =?utf-8?B?ZTYzNlUvS1hsL0xjRjVORm90c1JmTFZCMHoxTTI3OWh3MkpNK3lzeFBrc1VZ?=
 =?utf-8?B?SFdmNktFWHp6YjM4VDhQV1MvTDgzNExoWGRER24wcUlUSVNsa3NQRDFMRHN0?=
 =?utf-8?B?ZC9KNDFlL1JSejVEUWx5cW5HaWNhT2U0SG1JbStCakZkZGVWUC8zV01rbGhW?=
 =?utf-8?B?eDFYYzNiZVpCNFhxK2sxaitPekU0V1ZVUXVlcU5xWWRRSkFnOGdEenlhZ3lu?=
 =?utf-8?B?WVM4Nm1GOFdFejR0eC9vOWdWd3htM09Bc2lJbzlVUzVGd2FwSkp4Nm50VHF6?=
 =?utf-8?B?ZjlId0tZT0RoRlJkNWFta1Y3elUwZ3Zod3RXTVFoS2tDNWpwZXRuUTFpQURR?=
 =?utf-8?B?N2lyejNxYTFBcmpFUFFNSFhwNHBEV2VoTStVbFV5VEx1WUJWQkdlRk5FaUh6?=
 =?utf-8?B?V0lTamRHc3U2Qnd1WTdsb1RoREFOYW1oblpxdDh0MStyRVVaOFdDdHhoNDJI?=
 =?utf-8?B?SVBvZzc0VHRJZDJ0WVVRNFdGd3Q4OU1mcVlxQy9FellaWTM1RHdoRWtKT2tS?=
 =?utf-8?B?T0xaV1RTM3FIN3o4QitXU1Q3eG9XVlpiVTQ2ME5wd0doTUc5Wk1SdGljUUlY?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b111065e-a47d-44f1-bb77-08daadc07419
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:45:32.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFSQvEv8B5e1gSoGaUFlRkV+PMtqTV1CWRwtJG6eDE5LTRfYPjBt9Jvit8/mW9c8RkhH+WObvM7ELSLApkX4yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5165

On Thu, Oct 13, 2022 at 04:20:45PM +0200, Jan Beulich wrote:
> On 13.10.2022 15:50, Roger Pau Monné wrote:
> > I was under the impression that the command line ssbd option was added
> > to cope with Xen not exposing the feature to guests. Now that the
> > feature is exposed guests should be free to make use of it, and hence
> > there's no need to force a value for Xen.
> 
> ... me not having had this understanding may have been wrong on my part.
> Andrew - any chance you could clarify (original) intentions here?

I realized I wasn't taking PV into account, and PV guests on AMD
cannot set ssbd, so the option cannot be removed.

Thanks, Roger.

