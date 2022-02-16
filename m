Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8D4B85CA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273931.469269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHap-0007pE-9F; Wed, 16 Feb 2022 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273931.469269; Wed, 16 Feb 2022 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHap-0007me-5H; Wed, 16 Feb 2022 10:31:27 +0000
Received: by outflank-mailman (input) for mailman id 273931;
 Wed, 16 Feb 2022 10:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKHan-0006QF-EG
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:31:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9537cde4-8f13-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 11:31:23 +0100 (CET)
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
X-Inumbo-ID: 9537cde4-8f13-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645007483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1VExplsUc/jMeyloOEDLZd1rMjs8V3xmSLjMalaWzI4=;
  b=XbVYHOLHMrOO9ITwKlTWiaiRZOKVNftuW8GAAm7HkPgliOju+xER/nuc
   qAOHG34PTRH5FVKjhkJVlGhE2BTzKGCsn5fBtdkuzjQG/eAlmJxx9LUp1
   oNVtH76i0LTnJnap+A4eDTJh2P3C4j3sWtcKXYGDIW6iz0ycgG9ItWUyD
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9RFSBtBq4Pch33H8W5zita2dZl0xNQOZt0DTr0jfD0dIhVtdBPTHBIhpU2ke/IF1qtV2elJlE5
 Rs0Jk6ci02cmzf6E+2bp54ydJ+HQBHzgFQYqA94nFIllpPM1KeYBhKm061/5H4IU0amyaNyagL
 HVRqDUgW1De9Z2WZX1kKpE+qVs0DkqSeWMavi1LKG85C5ShOhcMYxVp/2RVNFKEmln0nrrkTJb
 SD3UFpr1bedhXHYme/scgQS6H8TEZBpjApDbirwOLMK/VCL/ETp5Lp8IHqY8Odd4MyRGkXfMD8
 GaNJriYGTEpG1CMYQt1XniZb
X-SBRS: 5.1
X-MesageID: 64733272
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YPwM1qDd/H3NyxVW/3blw5YqxClBgxIJ4kV8jS/XYbTApG4lhTABy
 WMWUGGHbKyKM2TzKYpwa4628kIFucWEz99jQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970Ew7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kASDgvwqk
 +90n8avExUPLKjItPheekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHfmVvoQCg21YasZmJOzxT
 pIHRBlWZUqbZSYMZmk3F5supbL97pX4W2IB8w/EzUYt2EDRxgFs1LnmMPLOZ8eHA85Smy6wm
 GXC+GjoBwAAA/aWwzGF73GEi/fGmGXwX4d6PKWx6/pCkFCVgGsJB3U+Sl+TsfS/zEmkVLp3I
 UEO5jAnq6R08UWxV8T8RDWxunvCtRkZM/JcDOglsimMzKTO6gqUD2RCSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0fYS4JSyMV7t+lp5s85jrUVcpqGqOxitzzGBnzz
 iqMoSx4gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8CtiVYS4S9fz02Hxt+kaPqCLS12to
 Dstzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr75FsJjKK/KkdGekOej2iZL80xhZbtGt3+Phw/RoofO8MhHONrEcwHWKJx44wPuBV0+U3cE
 c3CGSpJMZr8If46pNZRb71AuYLHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyLr
 4oOapLQmkQOCbeWjszrHWg7dw1iwZ8TX86eliCqXrTbfloO9J8JV5c9Po/Ni6Q6xv8Ix48kD
 1m2W1NCyUqXuJE0AV7iV5yXU5u2BcwXhStiZUQEZA/0s1B+MdfHxPpOLPMfIOh4nNGPONYpF
 pHpje3bWa8RItkGkhxABaTAQHtKLkT731nfYHD8PVDSvfdIHmT0xzMtRSO2nAEmBSurr8ou5
 bqm0wLQW50YQAp+Ss3RbZqSI5mZ5BDxQcp+ABnFJMd9YkLp/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76ta2/+1aww1oEW/ldVOuDr88cHCK0dMW7v9Gx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHftK1nLl/76Sl7+Ku8fX9TZxTc2jZAKLZVMZ8+x
 btzssAh9AHi2AEhNcyLj34I+j3UfGAASaguqroTHJTv1lgw0lhHbJHRVn327ZWIZ4keO0UmO
 GbJ1q/LhrAazUveaXsjU3PK2LMF15gJvRlLyn4EJkiIxYWZ1qNmgkUJ/GRlVBlRwzVGz/l3a
 zpiOEBCLKmT+ytl2ZpYVGe2FgAdXBCU9yQdEbfSeLE1m6VwalHwEQ==
