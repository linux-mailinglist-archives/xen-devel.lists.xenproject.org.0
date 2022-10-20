Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2C605B6A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426340.674752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9S-0003W2-4h; Thu, 20 Oct 2022 09:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426340.674752; Thu, 20 Oct 2022 09:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9R-0003Qm-VU; Thu, 20 Oct 2022 09:47:45 +0000
Received: by outflank-mailman (input) for mailman id 426340;
 Thu, 20 Oct 2022 09:47:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olS9P-0001OM-H0
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:47:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3db54171-505c-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 11:47:42 +0200 (CEST)
Received: from mail-sn1anam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:47:39 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5003.namprd03.prod.outlook.com (2603:10b6:5:1e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 09:47:38 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:47:38 +0000
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
X-Inumbo-ID: 3db54171-505c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=CW2Sjpzu+EEGZpXFIVYipeQNHkgG59ttaeRSs3lrE/g=;
  b=c2Xbyv/S7A1T+mKZu+VnK2Gu/JE+oeZP3u03hKehieRCpwnbYC7NsjwL
   iAKunzI3zfM/CHn9ZZt2fDjkYPg+flP35cqZcPzxYSHQ09fmW1zuzjjqT
   RB9n7K1l/wXugjbPXV0xTIFaUID/O1QBtD4xfee0ZwDpLBZ7RyokKaBDf
   8=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 85669466
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:f1ROfapG/MSzAn/xKsJYQKlFlU1eBmJiZBIvgKrLsJaIsI4StFCzt
 garIBmEM6uJNGP9e9BwOt+wp0gD6JfVz4BgTARq/ikxQXsV9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mr
 NNIBB8/aFe6t8Hu7569EbZVqe4AM5y+VG8fkikIITDxK98DGcqGeIOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0oti9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+Sw32qBNxMfFG+3uNBsFqQgVEQMhQ9dFy2/NeQsBaXRM0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/Qjvc4yACcsj
 1aPltaxXzh36uXJEjSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa38716bnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:rE/ohal2o5r048uXgmWY41TMPJDpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhR4tKPTOWw1dASbsP0WKM+UyFJ8STzI5gPO
 JbAtFD4b7LfCdHZLjBkW6F+r8bqbHokZxAx92ut0uFJTsaF52IhD0JbzpzfHcGJzWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7Z86MK2K40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="85669466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbKTDR6ps1JcwFL/ihu0dhIjFZL/m/MUetodNn7mEeGkzx4MITqqBlipbLZi33s8ds6YNbhrINqqgIA43C11FdEnkM22LSH87ig283d4VyLZ71tW4CZgfhapx78IOE6QgFstXcEx9r7hIR7HkZFWx5p22Hfl8EUwmP3Ztq/Ij6IERFlgVVYwFIiYw9+PPBS55qBJZJijfgLyAnjzULoAUqmr0zU4hj2jXgVd8+I3Fjyldy/Ze1It4QZxawDSxnT8YCI6m8muantJVLrYxYsH/oUrjBSiIJoBSON3W2hv5CSmv83lbyfIHUH9Pb/nmBdWxYLn/pvncKS+rM0K2CdaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=978VHNm8HL9oE714Wo1de7N2hjymmg8SC4PEXMhjlqM=;
 b=WytDwgb09+7FH+9KS6eKm2RmTZEDXSaVqXwaXA6vl5B3Q58EW0h2jYQFss8/koCS9MhGp7QMgsxVJY77TLWGpuX/EGcX/SIyy+QhzbeDDtwnJKs6j/6YmvPqTrSYbNghRm5aCho+jke6goQmDwqcaqSy1y4k3hcAVIW/Yg/2fjVGMdTpxV/dB1P62s40Ax12Fw3DplSv9JpyOpEs0wrPJElrti2PcIiXDXp4eBpXm/tQ1ZiIQt7BcUYdYBuJuk1ZiUqVSxrrGBHR9kO+05VAARsYeQZAvrgtZOdRTyIaKqm41NVlOs71bFWvA3QSj15roSCaxleDj0DWqTICGjay2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=978VHNm8HL9oE714Wo1de7N2hjymmg8SC4PEXMhjlqM=;
 b=p6jYpCGjkYoZ8WKlZhMYiJM3u4h/x0VlVA0I8ASPoRnDibZDTPr+NNEYaSqqqjstwifdTsaJETkwrtGE8wdASHm2+JfNrD9zNGM9HNMUp2o+VpYTSSpd5TvWU1NhXKEHUdFXu2yKUSQbK47TVH7jFk9WZ+dpcGNyA/YtWblMjKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.17 6/6] vpci: refuse BAR writes only if the BAR is mapped
