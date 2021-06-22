Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306B3B0880
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145894.268351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvi8d-0006bH-6W; Tue, 22 Jun 2021 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145894.268351; Tue, 22 Jun 2021 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvi8d-0006YE-3A; Tue, 22 Jun 2021 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 145894;
 Tue, 22 Jun 2021 15:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvi8b-0006Y8-UI
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:16:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37a1fb50-c36a-4f4c-8049-5a9bf9deaffa;
 Tue, 22 Jun 2021 15:16:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-vjjNn9FcPiGvTo-uhLjzsg-1; Tue, 22 Jun 2021 17:16:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 15:16:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:16:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0256.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 15:16:22 +0000
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
X-Inumbo-ID: 37a1fb50-c36a-4f4c-8049-5a9bf9deaffa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624374987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5BzWviYvjy6fMCruQkIalETkiPlSQqLj37o2AeMY5ns=;
	b=TzwLXwnfwsb3g2TRHYmL1AFe6yGeNc5B996t92XNpvArMl0RR2wbuU7YLlB1hJ+Aj1Z1Ft
	5nreXNvICwDSqg9DMf7RgHu6xDAXuxSqlhV8tk338Yao2idZOO+ab7UoVTn/pwf8+csW4w
	mKpz6yrJfniz2GcVuqiXXU/ngwNXblc=
