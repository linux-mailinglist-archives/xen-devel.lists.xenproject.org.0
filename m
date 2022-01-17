Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEB5490568
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258051.443968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ods-0005AD-LY; Mon, 17 Jan 2022 09:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258051.443968; Mon, 17 Jan 2022 09:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ods-00056Z-BQ; Mon, 17 Jan 2022 09:49:36 +0000
Received: by outflank-mailman (input) for mailman id 258051;
 Mon, 17 Jan 2022 09:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9Odr-0003a5-7u
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c516d209-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:49:33 +0100 (CET)
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
X-Inumbo-ID: c516d209-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eVONsRSw0hM6kYuHZCuW/qeP6R5RsnCA7OOJoUtWPtM=;
  b=hikEAdke6STaGVZYabEFdGfgqxDGgQzx6dYzrDJduruhwHWJgKpzPv79
   0Pdn+b39wlOsoOa7zlPrmHsb9j+nQLvPumAiF/JiS8sYQZpqDEzFaFTAX
   bYqP3Axc3eYCiHgHL4/LXZ6drcvz8JdUyYCEXTrTVswHQA1x+t8E9NKNg
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7qHQzlt/Ii11qze0CWD93TdL234qqcewwzWkuESTdv9zyChvLFGu63M4ECBN/nTFeUl+LbB01D
 7V40RZl7zSE98bixaV+6nCiMcCNQLqBOdX0cLlzou3ZIW7ZJAe6wX8WI8gQ2HcWE9Vj51CRgAY
 5qwT3ITjfWd8Ci4nYkt1ziGb8brHI3RIXML492EGVsdXX16f0nftaHpa+eabxtizfmijCGnJ5G
 TMXBhXZEjNTfEN/BUQmch8zP56xD4pa39fZ9BQoCbYEObKVaK0maJwaPg3NyYpv63BywD+X+Mf
 XGISCvEPBjSicY7ch2yB6fcS
X-SBRS: 5.2
X-MesageID: 62131514
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+IiBLK+YQZ/Qd7nHUnLiDrUDZ3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 2QXDz+FM6qLZzP2e4wjad6y8U8GusLWn4ViTVZvqC48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhy+
 MpMrKeJRD0SN6bUl/ZecR1/CD1haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhm5r350XQZ4yY
 eILYid3TBXDbyRsAXMSGo4hwaS5t0jGJmgwRFW9+vNsvjm7IBZK+LriKt3OYfSRWN5Y2E2fo
 wru4GDREhwcctuFxlKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTW7kGGFpyUlVuBrGuYi5xPO6K7z+BqGUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb10qXFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3C94adu51qXHb7
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL5Jt0Au2EieBk5WirhRdMPS
 BWO0e+2zMUCVEZGkIctO97hYyjU5fWI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jOF3rghjmzK7bc2rnnyPjOvFDFbIGOhtDbd7Rr1jhE9yiF+Lo
 4832grj40g3bdASlQGMoNFDdg5bfCFrbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:+N5qzq8j4qk/FFh/l0Buk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62131514"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2FhsWEZVZCcOruOwcVZ8LMFvZtcgzAI/Fr6M4kIATCGrnB/BoeZ9yy0x6tge5+cdh+6P4NzFEPRwdaePLBLxm4yVLzdhj38sX+Hj1Cnb/HUHoj3O34sxqyxGMfxTvHt83GJ1YYxH2LN5mTOIXVg5UwBK6/ktRIXqdNQqPqSJFQIXyWcPHwJeaMCBGysTkbMzx2b+J3Oq5nj977XOoidsmEM2LGJYV6gQxOQjlwLnGH8l1vy9VeT/CKNOVcYmlYvifr420aqiVwQf9rAdWwDTBwflPWc1eXrGCkYG1R2cm1VIwcJwfz7+2daMs0opyK+5N5NAY0kGyEoB3P47M9QQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFYnv4t0Wef4nRu6jImjjppeuWl5RfgUPXEAxcSqT80=;
 b=bpReSdJiPvqaAKlHnqhJOUsJ1WwnFC33VOFnVnoxenpJwXjCCGx5cldMV3A2NsKg3nlteyDXaA+g4cMcPvkGPqdxWCOaRuTvR2Tn5IJuUeby6lqdqUwKRO02zWCKsFtipeBTQu0BkWV+nW01o7MluftEivWcSdQoi77dGf/8xyFo9HoU7X7SOIobUS8Q9XfJ7pZ8ioN8Ei9lv+Q28qpa+tGqMarXMytj65Ac5LmTSb0VJ6tDXUQRAQj4y7cSKYGcvXHBXs5oqbhIgD63aL3d90siLl0zKp4Pw+dXItLcBxzKLGkaNVjNoF4DHrvHc9ZL9B3UZZuu5XKrZ2TISlY9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFYnv4t0Wef4nRu6jImjjppeuWl5RfgUPXEAxcSqT80=;
 b=q9inYwliNaH60OJhiHVfp48EbMV+Z7pNlva88B1iottH+6lIUt0P2SZ3ks6VMp+5E/TA7JwdLbQfzm2WL5N1NwKhr+bmq7cyl+p+0CypkuOYuyoKH9b8xNfEYwtugL/TOe+PJWSk7O9X8WT5ejjEQ5g8mb9FMsOoY4TPyAUIRXc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 06/12] libs/guest: make a cpu policy compatible with older Xen versions
