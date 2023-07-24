Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407E75FAFD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 17:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569027.889335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNxdd-0003DG-TO; Mon, 24 Jul 2023 15:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569027.889335; Mon, 24 Jul 2023 15:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNxdd-0003Ad-QX; Mon, 24 Jul 2023 15:38:21 +0000
Received: by outflank-mailman (input) for mailman id 569027;
 Mon, 24 Jul 2023 15:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klik=DK=citrix.com=prvs=5629c81f5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qNxdb-0003AW-SN
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 15:38:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10fdc474-2a38-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 17:38:00 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jul 2023 11:37:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5101.namprd03.prod.outlook.com (2603:10b6:208:1b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 15:37:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 15:37:52 +0000
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
X-Inumbo-ID: 10fdc474-2a38-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690213094;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IYK+bOifPjEvm/34iNsybaMiYRDTv416x4CCd1LbYpE=;
  b=R0ri9T6qhouYHf1hf8gIRPn/d4GQsj9NMPpJ4rnvsF8baPwHCcP3D8ZV
   sUKJ6YbGUdL32G2hG9V8FUcO5MODwP3V1wx+65b7N68OwcZ8nKwwNenuR
   9O91jD8JyKO89+AJjfCMIx25902/UBDu7dl1yQJyNX4BYgYbZLjMC5WQm
   k=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 117679537
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:czyk8KsgB0VwVE3fQKwZrugVt+fnVJJfMUV32f8akzHdYApBsoF/q
 tZmKT2HO6nfZGr2Kt51Pt60oxgD756EydcwGwplqy1gQytB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACEzCFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJwwgPjPZrt+Mnqu0FPh1nt4mLYq7BdZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4K9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAd1MS+zlraECbFu74XUcMxJOdnSAjd68gBGvdvFRF
 U4o0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUcOfTQBTBcFy9D7rZsvkwnUSdJ+DK+yiMazEjb1q
 w1mtwA7jrQXyMIOiaOy+Amehyr2/8eRCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pn0jxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:iEf1RqpId5uLIsj9aOXOCwsaV5tALNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFmbX5XI3SJTUO3VHFEGgM1/qH/9SNIU3DH41mpN
 pdmspFebrN5DFB5K6VgTVQe+xQuuVvm5rY4Ns2oU0dLj2DPMpbnnxE40ugYzpLrE4sP+tJKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0L72fBIcABYjyQ+WyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjvdTGcCWjcARCzP0ziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU611rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ej0XigzBcZtjZ9QNkKx0TtogPhMlI
 Zwm06JvZteCh3N2Az7+tjzThlv0m65u2Arn+I/h2FWFaEedLhSh4oC+149KuZ3IAvKrKQcVM
 V+BsDV4/hbNXuccnDip2FqhOehW3widy32MHQqi4iw6Xx7jXp5x0wXyIg0hXEb7q8wTJFC+q
 DtLrlovKsmdL5YUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77bq/bQO4v2wcpBg9up/pH
 34aiIYiYcOQTOvNSXXt6c7sSwlAV/NEAgF8/suqaSQ4dbHNfjW2S7qciFcryLvmYRbPiThYY
 fMBHtnOY6eEYLQI/c34+SHYeg1FZA/arxhhj9pYSP7nuv7bqvXi8f8TNH/YJLQLBdMYBKOPp
 JEZkm4GPl9
X-Talos-CUID: =?us-ascii?q?9a23=3AIZTYQmg/Ku3fhXFKpayWVETQQzJufUHwnFSKCnK?=
 =?us-ascii?q?CV39mFqyMUUWV+eA0qp87?=
X-Talos-MUID: 9a23:zi/36AjtEHTjUnSVClfP3MMpE95n2Kv2K282vbIDsZaVGA9+BTWhpWHi
X-IronPort-AV: E=Sophos;i="6.01,228,1684814400"; 
   d="scan'208";a="117679537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZVss69ow/aL+z5clJzrIieha+cLJPQMBqVa44hrhstV1GAfiKBR9PuzchxmU3YX/ms6YgwQ+UgIvmZyvJV4bLO4c4CTxuASeAUA/ot7/9z+h4XAZO+PUeREfjkXP1b7OcYS1iJ6WuoNMSJUvsVB82iaLR2C1PxFDcCCjAIvEpCQr5gvN0xbTunKnHdte67RLiOFqwSmak9qkrUeAaF6H1VzMrwYJTy1A61aepMJYyYktcu2artlB64l4WC/aTUJBNdk8dTi/j8VoWbZeaV+wGkXc2Ewj16j1NsN14Dnmyg261meakJWzdQy1dWgQSSM6obvzWV7CczjV3EHqTUUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG3oPCszXfwQasS/uN0MSJM+luIJvXbEbNU+alUDoOY=;
 b=RCTPAF8/OE7JkwGJ7BJWY9AfZw6w5HyzHQQ7y5GHb387EzyBGk/RLWfxIXikizO+ElBX89Ci3lnhoW6ojWx1jAW/sljzmbVETIbTt6vf8jzrmOcPX1c0uup+cyQ9PlQz7wq3s4kM+90dcx5rBBH3SW8HrwP1NmGEcVwh6iNKR4VboRjtJGQj2q8DDOJOcPPExC/23khIo6LzCHgXyi6/oVAwjPxCtji09Ks8XPecy2Cuu2TwRJxrlp2tNO+SzVnOhRO34r8NlhFw3OXS+f84uylKVSQZkTJcVTMKRllpLEwVjSajUTzmMnvpHlUTDN+Kk4a5AT/hEbO9RKhJzLFgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG3oPCszXfwQasS/uN0MSJM+luIJvXbEbNU+alUDoOY=;
 b=VweBWWY4Au+RmN1S5ZGW9xU9/yCW10u3OVREq8p0y5TCKu6xQMnFJ+LSq7sczwSbqs2jx0JCVzZhp6SeTw5lUuvhFICspgWGGGocDQXt+opF8hW6eyhP/UNYUbFtHOScOdSnek2I+RV1ma3kAsUaamHOKU3ZVcviRrmxmr0FPOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] vpci: add permission checks to map_range()
