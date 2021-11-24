Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64745C9BC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 17:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230464.398386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpuxI-0007Hf-Hd; Wed, 24 Nov 2021 16:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230464.398386; Wed, 24 Nov 2021 16:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpuxI-0007EQ-DN; Wed, 24 Nov 2021 16:17:08 +0000
Received: by outflank-mailman (input) for mailman id 230464;
 Wed, 24 Nov 2021 16:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qlkt=QL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mpuxG-0007EK-NK
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 16:17:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f58137c3-4d41-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 17:17:04 +0100 (CET)
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
X-Inumbo-ID: f58137c3-4d41-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637770624;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=/E7lTZM88OIAHv+7nwCCV+X/otcAnbUgiW6ESbzp4j8=;
  b=JkY/rCi9Yk9Fg2JQTAqRvdiQ5BkTf1sVFpVSqEP/DHcBxTj/uo9ppuvf
   jKsbNuVwUsIIbhctmS67zPsTfheLbX2PwGQPM2t3dQEPZ+W64EUTP/l/E
   O4Z4gafplXjM072RrkzlPyPHwNzpdRzYSW4TZhZP+83yjDGsBEPwfXtdK
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WS6jNXC5daLHHDSOSDAq1eXAkmd432e2U2Mj42nO3uE84bRpA3oGZWZ35cDlSZ06+SJxQguIDu
 RfHJfI9I8YPjAGnP+kXUN0gjsC+pEKjant3Jqb+jSFT1BRoFdAmRnDyyKD8O1bE/Rw7B6pHHxN
 D3O2HgsoxsF0VVBpX2EX07OMrDiTUua/8Ol8gXh8VRxjXRMyPGE8Y8ndrwbS2D+DCMYalx5fz4
 777y9mEjsqK80owqUdE+4yC+tcGvTLYxIew2/jqXUCsXaztQxPpQqUi04xtLfW1QGqGvBTOoKg
 eMQNkmnF0RADfwdzzJ+Qq9HU
X-SBRS: 5.1
X-MesageID: 58941998
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PPswua5pUXHI7mEsTFBRgwxRtNPAchMFZxGqfqrLsTDasY5as4F+v
 mIbWj2HM/zfMzCjetsja43j/E4AusKAyYVqHQVvryoyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 sVUhbi6aj4SIu78htgzVTcbGiVFMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWdh2pkfTKa2i
 8wxZDB3XSbgXzZ1CnAOBMIPrs6T2Ej8WmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Zu
 WDu72n/GgsdNtGU1XyC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLloUVw5lYv8fj9N1dSIW+
 Fmn3NrtPjM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1K1ZZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CRV8yR9xLpXZX1oqMBraL9RdF1Oz6zYWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPv8ANbSH7NPImP93Z5yEWIU7IT4iNuhf8NIQmX3SMXFXfoHEGibC4gQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe95YKK7Xde1U+QwnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZkTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:jM3JpqqKc2MmmRFL/Qaklk8aV5oneYIsimQD101hICG9JPbo8v
 xG/c5rtiMc5wx7ZJhNo7q90ey7Lk80lqQU3WByB9uftVLdyQ+VxehZhOPfKn/bdREWndQ96U
 4PScVD4NOZNykZsfrH