Date: Mon, 17 Jan 2022 10:48:21 +0100
Message-ID: <20220117094827.16756-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::36)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cd6b8d2-0b74-42b9-0352-08d9d99ea780
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059533F4CA152FDD84901A78F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vLTFKxgK5QjXR4b+ancHUcdab0gwtDa9VhcpSCH8g9GQayELBAKh/7zC8e4FiVjbq/spCkdjTF8nSvE2gaWFxsNMRpBoAzobjdqmiJ5mtZz+8pVeCcfJJdOgerJNsn2pRQ62AsDdfWEEL4S1Sin3L5us6sihprSD/Xq1zJIJhXkQKF3I0dWz9nM4EI1Q8VRUq/nNOL7FvBzdDT6CLyRNdSa2I/FyW73MTP6D+bDaxqC+vUAW9/SdQKjnXbGEe3r/KRzxQWemE2zmwZiOP2+Q7ciyCqRbEiHlSIxveM+/XBgECp/Qbny312+tfRXJsBut0dxGHAqu8me9kqVmLeJbq67xaYllproDMIJbW4skrUAcou5MTZGNxBFX5/rSnCI16RwSOMVny5kxa0VgRFazweBJbcRlstNEw0oYU04X2l6QIdZxp57FMsgcQ3nkW+qfillw2qckmjA88uNcwcG3vgAvp14bawjI2nAW9pUj5RswbDw9D4/8cUKcgowl2sq9cIzMGJKAw6yaRwxqCrdwfFo+wdWTGSg4zA92+UnBSJbWvYnNhm4zN99QCLmBFFu9I/9mMWwKWnBbBDEfIc0m9BkTZdajHgfnP5b2dEpGF8J13KkJrS3gW+Y8UyRRgfWg3RZfT5BCo3m7fcTEbPaRfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TldtSWJsSEVmUEN5ZW93Ukk4UmlRMXg5NGZKZnZRTlEzeFh6ditwNmNUVHVk?=
 =?utf-8?B?NVBPQi9yd1RSUCt0eFAzQ0Y4c2d0Vm1MZUVJeUF6OXA1cmdRVURMbmY0V3dt?=
 =?utf-8?B?NGppUFVXL2pPdlhybDRlTzdzSWltbGxZaXAvTlM2RVF2WVNydjdtZU1NUDVM?=
 =?utf-8?B?eFE3SUJwdGo4cnUyWWpOcE1rKzNES2FGSHB2b1MwQWtpSzVURXArRlBSMmRC?=
 =?utf-8?B?MjN1SmFTT29VVTJLbkwzbC82SnA3OFhXNDBlRW1xUXlpUk1Wb0t3b25TNW14?=
 =?utf-8?B?T05nem40OFp0TFd1cnQ1RGJNL1JBSjhXdTlhSzRESGI0L25OaEVRZXlvOXhr?=
 =?utf-8?B?YUN5cXozQnRES1YxZ3BhNGN6Nk03WWp5T0ZydTYzMXUyNFhRRG1JMWV2R282?=
 =?utf-8?B?M2pKWXltVEd3MkNMK1BlOTJIUDV1NzBTbmM0djc5QThpanNEK3l6QXF4V2d4?=
 =?utf-8?B?SUI4RU1PN0U2QkZZQmhXTUZpZ1dxOUVabG9QYTFrV2syRmFLb3RRQ3dROTJs?=
 =?utf-8?B?Nkk0SU9UcUp4dkd1WDBpWFN4bjFFOTN6alFQdHBCVFZ5REdwMTZ1MDZneEhE?=
 =?utf-8?B?YnVwTENUZWI1L2dBQlpuYmEyQTJ3NXJ5bVhTcS9ORTRteXJIRzZTL3hNR2p1?=
 =?utf-8?B?U09BK0habEZsK3E2L3V0TFp3S2NrU1pES1RQRTRHWHpwV2RlYk0wMUNkUjBr?=
 =?utf-8?B?YktoVnhST3kyTTZPcXBRUEJwRjJzdkFXa3dhOFR3Q2tZTFRvcDFVZCtMOWlN?=
 =?utf-8?B?ejhCb3NqK0RWMVhFV0d4bFhEaEQ5V1NvWFRVemg1R2lERVgwc0hxdVl5TnIx?=
 =?utf-8?B?aHhiUkl2em5EMzd0QU03V0k0QTJpdk5TeCtDRTd6VGZjMmV4TVp1Z2Z0NFJa?=
 =?utf-8?B?REhZUmJaS2l4UVUwbWFUcUpQUEoxVmhJWlJXaWl5WEwxY3RldzlUQVFUcng4?=
 =?utf-8?B?SzE5ajZYUCtVL1VOZnNJdjZ3aHB4SHRjRFRBYjlJTHZxQnZSdEhZRDdCbUY5?=
 =?utf-8?B?V2R0TWNUMDZBc2MzUFEyS2k2OHhhdSs1WDZnQUV5S01ZclYrcE1taFlOVEky?=
 =?utf-8?B?RWNneHVWb1JkVTR0dXNSTFhaR2ErcnlKZDdLenBmckZsdVlPNmFiZVVhMGJx?=
 =?utf-8?B?ZjgzTHE3cVBsUW9ST09MZTRHZHlYOHVUNENCUFZhS25CT0tucE9qK1p4NCtE?=
 =?utf-8?B?bHRkMlYvZXVyYk4zSFBLY1E3SlFPd1NQUGVRNVhnM1hMRldQTXhXYlpSRWpM?=
 =?utf-8?B?SXA1cUthNnFoWU5MVlRNcVpPK3BMTGU0L3lYeE5wUWRlWTY2cWV3NEVrUE55?=
 =?utf-8?B?YTlMN2VKQ2hOY2RaaGgxa0ZNc0JMR1hDRWNCMVkzUUlHWHl2L0dqbkg4MWw3?=
 =?utf-8?B?NFp3eHRZOHR5d1BnYTAyQlViZG81NmJtTkl1M0swK2tPbmE3N3QvU1NNYWRS?=
 =?utf-8?B?WjlFMjFFekU4MHJDVk4yekp6bXlDZnhkWXA2VkdINHk4aFVOK2RlMU5EOEdY?=
 =?utf-8?B?TFh5UHZsNSs2RjkvMUlVdnV2ZE1xNVNQclNuODdob2R1UGFrSW9nRjFFRlRI?=
 =?utf-8?B?NUhoLzJ0eG16aXphOWJYaHlHdUM4amhiSzJUdDNQU0JJRFFhWEdta1piYVFZ?=
 =?utf-8?B?WkFyZEs2enhISmRGeTZKeTY4K2RxcWViSGE4THVMSDNETy9sb1IwMnRFR2gr?=
 =?utf-8?B?ZkxrUWt3YkpacFJVcy91VGhjSmw2YW1IK2J5Ty82QU1XbXJBN0xHK0VOWDdi?=
 =?utf-8?B?SzQ0QzVrN0EwczZ3bXRVN1FJQityTUo3ekJBcnpSa1RnTTRTWXdnNTcxeDBm?=
 =?utf-8?B?NDhQYzI2bU8wcVcveWQ3MDEyQytCbXBWRzd2OE9jSExxSXBBU0JxTTBjNXBK?=
 =?utf-8?B?WGFjZFg1ckozVkZORi9jeFlsM3VpSjNQWFNTTjZaOUV2MzVxYmw3aEo1anda?=
 =?utf-8?B?MGJoaytISVc2SW9XOHBLdk1XbFJnYkZIWGtlL0RwcDErTzBaK3VPN1EyZEJT?=
 =?utf-8?B?K3FBSFFHREVGVGRjSnFYWWZ5RWpTWVBWNDgwZFBsRDVLYVVNNHdUUCtHb0Np?=
 =?utf-8?B?REhuQ2llMjgrcktHUVg5TDhlQWpoYkVUcytkNytlUTZ3VCtjajAwUHZRZ2cr?=
 =?utf-8?B?MDFpemNpM1FIenNHMURmWlU0OVk2M3k1RUluUGFaTzgwL0s2NUxIQXo4eWRV?=
 =?utf-8?Q?GkiZrBbo3pXMiSMSbTfzLnM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd6b8d2-0b74-42b9-0352-08d9d99ea780
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:28.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCPhTdOBDyy2ALw6YmrF3aNHpHHkwmmz5Nkp+HMzM2+UYawVlaLA6mz4ufJ2PTAXC40VhmN5kZYrueVtJGAQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
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
Changes since v3:
 - Rename function to xc_cpu_policy_make_compat_4_12.

