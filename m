Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FD461B13
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234639.407236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigz-00069B-4a; Mon, 29 Nov 2021 15:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234639.407236; Mon, 29 Nov 2021 15:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigy-00061l-W7; Mon, 29 Nov 2021 15:35:44 +0000
Received: by outflank-mailman (input) for mailman id 234639;
 Mon, 29 Nov 2021 15:35:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrigx-0003uH-Oa
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:35:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027fe5e0-512a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:35:42 +0100 (CET)
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
X-Inumbo-ID: 027fe5e0-512a-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vJgygXMLh29agTSCf9vMlpEoMHoCQz1edDiz8YwvCI0=;
  b=hm8LnQ4qQvzx8HtAATk5V4LOkJ+mHDZIqHv8XbCL/ZZkX+A2gyak1ZvO
   aQ9SJ22fWj36MW3BTCO1tSr8CL+TjEnkSTLbpuaQavgelsgOgxD8PCki/
   2L2ucIX9fDyFz5XvuI/cCyYY+yguVTKB7eIVrmYHfljLtMa8FPBSwgAWG
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1ZSfBFPqGxDybh1oAi0KUXINMp+fbwVLGU4D1XqzRuVx2PL+ap3hw63KAt6l3n0ETM4OxNrEVm
 9hDGUMit99a18B1rM3DD19Gb/TldzS7g5M+k0jGH2mBo/Rfsb4MfyfIFn+UhiXD66+SGZROrq3
 TY9oRrZgJSFcAvG1DXi0xmAQiiLNQ0GlA6efazHSZSU2qdV6bWpwyRUMGHP20rle6VXVOMTkKZ
 ybE9n5Mu885U+V7bEKeTHjzty+tg/aEyrG5epL1b2ymrcpCmJdcAFyr0yO24bpBKT0Ozd1zxtn
 FKWcGYNsgPgxE4CnzuR7Vb2T
X-SBRS: 5.1
X-MesageID: 59208295
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ypcf+6gRs5L8MrZwcwkRyDMEX161gxcKZh0ujC45NGQN5FlHY01je
 htvD2GEOamJajD3fIojOYu09RhVu5OEy9I2HAM+qng2Hy0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ivLXscDp5YJbykc4sTxBoHAZdOoBZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t15oWTayPO
 qL1bxJNRhv+QiVqO2sPEb4Vx/mMtFLHT2ZX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDJ5WPiGTkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma/RNB3O
 0ES4jApr6U56AqsVNaVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLkcNZ2J4VYx4j/E/bw023
 2+GuPDuKCM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1K1ZZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBqaL9TdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3O
 x+K418OvsQKbCfCgUpLj2SZUZ5CIU/IT4qNaxwpRoAWPsgZmPGvoUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacicSJmWMuo8pMPLYZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHB/6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:VFyOmqEj0pagC30FpLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDmewKhyXcV2/htAV7GZmfbUQSTXedfBOfZsl/d8mjFh5VgPM
 RbAtlD4b/LfCFHZK/BiWHSebZQo6j2zEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy8QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmjbf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnTC/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKprzPKN
 MeT/002cwmM29zNxvizyxSKZ2XLzsO9y69Mwg/Upf/6UkToJh7p3FosvD30E1ws67VcKM0ld
 gsBJ4Y442mfvVmHp6VO91xNPdfcla9OS4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="59208295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVtAsq/W7tt+DTWedUQg2OAB8Uy8YUxc/eV3bH+UfBXVFp23/2OZFj98Kj3u8DDh6CwvLYv2tbr8jHBnBxa574MKbllRhgNfJNwi2k8p4JSof4QFYkk6yfu2V3HsArqWQF5QOE0y6ZngJsGZPbIdyH/VHkDQf/40DQUoFrQk5wAD7BLiiv/LrsZ6YVv2Q3cB8ubZS1Ji1F1mY7l9LHQyT1I6NWy4CXAe4b+/B9BJRo4VB2v5ibIigdIhs0npLG06KZEwohIOsqL8FJlEXmt4T7hmdXIBFAGn3avRubyzKcICj1fkXKlKaq7BCegTP17pEBc6Jv/qGpdGWaOqhVh7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYxN81WyLozHtjD5+pJmUF7N4C4RnSrAAPdZ1oW1kQ4=;
 b=L53FYGTcnOkK1/baj7Wi4cWdM5SOBQDibhULClfwQAPivcSa5Y/PZUIQm6a2Wf79blBssPLD8iZ1qI0bvkcjWnmLpULN4TLuZaNzH9hfbUQZGIniYum4FPMnStfbh4jRmnMDtAZq92pUEbWfQzA/vXcC9BfJ0pUKx0J6j8XgOwK6+5qfjDXH5rJor/TCJ5sc7cE1D6ysN6Dz0fF11/H8KNnj4XnunzxY1Ec76vpdEJf6ytJxHU4W0A4e5uGzvQGNza8nw8TwNx4I8KRhtyofP2cp2qcc2AyTBUVCPl9U7xUIWRqvf62AzsXTr6UScabDdv0ayDaNFcmpYatb7g9NmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYxN81WyLozHtjD5+pJmUF7N4C4RnSrAAPdZ1oW1kQ4=;
 b=QiLnY9101q/y+qyl/gfbEcJSpXtDKcVqdVP/i3CPp1ZzOKzRRLy+djTMSwVIGB/A32pZUc/FMmp3lg7VoKCQkbqZOYSTua1DsIg29mlk9dgTQyHg11rSEGwCx71I+0Zm05eKy0//86WBPxldaPL0oJR7Ene+AU5i9ySKitYowX0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 05/12] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Mon, 29 Nov 2021 16:33:48 +0100
