Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94333423DC6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 14:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202895.357912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY65F-0004H1-36; Wed, 06 Oct 2021 12:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202895.357912; Wed, 06 Oct 2021 12:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY65E-0004Dm-WC; Wed, 06 Oct 2021 12:31:41 +0000
Received: by outflank-mailman (input) for mailman id 202895;
 Wed, 06 Oct 2021 12:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/TVP=O2=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1mY65D-0004Dd-S6
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 12:31:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd0c1732-ea0e-4454-964c-2be1938fe8a1;
 Wed, 06 Oct 2021 12:31:38 +0000 (UTC)
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
X-Inumbo-ID: fd0c1732-ea0e-4454-964c-2be1938fe8a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633523498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=3Yyc9Y2M8j7XZsCbjZ0DbpEy+MI0pxfhefDMcYSru/c=;
  b=OLvWX10EdbupWAe6UdVCqaXiFxiQuL1MsF3SQg4OXWiQXMp1b4ormKbH
   RvWlc436eVxOSEo/2aCtX0xzMiNMG78MmA6/yXSSKwdLEgeWebTbt3P7M
   6fO01l/f04gUSCOiO4eV1uMFKL7TjGsLisKsFbQaI/mwHIbpo8QO0pxs8
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ItPhTKARXuXSz7QnPAxegE2DZSTlHxWDzF0gF/J55uK9s9f9a7Otwp3a/kFLxun3twIb5y8iF8
 AFVF00Rc99Nl1ZjhQadh3xPFfFS9LbAHCXkVyueGpqYX7TnaRSVLyqGKUnVxZTJGK6yDrqqFGp
 d7Qgqyzsu+mVoJAQtJWXj/kEutX4T71QvE7My2F1JQVh86f2SINGp1l6WZf8DpGmeTWDNZbAAB
 3nPWuH29uTgcxbzwkBLpJdk8DPaT/LeY6YmTMFDLV1y4a/Yl9EireAowzOLy+JYV8jBU6x/FYZ
 muE9OShu4g4lMmXjohhs7m/T
X-SBRS: 5.1
X-MesageID: 54073838
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RPXbTahBh0iqrQi0UxV/YZIrX161QxYKZh0ujC45NGQN5FlHY01je
 htvCG/SMqmCYDT0edsjaYqw/B4E7Z+DnYAxGwtvrCA9H34b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yw34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Hm8S7EgMSD5b2wu0vbSUITwQnGYxZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHgPJkeoW1hxDefCfcgTZHMa67L+cVZzHE7gcUm8fP2O
 pZBNmE/N0SojxtnBVslWJ4iwdWToGD/TjZAmE7FjrIs7D2GpOB2+Oe0a4eEEjCQfu1XkVyfv
 Xnu5HniD1cRM9n34SCC6Xi2gejMmwvyWYQcE6a1/bhhh1j77ncIFBQcWF+/oP+4ok2zQdRSL
 woT4CVGhaI/7lCxR9/xGRixumeZvwU0UsBVVeY97Wml9K3Q5AqIA3keeRRIYtcmqcweSCQj0
 xmCmNaBLTBmrrC9U3+W8baQ6zSoNkA9LHAATT8JSxMf5Nvuq511iQjAJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3Ejp3IRQ484kPQRHCo6itwfovjbIutgXDZ8PJBIYCxXlSH+
 n8elKC27uoDEJWMnyylW/gWEfei4PPtGCLYqU5iGd8m7TvFxpK4VdkOunckfh4va5taP2+yC
 KPOhe9PzJV9ZHDxaZRGWLjrAvYU8fi8MI3Bd++BO7KifaNNXAOA+ShvY2uZ0GbsjFUgnMkDB
 HuLTSq/JSxEUPs2lVJaU89YgedymXxurY/GbcqjpylLx4Zyc5J8pV0tHlyUcqgd5b6IrR/Z+
 tJSXydh404EC7WvCsU7HJR6ELzrEZTZLcyowyC0XrTaSuaDJI3HI6SKqV/GU9Y195m5bs+So
 hmAtrZwkTITf0HvJwSQcWxEY7jyR5t5pn9TFXVyZg30hil+Od7zsP13m34LkV8Pr7cLIRlcF
 altRil9Kq4XFmSvF8o1N/ERU7COhDz03FnTbkJJkRA0foJ6RhyhxzMXVlCHycX6NQLu7ZFWi
 +T5jmvzGMNfLyw/XJe+QK/+lDuZ4ClC8N+eqmOVe7G/jm23q9M0Q8Ew59dqS/wxxeLrnGDHi
 FrGXUlC9YEgYeYdqbH0uExNlK/we8NWFUtGBWjLq7GwMCjR5G24xoFcFu2PeFjguKncpM1Ov
 M1ZkKPxNuMphlFPv9YuGrpn1/tmtdDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY58m
 bUhtcca5haRkB0vNtra3ClY+37Vdi4LUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ3fOQia5dy0zOd2sIOULMhecN144TvB1qzUMZIwjbkNTymfJqjgZa9i46T1oJw0wfgf5zI
 GViK2Z8Ob6Ko2VznMFGUm2hR1NBCRme9hCjwlcFjjSEHUyhV2iLJ2whI+edukse9jsELDRc+
 biZzkfjUCrrI56tjndjBxY9pqyxV8F1+y3DhNujTpaMEJQNaDb4hrOjODgToBz9DMJt3EDKq
 IGGJgqrhXEX4cLIn5AGNg==
