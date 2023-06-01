Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5712719CE9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 15:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542472.846370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hzo-0007CZ-44; Thu, 01 Jun 2023 13:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542472.846370; Thu, 01 Jun 2023 13:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hzo-00079C-0h; Thu, 01 Jun 2023 13:05:40 +0000
Received: by outflank-mailman (input) for mailman id 542472;
 Thu, 01 Jun 2023 13:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4hzm-000791-7S
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 13:05:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd13a2c7-007c-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 15:05:33 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 09:05:29 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 13:05:28 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 13:05:28 +0000
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
X-Inumbo-ID: fd13a2c7-007c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685624732;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3A/z6pMBM6dgseGzIcYV6+lyHTi0G1UcoKt9X7xxpOY=;
  b=WMJjxgFLNn15NTSzjwsWVPV85IcqvOonNVMqu2wBWWM0cbCqd2H7NNpL
   8xLkjW8fDIppR7JqOb5bTw+EUK9YkYJb9LMD867hr4gislZMCxE3c5O/u
   yIKVVX1XxlecNogGgW6CdI1gIiZ/BpP4gszJygcosDSxm7F1CyZaMjoTS
   I=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 111630270
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:if9BEq7w1RAFeJalJ8ZwOgxRtPbGchMFZxGqfqrLsTDasY5as4F+v
 jMaDTjXPP2CZ2f9f4gibY7np0oD7JTXmNUySANvpHhmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 qU0FTwMSBu4p9mc8LaRdPlnlMBzBZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkkoojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHqlA9pIS+XQGvhChle9mkMqDjAqUVq45qmaiV6PAtN1J
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUj0qy6+RXMhGuqr52QFwotvFyJDiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:Cdwaiaut9dali3K6Pf3GMtVT7skDFdV00zEX/kB9WHVpm62j9/
 xG+c5x6faaslsssR0b8+xoW5PgfZqjz/FICOAqVN+ftWLd1FdAQrsN0bff
X-Talos-CUID: =?us-ascii?q?9a23=3Ap4cGqmpyoBL5f5QGIBpLuPbmUdt8XkDRzVHbGG+?=
 =?us-ascii?q?DI1ZtYoOFQk2UqIoxxg=3D=3D?=
X-Talos-MUID: 9a23:Ot8JBQkGTDkY+JPnGB2fdnpkPuk0zJ2oJXwJkJZB6+qHJR0pOh2S2WE=
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="111630270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMAf2XrajjeXSrkpCmxXZSlzwE3Ttk2bjAUH+NYFFPsPueP94p3K3Ox39fcY2gKlJE9SNVmWuUopkqr1nJBhSy+OSta2ysSb43CFG1p1DzqAMoqCAD71SCE8zeUBX3lOTlOqQMDn+4QH71D+pGLYfD9AdRdpbWf/g1BOCXHhDbx7z84uEV0K8WtXqnmJwrxXcFXwpMP90dEAkL5EFJdPbTrLb7++OCPaBZs88LCD0vYWvFe3uc2tgk78Sw1dw0P7nN0m/UhV+ci7zlaXKTbkiK0z9VOmV0L4zPOtKmLVmLXDo4qK2q32cy9O2djZoqx0jVDvJm4nGB7j/fBJVw05zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXXnRm+6U+AjsKIIcrkp7f+XMhptVWCTZpd5PCjoEYU=;
 b=J4P6RXaip1hpgZ0xw9M/Mw1ndqwkd+E7wFcUcn/K3pr12we9RYic66uvt2FvvCAL591y1AJnJw3/uTdtsFmHxwQoxxgDhv+T6687O+whWoKDvFwgcoQuHQxthjCWU81QfkHYkuEY0bttlLiyKUcv0Moh+uApcT/9wxADNeoJqM8CsfqBU4ZnZtVDDvKQBg6KX0G1gbyXBsnYIe0NEZJaoYWdvQuOHwNvEISZlQ8V7aQv+wYfMw0uX1dKUZ2cQp/dX4/CvborRkky5ttXQPI7Nnlr/F7uIr7Kyy8MCmA3xjC3ZZrPitGJ21YT2uMnw35tvSx76FclBZZZs9a8vQ5dDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXXnRm+6U+AjsKIIcrkp7f+XMhptVWCTZpd5PCjoEYU=;
 b=vZEgbdXp+LpzbMJtjfj6WxjaSLKzvk4GmU1pBr0126o+8hP6GlDzlO++4M90t5HBAoXmPKDIV80EIFNqurItya8bifzv3YP2VkXXN/U2jYEzSFHDLSkErEIj9QKxZdB5w04QXljlbc7poJ99Alox2k6AWSY0SK0XcroAb7oJJmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] x86/gfx: early boot improvements
