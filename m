Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B94196C7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197046.349995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUs1r-0006Lz-Ok; Mon, 27 Sep 2021 14:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197046.349995; Mon, 27 Sep 2021 14:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUs1r-0006JS-Lf; Mon, 27 Sep 2021 14:54:51 +0000
Received: by outflank-mailman (input) for mailman id 197046;
 Mon, 27 Sep 2021 14:54:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g88l=OR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mUs1q-0006JH-9a
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:54:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b6b6a64-15b7-4283-8096-c2ab2cdb3093;
 Mon, 27 Sep 2021 14:54:49 +0000 (UTC)
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
X-Inumbo-ID: 3b6b6a64-15b7-4283-8096-c2ab2cdb3093
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632754488;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZX0XlsrV/FGLqaNk70WhvfCFkjIFRFOBT9SCDpFUg/w=;
  b=GYeuN9XDCbQO0OmPOFMgPw8zS12zLo6J2EIIwluKOIVFEs3zh71ZIL65
   JjE20U1DVYPQCHaZw7gknSMaFsM+42sFlIo9+vKJ2ozgwhsbFWqHRwSEv
   VDD2nPqST69QNScdLJ4v46EAX/RM+355nBjdx51UugnGHziMINq1s2ThW
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j+2IFII3AUg0+7XFUt3deMqiV/LQMela43cwiMsBFKrCM95seulRsjzgIfyeWBJj22QhiI4lK/
 5BOQMXWWcPBAW2ZMr1/VgMf9HkSYdeBNy1nGhwglg1c+bH6KqRSCupJgbo3R2zLOAAYPLr46ea
 eRtxF/fZfjODLkz7PicYY9a4hA+QTKlehxEOYz/QHLmO4pWUaaXSjFexVRocnyFN5BDJUuf01/
 vGHvq5YL850e4ec61XI3BCXUCGuYVJeyHaGn+MD6rals4/M6WzlINEYR5zNTt+3971y89WIDeD
 ZdEd2YsSJlAdf3v0Ee4zraKL
X-SBRS: 5.1
X-MesageID: 54132478
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DokkfKA5qw1/ahVW/9jkw5YqxClBgxIJ4kV8jS/XYbTApD1x1z1Uz
 DcYWTqDO/bbYGakf9p+Po3k9UxVvJ6Bn9ZnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0007wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jmmyxuhO+
 NJ2kaOvRS0NEbDLns0SakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFgG5r3JwRTZ4yY
 eIbawBhaEjDcyF3I10RN60Cxdz0mVjWJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEhODVmjjgcJkPD7D+/flv6HWMwkQDBRtQUkG0ydG4lUyWS99ZM
 1YT+Cclse417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKywPFPTE8cQ5GU/gZq8McYRM30
 VmgkOq8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNtt102eF76PBIbw3oWsRm2gq
 9yfhHJm74j/m/LnwElSEbrvrTW2utDtRxM56x/bV2aohu+STNX+PNT5gbQ3AOwpEWp4crVjl
 CRa8yR9xLpXZX1oqMBraL5UdF1Oz6zZWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPv8UNbCL2PPEnOdjZ5yEWIU7ITo2Nuhf8NIYmX3SMXFXfoHEGibC4hQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eVD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8ZcKKbLTflQ8SAnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTYUTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:QNtaAq4mOYPdsS3OgAPXwViBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ866U
 4kSdkFNDSSNykLsS+Z2njALz9I+rDum8rJ9ISuvEuFDzsaDJ2Ihz0JezpzeXcGJjWua6BJca
 Z0qvA33AZJLh8sH7qG7zQ+LqX+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzp/QtHNdA7dE6ML2K41z2MGDx2V2pUCDa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.85,326,1624334400"; 
   d="scan'208";a="54132478"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcjW7GQmw2lWoyWZsYWNXWMYzxprJ5513cH93mkD8TLqJ23yI9q6Od9dgxjdQh0SE7iCg4jTMcPArIFtm4mg9CGmGXOWumZEiPr5ILhhYoMHvh0BwKNQbfgu8P9pNh6Tbz10KBDWiHr0TyystNvrFj5ggnvvHJhger2Ttu+yEnAYsYyXqiynjfNXqMalzCFa2bPYy0UwvH89MHsFYzug1GCDZmy97uFzXX7/Zk1mazKWNjvu20DmggtbEy3/t7/D5FY8W3Sk5ux25F9io6QDkmwogh77wZKr5TderfG72Y9oZbTp44DPHI5eqsAXOibzEnZCPtb7DGQK+wJwww0qQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX0XlsrV/FGLqaNk70WhvfCFkjIFRFOBT9SCDpFUg/w=;
 b=DqUCXkvDAPjrYINi9z+SPlhAa2pOix9NvBwlRz5Gp34gzf6Ongveshk3b4jW9YhnPDOi+5MXjjYSeF0QuKIhd2/fPpT+SFSqgHsTpkv6onNZuYEOXcEynSXttvPUChqCqClmKvM2Ksiv97PvfBp4oAY05oZ3Qf3ulsW8Ud+gZ3sVSalBQUw/xVU4X3/X5/ZHWXuxv1A2SabLw2vkqrbRvf5EgXHaoC5O/lRciTwAOP+K2c5Irdij5BMYXcrZJJw1YCk7n0JUcoY5RW2EJFruTPGFCmS4NrfdmTBSkOb4VVUTv3hxaVXIvOg5ccBmV3qXb1p3aZZnDr7bGXUrVBaPKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX0XlsrV/FGLqaNk70WhvfCFkjIFRFOBT9SCDpFUg/w=;
 b=EFoLvUQuT1kCs50GfCHPhi4b4jy2pyIIgnvH1fGGcb9mURtbc25M+Y9w/N07O9HDomOoa4Wc1nVkCK9SG3loQHBg+ek+c5IzIfRUbmzkPK9HwCheHcHQwzIZst8A3xXl3kBZrvNrv8TsC+pJtytLZ/YnV6NqFgmKSl6SWzMQF0U=