IronPort-HdrOrdr: A9a23:aYi0hKHyBVHAT1UVpLqFRZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVoMkmsiaKdgLNhc4tKOTOJhILGFvAa0WKP+UyCJ8S6zJ8m6U
 4CSdk+NDSTNykDsS+S2mDReLxAoOVvsprY/ts2p00dFj2CAJsQizuRfzzrdHGeMzM2YqbReq
 DshPZvln6FQzA6f867Dn4KU6zovNvQjq/rZhYAGloO9BSOpSnA0s+7LzGomjMlFx9fy7Yr9m
 bI1ybj4L+4jv29whjAk0fO8pVtnsf7wNcrPr3OtiFVEESvtu+bXvUkZ1SwhkFznAhp0idtrD
 D4mWZkAy200QKJQoj6m2q05+Cq6kdQ15ar8y7nvZKkm72ieNtyMbswuatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAmqqIlyUBS4NL7okYvGrf2UoUh57D3PXklZ6soDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blnAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjibWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCgrT4A21rdR2GzX2MRGAtBjWu7NjDqlCy8vBreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.85,350,1624334400"; 
   d="scan'208,217";a="54073838"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRLUUg49DszpXSwARl5COtBZMouuMYGKMMTNSeUTPwtWP6s8wNQvgeAzCGxjp1ArvzCCoUmiGY3kmViv/wNDkFOEQwncqO1BW8KRH2E37fc2z+GBYlb79vsISJcleVcI2W5TSsdzSig786cbKiNWtPEuea/DNYNoW7RYmMGA2J7zaCjRZvlld8VtSuQWxdvfD92hAj5GgfaZE3ApjkklP0PwqGkl4fJCJ6bhuyYoluvN1oRr/aRJBuJrQDsSNdis8FiiqUJm1Nu3FjZ8Jkq3w/Um8cfj6gCzISwQukLmUsaHfuX9xFq1L3O3PZmsa5tCMyWNFtpes4wiDEuqYOxfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqwnsqGreIGepn7vGHFKmOXIUoFNtrXVQo/7qYAg5d0=;
 b=SwKMm636IJRFPWCnNTtawO1Yg8bXHsEwTdWoLEmuTaeGpVxdAckqwagJkTUPdRqFY0rUopqR1q278FKM6MoOyJs+/uP61a9rxBS3SAMgym7DRjZwhh8ZXEYXjnl4zYXvj7wBXUfdzkZ7EX/CNwnpKCeFKDBhu06x3DEMvaIyUn/hox+qBsz9hLd0dZNWky7wJTxhU0OpCCW1A5u9AwW2/3f1H7pDRPXCt4//hfIoVnI2WczV9MEOp+DVZTg3xosQH6ny086eCU8Q8nWgL/5tuUCepfdeJAkUuxYngv8Y6e+Gsmm9P8TwgqFsIyE+bkS/rkQC36HEL9/AaHvNblYSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqwnsqGreIGepn7vGHFKmOXIUoFNtrXVQo/7qYAg5d0=;
 b=XAbLdeiXGOK+fajdBkAKPDG+deFUzxYi9mlQZMlVuq6N/PcB5hnU58+iQe9scRow907H0ESrFERJV0BkFX9XEVp5jGkB+nrkc13LLlylWMfORNbl4cMQaLyq3+0EuUTOtvHFPS9FsG06JwbNvrjULbGRqTJYMAnJHFpt9Ye/fZY=
