Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61EA6185A4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436936.691180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdcU-0000Zz-KL; Thu, 03 Nov 2022 17:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436936.691180; Thu, 03 Nov 2022 17:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdcU-0000Y4-HZ; Thu, 03 Nov 2022 17:03:10 +0000
Received: by outflank-mailman (input) for mailman id 436936;
 Thu, 03 Nov 2022 17:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB6F=3D=citrix.com=prvs=299187ae8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqdcT-0000Xu-Kw
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:03:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f03ef7f-5b99-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 18:03:01 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Nov 2022 13:03:04 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 17:03:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%5]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 17:03:01 +0000
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
X-Inumbo-ID: 5f03ef7f-5b99-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667494987;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IAdatCBRiJyPT49nYFGLUm0dyNTv3CsYX7ltbfuooKQ=;
  b=Dv4IgRkcUVC6sSHsKHUzvH6vGanORXqiHfCI83I41d5LkjI9DjtEaX7H
   acafStvbIszSZbBwF0obqBvLWHiVK1TYBHLhf8jb0WPmAU1hoUGy9yL/d
   id0h9BhWgsRxh/raFKIZQQlfxrEJf0GM5ncnKuJfVFdga4j+5JgD2jv+o
   8=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 84136002
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wKrhJqkX1VKOEcqUQ+w3cHjo5gxaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLDWyDb6mJYzHzeNxxb4uz90kDuJHXydFqHAZq/CA2ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5ASGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e0YBWtXdxadveaVwZHhYbBrr5UbPNa+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iea9WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+iA9xKTOfQGvhCoH6252FMLx4sZ3T8iKjokESFaoNVA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdW9S3iQ67OVpjOaIjUOICkJYipsZQkY59jupqkjgxSJScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjYhxq8q56PSRQ6jjg7RUqg5wJ9IYSjN4qh7AGB6e4addjJCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8zWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:+useRqOZxXFWWMBcTy7155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj5fZq8z+8N3WB1B9uftWbdyQ+Vxe1ZjbcKoAeQZhEWiNQtsp
 uIGpIWYLOQMbETt7eB3ODSKadE/DDoytHKuQ+IpE0dNj2CJpsQmztRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTAyYt6gDncIcuDfr5mT/aiWFyIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7WQywPa1UXU85NK8eGRvedrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWV5FMjgL
 D30mQdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxz75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjxEC3abFuJIO5kLZvs3+8SPw7bWzHAcEcYa
 FT5fjnlbtrmQjwVQGZgoFtqObcLkjbUC32AnTqgfblrQS+rEoJs3fw+/Zv4UvojKhNLaWsx9
 60QJiAx4s+O/M+XOZaONorZ/eRJyjkfS/sWVjiUGgPUpt3ck7wlw==
X-IronPort-AV: E=Sophos;i="5.96,134,1665460800"; 
   d="scan'208";a="84136002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHMkGdB4I2y1XxP8fEM/yZEh0bnewL1co7Ao7zjGJG0XVGYj29/XgNVXYLtJZ8b7O8XWwfzMm/A+UHR01p5OIeiHiWwPdggNmoEIkCxbrVLtbHnUEds5xBadWNrQL0bjrh5IhRc/7wl0uhjJbe+zDnrdPlcwmKVvJcnYHlS4Sje9ILtcUTmCwufJS1AEkb2SdbRcZ6uha+dKJQlr9ybF5Ivn4JF3+XowlWcT9qu3YjHLzGQJDjXq4jrV1qKrv8T7d7AIOsQx6LLMYqp6ZkjFv5YviicXoap85i5faQ0MSzLdS/igic+sNT82qfyLCs/XLJon/hqZpe9vdnZuybNU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIU2lRGYZkbDmSI0A87U+VhmPegTQ3g81V0phGsulak=;
 b=mr8xqgDHKwtV1wBS9S8J+RSmbsIrriKZRGbsIP2rWSC2sHDJcZIWeWPDCA+8eKO1kvYGkckG6wPR3035wLVZ3PxccgAoA56sy7CCxdIM+R9c/nTFeN1w6lBTCzQvMaWJSE/pEuV8Qh6amN61Z6rqxZyToztnEiAw/LMVkqFINUy7jUwSC3hjP+SCwGKg22lGx4fnGkcogyqjjOIDZl8EnEQaIyp7KCAEByXwNLIP2U++s1laysMV+oiO3+wDSo3ukna+oXfH4tO1TirBnZHvwh16Mmt13wcwJlgK+/Y0nig38hc4sTPsY0ATei24WE/3U7PhVwh10dn49eKHshZM+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIU2lRGYZkbDmSI0A87U+VhmPegTQ3g81V0phGsulak=;
 b=uotWCYIptuTrJTd54Avt4IYExz8cIx44mRayd5nmz8HJYLRz/KjiPGTvrQzGMLyGRyA/pAd4T4vrFHNI4e9ikqiUnELVcP4+03R+0QCwQapSVFIs4UTOMnLjKwEu+K1iXr8n/ElGmGMjvIq7vvbFpa5rbuSOUo4NAdISlQCtU8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v3 0/2] amd/virt_ssbd: refactoring and fixes
