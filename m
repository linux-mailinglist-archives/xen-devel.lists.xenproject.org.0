Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13649515D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 16:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259097.446915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIZ-00024o-VV; Thu, 20 Jan 2022 15:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259097.446915; Thu, 20 Jan 2022 15:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIZ-00022q-RL; Thu, 20 Jan 2022 15:24:27 +0000
Received: by outflank-mailman (input) for mailman id 259097;
 Thu, 20 Jan 2022 15:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAZIY-00022k-IH
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 15:24:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b843585-7a05-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 16:24:24 +0100 (CET)
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
X-Inumbo-ID: 0b843585-7a05-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642692264;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8fb7RMiMFJnQMVyLs39ZxwUK5iOY7w4da8yWLqWoJXY=;
  b=iA4egN4vAPfqZB/th+m4F9nlPUfs9d3V5rvlzVjJTPZYm7Kq7N94V7X1
   BLzYIm1BZKM078k08mMovK9Tbn0mVsa81vIaEHTfU7ktMFtSFquXOv27K
   dRo9IyEJqsggckQKdkvv8us3KkIBwxUQezWgkXf7SAcDh3c61zRXHZepL
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mvDfvPBcy8BPkBLBnGJrGjZWpIntUhhaZRUFYv7jyPxSxhHQxLWMQQEC1+F+EbhiQx7ckuV3uX
 NEw6NM2rb6cDM/Mt1YDQ+BXvHvMzI43pqk3y1afTZuG/Da0HpDR/Q5wZUbbVTBwgnwlwhoVL1i
 yRpe2gcuYE2hzjJjbzLDbSZ1MfH4hB8x4jXvMjUFBUP06KIRMsNPs9DFxy9Wh0T93e1hR1BQrw
 cgqIqOLhhUUYJVI+cqFtl5tm342ZgKiKFylzLGcIaMVZhKBKlH0CdW5PUBVXPY5LaVD5n9orml
 Omyx/6/MH0YrACfVcknVTQ9D
X-SBRS: 5.2
X-MesageID: 62819025
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gImapK3+NYYK2z1mzfbD5Ux2kn2cJEfYwER7XKvMYLTBsI5bp2NSz
 zAWD22AO6zYYGqmeY13PYq08hgOvJ/WzNJjGgJlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbZh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgOxIy
 c5Ws76MYg4yE/PQtP4PCQZeDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4UIhWZo3J0m8fD2V
 ddEWDBLRgn8RD5kPFo8M8w3pMm5ryyqG9FfgA3M/vdmi4TJ9yRzzbzsPdz9atGMA8JPkS6wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTQIsPEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+LkQqzIjMTD1MpbDQpExcp+cu5v4cs20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPtTwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF9plxBGFb5JOi8BQ2Swm8zbq7onhezM
 SfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlPdongxNRLOgzm9+KTJrU3ZE
 c3HGSpLJS1CYZmLMRLsH7tNuVPV7n1WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cA5WRVBmW8Geg5EHJ4arf1s9cEl8WqC5/F/UU9E/90ijvr2Wr
 ijVt44x4AeXuEAr3i3TOik8M+u+BMgmxZ/5VAR1VWuVN7EYSd/HxI8UdoctfKlh8+pmzPVuS
 OICddnGCfNKIgkrMRxCBXUkhIA9JhmtmyyUOC+pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiPnc/YekGudzBGRAGGzf4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9nvonhvb5XyAhgDU7nVVXzB+MyOGSC0OlOqrZJmu1TtzypV
 x/d4dJdI7iIZp/oSQZDOAo/Y+2f/vgIgT2Ov+8tKUD36SIrrrqKVUJeY0uFhCBHdeYnNYokx
 aEqudIM6hz5gR0va47UgidR/mWKD3oBT6R46c1KXN610lImmgNYfJjRKi7q+5XeOdxDP34jL
 iKQmKef1a9XwVDPciZrGHXAtQaHaU/iZPyeIIc+Gmm0
