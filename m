Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0214A6193
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263670.456488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJa-0001rx-TU; Tue, 01 Feb 2022 16:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263670.456488; Tue, 01 Feb 2022 16:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJa-0001n4-Oj; Tue, 01 Feb 2022 16:47:34 +0000
Received: by outflank-mailman (input) for mailman id 263670;
 Tue, 01 Feb 2022 16:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEwJZ-0001jp-OE
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:47:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a4127d-837e-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 17:47:31 +0100 (CET)
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
X-Inumbo-ID: a4a4127d-837e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643734051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=u1dO4eBn55di1Lq/HhuItdj6kXzHCzDMo02+M+HL1Is=;
  b=GEXyZXXpbQB8iPefXO+3Hohx1BGBte4GX2IjyACJ4HinwTOGlyQH4ESS
   p44xSPrteRDy7lYPCL6LgaXIgWLDzyli7EhsaBkNPP0pKK3FL5z1rdjJV
   pkiGwKaxgf6RLLDXYC8tAVjP0jzi2H+Yt/NeDczG/sU4X4HP4PA3CsI2D
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xKtRs4ZYUrK/c+bq0gfX4sZbj+6/mKsP0jxfg61r8htriJsrG0stG9YbJzKKN2daRSOQ6gCSBS
 daSKPakW4vjEqru3uM58aIqXCkexGD8QDf78v/RHLKgkOTHiPPAMw5xebrEnrapoXvLD5q46Bv
 wsE7cjgA4q3gIr2LOMpLEeTizhMOOHvme+a3xaL+hYG2n6lJbxCNqPtYF3bR6d9xPeG7Yb8tXi
 JXg2wqkBaEb3SWYsheApnuB4aCBaEYi/QMGjCYH8sougOIgFKA0WC7I84ut3rvJN5EIoChJCjv
 sleRlMEXzobiUdlXJ4tPaS6U
X-SBRS: 5.2
X-MesageID: 65424817
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kXljwKJcnOEdMy9uFE+RN5IlxSXFcZb7ZxGr2PjKsXjdYENSg2QGm
 2FLCz3Sb62KYWWmfdxxPIzjoRwFu5fWnNQxGgNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB21wttR5
 OcOiqahYi0FP5DLweE5dSVHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UuIMCgGdp2aiiG97vI
 JUwOR9maS+bPQxxORQ1Aqsfkdan0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibcdfk1ucp
 2nG13/kGRxcP9uaoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdyHlq16ojF0jYct7OcE71QbUz47y3xnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzjNAuBRPtfNi2mUBb7zt6wowGGxFQHpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxoCPzItgAvmAidS+F1/ronxezO
 ic/XisKvPdu0IaCN/crM+pd9ex3pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pDjdcDm35vrUuOFcGT50n2itK2OS/KIYrpxXPTNIjVGove/lWMm
 zueXuPXoyhivBrWOXiKqNNDcAxRcBDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:tUIRvKBdTNCFMs/lHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MA/hHP9OkPQs1NKZMjUO11HYSr2KgbGSoQEIXheOjdK1tp
 0QApSWaueAdGSS5PySiGLTc6dC/DDEytHTuQ639QYScegAUdAG0+4WMHf/LqUgLzM2eqbRWa
 DsrfZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLokys2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REYGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUATwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+aZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUx4S0LpXUN
 WGMfusp8q/KTihHjLkVyhUsZCRt00Ib1a7qhNogL3R79BU9EoJuHfwivZv2kvoz6hNOKWs0d
 60RpiApIs+PvP+UpgNdtvpOfHHclAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,334,1635220800"; 
   d="scan'208";a="65424817"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMeEUCwpWK9VZ+B236nOArdUl6nrYP3ltdqTTEANMOqmH3W2cz8m5NmawTyNyyEmVUxSPFe5iKcAW0CAq82BPD4dnj1VqQlPhr8kwDEEM3/gBbcs8Rtd+Vs9+WrwOlrdKot9zGNpmNiSZX3ghx/0AePs0h4MlL4QciIrCRs/kPcKvHcM2XEqKooRoD4obgnwZtG35HFp6DpT9GbXDEPUzNeQaKEAvnY+HiRHresAkVaZV36SbMmUw4jbcH+J3bwbxzkt8UqTIhRgA0vjkrMxB2Is5ME37JegfYHvy6nJMyCxf3hv+idWRtgjBmsoYIMkx0duWJK39ybp9bPWohtJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mABKGaVPSIVWoLQWeWEbnGj7m8sKHrppce4L4FKSrdE=;
 b=Gjx12Yj5rG9iIf5XFm39PgaUQ+Rd3WwFX+p173qM4sAl6obYeutKggPc/WY5CgjShYcuV8tPpZNSZbfuCIoV2YftQY1Bq176TyD7b4ozIDL+oie4LXCWVIewk0cU0ta3T2xvV17latpYBctM4t1yNjqkwSm8p/9pyGKy9wdCU9s0DZGZaWqgs9xoLGuJWUsKd8h6oeTvkxDbgIrn2kqo4NUs6njgDnjAJY91HPk0Z3Dam0Q0FEyIcv2ACPGpuZroKJivoOlpBver4lsR9QFTpjbzwP8eNIyVWxMsTenAOX3BAiLBiUgBsPm89uRzbvRdUdY7YdDLi5ASWvMsibia1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mABKGaVPSIVWoLQWeWEbnGj7m8sKHrppce4L4FKSrdE=;
 b=cikYRLEVNyli3+/4ITSeTXLE3jQlvS41VI90NwUEgo0hNd7YGIxcdCuNzKIKcQ7YV1jRJp6idsVVECTytIsBTeHTbL0BlTP0LRiZRN7VqC2ybI9GFeDgZIAHpbJNnCc4IFJl518nTI0aUc0PC6D62uhg/wVJFK81urxGXVhuC8U=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
