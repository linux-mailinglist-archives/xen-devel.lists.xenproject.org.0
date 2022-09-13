Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839DA5B7636
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 18:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406505.648911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY8Yt-00058Z-AZ; Tue, 13 Sep 2022 16:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406505.648911; Tue, 13 Sep 2022 16:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY8Yt-00056E-7Q; Tue, 13 Sep 2022 16:14:59 +0000
Received: by outflank-mailman (input) for mailman id 406505;
 Tue, 13 Sep 2022 16:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgvl=ZQ=citrix.com=prvs=24889d1cb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oY8Yr-00054v-1c
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 16:14:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 338fc9b6-337f-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 18:14:55 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2022 12:14:52 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5296.namprd03.prod.outlook.com (2603:10b6:208:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Tue, 13 Sep
 2022 16:14:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 16:14:48 +0000
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
X-Inumbo-ID: 338fc9b6-337f-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663085695;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=V3lyu2VgTxIW0Wn9pWymZmCf8W4Dy61UscsxV+0vGrI=;
  b=fpO9EKu/i3m8MS1f+GPpfiHte0VsJUlDPwyH/TLJpQ1MtoV/ILM+mR4H
   r8FXJMKSITXKCZdVhbuoa1qL3TlCEuZVl22ii+C0bg0VUlDBmjgtBayVZ
   q4KcikRlpPX/RkHu/DmApIUkCsdUnmfYF6Ojd42fwCEMfvLkuO+p5cL7f
   k=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 80408336
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AOj245KvvikftC5fNe4GKGNA+6OfnOphVZjiD+?=
 =?us-ascii?q?MifNrXfiWXw2xPKv3m3sVAiTtXTOunIiNcj/pQV0QW/FX7A0JDBsTlM4+R2O?=
 =?us-ascii?q?9Dsiwl4E/wTnNjGyDgUMwsuPx56qaV/emZZ+Jjuyk2ZKT6bzz/j6veV7bI5W?=
 =?us-ascii?q?EyD2FjwfmxG3eKY5KwXd1czhiPNOzqlfXysJFMH7M0/JMNjXWMAaMKX+WDX5?=
 =?us-ascii?q?YIwXOxuf7LIwZwrGtqwnwqIX9ZRK9nLgYEOOGlXOFT2flsYxv2tXyvWBwJlA?=
 =?us-ascii?q?MZ8yK7cxggc0XVX6vqZ7qee/fnbrZ2MWpWfJHPIg62OS82At9wtWSUBvQ3WY?=
 =?us-ascii?q?lDqjsDCmx05D/9sySEWtfheoSWmR5pEfadPJ4LyHT0BLw5vEOHwK4h+hQTbE?=
 =?us-ascii?q?hwx7rF52QmdeHg7tx1j9G1SbyYjEyqC4QZ4f9apBHgabr7TvJ7aP8JSQ8S0g?=
 =?us-ascii?q?pkjfh2uOWee4A6ZAZ2JYFyleyb8dC5ikRcH/tUGoTZ49aJN0hBtselWUcz/f?=
 =?us-ascii?q?8hC8BzvUwW1lqWqDeQZIhMyGQhy9wpJzUmyMDvYf/D2xJLityLA8cJ0KvgIR?=
 =?us-ascii?q?6J4AbNvpSynzo1DQ6ZI1D71CQZ98mdhGd79xlpQkRaiNkQ46qj5fLMzH6iin?=
 =?us-ascii?q?aavc/FtTpV6CdTq/w5zfQlGIn1eIYH1LCi+dAj5phbsEvmeg2Xcly8MZfGus?=
 =?us-ascii?q?uIXwHfIuImaOqtTB/c77DKY+3WuBbxVxK4GYK99vcCNy95J7+qEPX7caiftd?=
 =?us-ascii?q?Qyc15l8XeW/JDzGskzyXXVJbwVw7w9I0Nu/A/crpURbKWOLtTXJocZFZEYcH?=
 =?us-ascii?q?7bkCF2rBNiFh7pohidY30gv+0UPm2FtosojIj+m1HNj19lbH30S9n8bRPi3q?=
 =?us-ascii?q?6vvR4xB6pxTqGyPO5MoLOPvFRoJn8FuHqQzp2idf56GVaCm1Us+9/6u/DL0N?=
 =?us-ascii?q?0JDXjYM6AYiqxFhe62VIqWeAOq5wkFA/KhP+dWZpU9BPfH1gPPnhgSk77jJv?=
 =?us-ascii?q?K5OXHN1aqE9jvAL5TkcTK+wiNVamiRs/dFAdTpgYb0Aqnzad/1Ei31rSgHhE?=
 =?us-ascii?q?fgmFGJfmhUPXbgL7dx+GbDndHlUjuvtpK43OfS80gEX/Ym9DPbfssAEMvKXR?=
 =?us-ascii?q?Y4NS/wAewo67xGVzbTI6ql4lmg7j9btngxqz3APe7bxW8InlhZKeG6k/Ea49?=
 =?us-ascii?q?a7zEhOK45duTGXvZs8JufcoZr73XskxV/980yeOkmpvPS9/OZczVWsq47zQD?=
 =?us-ascii?q?WMb3e2vj9eAazZyL9o/t6wexZvECImBVEUnNp964SsO9HV9tZmV4k1RJeV6W?=
 =?us-ascii?q?2aetdIVJyVAcXWKsMPCQFFYlDRSeJ8LPWGqBKCrYjjbUxwMd4jVQF4slfXfd?=
 =?us-ascii?q?3BoFQlwPpJv7r69IkxfEOtBZr5dRQtPZNKioIBQWd7+xfgwPQs+kuQJO/Spk?=
 =?us-ascii?q?XJBBYjN4Hkv9uzHP+JmflLoOKxl7BaN828CMAyPC+Nvn464pmWRbfeE6wQCh?=
 =?us-ascii?q?5+X2vi06nCgXmIgZ/7GLNIUh6EkXmdQII1/0+EFbEj4WRIDAXVs3L5pR3Sfc?=
 =?us-ascii?q?S55ND00I9eUBm7VhA2Ut0NFpDtCUf4vnsfRIXcv/SONEBIA6bBTZKVheC435?=
 =?us-ascii?q?ta77wNGSiXHZV7CcP9t9xw4H5OBYlpoEv4gbu2rEjgUycpSuCVeeukbYUsmO?=
 =?us-ascii?q?XhefkVL2RZJfCbDffF1dombtGJ7AScgro6e3WNfOaIeEAPPufdLjcT1Q92zm?=
 =?us-ascii?q?3vZF3huPT+D0BI1ySwXX6v2YqdHFQzuHIFKlY9AyWBQVFNahhBC+Zeo5afz6?=
 =?us-ascii?q?r7rm0Q9l+zU5IX/c326GhK1vPOKp/c0/0z7XPdbzvxQDXSTSbM9bKuudRLR8?=
 =?us-ascii?q?GWPJM5pwaavFxnusll8yz9Jbh48xJMfftyofBvzcqRnTIREW4M04X7VYIieI?=
 =?us-ascii?q?bJm4kpUDG+EJt0tszwTjzPTvkpenZv7v1ffqiEeAzhvQTc4YdieyOgw40rtO?=
 =?us-ascii?q?fqk51WVhtrj9D+CMMNQP+WHgsbOK/gm1y+7hHGqSHRx6CV4GWIWB/yzlOusW?=
 =?us-ascii?q?Qr1O/XGJsY4714wCTcRfhUMwsH3bZzliursNC6yumopR5Ow7KTSm/+tFwc7O?=
 =?us-ascii?q?t0zFnP4/oWnZOcG3u75rVH3d3ZsVpwsXB5FaiBsV2Jb4vdgB/JyUk7cdiErD?=
 =?us-ascii?q?AJLhuinWb2vSE7zKBKmBtPHdN2QZbe2QlUq3YGyLWahKmeTgrtyMJMeT5wVt?=
 =?us-ascii?q?ZPKXjZ7xjexYUXjR5HKT+CqCsoZgWgfg6vcjmLxWpxxBJXRgvPCMAZ+cfdD0?=
 =?us-ascii?q?kHCh1QY4qPZBY2m+ARYyF//EkdS0i93fQdX//59QHWzsGfGBGKal4jDhwlAe?=
 =?us-ascii?q?3+FS9ieacEG8yLOIJ+9a+dMV2GQZl1lO5p941B87HUapu3B6kFdcHe7oc8zZ?=
 =?us-ascii?q?59+9SGh0dY2Fodlixo4gr0e4w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,313,1654574400"; 
   d="scan'208";a="80408336"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvzeQBFks8aF6QPWvZNc86Ubn6mpIWgmN0WnW7tqVXdyZueW+7W65I2VzX0LBee9k4h8SM8CZZKivVNX9LoFoZIXAU5fTrv96Rqynosev1qBOJg2Olxe61dXh2j/W8e6nELhb2c9IniP9gCCPyE7u8ivvxLNwF0zaGrE/13KsTLN+CSQPbBrrsu+z9eA8blFJeKxNLg5+rWkPjfb3wTRDVlSfinI7npJD9WYlDymgrvDF3eTkF/BRc5RHj9koqE8syZQU2RZDy4hbFrePNYpO75u7YRyfNsEHvWQ0UX5Zsg5TQijDE2x7OiPxgLYjbDjLibuwjSAJifjqDQ9fVTGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lODT+xRofwDysBHrVHJIA4SslJBYbaTiJAewzTxPt/o=;
 b=V7jawNwLeitU1i5rXYxWcDm2MuIQkK6ttoBjgqlqbmM1bI60PIiv/xgaoMTkzPnbxdCE87K4SinkisRf/qJgU79V1osMNLjkeDPwNcZAajldYVnhB0dMcXq+MeWQ3dE9kMFAYlnVagV/o8BgKJubmbIfehxA/+wnv400qkQTw5iEIxR/X1N4wVzQpnqPgYQdy3xYyJNNgyRysImiFgIBmZ0FXA/+OqcUU+qFAkj6ueSkmUhyiidwSFVHBsCQNFVk/lvwM/HtL68cJde/vj3xUYCXQVXGERifTzjf0DnECanEXZ/ZohyT19dCOjFbXXqGZJB0snRH4Jf8F4f4jleHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lODT+xRofwDysBHrVHJIA4SslJBYbaTiJAewzTxPt/o=;
 b=ZWRcdfzyFthdYn1xAh8IqmRG6CjihIBotAWM6frbwPqXpVZGKIfHralrj7+1zTd1cW9ZjVnBpBWl5RZfD08s9aF+CDttgh3f5ygcht5mrH7eUzVBXBDOqLq1Gjuh2FBepVUlShmzffroc226QGy1uTOiDaXY32Uxc50Ye1g2/eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Sep 2022 18:14:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Message-ID: <YyCsbZL8VWIPQQkS@MacBook-Air-de-Roger.local>
References: <e687a2ef-780d-edb9-938c-7cfa4237dde4@suse.com>
 <YyCkmGq5UQPwqAsX@MacBook-Air-de-Roger.local>
 <7e1bad56-b239-c252-1b45-aae26499cc77@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e1bad56-b239-c252-1b45-aae26499cc77@suse.com>
X-ClientProxiedBy: MR1P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|MN2PR03MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: fa95b72a-6dfa-4e9d-1fd8-08da95a31488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GSeAHjSf533IlZS2FMK58I/9Hp/nQ2q1cNsDDMNPXol/VVsnLvcMuxfvf2RvA84EJyi/nvQjT9KYygmW174uhPUAlFkuFScZNnSDZlBYZ7/JGqF7+7sFqN97sxBArgke4bL84qM/4H1xVvM0RKdJkDH2OoyRcde3Q4aRk3Yh16iU0gcuJa7FhviX3LYobjPoWSuCjLrTMQ11OUT1XshlloSJzuIwOoc7mPWhTUAvaoSteDkettroPVJOasHiJguQADIpy0Y8/HGOyPgS555HshSvwriqGUA3te1fsnBKDS6/tHPBvz2meSZsHttiUyMpiO3ImVQmAgcvInt8WmhRwIRP4/+5BATDWTBktR/4mzL+mXNe2XCZGX0Hq1Es7bO87Ri+A1lNvIpZj6sHqTTB3nJFN5HMAYawBSQihkha3l07B2L+yQJ/16XsFZ/YpPB4L7tgXeK9K0G1qVV2AB4qiMxYj2Qm9R4f5Eaqi4hK/2jk3+eYMSlc3jZenfLXRciYUmrkoyGPzYT8fhDrUgKWoQSOUp9eTYddAvrW2DuBr8R0U91W2sGqKbhgjWYm7A11Xi7de2NiYiHBZDluRvOiiCI0mb9zo8xQ8hIGU1Z7fV5IXFGO9P0dGguu10D1Q1rH7n3n/ImxvtrxHuEdJCgtXqR+oSD0IhwBP2HbVY1k2V3TLood2OvMbd5Yi0KeQEYQFPQAC9cnqM0JHQTtJWIubA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199015)(478600001)(66946007)(41300700001)(9686003)(85182001)(26005)(4326008)(53546011)(2906002)(86362001)(186003)(6512007)(6666004)(66476007)(6506007)(8676002)(6486002)(54906003)(6916009)(316002)(82960400001)(66556008)(8936002)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUdqYXJSV3pRZUZqdkRYZzFzWG95bTFyK1RkYmZVb1hFcit1ZE16cHJXakJi?=
 =?utf-8?B?cytjWitBc1NYL3ZTTzJxSUU1S1A1c2M1NkZKcHpiSkpycEhoQTBxSVFoa1Zl?=
 =?utf-8?B?aUtsR2RpUStuMk9YQTN6aWxzaHZXNUdubXZxcFRRYnh2ZG9BdGdlUWx2QVlD?=
 =?utf-8?B?SVJQYlQzQkZTZVhydzBQb0kvYytzNzczTjgxSlBFYXdES0x5ckdaUU9tS2xx?=
 =?utf-8?B?eU5sTzRUOGVLd2tHZXhSQTMvVHd4R3pibTJMNzZWM1BHd2tEcFNQZHZWS244?=
 =?utf-8?B?djRvdGdqQ3BRZlFUWVdJb2JRZFdLQy94Q08zWGIybEdsampNNHZNeHplMzlD?=
 =?utf-8?B?bURBa285cTlwdTUxTUR6OWpqMTA4SVdSZHc4S3RmSHg0Z29tSyszWmpSTVFF?=
 =?utf-8?B?WVlUMFVLU2c2a1F1aXJCcHcxR3lPR1BYY0doME0ycU5wdXlWNnVoajB2ZWtJ?=
 =?utf-8?B?VHkvdnRXUzlmSktCc3pGSjdpVFlwaGFOVTlScVVueWxZcm8vbkhJK1AwdHE5?=
 =?utf-8?B?WGRPWjZnNjc1V252M0FWYXBNa3poMXk0WVBXM3kwTjBabVZwZDRxZTI5TWk1?=
 =?utf-8?B?WDZ1Z3JWYk5malhtZURvZlBYY1BGNDhCTEZUeG1rcnRYZEVpY2FVa3lCSnYw?=
 =?utf-8?B?U2tIdkxYM0J0dXZZTkRGQWFGRlFxT2ZtWHZtdXN2N0pvUGYxTTBFcnN3Q015?=
 =?utf-8?B?UmRhcHdqcHFLWENxd29HVVFoc0d1U2NRQTVPVm5zWWtMMkxWUlhjUUVZL0xN?=
 =?utf-8?B?UzhyUncvWTgxcHo3RlJLTVNCeXRzR1hCaGN2RGhYajgrbDRvcFZqbUxhcDlY?=
 =?utf-8?B?YWxubjJhZ2RhbDRpRUJqM3YzNU44QnNURDc4YnlJdUZmYUhTZVMrVW84dmVC?=
 =?utf-8?B?bHNYUkVJV1dDMFpsSXluNURPVjZpZ2Q5dnYzQ08rUDNYOE9kVzNaM1RpVlBJ?=
 =?utf-8?B?bjBQRXQycUViNndzejdxbEt4SGxnaGpLL2cvTXRPdDJoenBpMDVab1VnZy9i?=
 =?utf-8?B?REFwRCt4cEdaWExuZjZyS3BxUVljYWk3TFBhYVdyMmtEcWE1TzJLdUIzUlAw?=
 =?utf-8?B?L0REcW9pUWdJTjgza0txR2o2WCtnWEpqakdvN0w1cDVaNUVYa1czN1g0cTVL?=
 =?utf-8?B?aWdYTW1Sb084K2s5T3M5VThDbm5zS2VFVjVBWWVVVkpUNUk0OGIyamxybmhM?=
 =?utf-8?B?Y0dRTy92MmNlTXYycHhzQ1VGRFkwTzdKMzd5SFE4S2tPT2toUCtFTTFIZ0NF?=
 =?utf-8?B?MmxMZzdoVGlXSWowemxXS1gzaHc4ck4xRnhpUWdMNzBCS0UwMlYwRmJDcE1i?=
 =?utf-8?B?SmpmQzBJa3BFRmxnTUVCWUpaRmJJZmhPbnVyR0JEU1Jza2NWYjFKT2dkUUtC?=
 =?utf-8?B?emN1U3FSclVwRG1aT3pGaGtGdUQydTd5a21JM1MyNGFXMVZJYU81Y3lid0pQ?=
 =?utf-8?B?UXM3VkU5SnRHMnA0MUJwdGQ5Tms3SGhyTUJJbTYybmVQbWV4LzdjZVl6NGtO?=
 =?utf-8?B?ZjlwVDlqd3RjRkt0NXBjSnlMV25GVHUrdzh1SGkzZ2dnYzIwbTVPczJsOWk2?=
 =?utf-8?B?V1V1Z2JjbHlmZStHL3NiOEs0bVR1Z25GRlFNdUJjWUJ4WXV5bTVCOHVYVlBF?=
 =?utf-8?B?dHRPd1k4bDBqRXhVVFR3QzNFTjVQUzMzdG93aGNkYlZBWExCaTVjc3NGczZQ?=
 =?utf-8?B?S0tsQ05wQ1BRKzNJRkx0UHN0aHhrOEZuZFlKd3VrYTVqd2xIUGxZajkrMzVy?=
 =?utf-8?B?UDZVenhLenNpRE4wL2lIRUxXYnl0K2hWWW4wZVgrMWFDeVk5S0ZpTkdHZWFw?=
 =?utf-8?B?cTE3V2tjQjNJVGxYL3ZXT3pJSU1icXM5MjBsczRkYVRKOHBmcjRrU2c2b3pw?=
 =?utf-8?B?T1IwMWVmd01jM25tQmNhUHJaQ01Yb0NMb1lvcTV3UnFVUFYyajZrN0VNbUsy?=
 =?utf-8?B?ZHhJdkQyL2MxY2YxV2M2cS9zTmZWd2hRVzcwSFl1SzhweXpVNjJjN25qWTNK?=
 =?utf-8?B?MHF1ZUVTdGNrT3dTQWlYcXpseGRmRnNtd2JPL1NkaUszU1JleFAxTU0yNzN2?=
 =?utf-8?B?bFFWNXpBbGU1R0lGUTFpckxqcmYrNlFXYnc0VlRnczRMc2E3cW14cTdzY0dr?=
 =?utf-8?B?YW50SzlPc3lBUldQYzJ5MTNhZ2JQWUFpMnBoZ001d2Y2eU5XUXdvU0JYWis4?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa95b72a-6dfa-4e9d-1fd8-08da95a31488
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 16:14:48.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCAlnYHkqUh+2Ch+MJzccRcfjltdWl0WLyIkqkNRG1CkwmOMzeOGF2iISJ98SQYh8a7Yxb/a4/G8JB8z9NpcGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5296