From: Christian Lindig <christian.lindig@citrix.com>
To: Michal Orzel <michal.orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	David Scott <dave@recoil.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 3/3] xen: Expose the PMU to the guests
Thread-Topic: [PATCH v2 3/3] xen: Expose the PMU to the guests
Thread-Index: AQHXuqF33PA+mkkVkkOV14cr2obRMKvF5taA
Date: Wed, 6 Oct 2021 12:31:14 +0000
Message-ID: <4EEC0FD3-16ED-4B7F-86A6-0D62656300D0@citrix.com>
References: <20211006105827.15217-1-michal.orzel@arm.com>
 <20211006105827.15217-4-michal.orzel@arm.com>
In-Reply-To: <20211006105827.15217-4-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0639047c-68a9-4805-e733-08d988c52ffe
x-ms-traffictypediagnostic: MWHPR03MB2669:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB2669C6808C9D2142FAB765CDF6B09@MWHPR03MB2669.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c3uoY/V32kmOLjvKt2UGexUXWGcYwXxZpC+g8OjBtqPXsIEzJoxJx4TV56pjFpE3u0Xto6uhjqYFla+YfFCqXnlCTZBKZ03tMMbXqpznQ/dsXH+06lTr0JuMNPN0YqN/JzguMwR8CWfZOy8JaAxzAK5275LVkUZVr/CAXZoHhvwuE4h5HxVETcRwWiS5cvBUVizLTNd5PBurRbLTF6P+ulGxb78AUrdtMmCgvCogd7asMqp1WmncR5iGJJHmfPw0CW9DtXP2SKAyvY41FD2HchGXRJBLH/5/QgqZdAPhsjQ/BBwkV3jjNGmb1vLyiPYp2ESNAoBMQCglYhXFEkGTB9tWhemIapj2gqgrHy/hZVaRnJg7zCM7SCFvcP4nVNpZ2E6JS1X25paBF0/7NJ08XkE23XFUsWZAiccbQ/lJUSmFgo1eyDMXWrUa6WpqJJ6Lv0r7pEZP4upb6elF5pZY1nArmOcc+/dbdADyD2L32T1eQwHlbqw+TQTwcN5pPj+zh56z4CBKQyHqvXb0uf5Ut5nFLiv7gwRIfywCaBJv25c27DrsyqYFBypn6vwZdWlv7X/ziNoSHDp2rUD9ihqrSMAt6XJ3WXGOcvtJz5+OIRa3hGWGYrwX2S40CNE3UpLEYIB5Rlt5mWB9CFntYcR/iZZaz8ra29PK0mdtcP83Vg9ZL59GX6PD8Zzj9WmX5ppdYwzMEalAlXdFRJtD6FMW+lXM+8NWRnK/0+bEOpOsAiA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(83380400001)(5660300002)(6506007)(86362001)(6486002)(33656002)(6512007)(38070700005)(122000001)(2616005)(38100700002)(7416002)(64756008)(66556008)(66476007)(53546011)(55236004)(316002)(76116006)(66946007)(36756003)(66446008)(508600001)(8676002)(186003)(6916009)(54906003)(2906002)(71200400001)(26005)(4326008)(8936002)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fdHVfzK+rYSAujI1wp89aWILm4rc7Up8K4QWQZAGQZR0J+9g05m7GlH0nSLl?=
 =?us-ascii?Q?WpQoxr/4apaNhcY/On5vMLbsCkAjuqiAExzXom5p4pCkpqNxtIZsVkD9U31U?=
 =?us-ascii?Q?sgIeDJYPpr433QID8lMkEcg1aY86CMbcDW/K1le0yrXFD0EKkrFewUAFocnP?=
 =?us-ascii?Q?HeC0MOA7ySnzF7D08VHv1iWNZSsbB7CWMnUufUwUKKDX7Gx3Bcf5hn//mQbP?=
 =?us-ascii?Q?lNcnIbWYiw5SDqniFGxA2I9ufi4m9iKxXeEPLtEMA04io0TAHVPpBpEcOC9f?=
 =?us-ascii?Q?Nnj2jerm+HvFDDQKw9CW0ApF98re+TsJFz2ephdpbsNT/i4zMNgxAjy+0i3h?=
 =?us-ascii?Q?ZHpxR6DmYjXZFYZRqItL8b7dIqJmO1fZ5OCCx/LDAHxPCfJaDrQ5wASid7AU?=
 =?us-ascii?Q?2Ky+nzWPrCvT6hLxWAsK0+GImsY83ecwj59Azd6Loy+VvxvkDPEg30v99JEA?=
 =?us-ascii?Q?0NVb+JDdDJNsMU6YCC1lIlEPGXJ558oH230Pqj3iMy2sEq66AjDb/8koT62/?=
 =?us-ascii?Q?lkfMtvssQ1Ew78GdScAwkeWC0fTf9Ee6hzA6ysVoji+c1SJ051qux3kvgdcy?=
 =?us-ascii?Q?1wRrehcwf/bVN47+w7YBCJpFawI6he/ley5FKKL0+vTW/eoSqHZZ52UGJPl9?=
 =?us-ascii?Q?JKmgYO/0i1eK7tV6RwweLmA5/3Tpbe7xDs2U7pOZS4rOV0MZcxKzqKKRRb07?=
 =?us-ascii?Q?X0NUigjXpZ/XmcZM0nOMGH5yIHtGEeW4QJL/CZhKsCJTR1NrfNXdysaHFOxI?=
 =?us-ascii?Q?Hqe5FL2t3uJNMOqazU4C4slUHyjEc2jx28xShDLFI4MvYstETjUwhCSCv6+a?=
 =?us-ascii?Q?rRdigfiU/dDpUq+xpDB9l909maE1+1f+6fQmwN0vH4HFzsRTn4XnC0qMAhfb?=
 =?us-ascii?Q?+4AFSKtZoSkz9AR0HrJ3izhjxXa92vc4Xz6mH+V3NrKDL+T0YGIPKvAzdXLJ?=
 =?us-ascii?Q?RAnO+OlvNL6RELZcfHgHGw2su4anDcKCmgz0K97Bqr6zKJJneOOzgI6wxcic?=
 =?us-ascii?Q?gXv4PZ6RW83iKxUovNZdsgmvJ7X86UvBt6trbjOAW/jlb2mfm/MAA/bgcDTp?=
 =?us-ascii?Q?UuqKdWZo3LwBKdls7GquoZgn0cGv7pXdnMeNLNP7XIEc5y3glDXoHTBgTTUc?=
 =?us-ascii?Q?5qrywdE5NJGwDRKMi2HH0WQS63hS5EHNJgpRh8YH+WbBtzQol28W2Kpw4bu5?=
 =?us-ascii?Q?DPCDoejxjORm8nn+YP1g2Ex0hCBgkwrPRv1iEyteI0xZXEZqAYgepbK2SVxY?=
 =?us-ascii?Q?NzfnChEfxX8kKYyOB2E/tJUtNRU8HpxUlHe9roeNqKGKEC0kazVNxN0SF85I?=
 =?us-ascii?Q?LebTmIQuGPjBkFoQ8Mtnj3vx?=
