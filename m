Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CC5E75E3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 10:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410664.653766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obe9c-0005fM-KB; Fri, 23 Sep 2022 08:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410664.653766; Fri, 23 Sep 2022 08:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obe9c-0005cS-GW; Fri, 23 Sep 2022 08:35:24 +0000
Received: by outflank-mailman (input) for mailman id 410664;
 Fri, 23 Sep 2022 08:35:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IiHW=Z2=citrix.com=prvs=258ce0bc8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1obe9a-0005cM-Ns
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 08:35:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fff4f1-3b1a-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 10:35:21 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Sep 2022 04:35:17 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5584.namprd03.prod.outlook.com (2603:10b6:a03:278::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 08:35:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 08:35:14 +0000
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
X-Inumbo-ID: a7fff4f1-3b1a-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663922121;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J6VzEWar2+vf4N6QfUJDG1PMjlsp1y2eNuU5dusljzY=;
  b=P0okAEL3eJchR8gZBlbc4Zyc0kGhZUIDi33KGL+h4UcYtf8BnT4sPSla
   S64G1XdrDggdkAAoGCFYxdS6XyT5qXhGvbXKj+2LPqBj8xgfnZ+/HWvMO
   l0nFtAGH1u38fo/s6hU9/ao1FhDP5K1DgqBNgx0iKrHyI4jaT2aPks27t
   I=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 81198973
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A7QUr9K9bOUaKmuVRkeURDrVtTnXE43xwBUUsX?=
 =?us-ascii?q?f1CW+u19neyolnKptwKyRlVrF5Zr7ATAcN/5KyuV8teGgRPYd6hq9398Xa1/?=
 =?us-ascii?q?0de1qSRicyJiLY5MfPlc5BIijHeKQ7a1hNCHo06NyRhVaM0AxRsi6XJydNRN?=
 =?us-ascii?q?0mtvJXySpaf4zP8F3A9I83Sh2xirToWCCTql0YQlFONVbp+yoH0Vrmub8fsN?=
 =?us-ascii?q?Ea9uVBIliZUpEWsGLCxk8UXKf8Dl0rHd51wgsC2mtODlPrly8mOVlEDknaU5?=
 =?us-ascii?q?f4myV/5Ak/n9sFtYfoXNtfQLycVlcOK4ZR5Iu1kcs1J/HQEwSbEJVOZsoD5K?=
 =?us-ascii?q?Qs33x5/dxXuM0L8N2dhGRpCgtlY2k2B+0DzCm2bZMaha7YsZ/aGg5c6sMFxc?=
 =?us-ascii?q?UTlCZc7VY08pn56fK4hGwv4tSpbbH5bQ0U++DW2fUMJwiFhyTytbLQNTnUJV?=
 =?us-ascii?q?fR16rKvv+HNJBmlcIrW5gsozbTNgrHI8lrzdxlkqtrUHFUemrTsdWqv2QvG/?=
 =?us-ascii?q?EG8QVjjcFloL4ZcuGYxsg+DuZx2b9MCOSP774abO7sIb2w73R0pufPQ+Nk26?=
 =?us-ascii?q?2MTxxdWaZprjwPGuAVWVSHjmvPGMW2/VXqA+DVix2YZG0q8YIKMbztnS8t3C?=
 =?us-ascii?q?DKFN3kaLmvIl0+H0IE5GT6a5/SiPELwwTAzcIWS43OMl/LJ9aO+q/YClV8Rd?=
 =?us-ascii?q?5dM9tKw41hrCqIqumlx63wzysPCWg1kumWK49Y5/SSjPoXSV8pPQ2q4UgPO7?=
 =?us-ascii?q?AWkJ2fmcYkKZGqCohyGgUd2cZvetcB5+yZosu8SsvYj+VaxNcLyvhB6EaIBa?=
 =?us-ascii?q?BeSUVXEkcRCBuewPG6yYj0qbwF2bKNVoY0tePIWqVtDrqGKJXH43Oj6XtKHg?=
 =?us-ascii?q?irXW13j8Pyq2Aa3GoUqKVTNKdZ4O3gj4FKFBKi1yYFxz7w2d1oMmMwG9CzIU?=
 =?us-ascii?q?o5DfiYMe0zR0OdcTevvDHjXHuRZcQhxxYsxxIkXgGFntkeX0RxYVg1PYYgfA?=
 =?us-ascii?q?Tb02i/cV4anlbCB9iA0FQWseWdpegR90cNYEqVUWV2j7bGO8KRrNecCMYFno?=
 =?us-ascii?q?oADzVUKjOlwNAuA6YrjG8aRJtHA4uu/tPfjxXBZxDrOlNEC1DYHtCZUxdzqU?=
 =?us-ascii?q?Wvemq/vk+xjhG9RETsepyTrQevNHHAFCHHYBn8AL1o651Fp/woOW8ETT97xh?=
 =?us-ascii?q?+4LtVrcebrQVmYlMfJQsMohR7GGXzXKYtQKM8UWXTEfpZzbnPap/rSC+149r?=
 =?us-ascii?q?VkG3gGOn/kU9IU0T1mhzfg+o6g76I5NorFW3l9jQJ6LCc8RWBL3zMMFobzk4?=
 =?us-ascii?q?iYC+F9Q/zwqrTHqKHusZAs/Ls+W1fr+7IQ2xA2gypdxo2a12dmekJIdLa5D8?=
 =?us-ascii?q?/JAkItKjmKaA8uaqTdpnInM4wzcoIS0ea/e46DSZxU1o5EgtFJjy1/jEcvjd?=
 =?us-ascii?q?U8VhEohX4pkBUBboivxkic5hAb+hZOMVMtTSChEx5/vrOGTyikKiFrM47A4G?=
 =?us-ascii?q?3MkF5FmHDMJI7IejWbdDl6C/jX3q5UMtXkd+PPeysnXadpwDzLtpINbtlL6G?=
 =?us-ascii?q?tnqriH2SfryQAkkd//V7wtvNRoUFAAf36iC593ndC1TgcRcHGRssOh5Id3pV?=
 =?us-ascii?q?FzAs/MeASQx5pkodj0r9+ZPWvjCy2L3eSnEkWY/6tApOwPXJ9PAJ7cfYPo4l?=
 =?us-ascii?q?gVe/InOMCIpLW3aKc6CH1NnlDMcG5YiO5bEqOuqejVDnnIB7RUOqqf293rxl?=
 =?us-ascii?q?7GmaO2FkibCZvfnukfcgdZPBA8SVFuUHN4E8uo6sesiIrlLjgXiqDGDIFbt7?=
 =?us-ascii?q?G69bPaKcLYLz4Jhd9SyDSw2z/+lXOmEc7v3wo/hIttz1JGCnPCr3iqWxy11E?=
 =?us-ascii?q?/OkAtsQ1DShE/ZQwm91H0HvcIce0bMin27QzqypAvAmgQb/vF/yVUPyWzI82?=
 =?us-ascii?q?2hH8aXkjrwd9VSicvvppNIe+pm830HZiiGe+vAhLDJ6eWe386lJtOQij8kzL?=
 =?us-ascii?q?lGd1bmPLSkCZ6SdLSuNT4ZKo/Ut2JnE5EenhlLkENdCtwVXp+qvsVjoqkwWc?=
 =?us-ascii?q?XgAv7Uyfk6Gibg7yZ/+P1DOayUl95QaBj9/xY1w3DIVP6x45JapsJBzvD9/e?=
 =?us-ascii?q?kDhuzOzrZ+LjEjMk477r0F2G6lv5++ULETJqDpGLldxFOSe0UsZsCkmXZmic?=
 =?us-ascii?q?KWq0DTjZawc58AP607mkIOmRDaslTBaVDw3znalK1+HQ/7ODqFu8mbD5iC0/?=
 =?us-ascii?q?MTeI2AJMFoaM6jEMpU0pZjMxHWNSQWpIwrLH8+WoyGYMXF95QnsbQynHuPk3?=
 =?us-ascii?q?WU0bdS15xG0hvqK1CL61Cj4ynH7CA9OlGsrzRhR8tdQxAoDtGN7amvK/pQOY?=
 =?us-ascii?q?Vvt+wIatXtRigeG6IM2oiKkKUVtWvc+olcXpQ1v033crmODxiCEp4RAKmTEf?=
 =?us-ascii?q?Uz8w6DRz3Qa1Hm37Jxou51Sd+pkxwN5M7KWXlSd0Uk2+cWJZbiYgeFgtJO1i?=
 =?us-ascii?q?Ai6UTwXtODQ+RRk8DvPf6JQg89Y9EIwU5T8ICF/TCDjaNM=3D?=
X-IronPort-AV: E=Sophos;i="5.93,337,1654574400"; 
   d="scan'208";a="81198973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUnRetdsv+VxtVFyZ4g5k2nXLewzSb+LwP9e0DgXPr8gF8pixLneQsJwyDZlLpIP0gYRVdJP9fUqArlEaft4liYf+WwRVweomZMv3JdoBroc4+tm7laEERgUZ04cKA4upVfxmIBwoMlMMOFiG+Z5fkg1TIu61ziGQPVJpJHP9Rdggcj+6LfLWD0YhxO4ILjRdjwQYQGza797SMvlTz8HXbfFt84TQeUQ2Xwy6Uih2UqtoB8MYUnbTWcEOZgmjiqJqMpSxzipvquFIE/tnJmlLxz9fYr1cmwFuxxjcW1I9+tocFu5j+ol7wbfLTc785ogLU6IBRdfzTYGw85IawQOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwPzf9yV1YlzC3age3SnMv40zKY7mzhu3g1z2TAeF7c=;
 b=gl8QoksCHTCj6DD0EGVrqPNc6pJOCj7fmsfjUF2dLfAjcsIPbvrMURI+L/3L09mqx6vdlJmxO2C8GsCqkBrnuE8jxxv0fSe/amqMXxBIDcO49mosPxWnLOZq5ceXnc0u5d5iGNRDnjhblLaol4aGdoP2vCh2GSO7+bBiJKEPGukrrPqpwgD1E2ah9xUteWH735GCobP3pZDVFYfAYr6mOKjWKpGZnsMOOLLdW0PvngwxqwNLrdL01C4O+mypHhGLipGO8C8Qj1Ve41vJZEFp7NEiAcGcwsEXqeP2Ovz8yCnOTll0J5TK0G+z0Fa2wV2Akr5+q8wuZcf+kFRX0ggPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwPzf9yV1YlzC3age3SnMv40zKY7mzhu3g1z2TAeF7c=;
 b=oeD1YsSgKsPLCTowVhg8kqL04OADrWQUCozOqI3hc3gvMRildRcneP6uOqQf8GcDzBdYehkdtT4Ht9JFXmqZJpcSKEFwcfnQbzGGLUxrgjTk5TLyZAmCSRCVnmwGrYkEAh0jaLjgflxy3qZAhzw0viXpNJOXzwLZSSkTW75QRlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 23 Sep 2022 10:35:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Message-ID: <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
X-ClientProxiedBy: LNXP265CA0060.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9c6721-3a3c-48be-e33d-08da9d3e890e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oZ55/0jLJlbdXfkdn3vwaxl8Wa8QYuWg+rey78xBqFl3qUMpJgI6dZJUaB735Yc7MFAJ9yEpFoJsAUraeCLZPT69SQBJlhUkcEs+vgUgsRGpk3wTxHM0xl5doFxrssltY5Cf0Z7zqEgxrz6uGFKLKfXJMJUI7o1/BKPalNaafw6z+8QqgGmIWRjfzkQuj/9hnqdnJ69/hSBLasRLcXByqya9r8EkbGGewNmM1MLfIjuXv7fLM+jzMeUOxsK5gdK6jXNrJA6aCJvNmXKgZ6KVvSFtSYLHgRxGQVXG5F15rbz7wX+MZ+SPX6f9Y+74ZLee6uJHfrzkeJ0O2N6QcokHthR6JWMLr4lFNw8J4UmANbSKEKsafzx4YjhvInayQf0cJYuLrcmRQZu9qJ4bU/bNiN+Ip1K5McHIPyyhAcAsb1AqRX6ymylupB2EQcXeylooj6Z6eMB3qjJ3IZP4jKFC5+IlqaqeYdxqf5qD01z5ZuoeFeULJlaf89AmbfD2GgWuOOkvYKR9DPapE4YYzjr+f/wWY2wopICOJ2vpmDtdxQ4xesO2CMPXWsZWQqtb4snunhjKE5VH2rW4NL9mX6RcnkBJjdKyDiEgx7+J8N2tQd7Oti3UIEL6/78UKQwc7gM0cU0ED48lWyfZlbrohYqpzZSRRILRu/LAMPN6IYpB457azpOZ1BUsC9MGaRULE3QXed//AiICwlmOpNcWrvRXkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(54906003)(6916009)(53546011)(6506007)(2906002)(66476007)(316002)(83380400001)(66556008)(66946007)(186003)(38100700002)(41300700001)(4326008)(8676002)(6666004)(86362001)(6486002)(5660300002)(85182001)(478600001)(6512007)(26005)(9686003)(82960400001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm1tcjVtTWdmVXIvQVdZL3ZRaExJdWpVV3IyZXVwOFpSa0dUWnY4K0dEUXJa?=
 =?utf-8?B?UGp6VThXZE9HcnBuM3JqSkhRNmt3N2kyQmlBZklDdTRnUjNyMlNGVnA4Vm1U?=
 =?utf-8?B?Z2xpRlNTcGFCN0s5dDd0SHBNb2tQNnlqU0F5L1hCL0hxdWN2aExXK054UlJE?=
 =?utf-8?B?UmlqL2R0QXI1b2JrYlBoSjdhMlFZT2lyT0h0WHloNm9NYjNRWHNDVDRFSlZH?=
 =?utf-8?B?NW9oQXRVTXZRcVJKdHBxM0poQk5CaFl0UEhBRjJjWnFDczVSY2F3TEFQZ2xa?=
 =?utf-8?B?SnovakpvajJxSklNSmZFVlhiMVhhZmtLSUVJazZ0UTdKWnVEM1I4cVRTNE9P?=
 =?utf-8?B?d3VSQXQwWGdYR21MWFpZeW4zL2YwalVBb3FEY0tFYnliQnJqM0tQMVllazRn?=
 =?utf-8?B?YmROOUtMRkdxbmlDQjkrd1dxR0RaeGhYTlFxQkk4RlJWbTROR1ZEV3NueEVp?=
 =?utf-8?B?VVhhYmtYWXVCSmNEYUxSVzZoUU5Pbk1TZ0ZJdFdwdWxWTFVRZGU0QUNYQ1hx?=
 =?utf-8?B?WmdGU3IwOWRMcFhWamdzQ1FYU3dSeEVZdmtieDY0NGxwSjNvcm9LaEFsZmVG?=
 =?utf-8?B?ejF4cUVPSlphbGpGaGNYYzZiQklkaFh0bnlWdGk1VjVaMkZjT3FmbHZUdkxX?=
 =?utf-8?B?UHpZZ0ZWalZVVUlIYk96M1FvMHV4bGdpWWRNZ3F6TGJyemZmSGRJM3ZsNENj?=
 =?utf-8?B?LzV0MG5EeEJGQXZhWndYUW4xTW1qU05HakV1RGJmNy8vZXpCcXlrbTZQQzV2?=
 =?utf-8?B?YjB0VjdOZlk4WXNmdWFtWGtPKzkxdEJIS0FHck04Uy9aKyt1Vis4bXcxNjFF?=
 =?utf-8?B?YmRxRHp1TjhWMlBOeDJzRzhmTkphWitvMHQ2N3RUd0hyOW9PbkNERkt1aE52?=
 =?utf-8?B?ZEtMcHdIMXZtbm94MDNaNUU1RVZmenYwbWp0RVB0VldVdTlnb3MvU3dFVktQ?=
 =?utf-8?B?TzFDMFRZQ0h3Z1VQSzZUSnJYZHZvQndzOHlRaTc0bllhUVhaSzU0SlFObVhU?=
 =?utf-8?B?bWlDK3lYZFMvSUd4Zm9UejdkL0VUaUhXQXhtaHZmNlY4QTkxY3hoRi9TVGJ0?=
 =?utf-8?B?ZTU5djRDRUwraitzS2JsdEYvSXptYU9MM0F0ZEl3bVJtT2Rkcm9mSjV2UHhH?=
 =?utf-8?B?ZzNHa1cwNUdjVUg0WFpsSy93NGxma0Y5WXRwZHQ5dnBBQU5uNUJMNXhidU5H?=
 =?utf-8?B?c1dSN0E4K2JPOU5TYTcxN1IwdndFT2ZGZ3BTZitNdXZWbnA4ZmJNQVBHQ2xj?=
 =?utf-8?B?ZUpvdldrUVJzaysrbmFnemJId2s5ZWZzeStscUdYVTRXMTg5QldGM21jS0I0?=
 =?utf-8?B?VENDcDJMaDdnTFgrdUJDcUFpQlNKZytNbzRCUFBrWU8rblNIUmNZKzFpbERr?=
 =?utf-8?B?RFRRREhNMS8xRVpaVkZGbjAxUDJZTHZYeHROazhadUVhMXNDWjhYcEVCdklY?=
 =?utf-8?B?YlJjUktzQXp1a1NhSjJXOTVxVmlNUUZ2aUNSNHQrTG1BUk0yMXpXd3VQNFRE?=
 =?utf-8?B?eE16ZmdxcGYzbVJWRDhTSFhxdjFpUUFEOVM0MldBelFQYThGK1Q4VzN6T2xx?=
 =?utf-8?B?WkpHOVhTSHhWb3d6ejVNSlVhc0hVQnN1OVRrL0FSTHR2Mk14aTRvVFVGc0tX?=
 =?utf-8?B?R2xEc2JhSzBmRFZEZTQ1N24wTXRiYlR2aHdiSU9FNGdlVVcxazR0eHBpUTJ2?=
 =?utf-8?B?blVMZWN0S2NJNnhZZlFhazI0Q3ZEMGROdmU0VElnVlV4NE90YmNScUgyZTM3?=
 =?utf-8?B?ZmxsOXNNYlBjU1NudW5STGRtWlVGSUJaNDRCeEd3aTFiSDRYNnRLTVJVeFdn?=
 =?utf-8?B?bHd1dldlODdjeHVZMHI2TW1wcjRFaE5Ua0oxLysvM09Zb1Bpd09tK1VveTNw?=
 =?utf-8?B?bklWZHRrR3FzdFVxQjNtZlZvOEZMWDF0ZkphQTBXbHVHbTNwU0VoTU5tUGhn?=
 =?utf-8?B?RHhFeURxdk5aWnZtRVpNNWh4MWxGVWxUMjZJdjdZWktTU2ZPMktvamdyRkhy?=
 =?utf-8?B?MnNvaFRwUUVydEpkcjZxUVpMOVNGbnIvVkdTajRXdDRWeXgwYm51bE0zdWN4?=
 =?utf-8?B?N0pla05WMTZySUhKWFNGZ29GSVNuOG52U0p1TE5PbzNqUS8rbVBKdmZ0V0J5?=
 =?utf-8?B?VFBKekJmenEyTDJaSFM3V1Q3QlZhOUZCc0d5THZSUmpjZUk1OXNDS2ZnQlU2?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9c6721-3a3c-48be-e33d-08da9d3e890e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 08:35:14.7412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0wCe5z2rZhmq4MRibEtLqgnN0u0ZGfgtEUvxpe5dMBDPXzJB4WWroCmkm2/Xaq/jBb6C6w7QnzDKJjzUUqcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5584

On Thu, Sep 22, 2022 at 09:21:59PM +0200, Jan Beulich wrote:
> On 22.09.2022 18:05, Roger Pau Monne wrote:
> > memory_type_changed() is currently only implemented for Intel EPT, and
> > results in the invalidation of EMT attributes on all the entries in
> > the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> > when the guest tries to access any gfns for the first time, which
> > results in the recalculation of the EMT for the accessed page.  The
> > vmexit and the recalculations are expensive, and as such should be
> > avoided when possible.
> > 
> > Remove the call to memory_type_changed() from
> > XEN_DOMCTL_memory_mapping: there are no modifications of the
> > iomem_caps ranges anymore that could alter the return of
> > cache_flush_permitted() from that domctl.
> 
> I certainly agree - this was an oversight when the two aspects were
> split. One might argue this is a (performance) fix to the earlier
> commit, and hence might want to go on its own with a Fixes: tag.

Was wondering myself, didn't add the 'Fixes:' tag because of the extra
content.

> > Calls to memory_type_changed() resulting from changes to the domain
> > iomem_caps or ioport_caps ranges are only relevant for EMT
> > calculations if the IOMMU is not enabled, and the call has resulted in
> > a change to the return value of cache_flush_permitted().
> 
> I'm less certain here: These shouldn't be frequent operations, so
> their impact on the guest should be limited?

Citrix has an use case for vGPU where IOMMU regions are added and
removed during guest runtime.  Such functionality makes uses of both
XEN_DOMCTL_iomem_permission and XEN_DOMCTL_memory_mapping.

While the memory_type_changed() call in XEN_DOMCTL_memory_mapping
seems to be the most problematic performance wise, I though it was
nice to try to avoid memory_type_changed() as much as possible, as
those tax the guest quite heavily with EPT_MISCONFIG faults and the
recalculation logic.

> And if we were to restrict the calls, I think we need to clearly
> tie together the various places which need updating together in
> case e.g. the condition in epte_get_entry_emt() is changed.
> Minimally by way of comments, but maybe by way of a small helper
> function (for which I can't seem to be able to think of a good
> name) sitting next to epte_get_entry_emt().

Such helper function is also kind of problematic, as it would have to
live in p2m-ept.c but be used in domctl.c and x86/domctl.c?  It would
have to go through the p2m_domain indirection structure.

Do you have any suggestions about how the function should look like?
I'm afraid the fact it needs the previous cache_flush_permitted()
value makes it kind of weird to encapsulate.

I've attempted to add comments to make it clear why the new checks are
added, but I would also need to add a comment to epte_get_entry_emt()
to notice changes in the condition need to be propagated to call sites
of memory_type_changed().

> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I feel it's a bit weird to have calls to memory_type_changed() in
> > common domctl code - for once the domctl that trigger the call doesn't
> > change memory types, just adds or removes ranges from iomem_caps
> > (which in turn affects the behaviour of epte_get_entry_emt()).
> 
> Do you have a better suggestion?

No, not really, because we need the return value of
cache_flush_permitted() before and after the changes, so it's not as
easy as introducing a single helper sadly.

Thanks, Roger.

