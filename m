Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830362F6E6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 15:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445804.701206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow26K-0001qV-6h; Fri, 18 Nov 2022 14:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445804.701206; Fri, 18 Nov 2022 14:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow26K-0001oj-3z; Fri, 18 Nov 2022 14:12:16 +0000
Received: by outflank-mailman (input) for mailman id 445804;
 Fri, 18 Nov 2022 14:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow26J-0001oY-7v
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 14:12:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fed13d85-674a-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 15:12:13 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 09:12:06 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5554.namprd03.prod.outlook.com (2603:10b6:208:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 14:12:04 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 14:12:03 +0000
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
X-Inumbo-ID: fed13d85-674a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668780733;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=aOVpsm2W+wZlvL8oIv5L1JJCqAPusdUKo6dkCuzgAq8=;
  b=Bi4lDQ5gq3N9mGzP/CMMMHNKxPUSFhHzAI/AYXl4WsuLJBoz7Wkb6FOq
   kok6Wc3veUHsESr6tDrCSQY1eluty1FaiXebfM1VrssGXtOHopgUUfCGG
   uWBuAuKMvUIVFcN0o+aGp/gpguzh1INAfFJ6dXCurv1ZFK3IuwdX9WJhg
   k=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 84176170
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4nVGYaqGt4JFWB+MHEbpNMITOTteBmI/ZBIvgKrLsJaIsI4StFCzt
 garIBmEbPbfNGSkKYhzO9u38BtSv5CEy4dnTwFpqSszEisR8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzilNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADwIbgmyp8am+eKqc/k2jd0ja8PsF5xK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYSEEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTCN5LS+PhqaYCbFu73SsXAUROcGWAraeHzU+TfYpBd
 xE9w397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uVSs45SfDkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:xH49G6sFINE3B5h0i23JpqWW7skCAoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPEs1NaZLXDbUQ6TQL2KgrGSpwEIdxefygc/79
 YcT0EBMqyWMbESt6+TjmiF+r4bsaO6GcuT9ILjJhlWPGJXg/YK1XYDNu/XKDwDeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iEnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjXuVm2Hqr8DVTC8zT5Mpv/MuTjLpr24b+P1s2q
 NC2GyU87JREBP7hSz4o/zFTQtjmEaYqWcr1cQTk3tce40Db6I5l/1pwGplVLM7WA7q4oEuF+
 djSOna+fZtaFufK0vUu2F+qebcLUgbL1OjeAwvq8aV2z9ZkDRS1E0D3vESmX8G6dYUV4REz/
 6sCNUlqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIkaJnP2rYLt6rld3pDmRHUx9up9pH
 39aiIYiYZrEHieSfFmnac7uCwleV/NEggEkapllttEUr6VfsuaDcTMciFtryKamYRgPiTqYY
 fOBHtoOY6dEYKXI/cu4+TfYeghFZBMarxhhv8LH3Szn+nsFqrG8sTmTde7HsudLd9jYBK1Pk
 c+
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="84176170"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+MtVd7SiFYw3welXT2juuK0NzWjzFKmjz/T3gESV0HiEBkTA12RiilasXJHUTCyV+fPBdkHpd3YPXwfEr/343U1hNz0TmynDrZ8ca/Xxg7PesFka9rV8Z6Q6HDEdE4GElsYxF/RLTIc7+nq2xUC7X8I4CNjHlcfX3cne+CPwHTW88GcGBhSotHva2h7CJLHpd+6lgoFRl7ieqMjGQooewm+x9ppypZLxSJqeTGjVCJzrPlhUSwr7Uraj9TG0AanAsdXkOcoyZRqgdAjkypexo1s+gDsdcEFmo/oLi79VAZcfIocjnNJZpqt+KHJBe6vBj0nfoaiOsTD4H0x0RdjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjEZzFkTYxDknDXb49z3xsoGFctbINBUhrfuN4m+sNs=;
 b=MtUd77mC2PrJDJEcWuihQmjS3D6s1bPJNVST+/UNmeW7CzmJL6shWv5YhvJL3q1Web/f0kf2mKr1zgY6/OL0df7JgJLp8erUGMMpe5/BiWJzAK8+CvPFOzVQP1CKZ4VF2j4AMl8Mo5DE/26+nyOUJXKJ9LTsG18ww/v0uBPLBr08mPadZWw/kHdW2rdFgo/lLBupqrx+Ta2TUHq73ClnfMPuDOqQtwHSuIYMlrnw4XSWrAo+GlyJVv/QbFkpwHRETTRprmTaNhQ1YLgemVZs/OCVkckegRJxnJuEVdwYZgrlWcHlUHIjo8gevqXIge6c20p7keR1Z0hFCcFhg75XoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjEZzFkTYxDknDXb49z3xsoGFctbINBUhrfuN4m+sNs=;
 b=u0XVC7LqK0sLG45ppOFuzEPFIHDIZHoMScFY1RvGeggUXrVZddIsuoMPsAkhr4P+v+94EBouLZpTZQSYd3dL8FbZpJsGl4WhSooR8/3qYASwjZykESBR/yNmV+KkoYsYln9fct+oUzaDq+U+0ngzvkFjoC0uCoqd+VHBBHARMFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] efifb: ignore frame buffer with invalid configuration
