Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992FC5EABD2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412015.655174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqUv-0001uL-Vg; Mon, 26 Sep 2022 15:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412015.655174; Mon, 26 Sep 2022 15:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqUv-0001sY-Sa; Mon, 26 Sep 2022 15:58:21 +0000
Received: by outflank-mailman (input) for mailman id 412015;
 Mon, 26 Sep 2022 15:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/Db=Z5=citrix.com=prvs=261f3fdbd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ocqUt-0001sS-Lp
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:58:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06fcfad4-3db4-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 17:58:15 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 11:58:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5079.namprd03.prod.outlook.com (2603:10b6:a03:1f2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 15:58:09 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 15:58:09 +0000
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
X-Inumbo-ID: 06fcfad4-3db4-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664207895;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4T+ETCK3Y9cSojC8T71GKiPKgJxTlydvdhOA88PfrF0=;
  b=ZuNebobBOCiWuNlRFWnxziGQ/aD9fVAq+JoYHQoAov71YCnsE/VQP1xS
   ZoAfVSyLAR8Cm5B1w8H2KYabJQpaoSow4hz7oEEfU3MLiMr35KgUEQOsr
   W87SphpY6nb23OqVbdzmE7VBGdQHm6w1lQ/1YpNWHmFCtOolEOuV/IpMa
   g=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 83880384
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NhnYYKAZotNE7xVW/xPiw5YqxClBgxIJ4kV8jS/XYbTApDxxhjxVz
 mMeUW2Bb/rcMzCkL9l0Odjg8E8FuZCDnddrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpFsfzb8XuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJWyL15Kw3JVgqBpQj9OV0IUZC6
 PVIBglYO3hvh8ruqF66Ys9Fo517aeXOYsYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbfu3yGkG9FbgAv9Sa4f+W/cwRY3yLHwGNHUZsaLVYNemUPwS
 mfurz+pUklBZID3JTytriKet+yWghjHQ9xRSLmK7thVrgOC7zlGYPERfR7hyRWjsWa8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJ4EfA+6QyL4rrZ5UCeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWdi9T0HXT8x
 m6MpS1n37EL15dTjOO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComV/lhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:1G3TI6yNmv9KSzG6tnA5KrPxt+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIG/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF9nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1sop5PzuN+d3B+3Z
 W1Dk1ZrsAxciYoV9MNOA4ge7rCNoWfe2O6DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="83880384"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exwXJntPFRqmi3gGk/KKFwJRujL9vG9aJSu/T9yRnkVJ3vqHfF21d22k1AZhXdzHE0VIdbzoOJB0iuwW6BGPGao1lC81qolA1TaVX/QUBW5gAgYs7m0+A9JQkRdhrWecC1XeKgy9V7DtI7ob1jINF/AfoHEIYQqFv/aexcb3LZZP6GLnRGeAmFlB2zYBspgLBAbf0omI20RtrgG2JaK0GpuqhXYgd90cblsXUPdRtZ7qTVgyC+jNcQSjgoOZkiLdZorat6vhjylDpe/I8QnThr+DHNw06XM7XSraFg0+LkwmM09pGpbpVR5KN6B0Jc+SzaHAvrZDRa7ExOjuxK/EmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFkGVCZHAGo1wdrcRmiPXjKOM1e/WcvhQd2kqO6ZyWc=;
 b=W88L4NC0K4ez8eFFlr1AHfkL6cKkjM7xX1OurmG/tic2r1X51tmPDDRGlRqVjDAt9/TjF98UBlb3fvQiWwiFMMPWZMTQQ5zdLAu0ll02M4KU0yZj173vqHgVMuBt9cmvlYisf7+P5QqB8qZJpFtJVeb+014F2nWDpF+gtCVuJTYa1nmQyKM+cl9nSOd7JrhdEoBCVuMqXAIuRk65DfLC4qb/0QX/0t/nB+h3oJLc7GgCeD1XImOqQE/LCRajNfXS9PGYFJA0HE6Gqb6Vt+AFhxF+EFMsXwhzMQ02iiHNRg8iEW3WHaapEmpiqMd0U0PBKAN17VNwXWjEnh0gQ6d1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFkGVCZHAGo1wdrcRmiPXjKOM1e/WcvhQd2kqO6ZyWc=;
 b=g9UIuYRq0+4x/pyf0TeJAmWW/KpKDiCWdrOygC7AFmMtOT0eZT9aJ7/riMXo7BDDIEoosBiH3SlNyEwXB0xe+1z+iFHDvNmy8qSSmd3i68a/3XjYSiEsTPyznhzO7gCUiTZQwg+EuhKKm3B6iSD7n6ldkUVDm5kpkHuTWLTeXuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 26 Sep 2022 17:58:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Message-ID: <YzHMDIxjXQ+txtwy@MacBook-Air-de-Roger.local>
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
 <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
 <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
 <YzG8Ln2cYTuxF513@MacBook-Air-de-Roger.local>
 <YzHEcdCtch7lKh4G@MacBook-Air-de-Roger.local>
 <f8c080ca-33a1-ab15-963e-9c5c02c99bce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8c080ca-33a1-ab15-963e-9c5c02c99bce@suse.com>
X-ClientProxiedBy: BN9PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:408:112::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f64a554-3e38-4eb9-2e04-08da9fd7e7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3AvFTBGP2eK1hCQAOLLO1Ido4ZN3l64mL8igbH4eJ6Jo/9UCBvX5TgTCXEWYOLWi0KK7KWDpaJZlG/5fmI672h7XVQz2eJ0XnsqjxpWySYs9ljgNXMmTY871e3EZwEtAWsSfpHAf9xiWJn68oAYtaZcnc5Wb6AyiOJ0lzta85QzuPJltMDiVW6ttojg+FCegGyHmDn5VMZqzw+pGi87T/0XWFh28CDSJdaJ0vM3hfs6Fh/1E4ZpxIEfB/YDHPjd7Kp9AWeRt9jrQLfVAoeeI2RF0L4Ct46Ps+ziHGsw3l9HAJOfabK8Cjc3t7/ZU2/qHVOYg2NVoE3v7Nz21xl0rpDrIFkJgSC9HS9g0HQyVfnBAYR8wCYOlOTLONfzkeR3/wJHiIr3/3sqgqCn1v6gPcAWo6YA1aM/M96bA+xOmpsqTNTHIn6N4mUbI+cxchJpMZN4mYadOiJ/Dpa8zYsyF7zSuJF4PL0fpI9xHA2FG6bfH842J++BWY69mxUicTCQ9omXIwd/uBLktE83ah+2AppLTda557lr0aB5enkCHRRuxxiIzhmyJbqjDq4P1vcxwMzEnYjxoTuV9gX6BNY7494NuW23sNHRjsgqDkIGID7oxcBJ7iB54OpWnQo1UWWQLw2VXPoiWfRGuzYhBYcKvl/lSj4vMevWPuM1acJ1CPLFD9l0iOftmLxRMeyv8u3Wc2qZeInTlu1P1xdwqchRmoBpOm+q/sEKkDMQmuQEAmAv+A20LObhd6AV4f5E9bH7v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199015)(8936002)(41300700001)(5660300002)(9686003)(186003)(85182001)(6916009)(54906003)(316002)(2906002)(6486002)(478600001)(26005)(6506007)(6512007)(53546011)(6666004)(82960400001)(83380400001)(66556008)(8676002)(66476007)(66946007)(86362001)(4326008)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnBwcFJxN0hId2E3YnVNZjZ3WkpnY1IvVG5oUW5nNzBUTlRSQWtVQ1dFdStG?=
 =?utf-8?B?OFVZOWJYa0VjZ1E3UFovMU5UNkVwa2MxMm91N2psVmJMNmtMQjJjN0k1eFZ3?=
 =?utf-8?B?Mm1FUFNaNTNRVFQ0M3RLU3BmSlNqQnozdzhJQWJFVGxpNWVTOHZab05nc0RP?=
 =?utf-8?B?NkhmYnRPNmtBbTIwSGZlaklNN3k1MkM5N01JRnBTaDFvWXNZenAvalBMZUt2?=
 =?utf-8?B?NnV0WTRRT3BqaS9najhubTBiVDZHM0dnU0RPL01HcFlPczl0bzBJUk5hL3Zw?=
 =?utf-8?B?OW1rZVhaT3VXRWVBa2NYWmFMa3F2VEIxZ1ovUHQrMjYxRytOdm9lZDZKV1VG?=
 =?utf-8?B?c2JxWHF3NFRVQy9TZVVHbGNRZDkwNnZUZEhBalRZRU94SHJUYUxaeGNZWnA3?=
 =?utf-8?B?aFJyRUpObW9UZ09Fd1lkSHpSZGZ2dDA4ZzRBS1lmT1VxckhSSDNiQW9leFpy?=
 =?utf-8?B?SmgvdXVEYWxyNjJpaVprRFZBWlZrd1VTcGRTUFVTTklORjNPRUVvUkI0bnVz?=
 =?utf-8?B?QVN1dU1rcE80bXBEcVQ0Rys3b0lKYTVRdGVLNTd0UzNZSjBsWDRSZCtWNXdN?=
 =?utf-8?B?V1dERmJqd3NLZXBrNTB0UjJwWGFkZTNFMVRwQ0FNdGFXMmxZd1dSdVVOQnUy?=
 =?utf-8?B?eVlKRklWMllxQ3RGZEtzSkZ4NFNreHhNcGF1K01oa2tZakNFblYrVkRlYTVO?=
 =?utf-8?B?S0tCWGIzbG1hMGNKODVVYmNITVd0Zko1NjJpV0ZrSFRVQVNzaUhCZzN5Tmph?=
 =?utf-8?B?dFlwSmJ1Vy9Bc2JlQitjVlZha1p2Yy91bHFkSEFjOFBNa044c3RoQWRNa2Fz?=
 =?utf-8?B?RzkxV2N6d3Blc2NlSERvTmhFdlN4UVU0eEk0a3JWTmhPc2YzUDFjWmlkQlRj?=
 =?utf-8?B?RldBZzdpWkwwT2xJQlZydmxPdUxHK0V3RSt6ZlpJT2dIOWRJMWZVY0puWlVy?=
 =?utf-8?B?TUNEQ2d5S3FwVnkyb0lGODl1STJVaUYvN0FXUXk4MzZMeDF6OFJYR1FPRjI1?=
 =?utf-8?B?UlJMSks2K0FsVWNjSjdFeVZlaFluNnZqL3lTclF6TWxjcUp4L1dOQjdEdWNj?=
 =?utf-8?B?VlJReFkvQUI1ME1EQk1mRThpWlk5S0xRamtsWFhvYlVhZENiSnV2eHZWbWZ5?=
 =?utf-8?B?UjRXQzluNlNmUXU5TzhOeG1JYnlwWE15V3Nub2xHWEJxSEwxTVZVbVhSL3ln?=
 =?utf-8?B?cHJsa2toN3JnNU5lNjVaL0VEZ0crT011bUlEb0c3ak4rc0FMc2xrRk10aGJa?=
 =?utf-8?B?QUF4VnVJbnp5d1FPN1o3OFhFS3JSZkQ3eEM0QW9NaUluRGtXYlhLMDBUOHd1?=
 =?utf-8?B?YjBqMDlDVlVpWSt5MUhsQkcrTXdkVUZTTnQzemZZUGVNQXNpK1IvNXVnbkNF?=
 =?utf-8?B?OVZ4aHpRUldPbitQNlo4V09pbng1WlFWbVBwNnlJZEZGTkFoTU5iNTZSOGZh?=
 =?utf-8?B?aGJjcUFZQzJjOTNua2FUVmhpT1ZQSWJuVFNScVp1SXEwQlp0cDFQZFlsSjFP?=
 =?utf-8?B?ZlhBQ3FUYkNPSmQ1UmM4TSt5Y01vc3pPcEdNblFya2pKVlpkbVZGUWZEYkg0?=
 =?utf-8?B?SDNuVEdwRWhpWk54bUYwTC9jb3ZEU0hVZWlFaThrN3paSVpnRHAvL1ZiemVo?=
 =?utf-8?B?TVJqSDB3aG9VUHZnVkRUYkc5T2grZmNUUzlKaGlDbHJoUGFmb2ZEcFA4NG1Y?=
 =?utf-8?B?akRUdkMvVTRINCtjQkZQa21XcVdEL294QUx0YzJFV0hiUWNtREpyN2d3aVY2?=
 =?utf-8?B?RGkwYVMvT0YwSFBMOU9QVEg3R2ZldG4yTHZ3Q0ppSjl6US94K0NKeGpZMFdy?=
 =?utf-8?B?SE8ySEpGSnNpWFJiajBmMk1IN1Fac29OZ0tPdDNHekUydDRlYi9yVWljK1FU?=
 =?utf-8?B?ZWJjTXExbklHOE5LaTRhRHk0UlBFdFVGKzR3WGRkZUVrL3l1VVdCWnRaUEJB?=
 =?utf-8?B?V0x0WFBQYUtvT1lSTlNRcVVRdS9rK2gxNVpCZ00wYkFxVUI3VkZiOTV2a3pz?=
 =?utf-8?B?VTRieVV4V0VNZzdUeTAySEZXZUVBNytDTStTRWZabDFaU2JwUy9Db1ZLSkMz?=
 =?utf-8?B?SFM1WkJYaWJDVFZwTkdjK0ZwazBKVFFmTUJFMGNZaGkzbncxTnQrVnpuMkRC?=
 =?utf-8?B?MXlBQjhDYVdJWlc1Uk94cmRkUEowbnNiV01TSis3bTR1dHlXWTB5SFg4OTFy?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f64a554-3e38-4eb9-2e04-08da9fd7e7f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:58:08.8613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMT1UgEtsRLZFZajb7Un07BFdXN98nqrzyFD+g+Cbhe1MX4H3s9ySEClp7/c6/vqwkGV/aNiZDxoHCZSnvBu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079

