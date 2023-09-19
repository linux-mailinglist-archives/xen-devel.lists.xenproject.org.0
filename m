Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC97A63D5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 14:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604663.942155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaCu-0005je-13; Tue, 19 Sep 2023 12:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604663.942155; Tue, 19 Sep 2023 12:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaCt-0005hS-UG; Tue, 19 Sep 2023 12:51:59 +0000
Received: by outflank-mailman (input) for mailman id 604663;
 Tue, 19 Sep 2023 12:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qiaCs-0005hM-6z
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 12:51:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ea6ff43-56eb-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 14:51:55 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 08:51:31 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6600.namprd03.prod.outlook.com (2603:10b6:a03:389::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 12:51:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 12:51:29 +0000
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
X-Inumbo-ID: 4ea6ff43-56eb-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695127915;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=LOVcqu+XxgY0eBNdYiKKZSJYbDqtTpxBVhKhgihp3RQ=;
  b=g/Jm+iKmTejXAZUEI0H0A90GG3ekVoCVQepEqkwUqiOQAKLC0WlMesKB
   3uMVgBpz0xgFtgauV+iCbvp6MQMNFxhZZstu7yq/BUBozM74MEaWF6VC8
   sUNYfZEyb2FOnqTAVnUuC6yw2+zo2trqTOqE/2N9wMpkfitQnsc11y3We
   g=;
X-CSE-ConnectionGUID: 8a2CIi/iR5mC5anWRh7tYg==
X-CSE-MsgGUID: 1MrtRFJSRBmXNsjkRnMCMg==
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 123099920
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:HkSB26xGVBQvyDcOK3p6t+f+xyrEfRIJ4+MujC+fZmUNrF6WrkUOm
 mFMCm7VP/rZN2L9LtwjOd/noExVvMOGmtdhGVZpqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPKET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTFHr
 9c5KXcMVE2GrL+/xo2BSrZwt8t2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WUxXKqCdhKfFG+3qdPmkGp6E4oMjcTZX2go/qDjGuVft0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH+8VWZhTup/8DNVlRsvlSRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGGM6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:P/o75aql/rvLohCd0wkrae8aV5tULNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6KW90Wy7MDrhHZ4c2/htAV7QZniThILIFvAi0WKG+VHd8kLFh59gPM
 tbAtND4ZjLfCpHZKXBkUmF+rQbsam6GcmT7I+woQYPPGMaEtAZ0+pgMGam+w9NNXp77PICZd
 ihD6F81kadkAEsH7qG7w4+Lpf+TrPw5ejbiCo9dlsawTjLoSKj7bb7FxSC/xEFTj9D+7ct9m
 DZjxf0/OGGv+ugwhHR7nTU5ZhNgtfto+EzYfCku4w4Oz/oggataJ9AX6SYvDcpiOuz6FAs+e
 O8xSsIDoBe+nnVdmGwrQDM3xD60DEyznf+xViTkRLY0KvEbQN/J9tKgIpYdhfD0lEnrcFY2L
 9G2GiI3qAnaS8o0R6NvOQhmHlR5wSJiEtntdRWo21UUIMYZrMUhYsD/HlNGJNFJy7+4JBPKp
 giMCmJjsw2TXqqK1Ti+kV/yt2lWXo+Wj2cRFIZh8CT2z9K2Fhk0kox3qUk7yc93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQCjLLHmZLT3cZfA60kr22s3KCYgOlb6Xkd0zvccPca
 36IQ5lXLsJChzT4c7n5uwAzvmCehT/LGbQIgc33ek8hlS2fsudDcS5ciFkryN7y89vRPEza8
 zDf66+S8WTW1cGObw5hjEWCKMicUX3pqUuy5kGs6XnmLOGFmStjJ2ATB/6HsukLQoZ
X-Talos-CUID: 9a23:U5knUG6oh43BCbj9qNsspEdOMeEkNXznkXL7fka+NlxpF6GkRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3An4xnEg5c/WJUKVN3u8IX7rAkxowxxr6yMm4vqq8?=
 =?us-ascii?q?svvmiLi5zATG4pxG4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="123099920"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D25jEhPDuoOnqchK7hncWB7FmNc453mEuqiH/4H01sBoaKYwMD8abk4RlTf0SLl0bWyAutAmT0zQ9PmeFZTODsiE2hxyqeDGWrSmw7jQ/3KoOBA0pANtERLA0cHr8lJTCSZ72EURSPkWZOs6aiw0V6Om7BVC5og3duDTpvgWiXN8eO6Xe4HMnMae1aEQ5nXUQkOWE7DlzGgIZAIqKOMcr4pYlZAUFsvDB0qS7sr8u8nXKDTnd14PsVzwPyoTCJ9gIfaj/Nn9T0XawpFT3wsgC3+Sg6j+iT7d3yQ51mPQ1zL3nrneC1QgDQCQLgo/5jzQLf/eg8G6J7Mb5skd6XS9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrLVvebv+NZb+UF1SZeb7lSiHynKe/N7TNyKlKbc5VQ=;
 b=JERaL9WvL3y/ZdcxkwD6YwjBkT3FLe58jzYu06uwjG5nq7KI1s721l3OlsnOelv1RMwHxas/zjYdMIGf8qtoXK696of151S8repad8LQbWUCMyR/1AofdLf+hoeCeUI1sz3dA7b/ioQxdby1VdOuez1RP9wwTfRE/spTi44kTvLMkqZKemO0vjDHJ871yXq0Vs7NsCeAFlk4Z8K3xdEfyUZCe9zF7RGpuoObIKFgYBRBNqpV7tLNBf2Cw0AFxZPwuKApLU0O/VKKOy3s0OJd+mbsQWGhfegxEYv6il4RtyX7ShBKgtVMUv/UmHbED7U/vVsjc5iZHPdfzATHrKBIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrLVvebv+NZb+UF1SZeb7lSiHynKe/N7TNyKlKbc5VQ=;
 b=my7jIOe2qedWV0qLeXrlWdjsXCz4bekIl5vRBYLTtqmIwECL2c94LoCCeVvJoVu1Vn92/XJl9vC3EAH4nRLUg/lGsIzP9fNY2quGHW7ZTliJaeYd3l9yOBnF8lkkSyitgydgY/yLHFbB+aK0sMjbeYd8Mp2dspMhaqTksvnX9OA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] console/serial: bump buffer from 16K to 128K
