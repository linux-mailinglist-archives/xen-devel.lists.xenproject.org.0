Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36247B02E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 16:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249837.430223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzKYH-0007mG-Pl; Mon, 20 Dec 2021 15:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249837.430223; Mon, 20 Dec 2021 15:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzKYH-0007jF-LI; Mon, 20 Dec 2021 15:26:13 +0000
Received: by outflank-mailman (input) for mailman id 249837;
 Mon, 20 Dec 2021 15:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfhU=RF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mzKYG-0007j9-4q
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 15:26:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 226bda90-61a9-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 16:26:02 +0100 (CET)
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
X-Inumbo-ID: 226bda90-61a9-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640013962;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AAiWOlqSj02Wk513cGcuIKrmLzCaM/a1oKkBNjD359w=;
  b=IohGtJDLYZglf2CuQoytSYrdUkiI6d1r62l0hSkdhgx0DppkSfXQnPJq
   S6vTQqX9AzSkUVVj7xypkRVdZPcv2aRCaYa25asNIrS5855jF3vkEaG1j
   HwaQG/+poTIzLXfc6imhmOyZxpvLWrKuMnoz8n2kFIo/GnMzLAhBDuMkV
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2QWbXfMpdHUxY5OH6WOhiwhtmRCtG2+XBb+5HNbwGe3JLLEt9XoMaHYTba7QFJEnSu05N777FG
 u/oIkDZTVKCWp7ISMbr/OOAbEdXPCPz0mkOWJhbywqM+eNWVs9iDMPtxpKxOgMR6/Ddd1Dy4p0
 hFMOrO90GNxK38SfEYEt4bNGrcJGHYfgKS/qVRA9W2uiUfwSbcoNqa9oGlIXYFOqr8ENO0N5a7
 5RHCDOIuimYxi5xyT7U7p8V8pWo/Rg8H6zV6XDSuGI4rqSLkQjdVHWnDhbTRzK6uxDsz8WffMO
 SI1r6nS6pwp/rFU+mpGVLEB/
X-SBRS: 5.1
X-MesageID: 60823926
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SyKIF6soV/mmgMfbIYseTHq9eufnVI5ZMUV32f8akzHdYApBsoF/q
 tZmKWuEPPnbZmWnfdwjYIW28k9SvpLTmtdkSwtk/C43RSsT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy24DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmK2sZ1o1ZY72yOE2agUBNQYgO6FU0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JgeR62PP
 ZRxhTxHTQ/ueT9IBmouK4sgvc6smmu8UgVKkQfAzUYwyzeKl1EguFT3C/LNc8GObdVYmACfv
 G2u13v9KgEXMpqY0zXt2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyyuoGkZZUmViUowjn/YqHBoNi
 FmFjfq8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBn3+1L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgTY1
 JTns5LHhAzrMX1qvHbSKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aIm64O
 x6P510LtcA70J6WgUhfOd3ZNijX5fK4SYSNug78M7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvc1zihqlLZOy9UJBhg2g8OCBwb1+k12J6OdSk7bsFdotxdr4irbQxwflxR
 vgDWsOBHvUQFWiXp2VDNcHw/N54aRCmpQOSJC75MjIxSIFtGl7S8dj+cwqxqCRXVnirtdEzq
 qGL3x/ARcZRXBxrCcvbMar9z164sXUHtvh1Wk/EfotadEn2qdA4IC3tlP4nZcoLLEyblDed0
 g+XBzYepPXM/NBpoIWY2/jcot7wQeVkH0dcE23K1pqMNHHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGYgj5Cr5kJXXaj8BDurcUm+1csAqyH
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjH0PJbR4B4op3
 OM9tZNE8Ae4kBcrbo6Lgy08G75g9ZDcv3HLbq0nPbI=
