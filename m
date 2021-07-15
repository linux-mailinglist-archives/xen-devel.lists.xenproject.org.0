Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F83C98E4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 08:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156402.288572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3v82-0001Kz-73; Thu, 15 Jul 2021 06:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156402.288572; Thu, 15 Jul 2021 06:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3v82-0001HU-2f; Thu, 15 Jul 2021 06:45:50 +0000
Received: by outflank-mailman (input) for mailman id 156402;
 Thu, 15 Jul 2021 06:45:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3v80-0001G8-M6
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 06:45:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6923de91-de02-4084-9929-ef9144ffe0f4;
 Thu, 15 Jul 2021 06:45:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-di0ULdwZMjqtOhF6FkJelg-1; Thu, 15 Jul 2021 08:45:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 06:45:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 06:45:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Thu, 15 Jul 2021 06:45:42 +0000
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
X-Inumbo-ID: 6923de91-de02-4084-9929-ef9144ffe0f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626331546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1grGS3Ch3I7ps8Ccjbeaeob8QxHDWCTe9PRQyg1p5zA=;
	b=UP0M/Mp+lDLbzlpL5rbfixs7qKPfidrBwVwBxYtH5C17ameo2Ack+KPSsbiQadlrz6++AU
	TbQfgrdfdVhZgi9JAaosYdfafHPMZIMmaVx1G1G9XQSa/pg6u6Agemp8dk7dnDiVES6PPS
	vUb01C5vL3/4KwS5Bz4v3XYf7OOBd4g=
X-MC-Unique: di0ULdwZMjqtOhF6FkJelg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT1juY44ShMQeuLvdt+cVmEZkg1vjZRGV2NeNGJJ5cpqdHtpeFqITrhMu/v5mgG+tPGOczPncfqlNTKLGejwQgk1mDGl1dm1fecxJCz+fz/aqvxwYqPNkU3LvQP8Jq9s0PPB7gUnw1atgM/xKO7fgsZYYufh9xEAYfOO/0k0mX8jkFC7BfTQnOoZYgPenmzMHjYV6DgiGOxP+CS1yAA+d3cTyPQ5j8UQXvOY91wX60QHzKkSB4ToHftagiw3mNjxnZaiZPWCF7WiKM0UsawO3yCK/0zjGqOKIvVCCHUk17hMCI/MWYC8Mw6G9BKotCsHsNdN0KS36OVSjtXudRM0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1grGS3Ch3I7ps8Ccjbeaeob8QxHDWCTe9PRQyg1p5zA=;
 b=IcBWAeMrVJugCYQr9h6Te00x1mtWEQTOG0pg0L2T7EfutVdwH0LbsHmqLiUDsPBLHXlHQFpa2rcxgXGCZwqX+qCXeKKiOpo69mlZaXPau6UsK3N5p/7qhoa3YG4fE8hDh4EzLZyZRaNzcKcw8s/n6pkeTQcDdtmPYPwWP+0YYe/gfpwLDows5RSz4x8BUDwAduE4tsKpSd6x62A6n/Tq5ThB8ISYG84xICQ4SYQk7v5hfkRyw1VZMmTaJ3CdjGiTHI4kFWwnhsHwyb6pScTuGZ3M4Qib2wM/uiPwveGUQ0Yd6UwK+ekGMc8xluMuRg6bw6ukM6R3mAAjejuAQAQCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/4] build: use common stubs for debugger_trap_* functions
 if !CONFIG_CRASH_DEBUG
To: Bob Eshleman <bobbyeshleman@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
 <2fc1a1416d37b5eed0ebfdeff8bb9dd61bc7acc7.1626136452.git.bobby.eshleman@gmail.com>
 <7468d092-42c5-34a1-74ec-7500e1bc7bf1@suse.com>
 <b6124fdd-b8da-b924-bf6f-1df6456f5926@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e20ff2cd-0f41-a87f-c10e-44e06e2c0d06@suse.com>
