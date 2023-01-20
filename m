Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41300675CB1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 19:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482081.747413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIw5r-0006Jw-Ef; Fri, 20 Jan 2023 18:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482081.747413; Fri, 20 Jan 2023 18:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIw5r-0006HM-AS; Fri, 20 Jan 2023 18:26:27 +0000
Received: by outflank-mailman (input) for mailman id 482081;
 Fri, 20 Jan 2023 18:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIw5p-0006HG-Ud
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 18:26:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1527ad8-98ef-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 19:26:24 +0100 (CET)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 13:26:21 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5107.namprd03.prod.outlook.com (2603:10b6:408:d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 18:26:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 18:26:14 +0000
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
X-Inumbo-ID: f1527ad8-98ef-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674239184;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+8PIQQTOGqRVI6KquiLcSlBrSlvtVdURhGAI0uKhxaI=;
  b=gjvTKvow08l25CyPkQwEBb6/55o4w1A0BLUU2PT/CdylqO2Uekkeh/nd
   2ySLM0RZxNM70uqF8lWb602FAGV37283kvpQgInhnNqJnqIhMnBiSjNSm
   uh92Zd3lg/QTwXT55rV9kSrgX8gD6RWKqcRs/6pQXHNa+LgQy09pD7Ec+
   0=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 93012448
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1WbXiKKelu1t1mBkFE+RG5QlxSXFcZb7ZxGr2PjKsXjdYENSgmcAx
 2EXX2iEPa3famXwfIxyOoiw9h4PvMCDydYwGwdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wZmPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5nPEFSp
 KJfdgpQURO8hrPv7Y6UTMBj05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHijAdhOSO3QGvhCowa5xkBOK1otDUKVqsfgqk2GSch0J
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN0uYdUj0qy6+RXLhmyqr52QFwotvFyIAySi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:bfrV768QNtfgtckBziNuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93012448"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAsMHTWmiPiBjtCfmvUPDfrTZjacXWvQ5PUKKBJ5oST9bYiP65xe29/+DcJ1csHRINJfz/7Rzzjz5E0oADm0wLdyIicUIzvRMjlBF1dsZeTIsJVMzURkGsN/wgaFzr6ck+uofS1mAP5ADnkUkzNXWwX1ev42vRhKiqiloyqaGIaqLFVVvEcdwn5V0HaJiGtahhCYW+m1WE3xoYrR9/oEnpNqDx05HE5V735u6VdImf3siKJTMnH7DsevBmB2BPDpH0XycR8povX8cvq4HGu7SA0YfKX9PGva2wYeSBW7Pu1q8D59Pa9x4KmCoMlYEue1leP6x+uJMbGBESKgafE/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8PIQQTOGqRVI6KquiLcSlBrSlvtVdURhGAI0uKhxaI=;
 b=PIKOIcBcKrcu/DFmjZbZVNtUtUk1zI3cmjjpXjjC1XUDeIH8GZWVbD+F2kLUzo6cIgDmMDr1GJWUS3/Ar+wvBwuqxpLmsJqDcYc40nyGb97PKA+6rIg6qCakCwoImOLUMV2psVmVqPjcw1VXmNBEzXVECSbc5ZGlChfwDqjv+octLDsQSXgrJ3H6zxANrJg2SvfvywGKUTRaYTmABXd49lXuMnzVrUrwbou+F7JdLvLybGHOQQzXfoLKTZvP+FySefQPB260nTqr3YUtVUwPynEcx6tzQ2WVdcq/VCZgqmKnaPIPhJhcCf23s4kqCPs5Kswh7LM4led4i2mXsnx6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8PIQQTOGqRVI6KquiLcSlBrSlvtVdURhGAI0uKhxaI=;
 b=QQrD33Rl4A4ULcGT4EH7+qEA7jZqpEoJMggW6HOYlsvlJuN1UjCP0uAYuIAIQytJoqlMnKumE+83tcSkKaUhN60KTB9Pmi5Bm9ijYztqbmxLf5tbNAdL2aGIJk2Tw4ZFgix1dojqFqEccuXZr2q32cbifX5Q7QCW54s9iSEwrlk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v4 3/3] build: compat-xlat-header.py: optimisation to
 search for just '{' instead of [{}]
