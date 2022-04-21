Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644E50A0A3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310180.526907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlH-0007Xj-5j; Thu, 21 Apr 2022 13:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310180.526907; Thu, 21 Apr 2022 13:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlG-0007Pg-V9; Thu, 21 Apr 2022 13:22:18 +0000
Received: by outflank-mailman (input) for mailman id 310180;
 Thu, 21 Apr 2022 13:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhWlF-0006Vx-2J
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:22:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e89e0a7-c176-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 15:22:15 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 09:22:12 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5692.namprd03.prod.outlook.com (2603:10b6:806:11f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 21 Apr
 2022 13:22:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:22:10 +0000
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
X-Inumbo-ID: 0e89e0a7-c176-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650547334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/bsTBjNEwz+nuNpaTcn/VhN1csiAX9NFexTx2XLkEJ8=;
  b=ebMfD7/QKD9+KFUyMEvQqog42ynyHsp+fyg3QVTPpA0x9lTqgKGX6I6P
   /dOhr+FFfdXoUR4GYHrn4jq6r3ttFMDvcmSUVWCydVpa0BQ5MBD9/HXd3
   UaAQn4CIZcOBWdN5zVBPXkD8Smj19TQY8HtKthuT/SmALRC+TuqrFKtbR
   c=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 69485236
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HSJHLavrRg2Ypi4CTuzphcSXoefnVDZfMUV32f8akzHdYApBsoF/q
 tZmKTrVbq2KNmb9f49yPYvi9UkA6pbdnNJiSABt/CtmRSpD+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X4
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8bB4bOws4bXCVnHhAjPe5c5eSXIHWG5Jn7I03uKxMAwt1IJWRvZ8g037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IJmm5v2KiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgAzE+fpquTONpOB3+L6xM8PEXfivfORQu0DDm
 Xjc+VzDDjhPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWFTGWsuxcdX59cFrM84QTUkK7MuV/GWC4DUyJLb8EguIkuXzs22
 1SVntTvQztyrLmSTnHb/bCRxd+vBRUowaY5TXdsZWM4DxPL/enfUjqnog5fLZOI
IronPort-HdrOrdr: A9a23:6kjBwKyWlRS3cN9fIZxqKrPxseskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhOZICOgqTM6ftWzd1FdAQ7sSibcKrweBJ8SczJ8h6U
 4fSdkYNDSYNzET46fHCWGDYqwdKbK8gcWVbInlvhRQpVYAUdAa0+41MHfsLqUwLzM2dKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsX+9KK1wUh4S1bpXUd
 WHVKrnlbZrmBKhHjrkV1BUsZORti9ZJGbEfqAA0vbloQS+0koJjXfw//Zv4UvoxKhNN6Ws2N
 60TJiA7Is+KPP+TZgNcNvpEvHHfVAkf3r3QRKvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69485236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hunWtmTAxBGjZ4ixWsT4WgPn3qWzJnhRJEr96b7kBCnllSqhPFXXkcaUO1HxKgkF7EjOWhRm5wWzYZKx2VXQcRdV6TxzbEkLg+T4+ZVTvzcr1l8qmzvt7l8oF0UGTTE+gInCs5xSV4dCasFtSffurRNswart/cK9TPhRiXIHiSmwds6p9Ooe+n7+nsQflKNxmz8ObKYvZauCDn4aG1hxIz3djnuVufRGV2rLDUy46uLH70d+q9qGREMuEHt0X8T2bm6HGLBJ91JlD/rmOt+3hMi6stvhef4g9MRtvowENr1W1yk0Mxo4ODYDI7isjDF3XCaeO1kj/YDBwtpnPMsjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEx7VOG8mAayx6SJwjyMn32in/pxHdqc+RPxorUEmOM=;
 b=ikZqYrI9uw/se/mt8vbOE8ArzmNi2QVH99G67fFJ4yEUYtcjK5CJSHoIDTjIZNI56YBc3eH+0hJeYq4Nuurq7mwPF7Fgv8qabPOd3NQA5FM3ODROF76xjhilRXVoV7LEK6Daoom97rQeH5e9czd7COrO7NG9c8C0jXAZTK1S4hveogLZzezEYdSVbhSeMvv3ivudS+egyke8hKAeY7JnxQLML8EIWFMkkNlPM8r9Ngcmhb0DJ/bGyzs4U6kYTV575R4UNt+EArSNPDtq8hO76cL/ZapRl+HbqOhudYEH8FsV/mY7iFR3yEASSVlXKaZo0tAJuM7KvcPhalhmF/ku0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEx7VOG8mAayx6SJwjyMn32in/pxHdqc+RPxorUEmOM=;
 b=t+98rKSaD+ls4CWZdV7YdtB7ZnyNGhqSVo/2yYEEEcbvXMm0eU8VBY1ODPDJKxdj+zrEWVOQm/aqftK7nGQW7o1Yv8gtz6/BJUZSKMm5tQHeJHD85Ba7MyjnpKcEgPHA5FPB5FB25w9jlJMsI0ZSN/YZxqwoy88G8fX/E+PBdJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH RFC 5/6] amd/iommu: atomically update remapping entries when possible
