Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8049056A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258048.443957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Odn-0004dl-6E; Mon, 17 Jan 2022 09:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258048.443957; Mon, 17 Jan 2022 09:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Odn-0004Zi-1C; Mon, 17 Jan 2022 09:49:31 +0000
Received: by outflank-mailman (input) for mailman id 258048;
 Mon, 17 Jan 2022 09:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9Odl-0003a5-Nq
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2566c26-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:49:28 +0100 (CET)
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
X-Inumbo-ID: c2566c26-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=i/Ieolt0RmTqqhBWhTbcDNrdVcfCOwY0R0xAyfxSaGQ=;
  b=QzRSGHWI1s9MusYo/5E94NV8Rez1NZ9bn0SXDHNvRWBOgi4+QS1wK4M+
   PVbWfdw1PS9aPJ9r+ctLh8jkSkoih/YvyRNdO8fgsq3HFrNJcQH9fslgY
   7uC838BKjQs1Olj+huNCv4RAevEzvT6ehnusJ6QsWFBCsTC/HYy7VzGKs
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2PcGYcKNwyYdslBSXkvrUVRGF57rDCnaKOvJuYzwfFn3KGOIJA812/cD3TkNxJ4Xuz1p8M7FZ8
 0TpewO7+2bz5W3kB7Vj3xLCXpesf0tLviJc1hGuoSKk9LxiXjAdFLTs86X3xZSqn7Zh5ZVXSrF
 U0cFU1Y7odF+uun3baEInsURHeh5O3CiTBBa0ursDtGj8ybjVFqjbjEQfPCO6HNahbvWtqHQwg
 ofBjAuyrsfLnMrzCuAQzPMMI1XBCHn7WwcNZTS+A92e/fStlM5mS7zRUpNWY7hP1dlCJ4Wo0Im
 gyDW13DBc+OSAPLx5c+WdfT/
X-SBRS: 5.2
X-MesageID: 62138835
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LA4WQKOEqGZ1TnDvrR1CkMFynXyQoLVcMsEvi/4bfWQNrUom1zAEz
 WNNDWiAOa2IamH1etB+at++8BtXuJTdy99lHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es8w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoySpjvdu7
 OpAjJzzdQkPHbyLyek4TDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uQvIQIjGxt7ixINd/4a
 sQdTGpeUBDncQFNKk8WVLM0ks790xETdBUH8QnI9MLb+VP7zgNr16P2GMHIYdHMTsJQ9m6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+aLegiaDn0AjkAYsZc
 hFKvHp1xUQvyKC1ZsjdTjqnhEGJhx5fZ9R2MPx9uQyo1YOBtm51GVM4ZjJGbdUnsuo/Sjory
 kKFkrvVONB/jFGGYSnDr+nJ9FteLQBQdDZfPnFcEWPp9vG6+Nlr5i8jWOqPB0JcYjfdPTjri
 w6HoyEl71n4pZ5ajv7rlbwrbt/Fm3QocuLXzliNNo5GxlkgDGJAW2BOwQKBhRqnBNzIJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q272pi74LdwMvmEWyKJV3iAsI2KBj
 Kj741I52XOuFCHyMf8fj3yZVqzGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrGbt1+eJ1l0gWmDOCLbimnk/P+efPOxaopUItbQHmghYRtv3U+W04M
 r93aqO39vmoeLavPXmMr99CdABiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSavxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:Xozhz68HMgJy9vR3JVtuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62138835"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdsrO2He3AM7acPokpEdm+diZdtQH0OUtl2hg7FStwSoYqG1VrO78wHJ7f9d+KWWs87maC3HNcZS/XW/Mnww6HGAyYeMiS6t027RjfAS4LZ+a8rM/hwL4T4nZ2v3iepbV68cJVyuZ2Ukq+meZtxZP+nf2wriEY+iBsHuxtaj2IqDxvMi9ya9WYaqwQvfROjmngx9hRQDWLYmWfhLbNQ3AtHh6GV2tWXRiykKJibOb6+3x4Cj9uEOIQ5ZW5hzR2F1+UV69nmenX8TL1Lk9JoCNbQPY3ILKV2tjvKgPiZKIqpTnBv4lGL9hrxaGAHHIe0ZmPvF1jr9oLq0gwQUSTbGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttKOShXOtJhXrlltWfsF3kLq+OT0ydsXDZqofm2TxBw=;
 b=W4CpENHRVPhg6RVyHOgq7kkviIiMJPAqAFdlxfXpuoL4g5B/IHwbo8iwLMvp8t195YluRciDhrkS7qShCqkbvAxKiFllBqpS68837pxkM3i+navzXjEbCE+Spm8OXbqQDiO4WZr+wwhuBS/C4R5onR/W5m2B0t5dc2xsiBLi61WrE0BYSCeCqUcFFpOcJPEDPZ7pQvIsL7DmR4d9y6NdlzMv6Ur65Y/G6nw5WNTfOf4iTZ8OyHwLmkXkNAlTuaPX17nxKgIJ71v1ZdJreTdecz18W5hvVvPhRhi5z7OPTL/07676rjvFHnNSuJv6ZwTzjSFo/B+0pGrq8fr8G6hGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttKOShXOtJhXrlltWfsF3kLq+OT0ydsXDZqofm2TxBw=;
 b=seBIjSvI09pZe6SaI010dqGnCdZRIUhk8MqDDBXQDITusJdxmvBzNq2qPwim889clSLwkmSzntsxRrcNpWy/b+1Jtv9VDJahr/dnNOr0NE9z3q9CZNNsrTDjfXnLQg58jgDCJSuz0GmjfUPKmxUYidgMCSwDwgCvewQXoXF7uOw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 05/12] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Mon, 17 Jan 2022 10:48:20 +0100
