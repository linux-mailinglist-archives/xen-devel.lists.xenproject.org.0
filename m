Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44BCA4CF1
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 18:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178186.1502121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRDUB-0002r5-Rv; Thu, 04 Dec 2025 17:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178186.1502121; Thu, 04 Dec 2025 17:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRDUB-0002p3-O4; Thu, 04 Dec 2025 17:51:23 +0000
Received: by outflank-mailman (input) for mailman id 1178186;
 Thu, 04 Dec 2025 17:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMpe=6K=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vRDU9-0002ox-JG
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 17:51:21 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf81afd7-d139-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 18:51:07 +0100 (CET)
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by AM9PR03MB7709.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 17:51:05 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 17:51:04 +0000
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
X-Inumbo-ID: cf81afd7-d139-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZW9RwTlkk+FazRYRYGw8Ceh24TpGa4Xx82W6H4QdiAdyyXYsMBlNJWy3V09sMIJJW1Ui1SYyTqAehcQw+mDx9sQ/VXT+oQ5XlRKSYNU95GAYBbC5uEL4b/P7tet22qnPS+ZyS/Q7gE9JxxzRBVrlKFspnvoMXcut0aANtSJWfl36ImuQx9gPCD5XtJa10V+BkRyf7pRLr+y5ELjXWJshlrZSI0FZe4DrUabl2wmHogcRzOk+0eJOHvoSj3vMEsEtc0jPmmudqY4sFW694E9s5cJIVOX5lyyhTFyiablTWm4az6hbZBWAhBTM5+6n7t/+FAhIPQp3IslyI7053UmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPbDwkDubmu2voFO8+QmP1lfF+b74FypW+28E0qWUjA=;
 b=He+eH497bnT0d7me+zBSfouxNYytZSeBljV+K2xaxsNyjy3ME8cXKbsFzxez7EB9yYoZGmFNrCihxc1NoMF4Ra+Vp8nELzFbkR99kec26tGxiaSCRpOW2Jd6UjCtk4OEb8zJf8hqxvTFKK/aWiRi4xGdIFXh7fs/zuNiqbu1Je5sE2rFirFWb4VtrQQ61DdTdOeD9mjoXMRY4SOtkwuDts+TAPgMqhSDcRLIGHk2pM93AYJd+QAV3PlTr4M2QrrSwrvuBmi5U0vNh1qnYwN3/RjB/LqFitnj00lBfh2X+7uFSvVf4S/86ERm29943irbXWGuHBmYzXToOWS3Th9nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPbDwkDubmu2voFO8+QmP1lfF+b74FypW+28E0qWUjA=;
 b=icPJUkpKfdX7FfVAS78T/UDP2RrGkyZz0zGYOmxNDLHJKdqyAd9Y0jkpV8Ba0NfTolgqMTfuHaA+lBRBqLPaPA8GlYxHcHpWXgXkC4Vm2arQ9sqqRl7YELBPSwOj/bhHpl6AwZkapVPEEK+z0Om0LBM5PZZyc+kZ2KR1YRySNx+y8mVdlIgy+uE/8KojbYYoZQMHuJ2Z0eBno/wruqeo0LMlUjbsQDbwedtKx1rNCF2q7T1oStlgD05+keWYyJQO+CJ9xOZV3yRo7bKKaBII2I0w1WgSb6xQaJMsl7bVW+7xJIX3j3eja5LwWT1HElcikV1WJhH9cjXndDfNBW/Emg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index: AQHcZIbKZWHMCLfhnk2g+3dibmJCCbUQaX2AgAAU4YCAAQsygIAAOnwA
Date: Thu, 4 Dec 2025 17:51:04 +0000
Message-ID: <a5665ba4-165a-4a07-96a1-8dbb7125a52e@epam.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
 <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
 <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
 <42990627-9764-4a86-924b-3723cc493da9@xen.org>
