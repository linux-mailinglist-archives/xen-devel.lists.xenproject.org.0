Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2684B8DC5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 17:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274292.469736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN4G-000516-IA; Wed, 16 Feb 2022 16:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274292.469736; Wed, 16 Feb 2022 16:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN4G-0004xj-Di; Wed, 16 Feb 2022 16:22:12 +0000
Received: by outflank-mailman (input) for mailman id 274292;
 Wed, 16 Feb 2022 16:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKN4E-0004NT-Ex
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 16:22:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95981576-8f44-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 17:22:09 +0100 (CET)
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
X-Inumbo-ID: 95981576-8f44-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645028529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MXv+Whc/VwisieV7Q/pmLCawQze7jVoZkFb0ogwdHvQ=;
  b=TLF29kI1+uhUi7sGnegG9LGm2317sSypZATFPZt6wQgs2RSaStukkT08
   m86daPmze/K4IEYYacs99YYCA9/XFg2FdeSTmpWRETuqWeKmqJcYsyi++
   pB6zt0XhEB453yRu/yFuHksMn5yd5zVkBBvClD3NYv3qpUITsvjK6DQB/
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1QVe5MJQGRHXQHb1UoGG4501ENCQntVhSev1Rl3Z5v3CPh9ALa474VjML37iCPqMPUPniDXL2V
 Pg4RNwSdGJfpFOQug4H3tkRrUvmsdZKlebCNl1v7XvHNtSDyT3STEgoQxX6mwFYv7xGrmn66aT
 uPLhaPwJEHkdQ8VZEH2Kqa/9vnFbNFN3uvy+PcFZ3avCdfRQIrozCgIUpMecMKIEusgk53jgCl
 lQPegJpT/t2aMST/yzAw5ERSMznTStEkpzwUuoHgEAkb1R+iLs2XyvSO8iMvrQN5UF/13AfHcF
 ZP8Ek/6mxFSocrlcJ/KA8zY9
X-SBRS: 5.1
X-MesageID: 64355270
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I9LQVqsSAloxerXofd0JUReoIufnVNJZMUV32f8akzHdYApBsoF/q
 tZmKWCBaKneNGH0fIwgb9jkphwOvMTczINiGgM//Ho9EHsU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IbhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplj4CtFyw5M4f3scc/fBZYCzB9PKhL9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JwVQKuEO
 JJxhTxHcQrcOBNUBHcsLrEhzc6UvGvFcy9TpwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ6fpCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHiqGIF1mN+52vhBCQFicVNX4BZCoJQl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaFUwYnY1RvHNEghBHVb5IOi8BxkkeS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyIP4cXOMkgJVbdlM2LWaJ29zqw+KTLufthU
 ap3jO72VSpKYUiZ5GbeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/4Fxr2Tr
 y7nAxIwJZiWrSSvFDhmo0tLMdvHdZ1+sWg6LWorO1Op0GIkeoGh8OEUcJ5fQFXt3LYLISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:RE/AFa87zDjwDRQYKvluk+DkI+orL9Y04lQ7vn2ZLiYlFvBw9v
 re+cjzuiWE6wr5NEtApTniAse9qBHnhPlICOAqVN/JMTUO0FHYSr2KhrGSoQEIdRefygd179
 YYT0AgY+eaMbEBt6nHCaODYq4dKaK8nJyVuQ==
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="64355270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyVJ3McVpA1Otk5PIgKZROpbyYzT8PDgRlyw3Mx/yNjv3/oFTqhzIF2HdDMXB0jRdsBWpb4NxZCVicFvLM4CCKmf9ji9RLLVk38lxiFwcqQHSG5C/pK3xOZOXXEPwrAw3N4Ld5lt+UN5unsog3sXhCIR8i3ULgSR80xs2bIZ7h65lO20o2lEwPLSpGvBqnb0KYIu3yt1WKcoMJ77hZjsUxr9dJN29F7Awu6zrkoI2XvaoFardummhSWPic6ymPQbtZd6+4i1OFae6m2wVV5fNTowBl31uT0Cog46W92BQv9KVLuMoPHyqy3LO21Mzwe8D/mfb86zNHelCy65eXBoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/baYjNnC5E1KhoJ7tzV137/mk2WyOVplKJZMdD4Ofn8=;
 b=e+LT2WKVuSIousfE1ov996QJ9K88QXCR2LAE+fWWt3TveRBwOZV4FC2x6/WedIk71aL98kwJH5eS9tBN8VpvXilTcIi7sT/n90PzyapRxCbiZ6A5ZHh+i0qNYXy/n7uQJiT3DfATQMfV9ftZxbvjuWLQv6jUgic5Psziank0SatbaUEc0qZmX56XnVQ9OyuWdQ1SNIagPzRyhkoLw+cJG9mdQQ8TcjEC5fDCxFTNXjqLgzO+w2j29ou4nodc2NRDd45KvKMuP+gkvwyFYhOWvF8wX6ydBgeuor33JmD+vdbPI1HvQfVWdldzZX+y4YbKwfP3me97/KRvlJ+n62/omg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/baYjNnC5E1KhoJ7tzV137/mk2WyOVplKJZMdD4Ofn8=;
 b=tGtOkstw7FgfIV2r8RIHhllWuwRK9jcIC27dCnxM1hz5UcV157WUOMNA8ZjmSaExc0bKkkBDIl23kG8RFKawruHBjQUI3XvNIAm5+cAP4yL2JBubtgtkbcsnk9R+GuygtAd1SZNsfXdodTp7R+2uCrUR9fM/JjmJs7rorUi+9BI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] x86/Kconfig: introduce option to select retpoline usage
