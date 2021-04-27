Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA336C174
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118132.224111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJeq-0003yc-1r; Tue, 27 Apr 2021 09:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118132.224111; Tue, 27 Apr 2021 09:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJep-0003yG-Tj; Tue, 27 Apr 2021 09:05:27 +0000
Received: by outflank-mailman (input) for mailman id 118132;
 Tue, 27 Apr 2021 09:05:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbJen-0003yB-Sn
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:05:26 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c638880-03d0-4055-a19b-276ac693fa07;
 Tue, 27 Apr 2021 09:05:25 +0000 (UTC)
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
X-Inumbo-ID: 9c638880-03d0-4055-a19b-276ac693fa07
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619514325;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iDSOyvMPnznbZSaO1Ik0WZ81sWqPTRI2ohVT6ZZ06uQ=;
  b=ZHVi5vNKFxDFXlQH1QiNxCnLCsxNfu3AywSBxWNMT2v5xbF/ItLyDVIZ
   7O5XvluF2KwW/3pOQe9x6ocqiJi49sPQzMqwXzdUNAhfs/29ye3ngf/Vg
   CE4JmsQF916gRvTCrZnKWOoRlxbZ0FmeipU3EWqyf+ejdPqfcH/jP90Cm
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TJYSPKYT41JeKeKdfl1Ar1HQAYcjYlSz0erVMdWaK3VDWLEjFq3nY3gTNtpetW8FmzLA9nNI9Z
 fOooXuY+0VZytPfIpaNYUSTr6PaoCb8X2f8TtIjr4+zj9bO0OSMWqOQt+ncCgq2wLtN45hyuPf
 j2JE7bZx6aE8i6OU397awyiw9b4MWzRLbCMgpr6TktHd50GhVY8x777JcBPF/5+e//nkiG9HZ1
 78vvYrdEeM+j7PzfDU3yKYgzuR8/8E9/Kpjjr6y3htJf7XZ081Ert87HiDrO8APiOU7W6vnSD9
 vxA=
