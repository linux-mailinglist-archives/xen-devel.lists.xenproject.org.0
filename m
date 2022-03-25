Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F84E6FB8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 10:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294611.501000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXfoE-0001jJ-0S; Fri, 25 Mar 2022 09:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294611.501000; Fri, 25 Mar 2022 09:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXfoD-0001fr-S8; Fri, 25 Mar 2022 09:00:37 +0000
Received: by outflank-mailman (input) for mailman id 294611;
 Fri, 25 Mar 2022 09:00:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r7I=UE=citrix.com=prvs=076f4df05=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXfoC-0001fS-L7
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 09:00:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068186c9-ac1a-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 10:00:34 +0100 (CET)
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
X-Inumbo-ID: 068186c9-ac1a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648198834;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KGJcgsO64qsJJFKMoggAA1zxd+7HBN+K1Dlma3MYnaA=;
  b=B0eHUrKCt4dNZQ4Z/MnT0HVkZnxeNNy68lBoGRkJm5YkTBD7L2Q3cXp5
   ozqwU/p91+oE43RIXJnAJRP0ar3YlQ/6IP2sOuxjbBNdtwMS+6j8KNjeE
   EhT+EtwYz3Oa8SnLH5gG3he0Y1Eu4f6Bw4Nc8YsEPKUVPodGbHG5GSwDW
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66595512
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iaaNkasQ/KVgICxjOB1OmSBBWufnVGNeMUV32f8akzHdYApBsoF/q
 tZmKTqPOPiKYTTzeN0kPtyx909V7MPSm943Hgc++HwzFS8Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX5
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8LH4jPmbhAWCJCAhtMOapM4eDZC0iG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ZdINGc2NnwsZTVdMVkOFMI4nNy5n1jkQTpmhmKPiZc4tj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6EbSi8/dwjV67x2oNCQYXX1+2vfm4jEGlX9tVb
 UcT/0IGoaU39WSqSMf8RByypHOYvh8aVMFUGud84waIopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvLJBlsseHIQkmH542mqTS4IHcLB187MHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT838JrmXFF5mLJ9w43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8RY24C62KP4EUOfCdkTNrGgk3NCZ8OEi3zSARfVwXY
 8/HIa5A815EYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt9JN0/w/UEzLugE
 7PUchYw9WcTTEbvcG2iQntidKnuTdB4q3c6NjYrJlGmxz4oZoPH0UvVX8ZfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:fDbUqqoYiVMt1RjVzoiU9SAaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="66595512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iK1GwwhO/UKgn0nUAsj26HnJzHzeALcyLbdxw289KtsM+hJkeJW0I9RzGlQzqmTKBpdTSg6ruibcxMpIy/fSXjrJ8PPuk9hcrBtD8iZwPJ9nlHmaGZVrU5LiGEMC/iVLJEzxGAdNb0t4TQCJ2HX1g8fcwDsvtcXwS3OaHkLgmw7Kl8JmdB5m0uxmUPFyOFlhMXsZp+a5sKzWVTPBEC0tYU0OgndhYjFny0s3yDgGDxypDVfHYBbpmqbscEfL4SWPMpVsNmZY91sOeYmgulX3xSUssdrtR+C+ojvL2eD2OHFOkGdnXs8GPH2ok7miXKYCFeMmbuSoHgMfeMxiOCeFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkH/P3RPwONYcKuAq9AFwoAhMwpiA/9LWO+la21VbTo=;
 b=Yc9ykyctkQBvvufxJ7n0P6aQkQSNMPgIubAA2Q37eF28aUTHMbdH2ujq0n/QyRGDAu+TwUV2qmdxfPpC697aOSPRHCtXVvovKse4p2QJNDSQJUE6qHdo+3BCPhVw2k5QomDDGlNL/5JgVjSmcphTIScX+2s2z89FauBuwj5Wpuk2bLat5tp4LREftKBRqpz2pGlG5yxiML6ZSMhl990TbGR4ZNKHrJ5K9X92dUQKgY6Iy35GM1jq1K9yYIzjOgJjk+GhmFkbqyRKl0w5JlKHbJUXuH8MBv62IfV9AfMlbOIq0TBZ8nCZon6IvpmwQri7XKmVzLfTmkbGuPuvBP2LUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkH/P3RPwONYcKuAq9AFwoAhMwpiA/9LWO+la21VbTo=;
 b=MthAOMVPGete7QvQCbgc7vKO0qjYzDhKAPd84po0K/0z9vq2z7Hh0WVe0L3E3iK1ZYtFwOeUojbCJDoS63ROvOrvSwsJQ4za3Y5eIwIYSmi4w3DmJ3zU++c1LKGEVh27OYpibMM3V72BPtzP50Yj2EfdQuVF1qtSktehZuPdJYs=