Date: Wed, 16 Feb 2022 17:21:42 +0100
Message-ID: <20220216162142.15384-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162142.15384-1-roger.pau@citrix.com>
References: <20220216162142.15384-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbeb1994-8bd5-47e2-7118-08d9f1687768
X-MS-TrafficTypeDiagnostic: SN6PR03MB4143:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB41432FD6B01CF34E3B6B5E028F359@SN6PR03MB4143.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RCxLCB2bSjk4POxcGbrUpVasm/oMsEw/EwVLSoah1LaOCqFsqe1PUKQwUnsXUUQS1QtIYnlIrM256zoLYPZM2KVj/C4H4YMHN8nqBYUR2ZjedpIKiUCefnuTCqvEeAHTZtqO+ssWX5Fgk3jD5t8TH8SuO0YiTUhD4gR3auINK8cZfM7+Q2lpBImEaUoGrc+RBPeDi/riEPcq5ozRGGKaJl6gOs5BUNZfhUvjXD6+ZMDelBl9nLVigq97Otn9cpY+NFWitmScZrysuxosWg/TvVsJCTrgVvuJnf7IMrdsTk8Ouc543Kd5liRLa/bPOH9XAFvXN8XpTyiyXreEwbN1KaiCJrvaR9Sm8zkhGob8UzxwK31SLnRojPA1ITiyp9DpVGMVL/9Lx1mhHSm9GHO2HtcL50BWvxqyFAh7Ew/phabUXGvUCJExmHSBKR8/JZghJ4JdVBjqOvktusr1zWH4rGOloIuvjFIpNojNhqNYwLbJ7LkYo3ZmmGEgrWx81rqWeCXYHjWwoxZSu7h/zKTLhq7xMkcpBZ4Fu+HzPSMAceyrxL2Tb6Hya9JUJlIISNavfD1MWQyzJ1byQhC7MtcJte4YmpTruzR8zq1QjYN5oJhl1lxtSGzLRBN9FiAL5a7n8efxwhT2KfZaBQ6IzFwp6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(508600001)(4326008)(86362001)(1076003)(186003)(6506007)(316002)(8676002)(6512007)(66476007)(36756003)(2906002)(54906003)(5660300002)(83380400001)(6486002)(66556008)(2616005)(66946007)(26005)(6666004)(8936002)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXRXZENJQ1ZOQk9NZW0yengxbHBFblJpWFNFc01SaGVLQzl2SnZSVXdEdlRn?=
 =?utf-8?B?YTdMdTgrWStROFhCNnQzWjR6SHdXWmxxWEdCUjA0OGlDZUZZVHpKUlhTU0ow?=
 =?utf-8?B?MXZBSDVMOGFXdmxvNlFUbUxvbnp2VDBXZXJWWE56ZExSU2NCZVM0K1ROMmJ2?=
 =?utf-8?B?SENtL0cwaWFnNmhMQTgxdEIwWk96ZFRQbVM1MnZoNmRsWFdFSHpqTVQrNm1H?=
 =?utf-8?B?R3ZpbXloeUlQa094dlN6S0VTWmoxTUhjc0JkM2l6MENlRHFwbUtUSnRLSEhN?=
 =?utf-8?B?RTh6Tk5NcWtMNXR1NWdLT1pYdnRiQ3BEZEZPKytpUTQ0M1VaU1BaQ0c2WDBG?=
 =?utf-8?B?dnlmdERFT0k0ZGxvei8zblh6Zmt4NFczQVd0UHBaNXFLQnlQSTdJSS9tQ05N?=
 =?utf-8?B?bUZoLzZsT0h6R01QS2lnWlhuamFNQnh6eERFS1BaUFRKZ01wWE9GUVNIR0k5?=
 =?utf-8?B?Vk0xR2NXUnM5MVZ2N2VhVXl0TXJoM2FUVmQ0bENMcmw2Z3BOWlhYbTRSMXo0?=
 =?utf-8?B?akwwanB5VHhtWmpmR1BPY3V2dmhJNFFnU3FqWHhYNUt1VjJZdjl6RXVIQkg3?=
 =?utf-8?B?NXFwWXY1SyttK1FQUWdxOXpJZDE0QThsVWdOOFBlZHVtUXp3MlNFUlY1cHB2?=
 =?utf-8?B?cTRWUVZ1ZVgyVmxsVnp0cUJPUlFoWC9pcFczSllGMGJOd2ZFL25EYUpxYmhw?=
 =?utf-8?B?ek5BVWNmMFJ2aXRRZzl1OS90U2ZWN3MwV2pzTWVJUFVDbndZSFF4RzRZbGxW?=
 =?utf-8?B?dlQvMTJGSlg2MGtzQXhCdUh2OFV5eG52OUI5WkFnb1p5eVA2ak1OR0QzRXNp?=
 =?utf-8?B?bkh2Vng5MnFKbG5PYktNS29HVVBmT0pWaDkzQ2NQZkptVGI4b0VKWDdGRENp?=
 =?utf-8?B?SUhLZndaNnZGUnJxTnMvNWkxUHhjMzhQSFlvT0ExcWhUcEFuUzlJc2hacUZ5?=
 =?utf-8?B?ektlenN1cG16VStxWUFxSWs4dC8wRnJ5MTQxempzWnFLUHJDamVBOVd2NnMw?=
 =?utf-8?B?ajFWYWRReEpVdW5pcUplMTVud0o0QlVlcUdQV0JjK2E2b3dQV3h2Mmx2UG1W?=
 =?utf-8?B?eFgvaTZjaEtpa0o1MmhnaVdxaENZVXBFZkNvK1hhYVcxbXA4V2IyT3R2cjlp?=
 =?utf-8?B?YVBHU0Y1bmVTTFdjdGVrZVdkQy94dHdzMkVwT0V0Q0JIUk5MTVJackl5bXBB?=
 =?utf-8?B?SXF2VkJrUEtBaEF6TlFKL3dSU0hOMkZ3NU8vYlBORnJKclBHTS9DYUxyRVZU?=
 =?utf-8?B?VUVMUSs2TUU1Nnh3WFVqKzZWZkdkR25PWFd2V3NEQjdSWnpnbE5LS2drMGlk?=
 =?utf-8?B?MUNncG52ang1djNtOTlUcGZZRnl6cnM2Yzh6bDBha1hXNlZMdGRvV29mcnN6?=
 =?utf-8?B?RVJVeHVlVUtDS0xSV0RBeXhudmo1YjVyUlVqRWkydHhISkNPb0hPbUtuYWFB?=
 =?utf-8?B?K1hJeHBNYlN0eG50N1VOdzBWM0s1cnNnQTk5eWhHWmorOUl2WStIRVVJMTd2?=
 =?utf-8?B?Q0dxWUtidHhraTlEa25FUDFGMGFPMDdobW1jYW8xLzRWeTduRC9BTk1nTWYx?=
 =?utf-8?B?cHA2WlUyVlFPbUF2WUUxK21MTUd0TUZkU09NQU11cDRKekJWVUw2d1hiMExI?=
 =?utf-8?B?eWthVkRIaVpFaFhZTnZWbkJCdGZsbWV6eGJPMzFtSkdjbG85akZlQlNQa3lY?=
 =?utf-8?B?cndtSmpyeUhZaDFUOStpQXFvZmhWUzA5UkpvNmw3NURlQXhuTkQ0NE0zWkc2?=
 =?utf-8?B?aHE1eElUZmJGWkRpd2NiRExOL2gvNDVwdk54bUhCTHJpVWVBb1p0S1ZRRGp2?=
 =?utf-8?B?QkNNRVlaOEZyN3ZIRDU4OEtSUzAxQmtFaHM0aFJOVFNRdE5ISTRQTU4rY0or?=
 =?utf-8?B?OTk2eEVpQm1ac3liL2xtK25aWFEwTi9rMUZva2t3bEd5UW1PTEFYODJEbm5P?=
 =?utf-8?B?Y1NNZmNEQzlyQ3FGMitvZUprQjVBKyt2bWRlWjFBaC84Z3RiS1lXcDRpeXA5?=
 =?utf-8?B?YkNJYWpOQVRzRkZ2dlN6eklTQmoxbkY2RTQ0bklCUUsrQlBoT2xHNndjclg4?=
 =?utf-8?B?MWthem1IRDBXZ0lydElzWW9nYWh4b0t3VHpxbVY0anFJdFJiSGk3Y0NPNlFJ?=
 =?utf-8?B?d2ZFSHlray9manovUC93S1BJbWMyQkV4eWdxNHdLYTlDTGMybzByM0FNbUt3?=
 =?utf-8?Q?iMx6PX1CjuYnsHNPQ798Qno=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeb1994-8bd5-47e2-7118-08d9f1687768
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 16:22:03.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jyv6/WKnWvnLgY+hwpW8ntiV2XgyxlIrNSvV3RJrrvtjc7f+GprbjqHMjRg/dWs5O7x0bIsdJ3VNah57Pb+d6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4143
X-OriginatorOrg: citrix.com

