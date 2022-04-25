Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362750E033
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 14:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312855.530249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixmy-0006Du-V2; Mon, 25 Apr 2022 12:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312855.530249; Mon, 25 Apr 2022 12:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixmy-0006AP-R7; Mon, 25 Apr 2022 12:26:00 +0000
Received: by outflank-mailman (input) for mailman id 312855;
 Mon, 25 Apr 2022 12:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eo9G=VD=citrix.com=prvs=107e1699f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nixmx-0006AJ-87
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 12:25:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daaceafd-c492-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 14:25:57 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 08:25:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BYAPR03MB4760.namprd03.prod.outlook.com (2603:10b6:a03:13a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 12:25:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 12:25:51 +0000
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
X-Inumbo-ID: daaceafd-c492-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650889557;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WbIxPqEv/xLRrZH4pYkY3if2CrUkLgZXQoVOuHU3MUU=;
  b=PcnT/SBlIkyqpcCQHU3CvYPGaEy4UdwulT+10Or7WPz13Ed/Mx8jSBnj
   q6OHUujbuwk/OiqkXAjfa+QM8+jgV+73/E35nEYkmlKmgmQckLsDwvjGp
   XNwsDSlKoCigKcBSH1KFb86ngrWrZCSwudgn0a0rjcz3Wm5ssXoWqSM3/
   M=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 69730507
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:scq5vKO8myC2TxXvrR1FlsFynXyQoLVcMsEvi/4bfWQNrUpzhT1Sy
 jcXXG6HbPmJY2b9ct0iYNu+oUpSvJPcnNQ1Tgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 fx/tbzrTgAVLrT1gcsXfAJnS31hFPgTkFPHCSDXXc276WTjKiOp6dMxSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB5GdaaG/yiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2MJ9wnN+PJoi4TV5BByzun0adbSRsHQauQIo1nH+
 lCX72usV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77ncIFBQcWF+/oP+4ok2zQdRSL
 woT4CVGhbc23FymSJ/6RRLQiHyZuh8RXfJAHut87xuCooLW7ByeHXMsVSNaZZots8pebQIt0
 liFjtb4HwtFubeeSW+e3rqMpDb0Mi8QRUcIaDUYVwID75/mqZsqkxPUZt95Fei+ididMSH9x
 XWGoTYzg50XjNUXzOOr8FbfmTWuq5PVCAkv6W3qsnmN6wp4YMuvYdOu4F2CtfJYdt/BFx+Go
 WQOnNWY4KYWF5aRmSeRQeILWra0+/KCNz6aillqd3U8ywmQF7eYVdg4yFlDyI1BaK7opReBj
 JfvhD5s
IronPort-HdrOrdr: A9a23:BKW/0KkrVKA88vLQppoSTWoZ6tfpDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1GnnKp
 gdMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="69730507"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB51fat64wZZ9ohmjyFmMuyGIcKN+CNkxE19KfdDDw1GK/yh86Pe2aYzdHDseT8UOMPHc+KOL9ezOd1HOjAS/9PCp1w14FcRSnEjMnNDXG3MnOFBBGMgO/j9lJOPr//j8ON7LaDkl2UoK1izLOKLPqeWtPtahNfQKRrejIAZ2p0pZRczpeCOqAHDI+CDuXfqcO6puaFFVyueaA2XJ+aKwQmszTLnibPdhfJAY6+eNRbZ6H0KTi/CnygnD0QdSbWwG7mPmzv7Se3eOq/6IOatF+IReR4NL1WRg1N9O55hB+btmVOvH5B6OO7hOX6Nqdl/oUplg1VhRJ4jTps52oQCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbIxPqEv/xLRrZH4pYkY3if2CrUkLgZXQoVOuHU3MUU=;
 b=l7HsysdYG1MELQidr6PxR1oPWZdA25BrTXASRMpSEgtIZTP6VAAZ3KjJbm7MFXQuF0B6J5PlZGuwdilkDTuhwJsfuMcT/ItRVlJqfkyvlsKLrVH3Dk/1PGw4WPeYkekla6n85oUArL59EqUY/8NRWtDdyaA/1qG7oMq5Gi5paCKbM+vicu38OVrj9NwwN7ZrqDXYTzXBkiAeKQi0gFhMbDKEwvjlgRBaI+RvE5K+ygGCdBstBVPnsl9wi7MEk3wvPd9mutMqSBjt3zq3MoARkjfQ3hkqt+JdMHcpR/68kFpAy0PbhTa1H7QjJQfqsYAa5zegTK7rCS3BkhZJnG11ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbIxPqEv/xLRrZH4pYkY3if2CrUkLgZXQoVOuHU3MUU=;
 b=DaEkJZHR3qomULRqDpjq2oNFE4rM912Y+I/XANqHwjnUs6G7dM9UH1oGOkMLZthF6r9XTxMyGyAnYIqcJGrJfDaNm2FYQ2cJy8LVndBsOu5UnsRHu7Y5/XEqgnUHgZCK0ngipr/bEv+Og8VwYlznZMCBPlyyA+8XbdMVh8jnANM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Topic: [PATCH v2] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Index: AQHYWIw8chvpJExnr0WEKHKghrmtCq0Ad2cAgAAWtIA=
Date: Mon, 25 Apr 2022 12:25:51 +0000
Message-ID: <86e38a1d-5fb0-efe2-1013-f5cf1a1a1451@citrix.com>
References: <20220425100642.14383-1-andrew.cooper3@citrix.com>
 <169f4023-db5f-45ab-b310-2bacb7683ac7@suse.com>
In-Reply-To: <169f4023-db5f-45ab-b310-2bacb7683ac7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 061f9c53-ff6c-4044-2c1e-08da26b6bc89
x-ms-traffictypediagnostic: BYAPR03MB4760:EE_
x-microsoft-antispam-prvs:
 <BYAPR03MB4760B0F90FE338C4C303FC04BAF89@BYAPR03MB4760.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6hcf8T90iRj66J3Dh04zuETbb8HuBqo1uE7yBX7PIuwyTZ3s+QoTD3TNg/LI6KfqiYa9clCkXMTeU5A+v3avCl7m5xMy9v+qmXDJV9yphdHMUbmCGt5XBC9yE0MXpl4hthi0ld1iYnsf/oYqFNsCVjnJhKOVJXmJLfMB75QYc53TU4PXQ+/94tLZhE1usNkI5SlDmeHRqPiZY4YqEjlmhTjJcX4+iX/zOit5hsdCPomv4KVwfuAeC19Sl0w9bFymnAsLVG8n7yxRg4XUx9uOeU4HizKB98ZTm+3Xf9a9oVr2e7Cws6WId5Xbs5mu7rih40eiUljSA9bOZNz3tXIROsfRLDSunzZDm2C9yoIk6K9HdQFrHQgmrtDAuXYzDSRMetjoiwx2aiUi4vkfvESZ0eQjkD57YKihPwCLt+dCJ2yFePz/MWx9WwfQMQL1gtswkCtSXnLN5iYKroyTqj7nU1oallRPFNj5kKhDUOPMFRq4IsDHPI6lkAnQIwBdiUSl/P5LFF4S1w9tuuuEPOvlHltwc28ameNVHH0Uvvua0O2lcZ1hQlX/CIO75cVn+oH2u1KZsVQbxTEeFZIHOx3rNOZKHHs99RJ/TS75kxlDqy0KJEiwXVlaYzwg9XU9u26VfGIGBUYYVFQVXnqqCX1+jp85NCk/RAuQSKpK8zjMyxzFBWy9EPIGqqx0yxjA/DfuWY91LpO4xAhjJeaHGfi2svCX9HsPMOm2dLXJtd6NBXG09ILA+I1Be9jgEJ0IuCn8XWlbk6pkSw3PgDLjrwjdIg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(186003)(66556008)(66476007)(76116006)(2616005)(31686004)(66446008)(36756003)(83380400001)(6512007)(86362001)(31696002)(26005)(6506007)(53546011)(91956017)(8676002)(4326008)(64756008)(122000001)(66946007)(2906002)(6486002)(6916009)(54906003)(8936002)(71200400001)(82960400001)(38070700005)(38100700002)(508600001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDFQQ3RZbVZndkY0Y2VWN3JkVjVTUi9HWmdMcUwvbGYxaFhDQVk5TDJWVm8x?=
 =?utf-8?B?eE1kTmsxK1Q0RFV6azFZemFMUnZEdUMxTDl0cjZnSmxBMUcydmprTENCdEVa?=
 =?utf-8?B?eGRyck1idzN4MzZBcmV6TzBPWnlBZXVBWUw5U1ZhdlBBRko5d3J0ZDhoRnVF?=
 =?utf-8?B?ZmVQOThZWFFpUjdScEUxdmpnTXlzOEx4Rk1aUUNNc3d5SmtTRmlyOWFXSUU0?=
 =?utf-8?B?QXJhOW5nMS9SWVJuZUhYaElyclR4dElxcWJQS1FoN2hOLytrUUNZMGUrOTBM?=
 =?utf-8?B?L2RBL2tzVVlLUkg2T2JmNGdoSWxBeUdaQnRZM2NpeWxVZlNkdXJrQ3M5cU9M?=
 =?utf-8?B?S0p0RnRRTkZpUllIYW4wUFpyVUxHV1pHM1gxQ0w1Wmo2V0JoZkpoTHJWS012?=
 =?utf-8?B?bXNkVFNUKzlQbzh1ajBTNVhhMk8vOWt4aGZsTUVPTjlSY3ZBT2FIaW5QWWw5?=
 =?utf-8?B?OFhSMDRabEl6NCtMeGxEOXNiSWI4Ukp6T05ycnc1Y1pQV0NyNUVXeDRVTDVz?=
 =?utf-8?B?bWIyeUdkaFdKQVBRNFFFekpDS05MbmF2UDJmbTYxTkx0Qmg4SlNiMWxCdGNy?=
 =?utf-8?B?cDE1S0k1TXVLMS9xMlA2RmpGbmFsV29iNmNZcGxjSkdGNE1NVVcyNVpZSmdN?=
 =?utf-8?B?c2JKWDhueDZvdFZ2NDZSa1BLWUYrSVJHcE5FUmx2ZXc3Q1cwREJjeVZyeUNT?=
 =?utf-8?B?bWx4NDBnKysxYlRHb04zWXh5dmNBUStZc1BCMkQ2RXBJSjczWEtremVWalpa?=
 =?utf-8?B?VVFWa2ZEWVA1Z2ZRZzhmRWFpcmJId0tKWG5lOXNLVHQyN0dqUHd5NWJNQ2Fa?=
 =?utf-8?B?U0g2ZUJwZ1g3QWVRczhwaXkxN0RlZDhwUTU0ZitiR1JzMEFyS2dXUHYwVy9D?=
 =?utf-8?B?ZlFJWWxDRURQdzF0ME5JUHgwZGI3Q1M3N08zM1AwOEVtazcyZTJxTFQ0amdo?=
 =?utf-8?B?T1lyNzRlQk81R05IZnJ4bS9TS1pVSG1YS1RSRGEwa1o4N1RGeEhpUXdkTUVy?=
 =?utf-8?B?ZVVNQXRNdDNNaUhpaUcycTNCS1VVU1dFZ3h1Tlo0azRKcW5QN3BHMGl4dU9N?=
 =?utf-8?B?eWxYSjhkOGYzUmhUNmpsUVFWcURONXRjUXRRb1U4aXJaOEJkOTcxSENXaVRx?=
 =?utf-8?B?N1hJWDJMMHZJVWZ6OWxoTXRSVWU2SWR0VisyZTI3QUd5a2I5ektubFlNNFZR?=
 =?utf-8?B?NGsreEZUVkQrVE1WZ3ZVS3lIM1dpNWd2VllESXJ0aXdOK1Q4a0hDWEJNb0Mr?=
 =?utf-8?B?Yk4xY3pmcm5NQUNUbVhOd0xFcm5qVXBpTzJZbGlWOWNYaWpub2JHdGNUckpV?=
 =?utf-8?B?WC9PbTdtb1pNYUkraDB3WTBSNVFOcHcxQmIxbW44N0xvZUdVRGRXbzdob2Rj?=
 =?utf-8?B?SEpaNVFYMEFYRUtmOTVnc3FPa1B0dlBtOSs4RUFWRU5MalBHUWJZQmZ1NDVu?=
 =?utf-8?B?Z3dEVEtzQU9IVG1mcjF1ZXd2UUgwZFlUU01xWlRIdHJsNlNYZGFQN0RtZCtu?=
 =?utf-8?B?REU4SEYxTzMxcm5yUy9qcUNYMDlpQVB4QXczVDIvVHZoMkJiOEN1VU41V1Ay?=
 =?utf-8?B?Q0FrRE5LYlpZY21MdFluWFRtSC92Q3lyelMvdHhMSUZidUxvajcwWWpDU1B3?=
 =?utf-8?B?VDVRSGhoZWY3OHMxQThrbVZoTGlDSWlZSVoyVXBxZWx3c3B6MEE3ZmtjQUlm?=
 =?utf-8?B?Z1RhWEZ6dWtkNGR1cU9pVWhtQzViQWVESEdFcGFVazIrYjVDL0JJRlFMbFE0?=
 =?utf-8?B?aXlHbktxcThBTmtUK0lYUG9hdE92Z2VvdWdyUjFYS1pVMnZQaDlpSG5HZG85?=
 =?utf-8?B?KzAxNWE2S2ZlWDhTZk54SGdGKzVyUGcyQk83ZFJ1Vk14STZ5bTZmTlA1WnVq?=
 =?utf-8?B?VVZKQUUvNW5qSEZCMzNCaEtzaFRhTVlNSFNjNFE5eXBtVnE4aEQwRE1ZRHBR?=
 =?utf-8?B?VVpmd2Jxc1hpdUJJcGdRUHBsRTI4Vi9PR1hhRTk3ZTRNUDJ4QnVNK2Jrb0J1?=
 =?utf-8?B?SXhyMEpNNVp0anRkWGYzRGdwZkFRZTdxQ2JIaXZuWUExdjdEZWVmazhHaUQ4?=
 =?utf-8?B?Y0hmdnhhYTNsUmxadnVaRGJibG1NTVZuQ2hMS1RHZlpNWTgrREd0RXJnNTBY?=
 =?utf-8?B?N2FNd1A1eWQ5UXg1eHZmVFpCdGdxWFVjaGlRdVpWK3Y4NWhLM2pGNFVIUC9U?=
 =?utf-8?B?MVR6Mkx4V0F4TzhRSEtqbS8yczhVSDlPbXh6N29nMFgyL1pacy82TVZyVXNk?=
 =?utf-8?B?bHBIdkRqTXdZOStUTURiaFBwcU1rNWdGSUs1dVlaeHJaYmh3ZkFTeGYvcjZG?=
 =?utf-8?B?a3pPSTFlS3BmZC9jdFBIZDZXWlBWRzRyNHNaNjJUaTdlQnVkT2NhUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07E48E1D9D9C854D8324E2873854E0B5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061f9c53-ff6c-4044-2c1e-08da26b6bc89
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 12:25:51.4731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Spn5cbSoGDNq4GVAyXKwYZmwJKLQFcjCLdlTgvDVrHBRrVQBWWBVy4sQ2TSrrXeOHlHMWQWjEPOv3oov3y8zoSGdhbzr88jgVqBb3biea/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4760

T24gMjUvMDQvMjAyMiAxMjowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI1LjA0LjIwMjIg
MTI6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBAQCAtMTc4LDYgKzE3OSw3MSBAQCB2b2lk
IGRvbWFpbl9wYXVzZV9mb3JfZGVidWdnZXIodm9pZCkNCj4+ICAgICAgICAgIHNlbmRfZ2xvYmFs
X3ZpcnEoVklSUV9ERUJVR0dFUik7DQo+PiAgfQ0KPj4gIA0KPj4gK2xvbmcgZ2Ric3hfZG9tY3Rs
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIGJvb2wgKmNvcHli
YWNrKQ0KPiBJcyB0aGVyZSBhbnl0aGluZyB0aGF0IHJlcXVpcmVzICJsb25nIiAoYW5kIG5vdCBq
dXN0ICJpbnQiKSBoZXJlIGFuZCAuLi4NCj4NCj4+ICt7DQo+PiArICAgIHN0cnVjdCB2Y3B1ICp2
Ow0KPj4gKyAgICBsb25nIHJldCA9IDA7DQo+IC4uLiBoZXJlPw0KDQpDb25zaXN0ZW5jeSB3aXRo
IGl0cyBjYWxsZXIuDQoNCkFsdGhvdWdoIEkgY2FuJ3QgYWN0dWFsbHkgc2VlIGEgZ29vZCByZWFz
b24gZm9yIGFyY2hfZG9fZG9tY3RsKCkgdG8gdXNlDQpsb25nJ3MgZWl0aGVyLCBhbmQgdGhhdCB3
b3VsZCBhdCBsZWFzdCBtZWFuIHdlJ3ZlIG9ubHkgZ290IG9uZSBwbGFjZQ0KZG9pbmcgZXh0ZW5z
aW9uIG9mIHJldC4NCg0KPg0KPj4gKyAgICBzd2l0Y2ggKCBkb21jdGwtPmNtZCApDQo+PiArICAg
IHsNCj4+ICsgICAgY2FzZSBYRU5fRE9NQ1RMX2dkYnN4X2d1ZXN0bWVtaW86DQo+PiArICAgICAg
ICByZXQgPSBnZGJzeF9ndWVzdF9tZW1faW8oZCwgJmRvbWN0bC0+dS5nZGJzeF9ndWVzdF9tZW1p
byk7DQo+PiArICAgICAgICBpZiAoICFyZXQgKQ0KPj4gKyAgICAgICAgICAgICpjb3B5YmFjayA9
IHRydWU7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBYRU5fRE9NQ1RM
X2dkYnN4X3BhdXNldmNwdToNCj4+ICsgICAgICAgIHJldCA9IC1FQlVTWTsNCj4+ICsgICAgICAg
IGlmICggIWQtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFr
Ow0KPj4gKyAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4+ICsgICAgICAgIGlmICggKHYgPSBkb21h
aW5fdmNwdShkLCBkb21jdGwtPnUuZ2Ric3hfcGF1c2V1bnBfdmNwdS52Y3B1KSkgPT0gTlVMTCAp
DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICByZXQgPSB2Y3B1X3BhdXNlX2J5
X3N5c3RlbWNvbnRyb2xsZXIodik7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAg
Y2FzZSBYRU5fRE9NQ1RMX2dkYnN4X3VucGF1c2V2Y3B1Og0KPj4gKyAgICAgICAgcmV0ID0gLUVC
VVNZOw0KPj4gKyAgICAgICAgaWYgKCAhZC0+Y29udHJvbGxlcl9wYXVzZV9jb3VudCApDQo+PiAr
ICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICByZXQgPSAtRUlOVkFMOw0KPj4gKyAgICAg
ICAgaWYgKCAodiA9IGRvbWFpbl92Y3B1KGQsIGRvbWN0bC0+dS5nZGJzeF9wYXVzZXVucF92Y3B1
LnZjcHUpKSA9PSBOVUxMICkNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIHJl
dCA9IHZjcHVfdW5wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKHYpOw0KPj4gKyAgICAgICAgaWYg
KCByZXQgPT0gLUVJTlZBTCApDQo+PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5J
TkcNCj4+ICsgICAgICAgICAgICAgICAgICAgIldBUk46ICVwZCBhdHRlbXB0aW5nIHRvIHVucGF1
c2UgJXB2IHdoaWNoIGlzIG5vdCBwYXVzZWRcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgIGN1
cnJlbnQtPmRvbWFpbiwgdik7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2Fz
ZSBYRU5fRE9NQ1RMX2dkYnN4X2RvbXN0YXR1czoNCj4+ICsgICAgICAgIGRvbWN0bC0+dS5nZGJz
eF9kb21zdGF0dXMudmNwdV9pZCA9IC0xOw0KPj4gKyAgICAgICAgZG9tY3RsLT51LmdkYnN4X2Rv
bXN0YXR1cy5wYXVzZWQgPSBkLT5jb250cm9sbGVyX3BhdXNlX2NvdW50ID4gMDsNCj4+ICsgICAg
ICAgIGlmICggZG9tY3RsLT51LmdkYnN4X2RvbXN0YXR1cy5wYXVzZWQgKQ0KPj4gKyAgICAgICAg
ew0KPj4gKyAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkNCj4+ICsgICAgICAgICAg
ICB7DQo+PiArICAgICAgICAgICAgICAgIGlmICggdi0+YXJjaC5nZGJzeF92Y3B1X2V2ZW50ICkN
Cj4+ICsgICAgICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgZG9tY3RsLT51
LmdkYnN4X2RvbXN0YXR1cy52Y3B1X2lkID0gdi0+dmNwdV9pZDsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgIGRvbWN0bC0+dS5nZGJzeF9kb21zdGF0dXMudmNwdV9ldiA9DQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgdi0+YXJjaC5nZGJzeF92Y3B1X2V2ZW50Ow0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgdi0+YXJjaC5nZGJzeF92Y3B1X2V2ZW50ID0gMDsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgfQ0K
Pj4gKyAgICAgICAgfQ0KPj4gKyAgICAgICAgKmNvcHliYWNrID0gdHJ1ZTsNCj4+ICsgICAgICAg
IGJyZWFrOw0KPj4gKw0KPj4gKyAgICBkZWZhdWx0Og0KPj4gKyAgICAgICAgQVNTRVJUX1VOUkVB
Q0hBQkxFKCk7DQo+PiArICAgICAgICByZXQgPSAtRU5PU1lTOw0KPj4gKyAgICB9DQo+IEp1c3Qg
YXMgYSByZW1hcms6IEl0J3MgbmV2ZXIgcmVhbGx5IGNsZWFyIHRvIG1lIHdoZXRoZXIgd2UgYWN0
dWFsbHkgd2FudA0KPiB0byBwZXJtaXQgb21pdHRpbmcgImJyZWFrIiBpbiBjYXNlcyBsaWtlIHRo
aXMgb25lLg0KDQpUaGF0IHdhcyBhbiBvdmVyc2lnaHQuwqAgSSdkIGludGVuZGVkIHRvIGluY2x1
ZGUgb25lLg0KDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZ2Ric3guaA0KPj4g
KysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2dkYnN4LmgNCj4+IEBAIC0yLDE4ICsyLDI3
IEBADQo+PiAgI2lmbmRlZiBfX1g4Nl9HREJYX0hfXw0KPj4gICNkZWZpbmUgX19YODZfR0RCWF9I
X18NCj4+ICANCj4+IC0jaWZkZWYgQ09ORklHX0dEQlNYDQo+PiArI2luY2x1ZGUgPHhlbi9zdGRi
b29sLmg+DQo+PiAgDQo+PiAgc3RydWN0IGRvbWFpbjsNCj4+IC1zdHJ1Y3QgeGVuX2RvbWN0bF9n
ZGJzeF9tZW1pbzsNCj4+ICtzdHJ1Y3QgeGVuX2RvbWN0bDsNCj4+ICANCj4+IC1pbnQgZ2Ric3hf
Z3Vlc3RfbWVtX2lvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsX2dkYnN4X21l
bWlvICppb3ApOw0KPj4gKyNpZmRlZiBDT05GSUdfR0RCU1gNCj4+ICANCj4+ICB2b2lkIGRvbWFp
bl9wYXVzZV9mb3JfZGVidWdnZXIodm9pZCk7DQo+PiAgDQo+PiArbG9uZyBnZGJzeF9kb21jdGwo
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgYm9vbCAqY29weWJh
Y2spOw0KPj4gKw0KPj4gICNlbHNlDQo+PiAgDQo+PiArI2luY2x1ZGUgPHhlbi9lcnJuby5oPg0K
Pj4gKw0KPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBkb21haW5fcGF1c2VfZm9yX2RlYnVnZ2VyKHZv
aWQpIHt9DQo+PiAgDQo+PiArbG9uZyBnZGJzeF9kb21jdGwoc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgYm9vbCAqY29weWJhY2spDQo+IHN0YXRpYyBpbmxpbmU/
DQoNCk9vcHMgeWVzLsKgIEkgY2xlYXJseSBuZWVkIG1vcmUgY29mZmVlLg0KDQp+QW5kcmV3DQo=

