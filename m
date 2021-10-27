Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B207943C5EE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216752.376474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfemj-0000Pd-1H; Wed, 27 Oct 2021 08:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216752.376474; Wed, 27 Oct 2021 08:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfemi-0000Nn-Tj; Wed, 27 Oct 2021 08:59:48 +0000
Received: by outflank-mailman (input) for mailman id 216752;
 Wed, 27 Oct 2021 08:59:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ie0f=PP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfemh-0000Nh-KY
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 08:59:47 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b7aa846-3704-11ec-8457-12813bfff9fa;
 Wed, 27 Oct 2021 08:59:46 +0000 (UTC)
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
X-Inumbo-ID: 3b7aa846-3704-11ec-8457-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635325186;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cwB0P2NG5qga9grOdKtKddZH9tVmsVPUyX/H9XijgDk=;
  b=AoFko7xFVsinuVz0QiJSC7bx1dE0apOTLIgSnDoL3L7+y1WWYiMT2OVp
   W46jV4bKf+lDtkMULyZZVsvyQD+XY303Kpk1gfsX31Bk9ZHpDT6iMH2g5
   /ExIPlYKgfYoN/g3hI6lj6bZ5X0nqeGku4awnLXFCE3L6ir4EpvfHR9/G
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +weyhMNiRvdofmfxxBNgLI+0YDLjWy20B8eA3nI5XF7ZbYtRKwIi3gy6mjeGtfpimoDdnQZq0H
 F8q+m/mIbDfnnOtTrsfjwzlFSww/d+cuuhNEuzn2GDEd5xkrWf9CRSPhw2qcPWiSFD9Vf5Ivdk
 pntNmBibYvEAXqkk49XWJhQLhUvS9W5tBKN0TSuUtbJzXkFc4xBZHAiWgLL1ct/dAIZTQigbYq
 rEBEefc4NygalsqXYAQ+yKFk3JC1LOAHifbuiayW5Hntbgox4h7TSPNT/JEpYf3jZH/h8JMh9L
 eL2joUrwZLJ/EPum+oAGv6mF
X-SBRS: 5.1
X-MesageID: 56360092
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:x1rPqqpQa2CF4WuQp4zPHRIOrvNeBmJ8YxIvgKrLsJaIsI4StFCzt
 garIBnSPazcZ2HyLo13b9639kIOvJTXz9FjTQdq/y4xRHgV9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLmW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZaOVAsXIPfPotY6T0lAHQ5PLIpsyIaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0QRqiGP
 5tDAdZpRDXCajBJJm4VM5Zkg8X4uEmucDBZ73vA8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2Amlqtme3njS79QJgVFrCz6rhtmlL77msXBR4NXF23u86wjEKkRslfI
 EwZ/CkphaUq/UntRd74NzWiqX6ZulgHWtxfE8Uz8gTLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313r6SoSnoYXBNBWAHbC4ACwAC5rHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0AWhagXjMMN/7W2+xbAmT3Em3TSZldrvEONBDvjt14nIt7+D2C11bTFxfx+MYqnUAOCh
 kojh5iG4s8/HLanpBXYFY3hA4qVz/qCNTTdh3tmEJ8g6ymh9hafQGxA3N1tDBw2aphcKFcFd
 GeW4FkLvMYCYxNGeIcuO9rpY/nG25QMAjgMuhr8VdFJfoRqPDGO+CVjdCZ8NEi8zRByz8nT1
 XqdGPtA7Er264w7k1JapM9HiNfHIxzSI0uJHfgXKDz8iNKjiIa9E+ttDbd3RrlRAFm4iAvU6
 c1DEMCB1g9SVubzCgGOr9VOdw9RfSJjXMirwyCySgJlClA+cI3GI6SIqY7NhqQ/x/gF/gs21
 ijlMqOn9LYPrSKecljbApySQLjuQYx+vRoG0d8EZj6VN4wYSd/3ts83LsJvFZF+rbAL5aMkH
 pEtJpTbatwSG2uvxtjoRcSkxGCUXE/w3lzm0uvMSGVXQqOMsCSTpYC9Llq1rXBfZsd13ONny
 4CdOsrgacNrbyxpDdrMaeLpyFW0vHMHn/l1UVeOKd5WEHgAOqAwQ8AopvNoccwKNzvZwT6Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtLyDej8lCv6FA3JFDvg6yV
 h7d89VWI+zRasjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTV0X5TNrp4No8h0
 NwNgs9O5lztkAcuP/aHkjtQqzaGIEsfXvh1rZodGoLq1FYmkwkQfZzGBybqy5iTcNEQYFIyK
 zqZiaee1bRRwk3OLyg6GXTXhLcPgJ0PvFZBzUMYJkTPkd3A36dl0BpU+DUxbwJU0hQYjL4jZ
 jk1bxV4dfeU4jNlpMlfRGT9SQhOCSqQ9lH111ZUxnbSSFOlVzCVIWAwUQpXEJv1L46IkuBnw
 Yyl
