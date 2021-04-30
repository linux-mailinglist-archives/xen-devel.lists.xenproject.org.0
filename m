Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C5636FE1C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120625.228168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTJ-0001Da-0p; Fri, 30 Apr 2021 15:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120625.228168; Fri, 30 Apr 2021 15:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTI-0001Ct-Sl; Fri, 30 Apr 2021 15:54:28 +0000
Received: by outflank-mailman (input) for mailman id 120625;
 Fri, 30 Apr 2021 15:54:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVTH-0000lG-KM
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 491a00e0-6dde-4df9-8c22-cc4ba78e87ed;
 Fri, 30 Apr 2021 15:54:24 +0000 (UTC)
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
X-Inumbo-ID: 491a00e0-6dde-4df9-8c22-cc4ba78e87ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VgksK4tHss3xtKOhq6faeaUH0m3du7BNxGNFsPIw5pk=;
  b=RQJXQeNIW9wJmHBu0h2bI/O/yWPRaPRPAcfH4j0Bp5j4lLhnAT2C7CFx
   UM1dLmH2kjTZ7OYTVcFWb1p89Uzz+3XYnw0wd1YvVLtMt54E4DI8i0UhT
   pUjhMIAf5qmxpZkCGbSKEtJWZpL/BTqqzigtwsxkSkQiBoD3QYNF+giNk
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AilAOLpV6aGIW/46Rr7DzUdKCcHRH2MYhV3ruAHeRKc4J/P92V6jTBD0gVzJVcw9YcdrRlf8xW
 HRByVwt9JYN3o18B5v9/SRZhDqoynXQuOVbm1ZC42IU9N4njNKt/4c4XyGuGfkkjSn6Pc3VVdL
 LNyQ47wA3EzaJsuBV2ONaGt1wfm/6/jx9msCYIzVbUQGD9TeRyjwOEgPUn0ObYXuM6hYwihmNp
 tBXzP5l/L4kzoRLblpcpLAuGJje1dBXjCoAH2KYh16ixQqp9iveMHjhOM4lOGIdxV/sfCTTcGe
 iXw=