Date: Tue, 19 Sep 2023 14:51:18 +0200
Message-ID: <20230919125118.12657-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef7e158-fd12-412d-4a58-08dbb90f2424
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wjnNERmiGB1PpkRLgG3Vi82ifzcYw+N102iYO7xKtomoNRwO/IlDRv7n/Lr/q6Vvs2jxAxpjwrS8OZlj2//2alhbzsDsP2x9MhI/DhYOuudDbXzaDP9gsG5JF0pBRtQDm9L5YKP4zYUaHEOwyZnoSEGBr1tGbL/jbz1az0wTBlflgf1fxGdjQVZxcbSwywjeLTNUPwZ3KjqVwA7+xTO9o801WN2+NR3rp2LQkEEVO/kWT41+ehDjq91kZLKScMq4PSmyVzoQ/Ot/HGcMAoijDJ8lus7/KiJ15X8qY940hBv8iK2Z1BOKc3KtS82P0XA226EruZiUbgB48R8UEPrvBJOXQc2FWDJ7ha0cIHESb/GJwH1wf9mda0+X2m0TObvM+8gQwAVnqOGjWDwHZxwi4wpB6jwVJm4zQe04iJcxZ2S7L+WG1fDij/tPkUuPkxNh9GptVJT0L7KjNF6uYC3ev545Lxu3V5IQ2/a0iR1RR0idyrWRShAtbT4jxaDEr9p8VpcjyTK0UB8SRmjtRZbwu6ErNsxIOjuzhz3NyC5nf7cb91gBiK2ATo4Na0UyYvoK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199024)(186009)(1800799009)(83380400001)(66946007)(54906003)(6486002)(66556008)(66476007)(38100700002)(82960400001)(6916009)(316002)(36756003)(86362001)(6512007)(6506007)(1076003)(2616005)(478600001)(26005)(8676002)(4326008)(2906002)(8936002)(6666004)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxIK0ZjK2daV0lZM3cyRlNNQldFRExGdFVIU2R2MzgvbExLN2hEQlhIRzRh?=
 =?utf-8?B?cGxMVEM3YXJkMi9vdE10cnVNd3RCSFpmOWxZZzBoTklyWS9GUytoY2R2MTdZ?=
 =?utf-8?B?bUdlM2tXY2Y5b0FUb043RHlJWGNZeldGLzlndEVKRHU4NG5KVWRrcE4wOXVx?=
 =?utf-8?B?NjhRcG1vMGwzcGE5Y3JBNXBGMFV2TnplMWZiNTFsTXVlVEZPNzUrQ3VwUjE4?=
 =?utf-8?B?cnNsMk1oalZGK0FqRHN5dDl3MUJqSTFtNXlaOURyNStsUnRkVDEzRUgxMmFs?=
 =?utf-8?B?MTRjL0VKUlMwdXlOcncyQUJBTTVnNlkzUEhPRU5XOE5Ta0VlWmpuSWlWaUpM?=
 =?utf-8?B?Yi9pa1ZrdnZOUFpZWWRkSFkvOWRvaWF5a2xPOGg1NjErM0J6WjJmMU9LV0ln?=
 =?utf-8?B?Sk0zZnhianBpS2Y1cXVZNWJsNXV3eWlvczRyYVFxSm5INlU3TVhick1OMHp2?=
 =?utf-8?B?Q3NqNGgzdFVDRjJVSmptTlNNSUY1bmIyZ3ZvajNEN2NjWHMzbXY0aEdyWDZF?=
 =?utf-8?B?TjU2dWhuK1FQWk9yN2c4ckRiQVVhTFJ1Sm4xWFpBalJ4T3ZMM0xwTEN2UzAz?=
 =?utf-8?B?djNYbk56UWRiVlB4RE5Tb0Q2Y2h5ZlFPYlhGbWRRVzNTMHMzV3RKNWtUYjh4?=
 =?utf-8?B?VFZpL1hhYWhRcFYwbHJ4aUZRM21rV080Q01adlR4RWlqS2Zhak5jdzBVRmNM?=
 =?utf-8?B?YmgxUzFFMXVFODlkblc2RFhWTVYrYWV1QjE5aEFHUFl4MVROOVNPUE9EaEk4?=
 =?utf-8?B?RzYxSkJGR2h6MURRL1psclA0dEM0RTB2cy9pZDl1Y1E2UFcxYjR4OUxnNnNO?=
 =?utf-8?B?YzVLREFwRHk0eXE4eDNibjVBNThGV2RKR1pPdWxxemE4TWhERTgvQi9OODBD?=
 =?utf-8?B?REEzcUxzN1BSVjd1VWRyVzlaSnRKeXVJWVpHdVh4cXlkaGp3QVFUdE8zZW1M?=
 =?utf-8?B?L3kwQzlxTU03bUhOSnFsRm9HeG1oaVU5eHZ1bkJ0eDJQUVI0M29zR091VWV3?=
 =?utf-8?B?Smp0amZ4d1I5ZXhJRkx4UTFDQmlPRlNURmQ0eWd3NW85alo5WWJ6NDZqY1U4?=
 =?utf-8?B?WjhMVVFYcVh4Mno0Q1ZYcVVwQnhTdnorQ2tWbysvSStpWmUwcEh4V05FUG1S?=
 =?utf-8?B?blZIdERhbEI0dDZadzlxM2xwcnhnUXAxR1BDM1l6TUJWenIyMDhqaHZHQjQz?=
 =?utf-8?B?STM4TlN6aWZTb0ZPbkZLa2dDeGpOTWd6NDZRV3ZITTNXcm9FWGwxamx2MjlD?=
 =?utf-8?B?aWkzenNtakp2UUEvNHB5MnlvU3EzdjExL3p3Vm52Nm1zOHpRbEc5elY1Wm1U?=
 =?utf-8?B?cXMyVnRUc2lKS29yTXlSV295L3BQYlppMWdySitMUnBud09sMEdtc1o4MUs5?=
 =?utf-8?B?OU1Nd3dIK3EvaWtwTU5PT0tvOEFxVUZ4WTY0TVdsSW43MHlSSmNQNWg3OEFP?=
 =?utf-8?B?S1RXcTRJRENrdWRndlRZQkQzUEdMQnljaTczWHZNazgvZGtxeE5nTi9neUcv?=
 =?utf-8?B?bUg1Qlc4Z2U1cjljMkliMXZmQWppWkJGQ3NUc3l0RFhjQjI5N2g1RXpjb2ti?=
 =?utf-8?B?d2ZoT3VZNmlaMGVOTlBwTEJmQ1p0WnMzd29FdGkvaExpV3BPK1dBRmVQU0pz?=
 =?utf-8?B?RmN1Z0NlL2k5VVQxd2JpSkNhTjQ3Q1Z0dHo0K0ZKSmNuNlFDVlNnWWtKNERr?=
 =?utf-8?B?N1lJZWJ5SVlQSE1QUGxmUGRxNTJaSERXT2pYblZ4RnRydjVHOHVSSDZJWEVo?=
 =?utf-8?B?UXBvSzM4V1VqQ2tvUVZHOW9Nay9BU0lEV3hiOU84dHBab3g3RTFlMjMrQkdF?=
 =?utf-8?B?akcwck1iOC9JVzgxbkx0R3dMVkVDNm44OWRBS1RHaHFTZUpDRlZtNVVvOHVX?=
 =?utf-8?B?Y2ljNGdhbzI0V3FPajByOXpXbzlwNFkwR2FnMyt1SkxGQUFISTBLNTViNmtZ?=
 =?utf-8?B?SjlSTVN5azhOcTMrSzRBRVAzQ3YyZ2RpS0MveXdleFR4akpVY2VsaHp6U1pa?=
 =?utf-8?B?THRrZWFQamtzRlBmRk04Q0xsRFdYdWo4Y0lrSEE0bVpValJJcjVtK2NQRE1J?=
 =?utf-8?B?bnJySHRmVUxjbkMrOVpDajhJc0ZUNmlhaDUzc1VGYUJaV2NRdndhdTdzSkdG?=
 =?utf-8?Q?j5pgAaew6ZG96oCgeBzBDUiEP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uwFT9mUYfUxO3GPWZKuztgGiiYs+5jdJ8kv16K6pyxxZb2Hpe4HgRZffJkRMD/7bsPC/sVL7OBoFLNBgHuNSk+4sS9kLYouAgHLjALO/yRlPphSTsuCNzKRFy9P3HuPTXMEbMAeXccUr29Du981oCwFPD7OgZpb1bavMBLOQ4fjD3bK0u0KMHrXa5y//kyt4N4CmDLw9amOMDPQFQy73k5U2g4JJI9BIf1JPh3+F0nXUBL9/1vFAMb8QE+dLVba8xbEP4I8qukCnoSN+ncYBnpojmFh+kYTyscn5Bg0TOm7Pf/txgJniJvHvmnXTB5KFV1wslnmwf8+e1TAzZ6jUQ6Oe5spZVS7RjeoH6dPLUyq/jC8DtUNwNNrokrOFBXMspQfGZSEvLjyckw2CV/KKFlLhk7MMygu8K8zQx835MHw6XscSEkGcDej6cq7+ytgU491jQRhItdmiFh1/8tZ7TQ339EisrXAuhw4+BX3trpVlPIZ1dko91XrWwly0S/imKLxy0Xk9+PIyjWFQqYo0yJD3nbQxsF3oX4ZyLaq9bMMDmVoJtBzThPCYm06cl+k6Xqf8iUi3JKdhrT2bozX2ykMaDSOgTf4XQ0QgTKZBHtd7mjbxuivhxsh1Qg41XEUJ708S4iAwhjGyg/gzscZerr+3uqO0iBdwDmiVjxTq6NegQTskLXihO27EkFPTHwaHsRl/Xqjofqu4dS0dYw0qODHopvJryydN/doF51Z6td/DshRedS066XjZXb87238g41zTknKEdyp2I9vG1NaPgb9F1PBHeX8MHUq8bob+CoD3zXAtgsoFPS4laJ88Z0KBzWzBCinCWKK4eepcEyvGY5jZqWqDWuMe9eLa0qEn1Qw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef7e158-fd12-412d-4a58-08dbb90f2424
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 12:51:28.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzns041LzU/KcCix4MjhAPplPhu7x6vugj2GePpC+NyLVxeeAqUTarlNBCT8eE+weIvqymDeFRLc5DPr0V+6mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6600

Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
being filled halfway during dom0 boot, and thus a non-trivial chunk of
Linux boot messages are dropped.

Increasing the buffer to 128K does fix the issue and Linux boot
messages are no longer dropped.  There's no justification either on
why 16K was chosen, and hence bumping to 128K in order to cope with
current systems generating output faster does seem appropriate to have
a better user experience with the provided defaults.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
--
Changes since v2:
 - Bump to 128K.
---
 xen/drivers/char/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 06350c387371..1cd9cddfe1bf 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -77,13 +77,13 @@ config HAS_EHCI
 
 config SERIAL_TX_BUFSIZE
 	int "Size of the transmit serial buffer"
-	default 16384
+	default 131072
 	help
 	  Controls the default size of the transmit buffer (in bytes) used by
 	  the serial driver.  Note the value provided will be rounded down to
 	  the nearest power of 2.
 
-	  Default value is 16384 (16kiB).
+	  Default value is 131072 (128KiB).
 
 config XHCI
 	bool "XHCI DbC UART driver"
-- 
2.42.0