Changes since v1:
 - Move comments and explicitly mention pre-4.13 Xen.
---
 tools/include/xenguest.h        |  4 +++
 tools/libs/guest/xg_cpuid_x86.c | 62 ++++++++++++++++++++++++---------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 2672fd043c..281454dc60 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -817,6 +817,10 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
 
+/* Make a policy compatible with pre-4.13 Xen versions. */
+int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 67981b1711..f1115ad480 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -432,6 +432,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
+    struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -496,23 +497,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( restore )
     {
-        /*
-         * Account for feature which have been disabled by default since Xen 4.13,
-         * so migrated-in VM's don't risk seeing features disappearing.
-         */
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-        p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
-        p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
-
-        if ( di.hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
-
-        /* Clamp maximum leaves to the ones supported on 4.12. */
-        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
-        p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);
+        policy.cpuid = *p;
+        xc_cpu_policy_make_compat_4_12(xch, &policy, di.hvm);
+        *p = policy.cpuid;
     }
 
     if ( featureset )
@@ -918,3 +905,44 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 
     return false;
 }
+
+int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   bool hvm)
+{
+    xc_cpu_policy_t *host;
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
+    policy->cpuid.feat.hle = host->cpuid.feat.hle;
+    policy->cpuid.feat.rtm = host->cpuid.feat.rtm;
+
+    if ( hvm )
+        policy->cpuid.feat.mpx = host->cpuid.feat.mpx;
+
+    /* Clamp maximum leaves to the ones supported on pre-4.13. */
+    policy->cpuid.basic.max_leaf = min(policy->cpuid.basic.max_leaf, 0xdu);
+    policy->cpuid.feat.max_subleaf = 0;
+    policy->cpuid.extd.max_leaf = min(policy->cpuid.extd.max_leaf, 0x8000001c);
+
+ out:
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
-- 
2.34.1


