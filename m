Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B94A44C61F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 18:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224364.387652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkrbA-000743-1w; Wed, 10 Nov 2021 17:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224364.387652; Wed, 10 Nov 2021 17:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkrb9-00071Z-UC; Wed, 10 Nov 2021 17:41:23 +0000
Received: by outflank-mailman (input) for mailman id 224364;
 Wed, 10 Nov 2021 17:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qBHU=P5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mkrb7-00071T-T9
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 17:41:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67c7cd99-424d-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 18:41:18 +0100 (CET)
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
X-Inumbo-ID: 67c7cd99-424d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636566078;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=DnG8f7mYXbCibzcKhMAQSNWt6C8qn8tICSvJpP1yxkQ=;
  b=ci3LcADJ28I4J3WKnGWdhnLfArzxbnnT1KMadEg7CMBDnzDhON4b3/cq
   hnYMmHdvXdSqiZe5vrhMepMEYoXwtYUuS5gZiv/ozJxchtZnd7mBlCxah
   0YRocv+C2tae0n0IzCkBY7UTa158OD5AkdUxksJTiKk0NfDXxl4WPs6m7
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xu2bCze7dVLkf8FWaYcLy63QyWKRNCex1IafC2FyOzBH2KrAmCuxShsH/q1f268YHiGC+GNaUK
 wmpOq4HVj99BYC9g2ehMAaor0cfN+I2BKyaXKX5xqxR2EVvGMI2HwPyJo/FKE1tps2cMheTT3k
 7Dxb8Q4sT303nyE92z4UJIjOyrexgX5cNqD/FRDm0WmkVJfZV5OkWD/Ex7BIonAFdzF3HLW5Kr
 s3YF5r4TZz9Cgnl1v8zylciilgFCpnN1hmyj5enfZQy2QlaPBQGvO/b+f3wFNkb+fehROm3JwP
 m7kSloU0wIbStvJToTN0cXvq
X-SBRS: 5.1
X-MesageID: 57533566
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GF8FmqtpVhAxuWZo6TnVfsAMx+fnVNNZMUV32f8akzHdYApBsoF/q
 tZmKWCGO/iOajT8cot+PYXj8EoPsZfTxoI3TlRo/C8xEiND+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2IDhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplpZqeUBw7OrT2tMc8ShUHKXwvI4ga9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258TRq2DO
 ZRxhTxHaCX7Ui1RBm8rApMxs+SVq0vSdBp4pwfAzUYwyzeKl1EguFT3C/LXcNGXQcRenm6Du
 3nLuW/+B3kyNcOd4SqI9Gq2ge3Clj+9X5gdfJW6+eRtm0a73XEIBVsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0RN54A+A8rgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BFTpBqaaHTWun2pS1tD/tA3VEM0peanpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzlyPBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBu6nt3N702wcH83wdG9KFoCbLkWd4umEWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq+CKyENYYTOcQsJWdrGR2Cg2bLhwgBd2B2wMkC1
 WqzK57wXR7294w+lFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNw/4Iy7yWp
 y7lASe1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMPr4SPFNZ4E
 KsIfduuGPNKRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZu8
 ae90g77QIYYQ1gwBsjhd//ynUi6umIQmbwuUhKQcMVTYkjl7KNjNzf10q0sO8gJJBianmma2
 g+aDA02v+7Ip4NpotDFibrd99WiEvdkH1ocFG7etO7kOS7f92ul4IlBTOfXImyNCDKqoP2vP
 LwHwev9PfsLmEdxn7B9S7s7n7gj49bPpqNBylg2Fnv8cFn2WKhrJWOL3JcTu/QVlKNZowa/R
 mmG5sJeZeeSIMrgHVMceFglY+CE2a1GkzXe961ockDz5Ssx97ubS0RCeRKLjXUFfrdyNYokx
 8YnudIXtFPj2kZ7bI7eg3AG7XmII1wBT74j58MTD4LcgwY2zk1PPM7HASjs7ZDTM9hBPyHG+
 NNPaHYuU1iE+nf/Tg==
