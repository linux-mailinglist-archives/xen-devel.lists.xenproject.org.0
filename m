Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8183B637371
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 09:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447815.704453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy7Ka-0007uy-VB; Thu, 24 Nov 2022 08:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447815.704453; Thu, 24 Nov 2022 08:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy7Ka-0007rY-SA; Thu, 24 Nov 2022 08:11:36 +0000
Received: by outflank-mailman (input) for mailman id 447815;
 Thu, 24 Nov 2022 08:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fS9R=3Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oy7KZ-0007rS-0u
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 08:11:35 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe16::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b98be55-6bcf-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 09:11:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7448.eurprd04.prod.outlook.com (2603:10a6:10:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Thu, 24 Nov
 2022 08:11:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 08:11:31 +0000
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
X-Inumbo-ID: 9b98be55-6bcf-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnfLTYQt578ehPwOEp/7aOTjC7jzv6mtq7KDhc//ya1qXudm0kQLKa2GwKMu1qdjQZPtWpgGhAUk/7/myd2vym5c4yoH6FbQomejXo44njgNUxGx7Bz9Bm9ZtvEOUS+9Nnk8W6Oe+B9vJH7hk3bh4CEdV5rCVAi/ZLyf33195C/mx6kUz2mchqCQ8QRdfDYdOL7StOxpYcT1Ms6dBg/3c1RizF+PmKlN4IOhXw4/L/ZjAItUxl6ERDI0L4ySe1+v3FqVriKHAd9H0lq8H3T/qDQcZqKzeWKqpxa/0fvwERlTt0Pj7aUnW9rcMhMntNCwPRuWolxAtFzUth0rJfyzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhxdN6InsoJfoG/kuVh3/LIepQoDMEyRerJqb65wWJc=;
 b=jfmLN31FrK0ZjBfCwiDaFdcpg9GA1oDOZhEwUF3FhbMfCi1A8Hy6h1UMh881cPabnJ3xgzIbqbAmQmOUPjYj5Ut1qxIlzz5Rloew6E3YopGh9rUx2CU4P4eHe56knTNjbgvkB45Cyd2lRlucIEbvAnpe6a/QFJtS1lOr8arytSE0MnU/uhIQt7NaO3uA7+N6Ojy36mw50/u2emefLZ7byY3TroF0C4HLWtOWwCdBhvwYd2NIUzqSsDd0qYnNrplTAiz6DfKPMuJSuHcw25TPrDrygCTntTyfkIQd+KGz1b45dZgoaZCBM7ye6W7SP1ZJvoRk2lLLjEqYa2cyIXkeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhxdN6InsoJfoG/kuVh3/LIepQoDMEyRerJqb65wWJc=;
 b=qzc7kswK1aZCJC3MCuXfWtwKsr/dwG7qfU9JRxkilMYhNrmBE+MLPXImmS7E9jJxqlM4reo5sCOk7SmJ3LGKpQ34leRGKxy8rXFxetZ6k9EUKYo6S0gh/2GL5pPgBp0fTfp21wditjyVDUoNzsHwbo1X4Nem200TTISxKv7I7MJ1OacT+o3Fp/HJcau03QEPi8jdwlnl8tRzgt7yom7lA7gJDRlhV367PQSfDqcECFMrBiWW1K++u7DWfouQsL+pTwp4ZfTtW+Rjcpl1PIa08MIjOmVzfklaepl3zkB4vPWzAREJc8XJ6VTlADnR7KnCrCvOWBIXE6h4CFtSOZEXSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <053527e1-f940-2e8a-c4fb-62d787c7c858@suse.com>
Date: Thu, 24 Nov 2022 09:11:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI +
 misc
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <Y37940yMRg2iX3IN@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y37940yMRg2iX3IN@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: eb478770-a272-4ba3-911f-08dacdf37ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RRrCY4Amr3uACoQcccwNSditStP+1oHz2EykeYnm43H0ATiXlLWbB913+bkcR4gf7BPKa5Kt65al9LA4Z0VcwqCRu7TxelC4oKzMya0djcj/wNcULBTfXQokjh/HBX3LbHb/l/nc9ObDcT2rLr1Gd2jrq9zpD7t4Mz8gUlQIgA1LoLsUu9dEPXXcfrDNmanTH4ZXD8HQQRYnYtEhPJWAs8jVcnrrDVV1MvM7uCKz9/XSAB6dV2n+uZkk+1+zVVqBR3gM9D+G1hFeu0j2I0Nludh8l83JpEuqoBOkb0LckGUUUH+Y66BFFAh5JyFfGpZnOTrMZroRh7IArdBvNVpX50omcIobY8KMu4UoKcEfR2FTNFn9SPOYhjuccKI827W5cjzUcMH1qFWcgjl1BHNf2xS05L36cgj9SqjGzwy7es/pWMmmQ4zUsdQNlIstfqj9LX+YhEuyb1ridJ11ZcpsngptleGH1BkqO1G5amccyFS8tkdNZxd4hT1vXr9hxLkBxAyb6b+3Y6Z8dupr6HOJjpDTPqyJXdIA/Mmi1FlVKxPIjgW+5kYhuMt6yXYIIEZYHVPKxlbdc4cR3zsyTaqpxv2WnuGMmtXT0Xs7iUY124FDT/lcQYM9bnywCQ/EYecT3VZve88TPXyhTGw1XXrRyCPTq1C7B4QDvBSO19phcYeDiAit4dI3ozOvGhCIFf0tX5gqsHc82p6ZFnOuIkW6BHmzfREnN1hSq6P4rACS6zc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199015)(31686004)(36756003)(31696002)(86362001)(26005)(38100700002)(5660300002)(6512007)(2906002)(54906003)(6916009)(186003)(4744005)(83380400001)(8936002)(6506007)(66556008)(53546011)(2616005)(478600001)(6486002)(41300700001)(8676002)(316002)(66476007)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk02QVBIZlhwSWlPNzlEMWwwMVVPYVZHWTlNU25zM3ZCZTk3a20xS3RGYi9z?=
 =?utf-8?B?MHBJUjY2VlBQbjU0NU05MWZRNXBiVHN5bHhsR2llbjExNmZpR0xSR2RqNzVG?=
 =?utf-8?B?VjM0SGVNT0NhMzh2Zk1PYnQ3azd2Syt1ZldxWXVidjhUcUZqTEdjckZ4OUJq?=
 =?utf-8?B?SlMwU0VKQTVlNm5Pd1daOUFuN2NxSUh0d0hzTUwyVk0weGZ1N0NmcmYwZ0Nx?=
 =?utf-8?B?L1hzbTdFejlKcS9iWkoycWdLWFc1b3VLNkxVMk51MUlMYkJVMUc0RHZMeFVR?=
 =?utf-8?B?L3FSTkEvTzZzNWZiZkEzbnRkZEx6MmhDbU1kVXpkMWtWL2plNXFId09GaE9J?=
 =?utf-8?B?ZXJoTTBDTEhDRnE2MkdPQ3RwdkFwRUxQK3B0MGZEN0p1a25uQnhGODl2REV2?=
 =?utf-8?B?Z2ZwRlhqRTh0UnF2SkdoWkRoZU9tcGdPWGVzaS9oSTZGY1Z3NjVQZkVlTm51?=
 =?utf-8?B?QzNrQ01NVzgxZXNJalZJY3hwZTNNeEhmSnNwMlN2QnZNK2ZYVWNPRGtxYnhN?=
 =?utf-8?B?TytNNm5vS3FsQmlLd2hreUZETGtkQmxiNk4vNjU4T2JqRW9mSjFFSjBZdE0r?=
 =?utf-8?B?QTdVMDg2OUxrV2FxZWwrS1NKSU1scUwzRmR2bGxFV1BNS0FNRGM0eGdzZUtr?=
 =?utf-8?B?OXNoQXBDSEtEVjM0VG1pVWsrSUVPTmk0TWhzbXRCNlBqdlJXNWxNNUlEZG9j?=
 =?utf-8?B?c3VVS2toY0FTRTNmNFNSNWxGS1pvRDNBTTRBYUNDRDFvdkh4Y3Rqbmp0WXUr?=
 =?utf-8?B?eEgrb241QnFPM0J2RldyTnhxTkRleG85N1dhYytOQVZ0Mm9SejNHVUt1Rlgv?=
 =?utf-8?B?aVVVMjNOVVRoRG45SklTOVozM3Y2QUtwYlFYOWtuZ1ZRb1IvMG9peDJONk1w?=
 =?utf-8?B?STQ3MExwMmE0NkFKNUFPcTd4VVJiNlNXdEhxM253WFlCcXVGYWlEY21VZEs3?=
 =?utf-8?B?cXRmWnZDS25vSHdlVFU1NFhlUURBTjVMUkdwekpuc05kZ0h1a3p4L2ZENG9s?=
 =?utf-8?B?STRuTDFyKzR0L0FRSVNWV21Vd0doNzhORm1icFN0OUd4U3FiMlRWaTBiK01i?=
 =?utf-8?B?WHVVd3o3MEcvanVHcDRnZ2NNNEZNdHk3bkVkT2JIREtpYTNrM0FGNE5pWHVI?=
 =?utf-8?B?WkZaVklMWGJnNkt3VUxEWmNVUHE3SUc2ZXQ0emdraks4cno3czk3c043RlBu?=
 =?utf-8?B?WVBOUnY5aHBkaXY0dHlxYXZiREx6UFVGUHh1Z1BxN21tZWgzSWZFQlkvaG54?=
 =?utf-8?B?OFZKN05aVEVIUnE3L3JWOXlLZ2JNdUxKUlE2dXZHSmxkOVozSWtqYXVjemdS?=
 =?utf-8?B?NWhlbWhQMXBSM2Zzb0VPcTlQQTJCa29RaEprOG11cnFWREcxWkhhOThUa1pO?=
 =?utf-8?B?dTludk1Wc0srU1ZpbWVVMnh4M0hzczNHNGFJL05tUFNGU3hEeWpEZzY4N2Vw?=
 =?utf-8?B?cUhxUDR6ZGlBZmZ2MTZmR0oyOVR1cndzOGY0MDl4UnE0VVUzelJ6aWRYYllJ?=
 =?utf-8?B?QUhvT013R3JwalpmQnA5WXhkTVZ6bTdxcSsvRWppeDdYTnJtVXdOQ256YVYv?=
 =?utf-8?B?V0lFNGhGK3pNbmV5VVIrUkNDUGZXNE1oa1lRWnVsdXNmWkxlekJ1bDNQRmlw?=
 =?utf-8?B?eHJPR2JubXl3L000MExJdkpaYll2bU9RWTN6b09LeEJCZVNIVjFlVVJqZ0c3?=
 =?utf-8?B?c1NrNld2bVFmbE5QTkxuSE01QjcvRERqazRGNUpmUEtTT25hWmptamM3ZUhH?=
 =?utf-8?B?M1IxYlUyU2JGaUtNa0RqcnVsSGxqYnVPN2JJUFh0RkRMNjJwSWFvMGlhMkxO?=
 =?utf-8?B?bHVNWXI0YVhHaUVoRWxwVDBlM0xqVGFINEcrMGR4QUFiZTlzc0tSR2UxVDQ5?=
 =?utf-8?B?Mmt1aFo1ZDQxdi9WRVVFRlFJeWtCSllSR0hzL2hSbFNHQ25naWt2ckNWL05K?=
 =?utf-8?B?Q25pOUpBN0VrbDVPQ0NzVXE0NmozZXpLTWhqMXBCZkVaVUtTMHI1ZFdXRU5Q?=
 =?utf-8?B?V003UkJyM3FEVXJ2QXhCcHdZR2x3UE5LQjhnL0lOU3drYVZSVTA0YkpPVks0?=
 =?utf-8?B?ZW1CdzlJRk5KT0hFS2d5Ui9URE1nTFNnZkg4dSsybUFlSVo3T3Y4M0YzQk5G?=
 =?utf-8?Q?gy4kE/2f55AhbwV+xa5Fto70+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb478770-a272-4ba3-911f-08dacdf37ea3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 08:11:31.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: He+iwet75v01WTXUVVf5RLENv9mNaETLnR68t9jxZ0afPZGbTyeZ64CNX3HnQgeq//d2VwSKYqXq1pxJPibBAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7448

On 24.11.2022 06:15, Marek Marczykowski-Górecki wrote:
> On Wed, Nov 23, 2022 at 04:45:19PM +0100, Roger Pau Monne wrote:
>> Marek: after this series using console= without the vga option should
>> result in Xen not attempting to touch the selected GOP mode and the
>> screen not getting cleared.
> 
> Thanks, this seems to work mostly fine.
> There is one message printed from setup_efi_pci(): ... ROM ... bytes at ...
> I'm not sure what to do about this one (although for Qubes, I can simply
> patch it out ;) ).

What's wrong with that message? It's not directly related to gfx devices
anyway; it merely happens to be the case that gfx devices are the most
common ones to come with a ROM.

Jan