IronPort-HdrOrdr: A9a23:Ws6C9KAKyWWun03lHeg2sceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.88,220,1635220800"; 
   d="scan'208";a="60823926"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBYCt+Ysv6wihteTRvi1qnA0mfuYel1dWnYr2+vWvJezeezkIbAdAMdn67Acj7TLUZbGyIbbDRJABzC6wF0WgwhikFStD1Gu2hdnuSbZVZBjBh+j+lfCgxgQVaZqiqSxXOtLefHmwAshqFA28eD4peTCch5ixHpT+hws4sXURlcxsOwFsowx2J5yCCK2Q9k4RlJhgroDSyIuHZZEwLvH/qgIVcThV+I49GBTQG3UVSOIBg7NSdeeRB2bKp09w3jitZXvjLxDZlZXxCScecwpyG6sWbqhDB6ouRE5zxfZDKh4TMBMAf5Hbt1n3tBW2B+D4znjavr1YdDylL0VbudbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6r9yazLJ7J3E/Km7y/bxviJ5JNZbO7ImVN3JZKYD1PQ=;
 b=ABtRYRQwU80BXl6cfIO8laWhJO0OjeHPxSBcOhIJC+t7Q68IZRymlskfdW7EqX6K6JN9XJ41LJzja1jNEXCA+YseLbrhGYQfeeD2O/V1zRX4UEkog3rmloZqfZH53TMAMiayEhj5CEIetBTaSee7wK/8Hxx+oOhgf7LdXmcKY2/ZU8fk9eyKrzCkPtf84wyf9tm6X7uXr985s2mH4+X95IhEaJTyuBrek0WMRnl+G50yHrmTURNOkDX/er8Oe47QAguaj91nk8FVC2EkNhdldm2nMtY/c8/6TPIcCm2lS/joQCFa1PK/pAtucN44InVs3L5qmVqIjErjpBAnsAuD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6r9yazLJ7J3E/Km7y/bxviJ5JNZbO7ImVN3JZKYD1PQ=;
 b=iz7QtJvYFJjQwaLbFM2AHKhpF1JUyBNWfJAm9uI1wk3Bchl6MEnzbjKgLT+8kTyULycwWtrHbJM6kxKYC3lQ84D/BQBxV6Z2j5h7F9NzHAO2NknN99/xmruIOXgVa2ZyYrCP1OF9gdiFyioTYFzGb4hDuQuUU1Io06o8dVIwbSs=
Date: Mon, 20 Dec 2021 16:25:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 16/18] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <YcCgV/o+1I0qry+q@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
 <Ybn0LaRuFpUfcmoU@Air-de-Roger>
 <bbcbd938-170d-94dc-4fa3-49766fb2a9c3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbcbd938-170d-94dc-4fa3-49766fb2a9c3@suse.com>