IronPort-HdrOrdr: A9a23:1NercaGrV8M4yLukpLqFBJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDmewKnyXcV2/hrAV7GZmfbUQSTXedfBOfZsl/d8k7Fh5FgPM
 VbAtFD4bTLZDAQ56aKgzVQe+xQvOVvm5rY4ts2oU0dKD2DPMpbnnpE40ugYwRLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUKzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4AoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKkQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgYdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfJsRLQkjQ1o+ao7bWPHANhNKp
 gvMCic3ocdTbqiVQGXgoE1q+bcHUjaHX+9Mz0/U4KuonprdUtCvjolLfok7wU9HaIGOud5Dt
 v/Q9RVfcl1P7crhIJGdZA8qJiMexrwqSylChPgHb2gLtBDB07w
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62819025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY+dhkgiOciq3j4LPRHSTs+QwW8oeJsEwkWUfMmnbMZB2yEEJ8AB7JWL5g6CMygpiuWgHczaIr5qIKQ0mJrF5+VPZEbWKrmv+JRAxqkPLS0t7CK6W4MxDmweheK8y/7v3ctHujKQEEvRKxick9kvj1LpHu/oU+g0XXfM024mZwRw7MqWjNn7l24LCmBgnkLcux7eWgc/HwNobsN1Nz4cCDiSnTUCC0cEdfvMLRgcoH1vV6BdFDxqoxfdVk/MXK76zjmSzzI17ahE06DoMECzo6NDdxeqVYnEc5EERQIq4++CYxc1Xqr1JDsBSY7F9bLICpLnI632+TOyl+xyT5Eb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6q8iNvYXzBZ/weoKdbnWcs68ru8NG/sGIelZyH/eWc=;
 b=RucK10Okiw5ID9kyS/TIfL5e+zVKWooKTbPtGeX2yVxKqDxUrkC/2IO1TtHN15CJnwXWVY69UgKMxn3eWEqQI4pNpwrrgoi6g4WijFIVcgTEoNWjwUWmkfAseg1LzWo9XiFIg/qLsNGvG0O94I14PStdvqLceCUK0s3sRo7kniutVF3pzVfEQ18ja3Y8TwPdc1JHc87DU0O9S1HGZF8WoS9tCOmtsxZdS4PoGGqtiVe5klIKP9RSPXSdIBU4wTYB6hX428j/D8MIcVZcFlSWLmDgLyvwEkaJSclyk2JEB07UNOk+j+EU/eA0Qez3JkWhEbO0VD5NYsyPhTU5aUwBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6q8iNvYXzBZ/weoKdbnWcs68ru8NG/sGIelZyH/eWc=;
 b=Eb59BmNhgGG3Pib41rxqIg+t2VSTh4Mj99yB+LWr8u1qf1z/8NEBar3yB5DB3gEiU7lmXZW5iNM2/dIJffsv35PDkpZnhF4y7R0t0GVaTw9hSrFUcCBK+ZPkJceeQ8qZ8MM5Iia1BgJcOwPe9yMXTPBhdFNo1BG47koFLPBRZgc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH 0/3] x86/hvm: add support for extended destination ID