IronPort-HdrOrdr: A9a23:zcv1g68hp5DBu5b8h6Zuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64733272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juG7/FEdqHumFa+gHTrl5r6QMIltR7s/13Q6RqdSclJnLUKqcyaHz6eh7AROR8zHUjsnZTMmg5ELQk9N4uhgoq0V/bZlWuwvmtb/AxpY+ld9o1DXsVDHj+xpu8DPF45Un8rR2bEYPBRcr3D3C3WALU95Jw7VCWaueC+E6nlxs6ZF5YdRGX4A34TSW6ep/mBcnaBGNe6UkAPNXlaVCCO4rP6QayBtOpXiF2d5FCpItysIiHCxRR85PVmQKJMHGVoE1O1DAwKguZePs1WGa7G8+LO4ey33dNlKQSsXI2aF5EUZrtNcvP2puUEbeYmpCq90wMr69SPqWHc2eq3gnCIT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYwFCVS+ocU5eNhwXct/uBxkJGH3tqXX4XbY/zZKx+U=;
 b=JFaGh/16tx+W/G4q4YjPIVXzYUvG6gsRFv/nx5aHsdLJQtBHEjcBdg4ivJPLlTa+m/8Chzm4hsUbh1CZHrCdSDL5z7QMBYw4WB3A0LoMu/Wu7QvB+WWB2uCZI5+YCzPZYQsvIb8Bq+D7CRFdtnOPc8aXfkWcdu7sq0JplMIMEifCxavxnag2VwtwkS0ihDyMuF/xVDU9mntW+qvZcF5bpX1GZnqBD37sbXFHiCnpdxTbxm158c660+/XfZeFBtCMo6/b21V5sQp9BMkDjNsWvpqB7oMrPt/Ezp51Zsp0XfKMM4cDuDw20tNwsEO6WTBR0IVdd+D+ecxIK5SSPP5IWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYwFCVS+ocU5eNhwXct/uBxkJGH3tqXX4XbY/zZKx+U=;
 b=txZwMqYsW50k+0//sD3ONK0h0taQRHuCoKH0KK1BGhQN2Hmpqx8woPJ1Gh61kvJypzEYbMCQzKGGtxZ5wL909wZdyp5eofvgWX3tapUoMZTl+mqIOuDYYShKrNV/iht02MNljBMxkGFY1MKAAapHrzd+SRkUF/0cEIPmwNBlpJg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <dwmw2@infradead.org>, Roger Pau Monne <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH v2 RFC 4/5] x86/ioreq: report extended destination ID support by emulators
