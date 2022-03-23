Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAED4E514C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 12:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293858.499357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWz9V-0007OJ-FN; Wed, 23 Mar 2022 11:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293858.499357; Wed, 23 Mar 2022 11:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWz9V-0007Km-Ah; Wed, 23 Mar 2022 11:27:45 +0000
Received: by outflank-mailman (input) for mailman id 293858;
 Wed, 23 Mar 2022 11:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OhW=UC=citrix.com=prvs=074292745=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWz9U-0007Kg-M2
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 11:27:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 405f3954-aa9c-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 12:27:43 +0100 (CET)
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
X-Inumbo-ID: 405f3954-aa9c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648034862;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PUuKsYI+9lzB9NsbPKIGcMveFcwuOqi1Q29VBFDNSEA=;
  b=YS0hJLwThAr0ExN1LQ33ZV+YO1HSKTCFpHGLl2v5HpBestAKt9AADUM0
   Gl8t6UditsSBY0O8b4LF+pvDnd5G2ic9xrXCIcAX9AdSSzfNc40WFOlId
   11QOU143IeokT0RE1+8dx0Mo7ZmT98rsPeUJvw3xZ3H2KcjGBuLcWiu7s
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66865589
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:G/NNS6Cf409+nhVW/xbjw5YqxClBgxIJ4kV8jS/XYbTApDsg1jwDn
 GBLCGGFPK7ba2amfdF+aNm29hxUuJHUzNFhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhSk
 N5JpL2RWDswFfzAwMMjCjB2DzFxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgmdu250eTJ4yY
 eImRwssfSqHYiZgeU0rUJ8usva23H7WJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdz+SrWOAvxUcc8FNCOB84waIopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvKXTdroZy0WE6E3eaY9RSMYAE7MX8NMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT838JrmXFF5mLJ9w43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8SoW6DaGEM4YVPfCdkTNrGgk0OCZ8OEi3zSARfVwXY
 8/HIa5A815EYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt6It07xfsJzrmUl
 px/M2cBoGfCabT8AVziQlhoaa/1XIY5qnQ+PCc2Ok2v1WRlaoGqhJrzvbNuFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:SkgsU6q00rZPPndk02OwNhgaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,204,1643691600"; 
   d="scan'208";a="66865589"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEmkRTcOHpF4XY7iYiQyK47oo7eYXsLnsSZ/QfG1CP/22PqTkderPmK1Hp7WkQsbRjxOrnHwkL+fVpO/wFxe2pS5nFeNa18dZmDhuT3ihufjrK342CkTNU/3oypNbix6eGmXzMdt4dpHbneoI27nIvpUhqpoqWtUn/cLovfTRrn8skZ6Q2TqzgnXtOYpUWaTyWNeOMJrn0e69dm7PGamRW3n2ZJgX/Lip0Hj9crWc1be7GdPnfjZHduHh/VFfLRsARa37M/WMgnQl2Uzqht7C+qfmPoxZNS2n0G+PT2IejRTaXFfcvW12dSbu091DbXPISKpSKenXuvl4XMig65Pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJRdwykLqiv+GY8bF1TVQyPfiATQ129eKW6Yd9R/M1o=;
 b=jD0WyT+Os1iLFpMWZ+xYN4MKQl+QCKbyK1KWbaBzwqPhxbBaoukcOZ7urKrSFo9SsWusISBr86w+PYqUNghCPVBNgma0C1ZzdImF4dSjJZsW3Zefe7z+rVeO+5lOM3QyEmGz7dYALsw05mVNir9lLZRn8W5StuITlse8rdGziw5GaKTkY3nT1pcVJLgKG0c2bWaWYcezcB3ZwYcDz4ckSB79WVwzw4ShFf3FrMiXleFUJ1H2qVK2hJN50VBQzilNqg0csZ6MqPKUDSRl0UAdP2sQWsEZ+OqfqOCTY2QMGpErmzSkDq9leC8TMaJwHytPIbamTfl4M0Nz/x6N/W7I2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJRdwykLqiv+GY8bF1TVQyPfiATQ129eKW6Yd9R/M1o=;
 b=BAeCyxYtI1u7WXTCatYZJCYmMFv2KbfuM8s1KREIfW6Q212zjqXZPFyVRkny2yd6hrmhxn+Ur3UIpzOPLhX+y72y/2HRs9tv2jyQucfoqcNroVMJ9TJ+yQZ3kaJtlxkiJOaUAC4+rd4gqi/PiP24xzS/OdxUJzGJwnJzKDkG4tw=