Message-ID: <20211129153355.60338-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e36462f-76bd-4459-68af-08d9b34de16b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4764C11328079F59839F1CE38F669@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkLkgc1wTv0JeR+zUAk6pPFXRKu4Rgv5ZTA+mQDlkBnLtztFQapr1Lovu+MQOi1QX3sanzfk738gR1BABOT8USjJxM2aNh1tIj5PyCNk3wNejAMh37i5up9o8d85L93gvYy29tFLqu2IWAPF1XYsmoos7XCYL7gZDReuhbKbX36joqh9IPaZlK/XXlWPv0XKExz+v3SytPayBZmtHkP+A74ky9rUbiY9SXsEgRe5jVIa2RO7o2EZu5Q0bAon+BLcUGIgt4pyUxRvn5CGWIsh+bZ+TWHoCRWhUqorLTnw8A09ahOaD6s4lZCrZ2b2J2v4+19b+y1cgdGuMsckvWt3CBcNZ/3zkTX1nm8dg8VgQOmt2uOLMT0JvhSbLSlsrilL/34HAaP0fyybJPub9YGa3LlbpB3snyrJuh6+LL6NHw3PcJfpICtN5A6ypqOp3/U4frfEivnyg2ovFpFX3Uv0D884W1rroK/ZCoqyIfJYje4l3fBrfFqUNgEdS/K4wC//95cNWjQhvtLUewo7xdFot+z61XKKehzlM2bI3OfFTsXCf3RA5PwcfVdRnPOKVTSWOxsn6LaV96vItc8laD3CLKfjKs9B/JL9fLitkjdapGT8wscLZQHXPPnD/065CnxRktdSMpDVaviz1M1yUJql5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(4326008)(2906002)(1076003)(66476007)(6486002)(82960400001)(38100700002)(186003)(83380400001)(956004)(2616005)(316002)(6496006)(6916009)(26005)(54906003)(6666004)(36756003)(66946007)(86362001)(508600001)(8676002)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdHbFdQWWlYeWhiTlVNdlZ4b3dGMU9URmNkdDluVGZEbk5zS1BoUEJkTmhw?=
 =?utf-8?B?OWc2TzM4blVQZ1owTGRRczJvQzFOeWVQYmxxLyt3LzNaTlRQbkZ3TmgwV3NN?=
 =?utf-8?B?emQvWnluU2RraG1PekpiRVpXVm43RWNaTzR0MzNKMnVhYXN3ZHcwS3FkdTF5?=
 =?utf-8?B?aHJaQ2QyenNSRytJSlVDRk9TQTJCQ0dTNG1pN05PZ1dCaVFGbW42OU1CVm93?=
 =?utf-8?B?N0RGM3BiQlUwL3BDeDdBWWRycnk3QWhoSFFkTW1UT0tieWJqS2NsNnBoNFIw?=
 =?utf-8?B?TXpWK1lHM1p4UUVQcjgyUDdxak1XeGw3QXRkSHZpZ29hRXVHdzVJaU9JNXNB?=
 =?utf-8?B?cGh6Ykd0TE5jd0ZKdXZ1TWpKUzQ3d3RyNUYvQXdtUUhnSW9LaEZEcWYzRDZG?=
 =?utf-8?B?bU01dWpNZ0NRYmcxMThIVFBHY2thNlBUNjJ0bDZlN2tpLy9YU2Y0a2dQKzJ0?=
 =?utf-8?B?cVg5Q2JudmJpbG05SXBCM0F6dXZMaHc2WmRtQkVxa2NMeXladkV2S01wTUNJ?=
 =?utf-8?B?SW4wQVN0b0g4NFNXZjM3TVVzbVA4THJJZ2p2MU9haUtBRlBxeXdrSFo2NVVF?=
 =?utf-8?B?RzFrWVp2ZkpxaFY0UTZnYXFLc3lGRjZUTlMwYVF0VGZrU1I0RlliTmZ5NFZj?=
 =?utf-8?B?S3hJdGpKTjk3UGdjWTJJMzBlN1g0WUc4VW53dmVIcWl4cTdYbS9EQ1VaUFUx?=
 =?utf-8?B?QjRkTW5qZ3lOcU9ta3d3Z0JvTDROUWcrYjRDdXNIdmVGdVZrbVpwRE1adVRN?=
 =?utf-8?B?VjMwWjZRY2ZWNFlNUTYrKy9uSU1yR1RWWXdHMHNUUUZwQ2x1LzZ3QnZHTnRJ?=
 =?utf-8?B?TStaWmJvbE9jZ28vL3dDQzVtd3VVZHFSc1BYN1VyOE42Mk9qWGRNSWdZUE1L?=
 =?utf-8?B?MVhzdVJMbWNsSEt6VG9KZzRybmxIUDFCcHBveitGdWxJS1hGcWlIUnZIK2pj?=
 =?utf-8?B?TlZYUDQ3YU5wakV5SWZjNUYwR0E0RXZvR0VYak1NSGdNVHh0enFrWGpadnEx?=
 =?utf-8?B?VXpvN0w5VlZ6STN4LzBvTk05S3djdnVRRDR0TjNIOHViZm1hdUV1M3RPbXNE?=
 =?utf-8?B?d0NQZFhNdUp4REdQd3UvYmQ3Z1ZQSWFxWlFSd1o4Rjh5eDMyL3VRODZDeGM4?=
 =?utf-8?B?OGh0RHVnYjFPN28rVUk0L2hrODEzT2podnprNWRQbStNaEtBV2dlR1c1MFYw?=
 =?utf-8?B?Z1EzY0hkWVVTd1lpaWxuN2tiSURIdi94T2dyWnQzSWsraEQvL2xtVWlPdlRU?=
 =?utf-8?B?dlBKOWxNa0ZJVlN2a0lOVmNndXlkVkZCZDBzWm5yU09iSVFKR0MreG95b2xR?=
 =?utf-8?B?RkpYVHMxMUxEQ05GVXplR3hHSmlGNk56elFZVk1RYSsveW44WWYrRG96cmxR?=
 =?utf-8?B?SUh1eXpidk8yTVJBeTBnS3BzOHVOdkVnWGlQelFRN3dDUnN3YnNySGVWYk5r?=
 =?utf-8?B?alczMENLVHNVVS9yTDMzNVN3ajNGNkRPMWtMei9FTlZCUkVTSjZUOTZ0SkJ1?=
 =?utf-8?B?WWdUK0F6bFl0eXBZSjJwWk1rbFZBaTlWN3NyY1c5MHh2ZXE2NkVSR0Y4elJK?=
 =?utf-8?B?UURxQnNHQkFBSnI3M1N0WU1jUVlXSXRQMVBUbnFuYUtjR0hTdmswL3F5RC9C?=
 =?utf-8?B?TlhTQWcydjYvUzRSb0RFSDd4aXNiSVVndk5hOGw4M3FYNUVKdmdxclc1dURj?=
 =?utf-8?B?QWNPNlhiTW1RSEpjazdCOE40YUhsZzcvU3VhcWw2N2ZDYUNnZUd6TWZ3OVEv?=
 =?utf-8?B?THM5WjJyQzdnd0JrM2ZuaWdOVCsxNmgydTBHYXBuRHNLYkNFYjhxVUozWHYw?=
 =?utf-8?B?c29vK3JnNENxbjV5VVJZd3BBNHZNNGR4NXgwRXY0c2xEYlJnWmx0anpwME0y?=
 =?utf-8?B?aDN1aXFHSG1QekVGcENVWW1qbmdVVDRJSmJZb1hWbWlzeXRkZzQ1U25JQVdq?=
 =?utf-8?B?TVJxUll5Y0pGaW5lQlA2dFB3dmdBbHVzV0xNdk1KN1locmVXSFBHTVN0R2sz?=
 =?utf-8?B?azZaMGFYdVBmWkM1cHRQeDZtdzBRQmI0eExubUsybGZpS1FPQ0dMM0lMSVht?=
 =?utf-8?B?QkFoN0dydlVMaEdRQ0JUc0VPUXB0MHdWbnpKVVhTTE91LzNLbHdPdUNJMlNn?=
 =?utf-8?B?NnlSQjVxVHBCaE1RN3FyYVBuclJVOThBZGE5TWl0MExkdUZDOW4xcVZJM25C?=
 =?utf-8?Q?ZnhJ0QhJxgJC4+jGDolCwsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e36462f-76bd-4459-68af-08d9b34de16b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:32.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: autdN44XvNROCNLm1uPB7WxNXoLnhA98fmL/2vtKtD+FelWAxogVUSbV25vnpEQDYvOT9rBj+6fVOGcJYeO47A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use x86_msr_get_entry.

Changes since v1:
 - Introduce a helper to perform a binary search of the MSR entries
   array.
---
 tools/include/xenguest.h        |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 0a6fd99306..2672fd043c 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -810,6 +810,8 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 7779a3e1dd..859c885c15 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -878,6 +878,26 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
     return 0;
 }
 
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    const uint64_t *val;
+
+    *out = (xen_msr_entry_t){};
+
+    val = x86_msr_get_entry(&policy->msr, msr);
+    if ( !val )
+    {
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->idx = msr;
+    out->val = *val;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.33.0


