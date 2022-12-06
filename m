Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3A6441D1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454641.712165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vlu-0002Di-99; Tue, 06 Dec 2022 11:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454641.712165; Tue, 06 Dec 2022 11:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vlu-0002BX-5w; Tue, 06 Dec 2022 11:05:58 +0000
Received: by outflank-mailman (input) for mailman id 454641;
 Tue, 06 Dec 2022 11:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2Vlt-0002BR-8Q
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:05:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4de62b9-7555-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:05:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9247.eurprd04.prod.outlook.com (2603:10a6:102:2a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 11:05:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:05:26 +0000
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
X-Inumbo-ID: f4de62b9-7555-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiM9AUSezCgoNhmEJ6W1EcllcCFnsersspIWQFQpnsF+KNGevRjz2bDBy6NchSVw4xy9IAWaSRB9eWFsvZSvCFawfMFlmuWKV2xmiCsWVZ6Pap9CxLaKJsIyDh2+ecmk5gWPfVqd5YxwYkvxXG93Iqy1Digc+Xa4lCbAOpw7TMyEYAj2k9EmyDl/Wg7s3A8D6EXK+uqf2FhNVUdofGlxK2rk1gmEAQIoJF9ko0BX6M4zrbEIw3xef7uDh8E085j8sw9bXpqjIBb5fyB0Mb59p7hR0hB0do2tAtxXVSxFblRDyPTY5lzr2mJ67gF3L9PxlRfQAMhJ9Vg1UwKaYdH2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T327dELQqzTVBqY4x4ou4K3D838C5HStDz5tDe6GBOU=;
 b=atrFXKDfRjNAtgayDTrG6I/yUK5FAZR3Lkgrxt2nEXnNh5sqKqah++tLXs7AutAwZbNPrttGewVj6yVFcIAvZHCkc0wv4NR0Atham5pcpVlKJOafhDAEgk/sCa51noy+PtscGTTM7plKCoRrCHyQ6+iawPkj7v1muScXcNA3CQSqRL1i8jgtPk6KV5vKZaWvX0c6S90e0NxIF9QZg0vIBartJEW0phMlzlRt1oDqcz5nJ4crvkIsZAQ16VOycsaDgHlilIjPykSmUA8vU3Ot1ouL1bowuGYl4WRtR0pkhj2JHAanQD2rlBA80tT1GynMFuPhzoNn8Df2AAEa3Ht++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T327dELQqzTVBqY4x4ou4K3D838C5HStDz5tDe6GBOU=;
 b=nbaiDxvEyZVrrFisxWlbBGUFWuVEsd69rxYUG4x7yFZczfyJwun0FyH6RjMK7mBg6lAbCtkwVxEuP7PskbL3zUuEIPqrzK4iyuELln8ELQEfXH8ijVRsDYkCFGJO92QwUqeCbEge9nq3YIp6uouBWCo69MM6+72HWOfyUbkuq//9s9b0RpdWP7gAFQf+P9rntBqmpjgWZ12POCPIr/BM0U6nl3UFvyY9cEaGrsSkNQ6+LckdjXlg93CClTqxLWRnURmzKeX9P0ILCF4HE3TONMVH2F1fzgg8mTugEnWDMwHhDwEgNU3L3nFHk4KqS1WpO6q0lu1tAXK1Bn9oA3GJuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78d4164c-adef-cedc-fb83-803150f64d11@suse.com>
Date: Tue, 6 Dec 2022 12:05:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/8] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <c70f4c4584cf28ff1da8f56e08d61ad0c406a4fd.1670300446.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c70f4c4584cf28ff1da8f56e08d61ad0c406a4fd.1670300446.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: 1881acdd-5d80-4af7-93a4-08dad779c7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ad/dHvjYTWLq8WQyf1vz3R42lXXaM6cFnmtHDeKb9KfwAKhSb9h+MBtIiTPEefM2bBjgeV7ADmV4MX698CAanUBZXQGtsTwvQ8V0hHwFM/dcGJUpyS3Cf7muxlo873lM1930ObAELcQB99mlRKctmRGaSmJ0hB89Cgkmb/IiPHyySX8EBUg5Nkyy2HZGwJF98ncAH3to1Pcts+tur+1c0H0w8bvW4iFeRXasJW6ZfukgS0GlPqG8uL5lLqQudjxgOJtAHxw+F9cKzbhidHOgIy2F34nmyJ2M+JGy/dkAgkySeBv5dKewtxqdqhK9iXafWLnAXsBrvDQAAU3OY9R8Ki99eaYf1N5LzFdw6Go34QhftkWTfIzb+IFqAmMIOtqpUWlIp2RL4DwXqglA3AWH268vgILGScvHrw8mSAtGaI6TlNZRbwyWRoJ+6y5zTto4oVXIaPgTMApspQd/i6fVktiiIrU/9EqAW9yvq9SwPPyRQMN7/b/LpIXvhbPFz2AD/MAx5TDMbXZOWgde57mwLj5eHS4/nlPVnThpbe1DU6/XPuLb9ik4DvBzOGE77oJGxlFo+rKIxgqqcfYAkaB0Ku/yJHoZb8pDvJmfaITmUyWSKdnj8jnEHJQogNT0GaMbN0OD2sjwJB438pEfSA6Vxo2Kjj5Zw1yLddJcP/djkxe5qVZkumZxvn2CDmHhSFx5ZdtDKUfIllp7HeczAUyQTlYN262S+cFlfPwBH0VViJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199015)(478600001)(66946007)(53546011)(6486002)(31686004)(6506007)(6512007)(4326008)(6916009)(316002)(54906003)(31696002)(86362001)(66476007)(8676002)(66556008)(26005)(2906002)(186003)(41300700001)(38100700002)(2616005)(8936002)(83380400001)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHU3bFV6U1BEd0wrajB5OVFFcXBoSmhEY2dzdDVvZGlveW5aUWJldTZkVlF5?=
 =?utf-8?B?U0pMdlNoaFdrZStlN3RiWDVSdFBrYlY0SkZERGc2Y2QrSFNSWGppMjJScWJj?=
 =?utf-8?B?TzlpTDVFbndlNjEzY0NBcjlXZW93YS9hOWxMdHRrNUpoR0hFdHhGQ0tZeHR4?=
 =?utf-8?B?blJMaDZqME9KVFh4bld0N2lhSHZ2SFpzUkZoUURtQzQvRzdsM3o0ZWlOTUk1?=
 =?utf-8?B?WTcyRFp6YVR0emNFZnhpQU1xUG4ybnpKdVJKMjZYbmtoOWNJLzh0YmlHNnVD?=
 =?utf-8?B?UDhNNHEzdGd1NHEvQ2xwdnJoNDFFSHdrbzljTWlvSzlIOXRoN1dvNDZabEQx?=
 =?utf-8?B?V0t5bGNLMFBhdmNhdXpsY251b291TGpnUVhoM0dTUEVrTWQ4RFlvTUpLa2lp?=
 =?utf-8?B?Vm5nQnNuN1NrSU1vYVJtelc5N0ordldVc2dDWkZtdW11NERxQk9LTHNkVG4v?=
 =?utf-8?B?Zm0vM2ZqZDk1THIrdWZUa1FTd3B5VmdiNjFDbUJyWWJjMmlGQUd0YVAvbFlh?=
 =?utf-8?B?MExaWThOcmNRUFBHc3U0b2JMSzFQbWdTc2Y3VlB0YnEzbHhvbkRPZ2Y5TlpM?=
 =?utf-8?B?VFhsQnpXbjlZeENRejFFNHk1K2tnM202c0ltS3hZQ2ttQTNYenVtREM0dS83?=
 =?utf-8?B?ZW5vSGtnT1M4RXZJdG9pdnNWNjBwcURneUtQWXFmeUFxM2hvKzRCbnlOK2xB?=
 =?utf-8?B?U3hpbEFoNzFPMnFlR29ZbGhweTkvRUlSeUlaOVVtano3akdZYUNBMzFPT2dm?=
 =?utf-8?B?OEM2aHk2VlVHVUloeTZ3SFZLMjJ1ajF4TktYaVVJV0Q5V20wTVZhUE10ZFl1?=
 =?utf-8?B?VXA4eWF2anQzeUVTNWpsMG5PY0x3QmFPblhGeXJZK0R0SHRhaTJ0amhFTjk0?=
 =?utf-8?B?RDVBd0t4aHdqc1FneUVZWGFkNGhlM0ZPeHBuZGtrbXRvcDRPVGV4OVptU1My?=
 =?utf-8?B?QXo1ekNNOGVkRTk5NGZNSzNVeDV3SkRDdmNXQVFPL1BJa1VQMzY2dG0vajln?=
 =?utf-8?B?U1pXWHJhZy92TnRLU0RzQ0I3bU9vVkkvMFRiRDZ4ZUhtblFoejJwZi9DcHlt?=
 =?utf-8?B?VVpjK0U3M2JEdi9DNGRGcHhneWhkRWZ3a0t4S2dFdm8yc0xucEV5aFdtNHhi?=
 =?utf-8?B?SEVlMFc0dzc2ZEpRY0s0dVc0MFNkVzFFcVRwVlZQZ1NjalpHZ0c4aUVCeG5w?=
 =?utf-8?B?TFdSZVMwWjVTTzBRWThvR0s1TDQ4YlNRbkRpMnpBWk94VkFjTDQ0UExINks0?=
 =?utf-8?B?ejlpeUNQNmU3bzRlK2VuRytHM3ljZHR3a25HNExvN3Q2VVJpdTA3SHBPdS9n?=
 =?utf-8?B?MVoyclJJTzhlU25ZSGdicXFEZUJJSitJdnRvUVhkRzA2eUE3cWcyRlFyd29C?=
 =?utf-8?B?N0VjaHJSUC84Mnh0TGE1OU9zVFhZYUxOUk1xUSs2cDU2SXNVMmFjM0hNU1lC?=
 =?utf-8?B?MmdZTHBRdlBxK3pJWHB1cU1PR0JadmRJUnoxNHZyMUFEdVZadjI2cXVwcEJM?=
 =?utf-8?B?eUVPeVYwdEtXUEQzWmNOVEh1anJvcXVVa0YwTWREcmk4aDdUd21PQmZzWHJY?=
 =?utf-8?B?OE9LN0pCa2N1eEJCUWwrdkxya1UzTEJxaVNSVUxjN0dqQ1pkNTUydkZIbERX?=
 =?utf-8?B?VlRmV1djVFdoRWZ2SGthdHg2aEhqOEd6L1ZlS1JUeC9jcFJTYWZDN3hDUlU3?=
 =?utf-8?B?WHhiNTZiS3hETVFvZHcwODBPVUhlZUxkcVpUbmJKODMzbzVSUWFIc01oZTk1?=
 =?utf-8?B?Zk9KbFJDSXc0ZFJDVEVsa0tKWHRMTW0xQTMraTVpeUU5MXhRZkh6MXJQYzRU?=
 =?utf-8?B?THBYa2NRVGdWWHNpUUlzbVBTTGFSaVIrNStDNHNnUU5qOG1zMHVKdk1mZmZ4?=
 =?utf-8?B?TmJpYWJOWGdMckl6dFhGemUwOGRoUkw0T2tHOWlZT01RakE4NFVmMXBaNk5h?=
 =?utf-8?B?c1M4YXJ5T2d3WXRGdWs1eGhmTWtxcVhPNGhkNUIwLzdxUmFZZmcyNkZmRXd3?=
 =?utf-8?B?N3crWHB3clNHdytBby9QWklVaHFJMEd1aU1EQTBic2R2TWk0aEhyMG0yK00w?=
 =?utf-8?B?Wi9XVmhoVjNJM0xaeXpaNTFCdVBFMzZFb0NIeUgwL3cwUHFDMUU0NzYyUXdD?=
 =?utf-8?Q?DaoSpjHVuvrB5ShpZkczJdJWE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1881acdd-5d80-4af7-93a4-08dad779c7b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:05:26.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sm+pASVVjL0MkyzfSsW5ASAjf4BFcN9vXFxab2vIW+Priamo7ZfId8wI3Yp6gNmKRfzK/Xdv1NZai+qfQNvGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9247

On 06.12.2022 05:33, Demi Marie Obenour wrote:
> This still hard-codes the assumption that the two spare values are
> mapped to UC.  Removing this assumption would require a more complex
> patch.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

You eliminate some assumptions at the price of introducing new ones.
With that I consider the description insufficient; really there isn't
any description here, just a statement on something you do _not_ do.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -961,13 +961,10 @@ get_page_from_l1e(
>  
>          switch ( l1f & PAGE_CACHE_ATTRS )
>          {
> -        case 0: /* WB */
> -            flip |= _PAGE_PWT | _PAGE_PCD;
> -            break;
> -        case _PAGE_PWT: /* WT */
> -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> -            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
> -            break;
> +        case _PAGE_WB:
> +        case _PAGE_WT:
> +        case _PAGE_WP:
> +            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
>          }

Please never drop "break" from case blocks, even if it's (at a given
point in time) the last in its switch(). That's a recipe for someone
else then forgetting to add it when another case block is added.

Jan

