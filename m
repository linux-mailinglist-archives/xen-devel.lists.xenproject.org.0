Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A2368438
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115686.220775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbcU-0006Cz-Da; Thu, 22 Apr 2021 15:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115686.220775; Thu, 22 Apr 2021 15:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbcU-0006Ca-AR; Thu, 22 Apr 2021 15:51:58 +0000
Received: by outflank-mailman (input) for mailman id 115686;
 Thu, 22 Apr 2021 15:51:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00C0=JT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZbcT-0006CV-7b
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:51:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7c9a248-7a23-43b8-8b6a-482caba05376;
 Thu, 22 Apr 2021 15:51:56 +0000 (UTC)
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
X-Inumbo-ID: b7c9a248-7a23-43b8-8b6a-482caba05376
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619106716;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YglkNpumhvuY4ux6C8C/gndnuzftg39ceR8YXMawFH4=;
  b=aGSH3odmUtwkPt8lKOP0nVuF+GpL3uXDaZborGZL/2/R0zo8CDrgZRfD
   Co6LRhk7UKR3E7phQYRIOlW6Q2aN0jjtjFDuUcKISewA/CwuZ3J+yqw2/
   JK/mMwC0sK5ktBeAl2aAvxIWF8fC15MBtqEApMhDIfRIqG0c6+hZSYlci
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Z4Uqk7HiCGyiMRyu7cf+Y8ftHaPAkD45hcXEyztXLpuuY9ZLBwnCeh5UOZ9/GUIwH/EEClFxJW
 ZWUZJ8TmA+BfBM9JUaG+RarXCW6wPzpnrmIkkT8I5pJ3BXCZ/8jmQmOfjeJ0wauYTcYztcAhH1
 semKWFyeq60sjlFRU4az0PBbAcxRJ6mUgq8tF3WBYYFeldfXWecGA13LamrcsmEq1wXFmR/vEL
 ut4ygj+PxV34SNF4P1Fzoclm6hYicnRro0uOR08BlqyDhsVH2pg8DBlmNOrH7b3BmBxd0rOZ+3
 O80=
