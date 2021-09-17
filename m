Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8B40FD1B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 17:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189493.339244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4k-0006BT-VU; Fri, 17 Sep 2021 15:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189493.339244; Fri, 17 Sep 2021 15:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4k-00068t-RP; Fri, 17 Sep 2021 15:46:54 +0000
Received: by outflank-mailman (input) for mailman id 189493;
 Fri, 17 Sep 2021 15:46:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Eq=OH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mRG4j-00068c-Vs
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:46:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b0d47b6-8517-4a4f-8811-acbd96c09264;
 Fri, 17 Sep 2021 15:46:51 +0000 (UTC)
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
X-Inumbo-ID: 6b0d47b6-8517-4a4f-8811-acbd96c09264
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631893611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mOE0yL5slFfYU8+bdX/AoH1hs+X1pgLMgHslV6f/8Xw=;
  b=W4CBNh7lJrOB3u1ogW3QWLwsc3djUiWjt/r8deIlSn5fXRdRDCiihkjK
   DH9PwAtL8j5caYbmtlEgl0r/DH9dV5z9MF5SaBE4SLivtCRyQ7SL0wlgn
   UH/pA86xCZJYNwknz4yHdOl7Cam1Y4SnSMExQnZBtJ5onbcP+EsObkGWz
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ww4bUqDkPIdjUfB0EqodsCtqGwj5JsHL672fvGGXY1Gr6GH01PqO9yF8DEzFqtXZ77S8y1oKQZ
 9UzI5Fs4x8mENwM8jF9z7sOdRQ6w2nzMn6npXkgXBR7OSzvcp2mse9t6A/KcGWPLNapeXTaFDu
 HOC7k29itaYwSfFovaVyVPaLTFFbXx/SeUWCClfu17LXtGdeCJ1yM8t+x23GKfGY53YO5rYWfb
 EgMTWgMfSp8NwJlnceDkouwxltZAnTHuwgzkuEc2nLtmZ2BvYjr3EFTlK3GRxPwGfHIIjPTkyr
 nPzsGJEZYFzZobUmaMnmHDKn
X-SBRS: 5.1
X-MesageID: 53016148
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tu6asaywVcQXNIwMucV6t+ebwSrEfRIJ4+MujC+fZmUNrF6WrkVRm
 2AdCm+EbveJa2Khe4snO4S080oH657Xz4diTQU6pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrdm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8w25
 M5zub+3dR8SMp/gxaM6awVFTwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIDhG5u35wedRrYT
 +s0dTtxMSiRWhpCHVQeKbVuobiwxUCqJlW0r3rK/PFqsgA/1jdZ0rf3N8HOUseXXsgTlUGdz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKosE7m/+u9vkUek7GUZAx0LVnO2ufC8zEW5Xrp3J
 0UK9wI0oKM19UjtScPyNzW6vXqFsxg0S9dWVeog52mly7XWyxaUAHAeSTxMY8Bgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZQkP7sTnoYozpgnSVdslG6mw5vXqHRngz
 jbMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEq5qS9iWoKGYLCw0lTpwasHC76FUwWo6
 S1sd9el0AweMX2cvHXTG7xdR+D4v6zt3C702gE0TsJ4n9i50zv6J9kBvmsmTKt8GptcIVfUj
 FnvVRS9DXO5FECja7N+K6m1At4jpUQLPYW4Dq2IBjaij54YSeNmwM2MTRXLt4wOuBJ1+U3aB
 Xt8WZz3ZUv28Yw9kFKLqx41iNfHPBzSIF8/origlHyaPUe2PibJGd/pznPXNr1RAFy4TPX9r
 I8EapriJ+R3e+zieCjHmbP/3nhTdiNTOHwCkOQOLrTrClM/QAkJUqaNqZt8K90Nt/kEzY/go
 yDiMnK0PXKi3BUr3y3RMSs9AF4uNL4ixU8G0dsEZwfwhyd7Ptbxs8/ytfIfJNEayQCq9tYtJ
 9EtcMScGPVfDDPB/jUWd57mq4J+Mh+sgGqz0+CNOVDTprZsGF7E/MHKZAzq+HVcBya7r5Jm8
 bahyhnaUdwIQAE7VJTab/emzlWQu3kBmb0tAxuUc4cLIEi8opJ3LyHRj+MsJ51eIxv02TbHh
 R2dBg0VpLeRrtZtosXJn62Ns6ygD/B6QhhBB2De4LvvbXva82OvzJVuSuGNeTyBBmr49L/7P
 bdezu3mMe1Bl1FP6tIuH7FuxKM4xt3uu74FkVg0QCSVNwymU+oyLGOH0M9Dsrx26oVY4QbmC
 FiS/tR6OKmSPJ+3GlAmOwd4PP+I0usZm2eO4K1tcln6/iJ+4JGOTV5WY0uXkCVYIbZ4bNElz
 OMmtJJE4gCzkEN3YNOPjyQS/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxl4O
 CKQiYrDm69YlxjLfHcEHHTQ2fZQ2MYVsxdQwV5ef1mEl7IpXBPsMMG9Jdjvcjlo8w==
