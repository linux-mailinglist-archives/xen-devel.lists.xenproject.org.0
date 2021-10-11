Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31604294B6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206364.361920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyPL-0001Nt-GV; Mon, 11 Oct 2021 16:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206364.361920; Mon, 11 Oct 2021 16:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyPL-0001L4-Cw; Mon, 11 Oct 2021 16:44:11 +0000
Received: by outflank-mailman (input) for mailman id 206364;
 Mon, 11 Oct 2021 16:44:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZyPJ-0001Kx-Mw
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:44:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 729d3b9e-2ab2-11ec-80ec-12813bfff9fa;
 Mon, 11 Oct 2021 16:44:07 +0000 (UTC)
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
X-Inumbo-ID: 729d3b9e-2ab2-11ec-80ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633970648;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=S1rqXYZaV7pXDs7iPThz9xdfs2if+0NebwX/ly+B9RQ=;
  b=FaXdtduqcLszvM5fsflIbS/9mOr+7LOeBVKsB0AKE6XJCcz7nXqBn5fE
   4osM54Qt/GPmOj4vOfs1q7nPMRTrnvNpeOEFqNqMZGIGw04KPaqkwWkhl
   VsifOuu8OUk9esI/6nkSnXD9v9kNxqZLbVCCh1nCAHWZQbkiF0KRCnny7
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Uc0RzrxFljNSYCxXd3d5oHrvpqj0EXOlvvaAtICyxGWtcC5HiVpcgK7k/EluwhrkI0tgw2H1o/
 9J94r6D7wTMxC3w4y/Zn5OI9K6S4w2cozm7YKDTyAXUJmEuWQrQiXkE+3kyHJZOUmpZRqR2LtR
 XY8uKkQej6wnskHuXmKuhkQ21JyB28mnZQBi8BQ/MdnX+7dlYkpYbiaCnZJ5HguSOaIXLdX1gu
 T+JUZhhfU5ksCVI/5AjIPuGF3tRtZh17hsMlXA2QYiy0S5jFpmIgpLCw4/GJI6McUr9pb9eNIl
 vpJ342fBIMIoy8PXqhC0jeba
X-SBRS: 5.1
X-MesageID: 54475770
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tF52N6xstDID7290f9Z6t+cfwCrEfRIJ4+MujC+fZmUNrF6WrkVTm
 GtLWTqCbKmCZ2Gne4t/bY+ypE9X75/SmoBjQApo+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/xd0
 dlNkYezcxp3NKKcsr4ZeDVWEz4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIEgGht2Z8WdRrYT
 8MERhpGUwzqWjdGEWkvUbYOzcSEhHaqJlW0r3rK/PFqsgA/1jdZ0afvGMrYfMSQQsdYlVreo
 XjJl0zHBRUdOM2a2CCy2Humje/Sngv2QIsXUra/85ZCgkCXx2EVIA0bUx28u/bRola3RtZ3O
 0ESvC00osAa60iDXtT7GRqirxasvBQRRt5RGO0S8xyWx+zf5APxLnINTiNFLscnssA2bTUw0
 xmCmNaBLTZiqqGPQHSRsLKdtyqvODM9JHUHIyQDSGMtxN3uo5o6iB7Vef9lHLSold3+GTz2w
 DeioTA3gvMYistj/76g4VnNjjaop57IZg04/APaWiSi9AwRTKeja5alr2DB/+dfJZyQZlCbu
 T4PnM32xPADC9SBmTKARM0JHaq1/LCVPTvEm1ltEpI9sTO39BaekZt4uW8kYh0za4BdJGGvM
 BS7VR5tCIF7EFezYa9TeIGLFpogwvjKT9DOev7UcY8bCnRuTzOv8CZrbE+W+mnilkkwjK0yU
 aumndaQ4WUyUvs/kmLnLwsJ+fpynHpmnDKMLXzu503/ieL2WZKDdVsS3LJihMgC56SYvB6dz
 d9bM8abo/m0eLyjOneJmWL/wFZjEJTaOXwUg5AHHgJgClA/cI3ENxM36el8E2CCt/4E/tokB
 lnnBidlJKPX3BUr0zmiZHF5c6/IVp1it389NiFEFQ/2gCNzMN7wtf5DKcBfkVwbGApLlqQco
 x4tIZToPxiyYm6fp2R1gWfV/eSOiyhHdSrRZnH4MVDTjrZrRhDT+8+MQ+cc3HJmM8ZDjuNn+
 +fI/lqCGfIrHl0+ZO6LOKPH5w7g5hA1xbMtN3Yk1/EOIS0ABqAxcHev5hL2SulRQSj+Ksyyj
 l7MX0hD/7WR+ufYMrDh3Mi5kmtgKMMndmJyFGjH97emcy7c+2uo24hbV+iUOzvaUQvJFG+KO
 Y25Ftnwb68KmkhkqY15H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Op44JwW5gWzhwAEKNGDiiwIpW2AImZZC/cst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP3u0OyFDDfnw/EWn28dBc3Zle6gpXyFIiJkiSnoaXjPEAwxAMoy88SR5Yz0sb3rsra
 HRrLUB8OY6H4yxs2JpYR2mpFgxMWE+Z90j2xwdbnWHVVRD1BGnELWl7MueR5kEJtWlbe2EDr
 r2fzW/kVxfsfd3wgXRuCRI09aS7QIwj7BDGleCmA9+BTsszbjfSi6OzYXYF9kn8CsQriUyb/
 eRn8Y6cs0Eg2fL8d0HjN7Sn6A==