Content-Type: multipart/alternative;
	boundary="_000_4EEC0FD316ED4B7F86A60D62656300D0citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0639047c-68a9-4805-e733-08d988c52ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 12:31:14.1927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZvIRJfqDLMDF37f+JKB6QiPsrgONFjugoAVj6RM5vfoaEOLGsdfsv5DPl39MH1yxNJeCxnt0MMRGbH9JEZooHkWmi6VsJP83+aru0pDQ2M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2669
X-OriginatorOrg: citrix.com

--_000_4EEC0FD316ED4B7F86A60D62656300D0citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 6 Oct 2021, at 11:58, Michal Orzel <michal.orzel@arm.com<mailto:michal.o=
rzel@arm.com>> wrote:

Add parameter vpmu to xl domain configuration syntax
to enable the access to PMU registers by disabling
the PMU traps(currently only for ARM).

The current status is that the PMU registers are not
virtualized and the physical registers are directly
accessible when this parameter is enabled. There is no
interrupt support and Xen will not save/restore the
register values on context switches.

Please note that this feature is experimental.

Signed-off-by: Michal Orzel <michal.orzel@arm.com<mailto:michal.orzel@arm.c=
om>>
Signed-off-by: Julien Grall <julien@xen.org<mailto:julien@xen.org>>
---
docs/man/xl.cfg.5.pod.in             | 17 +++++++++++++++++
tools/golang/xenlight/helpers.gen.go |  6 ++++++
tools/golang/xenlight/types.gen.go   |  1 +
tools/include/libxl.h                |  6 ++++++
tools/libs/light/libxl_create.c      |  4 ++++
tools/libs/light/libxl_types.idl     |  2 ++
tools/ocaml/libs/xc/xenctrl.ml       |  1 +
tools/ocaml/libs/xc/xenctrl.mli      |  1 +
tools/xl/xl_parse.c                  |  2 ++
xen/arch/arm/domain.c                | 10 ++++++++--
xen/arch/arm/setup.c                 |  1 +
xen/arch/x86/domain.c                |  6 ++++++
xen/common/domain.c                  |  9 ++++++++-
xen/include/asm-arm/domain.h         |  1 +
xen/include/public/domctl.h          |  5 ++++-
15 files changed, 68 insertions(+), 4 deletions(-)

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>

