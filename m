Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A2373AE6
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 14:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123077.232163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGRq-0000hj-8O; Wed, 05 May 2021 12:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123077.232163; Wed, 05 May 2021 12:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGRq-0000fp-3m; Wed, 05 May 2021 12:16:14 +0000
Received: by outflank-mailman (input) for mailman id 123077;
 Wed, 05 May 2021 12:16:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leGRp-0000fj-19
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 12:16:13 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 203085a4-c52c-425d-936b-22bff8f1bd81;
 Wed, 05 May 2021 12:16:11 +0000 (UTC)
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
X-Inumbo-ID: 203085a4-c52c-425d-936b-22bff8f1bd81
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620216971;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NH0iUGY5MfJN9dfWHScNXgaUZWJIg8vIlVGF9rvJaP0=;
  b=VWdqjqNfkai0WoMSYeHaO4hznLzHjTcQ/IKQRBFGocrA+61tO8vYYIwV
   g+zA7hcETFJYNpopE5TqO4GXBqcXAYxsvMRSKXBXop+uSUOMKWsS4oJsu
   EPODxsAqokL6L0OjdwLmGTgDm09/hjiYXFnxWWDbYaZdZTlLmSSh+pHMs
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ByBMvIavk7lcCQ7gU4qeX4Ei4UQaypFPegV8Q9+/HSFvyLqW1xcDuJbpAoj0/Ywbj1Inrq1DMH
 0gIIQ8pA5kZ4xOoTdar4grT6pwp/ZDImAcnjGUC4PRhuDycKDeCCRofoTIe35OQemkT1aBCdSE
 2K1eD9sjZKxIHIwa0tr+/mB6LWifsoQ136uGKAoqvtwzzP75/igLt0ty7BkMnHsDGBckm26JDT
 Qys2uNwKFUeCTXn22o7A91RC8cSr/F3Xj/I4vlmFUs3m3f1YA9YvPLoA61IDRvlFTFAVgu9NC/
 gcc=
X-SBRS: 5.1
X-MesageID: 43119902
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RRCar60hJgqc+t5Pz2KIzwqjBR13eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdnFebg9AGJY/Cd
 647s1IuzKvdR0sH7qGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnm4j41VTRTzbA+tV
 XUigCR3NTej9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+32VTat7XbnqhkFSnMiO7xIQnM
 DIs1McOa1Img7sV0WUhTeo5AX6yjYp7BbZuC2lqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VDAzuPFWB1wmk2/rWBKq591s1VlXZYDc7gUlIQD/SpuYeQ9NRjn44MqGv
 QGNrCk2N9qdzqhHhXkl1V0zMfpdno+GQrueDl5huWllxJSnHx/0nICwt0eknoq5PsGOul5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBraPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwLzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 SOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbXuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8lxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQvBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hv56fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YCVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsQun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDI1bCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob657/WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRq+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8EUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8Jxe4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qikWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+DDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 6i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregQTmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDFo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/9sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6X4Noh95+jFollnkx4ig7iP6JCh9QHzkq6QTeyJSPHiOhd
 nC6s6C2h3GkWN45aU=
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="43119902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH7QpByD9YgOwGV0X4BIYRx8ZIw0DdUYGbLtYsK+5XEy/1wAgUS3cfqr2CIBJX2W72HPfhg9tdFB8FrvnOEOn6HvnMNnvdx72lYrwrTraE2xuWmO16vorC3llBFPQhdgpPqlUgUvvDQjmiASKY6edgCvXewOGbo6h/bBA3vArAxKQJq8l3DCd2HfufDP8IiumlGnPq3l9Pc6jgg+0sgv0c5hs8GI9s/LhwuZO/L4teG/IseULVJfmOKZcGyPR7aaqWBYfXOZqV/ImIwiJ21prM0eOpZGF39tFO8NVZsjPg50UmDKWu7qRt3Z5S+84MAsg5kmrQcX7JsxkCQXhfI4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1Drzt6jytOK6IrykjjYlFRA7GKm8M8Kqpr9RDHzNV8=;
 b=nVT4UCFnbijLvIRSdeVJd8kzVRHA131aE3151hlvLqR/BZp5yBAjf2NE30KNYd7tnPwU3DfmIHrzueKE0HXruXcS2RpQ/wzk880eHh1eWE4x1vq4z9kDUf9LRVSJZRnKbRS4geEj8ldzdQ7i/6EU67tWmjGbkcAcNVsnholycpJDnRoAAKqPmj2HlZmKKpSudEmuGD5/5ETUnFkyd5kg//TztbBOSREu59FTS7g1f74+lT07eAUU5W5itiyoSk0NZqbHQvOQ863rgx54rR5AQIIYfLUSn+UDJ6Eb2sQY4Z0gCv7fYmCIT4HHDHymyQDpfRlctEKQ/eD1djM3D8XW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1Drzt6jytOK6IrykjjYlFRA7GKm8M8Kqpr9RDHzNV8=;
 b=MUgqs9k0ud/8efdCmzyC3m/hWRifUKbkkktCKUe9PKgsOEKtrSofLzlEWjPTfYXtymscN+oOuiIDeV/o6Zs6Et1fe6DI4bK4Sz0kQfYgQjtA03qJbwV6ZscOYF+7VqaEL5FSyS9G1UrtBUAIKQ4GxFqMQ+7kJSsYbnu0f4v6dmk=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <28384167-fbd0-d3ff-c064-ee88f5891580@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