IronPort-HdrOrdr: A9a23:LGL4B6HOdvQyLhTNpLqFeZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nI/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Svl
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DPeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Np+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTf003MwmM29yUkqp+1WGmLeXLzAO91a9MwY/U/WuontrdCsT9Tpe+CQd9k1wva7VBaM0od
 gtn8xT5cVzp/QtHNBA7dE6ML2K41z2MGHx2V2pUCHa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54475770"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux8R6Uei7JwkAhafTcpWgmp6w4ScKoCTT9EUn8N2z1AScJLO9oyaj/CbubasLc58HR5vGHLjUV85vJZsUgRK2Bl1E9Xdi9DAgh0H+MWWlrturFhMPqhyfYlB1q8VN7jXpPq6pAUFSOEmX1kDUuoBrcmW32kmnNVt2cDuHeYGlFLjKocb49B47Zy7O2Cqu3Pt8EeinU2uH0ruFqMSpDQyeTWzn1HS/dP2HC7QeXjVq9YMBTDk4UvU3nfkWwIJ2P769HsRw+Xc1i7O4cd2Jtn7ZsGgZzVSUAeU0LP8QNNsjOF+91eAE+BU3TyaayPpGFBJHy4hx8oQh2bvN3LAM4ox9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0deLUC8u2RvmRqtUeggx4LBst74D/t8DUDFCiI4AcCs=;
 b=N7fm8dSztivW0wunJntsWjqKJZWtAM2XxET048Lj3RL654zyy9iXmpO/s/rdnEpo7laX+/mBzN18IK+DcXMtmLHnfZx/Z4lGrmmSqpnb1P+SPo8XNIDhQvM/0BuP59ikyKffjtx77HfKMqtLZJikgup9YDQr2k95/RnxQz+TNSl1k1v5zhZR3wLy2Ljz1Zome3ouFJC3sKZW8vYPodbxTXT4RtgIYPaU42iSYPe8vPvfGb2FxAXp7kohaCHjemB7dKbHDtohJudiH0sJzhzBHenunVczci9bVn99flwC8bLJCVGQqfaL6+4IaRWq5qilxMV3lTjqFoOFZUxBelJ6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0deLUC8u2RvmRqtUeggx4LBst74D/t8DUDFCiI4AcCs=;
 b=Y+Bv7FFPgwLYDrIGVYeTRs9YknEzf5cK8SSouQx6+V/5xKl1iDbQsg8sTAssPdgMw7NrmZIBg4Qk3jif8/CXW1gMaaVC/RlciFouJ2Cy715miXb/BFsNXZhCT98HS+BicUfCtj407Dx+BWueq5so1PS/BE6nmrQRZS9Z01OXkQk=