Date: Wed, 23 Mar 2022 12:27:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] CI: Don't run Coverity on forks
Message-ID: <YjsEJVbiJxf0bVWx@Air-de-Roger>
References: <20220321135828.3158-1-andrew.cooper3@citrix.com>
 <YjiUDyTDuq5KQT3W@Air-de-Roger>
 <10b64b72-dd9a-a2af-83f2-c42dad5adc9b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10b64b72-dd9a-a2af-83f2-c42dad5adc9b@citrix.com>
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8611eb7e-8b02-4bd7-0b74-08da0cc0228e
X-MS-TrafficTypeDiagnostic: CY4PR03MB2613:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB26134E737888C89D4796218C8F189@CY4PR03MB2613.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dpAI/1nd8DNplKLRssM1pgx9KkXNO1K+L3RJqJoaE1R0bHz2t++gUqVcblCZpq1LXwyx4If0TT16g32epFw2aH5R4Or/dYVvSoPSkRSEgOZVO4/1XQliTXBZ/6s0bm5fND5bKpNnHRvduX6JEKgYzX8TM4hRrewQbjSndIEI3hKVbnUU7xAwfMkvtniKPzuz6IeojSLOY8nWvIW49mhajO8Hb2K7VjUMbqNmqt8XCyvOEvjck4qUviI3OxF8KlXb2fTeKpQG/u2AxZ5PeRkzin3f9uK0bCNdpik4KsHHXjtdJi+yhcPFuoivp3hLejQXdCeN34RtUNc5Q4AUDn6cXmqcVvgM/09kVDPbk0xCQCQ+Hy5vBTzK5TgY72cgvOR0mHimq/NXqP/LEvi5oQw2BE4Rxl0hSOHxJq1nRQR7sXSr6yPel9it+y/9IWoDW7i+gXgFJO9fHx6JQGCBc5MJQOyzABbU+isWqZfe0RC2rxMSwA6sttON3aOvyqh84rTxiIH42BMLhgPzHldz/82qgNSqcIZAxrqRc12dRg9DqsJMtqzahLveSYtEgj86YGAiJ8CLsd8F3mvv7Evuae2t5wfkP0Zx4ZDFzup7aYjcfoCOzW1A61n2KSAnhAcEvOsvEkopDeFFgWtndB+yM2m4rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(4326008)(66946007)(6862004)(508600001)(6512007)(33716001)(9686003)(66476007)(66556008)(85182001)(8936002)(82960400001)(38100700002)(86362001)(2906002)(6486002)(6666004)(316002)(6636002)(54906003)(5660300002)(53546011)(186003)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGVqN0NkeHN2YWtiOEU1Wm0vcE9vQmpnK2NXT1JjMUdoWUxkbkVOb1d0WC9s?=
 =?utf-8?B?amtGZmdESFdWUUNxZFJXQWlhZnMzMXF5eFdIcTlDaURvSkcremt6KzNlbnJF?=
 =?utf-8?B?RlVCWXRLak91bDUxT3MwSzcxZVNyOElLdU4wVUhHclBrQkdzSEo0N0U1bHhp?=
 =?utf-8?B?MGwycFNpaHYxUURNeXFOdWVOMEpXMkUybmxiYTIxSithUzl0aysxSFRZZEpt?=
 =?utf-8?B?Sk1ydTk4ZjdMclRMb0tPb1loL0dTQ0YydzE3ZVNOa2lqMmY5eWh6dmRqTXM2?=
 =?utf-8?B?V3JHTGl0TGFvdjRTMUlxQ0ptZlIwUm9kWG5rSEQrTllHTDlPelNtMXQxR2dT?=
 =?utf-8?B?dmFxK3pxeXhjMlYwKy9CTHpIY3NSREtkaXAyUEh5M2tkUkJYKzlNZEJVaGd6?=
 =?utf-8?B?bmxaQmxRT2tlN2ZlYmFwWG5CQmF5QklyTWNVVndXU2REK25XWndKOVFJTzZ3?=
 =?utf-8?B?T2VvZ0hkQm9CZE1RN3JleEhwbUx0amNuWXBCR251Ly9jNzBicytDNzEramYy?=
 =?utf-8?B?L2hLRmRTbXhCUlhzWGF5YWk4SXFzRWlPalRJZWNpN2t2Z2V4SVQ2VG0zY1l6?=
 =?utf-8?B?L3FkTE44OFRGMk53Zm5PdDY5WXRCdE44RFg5Z0ptMXVWVng2eXlqR0JFdWRS?=
 =?utf-8?B?TDNwWHhNdndnRG5JOUc2ZmpzSVNkVG9ZL3BFaEtidHQydG9hZzd2SUdvOGVL?=
 =?utf-8?B?NVJEMDc5cXNmdERxb3dNWlhVV0ExN1lLYXVranFiWFZZZUZMZUR0WjhzR1RE?=
 =?utf-8?B?Z1VlVnBYSHUwZkJvRXBJdXZ3TFo1dlJxRVk1aW9YQURZSjBYeUMxd25paEQ0?=
 =?utf-8?B?ZEp6UXdtRnNyMUtaL2dmSHZSSi81VzVPMGlXdHhacXZDTldaK2xtUWhpamc5?=
 =?utf-8?B?T3hoaWFUWWVuK2R5LzRieGNHNEEwTjZqVVlhc1ExclA0U0NZWWlJd29rWkh5?=
 =?utf-8?B?bEpuWWREbGxHVVRaazQzVDM0SGNsWTlvTHlhSXAzSXkwU1J1TS9NRktneks0?=
 =?utf-8?B?OGQrRWU3RTRBR3FidDh2cGVpTEdQM0dBUy8wYWUwUUhNMzllVFU3TUVHSGox?=
 =?utf-8?B?cFJoOGlQMGgvSmg5YUZlNm1mOXcwdnBsY0M3MVpvTVRqTkxSOFBabkk5bzJV?=
 =?utf-8?B?algwVTZSdURqR2ZyQWRVdU5XRjN3c081MzkwVDl6MVh0am1xUXc0aHUwaTY3?=
 =?utf-8?B?aXA1R1dkSnZIdThocEM1OXI1K0JNZW9UdElsZFBBNlZ3YmloZm9uSUo2cFpF?=
 =?utf-8?B?b2F1cFBtL3VDNFY5N1M1eW9FU0k5MEoxVmxBM0h1dzhwWXA3VjhBRDZ2U0lR?=
 =?utf-8?B?RVMxeW45aklGenFVUmRyY2xmbng4NGNRK1F3QlBEM2RkMlpGWDk5TzVYbm9j?=
 =?utf-8?B?aFNTL0VJKzFvWFRoTE1KbjdoY1BEeUNZUy9MT2RxbTlTUlZvUlp1MHNNdHl2?=
 =?utf-8?B?YVR6WnQ3ckhCYmpjRlJwck9mNkdVUDF2dzNJcytQV015VUFnRnZaMzQ2SUVO?=
 =?utf-8?B?clZqRXdDSHUwTUtQa2k3anZicExJQ3R5d3FTUWQvMFFmK3k2VFJlMHJrd1JY?=
 =?utf-8?B?STRqWDhYLzNsYVc3YUJwenlkRklKa0lWczVRVTNYM3M4TVIxeGx1Vnd2dzh0?=
 =?utf-8?B?dytIQ3YzVy9zdU5mR2ZvUUtnRmxhOStEYkJSRThYeFJRRytmZXpoUUhyWVFq?=
 =?utf-8?B?NGdOOThuZGpzanFXS2NEcDhtYXgyUzBveGYzN1ZJbEpKZTVuRExiTmlEM002?=
 =?utf-8?B?aGJFUkJUeXhsTHQ5SjE5RHdjQ2lqSUpoQVNRai9ENENWd2s0NjFKWUQyanlT?=
 =?utf-8?B?NGtPSnM5a0c1SnpSNGdlcXFJSEc5dmk3MkNzSnNYZkRpRWNRYVBZa0tIVWxJ?=
 =?utf-8?B?MGlHcmNPQmJVbVI4VTBHSzllU2NYVkFadWtNcXljS0RReDdKRTBJZEI5dVdz?=
 =?utf-8?Q?GNlcwksT7b6jaC5WZ98+svVZ1KNRFq70?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8611eb7e-8b02-4bd7-0b74-08da0cc0228e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 11:27:38.1365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuHD1/XrFHESIGx9+hL7kI3LwWHzOHQYsRYpShRNywmuXnKWw5PgSMz1ArCew9Qy9tEcnqrCyGtdk7tg3Rib5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2613
