Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FE467346
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 09:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237184.411356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt3xM-0006aN-GA; Fri, 03 Dec 2021 08:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237184.411356; Fri, 03 Dec 2021 08:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt3xM-0006Ya-CZ; Fri, 03 Dec 2021 08:30:12 +0000
Received: by outflank-mailman (input) for mailman id 237184;
 Fri, 03 Dec 2021 08:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRzA=QU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mt3xK-0006YU-Ll
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 08:30:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38905f1c-5413-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 09:30:09 +0100 (CET)
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
X-Inumbo-ID: 38905f1c-5413-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638520209;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SUQqD9FnClH0FVHKazvAcSxaS1OZN3i/43vDKb95iE8=;
  b=MvQqfIwSX7S9NrhSNQ3eshM7tXqh+NTityQJE1cawA8QVDN3+thV61oo
   DciEoMDHPG0KtknDCbE130VFtziD+lH2peXqHstk7yVQyQkvSHYAzs7uj
   GnaqwGQtPlyUVOQbK2fuQgBKSePGed5qDbbYrL/jtG/OMrAfygrwlJC9U
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bFpl2axIIu1/eTEsOhM3Exb3q75MdhaxvuKV9H1DvK99Z9uLGmsoZ2TUb7O8W3dKNyhaGIh4Ik
 6h7MGUY0ORq9gM9VjrVoLCb9MDxS9IyiymxovqXVKGlpwfPLprHOcTp0r5IqqeUwyP8zwkUTGw
 5nvbottfDw0Ep3ZepSleXFZTbl67B52nOmfVlMAAylaqFfzJErKoHsOxigzc4hQyOtvkT4pYMn
 T3v1QCzHZZiKL4+/mBQpyiUQ6OxaM7yGxuJVqMny9ephnSqnB+5VrsEzc0gogS6j5K99EVzf9+
 mYpoSaggPS8w9VSJBqPiqbWD
X-SBRS: 5.1
X-MesageID: 59204273
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UciwZ6B3YP4HuBVW/8Tkw5YqxClBgxIJ4kV8jS/XYbTApGwi0DJRx
 zdOXGCEPPvbN2akLdsgOt/lpBsEuJXcmINmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Ug7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/hQSptNNXy
 8l0nKepRCkYZYTMnOofakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvSQvYMCg2xYasZmGKbnQ
 ck+SDZUPRn4ZUJdKHkeGosPpbL97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibdpRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+MLyCqO7KnI2i+iH2Uqf2VoaNgotvZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSLhRqjBNzAJrVkg
 JTis5PFhAzpJcvS/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZZYJme2O
 BGI6Fk5CHpv0J2CNvQfj2WZUZtC8EQdPY69CqC8giRmPPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:/TTNf6yO8MA8vYrfXe6gKrPxtuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurAYccegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.87,283,1631592000"; 
   d="scan'208";a="59204273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esnWvM3lzlAJ3ulfW3jx7j308nDG2JF8vTCQjXTB9yuY+EJLjReSJ7j5cjdXwwmChto0mEfC/Z2KWQ449zdxie8AujgMG2B+z6Bg5bnqvrJOZ5ummV4kzpdr0JV45Q/9SofeoV9iD17pHjIkOfeYekSj+8qjqhTcHsCXgENPzcM8VAmEeaoIyf+PHt2OLHVvKEX91V3HZrlacLP83ZUionE3VrQz9coTB1NtU0ESqOYTOvn7zAvEOyF7snI76x18PnXrjWWHFMyFGxSihaSE7Zl5QeElG/vj7KDB0r5Bg5TXf50BBVLQlnb8Y8gsdTXEX0+iRaz411NFmTDQu/PQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg5PdOez0qlAzTY/Sk1COVEe1ZdvJYcu+JsmreuD4lA=;
 b=jKVuFu5/+0tlDHu4DtHWHJKiJN4NlIKW9ewCRcsuQMVjP+Hts+4WuSX845uDbTcuAAnJiofBP/hEgcYXgf9wZx3cLXuHjetu3xNfmSGZ24Jz1sGxCfeA1wIeFVtlNbgUxVXPanBNtnkGSpW0VjgW1l3rij0feBdpIEZql7Xj7XdOTqFSgtbykMytVuGbSBNL+lcSaMAvlA6czaDuokJf8s5oL7EyAXgxrFg6NlVeDP5RcQCQpq6UMGuyyUrnJrkw3ojwZD1I/LJOdKNhSLneJzZEm8v8oyV5x2HOqmwWWHQSnqh6PBwItldi6+JxpjBrey8rcHitut16cyBFQuq+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg5PdOez0qlAzTY/Sk1COVEe1ZdvJYcu+JsmreuD4lA=;
 b=O9IMywkolPhGeAkys8NL5xwWhAifomuroAsHXgCvVSnsS1cqmg2qx+7ujPkzHmWLxv7aEKAq5as0R4PJ40dd2A9yHYuuqh5VLbzSUMto4jc3epRras1RrDIpKw4cQGavKjsTKlz7OQGuuW6jubJwep/UtR0Yq4KHzfmjr2XMuI0=
