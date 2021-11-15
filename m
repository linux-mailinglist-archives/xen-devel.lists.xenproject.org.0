Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3674A450447
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225843.390089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmavz-0003MO-BN; Mon, 15 Nov 2021 12:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225843.390089; Mon, 15 Nov 2021 12:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmavz-0003Jq-8M; Mon, 15 Nov 2021 12:18:03 +0000
Received: by outflank-mailman (input) for mailman id 225843;
 Mon, 15 Nov 2021 12:18:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmavx-0003Jk-Tj
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:18:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11f65a7a-460e-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:18:00 +0100 (CET)
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
X-Inumbo-ID: 11f65a7a-460e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636978680;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=QAyGt7wDCGpdGbIR+FRX4EFwC38bD/6P9PpvtFil/Gs=;
  b=Q/3zcwYEFXXUcdAaLxWz3+fqxbg9402P//D6xazVQt7Q8jgDVz6hKmad
   Q/anwThYDsrfpvg9CarvvGsWA4bVbckfGbs0L/dlCmCMAzB9BcsKBZzR6
   lbKfn9jBIdOHNUHgzZOKYuX8LAaIO+BZLdUrVMNVzQlSax46xXSQrQeMr
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bj4Dtt4vARMSyR2RUMjEi52VP79hHR0Iddzi05zA+Pd5fs6Dmu36Kwqye0EkiHfZVrYhth/Hur
 HMha2thgr7Xjbc/KJ44Fl777WDIAc2VKCK0g5FP2TlByAhVALKP3b9VcJY9728chW0S4wD3fyU
 WqwAr0Z9ehr9pZSk1+WuaE8pUxyFgECdSdiG6LVlb+Av8X5/HesgnI1I2g2LK0NEfS1nqadgNs
 oCvKfrDHsAAeUe1f/3QARIa3dlsa7c5hCHm1m9yJnpN+7MfkK7s+myFbrnPzBgq6OxTCkAdISA
 KNAWpAFxnmBBDsVpXHEhpukh
X-SBRS: 5.1
X-MesageID: 57350294
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qAhJZqgoSpUuURjiNc6MdYv4X161bBYKZh0ujC45NGQN5FlHY01je
 htvCmiAPKqDM2P1Ltp+Oo+39RxSvJPXy9MxSAFoqSExFCkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /10sMCyeVh0YZGQgdYHeB9JNQN4ELJvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2ZsTRayPO
 6L1bxJWUU3rSSZMMWslI7kHsNfx2HqkdgNx/Qf9Sa0fvDGIkV0ZPKLWGNbcZNGiX8hemUec4
 GXc8AzRAB4AM8eE4SGY6X/qjejK9QvFX4YVGKy95+RdqlSZzWwOCzUbTVK+5/K+jyaWXttFL
 kUO9ykGrK4s9VeqRN3wQx25pnGfuhcWHdFXFoUS4gyX1rDd5QrfA2EeVyNAc/QvrspwTjsvv
 neShM/gDzFrtLyTSFqe+62SoDf0PjIaRUcDei0sXQYD+8Pkoow4klTIVNkLOL64iJj5FC/9x
 xiOrTMinPMDgMgTzaK58FvbxTW2qfDhUQod9gjRGGW/4WtRZpOhZoGuwUjW67BHNonxZluLs
 WUAmsOexPsTFpzLnyuIKNjhB5nwuazDameFxwcyQd9xrFxB5kJPY6hp5W18FBg0bfpYYA3zS
 0nCnyFXyYB6aS7CgbBMX6q9DMEjzK7FHNvjV+zJYtcmXqWdZDNr7wk1OxfOgjmFfFwE1PhmZ
 MzFKZrE4WMyUPw/lFKLq/EhPajHL8zU7UfaXtjFwhuuytJyj1bFGO5eYDNigg3UhZ5oQTk5E
 f4Cb6NmKD0FCYUShxU7FqZJcjg3wYATX8yeliCuXrfrzvBaMG8gEeTN5rgqZpZoma9Y/s+Ro
 CrjCxYElgej2yGbQelvVpyFQOm1NXqYhShkVRHAwH7ygyRzCWpRxPp3m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgkrCBxGBaQRWLdKLUzx7SrXZnLNSGFmI/ZIGlyYkve5L1CH3HRfUUKKWT4W/
 uTIOvXzGsFYGWyPza/+NZqS8r9GlSRHxb8pARKXeoI7lYeF2NECFhEdR8QfeqkkAR7C2iGbx
 0CRBxIZrvPKuIg77J/CgqXskmtjO7IW8pNyEzaJ4LCoGzPd+2b/k4ZMXPzRJWLWVX/u+bXkb
 uJQlqmuPPoClVdMkox9D7c0kv5uu4qx/+dXnlZ+AXHGT1W3Ebc8cHOI6tZC6/9WzbhDtAroB
 k/WootGOa+EMd/OGUIKIFZ3dfyK0PwZw2GA7fk8LEjgyjVw+b6LDRdbMxWW0XQPJ7ppKoI1h
 +wmvZdOuQC4jxMrNPeAjzxVqDvQfiBRDf1/u8hDUoHxiwctxlVTWrDmC3f7sMOVdtFBEkg2O
 TvI1qDMsKtRmxjZeH0pGHmTgecE3cYSuApHxUMpLkiSnoaXnec+2RBc/GhlTglRyRkbget/N
 nIyah9wLKSKuTxpmNJCTyanHAQYXE+V/Un4yl0okmzFThb3CjyRfTNlYevdrloE9298fyRA+
 ODKwWnoZj/mYcXt03ZgQkVisfHiEYR8+wCqdBpLxChZ803WuQbYv5I=