In-Reply-To: <42990627-9764-4a86-924b-3723cc493da9@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|AM9PR03MB7709:EE_
x-ms-office365-filtering-correlation-id: 34f8b831-84e9-4214-8bb7-08de335db209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VmZlYWw5RWY1WjkzbW83ZjJmamJzMTA5UDZKUkM0OW1UZjF5K2pMVm1wM0cr?=
 =?utf-8?B?bXVUQnFNaW9NdnF4OE0zditXTmJYM3BhNDdnVTlrNXYwZXFlOTU1NFBlZTZs?=
 =?utf-8?B?YUJDZGNRSEQyWlBIeVg2c1FYdmVybU5WTG9sbUs0c0kxZmtnTDRUaGFuUGN6?=
 =?utf-8?B?eVM1dFhBc1BoQTA2U3o5T0JTTTVoNzIzeTI1RkFnNy9abW1scGJzM2dDaTFh?=
 =?utf-8?B?TXB5SDd5U2tYc3R1UjZrVCs5eTZBWWJRdUVPQVdOeXJZQittKzdrQ0VYWjlP?=
 =?utf-8?B?OHBlY2FpcUNLRkRjOUlQeFVkTWx6QjNjZ3V2OUdRU0FqNWMrU0pzUmVXV3Vz?=
 =?utf-8?B?UEJUZnJOcmZqbTNxVEVQSko5Zm5kMUloKytmdDhRZ0Q2UGhkU2FrLzNRRWpX?=
 =?utf-8?B?Vi9jcjRNS29vVC9sUzlYV1hWVVY3S1V1blBLOXIwSmU3a1JDTGI4ZUxUN1pn?=
 =?utf-8?B?OFZ6Vm9TM2xLZFhGNGVEWEhvdmVCZkRTZUlab0xhcFlyMHpxckJNeEEzZjQx?=
 =?utf-8?B?d0dsNlRKdERhU2E0MkNCeUxwN1JsSFB6TmY5cDRPWVhWQWNtYjBFeHpBZVVh?=
 =?utf-8?B?Z01WNnRyajlHRVlETUFEUURLVVlXcWpUTjYyUG5nbUJPcnZFdWpWbGs0Q1c1?=
 =?utf-8?B?djkzRkFKc2lYTzJUWFVlcmhad0dmOGhyQ25aUFFNc3BXSUIwYklUTzVPNUFX?=
 =?utf-8?B?YXFUamRGT3RuRW9ZT1VlTFoyRHV4dFBPQkFEQURFT3hnTWlpVm1GcHRUQ1hh?=
 =?utf-8?B?blF3OGpDR2Jwa3plZllIMmt4STB1R1luQnRQdnJBNCtncnl5VlQ5WEFJN3E0?=
 =?utf-8?B?Y3JXT2dWeDIyTkZQK09pNmsxUkMxRFNvQkxvYVMwdVlVc1RYZmVod3c3TGtE?=
 =?utf-8?B?UHFaTm9jd1JIYVlVcjlRZmJkZGQyKy9Kd1BjSkgyNHJScmNVN0lpT1FUVWtS?=
 =?utf-8?B?U0FKVVZqMlJBakFXM3FQb3dydmJBN04vS0FvdGJPS0NmaW5icjFQMFZXU0hX?=
 =?utf-8?B?aWhaR25EdXY5cXlaMVVzRXVESE9KZUo1VU1SM20zOFhUT24reTF4SEtSTXNI?=
 =?utf-8?B?cGg4dndVcUFuWUhnQlptWWlvOHhnM3pjUXJCV2FlU0dYcUE2bDRvbTZEZ05N?=
 =?utf-8?B?OHQwSTlJSkhsbWpHblVUZkE0bGZ0cHFuZUtLYnZaK0xzTFVkMGsvdFQ5M1M3?=
 =?utf-8?B?M1ZwNXQwaWI0MGEyVWFBdE1Oa1BlRWMyTUwydkx4bDBmajlIcDlQczg0U0tx?=
 =?utf-8?B?cXNTa0x4cnhnWTliMmRIc2pjZllCNTRRcEVCL0JSbTcvNm5aQ3picFoxTWxi?=
 =?utf-8?B?RndvSVdDeFlMbDB1UVZPeGtQVC9VOWQxVHpIdHdNN2UyZk8rV1dUUC96MzhO?=
 =?utf-8?B?SG11YVBPYkt4WGFuNXAzNlJ6TmJic1dyY0VSVjMwZmhUaVpWRlltbG40bnVz?=
 =?utf-8?B?dGdXYkpxZVRVbWY0cW9wU0hCTjJ1ZmUyS3cxK0x1MUhWcVVObXp4VUYvMnpj?=
 =?utf-8?B?dzlSNmg3TTZwblphaE5CQ1o3NG5CbHE4b3l1NFJtaE1uRnVmekVDZFZUWFFp?=
 =?utf-8?B?MGhBbDJqRnlWSnp1Q2xVTjRNRjduYkVCdFB4RWNMd3pwS3RlSlJlVHlMM01L?=
 =?utf-8?B?bExqZTZiTEE1ZG1VTG5wM3JWNzJCRGNibWc0RlNheWFMbGh0UmZBTnJPMXhB?=
 =?utf-8?B?MFVHdnpRdzZvT3BmRWlneGRxc1NyUE5SU2lBMTdtYU1kcmNCVFZlRHl5Q2dB?=
 =?utf-8?B?RFdUbVlBMHpsUTBZTlFPWTVqUFZ0UGsvbmk5bEY3OUVSMTFERjhkTjdQOEkx?=
 =?utf-8?B?UVh2b1J2RzE1ZTdLUDdnTG8rZHBHTzBMWjJoM0duUDRyYTVCaS9PWHhJYnpM?=
 =?utf-8?B?cE0yMlo0eEt0WmNycmovbm9tcVliTm4xcU13d1hMUHAwZUVzODlUSTM3ODhB?=
 =?utf-8?B?ZGV3VWMvSGFJQ1NUUDlWTUFYVVlZbHkrVCtUMEZMdGh4VWMvKzlWWUVyUnVL?=
 =?utf-8?B?V3ZsWktOaXlRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ujhsd1VyTG10Q2FkSi9leDdxbnRuL2hZaXNMdUErbjB3eVhtVXp0NlF1aEJP?=
 =?utf-8?B?MnRCeEREbk1NM0FobHBRcnhQNmhhZmZ2R1MxVVJWNUkxL3l5bTVjL2ZLZHp6?=
 =?utf-8?B?bUNYYUhGbnVlS3o0K2Q2b0xrUDFjRnJreVp3TCsxNytPMEYvMHhLL1JZSVNR?=
 =?utf-8?B?c0J6ZnN2K3dpWnVPMzZldjQ0b1kwWmRYWVRZbmVOL2RRWWdFelk4V0ZheVVn?=
 =?utf-8?B?Um9VeG9xL3FKNE5OcWR1OXM1ZWZyNDJjUEFjZFFMSlIzbE9va0Fab1FsTE83?=
 =?utf-8?B?ZytMUzUzQmg0bk1BN3ZhTDZZQmhNS3NYVlVmWUtSNHFQTW1lVTNMNm9PUVZS?=
 =?utf-8?B?aUNHWXY4c3dxdFIzMnhJOTVVQ3RtR2gydnNGZGxQelovTnE5dis2M2Q0bG1X?=
 =?utf-8?B?VjZhZTg2RDg0QlVTV1VWOVB3VWZUVjF1QUhtRlV2OXlIcFJQeTRhVFdmazJK?=
 =?utf-8?B?aGI5TEZCVlJIMit6eGlCNFRuS0VvRDRuaWZsTTlWeTltWUdoUU1rTWwrYVhQ?=
 =?utf-8?B?cnNPeU0vdUZKcFFUeVF1NDNzSlM4UkxtTldVM3RIZWRwNnJVZG50NzRxSkFD?=
 =?utf-8?B?eEpZZFhYOHFuQ1hQTytpVlVtbnhKUzUwWFBZK3Y3YkhSQ0JrVFZVdnVtWlg0?=
 =?utf-8?B?RDZEQWZKWjdnVkRqU0ZUL1lMVmdwRTlKODR3TVV4RW15SysvTk5TZmtuK1JP?=
 =?utf-8?B?cUdqZ24rYVM3c0xjNzRJT0doRkwvQ09MTFM1aXVOdEx6ck94b2ZDWmEzQlRm?=
 =?utf-8?B?VHlrOUVUZEZudTEwQ21QQkdUOFk3RjR6RitCYjNzV25CakxLZFZGSXZkQnhF?=
 =?utf-8?B?QStPejdHVjVBaWszTXZyamlicHh0dURTUnRPQUpIRHphVmhEV0dralFscUc4?=
 =?utf-8?B?R0VtTkZpaUJrUldYNHdITEVPbGZCVGtYREdiTVBETEVCdi9ZTTExR1BuWkhD?=
 =?utf-8?B?bmhJd1pYVUMxMUpYSzUveTczMFNQNnFBbEw4eldBb0FZOW5CU3h1OWRVT3BV?=
 =?utf-8?B?eXJhQnUzZjBIekpvbjJYcU9ENzdmNDd6cXk1RDRGUHNrQ1pNZS93Lzl6Z1da?=
 =?utf-8?B?TG1mc3VxSU55enVPTnBIN2xqdmlVaFRSTUxxUkJLNU8rZW5hTituUW9TbHAx?=
 =?utf-8?B?RitnZkVQbExJdlJGdUl3dnZyWE9LMkpQTXV6c0t3NGRHOEdtOGE2Vi9CQmRa?=
 =?utf-8?B?bldxM0tSTnd3a0FyYU1RT1hwSDNYUUhuUGRNMWNqSkpmZWJHNXdKOG1HclNv?=
 =?utf-8?B?WXJPTnI4bHc0Y3RsUWIvalBtSEY0VkNnaTlzK2N4SFVqemZCUkVjQll5SFBl?=
 =?utf-8?B?QW9Vdjl6WUJvZkFIWHErcXFkcm83UksydGovenh5WDFwMURnUS9EQ01tNWxk?=
 =?utf-8?B?ZEFZV0ltSGtxaCt3UnZEMFFsSnFNODEyZklUYVRZTndxVjhFUXM1ekxZQUYw?=
 =?utf-8?B?QUVpTWVUUWVtbk5YSlZaQ24zNjRaZXBRTys3cFdpd2FXazMyU05YOEpjNGhH?=
 =?utf-8?B?Z0FXRVNBb2JYT3ZSQTNOK3dWZG9OcEVJZ3N3RVhZVlNNcmZERlZyMnBrZUxG?=
 =?utf-8?B?VytYWHJPeWlraVBvMDBjTHZvVndUK1ZRMDgwdjIzdGtWdVVJZWd5blcyRm5W?=
 =?utf-8?B?LzkzREhFQjlkdjVvZ2Y1K0J2cnVZZU1vUEQxUnB5aGROSXkvdUJRVW5hcUVV?=
 =?utf-8?B?OWxrYkFhb2RkMGxFZjdwZVBlT05TYTc0SWNyakxPUmMyQnJ2NFpNaDM0Um5v?=
 =?utf-8?B?SmswMzhZdEVMU1NPTWJqR0dmQXZ3Z0Izd0FpTHRJN1BjcDRDaU9FRkdwU3hx?=
 =?utf-8?B?SzcxR3YyeEtSV1JrdDN0cGRSY0JEMEtyT2ZTcFRNcDJLemw0OU9rOVZMVlR1?=
 =?utf-8?B?YXR4S3RObnMvRWFReW1hWFdTTTk5cEJyUVBmaHlDSzZUanF4YmhEdFg2dGIr?=
 =?utf-8?B?b0F4K3R5enBFd2lCZGNCSHhlMjVTYk5KMlBldVJwL2UvTVZLeU9yTVd0aXI5?=
 =?utf-8?B?QnVtV1NjOFVIeE1hS0s3Y0kvQ1hwcE5ibzRCV01qSU5Mc0QzbC9DSVdNZWR2?=
 =?utf-8?B?Z3o5WGIvL0lVOUFyV2x3V0o1T0QyUkhHT2pDTVZUZ01mbXBVUFlZVmdxYWgw?=
 =?utf-8?B?dkUxQzBQZ2h4aUhCTzdMcXM1RXZITlFTY0h0cGVrZ1lBWnNTeWV5dkpkbzMw?=
 =?utf-8?Q?d1quLarRLqHg6bnh6mBDUS0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <558991E1E3C60E469F6AE9D588D0EDD7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f8b831-84e9-4214-8bb7-08de335db209
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 17:51:04.4804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WKgLwCYImFd31T6WEWPqDSxJMyezoi5C/2cAr5pHe3S1GiBEI0F/DUZVZlKoaSKkPtpWyKKiKkZN5iHswHzcyLlXVSflClYAoSvAITyWYws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7709