Message-ID: <4def95ca-7488-09bf-19fa-d1fa0fa55427@citrix.com>
Date: Wed, 5 May 2021 13:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <28384167-fbd0-d3ff-c064-ee88f5891580@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b73b332-7cc3-441e-d1aa-08d90fbf8e99
X-MS-TrafficTypeDiagnostic: BYAPR03MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB36220F76E290AB5DE4266142BA599@BYAPR03MB3622.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKVgVaME7+puLzPpKQOCobqmy3EyDm0G+2e3qgnSuDVledeUfO2eoUzsb1c6hYDcwm/4R9GMXosGAvXQ5gF0Xytud49rqU9JnYDmTP2zSwg8JXIljvZ3eg8klGy3PBvjxcT4ef3uyehj2dZxJQPo2i1TZCFt+yNuQX6KYhV8O/9C6wByd7Y3h092Abjpw5ZGEtVxGNmZbKPzo+jjuxm6kF6rFqjyw9jiVYgCEAMrMFG9Cr2X+2j6yaX5SsWbIIWQYxrmLrsPxLzbgSsu4RNvWZ184P2fqyffparfOKbjz23GIlXWaeAnln+NThfvauMaYfUhBSoST6RWZb6Dy4M2D5+0eaGz/mQG7UQPZ5BESJK340WHDcCZsrNDZz8LTufi8irvXIaY5bZApebBWb2QuJt1r0Z5VVuHHB6xWv5dxP5FFbVHbo59PmlzcrD+0eWPwnmgIaeeEnlhF6UGh8b9E2xTH9WNKWAdE1rKrEgbGCH67DKxAGkdtmNozNThbfBofMuhQ0L6KC7BwDyz+DEl6Oar+yQykgQ5KogAQZyUdCIqBB1AiOG2Lph75H95R1J0pP/8cxrT+OPQOX13AEQs9/sV6paE53XRLkk5y8cckwg3q4tS0UBVFyqeLCDY+iMMeNWRHFIkDTetMKDUr4LMCkCp1nS/4QcjOTXI8QxYuGmeMalMaA9L18GkUxp/+mMB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(5660300002)(31696002)(26005)(16576012)(316002)(186003)(6916009)(38100700002)(31686004)(16526019)(8676002)(36756003)(53546011)(478600001)(6666004)(83380400001)(2616005)(6486002)(86362001)(8936002)(2906002)(66946007)(54906003)(4326008)(66476007)(956004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXdzUWl4VE5OMkFtZ1V4WUtWZ01FSU83NXh3WDNUczhPU3ZKNS85a09WaWkw?=
 =?utf-8?B?bHowakRQOGdqRUhuK2lacnJ3bE50TEYzSmtCaGFvWkRuZldUQ2h1dG9FTHZw?=
 =?utf-8?B?ZmRhaHVRSnljbWtjR0ExM084RWh1bU1zVVdNMTdtU3YrVlQvTEh4NnQ5SW9o?=
 =?utf-8?B?bVNNMWhKazlqdFl5aWhVa2xVVzhzVnp5bFNScDRMOTRyanByeWlSQWNQc3VF?=
 =?utf-8?B?N3JqT2NVYlpDWS9iODh0Qk94QmtCb01XR3JuRXdMcWJ2ZndBWFhIYm56UCtK?=
 =?utf-8?B?SjVrK0hzYWJPL29aR213ZDhpSHZhNnR0a1JvSGtGSVkzb3ljd2xzOU1pQWpi?=
 =?utf-8?B?NjcxTXRGSEVKcm41MHZ0cjR6YjVxWVE4ckpNTWc3Y1RUbkIrcWFOcEhjYkVm?=
 =?utf-8?B?ZGNiSmV6RkhoS1BIcHhaL25OZEo5cU1xY2o0UVcvYVZNd2lNMXEvUHlYb3pi?=
 =?utf-8?B?R3NOSjgwR2YxdG9TWUF4enp2ekhOZ2pHcTNPTUFCSmJNeUlFUk5CVzdwa2Z3?=
 =?utf-8?B?RnBNQTBlSTNpZkwxaERKU242WFRLTDVtSGgvNmJoWGxMaXZmaW9SVnlBNUtq?=
 =?utf-8?B?M2UwMHdMUGJiYTlKelpLQkkrSUxMMzNSZGFObG9iWXdRVFNHdHVueG5vRXlj?=
 =?utf-8?B?MW91TmJ4dXU4RE5kaERiSGFnanRqRUh0bURzWE1WdXNNK0dXVzJCRXhndFpj?=
 =?utf-8?B?cFgyZ1huZ09MZ3I0cDltTnVTZ25tbDFyWExFS0MxbUF6aDZFZEEvY3Y2eVRw?=
 =?utf-8?B?MDV3bGptV1R1SHhrNkV1K0NlbVE0MVhXNVJkS3hqcGxpdllqb25uTTRUUUNa?=
 =?utf-8?B?TUVTWFh0TmFvdGd4cERXTjJnZHdHa3RqYWxQcy9naktWblNrdUJVR0YzNWhn?=
 =?utf-8?B?eEYyWS9uM0pnSEc0YjNyUWx5b25RaUNFZWI2dFUvUWJzZDd0NUhBdTNWZHpH?=
 =?utf-8?B?cE16ekwxbk1LL1FUalJORklrZDN5Rm5wbVlwMVdFdTFBSTgvaVR4b28yRlVl?=
 =?utf-8?B?RkUwMzVkMktCWXRsQTlDcitrbXd4bmluT3BGRjlZaDF5OUhwbytJeUNRRkQz?=
 =?utf-8?B?ZkNFT0dGMFNpdXBVU05Jd3pHMzM0ZUM5L1Q0ekFxS1V2SWMxQ1Q5b1RHeVhS?=
 =?utf-8?B?bm9SMjdoNjhTNTFXWkxFRkFtWVNTY2dPTzVSVnVCangxR2ZkZzlRU3hGYkRm?=
 =?utf-8?B?K3orL3ZCUE1VT0JveXNWS3dlU3RXeDcwN0o3U1V4ZHZDZTlnTnNqeUVaaVMz?=
 =?utf-8?B?aG1scEdQSWlaeEd0N2VpUWVEM0lsZmEveVprVng2eE9qRnFDRkhKNDBPdFMz?=
 =?utf-8?B?QnkzNEJ6R1YvbmFEcUJMOU1tN1BEcG0wc0g2T3F1YzRyUnlDaEtZekdSK0FX?=
 =?utf-8?B?ZW1ZVG5yN0FENXdsYktkQlRpN1EvS1oxRUpkNkY5citLT2txejFrSTlSSzlu?=
 =?utf-8?B?Q1JYZnRpOWNYcE9KLzh0TmUzN2RwbXNGckR4MFVOcUpJZnVzZFFMWGlIaUpn?=
 =?utf-8?B?d0NGTnFKZFFHelNUTDA0Q0p6U1pvWVBDUEo0WGVVbmZ5RTFtOU1hVUVTTnBT?=
 =?utf-8?B?andlU1p0MXcyTm4yK3JLM2JHY0p5WGY5ejF4L0ZpOFJySHVFMjNBdzc3ZkVU?=
 =?utf-8?B?VE53bEZCSmp1cFpURmVNaTFOMFI3eFd5aWZFZURDNmhDTk5XSUpwWUNYdzUv?=
 =?utf-8?B?YWxDc1ZQQitNOU9iM0NaODBoeGNSRmJleGltTm9CRWpmaGUwbWw1dE0xWFJW?=
 =?utf-8?Q?TTVgJVkyGre+ZaJolsHm6DojaA4E8OYprPprg8J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b73b332-7cc3-441e-d1aa-08d90fbf8e99
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 12:16:05.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeXPKt1T9VDJmCX+UquT5Pq8aWOnMaIRZoj5Se1Ow76WeJYUUZ6noWLt+zBtlPPu5/wniddpPWYuQH+wHFbc31wu3GoGjfUjg+FAWGkM6Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3622
X-OriginatorOrg: citrix.com

On 05/05/2021 07:39, Jan Beulich wrote:
> On 04.05.2021 23:31, Andrew Cooper wrote:
>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>> @@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
>>      }
>>  }
>> =20
>> +static void test_calculate_compatible_success(void)
>> +{
>> +    static struct test {
>> +        const char *name;
>> +        struct {
>> +            struct cpuid_policy p;
>> +            struct msr_policy m;
>> +        } a, b, out;
>> +    } tests[] =3D {
>> +        {
>> +            "arch_caps, b short max_leaf",
>> +            .a =3D {
>> +                .p.basic.max_leaf =3D 7,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
>> +            },
>> +            .b =3D {
>> +                .p.basic.max_leaf =3D 6,
>> +                .p.feat.arch_caps =3D true,
>> +                .m.arch_caps.rdcl_no =3D true,
> Is this legitimate input in the first place?

I've been debating this for a long time, and have decided "yes".

We have the xend format, and libxl format, and

cpuid=3D["host:max_leaf=3D6"]

ought not to be rejected simply because it hasn't also gone and zeroed
every higher piece of information as well.

In production, this function will be used once per host in the pool, and
once more if any custom configuration is specified.

Requiring both inputs to be of the normal form isn't necessary for this
to function correctly (and indeed, would only add extra overhead), but
the eventual result will be cleaned/shrunk/etc as appropriate.

>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_p=
olicy *host,
>>      if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw =
)
>>          FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
>> =20
>> +    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
>> +        FAIL_MSR(MSR_ARCH_CAPABILITIES);
> Doesn't this need special treatment of RSBA, just like it needs specially
> treating below?

No.=C2=A0 If RSBA is clear in 'host', then Xen doesn't know about it, and i=
t
cannot be set in the policy, and cannot be offered to guests.

At the moment, our ARCH_CAPS in the policy is special for dom0 alone to
see, which is why RSBA isn't unilaterally set, but it will just as soon
as the toolstack logic for handling MSRs properly is in place.

>> @@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cpu_=
policy *host,
>>      return ret;
>>  }
>> =20
>> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
>> +                                        const struct cpu_policy *b,
>> +                                        struct cpu_policy *out,
>> +                                        struct cpu_policy_errors *err)
>> +{
>> +    const struct cpuid_policy *ap =3D a->cpuid, *bp =3D b->cpuid;
>> +    const struct msr_policy *am =3D a->msr, *bm =3D b->msr;
>> +    struct cpuid_policy *cp =3D out->cpuid;
>> +    struct msr_policy *mp =3D out->msr;
> Hmm, okay - this would not work with my proposal in reply to your
> other patch. The output would instead need to have pointers
> allocated here then.
>
>> +    memset(cp, 0, sizeof(*cp));
>> +    memset(mp, 0, sizeof(*mp));
>> +
>> +    cp->basic.max_leaf =3D min(ap->basic.max_leaf, bp->basic.max_leaf);
> Any reason you don't do the same right away for the max extended
> leaf?

I did the minimum for RSBA testing.=C2=A0 The line needs to be drawn somewh=
ere.

~Andrew