Date: Thu, 20 Jan 2022 16:23:16 +0100
Message-ID: <20220120152319.7448-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 640918eb-70c1-4655-889f-08d9dc28ec86
X-MS-TrafficTypeDiagnostic: CO1PR03MB5906:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB590615A0A6F29223F49772498F5A9@CO1PR03MB5906.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QeC5dh//YtdXCabGUC36DGE9JlFslEY2ERs+bIC+HAqUYRJ0xdPoGIPjqOQ2HmLmnUeNR1pRvmTZ2nCHkxa/HHtQVqjdBOeuL0y/pJM4Y0dmHvOwhANkcGgAsJ4QhFI6u6XmY81+kBlOxuwp2+v7Ht+VVMuUkF+in0i68WwVk8q0C2HE2eEQ2PpYMlkYhgs0uJ9G/5YJ/X4zSa6cZW3RLIJEebgOUOGqjzWs7jl+aqTSgPT/Ks+j62PlUnE9yhTJ4GE4jD4xO6Wd19T43cEJmvUS3nieCC5Cwczj3FlJwODpY9ZOGz6M5U5B3PzZm21rxCA5utn62EZ6ISkl9SKbKUSCxdE715VqRLusK8lIGO2eRfBcSLcLd5PUgM40bGRh6G0cG+hcjoPyQ3+J6RsAMW9K4Mv7dZbn/0/HWb4HqP84XN2NOkfXxM9dH22r87dc8YPU9T55v+3Ex9yJ8ZHGtDGceWFTZ2kk/ZwHEuLf7aegVdSwljMVZB+7NJW4xHTeue4OjQBIL9+WJvK7QYwPE9xD/Eyx7BcsH+LKga6VehEQ3Yw6HeSnOVu/1RbG6ALNZBPPnijr6Y/zzJRRi9YPW1s7FVyuWYGJXHx0EgRVOO4SUYRpEy4KBqvERCwSiXSVuLmjj5Vhm/i33ss06cKNfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(36756003)(2616005)(508600001)(26005)(6512007)(66946007)(38100700002)(8676002)(186003)(5660300002)(1076003)(2906002)(54906003)(83380400001)(6486002)(4326008)(8936002)(82960400001)(86362001)(66556008)(66476007)(316002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNPVWxra05RdnpGVnBGS043ZEJyRDVPSitXbWFTdTIvVnAyOGdRcGhtcjBB?=
 =?utf-8?B?ZW9rb3ZHMHJZR1hMdXZRREJSdURLZWVPUHpXNmJ1bGVrREYrNzVObUhEVSs1?=
 =?utf-8?B?Qm8vVnUyN09qU0lDUDlhNkpLcjhScDJhVllnK2hscElXcFlmdE5LekZGb0FI?=
 =?utf-8?B?djJLR0FwanA1Nk10NnVlQS9tay8wdlVBMHZUeDdWcStNRWRwdGMva1lOZSs2?=
 =?utf-8?B?N1V3d0hBeFdDUEdPQTZDYnJTcHFUcTZnZzhTMkZYRVR4QTV5OHY3SzAwMFJa?=
 =?utf-8?B?U0tJREFRNmZkM3FxSG1ad0REbGdNUUVub1labWRUWXpBTkx3SlJOWUhxZzdD?=
 =?utf-8?B?VGprUDBSelp4bzgwY0RKNXRDbklpN0svUlVnMDNyYzdZZmZVY3oxSUxCZElU?=
 =?utf-8?B?UlVRTGhwMzBMckFOaG8xeTloZ1g0ZU5rUjNGSXg3aDArRmFja0hPdDJnUGRT?=
 =?utf-8?B?cWNpR25oQldvRHJLbDQwVEF5TVhpT0FzZXBleUNNekhhdnRXQUU5eFBhS2d4?=
 =?utf-8?B?MzhDUFptMmF1MkNJZTJLd2xYMyt5aEpQb0lteWMvNmtjeVN5OWtEN3J1V2JP?=
 =?utf-8?B?Y1lJcWhEWHNKWmZNRW01eVQrSzQ4Q2lIMW9qdVBkRDF0MkR2b1ljc01FNjdQ?=
 =?utf-8?B?TVQrajBQL1RHcC95Y1NkTlo2U1doOEQ0VGF2U1Y1cWFNRnBvempBUWZkYzZv?=
 =?utf-8?B?MGhiWHJqRkVQaWdQVUVGVy9vYXd3OHNSbS9MdmRlQzkyRTFMbUE0djFwUk9q?=
 =?utf-8?B?eUFicCtqKzlzQWFjejZRUmFsbFBaZC9oc1p5cmwyOVJSSTRlOCtXTEEwcGM1?=
 =?utf-8?B?QzBMSEg5L2QvcTZYaW9XQitQeVc5bjAwUmd6ZkZxK2ZTMHVUWVJjNzByTUl5?=
 =?utf-8?B?Q3d0UW54QzQwSlo3cGJiYXowUjI1NGc0RjVIMnlaY01nMWU5NU9vVStvVTlk?=
 =?utf-8?B?bjlrQjBDbE9EWklxbGY5UUY2RVJqQzNCR2RRQkVmTWg1QmpkZW51elRqWE9M?=
 =?utf-8?B?bFZXUUFOakVMRTlzTzhWN1Q2QitXTzVJQ3l1VjZVYy8xMjFiQlFpK01uY0Fm?=
 =?utf-8?B?ZU1jTXZyMlB1TWRlNlQ1M2ZFS1lxTWRPQlliNDd6ZFpra0hCbGdweWZhc3ZB?=
 =?utf-8?B?dS8zYkdzNG9OZ2xFRER3a3hwVVh6YUhMclFjc2tpemx5eWZwN2FlTmg0MTlU?=
 =?utf-8?B?Tk1xaDZaei9rUW96ZnFRQlJJczNmejZSZHBwajJ4Q1Izb2pNZ1MwMkNzKzhx?=
 =?utf-8?B?bWV6ZEtoUDRFMGU2NUpnektvYm1UOGpVcGJwN0s4bXdsT2V3OUpkZFdYSWF0?=
 =?utf-8?B?ZUM1SnpxZ2N3bUd0Y2N0VVJXMlFyVitaV05nYmgwSUttalp1TXhMdlkrWjFt?=
 =?utf-8?B?RlNJRXBFbHFlY2JsYlk1aWt1RTYwK0lzRnd4Vzk2ME1VK0VENFA0bUJpUUxh?=
 =?utf-8?B?K05lNUQzTU1UbHY4VVd3TUhPKzZER2MybnJuaGJqOXBQLy9ZVmZzTWI4aTJa?=
 =?utf-8?B?bUNOaGpjQlNnYlNmdFJGQnREY2V6cGJlT3RLbW9BbktHbUpuNS8rT2tqRjBQ?=
 =?utf-8?B?bjl0N0g5S1ZiT09ENXY3eFM1UVIyR09PRWxuMmhYSnA3SW56MnkxWk1maGVD?=
 =?utf-8?B?WHBpclRVZjRtL2xlc0dXNWVvbzU5cjlYRHV5Q2hHN2MwYVNiNXlVNE1nai9G?=
 =?utf-8?B?eWtZZnpTUm1ES0Q5NmVxT0hMVmZ0TzlzT21uOUxCZ3ZORnFNYWVQOGptS2tx?=
 =?utf-8?B?S3FHTEtzajFiZHZ2UmRVUy9rRWVDa2Fhb2tIYU1rb1k1MTVJYXlKbk5KVUh5?=
 =?utf-8?B?Ky95YnlyR2p4ZUJiaFVCcTA2SGprWWVhRVNPUTJZYzZtbkg1SHNlZlhtNTVY?=
 =?utf-8?B?WmpWSTlwaUtYdzRUWXVCOGVqYVdkRmIyc2ZIc0QxMXZtSlRWdWN6dDlQSjFk?=
 =?utf-8?B?dnlEend1eVFKTEloNnhtMUR0RFE2dnliR0xwL3BUSkl6YW1CWGdWcTQ3U29O?=
 =?utf-8?B?SDFqQzk1dlp6dUFRQW5oeFVWb2xCa0llblBqcGU2VjBjOEdBekVpKzB6RUtG?=
 =?utf-8?B?LzdBdGlpamVZckl5SWYxeDFYY1JzVk15alBGcUtQSWxDNEViUWhnVkthL1Bl?=
 =?utf-8?B?c2s1TGhrRzdTRGgrNXdGQlZPNTRXdFArOTE1c0pHSVRoeU9Ta1ZrN1JDTTJH?=
 =?utf-8?Q?1vbdn5nkSY8yU59eMuKobTw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640918eb-70c1-4655-889f-08d9dc28ec86
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 15:24:17.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWnFjINtCcVTauxKXRK+K5sdQrLqGy8vv1sUOlv5VKjbAofT7kWi8mXqm2fmEY774FqGEESWK1IzuUn54kOHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5906
X-OriginatorOrg: citrix.com

