Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA53528863
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 17:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330008.553312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcVn-0007NL-8p; Mon, 16 May 2022 15:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330008.553312; Mon, 16 May 2022 15:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcVn-0007Kr-5y; Mon, 16 May 2022 15:19:55 +0000
Received: by outflank-mailman (input) for mailman id 330008;
 Mon, 16 May 2022 15:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AqC=VY=citrix.com=prvs=12853b261=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nqcVl-0007Kg-Fk
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 15:19:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a168ebd4-d52b-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 17:19:52 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 11:19:42 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MWHPR03MB2830.namprd03.prod.outlook.com (2603:10b6:300:11a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 15:19:39 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:19:39 +0000
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
X-Inumbo-ID: a168ebd4-d52b-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652714392;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=pOieCbQ6d/A2vhvVJG6TRkZN1L3vzsDi/nMUGCH5Mdc=;
  b=UYYgh7xDHsGCIU3YCv1uS+PpA9ItqSEpkTFJWCpP0GeJXZdo8AQOVS+o
   GYEKe9r7gcjq/uCIuPzgn5NecwiBeQkRRt+zSoiAA2b180dkbepZm+ST5
   SLs0qASsU5abDmE9LnAhr1ujCcBY4+t/Yi6Qa57Uisx7GIDetqOMol7JG
   I=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 73911093
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L/oVjqKV7S3u0ryfFE+ReJQlxSXFcZb7ZxGr2PjLsTEM7AuW5UVEl
 zVBCC3DeKqUMyGmS21FGN+3pxsG68XUyYVgQANoripnFn9A9ZGZVYXHf037MynJdZScFUxts
 sxFNNCecc4+Hi+H90ynY7W4/SYt3qqDTOKU5IIoQsxUbVYMpHAJ1UIz8wJAvrNVvDSZP++sk
 Yr7rZ2FNg+s12Z4PjhJsv3Z8x4w5amosj9B71FhOa0S7QPSz3UbMskSdPq7R5farii4PQIYq
 8LrluzRErbxpk91Yj+duu+nNBVMGNY+BCDW4pZsc/HKbiNq+2pji87XCNJGMR0N02jQwYgoo
 DlwncfYpTkBb/WkdNs1C3G0IwkmVUGR0OaaSZQXmZX7I3zuKxMA8d03ZK0FFdRwFtJMKXNP7
 ZQlxAUlNXhvsQ4ULIWTEYGAjux7RCXi0Rh2VntIlVk1Bt5+KXzPrjmjCXa1E17ci+gXdcsya
 fb1ZhJVXB7ePzsROmslBZw7jP2p3yGlfjJh/Qf9SaofuwA/zSRX+Z20aJ/5X4LPQs9Y2EGFu
 mjB4mL1RAkAM8CSwiaE9XTqgfLTmST8W8QZE7jQGvxC2QXPgDBMTkBGEwLj+pFViWbnMz5bA
 2MZ/TAhoO4e6UqvR8HVVBykun+U+BUbXrK8FsVls1DUk/KFuG51AEAmTBdRS/IerfMMRGMY1
 AOUr+7bPTVw5ej9pXW1s+38QSmJESofIHIGZCQEZRAY+NSlq4Y25jrlQ8x/CqezgpvQECvp3
 jGRhCEkgvMYistj/6em+VHKhRq8q56PSRQ6ji3MRX6s5A59YI+jZqSr5ELd4PIGK5yWJnGRs
 X5Bl8WA4eQmCZCWiDfLUOgLBKuu5fuOLHvbm1EHN5su7TO24Fa4YJtdpjp5IS9U3t0sfDboZ
 ArfvF1X7ZoKZH+yN/YvOMS2FtggyrXmGZL9TPfIY9FSY593Mgia4CVpYk3W1Gfo+KQxrZwC1
 V6gWZ7EJR4n5W5PlVJam891PWcX+x0D
IronPort-HdrOrdr: A9a23:kXS0PahlxW1TL25AjP4bTQmRxHBQX3Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftWjdySaVxeRZgbcKrAeQfBEWmtQ96U
 4kSdkHNDSSNyk3sS+Z2njfLz9I+rDun86VbKXlvg5QpGpRGsNdBnJCe2Km+zpNNWx77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Ln1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoDOCXMsLlUFtzfsHfrWG1TYczGgNnzmpDq1L8eqq
 iOn/7nBbU115qeRBDynfKn4Xic7N9n0Q6f9bbfuwqtnSWxfkNFN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3amBa/n7/nDE3kbKvNRj+UC3a7FuIYO5bLZvjn99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8PC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8e166MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBkPkoLVeLmzNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.91,230,1647316800"; 
   d="asc'?scan'208";a="73911093"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5FeZg/ZHWePfE+MqIqAVFL0PpYiWBvYNa87L6ydr8zJF+Pf/wheKxAIOLnsV5qh0boZPt520Bjg+uCOv5eu667AeN2v5NmCgpDc6S5X5Xr1SnJT48FpKaGi1otX3kwtShO0ZA0+feIP4woSi22BSip9+Ue76twswvehK4ojNYGXLZImcOLyzETuUSa9iQiYvF136lHFCQcJybrJojok+wty7fbs/Kv/E1hoP1FpaPa9dPPu/US6LeV2TksqFo0H1QZKQZVsnK+IfHlJPA9kQRe8kwuCbTl0Qbpn3CaojWiI/HGNyqTDYdPjueqBsE54wDBvagvpyAbUAyynez3WqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4isfwTrks12DCtibuSTfKJRdDTgVQxraYV00JzWvOo=;
 b=b+Usbf/nij5VxsNHNd8oXA+nj89tHj8Zo30JZr4SX3Ns++NIVCZQZ2Dhr70kcZWjsdaSthrUOWpbnmpaNOdOHVYVIgjhDghkbkNmaQmfIvDvmgk4Moy8gL3eu3vtRb0WoBsVNYc5bzXLKEuW3qOBOlxtOL2Yu7itMqQPZStSTJlsHFVUQ4ze94MFt8pffQeRlt1/8o4ogZXpndk90IifFN2WQ0h2Clci0T56spkGxpjM93aZYMBmUh6r85Q+em44acmXMrqn6Y7ykJb7DmxpQvm2y46B3EYZec8hIrAj44TLcm+oXV0Wy+xF/cdtGRcZqklCiJVXna7AjViQ0QVxSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4isfwTrks12DCtibuSTfKJRdDTgVQxraYV00JzWvOo=;
 b=VVwXi2DZt+1+NzUquH7W/zJuh+iAmrObP8uPYZIQ6K+8K9mPVuoCwoQI1/+EGqWvpkT2lhWyWhAT/KexH+lBsKdwC2kntrQh2WvhJRVo+V2cuiabj3uyqQ9OU77FVJgqXIHs/8FG5Lv45hZM3KGSsb5bU1iezY3MkAyk1VYHzWg=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: Process for cherry-picking patches from other projects
Thread-Topic: Process for cherry-picking patches from other projects
Thread-Index: AQHYZtZ1suK3TAKIFU2tuY9R7u+Tcq0hnruAgAAES4A=
Date: Mon, 16 May 2022 15:19:39 +0000
Message-ID: <25097F0A-9EE9-4E74-960A-9EE9F34BDE54@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <c1d34c23-8f99-71c7-4b60-01c7a8773a92@citrix.com>
In-Reply-To: <c1d34c23-8f99-71c7-4b60-01c7a8773a92@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 315488b4-97b6-4c6b-145a-08da374f7eee
x-ms-traffictypediagnostic: MWHPR03MB2830:EE_
x-microsoft-antispam-prvs:
 <MWHPR03MB283002F45E28D292DD1DACF299CF9@MWHPR03MB2830.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Y869hgEI0DXRLB3kKCHt26RZrkZ2DpXNlb2IgQTdjcT1IdBPVplOthn5uVNyc1abazKAX1Op+bUwWKVDhbWPdrbAE1AlSHoe5yb+xZDSc2rUb2BooHvqA+GMb8cj1WFEAK7/DyvPNMi/RKZsmYroLh8l2nl2QbiQxUzYp8Ff9BebjwzlBt8H7af0S0EWyf6syGdsEBsozZOzmi1pNJlDLV0ineHNn6rryU6vxwIGtLuP+/tgDYhhhXiEWSE7fv1cqvNDNlMDdPzsEWtB8qD638MUYJWlIqfYfH6a/dzhD7rIaGvv2XWnxqK05neTXctvAIMef0mj3hOxuVZsiM1JEvax/BCJI7wMD7Y9CdqJJycVNK/BSbThKoViR8uvdGsaSyIPVldpDf38z3LU90GGQ3ZFecFrTe4iHZMcLqsVynPQ7QPUct3mY+ffkcU4kn1GeBCxja6ead51QepNglwRcJW80wetIgJo3w2l8QBtWIVrjH/Yy1v3kqEdFRGuVX2d4Lb2JG3meIJy5Zvsw2uoxl2NJZndpqh9NjY69B5f8RNwH358IR1MJ+YT3wp15RkfpTkfm9OKzwF3eS41IqztuJurjC0aLguq+UzSo0YquPWjHXB4h+uFFSL34htXSviMUaR0tj/f901DCgxdCafHoCFhRHV5VL77hjOs190yOLTez5MSW4KExV/7jEvtgUWK75MbHGyFUevQMvrJVH+0zWZHWTfzjS9ucJ4HxzK5zypCU/ms5Yl4KeBpEC92Tt6e
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(71200400001)(186003)(316002)(2906002)(508600001)(54906003)(37006003)(6486002)(26005)(6512007)(99936003)(53546011)(82960400001)(38070700005)(91956017)(122000001)(64756008)(76116006)(66946007)(66446008)(8676002)(6862004)(4326008)(66556008)(66476007)(33656002)(2616005)(38100700002)(8936002)(5660300002)(6636002)(83380400001)(107886003)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTRrV1VhT0w1a3FqYTB6QnFVbDVJNDVRNklrMk9nRFhVcm1mQmpwRUlrRDFp?=
 =?utf-8?B?S1V3WGlLellRM2swZ2FpekJZWllTdk1HQXVERENlbmkxZlJ4VEwybG5RK211?=
 =?utf-8?B?eTJmTjRsZytrbWVjZEhBR21jeUdKQXI2S2hMSDY5UHc1VktaMzdTTWUweVd2?=
 =?utf-8?B?dGtTa3kxZHBoME1EMjRWQ3NZTmNvWjJVYkhqZGRyUnVlNGVCV2hGWmdIbVdh?=
 =?utf-8?B?cDVuUzJHOVFYdUVKTllIYVZwdkwxTm9lamdSaFlhN1duYjVTU2xpeVBZRXR0?=
 =?utf-8?B?MnRjVjVtSFdPczNIMVlOUFUvem1RczBKd1l6QWpaK2ZpYW5HTmRMSVBmNVAx?=
 =?utf-8?B?OGRxVnZtVVJibXBYWnQvSU5SODVSYTlDZ2Ryc1pxblhoNGlrM1R5QzZnYitj?=
 =?utf-8?B?OSt1aTdsamZmbUswZi8wdmJzbEFwU3BPRTBtNGFVeDdrNU5tUlhnZ016MVoy?=
 =?utf-8?B?bkdrSVhtUmFKQXUyakNCc3RNWWF4dU1HNlUrV3ZmVW1XRnBzUjJzMWlpSHZw?=
 =?utf-8?B?MlAyNEJ4OVlFb1hiWnFrbnhBendGNUc0MkNXMFJWYUdyREM4dTRUbEpXQkhJ?=
 =?utf-8?B?TEViQ28rOVRVRlgxNHFIU3YwYUFBK2dOU0dhNTBYZ3RrYTZDbnByY003OUYw?=
 =?utf-8?B?NGVPMTk5YVlERzNWSUFwcHhKZ2ErTUdpMzk5b3lQYlV3M09hNnIzbVFLQnAw?=
 =?utf-8?B?SGtJZ0VYVGY5eHJ1Vlc3a3Q3eXpBZ2dGdGZiQTR6K0xQcnNlRzBLelQwZjdt?=
 =?utf-8?B?M2dlUFpNeXJMcDF0OW9TT0VMZ0lrWjZFdTZadnNqRzE4cmFkR0FuQmJvZVZk?=
 =?utf-8?B?YlFPS0VTcVJRVXkyUERYalVBaVhJVEFUSnBYcVl5M3QrYW5WeFNwbzhjeitY?=
 =?utf-8?B?OVBhSkJoeDMxVWY3cUVWcFNvakhtcHRjOXZiallnT203b2hUdGZ5TzZ0QUdy?=
 =?utf-8?B?eVRZMWpvWkkwa0hRTWpSdnVVd0ZINU1tUm4wMDV2Y1k4dnFycDJqYWtNdzlr?=
 =?utf-8?B?NFB4V3BXc093TllvamJWcTM0WTVMRzFsTUIyaE93dGZzWm5Xa3ZlNlBhK2xt?=
 =?utf-8?B?VFIzQnQ1OUpJZy9BS1pwZ1Bzdzl4dkY2RWl1aGlwRkc0WHVsOThRLzRmTEh3?=
 =?utf-8?B?MHduQ093b0JVOXJOS2RtaTVBU2NrWHdYZ0dDcGNibGRvQXZlTkYyZGdPYVlI?=
 =?utf-8?B?Y2dTNVpvNE5VVGprWDhKVDdHOGhVNEFzejRDWGVaQWRkSHhJN1I3NmJLeUZF?=
 =?utf-8?B?S25CMDBhaE5HejRuTGlpME5oOU9SckFoSGIwODd3ODRUOEw3dHZJQWNKMUVF?=
 =?utf-8?B?elVLMEF0WW92R2tQQ3Z4VHZKdWxEUVYyNFdUNVhhNU12NFh2WmZHUktKRHlR?=
 =?utf-8?B?bFIzUWhDNmxYa1ZqcXNYR0lKQ1JYSWs4MWJISjF2K1RaaE9teHhFQmZBcGlH?=
 =?utf-8?B?eTREWFJpL2o0cFNVL0ZPcjEyL3VSUjF1cStGbUtWdGdHRUJidzFXTXFPRWE5?=
 =?utf-8?B?SFMvbDNqM1R3VEQvY3g5ZWw3eGRKSHl4RDNxWWhtdEVoRFA0OUxhTFVzVkNH?=
 =?utf-8?B?N1FDMVA4SXd1SjIvRWl4NG9lb0RzN2hzTmN6NkYwOFV4UTRRelJQWTJ5RUxn?=
 =?utf-8?B?UVpZanB6SWxWemdmdUszdEp1eWxFQmRRQllLQnVUMmp4aDZBaWExYjM5d1hs?=
 =?utf-8?B?TEowQS9lbnFsTG9SVCtZdWg0ckVmbTJISmVqUmIwWGVoSXQ1NWlSQkorR3RS?=
 =?utf-8?B?WjRJSDRWNWRodkZGSnlWVVdzZEpHd2Q5UG4wZlZiV1pYcVZ1NkVPcnptakk1?=
 =?utf-8?B?ZEI3RmxpSC84Zzk5c1NwRHBlbnZYeVV0TnA5YytKbVJOc0ZYeW84RVk4VE9T?=
 =?utf-8?B?M1NlTCtyUnRQQkN6OFRVR0IrRzJFak52dCsyOGt3YWhqUmVwSXN6UUg2Q2Uv?=
 =?utf-8?B?K0FlNXI5TDNEMFdFY282M3R6SWUwTnIwZ3M4K2xPVE42Y1BEMWRkNXpPdnhy?=
 =?utf-8?B?em96aSsxS0xhYnlUSlN5KzlJY1VLb0QwTDUrZkFJYnZhS2hiU2QxQWpwQmpn?=
 =?utf-8?B?VGRXYkh5WW93RG5kQWQxVmc4WGxtdmpsalNhZ2IzWUhqSVFjZklYK245WVBE?=
 =?utf-8?B?aEp2VWFjRmZJdHlHTmxZb2dvNHZUMGJDcWl2enR2TjVLMitJdHFxVEgxVktL?=
 =?utf-8?B?Ry91bi9EMVRHOU5EN0FXeWgvaUFDZVRTWktxcFZrQ0taMkV6VlFqS3hsRXZQ?=
 =?utf-8?B?TUJoVUVPd1pnc1k5OEVqa3FLREpBNDd3VnFjNTd0ODVQbklIUlQxeUhkUmkz?=
 =?utf-8?B?ZHRBRUdaUzFwMkVaZXU1ZzIrL25LY0hpV1VpYlpLNmdhNytiNEtnalVpZ0Fp?=
 =?utf-8?Q?ppJtIvNxQlPvV3fg=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C76ACA2F-537C-435B-94A6-AF8F78115E50";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315488b4-97b6-4c6b-145a-08da374f7eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 15:19:39.7510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGY9UDSZKKB0I/vOlnxr2IP6htLfDyZP6eE7pWw2PytkuVnE8HpzdmERoXHZsCrzuAB+1x7HziHs1DuIIhKmg7nrisevYlUSxpOE3+wDXbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2830

--Apple-Mail=_C76ACA2F-537C-435B-94A6-AF8F78115E50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 16, 2022, at 4:04 PM, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
>>=20
>> 4) When importing an entire file from an upstream like Linux, what =
tags do we need?
>=20
> Any clear reference to where it came from.
>=20
> Nothing is ever imported verbatim.  If nothing else, paths have to be
> changed, and usually more than that.
>=20
> Given that, I do question whether it is appropriate to retain original
> authorship.  The original author did not write a patch for Xen, and =
what
> gets committed wasn't the patch they wrote.