Date: Fri, 25 Mar 2022 10:00:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
Subject: Re: Support status of OpenBSD frontend drivers
Message-ID: <Yj2EpXuND9EOI3GA@Air-de-Roger>
References: <Yjx4kNv7hG4FGGot@itl-email> <Yjx8G5tH4Xf8+oVx@Air-de-Roger>
 <f101f6f6-d6d3-4877-20a4-ebae0130c756@invisiblethingslab.com>
 <Yjzu0Zz8HCu/9mFg@mail-itl>
 <5e090f73-3a44-04a4-3668-da9c3dcd2fb9@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e090f73-3a44-04a4-3668-da9c3dcd2fb9@invisiblethingslab.com>
X-ClientProxiedBy: MR2P264CA0175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::14)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8da24480-23d5-4336-3d24-08da0e3de79c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5218:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB52186C43B69591C7EE54E15C8F1A9@BY5PR03MB5218.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39vyZ5nhp3XhscZe/a6apFsIPNO5BBV6TymvQQZEp8iPlNvGQLksq2SMuylBUtUDk1QdhDpRk4XNomdpKq59wNHtVDA9aH4byfascZd36Kxfh2dfJLVwSqtsjmpmJi55QjvcfStlOYog01FOAAT6TWfKUz04W/UC9alXBgrv8dt0th8VzZAkjLGrhNPZymtF6k23h1Hc9W15ivRECMiKGLJW2n/zeuqHgs6P5CCetkBza+Tp507jEiTGlRieCvPrXCST2uP4DqnMk7hh7TZMTlpJ2TNZYec0n0vX6RkPzceGag6N7WUNQPGjSIIs0XKU9iB1HZLpAI+VzPX6cVqs2K757A6J6BIi3BdytLsOK2+50Q2en398lcEBkF2XNRNoC+plzs2wR0YgEkjA4TWXyaIqOrzcC2lnSWA5MaI1cvSk04Ien7qGbHrsmoCJaOToLX7w6DJgGUuh3keqFG9/yf8/W8kht8ugFr3cHZJUdZNvS5MZ0E2xSrmvG/VNxJh710sWAB2Rpui9VloG7w5hH8l2IZ2bDAzFhSIZ1eNZdh4uubXjjCclWo3HeP1GhyVg/wI6ycCD9Tj6iDJy0Ac5SO1w7R9XM6z+KFBaHiMzzFv+IK9kv1p2G1U2+GPwfppxyW8cLf26lP7MEG8mYcEC56xEI8ISQ4wg7ApNrwgebectQq+6xbmNob2Q5DGyj3X46+aw0PtvXegQlZg4nSzfQyIGbIzmlUGCptMs7Xjs5VY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(83380400001)(6916009)(6512007)(54906003)(9686003)(8936002)(82960400001)(85182001)(5660300002)(2906002)(66476007)(66556008)(38100700002)(4326008)(66946007)(53546011)(316002)(8676002)(186003)(66574015)(26005)(86362001)(6666004)(33716001)(6506007)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDY0UmJySU9OOGdSbGxEZDN3Ti9VUU5LWWREalBVc1k0Zi8rU0NHRUczeGVi?=
 =?utf-8?B?RG0vZ2REWFJwYTdEcmgvNlJtcHhxWldjcSsxWXhKTGhiaTZyOXBDeFdFZTdY?=
 =?utf-8?B?WmRXUUlHVGdDc0grZkZyQVg3eVIyTnRVZ3JRMFdqeWZ6SndKYXBjTzUxSlJR?=
 =?utf-8?B?eXVBb1JlcGVPRkR2cm1aOWpyQzY3cG5tYTkyRTIxQ3owc0x1QWRTYkozNm1G?=
 =?utf-8?B?NlpueFFHKzN5WFF1MXA0NHE5V0M5d0kzbnpnN2l2Ry9PS0cvS1VDcTByTnZM?=
 =?utf-8?B?VnpQNTlpWWxhbHl6aHpGU0p1aUNQVXBnRDU0Qyt3OHQrUUNnYS9SRk1vMENs?=
 =?utf-8?B?TTdVdVNOMnpQenRVUXRqbjRkQnpxeEFCckFJa2VnSVdxcTB5ZXlROFArbkNF?=
 =?utf-8?B?aXVlMzFJVkdkeWRQcEs1cTF2bzVtUDlUMFZhQnVicHRlU1o3Um95Yk43eVlZ?=
 =?utf-8?B?dUJGMFROZDQ1SDQwTHVGaVVxZUR6K0JoMUNvUFFsLzNFMXJDNUJoOS9YRzVR?=
 =?utf-8?B?dDMxcjZ0aGtTS1FUNlR0MDNTWGNYTWcrVmlpYWw4SEFITE1mbHhrcXJ1dFJp?=
 =?utf-8?B?QSt4Q2ZObE9yNUoyckNtbHkrelRRY0krdW1QL1pROHNHSDh3elhZZ1FXMGN0?=
 =?utf-8?B?VU9uVnRPam9jNkRUWUxwRW9wL3FmYXpFNC9iR014SEZXZTFFNkoyVytFMStp?=
 =?utf-8?B?R0FKTEJGVEtZcWIybGZlTk9lLzZKNDBHVlNEcUtKS1NQTk9uYlIvRzR5bldw?=
 =?utf-8?B?Q3VKbEZ1MmRZZ3NieGdDZkdQYi9mOCtpU3NMZWM4QlBWWFVXYTVpQTBHNkFn?=
 =?utf-8?B?czVzOStidEgrYUhlZEhNckYvTkxvL08yUWtleXFnQTNBSW1NZmUrcmY4WWVX?=
 =?utf-8?B?ME9jdmtlQTQ4enNyVm1qbWJvWW9FTHR2R2JVVDh5a2IySEMvTlI0WDFhV2Fm?=
 =?utf-8?B?emU2TDdhc2xEMkdFVEdIWWpxS1pXVjFtbWZoYjFQMTlaMWdNbVJ0bWpoK0tQ?=
 =?utf-8?B?N3pCa3NHVGJRZElURUdscUZEMnBDSU83cVZ3cE9JRmNTZ05mdW9VZzJYd3l2?=
 =?utf-8?B?VWdoOE5aR1M0T3I4dy9rQ0lDSDkrRWZqWHB5NE9Fd3cvcnhZQU9CZjltNS80?=
 =?utf-8?B?d0dTYWVnWkdVV3ZOYTBaWW9ZQzA2V3QreGdwSExlQzlERE5iUkdUNFQrLzJq?=
 =?utf-8?B?WDhNeEdMLzA3SGpseDZUajZ6MUpjbmRpNXlpQnA4a0xOZzBYZ3dKN3Z6cjgv?=
 =?utf-8?B?aytjdi90RkozblFIaS9PaVllS0ZyV05PRXkxS2hLY29aSDJNbjRwSWI3WTd1?=
 =?utf-8?B?Umh5bytGQzZOSHVWelgwVEpFbHA0L0trZ1Y0d3hseG5MalAvYmdEd2FRSUdT?=
 =?utf-8?B?KzQyUjRZZ29iQXI0eTVMNmZabEN1MDlMZUxkS21yK1dTQ1ljMXR0WkhqbUNL?=
 =?utf-8?B?U1NEUWdyODVwK3ZZRVJpdnpnRWpEMzBzcllQdk5mSTdCMi9PVUhPTFZzL2FQ?=
 =?utf-8?B?ZkxsZ2dSbHVPVHV2WUEyNW5WdEtXWG9RK05pZm8vUlpSTW5vUG4wTzBJdThv?=
 =?utf-8?B?U08xVkpRcjhhK0pYQldxdnJRS0V4ZU4wMjU2VGZNa0p2bzRMMWQ3bzc0VExk?=
 =?utf-8?B?TGpFWlhBZnZjd25sZGwyUDN5dTBraWpHSndvcXVNRzFPRjJla2tUaitTQWE0?=
 =?utf-8?B?K1puRFFnMHBsWmdlaTdWRFVvMjFLUzNsQkdEaDIyRTZpVXRhRDcvSjNNZW9L?=
 =?utf-8?B?NlV5dTE2a0krQU1oeFZuTHpUWkd1dFVBM1MrTnRrWHNKdWFFMnpiajREUkM2?=
 =?utf-8?B?RUpCZTQxeXFnUzAxQnFEUUdWcW1OUW4wclNwZlIyci9YOUdEeUsvUVRnby9a?=
 =?utf-8?B?ZlpOZGh1aUxXeTRTM1lBK1NJUjVMYVBMRlZ6UFlKL1dwOTlxSmN0RVFIdmN5?=
 =?utf-8?B?ei9wTjZzWEFUNGJuamEzdGdhcXI5Yk1XUkFHM0dtN2w1bVJhRFp3SkpzbGFr?=
 =?utf-8?B?WjUzcVMrZzBjL0dydHhGRVl0TkhRQTBGL3hRbzZLcmMrSEJCL3JhMktPYVI3?=
 =?utf-8?B?YWhVMmtKUUFqdmdBRUQ5VndSUlQ3SGM0dWZLRUlPNUEvajZxWVFPVlZlNlNT?=
 =?utf-8?B?YnJFcEF5dFRUT004UkdQelc4WXpKOWE5Z2FUTnJIekZQNzZlUktDZk90d3ph?=
 =?utf-8?B?cWNyb1dsWmFQam5QZDBWbGpueGsyczZPa0dlN01PR2N6dlc1Q3hyeVJodUMr?=
 =?utf-8?B?a0xlK1pqNXhJaThCeWFsVUZUMW96R3BMaDhtM3QzRVBuVEtkQ0FKSXZCSnpz?=
 =?utf-8?B?QlJ0SDBURXNlaHpSK0dhdzNPaVZDRmp4cXhNalIxM3pGUFRMbEVsWmt2cm85?=
 =?utf-8?Q?ZN9gSo1jMx18LOK8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da24480-23d5-4336-3d24-08da0e3de79c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 09:00:26.9010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CDO5iGS7f4sQOjcKO4E7XERIcvCtEiVWJ9+uiDYleh03mAgJVsvt//s0snrXa8Sx2ASvSJ0bHBrW6FHd920Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5218