Date: Thu, 20 Oct 2022 11:46:49 +0200
Message-Id: <20221020094649.28667-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020094649.28667-1-roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: 778ec23d-40d9-47cf-f873-08dab2801f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5y+vkFWCOT/9Gxr51dmne/8q3Ly+4u92aF6lTTBk36oKt8L0UKwHrmB/cRWLtCVYOuKp7YSRWfEogkeXtKGEdcbJle/Iz+lp3TzZeoctCB6ycitItSBLyOZ+B4RBfGwYwwGAaxabPbOIcRBVgCT/YABNsBX0JSkTcOLcbqCr+bZluv5qrD03leCghcVLHgsBD4Fp5TDBSPNMV37U7RSdeWBv6H9orDqzZZF2R+hTuUdJs/8Q9eneLbek3a1aVLPD0SZnQEoMgjgM2qL/Dr/E1KrygcytOLt0MFJV2a8vJeX7Dbt9ROJGQFNWA2/4knehKfKhjiOoabYaOHDgUC2MEqxWC43HjgNFJYhKlx/EifXqRYNxPm3+jp3gjU9ZCQEkpcTt/EugEykXR1LsmmczQ7uqkStJG+7I7WYo9xjyHF7BtIj8KlcOObB4b4bqlBCaIlntKZAtx0AMp6YvsUDh6SnLe5Fga1qmKdBU0qZif6J5LoCIJWRRV9v8b8lc39S0SPcfjOx5SFN+4JBq0H4/pe+PPQyPPZhtt/aB0J2ftZfntLjSIc+UGeRJ6Bs/70ZKOEfxgXRhseL0ExjE5IyxR9y1FWwaxynXi2wbvZBt9pbQrzi4W3MCffAjPEQ0ep0iRxAEl9aUIwHTAT54j8EAh/qteGw8nFs13rhEmc9DUqoTe0Pi+B82MVzZgKRF2wb+62iywc3e/grMaGjiVjaCdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199015)(6666004)(41300700001)(6512007)(107886003)(8936002)(6506007)(6486002)(478600001)(4326008)(6916009)(8676002)(36756003)(186003)(86362001)(1076003)(66476007)(38100700002)(82960400001)(2616005)(26005)(83380400001)(316002)(66946007)(2906002)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alZkZWRnbWs5R0NRNS90b2w1Z0JqRE9DdFhZczU4MUg1SjNSNnFwSGp1ejNq?=
 =?utf-8?B?clUyb1d3cndvRFZ5bDk5WmlsK29iWUlGTDQxQkQ4WGdjTllNSnNGbjFjcVhu?=
 =?utf-8?B?ekphUHVvSUtQNmZJUTJHSHJqZmE0bHRGNWU5WjAyRGVuYWJwai9DTlh1SENO?=
 =?utf-8?B?a1AxOTFSdElzbko1bXM1ZUpXbWwwTittOS9PWW9lYWVBdEloZk9kSlN0eVlo?=
 =?utf-8?B?Zld3dFZ5UE01bFpuK1dneFd5WC91eFFsYUdpNG1yZGoweXVMdEhqT2xoMlBO?=
 =?utf-8?B?VXpiSVEva3pHZWlzUW1QQWxhVmZMVlRLQmhSbVhxVVdCWTdXLzhOeGRGNUxR?=
 =?utf-8?B?a1g2WEJMVkY1UlpkbmRnQ2FTY0twTzBOR052RS9Ka1NDMEtzam1UQTRqNDBl?=
 =?utf-8?B?UEZXTEZkL0h6b0RkeGxRbkpRVDM0OVVsY2tUL3hMcVF5a21lS1FQVEwrc3Ny?=
 =?utf-8?B?Z25HN2x3MXBhVGhycXlLeWJNeXNFRGZ3dTNocEd5dlpud0VyTVVEQm8rYXNV?=
 =?utf-8?B?QlB4MExrTHF6dTV5T1JkZS9rOU5FVS9TK053NjZJR1dVZHNNbEd0c3JWeENT?=
 =?utf-8?B?OUZTZ2JSZDFNd1VaV21QUzRQdEFIcDhGUVVzNHR0bTd0cHlBZlY4MTNyQnlV?=
 =?utf-8?B?MkZFazZyaElBWVFZL1l6MlNlODZWU3VrbFBlYzZtcGtjcVZFOTVvM2tycDR3?=
 =?utf-8?B?a1FEWmJlYkhha2ordG54V1I1WjF1WWhJRktaeXBpU0hiSk90SUtacDNnQ2Qx?=
 =?utf-8?B?eEN4OWYreTNsUU1KaTUxTlBKdm5XZkFYVHNvbUkxSlhVZUZ4djIxQUVWVGRF?=
 =?utf-8?B?RkZMbXhKZzRTQm82NmZhRkQyUWhUeFJhcU9rWlcrZVdzN3ZBZGRIRDNURWRU?=
 =?utf-8?B?TCtsQnlwUG9KbndhemVDTE1TRlpjWklYT1h4VFBkSDJzSUxLU256SUxHNVJm?=
 =?utf-8?B?dFV3V0dNTkxhaW1zY0EzOEV6WlFQQndNT1p2MDZkeDJ3bHB2L1k5bnZJNXpU?=
 =?utf-8?B?R2JXZXMrSVRzOWx5ZFRnWlhRYjVnai9UZWtPdTIra1VPbkFjMlRkZmhxMkZl?=
 =?utf-8?B?bUx3QnY0bk90SmRqbi9kcnZ4YUxVRHBWWlNXZVdCbjMzUGRJeDBZSWpNZEVV?=
 =?utf-8?B?Nm8yUlJPWFhhZGk1S25WaUxBSXBPN21RL1BHVEdIbmViQ2pqQU5OK2N6MWht?=
 =?utf-8?B?SnJVamhWWFZBSm44NjR5R1JtZE9DRVRHdmRyRHc4NDd2aE82VjRXVklkQ0Vq?=
 =?utf-8?B?SDluZ0F2bHFmOXlQVGcvUFRoSkl4SmdsU1FhQTJUOTk1L1NsMDJQaE9xZWxL?=
 =?utf-8?B?eWNRNktaN0tteEJoQk9xZ1hOWjBucDdPYk8vK3NzaStDYlAyVlQvdmoxZDZD?=
 =?utf-8?B?Mm9IQkw2RFFxU3hheFAvNDBmQkt3ZU1SVFhKbDlaT0J3VmdkaDlKSHJDMDFS?=
 =?utf-8?B?RzBKOXJHdVFMZncrVEpVdW4ybDYvOWM0TUdaT0tBWVplNVNxcGx0TWpQbjFs?=
 =?utf-8?B?WnBaNVp2UkpIMkFxWnB2dlhFZ1R0bVhETnMyV2xBSXZ3K1lMSEtxK1MxNkVB?=
 =?utf-8?B?ZXpZWEpHNHpGcFgzOEJzMk5ZMlRRVUNLUHF5dWZHT0pJYjBiSlNtbVhmOXhy?=
 =?utf-8?B?VU5LaG1FWC82VEx0Z0pucnNnak9vWjNMZE5zNEZjQWhkaEloSVBDeDBaMmMw?=
 =?utf-8?B?aWRXV2pmUm8xSFFNcjVtMjV6SDlOWUY1dnZRc2tDS0VLNU9TQ3VzaXNsbFhU?=
 =?utf-8?B?ZFIzT1AvNWZibVZXTWZZSHBZZUFaVGZNOEU2b3FOM2IzUXYzZjV5RHoyMnl5?=
 =?utf-8?B?YVFhcmdEaUphK2pKNUlaTGI1N0J6dm1wemFHT1c3TFZvWk1vb3BXZWxraVd5?=
 =?utf-8?B?cEtBWHdXTnpHZm96MjU2YlQ2ZExIaXhPQmtHeXhBdGpjU1ZIQS84ajl3NkpX?=
 =?utf-8?B?K2dQV1EzRG94ZmJBWXBwcXZGQjZjY0ZROUs4Q1VxNGZLSHc3Qi9CcVIrNWhI?=
 =?utf-8?B?ZldRNWpKWFZKSzV6RFd6NTNhK2NKUWdqN2J3N1hNM0I2OU51V1hMV3Z6d0Y2?=
 =?utf-8?B?QmQ4c1JQRzYxMmY4VzkzZmQvalhsYUtMYTVidGk1SGo2Mk03b1ltN0tvZUoz?=
 =?utf-8?Q?3q6/x0tbzT372+KGkqXMRaz2U?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778ec23d-40d9-47cf-f873-08dab2801f6d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:47:38.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g780mqa9nZWzkJC/j/dTr0mxyGd9O5vTTS1ETmOuskuS+SLJxUIDgwlSC3cfQC9NCZ14Crb2OXNW7rHjqUD9RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5003