Date: Thu, 21 Apr 2022 15:21:13 +0200
Message-Id: <20220421132114.35118-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421132114.35118-1-roger.pau@citrix.com>
References: <20220421132114.35118-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e600cecd-38ad-49a0-159c-08da2399f0c7
X-MS-TrafficTypeDiagnostic: SA2PR03MB5692:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB5692F1F95FB58296655D2D768FF49@SA2PR03MB5692.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	792vfE659+TBeT8rEsuB30HQ5i2El93f3wqpRKzowcGtFU3G/QOcBDoWZewGzJeXqVcKHKhuF92XWFeraKgfYXItoxID7gqMpOAGjsR5tdE2Jid2iEtdw61VKcBIXz8T3Qhz1/nNFU1peCq2ndkK5orbw7LaP5bizGzb0EoR7SAy1oWvT/dO7MWnHvhtqO/3/R3EBbGiySbAzkA5gzYppvm/TJovi/g+vVQ39WHs6nU9Sg5E0TFH97sp5dYXdf0wSaTd2Pg31eVcit8LHz4M3jtKM72dHr3x5klXBCS3kkZoGJ7tcKq9LPUgNs4VgkKV3UDK0XoJZ0Lo6IEEUPPlLccQkKUv6pAXdewjyRAPD2ypH4ak9fS4c9nLTxGUm0SgcAgM8sAJifs4h1olrhaFL0rNDenxrY9hY4QFKovD6Bs814j+E3B9znSwW/obEiOxJ84y9odbbbQdP6A+FIzfusf6RcMaMg2gEA2OXfcC6tJgqH5Y5ekHlc5ChA2nqNNdR6TApNVDCRdkNiIreZIAnfQmGnRhBZCCeD/qFIGhVUuLMmSgI52C2WBYRjg0TeuUpRo0Is/5/R23hkf9XOfAn/LoN3NYwTIoqDBuEESyKN8uET72IMSqy5w6Mm+Ol+/SIuUMfu7jIrvU+bhX6mlHkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(54906003)(8936002)(5660300002)(83380400001)(107886003)(6916009)(36756003)(1076003)(316002)(86362001)(6486002)(6506007)(186003)(66476007)(66556008)(2906002)(2616005)(66946007)(8676002)(4326008)(6512007)(26005)(15650500001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXNxQ1hJTXJ0Q0dIVXRWekJkaVY4TFdCUGcxbEdhU21jTVVOTEczSTdRWnhF?=
 =?utf-8?B?TTdSakVUc2JNbVplOVRGNit1aXFoWXNCeHNwQWtMcFBiSmxTMTN6MVdQMWZi?=
 =?utf-8?B?WkR0bkFwSDlrREZ2ZjU0NVBkenNWMGpOVjh5U1UremtwTVZ2NDdDK0ROUGo2?=
 =?utf-8?B?UG12MzltdVJWTkloNWJyZm5mTmdyNkVoWkQrOFIwclBIaWZmd29USFhiRFVH?=
 =?utf-8?B?V3JPRUxMbWg0RW1YK0Q4cWJvWlBjZS8wK3NQM1NZNmEwZmJqdDlGMmZMS2h4?=
 =?utf-8?B?NzFGcXNRL2JoR2krSE54ZUhUOXdWYmQvOUZHYW9GdWNUQm5MRlFYOEd3V3RK?=
 =?utf-8?B?aFdOTk9UUW9ld1NlL2FkRU5hUUNMMndTazNNVlBwN0xxQzlpa2Yzbjd5dEdt?=
 =?utf-8?B?VkZYL3hMbENlaG1RQlZLbWVtMnh3Q3FzK2Q4SndjTGt3bjJoSWo1bnJLdVFj?=
 =?utf-8?B?Wi8ySkpEak03blRyNkFaVm0rN2dMRDJuOC9EUTBQeGU3YXYvRzV3bHhSRHlO?=
 =?utf-8?B?Q0wxTGlkYUg0NGg2dkpSSW03N0NzQXJMbWtMU29lc3Y5eUZnbmNHNlNWVjJL?=
 =?utf-8?B?bWVGTEExbVdtWThTZkNwZTVva05ERE42dGdZTlVwdUVyMVMyTnRJNEQ3eUVx?=
 =?utf-8?B?Uk5GUVRCRnpMcG5YYXh4ekhua3IrenUwaUJhU3h1dEhBMUIxL1VpL2J2d1ov?=
 =?utf-8?B?bEdKWUxldUUwNEphVFN0Wk9vcllZTGVtRytvVjRpd3hlTzYvMkRVUXZvYW84?=
 =?utf-8?B?YjFXWE9tMUFpbjNxanByYnNtZE14MXUxVVNDN21OQXVTcllkU2JobFBZOUJk?=
 =?utf-8?B?VFlET1paeWp1V3BZMXdUSFB1U3YzVTFEMUtQMndzY2Y5M2VUNVJrMVg1c1dX?=
 =?utf-8?B?OXpJbkFRTFpaWk0yRkhyNzMrVEpVQWV0ZUdlSFNvallIeEVOTWZjY0N0TkRL?=
 =?utf-8?B?SDFDZEtIbHNvWjJ2M0dqN0VRdUlrZnlpWmorQWNoRmNmbkZPZ2MvbnIwaTNG?=
 =?utf-8?B?bU1ONnp4dCtVUjNRcGlFVXV1ai9GYTBjN3VwUTNkc0plclpSR2tPK3Y4SzBH?=
 =?utf-8?B?RlJSYUlhb3Z2L1VWTzVxZDlycm51NlNTcWFScjdJRXpTU0VjcmVnSmc4RTdl?=
 =?utf-8?B?R0tvcHgzRVA5MDdXS2hYNTIzWXZ0dmxGaW04dnljVDQ0TkpUSFNqUWNpc0sw?=
 =?utf-8?B?SFVBaTMxeTBPM1k0bXl6aWN4SGZDQ0xERUo2eHpEeEFnd3FaV1ptdCtXM0Zh?=
 =?utf-8?B?VFBnTHhZZHRWWHh3aXExRjZlQVdocTFoSlVuK21oMHNNTDlleHdmSk5tQU9m?=
 =?utf-8?B?V1BOUVdHblBmaWNlZjUvSE9sOEF2SFJkNHQ5TlQwZ0JWMkFueWRONGRnRlB5?=
 =?utf-8?B?NzNldGpIOE1vZVJ3d3dLQjBjQW1WZzM3ZjNkbDNabVN0eDBlY1pncHVGZHB5?=
 =?utf-8?B?Wjh5Yi9Nc3J1eUp3OGEvM1hMVTh5OXQ3YlJ2OVkrOUZ5dHNJSW1La3A5V3dU?=
 =?utf-8?B?ZU5acVA4QWFHRXJiV25FL2tCQVVnYVFlUXBqWHVBRHhDMWZVOWlQV1pWclBi?=
 =?utf-8?B?UHd3dVBySU9XSFNkMHV3N2ZxTDhLRmVEb0tOcGd1bG8zSnVwTkNEQ2UzSkNE?=
 =?utf-8?B?MmhUbGM4WUgzOUJaLzZQUXpFVUt4ZnBodWVIZ255YzRmOEswYUFseHJxZ2Fz?=
 =?utf-8?B?THdWeFY1TU4wc085c284bDNxY1B4cTVwTEY3UHd5U041YWY2cWg1eVlsejhE?=
 =?utf-8?B?T1RnWDFXVmMxT1JrZ3dtbGlmdDcxV0s2WUlOcFFkVU1ZcUVzK3Z1OEx6VVR0?=
 =?utf-8?B?RXp1Q1RWRUlxbWgvY1FGWlpuTko3TFc5c1lnMkZKN1JPN0tkNGphS1B1SmF2?=
 =?utf-8?B?d2dYeEpPZjVuSEZVdTRvMVdLOHJtYk9sbVNnTlR2L3ZDTHNuZkNqMVljOThX?=
 =?utf-8?B?QllzOW4rNXJpWk9BdGVoNXJpVUcxUFRTVDlaRksrZmxZVEFFL0U0ZS8vNUg4?=
 =?utf-8?B?d3RrSEN0Y2I5clVCUlE4YWtGZHA0Z2ltY3pVYmJRWkUzcXB2cjhrTVlndWxq?=
 =?utf-8?B?cFVTbzA2QmQ5cXRuTXZpdWEwTlpQUTFWMWpWS1ptRm03cDllQ2F5TEpDOTNV?=
 =?utf-8?B?YUl4RzR6SE9sOVNaN3hBWStGN09tcWR3UXVJKzd6TmpNdXZKRkFKWkJUNHJG?=
 =?utf-8?B?RUxUQm5rYzBoektLMnZzQnVFMnhyeStQSXBRLzRkWnVFL0xOVHdBMFZHbHNn?=
 =?utf-8?B?aWo0Q3ozZmg5b3hMb3dockkxcC96TVlJUFhST2V3emUzZ294YWp6K3ZQTkc5?=
 =?utf-8?B?WFVlM2dGdnBrVkdyZkF3akIzSDJzS3JhaGJJQ2M0N29wQ0VFdmgzUUlVNmZY?=
 =?utf-8?Q?hYedFj3mE3hWr4wc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e600cecd-38ad-49a0-159c-08da2399f0c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:22:10.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bicqIca0jy0XNgX+NeCxIuK0nQs8Fm6RPimje78Fz8vJqqIIn+hkQ+DzfunnpbEwcITxwAv7wJ46sznvGRsNFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5692

Doing so matches existing VT-d behavior, and does prevent having to
disable the remapping entry or mask the IO-APIC pin prior to being
updated, as the remap entry content is always consistent.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_intr.c | 31 +++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index feed1d1447..b24e703c75 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -39,6 +39,7 @@ union irte32 {
 };
 
 union irte128 {
+    __uint128_t raw128;
     uint64_t raw[2];
     struct {
         bool remap_en:1;
@@ -222,6 +223,21 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
             },
         };
 
+        if ( cpu_has_cx16 )
+        {
+            union irte128 old_irte = *entry.ptr128;
+            __uint128_t ret = cmpxchg16b(entry.ptr128, &old_irte, &irte);
+
+            /*
+             * In the above, we use cmpxchg16 to atomically update the 128-bit
+             * IRTE, and the hardware cannot update the IRTE behind us, so
+             * the return value of cmpxchg16 should be the same as old_ire.
+             * This ASSERT validate it.
+             */
+            ASSERT(ret == old_irte.raw128);
+            return;
+        }
+
         ASSERT(!entry.ptr128->full.remap_en);
         entry.ptr128->raw[1] = irte.raw[1];
         /*
@@ -299,7 +315,8 @@ static int update_intremap_entry_from_ioapic(
     entry = get_intremap_entry(iommu, req_id, offset);
 
     /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->flds.remap_en )
+    while ( iommu->enabled && entry.ptr32->flds.remap_en &&
+            !cpu_has_cx16 && iommu->ctrl.ga_en )
     {
         entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
@@ -366,8 +383,11 @@ void cf_check amd_iommu_ioapic_update_ire(
         fresh = true;
     }
 
-    /* mask the interrupt while we change the intremap table */
-    if ( !saved_mask )
+    /*
+     * Mask the interrupt while we change the intremap table if it can't be
+     * done atomically.
+     */
+    if ( !saved_mask && !cpu_has_cx16 && iommu->ctrl.ga_en )
     {
         old_rte.mask = 1;
         __ioapic_write_entry(apic, pin, true, old_rte);
@@ -383,6 +403,11 @@ void cf_check amd_iommu_ioapic_update_ire(
         /* Keep the entry masked. */
         printk(XENLOG_ERR "Remapping IO-APIC %#x pin %u failed (%d)\n",
                IO_APIC_ID(apic), pin, rc);
+        if ( !saved_mask && (cpu_has_cx16 || !iommu->ctrl.ga_en) )
+        {
+            old_rte.mask = 1;
+            __ioapic_write_entry(apic, pin, true, old_rte);
+        }
         return;
     }
 
-- 
2.35.1