X-ClientProxiedBy: MR2P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34b6c63d-c0b0-4e28-823b-08d9c3ccecec
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB3577AEB7F361A91B3E78039D8F7B9@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2ysqp0Ju4gvRqYb3+4EbNuiXw30QcY+Dzz2qYVRtyW537Qo+jvMus7FjNwwXh6OfqE47mu39acpJwHzQvo2iLCa/n7QPoOfpTot2nn7/YEEgXrgCxIpfAkfDgTfuUJtIwrSs++kUQiqVnIwo/oypuj1VQU4kll5AgSDech8yjyWy2jTBxNlXJiAwG9vwac3q/9wgzS0cCW0IQuvmfMkUbJ7/GyxRCduY8kwbpCe1LoNOOsX0vPB0yRKapadNGU/toLpH02yZKW65WqSDUjsK7wgdObgACzqzWI+GWdwtsLoJX+jkiz1AXOLwkZOIiu/JvZRXmYkBXtqNvDZiC1z0orzLNO8RTCTYdchFWNaGbxecNXS07OisYGoGoXUHNFk08bGlXkW4hhCYxNidCAeY7o08zQ/w5ZGI+Vrvy403KHMbPrK+jJjgFYDwhYJ8H+R1XBR5FyXxPROe+Y5fBlQ25znwTk5klQ/UmYbdWG2iHOWxYanSI+XmbuwK+Q9k49QSRJA3zxt+TAgJI3CbHp5+D/nlQj3RZBiK9o4CDUcg3vtUwlDRzk7XoByLJpvPERHxyhWndO5Tg4CuWxh91sBa+kOgzFvbc1mz2jXUn43M8VeCQNM7ACC+5HK6pFcFs0eY4EhXKJwQ5rzjtg/AWEO1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(33716001)(83380400001)(5660300002)(6512007)(9686003)(6486002)(26005)(186003)(53546011)(508600001)(6506007)(8936002)(86362001)(82960400001)(8676002)(54906003)(316002)(2906002)(85182001)(66556008)(6666004)(66476007)(6916009)(66946007)(4326008)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVNyT29xVEdPc0ljcGZZNDVXR25aTGcxK0tYSmRIa1IvK3ZiMDg5Snd0TFRs?=
 =?utf-8?B?V3E1bTNFMzh3cG1OMXYyVlFFTlB5RDVwTVRqYjltYlBKMzcveGNORld6YXBw?=
 =?utf-8?B?R1FRRWcrVWFjNzJ4N01iZzQ0di9FTW4xMFpWdjFydGdQOWU5R3NKZXQwWDJz?=
 =?utf-8?B?enE3M092bjVkQUdYVklxZi8wV0JUWVF6L0dINXFreXl0czAzM1NsZHYwWGFz?=
 =?utf-8?B?TjJTTloxV3kwSU5iWUh2WXMvbUJTK2x2L015UE1JM0JKUnlLRS9wdjFZajFJ?=
 =?utf-8?B?THc0TFdvNUw1VVVuMDVSUm9Ga0I2YkFkbGx5UFphZGo1bm1FOUcwc2ZUSFh2?=
 =?utf-8?B?eUlXRU1Mdkl0cCtPT3ZUYkNRRStGcnRQVy9tYy92S2tjSG11NkZLbHJGeXBi?=
 =?utf-8?B?TzBsN1hGVGVNTS8xTkJQKzRKMHNTa0U0bktYSHF6SGhEQ3lIb3N1WTZpMlh1?=
 =?utf-8?B?Nm4xL21sRDIxb2F6ZXgvVE4rMm42RTV2OU9QOTR2T3NHb3UwbEV3OHRFR25u?=
 =?utf-8?B?S3BZRWZ0dGtTcDJTM3FBM2ltUjU4dzgvc3plSWpxbVZUamQzUElpYmh5cCta?=
 =?utf-8?B?cjJtUVVlam43V3U5TGs4eFpQNlI1UjlxMWFJbWp4cHo3UHJ4WFJKTDlPRTY5?=
 =?utf-8?B?WkFJWTNBSGZuRVBZZGNQdk12Z2krd2pNZWh6MHkrU1NDOHBRb1MwNXB6enlm?=
 =?utf-8?B?QS90RWVieHMva2p5SUMxSnhrS0tFQ2pTeFJZUFVrdHB3OWdEbit6N21Xakht?=
 =?utf-8?B?RDlscW5HMUo2eXdqSkR4UkdzeVZCaFc4b0FGbXU3d3d5VXdQdXU2VG9KbWtk?=
 =?utf-8?B?aFlaOUhncnlycW9MZ3VLSnVlTWp6VG02S0NLRDBNZFhMMWpwYkNLdEU2clB5?=
 =?utf-8?B?bkl6WUoycjRhQ20rVUpwM0tLTWNIdWZPeWUySDhCZWRSSkVHZWpiNi8xblBo?=
 =?utf-8?B?TThra1ZYbHRqQVpaWlFmdnBNakQwTm1IVlZuc0lqZXBHSW9zUklsTytvYkFz?=
 =?utf-8?B?WmNvSjhwUFd6THRiNmc0N0E3VW9jbnJaSmFlNnRmTHJ3a0E2SHAwQVplc3A5?=
 =?utf-8?B?RTZjZHdKdnV5NHFnMVVoUjBPOUt0WnBWc3VMMERRemlrWlI5T1NMcG96MmNU?=
 =?utf-8?B?Q3lSYUczd0FacndvbGJGOFY3T0JhZ2xKeFY0Tjg1bngybmEyZE90MS9aNE5F?=
 =?utf-8?B?ZXBDQmxZYzFVeFkvV3NZQlRialFaU2htb0hZODRubTFpQmVhUFhoaW1YWVJJ?=
 =?utf-8?B?SjZ1SGowZXlnNldUcHVNUGl4YnNZVHBDZmE4aGVsWWp3YnlVZkYycTE3UTNV?=
 =?utf-8?B?b2RyTDRrRlNLRWlBRXRwaFo0NEIvUFdvUnpKY0hoUEhqeE9XMmpOVGJMN3RY?=
 =?utf-8?B?NE1mRlgwWW9Jb2p4TmVDbHhCU3FvLzFnQm42emFwbDdYUk10MUFPNmpGS3Ax?=
 =?utf-8?B?NDhmbHo1OWQ5U0E3YmZXbTR3UnozUldHL0o1NDhERng0akZlYmJTbkkzeFZm?=
 =?utf-8?B?ZnhnUVpDcXp3ZHlEMC9VNVpPM1o2S0lvc0x5SXRUbk5oS1FpNFAvZFB2SXU1?=
 =?utf-8?B?V2ZzbDRvRWppeHlnZTVEdXVtbEhHSDE5eUgyQmx5RTRnbnNNdDdaTGV0UDBp?=
 =?utf-8?B?dHVIVVBhYW5UYVZ4a3F3Q1JTaFdoWTFtZ2NaRGdxR2ptbUNUdmYwU2dqVlBp?=
 =?utf-8?B?YTl6eHhid1MxNW5IUXlxaTdCdCsyeUNzS2NtK0xud1MreDFGdFNXeG1iWUdV?=
 =?utf-8?B?RmFPcnlvd3dJOEhpaEZaMVpkYk5RbkRsVmVIczBsRWNWcHAzUzR3a0ozS1My?=
 =?utf-8?B?VG91ODFmNGlhYURIbnpjVlovcytZa1VIbG4wYmUrMDN6V2tyOFJadG1iWlFF?=
 =?utf-8?B?WVVSMnZ5SDZVaVduaFQzUTd1NjJvWEJiZVRWTEp1MXVRQTZmeE1jMEZRU2Z4?=
 =?utf-8?B?QUJONTMzRlFBS21HOUg0YlJ2MjNWdDRCT1NTeThLOXN2SU9XTWp4VHNvNnZ6?=
 =?utf-8?B?YlRkS3JvVFRycFN6OTlZazlUSFlLK3VzcTRNZ1N2Z1NNNGRSNnEweEpwZytr?=
 =?utf-8?B?VnhmVnYzSklyQTA2N1REWmg4MzhadlZySjJHZG40dFd1MGdxZHpWOThGYlAr?=
 =?utf-8?B?ajFER2h0VjZMUEhZOHZKRCtiZ1BTdWZMUUEzUXlHZjBld3VrcVlZb2s4NFEz?=
 =?utf-8?Q?w0K7bfN39sxzCc4NzfUXzBI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b6c63d-c0b0-4e28-823b-08d9c3ccecec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 15:25:16.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPheXbsSvNGUSSjFuuPtAuL2TcRmgU6iar+zxpx8Eej33w0x3vaz0C7hVvumppyEjU4zot2eb/tvbsZF8QvBvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

