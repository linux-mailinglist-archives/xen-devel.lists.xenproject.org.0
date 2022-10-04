Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650C5F3DA8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 10:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415214.659730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofcwr-0005GB-OF; Tue, 04 Oct 2022 08:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415214.659730; Tue, 04 Oct 2022 08:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofcwr-0005D9-L5; Tue, 04 Oct 2022 08:06:41 +0000
Received: by outflank-mailman (input) for mailman id 415214;
 Tue, 04 Oct 2022 08:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofcwq-00054y-19
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 08:06:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78edb5e3-43bb-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 10:06:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Tue, 4 Oct
 2022 08:06:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 08:06:37 +0000
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
X-Inumbo-ID: 78edb5e3-43bb-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4Tz6oIQjKEkXa8EFpEYNvOkaBrkZeuv6QV13+tQvaa+HbL6blEDGC7/j3IiNmSLZ5CePZ6fG2eG+huSSQLRUNnJW4tl4LgmBjKySUFNE3n7vDIdMQGqaMxGUiuQpyEn2lErArgmTwUh9ulfCc2dH1NuRJAfMoccVJN7xuM3Lqx5v5oov1+INAxywjqzsw8eoLc05YkcBosd7QzBD/J8zfx2VnfUlC3j6Gb4ESn6J8iifluh0j9u5DVtXUVx2c2+YFNjDlMfUy/jdHSspO8sFoLkH8gnEYpEMV31rLU70M2FhMvhcekSc43P04XV3bsDmEX5YDHwJcae3NIJY63XDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg14Yl7CperX8f+G+08CTIJV6PIA0BhTtfeWM2Vvrao=;
 b=chz0vfRgkxKB1Y74XpCwyCaiYi2bm9E0djoLd0wW4xm5a8jJRTSb4aLhlW8XS5MHabNPUHgjmzZmHQ1Qu5s+eBMKKQ9jzHIEPvsd7F5n/ZGMvtAZhOQtbSkOS4OvauMomMDmv8LAlqy/3VqjoTIUgTzF0Ot1Evr7lQi0RRRMWIUFXPhP3LKe32KHanfWXGf1vlNc/WdLctuXh9beMMKmzT5lybZ+3t5rNAYMV8k83wE5IW1btgZQS/LME0NV0Tgb0GrTUeuFUZBuaQuP/BNiub7iuxCNMdmnJYAkBep9ZUTSYqDeErv7OdOiTDYW/D/C9PXUjkIGv9BSH24j9xw5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg14Yl7CperX8f+G+08CTIJV6PIA0BhTtfeWM2Vvrao=;
 b=s9N4bQ6vTu78EVI7D4Hl5yvX2qCyLtwuEOImPRcEsdjwu/sNOPPXUspxdlVR5uAgU61B/cFH4dseIoNRxDPKH9n3/UYojSpaUfb9Be/u2xxwth9yTXPTqkHXhQ4EjqeG/zgNH13OFRSi9lbOoo8kOzDbFlbT0yoWDx2iVQARB044ETSgw32KSMpLOTdWMXyXGoehEj8C6sfRYhBXO7tjehUKi83csEJOem6d50t2V6sHIPCxgoSjHK0lLqbXKsjt2Z47Be6o0HCDDtCIYs4125zMLESvBOZ4teG3N2FS/hcPDPNd1o+3uhfjOj1sxnZmeKGSLFYiKeOo5AdQ8luh9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
