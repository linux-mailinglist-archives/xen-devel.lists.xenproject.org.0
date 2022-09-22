Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9505E680E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410325.653341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obOhr-0004L0-FF; Thu, 22 Sep 2022 16:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410325.653341; Thu, 22 Sep 2022 16:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obOhr-0004IM-C9; Thu, 22 Sep 2022 16:05:43 +0000
Received: by outflank-mailman (input) for mailman id 410325;
 Thu, 22 Sep 2022 16:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avtf=ZZ=citrix.com=prvs=257c78789=roger.pau@srs-se1.protection.inumbo.net>)
 id 1obOhq-0004IG-1R
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 16:05:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65b896c5-3a90-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 18:05:39 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 12:05:31 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5540.namprd03.prod.outlook.com (2603:10b6:208:296::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 16:05:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 16:05:29 +0000
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
X-Inumbo-ID: 65b896c5-3a90-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663862738;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=CqY9WEJXIFF0yrlMiPz8gd/m+wLzRdwVXl7D8IeD4ec=;
  b=RcilGweO5T6rGW3R35K6M6Pf3mBaIrudR1loPMgorjJdoLjM9XN2nJvx
   dmxdzhh7xv/nwp6pVK6df/VcMSmAEOJQ3Zxo9owR0JXYtfXlXst7Xm9KJ
   Z6Jgrb98Zlo6QP9aIps0SmsqXvCx2JTEdFKbMcLxPAjBkM5nHp1JvGxi/
   8=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 80800937
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gE1MVa5RZUiThttvugkkvgxRtALGchMFZxGqfqrLsTDasY5as4F+v
 jRKDWDQafbfYWTzc9t3b4vi9R5T6p/Vn9cyQQc/qn9kHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks+5q6q4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJFMqHIcZxMxGOnBh/
 KI0ChooaQq7if3jldpXSsE07igiBO/CGdpH/1tGknTeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5LGUe8QrJzUY0yzG7IAhZyr/iPcCTYtWXbc5UglyZt
 iTN+GGR7hQyZITPkWLUqS3EaunntCbHdIwiLqWE7N1PhAOz1kFLGCIfSg7uyRW+ogvkMz5FE
 GQE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4qje7hudB2MEZiVcc9Fgv8gzLRQ10
 neZktWvAiZg2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXI9SrYx
 jmLqG00geoVhMtSj6Gjpwmf33Sru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:yXIQQa4qCpgyVslJCQPXwSeBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfjqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2cSIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+Ezc/Cku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrdOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvGrf2UIUh4bD3wXklX6vpREnBmc4a+a
 hVfYnhDc9tAB6nhyuzhBgv/DSuNk5DbituDHJy+vB96AIm4kyR/3FouPD3oU1wi67VM6M0gd
 gsEp4Y5o2mHfVmGJ5VNaMmffadLFDrbFblDF+ySG6XZZ3vfUi94qLK3A==
X-IronPort-AV: E=Sophos;i="5.93,335,1654574400"; 
   d="scan'208";a="80800937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJUgu2uz3cWtVrgkBACbDHApZr5VRfRROi342ut+0ka+qws3Cyw6p0QSvvL8Okp7sVF7UrHZGdGZ5m6G6x4IDlsy2nPvv1itwv/Ku/kBv9oUDVYjle8TcXEK/+nCMK/ntvHmBSz/8ojHFf/SpzUoYyWpjRmZYENtoUMmtwJYWg5P2/dblTh7X+xDC3iwJEnD0ivqNOAC65GwMS7VKzjt4uxEW6gc/w7B7sh4lHwuUHAi0riITqUALASCWsdTc3xhYWb2kAXjnntA0zZz+E4Jcz9Aj8yQhWOq49+sR7oAT6B3n1Jocx2QgPIIEpoIuUfL3uMmC9AtkP5y0iIiB3tNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEY/skUulMhqe3KZ9qY/Gi9Gi3W1WPOcX5qKjCaqIwI=;
 b=LPgvO4a2I0IAjA1z5mjhwWQDhCBg2I7yB+ORk5KIv9ubL6pvUU/vDKvqRZb3hzzAMeictMO7GaxGO4CActQJq5tANfs5bI86/sPF62uwhXw00IzHSNNWJYbqXOs8hVaoLSvmaRWNwOxh26Y313CKafdZvQhBzxh5bUtyPZAi3IJmIcbadaWghs0mTorVFBw4fxRydAFxAeiOCoLAt9U43GxM4tJqWpgS56bok9gBWCc67BLNQsWHMkpHSO3Q1hej2p7B2RqQ00HIB2Bx2ekXk9oC+V5Adujk6FtNP7Sq68p3+phDsQsR5GEh5JbZiJjygoa22EDn75l4PMfMpU/MnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEY/skUulMhqe3KZ9qY/Gi9Gi3W1WPOcX5qKjCaqIwI=;
 b=oFfReno5vTPsJ96VZ2izdnb+BrB9nct5HxvLGFYffO9QVdXGp4gd3xmwdTRFaB3ihqEeH50umTxHGm1mttNAj9Vy/XbmIhjJxs8MQvPJj29h6Eo6H1WkK+SV9yeiuU/KIT9PkHC0oEn01CFecb+CrOQqXHd8sw74PG4DpjJVjJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/ept: limit calls to memory_type_changed()
Date: Thu, 22 Sep 2022 18:05:16 +0200
Message-Id: <20220922160516.5929-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c838484-bb9c-4727-6b98-08da9cb44432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvQSsFi5H8qAIuHrlj6+ZQApscJHYVguDbzZH0uQ/8fi1PgpVXO/TN2k2w65fgkac/1KG8osjAXiENH73gae8Z75u+h0JuC3WC1jXQZR+aeY19SkLMhoLEzHU0at/KmZqYWwXAJS9pCehqkls+rvJuOjMp4vWxWZU6W4Qpi86+LK5zZ3lQn+yKFLMnTDv2RSBRJxjrCVINIgkOvIRRQMOvhral3e6oKZo1H8fGan6lqaDKS2h8HwoVboin6hNLwZ/9OrWJDnguRwr9ImSA8NUs4uBDXb/p/RmW9m2u5BqkaSjbfBPg64UUPLJwjF/4ZC604Z3S6RYktptEf7kwZamboOBBZwuEQC83iF3uICyLmRCbH7a6DgFYnMzXB+6Uq2DY0UFCtrFSimU2mRQhgOz1wIVOrQT30yNL6J0QlHLcYPxe8m4AINSQPomaLDkNJm/BFOdtiZxCJGmNzuWM9FIpNL4WIH01wEmBqlxD27giJy6UYozUHbEipgI+HG5rSk+dxbrrx7PdqUybh0IhXST3xtNFLn+5fKX9MzLabW1FskvZBbXR/w4q79CykvojQRvCvhl+rD4tjvPHT3mXgC1MLwjT2iQCZjZ8GGxzfUI1ukmo4rQjn4gG/8OsU95sFQBWOpJhoSvT7ALtIOAvZiZR2aV2qkWliEW0Qem5voAd/3DOyRNs1bpJBmj0+OEB16GweP6smOHmO2dQHV0lEs1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(66946007)(66556008)(66476007)(54906003)(316002)(186003)(8676002)(6916009)(5660300002)(2906002)(41300700001)(1076003)(4326008)(86362001)(8936002)(82960400001)(2616005)(38100700002)(478600001)(26005)(6506007)(83380400001)(6486002)(6512007)(6666004)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejgrNEd4TlV1dUFiQk9MVVo5WFhGdkNqR0x5TFk0Yko4dllmR2F2MC9xMHVx?=
 =?utf-8?B?MmRjK29uVjNreVR6VUNXTEdJVStIQ25EU0FKay9jQ291RFRmam4yWUxiVmd2?=
 =?utf-8?B?QzVMdlRmZHMrdDdRbXhaOFpQNHBTdmJ1SXc3Qk9wb2VXYTNOa1IxZE11WGVQ?=
 =?utf-8?B?U2pEb3Z3WHRGRE1TQ3JSS0pYbDdaZ2QwUmJnalB2QnFaTThxbXViVUFxRTRQ?=
 =?utf-8?B?anhxbmZWTDdGbmZ0NCtIblhibnl2V2FwNkMrYkRGUkxiWTRsSTRGblIwTkUr?=
 =?utf-8?B?WldjcTc5NFFvc0pmQVFuWUlGa1BQOXh5WkRHaENFWUxYQ2pCN0VrWXRDUjZP?=
 =?utf-8?B?a2NJb2g2ZTgrNC9vUFBxQUliTlZpcVowTHNCMm5tYnl1a1BBSkhibW5CWGVE?=
 =?utf-8?B?eFBBYm1zclg1RFQ0YW1GdmxaSnJlOTBOeDJqampHKzdqbGdvR0NMUUVGQ3hj?=
 =?utf-8?B?alZCSG9pY3pkazlkMEhYeFpFZXVyU3pybWhhaEdudVo4UDl2ay9wbWJRck1v?=
 =?utf-8?B?TmZxeGtiZVFVWjZQRFcvVm9nWDF1STdkMFpFaTFlRm80R1hydmswRFZDNXlJ?=
 =?utf-8?B?MTZ1SjRjcjNWQ293SUpDNXFESUhpY1NGVXJyMTk4OW9YaVc3RXpKLzBqaE1E?=
 =?utf-8?B?Z2NnZWJ0QWlZZ1JySE1LLzBNMXAySFFyZWtlS2QyNE51a1BVOUJ1Vm1YM1VX?=
 =?utf-8?B?K2hsRXBLSjZNQmJ6YTdVUkdoa0sxZ2dyNFhEWXgzS0pNWlRpUTRyaWhtd282?=
 =?utf-8?B?Ulk2enowWDdxVWFnTy9TeXpIMHArWGVCZnFIQkk4U2hTeG5jb28xNk4zYXVQ?=
 =?utf-8?B?Sy9LNTBhY0RuM01mS2JqV2xNdkdaSXFma2V2Q1NTQWUyVCtCa05pRnhELzhs?=
 =?utf-8?B?VWdBRDRSRGJ5UnJkZ0dQRVp0Mm85Rjh5TU9wSHk3eG5MdWFSUVkyL0F0RHUr?=
 =?utf-8?B?dUhVeGt2TVNFTlAwVXpQR25meHIvZ2N3YTc3ZmxvQ0F5VnNzaFBkRkQ3dnlw?=
 =?utf-8?B?WnNWWWd1cEloU2RZYVdNQ3N5eHV2OHlyaFdtblhWcEJMVjBoVlZSTy96czg0?=
 =?utf-8?B?YytEcUljM0w4U01ZTnhMQlN5UEljMjNXUUFCdzM2ZWFFbVpoWVRFY1IvL1Nh?=
 =?utf-8?B?Q1R1YzdqK0NTUjJoL1F2MnRqV2hIVnFXYmw0N3VHRzh1dGNYb0dRWmx4M1RJ?=
 =?utf-8?B?WENZMmxObU5NYjFYb3hCYTM5R1lpamxRY3hKV0lmWm9PUkdtazdzNzBKVmQv?=
 =?utf-8?B?Y2dzQWx1bktKdk5EMjE5Z3NGNXJkQThmSzN5dlNqVC9adm8rTi9nZWJvbmQ1?=
 =?utf-8?B?SXVGdmhDdkppZmpMeDJxQVpxQkVIcWlXajl1K3ZidnBRUmVlUllKejBMVmgy?=
 =?utf-8?B?ZE5zalhWbXNWZnlsTUNHV1NlM2x4QjByc1Q1TEZtZHVCNEQ2c1Z6eUFUQlRt?=
 =?utf-8?B?Nk0xTTRlanA3ZlRFNVRvS09iQW5HUzJSbHZZM09CNlg5SVRMSW5yenZuM2x0?=
 =?utf-8?B?Y2NZeFJQTzFkWVFBd24xQkE4WGYxeFhmdUJWYTFCa25pUm53WFhEU0puYkxu?=
 =?utf-8?B?dnBBb09Cb0NGem5vOUlHYXo3TEF4Ym9JMGdJUTR6MVdiRzFpT08rWm9VVXJn?=
 =?utf-8?B?c1ZsRk5aeVlFWk03cU8wUW0wR0IyZExjVytFWkRocTd2WmJ3N2tIK3ZUTDd0?=
 =?utf-8?B?UFZKZU15Z3ZhLzMvMk1ROFZ3QnlOcXB6Uk04SC9YRXB6bmRLOUhLOHcxbWoy?=
 =?utf-8?B?ZlJnVXUwZ0RMQXBFVHVPOVc3cDlwRkxjWkFIUHdJRnRyU2srODk3ZTJpRkJy?=
 =?utf-8?B?OEVqc1JLdk1uNEltYkdxcGhMaU9mNWhEU3BTZk10dzhuT3V4UXdTTHdtNzNj?=
 =?utf-8?B?RkFxY1REQU04all2cjB3UXpwd0o5OUt2aGM0TUxlL2ozbHp6MnBjcW9ZVE9p?=
 =?utf-8?B?RUJHRjREczI3R1ZiSjAxSlh0SWhrbHNtN0NweTRpRndQbkphZmdBd0tmYVhH?=
 =?utf-8?B?R3RWWHg3RlRQaVJBZTBwbGZYNmNFbjVTb2JJNy9QM2E3dGltc0t4bnBQSDB1?=
 =?utf-8?B?c2FGM0p2aWM4Q0xTN2RucnFXdW4wOFlFMGxYSUpITUZyRlhCakVYeFQyWi9I?=
 =?utf-8?Q?a2+NKmxX7Odw77vHaC8iQzlqk?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c838484-bb9c-4727-6b98-08da9cb44432
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 16:05:29.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSTvnWMlePH9zlcfAc5BxZ9330PdQDVLiROnnP5J+7r/udNkHrWsm33dWN8TVDLthFsQZ2YYbYjXtkZM6i7sTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5540

memory_type_changed() is currently only implemented for Intel EPT, and
results in the invalidation of EMT attributes on all the entries in
the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
when the guest tries to access any gfns for the first time, which
results in the recalculation of the EMT for the accessed page.  The
vmexit and the recalculations are expensive, and as such should be
avoided when possible.

Remove the call to memory_type_changed() from
XEN_DOMCTL_memory_mapping: there are no modifications of the
iomem_caps ranges anymore that could alter the return of
cache_flush_permitted() from that domctl.

Calls to memory_type_changed() resulting from changes to the domain
iomem_caps or ioport_caps ranges are only relevant for EMT
calculations if the IOMMU is not enabled, and the call has resulted in
a change to the return value of cache_flush_permitted().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I feel it's a bit weird to have calls to memory_type_changed() in
common domctl code - for once the domctl that trigger the call doesn't
change memory types, just adds or removes ranges from iomem_caps
(which in turn affects the behaviour of epte_get_entry_emt()).
---
 xen/arch/x86/domctl.c | 18 ++++++++++++++++--
 xen/common/domctl.c   | 11 ++++++++---
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 020df615bd..f1150dffa5 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -222,6 +222,7 @@ long arch_do_domctl(
         unsigned int fp = domctl->u.ioport_permission.first_port;
         unsigned int np = domctl->u.ioport_permission.nr_ports;
         int allow = domctl->u.ioport_permission.allow_access;
+        bool flush_permitted = cache_flush_permitted(d);
 
         if ( (fp + np) <= fp || (fp + np) > MAX_IOPORTS )
             ret = -EINVAL;
@@ -232,7 +233,13 @@ long arch_do_domctl(
             ret = ioports_permit_access(d, fp, fp + np - 1);
         else
             ret = ioports_deny_access(d, fp, fp + np - 1);
-        if ( !ret )
+        if ( !ret && !is_iommu_enabled(d) &&
+             flush_permitted != cache_flush_permitted(d) )
+            /*
+             * Only flush if the output of cache_flush_permitted() changes and
+             * IOMMU is not enabled for the domain, otherwise it makes no
+             * difference for EMT calculation purposes.
+             */
             memory_type_changed(d);
         break;
     }
@@ -586,6 +593,7 @@ long arch_do_domctl(
         struct hvm_domain *hvm;
         struct g2m_ioport *g2m_ioport;
         int found = 0;
+        bool flush_permitted = cache_flush_permitted(d);
 
         ret = -EOPNOTSUPP;
         if ( !is_hvm_domain(d) )
@@ -666,7 +674,13 @@ long arch_do_domctl(
                        "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
                        ret, d->domain_id, fmp, fmp + np - 1);
         }
-        if ( !ret )
+        if ( !ret && !is_iommu_enabled(d) &&
+             flush_permitted != cache_flush_permitted(d) )
+            /*
+             * Only flush if the output of cache_flush_permitted() changes and
+             * IOMMU is not enabled for the domain, otherwise it makes no
+             * difference for EMT calculation purposes.
+             */
             memory_type_changed(d);
         break;
     }
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 452266710a..1f2f2dfcc2 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -703,6 +703,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         unsigned long mfn = op->u.iomem_permission.first_mfn;
         unsigned long nr_mfns = op->u.iomem_permission.nr_mfns;
         int allow = op->u.iomem_permission.allow_access;
+        bool flush_permitted = cache_flush_permitted(d);
 
         ret = -EINVAL;
         if ( (mfn + nr_mfns - 1) < mfn ) /* wrap? */
@@ -716,7 +717,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = iomem_permit_access(d, mfn, mfn + nr_mfns - 1);
         else
             ret = iomem_deny_access(d, mfn, mfn + nr_mfns - 1);
-        if ( !ret )
+        if ( !ret && !is_iommu_enabled(d) &&
+             flush_permitted != cache_flush_permitted(d) )
+            /*
+             * Only flush if the output of cache_flush_permitted() changes and
+             * IOMMU is not enabled for the domain, otherwise it makes no
+             * difference for effective cache attribute calculation purposes.
+             */
             memory_type_changed(d);
         break;
     }
@@ -778,8 +785,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                        "memory_map: error %ld removing dom%d access to [%lx,%lx]\n",
                        ret, d->domain_id, mfn, mfn_end);
         }
-        /* Do this unconditionally to cover errors on above failure paths. */
-        memory_type_changed(d);
         break;
     }
 
-- 
2.37.3


