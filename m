Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39063CB399
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157087.289933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IeZ-00068R-Qq; Fri, 16 Jul 2021 07:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157087.289933; Fri, 16 Jul 2021 07:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IeZ-00066f-Np; Fri, 16 Jul 2021 07:52:59 +0000
Received: by outflank-mailman (input) for mailman id 157087;
 Fri, 16 Jul 2021 07:52:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4IeY-00066Z-Dr
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:52:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b70fdda-19c6-416b-8e7f-e9566d28c304;
 Fri, 16 Jul 2021 07:52:57 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-Tfa3Eux3PcWRHmotdLQFLA-1; Fri, 16 Jul 2021 09:52:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Fri, 16 Jul
 2021 07:52:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 07:52:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.26 via Frontend Transport; Fri, 16 Jul 2021 07:52:54 +0000
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
X-Inumbo-ID: 0b70fdda-19c6-416b-8e7f-e9566d28c304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626421976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMwtzzVfENFIeyVxHbh8rDEGhkNjoKOCi0g9iVF0DMQ=;
	b=U4xPIDwRBNH2G1fReFWqiBC3XPzTJ6BAyr/AZeTs+GNz3bkMqnGqOrJcPRcUSOIpuyxkKs
	YuKH0iFS3dq8nPy+k1fnqLzFdvileSlLsTzlASXHSrvGhgrC+eFnVGc6uWB09wOlTr2yF4
	3cHziLgZbkWvA7cmreo2+vhvsYx17u4=
X-MC-Unique: Tfa3Eux3PcWRHmotdLQFLA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/zXJFT2nhe3DH7k1KmN9wyXtlBofjhZdlOwQh4U+xcYxgTjN5P5oA1LdS39hl0yrX4MoOAmqyAzu9W1GxCcd1fe4xnkoJHQu+WEFCOhVpj0B3YNO6M6uM2jHKrh4dB85X0lQM7j3KDrnp2YM7kGwKJ0if5+6BF3HxycnYn7JJNljx6iPUScU6IcwIdgwXRsbfNalqG/vTKgh2av1g+f79v3gpC6erLzxbPku21aH9An397B/Ez9UJqTP+GTWLnxnvnLgJy7xl8o/EpQZBh3GXneODDy3hJKNZpmNLJRhaXYYDisKKIUcZPqlPW27eFbK8pj/uZIMKFG/E9eseQG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMwtzzVfENFIeyVxHbh8rDEGhkNjoKOCi0g9iVF0DMQ=;
 b=oABIC9Sfksk5hcDO0QAUL3Nh6O9k65qm8KtDH/sKDQoszRMmfTQQqI4KgNefoM2+qM23OekaAT/9QRsrmKI3lhz0i/8yF+bWrgxKU/e2BmjSEnPwSQ88cZUR4w9yedfUNG8SbbcD8fV3d0NGk9y/SRIeaRDyOyu396ExEmxWhiKq4PH0RRp0jLXGtyFgbqagHhjKg9lt9k2RTEuDcr1UHW18rugR06PTjoUq0WJtCEJQrV0fx7mb2sEbKFtVbj1HrtJyrHSI1rFVAaBb4CXY0yP7ShmQDJarBBpauaQEZ6MeKyFqJgYu/jatlO8e4w3HN7+1mcw2q2w/SqyDRIvv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Suggested changes to the admission policy of the vulnerability
 pre-disclosure list