Thread-Topic: [XEN PATCH v4 3/3] build: compat-xlat-header.py: optimisation to
 search for just '{' instead of [{}]
Thread-Index: AQHZLBn5GrvhRXVc4kihDJHcjkxEVa6noSaA
Date: Fri, 20 Jan 2023 18:26:14 +0000
Message-ID: <60df7795-8f0b-e0f2-a790-2e00c0d4db2a@citrix.com>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
 <20230119152256.15832-4-anthony.perard@citrix.com>
In-Reply-To: <20230119152256.15832-4-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB5107:EE_
x-ms-office365-filtering-correlation-id: dd5cc9ef-073e-4136-b0c3-08dafb13d041
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eFVSuAVkLnYC3Uhk8kUqb+vwK/ED0R3OyMJxnnMRCTxCTJDEg81MlaffjciFGiESsD57aYS9CCDpS51cNp/ZVL4wg3GvKJ9Ri05LBxeoa1nb+oa9Wo642cHXI6fLchopf1jkMIdjLCnjvMqoAUbEpVv1S3mlsNnqvdkKab53IppTToNnJ+beWWHfeAQiUo1AlhR9d7Wfp+zkLc8YR6qNmvJ9My6i80eDdingwYWK3ggnFZyZ9nz1f69UONsGDQVGOgaLpzgIhSPJ5gizQmKiBuCAulOapzSmtG2pmeHYTDTf43ai0Zq0HsE02fbB0554DtqNnyizHLaEQr0SiGfSS0N3ITaoUSgKRgMBZ2DnGXCjmJnKVDQM+13DFWOo10JghjUnLwSoylrdrgabcuiFrMlT/je3wwREN7/zcyU0t0cL2FlBq6eWTGmSGblvwZoR8rBNF2i66P22nZ5oAwELOlKdtu8iNutRbMk/y/QDmmGmmad3F3y0YYerEewoTM5npIoFBSvvSur4ayQcewiCrQEedDd46qPr5qTxXGAcoT5KvSqHzzgvfESATqYl9gPbqLcXuryqev+UsHMnTH/plTE0fB2Iuw7157Eu47hqhFxZAKy3k8YycxcHL1H69ak0sapSOFp3pgNSJBkzY2ugSZYXcyd5GexHiE2LBAvHgGiTP6rOfWWb+ZT5SrA0m2mxjBbUqyUyT+qWYWo0U53ph4WlFSsAa3DpLgJB1yfuxB1XN7ov9lR3GGEc9DErBMIJDq4o2qaRNZXiLWeh7o4gTY6uF1cmhGnz8KdjZs0xxPU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199015)(31686004)(36756003)(38070700005)(86362001)(66446008)(2906002)(31696002)(8936002)(82960400001)(66476007)(66556008)(4326008)(76116006)(66946007)(8676002)(64756008)(83380400001)(5660300002)(122000001)(38100700002)(71200400001)(41300700001)(110136005)(316002)(54906003)(6486002)(2616005)(478600001)(53546011)(6512007)(91956017)(186003)(6506007)(26005)(125773002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTIxd0dJaEhmRUwzZHZJSUdDUmtOU3pTOGpNK002KzdmMkwvK0lvelNpM1Yr?=
 =?utf-8?B?dkxmNndVTWVHSlhNdUE1Y1V0UHR2cVpYS09hVGdmL0c4WlNwRFRSQXpYMDUv?=
 =?utf-8?B?bHdPNW5vMnMrYlUrS0lyN0pmcXhPeTJQYmxiQmhWQnhlN0psRVZPZVNpcThz?=
 =?utf-8?B?WWQ5OWJVU0kzNDhhT0pvZFpQMVRTVThmVlZHblVUL2lOSXk4clR4VGNFUlBu?=
 =?utf-8?B?VzM5SDlIQ1M1ZVRmRjFpNXFnYU1MYXpXencxWkExbW91L202bTdScXZuWkZY?=
 =?utf-8?B?aEZNYlBwRkw1OS9pTExSdi9XaGpUc1BaZU1sa0xMZnNoOUpOdFpLY1Rib2cz?=
 =?utf-8?B?U25WMW1odlpFdWwvVmptNlVyYUNQWTFzeDdWZWY3a1BjZlI4a1BVdEtQZ3ZI?=
 =?utf-8?B?TXVCd1VmSFV3TG9abExzaDNyOEpoNWdrS0Zvc3llVVA0bFBrWGhIaGpyVEdh?=
 =?utf-8?B?bDU0aUFrdmFCUTdZYkFwbldwendJZUtnWFBkMVZCbGE5Q1AvdnZIMmt2bmV4?=
 =?utf-8?B?bUlKeDhiajRuMHJuTXhDbzFUcGxEQTVaQy94SWRsdnFzNjhoRExSRXl0RElK?=
 =?utf-8?B?LzNQdnZhWEEva1MvL082RjBENHduMnlwaU1sYTN1WXdSZWsyZnowblpoRndj?=
 =?utf-8?B?QnhCbjhjVlAwOEJtSzMzTm1uRysxSjRTVzhqYWlCUlE4RVJicmZyczVlVk1v?=
 =?utf-8?B?dHhLSWtCTjVxdktnWHF0Yk9qaGVTQUc4RTlVdG01bnprSGhlQVZLNmg2WUF4?=
 =?utf-8?B?N3VUYnJTNFN0Nm9Sd3h6Vk1xTlQzVzU2RHF0VWg3a29pdEc3Q2IrV3dqYXN2?=
 =?utf-8?B?ZUlEaU5qMXZLMVhDUjQrUlRsREY1ME9EQ3plb0dXbS9uKzR4VVN6Tm9lU1pH?=
 =?utf-8?B?WVZYNjhrbk56MTBrbHkrZHRsL2NCLzRnTndHajJmVGZCaW5wQlQweUxKQ2tx?=
 =?utf-8?B?VU1kcGNWZmF0eWFzbnNYQWQ5YXkvZ1NwOFEvY0NDbWY5ZjVKTW5vTWFTempJ?=
 =?utf-8?B?bDFqVVhtcnVwYmw1YXoxcnRNRVdUOTVoS2xTMGMzRXFncndaRWwvZFpEUE1r?=
 =?utf-8?B?NC8rV2NMWmhYUnB2KzRsY2o5aktHMmFvZjliT2dzcGZEVjllVS9kU0I0aW9h?=
 =?utf-8?B?YTdUN3E5Z3hyWXMxVFZQdWRsdFprdTFNRmZwOHU5Q1NwekZtbE5RRWRlbDY0?=
 =?utf-8?B?N2FHUk5tV2sydDc2eDJneUwwbTRkdnQ4VEtSdHo0b2pPS043aUVtU0UxVzJu?=
 =?utf-8?B?SjVYUnhHNlpXSzhVSzlJRHlVcUJOZFRacm15YUNFdTVyV1IwN0xSQjg0ODZG?=
 =?utf-8?B?N0dzWi93ODFuQkJyTUdLYUNQTktuaTVJa2tMSDc5Zml0NmdvZ1NJUkhyV1do?=
 =?utf-8?B?RUdwSWE4TzExRlBRYXFWanNuWTgwaFQzMngvODV1QVVseWxUWkc0N001TFFx?=
 =?utf-8?B?eHdFYzlSalZyNVVrbVJxVUJkR1htTmo4cEN5ekNQeUljc2V5WngydmJ4VC9Q?=
 =?utf-8?B?TnpjMi9jTzQ3Q28vRnFKZWpjOEVoeUNpUTNOcHBlZkYwcTZSYVNsVk4zZTdE?=
 =?utf-8?B?VlZYTW8veVVpVUJXS01ZT0Zhdm1iVjYrZjNFWEVjT1g5QXlLdEhGVStDMUVt?=
 =?utf-8?B?U205Z251QjVQMkZaQTV3OWZiTUYxMmV3dHZQZ2twL3Jhd2JINE1GbDBVNG5w?=
 =?utf-8?B?bDYvOTJEbGlHRUtmZ2IwY3pqZklSLzM4QlBIemZScmlBUk5GU3ZEZE9xd3My?=
 =?utf-8?B?Y2d0cmdoeEtoSHJyWVRhQWNsVUIxVkRGZ2g4OURGTlBnSVZ5aUtCTklzanBU?=
 =?utf-8?B?MmNpMUR4UUhVTmhMRjF0Tzd0M1lCK0h6aDVIMkVoajc5RnZyZXovWldSZ1hj?=
 =?utf-8?B?OHEyZEd6Rld6TFRzaDlRL2svZzEweXZtdGNtRnVBUUxvUEc1ZExRV1p5bUl2?=
 =?utf-8?B?Qm50LzJUaFhycGVnSHlMRFJGR0JkeXZxbzBFakgxTUh4NXNRV3JlMGd4Q05v?=
 =?utf-8?B?US9oUHNmNzcxTGRUTTRzYlBocUZGcTQ2dTVVcE5ROVlyQ2hGTmNjS21KWjlq?=
 =?utf-8?B?bmVaT2czVmVKWmtXQWsxbTZRcHUxdXJCVmRrK3lwaEJKQXJOUUtjNlhqVVBH?=
 =?utf-8?B?ekRrQ1BiR05hWmliaU40TXFNK0pUSGRRNkxyZmNBajNKcElOSGZnb2VXRUlx?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF5D1CABAF8ACC41B2CEE2D42A7441D9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cC3AvLezCymNfbJp1VdO0vLJ9aPSEF87XPJt5BKPT++U2ZvUiC+ggAOSE6Nre+iFXsEkNFueyJwyk//F7VUBN1g8PbT1U7ZmPK+505nCOYCk0/qEjJwyneQ2V1MwhVTxLReA4FhLRdXalzJVn8ucMUkQowXr0pV96xa+GA8uBV4JDDFwCzBDUOd7eRNNH+r9U+RoY4umhEs1uVIJ9MYBfYv3oXWDu7704cnHn47KnaffzpHws/amh5Xe/fN4twnZKBUYXqRC9nmm6eke/NZlinO3uVPAQRh4WN4V1siBKr9/q9yBMe7Izq7iyEaO3YMHS5eUYrZZIvuzt2z0Bh16e+WfCXJ4soEfEtpx0YVwEbU0xNPXEutkkYPFjwx2ntYecjGQxAKNXjqsAjYRSZCCdqW220sJcFZso19KsEgROTJtpFOCP+XzJj+aVxOGg6QZHXISe1CpqBPHiydwTgqXShXNPftZ+YsMznOWBoPnftumFcJfh8jb1MYNXSW4des2Z3+N66YMmS8k4ehZi3PhUDKAnftxv692HP7BEKVqivvd8DfV2z2ETmSgLusDme/rAwmegRP8C+StBt5IDeKRfZ7UDGzZzEA2L1U9pv0kqLoXNpwyaXGGKhP0YNfqRRZhoUJploSYBmqMd1PaKS0YTekUtLQVt5Dt/cOwyFPvsrNkVxcV4ieHHuPpAFzxEGFi5a7OZID2r4hhlD40qedulKd5mMI8JZDtGV+mRitcD2MjBfhTQ5hna/QuHbyw5d+9zpJRx1S6HgpxGumb84xHJ5YqpShnyDNh9vc8x9Cha+VnX5fGm+LFRvKG7lDZQrrrjOJS9GpVLSeigzGMLIPjnvGRiJKBRZjSELo8cJxIbPw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5cc9ef-073e-4136-b0c3-08dafb13d041
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 18:26:14.2637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gji6ReEJQ9YK1AU5uFKNg4/Ct6n53TED5WlHe5BP+fdPE9+EwVvB8Ls6t4+L+/rPWqzYMC921Yu6GUMeOHIRt3wFRTNxX0lke7Q8Jt+IhAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5107

T24gMTkvMDEvMjAyMyAzOjIyIHBtLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gYGZpZWxkc2Ag
YW5kIGBleHRyYWZpZWxkc2AgYWx3YXlzIGFsbCB0aGUgcGFydHMgb2YgYSBzdWItc3RydWN0LCBz
bw0KPiB3aGVuIHRoZXJlIGlzICd9JywgdGhlcmUgaXMgYWx3YXlzIGEgJ3snIGJlZm9yZSBpdC4g
QWxzbywgYm90aCBhcmUNCj4gbGlzdHMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiAtLS0NCj4gIHhlbi90b29scy9jb21w
YXQteGxhdC1oZWFkZXIucHkgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vdG9vbHMvY29tcGF0
LXhsYXQtaGVhZGVyLnB5IGIveGVuL3Rvb2xzL2NvbXBhdC14bGF0LWhlYWRlci5weQ0KPiBpbmRl
eCBhZTVjOWYxMWM5Li5kMGE4NjRiNjhlIDEwMDY0NA0KPiAtLS0gYS94ZW4vdG9vbHMvY29tcGF0
LXhsYXQtaGVhZGVyLnB5DQo+ICsrKyBiL3hlbi90b29scy9jb21wYXQteGxhdC1oZWFkZXIucHkN
Cj4gQEAgLTEwNSw3ICsxMDUsNyBAQCBkZWYgaGFuZGxlX2ZpZWxkKHByZWZpeCwgbmFtZSwgaWQs
IHR5cGUsIGZpZWxkcyk6DQo+ICAgICAgICAgIGVsc2U6DQo+ICAgICAgICAgICAgICBrID0gaWQu
cmVwbGFjZSgnLicsICdfJykNCj4gICAgICAgICAgICAgIHByaW50KCIlc1hMQVRfJXNfSE5ETF8l
cyhfZF8sIF9zXyk7IiAlIChwcmVmaXgsIG5hbWUsIGspLCBlbmQ9JycpDQo+IC0gICAgZWxpZiBu
b3QgcmVfYnJhY2tldHMuc2VhcmNoKCcgJy5qb2luKGZpZWxkcykpOg0KPiArICAgIGVsaWYgbm90
ICd7JyBpbiBmaWVsZHM6DQo+ICAgICAgICAgIHRhZyA9ICcgJy5qb2luKGZpZWxkcykNCj4gICAg
ICAgICAgdGFnID0gcmUuc3ViKHInXHMqKHN0cnVjdHx1bmlvbilccysoY29tcGF0Xyk/KFx3Kylc
cy4qJywgJ1xcMycsIHRhZykNCj4gICAgICAgICAgcHJpbnQoIiBcXCIpDQo+IEBAIC0yOTAsNyAr
MjkwLDcgQEAgZGVmIGJ1aWxkX2JvZHkobmFtZSwgdG9rZW5zKToNCj4gICAgICBwcmludCgiIFxc
XG59IHdoaWxlICgwKSIpDQo+ICANCj4gIGRlZiBjaGVja19maWVsZChraW5kLCBuYW1lLCBmaWVs
ZCwgZXh0cmFmaWVsZHMpOg0KPiAtICAgIGlmIG5vdCByZV9icmFja2V0cy5zZWFyY2goJyAnLmpv
aW4oZXh0cmFmaWVsZHMpKToNCj4gKyAgICBpZiBub3QgJ3snIGluIGV4dHJhZmllbGRzOg0KPiAg
ICAgICAgICBwcmludCgiOyBcXCIpDQo+ICAgICAgICAgIGlmIGxlbihleHRyYWZpZWxkcykgIT0g
MDoNCj4gICAgICAgICAgICAgIGZvciB0b2tlbiBpbiBleHRyYWZpZWxkczoNCg0KVGhlc2UgYXJl
IHRoZSBvbmx5IHR3byB1c2VycyBvZiByZV9icmFja2V0cyBhcmVuJ3QgdGhleT/CoCBJbiB3aGlj
aCBjYXNlDQp5b3Ugc2hvdWxkIGRyb3AgdGhlIHJlLmNvbXBpbGUoKSB0b28uDQoNCn5BbmRyZXcN
Cg==

