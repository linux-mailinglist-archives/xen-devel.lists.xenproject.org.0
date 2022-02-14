Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00524B5145
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271885.466602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbAs-0007X0-PM; Mon, 14 Feb 2022 13:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271885.466602; Mon, 14 Feb 2022 13:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbAs-0007V3-L9; Mon, 14 Feb 2022 13:13:50 +0000
Received: by outflank-mailman (input) for mailman id 271885;
 Mon, 14 Feb 2022 13:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbAr-0007Ul-3M
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:13:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1dfcabd-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:13:48 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-lixr1cFUMgijD8Ux3yzamw-1; Mon, 14 Feb 2022 14:13:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3406.eurprd04.prod.outlook.com (2603:10a6:803:c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 13:13:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:13:45 +0000
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
X-Inumbo-ID: f1dfcabd-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644844427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Fi8D62XABGeWjmxtlfo7U4bG6XfsuzWSsHMcCnfDOA=;
	b=X78p+WPnxfzHxlS6jKy1iIMRwUnKdytx8EPukOYB8L3ajmKH96A/FaFSJrssBy7LcqXTSl
	KaSgYXOCVd2nYUxwGYdcF2hgTkJDTNSKicSnNlzYRHvIFj85kvCScioCgA9Bki9eXIMMqu
	a0tzD+QatAb5vwp3z54EgjSZfieqYVs=
X-MC-Unique: lixr1cFUMgijD8Ux3yzamw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctdBXAYTupgRdxIWOyViX0l/1EgT0qHMEfAOpssEwX7gU8TAmSqEM7sFqoconCRehBtkvDCB3ohlgA8qPfvVYykWasfXETslUDH3mjqhqrFNmoFY3obz++s1fpgzpOu6bBgUWNyzkaqUj6m1BoCNYyvCNl6sU9rGDHM84sl1bqd00//Ju7+j7Wh0Gxf9D8roGdCym+NAO+Yjwewv+4nerTeSr1Nfv8sXhTk5GV2k1qN9EXgdS1RbC65YRPIl5F/q4XoqwVtOKqXcgi6bPbRZjdWAy8GA59mVxFDZHGXAlTHCsoDiXpI5690cSjCQEbYjT5cxWXAmNwVUHHx3oIOSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Fi8D62XABGeWjmxtlfo7U4bG6XfsuzWSsHMcCnfDOA=;
 b=Vctq11h5Sn3lqyzKNLy8W3MDyZWZYKydSrAq/8tyyJ+0c7Syj+Kieqjenut5NnJi7DqEumb/99UtMi7aD5xX901q5+8opvDIfPlygz6r+aBDW9+5qH3EdeU/BcESJQYB8uUZ64VTLH9tQ6TteAl2meDmbaDHgyafXbk78DxoAh8gSpc/uKZ9dvmx7oEIWJyzFeyUsC0Bb8YLYGl3dPtOJ0OBV64vc24MXqGABS3JvGzzyzOrMoq0Qner5IhDtG+G0CwdvEDmfxe3t0Erx9DywrljWIwiZWiLKGv6o7KTXQMZxSuGL6poxjYc07bne1Jx5rT7y2tgsCO2Ymy9WY/SeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06407c26-a189-c4f4-a30b-3bf802be06ea@suse.com>
Date: Mon, 14 Feb 2022 14:13:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 6/7] x86/ucode: Use altcall, and __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125632.24563-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0276.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b17ed0b-1ca7-433f-fe48-08d9efbbd4b1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3406:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB34065EB416A13820CAB7651DB3339@VI1PR0402MB3406.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n0tYlBG0ahgqcsp9lIR+Uk9UDe6+pEGH1pClr/GyV/VY46pAL/wpu8s9kPoFsodotVv+8bFf5074XApPwBHv7JUJfBO0ofFAs3MeNbPXX7jkfxjATTQ+U7hQp9X4H0qn1joL2IAdv8x2d008MRXVI73NFWlayo2SorDZVy7fWVAezufkmwEeQkG+F2mCYRqxkEgr4x0XFQZf6YYPaIUtZFfHi7PuznPKVwmED5f6t3mSgStwgEH7gczedawU5AzpZYxOeCA9ZPVObWzolmAwpVtSiCPoZ1Xnajm137rkoa/dPgG0VHDOnbr6f8RJ3lBvJ1jU7bVQuycTDpnv6g2YnxnLy6faK4qP9/YmOwXZPovOPgUgbaHcWSBU93it/xPiJCOXYcZAqE9Z5pUjooQl4F/yEic0KQYU3HfljL0HumuEBzypREl5y/OOVurEAHV85lZn6KEzyKx/tXrH39atTyBmPG1pvz1lfohDOxbhs4doklVdQgUYQOjZzcG6V14FEO8gqkLfBLMmVZNJgD7HALtFxEBswn2jAgV1C6WdNfIJ9YyPdnbv3qwvvwFmlbA8+UCCtosEUR8B7cXkuXUPr2wEAh5ElqqToUzwdjPIiuqvpE1nFrNWxvjFiLxoIHtydwtPVJ0MvSs/nOkzBTEHc2d7gDV7/eke+s1nIkX9BBsm2pxnWaCJFPzLpZnU1riI+mOxtgAXovzAVuqUtfCBKH6L9X82xoWuotLudcq+E2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(5660300002)(53546011)(508600001)(36756003)(6916009)(316002)(38100700002)(54906003)(31686004)(31696002)(66476007)(66556008)(26005)(186003)(2616005)(6486002)(8936002)(8676002)(66946007)(2906002)(4744005)(6512007)(86362001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1Z5M1RpNTJsM09QKzQ4ZTVCamw1cFJQUFA2Qm8zbVkxREViTm9rSlRmTURq?=
 =?utf-8?B?TFl1QWw0dGtKM3F4bmJ5KzlDRUljN1pybkhoNkZDejNaWXpKNEFiWDlJN2di?=
 =?utf-8?B?ZStSVkhvWnRSU2xaaVNYMU9FbWYrVWp1M21yaVQrUHBlNG9DT3lFNnJjbG9l?=
 =?utf-8?B?dER4L29uMTV5b0d3enpLS29rS3lLU2lPK3Bsa2hWdU5YUnhFZXQrSlFNa1JG?=
 =?utf-8?B?K3JvQmZuOWpyWGNSU0Jua25WOVBOMjU1LzhxMEd3WnJrMzN1RllKQU50ZjZM?=
 =?utf-8?B?NW85N1A4SG91QzZOd0tXYTRscjI3Z1BSYnJMUjhha0F4ZjRCblRPZ1dhdDhk?=
 =?utf-8?B?QmFRQVp6amJzVkRQeE00aUFWVEpobHJSdmFGeW1pVXgxNW1wNmJLM081dDVF?=
 =?utf-8?B?cThUVWl1d1ZCeXhjcjJHZmdYK0tVUndSd2wwUGt4Und3ZVZhVTdJcE82SzN5?=
 =?utf-8?B?Rm4wVVVhNlpuTHBRc0R3VGw0V2ZlSXc5SU5BRjhaYlBnSlB0R21hV09LWHpl?=
 =?utf-8?B?ZmdqUEZSVnhjeW5UZ3ZOSjc5WkFST3VIMGFlcXY5bkZVUlFaNlh0b3M5bmph?=
 =?utf-8?B?TVA0WU5wdG4rVkxiSEpPQTlmK1A3cnNadHh2SnhxNFNOYjVPUi9rUzU1d1l4?=
 =?utf-8?B?SEtCclltNTF0Vk1naWtmVnhvOFpvTmlkaVRRK3pBcytiTVRQZkJKNk1vRFYx?=
 =?utf-8?B?aGJDbktZRGprZ2RSK09URXVjSWM5L3NPc2w1b3pkSkcxRmw3OVk4MmZHT0NK?=
 =?utf-8?B?R2NPS1FzeWlHeGpXMEZaZ3lTUmFyY1dva2hqampEYWh2VzdOR3l4cDgxODhq?=
 =?utf-8?B?ZzJGM2VYL3pKTXNySCtlYjRBWGxMaHNEa1lSYmZSWGZNZDBDanlsejlqTExu?=
 =?utf-8?B?Zzl4dVU3eUZDSk1rRFlZZVphTXJ3b1VtOE03Z0FzWkEySEFRNy9HS2plZFRQ?=
 =?utf-8?B?NVUwUTFRSXNNR0lGQ24wVzN0RUdDdmg4Ni8rclVzQ3BNeTczVkQrQ2xBYng2?=
 =?utf-8?B?QVZLTFh1Vy8vcEtGOThqR0xYMm5JTmYva3dlc21vYlBud1ZYczgyZnNKWFRs?=
 =?utf-8?B?dGVzZHdQWjVyRTQ3SCtFaGRjL1lBUGhHbFNWRGZOckhrdnJ6UDY2VGhLUm0z?=
 =?utf-8?B?VzFaV1RudzVPdGsyckNWc1NZVEFCRWR6TC93ckhEY1VZSkwvLzk5UmRCLzNR?=
 =?utf-8?B?ZHdGam1JWGREWkhFYVRJZGNsK0pFajMrRXdXeERCYjl6WlQ3UjNLOExtY3ZU?=
 =?utf-8?B?Nm92dVdJUGZncEhXb2UzMHhrVVBlUks3aldodEVRZUhLYkdmYnJkSXY0SGE2?=
 =?utf-8?B?ZWV4MnpBZ2ZiQWFPa21jTHdrQjRWNjMwZitIeUJFQXdkRmY5V3p2bFV4K0Vm?=
 =?utf-8?B?YncvSWhIbDR6NjV0VGVZUmFUcEozWlBpNlAya1FXVmd0cjRwdkM3NUpPTjhl?=
 =?utf-8?B?T1gxQSttSEFKTFY0bFlwQVF0SSt5eGRjTW8xTmlmb1lpRXd2b2NiWFV6NkNP?=
 =?utf-8?B?TVhMREpGbDVtZUxrd1lIc3hnUk1VTFl1SGJ0cjV4dmNwUDlURGttRWVPc1N5?=
 =?utf-8?B?UkpjeVNpK0ZJTys2N1R6cWRJSzlzYnE4K290aXU4MzNNcmh2WExjd0JSOEx4?=
 =?utf-8?B?WFByUTZzSzdaVFNpT2JLOVBLZTBiQVZCVkRpQkZjaDFCZlMyNHc4ZmFtZjVY?=
 =?utf-8?B?cFJVV29INUxudlRUOFVDVFlIblJ1UEdrcUt0QjFCQXVTbDU4TkEvOHFVV1hz?=
 =?utf-8?B?cE1Rb3E0dVBaS0FaeC8yQ2JaL0V3RlBDS3FQaTlEa2pCejlpRmpRR2lVYzRD?=
 =?utf-8?B?d2FhR1lXMWwvOTRJWVhZVUFDaGNmeXpPY3QrQmFnZWJvYzZ2N0xCTkR6VEFq?=
 =?utf-8?B?Rms0WEFQbmJqQlRNanFWMjVzZklwekV4bWdLL0tzOXRFYURuSmRyZ1lQV0ZX?=
 =?utf-8?B?dVo2MklNN2QvSW4xWnAvOEtNWlBBcm96NkwwbzI4a2YzTWZTRHdscEtuRysr?=
 =?utf-8?B?K0hwMmdvK0o2OWE1MThPT3FyNUdTeUtxbXlSNGViMTl1VnhXL3JRUllOZ1FB?=
 =?utf-8?B?RWltNFZaRW52T1V0OUhaaVlkMFRpNzR0ZlZ0Qm4zaERPZ3pjbThxTmkvaWdm?=
 =?utf-8?B?K3M3djd3cDB6VzdBSm4xa0R5aVMzODA2b053RWhQbUJBVVIwR0pING90OFFw?=
 =?utf-8?Q?Z2oq6azB2qaClteapbh8rUQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b17ed0b-1ca7-433f-fe48-08d9efbbd4b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:13:45.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AojWoxL5LqWOmxszyzp9QI+naRMMGEpz2oeok65AtBQntmQ1T67s24aQhrYLjLpUWYiyg7S7O7oCzZAOYqpwcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3406

On 14.02.2022 13:56, Andrew Cooper wrote:
> Microcode loading is not a fastpath, but there are control flow integrity
> hardening benefits from using altcall, because it allows us to clobber the
> endbr64 instructions on all function pointer targets.
> 
> Convert the existing microcode_ops pointer into an __ro_after_init structure,
> and move {amd,intel}_ucode_ops into __initconst_cf_clobber.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