Add a new Kconfig option under the "Speculative hardening" section
that allows selecting whether to enable retpoline. This depends on the
underlying compiler having retpoline support.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Fix description of option to use indirect branches instead of
   indirect calls.
---
 xen/arch/x86/Kconfig |  4 ----
 xen/arch/x86/arch.mk |  2 ++
 xen/common/Kconfig   | 16 ++++++++++++++++
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 2fa456292b..7c73802adc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -38,10 +38,6 @@ config GCC_INDIRECT_THUNK
 config CLANG_INDIRECT_THUNK
 	def_bool $(cc-option,-mretpoline-external-thunk)
 
-config INDIRECT_THUNK
-	def_bool y
-	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK
-
 config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index f2aa2a515f..0597e714f9 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -42,6 +42,7 @@ CFLAGS += -mno-red-zone -fpic
 # SSE setup for variadic function calls.
 CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
+ifeq ($(CONFIG_INDIRECT_THUNK),y)
 # Compile with gcc thunk-extern, indirect-branch-register if available.
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch-register
@@ -49,6 +50,7 @@ CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -fno-jump-tables
 
 # Enable clang retpoline support if available.
 CFLAGS-$(CONFIG_CLANG_INDIRECT_THUNK) += -mretpoline-external-thunk
+endif
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index db687b1785..e688e45513 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -146,6 +146,22 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
 
 	  If unsure, say Y.
 
+config INDIRECT_THUNK
+	bool "Speculative Branch Target Injection Protection"
+	depends on X86 && (GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK)
+	default y
+	help
+	  Contemporary processors may use speculative execution as a
+	  performance optimisation, but this can potentially be abused by an
+	  attacker to leak data via speculative sidechannels.
+
+	  One source of data leakage is via branch target injection.
+
+	  When enabled, indirect branches are implemented using a new construct
+	  called "retpoline" that prevents speculation.
+
+	  If unsure, say Y.
+
 endmenu
 
 config HYPFS
-- 
2.34.1