Message-ID: <20220117094827.16756-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25836d79-59b6-4bd4-613b-08d9d99ea457
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059B564A532B9490E1A9D5E8F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xsyYorgoLs+mDKoDidSQA9RePbHX74EQSpfxbOY7PrV32hoy1ephUbYsysN4d42YqM3MCKUU5s5McQbbVwMjDdBKa4bb9AxPPjoqjF1c0K4LbIpDLlCEXaOi44E0CZ/p/UEjcUUmStigIcyPg4cHYqzCysc8SIBy3IRQIVsj4makyf/EprY2hx3Vp+CmuI/d5rEYlrytZETnuMrI5nQ2gXk3d/08Z6fYhcb0DFFrLaQCW14B98NZH/rUJA6LwEPOniENUmLQP1niXOSaS09htVDWsKA+1CgxFj+pWbJw0+h6MUSZYiuC/CFr2KQGkqgVqIe/g7d4VtPclsEjaOGnPRcS+E97Lq8/sAjtUNeuGRLm5b1UsHCnBxaKSwfSIoOoZVuWspLwglNFqG8ZegWLdSoPN//qJtRSIA1OlbVxnIMhYuRCX4ofqgz3heWHPygTL194O3Je3T4MexBU+2M8raDN+pIe3rlTAigMflVmiRFI2BW4NptfMj0Iy+lqIIQqsjDAi74B9ZyvyIXshhieeTPpM0pj3JOIN+lIgkjq3pbNC1QJiTgo89YHIFcyH9LgImLIyZd8gMNsymdI0miipgMjwr8hUrvkpneUjeG9RaNpxYV+AlcS9/so4VJDzPQ+YTjOhARVwQgEWSTjDzg/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBNaFBWOFgvRm5wZ29BTEtIVlhpampnMHh2bzdWaEVmNkZOeTl4Y1lxaWps?=
 =?utf-8?B?RklTWG1JeWxTMjAyUXJzb0J5ejFLMUwzRjlZQVJ2dTdwYlo4ZmNLOGwyZmJP?=
 =?utf-8?B?TW8vdlBQUlFVMjlLL1VNK0pMSUwrbU51eWo2Y3A0R1FvSWRqY3BYTlUzWDgr?=
 =?utf-8?B?Wm8vamc3WnVxQjNHNzJrQjRSc1Nkb0tUNlI4a0U3VlhKUGlJWm05ak9jSmtu?=
 =?utf-8?B?dzNjNVRScDIrTEpxYVdNOGZXUGtORWhEMndzbnlPc3BnWEN1UllHYnFDUlN6?=
 =?utf-8?B?eEZHeWVmVEZIWm5xdGlpOWV3M3UrNHR5MCtSUnZaSE9DN1RMd3JSdDFqUnNY?=
 =?utf-8?B?enREbVpkNUpqemxpUmFqM3pCUEpQVGo0K0I2REVxYmRxMGZDZzluRG9WYW5Y?=
 =?utf-8?B?WHp0TFpIMVFHR0pKd2djdzhCNUFMdzRwSHV2aHA3SzRFRG5mWk1tcTNOdzJ5?=
 =?utf-8?B?VXlFZzdLbUhlS2pTYUU1L1RvV25GejhiR0NxM1E1RGEzcEF0dzA5OEtQZmZL?=
 =?utf-8?B?Qlc4MDRBVDZ6U3N6NUlGeGlHbnRReTBONWxSVmpVV25lKzMzQzlLM3phaCtJ?=
 =?utf-8?B?RHZDVDVEaEUyUmdGZUhBSmxIS3FUL0cxeHdDa3NUejBNVEEzWVdUWWZsZDNU?=
 =?utf-8?B?b0ZvV1o3eW1iV0Uyc2pycEJkMzlaL2ViWmVGSXd0VGVYemFuUzR6UWtTMGhN?=
 =?utf-8?B?ajFpa2xqaUZxdTFMeGw2UGxOWldLZSszcHV0YzRCQjNmRUo2SkY2ZzBWQ2ti?=
 =?utf-8?B?cWFRdXdFL1gyWkVGcW1mNmVvTER3YW1HbjVkZkdYYXM5MVBCa0IxUnJSNXBE?=
 =?utf-8?B?U1pobnRVaXc3T1VUSlk5NzdZRjhkRm5HVjJIY3VFejFKQnAreE1ZTGJMczZC?=
 =?utf-8?B?MCtMdXc1MWxDa05JSGhNeTlobzByclBjeDk5YzVmTThZMVBBWitvT2tvNm1z?=
 =?utf-8?B?ajZ5TXcvV3pBTG9FWDFralNncTJtZzB0bnhmVEdSc0VMOTBBMk4vY0FUTVYw?=
 =?utf-8?B?dDY4aGpLQlVtbUFhckE5dGpVdXNVazJXVzA3TExRQkZYeFNubVY5OGg1Sjcr?=
 =?utf-8?B?UzNYNjQrL2xRb3hOeTRHOUFMeG5jRkZCTGNKZFZZY3lSWFNUTEEyaHg1enlX?=
 =?utf-8?B?azIrNGw0RS9Qa0RrMEsrOTRnNDFpN0ExYzM1ZWhadldaRXI4ZHNPQmVXQ2o1?=
 =?utf-8?B?YU9BWTQvVFZaTUhSVnF0THVMRXA4WElDUFBGckIxMWtnQUQ4VHlzSWgwa2x3?=
 =?utf-8?B?b2dLdm14QjJFSVorRjVNUVRTVzNzTDdsdDc2WUY4SjloNkRZRVl1bEpmRXBP?=
 =?utf-8?B?WWRFb3NFcXZHTE1JcDdraXJPalMySDdPcENFam1XMTJoV21rcTNseEwyNnEx?=
 =?utf-8?B?aC9FVGJHL0hURmlBdXlqd2lkS2JIMWttQjd1bjNSdDVNS1JhUnd2bXhNdkJF?=
 =?utf-8?B?RWpld3c4MEFFbkwzbVF4TkVsd2pUWHFuTzRidCtlbTE1Q1JVQ2s5VmhXUkNE?=
 =?utf-8?B?UGVWcmhBUmZPY2Yzd3AxeEkwcVV5YkdhdllIQjZ5ak9sVzQxRWRhMHhON3ZP?=
 =?utf-8?B?Z2hNdTlrc1NFSHM5Y3c4ZFMrZWZJdFJwdmJYVEIxbUo5MWFLUXEyS2x3Qi9x?=
 =?utf-8?B?RGR4dDZ2RHBBN2Q2NTM4TkY1UUxQTWN2a3F0WnM4Qy9ESDhwVDZQbC9hL1U5?=
 =?utf-8?B?dWFQR1JJYjdUQzNpQ295c2RzdEkxaDY5MkhzS2VKeWVpTnJhYnJZTlJNMmUv?=
 =?utf-8?B?MHJ5UTRWeDNwemZCTTNac3dDNCttSy9nNXBiNmJCMXJKMVVkbEJyWVJ1eWtx?=
 =?utf-8?B?VFkvNDByMURLZnM4eW9ySmQ1NFlNb0RUYzFTWEpScTFJaVVjVkhqTWRtNFBv?=
 =?utf-8?B?QXkrV2xRVVd2VGRHVzFMQkVkWXhIS2F6bFlKM3M5MmZPeXN3aFRhTHYrUFFU?=
 =?utf-8?B?Y3F3NmZ2dU9TbXRvSk4xMTc2YjFJSFN2VVZxUGR5K2U3czdoV1h3UXBXbElj?=
 =?utf-8?B?Y0ppSklzRkIwa3d2RDdtdm5WZ3h6YktGU1VibmoxemdGM0hYZjJTR3Yxcjcz?=
 =?utf-8?B?NXZsS3ZqSUc0TkJJbGlBV3ZOVTRWcnZObE12cEttcWV4TVVTZkVkUkowdkV2?=
 =?utf-8?B?RTBuZ2NQb2E5ek5BRjk2UDFCNGdjc0Y3Yi9iTWpLZkNJaXl6M3hGZEhrNXhM?=
 =?utf-8?Q?5SyC2rz2JEEZvyrA1LsIQtk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25836d79-59b6-4bd4-613b-08d9d99ea457
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:23.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQKKh8YNcmyMqzYbkmHDwak55UR6b/L1JTbGVvZsktJ24uUIuQMnKixAExZF0wNtfXSinT1iZU4FK1+Scez1jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use x86_msr_get_entry.

Changes since v1:
 - Introduce a helper to perform a binary search of the MSR entries
   array.
---
 tools/include/xenguest.h        |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 0a6fd99306..2672fd043c 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -810,6 +810,8 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index aff4efe78d..67981b1711 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -880,6 +880,26 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
     return 0;
 }
 
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    const uint64_t *val;
+
+    *out = (xen_msr_entry_t){};
+
+    val = x86_msr_get_entry(&policy->msr, msr);
+    if ( !val )
+    {
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->idx = msr;
+    out->val = *val;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.34.1


