Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD444E5E4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225179.388879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVGF-0003mY-Na; Fri, 12 Nov 2021 12:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225179.388879; Fri, 12 Nov 2021 12:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVGF-0003k6-Kc; Fri, 12 Nov 2021 12:02:27 +0000
Received: by outflank-mailman (input) for mailman id 225179;
 Fri, 12 Nov 2021 12:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlVGE-0003jy-AU
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:02:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64aa63d2-43b0-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 13:02:24 +0100 (CET)
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
X-Inumbo-ID: 64aa63d2-43b0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636718544;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=gGKPDVNER29O7ogyDVkwEV5SwSuOORYhfCWBLcfG/hs=;
  b=D3gT7lCAaPaGT7/qTB9YAH/JZFTOdsXCnImnGMeSH8PwpqVXLs0r+leh
   Ys9/MOVV9ZUeNyKMHNn5uSL/+a6e6ckJVTTVC6cma/j7fXqwbuARU8wRm
   LBgf/SdMhlMRq3cv92kDagtjZaLcrZJkPCy3TTTAF4CVPw8h3lRqlytb2
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 15pCmuRw3yTb/LEeHbSMoRmWD48YpUkGsXNjxdvrErbDMVhDF1Be6beeT9Wvw3FvQOXxdWwV2R
 e5DK5ijm0RZCLfjKvugvK93IhhbyVVaXfSzNlCuSJfuAb14Mp/FNAirOfNCdR1LV6cM/UG9mD5
 k368/L0B4uWOs4/38kkOwzQW9ln1fSUsqm951EAPpnu+SdWKC7gR7qKiZx6u76MnFfo5EW48v/
 xetQXUBFrJleWKX8I30DRWFN2Hp1r0o8dn6z1MgQmv5u+G2XsTYkkYKK4TKbWdwJh/tFWntRSm
 5Smdk0RBA3SbZRBS+fctjeNd
X-SBRS: 5.1
X-MesageID: 57639326
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:95+jXKidfEFgyO04YuJgYG7BX161IBYKZh0ujC45NGQN5FlHY01je
 htvCz/Qa/mOYGKgedl1PY6x8kwHscKGx4VqSVRlqys0Hn8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1E64aCF0QsPZSSnd85XAdCMRpkF7BvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2Z4VTK2EO
 aL1bxJXUB2bW0NwMGsJDY05xNu3uiK8SzxX/Qf9Sa0fvDGIkV0ZPKLWGNrSfNObVcRctk+dr
 3DB+SLyBRRyHMOb4SqI9DSrnOCntSLkWqoCGbug7PlojVaPgGsJB3U+VECyoPq4jAuyXtNDM
 V086yMooaUisla2JvH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/HhvYUygxTnXttlVqmvgbXI9SrYm
 m7Q6nJk3vNK0JBNh/7TEU37byyEr8bTfFB24wbuAGeeygxnfqyefaa1wA2OhRpfF7qxQl6Et
 XkCvsGR6uESEJ2A/BCwrPUx8KKBvKjcbmCF6bJ7N9x4rmn2pSb/FWxFyGgmfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKFDvEMJGPxf4M4XRfK4Ey/xX1
 XCzK5bEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlebgXTMLpit/LZ+m05F
 uqz0ePQln2zt8WkMkHqHXM7dwhWfRDX+7iqwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwTEGmaoGpEMsGmxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JaL+i7JMqJOv+p0X2run0RxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkQ8S4YpxGrpm14wk4N7rq+MIxwhoBiyTPV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNIfVgrdOWO0/0QiwL+1/VtLRWo/jJz8ZqGTV5WY0uGhhtCIeYnK4gi2
 +og5pIbslTtlhowP9+apSlI7GDQfGcYWqAqu5xGUo/mjg0nlgNLbZDGU3Kk5ZiOb5NHM1UwI
 y/Sj63H3uwOyk3Hens1NH7MwesC2she5EEUlAcPdwaTh97Ipv4rxxkAoz04QzNcwghDz+8ua
 HNgMFd4JPnW8jpl7CSZs7tAx+2V6MWlx3HM