IronPort-HdrOrdr: A9a23:fdNMn6r+Mt5unyd1mWouf1EaV5vLL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBThHPlOkPQs1NaZLXPbUQ6TTb2KgrGSugEIdxeOk9K1tp
 0QDZSWaueAdWSS5PySiGLTfqdCsbv3gZxA7d2usEuFJjsaDZ2IgT0JbjpyRSZNNXV77NcCZd
 Ghz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlWl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFc5ccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiX7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriyknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdg99RrBmcAa+d
 RVfYLhDK48SyLZU5mZhBgi/DWUZAVzIv/cKXJy//B80FBt7QdEJgUjtYgid0w7heEAoq9/lp
 D525RT5cFzp/AtHNBA7Z86MLCK40z2MFvx2TGpUBza/J9uAQO5l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57350294"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqeyszSBetHRlfpw/JlJSEXtqB6i+IN8okAvlKH/Rjo+R8Xd0EThxttpu8fdssikPqY7o9nsC7DebWPzirlzv+UtP5oD36QewYF6CTKzof4PWE4kSQP9dzUoCSxoMPPSBJryc5gGN07OzMg8P6yUNReDaV36qF/cbyDcNXgBU9JISbVNXA4m16tJakdD/o2DKDMVXut/ytSxZqBjbAHcw/DAqPLYp/bqtfM1pYpv2EUcmVoLQIHdc/PQNU36KGC6G1oWRUDHgyubVzoZLsynBiGUrT1zsaAAu8H3wu0MhPdLlYRVsW+PnMEL/R0W7Waab/IZ1BaMbTfpezMPsnTAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ3JKKqgvuA4rEwQ7MWjKnFIVtfXsE4emtenJXviCQI=;
 b=PcumH9oofSX8pyTKATphj6fVHMJ7xYNqOVZCFhqr6aKr+N3mvb13Haqxlc9m4Imue5dfSzVQmM7l43yH+pKUN+X2E/XLsYIIveH1sM/LKUVYT0zGzWaH3AsGW9Gf1p148oZr1NaZhpyCDhj5A+PDP5o+HOZEzYvb1nAQikB8t72qV3exI12Ko+Zv9MRYaDyJwKhKm2l72353jiSdynyHYcBO/8ngK5Ke1wm+l/ZNVrSHBmoLL8iswSpEyeYpAy6E+J//aqc48b/B8nohQs85+xtAZ0x0yMszS6qs4nknS1c5QWNygQ4bHXhsjXb6VeUxchkfXv+CO6FcaSmC395/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ3JKKqgvuA4rEwQ7MWjKnFIVtfXsE4emtenJXviCQI=;
 b=wsnNbplvxZosElLSjDvvMhBdfLAiz1qRL/1eimthVhcWji/LVWxFcuCF+QtW9AWZraJA756YlCOfVebTvFhiHaCbQC4ZpQjKNYLbSlY70Eq2UI3Cy3jVCeS4DA55Xzntl8Aw1mYxDuooWDcHGO3rjkiFfPsyEnr+zOpqiRD3N90=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Anthony PERARD" <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH for-4.16 0/4] gnttab: fallout/improvements from max version