X-SBRS: 5.1
X-MesageID: 44331736
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dyAjk63JNZhJmjq0X4LqMwqjBSB3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFnNJ1/Z
 xLN5JzANiYNzNHpO7x6gWgDpIEyN6I7KiniY7lvg5QZCttbLxt6Bo8Lw6dHFF/SgUuP+tAKL
 O34M1bqz28PUkGd8jTPAhPY8Hvr8DG/aiWBCIuKAUg7GC14w+AyLm/KBSA2wdbbjUn+8ZFzU
 HgsyjUopquqOu6zBi07R6Y071zlMH6wtVOQOyg4/JlTgnEsQqjaIR/V7DqhllczI6SwW0nn9
 XWrxArM94b0QK3QkiOvRDv1wP8uQxP11beyESViXamgcv1SCNSMbsiuatlcwDU40dlgddk0K
 gj5RP7i7NrC3r7/RjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VOI1oJlO31KkXVM
 1VSO3M7vdfdl2XK1rDuHN0/dCqVnMvWj+bX0k5vNCP2TQ+pgE382IogOgk2lsQ/pM0TJdJo8
 7eNL5zqb1IRsgKKYVwGfkGWsnyLmDWWxrDPCazLD3cZe86EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3dFnpDcGIwZ1X4hHASGiwRl3Wu4Fjzqk8noe5aKvgMCWFRlxrudCnue8jDsrSXO
 v2OJ8+OY6hEULeXaJymyHuUZhbLncTFOcPvMwgZl6IqsXXbonjtunRdufPNKPgeAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZ3C6jV/+8azYAXLY1Sug0JiVC0j/v7aAFqg+gTRg
 9TMbnnmqS0qS2d5mDT9VhkPRJbEwJI+rn6SmhLogULKkvwdr4Gt7ykCCVv9UrCAiU6Y9LdEQ
 ZZqVgyxLm+KIaIwzs+T/i9NHiBsncVrHWWbpsVl6GZ//35cpcgAptOYt00KSz7UzhO3Sdjsi
 NqdRINTE63LEKUtYyVyLgvQNz5W/Y5qgGxOsJQoW/Yriyn1LsSb0peeSWvX86RiRspXBxOiD
 RKguIiqbKdhDeiLnY+iuwkMFtKLH+aGq5CER7tXvQoppn7PA53VmuEnjqcllU6fXfr7Vwbgi
 j7ITSTYuyjOCsVhllIlqLr+khzbGOTYgZ5bW17q5R0EQ39ywFO+P7OYqq4yG2KbFQehukbLT
 HeeDMXZgdj3cq+2hLQmDGMExwdt+MTF/2YCLQoaLfI3HyxbIWOiKEdBvdRuI9/K8qGiJ55bc
 uPPwuOaD/oAeIg3AKY4n4jJSlvsXEh1fflwgfs4mS01GM2aMCiaGhOVvUeOZWR/mLkT/GH3N
 FigdU5sfC5P2/xZtSFoJunGwJrO1fWuyq7XusooZdbseYur7N1BYDcSiaN23dd3hkyRf2E5H
 82UeB++vTGNYBudcBJJH4c8VotidiVLEwk9gbxGfQzeFkxj3nde9OFioC414YHEwmEvk/3P1
 La7ihWu/HCVCGH3aQBC60xLX9NAXJMnUhK7aeHbcnIFA6ud+tf51K0PX+2ba9FRMG+aMothw
 c/58vNgvSeeCX50h3BpDd3IqpB9GC8XMO5aTj8aNJg4pi9IlSDgqyj/c61gnP2UFKAGjglrJ
 wAc1AMZcJejTRnhJEr00GJO97Knn4=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="44331736"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiOEbu8uIjU8gunSS1hMZJoOcAj/iSbA6VLcmNeHj8zeSx54GBhxpl7/XOwqwncwOae84YEBiSPVkXwu/bIC7oUgK2zoRQWK/C0M+XW4Jkv3af2TKK3zIsCD7+aS4lszM0gasS9LUIb/o90KOdiCQhnALS3FXsoPMnFr9aovX0Bxo6tuv/z2zBqw+stC3uJaxsQJ+asflXUgxfawFnufU58KbcTndZrLho+tx05vS8iVT2mWpiJdn5ScJCoZ6qWzCCtDqnapiwk3dc/UKEUjsbr38Ba1r0YuUGoBKt211Hht5iyxMd7ipwLwa1MjtstBXTFPxaes3NmOny0hdN7cNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny+lyu/S5v+lbPlL8rnvx4QtBe2dSkn0/l6+PnoTvYM=;
 b=kVTHHtA+P9Xx+2ZSjfoH1LejWKFIWyk/CBBHK/TtNlbObdW+cI3K7m3wW+g90Z32yCPucKpf0moeBt/6/cbZPXdUylGoJM9X1rEfld53XwxI7XdcvQMa+x9cXLzHstAk79BLKwNC1YSqsLWL61JDNL2uB1CSzR9VizRJoeLbvowi6NwdF2yftkcwR2L9qhs3xejGRySGpidC4LzZi2md1kHGUK8ZGHuTxyZI1E4tXWjJvAKFlrMGPwo0IQpFKetsm1s9WRc3PxtPi7mSJuR6WjcBGPhXZ8Kro0qf4pZ/UYhDL8rOUoY8zGH3v+ue+JTpLBlbivLDqavcdQex9pO8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny+lyu/S5v+lbPlL8rnvx4QtBe2dSkn0/l6+PnoTvYM=;
 b=Dvce4jOfKjqg2sF71lmO2XMxm3XPSM3Bw0QdqUGlwfx5cl7CrCHuOa1XZb0j2cd2x40iyzIuzN1M/rG21/Em6SmYuNjbDUamk/oXpyC2mZz6kzAxKXQQAVCCer4/R36mGnKzoxvEa/eV5RC22IsUUPF0Rp1L1UoRwKb9otVMmJA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 08/13] libs/guest: make a cpu policy compatible with older Xen versions