X-MC-Unique: vjjNn9FcPiGvTo-uhLjzsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5JkWPuV7XEm6WzlRcKfCsSTv+8JrNsq9m0fAxRm4ZvRLyr+OoA9hdZ6pbZ/UepQVkVkTZzFO0rhp2ZKmMn7HtgcCjuOG2Y9M6QywmtiszaaMBKztd45lGrL0U9TEOnhnCU3+xwc45yrzD3BtVyIjSMFVSjFHAKjqM9YSPf5qQ/TFenixAK21W6LRovXfYMpL1DhhAMefXaXzx4b2pX/9e1efbdPS//2s0GChLKb2vG/lvqNJN0zE4op/PWk5CWxEpBcoEQ0SdmxG6zVBUJGgDKt6tX6etxl5Vf3xcVtyO7O6hAKceqcG3baNyzjCcqftbajTccKSjIAF+nex95T/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BzWviYvjy6fMCruQkIalETkiPlSQqLj37o2AeMY5ns=;
 b=g2lUkJRa4D030nYh90wVpAXUywPggepsh/4lZEf35I+cl3PJavNRL/4+kVDZsD1BPZaxU30O1VlEMckKY1ylaKLgfaPrmx95rS6uhinNibpDVDoIENaSv2BY/T2yh+hTA1wkpSJwTD2f3C9j3wkdfJBO4VeUViYJg++4myTB9Rp/WCNemqxUNY2AeNV1WbdvnNaI8sviW4f+nTFSFjBa7/ihbGIXZUV1FzilIu+ffjUG0nxQTShHofxr4kMw5TBaA5Ug/XiEiM4BN22vjMgfARop2yRv/FyXmmux1zUx11xQcj0XfRoLsrm+QEIn2qm+JLatIHQ9LuXtUAbfLgWRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/6] allow xc_domain_maximum_gpfn() to observe full GFN
 value
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Message-ID: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Date: Tue, 22 Jun 2021 17:16:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0256.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::28)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 515c00f5-1a0a-479f-7b75-08d93590b20f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244549DF17EE810F4D077286B3099@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pZx/2rC1VUljRodRK62qt8tRlvJ/9edJbW8w+SAB9MMXNMDBI3vV/1sLZ/Fz3sGMKOVkA6vB/r7pN8PsBsujE5bTgEGUPphryHJUxa0SsZzdNczVNNxAarXCK5pD+I0D0ba663MXFhlhBUVQqeoQFq/DU0qcCce+tfPHxB3ickPU5tQ5QUZdGYGdkTD2UCo0En8/Xre6/j0DWdH0BWd3/z7BXFV+HttuzPO6NZaXaYcWBgjK4Vdi+vRY3lJ3C0dLiZKXyu8k1vwNCpqdVgC6LcbcOA3tKhJNaumgZ7rDwuIDM6lmKGCFPNhE4SPXq6H+VTEvTOoysbb3b2qAuqQ2Ep/QxCKqyvJV7xG5tWQW+hZWsCm4YZ2cha3aTqUVRStILTjpJCIs52R5kTQVAss9bC1GakuZV1MtFeqw1KdTnqYlEcRMN8AVF2tFkaOn+mYThQUalIMb9+uIQttbWOgBYr9EYjS5FPbnIjcxKNuhUADRlfXDlsUi4g+UyjxAAbF8qG1Epol0qmr+04gx2yRsAxDYtuMM2XwLOJs7yfCWp79MLwJJh3lY7H7lm/vHZDslpyY8qEd7Yqlv/lSTqyR1Jt7Pt689ABQWYux1vBaJxBOq1S0xXVBGmoRu2mnSCrFGWyUXkEhBFJvSs1DNdAhMpvpTDNF6BUHokmJMhymSK/U8ejkUeC6hSPbtzRTv9gjx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(346002)(396003)(366004)(136003)(54906003)(2906002)(5660300002)(66556008)(66476007)(66946007)(186003)(4326008)(26005)(107886003)(16526019)(6486002)(478600001)(31686004)(36756003)(8936002)(6916009)(8676002)(86362001)(31696002)(83380400001)(2616005)(956004)(16576012)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFkvSkNZNVlmOHV4WkpFd1ZkYmV2Z0hOU0ltcTBheUJ5VjNKMTI5WkVENmQx?=
 =?utf-8?B?VkxFSlBFZm0ySHJwcXdTdC9QWFFqTTN5bE9OOEFDemU3OUtwU0I0VnNlMk9l?=
 =?utf-8?B?YmJSTXB1TWYrSFMzbUZhTisxSmxvUDJNbzc0Z2d4MUZLcTVCUU41ZG5SUDlo?=
 =?utf-8?B?alEranZvWHV4K2FmWWI4RFJ0NFVpVGM0KzRvajlSSWZKMFp2b1JTakNFdjdu?=
 =?utf-8?B?c2VIZHpGRnRtdUQrRm9FclBtNjlrOHNjUWdwdi9kSVhVRFlPM2dzRytjLy90?=
 =?utf-8?B?UVZDbnMxSlc5c2JwVzRXUGJSY2MwMjVSSUdwaTg2N2doaFJkcXFnNElDb2JR?=
 =?utf-8?B?NUxlZ3BnNTJ5c1drVVB0VktheXFodG1rdThYTzJIaTBlbGZPaFQxTFNrUFYx?=
 =?utf-8?B?WDNEYXFpTU93d1E0TTVvVFlITlNDcU85NCtSOEdUb01Mdi81bXczT2dWYU1O?=
 =?utf-8?B?R0Mwa0pyVFJra1VXQThDWnQrTkJTSW5OSThsQjRRMUk2THJJdG9nMVE2OXdv?=
 =?utf-8?B?MFh1bTJWR2gxNFkwTDZmZGNPMk5VbGQ2SXNmZFh6TXVCeXJIQzkrZ3hzWjVI?=
 =?utf-8?B?ZFV5MDl6MGFTaUl1eWp1TDJVdnY0WE9vYlg2TFVLc05mWVJkV29zcWJjQitX?=
 =?utf-8?B?V1NNaTI1VkZjRXh0aVlITExQc3VDME1NNmNGRnNXMXNEWThkelRIOXlXdmtG?=
 =?utf-8?B?bFRESUEzNGpVTEx2Ym5KZEtRa1lnRkkyYm13R09OdEJHMXNtaS9aS1grM21J?=
 =?utf-8?B?MFdacVN3Y2hzdTh0Y3Bob0xmcWhqc2ZhQTNnUEJxY3ZSMWovSStzSHArelpk?=
 =?utf-8?B?RngzVG8vZk5PVXRTZDhjRVY4a3M3eDRRclVnRThNWHI0TEg1eEpORmo4Yyti?=
 =?utf-8?B?RmdaM2hYclQ3OTBldFBtcXhEYXprSXM3cG1ydWZDRk1HWStjUlpUalcwcmI1?=
 =?utf-8?B?VkJjbkkxRlExQitNM3lmTFk1c3ZkZFBtM1ZDTk1jSDcwdVJRY3g2WHRhRlBG?=
 =?utf-8?B?N0pZNmdQTWpTd1UzVE55cVIrSVcranAzM29lbFcyczI4MnQ0OU81RElJa3o5?=
 =?utf-8?B?TXlObTlGQW5QMjhSd3RRTTY5TU1MMUNWL1pBN2NhNThKWEhaQi9reTVNZ1JW?=
 =?utf-8?B?cForNU9GbWJUeW01eW5TbzNWT204c25YUm8rMCt5M0dSQXZUNU5qQ3hMZW5Q?=
 =?utf-8?B?b2gybHA2VnNGM24rSTFLbnc4d2ZYVVBlU3Q3RmlRdkdsZU90eXdaLzRTWEtC?=
 =?utf-8?B?eGZrV1hvWHBYUGNhbGhRcjEvWEwzaWd2Qkk2eGpYNEtDOXJjSWFZc3NqRlh0?=
 =?utf-8?B?SU9wZUNVTnkvOG5helBEQnA1c3ZvbnlCMm5zWjBYRGxidWMzenBLRG9hNlEw?=
 =?utf-8?B?UStub1EyakdCRFErU1lGdWlVR2tteHlkN0R6ZE1LSE1xUTAxSFJ1THNyNnJN?=
 =?utf-8?B?SmE1NFdvdEtUNUFXdUlLOU92K1IvZm1pcjRWd2czNHZldVlqaEJadGhOT1Ar?=
 =?utf-8?B?OU1OZDh0cFJlRjd4V1pRemlFSUpSc3QrQTlwZXZSQTJ4V0I5ZURwRm1rZXN4?=
 =?utf-8?B?M2NEQXp2Njg2OCtMYnNsaXNqcjQ3NXc2L2JYbll2ejhPdkY0anJDWEVnSUR2?=
 =?utf-8?B?YnBxZ1N4cE9zMjk4YktDR1ptUVA3dGwwRVR2TUo0YlhrMDNuSkxGRGhqRGJt?=
 =?utf-8?B?V0I5S2ZzSk9UQ1dsVFZ1dUg3UXRZT2JRRUhFa01aR1JuQmcxeGVSWVd3SEwx?=
 =?utf-8?Q?YiiKfc/8fWBg8RHBzqS9O/I1yCDWSbxXt5UCmkH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515c00f5-1a0a-479f-7b75-08d93590b20f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:16:23.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFaE1SJq4JvfozJE5S3rQr8E2z7oML3pOsKeEWVnS2CUjO/5xvGtNJB4ZMu82qIYCbVpwd6IDZN7Xl8EPjYAGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

