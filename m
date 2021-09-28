Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E041B90B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 23:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198481.352002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKMo-0006Co-Ed; Tue, 28 Sep 2021 21:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198481.352002; Tue, 28 Sep 2021 21:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKMo-0006AP-BR; Tue, 28 Sep 2021 21:10:22 +0000
Received: by outflank-mailman (input) for mailman id 198481;
 Tue, 28 Sep 2021 21:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEZ0=OS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVKMm-0006AJ-DB
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 21:10:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1fe70fe-3ef6-485d-b8f0-0d3bec0622b3;
 Tue, 28 Sep 2021 21:10:19 +0000 (UTC)
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
X-Inumbo-ID: a1fe70fe-3ef6-485d-b8f0-0d3bec0622b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632863419;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9N4+fRGodNsBNVOC0/rVAcY6uxVQT5zufJHm3nvET68=;
  b=hYr1i3bI3bsZ4/HSxYRFHpUha5mPzu7u8C33vQxNAc9D1o77DXbsIM0q
   BlXc1jYJvaHr8hU2PttQXZD0Hh0tfgI55hZbuaXKa4CMVe19DDOz0PkMl
   HDocTjm4jK6H5qUbMD85dh01R0G9jq2tKybi745A58v4JT/XDb4hVyDHD
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wqRDboxWTUxU/Xm7MitI1O1eFmfu5R0YIXYI7CMAxS7HMw+19Gwvw/oIGH2bApfe9aorVrd9vw
 oct0oFBo1aCarKmHv/rjlNbMWkMqnzMHKmGRmhNTBDmg1bu6AELa9tfqmvskkJRhYbTnR7g/iS
 28ZoLVCURPUzpGGvBzOkb2F1hJZ1Q2eL/r+kQZkUgSj6u5iVJJ8RLei1z9PjdrpB+yD4nut3gM
 kPapDh2ELAV8JCrXaSJOHfV2Q/ZaDOJhTYBTjP1IS24a3s0LR3ACg+VWOFADgW7QdQaWlB8rC4
 zC5u0OeWQzQJISKy0ZRFEJKo
X-SBRS: 5.1
X-MesageID: 53843409
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fz/Xd6CCj2kXOhVW/1zlw5YqxClBgxIJ4kV8jS/XYbTApGsl1D1Wz
 GcWUT2HPvaPZDD3cowlOY2zp0tQvpLQmt5nQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00I7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/0BTVhd9o6
 fV0mKPpSRgZP6KPuugtakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFh2ds3ZwWTJ4yY
 eJeNSZubw7EZCQQGX0wIYsjl92M2nPWJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKoYE7ey57hnm12Xy2kaDjUZUFK6pb+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS1gaJzabF5heDMUINRDVBdd8Oudc/QHoh0
 Vrht97tCDpm9qCbSHeB7bqKpBu1IyEeKWJEbigBJSME/NvLsIw1lgjITNtoDOiylNKdMTP6z
 i2OrSM+r64OlsNN3KK+lXjYhxq8q56PSRQ6jjg7RUr8sFk/PtT8IdX1tx6Ltp6sMbp1UHHan
 SQelNG/zNkjMsiNixyMT6YvEIGQsqPt3CLnvXZjGJwo9jKI8nGlfJxN7DwWGHqFIvroahezP
 haM6Fo5CIt7eSvyNPArM+pdHuxwlcDd+cLZuuc4hzakSrZ2bhPP2ChzaUOK02npnSDAeolkY
 szDIK5A4ZsAYJmLLQZapc9BjdfHJQhknAs/oKwXKTz8itJyg1bPFd843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyNhVc2q9pMMKrHcSuaDJI3HI6SKqV/GU9Y595m5a8+Sp
 i3tMqOm4ACXaYL7xfWiNSk4NeKHsWdXpnMnJy08VWtEKFB4CbtDGJw3LsNtFZF+rbQL5actE
 5EtJpXRatwSG2+v02lMMvHAQHlKKU3DafSmZHH+PlDSvvdIGmT0xzMTVlG0qXZSXnbp75tWT
 n/J/lqzfKfvjj9KVa7+QPmu00mwrT4anudzVFHPOd5dZAPn940CFsA7pqNfzxgkJUqRyz2E+
 RyRBBtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRC7/UfxrJQtQasd
 FiI/91WZeeANM//SQZDLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIeIsYo0/w
 OontMoH0CCFi0InYoSckyRZ12WQNXhcAa8pgY4XXd3wgQ0xx1AcPZGFUn3q4IuCYslnO1UxJ
 mPGn7LLgrlRyxaQc3c3EnSRj+NRiY5X5UJPxV4GYV+IhsDElrk82xgIqWY7SQFczxNm1eNvO
 zc0ax0pdPvWpzo41tJeW22MGh1aAEzL80P8/FIFiWnFQhT6TWfKNmA8Zb6A8U1xH7iwpdSHE
 GV0EFrYbAs=