Subject: Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210927104813.19772-1-jgross@suse.com>
 <20210927104813.19772-3-jgross@suse.com>
 <f858dda9-b844-48e4-c079-75296cc36316@citrix.com>
 <20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
 <9076ecc3-8509-f687-df11-82a561cb5b2d@citrix.com>
 <825e7a37-c39d-4cea-0992-268945ad118e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8d51e78c-e8b5-c65a-d130-cc0e527f9f92@citrix.com>
Date: Mon, 27 Sep 2021 15:54:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <825e7a37-c39d-4cea-0992-268945ad118e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c4fa0cc-4177-46c4-b3ba-08d981c6b2d0
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6357:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB63577BD4048B5120DDDBE505BAA79@SJ0PR03MB6357.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F5YE4hEOBedkGftBQE+KH9xLRRgjTyF6Vc+fYERMELTucQ42HvupUoe3IKNYcDwU5nBk2c00qpQbK6Gxc4ckzXdEy2809cFqJE6px+vUvBu/8jUet1TExEPCNpHh4B/CSPA8+fK3lUAu4WRsrn6rYtgqqt9Uqg73HJuVdY4zln39jLr/tOcM6a5lkMPAFfhTvkpZ0rNu8pAqtLQaCndafnwran+S9rdKLBhQlyaoUlUZqACb9U77HZqeyNvMG4vYo1c34IlNOiKwjvMOQD9VmgtDfGnjv6W9tq8nm2kIIJQLxM6YKpoXpAmZVJ2CbDd7jugEgq6UOA9H94y/UTxaK6gHTJ27hgHYK+Q06T11yDMR1/SOgwI3PLJNNPqXlDpxRjRa19lhw/3c6EYhi9D83g5/NsCA7+BcawV1c178K3dfYtmnKcGOrVh+j1aqNHZ/gUCiSOBfU7XpswqJpBVyQPOvXFcgJzAnuKZSGnD5gSvL1+H8XaA58ynvPNl3TsPC3GH/ldBb3ZAHycUPGDiPXn3M7OLjxO8WH9aTlMIIhqPwRXOaItXjaCSdFLKmBECXL9A4ay1DjseBdnpA5a+tHTzT96NoyVCLBZG9qcdQE7vei2thDyap1yBf8vJc+xCsGbDCynMFzosxOChh3ny0Ij35Sz7vBJy15z32zPI/GfpkRQ3psbIeV6w5l4rcbcPpP+EqYTc7LxitOfl45MMjORCxrydZu0eriM6QetfqMyMaTOKyl7ZtXkQLUIk90VDNNsmmOoSxJ+TwzZtZ4ZxGRGxdNuRuemvRhqMi9S4TJxSmskduflr+q0Sq/uYMIyIzcpy2TKuDPgG8GuthgUzDMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6486002)(31686004)(8676002)(54906003)(966005)(66946007)(31696002)(186003)(5660300002)(83380400001)(956004)(53546011)(86362001)(55236004)(2616005)(6666004)(316002)(2906002)(36756003)(16576012)(26005)(66476007)(4326008)(8936002)(66556008)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTY4NVVGcjBnOE13azFqL3RTWktSWE9ESm5wZ1pmZkRQMmpXSGdqZG1lT1Nx?=
 =?utf-8?B?SDc2UHdUN3p3cis3VGhPem1wMW8xeGV2ZVBPNmRvZU1uNCs1NVhCeDVnU2ZY?=
 =?utf-8?B?dGdzeUhHdmdIZ1E4bTl1YzlCL1NwQlRwZ1Q3aVNuUEhNL1I3aWFuV28rM3lD?=
 =?utf-8?B?SjNReCtjNnh3NmJwdU5EekwwL3dvUEFGMUpFWEcyQXFaVWp1ZjdwZ1lQQmN5?=
 =?utf-8?B?WUN0WXFjN1ErbU5ZUTJ2VktMZzdJdmw1OCtHRGIwdXROWnJ6VUpQeUg1dUkr?=
 =?utf-8?B?T1RiK2VMdXAyWVZTUTkrU1JXdFd2ZXVmd0xwT3UwMG00em15R1RpSmtPdzFE?=
 =?utf-8?B?WGRRSEtTY0FpVzZ6UkFLZkRpdEx4c3N6djF4U1BTZXR5Z1oxRDJXeWprNlVq?=
 =?utf-8?B?ZFVsN1VYTGdxL2lYNTdWNS9FQy9Od1p2dE1RWE9BdVBWSGJPTXBEMkN5SVE3?=
 =?utf-8?B?QUV3QXlVMU1lNDJmU21qMXorKy9KdDlRYmF3L2hmY0F5WCsyRFF4M1MyUHli?=
 =?utf-8?B?YVNIVk5qU3pNOWtZbCtlbWlhS1p6RXdlQWp0WEtGMUFCY1JpQS9IUUpvVDlq?=
 =?utf-8?B?SnlFQ1BGR2JXQmtoTDlGbUdreUpLN3oxL1hlc1ZiZ2pDNERud2ZBclFheHlF?=
 =?utf-8?B?Y1NJVzJuTUtJMlUyU1IvZVZjdGJnVnErc3RPQjBpQlhuci9DVTNCZlo4NVE3?=
 =?utf-8?B?dHJId0krOEhLTHFldUMySFoxRW56M21NOVJVS291NElrRFR6c3g2T0ZiSFdw?=
 =?utf-8?B?RmxmSHVyNmpQQVJoUjM5bnFJek9sekRDbGl6SHZqS3BEZGlHNVRRVSttUURq?=
 =?utf-8?B?WXpEelNodU84RHVQNm9PMDlhTVVjeWRXbHhyTUJsc1pmbUdBSXRCbHo5Qy9w?=
 =?utf-8?B?U0k2R3lCdm5QbjMzeFRUMVJhc1IvbGQ5VTZheTFaYUpSN0FHeUxXcXNmNzU3?=
 =?utf-8?B?eE1uTWx2MkpJVEtCSjVZSUY1ODlMaE9LdCtxNUpxSkFTclluQklkUG9yZ3dx?=
 =?utf-8?B?bzZrUVhXMzdLeFpCak50UW9NTU5HS1lyRXpnNUx0YUdEck9mOUFoSTM5OVl0?=
 =?utf-8?B?RVpJNEZMNmlIOW9YLzJ4ek1WQytxb2JPd3NhV2d5aHZpT1JzengxZmN5T3Rj?=
 =?utf-8?B?WEllTm1ZMTNER2xXdG55aFdGdWlmUGRBVTN3ZEZLQ2VCU2F4UmxDK0FheXFo?=
 =?utf-8?B?ZnhubHV1cXA3VXZrM1k5NWNvV1pkWWNZd05mTldoTmt0ZnRUbzJ6KzJsTHdX?=
 =?utf-8?B?eW1tN1lKRW42NStkaW1RL1NadUJscFZNankvTUY2NjA4S3hvT0NQaGhSQ3hp?=
 =?utf-8?B?UU9lOGtFNmsraUZYUjc2dEppV0FDRFdPWS9wQVJORldkYUg2V1JlMkhSanlC?=
 =?utf-8?B?aDZRbDhRZWwydDdRWHg4UStydms5V2EzWXVia1ByV1BDdktzQXg2UmRJVmNM?=
 =?utf-8?B?R1VtcG5UbGxkU0ZnTTdjRjhYaS95cFdqYXVYeHgzSE55Yk5LT2lheTVJQnYx?=
 =?utf-8?B?OXA3ZFd5ZjlQdmIvbUl1M3E0cEZ5cC9nMWtCaXEvRUo1THQ1MmhudmtMUDBG?=
 =?utf-8?B?WEEwdVpzdDFZQm9NUk9vSHlGTUZDOUYxU2VzRWlBYlZpcE9KRlFYdzZVZlhM?=
 =?utf-8?B?RkFDQjNMcGY0dTVWazNoNkQxOE1ORXY3Qzg0ZmQ1d3NlTk9sREk3U21KbUJa?=
 =?utf-8?B?YzVxR3YybUNLYWQ0ZUx0OEJBTGJlNzBKQjlJYWNaVkpnYWNRUlI3RExQVE55?=
 =?utf-8?Q?inRcLj9LyT0EAccieMipDFJmiO5RGHebzms1fq4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4fa0cc-4177-46c4-b3ba-08d981c6b2d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:54:25.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF71qufRq8MHlorcmYLOS6Hm5243rDUCC/+BOFPlXvBkTn60fTIBwO7kJYjrwWDQ8pmZGx0Fauw6fnE3YghcKY7ZKW6ulufMpAdvDOugxRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6357