Date: Tue, 4 Oct 2022 10:06:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0187.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b5575a-85f3-4ce8-544c-08daa5df5b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+Yo8CpHbjFzffRBpbvzyfuM/KI38eCFLtORczl3QnIG5BnqGp7VMrr9dhqErhhbHIsBZQE9h4tz0qxxPHC5M6bfKXDGZg9X3D/uq9KUgY7MdTr3Tx9+rNSf1sV6+tv4GO+augwfR1hgQ3w/6MuBJFTFuJplBQPSzOhwZWWNhabYvmSJMpssmqF9QHX7u9B80ZXIJwBhUNMPl9pC4QLkTzsWYIabXPoN08q7E0r1HcHu/x45Fkqxo2+YnRPJkIOUrK4bW4lgKZ/qfPBSjAlz47OS/E6j/YYJrzrA+I/kodzNfmpmui8sr9Npt0AW5JK0dTvAugd9zWURLDVotB+eUSVZUE7K07MhSeyOhF8257DbsU/poT6ucWMcZ0rkiXM7DiTkpx0ELL0kJZRoPZi2GQE6WPyAskivDw+pM6qBqLqZESxMSuGUeVNxMqxlmHXtPjPvIkSs++n243+kLGFsuHaIwsmkbUhr17sjb/pFYIHPLx2IcFB3OjDOr81t87vVRQ0QpRK59sm/4XuM6I+ozg7n6jE5NcUChOtJOqUFREzc22D2UcDU52l3o9pRRc9ve15zKOqxP4fDJD1b2Cqi5Izg0V4yc1pFHdLNfn2FX3qGX9h2g5TsRCDCWXPyQuOqXUkIZhi59Ki8H5IODRo4wg2qCmm4titVEG/aP3EwlQfEHzjPvpMLJYKWo9KpccE8Mqu9CK3FtmYF11qiRcaXomnaokPiZDzoOenhrrH0t+eLMMle7iuBWLSFFoLuS4UvczrsImi+dVxPP/gjTi2njbrKTYsxar6IHzRVBatJKm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199015)(38100700002)(66556008)(83380400001)(6512007)(26005)(4326008)(316002)(54906003)(36756003)(2616005)(2906002)(31696002)(6916009)(5660300002)(186003)(4744005)(66476007)(66946007)(8676002)(41300700001)(86362001)(31686004)(6486002)(478600001)(8936002)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rkc1RktUbmE3RUllUEpxbTVMY0wwc0dYYStFQVVoVUprb3NJLytBRnpCMkQw?=
 =?utf-8?B?RG84Z1hQWGI0SFAzOHdNZ0p2VGt2TDVtY21EQnluL3hBU3ZSUUp0dEJVSUNH?=
 =?utf-8?B?ZGlleFo5eklFMkxFUzYyNmFmODZWSnhYNzAvSTZQK0VWSGZjSFJNeTZOYyta?=
 =?utf-8?B?MDNzUEl3RTlYcDdNdS84V0JranNsWkR4RDBDQXRZWTFLbzdlSzFGOVBJWXFT?=
 =?utf-8?B?b0g4ODBrNzJveVZOdlNLUmJmK0VTeUxONGdkL2tEZC83TDBiYWgzWmx2N0VL?=
 =?utf-8?B?OUVUSzU2elZFcnpaZy9sSjlPazVCQzVMN256YWJ3d0VDdGM5R1dnNmhpcXI4?=
 =?utf-8?B?eGp6VEJobHloZE52TEFOZXprK2RNRmg5YklhZXJGWGIvWTVYYXZiaGw3SzNU?=
 =?utf-8?B?cURoVFpaTkdsbGtUWmpuZ1FOQXZkNmZ0M0ZQL1ZOVklxNHVqbVdYcHU2N2dQ?=
 =?utf-8?B?RCthUEplMi9RQWVJb0kwTldWMzgxTXJ6MjErMTZLbzJRS0F0bGduY1pXYktO?=
 =?utf-8?B?TEpmODZVcmNqVCtnLzVrSndaTW1rZ1JpZHgzczAwbmt3S3c0NjRnU3ZrcDIr?=
 =?utf-8?B?ODJxK3VJM2ZjT0w5OE5jblpnMkhlUFp4Qm0xT3A1ZmtzQ1cvNWJLVCtLMEhQ?=
 =?utf-8?B?bThoUE9qK2RHWDNvZ09LaERCajFBWEJEZ1JPTll2NHkwTGptZS8vc0g1VzRw?=
 =?utf-8?B?WkMzSE1KYWVyTjdGbDkyWGVVU2xrZ3hZeFhJbjZHTXp4R1c1a3Mvbk9oSEZm?=
 =?utf-8?B?c0NMbjhsb3RCdGJTRHN0SHJEYnZxTExSTS9RWG1ocWtXdjlVVi80UzhRVFZK?=
 =?utf-8?B?S0c2T1ZTQnhsbHZwVWVLdW9Hd1JBRlhwdEJzbk9EUlRIejNHazdqQWVIejUz?=
 =?utf-8?B?T1NXMEtzMlN6YXUraVdtYkhTZmQ1M2ZmakhXMWJjY3V6aERmY1B0Y2FlZlRj?=
 =?utf-8?B?NU1QRWxteVdMRUxUU2JVa2tiQTVaK3hUYXRGb3JwWTd0UmlQazRrakVDK1hU?=
 =?utf-8?B?RnVobUZWMUVaU2RzUWJKQ214bWE4NVlBNEs1WU5CQ24xa0x2dFM3Y3ExNU1n?=
 =?utf-8?B?bWNwYkRpVXJtczN2eE8wMlJBUTFZdk8rS0JkdVhkalBwMjJHYWU0c2pLSXd0?=
 =?utf-8?B?NVhTQko1dmJQb2psQzBoazJZbzlJdlBWS0JBNENjQ1ljWnlGWTBoRWM4SElE?=
 =?utf-8?B?VHU1U0FSdXVRMlo4MjBhTkxkTHZhcUNFSGsxeklYdXVaekcwUmpsM2NhNGtR?=
 =?utf-8?B?S3JQZXlJZEdUbHFtSVdVTDZvek1SZW5RdngxVkF5aEtqMG1FdmNxV0pXQ3cx?=
 =?utf-8?B?ZXhOUHQrOFdLYm1oK2g5K2lZSzRTcWp4alAxdVR3SXVDcnNqWnRKcm82cXdL?=
 =?utf-8?B?ZTdxdEtMNy8yK29SUzk5NG1aWHlWZ1VVN3Rhb28vakJYR1VUWVo5dW9TM3ZR?=
 =?utf-8?B?N3NJTTFLaHBURUtvYmlGK3ZWYmlUTjYxdjFKWnZCclF2Mm83N1RzbWdkRWRt?=
 =?utf-8?B?cm1oOEtjQXVGbHpiNHJxeHgxTkxZZEw5RC9rV1pUOGZiNCtuYUdpVWFrblFq?=
 =?utf-8?B?V1ZIWXFaUVVQdDRGSlY5OHJpaGFWclBaaHJmSHdhR0NXSVhBWWlibzdNWXow?=
 =?utf-8?B?MUhkSEdCMVl6d0NzUlpBbXhzMFVhejcreTRZaEhZdjdzVVdpMUZ0Uk9MWG9n?=
 =?utf-8?B?WEhzRkMxVWREYzhuZFFIYVF5cEI2SFNIRWg3eDFiUGFNaFVKSVo4dHZFbmF5?=
 =?utf-8?B?a3Z3d1M4a2pjMmI3ODFLOXBjWm9PMWswQUo5ZDM3UGlKdGlBT1Jyb3Z0b1Ns?=
 =?utf-8?B?UFBiL1dXYWdrMTdoQjJzVGowN0QxNFd5SDJPdklzbWR6ZE1tQ1p2RFBIdnRG?=
 =?utf-8?B?emdIREtlRDdXdEVheStMYWY1ejIrYTZ5WkVodkFZSW9Qd01sbDI4SEFzOHM1?=
 =?utf-8?B?SURrSkNiMHNPT0JtZnM0UEVRcmEzajNpN0hBS3BNemY3WUZCTHBvQ3RmelRL?=
 =?utf-8?B?SFRwSWczU3haSFlQMW1QbCt6UE1GSE1wWXp0M21QaVlwdVBPWWI2bWpaSm03?=
 =?utf-8?B?TkJYbWlKcHRHNjBCeVZ2dS96R3YyT2VqWHZiSkR3YzNoa0dGTTBsRVBwYWh0?=
 =?utf-8?Q?3EMowpwmqmP5R787ULYsyrdCr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b5575a-85f3-4ce8-544c-08daa5df5b04
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 08:06:37.3864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coMwW3dEdc1Z7hfrbJiA4FYjdUGMuIdDjsNKZERtwS+1ZfGw99J+xyZAM4gDgSviJ+FDd5BjV/SnycNw70BvDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626

On 30.09.2022 16:28, Roger Pau Monné wrote:
> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>> higher priority than the type of the range. To avoid accessing memory at
>> runtime which was re-used for other purposes, make
>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>> E820_ACPI memory there and hence that type's handling can be left alone.
> 
> What about dom0?  Should it be translated to E820_RESERVED so that
> dom0 doesn't try to use it either?

I'm afraid I don't understand the questions. Not the least because I
think "it" can't really mean "dom0" from the earlier sentence.

Jan

>  I guess using E820_RESERVED
> could also confuse dom0 about ACPI data placement.
> 
> Thanks, Roger.


