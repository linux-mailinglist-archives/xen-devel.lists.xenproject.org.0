Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B4745855
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 11:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558041.871819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGFrW-0005WH-1t; Mon, 03 Jul 2023 09:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558041.871819; Mon, 03 Jul 2023 09:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGFrV-0005TF-VC; Mon, 03 Jul 2023 09:28:49 +0000
Received: by outflank-mailman (input) for mailman id 558041;
 Mon, 03 Jul 2023 09:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G/7H=CV=citrix.com=prvs=5416de508=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGFrU-0005T9-1a
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 09:28:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 007227dc-1984-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 11:28:44 +0200 (CEST)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jul 2023 05:28:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7257.namprd03.prod.outlook.com (2603:10b6:806:2ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 09:28:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 09:28:38 +0000
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
X-Inumbo-ID: 007227dc-1984-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688376524;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yXG4lmvoiM4rScTtfKniDJqcjh7RsCVbVHYcfuBUC04=;
  b=bDRTKFaJz60DuaoZgjXXUNanzhYr/oo0Ad325W3dMTQ8jf0uh0eZ8Ecn
   sIRZaa660y6ndPB+Bm3gN8vL8fCxyuDPixRgReUIFMHg20I2mhj5jcoz7
   baGWOiG6lhYwpNzr9jyAbPc3LHPpJhHsgjrsW5hyyoo103tgSVLIpK8dy
   4=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 114852342
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jI79Mq67sAi+C6c+5ZcJywxRtPbGchMFZxGqfqrLsTDasY5as4F+v
 mZMCmuHb67fMWb3f9xyaovi8UgAsZ+Az4IyQAprpS0yHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8T5geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 fkhCg1VREu6oPPn8bO3ZblBuv4KBZy+VG8fkikIITDxK98DGcyGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0ooj+GF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxH+rBdhJSOfQGvhC0QWO2EYXKicscgGVp6O6j36jZ/EcJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUj0qy6+RXCnGiqr52REgotvFyIBySi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:o/wo4KmO3FlL3fhdnn1GbipWA4DpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:xDZ9Em6b4dCwhFkXUNss1EstOP19WCbk62aBEk60JjZEdIe8YArF
X-Talos-MUID: =?us-ascii?q?9a23=3AbsQ6pQ7NFoLZmQyKsom0SPUExow5u7mwIkQvq68?=
 =?us-ascii?q?h4eeCby91Cyqhr3e4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,177,1684814400"; 
   d="scan'208";a="114852342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFlFbuCbvjBD2ywW/gITMlAZkKXM7/mip5Z6R4k3w98CaKaRcq9im5J/3xEGn1HAZdH8F4WSnbNhfhMkM6PDvR46csewyylpFMoA5RxSXyyKgZlcFNyfHekb2siDL1seKqdzDZykikw6RcroRmz1Ii0yLIW5/a5xclSWmB7R/MfbtEbxlXZYLBR0L3Cv+J5RasNmWRYJMUYsUZz4bs6YxvvdtUOgF1VDsIyw0/g7Ew//peiu6LY9mZy0UdjMAdnD5dtNJZQDicnbkVlCekJO0K+W7UhxREXOaNPlG3Ty+gxwjJSE+A1gwLHO0vwPgDlE6bla6a8cHrfEraBeGIXtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLP1TraNndqjN77FTbv4iykyD/Gr/u0nmg9JO9jv7ac=;
 b=jihuNKG2+0eELS5HZK6v1k4A3wPZGmrTRaMfcYv1F5m6E0aE+pK0wA0C8SeOuL2wNKctEJv/I3l1kdcKUoS8m0fp35cXO03CVbCsiYtlkVArxs26byFzkuwabvIvTd4OSbuM7ZCPHXIkD0r993UuNGsLD/kzKGOo3uuwI8nDAe4zMGOKjTp+Q4COMpEZUmAkiwJpDiMgBTZmofFtWO9qsJ4Zpb/IkVdFhIrTMYAnC3ZuhmJMPvBA2YCP6/Jo57l3GWVrH7AeTrHPmE7OJjfpwCj5SBVze0fmfZx1MpnWuysIiCrEQK9Ya/3N08zv+ZUSNfnimXtd1nghDHi8GLRSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLP1TraNndqjN77FTbv4iykyD/Gr/u0nmg9JO9jv7ac=;
 b=iAeUVVLBlKTVENMEMpVVhZcHvUlG43kTS0AG9WPssu8QdrmKcMs8eCM8eeN2YenKwXXoywhFU5ve3zYpDGzNQfhXqZc62AaX27groxOgJnZJ6bg/MSpUYouaT5a7o6oZTWExa7Yvf2egRaQpqDrjCKHKsNUaBUFs0janqYXYOHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Jul 2023 11:28:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] amd: disable C6 after 1000 days on Zen2