Date: Tue,  1 Feb 2022 17:46:50 +0100
Message-ID: <20220201164651.6369-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201164651.6369-1-roger.pau@citrix.com>
References: <20220201164651.6369-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0355.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7ac55c3-fec0-4875-3fba-08d9e5a286a2
X-MS-TrafficTypeDiagnostic: SN6PR03MB3565:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3565532E89C9BF1F8629206C8F269@SN6PR03MB3565.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0MAStdqIH/um8T17wRymbIvjhBnUCGbQCBc5UeUSTCMgfe9xKO12r8QI0euI4n1gRz1+43HGEUEFSmRyycoL1crX9UckgU7mAqH8cyg6cTymZJTBTAGhO14JQjZK4J68qtIkyHTH0C5xwTj/jt4FfL708z3SFDNY1Kkt19ApfWva1qBnrV8bEfYCV7GOrtNZZh0u485XkR3c2cd9TmImjcJVV7WLTAnTsdwgYU0IDzLhQf75iUSFNkkYymGJAlX402crOuXlbkLd2QtTLLKgCLYIwAsbKQRYPtN6HXmb9WhFhB54kyAfNaRKLjgVQzR0e+wzsgxA8vXw3SpACf0VPY/SpMintOe0XvA5mCdwaLv5N34v8Wx5eCOr7u4Dd2tIVxTkEJIV+xOZ0Z9e2KVxMnoV3okOWNgAwyaClSFmWJWRCIB4kKvXH1UMBNLrwRCph1X09qJVUDnnconDZS+JtNxU1r3yo7Khh6hLHnsa0jVWutVx3RwZReo+u7h1EQNejOq7YBr60whmpDrxcyEjQ6odg9owcQkp/VJJ5QGxCELAd/qezHVC8Buis8lT4SmEYFTmHdFoRPN9oEhQ8p2Lu57ZxHsbcxqvDywRzEONbY4ZZEOM4E5HEi2lCTGdzerA0O9gPYMiZfxZJyiiTxzqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(66476007)(66946007)(8936002)(4326008)(8676002)(508600001)(5660300002)(66556008)(6486002)(38100700002)(83380400001)(6506007)(36756003)(6916009)(82960400001)(6512007)(26005)(86362001)(1076003)(186003)(2616005)(2906002)(54906003)(316002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNpb290d3dSamR6WCtOZFExazhpZFgwTnVjZXBKWjZ1VlltS3A1YThSa0lv?=
 =?utf-8?B?K2pFWmNxcGhPbTVrRnk4TkRzNG9tYTZlaytsMkRJQVhWQW5DdCtCZVErUGR0?=
 =?utf-8?B?MkhHcjI5VUg1ZEgxajliU2VHOVJrUXJ1L2tJV0FaNnp1SU5hREt4L25zTTl6?=
 =?utf-8?B?aEs1WkRLSEpDSWl6S2I0WkF5OW13ZG1iMVNaVjdXc2dDNU1WbTE1dzd1Rm9Z?=
 =?utf-8?B?M1RXZ2drRGo0NlZ4ZUlPcHcwVGU5ZUVFNGxsV3JzNGd4UGFwYWRNV01JL1Rj?=
 =?utf-8?B?eU00ZVMrWTVTU0w3c2NFb1FZS0JlcklhZHVFak1XRDZTOTRhdlEzS3RRcEpQ?=
 =?utf-8?B?RjROOHZmcHFpOFR5Q2FML2lpU0VsSmZSRVNVdjJDdFhFWEFERTNGc0srNFpH?=
 =?utf-8?B?d2g0am5OM3cvYVBGMGEvZ2J6QUlaN2JjSUJ0L3Y2VmNRYUhDblhrdlpjL2lk?=
 =?utf-8?B?aVJBWk5ucG0xZW1aSENJVDFyR3MrNzd0Z05MSi8xU1RLVThWZW9qZWl2R1lu?=
 =?utf-8?B?ZkxwNnFpTzBkUWRBTndjODI3cmNzVlV6MmJDVWFUUVRobEM2VDZMdk1ENzNE?=
 =?utf-8?B?d2pVbXN5cHp1cW9CV3FFNU9tT0EwMHBVZTVIWm11bHg5Q1ZQQ09RQnE4V0JE?=
 =?utf-8?B?MDh3dkc2Yy9DcXNsNE55Z2VrcVlkT3VJc0tmZ2V2TkkxYlUxV1R6MmJCNjg0?=
 =?utf-8?B?dkZpSEc0ZzhZZ0t5NGNoejI3YlNUWVlqYnd0Z0dvK05wbWFFY0hwOUN4bkZ0?=
 =?utf-8?B?V3gvcEJNSlcyZFUzRFFzQnlCQTNhSEVpd3RiWDRsN3VjOENrdUdZNWZRNzRK?=
 =?utf-8?B?aVExdmppc2RWZXFScVpnWWxvbjdjbXo1Y3J3aU16N2ZOTGdKQm1DckxQQTVP?=
 =?utf-8?B?RnFGUkc0bFZ4TENqWmwranpWUy9FVitGeTZSU0R6SE1OeUZLNmJEOGQ5aUNQ?=
 =?utf-8?B?N1RoaUpXbTZpcVZGY3dreXNDVGdvcnZmS1I2cnR5cEhIR0J5eFdVRVp0M2Zt?=
 =?utf-8?B?VjdoRGdIdXYvR1g3czlqeWVkRlRWOTk0U1FaNnpUZ2lKZjdJbUQ0U1pmZTBJ?=
 =?utf-8?B?Vyt5aXFaSC8zVHptTXFsbmIwYzYzRjZHdmR1U2VIRk0vaWdJZDY5RmVEbXB3?=
 =?utf-8?B?b0xSNDZwVnJCZTNzSE45eHF1REYrSmZwQVl2dVdFK1FQQTE4M1F1UmNiSWFH?=
 =?utf-8?B?eDlrLyt1TzFqTUxKZ3RGS2p3Zm5DWUkwZHhOczNsNGs0aUhybDdDTjVEU0tX?=
 =?utf-8?B?dDJoTWFCZkNPbVMzUzJwNEViZERvQWplQmtnU1VBMmZWdnpFNzNobExLbGxQ?=
 =?utf-8?B?WGJjaDJHTUk4VEFVc2xhWFB6VW5heEh2dHpMdnhRZndPei95VWR1Yyt5ajZ6?=
 =?utf-8?B?bmpmU0dQN1ZYeE1hRmVUUWJlcUp5QzVnTVU2UU03VDhYUk1ZNi9LYk9GQXE4?=
 =?utf-8?B?VWZOZFQvL2g4MUdDQXZ0TVRNL05yOFF3K0JwMjhRbUhvdXRzMmRVaDRNTTZZ?=
 =?utf-8?B?NUErc3RrUHBEUVJFazlWQ1F1TjhZY2V5UFloZS90QnU3MlFlL2VWWlRxSXp2?=
 =?utf-8?B?ZmRCMERUTHlKa1VnTVVVK2ViNGdTMmxwTVV3dlNYbVZCSFRBaHZvRG5yY3Mw?=
 =?utf-8?B?SGVvUVRTMDAwcE9xT1RCKzJnNUdxd21pR1dyUUtRM0E1YS9yczZmUFpONzgv?=
 =?utf-8?B?WDdPQ0ZFSE91Qkg3UE82OW1HaWYvSENZOHJoTWpXSU9VV3J5V0t5NjZRbmhD?=
 =?utf-8?B?dUxZbkhibm8xTzdDS2MrYVkzN3ZvdkpjNi81N1kzTUVDVERhcWw1c05SYjdJ?=
 =?utf-8?B?NU9yNThlTjNPZWoxdmY0VzQyU0ZjQTY5M05CRy8reU5FL2cwZFhhd0tJanJo?=
 =?utf-8?B?MHZ1cUZoUDltbjQzRXgvRHdqQ3lsMU5vUGNrZVY3dURWY0JxK3M5enFFdy9t?=
 =?utf-8?B?YTIvNWJJTnRPbDFPZlZzNkpURkVVbVliNW16ajVjdCtJWVRobGhMdnNYMXVN?=
 =?utf-8?B?T0U1aXlPVnlMQ1ViL05TVU84ejdNbDE3aHlqOEkvL3gvTEwzanhYUTZlT2gv?=
 =?utf-8?B?UlhKR0orT0JmOG15QVc1NmVBUDhna0VBTnhueTd3ZzBhbDhGaDEyS2E1ZXFJ?=
 =?utf-8?B?ZUxta0NTU3JzNU5IY1BYOXJjdEJXVnF5SENHdHRZM2FJZmp6Sm1vQ3FqMHFL?=
 =?utf-8?Q?Mvwp8eqG09doXyJm4/ieH5k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ac55c3-fec0-4875-3fba-08d9e5a286a2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:47:25.7284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UC8rz0vPzWgSc1o/xPRDe7TcCIOcUnvYgnBRPbkR/H2G2EIpp+Ggt2DI1OX1EI3Am+MPShsxS4XON875wPT7Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3565
X-OriginatorOrg: citrix.com

Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
hardware has support for it. This requires adding logic in the
vm{entry,exit} paths for SVM in order to context switch between the
hypervisor value and the guest one. The added handlers for context
switch will also be used for the legacy SSBD support.

Note that the implementation relies on storing the guest value in the
spec_ctrl MSR per-vCPU variable, as the usage of VIRT_SPEC_CTRL
precludes the usage of SPEC_CTRL. Also store the current and
hypervisor states of VIRT_SPEC_CTRL in the per-pCPU spec_ctrl fields
at cpu_info in order to properly context switch the values between
Xen and HVM guests.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c                 |  7 +++-
 xen/arch/x86/cpuid.c                   | 11 ++++++
 xen/arch/x86/hvm/svm/entry.S           |  8 +++-
 xen/arch/x86/hvm/svm/svm.c             | 55 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/spec_ctrl.c               |  8 +++-
 6 files changed, 86 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index a8e37dbb1f..c3fcc0e558 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -687,6 +687,7 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
  */
 void amd_init_ssbd(const struct cpuinfo_x86 *c)
 {
+	struct cpu_info *info = get_cpu_info();
 	int bit = -1;
 
 	if (cpu_has_ssb_no)
@@ -699,7 +700,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 
 	if (cpu_has_virt_ssbd) {
 		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
-		return;
+		goto out;
 	}
 
 	switch (c->x86) {
@@ -729,6 +730,10 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 
 	if (bit < 0)
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
+
+ out:
+	info->last_spec_ctrl = info->xen_spec_ctrl = opt_ssbd ? SPEC_CTRL_SSBD
+							      : 0;
 }
 
 void __init detect_zen2_null_seg_behaviour(void)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 29b4cfc9e6..7b10fbf12f 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -551,6 +551,9 @@ static void __init calculate_hvm_max_policy(void)
          */
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
+    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     /*
      * With VT-x, some features are only supported by Xen if dedicated
      * hardware support is also available.
@@ -590,6 +593,14 @@ static void __init calculate_hvm_def_policy(void)
     guest_common_feature_adjustments(hvm_featureset);
     guest_common_default_feature_adjustments(hvm_featureset);
 
+    /*
+     * Only expose VIRT_SPEC_CTRL support by default if SPEC_CTRL is not
+     * supported.
+     */
+    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) &&
+         !boot_cpu_has(X86_FEATURE_SC_MSR_HVM) )
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 4ae55a2ef6..2a0c41625b 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -71,7 +71,9 @@ __UNLIKELY_END(nsvm_hap)
             mov    %al, CPUINFO_last_spec_ctrl(%rsp)
 1:          /* No Spectre v1 concerns.  Execution will hit VMRUN imminently. */
         .endm