Date: Fri, 30 Apr 2021 17:52:06 +0200
Message-ID: <20210430155211.3709-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 021b9f80-ecae-4de7-3e04-08d90bf03832
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4218CBE35129181273973FC48F5E9@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C8JoGvBBRnntcIaSCDbMGdpcjWIYAufPqmXIjCYVjma285FnQqPCmw3nr43OjHjmiBPglZTY/OqG9rq3E9e1vuWHovpQ9sTzjr04E1BIX6KtWutI0ubWElBf9ikfmffGjpInjTBh8/1Mx7cs//69czgk54oh3t53gECGc8qcOlsYibQs02lLwC2SjgkUeCJTo9rsfb7mZFTbZEv6KuPLrkatpyjSUkzJXYfNvZ0a7lsckYob17bK8CuTTd8jbu7bfd4J8GOQ+wWWbDF+vQicPexFL7w1GlUMjeVyvkH3AL4p5zH1wAVOFbggifqLTt5mS5nD1K8xirPhCBniVcnzJ6ythBjmqyVN410qDIwK21Ne+DuCr7GAXs/7Ie8eYxKFAKITeQ72E6xbTn503k6+yE/6RubI5EOU+nRUIXSGnqZrPIaZJZzM7wvw+XXNF88PPoXwv6CvrnaVZb6t9wWFibrgSwICFwOCPlT1sLP01jq+K9k+gaOjEF9qQEh+2VsYmJahw1Cty/fQOXS3Hj7AaRUBxoRMwdtkOfBiNCDe4Dzc4WNEQ5vpsYURxgel41FI9DTFI4m8LEW1Wa9Y5l64CFvPly0F7WdmO2eqxSKqrf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(478600001)(54906003)(36756003)(316002)(186003)(26005)(66476007)(6666004)(6496006)(4326008)(83380400001)(1076003)(2616005)(66556008)(2906002)(8936002)(66946007)(38100700002)(6916009)(6486002)(956004)(5660300002)(16526019)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1Q0c0ZWelFMUTh6amRJTnFyaFhmWVg1SGhTbCs2U3ZURUtOQVdSdStrS2JX?=
 =?utf-8?B?V1NIMnF0N2F0MzViQW4wN2ZRaVYxYjQ3N3VaTGRvOTlxZEpydnl5UmJtcUlR?=
 =?utf-8?B?dnFhckJUZ2lRcWpFWHM3S0d4ZjN4WnRLZno0dWQrd3FpbTllc09NaG0za2hj?=
 =?utf-8?B?SnJGZlhYdHpNWXNGbFh0TFk3TU9uZ0tiT0hGMXhUWVJtRWpoWFZDeXFUZDdo?=
 =?utf-8?B?ZjFwMEhXMWhDcE83YkZMSzlmTEpvTmdGVDc4dCs4d2NwaGhFOEwyVXdFNStl?=
 =?utf-8?B?bEhvT3R4cDBoRkR0emJXQVhSZWlIT3lhS1ZNcHJ0VDFBSlZ4ckZTWWJvdm9K?=
 =?utf-8?B?MWh5L21lNmdNaUZNQW4weElEdU95Qjc0ZzF3TUFiQy85OE1Da2JZSndOeTY4?=
 =?utf-8?B?emVtaGwrUnA1am5ZU25HczdxU1NVeFFTREpYbFNuSFl1SFJEZVJnNGpZWDdZ?=
 =?utf-8?B?OTdPVDhBY2RuSjR5Rkw5eFdqVmcrNTdqSkl1dEgvMkpFeEZZMVJyWVowRDdY?=
 =?utf-8?B?Tkg0UUJyQ09xWFZoZU5KeXNlWmNhajNQSnI1SS85L1VTRlMvenBTQWRsUXQ3?=
 =?utf-8?B?RHdwcWs2TmkrY1BEeGdaaTVKVTRVQWRoSE5kM3JaUHlCV3BtT001ZzZaa3Va?=
 =?utf-8?B?NjcybXFSbWRuUG5WeXNZTGMvRVJ4Y041bUVBeWlYckJ5UzhsUkNlZGl2Mm16?=
 =?utf-8?B?U2xDSFRMbWg3QUhiZUlrc1hqR3hDc3lkY3Q4WWlFQkN4V05Pelc1RDhuSG4v?=
 =?utf-8?B?MkxLc1prcTVTNzN6S0JSL2x2ODdZcDA4UVE4dmVMcWcrOGcvRjNrZlhVT01s?=
 =?utf-8?B?MlNOajJ4cit5ZEd3cDl3NkZNUUdUaW9sVHFMUlVYb2NMT2JqYUpzOWZUY2Js?=
 =?utf-8?B?Mi9CK2VkdFZ2Mzc2YjR1UUJOb2d4YXZtWW9tSkpKTm0vOEhvNkFmTkFObU1S?=
 =?utf-8?B?QlRTTStGVTF3dUNHQ3RId241YTVzVzFBdUdJUDFvODVtRlNqMm5DdGNmbkJX?=
 =?utf-8?B?VStYODN4aW81dGJJNDk4T3lqZXdQUitNVFhnK0R2NkxPdmhCOXN6OEFKKzQv?=
 =?utf-8?B?eXJPaWcyVzBCOTgyYzJVSXgzOVUvbFpxb3pUVzdROVhTZ1lIQklJOUpnR2F2?=
 =?utf-8?B?MzlDcVhDdlhFdWl1MHpJNFpzZDBsM1FMRFJjTTF2S0dBai9pL3kwRkI5VS9l?=
 =?utf-8?B?Rm9IQkZ4YjJnS3hLb0psWElKMURPRTZmek5HbnU5elJPeks2YU9EZ3BWczF1?=
 =?utf-8?B?bjFybTlrVzRoOW1CelpFRE1aSWg3VkdmVGtzYVBJZEtoeVNkbDlJdHpocit4?=
 =?utf-8?B?ZmRmcTdvUlZmcTQyUnl2cHhvTnZQM2JVQ0FqcUk5cldSVXBjckROdFZxd1NL?=
 =?utf-8?B?bFIzZEludzllTTloaFVQd3QwZEtNY3JnN3d6WmZXaUtIcmwrbkdkdVptVGlp?=
 =?utf-8?B?b1dNTi9wd0J1NmVCZUtoU3lJWjViYlIvdXRMbjFxb25MZVI4OEdDNDZLNmkx?=
 =?utf-8?B?N25IL0NaWGRVT1ZiZGY5MVdzS3dIZWdsZXJTL3pYVHBnd2ZHN05wY3FEUnE3?=
 =?utf-8?B?Y2tmY3A4VDk5eGRmVDdUVmFBUUJQR3UyK09jdmF4bGh0UndsSFRxbXJHMDV5?=
 =?utf-8?B?TWg4ZFFuNG9uQjAyQnJjU2dSM3BpRUIyNXpzZjZZQnlMUWVTL0JOcU1nRG5p?=
 =?utf-8?B?b2ZLR0svY2RLRVlaMzMwY3ZQbTVVTjRJRW4rYm41OWJGWjk1S2l3UlRPUFZS?=
 =?utf-8?Q?hMJJeXDjuXiG7/YlZz18VwpwOHUtxMpm+rbYM/6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 021b9f80-ecae-4de7-3e04-08d90bf03832
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:21.4420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAm/6gzXIVqjFoEN3IEUAjdu8WwFhwFm3foX32K5qsTmLNpwgZRM1y62B0rt+Td24tjw3MsdAycP77vbwqRi8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

