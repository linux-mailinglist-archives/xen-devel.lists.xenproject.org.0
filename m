Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30202B7A6B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29660.59247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJol-0007DF-K1; Wed, 18 Nov 2020 09:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29660.59247; Wed, 18 Nov 2020 09:31:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJol-0007Cq-GB; Wed, 18 Nov 2020 09:31:59 +0000
Received: by outflank-mailman (input) for mailman id 29660;
 Wed, 18 Nov 2020 09:31:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kfJok-0007Cl-NR
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:31:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d8e474f-826e-43ad-93a1-e649ea5a5cf7;
 Wed, 18 Nov 2020 09:31:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kfJok-0007Cl-NR
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:31:58 +0000
X-Inumbo-ID: 6d8e474f-826e-43ad-93a1-e649ea5a5cf7
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6d8e474f-826e-43ad-93a1-e649ea5a5cf7;
	Wed, 18 Nov 2020 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605691917;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t0zAXLZnc0Gl30pwDAXz1VrhzusxlosKE+oSLWR6ruE=;
  b=L9lUITGbIcbfaTxdbKasr+NDqndWucDtsvgahwQ0ftKJHjKenocnimuv
   O973FkNu9d4RG9bOGdrn5Zl9lhE54BrRQUAyvnModvGfQ+KmPP23oO4Kl
   yzY0hz7zNDUM7A0SjpgdIFn441TkDe6HiKvxTWrNuaGgQnTrin9gsKJ6x
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FRg8CvNcHdcJXOZczSlcz6tR7j7LJ8niMNJLZpqtJTHp+kaZuuyG8Jo2ZNhkRfeRPRJQdMVt/p
 zCwv+B82ydhBax8tTmZWNJ4WBEDfRh4E3fh1/WDOYNMg9A4B+bjQu7zzsxuYYXlRKGj/+TyDbJ
 CK1Ne84MJVdtsQdEfAkWGOxpKUtnzwn+xNOyLjbjECQilQnh/Rb0JxXCuvj8ZgLPLXBKHUZ8Hq
 jDJn27dt7GY9M5nfnsToGegHfI8WjW6cz5QwMk4PG5wvFKz+hMldgUD+ssAikBh/e+8iTokQPP
 02o=
X-SBRS: None
X-MesageID: 31428971
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31428971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/K1kP/j2sUa1/fwfQP/s9wm0TnUhezZx0yQKmUh4xby6W/VQwyGXMkquX+3KTm311gnuJ6jyyk3Xx6AAh4AZVuB6w3fbES1GtSuZuOFq0YkNED+Wa7ZsYanljzYNvsalBHh7ty+TF4zIFzE+txHH4/6UN4VvLYfNV1kAde5tNNKFwyt/aQ/6VOfM9NaFytkEZV2zZ/zZtvs2jCgzzuxOQkw2KiCh+Sep8TRJV/ZN6W7siikYFt+OLSIWR+xK151hWUObL76fpO77Bv4MC74AskYa/wvs168YjVKskwAqRhd1TF99y4xKC+Yo/f2xwxdrja3J2IBqUF5Gp6soLTw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh+DD3GMiZ41hDqyn5oTzk8Apb2C0EIQCg/syawI7YE=;
 b=N+Q5Bbi710y2VuNlM7JAhgtuI0tuHNR31SnacbvFvSnzgl1IOOI+tsY/Wol5HEgIE/s2xqHCncHACyYP0za1BA4SgdCbTmG7wWzJhgTeBrZesnRRdvHP5vhcvk4fEZx6addV9jh/94BbU8klzQahiNSbUKgDVsvTAKNUlJgYHtZvO+B3ZBgsssk+aFXd3lZFln9oFQ3QAfpDS94xHZy4RRpXAxayV8qjV4U5u/LN/vjsFM1546g+6+8B6830fOwfBMA5VkVTbIk5LNyqHCPD2ZQCS9mv6c3HyZtaoH0Wn0fA7ebIvdWIpoQZ5XPAswLCAMd1yM+PJ92eMaxjjSg/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh+DD3GMiZ41hDqyn5oTzk8Apb2C0EIQCg/syawI7YE=;
 b=Q/sCzpcNGNZAfEjich9vMuRs2cGDt9LMZfvlmMj9fma8BU+P+Qhb4u1hZ+kKEs3q8cSbK/ec19dig3hXJ7ZEvWpXK3XfQW2q0m0Cp+CsLr9gTO4j6zb7gtroYouPIxgoz0vXL/Qjw8HDV/mOFQ7ZRgdktkTN3tg81iIxXrrGpZM=