Date: Thu,  3 Nov 2022 18:02:42 +0100
Message-Id: <20221103170244.29270-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c578e49-a089-452a-7b13-08dabdbd4407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fqUX+/2tfSoeo3lRx48tYwth+6kZlPFNlAgbT49yw7nLTO2+NUf4EOzpVLSF6yOVEKJlBlaeB9xNTepuvSs2RcmzQOA/euQlP/144fjSUA1b3opKqqOEMjkacQYXcKB5ZknbuE3IaM1GNM3dgzRZwyTMcadXiJShChCNL1XV/Ww6Xx/1TVt3xwHal+vO2GpCflbvIGZ5FaZVOeIEQZL/ol1ToVineZR9Lj2ng4fqL4K8uuF0NSs6NSLa9+iPbLSUws/KLoN3yoHb6UMunPTBNqAmR5pYM7dPbLKmHBnFdOVXfUmoTPfU+duJaOjAeSNyqgrfyolZdS+UryBloaseD9MfSeoxWyjGaBylxr+jbgidZajDDDi3dHitTfSZnKq3yf9lvrkhuT9WGaVXEV5pRJZ3Lcce8Jn/D1WyBXeK0zqR8mWk4FgcNxPowMQ806s7mVusY/hhysyhcdBSo6WoIFl+xRjMFcAHzvBHBXt+MFMAp/N4u/xM4gwHKOjXljrTe106jAdTlvjr6P8ctffvQaQPuPvenbfvuxLJVNL1pb0m0vA+MqZ1Oy4uRJS5WpTlWepdrdXG1HXlQAN+ozGocnxBU63c9K6LalhDF2PVLLxE9fjKOI9serfsL1DB3y3aczdseI38kS1B8phpUl3hVd+myHIjmyDFZTsE67gxt7L6soSuGAgTTLnr2FDFRmVrkEYn3LMo1XXyOlZ+vS0u5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(66899015)(36756003)(5660300002)(86362001)(4326008)(6916009)(4744005)(82960400001)(38100700002)(316002)(54906003)(8676002)(186003)(1076003)(66946007)(8936002)(83380400001)(6512007)(2616005)(2906002)(478600001)(6666004)(41300700001)(6486002)(26005)(6506007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEoxOFFTUThTS2ljYXFPU3NmM2s5UFplT3dnUjZMQ3l1QlczeGlRT2VlVjFi?=
 =?utf-8?B?MENhU3pmUlk3KzVZQzFSWDZiUHZEZjVPRE1haGZqY0F2MDF4aHpVVDk3a2tI?=
 =?utf-8?B?S3BrMnFWbEhXNmkxNkNBYU9nZkMwZExEdDdRTGVFMVh2c3JKendSaXo5Ry9K?=
 =?utf-8?B?VDV1Z1luZXFSaktIZEd3ZTZHVURkb1E0a3MxWjQxS1p6ZlU2SWpWUTNhV0xL?=
 =?utf-8?B?Q1Fob0ZJdDR0MExKUEhGdHRzZzdyekdLQittZ2h4d2Z5UVhEUDJDSWZ4RTho?=
 =?utf-8?B?bWVvN3VKTHUzZUVmUzJHOE9YY3hOc1VURElHR1hsS2hHM056T0ZEVDZIbEIy?=
 =?utf-8?B?MlRGckVQK2NWZWpDM1RoMXdZdHg3aUd2encrbk1CTEM5MTAvR25DdDhNcmE4?=
 =?utf-8?B?Q3o2UW5ZM1pFeHlJQ2w3Tm5YRVdqbVU1Wk84UFlJQU5yWWJQaWJ5cDgrZ0tG?=
 =?utf-8?B?TkhVWTVHZVlhVXJCVTlab1JrK3pkbVQ0MWtJcEpxaEV6K29uN3h2OW8vTDZ2?=
 =?utf-8?B?LzhHZHU1ZUhOWVJhZGx0OXlrN2diSUpTcGhPbHVzcVRXNG5iRVkveGwxMGJP?=
 =?utf-8?B?NlAxTWdoeGdrdGxBN3VGUytwN1lrWmdEV1RmWnlvTzM5WkNLNktUeVN2NXZ6?=
 =?utf-8?B?cFZDMm9PNkZMbzhoSVdrYXhaalBOM2V5c1pmRWEvUW5RdVpud3YvYURvK0xO?=
 =?utf-8?B?c1kvSmlIL3NIbE93OWpRU1ZTYkJmWGlnNlh4TS9jYnIyamxtSUw0NmZqYnhV?=
 =?utf-8?B?RWNPM0hqUVNLMVR6V0o4S1NEc1BmSW1wcUpwSXRkRmMwTml0YTRqRGtjWU84?=
 =?utf-8?B?L2lsdUpNUjE0M1hrMGJjQ1hHOGpzSXowZkpTV29sbnJPbWM3QWNCdlh1dGkw?=
 =?utf-8?B?SzdBelRsN0dPeEVpdzlIS0VqQU5YdHhPMWpPWWVqbkJScW85YzRHVlRiVUJ2?=
 =?utf-8?B?Yk5pa1IxVVJRUFAwcDRMenpYdFJ0QW45WkxBTFdDUnVWbmNqSVVtTzJNUEtJ?=
 =?utf-8?B?UTRrL0ZhWFRoSDM5N3hSR2xhYW1ES3p1TmN6bUJUNTl3T2ZBT3Rnalp6WFg2?=
 =?utf-8?B?b281dnJYdGd6ZmR1eERDRHdobTZ3azFTbFdMTkN6aDJkTE14NUhtc1lpMG5G?=
 =?utf-8?B?RDZDL1hCaWxDRmwzdUtuYUhPbFd0UGpJc3hsNE5FZXB0L2VCNTFZUlZkNHFk?=
 =?utf-8?B?Sjc3VTVkUHhhc2lqTEdwYTJaNXIybFRDdWNjZkwybndYN2dNZ3ZJb2Ewb0Iy?=
 =?utf-8?B?eXZyWGphYStuZVhNb0oyQUlkZHI5WmtoYkxIMlNBYkNKb2xrTkh2U092NXFw?=
 =?utf-8?B?QWovd2tCQmhlcnZoaE5nVHVmWjBuUXd3U1VJNG04TnJBdHFQRElTaHdnd01V?=
 =?utf-8?B?WDE2Q1ZhUzFkR3Q1L1ZvUWZFTVpVU1JEVWxDeTNHYUpSSUxUd3ZLV0FLVTlI?=
 =?utf-8?B?QS9DcXQxL0JkUHBSSVZJblEzenk2SFJRZ0doVFJaVWNmVVFFeHB0eHlmMGpH?=
 =?utf-8?B?c210aGxIS1R1NFFvTjNRQWpXaHBMUVlFT1lQQ3BiRVRGdjZ4NXBwRjFmL1U4?=
 =?utf-8?B?RzJmNVBmQXZHbXFGK0JVcnlHN0E2YjZ4cTJxelJPOVRDY1VKZmJMS3p1djZE?=
 =?utf-8?B?S0tyQklLdTFrUGxUMGZlT0xHZE5rbys1ZkVZL3N0YnRxV0ppOFljM0hBeE1P?=
 =?utf-8?B?Nmh1MXVheWVNNDgvcjdkUGtOSTFWdzhVWTc4WDh0RzNxYUl0TE04Y2FsbTFS?=
 =?utf-8?B?TjBDdmlTemd0aEpLWWIrcU00dUx4Q3owMGlzMjRCRnVMUGxibitCN0tDZDhl?=
 =?utf-8?B?NWdYT3o1NmlQTDhUTHN5aHpZODhqUzhkYXZhQ3N4Z1o2Z2JpemQ3bmZReVVr?=
 =?utf-8?B?L1Z0MmU0ZGR3c25lZDg3a0dYUnhBVDNxL3pmb2I3V1h2S3pwMG1tSWUwR2RL?=
 =?utf-8?B?V0YwT2MwalpwcU1hTXF5eE5MaGxGME8rNE5SZVpVNzZleXdiblZKK1R3cVI4?=
 =?utf-8?B?eG9pTS9VdHBGeFIzdUdReTdSdllGVUtDNTI5Yk5IcU0yeHRiZXJRT29LM3lt?=
 =?utf-8?B?d3g0L1YrbjlJZ1Y1NnZTU3NDWTg0VU1FNlRGVE9Wa0NLcXFhaDQ3SEQ5allB?=
 =?utf-8?Q?pA/dujIsP6uFCfqbMvMCpd+rN?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c578e49-a089-452a-7b13-08dabdbd4407
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:03:01.5718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enjedoF5s+71DxwztSplXjp8jvJWwAp7Qe4OnxluP2+BmGoripYSVcY5aEmFseGCmhhklWCDLagq+BZ2A1tYSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312

Hello,

Just two patches remaining, and the last one is already Acked.

First patch deals with moving the switching of SSBD from guest
vm{entry,exit} to vCPU context switch, and lets Xen run with the guest
SSBD selection under some circumstances by default.

Thanks, Roger.

Roger Pau Monne (2):
  amd/virt_ssbd: set SSBD at vCPU context switch
  amd: remove VIRT_SC_MSR_HVM synthetic feature

 docs/misc/xen-command-line.pandoc      | 10 +++--
 xen/arch/x86/cpu/amd.c                 | 56 ++++++++++++++------------
 xen/arch/x86/cpuid.c                   |  9 +++--
 xen/arch/x86/hvm/svm/entry.S           |  6 ---
 xen/arch/x86/hvm/svm/svm.c             | 45 ++++++++-------------
 xen/arch/x86/include/asm/amd.h         |  3 +-
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 xen/arch/x86/msr.c                     |  9 +++++
 xen/arch/x86/spec_ctrl.c               |  8 ++--
 9 files changed, 75 insertions(+), 73 deletions(-)

-- 
2.37.3


