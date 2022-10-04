Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FBC5F40BC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415370.659929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1off8q-0003Uf-LL; Tue, 04 Oct 2022 10:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415370.659929; Tue, 04 Oct 2022 10:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1off8q-0003Sb-I0; Tue, 04 Oct 2022 10:27:12 +0000
Received: by outflank-mailman (input) for mailman id 415370;
 Tue, 04 Oct 2022 10:27:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1off8o-0003SR-Kn
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:27:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18beec16-43cf-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 12:27:08 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 06:26:59 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5448.namprd03.prod.outlook.com (2603:10b6:5:2c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 10:26:57 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:26:57 +0000
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
X-Inumbo-ID: 18beec16-43cf-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664879228;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x+wp1zcD9twzsz0I/8jNc6kSwFcanIHSqtAksoTxnfM=;
  b=Z9AgPIjPCV3ybVkGaBEqRScA090ZkhGNocQjxWaJARvFUNvkjfyLquPn
   F33KAoSGsJSmpvKhoMs5AnZv6CJ8rHGsuk9ymhgJvAVua4fF903LqwjJG
   fbwmy+3w6TdHDf7r/vCypaZO+yO6wLWIx018YBXeglXUOQVRir3Cj3c7U
   8=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 81940470
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Ak5JKEaLxAym6EYKnFE//H55yvHf4RhNe4xP0q?=
 =?us-ascii?q?kmnJc0pyRJZ0RWMlPhd8sEGEan5YGQtjswdUusWqfUZCV8fw9TjAerbME2vT?=
 =?us-ascii?q?7P3+0XZ2uczS8WyRM/++sjSsjFWMyDg0ZGDz6fpM8T0ZtKpAB+CfeWy1D8Bf?=
 =?us-ascii?q?QUP2PpWY90qHIb0azKmwjeyHI8WlqKuHW1F0epPqSjqevL6CcCEIKc+M941q?=
 =?us-ascii?q?SAT80mmRg4pW7q3Evzw7MNaokc/yIisfxPljSekplkqcNZ1U215kCy47f5Sw?=
 =?us-ascii?q?VE7acC+psrpUke+VdPQRILjGWMEb/vmwsMZAyZzlk5k5J6G+XrGN9bfpbSf4?=
 =?us-ascii?q?XCfL4/8PYD7yytXahD22O4UDBSl7ETA42++RxfxeQks9z2n0BDBwVeNYApUh?=
 =?us-ascii?q?NlCd2xjppsoIJ/t8TMsCYTWW+1mhV+AgsWDyvipBzYBIgyGs+w6iX8xp/OdD?=
 =?us-ascii?q?CbnnTp+pTkhmw86z9JLfjMmgY3rmRnfSwhiYKUdgTkLLYQuq9C3lIPU2dAp5?=
 =?us-ascii?q?xVahBjdTSSvJhFVFrisnUx5mYq+N+L9RmdeUBW7eNvA514E9nS5h+J0rSfre?=
 =?us-ascii?q?SUtUmFc54gHcpeO6+Y04jCUPwlDuR+/OqndU5VNhHAlUFp+ZpGwd48DxZn6U?=
 =?us-ascii?q?3zn3FFtFp8+aORYrzUx0vHAdetuscB8+HyZWTQRvrtGxUL1cKY2N9H4n41RH?=
 =?us-ascii?q?0kUAYWO5hiyZ8+easUN2Khn83j4gMS2raeRAhzXXL0gG4bu000TLjK0Odscd?=
 =?us-ascii?q?pxaPZDHwqUMRLYZc1OQbQs5/fGUu65+gnOf0l2FLBKblIYkPsVvVZ6yQMfr/?=
 =?us-ascii?q?ucZGDvOtmwjDI1q/XynjTq2jGR6iB9iqpSqbWzF40b2KKGz/m7vA25Y5fWY7?=
 =?us-ascii?q?DRoKR6mGXmmpoIJeXVR+H3wFmSriIieoAOVcgYccmiMIt4D8AgFWdm4jmVMq?=
 =?us-ascii?q?MtyNo959E76tLnXf5tofEagGO604hn30WLk9xJwe9sLRf37SDz9HgRI2mVfg?=
 =?us-ascii?q?qJOj3aYY+kzRHsnBpFYUpc70sasVp7nZKIEVHlV00lguvm/0xvLkOwCqPTfa?=
 =?us-ascii?q?3jG9AiYuQqo4OK///dtePuEZQqUTn4nanIC5dpkp2G1LBzQ06vFpIx0PIavB?=
 =?us-ascii?q?6EPsHkFeFbw6YHM0d2eH8GhwZN43YniqGcUwHTXqLyh2q2NUtoAp7TMLW/7S?=
 =?us-ascii?q?4uducxlqKmwM69K2YxW2t3MZmo4xS2lz8hh34JRtw1Pok/4ffVkv/oJU5RUk?=
 =?us-ascii?q?XTfa34KC4ZK54MkcfYt1CguVl8QpYE5AyOBL5Z9s+25cJokkoZlAh3UhuFdl?=
 =?us-ascii?q?dTq+GjILecs+KQ8MB3m0tAObjpkz9AhPQcG5GYUWh/+7FJXbcYU2BIb/BDKc?=
 =?us-ascii?q?zY9PV9SQPQ44LLCZ7KPCzxfX9K1ZPFG/lXhKFYC62LfvZ3Himz+6U+xwEW+h?=
 =?us-ascii?q?A11D1J4YtrJPPM6/PUd/6UCPEOOYpeuIFzqscupOaAEuf8JYF3Hz7sfm58rH?=
 =?us-ascii?q?Shfq93dtjeufjlCXRNqpu5RjrhRlSKATkRrX6YOOwg7gr1mC3lbegeamXQ9v?=
 =?us-ascii?q?9gB49+TuCpGUnC7fYmiUkzIo4u4uU+GNlHbZvNRVOzuZElG8f4rbmbDTPCrC?=
 =?us-ascii?q?xkiipyDYhzINmZAXCXRMcvrIFyB8h0HKLtZ+qaXnZaBJM1e5mmBlcrJ8Aeg1?=
 =?us-ascii?q?hZTa1z6MPme3YFK9VhPwBtEX71FlY+xu/CUfp6t5RVNv5c0Rylxgi8naTrNc?=
 =?us-ascii?q?qJGyMaZrV8ovCcxnsuXin56ZURss9jEKc5LKNwDXVWouUfUdsibcyMqRI016?=
 =?us-ascii?q?RU8io8g/l687ek07wxUyXWyVt3MKbUXbskw4OvdQE+iSowSch/zoP8Sn6Mzr?=
 =?us-ascii?q?hXdtjUAPzSKbKJJe78oeFVmOsluEO2KGeqdOt6pMj7IYUU3ts+Gl+qiy7/Ry?=
 =?us-ascii?q?JV6h4MEtK8IvNTgKKLYJGenhEufwCOqUwjx77MVQaVJOrhIme1Z2ugrRREu2?=
 =?us-ascii?q?PbK1/z89b2PvXKyuv437EVzQqhSMiHcAsj4AUdlpitIYENVGu8fALzMejta5?=
 =?us-ascii?q?Fr4nqg3zpKaXOr+xlBxOzZsqhrMZTbIa7bkweAAIjM/f+SyrIwHI9UKcUhhS?=
 =?us-ascii?q?k/xfG3W92C4zX4EjBuozYv4zWyJkNYw99CN8SbTcDJOOOzBp9pqPn81qM83x?=
 =?us-ascii?q?V7+A9iUKIflGTXyH/Ma81n5Dq4Pqo6sUhwtQhX5FVd5MCgtyz7gJMh+8sYYL?=
 =?us-ascii?q?smXSFQs8hbItf+Z18OG8sL4ISXuk3EfkCT0L7h6Htkg9RN9q+wPrK/RgMVo5?=
 =?us-ascii?q?qw+xM/6l42sRY/+mpFMfUt9HyoV3KJGs0LC/eHkOdTCqYH6uF+IcylI+veve?=
 =?us-ascii?q?2n4gSX43d90/xcc+pHBWOJzgtGdP6CpXuu4HQktGQykCwZcOBvX5a8Wt2GG0?=
 =?us-ascii?q?YJ/VQzhmPBxzhQ/kYsIv1RONFZ4XwdwED5jc5Z1pmjD+l06ZUr+B1ml?=
X-IronPort-AV: E=Sophos;i="5.93,367,1654574400"; 
   d="scan'208";a="81940470"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpj3hj812ExuI3BD6cv9yuCILuhG9GspE6xNyyzKs/SLZH9z50JjWRJhZ9+v86OfAgX727HDP+rH89eZlKk7t2ou5Y99Xb8StayxWu5DNq/JdCkNUyfBunerN4vAv08NkZWagvJw4cslPXNtT5h9alPA4kZ6B1WGvuxP9GvmCplMJOm8UvQMXp/G1JtJrjwOA7tmevY9eJ4PzwVSpgLVIdUGW0cFGQAaauB8QwvrQxGUWBnkWGx10vJ4jCNEu/peIau0/5oDNMM1LEDIsf3kNiLYDEnLcREp6m0dhDK2CdB2HVBexwpsUbCiWVRba4JtrPsyr/opJ0LsBJC9XHtXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XD1vnsET9GCzUIm+dVy3YUvbCvc18cl3H4qHAJcprc0=;
 b=Rd+XcpEL7SN7KDxohmXk4lTctWNEdy3CBgMiYOuMGhQpnvNZdmeA7zbZdT8efo1OQ5IbEew+nJHlnDWv11+zvzXZztAH7xayqfMwWyYkoVlAnNRDhdxXOvjBfp3s5SZlpJrlNTBbL+VMkJb+hHk3Tfj4ScF0WIh1y6PdvhudqUkz8sIQkO/AJtg6dDcCKUawBhlD5c8I6eWAoH8I1jU+yQkidjUdWZCiJtata+RU05klmFPqgl64/hozXmsQiDUaD5z9GG7AWhoBtWeSgzTWAiJ3JKVtNxRWVkhvbxD1zKFRlDQBLQjCzTMGB0Ob7BRDisUVqZXVmwZP6Rc9B65fuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XD1vnsET9GCzUIm+dVy3YUvbCvc18cl3H4qHAJcprc0=;
 b=pwSD8Fv1+aiveTCjIonXp2F47jUcbIZHY3bTwmrOvewRJsVkvMZKOL4O7yODx2gF2GyhW2ztPrnSdu5vlTh6BRWT911YS8GQYl219dj6oier0JpcylQJDUi23I4L9k5yJtBARdekcRPGnuPSz+cQLv2ze8GWB3qXSfEt5lnFB4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 12:26:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] x86/NUMA: correct off-by-1 in node map population