Date: Mon, 11 Oct 2021 18:43:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWRpuUtHkyA4RY5H@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
 <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
 <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
X-ClientProxiedBy: LO2P265CA0242.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53d4dbd9-43d6-4338-ab94-08d98cd64902
X-MS-TrafficTypeDiagnostic: DM5PR03MB3212:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32122C45B08030E6742F13368FB59@DM5PR03MB3212.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhRj3SqCXZf2YJ9MUZmm/q4IkUvd/psPHp4hKViSqRlpwihhF0R3nJytd5HlWHnjHdHnC4qZeML2ZdqnkKaeSN+ipmlT98krBBCD1Htt/6b0uwzKn+EM46ipEcL3XQ+52Pp844d0/Dp7TYuObuoqptF2BfWEjeWspyYUhzl4P97GMm+lXltg3ydOrvaxXK5Exs+X9l9U2cuvswpmFKORVI5bi9OX15KokURcPBPURja830mrfAPJcp0scbY0O0TvGnPoZ93281CJoL7du+yKhsmRp+9mbOhaEfz0jfrhhAgSuG0wAb4mTOoBXyLglHzgZAFYIG1V4ajV8hzZALyTt4d2E4+u4EjpchAXfhM9oNhHykJ1PrGkPsmoDw9zYGgrTB7rrwKVPzRSfCVE/CjGEQr4bx5/b0dM2EwbZdd8lgM7YWFq3C/AxZmCez43nM941a0sdRKEGKLhdJ1zjfdoKzLV/CHuBN0HusIwk04qoWyZDU1P1uBoQB8SZBIXIuxQzRDo/zavxQBXxbpEq9pBkWirfVD+Zy0DOr/0oQYii2i02IvFYlieYNtCvlKSm9FkaHCBZU1LSmBp65JbGUKDluq6Ie4xllSzYmvayno4KEfDrfSDKu641vynSo0MUWakwPiUFqXg1al53gUjYeTVag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(66556008)(66476007)(86362001)(53546011)(508600001)(5660300002)(8936002)(66946007)(8676002)(7416002)(4326008)(6916009)(2906002)(38100700002)(186003)(83380400001)(316002)(54906003)(6666004)(956004)(9686003)(6486002)(26005)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJxcGVNcml2SXdqcXVuVkc4QTBkM2daREUxOXdqWmxNWjdEblQvRFFrakFZ?=
 =?utf-8?B?VmpCMy9UcnFOMFlNWm15akxWcFlDNWxMK3ZZd3Y2MHlsMVJvT09pbzYrMnlI?=
 =?utf-8?B?N3RpYkdPemQ3RVJiRXcwY0xFRW0wSFJmeks4bmdvUE1FWEl6anhRRTB0UmVo?=
 =?utf-8?B?UHdCY3dIZHUzcmxBK0JUWjNWaUI2NEhKTzQzZHllV2NPMFNDK0gwbGhYWGFC?=
 =?utf-8?B?eTlLL21PQ0M1WFdVZFJzV2hRL3dhWjhLZktxam90b293dEMwUDBncy9qeE5x?=
 =?utf-8?B?VjByMUNGVVNEOWMvQXlPSHZ4cjlyVm9UV01PcWdLK1NsemtFa3A5M2tFRGtP?=
 =?utf-8?B?QU0zZUJFN1RHWTFuSi9YaVJmWnp3c0w0OXd4b1JnUmxRMXdHaTd0bjdDVGhq?=
 =?utf-8?B?S0NLS1A3Z3ZZbEo0eEdmQUcxdktZM1FPMU9wVHZEWFYyTlFEcWhmNnlEZHBO?=
 =?utf-8?B?bHRNSDVsU21TZlUxYllTQ1QvL3E4VXhtY0ppSWJtRkg3bnI2ZXUwamlTL3VW?=
 =?utf-8?B?U0NodGovWGxjajRyN3lPQ3gyKzdxZ1dQMEFpSEpPZHVNVVpZL1NZbXZ2QVhp?=
 =?utf-8?B?elJqYmJSQ0R2Z1VGVnNtL0RBNUNkTzJxNGR0VjQwTjZvc1YzQTVYclpMUzdo?=
 =?utf-8?B?bG5Sd1dUdHE5S1NJZ2xpN205MkpFdTB6WXNzMW55MEtFcEw4RXpWZDJjWW1m?=
 =?utf-8?B?T3dYUE9UME9ZN2lEUmNhQmV4UlFMRDdWRm45cnIxQTZ1dUZqSFlvZGJYdEh5?=
 =?utf-8?B?RW4wSDVERHV1TEpjWnRZZk1mU1VqMlBTV2RyMklIRmpPYStoM3BkNU9CSkpO?=
 =?utf-8?B?ZFJlc2VFNlhobFpJTFM1dktQandPdFI3cURobEMxZmJXOS9ibk1BNWl0Uyt2?=
 =?utf-8?B?VjlnQU5vdVROMmxrYTdtR1ovblg0dGVkL1FrbmtEdmgwVExRajhXOFo5TVVp?=
 =?utf-8?B?TThYclNWbnBiMHJZd3R1U1d0TGx6SUsyYnR5cVZRejQ2SDlaVjhiMmVrVG82?=
 =?utf-8?B?alBrZHE3M0Y0ZmxRQlJwcVZRQVNYN3M2cmJGS3Q4Z1k0b29GSEZlM0tzZWpp?=
 =?utf-8?B?bDBKS213YmtTdDJxVTUzUXB6aEpvVXo0dW1pTG5SUDdXcTR3cGlWOFlYSGlR?=
 =?utf-8?B?YjM3dGZSZG5mMTEveHBYY2hFMlVUbGppaHN6cGcxRTd4NFVJRFJxZzhYOGNo?=
 =?utf-8?B?aGxXbXlTSWtYMlE4WXdEWU91eVhLQ0U1QXFsb2gyWDhOMlh0VU1sYlhRblZT?=
 =?utf-8?B?VkFVYWFUSkZVWTdIN1dmZWVUQ1dkaHJ5akZVOHJ1WnJmWEcxZ01pdk9HTkFH?=
 =?utf-8?B?M0s4emR1STcxZnV6OUhkZS9PekdUR1ZxcURQbTNqQnVObGJTbjVxMzdSR2Y1?=
 =?utf-8?B?VEFOQjFwWmpqbjhtWDdNbmxkSm5vQWpvOERWVmZVZS9hUzBCNlBYaTRORnZ4?=
 =?utf-8?B?ZEhDeG95TGRNak50Skl3akdlRWovV3FXbUJ3TDc0cGliUEYwZlVuY3dJaUpy?=
 =?utf-8?B?em1lckN3UXNkYTJvblRoRGRoR01QWE84WUxkT1plMkE4YTJicmtob2VRRFVH?=
 =?utf-8?B?cU5FK3hHemxvZEYvMkJkNmd5Q09aWVo3eERtbTJvOGxsb3Y3NWhhL1NDT3Rn?=
 =?utf-8?B?OUdFYklDYkFYMjVXYTE2R0Vlb2JTamFBTXpYTDFCSXQ2STFlczMybFNUWEVh?=
 =?utf-8?B?aGVmN0l3TjJZTHQyWEVnSkN4R0h2ZW1xVHoxdkY5VHlvbGtMQ1diMWRyZm9C?=
 =?utf-8?Q?kIIAZu2J8zcSRzBbeLS3vaHXJgOzQ5umKJMouJc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d4dbd9-43d6-4338-ab94-08d98cd64902
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 16:43:42.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdUH7G62Mx8xjyZ0rNFMZr7qjGCxC7CkfyKh2BGNmvmlj/lJO+bV2kGHhuhF23XlS5jgrQHy+eZDPtFU0dbJ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3212
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 04:20:14PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 11.10.21 19:12, Bertrand Marquis wrote:
> > Hi Roger,
> >
> >> On 11 Oct 2021, at 11:51, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>
> >> On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
> >>> The existing VPCI support available for X86 is adapted for Arm.
> >>> When the device is added to XEN via the hyper call
> >>> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> >>> access is added to the Xen to emulate the PCI devices config space.
> >>>
> >>> A MMIO trap handler for the PCI ECAM space is registered in XEN
> >>> so that when guest is trying to access the PCI config space,XEN
> >>> will trap the access and emulate read/write using the VPCI and
> >>> not the real PCI hardware.
> >>>
> >>> For Dom0less systems scan_pci_devices() would be used to discover the
> >>> PCI device in XEN and VPCI handler will be added during XEN boots.
> >>>
> >>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>> ---
> >>> Change in v5:
> >>> - Add pci_cleanup_msi(pdev) in cleanup part.
> >>> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>> Change in v4:
> >>> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
> >>> Change in v3:
> >>> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
> >>> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
> >>> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
> >>> Change in v2:
> >>> - Add new XEN_DOMCTL_CDF_vpci flag
> >>> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> >>> - enable vpci support when pci-passthough option is enabled.
> >>> ---
> >>> ---
> >>> xen/arch/arm/Makefile         |   1 +
> >>> xen/arch/arm/domain.c         |   4 ++
> >>> xen/arch/arm/domain_build.c   |   3 +
> >>> xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
> >>> xen/arch/arm/vpci.h           |  36 ++++++++++++
> >>> xen/drivers/passthrough/pci.c |  18 ++++++
> >>> xen/include/asm-arm/domain.h  |   7 ++-
> >>> xen/include/asm-x86/pci.h     |   2 -
> >>> xen/include/public/arch-arm.h |   7 +++
> >>> xen/include/xen/pci.h         |   2 +
> >>> 10 files changed, 179 insertions(+), 3 deletions(-)
> >>> create mode 100644 xen/arch/arm/vpci.c
> >>> create mode 100644 xen/arch/arm/vpci.h
> >>>
> >>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> >>> index 44d7cc81fa..fb9c976ea2 100644
> >>> --- a/xen/arch/arm/Makefile
> >>> +++ b/xen/arch/arm/Makefile
> >>> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
> >>> obj-y += platforms/
> >>> endif
> >>> obj-$(CONFIG_TEE) += tee/
> >>> +obj-$(CONFIG_HAS_VPCI) += vpci.o
> >>>
> >>> obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> >>> obj-y += bootfdt.init.o
> >>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> >>> index 36138c1b2e..fbb52f78f1 100644
> >>> --- a/xen/arch/arm/domain.c
> >>> +++ b/xen/arch/arm/domain.c
> >>> @@ -39,6 +39,7 @@
> >>> #include <asm/vgic.h>
> >>> #include <asm/vtimer.h>
> >>>
> >>> +#include "vpci.h"
> >>> #include "vuart.h"
> >>>
> >>> DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> >>> @@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
> >>>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
> >>>          goto fail;
> >>>
> >>> +    if ( (rc = domain_vpci_init(d)) != 0 )
> >>> +        goto fail;
> >>> +
> >>>      return 0;
> >>>
> >>> fail:
> >>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >>> index c5afbe2e05..f4c89bde8c 100644
> >>> --- a/xen/arch/arm/domain_build.c
> >>> +++ b/xen/arch/arm/domain_build.c
> >>> @@ -3053,6 +3053,9 @@ void __init create_dom0(void)
> >>>      if ( iommu_enabled )
> >>>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> >>>
> >>> +    if ( is_pci_passthrough_enabled() )
> >>> +        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
> >> I think I'm confused with this. You seem to enable vPCI for dom0, but
> >> then domain_vpci_init will setup traps for the guest virtual ECAM
> >> layout, not the native one that dom0 will be using.
> > I think after the last discussions, it was decided to also installed the vpci
> > handler for dom0. I will have to look into this and come back to you.
> > @Oleksandr: Could you comment on this.
> Yes, we do trap Dom0 as well. The Dom0 traps are not in this series, but
> are in mine as it needs more preparatory work for that. Please see [1]

Then I don't think we should set XEN_DOMCTL_CDF_vpci for dom0 here, it
should instead be done in the patch where dom0 support is introduced.

Thanks, Roger.