Message-ID: <ZKKUvxZdK8RuEDdx@MacBook-Air-de-Roger.local>
References: <20230630131820.29323-1-roger.pau@citrix.com>
 <f77359a0-7c14-7365-bbb9-02d86fc08af2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f77359a0-7c14-7365-bbb9-02d86fc08af2@citrix.com>
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 26aedba8-6dd3-4721-5972-08db7ba7e1a9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	slzp9kfDHhWzUExUl31oaPx5WXvwNFYJUZiNknOMO7rKzUE5vFzTDlRe12M9s/NBg/R6nYwqqRYfEJEMYIa5lnBFWGCItNbWsFZnHjy7bPOCVAOFj9BjcayVW+eipDoVVsR3I46QhCjTGRp1VyxDPQL84bJfXCrmB+xI4GZW02kYDuEv7htuZwVfcFJgmRyhu7hh6+BbT1a2i2NwtPicmHTXWGEK3nZb+dpARPDK39StCqEwFAJ+Y53OCExJJcqM2M9qvlZfiZukD0jr4FCQIX917hrXuMplNJk/PYXHJQ6a0cbex3da9DWlc7lzbIYkzXmB2r/TiaifZE9H4UWxv0+XC1CzWvoIBNmBIQhrSfkvA8Jg/UO/1YB5QE3EmEP3OvPK/FWNE87RqE/fjfisgrAyxS1+XjaUrD5f3jcSZ9xhuJYfXa9T7EMpeSE6dLFmT5PKKMTmgUFYVOIJ+h1qNxzn1mzvYWuHh0Diu/xNWfATjCwmSWGHfJU8e2SGOeNCOCxN+0i+XDczUc5gTsjfW5qTYotb7N+SPo0aexK7++renW/6NiTrH4QKE+/ytBSFZMxRE8VewGyk2ZtwGqzI5+KYQYgpsJFCogF5Z4MfAlYxtiXYLVFzyKEv5jaQSjfN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(2906002)(41300700001)(6862004)(5660300002)(8936002)(8676002)(85182001)(86362001)(186003)(82960400001)(478600001)(26005)(6512007)(6506007)(9686003)(6666004)(53546011)(6486002)(316002)(6636002)(4326008)(66476007)(66556008)(66946007)(38100700002)(54906003)(83380400001)(221023011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW9BL3lMRmtDeWVwNWp3bnl1WHBWUjVSYVp3SE9uM0dYWVZjSUFoZzVCQlVh?=
 =?utf-8?B?aWFJcC9RVFdtVXYzNXdzMzhpbk5LRk9LRkM1NlZBVkhPbTdPeFE3NUREZVZs?=
 =?utf-8?B?eFN0SVBGWThlUDJnSnMvQ005ZUFnV2RCYjFERklIYmZGODJZb0V2S2FQdmIr?=
 =?utf-8?B?dkl3U3NwN0RYR1FUVlRZUDRjQTdKbTl2VjlSSkF0VkZMTktsb1lYRDBWL1Rn?=
 =?utf-8?B?OE5DR0w2U2VobjJsMVdPS3lxZTQrQUxxUkRiVC9yanNIeVlEYUprODY3UTJB?=
 =?utf-8?B?ZTNhc3RXM2FMdEYxcWhIQXRXM1dJL2JDcnZGalM4SG5Dd3N4MTJ0NUhEVkI5?=
 =?utf-8?B?dmJvNFVrWG1oWjJENHZiclRoNmtqMUlsSGhIK0ZjS1pzTE9vU3hMRXJBZ1JI?=
 =?utf-8?B?YkJtSTJ4QjhDYU84eWJhYVNrcmhER1FTdnRRdDNydmh1dWJQK2g4dzgzZ1J0?=
 =?utf-8?B?NmZ2eUlQWEJ4amxhNkt1U0ZIaUZOd2ZUS2o2ajAyMVl3ZFVTYmtLL3BnaGlm?=
 =?utf-8?B?MHBPdk9RYjVKdDBSRDVRTzNHaXo3aTB2ckRRWjV0dklXdGI2N2VhR3Jnb0M0?=
 =?utf-8?B?YjIvKzdBOENoNGpibDRkVHBVYXNyS1dwWWlreWUycEhZQkNnYWxmdmQzblBZ?=
 =?utf-8?B?dS83WElHVm8vNXBYVTh6NVFFS2dabXBMS3A4WmQvUTFBVno4cnkxeGNnblpq?=
 =?utf-8?B?QlFQVDVBdkhOWlZUSkg0bmYvaTRuZ0t6OFplTmxwQjYwM2RaaW5JZnhwTkhO?=
 =?utf-8?B?UzhQcDlpTG5NckhwNVJZU0NUUit5dGFZUWtnNVRyOHNUWDRwYjI1Nk1FbEF0?=
 =?utf-8?B?WmZ4U2h5M09SbjE1WWFtQTJLSDVIR3FpMzFTTU04QmkzeWRNTmg2SzFQT0ZE?=
 =?utf-8?B?U3Flczh3NGo3MW5KMU9SK2k2SWtSWDc0bTdJOGVtd3NsOWh3RWlrUDFZU2FB?=
 =?utf-8?B?RHg0WUtSZEVGcFhkTzdPZFR1bXk5RGl0Ry9DV3RmYm9RZXZZc0ZmekNlVjJu?=
 =?utf-8?B?UFhkOWNxY3JpeFRiMHdNaDVJNlcrK1NZUksvWDhMZ2xQSGdwSk5WQ2lIQVpQ?=
 =?utf-8?B?cFA3ZWxoTlFDdWl5NUhaM2ZZK216Wk81MklmdDk3UDJEV0c4dW1OK05RRzdj?=
 =?utf-8?B?bDRTVnMxNlRac05LKzBOdzZGNkZjNTZrak5VUVpLMGRXd2pMelNJUk9vU3dC?=
 =?utf-8?B?SHhCRENOVzhhWHBVbFFKU1JWV0JhWStvWWxRNzZDZGJtVXJWREovUDQwN0x0?=
 =?utf-8?B?bFRkREVMQ045cjM0VFcvaG1qUWp2Ryt5WG1HOVdZVVk2dExLTnJwakM2b3lX?=
 =?utf-8?B?R1RwVHRvd1A1ZnlaNDc2NnVTeGZlZUhubExuSHp0OUJNYit3TW9DbDl4cVlK?=
 =?utf-8?B?c0VEelo1ZHJDOW11alFoRUJOVFRQNHZnM2Q3cVdxck5Gby9KbnpnM3FiMlY1?=
 =?utf-8?B?KzJ3MUU1aDVnOW9ydEZUUmFaeGhHL0xSUXNuc3Z0OU0wMi9XY2JEL0lkWHl5?=
 =?utf-8?B?WGxNNGFaYk83QlNhcUFpYmE0YmgzcGxIbFV0dHhYMi9SQlZRMlpXZmxaVGdH?=
 =?utf-8?B?ZWJIVlQ3S3N4c1ZiMHJvWjVpODVXMkdsUm12MlBsMkcxK3QrYUZmSWE0K3ox?=
 =?utf-8?B?N2tjZFFjV3A3cHF6aStMa0NIcm9CYjFQdzNUWVp0Ukk0ZE5uSldxa1p0R3Yx?=
 =?utf-8?B?TkErR2E3cGJvQ3ZzMjZsdjUraVRPWXhjQ1ZQWG1IKzEvU2NlSXJpNlhxVGJH?=
 =?utf-8?B?ajRMc2hSdE1aTWpwM3R3eDRZVFhTdXVFWTkrWW41ejRzOStwZjF3T2JFWDgw?=
 =?utf-8?B?VklSR3JpS3dDUFZGUTNUeXBZbktnWGV1REtPaFQ2NllTMkJaZ3ZxUC82My9I?=
 =?utf-8?B?RjRsRmlPbGVWc25Pa2Jram9xTlpUZWRVVTFmby94SnBwKzV5Lytyd0U2Szh1?=
 =?utf-8?B?RWptZW5TNGN0cURoMk0xanZtSGxXTVlZemZGdDJ3NmZBNlFXZU1VaDFUY2hH?=
 =?utf-8?B?aDltTjNFZHVvbXRwNzhzUGMvV2hwQW41SmM5b3FkYW1HcWhmQzIzVVhCSGhW?=
 =?utf-8?B?S2RzMXA2SkNMT09iNytzTjBERXBDb05LV1lRTzk1WFBudXlUaFlCalFsY0xI?=
 =?utf-8?Q?ogYxg2ZNdD4kvhgOnYx0v4oJA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UayZq3vraZuMSBw2d7np8DPttTHtMbKeZiKIVVJmu2GLpCKLOeKUvzyviiPACjcKIlY5E5hku8dj4pLa4PT3JUTihGjhpUWEX5nuAriT/td7tdgAYhAIDAkAcVzfr++pXJazpDUEx2M0E4HNdPFPr+I1Q36MiAI+qTnTqszj4fzt1a0urE6NrTKIQQ+kU9Oa+SUmRm2oCoYwMgoCCeiDm2Hh6gSmBu09GqTbS9AAbLUYZM+VFxFBV/kMf1+NPdNwybi0ZRK0t6SM1zwYMXLegXK452SWemqeFoCVF/KZ/aOFMIAKgV3xOCA2fG8Q3PGPiykJWCQQ1992NiRjH0snPxSaiBMpL8Xou4YICkYxJHAxQ+8nPkZYA15iS8QygUI2Ndu7tMLquBprQvJKfPswOrPzlTg9qntZFPAi16pARxL3e6qS1uR24e03X0ycMvYkQjnxxnYPcTDP6iJp9EzUm/r16A4n2T1FSRAg0ubIMt3ljuXS6vW+6uMg1570TLmlWe0z/7vvIpnglyggY8+ksmsb2H/gOt2aLCpTX+fPhjt6xivKphUY5KKsP92cCWW7Pv6cUcVs0xhxBL5PIwU3dP8BgI8QMiQVwBEqYYT9X7IxFG6kEU5Hn6zgDhB7xVLAlXEoP7/h21LU8frqBsJPQqtXwECYvwMkcK8J7s271xkwr6SBH2PfCQzb/QwhfMF4u7hMyv2Q5w8tKS7f5Abw2VCX0+CgOavGexn/ERsnVgmQqKBwMhiXG35/13+q8JcaNOseQBX0LCstRM2kgEcEdMQjZngKk30n24tXpMdVc88OOosCzzuUuROSfjkgPFtmxB7mPpLTUvoqq+JXPT2OMLx0ffyHPQpQHdSvG9CePlw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26aedba8-6dd3-4721-5972-08db7ba7e1a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 09:28:38.0654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HACn/XnNDaIgTuXTNGV3EGjRDNk+fzEOpWjLQroT8NPajQhCkUiEqGFv+KH8ZDfEwYhv00QimcH2x/b0t0YGQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7257

On Fri, Jun 30, 2023 at 06:10:10PM +0100, Andrew Cooper wrote:
> On 30/06/2023 2:18 pm, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> > index 0eaef82e5145..bdf45f8387e8 100644
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -51,6 +51,8 @@ bool __read_mostly amd_acpi_c1e_quirk;
> >  bool __ro_after_init amd_legacy_ssbd;
> >  bool __initdata amd_virt_spec_ctrl;
> >  
> > +static bool __read_mostly c6_disabled;
> > +
> >  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
> >  				 unsigned int *hi)
> >  {
> > @@ -905,6 +907,31 @@ void __init detect_zen2_null_seg_behaviour(void)
> >  
> >  }
> >  
> > +static void cf_check disable_c6(void *arg)
> > +{
> > +	uint64_t val;
> > +
> > +	if (!c6_disabled) {
> > +		printk(XENLOG_WARNING
> > +    "Disabling C6 after 1000 days apparent uptime due to AMD errata 1474\n");
> > +		c6_disabled = true;
> > +		smp_call_function(disable_c6, NULL, 0);
> > +	}
> > +
> > +	/* Update the MSR to disable C6, done on all threads. */
> > +	if (rdmsr_safe(MSR_AMD_CSTATE_CFG, val)) {
> > +error:
> > +		printk_once(XENLOG_ERR
> > +		"Unable to disable C6 on AMD system affected by errata 1474\n"
> > +		"Reboot recommended, otherwise system might hang\n");
> > +		return;
> > +	}
> > +	val &= ~(CSTATE_CFG_CCR0_CC6EN | CSTATE_CFG_CCR1_CC6EN |
> > +	         CSTATE_CFG_CCR2_CC6EN);
> > +	if (wrmsr_safe(MSR_AMD_CSTATE_CFG, val))
> > +		goto error;
> 
> These MSRs don't fault, and we already excluded hypervisors previously,
> so the safe() doesn't really help.  The only way you'd spot a failure is
> by reading back and noticing that the update didn't take effect.

I was worried about people explicitly clearing the hypervisor flag in
CPUID and then Xen crashing on boot, so better safe than sorry.  I
don't see much value in crashing here if the MSR is somehow
unavailable.

> Independently, this really really makes me want to dust off my
> msr_{set,clear}_bits() helpers to reduce the boilerplate required for
> logic like this.
> 
> > +}
> > +
> >  static void cf_check init_amd(struct cpuinfo_x86 *c)
> >  {
> >  	u32 l, h;
> > @@ -1171,6 +1198,9 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
> >  	if ((smp_processor_id() == 1) && !cpu_has(c, X86_FEATURE_ITSC))
> >  		disable_c1_ramping();
> >  
> > +	if (c6_disabled)
> > +		disable_c6(NULL);
> > +
> >  	check_syscfg_dram_mod_en();
> >  
> >  	amd_log_freq(c);
> > @@ -1180,3 +1210,43 @@ const struct cpu_dev amd_cpu_dev = {
> >  	.c_early_init	= early_init_amd,
> >  	.c_init		= init_amd,
> >  };
> > +
> > +static int __init cf_check c6_errata_check(void)
> > +{
> > +	/*
> > +	 * Errata #1474: A Core May Hang After About 1044 Days
> > +	 * Set up a timer to disable C6 after 1000 days uptime.
> > +	 */
> > +	s_time_t delta;
> > +
> > +	/*
> > +	 * Apply to all Zen2 models.  According to AMD revision guides at least
> > +	 * Rome, Castle Peak, Renoir, Lucienne and Matisse are affected.
> 
> You probably want to replicate the spectral chicken comment about how
> identifying Zen2 is actually very hard.
> 
> That said, I don't see anything which limits this logic to Fam17h.

Oh, right, will add the missing fam17h check.

> > +	 */
> > +	if (cpu_has_hypervisor || !boot_cpu_has(X86_FEATURE_AMD_STIBP))
> > +		return 0;
> > +
> > +	/*
> > +	 * Deduct current TSC value, this would be relevant if kexec'ed for
> > +	 * example.  Might not be accurate, but worst case we end up disabling
> > +	 * C6 before strictly required, which would still be safe.
> > +	 *
> > +	 * NB: all affected models (Zen2) have invariant TSC and TSC adjust
> > +	 * MSR, so early_time_init() will have already cleared any TSC offset.
> > +	 */
> > +	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
> > +	if (delta > 0) {
> > +		static struct timer errata_c6;
> > +
> > +		init_timer(&errata_c6, disable_c6, NULL, 0);
> > +		set_timer(&errata_c6, NOW() + delta);
> > +	} else
> > +		disable_c6(NULL);
> 
> I doubt the smp_call_function() is going to be happy at presmp time.

I did take a look and forced it by setting delta = 0,  AFAICT it works
fine, cpu_online_map will be zeroed, so on_selected_cpus() is just a
noop.  Interrupts are enabled by that point, so I don't see a problem
with this approach.

> Do we really care if we're already beyond the timeout?

I would expect that C6 will already be disabled in that case, but I
don't see an issue with Xen also setting those bits.

> > +
> > +	return 0;
> > +}
> > +/*
> > + * Must be executed after early_time_init() for tsc_ticks2ns() to have been
> > + * calibrated.  That prevents us doing the check in init_amd().
> > + */
> > +presmp_initcall(c6_errata_check);
> > diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> > index 2749e433d2a7..5df090fba791 100644
> > --- a/xen/arch/x86/include/asm/msr-index.h
> > +++ b/xen/arch/x86/include/asm/msr-index.h
> > @@ -211,6 +211,11 @@
> >  
> >  #define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
> >  
> > +#define MSR_AMD_CSTATE_CFG                  0xc0010296
> > +#define  CSTATE_CFG_CCR0_CC6EN              (_AC(1, ULL) <<  6)
> > +#define  CSTATE_CFG_CCR1_CC6EN              (_AC(1, ULL) << 14)
> > +#define  CSTATE_CFG_CCR2_CC6EN              (_AC(1, ULL) << 22)
> 
> While MSR_AMD_CSTATE_CFG is liable to stay stable, the CC6EN bits are
> uarch specific and not applicable to others.
> 
> I'd suggest keeping them local to c6_errata_check(), which probably
> ought to gain a zen2 somewhere in the name.
> 
> They definitely can't say in a global header with names that don't tie
> them to Zen2 specifically.

That MSR and bit definitions are also available on family 19h model
11h and model 70h (with even more bits added to the MSR), so it feels
weird to name them Zen2 specifically (as it seems AMD is attempting to
keep the current bits stable across families).

I can move the defines to inside the function, but I'm not convinced
those are uarch specific.

Thanks, Roger.