IronPort-HdrOrdr: A9a23:btn9bKi4xDmZjXTRjIUItzvjO3BQX1N13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAT0+46MHf9LqQffng3OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1uEj2aiWLiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsllP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMF2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYAB89IletiA1HkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooFI5+NRjzUB3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWS1WHdHrU11Mfg+BEZk5DWituf3Jy/fB8i1Nt7TZEJgojtYwid047hdcAo8Iu3Z
 WcDkxq/Is+BfP+I5gNXNvo7KOMexrwqCn3QRavyGLcZek60kL22uvKCYoOlZaXkbwzvdYPcc
 f6IR9lXVBbQTOmNSTJ5uwRzizw
X-IronPort-AV: E=Sophos;i="5.85,330,1624334400"; 
   d="scan'208";a="53843409"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2tdrNspkSHjGtq4iUAA7KtTEoz0eT43JFEcUVZ0cI1rhOdlxSnjjEd+G1/4d/HeSOOoreckMN6fMn8fXNaj+4yF1h37FACtRpgLKy9nBl1wH1FyLEabZJrBDlZwuHSp44tzUoeg4mayn7PgXlq1PfAE2Nx6XKA5SkvNpRsvFH6QxKCGy8kb2hMFazi8HchvHP62m7LRbRc4QEcWpJiNDXZ0tA2seA7sMqRWwzoqOb5DCKz0Jq+2ULBArB9J/vjOmMi0VmDbU2t5MOWgo7gTeY6GJnYQQwJUsIC5Sdpzr13mH1gg6K6LhuU3ozbWTMpKR2ahuUkPvWTHdpj0+d9EwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YoszqKLQEyHUcm4Qjqr/BlfgU6gwos2Ob3tY8yPqMuA=;
 b=l1I7YPyuTDze4PDJicBjPrbWk0Vgj4pwEymQsYtn6TVHNp1HLDd63Cu6Ee6jPplhhtvEkoqrD2+QdJGa2wDTzsIeqaOe3mzaJLZtLIykEmNwCX35PmJT7stZ71v4byWL38Ic8FN0ulOvnr0HfmkyUmyoUMGUnVl9OS/G26yLOvCBI0+vExoN4OYNiin18LDwoo8bey4Vs+IR2PA6+oc56SpvvBvOCMCZvqc3MstINafZ6z8kSiDMqntAOcCXqc7nBB25Lo2y45vJQjAbGTkRI2TLD8fwNN3n0Si1iJdrKw9IG1Xb+cHpIj6peWrk5Q57EoE61cH2IuH8FlIBxhWyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoszqKLQEyHUcm4Qjqr/BlfgU6gwos2Ob3tY8yPqMuA=;
 b=oeGBu0o1gqbi6I+a3siLef42RYjDFIIbqs46vgLJ5CbC6a+caJSUXfM3xavzU/uSDEGnoFOuodFc/oApWdJ6VUnTcfbTn+udHebC9xFEe2G5mgAn3rmiPe52NL6mYwnzYl2JmTFf5fJ3SEnGw/2u81T/Y3eiKuvCZbiZNV9mJNg=
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
 <389ae979063a4afc38d8dbadaf539e7f411a24ba.1632860589.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 3/6] arch/x86: rename debug.c to gdbsx.c
