Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278441455D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192347.342757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyjI-0004XZ-Lc; Wed, 22 Sep 2021 09:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192347.342757; Wed, 22 Sep 2021 09:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyjI-0004Vb-Gc; Wed, 22 Sep 2021 09:39:52 +0000
Received: by outflank-mailman (input) for mailman id 192347;
 Wed, 22 Sep 2021 09:39:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSyjH-0004VU-9P
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:39:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07ddc50e-1b89-11ec-b967-12813bfff9fa;
 Wed, 22 Sep 2021 09:39:50 +0000 (UTC)
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
X-Inumbo-ID: 07ddc50e-1b89-11ec-b967-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632303590;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YZ8XIk1xLeJgTDygBaqUKPKxiFz8heo81bQbMKjtE9A=;
  b=ULymdDaeWiNrvz2DRoF/unCYYAy1zzOACO+fb0C8EmUVFseYgdJcRcES
   X2Acu4mzuraPwyqI3TyLycTUbGYPRdgcM+3pVP29BUaZoLAt6Ky9peoWK
   YubvbhviMhWpVzkRfm9aGclgrgYJDzULoPovN4l+9dE7wLWYeFwSTueKp
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gNbAAjBzSZGq6moPtCGhU/hv+LACriVyTNtOFM0ork1gE+3JFazuSbT2p/W2C3/g+PRLELUcqc
 pWBtZWx9u5hJcM4enKBFdiJRkjoaG6uU4s7zV9WnEhxqvRofOFd3X9fs+DPpQK+AhKN/Ni3aOX
 f0EyMwKqDf2OBW9jSD1fNmJHfGFmZHe1KjWEaDp9unXrF4JHfMbIL8OOwnn3ysGvizo9U6WHCx
 2MUTijz59gB6t/jvX4Ud6R4FjHcHks+y1C28uIGN00rQFOWcVMHByqOSq4cmV3/9v0MOGV145Q
 35G1ovQixXNrx2cgUYnnbzDu