X-SBRS: 5.1
X-MesageID: 42481323
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:K7k2P6HuxHx4P0SppLqFWJTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYfNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nFPiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmWl9z0ZVC5CxqpnzH
 jdn2XCl96emtyY6juZ7W/c6JxKhMDso+EsOOWggtUYQw+c6DqAS59mX9S5zVUIicGprG0nid
 zd5yonVv4Dl0/5WkGQjV/T1xL70DAogkWSuWOwpXf4u8T2SHYbJqN69PtkWyDU4UYho91wuZ
 gjtwny1+s1fGH9tR/w6NTSWxZhmlDcmwtbrccpg2FCSoxbUbdNrOUkjTJoOa0dFyH34p1PKp
 gJMOjg4p9tADenRkGclGxuzNuwZ280DxeLT2MT0/blrQR+rTRXyVAVy9cYmWpF3JUhS4Nc7+
 CBCahwkqpSJ/VmIZ5VNaMke4+aG2bNSRXDPCa7JknmLrgOPzbop4Ts6Ls4yem2cPUzvdQPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0Wimo4t1C5rBi04eMBIbDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/HBZtJ5QvjQJNfQENuEfE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfRGX
 0GcD/vJNhRz0yiV3Pi6SKhGU/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WqJFR5w+kLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ild3tLoAQNIn7laLprgaTaRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/WqL3ydlHlWgH6RVZ8Tlumi6K7eC90FJ6djfJY0ORTAFhRzlwovgn
 xEchU4SkjWES6rr76kgpwSDOT2bMJ9nw+vHM5RpRvkxAahjPBqYkFecy+lUMaRjwprbSFTnE
 dN/6gWh6fFpSyiMlIlgOMzMERFbUOeBL4uNnXDWKxk3pTQPC1gR2aDgjKXzzU+YHDj+Ukpim
 v9FiGMYv3QDl1BundX77by/DpPBxagVnM1Tko/nZx2FGzAtHo26+ONa6ap+0a6a1cJwIgmQX
 r4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJ45davI53+rIIqUtK0PEvNO5qx5PNT2vuJja5
 PYRyalaBfDT8850Q2coXgofBRuoH4/iPXyxVnL6nO70HNXO4ulHH1WA5UgZ/eS4GjvS6zWjN
 FXjdcpsfCxNWu0QNic0q3TZyNCLBSWgWPedZBdlblk+YYJ8J10FN3ndBGN8ldt9hA3Nt31m0
 MTW74T2sGIBqZfO+gpPxtE9V8onumVJEQlsgbKEvYzFGtd+kPzDpes2f70srIhDU2KmRvoNX
 Se+yNb+e3ZXyHr789sN4sAZUBXYlM78nJs4aercJDREhyjc4h4jRCHG074VL9WU66eH7oM6j
 58/tGThueSMw71whrZszc+AqVA9Q+cMI6PKTPJPe5D6NqhP1uQxoOs/c6olT/yDQKBVH5wv/
 wNSWUgKuJZijcji4Ur0i+9DozPy3hV7Gd20HVAjV7i2o+v/WHBO1pJWDep26lrYQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42481323"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzMrzk+h6/822B/PQ47BQ5oKG0+8sMeylw3Vy6Zy41Oi3mnPiCWR9VXEpxfjQJBRy+blw5ITMoQ+RIBFpNPwalvZD0wbDtY0PYTzHV6a2EEMiLJYYYFztKRYe0RxxEWvbFv61wU3sFE+N0sTq/fVr1j/XCQiSHFozobcteIsRU/sqG8K4t3/ZDrmTLht6liDkTh9+0qs1aSEr4Aav0lmivIyy7FxA/MrhVz4dMZWW2Evievk5vaqyYqvaATDejypOX5dGZuFubfqcaFS/Lmj27H0KIbmHTZuR/ss5yeLAsiGx5aqiBI7wuS95+NIXJ8/I+I3OlfHGF1VBR+C6BNMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NuqRjCniaUA8Mei4lmYCrH2yhGuw8nFaNF5XuwRRCo=;
 b=U5z6hVADurrvj63ErNLwzZ5OlgukfqvT5LVoZPJUs/PIltmTepzCnfG8jGPO9E4fcbVzJ4VRFeV/U/kSjNXA61QniMm960myZXqLZtSQ41QsH3F0XK+Q/4Qvf+WjDtu2rYCa2HuP6jEhC61iUm3k4hGrYcB2+g1wlz52evrdxHScqzQyfUTRXu8W4JWQtK/eo8i5h3P1L5o1sBwN+BVqoLVLgWRps43n31uEEHCQLfQXW8XUtK0Pp8AOiIDW+9wI2fwRH2nfthCGR//axdxs5EG4BKVPNHB72C4qQ8VsFr1uWIAU6ZrsyqQnMfJW25+o1P5RATV5xMaLinwjFowT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NuqRjCniaUA8Mei4lmYCrH2yhGuw8nFaNF5XuwRRCo=;
 b=mLClvkNgqSn9o41/GmP/8r5hZxavBlZb+ZQr5mrGGfh3E5i8pPr9/KidKh1Pwk0RFUKpXo5WOlSzpjwYcOmJf4Z72aZ2LXgjPooOlxlHRxp5OsLFBaOubKnSS6wGYrfhwFreHnrpNw7wpt/9cJov7qYS4kj+m6Of8aislw+na8o=
Date: Tue, 27 Apr 2021 11:05:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
Message-ID: <YIfTyT4rvD9yEqiM@Air-de-Roger>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
 <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
 <YH7/SvkrB2yGgRij@Air-de-Roger>
 <5170aa51-8e34-3a45-5bf6-c0a187b1c427@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5170aa51-8e34-3a45-5bf6-c0a187b1c427@suse.com>