X-SBRS: 5.2
X-MesageID: 42024505
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:X1zREq57q6UseoWoEgPXwUOEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbjqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAoqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+ELzGz2BACXzRThYoz6G
 StqX2E2oyPkdGejiXd2Wja8ohMlLLaq+drKcSQhqEuW07RoymyYoAJYczlgBkUp6WV5E8ugJ
 3wpX4bTrlOwlfwWk3wnhf3wQnn118Vmg3f4HuVm2Hqr8C8ZB9SMbs4uatjfhHU61UtsbhHuc
 ohtQ/p1Os0fGf9tR/w6NTSWxZhmlDcmwtErccpg2FCSoxbUbdNrOUkjTBoOa0dFyH34p1PKp
 gWMOjg4p9tADanRkzCsnIq6NKhWWlbJGb9fmEy/uaR0zRQgUljyVoZyME1jh47heIAYqgByO
 LePqtykrZSCucQcKJmHe8EBfC6E2rXXHv3QS2vCGWiMJtCF2PGqpbx7rlwzOa2eKYQxJ93vJ
 jaSltXuUM7ZkqGM7zB4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqJuZwkc47mcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQksonWmiJvtnAJuTRx6zmWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9rwPWX1/rZ0zj7bN9GKXX5IEouc0wH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+hWTexxeN00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPURb3H6NIA5DX9rbeT
 Qv4GhfyOaSFdi91CoiA9WoPiaxlH0Ivk+HSJ8ah+ml6dr6fIg7SrIrQrZ4GwmONxEdo3cqlE
 5zLCs/AmPPHDLnjquoyLYOAvvEStV6iAC3ZehOqXzesk2Yjdo1RmQSWgOvVcL/u3dtexNkwn
 lKt4MPiruJnjiibUElhv4jDVFKYGOLRI5dAB+9f4VSkLDzcARWRWOH7AbqzS0bSy7PzQE/l2
 bhJSqbdbXuDkBGsn5V6Krs7Wh5b36QZU52d3B8v7BsDGiugAcH7ca7Io6Il0eBYFoLxe8QdA
 vIZjYfOStC7dG63hz9okfJKVwWgrEVesDNBrUqdL/enk63IIqTjKccArt/55B+Lu3jtecNTM
 OScwKYNynDFusswgCZz0xVYRVcmT0Bq7fP1xLk5mTjgyJ6LvrWPVh8R7YUZ/ub9HPpQv6U0J
 N/yfI51NHARFnZW5qj8+XwaTUGFzb45UiRZMssoYpPva0zuKBodqOrGgfg5TVi5lEGMMzwlE
 kiW6x177DKB593c6UpClVk12tssO7KEVAivQP3CNIvZF0Bj3fUONWS/rrDwIBfS3GplU/VOV
 OF9Tda8OqAdyyf1aQCA6ZYGxUaVGEMrFBj9viFbYveFUGDcPxC5kOzNjuYfKVGQKaIXZUWoR
 AS2aDFo8anMw750hvXpz11P+Zn9HumW9q7BEa0ItFzmubKcWiks++N+868jDD+VDu9ZQA5vO
 R+BD0tR/UGrCIjgo0x2jW1UYrtrCse4gNj3Q0=
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42024505"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCkS1dLt0f/BkYLBIsyjp8FStpIhhEETg5frQvXBkNbvAyRPoCWulG8oWbVnvSlq7y337oO7X/ZhgyPiEHLDSZLtY40CuOSuFtVV/2uVfXrSEzp4amkmwzg7P7x64AyBB9s3VV/BMQrtO5EGeMptnHRzlwoPd+JTcIjI6Pd7Gs47WvjefTrGHmmrpvmDBOpESD8cTTxE2MKd5smmocy+5WvbKnbDUqtuBEBl/EFsP9oYH7YeLDCXwjsqP7tirgsKIBOfJtf0EZB1QYZyGj4QQ7TY6DwU45MS2lUkW/5BXVCNqBLVy4HG3nAJ/dlrN34QxuPBc7BP9Bmnr9MNZiDqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqV+ASIEK9fe/BXoxgqT6q4vomeYVYnk91pWTnTj/6A=;
 b=LtHeAKQig50sX1xNtRkEZbbRMp8LW3hyIu61rjsGFHxMRLESZjmAJw3xbNDr9+vMz6V8uc4IQ6NSxrWRB/Bp1LsimH7rL0s1lGOelhmJ05HTLGjzprA5B68Nyrt6oTHQpBzIYvmZiNTc8AkrEHxfkVrdbnpI1SfOy31j0dvAUa118mPIBNmg7kltw5hHYB4tzUS99tSgm1PKtVwL2U/OAyKL3fd9otpOJVj+eOU2UXcp0bZrmwV+s1WiCc4XNa5ajw961F5cnBDkATnzLtWZYn8UbaKi4iebmEDcMP4j80m3GzElZkhtQ6BWYAQ8NzOApucvBKPpY3JVeqOXAjOOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqV+ASIEK9fe/BXoxgqT6q4vomeYVYnk91pWTnTj/6A=;
 b=Y3wTEvG4lxmtx2zQd0o2c9Cj3i924T70v3gqo4QD9v+c1QHqTOMs/XauxQpSgqNneQVwj2hx9gMH10cSrD0BBHunxfamiMC31lp/VKjvQm7EulmQl+LFxm2elqbEj507d53GDuud4SnqU5/Ar4YFdDoodBBWS+s+Fj7x61lJ358=
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20210422151007.2205-1-jgross@suse.com>
 <df27aba6-c67e-d66e-f00e-75a1f76de921@suse.com>
 <b69df7d3-6fcb-a565-9ec5-a272b6163320@suse.com>
 <08e3fcf1-dabc-c550-f76c-47a78a12274b@suse.com>
 <ee2bc5f9-58ea-bad3-1343-2156d2b80ad3@suse.com>
 <e293427d-b178-fd22-28bf-e6c6fe7e3f83@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