Date: Mon, 24 Jul 2023 17:37:41 +0200
Message-ID: <20230724153741.42374-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: a991604c-aa42-4255-477d-08db8c5bf140
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVXWvrfrppU1+TWvprvAQM5Thz9spqlUsQL2AdlQY++VkNoEIUoLfCmTdS30WpYFhTyHyxI0bklWn//HgdN2AE9ARAe652v1ZQlmeiVzuNVqhwLg58B3saRYIPRJ7TbDftPbKrLj1qKd+6gVASm1YTvg215RUgxzI9bnPpUONt0ADhqMDxHSQU25rWHZtC3GVe3kpWOBQNcFMKHh08mO6/2wWtdLG+AT8Z3ON/xHXyVVE6tlR9Dxx/qgWa1IRW8jOz4EnhTP8058uKFLTu9TdHTLOS1h0ElK4YH7dX/k6AYP/DGplS6bLDSJXUIRexv7yEUj9BJ4XvDBXD1QOY1pBtfTaE46MC8EmVYs1NoVK34SiS5jOMiQ8QsJ1GOf4KIbRbDvU0AjLePf0NqXuXbAFTZm803rfpIDQW+XfHxPHZDPTfeJ8jEqsMEjpYRG2xWJtIZpyqSJgzYXtdBamAIgFN3BcTtJCdUTEDDQoKKnwTJhzPN3OCY1cMnkmCzQUEJW1knPmre0w5lx/RzcJR3tregpNzhV1RN3NZPxDFAqKGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(1076003)(26005)(186003)(6506007)(5660300002)(36756003)(8936002)(8676002)(2906002)(2616005)(82960400001)(86362001)(38100700002)(83380400001)(6916009)(66946007)(66556008)(66476007)(4326008)(316002)(54906003)(6486002)(6512007)(6666004)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUQwY1FFR2FlN1RCcXFaOStHVGpaemt5c0kwbmFycEo1MW45SnBPY1NlUmpE?=
 =?utf-8?B?MnVzN3JjUVZPd3JnL1gzdzc3eFhwYW50dUNwNlhQc2g4Mi8xRjJVaTBJVmtR?=
 =?utf-8?B?RTU0aXh3OWVXK3hpRE9IYjZvZkJzN0w2STgwNnB2dTdGSmltMk5zMXh5VTZG?=
 =?utf-8?B?VUZYTU1aSFZBemFXaUZNSjlNSGZvdXQ4Wkxhb0JlL0FhNlo5S1dMSE5WVXhj?=
 =?utf-8?B?WlpOK2xsUUxqSlZLMFU3ZFZVcDB2bnJMZFhHNmY4T0RCNUpIRXRCQ2VpZWdR?=
 =?utf-8?B?bmZzaE8zOGV5Q1EweGk3UjFSL21LRGRKTHVISTduQXlHcnZESjR1YUVwNzA1?=
 =?utf-8?B?TTd1SVl3NDU0RkNsSnhKZGdZVnlXVmQxUHgraEYxUld0Z05IRndwa0FnaVVZ?=
 =?utf-8?B?RW0vV2orSkJoVlZhWUxSRTdQMm50MlFKNllHM3JybEpkMDZwRUZUZXpCc0RR?=
 =?utf-8?B?VzRrd0tYd2NmNm40T0UrbzMybHdGT3hXYlZwSm5xZHJSOS9wZFJxcDVIQ1JR?=
 =?utf-8?B?cU5Cc05UNWx6ZG84R3crUmk1ZmRLdm96elVodDdrMmRNajJNTU1jbC9sbFk2?=
 =?utf-8?B?aWhKNzJCRUVCUkwvVCsycHJ0OXAzeEE4MXJDRXFucHZXbEEzZUxHaldKYisy?=
 =?utf-8?B?dU1qeEZsOFhzRlFoQlhySDFkdWVYTnpDR2NYRllwTzluY2MxRlhLWTluUmdp?=
 =?utf-8?B?ZlE5d2p1dGh0TWR3Z1ZGRTNlcmRRK3BBYVE0Z2hiS2pGRzVYZlF0UnU2YmIy?=
 =?utf-8?B?VHAySUlHR2U4d3R2c0lsdCtuWTRmaElkSkt6VkpRK0N2QnR0V1Yxakg5dEJC?=
 =?utf-8?B?RDhDRHRibmJMVCs2RFhEU3FBR3NISGhxMys1NVhkcWdxQzhvYjRFNndpbmdi?=
 =?utf-8?B?emtodEp1VndXK2F0eUFpWitSZE5JVlNidFFMb3BVMDQ4NFhtL3RpY2lhVzRr?=
 =?utf-8?B?aWNnUVQvMFFBSmt5S1ZWa29KQzhjczh4TGUvS25HVFZnVnJkKzlwZDJPYkdX?=
 =?utf-8?B?b3doVHpWM002QXEwM296bXJ2cXRtdXU0MUozSFZJWXgzQ0ppREZyTmxmbWh2?=
 =?utf-8?B?S3gxTU14UUNzOEQ1WnoveFBidkFsTTVIbmtIQ1NHdExUVlc5RGg0czVnMVMy?=
 =?utf-8?B?c2xqMnorSU1jUkxpMy9ZTGtSTHlkUC85K3dXVlhVdHFFRVNETkVVUy9nb0pO?=
 =?utf-8?B?cEk2VW5vU0xKUGNGZktFUVhROWx6dWkrT1dOUWlCeVY1ZFR4RlB5cWM3Q01F?=
 =?utf-8?B?N0FnNnJMcEFMRWpFV3lmUEd5cWk5aENyQnZkdnpuR0pOeHNQS0V6TjFUeDJG?=
 =?utf-8?B?SjhPODFQcHpRVTUyaW5EbGViYVQ3UG51Q2dWc0tvU0xOOVBiYzRXemtvcG4w?=
 =?utf-8?B?Mk1QT2pRZzRsSXg3Z3RyM2QrS0JudWxlRDAzRUNKSDFybitGdXFYVTdQSXpN?=
 =?utf-8?B?ekFRVlN1Yytubzc3ak1qVzNvcG9kQ09kdENIQW14RG5jRXRkb21IQm5oVGMr?=
 =?utf-8?B?RjBNd2tveXFERnFVcmw1b2lKNFZwOHZ3NjJpSXV0RFMyeng2MWFSblVrTFdm?=
 =?utf-8?B?VEgvSnhSN3FCR2VnMVpkcU9vdGNrZGozTDlrRzR6SG01SHE0TldOS3ZnUlpZ?=
 =?utf-8?B?bVNzNFdIMjFMZVUrZGJsaXpVNE5FRG5VTjRRbHVKcU9iSkZ6SXVQdVhmZkNv?=
 =?utf-8?B?ZjRZU1BHSlFhQ090NkR5eTBSNDJMWUJRVHRxbWNyYnJvdWVNVzZOekU1OGJ0?=
 =?utf-8?B?MHYzaFJITkVGaHFoOE4ya2Z2QlM0TlVJRHJIL2svUHdLdVpJb3Zxa2I3anlT?=
 =?utf-8?B?NkN5YmMvWmFOVUJMSXRZRzRvYzhJUXZpaVFKdWQ4OGdJOXY2S0V0cGQ4dHZ1?=
 =?utf-8?B?VE1PbHpzZlUyUTduVVZORDZUdnA2ZG5oU3VhYUtBY0ZySlBTSGFMbWZhdVFU?=
 =?utf-8?B?b0pURG0zWGIveWV1Y1d5dVI3RmlBR05yUDhJT2lNVHhsY0JyQ1BYRzd6cGps?=
 =?utf-8?B?dStsbzBnVjNudmczNkRKcGtmUVNxQmpLV1RBYXVrUjM1V2lZa2VXZmJ1WUs3?=
 =?utf-8?B?SU56SDQxQk45WVVQQmhJNzVLQ0E1SXp5MllMdGNXKzM3ekVUdzZCU1FJMWxm?=
 =?utf-8?B?dkp5ejdBVm5WaDFZeXQ4aVArSGlQaUFPWUp5OFdxc2dWWFJ6WFB5R3NNdU94?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hbMe5nSKGY4mxIo7/FU2Gn68OPq0y3U9P19Yv/XcGtXHsiqGQX9IKTSSNOpx/8JuTUNf1c1JKhj2fihRGvtddkz4BLCxfmHMeqsSf8+dox/B7uhRAa8am17two+k4dOdhUT35kM6ULqLBj/X+hPkQCru6m24BvlR+xWhxOuFFc+HbZ8RSqWeAG8UAw+WKK2VQm4uEiAcIbGbiWEgpWaBy8g1wqnzfQOOOAmXS5DkSBlzzC5iLWD1BZJv2ZLr7eQ5otwyLym251YT7iwHXNJJOwkIcaynxAKRDfzi+5Fg4vwgek8R+5KuDUOkTnqm4Z8DmMM5t31Yirt1rFdpIkoJvPOaAvXhFqI+V+jsJyIkhJkqCvNNuvSqjO8CV1CJffyTTAlJJ1o+zTQyomKf6vjmbmjPe3+MH/eVwdDziZcNy+lUXyz4OTEUzU1mq0oOWhyEoTEDVWOshzevZNsDBBfkex2I71eX6c6knwF4wXcIVdQPX/T+9PArc4VXaKjHya8y3xeQw7meEArVsB2Yzq2MPRUssAyaw3pt4AnkXiMmmVsXTel3+j3R8Ut+t0gmPRxol9mDlnt8SiuXj36AZJRST7t+TLorE5COYeJ/XsNZrOsugdKHUfgIgORp6Pd3qO4GfKp3oi2pfKWhyBIWYXi80gxbMZpArg12XZCcD7IDdm983UUe+Ro8sf0oPJoMuHZlwW4aDvNv6e5XsTqP30oXWA8eEoNf+M/GuEdlrhe+2qpQYS1A+kGcN5JnSIqOTNxJb0IPXYEO8bUAe+KDhcplh2lVyN45/LDbICoHBhcFwNW2c8V5/r0kwoM3iwCUHqf0nf9oWZlw8fxAZjml4eSoX7JQpLFGS/7Qxw9pA2FxgRxTAqe3GBhodQfyTAgK4t0x
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a991604c-aa42-4255-477d-08db8c5bf140
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 15:37:52.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5dQ8uvXL2AnALN/hXQZp5+/qEHpQgYi1uJ9nh1NDyTyrxLOodtA+Vtd7YtwhpklTQGNWJQteNK81xhjt+lLhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5101