Date: Thu,  1 Jun 2023 15:05:15 +0200
Message-Id: <20230601130518.48874-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 5912c0f1-2672-4f81-9b89-08db62a0deed
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y7bV+MeEwh/UU7xs/yTwa4+Nx0d+d76TSzpwkpqT1lxQaYfSbbAoc0bQTEHNqgA3Rnjb1HLewOlI6xDtGKYS4MziUP2mAuXF3+lpp8sDTynYIZhdTyo8GqdRq8+9ndns6WieWD0oIfgziEzyMQMaA/xKYYOeRD8jOx1Ay8xPcq0O31N3Ap+LQ7WPPPSm/fY2rG7uSv8W63OOTWCu7+i80nrUuSg66VAxE9Jkyee5tHEk830PV9erUccAtsfEqmYLXfl2n5AEmYd8RFYeA9ELLTdvHzTH0AgJ05OvZap6G3Dqu7YpyDBk3BG+RJAgNw3KHJpFaGWXGEqS3Xk0LPlY/24XP3WOM6wzUDk1apv9gPg+1lawCU60iMb185TFIDuUPzA76ZRJWg6qN4F1WEOriIX0sV+AL6LFAF6Um+QUPifHfnYeMpG2lqAR4mvz4F+xzKU5QBr2Qn1Z+ndfVn8CYEELlb8MsXM2M4regVvyYxeYaQiMxcPIkmZSL/SXeIOez4NnMdJi2ttCA93Y6SHbeGTEbII/mZIJUpDVkGodobG7hfL6fJljY072VBX26zbW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(83380400001)(66556008)(6506007)(66946007)(66476007)(6916009)(6512007)(26005)(6666004)(1076003)(54906003)(2616005)(186003)(86362001)(6486002)(4744005)(2906002)(8936002)(5660300002)(478600001)(8676002)(36756003)(82960400001)(4326008)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFJKcW11MnV4VFpCd1VFQlF0bUVnUGlYT0ZiU1N6YjBzcFpvL2dqaERzemJh?=
 =?utf-8?B?ckYybk9IMVloNkpxQ0FFYVVvZm9PUmtWVnA1ZEhvaFRnMDdteVNiK25BUHh2?=
 =?utf-8?B?L1o3RmIyUjFvNmFHSllzN2RrK0hIdnpjaEpLUVp6QU5aZ1Bidk8xM0srZ2ZG?=
 =?utf-8?B?YXc4R240a0c3WldKUXFESDAycDVjekNsc2xNczJrWmg0YTFNcnp2cHFhRkla?=
 =?utf-8?B?b2ptVHQ0cG85YW5tNkM1Z2Y1ZEsxM21RZXdId3ppSS8zNGNmUEJpRkozcnMv?=
 =?utf-8?B?RE1rOGhoTC9ZM0pTRXoxdDFEcjhjZjJGUVRsRmM0U1pQRktaeEU5SmRZaUdu?=
 =?utf-8?B?aVNqbFVvM0tlSnF3KytnNm1QNEpXenhHTUd2WTZCSGZmNCt1ayswWXMyUjhE?=
 =?utf-8?B?RElsaGF5QldQemVLOUx6SnBCNkJWQ1J6bjVBREtxZTZodnFpdFQ3akZQRTBF?=
 =?utf-8?B?akQxMEk4eFVZMTZEZkJJay9EQk0yWXZsdlhwajlYTUFsZUhubzNheklndGF0?=
 =?utf-8?B?OGpLcy9CZEhlL2ZTNXZlandWWEpUTFIzeDFMY25sV1drQkM0UU12ZjdaVWN5?=
 =?utf-8?B?VldqTWttUXpaWjFWVXdTeFIzQ3MzS2pvRE1oSkNzeHYrV0dmMlpPY0JWTkpC?=
 =?utf-8?B?Rm5wMnFHMVdjR1Z1Ykw0RUtScGt4S3RjQnprQTg0RW1BbzBmdWJ1bkM3bnRu?=
 =?utf-8?B?eTBza2ZMTGdxN3BZajFkV0g0NlA5cXVUditESGtiZ29GRXlBWE11VUZUai9Q?=
 =?utf-8?B?bDNpb1E2QXlTelJITzlLVWp4R1RZMktod0h0RlpQbS9sa3U5Rmw5STVxZDhX?=
 =?utf-8?B?cEZiNTRKUDdLYWI3dDYrTCs3ZXc4d3Z3RmRZTEpmSTR5bXlhQ0NnZHNLNHpY?=
 =?utf-8?B?T2RZTEt1d2tPWitOOVNjd0ltdUF6enNPNzFlSk9LMkhwY0xXSkJIaU5qTU5P?=
 =?utf-8?B?RS8xM1Zic0xGUUp4N3M5N1hjMUcyR1FaRGRBZXo2SFh1YVZEcGpkbFE3L1F3?=
 =?utf-8?B?T0VoYmdMb3BsZzlOUkN4eTA1MkxIbjdhZ1MzeXlQdDZWVURXM01hZ2I5S1gr?=
 =?utf-8?B?UHNvR0xsdTBCT0V4d1RQVXdpeWpQdHJKNWFheTdpakFublVpOHdFaHhkbXFH?=
 =?utf-8?B?UnZWaXp1MVA1WStxN25Vb2krY2Foa1VJWk1MWHZPeUxJQllvRVE2ZGxTb3c0?=
 =?utf-8?B?MzRYaWRad1N0cFI2OVhGTk1kNGczNlhsbXUzdmtWU2NLSmtEZTNxQnFLUE5x?=
 =?utf-8?B?dlFRbUQ4RXdWYkcvRUJtamwvWnQ3UjFoSmhBNUFpb0krNWdNcmg4S3dQaCtW?=
 =?utf-8?B?clZ6SElkTDNIOXhIWGpGYnUxcFFoOTgrR0xXR0U5L2ZHc3ZQWXdiTmd1dzdU?=
 =?utf-8?B?M212SmxEcjltU2RvM09QekxHazZZb05KS21WVVpCeEdhNHFRK2ROMXpuN29w?=
 =?utf-8?B?bW5uRmxkdVkrb2RTK1JjTy9WaGNNeVdhTEUxSzg0NE1xVUdZREFuRG5TQnA4?=
 =?utf-8?B?VnJubXNwUjZuQUFFU2VyTC9rYXZhSWIrNGlBYnpBT0ZVS1kxN0NsOGk3b0Vz?=
 =?utf-8?B?QnRJM1UyQkloMFY5Szc4SmVjM1JySi9vaWFLTzNzNW9reElPWWF6V2h1bTBB?=
 =?utf-8?B?Y2d5ZU5ydnpYWUNCSHNwaGJIWTBrTjVxQnZaTHNOVnloNFNONEMralpHeWhE?=
 =?utf-8?B?MDFDTlZWL3BLNk44NVM4ZkdkL3lldXhBRTArd1BncGliS0gzN0svQ25sU29F?=
 =?utf-8?B?Y09xeWJrMXExc05uY3F6R3Fpd2N5bWtLY0p3WDArMUg5VlF2aEdoSGtNeXVO?=
 =?utf-8?B?c01RUi9JSFJKRjlXSk9GMk9rc1p6L1R5c241MnVzeWJoOFRpU3o1K21vS1Iw?=
 =?utf-8?B?OStXU1EyVFJCNUFFNGxRK1pqVnhyUGcwVDg0V1lZazJaSUEzRkNDNEZMYVlO?=
 =?utf-8?B?QVZOYzhmckZydVIvdENGdEFYZ2lRVE8ydGRqWFNKTGd5NjNxZzdOS0w5WENP?=
 =?utf-8?B?Z012cEFEVFRsc1BBNDZSUGNuUjd3VSsxSU1VVVNXRU83K2NwdU9VTldneGVv?=
 =?utf-8?B?OW9pM3pQUmxER3o1V3FiSnp4MlhyLzRvbWhBWlR0bWdYdHhEUG8yNlo4TUpU?=
 =?utf-8?Q?6DPOZMjzUVOXSKtkGMO3uHwkI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iLev7O2Kw1h3mTrHB8S7/o0mXLxDvsMmAcwSZnYwZyTwpsa2z4JQI12YmMDjcJYKDUYAoeHoPqLNjHpFd3FGxzxPnCVja1cgC96yetiLb8YkQ5N59/0tuqf+O9sYCI/iYo+sHNwpdmfC7ez7qb2cVMSD/BE7PKI5NaPfFwMT6rRFyznq+jVXmBXr2tjIuUcD5FTMlngJKUR527QHUkxL3mmyAYQLrfIgrQrQuRQkJWuSx8P4OLPx+9Dx7zNL1QIF82ABXVImLg/kQD/RNzvSow25b83/qwUjY3sN9b1cecvEh2ulDMQ0vtQZahJ+q9kUTBVQHePG9hMDFponMsiLD5wrUBbqY39R+AHFoqK3i2uV8ubySSTNde12PSvWgHysYPjqDvfiXJy/Cq+qS6QBRKM5rtH5Q+CdHN1o6b3nk45kh48S9ZXK8QV0MEoRJ63+q08KPw7ku+Jdw3AdA9+u9Uve6JrL3Zk0ek6jhfVlqwrXEK1yUDO3L3lkdFTX/8MiXe6i1VwdeTH9Rrn0sncuXSTxAtTbjOJ0sUBtJ+NHMa6I+60vNpgEpBbE7ZqU3vK6ZLuzHuSuWeFUsu05vIb+xHaIfanG7NhaMI1PgMEmIc3AUneTIAWN2XYdN7j5MSa1fEC3T91FgyllQTTJvvfGkdnhlKWWn1kC6cnB4rPhT6b2egMGUs/C5vtyf9tynkMKcTpFUl1rLzCH4vgp/xXtKvpwiukFKKVwEBtHtL9VmT/FxSjdrGNr556vnuimMhUgvriDkoilTCBxdnIHdxGTx0LlmPphOgKVjaInfLxLQIGLYb6Rpa/wwQEQJI1lF/5I+iwm6TjxMYKFBej2rVmCmh1ChOMM/ZDGjbad023gGQw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5912c0f1-2672-4f81-9b89-08db62a0deed
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 13:05:27.9711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FkGl7n4IbIAdzKKYYrBvqkIP0y71g3pMdEhrKsnSotnroRBv5jc5UOFvUsIrCwfUwEMXezO6XfCLkYT+xa65Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347

Hello,

The following series contains some fixes and improvements related to
graphics usage when booting Xen.

Proposed patches fix some shortcomings when using multiboot2, like the
ignoring of the vga= parameter and forcefully switching the console to
the maximum supported resolution.

Thanks, Roger.

Roger Pau Monne (3):
  multiboot2: parse vga= option when setting GOP mode
  multiboot2: do not set StdOut mode unconditionally
  cmdline: parse multiple instances of the vga option

 docs/misc/xen-command-line.pandoc |  3 ++
 xen/arch/x86/boot/cmdline.c       | 85 +++++++++++++++----------------
 xen/arch/x86/boot/head.S          | 13 ++++-
 xen/arch/x86/efi/efi-boot.h       | 69 +++++++++++++++++++++++--
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 5 files changed, 123 insertions(+), 48 deletions(-)

-- 
2.40.0


