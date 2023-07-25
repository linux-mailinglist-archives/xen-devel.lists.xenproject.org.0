Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBB761947
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569676.890625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkf-00060i-BE; Tue, 25 Jul 2023 13:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569676.890625; Tue, 25 Jul 2023 13:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkf-0005wH-5z; Tue, 25 Jul 2023 13:06:57 +0000
Received: by outflank-mailman (input) for mailman id 569676;
 Tue, 25 Jul 2023 13:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOHkc-0004BN-UW
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:06:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0108943b-2aec-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 15:06:02 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:06:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:06:42 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:06:42 +0000
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
X-Inumbo-ID: 0108943b-2aec-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690290411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=yn7kJQzbf6RnPHIK78W4GQCjFinnOtP7h79IJBxxEjo=;
  b=BRScAGoX2jPfpcWA8oqDJr9/P+bVw8i/pqQow86QYepy4XJ/ezlOHSlc
   mi0nYZEpeConzmhXqB11JRqIgmytglrBVng1BFCSFpXG7gIRud4/JV+SE
   hjVZl8AT/NsNu9j90jmnsNXd/gmu2PrSN2oV2xMpw5p7aBKp/PsktuXWH
   s=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 116652320
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OnJ3oaw018E45dFDgV16t+cTxyrEfRIJ4+MujC+fZmUNrF6WrkUGm
 mAbUW/QbvrZYzPxKtlwPdznp08Pv8LSydUyHAI/qCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP60T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVBC3
 8U+IQkKVD+kttyVn4CyTdtslO12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMouFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aRw36hA9hKfFG+3qc6gk+Sn3YCMycXElj4ufC2kEW8ROsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHbihdSwIAuoDnuNtq0UuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:Rny0fK+laMDsnPC1KHpuk+AHI+orL9Y04lQ7vn2ZKCYlDvBw8v
 rEoB11737JYUkqKRcdcLy7VJVoAkmsjKKdmLNhR4tKBTOWxVdAT7sSkrcKoQeBJ8SkzJ8k6U
 4IScEXYuEYa2IUsS+Q2mSF+rgbruVujciT9JzjJqNWPGNXg90J1XYfNu/iKDwUeOCwP+tcKH
 M03Lsjmwad
X-Talos-CUID: 9a23:OxJKwmATZiXsGLr6Exhr3ncyE/kiSFL6/UnzfH2xDlRpWpTAHA==
X-Talos-MUID: 9a23:kPv/oATO5mrp4qq4RXS11DNwNZ5y8p+UCQcO0o0PtNOPNzNJbmI=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="116652320"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTB7lcehk+MqNCPoFh8M1abVRhfReF+lJkobeuVvoi9bwdkO+7C5HOI+F4yTZxXNQGkpUQaHHyBVzoDYbhAmsbblhZYb2gOs0yxul7XG+zFOVohyf27m0YEBeC9PMKovcZCEKngXUQDrPTldtwrPMRabXoy3+CTQnj3WLURT1os1s5cvmYo+yPDH/MJIjFPGt9bom9lmb/mT6lsUwzrwwr55iZluutXz48QPNYBThIZuCqi9g1F29Y734IRBNUr512EBm+UtMcs+lfPU+F7uKEaImPm3g3In3dIzCkaqE83sS30n5/GnCdVuZDwyT22OzOABaj0evDZuEzGyQv2GnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmAWMVJN7ymqGfurpuYWddbt8PjeHmT9mj43QmC7/1I=;
 b=Hd4wiL5YmPDuwghU1CaFs4UvKYuWRQw2+aBds0JU4TO1sg1vNRthte2GZgzCUruY3/kBVhqb1RNS4b2ijK0EvBzExiZifje7jenbJtQkMUxOObKK4LQEO7/e1LWan/z05tPkqYRBCunZzZojlTpiuAYyc9tQh9KqVMHhaIqhusd5T3x4Njeptbntaf1NOZaqpYbGbIf5zG4J9tS3gT9oofiYT7KbOSofLRdmDJBex8cQiM2gUNcgk/IflFcj7C7XLdxGdJqDDnz3lFXKRyssgLQN+Wvc8BG21khjznuWVOSXziCyKdBfp806hcZHkT8dxdeQNiTMRp4T5+K6+qpYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmAWMVJN7ymqGfurpuYWddbt8PjeHmT9mj43QmC7/1I=;
 b=meZAiXrkZtugv3/8TbIPHmIY8l06PxrVT7D1h+05EK44Dp2a0BcK3ZrJaZXvRrs8Gw9eXXTYD2Oj6fgM0UChkT1e654j6HAkdhgM10mTBz8Fxqa6yyycubJ8oxLhrUWRl1sq4ywpyw/JGyPCY6JXi/K9fHjE1r6rUZZ9VaJ2G+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 5/6] libxl: use the cpuid feature names from cpufeatureset.h