To: "Charles-H. Schulz" <charles.schulz@vates.fr>
References: <87r1fzclw0.fsf@vates.fr>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6da30009-d817-f48e-11b4-ba9c92cde93d@suse.com>
Date: Fri, 16 Jul 2021 09:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <87r1fzclw0.fsf@vates.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b50719e7-a57d-46b4-c7fd-08d9482eb818
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339258F72BCEFF6BF84C2307B3119@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mnN17aWMnFrySTy2CCB0rBJ6b/tfrIaSTRRQY5U7P2R5c3dT4xw6Ya9KUbqzGhZIV5wSgF4YrnIYPNEAUuc0BDyfuQHKv+dEIvMXsOfoxs5esQ0ZjxwsMSDEsmW7SY8/E54ISqKc57mye20YraR9qES3ljeVjt52pb8rWbBx0MoG5nhKjTAxHIjy4zY86alOLig8XZSToRPiFrUW4ZB7HDh1gp6lw1HVVmlezXNzx0jaR4k1aSpWBP+fAIipu5IXCAcqWCFIS4M5B9hRsRpNPf/gp/zKKu07B3MvbWAxLzrlObAt2n5Kn44WcHXYdOEEXVIUsz8kapApbv+cu7/F9ab2YyBx0dF8S3fLGS32gNjah+bhxmVqCKCsuWjKl4CIT+CEbsWEtz3bqVo5K+vNk1C2jH1/Z4G5B7MD3Pk68ACAWiob4Q6E+wZR+3aCjpRW7RUkhgpufUiWCsuRAZwnraRyXPhJyHEawLC2r7sfZBac0enhcZwruy1L1jGb1JD7bX6Cyaqd6jlODYrl7p4MXpazqbGHEeZYMoY3xmXURvT3+M1ydgrIfGu0fJs7/UwY/bFrlVl/Ewl4AbiEOuv6Td/eh7XGx0dhqUB1u2n4U9Es25jnU1PA3SMiqsYGGN/XsICf2KtQGNpieZAUv408kFTUwWvauIzoX5vvPlED7HxWIVDM0r7dr5tnpkGyz/A0xGYQp8BSbhLadhqw6+nNEGGWvI4AAy4WAYNFjoRw1irryWN8j7Sy4nUrovUFhR8LIhsM8LnihO2M+OtNHeH85gQ0p/bw+vOegpx1H3px6GEMC8/LYDoR/Hn775eyAig+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(31696002)(316002)(956004)(26005)(2616005)(8676002)(8936002)(5660300002)(83380400001)(4326008)(186003)(66556008)(6486002)(66946007)(478600001)(6916009)(66476007)(86362001)(53546011)(2906002)(966005)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1Z6MWhuK3VqWW9aR0M3RnhpRnhhQTBkcEpGSVVmNlA3YU95YU9iTzgrTkxD?=
 =?utf-8?B?UnJmajFraXlPS0o5SFR4L1A1cWZvVFBkTHhHUnlTdnFneStPekVDQXJ5Q0RB?=
 =?utf-8?B?bDlVa3NoaGxuT3ByK1IvU3RXd0ZBeDFXRVQ3RHpUNjNPNk1tS0IvS05Dem1C?=
 =?utf-8?B?NVNLTS9NZXJrWDc0aVJqRHRyQmo4WTJybktubkY4NTE5RE4raFhBVy9SSDNp?=
 =?utf-8?B?UVpKUlNUUVZjdFBkTkNNNE5ESEV5TTlXd01aQVFITXpYTWtUNURjNEFYNlRr?=
 =?utf-8?B?alBvY3hPRVp4T0tsdDVGSWRnWGUzUWZQdGc0M0Y2OWhIUFhEWldXVFpJOFRv?=
 =?utf-8?B?aHlSNkJxSTd5YlFoOUpDMkRuREhWbXlWL3AxSkhjVUVhZy8zWUVYSW1sOVl2?=
 =?utf-8?B?Z1ZDbm5BRXNoLzNScEJXQVZWdFJxenlPWWpqRXpuRXdicWsyektRZHBKQ296?=
 =?utf-8?B?RTgxaGpYZXZKTTh6V1Npa0ZGMy9sakFKRHpBY1dPUlpsYVhja1I5N1VONUNX?=
 =?utf-8?B?aElrVG95WHlXNlZDM01vUktEY3dMQ1ExejFaYVBUcW9WcGJPTmppZ3lYamRP?=
 =?utf-8?B?NVgzRzVCVkJzMHQzSndPNTFEUWhZSkRQdzlFblpCMWxnLzZReGZQNzhrRmps?=
 =?utf-8?B?QXhhMEdPUkdIUytxS0hjdWIrRmlaQ2RGTk9RYXUxV2dCTytWTTZ3QmY5Q05Y?=
 =?utf-8?B?NG5RYWhWL2hyQzcvVEVQRjlEWktMbHZCcXFFakgvR3RXZmFQOHBKdS8ycFpk?=
 =?utf-8?B?ZlFPU1R6R1IyV1JPbG5vOVJMVGlZNncvdmlzYS9vYmorNEpzaUpEY28vSnE0?=
 =?utf-8?B?LzNCUnlXZzIrS1JXTnY0SGtnUnZhcjFCWVhabkV2M2NvUWJTc1hIbngwMjgy?=
 =?utf-8?B?ZFB3ZDJvL28yMVo1a2ZRbEw0ZzlZekVXMjAzaURscHBJM3piZHZvd3lGV3dq?=
 =?utf-8?B?UUxnM1VQRk55dzhLQkE5LzBEdWpaVThuYVIxaGZyVEVZdWJoOG1qL1NHK0R3?=
 =?utf-8?B?bDcyTENVQ1pSclU0bFFlOUVaZXpOMlNjaGxBQ3RVaWxURXNjK25CaVhDWmt3?=
 =?utf-8?B?SzZmc2NZL2htaWEvRnNjQmw1Z0t3MnBia1RNQ1Y4UFk2ZlVVeGkzUEhTKy9Z?=
 =?utf-8?B?TkN2VmcvVmNVMnVRblJSZHJMVS9KTDVVbkExc1JtU1JiRzFOcjQ1cUIwbFFD?=
 =?utf-8?B?MWZhenZlZTNqK1V1VXRDdERraVk4SDdKS25lRlkzVWFmM1I1c2dHUkpjYW5t?=
 =?utf-8?B?K3ZTLzhFTm9SK1BMZFZIM3hENytGNHdWQW1Ubm92cU5VWWkvMEsxOGtxOHpL?=
 =?utf-8?B?MTNqUmlUbHI3dkZCV3lFMHVZR0FhYzJ6ckdGbFhwQUVJOW9mTXBmQ1RmV0VE?=
 =?utf-8?B?b0NiTWQyajlWV0dvMUppRHdUNmUxTk1NZ3lSK3pKdFRJUmpNMVI5cGFQaWpn?=
 =?utf-8?B?S2pLMW9Eb1YxK1lsMHhleEhzWWtJOTJ5NHBuVHZLWC8wcEJMQjNFYm05Wmc2?=
 =?utf-8?B?Q1JSQ2xGVGZ1cG9KMnkvNElJVmlIR3N0Znc1VHgyYjZYUkhqQ0xPeitIVVEy?=
 =?utf-8?B?WnM2NTJrR1poRWNWVjVTb3kwWkY3MkEzR1VveU95MGhGaENGSG9HdFJrdkNy?=
 =?utf-8?B?V1pEdmJia3BoeGM5UXRUOW5weWxxVHljdXRwRFlGS3U2eldSdzREZHZlYVkw?=
 =?utf-8?B?a1h6amMycUlBb2o2ZG56RitPZEhVbk4vamg3ZERUemhma2VEdGtENzAzSXlX?=
 =?utf-8?Q?vlfxmJTbG4CnWzxIRaUB1NtWQEbP76fCAFq8YzG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50719e7-a57d-46b4-c7fd-08d9482eb818
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:52:54.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+I01GapDBBrBlhwkeNPAQ4OdnNzNQawAbHR3Jn5w18Da9dWnxG+OaFLw5c68eRkRahxXcir8CEB55q0wlpWLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 15.07.2021 23:23, Charles-H. Schulz wrote:
> Hello,
> 
> I /we /Vates would like to suggest some changes to the policy regarding the
> enrollment to the pre-disclosure mailing list of the Xen Security Team.
> 
> We have had some talks with the French national CERT who has a need to be the
> recipient of such a list. This national CERT -and in my experience other
> national CERTs such as the NIST for instance- is in constant contact with a
> large Xen userbase that is mostly made up of large parts of the public sector
> as well as critical infrastructure operators belonging to the private
> sector. For confidentiality reasons they cannot disclose who uses Xen and
> where it is used nor who may be using it internally or within the related
> national cybersecurity authority.
> 
> Because of that, their request may not be clear or matching the existing
> criteria for inclusion in the mailing list. National CERTs are trusted
> actors and have historically been among the very first entities to define,
> advocate for and put in practice the very notion of responsible
> disclosure. Much of the current practice of Open Source projects in that
> regard actually stems from CERTs. As part of their policies and processes
> regarding vulnerability disclosure, the notion of confidentiality and
> documented, waterfall-like processes of disclosure is play an integral
> part of
> how they handle informaton and publicity around vulnerability. As a result,
> national CERTs (and the French National CERT) do not spread undisclosed
> vulnerability without following established and agreed-upon processes. Such
> processes include, in our instance, the ones defined and followed by the Xen
> Security Team. Compliance with these are the first criteria to earn trust and
> respect from the ecosystem and the downstream users. You can see an example
> of their work here: https://www.cert.ssi.gouv.fr/
> 
> Part of the mission of the French National CERT is to work with
> critical infrastructure providers in securing their IT.
> This kind of expertise entails the securing of these information
> systems before any unforeseen incident as well as after the incident
> (incident remediation).
> None of the tasks involved imply the communication of zero-day types
> of vulnerabilities or vulnerabilities that are unpublished to the
> downstream users.

Would you mind shedding some light on the benefits of a national CERT
being in the know of unpublished vulnerabilities when they can't share
that knowledge with their downstreams, and hence their downstreams -
as long as they aren't themselves members of our predisclosure list -
would still be zero-dayed at the time of publication of such
vulnerabilities? Shouldn't their advice to their downstreams rather be
to direct them towards applying for pre-disclosure list membership?

As to the actual policy - how would you propose to categorize such
organizations, i.e. how would a new bullet point in the present

"
This includes:

    Public hosting providers;
    Large-scale organisational users of Xen;
    Vendors of Xen-based systems;
    Distributors of operating systems with Xen support.
"

look like in your opinion? This is pretty important imo, as it will
need to be understood who else might then become eligible.

Jan