Date: Thu, 15 Jul 2021 08:45:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b6124fdd-b8da-b924-bf6f-1df6456f5926@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22f12569-0645-4b9c-12d9-08d9475c2b0d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686464D5232891887B4D7EF2B3129@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tZlbOXjeTntTYueIu+c6tjmObNYDs/dX320/sm2qfFsnEm3U63Gc9W0xG6L4tP3+zEFD6sCihQWyWOKeR/EZsTB/IX7VHWzytOogELL8dsfaOXuVDBsjacNjNauFh578M9Dsk1LS3zckOBkrXe1CzIK/Ll7yIZ6nKJgq0CzkSL62zn+WVUXOJd+7foaasi2DZB+JDGQsZcYL+2GmcTC87w35I5V0q6JxCh9V2zqEkIal8LML6yPraLMe+MVHxa8sJbs0ljo7P+UXle3w3u2Pie3AR/onWRToqeP675E/B6zYxmm57Ncl3fzSNPY3VxmmN3SSPxOYzx/I5w4znAGxxqnPbdEXwMRCVPr9tF2v1Ps7EgWm2QxDbghLfJEB0ZEpShceqyLtQ3pn9EUIgpseNTbJIM/GcPL3mw26rRh/wqYbasalTZq5vMdKbR/BQ6MIEnt2U2TNPp275/p7JYvdMVkLC+99nccsW6lRwMgyzX38JMy0gHCE8hG3g0/m7BTJWQqfUmhUoYdVThwM/nYCsRvaSjyNHkqx8rnIh19lgiZEecFcnuRJnN/3RXt6BDZ2RkyXh9uKbOq8k8m+cfkhm6QNnDCrNfO16wy72EtIr/hyHgm0elqVrsweIgJtDkMQEwfCRVFx6fohfnqnG6k4lq7xmZJd6HJoUpgrUT8xxyXyycx2UOWrVdbAne+jQK64kePQjm4XfzgepWxeRar+i+ZSI1E8W6ZIraVb7b4MLUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(53546011)(54906003)(86362001)(956004)(4326008)(6486002)(36756003)(2616005)(2906002)(7416002)(26005)(66946007)(31686004)(16576012)(478600001)(8936002)(38100700002)(66556008)(5660300002)(8676002)(316002)(186003)(110136005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWxtQnFPV2NhbzY5MERFaWNHKzN2L3hMOTVNOFF3OW5GYmp4ME51QWliRk5q?=
 =?utf-8?B?QzdWZElWdEdyOFZPaW54aEQrZWN0WDhGNjF4MVJyVlhOTXZXbnVITEtSeWFB?=
 =?utf-8?B?dkVocUZqSG9qdjhPRFo1NTJSaHNWOWVoTEhZWnVWT1ZpQW80UE1VTDRLbjV1?=
 =?utf-8?B?eXBSVU93L3Y4VFBTNTlzRFVBVnFVVWs4SHhuTVdsRXBlWkRHL3VaR2FXK1Bj?=
 =?utf-8?B?bjFqVU5aT3FjYitmV0hrSkdhd1FUS0IvT3pZVHFvUU8yS2s3NHVpYjhqVDdD?=
 =?utf-8?B?R1Y3L0p5Vml6NVRMNFlMRG5YS0tucVREcWxPbjRHTFQvVXJhQTJzUnZsdkF6?=
 =?utf-8?B?eTROMXZzazdQSzlkaENEdTBMYnhXUFI2N0tNaXgyZG12ZkZKcEZhTksyUWZJ?=
 =?utf-8?B?ODFLQmFGZS9KM3Q5Z0Rtc0QxSklqVHdEcldmUm1LS09HQjVreStFcjhNaHU2?=
 =?utf-8?B?YU12bjQ2L0VpTkpJTkIraUFna1ZaZDV1SHpiZ1lwK050WjF3RmRZR3NKYUwr?=
 =?utf-8?B?ZDRZQmxEK3VxWXlwODBucnNudVNSYmhNbE16Y2hraG1QMlpTdnQzeEhIM2Zi?=
 =?utf-8?B?RU9nOGwzK1ozQ0lGRmdHUmlYTmNzZEd1S285d0FDRGNxTTNEU094SUd5VWd5?=
 =?utf-8?B?aEdEL1dWQmlieVpkN3QwdFQ0eXB0S1RRZStjdFhialVKWFUvbFNyNE1KRHhM?=
 =?utf-8?B?OVM1Qk9tbkdSQ0tDeExLbU94NzFHZVpWYlEySWlYTUVYS0pnazJGcWYwK0N0?=
 =?utf-8?B?QVU4R3BXc2NjOGpsZk5WMjFJUlR3UXlmYUtWdkw5bFRwOHgrWWFCRVhQN0Z4?=
 =?utf-8?B?T3g2SVUzUFZzV3Q0V1RCWmFnUGk4Wk9BVC9lRjNvcGNVTCtSM0QxcXdMb25z?=
 =?utf-8?B?MVJobjFqZkF1N25ZUENCcTMwOVFRMWs4NlNrM3psVkZkOEhpd3JncTQxdFVY?=
 =?utf-8?B?cE5YZkM5SWpSNTJ0YTdQc1g2NGR4U1RZWGtvTWtTVjVYTDVNOU50SWtGWFZJ?=
 =?utf-8?B?blpTQXZQbWJreFRoRVBPYmJ4eUlqMlpQekpWS2N3NTRQc2hyNzVlbWlVMUsw?=
 =?utf-8?B?dXBkN0lrRFRBekovYnpqU0duNmdPWXlVYjBRREhReFhHQUNudWdlZU5kMzgz?=
 =?utf-8?B?L0dMVUlacWEvbEFPa3BBelZKaDA4UmNnOEs5eUMyUEttd0ZxQnRUcSs3THJw?=
 =?utf-8?B?amwxZEpVRTRzYmNpUi9pRkxMM1ZiWldkYkYrbzdEUHRpczFQaDFWcTVSN0pt?=
 =?utf-8?B?ZXQwM2FRb2pPcStqZ2dOYjA3K0VmbVpYdnRUdUdSK3BlSzdnM3FxSFdKeTgy?=
 =?utf-8?B?amcwMnprb3JWZDNTSkhadUhBbks1dHJpVFNublo2cGVZS0xlNmlIbmQ1YUVn?=
 =?utf-8?B?T1NKUjE0NWtndWtrVE1HQnhSZ2dDVFBSaFdydjBqZm9sN1Z4cE93UTQvRXps?=
 =?utf-8?B?Q1lqcnhoMTRZcHNGMlNldTZZUXRocHczQzhGS1RmdlVPR1BhbExCcytVeEJX?=
 =?utf-8?B?dkpyUmswc05xQjd2ZC9JblRQcmlRdkd2cXRFZlhBOHNMQWs3Q09xeEVmYWFz?=
 =?utf-8?B?cWRQYzJDQitaRktGdlQ1SnNiZ3UwaEVtc2pzU3lVRldXanRUU29CcjBGOHNL?=
 =?utf-8?B?Y2l5ZlU3VC9LUDZyMXVaSXJRZk1MZWIvSmxPSXk2Z0RIaXgrZlRIRkpKaUxa?=
 =?utf-8?B?TUIvWFdMMk8xREREYkFrTmM5SFdXK2krUVg0TWpBSnhOQXhZTWhuUy8rMzB3?=
 =?utf-8?Q?PdpXFpoBYpHcT/rXgQYOnSFnhtVx4K5OmaZZ9MC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f12569-0645-4b9c-12d9-08d9475c2b0d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 06:45:43.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kl/Ic4t8KEKIMms1WWICuT/XjAnPEXI6k7XSB3nhvSSVJ4ecCc8ES9AVtxKZhHkU59rp2Mnpj1uyTjrubREnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 14.07.2021 23:03, Bob Eshleman wrote:
> On 7/14/21 2:34 AM, Jan Beulich wrote:
>>> +static inline bool debugger_trap_fatal(
>>> +    unsigned int vector, const struct cpu_user_regs *regs)
>>
>> I'm afraid the concept of a vector may not be arch-independent.
>>
> 
> The only way I can imagine it not being arch-independent
> is if it is thought of as a trap number or id, instead of
> implying an entry in a vectored trap table.  I don't
> really understand this subsystem, so I'm probably missing
> context.
> 
> Are you suggesting a rename or a different approach entirely?

I'm suggesting that we shouldn't be claiming something to be an
abstraction when it isn't really. There's exactly one use of
debugger_trap_fatal() outside x86/ after patch 1 of this series:

static void do_debugger_trap_fatal(struct cpu_user_regs *regs)
{
    (void)debugger_trap_fatal(0xf001, regs);
    ...
}

That's very certainly _not_ arch-independent. Hence I'd rather
see some #ifdef-ary added there and the function remaining
x86-specific for the time being, i.e. until such a time when
someone might come forward with a suitable abstraction. Perhaps
(as an alternative to #ifdef-ary) the '%' debug key should be
x86-specific altogether, and perhaps its setup and handling
could be moved into the new debugger.c?

Jan


