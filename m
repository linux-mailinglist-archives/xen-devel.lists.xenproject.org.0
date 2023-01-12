Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A337366706A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:03:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475989.737941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvMF-0006LM-6G; Thu, 12 Jan 2023 11:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475989.737941; Thu, 12 Jan 2023 11:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvMF-0006JE-3S; Thu, 12 Jan 2023 11:02:55 +0000
Received: by outflank-mailman (input) for mailman id 475989;
 Thu, 12 Jan 2023 11:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFvMD-0006Is-Jo
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:02:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d495ad-9268-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 12:02:50 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 06:02:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5553.namprd03.prod.outlook.com (2603:10b6:208:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 11:02:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 11:02:37 +0000
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
X-Inumbo-ID: a6d495ad-9268-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673521370;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=N7VpTxKlYqQ0aWmh6KpZDMQyKIrC4HjhQ+OZJilveGY=;
  b=dEjqN8d/oqeyuCCxj62PxlSnqn8Dbb7fXahauVOMRVgcWs5LfaMbVpjV
   P4+r2Hwh5aY+4PUb/ELNVPgywdESbwLyqUY8QawIGFuzFsuR9opkOFRmD
   qpGK0CyVZXBMmLKn5GykkSCK4D3Tc1fzjHi2ZIgqj2pPkGyPaXYH+1P61
   U=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 91219673
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:p4bJha7JGU0zq0vwz1APxQxRtPLGchMFZxGqfqrLsTDasY5as4F+v
 mEdXjvVPPiLNGagKtgnOt6z8RlUvsPdnIdgQVRvqSpgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakS5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 tIydWw3fiq/iu+yn5S7VrdDlJp9BZy+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOSF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNLTuTpqKEx6LGV7lUCCEEkCWmlmKHnhxK9QNBWO
 VAW3AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywSEAmkJSBZRZdpgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAKKUcSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1VXOgjbpo4eTSAcwv13TRjj8tl8/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8NJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:LLJLMqu/1L3+4Jj9ZGaTCINZ7skDRNV00zEX/kB9WHVpm62j5r
 iTdZsgpHzJYVoqKRMdcLO7Sc+9qBHnhPpICOAqVN/OMGaHhILCFvAE0WKN+UyEJwTOssoY8Z
 1PGpIVaeEZdDNB/L/HCIXTKada/PC3tJ6Tv6P/4h5WJm9XV50=
X-IronPort-AV: E=Sophos;i="5.96,319,1665460800"; 
   d="scan'208";a="91219673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LI8H/4MEqXacB/CP5IjC0zkdF6K5S9kSUKKPYjlYMlB/Cigg4+mg9Q0aLDLOZBR6m583Z6UeeQYW3RXzvIPOhRS2FVLirb9NDb7c2MgwE+Or0L1QDKen9z9Lm7csiXEDi+YwgKWf9AF1JnppxP2h88wYHJkj82QN3p2CPkdf7J/L26Wbv4OObXjjoaR8PpsA3Pbexh1050qfhhSbsztQVbPvL5FFirYGPcv1k2n4jcSFnKyf8prjYCpGwrgufBjZpLOgLnvQfji4ZJjAV2eT7mvD9+n2wcDG1r+Ifqv0zSuReomxbkphisFA3lEDOHIGSwNxXD2E4W8sChgyQTT/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7VpTxKlYqQ0aWmh6KpZDMQyKIrC4HjhQ+OZJilveGY=;
 b=WfI4SC7uUTPB2X8/c+KPGbz3LCO+oZNhDZ75RM/17ncz3yhfRIjCBUOQ8EJeZmhBPFHEumGzlde5Iod0DVc+ODSx6H3hCiqVT4j5sx9kawSBoE6OW4K6QndyQy4IH1uW7jEcJ6lO4nCbbQZifk0uobRBJT5nL80adGkqKxivfnZuuptNqlz54L6byKKXTJMqjMgbmbdwzwsMRNWM09o0VRau+OBrwkcQIr4yCgMCUTwaH6N8Q1ZwC4QibcTbsce7uXMt17hhd7vO6kKLAaxmNEkXXUaZx2y3+8I3P+WD44y4dEDmkRbHRae/wdLnrNUFpd93n7eWnUVA9dLHDQCpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7VpTxKlYqQ0aWmh6KpZDMQyKIrC4HjhQ+OZJilveGY=;
 b=xMKOMAKDsxaprX7HIlQkEox3wJfrMSYuRnnMugTiyoG8PeM9PSztREekI9cYGDhd9r4xtESyFyUBCcMTTwasfsiLCkiPGmaSnSIJbwBxBHfcl2N5Q3ODGmW7nBjYS297taFwks4WFyqPZOjcmKay/Se14RlRFunaVt+DkP0wNpk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Thread-Topic: [Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Thread-Index: AQHZJloKRT09WL2lFUW3wxQFePvpLa6ang0A
Date: Thu, 12 Jan 2023 11:02:37 +0000
Message-ID: <cf9b3be0-b195-83d8-875f-3ef70e5d9c3b@citrix.com>
References: <20230111181703.30991-1-anthony.perard@citrix.com>
 <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
 <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
In-Reply-To: <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5553:EE_
x-ms-office365-filtering-correlation-id: 6210bfa3-1887-4512-033d-08daf48c83de
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uMqQSMIiNfUyWy7g7rjhpxIfPtYHX72Cdar8GdfarQAZNZxuDSIAD2qg4P8GGZ1RWD2EUUxrikHGLu7Z8deW+5BbMwykQ+ze7ZtACQ39tphi/NU0kwH0hgCthcnB/+6Bt0BUudd1sI08rASaqpjlMcgFp4w+0WujeZG2NuAEmIg6huNPA0VKJxuAG3A1d/6Z2CiYNAjYpcKP/4IqCoJAPH0Yv4JVDYG2Nbz7IrSET8xGOjB5T546D3a9rei94kwGIFJHf/mHlse3E6LUpWX6Y74EXgH7/EZJ9TPceRKGEvzCIi0ozfVU3BZke/Vpojvwn5chZkcbC/5uk3bY1cjiKv1uYlHhaBH2hA+3LcfTTxIcSpbFHNHaGqQ0tY9BNgacHtKd5abqc/tzW5Jy9nEt3rHW3weiYZlMSGJrEwBzP+dSa2xtXLwhFsSe7bzmkMogPstihQfkMN1FuU97OhvFI26+TIwePCeZtSWjJq21BCMmlJP7uJGdOa4EuwXnX6+oUhrCxOIWwg0I76Zl9DQ3xkBIpMJ/GEvTQtl7czivSgy6fMLSxKfsLMyVoT62FfzLLb7nC+JNNIUjo73iTtzEcur4kDRMLGNAGJpot8eNcqpb2R21VRpZQkR68D1SNisz/jXOuM55SNw2pgx9WV90d68dHI0MVh7I7YHFnEOByFGzZ7+Ewvz+cq/lvm0KSH/LJM/t1TCD9b+aKcYRkR5TwyLBMo6ei55MtFxpSFyOFE4tHgOmOZGPPc0EUGP6zpXwJVzzJOqIjL/GFLlK1IPDwEM4G5Oeib3hnqaO/d4YQ6Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199015)(41300700001)(6506007)(8936002)(5660300002)(31686004)(2906002)(53546011)(83380400001)(66556008)(66946007)(66446008)(8676002)(91956017)(6916009)(71200400001)(76116006)(4326008)(36756003)(122000001)(38100700002)(82960400001)(38070700005)(316002)(66476007)(54906003)(478600001)(6486002)(64756008)(2616005)(86362001)(966005)(186003)(31696002)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTNYN004RDFlSWUvTk9FdW5HY20wdkdCcXpDc0dqVnp0Z1Zad3U1b2xEV2dr?=
 =?utf-8?B?YXBjYTdjTW1WRWp5VkdhZEtPcGtpRU5XTjF1YWNyMFhteHlkdU1ZL2lObjE4?=
 =?utf-8?B?cFBZb3hscWR5OFRreUpINklYRFRIWVErbjhxMXlPLzgyRUE2VDN3b282K1hS?=
 =?utf-8?B?RWhMenZvc1FoRGdPdGVLWER0MmttUWtIUURjd096L29KSHZUSU5CVGdlekNy?=
 =?utf-8?B?WWhacVl6N1Y5OE9jbzFLaFRvTVhSK0I2ODB6MHQ2c3hhMnZhbjVVMDJyRmtI?=
 =?utf-8?B?bDVjN012YktMVlljQ0FWeDJYUUNuekFJNEN2a1FwT08vSlc2YnN0Q3doY1lZ?=
 =?utf-8?B?QXBaTUpaUXZnRlJJS1ViMWZZK1J2VHRLZlY4Y1ZvWVNTSFB5NEZ3K0FFek41?=
 =?utf-8?B?U0xFbTdrL0xBUDFPWU8vZ2ZvTTJGaGM0S042dXVOVnhPaW93N1RxSXJpNktu?=
 =?utf-8?B?blh3eHZTNTNObGFZUE13QUxNZEtZenZaaWQzZUFQNHlxTE1OVkZubHFUNTJy?=
 =?utf-8?B?YjF1UkdEU2J6WEc4dXBHck1pNGxUNC9BbGdDT0Q1S1llYVNxNmMwUngxRlho?=
 =?utf-8?B?SkhwRy9RMVRiWnVrZDN2aHg4TXhTM08yUGh3MTZjd1lHSkhWSDBlTWVFYjJp?=
 =?utf-8?B?UkFWZ1FxNXdKZ2RuazQzTE1PQnd1UWlZd3lIUUhrQllpNFoxWDBnSjFyQ3hj?=
 =?utf-8?B?Q1FlT1ZpckJ5dG1kUUJFNnN1MjZTQURVYjAxOHJ3YTYzOXNNdmtPc0N4ZmJn?=
 =?utf-8?B?emN5QUd1R0FZZHg0Mmk4Uk9xbXdycThtclE2a3dRUzZydVkvc0tyWGV5VW5N?=
 =?utf-8?B?WWMwK3QvbzZvcU1JUEo5bDFVNXNBVzB4eEE3cEptdEoyVU0veGRlaTRGQ3Ba?=
 =?utf-8?B?WnJnb3JSOWlpY0lzTFg3ZzZSMS9RZXJDUCtJeTJZaTZYZ3NqbEsrR0tnOGR1?=
 =?utf-8?B?U05jMjliM0RsOU5nYUpNTjJST1dZZ1RDTzlSdjVQUSs2dWpDMDRydzZjWmRF?=
 =?utf-8?B?bE52djJ5T2kzUXJiZkgwcEl5SWRjakNGLzlKQ1hQTExFd2VuQ1NwbmhGR2Mv?=
 =?utf-8?B?YWZ4WkI3WVg2UmZuRnErTUp0ZDN0Mnl4Yy9xNDlCRkVXckI0bmhyMEJTNEZ6?=
 =?utf-8?B?NllHR1JUcjlkNERSOSsvSjBHU2VxcGlPZVQ0RXVRd1dFVm83U2gydGQvNVFl?=
 =?utf-8?B?UzU5WTRiMTB6QldoTWhwNFBWNGVUdWhHb2RteTY5MWtlVEFwcGJ6YXZDR2cw?=
 =?utf-8?B?anQ1Ti9jdHFOOUtSUWE3dEU5NTQyRFpSRTFRbkZac0dLYldoSHBLMDdOc1Jv?=
 =?utf-8?B?V0RJc0toa0pPaVc0ZkFMVGZPaUo2UGxaNSthaHB1NFJtZ0RnWUtiWU0xaFVp?=
 =?utf-8?B?TEVVWlhrZEdLaFpTaWZta1hKOThYaHg4VG1WcjV1Y0FUL01kSStPVDVEN0JK?=
 =?utf-8?B?VnkweHhZamNGNGR0WlkvQ2xpcmhwdHUrcmpNSjN1S0E2QWNOMVErVWUyMW9u?=
 =?utf-8?B?c0lTN2IyTHNqTGlPWjRWMmRqeFdhaWVqTk52V1BvcXlqeEhpbERUaUVWdTFl?=
 =?utf-8?B?NmVicEc0c3hMbS8zNmkwbjZWQVRRZEZJcUEybzZUZkt0TEwyM0R5L2FmVTNM?=
 =?utf-8?B?OTIzZHY2a2Z4TzJXeUViaDU1bXNpQTRJSml3MDZwUWh1R3ZHZ3VYNnJMeWJl?=
 =?utf-8?B?K0tMbU1YTWV1TEdmL3VZQVhmMGNrcmkxZ3VpVTVoTFVrVTlVQXZLVTV1b29P?=
 =?utf-8?B?T3RCVDVaUEtvbXg4MHBvTTZnNUVHQ29OOGdQZDVrVitwSjRMeHBWS2ZkUVY3?=
 =?utf-8?B?bkdFRVJySVphM3VCWmhKdU9lamtBUWZOZXNQaStERFNWbnlKcVZXejVuUndH?=
 =?utf-8?B?MVhNUlZIOWJBUlBPZnVWanRDZlBpOW1vVU9JaUhhdGdlMVNzUEkwZTFMcXY2?=
 =?utf-8?B?RUpOYTVuR0E5ZUxOeko1ZnV5VG5ZNDg4UjB3WTRQdWdKV2Zrdms1TUErdTZO?=
 =?utf-8?B?S3ErUDBTWVl6TEdabnVHS3RNUHdJV21haUpYbVo3ZlZ5WG1WNFBwcWQwMEg5?=
 =?utf-8?B?a3JKbUdCalBnclV4MTBaaDhZd2pnaXVpMVF1Zm40NnA4bkVvM2QvT0hzWGNh?=
 =?utf-8?B?d1pBRWNRaTNhWHFmeWxoWTA2bFlmUEU1MG15OThVUHp6T2NweGdDbnYxQmQ2?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F1A9C49D02BBB4986E7DD1143835BF5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p7/yuN+OWZ7vkKh8XXOAexHuOY1vyRgOlAA8FADDi8u7LO46HfMaBd6YSGtBmNIfyVMOYcbpGl1qJfr2eCqLbqafvZT3dZKLZjDALl2xlCzkmKdVBOCWwf5T9Xq1LJQQXa8cisYFGpVNZqFqfoVMOfsMVhb0i/tSlmRI3zK8TrQ5ziWaUDijRiBlBt+uAifZ7i7BiPIL0hJMqMysyGrdEg2ApFiuC0lQvAKwPeiSptuWInJ6+KfsdlvLBzdozinUUszuXKb741SkpR9RoJWPRonxtQ5IqFwsnbUe4kl9bAVLLGTD1+OnYUycU/wnXSs//2ejhnx+Lzy4hl76qTWkCOh/ZjVuTC/4u67azAtUSjnzoA47f1B+stRcbflKt+0/rrPc3yrk1OK/B4cd4YQQuAM5ElU1OL8FJJj7iCRPNrd7SQvR/szJf/JlatP3QQ013VOfwgKPq+saLcJKnzN1gljM5WTVAhUl/YzhrQr2jEzJ/LP85VKVmAbOGl/EcHFj1spiTacz5x8qNF8vvyFr8UgSylL0LZyRUSAcJZ00G6jIxuMtyrtZpB/ziUBqLYssM1RxhKo/v0suH2XaxMVw2+YvO2RfnmF6JOL6fybmBN6KKBPavhTkrsSI9HTn7qKieKndT5A9erSPfsJPZ9mOL1afw+ieiPA/CE3IId8YX71GuUwebqDY684RonC8AaXOoToZb6whNjx977DbpSb1CCTIngyjcESK342PNNqYAkZ0KD6O28JyS3vkJ5Qh5U1td3po7FK1WZVvUyLaBKi6xJaT9EK5z3gaMgnQ4xWvnEPLBSvL/a5akSdr5B6MonU1mzD/+DwbAm6KDQipxdzi62Xqn1L8S/S4aZR61R79m78=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6210bfa3-1887-4512-033d-08daf48c83de
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 11:02:37.0685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAPy7hQhndYq4hejh0nNAWyGJHLB2o7oGWP06B9RytE1TTB4EGNl7BpvF8ZqcYMXpGezQ69nonZ1mNosErMxNgCNa/raOWJsOnHtdvcwZRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5553

T24gMTIvMDEvMjAyMyA3OjQ2IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTEuMDEuMjAy
MyAyMzoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IEZvciBwb3N0ZXJpdHksDQo+PiBodHRw
czovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVuLy0vam9icy8zNTg1
Mzc5NTUzIGlzDQo+PiB0aGUgaXNzdWUgaW4gcXVlc3Rpb24uDQo+Pg0KPj4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIGFyY2gveDg2L2h2bS9odm0uYzo4MjoNCj4+IC4vaW5jbHVkZS9jb21wYXQvaHZt
L2h2bV9vcC5oOjY6MTA6IGZhdGFsIGVycm9yOiAuLi90cmFjZS5oOiBObyBzdWNoDQo+PiBmaWxl
IG9yIGRpcmVjdG9yeQ0KPj4gwqDCoMKgIDYgfCAjaW5jbHVkZSAiLi4vdHJhY2UuaCINCj4+IMKg
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn4NCj4+IGNvbXBpbGF0aW9u
IHRlcm1pbmF0ZWQuDQo+PiBtYWtlWzRdOiAqKiogW1J1bGVzLm1rOjI0NjogYXJjaC94ODYvaHZt
L2h2bS5vXSBFcnJvciAxDQo+PiBtYWtlWzNdOiAqKiogW1J1bGVzLm1rOjMyMDogYXJjaC94ODYv
aHZtXSBFcnJvciAyDQo+PiBtYWtlWzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLg0KPj4NCj4+DQo+PiBBbGwgcHVibGljIGhlYWRlcnMgdXNlICIuLi8iIHJlbGF0aXZlIGlu
Y2x1ZGVzIGZvciB0cmF2ZXJzaW5nIHRoZQ0KPj4gcHVibGljLyBoaWVyYXJjaHkuwqAgVGhpcyBj
YW5ub3QgZmVhc2libHkgY2hhbmdlIGdpdmVuIG91ciAiY29weSB0aGlzDQo+PiBpbnRvIHlvdXIg
cHJvamVjdCIgc3RhbmNlLCBidXQgaXQgbWVhbnMgdGhlIGNvbXBhdCBoZWFkZXJzIGhhdmUgdGhl
IHNhbWUNCj4+IHN0cnVjdHVyZSB1bmRlciBjb21wYXQvLg0KPj4NCj4+IFRoaXMgaW5jbHVkZSBp
cyBzdXBwb3NlZCB0byBiZSBpbmNsdWRpbmcgY29tcGF0L3RyYWNlLmggYnV0IGl0IHdhcw0KPj4g
YWN0dWFsbHkgcGlja2luZyB1cCB4ODYncyBhc20vdHJhY2UuaCwgaGVuY2UgdGhlIGJ1aWxkIGZh
aWx1cmUgbm93IHRoYXQNCj4+IEkndmUgZGVsZXRlZCB0aGUgZmlsZS4NCj4+DQo+PiBUaGlzIGRl
bW9uc3RyYXRlcyB0aGF0IHRyeWluZyB0byBiZSBjbGV2ZXIgd2l0aCAtaXF1b3RlIGlzIGEgbWlz
dGFrZS7CoA0KPj4gTm90aGluZyBnb29kIGNhbiBwb3NzaWJseSBjb21lIG9mIGhhdmluZyB0aGUg
PD4gYW5kICIiIGluY2x1ZGUgcGF0aHMNCj4+IGJlaW5nIGRpZmZlcmVudC7CoCBUaGVyZWZvcmUg
d2UgbXVzdCByZXZlcnQgYWxsIHVzZXMgb2YgLWlxdW90ZS4NCj4gSSdtIGFmcmFpZCBJIGNhbid0
IHNlZSB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuIHVzZSBvZiAtaXF1b3RlIGFuZCB0aGUgYnVnDQo+
IGhlcmUuDQoNClNvIEkgaGFkIGNvbmNsdWRlZCAod3JvbmdseSkgdGhhdCBpdCB3YXMgdG8gZG8g
d2l0aCBhbiBhc3ltbWV0cnkgb2YNCmluY2x1ZGUgcGF0aHMsIGJ1dCBpdCdzIG5vdC7CoCA8Li4v
JHg+IHdvdWxkIGJlaGF2ZSB0aGUgc2FtZSwgZXZlbiBpZiBpdA0KaXMgYSBiaXQgbW9yZSBvYnZp
b3VzbHkgd3JvbmcuDQoNClRoZSBhY3R1YWwgcHJvYmxlbSBpcyB0aGUgdXNlIG9mIC4vIG9yIC4u
LyBiZWNhdXNlLCBkZXNwaXRlIGhvdyB0aGV5DQpyZWFkLCB0aGV5IGFyZSBuZXZlciByZWxhdGl2
ZSB0byB0aGUgY3VycmVudCBmaWxlLsKgIFRoZSBjb250ZW50cyBiZXR3ZWVuDQp0aGUgIiIgb3Ig
PD4gaXMgdHJlYXRlZCBhcyBhIHN0cmluZyBsaXRlcmFsIGFuZCBub3QgaW50ZXJwcmV0ZWQgYnkg
Q1BQLg0KDQpTbyBmdXJ0aGVybW9yZSwgdGhlIHB1YmxpYyBoZWFkZXJzIGFyZSBidWdneSBpbiB0
aGVpciB1c2Ugb2YgLi4vIGJlY2F1c2UNCml0IGlzIGFuIGltcGxpY2l0IGRlcGVuZGVuY3kgb24g
LUkvcGF0aC90by94ZW4vaGVhZGVycy9kaXIvIGJlaW5nDQplYXJsaWVyIG9uIHRoZSBpbmNsdWRl
IHBhdGggdGhhbiBvdGhlciBkaXJzIHdpdGggdGhlc2UgZmFpcmx5IGdlbmVyaWMNCmFuZCBub3Qt
eGVuLXByZWZpeGVkIGZpbGUgbmFtZXMuDQoNCkkgc3RpbGwgdGhpbmsgdGhhdCBpbmNsdWRlIHBh
dGggYXN5bW1ldHJ5IGlzIGJhZCBpZGVhIGFuZCB3YW50cw0KcmV2ZXJ0aW5nLCBidXQgSSBhZ3Jl
ZSBpdCdzIG5vdCB0aGUgc291cmNlIG9mIHRoaXMgYnVnLg0KDQo+PiBCdXQsIHRoYXQgaXNuJ3Qg
dGhlIG9ubHkgYnVnLg0KPj4NCj4+IFRoZSByZWFsIGh2bV9vcC5oIGxlZ2l0aW1hdGVseSBpbmNs
dWRlcyB0aGUgcmVhbCB0cmFjZS5oLCB0aGVyZWZvcmUgdGhlDQo+PiBjb21wYXQgaHZtX29wLmgg
bGVnaXRpbWF0ZWx5IGluY2x1ZGVzIHRoZSBjb21wYXQgdHJhY2UuaCB0b28uwqAgQnV0DQo+PiBn
ZW5lcmF0aW9uIG9mIGNvbXBhdCB0cmFjZS5oIHdhcyBtYWRlIGFzeW1tZXRyaWMgYmVjYXVzZSBv
ZiAyYzhmYWJiMjIzLg0KPj4NCj4+IEluIGhpbmRzaWdodCwgdGhhdCdzIGEgcHVibGljIEFCSSBi
cmVha2FnZS7CoCBUaGUgY3VycmVudCBjb25maWd1cmF0aW9uDQo+PiBvZiB0aGlzIGJ1aWxkIG9m
IHRoZSBoeXBlcnZpc29yIGhhcyBubyBsZWdpdGltYXRlIGJlYXJpbmcgb24gdGhlIGhlYWRlcnMN
Cj4+IG5lZWRpbmcgdG8gYmUgaW5zdGFsbGVkIHRvIC91c3IvaW5jbHVkZS94ZW4uDQo+Pg0KPj4g
T3IgcHV0IGFub3RoZXIgd2F5LCBpdCBpcyBhIGJyZWFrYWdlIHRvIHJlcXVpcmUgWGVuIHRvIGhh
dmUNCj4+IENPTkZJR19DT01QQVQrQ09ORklHX1RSQUNFQlVGRkVSIGVuYWJsZWQgaW4gdGhlIGJ1
aWxkIHNpbXBseSB0byBnZXQgdGhlDQo+PiBwdWJsaWMgQVBJIGhlYWRlcnMgZ2VuZXJhdGVkIHBy
b3Blcmx5Lg0KPiBUaGVyZSBhcmUgbm8gcHVibGljIEFQSSBoZWFkZXJzIHdoaWNoIGFyZSBnZW5l
cmF0ZWQuIFRoZSBjb21wYXQgaGVhZGVycw0KPiBhcmUgZ2VuZXJhdGUgc29sZWx5IGZvciBYZW4n
cyBpbnRlcm5hbCBwdXJwb3NlcyAoYW5kIGhlbmNlIHRoZXJlJ3MgYWxzbw0KPiBubyBwdWJsaWMg
QUJJIGJyZWFrYWdlKS4NCg0KV293LCBJIHJlYWxseSB3YXMgZGVjYWZmZWluYXRlZCB3aGVuIHdv
cmtpbmcgb24gdGhpcy4uLg0KDQpZZWFoLCBpdCdzIG5vdCB0aGF0IGVpdGhlci4NCg0KfkFuZHJl
dw0K