On Tue, Sep 13, 2022 at 06:05:30PM +0200, Jan Beulich wrote:
> On 13.09.2022 17:41, Roger Pau Monné wrote:
> > On Tue, Jul 19, 2022 at 02:55:17PM +0200, Jan Beulich wrote:
> >> Since both kernel and user mode run in ring 3, they run in the same
> >> "predictor mode". While the kernel could take care of this itself, doing
> >> so would be yet another item distinguishing PV from native. Additionally
> >> we're in a much better position to issue the barrier command, and we can
> >> save a #GP (for privileged instruction emulation) this way.
> >>
> >> To allow to recover performance, introduce a new VM assist allowing the guest
> >> kernel to suppress this barrier.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v2: Leverage entry-IBPB. Add VM assist. Re-base.
> >> ---
> >> I'm not entirely happy with re-using opt_ibpb_ctxt_switch here (it's a
> >> mode switch after all, but v1 used opt_ibpb here), but it also didn't
> >> seem very reasonable to introduce yet another command line option. The
> >> only feasible alternative I would see is to check the CPUID bits directly.
> > 
> > Likely needs a mention in xen-command-line.md that the `ibpb` option
> > also controls whether a barrier is executed by Xen in PV vCPU context
> > switches from user-space to kernel.  The current text only mentions
> > vCPU context switches.
> 
> Andrew and I actually discussed this perhaps better having a separate
> control.

OK, didn't know there was some feedback here already.  A separate
control would indeed be clearer.  I guess a new patch will appear
then?

Thanks, Roger.