On Thu, Dec 16, 2021 at 04:47:30PM +0100, Jan Beulich wrote:
> On 15.12.2021 14:57, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:55:30AM +0200, Jan Beulich wrote:
> >> --- /dev/null
> >> +++ b/xen/include/asm-x86/contig-marker.h
> >> @@ -0,0 +1,105 @@
> >> +#ifndef __ASM_X86_CONTIG_MARKER_H
> >> +#define __ASM_X86_CONTIG_MARKER_H
> >> +
> >> +/*
> >> + * Short of having function templates in C, the function defined below is
> >> + * intended to be used by multiple parties interested in recording the
> >> + * degree of contiguity in mappings by a single page table.
> >> + *
> >> + * Scheme: Every entry records the order of contiguous successive entries,
> >> + * up to the maximum order covered by that entry (which is the number of
> >> + * clear low bits in its index, with entry 0 being the exception using
> >> + * the base-2 logarithm of the number of entries in a single page table).
> >> + * While a few entries need touching upon update, knowing whether the
> >> + * table is fully contiguous (and can hence be replaced by a higher level
> >> + * leaf entry) is then possible by simply looking at entry 0's marker.
> >> + *
> >> + * Prereqs:
> >> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
> >> + *   contiguous bits (ignored by hardware), before including this file,
> >> + * - page tables to be passed here need to be initialized with correct
> >> + *   markers.
> > 
> > Given this requirement I think it would make sense to place the page
> > table marker initialization currently placed in iommu_alloc_pgtable as
> > a helper here also?
> 
> I would be nice, yes, but it would also cause problems. I specifically do
> not want to make the function here "inline". Hence a source file including
> it would need to be given a way to suppress its visibility to the compiler.
> Which would mean #ifdef-ary I'd prefer to avoid. Yet by saying "prefer" I
> mean to leave open that I could be talked into doing what you suggest.

Could you mark those as __maybe_unused? Or would you rather like to
assert that they are used when included?

> >> + */
> >> +
> >> +#include <xen/bitops.h>
> >> +#include <xen/lib.h>
> >> +#include <xen/page-size.h>
> >> +
> >> +/* This is the same for all anticipated users, so doesn't need passing in. */
> >> +#define CONTIG_LEVEL_SHIFT 9
> >> +#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
> >> +
> >> +#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
> >> +#define SET_MARKER(e, m) \
> >> +    ((void)(e = ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
> >> +
> >> +enum PTE_kind {
> >> +    PTE_kind_null,
> >> +    PTE_kind_leaf,
> >> +    PTE_kind_table,
> >> +};
> >> +
> >> +static bool update_contig_markers(uint64_t *pt, unsigned int idx,
> > 
> > Maybe pt_update_contig_markers, so it's not such a generic name.
> 
> I can do that. The header may then want to be named pt-contig-marker.h
> or pt-contig-markers.h. Thoughts?

Seems fine to me.

> >> +                                  unsigned int level, enum PTE_kind kind)
> >> +{
> >> +    unsigned int b, i = idx;
> >> +    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
> >> +
> >> +    ASSERT(idx < CONTIG_NR);
> >> +    ASSERT(!(pt[idx] & CONTIG_MASK));
> >> +
> >> +    /* Step 1: Reduce markers in lower numbered entries. */
> >> +    while ( i )
> >> +    {
> >> +        b = find_first_set_bit(i);
> >> +        i &= ~(1U << b);
> >> +        if ( GET_MARKER(pt[i]) > b )
> >> +            SET_MARKER(pt[i], b);
> >> +    }
> >> +
> >> +    /* An intermediate table is never contiguous with anything. */
> >> +    if ( kind == PTE_kind_table )
> >> +        return false;
> >> +
> >> +    /*
> >> +     * Present entries need in sync index and address to be a candidate
> >> +     * for being contiguous: What we're after is whether ultimately the
> >> +     * intermediate table can be replaced by a superpage.
> >> +     */
> >> +    if ( kind != PTE_kind_null &&
> >> +         idx != ((pt[idx] >> shift) & (CONTIG_NR - 1)) )
> > 
> > Don't you just need to check that the address is aligned to at least
> > idx, not that it's exactly aligned?
> 
> No, that wouldn't be sufficient. We're not after a general "is
> contiguous" here, but strictly after "is this slot meeting the
> requirements for the whole table eventually getting replaced by a
> superpage".

I see, makes sense. I didn't relate this check to the 'replaced by a
superpage' part of the comment.

> >> +        return false;
> >> +
> >> +    /* Step 2: Check higher numbered entries for contiguity. */
> >> +    for ( b = 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
> >> +    {
> >> +        i = idx | (1U << b);
> >> +        if ( (kind == PTE_kind_leaf
> >> +              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) != (1ULL << (b + shift))
> > 
> > Maybe this could be a macro, CHECK_CONTIG or some such? It's also used
> > below.
> 
> Hmm, yes, this might indeed help readability. There's going to be a
> lot of parameters though; not sure whether omitting all(?) parameters
> for such a locally used macro would be considered acceptable.
> 
> > I would also think this would be clearer as:
> > 
> > (pt[idx] & ~CONTIG_MASK) + (1ULL << (shift + b)) == (pt[i] & ~CONTIG_MASK)
> 
> By using + we'd consider entries contiguous which for our purposes
> shouldn't be considered so. Yes, the earlier check should already
> have caught that case, but I'd like the checks to be as tight as
> possible.
> 
> >> +              : pt[i] & ~CONTIG_MASK) ||
> > 
> > Isn't PTE_kind_null always supposed to be empty?
> 
> Yes (albeit this could be relaxed, but then the logic here would
> need to know where the "present" bit(s) is/are).
> 
> > (ie: wouldn't this check always succeed?)
> 
> No - "kind" describes pt[idx], not pt[i].
> 
> >> +             GET_MARKER(pt[i]) != b )
> >> +            break;
> >> +    }
> >> +
> >> +    /* Step 3: Update markers in this and lower numbered entries. */
> >> +    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
> >> +    {
> >> +        i = idx ^ (1U << b);
> >> +        if ( (kind == PTE_kind_leaf
> >> +              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) != (1ULL << (b + shift))
> >> +              : pt[i] & ~CONTIG_MASK) ||
> >> +             GET_MARKER(pt[i]) != b )
> >> +            break;
> >> +        idx &= ~(1U << b);
> > 
> > There's an iteration where idx will be 0, and then there's no further
> > point in doing the & anymore?
> 
> Yes, but doing the & anyway is cheaper than adding a conditional.

I think it might be interesting to add some kind of unit testing to
this code in tools/tests. It's a standalone piece of code that could
be easily tested for correct functionality. Not that you should do it
here, in fact it might be interesting for me to do so in order to
better understand the code.

Thanks, Roger.

