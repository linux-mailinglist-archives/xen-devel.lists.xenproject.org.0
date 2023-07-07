Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E074B256
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 16:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560514.876483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlzo-0001Zw-ED; Fri, 07 Jul 2023 13:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560514.876483; Fri, 07 Jul 2023 13:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlzo-0001Wn-B4; Fri, 07 Jul 2023 13:59:40 +0000
Received: by outflank-mailman (input) for mailman id 560514;
 Fri, 07 Jul 2023 13:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHlzn-0001Wh-Ja
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 13:59:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81b6edb6-1cce-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 15:59:37 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 09:59:26 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SA3PR03MB7347.namprd03.prod.outlook.com (2603:10b6:806:394::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 13:59:24 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 13:59:24 +0000
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
X-Inumbo-ID: 81b6edb6-1cce-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688738377;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=fCTC2wQivQP2l8kHphqtNQX9bYdmJIumQq5GXrUxd0o=;
  b=gyw3tQ8INjEAJWpNlCnHhLETVeADHLqZvQrZ/0am2RUaDByvp41TWVbm
   IXPbJrGxz3S+gK7mUl2DCLo+9M80DvubLaL6l41IHbaxMZv0CT/+YGQdB
   e8DFu35xzZkeyX5WXo6XdrOi6poUTgAjxOqjrFBi/ju/CNVQhYPGRSLDu
   0=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 114787854
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UD3lOKIiO7Ho63G1FE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENS1DUAn
 zMYXG+Ga/ncNDOkLYtwaNi/8B9V68fWnNJiHgNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QRhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c54HH9oq
 KMSNQkpf1O7m+js5aOxS+Vj05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12rCfwnOmBOr+EpWb/OM13XLJgVVQMw0XDUOShb67lm6hDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBONB0mLicSHbY/LHLqzq3YHARNTVbPXRCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:OpxbdKpHUBYYX9Lb5VKJP0oaV5v5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssRAb6La90cy7LU80mqQFhbX5UY3SPjUO21HYT72Kj7GSugEIcheWnoEytZ
 uIG5IOcOEYZmIK6voSjjPIdurI9OP3i5xAyN2uvEtFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 656tBcrzStVHwLZoDjb0N1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 zukhD/5I+kr/anoyWspVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBbV7iLrFkO0Z+SAAJBqr
 jxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS2tL7t0YvHLf2VYUh5LD3vXklZqvoJRiKn7zPxd
 MeRP01555tACynhj7izyVSKeeXLwgO9ye9MzU/U/OuokJrdVBCvjolLZ8k7wc9HdQGOu1529
 g=
X-Talos-CUID: 9a23:WRTfaGCpnNukgSj6EyZ66mhJRco4S1nMj0/MKRWdGGxoRLLAHA==
X-Talos-MUID: 9a23:hpS+lQqdrUWXG0ahOHMezxJoKZg1zP7pMQM2gZReo+Cgci5sGyjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,189,1684814400"; 
   d="scan'208";a="114787854"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMJ0Pjxuy7bQDEOuWZfG8QNft/LjhYJwlbcx0Aw/zfmGWiwuR15aQk7furwZKfOOBEvsSN6plgx4vJCPfM9vaVZnd/OQrVe1eS/zgqDv52RY+Oe176GYg72S7Xr7NauP9f8WHsCVNEAG+haPH6Mlr9MYQVS8IB4EpFdJFlVM7bB3q5+tjSoYhht+W3UtApkG8IZp4BuwTfN3LYLPLwxE2hfectEN3WJJqU2JKnmlfWBp5YCtKIpsuYz8UYtaFD4UJN1GqgutgQRfaTCVs2h9d9RXflzh1LadZf0ojXOHW1Uwuvr+My3Ow+xCRGQ0Suz3Sn0Jq0QQdK4Axg3I8wXrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gauybQdT91IQj1nb0helNPZvmZ3xxIn2FZDVAC7JLK0=;
 b=Ve3hD8ZpzvcMoo0TKAipfORBQqozuVsA4i4Td4lMxtRmCMbwTVmjpCxve9t4stiZwrl1c7vrwvjAQTLHJPaAdkg7ecU5G4k4iyPGgCe1LrADRG2ZTwZFz9Ponkvubvk/H96eAJHw/I2ekS7RQijb3nMEXfVex5y5W7RGUd08U1VlmGLrqoT4A+F2AOjBpW6d8VPcpjbgzbRpgA4Ialth+y4muUnhTsxm8VSwyJFqa3gJnizBFephqFy+yzGl+tMg2QKK8OKyp+KA4iGMbt/ULzHilrUkI96A82d1MrXxlTrxaYsSfJswG5MATcEHxrN57NUioJz1kROghR+xpEav2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gauybQdT91IQj1nb0helNPZvmZ3xxIn2FZDVAC7JLK0=;
 b=exlCuSC8EyDdZO4tYI+hT6Ysjk4b0lGZA1GeIy88RPuO4LdhjQqhJSb5WLodQ7TdiRZTfZRYR6mWDP8rynGKdE2y/L2k02ZfFSjR6yYIX1VpS67/PA/hw/hcd23hoAO9yIsRNzRvXlqaT7GW4rhwN0+0xpRdWXLK2kU9ze9Sopc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] iommu/amd-vi: avoid pointless flushes in invalidate_all_domain_pages()