X-ClientProxiedBy: PR0P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfa8c1c3-32e7-4042-5c68-08d9095b9467
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB24914A5CD0B931B77691EF3F8F419@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EulcsP6JMhr76Ub1gybOQR4kdK8meOyFPLA5V5M7SYL+911EfVIpFLbM6LOgJOEQ+rj2e1M3nZwwaKwRJTkzYeQu4ONl83gb0gXuoMmGNfvFyo0YJNpcejHTXMT3NlrdhKhCtpwxM1kPJepFK1k7hAOWOIk4d/7dzqxpR0jFySr/f1cxYuev80C6V1TwTVVND4I2UCsSDM1KypVVkV6dA9aAv8/XaLB0wZfMzhPBrveqVQFJZXGsZXE7Y4TrX21AKteFs5zzF6lQL6s9Dg3khZp/pvfzF+JB25boy6kLlgXElHq7bLnUe0c1WB4Q0iZC27Wm7aKX1U4N61dDYyPbqY5zpQRVOzsPoIKBe7Wmw8orC+suZWMbAamDpJCkrQ0n7Hca1BIsVb1zh4NWex/tpOpPXloF+s3NQGzkhYEX6HL9z1AQud+wa8mf2EU3Pi34nQmso2TB/oxB1X4+pv/nHjPLH4iTdlClXM7dDf2q71QQrKa3cy7S2U2rElgRVzmNrUKhQoWJTuNmtUJ5qi6hi1U4hKli2WwiuEJ4NQnnWqCtnFcHmhO8AlfFCFHqRdYVZsFAnHs6pe7KKib4sU7/swj0d/Xpy98dGsc+p2FOyAE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(366004)(39860400002)(346002)(396003)(4326008)(8676002)(2906002)(8936002)(5660300002)(6916009)(83380400001)(53546011)(6496006)(956004)(66556008)(6486002)(186003)(26005)(38100700002)(16526019)(316002)(6666004)(54906003)(33716001)(478600001)(9686003)(86362001)(66946007)(66476007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHY1VW44eExIVkRmTDZpTlVYQSswWXdiSEh1K21hcVFnakRsTnpPL0RabTdu?=
 =?utf-8?B?Nm9ETDhBd0x0Ym9JaFB2OUppQm5lZ1VNVWlDcVVlNEhhS3RFMlBudmdjU3kw?=
 =?utf-8?B?b3luOXcxcm5QWGNVbXRmSWVTc0RzRmdvU01oSWVOOGhOSEtXdXFkVXRmWDJO?=
 =?utf-8?B?Qm9LM2xoZVBNNjRlMUxicWRHUExta3lodEMxUy9IakltMGpHODc4OEgwL2RD?=
 =?utf-8?B?bS93VVpIaE9VZFlrMlJzZVhvV1Q4a1RSRHlzUitxYnh3VnNaRVZZYzJhMDJN?=
 =?utf-8?B?ZjQ2bHNFbGErUVA2RVRyOHBVWkJzT1hicVkzcDI4UEl5V0dkczFVTVhzVEJj?=
 =?utf-8?B?YVJ6QkR1UEFRV3RRL0hYdnl4aTFLVm1qODRHVzdXNHd3UWhvUlBhZzUxdWpC?=
 =?utf-8?B?SnNlcDNFd2EvMVBsWDBWeENCcHUzL3BXRThDdE9KR1gvS0FON0FZb1luaE5t?=
 =?utf-8?B?WW53Z2Z1UEtraXRSMUdGcGZJR3ZqYzRPbk9kVVpIUzkzSldTQlAydlpCT1ll?=
 =?utf-8?B?bVNNaDBpTWZYb2RkL1NPWlEyaVF1azE5VzVyOUJFOXdsOGtLVSs2c1dNNVMr?=
 =?utf-8?B?dlh4TVQvTUcxTzc0NU9kNFJqS25naEcyWmJGZHFIVElZN2hlc0NtNjlycWVH?=
 =?utf-8?B?STNTcDVSMjM0ZU81cEcrYXlhRVFUOU1LRnNUdWJWeENmVjJxMkFEY1BpcVBK?=
 =?utf-8?B?VlhTcm9qdWx1NGwxY2RUdlc2SHp0K1NXTE9PMjRTL2hFQkcrQWZPdElxcXph?=
 =?utf-8?B?eDRCZDhqM0dJdE9MWGpvYTFQR1hibk8yU3V0MGdqdjY1VTcvby9PRXBsK1Mx?=
 =?utf-8?B?anRnUWVqU0xMZTRVRm55d3VsR3lkV05RWjdiVGhxdktJS2hCOGlWR21lQVBL?=
 =?utf-8?B?M3JWeTUwd2tTVE5NeUU4dy94K3dkWWtibU5tSFhvbmZlN3piY2x3SE0rNjMv?=
 =?utf-8?B?UlFmZlU3cUpycnBZV1F0cG04MUxGVjBYbEMySWtwellqRVA2d1VhYjFBdjh3?=
 =?utf-8?B?Z3ZyV0FNTU1zNHBGZVdZQkhPd1phRmlFVVlSYnYzQURPeEh5WUtaaTJEUFNY?=
 =?utf-8?B?VXJDOGJpZURFYzIvQmlEVzRYeWJjeC9GRFdhalRyK2J2ak9vZXowMGhBZXBY?=
 =?utf-8?B?YjVjb0ZKMmxZb3Q0UDB1QWZHRWFrZXpIRjY3YXBwMjJuKzNWM0EvZjlBVlIr?=
 =?utf-8?B?QjlHdWFrY1NQcmt2L08vKzE2anN3Y25MTWdKNHkrN1k0WmhwQnlXcHltU0dZ?=
 =?utf-8?B?M1dCZ0xCZ2c3S2gzRndJVkhIaG1QZEV2UkhEMTM3bW9kb2pyK1lIMXRvV2pV?=
 =?utf-8?B?OGNCeVFVLzFKdEJ6WnFKanFPeklqdjV4d3dUUW4wSkxOZFlLcnZGMEFwcWx5?=
 =?utf-8?B?d1ZOODNSUUlQbVBtcy9GZGJGbmJvNDd4UWFyR2tkZDNpbFdyVFZlZlpwSlNF?=
 =?utf-8?B?Ty95eHhRT3RBbWl5dXF3MkJtSnNlc1RaL2crNlpiYUo3T0NaMytFbE1JcS9o?=
 =?utf-8?B?SSt0SUZsZHlBUkVhWjkveEpiL2VyYTZWcnhuaFdhNzRBVzZiYjBQRTFlcFFo?=
 =?utf-8?B?dVdjQnJkekYrMzd6VmM3aWdXYlZTdUtCQzYxTyt0MHVuUzNITFNCY3FFYzdt?=
 =?utf-8?B?NVRkUURaenRrUnBIVlV6NU9pNjd0YXJXVUZiZ1RQZkJ1eUsyekh3eE5MRnVP?=
 =?utf-8?B?YlU2Q3RjUWxCVnNRVlZTQ0ZvbzI4L3BVU2hmL0VtM1F3K3A4U2tZQi95THhu?=
 =?utf-8?Q?Mzws3ibAKQ2FZ5+ugtqgwgkyyjZmPJ/AitO/utB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa8c1c3-32e7-4042-5c68-08d9095b9467
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 09:05:18.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJnuoIGYgxM8ermu839xW3Zrp+a5ZkRqAMPxfL1t6y/O15tQ5nHx1r7cxYC71UK4C40E2DG4uxEGgzbFKIY+/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 04:09:03PM +0200, Jan Beulich wrote:
> On 20.04.2021 18:20, Roger Pau Monné wrote:
> > On Tue, Apr 20, 2021 at 05:47:49PM +0200, Jan Beulich wrote:
> >> On 20.04.2021 17:29, Roger Pau Monné wrote:
> >>> On Thu, Apr 01, 2021 at 10:33:47AM +0200, Jan Beulich wrote:
> >>>> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
> >>>>  	@sed -rf tools/process-banner.sed < .banner >> $@.new
> >>>>  	@mv -f $@.new $@
> >>>>  
> >>>> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
> >>>> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
> >>>> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
> >>>> +	$(call move-if-changed,$@.new,$@)
> >>>
> >>> Won't it be more natural to keep the .s file in arch/$(TARGET_ARCH)?
> >>
> >> Yes and no: Yes as far as the actual file location is concerned.
> >> No when considering where it gets generated: I generally consider
> >> it risky to generate files outside of the directory where make
> >> currently runs. There may be good reasons for certain exceptions,
> >> but personally I don't see this case as good enough a reason.
> >>
> >> Somewhat related - if doing as you suggest, which Makefile's
> >> clean: rule should clean up that file in your opinion?
> > 
> > The clean rule should be in the makefile where it's generated IMO,
> > same as asm-offsets.h clean rule currently in xen/Makefile.
> > 
> >> Nevertheless, if there's general agreement that keeping the file
> >> there is better, I'd make the change and simply ignore my unhappy
> >> feelings about it.
> > 
> > I don't have a strong opinion, it just feels weird to have this IMO
> > stray asm-offsets.s outside of it's arch directory, taking into
> > account that we have asm-offsets.h generated from xen/Makefile into an
> > arch specific directory already as a precedent in that makefile.
> 
> Well, asm-offsets.h generation doesn't involve the compiler, hence
> no .*.d files get generated and want including later. For
> asm-offsets.s to have dependencies properly honored, if we
> generated it in xen/arch/<arch>, .asm-offsets.d would also end up
> there, and hence including of it would need separately taking care
> of.

I'm not sure I understand what do you mean with inclusion need taking
care of separately. Isn't it expected for .d file to reside in the
same directory as the output, and hence picked up automatically?

Thanks, Roger.