Date: Fri, 3 Dec 2021 09:30:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
Message-ID: <YanViGSnE+uMwA9S@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
 <YajubFeUclKtpqV2@Air-de-Roger>
 <03dbb062-002a-3770-61c4-4f93de73c0a0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03dbb062-002a-3770-61c4-4f93de73c0a0@suse.com>
X-ClientProxiedBy: MR2P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2cac0a1-cb87-47b8-7e1a-08d9b6371b17
X-MS-TrafficTypeDiagnostic: DM6PR03MB4060:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4060D400926CBDD605DD3D908F6A9@DM6PR03MB4060.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1I1kqNlOcd5poolKiozgDuJPuru6ZeC86WK/UujRi7zcbKch9GnwLaWlbLFSvjDH+mcNB4h5gLzeJeC47PBuV07xxrW1T7D77EbZALsr+amqdgR/F7IOTbp4n8GCnFUQrZT31Gr35ER7nYH3Q3NjqDNBXvYUrIVILgu1cY4s0nCCsdJMuzsZeho55evM9DS/EUKiadZ4t0/9Ks7BMwZNE6J4RBxGGeJ0rlR1EgscgOSj4SqKWPJ5FbRBmYo8znT2dxTHnq7CtrghXquFoosTDCvNHBbdZus4mvHkUQ01PbB3Uyc1El7dFYLE880HKU7xXthLTgKq5o5K8c21s81sNBOxSHTCg5f8oQ9WaIQhFjZEZg3Kt5jSXp1H1F9VQUWdYjxHhHQCOPsFG5lkMfV60keyMBgZScSHdpnD9wvRPjtJhXSs9Tnp38XIi4iOgS5rU8Gs9+LjLKZsL6lEKAq0uQt7rrgBQENpgn9opbWXpNG1SQ3Ld7MlK8X7UKol8pAXnlx/ZOcOOUgC/xXnWV2aMlgvGroqBtVTOSWVYzzKlcoHwRgfvuSCr49wmoijVWWLamzQBQOfBr7Mtxi9IfYpc3RUOcBIoqmNBSIRuxF2FGNuq1r7P8k3GssOzocFfSn3/DAFq7MoFi3HEuIVASJ5fHLzrFafKzM4f2ztgRsue5Q27daLeUkR04fuN8RFtG3g3rvmvphNxlpRQ0b82BfxyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(86362001)(9686003)(4326008)(5660300002)(956004)(83380400001)(66556008)(66476007)(66946007)(82960400001)(38100700002)(54906003)(316002)(508600001)(2906002)(33716001)(26005)(6916009)(85182001)(8676002)(6486002)(6496006)(186003)(53546011)(8936002)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uzl2and2SWFVUmtDR3FHTDkwNzNiR3JFdWNlOUJ5RjM2WG5JTXU0TGFLNTA2?=
 =?utf-8?B?cUFKNHdmdHdpUHFoRlF1aGxadGJLc1hBWUUybS9RRisvR3pOZUdGRTN4WFN6?=
 =?utf-8?B?d0puZ3ZaNXA1V0FPT1BDN1d5bG5KMzRISmJ0Y1FvK2l4SCs4QXh6aGJUNVp1?=
 =?utf-8?B?MFo3TDErSGpMenJRRW5Nb0FWYkRhdmpNYXZPeisvcm5sQmg2eG5rU0xKSEZv?=
 =?utf-8?B?d1BNVVpVUkRtMnVHWVFiSnE4RWxIcFBFL3pGQ2lrNHIreDRaZ2JoZVpHT2h0?=
 =?utf-8?B?MU92VTdHUU1LUGMxU0h1UEI1UVRtK25jTHhlTGI3WmtXcjMwMXRtSXZqbE9H?=
 =?utf-8?B?MDc5Ylo5NGE0czBmcUhUV1F3b3E0Rzh1eWNmRkY0bFplUUMzRGZ3alNyNnJp?=
 =?utf-8?B?YmF3L1hFeVRLM21KbU5RdEIrVXJ4NERwQngxanpGQUJvUDgvbVRHVnNuRE94?=
 =?utf-8?B?Y3o5M2Y1aVlWQnJJbnE1Rm5IaTB2NGtPTG5MSm9ZSVdrYW5RVm1HMFY5ckRI?=
 =?utf-8?B?eU9CbmxEVUZRWTJBcFlLWlQwQkMxQ2U4bTNrSkdHa3RYSVk3TW5VYjM3anN4?=
 =?utf-8?B?aXdHc1AwbkhKdFV5SXI3eVRWZnYweGFZWWJtbW5KaStFMm9QdVdtT1ZBU09l?=
 =?utf-8?B?MUIzVDJDWFA5RXJUcG9lQ0JMb3huRm0vQWh3UjMrTFQ3Vm82bk5UUGJDSGlK?=
 =?utf-8?B?Y1NaeHpRcGN6Qi9ibVJXdnVZbDN2S2JqWlVId3QxYW1zWExJY2hQUzlIM0s4?=
 =?utf-8?B?ZHZRRWFwYlNmb2ttYy9tUjd4ZXhuTGRQTHVORFNrL2hqNzVCQnVqYjBOUHM3?=
 =?utf-8?B?U1RqUmtBeC9RV3dmTlhwZXhNSURaTVJQODFwRzBsWWhiQUh5TjhwMzdYb1I2?=
 =?utf-8?B?WnF1cTg2Mi9IMmpSOFBueVB3dTFTYTVxcWZCTDM1bWlhVGM1dFN5VmNXWWpW?=
 =?utf-8?B?cE9pVUxWTTE0L25Lb3cwdWhZZlhxWk5PZHZlWE9TSFkvdGhwcTFXa29DajNO?=
 =?utf-8?B?ZkdoTk02MnZBL3libi91aTdaWVhlTUMxV3UreUU5UXJQOWF2b3hjY0NQYTdP?=
 =?utf-8?B?V296U1JYSFdudm9ocmV2b3hEU2VpMDBoUXA2OG83NytOTlhIR2Z3YndKMjU4?=
 =?utf-8?B?SVNmSDVjdzViQ2tBQXVLWStXMWlyYTRWTWJmaWlOR1JjWXVHaXZuLzBoeXg4?=
 =?utf-8?B?Ti9yOFc3SnpNOEtBNU1NcWR0NGw3MTVFMDdPbzFKcUYvaU00LytjVHN5VE9R?=
 =?utf-8?B?Q0lyK29lQU1DZzRTUzFrdFZiczUwSDB1MFpxY25EdnhEaTQxYzEzYzlqWC9S?=
 =?utf-8?B?Y0FOWkVZRnZKUjgwa0x5MUNZNGVBVkYvV3h5OThvdmFieEd0Z1dTWWFMWXZT?=
 =?utf-8?B?SXFySGo2Z2d1SUl0UFVjZ3g3ckxpaFdhU0hVbDVSTHhXcXBMRzBDZUJiTVor?=
 =?utf-8?B?NVRxeEhxclVTanFQK0xZbE8zaWI3ekIyejJtK2JlYW0rNTBYcG4zSGJDbUV3?=
 =?utf-8?B?RWp3Ym5aeGhvYTNzY0lSSHpVbU5zSjVTVS9ZbENaSHJmSnZyMDA0TENXZ0lK?=
 =?utf-8?B?ZTZDa2Q3WnMvdXZhMnpLTDFVNFRhR3lpaUR4VlRKalRzZG9OeDgya1FFZmRv?=
 =?utf-8?B?a2hJelUxVUpsRldWaDlMZXc5T3RuaHJiMkVySkNJVnFlMEFSSW8zSGFKdmhB?=
 =?utf-8?B?cjg2VjllQkQ4UkYzei8xbmNiNy9lMDRINFo1TjYrWWFieHUzVnNTOXVhS21a?=
 =?utf-8?B?N1NxcUtMNVFIbHA0c3VseEdjQk9GQTI1MXo4MVNXWHZKMUh2aFpLbkpHV0lE?=
 =?utf-8?B?ZEttZzQzSGdrUG9pemJDOWNoWmM1YWp5M3NPdVc2S0JRZmhsZThqVFpmam5j?=
 =?utf-8?B?NGJJK0FaVzJMOXM0eFNqdFA5empvZ3cweWpCa1FNSG9ROEhiaDd5WGRwSVhQ?=
 =?utf-8?B?eW1EV1F2akdXTmVPVDJLV3NOVzdzV0g0VHMyWWlIUmQwK3I4eEl6MnNyN1pl?=
 =?utf-8?B?a0pVdVJUNEpHUnBHU0hGRWRNM1NoVHFLZTRrcjJMQUpXMUpqalU5S0ppdVBo?=
 =?utf-8?B?QllGMW5EYS9iQm11VVc5Qm51cGdUZXgwQm9wYWpVaUdTL1NaRDNyWEtJR0g5?=
 =?utf-8?B?b3ozd3N5NTBzVmo0UnBRMHY3MDl2YUJ1N0Z3cDFZQk13SmFKWCtjZnk3THNh?=
 =?utf-8?Q?MWpjuf5Vx8LZ1gzefu1ecH0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cac0a1-cb87-47b8-7e1a-08d9b6371b17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 08:30:04.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPpIcdb5b6Fog2kQ23P1rl+vPe41E9pKP5SwUeqON5XI/C2ZvqzniUsoAiCz4uk9152RVSx0ni2sz+CF5qTW3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4060