-        ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
+        ALTERNATIVE_2 "", STR(call vmentry_virt_spec_ctrl), \
+                          X86_FEATURE_VIRT_SC_MSR_HVM, \
+                      svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
 
         pop  %r15
         pop  %r14
@@ -111,7 +113,9 @@ __UNLIKELY_END(nsvm_hap)
             wrmsr
             mov    %al, CPUINFO_last_spec_ctrl(%rsp)
         .endm
-        ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
+        ALTERNATIVE_2 "", STR(call vmexit_virt_spec_ctrl), \
+                          X86_FEATURE_VIRT_SC_MSR_HVM, \
+                      svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         stgi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index c4ce3f75ab..56c7b30b32 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -610,6 +610,14 @@ static void svm_cpuid_policy_changed(struct vcpu *v)
     svm_intercept_msr(v, MSR_SPEC_CTRL,
                       cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
 
+    /*
+     * Give access to MSR_VIRT_SPEC_CTRL if the guest has been told about it
+     * and the hardware implements it.
+     */
+    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
+                      cp->extd.virt_ssbd && cpu_has_virt_ssbd ?
+                      MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
@@ -3099,6 +3107,53 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_virt_spec_ctrl(void)
+{
+    struct cpu_info *info = get_cpu_info();
+    unsigned int val = info->xen_spec_ctrl;
+
+    /*
+     * On AMD we will never use MSR_SPEC_CTRL together with MSR_VIRT_SPEC_CTRL
+     * or any legacy way of setting SSBD, so reuse the spec_ctrl fields in
+     * cpu_info for context switching the other means of setting SSBD.
+     */
+    ASSERT(!boot_cpu_has(X86_FEATURE_SC_MSR_HVM));
+    if ( cpu_has_virt_ssbd )
+    {
+        unsigned int lo, hi;
+        struct vcpu *curr = current;
+
+        /*
+         * Need to read from the hardware because VIRT_SPEC_CTRL is not context
+         * switched by the hardware, and we allow the guest untrapped access to
+         * the register.
+         */
+        rdmsr(MSR_VIRT_SPEC_CTRL, lo, hi);
+        if ( val != lo )
+            wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+        curr->arch.msrs->spec_ctrl.raw = lo;
+        info->last_spec_ctrl = val;
+    }
+}
+
+/* Called with GIF=0. */
+void vmentry_virt_spec_ctrl(void)
+{
+    struct cpu_info *info = get_cpu_info();
+    const struct vcpu *curr = current;
+    unsigned int val = curr->arch.msrs->spec_ctrl.raw;
+
+    ASSERT(!boot_cpu_has(X86_FEATURE_SC_MSR_HVM));
+    if ( val != info->last_spec_ctrl )
+    {
+        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+        info->last_spec_ctrl = val;
+    }
+
+    /* No Spectre v1 concerns.  Execution is going to hit VMRUN imminently. */
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index b10154fc44..a2c37bfdd4 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -39,6 +39,7 @@ XEN_CPUFEATURE(SC_VERW_PV,        X86_SYNTH(23)) /* VERW used by Xen for PV */
 XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
+XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(27)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 64b154b2d3..2c46e1485f 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -399,9 +399,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
-           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
+           (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
+                                                       : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
@@ -1053,6 +1056,9 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
+    if ( opt_msr_sc_hvm && cpu_has_virt_ssbd )
+        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
-- 
2.34.1


