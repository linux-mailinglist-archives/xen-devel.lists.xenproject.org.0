Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2B514582
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317073.536249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN3r-0006Fm-6Y; Fri, 29 Apr 2022 09:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317073.536249; Fri, 29 Apr 2022 09:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN3r-0006D0-1n; Fri, 29 Apr 2022 09:37:15 +0000
Received: by outflank-mailman (input) for mailman id 317073;
 Fri, 29 Apr 2022 09:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkN3p-0005tt-Vq
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:37:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed10e22e-c79f-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 11:37:04 +0200 (CEST)
Received: from mail-sn1anam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 05:37:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4825.namprd03.prod.outlook.com (2603:10b6:5:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 09:37:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 09:37:09 +0000
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
X-Inumbo-ID: ed10e22e-c79f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651225032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=TvmAqsUTGDPD43B73PPYjQV948fkcZfmfIipPMxthuY=;
  b=XCDm0mqG+YruCRLzS/ufAVnT/8Q30BZfomWsKJRW2zsM//iE5QrmguKh
   LlLIEEnjwaGFUE76Wl+XGxvL+BGhrHEKO74bjlCp4gwXprGNniI1dqyrF
   k1RUNsNMN673v2/z/5lrkwfVBbwpZhlPQ6fxp3vcXgH+YalWVr5aBba28
   Q=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 70238449
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KHuZ46Kje+VUgiYoFE+RzZQlxSXFcZb7ZxGr2PjKsXjdYENS1D1Rn
 WBODDjUbPaKMzD8c9x2b9/g9kMEsJPRn4JjHAZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3tQ52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NlA5JLhDkQIBIySxrQiDyRaQg9SIJQTrdcrIVDn2SCS52vvViO2hs5IVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM+FH/miCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iOkI2EE+Tp5o4I7xDP24RQs9IP/OYrzQN2ARcZ+lFqh8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHslhwBX9tdFcUq5QfLzbDbiy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbQGDq5WQQHOZs6yS9Dq0MC1Nd2saP3dYEU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv207gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:VzXUkK0S3R65vHD6tNsk7AqjBTtyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8O3WBxB8bYYOCCggeVxe5ZnO/fKlHbexEWs9QtrJ
 uIEJIOd+EYc2IK6voSiTPQe7hA/DDEytHRuQ639QYQcegAUdAE0+4WMHf5LqUgLzM2eKbRWa
 DsrvZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolCs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REIGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUETA9OL8y7qvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wM9HdwGOt15Dt
 //Q9VVfYF1P7ErhJ1GdZc8qLOMewrwqDL3QRSvyAfcZeg600ykke+E3JwFoMeXRbcv8Lwe3L
 z8bXIwjx9GR6upM7zC4KF2
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="70238449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6AZhgU6YyzcKRZs+OGU9iRXWeJPhkxyTdMjGfAzcV3x+O1ZXxV1kvRw0pZsc3gmOu3hGfSq7s5WBfmS7K8wX/aKw+LJUEli6l+7ZJ1okzUAAOXH9zd7rzdtEg7/J50JUtP5oJdL6I1E3Qzr+TDPdQj0KAve49BrX982PKarySkp1k6coNMEmnBmDAthRECaAzfA6bbSccTqEj0JneFrNBbVufr3BEd6YTAMdWXbqDqgxThpHxZskdn4VIWWaRpqFAmNp58iIAhsNtq/e8S3RJ4zCeyH60CNEEeiIvob6o/8LL8BbQKiCIKsnQzXx4oqvaaYkfq+jvZ8vf0uj1axpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym6N3M5LNo8FbySG9wQ5XDzt5zU2d2LaWp3GmRtJ71I=;
 b=DtaiZDXcmZJRN72T90Cwlx6QPaLXuYIwKkOHpuVjQUIN/R+GE97PvOt8VYcvBlBeR7VS7e8sgo7ZLrB0vvn+4zisGW3vxQ/VddpZmZxRbj0uy5rdgJjBJzvsLcpsshLw6FJoNJd4t2aALG7D4J+RaTH0IIRHkDpgwBfTJw8xeBa57W4qfasmu90Host2swV+/deNSSJTbXtQeB54NnWn4/ZGQ2+mOb3fLLkcAtez22iVobKkTusCgbZE8lRndyWuiztXwEQSkO1+uSxoGOYtP8wM3cqvh+G+lPGzlwBhh2oa+XPUZwO29hqb5Z02/CEZIl12efm17Cx4dIDVrX64yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym6N3M5LNo8FbySG9wQ5XDzt5zU2d2LaWp3GmRtJ71I=;
 b=c/ED5V8nC1aRxjjey5JgtBtfZF8AfwlzIX7buUADnGXT6zJ/Q0Gnvlon/yCup77V7gtdbhnfzesrHQLvnVVN1W1pcLFxE55hNKyY3tbp6RfcJNa+gCexzyMw+P6HQ9qFVC127pJMPuCL9bmV7RTkKe+/wPY8s+fsi0GyU2sQiyw=
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
Subject: [PATCH 2/2] linker/lld: do not generate quoted section names
Date: Fri, 29 Apr 2022 11:36:44 +0200
Message-Id: <20220429093644.99574-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429093644.99574-1-roger.pau@citrix.com>
References: <20220429093644.99574-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::10)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a660e286-a746-4674-7e81-08da29c3d4b7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4825:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB482504A9075E17B216DFBC398FFC9@DM6PR03MB4825.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t7U7xp2AOme4nHG1QWw7SdMZgr/4CR0kFhhBmJPFD3ukq/ouuOhW6gJSC2s+AkxEOEZnzD44AItvW/WVOQcIArUFWe2qrdZPTNlS2vWCH6J3ZIbst6uqlAAS+9h5ToIi3oH/situsS3C1X7jRFemCp9TQ2kCKwGdlEquQK6igFz6qqsr8pc6fI3JLfj1gnzZF1/BCbpZp8NV7QxxL4PupJYb15hJz+M9H1h+q+aZOJdg4ql25S+hk6lsFrHuO066jYNmjApmdZ2XyIOUCzQEgOIexmHRmww27FFxqGV0P++jcJSBDTCBXp4uUrR7m8jVCH7+At3Q8AvEfUoUJi38V/fSUTJn72fZQ0zrQRbqf2N7WkrAl7FTjLWoZ7amDgHSV4nDmhLSlfspcpnw69KNLOizFjH2hvSTOcpyDLVu3F63shTtYyEIEg1B691O4gK7lJ3Zet9giONsNOhFr/v1DpNHlbBXJ5Z46+kij4bZkSExptDvv7FOsTWGnuB7DVwux/+ApsPUUNzgyoYcQVFlfNmLOQecLjY8S+bcicWK1MYYmTSt4Q5HjHxZpDO9IPszi2Py6s9APUXeaFh37OymcWtAomFx18xBsRoPLklVrW+RYvsh622juBtyM4NX0q2t6fsRGyOW+jjEaTPPXAB/tCEgZ2ArnRU3XqkdndexFW/YAQ7POPmN+MD9RHcQhYKfNfsZCGC06jPGdiZ10K2fZlb6DWNBnOpPs36P4K5HTNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6916009)(508600001)(8936002)(36756003)(66476007)(4326008)(8676002)(66946007)(316002)(82960400001)(54906003)(66556008)(26005)(2616005)(6512007)(6666004)(2906002)(1076003)(6506007)(966005)(6486002)(186003)(83380400001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEhJSUxUV01rVnRTcXAvYzVzejUvODRSRFUwdFZPUzBJS05PTndtcUswSTNQ?=
 =?utf-8?B?Q2hGejhIL3hqTHQ1UThaM1ZQSW84K3l0bjREKzJNRGY5VCtlaS9PVzBjK2p3?=
 =?utf-8?B?R2IyWk10Nm9XZ0xYZHZUNk45ZSt2cStVNkpSNWNOQXNkODlPMm50aFRWT0xE?=
 =?utf-8?B?N2ZNa1p6SmVqTXFsbUF1NFZSb1FYSURDeU5ZTzFVOXNPcGU2b2E1RGxzZm81?=
 =?utf-8?B?Y05wYTh5bDVaV294QXEyNnlkVHBuQTFjNmdPSFllRm9xdnFWR3gvQWlramhE?=
 =?utf-8?B?eVVVWi9FZ3RwM0s1bjM2SUgvU3JBMzdqMGVZdUg2OU1QVmhTR2xaMjlTRG5J?=
 =?utf-8?B?azhDY3RmNjRTY3pBdEtWTEMvVlBIU0ViR3BzYWFKdzhOTXpicjFKMTVqcmpo?=
 =?utf-8?B?TVlHTjRRSE92SkNmTW05YkFHTnNNajZLV0tUb0dJc1VOUHE5MEpzeFFTYVNr?=
 =?utf-8?B?ZGZGYkhpZnhQVUhvMUQ4YVljSjJOWldxZGZudmF0YVE3TEFjdkhWS0s5ZGJN?=
 =?utf-8?B?U0JYZVhmSEtIT1NVM3luQXBielJGdEJNU1h0bG9vcW05V3JlN1VoWDJ0L0ZB?=
 =?utf-8?B?SjhBeFlQQUR6RldHU2tUc3JITkNtSWYwWWs2QytZTGhzRE5wWWNzOEtEZGJp?=
 =?utf-8?B?NVovOUkvS0FrK0ZNdGcwUDF1aHp0WUh1MGpzM1g2YWNIb25ZVlBRUG5zQ3Rj?=
 =?utf-8?B?cHdFTUZDMmJ6YW9hOG9tdE9NdlBIaHBwRVpNVXhhMnlzdkhObkhIWFQ3dWpr?=
 =?utf-8?B?UU5oaCtEM1M3ZTZWOFhXbytKeDFZRmNncTY4S2UvcUFtNlkxSy9hOExPVHo2?=
 =?utf-8?B?WTB0Sm9lYmgxYTNJcWNMdXAwOWpYS0pWMVZobDNKc0Y2QWpRUjRQbWNPQTVG?=
 =?utf-8?B?eldLQzArdW52M2hWTHFsWTJIYm1jSytRVzlWSHlEOTExVnhrQ3RWU3k3d21O?=
 =?utf-8?B?Y1laeUVDdmpuVmNTSkxORXhLcHBMN1hLdkNncVdYZUZ3QkFtYlpZR20xS0dh?=
 =?utf-8?B?Um0yNFIxQzdSemY5VHBlU2p3Tmp1THYxS2Njam5lRGplRUlNTHZmeUJoMGd0?=
 =?utf-8?B?Vk0yMk92NTBCazI3NlB3YVIzYm02cEJnNTNVVjhkOVg1STVxZkdOTEFvYUFZ?=
 =?utf-8?B?QkxPbkVxSWh6dmhiN1FPZFk2UGdrNndtZFdEREdIWW1rcHZuejBTTk83MVZj?=
 =?utf-8?B?L3pzRTBONVY4bno3RXh4bVV1bldCYmYreU0wa3pPU1gyWHA5TVJ6N1JRcklQ?=
 =?utf-8?B?clBYVGs4eTg2YzVPcDNhTk91NTBGK3I1MysvVXNuTUtoR2NMY0Y3NWhRZ1lr?=
 =?utf-8?B?aUxyR2FMYUVaV3VNMDY5dDR6RHc2NDlWUyswMXV4bjFRcjd3QW9HU3o2UnBQ?=
 =?utf-8?B?ZGdCN05NdWtDY0dWUXllRzZEbmVjd0E4aTQvK1I4dXpIWlJ6bzZlYVBXdXBY?=
 =?utf-8?B?MFRpdDBiaWZ5cGYzTnN1elRHMXUyU1lXTlhLenE5MGM4RjFqWWdpTlR0MkUv?=
 =?utf-8?B?eW9Yb1VrMEk5cmJtSDVYcVZRYU9BTWlIVWYxOUJWYm02NmdyT2FWSVFXQmpV?=
 =?utf-8?B?c01yM3htWDNxU0V1OWtheUJEcUNFbXRVcDdVODRaMU1VUThDZHVlQ2ptZWFk?=
 =?utf-8?B?VjU3cGJrL09KQ3lLZFRtZGtmZHMxTThoNFlYbTYzeEJpaU1jUk1pempQVlRv?=
 =?utf-8?B?UE5zQzhoOW1MVUp1dzRvd3dMUlVSY2FzM0xBbXFlcGFYYjQ1R2NpYzlNWjla?=
 =?utf-8?B?Uzc0TTFzSHo4Tmd6UDU4UGgzMGZrR3hOWnJ0V0J5ZHZVSE4vbmE4YkJjSzZ0?=
 =?utf-8?B?ejRiUFRralI0ZStzSUo2MXF0cm5ibXg3bFU3UERMWXh2ZGFWNlJrK3pWVmpm?=
 =?utf-8?B?bUdFTG1SZmxyL3Jva0F6UGlqN3RPeTJNdWx3bXFvZTJsNE5ISkZkZ2xESzd3?=
 =?utf-8?B?d0RZeUNmak8ramxKMTRlYkpoS2R5R3gwZHBpVnRWUkdJb21KOU9Nd3lXSjgy?=
 =?utf-8?B?WHZOZ3A1NUNvb29TREs0bDRsOFlya1FMSCtuRXFuOWlNbGdDQWxlZXFhWW5B?=
 =?utf-8?B?S3ljRHNWT3dZU0pyZllvaFFYVkpzaTlxMnMvRjQ2UmYvU1dMdVFONkVndU0x?=
 =?utf-8?B?L2VPT25PaUVjeEc5eFY2b3NoeWhKM2ZDTlgwYmN3SFFlTHhCZDFENzVXYjBr?=
 =?utf-8?B?czdwL2dsVTBidjdlYndEdmxMb04xZUkremtFSFJOc0hpMHVOaXBGS1Y2RzU4?=
 =?utf-8?B?ZC95LzhhazJwL2JGWHQyTG83cFdPWmNYdjQ3YndOejJTTTQ3R1pzdjZBWWhn?=
 =?utf-8?B?UkJTTHpaYnUydmRxcU5MWGxod0dBZmk5a3Nkam9Pc2hvVGI1UXBSZUcvamdT?=
 =?utf-8?Q?tYIai0bZpDbusvvA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a660e286-a746-4674-7e81-08da29c3d4b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 09:37:09.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltEPECmoFMr/xXWpJpXTTgtz/enXC1V9E5eilleDZGBPYGuKQ6whCQ0/DeRfLzGQ186zJjgOdNpB+Le1kpo75A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4825

LLVM LD doesn't strip the quotes from the section names, and so the
resulting binary ends up with section names like:

  [ 1] ".text"           PROGBITS         ffff82d040200000  00008000
       000000000018cbc1  0000000000000000  AX       0     0     4096

This confuses some tools (like gdb) and prevents proper parsing of the
binary.

The issue has already been reported and is being fixed in LLD.  In
order to workaround this issue and keep the GNU ld support define
different DECL_SECTION macros depending on the used ld
implementation.

Drop the quotes from the definitions of the debug sections in
DECL_DEBUG{2}, as those quotes are not required for GNU ld either.

Fixes: 6254920587c3 ('x86: quote section names when defining them in linker script')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Reference to the patch for LLD:
https://reviews.llvm.org/D124266
---
 xen/arch/x86/xen.lds.S    | 6 +++++-
 xen/include/xen/xen.lds.h | 8 ++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 6e4abbc1ce..d94915ea7d 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -20,7 +20,11 @@ ENTRY(efi_start)
 #else /* !EFI */
 
 #define FORMAT "elf64-x86-64"
-#define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
+#ifdef CONFIG_LD_IS_GNU
+# define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
+#else
+# define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
+#endif
 
 ENTRY(start_pa)
 
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index fc47bb1ccc..06b7110837 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -18,11 +18,11 @@
  * for PE output, in order to record that we'd prefer these sections to not
  * be loaded into memory.
  */
-#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
-#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
+#define DECL_DEBUG(x, a) x ALIGN(a) (NOLOAD) : { *(x) }
+#define DECL_DEBUG2(x, y, a) x ALIGN(a) (NOLOAD) : { *(x) *(y) }
 #else
-#define DECL_DEBUG(x, a) #x 0 : { *(x) }
-#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
+#define DECL_DEBUG(x, a) x 0 : { *(x) }
+#define DECL_DEBUG2(x, y, a) x 0 : { *(x) *(y) }
 #endif
 
 /*
-- 
2.35.1