Older Xen versions used to expose some CPUID bits which are no longer
exposed by default. In order to keep a compatible behavior with
guests migrated from versions of Xen that don't encode the CPUID data
on the migration stream introduce a function that sets the same bits
as older Xen versions.

This is pulled out from xc_cpuid_apply_policy which already has this
logic present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Move comments and explicitly mention pre-4.14 Xen.
---
 tools/include/xenctrl.h         |  4 +++
 tools/libs/guest/xg_cpuid_x86.c | 58 ++++++++++++++++++++++++---------
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index c41d794683c..89a73fd6823 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2627,6 +2627,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
                                   const xc_cpu_policy_t p2,
                                   xc_cpu_policy_t out);
 
+/* Make a policy compatible with pre-4.14 Xen versions. */
+int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index be2056469aa..855d252e067 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -446,6 +446,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
+    struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -510,21 +511,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( restore )
     {
-        /*
-         * Account for feature which have been disabled by default since Xen 4.13,
-         * so migrated-in VM's don't risk seeing features disappearing.
-         */
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-
-        if ( di.hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
-
-        /* Clamp maximum leaves to the ones supported on 4.12. */
-        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
-        p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
+        policy.cpuid = *p;
+        xc_cpu_policy_make_compatible(xch, &policy, di.hvm);
+        *p = policy.cpuid;
     }
 
     if ( featureset )
@@ -1086,3 +1075,42 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
 
     return rc;
 }
+
+int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm)
+{
+    xc_cpu_policy_t host;
+    int rc;
+
+    host = xc_cpu_policy_init();
+    if ( !host )
+    {
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+    if ( rc )
+    {
+        ERROR("Failed to get host policy");
+        goto out;
+    }
+
+    /*
+     * Account for features which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    policy->cpuid.basic.rdrand = host->cpuid.basic.rdrand;
+
+    if ( hvm )
+        policy->cpuid.feat.mpx = host->cpuid.feat.mpx;
+
+    /* Clamp maximum leaves to the ones supported on 4.12. */
+    policy->cpuid.basic.max_leaf = min(policy->cpuid.basic.max_leaf, 0xdu);
+    policy->cpuid.feat.max_subleaf = 0;
+    policy->cpuid.extd.max_leaf = min(policy->cpuid.extd.max_leaf, 0x1cu);
+
+ out:
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
-- 
2.31.1