Not sure what you meant by authorship here =E2=80=94 do you mean in the =
git commit?  In the GPL header of the file?

The original author (or the company they work for) may own a copyright =
on the code; if the owner of the copyright comes around and accuses us =
of infringement, we need to be able to a) demonstrate that we are =
generally trying to respect copyright (by requiring people to assert =
that the copyright question is all in order for the handled code) b) be =
able to track back to find where the infringement happened so that we =
can take appropriate remedial action (either education or sanction as =
appropriate).

I think if the GPL header of the file contains =E2=80=9CCopyright YYYY =
by ${AUTHOR}=E2=80=9D, that copyright notice should be retained when =
importing the file.

 -George

--Apple-Mail=_C76ACA2F-537C-435B-94A6-AF8F78115E50
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKCa4cACgkQshXHp8eE
G+1eagf+IbEnEZv94wIm7CFtc6fJ3t6pa4QGwRP/WAGztZ1oK1Mfe90djMN18YIb
bW4nkoMxdOI/1N0Zf1WfU77gbd9BQz/7aDaElz/F/2N8FPFvaBN3qugWHTibaUK7
luGgAm2gliCGjbwlmf20cm4sPRNGE3V0KTcSlXZ47oaZxaOjws4qAFSUb4RKmDDF
UVFTLdLI+LzOMkZF6Cu8Pa12BzUzFS+F+DBca17YAYG5Ia3tVLKKEPH6IeBUv6JW
Wj39L3l8tHL18iU2ZIzwLcVhOj1JgX+10ZTRTDW6QkAqOqpXqCsXX1+e/sdWncuH
npjG3cw/MNTNRruP+DFQwWBN2Vw/qg==
=Q8Lk
-----END PGP SIGNATURE-----

--Apple-Mail=_C76ACA2F-537C-435B-94A6-AF8F78115E50--