X-OriginatorOrg: citrix.com

On Thu, Dec 02, 2021 at 05:10:38PM +0100, Jan Beulich wrote:
> On 02.12.2021 17:03, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:48:21AM +0200, Jan Beulich wrote:
> >> For vendor specific code to support superpages we need to be able to
> >> deal with a superpage mapping replacing an intermediate page table (or
> >> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> >> needed to free individual page tables while a domain is still alive.
> >> Since the freeing needs to be deferred until after a suitable IOTLB
> >> flush was performed, released page tables get queued for processing by a
> >> tasklet.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I was considering whether to use a softirq-taklet instead. This would
> >> have the benefit of avoiding extra scheduling operations, but come with
> >> the risk of the freeing happening prematurely because of a
> >> process_pending_softirqs() somewhere.
> > 
> > Another approach that comes to mind (maybe you already thought of it
> > and discarded) would be to perform the freeing after the flush in
> > iommu_iotlb_flush{_all} while keeping the per pPCU lists.
> 
> This was my initial plan, but I couldn't convince myself that the first
> flush to happen would be _the_ one associated with the to-be-freed
> page tables. ISTR (vaguely though) actually having found an example to
> the contrary.

I see. If we keep the list per pCPU I'm not sure we could have an
IOMMU  flush not related to the to-be-freed pages, as we cannot have
interleaved IOMMU operations on the same pCPU.

Also, if we strictly add the pages to the freeing list once unhooked
from the IOMMU page tables it should be safe to flush and then free
them, as they would be no references remaining anymore.

Thanks, Roger.