Date: Tue, 25 Jul 2023 15:05:57 +0200
Message-ID: <20230725130558.58094-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725130558.58094-1-roger.pau@citrix.com>
References: <20230725130558.58094-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bb92bb-1d37-484e-030e-08db8d0ffdc8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VpOfEXRP3uIJfQYGjivgL72zpAYa/9zu8Ix8eDe55aQNlaOuRet2Bqi1GIX9YGIkgIP41EIltcT0a2UHGxVmDZlMxBuhTPP/cOLDLlE5PHew38cuzorRujxpr5QyLiiW9HYZWPmT7/oqMF4fE0bWwg/kt+0fhObzL3gGXbret9LkQHPIeUXJUyeqMJ3G8sWVKlfqwwLYkkiDT1sFRRZmR8VphIXeaHQyBjG00Xe68xegSjN3W/mNpLPBi1VXxW9Si8oURwt6ECFdFq+GDM4KgJAjMnzW93/yqX4Agg3b1oeHi78meDu3od8qprCGRsfOFLZgMEwOl9aCjQIVmGAWzDsGAi6U+FyozKdn/lH6+64+s1upNjX8LPPll80Hut6clnTJyEkckZ32MlLsN9g3QAURJzUbRuKAPlFYjPmS5UZfZc9rQMvRjBxtBb+RjxezXl+l+l2VEhsM4b1AQfxbDlBBKTmPOm5FgVhepUECc6E6R83krq+4FvNpxGdIqeAEqnjzGIrpUPZS2HxDhEWNtumFEcriOFOdrKrblaMPe4Dtb+z2XhKFJIpYuQrXjZCrQ/xRDHFQN42X/JylOhjdAkwykdZzox9z+NLMmu2BCj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(82960400001)(478600001)(83380400001)(8936002)(1076003)(26005)(6512007)(6506007)(66946007)(38100700002)(66556008)(54906003)(6916009)(4326008)(66476007)(186003)(66574015)(2616005)(5660300002)(8676002)(2906002)(30864003)(316002)(41300700001)(86362001)(36756003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDVQamRwcW03WjZnR3ZIcDd2OGZxS1RlaTlFckV3L25DbnFCMTQ3a3N0VGcy?=
 =?utf-8?B?TDRHV1NRTkFtcmdJQXgyQlk0N0hjOTFBRGdyQm9GbVlDVGF5S2dDQ25YVVFI?=
 =?utf-8?B?cEU0MzNObWZrVGo4N2VZK0pybENTNlk2Q0VLOCs1cmlacE9QTEVUdVV2Qm9n?=
 =?utf-8?B?ZlFOU0UrVnFlb3RCazFETnpyblFTbmY1OEVoY2pwWjlVZ0dpdDFkUmgxcVds?=
 =?utf-8?B?VWFjVjViQm5qL3dMMU5vOStjV054LzFjS2RUeXlLcks0ZG1hYmtnQ3ZsN0kz?=
 =?utf-8?B?Tk9heU14R1BDNnVFN1EvZktQeUlMNlN3bGhycGJJNDJUTXJGOUNrcmZMbjJo?=
 =?utf-8?B?VVNWbzNLMFUzWjlwM0syQ0RkcGoybi9SVTIyTGo5TSt5cit4dW90Q0pzWFpY?=
 =?utf-8?B?NVNhV3JzMXVvS2FxOFNVbHV5TThxRjJWejF3cEpVNi9RQk1oZktJVm9LNElP?=
 =?utf-8?B?cXB4ZEcxUXZvSFFBd2JYeU5jZjFpVnNVNmZ3RHI5Qmgva01JZXEzNzFFbnBB?=
 =?utf-8?B?UitPbzFFWVlKc3o3SW5mSVJjM3FrSG9JK0c0R2JRTXA5aFQrdGtJSmxTVzZE?=
 =?utf-8?B?aXNrUkJraXZKUEtFVDVyeUtRNCtFcGxhQWQ2SllCS3RDNmdBc1JPMnJqUkd4?=
 =?utf-8?B?UjhuUjNUd284bnhrcDZzcTI2QktWTWZGYkIwc3pQVmpjaVZuaFY3SHVwU2RV?=
 =?utf-8?B?cTFiK0JWZXhlbXM4LzNBMXNkYzJIaVA2ZWx2Nk81dTZ6bG9SMFVweU4ydWVY?=
 =?utf-8?B?T0dmNWhUU1B4UXBZdHJna0FHbHBaKzdSSlgzR09DR0o5cTkxK0NHaDBDK1FX?=
 =?utf-8?B?VVF5anVkZzhQQWRsYW1hOG5OL2lKZVRrcThEU3RoUnpEVUZYS2Z4b3NZN0FS?=
 =?utf-8?B?TiszSU9JK1RveXNlakZaNG13QkxkekZOWkE4WXpPVWlad1cxQ3R3Y290YlQr?=
 =?utf-8?B?OXVvUzRXV3lZVTFIeHVCWWZCMndrVldNTGUzckVNVVBMakF5WFdKK0lqYlov?=
 =?utf-8?B?RnlpMG5wUk5yWWR1TkthTTlaMjRieGo4RXFPSU84OVhwS2NrbzJHRUVuR29E?=
 =?utf-8?B?aTVsakxyR0pmS3BGdG4zR05DaUk5cWhQSENFSFV5aVg1a2dCL3pKUXYySDZw?=
 =?utf-8?B?M0RCZWx6QnpFblFZTVRoQ3NodUNNY1RNQTk0YW55alJLT3lXRThEakxBcUtl?=
 =?utf-8?B?czlER3diT1ltOE4xK2kvMUtBNEpvS0R4aTdPdlN2WXROdnlPRUVJRXFuVnRl?=
 =?utf-8?B?OVZ3d01PY2s1ZG16WjdGU3l1SmVvWGxUOGFwVUNTQ3JWU1VoTWN0OVdZcGdU?=
 =?utf-8?B?eUdSdEE1dDY1c2NkdGFSSzdLc0RTZXdkYktWaTlPZUZtTmpVc1hzMTZKYUE1?=
 =?utf-8?B?ayswcUVEZWdyeThYTFhJQnZUUThqYjJYODVSQ3dJS01NaitkVEVFc1QwUWxk?=
 =?utf-8?B?eFhGNm01UG1iRTdOcmVYTnBrbXkxOEZ5YTZtTHZIZUFDczBYUHNqVWJpK0sy?=
 =?utf-8?B?L2dsTnVQRTlQTjRZbEpZNU5rbzJnTHhFV2NwKzdHRUsyQlBNUitlOEdEUGJq?=
 =?utf-8?B?V1g3R0JrbjJZMTdjZHR2VjBzVi9QSjVaM1dUdjdsRCtML1NYdTlQTEs1YktU?=
 =?utf-8?B?Nk96b3pLRWtEcTc3NWJVYjh5SHBWNzNLeVJ4OEd4Szhxenk4bkUvQWY4ZG1v?=
 =?utf-8?B?TGRUb1VjWkw4bGU1L2FEanh2WW53LzJkaGRaaUgxV05IcXcraXhydjF3SDRK?=
 =?utf-8?B?WjNaOFpRODBFekZXb09BUmc5RmkyTnpSVVVRdmZCQy83S241Nm00Z2FwZzZj?=
 =?utf-8?B?RVBGNEVWMU4vQXhnVEwycEhoNXBYWU85dFM4RkZicURIb20xZ241eW1rL3o3?=
 =?utf-8?B?MjMzWjB3ek15SXkxNCt1SGw1bjRWSUFlMFUwSi9BVGpoVms2ZDJPS1hXRmhT?=
 =?utf-8?B?MGZyZkdvV1lCMkttQzkrOUQ2TWJ6Q0w4ZWd5Ti83UjVrTmdYN3hIWlRjQXkw?=
 =?utf-8?B?WlJ6VWRtMm5wVEdjaFVYTW5kY2o3OVdOWkIzUE9XdUd1SlJpakRDQUNiUkcz?=
 =?utf-8?B?WEZhWXpCdnZVVjVkamhzU0tYcCtENFFEMC9wcE9rYUFBMDhQVGhjL1JIYzNq?=
 =?utf-8?B?aTMzL2Zja1Uza3dqbVY5blljQ28rLzV4dlJjNCt3NEtxejRyenVGQmkzaXFj?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RuAEejb1AwvZ6Ebo/BZLnQTc0UA5ubBqQRMFpvIy3vSPFmcWLru6wvz5VBth9FkNGwcV7/AbZl4a26w/9NnW1/EnwvYFmU89ufU9BjrGrj/gDT/eSeSHCRgm9hzes88ffl8eKLl7grZuxtgG/clEsQNFMxuK3FdLTGpuD2TLpHFCqxkLH1GFohpypnX2yGNkV0GekjWFREFQ8sIansb/gyL7Zpv4R+0d+lpIXeDDdRsM0noPFJCQutW4GNUWHKnFrAcCkwygzv/0MT6M4EDKzE0pRTjmFDmY6Yd8MHZcXf05Yq206u5fVTXtgqQRzf3XsXT8wPmj7pvP/jLlubJcEon4XCA89IgX7BuU2DQrkIufzGoVJOZuWd4GVn08rszT194FYNGvPJbzGNRoe+6andYdNJH3jxWta+zf+m/2jYqJHPhci9RWCXdVmRBZjN+YWryYmXC/WYQquEj1ePFZ+j1vO1IJnS9BBHj6LYPHQXdiYqq04EI19g/437RQqjR1ado6gIC6696OjR0f9Nq37inwNywVHR32mDyg/VwYhmOr3P/ZRMc5qr4NegISiRwshjxGi4ZQgskjLXG613teaa7k9wd33ipqtkBqtykUFMqiVuOAcBl/2cihy9A01RnedM9bJ+WVmvdFVDax+MAPiCec+RS4UGNkXSOhKby05fLUl407x6S0LwAdYDTOanDbWb/Gp+6PTnmYsvpkG8Cc1WG7covhVeV9vHNKN/cwvHojQPwFCrcOqmho/JMKQqhkTlAsebI3CCyRJvKU9u54J9Ihb/+q6kR/4cMyW6FO64QoHnNZ5ZLS6cG/VfEE0ITt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bb92bb-1d37-484e-030e-08db8d0ffdc8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:06:42.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6KJyBpWpuNKzUQxbf6Y4xBe7sKmfSK5UTOB/mno8v6QihY0m0KPu7qcmb/0In0yI8V8DFLaofpTFeA+bPCp2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

The current implementation in libxl_cpuid_parse_config() requires
keeping a list of cpuid feature bits that should be mostly in sync
with the contents of cpufeatureset.h.

Avoid such duplication by using the automatically generated list of
cpuid features in INIT_FEATURE_NAMES in order to map feature names to
featureset bits, and then translate from featureset bits into cpuid
leaf, subleaf, register tuple.

Note that the full contents of the previous cpuid translation table
can't be removed.  That's because some feature names allowed by libxl
are not described in the featuresets, or because naming has diverged
and the previous nomenclature is preserved for compatibility reasons.

Should result in no functional change observed by callers, albeit some
new cpuid features will be available as a result of the change.

While there constify cpuid_flags name field.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v1:
 - const unnamed structure cast.
 - Declare struct feature_name outside the function.
 - Use strcmp.
 - Fix indentation.
 - Add back missing feature name options.
 - Return ERROR_NOMEM if allocation fails.
 - Improve xl.cfg documentation about how to reference the features
   described in the public header.
---
 docs/man/xl.cfg.5.pod.in       |  24 +--
 tools/libs/light/libxl_cpuid.c | 267 ++++++++++++---------------------
 tools/xl/xl_parse.c            |   3 +
 3 files changed, 107 insertions(+), 187 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3979be2a590a..55161856f4c7 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2010,24 +2010,16 @@ proccount procpkg stepping
 
 =back
 
-List of keys taking a character:
+List of keys taking a character can be found in the public header file
+L<arch-x86/cpufeatureset.h|https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,arch-x86,cpufeatureset.h.html>
 
-=over 4
-
-3dnow 3dnowext 3dnowprefetch abm acpi adx aes altmovcr8 apic arat avx avx2
-avx512-4fmaps avx512-4vnniw avx512bw avx512cd avx512dq avx512er avx512f
-avx512ifma avx512pf avx512vbmi avx512vl bmi1 bmi2 clflushopt clfsh clwb cmov
-cmplegacy cmpxchg16 cmpxchg8 cmt cntxid dca de ds dscpl dtes64 erms est extapic
-f16c ffxsr fma fma4 fpu fsgsbase fxsr hle htt hypervisor ia64 ibs invpcid
-invtsc lahfsahf lm lwp mca mce misalignsse mmx mmxext monitor movbe mpx msr
-mtrr nodeid nx ospke osvw osxsave pae page1gb pat pbe pcid pclmulqdq pdcm
-perfctr_core perfctr_nb pge pku popcnt pse pse36 psn rdrand rdseed rdtscp rtm
-sha skinit smap smep smx ss sse sse2 sse3 sse4.1 sse4.2 sse4_1 sse4_2 sse4a
-ssse3 svm svm_decode svm_lbrv svm_npt svm_nrips svm_pausefilt svm_tscrate
-svm_vmcbclean syscall sysenter tbm tm tm2 topoext tsc tsc-deadline tsc_adjust
-umip vme vmx wdt x2apic xop xsave xtpr
+The feature names described in C<cpufeatureset.h> should be specified in all
+lowercase letters, and with underscores converted to hyphens.  For example in
+order to reference feature C<LAHF_LM> the string C<lahf-lm> should be used.
 
-=back
+Note that C<clflush> is described as an option that takes a value, and that
+takes precedence over the C<clflush> flag in C<cpufeatureset.h>.  The feature
+flag must be referenced as C<clfsh>.
 
 =back
 
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f04b192c0e44..0daa564abb81 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -14,6 +14,8 @@
 
 #include "libxl_internal.h"
 
+#include <xen/lib/x86/cpu-policy.h>
+
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
     return !*pl || (!libxl_cpuid_policy_list_length(pl) && !(*pl)->msr);
@@ -60,7 +62,7 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
  * Used for the static structure describing all features.
  */
 struct cpuid_flags {
-    char* name;
+    const char *name;
     uint32_t leaf;
     uint32_t subleaf;
     int reg;
@@ -153,7 +155,19 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
     entry->policy[flag->reg - 1] = resstr;
 
     return 0;
+}
+
+struct feature_name {
+    const char *name;
+    unsigned int bit;
+};
+
+static int search_feature(const void *a, const void *b)
+{
+    const char *key = a;
+    const char *feat = ((const struct feature_name *)b)->name;
 
+    return strcmp(key, feat);
 }
 
 /* parse a single key=value pair and translate it into the libxc
@@ -176,208 +190,42 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {"proccount",    0x00000001, NA, CPUID_REG_EBX, 16,  8},
         {"localapicid",  0x00000001, NA, CPUID_REG_EBX, 24,  8},
 
-        {"sse3",         0x00000001, NA, CPUID_REG_ECX,  0,  1},
-        {"pclmulqdq",    0x00000001, NA, CPUID_REG_ECX,  1,  1},
-        {"dtes64",       0x00000001, NA, CPUID_REG_ECX,  2,  1},
-        {"monitor",      0x00000001, NA, CPUID_REG_ECX,  3,  1},
-        {"dscpl",        0x00000001, NA, CPUID_REG_ECX,  4,  1},
-        {"vmx",          0x00000001, NA, CPUID_REG_ECX,  5,  1},
-        {"smx",          0x00000001, NA, CPUID_REG_ECX,  6,  1},
         {"est",          0x00000001, NA, CPUID_REG_ECX,  7,  1},
-        {"tm2",          0x00000001, NA, CPUID_REG_ECX,  8,  1},
-        {"ssse3",        0x00000001, NA, CPUID_REG_ECX,  9,  1},
         {"cntxid",       0x00000001, NA, CPUID_REG_ECX, 10,  1},
-        {"fma",          0x00000001, NA, CPUID_REG_ECX, 12,  1},
         {"cmpxchg16",    0x00000001, NA, CPUID_REG_ECX, 13,  1},
-        {"xtpr",         0x00000001, NA, CPUID_REG_ECX, 14,  1},
-        {"pdcm",         0x00000001, NA, CPUID_REG_ECX, 15,  1},
-        {"pcid",         0x00000001, NA, CPUID_REG_ECX, 17,  1},
-        {"dca",          0x00000001, NA, CPUID_REG_ECX, 18,  1},
         /* Linux uses sse4_{1,2}.  Keep sse4.{1,2} for compatibility */
         {"sse4_1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
         {"sse4.1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
         {"sse4_2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
         {"sse4.2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
-        {"x2apic",       0x00000001, NA, CPUID_REG_ECX, 21,  1},
-        {"movbe",        0x00000001, NA, CPUID_REG_ECX, 22,  1},
-        {"popcnt",       0x00000001, NA, CPUID_REG_ECX, 23,  1},
-        {"tsc-deadline", 0x00000001, NA, CPUID_REG_ECX, 24,  1},
         {"aes",          0x00000001, NA, CPUID_REG_ECX, 25,  1},
-        {"xsave",        0x00000001, NA, CPUID_REG_ECX, 26,  1},
-        {"osxsave",      0x00000001, NA, CPUID_REG_ECX, 27,  1},
-        {"avx",          0x00000001, NA, CPUID_REG_ECX, 28,  1},
-        {"f16c",         0x00000001, NA, CPUID_REG_ECX, 29,  1},
-        {"rdrand",       0x00000001, NA, CPUID_REG_ECX, 30,  1},
-        {"hypervisor",   0x00000001, NA, CPUID_REG_ECX, 31,  1},
-
-        {"fpu",          0x00000001, NA, CPUID_REG_EDX,  0,  1},
-        {"vme",          0x00000001, NA, CPUID_REG_EDX,  1,  1},
-        {"de",           0x00000001, NA, CPUID_REG_EDX,  2,  1},
-        {"pse",          0x00000001, NA, CPUID_REG_EDX,  3,  1},
-        {"tsc",          0x00000001, NA, CPUID_REG_EDX,  4,  1},
-        {"msr",          0x00000001, NA, CPUID_REG_EDX,  5,  1},
-        {"pae",          0x00000001, NA, CPUID_REG_EDX,  6,  1},
-        {"mce",          0x00000001, NA, CPUID_REG_EDX,  7,  1},
+
         {"cmpxchg8",     0x00000001, NA, CPUID_REG_EDX,  8,  1},
-        {"apic",         0x00000001, NA, CPUID_REG_EDX,  9,  1},
         {"sysenter",     0x00000001, NA, CPUID_REG_EDX, 11,  1},
-        {"mtrr",         0x00000001, NA, CPUID_REG_EDX, 12,  1},
-        {"pge",          0x00000001, NA, CPUID_REG_EDX, 13,  1},
-        {"mca",          0x00000001, NA, CPUID_REG_EDX, 14,  1},
-        {"cmov",         0x00000001, NA, CPUID_REG_EDX, 15,  1},
-        {"pat",          0x00000001, NA, CPUID_REG_EDX, 16,  1},
-        {"pse36",        0x00000001, NA, CPUID_REG_EDX, 17,  1},
         {"psn",          0x00000001, NA, CPUID_REG_EDX, 18,  1},
         {"clfsh",        0x00000001, NA, CPUID_REG_EDX, 19,  1},
-        {"ds",           0x00000001, NA, CPUID_REG_EDX, 21,  1},
-        {"acpi",         0x00000001, NA, CPUID_REG_EDX, 22,  1},
-        {"mmx",          0x00000001, NA, CPUID_REG_EDX, 23,  1},
-        {"fxsr",         0x00000001, NA, CPUID_REG_EDX, 24,  1},
-        {"sse",          0x00000001, NA, CPUID_REG_EDX, 25,  1},
-        {"sse2",         0x00000001, NA, CPUID_REG_EDX, 26,  1},
-        {"ss",           0x00000001, NA, CPUID_REG_EDX, 27,  1},
-        {"htt",          0x00000001, NA, CPUID_REG_EDX, 28,  1},
         {"tm",           0x00000001, NA, CPUID_REG_EDX, 29,  1},
         {"ia64",         0x00000001, NA, CPUID_REG_EDX, 30,  1},
         {"pbe",          0x00000001, NA, CPUID_REG_EDX, 31,  1},
 
         {"arat",         0x00000006, NA, CPUID_REG_EAX,  2,  1},
 
-        {"fsgsbase",     0x00000007,  0, CPUID_REG_EBX,  0,  1},
         {"tsc_adjust",   0x00000007,  0, CPUID_REG_EBX,  1,  1},
-        {"bmi1",         0x00000007,  0, CPUID_REG_EBX,  3,  1},
-        {"hle",          0x00000007,  0, CPUID_REG_EBX,  4,  1},
-        {"avx2",         0x00000007,  0, CPUID_REG_EBX,  5,  1},
-        {"smep",         0x00000007,  0, CPUID_REG_EBX,  7,  1},
-        {"bmi2",         0x00000007,  0, CPUID_REG_EBX,  8,  1},
-        {"erms",         0x00000007,  0, CPUID_REG_EBX,  9,  1},
-        {"invpcid",      0x00000007,  0, CPUID_REG_EBX, 10,  1},
-        {"rtm",          0x00000007,  0, CPUID_REG_EBX, 11,  1},
         {"cmt",          0x00000007,  0, CPUID_REG_EBX, 12,  1},
-        {"mpx",          0x00000007,  0, CPUID_REG_EBX, 14,  1},
-        {"avx512f",      0x00000007,  0, CPUID_REG_EBX, 16,  1},
-        {"avx512dq",     0x00000007,  0, CPUID_REG_EBX, 17,  1},
-        {"rdseed",       0x00000007,  0, CPUID_REG_EBX, 18,  1},
-        {"adx",          0x00000007,  0, CPUID_REG_EBX, 19,  1},
-        {"smap",         0x00000007,  0, CPUID_REG_EBX, 20,  1},
-        {"avx512-ifma",  0x00000007,  0, CPUID_REG_EBX, 21,  1},
-        {"clflushopt",   0x00000007,  0, CPUID_REG_EBX, 23,  1},
-        {"clwb",         0x00000007,  0, CPUID_REG_EBX, 24,  1},
-        {"proc-trace",   0x00000007,  0, CPUID_REG_EBX, 25,  1},
-        {"avx512pf",     0x00000007,  0, CPUID_REG_EBX, 26,  1},
-        {"avx512er",     0x00000007,  0, CPUID_REG_EBX, 27,  1},
-        {"avx512cd",     0x00000007,  0, CPUID_REG_EBX, 28,  1},
-        {"sha",          0x00000007,  0, CPUID_REG_EBX, 29,  1},
-        {"avx512bw",     0x00000007,  0, CPUID_REG_EBX, 30,  1},
-        {"avx512vl",     0x00000007,  0, CPUID_REG_EBX, 31,  1},
-
-        {"prefetchwt1",  0x00000007,  0, CPUID_REG_ECX,  0,  1},
-        {"avx512-vbmi",  0x00000007,  0, CPUID_REG_ECX,  1,  1},
-        {"umip",         0x00000007,  0, CPUID_REG_ECX,  2,  1},
-        {"pku",          0x00000007,  0, CPUID_REG_ECX,  3,  1},
-        {"ospke",        0x00000007,  0, CPUID_REG_ECX,  4,  1},
-        {"avx512-vbmi2", 0x00000007,  0, CPUID_REG_ECX,  6,  1},
-        {"cet-ss",       0x00000007,  0, CPUID_REG_ECX,  7,  1},
-        {"gfni",         0x00000007,  0, CPUID_REG_ECX,  8,  1},
-        {"vaes",         0x00000007,  0, CPUID_REG_ECX,  9,  1},
-        {"vpclmulqdq",   0x00000007,  0, CPUID_REG_ECX, 10,  1},
-        {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
-        {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
-        {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
-        {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
-        {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
-        {"pks",          0x00000007,  0, CPUID_REG_ECX, 31,  1},
-
-        {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
-        {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
-        {"fsrm",         0x00000007,  0, CPUID_REG_EDX,  4,  1},
-        {"avx512-vp2intersect",0x00000007,0,CPUID_REG_EDX,8, 1},
-        {"srbds-ctrl",   0x00000007,  0, CPUID_REG_EDX,  9,  1},
-        {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
-        {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
-        {"tsxldtrk",     0x00000007,  0, CPUID_REG_EDX, 16,  1},
-        {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
-        {"avx512-fp16",  0x00000007,  0, CPUID_REG_EDX, 23,  1},
-        {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
-        {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
-        {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
-        {"arch-caps",    0x00000007,  0, CPUID_REG_EDX, 29,  1},
-        {"core-caps",    0x00000007,  0, CPUID_REG_EDX, 30,  1},
-        {"ssbd",         0x00000007,  0, CPUID_REG_EDX, 31,  1},
-
-        {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
-        {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
-        {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
-        {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
-        {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
-        {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
-        {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
-
-        {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
-        {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
-        {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
-
-        {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
-        {"ipred-ctrl",   0x00000007,  2, CPUID_REG_EDX,  1,  1},
-        {"rrsba-ctrl",   0x00000007,  2, CPUID_REG_EDX,  2,  1},
-        {"ddp-ctrl",     0x00000007,  2, CPUID_REG_EDX,  3,  1},
-        {"bhi-ctrl",     0x00000007,  2, CPUID_REG_EDX,  4,  1},
-        {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
-        {"svm",          0x80000001, NA, CPUID_REG_ECX,  2,  1},
-        {"extapic",      0x80000001, NA, CPUID_REG_ECX,  3,  1},
         {"altmovcr8",    0x80000001, NA, CPUID_REG_ECX,  4,  1},
-        {"abm",          0x80000001, NA, CPUID_REG_ECX,  5,  1},
-        {"sse4a",        0x80000001, NA, CPUID_REG_ECX,  6,  1},
-        {"misalignsse",  0x80000001, NA, CPUID_REG_ECX,  7,  1},
-        {"3dnowprefetch",0x80000001, NA, CPUID_REG_ECX,  8,  1},
-        {"osvw",         0x80000001, NA, CPUID_REG_ECX,  9,  1},
-        {"ibs",          0x80000001, NA, CPUID_REG_ECX, 10,  1},
-        {"xop",          0x80000001, NA, CPUID_REG_ECX, 11,  1},
-        {"skinit",       0x80000001, NA, CPUID_REG_ECX, 12,  1},
-        {"wdt",          0x80000001, NA, CPUID_REG_ECX, 13,  1},
-        {"lwp",          0x80000001, NA, CPUID_REG_ECX, 15,  1},
-        {"fma4",         0x80000001, NA, CPUID_REG_ECX, 16,  1},
         {"nodeid",       0x80000001, NA, CPUID_REG_ECX, 19,  1},
-        {"tbm",          0x80000001, NA, CPUID_REG_ECX, 21,  1},
-        {"topoext",      0x80000001, NA, CPUID_REG_ECX, 22,  1},
         {"perfctr_core", 0x80000001, NA, CPUID_REG_ECX, 23,  1},
         {"perfctr_nb",   0x80000001, NA, CPUID_REG_ECX, 24,  1},
 
-        {"syscall",      0x80000001, NA, CPUID_REG_EDX, 11,  1},
-        {"nx",           0x80000001, NA, CPUID_REG_EDX, 20,  1},
-        {"mmxext",       0x80000001, NA, CPUID_REG_EDX, 22,  1},
-        {"ffxsr",        0x80000001, NA, CPUID_REG_EDX, 25,  1},
-        {"page1gb",      0x80000001, NA, CPUID_REG_EDX, 26,  1},
-        {"rdtscp",       0x80000001, NA, CPUID_REG_EDX, 27,  1},
-        {"lm",           0x80000001, NA, CPUID_REG_EDX, 29,  1},
-        {"3dnowext",     0x80000001, NA, CPUID_REG_EDX, 30,  1},
-        {"3dnow",        0x80000001, NA, CPUID_REG_EDX, 31,  1},
-
         {"procpkg",      0x00000004,  0, CPUID_REG_EAX, 26,  6},
 
         {"invtsc",       0x80000007, NA, CPUID_REG_EDX,  8,  1},
 
-        {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
-        {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
-        {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
-        {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
-        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
-        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
-        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
-        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
-        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
-        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
-        {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
-        {"amd-ssbd",     0x80000008, NA, CPUID_REG_EBX, 24,  1},
-        {"virt-ssbd",    0x80000008, NA, CPUID_REG_EBX, 25,  1},
-        {"ssb-no",       0x80000008, NA, CPUID_REG_EBX, 26,  1},
-        {"psfd",         0x80000008, NA, CPUID_REG_EBX, 28,  1},
         {"btc-no",       0x80000008, NA, CPUID_REG_EBX, 29,  1},
-        {"ibpb-ret",     0x80000008, NA, CPUID_REG_EBX, 30,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
         {"apicidsize",   0x80000008, NA, CPUID_REG_ECX, 12,  4},
@@ -391,17 +239,63 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {"svm_pausefilt",0x8000000a, NA, CPUID_REG_EDX, 10,  1},
 
         {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
-        {"nscb",         0x80000021, NA, CPUID_REG_EAX,  6,  1},
-        {"auto-ibrs",    0x80000021, NA, CPUID_REG_EAX,  8,  1},
-        {"cpuid-user-dis", 0x80000021, NA, CPUID_REG_EAX, 17, 1},
 
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
 
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
+    static const struct feature_name features[] = INIT_FEATURE_NAMES;
+    /*
+     * NB: if we switch to using a cpu_policy derived object instead of a
+     * libxl_cpuid_policy_list we could get rid of the featureset -> cpuid leaf
+     * conversion table and use a featureset directly as we have conversions
+     * to/from featureset and cpu_policy.
+     */
+    static const struct {
+        enum { FEAT_CPUID, FEAT_MSR } type;
+        union {
+            struct {
+                uint32_t leaf, subleaf;
+                unsigned int reg;
+            } cpuid;
+            struct {
+                uint32_t index;
+                unsigned int reg;
+            } msr;
+        };
+    } feature_to_policy[] = {
+#define CPUID_ENTRY(l, s, r) \
+    { .type = FEAT_CPUID, .cpuid.leaf = l, .cpuid.subleaf = s, .cpuid.reg = r }
+#define MSR_ENTRY(i, r) \
+    { .type = FEAT_MSR, .msr.index = i, .msr.reg = r }
+        CPUID_ENTRY(0x00000001, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000001, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x80000001, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x80000001, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x0000000D,  1, CPUID_REG_EAX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_ECX),
+        CPUID_ENTRY(0x80000007, NA, CPUID_REG_EDX),
+        CPUID_ENTRY(0x80000008, NA, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  0, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EAX),
+        CPUID_ENTRY(0x80000021, NA, CPUID_REG_EAX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EBX),
+        CPUID_ENTRY(0x00000007,  2, CPUID_REG_EDX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_ECX),
+        CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
+        MSR_ENTRY(0x10a, CPUID_REG_EAX),
+        MSR_ENTRY(0x10a, CPUID_REG_EDX),
+#undef MSR_ENTRY
+#undef CPUID_ENTRY
+    };
 #undef NA
     const char *sep, *val;
+    char *name;
     const struct cpuid_flags *flag;
+    const struct feature_name *feat;
+
+    BUILD_BUG_ON(ARRAY_SIZE(feature_to_policy) != FEATURESET_NR_ENTRIES);
 
     sep = strchr(str, '=');
     if (sep == NULL) {
@@ -414,6 +308,37 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
             return cpuid_add(policy, flag, val);
     }
 
+    /* Provide a NUL terminated feature name to the search helper. */
+    name = strndup(str, sep - str);
+    if (name == NULL)
+        return ERROR_NOMEM;
+
+    feat = bsearch(name, features, ARRAY_SIZE(features), sizeof(features[0]),
+                   search_feature);
+    free(name);
+
+    if (feat == NULL)
+        return 2;
+
+    switch (feature_to_policy[feat->bit / 32].type) {
+    case FEAT_CPUID:
+    {
+        struct cpuid_flags f;
+
+        f.name = feat->name;
+        f.leaf = feature_to_policy[feat->bit / 32].cpuid.leaf;
+        f.subleaf = feature_to_policy[feat->bit / 32].cpuid.subleaf;
+        f.reg = feature_to_policy[feat->bit / 32].cpuid.reg;
+        f.bit = feat->bit % 32;
+        f.length = 1;
+
+        return cpuid_add(policy, &f, val);
+    }
+
+    case FEAT_MSR:
+        return 2;
+    }
+
     return 2;
 }
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index f036e56fc239..7bf587455d08 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2620,6 +2620,9 @@ skip_usbdev:
                 case 3:
                     errstr = "illegal CPUID value (must be: [0|1|x|k|s])";
                     break;
+                case ERROR_NOMEM:
+                    errstr = "out of memory";
+                    break;
                 default:
                     errstr = "unknown error";
                     break;
-- 
2.41.0


