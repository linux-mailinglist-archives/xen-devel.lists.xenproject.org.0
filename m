Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F451009A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313980.531815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMIz-0002dL-0c; Tue, 26 Apr 2022 14:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313980.531815; Tue, 26 Apr 2022 14:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMIy-0002aZ-SI; Tue, 26 Apr 2022 14:36:40 +0000
Received: by outflank-mailman (input) for mailman id 313980;
 Tue, 26 Apr 2022 14:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b/nE=VE=citrix.com=prvs=108c91f88=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njMIw-0002aS-IY
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:36:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45deecf5-c56e-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 16:36:36 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 10:36:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM5PR03MB3274.namprd03.prod.outlook.com (2603:10b6:4:40::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 14:35:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:35:19 +0000
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
X-Inumbo-ID: 45deecf5-c56e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650983796;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fbINpKt/1RYyj1cWGsZ3YaiNFHNjyGzplUSls67ClYA=;
  b=WLO4eMCrCrL6pQBla3Wx1S0qfrLzBID9DNcvLe0YvZ4XWPH53X2kTtbq
   gCjq3FtY7bbSz+2ZpHlt3tRQNVugda2nwv1C81VUU+u1puAGKr3WKuyM+
   SFYrdJhU84kwYGk/T9jBmpUKZSOb1RfH5l2GvTs/bWWiVZumQiiavVIN6
   4=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 69836072
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WQ41U6i7ikOCkDdkR1pweS+AX161rREKZh0ujC45NGQN5FlHY01je
 htvC2mDOP+IZGL3Lot2aoqy8U4P7cXRzYcwTQNlrS8xQSIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nT4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVowI/WUh8YgaSRjPXBgFK9a0oKbGWfq5KR/z2WeG5ft69NHKRhueKc+paNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuocehW9r7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJpsjiIklQuitABNvLrI5/Vd5l8r3qD/
 FjB/ULiHigWN/2AnG/tHnWEw7WncTnAcI4MDrSy+/pCi1SV2mUZThsbSTOTo+S9i0O4c8JSL
 QoT4CVGhao4+VGvT9L9dwalu3PCtRkZM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OcpQRQ62
 1nPmMnmbRRjrqecQ3+Z3r6RpCG1P24eKikfZkcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx74j/luYO3qS/uFrB3DSlo8GRShZvv12MGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:GGSoA6hep5nQz/YYUdvsabe0x3BQX4N23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bvYOCUghrTEGgE1/qs/9SAIVyyygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3vpxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT3PARDAhKd/apw7gpMycxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfdsRKEkjTVo+a07bWvHAUEcYZ
 tTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYYit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tXKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG7fIx8Z0WY9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqaJbp0
X-IronPort-AV: E=Sophos;i="5.90,291,1643691600"; 
   d="scan'208";a="69836072"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLtWvV62/heFLSh5WSAaMY8soQ1ZTDwu/Mj4wWssomCFBY+Shhwcc7dOkjz4AObwH2X0fMAeSfOrcz1KWd9ibQ9BC2fPmVORZezgRSshzoxZxbRnnNKlSHf8pSqdpuDZ/0PEdDQ/20QP6NxPbJGqWpJp0up6VfjdvupJC4ojjyk1MlndX7UiefyUjlxkBVIjLKom40BSGD7MG/B94EIqw7pnrbmsmXFFxpZi1RSF4a4WVthrzE1u9p938mq2VCyXpn6MGrioSZ0TY/6Fdt9HyX1c/YimBmWgpm1ly3EcydUKwdf4K3vm0sSGd+z3ILYxKHmcJTyZbGbbRAfwPU2weA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbINpKt/1RYyj1cWGsZ3YaiNFHNjyGzplUSls67ClYA=;
 b=hxEOfS42U5prvuuMJ3ch1YabQqJuM5OVxoqotD+1k6aQo8NSaM4y+3oLs/yAmPykcVuYYSNZBQ+pw5xcA8K7Bbw1MpfUNfJuFUX/IxoM+V7fkO0dlbM1naWb6s/VvmNDteSowbcnJ5rLGxWcBZM1EpViwFGUj8bBApJFIU0ydjpWJntZCpnpW28gCuApP+4oKIA4p5BnJO/vhLHEj2gHwJmgLoVIGf9SNvGydcFMl6jJJVSjRMYdd7ddZB/0xtA6tgSudcLzq5LMQjJyAxyJ/lEcRmivNvo5sX9GY7DUc3CqPSFoGLokrWLa+62KAnyyrpmx8v+qGXGLO+5v6rd5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbINpKt/1RYyj1cWGsZ3YaiNFHNjyGzplUSls67ClYA=;
 b=agHZlpJUQ6uwthH7h9EeJxnyCMl5pZGDQtp+xM72nbcJWMxHHNrQihgF6MxDa8bgH9DPL6tjZlFz18hKPLkpia/R1eyjRmbVy8znPD+szTPneumx1jnvl2cmbUvMsO1UthnKl56/4qtj48sHxlxNBziTzJqqo3T8Gy/b/vJFjnU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: David Vrabel <dvrabel@cantab.net>, Julien Grall <julien@xen.org>, Jan
 Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, David Vrabel
	<dvrabel@amazon.co.uk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
Thread-Topic: [PATCH v4] page_alloc: assert IRQs are enabled in heap
 alloc/free
Thread-Index: AQHYWKhQkHRex9QHaUa4HuRkaWqbCK0COu2AgAADggCAAAViAIAAAJKA
Date: Tue, 26 Apr 2022 14:35:19 +0000
Message-ID: <cd228d72-59ab-087e-92f8-c056a1478e15@citrix.com>
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <f5a45b8e-644d-15aa-951f-aa6d89ce4c5b@suse.com>
 <ecb4876e-c6d4-4bff-d964-92af83d39dff@xen.org>
 <0b7c4df3-e6f2-7791-4e8e-9655eb8c6f6f@cantab.net>
In-Reply-To: <0b7c4df3-e6f2-7791-4e8e-9655eb8c6f6f@cantab.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c91a2b3f-9bdf-497c-57f1-08da2791fd1d
x-ms-traffictypediagnostic: DM5PR03MB3274:EE_
x-microsoft-antispam-prvs:
 <DM5PR03MB3274DD2FA5D193D637FE53BEBAFB9@DM5PR03MB3274.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xc+FYn5jTrz6LpTCEv1xEPMwSE1C4/BLGxlmt8cxUUYwoMcJTLEBjBXsCFSUzTik1PtjG6nb4AYGzP0XP4NWcse9zOsLPHJKbACObcGgaQmXql3pNGBnoMr+097QB7FQBUioVAkAl2elbqDD76twhTeVkng40lwiJzcrfvteneU63cNKUjE5z9UAI6JMf/4OgoFk0SG7iOfPPez9MR/rVYpSndpnVoawi6mJXDL8ZbER6AWZOA5NwevNrMXXraj8su/u8iwV8VYrn+EBn84YM6+fq0Hq21XaH4zsj1itVh4InIjLI2kQhtABeLA5hXmrAvzMI3RQx/EaeLA/xx6uSe00tW5R4iGcrKivYLOLSfa/E5BaJ++Y6NBm1LrUdqIGVo7U1mJ2LKmh5xvJAhtJ/Tusz2Uknu0FQe9UqcVVl9ih0nadtpTr+JBu6mK/Q3yMwi2++3Y2FafFFnZ9f8iQPXBrI38NMejWyJu+UAuvIUCg1vs0+2QEJroeRcNuwK9UT8cZ0fDvBcU8gClGAWxr7KoeG8jbQMd0TFzc6xBjK+PHTPXiOQsBhivwZfvbesxUU+roiSZeRGrr5dQSdsZQKMaicQW2BTt9dAoA2PtTQpqR8VWZ6PxRw7ANl7Egi15YUMUOVAVTCIvdjF/HIMVXtGOq8RI1sW95fTSWy1y3JErZpKW444pmsZWFtwsV3i1HH2Zj8XYuZcrImuvy8d8YoNpMcZeGlaXl56rr0M1S/9qHqmn168YhWZgJZjyhuIWZ2tAF+7U4fqE9xBz1QmTa/w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(82960400001)(26005)(31696002)(38100700002)(316002)(53546011)(6512007)(86362001)(38070700005)(91956017)(122000001)(5660300002)(508600001)(6506007)(83380400001)(186003)(6486002)(36756003)(71200400001)(8936002)(76116006)(66556008)(8676002)(66446008)(2906002)(110136005)(66476007)(64756008)(54906003)(4326008)(31686004)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEJLZkJKdGFzeVBCUHpzbEd4T0NGZzBkSThFV1RTakpOY1BYS3lmNm81Ukk0?=
 =?utf-8?B?aGVMT09mSTVRanVoR2IrbWQ5U3paRjJLbyt0RlFNdkdSVGc1WE1TZndyOCt0?=
 =?utf-8?B?UWo3Uy9OY1JDQzNWMFdQNGh5UHByTlpUeUJVRkdFbE1yR2F2V0dIK0hPUW5y?=
 =?utf-8?B?SG9ZdDcyWEd5bGR4SHNIUGhMMnZlU0RkQTNWQkxwOC95U1Z2ZU1JWnZmU1pz?=
 =?utf-8?B?cGRIY0kxVEpJS3gzQ2RVOTV5WE03VSs5TGhNUUdMWFk4c3lGaGNFZkZyR0Rn?=
 =?utf-8?B?OGtGci9VcHpWdFUwMU03SnZqbXlsRXNud243eFRlVElwQ3RpQngydDZLWVRq?=
 =?utf-8?B?SWd5WStSNTFLbUd1dU9JOE1oelZIM0hoR1ZPSnZFNFExeWZyVksvUjA4WU1r?=
 =?utf-8?B?MVp4MnlaaFlRaUFOUi9DVkIvbFI2MGNKdGxXYjVKcXZTWlNpSnFvVGxnN3Zv?=
 =?utf-8?B?WWVNOGVtaGJEUnVwSGo5bG82alVFdFNra08xaU5yVmJqU3BxRWlXazMrWDEz?=
 =?utf-8?B?bVIwU3FYUXpZeU9NeFFZckk3Y2xOelkyeXJKVWZXR2V6ZFBzeGFPOFRtTFlO?=
 =?utf-8?B?bExmMk92eWNaV3E2NXM0am9oTTFkQVFrL015TzN6OWpNNWtoYk10UEl1YUJP?=
 =?utf-8?B?cWY2M091TjFqTXB3ZlFpSk5uQTcxa29VbmFKUStGMGI3VDYvY1dLcE5TZExY?=
 =?utf-8?B?b012bVhKd050YVNRUkZ3RnF1T3ZwWml6T3JoN0VHM3BWV0tRaVhXY1lmTi9s?=
 =?utf-8?B?TEpzVXlJQTVsK0NPaEVBWndwQkoySVI1bjhFWUxuZUxvS1BKa0wwcEtsTUQv?=
 =?utf-8?B?cDJvbnQrUVkyaTJ0L3BSZzdhQ0gvNGdVamc1R2hmUWFlaElaNHBGUjQ1eU1R?=
 =?utf-8?B?K3NMRlRmd29UOTBrcEhTRGdQeGQ3TUw5NkhFYU9qdmtIVTlaOGZ3Y2ZVYVBY?=
 =?utf-8?B?azYvMUdUWU4rR1BkMlo0aXVOTHdKR05yL24rcHVHUC9QRDJ0Y3FYRWtqOFpm?=
 =?utf-8?B?S3VSSzdBcnZJc1JTcklnYWd6RXRRK0VWc2l1ZFJvZHJoK2dLMExxNXpEaVhC?=
 =?utf-8?B?MUNlYkVLOHdXN2YwSlQxYnZrbkFEV0diYW10SmRwY2V6ZkIrUDVlS3hSdDZL?=
 =?utf-8?B?QWwyYTFCTmJPa1pVZFZHNlQ1SVZoUW51QUxYUXllVDNSMzZtSGNEeHppU2Jm?=
 =?utf-8?B?Y1JYRkJsZEpSNklBOHRZaWRTaEloeWdab2thOVo5cGczcE5lTzhPZjR0YUxp?=
 =?utf-8?B?M2dVN0pNZDVBR2Vpak45VnVBU1hRUm1HQThwVE83Z1JHb0tpRUtTM3lQWU9S?=
 =?utf-8?B?MytWN29POVk1VHBES1l6dEdHelgydHlGQUV5cHVzTkp0Y1ZVWGR2MlkyWmVz?=
 =?utf-8?B?NjVlRTV4SVhiTUtmNW0wa3U1VHlMVXh2NWRnRlpvdGQ5SEVTbVNSaXRiSnF6?=
 =?utf-8?B?aGkvV3M5OHovNjJNdVdzNlZYbkRRU0NPeThJYi9MTHBFdUxnbmEwT2JWTStQ?=
 =?utf-8?B?QW1UemtjNWFCRUFSTyszK1V3OUV6b25KTGd0dWxvTUtucXg0RGRHNkxIVHF1?=
 =?utf-8?B?SnZtc0d3WVpPU2w3dkZXM0JxTXIrR1YwcWdLU1JNSWh1amJEWWV1bnhuQnpn?=
 =?utf-8?B?Z09vakl1bTZjVnBkZ2FQZnVCQkx1TTh3bWtYa3IvQjlRTnFZTzJEL3BvYzIr?=
 =?utf-8?B?aGpGLzdtemY2Rm41NmJNMmhrTmpoSjB6Uk0zQ1hRQVVLbkZJTVZ1TlNrZVlt?=
 =?utf-8?B?ZzhhNHVrOUZ4MzFsMjdYbUV2MXZEZ3JnZ29EajM4bUtwanpFOVBtd3ZuOUcw?=
 =?utf-8?B?ZzllSGpvZHkrLzFrYzZHbHdJY3prNnFCQVlVMWlMbHpWS0dqOVg4WXg5bHJt?=
 =?utf-8?B?dGlBQzR0SWtaVC9YdmdpWWdhamJianJHbHZkTGl6VEpzNnhJY3VEem12QTUv?=
 =?utf-8?B?b241RERvR3JqQmNwRWFUNlg4RmdoaDJXbkk2ZGZWOFlYZmR1aTdXSFhjWDdm?=
 =?utf-8?B?REFwN2ljbXNPSjlRSXRBRDUzdGhuR3JKQ0cyaVVGdldKc2Myd2FONW9laHlF?=
 =?utf-8?B?S3ZtazRvb2tmQWNuMkxQNlRLeGd0bDZ5S25DRVhndEFqS0JaK01OWERDaXMy?=
 =?utf-8?B?cHlFVStTc0Y5RTNtWHVRbTRHZ2Z5TEtyUWVQbTVkWDhpOWJpRkZxQzd3TktI?=
 =?utf-8?B?NnFZVjhyS3NaUXlLN29mVG5lRjBxa1A5L1VYWXJYSkYrMGkzbGJFbHdsRkho?=
 =?utf-8?B?SVlGUjdRam9EckJlSjJvSzZ2a3E3eVd0aUw3cEloaytCMDhXVVRGczJqOVd3?=
 =?utf-8?B?UVk5QjBpd0NzTjdaUEwrakNNNkViQ0NqQWgwMW5vd2NMVDNDU2luSEN3ckxv?=
 =?utf-8?Q?9F4JJwIunSuq/wnY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D005DB15A6FA5D45BCEFDFC05818B51D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91a2b3f-9bdf-497c-57f1-08da2791fd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 14:35:19.6490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sO+0RPtD0u2FywNoS/KJ2oVRbd4Dlhom8zX9Fn5QVLAGMbJxyXqyAq2MLQGiJkhv+fMdmloKCuzinGI7uZtA2G8PC1oW9nb1gvo1gqH1Ai0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3274

T24gMjYvMDQvMjAyMiAxNTozMywgRGF2aWQgVnJhYmVsIHdyb3RlOg0KPg0KPg0KPiBPbiAyNi8w
NC8yMDIyIDE1OjE0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBPbiAyNi8w
NC8yMDIyIDE1OjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNS4wNC4yMDIyIDE1OjI4
LCBEYXZpZCBWcmFiZWwgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
DQo+Pj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+Pj4+IEBAIC0xNjIsNiArMTYy
LDEzIEBADQo+Pj4+IMKgIHN0YXRpYyBjaGFyIF9faW5pdGRhdGEgb3B0X2JhZHBhZ2VbMTAwXSA9
ICIiOw0KPj4+PiDCoCBzdHJpbmdfcGFyYW0oImJhZHBhZ2UiLCBvcHRfYmFkcGFnZSk7DQo+Pj4+
ICsvKg0KPj4+PiArICogSGVhcCBhbGxvY2F0aW9ucyBtYXkgbmVlZCBUTEIgZmx1c2hlcyB3aGlj
aCByZXF1aXJlIElSUXMgdG8gYmUNCj4+Pj4gKyAqIGVuYWJsZWQgKGV4Y2VwdCB3aGVuIG9ubHkg
MSBQQ1BVIGlzIG9ubGluZSkuDQo+Pj4+ICsgKi8NCj4+Pj4gKyNkZWZpbmUgQVNTRVJUX0FMTE9D
X0NPTlRFWFQoKSBcDQo+Pj4+ICvCoMKgwqAgQVNTRVJUKCFpbl9pcnEoKSAmJiAobG9jYWxfaXJx
X2lzX2VuYWJsZWQoKSB8fA0KPj4+PiBudW1fb25saW5lX2NwdXMoKSA8PSAxKSkNCj4+Pg0KPj4+
IEF0IGxlYXN0IG9uZSBvZiB0aGVzZSB0aWdodGVuZWQgYXNzZXJ0aW9ucyB0cmlnZ2VycyBvbiBB
cm0sIGFzIHBlciB0aGUNCj4+PiBtb3N0IHJlY2VudCBzbW9rZSBmbGlnaHQuIEknbSBnb2luZyB0
byByZXZlcnQgdGhpcyBmb3IgdGhlIHRpbWUgYmVpbmcuDQo+Pg0KPj4gwqBGcm9tIHRoZSBzZXJp
YWwgY29uc29sZSBbMV06DQo+Pg0KPj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+PiAoWEVOKcKg
wqDCoCBbPDAwMjJhNTEwPl0gYWxsb2NfeGVuaGVhcF9wYWdlcysweDEyMC8weDE1MCAoUEMpDQo+
PiAoWEVOKcKgwqDCoCBbPDAwMDAwMDAwPl0gMDAwMDAwMDAgKExSKQ0KPj4gKFhFTinCoMKgwqAg
WzwwMDI3MzZhYz5dIGFyY2gvYXJtL21tLmMjeGVuX3B0X3VwZGF0ZSsweDE0NC8weDZlNA0KPj4g
KFhFTinCoMKgwqAgWzwwMDI3NDBkND5dIG1hcF9wYWdlc190b194ZW4rMHgxMC8weDIwDQo+PiAo
WEVOKcKgwqDCoCBbPDAwMjM2ODY0Pl0gX192bWFwKzB4NDAwLzB4NGE0DQo+PiAoWEVOKcKgwqDC
oCBbPDAwMjZhZWU4Pl0NCj4+IGFyY2gvYXJtL2FsdGVybmF0aXZlLmMjX19hcHBseV9hbHRlcm5h
dGl2ZXNfbXVsdGlfc3RvcCsweDE0NC8weDFlYw0KPj4gKFhFTinCoMKgwqAgWzwwMDIyZmU0MD5d
IHN0b3BfbWFjaGluZV9ydW4rMHgyM2MvMHgzMDANCj4NCj4gQW4gYWxsb2NhdGlvbiBpbnNpZGUg
YSBzdG9wX21hY2hpbmVfcnVuKCkgYWN0aW9uIGZ1bmN0aW9uLiBUaGF0IGlzDQo+IHdoYXQgdGhl
IGFzc2VydHMgd2VyZSBkZXNpZ25lZCB0byBjYXRjaC4NCj4NCj4gSSBkaWQgdHJ5IHRoZSBydW4g
dGhlIEdpdExhYiBDSSBwaXBlbGluZXMgYnV0IGl0IGlzIHNldHVwIHRvIHVzZQ0KPiBydW5uZXJz
IHRoYXQgYXJlIG9ubHkgYXZhaWxhYmxlIHRvIHRoZSBYZW4gUHJvamVjdCBncm91cCwgc28gZm9y
a2luZw0KPiB0aGUgcmVwbyBkb2Vzbid0IHdvcmsuDQo+DQo+IENhbiBteSAocGVyc29uYWwpIEdp
dExhYiBiZSBhZGRlZCBhcyBhIERldmVsb3BlciB0byB0aGUgWGVuIFByb2plY3QNCj4gZ3JvdXA/
IEkgdGhpbmsgdGhpcyBpcyB0aGUgaW50ZW5kZWQgd2F5IGZvciBwZW9wbGUgdG8gcnVuIHRoZSBD
SQ0KPiBwaXBlbGluZXMgb24gdGhlaXIgb3duIGJyYW5jaGVzLg0KDQpJdCBpcy7CoCBVc2VybmFt
ZT8NCg0KfkFuZHJldw0K