Writes to the BARs are ignored if memory decoding is enabled for the
device, and the same happen with ROM BARs if the write is an attempt
to change the position of the BAR without disabling it first.

The reason of ignoring such writes is a limitation in Xen, as it would
need to unmap the BAR, change the address, and remap the BAR at the
new position, which the current logic doesn't support.

Some devices however seem to have the memory decoding bit hardcoded to
enabled, and attempts to disable it don't get reflected on the
command register.

This causes issues for well behaved guests that disable memory
decoding and then try to size the BARs, as vPCI will think memory
decoding is still enabled and ignore the write.

Since vPCI doesn't explicitly care about whether the memory decoding
bit is disabled as long as the BAR is not mapped in the guest p2m use
the information in the vpci_bar to check whether the BAR is mapped,
and refuse writes only based on that information.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 4d7f8f4a30..4b39737b76 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -388,7 +388,7 @@ static void cf_check bar_write(
     else
         val &= PCI_BASE_ADDRESS_MEM_MASK;
 
-    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
+    if ( bar->enabled )
     {
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
@@ -425,7 +425,7 @@ static void cf_check rom_write(
     uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
     bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
 
-    if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
+    if ( rom->enabled && new_enabled )
     {
         gprintk(XENLOG_WARNING,
                 "%pp: ignored ROM BAR write with memory decoding enabled\n",
-- 
2.37.3


