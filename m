Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32CB49B6C3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260404.449840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN95-0004iU-Bm; Tue, 25 Jan 2022 14:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260404.449840; Tue, 25 Jan 2022 14:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN95-0004dr-5X; Tue, 25 Jan 2022 14:50:07 +0000
Received: by outflank-mailman (input) for mailman id 260404;
 Tue, 25 Jan 2022 14:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN93-000334-9z
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb1e3bd5-7ded-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:49:23 +0100 (CET)
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
X-Inumbo-ID: fb1e3bd5-7ded-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=81GyJ6SBVfF8/Iszl7lMAfRV4C7DJHP49dSo/U9tyY4=;
  b=fJv6ZmG+MWH8kMVbdd7J95XL0wKSlSG2tGG0k2A8FUO3GWQtuPW35V9e
   zZfvTtx9/s4IBfI1rQAQzFYTYH+ojrCk9haMLBP96VCNSGeFsDFAaJE2D
   LNxvz+jkbjRzsqBzAiTaIIUgfo72/KiaeUlCiTFLy2cnHG3/CYDvYe7Oj
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lGswaDTrOzUqJ/gitSxeX9vl3brfo5e6QCjJSJtXgyF00sNOeRE1ExAeYEjP199SRvLRvbRHr/
 ZZ6lQp274vTfSOXpW1C1cvWMTnEw7Caw1qlg3tnrROTyfh0GoofZuSnOlC0jELcoXxdQYiWHAI
 GJnJz0QLC4dmbEyCHKFhFftL+cCp3OPiK4vyk+Icn0SujNzQEIdohy7ODT1C6bManzqxqe8qv6
 fh/OdQDMrYwZCEuhh6QyO1boYtbGyg+wWuJhyjTHuQQsxGIK9LQhz2f3VPx1uulgBOZoEt2z+q
 diVYsj4al1jfGMJ39nElqp7e
X-SBRS: 5.2
X-MesageID: 63124312
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Sbz3IaiGqjk6zEjm9R6dWqrmX161hhcKZh0ujC45NGQN5FlHY01je
 htvXDzQOfyPZWKnLtknb9ixpBsPvZ+Gm99nHAo9pSBjEiMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1sl8GSUlkMfZfdhfU2ECR/Nh5fD59vreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3ZkUQa2HP
 aL1bxJfZSzZYgJgE2wVJ8I7kcaroWulcR5h/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalj8+BvhLTch50hCQ24GX3iG8OUk2fBcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFAXpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2kidRg2bJdVIVcFh
 XM/XysLuPe/21PxNcdKj3+ZUZx2ncAM6/y7PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMtsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:UvEDDKmh0Dl32ONN5dEGQbTpyU7pDfO2imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICO4qTMiftWjdyReVxeRZjLcKrAeQYhEWmtQtsJ
 uINpIOcuEYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtxdBm9Ce3em+yZNNW977PQCZf
 6hDp0tnUvfRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIvrGyWdKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="63124312"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7XIzG7jAV6bSSF+C7LExhhE0AAmQ7FZNm3VTF0KYceySYhxdbrJ7XJejgMxP+hNj2u7Qige7j3QcQpfSzYxO3e4YsyZBwpup6pTRBLw/UkGRxRoGADfefSuy3fG8oCupz8BTb6FP90rGwymEosyFjnj/fiuE0J5KPikN0Rtb2qL/nDkPx7V4Pa5e7UNwKBh2MgUJvFgaRHgu3Wo1TNGCizRTYnJAFX93QhtyHQXe/uoAVSCrwBZeWgGWb/59VJ56dHzK0J2xpULd1FfkZTD1xXmDx2E4cljMSdY9vJU0UXhoGtRFTtJ4yIbNs+qRzQoDUB8lcCrIlWfC+LlTmKBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez/oVW1DjwTHDd85Kf8eG+4Th39TrmpNJNPDRxQAGHw=;
 b=lMl/AapL+T55kMMdIP2Y2eS2NBtDa/BS+gxfcF+Svd2NInX10gy74xe1WDJBg5J4FSkLpWPYu0S494QBMUTG1EQhtKyg3HGxuPU4x6UT+c/GRc+1RSVr7nJaeBmejYi1S1vdbh9SpH5ZtpNNcXBxiZqm2gMKQQtcD5WtJpNcS3G2PMl+kNFX/qB4emh4/nHUUnV77gGxskFn41H1xI+hFKzDYzOm59sgh63M/PZn7Qn6Gc8jI+RFx5KWMGwExIkfv0wFKjT6R2dhtNdmjTGXe+iwousMnUlYZYjj49Zhes3tTmuijIL/v5x/08iKcVmcLKPasyd7AArobsmNbLWPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez/oVW1DjwTHDd85Kf8eG+4Th39TrmpNJNPDRxQAGHw=;
 b=dA9jKBgXhUSXmdFOT3e+MG123USb3YHuoQzQj31zrOL+YotS4R9iByI8ChQdRTT8ngqlWUyW06m0Qta+IHs4lYw+wWT3cCEiSIHkhoMrOrcn6xGRaU8FRSwkA0Ime0HfnC0/AA+/ShYb8ExFIvKqsKWCbfJKsg4XRsf0hzIb0nc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [PATCH v7 03/11] libx86: introduce helper to fetch msr entry
