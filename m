Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6613D6B7743
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 13:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509247.784659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbh36-0000yy-Lp; Mon, 13 Mar 2023 12:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509247.784659; Mon, 13 Mar 2023 12:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbh36-0000wq-Iv; Mon, 13 Mar 2023 12:13:08 +0000
Received: by outflank-mailman (input) for mailman id 509247;
 Mon, 13 Mar 2023 12:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EdO=7F=citrix.com=prvs=4292f2e3e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pbh35-0000wk-12
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 12:13:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66c7d0db-c198-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 13:13:04 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 08:12:37 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6203.namprd03.prod.outlook.com (2603:10b6:408:100::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25; Mon, 13 Mar
 2023 12:12:35 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 12:12:33 +0000
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
X-Inumbo-ID: 66c7d0db-c198-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678709584;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=hmQcKWst1FY86OGi2e2q+9opEVen7q4pY6RTkjeHqg4=;
  b=Jz1ejDePJ5mSvUfmMm6RBWVg0vFvb9HvZuMJ/dhLr8sx4tma6XmHtfB8
   Voeqye9KJSuQf2L0jMyS2h2JzuYk4gOF9zYZtSzhHAxF9nVK8Ng7Bcu6c
   fqD1b23QrJcsM/DbvDjHcV/2ymHTrJpLI8JsOrgmIQXIOSiMfBlvC+Shz
   8=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 100503823
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FgCUe6LCOplDhHV6FE+RzJQlxSXFcZb7ZxGr2PjKsXjdYENSgjQDn
 GUfCm6BbP+NZ2GmL4x2a463oElVu5/Vzd9lSFBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4mADlH8
 782Ggo3TUiBhc2Qw5u4TNlF05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03rKXxnOhA+r+EpXpxMdPmXCW51cQUjQvVGC2i6SWlGeXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbBRMddgnv88eXiEx2
 xmCmNaBONB0mLicSHbY/LHLqzq3YHARNTVbPXJCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlVujukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:K2BhR6vFppbCZLB1YSyzdNcp7skCHYAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPEs1NaZLXDbUQ6TQL2KgrGSpwEIdxefygc/79
 YcT0EBMqyWMbESt6+TjmiF+r4bsaO6GcuT9ILjJhlWPGJXg/YK1XYDNu/XKDwAeOEAbqBJZa
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbLcAMLHBku7SiJlHeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9uFdGBkc8cLxTrk0KNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Do0/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjcSCghA8RMqIpFel+BgnBQ9e1U4e
 Zu5Sa0ppBXBRTPkGDU4MXJbQhjkg6RrWA5meAeonRDWc81aaNXr6YY4ERJea1wah7S2cQCKq
 1DHcvc7PFZfRezaG3YhHBmxJiWUnE6Dn69Mzo/k/3Q9wITsGFyzkMeysBatGwH7ogBR55N4P
 mBGrh0lZlVJ/VmIp5VNaMke4+aG2bNSRXDPCa5OlL8DpwKPHrLttre/Kg13ue3Y5YFpaFC1K
 gpaGko9FLaRnieSfFnhPZwg1PwqSSGLHnQI/hlltZEUuaWfsuoDcWBIGpe4PdI7c9vR/EzYM
 zDRq6+M8WTUVcGJrw5oDEWI6MiT0X2cPdlz+rTCGj+1v7jG8nNitHxVsr1Cf7ELQsEM1mPck
 frGgKDbvl90g==
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="100503823"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cjl+0RpSNKQ6rMU7ygiImHgzdavMnoaavfeXgfomyXumC8FnPNcqvhUYn6XMaMoNguVmHREOH2vwOI8QneNWK4V8FM0hH4kzqYL0wYwqLWvwhOlUPKk75LzeeNStE7sBhP0mcihpDgBIzF9Q4ndagzwes2MdG5/cqdrO5ZpgOJuAQJWnHklykCrRTCUphWIqs6EO31JiSQKoORDvlNu7IQakgRb8jODl8g5pVnRNjs1qbHkpoO3hllPFyRSUwxBl+iEqPyIZbYsE64YX7gdtvZAM80ixjcSePkY/DPzPgNCYDCEV79/QetxXljqg1jaEng0LwnqEyHasq1n6TOqilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snNv+meeJ8VUCO7BN1YFfaJap+t/BpYIEUVH9+RrQO8=;
 b=jUGcVQUKwh7DXnGzge+ProaN9JKXRo4fNnGoil8yGqW8snI1yFyofF66y+k37mamzIsXGRasMkla3MCXiq+qWEvOIRxahREstz3kmUt3nC92cyXzt7ql7ZuAft34DCE98q6MhN2TKadgEXDhu94ktsSHqn9Sat0YpPQLbQ9IaqfCEPjEnWHd/dUz5xehSKsZwMVn87RPnrx7kYqHvklb1fkOt0eIsbKmBEEfrqeWTadcHW59jtQZ614kf6kUaxZYpQftm6x9JPnoVMDA0F1dCHWxvTE6CE4KlVqZ3bfZ2X4kMK2Op1lCh2g25xDsbLbBrHjHwX4NzwVSUNtZrhjw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snNv+meeJ8VUCO7BN1YFfaJap+t/BpYIEUVH9+RrQO8=;
 b=aUAjiwiDuJDfMfWy8k+uJf/966TWXAituvimadqNMYrSRdXVQRKMaRG38hcGyOVQrDcunshvC+i2MtktCdiijtGlyuN+VgJf5VKRRBeux5jxbWepJsBaE4dlyttmVL/7+Fht6DhUyE6lU1RqTSDEs6NFgP/u10fj2x+AZxb6khc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	JBeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2] tests/vpci: install test