X-OriginatorOrg: citrix.com

On Thu, Mar 24, 2022 at 09:10:57PM -0400, Demi Marie Obenour wrote:
> On 3/24/22 18:21, Marek Marczykowski-Górecki wrote:
> > On Thu, Mar 24, 2022 at 11:49:14AM -0400, Demi Marie Obenour wrote:
> >> On 3/24/22 10:11, Roger Pau Monné wrote:
> >>> On Thu, Mar 24, 2022 at 09:56:29AM -0400, Demi Marie Obenour wrote:
> >>>> As per private discussion with Theo de Raadt, OpenBSD does not consider
> >>>> bugs in its xnf(4) that allow a backend to cause mischief to be security
> >>>> issues.  I believe the same applies to its xbf(4).  Should the support
> >>>> document be updated?
> >>>
> >>> I think that's already reflected in the support document:
> >>>
> >>> 'Status, OpenBSD: Supported, Security support external'
> >>>
> >>> Since the security support is external it's my understanding OpenBSD
> >>> security team gets to decide what's a security issue and what is not.
> >>>
> >>> That however creates differences in the level of support offered by
> >>> the different OSes, but I think that's unavoidable. It's also hard to
> >>> track the status here because those are external components in
> >>> separate code bases.
> >>>
> >>> Could be added as a mention together with the Windows note about
> >>> frontends trusting backends, but then I would fear this is likely to
> >>> get out of sync if OpenBSD ever changes their frontends to support
> >>> untrusted backends (even if not considered as a security issue).
> >>
> >> As a Qubes OS developer, I still think this is useful information and
> >> should be documented.  For instance, if I choose to add proper OpenBSD
> >> guest support to Qubes OS (as opposed to the current “you can run
> >> anything in an HVM” situation), I might decide to have OpenBSD
> >> guests use devices emulated by a Linux-based stubdomain, since the
> >> stubdomain’s netfront and blkfront drivers *are* security-supported
> >> against malicious backends.  I might also choose to have a warning in
> >> the GUI when switching the NetVM of an OpenBSD guest to something other
> >> than the empty string (meaning no network access) or the (normally
> >> fairly trusted) sys-firewall or sys-whonix qubes.
> > 
> > I'm with Roger on this - when security support is external, such
> > information in xen.git could easily become stale. If anything, there
> > could be a link to OpenBSD security status info, maintained by whoever
> > such support provides.
> 
> This ought to be on https://man.openbsd.org/xnf.4 and
> https://man.openbsd.org/xbf.4, but it is not.  Should I send a patch?

You should discuss with the OpenBSD people I think, I really have no
idea where those limitations should be listed. Introducing a man page
'Caveats' or 'Limitations' sections would seem suitable to me, but
it's ultimately up to them.

Thanks, Roger.

