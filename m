Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE135EBD9F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 10:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412321.655574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od69D-0004h1-TL; Tue, 27 Sep 2022 08:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412321.655574; Tue, 27 Sep 2022 08:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od69D-0004f1-QA; Tue, 27 Sep 2022 08:40:59 +0000
Received: by outflank-mailman (input) for mailman id 412321;
 Tue, 27 Sep 2022 08:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEHl=Z6=citrix.com=prvs=262470e07=roger.pau@srs-se1.protection.inumbo.net>)
 id 1od69C-0004ev-IQ
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 08:40:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 198bf316-3e40-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 10:40:56 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 04:40:49 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH0PR03MB6161.namprd03.prod.outlook.com (2603:10b6:610:d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 08:40:47 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 08:40:47 +0000
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
X-Inumbo-ID: 198bf316-3e40-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664268056;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zY0kJnEPNnF+LxAXTh4qx2FE7upB327UOUb7LTGa6pc=;
  b=eg5OahqpjrA+YhDTGTakExQeFXD+WlNMmk1s0RsRFtVJljS/qEVzb2js
   WMeTK8+AbGNwtcPp74F0S0abE/H2vJr36kRySTyXj0TJN70vcHGcQTw3f
   0ydO8FLz3c9r5s79CyypOPJj0hyRMlwXyd7JnuXCRdMq4Y/THQrkOdSRB
   w=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 83932930
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ijRasK2GQIE+Su5hB/bD5RBwkn2cJEfYwER7XKvMYLTBsI5bpzMBn
 GsYWm2OOK2LY2SkedwiOdvk8EkBupPcm9FqSwtlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WlH5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUJ1t5pWj9Dy
 MZbEx41QBKxldiK2IikH7wEasQLdKEHPas5k1Q5lXT8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/I4/NvvgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4Wreoyn217SX9c/9cKUOL52n99tguWewx0cwNR86b1SD/fbs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8VUO/037keK0KW8ywSEAmkJSBZRZdpgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAFIGlHaSIaQA8t59j4vJp1nh/JVsxkEqO+kpvyAz6Y/
 tyRhC03hrFWiNFR0ay+pAjDm2j1/sWPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:m87UTqlNk9ZuPM8bt7NqCxrodi3pDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 D4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR8Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqXneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3GlpT1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYzhDc5tAB2nhk3izyhSKITGZAVyIv7GeDlJhiWt6UkYoJgjpHFoh/D2nR87heAAotd/lq
 b5259T5cFzp/8tHNxA7dg6MLqK40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.93,348,1654574400"; 
   d="scan'208";a="83932930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyjHC4v+P76LQgddVtRbD2oteMZwGWOnK82SRgJKwhSH4mseeKczISUQ63aipEaxOzrkIn2PtQhI3Zv/2UHl8CS7TO/kLb5qFyRdF+fJ85R2TM14ODxvLO4kWQ5lwH2QDmCJFHsByQsTJgOwrDXk0tgVa0Kb4MAdA31dmMT5ISx2g0pF9NZvNUWp+QEAiwRY0ZED1AZbdxplu0M7+rtUVerRSZNdX3HII9SKftuRFCYyTybQkrnjm1zCTsIAjbRsV8JQKav/W7cg4kvlIrz+vHzRWkVhheOht4IQXBoA2SB8VgvRblQzpIXPjRaouA1+h4WjvBaHYh2AaX+zeh2Iww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrXc5pGA7NhHOUZaCl5GAaR0WyhyFfALLRJZrswc+1g=;
 b=kpJ4QImhAh54u+w8x1lKHzeKa7bEXsuCXVoHt9uGV7DU1DAslacHft8u2gxoD29id06e3LoblmE84uHAnF8WxCK5TzHETK6oXvScjnCSWunjYHBYBmXZJ4cAgJcCkNCaot7Kg/x93KI4Psd21/x2aIu4SFs9WKubStBeEKGyUZohljDnJit/RDkhWaf8aQsJ9FW1KJNWPGzOcaM/QGTOIfsWFB3nzEk3zHEkwQ33eA9mUi1xAqHodRgBePbKbIrJ7ipZmHgl3B8UW0dPX0F9QBaCz191v9DW3YCs1UUPrYgyg/UM4J+hM9d9SHEWGJBi6YOVQ9RbdmB5wyOOK8UIMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrXc5pGA7NhHOUZaCl5GAaR0WyhyFfALLRJZrswc+1g=;
 b=hwzz+hFZjHkFNzefGtgC3Rtn2x9EGng+DnyDn1u0YlVFgmzWA+9Re4ixPyD2Jw+hqMxboe4Z3jCaVgKKRu36i+sn+4Kvlhr01ZGgqzvDU8kwsAcUAuDc0qxkuuoKTRdv8kR3mUcQhXw0ChgrfMumNP5UguUModzbK/y+CUts8ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Sep 2022 10:40:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Message-ID: <YzK3CR0fUyUdE1OY@MacBook-Air-de-Roger.local>
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
 <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
 <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
 <YzG8Ln2cYTuxF513@MacBook-Air-de-Roger.local>
 <YzHEcdCtch7lKh4G@MacBook-Air-de-Roger.local>
 <f8c080ca-33a1-ab15-963e-9c5c02c99bce@suse.com>
 <YzHMDIxjXQ+txtwy@MacBook-Air-de-Roger.local>
 <82fb70ca-25cf-6e06-968d-416798f65f79@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82fb70ca-25cf-6e06-968d-416798f65f79@suse.com>
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH0PR03MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec9a8bc-8305-4717-07de-08daa063f90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UnGxvprvG+IA4IX1JNMRsm3JOhpXpdsc9Q8F+vSSgK1lc+JR46MAhlGMKGu7hh4WK71pwbbvr21mNjB6g9S1EoYKZy7oyDX+1xjbWsvBhTQyQQQCOyNPdGt00C2s9czpBm6nJSkDeMQFX848cGFQYGpT+h+Z05GVxyrs6QfKk7sl/LzN1D5OFSs/f66ep+6797LDlPpo0DQpu+CeZLx7/bvzSSNjAhGgBgV3e3R/BQ2WHV6/q5CO98Lmqo1431D9YjvlQ3rQoaxQHhyTC4Cqk3/4oGmnBDiP2Gq2ApA1yyZc6sPEbauGUDoZN2fjJwcjkvzwCsUy75Q+q62j2j9JHM1+hBU3i/0kKj5EIyQ3uB2nuno0BB3vazCQJkFsOusmczHveQoSmGVHdGeQQKSi5+o9Xb0IXUvHN7kTKzgCS+gKKN6q3TLTV2KH9Whb8MoiEZ8l9nMouRs6lVw8/VsHn80aolIoyE4OB2Eforld0eqIImXyBoDvF+qfRCuMgBs+iJrm3rX47M9gv5XPEjRxLjgQqHlKWyDXZ1ysYBMt+CDyD3egbYS8nRlGx6yiIpG0/QMgnbpijfkCE3uv7KfLjVNd3rh87OgEUtFp3Aj/Fe88YMf5AMC/+vEl2iP5W/HFx48S1tLMBFQDpsEKCxLDxymG6MIiOfrNMJmfzxuXU7cyEfKyrUBlEoYcot1JM1iVr5mvRpgRJOU8XZyfRxHTXBeqOH3XFv+WcIL6TDudHnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(53546011)(26005)(6512007)(9686003)(6506007)(38100700002)(86362001)(2906002)(82960400001)(6486002)(5660300002)(478600001)(85182001)(83380400001)(186003)(41300700001)(966005)(4326008)(66476007)(66946007)(8936002)(316002)(66556008)(6916009)(54906003)(8676002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjRQbFI4dmI4YnpKNFNtWFNueGpERUoxUG0vb2N6RmdRVkFWZUFicEx2a0FP?=
 =?utf-8?B?NTRHY3FRRG1ibktnQkRlb1I0UnB0WGRUbzdjQk5MZzVIRVdRb3l6ZXV3a3U2?=
 =?utf-8?B?RXo1R0YzandmcjkwOEdQa2oycHlVVGVMUmJaL2FQWkZGcDZEM1ZQa2s1ZkEz?=
 =?utf-8?B?SmwwWEcvZEpxdFVmcTNmMzFZbThNMm1wSGFPY0dHTXBQMUdhbS9uczBlUFdz?=
 =?utf-8?B?SllzTVpqaTd2TU9tcDRJTFdzYW1tWlN1aGNIaGxZdWd6cGZMM1ZIekt0N1BK?=
 =?utf-8?B?N0FrSVdUT3VsSnBma0hJQThUa2h2elJoYnI2V3RoUWFZUmh3dmVsZVdTb25U?=
 =?utf-8?B?dnV0VjdZRUtVbWlQK3V0Si9zQW9YS1lENnUwMTdwbklaZzFISWoxanhxVVgw?=
 =?utf-8?B?SnVoeHIzWmN1dVY4ZlBBQ3FLcE84dmtFN3h4bHJIRFpsaHh4ZmRKZERWbEFW?=
 =?utf-8?B?S2QwbG5pTW1VenpCV00wbzEwTE5ZbGhQUkRENXZROTVIYThjMTVxQU9zSXVn?=
 =?utf-8?B?TDFzbzBESGllSm1JMlVTM1M4UHRQNnNid3dpYlpQVnV5VEhyV3Nyc0lKUmpT?=
 =?utf-8?B?Y3c3MHlLVXVvWm4xVmwxdFkzTEgzZC9lTy9lbXd5cUNuVWRvZ2Q2UDRta1Fi?=
 =?utf-8?B?YjE3aVpZSHFmaGFIdTMvZWRHcG4rQ0lxNVlFQ3pPNlVmOWJFVC9oSUtobURT?=
 =?utf-8?B?UzlCakd4a1ZTRTRSQWoyeVIwdGJMbG1YaldvTnRBMUN6MU85dFV4d2czNVdh?=
 =?utf-8?B?LzBvVWNxMGFNRmhRS1I3ZEhPNUthK3kxaFBTdi9zTWNUYysxUXhPWXBiT1RH?=
 =?utf-8?B?eTFzZ3c0WlNreWJvckwyTU5VRXJHREFFa1ZDWnBoeHJvNmtqb2xFQy9NRmxr?=
 =?utf-8?B?L1dnYXpzOFA4YUFldE9DTXE4bTVua0Qrcm1hZ21oTUJjTjNhaFRIeklHR0sy?=
 =?utf-8?B?MmJpRjBIV3c2VXpkcHdZSjlaSjRDOWNNeXNLRW45VlJBWk9IZjhRL1ExNjNI?=
 =?utf-8?B?ZXZHZGR4Tjg2eWpiYmhjZ3VTUFl5alRrRVl2anhTbUs4MC9wOTg5NnpmblU5?=
 =?utf-8?B?OW0xV1pheXdJK0JXaXhacS8xa3pkVThXMk5uL3A2Y3pwdm42L00zZ0hZc3pq?=
 =?utf-8?B?TjlnNXFSRzNscUV6aThSOVBZekpWYlQ5YVBqRGZoNXk1a3lXY2lpbHVYUytk?=
 =?utf-8?B?Tnh0MEpQY1VCOXBpMHhFNHU0OElJczFOcXJXdHpTUDJWc21sMEk1RmthQTBl?=
 =?utf-8?B?UDY1cTlKcmp4UFVYalh0d0t5N2h0eDFlNEc0bVl2b1pLWmRKalBqZTJLRGQz?=
 =?utf-8?B?dlBSS080bkZwQ1JLM1JyOElXMHVWak5pVmlmdDNhbFFSTDZWMVRreFVwSDJ5?=
 =?utf-8?B?cXBNamZGaFV3ZjlPbzBucGx3ZmtKZWY1L2ZDYUMwaEN0ZCsybVdIZXZuTXJR?=
 =?utf-8?B?QnJZZDMxeHhLS3BpVk9PK0p6MHlMNTczbmNkWGJpeTgxWldpTHl0OFgrbVlZ?=
 =?utf-8?B?aVVrKzZ0L3JDc21JKzFtWU90bzJsVDNUL25tbC9oOSs0NTQrMnZmOFdZZ3dm?=
 =?utf-8?B?N0t6NTZEYkRNblBvNDlXOUJPamZFNmNKN2pwS0pHckZ4NjJPb0Ivd2hmcDVO?=
 =?utf-8?B?SG9qUHp5NEI1Z0lHZmJSRDFMS3lYS1NFeEIxcEhsSkZhTURMZFVMSmJqbVhr?=
 =?utf-8?B?S3FDV21KNWw4empYYzRCSCtBZWViak43V2VycE1mb0FqTVNzSk1KYVJJaG93?=
 =?utf-8?B?WGFudlZYcmJpcytCN1hxcHFTRW9JdGptSzB4Tll2RVJaVzFha21GL0VRWk5n?=
 =?utf-8?B?YlpyTy9SS2QvbHE1MEFCWUxDcTk1Mng3d0hLZHlkK2MrSk8xamkzc2JPanNz?=
 =?utf-8?B?REFVZGxiSTFrRnhwbVFlVCtOR2RWTW1TeGsvdDZWcHhTZGJscnhZc011SDVk?=
 =?utf-8?B?cTdvWTdlRmxabGZGWkdYS09CTC9ydmFVeHh0YWhCTy9sa0VyTlZqZVFEUEph?=
 =?utf-8?B?QUh2ZFllUUNxbjF2RURhcnNEcEN5SGh4dzNScEo0K0ZUeTIvaURiQ3lITVRO?=
 =?utf-8?B?TFA5T2hMZW9qV2dFSk4xanR0SDJWdXlZeHlROVNEdnViUytkdTF1RkgrVS94?=
 =?utf-8?B?UGhpeDkvaWphM0lpcjhCUW40dWVVU3pKZzlMeU9DSEQ1OE5vZHFSU1pjQVYx?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec9a8bc-8305-4717-07de-08daa063f90b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 08:40:47.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYzzg9T8Ui1LRHVFCwVlpodgfm9IwmUyAj+T01m1BAwf8BVwmbaYJ2MFgqmZ3M48KnAqKDvPO1jsDYH1gT1jAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6161

On Tue, Sep 27, 2022 at 08:35:20AM +0200, Jan Beulich wrote:
> On 26.09.2022 17:58, Roger Pau Monné wrote:
> > On Mon, Sep 26, 2022 at 05:36:41PM +0200, Jan Beulich wrote:
> >> On 26.09.2022 17:25, Roger Pau Monné wrote:
> >>> Correction: the Arm memory_type_changed() needs to stay, as
> >>> iomem_{permit,deny}_access() is common code.
> >>
> >> Right, or we'd need some other arch abstraction. (I wonder whether
> >> long term Arm can actually get away without this. Even on the AMD side
> >> of x86 I don't think it's quite right that adding/removing of MMIO
> >> ranges has no effect on the memory type of accesses.)
> > 
> > IIRC there's no way for the hypervisor to infer cache attributes on
> > AMD SVM for NPT entries, but maybe I'm missing something.  Guest MTRRs
> > settings are completely ignored for AMD guests.
> 
> Right, as documented: "Note that there is no hardware support for guest
> MTRRs; the VMM can simulate their effect by altering the memory types
> in the nested page tables." That's something we imo should do, but which
> I don't think we actually do (see p2m_type_to_flags()). We respect the
> PAT bit when splitting large pages, but I don't think we ever set the
> bit when making new / updated entries.
> 
> >  I'm not able ATM
> > however to find in the AMD PM how effective cache attributes are
> > calculated when using NPT however.  I would guess host MTRR + guest
> > PAT?
> 
> First guest and host PAT are combined, then the result is combined with
> (host) MTRR. See the tables in the "Nested Paging" sub-section "Combining
> Memory Types, MTRRs". Of course things are quite a bit more limited (but
> also simpler) in shadow mode.

Thanks, so we could indeed do something similar as to what we do for
Intel and set a cache attribute in the nested page tables, at which
point we would need epte_get_entry_emt() to be not EPT specific
anymore.

I've created:

https://gitlab.com/xen-project/xen/-/issues/88

To have some reminder of this pending work, or else I would forget.

Thanks, Roger.