X-OriginatorOrg: citrix.com

On 27/09/2021 15:52, Juergen Gross wrote:
> On 27.09.21 16:40, Andrew Cooper wrote:
>> On 27/09/2021 15:24, Juergen Gross wrote:
>>> On 27.09.21 16:13, Andrew Cooper wrote:
>>>> On 27/09/2021 11:48, Juergen Gross wrote:
>>>>> Add a configuration item for the maximum number of open file
>>>>> descriptors xenstored should be allowed to have.
>>>>>
>>>>> The default should be "unlimited" in order not to restrict xenstored
>>>>> in the number of domains it can support, but unfortunately the
>>>>> prlimit
>>>>> command requires specification of a real value for the number of
>>>>> files,
>>>>> so use 262144 as the default value.
>>>>
>>>> Citation needed.
>>>>
>>>> prlimit -nunlimited
>>>>
>>>> prlimit --nofile=unlimited
>>>>
>>>> both work fine, and strace confirms they issue correct system calls.
>>>
>>> Not on my test system:
>>>
>>> # prlimit --pid 734 --nofile=unlimited
>>> prlimit: failed to set the NOFILE resource limit: Operation not
>>> permitted
>>> # prlimit --pid 734 --nofile=262144
>>> #
>>
>> What does strace say in both of these cases?
>
> prlimit64(734, RLIMIT_NOFILE, {rlim_cur=RLIM64_INFINITY,
> rlim_max=RLIM64_INFINITY}, NULL) = -1 EPERM (Operation not permitted)
> write(2, "prlimit: ", 9prlimit: )                = 9
>
> vs.
>
> prlimit64(734, RLIMIT_NOFILE, {rlim_cur=256*1024, rlim_max=256*1024},
> NULL) = 0
>
>>
>>>
>>>> Support for "unlimited" as a parameter has existed for the entire
>>>> lifetime of the utility,
>>>> https://github.com/karelzak/util-linux/commit/6bac2825af7216c5471148e219dbcf62ec5ede84
>>>>
>>>>
>>>
>>> Yes, but not all systems seem to support raising the limit to
>>> "unlimited".
>>
>> That's as maybe, but
>>
>> prlimit64(0, RLIMIT_NOFILE, {rlim_cur=RLIM64_INFINITY,
>> rlim_max=RLIM64_INFINITY}, NULL) = -1 EPERM (Operation not permitted)
>>
>> is a Linux issue, not a prlimit bug.
>
> Nevertheless it isn't a good idea to use this setting in case it isn't
> supported in all Linux distros/versions we care about.

Ok, but at a minimum you need s/prlimit/Linux/ in the commit message.

~Andrew