Date: Mon, 13 Mar 2023 13:12:26 +0100
Message-Id: <20230313121226.86557-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR12CA0023.namprd12.prod.outlook.com
 (2603:10b6:408:60::36) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c270ea1-337b-4f9d-75ed-08db23bc39cc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5YSlNHkLgbTmzIEaZJrJd1yWCF/a2s0TMoCmSBVclSY7W0fE1v4iXhSG7fwAfCdsAN3Z2hbUWp3WvUf8SiQAhJvivAY5TFpS/g2JbBYYFecRK3gPPi85QcDVNFnGrMyz7Y2BzceItyIag697OgaEw0teICt/0zesgzIuVH3mVkcfhZIMniV5cv1GBJOLvo1A9LZBLHe1l5qDWyBSjQyYPRI0tRzsjqw2K2zjHT/Y80qhYOyM2SZUhXEeyYs9GJ5+v3ShWZJ2gk9kPzuqud4wvYWCjcCY6FubJKC+JY7cO8PT5VG+L4+zx9UwpVJfrTr1muMWHGYXQ4PIDYYnY2TvJmgdaFe9QObePuieYBIpZaTzmzvjyRefWalC/pyL0nP/GdlefPNMlb1WhxLY195zEYb8sZ2e6oXmNYAN4pBFeD0NVvNLcphIrKt+smMWEshY6tN498pqjU05hl1VfWD1azZUx2HpPOppgwP5BbcLjeYt7//NC0AKd8jePDbU/TfBLtgZBMi7NoFKnhd1XoLSEmXymlSvXzIDd8y9xLN6+xIPg2uufuJT7C9LGnIzbqQbYgd7tWov9MM97H4InI3Dn1U2hQhw1uPFGouV6nX9sCU+JwW5NvqpaXsbGyh/CasuNWzkVQcYLvYaE3WOAQ3g2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199018)(36756003)(86362001)(6916009)(41300700001)(186003)(26005)(6506007)(1076003)(6512007)(5660300002)(4326008)(2616005)(8936002)(316002)(478600001)(8676002)(107886003)(66476007)(6666004)(66556008)(66946007)(6486002)(82960400001)(38100700002)(2906002)(83380400001)(66899018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VStNSzQ2bHZYVlF0UE5oQTZFcGlyZzhVaDhvQ2FhWnVOSW5yUSs5QUVHekVX?=
 =?utf-8?B?NUZWNmpGNk5PeUVHVTlGMXJ5ditQQmZWV1JHR1NQQkJpMkhKVE8waUdoRGIy?=
 =?utf-8?B?REE5SlVEd3kzNkZlYnhUd2toYUQwOHlNZUVBQVZ0Qm5vdTE5aFl5TEw4dkNo?=
 =?utf-8?B?N0pYdlRvTU0xMmJUeGl3ektOOHphQld0OUpYaXc2YjVxWHVHSnRhZU9JVHVI?=
 =?utf-8?B?MXJzSG5mTWJBa1F4WndKL1c5aDljd2pQOGU1c0ZxMkFjcTFTaGlIQjROeUlG?=
 =?utf-8?B?Qm5FZXdCQTRBczUvaHg0cUIrRXR1WDRySC9yUGhqeHlkQnVtRjl1bXdvcVdn?=
 =?utf-8?B?ZS9iUElVQTR2dzRzdkR5cldtSWRxSVZNbWNEMGM3RVpYaGhia2c4SzFCVEJH?=
 =?utf-8?B?a3hZY0VVcmJYZkdmUS9EUUM2bzNtOWUydlFiOFJmNFlGM0E5d0pLT1JIWTdm?=
 =?utf-8?B?SnpDRFo0SjRmQTdEMzB6TVdlYml4aUZSSEhQd3BDSHdjdFprQzZXcC91Y3RD?=
 =?utf-8?B?NnpQNVUyRjY0K0RyTzlEd0pxbzVXeG5JRWhqQSs3cU9pcm1PTGtUaXJaNFN4?=
 =?utf-8?B?a2tIdXFmOGxTYWZ3cWpEQXZObktKMjNBejhmalk4RzllSXVSaGlsbVhFRklk?=
 =?utf-8?B?YkFtNStGOE81ei9DZEZINzU0R0w1NG4zUEVCbm1IUFpjdEhmQnpSMmtJMHBD?=
 =?utf-8?B?N0JZcTdSU3dTVWk1RFFuMGQwNm1lcGRGaEh6Y3Nabitta3I3WndoRnZFY2k0?=
 =?utf-8?B?cmNVc2lTL256bmprY0JSZjJMNVdndThSU01OU2VjRVNvamNrMHdlVjJGRXBB?=
 =?utf-8?B?NGxUS1o2eEpjeHpVR1NqaENIRjVvendVL3JUYklmMHRoYU1KQmFUbEFnKzVY?=
 =?utf-8?B?clVidGw0ek1XMGlRb2RKS1B0Q3JQenVnVXdBTFFqcDMwUitXbU5EMXRtd2xy?=
 =?utf-8?B?eHE0OUNKckNJOUJ5ME9wR3E1MlFwUkZOK2VCdDZXeUp3QWdObk5LSk03VnRi?=
 =?utf-8?B?VVhNZkc4djA3VVdqbTRVd3JRcWd3MStINHR5bGFsR0MvUkdKcDk2aGIzZFNt?=
 =?utf-8?B?Q3FwWnlPUWZWZWJJM3FuVGk1QmJIdTdhVjFtNHA5YlRiR0FkcU1MT09lNGlu?=
 =?utf-8?B?UmVKNFozZG93Nmg0b2N0WDZ2ME96NVZwQjhacWpsMjN2emVabXM2UTY5VEM2?=
 =?utf-8?B?dE4xTk50WW91K1NNS3B2NEZVd3BZcHU5ejU2SEo5WWQ1L2EvbStsTWVHNlNU?=
 =?utf-8?B?MUZlNUgwZDN4Q05UbU1FSjd6M1FlSGt5QkliQ21kMG5weW5XajhoK1k1d0R2?=
 =?utf-8?B?d1FJcVFBd2JqcUQxS2xKR3phcy9tWngyOHNCaU9XUERTT2ZPUGdqY3Y2dEdD?=
 =?utf-8?B?SmFtYStDRlUyWkF4eVc5dmw5M0tHNHJQOVk5UElScW96OHBaU0pVUEprU1pw?=
 =?utf-8?B?VnBFRlBMUTZIZ1YyMDk1dUgvYXZ0Z29tRXNHaTJrMnNRTzFTQStZdjlnSTBu?=
 =?utf-8?B?MzU3c0JqVUxVYXVhejN5WUdwTzV5REllTC9UdFFCbjUvQXcwRzBuTjhLM3ZO?=
 =?utf-8?B?SFZiTDBNTGhTMWFWQ081VVlEbUw2UXhsNlF4ZE1uNWF2UWJkVkRoUDRxaUVO?=
 =?utf-8?B?dmpEWHNjWG5aQVBHcXprV1pTNkxPOUgwNXEwTjhEV0F3ZGVma2NJZHAzMG5N?=
 =?utf-8?B?SVNnc3ZLL3BIQkQyRzZkcEtzZmpSZHdZNDB2RzJDbTAxWmFvYXNUMi9OelFW?=
 =?utf-8?B?RVp4c0pqZ0I2U2lGTGl1dlI3RURMbjhqNHppSUhmS3RoeS9nYklkMzlCQlky?=
 =?utf-8?B?TWkrVmV0VituRnBDL3UyYmNJTURlbEFnanJYZEJ2ODRBOUZSa1p4bjhhVXJm?=
 =?utf-8?B?RS9xMmpqcW40dkJGODd6cWY0LzNHOVFGcFJleXQyTWxNTG5vbUVBQ1FZNG9K?=
 =?utf-8?B?d0d1bTNBT2xaM1A5ZmtYTjE0Z1l0OUtBNDF4bmxJV0o2dDFpcGhmWlhZbU9t?=
 =?utf-8?B?T21JcVJUNkVweE5kL04vSTE0NEIxenNIYkpKQkVVVS8raDVIbE56N3NjL2hG?=
 =?utf-8?B?VGVmM2cvMk4wb0dPeHVqVitmR2IwaUp6ZDRHR3NyRkxENy9VVkkxeWYxNWlD?=
 =?utf-8?B?am9CL05UYmhMMFdzWmhCQk9aQk9KRVE4S2hLN1NnTll1dytaVDdlY1hpcEJN?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yV+CpMihrWmLsCXyPu0Sob6uC6KB5zZcN46LKY1PnRylYOdnObU5248BnTLxSpennTs/Of0O+14T8ZdbRm/wRI4b29zyMecNNMj2fNXDsUkFxj70Nfdw25PgM6eRAQIsNxqNhRlDxukH+4e2j7aVQPpcpTxNUryQTfGzvdaXYlrCcBPYTPhW14Grsuqx9euvbWVWqQOX9KaTRacVf3j2yVFv1cEEhRi7QtW8xJU1bDe2SrsJgKEsue2bhCvdnvFxvOhW6yodvoWnqn4q7kclViEn4AkQ47Qlfw7OW+F/fdiWXNINUyVD8sNlXWglDakLW4KIlGLfH5nGUqlVUUVQiBA2xBfJle1Dgs6PdvuPYCXsyr2JUC9D0ahBTp5p+GvAZ83gUzms3i305IYYaif3wE2doXJty9pnRSpSbZGzA+uqCQGUk3ZSlk4L9iUQSyFv2og9FwIhxn5c2xNwnIxwtJSaOozadn4E/nHNkAd7pXRxa8Pm7H4lRYHFmq0IBvxLi4lx+/hXLwQaB5wYhnlixojecuCPd+nKTFa/4D0v89Wh+i71Z8KwU3b3seY9V1ftfk+Lr0aKzIBmWz0JENfmG7cPY6xa7GCKjv27h4TZlxUUh30S/6DTQfwDZEtLTbPSbsC4iirSj1yPU2q//xNaS4eGzIoMp5K9h24uVVBSVVjchb5bA4Xtdfj7nOehi99AOF09cTqjTgC44SfbcEVqTXQE7H0qZSHSWVgSTkgv5wEjAHV44Qf1/oMCDQh07ruaaY0IwA3Hsnq/8Al/o67EmsiXzi5e9f5dImEmWc17yjsmHi9aBKhi3JVjSwhnqwQY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c270ea1-337b-4f9d-75ed-08db23bc39cc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 12:12:33.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK0xQCP6if5YDX3rh2nHayVbnPUN/rvZQ+97aPA6Cis+4j3nDAiFDeUasT6OB4pzyp9hUVE7okL23yHoAdTNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6203