X-SBRS: 5.1
X-MesageID: 55105924
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:loEdNK3q2uuTYofJwPbD5UN2kn2cJEfYwER7XKvMYLTBsI5bp2cFm
 mdJXWnUaf+CM2b8edhyPIqz8k0A68fQmNExSFA9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbRh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhsdtQ8
 8hJksGKTQ4oJbLCg9gbTDNEKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIIBhGph3Jwm8fD2R
 swEKgpQaAz7YhR3JmgQBbwimdermSyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcLwVELq05/t7mmq5z2YYCAAVfVajqPz/gUm7M/pTI
 lIZ0jAjpq8z8AqsVNaVdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDQcbSSMV7t+lp5s85jrOUdRLAKOzlsfyGzz73
 3aNtidWulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdkyuzzhkYKn4XYih6EPE4+18KpmzUmDU6
 RDohPOiAPAy4YClzXLWGrxdQu3xvp5pIxWH3gU+RMBJGyCFvif5JNEOumkWyFJBb55cEQIFd
 nM/ru+4CHV7B3KscaY/SIa4Ec1CIUPIRIm9C6y8gjajZPFMmO67EMNGPhX4M4PFyhFEfUQD1
 XCzK53EMJriIf47pAdavs9EuVPR+szb+V4/uLihl0j3uVZhWJJlYehcawbfBgzIxIiFvB/U4
 75iCid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3yyfdVrSNSA9N9sCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nEVwrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:WGP6AK81V2atH8K48Tluk+FFdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICOgqTM2ftWzd2VdAQ7sSiLcKrweQfxEWs9QtqZ
 uIEJIOeeEYb2IK9foSiTPQe71LrajlgcLY9ds2jU0dNj2CA5sQkTuRYTzra3GeKjM2YqbQQ/
 Gnl7V6TnebCDkqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPgf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0a2SwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7RvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WTAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 hT5fnnlbRrmG6hHjXkVjEF+q3pYp1zJGbJfqE6gL3X79AM90oJiHfxx6Qk7z49HdwGOt95D0
 mtCNUdqFh0dL5lUUtKPpZ2fSKGMB2/ffvyChPmHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="55105924"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP2W6kWAGwDLtfe5vJF91gcaRT7AKb5l1C8/7czTI7wl9NzLjItF9mUkhc1fTWxQ732tgXymhrrVlGrPojatXuwdPHDpvwKxH5Gb5f9baZViFJEfbvXFJmIKYx+feoPX/3lQ4C6asnBCEnx9TYZc78PFADk33l6INY2WBZUg8QH4t9Wo7DIKmpxnDGLZvzrTzOw5hD6CuAHq+cszW0BOoXohaqWojfp0M90/QTySzN7+jTlTlQn2GBicBOwzn1Ek2toVyEQiFnx+sNKcLVadVLKpgTr9LqDfQDCcdDru3mD3LCnKufNN1T/xz0p7NFjfV90ERMR+oAqDCTjCzxd1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=r8QtknsmFgI2Z4VWUMIkPMcE5YErKEETJsYi0arvGUg=;
 b=L6oq8zmw4XFnZg6xoIh75xLUqRWNYolnBHVNNxBK77W+jI1yElEau52qflKY1LpJd/3mmqxfc8uqwOYuO5zcgvgdKS/N2/clR8zhSN6RuSKrROEp3kFkBfvuznd2IkpxV2kJ1msxcmsP7PVIxQDkoy3yMXGwpYRFXio498AxSO2sHnxJdkI+A2snJCTa1aUO+73ji3Q1Qswno9uM3kasw82lFGz/P+cUecfcxbBE7ebG5IRwFqTEvc3VRglY6W24i/xs/SGlNS4OvHmKxyzcSCd4TqZP5IFdPI8dVX9AJ38RkpRW012UeCXz3rElNzGwkB+018+lF3Nog0enBu8Nwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8QtknsmFgI2Z4VWUMIkPMcE5YErKEETJsYi0arvGUg=;
 b=s92CEFzXd1ATy1APTQCgl3KbrHXaELGrYKhOtKk/Oaz+LmnM+bFc5TH4eel5qoW9IRvLv4c/vkvtsdzEL+ZH/VeIFNvzcHd0IeDU+N9zTEPTPBqcY6vIDq4ZA75Nh9KQKLBEdJtlNoHLoll1pbUYsHVgnAHQuIdTHSTM4YurJZI=