IronPort-HdrOrdr: A9a23:ObIo3K47vJQ99Qi2ogPXwSaBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsj6KdgLNhRotKOTOJhILGFvAF0WKP+UyDJ8SczJ8j6U
 4DSdkGNDSYNzET5qybkWrIberIqOP3jJxA7t2uqEuFIzsaDp2JuGxCe3um+wBNNUF7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/HmVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW37RozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDDnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZ5B+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MAiFXtuYdY99R/BmcAa+L
 EENrCe2B8WSyLWU5nhhBgg/DT2NU5DXCtvQSA5y7ioOnZt7TVEJnAjtbwid0E7hecAoql/lp
 X525tT5cJzp7ctHNpA7cc6ML2K4z/2MFvx2Fz7GyWUKEhAAQOIl6LK
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57639326"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJiRpu+IreDMspkctEqN/xR+0YPAF3/5RsDYCWks4MecYxBSUjX5SrsX2TxPSGzI28lxUtbKC+v9z6tukIIevaJ6qkMvg//cFXThQKOtcR+r8nAHwr3xb6RTGfWZ+rC7ZDcYA5iY65byWjZOG+PB+xVJtyJAT2cifOQ+8Vaq8AOXKJeBu02WzxTiZvMCoC06JSrZuyhj6esdkORB69AraOduSkrSwNYx35I4OHTXn1O2T47UgZJOZrxRBPYTVe15pcXplb7TerYmwfOS7HGTH0/JJf3PbSYYiSgva/lc7xIRDpEmG/8gXwltjnbItM5z1lTxDtSfKwYtyE1Q7uffVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI55mziFV77AvyXM/+iSUJfX9eHHaHI3HXl/AbYC8sM=;
 b=naKV40/XtpI5jukS521jn/gNlo9yP3ZQ2mAaE4mnRYD9bMAOnImYU5mx5FSOwSeXuzaz9tiIidufGm4TaJ0b3X3DahSmGM6GTu9nYJEVkXxVgwt9FtheOCRdiRwj5ysHV8GldCyXeo+Ii1znAwJMM/8R2MoK8/mhhNAVaydROcyi3hVjatc11njZ28fmRs+ohCvnr298HMyAszAIz2UljwQu7fnzJ0Wi3B7TrkwYnoQRGFyY1TCwloHsLQIxG/zmYD4QCeaUjDtypwRcgDR0sOuBZuGQ+0N2SWvAfPr5zwmO+ij6qg2eByMPOWYQS1E6zTZgwNcmmhBvv6/+yEAAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI55mziFV77AvyXM/+iSUJfX9eHHaHI3HXl/AbYC8sM=;
 b=ld40VON+SnDO6QIWGaYOzXpT61ryZZ9wwC94JWv2qdIDYR3B4qPDWjLHdykUW4bMqzpg04EGf8bvSfkjCIU4UM3VYFV/XlluTITOPcop/AmzFT5bipi0DXtgEnWTHMvr+f6FBbrt1JerxTCqphUf1167363+AofbAnerZt9dp7s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Hongyan Xia
	<hongyxia@amazon.com>, Dmitry Isaikin <isaikin-dmitry@yandex.ru>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16 v2] Revert "domctl: improve locking during domain destruction"