Date: Fri,  7 Jul 2023 15:59:15 +0200
Message-ID: <20230707135915.47359-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SA3PR03MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db37886-2243-4080-2128-08db7ef25eae
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VbyRhPUGgKX9QMR1+yMsc/PE7U6SpPvtZSfkT3/1pQnbMtLZmHRvWaOM4YMQJUd3Gu3azvcrAghDTht5RiYaVc6gnyeLm63lmgvLx/MHYtGtBwg4ZYKVuXYreXZGJZa9lqMlYzHSw6Xv9mFX0OxYccniia/D94knmBm/uZ7Fvo+J7P5cAlrk6U661Pz4LHyvzfd87QpxyBbVgArP8XPPQ7CGp7wY9OnWKbh+yotG6vU3YMjODe9UJ1xrx9yTd4aTzzk0LoYZKfLLef6nOcaq7YpV4K+5wUEMiRYDKTYEXJXtbCJXCm7K0htn2teZpZwdPSDP6B4gFWvlrzjcmiJRbtmFPc85utfT3uM+qSc5UhEy9NZhP32AJNJCDV8SsL0LXxsNbtm2qMSNSGMyUe01SjP0IyUUfSY9qEWrZH5cH04Gpd6a40q9HARh8lKF6/gg+91OvDKfxw2WxrTwMHjyO9RpSwwCk07Dju2tNGmaw1zqROq2yDMTT/+hPg6R0LQYgMW7ReHmSRgr6LvBlYwG2uaDbjrpTflxScw9LRjg4JkQVJXG88n9HjjNBJsbKPXC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(8936002)(8676002)(478600001)(5660300002)(41300700001)(66476007)(6916009)(2906002)(316002)(66556008)(4326008)(66946007)(54906003)(6666004)(6486002)(6512007)(2616005)(26005)(107886003)(6506007)(1076003)(186003)(4744005)(82960400001)(83380400001)(36756003)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGI3amdYTlFuRHFzU3EyMjluOGdOZWtWT3hhVjJkeWFIanZXZGRNMnBLVC9U?=
 =?utf-8?B?SHBCWVd3ZjZzRHBOV2NZSTM1M0dVY01ZVElDK1VXQzZWUVhxTUY3ZlA4NUd1?=
 =?utf-8?B?QytIMFVIYXQrYjY4dnc1cXlBdnhKT0lyT2hWTkh0d3FvQVpKUnpkcDFEc2dw?=
 =?utf-8?B?bUZuQm9zcDB5aytGNnJhU2tSV0ZXTkg4aTJEbWIyYUhMSkZGbStuK3E2WEQr?=
 =?utf-8?B?dG9BNGQzd3FLVzkwSksxcG93aXBkY3BCTERPaTdqYW16Q3R3ZjJuenljcDZB?=
 =?utf-8?B?UGswQnBxZTR0aGlaZEhIYTh4NDJMMUlCWEN0eGE1VW5kQzlLT1pWS3dINjJW?=
 =?utf-8?B?ejlZK2VPZFE1TmNqSDl5MzcyZGc5S3J6QUhyalB2VHhrSm1jY1AzMEUvRk4r?=
 =?utf-8?B?aU5Ia3BlcERSMGg2NTZKNk9aYW82bXZhL2lZUVA4b0FZVkNWemFSZUd0aVVo?=
 =?utf-8?B?cXU2ZElDVE1ab0t3dDlKZHRyZ0RhOUZWWnZ3Y29WdU9nRUM5M25hTjIwK2dL?=
 =?utf-8?B?SzJzNFMzaE9hTzVsRGdTeHlJVVNZSnZFYlZ0bjM0aHRsaU1FY0c5QlZZeWd1?=
 =?utf-8?B?QVd4QVZVMGNTR0Nmck5NNUVXci9VdE80TTY0Ym5TdDlUZ0crZDQvQ0dJRGdM?=
 =?utf-8?B?bGJ0Rm9jeHJsZ3U2L2hncStXSFNyNkRyZnd5TFlla1ArYkpDeEk3WE5WSGJE?=
 =?utf-8?B?RTVUY1pmQjJ2TnVGV2poZkFGYzZiOGcxa2ZCbmJwY29LVGhsdEplcG9Td0pY?=
 =?utf-8?B?ZUhaUloveTg4MHlISUlIam1vQ2hGbFB2Mnh5S1NTbVBuQ2h2UC9iVjc3MW10?=
 =?utf-8?B?QjFzNG5rVnk1dmNYTlArTW1RQzg5ay9GL1NjbEpaZ09QVVowRUQ5eDJvTnhM?=
 =?utf-8?B?NWpBb2xKMWdhbVNHR1lSNnBzdTBPZU14ZWxzeWhsazNwZFdFeDdNd3k4MTJG?=
 =?utf-8?B?L1VzUjV4emx5bEdVQUNMTEZHeXpQT2tQVWNjc0diSi8zK3E1RzR2UzkrNGg4?=
 =?utf-8?B?dDNXNFZmamlmTThoc3lrRTIvcXBaWENCZWxZbjc1U0ZGRDhlYlBiU2NxaGtL?=
 =?utf-8?B?aCtMZUpMVUVpTjVCWHF3K2htZUhiM2xRc0xQcFVXYVZMT1JjQm9CekFqeXZ5?=
 =?utf-8?B?R25nVFZTcXExQUFFT2xNRGtSTjBQY1F4VHdrSEpnUnZwNXAxdjgySFh3MDlV?=
 =?utf-8?B?UmMrUCtmVXFjS0NrU3R3WFpMS1dxOXVtWVl2OTZFc2JPV1ZqVjd0Z29jbmw0?=
 =?utf-8?B?NHFva2NLWnprTkYvNUpBSThGMzk5Ni9zYkQ4a2w1WXNTNjZIdmdnaC9GVmRP?=
 =?utf-8?B?UnJ3cTJMdGZ6aUlFTjliNlFQMTd4ZWpLR3RsRkxpR1FyTDVqa2JYT3Nxa1Yy?=
 =?utf-8?B?ZU9pRXJHK1BMRTlDbHdQbml2N0N5MWNsSklrMUpPMTBhUERZYnFoTlliZkM1?=
 =?utf-8?B?N0V4ZVc5WHR0bE4xallTd3NCS0NORHIxMnJTMkJ2VE5iTzVKNStPZWJrYmtW?=
 =?utf-8?B?b0N2bW03V2xNWVI0Z1dzcHBOcnJweEF3SEJEUmdlMzQ1aXRkaGgzN0FSMDRW?=
 =?utf-8?B?WUNlSTQxY1dWRGFIUGo5UzlwczE0M0NhOXdWNUNKRXdHcVdUcTlzQmRmNzVy?=
 =?utf-8?B?Sk9hOXhXSzdIL2NMb2Q0MStUZm8xMzdQc0RYek0xZEpFcU45ZzJXdWhTSFJq?=
 =?utf-8?B?M3JxcUlqY1J0YzI4VUFqUlhWazZuVERUcTNnTzVsT0hHVVdLanBwTlhZVXFD?=
 =?utf-8?B?TzNOcnNuSis1UGxQYWorWnpwdGNSR1BybGlZU0xIeVB1a0o0eWVvREZ3eHgx?=
 =?utf-8?B?K0l1Y1VQNDRsZE5WSWJhcUpoWkFIZjVJa29TRzlPY2RETEpBQzI4cm1BSGx1?=
 =?utf-8?B?RmFsV2o1WXBIOWZDM3BWdkhGSHlMVlUzYnlGMStvN25EVlRmQ0F1bktLaGJG?=
 =?utf-8?B?eDllOHgxS3hEQ2FQSVFOclBNWUwydSt6Ukl1QU5KM3VDME5kdGNEeWhpM1VB?=
 =?utf-8?B?TjlBN21yMWExWE5LQnowYUU3UGpDOFhlLzZkMWJmWkMyVHB5ZzQ5WVVXOVFh?=
 =?utf-8?B?Tlc3TWQvWWowdm05RmZKRUJUdWFkbklLWkVHQW1XeVEyS0VOUytwSzc5dndm?=
 =?utf-8?B?Vlh0N2ZBSGJxeGNQdG80M2dka3ErZHd5UGIvUUlqSGRtdWxrRGN1K0FNVkZH?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xQ/9Su95xQQN/+yLezUrynno1DwQzrW45XqN23W+3S6xfBMzl+4N67ehPvWRyfWGAxBQjksBTj+jtl9j2Fgz7IcGa3DqSRqWfPz/RpojsHlcF1HPyu/yET7xR7CC4exQ86R78Helk+1DuIRhULpTTkBMEGXKTwQV3gAPL6xLj8ZHHkG+1jhvx1geihhngKFbREOfECvs5MdabfNDllLTdnxjcqMJYAhqjy8EKx8rAflCBwPrXWV6ofOpS/6HOsYFfUWSo1PrKCYgroFPTn8y/9xJrt8P3qUuakvAoYnXENxNvYqL5EzVVto4dISrItWQnw4I7FeIxxPcPLI+iY3eOUbeZbYChNC8MNViES9lhAemBCPTu/X1MBm/X7WvBbjHQx8K1mn0IJduTLNCXCuQZx+aYFcLMepoKtBEUyJswgQ+A1uq5R68DwZeh85cTnVmG2gicunsisPTTpRrYDzZ37RaN+wJViCXuwPtbL4Qe7UbY0evq3VTqvyhJSN9Odn+xY5vxoGqEx1fHa2PMJzy46Tep4avipIgmXPNr87+mk6eeutfp/dkHsRztxp/pT8mxuaYcPdhziIcKGv2BQecSxKVlWq4MOXsvfK1lFZ9Zh+D8VcR0EiOr/m7Gug7VBhVamp+suQlAET0otEPQjzYRp1yTEUmL8ebjz5at2jt8esbLBPXyydSdy+HCTqqhfWXcRH1475UqpJE6XQAIXMjaG6BmmiIK7A9DzI9MfXea14KD9CiMYZPg98WmdOYcsD19xQwiN7uWQcRv0eAoVeENeWS+ICnmvdDbwxNbLApShk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db37886-2243-4080-2128-08db7ef25eae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 13:59:24.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9N7H4y5lqiUKJRZzimw7tZSWxh68FaUELP2UjyygiJoYhgAY1tAX1Bu2kKhVn1SdgTTd1g4AFd1bwjCYL4Tqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7347

Fix invalidate_all_domain_pages() to only attempt to flush the domains
that have IOMMU enabled, otherwise the flush is pointless.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 7dbd7e7d094a..af6713d2fc02 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1532,8 +1532,10 @@ int __init amd_iommu_init_late(void)
 static void invalidate_all_domain_pages(void)
 {
     struct domain *d;
+
     for_each_domain( d )
-        amd_iommu_flush_all_pages(d);
+        if ( is_iommu_enabled(d) )
+            amd_iommu_flush_all_pages(d);
 }
 
 static int cf_check _invalidate_all_devices(
-- 
2.41.0