Message-ID: <a094d614-2296-bcc9-1c7a-084ef88b05ad@citrix.com>
Date: Tue, 28 Sep 2021 22:09:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <389ae979063a4afc38d8dbadaf539e7f411a24ba.1632860589.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0444.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5692131-0b02-4f57-a0e6-08d982c44938
X-MS-TrafficTypeDiagnostic: BY5PR03MB5156:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5156E5D022E8F5C448330281BAA89@BY5PR03MB5156.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8oGfICafwYK6Ku/S1yLUkZxvlSIelnJBIFoigfhVdqSAlWPWxSBPga6e8GyEc88x6Zmc9ourP+QZaAIZGK1vFIcT1NFNYS21i7jX+iYGVmkeZgZm7BFi7IvLfbFF+3lFNo5UZMHdvFlsvtcXaCbE4lS9iwezRc7MuUJSPmJgOSqUnSxg3C+tgusDzDDA+HUBCPU8blpn3+CEfzqTBJnF6To/ziTXtyShUcVojphBPBF++NQTgIObIT17StqkFWhYHBJILtPVrPnAf9ObzgQZIMyc2NjitMGcDvtbavs86kHuYX0w8LLYYztXVUFElKGT8IuKS/tkctKCN1fgaz6/qfsaQkn5/yD0sBYaA3Fu5BbnM0B60rXwaW5fHEwlgMSp/o3fYj5r6c9BUbhKxhtRaCsSs5w4j5VWEe03ZG3yJ6PYwguwBPyzTCJpH4Lv5CN4xoniO2K7mXoSJjt0/pRTWsjbdU+sQiwKNXh40jSOedEERkOq9VWSm/nVo16ScTAc/vTRUKjTYlVE5nT2C+/IU/vRmwNLBKGzifraNlUy7Gf0NV6W4el8ucpQ01X57Pax0loMCg7+aX0XCkpmzfFfyzzuodCMJroh4Y0ZaV09gylvWfmea8QYJ0aLUtRWOZHwz/ThANbSx3D/VK00lFw7zOSe5eWE9FOOkZ4K9c3cnyqoqFUNKhOrigEO1d6ce5CkOS7Xz22EsbmsDFlYnkCnE7s4Q525qnSvuQi4pI8dhonwug/vsTw32L53PpGlKaX/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(508600001)(83380400001)(6666004)(86362001)(31696002)(316002)(66556008)(66476007)(186003)(5660300002)(55236004)(2906002)(38100700002)(8936002)(26005)(16576012)(53546011)(956004)(2616005)(4326008)(6486002)(4744005)(8676002)(36756003)(54906003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnFKcmd6LzJ5djFDRlg5K1JDRUdIcFNMNk82SDJmSGhGazlLa0docXI0aUIy?=
 =?utf-8?B?KytLYyt0c2hreU5wc0tZVndxYmVVME56NGR4bXFncFAzaGRVTHVnRlRSbEgy?=
 =?utf-8?B?L3BkTXRoQTcvem9TejBUa3l2TEJMeHYySW40bG44Q0pkZmdzK1pGTStrZ09s?=
 =?utf-8?B?SUg0U2d2ZEJ2bWtrM2lnaEhaUStGY0hJallkaVhaRnlYc0kweFp1RnJBTXpI?=
 =?utf-8?B?VjMrR3FVOHVYQW91cnRSQmluOXJhVDJTeG1aMzZ2UDlFMm4zZStSM0VOeFZ0?=
 =?utf-8?B?SnFwdFNwOENLSjRpTTBXL3NJVUxQMnRvcEVFYjNWRXlSVndJL0h0TVRBTUtJ?=
 =?utf-8?B?bGppam1helNqWFZ0QmF1QkI3Ui9vbXNtU3BIYmxGWFhEbHBvVmR6N2xMd3NP?=
 =?utf-8?B?V2F2QkY4VWVMZ2ZBMEgrYW4zYThxamtZOVZHSy9HNGUwV2E4T0p3VWw1Nnor?=
 =?utf-8?B?OStHN0V6V2U0Y1E4ZTNTamZqdHhpNWtDcmFWOFFLeTEzSzZTa1dyM1FzRGE0?=
 =?utf-8?B?dVNuSEhuNmNtVDV1YnpLTndiSXdUTy80aVBtTmgwTnJQYURWcUJXRTF4NURk?=
 =?utf-8?B?U0xZMnFvbjZOSXFLcURPR2ZmWXpRZ2VrVTRJcUxoTW5zYnFuak5KZGczNHRO?=
 =?utf-8?B?Tlk4ejJjZW1icVhrQXh5cldLS2ovdGFqZ2p1dVNkN0dCVjJLekh6RktrYlQv?=
 =?utf-8?B?cGU4RDdxTDM5dUZDckxEa1pkRUxBZ3VUSHlpZmoyYVpXVUdYM094OERuS1NH?=
 =?utf-8?B?TEsya2xGVXZrekwvcllGWU8xMHBaWmJ5YjlWanRvYjA2SGk5RTBqaXJpZ2xl?=
 =?utf-8?B?a09Qcmc0R1VGdjhKclBTZWpydGJaaE1kTUtxclUwaXU2OW14dTdLQmJRN0tj?=
 =?utf-8?B?K1ZNRUtFczZFVjNmSFB2d1BDTGRTUnJ3czlwNFk2a3N1RjJtdzhrdklzRkNp?=
 =?utf-8?B?MXp2WCswYWtMbndPak1kenVWNDJURjlNZ0xvbmU4OGF6WkRRbFdXY0NrOUht?=
 =?utf-8?B?SU1vZ0JVM2U1bWkvU1E4d3VzclhxRG81VjEzUUx3L2dxMjBSSzB0WnJGeHJn?=
 =?utf-8?B?Vy9EckVuemJDQUQ1UVpvQ1JYL1pOeWVXU3p1bmtkelJDL0JpLy9sOWFWUmlK?=
 =?utf-8?B?MWhYOHAwZzFQNFdxNUdteExINWdvYlh3Nk9lNS9KZGJydnRGWUlCeEdqanZL?=
 =?utf-8?B?L2E2ZXkxK1dUU1k0V3plT3oxZk9PUDYzYXZ5TFJ3em5CZ3l1bS9aUkFITE1E?=
 =?utf-8?B?RTBkR1Ira3hXSWdLTEY5YmJnQ3NwRmJxTFV6czJKeU53NXNvaHdCRktrZXBN?=
 =?utf-8?B?Sm82Q1AwL3Z0TGJkTFluU2h2bEZHbXg0VHZHdDdJdW1CVUhrbUpWY3k4dmRs?=
 =?utf-8?B?TUVtSVNGLzFUMHk3cmJvTGRDSlRaM0Y4T3BFQ3A5Z2paRitMQUNLT2J6eEIy?=
 =?utf-8?B?anp3ZytPeWdIaVZIOStZaXlyWnVNbHY2aFdOcDFIem1XUW11L09IR1BIVEZm?=
 =?utf-8?B?bGJrbjlMUlNxemFRdkp4STNiVXoxejMxd09XUFg0MVc3YlNPTmhZVDV5TE5Q?=
 =?utf-8?B?TGQ0SmNMR29LQ0k2aDhWbGRIc25kemVaM0l0a1Z1RnliSVluSEh5VnFUa0V5?=
 =?utf-8?B?UE8yNnFBaXF4Yk11NjhxQTRXdHFIVW1IWUZVd3IzTDArcmo3QUN5bHRic1R2?=
 =?utf-8?B?SmhaZmJrWjA3aEpjbjNtYk5JNEtvckJPU3ZZQXdRYjhyVGZ1aG1wLzJjTDQ0?=
 =?utf-8?Q?rnTvphWnF44eO6VT8yRBwBpyoy+xgW/2ajPl2CA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5692131-0b02-4f57-a0e6-08d982c44938
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 21:09:40.4653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL2k9F/xgU/mxhv+0Kjx6T6G5gRSNsXiSKjCniDAlZrbUbfyXjSp2yoGhXhgFJogNgN5BDTdSw8Be4h0DuiLlWhPU28bgPrlfZIgljpr1MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5156
X-OriginatorOrg: citrix.com

On 28/09/2021 21:30, Bobby Eshleman wrote:
> diff --git a/xen/include/asm-x86/gdbsx.h b/xen/include/asm-x86/gdbsx.h
> new file mode 100644
> index 0000000000..473229a7fb
> --- /dev/null
> +++ b/xen/include/asm-x86/gdbsx.h
> @@ -0,0 +1,19 @@
> +#ifndef __X86_GDBX_H__
> +#define __X86_GDBX_H__
> +
> +#include <xen/errno.h>

The errno include wants to move below....

However, you need to avoid latent build errors based on the order of
includes.=C2=A0 I'd include public/domctl.h which will get you both domid_t
and struct xen_domctl_gdbsx_memio.

> +
> +#ifdef CONFIG_GDBSX
> +
> +int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop=
);
> +
> +#else
> +

... specifically here.

~Andrew

> +static inline int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gd=
bsx_memio *iop)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +#endif
> +
> +#endif