IronPort-HdrOrdr: A9a23:RfVbq6qfAdrTj2aO9wmAce8aV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,224,1631592000"; 
   d="scan'208";a="57533566"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBhZTZsG5Hq7cTDZR0pKwUzH4TkPo07YWVIwLWGVE9FKeuX1u6XI2AfkrSgJUazHY+yJoM4hBK2FZapbHJrc1p6fp8mbjpW0TDTiucDwsJHaFRwmNQgOgDsA5Ol869lEtPrdXUN71f8ng56V8Y+qPNIJkd2eBxU5ykHqnFMra8cIfnN1cPkqVLGFI6VehAbPdoc197+wBVRgV2X9hTgMki7mY44nmjI8ZkXi9W+J50jnf41dBFdbtBjoHiKJ9gTS7aF4ZndMF+m2jXyIwmQfobhbL7HcpSkNkVTvmbNzZGvfOitOdG/QWX0RroPvopuJPgA5FsBcE6b54eS9hg5nRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z62eFgG7TJsIfQgs8QdvZn2cNIXsrbyzLqH8IDsikzg=;
 b=XvXGQkaajc6Y2ymEDbkKnorEZhPnfJ5GKu+WHMxUYk6gXTMIHpQjiKhLPS66IMWGntwBvqGnJzwmtLDqi4A32Fw2XlNb2YXwAjj2/6sZI014CafTgXCbQ+ITQN6ygyHZZitYjwKkbIKkJ7HjNevYdnEkvGo3NC+INkJIrjsqgTNvoN/TApudXXANggDwv/fSqEtYPCUKkWGpI4qZlnDHv/BWCWXRK60sTEKE+WD2LNTLT1uLVnN0YIrpJjMrHg2XbPZX2XPSpbm5mFpBAN/57fVzHkEKky42C+D5zaR9R+tSAuYZskVmMW2kFfCj8sbLXO6XTl8SEp2nD0NTWISp/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z62eFgG7TJsIfQgs8QdvZn2cNIXsrbyzLqH8IDsikzg=;
 b=IpxRDaolYbLgb5NM/Z1MYmqwBu9GiDlowYJYVfHNAhky6nUAmTrZ5L3vE8kUcosinfAhPqDdarUBoKN86jiV93nvyrTXeJusLYNtO4Us8d3ApNlrSNllgmIPviIXHbYwJ/2lQZBWgNkAt+uGGZlX7qsp9ZR6JEfs0tfxnqtrYLw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16] x86/cpuid: prevent shrinking migrated policies max leaves