IronPort-HdrOrdr: A9a23:vw842K92RLk/tJ5CrYZuk+FJdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlgdCVbKXlvg1QpGlRGt9dBmxCe2Gm+yNNNWx77c1TLu
 vi2iMLnUvsRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIB/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF4nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSgWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KBoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFnLA
 BXNrCf2B9qSyLeU5iA1VMfhOBEH05DUCtue3Jy+fB8iFNt7TdEJ0hx/r1Xop5PzuN6d3Hoj9
 60RpiAr4s+PPP+W5gNctvpcfHHeVAlfii8RV56WW6XbJ3vG0i94KIfs49Frt1DRvQzvewPcd
 L6IQpliVI=
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="53016148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMzcNMe9DMlYNt62q7HrlD5R66M7A9G1wYbYUJBSrqqKDQ7tQAzzV5j68B7FDCaD1pnmeFqOCeYsw7uHNmeMfa00oRlbi2m9ezUvQYwC3FSjEcrnMHpBf4dBIU6tFhCo4+vzQBsIL85UPNkSQBGhJuN7qT7yoK0gdizSe/H66ezxPyRGiDG4MABELN8v17uLVUowM84LfoZ1rcRv2AB3rlyWexyho8TamxvblxA68ZaeTrh4/VBgD6CnPM2j3bj7IAWbVp2TEKIT6ODXSy1TM8PIhb4vXjz8IHKSESlHYP+eLzWSe7wBYSo1zbv0iT7A5hgHx3+WT/Z3D8eZyoY5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oFmL7GXpSQBvcx3T6o/NI73rUPRPzWCG2d3RTcwysco=;
 b=k+g/fVRac8eC8q7441bW4DXLl59yNar+fYEUgSbqJ77Ah9KaHzlTBxo4rr5TTl3K7CSvxZUosvxS504p427btXbkicho+fFRGHwuSNANDpc4l74Eje+zKD4thlbuFpf7rNk+qmD+RyW7bWCmmNCU36wn2JYpSAdKmxkwxImkiWcuHMr85AXdhD3eeDUoXCn3d+HQ1wl7ShIfnFwhUwF5yEeFIRX6QgmqY146nSw3JcKqdGX46jP0BJ1H+E4PUxWXvjeqzPD7l8FIbDv4W63T4DN4NwEYr3LswP1Ey1Y2uOumppWOKErs4aCL4UuCx8751u+fGR9BOr/6fi42wwtpdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFmL7GXpSQBvcx3T6o/NI73rUPRPzWCG2d3RTcwysco=;
 b=E2xo1Px0dG9WOFt5myTACXHQxTDXJmMoQQVOjJ+6AC3dbgN5A349GT606AeRNqAOSNY4J8Pww6pB4JBFztcHfyGE4tEAQ6GKyRNtAinzm1ksI/ct9UwaQqt/WSpSGjAJA4koKDvXh64Qdc97TGLojQmRaoB/d5IVFpYuG5f7hQI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/6] gnttab: allow per-domain control over transitive grants
