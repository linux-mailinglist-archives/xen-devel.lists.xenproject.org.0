Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3505B9F8F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 18:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407582.650140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYrc4-0006tP-50; Thu, 15 Sep 2022 16:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407582.650140; Thu, 15 Sep 2022 16:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYrc4-0006pb-1J; Thu, 15 Sep 2022 16:21:16 +0000
Received: by outflank-mailman (input) for mailman id 407582;
 Thu, 15 Sep 2022 16:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCqY=ZS=citrix.com=prvs=250640b55=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oYrc2-0006of-11
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 16:21:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68e5a66d-3512-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 18:21:12 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2022 12:21:09 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6389.namprd03.prod.outlook.com (2603:10b6:a03:398::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 15 Sep
 2022 16:21:07 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 16:21:07 +0000
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
X-Inumbo-ID: 68e5a66d-3512-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663258871;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=M3uvTqrHZB00+jjl+XtkjiPzMHJZq1iJsFn31UhsYv4=;
  b=Z2hYdKHxdMcwBGV2Bu68m+Ed1yPpWYtFR2FbqZXbtZa7I+pN7Sa26qig
   hyqwdsDpN8O05aeIxIIsumLslVxyasP3/Lnl+PxHKyWgg4FDR2L6OkTSK
   b32Lg7lO14SQwOgW6IVlZpI32abqrkJZmZVgfRdaOv4NrmTQSiCqqbucT
   I=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 80611577
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AZZ+mAqwNpQ1/g0g82zF6t4n5zX0xdTA+Zkaqj?=
 =?us-ascii?q?sTw1w6bGk6iVkaXd+b9/w+7gXlGCIjjn4Zkn4tCpUHvdacnWVnKKJyOAFfyh?=
 =?us-ascii?q?bJBTsUzFCKAgP0XvQGyBId1knYb0RTAM9uyzXox01n67day8LmuVjlEbsAVw?=
 =?us-ascii?q?TwiEr03nDoD1zQeJm3phUGQniEQ0neeNZZvYZZ5Kyo0szbGKeOA6qFFebK3m?=
 =?us-ascii?q?be6WgOUb/yshc8sixhpas4W2egfVBKIpuN+5TuQw2hPklOSQMuEhnRNC7Bx/?=
 =?us-ascii?q?jvJctqpncBSgkARyMnsTZHvYtqSMZpy9bQmb+HHgu9LLMjMFcahpMN7eDBYI?=
 =?us-ascii?q?h6G5RfE/lXCGbKJbJYqF8o8dmFGKB9TjAX03uzaQhwrVedko5Lz2IiyeI/Nx?=
 =?us-ascii?q?XlPXNnaGpkqfL6/tQBIKAd0+RK8iimF1Y7pJqnwVHo/CQTH3wu1enBD9BnxS?=
 =?us-ascii?q?CzI8jLDYyALvd0xI5xssOzIV7aJPMcI6fir0So9Vt5u0sqcJlf8eMwFqpBwq?=
 =?us-ascii?q?omy9AhujUK+a1v4HMv8Fv1Eca4xOeRg0Q2UOOyElmbNa+QzQUxpysNaIDBFr?=
 =?us-ascii?q?QI7vUkI7f0HSjEF4fQHrSO4AdWEd1QjawyK4EdR299udGljXW8X8NqL+BmST?=
 =?us-ascii?q?3cFzJnYqh5A2D20SocCdCUqcOluoYJ/+HwYWjMfPrt+dUOuTqY2NxF2XDN5u?=
 =?us-ascii?q?FvpYd3ClQOYY8EuRdFiTjEu64UujK/95SaHK/+xrJiAOuxyUAa14KdkmXhId?=
 =?us-ascii?q?HVHQ5eH9qW/aoebSRG27BMYbbUOGuqrVyzMpxLc3lw9PELSVGrAVzOM1hDHu?=
 =?us-ascii?q?u0ZGIjC3+F36AwqCB3B3CLztmveDf2MUwITXuy9fwVYVGqSgpMyyCLk+8UGa?=
 =?us-ascii?q?9NFyp2iyQLvG1h2iuaojjWVmASdcIH8g5QV2agtH8g8bQAxmMW2nmnFSGBYi?=
 =?us-ascii?q?ECMwJYbK8pNWOCIPTiKpYVO6yHj+QZ7OMBJ4oQ8iRVdI9zJlB8qjyBsh3Hiu?=
 =?us-ascii?q?+2RwLdxGI1jCUCA0iVK0b/tIs5J5VT6fwd2wic6972K9vsLwdeIQ7aM7uRAG?=
 =?us-ascii?q?YEAQgPt+Ilt4F8o81hl779L1tkMyfI848Ia+hQHmPd5Fckz6K5zwB4ioXXMZ?=
 =?us-ascii?q?rM7gxXURwnv/VQzf9Mdd0VpvEibI/PbTJswfOJCz7dW0ko/xFWatneAHuQBb?=
 =?us-ascii?q?KbdsGp1EFIyo4WTSooJxUPoR7TP5ZgSRm+yZeoCCrweEt0NARNi+OE2bSQxq?=
 =?us-ascii?q?IgXr1jCuE5XSDHaOnWVS/yL5x9hnb8sogcW6m+n8yVmTzw0VfM37RXO+wnVk?=
 =?us-ascii?q?/l6ERk5CptNQfbbJ7wllYuc3OTcmt57Ii14lw1HylBSGQJZmeRikEMepY14P?=
 =?us-ascii?q?NqZ5PYCtCCeDbuJQrT7u8goXxkQaLi+JeDYKzOubqfZxE9fNXdBa88hULiGY?=
 =?us-ascii?q?IYKIh0CDwRRio6hm6AukOGYLF28tEFSZMSr0iMDekED9KjhXH6+vs2onc3Mk?=
 =?us-ascii?q?5/PmSUZH/t8mwoJfHpTn0Nz6ZCt7ir1ETOe33Svp/LtTcSF9zcam1zmJKxt3?=
 =?us-ascii?q?9kRadP1iz7e69HJ9zede/fd3+y3K9mBL1/2fUax5IrzmoEYNRHmWwYo8WzqR?=
 =?us-ascii?q?rTeiOf21Q6ozTrs7qgF4VMMWhpl+aSZ6lYpp2EjtZ3DrXwsEVT3tNuu9nLEv?=
 =?us-ascii?q?e4ZN387D99Yo60d1fXEQp/0BMGkG8E/qxEz7wbDPoY0WEES+LbP9ThBIuXqX?=
 =?us-ascii?q?y7dc0zw8CSwFBeUHBvoEAlypwu4PPKZEt++I8LNRsCns9JWTgL/eEexbA7JM?=
 =?us-ascii?q?fmHkQGXdLE0z2FwrWtjqrda/IfzbGj0FIvfHZ7c8LM+Tr3CPBkd4eW0HPwwh?=
 =?us-ascii?q?hNRNXx04lM3FUXQZQZhKk9njDmdoI6EciMr3IiD/+JpH6MgsyaV0G50FjDhx?=
 =?us-ascii?q?Inr58TFD3P5uq2VSpFMzssaesArX5IR99LJa+Civjsk/atjLehVEGz5xelm4?=
 =?us-ascii?q?8JtngtwmsmjHD3Ky+ndphbmbhvQf/nMsKr0mhBSHJAHxi91TminG97QBNRvP?=
 =?us-ascii?q?32An8krNE/Tw5gxzfEuVn0sg7MC3Aq82fB/gq0mkC3euaLdh4LSZ9MGL665K?=
 =?us-ascii?q?ud0nvgpZ559NmjScmqbuIskPF0wdMcOONefBmmtcQtZvDS+HreSLAMxLCmtT?=
 =?us-ascii?q?OKhMxuqo68E15USDVunv0OWh5FI7hq2+fhbdBdFUlymsXcYfSm78bSVbZQyK?=
 =?us-ascii?q?pmEBpFf4WaBQ7mjtzarmPa7BaZN3UtcU/4CFWfnxb1s6CcnNnMBWcgcVsmJf?=
 =?us-ascii?q?+AU2enrDad4GY8Lx1HIYeRwjJ2YfA4mEffrm4ZJIK3/gL317oDlLg+myO5d8?=
 =?us-ascii?q?T+D4cMzjoaXaz8uCms93P/x7E7K1XQWCgpk21CXf3LaGm6dHHw=3D?=
X-IronPort-AV: E=Sophos;i="5.93,318,1654574400"; 
   d="scan'208";a="80611577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmke1tjp9Lmbnu6Nzo7Zoygm+1vkAD1IR7yv/VLI3BKuOzBNo8J+Mn+YBlDbRZuCZWhDxlh8O8DkyURtSjL4XQK9/RGYfULjX3w+ZuoMpXi56pTglBsoaKe+vI0m87TvQ8QsBoQe5ayhSVOU0OKJQ8tLEhHdX6JVD0rlB2ou1n1zhJ/DT1zbGwe/QxkGUnKWoCkc639GHHBRKtlyXexVFQR/SHS2D4j8NVAjP/Uvh/pFYF4l93DSam3LE/x7ld1JLltxDZZtTuIGFlnOSRH6M+nSprdFuEu0KT8hcMpo7P3Kjt3xaSMDAB7MbqmZF5/3LDxbk2P+EKlH1MuiHHTNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lto9s/xyWOi+R7V7nyNqLtesy9kZQNWDDHhlUjMdX4k=;
 b=AVHJj1YZFfJgJwjZOk/cfnZdWwJyqlE2CTU5ymYnYKCxDeHHf7dnOjiEwzDodaXWFR31RHOogNrH+auWt1H+6bp/9Lt8Rg+LcE9/DFPSgZkATyHmvh2Tjjeirff/PzXHppnDIoHD4qMl/BPICTp3GNi1R7LafG7lpPSRulxb5XlwFlhpBNGaC4Xz7lEHwTOZ0UHHqGQsNtkf8yDSzyivYu/q5hAUXYojrubTcn1OFYUuO9uLrve81em+0Ydezw/83lso/v3MFY/iydV639Twks+b+ku9kHymv6ZiT7c7P878VxgsOZ4XTseI5rCaifFwcIJlKdyEeAOdnUT6c7yxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lto9s/xyWOi+R7V7nyNqLtesy9kZQNWDDHhlUjMdX4k=;
 b=MVcixKmDxBkwZDjZOKgMa2YWTNMUkDO5DiJkfBD8QIGYoyL5nz2nPTuehAHH4+tg4pmlruO7VFddw9fj+gATwCRJ1JiCGPv8y/79rSiuK0TFj/+ryfdJ5TfWUlRvVRg3Dk2ErHOfAoomEMb9kOg2noTig5oGyyXPkcubaFfEAfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2] libvirt: disable Werror for non-libvirt flights