Date: Wed, 10 Nov 2021 18:40:59 +0100
Message-ID: <20211110174059.64633-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e37cc921-a31d-448d-9fbd-08d9a471471a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4972:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4972DB31CA8822858842212D8F939@DM6PR03MB4972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fAWhjFhWxNFTljBBI/IRnmcbmYha5tP620ZghPOt/1pTrPDCB9ZnIO6JOU4TLEOlIt0ZKUyVGeDJPdfoh/FE4RokEnRMEN4KuR7dVjM+jDqkwEYpHKjI1qsYIDvLCjc1nxE0SANWhTn3Z0xklGJ4jp9I25ysKhz21wPG2ER+i7vpBj+R2RnUcRlJtCbpYEbxkugfAf6jLc44oQc4scdT1e1RA1eeuUPaYKbAnuPCBxj4Ibxk3nqKTy1m8xqoAen5zu1GgjP4L83pbOufcxjg41YbkFqkdQ4TehRT2a/5VQlDUweDDYenV5e6qgbEHkv+j2ZrLfVyV5usa0dso2zJpPOydzh2+RGsLUy2bmFxVcZ8aJvG0SWi4A80SI191YLY7Fb643uw7eNw2WgveTm90Oy01f0thQtJi+RewokJiwxJvZs9ndiN3y4kZe8LWH/K8fJ2JkYIoL7ibkMyfSzy86h6k1MWYj5FsEZ3OPzG/AxTQ1k3YtbHLuit3pDuCQO4n4ZK0w2uvo0XfJ4OHwRaV+3lzjVWrkqBePkdHuR3+SykE2elW1wR/Vw7eAJzWshe/LVkFOO1KsTpLcpKGuAiYZZNv8YYtpe6GFcbxb9L/FH//z57PrD7HeP7NpvcxLObvWkarIr+1143vNK68pPEZoUjz3SRrwbCSLb/Z6vwT8szBKcoA0YSjxSpXCNQD6RvnV1Qfx6bOScomI5hh67rUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2906002)(83380400001)(38100700002)(82960400001)(316002)(66556008)(66476007)(1076003)(2616005)(956004)(66946007)(5660300002)(86362001)(8676002)(186003)(26005)(6496006)(36756003)(508600001)(6916009)(54906003)(4326008)(6486002)(8936002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm5kU1l0Z3BLTytCSzdVYnVOWXR0cDB3amtoeXhYMVo3Zk92ZFlIVTN0cThL?=
 =?utf-8?B?ZFdCeWZYUDk5YUE3UGFHQ2N2bFdXMWhUNHFnb2VkWjZ0a3BFaldMODczMU10?=
 =?utf-8?B?WnZPakUxSTVHaXp3cjNPNjd5Wi90MVBuN3o3SWJGSFdYSzE0MlFzSi9oZmNF?=
 =?utf-8?B?Sm45WGNyYnkwS3ZGRDE2UERHS1RGdXNWaGdDVndVUmNBNmE4KzJZSWFzelJZ?=
 =?utf-8?B?a2ZQTGthZ3NsZUE0eDk0VVpQRXN2dXNtM3VTWnZKMDdPb1VNYndHckJDMkw1?=
 =?utf-8?B?QUh4Qmg0MStIdFNHQk9XQUNIMlEyNm5kZGN5N29tRXY4NlFPZXNDVE5jbDZB?=
 =?utf-8?B?MHhjUzMyZUpucmpSa0hXVUEwRHM0S2VLRUZuTG5MaU94S1B2UTNqSUFvcnlx?=
 =?utf-8?B?VUZUV04xUFgyUWFpS1UrbTQveG1WQlNNREhPV2ZNK0lOOUtvWGYyOXBDT2xO?=
 =?utf-8?B?OTdTSlJtVW9DYXFCM0dnTFJCdm9rTjdzb3dyQVdXM0FYNlFoWHhIKzFWTjVC?=
 =?utf-8?B?ZUwrVUgxTHROVmlONUF5eDlBSEh2MTlWRG5lRkNoV2FHemZHU0tKUVlRQ244?=
 =?utf-8?B?UVpFMzc5SDV1Mm9zbkMzOVBFR1Mwd3NMV0dtK2NyeGp1M2RWK2RENGoraDEy?=
 =?utf-8?B?NVoyUVVtUUVOSDhNT294QWFneUhJeUIvdkdJdWVUczQ1b3kxMlJsV2Vxem8x?=
 =?utf-8?B?SWtHQjNJd3p3ZUU3Qjk2TVVUR3AwaWlBRm5SVUlRMzErNk5IMHg2SGltVmow?=
 =?utf-8?B?Ym9mRmpwMkVoc0oxU3o3RzlXaWY4SXFubmp1NnVnZVZXTENNMHZYSmMwUGhr?=
 =?utf-8?B?czBsdTEvdnIvL3doQTRnNWtQWjVQOXVDVEhycmxSbW42NlV0SlZzYXpjdnJm?=
 =?utf-8?B?ak4zc2ZhUklaT3VvT2w2UjlIL08yRHMwZWI3Rk1OdkY3cUNzd3ZNMSs3TVBq?=
 =?utf-8?B?UW1hVTFCbmlzODVqL0JOaVkrRTI5NXhmem9HdWJtanRYeURQbkxsa0dkRWM0?=
 =?utf-8?B?am55SXVudEZrU3FNVTM0RUgxNEdTbVBFZDVVQzJMWEZtanBHOERLOTdlV25E?=
 =?utf-8?B?RVNsbm9BelNnb0htYWthRklRMVNhYWk2dkZaNG1qUkR2K0VIM0hyZVpLVG9o?=
 =?utf-8?B?ZC8xVjg3WHBvZytxVnIzTnRUZllpa0VSNjJJNEJTVnZlT1dHZEFDdCtSQ1J5?=
 =?utf-8?B?MEVuR2U1TjlnL1FJdUpWZVM4VkhSbmk2Skx3dVQ5d0IxTURESWFJMTg0WGVZ?=
 =?utf-8?B?SWRnck4zZStIcWtqcWMrUG5PN0lhazlRanNSRFJhUzlndjEvQ3NHSjV2L3gr?=
 =?utf-8?B?UzV4N3hLcmJwUFhJK05ibEZiUVRQY1BPTW11OEVEQmJnQ01tV3hlMWVmY0pK?=
 =?utf-8?B?Uy9ScmVhYTAxRHRXYWYyczY1T3gwNlRvL3NDZFF5Q21jZkxmQ2FpOEExYjF1?=
 =?utf-8?B?bUIxNTVxWDNNVkFmNXRTck83SlRDOU5ab00rVDg5WGpvektadVcyNThGMTd6?=
 =?utf-8?B?eWkyRCt2YlJaUDZMYnJXK0IxK0w5NTBzRll3dnh2OHJYbjRZUDVXWUsvdkhE?=
 =?utf-8?B?MFhZUWdRWkhvbC9VelRELytHS016OUtvQ2JhdkZEV2NDZzdOTktNWklnTTdI?=
 =?utf-8?B?QkltR3F4SDI3STZ3aVdYd3pueUpXRE1TNXpGakQ0amgvNDB1bE5uOERtemNK?=
 =?utf-8?B?QUVXYU1ZZFhOajV4bTBsZnhVUjArRi8yanFrU0NGK0MzWEZsSXFtaElWeFNC?=
 =?utf-8?B?dmpIMTEzaTJhdVZXeDBaVWJjakxrVVJvNHNUaHBHV2ZCYWZWVzJ2REtVaVVT?=
 =?utf-8?B?QzloUVBXeTF2WE9JeE90NHFkZG9QYklTTG9WM0pJQU85ekhQbHJZWUtmZGRJ?=
 =?utf-8?B?cERjd3FEUnpzUTVBSEdHTFNPdXRPeGE1UmR1RTFBbnBkNkxheGxZOWRVQWk4?=
 =?utf-8?B?QThSR2c2VmExOGIyQ0xFME5jM09UYm81cW4vcXJiNnFMSlVPOGV6MTc3OW5N?=
 =?utf-8?B?OG1Ra1hwazZ3cjRsWE03UHVnWW51WFBKcDBOVFZScDRPMXZqaEVNTXNaOUZm?=
 =?utf-8?B?Y2F6a2k1MjJSeDErZHNjMko5Vk5wKzAvSHU4dTh4d0lNS05mb2NVNjZXMmZ2?=
 =?utf-8?B?OW91NFZQVENVSGk3Qmg4ZmFabmh5aFdiSmVCc1NuUmZ6Qm1xYkVSZEY4VHhL?=
 =?utf-8?Q?1KFiYEuCpvY+lEQ4kQP+gw0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e37cc921-a31d-448d-9fbd-08d9a471471a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 17:41:08.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6WAJmE/dSoBQ51dvgLeyErR/HGP5oJmM858hZGGlWbdosOc6hvB5jRXdFYDlWJQcIh/vIgMOVlW3R2GScl1fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972
