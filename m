Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44376E6797
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 16:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522957.812636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomiR-00007i-UO; Tue, 18 Apr 2023 14:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522957.812636; Tue, 18 Apr 2023 14:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomiR-0008WV-RU; Tue, 18 Apr 2023 14:53:55 +0000
Received: by outflank-mailman (input) for mailman id 522957;
 Tue, 18 Apr 2023 14:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pomiQ-0008WP-KZ
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 14:53:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d36a8f03-ddf8-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 16:53:50 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 10:53:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5854.namprd03.prod.outlook.com (2603:10b6:a03:2d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:53:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 14:53:36 +0000
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
X-Inumbo-ID: d36a8f03-ddf8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681829630;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=27gscADshn5oWryFmzOSqzn0gTT6s9nDFMm6Hoj78OQ=;
  b=EOozdecW0/27JVglDJGH36YqMVpdlIiFM0ODZ04mMRKjDq91+jPjaJ96
   fC2SKuM7oXQc5YiVuLAxn+hMx2HauOWMMGwUzcnS4jfINx4z9itKr2pYk
   bdQi+NfapUlgICgPin2w25SdhI6lRA1pUeQixadWYVkUG1S0jWiRnxXKa
   o=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 105312771
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SPAV/qmh96MNkNjLnOrFpATo5gy+J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfW2uCP/+IajPzfNsibd62oBlSvcLWzdIyHAZo/3xnHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5Q+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dJDCSgJUjzYu9+V7KLicrJHjfgFC/C+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iee1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHumA9tIS+LhnhJsqGeO4l0KEyQKbkeEqOv6ukKsWvFPJ
 3VBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YXma87KJqzKuKG4QJGkLaiIeZRsI5cH5p4M+hQ6JScxseJNZlfXwEDD0h
 jyP8i43guxJidZRjvrju1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nU/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:+HvTXq2VIxGQgwtGrkIIVwqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: 9a23:E3rjgmFO8MVqv49yqmJJr28MHvwJKUHg71vAenfjIm1VbpqsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A1n810wwgx2yI2j1U5px72nyeVhGaqJ6zLHEUiqw?=
 =?us-ascii?q?agNW7PD4zCzuPjRenTrZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105312771"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XElX258LuLQeHt0EMinbQry+OwsD7ZS6OyNm+JvM5aHxjGWfE5SS0IPksbKKVZ3avvV2XWkc/fJdng0TcdiiLvyoV1RYdzKxo379TrSey8bT5zvV1WVrzTIEkhAYn5jdsAzPvLzH8fWhh71j/jAaDf9WEwzuKKVCYyNRQcit3Od3CivimdS1liQ+N930lB41ySILaZnw64PcpkiDUN3OxaVSOoaGLUOHcrckMa9tUFfEicOUISSOIqjv6c6rd0v6V8oK5UNLwGogEjrm8N3aWeFGztuJUs/8dJsTwPkHyvOTEmeaK2QJfkY7lRLhl3NCKBUj7lBOrCy1p42NzsFInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU8DWBM7Bp6I7aNiFPCUlMcCJ7C6O30oHVsUCIUFJZw=;
 b=QdWiMPv8ajrH2OAiEQHp/kVHjNnVoWKe1GyQ39bL8ymDGPlrt2EM/7wLMrio1r1FeYBrmJOmq2f8eLkz/tauD2OVFSZO+eHvQTEgoTRpr0ZYTMAp8s62yNqkN3GgW9RwY5rw6b6Cbl/brlX/Vm/kkx5J7+p83un5/nq/97DDILrK+E7r86mwz/N6SBki3+t3vL9CoVShxH4nHmbKmz1rkKKE+lUtU6kQRWw/Qj9fpmvKDIabY56zNeORgROf1HCRiBpy2FrMW+A0vwNUQZHlXdQ5gpwzmAk6hem4EzEHOesDO4foTGtX5xHSul8aR+lWcp6uNL/D59jGidhkDWMtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU8DWBM7Bp6I7aNiFPCUlMcCJ7C6O30oHVsUCIUFJZw=;
 b=Gb779dYZ8imopMt8k1NiZTleF74+wihACWUUWtMa9xDiQNcDOYo8fpc+dkTysnwDbYZj/ECe8tkxjWQJRv3km7wA+4oiZSmLMpXkQ02n9ORE3vaeplbaejtAENetvJlpC3s5oz0MNot9l2FjFTdCtVXj7OHOhu1BBKT8tJT1OEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2] CHANGELOG: add gnttab_max_{maptrack_,}frames option changes