Date: Fri, 18 Nov 2022 15:11:32 +0100
Message-Id: <20221118141132.26242-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: ad001150-b5f0-4d07-8256-08dac96ede15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WZjYwEaw8VVNoxqRY7mmEbxVoaeErsBmXg9Du8LZIg4ibCMVO3G1DOSmWKj/MHjRtNk7aBIEsJSu+hmwdfgwpc2EATkauMavoJDsdYoROyZuo8PHMVe43cHDSI/9kY83Sn5aqfcp3LpUGbW8EYIPmb3NnMURoD2eOq+6UabGWhx8RMn2dZQWHAE+zra/8k7fEFqTU1qQlv5CkC4p2ayevH3+10n2hRQ5zxh55R2Z3AwJx66nhKD03eU51GEESur9gIR66Ov5+rQBj7Vl0zKYDZUtKiRof9+WdMBcBikDb0wF1Y9KSRb/Q+QcCfyceZOEUhrNZwZrS73OjBV6bMGOsgw0ycZkO9oABw+Hys2QDCw61rgLwRO5mIRexuJaMBclBI8bQb5k8qQVswnP5hf39F5l1HBbj1Y1yHGJymB86Tej7G0GT4cbcLgOMmH+1MREFSRcf5tRXKW9Tc7/M6olZUFX561SvpkT9lELpaTxjVn5Mly+yBgBcncXM40dRgQ1DBZL5CAIS7Lf/sTEkqedtSDqOJQH52LEv2Su3XFP1rj33/v40XDrTlLfHjIXkWo3iTwCunzghk985nREwYTLDUhxeSS+y5cNkVjZcNAnBPU5pVN78XUjPxZxV2C45EllhvGYlOUkkhvGBW1wucUKXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(86362001)(83380400001)(5660300002)(41300700001)(8936002)(186003)(6666004)(66476007)(66556008)(8676002)(2616005)(26005)(66946007)(316002)(4326008)(6512007)(38100700002)(478600001)(2906002)(82960400001)(1076003)(6916009)(36756003)(54906003)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ulo1R1ZGS0h1OGJnZWJoUVJnanpBaWxIOU5QSXg5aU5PeExWRVhGaitCZkk4?=
 =?utf-8?B?N2RIZWVIVzk5QXlCREtwa2FLQXJoTERYbE5LSjZIS3NQZzdHRXZiQ0pWSlMy?=
 =?utf-8?B?dVRmalVSYTlTVHNhQmhjeGdCVWIvM3IxM2hVL1F3RXFvak1JUFo0OFZFcXJs?=
 =?utf-8?B?V2M5MkZQNEcvWVgvQjFpa2pYYjFTYkg0WUd0UzBtOTBIU0JmZzNnT2hRQ3hs?=
 =?utf-8?B?T2Rtb1QwbWtFdHpMZVEvckh1Qkhqem5wT25RMGplQTkwZjN4aVBuY0cvREpK?=
 =?utf-8?B?SStjL0U5K2tZQ1NCVDdvZENOWmlzVktpaWlWdDg0NXc0bkozaEtUaFRibm5F?=
 =?utf-8?B?ZlR1NklJRWJ3SWJtdHlNK2pPUEY4SkJUTXUwYmF5WVBNQ3NEUWhmMmdoUkxi?=
 =?utf-8?B?bllGMzF3bnBldk01eFJvSVd3cjhIdHZMTVliaFA0SkF5OHdXeDJLMytIRUov?=
 =?utf-8?B?R0k2Sy9FRXFPWjByaFRWcEFUaUNrNEhjQ3VaN3dqTGtWWHNUVWpJeWVhNmJx?=
 =?utf-8?B?S3NSZE1qeFJqcGFLS3dXaW5OWUl1NjI3a1Iyd0JCOXl4dHM3WStZRFd3cVRm?=
 =?utf-8?B?YzgxcTlhb0ppY3ZRdWVEZWVaVUNmbnlYSElCb1hQZVVUaGg1UkVscnRmcXZJ?=
 =?utf-8?B?Z0ZkK1lQNkk1TmZ2aTAxUE0zUHVYcjJzaEl5eS95RG1OOUY1eUZXdVBmdHFn?=
 =?utf-8?B?cG9CTVovWEx4dGFVVitVcmh3VUtmdjBrWVFWWHFnVHJHNXhwV09MSFQ0Vmoy?=
 =?utf-8?B?a1l4c1gvTHMzMldpM1JHT2xURkdjOEw1eVlWaUlJMVI4cG9RYW1IeStRcmNy?=
 =?utf-8?B?bFB4ZnlqT1ROYk5EWWJvQlRrQjFZaktaYjZaVHo4QkxrbDh2UXdxY2ZZSVkw?=
 =?utf-8?B?NjJlVUpIS3lsanBUa2d3dGFQZU9KUHRYZ1N5OWs1cUJBUENPRll5VXNDcHlu?=
 =?utf-8?B?RGVGN1d6N0pwRXJWaTlvMHlPM25yaXFXakhFVmh0aFBUcUtJeGZlRTN4b2NI?=
 =?utf-8?B?MVdEbDUwcDNzTExjTHROckw3ZUg5OWdZQmxONDdzbE9BZGhOaktRYmEraUFS?=
 =?utf-8?B?QlVua0F1WDdFcCt4eGN4MklhbkNOVlFrdGgvdVFMeHBmdU1pMExHSE1wWFph?=
 =?utf-8?B?eU12Y3JvRkFKKzl0QTBIcHVoa3NScXhiSmRDSy9Pa2ROYkxCeG5Lbk9oOGVh?=
 =?utf-8?B?VHpUVFNkOFpIblVEZUI1M3NmUEswc2xEMlNBQXN6MW9laGVZNWJPUHV0WEh1?=
 =?utf-8?B?UjFhU2c2TStGRGdraVFGajFBWGR3Rk5wYThqdTFBOUdkNTdNeU1oRktuYUtS?=
 =?utf-8?B?TkxkdEdZNFEwNm1FbzdFbnZzcjdpWmNVUVRZMHNJRnBkbHNMYU4zQjE0UkVs?=
 =?utf-8?B?dTZaUVBWMWQ0bUIvZVU3bnA1Q2hYYTNkMk9ad0YxRjFkeTdDWThiZld5WVZV?=
 =?utf-8?B?c3B6R09YVS9DbUVzUk1HVmNSTDc2VkpjaURyV3NsdjlHWnYzd3dvdlI0eEda?=
 =?utf-8?B?SHNkRGR5NkQyd21UQWFlNzhncnhhOHUxemNQbkhTeWFaRWtQczRXViszVVNa?=
 =?utf-8?B?LzhhS3RDbTFDdWI1WXpWajBGVkg3bHFGME1pUndEeVY3K0VXUXBkWGliVFBS?=
 =?utf-8?B?MVZXbWpvRnRjcVZyZ1lMeFl3eW4wa3BzbE15THNISis0S21BbEZsdU85YVN4?=
 =?utf-8?B?UTJqTE9GRGRjMXNVdksxUjhRMDJLN2RoQ2xzR0lDWmhxVDNOcFNRbzN6MXJX?=
 =?utf-8?B?NjdHUHlSTzRxd01rUXRZcDNsOU1iQ3pBdFUzK2sxWDN5U2Y1c2dJSnRQYWZO?=
 =?utf-8?B?bjNlWDFKNllQZnV4OEt5Ykp3WlQ5MWVNOHd0NTV1bmp3dzc2aXlJN2xmWHVh?=
 =?utf-8?B?bmlxemNmZDB3UG1mUldhMTM3RzMzQ3lrOG1KMzkzVnAxSHhNcmdvczZ4ODhW?=
 =?utf-8?B?UC9xWmRWenNLYmtHSkJhMGNyZWZzMjJNVmNOdWwrUTdIREkvVE5UdUxONm1k?=
 =?utf-8?B?YXFvN2NWTWpvRGpic3Z2djJybTQ5S3JtS2RqNGZabnJhd21qNHhHSXhMQS9O?=
 =?utf-8?B?cW1yRmIyemhTN0U4N3RlUVZhRWUvc1J2YzB1bjYwUGdGSEoxTWNxNzZ1ci9K?=
 =?utf-8?Q?1Fu+rhwDvODLiPQ0kEh17Lslt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g9pIpyxpVtABZ9km7o7LJWs95g9QjACEccUfpzVzu+9iffUgYC4gMZjcooO48MMaTmlR9D35WlGVOuj1jj7SOYfUIEzXMhqNrdyvRWfvKoVsNOWGIF98lbbfu5IPe0/RwP3MnzSQC+2AU8H079FpESN1UzNSy6Ir1ziQBnyqcmNKoJ5v/33pc4atJqEUf7qdh4Jpze45fAuXGQrJm128a4gh8/vXr5SCqAeZgA7GtFSUu7zA9q1F2xVoQkeddB4k6lim7Rvl8sZpjJ6SNaZWw7bt+T23gU/IcMPrbtNBC5dRi4i5qD67zK6Nr2w9k7Nw3y6CbaN+EITol6RNPso9oIMWSmb6pzRa3nN4wA7OMCUCmdw/Vmvo5jjEIR4/7kv640Lahep1MSAZndIGhn5J1MvUHRlu+L8Ekp4zk9PExHiEdb+ci5TklzS4SPGVnOM90d/MjpIHzTrWegS7zVzfspt9qQwL5iIWGlwbw+y7IuWMWjbQu/AykoKcyY0Il6BNY1PUsG6YcqtKJJdkqOqdfrTtzWWhlm64T19/fRmfBVpxEBbo2XrNmaJkq42CkK4TRFUwvwE4u+/XcyRLsChou1yiFR9tmPYN29ygCJeRRXEoAzuoULZumhyrgR/Eh+p4CmaZRKZ8U6iCiA2UgDsF95dNqO+DLgim9+JnzkDuvBsvofxEt+CJwxO271TJ0PhmyudhimenNi99x7ucZwBAk8hAaZkCHZDQ5ZNRiKg1021r6EHFG5SzHOQ+XIL7ljHe++u283wSzWNNTUfYaqVbm37ppRKiNMISP6kaFut7p08tL7R3M8FGVwwL9tj82IybEGdC+fcQi0ohwlyoNFWqpw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad001150-b5f0-4d07-8256-08dac96ede15
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 14:12:03.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8l9KaUrHYMmLoF/mMIVVSre1NUbeVYD9BYP1O5/dc7Vr8TIq2gCHfJCgOSKE048E4+ndB18GOO95ea38vtfYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5554