--_000_4EEC0FD316ED4B7F86A60D62656300D0citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <4057EA126ECD9C43BCFAB3D7B3D072C2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 6 Oct 2021, at 11:58, Michal Orzel &lt;<a href=3D"mailto=
:michal.orzel@arm.com" class=3D"">michal.orzel@arm.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Add
 parameter vpmu to xl domain configuration syntax</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">to
 enable the access to PMU registers by disabling</span><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">the
 PMU traps(currently only for ARM).</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">The
 current status is that the PMU registers are not</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">virtualized
 and the physical registers are directly</span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">accessible
 when this parameter is enabled. There is no</span><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">interrupt
 support and Xen will not save/restore the</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">register
 values on context switches.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Please
 note that this feature is experimental.</span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Signed-off-by:
 Michal Orzel &lt;</span><a href=3D"mailto:michal.orzel@arm.com" style=3D"f=
ont-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-=
text-stroke-width: 0px;" class=3D"">michal.orzel@arm.com</a><span style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none; float: none; display: inline !important;" class=3D"">&gt;</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Signed-off-by:
 Julien Grall &lt;</span><a href=3D"mailto:julien@xen.org" style=3D"font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; orphans: auto; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; wido=
ws: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-s=
troke-width: 0px;" class=3D"">julien@xen.org</a><span style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none=
; float: none; display: inline !important;" class=3D"">&gt;</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">---</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">docs/man/xl.cfg.5.pod.in
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
17 +++++++++++++++++</span><br style=3D"caret-color: rgb(0, 0, 0); font-fam=
ily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: nor=
mal; font-weight: normal; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/golang/xenlight/helpers.gen.go
 | &nbsp;6 ++++++</span><br style=3D"caret-color: rgb(0, 0, 0); font-family=
: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/golang/xenlight/types.gen.go
 &nbsp;&nbsp;| &nbsp;1 +</span><br style=3D"caret-color: rgb(0, 0, 0); font=
-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps:=
 normal; font-weight: normal; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/include/libxl.h
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;6 ++++++</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D=
"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/libs/light/libxl_create.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;4 ++++</span><br style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/libs/light/libxl_types.idl
 &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;2 ++</span><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/ocaml/libs/xc/xenctrl.ml
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;1 +</span><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/ocaml/libs/xc/xenctrl.mli
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;1 +</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/xl/xl_parse.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;2 ++</span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/arch/arm/domain.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| 10 ++++++++--</span><br style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 12px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"=
">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/arch/arm/setup.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| &nbsp;1 +</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/arch/x86/domain.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;6 ++++++</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D=
"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/common/domain.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;9 ++++++++-</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/include/asm-arm/domain.h
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;1 +</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/include/public/domctl.h
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;5 ++++-</spa=
n><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">15
 files changed, 68 insertions(+), 4 deletions(-)</span><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D"">
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D""><span style=3D"font-family: Menlo; font-size: 14px;" class=
=3D"">Acked-by: Christian Lindig &lt;</span><a href=3D"mailto:christian.lin=
dig@citrix.com" class=3D"" style=3D"font-family: Menlo; font-size: 14px;">c=
hristian.lindig@citrix.com</a><span style=3D"font-family: Menlo; font-size:=
 14px;" class=3D"">&gt;</span></div>
</body>
</html>

--_000_4EEC0FD316ED4B7F86A60D62656300D0citrixcom_--