Message-ID: <YzwKbAIJzOdDhS+N@MacBook-Air-de-Roger.local>
References: <b810cdce-00aa-6cf5-05a9-acc7f3dbb8b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b810cdce-00aa-6cf5-05a9-acc7f3dbb8b6@suse.com>
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: f2263941-41ea-4d27-b362-08daa5f2f6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R2oIa0ne8pcJfXLoEE83j+qIiVntUKU9elYues3SG84I8nq1oDJm/Su6Nlxjm4AJwo1jpVwCDRr2P4Opbqe3+d8m9fA8CkqEznmphVpAhzwVNcsRNWb0ewZa2K78Jbwxy+3nhOB3APEID75Wb1h6vOfUMEXfs4RF7aJJ052z0fIJ/mUlnW6datvr+8ug6/VtZxmo6PoGvBgDS21/dpSAcecwaj/N8dZwDqZ3VHnJ4Egevcd74ciLmhOdukNYmhdG5YIIUhEdGDJNf7i38RsYkVLBop6DCpxtgF9b+lDfkE+9ufS2fdthYfVCCx4XtR7Z2u+taOorDvLqoN/y/dPvQXvK2yIIGYpXH4ZJkAJuZZknC+rCTXEpJI1DY9Y4WH3YqouODzCR3VH4N3ivMCh429cFbcq8s5qCb07NDEsY41zerL17ecgtBlZs9f/46yNjd0bBY+u+QB/EpVW86JJXWC0orklFTNktxFhhjEciM02ccxtEhC2vlkCdwJxg0yDr8Ly02LlAe53P+oVaV/JSv4q30ySNQe6uLTJWEQuk1tC1eJANfIGKe7AnKLWi7wPzD7XzkqQXvb7trD7RUYg4FILQGzhdc69CUzpyp9sbm7VSkU253TdHmVaYcIl1gBW5y4Gi24NTDUa5KCXpI+JgyYsqxyEkrRzEvy/94NDOhBN8/CXEKh+ZKgPS6eba7WUooCEKsBJWv5vvLtQosLZTfdCaIHqG62+AHDgy5X7MITh49hs4ieLTRCWQg/YfFJEni9GO48zE2hYKhCUgtopb0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199015)(6486002)(478600001)(6666004)(6506007)(66556008)(66476007)(8676002)(4326008)(66946007)(85182001)(6916009)(316002)(54906003)(82960400001)(38100700002)(186003)(6512007)(26005)(9686003)(83380400001)(86362001)(5660300002)(41300700001)(2906002)(8936002)(4744005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHhIMEhlbmZudmZ2R1VCdzdwc3RVekZHdWdweG1nb2hseTU5Zm02RGliMkd1?=
 =?utf-8?B?M3ZKcFVYaWJuVHVZR0pNblA0c1ZiWDJQNlhsUVpwUkgrbFdTbmRXekhiRDRI?=
 =?utf-8?B?UEdZaE55bU5mVXVDVGVwU0VqY1RwVFoxanpNWU1RVjVXMnlzUzgzNTVkRnE3?=
 =?utf-8?B?QWpEbTRiOFFQOE1aN0hQOWcwc2lMcmUvYnR0N242eHNqRVFmVGtRRzJTS2xn?=
 =?utf-8?B?czVSc3M0QXJoWHB6d2lFakpuMXNQdHBNOThYaURUNjg0UHJKVE9HYXNDZGRM?=
 =?utf-8?B?OHFuK0UzWll0REVWU2dWN01tdlc3NVFGUTh4RHlza2RvWSs4OThoczU1TUY3?=
 =?utf-8?B?ZmRmTk0rVExwS3MxSW93dkloQTFxaXI2Q1FQZ3ZOQmtaMkVZY2tPeTdDVnE5?=
 =?utf-8?B?dmNuL0xVckVoM2pLWG01aUpDN2RqUTUzVlc0TVl6dHBrdG12RXBaNGFqNkVB?=
 =?utf-8?B?THBENU9LUnVUdWMvK1dJTzlSRlc2ais4azNkNGlBMFc5dXBzaXRaYWVPMGg2?=
 =?utf-8?B?bTNnbU5OaDZBWkNJVWIwWU1uVFhVYTJaZ0l4SjZXWUs2Zkg0TDBoVGx5OU5B?=
 =?utf-8?B?Z2QzQUM1RUZ6NW1zenVVZmd6YnpJN3YrcGRFZnBJWVVHV2JHeXpML0sxbDQ3?=
 =?utf-8?B?ZjVlTHZHdWkxbEoyRTBzT253L2VMM3JSK0tkVm5DMUhVTWROK1E5VVFEUmNt?=
 =?utf-8?B?YWMrZ3N6ZW1xdWZHV0NWVEd4RzdaYURlbjlxcVZZcm5VUTEwdm9PcjMrRFZF?=
 =?utf-8?B?clYwU0pvMCtxdGRiWERrVHdoNTR0Q2wrdzBQNGlEcnpJamlNempibDZyNDRV?=
 =?utf-8?B?SlQxTEZlc3hhM0Mzb3oyK3cvUHgxRm43UnJ4TFVtR0thQjd6bmdSRXA2VnlB?=
 =?utf-8?B?QWZNOWVPaWtRNVVlcGZINENVYkFObHJ2KzZkSE5ZdHZJZzFiUERjMGtYWmh4?=
 =?utf-8?B?WUM3VHBPRlJmQjVQMVRySlBJakJ5d3BjSzFEL0JGclF2QnJ2WTNFdkFVY1BJ?=
 =?utf-8?B?eitOaTFqSW91TnY2NmxTN3JLRmxaZE5RMlA0b3U4cjlXdi9SWld6VE5qWWFJ?=
 =?utf-8?B?TFJzczcrNkd1TWowbzRZTnNGTUFhcDNWajZHTGR1TlVvV2JIbXp1aExLZGZB?=
 =?utf-8?B?U3ppdVVPNVpDRkFRbzZocklCa2pyM1dTelgwejBYMENnZ1dVZ2JBMDNRd2Q3?=
 =?utf-8?B?a05GR2Fsa3ZNdmpUTzZVV2lhU2cwNU5IdnY2eG92Vks4NlBtNGo3UllFN0h2?=
 =?utf-8?B?NmMrbjNpZ1hVcERuVDgzL0ZueWRZa1FVdkVDdGwyeGZ3RU9ST0puYXVyR3NK?=
 =?utf-8?B?U3p5RXhiMjUrdHZNRzIrc1dEaWgySENwcFFFZEgzNm5paXRFMHJNNExweXhm?=
 =?utf-8?B?SXphNlFoekJyM01ObXk4VXNQU0FsMHZ3d1JVNHNTRlFpS0o3bi82UUNFeEpJ?=
 =?utf-8?B?SmdTQXFqeHNHcnF4U2had0oyTlJZUFJzNzdvaG9saThhc3pycmtyRmhXS1ZK?=
 =?utf-8?B?dTd1OS8yaUlmRFdZbC9TcmFtc1N0NWFIVXRrVElpNHBnbCtIeis0M3IwNVFm?=
 =?utf-8?B?bEErWEEvTVl1WTBpcktWaXlpVTJVTEtqK0RJcCtGbUJpTHB3QzFBUUpUYVRZ?=
 =?utf-8?B?c0RLejYyMXNLNkZwTklOL1pzYmpkRlRBbzhQSDJQdm1na3Q5OGFnejFsUHg2?=
 =?utf-8?B?a3FmdUsvbXpwcGFDVnNCeGtHRTNZT3dTaTM2dWtGY1picE91RXZIK3o0MHFY?=
 =?utf-8?B?UFRDUmo2Rmk2ZmlFMkRicGlVaThVRUlwUjFoVFJNMml1alV2dHZRUTBlVWxB?=
 =?utf-8?B?OEhEK1VvVXFodDVhNjFROWVWVFc0OC9JM25JWVU3bnhPcWtPTmo0ZkhHWVBC?=
 =?utf-8?B?Nm9XdXVIYks1WFZjZjVKNDkrZXhseVBoSENRajg5cGRma21lTmpneHNjMk1v?=
 =?utf-8?B?M1pacW45aW10MW5rS3QrMDJRQzVHV2w5bnZQcXJXWlFsU2hpSkV0THRRMkp1?=
 =?utf-8?B?YzFJOHhzdHJTVXhNTUkyaFAyQS9vV3JaRjBqYzNKQXM4UHo3OGRNd1lxVzBJ?=
 =?utf-8?B?RGluVGQ1MlUzNHkyODMyZk9GZ1UzL1lQbVBXN2pyMzR5UlpuSGlSSHVNaDhX?=
 =?utf-8?B?V1V0TXVWZUNUVVZTcE42WFE1RzZmeE1INEpiYWxqUU1kSlEwTWhYaGJYbTJZ?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2263941-41ea-4d27-b362-08daa5f2f6fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:26:57.2126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoEh69yZ4xHl+qAHXZPkagREM7CHRT8HEu5sjq8ivUCi/F2KdSjpLY5IGiZane8XpxxtFNDIaS8Hg6LNBy8cXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5448

On Tue, Oct 04, 2022 at 12:13:49PM +0200, Jan Beulich wrote:
> As it turns out populate_memnodemap() so far "relied" on
> extract_lsb_from_nodes() setting memnodemapsize one too high in edge
> cases. Correct the issue there as well, by changing "epdx" to be an
> inclusive PDX and adjusting the respective relational operators.
> 
> While there also limit the scope of both related variables.
> 
> Fixes: b1f4b45d02ca ("x86/NUMA: correct off-by-1 in node map size calculation")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

