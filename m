Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F482461B1D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234680.407296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiH-0001Gg-6P; Mon, 29 Nov 2021 15:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234680.407296; Mon, 29 Nov 2021 15:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiG-0001Cc-VK; Mon, 29 Nov 2021 15:37:04 +0000
Received: by outflank-mailman (input) for mailman id 234680;
 Mon, 29 Nov 2021 15:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrihO-0003uH-4A
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:36:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11e70a01-512a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:36:08 +0100 (CET)
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
X-Inumbo-ID: 11e70a01-512a-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=cid3XAEKeAP1zvjCEhGe8Q+Rh5AudOlwxXpnQ/D+76M=;
  b=D7YRZtuC9Qv1FbbJLHoPb/zijylAfpzlLlxDx/8zTMlB2e/9lCS5fAgG
   4P4x/EHuiDG7RGiJXODgnpsKl2JU7C26bF06y0VOWWmt7KKjLxlG8yXB/
   crHBzjayRp6B1yue9mfAG5Wwx5m1sg0kWI7FTADtLRMdbB1GhuuFVDIC1
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: B4v6gXUxgBwGSnstuRy7V2RnsUdd63EnUBcaT1YlZWd0ghCVNdwkmqqcSUWEyj84wNwFs62BkC
 jcLRE5sEffUNfljy8t6nHbfws5boBRDjtQ9CItU+F8Poe8eAMDTzMXjcWGby2e7EqjBidYz7HS
 wFfA68q/NhpJBjI5bog/UvfOMhwaSnXPqudTqQPbC7G29kYGUVCeUT9D90Qk9U3FeDxwVwNXIy
 X9VrxM2EPTpSPzAjEuAvNRYirIyABnThFVrz5/I18pkkKKrnBK4EK2dSzut6NY3/MQo5gsKOIp
 H/a3Hd+AdE+HuxGVQ9VKFKoX
X-SBRS: 5.1
X-MesageID: 58835528
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LT3YgqPalrDi9fLvrR1ZkMFynXyQoLVcMsEvi/4bfWQNrUoq1TdSn
 DRLUT/XOPaMYzH0ctxxbYuw80sC7JHWzINjTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Egyw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozG5otIp0
 I1wj7GLZyI7eanRvNsxVyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iatYQFgW1g7ixINczua
 vY4SCVSVzCDah1gIVFQB8hkzPj90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiR8pPmV2Dj
 nnb5Gm/CRYfXPSe1jit4n+qnvXIny7wRMQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa9kamU938VB2Qu2Ofs1gXXN84LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobTga6
 13Rh4vUPxFUnpiHDnaA0oi4qQrnbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr1/sCRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHHVKAnuNOvwjxpgDNE7qQQxd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0Nv8uOd7uUZ9znfSI+THZuhb8NIAmjn9ZLlHvwc2TTRTIgzCFfLYEzMnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmrflA7RTp/UqCJmtvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAgRDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:W7YCta59Pq79uJm9iQPXwVKBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsiaKdgLNhQItKOTOJhILGFvAF0WKP+UyDJ8S6zJ8n6U
 4CSdkONDSTNykCsS+S2mDReLxBsbr3gJxAx92utUuFJTsaFZ2IhD0JbTpzfHcGITWvUvECZe
 WhD4d81nCdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn9y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zX0IidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6q9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFL9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc4a+d
 FVfYLhDcttABGnhyizhBgr/DXsZAV9Iv6+eDlDhiTPuAIm2EyQzCMjtboidzk7hdUAoqJ/lp
 b525JT5cZzp/8tHNFA7dg6ML6K4xT2MGrx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58835528"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Esp0zRW9PBuH+gQ/JawkliNQ3i41F/M1gUIC+BILNbUcUjAGFldyrKHn8Ojpg9Nno4/kkqqFygNFmZ5vW1Ahy0r26bvqwd5ZYJTv+a5okm6ZhcneIQ83Ii79kIwXq8+/9uShA+VxPGZeUGCuwwGnYRLLHl5UUoKXt6ii31HG2CYKZngGRGOLK7+MZaphwXZ1oeOb9ZZyULTRw5jiNwyGAkGJCVvqe4XPHXbCoClpRRU9NZ3lfr261yiM80lGgBCFJvQq3H73/T3cGR+6OGJhk7Zc/lXj5p/pn0TuMRpzlAhX46Vdq/C+nW4uETFY73MStIAyVyMwTMkZY8GI4o9paQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU77IFnPQdUFFfhSMm0buGRsWwFsG5UILU9PerQjkho=;
 b=Qj41x4ZCsMHtry0+08tSRknEF+nLUTbCYQ0k/D8iP2YGUUoRHDuFpjsXO/H3quGjVaff6dMrSAGDr/RHuEIYqSxzqtfmomLJlDDOwU7ixJzX5IpzMUd42H2twbanjICrFsGnc2fUW8Hw/hiYvGQ9iVNfFHmR3wC/01cB5jzoSgI9Agx9SyTQXj/tBhAGJvup2ljEQmx+8Wj7bFxmT1jLW+GY53hRvUocbOK+QOP+yLL7EUUzyjrnVE2A3qZc0rNYKbzoP6IB2t4gmRfPsifhi1Wi1DlMmccL/5pY7DSjodmZgjVRIixXA5pGo+XZUPPycuVFr4rgOgxX9Wnx0yeLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU77IFnPQdUFFfhSMm0buGRsWwFsG5UILU9PerQjkho=;
 b=Zxm8+FrkL25l5mCu0rs2U0CsrQdWa6F4BEk3Z5gzJpL7H0ca+JduYzuuI0+nCfVZG9lI84uDmt/Sg+fSfG92YULi4DZyTRCP8G6BAdld2G/pKqluKeaGm3RNWWNIgu3+Dpr65slL3JR2wZIa80Bpa8S1w1nM7qqdVG7O0LACqwE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 12/12] x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents
Date: Mon, 29 Nov 2021 16:33:55 +0100
Message-ID: <20211129153355.60338-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96ed219c-5b5b-4d5d-a8e5-08d9b34df463
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5340E089E1BE85ED48E7ACFF8F669@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfgNwBbbiUJEu178+H2t7awtUsqrhQq3T2yMgL3PbtqR1Fp/LUDB0YA7GuBqJIrnPv5+iMm+KZUuA4CFGHZKx+YNKV03Q4+f3i4fdzB9GYLVUMlObpEdywa0KAbej0OSsZAIkd6Of6jxXo14paj/aSXVRQOed2t8fvB4/pK7MlN4kzYvWAm4BqTefb8pkEVb/ZtymRezrnHcWTekkAa+g9ZtbpI/6udiQTpssdhDIMLwYANLhSJ0BOl3XCh4E38cVsPKqItxGLt8ayTNKFVcikBEP+Mdw+7xd0eMG+fsJVjqZ3nKKFOXv8iZoXNVYMOUbCu6AeOl0FP/SGC1XH4yhROoTVMkV7nJrIWpvtNhPKhCN05n418x1W0KzEly5U/YF3ZTT7z335JSg08V0/2+orQsKP7SWtU/ceqPN/+J0MOaikzcGtkmqvkDSuvJwRwxNM80/Ke5FFqMpGldSKWnE1bITi1wAipO4af08wowl5pI9gSjnIyIGTHhPud133B1vxpNBVIyfSm7I+KoWtka0y7cXbN4nagWBx8o+iUlVJPFK4J3VSLS0uD3N0bjrHJQmmIYsNUjbpMk4oYeb/R4f3E2lesteER9mnYlyZ+0AGZ7kC63RGSf5YtSi4SuHh7GnH8Z4Wzz1zH1tPt424aQMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(82960400001)(66946007)(86362001)(1076003)(508600001)(5660300002)(8676002)(107886003)(6486002)(316002)(38100700002)(6496006)(26005)(83380400001)(6916009)(66476007)(2906002)(66556008)(2616005)(956004)(8936002)(54906003)(186003)(36756003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUVnWnkxcmdKcHMwbGJWcUdxZ0tqZzlPWTdOWTNiWjc2ellWUlVLVWtaV2Jl?=
 =?utf-8?B?QldmUjNpRk9YUklCTXJ4Z1p1Z2lCSEVGbW0vKzNpdk5ZcHh0M21HSFk4TWhv?=
 =?utf-8?B?RGV1cHI0TWE1Q1UxZFpwTUNROUJiMy9UZzNlSXJZT0NUQ1R1VFdNTE9PWVp4?=
 =?utf-8?B?SVVTM1B4bytPVjlhLzNGaXVUOUxoeUZTalo2d09wWHd6djJwbDNaWDBXVVFi?=
 =?utf-8?B?RVlaMGVsSFhRcXZXNG00NmJad2Z4cysyU3NYR0dwck5wR0FRR09qZEJXRlJT?=
 =?utf-8?B?dG52TG4wV2JRWkZRT2RHeXcrRnp2aTZnRHNrbEJLYWN3S0xOMGsxMDRaTzlC?=
 =?utf-8?B?V25iVHdNTDl4VHdoR0cyZFR4RXhIaVpQbDFvbGVpZXlodUFEZEpSQW5Lb1V4?=
 =?utf-8?B?TjE3RW9Pb2N1dTVRZFFlblBKcDdhWkc0bDlDVHp6VUI1Zk8wRTZGL0oyeFhZ?=
 =?utf-8?B?OXhwUWJkUGk4WjFZQWI2UHp2MXM1eDN6UnpCTkx2aU5NZmhCRks5M0lJMHZE?=
 =?utf-8?B?Tkt4b1VRWEpqZFpZUklEcmE2Qk05Q1VQUmZlY25oTlAxZFRwenIxamZFMDha?=
 =?utf-8?B?eFVRa2pUNnhEV1BaL1pvaUZ3b0NxUi9RUzQwaWlXWkdJRVp3MWI2VUxNTm9G?=
 =?utf-8?B?bElNNlZqa1RRc2w4TzlqMlp0bHA0eFBEK3c5WmpPbEJUTDVDdngzOFJqa0Zn?=
 =?utf-8?B?TFp4YXIvK3VzcW8ycHh1eEF1YnRzck9VTllsRit4dWEyR0JRQ3Jmemk3a1Zh?=
 =?utf-8?B?UDZ5djVjd1pSL09kRjFuTFk5OFMzYWNWRmpPUVBmQmZLOVhULzBGdXorcUhD?=
 =?utf-8?B?TkVsb3N6UitlSFJiRGJFUWp1eFlMUENLaTlOWHFjOXhGTHlheHIrbFZpaWxV?=
 =?utf-8?B?TSs0SVF4Uzd2V1hOcUZzbUROVlF5bko4SC9nVkZzeUhyT29RbXNEc1Q4aXFo?=
 =?utf-8?B?SnhzMjNFM0dwemxVa0wwem5nRWRlL3JHZ1hjUnE3MVV1WWpWU0NTQ214MWZH?=
 =?utf-8?B?cG1KY2lqSDFQbVdrb3J2YlpsKzIxNlRBdjNrVENmWXlKallMZVF0TkMyUVpC?=
 =?utf-8?B?UGpOTjJPUVJYelNCQzdtdUpiUll6bHIxRExpeXEyNSs5RmVsbTlUWEpBbW5q?=
 =?utf-8?B?UXpLY243WnBIK3dDRkIyYWp6ZndBWVZodCtsbURyYkdZOUJQMFF2RGYvRkFD?=
 =?utf-8?B?dFFLVHdTV0dmajB3YUxsNFdaQVFTdFVvVGVxbUo2dmdyZk9tV3pCMTk4TWdU?=
 =?utf-8?B?Y3kxNzJnY3hiS3lrSk94ZmduOGFaSVg1N1FNRktVUzNueU9laWxmYTk0MHRK?=
 =?utf-8?B?NjFNbCszS01vU3dnTTd5OHpKSjhHUW9TREt1RjdCOHZqKzZReFYweXR5cU9P?=
 =?utf-8?B?WlBnd0tWK1FsUWdJVHJZUTRKMG1MVmZuSUVlL2VhUGo4Wnk5KytWQ3lVVlJO?=
 =?utf-8?B?bDAwdFdUelYzeDlwK0lFcW92ckJPbUhDdUdCYUVDSnRNMytkQkZ4eFE0TzUx?=
 =?utf-8?B?ZFRlbXVqdXREWmlNQkNDRzBsMDZoVXo2YUhrRlpqZmpVN3dDdmwwQ3J3U0hk?=
 =?utf-8?B?REVDNDkrUWhncGYzeFBjTHFBb1N3VzlmWjFyL2o0Nk1vcnQ5ajBRUnlNWVgv?=
 =?utf-8?B?WHMrMlpGOVVrR1N6WlBLUFY3MFlQbi9qZHBQblNvenBrZTUrWUNtUmFuNlFJ?=
 =?utf-8?B?ZlRpanpxb0JHK0NWWUpaNjd2YjA0N0daZW0wWGp4U0N6UkdZdHJydEJqSi9Z?=
 =?utf-8?B?TmxRRzBxZnR5bTViSTFTd25HU0FWczhGaDIwNW5BQzE0SHZnTXQ5ZmJLYXJq?=
 =?utf-8?B?ZnZuR2FHMUk1UDBRYUlYZHhHN3lTOUkzVUsxOGpkV2o5Ym00aHF5Z1lSM0Zs?=
 =?utf-8?B?ZVVmTlRGcUd2QVFsaHJCc3NFNVhEdzBYalU2RUN5bFhjd0k1dXJpSGJ3djZv?=
 =?utf-8?B?eDhSQ1p3RVVOdzJuc2FsS216blpYRzR5UUc0ZktuUWJlbmdXZ2oyUHhrZTVB?=
 =?utf-8?B?WEI1SHRLSDF1bXVRVFNHSFJMY1NReEptdWcxQ3BpL0N3ZVRyR0QyeGltdXIv?=
 =?utf-8?B?cEduZG1ZT2JuUm5ZQlY2dHFnQWlwanhyZlVWcCtMZHlNY2t4Q2cwWEI2ejYv?=
 =?utf-8?B?dFVELzBKOWZxNGxXZnRvaTlPdGJUSmNqWkR0dFlndTBvRmhZVUV2cjJRYXhF?=
 =?utf-8?Q?NKguk43l83cPLLzh1pHMmwc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ed219c-5b5b-4d5d-a8e5-08d9b34df463
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:36:04.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDdqEpq1BnLeJaf/c/3DOVqqgkgpZ739P2E5Q6nlHmLCg79syoxAmg3rtXquuFetNyToN4zPkrrna7htJslb/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

From: Jan Beulich <jbeulich@suse.com>

Zapping leaf data for out of range leaves is just one half of it: To
avoid guests (bogusly or worse) inferring information from mere leaf
presence, also shrink maximum indicators such that the respective
trailing entry is not all blank (unless of course it's the initial
subleaf of a leaf that's not the final one).

This is also in preparation of bumping the maximum basic leaf we
support, to ensure guests not getting exposed related features won't
observe a change in behavior.

Note that such shrinking is only done when creating a policy for a
domain from scratch. Migrated in domains keep their previous policy if
present untouched, and for migrated in domains not having CPUID data
the crafted Xen pre-4.13 policy is not trimmed to keep a behavior
compatible with those older Xen versions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - New in this version, picked up from 540d911c2813.
 - Only shrink policies for newly created domains.
---
 tools/include/xenguest.h                 |   3 +
 tools/libs/guest/xg_cpuid_x86.c          |   5 ++
 tools/libs/light/libxl_cpuid.c           |   7 ++
 tools/tests/cpu-policy/test-cpu-policy.c | 101 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpuid.h          |   7 ++
 xen/lib/x86/cpuid.c                      |  39 +++++++++
 6 files changed, 162 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 3462d27516..e8b0d3ff16 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -830,6 +830,9 @@ int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const uint32_t *featureset,
                                    unsigned int nr_features);
 
+/* Sanitize a policy: can change the contents of the passed policy. */
+void xc_cpu_policy_sanitize(xc_interface *xch, xc_cpu_policy_t *policy);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 7ce0a08580..eca844b921 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -690,3 +690,8 @@ int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
 
     return 0;
 }
