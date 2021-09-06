Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55627401D60
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 17:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180035.326542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGAv-0002bO-Cf; Mon, 06 Sep 2021 15:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180035.326542; Mon, 06 Sep 2021 15:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGAv-0002Zb-9Y; Mon, 06 Sep 2021 15:04:45 +0000
Received: by outflank-mailman (input) for mailman id 180035;
 Mon, 06 Sep 2021 15:04:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNGAt-0002ZT-Cg
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 15:04:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97c3c93b-02ee-4ad9-9075-52bebe7f9dd2;
 Mon, 06 Sep 2021 15:04:42 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-pzqLZhm0Ora2kiQ_tWtLnQ-1; Mon, 06 Sep 2021 17:04:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 15:04:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 15:04:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 15:04:37 +0000
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
X-Inumbo-ID: 97c3c93b-02ee-4ad9-9075-52bebe7f9dd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630940681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNdZ6Cx7slUiIr3muINtSAbKCyL8zuOoHJm+tONX/9I=;
	b=PeiVHg+fd/Fkex+5eLSYxCmkND8DYrY/FS03vOhLrn7nKw02ZUdSqIQZYQBn5/XGIMGXCm
	B7F43D1CDhK687dWexGsvQDSpgGaIlkeWvZjj4T7B9vbX9OkclrEyLBDdsS7FvXdzMobQa
	5/MkWF0T3tg8CEJe5zoK0UmRwkvIHWQ=
X-MC-Unique: pzqLZhm0Ora2kiQ_tWtLnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd8VZxNT/agSyYAo64p3ultBMpBaZGyDLSDWifE1TJ+DLW/YJspKcqDGtxD47yIWu01jNDMd8nODMoZIYDv8zIklyTPEjq/wIN9pOPhzTmNCLiBKLBbrMAY6Bw5m8IUzq7xF/Z/nacR0356TKarZ9SuNL9/uJAbDlnE2qi1VtvApQoCLU2Q/Po0uXZEl5K4gax/qvZbXOc4n7zEEJpdyxGS105QSAPfnydVSM0WL+zWekaUd0o/wBZrgQ8EPN0BXqLoxgWBVy5p81Hoqgb76yN17AfTLq0t7wkCBVYmPLIp3pnfpw0yJHH7cZscvMJQTcwcrN8KEjMa1InfnT/hUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bNdZ6Cx7slUiIr3muINtSAbKCyL8zuOoHJm+tONX/9I=;
 b=CKssZ+W7EUToHwa/ywYAUUs/vQJIDcaza7LKbvqn8ZHhSZo7J8sxRZtJzKRZAUfXy3JoWDC0+F75pCADtL7SmawcKmCPgdRMCwspfi0RXrhHb8C6wIqRw91OuUTMt97I7IuZSCjlf/Os2duTsVifJFhlzMxZSMrleMW197Ng8NyMbf4voR3Ie+wY0WoEpxpplNLLydHPaCajr2V9Y0D05U0aZ7le5ncBRxxigo+PwQwYH6t6PwuwPJBiv8Gdm07kgumNI1P1ecTX/IoO0TDRCDwp6kSPSc8aE6c2XmRB9cj52TSd7uA9a4MFe/DnCyQYc7CGEjzF5RmsfRMCMIKuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 1/2] x86/cpuid: Expose NullSelectorClearsBase CPUID bit
 to guests
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Pu Wen <puwen@hygon.cn>, Andy Lutomirski <luto@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1630929059.git.jane.malalane@citrix.com>
 <239f7624f3ac3793993dc045d451079aa555b90d.1630929059.git.jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <203359a1-1f76-70f1-e314-0c65c4413361@suse.com>
