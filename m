Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF86B790D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509273.784748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiJB-0005W5-OW; Mon, 13 Mar 2023 13:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509273.784748; Mon, 13 Mar 2023 13:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiJB-0005T9-LW; Mon, 13 Mar 2023 13:33:49 +0000
Received: by outflank-mailman (input) for mailman id 509273;
 Mon, 13 Mar 2023 13:33:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EdO=7F=citrix.com=prvs=4292f2e3e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pbiJA-0004ws-GU
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:33:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f90d65ab-c196-11ed-b440-930f4c7d94ae;
 Mon, 13 Mar 2023 13:02:51 +0100 (CET)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 08:16:50 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB5783.namprd03.prod.outlook.com (2603:10b6:510:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 12:16:47 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 12:16:47 +0000
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
X-Inumbo-ID: f90d65ab-c196-11ed-b440-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678709813;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=mVNST4twzFORKURMz4OqEVoEvpfgjF8S0hTPlDJbUEI=;
  b=UumaUvg8crrAyPPWb8uz7CJ/E0QYM7Z/MkZoqcGP30e0+c0/48Z+js97
   HdqPJltdQHJsQssA2uJtDQRWOKyswqlzBaPfoRz/kQjF0EwBf2yoSLHTM
   FZvsh/uYHoTY5wen9bIQAP30+JAtZtLN6MKOwV0vJ3/BCi15eaw2Q0eI9
   8=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 100599657
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:anJa+Kj7PUwDBREkVdSFdhqOX161rhEKZh0ujC45NGQN5FlHY01je
 htvXW+PbvbZZ2ukfoslbtu/9BwCv57WmtdhTFdu+Co3FiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQdCBwVaxuZjd7s2ai3S/NFlO4BLpf0adZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGyarI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjAN9DRePlqZaGhnWT+XNJDAEVC2em4tv6pV/uGNgcb
 H0tr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5fPnzI2+9FHDxjmr/57AS1ds4h2NBz3/qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y2d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:LaUeyqxmmhqfDuQkHJwqKrPw/b1zdoMgy1knxilNoHtuA66lfq
 GV7ZcmPHrP41wssR4b9OxoR5PwJk80maQY3WBzB9eftWvd1ldARbsKhbcKqAeAJ8SRzIFgPK
 5bAs5DIcy1BVxoydz8+k29H8w7yNeKtKCk7N2uqktFXEVjb7Il9QBiThyGGVd9XwleGJo+E9
 6V/c0vnUvFRUgq
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="100599657"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UE8XJWYfhAr5w56YZxetLTaHhFAjn595sjSXAfwHBmrnflfGlFrmeDRk78c8T3ciwKaNPiHtK56xQy/iHVsIFN/yKR7dX3GZZKfNjezZ6AHARgwvz1j7etNKRu7kkXmj0Iv3TbymOMlektEfe0pPJCC4n6h1LNRXQY0hIdKPx0OKt06VP8RBsm75dCt9l/hIHliHafDYrY8CxSbCcKbKKWJfQbO8ofB+7I1NztkwvHFUdl83/v7j0d+drujiF2nsgq64wFslL6hIR6Z2IjDdiFnQfafYE9UkQG9/gSFUW+l72G0PJnTl2rBFcgT3vK/+iSQ4Xqu4vK7Nc1+z5An2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDdqD4EBDZkYy+noaYdyhSvEKM2kzF7+dBB4ZPin734=;
 b=e5f0moWnlSA+202bg0PWS4Fw2NJAj3YOaIAm45EEXRV7SeHO8hdEPg6er5EP6t5MoBVgSUVkxECq4wP7zcOFpchxPmuHTA1anlx8xc7QSp3U1nhoJAjY8Pwyzbofb/7xUNr47X+zlskv8y/vXviTQpBVkqxOClNt2MD7RNIPT2VQCEGmSME5+O8zJ+Tw6EyEXOKt/a/3KuAdleMNCenx4jMpn8az5Ag7qyOuYSWok37kU9PusXBpc4Xkr3/GYlNKyS6YJXG8mxNn8mN4Gqr8aJQ+VVN/F5Ar2YNffelbLxn4bj5Q36YKRosh1XYngZp0i5FuJhM+hcMTbKUdlv6Q4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDdqD4EBDZkYy+noaYdyhSvEKM2kzF7+dBB4ZPin734=;
 b=xeuRJz1NxosDJ9hqst2aITlQv77xq7x5CWVRw3az5IMVCK1diDE1l4jb7dlf12MxCxB+uOpvw2BnruEFzhoJ3WxRC4mqDtvrkPJy8BTalsriXKzixiOW/K1r8S4bCBMvz1iBzve26V0pYIwyDigXEZ0r2LxocKsArX6sw4KYwRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/grants: repurpose command line max options
Date: Mon, 13 Mar 2023 13:16:32 +0100
Message-Id: <20230313121632.86789-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0498.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: fec4c335-ea16-4ba5-2ace-08db23bcd0ff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRlkBYfoslMGVumCL42G4rp2Pd7NEzYyK3iZKXOTnMaLrPxinFMvyTIcqN2v8LR3ToPnuR97zvAuN9tWduaAHfXVPhjdlOtl4XB8HDx5V3i4QABcDcd9F8ces1FlktbRFz/OL330Nrg0Vv+up4Gl6BtYKHJBqVAa12gdOxijsZDnh5JrhR9N1gAlSXHbhKi0Wu4znGos01YidiR4BeIfWPtD8qzlwJjnudDKjjCfxgTQdH7oBgpJso65fAkEpP8AZj+V+2tHDdMJiC5xXR3rfBqqq28uZ+Xl/xbRW0KKTNlFFe0/hcqTomTZKeYWb6BwN0/em6ZVNKcYXLOmunvY3Lk2H6s4RnFM5HEe9Jpebrv/c2JAtrNHX9LY5gFSg2YRktSHtpUOZnMH6h2bxHMvU0j0ogSGiN8QN1RMKoxG9AVIQgQ2KkbvMVcU3JLNh8SNmWQX0TT03+SqM+n1AQ7yyozo2L+xkc0AU7G9CQOdYm0t1ja6ypfgJAUCtHqeY8sK5G6kIfDjxMY7Uscrz3aoC7xUxvrnC/a/JvV+KZKPSqRMxD3un/NMMfp4r+m4LB154HWym8XoT5wlgTZNkuLCqIk59+37iC5Ev3Tq0mmbktpYR6unAdCQNiMx2JXryplCbFIfPM7vRcJwMKwrBTvnJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199018)(4326008)(5660300002)(8936002)(6916009)(2616005)(41300700001)(186003)(6512007)(6506007)(1076003)(26005)(86362001)(36756003)(83380400001)(2906002)(66946007)(6666004)(66556008)(8676002)(6486002)(316002)(54906003)(66476007)(478600001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjhlNURraUJOZTRxdGZHWEVFM0ZWUlA4UUpEN00zZm54SVB3T3lZaStHZzEw?=
 =?utf-8?B?M0ltWTBPSnhFTGE4cStuNktQVWdXa1B6aHVrNGhBU0JCL0dVLzJiTnFBUGlj?=
 =?utf-8?B?bGpoall1eXpjZ3AycXZ6d0xMdGw5UTRKekVzWFhOK09tcFlySzdPM3lWdFRO?=
 =?utf-8?B?SDdmUERSUmFOUjNVTjlEelZJeGFOc2JVNGV4OFpXOWVmei9CeG5ZKzEvc2J6?=
 =?utf-8?B?VW95TWRjUzl5dFJIZm9ZdUxJcDY0WVBvbkZUeTlBN0N2d2s2VE94ZFY0NmVZ?=
 =?utf-8?B?dXZ4UE9MZnIrOE5MMHNscHBLRVU2dUYrU1Jyd2JqTHdpazluczZxemVYajB4?=
 =?utf-8?B?ank4b0dqSy96R2VUaEJnV21QcGM0eWxJd0Q1eHlpWnRGUFFXekJtekM1Q09D?=
 =?utf-8?B?aEgwZTA3VzdpZEN0QWlTZ3NNSVRzQTNWemtFUEpkN1FoSUNra0ovRENmNmkr?=
 =?utf-8?B?T1k3RDJjaEsxMUtUaTN0VS81U2hUclVrdlRUZXp6MXM2OHIyZDFoc2YxOEd3?=
 =?utf-8?B?VEpUZE1BWUFCNThPRU9lT0hROVNVVkNVeEFmd2Q0UjRXb2QrbittZFJ1T1Vy?=
 =?utf-8?B?TEpIL3hOYTkyUlVyeVVKRHh1R0lUMlAyYk50Y0QzWk1ubW90SWpDbmRHSGdo?=
 =?utf-8?B?S3NjQ3pEWFFQYUtVa1VLMERvakRKUncwS3AvTklydlBlUDRBYlBtUUhoNGlH?=
 =?utf-8?B?bWRDaFVqeE9MdmpjcmtvWk9vazAyVTh3ZHR6K25DWGZGUXFCYkVnbkg5TGRC?=
 =?utf-8?B?SUFESkdDS0gzRjF5U0FPYnZZeEhXWldDbmxYOFoxeStWZzhPK2pEQ2prKzla?=
 =?utf-8?B?S09uZ3picC9QRTVmaU1ldTJxN3Y4Qzc3ZGcrTWpXWUVlcnJwcEJiczdkekMw?=
 =?utf-8?B?QnlicmJ6K1NvdmRHblFIU1ZDVFJ5UDFtNTNjRWRmTEJYTnZSN1ZwSEFwNEsv?=
 =?utf-8?B?N1ZmYnJKdTF5OFpobWI2NDFzU1lXOXV1eER0NWJML1RiejRYNDRWOXFVd0RS?=
 =?utf-8?B?d1RSQ2F5YVhCVXJaY3pKaWxkQlFVa3BEMmg5WXlnMkthWXZMNnJRZGQxekF4?=
 =?utf-8?B?dTFDK1Z1NU1uSW5abnd2ZUNJYkdVZzJjRGZsWWFNdWdnY1NiY1hnaUVuNGlY?=
 =?utf-8?B?Qi9iZ2xWWnF0RkVzZjI0Rm5UV1VMUjRENHJzS21qZTdwOEdkNmx0S0ZEQTJo?=
 =?utf-8?B?cnZOM2RrdVVWZXRmcFBNUWNESDlsMjRZM09uRngwZWNGYmJ3MUxMMGttRVh5?=
 =?utf-8?B?TmtCZ1RQc1gwU0ZNUmJrQU9IZGdKY2VIMjBibjg0QTVDUmkvck9SdzFKdFVL?=
 =?utf-8?B?cEluQ1hrNlcyS2FHSllPd1lYdnNCc21qL2NkRVJjWUpxOUZpbWQxcE5HdnN3?=
 =?utf-8?B?d2NJK0NZbUlDT1hWVXpWcFZpUndJWGNGcG8xNnZMT2FGSjd5MnIyOXFuNnl6?=
 =?utf-8?B?SjRiMU5rSlJDTGMrTUdFem8wMUVtWUtsMlNkbk5KQWpLOFpodmpGcE1wU1B0?=
 =?utf-8?B?Mzh4aG1vZ1NtbHpoNjFBYktscTV1dVNPQk15VU9Vd3VuelNkd0NRMFEzWmZj?=
 =?utf-8?B?b25nazF4NmhGaVRJRENMRGNhUmFUbk5kcTdXd3FWS2wwZ0lRSWpmVVVUblgv?=
 =?utf-8?B?bVJ6LzJSd2IzNGVidHZIZHBaMSs5ckRmNXEvM054SWZWY1ltTVRtZzYrT3RW?=
 =?utf-8?B?VDkzRXo3NjhjdHVqL0RDd2tyZUIxN1pSVUdtMFZ5bXZYWHZNQ3RNVkZ6VEZ3?=
 =?utf-8?B?VzVPaXdKZmc5RVAvS09uS0RLc2xUZWdZNzZBWldLMHZKL3gycHUrNUJWTk5J?=
 =?utf-8?B?alpjVWVncGRySXVBWStkSVR2Y0Z3blFFb2tOYTRYNnF0bDR1S0dxWEg4Nm5W?=
 =?utf-8?B?UStSMjM3OEs0MEtmazM1ZDRONERuVnZnYk5EZWRpZ1ZvR0ZSSEVFN2dCZlkw?=
 =?utf-8?B?cE1rMyt6a0NMcDJpUUpYMWtKbXRFbEdla0FMUG9pRDQ2T3hiNmlUNzhIRWJ2?=
 =?utf-8?B?SG0vazhvQ0dNOWZZZFlQbllJbVRqMHNpQjlXbncwRmZLOEdNb21tMDg1dnZn?=
 =?utf-8?B?UUZlcW9LYTFWSDN4MkU4aTBFVmpNN0p6Tkh6NmdHSDlHSUpHYlZ6RjZseitl?=
 =?utf-8?B?OXpsZFlFdzNScDZpVkZyTmpJdmRQT2hRMXFIeStBTzJOamtYU3ByenI4ZmRa?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cxa8sRQlWz7xqqg6+5jZww5VzFSpN01b83WqbQap/zl0Nu8jADdCkbLp3jlm5XznpL/kt4y1xuVN1o+JImgW789IgyiYcPgRbrZywzF73pR50ytI7qS2GyCKop9yniLmWsH470ta9HeioE741wFoXGTzpC0R5E6IwI377leqpMfctAG+hnjsLOq3Fg4bxuNPXuDZGS/XtjVbmGu/HYb9dkWVVsraPr5BBVxG+jP+DVNLcZPfj6k8BCsQ0CIpRxqrwZybYXchg1M0hfIovt8FZZszWxMBsURkYxZSwMtGOTIW8vHOx3bvhgeijubyjcnRXlkgptw5ZY7B5nXbScDyQuUAiHymuvRbrtNfQUP2KEKDkJ2xc9UI6LNQyZxx15b0UowzH6GdqCVopUCqcBgIk7kh1BNa7SIa2f9KcRKp9m5m5+JeRdIJNOogfWWk+FmwkZ6V81g/6ls904hlCtc2V3/S/7JOed1mTx1B5r3U09/1AliPPr0xktpK59GXgek2BOmYqz3uoVCMXrKIIzygj7iNS6wYtVb4rNZxYRkmuZnZn3XpeWqt1K7djdzvkGph9RTzRYUuxOMj9STfh56ZRZCfj/DoNLPRBiR1nnIZCQ4diSmKaJWVRzyZfaiXCdGNICpxvlPrpttIhx6hBn5ZoD8LohNNmfjncoo0NA+p2u4FwAXh5rwJA+2YPwOUWa+ykRWW7V9Jk59CHjYVC19bIzygxiQpKgC4fx0BVShcUkfAdepqsKTle+woJuEoAhTQ31Etn1M4efeA7yeb/UdrDZsIVPW3fcKLfpuapxN9u9P/zwlZBHoekQu6i+IuKLcHXk7rl+zu/KfTNpW5dfL01bQ3sg2V33+Gc12X5lpXpKM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec4c335-ea16-4ba5-2ace-08db23bcd0ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 12:16:47.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wYpG4oRWGNUjjW8uUZ6MoDb8R0zG9r3wwUvzIzmZUyulDDM1SOxnBj35RAMVukbVz4IVOR81KMqRGUgU1PgDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5783

Slightly change the meaning of the command line
gnttab_max_{maptrack_,}frames: do not use them as upper bounds for the
passed values at domain creation, instead just use them as defaults
in the absence of any provided value.

It's not very useful for the options to be used both as defaults and
as capping values for domain creation inputs.  The defaults passed on
the command line are used by dom0 which has a very different grant
requirements than a regular domU.  dom0 usually needs a bigger
maptrack array, while domU usually require a bigger number of grant
frames.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 12 ++++++------
 xen/common/grant_table.c          |  9 +++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f68deaa6a9..f09d1b23da 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1232,9 +1232,8 @@ The usage of gnttab v2 is not security supported on ARM platforms.
 
 > Can be modified at runtime
 
-Specify the maximum number of frames which any domain may use as part
-of its grant table. This value is an upper boundary of the per-domain
-value settable via Xen tools.
+Specify the default maximum number of frames which any domain may use as part
+of its grant table unless a different value is specified at domain creation.
 
 Dom0 is using this value for sizing its grant table.
 
@@ -1245,9 +1244,10 @@ Dom0 is using this value for sizing its grant table.
 
 > Can be modified at runtime
 
-Specify the maximum number of frames to use as part of a domains
-maptrack array. This value is an upper boundary of the per-domain
-value settable via Xen tools.
+Specify the default maximum number of frames to use as part of a domains
+maptrack array unless a different value is specified at domain creation.
+
+Dom0 is using this value for sizing its maptrack array.
 
 ### global-pages
     = <boolean>
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index b896f9af0e..627bf4026c 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1956,18 +1956,15 @@ int grant_table_init(struct domain *d, int max_grant_frames,
         return -EINVAL;
     }
 
-    /* Default to maximum value if no value was specified */
+    /* Apply defaults if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
     if ( max_maptrack_frames < 0 )
         max_maptrack_frames = opt_max_maptrack_frames;
 
-    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES ||
-         max_grant_frames > opt_max_grant_frames ||
-         max_maptrack_frames > opt_max_maptrack_frames )
+    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES )
     {
-        dprintk(XENLOG_INFO, "Bad grant table sizes: grant %u, maptrack %u\n",
-                max_grant_frames, max_maptrack_frames);
+        dprintk(XENLOG_INFO, "Bad grant table size %u\n", max_grant_frames);
         return -EINVAL;
     }
 
-- 
2.39.0