+
+void xc_cpu_policy_sanitize(xc_interface *xch, xc_cpu_policy_t *policy)
+{
+    x86_cpuid_policy_shrink_max_leaves(&policy->cpuid);
+}
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index bf710ba196..5b2690a7d7 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -689,6 +689,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
         goto out;
     }
 
+    /*
+     * Do not attempt any modifications if creating a policy that aims to be
+     * compatible with pre-4.13 Xen versions.
+     */
+    if (!restore)
+        xc_cpu_policy_sanitize(ctx->xch, policy);
+
     r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
     if (r) {
         LOGED(ERROR, domid, "Failed to set domain CPUID policy");
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 686d7a886c..20419a6108 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -8,10 +8,13 @@
 #include <err.h>
 
 #include <xen-tools/libs.h>
+#include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 #include <xen/lib/x86/cpu-policy.h>
 #include <xen/domctl.h>
 
+#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
+
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
 ({                                              \
@@ -671,6 +674,103 @@ static void test_msr_get_entry(void)
     }
 }
 
+static void test_cpuid_maximum_leaf_shrinking(void)
+{
+    static const struct test {
+        const char *name;
+        struct cpuid_policy p;
+    } tests[] = {
+        {
+            .name = "basic",
+            .p = {
+                /* Very basic information only. */
+                .basic.max_leaf = 1,
+                .basic.raw_fms = 0xc2,
+            },
+        },
+        {
+            .name = "cache",
+            .p = {
+                /* Cache subleaves present. */
+                .basic.max_leaf = 4,
+                .cache.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "feat#0",
+            .p = {
+                /* Subleaf 0 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 0,
+                .feat.fsgsbase = 1,
+            },
+        },
+        {
+            .name = "feat#1",
+            .p = {
+                /* Subleaf 1 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 1,
+                .feat.avx_vnni = 1,
+            },
+        },
+        {
+            .name = "topo",
+            .p = {
+                /* Topology subleaves present. */
+                .basic.max_leaf = 0xb,
+                .topo.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "xstate",
+            .p = {
+                /* First subleaf always valid (and then non-zero). */
+                .basic.max_leaf = 0xd,
+                .xstate.xcr0_low = XSTATE_FP_SSE,
+            },
+        },
+        {
+            .name = "extd",
+            .p = {
+                /* Commonly available information only. */
+                .extd.max_leaf = 0x80000008,
+                .extd.maxphysaddr = 0x28,
+                .extd.maxlinaddr = 0x30,
+            },
+        },
+    };
+
+    printf("Testing CPUID maximum leaf shrinking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        struct cpuid_policy *p = memdup(&t->p);
+
+        p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
+        p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+        p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
+
+        x86_cpuid_policy_shrink_max_leaves(p);
+
+        /* Check the the resulting max (sub)leaf values against expecations. */
+        if ( p->basic.max_leaf != t->p.basic.max_leaf )
+             fail("  Test %s basic fail - expected %#x, got %#x\n",
+                  t->name, t->p.basic.max_leaf, p->basic.max_leaf);
+
+        if ( p->extd.max_leaf != t->p.extd.max_leaf )
+             fail("  Test %s extd fail - expected %#x, got %#x\n",
+                  t->name, t->p.extd.max_leaf, p->extd.max_leaf);
+
+        if ( p->feat.max_subleaf != t->p.feat.max_subleaf )
+             fail("  Test %s feat fail - expected %#x, got %#x\n",
+                  t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
+
+        free(p);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -787,6 +887,7 @@ int main(int argc, char **argv)
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
     test_cpuid_get_leaf_failure();
+    test_cpuid_maximum_leaf_shrinking();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index 050cd4f9d1..86cda38986 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -386,6 +386,13 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
  */
 void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
 
+/**
+ * Shrink max leaf/subleaf values such that the last respective valid entry
+ * isn't all blank.  While permitted by the spec, such extraneous leaves may
+ * provide undue "hints" to guests.
+ */
+void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p);
+
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 924f882fc4..6a943cd91b 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -236,6 +236,45 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
+void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
+{
+    unsigned int i;
+
+    p->basic.raw[0x4] = p->cache.raw[0];
+
+    for ( i = p->feat.max_subleaf; i; --i )
+        if ( p->feat.raw[i].a | p->feat.raw[i].b |
+             p->feat.raw[i].c | p->feat.raw[i].d )
+            break;
+    p->feat.max_subleaf = i;
+    p->basic.raw[0x7] = p->feat.raw[i];
+
+    p->basic.raw[0xb] = p->topo.raw[0];
+
+    /*
+     * Due to the way xstate gets handled in the hypervisor (see
+     * recalculate_xstate()) there is (for now at least) no need to fiddle
+     * with the xstate subleaves (IOW we assume they're already in consistent
+     * shape, for coming from either hardware or recalculate_xstate()).
+     */
+    p->basic.raw[0xd] = p->xstate.raw[0];
+
+    for ( i = p->basic.max_leaf; i; --i )
+        if ( p->basic.raw[i].a | p->basic.raw[i].b |
+             p->basic.raw[i].c | p->basic.raw[i].d )
+            break;
+    p->basic.max_leaf = i;
+
+    for ( i = p->extd.max_leaf & 0xffff; i; --i )
+        if ( p->extd.raw[i].a | p->extd.raw[i].b |
+             p->extd.raw[i].c | p->extd.raw[i].d )
+            break;
+    if ( i | p->extd.raw[0].b | p->extd.raw[0].c | p->extd.raw[0].d )
+        p->extd.max_leaf = 0x80000000 | i;
+    else
+        p->extd.max_leaf = 0;
+}
+
 const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature)
 {
     static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-- 
2.33.0