Date: Thu, 15 Sep 2022 18:20:52 +0200
Message-Id: <20220915162052.50522-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|SJ0PR03MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1f1abe-7a39-450e-888c-08da97364b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dF0qBUgzH8exLk4h8orbwzN0x4tPB1TOPVEgrl85QeoNXIzXdKwA+9pByPSAZTx4O6RsACcda+KAnn/ms/R6feG445CIvcTFPK/bZ9F5mOQRNQSohAcUsFcGRHvypvrVguXVT50Y80pJZFW/fqptBA3uBsp4Howgs5mdgL8QVcOytnhCtCUTp8LBZmCxuIrbGH3mQ9jEoZxFv9ex7ozAg0On4Ta133Hw32Em/+vUnGvjWazFfcuLd9jelYKVRzJT198aeuL83Lgq0TdmijRaMoXFbWqvLDsk2O54SFVCIYv2q6G2t+qX8EARIAqiyKVYvQzk/Xgc9xr2oUCw9BIM88BfSw6tpNUaRUpjrdApcXe7545Pt+EOXa8VDhREUnlLO+vq9bf4aDo/9EkfvLuyh/9Ha6VOB2F/oHi3KvPGxvnZy2CJAPAemQ0nESI32n6J5Hvzwb2Yqd/Lo/rtlgead3cUC/21LVkkku6l2joUmpnjW0wLlF3Xo4Eea4hW27TFM/Re5fs1+Aw2EzrSDzf8W31MeQsBvvuUPwYY00eLQ+qS3s5UuZLZynr5t2ppQlFO+65zqkFIfWLyiUi08J+9PBn/OFO7A5kxOrHX0LHk6Zt/5PQJbC+C1v8cNlFA2pUAThAaeLwNBx30T5MpDhAdIAuLNS60LeuJaFhltUjjiddeMRNA2tpj0HUywl7xzrO0MsCVYmpCMrxAlhtijqrq9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(6512007)(86362001)(82960400001)(66476007)(2906002)(8676002)(6506007)(1076003)(478600001)(66556008)(54906003)(4326008)(36756003)(316002)(26005)(6486002)(8936002)(66899012)(41300700001)(2616005)(5660300002)(186003)(38100700002)(83380400001)(6666004)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGVZa3NRWWdlNklXZVQvbVJkTHhkQ0g5SG1Md1dybzZJT25ScGJFSnJKQ3Vu?=
 =?utf-8?B?RTR6M2J4SlFIbWZka250QkF1dW9DQlRkb3dBQno2d2pCK2JHNXg0aWYxc05r?=
 =?utf-8?B?bEdkcWdPeCtVdUFhV2FvMUpFZE00cGNzUTFPWnN3Y1RodkF3OXdYcW9jbysy?=
 =?utf-8?B?MWFlKzRwUWdFUjM5M3ZoNVdYNENXUnFkYXBocHR5c09jL1FEaTQybFk4Q2hR?=
 =?utf-8?B?czhKemNZdFJEUFVEZjlxVUpYMEM5MkV4ZkprZHFXcjFPRFkzcmM1Ui9LaUIr?=
 =?utf-8?B?eWxYSGFwUnhuQTUzY1l1N3RQM1hDUG1RN1FLcHBEeHNhVzFqVFY3Z1Y1TGFJ?=
 =?utf-8?B?bGw3Q0hCbnU5MTNmRitXcU5xS2lxT1k4U0RBdGE3cm1iNjFuRW04b29DdU92?=
 =?utf-8?B?ZUprL0N2cnBjRkNQTStXTHhVNkpzaGU3YXloMnVHcVArMS9UN210QSsyNlI4?=
 =?utf-8?B?TnFRSFhlZXVzeEIrMmtBdmdRcnlVVm9XaldEeEg3alhycXZ6dXRCM0xnWG9t?=
 =?utf-8?B?RDdDcklSQzFSamNZeUxPcHNiSXZXUGF2K3FuSFV6RDVHRURBUitpM0FOMmw4?=
 =?utf-8?B?WHcwZVVxcnhWR2FTMmtXWEVQcGhWNVlNeGxLZnBwVmNhWUJVN0VTMEpXMnBU?=
 =?utf-8?B?Nk15NW0yc2JTbmhQZkRaakkwNXAyY3BuV3kzR3BQeHJJclFzRGdTeUFOVjRJ?=
 =?utf-8?B?eUJueGova0tuOHV4R2F2aGJjWUN4WUdTMkRJUFB6dXJxWEdtYWdUVDNoTXBS?=
 =?utf-8?B?aVlUVSsvcGxCM0o3NWViM3dPQUs0OCsrNjFvTXdOZXVwSXNPeTZJWmFFL1U5?=
 =?utf-8?B?c2FEL3RaUkRHR3ZUNHFDb2JnTWhKbGFqdnR6c1NtSUxiYU90RHZMazl0Y1pS?=
 =?utf-8?B?V3NiZC9Uc0ZxbmFvR3hMMlViWlJiQUw1SmpUZGROZFRZQVlranFSdFNHYWFH?=
 =?utf-8?B?dHNlcnB4RDlqTTc1M0h6b211cHpGTjRqY1JZcXlrUlV1ZnZhMUYzV01NMkJ1?=
 =?utf-8?B?UkRBb1VDbFRuR1FxQ0hIMng1ZzFYQ3ErdnFLUEFmWnhGVVdNL1A3Y3hIcjlw?=
 =?utf-8?B?MEIreXlEaWJoTDYyWklINmp3NVR5bGlhN3RtdFBaZzdIbW9CSUZHUjlFZDFs?=
 =?utf-8?B?Z0lnYmY2a1RiTVRiMHFQUkhOK0NjVjBHcEhXc0dMSU9HMEl3NWNwdmJ4T3hF?=
 =?utf-8?B?VSs3K1V2ekk2S0lhek9tdkpLdVNLZkF6K0xwZUxkdUpGZGpwZ0FWL0h4TXdY?=
 =?utf-8?B?VzlXVEg5MDg0YkJwSHMrS2U5UnVKRUI5UjFBeC9GTlNQaHRtcDRkdU5yVE53?=
 =?utf-8?B?QlpET1FmYjdVelY5NDVDRkdGVU10bWJDZFBrSlQzUGZBNlowYnlWQVU2UU1n?=
 =?utf-8?B?eWxObVlIUmgrUTdxZy9tYlB6NTU3WUhOMHRoOWxWNlR6WXhqSzRyVGtyS1gz?=
 =?utf-8?B?NkJyei9HcU5pK0ZiL0RoR0tBR0hXZm9xTjI3RHZoYWtYc2lPVk9hcnJnYkhL?=
 =?utf-8?B?UTFPMVU4aSt3MTVSdWhQUXRJZDNMdGlsVmVwUlltaU43Njh4dDZoZ2UzSVRY?=
 =?utf-8?B?Zy9BZjIvZy9yY1VuZFVNMnVVZ2NQZGZ6NTh1QUhKOERiM3VMZEJLY3lIMHYv?=
 =?utf-8?B?QTNrd2ZTaVYwTGM5V3V1ZVdsUDhSS1dSUzVGcjh2RklaaXhhUUhNZ1JaL2FG?=
 =?utf-8?B?eGtOZFV3VVFEVWwwT3JQYUw4dG5YbXJOU0t1NGFsY254MkdUUzNrTmVlUDIy?=
 =?utf-8?B?c0tlMG5rMVF1NDdxZ3VPMmhoaUNnOEpHbzhBUEExNHQ4ZlJ5OURlU1VNamk5?=
 =?utf-8?B?a24zZ25LMVppdUozNnhmRlRKV2ZETkw1M1YzQ25EOStpSTE3bFVKSm5HbVBH?=
 =?utf-8?B?cCsvZWwyT2dhY2tIVEE4OWsxczhJNW1UM2E4dVloKzNhcHZDQ1NvT3c4T0V3?=
 =?utf-8?B?cjVrekRaenRGREQ4NFpCSnM0MThJbU1Zd0JUNzhjYlhtdU9MS2hvSFZlWnRD?=
 =?utf-8?B?Qkh4SHhnb0xmMUFBNXVlUnFkZmVOT05NZGMwdUgwa283bDUzM2JnV2s1WGcw?=
 =?utf-8?B?ZjF5OTIzWjNlVFVhenVWV2twNUl6bE9DUWo5SFpKYzlteklTeTdMR0xYR2dv?=
 =?utf-8?B?UFFPZFgwaXI3dEZUK2xhRmNhU1BIWmQyUVZ1V05kV284dG5SWTIrblVyVGM2?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1f1abe-7a39-450e-888c-08da97364b18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 16:21:07.3241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p2AaVbhlY9fqwg3i2T04tJkMcUAAkpHwcgRilGOXJ6tRST8NnqyLcH2yajGv9wsKafRW1Zc0KbXRP7/+Y8tlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6389