On Mon, Sep 26, 2022 at 05:36:41PM +0200, Jan Beulich wrote:
> On 26.09.2022 17:25, Roger Pau Monné wrote:
> > On Mon, Sep 26, 2022 at 04:50:22PM +0200, Roger Pau Monné wrote:
> >> On Mon, Sep 26, 2022 at 09:33:10AM +0200, Jan Beulich wrote:
> >>> On 23.09.2022 10:35, Roger Pau Monné wrote:
> >>>> On Thu, Sep 22, 2022 at 09:21:59PM +0200, Jan Beulich wrote:
> >>>>> On 22.09.2022 18:05, Roger Pau Monne wrote:
> >>>>> And if we were to restrict the calls, I think we need to clearly
> >>>>> tie together the various places which need updating together in
> >>>>> case e.g. the condition in epte_get_entry_emt() is changed.
> >>>>> Minimally by way of comments, but maybe by way of a small helper
> >>>>> function (for which I can't seem to be able to think of a good
> >>>>> name) sitting next to epte_get_entry_emt().
> >>>>
> >>>> Such helper function is also kind of problematic, as it would have to
> >>>> live in p2m-ept.c but be used in domctl.c and x86/domctl.c?  It would
> >>>> have to go through the p2m_domain indirection structure.
> >>>
> >>> It would need abstraction at the arch level as well as for !HVM configs
> >>> on x86. I'm not sure the indirection layer would actually be needed, as
> >>> the contents of the function - despite wanting placing in p2m-ept.c -
> >>> isn't really vendor dependent. (If AMD/SVM gained a need for a similar
> >>> helper, things would nee re-evaluating.)
> >>
> >> Maybe it would be better to add the calls to memory_type_changed()
> >> directly in iomem_{permit,deny}_access() and
> >> ioports_{permit,deny}_access itself?
> 
> I'm of two minds - on one hand that would nicely take the call "out of
> sight", but otoh this would feel like a layering violation. Yet then
> maybe it's a layering violation no matter where that call lives.

Kind of, I think it's slightly better than having the callers take
care of calling memory_type_changed(), and prevents new users of
{iomem,ioports}_{permit,deny}_access() missing the calls to
memory_type_changed().

Let me post what I have with this approach.

> >> That would also allow to remove the noop Arm memory_type_changed()
> >> halper.
> > 
> > Correction: the Arm memory_type_changed() needs to stay, as
> > iomem_{permit,deny}_access() is common code.
> 
> Right, or we'd need some other arch abstraction. (I wonder whether
> long term Arm can actually get away without this. Even on the AMD side
> of x86 I don't think it's quite right that adding/removing of MMIO
> ranges has no effect on the memory type of accesses.)

IIRC there's no way for the hypervisor to infer cache attributes on
AMD SVM for NPT entries, but maybe I'm missing something.  Guest MTRRs
settings are completely ignored for AMD guests.  I'm not able ATM
however to find in the AMD PM how effective cache attributes are
calculated when using NPT however.  I would guess host MTRR + guest
PAT?

Thanks, Roger.