On one of my boxes when the HDMI cable is not plugged in the
FrameBufferBase of the EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE structure is
set to 0 by the firmware (while some of the other fields looking
plausible).

Such (bogus address) ends up mapped in vesa_init(), and since it
overlaps with a RAM region the whole system goes down pretty badly,
see:

(XEN) vesafb: framebuffer at 0x0000000000000000, mapped to 0xffff82c000201000, using 35209k, total 35209k
(XEN) vesafb: mode is 0x37557x32, linelength=960, font 8x16
(XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:0:8:16
(XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) �ERROR: Class:0; Subclass:0; Operation: 0
ERROR: No ConOut
ERROR: No ConIn

Do like Linux and prevent using the EFI Frame Buffer if the base
address is 0.  This is inline with the logic in Linuxes
fb_base_is_valid() function at drivers/video/fbdev/efifb.c v6.0.9.

See also Linux commit 133bb070e94ab41d750c6f2160c8843e46f11b78 for
further reference.

Also prevent using Frame Buffers that have a 0 height or width, as
those are also invalid.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Print a message.
 - Also refuse configurations with height or width == 0.
---
 xen/arch/x86/efi/efi-boot.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index e82ac9daa7..27f928ed3c 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -506,6 +506,13 @@ static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
 #ifdef CONFIG_VIDEO
     int bpp = 0;
 
+    if ( !gop->Mode->FrameBufferBase || !mode_info->HorizontalResolution ||
+         !mode_info->VerticalResolution )
+    {
+        PrintErr(L"Invalid Frame Buffer configuration found\r\n");
+        return;
+    }
+
     switch ( mode_info->PixelFormat )
     {
     case PixelRedGreenBlueReserved8BitPerColor:
-- 
2.37.3