Date: Mon, 15 Nov 2021 13:17:37 +0100
Message-ID: <20211115121741.3719-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac5ba0ec-23c0-4daa-109f-08d9a831f37c
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3483B35D45340D99EC9AE7758F989@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDlOGgo1uaOqAeCvlMFXF8Vyc+ltEHW2HWya45tILX3Z4iwZRu3Kect5tNS3pTTi0zTS6/Bk5gaeD8bTj32s1BooUMDzDkqnky50jur7vatEU5viULt/wPgOvEFN/+znRwTla73AR1IZf9EEJKpZsI95SwFCyrfVVy4wZF/C/p3EuLhPf1003mmcDwMXXvggjG7WCmhjMGVfJ97O7X34tdYGgLONlARYU/Z6Rwz86EgY6R//XiRkWbUA59M4oQERZesEzylX/LPC4vEYY7HnQupA+nlAxOPSfaGyYX98oEJq9Mn3qx4q+rk0+YGM3LFuAp0/LGnHJEfE13ybHLr/5nm1mDQVZx+dbzLvv+N08hd5wwFlWZ6gS6Us8vLA99TlQ+2I6jtWAPXvuH3fVdwOBQlD+M8XPM3X8JI6+pT5C/YVXRqISTm8J/UEf6ZPG39jqqzoUwECVHp70zy57fBBi44zMY34vE/9w4deOqYvAof9G9dbSGC+kC5U8PCDtzCRIJ4IdX+2Bv7enEE/dkSzSGqDkgURf0PRp1ig+EenJh8WjbIT6AHqzGGadMVoTRCOHBcFe68hAyjS/vzS9r9AzZfOinwqq1XmzpZZABhBJCrrqHtTcuLqndG+DIsMQ9o2jQDeM6C1Lwc9GJVBuTqyeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(7416002)(82960400001)(86362001)(38100700002)(66946007)(66556008)(66476007)(186003)(2906002)(508600001)(5660300002)(6666004)(4326008)(6486002)(8936002)(36756003)(83380400001)(2616005)(956004)(54906003)(6916009)(6496006)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFENGlkWE9JQzc2N25DUjJsQUFhTXFRakJUL1cxdDEweFZiQXlYb29vdkhw?=
 =?utf-8?B?SFN4bEVTV0lnQThKb01OTWVDS1R1OWdQbGtWbE9SV25pamdtaS81UE5iMUl6?=
 =?utf-8?B?VUsybDdiNkQweVJlcEhSdUpZVytvN0wxWWgrb3FVVElBTTVkbjhMb2hwbyt2?=
 =?utf-8?B?MWVPTjhYeDlHQ2hvM3luMVBiR0RiOHVYemgxMUtSZms5Wld1THV4NnphS0hs?=
 =?utf-8?B?Sit1YlRYamhxS1ExUFVpdXNKZk9aR1R1NHIzeVFnYUJ5cmxtWng2eVRJZHh1?=
 =?utf-8?B?Nko1cmFSU1QvRDV2eCtOelBaeVNudUdXdE4yNVhaODhKV21hakEwVmZ1NFVZ?=
 =?utf-8?B?Zk05dGNycVJZWWpQWVdIbkFscUpGMkpOV2tMNEZaRVhGNU15dm1OS0pONWt2?=
 =?utf-8?B?T3Fxa1k3dTVuUU5kc2FiT0IzcFJKOE4xRnZEdDFYeUNSdGMwMldqOGl4aU4r?=
 =?utf-8?B?ZEJtT25mNCtEcHVjREM4dWFLVHRDbzFGaEduNld0QlFWeGsyNEUyb0FPUE5x?=
 =?utf-8?B?T05WSDJ2NjFpOERtWUhuZGNjRE4xMk5iSkgzMVJPWHNSQW5GeGFyd0ZqYlFz?=
 =?utf-8?B?OC9Lci83SytySnRpaHp3bnQ1TEN2cXVkeTJTcklaWHJEbUI3eUxwTkU0T3d4?=
 =?utf-8?B?Z3IxWXE1UXM5a05XeGw3OGR2MWxvczcvN0p0OU53dzl2d0RwclNNRitGUzlN?=
 =?utf-8?B?cTJ2djJJLzJvN0hiZDZxU0VxN3JJT2V5Lzc0N0tRL0h6dURHSEVER1NmcnZT?=
 =?utf-8?B?cTBaNWpwN0xKSy94WHFsYm1ORkEvaHN5N0RKZlduelU4ZHpvbmlDZXVKb0xp?=
 =?utf-8?B?T0xkS3dITnRHMmtEdU9MRnNKK1BZbDhWam9oWEMzUUc1OFZhVldrL2VIeHQy?=
 =?utf-8?B?ak1rOGFzL3dnc3RCZzJVcDd1ajRCclA4UXlCN2F0K1VqTlJuVEt5L21rY0Jn?=
 =?utf-8?B?c0ViR05WU0Fua3o5Y0llamVBVmVVUk1CVXBzdjJsSlQ4c1BwTjArV2h2U0lJ?=
 =?utf-8?B?M0JXb0s0cUd6cmhBN3p4WkFES0RSMmlvMFRkbzUzaUdtTVdYQ3lCK21zTDdl?=
 =?utf-8?B?Qm1Ld2FNUjVxQ3lSaFQzOVl0cWtEM2szNjYzdWkvMjlwd2o0L0hyQUhucVlx?=
 =?utf-8?B?M3RkQmRBQlY4QitTWmtvaURxZkZDTmlFMTZmMUJTb3NaNytHSHFoNkUxYTBr?=
 =?utf-8?B?RENXR0dvNlJaSUdPcGNoS3hsV28wbHAxNjJmMmVuRFNCQ2RaenVocEdFWUNT?=
 =?utf-8?B?TTVmVEVQQnQ5ckRUM2hOQzk4K0xUcEZBNndlSkpsRENQejNIZ0xxZFlkQmpT?=
 =?utf-8?B?MjVUUXVsUmVUUXN2RkhYQWlXZUR1YTkxRGdWblRVdGFkNDRWejFYakIxSTlH?=
 =?utf-8?B?UWlHME1OWldxMU1ZS29ncTdWakw4M1JKS2x6OGQzR05HbytoZHBKaFRibDdX?=
 =?utf-8?B?ZXZoTWdYOGx1ZzI2eFEvUzFMU2pDRFNqUlBveXpGR0IvajZlTXZmdFlpRzdy?=
 =?utf-8?B?NnRlaEh0bFpjQms1ZTY1aWQ4aHliY3cyaHNneWpCS2lWUEpwdmdCRkcwdmRQ?=
 =?utf-8?B?QUV2dGt4ZWRzcU1MRnhuWUVqeldTVFVBR0liTXdKVDhnMC9rNmpuVTFRUVo1?=
 =?utf-8?B?NXNVMmlyMkVzSnN0dWxDSWVubmRQZ1dUUnZYMjlQbTlmYndncVlra0xodzEw?=
 =?utf-8?B?dkJaQWFIWHQ4VS9sWmc3M21sL3lNTnJYRGVmSFRvbmtSZWRleXBlektDNWtF?=
 =?utf-8?B?Tk9IVkVDQ0VjNDlsakRuTlk0TnEyemsvVXVnY2x5eEhGRVp5eUdEMEVMQVZ1?=
 =?utf-8?B?cCsreVhPdUdRT3NaaGF4NFFYUjd6d1pITDkwM3ozWlNFMDNIUkorbVBQN3lM?=
 =?utf-8?B?NVpiY2IzUHlkR3RQbHMyY1ZuZC9VRXo3K3h0OFk0TjdkVDM1d00yQmJIS2VB?=
 =?utf-8?B?MmFrcnQ4UDJ0djJmT0NFUWFGV1dxVWRIakgwVDloRUNBa24zZ2RGMjlNNWR0?=
 =?utf-8?B?Y1ZieC93TnB6T0xsRUU1dzBhMUlVaDlXZXQyZlpyQ0pUWkwrWEVjenNUVy80?=
 =?utf-8?B?RkIvZnRIQjZjL0hVK1NVWndQb0tXTlltS0JCcjA2NmRhSWJ1K3RQVUVNckFB?=
 =?utf-8?B?b2dZSkluVVhmcUsxdHFGbXhaSHNOdGl2aTI1VnZmMkNGSG41aHNoKzMrWUNT?=
 =?utf-8?Q?HRKRJepCuDDbh6vHPAjp3Aw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5ba0ec-23c0-4daa-109f-08d9a831f37c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:17:54.3395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rdSur5iKQFlARGtuv6rtdZymRNLtdVftr2+Ka7ruKZA6FIB0KuQLKmUiKfJWorRADF7ciU7jNDhe2ezRN/e9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

Hello,

The first patch introduces some syntactic sugar for setting the max
grant version on the domctl, while the later 3 patches fix missing
occurrences of xen_domctl_createdomain that didn't set the max grant
version. It's likely patches 2 and 3 could be squashed.

All should be considered for the release, or else we need to revert the
grant table version per domain change.

Thanks, Roger.

Roger Pau Monne (4):
  domctl: introduce a macro to set the grant table max version
  tests/resource: set grant version for created domains
  test/tsx: set grant version for created domains
  tools/python: fix python libxc bindings to pass a max grant version

 tools/helpers/init-xenstore-domain.c |  2 +-
 tools/libs/light/libxl_create.c      |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  3 ++-
 tools/python/xen/lowlevel/xc/xc.c    | 10 ++++++----
 tools/tests/resource/test-resource.c |  3 +++
 tools/tests/tsx/test-tsx.c           |  4 ++++
 xen/arch/arm/domain_build.c          |  4 ++--
 xen/arch/x86/setup.c                 |  2 +-
 xen/include/public/domctl.h          |  1 +
 9 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.33.0