Date: Wed, 16 Feb 2022 11:30:25 +0100
Message-ID: <20220216103026.11533-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216103026.11533-1-roger.pau@citrix.com>
References: <20220216103026.11533-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2437f4a-f332-4497-152a-08d9f13773b7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6256:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6256BA37445574DD5219E2FC8F359@SJ0PR03MB6256.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tm73xpCiLc9BBWUUXdOcox7iX0NkzpD9OZhf7gRpmVsxu2yAh3PdDsqIOeA1x3jv82fpUrkKSfn8qSsQHa/GzE3EgHAQddsMBSZuDW2zQ6VhBWqRar2Hrly7vFUkOmLHLv4bgYQYRRfHiZICTc0IjZrBRaMqKMNcu3CmM/Ace6gZ3GQ79BtYeKXqOceXqzULzI6x1QYjcjMF75Os085qkoXdtLtm1SDvjNbeD1H+015y93cN36TdFK7dkDbmap+SjYoK1xNDDt9tEBak78XNmft6Eg6VxV29FLbk/Wap/6MD1jC4W19wcWK8Qk1Iezo7XbkNJMcpl/PDuIlkGInW6xV5gcbfFPOv5PXk9KWrdNDgmFwlRykupzZ9DAMNmpbQvYodCGYfKy+joWPP+7S98OIFUWWJtiVtzGc3O5rJAfxZYrp57ZaW/GZrH4jZpw3cI343bU1Sxvsjvfu17mncNZ0FTLzcrdJbpQl/vMp8pcno9sAS2iZJkMpQr9CGBVQQmtnUd0cSyxzhIgAgMJVp9mOxB5wjPdLUameGPLyCbDmftjkZY3o6NkdvLENMTbNCoYEfJh/aBvdsoQAJoDBkgcTyo6TQ9pzQxknk0MmZ16X6gFBHFt9aNM/Yy01ZK+TzN1qnxlWsXEM4XW2GI6cfRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(66946007)(6506007)(6512007)(316002)(26005)(1076003)(66556008)(508600001)(86362001)(6486002)(6916009)(6666004)(54906003)(82960400001)(66476007)(83380400001)(4326008)(38100700002)(36756003)(5660300002)(2906002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWl3S0NkZ3c1Nk1VTzA5VFBWRHRtTVhVUGdCOVNaTW5pS2JQb3FsTkJXeEJC?=
 =?utf-8?B?NWxkOUZYRW1SeERJOG5rWllYOTladW05Nis0b3VTTktvRjA0aWdHWVFQaStz?=
 =?utf-8?B?SDlVZE9oVTQya29Pdm8xeXo5cTZnWTZzZ25oQ1FDL21LRkFWcS9sTGYxQi8v?=
 =?utf-8?B?NDJITlA1RklXV3IrWnJ6RVJBME9DekdsNitjTWo5ZXpQOFVKNk9iVWZ2cWYz?=
 =?utf-8?B?S2JjUUxJbHZwb01QcFRRQyswTUs3ejZheDlkcG8rK2pPQ2Y4U0xCNzg0MnUz?=
 =?utf-8?B?TUtTSkhTSHgwc1FEdW81RDJ5cHg4dVJoUjRpcFV1ZjhEazBjOG8vbktzS050?=
 =?utf-8?B?NXpScG5PRzZnVFZDSXlnM2lrNUNWMlJGTDFXWEFMUmtkNjZ6ZU5Bblcra0Fu?=
 =?utf-8?B?U2h3VEtwTmxCK0ZhdTlZYkUwbEMwMjRiWlkxbUc1clFlRUYrdGJDVDhhY2xH?=
 =?utf-8?B?MlpGYVdWSS9iTDRoVVdDcDhaaFR1U1BwSGROZUllaXhPMk44VHV5N3R0dFFN?=
 =?utf-8?B?QW1aZjVMWXhhTmMrc1JsNjI3WllvcVQxQ1lxMGE1RHE4bGhMcW04M08xcDdr?=
 =?utf-8?B?ZEFUTGNNUjhVcHZTNG1yKzJhRUo1a2JmbEhLMkMyRmtOUmxWSGNvVHZIN05p?=
 =?utf-8?B?TnhhK2RRdW5SUDBJWkRaVnFXWXBkb0NWblErTXBZbWM0cXMwM2dnRDh4ZlVM?=
 =?utf-8?B?TjdVSGQwb0h0OWFvV09venV0akxobVFMRTlEN1F5UVU1Vit4eFVmVFZuczBl?=
 =?utf-8?B?dVlUQm41SEw2eFBEa1BHVklTSml1cmRYMk1vNXlwWGFxWEdVN3gyNXBMTGVI?=
 =?utf-8?B?aWkrM0crTUxXcnc3QXp2cXdaejRJL25iZmFOYm01ZHZmZTYwcGVNZkNyRUxz?=
 =?utf-8?B?ZDIwc3FDd3BjR2tFN1FyYUlNb3gzcVFBWkE1YVRrYlpzYktkVGUxZ094MWFH?=
 =?utf-8?B?OGVLREJpQXMzdGdUaUhNYnRRcjBMYjNiRVp5R3RMRlZUUUU2Y0VqZkpwbE1O?=
 =?utf-8?B?UmllOU5YMVlTUFFsY1p5S0hTTzZxY21aazMxekJYMnFmZzk4aTdYWTFUcGNv?=
 =?utf-8?B?L0UveTk0M29haEFqUjlPaHFub3VVU1BTNGVQOU1EYmMzak9EQWdrVTJGejA4?=
 =?utf-8?B?RVo5eUQ4ZEgrbmZPZWs0WHBMeFdEL0RsY3ZxZXZzWVcxWUtKQWVPbXF1NGV3?=
 =?utf-8?B?ejBXanluYXJSMW04U0xMNUNIK2ZzZCswSFRmeklSKzVBemdEdlpHT0lSQUxi?=
 =?utf-8?B?bXFJSEJ2YzB2MDduQXM0Q3RXeENNR2dTNUVHSnVaRzZHSkxJZ3B6bnhqZHEz?=
 =?utf-8?B?Q0FkL2pDeElNTlgvUGFnMVdRU2tkcTVmSFBxa3BFTFBTLzk1SEZiRk4rSGdO?=
 =?utf-8?B?b1YrMW5NNXRnenBRTTBUVjlBS2JRb0ZJekFIcy9SVWZMUmJlb3ZsY3MzbW9P?=
 =?utf-8?B?Q2dreG8vK2g5Z1NrdE1kdzc4NkdEZnN4Wklxb1FlUkJURHNNd1BxY3VHbG5H?=
 =?utf-8?B?cXBqN0ZYTURmWGlyV09jZFc2UXIrYUtUMUZ1bUlIUm9qd05QYUhEWlhLUzNF?=
 =?utf-8?B?cEdnaXkyZVZsY1Q2cUJoNW1ldWxBSUNhRXRaeTgvZ3NEWVduQVkyd0ZWbHJX?=
 =?utf-8?B?UURiR0QzL2FSVlV0bGtCYXJQM2JCTmErd2Roa2EwK2czcEFoNEF4YmZkNVhh?=
 =?utf-8?B?ZDNFQUNFVkt2WERZeDBuL3lheVlDaGtFSHVSUUZDbWVUQ20wNHpxbU13SGJZ?=
 =?utf-8?B?RnJKL21hRWJDMU9CVlI2dyttbGZaWDQydXhNTUMreXdDTm1jZTRTYXhXbHFo?=
 =?utf-8?B?QVFxL0MyeWpLVHYraWxzWGxROU9naE1QRENzb0FyM29ia2M4NVhsdERHQzNy?=
 =?utf-8?B?SDBNanVzUnh5MEdPbXRQb1NMazA1UkRkcEJVazliVGtJVlVIZzV0REtMNGI1?=
 =?utf-8?B?Z0doN1ZHQksxVDhyV3Y0c3pQVGNLdFZaNTlvdGJ6Ry8xUERlSXQ3V0oxd21V?=
 =?utf-8?B?ZWNQZC9US2ZaMkwrZmF6SE1tUmxvdnF0OTBlRERjeCtBa2crZU9Ta1NUQ01C?=
 =?utf-8?B?Y3ExUzE2aDVSUjJ4VXYvbGZsVUtQMFlXZDZwTVNSSDhpcU9WaHJSZytLejJW?=
 =?utf-8?B?bjJRMFdKb1NWVUZXUjgwRzhMNVhJbkRjelVub2dnYTVtd2tDVTJoNGxPT1pP?=
 =?utf-8?Q?7twKYwOU5F+W6fPU/iXOXE8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2437f4a-f332-4497-152a-08d9f13773b7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:31:11.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mltvKfNvcl6pyi61VvYLnLydlELmpEFUe7KQze6cTLgm5z1vQw4wcoN698ctwaexuJTu9xIIe3+DcSjEHF8CMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256
X-OriginatorOrg: citrix.com

Introduce a new arch specific field to report whether an emulator
supports the Extended Destination ID field, so that the hypervisor can
refrain from exposing the feature if one of the emulators doesn't
support it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
RFC: I find this kind of clumsy. In fact fully emulated devices
should already support Extended Destination ID without any
modifications, because XEN_DMOP_inject_msi gets passed the address and
data fields, so the hypervisor extracts the extended destination ID
from there.

PCI passthrough devices however use xc_domain_update_msi_irq and that
has leaked the gflags parameter in the API, even worse the position
of the flags are hardcoded in QEMU.

Should the clearing of ext_dest_id be limited to the domain using an
IOMMU?

RFC: Only enable ext_dest_id if max_cpu > 128? So the device model is
aware the domain must use ext_dest_id? (implies device model knows
APIC ID = CPU ID * 2)
---
 xen/arch/arm/ioreq.c           | 5 +++++
 xen/arch/x86/hvm/ioreq.c       | 7 +++++++
 xen/common/ioreq.c             | 8 +++++---
 xen/include/public/hvm/dm_op.h | 6 +++++-
 xen/include/xen/ioreq.h        | 2 ++
 5 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 308650b400..7d56d022c8 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -185,6 +185,11 @@ void arch_ioreq_domain_init(struct domain *d)
 {
 }
 
+void arch_ioreq_server_create(struct domain *d, int bufioreq_handling,
+                              ioservid_t *id, unsigned int arch_flags)
+{
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 02ad9db565..3276f0360d 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -336,6 +336,13 @@ void arch_ioreq_domain_init(struct domain *d)
     register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
 }
 
+void arch_ioreq_server_create(struct domain *d, int bufioreq_handling,
+                              ioservid_t *id, unsigned int arch_flags)
+{
+    if ( !(arch_flags & X86_SUPPORTS_EXT_DEST_ID) )
+        d->arch.ext_dest_id = false;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 689d256544..d4d5c653c7 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -636,7 +636,7 @@ static void ioreq_server_deinit(struct ioreq_server *s)
 }
 
 static int ioreq_server_create(struct domain *d, int bufioreq_handling,
-                               ioservid_t *id)
+                               ioservid_t *id, unsigned int arch_flags)
 {
     struct ioreq_server *s;
     unsigned int i;
@@ -681,6 +681,8 @@ static int ioreq_server_create(struct domain *d, int bufioreq_handling,
     if ( id )
         *id = i;
 
+    arch_ioreq_server_create(d, bufioreq_handling, id, arch_flags);
+
     spin_unlock_recursive(&d->ioreq_server.lock);
     domain_unpause(d);
 
@@ -1340,11 +1342,11 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
         *const_op = false;
 
         rc = -EINVAL;
-        if ( data->pad[0] || data->pad[1] || data->pad[2] )
+        if ( data->pad[0] || data->pad[1] )
             break;
 
         rc = ioreq_server_create(d, data->handle_bufioreq,
-                                 &data->id);
+                                 &data->id, data->arch_flags);
         break;
     }
 
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index fa3f083fed..c6c575328b 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -67,7 +67,11 @@ typedef uint16_t ioservid_t;
 struct xen_dm_op_create_ioreq_server {
     /* IN - should server handle buffered ioreqs */
     uint8_t handle_bufioreq;
-    uint8_t pad[3];
+
+/* Signals Xen the emulator supports the Extended Destination ID field. */
+#define X86_SUPPORTS_EXT_DEST_ID (1u << 0)
+    uint8_t arch_flags;
+    uint8_t pad[2];
     /* OUT - server id */
     ioservid_t id;
 };
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index a26614d331..f4566a1254 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -127,6 +127,8 @@ bool arch_ioreq_server_destroy_all(struct domain *d);
 bool arch_ioreq_server_get_type_addr(const struct domain *d, const ioreq_t *p,
                                      uint8_t *type, uint64_t *addr);
 void arch_ioreq_domain_init(struct domain *d);
+void arch_ioreq_server_create(struct domain *d, int bufioreq_handling,
+                              ioservid_t *id, unsigned int arch_flags);
 
 #endif /* __XEN_IOREQ_H__ */
 
-- 
2.34.1