X-IronPort-AV: E=Sophos;i="5.87,260,1631592000"; 
   d="scan'208";a="58941998"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dald+QdwQfIDIphvqu1jD4b1L8YtcRISvaaMq0D9c93Cxzi9pMQyqS4w3ai96ctuPpTaZGyHOX89nfuh4rdo2R0vOfbM+pvrN8dySoNU9gpFOGM1t2PJmQ1yk5narFMFTmNoZS2rM3qLhz0IXp08U2vGtusOCLKKb3CyVRY+6tXxX7/jHjamvua/UUAXhekS57Tox8gHyE1oJrYRwYR/cJGXcn9auKatq+grIazkltFaY7GDsNQucVuWL/iHtYUK/gVXbnewwqw8fyWRxEdBYW27O+aIkwBD3rTo4gTDH2E8Q1Knb6qr5eChVWdE004AMBG5RAtdPVU9K3oGQJ9PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6pVwwGe9m19nSJxjOTlaNzYo5HU6Vwzn2MT1WXDBJM=;
 b=A4SPqrOOOhvxSyhMep2tx16qPdMMprJMOUum/8so5BSf+U6aag9c1MChoeuvL7f1vVrS+gH3RLF96Ml/UMdD3WBmdQICfxWNLKLpQ/BimBsY/yMX5IUgCq8FEkB/HVdhN08TGa6TIhgkvqPmaj3M5fGUldyUKYMRNQTA7WUWBCiOiGEIxLeAhU/JSwS6y2vHUsrVuwjK8zmcVs/K3Q38GQdUtyQHWZpebuWPoyv03EGvS7dZapgN28lRfWysZjaZHXlQTGh6PemVglmTosJh8Ad9D1q1XTk5M4dputqj9Tw7WGE6Vxti7R20zE76O3WIHoHx01J0R6y/T5CQHh1cHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6pVwwGe9m19nSJxjOTlaNzYo5HU6Vwzn2MT1WXDBJM=;
 b=E4HtG6IzE406POQntHYK7sQQYrQkJyGjFdBN3o94uXNY8ZWmYYc2JDcxx2LrsFd0r2YdTTpI5jA4oHjUOrw34g96trcZPaEpaGyqa9BVoHNpakGhwwLhkwJ4swUuFRTl442ELV02NJVkgi61iK+TDTDtOIu7yVvexGPWrYRBGFc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies
Date: Wed, 24 Nov 2021 17:16:49 +0100
Message-ID: <20211124161649.83189-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0136.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5ec4540-e782-42cb-1e30-08d9af65d757
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4538885789DCAE3765F180448F619@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaEbEMkeQvqUTELuEnQcNXXaS4RphGGthi67KGKLwiNGIcMtasJvANbOt8ekhK3zYWP2KC2V/Ufi2G9jYmy1ZpQTv8eq9ntab/or8sTBBS3THyBvDjBWYxl2RbI+luZHkwX4S1bYdhig2DDBSGKXcRn8/WpIo7ZBbSMmiNkKT1vNvQGjYnTF8z7gI2XaLLkPV3CUSKywdp6ElWuVo3/ErVjsNFaFYHj7YpXJuUySEx/eyqEuyzOY7neB8zDAn+CLMFGGxKidpL+mxibzDDLMA3AiA4+O3OLPSiMCL8Sh3tOfuF9ZXIkD/CuGv8p6O4b/UKCKB34trO6PJH7b4P5BLC3dg5JAO0KoDc21KXlJIaCOzVKYNk7siM/FiMnuKu21oKbvpJdNiyJgByJKGMhqWqlFLpVdrrTmH6HBUHzf6K738Xjwy5L3n8gIZtK4+CjtlEVJBJOyYRe+OCTT9WaMvDhFHvMsG93fmNCxJRSnKtm6bQ6QcMrIGxCj/7pIV3GoQ4gULyXeG/OfolvFbvFkjImfPbrb/ULPBNdu+sqdpukDvN7aGWVMPwNADgaT+BOcmHuR7gNZ4gJczna2ueHziyu2zA0/SbJriTdZgbrs+LZ+8NyKVjCBrWGk5ApD/zj+77kfVq2hV6K47EAoAs2UqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(316002)(6916009)(5660300002)(2616005)(6666004)(2906002)(4326008)(83380400001)(8676002)(54906003)(36756003)(86362001)(26005)(186003)(66946007)(66556008)(66476007)(1076003)(508600001)(6496006)(6486002)(82960400001)(8936002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXhqRExYdk1WRUlaMVZVUm9wMW1pVEE5RUNIN3VUdmFoZkluRjRKbHJzc1Vx?=
 =?utf-8?B?MG0xYlR5NGpNLzM4R3VQSUY0bk1Pd05laU1PUVRtTnV4UnJGeWdYcVBwTkh0?=
 =?utf-8?B?Q1crRGd2TmtHVWdNckM0NG9VUmhGbzgwV1pYbGNEZTVzaDhuSjB0aXp4UVFR?=
 =?utf-8?B?eEpHSCtUT0tPQysyTmVVVksvbWVjWHBwRlVkRXRwSytLNVV2alF3NkdkU1dD?=
 =?utf-8?B?eDl2UVIzZHZxUUduNkdvQjk1bEg0ZHB6amZHTEpkZk9CTExaQ3VqTmVtWjBS?=
 =?utf-8?B?bVJvbUlBTDRBZ3o1VzZJWWxxWlNwc1V0bDNrdC9NemNSeWtxaEpIR0lhQTR4?=
 =?utf-8?B?dVZRdFd5WG5UOWtDWGQ3SzNWNkhXVFNnQ0pTWGEwTHBsalVRVWNMWVlKOTlR?=
 =?utf-8?B?NktFUXFCTThhdFduV1VzQWs4dlJISGg4eWdaa3I1YjBFSEx4OTZwSnRzU21N?=
 =?utf-8?B?TmIyeGhqYzIvWWxHYVJ4dnlhVVdCSzVBUENPYm5xL20yb2Ria3IzWjBobm5Z?=
 =?utf-8?B?emlNSmdxRGpZTmlHTlFTWWJGUE5QL2VBdDkzSzhLOWpKVjBqcjNtWnRaY0F5?=
 =?utf-8?B?TTJWL1Z3R2Q4cUJLcWlFRElUOHo0eVhGOXVrWkdjM2pWd0laRHFVL0xYWlZM?=
 =?utf-8?B?M0ZDcTg2akl3ek5kQmlHMVBkcitwejRWVWc1dC82YVdLRE15anVKVjZSYUdj?=
 =?utf-8?B?WXlZc290dkxIQ3l4TXpzVzFYUnVhZDBTUWl2Yy8vR1hudGNPVEZKVFFCdjJG?=
 =?utf-8?B?SEpOSUFHL1NUVEliQWhPS1BhTVc4bjJvbXJZNE9lSjFqNFJ3ZTROOHozWXVE?=
 =?utf-8?B?b3FrNENuQmZCTHZ2TmFzbkMrOVFuQnVYWFdWc3NXZzJTNFVmS0hUb3dxeVcw?=
 =?utf-8?B?RndIVWJzRUFwdDY1R05SU2FFbW1XQ1dQdUNKM0l0ZXByQ0o2OXhQZHdTRjEy?=
 =?utf-8?B?TnNPWEFuTHJHdEVacGU2cWZMOFd2ZndmMFR1bkg1TUF0VGlaSlJQaG1ReU8z?=
 =?utf-8?B?Z1FvQmd0a3pvcEcrdTRkYm03N1gzOWZRMytkOEsrQUk2N1Q3Z3NDSFRlS3Jz?=
 =?utf-8?B?R3ZoRHlxalhrM0FxOGQwS0tJSDQ4SDlyeExIdlBFY3g2OTZ3VmQzUXJsYjMx?=
 =?utf-8?B?VlczZ1RyVCtpSDBJSVhpbEVncWRka3dDQ2M5T1hUSnhnSEhkTVovbzE4Qmhr?=
 =?utf-8?B?SmlMd0xLbnhPNzhDcks5SGJhUlNrU1NkSjB5SVMwR2dGMEpNVFUyR05oTnVH?=
 =?utf-8?B?UjhWNXJPZHR4bDBuSUJaNmNSUElBRFBOZ3VZTzUydTl3NmVEMWNVeTREbGZy?=
 =?utf-8?B?RDU1TStqcDY5SGFXRGZEZktONXoxODlldHhyekQ1OC96TDVrQVFmdFJhS3VF?=
 =?utf-8?B?ckVERUR0dDZScktvbHR1ajZIZXVHR0Zic1FnVWNjTEU0aXhHOWtMZ1pET3N1?=
 =?utf-8?B?NTJwWWszTDBlRVA3SDZoQUtDMkp0TkJjY25YZUNGb0Z2QnBCUHBrNFZHc3Vz?=
 =?utf-8?B?NU4xNkVjbGFIRzBiS3k4anBSdlZvVGJGdnZpcDJsM3N2NUhRTVdLSkFESEdB?=
 =?utf-8?B?Yi9TUm5sZ2EwL2VZUVU4TGd3T0dvakE3ZDlwQURPelZ5bXN0NVh3VWJKUVdt?=
 =?utf-8?B?ZVpOcnJHNWtXdTl4d0VjdGQwZjlkdmNUdXZjWE1XQVJGMEdrc29Oc2ZRclRE?=
 =?utf-8?B?VU9xME1OdzF5VUpqV0VjbXdLS25wN0pXRVp3aDdNeEF4cjJTZE9KMWtxdW5H?=
 =?utf-8?B?QkhhUC9BSkEvcnh2MjNYTFlvRTVQM3lUaTlDa2orQ1hFUitZNTFPM1g2YzFz?=
 =?utf-8?B?M2lBNm5qajF1NlNadUp1c0I3SHFxMWRzMCt6eFNQWFJUWEV6UzFTRTBhL1Av?=
 =?utf-8?B?eCtxOEFJM01CUHQzWmx5N3JiZHVlOCtiVUZQUlAyUEVXSzVrZklpTTEzY0Fa?=
 =?utf-8?B?VWhiSTlJWU5jbFBLZURQMFBUUG8wQll5S0JKeWZnUG1DdVN6aXB3TkV4elln?=
 =?utf-8?B?OSs5eURTRkZkaTM1TWM0bndWYXFkS1ZDUUIvRFMvdW5LNlg5VUVzdk5QajNS?=
 =?utf-8?B?WTdsS2JnSnF1K2ZUZFpQamZLTVBWVWUyRmlTVDEwSi9rN1hKYnlCU1NYSWhF?=
 =?utf-8?B?UzlrRUJsd05ZRHVnbUp1U1dFdHR3ODdCZWlWSGR2RWt6bEMwckxKZlNqbExx?=
 =?utf-8?Q?YYE00Ck92eEvjg+uxni4sek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ec4540-e782-42cb-1e30-08d9af65d757
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 16:16:59.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQdbtn9R5AQL4/MohETNu/CXuW5gVqW+tOWp7kUQMBgIa7GeO/F+R054xmHqnpWv46lJ4F0ZPdKYnZmGTInV4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

Shrinking max policies can lead to failures in migration as previous
versions of Xen didn't shrink the number of leaves in any case, so
it's possible for a guest created on previous versions of Xen that
pass CPUID data on the migration stream to contain a max leaf number
greatest than the one present on the max policies in versions of Xen
containing 540d911c28.

Such failure was seen by osstest when doing a migration from Xen
4.15 to Xen 4.16-rc on a pair of equal boxes, the noceras.

Fix this by preventing any shrinking of the max CPUID policies, so
that previously built guest CPUID policies are compatible.

Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

This is a regression from Xen 4.15, so should be considered for Xen
4.16. The main risks would be to mess up with the CPUID policy in a
different way, that would also lead to brokenness. Strictly speaking
the change here removes the shrinking of max leaves and restores the
previous behavior, but it's obviously not completely risk free.

It has proven to fix the regression seen on the noceras.
---
 xen/arch/x86/cpuid.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 8ac55f0806..173c7b71ac 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -353,8 +353,6 @@ static void __init calculate_host_policy(void)
         p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
                                (1u << SVM_FEATURE_TSCRATEMSR));
     }
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -434,8 +432,6 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -523,8 +519,6 @@ static void __init calculate_hvm_max_policy(void)
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 static void __init calculate_hvm_def_policy(void)
-- 
2.33.0