Introduce an install target, like it's used by other tests.  This
allows running the test on the installed systems, which is easier than
running it during the build phase when dealing with automated testing.
Strictly speaking the vpci test doesn't require to be run on a Xen
host currently, but that allows easier integration with logic that
runs the rest of the tests.

While there also adjust the makefile to use $(RM), and rename the
resulting binary to use a dash instead of an underscore (again to
match the rest of the tests).

Since the resulting test binary is now part of the distribution CC
must be used instead of HOSTCC, together with CFLAGS.  The usage of
CFLAGS requires removing two local unused variables and converting
pci_get_pdev() into a function in order for the 'd' local variable
in vpci_{read,write} to be used, or else the build of the test
fails.

Finally adjust the `run` target to only run the test if HOSTCC is CC,
else print a warning message.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
XenRT has recently gained the ability to run the tests in tools/tests
that are installed, so the install target is needed for that use-case.
---
Changes since v1:
 - Adjust run target to take HOSTCC vs CC into account.
 - Use CFLAGS.
 - Remove two unused variables.
 - Convert pci_get_pdev() into a function.
---
 tools/tests/vpci/Makefile | 18 ++++++++++++++----
 tools/tests/vpci/emul.h   |  7 ++++++-
 tools/tests/vpci/main.c   |  2 --
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 5075bc2be2..11f1ee7126 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -1,27 +1,37 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGET := test_vpci
+TARGET := test-vpci
 
 .PHONY: all
 all: $(TARGET)
 
 .PHONY: run
 run: $(TARGET)