Current usage of Werror=switch-enum by default for libvirt builds out
of the git tree causes issues when new items are added to libxl public
API enums if those are used in a switch statement in libvirt code.
This leads to libvirt build failures for seemingly unrelated libxl
changes.

In order to prevent those errors from blocking the push gate, disable
Werror for libvirt builds when not in a libvirt specific flight.

The errors will be reported on the libvirt flight, and block the
pushes there.  So the author of the changes in libxl is still expected
to send a fix to libvirt code.  This is no ideal, but the other option
is to just disable Werror for all libvirt builds and let libvirt
developers fix the breakage when they notice it.

runvar differences for a xen-unstable flight are:

--- /dev/fd/63  2022-09-15 15:57:44.340581730 +0000
+++ /dev/fd/62  2022-09-15 15:57:44.340581730 +0000
@@ -574,6 +574,10 @@
 test-xtf-amd64-amd64-3                                arch                            amd64
 test-xtf-amd64-amd64-4                                arch                            amd64
 test-xtf-amd64-amd64-5                                arch                            amd64
+build-amd64-libvirt                                   autogen_options                 --disable-werror
+build-arm64-libvirt                                   autogen_options                 --disable-werror
+build-armhf-libvirt                                   autogen_options                 --disable-werror
+build-i386-libvirt                                    autogen_options                 --disable-werror
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    bios                            seabios
 test-amd64-amd64-qemuu-nested-amd                     bios                            seabios
 test-amd64-amd64-qemuu-nested-intel                   bios                            seabios
