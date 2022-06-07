Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A353F605
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 08:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342839.567930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nySab-0001nr-PF; Tue, 07 Jun 2022 06:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342839.567930; Tue, 07 Jun 2022 06:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nySab-0001lP-LJ; Tue, 07 Jun 2022 06:21:17 +0000
Received: by outflank-mailman (input) for mailman id 342839;
 Tue, 07 Jun 2022 06:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nySaa-0001lI-7N
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 06:21:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083fd312-e62a-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 08:21:14 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-LBTpDmAoNtOpDGHiqVXJog-1; Tue, 07 Jun 2022 08:21:11 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3063.eurprd04.prod.outlook.com (2603:10a6:6:5::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.19; Tue, 7 Jun 2022 06:21:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 06:21:09 +0000
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
X-Inumbo-ID: 083fd312-e62a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654582874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBUU9tjmVFGmXSma0OP00HIuqU3SrVJmCUAbmMc5LX0=;
	b=KnpjeFU8e3gk1XM7hPiWW0nJGexTvm7UoP5SCrbq29tagAF+H+y6EnYRBTMdWjS2tZYdI/
	18at/tWlveTfGbKC2HpZ2Y20ikBNnBy6NPyu8tpdV9bMBy7r33TcECkgkcrvP3a6ObSsG1
	+ka3iHPhES4TjhPPFR59Bo6CLJMSz30=
X-MC-Unique: LBTpDmAoNtOpDGHiqVXJog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrHXvYJ/rFqVK0yvY+N/5UIVOiBCIGh88W292UUEO4/VimFRZ6AaDbIn4bcAb0oWjcnp5XmcPxt6+FDRq4wqFa+Yni8fPjiYR4m3Of9V2zuMnw8VziKhY6QOAY1m5LIxL5hg4kDFfcFcw5y0ZcT9AtgAx84V9Ms+LXWf9fI1nf96E0JX+9jOoFETlXX6Lghcx2gfU55TFT3UU00FC8ENmekH5xdE8dTw6l26nkt9lmv+tEQNTzByre2DVFxrIJD03sUPzsfO3gaWHmQ52ful2NhorBRGDMslHvacmuQ0lkvTueXTZmMSJAs2Gah0pUbvD9laGRtlsFW2pWyK8lqzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBUU9tjmVFGmXSma0OP00HIuqU3SrVJmCUAbmMc5LX0=;
 b=ZYTBSMtPcwAQMWZ+7kWY2uvjSfxoqQ7JgNN3wEGpiaN7jFIEXJTOTE1pWpXusSsBHermF+Gj/g33k43tVenKcsjZ8xdYyD1vOoEqpJUBi72gSel0mpM/kauFcoJr2U4jItq+aP3CaiQM80eQQbP9+A3cEI7lLFTsttMQLPFccTHpzh14fvXgIgeI1pCGS6NcOsS2JPeTmLFvSCMVYWRHN7RUwxw6lN160zaT9C4bqdN+SNEog4Dr5mTFfzxNA3eUObQrkTpehhbfUH0do1qnzBJD8Lkbx3Jng5Ut0I2JQzurWHnLeSJc7DUdgiSZdXuLjcfxK1mKZiI9ttCTJiMWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBUU9tjmVFGmXSma0OP00HIuqU3SrVJmCUAbmMc5LX0=;
 b=PQMcH6LX74pC8kbTMeneo4l2XNEelQpQp2bu6f+33qd3x4SSu/x14NIPzytIuWNHxAgrmcc+IcRS9tjIcW7ekaQcFA4Di2HvwAlaOSbUHLsG3LKYX+n8gNMhdaxFQwVXieMlBBnm3e/rrJjOEj81yZmUhep9COcQ2uBLgYO6oKsIAHxdipYCoUtefT3BhsFKukMWqH4bSslFktIbD6z6YYX+wnRA53XdVXbljGoVcXiCQ+xOF5d2kVcQ+xQANVn22tylP0lov/ZB8plV9s+jkrTLbdfmJj26si75D6JvatcUtSQ2lkLCHxx2711L5He6stDBi7e+jHO88mLctVPhtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf484a23-9478-5b1e-6f15-c8e335dab332@suse.com>
Date: Tue, 7 Jun 2022 08:21:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew.Cooper3@citrix.com
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, julien@xen.org,
 Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org,
 roberto.bagnara@bugseng.com
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
 <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0050.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67abe334-abdf-41c0-701c-08da484de993
X-MS-TrafficTypeDiagnostic: DB6PR04MB3063:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB30635DB34BC68E5947D98E6AB3A59@DB6PR04MB3063.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BFhhCXnZo4nxSzcJwSXC871YlpSojqzXl5MoYyXWwunkSN/mB4GBrdpA9LV+41g7Hglkd6qYt4MBV/ZlRyfCkvHiL5u+pJlnN24qmSO8q01DMOC6+3oVQz+ZlI5775le0q2wg5SEM99L7YdZVbtYoxhh+/kJith/q9y/KydBmE10wdqWb6DG6UG3swD8+zoR1XemzGpJ2+ytl3AQ6iPxPofKKgSVGnRImGnGAG7zaudVgEc+H3q8+BShIXzN7CsbQ1TgaGMOlcsZZh0gZqKnimCsUkGfZdifp5ZYz/j/dyiC6nuesDkv3823KeQhEuWa0GiRZHMUlh5APAc7QW/llj9Z5tzidzTRZCkrT9Vggf33WtVTSyOvwjfOuWyBQ5RWg4UwWga2KCJCJJZ5aPvgpWQn17Jbgi8Ddq02a3YgcyQcwc6mz5hUdvVuAEJLFX9tDEdL8XLIdwhPFO5QO++uz4VwwuHEytg4Bgl1UQ4r55zbH66fIlp4hQCP4V6HqrW82jCTWRFOC3dtjDlR1WQNRAY2zAH9gLlRpSWp5eLDLpD93argqfSuYUx7uwe0cQ1xRwz6ZG531rZPTGnPOuYhogAc9mRfofSRmYSKq/uSD+V/6ZuP7DGdOLWfT9iFUq+TlFwQ6aqa4V8fVnCp/G0iAMdIHwqTiUVev0l9G9zrXF4ypd6eyVpteAe+G1nV2nnRpRAb0fnu8orlNZ1+uNl0b6WXT5IPRc1IMFbEzlZY4sG1OlWk2tpk56bsJkZmnhrM4bC2gz4UAvU3Q+sSjKLG+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6506007)(53546011)(31696002)(6666004)(26005)(86362001)(2906002)(54906003)(38100700002)(36756003)(316002)(66946007)(66556008)(4326008)(66476007)(8676002)(4744005)(31686004)(6486002)(83380400001)(186003)(6512007)(508600001)(8936002)(5660300002)(7416002)(221023002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alMxQVZ2ckdaVWs4MGpXWGlTajJOZ3dIa2hEeGhWUkNaOFdiNnRNN29XbzJv?=
 =?utf-8?B?Z0NzZWlHaHZJbmJQWGtkM09ON3p3WTZRNUx0NGJtd2tJam1UOHlyNUNOc0Iw?=
 =?utf-8?B?V0VMRjlzZFVvTDJta2hMSGxYQ0lUS0NIOHlhL2ZMZGwvVkU1eWMyZ2s4Q3h1?=
 =?utf-8?B?bkk1YnBxSjhvKzIwcnM0VGdBOU1qR1JJWlZxbjFpRWd4L1JOMElGVkxlUk1Y?=
 =?utf-8?B?dG5wM01tQWYyRUY1M1dHNlgrdkh0UnR0VjRHODN6Q0srdFl5UUdLQUpBSFhR?=
 =?utf-8?B?U0tLZEY4OWJ2Wlk4dFoyN0hINXhNUGxHbDFwczdINTQyTElEdTlLQkw5MFdH?=
 =?utf-8?B?RnpPL2Y5NElxV1dVcGsxUXJpOHZDb1VQbVpXbEphaUt6NjBJUUtuLyttTE0v?=
 =?utf-8?B?RHlXOTBDSzVDa0JVWTlldndaRFY4ckZJWjRnTjA1MG9NUUJXTU5GUisvc0ls?=
 =?utf-8?B?NTYySDNQNUM0WFgzUjFqZk9RNy9YWXoxTnRnT3RRNUdEZ25WN05qa05ocXRK?=
 =?utf-8?B?d3JlYXg3SnVIS3NINFNwdGNralNPTml5MTFsMlRZZ1lGRzR2b1k3VnkvK2xn?=
 =?utf-8?B?RHNPZ0d0aHMxaTdTbE0vU1gyeGJYc2lNS2tja09XRnFBTjRESHdxcXdwLzYx?=
 =?utf-8?B?NEhnaWZYOG5FMEM0b1d6MXJhZEErbk5UNnhOK1crSmJySWM1N3NnRXlmajdn?=
 =?utf-8?B?aW0yS3NOZWhYNXN0ODdSOWt6SXJnMHZwWmRmZXhpRWloTGZRZWgvL0hCTDlS?=
 =?utf-8?B?VGg0bGtJYmFSTGtYOVNDYy91eUhCTWVwOUJSV3A3eWVyYXB1RTlEWFlpTFVo?=
 =?utf-8?B?ZEw3WTF6K0V4MGord25md1Nua1FhRFN2Z3U1dmgyUUNHQXRveGRrWGx3c21C?=
 =?utf-8?B?a0NYT1d4eWE1R3VPRk5QcXRSeHhvZ2hmZzg2eDdYSy9lZGlSbUszais2REJ3?=
 =?utf-8?B?TXBYU3ZKTndiZTFSRHVGbmN0L2xHRFkvQk9JbmIvQ0J2NG1PenVZQmtRb3FS?=
 =?utf-8?B?VlBMVDBFbklSQnBzQ0VNTUhONHVmY25NM3I5UDg0dnpvd2l3a016cytjMVVt?=
 =?utf-8?B?YzlxaXgzZUlSWkYrZU92UDQzSXg2RlRFT08zOTEzclUxZEZlaEtNN1ZWWVhj?=
 =?utf-8?B?NFcwaldpVHFpenpkTnp1anpkSjhmbUZrejVyU2FaeVE4bEZwOVNYNkw2a0tP?=
 =?utf-8?B?dnEwakFKUUhNYkpqTmQ0YTVtdDdmT0dpRWE4ckNaZ3orTlpIVHU2MUhFcTZs?=
 =?utf-8?B?bXhZQ1ZDOWMvOFNhZkxra01IY0FUN3JWeFBIaUJzeEVJdUJFckIwMDN0dHpX?=
 =?utf-8?B?QldURmlTcy9HTGU0dHlTQ1dLTXZNckI2em4yY21kR2FocERJeDd2dnJyaEF3?=
 =?utf-8?B?UEVJQVFxSXkxSHllcDI5Wlpaa1FucXF4bUU1S0s5dXZiRm94cngrQjBwVnJx?=
 =?utf-8?B?aXRzTTdsTlU5T0RQNEdiUmhLeTlzYmJtTWwrMGVoMGtSa0w3ZU9GbDREbFRk?=
 =?utf-8?B?RTMvM3ROcnpoNUpnVXVYaC9IZWN2eW5acGZTZUFxMTQ0TUMwemx0OGUxeUUr?=
 =?utf-8?B?M3g1ayt3Qld5UU9tMWo3MERZdldkUjVmMzdZcmx5SXpWRWErTDQrWTFHc2Jx?=
 =?utf-8?B?VXFSVjhlcmpPRk8rMEF4cmVpMExoL0JkaUJLZjhDdm15Qk40MnNsclR4MW9I?=
 =?utf-8?B?NVJHTmdjTkJPOGRoT1BHZXU5dFlvcjRoeERpd2FmbGlyQ04vblY2NVlJRUlV?=
 =?utf-8?B?bjQ1WWhzQlg0Yys5MkF2RDdQWk16Mm9wL3J4T1dUUnV0Z2dUQ1phUzQ4Ukth?=
 =?utf-8?B?bEtqUnZKOHJ4bThMK09KNUw0dHRHK09KbnRLcEdld24xaCtEV2hiamVCbVJw?=
 =?utf-8?B?ZmFsZzluN0hYbWFNbXZsSEx0N3RaSGJxc3Zrc0Joa1VzMDVYTnE0eDk3RC83?=
 =?utf-8?B?QmRBbHlCeEdLOTVlSXBrSmhyOUFBa29UZGJacDhObm9rOVJLL2xKK1R0UERY?=
 =?utf-8?B?VXlHc2x5TnhwM0poZjRoSUx1ejh6ZkpnQnBFU1FGK3BhL2hRV3ZSRFJBK2Iy?=
 =?utf-8?B?Q1NaZEFzWms2QmVvNit4L2JHcGVKa1dpYmI0eE1SUTg1TFlPdDVzUUY3azRE?=
 =?utf-8?B?dU51dnJmWmdHK1JxTmk1bC8zSHM2VUNjNWVXTFREY2VlbVl3ZEoybVM0TG5j?=
 =?utf-8?B?MC9HcEs4aU9uU1dqSlJ5TmF5VmFDWjNaVHJ3VlZDTVVtSjhsTUZuUW1KZ3JX?=
 =?utf-8?B?cnB1dS8wSkZHbXlCNWVJRnJIb3JacGdYb3ZxSXBjeStWVnJhZXdCOGtRZVg4?=
 =?utf-8?B?YTVaUVE4VkZjMmlQVjk1cUdSZXFXM1M3VEtEZWdzZHFiK3FydmF2UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67abe334-abdf-41c0-701c-08da484de993
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 06:21:09.6969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZUyOY2pfXy2srQJrBNV+DJflNfqZS2Rbglf0+FxHxcyTWJ8mvxrltIwSioXZchoTM+V906nOA0zbcuXDDGqDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3063

On 07.06.2022 04:17, Stefano Stabellini wrote:
> # Rule 9.4 "An element of an object shall not be initialized more than once"
> 
> Andrew was noting that "There's one pattern using range syntax to set a
> default where this rule would be violated, but the code is far cleaner
> to read."

I'm actually not sure we have such uses, as I seem to vaguely recall clang
warning about them. Off the top of your head, do you know of an instance,
Andrew?

Jan

> Range initializers is a GCC extension not part of the C standard. It is
> not considered by the MISRA rule. The MISRA rule seems focused on
> preveting accidental double-initializations (by copy/pasting errors for
> instance) which is fair.
> 
> So I think we should be OK here and we need to clarify our usage of
> range initializers. What we do or don't do with range initializer should
> be a separate discussion I think.
> 