Hello,

The follow patch series is a very initial implementation of the extended
destination ID for vIO-APIC and vMSI for HVM/PVH guests. This is already
supported by QEMU/KVM and HyperV in order to target APIC IDs for
device interrupts up to 32768 without the need of interrupt remapping.

Note the feature is only exposed to guests with vPCI at the moment (see
patch 2 for the details). In practice this means it's only exposed to a
PVH dom0, and the maximum vCPU count for HVM/PVH is still not increased,
as that would also require some changes to QEMU and the ACPI tables for
domUs (both HVM and PVH).

Thanks, Roger.

Roger Pau Monne (3):
  xen/vioapic: add support for the extended destination ID field
  x86/vmsi: add support for extended destination ID in address field
  HACK: allow adding an offset to the x2APIC ID

 xen/arch/x86/cpuid.c                   | 12 +++++++++++-
 xen/arch/x86/hvm/dom0_build.c          |  3 ++-
 xen/arch/x86/hvm/irq.c                 |  3 ++-
 xen/arch/x86/hvm/vioapic.c             |  3 ++-
 xen/arch/x86/hvm/vlapic.c              | 14 ++++++++++++--
 xen/arch/x86/hvm/vmsi.c                | 13 ++++++++++---
 xen/arch/x86/include/asm/hvm/hvm.h     |  5 +++--
 xen/arch/x86/include/asm/hvm/vlapic.h  |  2 ++
 xen/arch/x86/include/asm/msi.h         |  1 +
 xen/arch/x86/traps.c                   |  3 +++
 xen/drivers/passthrough/x86/hvm.c      | 10 +++++++---
 xen/include/public/arch-x86/cpuid.h    |  6 ++++++
 xen/include/public/arch-x86/hvm/save.h |  4 +++-
 xen/include/public/domctl.h            |  1 +
 14 files changed, 65 insertions(+), 15 deletions(-)

-- 
2.34.1