@@ -1217,6 +1221,10 @@
 build-arm64-libvirt                                   make_njobs                      1
 build-armhf-libvirt                                   make_njobs                      1
 build-i386-libvirt                                    make_njobs                      1
+build-amd64-libvirt                                   meson_options                   -Dwerror=false
+build-arm64-libvirt                                   meson_options                   -Dwerror=false
+build-armhf-libvirt                                   meson_options                   -Dwerror=false
+build-i386-libvirt                                    meson_options                   -Dwerror=false
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_dmrestrict               true
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  recipe_dmrestrict               true
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_nomigrate                true

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use -Dwerror=false instead of -Dgit_werror=disabled
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Julien Grall <julien@xen.org>
---
 mfi-common       | 2 +-
 ts-libvirt-build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/mfi-common b/mfi-common
index 59e712f4..51eb4a9c 100644
--- a/mfi-common
+++ b/mfi-common
@@ -459,7 +459,7 @@ create_build_jobs () {
     libvirt_build_runvars=''
     case "$branch" in
     libvirt*) ;;
-    *)        libvirt_build_runvars+=" make_njobs=1";;
+    *)        libvirt_build_runvars+=" make_njobs=1 meson_options=-Dwerror=false autogen_options=--disable-werror";;
     esac
 
     job_create_build build-$arch-libvirt build-libvirt                       \
diff --git a/ts-libvirt-build b/ts-libvirt-build
index 16b45cfd..e4faa1d7 100755
--- a/ts-libvirt-build
+++ b/ts-libvirt-build
@@ -73,7 +73,7 @@ sub config() {
                              --with-libxl --without-xen --without-xenapi --without-selinux \\
                              --without-lxc --without-vbox --without-uml \\
                              --without-qemu --without-openvz --without-vmware \\
-                             --sysconfdir=/etc --localstatedir=/var #/
+                             --sysconfdir=/etc --localstatedir=/var $r{autogen_options} #/
 END
     } else {
         target_cmd_build($ho, 3600, $builddir, <<END);
@@ -87,6 +87,7 @@ END
                 -Ddriver_libvirtd=enabled \\
                 -Ddriver_remote=enabled \\
                 --sysconfdir=/etc --localstatedir=/var \\
+                $r{meson_options} \\
                 build
 END
     }
-- 
2.37.3