Date: Wed, 22 Sep 2021 11:39:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
Message-ID: <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
X-ClientProxiedBy: LO4P123CA0274.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5d0ff64-de66-4d83-8544-08d97dace89b
X-MS-TrafficTypeDiagnostic: DS7PR03MB5526:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5526752AE53D58D9D35639258FA29@DS7PR03MB5526.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPjtgZgAotRegQ5dJ1nhuVmX78/sex5qrS96TUcg37qjaS5o4W8atXSCMuERhrKzHmPpAa+zqZMGZ93BHOr2DU1KXdGeZKjw2pVOeFvxiokF7KF3Q/z8rTmRXDsZ6gnijaUm6neAXmmM5kevRa/ccrwVQaUdysiJZ7PFoNSnAquzjJN7FZaYjTDGz1XpUHUjIQI+XLPc7r8wTgD5hiSeNyw3JHYlRV4JGzz/cZbNz3ytLkMLlPckiVVyWRLXbA9hS+SREu9BMNIm33e5dcSEyNK9ebVlG7kx+fxQcBFtF1LSlUZpNdmkIZ0NnpZRyW6a06uo5GQCJ2fu1EMsuEinmiWIVLn/urU/ZyLRYQdBMfTnxL8frR5vZu1O7mHsXw2bIWfGnKxmJkNOk6WgG+YrMpRNb6ux1gBaZSjf2JXAE4j94uoZ+OGEbts+xXFec0Vvv6ZqseyK5tvZyMfvXOpT1Pn+bQfBuixtnvkztiFOeCajgGErVQd2AtaclVssiwI6xRZQb9BS5+48VhpMNtCG0xZ1lWQbkhkG7J7kBYam+FwJ8xuIEGmYKx6KABr8NovOwESlcC5GBzlUpMPqz60iN8tykaL5zQOCS+9FrSAv5SmiDyoJLL6u8KDt8GiIv+jksuAKoT2go9YUL0Sh5cKzNaNWIDLoOWBsudWhfX4AsRy9XLQFAykn/Z8m83NCQGtm9h+nwIu5Y6yjs1h71Y/meIDjBq2a/lITWSkaS8oK3uU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(9686003)(966005)(186003)(8936002)(4326008)(66946007)(38100700002)(2906002)(54906003)(66476007)(508600001)(5660300002)(6666004)(6496006)(66556008)(8676002)(53546011)(316002)(86362001)(956004)(83380400001)(26005)(6916009)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWd6UUR4dUhjVUo1SXRSSzB3cmI0YzdZQ1MrZU1RVlorS2xLWWFuOFVDYjA1?=
 =?utf-8?B?cnduTTRaemczVGhyRzg4UGFaOUlzRlhsTkJIa0s3b3RTWGdnOGJxVTBkTHpK?=
 =?utf-8?B?ZHM2VnoybW1NNXRHU1RKeitnaFQ5UUwyUmFqaEtkVCtqSEJNOGN2d01zSm9N?=
 =?utf-8?B?RjVpa1VneWh1aVlCMkNaUkYySFNFdk91Nzg4Z2RzMUlHaDNrNk5JczUrVGxU?=
 =?utf-8?B?VlJQVUt2MkxJWm9VdmN1S256a2QxeEtybTl3TTFuTlJhQ3ZJeWx4M0QxbW1i?=
 =?utf-8?B?UGhBckp6dlBWNEFqMTAxYk80VVBaWlU0N21BeTFKV1pLVDNhQVd5L00vakE0?=
 =?utf-8?B?NHBHQTh0Y1RDRkVNRldJeWJITWFCM0YvVk9sODhrSnZJMEpqRFZOZExwc1du?=
 =?utf-8?B?TU5ZMnZlbnl1RUR6UEdPR0MzN09iSmNjbTRGNGZNaVh2K0h5S0ZkMFkzeFJr?=
 =?utf-8?B?aGQ1SUtiNno5bFcvdVdDVkh2OWx3bjhwRE9YWitBOUE1QktXK2V3Q2JWL1lK?=
 =?utf-8?B?OWlCSmVMNlMyVVd0STZWTytvZ09ZREVlSXZYdU83TU52cXI4em9BUWs2clJ1?=
 =?utf-8?B?R0V2QTRRL21pdkJYUFdNSFd0cjBmOWhzTFYxbDFJNVFwbG1aUDhHaUMzNDRH?=
 =?utf-8?B?d3gwc2ZNZHpPLzhyS3dJbnJVMXE3Y3RNSXpwTmROb1FqN1VCOS9ycDN3dDJN?=
 =?utf-8?B?ZWVIT05DZUdDVlQyTFpvZVF5SW1Kd0VPd0RwcGVaOHJIaFd5TXVpdzVrL2JK?=
 =?utf-8?B?d0pRbTNHWTFaUVY0OWl4YTNYRFNtR0FhcVI3dFovcDhjdEVubS95eGxhdWYx?=
 =?utf-8?B?bFF4ZkZQZ1Zjek92UlV5Yi9paE8wM1pIQSsvMG5lVUJhRXZwWDZPQjhpSDFt?=
 =?utf-8?B?VkVycTdydGVuRlBaWjgwYkViU2xZTktIOXhhTjZQeVhhaXg3M1N3K1FzWitP?=
 =?utf-8?B?VTJxL0ptU28rc2FCcWVFUllOQnN5SE4zbHhNNGZ0STIwMnl5dEtlWElVWDdn?=
 =?utf-8?B?WThrWVRRbFE2clZ5UlhTSHg1KzZtU3pkOXZMZUNiSUJ2bHpwdnhFNmZHMTA3?=
 =?utf-8?B?R1JRV083TUFMUkxCVnFzTjZIbHF3bExVRFJ2S0I1dys4M0o3emw0VlN0Wllq?=
 =?utf-8?B?alhCRzNndDBEU0tFUjJhNHg5K2NLZEdVVkxuNWpKOGlMK2R5aDNwRTVSQktQ?=
 =?utf-8?B?eURKQTE1eXBrNUJJL2ZpT25GQnRyT09XWlk1NjE2SWdIVytGRU5SOGpDUmdq?=
 =?utf-8?B?K0tJcURQQTNkamRwQ2doNWt0anlZZi9GMzRISVZxR1UxU3FlbU9BVENpTmNC?=
 =?utf-8?B?VnlYSSt5VUErelRCTnRUVGdvYjRiSlAvcWkvdjJmb3I3MTZwUDFSZk5BSE9w?=
 =?utf-8?B?Y3Z5ZzdEcit2MG1OVXBSUDFqY21oMDAxVUs0V2hZOUt5dzdyZWVBY05PZUt4?=
 =?utf-8?B?dVF5UHRIdDBvZ0F6STNpalFDZ0IxRnNJSXhxVXF3c2ZDNUZ5ZDBNbi80MnE0?=
 =?utf-8?B?Q3Vha25YNDVoL1lsaXpQTUZTMGR0V2xiTXJNVlY3VUMrZXJ4Ym5NakJhWmNX?=
 =?utf-8?B?NUtsT2VnSVVXU1RWZVdmMjhDYmxBazRyZlFUVnRqVE5hOWFlT0xWYmZVYnds?=
 =?utf-8?B?c0RoZGFkL0FzdUYwem55enBVV3FZRzB1dFJ0Z0FiazQ4cUtIQ0pYTThDVDli?=
 =?utf-8?B?TXBJQWdVKzJaSUJSalpseStSb2lTenNCUWxobnBFREdrNjJWNW9XOHZDeFlk?=
 =?utf-8?Q?pEpvdlQUO9TMdfibl1A8VxjkwESIbOwMP2KfKhH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d0ff64-de66-4d83-8544-08d97dace89b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:39:44.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKYDePIgoct1HGaPWQ74XS/abtgCv5aX9alHdEhdIlmMNP0JdWufeq3uIPZlJ9Mqkp0xF8SSKfc0UaVBv6GAnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5526