Date: Fri, 12 Nov 2021 13:02:08 +0100
Message-ID: <20211112120208.74387-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0188.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::27)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2ebf86b-501c-4f86-ab62-08d9a5d44446
X-MS-TrafficTypeDiagnostic: DM6PR03MB3579:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3579EFA560789021CB6109938F959@DM6PR03MB3579.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONP9Hc4/g783GlrXxwYNSkPh5f4y62shIr0wWKFHc++WQoE8DFI6gqPOdYJ4XBFSoFX/i/dtjnPcJWBjrXKMuJ1ARSZJeHvHlMa2QyaLKSjwIlUgSSrhTmxU4PEpdg8k8aMFaqOUahgvotBy/SybnRrok/+ZyllLnogfoMpOsSbG4NTT4VqNdlH0jf8hHXAV3PjGVFPPwmCLssLxoHcKiH5q859nRk5znf2GsBzKo6wcmpNOE5bKg/lYnjaEkqEFjrhRNgMdsR8vvvmc8L+AJk88D2+7Eu7U58CyL1eUJ/42G5Np/xIKHoc3tEfEPFx7JXczXWuY+XmkqxNURBCk7MvmrPl2bmYEkufqPhswtU1hJ7n39GqOAeu/dQXhBJ9LHx4VKdnCw83ka9z5/7FXyR4kjrecoyHrEaqIOXbabZRbxLVfTUCK9C4k6AJo3+mS8KwJoLR8/CDNnRKP50yTpCzAHhn4IQuAq8DIWAZc6eVFUoyskWjOZnC0HXXGvywU5MKdNm0cHJ8+2VgKTufjvPs3HD+1v1uXLuyMhZkzleNgU/SuxqFmU1tEuWihStqMuq3IoGwTpslmz6Zzt6Evx+a5d3J17y3RWraQ7qrBn5mgJ3VYfzM3FfSMVe1+vmoGNO2Jo9W+LinNrk9zsA1YIxB2oVFWUrfsfG+oQ0QaOSd+FSf50t3qUWJbXGcWzi6g+b+PgzKY3tfdLcL8enHf0S7x0/UtDHt2nrHYlI0cvRvEBARgQJjqZwkuP1TDzs6ckvAXP/US9JBDw0YlYd5siTcWORtHfLCbBlQV/mOHCxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(508600001)(2906002)(1076003)(966005)(6666004)(6916009)(4326008)(8936002)(5660300002)(8676002)(38100700002)(82960400001)(86362001)(6496006)(54906003)(66476007)(66946007)(36756003)(186003)(956004)(83380400001)(66556008)(2616005)(6486002)(26005)(23180200003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNSQzNjcUR0ZUVrN282SXA2SHljY09WOWx5TjlScnFZU1dLdkJZZnlIRWVU?=
 =?utf-8?B?TUQzR2tJVGxBY29yOEtQM05GMEIzU0pVSFEyb3p5QXo3UXQ5bTZSVm9kVkdw?=
 =?utf-8?B?cHh0eS9KaXpyNC81dEJwZU9DY3pVdHF1c0FlMit5Zm01UTJCY3JzOFIyU0Q4?=
 =?utf-8?B?S2ZQVEcraXpxSmtjMHBKUndiOWNxOW8ybXF4VU1IdXZsaTNIa3krSHc4bGxD?=
 =?utf-8?B?YkJSTDczYS9SNEx3MnJMVTlxYmpiR2NYQlk1aU51MWxUaHlSUUdONmtIem5R?=
 =?utf-8?B?VTFhT2JKbXBCYWd3SWRsTTlxUHBRNFVNZlZaM3Z1TkwrcjlrSjRVOXFzKys0?=
 =?utf-8?B?RXM3NmFMUXBha3R5bVp2MlUvaC9ScHkxNXdkYkFaanhZRldXc0J6dmxuLzYw?=
 =?utf-8?B?OWJXbUtxc0V3emFhQ2w2dGZ6RjljZGg1QStuWkFaSFh0UXVOOUN4L3JIUTBs?=
 =?utf-8?B?Rzlxd2hLV01VNGVSK3h6QVROL2cxQ0x0WVFPM2JXekd0bnplZE9US2RZdGQz?=
 =?utf-8?B?d1o2TWFjZ1ptVXFFdEhtN0M2bFlVRng5dU9hZkxDNE04d0M5aDJHek1sMUdC?=
 =?utf-8?B?NGNNMTN5VDJPTEd6K3RTK3R6VmxHeTA0TWhnZlVJU1Q3c20yM1VZQ2pFdWxF?=
 =?utf-8?B?cmF5RGxjTVVQekJ3T0svNzV4ZU5oMjdiYTB3V2dDOVdoNFBDMGliM2Nwektn?=
 =?utf-8?B?cjcyVk5LWFp1L0Z2Y0lXMHhsak10d05XdVNHcXhFUUZJZXpUWFhlNVNoNCsx?=
 =?utf-8?B?eE9vSzdWQlhiaDBNeHhvdEZ3Z1hNRW1hWFlSaGxVU2h4c2M0MkluMUdiUWF5?=
 =?utf-8?B?NDVreW9BRUcxcGhmN21oMG9HZ1lZcFJRTXdDR3JjTW1lYzg0ak4yUHVRanJH?=
 =?utf-8?B?QnVsUGhmNlp0QXJOL2Z3NUZjY2Q1dFJsZEZKRXpJZ0I0bkVOS3R1TVdWSndB?=
 =?utf-8?B?R3JFbkxsWVhvTmJ3Q0hUSThRUTg5Y1hpeUtFY0FkalM4SnJSd2w1RjdnNkw3?=
 =?utf-8?B?Q08wdkk3NHZ5RTJDRkpWRkd1MmlCRWRKd3NYMHU3ZlpCY0Ztam5mQjdOeGJJ?=
 =?utf-8?B?WmQxb2o4R0FMbjQ4TnEzOWZZVmJtZm1DcUVTcGRIK3VVbkVUdk9hUzFxNXZN?=
 =?utf-8?B?bE1FQStQenk3MzlibjVscmw3TnA2cVRqR1k5RHpXMXNvTHJpODZLYWMrTjAw?=
 =?utf-8?B?UEZWbjQzQmh1SG9XMWdleHJPT0EzZzF5ZFI3SDBweHZZeFdzQUJwZjk4U01w?=
 =?utf-8?B?cU1PdjJPNEprWkEybkx1UkFUVjBGK28zMXovcHJHM3ArV1lvVzltSmtXeFJS?=
 =?utf-8?B?ZzZzUGpTdER3M3JoR0RDTjdvSG5FNGRKVHlNZUF0cTloU0hVSmV0TTVQaDd2?=
 =?utf-8?B?RXZkZ21QMk9ZSStOTkpodUx4VVZtZWFCdTVSSmtVZDRtcWJnOVVmQVBLdUhr?=
 =?utf-8?B?VnNSckpNR3c5amZGTldRN2dVK2pUM29KejZzZURGS0FMbWFzNFJ6T1cyNno2?=
 =?utf-8?B?eHk0RitTSVpic2dTa3VGUTRCYjZwZUYxVkNQN2ljdjlXM051NE9MTkt6YUhh?=
 =?utf-8?B?RFljN0N6eEc0dXBEL2xkdDlpaHlFQVl6N1A5NkhMS2hrVGhPRm1aY01HQW5h?=
 =?utf-8?B?blJUbjYwd29paWlOS0kzRmV2Z0lvdjEyWTdGcStWZVRGV3ZGRGxvbFpaV3pv?=
 =?utf-8?B?USszdmljU1pMM2Rmc3dJaDNJdlp0U254WnRCeGZpbjVpTkEzdTVVWGxOaitD?=
 =?utf-8?B?UUV6TmVpQWdadU5JMzZUNkZJTnhDbGtQendLUXZtd013WW5hOGs3VDU0UjFK?=
 =?utf-8?B?VFpsSk9XOHNZVEFnbXRHTklTQ2hZSXpnWWlpTENkUm9uOGhBcmtoMldJRXFu?=
 =?utf-8?B?Tml0Y2tCSjVRZGx1QW51dEFlaUNSbmFMdFlPSlhJQ1ZoTnpqK29kcWpRbFRE?=
 =?utf-8?B?d0Qra3NBREovY0ZzMCt0eEN6aVVSTTJmNzRabEZNNnF2U1F3RGNBVnNtR1pq?=
 =?utf-8?B?RHFjWWFYWVNyMDlZNGs0bW1uNWNLMitKL2R0eU45RUJvZURKanVBSllYQjI5?=
 =?utf-8?B?aXRnSS9yOXRqajhWc3R0Tk1ucWhNZnpaaEcxdllndzBScDBodGE4Wk9wT1Nn?=
 =?utf-8?B?Z2FrU095Z3c0SVhRNThIcC9XQ0tDNG9MRS90TnhWVFF3US8wZlh0eEtwcGJp?=
 =?utf-8?Q?aHV8xJ2aSkm9BKP6jEpJ3Xw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ebf86b-501c-4f86-ab62-08d9a5d44446
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:02:14.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaVSzgKNpkHVinkW4xTv/LaqsC/GvXrpRFn5+3IctLUtCwszSZdw1/MKNEa32WH4Plx8Dq0Rd25osebNGEiLUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3579
X-OriginatorOrg: citrix.com

This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.

Performance analysis has shown that dropping the domctl lock during
domain destruction greatly increases the contention in the heap_lock,
thus making parallel destruction of domains slower.

The following lockperf data shows the difference between the current
code and the reverted one:

lock:  3342357(2.268295505s), block:  3263853(18.556650797s)
lock:  2788704(0.362311723s), block:   222681( 0.091152276s)

Those figures are from Dmitry Isaikin, and are gathered after
destroying 5 2GB HVM guests in parallel:

https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01515.html

Given the current point in the release, revert the commit and
reinstate holding the domctl lock during domain destruction. Further
work should be done in order to re-add more fine grained locking to
the domain destruction path once a proper solution to avoid the
heap_lock contention is found.

Reported-by: Hongyan Xia <hongyxia@amazon.com>
Reported-by: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

Since this is a revert and not new code I think the risk is lower.
There's however some risk, as the original commit was from 2017, and
hence the surrounding code has changed a bit. It's also a possibility
that some other parts of the domain destruction code now rely on this
more fine grained locking. Local tests however haven't shown issues.
---
Changes since v1:
 - Expand commit message.
---
 xen/common/domain.c | 12 ++----------
 xen/common/domctl.c |  5 +----
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 56d47dd664..093bb4403f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -917,21 +917,13 @@ int domain_kill(struct domain *d)
     if ( d == current->domain )
         return -EINVAL;
 
-    /* Protected by d->domain_lock. */
+    /* Protected by domctl_lock. */
     switch ( d->is_dying )
     {
     case DOMDYING_alive:
-        domain_unlock(d);
         domain_pause(d);
-        domain_lock(d);
-        /*
-         * With the domain lock dropped, d->is_dying may have changed. Call
-         * ourselves recursively if so, which is safe as then we won't come
-         * back here.
-         */
-        if ( d->is_dying != DOMDYING_alive )
-            return domain_kill(d);
         d->is_dying = DOMDYING_dying;
+        spin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
         domain_set_outstanding_pages(d, 0);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 271862ae58..879a2adcbe 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -497,14 +497,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     case XEN_DOMCTL_destroydomain:
-        domctl_lock_release();
-        domain_lock(d);
         ret = domain_kill(d);
-        domain_unlock(d);
         if ( ret == -ERESTART )
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
-        goto domctl_out_unlock_domonly;
+        break;
 
     case XEN_DOMCTL_setnodeaffinity:
     {
-- 
2.33.0