Date: Tue, 18 Apr 2023 16:53:27 +0200
Message-Id: <20230418145327.19352-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0667.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 7746041f-9bc1-4005-06b5-08db401cb027
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1AvQ8M1M6HHTLr3Zm71MVU2j6jlw3F/wfoZ39HVNHedpsxolHDvf6cLtLdu7hiSpJRRehsN+Qfs6r6q2krsy4WXZi0H/EPJMvZqJ/TbGfTuOPZBW0/gw7fRoEHMYRRQHW6q0KOlPTMrMahyjqRYZPi5JCIhnmyhHLU6JIO6mEX4rMJ0Z5naQ2zlGanfIlriLc1EqPDbu3+MHuxIKfdc9+opT5moMRMPc2m5ymqwSWPv+i8Dc9viL1gOhI07OCBqC7hUfSRrgSpDG6JZAvoEEgtJxb8RObw3DtfryQkaGT5WhhHuW+B7TI4bj+L3c1JT7tFpjrPvlUAzPXK4AaY2cZEleX8/J1q6rspOzEP6x4Yyw/rJo62ASK5jAfu8vdNOpHKYgLMKvn0YbVkpa4wxEPA2+YWl3TePiOBs8WyYnbXYrjA+UGgjv7qyq18BURoOwAt16brN66fLpgiM+DT8lt7VzdWKwUWJj8Tls/Ymwm9gzVhYEoSQAiQWFmgeTfOHIInSDUrRCJi0Mr+nQkvddVz6UX5O7cOm4aO3fnHoPNT0xFp4h2Bfj9omy1UNS4yBusoW5DnkL2mcnqnXB8xVPt/M1jyaoEPavwduKVUUGiTUborMjWvC1wmiTZ8pTb8Jy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(38100700002)(8936002)(8676002)(5660300002)(2906002)(4744005)(86362001)(478600001)(6486002)(6666004)(54906003)(186003)(2616005)(6512007)(1076003)(66946007)(6506007)(66476007)(26005)(41300700001)(82960400001)(316002)(6916009)(4326008)(66556008)(207903002)(219803003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1JTekhWUno2Rm9xbzFDdi9lRmJDaC85Sk5GUU91WjJYYjJuVDJRRGg4Slp4?=
 =?utf-8?B?L3pxcUZLd082Y3B0U3MxN0hnbWN2VXdMNXJvUUdPdTU5TGxyODg0RUIrTG5t?=
 =?utf-8?B?UFN3QS9kZWFmQTVIOTF0MVVOYUliS1ZNZC9zbHBvNVQ0bGthUk5Qa0hFTndH?=
 =?utf-8?B?a1JuL1hCR3Jndks2K3Z1Ylg3cEJJa0lZQm16bHNuY053MHdpT09FNDdiczN5?=
 =?utf-8?B?VitYc1ZWajc2TW1XWGtXVkFscnQrUXR3UHE3N3YvMXQwbGR5Vk05bWJMbHdR?=
 =?utf-8?B?aFRTMEtxOGdTUS96aTV6Vkw2a3dVTVYxMEJQd1Y4c0k4dzFRdmRjWGVnOGpu?=
 =?utf-8?B?RS9NbTMvUzFIcDVsQzhiQ0hQU0VBMFFOUWpUUGNoT0pqdmpxYm1oakZaRFJW?=
 =?utf-8?B?dG1aalR5WG9LK2Z6WUhVVGl0TlJLWFY1dWtCcTZqZ21LRzE1WlBOaW8zcTk4?=
 =?utf-8?B?MjhWSUN5OGdiYlIyUmx2cmZ1S242Tms4UGlPRWZLNVU2S3hIbnUwWWNPQ2Vv?=
 =?utf-8?B?b3doZGlhcHI3Y0hETHRrRHRPMld2N2V0cW1JeFRodHNQaEdibkdXaTgzeWs2?=
 =?utf-8?B?SDNKUUN3b1RjK2kvc2xmUTlzcmo4Y2NWQnR0K01rbFd4Ni96UzBMRUJEa2wy?=
 =?utf-8?B?ejRuQXRSRnk5RFk0ZW9NSHVtREl2QktMcGFRa2RUZDBydVBNR2FBa3ZmazhC?=
 =?utf-8?B?dHJtVkd3VEpab3FLenpwcXZYNDh4MXY1aytjbVRKa2w2Nm0xV3NCSXlnTVpK?=
 =?utf-8?B?UDhpemRtRnlmcnY1Z2ZoM0FGTExEZFR0TEdJN08vaUVEcUVZMEw2djdKcHBz?=
 =?utf-8?B?OFNEb2ZQeEFlVzQ0R2U5dVZZbG1QRHVPUnFFZWowWmU4czcyeXM5VFpLaGpL?=
 =?utf-8?B?ZU03UnE3Q1IvU1F5SzlUcnU4aDBqa2J3Z2hkVlIvWVlJVEFOMXF4eU8zc1NP?=
 =?utf-8?B?bEIzbnpvRkZyVEJEMG5MYks1Z0lZODBCanV0c1N3b1hlb2w3VlBKRnJIcjUx?=
 =?utf-8?B?MGcxRFlXR1JoRWl0UHcwcEcwRFVVUGF6WFc3d3dsSDMxenRhanhUVXFqMlVq?=
 =?utf-8?B?dEo3enhhSmlPcXdET3JLbVowY0h1a0hUUXNpWW40azVqSHE2cGc5U2w2YU8z?=
 =?utf-8?B?YVhEMkFNazhtbkdick4wWE53N3lzNUxURlBLa3NyVWtSbjJ1SkZVbkNPdVBa?=
 =?utf-8?B?dG5YQStiZFVCQjBMMTFqN1pNNzIyTTU5Snh0NkZ6OUpSdHAwN2dIc0tITStv?=
 =?utf-8?B?WFl1USswbGZTOWxDWkorZG8wL2g2YXV5cFNDcDZFeTZpK0JWTjdJRm9tUTFU?=
 =?utf-8?B?OUQ3OTFGekZiZVVzWWNJYTVQMFoxSkhXNHkwMU84TFRvSVBHZXg0dzBkanpx?=
 =?utf-8?B?aFVjbGlzMHdlcmVBcDBRRzNIcmxUZ0NIT1p6eFc4ZGlGb254ZHhQTUZLdTVL?=
 =?utf-8?B?MXBrazNWbzVZOGF4di81V3IvQjJiN0x0SzRKUGpZQ3VrMlp4UEVmMUxZZ0I1?=
 =?utf-8?B?SGVEZEJGS3pBckY2VmpkaVJndW9hQVUrRXArZFpvbTdCUnFnWStMTGhOdHVl?=
 =?utf-8?B?aEpXT05XVEZ1MjBtdU9xYjRvdHpBUXNyajkxZjNOVDdpWUFlNjhmUFlYaGRI?=
 =?utf-8?B?NkFOOW9nc25CSFRxWVViMExwQXJmbktNN0xEUTlrb2puS1U5aGxNMm9JOW9j?=
 =?utf-8?B?RjA5RnNJZXdEOTFEMTZRRzI4Y1JMMnhWRU5kQ2dSUER6M3ZRTzZJZzhVUzQ4?=
 =?utf-8?B?c3FRRlBlUnBEbnpsRWdUYkhpUkNmVGExUG42aWkwQ0dOMlE2ckIzTWxmTTM3?=
 =?utf-8?B?eGJ4TWhtYm1rSFp1czRCc3d2blJsNlI5LytHVlU1RTBrWjFubWNRNlRPRk9s?=
 =?utf-8?B?cmdKNEpUR3FoL3gwNGd1dTF6YjRTUGo4eWdDSU9DeHVyVUZVS0NiNVNJSisx?=
 =?utf-8?B?b3ZOeXFnOFBQL0grYUpPSUYvMVVLdjFkeTVNQWRJTEJlbWcwTXkvTmdQNGZR?=
 =?utf-8?B?NmVsTkJHRWJQRTB5M2dsa09LQ3M0ODBjSk1aRGVCdHBGeHY1eVgyYU0yYTFn?=
 =?utf-8?B?b0NyWGpRREMyanBpWnVXQXVYdU1zNS9BMEVKSGdxa1d1SERlRktjdnNtRUNX?=
 =?utf-8?Q?hMVnfwfqpjfqxs5OBq/pjk5C6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NwnKeH+r6NYjgKhejXdPBFypCFOZNZJMYZ9QpK3D2R4KeQwK/HSuQPEgrxDfwAuGxxJRzeZJnBuF93P8oS4gO47g6iv8jLar9hJ1nEhzPx7bMsbM4nt2HUC8Dg2HhMbMTy75Ylq+vCIm69dyXeQRcE7Sa6sDU64arf55MyVh5ll1R9Cbxe70NmOqB+Ym9ECQ0d9QAwnFE7X4feVzxRuN81pprCzdf4OaUWbZC/vQpBac47rM1rH9SorCxNy4vOkcpK0+XCVWAC0/mzLR43GP5M/9T1OWYnwK1vuhD5POzJrL00A3vhiEz9URUJ+bRNMuSAf617Kd8Kc3sUUKP3imxJt9gDTmRZgWkyAr8bebun4we+PQB+9jlG/cdKBJXQFYHGj4cJkfprcGkuzLX+iHu6gCc4rX+El7WXVMHtiSRmnIQPbn/4+NcY5mb6APveLzrrwHSu8P+FtajHxJnyIrSGGiOqNd+hvMbn4ZU8xIV9MTMreo4UblOpnl07y0PeFK8C3E3gXVebnavGDrpRLJPWzTseLK/sXsP3S3x7BHnUA8f4zMBSKFwTCNAOEfrw+9wV8LpT4B5ZcMGgyBg8RkIdPDcd8FYtfAD9cEZi+qVM4rDYPZpqXdFZ6hY4t5Es50mUxHKdIV5g1jQXzuHTnxe+vSI7ubzB/9hAjSYyP+ju1L4ygFqEu+5MyjcbX/By5Bmh9oyW+3w8VPb5tHqFJL8VxLvshAANpDmymr4ROYndpmqT8yOv9pgQoX/X6I1zCLNNZjfFm0If6QzF5AoieXT4f8b3uvTO/zyDOFd2jbo1dtiT4ygcBxcszY0SB8GmVS2bwdyEIYhwNfC9XExFVX8A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7746041f-9bc1-4005-06b5-08db401cb027
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:53:36.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fD5QEPyB4wSOwNyJHXBPFPAC+jfxfShJefQM3huFsk27QNCZeuju4E2Ag0lpEhtQ1gy4Ws6n2tvCD5OXpENIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854

Note in the changelog that the purpose of
gnttab_max_{maptrack_,}frames command line options has been changed.

Fixes: b2ea81d2b935 ('xen/grants: repurpose command line max options')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
---
Changes since v1:
 - Introduce and move to 'Changed' section.
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c978cfd9b68f..5dbf8b06d72c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
+### Changed
+ - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
+   cap toolstack provided values.
+
 ### Added
  - On x86, support for features new in Intel Sapphire Rapids CPUs:
    - PKS (Protection Key Supervisor) available to HVM/PVH guests.
-- 
2.40.0