+ifeq ($(CC),$(HOSTCC))
 	./$(TARGET)
+else
+	$(warning HOSTCC != CC, cannot run test)
+endif
 
 $(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(HOSTCC) -g -o $@ vpci.c main.c
+	$(CC) $(CFLAGS) -o $@ vpci.c main.c
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
+	$(RM) -- $(TARGET) *.o *~ vpci.h vpci.c list.h
 
 .PHONY: distclean
 distclean: clean
 
 .PHONY: install
-install:
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
 
 vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
 	# Remove includes and add the test harness header
diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index f03e3a56d1..6baab20de5 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -92,7 +92,12 @@ typedef union {
 #define xmalloc(type) ((type *)malloc(sizeof(type)))
 #define xfree(p) free(p)
 
-#define pci_get_pdev(...) (&test_pdev)
+const static inline struct pci_dev *pci_get_pdev(const struct domain *d,
+                                                 pci_sbdf_t sbdf)
+{
+    return &test_pdev;
+}
+
 #define pci_get_ro_map(...) NULL
 
 #define test_bit(...) false
diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index b9a0a6006b..e3335a0962 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -154,8 +154,6 @@ main(int argc, char **argv)
     uint16_t r20[2] = { };
     uint32_t r24 = 0;
     uint8_t r28, r30;
-    unsigned int i;
-    int rc;
 
     INIT_LIST_HEAD(&vpci.handlers);
     spin_lock_init(&vpci.lock);
-- 
2.39.0