X-OriginatorOrg: citrix.com

On Wed, Mar 23, 2022 at 11:19:50AM +0000, Andrew Cooper wrote:
> On 21/03/2022 15:04, Roger Pau Monné wrote:
> > On Mon, Mar 21, 2022 at 01:58:28PM +0000, Andrew Cooper wrote:
> >> By default, workflows run in all forks, but the Coverity token is specific to
> >> us, causing all other runs to fail.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >
> > Albeit I have a suggestion to make this more useful I think
> >
> >> ---
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Julien Grall <julien@xen.org>
> >> ---
> >>  .github/workflows/coverity.yml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> >> index 427fb86f947f..f613f9ed3652 100644
> >> --- a/.github/workflows/coverity.yml
> >> +++ b/.github/workflows/coverity.yml
> >> @@ -8,6 +8,7 @@ on:
> >>  
> >>  jobs:
> >>    coverity:
> >> +    if: github.repository_owner == 'xen-project'
> > Since I don't know anything else similar, why not make this a secret,
> > ie: ${{ secrets.RUN_COVERITY_SCAN }}? So that people could decide to
> > enable coverity on their own repos if desired.
> >
> > We would also need to introduce a ${{ secrets.COVERITY_SCAN_PROJECT }}
> >
> > To allow setting a different project name.
> 
> We wouldn't need a secret here.  We could do it on on the existence of
> the PROJECT field.
> 
> But if we're doing this, then we also need to make the branch selectable
> too via the same mechanism.

Sure, that would be better.

Those don't need to be secrets, but I don't know another way to store
such data in a github project.

Thanks, Roger.