Date: Tue, 25 Jan 2022 15:49:27 +0100
Message-ID: <20220125144935.44394-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55617b6e-304e-4841-ee19-08d9e011f551
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB456871EAB02C464AF099A9758F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCXdHCWs9thxwwxO2ipb5J0hw57wvBmOvj/IAy6wS8zw2ffQZeWefhtCnIwbW78sa0xwm1jfR95xSSPrbtxYpZV2pAnKem48gLZl6VKHBSaXCnJW3KZEVHL6FsBS2IrrQkEvAFwT2szeQZX/L44zo4woaXDUi21gow3Hc4AFF3fX+0g3U5UuLGCutI8z/b5R8tt9Sptsb4YiNg0y5i8dTH1Pa8IoGu6c55PemZehhg24NTwZ70w+jbdJ1CNW7c09ZspQuGFw4q/ORcYqpZQYbYWrTYXsFPB72tjl3yQtBawqL1x029PB2NWoR9hI1FHks9+GKcD4PN1VCRdbQNgXHy2CD7GO1dQxE3d67zDQixbwlz6lCS7XXj6i/tM28U/sKtd2CePOGfDeIUGKEQPqPGfK/QDBdL2u3IfS1OED2LNn943B4Y6loFjUZE8N/mxD/+aI2Y0YDcihlhwgDwmySjwDyVhA5c48RWtmIdrczbJwmYPAfq1XWvw8bMQDiXHYHOpY70rhZuTVIfK+PMA22aPdGjbmoTXwRZG8Vj5qB+ebvZuEBZ0Op5sNsnZoB1ZlZOcpdJUI/pPf9l+Ubu+XojGDKJPJWqOdoK2qcNevbiSN4v7Wk6i1/Iv99JwCalAEbMIVBxXu4RWuXXTP9lCnXD2mfoLQxtZb9+6X+G0t8eFlZ8kzlcXiZAB1dqySDzj8ENXxqCvmS78UQlAFZNaiEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(107886003)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW81SzJ6WjFFYVJKc2M3blZpTWVCQ3FSdUxoS0R4MGpPSnpFUGw0Ui9XRHV0?=
 =?utf-8?B?RlF4U1dER0VrSlVkUGNSUkgwVGgwd1dIWEZRdDhwUTcwYXNNTUp1Ujg1dzcw?=
 =?utf-8?B?UFdLOWRXMUo4S2JmYzI5blhQdkZZbVFDRlh4QUkwR3FLRnNSWTBSd3lHWEgv?=
 =?utf-8?B?RlNIZ3g0VzJCNWJBRitCNFc0UnZ1dGFBMlZsVENmSHNSd0p2SmRONmJ0dDJm?=
 =?utf-8?B?QVVKb2lQTlBNOUJiMDdNSmZtdnNxOStpL0RxUXBhNjNYcml1aVBHWVNMVjlk?=
 =?utf-8?B?UzA0NXBmT3RhY1JQa0dmZXB0a0tzbVV4RStXR2FLYW1SMUdPa1ljd1BKNUhw?=
 =?utf-8?B?WTFLUnB4NzZreExKMkgyYmtTeTVxQnNNc0NmeXBFMS9BQ3QxS1VFSEZOSFZ2?=
 =?utf-8?B?U2RsWjhkVG9nUXhBeW10K05Qc2QrOXEzeUFmZHFpQ3U5MVphQy91c1VxM0Nl?=
 =?utf-8?B?ZWc0Y2ZZNHZQTXlqNmFCYzhnVWk2bVgrR2diVGU3cjhoZVN6RVNGNDY5b2Zk?=
 =?utf-8?B?dndXa2NPYWJzVVQweVZjd3RjSUdOOUppOWZnT3Q0UGJJSEgxRG5qYUo1aGhE?=
 =?utf-8?B?WWlKZUI3UlJJMGpSWnlPaW5uLzVJOTRqUzVLOVVibEZFbkpRanE4Wkc5dEhC?=
 =?utf-8?B?Qkk3R0k2UmRrZW02MXdvZXVjM2I5Q2JtckRpSVlrY25YOTNiajVIT09Da1g5?=
 =?utf-8?B?UE1hUy9wQ1lDWkpQUWtQODEvUi9lTkN5QW1LY3VnWUZxbXNUN0w5OUd6cnRy?=
 =?utf-8?B?WGxpcTVCTHNZaVFFbnNlei9LQlVhTXQwb09JYnRnVG1xMkVTVEx3UnR6NFU5?=
 =?utf-8?B?WWU4c3lQOWNLU3pMMkV4WWs0L0xtWDk5WDczc1N6Ym0zU1REZ1IxeXpIbE9I?=
 =?utf-8?B?RTVUUElLSC9tMGJTL2hTTlNJYXlLbDY4RVFTaHo1VGRrS2VLNkZnbXdsU21r?=
 =?utf-8?B?Uk5SL0hrVVltTjNaV0xwTitWVGFnS1NYbTM2cEVqQXpKZnpaRnF5MitFZHVr?=
 =?utf-8?B?VjZHMm40Y0l6VDFwcjRFNFlaR2s3TWYrLzIvaHZtSVNpNjZtR2QxOWNOVGY4?=
 =?utf-8?B?YWRhSjRRYzNHT3JpOEhNZmRDZE4yWkpoSFpsYituWW0rTE5VazlvV0xxTEhX?=
 =?utf-8?B?TFE5dk1UVHRYUUxTb3NydjdZeHUrYWZqUldVV24rb0NXY1ZmcnJRQzdtSGtu?=
 =?utf-8?B?UGlaV0dGZUdMVWVVdWNVY3Z5WDlTRGZiNGZTWDEwS2M1TUNmREJnZ0ZhSnVi?=
 =?utf-8?B?NVYzVElic3dDb2JRYmd0VC9jY0oxMzVCbWZZVVgzUWszVkpQRzRRcW8ybmRm?=
 =?utf-8?B?VExDSmx3UHUxc1lDdTlPMzQ3aEExc3lxSVJFNXJLbW1FMFptUm41Qks0WFNQ?=
 =?utf-8?B?bXlIc1owcVZsVWIyTnJCdG9tSGIrVEpTSTNjZlBwR25hZS9RM2V6Qnc1czJh?=
 =?utf-8?B?T2dacjhZSms2bEtjdE5IUWk1d1NndEJUL1RjdS9FTVRZK2krdTZDaDFreGRN?=
 =?utf-8?B?K0N0b2JFQzg4dHJTV1lKUFdXRTAwWVp4bDkzek8wdXZFL28rT1IvTXZndVlj?=
 =?utf-8?B?Mk9GMXRlNmFldjNtWFBwN21LSVozZGtOa3Npc2FiMVlzWmlKdFY5c1l6NE5Y?=
 =?utf-8?B?c214WFV1SUMwc0VIbEFmdGw5NFdxdlllblhkNG5nVUg2RGtvNnJHMG1wcTIx?=
 =?utf-8?B?OUlubndQMWQ0TWovdFoyVjNaeTFGbU42QUY5NjhzVGpqV0VXclBQbVZrV3ZU?=
 =?utf-8?B?M2RLY2FGdHBsMjVzczdMV21nTDBIMWVndXNHTVk5VzFBaDdmSjBQWE93K25n?=
 =?utf-8?B?S2cxU3lmVDE4eU0yWWxTZlg4WnNjenBPOENQbC9EQnpjcUI4V1E0N1dRdFBq?=
 =?utf-8?B?ZGRIVFZrWmhFbzJabXp0cUl4b2I0ZndQNGN3dGlRbzNZa2JvamVyQmdmQjBJ?=
 =?utf-8?B?SWZYRGpydGFuRDRFNDlONG1pWW92bVc5alY5Q3FaZy81NXdpRTBFcVUwMHBm?=
 =?utf-8?B?TjYrMkp5SWM3RDhPME5RS3pFSURQZlYzR0RvWFJNbDJqekgwZzBEUi9hZkgx?=
 =?utf-8?B?VWNXRGhlYWpLNm5XL3VDRUhuZy94Nlg2MmMyOE9QdUZGbmZ3a2ZmcFNsMm8x?=
 =?utf-8?B?L3IyYkp3ODlvNUx2WVpyaWhUL0RVR1IrdDJGaHhjSmJycVpzMnZsNkZIOXRk?=
 =?utf-8?Q?D4QCyI2wwSmtcPub9CPZDfE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55617b6e-304e-4841-ee19-08d9e011f551
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:49:58.5738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeutIA2RLTSpED3qjNjvG6JR8UczlGllJZnBMKLwP9aBUFgRIpwsxLdX0P/EJHpuIlSjkOZOGoMu+7kovZB0pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Use such helper in order to replace the code in
x86_msr_copy_from_buffer. Note the introduced helper should not be
directly called and instead x86_msr_get_entry should be used that will
properly deal with const and non-const inputs.