The present remaining osstest failures are due to truncation of the GFN
resulting from the hypercall return value being passed back through the
ioctl() return value (on Linux and Solaris), which is "int", plus the
same for some further internal interfaces (osdep_hypercall(),
xencall<N>()). Some of the memory-op sub-ops, like the one involved
here, may pass back values which don't fit into "int".

Different effects can be observed with a 32- and 64-bit tool stack,
each causing one test to fail. The changes here will only deal with
the truncation resulting when sizeof(int) < sizeof(long), i.e. only on
64-bit. For the 32-bit tool stack case to work in such a situation,
yet uglier hackery would be needed. But even if the full value got
passed back, we'd then hit:

#ifdef __i386__
    /* Very large domains (> 1TB) will exhaust virtual address space. */
    if ( nr_pfns > 0x0fffffff )
    {
        errno = E2BIG;
        PERROR("Cannot save this big a guest");
        return -1;
    }
#endif

in xg_sr_save_x86_hvm.c:x86_hvm_setup() (and there's a similar check
on the restore path).

I wonder in how far a guest property can legitimately cause an osstest
push to be prevented by causing a failure like this one. And of course
I'm also puzzled by the ovmf change having managed to make it through
its push gate.

Note that I can't tell at this point whether there aren't further
issues, as I've not actually tried the ovmf case. I could easily see
there being oom issues there then, once to full value gets used for
setting up the p2m monitoring during migration. Or processing might
then take overly long.

See the individual patches for changes in v2, all of which are to
address review feedback.

1: x86/HVM: wire up multicalls
2: libxencall: osdep_hypercall() should return long
3: libxencall: introduce variant of xencall2() returning long
4: libxc: use multicall for memory-op on Linux (and Solaris)
5: libxencall: drop bogus mentioning of xencall6()
6: libxc: make xc_domain_maximum_gpfn() endianness-agnostic

Jan