Date: Mon, 6 Sep 2021 17:04:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <239f7624f3ac3793993dc045d451079aa555b90d.1630929059.git.jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08b92ff5-2072-44f9-4d29-08d97147a53b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480F9185CC8575B060E6E21B3D29@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jcSSGkWp18dNTu5c+s7GR1YSXcU7SpAu3LHqh3pqF2NMQzWxm2nuVeyh7nxpfhT/VMJF20QtxoJJV4+IwenZuzUkPuJdfm5nhVzJaD4m6ejaxUAsxsdkhLTi5BtTZtYVqBJ6rReNsEtMtuI1GyUSBojAuqm+w6EOYP9WVdahJbkwqMubPC3c6SfNyuX/5uOTdsv00JI1BB/q9d/yrh3x3o4duAZk6FkX7RbB4ohJg5nhbzSE8j5e6cfGq/K8b9ICEGmSYo5BQDQl9u6BQp8waQ1MQL3Vg22vixnobpNnfN1LPgkemkzTf7mWFBe7LobuaFucrjF5TzP70A7F38U9jVI4RPJFZWTn89BRN62rp4um1ZgNEul3MwFkduJke8pIgLEK6LNj8Zq6x4Rj3ACmryoRIP6Oqvsx0ZQgWuL+UW+EOnrbu/L5lSvshmVIJHSQ3hExgUKl/Lxo3GqqXfJ4S7g7Ip8sXeVhB4cg9ZVPjB189JApu5B9gDiJysDDyvtEPB4T9h/mmdWPS4XZvMT9qUygWjs82m3IH/4ZLDhzdf8iAYxNFBqgg/mCD5/HqAJ+2Xz2MHsIxE2X7zu/6Kq9kkSRsEX0qCJVPY/RIiuJHyW/Y5y9oehXggj769TBsE3Sp/6h+ihnkcfRnHIxYa/fufpmCY1X/1ZI/jbS2mpmk/q9WrAW3mdTTDzBOkIt1WWTeTVPK1ML+RoTvQm9gFdwMncMqBg1gKuRo6F8+ALaJdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(39860400002)(136003)(36756003)(8936002)(8676002)(16576012)(5660300002)(31696002)(38100700002)(54906003)(53546011)(66476007)(4744005)(66556008)(6486002)(86362001)(26005)(186003)(316002)(6916009)(956004)(4326008)(31686004)(2906002)(83380400001)(2616005)(66946007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czRiSmpkWC9PQm41WlZTUzlpR3h5aEpiZVlTUDdhRDhwTG4zdVFKUVppejVq?=
 =?utf-8?B?TDduaVRQbHJWVzBEa2hta0VodmV5RTZkc01jUFZMSmxnU1RmS3NFZmwrOENv?=
 =?utf-8?B?QWVacDNxUUFKTTFTbzhPM1c1MTNJak5IRVpoUDl2UTJnY0ZjTzQ3MXozTDlT?=
 =?utf-8?B?RWdqcWRGVFJYOWw5Tk1nUWo2bXVsd3ZiODlwU3VvcktwUkc0OFVLMEtWbDNS?=
 =?utf-8?B?ZVVDT2dwd202RThJdGh0SmpYWGxIb0VFM0V3cEcxdlhjRUNaamxvMlVpcytp?=
 =?utf-8?B?RmszTGpMb0ZpcFVzVnJSSm1ENERrZEtZMTJCSk9vVXJZQzNocWxUTkFSL3h1?=
 =?utf-8?B?LzBhSWZ2bHVFbDJlSTV5Znh0YUlqU1BTdllXdkNWM0QwdG93dDRwSjhSNmR5?=
 =?utf-8?B?M3lJeUQwMjdCSDFBWTVQWDgzWi8wZkkyQlo3VUlhMjdlcnQrRm45cE1QWFNn?=
 =?utf-8?B?OTJXMGVoMlBOTWVDUWF6SlFOcWVVTHU1eGNaMTZyYmI3S0cwaUJGR1lscjZW?=
 =?utf-8?B?RWIxVkxJazJVUDZWWVEzOTF6aTBKNEdvdmFwL1dSYWhyRGI0TWhDSXB2Q1FT?=
 =?utf-8?B?bmFzak91TW5wL1BSdUhCODVRZUVTS0NUU2xUeFlSSFBFeU9pQWlhaGU2SWNR?=
 =?utf-8?B?L1RyVTBEOGx0SzFFVFkxNytCRFlZOWRvYlE3MmE3N2wyT0J6NFloUnM2dk5u?=
 =?utf-8?B?WEE1NW9PUVhHQXdvRTNla2ZVUkRPTDlBaTBzSmxyT3V0K3U3WkI5eGZEWVAz?=
 =?utf-8?B?cnJ1aGpoNnJKVUNRK3Nvblh0UmR1Tjc5QW1LbHcxdGtIeW94LzJRM1drWlVN?=
 =?utf-8?B?SWxNM0thQVA5Ny9leHFUVEFaeFNVY3BLTUZPUi84UG5pYStGbzBlSUswV3p2?=
 =?utf-8?B?bWJqUTllbHd3c3FYSmxqRW16cEZyZ1o4bjFKNm54b0dNS0NwVDdOT1BuYVdN?=
 =?utf-8?B?L1ZUWlcycDliRUNiY1BTU05uVVVBYSsveEZvN1dKRTFuRnZRUGpkdmRicURO?=
 =?utf-8?B?dFN0bW5kdGNEN2pIN0I1RDNKL1NEYmhuNXN2aWlKWW95aGlKNVlUbk9OaFF6?=
 =?utf-8?B?dTdBZTNoNVJqeXVicXZYZFJFZ2FYN05OWG9rZjNLVDQrblVYYWI5aFl5Smcx?=
 =?utf-8?B?aVVZYmhOVmtIQ2g2ZHc3Y3dZSVVUeHVmUit2ZVZSYk5SUVFJYzJHQmVTNHhz?=
 =?utf-8?B?STVHamFtVUlEWDllUm16dkVGY25iem1YWHhsYk5lenhIVkRxT056OVFzcXVJ?=
 =?utf-8?B?UU9SQWtyWHF2WksvZVlXSHdMaGVoaHMzS0FIMU9kdXdFMUpEUk9KbVdZcllq?=
 =?utf-8?B?NFB3RU8yYzFuTVQ5R3ZQbm9rYjB3NkgvMGlXbmtiNkZjNE4vcmJ1dERHSkJ6?=
 =?utf-8?B?c0pjbHR4OTg4eTR2bXJ0OTJ3NGVTVXFmTVZTWTV1YTZuSVNRQjFoY1RkWlFH?=
 =?utf-8?B?VFJEVUdSMDc4VThwSUxWVTBib0ZvdGE1NTNtaDdmZUF2TkYyZnN3Yko5NUl1?=
 =?utf-8?B?UzJwY255ZEVyZU1pVTFTanBrNm1oWWt3dmxNUlR3YzNHQ1lOTlc5UWpPM1dw?=
 =?utf-8?B?Y0RyU1dHaHRvTzZNdFhzNDlNbkY4d2NCUHo5cUh6elRHcXRwTk5mWGd2RTNj?=
 =?utf-8?B?M2Ntc0h2WklPaEt1YVJXWG1HVE81bGxXaWF6Vm5qcGdlOE8yK0pLV0JLSkN3?=
 =?utf-8?B?TjhYbnFwUE5US0N0cEluaGFZSmtjbUpJL2dyOE51b0UrSXpkL05ON0o3VzMw?=
 =?utf-8?Q?QMtA1UU/I0BduqEg838FE1w/QFr9ENloHIyRAyf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b92ff5-2072-44f9-4d29-08d97147a53b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 15:04:37.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpTkiRznDRwpQnuMzQHo1QyrMfm/lyaj2LJ/rXetqy4y8YWWimaE4yCSO6OphzSsJtv7p14qvVxpV2AiASwG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 06.09.2021 14:00, Jane Malalane wrote:
> AMD Zen3 adds the NullSelectorClearsBase bit to indicate that loading
> a NULL segment selector zeroes the base and limit fields, as well as
> just attributes.
> 
> Expose bit to all guests.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


