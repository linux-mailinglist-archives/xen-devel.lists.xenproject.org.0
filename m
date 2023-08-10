Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A67773B0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 11:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582007.911511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1dt-0005sS-AP; Thu, 10 Aug 2023 09:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582007.911511; Thu, 10 Aug 2023 09:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1dt-0005pf-7D; Thu, 10 Aug 2023 09:07:41 +0000
Received: by outflank-mailman (input) for mailman id 582007;
 Thu, 10 Aug 2023 09:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU1dr-0005pZ-8g
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 09:07:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f17162-375d-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 11:07:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9984.eurprd04.prod.outlook.com (2603:10a6:10:4dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 09:07:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 09:07:31 +0000
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
X-Inumbo-ID: 57f17162-375d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8ylhUali3Jy9lfS2EgcC6HB8FcbpeC4Sae5+BxegvUrwuriXE2AWn8YAwQP6zgdq/0Aso4GSAgciGun5AJE7aGJJrBP1mloyQFGku2aUQtZG7Rq418mi85qqfRoINDaMoTGLRe0eDCxphq8ElypmsHZzSYcfTMpWKx7oL5Hx1qbH5Wb6Dwj9CyqC1WPEiHl7nJ4fRpjJ6wSlzxTweX/Sk0T8Py3rasRVZcYJNS90kMahckD1VMQK3chc+PYHBKTQKt6feMzqxJlYivuk2GgS7LQqkEAe7UZ0W4QmjvRrE2E/XdG6XjrrCmBEixVZniNjaA05c22/YiHbJXTtk689g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1FfYYbck8MBH1DVoDjc0/M+BwvqhqkOAj+HgnVrQoE=;
 b=UcJFgzdagWpNDwLSdnVRvOGn/ozq9gekXkbcysm4LupOuQASIuqZ9ikF7ZxXR8zhodE/4P5GaLRFB3Dw3SY9IEYtcmV4Be/BEfEGs0mzdVkczDvJWOLwDAR8lezBVfOQqC6/y4RHOY15wc8lMNNC+7C7FFsTuGEGTWKufqiMvvT0cxiZSU6pG2yQbSyNFWPB20aJECxp7X4RLae6avhcM5qUt6RgTkQZ+enjKyt6HoqXR8X9tCcXF98EyZxWn4deHqvV3yra7R49uvlpimqmyds7kiqqPSM+G94Q/RNSG27hGFWtnAS2MPoMpnjr5a2Ou9RrFLurZieQBwES1yyz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1FfYYbck8MBH1DVoDjc0/M+BwvqhqkOAj+HgnVrQoE=;
 b=kLXiUs9skEVjseB647z4e6FkPCSGwyC53hFDVqLTEF9pWI0iBVWttMy0RBzTd/OghKvEQGxJ9BDSYmhV2aTGFsKlmTzGp4sUeQq7GEX8d2nRsPquAb0RvN6fE73nQ0eUJsrJU2wJy6zfqslE5QePCuHm/sI4jtynOGJGgxVsgCUDK3lq47Wvf9SkkKlTeyaoRvEuesKqkWRmiDjxLGRCW5koOt/baXXyrjb+6He2h+0Z0WjaVNGGsxSvuCwch8sWk9uNJFVY9sMh+NPIPasWzP0x21s98AYEehiUeimPzT/h8hMYpTW+M4RTdeMO8owvTe9bUPX/YBVNkk2UKEEejQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d06d3304-1df0-e932-bc32-7a9939870487@suse.com>
Date: Thu, 10 Aug 2023 11:07:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Moving Dom0less to common, Was: [PATCH 0/5] Fine granular
 configuration
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, rahul.singh@arm.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, george.dunlap@citrix.com,
 christopher.w.clark@gmail.com, dpsmith@apertussolutions.com,
 Luca Fancellu <luca.fancellu@arm.com>, andrew.cooper3@citrix.com,
 roger.pau@citrix.com
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2308091243280.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308091243280.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 569fcf97-5d3a-4f9c-4604-08db99813a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z8g2vIuUbs9dvTOgL3xXzy2HhSboF9jA6/9j3w7p1i3mSDx+VXUB7vB3rOoZbCXyklsRUadudItCP9CV4uadHF3wx9qgk5FU6nopnQNfxPxbxrV9NAJXX3jm08ghOMwe4EdB+yItcwW3s62UK3YAjLXglypBO3CTrk5xHy1IAQq2ZMgzUgx0QBAwMOKpzFxGbe9+Ov5JmIa+ixurnVkaMrrZecUKA8UtJt09JPYMNmvyZ1AEosLdmemXfQIJQFZGTcOzYvA2ZamSJEB0OzuSp8ZQdWRh3qp0t8M7RrkeGl1iklNPcot97r1FbTqY3YVhmPVvdLJc9ExBWI6Pf7aM97NhqCS9jg+olDdvfystMoCJjpavHzMNRoa8hnnrOLY+CMnfR2iWOD13t1D0uV9VDe44qdSkoJ5A/Ve81xTxctGqZ+D+6+Dp/vZFCK+d8DYwVvx+EZOSV7kEz1mwq0YAhdxr+XkrPr0f37QY8LTnYYqnGVOb4VJEvA34snQY79Qavl2qiD52oj2tA0erijdV0QKiSmdaln2gziRKgIQIfS6DlYS+lkGyTi7lc62HKx7WG91RsoHLUzZizUXJO/WWTP830Yn59G1leyLeKxa0oXssZCrz7AsKuWzUC1xRZH6zjdtQRNdKkhihw9bpbgfIGUfQ53Bj8vy5dppobFHIJJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(1800799006)(186006)(2906002)(478600001)(36756003)(4744005)(26005)(6506007)(53546011)(6512007)(6486002)(31696002)(86362001)(316002)(8936002)(8676002)(7416002)(4326008)(6916009)(66556008)(66476007)(66946007)(5660300002)(41300700001)(38100700002)(31686004)(2616005)(54906003)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzlVcVdoY1IzbWFGRVFrSkdEaDNHV3V4ckNQMFp6ZFk3eStydmFOeURrYTNE?=
 =?utf-8?B?QXRkbVUzdGYxQjFtSGVjb0lZUzY1VXpwWHhYU3FGNnV3dlVQaEhkVEFqY2RZ?=
 =?utf-8?B?VWlWbWE4NGRXTlhLb0VJZ05rSzYySFBvTHZsdkNHcWNwaWtMd2djVUlZTDZw?=
 =?utf-8?B?Q3ZjMktUSTZOdllBYjAzL0tGV1BFQktpTVlXTFVxc0xQN0dlN1FFT1hLVU5T?=
 =?utf-8?B?eVR6TXV2eTAxYmRmYTh3SmltMWtZeUJnU3NGendwQWVaZU50TmdGWml1dnFK?=
 =?utf-8?B?U1hkK3JRM0tzTmphVVo2OFlSTkpmbkM5L0V0K1A3cG1lTDVVWXpLUjAxY3ow?=
 =?utf-8?B?QzRMM2lRZjlBTk81eGMzMVRTYW9JbXlZR0xLR24yTHBTVCtjd01YQVpUQ1E0?=
 =?utf-8?B?aTZDYzM2a1k5WUNWcWhBaXVsbzE2eEZIL1pUSzhUSnFwNGFXV3hVQ21iQ0tN?=
 =?utf-8?B?aEpLbWJ3THFZcko3TU1mSVBMTXBCRFZkTlBtYS9YNUh2dEw3M08vNm92U0JH?=
 =?utf-8?B?MER2OCtpZm9HdmNCa0hWSDk5Z3A5dDFCbGFkSmxudGI5ZzhORldwSGRKRStQ?=
 =?utf-8?B?aDlJKzZNMWU4WUNaVVhiMSs3eHVJcjFvQlhmV3BNTlU5SnI1bHpCR05BYTlj?=
 =?utf-8?B?d3pPSWdKMm8xRkJTeGdCRnlHeEFOVlllSC9vRUdUQjJiWDZyd1ppVzByTmxY?=
 =?utf-8?B?T2lKTFpBb2I3Y1BhOVN1anRvRVJVeGw0VVR2SkZZOEZUblJKSlhzMm9NL2dy?=
 =?utf-8?B?Z3ZxUG1Rd3ZIc0lmajRoeVhFcVBQZlZPd1V6Vnd6Z1NyS0I3VVBRMDhGeTJL?=
 =?utf-8?B?STV2WkFISzBvMWd6THZEMVdMdTgvaDNTT3FOcW1YcjFoMEQxRmVOMllsSThj?=
 =?utf-8?B?T1VETjdjeERXcnVMV3BwL2liNjRWak9ScmlKQTd4aVRzdlUwWDhmS2lUZ0Vm?=
 =?utf-8?B?bTRMTlRtU1pHd20zWEphcE1oS0JXNnJqQmsya0pHR2prcnZnS1dxWU1oRVNH?=
 =?utf-8?B?QlVRQnN3UlUzdUFoOEJvckNkbVNmbU13cXdKKy9FclpwZ2lvV3hINlJxZ1JF?=
 =?utf-8?B?UkJLdHNrRUUrUzVYWjd3dk5WR3djZUxHM0k4Z1FwWGY5VUFmY2dVbERwMSs1?=
 =?utf-8?B?MHh5SFdYeXd3eXhPem5IakR4Y2tSRWc1dE9oZVBQSVA4d3E2TXUrSGtDYVFI?=
 =?utf-8?B?L0h0NGxObFhjeFVMSWMvdkFaYXJ2am5lbFR0YkNXZUhlZkR0Z3lJdkFkMVVX?=
 =?utf-8?B?dGV1MGVlU2gyczFvQlRJYzFxa2Rxb1FXZUt3MDlVcnBwNnhqQ2s0ZlM1WlF5?=
 =?utf-8?B?d0pEWFlYNWhqV08xVThRN0dOZGdtWXBzVCtxN1BPUHF4K2MzakFiNHVYQ014?=
 =?utf-8?B?cDdzOFQ2U1RQNXNNRGJiMEVacEhQTWw5d0NpZXNJSGw1SDZ6b3ZOaEpBc3lV?=
 =?utf-8?B?NHNIbzkzL2pXbFJtSmJXcHJSb0FDMG1HTCtkQk5SZ0NjbGtEeUZldS9oeHox?=
 =?utf-8?B?Wld6WFp0aHV6ZzhuMTlmdnc3QUZrMFRGZXRSRGpMOWs5REhGdFdLVU9mTXRv?=
 =?utf-8?B?RVZxL3FoRVROK25uRi9NcjV1ZSt4Z1l3bnZOQnRnMmxBMytjcE9aMjRYQjBS?=
 =?utf-8?B?cDh5RDd4TE53RzQvaUExalRhZ2ltTDd3UG5KbWI5Z1JqSUhUUC9nZk1NVHBv?=
 =?utf-8?B?aEtHRjRtQmRSanlmUm5qc0loajhCdDl6Q2U4WVFkcWsvR0dKK2VZWXhoR1JC?=
 =?utf-8?B?Y3IvRGpIQ2ZSd2JkbkpBZGxTc3RBQkNaZjE3d2txVm9ZTzIyNzF5cTVETmtr?=
 =?utf-8?B?Vm1HWnIvanV3L3FpNTQ1RkNBeDVLQzEycWVnR3ZVSjB6V3Ercko5cHNqaTR1?=
 =?utf-8?B?UlNBS0puQnd4SUswK24zZlRCSHIzOGM0MmJoRStPSGhKeHBoOWRwTTJuN0cy?=
 =?utf-8?B?YXRwdjlTa1dRRHpya0VIUlRwclVYaDQyL3EvZlkvR2ZBT1RuTXBWdFUvZXBx?=
 =?utf-8?B?U0xsekJYRFlHeXhOSHJqbjY0VzNYd2ttU21Od3puUnIwUGRZaGw3ZTF5TkF4?=
 =?utf-8?B?N0ttWW5LbVhFYmVxWktNaWZIb3hIUFZQaHVSbFJMNHhlS2NPc1E1V2lJUjY4?=
 =?utf-8?Q?ssUG1g96Hts5wVMFZZ9JDFoww?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569fcf97-5d3a-4f9c-4604-08db99813a9a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 09:07:31.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocXqtzDwDl0IQsEjCjCcfa7qpmBtOz2GT6iEUmx2MashzCvf9FXCscJVQ45zzCFJ2j7t5+HMbJKkUDXMWJzAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9984

On 09.08.2023 21:51, Stefano Stabellini wrote:
> Would the x86 maintainers be OK with it too? Of course further changes
> will be needed to make it useable on x86, but looking at the series from
> Christopher, the two sets of internal interfaces (dom0less/ARM and
> hyperlaunch/x86) are very much aligned and similar already.

Moving common code to common/ is surely okay with me. How much wants
moving is (apparently) a different question.

Jan