X-OriginatorOrg: citrix.com

CPUID policies from guest being migrated shouldn't have the maximum
leaves shrink, as that would be a guest visible change. The hypervisor
has no knowledge on whether a guest has been migrated or is build from
scratch, and hence it must not blindly shrink the CPUID policy in
recalculate_cpuid_policy. Remove the
x86_cpuid_policy_shrink_max_leaves call from recalculate_cpuid_policy.
Removing such call could be seen as a partial revert of 540d911c28.

Instead let the toolstack shrink the policies for newly created
guests, while keeping the previous values for guests that are migrated
in. Note that guests migrated in without a CPUID policy won't get any
kind of shrinking applied.

Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

This is a regression introduced in this release cycle, so we should
consider whether we want to take this patch. It's mostly moving a
shrink call from the hypervisor into the toolstack and making it more
selective.

Main risks would be this shrinking somehow altering the recalculations
of the CPUID policy done by the hypervisor. Removing the shirk itself
in the hypervisor shouldn't cause issues as that wasn't done before,
and reporting empty max leaf should be fine.
---
 tools/libs/guest/xg_cpuid_x86.c | 7 +++++++
 xen/arch/x86/cpuid.c            | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 198892ebdf..3ffd5f683b 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -638,6 +638,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
+    /*
+     * Do not try to shrink the policy if restoring, as that could cause
+     * guest visible changes in the maximum leaf fields.
+     */
+    if ( !restore )
+        x86_cpuid_policy_shrink_max_leaves(p);
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 2079a30ae4..8ac55f0806 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -719,8 +719,6 @@ void recalculate_cpuid_policy(struct domain *d)
 
     if ( !p->extd.page1gb )
         p->extd.raw[0x19] = EMPTY_LEAF;
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 int init_domain_cpuid_policy(struct domain *d)
-- 
2.33.0