DQoNCk9uIDA0LjEyLjI1IDE2OjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoNCkhlbGxvIEp1bGll
bg0KDQo+IA0KPiANCj4gT24gMDMvMTIvMjAyNSAyMjoyNSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDAzLjEyLjI1IDIzOjEwLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+Pj4gSGksDQo+Pg0KPj4gSGVsbG8gSnVsaWVuDQo+Pg0KPj4+DQo+Pj4gT24gMDMvMTIvMjAy
NSAxODo1OCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4+IENyZWF0aW5nIGEgZG9t
MGxlc3MgZ3Vlc3Qgd2l0aCBhIGhpZ2ggdkNQVSBjb3VudCAoZS5nLiwgPjMyKSBmYWlscw0KPj4+
PiBiZWNhdXNlIHRoZSBmaXhlZCA0S2lCIGRldmljZSB0cmVlIGJ1ZmZlciAoRE9NVV9EVEJfU0la
RSkgb3ZlcmZsb3dzDQo+Pj4+IGR1cmluZyBjcmVhdGlvbi4NCj4+Pj4NCj4+Pj4gVGhlIEZEVCBu
b2RlcyBmb3IgZWFjaCB2Q1BVIGFyZSB0aGUgcHJpbWFyeSBjb25zdW1lciBvZiBzcGFjZSwNCj4+
Pj4gYW5kIHRoZSBwcmV2aW91cyBmaXhlZC1zaXplIGJ1ZmZlciB3YXMgaW5zdWZmaWNpZW50Lg0K
Pj4+Pg0KPj4+PiBUaGlzIHBhdGNoIHJlcGxhY2VzIHRoZSBmaXhlZCBzaXplIHdpdGggYSBmb3Jt
dWxhIHRoYXQgY2FsY3VsYXRlcw0KPj4+PiB0aGUgcmVxdWlyZWQgYnVmZmVyIHNpemUgYmFzZWQg
b24gYSBmaXhlZCBiYXNlbGluZSBwbHVzIGEgc2NhbGFibGUNCj4+Pj4gcG9ydGlvbiBmb3IgZWFj
aCBwb3RlbnRpYWwgdkNQVSB1cCB0byB0aGUgTUFYX1ZJUlRfQ1BVUyBsaW1pdC4NCj4+Pj4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gVjE6IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vPw0KPj4+PiB1cmw9aHR0cHMlM0ElMkYlMkZwYXRjaGV3
Lm9yZyUyRlhlbiUyRjIwMjUxMjAyMTkzMjQ2LjMzNTc4MjEtMS0NCj4+Pj4gb2xla3NhbmRyLl81
RnR5c2hjaGVua28lNDBlcGFtLmNvbSUyRiZkYXRhPTA1JTdDMDIlN0NPbGVrc2FuZHJfVHlzaGNo
ZW5rbyU0MGVwYW0uY29tJTdDNTdiZjc3MTFhYzQ3NDdkZTNkMmYwOGRlMzJiMDY5Y2UlN0NiNDFi
NzJkMDRlOWY0YzI2OGE2OWY5NDlmMzY3YzkxZCU3QzElN0MwJTdDNjM5MDAzOTMwNDQzOTcwNjM5
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3
TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNE
JTNEJTdDMCU3QyU3QyU3QyZzZGF0YT11NnBwMzklMkZWdG8ydlU3SHA1YVhsNDZWRjR6RHZEOEM3
OVhwMDliYm93UzQlM0QmcmVzZXJ2ZWQ9MA0KPj4+Pg0KPj4+PiDCoMKgwqAgVjI6DQo+Pj4+IMKg
wqDCoMKgIC0gdXBkYXRlIGNvbW1pdCBzdWJqL2Rlc2MNCj4+Pj4gwqDCoMKgwqAgLSB1c2UgYSBm
b3JtdWxhIHRoYXQgYWNjb3VudHMgTUFYX1ZJUlRfQ1BVUw0KPj4+PiDCoMKgwqDCoCAtIGFkZCBC
VUlMRF9CVUdfT04NCj4+Pj4gLS0tDQo+Pj4+IC0tLQ0KPj4+PiDCoMKgIHhlbi9jb21tb24vZGV2
aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYyB8IDE2ICsrKysrKysrKysrKystLS0NCj4+Pj4gwqDC
oCAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pj4N
Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQu
YyBiL3hlbi9jb21tb24vDQo+Pj4+IGRldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+Pj4g
aW5kZXggM2Y1Yjk4N2VkOC4uMzhhNTgzMDgxMyAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2NvbW1v
bi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+Pj4+ICsrKyBiL3hlbi9jb21tb24vZGV2
aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KPj4+PiBAQCAtNDYxLDE1ICs0NjEsMjUgQEAgc3Rh
dGljIGludCBfX2luaXQNCj4+Pj4gZG9tYWluX2hhbmRsZV9kdGJfYm9vdF9tb2R1bGUoc3RydWN0
IGRvbWFpbiAqZCwNCj4+Pj4gwqDCoCAvKg0KPj4+PiDCoMKgwqAgKiBUaGUgbWF4IHNpemUgZm9y
IERUIGlzIDJNQi4gSG93ZXZlciwgdGhlIGdlbmVyYXRlZCBEVCBpcyBzbWFsbA0KPj4+PiAobm90
IGluY2x1ZGluZw0KPj4+PiAtICogZG9tVSBwYXNzdGhyb3VnaCBEVCBub2RlcyB3aG9zZSBzaXpl
IHdlIGFjY291bnQgc2VwYXJhdGVseSksIDRLQg0KPj4+PiBhcmUgZW5vdWdoDQo+Pj4+IC0gKiBm
b3Igbm93LCBidXQgd2UgbWlnaHQgaGF2ZSB0byBpbmNyZWFzZSBpdCBpbiB0aGUgZnV0dXJlLg0K
Pj4+PiArICogZG9tVSBwYXNzdGhyb3VnaCBEVCBub2RlcyB3aG9zZSBzaXplIHdlIGFjY291bnQg
c2VwYXJhdGVseSkuIFRoZQ0KPj4+PiBzaXplIGlzDQo+Pj4+ICsgKiBjYWxjdWxhdGVkIGZyb20g
YSBmaXhlZCBiYXNlbGluZSBwbHVzIGEgc2NhbGFibGUgcG9ydGlvbiBmb3IgZWFjaA0KPj4+PiBw
b3RlbnRpYWwNCj4+Pj4gKyAqIHZDUFUgbm9kZSB1cCB0byB0aGUgc3lzdGVtIGxpbWl0IChNQVhf
VklSVF9DUFVTKSwgYXMgdGhlIHZDUFUNCj4+Pj4gbm9kZXMgYXJlDQo+Pj4+ICsgKiB0aGUgcHJp
bWFyeSBjb25zdW1lciBvZiBzcGFjZS4NCj4+Pj4gKyAqDQo+Pj4+ICsgKiBUaGUgYmFzZWxpbmUg
b2YgMktpQiBpcyBhIHNhZmUgYnVmZmVyIGZvciBhbGwgbm9uLXZDUFUgRkRUIGNvbnRlbnQuDQo+
Pj4NCj4+PiBXaGF0IGlmIHRoZSB1c2UgZGVjaWRlcyB0byBwYXNzIGEgRFRCIGZyYWdtZW50PyBI
b3cgZG8gd2Uga25vdyB0aGlzIHdpbGwNCj4+PiBmaXQgaW4gdGhlIDJLaUI/DQo+Pg0KPj4gSWYg
YSBwYXJ0aWFsIGRldmljZSB0cmVlIGlzIHByb3ZpZGVkIHRoZW4gaXQgd2lsbCBiZSBhY2NvdW50
ZWQNCj4+IHNlcGFyYXRlbHkuIFRoZXJlIGlzIGEgY29kZSwgbm9uLXZpc2libGUgaXMgdGhlIGNv
bnRleHQsIHNvIEkgdGhpbmssIHdlDQo+PiBhcmUgZ29vZCBoZXJlLg0KPiANCj4gQWggeWVzISBJ
IG1pc3NlZCB0aGF0IGNvZGUuIFNvcnJ5IGZvciB0aGUgbm9pc2UuDQo+IA0KPj4NCj4+DQo+Pj4N
Cj4+Pj4gKyAqIEVtcGlyaWNhbCB0ZXN0aW5nIHdpdGggdGhlIG1heGltdW0gbnVtYmVyIG9mIG90
aGVyIGRldmljZSB0cmVlDQo+Pj4+IG5vZGVzIHNob3dzDQo+Pj4+ICsgKiBhIGZpbmFsIGNvbXBh
Y3RlZCBiYXNlIHNpemUgb2YgfjEuNUtpQi4gVGhlIDEyOCBieXRlcyBwZXIgdkNQVSBpcw0KPj4+
PiBkZXJpdmVkDQo+Pj4+ICsgKiBmcm9tIGEgd29yc3QtY2FzZSBhbmFseXNpcyBvZiB0aGUgRkRU
IGNvbnN0cnVjdGlvbi10aW1lIHNpemUgZm9yIGENCj4+Pj4gc2luZ2xlDQo+Pj4+ICsgKiB2Q1BV
IG5vZGUuDQo+Pj4NCj4+PiBGb3IgaW4tY29kZSBkb2N1bWVudGF0aW9uLCB0aGlzIGlzIG9rIHRv
IGp1c3QgcHJvdmlkZSBzb21lIG51bWJlcnMuIEJ1dA0KPj4+IHRoaXMgbmVlZHMgYSBiaXQgbW9y
ZSBkZXRhaWxzIGluIHRoZSBjb21taXQgbWVzc2FnZSB3aXRoIHRoZSBleGFjdCB0ZXN0cw0KPj4+
IHlvdSBkaWQuIFRoaXMgd291bGQgYmUgaGVscGZ1bCBpZiB3ZSBldmVyIG5lZWQgdG8gY2hhbmdl
IHRoZSBzaXplIChmb3INCj4+PiBpbnN0YW5jZSB3ZSBjb3VsZCBoYXZlIGV4dHJhIGVtdWxhdGVk
IGRldmljZXMgb3Igd2UgbmVlZCBhbm90aGVyDQo+Pj4gcHJvcGVydHkgcGVyIENQVSkuDQo+Pg0K
Pj4gb2ssIEkgd2lsbCBhZGQgbXkgdGVzdGluZyBkZXRhaWxzIGludG8gdGhlIGNvbW1pdCBkZXNj
cmlwdGlvbi4NCj4+DQo+Pj4NCj4+Pj4gwqDCoMKgICovDQo+Pj4+IC0jZGVmaW5lIERPTVVfRFRC
X1NJWkUgNDA5Ng0KPj4+PiArI2RlZmluZSBET01VX0RUQl9TSVpFICgyMDQ4ICsgKE1BWF9WSVJU
X0NQVVMgKiAxMjgpKQ0KPj4+DQo+Pj4gT24gQXJtMzIsIE1BWF9WSVJUX0NQVVMgaXMgOC4gVGhp
cyBtZWFucyB0aGUgbmV3IERPTVVfRFRCX1NJWkUgaXMgZ29pbmcNCj4+PiB0byBiZSBzbWFsbGVy
IHRoYW4gNDA5Ni4gV2h5IGlzIGl0IG9rPw0KPj4NCj4+IFlvdSBhcmUgY29ycmVjdCB0byBxdWVz
dGlvbiB0aGUgaW1wYWN0IG9uIEFybTMyLCB3aGVyZSBNQVhfVklSVF9DUFVTIGlzDQo+PiBzbWFs
bGVyLCBsZWFkaW5nIHRvIGEgY2FsY3VsYXRlZCBidWZmZXIgc2l6ZSBvZiAzMDcyIGJ5dGVzLCB3
aGljaCBpcw0KPj4gbGVzcyB0aGFuIHRoZSBvcmlnaW5hbCA0MDk2IGJ5dGVzLg0KPj4NCj4+IFVu
Zm9ydHVuYXRlbHksIEkgaGF2ZSBubyBwb3NzaWJpbGl0eSB0byB0ZXN0IG9uIEFybTMyLiBCdXQs
IEkgZG8gbm90IHNlZQ0KPj4gbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4gQXJtNjQgYW5kIEFybTMy
IGluIHRoZSBjb250ZXh0IG9mIERvbVUgZGV2aWNlDQo+PiB0cmVlIGdlbmVyYXRpb24gYnkgbG9v
a2luZyBpbnRvIHRoZSBjb2RlLg0KPj4NCj4+IEkgc2ltdWxhdGVkIHRoaXMgZXhhY3QgZW52aXJv
bm1lbnQgb24gbXkgQXJtNjQgc2V0dXAgdG8gdmFsaWRhdGUgdGhhdA0KPj4gdGhlIG5ldyBzaXpl
IHJlbWFpbnMgc3VmZmljaWVudC4gVG8gZG8gdGhpcywgSSB0ZW1wb3JhcmlseSBzd2l0Y2hlZA0K
Pj4gTUFYX1ZJUlRfQ1BVUyB0byA4IGFuZCByYW4gdGVzdHMgd2l0aCAxIGFuZCA4IHZDUFVzLg0K
PiANCj4gVGhhbmtzIGZvciBkb2luZyB0aGF0ISBJIGFsc28gc2VlIEx1Y2EgaXMgZ29pbmcgdG8g
aGVscC4gSWYgaGUgYWxzbyANCj4gY29uZmlybXMgdGhlIHNpemUgaXMgZ29vZCB0aGVuIGNhbiB5
b3UgbWVudGlvbiB0aGUgY2hhbmdlIGZvciBBcm0gMzItYml0Pw0KDQoNClllcywgc3VyZQ0KDQo+
IA0KPiBDaGVlcnMsDQo+IA0K