IronPort-HdrOrdr: A9a23:vc77aa0U2Sxn9RAXhsiRiwqjBVRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YdT0EcMqyAMbEZt7eD3ODQKb9Jq7PrgcPY55av854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,186,1631592000"; 
   d="scan'208";a="56360092"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abw4Rl+Lbp6wD1/s3+F6abC904DpeO6GqZJHT0rwdjPWsXnw7Qp/6Em2KSQYr8mhqwB3HOoYmPTgdS9JlWGYnmY7WZVojdV1aBG49PxOGh7gp1Z6hQkavrvsyP6vx1xygLKODhL35EvkcVI1eM2BDM4tc9cVgqgscxosGGTmbzUyfeGbghw6uJ7e3djzGatSm32CPO8AFPipei4pMMIXNXSp0OtWmVTltzQlFHbxYkYCupdQeecvDR9cS6oEQDJKLDCl6pJyOXx+oULTHEjhFNM2aBf+M5jnuUzs8cMrvhblojxMRFYrLRehkJW9YHNSpVrAUGO9PHuYxzLoqWHAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyLAoVOwtWSbkeX/lFS/HhTqxZ8zHxWYYphy2V88xV8=;
 b=drTfHDhvk4Wk1VPxQZBtKw5/8W5Xp+pwD//aBb/Jvg/384iVqCQKKLCSA6ukxpOrmXjIj/3orTo5ekdrvLs4tlg15wDqadgp0/MUbqqSEnzA8xVIUCwT7kt4tQa7V8Z9JCW32adfhaoEOvTcm9lSIHYgnoUeglxn7T5R1MskL7OZmG9POem1z439tBqbku8LkXsUUV9zIJdilRJR7fud52KGPhdgh0cf6VS/e//df05ZK/8Uxr1yJn65RRYiQiH5lFJ0qKL6Lw7mWIkTudybxBk/4nGhypNwtoCpec3opD0YwLco3IJl/I1hJmSavc7MuupDGYZsHHY8ExR6j4/hSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyLAoVOwtWSbkeX/lFS/HhTqxZ8zHxWYYphy2V88xV8=;
 b=vgeRoPT9DdSQk3D+Dw73JbYIPyjevkIF1iv7EedRqb4kwjIZjYz2Jt6G1yHZsE4/6XsuTbisyRepxzQ8TAopSA4UxVQQKlXTVijNinC630YA/krrThLty4MoVGu8z24BDZkWJKfRosUCXRRJzUoq38B3MRIC4qKLbpnvZn+tBYs=