Just like it's done for the XEN_DOMCTL_memory_mapping hypercall, add
the permissions checks to vPCI map_range(), which is used to map the
BARs into the domain p2m.

Adding those checks requires that for x86 PVH hardware domain builder
the permissions are set before initializing the IOMMU, or else
attempts to initialize vPCI done as part of IOMMU device setup will
fail due to missing permissions to create the BAR mappings.

Fixes: 9c244fdef7e7 ('vpci: add header handlers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm unsure whether on ARM MMIO permissions are properly set for the
hardware domain, but I don't have a system to test with.
---
 xen/arch/x86/hvm/dom0_build.c | 21 ++++++++++++++-------
 xen/drivers/vpci/header.c     | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index fd2cbf68bc62..c0ca57e05e98 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -715,13 +715,6 @@ static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
         return rc;
     }
 
-    rc = dom0_setup_permissions(d);
-    if ( rc )
-    {
-        panic("Unable to setup Dom0 permissions: %d\n", rc);
-        return rc;
-    }
-
     update_domain_wallclock_time(d);
 
     v->is_initialised = 1;
@@ -1184,6 +1177,20 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
+    if ( is_hardware_domain(d) )
+    {
+        /*
+         * Setup permissions early so that calls to add MMIO regions to the
+         * p2m as part of vPCI setup don't fail due to permission checks.
+         */
+        rc = dom0_setup_permissions(d);
+        if ( rc )
+        {
+            printk("%pd unable to setup permissions: %d\n", d, rc);
+            return rc;
+        }
+    }
+
     /*
      * NB: MMCFG initialization needs to be performed before iommu
      * initialization so the iommu code can fetch the MMCFG regions used by the
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index b41556d00746..12ae37deac83 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -17,10 +17,13 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/iocap.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/vpci.h>
 
+#include <xsm/xsm.h>
+
 #include <asm/event.h>
 #include <asm/p2m.h>
 
@@ -43,6 +46,21 @@ static int cf_check map_range(
     {
         unsigned long size = e - s + 1;
 
+        if ( !iomem_access_permitted(map->d, s, e) )
+        {
+            gprintk(XENLOG_WARNING,
+                    "%pd denied access to MMIO range [%#lx, %#lx]\n", s, e);
+            return -EPERM;
+        }
+
+        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
+        if ( rc )
+        {
+            gprintk(XENLOG_WARNING,
+                    "%pd XSM denied access to MMIO range [%#lx, %#lx]\n", s, e);
+            return rc;
+        }
+
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be passed
-- 
2.41.0