Date: Wed, 18 Nov 2020 10:31:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
Message-ID: <20201118093148.fzm2ibxcjopgruui@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
X-ClientProxiedBy: LO2P265CA0413.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a04bdca-7076-40ef-d6c5-08d88ba4c8eb
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3370248FD436987E796703948FE10@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NQLI4knEN7LlkA0ICRAxnQK5gWCd4i+khVqmoug6ncz7aNYCMLvUskbXFxTD+kY/lGhlVam7y4vacOkTURcPHgET+8MTYFVaKMIPX9P8zbazTW0OdYJVBES9CNCJnG3v+A6QAMYyrJaotZT3IMo2pLo1lxuQ2EfFl4kGgfxaCgpEz2dgTFqlziXI8TQM5z6cSMT5UT8ND1lD2KbPpxY1CX8dm/9h2gYTxQsqzprS1FpHlUuJ4A63gcRQtn6K3N8oye9jedsTU//wf57lD0Q29bbs3GOFdbthu33bnctgH2W0jSe9hxipoRPRY4fe0nsoVnPivj2992PJP+rT4I08pxhjiSKgjTRBmnSm9ZZwfez8i+vhQz4+fqJSPadJNbV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(136003)(396003)(39850400004)(1076003)(6916009)(8936002)(4326008)(85182001)(8676002)(4744005)(186003)(54906003)(16526019)(6486002)(956004)(9686003)(26005)(66946007)(66556008)(66476007)(5660300002)(478600001)(6496006)(6666004)(316002)(33716001)(2906002)(86362001)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3n6TvCeoOySsiInNVuCrLu66mDExi9I4TqJBwUDd1COcVOvgt3WyH2BCtFeFWVB4fbH9KGPVHobUVoz1Pw3wEVbFe6gItW92CG7pOdPyD3QyuRwhLN3Sku80JCU0BYuplKLx3+paT8ROlswwPcWIFAEvlAR1Y+1n5dyBYy5tBgMyj04xzNJceNYfd7wDDEtlm2jmCdnAQ4X9MHGyLntDbVIh6gUukuDwjDk67UTRgud2GEpWO/IosF+PARzYKrZ1jB2Kxph8AgqoWQJoPSgecAkN7T+Akqx4gQU9G7iW4mYHFMOmLU/MT4yBCBIHc0/LZJuiQmVVWh2I3SxQSmAmlbCx1sUxhJwY6ETl9kQJZrl0Q5jv6xNu++ZbtTDvxO/Ss+XhSnIvv9gYBuaHe6P4851TwyH04lSuikW+EGNZIdtBsMyMC2Dk9zdey5H6cr+YfO8rroROMi9qPfZPTlC6CqSjpoGugdw1puq9JnD+Ns7HGMVVEiKUAbnkL3+X8HjvkZRXAy69aq8MbaK59yY9BxWhXuuR5WokwANjf9xldooJFbjjE66xPDBHDZzzzjVrU80l3AzGr0pMyHlArB+C0nYPkDqkvwIbzL68jYx1zi9jIwzdkSedtqvbKguJRTWW8xBswvyIfB5eiCEMRVBvYfA6jNsN5Qwekp5aJZkqs38ZtZioVq0SrwR7XhgX6+SPiB3VeK96CHW7DAWVoIsXagTNX9QtaMgp98I4GXnToa49MFO4Zcx5q97TJlc5WfHBjecimAfBkSHf41c9xinGvwozn3aJYDBojwTv8hN7WyEBLKCIhWbdPWJgHWnU8gvfgpia+PnZfo2j9NNnwoMjkqSGx9eDY5I0dHR4lsHyWJ6y+fl50sDkhL24KinWdNjAwVUEabVbcnLNTlBTro410g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a04bdca-7076-40ef-d6c5-08d88ba4c8eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 09:31:53.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbDiJbFi6LJ7ATCY1evc7w7EPf53F71QncAoYGLdwonlHv5uZmge7ULRB8ucJZKlJ8Ghzn/YmjfzmQnQnjFlcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Wed, Oct 28, 2020 at 10:24:53AM +0100, Jan Beulich wrote:
> Fair parts of the present handlers are identical; in fact
> nestedp2m_write_p2m_entry() lacks a call to p2m_entry_modify(). Move
> common parts right into write_p2m_entry(), splitting the hooks into a
> "pre" one (needed just by shadow code) and a "post" one.
> 
> For the common parts moved I think that the p2m_flush_nestedp2m() is,
> at least from an abstract perspective, also applicable in the shadow
> case. Hence it doesn't get a 3rd hook put in place.
> 
> The initial comment that was in hap_write_p2m_entry() gets dropped: Its
> placement was bogus, and looking back the the commit introducing it
> (dd6de3ab9985 "Implement Nested-on-Nested") I can't see either what use
> of a p2m it was meant to be associated with.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