Date: Wed, 27 Oct 2021 10:59:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <iwj@xenproject.org>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Message-ID: <YXkU+DKYmvwo+kak@Air-de-Roger>
References: <20211027082533.1406015-1-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211027082533.1406015-1-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92feb97e-6e46-4272-4e88-08d999281c93
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR03MB34834BD40268AD68C8B555FB8F859@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VMVmldbQWgU3W0OldGs2JJISSnrDmqhhdHFEPYKpKj92sMWfewpc1Pc08LpjEPB1Z+MQy8hlAJ8wfJUo218bp4DY6ePxwhQEx8R00LUsrghfWpWc65TOpC8UDe2WUEy/cVvaWYzFbdAGnPoFUVvRSXi64f/pGA64T/lLSBZSoJ3Eu6GiEjGvwdV9Nb5BXJW4/HCJvR1ysksfuUUeSFHDPBGlmdOH3YcsTW077RkL673kCzeX5SgvSgZdeJtr8fVWasv2hQZuX00UmgXDc3zCNEvq3rT9xWqOhbXVoKdKwR7A5/O0BzUHkxh34yQHcIRDJ1yUBqnuJxRFJO+oV28mNfMKQqB/guxX5wEy3bFk0YHWuycHQ0JBmIJmkP3yhYdbe1MMBnP0LSiL3p+sWsX2oOv20iNiRqlgDqyNobcrpYCnZ3lpN3+4otcmaxXECT4ABE0mxjX0Au/UL9OwlJ3fLBffmjSIn1tcH6B672KyRaiNePbpxuBK8sJKhRoW8CVr+6k/pW4SoSAPmwZhggOKmvWEmjIhvspjYhkrEw5dsRaZr5XC/vrL+Ekri/K6T5mlHNmwQAkO8MdT6yVLA03gx7mhUGKSIhrFrwv+TbgOMXIlVAGiaQ8xoxbzzQ1bjh1PYeve/8LsneqZmaocw+jJqiEo31K6pofZhShCUPQBejZ/UjGUBGS63gJODvTmm177znKNPwWPFxEcNmC6SMsz/SNA/Vjwq7hAEbY34V65gM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(9686003)(6486002)(82960400001)(33716001)(8676002)(86362001)(83380400001)(66476007)(956004)(66556008)(66946007)(38100700002)(316002)(4326008)(6666004)(5660300002)(508600001)(966005)(8936002)(6916009)(6496006)(26005)(2906002)(186003)(4744005)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5EVVZURUlhZndDWVVXTjdnNVpIZ1JQeG5QZnQ2VnlHQlhrRXVJY2IwQWNB?=
 =?utf-8?B?WTlRSGJqUnRsNllLVXRIc2N4eitPK1hhcVArTHNjS1kvT25tMjBQSzJrL2sx?=
 =?utf-8?B?aVBiRWZCbUJRazhGeWR5YU9ORGdKdGNtTnRKaWRsdHR5OXFaS05FdVVEdm55?=
 =?utf-8?B?SG1nL0p5R2lwRFBpTXhFRXQvMitSaXZYRGFVVDUvZXhlS0lVK1g2d0JqdE1E?=
 =?utf-8?B?NHR1bS9nOXZLNjM1Y2tDb3V2RkJ5VWJFTXB6eUt1SlNabDJzR0hMSlh3ZGll?=
 =?utf-8?B?S3RxQTljN3dQWnlrbDNoQS9ySFBiWnB3S3F6NWVCcW9selpBSEU4MFBUZnZ2?=
 =?utf-8?B?UDdIUi9lQ3FOYW1NZmh5RVhkZG9ZRkhYeHpCclBvYjN5MkJ6T2FUdGhYSmJm?=
 =?utf-8?B?TWx6NVNkUUxLdjhQb0tnY1RmNWwxSnRMeUd2RnRORWVzL056N0hUNG9PTGcx?=
 =?utf-8?B?cWNORHJBbnp6T0pNMStNekxFMWJ5ZGlYRElpOEhOZlBTM0FMR3RMYVlXaUN6?=
 =?utf-8?B?ZU5qQjlMVmNpamNNOHlTN3Z5SFRqRWZUYjNCNGVoL3VkdDljQ1FGTnhnS1ZF?=
 =?utf-8?B?VE1wQnBpRWsxRE9ocGhic29kMUdhamhtOW5DSU10eTJZSXVNakFZb2Zyenp6?=
 =?utf-8?B?SDFoZytZVnV3QzhqMGRmY21LQkdqV3hHMU5Yb3Z3N3RpZHBpUnNKRk1IZ1BU?=
 =?utf-8?B?QXlPRnE3S0ZpczZJcDQzTzFWV1FIdTgrdlN0ZDhDV09aOHJ0SUFTYVpTNWgw?=
 =?utf-8?B?ekdiMXU5RFpLTk9VVk95NjE3NllvQ1FEYWVybldVb2owcitnRzYrY2daQVZa?=
 =?utf-8?B?aXFpdnNwS0tzSEZiUnJwczV1d0FTYUcvcWFDY1FjNGZWdkJRdnhwbHJhcFI0?=
 =?utf-8?B?cFJBeGVORVNMc3ZtektuS29xcmRtbkFNakszWHpCKzM1U3kzTUxHSDArRVlx?=
 =?utf-8?B?QWRLTGxYSEx3bm1ndnFJOFdpaS9PL1FzZitpOFZLak15eHNnZ0ZTeWFXQ2Ju?=
 =?utf-8?B?TE5FeUUvemVBaStvMDJmbXQvV2J4NDcwYXFlZnZiSVkvYm10bU1sVjVmanp4?=
 =?utf-8?B?Q0VtM1p2VEpCSUZHMkZkRUhEM1kxSDAxazFiWFUzSlFVaHhITmpEQTlENVp2?=
 =?utf-8?B?b1ZVb0x3T0VSVkYzQVpYN2NMTHFKc0EvaWZXZGQ3OUtlK3hOUVRSN3FBT0x0?=
 =?utf-8?B?U1FSS0l6eElNUW9EZ2daRVJmdGdqVUE5eFMyMGs1MEt4WTV1MkE2WkZBcGRZ?=
 =?utf-8?B?KytEY3k0VVNna3YrbzQ3cGg5K1NTWUc4STZCeGd2dEM1S2grSHdUdHFBWVFj?=
 =?utf-8?B?NEVjc1RtNldpSDZvZk1VQU45YVJYYU50MlBFVnJIMnd3OXg3cmd1NnN5S3VF?=
 =?utf-8?B?eE05ZWczVHF1Sk9zeFRHRUxPYWFOUGJYdjU5RURENnRZalUzbDJZaDFVdEFZ?=
 =?utf-8?B?YTlxS1FQWjV1WkZIeWhMK2sveUFqZEFhemh6Qy9nd3lkQUZuWHFBeGJ2U3hR?=
 =?utf-8?B?Z2NSWlBhWkw3ZVNqekZKemlPV1dqWnNOcXB3WWpDYW1BVFJWZVhZa3hOWmo0?=
 =?utf-8?B?S1BRand5M1F3TUxxaXBYYUdkZTVrc2FUQmxDdGFjNVFuTGx3L2xZWUtOWW9V?=
 =?utf-8?B?WStKbEQ2bTJrNnZwcStlVmc2eE12M0lKdFVubmVERGVzbW01RXBTcTBRa0pw?=
 =?utf-8?B?dDY3N3FmYWE0NXl2OEo1YnRRZHB2RFVhUmV6WEpjTnNWZlk1WGJ6NlFCQ0tM?=
 =?utf-8?B?WFVENXk0Wm5nS2pmZ1F5OEFleW55cU5XdDN6SDRXamI3RWFqNU9TZldYZHFB?=
 =?utf-8?B?dkRrWlNOVG0zeDZwbzVxNUl3cHNyakc3OEtVbnhkdnZ4UXNJN2dtKzJYOXE5?=
 =?utf-8?B?NjNzT1NRNHFzR3VlRGV2WDJ6VVRTMXhTek1hdXlDcVBYNGRJK1l6WkNBN0Zj?=
 =?utf-8?B?T1k3b2FZNW1wLzh4K2dldXllcjFscytvczJSZVI3TFJIZVNYN3ZwbUh1VldF?=
 =?utf-8?B?dFRRcGRXWkdqcDFYeDVoeWNlMkZ2aldlc0lKaFhZTWwxTm81VVRIbnBteUVW?=
 =?utf-8?B?NjFaZVkvaVFnSGtBeVhPZUhzZ1BVcmxkYks3c0ExOXVXc0llV0xJbXc4ZEls?=
 =?utf-8?B?ZWlwOGJiWTliTER4eEFNcTZaNXNJY01OMFNCdEkvNFdTWkJDbWJobm1tSUhO?=
 =?utf-8?Q?1LgV9ohZR4j4/l8FrgSzQ5Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92feb97e-6e46-4272-4e88-08d999281c93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 08:59:40.7540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMsArLIimJrudyiwvT3ZrmmgLEQ8XoPnnjNEIBOjPRNHkXWaXVuYzihlUl0czVvu/8aCv/IRv7i1flhepuIfYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

On Wed, Oct 27, 2021 at 11:25:33AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
> the base address may not be aligned in the way that the translation
> always work.

I think I've already raised this during review [0]. But this is only a
problem if you change the current value of GUEST_VPCI_ECAM_BASE
AFAICT, as the current value has bits [0,27] clear.

I assume this is a problem for the hardware domain that needs to trap
random base addresses as present on hardware, but that code hasn't
been committed yet.

If that's indeed the case, please expand the commit message to contain
this information.

Thanks, Roger.

[0] https://lore.kernel.org/xen-devel/YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local/