Date: Fri, 17 Sep 2021 17:46:21 +0200
Message-ID: <20210917154625.89315-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917154625.89315-1-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 124d820b-a3a1-40c6-9706-08d979f25bc3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB405733C673C3AC8D53C762948FDD9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSvtcpToyVj2OZyE4sDXy5RqI+toq05GBFmH0P/HhvfgfCuNAtxNU1uQv9oNWMGByuUwxXsLTVwR317t6JgUB6i4qUUuBOa8DCnyZTTuh8IXWALuAHLqFEZ4DQrSDRIMBv4VBurkoqHvo/85cZKhxC8dX6Iy2+k/cTpLAWY4OzvFTx3Do+ovjS72FR21jHvurP0utRHJJ6BY793XhjkwFXOBMLZPNa2q2gsWVxtuWUJc2eLTH8nZdc26P8qhAGBEHq10fRFJMLThXIsRL5bO9MtADwvWcktNbwVonSsZwErqySVI0Svn/yHxelMjLVMzCkD9HjoYo3Od1EQfWciq3qygKZs+HxDi4jOJ3mAeugT4bnouFX1+1NG7eknY+dTDG0bnmjsVsRBO7D4lpXC+uIefc+qY3CICwQla+I+a6lhUQFiNBJSIItR7itG05nCeKmyYP8HAtPjhy2zw8m4hXKULRGmXYZ9lU8j2ddB6EutCeQwfoFOhq2POJKqrzhKWZuPCy6y+RHlGWzaVCxqriVusiYkAv+ftuBx3o5ewuRCWijahgL4+3V73SkknBAF9n9XB7DgjCPf5amkLuvSddGwd1ZheN1I5ZNSgAJ+Lc0Ng1g8/tnyecHe5BF+gyedOgEg1wwwA085EAnCbu958ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(2616005)(956004)(66946007)(66556008)(66476007)(316002)(6666004)(30864003)(8936002)(8676002)(2906002)(4326008)(186003)(26005)(6916009)(54906003)(6496006)(508600001)(6486002)(38100700002)(36756003)(83380400001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDcwOGpkMUhjczlVTkVtYWM4SVF4Kzc0RUJ0TGxjL0s4eGJYSWI5dUhkM0Jw?=
 =?utf-8?B?V2VzTDBZQVdLelh3ZkQ4SWtCV3M1ZzljTWpNZ2d4ZnNleHNLWnZ5eFplTWVW?=
 =?utf-8?B?Z2FXVnh3c3ZaZXNOMFBOb0hOR2dSK2NyWXhEbXFWNU03ZE52NGpPb2dldlFm?=
 =?utf-8?B?bzVWVDFpRk5PaWhua0Qva3FCYVUwNW5ldU9nWG5OVUg1ZEUvcDhkMEJMZDVh?=
 =?utf-8?B?TC9Ic0lmN2xjUXpmbnQ5WHovbW84eXFDSURoSkdCVmJCWWNBQTB5L0hTNlJL?=
 =?utf-8?B?U2o1L2hPVlZrWWRkQ0YrWkJUSWoxL0xHeFlVYVdGckNyM0xNbUhBRkE5eHpl?=
 =?utf-8?B?ZUQvWEh0d3F2RnNJRkxNblA4N0Q1N2NCM29yOEduNjN5NExxMzg2WVlFbGd5?=
 =?utf-8?B?Q3NMTy8xUlJINjdEKzQ0RVFkSllJNVZCbEtuN3hXek9zYVpxMVhlTU1mczA4?=
 =?utf-8?B?ZzdPeW1tcmdCY2pacVc5OFRROVZncm91VzVJVGxVbUF5bEQ5a3hVdWNVY002?=
 =?utf-8?B?b1ZKSk5zSk9TTml1Q2JHZmpQeXdHUDNtalJucGpMeU1ZNGVJMTQwbFpaV1dt?=
 =?utf-8?B?cXpacFdwVmJnVXNUVytOZnpaMFhxK2ZBSFhVeWE5eE5VUklXRysxNnB3bGgy?=
 =?utf-8?B?cnAzRTdZR0t0OVRVbFV2M3p1Umw0Y1hsME5ET2FObTBJazE5LzRIYVVjamdQ?=
 =?utf-8?B?dzhTVEVKRDFEVm1kTFNnT29PYXJIbTF0aWpLazIwNlE5VEdhRlBNMW5Sc3pG?=
 =?utf-8?B?ZUZqMFBhQXU2TFUyZEc2NWgzMFJDMTMrNzdVZlZCWCtUTVp4a2xxQ0tGaWNu?=
 =?utf-8?B?SFpxcTdMYVpCRjFtaHBhRmwwbVk3ckd0N1FNTzcrMEwvQTVpQlJZTEtSQTlj?=
 =?utf-8?B?RXUwWE1FbjhobWhXRFFmSklBbUUxb3RXc0ZRNVdadWNLbU1GR2FRbkdaaHhu?=
 =?utf-8?B?b3pUSFNHRzdsdHdEZ09LVkcvQU83ZzFKUGVEYzJJM0tCbUYrSjFXQkF5VVBM?=
 =?utf-8?B?YkNOdGxCZU43aUxSd3MyNFNER2J4UnFZTmQ0R3VrajZpdmZkQU5NYU90WVBP?=
 =?utf-8?B?RzNqU2ZiMTVGRjhiYWQwWDR4bnRkeXNzUEtmMTJTbjUrbWVYNkFaQmFaeS9v?=
 =?utf-8?B?N3RtOHB5c2poQTJjc09oTktDeEZ5WVVDV0Z2YmpSQnBFRUdJbVRTS2dEYmRs?=
 =?utf-8?B?MEhkcU1KWjBBZ3poT3NWNU13TDBQcjRLd09oRU1kci9FbFQ0UC9kK0Vwdmti?=
 =?utf-8?B?RDFZY0M2ZTgwcW1rUjgvREp4Mm4wUUgrSGZ4d29hZVA4eHMzRWFLaGF4NWtI?=
 =?utf-8?B?MHFscmV4d09MWklnQTBOMGE1SDZvZVYzWVhlckxIaUExc2FWb0E1TGdBcmVO?=
 =?utf-8?B?REQxN2hoODRpUThzR0w0ZkVWK3hQVlJXZUErK0MxTHlQODg5MVdRSENCZG5k?=
 =?utf-8?B?STZlY0JDQWRnVFRTU0IwN2NIZlRTNDgwWUdQSkdhMWlFWWZ1d2F2V3U1Sm4r?=
 =?utf-8?B?MDFGTnZkK3gyVGlqbDVxREVwUko0KzNBSjRMTXZVOFdmTnhNUjBFU3lyQzU5?=
 =?utf-8?B?MWxGL1hBY0lTSndTOUdvZlkvenRtcnpvY3MyMEpTYlppWk1oZXFFNzNKeTh2?=
 =?utf-8?B?allBalExc2VVUXR4bkRobHc4eCtjZlFFRDdNMk5QbUlyZWhyM2JQb28xdm9q?=
 =?utf-8?B?eDkxaDNZMVpROHVZYmtjRkc0SXM3UFEyNDF6eWNtZkI3ZmN6eUJYZkFqOEdq?=
 =?utf-8?Q?Oy3XytBW5qFP28fRPYL/2Ia+E4+GVHkdS9xLGhp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 124d820b-a3a1-40c6-9706-08d979f25bc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 15:46:48.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZO8CfCP9tEuLOREF4JL7gvprEA0FNkpzyWBMoPnoTJ6oo7gqNd9rI6NmrMO8TW4FqIwG6BETEld/wLL1O82wUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

Introduce a new grant options flags field in domain create and use it
to signal whether transitive grants are allowed on the domain. This is
settable from xl using the transitive_grants option.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/man/xl.cfg.5.pod.in            |  6 ++++++
 docs/man/xl.conf.5.pod.in           |  7 +++++++
 tools/include/libxl.h               |  7 +++++++
 tools/libs/light/libxl_create.c     |  3 +++
 tools/libs/light/libxl_dm.c         |  1 +
 tools/libs/light/libxl_types.idl    |  1 +
 tools/ocaml/libs/xc/xenctrl.ml      |  4 ++++
 tools/ocaml/libs/xc/xenctrl.mli     |  4 ++++
 tools/ocaml/libs/xc/xenctrl_stubs.c |  9 ++++++++-
 tools/xl/xl.c                       |  7 +++++++
 tools/xl/xl.h                       |  1 +
 tools/xl/xl_parse.c                 |  4 ++++
 xen/arch/arm/domain_build.c         |  2 ++
 xen/arch/x86/setup.c                |  1 +
 xen/common/domain.c                 |  3 ++-
 xen/common/grant_table.c            | 11 +++++++++--
 xen/include/public/domctl.h         |  8 ++++++++
 xen/include/xen/grant_table.h       |  6 ++++--
 18 files changed, 79 insertions(+), 6 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index a4bf2caafa..c5a447dfcd 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -586,6 +586,12 @@ Specify the maximum grant table version the domain is allowed to use. Current
 supported versions are 1 and 2. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<transitive_grants=BOOLEAN>
+
+Specify whether transitive grants should be available to the domain. Note such
+functionality only applies to grant table version 2. The default value is
+settable via L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index 0a70698a7c..88efbee5fe 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -108,6 +108,13 @@ Sets the default value for the C<max_grant_version> domain config value.
 Default: value of Xen command line B<gnttab> parameter (or its default value if
 unspecified).
 
+=item B<transitive_grants=BOOLEAN>
+
+Sets the default value for the C<transitive_grants> domain config value.
+
+Default: value of Xen command line B<gnttab> parameter (or its default value if
+unspecified).
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7a35833312..d23586f2cc 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -509,6 +509,13 @@
  */
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
+/*
+ * LIBXL_HAVE_TRANSITIVE_GRANTS indicates libxl_domain_build_info has a
+ * transitive_grants field for setting whether such functionality should be
+ * available to the domain.
+ */
+#define LIBXL_HAVE_TRANSITIVE_GRANTS 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 69b5419416..61d65d1342 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -633,6 +633,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
             create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
 
+        if (libxl_defbool_val(b_info->transitive_grants))
+            create.grant_opts |= XEN_DOMCTL_GRANT_transitive;
+
         /* Ultimately, handle is an array of 16 uint8_t, same as uuid */
         libxl_uuid_copy(ctx, (libxl_uuid *)&create.handle, &info->uuid);
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9a8ddbe188..4ade437257 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2321,6 +2321,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
     dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
+    dm_config->b_info.transitive_grants = guest_config->b_info.transitive_grants;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 37789a568c..d05b5d2abc 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -519,6 +519,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_grant_version",   integer, {'init_val': '-1'}),
+    ("transitive_grants",   libxl_defbool),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 6a8658bfec..ec7a296776 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -73,6 +73,9 @@ type domain_create_flag =
 type domain_create_iommu_opts =
 	| IOMMU_NO_SHAREPT
 
+type domain_create_grant_opts =
+	| GRANT_TRANSITIVE
+
 type domctl_create_config =
 {
 	ssidref: int32;
@@ -84,6 +87,7 @@ type domctl_create_config =
 	max_grant_frames: int;
 	max_maptrack_frames: int;
 	max_grant_version: int;
+	grant_opts: domain_create_grant_opts list;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 5933d32c70..e47fd1947f 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -66,6 +66,9 @@ type domain_create_flag =
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
 
+type domain_create_grant_opts =
+  | GRANT_TRANSITIVE
+
 type domctl_create_config = {
   ssidref: int32;
   handle: string;
@@ -76,6 +79,7 @@ type domctl_create_config = {
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
+  grant_opts: domain_create_grant_opts list;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index aad3c6a726..772704759d 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -189,7 +189,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_ARCH                Field(config, 9)
+#define VAL_GRANT_OPTS          Field(config, 9)
+#define VAL_ARCH                Field(config, 10)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -214,6 +215,11 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		/* ! XEN_DOMCTL_IOMMU_ XEN_DOMCTL_IOMMU_MAX max */
 		(VAL_IOMMU_OPTS);
 
+	cfg.grant_opts = ocaml_list_to_c_bitmap
+		/* ! domain_create_grant_opts GRANT_ lc */
+		/* ! XEN_DOMCTL_GRANT_ XEN_DOMCTL_GRANT_MAX max */
+		(VAL_GRANT_OPTS);
+
 	arch_domconfig = Field(VAL_ARCH, 0);
 	switch ( Tag_val(VAL_ARCH) )
 	{
@@ -253,6 +259,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_GRANT_OPTS
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 0fde879cf4..9bd398f8c9 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -56,6 +56,7 @@ bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
 int max_grant_version = -1;
+bool transitive_grants = true;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -221,6 +222,12 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_long (config, "transitive_grants", &l, 0);
+    if (!e)
+        transitive_grants = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index cf12c79a9b..d7f83c9abd 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -283,6 +283,7 @@ extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
 extern int max_grant_version;
+extern bool transitive_grants;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1206d7ea51..8e4e561df8 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1440,6 +1440,10 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    xlu_cfg_get_defbool(config, "transitive_grants", &b_info->transitive_grants,
+                        0);
+    libxl_defbool_setdefault(&b_info->transitive_grants, transitive_grants);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e9a34f2f8d..b4763b5ec6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2485,6 +2485,7 @@ void __init create_domUs(void)
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
             .max_grant_version = -1,
+            .grant_opts = XEN_DOMCTL_GRANT_transitive,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -2593,6 +2594,7 @@ void __init create_dom0(void)
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
         .max_grant_version = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_transitive,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index af69e20029..c743a88592 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -751,6 +751,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
         .max_grant_version = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_transitive,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c85d89419..ab16c422f7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -670,7 +670,8 @@ struct domain *domain_create(domid_t domid,
 
         if ( (err = grant_table_init(d, config->max_grant_frames,
                                      config->max_maptrack_frames,
-                                     config->max_grant_version)) != 0 )
+                                     config->max_grant_version,
+                                     config->grant_opts)) != 0 )
             goto fail;
         init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index d01c6813d1..280dbc850a 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -74,6 +74,10 @@ struct grant_table {
      * progress.
      */
     unsigned int          maptrack_limit;
+
+    /* Allow transitive grants. Only applies to grant v2. */
+    bool                  allow_transitive:1;
+
     /* Shared grant table (see include/public/grant_table.h). */
     union {
         void **shared_raw;
@@ -1918,7 +1922,8 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames, int max_grant_version)
+                     int max_maptrack_frames, int max_grant_version,
+                     unsigned int options)
 {
     struct grant_table *gt;
     int ret = -ENOMEM;
@@ -1964,6 +1969,8 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
     gt->max_grant_version = max_grant_version;
+    gt->allow_transitive = !!(options & XEN_DOMCTL_GRANT_transitive) &&
+                           opt_transitive_grants;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -2886,7 +2893,7 @@ static int gnttab_copy_claim_buf(const struct gnttab_copy *op,
                                     buf->read_only,
                                     &buf->mfn, &buf->page,
                                     &buf->ptr.offset, &buf->len,
-                                    opt_transitive_grants);
+                                    buf->domain->grant_table->allow_transitive);
         if ( rc != GNTST_okay )
             goto out;
         buf->ptr.u.ref = ptr->u.ref;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 7f8456c50e..fe2201fca1 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -96,6 +96,14 @@ struct xen_domctl_createdomain {
     int32_t max_maptrack_frames;
     int32_t max_grant_version;
 
+/* Allow transitive grants. */
+#define _XEN_DOMCTL_GRANT_transitive  0
+#define XEN_DOMCTL_GRANT_transitive   (1U << _XEN_DOMCTL_GRANT_transitive)
+
+#define XEN_DOMCTL_GRANT_MAX XEN_DOMCTL_GRANT_transitive
+
+    uint32_t grant_opts;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index d6da067fc1..f264b1c3fc 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -36,7 +36,8 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames, int max_grant_version);
+                     int max_maptrack_frames, int max_grant_version,
+                     unsigned int options);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -68,7 +69,8 @@ int gnttab_acquire_resource(
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
                                    int max_maptrack_frames,
-                                   int max_grant_version)
+                                   int max_grant_version,
+                                   unsigned int options)
 {
     return 0;
 }
-- 
2.33.0