Note this requires making the raw fields uint64_t so that it can
accommodate the maximum size of MSRs values, and in turn removing the
truncation tests.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Rename _x86_msr_get_entry to x86_msr_get_entry_const.
 - Add newline before endif.

Changes since v3:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 48 +++++++++++++++++++-----
 xen/include/xen/lib/x86/msr.h            | 20 +++++++++-
 xen/lib/x86/msr.c                        | 41 ++++++++++----------
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 09e4b5f528..8f51447117 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -387,16 +387,6 @@ static void test_msr_deserialise_failure(void)
             .msr = { .idx = 0xce, .flags = 1 },
             .rc = -EINVAL,
         },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0xce, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0x10a, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
     };
 
     printf("Testing MSR deserialise failure:\n");
@@ -745,6 +735,43 @@ static void test_cpuid_get_leaf(void)
     }
 }
 
+static void test_msr_get_entry(void)
+{
+    static const struct test {
+        const char *name;
+        unsigned int idx;
+        bool success;
+    } tests[] = {
+        {
+            .name = "bad msr index",
+            .idx = -1,
+        },
+        {
+            .name = "good msr index",
+            .idx = 0xce,
+            .success = true,
+        },
+    };
+    const struct msr_policy pc;
+    const uint64_t *ec;
+    struct msr_policy p;
+    uint64_t *e;
+
+    /* Constness build test. */
+    ec = x86_msr_get_entry(&pc, 0);
+    e = x86_msr_get_entry(&p, 0);
+
+    printf("Testing MSR get leaf:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( !!x86_msr_get_entry(&pc, t->idx) != t->success )
+            fail("  Test %s failed\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -865,6 +892,7 @@ int main(int argc, char **argv)
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
+    test_msr_get_entry();
 
     test_is_compatible_success();
     test_is_compatible_failure();
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
index 48ba4a59c0..4d84b7cf27 100644
--- a/xen/include/xen/lib/x86/msr.h
+++ b/xen/include/xen/lib/x86/msr.h
@@ -17,7 +17,7 @@ struct msr_policy
      * is dependent on real hardware support.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             uint32_t :31;
             bool cpuid_faulting:1;
@@ -32,7 +32,7 @@ struct msr_policy
      * fixed in hardware.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             bool rdcl_no:1;
             bool ibrs_all:1;
@@ -91,6 +91,22 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
+/**
+ * Get a MSR entry from a policy object.
+ *
+ * @param policy      The msr_policy object.
+ * @param idx         The index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * Do not call this function directly and instead use x86_msr_get_entry that
+ * will deal with both const and non-const policies returning a pointer with
+ * constness matching that of the input.
+ */
+const uint64_t *x86_msr_get_entry_const(const struct msr_policy *policy,
+                                        uint32_t idx);
+#define x86_msr_get_entry(p, i) \
+    ((__typeof__(&(p)->platform_info.raw))x86_msr_get_entry_const(p, i))
+
 #endif /* !XEN_LIB_X86_MSR_H */
 
 /*
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a38..e9b337dd70 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -74,6 +74,8 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
 
     for ( i = 0; i < nr_entries; i++ )
     {
+        uint64_t *val;
+
         if ( copy_from_buffer_offset(&data, msrs, i, 1) )
             return -EFAULT;
 
@@ -83,31 +85,13 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
             goto err;
         }
 
-        switch ( data.idx )
+        val = x86_msr_get_entry(p, data.idx);
+        if ( !val )
         {
-            /*
-             * Assign data.val to p->field, checking for truncation if the
-             * backing storage for field is smaller than uint64_t
-             */
-#define ASSIGN(field)                             \
-({                                                \
-    if ( (typeof(p->field))data.val != data.val ) \
-    {                                             \
-        rc = -EOVERFLOW;                          \
-        goto err;                                 \
-    }                                             \
-    p->field = data.val;                          \
-})
-
-        case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
-        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
-
-#undef ASSIGN
-
-        default:
             rc = -ERANGE;
             goto err;
         }
+        *val = data.val;
     }
 
     return 0;
@@ -119,6 +103,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
     return rc;
 }
 
+const uint64_t *x86_msr_get_entry_const(const struct msr_policy *policy,
+                                        uint32_t idx)
+{
+    switch ( idx )
+    {
+    case MSR_INTEL_PLATFORM_INFO:
+        return &policy->platform_info.raw;
+
+    case MSR_ARCH_CAPABILITIES:
+        return &policy->arch_caps.raw;
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