Message-ID: <51e880f0-698e-8208-1a04-fca3942cd6eb@citrix.com>
Date: Thu, 22 Apr 2021 16:51:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e293427d-b178-fd22-28bf-e6c6fe7e3f83@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0416.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ab3da4e-d4ba-4604-bf07-08d905a681d1
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5454AF12608E907056CE5368BA469@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbXnsfJrtujstOu6Nm0PqE3yCzvLIrorqvduJ0R1bt06XZ5Nnxsx+NRu57SiKB/xNgEe5JwBV64PntkYu2LSfIQ/UOq7aF3V2w4ugA3GrXMlSJQ+6IBTikH1nY8QXcDdmAq3/pFFTQI7xPvBr7tKy8CNNNBL1cSaUoQckRM9BECJXnM4ux4udXScE8/NV50iT7Fqoegzs2aolsTHZlN2Pj13NVOc1MtSmWU1QxywUKDudKnnCSBfumNMqb4cyDWnQpmQj3v3evcAh4kLDnxCvZzVY2D/gPp3DBHPl9fTmWHSvzjYIJ9q/pgt+GbLNfV8CoM35NbT5WHOBJ88z5euyjhtJVfDd0uacpGfBR5OG3GCDVyuo4RlALYafA8Ux/n3gvrAorpeU+7EuNBa47Mn7C/3fBkLnsJD1fMrAiVXBNcrdMI7HGuM6LKcIpgxglGzn1FBVsWQiEdEG+eT1//Qifkg52fJXFCX+Rk4jBOecFSPizq8Wu6i619DK6CjrObA3g3fR8QmU37uWriZ4dkABj2mSYVGHvImyxIIf5OhrercWMuYCJw9lnXDIYkt7ZXi1yJxrLXmxhiue5NPZLk6MPj6hjBUTWSkFF9Ei1GR+7K1/QJVg/RleSKsH3qznut+RnWUTE0uWLT1mc1paLjRvtv1DSEOSynMMFfrMN2KP98r2o0d6A+l0gpZU/+wsJqb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(8936002)(26005)(66476007)(5660300002)(2906002)(110136005)(66556008)(66946007)(16526019)(36756003)(8676002)(38100700002)(6666004)(186003)(31696002)(31686004)(6486002)(478600001)(83380400001)(54906003)(4326008)(7416002)(16576012)(316002)(956004)(86362001)(2616005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzEyTHlWdHJYeEhPaWNXUndkV3dLMG1FQy9Ra2FCZTZGcWtZU2pqdVlRelVB?=
 =?utf-8?B?eGcrZ2tJTVdpSXFzeVZCWXNGNU05TUpWVzU5V2FwN2hObVBIejBUamx3bmdr?=
 =?utf-8?B?VnlobWFSRjJjWXhzVHJKb2h1MlprZmY4TGJYN2hNb2lMR0hjbXBRUDNTR1p0?=
 =?utf-8?B?RmxVTmNYRWVRLy9BSkNGdnRkT3pyRGNSNFJTbklXZU5ERE5laDJOaC95N3BV?=
 =?utf-8?B?K2RSUXp6dk5LcFFhNTBQaVpNYXFmTS9iMTZVaXdEUEhTNThlN3hLYWRrRFZX?=
 =?utf-8?B?MGZMSEZWOENOd0pCblZRaE0zR1h4dmszUU1WRDQyc25SWlNqMjNMais4R2FP?=
 =?utf-8?B?OGthbytHUmlha2F5Rmp5ZC9JaHVvelNXQXE4QzNiR0hSQlk2NllVQUwrRU9a?=
 =?utf-8?B?cWxzY3RHbXpFVHlMVFByejFsU2k2QysxREZlN2U2emdNKytnNjdPMEpaQVRt?=
 =?utf-8?B?aHVkU0VtVkFTd1hTdjJra1htZ1ZCeVdKNHR2SmErNXlWeW81N1M1dm5jd0VS?=
 =?utf-8?B?ZERsQ1lkMzNYT3AyU1BDamU3TjFERzNWSWo3b1ZlbHFOZTk5K3ZmNVV1N0s5?=
 =?utf-8?B?THd6Ykx3L255cFhlWGgzNHBwcEdvWnNQelpCd05vc1BGcldDaCt0YmdnRFNH?=
 =?utf-8?B?cW9TbTdSZFgxVnJ1ampGSElKQkxzUC9XVERNcEZUTDlaVnlqcFM2TWQvWUF3?=
 =?utf-8?B?ckYxc1djZE96VDhrSzJTaEVUNG4zOHNKaWsybGlwa1Q4TENzY1lmQmdGczZT?=
 =?utf-8?B?c1gzMm9rbG9UVVY0RWJJTTgxVm1WNzRmSTZiR0VyM0Q3RnpLenhUdXNSbC9i?=
 =?utf-8?B?alp0YWo4c3c2dXN6bUFud2dvWld5Y2w3QXl4WDBHUEtqaXBTQ3Urc3VSYkt2?=
 =?utf-8?B?SHkwdG1Ec1JkK3ByNWhpNDdKTUxXMFZYUk5EVnBabitRQytpbWVZM2V6R09T?=
 =?utf-8?B?V2V0cVlJVXZQZ0FQUHZ1cnJvSGtFU2c1bnJSenpla0hmcmo3ZjRUTFd0c05C?=
 =?utf-8?B?K0QxVUhyOGlmNE1kcVIwcWYxVjFxWWp1Z3BEMzd2dG1lTnk0Qzc0MVVXNDlo?=
 =?utf-8?B?RVdnVEluanhpWDFhcjNPQTBZTVFlQzBKVitIQW1oMlQyVGg5RG9MbDFYL2pq?=
 =?utf-8?B?aGJFZmlJUUVQUDJFSmpEdTZGdjBoOVJGZUxVYis3dFF5Sk5SWHpRTFhYc09Q?=
 =?utf-8?B?QThOaVNUd2xHajA0YVhrYzIxcmE1aFptTTRucnduTkR2Umh4dFM5UTdSbzFa?=
 =?utf-8?B?eVgveU1FQUs0YzBrWS8raC80SjJxdVFQanE1dXV0dVdsem1TRytBQUdoUWtQ?=
 =?utf-8?B?Yk1OczdEYUNNcEoxZ3BjSythb255Mm5ieFVrWlhpTzZPK01NVXl6RnJrQUh0?=
 =?utf-8?B?TTc3QmxIa09PY0R4aFhMeEs2K3BGUHNGdm8yd25lcHAzNGtxaERzb0doMkVO?=
 =?utf-8?B?eG9xL0djVmhONlRlVjVjRTNRN25wb1pLYVZweGcyU3J6ZmIwY2poOWJEU0N2?=
 =?utf-8?B?US9tNW9zaW8ydmZacmk1ZGMvdkIrY05kOFdxNmFqVk9ycmFFTUppM1B3RHVF?=
 =?utf-8?B?WEI5OTkvK1NyNWpDQjlpVmJESFFiVyttYTc3NE13aGd2NFloSFNScEV2K2JJ?=
 =?utf-8?B?a0R5RkMrdnE5U0hwaDRET1lJZXBBOWg0ZnpIbE95NUJvb3Zoa2llay9xTFU0?=
 =?utf-8?B?RHgyQnVBUlUxSjdyUlk1WGlFVVdFRUdNVmhWWVhhM09GRnpIcWFYU0g3dlVM?=
 =?utf-8?Q?61QLexk0eOMj+jC+QGn2a9TDd1SMZ+QSCOwy2pf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab3da4e-d4ba-4604-bf07-08d905a681d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 15:51:35.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lectmM80XmDjVJ/lg4fUUwO4vsq+8etMPz8UGERYG2tVYo9GlSpImt2Oum5Vn2DqG+5PEqnsGS8P1rGLVJT/R1H1NkNcf5XyUtOB1o2Wxf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 22/04/2021 16:42, Jan Beulich wrote:
> On 22.04.2021 17:28, Juergen Gross wrote:
>> On 22.04.21 17:23, Jan Beulich wrote:
>>> On 22.04.2021 17:17, Juergen Gross wrote:
>>>> On 22.04.21 17:16, Jan Beulich wrote:
>>>>> On 22.04.2021 17:10, Juergen Gross wrote:
>>>>>> Some features of Xen can be assumed to be always present, so add a
>>>>>> central check to verify this being true and remove the other checks.
>>>>>>
>>>>>> Juergen Gross (3):
>>>>>>     xen: check required Xen features
>>>>>>     xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv g=
uests
>>>>>>     xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guest=
s
>>>>> I wonder whether it's a good idea to infer feature presence from
>>>>> version numbers. If (at some point in the past) you had inferred
>>>>> gnttab v2 being available by version, this would have been broken
>>>>> by its availability becoming controllable by a command line option
>>>>> in Xen.
>>>> I'm testing the feature to be really present when booting and issue a
>>>> message if it is not there.
>>> And how does this help if the feature really isn't there yet other code
>>> assumes it is?
>> Did you look at the features I'm testing?
> I did, yes.
>
>> Those are really just low
>> level additions I can't imagine will ever be removed again.
> I don't expect them to be removed. But I don't think the people having
> contributed gnttab v2 expected any such for it, either.

The trainwreck around gnttab v2 is a mistake I hope we're never going to
make again.=C2=A0 I don't think it's a useful argument here.

The logic is fine.=C2=A0 It's checking for the actual features in the ABI
upon which Linux depends.

Sure - someone could modify Xen to take the feature out, but they'd get
a red wall in CI as they break every Linux kernel released in the past
decade.

~Andrew


