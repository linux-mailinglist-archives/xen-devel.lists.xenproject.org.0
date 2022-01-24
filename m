Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB9498433
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259905.448677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1oy-0007hA-UT; Mon, 24 Jan 2022 16:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259905.448677; Mon, 24 Jan 2022 16:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1oy-0007fG-RK; Mon, 24 Jan 2022 16:03:56 +0000
Received: by outflank-mailman (input) for mailman id 259905;
 Mon, 24 Jan 2022 16:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nC1ox-0007d2-1n
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:03:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a401c71-7d2f-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 17:03:54 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-sa5z16a5N0yduw2o41ieNQ-1; Mon, 24 Jan 2022 17:03:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR04MB2979.eurprd04.prod.outlook.com (2603:10a6:206:9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 16:03:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 16:03:50 +0000
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
X-Inumbo-ID: 3a401c71-7d2f-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643040233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7v3j0F2TPfRP5Uu5ZHXGdtyWz/fe4+66UECP+O2vK4=;
	b=OaAZft91I/B8cdhX5HMUzMBM0qRA6aOz457JA6TLP5l/12zA8DkWSB0ionIeu+8RRgFAsj
	5e60Ztph/lhX+uIvV4KMr/nXAUeU6hZitkX7mlaqAytjFIQe5CViJ6PSAGlnVolJyxJjSq
	TwCx9q+aaDhumO/Y9i5X588qru/r63A=
X-MC-Unique: sa5z16a5N0yduw2o41ieNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arZNzELJa2PDIlbLjB46Dqm0a3M5EtNv34xxxqANVj5bOcJu42HPO2EEJVE/UvLqkHUuQirx5rZ7a02WGQCFKrXjVrzu2PhrQDU6TeGYM0kEJsD9Fi1HgSFXU/zfjfh4W/VJ6xBPc4oU+PTZDdhTI0TmhVDmEJdyf6GjLJG/XaC2Dtdd5Zx8quGimFRX2JhEDgZIxiyAA01AOdorZFzQvb4kUDUzTNk2yeJymvwxQHDVvAd424weQdG94cZEDi4/B1pLQLM3r+QoM3OZhgwymN3pE28sRCHHAKms50wD8pti6G4zGGtPq3tprQsSj62M9c1OXY0LYdQEZzF1oPBYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTSzirHaUNmathUw7AmBJDZNEvpO5kRosWk6ErJIvjI=;
 b=A9rikqPIdYG9IY5gqdLn2FrDxVi3QZMsgxOmvJKzLDFNxXS8oreMgLAGGHxfCk+ZxstMQxhby80047DL8VnzqljwD6RRNPl1CAINxLadFbp2Rdwgsx0hD7Qa6eBH6NHuAhGUY+N8Buq5t2FZPZpRTAjawG6jglfH6xCzAo7CwP+mEuxoRD0K979uFsAzpQUVTwyNcq9L2LbII6tSPOr+Nei58UXJdYvnYI/Vj39sQLhqI5HZOAXaPavhxixROioz9TzS4E0JWVTjtOWFeDQ9Yfj+btYbcW2ld5nmiis0S/WWrgQfACpkTThULRYlaYurmmD63+hO7yGNdc13y3VcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce4b0cb5-7a8c-6e04-d263-1c5cd0466269@suse.com>
Date: Mon, 24 Jan 2022 17:03:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/pvh: print dom0 memory map
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220124155141.37495-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220124155141.37495-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0965e65c-2ca9-4a08-446d-08d9df531c9f
X-MS-TrafficTypeDiagnostic: AM5PR04MB2979:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB2979BCAE074B9C03FD5C4526B35E9@AM5PR04MB2979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AD+kAqYp+khEn3K5OJqdz/oZc2iATksyzOSkiThoT0kPDxESuWbfVLiGsyoFIbBZh70w7YTBt6R9J/Dp1EkDgb4Mz3Vklh4biaBeWK5E2z+yxnfriJFwmu7VzXep6XLBJaivUmk2MzNQRcDSKGAgoCK0OGX5wAezjHMRUb+WD8Yotxc6J8v1KobiAIsDEkP+GVYSy+dpya2vmgGB++HyrWYj1La9pN9r5G131h6+J2Gp4d0XW9zQuIXbEpSs4zLwLHJ4U7NCvyfzAVakNr8AlDXzv8ejC+TZT3RhV2cF8uAP2O7BJFrwWIrlrqbTXHpwuYHm7qDBzSYmaUREw2w8lyqn5u/OImSnCiyVvwhfroz7NiYAIAiEqR/1kuFgQSgAMinrmTFxITNMSCnI5MwPBQcwTmISQpxugHAn8jhCuHx2dDBwan6CAcMedcmb5LBXMRh7K6r/Wa91MQnpEDzf/zU0SFShhYad9Ef9EjluXu9fWux4rMFVzyElSmOE/rhxmQImLp82xNqdB5rww16Ah/tohgzubsasQm81OtMFrc2d5PHsbr1Izw5mtpl2AmNwJhrRnAKAiXwWgtYaHtQcKRPRJoSvYrwOeXxJhtwKbgJldcVaIypNZxfb+kEHMEhmlCkZA+0O19S4GJmtpBEBaR+4Iuzfp6mCjh+YYVqBcmbpXYbrsxtFsKg8GpmDN2MW3qi14TcwWdLSuJZ0gqBVZPCFX+aoBxybrBwnjiQRgMDJCt8LwLoDU34XNWJZZywy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(6916009)(8676002)(31686004)(6486002)(508600001)(5660300002)(186003)(36756003)(26005)(4326008)(4744005)(38100700002)(6512007)(86362001)(31696002)(6506007)(66556008)(83380400001)(66476007)(66946007)(8936002)(53546011)(316002)(54906003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zcr357KeCmT5//YvsyY3KI6BgCee+kbIYGKqdhwkB9Z00/50Z3s0VG9SWat0?=
 =?us-ascii?Q?UHRfJc0zL5EmjNFGzmBwSlW4gIgbLGJFhVJrOinU/hVm5zfxMCxprFRYpTtA?=
 =?us-ascii?Q?98KFt3q8h0/r0lHSw/WYXhgmmyCL/4+/AplBfsRUNDV58YRwkVEBn6hq8t3W?=
 =?us-ascii?Q?KZjyOCmiRvSOJFXfutz8kPo+qc+4vzt4lb7APF4Ho5Ok1ZIzJ2B2xoWPjZkW?=
 =?us-ascii?Q?xY5CX4NG1XjQYvSewznIJQyMdep/+HzwDisJvxO2TvWpuafI68lCsP9FNZ5m?=
 =?us-ascii?Q?HwOKt/ZQCfnWwH1IL6GWRh4YlUWgpZK0x6ObRCy3sU8CBK+1mDuk6XIezPor?=
 =?us-ascii?Q?Jmb+UOiY5HyXu9Phm3mCHSXsCif2HU0doSj3w6YxoPfox5rz57iXIeOB3xBE?=
 =?us-ascii?Q?+B01jXW8xZPL2rYtE6/NzTyLTTW0Yk9Fz/kSrlkmsXiN0FdSiKd26bCTiVjq?=
 =?us-ascii?Q?dNKDZuAR2wlwPUWPOuzVrk76mMgvV9hpr5fd/yQmH7BUTfldOqGBKbaNfNiV?=
 =?us-ascii?Q?UVfM+PmZAchxQefwlXr4e9Y1elzgL28LxrdKH2EP1EGdWn8/hMlQhYG/XOyk?=
 =?us-ascii?Q?J4RW+7JB/VMRHECqKahRB6HZbGlnQMhZMVAqyAAmyx3SS0dYraThMLtQU6DJ?=
 =?us-ascii?Q?MQkmbEsNL0xbqUhDQqnPNehpqu/52jfERGJiYaaO2vuJNde/k0gM4WDq8SIy?=
 =?us-ascii?Q?oRQDd1WMQfiZO5ABDevgrewy3hXkhezO0s7Y+vTWshiTaaUzPIs0cfdZJMPj?=
 =?us-ascii?Q?W/A9dd738JXWrHwsz/CNURblkQ7QAYVHy198zS/uLF2AwbJUkErfNgqy54KO?=
 =?us-ascii?Q?Sfon8TgiKT1nApU4N9uavSMkxrDNfvXNvoa4aG2L7kqWBFXEsTy/LYZKCZJN?=
 =?us-ascii?Q?YFtm375T3mW6uBNkn4xmZI0Zd5+b2S3poEIuOkEI9+u0Ryera+Q12d2rhsU+?=
 =?us-ascii?Q?OOuqaZhDYFxLe+ltbD24peetnJHyqwjFJtNtdONu97Y86lNIBNx+w14rCqsF?=
 =?us-ascii?Q?y/YdCvyWz25FiqTNJJvRr9R48DzPoaYn9s5aRdg1alBueC9RyaaXK0lwkqEg?=
 =?us-ascii?Q?MFhhEPMnT9+mj1lKTxNNrhrWVqzxcvdtDLK7XSHKVZXE1X/wQjhAEqnKqkZ9?=
 =?us-ascii?Q?pMjvIulg/N09gAZfxPEy4nQYsBDmJJaktNzz/+65jVSxZO6JoKrlFCKz6aHF?=
 =?us-ascii?Q?fsWLLx4TC7SEBSemjygJgbGeOyXiE5OionnbANogEoeRvaTNmvjHNan8vkSE?=
 =?us-ascii?Q?Kh5lJPBv6enPsMDGviIHqV6Hqq5lA3zC+NLf8hvmNvvoTs78Dd82qFsxnnuz?=
 =?us-ascii?Q?b9CMrIee72eeQaRt3rs498h1gI+YgbkrYbuCMv0WUmxT5EiTKSrawNKnvqFQ?=
 =?us-ascii?Q?hLkii08IvUJC61L9VvUoqWu8fyQVAqjidpcnSJQ9FlP8YsEog5ylw7KO0F0f?=
 =?us-ascii?Q?ctDmEXSpSr7Y1OLmSpeFdHo64KgzfaGPvLDDXlvd/qvhC/0n0SDQNqEb5iZk?=
 =?us-ascii?Q?5MQw5xfWpL4LTj+8wFM2EeaTEdZQLsiv21qwyixaUPYgtlLQJAZWshOcul61?=
 =?us-ascii?Q?brAFs68m4JqfsZqYAKGt0iVXTKv0Oq0+Or7xsDEkrcMBJdoQK+JXuYqSe2Up?=
 =?us-ascii?Q?RBJVwps4rm3bA4yMSom14XY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0965e65c-2ca9-4a08-446d-08d9df531c9f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:03:50.7024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MCYmC2nxjugAz19KmwJnTVZENRiSIe2oVMv5ScYhZj08te/D04QrvnWShKBDr4fdBR2vDxWdIfjJhgynNDIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2979

On 24.01.2022 16:51, Roger Pau Monne wrote:
> I find it useful for debugging certain issues to have the memory map
> dom0 is using, so print it when using `dom0=3Dverbose` on the command
> line.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further request:

> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -88,7 +88,7 @@ static void __init add_memory_region(unsigned long long=
 start,
>      e820.nr_map++;
>  }
> =20
> -static void __init print_e820_memory_map(struct e820entry *map, unsigned=
 int entries)
> +void __init print_e820_memory_map(struct e820entry *map, unsigned int en=
tries)

While making this accessible from the outside, could you please
make "map" pointer-to-const?

Jan