X-OriginatorOrg: citrix.com

On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
> 
> 
> On 22/09/2021 13:21, Roger Pau Monne wrote:
> > Hello,
> 
> Hi Roger,
> 
> > First patch on the series is a trivial change to xenconsoled in order to
> > use xenforeignmemory stable library in order to map the shared console
> > ring instead of the unstable libxc interface. It's reviewed and ready to
> > go in.
> > 
> > Patches 2 and 3 allow setting the host wide command line `gnttab` option
> > on a per domain basis. That means selecting the max allowed grant table
> > version and whether transitive grants are allowed.
> > 
> > The last 3 patches attempt to implement support for creating guests
> > without a grant table. This requires some changes to xenstored in order
> > to partially support guests without a valid ring interface, as the lack
> > of grant table will prevent C xenstored from mapping the shared ring.
> > Note this is not an issue for Ocaml xenstored, as it still uses the
> > foreign memory interface to map the shared ring, and thus won't notice
> > the lack of grant table support on the domain.
> 
> I find a bit odd that the Xenstore support is conditional to whether grant
> table is available. Are you expecting domains with no grant table to have no
> PV drivers (including PV shutdown)?

I don't really expect much, as having guests without grant table is a
developer option right now, if someone wants to make use of them for
any reason it would need some thought.

The other option would be my first proposal to restore foreign mapping
of the xenstore ring on that case:

https://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix.com/

But it's also arguable that a guest not having a grant table should
also likely prevent foreign mapping attempts. Plus such foreign
mapping won't work from stubdomains.

I'm fine with dropping those patches if they turn out to be too
controversial, I think it's an interesting option to be able to
disable the grant table, but I don't have a full picture of how that
could be used in practice. Maybe others have and would be willing to
pick this up.

The xenstored patch is mostly so that I can boot guests without a
grant table using xl and test it's disabled using XTF.

Regards, Roger.

